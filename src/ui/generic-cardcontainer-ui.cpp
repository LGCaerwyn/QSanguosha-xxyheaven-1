#include "generic-cardcontainer-ui.h"
#include <QParallelAnimationGroup>
#include <qpropertyanimation.h>
#include <QGraphicsSceneMouseEvent>
#include <QGraphicsProxyWidget>
#include <QGraphicsColorizeEffect>
#include <qpushbutton.h>
#include <qtextdocument.h>
#include <qmenu.h>
#include <qlabel.h>
#include "engine.h"
#include "standard.h"
#include "clientplayer.h"
#include "roomscene.h"
#include "graphicspixmaphoveritem.h"

using namespace QSanProtocol;

QList<CardItem *> GenericCardContainer::cloneCardItems(QList<int> card_ids)
{
    return _createCards(card_ids);
}

QList<CardItem *> GenericCardContainer::_createCards(QList<int> card_ids)
{
    QList<CardItem *> result;
    foreach (int card_id, card_ids) {
        CardItem *item = _createCard(card_id);
        result.append(item);
    }
    return result;
}

CardItem *GenericCardContainer::_createCard(int card_id)
{
    const Card *card = Sanguosha->getCard(card_id);
    CardItem *item = new CardItem(card);
    item->setOpacity(0.0);
    item->setParentItem(this);
    return item;
}

void GenericCardContainer::_destroyCard()
{
    CardItem *card = (CardItem *)sender();
    card->setVisible(false);
    card->deleteLater();
}

bool GenericCardContainer::_horizontalPosLessThan(const CardItem *card1, const CardItem *card2)
{
    return (card1->x() < card2->x());
}

void GenericCardContainer::_disperseCards(QList<CardItem *> &cards, QRectF fillRegion,
    Qt::Alignment align, bool useHomePos, bool keepOrder, int index)
{
    int numCards = cards.size();
    if (numCards == 0) return;
    if (!keepOrder) qSort(cards.begin(), cards.end(), GenericCardContainer::_horizontalPosLessThan);
    double maxWidth = fillRegion.width();
    int cardWidth = G_COMMON_LAYOUT.m_cardNormalWidth;
    double step = qMin((double)cardWidth, (maxWidth - cardWidth) / (numCards - 1));
    align &= Qt::AlignHorizontal_Mask;
    for (int i = 0; i < numCards; i++) {
        CardItem *card = cards[i];
        double newX = 0;
        if (align == Qt::AlignHCenter)
            newX = fillRegion.center().x() + step * (i - (numCards - 1) / 2.0);
        else if (align == Qt::AlignLeft) {
            newX = fillRegion.left() + card->boundingRect().width() / 2.0;

            if (i > index && index >= 0)
                newX = newX + step * (i - 1) + cardWidth;
            else
                newX = newX + step * i;

        } else if (align == Qt::AlignRight)
            newX = fillRegion.right() + step * (i - numCards) + card->boundingRect().width() / 2.0;
        else
            continue;
        QPointF newPos = QPointF(newX, fillRegion.center().y());
        if (useHomePos)
            card->setHomePos(newPos);
        else
            card->setPos(newPos);
        card->setZValue(_m_highestZ++);
    }
}

void GenericCardContainer::_disperseCards(QList<CardItem *> &cards, QPointF center, bool useHomePos)
{
    int numCards = cards.size();
    if (numCards == 0) return;
    int cardWidth = G_COMMON_LAYOUT.m_cardNormalWidth;
    double step = (double)cardWidth*9.0/20.0;
    for (int i = 0; i < numCards; i++) {
        CardItem *card = cards[i];
        double newX = center.x() + step * (i - (numCards - 1) / 2.0);
        QPointF newPos = QPointF(newX, center.y());
        if (useHomePos)
            card->setHomePos(newPos);
        else
            card->setPos(newPos);
        card->setZValue(_m_highestZ++);
    }
}

void GenericCardContainer::onAnimationFinished()
{
    QParallelAnimationGroup *animation = qobject_cast<QParallelAnimationGroup *>(sender());
    if (animation) {
        while (animation->animationCount() > 0)
            animation->takeAnimation(0);
        animation->deleteLater();
    }
}

void GenericCardContainer::_doUpdate()
{
    update();
}

void GenericCardContainer::_playMoveCardsAnimation(QList<CardItem *> &cards, bool destroyCards, bool smoothTransition, int duration)
{
    QParallelAnimationGroup *animation = new QParallelAnimationGroup;
    foreach (CardItem *card_item, cards) {
        if (destroyCards)
            connect(card_item, SIGNAL(movement_animation_finished()), this, SLOT(_destroyCard()));
        animation->addAnimation(card_item->getGoBackAnimation(true, -1, smoothTransition, duration));
    }

    connect(animation, SIGNAL(finished()), this, SLOT(_doUpdate()));
    connect(animation, SIGNAL(finished()), this, SLOT(onAnimationFinished()));
    animation->start();
}

void GenericCardContainer::addCardItems(QList<CardItem *> &card_items, const CardsMoveStruct &moveInfo)
{
    foreach (CardItem *card_item, card_items) {
        card_item->setPos(mapFromScene(card_item->scenePos()));
        card_item->setParentItem(this);
    }
    bool destroy = _addCardItems(card_items, moveInfo);
    int duration = Config.S_MOVE_CARD_ANIMATION_DURATION;
    bool smoothTransition = false;
    Player::Place to_place = moveInfo.to_place;
    if (to_place == Player::DiscardPile || to_place == Player::PlaceJudge
            || to_place == Player::DrawPile || to_place == Player::DrawPileBottom || to_place == Player::PlaceTable) {
        duration = 500;
        smoothTransition = true;
    }
    _playMoveCardsAnimation(card_items, destroy, smoothTransition, duration);
}

void PlayerCardContainer::_paintPixmap(QGraphicsPixmapItem *&item, const QRect &rect, const QString &key)
{
    _paintPixmap(item, rect, _getPixmap(key));
}

void PlayerCardContainer::_paintPixmap(QGraphicsPixmapItem *&item, const QRect &rect,
    const QString &key, QGraphicsItem *parent)
{
    _paintPixmap(item, rect, _getPixmap(key), parent);
}

void PlayerCardContainer::_paintPixmap(QGraphicsPixmapItem *&item, const QRect &rect, const QPixmap &pixmap)
{
    _paintPixmap(item, rect, pixmap, _m_groupMain);
}

QPixmap PlayerCardContainer::_getPixmap(const QString &key, const QString &sArg)
{
    Q_ASSERT(key.contains("%1"));
    if (key.contains("%2")) {
        QString rKey = key.arg(getResourceKeyName()).arg(sArg);

        if (G_ROOM_SKIN.isImageKeyDefined(rKey))
            return G_ROOM_SKIN.getPixmap(rKey); // first try "%1key%2 = ...", %1 = "photo", %2 = sArg

        rKey = key.arg(getResourceKeyName());
        return G_ROOM_SKIN.getPixmap(rKey, sArg); // then try "%1key = ..."
    } else {
        return G_ROOM_SKIN.getPixmap(key, sArg); // finally, try "key = ..."
    }
}

QPixmap PlayerCardContainer::_getPixmap(const QString &key)
{
    if (key.contains("%1") && G_ROOM_SKIN.isImageKeyDefined(key.arg(getResourceKeyName())))
        return G_ROOM_SKIN.getPixmap(key.arg(getResourceKeyName()));
    else return G_ROOM_SKIN.getPixmap(key);

}

void PlayerCardContainer::_paintPixmap(QGraphicsPixmapItem *&item, const QRect &rect,
    const QPixmap &pixmap, QGraphicsItem *parent)
{
    if (item == NULL) {
        item = new QGraphicsPixmapItem(parent);
        item->setTransformationMode(Qt::SmoothTransformation);
    }
    item->setPos(rect.x(), rect.y());
    if (pixmap.size() == rect.size())
        item->setPixmap(pixmap);
    else
        item->setPixmap(pixmap.scaled(rect.size(), Qt::IgnoreAspectRatio, Qt::SmoothTransformation));
    item->setParentItem(parent);
}

void PlayerCardContainer::_clearPixmap(QGraphicsPixmapItem *pixmap)
{
    QPixmap dummy;
    if (pixmap == NULL) return;
    pixmap->setPixmap(dummy);
    pixmap->hide();
}

void PlayerCardContainer::hideProgressBar()
{
    _m_progressBar->hide();
}

void PlayerCardContainer::showProgressBar(Countdown countdown, int max)
{
    _m_progressBar->setCountdown(countdown, max);
    _m_progressBar->show();
}

QPixmap PlayerCardContainer::getHeadAvatarIcon(const QString &generalName)
{
    const int avatarSize = m_player->getGeneral2() ? _m_layout->m_primaryAvatarSize : _m_layout->m_avatarSize;
    return G_ROOM_SKIN.getGeneralPixmap(generalName,
        (QSanRoomSkin::GeneralIconSize)avatarSize,
        m_player->getHeadSkinId());
}

QPixmap PlayerCardContainer::getDeputyAvatarIcon(const QString &generalName)
{
    const int avatarSize = _m_layout->m_smallAvatarSize;
    return G_ROOM_SKIN.getGeneralPixmap(generalName,
        (QSanRoomSkin::GeneralIconSize)avatarSize,
        m_player->getDeputySkinId());
}

void PlayerCardContainer::updateAvatar()
{
    if (_m_avatarIcon == NULL) {
        _m_avatarIcon = new GraphicsPixmapHoverItem(this, _getAvatarParent());
        _m_avatarIcon->setTransformationMode(Qt::SmoothTransformation);
    }

    const General *general = NULL;
    if (m_player) {
        general = m_player->getAvatarGeneral();
        _m_layout->m_screenNameFont.paintText(_m_screenNameItem, _m_layout->m_screenNameArea,
            Qt::AlignCenter, m_player->screenName());
    } else {
        _m_layout->m_screenNameFont.paintText(_m_screenNameItem, _m_layout->m_screenNameArea,
            Qt::AlignCenter, QString());
    }

    QGraphicsPixmapItem *avatarIconTmp = _m_avatarIcon;
    if (general != NULL) {
        _m_avatarArea->setToolTip(m_player->getSkillDescription());
        QString name = general->objectName();
        // for luboyan
        if (name == "luboyan" && m_player->isFemale())
            name = "luboyanf";
        QPixmap avatarIcon = getHeadAvatarIcon(name);

        _paintPixmap(avatarIconTmp, _m_layout->m_avatarArea, avatarIcon, _getAvatarParent());

        // this is just avatar general, perhaps game has not started yet.
        if (m_player->getGeneral() != NULL) {
            QString kingdom = m_player->getKingdom();
            _paintPixmap(_m_kingdomIcon, _m_layout->m_kingdomIconArea,
                G_ROOM_SKIN.getPixmap(QSanRoomSkin::S_SKIN_KEY_KINGDOM_ICON, kingdom), _getAvatarParent());
            QString keyKingdomColorMask = (inherits("Photo")) ? QSanRoomSkin::S_SKIN_KEY_KINGDOM_COLOR_MASK : QSanRoomSkin::S_SKIN_KEY_DASHBOARD_KINGDOM_COLOR_MASK;
            _paintPixmap(_m_kingdomColorMaskIcon, _m_layout->m_kingdomMaskArea,
                G_ROOM_SKIN.getPixmap(keyKingdomColorMask, kingdom), _getAvatarParent());
            _paintPixmap(_m_handCardBg, _m_layout->m_handCardArea,
                _getPixmap(QSanRoomSkin::S_SKIN_KEY_HANDCARDNUM, kingdom), _getAvatarParent());
            _m_layout->m_avatarNameFont.paintText(_m_avatarNameItem,
                _m_layout->m_avatarNameArea,
                Qt::AlignLeft | Qt::AlignJustify, general->getBriefName());
        } else {
            _paintPixmap(_m_handCardBg, _m_layout->m_handCardArea,
                _getPixmap(QSanRoomSkin::S_SKIN_KEY_HANDCARDNUM, QString(QSanRoomSkin::S_SKIN_KEY_DEFAULT_SECOND)),
                _getAvatarParent());
        }
    } else {
        _paintPixmap(avatarIconTmp, _m_layout->m_avatarArea,
            QSanRoomSkin::S_SKIN_KEY_BLANK_GENERAL, _getAvatarParent());
        _clearPixmap(_m_kingdomColorMaskIcon);
        _clearPixmap(_m_kingdomIcon);
        _paintPixmap(_m_handCardBg, _m_layout->m_handCardArea,
            _getPixmap(QSanRoomSkin::S_SKIN_KEY_HANDCARDNUM, QString(QSanRoomSkin::S_SKIN_KEY_DEFAULT_SECOND)),
            _getAvatarParent());
        _m_avatarArea->setToolTip(QString());
    }
    _m_avatarIcon->show();
    _adjustComponentZValues();
}

QPixmap PlayerCardContainer::paintByMask(QPixmap &source)
{
    QPixmap tmp = G_ROOM_SKIN.getPixmap(QSanRoomSkin::S_SKIN_KEY_GENERAL_CIRCLE_MASK, QString::number(_m_layout->m_circleImageSize));
    if (tmp.height() <= 1 && tmp.width() <= 1) return source;
    QPainter p(&tmp);
    p.setCompositionMode(QPainter::CompositionMode_SourceIn);
    p.drawPixmap(0, 0, _m_layout->m_smallAvatarArea.width(), _m_layout->m_smallAvatarArea.height(), source);
    return tmp;
}

const ClientPlayer *PlayerCardContainer::getPlayer() const
{
    if (m_player) return m_player;
    return NULL;
}

void PlayerCardContainer::updateSmallAvatar()
{
    if (_m_smallAvatarIcon == NULL) {
        _m_smallAvatarIcon = new GraphicsPixmapHoverItem(this, _getAvatarParent());
        _m_smallAvatarIcon->setTransformationMode(Qt::SmoothTransformation);
    }

    updateAvatar();
    const General *general = NULL;
    if (m_player) general = m_player->getGeneral2();
    QGraphicsPixmapItem *smallAvatarIconTmp = _m_smallAvatarIcon;
    if (general != NULL) {
        QPixmap smallAvatarIcon = G_ROOM_SKIN.getGeneralPixmap(general->objectName(), QSanRoomSkin::GeneralIconSize(_m_layout->m_smallAvatarSize));
        smallAvatarIcon = paintByMask(smallAvatarIcon);
        _paintPixmap(smallAvatarIconTmp, _m_layout->m_smallAvatarArea,
            smallAvatarIcon, _getAvatarParent());
        _paintPixmap(_m_circleItem, _m_layout->m_circleArea,
            QString(QSanRoomSkin::S_SKIN_KEY_GENERAL_CIRCLE_IMAGE).arg(_m_layout->m_circleImageSize),
            _getAvatarParent());
        _m_smallAvatarArea->setToolTip(m_player->getSkillDescription());
        QString name = Sanguosha->translate("&" + general->objectName());
        if (name.startsWith("&"))
            name = Sanguosha->translate(general->objectName());
        _m_layout->m_smallAvatarNameFont.paintText(_m_smallAvatarNameItem,
            _m_layout->m_smallAvatarNameArea,
            Qt::AlignLeft | Qt::AlignJustify, name);
        _m_smallAvatarIcon->show();
    } else {
        _clearPixmap(smallAvatarIconTmp);
        _clearPixmap(_m_circleItem);
        _m_layout->m_smallAvatarNameFont.paintText(_m_smallAvatarNameItem,
            _m_layout->m_smallAvatarNameArea,
            Qt::AlignLeft | Qt::AlignJustify, QString());
        _m_smallAvatarArea->setToolTip(QString());
    }
    _adjustComponentZValues();
}

void PlayerCardContainer::updatePhase()
{
    if (!m_player || !m_player->isAlive())
        _clearPixmap(_m_phaseIcon);
    else if (m_player->getPhase() != Player::NotActive) {
        if (m_player->getPhase() == Player::PhaseNone)
            return;
        int index = static_cast<int>(m_player->getPhase());
        QRect phaseArea = _m_layout->m_phaseArea.getTranslatedRect(_getPhaseParent()->boundingRect().toRect());
        _paintPixmap(_m_phaseIcon, phaseArea,
            _getPixmap(QSanRoomSkin::S_SKIN_KEY_PHASE, QString::number(index)),
            _getPhaseParent());
        _m_phaseIcon->show();
    } else {
        if (_m_progressBar) _m_progressBar->hide();
        if (_m_phaseIcon) _m_phaseIcon->hide();
    }
}

void PlayerCardContainer::updateHp()
{
    Q_ASSERT(_m_hpBox && _m_saveMeIcon && m_player);
    _m_hpBox->setHp(m_player->getHp());
    _m_hpBox->setMaxHp(m_player->getMaxHp());
    _m_hpBox->update();
    if (m_player->getHp() > 0 || m_player->getMaxHp() == 0)
        _m_saveMeIcon->setVisible(false);
}
/*
static bool CompareByNumber(const Card *card1, const Card *card2)
{
    return card1->getNumber() < card2->getNumber();
}
*/
void PlayerCardContainer::updatePile(const QString &pile_name)
{
    ClientPlayer *player = (ClientPlayer *)sender();
    if (!player)
        player = m_player;
    if (!player) return;

    const QList<int> &pile = player->getPile(pile_name);
    int num = pile.size();
    if (pile_name == "wooden_ox") {
        CardItem *equip = _m_equipCards[4];
        if (equip == NULL) return;
        const EquipCard *equip_card = qobject_cast<const EquipCard *>(equip->getCard()->getRealCard());
        QPixmap pixmap = _getEquipPixmap(equip_card, false);
        _m_equipLabel[4]->setPixmap(pixmap);
        return;
    }

    QString shownpilename = RoomSceneInstance->getCurrentShownPileName();
    if (!shownpilename.isEmpty() && shownpilename == pile_name)
        hidePile();

	int new_length;
    if (num == 0) {
        if (_m_privatePiles.contains(pile_name)) {
            delete _m_privatePiles[pile_name];
            _m_privatePiles[pile_name] = NULL;
            _m_privatePiles.remove(pile_name);
        }
    } else {
        QPushButton *button;
        if (!_m_privatePiles.contains(pile_name)) {
            button = new QPushButton;
            button->setObjectName(pile_name);
            button->setProperty("private_pile", "true");
            button->setStyleSheet("background-color:#444444");
            QGraphicsProxyWidget *button_widget = new QGraphicsProxyWidget(_getPileParent());
            button_widget->setObjectName(pile_name);
            button_widget->setWidget(button);
            _m_privatePiles[pile_name] = button_widget;
        } else
            button = (QPushButton *)(_m_privatePiles[pile_name]->widget());

        QString text = Sanguosha->translate(pile_name);
        if (num > 0)
            text.append(QString("[%1]").arg(num));
        button->setText(text);

		QFontMetrics fontMetrics(button->font());
		new_length = fontMetrics.width(text) + 2;

        disconnect(button, &QPushButton::pressed, this, &PlayerCardContainer::showPile);
        connect(button, &QPushButton::pressed, this, &PlayerCardContainer::showPile);

        disconnect(button, &QPushButton::released, this, &PlayerCardContainer::hidePile);
        connect(button, &QPushButton::released, this, &PlayerCardContainer::hidePile);
    }

    QPoint start = _m_layout->m_privatePileStartPos;
    QPoint step = _m_layout->m_privatePileStep;
    QSize size = _m_layout->m_privatePileButtonSize;
    QList<QGraphicsProxyWidget *> widgets = _m_privatePiles.values();
    QPoint coordinate = start;

    for (int i = widgets.length()-1; i >= 0; i--) {
        QGraphicsProxyWidget *widget = widgets[i];
		if (widget->objectName() == pile_name)
            widget->resize(QSize(new_length, size.height()));
		if (coordinate.x() + widget->size().width() > 142)
			coordinate = QPoint(start.x(), coordinate.y() + step.y() + size.height());
        widget->setPos(coordinate);
        coordinate += QPoint(widget->size().width() + step.x(), 0);
    }
}

void PlayerCardContainer::updateCount(const QString &pile_name, int value)
{
    ClientPlayer *player = (ClientPlayer *)sender();
    if (!player)
        player = m_player;
    if (!player) return;

	int new_length;
    if (pile_name != "shixie_distance" && pile_name != "xinxianying_maxcards" && value == 0) {
        if (_m_privatePiles.contains(pile_name)) {
            delete _m_privatePiles[pile_name];
            _m_privatePiles[pile_name] = NULL;
            _m_privatePiles.remove(pile_name);
        }
    } else {
		// create a new pile if necessary
        QPushButton *button;
	    if (!_m_privatePiles.contains(pile_name)) {
			button = new QPushButton;
            button->setObjectName(pile_name);
			button->setProperty("private_pile", "true");
            button->setStyleSheet("background-color:#444444");
			QGraphicsProxyWidget *button_widget = new QGraphicsProxyWidget(_getPileParent());
			button_widget->setObjectName(pile_name);
			button_widget->setWidget(button);
			_m_privatePiles[pile_name] = button_widget;
		} else
			button = (QPushButton *)(_m_privatePiles[pile_name]->widget());

		QString text = Sanguosha->translate(pile_name);
		if (pile_name == "shixie_distance") {
            text.prepend(QString("["));
            if (value >= 0)
                text.append(QString("+%1]").arg(value));
			else
                text.append(QString("%1]").arg(value));
        } else if (pile_name == "xinxianying_maxcards") {
            text.prepend(QString("["));
            if (value >= 0)
                text.append(QString("+%1]").arg(value));
            else
                text.append(QString("%1]").arg(value));
        } else
			text.append(QString("[%1]").arg(value));
		
		QFontMetrics fontMetrics(button->font());
		new_length = fontMetrics.width(text) + 2;
		button->setText(text);
		button->setMenu(NULL);

        if (pile_name == "huashen" && Self == player) {
            disconnect(button, &QPushButton::pressed, this, &PlayerCardContainer::showPile);
            connect(button, &QPushButton::pressed, this, &PlayerCardContainer::showPile);

            disconnect(button, &QPushButton::released, this, &PlayerCardContainer::hidePile);
            connect(button, &QPushButton::released, this, &PlayerCardContainer::hidePile);
        }
    }

    QPoint start = _m_layout->m_privatePileStartPos;
    QPoint step = _m_layout->m_privatePileStep;
    QSize size = _m_layout->m_privatePileButtonSize;
    QList<QGraphicsProxyWidget *> widgets = _m_privatePiles.values();
	QPoint coordinate = start;

    for (int i = widgets.length()-1; i >= 0; i--) {
        QGraphicsProxyWidget *widget = widgets[i];
		if (widget->objectName() == pile_name)
            widget->resize(QSize(new_length, size.height()));
		if (coordinate.x() + widget->size().width() > 142)
			coordinate = QPoint(start.x(), coordinate.y() + step.y() + size.height());
        widget->setPos(coordinate);
        coordinate += QPoint(widget->size().width() + step.x(), 0);
    }
}

void PlayerCardContainer::updateTip(const QString &pile_name, bool add_in)
{
    ClientPlayer *player = (ClientPlayer *)sender();
    if (!player)
        player = m_player;
    if (!player) return;

	int new_length;
    if (add_in) {
        QPushButton *button;
	    if (!_m_privatePiles.contains(pile_name)) {
			button = new QPushButton;
			button->setObjectName(pile_name);
			button->setProperty("private_pile", "true");
            button->setStyleSheet("background-color:#444444");
			QGraphicsProxyWidget *button_widget = new QGraphicsProxyWidget(_getPileParent());
			button_widget->setObjectName(pile_name);
			button_widget->setWidget(button);
			_m_privatePiles[pile_name] = button_widget;
		}

		QString text = Sanguosha->translate(pile_name);
		QFontMetrics fontMetrics(button->font());
		new_length = fontMetrics.width(text) + 2;
		button->setText(text);
    } else {
		if (_m_privatePiles.contains(pile_name)) {
            delete _m_privatePiles[pile_name];
            _m_privatePiles[pile_name] = NULL;
            _m_privatePiles.remove(pile_name);
        }
    }

    QPoint start = _m_layout->m_privatePileStartPos;
    QPoint step = _m_layout->m_privatePileStep;
    QSize size = _m_layout->m_privatePileButtonSize;
    QList<QGraphicsProxyWidget *> widgets = _m_privatePiles.values();
	QPoint coordinate = start;

    for (int i = widgets.length()-1; i >= 0; i--) {
        QGraphicsProxyWidget *widget = widgets[i];
		if (widget->objectName() == pile_name)
            widget->resize(QSize(new_length, size.height()));
		if (coordinate.x() + widget->size().width() > 142)
			coordinate = QPoint(start.x(), coordinate.y() + step.y() + size.height());
        widget->setPos(coordinate);
        coordinate += QPoint(widget->size().width() + step.x(), 0);
    }
}

void PlayerCardContainer::showPile()
{
    QPushButton *button = qobject_cast<QPushButton *>(sender());
    if (button) {
        const ClientPlayer *player = getPlayer();
        if (!player) return;
        QList<int> card_ids = player->getPile(button->objectName());
        if (button->objectName() == "huashen") RoomSceneInstance->showPile(card_ids, button->objectName(), player);
        if (card_ids.isEmpty() || card_ids.contains(-1)) return;
        RoomSceneInstance->showPile(card_ids, button->objectName(), player);
    }
}

void PlayerCardContainer::hidePile()
{
    RoomSceneInstance->hidePile();
}

void PlayerCardContainer::updateDrankState()
{
    if (m_player->getMark("drank") > 0)
        _m_avatarArea->setBrush(G_PHOTO_LAYOUT.m_drankMaskColor);
    else
        _m_avatarArea->setBrush(Qt::NoBrush);
}

void PlayerCardContainer::updateDuanchang()
{
    return;
}

void PlayerCardContainer::updateHandcardNum()
{
    int num = 0;
    if (m_player && m_player->getGeneral()) num = m_player->getHandcardNum();
    Q_ASSERT(num >= 0);
    QRect handCardArea = _m_layout->m_handCardArea;
    handCardArea.adjust(0,-4,0,-4);
    _m_layout->m_handCardFont.paintText(_m_handCardNumText, handCardArea,
        Qt::AlignCenter, QString::number(num));
    _m_handCardNumText->setVisible(true);
}

void PlayerCardContainer::updateMarks()
{
    if (!_m_markItem) return;
    QRect parentRect = _getMarkParent()->boundingRect().toRect();
    QSize markSize = _m_markItem->boundingRect().size().toSize();
    QRect newRect = _m_layout->m_markTextArea.getTranslatedRect(parentRect, markSize);
    if (_m_layout == &G_PHOTO_LAYOUT)
        _m_markItem->setPos(newRect.topLeft());
    else
        _m_markItem->setPos(newRect.left(), newRect.top() + newRect.height() / 2);
}

void PlayerCardContainer::_updateEquips()
{
    if (!m_player) return;
    bool has_treasure = (m_player->getTreasure() != NULL);
    for (int i = 0; i < S_EQUIP_AREA_LENGTH; i++) {
        CardItem *equip = _m_equipCards[i];
        if (equip != NULL) {
            const EquipCard *equip_card = qobject_cast<const EquipCard *>(equip->getCard()->getRealCard());
            QPixmap pixmap = _getEquipPixmap(equip_card, has_treasure);
            _m_equipRegions[i]->setWidget(NULL);
            _m_equipLabel[i] = new QLabel;
            _m_equipLabel[i]->setStyleSheet("QLabel { background-color: transparent; }");
            _m_equipLabel[i]->setPixmap(pixmap);
            _m_equipRegions[i]->setWidget(_m_equipLabel[i]);
        }

        if (has_treasure && i < 4 && i > 1) {
            _m_equipRegions[i]->setPos(_m_layout->m_horseAreas[i-2].topLeft());
        }else
            _m_equipRegions[i]->setPos(_m_layout->m_equipAreas[i].topLeft());
    }
}

void PlayerCardContainer::_updateHorses()
{
    QStringList area_names;
    area_names << "Weapon" << "Armor" << "DefensiveHorse" << "OffensiveHorse" << "Treasure";
    if (!m_player) return;
    bool has_treasure = (!m_player->canSetEquip(4));
    for (int i = 2; i < 4; i++) {
        CardItem *equip = _m_equipCards[i];
        if (equip != NULL) {
            const EquipCard *equip_card = qobject_cast<const EquipCard *>(equip->getCard()->getRealCard());
            QPixmap pixmap = _getEquipPixmap(equip_card, has_treasure);
            _m_equipLabel[i] = new QLabel;
            _m_equipLabel[i]->setStyleSheet("QLabel { background-color: transparent; }");
            _m_equipLabel[i]->setPixmap(pixmap);
            _m_equipRegions[i]->setWidget(_m_equipLabel[i]);
        } else if (m_player->getMark(area_names.at(i)+"Sealed") > 0) {
            QPixmap pixmap = _getSealEquipPixmap(area_names.at(i), has_treasure);
            _m_equipLabel[i] = new QLabel;
            _m_equipLabel[i]->setStyleSheet("QLabel { background-color: transparent; }");
            _m_equipLabel[i]->setPixmap(pixmap);
            _m_equipRegions[i]->setWidget(_m_equipLabel[i]);
        }

        if (has_treasure) {
            _m_equipRegions[i]->setPos(_m_layout->m_horseAreas[i-2].topLeft());
        }else
            _m_equipRegions[i]->setPos(_m_layout->m_equipAreas[i].topLeft());
    }
}

void PlayerCardContainer::refresh(bool)
{
    if (!m_player || !m_player->getGeneral() || !m_player->isAlive()) {
        _m_faceTurnedIcon->setVisible(false);
        _m_chainIcon->setVisible(false);
        _m_actionIcon->setVisible(false);
        _m_saveMeIcon->setVisible(false);
    } else if (m_player) {
        if (_m_faceTurnedIcon) _m_faceTurnedIcon->setVisible(!m_player->faceUp());
        if (_m_chainIcon) _m_chainIcon->setVisible(m_player->isChained());
        if (_m_actionIcon) _m_actionIcon->setVisible(m_player->hasFlag("actioned") || m_player->getMark("actionedM"));
        if (_m_deathIcon && !(ServerInfo.GameMode == "04_1v3" && m_player->getGeneralName() != "shenlvbu2" && m_player->getGeneralName() != "shenlvbu3"))
            _m_deathIcon->setVisible(m_player->isDead());
    }
    updateHandcardNum();
    _adjustComponentZValues();
}

void PlayerCardContainer::repaintAll()
{
    _m_avatarArea->setRect(_m_layout->m_avatarArea);
    _m_smallAvatarArea->setRect(_m_layout->m_smallAvatarArea);

    updateAvatar();
    updateSmallAvatar();
    updatePhase();
    updateMarks();
    _updateProgressBar();
    _updateDeathIcon();
    _updateEquips();
    updateDelayedTricks();

    if (_m_huashenAnimation != NULL)
        startHuaShen(_m_huashenGeneralName, _m_huashenSkillName);

    _paintPixmap(_m_faceTurnedIcon, _m_layout->m_avatarArea, QSanRoomSkin::S_SKIN_KEY_FACETURNEDMASK,
        _getAvatarParent());
    _paintPixmap(_m_chainIcon, _m_layout->m_chainedIconRegion, QSanRoomSkin::S_SKIN_KEY_CHAIN,
        _getAvatarParent());
    _paintPixmap(_m_saveMeIcon, _m_layout->m_saveMeIconRegion, QSanRoomSkin::S_SKIN_KEY_SAVE_ME_ICON,
        _getAvatarParent());
    _paintPixmap(_m_actionIcon, _m_layout->m_actionedIconRegion, QSanRoomSkin::S_SKIN_KEY_ACTIONED_ICON,
        _getAvatarParent());
    if (_m_seatItem != NULL)
        _paintPixmap(_m_seatItem, _m_layout->m_seatIconRegion,
        _getPixmap(QSanRoomSkin::S_SKIN_KEY_SEAT_NUMBER, QString::number(m_player->getRealSeat())),
        _getAvatarParent());
    if (_m_roleComboBox != NULL)
        _m_roleComboBox->setPos(_m_layout->m_roleComboBoxPos);

    _m_hpBox->setResourceName(getResourceKeyName());
    _m_hpBox->setIconSize(_m_layout->m_magatamaSize);
    _m_hpBox->setBackgroundVisible(_m_layout->m_magatamasBgVisible);
    _m_hpBox->setMagatamasSpacing(_m_layout->m_magatamasSpacing);
    _m_hpBox->setMagatamasOffset(_m_layout->m_magatamasOffset);
    _m_hpBox->setAnchorEnable(true);
    _m_hpBox->setAnchor(_m_layout->m_magatamasAnchor, _m_layout->m_magatamasAlign);
    _m_hpBox->setImageArea(_m_layout->m_magatamaImageArea);
    _m_hpBox->setNumberArea(_m_layout->m_magatamaNumberArea);
    _m_hpBox->update();

    _adjustComponentZValues();
    refresh();
}

void PlayerCardContainer::_createRoleComboBox()
{
    _m_roleComboBox = new RoleComboBox(_getRoleComboBoxParent());
}

void PlayerCardContainer::setPlayer(ClientPlayer *player)
{
    this->m_player = player;
    if (player) {
        connect(player, SIGNAL(general_changed()), this, SLOT(updateAvatar()));
        connect(player, SIGNAL(general2_changed()), this, SLOT(updateSmallAvatar()));
        connect(player, SIGNAL(kingdom_changed()), this, SLOT(updateAvatar()));
        connect(player, SIGNAL(state_changed()), this, SLOT(refresh()));
        connect(player, SIGNAL(phase_changed()), this, SLOT(updatePhase()));
        connect(player, SIGNAL(drank_changed()), this, SLOT(updateDrankState()));
        connect(player, SIGNAL(action_taken()), this, SLOT(refresh()));
        connect(player, SIGNAL(duanchang_invoked()), this, SLOT(updateDuanchang()));
        connect(player, SIGNAL(pile_changed(QString)), this, SLOT(updatePile(QString)));
		connect(player, SIGNAL(count_changed(QString, int)), this, SLOT(updateCount(QString, int)));
        connect(player, SIGNAL(tip_changed(QString, bool)), this, SLOT(updateTip(QString, bool)));
        connect(player, SIGNAL(role_changed(QString)), _m_roleComboBox, SLOT(fix(QString)));
        connect(player, SIGNAL(hp_changed()), this, SLOT(updateHp()));

        connect(player, SIGNAL(equiparea_sealed(QString)), this, SLOT(sealEquipArea(QString)));
        connect(player, SIGNAL(equiparea_unsealed(QString)), this, SLOT(unsealEquipArea(QString)));

        connect(player, SIGNAL(judgearea_sealed()), this, SLOT(sealJudgeArea()));
        connect(player, SIGNAL(judgearea_unsealed()), this, SLOT(unsealJudgeArea()));

        QTextDocument *textDoc = m_player->getMarkDoc();
        Q_ASSERT(_m_markItem);
        _m_markItem->setDocument(textDoc);
        connect(textDoc, SIGNAL(contentsChanged()), this, SLOT(updateMarks()));
        connect(player, &ClientPlayer::headSkinIdChanged, _m_avatarIcon, &GraphicsPixmapHoverItem::startChangeHeroSkinAnimation);
        connect(player, &ClientPlayer::deputySkinIdChanged, _m_smallAvatarIcon, &GraphicsPixmapHoverItem::startChangeHeroSkinAnimation);
    }
    updateAvatar();
    refresh();
}

QList<CardItem *> PlayerCardContainer::removeDelayedTricks(const QList<int> &cardIds)
{
    QList<CardItem *> result;
    foreach (int card_id, cardIds) {
        CardItem *item = CardItem::FindItem(_m_judgeCards, card_id);
        Q_ASSERT(item != NULL);
        item->show();
        int index = _m_judgeCards.indexOf(item);
        QRect start = _m_layout->m_delayedTrickFirstRegion;
        QPoint step = _m_layout->m_delayedTrickStep;
        start.translate(step * index);
        item->setOpacity(0.0);
        item->setPos(start.center());
        _m_judgeCards.removeAt(index);
        delete _m_judgeIcons.takeAt(index);
        result.append(item);
    }
    updateDelayedTricks();
    return result;
}

void PlayerCardContainer::updateDelayedTricks()
{
    for (int i = 0; i < _m_judgeIcons.size(); i++) {
        QGraphicsPixmapItem *item = _m_judgeIcons[i];
        QRect start = _m_layout->m_delayedTrickFirstRegion;
        QPoint step = _m_layout->m_delayedTrickStep;
        start.translate(step * i);
        item->setPos(start.topLeft());
    }
}

void PlayerCardContainer::addDelayedTricks(QList<CardItem *> &tricks)
{
    foreach (CardItem *trick, tricks) {
        //CardItem *trick = _createCard(old_trick->getId());
        QGraphicsPixmapItem *item = new QGraphicsPixmapItem(_getDelayedTrickParent());
        QRect start = _m_layout->m_delayedTrickFirstRegion;
        QPoint step = _m_layout->m_delayedTrickStep;
        start.translate(step * _m_judgeCards.size());
        _paintPixmap(item, start, G_ROOM_SKIN.getCardJudgeIconPixmap(trick->getCard()->objectName()));
        trick->setHomeOpacity(0.0);
        trick->setHomePos(start.center());
        const Card *card = Sanguosha->getEngineCard(trick->getCard()->getEffectiveId());
        QString toolTip = QString("<b>%1 [</b><img src='image/system/log/%2.png' height = 12/><b>%3]</b>")
            .arg(Sanguosha->translate(card->objectName()))
            .arg(card->getSuitString())
            .arg(card->getNumberString());
        item->setToolTip(toolTip);
        _m_judgeCards.append(trick);_m_judgeIcons.append(item);
    }
}

void PlayerCardContainer::sealJudgeArea()
{
    QGraphicsPixmapItem *item = new QGraphicsPixmapItem(_getDelayedTrickParent());
    QRect start = _m_layout->m_delayedTrickFirstRegion;
    _paintPixmap(item, start, G_ROOM_SKIN.getCardJudgeIconPixmap("JudgeAreaSealed"));
    item->setToolTip(Sanguosha->translate("sealed"));
    _m_judgeIcons.append(item);
}

void PlayerCardContainer::unsealJudgeArea()
{
    if (!_m_judgeIcons.isEmpty())
        delete _m_judgeIcons.takeFirst();
}

QPixmap PlayerCardContainer::_getEquipPixmap(const EquipCard *equip, bool has_treasure)
{
    bool narrow_equip = (has_treasure && equip->isKindOf("Horse"));
    const Card *realCard = Sanguosha->getEngineCard(equip->getEffectiveId());
    QSize icon_size = _m_layout->m_equipAreas[0].size();
    if (narrow_equip)
        icon_size = _m_layout->m_horseAreas[0].size();
    QPixmap equipIcon(icon_size);
    equipIcon.fill(Qt::transparent);
    QPainter painter(&equipIcon);
    // icon / background
    QRect imageArea = _m_layout->m_equipImageArea;
    if (narrow_equip)
        imageArea = _m_layout->m_horseImageArea;
    QString equip_icon = (narrow_equip) ? QSanRoomSkin::S_SKIN_KEY_HORSE_ICON : QSanRoomSkin::S_SKIN_KEY_EQUIP_ICON;
    painter.drawPixmap(imageArea, _getPixmap(equip_icon, equip->objectName()));
    // equip suit
    QRect suitArea = _m_layout->m_equipSuitArea;
    if (narrow_equip)
        suitArea = _m_layout->m_horseSuitArea;
    painter.drawPixmap(suitArea, G_ROOM_SKIN.getCardSuitPixmap(realCard->getSuit()));
    // equip point
    QRect pointArea = _m_layout->m_equipPointArea;
    if (narrow_equip)
        pointArea = _m_layout->m_horsePointArea;
    if (realCard->isRed()) {
        _m_layout->m_equipPointFontRed.paintText(&painter,
            pointArea,
            Qt::AlignLeft | Qt::AlignVCenter,
            realCard->getNumberString());
    } else {
        _m_layout->m_equipPointFontBlack.paintText(&painter,
            pointArea,
            Qt::AlignLeft | Qt::AlignVCenter,
            realCard->getNumberString());
    }
    // for wooden_ox
    QList<int> handpile = m_player->getPile(equip->objectName());
    if (handpile.size() > 0) {
        _m_layout->m_handPileFont.paintText(&painter, _m_layout->m_handPileArea,
            Qt::AlignLeft | Qt::AlignVCenter, QString::number(handpile.size()));
    }
    return equipIcon;
}

QPixmap PlayerCardContainer::_getSealEquipPixmap(const QString &area_name, bool has_treasure)
{
    bool narrow_equip = (has_treasure && (area_name.contains("Horse")));
    QSize icon_size = _m_layout->m_equipAreas[0].size();
    if (narrow_equip)
        icon_size = _m_layout->m_horseAreas[0].size();
    QPixmap equipIcon(icon_size);
    equipIcon.fill(Qt::transparent);
    QPainter painter(&equipIcon);
    // icon / background
    QRect imageArea = _m_layout->m_equipImageArea;
    if (narrow_equip)
        imageArea = _m_layout->m_horseImageArea;
    QString equip_icon = (narrow_equip) ? QSanRoomSkin::S_SKIN_KEY_HORSE_ICON : QSanRoomSkin::S_SKIN_KEY_EQUIP_ICON;
    painter.drawPixmap(imageArea, _getPixmap(equip_icon, area_name+"Sealed"));
    return equipIcon;
}

void PlayerCardContainer::setFloatingArea(QRect rect)
{
    _m_floatingAreaRect = rect;
    QPixmap dummy(rect.size());
    dummy.fill(Qt::transparent);
    _m_floatingArea->setPixmap(dummy);
    _m_floatingArea->setPos(rect.topLeft());
    if (_getPhaseParent() == _m_floatingArea) updatePhase();
    if (_getMarkParent() == _m_floatingArea) updateMarks();
    if (_getProgressBarParent() == _m_floatingArea) _updateProgressBar();
}

void PlayerCardContainer::sealEquipArea(const QString &area_name)
{
    QStringList area_names;
    area_names << "Weapon" << "Armor" << "DefensiveHorse" << "OffensiveHorse" << "Treasure";

    Q_ASSERT(area_names.contains(area_name));

    if (area_name == "Treasure")
         _updateHorses();

    int index = area_names.indexOf(area_name);
    QPixmap pixmap = _getSealEquipPixmap(area_name, (m_player && !m_player->canSetEquip(4)));
    _m_equipRegions[index]->setWidget(NULL);
    _m_equipLabel[index] = new QLabel;
    _m_equipLabel[index]->setStyleSheet("QLabel { background-color: transparent; }");
    _m_equipLabel[index]->setPixmap(pixmap);
    _m_equipRegions[index]->setWidget(_m_equipLabel[index]);
    _m_equipRegions[index]->setToolTip(Sanguosha->translate("sealed"));

    QRect rect = _m_layout->m_equipAreas[index];
    if (m_player && !m_player->canSetEquip(4) && area_name.contains("Horse"))
        rect = _m_layout->m_horseAreas[index-2];
    _m_equipRegions[index]->setPos(rect.topLeft());
    _m_equipRegions[index]->setOpacity(255);
    _m_equipAnim[index]->stop();
    _m_equipAnim[index]->clear();
    _m_equipRegions[index]->show();
}

void PlayerCardContainer::addEquips(QList<CardItem *> &equips)
{
    foreach (CardItem *equip, equips) {
        const EquipCard *equip_card = qobject_cast<const EquipCard *>(equip->getCard()->getRealCard());
        int index = (int)(equip_card->location());
        Q_ASSERT(_m_equipCards[index] == NULL);
        _m_equipCards[index] = equip;
        connect(equip, SIGNAL(mark_changed()), this, SLOT(_onEquipSelectChanged()));
        equip->setHomeOpacity(0.0);
        equip->setHomePos(_m_layout->m_equipAreas[index].center());
        if (equip_card->isKindOf("Treasure"))
            _updateHorses();
        _m_equipRegions[index]->setToolTip(equip_card->getDescription());
        QPixmap pixmap = _getEquipPixmap(equip_card, (m_player && m_player->getTreasure()));
        _m_equipRegions[index]->setWidget(NULL);
        _m_equipLabel[index] = new QLabel;
        _m_equipLabel[index]->setStyleSheet("QLabel { background-color: transparent; }");
        _m_equipLabel[index]->setPixmap(pixmap);
        _m_equipRegions[index]->setWidget(_m_equipLabel[index]);

        QRect rect = _m_layout->m_equipAreas[index];
        if (m_player && !m_player->canSetEquip(4) && equip_card->isKindOf("Horse"))
            rect = _m_layout->m_horseAreas[index-2];
        _mutexEquipAnim.lock();
        _m_equipRegions[index]->setPos(rect.topLeft() + QPoint(rect.width() / 2, 0));
        _m_equipRegions[index]->setOpacity(0);
        _m_equipRegions[index]->show();
        _m_equipAnim[index]->stop();
        _m_equipAnim[index]->clear();
        QPropertyAnimation *anim = new QPropertyAnimation(_m_equipRegions[index], "pos");
        anim->setEndValue(rect.topLeft());
        anim->setDuration(200);
        _m_equipAnim[index]->addAnimation(anim);
        connect(anim, SIGNAL(finished()), anim, SLOT(deleteLater()));
        anim = new QPropertyAnimation(_m_equipRegions[index], "opacity");
        anim->setEndValue(255);
        anim->setDuration(200);
        _m_equipAnim[index]->addAnimation(anim);
        connect(anim, SIGNAL(finished()), anim, SLOT(deleteLater()));
        _m_equipAnim[index]->start();
        _mutexEquipAnim.unlock();
        const Skill *skill = Sanguosha->getSkill(equip_card->objectName());
        if (skill == NULL) continue;
        emit add_equip_skill(skill, true);
    }
}

void PlayerCardContainer::unsealEquipArea(const QString &area_name)
{
    QStringList area_names;
    area_names << "Weapon" << "Armor" << "DefensiveHorse" << "OffensiveHorse" << "Treasure";
    Q_ASSERT(area_names.contains(area_name));
    int index = area_names.indexOf(area_name);
    _m_equipRegions[index]->hide();
    if (area_name == "Treasure")
        _updateHorses();
}

QList<CardItem *> PlayerCardContainer::removeEquips(const QList<int> &cardIds)
{
    QList<CardItem *> result;
    foreach (int card_id, cardIds) {
        const EquipCard *equip_card = qobject_cast<const EquipCard *>(Sanguosha->getEngineCard(card_id));
        if (!equip_card) continue;
        int index = (int)(equip_card->location());
        Q_ASSERT(_m_equipCards[index] != NULL);
        CardItem *equip = _m_equipCards[index];
        //equip->show();
        //equip->setHomeOpacity(0.0);
        //equip->setPos(_m_layout->m_equipAreas[index].center());
        equip->disconnect(this);
        QTimer::singleShot(2000, equip, SLOT(deleteLater()));
        CardItem *new_equip = _createCard(card_id);
        new_equip->setOpacity(0.0);
        new_equip->setPos(_m_layout->m_equipAreas[index].center());
        result.append(new_equip);
        _m_equipCards[index] = NULL;
        _mutexEquipAnim.lock();
        _m_equipAnim[index]->stop();
        _m_equipAnim[index]->clear();
        QPropertyAnimation *anim = new QPropertyAnimation(_m_equipRegions[index], "pos");
        QRect rect = _m_layout->m_equipAreas[index];
        if (m_player && m_player->getTreasure() && equip_card->isKindOf("Horse"))
            rect = _m_layout->m_horseAreas[index-2];
        anim->setEndValue(rect.topLeft() + QPoint(rect.width() / 2, 0));
        anim->setDuration(200);
        _m_equipAnim[index]->addAnimation(anim);
        connect(anim, SIGNAL(finished()), anim, SLOT(deleteLater()));
        anim = new QPropertyAnimation(_m_equipRegions[index], "opacity");
        anim->setEndValue(0);
        anim->setDuration(200);
        _m_equipAnim[index]->addAnimation(anim);
        connect(anim, SIGNAL(finished()), anim, SLOT(deleteLater()));
        _m_equipAnim[index]->start();
        _mutexEquipAnim.unlock();
        if (equip_card->isKindOf("Treasure"))
            _updateHorses();

        const Skill *skill = Sanguosha->getSkill(equip_card->objectName());
        if (skill != NULL) emit remove_equip_skill(skill->objectName());
    }
    //_disperseCards(result, _getDeathIconParent()->boundingRect().center(), false);
    return result;
}

void PlayerCardContainer::startHuaShen(QString generalName, QString skillName)
{
    if (m_player == NULL || getResourceKeyName() != "photo")
        return;

    _m_huashenGeneralName = generalName;
    _m_huashenSkillName = skillName;
    Q_ASSERT(m_player->hasSkill("huashen", true));

    bool second_zuoci = m_player && m_player->getGeneralName() != "zuoci" && m_player->getGeneral2Name() == "zuoci";
    int avatarSize = second_zuoci ? _m_layout->m_smallAvatarSize :
        (m_player->getGeneral2() ? _m_layout->m_primaryAvatarSize :
        _m_layout->m_avatarSize);
    QPixmap pixmap = G_ROOM_SKIN.getGeneralPixmap(generalName, (QSanRoomSkin::GeneralIconSize)avatarSize);

    QRect animRect = second_zuoci ? _m_layout->m_smallAvatarArea : _m_layout->m_avatarArea;
    if (pixmap.size() != animRect.size())
        pixmap = pixmap.scaled(animRect.size(), Qt::IgnoreAspectRatio, Qt::SmoothTransformation);
    if (second_zuoci)
        pixmap = paintByMask(pixmap);

    stopHuaShen();
    _m_huashenAnimation = G_ROOM_SKIN.createHuaShenAnimation(pixmap, animRect.topLeft(), _getAvatarParent(), _m_huashenItem);
    _m_huashenAnimation->start();
    _m_layout->m_extraSkillFont.paintText(_m_extraSkillText, _m_layout->m_extraSkillTextArea, Qt::AlignCenter,
            Sanguosha->translate(skillName).left(2));
    if (!skillName.isEmpty()) {
        _m_extraSkillText->show();
    }
    _adjustComponentZValues();
}

void PlayerCardContainer::stopHuaShen()
{
    if (_m_huashenAnimation != NULL) {
        _m_huashenAnimation->stop();
        _m_huashenAnimation->deleteLater();
        delete _m_huashenItem;
        _m_huashenAnimation = NULL;
        _m_huashenItem = NULL;
        _clearPixmap(_m_extraSkillText);
    }
}

void PlayerCardContainer::updateAvatarTooltip()
{
    if (m_player) {
        QString description = m_player->getSkillDescription();
        _m_avatarArea->setToolTip(description);
        if (m_player->getGeneral2())
            _m_smallAvatarArea->setToolTip(description);
    }
}

PlayerCardContainer::PlayerCardContainer()
{
    _m_layout = NULL;
    _m_avatarArea = _m_smallAvatarArea = NULL;
    _m_avatarNameItem = _m_smallAvatarNameItem = NULL;
    _m_avatarIcon = _m_smallAvatarIcon = NULL;
    _m_backgroundFrame = _m_circleItem = NULL;
    _m_screenNameItem = NULL;
    _m_chainIcon = _m_faceTurnedIcon = NULL;
    _m_handCardBg = _m_handCardNumText = NULL;
    _m_kingdomColorMaskIcon = _m_deathIcon = NULL;
    _m_actionIcon = NULL;
    _m_kingdomIcon = NULL;
    _m_saveMeIcon = NULL;
    _m_phaseIcon = NULL;
    _m_markItem = NULL;
    _m_roleComboBox = NULL;
    m_player = NULL;
    _m_selectedFrame = NULL;

    for (int i = 0; i < S_EQUIP_AREA_LENGTH; i++) {
        _m_equipCards[i] = NULL;
        _m_equipRegions[i] = NULL;
        _m_equipAnim[i] = NULL;
        _m_equipLabel[i] = NULL;
    }

    _m_huashenItem = NULL;
    _m_huashenAnimation = NULL;
    _m_extraSkillText = NULL;

    _m_floatingArea = NULL;
    _m_votesGot = 0;
    _m_maxVotes = 1;
    _m_votesItem = NULL;
    _m_distanceItem = NULL;
    _m_seatItem = NULL;
    _m_groupMain = new QGraphicsPixmapItem(this);
    _m_groupMain->setFlag(ItemHasNoContents);
    _m_groupMain->setPos(0, 0);
    _m_groupDeath = new QGraphicsPixmapItem(this);
    _m_groupDeath->setFlag(ItemHasNoContents);
    _m_groupDeath->setPos(0, 0);
    _allZAdjusted = false;
}

void PlayerCardContainer::hideAvatars()
{
    if (_m_avatarIcon) _m_avatarIcon->hide();
    if (_m_smallAvatarIcon) _m_smallAvatarIcon->hide();
}

void PlayerCardContainer::_layUnder(QGraphicsItem *item)
{
    _lastZ--;
    Q_ASSERT((unsigned long)item != 0xcdcdcdcd);
    if (item)
        item->setZValue(_lastZ--);
    else
        _allZAdjusted = false;
}

bool PlayerCardContainer::_startLaying()
{
    if (_allZAdjusted) return false;
    _allZAdjusted = true;
    _lastZ = -1;
    return true;
}

void PlayerCardContainer::_layBetween(QGraphicsItem *middle, QGraphicsItem *item1, QGraphicsItem *item2)
{
    if (middle && item1 && item2)
        middle->setZValue((item1->zValue() + item2->zValue()) / 2.0);
    else
        _allZAdjusted = false;
}

void PlayerCardContainer::_adjustComponentZValues(bool killed)
{
    // all components use negative zvalues to ensure that no other generated
    // cards can be under us.

    // layout
    if (!_startLaying()) return;
    bool second_zuoci = m_player && m_player->getGeneralName() != "zuoci" && m_player->getGeneral2Name() == "zuoci";

    _layUnder(_m_floatingArea);
    _layUnder(_m_distanceItem);
    _layUnder(_m_votesItem);
    if (!killed) {
        foreach(QGraphicsItem *pile, _m_privatePiles.values())
            _layUnder(pile);
    }
    foreach(QGraphicsItem *judge, _m_judgeIcons)
        _layUnder(judge);
    _layUnder(_m_markItem);
    _layUnder(_m_progressBarItem);
    _layUnder(_m_roleComboBox);
    _layUnder(_m_chainIcon);
    _layUnder(_m_hpBox);
    _layUnder(_m_handCardNumText);
    _layUnder(_m_handCardBg);
    _layUnder(_m_actionIcon);
    _layUnder(_m_saveMeIcon);
    _layUnder(_m_phaseIcon);
    _layUnder(_m_smallAvatarNameItem);
    _layUnder(_m_avatarNameItem);
    _layUnder(_m_kingdomIcon);
    _layUnder(_m_kingdomColorMaskIcon);
    _layUnder(_m_screenNameItem);
    for (int i = 0; i < 5; i++)
        _layUnder(_m_equipRegions[i]);
    _layUnder(_m_extraSkillText);
    _layUnder(_m_backgroundFrame);
    _layUnder(_m_selectedFrame);
    _layUnder(_m_faceTurnedIcon);
    _layUnder(_m_smallAvatarArea);
    _layUnder(_m_avatarArea);
    _layUnder(_m_circleItem);
    if (!second_zuoci)
        _layUnder(_m_smallAvatarIcon);
    if (!killed)
        _layUnder(_m_huashenItem);
    if (second_zuoci)
        _layUnder(_m_smallAvatarIcon);
    _layUnder(_m_avatarIcon);
}

void PlayerCardContainer::updateRole(const QString &role)
{
    _m_roleComboBox->fix(role);
}

void PlayerCardContainer::_updateProgressBar()
{
    QGraphicsItem *parent = _getProgressBarParent();
    if (parent == NULL) return;
    _m_progressBar->setOrientation(_m_layout->m_isProgressBarHorizontal ? Qt::Horizontal : Qt::Vertical);
    QRectF newRect = _m_layout->m_progressBarArea.getTranslatedRect(parent->boundingRect().toRect());
    _m_progressBar->setFixedHeight(newRect.height());
    _m_progressBar->setFixedWidth(newRect.width());
    _m_progressBarItem->setParentItem(parent);
    _m_progressBarItem->setPos(newRect.left(), newRect.top());
}

void PlayerCardContainer::_createControls()
{
    _m_floatingArea = new QGraphicsPixmapItem(_m_groupMain);

    _m_screenNameItem = new QGraphicsPixmapItem(_getAvatarParent());

    _m_avatarArea = new QGraphicsRectItem(_m_layout->m_avatarArea, _getAvatarParent());
    _m_avatarArea->setPen(Qt::NoPen);
    _m_avatarNameItem = new QGraphicsPixmapItem(_getAvatarParent());

    _m_smallAvatarArea = new QGraphicsRectItem(_m_layout->m_smallAvatarArea, _getAvatarParent());
    _m_smallAvatarArea->setPen(Qt::NoPen);
    _m_smallAvatarNameItem = new QGraphicsPixmapItem(_getAvatarParent());

    _m_extraSkillText = new QGraphicsPixmapItem(_getAvatarParent());
    _m_extraSkillText->hide();

    _m_handCardNumText = new QGraphicsPixmapItem(_getAvatarParent());

    _m_hpBox = new MagatamasBoxItem(_getAvatarParent());

    // Now set up progress bar
    _m_progressBar = new QSanCommandProgressBar;
    _m_progressBar->setAutoHide(true);
    _m_progressBar->hide();
    _m_progressBarItem = new QGraphicsProxyWidget(_getProgressBarParent());
    _m_progressBarItem->setWidget(_m_progressBar);
    _updateProgressBar();

    for (int i = 0; i < S_EQUIP_AREA_LENGTH; i++) {
        _m_equipLabel[i] = new QLabel;
        _m_equipLabel[i]->setStyleSheet("QLabel { background-color: transparent; }");
        //_m_equipLabel[i]->setPixmap(QPixmap(_m_layout->m_equipAreas[0].size()));
        _m_equipRegions[i] = new QGraphicsProxyWidget();
        _m_equipRegions[i]->setWidget(_m_equipLabel[i]);
        _m_equipRegions[i]->setPos(_m_layout->m_equipAreas[i].topLeft());
        _m_equipRegions[i]->setParentItem(_getEquipParent());
        _m_equipRegions[i]->hide();
        _m_equipAnim[i] = new QParallelAnimationGroup(this);
    }

    _m_markItem = new QGraphicsTextItem(_getMarkParent());
    _m_markItem->setDefaultTextColor(Qt::white);

    _createRoleComboBox();
    repaintAll();
}

void PlayerCardContainer::_updateDeathIcon()
{
    if (!m_player || !m_player->isDead()) return;
    QRect deathArea = _m_layout->m_deathIconRegion.getTranslatedRect(_getDeathIconParent()->boundingRect().toRect());
    _paintPixmap(_m_deathIcon, deathArea,
        QPixmap(m_player->getDeathPixmapPath()), _getDeathIconParent());
    _m_deathIcon->setZValue(30000.0);
}

void PlayerCardContainer::killPlayer()
{
    _m_roleComboBox->fix(m_player->getRole());
    _m_roleComboBox->setEnabled(false);
    _updateDeathIcon();
    _m_saveMeIcon->hide();
    if (_m_votesItem) _m_votesItem->hide();
    if (_m_distanceItem) _m_distanceItem->hide();
    QGraphicsColorizeEffect *effect = new QGraphicsColorizeEffect();
    effect->setColor(_m_layout->m_deathEffectColor);
    effect->setStrength(1.0);
    _m_groupMain->setGraphicsEffect(effect);
    refresh(true);
    if (ServerInfo.GameMode == "04_1v3" && !m_player->isLord()) {
        _m_deathIcon->hide();
        _m_votesGot = 4;
        updateVotes(false, true);
    } else
        _m_deathIcon->show();
}

void PlayerCardContainer::revivePlayer()
{
    _m_votesGot = 0;
    _m_groupMain->setGraphicsEffect(NULL);
    Q_ASSERT(_m_deathIcon);
    _m_deathIcon->hide();
    refresh();
}

void PlayerCardContainer::mousePressEvent(QGraphicsSceneMouseEvent *)
{
}

void PlayerCardContainer::updateVotes(bool need_select, bool display_1)
{
    if ((need_select && !isSelected()) || _m_votesGot < 1 || (!display_1 && _m_votesGot == 1))
        _clearPixmap(_m_votesItem);
    else {
        _paintPixmap(_m_votesItem, _m_layout->m_votesIconRegion,
            _getPixmap(QSanRoomSkin::S_SKIN_KEY_VOTES_NUMBER, QString::number(_m_votesGot)),
            _getAvatarParent());
        _m_votesItem->setZValue(1);
        _m_votesItem->show();
    }
}

void PlayerCardContainer::updateReformState()
{
    _m_votesGot--;
    updateVotes(false, true);
}

void PlayerCardContainer::showDistance()
{
    bool isNull = (_m_distanceItem == NULL);
    _paintPixmap(_m_distanceItem, _m_layout->m_votesIconRegion,
        _getPixmap(QSanRoomSkin::S_SKIN_KEY_VOTES_NUMBER, QString::number(Self->distanceTo(m_player))),
        _getAvatarParent());
    _m_distanceItem->setZValue(1.1);
    if (!Self->inMyAttackRange(m_player)) {
        QGraphicsColorizeEffect *effect = new QGraphicsColorizeEffect();
        effect->setColor(_m_layout->m_deathEffectColor);
        effect->setStrength(1.0);
        _m_distanceItem->setGraphicsEffect(effect);
    } else {
        _m_distanceItem->setGraphicsEffect(NULL);
    }
    if (_m_distanceItem->isVisible() && !isNull)
        _m_distanceItem->hide();
    else
        _m_distanceItem->show();
}

void PlayerCardContainer::showSeat()
{
    _paintPixmap(_m_seatItem, _m_layout->m_seatIconRegion,
        _getPixmap(QSanRoomSkin::S_SKIN_KEY_SEAT_NUMBER, QString::number(m_player->getRealSeat())),
        _getAvatarParent());
    //save the seat number for later use
    m_player->setProperty("UI_Seat", m_player->getSeat());
    _m_seatItem->setZValue(1.1);
}

void PlayerCardContainer::mouseReleaseEvent(QGraphicsSceneMouseEvent *event)
{
    QGraphicsItem *item = getMouseClickReceiver();
    if (item != NULL && item->isUnderMouse() && isEnabled() && (flags() & QGraphicsItem::ItemIsSelectable)) {
        if (event->button() == Qt::RightButton)
            setSelected(false);
        else if (event->button() == Qt::LeftButton) {
            _m_votesGot++;
            setSelected(_m_votesGot <= _m_maxVotes);
            if (_m_votesGot > 1) emit selected_changed();
        }
        updateVotes();
    }
}

void PlayerCardContainer::mouseDoubleClickEvent(QGraphicsSceneMouseEvent *)
{
    if (Config.EnableDoubleClick)
        RoomSceneInstance->doOkButton();
}

QVariant PlayerCardContainer::itemChange(GraphicsItemChange change, const QVariant &value)
{
    if (change == ItemSelectedHasChanged) {
        if (!value.toBool()) {
            _m_votesGot = 0;
            _clearPixmap(_m_selectedFrame);
            _m_selectedFrame->hide();
        } else {
            _paintPixmap(_m_selectedFrame, _m_layout->m_focusFrameArea,
                _getPixmap(QSanRoomSkin::S_SKIN_KEY_SELECTED_FRAME),
                _getFocusFrameParent());
            _m_selectedFrame->show();
        }
        _adjustComponentZValues();
        updateVotes();
        emit selected_changed();
    } else if (change == ItemEnabledHasChanged) {
        _m_votesGot = 0;
        emit enable_changed();
    }

    return QGraphicsObject::itemChange(change, value);
}

void PlayerCardContainer::_onEquipSelectChanged()
{
}

bool PlayerCardContainer::canBeSelected()
{
    QGraphicsItem *item1 = getMouseClickReceiver();
    return item1 && isEnabled() && (flags() & QGraphicsItem::ItemIsSelectable);
}

void PlayerCardContainer::stopHeroSkinChangingAnimation()
{
    if ((NULL != _m_avatarIcon) && !_m_avatarIcon->isSkinChangingFinished()) {
        _m_avatarIcon->stopChangeHeroSkinAnimation();
    }
    if ((NULL != _m_smallAvatarIcon) && !_m_smallAvatarIcon->isSkinChangingFinished()) {
        _m_smallAvatarIcon->stopChangeHeroSkinAnimation();
    }
}

-- translation for YJCM Package

return {
	["YJCM"] = "一将成名",

	["#caozhi"] = "八斗之才",
	["caozhi"] = "曹植",
	["designer:caozhi"] = "Foxear",
	["illustrator:caozhi"] = "木美人",
	["luoying"] = "落英",
	[":luoying"] = "①当其他角色的判定牌移至弃牌堆后，若此牌为梅花，你可获得此牌。②当其他角色的牌因弃置而移至弃牌堆后，你可获得其中的至少一张梅花牌。",
	["jiushi"] = "酒诗",
	[":jiushi"] = "①当你需要使用【酒】时，若你的武将牌正面朝上，你可翻面▶你使用无对应的实体牌的【酒】。"..
		"②当你受到伤害后，若你的武将牌背面朝上且你的武将牌于你受到此伤害时背面朝上，你可翻面。",

	["#yujin"] = "讨暴坚垒",
	["yujin"] = "于禁",
	["illustrator:yujin"] = "depp",
	["designer:yujin"] = "许坦",
	["zhenjun"] = "镇军",
	[":zhenjun"] = "准备阶段开始时，你可选择一名手牌数大于体力值的角色并弃置其X张牌（X为其手牌数和体力值之差）▶"..
		"若其以此法被弃置的牌中：有不为装备牌的牌，{你选择：1.弃置Y张牌（Y为其以此法被弃置的牌中不为装备牌的牌数）；2.令其摸Z张牌（Z为其以此法被弃置的牌数）}。"..
		"没有不为装备牌的牌，你可令其摸Z张牌（Z为其以此法被弃置的牌数）",
	["zhenjun-invoke"] = "是否使用“镇军”，选择一名手牌数多于体力值的角色",
	["zhenjun-discard"] = "镇军：请弃置 %arg 张牌，或点“取消”令%dest摸 %arg2 张牌",

	["#fazheng"] = "蜀汉的辅翼",
	["fazheng"] = "法正",
	["designer:fazheng"] = "Michael_Lee",
	["illustrator:fazheng"] = "雷没才",
	["enyuan"] = "恩怨",
	[":enyuan"] = "①当你得到一名其他角色的牌后，若这些牌数大于1，你可令其摸一张牌。②当你受到1点伤害后，你可令伤害来源选择：1.将一张手牌交给你；2.失去1点体力。",
	["EnyuanGive"] = "请交给 %dest %arg 张手牌",
	["xuanhuo"] = "眩惑",
	[":xuanhuo"] = "摸牌阶段开始时，你可放弃摸牌并选择一名其他角色▶你令其摸两张牌。其需对包括其攻击范围内你选择的其使用【杀】的一个合法目标在内的角色使用【杀】，"..
		"否则你获得其两张牌",
	["xuanhuo-invoke"] = "你可以发动“眩惑”，选择一名其他角色",
	["xuanhuo_slash"] = "眩惑",
	["xuanhuo-slash"] = "请对 %dest 使用一张【杀】",

	["#masu"] = "军略之才器",
	["masu"] = "马谡",
	["illustrator:masu"] = "XXX",
	["designer:masu"] = "点点",
	["sanyao"] = "散谣",
	[":sanyao"] = "出牌阶段限一次，你可弃置一张牌并选择一名体力值最大的角色▶你对其造成1点伤害。",
	["zhiman"] = "制蛮",
	[":zhiman"] = "当你对其他角色造成伤害时，你可防止此伤害▶你获得其装备区或判定区里的一张牌。",

	["#xushu"] = "化剑为犁",
	["xushu"] = "徐庶",
	["illustrator:xushu"] = "MSNZero",
	["zhuhai"] = "诛害",
	[":zhuhai"] = "其他角色的结束阶段开始时，若其于此回合内造成过伤害，你可对包括其在内的角色使用【杀】（无距离关系的限制）。",
	["qianxin"] = "潜心",
	[":qianxin"] = "觉醒技，当你造成伤害后，若你已受伤，你减1点体力上限▶你获得〖荐言〗。",
	["jianyan"] = "荐言",
	[":jianyan"] = "出牌阶段限一次，你可选择一种类别/颜色▶若牌堆里没有此类别/颜色的牌且弃牌堆里有此类别/颜色的牌，洗牌。"..
		"系统亮出牌堆里第一张为此类别/颜色的牌▷你令一名男性角色获得此牌。",
	["@zhuhai-slash"] = "是否使用“诛害”，对 %dest 使用一张【杀】",
	["@jianyan-give"] = "荐言：请选择一名男性角色，将展示的卡牌【%arg %arg2】交给该角色",
	["#QianxinWake"] = "%from 已受伤，触发“%arg”觉醒",
	["#JianyanChoice"] = "%from 选择了 %arg",
	["#JianyanFail"] = "牌堆已全部翻完，弃牌堆中没有 %arg ，结算终止",
	["$JianyanAnimate"] = "image=image/animate/jianyan.png",

	["#lingtong"] = "豪情烈胆",
	["lingtong"] = "凌统",
	["illustrator:lingtong"] = "绵Myan",
	["xuanfeng"] = "旋风",
	[":xuanfeng"] = "弃牌阶段结束时（若你于此回合内因弃牌阶段的弃牌规则而弃置过你的至少两张手牌）或当你失去装备区里的牌后，"..
		"你可弃置一名其他角色的一张牌▶你可弃置一名其他角色的一张牌。",
	["xuanfeng-invoke"] = "你可以发动“旋风”，选择一名其他角色弃置其一张牌",
	["xuanfeng-continue"] = "你可以继续执行“旋风”的效果，弃置一名其他角色的一张牌",

	["#wuguotai"] = "武烈皇后",
	["wuguotai"] = "吴国太",
	["designer:wuguotai"] = "章鱼咬你哦",
	["illustrator:wuguotai"] = "zoo",
	["ganlu"] = "甘露",
	[":ganlu"] = "出牌阶段限一次，你可以令两名装备区里的牌数不均为0且差不大于你已损失的体力值的角色交换装备区里的牌。",
	["buyi"] = "补益",
	[":buyi"] = "当一名角色进入濒死状态时，你可以展示其一张手牌▶若此牌不为基本牌，其弃置此牌▷其回复1点体力。",
	["#GanluSwap"] = "%from 交换了 %to 的装备",

	["#xusheng"] = "整军经武",
	["xusheng"] = "徐盛",
	["illustrator:xusheng"] = "L",
	["designer:xusheng"] = "阿江",
	["pojun"] = "破军",
	[":pojun"] = "当【杀】于出牌阶段内指定目标后，若使用者为你，你可将此目标对应的角色的至多X张牌扣置于其武将牌旁（均称为“军”）（X为其体力值）▶(→)"..
		"此回合结束前，该角色获得其武将牌旁的所有“军”。",
	["pojun_num"] = "请选择移出牌数量",
	["pojun_dis"] = "选择移出游戏的牌",
	["army"] = "军",

	["#gaoshun"] = "攻无不克",
	["gaoshun"] = "高顺",
	["designer:gaoshun"] = "羽柴文理",
	["illustrator:gaoshun"] = "鄧Sir",
	["xianzhen"] = "陷阵",
	[":xianzhen"] = "出牌阶段限一次，你可与一名角色拼点▶若你：赢，你于此阶段内对其使用牌无距离关系的限制且对包括其在内的角色使用牌无次数限制；未赢，你于此阶段内不能使用【杀】。",
	["jinjiu"] = "禁酒",
	[":jinjiu"] = "锁定技，你的【酒】或作为你的判定牌的【酒】的牌名视为【杀】且此【杀】为普【杀】。",

	["#chengong"] = "刚直壮烈",
	["chengong"] = "陈宫",
	["designer:chengong"] = "Kaycent",
	["illustrator:chengong"] = "黑月乱",
	["mingce"] = "明策",
	[":mingce"] = "出牌阶段限一次，你可选择：1.将一张装备牌或【杀】（正面朝上移动）交给一名角色A并选择其攻击范围内的是其使用【杀】的合法目标的一名角色B▶"..
		"A需对B使用无对应的实体牌的普【杀】，否则摸一张牌。2.将一张装备牌或【杀】（正面朝上移动）交给一名其攻击范围内没有其使用【杀】的合法目标的角色▶其摸一张牌。",
	["zhichi"] = "智迟",
	[":zhichi"] = "锁定技，当你于回合外受到伤害后，你▶(→)当【杀】或普通锦囊牌于当前回合内对目标的使用结算开始时，若此目标对应的角色为你，你令此牌对此目标无效。",
	["@mingce-choose"] = "明策：请选择视为对 %dest 使用【杀】或摸一张牌",
	["mingce:use"] = "视为出杀",
	["mingce:draw"] = "摸一张牌",
	["#ZhichiDamaged"] = "%from 受到了伤害，本回合内【杀】和非延时锦囊都将对其无效",
	["#ZhichiAvoid"] = "%from 的“%arg”被触发，【杀】和非延时锦囊对其无效",

	["#zhangchunhua"] = "冷血皇后",
	["zhangchunhua"] = "张春华",
	["designer:zhangchunhua"] = "JZHIEI",
	["illustrator:zhangchunhua"] = "樱花闪乱",
	["jueqing"] = "绝情",
	[":jueqing"] = "锁定技，当你对一名角色造成的伤害结算开始前，你终止此伤害流程▶其失去X点体力（X为伤害值）。",
	["shangshi"] = "伤逝",
	[":shangshi"] = "当你得到牌后、失去牌后、扣减体力后、回复体力后、减体力上限后或加体力上限后，若你的手牌数小于X，你可将你的手牌补至X张（X为你已损失的体力值）。",

    ["#zhonghui"] = "桀骜的野心家",
	["zhonghui"] = "钟会",
	["illustrator:zhonghui"] = "雪君S",
	["quanji"] = "权计",
	[":quanji"] = "①当你受到1点伤害后，你可以摸一张牌▶你将一张手牌置于武将牌上（称为“权”）。②你的手牌上限+X（X为“权”数）。",
	["QuanjiPush"] = "请将一张手牌置于武将牌上",
	["zili"] = "自立",
	[":zili"] = "觉醒技，准备阶段开始时，若“权”数大于2，你选择：{1.回复1点体力；2.摸两张牌}▶你减1点体力上限，获得〖排异〗。",
	["#ZiliWake"] = "%from 的“权”为 %arg 张，触发“%arg2”觉醒",
	["zili:draw"] = "摸两张牌",
	["zili:recover"] = "回复体力",
	["power"] = "权",
	["paiyi"] = "排异",
	[":paiyi"] = "出牌阶段限一次，你可以将一张“权”置入弃牌堆并选择一名角色▶其摸两张牌。若其手牌数大于你，则你对其造成1点普通伤害。",
}

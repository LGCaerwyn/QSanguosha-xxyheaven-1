-- translation for Mountain Package

return {
	["mountain"] = "山包",

	["#zhanghe"] = "料敌机先",
	["zhanghe"] = "张郃",
	["illustrator:zhanghe"] = "张帅",
	["qiaobian"] = "巧变",
	["qiaobianask"] = "巧变",
	[":qiaobian"] = "你可以弃置一张手牌，跳过除准备阶段和结束阶段外的一个阶段，然后若你以此法：跳过摸牌阶段，你可以选择至多两名有手牌的其他角色，然后获得这些角色的各一张手牌；跳过出牌阶段，你可以将一名角色场上的一张牌置入另一名角色区域里的相应位置。",
	["@qiaobian-2"] = "巧变：请选择有手牌的一至两名角色为目标",
	["@qiaobian-3"] = "巧变：请选择要交换牌的两个目标",
	["#qiaobian-1"] = "你可以弃置 1 张手牌跳过判定阶段",
	["#qiaobian-2"] = "你可以弃置 1 张手牌跳过摸牌阶段，获得其他角色的手牌",
	["#qiaobian-3"] = "你可以弃置 1 张手牌跳过出牌阶段，移动一张卡牌",
	["#qiaobian-4"] = "你可以弃置 1 张手牌跳过弃牌阶段",

	["#dengai"] = "矫然的壮士",
	["dengai"] = "邓艾",
	["tuntian"] = "屯田",
	[":tuntian"] = "当你于回合外失去牌后，你可以进行判定，当非红桃的判定牌生效后，你将此牌置于你的武将牌上，称为“田”；你计算与其他角色的距离-X（X为“田”的数量）。",
	["#tuntian-dist"] = "屯田",
	["field"] = "田",
	["zaoxian"] = "凿险",
	[":zaoxian"] = "觉醒技，准备阶段开始时，若“田”的数量不小于3，你减1点体力上限，然后获得技能“急袭”（你可以将一张“田”当【顺手牵羊】使用）。",
	["$ZaoxianAnimate"] = "image=image/animate/zaoxian.png",
	["jixi"] = "急袭",
	[":jixi"] = "你可以将一张“田”当【顺手牵羊】使用。",
	["#ZaoxianWake"] = "%from 的“田”为 %arg 张，触发“%arg2”觉醒",

	["#jiangwei"] = "龙的衣钵",
	["jiangwei"] = "姜维",
	["tiaoxin"] = "挑衅",
	[":tiaoxin"] = "出牌阶段限一次，你可以选择一名攻击范围内含有你的角色，然后除非该角色对你使用一张【杀】，否则你弃置其一张牌。",
	["@tiaoxin-slash"] = "%src 对你发动“挑衅”，请对其使用一张【杀】",
	["zhiji"] = "志继",
	[":zhiji"] = "觉醒技，准备阶段开始时，若你没有手牌，你选择一项：回复1点体力；或摸两张牌。然后你减1点体力上限，获得技能“观星”。",
	["zhiji:draw"] = "摸两张牌",
	["zhiji:recover"] = "回复1点体力",
	["$ZhijiAnimate"] = "image=image/animate/zhiji.png",
	["#ZhijiWake"] = "%from 没有手牌，触发“%arg”觉醒",

	["#liushan"] = "无为的真命主",
	["liushan"] = "刘禅",
	["illustrator:liushan"] = "LiuHeng",
	["xiangle"] = "享乐",
	[":xiangle"] = "锁定技，当你成为一名角色使用【杀】的目标后，除非该角色弃置一张基本牌，否则此【杀】对你无效。",
	["@xiangle-discard"] = "你须再弃置一张基本牌使此【杀】生效",
	["fangquan"] = "放权",
	["fangquanask"] = "放权",
	["#fangquan-next"] = "放权",
	[":fangquan"] = "你可以跳过出牌阶段。若如此做，此回合结束时，你可以弃置一张手牌并选择一名其他角色，然后令其获得一个额外的回合。",
	["@fangquan-give"] = "你可以弃置一张手牌令一名其他角色进行一个额外的回合",
	["ruoyu"] = "若愚",
	[":ruoyu"] = "主公技，觉醒技，准备阶段开始时，若你是体力值最小的角色（或之一），你加1点体力上限，回复1点体力，然后获得技能“激将”。",
	["$RuoyuAnimate"] = "image=image/animate/ruoyu.png",
	["#Fangquan"] = "%to 将进行一个额外的回合",
	["#RuoyuWake"] = "%from 的体力值 %arg 为场上最少，触发“%arg2”觉醒",

	["#sunce"] = "江东的小霸王",
	["sunce"] = "孙策",
	["jiang"] = "激昂",
	[":jiang"] = "当你使用【决斗】或红色【杀】指定目标后，或成为【决斗】或红色【杀】的目标后，你可以摸一张牌。",
	["hunzi"] = "魂姿",
	[":hunzi"] = "觉醒技，准备阶段开始时，若你的体力值为1，你减1点体力上限，然后获得技能“英姿”和“英魂”。",
	["zhiba"] = "制霸",
	["zhiba_pindian"] = "制霸",
	[":zhiba"] = "主公技，其他吴势力角色的出牌阶段限一次，该角色可以与你拼点（若你发动过“魂姿”，你可以拒绝此拼点），若其没赢，你可以获得此次拼点的两张牌。",
	["@zhiba-pindianstart"] = "是否接受 %src 发起的拼点（制霸）",
	["@zhiba-pindianfinish"] = "制霸：是否获两张拼点牌",
	["#ZhibaReject"] = "%from 拒绝 %to 发起的拼点（%arg）",

	["#erzhang"] = "经天纬地",
	["erzhang"] = "张昭＆张纮",
	["&erzhang"] = "张昭张纮",
	["illustrator:erzhang"] = "废柴男",
	["zhijian"] = "直谏",
	[":zhijian"] = "出牌阶段，你可以将手牌区里的一张装备牌置入一名其他角色的装备区▶你摸一张牌。",
	["$PutEquip"] = "%from 将 %card 置入 %to 的装备区",
	["guzheng"] = "固政",
	[":guzheng"] = "其他角色的弃牌阶段结束时，你可将弃牌堆里的一张曾是其于此阶段内弃置过的其手牌的牌交给该角色▶你可获得弃牌堆里的所有曾是于此阶段内因弃置而移至弃牌堆的牌的牌。",
	["guzheng_obtain:prompt"] = "你发动了“固政”，是否获得剩余的牌",

	["#caiwenji"] = "异乡的孤女",
	["caiwenji"] = "蔡文姬",
	["illustrator:caiwenji"] = "SoniaTang",
	["beige"] = "悲歌",
	[":beige"] = "当一名角色受到【杀】造成的伤害后，你可以弃置一张牌，然后令其进行判定，若结果为：红桃，其回复1点体力；方块，其摸两张牌；梅花，伤害来源弃置两张牌；黑桃，伤害来源翻面。",
	["@beige"] = "你可以弃置一张牌对 %src 发动“悲歌”",
	["duanchang"] = "断肠",
	[":duanchang"] = "锁定技，当你死亡时，你令杀死你的角色失去其所有技能。",
	["@duanchang"] = "断肠",
	["#DuanchangLoseSkills"] = "%from 的“%arg”被触发， %to 失去所有武将技能",

	["#zuoci"] = "谜之仙人",
	["zuoci"] = "左慈",
	["illustrator:zuoci"] = "废柴男",
	["huashen"] = "化身",
	[":huashen"] ="游戏开始时，你随机将两张游戏外的武将牌扣置于一旁，形成“化身牌堆”（“化身牌堆”里的牌仅对你可见，进入过“化身牌堆”的牌称为“化身牌”），然后选择一张“化身牌”置于武将牌旁。回合开始时和结束后，你可选择一张“化身牌”置于武将牌旁，你的性别和势力属性视为与你武将牌旁的“化身牌”相同且你获得该武将牌的一个技能。",
	["xinsheng"] = "新生",
	[":xinsheng"] = "当你受到1点伤害后，你可以随机将一张游戏外的武将牌置入“化身牌堆”。",
	["#GetHuashen"] = "%from 获得了 %arg 张“化身牌”",
	["#GetHuashenDetail"] = "%from 获得了“化身牌” 【%arg】",
}

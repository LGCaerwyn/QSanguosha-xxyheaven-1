-- translation for SP Package

return {
	["sp"] = "SP",
	["miscellaneous"] = "乱入",

	["#yangxiu"] = "恃才放旷",
	["yangxiu"] = "杨修",
	["illustrator:yangxiu"] = "张可",
	["jilei"] = "鸡肋",
	[":jilei"] = "当你受到伤害后，你可以声明一种类别的手牌，伤害来源不能使用、打出或弃置你选择的此类手牌，直到回合结束。",
	["jilei_basic"] = "鸡肋[基本牌]",
	["jilei_equip"] = "鸡肋[装备牌]",
	["jilei_trick"] = "鸡肋[锦囊牌]",
	["danlao"] = "啖酪",
	[":danlao"] = "当你成为锦囊牌的目标后，若此牌的目标角色数大于1，你可以摸一张牌。若如此做，此牌对你无效。",
	["#Jilei"] = "由于“<font color=\"yellow\"><b>鸡肋</b></font>”效果，%from 本回合不能使用、打出或弃置 %arg",
	["#JileiClear"] = "%from 的“<font color=\"yellow\"><b>鸡肋</b></font>”效果消失",

	["#sp_machao"] = "西凉的猛狮",
	["sp_machao"] = "SP马超",
	["&sp_machao"] = "马超",
	["illustrator:sp_machao"] = "depp",
	["zhuiji"] = "追击",
	[":zhuiji"] = "锁定技，你计算与体力值不大于你的角色的距离视为1。",
	["shichou"] = "誓仇",
	[":shichou"] = "你使用【杀】可以额外选择至多X名角色为目标（X为你已损失的体力值）。",
	["@shichou-add"] = "你可以发动“誓仇”，为【杀】增加至多 %arg 个目标",

	["#sp_jiaxu"] = "算无遗策",
	["sp_jiaxu"] = "SP贾诩",
	["&sp_jiaxu"] = "贾诩",
	["illustrator:sp_jiaxu"] = "雪君S",
	["zhenlve"] = "缜略",
	[":zhenlve"] = "锁定技，你使用的普通锦囊牌不是【无懈可击】的合法目标；你不是延时锦囊牌的合法目标。",
	["jianshu"] = "间书",
	[":jianshu"] = "限定技，出牌阶段，你可以将一张黑色手牌交给一名其他角色，并选择一名攻击范围内含有其的另一名其他角色，然后令这两名角色拼点：赢的角色弃置两张牌，没赢的失去1点体力。",
	["yongdi"] = "拥嫡",
	[":yongdi"] = "限定技，当你受到伤害后，你可令一名其他男性角色加1点体力上限，然后若该角色的武将牌上有主公技且其身份不为主公，其获得此主公技。",
	["@yongdi"] = "你可以发动“拥嫡”，选择一名其他男性角色",

	["#caohong"] = "福将",
	["caohong"] = "曹洪",
	["illustrator:caohong"] = "LiuHeng",
	["yuanhu"] = "援护",
	[":yuanhu"] = "结束阶段开始时，你可以将一张装备牌置于一名角色的装备区里，根据此牌的类别执行相应效果：武器牌—你弃置该角色距离为1的一名角色的区域里的一张牌；防具牌—该角色摸一张牌；坐骑牌—该角色回复1点体力",
	["@yuanhu-equip"] = "你可以发动“援护”，将一张装备牌置于一名角色装备区里",
	["@yuanhu-discard"] = "请选择 %src 距离1的一名角色，弃置其一张牌",

	["#fuwan"] = "沉毅的国丈",
	["fuwan"] = "伏完",
	["illustrator:fuwan"] = "LiuHeng",
	["moukui"] = "谋溃",
	[":moukui"] = "当你使用【杀】指定一个目标后，你可以选择一项：摸一张牌；或弃置该角色的一张牌。选择完成后，当此【杀】被其使用的【闪】抵消后，该角色弃置你的一张牌。",
	["moukui:draw"] = "摸一张牌",
	["moukui:discard"] = "弃置目标角色一张牌",

	["#lingju"] = "情随梦逝",
	["lingju"] = "灵雎",
	["illustrator:lingju"] = "木美人",
	["jieyuan"] = "竭缘",
	[":jieyuan"] = "当你对其他角色造成伤害时，若其体力值不小于你，你可以弃置一张黑色手牌。若如此做，你令伤害值+1；当你受到其他角色造成的伤害时，若其体力值不小于你，你可以弃置一张红色手牌。若如此做，你令伤害值-1。",
	[":jieyuan00"] = "当你对其他角色造成伤害时，若其体力值不小于你，你可以弃置一张黑色手牌。若如此做，你令伤害值+1；当你受到其他角色造成的伤害时，若其体力值不小于你，你可以弃置一张红色手牌。若如此做，你令伤害值-1。",
	[":jieyuan01"] = "当你对其他角色造成伤害时，若其体力值不小于你，你可以弃置一张黑色手牌。若如此做，你令伤害值+1；当你受到其他角色造成的伤害时，你可以弃置一张红色手牌。若如此做，你令伤害值-1。",
	[":jieyuan02"] = "当你对其他角色造成伤害时，若其体力值不小于你，你可以弃置一张黑色手牌。若如此做，你令伤害值+1；当你受到其他角色造成的伤害时，你可以弃置一张牌。若如此做，你令伤害值-1。",
	[":jieyuan10"] = "当你对其他角色造成伤害时，你可以弃置一张黑色手牌。若如此做，你令伤害值+1；当你受到其他角色造成的伤害时，若其体力值不小于你，你可以弃置一张红色手牌。若如此做，你令伤害值-1。",
	[":jieyuan11"] = "当你对其他角色造成伤害时，你可以弃置一张黑色手牌。若如此做，你令伤害值+1；当你受到其他角色造成的伤害时，你可以弃置一张红色手牌。若如此做，你令伤害值-1。",
	[":jieyuan12"] = "当你对其他角色造成伤害时，你可以弃置一张黑色手牌。若如此做，你令伤害值+1；当你受到其他角色造成的伤害时，你可以弃置一张牌。若如此做，你令伤害值-1。",
	[":jieyuan20"] = "当你对其他角色造成伤害时，你可以弃置一张牌。若如此做，你令伤害值+1；当你受到其他角色造成的伤害时，若其体力值不小于你，你可以弃置一张红色手牌。若如此做，你令伤害值-1。",
	[":jieyuan21"] = "当你对其他角色造成伤害时，你可以弃置一张牌。若如此做，你令伤害值+1；当你受到其他角色造成的伤害时，你可以弃置一张红色手牌。若如此做，你令伤害值-1。",
	[":jieyuan22"] = "当你对其他角色造成伤害时，你可以弃置一张牌。若如此做，你令伤害值+1；当你受到其他角色造成的伤害时，你可以弃置一张牌。若如此做，你令伤害值-1。",
	["@jieyuan-increase"] = "你可以弃置一张黑色手牌令 %src 受到的伤害+1",
	["@jieyuan-decrease"] = "你可以弃置一张红色手牌令 %src 造成的伤害-1",
	["#JieyuanIncrease"] = "%from 发动了“<font color=\"yellow\"><b>竭缘</b></font>”，伤害点数从 %arg 点增加至 %arg2 点",
	["#JieyuanDecrease"] = "%from 发动了“<font color=\"yellow\"><b>竭缘</b></font>”，伤害点数从 %arg 点减少至 %arg2 点",
	["fenxin"] = "焚心",
	[":fenxin"] = "锁定技，一名其他角色死亡后，若其身份为：忠臣，你发动“竭缘”减少伤害无体力值限制；反贼，你发动“竭缘”增加伤害无体力值限制；内奸，你发动“竭缘”弃置牌无颜色限制且可弃置装备牌。",
	["@burnheart"] = "焚心",
	["$FenxinAnimate"] = "image=image/animate/fenxin.png",

	["#xiahouba"] = "棘途壮志",
	["xiahouba"] = "夏侯霸",
	["illustrator:xiahouba"] = "熊猫探员",
	["baobian"] = "豹变",
	[":baobian"] = "锁定技，若你的体力值：不大于3，你拥有技能“挑衅”；不大于2，你拥有技能“咆哮”；为1，你拥有技能“神速”。",

	["#chenlin"] = "破竹之咒",
	["chenlin"] = "陈琳",
	["illustrator:chenlin"] = "木美人",
	["bifa"] = "笔伐",
	[":bifa"] = "结束阶段开始时，你可以将一张手牌扣置于一名武将牌旁没牌的其他角色的武将牌旁。若如此做，该角色的回合开始时，其观看其武将牌旁的牌并选择一项：将一张与此牌类别相同的手牌交给你，然后其获得此牌；或将此牌置入弃牌堆，然后其失去1点体力。",
	["@bifa-remove"] = "你可以发动“笔伐”，将一张手牌置于一名角色武将牌旁",
	["@bifa-give"] = "请交给目标角色一张类型相同的手牌",
	["songci"] = "颂词",
	[":songci"] = "出牌阶段，你可以选择一项：令一名手牌数小于其体力值的角色摸两张牌；或令一名手牌数大于其体力值的角色弃置两张牌。每名角色限一次。",
	["$BifaView"] = "%from 观看了 %arg 牌 %card",

	["#erqiao"] = "江东之花",
	["erqiao"] = "大乔＆小乔",
	["&erqiao"] = "大乔小乔",
	["illustrator:erqiao"] = "木美人",
	["xingwu"] = "星舞",
	[":xingwu"] = "弃牌阶段开始时，你可将一张手牌置于你的武将牌上（称为“舞”）▶若所有“舞”的花色数大于2，你将三张花色均不相同的“舞”置入弃牌堆，选择一名其他角色，"..
	        "弃置其装备区里的所有牌。若其为：男性角色，你对其造成2点普通伤害；女性角色，你对其造成1点普通伤害。",
	["dance"] = "舞",
	["@xingwu"] = "你可以发动“星舞”，将一张手牌置于武将牌上",
	["@xingwu-discard"] = "星舞：请选择三张花色不同的“舞”",
	["@xingwu-choose"] = "星舞：请选择一名角色",
	["luoyan"] = "落雁",
	[":luoyan"] = "锁定技，若有“舞”，你拥有〖天香〗和〖流离〗。",

	["#yuejin"] = "奋强突固",
	["yuejin"] = "乐进",
	["illustrator:yuejin"] = "巴萨小马",
	["xiaoguo"] = "骁果",
	[":xiaoguo"] = "其他角色的结束阶段开始时，你可以弃置一张基本牌。若如此做，该角色选择一项：弃置一张装备牌，然后你摸一张牌；或受到你造成的1点伤害。",
	["@xiaoguo"] = "你可以弃置一张基本牌发动“骁果”",
	["@xiaoguo-discard"] = "请弃置一张装备牌，否则受到 1 点伤害",

	["#zhangbao"] = "地公将军",
	["zhangbao"] = "张宝",
	["illustrator:zhangbao"] = "大佬荣",
	["zhoufu"] = "咒缚",
	[":zhoufu"] = "出牌阶段限一次，你可以将一张手牌置于一名武将牌旁没有“咒”的其他角色的武将牌旁（称为“咒”）。当其判定时，若其有“咒”，其将“咒”作为判定牌，当前回合结束时，若有角色于此回合因判定移除过“咒”，则你令这些角色各失去1点体力。",
	["incantation"] = "咒缚",
	["yingbing"] = "影兵",
	[":yingbing"] = "锁定技，当其他角色使用牌时，若其有“咒”且此“咒”的花色与此牌相同，你摸一张牌，然后若你此前因此“咒”的效果摸过牌，你将此“咒”置入弃牌堆。",
	["$ZhoufuJudge"] = "%from 的判定牌为 %arg 牌 %card",

	["#panfeng"] = "联军上将",
	["panfeng"] = "潘凤",
	["illustrator:panfeng"] = "G.G.G.",
	["kuangfu"] = "狂斧",
	[":kuangfu"] = "当你使用【杀】对目标角色造成伤害后，你可以将其装备区里的一张牌置入你的装备区或弃置之。",
	["kuangfu:throw"] = "弃置此装备",
	["kuangfu:move"] = "将此装备移动到自己的装备区",
	["kuangfu_equip"] = "狂斧",
	["kuangfu_equip:0"] = "武器牌",
	["kuangfu_equip:1"] = "防具牌",
	["kuangfu_equip:2"] = "+1坐骑",
	["kuangfu_equip:3"] = "-1坐骑",
	["kuangfu_equip:4"] = "宝物牌",

	["#dingfeng"] = "清侧重臣",
	["dingfeng"] = "丁奉",
	["illustrator:dingfeng"] = "G.G.G.",
	["duanbing"] = "短兵",
	[":duanbing"] = "当你使用【杀】选择目标后，你可以令一名距离为1的角色也成为此【杀】的目标。",
	["@duanbing-add"] = "你可以发动“短兵”，令一名距离1的角色也成为此【杀】的目标",
	["fenxun"] = "奋迅",
	[":fenxun"] = "出牌阶段限一次，你可以弃置一张牌并选择一名其他角色，然后你与该角色的距离视为1，直到回合结束。",

	["#hetaihou"] = "弄权之蛇蝎",
	["hetaihou"] = "何太后",
	["illustrator:hetaihou"] = "琛·美弟奇",
	["zhendu"] = "鸩毒",
	[":zhendu"] = "其他角色的出牌阶段开始时，你可以弃置一张手牌。若如此做，该角色视为使用一张【酒】，然后你对其造成1点伤害。",
	["@zhendu-discard"] = "你可以弃置一张手牌对 %src 发动“鸩毒”",
	["qiluan"] = "戚乱",
	[":qiluan"] = "一名角色的回合结束后，若你于此回合内杀死过其他角色，则你可以摸X张牌（X为这些角色数的三倍）。",
	["qiluan:prompt"] = "你可以发动“戚乱”，摸 %arg 张牌",

	["#sunluyu"] = "舍身饲虎",
	["sunluyu"] = "孙鲁育",
	["illustrator:sunluyu"] = "depp",
	["meibu"] = "魅步",
	[":meibu"] = "其他角色的出牌阶段开始时，若你不在其攻击范围内，你可以其于此回合内拥有“止息”（锁定技，若你于出牌阶段内使用过锦囊牌，你的锦囊牌或作为你的判定牌的锦囊牌视为【杀】）。若如此做，你于此回合内视为在其攻击范围内。",
    ["meibu_in_attack"] = "若如此做，你于此回合内视为在其攻击范围内。",
	["zhixi"] = "止息",
	[":zhixi"] = "锁定技，若你于出牌阶段内使用过锦囊牌，你的锦囊牌或作为你的判定牌的锦囊牌视为【杀】。",
	["mumu"] = "穆穆",
	[":mumu"] = "出牌阶限一次，若场上有装备牌，你可以弃置一张牌，然后选择一项：弃置场上的一张装备牌，然后摸一张牌；或获得场上的一张防具牌。若你以此法弃置的牌是【杀】或黑色锦囊牌，则直到你的下个回合开始，去掉技能“魅步”中的最后一句描述。",
	["mumu:discard_equip"] = "弃置装备",
	["mumu:obtain_armor"] = "获得防具",
	["@mumu-equip"] = "你发动了“穆穆”，请选择一名有装备牌的目标角色",
	["@mumu-armor"] = "你发动了“穆穆”，请选择一名有防具牌的目标角色",

	["#maliang"] = "白眉智士",
	["maliang"] = "马良",
	["illustrator:maliang"] = "LiuHeng",
	["zishu"] = "自书",
	[":zishu"] = "锁定技，其他角色的回合结束前，你将你于此回合内得到的牌置入弃牌堆；当你于回合内不因此技能而得到牌时，你摸一张牌。",
	["yingyuan"] = "应援",
	[":yingyuan"] = "当一张基本牌或普通锦囊牌于你的回合内结算结束后，若使用者为你且你没有因与此牌牌名相同的牌而发动过此技能，你可以将此牌的所有实体牌交给一名其他角色。",
	["@yingyuan-invoke"] = "你可以发动“应援”将使用的【%arg】交给其他角色",

	["#chengyu"] = "泰山捧日",
	["chengyu"] = "程昱",
	["illustrator:chengyu"] = "GH",
	["shefu"] = "设伏",
	[":shefu"] = "结束阶段开始时，你可将一张手牌扣置于武将牌上，称为“伏兵”。若如此做，你为“伏兵”记录一个基本牌或锦囊牌的名称（须与其他“伏兵”记录的名称均不同）。当其他角色于你的回合外使用手牌时，你可将记录的牌名与此牌相同的一张“伏兵”置入弃牌堆，然后此牌无效。",
	["ambush"] = "伏兵",
	["@shefu-prompt"] = "你可以发动“设伏”，将一张手牌置为伏兵牌",
	["shefu_cancel:data"] = "你可以发动“设伏”令【%arg】无效",
	["benyu"] = "贲育",
	[":benyu"] = "当你受到伤害后，若你的手牌数不大于伤害来源手牌数，你可以将手牌摸至与伤害来源手牌数相同（最多摸至5张）；否则你可以弃置大于伤害来源手牌数的手牌，然后对其造成1点伤害。",
	["@benyu-discard"] = "你可以发动“贲育”，弃置至少 %arg 张手牌对 %dest 造成1点伤害",
	["$ShefuRecord"] = "%from 为 %card 记录牌名【%arg】",
	["#ShefuEffect"] = "%from 发动了“%arg2”，%to 使用的【%arg】无效",

	["#ganfuren"] = "昭烈皇后",
	["ganfuren"] = "甘夫人",
	["illustrator:ganfuren"] = "琛·美弟奇",
	["shushen"] = "淑慎",
	[":shushen"] = "当你回复1点体力后，你可以令一名其他角色选择一项：回复1点体力，或摸两张牌。",
	["shushen-invoke"] = "你可以发动“淑慎”，选择一名其他角色",
	["shushen:recover"] = "回复体力",
	["shushen:draw"] = "摸两张牌",
	["shenzhi"] = "神智",
	[":shenzhi"] = "准备阶段开始时，你可以弃置所有手牌，若你以此法弃置的手牌数不小于你的体力值，你回复1点体力。",

	["#huangjinleishi"] = "雷祭之姝",
	["huangjinleishi"] = "黄巾雷使",
	["illustrator:huangjinleishi"] = "depp",
	["fulu"] = "符箓",
	[":fulu"] = "你可以将一张普通【杀】当雷【杀】使用。",
	["zhuji"] = "助祭",
	[":zhuji"] = "每当一名角色造成雷电伤害时，你可以令其进行判定，若结果为：黑色，你令伤害值+1；红色，其获得判定牌。",
	["#ZhujiBuff"] = "%from 的“<font color=\"yellow\"><b>助祭</b></font>”效果被触发，伤害从 %arg 点增加至 %arg2 点",

	["#hanba"] = "如惔如焚",
	["hanba"] = "旱魃",
	["illustrator:hanba"] = "雪君S",
	["fentian"] = "焚天",
	[":fentian"] = "锁定技，结束阶段开始时，若你的手牌数小于你的体力值，你选择一名你攻击范围内的角色，将其一张牌置于你的武将牌上，称为“焚”；你的攻击范围+X（X为“焚”的数量）。",
	["@fentian-choose"] = "请选择一名攻击范围内的角色",
	["burn"] = "焚",
	["zhiri"] = "炙日",
	[":zhiri"] = "觉醒技，准备阶段开始时，若“焚”的数量不小于3，你减1点体力上限，然后获得技能“心惔”（出牌阶段限一次，你可以将两张“焚”置入弃牌堆并选择一名角色，该角色失去一点体力）。",
	["xintan"] = "心惔",
	[":xintan"] = "出牌阶段限一次，你可以将两张“焚”置入弃牌堆并选择一名角色，该角色失去一点体力。",

	-- E.SP 001 とある奇葩の凯撒
	["#caesar"] = "罗马大帝",
	["caesar"] = "凯撒",
	["illustrator:caesar"] = "青骑士",
	["conqueror"] = "征服",
	[":conqueror"] = "当你使用【杀】指定一个目标后，你可以选择一种牌的类别，令其选择一项：\n1．将一张此类别的牌交给你，若如此做，此次对其结算的此【杀】对其无效；\n2．不能使用【闪】响应此【杀】。 ",
	["@conqueror-exchange"] = "%src 对你发动了“<font color=\"yellow\"><b>征服</b></font>”，请将一张 %arg 交给 %src",

	["sp_guanyu"] = "SP关羽",
	["&sp_guanyu"] = "关羽", 
	["#sp_guanyu"] = "汉寿亭侯",
	["illustrator:sp_guanyu"] = "Zero",
	["danji"] = "单骑",
	[":danji"] = "觉醒技，准备阶段开始时，若你的手牌数大于体力值且本局游戏的主公不是刘备，你减1点体力上限，然后获得技能“马术”和“怒斩”（锁定技，你使用的由一张锦囊牌转化的【杀】不计入限制的次数；你使用的由一张装备牌转化的【杀】造成的伤害+1）。",
	["nuzhan"] = "怒斩",
	[":nuzhan"] = "锁定技，你使用的由一张锦囊牌转化的【杀】不计入限制的次数；你使用的由一张装备牌转化的【杀】的伤害+1。",
	
	-- HuLao Pass
	["Hulaopass"] = "虎牢关模式",
	["HulaoPass"] = "虎牢关",

	["#shenlvbu1"] = "最强神话",
	["shenlvbu1"] = "神吕布(最强神话)",
	["&shenlvbu1"] = "神吕布",
	["illustrator:shenlvbu1"] = "LiuHeng",
	["#shenlvbu2"] = "暴怒的战神",
	["shenlvbu2"] = "神吕布(暴怒的战神)",
	["&shenlvbu2"] = "神吕布",
	["illustrator:shenlvbu2"] = "LiuHeng",
	["#shenlvbu3"] = "神鬼无前",
	["shenlvbu3"] = "神吕布(神鬼无前)",
	["&shenlvbu3"] = "神吕布",
	["illustrator:shenlvbu3"] = "LiuHeng",
	["xiuluo"] = "修罗",
	[":xiuluo"] = "准备阶段开始时，你可弃置与你的判定区里一张牌花色相同的一张牌▶你弃置你的判定区里的与你以此法弃置的牌花色相同的一张牌，可重复此流程。",
	["@xiuluo"] = "是否使用“修罗”，弃置一张与判定区某一张牌花色相同的牌",
	["shenwei"] = "神威",
	[":shenwei"] = "锁定技，①摸牌阶段，你令额定摸牌数+3。②你的手牌上限+3。",
	["shenji"] = "神戟",
	[":shenji"] = "锁定技，若你的装备区里没有武器牌，你使用【杀】的次数上限+1且额定目标数上限+2。",
	["shenqu"] = "神躯",
	[":shenqu"] = "①一名角色的回合开始后，若你的手牌数不小于你的体力上限，你可摸两张牌。②当你受到伤害后，你可使用【桃】（使用方法①）。",
	["@shenqu-peach"] = "“神躯”效果生效，你可以使用一张【桃】",
	["jiwu"] = "极武",
	[":jiwu"] = "出牌阶段限四次，你可弃置一张手牌▶你选择下列技能中你没有的一个：〖强袭〗、〖烈刃〗、〖旋风〗和〖完杀〗。你于此回合内拥有你以此法选择的技能。",
	["@jiwu-choose"] = "极武：请选择获得一项技能",

	["#HulaoTransfigure"] = "%arg 变身为 %arg2, 第二阶段开始！",
	["#Reforming"] = "%from 进入重整状态",
	["#ReformingRecover"] = "%from 在重整状态中回复了 %arg 点体力",
	["#ReformingDraw"] = "%from 在重整状态中摸了 %arg 张牌",
	["#ReformingRevive"] = "%from 从重整状态中复活！",
	["draw_1v3"] = "重整摸牌",
	["weapon_recast"] = "武器重铸",
	["Hulaopass:recover"] = "回复1点体力",
	["Hulaopass:draw"] = "摸一张牌",
	["StageChange"] = "第二阶段",

	["#sp_zhaoyun"] = "白马先锋",
	["sp_zhaoyun"] = "SP赵云",
	["&sp_zhaoyun"] = "赵云",
	["illustrator:sp_zhaoyun"] = "Vincent",
	["designer:sp_zhaoyun"] = "Danny",
	["chongzhen"] = "冲阵",
	[":chongzhen"] = "当你发动“龙胆”使用或打出一张手牌时，你可以获得对方的一张手牌。",

	["#sp_diaochan"] = "暗黑的傀儡师",
	["sp_diaochan"] = "SP貂蝉",
	["&sp_diaochan"] = "貂蝉",
	["illustrator:sp_diaochan"] = "木美人",
	["designer:sp_diaochan"] = "Danny",
	["lihun"] = "离魂",
	[":lihun"] = "出牌阶段限一次，你可以弃置一张牌并选择一名男性角色，你翻面，然后获得该角色的所有手牌，若如此做，出牌阶段结束时，你交给该角色X张牌（X为该角色的体力值）。",
	["LihunGoBack"] = "离魂：请交给目标角色 %arg 张牌",

	["#sp_caoren"] = "险不辞难",
	["sp_caoren"] = "SP曹仁",
	["&sp_caoren"] = "曹仁",
	["illustrator:sp_caoren"] = "张帅",
	["weikui"] = "伪溃",
	[":weikui"] = "出牌阶段限一次，你可以失去1点体力并选择一名有手牌的其他角色，你观看其手牌。若其中：有【闪】，你至其的距离于此回合内视为1，你对其使用无实体牌的【杀】；没有【闪】，你弃置其中的一张牌。",
	["lizhan"] = "励战",
	[":lizhan"] = "结束阶段开始时，你可以令任意名已受伤的角色各摸一张牌。",
	["@lizhan-card"] = "你可以发动“励战”，选择任意数量已受伤的角色",
}

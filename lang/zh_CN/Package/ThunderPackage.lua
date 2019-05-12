-- translation for Thunder Package

return {
	["thunder"] = "雷包",

	
	["#chendao"] = "白毦督",
	["chendao"] = "陈到",
	["illustrator:chendao"] = "王立雄",
	["wanglie"] = "往烈",
	[":wanglie"] = "①你于的出牌阶段内使用的第一张牌无距离关系的限制。②当牌于你的回合内被使用时，若使用者为你，你可令此牌不可被响应，然后你于此回合内不能使用牌。",
	--往烈，阶段有效

	["#zhugezhan"] = "临难死义",
	["zhugezhan"] = "诸葛瞻",
	["illustrator:zhugezhan"] = "zoo",
	["zuilun"] = "罪论",
	[":zuilun"] = "结束阶段开始时，你可将牌堆顶的三张牌扣置入处理区（对你可见）▶若你于此回合内未造成过伤害，你获得1枚“罪”。若你于此回合内弃置过你的牌，你获得1枚“罪”。"..
		"若你不是手牌数最小的角色，你获得1枚“罪”。若你：有“罪”，{你将这些牌中的X张牌置于牌堆顶（X为你的“罪”数），获得剩余的牌，弃所有“罪”。若你以此法弃的“罪”数为3，"..
		"你选择一名其他角色并失去1点体力。其失去1点体力}；没有“罪”，你获得这些牌。",
	["fuyin"] = "父荫",
	[":fuyin"] = "锁定技，当你于当前回合内第一次成为{【杀】或【决斗】}的目标后，若你的手牌数不大于使用者的手牌数，你令此牌对你无效。",
	["@zuilun"] = "请选择要获得的牌，其余的置于牌堆顶",
	["zuilun#up"] = "置于牌堆顶",
	["zuilun#down"] = "获得的牌",
	["@zuilun-choose"] = "罪论：请选择一名角色",

	["#zhoufei"] = "软玉温香",
	["zhoufei"] = "周妃",
	["illustrator:zhoufei"] = "眉毛子",
	["liangyin"] = "良姻",
	[":liangyin"] = "当牌移动后，若这些牌中有原区域不是{武将牌上或武将牌旁}，且目标区域是{武将牌上或武将牌旁}的牌，你可令手牌数大于你的一名角色摸一张牌；"..
		"若这些牌中有原区域是{武将牌上或武将牌旁}，且目标区域是一名角色的手牌区的牌，你可令手牌数小于你的一名角色弃置一张牌。",
	["kongsheng"] = "箜声",
	[":kongsheng"] = "准备阶段开始时，你可将至少一张牌置于武将牌上（均称为“箜”）▶(→)结束阶段开始时，"..
		"{你使用对应的实体牌是一张为装备牌的“箜”的一张非转化牌▷你重复此流程}。你获得所有“箜”。",
	["@liangyin1-invoke"] = "是否使用“良姻”，令一名角色摸一张牌",
	["@liangyin2-invoke"] = "是否使用“良姻”，令一名角色弃一张牌",
	["@liangyin-discard"] = "良姻：请弃置一张牌",
	["harp"] = "箜",
	["@kongsheng-put"] = "是否使用“箜声”，将牌置为“箜”",
	["@kongsheng-use"] = "箜声：请使用“箜”中的一张装备牌",
	["#harp"] = "箜中的装备",

	["#lukang"] = "社稷之瑰宝",
	["lukang"] = "陆抗",
	["illustrator:lukang"] = "zoo",
	["qianjie"] = "谦节",
	[":qianjie"] = "锁定技，①你执行横置操作即你不执行任何操作。②你不是延时锦囊牌的合法目标。③其他角色不能与你拼点。",
	["jueyan"] = "决堰",
	[":jueyan"] = "出牌阶段限一次，你可选择：1.废除武器区，你于此阶段内使用【杀】的次数上限+3；2.废除防具区，你摸三牌，你于此回合内的手牌上限+3；3.废除所有坐骑区，你于此回合内使用牌无距离关系的限制；4.宝物区，你于此阶段内拥有〖集智〗。",
	["poshi"] = "破势",
	[":poshi"] = "觉醒技，准备阶段开始时，若你的所有装备区均已废除或你的体力值为1，你1点体力上限，将手牌补至体力上限，失去〖决堰〗，获得〖怀柔〗。",
	["huairou"] = "怀柔",
	[":huairou"] = "出牌阶段，你可重铸你的一张装备牌。",

	["#haozhao"] = "扣弦的豪将",
	["haozhao"] = "郝昭",
	["illustrator:haozhao"] = "秋呆呆",
	["zhengu"] = "镇骨",
	[":zhengu"] = "结束阶段开始时，你可选择一名其他角色，其将手牌调整至与你相同，然后其下个回合结束后，你令其将手牌调整至与你相同。",
	["@zhengu-invoke"] = "是否发动“镇骨”，选择一名其他角色",
	["@zhengu-discard"] = "镇骨：请弃置%arg张手牌",

	["#guanqiujian"] = "魏功铭征节",
	["guanqiujian"] = "毌丘俭",
	["illustrator:guanqiujian"] = "凝聚永恒",
	["zhengrong"] = "征荣",
	[":zhengrong"] = "当你对其他角色造成伤害后，若其手牌数大于你，你可将其一张牌扣置于武将牌上（称为“荣”）。",
	["hongju"] = "鸿举",
	[":hongju"] = "觉醒技，准备阶段开始时，若“荣”数大于2且角色数小于玩家数▶你可选择至少一张“荣”和你等量的手牌，将你以此法选择的手牌扣置于武将牌上（均称为“荣”），获得你以此法选择的“荣”，减1点体力上限，获得〖清侧〗。",
	["qingce"] = "清侧",
	[":qingce"] = "出牌阶段，你可将一张“荣”置入弃牌堆并选择一名装备区或判定区里有牌的角色▶你弃置其装备区或判定区里的一张牌。",
	["honour"] = "荣",
	["@hongju-exchange"] = "鸿举：是否用手牌交换“荣”（选择%arg张牌作为新的“荣”）",

	["#yuanshu"] = "仲家帝",
	["yuanshu"] = "袁术",
	["illustrator:yuanshu"] = "波子",
	["yongsi"] = "庸肆",
	[":yongsi"] = "锁定技，①摸牌阶段，你令额定摸牌数改为X（X为势力数）。②出牌阶段结束时，若你于此阶段内：未造成过伤害，你将手牌补至X张（X为你的体力值）；造成过的伤害值大于1，你的手牌上限于此回合内为Y（Y为你已损失的体力值）。",
	["weidi"] = "伪帝",
	[":weidi"] = "主公技，弃牌阶段开始时，若X大于0，你可将至多X张手牌分别交给等量的群势力角色（X=你的手牌数-你的手牌上限）。",
	["@weidi-give"] = "是否使用“伪帝”，将手牌交给群雄角色",

	["#zhangxiu"] = "北地枪王",
	["zhangxiu"] = "张绣",
	["illustrator:zhangxiu"] = "PCC",
	["xiongluan"] = "雄乱",
	[":xiongluan"] = "限定技，出牌阶段，你可废除装备区和判定区并选择一名其他角色▶你于此阶段内对其使用牌无距离关系的限制且对包括其在内的角色使用牌无次数限制，且其于此阶段内使用或打出的牌对应的所有实体牌不能均是其手牌区里的牌。",
	["congjian"] = "从谏",
	[":congjian"] = "当你成为锦囊牌的目标后，若目标对应的角色数大于1，你可将一张牌交给一名是此牌的目标对应的角色，若你以此法交给其的牌：为装备牌，你摸两张牌；不为装备牌，你摸一张牌。",
	["@congjian-give"] = "是否使用“从谏”，将一张牌交给一个目标",
}

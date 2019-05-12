-- this script to store the basic configuration for game program itself
-- and it is a little different from config.ini

config = {
	big_font = 56,
	small_font = 27,
	tiny_font = 18,
	kingdoms = { "wei", "shu", "wu", "qun", "god"},
	kingdom_colors = {
		wei = "#547998",
		shu = "#D0796C",
		wu = "#4DB873",
		qun = "#8A807A",
		god = "#96943D",
	},

	skill_type_colors = {
		compulsoryskill = "#0000FF",
		limitedskill = "#FF0000",
		wakeskill = "#800080",
		lordskill = "#FFA500",
		oppphskill = "#008000",
		transferskill = "#00FFFF",
	},

	package_names = {
		"StandardCard",
		"StandardExCard",
		"Maneuvering",
		"LimitationBroken",
		"DerivativeCard",
        "BestLoyalistCard",
        "CompeteWorldCard",
		"New3v3Card",
		"New3v3_2013Card",
		"New1v1Card",

		"Standard",
		"Wind",
		"Fire",
		"Thicket",
		"Mountain",
		"Shadow",
		"Thunder",
		"God",
		"YJCM",
		"YJCM2012",
		"YJCM2013",
		"YJCM2014",
		"YJCM2015",
		"YJCM2016",
		"YJCM2017",
		"Spark1",
		"Spark2",
		"Spark3",
		"Spark4",
		"Spark5",
		"Spark6",
		"SP",
		"OL",
		"MOL",
		"Chaos",
        "CompeteWorld",
		"GuanduWar",
		"Miscellaneous",
		"NostalStandard",
		"NostalWind",
		"NostalYJCM",
		"NostalYJCM2012",
		"NostalYJCM2013",
        "BestLoyalist",
		"JianGeDefense",
		"BossMode",
		"TrialOfGod",
		"Special3v3",
		"Special3v3Ext",
		"Special1v1",
		"Special1v1Ext",
		"Test"
	},

	hulao_generals = {
		"package:nostal_standard",
		"package:standard",
		"package:wind",
		"package:nostal_wind",
		"zhenji", "zhugeliang", "sunquan", "sunshangxiang",
		"-zhangjiao", "-zhoutai", "-caoren", "-yuji",
		"-nos_yuji"
	},

	xmode_generals = {
		"package:nostal_standard",
		"package:wind",
		"package:fire",
		"package:nostal_wind",
		"zhenji", "zhugeliang", "sunquan", "sunshangxiang",
		"-nos_huatuo",
		"-zhangjiao", "-zhoutai", "-caoren", "-yuji",
		"-nos_zhangjiao", "-nos_yuji"
	},

	easy_text = {
		"太慢了，做两个俯卧撑吧！",
		"快点吧，我等的花儿都谢了！",
		"高，实在是高！",
		"好手段，可真不一般啊！",
		"哦，太菜了。水平有待提高。",
		"你会不会玩啊？！",
		"嘿，一般人，我不使这招。",
		"呵，好牌就是这么打地！",
		"杀！神挡杀神！佛挡杀佛！",
		"你也忒坏了吧？！"
	},

	roles_ban = {
	},

	kof_ban = {
		"sunquan",
	},

	bossmode_ban = {
		"caopi",
		"manchong",
		"xusheng",
		"yuji",
		"caiwenji",
		"zuoci",
		"lusu",
		"bgm_diaochan",
		"shenguanyu",
		"nos_yuji",
		"nos_zhuran"
	},

	basara_ban = {
		"dongzhuo",
		"zuoci",
		"shenzhugeliang",
		"shenlvbu",
		"bgm_lvmeng",
		"zhanggongqi"
	},
	
	hegemony_ban = {
		"xiahoujuan"
	},

	pairs_ban = {
		"huatuo", "zuoci", "bgm_pangtong", "kof_nos_huatuo", "nos_huatuo",
		"simayi+dengai",
		"xiahoudun+luxun", "xiahoudun+zhurong", "xiahoudun+zhangchunhua", "xiahoudun+nos_luxun", "xiahoudun+nos_zhangchunhua",
		"caoren+shenlvbu", "caoren+caozhi", "caoren+bgm_diaochan", "caoren+bgm_caoren", "caoren+nos_caoren",
		"guojia+dengai",
		"zhenji+zhangjiao", "zhenji+nos_zhangjiao", "zhenji+nos_wangyi",
		"zhanghe+yuanshu",
		"dianwei+weiyan",
		"dengai+zhangjiao", "dengai+shensimayi", "dengai+zhugejin", "dengai+nos_simayi", "dengai+nos_guojia", "dengai+nos_zhangjiao",
		"zhangfei+zhangchunhua", "zhangfei+nos_huanggai", "zhangfei+nos_zhangchunhua",
		"zhugeliang+xushu", "zhugeliang+nos_xushu",
		"huangyueying+wolong", "huangyueying+ganning", "huangyueying+yuanshao", "huangyueying+yanliangwenchou", "huangyueying+nos_huanggai",
		"huangzhong+xusheng",
		"weiyan+nos_huanggai",
		"wolong+luxun", "wolong+zhangchunhua", "wolong+nos_huangyueying", "wolong+nos_luxun", "wolong+nos_zhangchunhua",
		"menghuo+dongzhuo", "menghuo+zhugedan", "menghuo+heg_dongzhuo",
		"sunquan+sunshangxiang",
		"ganning+nos_huangyueying",
		"lvmeng+yuanshu",
		"huanggai+nos_huanggai",
		"luxun+yanliangwenchou", "luxun+guanxingzhangbao", "luxun+guanping", "luxun+guyong",
		    "luxun+nos_liubei", "luxun+nos_yuji", "luxun+nos_guanxingzhangbao",
		"sunshangxiang+shensimayi", "sunshangxiang+heg_luxun", "sunshangxiang+nos_huanggai",
		"sunce+guanxingzhangbao", "sunce+nos_guanxingzhangbao",
		"xiaoqiao+zhangchunhua", "xiaoqiao+nos_zhangchunhua",
		"yuanshao+nos_huangyueying", "yuanshao+nos_huanggai",
		"yanliangwenchou+zhangchunhua", "yanliangwenchou+nos_huangyueying", "yanliangwenchou+nos_huanggai", "yanliangwenchou+nos_luxun",
		    "yanliangwenchou+nos_zhangchunhua",
		"dongzhuo+shenzhaoyun", "dongzhuo+wangyi", "dongzhuo+diy_wangyuanji", "dongzhuo+nos_huanggai", "dongzhuo+nos_zhangchunhua", "dongzhuo+nos_wangyi",
		"st_huaxiong+nos_huanggai",
		"shencaocao+caozhi",
		"shenlvbu+caozhi", "shenlvbu+liaohua", "shenlvbu+bgm_diaochan", "shenlvbu+bgm_caoren", "shenlvbu+nos_caoren",
		"shenzhaoyun+huaxiong", "shenzhaoyun+zhugedan", "shenzhaoyun+heg_dongzhuo",
		"caozhi+bgm_diaochan", "caozhi+bgm_caoren", "caozhi+nos_caoren",
		"gaoshun+zhangchunhua", "gaoshun+nos_zhangchunhua",
		"wuguotai+zhangchunhua", "wuguotai+caochong", "wuguotai+nos_huanggai", "wuguotai+nos_zhangchunhua", "wuguotai+nos_caochong",
		"zhangchunhua+guanxingzhangbao", "zhangchunhua+guanping", "zhangchunhua+guyong", "zhangchunhua+xiahouba", "zhangchunhua+zhugeke",
		    "zhangchunhua+heg_luxun", "zhangchunhua+neo_zhangfei", "zhangchunhua+nos_liubei", "zhangchunhua+nos_zhangfei",
		    "zhangchunhua+nos_yuji", "zhangchunhua+nos_guanxingzhangbao",
		"guanxingzhangbao+bgm_zhangfei", "guanxingzhangbao+heg_sunce", "guanxingzhangbao+nos_huanggai", "guanxingzhangbao+nos_luxun", "guanxingzhangbao+nos_zhangchunhua",
		"huaxiong+nos_huanggai",
		"liaohua+bgm_diaochan",
		"wangyi+zhugedan", "wangyi+heg_dongzhuo",
		"guanping+nos_luxun", "guanping+nos_zhangchunhua",
		"guyong+nos_luxun", "guyong+nos_zhangchunhua",
		"yuanshu+nos_lvmeng",
		"xiahouba+nos_huanggai", "xiahouba+nos_zhangchunhua",
		"zhugedan+diy_wangyuanji", "zhugedan+nos_zhangchunhua", "zhugedan+nos_wangyi",
		"zhugeke+nos_zhangchunhua",
		"bgm_diaochan+bgm_caoren", "bgm_diaochan+nos_caoren",
		"bgm_caoren+nos_caoren",
		"bgm_zhangfei+nos_guanxingzhangbao",
		"diy_wangyuanji+heg_dongzhuo",
		"hetaihou+nos_zhuran",
		"heg_sunce+nos_guanxingzhangbao",
		"heg_dongzhuo+nos_zhangchunhua", "heg_dongzhuo+nos_wangyi",
		"neo_zhangfei+nos_huanggai", "neo_zhangfei+nos_zhangchunhua",
		"nos_liubei+nos_luxun", "nos_liubei+nos_zhangchunhua",
		"nos_zhangfei+nos_huanggai", "nos_zhangfei+nos_zhangchunhua",
		"nos_huangyueying+nos_huanggai",
		"nos_huanggai+nos_guanxingzhangbao",
		"nos_luxun+nos_yuji", "nos_luxun+nos_guanxingzhangbao",
		"nos_yuji+nos_zhangchunhua",
		"nos_zhangchunhua+heg_luxun", "nos_zhangchunhua+nos_guanxingzhangbao",
	},
	
	couple_lord = "caocao",
	couple_couples = {
		"caopi|caozhi+zhenji",
		"simayi|shensimayi+zhangchunhua",
		"diy_simazhao+diy_wangyuanji",
		"liubei|bgm_liubei+ganfuren|mifuren|sp_sunshangxiang",
		"liushan+xingcai",
		"zhugeliang|wolong|shenzhugeliang+huangyueying",
		"menghuo+zhurong",
		"zhouyu|shenzhouyu+xiaoqiao",
		"lvbu|shenlvbu+diaochan|bgm_diaochan",
		"sunjian+wuguotai",
		"sunce|heg_sunce+daqiao|bgm_daqiao",
		"sunquan+bulianshi",
		"liuxie|diy_liuxie+fuhuanghou",
		"luxun|heg_luxun+sunru",
		"liubiao+caifuren",
	},
	convert_pairs = {
		"caocao->nos_caocao",
		"simayi->nos_simayi",
		"xiahoudun->nos_xiahoudun",
		"zhangliao->nos_zhangliao",
		"xuchu->nos_xuchu",
		"guojia->nos_guojia",
		"liubei->nos_liubei",
		"guanyu->nos_guanyu|sp_guanyu",
		"zhangfei->nos_zhangfei",
		"zhaoyun->nos_zhaoyun|sp_zhaoyun",
		"machao->nos_machao|sp_machao",
		"huangyueying->nos_huangyueying|sp_huangyueying",
	    "zhouyu->nos_zhouyu",
		"huanggai->nos_huanggai",
		"lvmeng->nos_lvmeng",
		"ganning->nos_ganning",
		"sunshangxiang->sp_sunshangxiang",
		"luxun->nos_luxun",
		"daqiao->nos_daqiao",
		"huatuo->nos_huatuo",
		"diaochan->nos_diaochan|sp_diaochan",
		"lvbu->nos_lvbu",
		"caoren->nos_caoren|sp_caoren",
		"zhoutai->nos_zhoutai",
		"yuji->nos_yuji",
		"zhangjiao->nos_zhangjiao",
		"pangde->sp_pangde",
		"jiaxu->sp_jiaxu",
		"jiangwei->sp_jiangwei",
		"caiwenji->sp_caiwenji",
		"fazheng->nos_fazheng",
		"lingtong->nos_lingtong",
		"masu->nos_masu",
		"xusheng->nos_xusheng",
		"xushu->nos_xushu|yj_xushu",
		"yujin->nos_yujin",
		"zhangchunhua->nos_zhangchunhua",
		"bulianshi->nos_bulianshi",
		"guanxingzhangbao->nos_guanxingzhangbao",
		"handang->nos_handang",
		"liubiao->nos_liubiao",
		"madai->nos_madai",
		"wangyi->nos_wangyi",
		"huaxiong->yj_huaxiong",
		"caochong->nos_caochong",
		"fuhuanghou->nos_fuhuanghou",
		"liru->nos_liru",
		"zhuran->nos_zhuran",
		"yuanshu->sp_yuanshu",
		"xiahouyuan->new_xiahouyuan",
		"huangzhong->new_huangzhong",
		"weiyan->new_weiyan",
		"xiaoqiao->new_xiaoqiao",
		"dianwei->new_dianwei",
		"pangtong->new_pangtong",
		"yuanshao->new_yuanshao",
		"menghuo->new_menghuo",
		"zhurong->new_zhurong",
		"sunjian->new_sunjian",
		"lusu->new_lusu",
	},

	removed_hidden_generals = {
	},

	extra_hidden_generals = {
	},

	removed_default_lords = {
	},

	extra_default_lords = {
	},

	bossmode_default_boss = {
		"boss_chi+boss_mei+boss_wang+boss_liang",
		"boss_niutou+boss_mamian",
		"boss_heiwuchang+boss_baiwuchang",
		"boss_luocha+boss_yecha"
	},

	bossmode_endless_skills = {
		"bossguimei", "bossdidong", "nosenyuan", "bossshanbeng+bossbeiming+huilei+bossmingbao",
		"bossluolei", "bossguihuo", "bossbaolian", "mengjin", "bossmanjia+bazhen",
		"bossxiaoshou", "bossguiji", "fankui", "bosslianyu", "nosjuece",
		"bosstaiping+shenwei", "bosssuoming", "bossxixing", "bossqiangzheng",
		"bosszuijiu", "bossmodao", "bossqushou", "yizhong", "kuanggu",
		"bossmojian", "bossdanshu", "shenji", "wushuang", "wansha"
	},
	
	jiange_defense_kingdoms = {
		loyalist = "shu",
		rebel = "wei",
	},

	jiange_defense_machine = {
		wei = "jg_machine_tuntianchiwen+jg_machine_shihuosuanni+jg_machine_fudibian+jg_machine_lieshiyazi",
		shu = "jg_machine_yunpingqinglong+jg_machine_jileibaihu+jg_machine_lingjiaxuanwu+jg_machine_chiyuzhuque",
	},

	jiange_defense_soul = {
		wei = "jg_soul_caozhen+jg_soul_simayi+jg_soul_xiahouyuan+jg_soul_zhanghe",
		shu = "jg_soul_liubei+jg_soul_zhugeliang+jg_soul_huangyueying+jg_soul_pangtong",
	},
    
    best_loyalist_sets = {
        first = "cuiyan+huangfusong",
        seconds = "dianwei+caoang+xuchu+zhangfei+zhaoyun+jiangwei+huanggai+zumao+zhoutai+chengong+diaochan+jvshou",
        cards_ban = "snatch+supply_shortage+amazing_grace+ex_nihilo",
    },

    zdyj_ban = {
        "cuiyan",
        "xuhuang",
        "dengai",
        "hanhaoshihuan",
        "yuji",
        "nos_yuji",
        "sp_guanyu",
        "zuoci",
        "yuanshu",
        "huanghao",
    }
}

-- MySQL dump 10.13  Distrib 8.0.27, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: sqs
-- ------------------------------------------------------
-- Server version	8.0.27

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `account`
--

DROP TABLE IF EXISTS `account`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `account` (
  `u_id` int NOT NULL,
  `account` varchar(20) NOT NULL,
  `password` varchar(20) NOT NULL,
  PRIMARY KEY (`u_id`,`account`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `account`
--

LOCK TABLES `account` WRITE;
/*!40000 ALTER TABLE `account` DISABLE KEYS */;
/*!40000 ALTER TABLE `account` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `course`
--

DROP TABLE IF EXISTS `course`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `course` (
  `c_id` int NOT NULL,
  `c_name` varchar(255) NOT NULL DEFAULT '',
  `t_id` int NOT NULL,
  PRIMARY KEY (`c_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `course`
--

LOCK TABLES `course` WRITE;
/*!40000 ALTER TABLE `course` DISABLE KEYS */;
INSERT INTO `course` VALUES (1001,'语文',1223),(1002,'数学',1224),(1003,'英语',1225);
/*!40000 ALTER TABLE `course` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order`
--

DROP TABLE IF EXISTS `order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order` (
  `order_id` bigint NOT NULL COMMENT '订单ID',
  `user_id` bigint NOT NULL COMMENT '用户ID',
  `order_date` datetime DEFAULT NULL COMMENT '下单时间',
  `payment_status` varchar(20) DEFAULT NULL COMMENT '支付状态',
  `order_amount` decimal(10,2) DEFAULT NULL COMMENT '订单金额',
  `recipient_name` varchar(100) DEFAULT NULL COMMENT '收货人信息',
  `recipient_phone` varchar(20) DEFAULT NULL COMMENT '商品信息',
  `shipping_address` varchar(255) DEFAULT NULL COMMENT '物流信息',
  `product_id` bigint NOT NULL COMMENT '商品ID',
  `logistics_status` varchar(20) DEFAULT NULL COMMENT '订单状态',
  `logistics_company` varchar(100) DEFAULT NULL,
  `waybill_number` varchar(100) DEFAULT NULL,
  `order_status` varchar(20) DEFAULT NULL,
  `remarks` text,
  `product_info` json DEFAULT NULL COMMENT '商品信息JSON对象',
  PRIMARY KEY (`order_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order`
--

LOCK TABLES `order` WRITE;
/*!40000 ALTER TABLE `order` DISABLE KEYS */;
INSERT INTO `order` VALUES (1689433837607,1,'2023-07-15 15:10:37','1',4800.00,NULL,NULL,NULL,4,NULL,NULL,NULL,NULL,NULL,'{\"hp\": \"604.0000\", \"mp\": \"333.0000\", \"camp\": \"\", \"crit\": \"0.0000\", \"name\": \"卡牌大师\", \"alias\": \"TwistedFate\", \"armor\": \"21.0000\", \"magic\": \"6\", \"roles\": [\"mage\"], \"style\": \"7\", \"title\": \"崔斯特\", \"attack\": \"6\", \"campId\": \"\", \"damage\": \"3\", \"heroId\": \"4\", \"defense\": \"2\", \"hpregen\": \"5.5000\", \"mpregen\": \"8.0000\", \"utility\": \"2\", \"allytips\": [\"-\"], \"banAudio\": \"https://game.gtimg.cn/images/lol/act/img/vo/ban/4.ogg\", \"keywords\": \"卡牌大师,崔斯特,卡牌,TwistedFate,kp,cst,kpds,kapaidashi,cuisite,kapai\", \"mobility\": \"2\", \"shortBio\": \"崔斯特是一名声名狼藉的诈骗惯犯，他让那些富人既羡慕又嫉恨，这世上任何有人烟之地都有过这位纸牌高手施展“魅力”与赌艺的足迹。他鲜少会认真干一件事，总是用一抹轻蔑的微笑和一副漫不经心的样子面对每一天。但无论什么情况，崔斯特的袖子里永远都会藏着一张王牌。\", \"enemytips\": [\"-\"], \"goldPrice\": \"4800\", \"introduce\": \"\", \"movespeed\": \"330.0000\", \"relations\": [], \"damageType\": \"kMagic\", \"difficulty\": \"9\", \"durability\": \"1\", \"hpperlevel\": \"108.0000\", \"isWeekFree\": \"0\", \"mpperlevel\": \"39.0000\", \"spellblock\": \"30.0000\", \"attackrange\": \"525.0000\", \"attackspeed\": \"0.6510\", \"changeLabel\": \"无改动\", \"couponPrice\": \"2500\", \"difficultyL\": \"2\", \"selectAudio\": \"https://game.gtimg.cn/images/lol/act/img/vo/choose/4.ogg\", \"attackdamage\": \"52.0000\", \"critperlevel\": \"0.0000\", \"crowdControl\": \"2\", \"armorperlevel\": \"4.3500\", \"heroVideoPath\": \"\", \"hpregenperlevel\": \"0.6000\", \"mpregenperlevel\": \"0.8000\", \"palmHeroHeadImg\": \"https://game.gtimg.cn/images/lol/act/img/zmheropage/4.jpg\", \"spellblockperlevel\": \"1.3000\", \"attackspeedperlevel\": \"3.2200\", \"attackdamageperlevel\": \"3.3000\"}'),(1689435658750,1,'2023-07-15 15:40:58','1',1350.00,NULL,NULL,NULL,24,NULL,NULL,NULL,NULL,NULL,'{\"hp\": \"665.0000\", \"mp\": \"339.0000\", \"camp\": \"\", \"crit\": \"0.0000\", \"name\": \"武器大师\", \"alias\": \"Jax\", \"armor\": \"36.0000\", \"magic\": \"7\", \"roles\": [\"fighter\", \"assassin\"], \"style\": \"2\", \"title\": \"贾克斯\", \"attack\": \"7\", \"campId\": \"\", \"damage\": \"3\", \"heroId\": \"24\", \"defense\": \"5\", \"hpregen\": \"8.5000\", \"mpregen\": \"7.6000\", \"utility\": \"1\", \"allytips\": [\"-\"], \"banAudio\": \"https://game.gtimg.cn/images/lol/act/img/vo/ban/24.ogg\", \"keywords\": \"武器大师,贾克斯,武器,Jax,wq,jks,wqds,wuqidashi,jiakesi,wuqi\", \"mobility\": \"2\", \"shortBio\": \"无论是各种兵器的攻防技法，还是挖苦嘲讽的刻薄口才，贾克斯都无人能及。他是目前已知的最后一名艾卡西亚武器大师。曾经，故土的人们因狂妄自大而引来了虚空，导致家园被夷为平地，在那之后，贾克斯和幸存的同胞们发誓要保护仅存的一切。如今，魔法再次涌起，沉睡的威胁也再次被触动，于是贾克斯开始在瓦洛兰大陆上四处漫游。他手握艾卡西亚最后的光明，考验他遇到的每一名战士，为的是寻找与自己不相伯仲的强者，并肩作战。\", \"enemytips\": [\"-\"], \"goldPrice\": \"1350\", \"introduce\": \"\", \"movespeed\": \"350.0000\", \"relations\": [], \"damageType\": \"kMixed\", \"difficulty\": \"5\", \"durability\": \"2\", \"hpperlevel\": \"100.0000\", \"isWeekFree\": \"0\", \"mpperlevel\": \"52.0000\", \"spellblock\": \"32.0000\", \"attackrange\": \"125.0000\", \"attackspeed\": \"0.6380\", \"changeLabel\": \"改动英雄\", \"couponPrice\": \"2000\", \"difficultyL\": \"2\", \"selectAudio\": \"https://game.gtimg.cn/images/lol/act/img/vo/choose/24.ogg\", \"attackdamage\": \"68.0000\", \"critperlevel\": \"0.0000\", \"crowdControl\": \"2\", \"armorperlevel\": \"4.2000\", \"heroVideoPath\": \"\", \"hpregenperlevel\": \"0.5500\", \"mpregenperlevel\": \"0.7000\", \"palmHeroHeadImg\": \"https://game.gtimg.cn/images/lol/act/img/zmheropage/24.jpg\", \"spellblockperlevel\": \"2.0500\", \"attackspeedperlevel\": \"3.4000\", \"attackdamageperlevel\": \"4.2500\"}'),(1689435685074,1,'2023-07-15 15:41:25','1',4800.00,NULL,NULL,NULL,117,NULL,NULL,NULL,NULL,NULL,'{\"hp\": \"595.0000\", \"mp\": \"350.0000\", \"camp\": \"\", \"crit\": \"0.0000\", \"name\": \"仙灵女巫\", \"alias\": \"Lulu\", \"armor\": \"26.0000\", \"magic\": \"7\", \"roles\": [\"support\", \"mage\"], \"style\": \"8\", \"title\": \"璐璐\", \"attack\": \"4\", \"campId\": \"\", \"damage\": \"2\", \"heroId\": \"117\", \"defense\": \"5\", \"hpregen\": \"6.0000\", \"mpregen\": \"11.0000\", \"utility\": \"3\", \"allytips\": [\"-\"], \"banAudio\": \"https://game.gtimg.cn/images/lol/act/img/vo/ban/117.ogg\", \"keywords\": \"仙灵女巫,璐璐,ll,xlnw,Lulu,xianlingnvwu,lulu\", \"mobility\": \"1\", \"shortBio\": \"璐璐是一位约德尔女巫，最著名的能力是操纵梦境般的幻觉和召唤各种奇异的小动物。在小仙灵皮克斯的陪伴下，璐璐在符文之地上四处云游。她会突发奇想地重塑现实，改变世界的本质结构，改造这个平凡的物质领域中任何让她感觉是限制的东西。虽然其他人对她的魔法颇有微词，往好听了说是一种异象，往难听了说是一种危害。但是璐璐始终认为，一点魔力的启发对任何人都没有坏处。\", \"enemytips\": [\"-\"], \"goldPrice\": \"4800\", \"introduce\": \"\", \"movespeed\": \"330.0000\", \"relations\": [], \"damageType\": \"kMagic\", \"difficulty\": \"5\", \"durability\": \"1\", \"hpperlevel\": \"88.0000\", \"isWeekFree\": \"0\", \"mpperlevel\": \"55.0000\", \"spellblock\": \"30.0000\", \"attackrange\": \"550.0000\", \"attackspeed\": \"0.6250\", \"changeLabel\": \"改动英雄\", \"couponPrice\": \"3500\", \"difficultyL\": \"2\", \"selectAudio\": \"https://game.gtimg.cn/images/lol/act/img/vo/choose/117.ogg\", \"attackdamage\": \"47.0000\", \"critperlevel\": \"0.0000\", \"crowdControl\": \"2\", \"armorperlevel\": \"4.9000\", \"heroVideoPath\": \"\", \"hpregenperlevel\": \"0.6000\", \"mpregenperlevel\": \"0.6000\", \"palmHeroHeadImg\": \"https://game.gtimg.cn/images/lol/act/img/zmheropage/117.jpg\", \"spellblockperlevel\": \"1.3000\", \"attackspeedperlevel\": \"2.2500\", \"attackdamageperlevel\": \"2.6000\"}'),(1689435693509,1,'2023-07-15 15:41:33','1',450.00,NULL,NULL,NULL,17,NULL,NULL,NULL,NULL,NULL,'{\"hp\": \"598.0000\", \"mp\": \"334.0000\", \"camp\": \"\", \"crit\": \"0.0000\", \"name\": \"迅捷斥候\", \"alias\": \"Teemo\", \"armor\": \"24.0000\", \"magic\": \"7\", \"roles\": [\"marksman\", \"assassin\"], \"style\": \"4\", \"title\": \"提莫\", \"attack\": \"5\", \"campId\": \"\", \"damage\": \"3\", \"heroId\": \"17\", \"defense\": \"3\", \"hpregen\": \"5.5000\", \"mpregen\": \"9.6000\", \"utility\": \"2\", \"allytips\": [\"-\"], \"banAudio\": \"https://game.gtimg.cn/images/lol/act/img/vo/ban/17.ogg\", \"keywords\": \"迅捷斥候,提莫,timo,Teemo,tm,xjch,xunjiechihou,timo\", \"mobility\": \"1\", \"shortBio\": \"不畏艰难险阻、不惧坎坷危途，提莫怀着无比的热情和欢欣的精神探索着整个世界。作为一个约德尔人，他对自己的道德观坚定不移，也对班德尔斥候的信条倍感自豪，有时候，过分的热忱甚至会让他无法看到自己的行为将会导致什么样的后果。虽然有人认为，“班德尔斥候小队”是否真实存在还有待商榷，但有一件事可以肯定，那就是提莫的信念。\", \"enemytips\": [\"-\"], \"goldPrice\": \"450\", \"introduce\": \"\", \"movespeed\": \"330.0000\", \"relations\": [], \"damageType\": \"kMagic\", \"difficulty\": \"6\", \"durability\": \"1\", \"hpperlevel\": \"104.0000\", \"isWeekFree\": \"0\", \"mpperlevel\": \"25.0000\", \"spellblock\": \"30.0000\", \"attackrange\": \"500.0000\", \"attackspeed\": \"0.6900\", \"changeLabel\": \"无改动\", \"couponPrice\": \"1000\", \"difficultyL\": \"1\", \"selectAudio\": \"https://game.gtimg.cn/images/lol/act/img/vo/choose/17.ogg\", \"attackdamage\": \"54.0000\", \"critperlevel\": \"0.0000\", \"crowdControl\": \"2\", \"armorperlevel\": \"4.9500\", \"heroVideoPath\": \"\", \"hpregenperlevel\": \"0.6500\", \"mpregenperlevel\": \"0.4500\", \"palmHeroHeadImg\": \"https://game.gtimg.cn/images/lol/act/img/zmheropage/17.jpg\", \"spellblockperlevel\": \"1.3000\", \"attackspeedperlevel\": \"3.3800\", \"attackdamageperlevel\": \"3.0000\"}'),(1689435702384,1,'2023-07-15 15:41:42','1',450.00,NULL,NULL,NULL,22,NULL,NULL,NULL,NULL,NULL,'{\"hp\": \"640.0000\", \"mp\": \"280.0000\", \"camp\": \"弗雷尔卓德\", \"crit\": \"0.0000\", \"name\": \"寒冰射手\", \"alias\": \"Ashe\", \"armor\": \"26.0000\", \"magic\": \"2\", \"roles\": [\"marksman\", \"support\"], \"style\": \"3\", \"title\": \"艾希\", \"attack\": \"7\", \"campId\": \"11\", \"damage\": \"2\", \"heroId\": \"22\", \"defense\": \"3\", \"hpregen\": \"3.5000\", \"mpregen\": \"7.0000\", \"utility\": \"2\", \"allytips\": [\"-\"], \"banAudio\": \"https://game.gtimg.cn/images/lol/act/img/vo/ban/22.ogg\", \"keywords\": \"艾希,寒冰,爱射,艾射,冰弓,Ashe,aixi,hanbing,aishe,aishe,binggong,ax,hb,as,bg\", \"mobility\": \"1\", \"shortBio\": \"作为阿瓦罗萨部族的战母，拥有寒冰血脉的艾希率领着这个北方人数最多的部落。她克己、智慧、忠于理想，但并不太适应自己作为领袖的角色。艾希与自己血脉中蕴藏的先祖魔法相通，挽起了臻冰打造的长弓，她的族人相信她就是神话中的女英雄阿瓦罗萨的转世。在人们的追随下，艾希渴望夺回那些属于部族的古代领土，让伟大的弗雷尔卓德再次实现统一。\", \"enemytips\": [\"-\"], \"goldPrice\": \"450\", \"introduce\": \"\", \"movespeed\": \"325.0000\", \"relations\": [], \"damageType\": \"kPhysical\", \"difficulty\": \"4\", \"durability\": \"1\", \"hpperlevel\": \"101.0000\", \"isWeekFree\": \"0\", \"mpperlevel\": \"35.0000\", \"spellblock\": \"30.0000\", \"attackrange\": \"600.0000\", \"attackspeed\": \"0.6580\", \"changeLabel\": \"改动英雄\", \"couponPrice\": \"1000\", \"difficultyL\": \"1\", \"selectAudio\": \"https://game.gtimg.cn/images/lol/act/img/vo/choose/22.ogg\", \"attackdamage\": \"59.0000\", \"critperlevel\": \"0.0000\", \"crowdControl\": \"3\", \"armorperlevel\": \"4.6000\", \"heroVideoPath\": \"\", \"hpregenperlevel\": \"0.5500\", \"mpregenperlevel\": \"0.6500\", \"palmHeroHeadImg\": \"https://game.gtimg.cn/images/lol/act/img/zmheropage/22.jpg\", \"spellblockperlevel\": \"1.3000\", \"attackspeedperlevel\": \"3.3300\", \"attackdamageperlevel\": \"2.9500\"}'),(1689435718225,1,'2023-07-15 15:41:58','1',1350.00,NULL,NULL,NULL,157,NULL,NULL,NULL,NULL,NULL,'{\"hp\": \"590.0000\", \"mp\": \"100.0000\", \"camp\": \"\", \"crit\": \"0.0000\", \"name\": \"疾风剑豪\", \"alias\": \"Yasuo\", \"armor\": \"30.0000\", \"magic\": \"4\", \"roles\": [\"fighter\", \"assassin\"], \"style\": \"3\", \"title\": \"亚索\", \"attack\": \"8\", \"campId\": \"\", \"damage\": \"3\", \"heroId\": \"157\", \"defense\": \"4\", \"hpregen\": \"6.5000\", \"mpregen\": \"0.0000\", \"utility\": \"2\", \"allytips\": [\"-\"], \"banAudio\": \"https://game.gtimg.cn/images/lol/act/img/vo/ban/157.ogg\", \"keywords\": \"疾风剑豪,剑豪,亚索,Yasuo,ys,jh,jfjh,jifengjianhao,jianhao,yasuo\", \"mobility\": \"3\", \"shortBio\": \"亚索是一个百折不屈的艾欧尼亚人，也是一名身手敏捷的御风剑客。这位生性自负的年轻人，被误认作杀害长老的凶手——无法自证清白的亚索因此出于自卫而出手杀死了自己的哥哥。之后，虽然长老死亡的真相已然大白，但亚索并无法原谅自己的所作所为。他将自己放逐于天涯，听任疾风指引着剑刃的方向。\", \"enemytips\": [\"-\"], \"goldPrice\": \"1350\", \"introduce\": \"\", \"movespeed\": \"345.0000\", \"relations\": [], \"damageType\": \"kPhysical\", \"difficulty\": \"10\", \"durability\": \"1\", \"hpperlevel\": \"110.0000\", \"isWeekFree\": \"0\", \"mpperlevel\": \"0.0000\", \"spellblock\": \"32.0000\", \"attackrange\": \"175.0000\", \"attackspeed\": \"0.6970\", \"changeLabel\": \"改动英雄\", \"couponPrice\": \"2000\", \"difficultyL\": \"3\", \"selectAudio\": \"https://game.gtimg.cn/images/lol/act/img/vo/choose/157.ogg\", \"attackdamage\": \"60.0000\", \"critperlevel\": \"0.0000\", \"crowdControl\": \"2\", \"armorperlevel\": \"4.6000\", \"heroVideoPath\": \"\", \"hpregenperlevel\": \"0.9000\", \"mpregenperlevel\": \"0.0000\", \"palmHeroHeadImg\": \"https://game.gtimg.cn/images/lol/act/img/zmheropage/157.jpg\", \"spellblockperlevel\": \"2.0500\", \"attackspeedperlevel\": \"3.5000\", \"attackdamageperlevel\": \"3.0000\"}'),(1689436133416,1,'2023-07-15 15:48:53','1',1350.00,NULL,NULL,NULL,5,NULL,NULL,NULL,NULL,NULL,'{\"hp\": \"640.0000\", \"mp\": \"274.0000\", \"camp\": \"\", \"crit\": \"0.0000\", \"name\": \"德邦总管\", \"alias\": \"XinZhao\", \"armor\": \"35.0000\", \"magic\": \"3\", \"roles\": [\"fighter\", \"assassin\"], \"style\": \"4\", \"title\": \"赵信\", \"attack\": \"8\", \"campId\": \"\", \"damage\": \"2\", \"heroId\": \"5\", \"defense\": \"6\", \"hpregen\": \"8.0000\", \"mpregen\": \"7.2500\", \"utility\": \"1\", \"allytips\": [\"-\"], \"banAudio\": \"https://game.gtimg.cn/images/lol/act/img/vo/ban/5.ogg\", \"keywords\": \"德邦总管,德邦,赵信,XinZhao,db,dbzg,zx,debangzongguan,debang,zhaoxin\", \"mobility\": \"2\", \"shortBio\": \"赵信是效忠于光盾王朝的坚毅勇士。他曾经沦落于诺克萨斯的角斗场，在无数次角斗中得以幸存。被德玛西亚军队解救以后，他便立誓为这群勇敢的解放者奉献生命和忠诚。如今手持三爪长枪的赵信，正为自己的第二祖国而战，一往无前，暴虎冯河。\", \"enemytips\": [\"-\"], \"goldPrice\": \"1350\", \"introduce\": \"\", \"movespeed\": \"345.0000\", \"relations\": [], \"damageType\": \"kPhysical\", \"difficulty\": \"2\", \"durability\": \"2\", \"hpperlevel\": \"106.0000\", \"isWeekFree\": \"0\", \"mpperlevel\": \"55.0000\", \"spellblock\": \"32.0000\", \"attackrange\": \"175.0000\", \"attackspeed\": \"0.6450\", \"changeLabel\": \"无改动\", \"couponPrice\": \"2000\", \"difficultyL\": \"1\", \"selectAudio\": \"https://game.gtimg.cn/images/lol/act/img/vo/choose/5.ogg\", \"attackdamage\": \"63.0000\", \"critperlevel\": \"0.0000\", \"crowdControl\": \"2\", \"armorperlevel\": \"4.7000\", \"heroVideoPath\": \"\", \"hpregenperlevel\": \"0.7000\", \"mpregenperlevel\": \"0.4500\", \"palmHeroHeadImg\": \"https://game.gtimg.cn/images/lol/act/img/zmheropage/5.jpg\", \"spellblockperlevel\": \"2.0500\", \"attackspeedperlevel\": \"3.5000\", \"attackdamageperlevel\": \"3.0000\"}'),(1689436142834,1,'2023-07-15 15:49:02','1',3150.00,NULL,NULL,NULL,59,NULL,NULL,NULL,NULL,NULL,'{\"hp\": \"640.0000\", \"mp\": \"300.0000\", \"camp\": \"\", \"crit\": \"0.0000\", \"name\": \"德玛西亚皇子\", \"alias\": \"JarvanIV\", \"armor\": \"36.0000\", \"magic\": \"3\", \"roles\": [\"tank\", \"fighter\"], \"style\": \"6\", \"title\": \"嘉文四世\", \"attack\": \"6\", \"campId\": \"\", \"damage\": \"2\", \"heroId\": \"59\", \"defense\": \"8\", \"hpregen\": \"8.0000\", \"mpregen\": \"6.5000\", \"utility\": \"2\", \"allytips\": [\"-\"], \"banAudio\": \"https://game.gtimg.cn/images/lol/act/img/vo/ban/59.ogg\", \"keywords\": \"德玛西亚皇子,嘉文四世,皇子,嘉文,JarvanIV,jw,hz,dmxyhz,jwss,demaxiyahuangzi,jiawensishi,huangzi,jiawen\", \"mobility\": \"2\", \"shortBio\": \"皇子嘉文四世身负王家血脉，极有可能便是德玛西亚的下一任国王。他自小被寄予厚望，有朝一日能够成为德玛西亚的楷模，可如此沉重的负担却令他的心中充满了挣扎。在战场上，他英勇无畏的气势和一往无前的决心鼓舞着全军上下，显现出身为人主的真实才干。\", \"enemytips\": [\"-\"], \"goldPrice\": \"3150\", \"introduce\": \"\", \"movespeed\": \"340.0000\", \"relations\": [], \"damageType\": \"kPhysical\", \"difficulty\": \"5\", \"durability\": \"2\", \"hpperlevel\": \"104.0000\", \"isWeekFree\": \"0\", \"mpperlevel\": \"55.0000\", \"spellblock\": \"32.0000\", \"attackrange\": \"175.0000\", \"attackspeed\": \"0.6580\", \"changeLabel\": \"改动英雄\", \"couponPrice\": \"2500\", \"difficultyL\": \"1\", \"selectAudio\": \"https://game.gtimg.cn/images/lol/act/img/vo/choose/59.ogg\", \"attackdamage\": \"64.0000\", \"critperlevel\": \"0.0000\", \"crowdControl\": \"2\", \"armorperlevel\": \"4.8000\", \"heroVideoPath\": \"\", \"hpregenperlevel\": \"0.7000\", \"mpregenperlevel\": \"0.4500\", \"palmHeroHeadImg\": \"https://game.gtimg.cn/images/lol/act/img/zmheropage/59.jpg\", \"spellblockperlevel\": \"2.0500\", \"attackspeedperlevel\": \"2.5000\", \"attackdamageperlevel\": \"3.0000\"}'),(1689436156096,1,'2023-07-15 15:49:16','1',4800.00,NULL,NULL,NULL,164,NULL,NULL,NULL,NULL,NULL,'{\"hp\": \"646.0000\", \"mp\": \"339.0000\", \"camp\": \"\", \"crit\": \"0.0000\", \"name\": \"青钢影\", \"alias\": \"Camille\", \"armor\": \"35.0000\", \"magic\": \"3\", \"roles\": [\"fighter\", \"tank\"], \"style\": \"4\", \"title\": \"卡蜜尔\", \"attack\": \"8\", \"campId\": \"\", \"damage\": \"3\", \"heroId\": \"164\", \"defense\": \"6\", \"hpregen\": \"8.5000\", \"mpregen\": \"8.1500\", \"utility\": \"1\", \"allytips\": [\"-\"], \"banAudio\": \"https://game.gtimg.cn/images/lol/act/img/vo/ban/164.ogg\", \"keywords\": \"青钢影,卡蜜尔,卡密尔,Camille,腿女,qinggangying,kamier,kamier,tuinv,qgy,kme,tn\", \"mobility\": \"3\", \"shortBio\": \"卡蜜尔是菲罗斯家族的首席密探，游走于法律失效的边缘地带，小心地维护着皮尔特沃夫与其治下的祖安，确保一切都能顺畅运转。在灵活而精准的卡密尔看来，任何浮皮潦草的技术都是必须被禁绝的丑陋行径。她的心智也如其身下的刀刃一般锐利，为了追求极致，她对自己进行了大幅度的海克斯人体增强手术。这也让很多人不禁怀疑，她根本就是一台纯粹的机器，而不是一个女人。\", \"enemytips\": [\"-\"], \"goldPrice\": \"4800\", \"introduce\": \"\", \"movespeed\": \"340.0000\", \"relations\": [], \"damageType\": \"kPhysical\", \"difficulty\": \"4\", \"durability\": \"2\", \"hpperlevel\": \"99.0000\", \"isWeekFree\": \"0\", \"mpperlevel\": \"52.0000\", \"spellblock\": \"32.0000\", \"attackrange\": \"125.0000\", \"attackspeed\": \"0.6440\", \"changeLabel\": \"无改动\", \"couponPrice\": \"3500\", \"difficultyL\": \"3\", \"selectAudio\": \"https://game.gtimg.cn/images/lol/act/img/vo/choose/164.ogg\", \"attackdamage\": \"68.0000\", \"critperlevel\": \"0.0000\", \"crowdControl\": \"2\", \"armorperlevel\": \"5.0000\", \"heroVideoPath\": \"\", \"hpregenperlevel\": \"0.8000\", \"mpregenperlevel\": \"0.7500\", \"palmHeroHeadImg\": \"https://game.gtimg.cn/images/lol/act/img/zmheropage/164.jpg\", \"spellblockperlevel\": \"2.0500\", \"attackspeedperlevel\": \"2.5000\", \"attackdamageperlevel\": \"3.5000\"}'),(1689436175689,1,'2023-07-15 15:49:35','1',1350.00,NULL,NULL,NULL,238,NULL,NULL,NULL,NULL,NULL,'{\"hp\": \"654.0000\", \"mp\": \"200.0000\", \"camp\": \"\", \"crit\": \"0.0000\", \"name\": \"影流之主\", \"alias\": \"Zed\", \"armor\": \"32.0000\", \"magic\": \"1\", \"roles\": [\"assassin\"], \"style\": \"6\", \"title\": \"劫\", \"attack\": \"9\", \"campId\": \"\", \"damage\": \"3\", \"heroId\": \"238\", \"defense\": \"2\", \"hpregen\": \"7.0000\", \"mpregen\": \"50.0000\", \"utility\": \"1\", \"allytips\": [\"-\"], \"banAudio\": \"https://game.gtimg.cn/images/lol/act/img/vo/ban/238.ogg\", \"keywords\": \"影流之主,劫,j,ylzz,Zed,yingliuzhizhu,jie\", \"mobility\": \"3\", \"shortBio\": \"作为影流教派的领袖，劫已彻底抛弃了仁慈与怜悯。他创立影流的目的，是将艾欧尼亚的魔法和传统武术融于实战之中，以驱逐诺克萨斯侵略者。在战争中，绝望指引他开启了神秘的暗影形态——这是一种恶灵魔法，虽然强大，但非常危险，且容易被腐化之力侵蚀。劫已完全掌握了这种禁忌之术，他用它来摧毁自己眼中的威胁、维护自己的国家以及自己的教派。\", \"enemytips\": [\"-\"], \"goldPrice\": \"1350\", \"introduce\": \"\", \"movespeed\": \"345.0000\", \"relations\": [], \"damageType\": \"kPhysical\", \"difficulty\": \"7\", \"durability\": \"1\", \"hpperlevel\": \"99.0000\", \"isWeekFree\": \"0\", \"mpperlevel\": \"0.0000\", \"spellblock\": \"29.0000\", \"attackrange\": \"125.0000\", \"attackspeed\": \"0.6510\", \"changeLabel\": \"无改动\", \"couponPrice\": \"2000\", \"difficultyL\": \"3\", \"selectAudio\": \"https://game.gtimg.cn/images/lol/act/img/vo/choose/238.ogg\", \"attackdamage\": \"63.0000\", \"critperlevel\": \"0.0000\", \"crowdControl\": \"1\", \"armorperlevel\": \"4.7000\", \"heroVideoPath\": \"\", \"hpregenperlevel\": \"0.6500\", \"mpregenperlevel\": \"0.0000\", \"palmHeroHeadImg\": \"https://game.gtimg.cn/images/lol/act/img/zmheropage/238.jpg\", \"spellblockperlevel\": \"2.0500\", \"attackspeedperlevel\": \"3.3000\", \"attackdamageperlevel\": \"3.4000\"}'),(1689436182505,1,'2023-07-15 15:49:42','1',450.00,NULL,NULL,NULL,54,NULL,NULL,NULL,NULL,NULL,'{\"hp\": \"644.0000\", \"mp\": \"280.0000\", \"camp\": \"\", \"crit\": \"0.0000\", \"name\": \"熔岩巨兽\", \"alias\": \"Malphite\", \"armor\": \"37.0000\", \"magic\": \"7\", \"roles\": [\"tank\", \"fighter\"], \"style\": \"8\", \"title\": \"墨菲特\", \"attack\": \"5\", \"campId\": \"\", \"damage\": \"1\", \"heroId\": \"54\", \"defense\": \"9\", \"hpregen\": \"7.0000\", \"mpregen\": \"7.3000\", \"utility\": \"1\", \"allytips\": [\"-\"], \"banAudio\": \"https://game.gtimg.cn/images/lol/act/img/vo/ban/54.ogg\", \"keywords\": \"熔岩巨兽,墨菲特,石头人,Malphite,str,mft,ryjs,rongyanjushou,mofeite,shitouren\", \"mobility\": \"1\", \"shortBio\": \"墨菲特是一个庞大的岩石生物，为了给混乱的世界赐予秩序而不懈奋斗。他诞生之初的身份只是一个石仆，侍奉着一块超乎凡人理解、名为“独石”的石碑。他用万钧元素之力维护独石，最终却还是失败了。在那场大毁灭中，墨菲特成了唯一的幸存者。如今他忍受着符文之地的脆弱凡人以及他们流水一般多变的性情，想尽办法在世间寻找一个新的立足之地，让自己不愧这世上最后一个岩石生物之名。\", \"enemytips\": [\"-\"], \"goldPrice\": \"450\", \"introduce\": \"\", \"movespeed\": \"335.0000\", \"relations\": [], \"damageType\": \"kMagic\", \"difficulty\": \"2\", \"durability\": \"3\", \"hpperlevel\": \"104.0000\", \"isWeekFree\": \"0\", \"mpperlevel\": \"60.0000\", \"spellblock\": \"28.0000\", \"attackrange\": \"125.0000\", \"attackspeed\": \"0.7360\", \"changeLabel\": \"改动英雄\", \"couponPrice\": \"1000\", \"difficultyL\": \"1\", \"selectAudio\": \"https://game.gtimg.cn/images/lol/act/img/vo/choose/54.ogg\", \"attackdamage\": \"62.0000\", \"critperlevel\": \"0.0000\", \"crowdControl\": \"3\", \"armorperlevel\": \"4.9500\", \"heroVideoPath\": \"\", \"hpregenperlevel\": \"0.5500\", \"mpregenperlevel\": \"0.5500\", \"palmHeroHeadImg\": \"https://game.gtimg.cn/images/lol/act/img/zmheropage/54.jpg\", \"spellblockperlevel\": \"2.0500\", \"attackspeedperlevel\": \"3.4000\", \"attackdamageperlevel\": \"4.0000\"}'),(1689436195105,1,'2023-07-15 15:49:55','1',1350.00,NULL,NULL,NULL,875,NULL,NULL,NULL,NULL,NULL,'{\"hp\": \"670.0000\", \"mp\": \"0.0000\", \"camp\": \"\", \"crit\": \"0.0000\", \"name\": \"腕豪\", \"alias\": \"Sett\", \"armor\": \"33.0000\", \"magic\": \"1\", \"roles\": [\"fighter\", \"tank\"], \"style\": \"4\", \"title\": \"瑟提\", \"attack\": \"8\", \"campId\": \"\", \"damage\": \"2\", \"heroId\": \"875\", \"defense\": \"5\", \"hpregen\": \"7.0000\", \"mpregen\": \"0.0000\", \"utility\": \"1\", \"allytips\": [\"-\"], \"banAudio\": \"https://game.gtimg.cn/images/lol/act/img/vo/ban/875.ogg\", \"keywords\": \"腕豪,瑟提,jinfu,jf,Sett,st,wh,wanhao,seti\", \"mobility\": \"2\", \"shortBio\": \"在与诺克萨斯的战争结束之后，艾欧尼亚的地下王国日渐兴起，瑟提在其中脱颖而出，成为了一方霸主。虽然他一开始只是纳沃利的搏击场里的无名小卒，但他有着一身蛮力，而且极其耐打，很快就名声鹊起。等到当地的搏击手尽数被他击败之后，瑟提靠着一腔勇武，掌控了自己曾经浴血奋战的搏击场。\", \"enemytips\": [\"-\"], \"goldPrice\": \"1350\", \"introduce\": \"\", \"movespeed\": \"340.0000\", \"relations\": [], \"damageType\": \"kPhysical\", \"difficulty\": \"2\", \"durability\": \"2\", \"hpperlevel\": \"114.0000\", \"isWeekFree\": \"0\", \"mpperlevel\": \"0.0000\", \"spellblock\": \"28.0000\", \"attackrange\": \"125.0000\", \"attackspeed\": \"0.6250\", \"changeLabel\": \"无改动\", \"couponPrice\": \"2000\", \"difficultyL\": \"2\", \"selectAudio\": \"https://game.gtimg.cn/images/lol/act/img/vo/choose/875.ogg\", \"attackdamage\": \"60.0000\", \"critperlevel\": \"0.0000\", \"crowdControl\": \"2\", \"armorperlevel\": \"5.2000\", \"heroVideoPath\": \"\", \"hpregenperlevel\": \"0.5000\", \"mpregenperlevel\": \"0.0000\", \"palmHeroHeadImg\": \"https://game.gtimg.cn/images/lol/act/img/zmheropage/875.jpg\", \"spellblockperlevel\": \"2.0500\", \"attackspeedperlevel\": \"1.7500\", \"attackdamageperlevel\": \"4.0000\"}'),(1689437086826,1,'2023-07-15 16:04:46','1',4800.00,NULL,NULL,NULL,27,NULL,NULL,NULL,NULL,NULL,'{\"hp\": \"650.0000\", \"mp\": \"330.0000\", \"camp\": \"\", \"crit\": \"0.0000\", \"name\": \"炼金术士\", \"alias\": \"Singed\", \"armor\": \"34.0000\", \"magic\": \"7\", \"roles\": [\"tank\", \"fighter\"], \"style\": \"10\", \"title\": \"辛吉德\", \"attack\": \"4\", \"campId\": \"\", \"damage\": \"2\", \"heroId\": \"27\", \"defense\": \"8\", \"hpregen\": \"9.5000\", \"mpregen\": \"7.5000\", \"utility\": \"1\", \"allytips\": [\"-\"], \"banAudio\": \"https://game.gtimg.cn/images/lol/act/img/vo/ban/27.ogg\", \"keywords\": \"炼金术士,辛吉德,炼金,lj,xjd,ljss,Singed,lianjinshushi,xinjide,lianjin\", \"mobility\": \"2\", \"shortBio\": \"辛吉德是一名智力超群的祖安炼金术士，一生致力于超越知识的边界，为此他不惜一切代价，哪怕付出理智也在所不惜——这种疯狂算不算无药可救？虽说他的药物实验极少失手，但在许多人眼里，辛吉德早已丧失了一切理性，所到之处只会留下苦难与骇人的剧毒踪迹。\", \"enemytips\": [\"-\"], \"goldPrice\": \"4800\", \"introduce\": \"\", \"movespeed\": \"345.0000\", \"relations\": [], \"damageType\": \"kMagic\", \"difficulty\": \"5\", \"durability\": \"3\", \"hpperlevel\": \"99.0000\", \"isWeekFree\": \"0\", \"mpperlevel\": \"45.0000\", \"spellblock\": \"32.0000\", \"attackrange\": \"125.0000\", \"attackspeed\": \"0.6130\", \"changeLabel\": \"无改动\", \"couponPrice\": \"2000\", \"difficultyL\": \"2\", \"selectAudio\": \"https://game.gtimg.cn/images/lol/act/img/vo/choose/27.ogg\", \"attackdamage\": \"63.0000\", \"critperlevel\": \"0.0000\", \"crowdControl\": \"2\", \"armorperlevel\": \"4.7000\", \"heroVideoPath\": \"\", \"hpregenperlevel\": \"0.5500\", \"mpregenperlevel\": \"0.5500\", \"palmHeroHeadImg\": \"https://game.gtimg.cn/images/lol/act/img/zmheropage/27.jpg\", \"spellblockperlevel\": \"2.0500\", \"attackspeedperlevel\": \"1.9000\", \"attackdamageperlevel\": \"3.4000\"}');
/*!40000 ALTER TABLE `order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `score`
--

DROP TABLE IF EXISTS `score`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `score` (
  `s_id` int NOT NULL,
  `c_id` int NOT NULL,
  `s_score` int NOT NULL,
  PRIMARY KEY (`s_id`,`c_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `score`
--

LOCK TABLES `score` WRITE;
/*!40000 ALTER TABLE `score` DISABLE KEYS */;
INSERT INTO `score` VALUES (1,1001,80),(1,1002,90),(1,1003,99),(2,1001,70),(2,1002,80),(2,1003,100),(3,1001,80),(3,1002,70),(3,1003,80),(4,1001,60),(4,1002,75),(4,1003,50),(5,1001,50),(5,1002,55),(5,1003,40),(6,1001,40),(6,1002,65),(6,1003,50),(7,1001,70),(7,1002,65),(7,1003,80),(8,1001,70),(8,1002,85);
/*!40000 ALTER TABLE `score` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `students`
--

DROP TABLE IF EXISTS `students`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `students` (
  `s_id` int NOT NULL,
  `s_name` varchar(255) NOT NULL DEFAULT '',
  `s_birthday` varchar(255) NOT NULL DEFAULT '',
  `s_sex` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`s_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `students`
--

LOCK TABLES `students` WRITE;
/*!40000 ALTER TABLE `students` DISABLE KEYS */;
INSERT INTO `students` VALUES (1,'赵雷','1990-01-01','男'),(2,'钱电','1990-12-21','男'),(3,'孙风','1990-05-20','男'),(4,'李云','1990-08-06','男'),(5,'周梅','1991-12-01','女'),(6,'吴兰','1992-03-01','女'),(7,'郑竹','1989-07-01','女'),(8,'王菊','1990-01-20','女');
/*!40000 ALTER TABLE `students` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `teacher`
--

DROP TABLE IF EXISTS `teacher`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `teacher` (
  `t_id` int NOT NULL,
  `t_name` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`t_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `teacher`
--

LOCK TABLES `teacher` WRITE;
/*!40000 ALTER TABLE `teacher` DISABLE KEYS */;
INSERT INTO `teacher` VALUES (1223,'张三'),(1224,'李四'),(1225,'王五');
/*!40000 ALTER TABLE `teacher` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `username` varchar(20) NOT NULL COMMENT '账号',
  `password` varchar(50) DEFAULT NULL COMMENT 'md密码',
  `id_sort` int DEFAULT NULL,
  `nickname` varchar(20) DEFAULT NULL,
  `age` varchar(20) DEFAULT NULL,
  `address` varchar(100) DEFAULT NULL,
  `sex` varchar(10) DEFAULT NULL,
  `tel_number` varchar(20) DEFAULT NULL,
  `qq` varchar(20) DEFAULT NULL,
  `create_time` varchar(100) DEFAULT NULL,
  `avatar` varchar(200) DEFAULT NULL,
  `is_delete` int NOT NULL DEFAULT '0' COMMENT '是否删除：1删除 0未删除',
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_uniquekey` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'shiqingshan','e10adc3949ba59abbe56e057f20f883e',1,'莉莉','26','北京','男','17695631049','956059246','2023-07-10 10:14:14','a7b29af3-0645-4711-b1eb-aa7c9447e5e2.jpg',0),(2,'sss','202cb962ac59075b964b07152d234b70',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2023-07-10 10:17:50',NULL,0),(3,'user1','e10adc3949ba59abbe56e057f20f883e',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2023-07-10 16:19:37',NULL,0),(18,'user2','e10adc3949ba59abbe56e057f20f883e',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2023-07-10 16:30:55',NULL,0),(19,'user6','e10adc3949ba59abbe56e057f20f883e',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2023-07-13 16:47:55',NULL,0);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `websites`
--

DROP TABLE IF EXISTS `websites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `websites` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` char(20) NOT NULL DEFAULT '' COMMENT '站点名称',
  `url` varchar(255) NOT NULL DEFAULT '',
  `alexa` int NOT NULL DEFAULT '0' COMMENT 'Alexa 排名',
  `country` char(10) NOT NULL DEFAULT '' COMMENT '国家',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `websites`
--

LOCK TABLES `websites` WRITE;
/*!40000 ALTER TABLE `websites` DISABLE KEYS */;
INSERT INTO `websites` VALUES (1,'Google','https://www.google.cm/',1,'USA'),(2,'淘宝','https://www.taobao.com/',13,'CN'),(3,'菜鸟教程','http://www.runoob.com',5892,''),(4,'微博','http://weibo.com/',20,'CN'),(5,'Facebook','https://www.facebook.com/',3,'USA');
/*!40000 ALTER TABLE `websites` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-07-16 22:30:24

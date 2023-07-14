-- MySQL dump 10.13  Distrib 8.0.32, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: sqs
-- ------------------------------------------------------
-- Server version	8.0.32

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
  PRIMARY KEY (`order_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order`
--

LOCK TABLES `order` WRITE;
/*!40000 ALTER TABLE `order` DISABLE KEYS */;
INSERT INTO `order` VALUES (1689352121191,0,'2023-07-14 16:28:41','0',NULL,NULL,NULL,NULL,55,NULL,NULL,NULL,NULL,NULL),(1689352164126,0,'2023-07-14 16:29:24','0',NULL,NULL,NULL,NULL,55,NULL,NULL,NULL,NULL,NULL),(1689352421339,1,'2023-07-14 16:33:41','0',NULL,NULL,NULL,NULL,55,NULL,NULL,NULL,NULL,NULL),(1689353590260,1,'2023-07-14 16:53:10','0',450.00,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL),(1689353637956,1,'2023-07-14 16:53:57','0',4800.00,NULL,NULL,NULL,4,NULL,NULL,NULL,NULL,NULL),(1689354152276,1,'2023-07-14 17:02:32','0',4800.00,NULL,NULL,NULL,4,NULL,NULL,NULL,NULL,NULL);
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
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'shiqingshan','e10adc3949ba59abbe56e057f20f883e',1,'莉莉','26','北京','男','17695631049','956059246','2023-07-10 10:14:14','fd26a2f0-f2bc-4fbd-853c-55aa06b059b8.jpg',0),(2,'sss','202cb962ac59075b964b07152d234b70',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2023-07-10 10:17:50',NULL,0),(3,'user1','e10adc3949ba59abbe56e057f20f883e',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2023-07-10 16:19:37',NULL,0),(18,'user2','e10adc3949ba59abbe56e057f20f883e',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2023-07-10 16:30:55',NULL,0),(19,'user6','e10adc3949ba59abbe56e057f20f883e',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2023-07-13 16:47:55',NULL,0);
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

-- Dump completed on 2023-07-14 18:03:51

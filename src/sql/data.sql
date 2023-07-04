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
  `password` varchar(20) DEFAULT NULL,
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
  PRIMARY KEY (`id`,`username`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'shiqingshan','123456',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2023-07-04 15:29:00',NULL,0),(2,'user1','123456',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2023-07-04 15:29:00',NULL,0),(3,'user2','123456',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2023-07-04',NULL,0),(4,'user3','123456',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'15:28:11',NULL,0),(5,'user4','123456',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2023-07-04 15:29:00',NULL,0),(6,'user5','123456',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2023-07-04 16:09:22',NULL,0),(7,'user6','123456',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2023-07-04 16:20:30',NULL,0),(8,'user7','123456',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2023-07-04 16:49:15',NULL,0),(9,'user8','123456',NULL,'user8',NULL,NULL,NULL,NULL,NULL,'2023-07-04 18:18:06',NULL,0),(10,'user9','123456',NULL,'user9',NULL,NULL,NULL,NULL,NULL,'2023-07-04 18:18:11',NULL,0),(11,'user10','123456',NULL,'user10',NULL,NULL,NULL,NULL,NULL,'2023-07-04 18:18:14',NULL,0),(12,'user11','123456',NULL,'user11',NULL,NULL,NULL,NULL,NULL,'2023-07-04 18:18:17',NULL,0),(13,'user12','123456',NULL,'user12',NULL,NULL,NULL,NULL,NULL,'2023-07-04 18:18:20',NULL,0),(14,'user13','123456',NULL,'user13',NULL,NULL,NULL,NULL,NULL,'2023-07-04 18:18:22',NULL,0);
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

-- Dump completed on 2023-07-04 18:57:40

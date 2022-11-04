-- MySQL dump 10.13  Distrib 8.0.13, for Win64 (x86_64)
--
-- Host: localhost    Database: bus
-- ------------------------------------------------------
-- Server version	8.0.11

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
 SET NAMES utf8 ;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `bus`
--

DROP TABLE IF EXISTS `bus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `bus` (
  `busid` int(11) NOT NULL AUTO_INCREMENT,
  `bustype` varchar(45) DEFAULT NULL,
  `sstate` varchar(45) DEFAULT NULL,
  `scity` varchar(45) DEFAULT NULL,
  `dstate` varchar(45) DEFAULT NULL,
  `dcity` varchar(45) DEFAULT NULL,
  `kilometer` int(11) DEFAULT NULL,
  `rent` int(11) DEFAULT NULL,
  `busnumber` int(11) DEFAULT NULL,
  `day` varchar(100) DEFAULT NULL,
  `picture` text,
  PRIMARY KEY (`busid`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bus`
--

LOCK TABLES `bus` WRITE;
/*!40000 ALTER TABLE `bus` DISABLE KEYS */;
INSERT INTO `bus` VALUES (6,'1','2','8','1','2',250,10000,NULL,'[\"Sun.\",\"Mon.\",\"Thu.\",\"Sat.\"]','5ee02872-dabd-4358-8f56-d2fc0055eff9.jpg'),(7,'3','2','9','2','8',150,3000,NULL,'[\"Sun.\",\"Thu.\",\"Sat.\"]','b52133e1-012c-4d49-8546-c1d91dd310d9.png'),(9,'1','1','2','2','6',156,7800,NULL,'[\"Sun.\",\"Mon.\",\"Thu.\"]','797858cf-1c92-43fd-96d8-8f833281e3ac.png'),(10,'2','1','1','2','8',1000,4000,NULL,'[\"Sun.\",\"Fri.\"]','8c1d3bc5-086d-48b6-b2cf-52ace29025e2.jpg'),(11,'3','1','2','1','1',489,1467,NULL,'[\"Sun.\",\"Mon.\",\"Thu.\",\"Sat.\"]','67d6b0dc-6b05-4496-94e1-755bf13d0bb2.jpg'),(12,'2','2','7','1','2',2000,8000,NULL,'[\"Sun.\",\"Thu.\"]','9eb79577-553a-485f-99b6-eae1d0d2966d.jpeg'),(13,'1','1','3','2','7',1000,5000,145696,'[\"Sun.\",\"Tue.\",\"Wed.\",\"Fri.\"]','da5dbeec-a4e5-4463-a1a9-9d8986decf74.jpg');
/*!40000 ALTER TABLE `bus` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bustype`
--

DROP TABLE IF EXISTS `bustype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `bustype` (
  `typeid` int(11) NOT NULL AUTO_INCREMENT,
  `busmodal` varchar(45) DEFAULT NULL,
  `rent` int(11) DEFAULT NULL,
  PRIMARY KEY (`typeid`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bustype`
--

LOCK TABLES `bustype` WRITE;
/*!40000 ALTER TABLE `bustype` DISABLE KEYS */;
INSERT INTO `bustype` VALUES (1,'Volvo 9400XL',5),(2,'Volvo 9600',4),(3,'Volvo 9600s',3),(4,'Mercedes Benz 59 ',8);
/*!40000 ALTER TABLE `bustype` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cities`
--

DROP TABLE IF EXISTS `cities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `cities` (
  `cityid` int(11) NOT NULL AUTO_INCREMENT,
  `stateid` int(11) DEFAULT NULL,
  `cityname` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`cityid`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cities`
--

LOCK TABLES `cities` WRITE;
/*!40000 ALTER TABLE `cities` DISABLE KEYS */;
INSERT INTO `cities` VALUES (1,1,'Gwalior'),(2,1,'Bhopal'),(3,1,'Indore'),(4,1,'Jabalpur'),(5,1,'Guna'),(6,2,'Agra'),(7,2,'Mathura'),(8,2,'Lucknow'),(9,2,'Kanpur'),(10,3,'New Delhi'),(11,3,'Firozabad'),(12,3,'Shahjehabanad'),(13,4,'Jaipur'),(14,4,'Udaipur'),(15,4,'Jodhpur');
/*!40000 ALTER TABLE `cities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `login_admin`
--

DROP TABLE IF EXISTS `login_admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `login_admin` (
  `email` varchar(100) NOT NULL,
  `mobileno` varchar(100) NOT NULL,
  `name` varchar(45) DEFAULT NULL,
  `password` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`email`,`mobileno`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `login_admin`
--

LOCK TABLES `login_admin` WRITE;
/*!40000 ALTER TABLE `login_admin` DISABLE KEYS */;
INSERT INTO `login_admin` VALUES ('sgirraj66@gmail.com','9522982017','girraj singh','1234'),('ss66@gmail.com','9926577768','sonam sharma','1234');
/*!40000 ALTER TABLE `login_admin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `states`
--

DROP TABLE IF EXISTS `states`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `states` (
  `stateid` int(11) NOT NULL,
  `statename` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`stateid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `states`
--

LOCK TABLES `states` WRITE;
/*!40000 ALTER TABLE `states` DISABLE KEYS */;
INSERT INTO `states` VALUES (1,'Madhya Pradesh'),(2,'Uttar Pradesh'),(3,'Delhi'),(4,'Rajasthan');
/*!40000 ALTER TABLE `states` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-11-04 12:07:24

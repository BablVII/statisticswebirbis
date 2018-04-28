-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: localhost    Database: statistic
-- ------------------------------------------------------
-- Server version	5.7.21-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `year2018`
--

DROP TABLE IF EXISTS `year2018`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `year2018` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Statistic` varchar(45) DEFAULT NULL,
  `January` varchar(45) DEFAULT NULL,
  `February` varchar(45) DEFAULT NULL,
  `March` varchar(45) DEFAULT NULL,
  `April` varchar(45) DEFAULT NULL,
  `May` varchar(45) DEFAULT NULL,
  `June` varchar(45) DEFAULT NULL,
  `Jule` varchar(45) DEFAULT NULL,
  `August` varchar(45) DEFAULT NULL,
  `September` varchar(45) DEFAULT NULL,
  `October` varchar(45) DEFAULT NULL,
  `November` varchar(45) DEFAULT NULL,
  `December` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `year2018`
--

LOCK TABLES `year2018` WRITE;
/*!40000 ALTER TABLE `year2018` DISABLE KEYS */;
INSERT INTO `year2018` VALUES (1,'Количество авторизаций','','','','','','','','','','','',''),(2,'Количество просмотров(книговыдача)','','','','','','','','','','','',''),(3,'Количество виртуальных посещений','','','','','','','','','','','',''),(4,'Количество запросов','','','','','','','','','','','','');
/*!40000 ALTER TABLE `year2018` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-04-28 13:21:20

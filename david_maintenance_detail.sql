CREATE DATABASE  IF NOT EXISTS `david` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;
USE `david`;
-- MySQL dump 10.13  Distrib 8.0.34, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: david
-- ------------------------------------------------------
-- Server version	5.5.5-10.4.11-MariaDB

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
-- Table structure for table `maintenance_detail`
--

DROP TABLE IF EXISTS `maintenance_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `maintenance_detail` (
  `maintenance_detail_id` int(11) NOT NULL,
  `maintenance_log_id` int(11) DEFAULT NULL,
  `maintenance_item_performed` varchar(255) DEFAULT NULL,
  `parts_used` varchar(255) DEFAULT NULL,
  `mechanic_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`maintenance_detail_id`),
  KEY `mechanic_id` (`mechanic_id`),
  KEY `fk_maintenance_detail_log` (`maintenance_log_id`),
  CONSTRAINT `fk_maintenance_detail_log` FOREIGN KEY (`maintenance_log_id`) REFERENCES `maintenance_log` (`maintenance_log_id`),
  CONSTRAINT `maintenance_detail_ibfk_1` FOREIGN KEY (`maintenance_log_id`) REFERENCES `maintenance_log` (`maintenance_log_id`),
  CONSTRAINT `maintenance_detail_ibfk_2` FOREIGN KEY (`mechanic_id`) REFERENCES `mechanics` (`mechanic_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `maintenance_detail`
--

LOCK TABLES `maintenance_detail` WRITE;
/*!40000 ALTER TABLE `maintenance_detail` DISABLE KEYS */;
/*!40000 ALTER TABLE `maintenance_detail` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-11-28  9:48:58

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
-- Table structure for table `trip_completion`
--

DROP TABLE IF EXISTS `trip_completion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `trip_completion` (
  `trip_completion_id` int(11) NOT NULL,
  `faculty_member_id` int(11) DEFAULT NULL,
  `vehicle_id` int(11) DEFAULT NULL,
  `odometer_readings_start` int(11) DEFAULT NULL,
  `odometer_readings_end` int(11) DEFAULT NULL,
  `maintenance_complaints` varchar(255) DEFAULT NULL,
  `liters_of_fuel_purchased` int(11) DEFAULT NULL,
  `ncu_credit_card_number` varchar(20) DEFAULT NULL,
  `credit_card_receipt` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`trip_completion_id`),
  KEY `fk_trip_completion_faculty` (`faculty_member_id`),
  KEY `fk_trip_completion_vehicle` (`vehicle_id`),
  CONSTRAINT `fk_trip_completion_faculty` FOREIGN KEY (`faculty_member_id`) REFERENCES `faculty_members` (`faculty_member_id`),
  CONSTRAINT `fk_trip_completion_vehicle` FOREIGN KEY (`vehicle_id`) REFERENCES `vehicles` (`vehicle_id`),
  CONSTRAINT `trip_completion_ibfk_1` FOREIGN KEY (`faculty_member_id`) REFERENCES `faculty_members` (`faculty_member_id`),
  CONSTRAINT `trip_completion_ibfk_2` FOREIGN KEY (`vehicle_id`) REFERENCES `vehicles` (`vehicle_id`),
  CONSTRAINT `CONSTRAINT_1` CHECK (`odometer_readings_end` > `odometer_readings_start`),
  CONSTRAINT `chk_trip_completion_readings` CHECK (`odometer_readings_end` > `odometer_readings_start`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `trip_completion`
--

LOCK TABLES `trip_completion` WRITE;
/*!40000 ALTER TABLE `trip_completion` DISABLE KEYS */;
/*!40000 ALTER TABLE `trip_completion` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-11-28  9:48:59

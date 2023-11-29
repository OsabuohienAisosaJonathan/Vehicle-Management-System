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
-- Temporary view structure for view `availablevehicles`
--

DROP TABLE IF EXISTS `availablevehicles`;
/*!50001 DROP VIEW IF EXISTS `availablevehicles`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `availablevehicles` AS SELECT 
 1 AS `vehicle_id`,
 1 AS `make`,
 1 AS `model`,
 1 AS `year`,
 1 AS `color`,
 1 AS `license_plate_number`,
 1 AS `current_mileage`,
 1 AS `last_maintenance_date`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vehicle_usage_summary`
--

DROP TABLE IF EXISTS `vehicle_usage_summary`;
/*!50001 DROP VIEW IF EXISTS `vehicle_usage_summary`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vehicle_usage_summary` AS SELECT 
 1 AS `month`,
 1 AS `year`,
 1 AS `faculty_member_name`,
 1 AS `department_name`,
 1 AS `total_mileage`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `unusedreservationsview`
--

DROP TABLE IF EXISTS `unusedreservationsview`;
/*!50001 DROP VIEW IF EXISTS `unusedreservationsview`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `unusedreservationsview` AS SELECT 
 1 AS `reservation_id`,
 1 AS `faculty_member_name`,
 1 AS `make`,
 1 AS `model`,
 1 AS `reservation_date`,
 1 AS `expected_departure_date`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `departmentvehicleusage`
--

DROP TABLE IF EXISTS `departmentvehicleusage`;
/*!50001 DROP VIEW IF EXISTS `departmentvehicleusage`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `departmentvehicleusage` AS SELECT 
 1 AS `department_name`,
 1 AS `num_vehicles_used`,
 1 AS `most_recurrent_faculty_member`*/;
SET character_set_client = @saved_cs_client;

--
-- Final view structure for view `availablevehicles`
--

/*!50001 DROP VIEW IF EXISTS `availablevehicles`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `availablevehicles` AS select `vehicles`.`vehicle_id` AS `vehicle_id`,`vehicles`.`make` AS `make`,`vehicles`.`model` AS `model`,`vehicles`.`year` AS `year`,`vehicles`.`color` AS `color`,`vehicles`.`license_plate_number` AS `license_plate_number`,`vehicles`.`current_mileage` AS `current_mileage`,`vehicles`.`last_maintenance_date` AS `last_maintenance_date` from `vehicles` where !(`vehicles`.`vehicle_id` in (select `reservations`.`vehicle_id` from `reservations` where `reservations`.`expected_departure_date` >= curdate() and `reservations`.`reservation_date` <= curdate())) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vehicle_usage_summary`
--

/*!50001 DROP VIEW IF EXISTS `vehicle_usage_summary`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vehicle_usage_summary` AS select month(`tc`.`odometer_readings_end`) AS `month`,year(`tc`.`odometer_readings_end`) AS `year`,`fm`.`name` AS `faculty_member_name`,`d`.`department_name` AS `department_name`,sum(`tc`.`odometer_readings_end` - `tc`.`odometer_readings_start`) AS `total_mileage` from ((`trip_completion` `tc` join `faculty_members` `fm` on(`tc`.`faculty_member_id` = `fm`.`faculty_member_id`)) join `departments` `d` on(`fm`.`department_id` = `d`.`department_id`)) group by year(`tc`.`odometer_readings_end`),month(`tc`.`odometer_readings_end`),`fm`.`faculty_member_id`,`d`.`department_name` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `unusedreservationsview`
--

/*!50001 DROP VIEW IF EXISTS `unusedreservationsview`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `unusedreservationsview` AS select `r`.`reservation_id` AS `reservation_id`,`f`.`name` AS `faculty_member_name`,`v`.`make` AS `make`,`v`.`model` AS `model`,`r`.`reservation_date` AS `reservation_date`,`r`.`expected_departure_date` AS `expected_departure_date` from (((`reservations` `r` left join `trip_completion` `t` on(`r`.`faculty_member_id` = `t`.`faculty_member_id` and `r`.`vehicle_id` = `t`.`vehicle_id`)) join `faculty_members` `f` on(`r`.`faculty_member_id` = `f`.`faculty_member_id`)) join `vehicles` `v` on(`r`.`vehicle_id` = `v`.`vehicle_id`)) where `t`.`trip_completion_id` is null */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `departmentvehicleusage`
--

/*!50001 DROP VIEW IF EXISTS `departmentvehicleusage`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `departmentvehicleusage` AS select `d`.`department_name` AS `department_name`,count(distinct `r`.`vehicle_id`) AS `num_vehicles_used`,`fm`.`name` AS `most_recurrent_faculty_member` from ((`departments` `d` left join `faculty_members` `fm` on(`d`.`department_id` = `fm`.`department_id`)) left join `reservations` `r` on(`fm`.`faculty_member_id` = `r`.`faculty_member_id`)) group by `d`.`department_name` order by count(distinct `r`.`vehicle_id`) desc */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-11-28  9:48:59

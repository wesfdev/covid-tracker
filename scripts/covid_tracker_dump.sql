-- MySQL dump 10.13  Distrib 8.0.15, for macos10.14 (x86_64)
--
-- Host: localhost    Database: covid_tracker
-- ------------------------------------------------------
-- Server version	8.0.15

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
 SET NAMES utf8mb4 ;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `city`
--

DROP TABLE IF EXISTS `city`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `city` (
  `dbid` bigint(20) NOT NULL AUTO_INCREMENT,
  `adminCode` varchar(10) DEFAULT NULL,
  `population` bigint(20) NOT NULL,
  `name` varchar(50) NOT NULL,
  `cityId` bigint(20) DEFAULT NULL,
  `isCapital` tinyint(1) DEFAULT NULL,
  `latitude` varchar(20) NOT NULL,
  `longitude` varchar(20) NOT NULL,
  PRIMARY KEY (`dbid`)
) ENGINE=InnoDB AUTO_INCREMENT=341 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `diagnostic`
--

DROP TABLE IF EXISTS `diagnostic`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `diagnostic` (
  `dbid` bigint(20) NOT NULL AUTO_INCREMENT,
  `person` bigint(20) NOT NULL,
  `observations` varchar(2000) DEFAULT NULL,
  `creation_date` datetime DEFAULT NULL,
  `city` bigint(20) NOT NULL,
  `status` bigint(20) NOT NULL,
  `token` varchar(100) NOT NULL,
  PRIMARY KEY (`dbid`),
  KEY `diagnostic_person_fk` (`person`),
  KEY `diagnostic_status_fk` (`status`),
  KEY `diagnostic_city_fk` (`city`),
  CONSTRAINT `diagnostic_city_fk` FOREIGN KEY (`city`) REFERENCES `city` (`dbid`),
  CONSTRAINT `diagnostic_person_fk` FOREIGN KEY (`person`) REFERENCES `person` (`dbid`),
  CONSTRAINT `diagnostic_status_fk` FOREIGN KEY (`status`) REFERENCES `value_list` (`dbid`)
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `diagnostic_detail`
--

DROP TABLE IF EXISTS `diagnostic_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `diagnostic_detail` (
  `dbid` bigint(20) NOT NULL AUTO_INCREMENT,
  `diagnostic` bigint(20) NOT NULL,
  `symptom_response` bigint(20) NOT NULL,
  `observations` varchar(2000) DEFAULT NULL,
  PRIMARY KEY (`dbid`),
  KEY `diagnostic_detail_symptom_response_fk` (`symptom_response`),
  KEY `diagnostic_detail_diagnostic_fk` (`diagnostic`),
  CONSTRAINT `diagnostic_detail_diagnostic_fk` FOREIGN KEY (`diagnostic`) REFERENCES `diagnostic` (`dbid`),
  CONSTRAINT `diagnostic_detail_symptom_response_fk` FOREIGN KEY (`symptom_response`) REFERENCES `symptom_response` (`dbid`)
) ENGINE=InnoDB AUTO_INCREMENT=154 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `observations`
--

DROP TABLE IF EXISTS `observations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `observations` (
  `dbid` bigint(20) NOT NULL AUTO_INCREMENT,
  `description` varchar(3000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `category` bigint(20) NOT NULL,
  `type_condition` bigint(20) DEFAULT NULL,
  `initial_probability` bigint(20) DEFAULT NULL,
  `final_probability_range` bigint(20) DEFAULT NULL,
  `status` bigint(20) NOT NULL,
  PRIMARY KEY (`dbid`),
  KEY `observations_category_fk` (`category`),
  KEY `observations_type_condition_fk` (`type_condition`),
  KEY `observations_status_fk` (`status`),
  CONSTRAINT `observations_category_fk` FOREIGN KEY (`category`) REFERENCES `value_list` (`dbid`),
  CONSTRAINT `observations_status_fk` FOREIGN KEY (`status`) REFERENCES `value_list` (`dbid`),
  CONSTRAINT `observations_type_condition_fk` FOREIGN KEY (`type_condition`) REFERENCES `value_list` (`dbid`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `patient_condition`
--

DROP TABLE IF EXISTS `patient_condition`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `patient_condition` (
  `dbid` bigint(20) NOT NULL AUTO_INCREMENT,
  `diagnostic` bigint(20) NOT NULL,
  `type_job` bigint(20) NOT NULL,
  `type_contact_work` bigint(20) NOT NULL,
  `risk_area` tinyint(1) NOT NULL,
  `positive_person_contact` tinyint(1) NOT NULL,
  PRIMARY KEY (`dbid`),
  KEY `patient_condition_type_job_fk` (`type_job`),
  KEY `patient_condition_type_contact_work_fk` (`type_contact_work`),
  KEY `patient_condition_diagnostic_fk` (`diagnostic`),
  CONSTRAINT `patient_condition_diagnostic_fk` FOREIGN KEY (`diagnostic`) REFERENCES `diagnostic` (`dbid`),
  CONSTRAINT `patient_condition_type_contact_work_fk` FOREIGN KEY (`type_contact_work`) REFERENCES `value_list` (`dbid`),
  CONSTRAINT `patient_condition_type_job_fk` FOREIGN KEY (`type_job`) REFERENCES `value_list` (`dbid`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `person`
--

DROP TABLE IF EXISTS `person`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `person` (
  `dbid` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `last_name` varchar(100) DEFAULT NULL,
  `dpi` bigint(15) DEFAULT NULL,
  `birthdate` date DEFAULT NULL,
  `age` bigint(3) DEFAULT NULL,
  `gender` bigint(20) DEFAULT NULL,
  `mobile` bigint(20) DEFAULT NULL,
  `phone` bigint(20) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`dbid`)
) ENGINE=InnoDB AUTO_INCREMENT=57 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `symptom`
--

DROP TABLE IF EXISTS `symptom`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `symptom` (
  `dbid` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `description` varchar(100) DEFAULT NULL,
  `category` bigint(20) NOT NULL,
  `weighing` bigint(20) NOT NULL DEFAULT '0',
  PRIMARY KEY (`dbid`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `symptom_response`
--

DROP TABLE IF EXISTS `symptom_response`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `symptom_response` (
  `dbid` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `description` varchar(100) DEFAULT NULL,
  `response` bigint(20) NOT NULL,
  `weighing` bigint(10) NOT NULL DEFAULT '0',
  `symptom` bigint(20) NOT NULL,
  PRIMARY KEY (`dbid`),
  KEY `symptom_response_symptom_fk` (`symptom`),
  KEY `symptom_response_response_fk` (`response`),
  CONSTRAINT `symptom_response_response_fk` FOREIGN KEY (`response`) REFERENCES `value_list` (`dbid`),
  CONSTRAINT `symptom_response_symptom_fk` FOREIGN KEY (`symptom`) REFERENCES `symptom` (`dbid`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `value_list`
--

DROP TABLE IF EXISTS `value_list`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `value_list` (
  `dbid` bigint(20) NOT NULL AUTO_INCREMENT,
  `discriminator` varchar(100) NOT NULL,
  `name` varchar(200) NOT NULL,
  `description` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`dbid`)
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-03-30 18:39:29

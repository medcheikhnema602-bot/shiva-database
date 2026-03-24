CREATE DATABASE  IF NOT EXISTS `chiva` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `chiva`;
-- MySQL dump 10.13  Distrib 8.0.45, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: chiva
-- ------------------------------------------------------
-- Server version	8.4.7

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
-- Table structure for table `demande_medicament`
--

DROP TABLE IF EXISTS `demande_medicament`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `demande_medicament` (
  `id` int NOT NULL AUTO_INCREMENT,
  `patient_id` int DEFAULT NULL,
  `nom_medicament` text COLLATE utf8mb4_unicode_ci,
  `photo_ordonance` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `quartier_id` int DEFAULT NULL,
  `status_demande` enum('en_attente','trouver','nom_trouver','anullee') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date_creation` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `patient_id` (`patient_id`),
  KEY `quartier_id` (`quartier_id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `demande_medicament`
--

LOCK TABLES `demande_medicament` WRITE;
/*!40000 ALTER TABLE `demande_medicament` DISABLE KEYS */;
INSERT INTO `demande_medicament` VALUES (1,4,'Augmentin 1g',NULL,3,'en_attente','2026-03-13 01:14:21'),(2,1,'Doliranne 500',NULL,2,'en_attente','2026-03-13 01:14:21');
/*!40000 ALTER TABLE `demande_medicament` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pharmacies`
--

DROP TABLE IF EXISTS `pharmacies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pharmacies` (
  `id` int NOT NULL AUTO_INCREMENT,
  `proporieter_id` int DEFAULT NULL,
  `nom_pharmacy` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `quartier_id` int DEFAULT NULL,
  `latitude` decimal(10,8) DEFAULT NULL,
  `longitude` decimal(11,8) DEFAULT NULL,
  `est_garde` tinyint(1) DEFAULT NULL,
  `est_ouvert` tinyint(1) DEFAULT NULL,
  `photo_license` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `statuts_verification` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `quartier_id` (`quartier_id`),
  KEY `proporieter_id` (`proporieter_id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pharmacies`
--

LOCK TABLES `pharmacies` WRITE;
/*!40000 ALTER TABLE `pharmacies` DISABLE KEYS */;
INSERT INTO `pharmacies` VALUES (1,2,'صيدلية الشفاء',1,18.08000000,-15.97000000,0,1,NULL,NULL),(2,2,'صيدلية الشفاء',1,18.08000000,-15.97000000,0,1,NULL,NULL),(3,3,'صيدلية الأمل',3,18.07000000,-15.93000000,1,1,NULL,NULL),(4,3,'صيدلية العافية',5,18.05000000,-15.98000000,0,1,NULL,NULL);
/*!40000 ALTER TABLE `pharmacies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `quartiers`
--

DROP TABLE IF EXISTS `quartiers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `quartiers` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nom_quartiers` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `quartiers`
--

LOCK TABLES `quartiers` WRITE;
/*!40000 ALTER TABLE `quartiers` DISABLE KEYS */;
INSERT INTO `quartiers` VALUES (1,'تفرغ زينة'),(2,'لكصر'),(3,'تفرغ زينة'),(4,'لكصر'),(5,'توجنين - Toujounine'),(6,'تيارت - Teyarett'),(7,'الميناء - El Mina');
/*!40000 ALTER TABLE `quartiers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reponce_pharmacy`
--

DROP TABLE IF EXISTS `reponce_pharmacy`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reponce_pharmacy` (
  `id` int NOT NULL AUTO_INCREMENT,
  `demande_id` int DEFAULT NULL,
  `pharmacie_id` int DEFAULT NULL,
  `est_disponnible` tinyint(1) DEFAULT NULL,
  `date_reponce` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `demande_id` (`demande_id`),
  KEY `pharmacie_id` (`pharmacie_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reponce_pharmacy`
--

LOCK TABLES `reponce_pharmacy` WRITE;
/*!40000 ALTER TABLE `reponce_pharmacy` DISABLE KEYS */;
INSERT INTO `reponce_pharmacy` VALUES (1,2,2,1,'2026-03-13 01:14:21');
/*!40000 ALTER TABLE `reponce_pharmacy` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `utilisateure`
--

DROP TABLE IF EXISTS `utilisateure`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `utilisateure` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nom_complet` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `telephone` varchar(14) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mots_de_passe` varchar(225) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `rol` enum('patient','pharmacy') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'patient',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `utilisateure`
--

LOCK TABLES `utilisateure` WRITE;
/*!40000 ALTER TABLE `utilisateure` DISABLE KEYS */;
INSERT INTO `utilisateure` VALUES (1,'أحمد مريض','22211111111','hash123','patient'),(2,'د. مريم صيدلانية','22222222222','hash456','pharmacy'),(3,'أحمد مريض','22211111111','hash123','patient'),(4,'د. مريم صيدلانية','22222222222','hash456','pharmacy'),(5,'سيدي محمد','22244556677','pbkdf2_sha256_x1','pharmacy'),(6,'فاطمة الزهراء','22233221100','pbkdf2_sha256_x2','patient');
/*!40000 ALTER TABLE `utilisateure` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-03-24 17:10:21

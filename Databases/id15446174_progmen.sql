-- MySQL dump 10.13  Distrib 8.0.20, for Win64 (x86_64)
--
-- Host: localhost    Database: id15446174_progmen
-- ------------------------------------------------------
-- Server version	8.0.19

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
-- Table structure for table `clients`
--

DROP TABLE IF EXISTS `clients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `clients` (
  `User_ID` int NOT NULL AUTO_INCREMENT,
  `Login` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `Password` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`User_ID`),
  UNIQUE KEY `Login` (`Login`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clients`
--

LOCK TABLES `clients` WRITE;
/*!40000 ALTER TABLE `clients` DISABLE KEYS */;
INSERT INTO `clients` VALUES (4,'123','$2y$10$zUooQLEzYeoGRR27Et88c.pcAqxglASvPNiKSRVU.3.s0QV/xotrC'),(11,'1234','$2y$10$xr6GbGRA7j.DKwIe91dkYuixkdwCxt0uQBJPcGa4CKMPPkfwcEQ/2'),(12,'12345','$2y$10$zh07VdA21NrlHYaq.Avo5O/QwQZEmJEC8u4OhCkX21m3C5xva3SYK');
/*!40000 ALTER TABLE `clients` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `colors`
--

DROP TABLE IF EXISTS `colors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `colors` (
  `Color_ID` int NOT NULL AUTO_INCREMENT,
  `Color` varchar(45) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `Color_Code` varchar(25) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `Color_Rank` int NOT NULL COMMENT '0 – First\\n9 – Last',
  PRIMARY KEY (`Color_ID`),
  UNIQUE KEY `Color_UNIQUE` (`Color`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `colors`
--

LOCK TABLES `colors` WRITE;
/*!40000 ALTER TABLE `colors` DISABLE KEYS */;
INSERT INTO `colors` VALUES (1,'Black','#000',0),(2,'Ocean','#3a5e6e',1),(3,'Orange','#aa281e',2),(4,'Darkblue','#33407e',3);
/*!40000 ALTER TABLE `colors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `images`
--

DROP TABLE IF EXISTS `images`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `images` (
  `Image_ID` int NOT NULL AUTO_INCREMENT,
  `Path` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `Image_Rank` int NOT NULL COMMENT '0 – First\\n9 – Last',
  PRIMARY KEY (`Image_ID`),
  UNIQUE KEY `Path_UNIQUE` (`Path`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `images`
--

LOCK TABLES `images` WRITE;
/*!40000 ALTER TABLE `images` DISABLE KEYS */;
INSERT INTO `images` VALUES (1,'/images/production_info/CPhone.png',0),(2,'/images/production_info/main_ocean.png',0),(3,'/images/production_info/main_orange.png',0),(4,'/images/production_info/main_blue.png',0),(5,'/images/production_info/back_black.png',1),(6,'/images/production_info/back_ocean.png',1),(7,'/images/production_info/back_orange.png',1),(8,'/images/production_info/back_blue.png',1),(9,'/images/production_info/right_black.png',2),(10,'/images/production_info/right_ocean.png',2),(11,'/images/production_info/right_orange.png',2),(12,'/images/production_info/right_blue.png',2);
/*!40000 ALTER TABLE `images` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `ID_User` int DEFAULT NULL,
  `ID_Model` int DEFAULT NULL,
  `ID_Image` int DEFAULT NULL,
  `Color` varchar(30) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `products` (
  `Product_ID` int NOT NULL AUTO_INCREMENT,
  `Model` varchar(60) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `Diagonal` varchar(10) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `Resolution` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `Display` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `Processor` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `ROM` varchar(8) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `RAM` varchar(6) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `Cores` int NOT NULL,
  `Videoprocessor` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `Camera` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `Front camera` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `Wireless interface` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `Unit of Wi-Fi` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `Numbers of SIM-card` int NOT NULL,
  `Type of SIM` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `Battery` int NOT NULL,
  `Price` int NOT NULL,
  PRIMARY KEY (`Product_ID`),
  UNIQUE KEY `Model` (`Model`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES (3,'Cumphone 7 PRO 16/512 Gb','6.67”','2340x1080','AMOLED','Snapdragon 955 Plus 2.3 Hz','512 Gb','16 Gb',12,'Adreno 615','108 MP + 12 MP + 24 MP','24MP w/ HDR','Bluetooth, Wi-Fi, NFC','802.11ax',2,'Nano-SIM',7000,69990),(4,'Cumphone 7 8/256 Gb','6.67”','2340x1080','AMOLED','Snapdragon 955 2.3 Hz','256 Gb','8 Gb',8,'Adreno 510','108 MP + 12 MP','16MP w/ HDR','Bluetooth, Wi-Fi, NFC','802.11ax',2,'Nano-SIM',5700,49990),(5,'Cumphone 3 3/64 Gb','5.1”','1600x720','AMOLED','Snapdragon 900 1.5 Hz','64','3',4,'Adreno 310','20 MP ','5 MP','Bluetooth, Wi-Fi, NFC','802.11ax',2,'Nano-SIM',3100,10999);
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products_views`
--

DROP TABLE IF EXISTS `products_views`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `products_views` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `ID_Product` int NOT NULL,
  `ID_Color` int NOT NULL,
  `ID_Image` int NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `ID_ProductFK_idx` (`ID_Product`),
  KEY `ID_ColorFK_idx` (`ID_Color`),
  KEY `ID_ImageFK_idx` (`ID_Image`),
  CONSTRAINT `ID_ColorFK` FOREIGN KEY (`ID_Color`) REFERENCES `colors` (`Color_ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `ID_ImageFK` FOREIGN KEY (`ID_Image`) REFERENCES `images` (`Image_ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `ID_ProductFK` FOREIGN KEY (`ID_Product`) REFERENCES `products` (`Product_ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products_views`
--

LOCK TABLES `products_views` WRITE;
/*!40000 ALTER TABLE `products_views` DISABLE KEYS */;
INSERT INTO `products_views` VALUES (1,3,1,1),(2,3,1,5),(3,3,1,9),(4,3,2,2),(5,3,2,6),(6,3,2,10),(7,3,3,3),(8,3,3,7),(9,3,3,11),(10,3,4,4),(11,3,4,8),(12,3,4,12),(13,4,1,1),(14,4,1,5),(15,4,1,9),(16,4,4,4),(17,4,4,8),(18,4,4,12),(19,5,1,1),(20,5,1,5),(21,5,1,9);
/*!40000 ALTER TABLE `products_views` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'id15446174_progmen'
--
/*!50003 DROP PROCEDURE IF EXISTS `GetAllPhones` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`id15446174_progman`@`localhost` PROCEDURE `GetAllPhones`(modelFilter varchar(60))
BEGIN
IF modelFilter != '' THEN
SELECT Model, Diagonal, Resolution, Display, Processor, ROM, RAM, Cores, Videoprocessor, Camera, `Front Camera`,
Price, `Path`
FROM (
	SELECT * FROM products_views 
	JOIN products ON products_views.ID_Product = products.Product_ID 
    JOIN colors ON products_views.ID_Color = colors.Color_ID 
    JOIN images ON products_views.ID_Image = images.Image_ID
) 
AS Tempo WHERE Color_Rank = 0 AND Image_Rank = 0 AND Model LIKE CONCAT('%', modelFilter, '%') ORDER BY `Color_Rank`;
ELSE 
SELECT Model, Diagonal, Resolution, Display, Processor, ROM, RAM, Cores, Videoprocessor, Camera, `Front Camera`,
Price, `Path`
FROM (
	SELECT * FROM products_views 
	JOIN products ON products_views.ID_Product = products.Product_ID 
    JOIN colors ON products_views.ID_Color = colors.Color_ID 
    JOIN images ON products_views.ID_Image = images.Image_ID
) 
AS Tempo WHERE Color_Rank = 0 AND Image_Rank = 0 ORDER BY `Color_Rank`;
END IF;
	/*  It can be better.
	It's possible to check all `Color_Rank` to find lowest for every phone
	*/
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetPhoneByModel` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`id15446174_progman`@`localhost` PROCEDURE `GetPhoneByModel`(ModelValue varchar(60))
BEGIN
SELECT Model, Diagonal, Resolution, Display, Processor, ROM, RAM, Cores, Videoprocessor, Camera, `Front Camera`,
`Wireless interface`, `Unit of Wi-Fi`, `Numbers of SIM-card`, `Type of SIM`, Battery, Price, Color, `Color_Code`, `Color_Rank`, `Path`, `Image_Rank`
FROM (
	SELECT * FROM products_views 
	JOIN products ON products_views.ID_Product = products.Product_ID 
    JOIN colors ON products_views.ID_Color = colors.Color_ID 
    JOIN images ON products_views.ID_Image = images.Image_ID
) 
AS Tempo 
WHERE Tempo.Model = ModelValue ORDER BY `Color_Rank`;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-01-02  9:08:43

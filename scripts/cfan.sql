-- MySQL dump 10.13  Distrib 8.0.25, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: cfandb
-- ------------------------------------------------------
-- Server version	8.0.25

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
-- Table structure for table `foodmenu`
--

DROP TABLE IF EXISTS `foodmenu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `foodmenu` (
  `Foodmenuid` int NOT NULL AUTO_INCREMENT,
  `Foodname` varchar(50) NOT NULL,
  `Totalkcal` int DEFAULT NULL,
  `Image` varchar(255) DEFAULT NULL,
  `Description` varchar(255) DEFAULT NULL,
  `Foodmenustatus` enum('PUBLISH','PERSONAL') NOT NULL DEFAULT 'PERSONAL',
  `Foodtype_Foodtypeid` int NOT NULL,
  `User_Userid` int DEFAULT NULL,
  PRIMARY KEY (`Foodmenuid`),
  KEY `fk_Foodmenu_Foodtype1_idx` (`Foodtype_Foodtypeid`),
  KEY `fk_Foodmenu_User1_idx` (`User_Userid`),
  CONSTRAINT `fk_Foodmenu_Foodtype1` FOREIGN KEY (`Foodtype_Foodtypeid`) REFERENCES `foodtype` (`Foodtypeid`),
  CONSTRAINT `fk_Foodmenu_User1` FOREIGN KEY (`User_Userid`) REFERENCES `user` (`Userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `foodmenu`
--

LOCK TABLES `foodmenu` WRITE;
/*!40000 ALTER TABLE `foodmenu` DISABLE KEYS */;
/*!40000 ALTER TABLE `foodmenu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `foodmenu_has_ingredients`
--

DROP TABLE IF EXISTS `foodmenu_has_ingredients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `foodmenu_has_ingredients` (
  `Foodmenu_Foodmenuid` int NOT NULL,
  `Ingredients_Ingredientsid` int NOT NULL,
  `Totalunit` int DEFAULT NULL,
  `Totalkcal` int DEFAULT NULL,
  PRIMARY KEY (`Foodmenu_Foodmenuid`,`Ingredients_Ingredientsid`),
  KEY `fk_Foodmenu_has_Ingredients_Ingredients1_idx` (`Ingredients_Ingredientsid`),
  KEY `fk_Foodmenu_has_Ingredients_Foodmenu1_idx` (`Foodmenu_Foodmenuid`),
  CONSTRAINT `fk_Foodmenu_has_Ingredients_Foodmenu1` FOREIGN KEY (`Foodmenu_Foodmenuid`) REFERENCES `foodmenu` (`Foodmenuid`),
  CONSTRAINT `fk_Foodmenu_has_Ingredients_Ingredients1` FOREIGN KEY (`Ingredients_Ingredientsid`) REFERENCES `ingredients` (`Ingredientsid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `foodmenu_has_ingredients`
--

LOCK TABLES `foodmenu_has_ingredients` WRITE;
/*!40000 ALTER TABLE `foodmenu_has_ingredients` DISABLE KEYS */;
/*!40000 ALTER TABLE `foodmenu_has_ingredients` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `foodtype`
--

DROP TABLE IF EXISTS `foodtype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `foodtype` (
  `Foodtypeid` int NOT NULL AUTO_INCREMENT,
  `Typename` varchar(50) NOT NULL,
  PRIMARY KEY (`Foodtypeid`),
  UNIQUE KEY `Typename_UNIQUE` (`Typename`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `foodtype`
--

LOCK TABLES `foodtype` WRITE;
/*!40000 ALTER TABLE `foodtype` DISABLE KEYS */;
/*!40000 ALTER TABLE `foodtype` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `foodtypereq`
--

DROP TABLE IF EXISTS `foodtypereq`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `foodtypereq` (
  `Typename` varchar(50) NOT NULL,
  `Request_Requestid` int NOT NULL,
  PRIMARY KEY (`Request_Requestid`),
  CONSTRAINT `fk_Foodtype_req_Request1` FOREIGN KEY (`Request_Requestid`) REFERENCES `request` (`Requestid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `foodtypereq`
--

LOCK TABLES `foodtypereq` WRITE;
/*!40000 ALTER TABLE `foodtypereq` DISABLE KEYS */;
/*!40000 ALTER TABLE `foodtypereq` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ingredients`
--

DROP TABLE IF EXISTS `ingredients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ingredients` (
  `Ingredientsid` int NOT NULL AUTO_INCREMENT,
  `Ingredientsname` varchar(50) NOT NULL,
  `kcalpunit` int DEFAULT NULL,
  `Unit` varchar(50) DEFAULT NULL,
  `Descriptionunit` varchar(255) DEFAULT NULL,
  `Ingredientstype` enum('Oil','Carb','Meat','Vegetable','Fruit','Condiment') NOT NULL,
  PRIMARY KEY (`Ingredientsid`),
  UNIQUE KEY `Ingredientsname_UNIQUE` (`Ingredientsname`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ingredients`
--

LOCK TABLES `ingredients` WRITE;
/*!40000 ALTER TABLE `ingredients` DISABLE KEYS */;
/*!40000 ALTER TABLE `ingredients` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ingredientsreq`
--

DROP TABLE IF EXISTS `ingredientsreq`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ingredientsreq` (
  `Ingredientsname` varchar(50) NOT NULL,
  `kcalpunit` int DEFAULT NULL,
  `Unit` varchar(50) DEFAULT NULL,
  `Descriptionunit` varchar(255) DEFAULT NULL,
  `Ingredientstype` enum('Oil','Carb','Meat','Vegetable','Fruit','Condiment') DEFAULT NULL,
  `Request_Requestid` int NOT NULL,
  PRIMARY KEY (`Request_Requestid`),
  CONSTRAINT `fk_Ingredientsreq_Request1` FOREIGN KEY (`Request_Requestid`) REFERENCES `request` (`Requestid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ingredientsreq`
--

LOCK TABLES `ingredientsreq` WRITE;
/*!40000 ALTER TABLE `ingredientsreq` DISABLE KEYS */;
/*!40000 ALTER TABLE `ingredientsreq` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jwtblacklist`
--

DROP TABLE IF EXISTS `jwtblacklist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jwtblacklist` (
  `Jwtblacklistid` int NOT NULL AUTO_INCREMENT,
  `token` varchar(255) DEFAULT NULL,
  `exp` datetime DEFAULT NULL,
  `User_Userid` int NOT NULL,
  PRIMARY KEY (`Jwtblacklistid`),
  KEY `fk_Jwtblacklist_User1_idx` (`User_Userid`),
  CONSTRAINT `fk_Jwtblacklist_User1` FOREIGN KEY (`User_Userid`) REFERENCES `user` (`Userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jwtblacklist`
--

LOCK TABLES `jwtblacklist` WRITE;
/*!40000 ALTER TABLE `jwtblacklist` DISABLE KEYS */;
/*!40000 ALTER TABLE `jwtblacklist` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `meal`
--

DROP TABLE IF EXISTS `meal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `meal` (
  `Mealid` int NOT NULL AUTO_INCREMENT,
  `Mealtime` enum('Breakfast','Lunch','Dinner','Lightmeal') DEFAULT NULL,
  `Datemeal` date DEFAULT NULL,
  `Totalkcal` int DEFAULT NULL,
  `User_Userid` int NOT NULL,
  PRIMARY KEY (`Mealid`),
  KEY `fk_Meal_User1_idx` (`User_Userid`),
  CONSTRAINT `fk_Meal_User1` FOREIGN KEY (`User_Userid`) REFERENCES `user` (`Userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `meal`
--

LOCK TABLES `meal` WRITE;
/*!40000 ALTER TABLE `meal` DISABLE KEYS */;
/*!40000 ALTER TABLE `meal` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `meal_has_foodmenu`
--

DROP TABLE IF EXISTS `meal_has_foodmenu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `meal_has_foodmenu` (
  `Meal_Mealid` int NOT NULL,
  `Foodmenu_Foodmenuid` int NOT NULL,
  `Totaldish` int DEFAULT NULL,
  `Totalkcal` int DEFAULT NULL,
  PRIMARY KEY (`Meal_Mealid`,`Foodmenu_Foodmenuid`),
  KEY `fk_Meal_has_Foodmenu_Foodmenu1_idx` (`Foodmenu_Foodmenuid`),
  KEY `fk_Meal_has_Foodmenu_Meal1_idx` (`Meal_Mealid`),
  CONSTRAINT `fk_Meal_has_Foodmenu_Foodmenu1` FOREIGN KEY (`Foodmenu_Foodmenuid`) REFERENCES `foodmenu` (`Foodmenuid`),
  CONSTRAINT `fk_Meal_has_Foodmenu_Meal1` FOREIGN KEY (`Meal_Mealid`) REFERENCES `meal` (`Mealid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `meal_has_foodmenu`
--

LOCK TABLES `meal_has_foodmenu` WRITE;
/*!40000 ALTER TABLE `meal_has_foodmenu` DISABLE KEYS */;
/*!40000 ALTER TABLE `meal_has_foodmenu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pin`
--

DROP TABLE IF EXISTS `pin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pin` (
  `Pinid` int NOT NULL AUTO_INCREMENT,
  `Email` varchar(50) DEFAULT NULL,
  `Pincode` varchar(255) DEFAULT NULL,
  `exp` datetime DEFAULT NULL,
  `User_Userid` int NOT NULL,
  PRIMARY KEY (`Pinid`),
  KEY `fk_Pin_User1_idx` (`User_Userid`),
  CONSTRAINT `fk_Pin_User1` FOREIGN KEY (`User_Userid`) REFERENCES `user` (`Userid`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pin`
--

LOCK TABLES `pin` WRITE;
/*!40000 ALTER TABLE `pin` DISABLE KEYS */;
/*!40000 ALTER TABLE `pin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `request`
--

DROP TABLE IF EXISTS `request`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `request` (
  `Requestid` int NOT NULL AUTO_INCREMENT,
  `Status` enum('WAIT','APPROVE','DISAPPROVED') NOT NULL DEFAULT 'WAIT',
  `User_Userid` int NOT NULL,
  PRIMARY KEY (`Requestid`),
  KEY `fk_Request_User1_idx` (`User_Userid`),
  CONSTRAINT `fk_Request_User1` FOREIGN KEY (`User_Userid`) REFERENCES `user` (`Userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `request`
--

LOCK TABLES `request` WRITE;
/*!40000 ALTER TABLE `request` DISABLE KEYS */;
/*!40000 ALTER TABLE `request` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `Userid` int NOT NULL AUTO_INCREMENT,
  `Username` varchar(50) NOT NULL,
  `Email` varchar(50) NOT NULL,
  `Password` varchar(255) NOT NULL,
  `Firstname` varchar(50) NOT NULL,
  `Lastname` varchar(50) DEFAULT NULL,
  `DoB` date DEFAULT NULL,
  `Gender` enum('M','F') DEFAULT NULL,
  `Weight` decimal(5,2) DEFAULT NULL,
  `Height` decimal(5,2) DEFAULT NULL,
  `Status` enum('TBC','NORMAL','ADMIN') NOT NULL DEFAULT 'TBC',
  `Image` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`Userid`),
  UNIQUE KEY `Username_UNIQUE` (`Username`),
  UNIQUE KEY `Email_UNIQUE` (`Email`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'cfanint222test','cfanint222test@gmail.com','$2a$10$Kpn1K7Vu6PsVpPtRQ2hmNOHhafIkokRb2flMJCxxpsxpdxcQADp.K','cfanint222','test','2000-01-01','M',50.00,180.00,'ADMIN',NULL);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-10-19 20:07:16

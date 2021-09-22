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
) ENGINE=InnoDB AUTO_INCREMENT=404 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `foodmenu`
--

LOCK TABLES `foodmenu` WRITE;
/*!40000 ALTER TABLE `foodmenu` DISABLE KEYS */;
INSERT INTO `foodmenu` VALUES (401,'Pasta',212,'Double...','Italian food','PUBLISH',301,101),(402,'Pizza',309,'Triple...','Italian food','PERSONAL',302,102),(403,'Panzenella',150,'Quad...','Italian food','PUBLISH',303,103);
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
INSERT INTO `foodmenu_has_ingredients` VALUES (401,201,5,212),(402,202,10,309),(403,203,15,150);
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
) ENGINE=InnoDB AUTO_INCREMENT=304 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `foodtype`
--

LOCK TABLES `foodtype` WRITE;
/*!40000 ALTER TABLE `foodtype` DISABLE KEYS */;
INSERT INTO `foodtype` VALUES (301,'boiled'),(302,'fried'),(303,'puff');
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
  UNIQUE KEY `Typename_UNIQUE` (`Typename`),
  CONSTRAINT `fk_Foodtype_req_Request1` FOREIGN KEY (`Request_Requestid`) REFERENCES `request` (`Requestid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `foodtypereq`
--

LOCK TABLES `foodtypereq` WRITE;
/*!40000 ALTER TABLE `foodtypereq` DISABLE KEYS */;
INSERT INTO `foodtypereq` VALUES ('boiled',605),('fried',604),('puff',606);
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
) ENGINE=InnoDB AUTO_INCREMENT=204 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ingredients`
--

LOCK TABLES `ingredients` WRITE;
/*!40000 ALTER TABLE `ingredients` DISABLE KEYS */;
INSERT INTO `ingredients` VALUES (201,'Tomato',50,'gram','Red vegetable','Vegetable'),(202,'Potato',100,'gram','Brown vegetable','Vegetable'),(203,'Onion',50,'gram','Cream vegetable','Vegetable');
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
  UNIQUE KEY `Ingredientsname_UNIQUE` (`Ingredientsname`),
  CONSTRAINT `fk_Ingredientsreq_Request1` FOREIGN KEY (`Request_Requestid`) REFERENCES `request` (`Requestid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ingredientsreq`
--

LOCK TABLES `ingredientsreq` WRITE;
/*!40000 ALTER TABLE `ingredientsreq` DISABLE KEYS */;
INSERT INTO `ingredientsreq` VALUES ('Tomato',212,'g','gram','Vegetable',601),('Potato',309,'g','gram','Vegetable',602),('Onion',150,'g','gram','Vegetable',603);
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
) ENGINE=InnoDB AUTO_INCREMENT=721 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jwtblacklist`
--

LOCK TABLES `jwtblacklist` WRITE;
/*!40000 ALTER TABLE `jwtblacklist` DISABLE KEYS */;
INSERT INTO `jwtblacklist` VALUES (707,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJwcmluY2lwYWwiOjExMSwicm9sZSI6Ik5PUk1BTCIsImlzcyI6ImNmYW5CYWNrZW5kIiwiZXhwIjoxNjMyMzA3MzE3fQ.ghH4h3vm5KtrFeqvezLWnx3Yb1W-LSjZaemFqQitttE','2021-09-21 17:41:57',111),(708,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJwcmluY2lwYWwiOjExMSwicm9sZSI6Ik5PUk1BTCIsImlzcyI6ImNmYW5CYWNrZW5kIiwiZXhwIjoxNjMyMzA5MzAwfQ.xiHbwadUJEGJNFxO-ysMNeraxjFMI9H14deS_ywzKf0','2021-09-21 18:15:00',111),(709,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJwcmluY2lwYWwiOjExMSwicm9sZSI6Ik5PUk1BTCIsImlzcyI6ImNmYW5CYWNrZW5kIiwiZXhwIjoxNjMyMzEzMjc4fQ.ZwmGJGLI8R6e3knQAAnyQbz5oyqQezDj9i-61EzhxDE','2021-09-21 19:21:18',111),(710,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJwcmluY2lwYWwiOjExMSwicm9sZSI6Ik5PUk1BTCIsImlzcyI6ImNmYW5CYWNrZW5kIiwiZXhwIjoxNjMyMzEzMzQ2fQ._l8b9jWJ-8f0_2soe8voiOJRUQ2EYA4gJZ-SnGPehIQ','2021-09-21 19:22:26',111),(711,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJwcmluY2lwYWwiOjExMSwicm9sZSI6Ik5PUk1BTCIsImlzcyI6ImNmYW5CYWNrZW5kIiwiZXhwIjoxNjMyMzE2NjAyfQ.d3iTmFJ8_lYLmtP4NK7beTIZhThzr23PVZs5U5K2BIA','2021-09-21 20:16:42',111),(712,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJwcmluY2lwYWwiOjExMSwicm9sZSI6Ik5PUk1BTCIsImlzcyI6ImNmYW5CYWNrZW5kIiwiZXhwIjoxNjMyMzE2OTI0fQ.-oBE0xU2h2msfuLtHj4AkFuYfTHMaieFdzd6i2eOcvc','2021-09-21 20:22:04',111),(713,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJwcmluY2lwYWwiOjExMSwicm9sZSI6Ik5PUk1BTCIsImlzcyI6ImNmYW5CYWNrZW5kIiwiZXhwIjoxNjMyMzE2OTcyfQ.tVuRhul82ahuhjSnCgvzyxSAsbuSuFT-tkx31-8238g','2021-09-21 20:22:52',111),(714,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJwcmluY2lwYWwiOjExMSwicm9sZSI6Ik5PUk1BTCIsImlzcyI6ImNmYW5CYWNrZW5kIiwiZXhwIjoxNjMyMzE3MDQxfQ.SjyPL-ZA4AimuTBtUJUD7V4pjwtTdfLcOUhWaw5s8LQ','2021-09-21 20:24:01',111),(715,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJwcmluY2lwYWwiOjExMSwicm9sZSI6Ik5PUk1BTCIsImlzcyI6ImNmYW5CYWNrZW5kIiwiZXhwIjoxNjMyMzE3MTcwfQ.Eqjy5ti7otbx5QZQYgM9KovIBl3HUqKiGlRaK8_T1ck','2021-09-21 20:26:10',111),(716,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJwcmluY2lwYWwiOjExMSwicm9sZSI6Ik5PUk1BTCIsImlzcyI6ImNmYW5CYWNrZW5kIiwiZXhwIjoxNjMyMzE3MjIxfQ.B_Di5PffQMyOf8SGqnxAkehE7FkTY0OIr83IxE05yME','2021-09-21 20:27:01',111),(717,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJwcmluY2lwYWwiOjExMSwicm9sZSI6Ik5PUk1BTCIsImlzcyI6ImNmYW5CYWNrZW5kIiwiZXhwIjoxNjMyMzE5NTg2fQ.g7rhHtjebifrzllrJggRtEv_HAYzU3HBXPpfJRff_ZU','2021-09-21 21:06:26',111),(718,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJwcmluY2lwYWwiOjExMSwicm9sZSI6Ik5PUk1BTCIsImlzcyI6ImNmYW5CYWNrZW5kIiwiZXhwIjoxNjMyMzE5Nzc5fQ.-p0uC_wGzf27p-5gDQBHxLUVViUViDII7Tdceqsou-0','2021-09-21 21:09:39',111),(719,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJwcmluY2lwYWwiOjExMSwicm9sZSI6Ik5PUk1BTCIsImlzcyI6ImNmYW5CYWNrZW5kIiwiZXhwIjoxNjMyMzI1NDQxfQ.yIAuGgfefUP3WiWHg0Dp5dKZf7h8y5Ixbu3U6d7LpWc','2021-09-22 22:44:01',111),(720,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJwcmluY2lwYWwiOjExMSwicm9sZSI6Ik5PUk1BTCIsImlzcyI6ImNmYW5CYWNrZW5kIiwiZXhwIjoxNjMyMzI1NDg5fQ.SkSWwEm8PGDBhciCPphrj9EMltTxfYGzMZcy8GXr98E','2021-09-22 22:44:49',111);
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
) ENGINE=InnoDB AUTO_INCREMENT=504 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `meal`
--

LOCK TABLES `meal` WRITE;
/*!40000 ALTER TABLE `meal` DISABLE KEYS */;
INSERT INTO `meal` VALUES (501,'Lunch','2021-03-21',550,101),(502,'Dinner','2021-03-22',600,102),(503,'Dinner','2021-03-23',450,103);
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
INSERT INTO `meal_has_foodmenu` VALUES (501,401,2,3500),(502,402,2,4200),(503,403,2,2500);
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
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb3;
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
) ENGINE=InnoDB AUTO_INCREMENT=607 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `request`
--

LOCK TABLES `request` WRITE;
/*!40000 ALTER TABLE `request` DISABLE KEYS */;
INSERT INTO `request` VALUES (601,'WAIT',101),(602,'WAIT',102),(603,'WAIT',101),(604,'WAIT',102),(605,'WAIT',101),(606,'WAIT',102);
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
) ENGINE=InnoDB AUTO_INCREMENT=112 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (101,'Ho','Ho@gmail.com','holycrab','Jo','Nathan','1980-03-21','M',90.00,200.00,'ADMIN','aaa.jpg'),(102,'Ly','Ly@gmail.com','holycrab','Jo','Seph','1968-06-15','F',85.00,195.00,'NORMAL','aaa.jpg'),(103,'Crab','Crag@gmail.com','holycrab','Jo','Taro','1991-09-13','M',80.00,190.00,'NORMAL','aaa.jpg'),(111,'Ho8','kamin124712@gmail.com','$2a$10$8INEOzKcHvihDwTtS5E1c.4zhp39C3y5CCQrIFM4lXfXPFdBu2hX.','Jo','aaaa','1980-03-21','M',90.00,200.00,'NORMAL',NULL);
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

-- Dump completed on 2021-09-22 16:48:57

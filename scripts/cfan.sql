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
-- Dumping data for table `foodmenu`
--

LOCK TABLES `foodmenu` WRITE;
/*!40000 ALTER TABLE `foodmenu` DISABLE KEYS */;
INSERT INTO `foodmenu` VALUES (401,'Pasta',212,'Double...','Italian food','PUBLISH',301,101),(402,'Pizza',309,'Triple...','Italian food','PERSONAL',302,102),(403,'Panzenella',150,'Quad...','Italian food','PUBLISH',303,103);
/*!40000 ALTER TABLE `foodmenu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `foodmenu_has_ingredients`
--

LOCK TABLES `foodmenu_has_ingredients` WRITE;
/*!40000 ALTER TABLE `foodmenu_has_ingredients` DISABLE KEYS */;
INSERT INTO `foodmenu_has_ingredients` VALUES (401,201,5,212),(402,202,10,309),(403,203,15,150);
/*!40000 ALTER TABLE `foodmenu_has_ingredients` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `foodtype`
--

LOCK TABLES `foodtype` WRITE;
/*!40000 ALTER TABLE `foodtype` DISABLE KEYS */;
INSERT INTO `foodtype` VALUES (301,'boiled'),(302,'fried'),(303,'puff');
/*!40000 ALTER TABLE `foodtype` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `foodtypereq`
--

LOCK TABLES `foodtypereq` WRITE;
/*!40000 ALTER TABLE `foodtypereq` DISABLE KEYS */;
INSERT INTO `foodtypereq` VALUES ('boiled',605),('fried',604),('puff',606);
/*!40000 ALTER TABLE `foodtypereq` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `ingredients`
--

LOCK TABLES `ingredients` WRITE;
/*!40000 ALTER TABLE `ingredients` DISABLE KEYS */;
INSERT INTO `ingredients` VALUES (201,'Tomato',50,'gram','Red vegetable','Vegetable'),(202,'Potato',100,'gram','Brown vegetable','Vegetable'),(203,'Onion',50,'gram','Cream vegetable','Vegetable');
/*!40000 ALTER TABLE `ingredients` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `ingredientsreq`
--

LOCK TABLES `ingredientsreq` WRITE;
/*!40000 ALTER TABLE `ingredientsreq` DISABLE KEYS */;
INSERT INTO `ingredientsreq` VALUES ('Tomato',212,'g','gram','Vegetable',601),('Potato',309,'g','gram','Vegetable',602),('Onion',150,'g','gram','Vegetable',603);
/*!40000 ALTER TABLE `ingredientsreq` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `jwtblacklist`
--

LOCK TABLES `jwtblacklist` WRITE;
/*!40000 ALTER TABLE `jwtblacklist` DISABLE KEYS */;
INSERT INTO `jwtblacklist` VALUES (707,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJwcmluY2lwYWwiOjExMSwicm9sZSI6Ik5PUk1BTCIsImlzcyI6ImNmYW5CYWNrZW5kIiwiZXhwIjoxNjMyMzA3MzE3fQ.ghH4h3vm5KtrFeqvezLWnx3Yb1W-LSjZaemFqQitttE','2021-09-21 17:41:57',111),(708,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJwcmluY2lwYWwiOjExMSwicm9sZSI6Ik5PUk1BTCIsImlzcyI6ImNmYW5CYWNrZW5kIiwiZXhwIjoxNjMyMzA5MzAwfQ.xiHbwadUJEGJNFxO-ysMNeraxjFMI9H14deS_ywzKf0','2021-09-21 18:15:00',111),(709,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJwcmluY2lwYWwiOjExMSwicm9sZSI6Ik5PUk1BTCIsImlzcyI6ImNmYW5CYWNrZW5kIiwiZXhwIjoxNjMyMzEzMjc4fQ.ZwmGJGLI8R6e3knQAAnyQbz5oyqQezDj9i-61EzhxDE','2021-09-21 19:21:18',111),(710,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJwcmluY2lwYWwiOjExMSwicm9sZSI6Ik5PUk1BTCIsImlzcyI6ImNmYW5CYWNrZW5kIiwiZXhwIjoxNjMyMzEzMzQ2fQ._l8b9jWJ-8f0_2soe8voiOJRUQ2EYA4gJZ-SnGPehIQ','2021-09-21 19:22:26',111),(711,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJwcmluY2lwYWwiOjExMSwicm9sZSI6Ik5PUk1BTCIsImlzcyI6ImNmYW5CYWNrZW5kIiwiZXhwIjoxNjMyMzE2NjAyfQ.d3iTmFJ8_lYLmtP4NK7beTIZhThzr23PVZs5U5K2BIA','2021-09-21 20:16:42',111),(712,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJwcmluY2lwYWwiOjExMSwicm9sZSI6Ik5PUk1BTCIsImlzcyI6ImNmYW5CYWNrZW5kIiwiZXhwIjoxNjMyMzE2OTI0fQ.-oBE0xU2h2msfuLtHj4AkFuYfTHMaieFdzd6i2eOcvc','2021-09-21 20:22:04',111),(713,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJwcmluY2lwYWwiOjExMSwicm9sZSI6Ik5PUk1BTCIsImlzcyI6ImNmYW5CYWNrZW5kIiwiZXhwIjoxNjMyMzE2OTcyfQ.tVuRhul82ahuhjSnCgvzyxSAsbuSuFT-tkx31-8238g','2021-09-21 20:22:52',111),(714,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJwcmluY2lwYWwiOjExMSwicm9sZSI6Ik5PUk1BTCIsImlzcyI6ImNmYW5CYWNrZW5kIiwiZXhwIjoxNjMyMzE3MDQxfQ.SjyPL-ZA4AimuTBtUJUD7V4pjwtTdfLcOUhWaw5s8LQ','2021-09-21 20:24:01',111),(715,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJwcmluY2lwYWwiOjExMSwicm9sZSI6Ik5PUk1BTCIsImlzcyI6ImNmYW5CYWNrZW5kIiwiZXhwIjoxNjMyMzE3MTcwfQ.Eqjy5ti7otbx5QZQYgM9KovIBl3HUqKiGlRaK8_T1ck','2021-09-21 20:26:10',111),(716,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJwcmluY2lwYWwiOjExMSwicm9sZSI6Ik5PUk1BTCIsImlzcyI6ImNmYW5CYWNrZW5kIiwiZXhwIjoxNjMyMzE3MjIxfQ.B_Di5PffQMyOf8SGqnxAkehE7FkTY0OIr83IxE05yME','2021-09-21 20:27:01',111),(717,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJwcmluY2lwYWwiOjExMSwicm9sZSI6Ik5PUk1BTCIsImlzcyI6ImNmYW5CYWNrZW5kIiwiZXhwIjoxNjMyMzE5NTg2fQ.g7rhHtjebifrzllrJggRtEv_HAYzU3HBXPpfJRff_ZU','2021-09-21 21:06:26',111),(718,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJwcmluY2lwYWwiOjExMSwicm9sZSI6Ik5PUk1BTCIsImlzcyI6ImNmYW5CYWNrZW5kIiwiZXhwIjoxNjMyMzE5Nzc5fQ.-p0uC_wGzf27p-5gDQBHxLUVViUViDII7Tdceqsou-0','2021-09-21 21:09:39',111),(719,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJwcmluY2lwYWwiOjExMSwicm9sZSI6Ik5PUk1BTCIsImlzcyI6ImNmYW5CYWNrZW5kIiwiZXhwIjoxNjMyMzI1NDQxfQ.yIAuGgfefUP3WiWHg0Dp5dKZf7h8y5Ixbu3U6d7LpWc','2021-09-22 22:44:01',111),(720,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJwcmluY2lwYWwiOjExMSwicm9sZSI6Ik5PUk1BTCIsImlzcyI6ImNmYW5CYWNrZW5kIiwiZXhwIjoxNjMyMzI1NDg5fQ.SkSWwEm8PGDBhciCPphrj9EMltTxfYGzMZcy8GXr98E','2021-09-22 22:44:49',111);
/*!40000 ALTER TABLE `jwtblacklist` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `meal`
--

LOCK TABLES `meal` WRITE;
/*!40000 ALTER TABLE `meal` DISABLE KEYS */;
INSERT INTO `meal` VALUES (501,'Lunch','2021-03-21',550,101),(502,'Dinner','2021-03-22',600,102),(503,'Dinner','2021-03-23',450,103);
/*!40000 ALTER TABLE `meal` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `meal_has_foodmenu`
--

LOCK TABLES `meal_has_foodmenu` WRITE;
/*!40000 ALTER TABLE `meal_has_foodmenu` DISABLE KEYS */;
INSERT INTO `meal_has_foodmenu` VALUES (501,401,2,3500),(502,402,2,4200),(503,403,2,2500);
/*!40000 ALTER TABLE `meal_has_foodmenu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `pin`
--

LOCK TABLES `pin` WRITE;
/*!40000 ALTER TABLE `pin` DISABLE KEYS */;
/*!40000 ALTER TABLE `pin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `request`
--

LOCK TABLES `request` WRITE;
/*!40000 ALTER TABLE `request` DISABLE KEYS */;
INSERT INTO `request` VALUES (601,'WAIT',101),(602,'WAIT',102),(603,'WAIT',101),(604,'WAIT',102),(605,'WAIT',101),(606,'WAIT',102);
/*!40000 ALTER TABLE `request` ENABLE KEYS */;
UNLOCK TABLES;

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

-- Dump completed on 2021-09-22 16:40:16

-- MySQL dump 10.13  Distrib 8.0.13, for Win64 (x86_64)
--
-- Host: localhost    Database: movieking
-- ------------------------------------------------------
-- Server version	8.0.13

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
 SET NAMES utf8 ;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `seat`
--

DROP TABLE IF EXISTS `seat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `seat` (
  `SEAT_CD` int(11) NOT NULL AUTO_INCREMENT COMMENT '좌석 코드',
  `SEAT_NM` varchar(45) CHARACTER SET utf8 NOT NULL COMMENT '좌석 이름',
  `SCREEN_CD` int(11) NOT NULL COMMENT '상영관 코드',
  PRIMARY KEY (`SEAT_CD`),
  KEY `FK_SEAT_SCREEN_CD_idx` (`SCREEN_CD`),
  CONSTRAINT `FK_SEAT_SCREEN_CD` FOREIGN KEY (`SCREEN_CD`) REFERENCES `screen` (`screen_cd`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=241 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `seat`
--

LOCK TABLES `seat` WRITE;
/*!40000 ALTER TABLE `seat` DISABLE KEYS */;
INSERT INTO `seat` VALUES (1,'A1',1),(2,'A2',1),(3,'A3',1),(4,'A4',1),(5,'A5',1),(6,'A6',1),(7,'A7',1),(8,'A8',1),(9,'A9',1),(10,'A10',1),(11,'B1',1),(12,'B2',1),(13,'B3',1),(14,'B4',1),(15,'B5',1),(16,'B6',1),(17,'B7',1),(18,'B8',1),(19,'B9',1),(20,'B10',1),(21,'C1',1),(22,'C2',1),(23,'C3',1),(24,'C4',1),(25,'C5',1),(26,'C6',1),(27,'C7',1),(28,'C8',1),(29,'C9',1),(30,'C10',1),(31,'D1',1),(32,'D2',1),(33,'D3',1),(34,'D4',1),(35,'D5',1),(36,'D6',1),(37,'D7',1),(38,'D8',1),(39,'D9',1),(40,'D10',1),(41,'A1',2),(42,'A2',2),(43,'A3',2),(44,'A4',2),(45,'A5',2),(46,'A6',2),(47,'A7',2),(48,'A8',2),(49,'A9',2),(50,'A10',2),(51,'B1',2),(52,'B2',2),(53,'B3',2),(54,'B4',2),(55,'B5',2),(56,'B6',2),(57,'B7',2),(58,'B8',2),(59,'B9',2),(60,'B10',2),(61,'C1',2),(62,'C2',2),(63,'C3',2),(64,'C4',2),(65,'C5',2),(66,'C6',2),(67,'C7',2),(68,'C8',2),(69,'C9',2),(70,'C10',2),(71,'D1',2),(72,'D2',2),(73,'D3',2),(74,'D4',2),(75,'D5',2),(76,'D6',2),(77,'D7',2),(78,'D8',2),(79,'D9',2),(80,'D10',2),(81,'A1',3),(82,'A2',3),(83,'A3',3),(84,'A4',3),(85,'A5',3),(86,'A6',3),(87,'A7',3),(88,'A8',3),(89,'A9',3),(90,'A10',3),(91,'B1',3),(92,'B2',3),(93,'B3',3),(94,'B4',3),(95,'B5',3),(96,'B6',3),(97,'B7',3),(98,'B8',3),(99,'B9',3),(100,'B10',3),(101,'C1',3),(102,'C2',3),(103,'C3',3),(104,'C4',3),(105,'C5',3),(106,'C6',3),(107,'C7',3),(108,'C8',3),(109,'C9',3),(110,'C10',3),(111,'D1',3),(112,'D2',3),(113,'D3',3),(114,'D4',3),(115,'D5',3),(116,'D6',3),(117,'D7',3),(118,'D8',3),(119,'D9',3),(120,'D10',3),(121,'A1',4),(122,'A2',4),(123,'A3',4),(124,'A4',4),(125,'A5',4),(126,'A6',4),(127,'A7',4),(128,'A8',4),(129,'A9',4),(130,'A10',4),(131,'B1',4),(132,'B2',4),(133,'B3',4),(134,'B4',4),(135,'B5',4),(136,'B6',4),(137,'B7',4),(138,'B8',4),(139,'B9',4),(140,'B10',4),(141,'C1',4),(142,'C2',4),(143,'C3',4),(144,'C4',4),(145,'C5',4),(146,'C6',4),(147,'C7',4),(148,'C8',4),(149,'C9',4),(150,'C10',4),(151,'D1',4),(152,'D2',4),(153,'D3',4),(154,'D4',4),(155,'D5',4),(156,'D6',4),(157,'D7',4),(158,'D8',4),(159,'D9',4),(160,'D10',4),(161,'A1',5),(162,'A2',5),(163,'A3',5),(164,'A4',5),(165,'A5',5),(166,'A6',5),(167,'A7',5),(168,'A8',5),(169,'A9',5),(170,'A10',5),(171,'B1',5),(172,'B2',5),(173,'B3',5),(174,'B4',5),(175,'B5',5),(176,'B6',5),(177,'B7',5),(178,'B8',5),(179,'B9',5),(180,'B10',5),(181,'C1',5),(182,'C2',5),(183,'C3',5),(184,'C4',5),(185,'C5',5),(186,'C6',5),(187,'C7',5),(188,'C8',5),(189,'C9',5),(190,'C10',5),(191,'D1',5),(192,'D2',5),(193,'D3',5),(194,'D4',5),(195,'D5',5),(196,'D6',5),(197,'D7',5),(198,'D8',5),(199,'D9',5),(200,'D10',5),(201,'A1',6),(202,'A2',6),(203,'A3',6),(204,'A4',6),(205,'A5',6),(206,'A6',6),(207,'A7',6),(208,'A8',6),(209,'A9',6),(210,'A10',6),(211,'B1',6),(212,'B2',6),(213,'B3',6),(214,'B4',6),(215,'B5',6),(216,'B6',6),(217,'B7',6),(218,'B8',6),(219,'B9',6),(220,'B10',6),(221,'C1',6),(222,'C2',6),(223,'C3',6),(224,'C4',6),(225,'C5',6),(226,'C6',6),(227,'C7',6),(228,'C8',6),(229,'C9',6),(230,'C10',6),(231,'D1',6),(232,'D2',6),(233,'D3',6),(234,'D4',6),(235,'D5',6),(236,'D6',6),(237,'D7',6),(238,'D8',6),(239,'D9',6),(240,'D10',6);
/*!40000 ALTER TABLE `seat` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-12-30  2:20:41

-- MySQL dump 10.14  Distrib 5.5.57-MariaDB, for Win64 (AMD64)
--
-- Host: localhost    Database: student
-- ------------------------------------------------------
-- Server version	5.5.57-MariaDB

DROP SCHEMA IF EXISTS `student`;
CREATE SCHEMA `student`;
USE `student`;

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `albums`
--

DROP TABLE IF EXISTS `albums`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `albums` (
  `id` int(6) NOT NULL,
  `name` varchar(45) NOT NULL,
  `medium` char(3) NOT NULL,
  `cost` decimal(10,2) DEFAULT NULL,
  `genre` varchar(50) DEFAULT NULL,
  `year_recorded` int(11) DEFAULT NULL,
  `label` varchar(50) DEFAULT NULL,
  `performer_id` int(6) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `ATperformerID_idx` (`performer_id`),
  CONSTRAINT `ATperformerID` FOREIGN KEY (`performer_id`) REFERENCES `performers` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `albums`
--

LOCK TABLES `albums` WRITE;
/*!40000 ALTER TABLE `albums` DISABLE KEYS */;
INSERT INTO `albums` VALUES (1,'The Black Light','vin',0.00,'Indie rock',1998,'Quarterstick',1),(2,'Magical Mystery Tour','vin',0.00,'Psychedelic rock',1967,'Parlophone, Capitol',2),(3,'Some Great Reward','vin',0.00,'Darkwave',1984,'Mute',3),(4,'Kind of Blue','cd',0.00,'Jazz',1959,'Columbia',4),(5,'Cigarettes & Alcohol','cd',0.00,'Britpop',1994,'Creation Records',5),(6,'Murder Ballads','cd',0.00,'Post punk',1996,'Mute Records',6),(7,'Body Language','cd',0.00,'Pop',2003,'Parlophone',7),(8,'Playing the Angel','cd',0.00,'Electronica',2005,'Mute',3),(9,'Batman Forever O.S.T.','cd',0.00,'Rock, R&B, Hip-Hop',1995,'Atlantic Records',0),(10,'Light Years','cd',0.00,'Pop',2000,'Parlophone, Capitol',NULL);
/*!40000 ALTER TABLE `albums` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `all_performers_tracks`
--

DROP TABLE IF EXISTS `all_performers_tracks`;
/*!50001 DROP VIEW IF EXISTS `all_performers_tracks`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `all_performers_tracks` (
  `tid` tinyint NOT NULL,
  `tname` tinyint NOT NULL,
  `pid` tinyint NOT NULL,
  `pname` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `performers`
--

DROP TABLE IF EXISTS `performers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `performers` (
  `id` int(6) NOT NULL,
  `name` varchar(50) NOT NULL,
  `country` varchar(50) DEFAULT NULL,
  `website` varchar(80) DEFAULT NULL,
  `birth_date` datetime DEFAULT NULL,
  `death_date` datetime DEFAULT NULL,
  `is_group` bit(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `performers`
--

LOCK TABLES `performers` WRITE;
/*!40000 ALTER TABLE `performers` DISABLE KEYS */;
INSERT INTO `performers` VALUES (0,'Various Artists',NULL,NULL,NULL,NULL,'\0'),(1,'Calexico','USA','www.casadecalexico.com','1996-01-01 00:00:00',NULL,''),(2,'The Beatles','UK','www.beatles.com','1960-10-01 00:00:00','1970-01-01 00:00:00',''),(3,'Depeche Mode','UK','http://www.depechemode.com/','1980-01-01 00:00:00',NULL,''),(4,'Miles Davis','USA','www.milesdavis.com','1926-05-25 00:00:00','1991-09-28 00:00:00','\0'),(5,'Oasis','UK','www.oasisinet.com','1991-01-01 00:00:00',NULL,''),(6,'Nick Cave','Australia','www.nick-cave.com','1957-09-22 00:00:00',NULL,'\0'),(7,'Kylie Minogue','Australia','www.kylie.com','1968-05-28 00:00:00',NULL,'\0'),(8,'Thom Yorke','UK','www.theeraser.net','1968-07-10 00:00:00',NULL,'\0');
/*!40000 ALTER TABLE `performers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `performers_tracks`
--

DROP TABLE IF EXISTS `performers_tracks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `performers_tracks` (
  `track_id` int(6) NOT NULL,
  `performer_id` int(6) NOT NULL,
  PRIMARY KEY (`track_id`,`performer_id`),
  KEY `trackID_idx` (`track_id`),
  KEY `PTperformerID` (`performer_id`),
  CONSTRAINT `PTperformerID` FOREIGN KEY (`performer_id`) REFERENCES `performers` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `PTtrackID` FOREIGN KEY (`track_id`) REFERENCES `tracks` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='		';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `performers_tracks`
--

LOCK TABLES `performers_tracks` WRITE;
/*!40000 ALTER TABLE `performers_tracks` DISABLE KEYS */;
INSERT INTO `performers_tracks` VALUES (1,6),(2,4),(3,4),(4,1),(5,1),(6,2),(7,2),(8,3),(9,3),(10,5),(11,5),(12,6),(12,7),(13,6),(14,7),(15,3),(16,3);
/*!40000 ALTER TABLE `performers_tracks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tracks`
--

DROP TABLE IF EXISTS `tracks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tracks` (
  `id` int(6) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `duration` decimal(8,2) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tracks`
--

LOCK TABLES `tracks` WRITE;
/*!40000 ALTER TABLE `tracks` DISABLE KEYS */;
INSERT INTO `tracks` VALUES (4,'There Is a Light',4.23),(5,'So What',9.22),(6,'All Blues',11.33),(7,'Sideshow',2.20),(8,'Vinegaroon',1.06),(9,'I Am the Walrus',4.36),(10,'Blue Jay Way',3.55),(11,'Master and Servant',4.11),(12,'People Are People',3.52),(13,'I Am the Walrus',8.14),(14,'Cigarettes & Alcohol',4.50),(15,'Where the Wild Roses Grow',3.56),(16,'Crow Jane',4.13),(17,'Slow',3.16),(18,'Precious',4.09),(19,'Nothing\'s Impossible',4.21);
/*!40000 ALTER TABLE `tracks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tracks_in_albums`
--

DROP TABLE IF EXISTS `tracks_in_albums`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tracks_in_albums` (
  `track_id` int(6) NOT NULL,
  `album_id` int(6) NOT NULL,
  `track_number` int(11) DEFAULT NULL,
  PRIMARY KEY (`track_id`,`album_id`),
  KEY `albumID_idx` (`album_id`),
  CONSTRAINT `TAtrackID` FOREIGN KEY (`track_id`) REFERENCES `tracks` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `TAalbumID` FOREIGN KEY (`album_id`) REFERENCES `albums` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tracks_in_albums`
--

LOCK TABLES `tracks_in_albums` WRITE;
/*!40000 ALTER TABLE `tracks_in_albums` DISABLE KEYS */;
INSERT INTO `tracks_in_albums` VALUES (1,9,9),(2,4,2),(3,4,4),(4,1,6),(5,1,11),(6,2,6),(7,2,4),(8,3,7),(9,3,3),(10,5,2),(11,5,1),(12,6,5),(13,6,8),(14,7,1),(15,8,5),(16,8,8);
/*!40000 ALTER TABLE `tracks_in_albums` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Final view structure for view `all_performers_tracks`
--

/*!50001 DROP TABLE IF EXISTS `all_performers_tracks`*/;
/*!50001 DROP VIEW IF EXISTS `all_performers_tracks`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`student`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `all_performers_tracks` AS select `tracks`.`id` AS `tid`,`tracks`.`name` AS `tname`,`performers`.`id` AS `pid`,`performers`.`name` AS `pname` from ((`performers` join `performers_tracks` on((`performers`.`id` = `performers_tracks`.`performer_id`))) join `tracks` on((`tracks`.`id` = `performers_tracks`.`track_id`))) */;
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

-- Dump completed on 2018-12-03 14:25:18

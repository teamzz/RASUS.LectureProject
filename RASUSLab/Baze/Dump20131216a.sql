CREATE DATABASE  IF NOT EXISTS `rsus` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `rsus`;
-- MySQL dump 10.13  Distrib 5.6.13, for Win32 (x86)
--
-- Host: localhost    Database: rsus
-- ------------------------------------------------------
-- Server version	5.5.29

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
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `category` (
  `idcategory` int(11) NOT NULL AUTO_INCREMENT,
  `category_name` varchar(45) NOT NULL,
  PRIMARY KEY (`idcategory`)
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` VALUES (39,'HTML'),(40,'CSS'),(41,'Konzistencija'),(42,'RASUS'),(43,'SU');
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `chosen_answer`
--

DROP TABLE IF EXISTS `chosen_answer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `chosen_answer` (
  `idchosen_answer` int(11) NOT NULL AUTO_INCREMENT,
  `text_answer` varchar(45) DEFAULT NULL,
  `idquiz` int(11) NOT NULL,
  `idquestion` int(11) NOT NULL,
  PRIMARY KEY (`idchosen_answer`),
  KEY `fk_chosen_answer_on_question_in_quiz_quiz1_idx` (`idquiz`),
  KEY `fk_chosen_answer_on_question_in_quiz_question1_idx` (`idquestion`),
  CONSTRAINT `fk_chosen_answer_on_question_in_quiz_question1` FOREIGN KEY (`idquestion`) REFERENCES `question` (`idquestion`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_chosen_answer_on_question_in_quiz_quiz1` FOREIGN KEY (`idquiz`) REFERENCES `quiz` (`idquiz`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=167 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `chosen_answer`
--

LOCK TABLES `chosen_answer` WRITE;
/*!40000 ALTER TABLE `chosen_answer` DISABLE KEYS */;
/*!40000 ALTER TABLE `chosen_answer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `correct_answer`
--

DROP TABLE IF EXISTS `correct_answer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `correct_answer` (
  `idcorrect_answers` int(11) NOT NULL AUTO_INCREMENT,
  `text_answer` varchar(45) NOT NULL,
  `idquestion` int(11) NOT NULL,
  PRIMARY KEY (`idcorrect_answers`),
  KEY `fk_corect_answers_question1_idx` (`idquestion`),
  CONSTRAINT `fk_corect_answers_question1` FOREIGN KEY (`idquestion`) REFERENCES `question` (`idquestion`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `correct_answer`
--

LOCK TABLES `correct_answer` WRITE;
/*!40000 ALTER TABLE `correct_answer` DISABLE KEYS */;
INSERT INTO `correct_answer` VALUES (19,'točan html',57),(20,'tocan 1',58);
/*!40000 ALTER TABLE `correct_answer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `incorrect_answers`
--

DROP TABLE IF EXISTS `incorrect_answers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `incorrect_answers` (
  `idincorrect_answer` int(11) NOT NULL AUTO_INCREMENT,
  `text_answer` varchar(45) NOT NULL,
  `idquestion` int(11) NOT NULL,
  PRIMARY KEY (`idincorrect_answer`),
  KEY `fk_answer_question_idx` (`idquestion`),
  CONSTRAINT `fk_answer_question` FOREIGN KEY (`idquestion`) REFERENCES `question` (`idquestion`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `incorrect_answers`
--

LOCK TABLES `incorrect_answers` WRITE;
/*!40000 ALTER TABLE `incorrect_answers` DISABLE KEYS */;
INSERT INTO `incorrect_answers` VALUES (41,'netočan html1',57),(42,'NETOCAN HTMLE2',57),(43,'netocanhtmel3',57),(44,'netocan 1 ',58),(45,'netocan2',58);
/*!40000 ALTER TABLE `incorrect_answers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `professor`
--

DROP TABLE IF EXISTS `professor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `professor` (
  `idprofessor` int(11) NOT NULL AUTO_INCREMENT,
  `first_name` varchar(45) NOT NULL,
  `surname` varchar(45) NOT NULL,
  `department` varchar(45) NOT NULL,
  `username` varchar(45) NOT NULL,
  `password` varchar(45) NOT NULL,
  PRIMARY KEY (`idprofessor`),
  UNIQUE KEY `username_UNIQUE` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `professor`
--

LOCK TABLES `professor` WRITE;
/*!40000 ALTER TABLE `professor` DISABLE KEYS */;
INSERT INTO `professor` VALUES (29,'Filip','Cajko','ZEMRIS','filippm','123');
/*!40000 ALTER TABLE `professor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `professor_has_category`
--

DROP TABLE IF EXISTS `professor_has_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `professor_has_category` (
  `idcategory` int(11) NOT NULL,
  `idprofessor` int(11) NOT NULL,
  PRIMARY KEY (`idcategory`,`idprofessor`),
  KEY `fk_category_has_professor_professor1_idx` (`idprofessor`),
  KEY `fk_category_has_professor_category1_idx` (`idcategory`),
  CONSTRAINT `fk_category_has_professor_category1` FOREIGN KEY (`idcategory`) REFERENCES `category` (`idcategory`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_category_has_professor_professor1` FOREIGN KEY (`idprofessor`) REFERENCES `professor` (`idprofessor`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `professor_has_category`
--

LOCK TABLES `professor_has_category` WRITE;
/*!40000 ALTER TABLE `professor_has_category` DISABLE KEYS */;
INSERT INTO `professor_has_category` VALUES (39,29),(40,29),(41,29),(42,29),(43,29);
/*!40000 ALTER TABLE `professor_has_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `question`
--

DROP TABLE IF EXISTS `question`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `question` (
  `idquestion` int(11) NOT NULL AUTO_INCREMENT,
  `text_question` varchar(200) NOT NULL,
  `idprofessor` int(11) NOT NULL,
  `idcategory` int(11) NOT NULL,
  PRIMARY KEY (`idquestion`),
  KEY `fk_question_professor1_idx` (`idprofessor`),
  KEY `fk_question_category1_idx` (`idcategory`),
  CONSTRAINT `fk_question_category1` FOREIGN KEY (`idcategory`) REFERENCES `category` (`idcategory`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_question_professor1` FOREIGN KEY (`idprofessor`) REFERENCES `professor` (`idprofessor`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=59 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `question`
--

LOCK TABLES `question` WRITE;
/*!40000 ALTER TABLE `question` DISABLE KEYS */;
INSERT INTO `question` VALUES (57,'HTML pitanje 1',29,39),(58,'html pitanje 2',29,39);
/*!40000 ALTER TABLE `question` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `quiz`
--

DROP TABLE IF EXISTS `quiz`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `quiz` (
  `idquiz` int(11) NOT NULL AUTO_INCREMENT,
  `quiz_name` varchar(45) NOT NULL,
  `idprofessor` int(11) NOT NULL,
  `idcategory` int(11) NOT NULL,
  `activated` bit(1) NOT NULL DEFAULT b'0',
  `code` varchar(45) NOT NULL DEFAULT '0',
  PRIMARY KEY (`idquiz`),
  UNIQUE KEY `code_UNIQUE` (`code`),
  KEY `fk_quiz_professor1_idx` (`idprofessor`),
  KEY `fk_quiz_category1_idx` (`idcategory`),
  CONSTRAINT `fk_quiz_category1` FOREIGN KEY (`idcategory`) REFERENCES `category` (`idcategory`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_quiz_professor1` FOREIGN KEY (`idprofessor`) REFERENCES `professor` (`idprofessor`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `quiz`
--

LOCK TABLES `quiz` WRITE;
/*!40000 ALTER TABLE `quiz` DISABLE KEYS */;
INSERT INTO `quiz` VALUES (22,'novi kviz za brisanje pitanja',29,39,'\0','nekikodkviza');
/*!40000 ALTER TABLE `quiz` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `quiz_has_question`
--

DROP TABLE IF EXISTS `quiz_has_question`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `quiz_has_question` (
  `idquiz` int(11) NOT NULL,
  `idquestion` int(11) NOT NULL,
  `activated` bit(1) NOT NULL,
  `order_number` int(11) NOT NULL,
  PRIMARY KEY (`idquiz`,`idquestion`),
  KEY `fk_quiz_has_question_question1_idx` (`idquestion`),
  KEY `fk_quiz_has_question_quiz1_idx` (`idquiz`),
  CONSTRAINT `fk_quiz_has_question_question1` FOREIGN KEY (`idquestion`) REFERENCES `question` (`idquestion`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_quiz_has_question_quiz1` FOREIGN KEY (`idquiz`) REFERENCES `quiz` (`idquiz`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `quiz_has_question`
--

LOCK TABLES `quiz_has_question` WRITE;
/*!40000 ALTER TABLE `quiz_has_question` DISABLE KEYS */;
INSERT INTO `quiz_has_question` VALUES (22,57,'\0',0);
/*!40000 ALTER TABLE `quiz_has_question` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `statistic_picture`
--

DROP TABLE IF EXISTS `statistic_picture`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `statistic_picture` (
  `idquestion` int(11) NOT NULL,
  `idquiz` int(11) NOT NULL,
  `picture` mediumblob,
  PRIMARY KEY (`idquestion`,`idquiz`),
  KEY `fk_statistic_picture_question1_idx` (`idquestion`),
  KEY `fk_statistic_picture_quiz1_idx` (`idquiz`),
  CONSTRAINT `fk_statistic_picture_question1` FOREIGN KEY (`idquestion`) REFERENCES `question` (`idquestion`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_statistic_picture_quiz1` FOREIGN KEY (`idquiz`) REFERENCES `quiz` (`idquiz`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `statistic_picture`
--

LOCK TABLES `statistic_picture` WRITE;
/*!40000 ALTER TABLE `statistic_picture` DISABLE KEYS */;
/*!40000 ALTER TABLE `statistic_picture` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2013-12-16 20:17:43

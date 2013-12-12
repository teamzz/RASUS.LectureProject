CREATE DATABASE  IF NOT EXISTS `rsus` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `rsus`;
-- MySQL dump 10.13  Distrib 5.6.13, for Win32 (x86)
--
-- Host: 127.0.0.1    Database: rsus
-- ------------------------------------------------------
-- Server version	5.6.15

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
  PRIMARY KEY (`idcategory`),
  UNIQUE KEY `category_name_UNIQUE` (`category_name`)
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` VALUES (32,'HTML1'),(34,'HTTP'),(35,'RAUSUS'),(33,'SOAP'),(36,'STROJNO'),(38,'USIS');
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
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
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `correct_answer`
--

LOCK TABLES `correct_answer` WRITE;
/*!40000 ALTER TABLE `correct_answer` DISABLE KEYS */;
INSERT INTO `correct_answer` VALUES (1,'tocan1',40),(2,'tocan2',40),(3,'Jezik',41),(4,'Äajko',42),(5,'Damjan',43),(6,'cetiri',44),(7,'Protokol',45),(8,'bsbab',46),(9,'Damjan',47);
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
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `incorrect_answers`
--

LOCK TABLES `incorrect_answers` WRITE;
/*!40000 ALTER TABLE `incorrect_answers` DISABLE KEYS */;
INSERT INTO `incorrect_answers` VALUES (1,'netoca2',40),(2,'netoca1',40),(3,'Protokol',41),(4,'Repozitorij',41),(5,'log(n)',41),(6,'Smrecki',42),(7,'Damjan',42),(8,'Matija',42),(9,'Äajko',43),(10,'Matija',43),(11,'Smrecki',43),(12,'pet',44),(13,'sest',44),(14,'sedam',44),(15,'Kon',45),(16,'fas',45),(17,'fsaf',45),(18,'sbabsa',46),(19,'bsab',46),(20,'bsaba',46);
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
INSERT INTO `professor` VALUES (26,'fsafsa','fsafsa','fsafa','fsaf','fsaf'),(27,'drugi','drugi','drugi','drugi ','drugi'),(28,'gsdg','dgs','gsdg','iivic','iivic'),(29,'Filip','Cajko','ZEMRIS','filippm','123');
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
INSERT INTO `professor_has_category` VALUES (32,26),(33,29),(34,29),(35,29),(36,29),(38,29);
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
) ENGINE=InnoDB AUTO_INCREMENT=48 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `question`
--

LOCK TABLES `question` WRITE;
/*!40000 ALTER TABLE `question` DISABLE KEYS */;
INSERT INTO `question` VALUES (32,'sagagsag',26,32),(33,'sgagsaga',26,32),(34,'gsagsag',26,32),(35,'saga',26,32),(36,'gsaga',26,32),(37,'sdad',27,32),(38,'fsafsa',27,32),(39,'fsafafasfa',27,32),(40,'Provpitnrj',28,32),(41,'Å to je HTML?',28,32),(42,'Tko je usis?',28,32),(43,'Tko je najlakÅ¡i?',28,32),(44,'Koliko je sati?',28,32),(45,'Å to je SOAP?',28,32),(46,'bsbab',28,33),(47,'Najmaji mobitel ima _____ .',28,32);
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
  KEY `fk_quiz_professor1_idx` (`idprofessor`),
  KEY `fk_quiz_category1_idx` (`idcategory`),
  CONSTRAINT `fk_quiz_category1` FOREIGN KEY (`idcategory`) REFERENCES `category` (`idcategory`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_quiz_professor1` FOREIGN KEY (`idprofessor`) REFERENCES `professor` (`idprofessor`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `quiz`
--

LOCK TABLES `quiz` WRITE;
/*!40000 ALTER TABLE `quiz` DISABLE KEYS */;
INSERT INTO `quiz` VALUES (1,'Quiz2',26,32,'\0','0'),(2,'Quiz2',26,32,'\0','0'),(3,'Quiz1',26,33,'\0','0'),(4,'Quiz2',26,38,'\0','0'),(5,'QuizKITA',26,38,'\0','0'),(6,'QuizNAdopeu',26,36,'\0','0');
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
INSERT INTO `quiz_has_question` VALUES (3,32),(4,32),(1,33),(2,33),(3,33),(2,34),(1,35),(3,36),(2,37),(4,37),(6,37),(1,38),(2,38),(2,39),(1,40),(2,40),(3,40),(5,40),(5,41),(4,42),(5,42),(6,42),(5,43),(4,44),(5,44),(6,44),(5,45),(4,46),(6,47);
/*!40000 ALTER TABLE `quiz_has_question` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2013-12-12 16:07:56

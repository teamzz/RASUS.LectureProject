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
  PRIMARY KEY (`idcategory`)
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` VALUES (39,'HTML'),(40,'CSS'),(41,'Konzistencija'),(42,'RASUS'),(43,'SU'),(44,'gsagas'),(45,'gasgsag');
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
  CONSTRAINT `fk_chosen_answer_on_question_in_quiz_question1` FOREIGN KEY (`idquestion`) REFERENCES `question` (`idquestion`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `fk_chosen_answer_on_question_in_quiz_quiz1` FOREIGN KEY (`idquiz`) REFERENCES `quiz` (`idquiz`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=211 DEFAULT CHARSET=utf8;
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
  CONSTRAINT `fk_corect_answers_question1` FOREIGN KEY (`idquestion`) REFERENCES `question` (`idquestion`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `correct_answer`
--

LOCK TABLES `correct_answer` WRITE;
/*!40000 ALTER TABLE `correct_answer` DISABLE KEYS */;
INSERT INTO `correct_answer` VALUES (17,'fsafsa',55),(18,'fsaf',56),(19,'csaca',57),(20,'tocan odg 1',58),(21,'dsafaf',59),(22,'Naƒçin ka≈ænjavanja slo≈æenosti',60),(23,'≈†najderov predmet!',61),(24,'Zanimljiv',62),(25,'gay',63),(26,'Tocan1',64),(27,'tocan',65),(28,'tocan',66);
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
  CONSTRAINT `fk_answer_question` FOREIGN KEY (`idquestion`) REFERENCES `question` (`idquestion`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=57 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `incorrect_answers`
--

LOCK TABLES `incorrect_answers` WRITE;
/*!40000 ALTER TABLE `incorrect_answers` DISABLE KEYS */;
INSERT INTO `incorrect_answers` VALUES (37,'fsafa',55),(38,'fsafas',55),(39,'fsafa',56),(40,'fsafasfa',56),(41,'csac',57),(42,'csac',57),(43,'netocan netocan',58),(44,'netoca',58),(45,'fsf',59),(46,'f',59),(47,'Model!',60),(48,'Hiperparametar',60),(49,'ƒåupiƒáev predmet!',61),(50,'Botiƒçkov predmet!',61),(51,'nije zanimvlji',62),(52,'bla bal',62),(53,'Netocan1',64),(54,'Netocan2',64),(55,'netocan',65),(56,'netocan',66);
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
  CONSTRAINT `fk_category_has_professor_category1` FOREIGN KEY (`idcategory`) REFERENCES `category` (`idcategory`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `fk_category_has_professor_professor1` FOREIGN KEY (`idprofessor`) REFERENCES `professor` (`idprofessor`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `professor_has_category`
--

LOCK TABLES `professor_has_category` WRITE;
/*!40000 ALTER TABLE `professor_has_category` DISABLE KEYS */;
INSERT INTO `professor_has_category` VALUES (39,29),(40,29),(41,29),(42,29),(43,29),(44,29),(45,29);
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
  CONSTRAINT `fk_question_category1` FOREIGN KEY (`idcategory`) REFERENCES `category` (`idcategory`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `fk_question_professor1` FOREIGN KEY (`idprofessor`) REFERENCES `professor` (`idprofessor`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=67 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `question`
--

LOCK TABLES `question` WRITE;
/*!40000 ALTER TABLE `question` DISABLE KEYS */;
INSERT INTO `question` VALUES (55,'fsafa',29,43),(56,'safasfa',29,39),(57,'cacc',29,39),(58,'Pitanje z htmla',29,42),(59,'drugo piranje',29,42),(60,'≈†to je regularizacija?',29,43),(61,'≈†to je Strojno uƒçenje?',29,43),(62,'Ovaj kviz je',29,43),(63,'≈†najder je',29,43),(64,'Pitanje1',29,43),(65,'≈†itanje\"',29,43),(66,'pitanje 3',29,43);
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
  CONSTRAINT `fk_quiz_category1` FOREIGN KEY (`idcategory`) REFERENCES `category` (`idcategory`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `fk_quiz_professor1` FOREIGN KEY (`idprofessor`) REFERENCES `professor` (`idprofessor`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `quiz`
--

LOCK TABLES `quiz` WRITE;
/*!40000 ALTER TABLE `quiz` DISABLE KEYS */;
INSERT INTO `quiz` VALUES (30,'Kviz1',29,43,'','kviz'),(32,'Kbiz2',29,43,'\0','haha'),(35,'jahah',29,43,'\0','bla'),(36,'kvizzasmrelea',29,43,'','aaaaa');
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
  `finished` bit(1) NOT NULL DEFAULT b'0',
  PRIMARY KEY (`idquiz`,`idquestion`),
  KEY `fk_quiz_has_question_question1_idx` (`idquestion`),
  KEY `fk_quiz_has_question_quiz1_idx` (`idquiz`),
  CONSTRAINT `fk_quiz_has_question_question1` FOREIGN KEY (`idquestion`) REFERENCES `question` (`idquestion`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `fk_quiz_has_question_quiz1` FOREIGN KEY (`idquiz`) REFERENCES `quiz` (`idquiz`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `quiz_has_question`
--

LOCK TABLES `quiz_has_question` WRITE;
/*!40000 ALTER TABLE `quiz_has_question` DISABLE KEYS */;
INSERT INTO `quiz_has_question` VALUES (32,55,'\0',0,'\0'),(35,63,'',0,'\0'),(35,65,'\0',1,'\0'),(36,55,'\0',0,''),(36,60,'\0',1,'');
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
  CONSTRAINT `fk_statistic_picture_question1` FOREIGN KEY (`idquestion`) REFERENCES `question` (`idquestion`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `fk_statistic_picture_quiz1` FOREIGN KEY (`idquiz`) REFERENCES `quiz` (`idquiz`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `statistic_picture`
--

LOCK TABLES `statistic_picture` WRITE;
/*!40000 ALTER TABLE `statistic_picture` DISABLE KEYS */;
INSERT INTO `statistic_picture` VALUES (55,36,'âPNG\r\n\Z\n\0\0\0\rIHDR\0\0X\0\0X\0\0\01ã\0\0\rOIDATx⁄Ì‹¡K}¿q!ó%\"XÍ$“a	ÈAó	Aàà0DêE¬K—!à¢£Dáz®ù\"Bº	\"bî\"QDÙ/ºÔè~<√æ3ª„Œ∂æèO~>ááù}ffggÏ˜ufgÌ˙	\0;Xó]\0ÄÄÄÄÄ¬f>|¯0::⁄””S*ï ÂÚ°Cá&\'\'WWWìñóóo‹∏Q´’Z\\av˛ÆøudÒBk€.ˇDˇwõãÓ“¢ÎÔà≈≈≈ÅÅÅ›ªwáåJ•“ﬂﬂø}÷BH«Ãœœá±©+cﬂæ}ü>}joêÕŒ_h\rõ.˛Ñ∞„oa+ˆI¯ï®˛G‚‹πs€gm ÑtÃ©Sß∫ö8˛|ßBÿŸ1˝ﬂ¬„[ÿµkW‹»œü?á…oﬂæmüµÅ“1•R)OØ_ø˛ÒÀ£Gè‚3Ârπ~»Nç›a∂æææ0OX√˛˝˚\'&&666öÕüZˆ˚˜Ô◊Ø_ßÒ’√‚”””qdleÒ‘‰ÃÃLÍ$£Ÿ∂Â)˚€[OÿçµZ-Ã˛;;;€∞|Ewi˝\"ÀÀÀaûJ•222íù!y≈µµµ±±±jµ\Z◊v˘ÚÂX†c‹p#s\\?Öˆ0![%å>q`∫wÔ^d[ü<yí}˛¬Ö-ñl||<;[µ€·´WØ‚„\'Nƒ9g€\nÖ∞Ωı‘_gèﬂøﬂbÛ_.yfÔﬁΩı3Ñº5¨Z®`OOOjmX__ˇùÊ∏6~*\nÌaB∂ µk◊RcÂËËË‹‹\\˛©√ë#G¬‰ÛÁœ˛∫◊&˜õÕüz¶ªª;NÆÆÆ.,,ƒ«·…O&ﬂΩ{∑gœû‡·√…ÈN˛∂5ì …ie°ı$õŒ“¬iSÿáq2<»EwÈpXˇ˝˚˜„dx˚\rW855\'√[òºzıjúÁs≠_ûÕŒê‡ä˛T¥w§@È∞?~\\ºx1˚ã˘ô3gr.ªE°=wÓ‹9~¸x¸ø•R©≈í%ß°aXOŒôr∆ﬂfâ\'=a NÓÎŸt€\Z\nÁO’j5ﬁ\"î∫~ÿ‚zíMä[˛õlaã!lqóÆ¨¨ƒ£ñøœ√oqÚÀó/Òífúk.0¨d62ˇ¿˝©h„HÅ≤U\'&&<Xﬂ¬ÒÒÒú!,úd/æµX≤ªwÔ÷/’ﬂﬂ6†ç&Íœﬂ∂ÜÜÜÜ‚<œû=ko=Õ∂πY:æKSì…Gø)ïJÂwBò‡äæÖ6é![niiÈÊÕõ˘ó›Çá∆´dÛÛÛEGÌ`nnÓÏŸ≥ı„ıÉä˙Ò4.lq€r.ä÷Ø§Ëzöms≥ÎΩﬂ•©…‰ÕîBÁ[\rﬂrŒÅ+˙ä)B∂Dr±kff&ﬁ5˙‚≈ãM?¥K>+äã¥¬ËÎ◊Ø∑n›JæπXt–üùùMæ˛ﬁ ∂eØÀÖ◊çM≠ˇE◊ì¸ﬂ∏+++q2úd∑¬ﬂ‹•©…ﬁﬁﬁdmÌ+Õﬂr√WÙ-⁄√ Ñlï………fﬂ#çI]g[___[[œîÀÂ‰ödÚÌÖÏuπd˛fÁ+·<‡„«è©´võ.^?˘ÊÕõ‘∑Û∑-%,’¢h—ı‘˘2åÈccc˘óóãÓ“¢!LÓÅ∫}˚vÿûó/_f?#l„fô¸WÙ-⁄√ ÑlïpJî˙h0πyÔÌ€∑qû£Gè&œ\r\r˝Ã‹Fü‹”œá≤Ûß∆∏¡¡¡Ï+NMM5{π¸!5Œ∆Ëx˚F˛∂5Î≥üQµ∑û˙Ø7Ñ«Òﬁñf€‹˙.-\Z¬çççxOfÍ¬∞ﬂ	a˛Å+˙\nÌaB∂∂Ö”””ΩΩΩ•_zzzFFFÍÔ	£g8ì•	ø¬ü>}:é≥√√√›››°óaÊ‰f¬ÜÛgáÈp R´’‚9AµZΩrÂJro”≈≥_ ÆˇÆB˛∂µ¬ˆ÷≥∞∞–◊◊v„±c«¬„fQ)∫K€¯≥s·\\3$*¸ñ_%4,˘Õ¶ÌÊ∏¢o°–!ÑÌ˝/üæ¨ó˙XÑÿ)!\'dKKK…’E«!vVÎˇ¬•KóÑ¯tˇÌˇˇ“\'OûåÉ;±˛OâÇ¿·_\0G{¸¯q^ü>}˙\0¯s	!\0B(Ñ\0° ÑBÄ\n!\0B(Ñ\0° Ñ\0 Ñ\0 Ñ\0 Ñ\0 Ñ\0 Ñ\0 Ñ\0 Ñ\0 Ñ\0 Ñ\0 Ñ\0 Ñ\0 Ñ\0 Ñ\0 Ñ\0 Ñ\0 Ñ\0 Ñ\0 Ñ\0 Ñ\0 Ñ\0 Ñ\0 Ñ\0 Ñ\0 Ñ\0 Ñ\0 Ñ\0 Ñ\0 Ñ\0 Ñ\0 Ñ\0 Ñ\0 Ñ\0 Ñ\0 Ñ\0 Ñ\0 Ñ\0 Ñ\0 Ñ\0 Ñ\0 Ñ\0 Ñ\0 Ñ\0 Ñ\0 Ñ\0° ÑBÄ\n!\0B(Ñ\0° ÑBÄ\n!\0B\0B\0B\0B\0B\0B\0B\0B\0B\0B\0B\0B\0B\0B\0B\0B\0B\0B\0B\0B\0B\0B\0B\0B\0B\0B\0B\0B\0B\0B\0B\0B\0B\0B\0B\0B\0B\0B\0B\0B\0B\0B\0B\0B\0BÄ\n!\0B(Ñ\0° ÑBÄ\n!\0B(Ñ\0°}ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ ÑBÄ\n!\0B(Ñ\0° ÑBÄ\n!\0B(Ñ\0!\0!\0!\0!\0!\0!\0!\0!\0!\0!\0!\0!\0!\0!\0!\0!\0!\0!\0!\0!\0!\0!\0!\0!\0!\0!\0!\0!\0!\0!\0!\0!\0!\0!\0!\0!\0!\0!\0!\0!\0!\0!\0!\0!\0!\0B(Ñ\0° ÑBÄ\n!\0B(Ñ\0° ÑBÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ ÑBÄ\n!\0B(Ñ\0° ÑBÄ\n!\0B\0B\0B\0B\0B\0B\0B\0B\0B\0B\0B\0B\0B\0B\0B\0B\0B\0B\0B\0B\0B\0B\0B\0B\0B\0B\0B\0B\0B\0B\0B\0B\0B\0B\0B\0B\0B\0B\0B\0B\0B\0B\0B\0B\0BÄ\n!\0B(Ñ\0° ÑBÄ\n!\0B(Ñ\0° Ñ\0 Ñ\0 Ñ\0 Ñ\0 Ñ\0 Ñ\0 Ñ\0 Ñ\0 Ñ\0 Ñ\0 Ñ\0 Ñ\0 Ñ\0 Ñ\0 Ñ\0 Ñ\0 Ñ\0 Ñ\0 Ñ\0 Ñ\0 Ñ\0 Ñ\0 Ñ\0 Ñ\0 Ñ\0 Ñ\0 Ñ\0 Ñ\0 Ñ\0 Ñ\0 Ñ\0 Ñ\0 Ñ\0 Ñ\0 Ñ\0 Ñ\0 Ñ\0 Ñ\0 Ñ\0 Ñ\0 Ñ\0 Ñ\0 Ñ\0 Ñ\0 Ñ\0° ÑBÄ\n!\0B(Ñ\0° ÑBÄ⁄G\0!\0!\0!\0!\0!\0!\0!\0!\0!\0!\0!\0!\0!\0!\0!\0!\0!\0!\0!\0!\0!\0!\0!\0!\0!\0!\0!\0!\0!\0!\0!\0!\0!\0!\0!\0!\0!\0!\0!\0!\0!\0!\0!\0!\0B(Ñ\0° ÑBÄ\n!\0B(Ñ\0° ÑBÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ ÑBÄ\n!\0B(Ñ\0° ÑBÄ\n!\0B(Ñ\0!\0!\0!\0!\0!\0!\0!\0!\0!\0!\0!\0!\0!\0!\0!\0!\0!\0!\0!\0!\0!\0!\0!\0!\0!\0!\0!\0!\0!\0!\0!\0!\0!\0!\0!\0!\0!\0!\0!\0!\0!\0!\0!\0!\0!\0B(Ñ\0° ÑBÄ\n!\0B(Ñ\0° Ñ\0 Ñ\0 Ñ\0 Ñ\0 Ñ\0 Ñ\0 Ñ\0 Ñ\0 Ñ\0 Ñ\0 Ñ\0 Ñ\0 Ñ\0 Ñ\0 Ñ\0 Ñ\0 Ñ\0 Ñ\0 Ñ\0 Ñ\0 Ñ\0 Ñ\0 Ñ\0 Ñ\0 Ñ\0 Ñ\0 Ñ\0 Ñ\0 Ñ\0 Ñ\0 Ñ\0 Ñ\0 Ñ\0 Ñ\0 Ñ\0 Ñ\0 Ñ\0 Ñ\0 Ñ\0 Ñ\0 Ñ\0 Ñ\0 Ñ\0 Ñ\0 Ñ\0° ÑÕB¯\0˛ty!ÄEB\0B\0ÿÅ˛ˆOE¿\\ÅC\0\0\0\0IENDÆB`Ç'),(60,36,'âPNG\r\n\Z\n\0\0\0\rIHDR\0\0X\0\0X\0\0\01ã\0\0HIDATx⁄Ì‹ˇg]˜¿Ò0ëööõöòëôô®à™©Ÿ~©™*•f™afZ3e¶3˝aLg?MŸLM[›ÃÃ~òô™öY©ö™NôâiMôôNTˇÖ}^˙∂∑Û9Á~yüìÙKnè*7Ω˜‰}œ}ﬂ˜Û‹ì{3v\0÷±1ª\0\0!\0!Ó´≈≈≈±±±£Gè∆øv!¨/ÀÀÀsssQ¡ŸŸŸ¯⁄!\0!!WØ^]\\\\úöö\Zﬂ∞a√ÙÙÙ¡ÉØ]ªñØpÂ ïwﬂ}wff¶pÉÕÎè˝gUnﬁjk Ñ˛ˇ1∑›•m∑ˇ¿Œç{6Ú{¸Ä>∞w|Öœùx¨_}ı’………ò\07n‹∑oﬂ•Kó¨ôB8jŒü?Û{¨·±«˚Ì∑ﬂ∫=yö◊oµÖ°7ÅÆ˙]∏˚‰nÃ\r!\\C!º~˝˙O<Q{ÙcJ¸¯„èVN!)/º¬X/ø¸ÚjÖpuà5∫tÆπªp7Ê∆Ë¨PÎ‡é«k¡tn›∫u¸¯Òtqvv÷ )Ñ#e||<MÓÔøˇ˛÷\'NúHﬂŸ∞aCı	_{Ê«’‚˘◊â-<˛¯„¯ÎØø˙]øv€ÂÂÂwﬁygzz:˝Ù∏˘°Cá˛˘Áü¬õ◊.;v,]‹ªwÔ‡±\rXŒöw∞€vb7ŒÃÃƒı„ﬂ≥gœˆ\\7€Ó“ÍMÆ\\π≤sÁŒ∏Œ√?ÀSÛ\n’√˘|R+∂ˆ⁄kØ˝Ò«≠ñÚŒs„œ?ˇ|„ç7‚≈Dl!˛}Î≠∑˙Ì∑n#ÔyÛœ>˚,FµuÎ÷¬ç\\∏paÀñ-õ7oéØáær\ZzÖíáØ:»~Ï0óññ^yÂïòi‚ù:ujUÜ˝»#è§+«Œåã1“≈∏¶ïSGJL˝4π?¸√XdKRﬂ<}˙tÛ˚ÒT,,ŸÎØøﬁºZ,[B¯›wﬂ•Øü˛˘î“ck¬n€©ûKåØ˘Âó¬˛q˘;è>˙hı\n±æ˜\\‡bÂööö™mÌ…\'üºq„FyªÕçXFü}ˆŸ⁄˜ÁÊÊnﬁºY¬íë˜ºy,ÂÒo%îl‰Í’´’=Y=ÿ-ÑÖ_uêÂ!ºÒ∏≥õ6m™˝Ôó_~πÚaW≈¡k˙çWÑB8Ç>\\[,b∫ü;wn1{ZÈæ˙Í´¥¶‰uøpâ√tÒ⁄µk˘`<æŸv\r∫tÈR:h}˙ÈßÛÒ˛‡±ıìWÑ¸≤≤’vÚê‚UZu…à/\nÃwÈ˛˝˚c˚¸q∫wøÁ„Y∫/µ„‚€oøù.∆ÒÚvõÒ#™C›∑o_∫[+	a…»{ﬁ<éÆ‚%Àœ?ˇ\\≤ë8Ä»Pr~~~Ö!,|¯™ÉÏ∑ˇ€N≈|g”	Ã∏ÀÒısœ=∑Úagˇ˝w>OØ;„9kÂ¬ëœúºTUmﬂæ}¿i∑$⁄sÙË—≠[∑÷Nò]DÚKçX+Ûk¶kkø\'s:ÍèÇÊ˜n[OqL=99ôﬁR;ÅV∏ù<§4í¯7è∞0ÑÖªtii©ÁI™⁄„» ]å%,Œßã˘Ã·›õ±Á≥∏q1ﬂ¸™´$ÑmGûoûÍR∏ëßûz™Á„µíS£%_uê=∑–a*Ê;õÊ∆Ôøˇ˛‚ã/˛√+vv‡¿Å‹»3gŒX6Öp4]ºx1Êz^Ú—ÎÄ\'O6œ>.\"|AıV;vÏàtaVΩ˘‡±ı¥gœûtù/æ¯¢€v˙çπ_®V}ó÷.Ê_Ô’ƒ·¸›û˘G◊Ü˙–CïÏ∫∂#œWàl7«–o#1ò∂ùzÖíáØ:»ûs†√TlÓª∑’∞≥‘ÊÌ∑ﬂZ-ÖpÙ]æ|˘»ë#ÉOªÖ„«èß”õ;wÓ<˛|€E$ú;wn◊Æ]’Î”O?mªÂÁÁÓ›ª«6‡§hu#m∑”oÃ˝Œ˜Æ˙.≠]Ã}ÕJﬁÊP87ÚyÔn!l;ÚûèÀ–ç¨z€>|=øŸm*6ÔKy\'˘∫}o∞Æ˘,Â±c«“;ø˛˙Î°ø¥Àã]∫Iá&7oﬁ|ÔΩ˜Úß”⁄ÆAgœûÕø∫àe∫dlÕSëÒsSS´üoªù¸øiKKKÈbºê*\\gW∏KküyÊôÊKê{37˙ù\ZÕªb\"€v‰=ó°©ù\ZÕÉl÷%m·˙ıÎÉwx€áØ˘ÕŒSqzz:]¸ı◊_”‹ã\'E·©—Vì!YÏ˜Y±x:’ŒΩ‹∏q#Ωë:Ω˘-ùìÃü^hû´…◊Ô∑ ƒAh<{kß≠ÜﬁºzÒÃô3µO∂\r[M‹™Áô®∂€©~¿.î¸¨~ß€Ó“∂!ÃÔsyˇ˝˜c<ﬂ|ÛMÛ7mCWΩns#ø3%Ω˘0ˇñqËª] G>4ÑC7íﬂ∑º∏∏W»”†˘kÏO>˘$Æ∞∞∞0xá∑}¯öﬂÏ<ÛõeÊÁÁc®Èb\nîÃì¬I.êB8‚‚8¥ˆÎü¸[Ò¸ã˝Õõ7ÁÔÔŸ≥Áv„Û˘ùËÈıPÛ˙µ\'“Ó›ªõ?1û¿˝~‹‡\'s∫~ƒ5ΩÔfÿ˙=√õø È∂ùÍõÚ„ÎÙ˛Ö~c.ﬂ•mCÿÛ3q®GÂ´[∑πEÃØQ≤(P·«\'JF>tç∫ëx\\™èTı È\n˘Ì!ÕáµÁœm˚›nÛÒâ¡è„èúÌÏÙÈ”%Û§pí°Æã:t(!«Ôòööä„ﬂÍõ9c˘àÖ,J«è/ΩÙRZhˆÔﬂ?11kb,˘ÃR|≥Áıõã]≥œÃÃ§“………7ﬂ|3ü≈\ZzÛÊÁ–´üU<∂Úv€ŒÖfggc7ŒÕÕUﬂe^€x€]⁄·Ω§8∂àí•ü’∑,ÆnÊF˙—ÒÄ¶øP∫i”¶xçÿØÇ›F^r/Ün‰ßü~Jè‘ñ-[ÚªFÛ)ﬂx8ˆÓ›;q«ˆÌ€„∂Cè<Z=|≠B8t*∆¯„($}(>ÓTÆ`…S…$B!ÑÇ˘zøWä⁄:æÊv›˝y˛ıÿ–œõé∆D]ãÛDA-‚ó/_Œß∂÷–Nªè#œø⁄ºxÒb„£è>J”ﬂ|Ikwû!·’œºœœœØ°ùvG^}ÛKUıœ√éòµ;OÑ÷Üâˇ‹˚Ωm€∂Ù7∏c•Î˜9L˜q‰ÀÀÀGéIl:˝Ül«é#\\¡5=OÑ\0ÑéS\00“Nû<9(Ñü˛˘ø\00∫Ñ\0!B\0ÑPB!@Ö\0!B\0ÑPB\0B\0B\0B\0B\0B\0B\0B\0B\0B\0B\0B\0B\0B\0B\0B\0B\0B\0B\0B\0B\0B\0B\0B\0B\0B\0B\0B\0B\0B\0B\0B\0B\0B\0B\0B\0B\0B\0B\0B\0B\0B\0B\0B\0B\0ÑPB!@Ö\0!B\0ÑPB!@Ö\0!\0!\0!\0!\0!\0!\0!\0!\0!\0!\0!\0!\0!\0!\0!\0!\0!\0!\0!\0!\0!\0!\0!\0!\0!\0!\0!\0!\0!\0!\0!\0!\0!\0!\0!\0!\0!\0!\0!\0!\0!\0!\0!\0!\0!@Ö\0!B\0ÑPB!@Ö\0!B\0Ñ–>@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@B!@Ö\0!B\0ÑPB!@Ö\0!B\0Ñ\0Ñ\0Ñ\0Ñ\0Ñ\0Ñ\0Ñ\0Ñ\0Ñ\0Ñ\0Ñ\0Ñ\0Ñ\0Ñ\0Ñ\0Ñ\0Ñ\0Ñ\0Ñ\0Ñ\0Ñ\0Ñ\0Ñ\0Ñ\0Ñ\0Ñ\0Ñ\0Ñ\0Ñ\0Ñ\0Ñ\0Ñ\0Ñ\0Ñ\0Ñ\0Ñ\0Ñ\0Ñ\0Ñ\0Ñ\0Ñ\0Ñ\0Ñ\0Ñ\0Ñ\0!B\0ÑPB!@Ö\0!B\0ÑPB!@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@B!@Ö\0!B\0ÑPB!@Ö\0!\0!\0!\0!\0!\0!\0!\0!\0!\0!\0!\0!\0!\0!\0!\0!\0!\0!\0!\0!\0!\0!\0!\0!\0!\0!\0!\0!\0!\0!\0!\0!\0!\0!\0!\0!\0!\0!\0!\0!\0!\0!\0!\0!\0!@Ö\0!B\0ÑPB!@Ö\0!B\0ÑPB\0B\0B\0B\0B\0B\0B\0B\0B\0B\0B\0B\0B\0B\0B\0B\0B\0B\0B\0B\0B\0B\0B\0B\0B\0B\0B\0B\0B\0B\0B\0B\0B\0B\0B\0B\0B\0B\0B\0B\0B\0B\0B\0B\0B\0ÑPB!@Ö\0!B\0ÑPB!@Ì#\0Ñ\0Ñ\0Ñ\0Ñ\0Ñ\0Ñ\0Ñ\0Ñ\0Ñ\0Ñ\0Ñ\0Ñ\0Ñ\0Ñ\0Ñ\0Ñ\0Ñ\0Ñ\0Ñ\0Ñ\0Ñ\0Ñ\0Ñ\0Ñ\0Ñ\0Ñ\0Ñ\0Ñ\0Ñ\0Ñ\0Ñ\0Ñ\0Ñ\0Ñ\0Ñ\0Ñ\0Ñ\0Ñ\0Ñ\0Ñ\0Ñ\0Ñ\0Ñ\0Ñ\0!B\0ÑPB!@Ö\0!B\0ÑPB!@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@B!@Ö\0!B\0ÑPB!@Ö\0!B\0Ñ\0Ñ\0Ñ\0Ñ\0Ñ\0Ñ\0Ñ\0Ñ\0Ñ\0Ñ\0Ñ\0Ñ\0Ñ\0Ñ\0Ñ\0Ñ\0Ñ\0Ñ\0Ñ\0Ñ\0Ñ\0Ñ\0Ñ\0Ñ\0Ñ\0Ñ\0Ñ\0Ñ\0Ñ\0Ñ\0Ñ\0Ñ\0Ñ\0Ñ\0Ñ\0Ñ\0Ñ\0Ñ\0Ñ\0Ñ\0Ñ\0Ñ\0Ñ\0Ñ\0Ñ\0!B\0ÑPB!@Ö\0!B\0ÑPB\0B\0B\0B\0B\0B\0B\0B\0B\0B\0B\0B\0B\0B\0B\0B\0B\0B\0B\0B\0B\0B\0B\0B\0B\0B\0B\0B\0B\0B\0B\0B\0B\0B\0B\0B\0B\0B\0B\0B\0B\0B\0B\0B\0B\0ÑP¬~!<	\0£nP`]B\0Ñ\0Ñ\0÷°ˇË˜öﬁ√8ß.\0\0\0\0IENDÆB`Ç');
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

-- Dump completed on 2013-12-18 12:52:48

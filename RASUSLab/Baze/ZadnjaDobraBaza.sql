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
INSERT INTO `correct_answer` VALUES (17,'fsafsa',55),(18,'fsaf',56),(19,'csaca',57),(20,'tocan odg 1',58),(21,'dsafaf',59),(22,'Način kažnjavanja složenosti',60),(23,'Šnajderov predmet!',61),(24,'Zanimljiv',62),(25,'gay',63),(26,'Tocan1',64),(27,'tocan',65),(28,'tocan',66);
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
INSERT INTO `incorrect_answers` VALUES (37,'fsafa',55),(38,'fsafas',55),(39,'fsafa',56),(40,'fsafasfa',56),(41,'csac',57),(42,'csac',57),(43,'netocan netocan',58),(44,'netoca',58),(45,'fsf',59),(46,'f',59),(47,'Model!',60),(48,'Hiperparametar',60),(49,'Čupićev predmet!',61),(50,'Botičkov predmet!',61),(51,'nije zanimvlji',62),(52,'bla bal',62),(53,'Netocan1',64),(54,'Netocan2',64),(55,'netocan',65),(56,'netocan',66);
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
INSERT INTO `question` VALUES (55,'fsafa',29,43),(56,'safasfa',29,39),(57,'cacc',29,39),(58,'Pitanje z htmla',29,42),(59,'drugo piranje',29,42),(60,'Što je regularizacija?',29,43),(61,'Što je Strojno učenje?',29,43),(62,'Ovaj kviz je',29,43),(63,'Šnajder je',29,43),(64,'Pitanje1',29,43),(65,'Šitanje\"',29,43),(66,'pitanje 3',29,43);
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
INSERT INTO `statistic_picture` VALUES (55,36,'�PNG\r\n\Z\n\0\0\0\rIHDR\0\0X\0\0X\0\0\01�\0\0\rOIDATx����K}�q!�%\"X�$�a	�A�	A��0D�E�K�!���D�z��\"B�	\"b��\"QD�/��~<þ3��ζ��O~>���}ffgg��ufg��	\0;X�]\0������f>|�0::���S*����C�&\'\'WWW����oܸQ��Z\\av���ud�Bk�.�D�w���Ң����Ł��ݻw��J���߿}�BH���χ��+c߾}�>}jo���_h\r�.����oa+�I����G�ܹs�gm �t̩S���8�|�B��1����[صkW��ϟ?��o߾m����1�R)O�_���ˣG��3�r�~�N��a����0OX����\'&&666�͟Z����ׯ_��������qdle�����L�$�ٶ�)��[O؍�Z-��;;;۰|Ewi�\"���a�J�222��!yŵ�����j�\Z�v���X�c�p#s\\?��0![%�>q`�w�^d[�<y�}�-�l||<;[���W���\'N�9g�\n�����_g�߿�b�_.yf�޽�3��5�Z�`OOOjmX__����6~*\n�aB�ʵk�Rc������\\��Ñ#G��������&��͟z���;N���.,,����O&߽{�gϞ�������N��5���ie��$����iS؇q2<�Ew���pX�����dx�\rW855\'�[��z�j��s�_��ΐ���T�w�@�?~\\�x1����3gr.�E�=w��9~�x���R�Œ%��aXOΙr��f�\'=a N���t�\Z\n�O�j5�\"��~��z�M�[��la�!lq����ģ����oq�˗/�f�k.0�d62����h�H��U\'&&<X�����!,�d/��X��w��/���6��&��߶�����<Ϟ=ko=Ͷ�Y:�KS��G�)�J�wB�����6�![nii��͛��݂�ƫd���EG�`nn��ٳ�������4.lq�r.�֯��z�ms��ߥ���͔B�[\r�r΁+��)B�Dr�kff&�5��ŋM?�K>+������ׯ�n�J��XtП��M���ʶe�˅׍M��Eד�߸+++q2�d���ܥ�����dm�+��r�W�-�� �l����f�#�I]g[___[[ϔ���d���u�d�f�+�<��Ǐ��v�.^?��͛Է�-%,��h����2��ccc�����Ң!L}�v؞�/_f?#l�f��W�-�� �l�pJ��h0�y��۷q��G�&�\r\r���F���χ��Ƹ����+NMM5{��!5���x�F��5볟Q�����7���ޖf���.-\Z��xOf����	a��+�\n�aB�����ӽ���_zzzFFF��	�g8��	�>}:�������ݡ�a��f�g��p�R���9A�Z�r�Jro�ų_ʮ��B�����ֳ�����v�c���fQ)�K���s�\\3$*��_%4,�ͦ����o��!���/🾬��X��)!\'dKKK��E�!vV��¥K���t�����\'O���;��O����_\0�G{��q^�>}�\0�s	!\0B(�\0� �B�\n!\0B(�\0� �\0 �\0 �\0 �\0 �\0 �\0 �\0 �\0 �\0 �\0 �\0 �\0 �\0 �\0 �\0 �\0 �\0 �\0 �\0 �\0 �\0 �\0 �\0 �\0 �\0 �\0 �\0 �\0 �\0 �\0 �\0 �\0 �\0 �\0 �\0 �\0 �\0 �\0 �\0 �\0 �\0 �\0 �\0 �\0 �\0� �B�\n!\0B(�\0� �B�\n!\0B\0B\0B\0B\0B\0B\0B\0B\0B\0B\0B\0B\0B\0B\0B\0B\0B\0B\0B\0B\0B\0B\0B\0B\0B\0B\0B\0B\0B\0B\0B\0B\0B\0B\0B\0B\0B\0B\0B\0B\0B\0B\0B\0B\0B�\n!\0B(�\0� �B�\n!\0B(�\0�}�������������������������������������������� �B�\n!\0B(�\0� �B�\n!\0B(�\0!\0!\0!\0!\0!\0!\0!\0!\0!\0!\0!\0!\0!\0!\0!\0!\0!\0!\0!\0!\0!\0!\0!\0!\0!\0!\0!\0!\0!\0!\0!\0!\0!\0!\0!\0!\0!\0!\0!\0!\0!\0!\0!\0!\0!\0B(�\0� �B�\n!\0B(�\0� �B��������������������������������������������� �B�\n!\0B(�\0� �B�\n!\0B\0B\0B\0B\0B\0B\0B\0B\0B\0B\0B\0B\0B\0B\0B\0B\0B\0B\0B\0B\0B\0B\0B\0B\0B\0B\0B\0B\0B\0B\0B\0B\0B\0B\0B\0B\0B\0B\0B\0B\0B\0B\0B\0B\0B�\n!\0B(�\0� �B�\n!\0B(�\0� �\0 �\0 �\0 �\0 �\0 �\0 �\0 �\0 �\0 �\0 �\0 �\0 �\0 �\0 �\0 �\0 �\0 �\0 �\0 �\0 �\0 �\0 �\0 �\0 �\0 �\0 �\0 �\0 �\0 �\0 �\0 �\0 �\0 �\0 �\0 �\0 �\0 �\0 �\0 �\0 �\0 �\0 �\0 �\0 �\0� �B�\n!\0B(�\0� �B��G\0!\0!\0!\0!\0!\0!\0!\0!\0!\0!\0!\0!\0!\0!\0!\0!\0!\0!\0!\0!\0!\0!\0!\0!\0!\0!\0!\0!\0!\0!\0!\0!\0!\0!\0!\0!\0!\0!\0!\0!\0!\0!\0!\0!\0B(�\0� �B�\n!\0B(�\0� �B��������������������������������������������� �B�\n!\0B(�\0� �B�\n!\0B(�\0!\0!\0!\0!\0!\0!\0!\0!\0!\0!\0!\0!\0!\0!\0!\0!\0!\0!\0!\0!\0!\0!\0!\0!\0!\0!\0!\0!\0!\0!\0!\0!\0!\0!\0!\0!\0!\0!\0!\0!\0!\0!\0!\0!\0!\0B(�\0� �B�\n!\0B(�\0� �\0 �\0 �\0 �\0 �\0 �\0 �\0 �\0 �\0 �\0 �\0 �\0 �\0 �\0 �\0 �\0 �\0 �\0 �\0 �\0 �\0 �\0 �\0 �\0 �\0 �\0 �\0 �\0 �\0 �\0 �\0 �\0 �\0 �\0 �\0 �\0 �\0 �\0 �\0 �\0 �\0 �\0 �\0 �\0 �\0� ��B�\0�ty!�EB\0B\0؁��OE�\\�C\0\0\0\0IEND�B`�'),(60,36,'�PNG\r\n\Z\n\0\0\0\rIHDR\0\0X\0\0X\0\0\01�\0\0HIDATx����g]���0��������������~��*�f�afZ3e�3�aLg?M�LM[���~����Y���N��iM��NT��}^����9�~y���Kn�*7���}�}���ܓ{3v\0ֱ1�\0\0!\0!���ű���G�ƿv!�/���sssQ������!\0!!W�^]\\\\���\Z߰a�������]���p�ʕw�}wff�p����gUn�jkʄ��1�ݥm���΍{6�{��>�w|�ϝx�_}����ɘ\07nܷoߥK���B8jΟ?�{�����ߺ=y��o���7���]���n�\r!\\C!�~��O<Q{�cJ���VN!)/���X/���j�pu�5�t���p7���P����k�tnݺu���tqvv��)�#e||<M�����\'N�H�ٰaC�	_{�����׉-<����믿�]�v����w�ygzz:�����C�����.;v,]ܻw��\rXΚw��vb7������߳g��\\7����M�\\��s�θ��?�S�\n���|R+���k��������s��?�|�7��Dl!�}뭷��n#�y��>�,F�u��\\�pa˖-�7o����r\Zz����:�~�0���^y啘i�:ujU���#��+�Ό�1�Ÿ��SGJL�4�?���XdKR�<}�t���T,,�믿޼Z,[B��wߥ������ck�n۩�K������q�;�>�h�\n���\\�b嚚��m��\'��q�Fy�͍XF�}�������n޼Y���y,��o%�l��ի�=Y=�-��_u��!�񸳛6m���_~��aW��k��W�B8�>\\[,b��;wn�1{Z��ꫴ��u�p���t�ڵk�`<��v\r�t�R:h}��������W�����v��UZuɈ/\n�w����c��q�w���Y�/����o��.���v��#�Cݷo_�[+	a��{�<���%��?�\\��8��Pr~~~�!,|������N�|g�	̸���s�=��ag��w>O�;�9k�Ϝ�TUm߾}�i�$�s��ѭ[��N�]D�K�X+�k�kk�\'s:ꏂ��n[OqL=99��R;�V��<�4��7��0���tii��I���� ]�%,Χ����ݛ�糸q1����$�mG�o��R����z��㵒S�%_u�=��a*�;�������/���+vv�����3g�X6�p4]�x1�z^���\'O6�>.\"|�A�V;v�taV�����gϞt�/����v���_�V}��.�_�����ݞ�G׆��C�캶#�W�l7��o#1���z����:Ȟs��Tl����հ������Z-�p�]�|�ȑ#�O���Ǐ�ӛ;w�<�|�E$�;wn׮]���O?m�����ݻ�6�hu#m��o������.�]�}�J��P87�y�n!l;��Ѝ�z�>|=��m*6�Ky\'��}o���,�c��;���롿�ˋ]�I�&7o�|����ڮAgϞͿ��e�dl�S��sSS��o����iKKK�b��*\\gW�Kk�y��K�{37��\Zͻb�\"�v�=����\Z̓l�%m����wxۇ����Sqzz:]���_�܋\'E��V�!Y��Y�x:�νܸq#��:��-��̟^h�������Ah<{k���޼z�̙3�O�\r[Mܪ癨�۩~�.���~���Ҷ!��sy���c<�|�M�7mCW�ns#�3%��0��q�]�G>4�C7�߷���W�Ӡ�k�O>�$����0x��}����<�e���c��b\n�̓�I.�B8��8����[����͛7���ٳ�v�������P���\'��ݻ�?1���~��\'s�~�5��f���=Û� 鶝�������~c.ߥmC��3q�G�[��E̯Q�(P��\'JF>t���x\\��T���\n��!͇���m���n����㏜�����%�p����:t(!������9c���,JǏ/��RZh���?11kb,��R|�����]���̤����7�|3��\Zz���Ы�U<��v�΅fggc7���U�e^�x�]���8�����շ,�n�F��񀦿P�iӦx�د��F^r/�n䧟~J�Ԗ-[�F�)�x8���;q�����C�<Z=|�B8t*���($}(>�T�`�S�$B!���z�W��:��v��y����ϛ��D]��DA-�/_Χ���N��#Ͽڼx�b㣏>J��|Ikw�!��ϼ��ϯ��vG^}�KU��Î��;O�ֆ�����m۶�7�c���9L�q����G�Il:��lǎ#\\�5=O�\0���S\00�N�<9(�����\00��\0!B\0�PB!@�\0!B\0�PB\0B\0B\0B\0B\0B\0B\0B\0B\0B\0B\0B\0B\0B\0B\0B\0B\0B\0B\0B\0B\0B\0B\0B\0B\0B\0B\0B\0B\0B\0B\0B\0B\0B\0B\0B\0B\0B\0B\0B\0B\0B\0B\0B\0B\0�PB!@�\0!B\0�PB!@�\0!\0!\0!\0!\0!\0!\0!\0!\0!\0!\0!\0!\0!\0!\0!\0!\0!\0!\0!\0!\0!\0!\0!\0!\0!\0!\0!\0!\0!\0!\0!\0!\0!\0!\0!\0!\0!\0!\0!\0!\0!\0!\0!\0!\0!@�\0!B\0�PB!@�\0!B\0��>@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@B!@�\0!B\0�PB!@�\0!B\0�\0�\0�\0�\0�\0�\0�\0�\0�\0�\0�\0�\0�\0�\0�\0�\0�\0�\0�\0�\0�\0�\0�\0�\0�\0�\0�\0�\0�\0�\0�\0�\0�\0�\0�\0�\0�\0�\0�\0�\0�\0�\0�\0�\0�\0!B\0�PB!@�\0!B\0�PB!@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@B!@�\0!B\0�PB!@�\0!\0!\0!\0!\0!\0!\0!\0!\0!\0!\0!\0!\0!\0!\0!\0!\0!\0!\0!\0!\0!\0!\0!\0!\0!\0!\0!\0!\0!\0!\0!\0!\0!\0!\0!\0!\0!\0!\0!\0!\0!\0!\0!\0!\0!@�\0!B\0�PB!@�\0!B\0�PB\0B\0B\0B\0B\0B\0B\0B\0B\0B\0B\0B\0B\0B\0B\0B\0B\0B\0B\0B\0B\0B\0B\0B\0B\0B\0B\0B\0B\0B\0B\0B\0B\0B\0B\0B\0B\0B\0B\0B\0B\0B\0B\0B\0B\0�PB!@�\0!B\0�PB!@�#\0�\0�\0�\0�\0�\0�\0�\0�\0�\0�\0�\0�\0�\0�\0�\0�\0�\0�\0�\0�\0�\0�\0�\0�\0�\0�\0�\0�\0�\0�\0�\0�\0�\0�\0�\0�\0�\0�\0�\0�\0�\0�\0�\0�\0!B\0�PB!@�\0!B\0�PB!@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@B!@�\0!B\0�PB!@�\0!B\0�\0�\0�\0�\0�\0�\0�\0�\0�\0�\0�\0�\0�\0�\0�\0�\0�\0�\0�\0�\0�\0�\0�\0�\0�\0�\0�\0�\0�\0�\0�\0�\0�\0�\0�\0�\0�\0�\0�\0�\0�\0�\0�\0�\0�\0!B\0�PB!@�\0!B\0�PB\0B\0B\0B\0B\0B\0B\0B\0B\0B\0B\0B\0B\0B\0B\0B\0B\0B\0B\0B\0B\0B\0B\0B\0B\0B\0B\0B\0B\0B\0B\0B\0B\0B\0B\0B\0B\0B\0B\0B\0B\0B\0B\0B\0B\0�P�~!<	\0�nP`]B\0�\0�\0֡������8�.\0\0\0\0IEND�B`�');
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

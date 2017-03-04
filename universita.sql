-- MySQL dump 10.16  Distrib 10.1.16-MariaDB, for Win32 (AMD64)
--
-- Host: localhost    Database: Universita
-- ------------------------------------------------------
-- Server version	10.1.16-MariaDB

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
-- Table structure for table `corsi`
--

DROP TABLE IF EXISTS `corsi`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `corsi` (
  `SiglaC` varchar(20) NOT NULL,
  `Aula` varchar(20) NOT NULL,
  `DocenteId` int(11) NOT NULL,
  PRIMARY KEY (`SiglaC`),
  KEY `DocenteId` (`DocenteId`),
  CONSTRAINT `corsi_ibfk_1` FOREIGN KEY (`DocenteId`) REFERENCES `docenti` (`DocenteId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `corsi`
--

LOCK TABLES `corsi` WRITE;
/*!40000 ALTER TABLE `corsi` DISABLE KEYS */;
INSERT INTO `corsi` VALUES ('Batteri','1',4),('DB','115',2),('Info','115',2),('InfoLab','110',1),('Motoria','111',3),('TATATATA','2',5);
/*!40000 ALTER TABLE `corsi` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `corsidilaurea`
--

DROP TABLE IF EXISTS `corsidilaurea`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `corsidilaurea` (
  `CorsoLaurea` int(11) NOT NULL AUTO_INCREMENT,
  `Facolta` varchar(20) NOT NULL,
  `TipoLaurea` varchar(20) NOT NULL,
  PRIMARY KEY (`CorsoLaurea`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `corsidilaurea`
--

LOCK TABLES `corsidilaurea` WRITE;
/*!40000 ALTER TABLE `corsidilaurea` DISABLE KEYS */;
INSERT INTO `corsidilaurea` VALUES (1,'Informatica','Triennale'),(2,'Scienze Motorie','Triennale'),(3,'Scienze','Triennale');
/*!40000 ALTER TABLE `corsidilaurea` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `docenti`
--

DROP TABLE IF EXISTS `docenti`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `docenti` (
  `DocenteId` int(11) NOT NULL AUTO_INCREMENT,
  `DNome` varchar(20) NOT NULL,
  `Dipartimento` varchar(20) NOT NULL,
  PRIMARY KEY (`DocenteId`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `docenti`
--

LOCK TABLES `docenti` WRITE;
/*!40000 ALTER TABLE `docenti` DISABLE KEYS */;
INSERT INTO `docenti` VALUES (1,'Sgroi','Informatica'),(2,'Viggi','Informatica'),(3,'Lorenzin','Motoria'),(4,'Zampese','Informatica'),(5,'Tessarolo','Motoria');
/*!40000 ALTER TABLE `docenti` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `iscrizioni`
--

DROP TABLE IF EXISTS `iscrizioni`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `iscrizioni` (
  `Matricola` int(11) NOT NULL,
  `SiglaC` varchar(20) NOT NULL,
  PRIMARY KEY (`Matricola`,`SiglaC`),
  KEY `SiglaC` (`SiglaC`),
  CONSTRAINT `iscrizioni_ibfk_1` FOREIGN KEY (`Matricola`) REFERENCES `studenti` (`Matricola`),
  CONSTRAINT `iscrizioni_ibfk_2` FOREIGN KEY (`SiglaC`) REFERENCES `corsi` (`SiglaC`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `iscrizioni`
--

LOCK TABLES `iscrizioni` WRITE;
/*!40000 ALTER TABLE `iscrizioni` DISABLE KEYS */;
INSERT INTO `iscrizioni` VALUES (1,'DB'),(1,'Info'),(2,'DB'),(2,'Info'),(3,'Motoria'),(4,'Batteri'),(4,'TATATATA'),(5,'DB'),(5,'TATATATA'),(6,'DB'),(7,'DB'),(8,'DB');
/*!40000 ALTER TABLE `iscrizioni` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `studenti`
--

DROP TABLE IF EXISTS `studenti`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `studenti` (
  `Matricola` int(11) NOT NULL AUTO_INCREMENT,
  `SNome` varchar(20) NOT NULL,
  `CorsoLaurea` int(11) NOT NULL,
  `eta` int(11) NOT NULL,
  PRIMARY KEY (`Matricola`),
  KEY `CorsoLaurea` (`CorsoLaurea`),
  CONSTRAINT `studenti_ibfk_1` FOREIGN KEY (`CorsoLaurea`) REFERENCES `corsidilaurea` (`CorsoLaurea`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `studenti`
--

LOCK TABLES `studenti` WRITE;
/*!40000 ALTER TABLE `studenti` DISABLE KEYS */;
INSERT INTO `studenti` VALUES (1,'Pertile',1,19),(2,'Canevarolo',1,20),(3,'Martina',2,17),(4,'Visentin',3,19),(5,'Miazzo',3,20),(6,'Miro',1,17),(7,'Antonio',1,17),(8,'De Franceschi',1,17);
/*!40000 ALTER TABLE `studenti` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-03-04 10:23:33

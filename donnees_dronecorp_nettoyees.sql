-- MySQL dump 10.13  Distrib 8.0.46, for Win64 (x86_64)
--
-- Host: localhost    Database: dronecorp_test
-- ------------------------------------------------------
-- Server version	8.0.46

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
-- Dumping data for table `drone`
--

LOCK TABLES `drone` WRITE;
/*!40000 ALTER TABLE `drone` DISABLE KEYS */;
INSERT INTO `drone` VALUES (1,'AigleX','Quadricoptère',25,45,1.2,1),(2,'SkyMax','Quadricoptère',30,50,1.3,1),(3,'Mistral','Quadricoptère',28,47,1.25,1),(4,'Boréal','Quadricoptère',26,44,1.2,1),(5,'Zéphyr','Quadricoptère',29,48,1.3,1),(6,'Sirocco','Quadricoptère',27,46,1.2,1),(7,'Tramontane','Quadricoptère',30,50,1.35,1),(8,'Libeccio','Quadricoptère',25,45,1.2,1),(9,'Falcon','Hexacoptère',40,60,2.1,2),(10,'Titan','Hexacoptère',38,58,2,2),(11,'Condor','Hexacoptère',42,62,2.15,2),(12,'Raptor','Hexacoptère',39,59,2.05,2),(13,'Vautour','Hexacoptère',41,61,2.1,2),(14,'Pygargue','Hexacoptère',40,60,2.2,2),(15,'Balbuzard','Hexacoptère',38,58,2,2),(16,'Circaète','Hexacoptère',43,63,2.3,2),(17,'PhoenixV','VTOL',55,80,3.5,3),(18,'AresVTOL','VTOL',52,78,3.4,3),(19,'HermèsV','VTOL',57,82,3.6,3),(20,'ZeusV','VTOL',50,75,3.3,3),(21,'AtlasV','VTOL',54,79,3.5,3),(22,'OdysseyV','VTOL',56,81,3.55,3),(24,'MiniDrone',NULL,5,15,0.05,4),(25,'Autan','Quadricoptère',27,46,1.22,1),(26,'Harmattan','Quadricoptère',28,47,1.28,1),(27,'Foehn','Quadricoptère',26,45,1.2,1),(28,'Chinook','Quadricoptère',29,49,1.3,1),(29,'Ponant','Quadricoptère',30,50,1.35,1),(30,'Levant','Quadricoptère',25,44,1.2,1),(31,'Nordet','Quadricoptère',28,48,1.25,1),(32,'Galerne','Quadricoptère',27,46,1.2,1),(33,'Vent Solaire','Quadricoptère',29,47,1.3,1),(34,'Brise','Quadricoptère',26,45,1.22,1),(35,'Albatros','Hexacoptère',41,61,2.12,2),(36,'Faucon','Hexacoptère',39,59,2.02,2),(37,'Aigle','Hexacoptère',42,62,2.18,2),(38,'Milan','Hexacoptère',40,60,2.08,2),(39,'Épervier','Hexacoptère',38,58,2,2),(40,'Busard','Hexacoptère',43,63,2.25,),(41,'Harfang','Hexacoptère','HX-200',41,61,2.1),(42,'Autour','Hexacoptère','HX-200',39,59,2.05),(43,'Crécerelle','Hexacoptère','HX-200',40,60,2.1),(44,'Bondrée','Hexacoptère','HX-200',42,62,2.2),(45,'TitanV','VTOL','VTOL-X',53,78,3.45),(46,'CronusV','VTOL','VTOL-X',55,80,3.5),(47,'HeliosV','VTOL','VTOL-X',51,76,3.35),(48,'ApolloV','VTOL','VTOL-X',57,82,3.6),(49,'ArésV2','VTOL','VTOL-X',54,79,3.5),(50,'NikeV','VTOL','VTOL-X',52,77,3.4),(51,'HéphaïstosV','VTOL','VTOL-X',56,81,3.55),(52,'DéméterV','VTOL','VTOL-X',50,75,3.3),(53,'NullDrone',NULL,'AX-100',25,45,1.2),(54,'PoidsFou','Quadricoptère','AX-100',25,45,NULL),(55,'VitesseFolle','Hexacoptère','HX-200',40,NULL,2.1);
/*!40000 ALTER TABLE `drone` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `maintenance`
--

LOCK TABLES `maintenance` WRITE;
/*!40000 ALTER TABLE `maintenance` DISABLE KEYS */;
INSERT INTO `maintenance` VALUES (1,1,'2024-01-10','Batterie','RAS'),(2,1,'2024-02-15','Moteur','Vibrations détectées'),(3,2,'2024-02-20','Moteur','Bruit anormal'),(4,3,'2024-03-01','Hélice','Cassée'),(5,4,'2024-03-05','Moteur','Surchauffe'),(6,5,'2024-03-10','Batterie','Capacité réduite'),(7,6,'2024-03-12','Moteur','Faute de frappe volontaire'),(8,7,'2024-03-15','Hélice','Fissure'),(9,8,'2024-03-18','Hélice','Déséquilibrage'),(10,9,'2024-04-01','Contrôleur','Reset effectué'),(11,10,'2024-04-03','Batterie',NULL),(12,11,'2024-04-05','Moteur',NULL),(13,12,'2024-04-07','Hélice','Vibrations'),(14,13,'2024-04-10','Batterie','RAS'),(15,14,'2024-04-12','Moteur','Remplacement complet'),(16,15,'2024-04-15','TransitionRotor','Usure normale'),(17,16,'2024-04-18','TransitionRotor','Bruit'),(18,17,'2024-04-20','Batterie','RAS'),(19,18,'2024-04-22','Hélice','Cassée suite à atterrissage'),(20,19,'2024-04-25','Contrôleur','Mise à jour firmware'),(21,20,'2024-04-28','Contrôleur','Panne'),(22,1,'2024-05-01','Batterie','Deuxième remplacement'),(23,3,'2024-05-03','Moteur','Roulement usé'),(24,5,'2024-05-06','Hélice',NULL),(25,7,'2024-05-09','Moteur','Casse volontaire de casse'),(26,9,'2024-05-12','Batterie','RAS'),(27,2,'2024-05-15','Hélice',"Fissure bord d\'attaque"),(28,4,'2024-05-18','Contrôleur','Défaillance capteur'),(29,6,'2024-05-20','Batterie','Gonflement détecté'),(30,17,'2024-05-22','TransitionRotor','Remplacement préventif'),(31,20,'2024-05-25','Moteur','Vibrations hautes fréquences'),(32,21,'2024-06-01','Batterie','RAS'),(33,22,'2024-06-02','Hélice','Fissure importante'),(34,23,'2024-06-03','Moteur','Bruit de roulement'),(35,24,'2024-06-04','Contrôleur','Mise à jour firmware'),(36,25,'2024-06-05','Batterie',NULL),(37,26,'2024-06-06','Hélice','RAS'),(38,10,'2024-06-07','Moteur','Surchauffe critique'),(39,11,'2024-06-08','Hélice','Cassée'),(40,12,'2024-06-09','Hélice','Vibrations'),(41,13,'2024-06-10','Batterie','Capacité à 60%'),(42,14,'2024-06-11','Contrôleur','Reset'),(43,15,'2024-06-12','TransitionRotor','RAS'),(44,16,'2024-06-13','TransitionRotor','Bruit sourd'),(45,17,'2024-06-14','Moteur',NULL),(46,18,'2024-06-15','Batterie','Remplacement'),(47,19,'2024-06-16','Hélice','Ébréchée'),(48,1,'2024-06-17','Contrôleur','Panne GPS'),(49,2,'2024-06-18','Batterie','RAS'),(50,3,'2024-06-19','Moteur','Vibrations'),(51,4,'2024-06-20','Hélice',NULL),(52,5,'2024-07-01','Batterie','RAS'),(53,6,'2024-07-02','Moteur','Roulement à remplacer'),(54,7,'2024-07-03','Hélice','Fissure'),(55,8,'2024-07-04','Contrôleur','Défaillance IMU'),(56,9,'2024-07-05','Batterie','Gonflement léger'),(57,10,'2024-07-06','Moteur','Bruit'),(58,11,'2024-07-07','Hélice','RAS'),(59,12,'2024-07-08','Batterie','Remplacement préventif'),(60,13,'2024-07-09','Moteur','Surchauffe'),(61,14,'2024-07-10','Contrôleur','Mise à jour'),(62,15,'2024-07-11','TransitionRotor','Usure avancée'),(63,16,'2024-07-12','TransitionRotor','RAS'),(64,17,'2024-07-13','Hélice','Cassée lors mission'),(65,18,'2024-07-14','Batterie',NULL),(66,19,'2024-07-15','Moteur','Vibrations basses fréquences'),(67,20,'2024-07-16','Hélice','Déséquilibrage'),(68,21,'2024-07-17','Contrôleur','RAS'),(69,22,'2024-07-18','Batterie','Capacité réduite'),(70,23,'2024-07-19','Moteur',NULL),(71,24,'2024-07-20','Hélice','Inspection standard'),(72,1,'2024-07-21','Batterie','Troisième remplacement'),(73,3,'2024-07-22','Moteur','RAS'),(74,5,'2024-07-23','Hélice',NULL),(75,7,'2024-07-24','Batterie','Défaillance cellule'),(76,9,'2024-07-25','Contrôleur','Panne partielle'),(77,25,'2024-08-01','Batterie','RAS'),(78,26,'2024-08-02','Moteur','Bruit de friction'),(79,27,'2024-08-03','Hélice','Fissure bord fuite'),(80,28,'2024-08-04','Contrôleur','Firmware obsolète'),(81,29,'2024-08-05','Batterie',NULL),(82,30,'2024-08-06','Moteur','Vibrations'),(83,31,'2024-08-07','Hélice','Cassée'),(84,32,'2024-08-08','Batterie','Remplacement'),(85,33,'2024-08-09','Contrôleur','Reset complet'),(86,34,'2024-08-10','TransitionRotor','Bruit métallique'),(87,35,'2024-08-11','Moteur','RAS'),(88,36,'2024-08-12','Hélice','Inspection'),(89,2,'2024-08-13','Batterie','Capacité 55%'),(90,4,'2024-08-14','Moteur','Surchauffe'),(91,6,'2024-08-15','Hélice','Vibrations excessives'),(92,8,'2024-08-16','Contrôleur','Panne capteur altitude'),(93,10,'2024-08-17','Batterie','RAS'),(94,12,'2024-08-18','Moteur',NULL),(95,14,'2024-08-19','Hélice','Ébréchée'),(96,16,'2024-08-20','Batterie',NULL),(97,1,'2024-01-10','Batterie','Date format DD/MM/YYYY'),(98,2,'2024-02-15','Moteur','Date format DD-MM-YYYY'),(99,3,'2024-03-01','Hélice','Date format YYYY/MM/DD'),(100,4,NULL,'Moteur','Date en texte libre'),(101,5,NULL,'Batterie','Date approximative');
/*!40000 ALTER TABLE `maintenance` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `mission`
--

LOCK TABLES `mission` WRITE;
/*!40000 ALTER TABLE `mission` DISABLE KEYS */;
INSERT INTO `mission` VALUES (1,1,'Z1','Eau',20),(2,1,'Z1','Eau',10),(3,2,'Z1','Eau',15),(4,3,'Z1','Nourriture',30),(5,4,'Z1','Nourriture',25),(6,5,'Z1','Médicaments',10),(7,6,'Z1','Tentes',5),(8,7,'Z1','Eau',18),(9,8,'Z1','Nourriture',40),(10,9,'Z1','Médicaments',7),(11,10,'Z1','Tentes',3),(12,11,'Z1','Eau',22),(13,12,'Z1','Nourriture',35),(14,13,'Z1','Médicaments',12),(15,14,'Z1','Tentes',4),(16,15,'Z1','Eau',16),(17,16,'Z1','Eau',11),(18,2,'Z2','Médicaments',5),(19,7,'Z2','Médicaments',8),(20,8,'Z2','Médicaments',3),(21,9,'Z2','Eau',40),(22,10,'Z2','Nourriture',50),(23,11,'Z2','Tentes',10),(24,12,'Z2','Eau',20),(25,13,'Z2','Nourriture',45),(26,14,'Z2','Tentes',8),(27,15,'Z2','Eau',30),(28,16,'Z2','Médicaments',15),(29,17,'Z2','Nourriture',60),(30,18,'Z2','Médicaments',6),(31,1,'Z2','Eau',25),(32,3,'Z2','Tentes',7),(33,5,'Z2','Nourriture',55),(34,3,'Z3','Nourriture',30),(35,13,'Z3','Eau',25),(36,14,'Z3','Médicaments',15),(37,15,'Z3','Tentes',8),(38,16,'Z3','Nourriture',20),(39,17,'Z3','Eau',18),(40,18,'Z3','Nourriture',35),(41,19,'Z3','Médicaments',10),(42,20,'Z3','Tentes',6),(43,2,'Z3','Eau',28),(44,4,'Z3','Nourriture',42),(45,6,'Z3','Médicaments',9),(46,8,'Z3','Tentes',5),(47,17,'Z4','Eau',35),(48,18,'Z4','Médicaments',12),(49,19,'Z4','Nourriture',48),(50,20,'Z4','Tentes',9),(51,21,'Z4','Eau',22),(52,22,'Z4','Médicaments',7),(53,1,'Z4','Nourriture',33),(54,3,'Z4','Tentes',11),(55,19,'Z5','Tentes',6),(56,20,'Z5','Nourriture',45),(57,21,'Z5','Eau',38),(58,22,'Z5','Médicaments',20),(59,23,'Z5','Nourriture',50),(60,24,'Z5','Tentes',4),(61,25,'Z5','Eau',17),(62,2,'Z5','Médicaments',14),(63,1,'Z1','Eau',NULL),(64,9,'Z2','Tentes',500),(65,21,'Z3','Nourriture',NULL),(66,5,'Z1','Eau',NULL),(67,10,'Z2','Nourriture',NULL);
/*!40000 ALTER TABLE `mission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `piecesstock`
--

LOCK TABLES `piecesstock` WRITE;
/*!40000 ALTER TABLE `piecesstock` DISABLE KEYS */;
INSERT INTO `piecesstock` VALUES (31,'BAT-AX100','AX-100',45,129.00),(32,'MOT-AX100','AX-100',19,249.00),(33,'HEL-HX200','HX-200',33,89.00),(34,'CTRL-HX200','HX-200',14,199.00),(35,'TR-VTOLX','VTOL-X',11,399.00),(36,'BAT-HX200','HX-200',24,159.00),(37,'MOT-HX200','HX-200',13,289.00),(38,'BAT-VTOLX','VTOL-X',16,220.00),(39,'MOT-VTOLX','VTOL-X',9,450.00),(40,'HEL-VTOLX','VTOL-X',20,120.00),(41,'CTRL-AX100','AX-100',12,179.00),(42,'CTRL-VTOLX','VTOL-X',5,350.00),(43,'GPS-AX100','AX-100',14,99.00),(44,'GPS-HX200','HX-200',8,115.00),(45,'GPS-VTOLX','VTOL-X',4,140.00),(46,'CAM-AX100','AX-100',11,210.00),(47,'CAM-HX200','HX-200',6,260.00);
/*!40000 ALTER TABLE `piecesstock` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `stock`
--

LOCK TABLES `stock` WRITE;
/*!40000 ALTER TABLE `stock` DISABLE KEYS */;
INSERT INTO `stock` VALUES (25,'Eau','L',875,'2024-06-12'),(26,'Médicaments','kg',250,'2024-06-22'),(27,'Nourriture','kg',1120,'2024-06-18'),(28,'Tentes','unité',75,'2024-06-15'),(29,'Carburant','L',350,'2024-06-20'),(30,'Batteries','unité',100,'2024-05-09'),(31,'Couvertures','unité',65,'2024-06-01'),(32,'Lampes','unité',75,'2024-06-08'),(33,'Kits premiers secours','unité',45,'2024-06-02');
/*!40000 ALTER TABLE `stock` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `zone`
--

LOCK TABLES `zone` WRITE;
/*!40000 ALTER TABLE `zone` DISABLE KEYS */;
INSERT INTO `zone` VALUES ('Z1','Nord','Z2'),('Z10','Haute Plaine',NULL),('Z2','Sud','Z1'),('Z3','Est',NULL),('Z4','Ouest','Z3'),('Z5','Centre','Z1'),('Z6','Nord-Est','Z3'),('Z7','Nord-Ouest','Z4'),('Z8','Sud-Est','Z3'),('Z9','Sud-Ouest','Z4');
/*!40000 ALTER TABLE `zone` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-06-08 15:55:52

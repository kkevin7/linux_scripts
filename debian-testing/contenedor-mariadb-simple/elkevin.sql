-- MySQL dump 10.16  Distrib 10.1.22-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: casosAcad
-- ------------------------------------------------------
-- Server version	10.1.22-MariaDB-1~jessie

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
-- Table structure for table `caso`
--

DROP TABLE IF EXISTS `caso`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `caso` (
  `IdCaso` int(5) NOT NULL AUTO_INCREMENT,
  `idSolicitud` int(10) NOT NULL,
  `idProceso` int(5) NOT NULL,
  PRIMARY KEY (`IdCaso`),
  KEY `idSolicitud` (`idSolicitud`),
  KEY `idProceso` (`idProceso`),
  CONSTRAINT `Caso_ibfk_1` FOREIGN KEY (`idSolicitud`) REFERENCES `solicitudes` (`idSolicitud`),
  CONSTRAINT `Caso_ibfk_2` FOREIGN KEY (`idProceso`) REFERENCES `proceso` (`idProceso`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `caso`
--

LOCK TABLES `caso` WRITE;
/*!40000 ALTER TABLE `caso` DISABLE KEYS */;
INSERT INTO `caso` VALUES (1,1,1);
/*!40000 ALTER TABLE `caso` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `caso_detalle`
--

DROP TABLE IF EXISTS `caso_detalle`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `caso_detalle` (
  `idCasoDetalle` int(5) NOT NULL AUTO_INCREMENT,
  `IdCaso` int(5) NOT NULL,
  `Estado` varchar(10) NOT NULL,
  `idProcesoDetalle` int(5) NOT NULL,
  `Fecha` date NOT NULL,
  PRIMARY KEY (`idCasoDetalle`),
  KEY `IdCaso` (`IdCaso`),
  CONSTRAINT `Caso_detalle_ibfk_1` FOREIGN KEY (`IdCaso`) REFERENCES `caso` (`IdCaso`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `caso_detalle`
--

LOCK TABLES `caso_detalle` WRITE;
/*!40000 ALTER TABLE `caso_detalle` DISABLE KEYS */;
INSERT INTO `caso_detalle` VALUES (1,1,'1',1,'0000-00-00');
/*!40000 ALTER TABLE `caso_detalle` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `caso_detalle_requisito`
--

DROP TABLE IF EXISTS `caso_detalle_requisito`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `caso_detalle_requisito` (
  `idCasoDR` int(5) NOT NULL AUTO_INCREMENT,
  `idCasoDetalle` int(5) NOT NULL,
  `idPasoRequisito` int(5) NOT NULL,
  `EstadoRequisito` varchar(10) NOT NULL,
  `Fecha` date NOT NULL,
  PRIMARY KEY (`idCasoDR`),
  KEY `idCasoDetalle` (`idCasoDetalle`),
  KEY `idPasoRequisito` (`idPasoRequisito`),
  CONSTRAINT `Caso_detalle_requisito_ibfk_1` FOREIGN KEY (`idCasoDetalle`) REFERENCES `caso_detalle` (`idCasoDetalle`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `caso_detalle_requisito`
--

LOCK TABLES `caso_detalle_requisito` WRITE;
/*!40000 ALTER TABLE `caso_detalle_requisito` DISABLE KEYS */;
INSERT INTO `caso_detalle_requisito` VALUES (1,1,1,'1','0000-00-00');
/*!40000 ALTER TABLE `caso_detalle_requisito` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `db_cdra`
--

DROP TABLE IF EXISTS `db_cdra`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `db_cdra` (
  `idCDRA` int(5) NOT NULL AUTO_INCREMENT,
  `IdCasoDR` int(5) NOT NULL,
  `Fecha` date NOT NULL,
  `Descripcion` text,
  PRIMARY KEY (`idCDRA`),
  KEY `IdCDR` (`IdCasoDR`),
  CONSTRAINT `DB_CDRA_ibfk_1` FOREIGN KEY (`IdCasoDR`) REFERENCES `caso_detalle_requisito` (`idCasoDR`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `db_cdra`
--

LOCK TABLES `db_cdra` WRITE;
/*!40000 ALTER TABLE `db_cdra` DISABLE KEYS */;
INSERT INTO `db_cdra` VALUES (1,1,'0000-00-00','1');
/*!40000 ALTER TABLE `db_cdra` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `paso`
--

DROP TABLE IF EXISTS `paso`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `paso` (
  `idPaso` int(5) NOT NULL AUTO_INCREMENT,
  `idTipoPaso` int(5) NOT NULL,
  `Descripcion` text NOT NULL,
  `Tiempo` varchar(20) NOT NULL,
  `Nombre` varchar(100) NOT NULL,
  PRIMARY KEY (`idPaso`),
  KEY `idTipoPaso` (`idTipoPaso`),
  CONSTRAINT `Paso_ibfk_1` FOREIGN KEY (`idTipoPaso`) REFERENCES `tipo_paso` (`idTipoPaso`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `paso`
--

LOCK TABLES `paso` WRITE;
/*!40000 ALTER TABLE `paso` DISABLE KEYS */;
INSERT INTO `paso` VALUES (1,5,'Se realiza la apertura del expediente con contraseñas pre-establecidad','1 semana','Creacion expediente'),(4,2,'La unidad asignada asignara un periodo para que el solicitante pueda realizar la entrega de documentos.','3 días','Recepcion Documentos'),(5,1,'kamsdp','poaksd','asdñm'),(6,1,'asdñlm','ñaosd','aopskd'),(7,1,'poaksd','pokasd','asdk');
/*!40000 ALTER TABLE `paso` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `paso_requisito`
--

DROP TABLE IF EXISTS `paso_requisito`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `paso_requisito` (
  `idPasoRequisito` int(5) NOT NULL AUTO_INCREMENT,
  `idRequisito` int(5) NOT NULL,
  `idPaso` int(5) NOT NULL,
  `indice` int(2) NOT NULL,
  PRIMARY KEY (`idPasoRequisito`),
  KEY `idRequisito` (`idRequisito`),
  KEY `idPaso` (`idPaso`),
  CONSTRAINT `Paso_requisito_ibfk_1` FOREIGN KEY (`idPaso`) REFERENCES `paso` (`idPaso`),
  CONSTRAINT `Paso_requisito_ibfk_2` FOREIGN KEY (`idRequisito`) REFERENCES `requisito` (`idRequisito`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `paso_requisito`
--

LOCK TABLES `paso_requisito` WRITE;
/*!40000 ALTER TABLE `paso_requisito` DISABLE KEYS */;
INSERT INTO `paso_requisito` VALUES (1,1,4,1),(2,3,5,2),(3,1,1,3),(4,2,4,2);
/*!40000 ALTER TABLE `paso_requisito` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `proceso`
--

DROP TABLE IF EXISTS `proceso`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `proceso` (
  `idProceso` int(5) NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(50) NOT NULL,
  `Descripcion` text NOT NULL,
  PRIMARY KEY (`idProceso`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proceso`
--

LOCK TABLES `proceso` WRITE;
/*!40000 ALTER TABLE `proceso` DISABLE KEYS */;
INSERT INTO `proceso` VALUES (1,'Nuevo','Es nuevo');
/*!40000 ALTER TABLE `proceso` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `proceso_detalle`
--

DROP TABLE IF EXISTS `proceso_detalle`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `proceso_detalle` (
  `idProcesoDetalle` int(10) NOT NULL AUTO_INCREMENT,
  `idProceso` int(5) NOT NULL,
  `idPaso` int(5) NOT NULL,
  `indice` int(2) NOT NULL,
  PRIMARY KEY (`idProcesoDetalle`),
  KEY `idProceso` (`idProceso`),
  KEY `idPaso` (`idPaso`),
  CONSTRAINT `Proceso_detalle_ibfk_1` FOREIGN KEY (`idProceso`) REFERENCES `proceso` (`idProceso`),
  CONSTRAINT `Proceso_detalle_ibfk_2` FOREIGN KEY (`idPaso`) REFERENCES `paso` (`idPaso`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proceso_detalle`
--

LOCK TABLES `proceso_detalle` WRITE;
/*!40000 ALTER TABLE `proceso_detalle` DISABLE KEYS */;
INSERT INTO `proceso_detalle` VALUES (1,1,1,1);
/*!40000 ALTER TABLE `proceso_detalle` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `requisito`
--

DROP TABLE IF EXISTS `requisito`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `requisito` (
  `idRequisito` int(5) NOT NULL AUTO_INCREMENT,
  `idTipoRequisito` int(5) NOT NULL,
  `Nombre` varchar(25) NOT NULL,
  `Descripcion` text NOT NULL,
  `Prioridad` varchar(5) NOT NULL,
  PRIMARY KEY (`idRequisito`),
  KEY `idTipoRequisito` (`idTipoRequisito`),
  CONSTRAINT `Requisito_ibfk_1` FOREIGN KEY (`idTipoRequisito`) REFERENCES `tipo_requisito` (`idTipoRequisito`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `requisito`
--

LOCK TABLES `requisito` WRITE;
/*!40000 ALTER TABLE `requisito` DISABLE KEYS */;
INSERT INTO `requisito` VALUES (1,3,'Pago matrícula','La matricula debe estar pagada para este tramite.','Alta'),(2,1,'Dui','Se debe entregar una copia de documentos único de identidad.','Media'),(3,1,'F1','Se debe poseer el formulario F1 completo.','Media');
/*!40000 ALTER TABLE `requisito` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `solicitudes`
--

DROP TABLE IF EXISTS `solicitudes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `solicitudes` (
  `idSolicitud` int(10) NOT NULL AUTO_INCREMENT,
  `carnet` varchar(7) DEFAULT NULL,
  `NIT` int(14) NOT NULL,
  `FechaRecibida` date NOT NULL,
  `Usuario` int(5) NOT NULL,
  `DescripcionSolicitud` text NOT NULL,
  PRIMARY KEY (`idSolicitud`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `solicitudes`
--

LOCK TABLES `solicitudes` WRITE;
/*!40000 ALTER TABLE `solicitudes` DISABLE KEYS */;
INSERT INTO `solicitudes` VALUES (1,'CB14002',1312951012,'0012-12-12',1,'Pepe');
/*!40000 ALTER TABLE `solicitudes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipo_paso`
--

DROP TABLE IF EXISTS `tipo_paso`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tipo_paso` (
  `idTipoPaso` int(5) NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(25) NOT NULL,
  `Descripcion` text NOT NULL,
  `activo` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`idTipoPaso`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipo_paso`
--

LOCK TABLES `tipo_paso` WRITE;
/*!40000 ALTER TABLE `tipo_paso` DISABLE KEYS */;
INSERT INTO `tipo_paso` VALUES (1,'Creacion  caso','Se crea un caso y se estabaleces los requerimeintos',NULL),(2,'Entrega de Documentos','Se requiere de los documentos solicitados',NULL),(3,'Validacion de Documentos','Se verifica las documentacion entregada',0),(4,'Firmas de Encargados','Los documentos son se entregan a la unidad correspondiente.',NULL),(5,'Resolucion','Se da una respuesta al caso.',NULL);
/*!40000 ALTER TABLE `tipo_paso` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipo_requisito`
--

DROP TABLE IF EXISTS `tipo_requisito`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tipo_requisito` (
  `idTipoRequisito` int(5) NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(25) NOT NULL,
  `activo` tinyint(1) NOT NULL,
  `observaciones` text NOT NULL,
  PRIMARY KEY (`idTipoRequisito`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipo_requisito`
--

LOCK TABLES `tipo_requisito` WRITE;
/*!40000 ALTER TABLE `tipo_requisito` DISABLE KEYS */;
INSERT INTO `tipo_requisito` VALUES (1,'Administrativo',0,'Es manejado por el área administrativa de la institución.'),(2,'Academico',0,'Es manejado por el área académica de la institución.'),(3,'Institucional',0,'La institución debe proveerlos.'),(4,'Gubernamental',0,'Son externos a la institución.'),(5,'Legal',0,'Todo documentos legal debe ser notariado.'),(6,'VOy a mojar',1,'PERO BIEN PERRON!'),(7,'ASDL,',1,'AOSDK'),(8,'ASDIJ',0,'APOKSD');
/*!40000 ALTER TABLE `tipo_requisito` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-04-26  9:57:17

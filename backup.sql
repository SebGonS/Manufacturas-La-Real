-- MySQL dump 10.13  Distrib 8.0.28, for Win64 (x86_64)
--
-- Host: localhost    Database: test
-- ------------------------------------------------------
-- Server version	8.0.28

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
-- Table structure for table `almacen`
--

DROP TABLE IF EXISTS `almacen`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `almacen` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(20) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `almacen`
--

LOCK TABLES `almacen` WRITE;
/*!40000 ALTER TABLE `almacen` DISABLE KEYS */;
INSERT INTO `almacen` VALUES (1,'Insumos'),(2,'Productos'),(3,'AlmacenRollos');
/*!40000 ALTER TABLE `almacen` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `almacen_insumos`
--

DROP TABLE IF EXISTS `almacen_insumos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `almacen_insumos` (
  `Almacen_ID` int NOT NULL,
  `Insumo_ID` int NOT NULL,
  `Cantidad` int NOT NULL,
  PRIMARY KEY (`Insumo_ID`,`Almacen_ID`),
  KEY `Almacen_Insumos_Almacenes` (`Almacen_ID`),
  CONSTRAINT `Almacen_Insumos_Almacenes` FOREIGN KEY (`Almacen_ID`) REFERENCES `almacen` (`ID`),
  CONSTRAINT `Almacen_Insumos_Insumos` FOREIGN KEY (`Insumo_ID`) REFERENCES `insumo` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `almacen_insumos`
--

LOCK TABLES `almacen_insumos` WRITE;
/*!40000 ALTER TABLE `almacen_insumos` DISABLE KEYS */;
INSERT INTO `almacen_insumos` VALUES (1,1,3),(1,2,12),(1,3,1),(1,4,2),(1,5,4),(1,6,7),(1,7,5),(1,8,1),(1,9,0),(1,10,12),(1,11,5),(1,12,8),(1,13,3),(1,14,1),(1,15,9),(1,16,2),(1,17,1),(1,18,11),(1,19,4),(1,20,8),(1,21,5),(1,22,0),(1,23,6);
/*!40000 ALTER TABLE `almacen_insumos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `almacen_productos`
--

DROP TABLE IF EXISTS `almacen_productos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `almacen_productos` (
  `Almacen_ID` int NOT NULL,
  `OrdenDetalles_Color_ID` int NOT NULL,
  `OrdenDetalles_Orden_ID` int NOT NULL,
  `OrdenDetalles_Tela_ID` int NOT NULL,
  `Cantidad` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`Almacen_ID`,`OrdenDetalles_Color_ID`,`OrdenDetalles_Orden_ID`,`OrdenDetalles_Tela_ID`),
  KEY `Almacen_Productos_OrdenDetalles` (`OrdenDetalles_Color_ID`,`OrdenDetalles_Orden_ID`,`OrdenDetalles_Tela_ID`),
  CONSTRAINT `Almacen_Productos_Almacen` FOREIGN KEY (`Almacen_ID`) REFERENCES `almacen` (`ID`),
  CONSTRAINT `Almacen_Productos_OrdenDetalles` FOREIGN KEY (`OrdenDetalles_Color_ID`, `OrdenDetalles_Orden_ID`, `OrdenDetalles_Tela_ID`) REFERENCES `ordendetalles` (`Color_ID`, `Orden_ID`, `Tela_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `almacen_productos`
--

LOCK TABLES `almacen_productos` WRITE;
/*!40000 ALTER TABLE `almacen_productos` DISABLE KEYS */;
INSERT INTO `almacen_productos` VALUES (2,1,3,4,0),(2,1,11,1,4),(2,1,13,4,8),(2,1,14,2,0),(2,1,21,2,2),(2,2,5,1,10),(2,2,9,3,11),(2,2,11,1,4),(2,2,18,3,4),(2,2,21,1,11),(2,2,22,3,4),(2,3,5,2,9),(2,3,13,1,4),(2,3,13,2,1),(2,3,15,3,7),(2,3,17,1,5),(2,3,17,3,3),(2,3,17,4,4),(2,3,23,2,4),(2,3,26,2,8),(2,4,3,1,4),(2,4,4,3,1),(2,4,23,1,12),(2,5,8,2,7),(2,5,20,1,3),(2,5,21,2,12),(2,6,13,4,2),(2,6,14,2,0),(2,6,14,3,2),(2,6,14,4,4),(2,6,16,3,7),(2,6,16,4,6),(2,6,22,4,0);
/*!40000 ALTER TABLE `almacen_productos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cliente`
--

DROP TABLE IF EXISTS `cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cliente` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `DNI` varchar(8) NOT NULL,
  `RUC` varchar(11) NOT NULL,
  `Nombres` varchar(30) NOT NULL,
  `Apellidos` varchar(30) NOT NULL,
  `Celular` varchar(9) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cliente`
--

LOCK TABLES `cliente` WRITE;
/*!40000 ALTER TABLE `cliente` DISABLE KEYS */;
INSERT INTO `cliente` VALUES (1,'88263639','34639322417','Nombre 10','Apellido 13','923116519'),(2,'18567802','75013107667','Nombre 10','Apellido 14','929256055'),(3,'19774456','45437058138','Nombre 4','Apellido 10','965365709'),(4,'76410118','38378396866','Nombre 9','Apellido 8','952474666'),(5,'64691889','22014094159','Nombre 14','Apellido 14','968758090'),(6,'36978498','63409533008','Nombre 14','Apellido 2','990783735'),(7,'57653790','77282258846','Nombre 4','Apellido 8','915034571'),(8,'63875248','43538145874','Nombre 4','Apellido 3','977668936'),(9,'34129959','98135564637','Nombre 10','Apellido 4','930146162'),(10,'46941421','36586447295','Nombre 14','Apellido 7','923877510'),(11,'89226269','22977553381','Nombre 3','Apellido 3','908744782'),(12,'34665009','16605847861','Nombre 13','Apellido 3','918845944'),(13,'26032414','55460174596','Nombre 2','Apellido 1','925803204'),(14,'36316552','97893570086','Nombre 12','Apellido 3','915632694'),(15,'40993548','28464411463','Nombre 5','Apellido 11','948530786'),(16,'73657775','66699445786','Nombre 3','Apellido 2','938457380'),(17,'79836485','53442078909','Nombre 7','Apellido 5','903905908'),(18,'96526598','88881207683','Nombre 8','Apellido 8','993189715'),(19,'77460366','88354381056','Nombre 13','Apellido 13','966640492'),(20,'77760366','88354381056','Nombre 13','Apellido 13','966640492'),(21,'77700366','88354381056','Nombre 13','Apellido 13','966640492'),(22,'0000366','88354381056','Nombre 13','Apellido 13','966640492'),(23,'string','string','string','string','string'),(24,'string','string','string','string','string'),(25,'70652567','54646464','Sebastian Alonso','Gonzales Sotomayor','969644499'),(26,'789754','464646','5454','456','4654'),(27,'7777777','777','777','7777','777');
/*!40000 ALTER TABLE `cliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `color`
--

DROP TABLE IF EXISTS `color`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `color` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(15) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `color`
--

LOCK TABLES `color` WRITE;
/*!40000 ALTER TABLE `color` DISABLE KEYS */;
INSERT INTO `color` VALUES (1,'Color 1'),(2,'Color 2'),(3,'Color 3'),(4,'Color 4'),(5,'Color 5'),(6,'Color 6');
/*!40000 ALTER TABLE `color` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `insumo`
--

DROP TABLE IF EXISTS `insumo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `insumo` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `Proveedor_ID` int NOT NULL,
  `Nombre` varchar(30) NOT NULL,
  `Tipo` varchar(30) NOT NULL,
  `Unidad` varchar(10) NOT NULL,
  `Precio_Unitario` decimal(6,2) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `Insumos_Proveedores` (`Proveedor_ID`),
  CONSTRAINT `Insumos_Proveedores` FOREIGN KEY (`Proveedor_ID`) REFERENCES `proveedor` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `insumo`
--

LOCK TABLES `insumo` WRITE;
/*!40000 ALTER TABLE `insumo` DISABLE KEYS */;
INSERT INTO `insumo` VALUES (1,3,'Nombre 1','Tipo 5','Unidad 2',7.00),(2,5,'Nombre 2','Tipo 5','Unidad 5',1.00),(3,2,'Nombre 3','Tipo 4','Unidad 2',4.00),(4,7,'Nombre 4','Tipo 3','Unidad 1',7.00),(5,3,'Nombre 5','Tipo 2','Unidad 5',1.00),(6,8,'Nombre 6','Tipo 5','Unidad 2',5.00),(7,6,'Nombre 7','Tipo 2','Unidad 1',5.00),(8,8,'Nombre 8','Tipo 1','Unidad 5',2.00),(9,8,'Nombre 9','Tipo 5','Unidad 2',8.00),(10,8,'Nombre 10','Tipo 1','Unidad 5',2.00),(11,10,'Nombre 11','Tipo 2','Unidad 3',2.00),(12,1,'Nombre 12','Tipo 2','Unidad 4',4.00),(13,1,'Nombre 13','Tipo 1','Unidad 2',8.00),(14,3,'Nombre 14','Tipo 5','Unidad 2',2.00),(15,3,'Nombre 15','Tipo 1','Unidad 1',2.00),(16,2,'Nombre 16','Tipo 4','Unidad 4',4.00),(17,9,'Nombre 17','Tipo 3','Unidad 1',3.00),(18,2,'Nombre 18','Tipo 1','Unidad 3',2.00),(19,3,'Nombre 19','Tipo 2','Unidad 3',8.00),(20,4,'Nombre 20','Tipo 3','Unidad 4',7.00),(21,3,'Nombre 21','Tipo 5','Unidad 2',6.00),(22,5,'Nombre 22','Tipo 4','Unidad 2',9.00),(23,7,'Nombre 23','Tipo 1','Unidad 1',3.00);
/*!40000 ALTER TABLE `insumo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `insumoxreceta`
--

DROP TABLE IF EXISTS `insumoxreceta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `insumoxreceta` (
  `Receta_ID` int NOT NULL,
  `Insumo_ID` int NOT NULL,
  `Cantidad` decimal(6,2) NOT NULL,
  PRIMARY KEY (`Receta_ID`,`Insumo_ID`),
  KEY `Table_25_Insumos` (`Insumo_ID`),
  CONSTRAINT `Table_25_Insumos` FOREIGN KEY (`Insumo_ID`) REFERENCES `insumo` (`ID`),
  CONSTRAINT `Table_25_RecetasLavado` FOREIGN KEY (`Receta_ID`) REFERENCES `receta` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `insumoxreceta`
--

LOCK TABLES `insumoxreceta` WRITE;
/*!40000 ALTER TABLE `insumoxreceta` DISABLE KEYS */;
INSERT INTO `insumoxreceta` VALUES (1,1,4.00),(2,2,1.00),(3,3,6.00),(4,4,6.00),(5,5,2.00),(6,6,7.00),(7,7,4.00),(8,5,2.00),(8,8,9.00),(8,11,8.00),(8,14,8.00),(9,6,4.00),(9,9,2.00),(9,12,5.00),(9,15,7.00),(10,7,2.00),(10,10,8.00),(10,13,6.00),(10,16,2.00),(11,8,4.00),(11,11,7.00),(11,14,9.00),(11,17,4.00),(12,9,3.00),(12,12,5.00),(12,15,2.00),(12,18,7.00),(13,10,1.00),(13,13,7.00),(13,16,4.00),(13,19,1.00),(14,11,3.00),(14,14,7.00),(14,17,2.00),(14,20,3.00),(15,2,7.00),(15,5,1.00),(15,12,1.00),(15,15,4.00),(15,16,9.00),(15,18,8.00),(15,19,5.00),(15,21,1.00),(15,22,2.00),(16,3,8.00),(16,6,9.00),(16,16,5.00),(16,17,2.00),(16,20,3.00),(16,23,6.00),(17,1,9.00),(17,4,2.00),(17,7,1.00),(17,17,4.00),(17,18,8.00),(17,21,1.00),(18,2,5.00),(18,5,4.00),(18,8,6.00),(18,18,5.00),(18,22,8.00),(19,3,5.00),(19,6,8.00),(19,9,9.00),(19,19,6.00),(19,23,4.00),(20,1,6.00),(20,4,8.00),(20,7,2.00),(20,10,8.00),(20,20,2.00),(21,2,2.00),(21,5,7.00),(21,8,6.00),(21,11,3.00),(21,21,1.00),(22,3,9.00),(22,6,4.00),(22,9,8.00),(22,12,1.00),(22,22,6.00),(23,4,8.00),(23,7,9.00),(23,10,1.00),(23,13,5.00),(23,23,5.00),(24,1,1.00),(25,2,4.00),(25,13,6.00),(25,16,6.00),(25,19,7.00),(25,22,7.00),(26,3,7.00),(26,14,2.00),(26,17,6.00),(26,20,5.00),(26,23,1.00),(27,1,6.00),(27,4,5.00),(27,15,4.00),(27,18,3.00),(27,21,5.00);
/*!40000 ALTER TABLE `insumoxreceta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `maquina`
--

DROP TABLE IF EXISTS `maquina`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `maquina` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `PesoMax` int NOT NULL,
  `VolumenMax` int NOT NULL,
  `Tipo` varchar(20) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `maquina`
--

LOCK TABLES `maquina` WRITE;
/*!40000 ALTER TABLE `maquina` DISABLE KEYS */;
INSERT INTO `maquina` VALUES (1,540,374,'Tipo 1'),(2,546,471,'Tipo 1'),(3,456,406,'Tipo 3'),(4,577,375,'Tipo 4'),(5,569,500,'Tipo 4'),(6,460,457,'Tipo 4');
/*!40000 ALTER TABLE `maquina` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orden`
--

DROP TABLE IF EXISTS `orden`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orden` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `Cliente_ID` int NOT NULL,
  `Fecha_Registro` date NOT NULL,
  `Fecha_Requerida` date NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `Orden_Cliente` (`Cliente_ID`),
  CONSTRAINT `Orden_Cliente` FOREIGN KEY (`Cliente_ID`) REFERENCES `cliente` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orden`
--

LOCK TABLES `orden` WRITE;
/*!40000 ALTER TABLE `orden` DISABLE KEYS */;
INSERT INTO `orden` VALUES (1,1,'2022-01-24','2022-04-29'),(2,2,'2022-02-13','2022-05-20'),(3,3,'2022-01-03','2022-04-17'),(4,4,'2022-03-21','2022-04-22'),(5,5,'2022-02-13','2022-04-30'),(6,6,'2022-02-18','2022-04-14'),(7,7,'2022-03-17','2022-05-13'),(8,8,'2022-01-08','2022-05-15'),(9,9,'2022-02-11','2022-05-30'),(10,10,'2022-02-20','2022-05-13'),(11,11,'2022-01-25','2022-06-19'),(12,12,'2022-02-18','2022-06-21'),(13,13,'2022-03-07','2022-04-22'),(14,14,'2022-03-19','2022-04-20'),(15,15,'2022-01-24','2022-06-24'),(16,16,'2022-01-28','2022-04-17'),(17,17,'2022-01-23','2022-05-31'),(18,18,'2022-03-12','2022-06-24'),(19,19,'2022-03-01','2022-04-30'),(20,20,'2022-01-09','2022-05-17'),(21,20,'2022-03-30','2022-05-18'),(22,20,'2022-03-13','2022-04-07'),(23,20,'2022-03-11','2022-05-21'),(24,3,'2022-01-07','2022-04-16'),(25,4,'2022-03-08','2022-04-02'),(26,5,'2022-03-11','2022-05-21'),(27,6,'2022-03-14','2022-05-30'),(28,8,'2022-02-20','2022-02-20');
/*!40000 ALTER TABLE `orden` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ordendetalles`
--

DROP TABLE IF EXISTS `ordendetalles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ordendetalles` (
  `Color_ID` int NOT NULL,
  `Orden_ID` int NOT NULL,
  `Tela_ID` int NOT NULL,
  `Cantidad` int NOT NULL,
  PRIMARY KEY (`Color_ID`,`Orden_ID`,`Tela_ID`),
  KEY `OrdenDetalles_Orden` (`Orden_ID`),
  KEY `OrdenDetalles_Tela` (`Tela_ID`),
  CONSTRAINT `OrdenDetalles_Color` FOREIGN KEY (`Color_ID`) REFERENCES `color` (`ID`),
  CONSTRAINT `OrdenDetalles_Orden` FOREIGN KEY (`Orden_ID`) REFERENCES `orden` (`ID`),
  CONSTRAINT `OrdenDetalles_Tela` FOREIGN KEY (`Tela_ID`) REFERENCES `tela` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ordendetalles`
--

LOCK TABLES `ordendetalles` WRITE;
/*!40000 ALTER TABLE `ordendetalles` DISABLE KEYS */;
INSERT INTO `ordendetalles` VALUES (1,3,4,8),(1,11,1,5),(1,13,4,11),(1,14,2,12),(1,21,2,10),(2,5,1,12),(2,9,3,11),(2,11,1,9),(2,18,3,6),(2,21,1,12),(2,22,3,8),(3,5,2,11),(3,13,1,10),(3,13,2,9),(3,15,3,8),(3,17,1,6),(3,17,3,11),(3,17,4,8),(3,23,2,12),(3,26,2,8),(4,3,1,6),(4,4,3,5),(4,23,1,12),(5,8,2,11),(5,20,1,10),(5,21,2,12),(6,13,4,11),(6,14,2,5),(6,14,3,11),(6,14,4,5),(6,16,3,9),(6,16,4,6),(6,22,4,10);
/*!40000 ALTER TABLE `ordendetalles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `proveedor`
--

DROP TABLE IF EXISTS `proveedor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `proveedor` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(30) NOT NULL,
  `Celular` varchar(9) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proveedor`
--

LOCK TABLES `proveedor` WRITE;
/*!40000 ALTER TABLE `proveedor` DISABLE KEYS */;
INSERT INTO `proveedor` VALUES (1,'Proveedor 1','902056952'),(2,'Proveedor 2','905109175'),(3,'Proveedor 3','981075786'),(4,'Proveedor 4','999949489'),(5,'Proveedor 5','950139954'),(6,'Proveedor 6','917166966'),(7,'Proveedor 7','963703957'),(8,'Proveedor 8','972566747'),(9,'Proveedor 9','955679038'),(10,'Proveedor 10','945061202');
/*!40000 ALTER TABLE `proveedor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `receta`
--

DROP TABLE IF EXISTS `receta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `receta` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(20) NOT NULL,
  `Fecha_Registro` date NOT NULL,
  `CantidadProducto` int NOT NULL,
  `Volumen` decimal(6,2) NOT NULL,
  `Maquina_ID` int NOT NULL,
  `Tela_ID` int NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `Receta_Tela` (`Tela_ID`),
  KEY `RecetasLavado_Maquinas` (`Maquina_ID`),
  CONSTRAINT `Receta_Tela` FOREIGN KEY (`Tela_ID`) REFERENCES `tela` (`ID`),
  CONSTRAINT `RecetasLavado_Maquinas` FOREIGN KEY (`Maquina_ID`) REFERENCES `maquina` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `receta`
--

LOCK TABLES `receta` WRITE;
/*!40000 ALTER TABLE `receta` DISABLE KEYS */;
INSERT INTO `receta` VALUES (1,'Receta 1','2022-02-23',18,485.00,1,1),(2,'Receta 2','2022-02-28',24,330.00,2,2),(3,'Receta 3','2022-02-28',8,325.00,3,3),(4,'Receta 4','2022-03-27',10,316.00,4,4),(5,'Receta 5','2022-02-17',22,435.00,5,3),(6,'Receta 6','2022-03-01',26,373.00,1,4),(7,'Receta 7','2022-01-11',19,405.00,2,3),(8,'Receta 8','2022-02-23',4,314.00,1,1),(9,'Receta 9','2022-01-18',2,304.00,2,2),(10,'Receta 10','2022-03-21',30,307.00,1,3),(11,'Receta 11','2022-03-18',2,474.00,2,4),(12,'Receta 12','2022-02-19',15,459.00,3,3),(13,'Receta 13','2022-03-03',22,455.00,4,4),(14,'Receta 14','2022-03-09',25,328.00,5,3),(15,'Receta 15','2022-03-19',9,377.00,1,1),(16,'Receta 16','2022-03-22',16,345.00,2,2),(17,'Receta 17','2022-02-21',7,379.00,1,3),(18,'Receta 18','2022-01-15',16,418.00,2,4),(19,'Receta 19','2022-03-12',19,397.00,1,3),(20,'Receta 20','2022-02-20',20,313.00,2,4),(21,'Receta 21','2022-02-18',1,330.00,3,3),(22,'Receta 22','2022-01-30',21,329.00,4,1),(23,'Receta 23','2022-01-29',19,333.00,5,2),(24,'Receta 24','2022-03-01',22,454.00,1,3),(25,'Receta 25','2022-01-13',13,360.00,2,4),(26,'Receta 26','2022-01-27',17,356.00,1,3),(27,'Receta 27','2022-01-13',8,437.00,2,4);
/*!40000 ALTER TABLE `receta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `recetaxcolor`
--

DROP TABLE IF EXISTS `recetaxcolor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `recetaxcolor` (
  `Receta_ID` int NOT NULL,
  `Color_ID` int NOT NULL,
  PRIMARY KEY (`Receta_ID`),
  KEY `RecetaxColor_Color` (`Color_ID`),
  CONSTRAINT `RecetaxColor_Color` FOREIGN KEY (`Color_ID`) REFERENCES `color` (`ID`),
  CONSTRAINT `RecetaxColor_Receta` FOREIGN KEY (`Receta_ID`) REFERENCES `receta` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recetaxcolor`
--

LOCK TABLES `recetaxcolor` WRITE;
/*!40000 ALTER TABLE `recetaxcolor` DISABLE KEYS */;
INSERT INTO `recetaxcolor` VALUES (1,1),(7,1),(13,1),(19,1),(25,1),(2,2),(8,2),(14,2),(20,2),(26,2),(3,3),(9,3),(15,3),(21,3),(27,3),(4,4),(10,4),(16,4),(22,4),(5,5),(11,5),(17,5),(23,5),(6,6),(12,6),(18,6),(24,6);
/*!40000 ALTER TABLE `recetaxcolor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tela`
--

DROP TABLE IF EXISTS `tela`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tela` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(15) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tela`
--

LOCK TABLES `tela` WRITE;
/*!40000 ALTER TABLE `tela` DISABLE KEYS */;
INSERT INTO `tela` VALUES (1,'Tela 1'),(2,'Tela 2'),(3,'Tela 3'),(4,'Tela 4');
/*!40000 ALTER TABLE `tela` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-03-12  7:10:32

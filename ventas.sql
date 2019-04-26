-- MySQL dump 10.13  Distrib 5.6.24, for Win64 (x86_64)
--
-- Host: localhost    Database: ventas
-- ------------------------------------------------------
-- Server version	5.5.5-10.1.38-MariaDB

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
-- Table structure for table `administrador`
--

DROP TABLE IF EXISTS `administrador`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `administrador` (
  `idAdmin` int(11) NOT NULL AUTO_INCREMENT,
  `nombreAdmin` varchar(150) NOT NULL,
  `password` varchar(150) NOT NULL,
  `rol` varchar(150) NOT NULL,
  `intentos` int(11) NOT NULL DEFAULT '0',
  `fechaCreado` date NOT NULL,
  PRIMARY KEY (`idAdmin`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `administrador`
--

LOCK TABLES `administrador` WRITE;
/*!40000 ALTER TABLE `administrador` DISABLE KEYS */;
INSERT INTO `administrador` VALUES (5,'maximo','z3vall0s','',0,'0000-00-00');
/*!40000 ALTER TABLE `administrador` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categorias`
--

DROP TABLE IF EXISTS `categorias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `categorias` (
  `idCategoria` int(11) NOT NULL AUTO_INCREMENT,
  `nombreCategoria` varchar(50) NOT NULL,
  PRIMARY KEY (`idCategoria`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categorias`
--

LOCK TABLES `categorias` WRITE;
/*!40000 ALTER TABLE `categorias` DISABLE KEYS */;
/*!40000 ALTER TABLE `categorias` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ciudad`
--

DROP TABLE IF EXISTS `ciudad`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ciudad` (
  `idCiudad` int(11) NOT NULL,
  `nombreCiudad` varchar(60) NOT NULL,
  `codPostal` int(11) NOT NULL,
  `idProvincia` int(11) NOT NULL,
  PRIMARY KEY (`idCiudad`),
  KEY `codPostal` (`codPostal`),
  KEY `FK_ciudad_provincia` (`idProvincia`),
  CONSTRAINT `FK_ciudad_provincia` FOREIGN KEY (`idProvincia`) REFERENCES `provincia` (`idProvincia`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ciudad`
--

LOCK TABLES `ciudad` WRITE;
/*!40000 ALTER TABLE `ciudad` DISABLE KEYS */;
/*!40000 ALTER TABLE `ciudad` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `clientes`
--

DROP TABLE IF EXISTS `clientes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `clientes` (
  `idCliente` int(11) NOT NULL AUTO_INCREMENT,
  `nombreCliente` varchar(150) NOT NULL,
  `apellidoCliente` varchar(150) NOT NULL,
  `idProvincia` int(11) NOT NULL,
  `ciudad` int(11) NOT NULL DEFAULT '1',
  `usuarioCliente` varchar(50) NOT NULL,
  `passwordCliente` varchar(50) NOT NULL,
  `telefono` varchar(50) NOT NULL,
  `emailCliente` varchar(50) NOT NULL,
  `direccion` varchar(50) NOT NULL,
  `idCiudad` int(11) NOT NULL,
  `cuit` int(11) NOT NULL,
  PRIMARY KEY (`idCliente`),
  KEY `FK_clientes_provincia` (`idProvincia`),
  KEY `FK_clientes_ciudad` (`idCiudad`),
  CONSTRAINT `FK_clientes_ciudad` FOREIGN KEY (`idCiudad`) REFERENCES `ciudad` (`idCiudad`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_clientes_provincia` FOREIGN KEY (`idProvincia`) REFERENCES `provincia` (`idProvincia`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clientes`
--

LOCK TABLES `clientes` WRITE;
/*!40000 ALTER TABLE `clientes` DISABLE KEYS */;
/*!40000 ALTER TABLE `clientes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `detalles`
--

DROP TABLE IF EXISTS `detalles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `detalles` (
  `idDetalle` int(11) NOT NULL AUTO_INCREMENT,
  `idCliente` int(11) NOT NULL,
  `idProducto` int(11) NOT NULL,
  `fechaVenta` date NOT NULL,
  `precioVenta` double NOT NULL,
  `cantidadKilos` int(11) NOT NULL,
  `totalVenta` double NOT NULL,
  `numFac` int(11) NOT NULL,
  `tipoFactura` varchar(5) NOT NULL,
  PRIMARY KEY (`idDetalle`),
  KEY `FK_detalles_clientes` (`idCliente`),
  KEY `FK_detalles_productos` (`idProducto`),
  CONSTRAINT `FK_detalles_clientes` FOREIGN KEY (`idCliente`) REFERENCES `clientes` (`idCliente`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_detalles_productos` FOREIGN KEY (`idProducto`) REFERENCES `productos` (`idProducto`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=170 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `detalles`
--

LOCK TABLES `detalles` WRITE;
/*!40000 ALTER TABLE `detalles` DISABLE KEYS */;
/*!40000 ALTER TABLE `detalles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `factura`
--

DROP TABLE IF EXISTS `factura`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `factura` (
  `idFactura` int(11) NOT NULL AUTO_INCREMENT,
  `numFac` int(110) NOT NULL,
  `fechaVenta` date NOT NULL,
  `idCliente` int(11) NOT NULL,
  `idAdmin` int(11) NOT NULL,
  `totalVenta` double NOT NULL,
  `tipoFactura` varchar(50) NOT NULL,
  PRIMARY KEY (`idFactura`),
  KEY `FK_factura_clientes` (`idCliente`),
  KEY `FK_factura_administrador` (`idAdmin`),
  CONSTRAINT `FK_factura_administrador` FOREIGN KEY (`idAdmin`) REFERENCES `administrador` (`idAdmin`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_factura_clientes` FOREIGN KEY (`idCliente`) REFERENCES `clientes` (`idCliente`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=56 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `factura`
--

LOCK TABLES `factura` WRITE;
/*!40000 ALTER TABLE `factura` DISABLE KEYS */;
/*!40000 ALTER TABLE `factura` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `inventario`
--

DROP TABLE IF EXISTS `inventario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `inventario` (
  `idInventario` int(11) NOT NULL AUTO_INCREMENT,
  `cantidadIngresada` int(11) NOT NULL,
  `precioVenta` double NOT NULL,
  `idProducto` int(11) NOT NULL,
  PRIMARY KEY (`idInventario`),
  KEY `FK_inventario_productos` (`idProducto`),
  CONSTRAINT `FK_inventario_productos` FOREIGN KEY (`idProducto`) REFERENCES `productos` (`idProducto`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inventario`
--

LOCK TABLES `inventario` WRITE;
/*!40000 ALTER TABLE `inventario` DISABLE KEYS */;
/*!40000 ALTER TABLE `inventario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pass`
--

DROP TABLE IF EXISTS `pass`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pass` (
  `idpass` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(50) NOT NULL,
  `idAdmin` int(11) NOT NULL,
  PRIMARY KEY (`idpass`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pass`
--

LOCK TABLES `pass` WRITE;
/*!40000 ALTER TABLE `pass` DISABLE KEYS */;
/*!40000 ALTER TABLE `pass` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `productos`
--

DROP TABLE IF EXISTS `productos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `productos` (
  `idProducto` int(11) NOT NULL AUTO_INCREMENT,
  `nombreProducto` varchar(50) NOT NULL,
  `idProveedor` int(11) NOT NULL,
  `precioProducto` double NOT NULL,
  `idCategoria` int(11) NOT NULL,
  PRIMARY KEY (`idProducto`),
  KEY `FK_productos_categorias` (`idCategoria`),
  KEY `FK_productos_proveedores` (`idProveedor`),
  CONSTRAINT `FK_productos_categorias` FOREIGN KEY (`idCategoria`) REFERENCES `categorias` (`idCategoria`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_productos_proveedores` FOREIGN KEY (`idProveedor`) REFERENCES `proveedores` (`idProveedor`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `productos`
--

LOCK TABLES `productos` WRITE;
/*!40000 ALTER TABLE `productos` DISABLE KEYS */;
/*!40000 ALTER TABLE `productos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `proveedores`
--

DROP TABLE IF EXISTS `proveedores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `proveedores` (
  `idProveedor` int(11) NOT NULL AUTO_INCREMENT,
  `nombreProveedor` varchar(100) NOT NULL,
  `apellidoProveedor` varchar(100) NOT NULL,
  `nombreEmpresa` varchar(100) NOT NULL,
  `telefonoProveedor` varchar(100) NOT NULL,
  `direccionProveedor` varchar(100) NOT NULL,
  `idCiudad` int(11) NOT NULL,
  PRIMARY KEY (`idProveedor`),
  KEY `FK_proveedores_ciudad` (`idCiudad`),
  CONSTRAINT `FK_proveedores_ciudad` FOREIGN KEY (`idCiudad`) REFERENCES `ciudad` (`idCiudad`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proveedores`
--

LOCK TABLES `proveedores` WRITE;
/*!40000 ALTER TABLE `proveedores` DISABLE KEYS */;
/*!40000 ALTER TABLE `proveedores` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `provincia`
--

DROP TABLE IF EXISTS `provincia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `provincia` (
  `idProvincia` int(11) NOT NULL,
  `nombreProvincia` varchar(50) NOT NULL,
  PRIMARY KEY (`idProvincia`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `provincia`
--

LOCK TABLES `provincia` WRITE;
/*!40000 ALTER TABLE `provincia` DISABLE KEYS */;
/*!40000 ALTER TABLE `provincia` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `temp`
--

DROP TABLE IF EXISTS `temp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `temp` (
  `idTemp` int(11) NOT NULL AUTO_INCREMENT,
  `idProducto` int(11) NOT NULL,
  `idCliente` int(11) NOT NULL,
  `precioVenta` double NOT NULL,
  `cantidad` int(11) NOT NULL,
  `igv` double NOT NULL,
  `totalVenta` double NOT NULL,
  `numFac` int(11) NOT NULL,
  `fechaVenta` date NOT NULL,
  `unidad` int(11) NOT NULL,
  `tipoFactura` varchar(5) NOT NULL,
  PRIMARY KEY (`idTemp`),
  KEY `FK_temp_productos` (`idProducto`),
  KEY `FK_temp_clientes` (`idCliente`),
  CONSTRAINT `FK_temp_clientes` FOREIGN KEY (`idCliente`) REFERENCES `clientes` (`idCliente`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_temp_productos` FOREIGN KEY (`idProducto`) REFERENCES `productos` (`idProducto`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `temp`
--

LOCK TABLES `temp` WRITE;
/*!40000 ALTER TABLE `temp` DISABLE KEYS */;
/*!40000 ALTER TABLE `temp` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-04-18  8:29:01

-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               5.5.27 - MySQL Community Server (GPL)
-- Server OS:                    Win32
-- HeidiSQL version:             7.0.0.4053
-- Date/time:                    2013-02-19 14:05:00
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET FOREIGN_KEY_CHECKS=0 */;

-- Dumping database structure for encuestas
DROP DATABASE IF EXISTS `encuestas`;
CREATE DATABASE IF NOT EXISTS `encuestas` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `encuestas`;


-- Dumping structure for table encuestas.encuesta
DROP TABLE IF EXISTS `encuesta`;
CREATE TABLE IF NOT EXISTS `encuesta` (
  `idEncuesta` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) DEFAULT NULL,
  `habilitada` tinyint(1) DEFAULT NULL,
  `fechaInicio` datetime DEFAULT NULL,
  `fechaFin` datetime DEFAULT NULL,
  PRIMARY KEY (`idEncuesta`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table encuestas.encuesta: ~0 rows (approximately)
/*!40000 ALTER TABLE `encuesta` DISABLE KEYS */;
/*!40000 ALTER TABLE `encuesta` ENABLE KEYS */;


-- Dumping structure for table encuestas.item
DROP TABLE IF EXISTS `item`;
CREATE TABLE IF NOT EXISTS `item` (
  `idItem` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) DEFAULT NULL,
  `tipoItem` int(11) DEFAULT NULL,
  `idPregunta` int(11) DEFAULT NULL,
  `Idx` int(11) DEFAULT NULL,
  PRIMARY KEY (`idItem`),
  KEY `FK22EF332C443FDF` (`idPregunta`),
  CONSTRAINT `FK22EF332C443FDF` FOREIGN KEY (`idPregunta`) REFERENCES `pregunta` (`idPregunta`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table encuestas.item: ~0 rows (approximately)
/*!40000 ALTER TABLE `item` DISABLE KEYS */;
/*!40000 ALTER TABLE `item` ENABLE KEYS */;


-- Dumping structure for table encuestas.listavaloresitem
DROP TABLE IF EXISTS `listavaloresitem`;
CREATE TABLE IF NOT EXISTS `listavaloresitem` (
  `idItem` int(11) NOT NULL,
  `valor` varchar(255) DEFAULT NULL,
  `Idx` int(11) NOT NULL,
  PRIMARY KEY (`idItem`,`Idx`),
  KEY `FKB41D2B42E9805DB1` (`idItem`),
  CONSTRAINT `FKB41D2B42E9805DB1` FOREIGN KEY (`idItem`) REFERENCES `item` (`idItem`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table encuestas.listavaloresitem: ~0 rows (approximately)
/*!40000 ALTER TABLE `listavaloresitem` DISABLE KEYS */;
/*!40000 ALTER TABLE `listavaloresitem` ENABLE KEYS */;


-- Dumping structure for table encuestas.pregunta
DROP TABLE IF EXISTS `pregunta`;
CREATE TABLE IF NOT EXISTS `pregunta` (
  `idPregunta` int(11) NOT NULL AUTO_INCREMENT,
  `pregunta` varchar(255) DEFAULT NULL,
  `idEncuesta` int(11) DEFAULT NULL,
  `tipoPregunta` int(11) DEFAULT NULL,
  `Idx` int(11) DEFAULT NULL,
  PRIMARY KEY (`idPregunta`),
  KEY `FKB7202F0A926153F7` (`idEncuesta`),
  CONSTRAINT `FKB7202F0A926153F7` FOREIGN KEY (`idEncuesta`) REFERENCES `encuesta` (`idEncuesta`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table encuestas.pregunta: ~0 rows (approximately)
/*!40000 ALTER TABLE `pregunta` DISABLE KEYS */;
/*!40000 ALTER TABLE `pregunta` ENABLE KEYS */;


-- Dumping structure for table encuestas.privilege
DROP TABLE IF EXISTS `privilege`;
CREATE TABLE IF NOT EXISTS `privilege` (
  `idPrivilege` int(11) NOT NULL AUTO_INCREMENT,
  `entityName` varchar(255) DEFAULT NULL,
  `createRow` tinyint(1) DEFAULT NULL,
  `insertRow` tinyint(1) DEFAULT NULL,
  `updateRow` tinyint(1) DEFAULT NULL,
  `deleteRow` tinyint(1) DEFAULT NULL,
  `readRow` tinyint(1) DEFAULT NULL,
  `search` tinyint(1) DEFAULT NULL,
  `namedSearch` tinyint(1) DEFAULT NULL,
  `metadata` tinyint(1) DEFAULT NULL,
  `idRole` int(11) DEFAULT NULL,
  PRIMARY KEY (`idPrivilege`),
  KEY `FK196D1691537B364` (`idRole`),
  CONSTRAINT `FK196D1691537B364` FOREIGN KEY (`idRole`) REFERENCES `role` (`idRole`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- Dumping data for table encuestas.privilege: ~0 rows (approximately)
/*!40000 ALTER TABLE `privilege` DISABLE KEYS */;
INSERT INTO `privilege` (`idPrivilege`, `entityName`, `createRow`, `insertRow`, `updateRow`, `deleteRow`, `readRow`, `search`, `namedSearch`, `metadata`, `idRole`) VALUES
	(1, 'Encuesta', 1, 0, 1, 0, 1, 0, 1, 0, 1),
	(2, 'Item', 1, 0, 1, 0, 1, 0, 1, 0, 1),
	(3, 'Encuesta', 1, 0, 1, 0, 1, 0, 1, 0, 2),
	(4, 'Item', 1, 0, 1, 0, 1, 0, 1, 0, 2);
/*!40000 ALTER TABLE `privilege` ENABLE KEYS */;


-- Dumping structure for table encuestas.role
DROP TABLE IF EXISTS `role`;
CREATE TABLE IF NOT EXISTS `role` (
  `idRole` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`idRole`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- Dumping data for table encuestas.role: ~0 rows (approximately)
/*!40000 ALTER TABLE `role` DISABLE KEYS */;
INSERT INTO `role` (`idRole`, `name`) VALUES
	(1, 'Admin'),
	(2, 'User');
/*!40000 ALTER TABLE `role` ENABLE KEYS */;


-- Dumping structure for table encuestas.user
DROP TABLE IF EXISTS `user`;
CREATE TABLE IF NOT EXISTS `user` (
  `idUser` int(11) NOT NULL AUTO_INCREMENT,
  `login` varchar(255) DEFAULT NULL,
  `enabled` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`idUser`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- Dumping data for table encuestas.user: ~0 rows (approximately)
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` (`idUser`, `login`, `enabled`) VALUES
	(1, 'logongas', 1),
	(2, 'pepe', 0);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;


-- Dumping structure for table encuestas.userrole
DROP TABLE IF EXISTS `userrole`;
CREATE TABLE IF NOT EXISTS `userrole` (
  `idUser` int(11) NOT NULL,
  `idRole` int(11) NOT NULL,
  KEY `FKF3F76701537B364` (`idRole`),
  KEY `FKF3F7670153A8A0E` (`idUser`),
  CONSTRAINT `FKF3F7670153A8A0E` FOREIGN KEY (`idUser`) REFERENCES `user` (`idUser`),
  CONSTRAINT `FKF3F76701537B364` FOREIGN KEY (`idRole`) REFERENCES `role` (`idRole`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table encuestas.userrole: ~0 rows (approximately)
/*!40000 ALTER TABLE `userrole` DISABLE KEYS */;
INSERT INTO `userrole` (`idUser`, `idRole`) VALUES
	(1, 1),
	(1, 2);
/*!40000 ALTER TABLE `userrole` ENABLE KEYS */;
/*!40014 SET FOREIGN_KEY_CHECKS=1 */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;

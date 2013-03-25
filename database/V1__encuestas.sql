-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               5.5.27 - MySQL Community Server (GPL)
-- Server OS:                    Win32
-- HeidiSQL version:             7.0.0.4053
-- Date/time:                    2013-03-25 14:50:05
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
  `imprimir` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`idEncuesta`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- Dumping data for table encuestas.encuesta: ~1 rows (approximately)
/*!40000 ALTER TABLE `encuesta` DISABLE KEYS */;
INSERT INTO `encuesta` (`idEncuesta`, `nombre`, `habilitada`, `fechaInicio`, `fechaFin`, `imprimir`) VALUES
	(1, 'Nuevo en el centro', 1, NULL, NULL, 1);
/*!40000 ALTER TABLE `encuesta` ENABLE KEYS */;


-- Dumping structure for table encuestas.item
DROP TABLE IF EXISTS `item`;
CREATE TABLE IF NOT EXISTS `item` (
  `idItem` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) DEFAULT NULL,
  `tipoItem` int(11) DEFAULT NULL,
  `idListaValores` int(11) DEFAULT NULL,
  `idPregunta` int(11) DEFAULT NULL,
  `Idx` int(11) DEFAULT NULL,
  PRIMARY KEY (`idItem`),
  KEY `FK22EF3336E0A389` (`idListaValores`),
  KEY `FK22EF332C443FDF` (`idPregunta`),
  CONSTRAINT `FK22EF332C443FDF` FOREIGN KEY (`idPregunta`) REFERENCES `pregunta` (`idPregunta`),
  CONSTRAINT `FK22EF3336E0A389` FOREIGN KEY (`idListaValores`) REFERENCES `listavalores` (`idListaValores`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;

-- Dumping data for table encuestas.item: ~18 rows (approximately)
/*!40000 ALTER TABLE `item` DISABLE KEYS */;
INSERT INTO `item` (`idItem`, `nombre`, `tipoItem`, `idListaValores`, `idPregunta`, `Idx`) VALUES
	(1, 'La consellería d\'educació', NULL, NULL, 1, 0),
	(2, 'El centre on estudiaves anteriorment', NULL, NULL, 1, 1),
	(3, 'La publicitat del CIPFP MISLATA', NULL, NULL, 1, 2),
	(4, 'La pàgina web del CIPFP Mislata', NULL, NULL, 1, 3),
	(5, 'Altres (indicar quines):', NULL, NULL, 1, 4),
	(6, 'El procés de matricula', 1, 1, 2, 0),
	(7, 'El tracte rebut pel personal del centre', 1, 1, 2, 1),
	(8, 'Obtindre un titol', NULL, NULL, 3, 0),
	(9, 'Tindre una bona formació', NULL, NULL, 3, 1),
	(10, 'Trobar treball relacionat ams els estudis cursats', NULL, NULL, 3, 2),
	(11, 'Continuar estudis per completar la meua formació', NULL, NULL, 3, 3),
	(12, 'Altres (indicar quines)', NULL, NULL, 3, 4),
	(13, 'Modalitat d\'accés', 2, NULL, 4, 0),
	(14, 'Últims estudis cursats', 2, NULL, 4, 1),
	(15, 'Últim centre académic', 2, NULL, 4, 2),
	(16, 'Població', 2, NULL, 4, 3),
	(17, 'Codi postal', 2, NULL, 4, 4),
	(18, 'Provincia', 1, 2, 4, 5);
/*!40000 ALTER TABLE `item` ENABLE KEYS */;


-- Dumping structure for table encuestas.listavalores
DROP TABLE IF EXISTS `listavalores`;
CREATE TABLE IF NOT EXISTS `listavalores` (
  `idListaValores` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`idListaValores`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- Dumping data for table encuestas.listavalores: ~2 rows (approximately)
/*!40000 ALTER TABLE `listavalores` DISABLE KEYS */;
INSERT INTO `listavalores` (`idListaValores`, `nombre`) VALUES
	(1, 'Valoracion 1-5'),
	(2, 'Provincias');
/*!40000 ALTER TABLE `listavalores` ENABLE KEYS */;


-- Dumping structure for table encuestas.permission
DROP TABLE IF EXISTS `permission`;
CREATE TABLE IF NOT EXISTS `permission` (
  `idPermission` int(11) NOT NULL AUTO_INCREMENT,
  `entityName` varchar(255) DEFAULT NULL,
  `createRow` varchar(255) DEFAULT NULL,
  `insertRow` varchar(255) DEFAULT NULL,
  `updateRow` varchar(255) DEFAULT NULL,
  `deleteRow` varchar(255) DEFAULT NULL,
  `readRow` varchar(255) DEFAULT NULL,
  `search` varchar(255) DEFAULT NULL,
  `namedSearch` varchar(255) DEFAULT NULL,
  `metadata` varchar(255) DEFAULT NULL,
  `idRole` int(11) DEFAULT NULL,
  PRIMARY KEY (`idPermission`),
  KEY `FK57F7A1EF537B364` (`idRole`),
  CONSTRAINT `FK57F7A1EF537B364` FOREIGN KEY (`idRole`) REFERENCES `role` (`idRole`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table encuestas.permission: ~0 rows (approximately)
/*!40000 ALTER TABLE `permission` DISABLE KEYS */;
/*!40000 ALTER TABLE `permission` ENABLE KEYS */;


-- Dumping structure for table encuestas.pregunta
DROP TABLE IF EXISTS `pregunta`;
CREATE TABLE IF NOT EXISTS `pregunta` (
  `idPregunta` int(11) NOT NULL AUTO_INCREMENT,
  `pregunta` varchar(255) DEFAULT NULL,
  `idEncuesta` int(11) DEFAULT NULL,
  `tipoPregunta` int(11) DEFAULT NULL,
  `ultimoItemIncluyeOtros` tinyint(1) DEFAULT NULL,
  `Idx` int(11) DEFAULT NULL,
  PRIMARY KEY (`idPregunta`),
  KEY `FKB7202F0A926153F7` (`idEncuesta`),
  CONSTRAINT `FKB7202F0A926153F7` FOREIGN KEY (`idEncuesta`) REFERENCES `encuesta` (`idEncuesta`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- Dumping data for table encuestas.pregunta: ~4 rows (approximately)
/*!40000 ALTER TABLE `pregunta` DISABLE KEYS */;
INSERT INTO `pregunta` (`idPregunta`, `pregunta`, `idEncuesta`, `tipoPregunta`, `ultimoItemIncluyeOtros`, `Idx`) VALUES
	(1, 'Has conegut l\'oferta formativa del centre per', 1, 0, 1, 3),
	(2, 'Valora del 1 al 5 els següents aspectes', 1, 2, 0, 2),
	(3, 'En matricular-te en aquest centre les teues expectatives son', 1, 1, 1, 1),
	(4, 'Dades Académiques', 1, 2, 0, 0);
/*!40000 ALTER TABLE `pregunta` ENABLE KEYS */;


-- Dumping structure for table encuestas.respuestaencuesta
DROP TABLE IF EXISTS `respuestaencuesta`;
CREATE TABLE IF NOT EXISTS `respuestaencuesta` (
  `idRespuestaEncuesta` int(11) NOT NULL AUTO_INCREMENT,
  `idEncuesta` int(11) DEFAULT NULL,
  `fechaRespuesta` datetime DEFAULT NULL,
  PRIMARY KEY (`idRespuestaEncuesta`),
  KEY `FK3AA724B6926153F7` (`idEncuesta`),
  CONSTRAINT `FK3AA724B6926153F7` FOREIGN KEY (`idEncuesta`) REFERENCES `encuesta` (`idEncuesta`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- Dumping data for table encuestas.respuestaencuesta: ~2 rows (approximately)
/*!40000 ALTER TABLE `respuestaencuesta` DISABLE KEYS */;
INSERT INTO `respuestaencuesta` (`idRespuestaEncuesta`, `idEncuesta`, `fechaRespuesta`) VALUES
	(2, 1, NULL),
	(3, 1, NULL),
	(4, 1, NULL);
/*!40000 ALTER TABLE `respuestaencuesta` ENABLE KEYS */;


-- Dumping structure for table encuestas.respuestaitem
DROP TABLE IF EXISTS `respuestaitem`;
CREATE TABLE IF NOT EXISTS `respuestaitem` (
  `idRespuestaItem` int(11) NOT NULL AUTO_INCREMENT,
  `idItem` int(11) DEFAULT NULL,
  `idRespuestaPregunta` int(11) DEFAULT NULL,
  `checkk` tinyint(1) DEFAULT NULL,
  `valor` varchar(255) DEFAULT NULL,
  `Idx` int(11) DEFAULT NULL,
  PRIMARY KEY (`idRespuestaItem`),
  KEY `FK7FE22AD3E9805DB1` (`idItem`),
  KEY `FK7FE22AD3145E699D` (`idRespuestaPregunta`),
  CONSTRAINT `FK7FE22AD3145E699D` FOREIGN KEY (`idRespuestaPregunta`) REFERENCES `respuestapregunta` (`idRespuestaPregunta`),
  CONSTRAINT `FK7FE22AD3E9805DB1` FOREIGN KEY (`idItem`) REFERENCES `item` (`idItem`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8;

-- Dumping data for table encuestas.respuestaitem: ~36 rows (approximately)
/*!40000 ALTER TABLE `respuestaitem` DISABLE KEYS */;
INSERT INTO `respuestaitem` (`idRespuestaItem`, `idItem`, `idRespuestaPregunta`, `checkk`, `valor`, `Idx`) VALUES
	(1, 13, 2, 0, '', 0),
	(2, 14, 2, 0, '', 1),
	(3, 15, 2, 0, '', 2),
	(4, 16, 2, 0, '', 3),
	(5, 17, 2, 0, '', 4),
	(6, 18, 2, 0, '', 5),
	(7, 8, 3, 0, NULL, 0),
	(8, 9, 3, 0, NULL, 1),
	(9, 10, 3, 0, NULL, 2),
	(10, 11, 3, 0, NULL, 3),
	(11, 12, 3, 0, '', 4),
	(12, 6, 4, 0, '', 0),
	(13, 7, 4, 0, '', 1),
	(14, 1, 5, 0, NULL, 0),
	(15, 2, 5, 0, NULL, 1),
	(16, 3, 5, 0, NULL, 2),
	(17, 4, 5, 0, NULL, 3),
	(18, 5, 5, 0, '', 4),
	(19, 13, 6, 0, 'Modalitat d\'accÃ©s', 0),
	(20, 14, 6, 0, 'Ãltims estudis cursats', 1),
	(21, 15, 6, 0, 'Ãltim centre acadÃ©mic', 2),
	(22, 16, 6, 0, 'PoblaciÃ³', 3),
	(23, 17, 6, 0, 'Codi postal', 4),
	(24, 18, 6, 0, 'Valencia', 5),
	(25, 8, 7, 1, NULL, 0),
	(26, 9, 7, 1, NULL, 1),
	(27, 10, 7, 1, NULL, 2),
	(28, 11, 7, 1, NULL, 3),
	(29, 12, 7, 1, 'Altres (indicar quines):Check', 4),
	(30, 6, 8, 0, '3', 0),
	(31, 7, 8, 0, '5', 1),
	(32, 1, 9, 0, NULL, 0),
	(33, 2, 9, 0, NULL, 1),
	(34, 3, 9, 0, NULL, 2),
	(35, 4, 9, 0, NULL, 3),
	(36, 5, 9, 1, 'Altres (indicar quines):Radio', 4),
	(37, 13, 10, 0, '', 0),
	(38, 14, 10, 0, '', 1),
	(39, 15, 10, 0, '', 2),
	(40, 16, 10, 0, '', 3),
	(41, 17, 10, 0, '', 4),
	(42, 18, 10, 0, '', 5),
	(43, 8, 11, 0, NULL, 0),
	(44, 9, 11, 1, NULL, 1),
	(45, 10, 11, 0, NULL, 2),
	(46, 11, 11, 1, NULL, 3),
	(47, 12, 11, 0, 'aaa', 4),
	(48, 6, 12, 0, '3', 0),
	(49, 7, 12, 0, '5', 1),
	(50, 1, 13, 0, NULL, 0),
	(51, 2, 13, 0, NULL, 1),
	(52, 3, 13, 1, NULL, 2),
	(53, 4, 13, 0, NULL, 3),
	(54, 5, 13, 0, '', 4);
/*!40000 ALTER TABLE `respuestaitem` ENABLE KEYS */;


-- Dumping structure for table encuestas.respuestapregunta
DROP TABLE IF EXISTS `respuestapregunta`;
CREATE TABLE IF NOT EXISTS `respuestapregunta` (
  `idRespuestaPregunta` int(11) NOT NULL AUTO_INCREMENT,
  `idRespuestaEncuesta` int(11) DEFAULT NULL,
  `idPregunta` int(11) DEFAULT NULL,
  `Idx` int(11) DEFAULT NULL,
  PRIMARY KEY (`idRespuestaPregunta`),
  KEY `FK87989AAA7A7B7DB5` (`idRespuestaEncuesta`),
  KEY `FK87989AAA2C443FDF` (`idPregunta`),
  CONSTRAINT `FK87989AAA2C443FDF` FOREIGN KEY (`idPregunta`) REFERENCES `pregunta` (`idPregunta`),
  CONSTRAINT `FK87989AAA7A7B7DB5` FOREIGN KEY (`idRespuestaEncuesta`) REFERENCES `respuestaencuesta` (`idRespuestaEncuesta`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- Dumping data for table encuestas.respuestapregunta: ~8 rows (approximately)
/*!40000 ALTER TABLE `respuestapregunta` DISABLE KEYS */;
INSERT INTO `respuestapregunta` (`idRespuestaPregunta`, `idRespuestaEncuesta`, `idPregunta`, `Idx`) VALUES
	(2, 2, 4, 0),
	(3, 2, 3, 1),
	(4, 2, 2, 2),
	(5, 2, 1, 3),
	(6, 3, 4, 0),
	(7, 3, 3, 1),
	(8, 3, 2, 2),
	(9, 3, 1, 3),
	(10, 4, 4, 0),
	(11, 4, 3, 1),
	(12, 4, 2, 2),
	(13, 4, 1, 3);
/*!40000 ALTER TABLE `respuestapregunta` ENABLE KEYS */;


-- Dumping structure for table encuestas.role
DROP TABLE IF EXISTS `role`;
CREATE TABLE IF NOT EXISTS `role` (
  `idRole` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`idRole`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table encuestas.role: ~0 rows (approximately)
/*!40000 ALTER TABLE `role` DISABLE KEYS */;
/*!40000 ALTER TABLE `role` ENABLE KEYS */;


-- Dumping structure for table encuestas.user
DROP TABLE IF EXISTS `user`;
CREATE TABLE IF NOT EXISTS `user` (
  `idUser` int(11) NOT NULL AUTO_INCREMENT,
  `login` varchar(255) DEFAULT NULL,
  `enabled` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`idUser`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table encuestas.user: ~0 rows (approximately)
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
/*!40000 ALTER TABLE `user` ENABLE KEYS */;


-- Dumping structure for table encuestas.userrole
DROP TABLE IF EXISTS `userrole`;
CREATE TABLE IF NOT EXISTS `userrole` (
  `idUserRole` int(11) NOT NULL AUTO_INCREMENT,
  `idUser` int(11) DEFAULT NULL,
  `idRole` int(11) DEFAULT NULL,
  PRIMARY KEY (`idUserRole`),
  KEY `FKF3F7670153A8A0E` (`idUser`),
  KEY `FKF3F76701537B364` (`idRole`),
  CONSTRAINT `FKF3F76701537B364` FOREIGN KEY (`idRole`) REFERENCES `role` (`idRole`),
  CONSTRAINT `FKF3F7670153A8A0E` FOREIGN KEY (`idUser`) REFERENCES `user` (`idUser`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table encuestas.userrole: ~0 rows (approximately)
/*!40000 ALTER TABLE `userrole` DISABLE KEYS */;
/*!40000 ALTER TABLE `userrole` ENABLE KEYS */;


-- Dumping structure for table encuestas.valor
DROP TABLE IF EXISTS `valor`;
CREATE TABLE IF NOT EXISTS `valor` (
  `idValor` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) DEFAULT NULL,
  `idListaValores` int(11) DEFAULT NULL,
  `Idx` int(11) DEFAULT NULL,
  PRIMARY KEY (`idValor`),
  KEY `FK4E9A0A436E0A389` (`idListaValores`),
  CONSTRAINT `FK4E9A0A436E0A389` FOREIGN KEY (`idListaValores`) REFERENCES `listavalores` (`idListaValores`)
) ENGINE=InnoDB AUTO_INCREMENT=59 DEFAULT CHARSET=utf8;

-- Dumping data for table encuestas.valor: ~57 rows (approximately)
/*!40000 ALTER TABLE `valor` DISABLE KEYS */;
INSERT INTO `valor` (`idValor`, `nombre`, `idListaValores`, `Idx`) VALUES
	(1, '1', 1, 0),
	(2, '2', 1, 1),
	(3, '3', 1, 2),
	(4, '4', 1, 3),
	(5, '5', 1, 4),
	(7, 'Álava', 2, 0),
	(8, 'Albacete', 2, 1),
	(9, 'Alicante', 2, 2),
	(10, 'Almería', 2, 3),
	(11, 'Asturias', 2, 4),
	(12, 'Ávila', 2, 5),
	(13, 'Badajoz', 2, 6),
	(14, 'Balears, Illes', 2, 7),
	(15, 'Barcelona', 2, 8),
	(16, 'Bizkaia', 2, 9),
	(17, 'Burgos', 2, 10),
	(18, 'Cáceres', 2, 11),
	(19, 'Cádiz', 2, 12),
	(20, 'Cantabria', 2, 13),
	(21, 'Castellón', 2, 14),
	(22, 'Ciudad Real', 2, 15),
	(23, 'Córdoba', 2, 16),
	(24, 'Coruña, A', 2, 17),
	(25, 'Cuenca', 2, 18),
	(26, 'Gipuzkoa', 2, 19),
	(27, 'Girona', 2, 20),
	(28, 'Granada', 2, 21),
	(29, 'Guadalajara', 2, 22),
	(30, 'Huelva', 2, 23),
	(31, 'Huesca', 2, 24),
	(32, 'Jaén', 2, 25),
	(33, 'León', 2, 26),
	(34, 'Lleida', 2, 27),
	(35, 'Lugo', 2, 28),
	(36, 'Madrid', 2, 29),
	(37, 'Málaga', 2, 30),
	(38, 'Murcia', 2, 31),
	(39, 'Navarra', 2, 32),
	(40, 'Ourense', 2, 33),
	(41, 'Palencia', 2, 34),
	(42, 'Palmas, Las', 2, 35),
	(43, 'Pontevedra', 2, 36),
	(44, 'Rioja, La', 2, 37),
	(45, 'Salamanca', 2, 38),
	(46, 'Santa Cruz de Tenerife', 2, 39),
	(47, 'Segovia', 2, 40),
	(48, 'Sevilla', 2, 41),
	(49, 'Soria', 2, 42),
	(50, 'Tarragona', 2, 43),
	(51, 'Teruel', 2, 44),
	(52, 'Toledo', 2, 45),
	(53, 'Valencia', 2, 46),
	(54, 'Valladolid', 2, 47),
	(55, 'Zamora', 2, 48),
	(56, 'Zaragoza', 2, 49),
	(57, 'Ceuta', 2, 50),
	(58, 'Melilla', 2, 51);
/*!40000 ALTER TABLE `valor` ENABLE KEYS */;
/*!40014 SET FOREIGN_KEY_CHECKS=1 */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;

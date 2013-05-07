-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               5.5.27 - MySQL Community Server (GPL)
-- Server OS:                    Win32
-- HeidiSQL version:             7.0.0.4053
-- Date/time:                    2013-04-23 13:48:38
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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- Dumping data for table encuestas.encuesta: ~3 rows (approximately)
/*!40000 ALTER TABLE `encuesta` DISABLE KEYS */;
INSERT INTO `encuesta` (`idEncuesta`, `nombre`, `habilitada`, `fechaInicio`, `fechaFin`, `imprimir`) VALUES
	(1, 'Nuevo en el centro', 1, NULL, NULL, 1),
	(2, 'Curso de AngularJS', 1, NULL, NULL, 0),
	(3, 'Alumno del centro', 1, NULL, NULL, 1);
/*!40000 ALTER TABLE `encuesta` ENABLE KEYS */;


-- Dumping structure for table encuestas.item
DROP TABLE IF EXISTS `item`;
CREATE TABLE IF NOT EXISTS `item` (
  `idItem` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) DEFAULT NULL,
  `tipoItem` int(11) DEFAULT NULL,
  `idListaValores` int(11) DEFAULT NULL,
  `idPregunta` int(11) DEFAULT NULL,
  `requerido` tinyint(4) DEFAULT '0',
  `Idx` int(11) DEFAULT NULL,
  PRIMARY KEY (`idItem`),
  KEY `FK22EF3336E0A389` (`idListaValores`),
  KEY `FK22EF332C443FDF` (`idPregunta`),
  CONSTRAINT `FK22EF332C443FDF` FOREIGN KEY (`idPregunta`) REFERENCES `pregunta` (`idPregunta`),
  CONSTRAINT `FK22EF3336E0A389` FOREIGN KEY (`idListaValores`) REFERENCES `listavalores` (`idListaValores`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8;

-- Dumping data for table encuestas.item: ~35 rows (approximately)
/*!40000 ALTER TABLE `item` DISABLE KEYS */;
INSERT INTO `item` (`idItem`, `nombre`, `tipoItem`, `idListaValores`, `idPregunta`, `requerido`, `Idx`) VALUES
	(1, 'La consellería d\'educació', NULL, NULL, 1, 1, 0),
	(2, 'El centre on estudiaves anteriorment', NULL, NULL, 1, 1, 1),
	(3, 'La publicitat del CIPFP MISLATA', NULL, NULL, 1, 1, 2),
	(4, 'La pàgina web del CIPFP Mislata', NULL, NULL, 1, 1, 3),
	(5, 'Altres (indicar quines):', NULL, NULL, 1, 1, 4),
	(6, 'El procés de matricula', 1, 1, 2, 1, 0),
	(7, 'El tracte rebut pel personal del centre', 1, 1, 2, 1, 1),
	(8, 'Obtindre un titol', NULL, NULL, 3, 1, 0),
	(9, 'Tindre una bona formació', NULL, NULL, 3, 1, 1),
	(10, 'Trobar treball relacionat ams els estudis cursats', NULL, NULL, 3, 1, 2),
	(11, 'Continuar estudis per completar la meua formació', NULL, NULL, 3, 1, 3),
	(12, 'Altres (indicar quines)', NULL, NULL, 3, 1, 4),
	(13, 'Modalitat d\'accés', 2, NULL, 4, 1, 0),
	(14, 'Últims estudis cursats', 2, NULL, 4, 1, 1),
	(15, 'Últim centre académic', 2, NULL, 4, 1, 2),
	(16, 'Població', 2, NULL, 4, 1, 3),
	(17, 'Codi postal', 2, NULL, 4, 1, 4),
	(18, 'Provincia', 1, 2, 4, 1, 5),
	(19, 'Dia de la semana', 1, 3, 5, 1, 0),
	(20, 'Dia de la semana', 1, 3, 11, 0, 0),
	(21, 'Lunes', 0, NULL, 6, 1, 0),
	(22, 'Martes', 0, NULL, 6, 1, 1),
	(23, 'Miercoles', 0, NULL, 6, 1, 2),
	(24, 'Jueves', 0, NULL, 6, 1, 3),
	(25, 'Viernes', 0, NULL, 6, 1, 4),
	(26, NULL, 4, NULL, 12, 0, 0),
	(27, 'Buscar treball relacionat amb els estudis cursats', NULL, NULL, 13, 1, 0),
	(28, 'Buscar treball encara que no estiga relacionat ams els estudis cursats', NULL, NULL, 13, 1, 1),
	(29, 'Continuar estudis de la matexia especialitat en la que estic matriculat', NULL, NULL, 13, 1, 2),
	(30, 'Continuar estudis en una altra especialitat de la que estic matriculat', NULL, NULL, 13, 1, 3),
	(31, 'El procés de matricula', 1, 1, 14, 1, 0),
	(32, 'El tracte rebut pel personal del centre', 1, 1, 14, 1, 1),
	(33, 'El funcionament general del centre', 1, 1, 14, 1, 2),
	(34, 'La teua experiéncia com alumne', 1, 1, 14, 1, 3),
	(35, 'EL nivell general del professorat', 1, 1, 14, 1, 4),
	(36, NULL, 4, NULL, 15, 0, 0);
/*!40000 ALTER TABLE `item` ENABLE KEYS */;


-- Dumping structure for table encuestas.listavalores
DROP TABLE IF EXISTS `listavalores`;
CREATE TABLE IF NOT EXISTS `listavalores` (
  `idListaValores` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) DEFAULT NULL,
  `contieneValoresNumericos` tinyint(4) DEFAULT '0',
  PRIMARY KEY (`idListaValores`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- Dumping data for table encuestas.listavalores: ~3 rows (approximately)
/*!40000 ALTER TABLE `listavalores` DISABLE KEYS */;
INSERT INTO `listavalores` (`idListaValores`, `nombre`, `contieneValoresNumericos`) VALUES
	(1, 'Valoracion 1-5', 1),
	(2, 'Provincias', 0),
	(3, 'Dias semana laborables', 0);
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
  `requerido` tinyint(4) DEFAULT '0',
  `Idx` int(11) DEFAULT NULL,
  PRIMARY KEY (`idPregunta`),
  KEY `FKB7202F0A926153F7` (`idEncuesta`),
  CONSTRAINT `FKB7202F0A926153F7` FOREIGN KEY (`idEncuesta`) REFERENCES `encuesta` (`idEncuesta`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

-- Dumping data for table encuestas.pregunta: ~11 rows (approximately)
/*!40000 ALTER TABLE `pregunta` DISABLE KEYS */;
INSERT INTO `pregunta` (`idPregunta`, `pregunta`, `idEncuesta`, `tipoPregunta`, `ultimoItemIncluyeOtros`, `requerido`, `Idx`) VALUES
	(1, 'Has conegut l\'oferta formativa del centre per', 1, 0, 1, 1, 3),
	(2, 'Valora del 1 al 5 els següents aspectes', 1, 2, 0, 1, 2),
	(3, 'En matricular-te en aquest centre les teues expectatives son', 1, 1, 1, 1, 1),
	(4, 'Dades Académiques', 1, 2, 0, 1, 0),
	(5, '¿Que dia de la semana prefieres el curso?', 2, 2, 0, 0, 0),
	(6, 'Indica otros dias en los que podrías venir', 2, 2, 0, 1, 2),
	(11, '¿Que día te sería imposible venir?', 2, 2, 0, 1, 1),
	(12, 'Voldries afegir algún suggeriment?', 1, 2, 0, 0, 4),
	(13, 'En acabar el cicle al que te matricules la teu intenció actual és la de', 3, 1, 0, 1, 0),
	(14, 'Valora de 1 a 5 els següents aspectes del centre', 3, 2, 0, 1, 1),
	(15, 'Voldries afegir algún suggeriment?', 3, 2, 0, 0, 2);
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
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;

-- Dumping data for table encuestas.respuestaencuesta: ~0 rows (approximately)
/*!40000 ALTER TABLE `respuestaencuesta` DISABLE KEYS */;
/*!40000 ALTER TABLE `respuestaencuesta` ENABLE KEYS */;


-- Dumping structure for table encuestas.respuestaitem
DROP TABLE IF EXISTS `respuestaitem`;
CREATE TABLE IF NOT EXISTS `respuestaitem` (
  `idRespuestaItem` int(11) NOT NULL AUTO_INCREMENT,
  `idItem` int(11) DEFAULT NULL,
  `idRespuestaPregunta` int(11) DEFAULT NULL,
  `checkk` tinyint(1) DEFAULT NULL,
  `valor` text,
  `valorNumerico` double DEFAULT NULL,
  `Idx` int(11) DEFAULT NULL,
  PRIMARY KEY (`idRespuestaItem`),
  KEY `FK7FE22AD3E9805DB1` (`idItem`),
  KEY `FK7FE22AD3145E699D` (`idRespuestaPregunta`),
  CONSTRAINT `FK7FE22AD3145E699D` FOREIGN KEY (`idRespuestaPregunta`) REFERENCES `respuestapregunta` (`idRespuestaPregunta`),
  CONSTRAINT `FK7FE22AD3E9805DB1` FOREIGN KEY (`idItem`) REFERENCES `item` (`idItem`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table encuestas.respuestaitem: ~0 rows (approximately)
/*!40000 ALTER TABLE `respuestaitem` DISABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=73 DEFAULT CHARSET=utf8;

-- Dumping data for table encuestas.respuestapregunta: ~0 rows (approximately)
/*!40000 ALTER TABLE `respuestapregunta` DISABLE KEYS */;
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
  `valorNumerico` double DEFAULT NULL,
  `Idx` int(11) DEFAULT NULL,
  PRIMARY KEY (`idValor`),
  KEY `FK4E9A0A436E0A389` (`idListaValores`),
  CONSTRAINT `FK4E9A0A436E0A389` FOREIGN KEY (`idListaValores`) REFERENCES `listavalores` (`idListaValores`)
) ENGINE=InnoDB AUTO_INCREMENT=68 DEFAULT CHARSET=utf8;

-- Dumping data for table encuestas.valor: ~62 rows (approximately)
/*!40000 ALTER TABLE `valor` DISABLE KEYS */;
INSERT INTO `valor` (`idValor`, `nombre`, `idListaValores`, `valorNumerico`, `Idx`) VALUES
	(1, '1', 1, 1, 0),
	(2, '2', 1, 2, 1),
	(3, '3', 1, 3, 2),
	(4, '4', 1, 4, 3),
	(5, '5', 1, 5, 4),
	(7, 'Álava', 2, NULL, 0),
	(8, 'Albacete', 2, NULL, 1),
	(9, 'Alicante', 2, NULL, 2),
	(10, 'Almería', 2, NULL, 3),
	(11, 'Asturias', 2, NULL, 4),
	(12, 'Ávila', 2, NULL, 5),
	(13, 'Badajoz', 2, NULL, 6),
	(14, 'Balears, Illes', 2, NULL, 7),
	(15, 'Barcelona', 2, NULL, 8),
	(16, 'Bizkaia', 2, NULL, 9),
	(17, 'Burgos', 2, NULL, 10),
	(18, 'Cáceres', 2, NULL, 11),
	(19, 'Cádiz', 2, NULL, 12),
	(20, 'Cantabria', 2, NULL, 13),
	(21, 'Castellón', 2, NULL, 14),
	(22, 'Ciudad Real', 2, NULL, 15),
	(23, 'Córdoba', 2, NULL, 16),
	(24, 'Coruña, A', 2, NULL, 17),
	(25, 'Cuenca', 2, NULL, 18),
	(26, 'Gipuzkoa', 2, NULL, 19),
	(27, 'Girona', 2, NULL, 20),
	(28, 'Granada', 2, NULL, 21),
	(29, 'Guadalajara', 2, NULL, 22),
	(30, 'Huelva', 2, NULL, 23),
	(31, 'Huesca', 2, NULL, 24),
	(32, 'Jaén', 2, NULL, 25),
	(33, 'León', 2, NULL, 26),
	(34, 'Lleida', 2, NULL, 27),
	(35, 'Lugo', 2, NULL, 28),
	(36, 'Madrid', 2, NULL, 29),
	(37, 'Málaga', 2, NULL, 30),
	(38, 'Murcia', 2, NULL, 31),
	(39, 'Navarra', 2, NULL, 32),
	(40, 'Ourense', 2, NULL, 33),
	(41, 'Palencia', 2, NULL, 34),
	(42, 'Palmas, Las', 2, NULL, 35),
	(43, 'Pontevedra', 2, NULL, 36),
	(44, 'Rioja, La', 2, NULL, 37),
	(45, 'Salamanca', 2, NULL, 38),
	(46, 'Santa Cruz de Tenerife', 2, NULL, 39),
	(47, 'Segovia', 2, NULL, 40),
	(48, 'Sevilla', 2, NULL, 41),
	(49, 'Soria', 2, NULL, 42),
	(50, 'Tarragona', 2, NULL, 43),
	(51, 'Teruel', 2, NULL, 44),
	(52, 'Toledo', 2, NULL, 45),
	(53, 'Valencia', 2, NULL, 46),
	(54, 'Valladolid', 2, NULL, 47),
	(55, 'Zamora', 2, NULL, 48),
	(56, 'Zaragoza', 2, NULL, 49),
	(57, 'Ceuta', 2, NULL, 50),
	(58, 'Melilla', 2, NULL, 51),
	(59, 'Lunes', 3, NULL, 0),
	(60, 'Martes', 3, NULL, 1),
	(63, 'Miercoles', 3, NULL, 2),
	(64, 'Jueves', 3, NULL, 3),
	(67, 'Viernes', 3, NULL, 4);
/*!40000 ALTER TABLE `valor` ENABLE KEYS */;
/*!40014 SET FOREIGN_KEY_CHECKS=1 */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;

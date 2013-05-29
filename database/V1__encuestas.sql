CREATE TABLE  `listavalores` (
  `idListaValores` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) DEFAULT NULL,
  `contieneValoresNumericos` tinyint(4) DEFAULT '0',
  PRIMARY KEY (`idListaValores`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;


INSERT INTO `listavalores` (`idListaValores`, `nombre`, `contieneValoresNumericos`) VALUES
	(1, 'Valoracion 0-10-NS/NC', 1),
	(2, 'Provincias', 0),
	(3, 'Dias semana laborables', 0);


CREATE TABLE  `valor` (
  `idValor` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) DEFAULT NULL,
  `idListaValores` int(11) DEFAULT NULL,
  `valorNumerico` double DEFAULT NULL,
  `Idx` int(11) DEFAULT NULL,
  PRIMARY KEY (`idValor`),
  KEY `FK4E9A0A436E0A389` (`idListaValores`),
  CONSTRAINT `FK4E9A0A436E0A389` FOREIGN KEY (`idListaValores`) REFERENCES `listavalores` (`idListaValores`)
) ENGINE=InnoDB AUTO_INCREMENT=75 DEFAULT CHARSET=utf8;

INSERT INTO `valor` (`idValor`, `nombre`, `idListaValores`, `valorNumerico`, `Idx`) VALUES
	(1, '1', 1, 1, 1),
	(2, '2', 1, 2, 2),
	(3, '3', 1, 3, 3),
	(4, '4', 1, 4, 4),
	(5, '5', 1, 5, 5),
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
	(67, 'Viernes', 3, NULL, 4),
	(68, '6', 1, 6, 6),
	(69, '7', 1, 7, 7),
	(70, '8', 1, 8, 8),
	(71, '9', 1, 9, 9),
	(72, '10', 1, 10, 10),
	(73, '0', 1, 0, 0),
	(74, 'NS/NC', 1, NULL, 11);

CREATE TABLE `curso` (
  `idCurso` int(10) NOT NULL AUTO_INCREMENT,
  `anyoInicio` int(10) DEFAULT NULL,
  PRIMARY KEY (`idCurso`),
  UNIQUE KEY `anyoInicio` (`anyoInicio`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8;

-- Dumping data for table encuestas.curso: ~29 rows (approximately)
/*!40000 ALTER TABLE `curso` DISABLE KEYS */;
INSERT INTO `curso` (`idCurso`, `anyoInicio`) VALUES
	(1, 2012),
	(2, 2013),
	(3, 2014),
	(4, 2015),
	(5, 2016),
	(6, 2017),
	(7, 2018),
	(8, 2019),
	(9, 2020),
	(10, 2021),
	(11, 2022),
	(12, 2023),
	(13, 2024),
	(14, 2025),
	(15, 2026),
	(16, 2027),
	(17, 2028),
	(18, 2029),
	(19, 2030),
	(20, 2031),
	(21, 2032),
	(22, 2033),
	(23, 2034),
	(24, 2035),
	(25, 2036),
	(26, 2037),
	(27, 2038),
	(28, 2039),
	(29, 2040);


CREATE TABLE `encuesta` (
  `idEncuesta` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) DEFAULT NULL,
  `habilitada` tinyint(1) DEFAULT NULL,
  `fechaInicio` datetime DEFAULT NULL,
  `fechaFin` datetime DEFAULT NULL,
  `imprimir` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`idEncuesta`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

INSERT INTO `encuesta` (`idEncuesta`, `nombre`, `habilitada`, `fechaInicio`, `fechaFin`, `imprimir`) VALUES
	(1, 'Nou al centre', 1, NULL, NULL, 1),
	(3, 'Alumne del centre', 1, NULL, NULL, 1);



CREATE TABLE `pregunta` (
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
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;


INSERT INTO `pregunta` (`idPregunta`, `pregunta`, `idEncuesta`, `tipoPregunta`, `ultimoItemIncluyeOtros`, `requerido`, `Idx`) VALUES
	(1, 'Has conegut l\'oferta formativa del centre per', 1, 0, 1, 1, 3),
	(2, 'Valora del 1 al 10 els següents aspectes', 1, 2, 0, 1, 2),
	(3, 'En matricular-te en aquest centre les teues expectatives son', 1, 1, 1, 1, 1),
	(4, 'Dades Académiques', 1, 2, 0, 1, 0),
	(12, 'Voldries afegir algún suggeriment?', 1, 2, 0, 0, 4),
	(13, 'En acabar el cicle al que te matricules la teu intenció actual és la de', 3, 1, 0, 1, 0),
	(14, 'Valora de 1 a 10 els següents aspectes del centre', 3, 2, 0, 1, 1),
	(15, 'Voldries afegir algún suggeriment?', 3, 2, 0, 0, 3),
	(16, 'Quan hages de fer les FCTs, on preferixes fer-les? (La teua resposta no et compromet a res, és només per a orientar-nos)', 3, 1, 0, 1, 2);



CREATE TABLE `item` (
  `idItem` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) DEFAULT NULL,
  `tipoItem` int(11) DEFAULT NULL,
  `idListaValores` int(11) DEFAULT NULL,
  `idPregunta` int(11) DEFAULT NULL,
  `requerido` tinyint(4) DEFAULT '0',
  `expresionRegular` VARCHAR(255) DEFAULT NULL,
  `Idx` int(11) DEFAULT NULL,
  PRIMARY KEY (`idItem`),
  KEY `FK22EF3336E0A389` (`idListaValores`),
  KEY `FK22EF332C443FDF` (`idPregunta`),
  CONSTRAINT `FK22EF332C443FDF` FOREIGN KEY (`idPregunta`) REFERENCES `pregunta` (`idPregunta`),
  CONSTRAINT `FK22EF3336E0A389` FOREIGN KEY (`idListaValores`) REFERENCES `listavalores` (`idListaValores`)
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8;


INSERT INTO `item` (`idItem`, `nombre`, `tipoItem`, `idListaValores`, `idPregunta`, `requerido`, `expresionRegular`, `Idx`) VALUES
	(1, 'La consellería d\'educació', NULL, NULL, 1, 1, NULL, 0),
	(2, 'El centre on estudiaves anteriorment', NULL, NULL, 1, 1, NULL, 1),
	(3, 'La publicitat del CIPFP Mislata', NULL, NULL, 1, 1, NULL, 2),
	(4, 'La pàgina web del CIPFP Mislata', NULL, NULL, 1, 1, NULL, 3),
	(5, 'Altres (indicar quines):', NULL, NULL, 1, 1, NULL, 4),
	(6, 'El procés de matricula', 1, 1, 2, 1, NULL, 0),
	(7, 'El tracte rebut pel personal del centre', 1, 1, 2, 1, NULL, 1),
	(8, 'Obtindre un titol', NULL, NULL, 3, 1, NULL, 0),
	(9, 'Tindre una bona formació', NULL, NULL, 3, 1, NULL, 1),
	(10, 'Trobar treball relacionat amb els estudis cursats', NULL, NULL, 3, 1, NULL, 2),
	(11, 'Continuar estudis per completar la meua formació', NULL, NULL, 3, 1, NULL, 3),
	(12, 'Altres (indicar quines)', NULL, NULL, 3, 1, NULL, 4),
	(13, 'Modalitat d\'accés', 2, NULL, 4, 1, NULL, 0),
	(14, 'Últims estudis cursats', 2, NULL, 4, 1, NULL, 1),
	(15, 'Últim centre académic', 2, NULL, 4, 1, NULL, 2),
	(16, 'Població', 2, NULL, 4, 1, NULL, 3),
	(17, 'Codi postal', 2, NULL, 4, 1, '[0-9]{5}', 4),
	(18, 'Provincia', 1, 2, 4, 1, NULL, 5),
	(26, 'Algún suggeriment', 4, NULL, 12, 0, NULL, 0),
	(27, 'Buscar treball relacionat amb els estudis cursats', NULL, NULL, 13, 1, NULL, 0),
	(28, 'Buscar treball encara que no estiga relacionat ams els estudis cursats', NULL, NULL, 13, 1, NULL, 1),
	(29, 'Continuar estudis de la matexia especialitat en la que estic matriculat', NULL, NULL, 13, 1, NULL, 2),
	(30, 'Continuar estudis en una altra especialitat de la que estic matriculat', NULL, NULL, 13, 1, NULL, 3),
	(31, 'El procés de matricula', 1, 1, 14, 1, NULL, 0),
	(32, 'El tracte rebut pel personal del centre', 1, 1, 14, 1, NULL, 1),
	(33, 'El funcionament general del centre', 1, 1, 14, 1, NULL, 2),
	(34, 'La teua experiéncia com alumne', 1, 1, 14, 1, NULL, 3),
	(35, 'El nivell general del professorat', 1, 1, 14, 1, NULL, 4),
	(36, 'Algún suggeriment', 4, NULL, 15, 0, NULL, 0),
	(37, 'En la Comunitat Valenciana', NULL, NULL, 16, 0, NULL, 0),
	(38, 'En la resta d\'Espanya', NULL, NULL, 16, 0, NULL, 1),
	(39, 'En la resta d\'Europa', NULL, NULL, 16, 0, NULL, 2);


CREATE TABLE  `respuestaencuesta` (
  `idRespuestaEncuesta` int(11) NOT NULL AUTO_INCREMENT,
  `idEncuesta` int(11) DEFAULT NULL,
  `fechaRespuesta` datetime DEFAULT NULL,
  `idCurso` int(11) DEFAULT NULL,
  PRIMARY KEY (`idRespuestaEncuesta`),
  KEY `FK3AA724B6926153F7` (`idEncuesta`),
  KEY `idCurso` (`idCurso`),
  CONSTRAINT `FK_respuestaencuesta_curso` FOREIGN KEY (`idCurso`) REFERENCES `curso` (`idCurso`),
  CONSTRAINT `FK3AA724B6926153F7` FOREIGN KEY (`idEncuesta`) REFERENCES `encuesta` (`idEncuesta`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


CREATE TABLE `respuestapregunta` (
  `idRespuestaPregunta` int(11) NOT NULL AUTO_INCREMENT,
  `idRespuestaEncuesta` int(11) DEFAULT NULL,
  `idPregunta` int(11) DEFAULT NULL,
  `Idx` int(11) DEFAULT NULL,
  PRIMARY KEY (`idRespuestaPregunta`),
  KEY `FK87989AAA7A7B7DB5` (`idRespuestaEncuesta`),
  KEY `FK87989AAA2C443FDF` (`idPregunta`),
  CONSTRAINT `FK87989AAA2C443FDF` FOREIGN KEY (`idPregunta`) REFERENCES `pregunta` (`idPregunta`),
  CONSTRAINT `FK87989AAA7A7B7DB5` FOREIGN KEY (`idRespuestaEncuesta`) REFERENCES `respuestaencuesta` (`idRespuestaEncuesta`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


CREATE TABLE  `respuestaitem` (
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




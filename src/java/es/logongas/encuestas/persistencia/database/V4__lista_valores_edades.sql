INSERT INTO `listavalores` (`idListaValores`, `nombre`, `contieneValoresNumericos`) VALUES
        (5, 'Edades', 0);


INSERT INTO `valor` (`idValor`, `nombre`, `idListaValores`, `valorNumerico`, `Idx`) VALUES
	(80, '17 años o menos', 5, NULL, 0),
	(81, 'de 18 a 22 años', 5, NULL, 1),
	(82, 'de 23 a 28 años', 5, NULL, 2),
	(83, 'de 29 a 34 años', 5, NULL, 3),
	(84, 'de 35 a 44 años', 5, NULL, 4),
	(85, 'de 45 a 55 años', 5, NULL, 5),
	(86, '55 años o mas', 5, NULL, 6);
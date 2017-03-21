INSERT INTO `identity` (`ididentity`, `login`, `name`) VALUES
	(19, 'admin', 'Administrador');

INSERT INTO `userr` (`ididentity`) VALUES
	(19);

INSERT INTO `groupmember` (`idGroupMember`, `idGroup`, `ididentity`, `priority`) VALUES
	(19, 3, 19, NULL);
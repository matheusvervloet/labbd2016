CREATE DEFINER=`root`@`localhost` PROCEDURE `insereDepartamento`(sigla char(10), nome char(255))
BEGIN
	INSERT INTO labbd.departamento (sigla, nome)
    VALUES  (sigla, nome);
END
CREATE DEFINER=`root`@`localhost` PROCEDURE `insereDisciplina`(sigla CHAR(10), nome CHAR(255), ementa LONGTEXT, creditos int , sigla_depto CHAR(10))
BEGIN
	INSERT INTO labbd.disciplina (sigla, nome, ementa, creditos,sigla_depto)
		VALUES  (sigla, nome, ementa, creditos,sigla_depto);
END
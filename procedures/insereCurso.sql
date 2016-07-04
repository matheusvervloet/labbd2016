CREATE DEFINER=`root`@`localhost` PROCEDURE `insereCurso`(sigla CHAR(10), nome CHAR(255), max_creditos int, min_creditos int)
BEGIN
INSERT INTO labbd.curso (sigla, nome, max_creditos, min_creditos) 
    VALUES  (sigla, nome, max_creditos, min_creditos);
END
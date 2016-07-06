CREATE DEFINER=`root`@`localhost` PROCEDURE `insereCurso`(
        p_ano                 YEAR(4), 
        p_periodo             CHAR(10), 
        p_sigla_curso         CHAR(10)
)
BEGIN
        INSERT INTO labbd.enade (ano, periodo, sigla_curso) VALUES  (ano, periodo, sigla_curso);
END
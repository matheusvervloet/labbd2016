CREATE DEFINER=`root`@`localhost` PROCEDURE `insereEnade`(
        p_ano                 YEAR(4), 
        p_periodo             CHAR(10), 
        p_sigla_curso         CHAR(10),
        p_resultado           CHAR(4),
)
BEGIN
        INSERT INTO labbd.enade (ano, periodo, sigla_curso, resultado) VALUES  (p_ano, p_periodo, sigla_curso, p_resultado);
END
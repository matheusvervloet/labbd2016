CREATE DEFINER=`root`@`localhost` PROCEDURE `insereCA`(
    p_sigla               CHAR(10),
    p_nome                CHAR(255)
)
BEGIN
	INSERT INTO labbd.docente (sigla, nome) VALUES (p_sigla, p_nome);
END
DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `insereTA`(
    p_cpf                         CHAR(12),
	p_prenome             		  CHAR(255),
    p_nome_meio           		  CHAR(255),
    p_sobrenome           		  CHAR(255)
)
BEGIN
	INSERT INTO labbd.pessoa (cpf, prenome, nome_meio, sobrenome) VALUES (p_cpf, p_prenome, p_nome_meio, p_sobrenome);
	INSERT INTO labbd.ta  (cpf) VALUES (p_cpf);
END
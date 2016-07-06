DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `insereAluno`(
	p_nome_da_mae                 CHAR(255),
    p_nome_do_pai                 CHAR(255),
    p_pais                        CHAR(255),
    p_uf                          CHAR(255),
    p_data_nascimento             DATE,
    p_ano_ingresso                DATE,
    p_sexo                        CHAR(1),
    p_cor                         CHAR(255),
    p_reenquadramento             INT, #lembrar de iniciar com 0
    p_ra                          INT,
    p_cpf                         CHAR(12),
    p_conclusao_em_nome           CHAR(255),
    p_conclusao_em_ano            DATE,
	p_prenome             		  CHAR(255),
    p_nome_meio           		  CHAR(255),
    p_sobrenome           		  CHAR(255)
)
BEGIN
	INSERT INTO labbd.pessoa (cpf, prenome, nome_meio, sobrenome) VALUES (p_cpf, p_prenome, p_nome_meio, p_sobrenome);
	INSERT INTO labbd.aluno  (nome_da_mae, nome_do_pai, pais, uf, data_nascimento, ano_ingresso, sexo, cor, reenquadramento, ra, cpf, conclusao_em_nome, conclusao_em_ano)
	VALUES (p_nome_da_mae, p_nome_do_pai, p_pais, p_uf, p_data_nascimento, p_ano_ingresso, p_sexo, p_cor, p_reenquadramento, p_ra, p_cpf, p_conclusao_em_nome, p_conclusao_em_ano);
END


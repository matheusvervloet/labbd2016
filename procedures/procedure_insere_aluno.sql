DELIMITER $$
CREATE PROCEDURE procedure_insere_aluno
(IN cpf_param VARCHAR(12), IN prenome_param VARCHAR(255), IN nome_meio_param VARCHAR(255), IN sobrenome_param VARCHAR(255), IN nome_da_mae_param VARCHAR(255), IN nome_do_pai_param VARCHAR(255), IN pais_param VARCHAR(255), IN uf_param VARCHAR(255), IN data_nascimento_param DATE, IN ano_ingresso_param DATE, IN sexo_param VARCHAR(1), IN cor_param VARCHAR(255), IN ra_param INT, IN conclusao_em_nome_param VARCHAR(255), IN conclusao_em_ano_param DATE, IN IRA_param INT)
BEGIN
  INSERT INTO pessoa (cpf, prenome, nome_meio, sobrenome) VALUES (cpf_param, prenome_param, nome_meio_param, sobrenome_param);
  INSERT INTO aluno (nome_da_mae, nome_do_pai, pais, uf, data_nascimento, ano_ingresso, Sexo, cor, reenquadramento, ra, cpf, conclusao_em_nome, conclusao_em_ano, IRA) VALUES (nome_da_mae_param, nome_do_pai_param, pais_param, uf_param, data_nascimento_param, ano_ingresso_param, sexo_param, cor_param, 0, ra_param, cpf_param, conclusao_em_nome_param, conclusao_em_ano_param, IRA_param);
END $$
DELIMITER ;
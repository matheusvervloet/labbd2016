CREATE OR REPLACE VIEW vdadospessoaisaluno AS 
    SELECT aluno.cpf AS cpf,pessoa.prenome AS prenome,pessoa.nome_meio AS nome_meio,pessoa.sobrenome AS sobrenome,aluno.nome_da_mae AS nome_da_mae,aluno.nome_do_pai AS nome_do_pai,aluno.pais AS pais,aluno.uf AS uf,aluno.data_nascimento AS data_nascimento,aluno.ano_ingresso AS ano_ingresso,aluno.sexo AS sexo,aluno.cor AS cor,aluno.reenquadramento AS reenquadramento,aluno.ra AS ra,aluno.conclusao_em_nome AS conclusao_em_nome,aluno.conclusao_em_ano AS conclusao_em_ano,aluno.IRA AS IRA 
    FROM aluno join pessoa on aluno.cpf = pessoa.cpf
    ORDER BY aluno.cpf;

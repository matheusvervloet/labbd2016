CREATE VIEW dados_CA AS
SELECT ca.sigla as sigla_ca, 
		ca.nome as nome_ca, 
        c.sigla as sigla_curso, 
        c.nome as nome_curso, 
        c.max_creditos as max_creditos, 
        c.min_creditos as min_creditos 
FROM centro_academico ca, curso c 
WHERE ca.sigla = c.sigla_ca;
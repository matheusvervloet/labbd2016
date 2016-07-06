DROP FUNCTION IF EXISTS f_calc_ira;
DELIMITER $$
CREATE FUNCTION calculaEnade(sigla_curso CHAR(10), ano YEAR(4)) RETURNS INT
BEGIN
	DECLARE totalAluno	INT;
  DECLARE totalNotas   INT;

  #quantidade de alunos naquele curso
  SELECT COUNT(*) INTO totalAluno
  FROM faz_prova INNER JOIN aluno ON faz_prova.cpf = aluno.cpf
             INNER JOIN cursa ON cursa.cpf = aluno.cpf
  WHERE cursa.sigla = sigla_curso AND enade.ano = ano AND YEAR(faz_prova.data) = ano;

  #notaAluno
  SELECT COALESCE(SUM(faz_prova.nota), 0) INTO totalNotas
  FROM faz_prova INNER JOIN aluno ON faz_prova.cpf = aluno.cpf
             INNER JOIN cursa ON cursa.cpf = aluno.cpf
  WHERE cursa.sigla = sigla_curso AND enade.ano = ano AND YEAR(faz_prova.data) = ano;


	RETURN (totalNotas/totalAlunos);
END$$
DELIMITER ; 
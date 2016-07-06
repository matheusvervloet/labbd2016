

DROP FUNCTION IF EXISTS f_calc_ira;
DROP FUNCTION IF EXISTS calculaEnade;
DROP FUNCTION IF EXISTS f_calendario_data;


DELIMITER $$
CREATE FUNCTION f_calendario_data(data DATE) RETURNS INT
BEGIN
    DECLARE id_calendario  INT DEFAULT 0;
	
    select id into id_calendario from calendario where (data between `data_inicio` AND `data_fim`) AND tipo='presencial' AND situacao='aprovado';

    RETURN id_calendario;
END$$

CREATE FUNCTION labbd.calculaEnade(sigla_curso CHAR(10), ano YEAR(4)) RETURNS INT
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

CREATE FUNCTION labbd.f_calc_ira(ra INT) RETURNS INT
BEGIN
	DECLARE produtoNotaCredito	INT DEFAULT 0;
	DECLARE creditosInscritos 	INT DEFAULT 1;
	DECLARE creditosCancelados	INT DEFAULT 0;

	#produtoNotaCredito 
	SELECT COALESCE(SUM(matricula.nota*disciplina.creditos),0) INTO produtoNotaCredito
		FROM disciplina	INNER JOIN turma ON turma.sigla = disciplina.sigla
						INNER JOIN matricula ON matricula.id_turma = turma.id_turma
						INNER JOIN aluno ON aluno.cpf = matricula.cpf 
		WHERE aluno.ra = ra;

	#creditosInscritos
	SELECT COALESCE(SUM(disciplina.creditos),1) INTO creditosInscritos
		FROM disciplina	INNER JOIN turma ON turma.sigla = disciplina.sigla
						INNER JOIN matricula ON matricula.id_turma = turma.id_turma
						INNER JOIN aluno ON aluno.cpf = matricula.cpf 
		WHERE aluno.ra = ra;
	
	#creditosCancelados
	SELECT COALESCE(SUM(disciplina.creditos),0) INTO creditosCancelados
		FROM disciplina	INNER JOIN turma ON turma.sigla = disciplina.sigla
						INNER JOIN matricula ON matricula.id_turma = turma.id_turma
						INNER JOIN aluno ON aluno.cpf = matricula.cpf 
		WHERE aluno.ra = ra AND matricula.status = 'cancelado';

	#IRA	
	RETURN 1000*(produtoNotaCredito/creditosInscritos)*(2-(creditosCancelados/creditosInscritos));
END$$

DELIMITER ; 

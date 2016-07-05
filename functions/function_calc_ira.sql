DROP FUNCTION IF EXISTS f_calc_ira;
DELIMITER $$
CREATE FUNCTION f_calc_ira(ra INT) RETURNS INT
BEGIN
	DECLARE produtoNotaCredito	INT DEFAULT 0;
	DECLARE creditosInscritos 	INT DEFAULT 1;
	DECLARE creditosCancelados	INT DEFAULT 1;

	#productSum 
	SELECT  SUM(matricula.nota*disciplina.creditos) INTO produtoNotaCredito
		FROM disciplina	INNER JOIN turma ON turma.sigla = disciplina.sigla
						INNER JOIN matricula ON matricula.id_turma = turma.id_turma
						INNER JOIN aluno ON aluno.cpf = matricula.cpf 
		WHERE aluno.ra = ra;

	#creditosInscritos
	SELECT SUM(disciplina.creditos) INTO creditosInscritos
		FROM disciplina	INNER JOIN turma ON turma.sigla = disciplina.sigla
						INNER JOIN matricula ON matricula.id_turma = turma.id_turma
						INNER JOIN aluno ON aluno.cpf = matricula.cpf 
		WHERE aluno.ra = ra;
	
	#creditosCancelados
	SELECT SUM(disciplina.creditos) INTO creditosCancelados
		FROM disciplina	INNER JOIN turma ON turma.sigla = disciplina.sigla
						INNER JOIN matricula ON matricula.id_turma = turma.id_turma
						INNER JOIN aluno ON aluno.cpf = matricula.cpf 
		WHERE aluno.ra = ra AND matricula.status = 'cancelado';

	#IRA	
	RETURN 1000*(produtoNotaCredito/creditosInscritos)*(2-(creditosCancelados/creditosInscritos));
END$$
DELIMITER ; 
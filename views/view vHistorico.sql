CREATE VIEW vhistorico AS
	SELECT turma.letra AS 'Turma', disciplina.nome, disciplina.creditos, matricula.nota, matricula.deferimento AS 'Resultado'
	FROM disciplina INNER JOIN turma ON turma.sigla = disciplina.sigla
					INNER JOIN matricula ON matricula.id_turma = turma.id_turma
					INNER JOIN aluno ON aluno.cpf = matricula.cpf
	WHERE aluno.cpf = '919136532-44';

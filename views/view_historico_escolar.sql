CREATE OR REPLACE VIEW vhistorico AS
	SELECT  calendario.ano, calendario.semestre, turma.letra AS 'Turma', disciplina.nome, disciplina.creditos, 
			matricula.nota, matricula.frequencia, matricula.status AS 'Resultado'
	FROM disciplina INNER JOIN turma ON turma.sigla = disciplina.sigla
					INNER JOIN calendario ON calendario.id = turma.id_calendario
					INNER JOIN matricula ON matricula.id_turma = turma.id_turma
					INNER JOIN aluno ON aluno.cpf = matricula.cpf
	WHERE aluno.cpf = '919136532-44'
	ORDER BY calendario.ano, calendario.semestre, disciplina.nome;
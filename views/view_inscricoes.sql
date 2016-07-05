CREATE OR REPLACE VIEW vinscricoes AS
	SELECT  aluno.ra, calendario.ano, calendario.semestre, turma.letra AS 'Turma', 
			disciplina.nome, disciplina.creditos, inscreve.fase, inscreve.deferimento
	FROM disciplina INNER JOIN turma ON turma.sigla = disciplina.sigla
					INNER JOIN calendario ON calendario.id = turma.id_calendario
					INNER JOIN inscreve ON inscreve.id_turma = turma.id_turma
					INNER JOIN aluno ON aluno.cpf = inscreve.cpf
	ORDER BY calendario.ano, calendario.semestre, inscreve.fase, disciplina.nome;
CREATE OR REPLACE VIEW labbd.calendario_adm_atividade_administrativas AS
    SELECT 
        labbd.calendario.semestre AS semestre,
        labbd.calendario.ano AS ano,
        labbd.calendario.data_inicio AS inicio_calendario,
        labbd.calendario.data_fim AS fim_calendario,
        labbd.atividade_administrativa.nome AS nome,
        labbd.atividade_administrativa.data_inicio AS atv_inicio,
        labbd.atividade_administrativa.data_fim AS atv_fim,
		labbd.atividade_administrativa.responsavel AS responsavel
    FROM
        ((labbd.calendario 
       JOIN (labbd.atividade_administrativa
        JOIN labbd.possui_atividade_administrativa ON ((labbd.atividade_administrativa.id_ativ_adm = labbd.possui_atividade_administrativa.id_ativ_adm)))
        JOIN  labbd.administrativo ON ((labbd.administrativo.id = labbd.calendario.id)) 
        ))
	WHERE
		((labbd.calendario.situacao = 'aprovado') AND
		 (labbd.calendario.tipo = 'administrativo'))
	ORDER BY  atv_inicio;

CREATE OR REPLACE VIEW labbd.vcalendario_ead AS
    SELECT 
        labbd.calendario.semestre AS semestre,
        labbd.calendario.ano AS ano,
        labbd.calendario.data_inicio AS inicio_calendario,
        labbd.calendario.data_fim AS fim_calendario,
        labbd.recesso.nome AS nome,
        labbd.recesso.campus AS campus,
        labbd.recesso.data_inicio AS recesso_inicio,
        labbd.recesso.data_fim AS recesso_fim,
        labbd.recesso.tipo AS tipo
    FROM
        ((labbd.calendario
        JOIN (labbd.ead
        JOIN labbd.possui_recesso_ead ON ((labbd.ead.id = labbd.possui_recesso_ead.id_ead))) ON ((labbd.calendario.id = labbd.ead.id)))
        JOIN labbd.recesso ON ((labbd.recesso.id_recesso = labbd.possui_recesso_ead.id_recesso)))
    UNION SELECT 
        labbd.calendario.semestre AS semestre,
        labbd.calendario.ano AS ano,
        labbd.calendario.data_inicio AS inicio_calendario,
        labbd.calendario.data_fim AS fim_calendario,
        labbd.atividade_administrativa.nome AS nome,
        NULL AS 'NULL',
        labbd.atividade_administrativa.data_inicio AS atv_inicio,
        labbd.atividade_administrativa.data_fim AS atv_fim,
        NULL AS 'NULL'
    FROM
        ((labbd.ead
        JOIN (labbd.calendario
        JOIN labbd.possui_atividade_administrativa adm ON ((labbd.calendario.id = adm.id))) ON ((labbd.ead.id = labbd.calendario.id)))
        JOIN labbd.atividade_administrativa ON ((labbd.atividade_administrativa.id_ativ_adm = adm.id_ativ_adm)))
	WHERE
        ((labbd.calendario.situacao = 'aprovado')
            AND (labbd.calendario.tipo = 'ead'));

CREATE OR REPLACE VIEW labbd.calendario_presencial AS
    SELECT 
        labbd.calendario.semestre AS semestre,
        labbd.calendario.ano AS ano,
        labbd.calendario.data_inicio AS inicio_calendario,
        labbd.calendario.data_fim AS fim_calendario,
        labbd.recesso.nome AS nome,
        labbd.recesso.campus AS campus,
        labbd.recesso.data_inicio AS recesso_inicio,
        labbd.recesso.data_fim AS recesso_fim,
        labbd.recesso.tipo AS tipo
    FROM
        ((labbd.calendario
        JOIN (labbd.presencial
        JOIN labbd.possui_recesso_presencial ON ((labbd.presencial.id = labbd.possui_recesso_presencial.id_presencial))) ON ((labbd.calendario.id = labbd.presencial.id)))
        JOIN labbd.recesso ON ((labbd.recesso.id_recesso = labbd.possui_recesso_presencial.id_recesso)))
    UNION SELECT 
        labbd.calendario.semestre AS semestre,
        labbd.calendario.ano AS ano,
        labbd.calendario.data_inicio AS inicio_calendario,
        labbd.calendario.data_fim AS fim_calendario,
        labbd.atividade_administrativa.nome AS nome,
        NULL AS 'NULL',
        labbd.atividade_administrativa.data_inicio AS atv_inicio,
        labbd.atividade_administrativa.data_fim AS atv_fim,
        NULL AS 'NULL'
    FROM
        ((labbd.presencial
        JOIN (labbd.calendario
        JOIN labbd.possui_atividade_administrativa adm ON ((labbd.calendario.id = adm.id))) ON ((labbd.presencial.id = labbd.calendario.id)))
        JOIN labbd.atividade_administrativa ON ((labbd.atividade_administrativa.id_ativ_adm = adm.id_ativ_adm)))
	WHERE
        ((labbd.calendario.situacao = 'aprovado')
            AND (labbd.calendario.tipo = 'presencial'));

CREATE OR REPLACE VIEW labbd.calendario_presencial_data_proposta AS
    SELECT 
        calendario.semestre AS semestre,
        calendario.ano AS ano,
        calendario.data_inicio AS inicio_calendario,
        calendario.data_fim AS fim_calendario,
		calendario.versao AS versao,
        proposto_por_RC.data_proposta AS data_proposta
    FROM
        ((calendario
        JOIN (presencial
        JOIN proposto_por_RC ON ((presencial.id = proposto_por_RC.id_calendario))) ON ((calendario.id = presencial.id))))
    WHERE
        ((calendario.situacao = 'aprovado')
            AND (calendario.tipo = 'presencial'))
	ORDER BY versao;

CREATE OR REPLACE VIEW labbd.vdadospessoaisaluno AS 
    SELECT aluno.cpf AS cpf,pessoa.prenome AS prenome,pessoa.nome_meio AS nome_meio,pessoa.sobrenome AS sobrenome,aluno.nome_da_mae AS nome_da_mae,aluno.nome_do_pai AS nome_do_pai,aluno.pais AS pais,aluno.uf AS uf,aluno.data_nascimento AS data_nascimento,aluno.ano_ingresso AS ano_ingresso,aluno.sexo AS sexo,aluno.cor AS cor,aluno.reenquadramento AS reenquadramento,aluno.ra AS ra,aluno.conclusao_em_nome AS conclusao_em_nome,aluno.conclusao_em_ano AS conclusao_em_ano,aluno.IRA AS IRA 
    FROM aluno join pessoa on aluno.cpf = pessoa.cpf
    ORDER BY aluno.cpf;

CREATE OR REPLACE VIEW labbd.calendario_geral AS
    SELECT 
		labbd.calendario.id AS ID,
		labbd.calendario.semestre AS semestre,
        labbd.calendario.ano AS ano,
        labbd.calendario.data_inicio AS inicio_calendario,
        labbd.calendario.data_fim AS fim_calendario,
		labbd.calendario.versao AS versao,
        labbd.calendario.tipo AS tipo,
		labbd.calendario.situacao AS situacao,
		labbd.atividade_administrativa.nome AS nome,
        labbd.atividade_administrativa.data_inicio AS atv_inicio,
        labbd.atividade_administrativa.data_fim AS atv_fim,
		labbd.atividade_administrativa.responsavel AS responsavel
		
	FROM
        ((labbd.calendario 
       JOIN (labbd.atividade_administrativa
        JOIN labbd.possui_atividade_administrativa ON ((labbd.atividade_administrativa.id_ativ_adm = labbd.possui_atividade_administrativa.id_ativ_adm))) 
        ))
    WHERE
        (labbd.calendario.versao >= 0)
	ORDER BY situacao, ano ASC;

CREATE OR REPLACE VIEW labbd.dados_CA AS
SELECT ca.sigla as sigla_ca, 
		ca.nome as nome_ca, 
        c.sigla as sigla_curso, 
        c.nome as nome_curso, 
        c.max_creditos as max_creditos, 
        c.min_creditos as min_creditos 
FROM centro_academico ca, curso c 
WHERE ca.sigla = c.sigla_ca;

CREATE OR REPLACE VIEW labbd.vhistorico AS
	SELECT  aluno.ra, calendario.ano, calendario.semestre, turma.letra AS 'Turma', disciplina.nome, 
			disciplina.creditos, matricula.nota, matricula.frequencia, matricula.status AS 'Resultado'
	FROM disciplina INNER JOIN turma ON turma.sigla = disciplina.sigla
					INNER JOIN calendario ON calendario.id = turma.id_calendario
					INNER JOIN matricula ON matricula.id_turma = turma.id_turma
					INNER JOIN aluno ON aluno.cpf = matricula.cpf
	ORDER BY calendario.ano, calendario.semestre, disciplina.nome;

CREATE OR REPLACE VIEW labbd.vinscricoes AS
	SELECT  aluno.ra, calendario.ano, calendario.semestre, turma.letra AS 'Turma', 
			disciplina.nome, disciplina.creditos, inscreve.fase, inscreve.deferimento
	FROM disciplina INNER JOIN turma ON turma.sigla = disciplina.sigla
					INNER JOIN calendario ON calendario.id = turma.id_calendario
					INNER JOIN inscreve ON inscreve.id_turma = turma.id_turma
					INNER JOIN aluno ON aluno.cpf = inscreve.cpf
	ORDER BY calendario.ano, calendario.semestre, inscreve.fase, disciplina.nome;

CREATE OR REPLACE VIEW labbd.vinscricoesCalendario AS
    SELECT  aluno.ra, turma.id_calendario, calendario.ano, calendario.semestre, turma.letra AS 'Turma', 
            disciplina.nome, disciplina.creditos, inscreve.fase, inscreve.deferimento
    FROM disciplina INNER JOIN turma ON turma.sigla = disciplina.sigla
                    INNER JOIN calendario ON calendario.id = turma.id_calendario
                    INNER JOIN inscreve ON inscreve.id_turma = turma.id_turma
                    INNER JOIN aluno ON aluno.cpf = inscreve.cpf
    ORDER BY calendario.ano, calendario.semestre, inscreve.fase, disciplina.nome;

CREATE OR REPLACE VIEW labbd.view_materias_do_depto AS
    SELECT 
        labbd.disciplina.sigla AS siglaDisciplina,
        labbd.disciplina.nome AS nomeDisciplina,
        labbd.departamento.nome AS nomeDepartamento
    FROM
        (labbd.disciplina
        JOIN labbd.departamento)
    WHERE
        (labbd.disciplina.sigla_depto = labbd.departamento.sigla)
    ORDER BY labbd.departamento.nome , labbd.disciplina.nome WITH CASCADED CHECK OPTION;

CREATE OR REPLACE VIEW labbd.matricula_aluno AS
    SELECT 
        labbd.matricula.cpf AS cpf,
        labbd.turma.id_turma AS id_turma,
        labbd.disciplina.sigla AS sigla,
        labbd.disciplina.nome AS disciplina,
        labbd.turma.letra AS letra
    FROM
        ((labbd.matricula
        JOIN labbd.disciplina)
        JOIN labbd.turma)
    WHERE
        ((labbd.turma.id_turma = labbd.matricula.id_turma)
            AND (labbd.turma.sigla = labbd.disciplina.sigla));

CREATE OR REPLACE VIEW labbd.turmas_disciplina AS
    SELECT 
        labbd.turma.id_turma AS turmaCodigo,
        labbd.disciplina.nome AS Disciplina,
        labbd.turma.vagas AS Vagas,
        labbd.pessoa.prenome AS DocenteNome,
        labbd.pessoa.sobrenome AS DocenteSobrenome,
        labbd.turma.id_calendario AS Calendario
    FROM
        (((labbd.turma
        JOIN labbd.disciplina)
        JOIN labbd.docente)
        JOIN labbd.pessoa)
    WHERE
        ((labbd.turma.sigla = labbd.disciplina.sigla)
            AND (labbd.turma.cpf_docente = labbd.docente.cpf)
            AND (labbd.docente.cpf = labbd.pessoa.cpf));

CREATE OR REPLACE VIEW labbd.view_reconhecimento AS
    SELECT *
    FROM reconhecimento
    ORDER BY data_inicio;


################################VIEW COMENTADA POIS CONTEM ERROS#######################################
/*
CREATE OR REPLACE VIEW labbd.resultado_enade_curso AS
    SELECT 
        labbd.curso.nome AS Curso,
        labbd.curso.sigla AS Sigla,
        labbd.enade.ano AS Ano,
        labbd.enade.periodo AS Periodo,
        calculaEnade(sigla, ano) AS Resultado
    FROM
        (labbd.enade
        JOIN labbd.curso)
    WHERE
       (labbd.enade.sigla_curso = labbd.disciplina.sigla);*/
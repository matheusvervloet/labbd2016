create database if not exists labbd;
USE labbd;

#~~~~DROPS
#====================FUNCTIONS========================

#BRUNO B


#BRUNO W


#CRISTIANO


#DANILO
DROP FUNCTION IF EXISTS f_calc_ira;


#FABIO


#HUGO


#MATHEUS


#RAFAEL KENJI


#RAPHAEL ADAMSKI


#THIAGO



#====================PROCEDURES========================

#BRUNO B


#BRUNO W


#CRISTIANO


#DANILO
DROP PROCEDURE IF EXISTS procedure_consulta_historico;
DROP PROCEDURE IF EXISTS procedure_consulta_inscricoes;
DROP PROCEDURE IF EXISTS procedure_calcula_ira;


#FABIO


#HUGO


#MATHEUS


#RAFAEL KENJI
DROP PROCEDURE IF EXISTS procedure_insere_aluno;

#RAPHAEL ADAMSKI
DROP PROCEDURE IF EXISTS procedure_fazDeferimento;
DROP PROCEDURE IF EXISTS procedure_insereInscreve;

#THIAGO



#====================TRIGGERS========================

#BRUNO B


#BRUNO W


#CRISTIANO


#DANILO
DROP TRIGGER IF EXISTS trigger_matricula_deferido;


#FABIO


#HUGO


#MATHEUS


#RAFAEL KENJI
DROP TRIGGER IF EXISTS trigger_aluno_reenquadramento;

#RAPHAEL ADAMSKI
drop trigger IF EXISTS inscreve_deferimento;
drop trigger IF EXISTS insere_calendario;


#THIAGO



#====================VIEWS========================

#BRUNO B


#BRUNO W


#CRISTIANO


#DANILO


#FABIO


#HUGO


#MATHEUS


#RAFAEL KENJI


#RAPHAEL ADAMSKI


#THIAGO


drop table IF EXISTS comunicacoes;
drop table IF EXISTS intervencoes;
drop table IF EXISTS gestao;
drop table IF EXISTS inscreve;
drop table IF EXISTS matricula;
drop table IF EXISTS pre_requisitos;
drop table IF EXISTS correquisitos;
drop table IF EXISTS proposto_por_RC;
drop table IF EXISTS faz_credenciamento;
drop table IF EXISTS preve_disciplina;
drop table IF EXISTS avalia_formulario;
drop table IF EXISTS enade;
drop table IF EXISTS aula;
drop table IF EXISTS ppp;
drop table IF EXISTS turma;
drop table IF EXISTS decisoes_aprovadas;
drop table IF EXISTS comite;
drop table IF EXISTS visita;
drop table IF EXISTS item_do_formulario;
drop table IF EXISTS cursa;
drop table IF EXISTS possui_atividade_administrativa;
drop table IF EXISTS atividade_administrativa;
drop table IF EXISTS possui_recesso_presencial;
drop table IF EXISTS possui_recesso_ead;
drop table IF EXISTS recesso;
drop table IF EXISTS administrativo;
drop table IF EXISTS presencial;
drop table IF EXISTS ead;
drop table IF EXISTS calendario;
drop table IF EXISTS reconhecimento;
drop table IF EXISTS disciplina;
drop table IF EXISTS departamento;
drop table IF EXISTS curso;
drop table IF EXISTS documentos;
drop table IF EXISTS itens_de_pauta;
drop table IF EXISTS reuniao;
drop table IF EXISTS membro;
drop table IF EXISTS faz_prova;
drop table IF EXISTS centro_academico;
drop table IF EXISTS docente;
drop table IF EXISTS ta;
drop table IF EXISTS aluno;
drop table IF EXISTS pessoa;

#~~~~CREATES
#1
CREATE TABLE labbd.pessoa (
    cpf                 CHAR(12),
    prenome             CHAR(255),
    nome_meio           CHAR(255),
    sobrenome           CHAR(255),
    CONSTRAINT pessoa_pk PRIMARY KEY(cpf)
);


#2
CREATE TABLE labbd.aluno (
    nome_da_mae                 CHAR(255),
    nome_do_pai                 CHAR(255),
    pais                        CHAR(255),
    uf                          CHAR(255),
    data_nascimento             DATE,
    ano_ingresso                DATE,
    sexo                        CHAR(1),
    cor                         CHAR(255),
    reenquadramento             INT, #lembrar de iniciar com 0
    ra                          INT unique,
    cpf                         CHAR(12),
    conclusao_em_nome           CHAR(255),
    conclusao_em_ano            DATE,
    IRA							int,
    CONSTRAINT aluno_cpf_fk FOREIGN KEY (cpf) references pessoa (cpf),
    CONSTRAINT aluno_pk PRIMARY KEY (cpf)
);


#3
CREATE TABLE labbd.ta (
    cpf CHAR(12),
    CONSTRAINT ta_cpf_fk FOREIGN KEY (cpf) references pessoa (cpf),
    CONSTRAINT ta_pk PRIMARY KEY (cpf)
);


#4
CREATE TABLE labbd.docente (
    cpf CHAR(12),
    CONSTRAINT docente_cpf_fk FOREIGN KEY (cpf) references pessoa (cpf),
    CONSTRAINT docente_pk PRIMARY KEY (cpf)
);


#5
CREATE TABLE labbd.centro_academico (
    sigla               CHAR(10),
    nome                CHAR(255),
    CONSTRAINT centro_academico_pk PRIMARY KEY(sigla)
);


#6
CREATE TABLE labbd.faz_prova (
    nota                INT,
    data                DATE,
    cpf                 CHAR(12),
    ##CONSTRAINT faz_prova_enade_fk FOREIGN KEY(nota) REFERENCES enade(nota),
    CONSTRAINT faz_prova_aluno_fk FOREIGN KEY(cpf) REFERENCES aluno(cpf),
    CONSTRAINT faz_prova_pk PRIMARY KEY(cpf, data)
);


#7
CREATE TABLE labbd.membro (
    data_inicio         DATE,
    data_fim            DATE,
    representacao       CHAR(255),
    portaria_indicacao  CHAR(255),
    cpf                 CHAR(12),
    CONSTRAINT membro_fk FOREIGN KEY (cpf) references pessoa(cpf),
    CONSTRAINT membro_pk PRIMARY KEY (cpf)
);


#8
CREATE TABLE labbd.reuniao (
    numero              INT,
    cpf                 CHAR(12),
    data                DATE,
    grupo_organizador   CHAR(255),
    documento           CHAR(255),
    CONSTRAINT reunia_cpf_membro_fk FOREIGN KEY (cpf) references membro(cpf),
    CONSTRAINT reuniao_pk PRIMARY KEY(numero)
);


#9
CREATE TABLE labbd.itens_de_pauta (
    id                  INT not null auto_increment,
    pauta               VARCHAR(255),
    data_aprovacao      DATE,
    texto_descritivo    LONGTEXT,
    numero_reuniao		INT,
    CONSTRAINT itens_pauta_reuniao_fk FOREIGN KEY (numero_reuniao) references reuniao(numero),
    constraint	unique_itens_pauta unique(pauta,data_aprovacao,id),
    CONSTRAINT itens_de_pauta_pk PRIMARY KEY(id)
);


#10
CREATE TABLE labbd.documentos(
    id_item_pauta       INT,
    documento           VARCHAR(255),
    CONSTRAINT documentos_itens_de_pauta_fk FOREIGN KEY (id_item_pauta) references itens_de_pauta (id),
    CONSTRAINT documentos_pk PRIMARY KEY (id_item_pauta,documento)
);


#11
CREATE TABLE labbd.curso (
    sigla               CHAR(10),
    sigla_ca			CHAR(10),
    nome                CHAR(255),
    max_creditos        INT,
    min_creditos        INT,

    CONSTRAINT curso_pk PRIMARY KEY(sigla),
    CONSTRAINT curso_ca_fk FOREIGN KEY (sigla_ca) references centro_academico (sigla)
);


#12
CREATE TABLE labbd.departamento (
    sigla               CHAR(10),
    nome                CHAR(255),
    CONSTRAINT departamento_pk PRIMARY KEY(sigla)
);


#13
CREATE TABLE labbd.disciplina (
    sigla               CHAR(10),
    nome                CHAR(255),
    ementa              LONGTEXT,
    creditos            INT,
    sigla_depto         CHAR(10),
    
    CONSTRAINT disciplina_sigla_fk FOREIGN KEY (sigla_depto) references departamento (sigla),
    CONSTRAINT disciplina_pk PRIMARY KEY(sigla)
);


#14
CREATE TABLE labbd.reconhecimento (
    num_capes           INT,
    data_inicio         DATE,    
    sigla_curso        CHAR(10),
    
    CONSTRAINT reconhecimento_curso_fk FOREIGN KEY (sigla_curso) references curso (sigla),
    CONSTRAINT reconhecimento_pk PRIMARY KEY(num_capes,sigla_curso)
);


#15
CREATE TABLE labbd.calendario (
	id					INT NOT NULL AUTO_INCREMENT,
    data_inicio         DATE,
    data_fim            DATE,
    dias_letivos        INT,
    semestre            INT,
    ano                 YEAR(4),
    versao				INT,
    tipo				CHAR(255), constraint calendario_check_tipo check(tipo in ('ead','presencial','administrativo')),
    situacao			CHAR(10),
    
    constraint calendario_unique UNIQUE (ano, semestre, versao,tipo),
    CONSTRAINT calendario_pk PRIMARY KEY(id)
);


#16
CREATE TABLE labbd.presencial (
    id		INT,
    
    CONSTRAINT presencial_id_fk FOREIGN KEY (id) references calendario (id),
    CONSTRAINT presencial_id_pk PRIMARY KEY (id)
);


#17
CREATE TABLE labbd.ead (
    id		INT,
    
    CONSTRAINT ead_id_fk FOREIGN KEY (id) references calendario (id),
    CONSTRAINT ead_id_fk PRIMARY KEY (id)
);


#18
CREATE TABLE labbd.administrativo (
    id		INT,
    CONSTRAINT adm_id_pk FOREIGN KEY (id) references calendario (id),
    CONSTRAINT adm_id_fk PRIMARY KEY (id)
);


#19
CREATE TABLE recesso(
    id_recesso INT NOT NULL AUTO_INCREMENT,
    data_inicio DATE,
    data_fim DATE,
    campus CHAR(255),
    nome CHAR(255),
    tipo CHAR(9),
    constraint pk_recesso PRIMARY KEY (id_recesso),
    constraint unique_recesso UNIQUE (data_inicio, data_fim, campus, nome)
);


#20
CREATE TABLE possui_recesso_ead(
    id_recesso 			INT,
    id_ead		INT,
    constraint fk_recesso_possui_recesso_ead FOREIGN KEY (id_recesso) REFERENCES recesso(id_recesso),
    constraint fk_ead_possui_recesso_ead FOREIGN KEY (id_ead) REFERENCES ead(id),
    constraint pk_possui_recesso_ead PRIMARY KEY (id_recesso, id_ead)
);


#21
CREATE TABLE possui_recesso_presencial(
    id_recesso 			INT,
    id_presencial		INT,
    constraint fk_recesso_possui_recesso_presencial FOREIGN KEY (id_recesso) REFERENCES recesso(id_recesso),
    constraint fk_ead_possui_recesso_presencial FOREIGN KEY (id_presencial) REFERENCES presencial(id),
    constraint pk_possui_recesso_presencial PRIMARY KEY (id_recesso, id_presencial)
);


#22
CREATE TABLE atividade_administrativa(
    id_ativ_adm 		INT NOT NULL AUTO_INCREMENT,
    nome 				CHAR(255),
    responsavel 		CHAR(255),
    data_inicio 		DATE,
    data_fim 			DATE,
    constraint unique_atividade_administrativa UNIQUE (nome, data_inicio, data_fim),
    constraint pk_atividade_administrativa PRIMARY KEY (id_ativ_adm)
);


#23
CREATE TABLE possui_atividade_administrativa(
    id_ativ_adm INT,
    id		INT,
    constraint fk_ativ_adm_possui_atividade_administrativa FOREIGN KEY (id_ativ_adm) REFERENCES atividade_administrativa(id_ativ_adm),
    constraint fk_calendario_possui_atividade_administrativa FOREIGN KEY (id) REFERENCES calendario (id),
    constraint pk_possui_atividade_administrativa PRIMARY KEY (id_ativ_adm, id)
);


#24
CREATE TABLE labbd.cursa(
    sigla            CHAR(10),
    cpf              CHAR(12),
    data_inicio      DATE,
    data_fim         DATE,
    CONSTRAINT cursa_aluno_fk FOREIGN KEY(cpf) REFERENCES aluno(cpf),
    CONSTRAINT cursa_curso_fk FOREIGN KEY(sigla) REFERENCES curso(sigla),
    CONSTRAINT cursa_pk PRIMARY KEY(cpf, sigla)
);


#25
CREATE TABLE labbd.item_do_formulario (
    id_itens_do_formulario  INT NOT NULL AUTO_INCREMENT,
    num_capes               INT,
    num_item 				INT,
    descricao               char(255),
    fase                    INT,
    dados                   LONGTEXT,
    resultado               LONGTEXT,
    CONSTRAINT item_do_formulario_num_capes_fk FOREIGN KEY (num_capes) references reconhecimento(num_capes),
    constraint unique_item_form UNIQUE (num_item), #Retirei fase de UNIQUE pois podemos ter mais de um item na mesma fase
    CONSTRAINT item_do_formulario_pk PRIMARY KEY(id_itens_do_formulario, num_capes)
);


#26
CREATE TABLE labbd.visita (
    id_visita           INT NOT NULL AUTO_INCREMENT,
    data                DATE UNIQUE,
    num_capes           INT,
    CONSTRAINT visita_num_capes_fk FOREIGN KEY (num_capes) references reconhecimento(num_capes),
    CONSTRAINT visita_pk PRIMARY KEY (id_visita)
);


#27
CREATE TABLE labbd.comite (
    id_visita           INT,
    prenome             CHAR(255),
    nome_do_meio        CHAR(255),
    sobrenome           CHAR(255),
    CONSTRAINT comite_id_visita_fk FOREIGN KEY (id_visita) references visita(id_visita),
    CONSTRAINT comite_pk PRIMARY KEY (id_visita)
);


#28
CREATE TABLE labbd.decisoes_aprovadas(
    
    id_itens_de_pauta       INT,
    decisoes_aprovadas      LONGTEXT,
    CONSTRAINT decisoes_aprovadas_id_itens_de_pauta_fk FOREIGN KEY (id_itens_de_pauta) references itens_de_pauta (id),
    CONSTRAINT decisoes_aprovadas_pk PRIMARY KEY (id_itens_de_pauta)
);


#29
CREATE TABLE labbd.turma (
    id_turma			INT auto_increment,
    letra               CHAR(1),
    vagas               INT,
    ##turma da disciplina:
    sigla               CHAR(10), ##não sei se tem mesmo, acho q é um codigo, **tem q criar uma nova tabela gera?

    cpf_docente        CHAR(12), ##docente leciona turmas. turma tem 1 docente, 

    #é ofertada em um calendario
    id_calendario		INT,#calendario

    CONSTRAINT turma_calendario_fk FOREIGN KEY (id_calendario) REFERENCES calendario (id),
    CONSTRAINT turma_docente_fk FOREIGN KEY (cpf_docente) REFERENCES docente (cpf),
    CONSTRAINT turma_sigla_fk FOREIGN KEY (sigla) references disciplina (sigla),
    constraint unique_turma UNIQUE (id_calendario, letra,sigla),
    CONSTRAINT turma_pk PRIMARY KEY(id_turma) 
);


#30
CREATE TABLE labbd.ppp (
    id					INT auto_increment,	
    texto               LONGTEXT,
    sigla_curso         CHAR(10),
    numero_reuniao      INT(11),
    sigla_disciplina    CHAR(10),

    ano					YEAR(4),
    semestre			INT,

    constraint unique_ppp UNIQUE (ano, semestre, sigla_curso, sigla_disciplina),
    CONSTRAINT ppp_sigla_curso_fk FOREIGN KEY (sigla_curso) REFERENCES curso (sigla),
    CONSTRAINT ppp_numero_reuniao_fk FOREIGN KEY (numero_reuniao) REFERENCES reuniao (numero),
    CONSTRAINT ppp_sigla_disciplina_fk FOREIGN KEY (sigla_disciplina) REFERENCES disciplina (sigla),
    CONSTRAINT ppp_pk PRIMARY KEY(id)
);


#31
CREATE TABLE labbd.aula (
	id_turma			INT auto_increment,
    predio              CHAR(255),
    sala                varchar(10),
    dia                 varchar(10), constraint aula_dia check (dia in ('segunda','terca','quarta','quinta','sexta','sabado')),
    hora                char(2), constraint aula_hora check (hora in ('08','10','14','16','19','21')),
     
    CONSTRAINT aula_turma_fk FOREIGN KEY(id_turma) REFERENCES turma(id_turma),
    CONSTRAINT aula_pk PRIMARY KEY(id_turma, predio, sala, dia, hora)
);


#32
CREATE TABLE labbd.enade (
    ano                 YEAR(4),
    periodo             CHAR(10),  
    sigla_curso         CHAR(10),
    
    CONSTRAINT enade_curso_fk FOREIGN KEY (sigla_curso) references curso(sigla),
    CONSTRAINT enade_pk PRIMARY KEY(ano, periodo, sigla_curso)
);


#33
CREATE TABLE labbd.avalia_formulario (
    id_item                  INT,
    id_visita             INT,
    num_capes_formulario  INT,
    CONSTRAINT avalia_item_do_formulario_fk FOREIGN KEY(id_item,num_capes_formulario) references item_do_formulario (id_itens_do_formulario, num_capes),
    CONSTRAINT avalia_visita_fk FOREIGN KEY (id_visita) references visita (id_visita),
    CONSTRAINT avalia_formulario_pk PRIMARY KEY(id_item, num_capes_formulario, id_visita) 
);


#34
CREATE TABLE labbd.preve_disciplina (
    perfil CHAR(1),
    optativa TINYINT(1),
    sigla_disciplina CHAR(10),
    id_ppp			INT,
    
    CONSTRAINT preve_disciplina_fk FOREIGN KEY(sigla_disciplina) references disciplina (sigla),
    CONSTRAINT preve_ppp_fk FOREIGN KEY(id_ppp) references ppp (id),
    CONSTRAINT preve_disciplina_pk PRIMARY KEY(id_ppp, sigla_disciplina)
);


#35
CREATE TABLE labbd.faz_credenciamento (
    data 				DATE,
    ano                 YEAR(4),
    periodo             CHAR(10),
    cpf                 CHAR(12),
    CONSTRAINT enade_kf FOREIGN KEY(ano, periodo) references enade(ano, periodo),
    CONSTRAINT aluno_fk FOREIGN KEY(cpf) references aluno(cpf),
    CONSTRAINT faz_credenciamento_pk PRIMARY KEY(ano, periodo, cpf, data)
);


#36
CREATE TABLE labbd.proposto_por_RC (
    data_proposta       DATE,
    aprovacao           CHAR(255),  
    numero              INT,
    id_calendario		INT,

    CONSTRAINT proposto_por_RC_reuniao_fk FOREIGN KEY ( numero) REFERENCES reuniao (numero),
    CONSTRAINT proposto_por_RC_calendario_fk FOREIGN KEY (id_calendario) REFERENCES calendario (id),
    CONSTRAINT proposto_por_RC_pk PRIMARY KEY (numero, id_calendario)
);


#37
CREATE TABLE labbd.correquisitos (
    disciplina          CHAR(10),
    correquisito        CHAR(10),
    CONSTRAINT correquisitos_disciplina_fk FOREIGN KEY (disciplina) REFERENCES disciplina (sigla),
    CONSTRAINT correquisitos_correquisito_fk FOREIGN KEY (correquisito) REFERENCES disciplina (sigla),
    CONSTRAINT correquisitos_fk PRIMARY KEY (disciplina, correquisito)
);


#38
CREATE TABLE labbd.pre_requisitos (
    disciplina          CHAR(10),
    pre_requisito       CHAR(10),
    CONSTRAINT pre_requisitos_disciplina_fk FOREIGN KEY (disciplina) REFERENCES disciplina (sigla),
    CONSTRAINT pre_requisitos_requisito_fk FOREIGN KEY (pre_requisito) REFERENCES disciplina (sigla),
    CONSTRAINT pre_requisitos_fk PRIMARY KEY (disciplina, pre_requisito)
);


#39
CREATE TABLE labbd.matricula (
    cpf                 CHAR(12),
    id_turma			INT,
    nota                INT,
    status              CHAR(40), 
        CONSTRAINT matricula_check_status CHECK(status IN 
        ('reconhecido', 'cancelado', 'aprovado', 'reprovado por nota', 'reprovado por frequencia', 'reprovado por nota e frequencia')),
    frequencia          INT,
    CONSTRAINT matricula_aluno_fk FOREIGN KEY(cpf) REFERENCES aluno(cpf),
    CONSTRAINT matricula_turma_fk FOREIGN KEY(id_turma) REFERENCES turma(id_turma),
    CONSTRAINT matricula_pk PRIMARY KEY(cpf, id_turma)
);


#40
CREATE TABLE labbd.gestao (
    cpf                   CHAR(12),
    gestao_data_inicio    DATE,
    gestao_data_fim       DATE,
    CONSTRAINT gestao_cpf_fk FOREIGN KEY (cpf) references membro (cpf),
    CONSTRAINT gestao_pk PRIMARY KEY (cpf, gestao_data_inicio, gestao_data_fim)
);


#41
CREATE TABLE labbd.intervencoes (
    data_hora             DATE,
    descricao             LONGTEXT,
    id_itens_de_pauta     INT,
    cpf                   CHAR(12),
    CONSTRAINT intervencao_itens_de_pauta_fk FOREIGN KEY (id_itens_de_pauta) references itens_de_pauta (id),
    CONSTRAINT intervencao_cpf_fk FOREIGN KEY (cpf) references membro (cpf),
    CONSTRAINT intervencao_pk PRIMARY KEY (id_itens_de_pauta, cpf, data_hora)
);


#42
CREATE TABLE labbd.comunicacoes (
    data_hora    DATE,
    descricao    LONGTEXT,
    id_itens_de_pauta     INT,
    cpf                   CHAR(12),
    CONSTRAINT comunicacao_itens_de_pauta_fk FOREIGN KEY (id_itens_de_pauta) references itens_de_pauta (id),
    CONSTRAINT comunicacao_cpf_fk FOREIGN KEY (cpf) references membro (cpf),
    CONSTRAINT comunicacao_pk PRIMARY KEY (id_itens_de_pauta, cpf, data_hora)
);

#43
CREATE TABLE labbd.inscreve (
    cpf                 CHAR(12),
    id_turma            INT,
    razao               CHAR(255),
    deferimento         CHAR(10), constraint inscreve_check_deferimento check(deferimento in ('em espera','deferido','indeferido')),
    fase                INT,
    CONSTRAINT inscreve_aluno_fk FOREIGN KEY(cpf) REFERENCES aluno(cpf),
    CONSTRAINT inscreve_turma_fk FOREIGN KEY(id_turma) REFERENCES turma(id_turma),
    CONSTRAINT inscreve_pk PRIMARY KEY(cpf, id_turma, fase)
);



#====================FUNCTIONS========================

#BRUNO B


#BRUNO W


#CRISTIANO


#DANILO
DELIMITER $$
CREATE FUNCTION f_calc_ira(ra INT) RETURNS INT
BEGIN
    DECLARE produtoNotaCredito  INT DEFAULT 0;
    DECLARE creditosInscritos   INT DEFAULT 1;
    DECLARE creditosCancelados  INT DEFAULT 0;

    #produtoNotaCredito 
    SELECT COALESCE(SUM(matricula.nota*disciplina.creditos),0) INTO produtoNotaCredito
        FROM disciplina INNER JOIN turma ON turma.sigla = disciplina.sigla
                        INNER JOIN matricula ON matricula.id_turma = turma.id_turma
                        INNER JOIN aluno ON aluno.cpf = matricula.cpf 
        WHERE aluno.ra = ra;

    #creditosInscritos
    SELECT COALESCE(SUM(disciplina.creditos),1) INTO creditosInscritos
        FROM disciplina INNER JOIN turma ON turma.sigla = disciplina.sigla
                        INNER JOIN matricula ON matricula.id_turma = turma.id_turma
                        INNER JOIN aluno ON aluno.cpf = matricula.cpf 
        WHERE aluno.ra = ra;
    
    #creditosCancelados
    SELECT COALESCE(SUM(disciplina.creditos),0) INTO creditosCancelados
        FROM disciplina INNER JOIN turma ON turma.sigla = disciplina.sigla
                        INNER JOIN matricula ON matricula.id_turma = turma.id_turma
                        INNER JOIN aluno ON aluno.cpf = matricula.cpf 
        WHERE aluno.ra = ra AND matricula.status = 'cancelado';

    #IRA    
    RETURN 1000*(produtoNotaCredito/creditosInscritos)*(2-(creditosCancelados/creditosInscritos));
END$$
DELIMITER ;  


#FABIO


#HUGO


#MATHEUS


#RAFAEL KENJI


#RAPHAEL ADAMSKI


#THIAGO



#====================PROCEDURES========================

#BRUNO B


#BRUNO W


#CRISTIANO


#DANILO
DELIMITER $$
CREATE PROCEDURE procedure_consulta_historico
(IN ra_param INT)
BEGIN
  SELECT * FROM vhistorico
  WHERE ra = ra_param;
END $$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE procedure_consulta_inscricoes
(IN ra_param INT)
BEGIN
  SELECT * FROM vinscricoes
  WHERE ra = ra_param;
END $$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE procedure_calcula_ira()
BEGIN
    DECLARE done    BOOLEAN DEFAULT FALSE;
    DECLARE ra      INT     DEFAULT 0;
    DECLARE ira     INT     DEFAULT 0;

    DECLARE cur CURSOR FOR SELECT aluno.ra FROM aluno;
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done := TRUE;

    OPEN cur;

    alunosLoop: LOOP
        FETCH cur INTO ra;
        IF done THEN
            LEAVE alunosLoop;
        END IF;
        SELECT f_calc_ira(ra) INTO ira;
        UPDATE aluno SET aluno.ira = ira WHERE aluno.ra = ra;
    END LOOP alunosLoop;
END $$
DELIMITER ;


#FABIO


#HUGO


#MATHEUS


#RAFAEL KENJI
DELIMITER $$
CREATE PROCEDURE procedure_insere_aluno
(IN cpf_param VARCHAR(12), IN prenome_param VARCHAR(255), IN nome_meio_param VARCHAR(255), IN sobrenome_param VARCHAR(255), IN nome_da_mae_param VARCHAR(255), IN nome_do_pai_param VARCHAR(255), IN pais_param VARCHAR(255), IN uf_param VARCHAR(255), IN data_nascimento_param DATE, IN ano_ingresso_param DATE, IN sexo_param VARCHAR(1), IN cor_param VARCHAR(255), IN ra_param INT, IN conclusao_em_nome_param VARCHAR(255), IN conclusao_em_ano_param DATE, IN IRA_param INT)
BEGIN
  INSERT INTO pessoa (cpf, prenome, nome_meio, sobrenome) VALUES (cpf_param, prenome_param, nome_meio_param, sobrenome_param);
  INSERT INTO aluno (nome_da_mae, nome_do_pai, pais, uf, data_nascimento, ano_ingresso, Sexo, cor, reenquadramento, ra, cpf, conclusao_em_nome, conclusao_em_ano, IRA) VALUES (nome_da_mae_param, nome_do_pai_param, pais_param, uf_param, data_nascimento_param, ano_ingresso_param, sexo_param, cor_param, 0, ra_param, cpf_param, conclusao_em_nome_param, conclusao_em_ano_param, IRA_param);
END $$
DELIMITER ;

#RAPHAEL ADAMSKI
DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `procedure_fazDeferimento`(nfase INT, calendario INT)
BEGIN
	DECLARE siglaDisc char(10);
    DECLARE auxid_turma int;
    DECLARE auxvagas int;
    DECLARE auxcpf char(12);
    DECLARE menorIRAcpf char(12);
    DECLARE IRAaluno int;
    DECLARE menorIRA int;
	DECLARE  contador int default 0;
    DECLARE finished INTEGER DEFAULT 0;
    #cursor tera todas as turmas do calendario
    DECLARE turmas_cursor CURSOR FOR 
		SELECT turma.id_turma FROM turma WHERE turma.id_calendario = calendario;
	DECLARE alunos_cursor CURSOR FOR
		select inscreve.cpf from inscreve where inscreve.id_turma = auxid_turma;
	DECLARE CONTINUE HANDLER 
		FOR NOT FOUND SET finished= 1;
	
    open turmas_cursor;
    #loop para avaliar cada turma
    turmas_loop: LOOP
		fetch turmas_cursor INTO auxid_turma;
        IF finished = 1 THEN 
			LEAVE turmas_loop;
		end if;
        
        #conta total de inscricoes naquela turma deferidas
		select count(*) into contador from inscreve where inscreve.id_turma=auxid_turma AND inscreve.deferimento ='deferido';
            
		#atribui total de vagas
        select turma.vagas into auxvagas from turma where turma.id_turma=auxid_turma;
        
        #se ainda tem vagas remanescentes da fase anterior
        if auxvagas>contador then
			
			open alunos_cursor;
			#loop para avaliar cada aluno em cada turma
			alunos_loop: LOOP
				fetch alunos_cursor INTO auxcpf;
				
				IF finished = 1 THEN 
					LEAVE alunos_loop;
				end if;
				
				#conta total de inscricoes naquela turma deferidas
				select count(*) into contador from inscreve where inscreve.id_turma=auxid_turma AND inscreve.deferimento ='deferido';
				#se ainda tem vagas 
				if (auxvagas-contador)>0 then
					#coloca como deferido
					update inscreve SET deferimento = 'deferido' ,razao = 'deferido por vaga'
						WHERE inscreve.cpf = auxcpf 
							AND inscreve.id_turma=auxid_turma 
							AND inscreve.fase=nfase 
							AND inscreve.deferimento = 'em espera';
				#ja que nao tem vagas, teremo que tirar o com menor IRA e colocar este aluno
				else
					#ira do aluno sendo deferido
					select aluno.IRA into IRAaluno from aluno where aluno.cpf= auxcpf;
					#menor ira da turma, dos que estao se inscrevendo nessa fase
					select min(aluno.ira),aluno.cpf into menorIRA,menorIRAcpf from aluno 
							where EXISTS ( select * from inscreve 
											where inscreve.cpf=aluno.cpf 
											AND inscreve.id_turma =auxid_turma
											AND inscreve.fase=nfase #só importa na fase que ta, nao pode indeferir da fase anterior que ja foi deferido
											AND deferimento='deferido');
					#se ira do aluno sendo avaliado for maior que menor ira da turma entao ele entra e o outro sai da turma
					if (IRAaluno>menorIRA) then
						#coloca indeferido no que tem menor IRA
						update inscreve SET deferimento = 'indeferido',razao='indeferido por ira' 
						WHERE inscreve.cpf = menorIRAcpf 
							AND inscreve.id_turma=auxid_turma 
							AND inscreve.fase=nfase 
							AND inscreve.deferimento = 'deferido';
						#coloca deferido no que esta sendo avaliado
						update inscreve SET deferimento = 'deferido', razao = 'dereferido por ira' 
						WHERE inscreve.cpf = auxcpf 
							AND inscreve.id_turma=auxid_turma 
							AND inscreve.fase=nfase 
							AND inscreve.deferimento = 'em espera';
					#nao tem vagas nem ira, entao eh indeferido
					else
						update inscreve SET deferimento = 'indeferido',razao='Indeferido por vaga e ira' 
						WHERE inscreve.cpf = auxcpf 
							AND inscreve.id_turma=auxid_turma 
							AND inscreve.fase=nfase 
							AND inscreve.deferimento = 'em espera';
							
					end if;
				end if;
				
			END LOOP alunos_loop;
			close alunos_cursor;
			SET finished = 0;
		
        #nao tem vagas remasnecesntes, todo mundo indeferido
		else
			open alunos_cursor;
			alunos_loop: LOOP
				fetch alunos_cursor INTO auxcpf;
				
				IF finished = 1 THEN 
					LEAVE alunos_loop;
				end if;
				update inscreve SET deferimento = 'indeferido',razao='Indeferido por vaga, cheio na fase anterior' 
						WHERE inscreve.cpf = auxcpf 
							AND inscreve.id_turma=auxid_turma 
							AND inscreve.fase=nfase 
							AND inscreve.deferimento = 'em espera';
			END LOOP alunos_loop;
			close alunos_cursor;
			SET finished = 0;
        end if;
	END LOOP turmas_loop;
    
    close turmas_cursor;
   
END
 $$
DELIMITER ;
DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `procedure_insereInscreve`(ncpf char(12), nid_turma INT, nfase INT)
BEGIN
	DECLARE siglaDisc char(10);
	DECLARE id_calendarioTurma int;
    DECLARE auxid_turma int;
	DECLARE  contador int default 0;
    DECLARE finished INTEGER DEFAULT 0;
    
    #cursor tera todas as turmas de uma disciplina
    DECLARE turmas_cursor CURSOR FOR 
		SELECT turma.id_turma FROM turma WHERE turma.sigla=siglaDisc AND turma.id_calendario = id_calendarioTurma;
	DECLARE CONTINUE HANDLER 
		FOR NOT FOUND SET finished = 1;
	
    #descobre sigla da disciplina da turma passada por parametro
    select turma.sigla,turma.id_calendario into siglaDisc,id_calendarioTurma
		from turma
		where turma.id_turma = nid_turma;
	
    open turmas_cursor;
    
    #loop para verificar se ja esta em alguma turma da disciplina
    verifica_loop: LOOP
		fetch turmas_cursor INTO auxid_turma;
        
        IF finished = 1 THEN 
			LEAVE verifica_loop;
		end if;
        #verifica se ja foi deferido na fase anterior
        if nfase>1 then
			select count(*) into contador from inscreve where inscreve.cpf =ncpf 
													AND inscreve.id_turma = auxid_turma 
                                                    AND inscreve.deferimento='deferido';
                                                    
			if contador!= 0 then
				#deleta outros deferimentos em outras fases
				delete from inscreve where inscreve.cpf =ncpf 
													AND inscreve.id_turma = auxid_turma 
                                                    AND inscreve.deferimento = 'deferido';
				#agora nao tem mais nenhuma tupla deferida nem em espera
				SET contador = 0;
				LEAVE verifica_loop;
			end if;
		end if;
        
        select count(*) into contador from inscreve where inscreve.cpf =ncpf 
													AND inscreve.id_turma = auxid_turma 
                                                    AND inscreve.fase = nfase;
        
        if contador!= 0 then
			LEAVE verifica_loop;
		end if;
        
	END LOOP verifica_loop;
    
    close turmas_cursor;
    
    if contador= 0 then
		INSERT INTO labbd.inscreve (cpf, id_turma, fase, deferimento)
			VALUE  (ncpf, nid_turma, nfase, 'em espera');
	end if;

END
 $$
DELIMITER ;
#THIAGO



#====================TRIGGERS========================

#BRUNO B


#BRUNO W


#CRISTIANO


#DANILO
DELIMITER $$
CREATE TRIGGER trigger_matricula_deferido
    AFTER UPDATE ON inscreve
    FOR EACH ROW
BEGIN
    IF NEW.deferimento = 'deferido' THEN
        INSERT INTO matricula (cpf, id_turma) 
                VALUES (OLD.cpf, OLD.id_turma);
    END IF;
END$$
DELIMITER ;


#FABIO


#HUGO


#MATHEUS


#RAFAEL KENJI
DELIMITER $$
CREATE TRIGGER trigger_aluno_reenquadramento
    AFTER UPDATE ON aluno
    FOR EACH ROW
BEGIN
    IF NEW.reenquadramento <> 0 THEN
        UPDATE aluno SET perfil_atual = NEW.reenquadramento WHERE cpf = OLD.cpf;
    END IF;
END$$
DELIMITER ;

#RAPHAEL ADAMSKI
delimiter $$
create DEFINER = `root`@`localhost` trigger insere_calendario
after insert
on labbd.calendario
for each row
begin
 case new.tipo
    when 'ead' then insert into ead(id) value (new.id);
    when 'presencial' then insert into presencial(id) value(new.id);
    when 'administrativo' then insert into administrativo(id) value(new.id);
    end case;
end$$

delimiter $$
create DEFINER = `root`@`localhost` trigger inscreve_deferimento
before insert
on labbd.inscreve
for each row
begin
    if new.deferimento <=> null then
         SET new.deferimento = 'em espera';
    end if;
end$$


#THIAGO



#====================VIEWS========================

#BRUNO B


#BRUNO W


#CRISTIANO


#DANILO
delimiter $$
CREATE OR REPLACE VIEW vhistorico AS
    SELECT  aluno.ra, calendario.ano, calendario.semestre, turma.letra AS 'Turma', disciplina.nome, 
            disciplina.creditos, matricula.nota, matricula.frequencia, matricula.status AS 'Resultado'
    FROM disciplina INNER JOIN turma ON turma.sigla = disciplina.sigla
                    INNER JOIN calendario ON calendario.id = turma.id_calendario
                    INNER JOIN matricula ON matricula.id_turma = turma.id_turma
                    INNER JOIN aluno ON aluno.cpf = matricula.cpf
    ORDER BY calendario.ano, calendario.semestre, disciplina.nome;
$$
CREATE OR REPLACE VIEW vinscricoes AS
    SELECT  aluno.ra, calendario.ano, calendario.semestre, turma.letra AS 'Turma', 
            disciplina.nome, disciplina.creditos, inscreve.fase, inscreve.deferimento
    FROM disciplina INNER JOIN turma ON turma.sigla = disciplina.sigla
                    INNER JOIN calendario ON calendario.id = turma.id_calendario
                    INNER JOIN inscreve ON inscreve.id_turma = turma.id_turma
                    INNER JOIN aluno ON aluno.cpf = inscreve.cpf
    ORDER BY calendario.ano, calendario.semestre, inscreve.fase, disciplina.nome;
$$

#FABIO


#HUGO


#MATHEUS


#RAFAEL KENJI
CREATE OR REPLACE VIEW vdadospessoaisaluno AS 
    SELECT aluno.cpf AS cpf,pessoa.prenome AS prenome,pessoa.nome_meio AS nome_meio,pessoa.sobrenome AS sobrenome,aluno.nome_da_mae AS nome_da_mae,aluno.nome_do_pai AS nome_do_pai,aluno.pais AS pais,aluno.uf AS uf,aluno.data_nascimento AS data_nascimento,aluno.ano_ingresso AS ano_ingresso,aluno.sexo AS sexo,aluno.cor AS cor,aluno.reenquadramento AS reenquadramento,aluno.ra AS ra,aluno.conclusao_em_nome AS conclusao_em_nome,aluno.conclusao_em_ano AS conclusao_em_ano,aluno.IRA AS IRA 
    FROM aluno join pessoa on aluno.cpf = pessoa.cpf
    ORDER BY aluno.cpf;
$$
#RAPHAEL ADAMSKI
CREATE OR REPLACE
    ALGORITHM = UNDEFINED 
    DEFINER = `root`@`localhost` 
    SQL SECURITY DEFINER
VIEW `labbd`.`vcalendario_ead` AS
    SELECT 
        `labbd`.`calendario`.`semestre` AS `semestre`,
        `labbd`.`calendario`.`ano` AS `ano`,
        `labbd`.`calendario`.`data_inicio` AS `inicio_calendario`,
        `labbd`.`calendario`.`data_fim` AS `fim_calendario`,
        `labbd`.`recesso`.`nome` AS `nome`,
        `labbd`.`recesso`.`campus` AS `campus`,
        `labbd`.`recesso`.`data_inicio` AS `recesso_inicio`,
        `labbd`.`recesso`.`data_fim` AS `recesso_fim`,
        `labbd`.`recesso`.`tipo` AS `tipo`
    FROM
        ((`labbd`.`calendario`
        JOIN (`labbd`.`ead`
        JOIN `labbd`.`possui_recesso_ead` ON ((`labbd`.`ead`.`id` = `labbd`.`possui_recesso_ead`.`id_ead`))) ON ((`labbd`.`calendario`.`id` = `labbd`.`ead`.`id`)))
        JOIN `labbd`.`recesso` ON ((`labbd`.`recesso`.`id_recesso` = `labbd`.`possui_recesso_ead`.`id_recesso`)))
    UNION SELECT 
        `labbd`.`calendario`.`semestre` AS `semestre`,
        `labbd`.`calendario`.`ano` AS `ano`,
        `labbd`.`calendario`.`data_inicio` AS `inicio_calendario`,
        `labbd`.`calendario`.`data_fim` AS `fim_calendario`,
        `labbd`.`atividade_administrativa`.`nome` AS `nome`,
        NULL AS `NULL`,
        `labbd`.`atividade_administrativa`.`data_inicio` AS `atv_inicio`,
        `labbd`.`atividade_administrativa`.`data_fim` AS `atv_fim`,
        NULL AS `NULL`
    FROM
        ((`labbd`.`ead`
        JOIN (`labbd`.`calendario`
        JOIN `labbd`.`possui_atividade_administrativa` `adm` ON ((`labbd`.`calendario`.`id` = `adm`.`id`))) ON ((`labbd`.`ead`.`id` = `labbd`.`calendario`.`id`)))
        JOIN `labbd`.`atividade_administrativa` ON ((`labbd`.`atividade_administrativa`.`id_ativ_adm` = `adm`.`id_ativ_adm`)))
	WHERE
        ((`labbd`.`calendario`.`situacao` = 'aprovado')
            AND (`labbd`.`calendario`.`tipo` = 'ead')) 
$$
CREATE OR REPLACE VIEW vinscricoesCalendario AS
    SELECT  aluno.ra, turma.id_calendario, calendario.ano, calendario.semestre, turma.letra AS 'Turma', 
            disciplina.nome, disciplina.creditos, inscreve.fase, inscreve.deferimento
    FROM disciplina INNER JOIN turma ON turma.sigla = disciplina.sigla
                    INNER JOIN calendario ON calendario.id = turma.id_calendario
                    INNER JOIN inscreve ON inscreve.id_turma = turma.id_turma
                    INNER JOIN aluno ON aluno.cpf = inscreve.cpf
    ORDER BY calendario.ano, calendario.semestre, inscreve.fase, disciplina.nome;
$$

#THIAGO


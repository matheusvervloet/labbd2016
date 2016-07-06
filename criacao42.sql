create database if not exists labbd;
USE labbd;

drop trigger IF EXISTS inscreve_deferimento;
drop trigger IF EXISTS insere_calendario;

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

#Creates1
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
    resultado           CHAR(4),
    
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

USE labbd;

INSERT INTO labbd.pessoa (cpf, prenome, nome_meio, sobrenome) 
VALUES ('919191919-44', 'Danilo', 'Otavio', 'Barros');

INSERT INTO labbd.pessoa (cpf, prenome, nome_meio, sobrenome) 
VALUES ('919136532-44', 'Alice', 'Luisa', 'Ramos');

INSERT INTO labbd.pessoa (cpf, prenome, nome_meio, sobrenome) 
VALUES ('505019159-44', 'Victor', 'Matheus', 'Vasconcelos');

INSERT INTO labbd.pessoa (cpf, prenome, nome_meio, sobrenome) 
VALUES ('231546389-98', 'Augusto', 'Cesar', 'Deus');

INSERT INTO labbd.pessoa (cpf, prenome, nome_meio, sobrenome) 
VALUES ('546322148-91', 'Jorge', 'Carvalho', 'Dias');

INSERT INTO labbd.pessoa (cpf, prenome, nome_meio, sobrenome) 
VALUES ('252468793-11', 'Linda', 'Almeida', 'Aparecida');

INSERT INTO labbd.pessoa (cpf, prenome, nome_meio, sobrenome) 
VALUES ('777795472-95', 'Loco', 'George', 'Santos');

INSERT INTO labbd.pessoa (cpf, prenome, nome_meio, sobrenome) 
VALUES ('121541619-21', 'Amanda', 'Maite', 'Pereira');

INSERT INTO labbd.pessoa (cpf, prenome, nome_meio, sobrenome) 
VALUES ('830225565-26', 'Raphael', 'Takamassa', 'Nomuro');

INSERT INTO labbd.pessoa (cpf, prenome, nome_meio, sobrenome) 
VALUES ('254847477-17', 'Priscila', 'Aleixo', 'Muller');

INSERT INTO labbd.pessoa (cpf, prenome, nome_meio, sobrenome) 
VALUES ('209243943-08', 'Jessica', 'Luisa', 'Barbosa');

INSERT INTO labbd.pessoa (cpf, prenome, nome_meio, sobrenome) 
VALUES ('275677595-94', 'Clara', 'Alves', 'Lima');


INSERT INTO labbd.pessoa (cpf, prenome, nome_meio, sobrenome) 
VALUES ('684499362-79', 'Ricardo', 'Matheus', 'Almeida');

INSERT INTO labbd.aluno  (nome_da_mae, nome_do_pai, pais, uf, data_nascimento, ano_ingresso, sexo, cor, reenquadramento, ra, cpf, conclusao_em_nome, conclusao_em_ano)
VALUES ('Luciana A Moura', 'Leonardo A Barros', 'Brasil', 'SP',
                         STR_TO_DATE('1-01-1990', '%d-%m-%Y') , STR_TO_DATE('1-01-2012', '%d-%m-%Y'),
                         'M', 'Branco', 0, 12345, '919191919-44', 'Escola Estadual Legal', STR_TO_DATE('1-01-2011', '%d-%m-%Y'));

INSERT INTO labbd.aluno (nome_da_mae, nome_do_pai, pais, uf, data_nascimento, ano_ingresso, sexo, cor, reenquadramento, ra, cpf, conclusao_em_nome, conclusao_em_ano)
VALUES ('Alvara A Petralina', 'Jorge A Ramos', 'Brasil', 'RJ',
                         STR_TO_DATE('17-07-1990', '%d-%m-%Y') , STR_TO_DATE('1-01-2012', '%d-%m-%Y'),
                         'F', 'Branco', 0, 2245, '919136532-44', 'Escola Estadual Chata', STR_TO_DATE('22-02-2011', '%d-%m-%Y'));
                         
INSERT INTO labbd.aluno (nome_da_mae, nome_do_pai, pais, uf, data_nascimento, ano_ingresso, sexo, cor, reenquadramento, ra, cpf, conclusao_em_nome, conclusao_em_ano)
VALUES ('Daniela Pereira', 'Marcos G Vasconcelos', 'Brasil', 'SP',
                         STR_TO_DATE('1-01-1990', '%d-%m-%Y') , STR_TO_DATE('1-01-2010', '%d-%m-%Y'),
                         'M', 'Pardo', 0, 1299, '505019159-44', 'Escola Federal Super', STR_TO_DATE('5-01-2011', '%d-%m-%Y'));


INSERT INTO labbd.aluno (nome_da_mae, nome_do_pai, pais, uf, data_nascimento, ano_ingresso, sexo, cor, reenquadramento, ra, cpf, conclusao_em_nome, conclusao_em_ano)
VALUES ('Daniela Lima', 'Vinicius Lima', 'Brasil', 'SP',
                         STR_TO_DATE('1-01-1990', '%d-%m-%Y') , STR_TO_DATE('1-01-2010', '%d-%m-%Y'),
                         'M', 'Pardo', 0, 1300, '275677595-94', 'Escola Federal Super', STR_TO_DATE('5-01-2011', '%d-%m-%Y'));


INSERT INTO labbd.aluno (nome_da_mae, nome_do_pai, pais, uf, data_nascimento, ano_ingresso, sexo, cor, reenquadramento, ra, cpf, conclusao_em_nome, conclusao_em_ano)
VALUES ('Bruna Barbosa', 'Igor Barbosa', 'Brasil', 'SP',
                         STR_TO_DATE('1-01-1990', '%d-%m-%Y') , STR_TO_DATE('1-01-2010', '%d-%m-%Y'),
                         'M', 'Pardo', 0, 1301, '209243943-08', 'Escola Federal Super', STR_TO_DATE('5-01-2011', '%d-%m-%Y'));

INSERT INTO labbd.ta (cpf)
VALUES ('684499362-79');

INSERT INTO labbd.ta (cpf)
VALUES ('231546389-98');

INSERT INTO labbd.ta (cpf)
VALUES ('546322148-91');

INSERT INTO labbd.ta (cpf)
VALUES ('254847477-17');

INSERT INTO labbd.ta (cpf)
VALUES ('252468793-11');

INSERT INTO labbd.docente (cpf)
VALUES ('777795472-95');

INSERT INTO labbd.docente (cpf)
VALUES ('121541619-21');

INSERT INTO labbd.docente (cpf)
VALUES ('830225565-26');

INSERT INTO labbd.docente (cpf)
VALUES ('254847477-17');

INSERT INTO labbd.docente (cpf)
VALUES ('209243943-08');

INSERT INTO labbd.centro_academico (sigla, nome)
VALUES ('CAEnf', 'Centro Acadêmico da Enfermagem');

INSERT INTO labbd.centro_academico (sigla, nome)
VALUES ('CALING', 'Centro Acadêmico dos Estudantes de Linguística da UFSCar');

INSERT INTO labbd.centro_academico (sigla, nome)
VALUES ('CAJAR', 'Centro Acadêmico José Albertino Rodrigues');

INSERT INTO labbd.centro_academico (sigla, nome)
VALUES ('CAEP', 'Centro Acadêmico da Engenharia de Produção');

INSERT INTO labbd.centro_academico (sigla, nome)
VALUES ('CAAMP', 'Centro Academico Ana Maria Primavesi – Agroecologia');

INSERT INTO labbd.faz_prova(data,cpf,nota)
VALUES (STR_TO_DATE('02-11-2015', '%d-%m-%Y') ,'919191919-44',7);
INSERT INTO labbd.faz_prova(data,cpf,nota)
VALUES (STR_TO_DATE('05-11-2015', '%d-%m-%Y'),'919136532-44' ,4);
INSERT INTO labbd.faz_prova(data,cpf,nota)
VALUES (STR_TO_DATE('01-11-2015', '%d-%m-%Y') ,'505019159-44',5);
INSERT INTO labbd.faz_prova(data,cpf,nota)
VALUES (STR_TO_DATE('03-11-2015', '%d-%m-%Y') ,'275677595-94',5);
INSERT INTO labbd.faz_prova(data,cpf,nota)
VALUES (STR_TO_DATE('06-11-2015', '%d-%m-%Y') ,'209243943-08',5);


INSERT INTO labbd.membro (data_inicio, data_fim, representacao, portaria_indicacao, cpf)
VALUES (STR_TO_DATE('07-03-2015', '%d-%m-%Y'), STR_TO_DATE('07-03-2016', '%d-%m-%Y'), 
    'corpo discente', '1757/16', '919191919-44');

INSERT INTO labbd.membro (data_inicio, data_fim, representacao, portaria_indicacao, cpf)
VALUES (STR_TO_DATE('07-03-2015', '%d-%m-%Y'), STR_TO_DATE('07-03-2016', '%d-%m-%Y'), 
    'corpo docente', '1757/16', '505019159-44');

#Depois de membro
INSERT INTO labbd.reuniao (numero, cpf, data, grupo_organizador, documento)
VALUES(1,'505019159-44',STR_TO_DATE('30-04-2016', '%d-%m-%Y'),'CoG', '~/src/1/paralizacao/29-04-2016/foo.txt');
INSERT INTO labbd.reuniao (numero, cpf, data, grupo_organizador, documento)
VALUES(2,'505019159-44',STR_TO_DATE('29-04-2016', '%d-%m-%Y'),'CoG', '~/src/1/paralizacao/29-04-2016/bar.txt');
INSERT INTO labbd.reuniao (numero, cpf, data, grupo_organizador, documento)
VALUES(3,'919191919-44',STR_TO_DATE('28-04-2016', '%d-%m-%Y'),'CoG', '~/src/1/paralizacao/29-04-2016/foobar.txt');
INSERT INTO labbd.reuniao (numero, cpf, data, grupo_organizador, documento)
VALUES(4,'919191919-44',STR_TO_DATE('27-04-2016', '%d-%m-%Y'),'CoG', '~/src/1/paralizacao/29-04-2016/foo.pdf');
INSERT INTO labbd.reuniao (numero, cpf, data, grupo_organizador, documento)
VALUES(5,'505019159-44',STR_TO_DATE('26-04-2016', '%d-%m-%Y'),'CoG', '~/src/1/paralizacao/29-04-2016/bar.pdf');
  
INSERT INTO labbd.itens_de_pauta (pauta,data_aprovacao,numero_reuniao,texto_descritivo)
VALUES('paralizacao',STR_TO_DATE('29-04-2016', '%d-%m-%Y'),1,'Discutir o fechamento dos ATs'),
      ('paralizacao',STR_TO_DATE('29-04-2016', '%d-%m-%Y'),1,'Discutir efeitos da Greve'),
      ('paralizacao',STR_TO_DATE('29-04-2016', '%d-%m-%Y'),1,'Discutir FORA TEMER, VEM AECIO'),
      ('reprovacao',STR_TO_DATE('29-03-2016', '%d-%m-%Y'),1,'Piquete em frente ao dm'),
      ('reprovacao',STR_TO_DATE('29-03-2016', '%d-%m-%Y'),1,'carta ao DM pedindo pra ter SUB');

#Depois de itens de pauta
INSERT INTO labbd.decisoes_aprovadas (id_itens_de_pauta, decisoes_aprovadas)
VALUES (1, 'Apoio ao fechamento dos ATs.');
INSERT INTO labbd.decisoes_aprovadas (id_itens_de_pauta, decisoes_aprovadas)
VALUES (2, 'Apoio a paralizacao estudantil.');
INSERT INTO labbd.decisoes_aprovadas (id_itens_de_pauta, decisoes_aprovadas)
VALUES (3, 'Apoio a candidatura do Tiririca para presidente.');
INSERT INTO labbd.decisoes_aprovadas (id_itens_de_pauta, decisoes_aprovadas)
VALUES (4, 'Repudio ao piquete em um departamento tao notavel e justo com os alunos como o DM');
INSERT INTO labbd.decisoes_aprovadas (id_itens_de_pauta, decisoes_aprovadas)
VALUES (5, 'Repudio a sub no DM, visto que todas suas materias e professores ja sao extremamente faceis de se obter aprovacao');
      
INSERT INTO labbd.documentos (id_item_pauta,documento)
VALUES
    (1,'~/src/1/paralizacao/29-04-2016/jornal.txt'),
    (1,'~/src/1/paralizacao/29-04-2016/revista.txt'),
    (1,'~/src/1/paralizacao/29-04-2016/imagem.jpg'),
    (1,'~/src/1/paralizacao/29-04-2016/carta.txt'),
    (1,'~/src/1/paralizacao/29-04-2016/seila.out')
    ;


INSERT INTO labbd.curso (sigla, nome, max_creditos, min_creditos) 
VALUES ('ENC', 'Engenharia de Computacao', 38, 4);
INSERT INTO labbd.curso (sigla, nome, max_creditos, min_creditos) 
VALUES ('EP', 'Engenharia de Producao', 38,4);
INSERT INTO labbd.curso (sigla, nome, max_creditos, min_creditos) 
VALUES ('EQ', 'Engenharia Quimica', 38,4);
INSERT INTO labbd.curso (sigla, nome, max_creditos, min_creditos) 
VALUES ('BCC', 'Bacharelado Ciencia da Computacao', 38,4);
INSERT INTO labbd.curso (sigla, nome, max_creditos, min_creditos) 
VALUES ('Bio', 'Biologia', 38,4);
INSERT INTO labbd.curso (sigla, nome, max_creditos, min_creditos) 
VALUES ('Mat', 'Matematica', 38,4);

INSERT INTO labbd.departamento (sigla, nome)
VALUES ('DC', 'Departamento de Computacao');
INSERT INTO labbd.departamento (sigla, nome)
VALUES ('DQ', 'Departamento de Quimica');
INSERT INTO labbd.departamento (sigla, nome)
VALUES ('DF', 'Departamento de Fisica');
INSERT INTO labbd.departamento (sigla, nome)
VALUES ('DP', 'Departamento de Producao');
INSERT INTO labbd.departamento (sigla, nome)
VALUES ('DM', 'Departamento de Matematica');

INSERT INTO labbd.disciplina (sigla, nome, ementa, creditos,sigla_depto)
VALUES ('LBD', 'Laboratorio de Bancos de Dados', 'link1', 2, 'DC');
INSERT INTO labbd.disciplina (sigla, nome, ementa, creditos,sigla_depto)
VALUES ('FT6', 'Fenomenos de Transporte6', 'link2', 4, 'DF');
INSERT INTO labbd.disciplina (sigla, nome, ementa, creditos,sigla_depto)
VALUES ('TO', 'Teoria das Organizacoes', 'link3', 4, 'DP');
INSERT INTO labbd.disciplina (sigla, nome, ementa, creditos,sigla_depto)
VALUES ('CAP', 'Construcao de Algoritmos de Programacao', 'link4', 8,'DC');
INSERT INTO labbd.disciplina (sigla, nome, ementa, creditos,sigla_depto)
VALUES ('SO', 'Sistemas Operacionais', 'link5', 4,'DC');
INSERT INTO labbd.disciplina (sigla, nome, ementa, creditos,sigla_depto)
VALUES ('BD', 'Banco de Dados', 'link6', 4,'DC');
INSERT INTO labbd.disciplina (sigla, nome, ementa, creditos,sigla_depto)
VALUES ('ARQ1', 'Arquitetura e Organização de Computadores 1', 'link7', 4,'DC');
INSERT INTO labbd.disciplina (sigla, nome, ementa, creditos,sigla_depto)
VALUES ('LARQ1', 'Laboratorio de Arquitetura e Organização de Computadores 1', 'link8', 2,'DC');
INSERT INTO labbd.disciplina (sigla, nome, ementa, creditos,sigla_depto)
VALUES ('ARQ2', 'Arquitetura e Organização de Computadores 2', 'link9', 4,'DC');
INSERT INTO labbd.disciplina (sigla, nome, ementa, creditos,sigla_depto)
VALUES ('LARQ2', 'Laboratorio de Arquitetura e Organização de Computadores 2', 'link10', 2,'DC');
INSERT INTO labbd.disciplina (sigla, nome, ementa, creditos,sigla_depto)
VALUES ('CD', 'Circuitos Digitais', 'link11', 4,'DC');
INSERT INTO labbd.disciplina (sigla, nome, ementa, creditos,sigla_depto)
VALUES ('LCD', 'Laboratorio de Circuitos Digitais', 'link12', 2,'DC');
INSERT INTO labbd.disciplina (sigla, nome, ementa, creditos,sigla_depto)
VALUES ('Calc1', 'Calculo 1', 'link13', 4,'DM');
INSERT INTO labbd.disciplina (sigla, nome, ementa, creditos,sigla_depto)
VALUES ('Calc2', 'Calculo 2', 'link14', 4,'DM');
INSERT INTO labbd.disciplina (sigla, nome, ementa, creditos,sigla_depto)
VALUES ('Calc3', 'Calculo 3', 'link15', 4,'DM');
INSERT INTO labbd.disciplina (sigla, nome, ementa, creditos,sigla_depto)
VALUES ('GA', 'Geometria Analitica', 'link16', 4,'DM');
INSERT INTO labbd.disciplina (sigla, nome, ementa, creditos,sigla_depto)
VALUES ('AlgLin', 'Algebra Linear', 'link17', 4,'DM');




INSERT INTO labbd.reconhecimento (num_capes,sigla_curso,data_inicio)
VALUES ('1001', 'BCC',STR_TO_DATE('08-06-2015', '%d-%m-%Y'));
INSERT INTO labbd.reconhecimento(num_capes,sigla_curso,data_inicio)
VALUES ('1002', 'ENC',STR_TO_DATE('08-06-2015', '%d-%m-%Y'));
INSERT INTO labbd.reconhecimento(num_capes,sigla_curso,data_inicio)
VALUES ('1003', 'EP',STR_TO_DATE('08-06-2015', '%d-%m-%Y'));
INSERT INTO labbd.reconhecimento (num_capes,sigla_curso,data_inicio)
VALUES ('1004', 'EQ',STR_TO_DATE('08-06-2015', '%d-%m-%Y'));
INSERT INTO labbd.reconhecimento (num_capes,sigla_curso,data_inicio)
VALUES ('1005', 'MAT',STR_TO_DATE('08-06-2015', '%d-%m-%Y'));

INSERT INTO calendario(data_inicio, data_fim, dias_letivos, semestre, ano,versao,tipo,situacao)
VALUES (STR_TO_DATE('01-01-2016', '%d-%m-%Y'), STR_TO_DATE('30-06-2016', '%d-%m-%Y'), 300, 1, 2016, 1, 'presencial', 'aprovado'),
(STR_TO_DATE('01-01-2016', '%d-%m-%Y'), STR_TO_DATE('30-06-2016', '%d-%m-%Y'), 300, 1, 2016, 1, 'ead', 'aprovado'),
(STR_TO_DATE('01-01-2016', '%d-%m-%Y'), STR_TO_DATE('30-06-2016', '%d-%m-%Y'), 300, 1, 2016, 1, 'administrativo', 'aprovado');

#insert into ead(id) values(2);

#depois de reconhecimento
INSERT INTO labbd.item_do_formulario (num_capes, descricao, fase, dados, resultado)
VALUES ('1001', 'O curso possui estagio?', 1, 'Sim, o estagio e obrigatorio e e oferecido como disciplina do ultimo semestre.', 'Aprovado');
INSERT INTO labbd.item_do_formulario (num_capes, descricao, fase, dados, resultado)
VALUES ('1002', 'O curso possui trabalho de conclusao de curso?', 2, 'Sim, o trabalho de conclusao de curso e obrigatorio.', 'Aprovado');
INSERT INTO labbd.item_do_formulario (num_capes, descricao, fase, dados, resultado)
VALUES ('1003', 'O curso possui estagio?', 1, 'Sim, o estagio e obrigatorio.', 'Aprovado');
INSERT INTO labbd.item_do_formulario (num_capes, descricao, fase, dados, resultado)
VALUES ('1004', 'O curso possui trabalho de conclusao de curso?', 3, 'Sim, o trabalho de conclusao de curso e obrigatorio.', 'Aprovado');
INSERT INTO labbd.item_do_formulario (num_capes, descricao, fase, dados, resultado)
VALUES ('1005', 'O curso possui estagio?', 1, 'Sim, porem o estagio nao e obrigatorio.', 'Aprovado');

#depois de reconhecimento
INSERT INTO labbd.visita (data, num_capes)
VALUES (STR_TO_DATE('28-06-2016', '%d-%m-%Y'),'1001');
INSERT INTO labbd.visita (data, num_capes)
VALUES (STR_TO_DATE('27-06-2016', '%d-%m-%Y'),'1002');
INSERT INTO labbd.visita (data, num_capes)
VALUES (STR_TO_DATE('26-06-2016', '%d-%m-%Y'),'1003');
INSERT INTO labbd.visita (data, num_capes)
VALUES (STR_TO_DATE('25-06-2016', '%d-%m-%Y'),'1004');
INSERT INTO labbd.visita (data, num_capes)
VALUES (STR_TO_DATE('24-06-2016', '%d-%m-%Y'),'1005');

#depois de visita
INSERT INTO labbd.comite (id_visita, prenome, nome_do_meio, sobrenome)
VALUES (1, 'Cristiano', 'Ornelas', 'Ribeiro');
INSERT INTO labbd.comite (id_visita, prenome, nome_do_meio, sobrenome)
VALUES (2, 'Joao', 'Antonio', 'da Silva');
INSERT INTO labbd.comite (id_visita, prenome, nome_do_meio, sobrenome)
VALUES (3, 'Beatriz', 'Cabrera', 'Santana');
INSERT INTO labbd.comite (id_visita, prenome, nome_do_meio, sobrenome)
VALUES (4, 'Francisco', 'Meira', 'Lima');
INSERT INTO labbd.comite (id_visita, prenome, nome_do_meio, sobrenome)
VALUES (5, 'Maria', 'Souza', 'e Silva');

# inserts calendario
#inserts presencial
#inserts ead
#inserts adminsitrativo

INSERT INTO recesso (data_inicio, data_fim, campus, nome, tipo)
VALUES (STR_TO_DATE('09-02-2016', '%d-%m-%Y'), STR_TO_DATE('09-02-2016', '%d-%m-%Y'), 'Sorocaba', 'Carnaval', 'Federal');

INSERT INTO recesso (data_inicio, data_fim, campus, nome, tipo)
VALUES (STR_TO_DATE('13-06-2016', '%d-%m-%Y'), STR_TO_DATE('13-06-2016', '%d-%m-%Y'), 'Sao Carlos', 'Feriado Municipal em Buri', 'Municipal');

INSERT INTO recesso (data_inicio, data_fim, campus, nome, tipo)
VALUES (STR_TO_DATE('26-05-2016', '%d-%m-%Y'), STR_TO_DATE('28-05-2016', '%d-%m-%Y'), 'Sao Carlos', 'Corpus Christi', 'Federal');

INSERT INTO recesso (data_inicio, data_fim, campus, nome, tipo)
VALUES (STR_TO_DATE('15-08-2016', '%d-%m-%Y'), STR_TO_DATE('15-08-2016', '%d-%m-%Y'), 'Araras', 'Feriado Municipal em Araras', 'Municipal');

INSERT INTO recesso (data_inicio, data_fim, campus, nome, tipo)
VALUES (STR_TO_DATE('15-08-2016', '%d-%m-%Y'), STR_TO_DATE('15-08-2016', '%d-%m-%Y'), 'Sorocaba', 'Feriado Municipal em Sorocaba', 'Municipal');

insert into possui_recesso_ead (id_recesso,id_ead)
values(1,2),(2,2),(3,2),(4,2),(5,2);

insert into atividade_administrativa (data_inicio,data_fim,responsavel,nome)values
(STR_TO_DATE('25-02-2016', '%d-%m-%Y'), STR_TO_DATE('28-02-2016', '%d-%m-%Y'),'prograd','inscricao em disciplinas');

insert into possui_atividade_administrativa(id_ativ_adm,id) values(1,2);

INSERT INTO labbd.cursa(sigla,cpf, data_inicio, data_fim)
VALUES ('BCC','919191919-44',STR_TO_DATE('02-02-2014', '%d-%m-%Y'),STR_TO_DATE('11-12-2018', '%d-%m-%Y'));
INSERT INTO labbd.cursa(sigla,cpf, data_inicio, data_fim)
VALUES ('ENC','919136532-44',STR_TO_DATE('12-02-2013', '%d-%m-%Y'),STR_TO_DATE('15-12-2018', '%d-%m-%Y'));
INSERT INTO labbd.cursa(sigla,cpf, data_inicio, data_fim)
VALUES ('EP','505019159-44',STR_TO_DATE('09-02-2014', '%d-%m-%Y'),STR_TO_DATE('10-12-2019', '%d-%m-%Y'));
INSERT INTO labbd.cursa(sigla,cpf, data_inicio, data_fim)
VALUES ('Bio','209243943-08',STR_TO_DATE('02-02-2010', '%d-%m-%Y'),STR_TO_DATE('10-12-2014', '%d-%m-%Y'));
INSERT INTO labbd.cursa(sigla,cpf, data_inicio, data_fim)
VALUES ('BCC','275677595-94',STR_TO_DATE('05-02-2012', '%d-%m-%Y'),STR_TO_DATE('07-12-2016', '%d-%m-%Y'));

INSERT INTO labbd.turma (letra, vagas, sigla, cpf_docente,id_calendario)
VALUES ('A',20, 'LBD','209243943-08',1);
INSERT INTO labbd.turma (letra, vagas, sigla, cpf_docente,id_calendario)
VALUES ('B', 20,  'SO','121541619-21',1);
INSERT INTO labbd.turma (letra, vagas, sigla, cpf_docente,id_calendario)
VALUES ('B', 20,'LBD','209243943-08',1);

insert into labbd.aula(id_turma,predio,sala,  dia,		hora)
 values				  (1, 		'DC', 'lab2','quarta', '08'),
					(1, 		'DC', 'lab2','segunda', '08'),
					(2, 		'DC', 'lab4','segunda', '08'),
					(2, 		'DC', 'lab4','quarta', '08'),
					(3, 		'DC', 'lab2','quarta', '08');

#inserts , correquisito
INSERT INTO labbd.correquisitos (disciplina, correquisito)
VALUES ('CD','LCD');
INSERT INTO labbd.correquisitos (disciplina, correquisito)
VALUES ('ARQ1','LARQ1');
INSERT INTO labbd.correquisitos (disciplina, correquisito)
VALUES ('ARQ2','LARQ2');


#inserts , pre_requisito
INSERT INTO labbd.pre_requisitos (disciplina, pre_requisito)
VALUES ('Calc2','Calc1');
INSERT INTO labbd.pre_requisitos (disciplina, pre_requisito)
VALUES ('AlgLin','GA');
INSERT INTO labbd.pre_requisitos (disciplina, pre_requisito)
VALUES ('ARQ1','CD');
INSERT INTO labbd.pre_requisitos (disciplina, pre_requisito)
VALUES ('LARQ1','CD');
INSERT INTO labbd.pre_requisitos (disciplina, pre_requisito)
VALUES ('LBD','BD');

#inserts , proposto_por_Rc
INSERT INTO labbd.proposto_por_RC (data_proposta, aprovacao, numero, id_calendario)
VALUES (STR_TO_DATE('05-03-2016', '%d-%m-%Y'), 'reprovado', 1, 1);
INSERT INTO labbd.proposto_por_RC (data_proposta, aprovacao, numero, id_calendario)
VALUES (STR_TO_DATE('07-03-2015', '%d-%m-%Y'), 'reprovado', 3, 1);
INSERT INTO labbd.proposto_por_RC (data_proposta, aprovacao, numero, id_calendario)
VALUES (STR_TO_DATE('06-03-2016', '%d-%m-%Y'), 'reprovado', 2, 1);
INSERT INTO labbd.proposto_por_RC (data_proposta, aprovacao, numero, id_calendario)
VALUES (STR_TO_DATE('08-03-2015', '%d-%m-%Y'), 'aprovado', 4, 1);
INSERT INTO labbd.proposto_por_RC (data_proposta, aprovacao, numero, id_calendario)
VALUES (STR_TO_DATE('08-03-2016', '%d-%m-%Y'), 'aprovado', 5, 2);


#inserts , intervencoes
INSERT INTO labbd.intervencoes(id_itens_de_pauta, cpf, data_hora, descricao) VALUES (1,'919191919-44',STR_TO_DATE('29-04-2016', '%d-%m-%Y'), 'Nesse dia as coisas foram legais');
INSERT INTO labbd.intervencoes(id_itens_de_pauta, cpf, data_hora, descricao) VALUES (2,'919191919-44',STR_TO_DATE('29-04-2016', '%d-%m-%Y'), 'Nesse dia as coisas foram legais');
INSERT INTO labbd.intervencoes(id_itens_de_pauta, cpf, data_hora, descricao) VALUES (3,'919191919-44',STR_TO_DATE('29-04-2016', '%d-%m-%Y'), 'Nesse dia as coisas foram legais');
INSERT INTO labbd.intervencoes(id_itens_de_pauta, cpf, data_hora, descricao) VALUES (1,'505019159-44',STR_TO_DATE('29-04-2016', '%d-%m-%Y'), 'Achamos tudo ok');
INSERT INTO labbd.intervencoes(id_itens_de_pauta, cpf, data_hora, descricao) VALUES (2,'505019159-44',STR_TO_DATE('29-04-2016', '%d-%m-%Y'), 'Achamos tudo mais ou menos');

#inserts, comunicacoes
INSERT INTO labbd.comunicacoes(id_itens_de_pauta, cpf, data_hora, descricao) VALUES (1,'919191919-44',STR_TO_DATE('29-04-2016', '%d-%m-%Y'), 'Comunicado da Dilma mãe');
INSERT INTO labbd.comunicacoes(id_itens_de_pauta, cpf, data_hora, descricao) VALUES (2,'919191919-44',STR_TO_DATE('29-04-2016', '%d-%m-%Y'), 'Comunicado do Aecio louco');
INSERT INTO labbd.comunicacoes(id_itens_de_pauta, cpf, data_hora, descricao) VALUES (3,'919191919-44',STR_TO_DATE('29-04-2016', '%d-%m-%Y'), 'Comunicado do Temer legal');
INSERT INTO labbd.comunicacoes(id_itens_de_pauta, cpf, data_hora, descricao) VALUES (1,'505019159-44',STR_TO_DATE('29-04-2016', '%d-%m-%Y'), 'Comunicado do cara que sabe');
INSERT INTO labbd.comunicacoes(id_itens_de_pauta, cpf, data_hora, descricao) VALUES (2,'505019159-44',STR_TO_DATE('29-04-2016', '%d-%m-%Y'), 'Comunicado importante');
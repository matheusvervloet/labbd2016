USE labbd;

#1
INSERT INTO labbd.pessoa (cpf, prenome, nome_meio, sobrenome) 
    VALUES  ('919191919-44', 'Danilo', 'Otavio', 'Barros'),
            ('919136532-44', 'Alice', 'Luisa', 'Ramos'),
            ('505019159-44', 'Victor', 'Matheus', 'Vasconcelos'),
            ('209243943-08', 'Jessica', 'Luisa', 'Barbosa'),
            ('275677595-94', 'Clara', 'Alves', 'Lima'),
            ('231546389-98', 'Augusto', 'Cesar', 'Deus'),
            ('546322148-91', 'Jorge', 'Carvalho', 'Dias'),
            ('252468793-11', 'Linda', 'Almeida', 'Aparecida'),
            ('777795472-95', 'Loco', 'George', 'Santos'),
            ('121541619-21', 'Amanda', 'Maite', 'Pereira'),
            ('830225565-26', 'Raphael', 'Takamassa', 'Nomuro'),
            ('254847477-17', 'Priscila', 'Aleixo', 'Muller'),
            ('684499362-79', 'Ricardo', 'Matheus', 'Almeida'),
            ('385270967-90', 'Marcos', 'Vinicius', 'Gomes'),
            ('746399667-09', 'Luan', 'Leonardo', 'Mendes');


#2
INSERT INTO labbd.aluno  (nome_da_mae, nome_do_pai, pais, uf, data_nascimento, ano_ingresso, sexo, cor, reenquadramento, ra, cpf, conclusao_em_nome, conclusao_em_ano,IRA)
    VALUES  ('Luciana A Moura', 'Leonardo A Barros', 'Brasil', 'SP',
                         STR_TO_DATE('1-01-1990', '%d-%m-%Y') , STR_TO_DATE('1-01-2012', '%d-%m-%Y'),
                         'M', 'Branco', 0, 12345, '919191919-44', 'Escola Estadual Legal', STR_TO_DATE('1-01-2011', '%d-%m-%Y'),20000),
            ('Alvara A Petralina', 'Jorge A Ramos', 'Brasil', 'RJ',
                         STR_TO_DATE('17-07-1990', '%d-%m-%Y') , STR_TO_DATE('1-01-2012', '%d-%m-%Y'),
                         'F', 'Branco', 0, 2245, '919136532-44', 'Escola Estadual Chata', STR_TO_DATE('22-02-2011', '%d-%m-%Y'),10000),                       
            ('Daniela Pereira', 'Marcos G Vasconcelos', 'Brasil', 'SP',
                         STR_TO_DATE('1-01-1990', '%d-%m-%Y') , STR_TO_DATE('1-01-2010', '%d-%m-%Y'),
                         'M', 'Pardo', 0, 1299, '505019159-44', 'Escola Federal Super', STR_TO_DATE('5-01-2011', '%d-%m-%Y'),15000),
            ('Daniela Lima', 'Vinicius Lima', 'Brasil', 'SP',
                         STR_TO_DATE('1-01-1990', '%d-%m-%Y') , STR_TO_DATE('1-01-2010', '%d-%m-%Y'),
                         'M', 'Pardo', 0, 1300, '275677595-94', 'Escola Federal Super', STR_TO_DATE('5-01-2011', '%d-%m-%Y'),11000),
            ('Bruna Barbosa', 'Igor Barbosa', 'Brasil', 'SP',
                         STR_TO_DATE('1-01-1990', '%d-%m-%Y') , STR_TO_DATE('1-01-2010', '%d-%m-%Y'),
                         'M', 'Pardo', 0, 1301, '209243943-08', 'Escola Federal Super', STR_TO_DATE('5-01-2011', '%d-%m-%Y'),6000);


#3
INSERT INTO labbd.ta (cpf)
    VALUES  ('231546389-98'),
            ('546322148-91'),
            ('252468793-11'),
            ('746399667-09'),
            ('121541619-21');


#4
INSERT INTO labbd.docente (cpf)
    VALUES  ('777795472-95'),
            ('830225565-26'),
            ('254847477-17'),
            ('684499362-79'),
            ('385270967-90');


#5    -- checar se CA é CET, da biologia, etc... administrativo e oficial
INSERT INTO labbd.centro_academico (sigla, nome)
    VALUES  ('CAEnf', 'Centro Acadêmico da Enfermagem'),
			('CCET', 'Centro de Ciências Exatas e de Tecnologia'),
            ('CALING', 'Centro Acadêmico dos Estudantes de Linguística da UFSCar'),
            ('CAJAR', 'Centro Acadêmico José Albertino Rodrigues'),
            ('CAEP', 'Centro Acadêmico da Engenharia de Produção'),
            ('CCBS', 'Centro de Ciências Biológicas e da Saúde'),
            ('CAAMP', 'Centro Academico Ana Maria Primavesi – Agroecologia');


#6
INSERT INTO labbd.faz_prova(data,cpf,nota)
    VALUES  (STR_TO_DATE('02-11-2015', '%d-%m-%Y') ,'919191919-44',7),
            (STR_TO_DATE('05-11-2015', '%d-%m-%Y'),'919136532-44' ,4),
            (STR_TO_DATE('01-11-2015', '%d-%m-%Y') ,'505019159-44',5),
            (STR_TO_DATE('03-11-2015', '%d-%m-%Y') ,'275677595-94',5),
            (STR_TO_DATE('06-11-2015', '%d-%m-%Y') ,'209243943-08',5);


#7
INSERT INTO labbd.membro (data_inicio, data_fim, representacao, portaria_indicacao, cpf)
    VALUES  (STR_TO_DATE('07-03-2015', '%d-%m-%Y'), STR_TO_DATE('07-03-2016', '%d-%m-%Y'), 
                  'corpo discente', '1757/16', '919191919-44'),
            (STR_TO_DATE('07-03-2015', '%d-%m-%Y'), STR_TO_DATE('07-03-2016', '%d-%m-%Y'), 
                  'corpo docente', '1757/16', '505019159-44');


#8 - Depois de membro
INSERT INTO labbd.reuniao (numero, cpf, data, grupo_organizador, documento)
    VALUES  (1,'505019159-44',STR_TO_DATE('30-04-2016', '%d-%m-%Y'),'CoG', '~/src/1/paralizacao/29-04-2016/foo.txt'),
            (2,'505019159-44',STR_TO_DATE('29-04-2016', '%d-%m-%Y'),'CoG', '~/src/1/paralizacao/29-04-2016/bar.txt'),
            (3,'919191919-44',STR_TO_DATE('28-04-2016', '%d-%m-%Y'),'CoG', '~/src/1/paralizacao/29-04-2016/foobar.txt'),
            (4,'919191919-44',STR_TO_DATE('27-04-2016', '%d-%m-%Y'),'CoG', '~/src/1/paralizacao/29-04-2016/foo.pdf'),
            (5,'505019159-44',STR_TO_DATE('26-04-2016', '%d-%m-%Y'),'CoG', '~/src/1/paralizacao/29-04-2016/bar.pdf');


#9  
INSERT INTO labbd.itens_de_pauta (pauta,data_aprovacao,numero_reuniao,texto_descritivo)
    VALUES  ('paralizacao',STR_TO_DATE('29-04-2016', '%d-%m-%Y'),1,'Discutir o fechamento dos ATs'),
            ('paralizacao',STR_TO_DATE('29-04-2016', '%d-%m-%Y'),1,'Discutir efeitos da Greve'),
            ('paralizacao',STR_TO_DATE('29-04-2016', '%d-%m-%Y'),1,'Discutir FORA TEMER, VEM AECIO'),
            ('reprovacao',STR_TO_DATE('29-03-2016', '%d-%m-%Y'),1,'Piquete em frente ao dm'),
            ('reprovacao',STR_TO_DATE('29-03-2016', '%d-%m-%Y'),1,'carta ao DM pedindo pra ter SUB');


#10
INSERT INTO labbd.documentos (id_item_pauta,documento)
    VALUES  (1,'~/src/1/paralizacao/29-04-2016/jornal.txt'),
            (1,'~/src/1/paralizacao/29-04-2016/revista.txt'),
            (1,'~/src/1/paralizacao/29-04-2016/imagem.jpg'),
            (1,'~/src/1/paralizacao/29-04-2016/carta.txt'),
            (1,'~/src/1/paralizacao/29-04-2016/seila.out');


#11
INSERT INTO labbd.curso (sigla, sigla_ca, nome, max_creditos, min_creditos) 
    VALUES  ('ENC', 'CCET', 'Engenharia de Computacao', 38, 4),
            ('EP', 'CCET', 'Engenharia de Producao', 38,4),
            ('EQ', 'CCET', 'Engenharia Quimica', 38,4),
            ('BCC', 'CCET', 'Bacharelado Ciencia da Computacao', 38,4),
            ('Bio', 'CCBS', 'Biologia', 38,4),
            ('Mat', 'CCET', 'Matematica', 38,4);


#12
INSERT INTO labbd.departamento (sigla, nome)
    VALUES  ('DC', 'Departamento de Computacao'),
            ('DQ', 'Departamento de Quimica'),
            ('DF', 'Departamento de Fisica'),
            ('DP', 'Departamento de Producao'),
            ('DM', 'Departamento de Matematica');


#13
INSERT INTO labbd.disciplina (sigla, nome, ementa, creditos,sigla_depto)
    VALUES  ('LBD', 'Laboratorio de Bancos de Dados', 'link1', 2, 'DC'),
            ('FT6', 'Fenomenos de Transporte6', 'link2', 4, 'DF'),
            ('TO', 'Teoria das Organizacoes', 'link3', 4, 'DP'),
            ('CAP', 'Construcao de Algoritmos de Programacao', 'link4', 8,'DC'),
            ('SO', 'Sistemas Operacionais', 'link5', 4,'DC'),
            ('BD', 'Banco de Dados', 'link6', 4,'DC'),
            ('ARQ1', 'Arquitetura e Organização de Computadores 1', 'link7', 4,'DC'),
            ('LARQ1', 'Laboratorio de Arquitetura e Organização de Computadores 1', 'link8', 2,'DC'),
            ('ARQ2', 'Arquitetura e Organização de Computadores 2', 'link9', 4,'DC'),
            ('LARQ2', 'Laboratorio de Arquitetura e Organização de Computadores 2', 'link10', 2,'DC'),
            ('CD', 'Circuitos Digitais', 'link11', 4,'DC'),
            ('LCD', 'Laboratorio de Circuitos Digitais', 'link12', 2,'DC'),
            ('Calc1', 'Calculo 1', 'link13', 4,'DM'),
            ('Calc2', 'Calculo 2', 'link14', 4,'DM'),
            ('Calc3', 'Calculo 3', 'link15', 4,'DM'),
            ('GA', 'Geometria Analitica', 'link16', 4,'DM'),
            ('AlgLin', 'Algebra Linear', 'link17', 4,'DM');


#14
INSERT INTO labbd.reconhecimento (num_capes,sigla_curso,data_inicio)
    VALUES  ('1001', 'BCC',STR_TO_DATE('08-06-2015', '%d-%m-%Y')),
            ('1002', 'ENC',STR_TO_DATE('08-06-2015', '%d-%m-%Y')),
            ('1003', 'EP',STR_TO_DATE('08-06-2015', '%d-%m-%Y')),
            ('1004', 'EQ',STR_TO_DATE('08-06-2015', '%d-%m-%Y')),
            ('1005', 'MAT',STR_TO_DATE('08-06-2015', '%d-%m-%Y'));


#15
INSERT INTO calendario(data_inicio, data_fim, dias_letivos, semestre, ano,versao,tipo,situacao)
    VALUES  (STR_TO_DATE('01-01-2016', '%d-%m-%Y'), STR_TO_DATE('30-06-2016', '%d-%m-%Y'), 300, 1, 2016, 1, 'presencial', 'aprovado'),
            (STR_TO_DATE('01-01-2016', '%d-%m-%Y'), STR_TO_DATE('30-06-2016', '%d-%m-%Y'), 300, 1, 2016, 1, 'ead', 'aprovado'),
            (STR_TO_DATE('01-01-2016', '%d-%m-%Y'), STR_TO_DATE('30-06-2016', '%d-%m-%Y'), 300, 1, 2016, 1, 'administrativo', 'aprovado'),
            (STR_TO_DATE('01-08-2016', '%d-%m-%Y'), STR_TO_DATE('23-12-2016', '%d-%m-%Y'), 300, 2, 2016, 1, 'presencial', 'aprovado'),
            (STR_TO_DATE('01-01-2015', '%d-%m-%Y'), STR_TO_DATE('30-06-2016', '%d-%m-%Y'), 300, 1, 2015, 1, 'presencial', 'aprovado'),
            (STR_TO_DATE('01-08-2015', '%d-%m-%Y'), STR_TO_DATE('23-12-2016', '%d-%m-%Y'), 300, 2, 2015, 1, 'presencial', 'aprovado');


############################16 NAO PRECISA, JA CRIEI UMA TRIGGER PRA ISSO
#
#         COLOCAR INSERTS DA TABELA PRESENCIAL AQUI
#         SEGUIR PADRAO COM SÓ UM 'VALUE'
#         DE PREFERENCIA IDENTADO, TENHO TOC. GRATO. =)
#
############################


############################17 NAO PRECISA, JA CRIEI UMA TRIGGER PRA ISSO
#
#         COLOCAR INSERTS DA TABELA EAD AQUI
#         SEGUIR PADRAO COM SÓ UM 'VALUE'
#         DE PREFERENCIA IDENTADO, TENHO TOC. GRATO. =)
#
############################


############################18 NAO PRECISA, JA CRIEI UMA TRIGGER PRA ISSO
#
#         COLOCAR INSERTS DA TABELA ADMINISTRATIVO AQUI
#         SEGUIR PADRAO COM SÓ UM 'VALUE'
#         DE PREFERENCIA IDENTADO, TENHO TOC. GRATO. =)
#
############################


#19
INSERT INTO recesso (data_inicio, data_fim, campus, nome, tipo)
    VALUES  (STR_TO_DATE('09-02-2016', '%d-%m-%Y'), STR_TO_DATE('09-02-2016', '%d-%m-%Y'), 'Sorocaba', 'Carnaval', 'Federal'),
            (STR_TO_DATE('13-06-2016', '%d-%m-%Y'), STR_TO_DATE('13-06-2016', '%d-%m-%Y'), 'Sao Carlos', 'Feriado Municipal em Buri', 'Municipal'),
            (STR_TO_DATE('26-05-2016', '%d-%m-%Y'), STR_TO_DATE('28-05-2016', '%d-%m-%Y'), 'Sao Carlos', 'Corpus Christi', 'Federal'),
            (STR_TO_DATE('15-08-2016', '%d-%m-%Y'), STR_TO_DATE('15-08-2016', '%d-%m-%Y'), 'Araras', 'Feriado Municipal em Araras', 'Municipal'),
            (STR_TO_DATE('15-08-2016', '%d-%m-%Y'), STR_TO_DATE('15-08-2016', '%d-%m-%Y'), 'Sorocaba', 'Feriado Municipal em Sorocaba', 'Municipal');


#20
INSERT INTO possui_recesso_ead (id_recesso,id_ead)
    VALUES  (1,2),
            (2,2),
            (3,2),
            (4,2),
            (5,2);
#21
INSERT INTO possui_recesso_presencial (id_recesso,id_presencial)
    VALUES  (1,1),
            (2,1),
            (3,1),
            (4,1),
            (5,1);

#22
INSERT INTO atividade_administrativa (data_inicio, data_fim, responsavel, nome)
    VALUES  (STR_TO_DATE('25-02-2016', '%d-%m-%Y'), STR_TO_DATE('28-02-2016', '%d-%m-%Y'), 'prograd', 'inscricao em disciplinas');


#23
INSERT INTO possui_atividade_administrativa(id_ativ_adm,id) 
    VALUES  (1,2),
			(1,1);


#24
INSERT INTO labbd.cursa(sigla,cpf, data_inicio, data_fim)
    VALUES  ('BCC','919191919-44',STR_TO_DATE('02-02-2014', '%d-%m-%Y'),STR_TO_DATE('11-12-2018', '%d-%m-%Y')),
            ('ENC','919136532-44',STR_TO_DATE('12-02-2013', '%d-%m-%Y'),STR_TO_DATE('15-12-2018', '%d-%m-%Y')),
            ('EP','505019159-44',STR_TO_DATE('09-02-2014', '%d-%m-%Y'),STR_TO_DATE('10-12-2019', '%d-%m-%Y')),
            ('Bio','209243943-08',STR_TO_DATE('02-02-2010', '%d-%m-%Y'),STR_TO_DATE('10-12-2014', '%d-%m-%Y')),
            ('BCC','275677595-94',STR_TO_DATE('05-02-2012', '%d-%m-%Y'),STR_TO_DATE('07-12-2016', '%d-%m-%Y'));


#25 - depois de reconhecimento
INSERT INTO labbd.item_do_formulario (num_capes, descricao, fase, dados, resultado)
    VALUES  ('1001', 'O curso possui estagio?', 1, 'Sim, o estagio e obrigatorio e e oferecido como disciplina do ultimo semestre.', 'Aprovado'),
            ('1002', 'O curso possui trabalho de conclusao de curso?', 2, 'Sim, o trabalho de conclusao de curso e obrigatorio.', 'Aprovado'),
            ('1003', 'O curso possui estagio?', 1, 'Sim, o estagio e obrigatorio.', 'Aprovado'),
            ('1004', 'O curso possui trabalho de conclusao de curso?', 3, 'Sim, o trabalho de conclusao de curso e obrigatorio.', 'Aprovado'),
            ('1005', 'O curso possui estagio?', 1, 'Sim, porem o estagio nao e obrigatorio.', 'Aprovado');


#26 - depois de reconhecimento
INSERT INTO labbd.visita (data, num_capes)
    VALUES  (STR_TO_DATE('28-06-2016', '%d-%m-%Y'),'1001'),
            (STR_TO_DATE('27-06-2016', '%d-%m-%Y'),'1002'),
            (STR_TO_DATE('26-06-2016', '%d-%m-%Y'),'1003'),
            (STR_TO_DATE('25-06-2016', '%d-%m-%Y'),'1004'),
            (STR_TO_DATE('24-06-2016', '%d-%m-%Y'),'1005');


#27 - depois de visita
INSERT INTO labbd.comite (id_visita, prenome, nome_do_meio, sobrenome)
    VALUES  (1, 'Cristiano', 'Ornelas', 'Ribeiro'),
            (2, 'Joao', 'Antonio', 'da Silva'),
            (3, 'Beatriz', 'Cabrera', 'Santana'),
            (4, 'Francisco', 'Meira', 'Lima'),
            (5, 'Maria', 'Souza', 'e Silva');


#28 - Depois de itens de pauta
INSERT INTO labbd.decisoes_aprovadas (id_itens_de_pauta, decisoes_aprovadas)
    VALUES  (1, 'Apoio ao fechamento dos ATs.'),
            (2, 'Apoio a paralizacao estudantil.'),
            (3, 'Apoio a candidatura do Tiririca para presidente.'),
            (4, 'Repudio ao piquete em um departamento tao notavel e justo com os alunos como o DM'),
            (5, 'Repudio a sub no DM, visto que todas suas materias e professores ja sao extremamente faceis de se obter aprovacao');


#29
INSERT INTO labbd.turma (letra, vagas, sigla, cpf_docente, id_calendario)
    VALUES  ('A', 2, 'LBD', '777795472-95', 1),
            ('B', 20, 'SO', '684499362-79', 1),
            ('B', 20, 'LBD', '777795472-95', 1),
            ('A', 10, 'LBD', '777795472-95', 5),
            ('B', 20, 'LBD', '777795472-95', 5),
            ('C', 5, 'CD', '684499362-79', 1 ),
            ('A', 20, 'GA', '385270967-90', 1),
            ('C', 10, 'Calc3', '385270967-90', 4),
            ('A', 10, 'Calc3', '385270967-90', 5),
            ('B', 5, 'CD', '684499362-79', 4);


#30
INSERT INTO labbd.ppp (texto, sigla_curso, numero_reuniao, sigla_disciplina, ano, semestre)
	VALUES 	('Projeto que vamos melhorar essa disciplina', 'BCC', 1, 'ARQ1', 2006, 1),
			('Aumentar numero de aulas sobre coisa legal', 'ENC', 1, 'ARQ2', 2006, 1),
            ('Vamos falar mais sobre placas', 'BCC', 2, 'LARQ1', 2007, 2),
            ('Vamos falar mais da intel', 'BCC', 3, 'LARQ2', 2008, 1),
            ('Vamos programar tambem', 'BCC', 3, 'BD', 2010, 1);


#31 - ATENÇÃO - referencia uma PK que é auto increment, esses valores podem mudar e dar erro
INSERT INTO labbd.aula (id_turma, predio, sala, dia, hora)
    VALUES  (1, 'DC', 'lab2', 'quarta', '08'),
            (2, 'DC', 'lab2', 'segunda', '08'),
            (3, 'DC', 'lab4', 'segunda', '08'),
            (3, 'DC', 'lab4', 'quarta', '08'),
            (4, 'DC', 'lab2', 'quarta', '08');



############################32
#
#         COLOCAR INSERTS DA TABELA ENADE AQUI
#         SEGUIR PADRAO COM SÓ UM 'VALUE'
#         DE PREFERENCIA IDENTADO, TENHO TOC. GRATO. =)
#
############################  


############################33
#
#         COLOCAR INSERTS DA TABELA AVALIA_FORMULARIO AQUI
#         SEGUIR PADRAO COM SÓ UM 'VALUE'
#         DE PREFERENCIA IDENTADO, TENHO TOC. GRATO. =)
#
############################  


############################34
#
#         COLOCAR INSERTS DA TABELA PREVE_DISCIPLINA AQUI
#         SEGUIR PADRAO COM SÓ UM 'VALUE'
#         DE PREFERENCIA IDENTADO, TENHO TOC. GRATO. =)
#
############################  


############################35
#
#         COLOCAR INSERTS DA TABELA FAZ_CREDENCIALMENTO AQUI
#         SEGUIR PADRAO COM SÓ UM 'VALUE'
#         DE PREFERENCIA IDENTADO, TENHO TOC. GRATO. =)
#
############################  


#36 
INSERT INTO labbd.proposto_por_RC (data_proposta, aprovacao, numero, id_calendario)
    VALUES  (STR_TO_DATE('05-03-2016', '%d-%m-%Y'), 'reprovado', 1, 1),
            (STR_TO_DATE('07-03-2015', '%d-%m-%Y'), 'reprovado', 3, 1),
            (STR_TO_DATE('06-03-2016', '%d-%m-%Y'), 'reprovado', 2, 1),
            (STR_TO_DATE('08-03-2015', '%d-%m-%Y'), 'aprovado', 4, 1),
            (STR_TO_DATE('08-03-2016', '%d-%m-%Y'), 'aprovado', 5, 2);


#37
INSERT INTO labbd.correquisitos (disciplina, correquisito)
    VALUES  ('CD','LCD'),
            ('ARQ1','LARQ1'),
            ('ARQ2','LARQ2');


#38 
INSERT INTO labbd.pre_requisitos (disciplina, pre_requisito)
    VALUES  ('Calc2','Calc1'),
            ('AlgLin','GA'),
            ('ARQ1','CD'),
            ('LARQ1','CD'),
            ('LBD','BD');


#39 - ATENCAO: aqui também depende de campo auto-increment de turma
INSERT INTO labbd.matricula (cpf, id_turma, status, nota, frequencia)
    VALUES  ('275677595-94', 3, 'aprovado', 6, 78),
            ('209243943-08', 8, 'reprovado por nota', 3, 78),
            ('209243943-08', 2, 'reprovado por nota e frequencia', 1, 45),
            ('275677595-94', 5, 'reprovado por nota', 4, 79),
            ('209243943-08', 3, 'aprovado', 6, 78),
            ('919136532-44', 2, 'aprovado', 7, 90),
            ('919136532-44', 3, 'aprovado', 6, 82),
            ('919136532-44', 10, 'reprovado por nota', 4, 100);
INSERT INTO labbd.matricula (cpf, id_turma, status)
    VALUES  ('919136532-44', 9, 'cancelado'),
            ('275677595-94', 2, 'cancelado');




############################40
#
#         COLOCAR INSERTS DA TABELA GESTÃO AQUI
#         SEGUIR PADRAO COM SÓ UM 'VALUE'
#         DE PREFERENCIA IDENTADO, TENHO TOC. GRATO. =)
#
############################ 


#41 
INSERT INTO labbd.intervencoes(id_itens_de_pauta, cpf, data_hora, descricao) 
    VALUES  (1,'919191919-44',STR_TO_DATE('29-04-2016', '%d-%m-%Y'), 'Nesse dia as coisas foram legais'),
            (2,'919191919-44',STR_TO_DATE('29-04-2016', '%d-%m-%Y'), 'Nesse dia as coisas foram legais'),
            (3,'919191919-44',STR_TO_DATE('29-04-2016', '%d-%m-%Y'), 'Nesse dia as coisas foram legais'),
            (1,'505019159-44',STR_TO_DATE('29-04-2016', '%d-%m-%Y'), 'Achamos tudo ok'),
            (2,'505019159-44',STR_TO_DATE('29-04-2016', '%d-%m-%Y'), 'Achamos tudo mais ou menos');


#42
INSERT INTO labbd.comunicacoes(id_itens_de_pauta, cpf, data_hora, descricao) 
    VALUES  (1,'919191919-44',STR_TO_DATE('29-04-2016', '%d-%m-%Y'), 'Comunicado da Dilma mãe'),
            (2,'919191919-44',STR_TO_DATE('29-04-2016', '%d-%m-%Y'), 'Comunicado do Aecio louco'),
            (3,'919191919-44',STR_TO_DATE('29-04-2016', '%d-%m-%Y'), 'Comunicado do Temer legal'),
            (1,'505019159-44',STR_TO_DATE('29-04-2016', '%d-%m-%Y'), 'Comunicado do cara que sabe'),
            (2,'505019159-44',STR_TO_DATE('29-04-2016', '%d-%m-%Y'), 'Comunicado importante');


#43 - Depende do auto_incremente da turma, cuidado
INSERT INTO labbd.inscreve (cpf, id_turma, fase, deferimento)
    VALUES  ('275677595-94', 1, 1, 'em espera'), 
            ('275677595-94', 1, 2, 'em espera'),
            ('275677595-94', 3, 1, 'deferido'),
            ('275677595-94', 5, 1, 'deferido'),
            ('209243943-08', 8, 1, 'deferido'),
            ('209243943-08', 2, 1, 'deferido'),
            ('209243943-08', 3, 1, 'deferido'),
            ('275677595-94', 2, 1, 'indeferido'),
            ('919136532-44', 1, 1, 'em espera'),
            ('919136532-44', 1, 2, 'indeferido'),
            ('919136532-44', 2, 1, 'indeferido'),
            ('919136532-44', 2, 2, 'deferido'),
            ('919136532-44', 3, 1, 'indeferido'),
            ('919136532-44', 3, 2, 'deferido'),
            ('919136532-44', 9, 1, 'indeferido'),
            ('919136532-44', 9, 2, 'deferido'),
            ('919136532-44', 10, 1, 'deferido'),
            ('505019159-44', 2, 2, 'em espera');

INSERT INTO labbd.inscreve (cpf, id_turma, fase)
    VALUES  ('209243943-08', 1, 1), 
            ('209243943-08', 1, 2),
            ('209243943-08', 4, 1),
            ('209243943-08', 5, 1),
            ('209243943-08', 6, 1),
            ('505019159-44', 1, 2);
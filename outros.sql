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
DROP FUNCTION IF EXISTS f_calendario_atual;


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
DROP PROCEDURE IF EXISTS insereAluno;
DROP PROCEDURE IF EXISTS insereTA;
DROP PROCEDURE IF EXISTS insereDocente;

#HUGO


#MATHEUS


#RAFAEL KENJI
DROP PROCEDURE IF EXISTS procedure_insere_aluno;

#RAPHAEL ADAMSKI
DROP PROCEDURE IF EXISTS procedure_fazDeferimento;
DROP PROCEDURE IF EXISTS procedure_insereInscreve;
DROP PROCEDURE IF EXISTS insereItens_de_pauta;
DROP PROCEDURE IF EXISTS insereDocumentos;

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
DROP VIEW IF EXISTS calendario_geral;
DROP VIEW IF EXISTS calendario_adm_atividade_administrativas;

#HUGO


#MATHEUS


#RAFAEL KENJI


#RAPHAEL ADAMSKI


#THIAGO

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
DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `insereAluno`(
	p_nome_da_mae                 CHAR(255),
    p_nome_do_pai                 CHAR(255),
    p_pais                        CHAR(255),
    p_uf                          CHAR(255),
    p_data_nascimento             DATE,
    p_ano_ingresso                DATE,
    p_sexo                        CHAR(1),
    p_cor                         CHAR(255),
    p_reenquadramento             INT, #lembrar de iniciar com 0
    p_ra                          INT,
    p_cpf                         CHAR(12),
    p_conclusao_em_nome           CHAR(255),
    p_conclusao_em_ano            DATE,
	p_prenome             		  CHAR(255),
    p_nome_meio           		  CHAR(255),
    p_sobrenome           		  CHAR(255)
)
BEGIN
	INSERT INTO labbd.pessoa (cpf, prenome, nome_meio, sobrenome) VALUES (p_cpf, p_prenome, p_nome_meio, p_sobrenome);
	INSERT INTO labbd.aluno  (nome_da_mae, nome_do_pai, pais, uf, data_nascimento, ano_ingresso, sexo, cor, reenquadramento, ra, cpf, conclusao_em_nome, conclusao_em_ano)
	VALUES (p_nome_da_mae, p_nome_do_pai, p_pais, p_uf, p_data_nascimento, p_ano_ingresso, p_sexo, p_cor, p_reenquadramento, p_ra, p_cpf, p_conclusao_em_nome, p_conclusao_em_ano);
END

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `insereTA`(
    p_cpf                         CHAR(12),
	p_prenome             		  CHAR(255),
    p_nome_meio           		  CHAR(255),
    p_sobrenome           		  CHAR(255)
)
BEGIN
	INSERT INTO labbd.pessoa (cpf, prenome, nome_meio, sobrenome) VALUES (p_cpf, p_prenome, p_nome_meio, p_sobrenome);
	INSERT INTO labbd.ta  (cpf) VALUES (p_cpf);
END

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `insereDocente`(
    p_cpf                         CHAR(12),
	p_prenome             		  CHAR(255),
    p_nome_meio           		  CHAR(255),
    p_sobrenome           		  CHAR(255)
)
BEGIN
	INSERT INTO labbd.pessoa (cpf, prenome, nome_meio, sobrenome) VALUES (p_cpf, p_prenome, p_nome_meio, p_sobrenome);
	INSERT INTO labbd.docente  (cpf) VALUES (p_cpf);
END


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
 
 CREATE DEFINER=`root`@`localhost` PROCEDURE `insereItens_de_pauta`(npauta VARCHAR(255), ndata_aprovacao CHAR(10), nnumero_reuniao INT, ntexto_descritivo LONGTEXT)
BEGIN
	insert into labbd.itens_de_pauta(pauta , data_aprovacao, numero_reuniao,texto_descritivo) values (npauta, STR_TO_DATE(ndata_aprovacao, '%d-%m-%Y') , nnumero_reuniao ,ntexto_descritivo);
END
$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `insereDocumentos`(nid int, ndocumento varchar(255))
BEGIN
	insert into labbd.documentos(id_item_pauta,documento) value (nid,ndocumento);
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
CREATE 
    ALGORITHM = UNDEFINED 
    DEFINER = `root`@`localhost` 
    SQL SECURITY DEFINER
VIEW `calendario_adm_atividade_administrativas` AS
    SELECT 
        `labbd`.`calendario`.`semestre` AS `semestre`,
        `labbd`.`calendario`.`ano` AS `ano`,
        `labbd`.`calendario`.`data_inicio` AS `inicio_calendario`,
        `labbd`.`calendario`.`data_fim` AS `fim_calendario`,
        `labbd`.`atividade_administrativa`.`nome` AS `nome`,
        `labbd`.`atividade_administrativa`.`data_inicio` AS `atv_inicio`,
        `labbd`.`atividade_administrativa`.`data_fim` AS `atv_fim`,
		`labbd`.`atividade_administrativa`.`responsavel` AS `responsavel`
    FROM
        ((`labbd`.`calendario` 
       JOIN (`labbd`.`atividade_administrativa`
        JOIN `labbd`.`possui_atividade_administrativa` ON ((`labbd`.`atividade_administrativa`.`id_ativ_adm` = `labbd`.`possui_atividade_administrativa`.`id_ativ_adm`)))
        JOIN  `labbd`.`administrativo` ON ((`labbd`.`administrativo`.`id` = `labbd`.`calendario`.`id`)) 
        ))
	WHERE
		((`labbd`.`calendario`.`situacao` = 'aprovado') AND
		 (`labbd`.`calendario`.`tipo` = 'administrativo'))
	ORDER BY  atv_inicio;
	
CREATE 
    ALGORITHM = UNDEFINED 
    DEFINER = `root`@`localhost` 
    SQL SECURITY DEFINER
VIEW `calendario_geral` AS
    SELECT 
		`labbd`.`calendario`.`id` AS `ID`,
		`labbd`.`calendario`.`semestre` AS `semestre`,
        `labbd`.`calendario`.`ano` AS `ano`,
        `labbd`.`calendario`.`data_inicio` AS `inicio_calendario`,
        `labbd`.`calendario`.`data_fim` AS `fim_calendario`,
		`labbd`.`calendario`.`versao` AS `versao`,
        `labbd`.`calendario`.`tipo` AS `tipo`,
		`labbd`.`calendario`.`situacao` AS `situacao`,
		`labbd`.`atividade_administrativa`.`nome` AS `nome`,
        `labbd`.`atividade_administrativa`.`data_inicio` AS `atv_inicio`,
        `labbd`.`atividade_administrativa`.`data_fim` AS `atv_fim`,
		`labbd`.`atividade_administrativa`.`responsavel` AS `responsavel`
		
	FROM
        ((`labbd`.`calendario` 
       JOIN (`labbd`.`atividade_administrativa`
        JOIN `labbd`.`possui_atividade_administrativa` ON ((`labbd`.`atividade_administrativa`.`id_ativ_adm` = `labbd`.`possui_atividade_administrativa`.`id_ativ_adm`))) 
        ))
    WHERE
        (`labbd`.`calendario`.`versao` >= 0)
	ORDER BY situacao, ano ASC;

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


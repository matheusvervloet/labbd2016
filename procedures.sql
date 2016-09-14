DELIMITER $$

DROP PROCEDURE IF EXISTS labbd.procedure_fazDeferimento$$
DROP PROCEDURE IF EXISTS labbd.inscricao_turma$$
DROP PROCEDURE IF EXISTS labbd.insereAluno$$
DROP PROCEDURE IF EXISTS labbd.insereAtivAdm$$
DROP PROCEDURE IF EXISTS labbd.insereCA$$
DROP PROCEDURE IF EXISTS labbd.insereComite$$
DROP PROCEDURE IF EXISTS labbd.insereCorrequisito$$
DROP PROCEDURE IF EXISTS labbd.insereComunicacao$$
DROP PROCEDURE IF EXISTS labbd.insereCursa$$
DROP PROCEDURE IF EXISTS labbd.insereCurso$$
DROP PROCEDURE IF EXISTS labbd.insereDecisoes_aprovadas$$
DROP PROCEDURE IF EXISTS labbd.insereDepartamento$$
DROP PROCEDURE IF EXISTS labbd.insereDisciplina$$
DROP PROCEDURE IF EXISTS labbd.insereDocente$$
DROP PROCEDURE IF EXISTS labbd.insereDocumentos$$
DROP PROCEDURE IF EXISTS labbd.insereEnade$$
DROP PROCEDURE IF EXISTS labbd.insereFazprova$$
DROP PROCEDURE IF EXISTS labbd.insereGestao$$
DROP PROCEDURE IF EXISTS labbd.insereIntervencao$$
DROP PROCEDURE IF EXISTS labbd.insereMembro$$
DROP PROCEDURE IF EXISTS labbd.procedure_insereInscreve$$
DROP PROCEDURE IF EXISTS labbd.insereItemDoFormulario$$
DROP PROCEDURE IF EXISTS labbd.insereItens_de_pauta$$
DROP PROCEDURE IF EXISTS labbd.inserePossuiAtivAdm$$
DROP PROCEDURE IF EXISTS labbd.inserePossuiRecesso$$
DROP PROCEDURE IF EXISTS labbd.inserePropostoPorRc$$
DROP PROCEDURE IF EXISTS labbd.inserePreRequisito$$
DROP PROCEDURE IF EXISTS labbd.insereRecesso$$
DROP PROCEDURE IF EXISTS labbd.insereReconhecimento$$
DROP PROCEDURE IF EXISTS labbd.insereReuniao$$
DROP PROCEDURE IF EXISTS labbd.insereTA$$
DROP PROCEDURE IF EXISTS labbd.insereVisita$$
DROP PROCEDURE IF EXISTS labbd.procedure_calcula_ira$$
DROP PROCEDURE IF EXISTS labbd.procedure_consulta_historico$$
DROP PROCEDURE IF EXISTS labbd.procedure_consulta_inscricoes$$
DROP PROCEDURE IF EXISTS labbd.procedure_insere_aluno$$
DROP PROCEDURE IF EXISTS labbd.consulta_itens$$
DROP PROCEDURE IF EXISTS labbd.consulta_ta$$
DROP PROCEDURE IF EXISTS labbd.consulta_docente$$

CREATE PROCEDURE labbd.procedure_fazDeferimento(nfase INT, calendario INT)
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
   
END$$

CREATE PROCEDURE labbd.inscricao_turma(n_cpf char(12), n_id_turma int, n_fase int)
BEGIN
DECLARE  CpfAluno CHAR(12);
DECLARE  Disciplina CHAR(10);
DECLARE  oldDisciplina CHAR(10);
DECLARE  contador int;
#verifica se cpf é de um aluno
select labbd.aluno.cpf into CpfAluno
from labbd.aluno
where labbd.aluno.cpf = n_cpf;
IF (CpfAluno = n_cpf) THEN

	select  turma.sigla into Disciplina
	from turma
	where turma.id_turma = n_id_turma;
	
	select matricula_aluno_turma.sigla into oldDisciplina
	from matricula_aluno_turma
	where matricula_aluno_turma.cpf = n_cpf and matricula_aluno_turma.sigla = Disciplina;
    
    select count(*) into contador
	from matricula_aluno_turma
	where matricula_aluno_turma.cpf = n_cpf and matricula_aluno_turma.sigla = Disciplina;
    
	if(contador = 0) then
    
	insert into labbd.matricula(cpf, id_turma, fase)
	values (n_cpf, n_id_turma, n_fase);
    
	end if;
    
    if(contador = 1) then
    
    update labbd.matricula
	set cpf = n_cpf,
    id_turma = n_id_turma,
    fase = n_fase
    WHERE matricula.cpf = CpfAluno and  Disciplina = oldDisciplina;
	
    end if;
END IF;
END $$

CREATE PROCEDURE labbd.insereAluno(
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
END $$


CREATE PROCEDURE labbd.insereAtivAdm(n_nome CHAR(255), n_resp CHAR(255), n_dini DATE, n_dfim DATE)
BEGIN
	insert into labbd.atividade_administrativa(nome, responsavel, data_inicio, data_fim) values (n_nome, n_resp, n_dini, n_dfim);
END $$


CREATE PROCEDURE labbd.insereCA(
    p_sigla               CHAR(10),
    p_nome                CHAR(255)
)
BEGIN
	INSERT INTO labbd.centro_academico (sigla, nome) VALUES (p_sigla, p_nome);
END $$

CREATE PROCEDURE labbd.insereComite(pId_visita INT, pPrenome CHAR(255), pNomeMeio CHAR(255), pSobrenome CHAR(255))
BEGIN
INSERT INTO labbd.comite (id_visita, prenome, nome_do_meio, sobrenome) 
    VALUES (pId_visita, pPrenome, pNomeMeio, pSobrenome);
END$$

CREATE PROCEDURE labbd.insereCursa(sigla char(10), cpf char(12), data_inicio date, data_fim date)
BEGIN
DECLARE  CpfAluno CHAR(12);
select labbd.aluno.cpf into CpfAluno
from labbd.aluno
where labbd.aluno.cpf = n_cpf;
IF (CpfAluno = n_cpf) THEN
INSERT INTO labbd.cursa(sigla,cpf, data_inicio, data_fim)
    VALUES  (sigla,cpf, data_inicio, data_fim);
end if;
END $$

CREATE PROCEDURE labbd.insereCurso(sigla CHAR(10), nome CHAR(255), max_creditos int, min_creditos int)
BEGIN
INSERT INTO labbd.curso (sigla, nome, max_creditos, min_creditos) 
    VALUES  (sigla, nome, max_creditos, min_creditos);
END $$

CREATE PROCEDURE labbd.insereDecisoes_aprovadas(pId_itens_pauta INT, pDecisoes CHAR(255))
BEGIN
INSERT INTO labbd.decisoes_aprovadas (id_itens_de_pauta, decisoes_aprovadas) 
    VALUES (pId_itens_pauta, pDecisoes);
END $$

CREATE PROCEDURE labbd.insereDepartamento(sigla char(10), nome char(255))
BEGIN
	INSERT INTO labbd.departamento (sigla, nome)
    VALUES  (sigla, nome);
END $$

CREATE PROCEDURE labbd.insereDisciplina(sigla CHAR(10), nome CHAR(255), ementa LONGTEXT, creditos int , sigla_depto CHAR(10))
BEGIN
	INSERT INTO labbd.disciplina (sigla, nome, ementa, creditos,sigla_depto)
		VALUES  (sigla, nome, ementa, creditos,sigla_depto);
END $$

CREATE PROCEDURE labbd.insereDocente(
    p_cpf                         CHAR(12),
	p_prenome             		  CHAR(255),
    p_nome_meio           		  CHAR(255),
    p_sobrenome           		  CHAR(255)
)
BEGIN
	INSERT INTO labbd.pessoa (cpf, prenome, nome_meio, sobrenome) VALUES (p_cpf, p_prenome, p_nome_meio, p_sobrenome);
	INSERT INTO labbd.docente  (cpf) VALUES (p_cpf);
END $$

CREATE PROCEDURE labbd.insereDocumentos(nid int, ndocumento varchar(255))
BEGIN
	insert into labbd.documentos(id_item_pauta,documento) value (nid,ndocumento);
END $$

CREATE PROCEDURE labbd.insereEnade(
        p_ano                 YEAR(4), 
        p_periodo             CHAR(10), 
        p_sigla_curso         CHAR(10)
)
BEGIN
        INSERT INTO labbd.enade(ano, periodo, sigla_curso) VALUES(p_ano, p_periodo, sigla_curso);
END $$

CREATE PROCEDURE labbd.insereFazprova(data date, cpf char(12), nota int)
BEGIN
DECLARE  CpfAluno CHAR(12);
select labbd.aluno.cpf into CpfAluno
from labbd.aluno
where labbd.aluno.cpf = n_cpf;
IF (CpfAluno = n_cpf) THEN
	INSERT INTO labbd.faz_prova(data,cpf,nota)
		VALUES  (data, cpf , nota );
end if;
END $$

CREATE PROCEDURE labbd.procedure_insereInscreve(ncpf char(12), nid_turma INT, nfase INT)
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

END $$

CREATE PROCEDURE labbd.insereItemDoFormulario(pNum_capes INT, pNumItem INT, pDescricao CHAR(255), pFase INT, pDados LONGTEXT, pResultado LONGTEXT)
BEGIN
INSERT INTO labbd.item_do_formulario (num_capes, num_item, descricao, fase, dados, resultado) 
    VALUES (pNum_capes, pNumItem, pDescricao, pFase, pDados, pResultado);
END $$

CREATE PROCEDURE labbd.insereItens_de_pauta(npauta VARCHAR(255), ndata_aprovacao CHAR(10), nnumero_reuniao INT, ntexto_descritivo LONGTEXT)
BEGIN
	INSERT INTO labbd.itens_de_pauta(pauta , data_aprovacao, numero_reuniao,texto_descritivo)
	VALUES (npauta, STR_TO_DATE(ndata_aprovacao, '%Y-%m-%d') , nnumero_reuniao , ntexto_descritivo);
END $$

CREATE PROCEDURE labbd.insereGestao(
  p_cpf                   CHAR(12),
  p_gestao_data_inicio    DATE,
  p_gestao_data_fim       DATE
)
BEGIN
  INSERT INTO labbd.membro (cpf) VALUES (p_cpf);
	INSERT INTO labbd.gestao (cpf, gestao_data_inicio, gestao_data_fim) 
              VALUES (p_cpf, p_gestao_data_inicio, p_gestao_data_fim);
END $$


CREATE PROCEDURE labbd.insereMembro(
  p_data_inicio         DATE,
  p_data_fim            DATE,
  p_representacao       CHAR(255),
  p_portaria_indicacao  CHAR(255),
  p_cpf                 CHAR(12)
)
BEGIN
  INSERT INTO labbd.pessoa (cpf) VALUES (p_cpf);
	INSERT INTO labbd.membro (data_inicio, data_fim, representacao, portaria_indicacao, cpf) 
              VALUES (p_data_inicio, p_data_fim, p_representacao, p_portaria_indicacao, p_cpf);
END $$

CREATE PROCEDURE labbd.inserePossuiAtivAdm(n_id_ativ INT, n_id_c INT)
BEGIN
	insert into labbd.possui_atividade_administrativa(id_ativ_adm, id) values (n_id_ativ, n_id_c);
END $$

CREATE PROCEDURE labbd.inserePossuiRecesso(n_id_recesso INT, n_id_calendario_p INT, n_id_calendario_e INT, tipo INT)
BEGIN
	IF (tipo = 0) THEN
		insert into labbd.possui_recesso_ead(id_recesso, id_ead) values (n_id_recesso, n_id_calendario_e);
		insert into labbd.possui_recesso_presencial(id_recesso, id_presencial) values (n_id_recesso, n_id_calendario_p);
	ELSEIF (tipo = 1) THEN
		insert into labbd.possui_recesso_presencial(id_recesso, id_presencial) values (n_id_recesso, n_id_calendario_p);
	ELSEIF (tipo = 2) THEN
		insert into labbd.possui_recesso_ead(id_recesso, id_ead) values (n_id_recesso, n_id_calendario_e);
	ELSE
		CALL raise_error();
	END IF;
END $$


CREATE PROCEDURE labbd.insereRecesso(n_dini DATE, n_dfim DATE, n_campus CHAR(255), n_nome CHAR(255), n_tipo CHAR(9))
BEGIN
	insert into labbd.recesso(data_inicio, data_fim, campus, nome, tipo) values (n_dini, n_dfim, n_campus, n_nome, n_tipo);
END $$


CREATE PROCEDURE labbd.insereReconhecimento(num_capes int,sigla_curso date, data_inicio char(10))
BEGIN
	INSERT INTO labbd.reconhecimento (num_capes,sigla_curso,data_inicio)
		VALUES  (num_capes,sigla_curso,data_inicio);
END $$

CREATE PROCEDURE labbd.insereReuniao(pNumero INT, pCPF CHAR(12), pData DATE, pGrupo CHAR(255), pDocumento CHAR(255))
BEGIN
INSERT INTO labbd.reuniao (numero, cpf, data, grupo_organizador, documento) 
    VALUES (pNumero, pCPF, pData, pGrupo, pDocumento);
END $$

CREATE PROCEDURE labbd.insereTA(
    p_cpf                         CHAR(12),
	p_prenome             		  CHAR(255),
    p_nome_meio           		  CHAR(255),
    p_sobrenome           		  CHAR(255)
)
BEGIN
	INSERT INTO labbd.pessoa (cpf, prenome, nome_meio, sobrenome) VALUES (p_cpf, p_prenome, p_nome_meio, p_sobrenome);
	INSERT INTO labbd.ta  (cpf) VALUES (p_cpf);
END $$

CREATE PROCEDURE labbd.insereVisita(pData DATE, pNum_capes INT)
BEGIN
INSERT INTO labbd.visita (data, num_capes) 
    VALUES (pData, pNum_capes);
END $$

CREATE PROCEDURE labbd.inserePropostoPorRC (p_data DATE, p_aprovacao CHAR(255), p_numero INT, p_id_calendario INT)
BEGIN
	INSERT INTO labbd.proposto_por_RC (data_proposta, aprovacao, numero, id_calendario)
	    VALUES  (p_data, p_aprovacao, p_numero, p_id_calendario);
END $$

CREATE PROCEDURE labbd.insereCorrequisito (p_disciplina INT, p_corequisito INT)
BEGIN
	INSERT INTO labbd.correquisitos (disciplina, correquisito)
    VALUES  (p_disciplina, p_corequisito);
END $$

CREATE PROCEDURE labbd.inserePreRequisito (p_disciplina INT, p_prerequisito INT)
BEGIN
	INSERT INTO labbd.pre_requisitos (disciplina, pre_requisito)
    VALUES  (p_disciplina, p_prerequisito);
END $$

CREATE PROCEDURE labbd.insereIntervencao (p_id_itens_de_pauta INT, p_cpf CHAR(12), p_data_hora DATE, p_descricao LONGTEXT)
BEGIN
	INSERT INTO labbd.intervencoes(id_itens_de_pauta, cpf, data_hora, descricao) 
    VALUES  (p_id_itens_de_pauta, p_cpf, p_data_hora, p_descricao);
END $$

CREATE PROCEDURE labbd.insereComunicacao (p_id_itens_de_pauta INT, p_cpf CHAR(12), p_data_hora DATE, p_descricao LONGTEXT)
BEGIN
	INSERT INTO labbd.comunicacoes (id_itens_de_pauta, cpf, data_hora, descricao) 
    VALUES  (p_id_itens_de_pauta, p_cpf, p_data_hora, p_descricao);
END $$

CREATE PROCEDURE labbd.procedure_calcula_ira()
BEGIN
	DECLARE done 	BOOLEAN DEFAULT FALSE;
	DECLARE ra 		INT 	DEFAULT 0;
	DECLARE ira 	INT 	DEFAULT 0;

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

CREATE PROCEDURE labbd.procedure_consulta_historico
(IN ra_param INT)
BEGIN
  SELECT * FROM vhistorico
  WHERE ra = ra_param;
END $$

CREATE PROCEDURE labbd.procedure_consulta_inscricoes
(IN ra_param INT)
BEGIN
  SELECT * FROM vinscricoes
  WHERE ra = ra_param;
END $$

CREATE PROCEDURE labbd.procedure_insere_aluno
(IN cpf_param VARCHAR(12), IN prenome_param VARCHAR(255), IN nome_meio_param VARCHAR(255), IN sobrenome_param VARCHAR(255), IN nome_da_mae_param VARCHAR(255), IN nome_do_pai_param VARCHAR(255), IN pais_param VARCHAR(255), IN uf_param VARCHAR(255), IN data_nascimento_param DATE, IN ano_ingresso_param DATE, IN sexo_param VARCHAR(1), IN cor_param VARCHAR(255), IN ra_param INT, IN conclusao_em_nome_param VARCHAR(255), IN conclusao_em_ano_param DATE, IN IRA_param INT)
BEGIN
  INSERT INTO pessoa (cpf, prenome, nome_meio, sobrenome) VALUES (cpf_param, prenome_param, nome_meio_param, sobrenome_param);
  INSERT INTO aluno (nome_da_mae, nome_do_pai, pais, uf, data_nascimento, ano_ingresso, Sexo, cor, reenquadramento, ra, cpf, conclusao_em_nome, conclusao_em_ano, IRA) VALUES (nome_da_mae_param, nome_do_pai_param, pais_param, uf_param, data_nascimento_param, ano_ingresso_param, sexo_param, cor_param, 0, ra_param, cpf_param, conclusao_em_nome_param, conclusao_em_ano_param, IRA_param);
END$$

CREATE PROCEDURE labbd.consulta_itens
(IN cpf_param VARCHAR(12))
BEGIN
  SELECT
    numero_reuniao,
    pauta,
	data_aprovacao,
    texto_descritivo
  FROM itens_de_pauta JOIN reuniao on numero=numero_reuniao where cpf= cpf_param;
END $$

CREATE PROCEDURE labbd.consulta_ta
(IN cpf_param VARCHAR(12))
BEGIN
  SELECT *
  FROM ta_existente
  WHERE cpf = cpf_param;
END $$

CREATE PROCEDURE labbd.consulta_docente
(IN cpf_param VARCHAR(12))
BEGIN
  SELECT *
  FROM docente_existente
  WHERE cpf = cpf_param;
END $$

DELIMITER ;


#DELIMITER $$

#DROP PROCEDURE labbd.IF EXISTS labbd.matricula_aluno_turma$$
#CREATE PROCEDURE labbd.matricula_aluno_turma(cpf CHAR(12), sigla CHAR(255), letra CHAR(1), razao char(255), nota INT, deferimento CHAR(10), fase INT)
#BEGIN
#    DECLARE cpfAluno CHAR(12);
#    DECLARE siglaTurma CHAR(255);
#    DECLARE letraTurma CHAR(255);
#    DECLARE idTurma INT;
#    SELECT labbd.aluno.cpf into cpfAluno FROM labbd.aluno WHERE labbd.aluno.cpf = cpf;
#    SELECT labbd.turma.sigla, labbd.turma.letra into siglaTurma, letraTurma FROM labbd.turma WHERE labbd.turma.sigla = sigla AND labbd.turma.letra = letra;

#   	IF cpfAluno = cpf AND siglaTurma = sigla AND letraTurma = letra THEN
#        SELECT labbd.turma.id_turma into idTurma FROM labbd.turma WHERE labbd.turma.sigla = sigla AND labbd.turma.letra = letra;
#        IF idTurma IS NOT NULL THEN
#            INSERT INTO labbd.matricula(id_turma, cpf, razao, nota, deferimento, fase)
#            VALUES(idTurma, cpf, 'AEHO', '6', 'DEFERIDO', 1);
#        END IF;
#    END IF;
#END$$



#DELIMITER ;
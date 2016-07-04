CREATE DEFINER=`root`@`localhost` PROCEDURE `fazDeferimento`(nfase INT, calendario INT)
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
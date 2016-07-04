CREATE DEFINER=`root`@`localhost` PROCEDURE `insereInscreve`(ncpf char(12), nid_turma INT, nfase INT)
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
        
        select count(*) into contador from inscreve where inscreve.cpf =ncpf AND inscreve.id_turma = auxid_turma AND inscreve.fase = nfase;
        
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
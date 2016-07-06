DROP TRIGGER IF EXISTS labbd.Tgr_Disciplina;
DROP TRIGGER IF EXISTS labbd.t_atualiza_status_matricula;
DROP TRIGGER IF EXISTS labbd.inscreve_deferimento;
DROP TRIGGER IF EXISTS labbd.insere_calendario;
DROP TRIGGER IF EXISTS labbd.trigger_aluno_reenquadramento;
DROP TRIGGER IF EXISTS labbd.trigger_matricula_deferido;


DELIMITER $$
CREATE TRIGGER labbd.Tgr_Disciplina 
	before INSERT ON disciplina
	FOR EACH ROW
BEGIN
	declare creditos int;
    set creditos = new.creditos;
    if ( creditos%2 = 1) then
		set new.creditos = new.creditos-1; #numeros de creditos deve ser par. Logo se for impar retira 1;
	end if;
END$$ 

CREATE TRIGGER labbd.t_atualiza_status_matricula
	BEFORE UPDATE ON matricula
	FOR EACH ROW
BEGIN
	if new.frequencia < 75 AND new.nota < 6 THEN
		set new.status = 'reprovado por nota e frequencia';
	elseif new.frequencia >= 75 AND new.nota < 6 THEN
		set new.status = 'reprovado por nota';
	elseif new.frequencia < 75 AND new.nota >= 6 THEN
		set new.status = 'reprovado por frequencia';
	elseif new.frequencia >= 75 AND new.nota >= 6 THEN
		set new.status = 'aprovado';
	elseif new.frequencia = 0 AND new.nota = 6 THEN
		set new.status = 'reconhecido';
	end if;
END$$ 

CREATE TRIGGER labbd.inscreve_deferimento
	before insert on labbd.inscreve
	for each row
begin
	if new.deferimento <=> null then
		 SET new.deferimento = 'em espera';
	end if;
end$$


CREATE TRIGGER labbd.insere_calendario 
	after insert on labbd.calendario
	for each row
begin
 case new.tipo
	when 'ead' then insert into ead(id) value (new.id);
    when 'presencial' then insert into presencial(id) value(new.id);
    when 'administrativo' then insert into administrativo(id) value(new.id);
	end case;
end$$

CREATE TRIGGER labbd.trigger_aluno_reenquadramento
    AFTER UPDATE ON aluno
    FOR EACH ROW
BEGIN
    IF NEW.reenquadramento <> 0 THEN
        UPDATE aluno SET perfil_atual = NEW.reenquadramento WHERE cpf = OLD.cpf;
    END IF;
END$$

CREATE TRIGGER labbd.trigger_matricula_deferido
	AFTER UPDATE ON inscreve
	FOR EACH ROW
BEGIN
	IF NEW.deferimento = 'deferido' THEN
		INSERT INTO matricula (cpf, id_turma) 
				VALUES (OLD.cpf, OLD.id_turma);
	END IF;
END$$

DELIMITER ;


-- delimiter $$
-- CREATE DEFINER = `root`@`localhost` TRIGGER labbd.tgr_insere_aluno
-- AFTER INSERT
-- ON labbd.aluno
-- FOR EACH ROW
-- BEGIN
	-- SET @p_teste = f_calc_ira(NEW.ra);
	-- UPDATE labbd.aluno
	-- SET ira = @p_teste AND priority = prio
	-- WHERE ra = NEW.ra;
-- END$$

#drop TRIGGER labbd.insere_calendario;
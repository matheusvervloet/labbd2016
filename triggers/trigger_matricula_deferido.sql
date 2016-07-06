DROP TRIGGER IF EXISTS trigger_matricula_deferido;
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
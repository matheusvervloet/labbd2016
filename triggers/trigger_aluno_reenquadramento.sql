DELIMITER $$
CREATE TRIGGER trigger_aluno_reenquadramento
    AFTER UPDATE ON aluno
    FOR EACH ROW
BEGIN
    IF NEW.reenquadramento <> 0 THEN
        UPDATE aluno SET perfil_atual = NEW.reenquadramento WHERE cpf = OLD.cpf
    END IF;
END$$
DELIMITER ;
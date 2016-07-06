DROP TRIGGER IF EXISTS t_atualiza_status_matricula;
DELIMITER $$
CREATE TRIGGER t_atualiza_status_matricula
	BEFORE UPDATE ON matricula
	FOR EACH ROW
BEGIN
	if new.frequencia < 75 AND new.nota < 6 THEN
		set new.status = 'reprovado por nota e frequencia';
	else if new.frequencia >= 75 AND new.nota < 6 THEN
		set new.status = 'reprovado por nota';
	else if new.frequencia < 75 AND new.nota >= 6 THEN
		set new.status = 'reprovado por frequencia';
	else if new.frequencia >= 75 AND new.nota >= 6 THEN
		set new.status = 'aprovado';
	else if new.frequencia = 0 AND new.nota = 6 THEN
		set new.status = 'reconhecido';
	end if;
END$$ 
DELIMITER ;

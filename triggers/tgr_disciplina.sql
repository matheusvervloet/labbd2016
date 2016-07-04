drop trigger IF EXISTS Tgr_Disciplina;
DELIMITER $$
CREATE TRIGGER Tgr_Disciplina before INSERT
ON disciplina
FOR EACH ROW
BEGIN
	declare creditos int;
    set creditos = new.creditos;
    if ( creditos%2 = 1) then
		set new.creditos = new.creditos-1; #numeros de creditos deve ser par. Logo se for impar retira 1;
	end if;
END$$ 
DELIMITER ;


DROP PROCEDURE IF EXISTS procedure_calcula_ira;
DELIMITER $$
CREATE PROCEDURE procedure_calcula_ira()
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
DELIMITER ;
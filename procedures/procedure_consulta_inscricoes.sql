DROP PROCEDURE IF EXISTS procedure_consulta_inscricoes;
DELIMITER $$
CREATE PROCEDURE procedure_consulta_inscricoes
(IN ra_param INT)
BEGIN
  SELECT * FROM vinscricoes
  WHERE ra = ra_param;
END $$
DELIMITER ;
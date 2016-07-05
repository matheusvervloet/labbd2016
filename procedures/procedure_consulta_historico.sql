DROP PROCEDURE IF EXISTS procedure_consulta_historico;
DELIMITER $$
CREATE PROCEDURE procedure_consulta_historico
(IN ra_param INT)
BEGIN
  SELECT * FROM vhistorico
  WHERE ra = ra_param;
END $$
DELIMITER ;
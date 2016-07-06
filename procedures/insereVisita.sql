DELIMITER $$

DROP PROCEDURE IF EXISTS labbd.insereVisita$$

CREATE PROCEDURE labbd.insereVisita(pData DATE, pNum_capes INT)
BEGIN
INSERT INTO labbd.visita (data, num_capes) 
    VALUES (pData, pNum_capes);
END$$

DELIMITER ;
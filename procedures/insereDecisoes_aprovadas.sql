DELIMITER $$

DROP PROCEDURE IF EXISTS labbd.insereDecisoes_aprovadas$$

CREATE PROCEDURE labbd.insereDecisoes_aprovadas(pId_itens_pauta INT, pDecisoes CHAR(255))
BEGIN
INSERT INTO labbd.decisoes_aprovadas (id_itens_de_pauta, decisoes_aprovadas) 
    VALUES (pId_itens_pauta, pDecisoes);
END$$

DELIMITER ;
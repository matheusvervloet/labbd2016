DELIMITER $$

DROP PROCEDURE IF EXISTS labbd.insereDecisoes_aprovadas$$

PROCEDURE labbd.insereDecisoes_aprovadas(pId_itens_pauta INT, pDecisoes LONGTEXT)
BEGIN
INSERT INTO labbd.decisoes_aprovadas (id_itens_de_pauta, decisoes_aprovadas) 
    VALUES (pId_itens_pauta, pDecisoes);
END

DELIMITER ;
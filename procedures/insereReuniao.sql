DELIMITER $$

DROP PROCEDURE IF EXISTS labbd.insereReuniao$$

CREATE PROCEDURE labbd.insereReuniao(pNumero INT, pCPF CHAR(12), pData DATE, pGrupo CHAR(255), pDocumento CHAR(255))
BEGIN
INSERT INTO labbd.reuniao (numero, cpf, data, grupo_organizador, documento) 
    VALUES (pNumero, pCPF, pData, pGrupo, pDocumento);
END$$

DELIMITER ;
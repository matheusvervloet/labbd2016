CREATE DEFINER=`root`@`localhost` PROCEDURE `insereComite`(pId_visita INT, pPrenome CHAR(255), pNomeMeio CHAR(255), pSobrenome CHAR(255))
BEGIN
INSERT INTO labbd.comite (id_visita, prenome, nome_do_meio, sobrenome) 
    VALUES (pId_visita, pPrenome, pNomeMeio, pSobrenome);
END
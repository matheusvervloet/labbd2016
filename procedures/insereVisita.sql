CREATE DEFINER=`root`@`localhost` PROCEDURE `insereVisita`(pData DATE, pNum_capes INT)
BEGIN
INSERT INTO labbd.visita (data, num_capes) 
    VALUES (pData, pNum_capes);
END
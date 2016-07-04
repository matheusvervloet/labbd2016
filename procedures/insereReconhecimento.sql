CREATE DEFINER=`root`@`localhost` PROCEDURE `insereReconhecimento`(num_capes int,sigla_curso date, data_inicio char(10))
BEGIN
	INSERT INTO labbd.reconhecimento (num_capes,sigla_curso,data_inicio)
		VALUES  (num_capes,sigla_curso,data_inicio);
END
CREATE DEFINER=`root`@`localhost` PROCEDURE `insereRecesso`(n_dini DATE, n_dfim DATE, n_campus CHAR(255), n_nome CHAR(255), n_tipo CHAR(9))
BEGIN
	insert into labbd.recesso(data_inicio, data_fim, campus, nome, tipo) values (n_dini, n_dfim, n_campus, n_nome, n_tipo);
END


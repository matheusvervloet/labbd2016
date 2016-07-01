CREATE DEFINER=`root`@`localhost` PROCEDURE `inserePossuiRecesso`(n_id_recesso INT, n_id_calendario INT, tipo INT)
BEGIN
	IF (tipo = 0) THEN
		insert into labbd.possui_recesso_ead(id_recesso, id_ead) values (n_id_recesso, n_id_calendario);
		insert into labbd.possui_recesso_presencial(id_recesso, id_presencial) values (n_id_recesso, n_id_calendario);
	ELSEIF (tipo = 1) THEN
		insert into labbd.possui_recesso_presencial(id_recesso, id_presencial) values (n_id_recesso, n_id_calendario);
	ELSEIF (tipo = 2) THEN
		insert into labbd.possui_recesso_ead(id_recesso, id_ead) values (n_id_recesso, n_id_calendario);
	ELSE
		CALL raise_error();
			
END


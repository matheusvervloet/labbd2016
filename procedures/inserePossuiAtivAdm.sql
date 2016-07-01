CREATE DEFINER=`root`@`localhost` PROCEDURE `inserePossuiAtivAdm`(n_id_ativ INT, n_id_c INT)
BEGIN
	insert into labbd.possui_atividade_administrativa(id_ativ_adm, id) values (n_id_ativ, n_id_c);
END


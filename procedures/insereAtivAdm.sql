CREATE DEFINER=`root`@`localhost` PROCEDURE `insereAtivAdm`(n_nome CHAR(255), n_resp CHAR(255), n_dini DATE, n_dfim DATE)
BEGIN
	insert into labbd.atividade_administrativa(nome, responsavel, data_inicio, data_fim) values (n_nome, n_resp, n_dini, n_dfim);
END


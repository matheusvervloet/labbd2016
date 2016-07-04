CREATE DEFINER=`root`@`localhost` PROCEDURE `insereInscreve`(ncpf char(12), nid_turma INT, nfase INT)
BEGIN
	INSERT INTO labbd.inscreve (cpf, id_turma, fase, deferimento)
		VALUE  (ncpf, nid_turma, nfase, 'em espera');
END
CREATE DEFINER=`root`@`localhost` PROCEDURE `inscricao_turma`(n_cpf char(12), n_id_turma int, n_fase int)
BEGIN

select aluno.cpf
from labbd.aluno
where labbd.aluno.cpf = n_cpf;
IF (aluno.cpf= n_cpf) THEN
	insert into labbd.matricula(cpf, id_turma, fase)
	values (n_cpf, n_id_turma, n_fase);

END IF;
END
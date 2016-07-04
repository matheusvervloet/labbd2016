CREATE DEFINER=`root`@`localhost` PROCEDURE `insereFazprova`(data date, cpf char(12), nota int)
BEGIN
DECLARE  CpfAluno CHAR(12);
select labbd.aluno.cpf into CpfAluno
from labbd.aluno
where labbd.aluno.cpf = n_cpf;
IF (CpfAluno = n_cpf) THEN
	INSERT INTO labbd.faz_prova(data,cpf,nota)
		VALUES  (data, cpf , nota );
end if;
END
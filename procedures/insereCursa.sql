CREATE DEFINER=`root`@`localhost` PROCEDURE `insereCursa`(sigla char(10), cpf char(12), data_inicio date, data_fim date)
BEGIN
DECLARE  CpfAluno CHAR(12);
select labbd.aluno.cpf into CpfAluno
from labbd.aluno
where labbd.aluno.cpf = n_cpf;
IF (CpfAluno = n_cpf) THEN
INSERT INTO labbd.cursa(sigla,cpf, data_inicio, data_fim)
    VALUES  (sigla,cpf, data_inicio, data_fim);
end if;
END
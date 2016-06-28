CREATE DEFINER=`root`@`localhost` PROCEDURE `inscricao_turma`(n_cpf char(12), n_id_turma int, n_fase int, n_op int, n_siglaDisciplina char(10))
BEGIN
DECLARE  CpfAluno CHAR(12);
DECLARE  Disciplina CHAR(10);
#verifica se cpf é de um aluno
select labbd.aluno.cpf into CpfAluno
from labbd.aluno
where labbd.aluno.cpf = n_cpf;
IF (CpfAluno = n_cpf) THEN
	
	if(n_op = 1) then
	insert into labbd.matricula(cpf, id_turma, fase)
	values (n_cpf, n_id_turma, n_fase);
	end if;
    
    if(n_op = 2) then
    select  turma.sigla into Disciplina
	from turma
	where turma.id_turma = n_id_turma;
    
    update labbd.matricula
	set cpf = n_cpf,
    id_turma = n_id_turma,
    fase = n_fase
    WHERE matricula.cpf = CpfAluno and  Disciplina = n_siglaDisciplina;
	
    end if;
END IF;
END
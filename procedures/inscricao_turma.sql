CREATE DEFINER=`root`@`localhost` PROCEDURE `inscricao_turma`(n_cpf char(12), n_id_turma int, n_fase int)
BEGIN
DECLARE  CpfAluno CHAR(12);
DECLARE  Disciplina CHAR(10);
DECLARE  oldDisciplina CHAR(10);
DECLARE  contador int;
#verifica se cpf é de um aluno
select labbd.aluno.cpf into CpfAluno
from labbd.aluno
where labbd.aluno.cpf = n_cpf;
IF (CpfAluno = n_cpf) THEN

	select  turma.sigla into Disciplina
	from turma
	where turma.id_turma = n_id_turma;
	
	select matricula_aluno_turma.sigla into oldDisciplina
	from matricula_aluno_turma
	where matricula_aluno_turma.cpf = n_cpf and matricula_aluno_turma.sigla = Disciplina;
    
    select count(*) into contador
	from matricula_aluno_turma
	where matricula_aluno_turma.cpf = n_cpf and matricula_aluno_turma.sigla = Disciplina;
    
	if(contador = 0) then
    
	insert into labbd.matricula(cpf, id_turma, fase)
	values (n_cpf, n_id_turma, n_fase);
    
	end if;
    
    if(contador = 1) then
    
    update labbd.matricula
	set cpf = n_cpf,
    id_turma = n_id_turma,
    fase = n_fase
    WHERE matricula.cpf = CpfAluno and  Disciplina = oldDisciplina;
	
    end if;
END IF;
END
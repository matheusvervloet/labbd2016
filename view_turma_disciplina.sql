CREATE 
    ALGORITHM = UNDEFINED 
    DEFINER = `root`@`localhost` 
    SQL SECURITY DEFINER
VIEW `labbd`.`turmas_disciplina_ro` AS
    SELECT 
        `labbd`.`turma`.`id_turma` AS `turmaCodigo`,
        `labbd`.`disciplina`.`nome` AS `Disciplina`,
        `labbd`.`turma`.`dia` AS `Dia`,
        `labbd`.`turma`.`hora` AS `Horario`,
        `labbd`.`turma`.`vagas` AS `Vagas`,
        `labbd`.`pessoa`.`prenome` AS `Docente Nome`,
        `labbd`.`pessoa`.`sobrenome` AS `Docente Sobrenome`,
        `labbd`.`turma`.`id_calendario` AS `Calendario`
    FROM
        (((`labbd`.`turma`
        JOIN `labbd`.`disciplina`)
        JOIN `labbd`.`docente`)
        JOIN `labbd`.`pessoa`)
    WHERE
        ((`labbd`.`turma`.`sigla` = `labbd`.`disciplina`.`sigla`)
            AND (`labbd`.`turma`.`cpf_docente` = `labbd`.`docente`.`cpf`)
            AND (`labbd`.`docente`.`cpf` = `labbd`.`pessoa`.`cpf`))

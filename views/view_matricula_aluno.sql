CREATE 
    ALGORITHM = UNDEFINED 
    DEFINER = `root`@`localhost` 
    SQL SECURITY DEFINER
VIEW `labbd`.`matricula_aluno` AS
    SELECT 
        `labbd`.`matricula`.`cpf` AS `cpf`,
        `labbd`.`turma`.`id_turma` AS `id_turma`,
        `labbd`.`disciplina`.`sigla` AS `sigla`,
        `labbd`.`disciplina`.`nome` AS `disciplina`,
        `labbd`.`turma`.`letra` AS `letra`
    FROM
        ((`labbd`.`matricula`
        JOIN `labbd`.`disciplina`)
        JOIN `labbd`.`turma`)
    WHERE
        ((`labbd`.`turma`.`id_turma` = `labbd`.`matricula`.`id_turma`)
            AND (`labbd`.`turma`.`sigla` = `labbd`.`disciplina`.`sigla`))
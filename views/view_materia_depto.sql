CREATE 
    ALGORITHM = UNDEFINED 
    DEFINER = `root`@`localhost` 
    SQL SECURITY DEFINER
VIEW `labbd`.`view_materias_do_depto` AS
    SELECT 
        `labbd`.`disciplina`.`sigla` AS `siglaDisciplina`,
        `labbd`.`disciplina`.`nome` AS `nomeDisciplina`,
        `labbd`.`departamento`.`nome` AS `nomeDepartamento`
    FROM
        (`labbd`.`disciplina`
        JOIN `labbd`.`departamento`)
    WHERE
        (`labbd`.`disciplina`.`sigla_depto` = `labbd`.`departamento`.`sigla`)
    ORDER BY `labbd`.`departamento`.`nome` , `labbd`.`disciplina`.`nome` WITH CASCADED CHECK OPTION

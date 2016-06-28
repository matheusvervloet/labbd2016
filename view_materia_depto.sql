CREATE 
    ALGORITHM = UNDEFINED 
    DEFINER = `root`@`localhost` 
    SQL SECURITY DEFINER
VIEW `labbd`.`materias_do_departamento_edit` AS
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
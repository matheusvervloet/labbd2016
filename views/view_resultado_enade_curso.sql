CREATE 
    ALGORITHM = UNDEFINED 
    DEFINER = `root`@`localhost` 
    SQL SECURITY DEFINER
VIEW `labbd`.`resultado_enade_curso` AS
    SELECT 
        `labbd`.`curso`.`nome` AS `Curso`,
        `labbd`.`curso`.`sigla` AS `Sigla`,
        `labbd`.`enade`.`ano` AS `Ano`,
        `labbd`.`enade`.`periodo` AS `Periodo`,
        calculaEnade(sigla, ano) AS `Resultado`,

    FROM
        (((`labbd`.`enade`
        JOIN `labbd`.`curso`)
    WHERE
        ((`labbd`.`enade`.`sigla_curso` = `labbd`.`disciplina`.`sigla`))
            

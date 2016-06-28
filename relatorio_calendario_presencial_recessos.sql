CREATE 
    ALGORITHM = UNDEFINED 
    DEFINER = `root`@`localhost` 
    SQL SECURITY DEFINER
VIEW `calendario_presencial_recessos` AS
    SELECT 
        `calendario`.`semestre` AS `semestre`,
        `calendario`.`ano` AS `ano`,
        `calendario`.`data_inicio` AS `inicio_calendario`,
        `calendario`.`data_fim` AS `fim_calendario`,
        `recesso`.`nome` AS `nome`,
        `recesso`.`campus` AS `campus`,
        `recesso`.`data_inicio` AS `recesso_inicio`,
        `recesso`.`data_fim` AS `recesso_fim`,
        `recesso`.`tipo` AS `tipo`
    FROM
        ((`calendario`
        JOIN (`presencial`
        JOIN `possui_recesso_presencial` ON ((`presencial`.`id` = `possui_recesso_presencial`.`id_presencial`))) ON ((`calendario`.`id` = `presencial`.`id`)))
        JOIN `recesso` ON ((`recesso`.`id_recesso` = `possui_recesso_presencial`.`id_recesso`)))
    WHERE
        ((`calendario`.`situacao` = 'aprovado')
            AND (`calendario`.`tipo` = 'presencial'))
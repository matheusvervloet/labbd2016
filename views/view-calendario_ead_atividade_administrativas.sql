CREATE 
    ALGORITHM = UNDEFINED 
    DEFINER = `root`@`localhost` 
    SQL SECURITY DEFINER
VIEW `calendario_ead_atividade_administrativas` AS
    SELECT 
        `calendario`.`semestre` AS `semestre`,
        `calendario`.`ano` AS `ano`,
        `calendario`.`data_inicio` AS `inicio_calendario`,
        `calendario`.`data_fim` AS `fim_calendario`,
        `atividade_administrativa`.`nome` AS `nome`,
        `atividade_administrativa`.`data_inicio` AS `atv_inicio`,
        `atividade_administrativa`.`data_fim` AS `atv_fim`
    FROM
        ((`ead`
        JOIN (`calendario`
        JOIN `possui_atividade_administrativa` `adm` ON ((`calendario`.`id` = `adm`.`id`))) ON ((`ead`.`id` = `calendario`.`id`)))
        JOIN `atividade_administrativa` ON ((`atividade_administrativa`.`id_ativ_adm` = `adm`.`id_ativ_adm`)))
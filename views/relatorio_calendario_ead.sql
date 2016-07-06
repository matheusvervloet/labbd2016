CREATE 
    ALGORITHM = UNDEFINED 
    DEFINER = `root`@`localhost` 
    SQL SECURITY DEFINER
VIEW `labbd`.`vcalendario_ead` AS
    SELECT 
        `labbd`.`calendario`.`semestre` AS `semestre`,
        `labbd`.`calendario`.`ano` AS `ano`,
        `labbd`.`calendario`.`data_inicio` AS `inicio_calendario`,
        `labbd`.`calendario`.`data_fim` AS `fim_calendario`,
        `labbd`.`recesso`.`nome` AS `nome`,
        `labbd`.`recesso`.`campus` AS `campus`,
        `labbd`.`recesso`.`data_inicio` AS `recesso_inicio`,
        `labbd`.`recesso`.`data_fim` AS `recesso_fim`,
        `labbd`.`recesso`.`tipo` AS `tipo`
    FROM
        ((`labbd`.`calendario`
        JOIN (`labbd`.`ead`
        JOIN `labbd`.`possui_recesso_ead` ON ((`labbd`.`ead`.`id` = `labbd`.`possui_recesso_ead`.`id_ead`))) ON ((`labbd`.`calendario`.`id` = `labbd`.`ead`.`id`)))
        JOIN `labbd`.`recesso` ON ((`labbd`.`recesso`.`id_recesso` = `labbd`.`possui_recesso_ead`.`id_recesso`)))
    UNION SELECT 
        `labbd`.`calendario`.`semestre` AS `semestre`,
        `labbd`.`calendario`.`ano` AS `ano`,
        `labbd`.`calendario`.`data_inicio` AS `inicio_calendario`,
        `labbd`.`calendario`.`data_fim` AS `fim_calendario`,
        `labbd`.`atividade_administrativa`.`nome` AS `nome`,
        NULL AS `NULL`,
        `labbd`.`atividade_administrativa`.`data_inicio` AS `atv_inicio`,
        `labbd`.`atividade_administrativa`.`data_fim` AS `atv_fim`,
        NULL AS `NULL`
    FROM
        ((`labbd`.`ead`
        JOIN (`labbd`.`calendario`
        JOIN `labbd`.`possui_atividade_administrativa` `adm` ON ((`labbd`.`calendario`.`id` = `adm`.`id`))) ON ((`labbd`.`ead`.`id` = `labbd`.`calendario`.`id`)))
        JOIN `labbd`.`atividade_administrativa` ON ((`labbd`.`atividade_administrativa`.`id_ativ_adm` = `adm`.`id_ativ_adm`)))
	WHERE
        ((`labbd`.`calendario`.`situacao` = 'aprovado')
            AND (`labbd`.`calendario`.`tipo` = 'ead')) 
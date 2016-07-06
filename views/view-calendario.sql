CREATE 
    ALGORITHM = UNDEFINED 
    DEFINER = `root`@`localhost` 
    SQL SECURITY DEFINER
VIEW `calendario_geral` AS
    SELECT 
		`labbd`.`calendario`.`id` AS `ID`,
		`labbd`.`calendario`.`semestre` AS `semestre`,
        `labbd`.`calendario`.`ano` AS `ano`,
        `labbd`.`calendario`.`data_inicio` AS `inicio_calendario`,
        `labbd`.`calendario`.`data_fim` AS `fim_calendario`,
		`labbd`.`calendario`.`versao` AS `versao`,
        `labbd`.`calendario`.`tipo` AS `tipo`,
		`labbd`.`calendario`.`situacao` AS `situacao`,
		`labbd`.`atividade_administrativa`.`nome` AS `nome`,
        `labbd`.`atividade_administrativa`.`data_inicio` AS `atv_inicio`,
        `labbd`.`atividade_administrativa`.`data_fim` AS `atv_fim`,
		`labbd`.`atividade_administrativa`.`responsavel` AS `responsavel`
		
	FROM
        ((`labbd`.`calendario` 
       JOIN (`labbd`.`atividade_administrativa`
        JOIN `labbd`.`possui_atividade_administrativa` ON ((`labbd`.`atividade_administrativa`.`id_ativ_adm` = `labbd`.`possui_atividade_administrativa`.`id_ativ_adm`))) 
        ))
    WHERE
        (`labbd`.`calendario`.`versao` >= 0)
	ORDER BY situacao, ano ASC;
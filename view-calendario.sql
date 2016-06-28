CREATE 
    ALGORITHM = UNDEFINED 
    DEFINER = `root`@`localhost` 
    SQL SECURITY DEFINER
VIEW `calendario_geral` AS
    SELECT 
		`calendario`.`id` AS `ID`,
        `calendario`.`semestre` AS `semestre`,
        `calendario`.`ano` AS `ano`,
        `calendario`.`data_inicio` AS `inicio_calendario`,
        `calendario`.`data_fim` AS `fim_calendario`,
		`calendario`.`versao` AS `versao`,
        `calendario`.`tipo` AS `tipo`,
		`calendario`.`situacao` AS `situacao`,
		`atividade_administrativa`.`nome` AS `nome`,
        `atividade_administrativa`.`data_inicio` AS `atv_inicio`,
        `atividade_administrativa`.`data_fim` AS `atv_fim`,
		`atividade_administrativa`.`responsavel` AS `responsavel`,
		
	FROM
        (`calendario`
        JOIN `possui_atividade_administrativa` `adm` ON ((`calendario`.`id` = `adm`.`id`)))
    WHERE
        (`calendario`.`versao` >= 0)
	ORDER BY situacao, ano ASC;
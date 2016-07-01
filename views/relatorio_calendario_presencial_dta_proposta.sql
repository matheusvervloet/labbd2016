CREATE 
    ALGORITHM = UNDEFINED 
    DEFINER = `root`@`localhost` 
    SQL SECURITY DEFINER
VIEW `calendario_presencial_data_proposta` AS
    SELECT 
        `calendario`.`semestre` AS `semestre`,
        `calendario`.`ano` AS `ano`,
        `calendario`.`data_inicio` AS `inicio_calendario`,
        `calendario`.`data_fim` AS `fim_calendario`,
		`calendario`.`versao` AS `versao`,
        `proposto_por_RC`.`data_proposta` AS `data_proposta`
    FROM
        ((`calendario`
        JOIN (`presencial`
        JOIN `proposto_por_RC` ON ((`presencial`.`id` = `proposto_por_RC`.`id_calendario`))) ON ((`calendario`.`id` = `presencial`.`id`))))
    WHERE
        ((`calendario`.`situacao` = 'aprovado')
            AND (`calendario`.`tipo` = 'presencial'))
	ORDER BY versao;
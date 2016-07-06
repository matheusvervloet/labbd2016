CREATE 
    ALGORITHM = UNDEFINED 
    DEFINER = `root`@`localhost` 
    SQL SECURITY DEFINER
VIEW `calendario_adm_atividade_administrativas` AS
    SELECT 
        `labbd`.`calendario`.`semestre` AS `semestre`,
        `labbd`.`calendario`.`ano` AS `ano`,
        `labbd`.`calendario`.`data_inicio` AS `inicio_calendario`,
        `labbd`.`calendario`.`data_fim` AS `fim_calendario`,
        `labbd`.`atividade_administrativa`.`nome` AS `nome`,
        `labbd`.`atividade_administrativa`.`data_inicio` AS `atv_inicio`,
        `labbd`.`atividade_administrativa`.`data_fim` AS `atv_fim`,
		`labbd`.`atividade_administrativa`.`responsavel` AS `responsavel`
    FROM
        ((`labbd`.`calendario` 
       JOIN (`labbd`.`atividade_administrativa`
        JOIN `labbd`.`possui_atividade_administrativa` ON ((`labbd`.`atividade_administrativa`.`id_ativ_adm` = `labbd`.`possui_atividade_administrativa`.`id_ativ_adm`)))
        JOIN  `labbd`.`administrativo` ON ((`labbd`.`administrativo`.`id` = `labbd`.`calendario`.`id`)) 
        ))
	WHERE
		((`labbd`.`calendario`.`situacao` = 'aprovado') AND
		 (`labbd`.`calendario`.`tipo` = 'administrativo'))
	ORDER BY  atv_inicio;
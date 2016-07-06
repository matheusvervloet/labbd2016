DELIMITER //
DROP PROCEDURE IF EXISTS insereItens_de_pauta//
CREATE DEFINER='root'@'localhost' PROCEDURE insereItens_de_pauta(npauta VARCHAR(255), ndata_aprovacao CHAR(10), nnumero_reuniao INT, ntexto_descritivo LONGTEXT)
BEGIN
	INSERT INTO labbd.itens_de_pauta(pauta , data_aprovacao, numero_reuniao,texto_descritivo)
	VALUES (npauta, STR_TO_DATE(ndata_aprovacao, '%Y-%m-%d') , nnumero_reuniao , ntexto_descritivo);
END//

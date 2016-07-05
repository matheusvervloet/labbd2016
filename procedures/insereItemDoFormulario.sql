DELIMITER $$

DROP PROCEDURE IF EXISTS labbd.insereItemDoFormulario$$

PROCEDURE labbd.insereItemDoFormulario(pNnum_capes INT, pNumItem INT, pDescricao CHAR(255), pFase INT, pDados LONGTEXT, pResultado LONGTEXT)
BEGIN
INSERT INTO labbd.item_do_formulario (num_capes, num_item, descricao, fase, dados, resultado) 
    VALUES (pNum_capes, pNum_item, pDescricao, pFase, pDados, pResultado);
END

DELIMITER ;
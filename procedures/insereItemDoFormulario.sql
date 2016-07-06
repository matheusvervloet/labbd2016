DELIMITER $$

DROP PROCEDURE IF EXISTS labbd.insereItemDoFormulario$$

CREATE PROCEDURE labbd.insereItemDoFormulario(pNum_capes INT, pNumItem INT, pDescricao CHAR(255), pFase INT, pDados LONGTEXT, pResultado LONGTEXT)
BEGIN
INSERT INTO labbd.item_do_formulario (num_capes, num_item, descricao, fase, dados, resultado) 
    VALUES (pNum_capes, pNumItem, pDescricao, pFase, pDados, pResultado);
END$$

DELIMITER ;


#DELIMITER $$

#DROP PROCEDURE IF EXISTS labbd.matricula_aluno_turma$$
#CREATE PROCEDURE labbd.matricula_aluno_turma(cpf CHAR(12), sigla CHAR(255), letra CHAR(1), razao char(255), nota INT, deferimento CHAR(10), fase INT)
#BEGIN
#    DECLARE cpfAluno CHAR(12);
#    DECLARE siglaTurma CHAR(255);
#    DECLARE letraTurma CHAR(255);
#    DECLARE idTurma INT;
#    SELECT labbd.aluno.cpf into cpfAluno FROM labbd.aluno WHERE labbd.aluno.cpf = cpf;
#    SELECT labbd.turma.sigla, labbd.turma.letra into siglaTurma, letraTurma FROM labbd.turma WHERE labbd.turma.sigla = sigla AND labbd.turma.letra = letra;

#   	IF cpfAluno = cpf AND siglaTurma = sigla AND letraTurma = letra THEN
#        SELECT labbd.turma.id_turma into idTurma FROM labbd.turma WHERE labbd.turma.sigla = sigla AND labbd.turma.letra = letra;
#        IF idTurma IS NOT NULL THEN
#            INSERT INTO labbd.matricula(id_turma, cpf, razao, nota, deferimento, fase)
#            VALUES(idTurma, cpf, 'AEHO', '6', 'DEFERIDO', 1);
#        END IF;
#    END IF;
#END$$

#DELIMITER ;
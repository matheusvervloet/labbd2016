-- delimiter $$
-- CREATE DEFINER = `root`@`localhost` TRIGGER tgr_insere_aluno
-- AFTER INSERT
-- ON labbd.aluno
-- FOR EACH ROW
-- BEGIN
	-- SET @p_teste = f_calc_ira(NEW.ra);
	-- UPDATE labbd.aluno
	-- SET ira = @p_teste AND priority = prio
	-- WHERE ra = NEW.ra;
-- END$$
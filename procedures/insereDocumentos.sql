CREATE DEFINER=`root`@`localhost` PROCEDURE `insereDocumentos`(nid int, ndocumento varchar(255))
BEGIN
	insert into labbd.documentos(id_item_pauta,documento) value (nid,ndocumento);
END
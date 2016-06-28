#drop trigger insere_calendario;
delimiter $$
create DEFINER = `root`@`localhost` trigger insere_calendario
after insert
on labbd.calendario
for each row
begin
 case new.tipo
	when 'ead' then insert into ead(id) value (new.id);
    when 'presencial' then insert into presencial(id) value(new.id);
    when 'administrativo' then insert into administrativo(id) value(new.id);
	end case;
end$$

#INSERT INTO calendario(data_inicio, data_fim, dias_letivos, semestre, ano,versao,tipo,situacao)VALUES (STR_TO_DATE('01-01-2016', '%d-%m-%Y'), STR_TO_DATE('30-06-2016', '%d-%m-%Y'), 300, 1, 2016, 2, 'presencial', 'aprovado'),STR_TO_DATE('01-01-2016', '%d-%m-%Y'), STR_TO_DATE('30-06-2016', '%d-%m-%Y'), 300, 1, 2016, 2, 'ead', 'aprovado'),(STR_TO_DATE('01-01-2016', '%d-%m-%Y'), STR_TO_DATE('30-06-2016', '%d-%m-%Y'), 300, 1, 2016, 2, 'administrativo', 'aprovado');

delimiter $$
create DEFINER = `root`@`localhost` trigger inscreve_deferimento
before insert
on labbd.inscreve
for each row
begin
	if new.deferimento <=> null then
		 SET new.deferimento = 'em espera';
	end if;
end$$

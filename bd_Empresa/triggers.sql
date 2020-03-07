use empresa; 


create table auditoriaSalario(
	idAuditoria int not null auto_increment primary key,
    `Cpf` bigint(11) unsigned zerofill NOT NULL,
    `Unome` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
     `SalarioAnterior` float(7,2) DEFAULT NULL,
    `SalarioNovo` float(7,2) DEFAULT NULL,
    user varchar(20),
    dataHora datetime not null
)ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

delimiter $$
create trigger afterFuncUpdate
after update on funcionario
for each row
begin 
	if Old.Salario != New.Salario then
		insert into auditoriasalario(Cpf,Unome, SalarioAnterior,SalarioNovo,user,dataHora)
		value (New.Cpf,New.Unome,OLD.Salario,New.Salario,user(),now());
    end if;
end $$
delimiter ;
select * from funcionario;
drop trigger afterFuncUpdate;

select Unome,Salario
from funcionario
where cpf='12345678966';

update funcionario
set Salario=37000.00
where Cpf='12345678966';

select * from auditoriaSalario; 



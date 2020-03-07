create table dependente100 (
 nomedep varchar(50),
 email varchar(50),
 cpf varchar(11)
);

alter table dependente100 
add primary key(cpf);

alter table dependente100
add constraint fk_depen_func foreign key (cpf) references `Funcionário` (`CPF Pessoa`) on update cascade on delete cascade;

alter table dependente100
add endereco varchar (50);

alter table dependente100
drop email;

drop table dependente100;
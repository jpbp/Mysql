use empresa;


-- 14 


select Pnome,Unome,Projnome,count(Projnome)
from funcionario as f,trabalha_em as te, projeto as p
where f.Cpf=te.Fcpf and p.Projnumero=te.Pnr;

select * from dependente;
select * from funcionario;
-- 7
select distinct Pnome,Unome
from funcionario as f
where not exists (	select * 
					from dependente as d 
					where d.Fcpf= f.Cpf);

-- 11

select distinct Pnome,Unome,Nome_dependente
from funcionario as f left join dependente as d on  f.Cpf=d.Fcpf;


select * from projeto;
select * from departamento;
select * from funcionario;
-- 12
select count(*)
from funcionario as f, departamento as d, projeto as p
where  p.Projnome='ProdutoZ' and p.Dnum=d.Dnumero and d.Dnumero=f.Dnr;

-- 21

delimiter //
create procedure reajuste(in pNumero decimal(2), in perc float(3))
begin 
	update Funcionario
    set Salario=Salario*perc
    where Dnr=Pnumero;
end //

delimiter ;
select salario from funcionario;
call reajuste(5,1.1);

-- 22 

delimiter // 
create procedure adicionaFuncProj(in cpf bigint(11), in pnr int(11), in h date)
begin
	insert into trabalha_em values(cpf,pnr,h);
end//

delimiter ;

select * from trabalha_em;
call adicionaFuncProj(12345678966,10,'10:00:00');

-- 23

delimiter $$
create trigger FuncSalSup
after update on funcionario
for each row 
begin
	
end$$
delimiter ;

-- 24

delimiter $$
create trigger gerenciaDep
after update on departamento
for each row
begin
	if new.funcionario.Dnr = new.departamento.Dnumero then
		insert into departamento(Dnome,Dnumero,Cpf_gerente,Data_inicio_gerente) 
        value (New.Dnome,new.Dnumero,new.Cpf_gerente,new.Data_inicio_gerente);
	end if;
end $$
delimiter ;

select * from departamento;
select * from funcionario;

INSERT INTO `DEPARTAMENTO` (`Dnome`, `Dnumero`, `Cpf_gerente`, `Data_inicio_gerente`) VALUE
('Matriz', 1, 45345345376, '1985-08-19');

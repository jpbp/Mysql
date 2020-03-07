use empresa;

select * from funcionario;
select * from departamento;
select * from dependente;
select * from projeto;
select * from trabalha_em;
select * from localizacao_dep;

-- Consulta 0
select Datanasc,Endereco 
from funcionario
where Pnome="João" and Minicial='B' and  Unome="Silva";

-- consulta 1
select Pnome,Endereco 
from Funcionario,departamento
where Dnome="Pesquisa" and Dnr=Dnumero;

-- consulta 2 
select Projnumero,Dnum,Unome,Endereco,Datanasc
from departamento,projeto,funcionario
where Projlocal="Mauá" and Dnumero=Dnum and Cpf_gerente=Cpf;

-- consulta 3

select F1.Pnome, F1.Unome, F2.Pnome,f2.Unome
from funcionario as F1,funcionario as F2
where  F1.Cpf_supervisor=F2.Cpf;

-- consulta 4 Minha
(select distinct Projnumero
from funcionario,projeto,departamento
where Unome="Silva" and Cpf_gerente=Cpf and Dnumero=Dnr)
union
(select distinct Projnumero
from funcionario,projeto,departamento
where Unome="Silva" and Dnr=Dnumero and Dnumero=Dnum);
 -- livro
 (select distinct Projnumero
from funcionario,projeto,departamento
where Unome="Silva" and Cpf_gerente=Cpf and Dnumero=Dnr)
union
(select Projnumero
from funcionario,trabalha_em,projeto
where Unome="Silva" and Fcpf=Cpf and Projnumero=Pnr);
 

-- consulta11
select distinct  salario
from funcionario;

select all salario
from funcionario;

-- consulta 12 
select Pnome,Unome
from funcionario
where Endereco like '%SP%';

-- consulta 12A
select *
from funcionario
where Datanasc>"1950-01-01" and Datanasc<"1960-12-31";

-- refazendo a 4

select Distinct Projnumero
from funcionario,trabalha_em,projeto
where Unome="Silva" and Cpf=Fcpf and Pnr=Projnumero
	union(
select distinct Projnumero
from funcionario,departamento,projeto
where Cpf=Cpf_gerente and Dnum=Dnumero and Unome="Silva"
    );

-- 13
select distinct Salario*1.1
from funcionario,projeto,trabalha_em
where Cpf=Fcpf and Pnr=Projnumero and Projnome="ProdutoX";


-- consulta 14
select *
from funcionario
where (Salario between 30000.00 and 40000.00) and Dnr=5;


insert into funcionario
values("Ricardo","K","Marini","65329865388","1962-12-30","Rua Itapura, 44 Santos, SP","M","37.000","65329865388",4);

update funcionario
set Cpf_supervisor=null
where cpf='65329865388';

update funcionario
set Salario=Salario*1.1
where Dnr=5;

delete from funcionario
where Cpf='65329865388';


-- consulta 18 
select * 
from funcionario
where Cpf_supervisor is null;

-- teste in 
select distinct Fcpf
from trabalha_em 
where (Pnr,Horas) in (select Pnr,Horas 
					from trabalha_em
                    where Fcpf="12345678966");
select Pnome,Unome,Salario
from funcionario
where Salario > all (select Salario from funcionario where Dnr=5);


-- joins
select Pnome,Unome
from funcionario natural join departamento
where Dnome="Pesquisa" or (select Pnome,Unome 
							from funcionario,trabalha_em,projeto,departamento
                            where )



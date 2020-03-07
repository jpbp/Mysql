use empresa;

/* Cria um stored procedure e chama todos os funcionarios */

delimiter //
create procedure ObtemTodosFuncs()
begin
select * from funcionario;
end //
delimiter ;

call ObtemTodosFuncs();

drop procedure ObtemTodosFuncs;


/* printa todos os funcionario de determinado departamento a partir de um numero (IN) */
delimiter //

create procedure FuncsDeDepto(in pIdDepto decimal(2))
begin
	select Pnome,Unome
    from funcionario
    where Dnr=pIdDepto;
end //
delimiter ;

call FuncsDeDepto(5);


delimiter //
create procedure FuncsNomeDepto(in NameDepto varchar(20), out NumFuncs decimal(4))
begin 
	select count(*) into NumFuncs
    from funcionario,departamento
    where Dnr=Dnumero and Dnome=NameDepto;
end //
delimiter ;

call FuncsNomeDepto('Pesquisa',@nFuncs);
select @nFuncs as nFuncs;









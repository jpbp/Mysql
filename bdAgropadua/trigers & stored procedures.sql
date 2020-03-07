DELIMITER // 
CREATE PROCEDURE InsereClientePessoa(IN pcpf varchar(11), IN email varchar(50)) 
BEGIN 
	DECLARE _id INT;
	
	if (pcpf in (select CPF from Pessoa where idCliente is null) )
    Then
    
		insert into Cliente(email) values (email);
		SELECT last_insert_id() from Cliente limit 1 into _id;
	
        
        update Pessoa
        set Pessoa.idCliente =  _id
        where pcpf = Pessoa.CPF;
        
        
        
        
        
        
     else
		if pcpf not in (select CPF from Pessoa) then SIGNAL SQLSTATE '45000' SET message_text = 'Pessoa não cadastrada, insira-a antes de torná-la cliente'; 
        else
			SIGNAL SQLSTATE '45000' SET message_text = 'Esta empresa já é um cliente';
		end if;
     end if;   
     
     


END // 
DELIMITER ; 
-- drop procedure InsereClientePessoa;

DELIMITER // 
CREATE PROCEDURE InsereClienteEmpresa(IN pcnpj varchar(20), IN email varchar(50)) 
BEGIN 
	DECLARE _id INT;
	
	if (pcnpj in (select CNPJ from Empresa where idCliente is null) )
    Then
		insert into Cliente(email) values (email);
        
		SELECT last_insert_id() from Cliente limit 1 into _id;
        
        update Empresa
        set Empresa.idCliente =  _id
        where pcnpj = Empresa.CNPJ;
        
        
        
        
        
        
     else
		if pcnpj not in (select CNPJ from Empresa) then SIGNAL SQLSTATE '45000' SET message_text = 'Empresa não cadastrada, insira-a antes de torná-la cliente'; 
        else
			SIGNAL SQLSTATE '45000' SET message_text = 'Esta empresa já é um cliente';
		end if;
     end if;   
     
     


END // 
DELIMITER ; 
-- drop procedure InsereClienteEmpresa;

DELIMITER // 
CREATE PROCEDURE FuncionarioDoMes() 
BEGIN 
DECLARE _cpf VARCHAR(11);
DECLARE _cont INT;
	select `CPF Pessoa`, count(*) as servicos from trabalhou group by `CPF Pessoa` ORDER by servicos DESC  limit 1 into _cpf, _cont; 
    
     UPDATE Funcionario
     SET `Salário` = `Salário`+200
     WHERE `CPF Pessoa`= _cpf;
     
	
END // 
DELIMITER ; 
-- drop procedure FuncionarioDoMes;
call FuncionarioDoMes();

DELIMITER $$
CREATE TRIGGER after_Pessoa_delete
AFTER DELETE ON Pessoa
FOR EACH ROW
BEGIN
  delete from cliente
  where old.idCliente = cliente.idCliente;
END $$
DELIMITER ;
-- drop trigger after_Pessoa_delete;

DELIMITER $$
CREATE TRIGGER before_Salario_alterado
BEFORE UPDATE ON Funcionario
FOR EACH ROW
BEGIN
	IF (new.`Salário`!= old.`Salário`) then	
    set new.`Impostos` = old.`Impostos`* new.`Salário` / old.`Salário`;
    
    END IF;
END $$
DELIMITER ;
-- drop trigger after_Salario_alterado;

DELIMITER $$
CREATE TRIGGER after_Servico_delete
BEFORE DELETE ON `Serviço`
FOR EACH ROW
BEGIN
	UPDATE Funcionario 
    set `Salário` = `Salário` -100 
    where `CPF Pessoa`  in (select `CPF Pessoa` as Q
	from trabalhou
	group by `CPF Pessoa` 
	having Q < 4);
END $$
DELIMITER ;
-- drop trigger after_Salario_alterado;



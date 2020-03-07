use Agropadua;


select *from  `Pessoa`;
select *from `Cliente`;
select *from  `empresa`;
select *from  `equipamentos`;
select *from  `telefone cliente`;
select *from  `Funcionario`;
select *from `Cliente`;
select *from `Uso equipamento`;
select *from  `equipamentos`;

-- updates 
update `Pessoa`
set `Nome`='Luiz Calvo'
where  `CPF` ='00000000000';

update  `equipamentos`
set `Preço` = `Preço` * 1.05
where `ID` > 0;

update `empresa`
set `Nome fantasia`='NOMEFANTASIA10'
where  `CNPJ`='00000000000000000001';

update `telefone cliente`
set `Telefone`='(11)94002-8922'
where `idCliente`=1;

update Cliente
set idCliente = 11
where idCliente = 1;

update Funcionario
set `Salário` = `Salário` +300
where `CPF Pessoa`='00000000002';


-- delete 

delete from `Uso veículo`
where `idServiço`=1;


delete from `Manutenção`
where `Placa Veículo`='aaa1111';

delete from `Uso equipamento` -- deletar todo equipamento da tabela uso equipamento com o id maior que 4 
where `id Equipamento` in ( select `ID` 
							from  `equipamentos`
                            where `ID` > 4);
						
delete from Cliente
where idCliente= 11;

delete from Empresa
Where CNPJ = '00000000000000000007';

delete from `Serviço`
where `Data`= '12/04/2006';
							
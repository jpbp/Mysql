-- retorna valor do estoque por produto

select `Descrição` , sum(estoque * `Preço`) as `valor de estoque`
from Produto 
group by `Código`;

-- retorna historico de manutencoes dos `Veículo`s

select placa , `Razão social` as Oficina, `Tipo de serviço`
from `Veículo` as v , `Manutenção` as m ,oficina as o,empresa as e
where v.placa = m.`Placa Veículo` and m.` CNPJ Oficina` = o.`CNPJ Empresa` and o.`CNPJ Empresa` = e.cnpj;

-- retorna dados dos forncedores 
select  `CNPJ Empresa`, `Endereço Fornecedor`.`Endereço`, Email, Website, Contato
from `Endereço Fornecedor` , fornecedor , `Contato Fornecedor`
where `Endereço Fornecedor`.`CNPJ fornecedor` = fornecedor.`CNPJ Empresa` AND `Contato Fornecedor`.`CNPJ fornecedor`= fornecedor.`CNPJ Empresa` ;

-- retorna funcionarios que se chamam jose
select cpf , `Salário`
from funcionario as f , pessoa as p
where p.nome like "%jose%" and p.cpf = f.`CPF Pessoa`;

-- retorna quantos funcionarios trabalharam em cada `Serviço`
select t.`idServiço` , count(`CPF Pessoa`) as `qtdeFuncionarios`
from trabalhou as t , `Serviço` as s
where t.`idServiço` = s.`idServiço`
group by t.`idServiço`;

-- retorna os fornecedores que também sao clientes
select `Razão social`  
from cliente as c , empresa as e
where c.idCliente = e.idCliente and `Razão social`
in(
select `Razão social` 
from empresa as e , fornecedor as f
where e.cnpj = f.`CNPJ Empresa`);

-- retorna cpf de funcionarios que trabalharam em mais de 4 `Serviço`s e quantos serviços foram
select `CPF Pessoa` , count(`idServiço`) as Q
from trabalhou
group by `CPF Pessoa` 
having Q > 4;

-- retorna somatorio dos valores recebidos pela empresa
select sum(valor) as `total recebimentos` from `Serviço`;

-- retorna os equipamentos e quantas vezes foram usados
select nome, count(*) as VezesUsadas
from Equipamentos as e left join `Uso equipamento` as ue ON e.ID = ue.`id Equipamento` group by nome Order by VezesUsadas DESC;

-- retorna os nomes dos funcionários, quantos serviços fizeram e o seu faturamento médio (em ordem decrescente)
select nome, count(*) as Servicos, AVG(Valor) as FaturamentoMedio
from Pessoa as p, trabalhou as t , `Serviço` as s
where p.CPF = t.`CPF Pessoa` and t.`idServiço` = s.`idServiço`
GROUP BY nome order by FaturamentoMedio DESC;

-- retorna os produtos por ordem de maior utilização e a quantidade do mesmo disponível em estoque

select `Descrição`, count(up.` Código Produto`) as `Vezes Utilizadas`, estoque
from Produto as p, `Uso produto` as up
where p.`Código` = up.` Código Produto`
group by up.` Código Produto`;

-- retorna os veículos que não foram utilizados para nenhum serviço


select Placa
from `Veículo` as v left join `Uso veículo` as uv ON v.Placa = uv.`Placa veículo`
where `idServiço` IS NULL ;



create view clienteInfo as
select c.idCliente as ID,
        email,
        telefone,
        `Endereço`
from cliente as c,`telefone cliente`as t,`Endereço cliente` as e
where c.idCliente = t.idCliente and c.idCliente = e.idCliente;

select * from clienteInfo;

create view historicoFuncionario as
select f.`CPF Pessoa` as CPF,
        s.`idServiço`,
        `Data`,
        Hora
from funcionario as f , trabalhou as t ,  `Serviço` as s
where f.`CPF Pessoa` = t.`CPF Pessoa` and t.`idServiço` =  s.`idServiço`;

select * from historicoFuncionario;

drop view historicoVeiculos;
create view historicoVeiculos as
select
    s.`idServiço`,
    placa,
    `Data`,
    Hora
from `Serviço` as s , `Veículo` as v , `Uso veículo` as uv
where v.placa = uv.`Placa veículo` and uv.`idServiço` = s.`idServiço`
ORDER BY s.`idServiço` ASC ;

select * from historicoVeiculos;

-- -----------------------------------------------------
-- Inserção de Pessoas
-- -----------------------------------------------------

INSERT INTO Pessoa
VALUES ('00000000000','Jose da Silva Bezerra',NULL);

INSERT INTO Pessoa
VALUES ('00000000001','pessoa1',NULL);

INSERT INTO Pessoa
VALUES ('00000000002','pessoa2',NULL);

INSERT INTO Pessoa
VALUES ('00000000003','pessoa3',NULL);

INSERT INTO Pessoa
VALUES ('00000000004','pessoa4',NULL);

INSERT INTO Pessoa
VALUES ('00000000005','pessoa5',NULL);

INSERT INTO Pessoa
VALUES ('00000000006','pessoa6',NULL);

INSERT INTO Pessoa
VALUES ('00000000007','pessoa7',NULL);

INSERT INTO Pessoa
VALUES ('00000000008','pessoa8',NULL);

INSERT INTO Pessoa
VALUES ('00000000009','pessoa9',NULL);


-- -----------------------------------------------------
-- Inserção de Empresas
-- -----------------------------------------------------

INSERT INTO Empresa
VALUES ('00000000000000000001',NULL,'razaosocial1', 'nomefantasia1' );

INSERT INTO Empresa
VALUES ('00000000000000000002',NULL,'razaosocial2', 'nomefantasia2' );

INSERT INTO Empresa
VALUES ('00000000000000000003',NULL,'razaosocial3', 'nomefantasia3' );

INSERT INTO Empresa
VALUES ('00000000000000000004',NULL,'razaosocial4', 'nomefantasia4' );

INSERT INTO Empresa
VALUES ('00000000000000000005',NULL,'razaosocial5', 'nomefantasia5' );

INSERT INTO Empresa
VALUES ('00000000000000000006',NULL,'razaosocial6', 'nomefantasia6' );

INSERT INTO Empresa
VALUES ('00000000000000000007',NULL,'razaosocial7', 'nomefantasia7' );

INSERT INTO Empresa
VALUES ('00000000000000000008',NULL,'razaosocial8', 'nomefantasia8' );

INSERT INTO Empresa
VALUES ('00000000000000000009',NULL,'razaosocial9', 'nomefantasia9' );


-- -----------------------------------------------------
-- Inserção de Clientes
-- -----------------------------------------------------

call InsereClienteEmpresa ('00000000000000000001', 'empresa1@email.com');
call InsereClienteEmpresa ('00000000000000000002', 'empresa2@email.com');
call InsereClienteEmpresa ('00000000000000000003', 'empresa3@email.com');
call InsereClienteEmpresa ('00000000000000000004', 'empresa4@email.com');

call InsereClientePessoa ('00000000004', 'pessoa1@emai4.com');
call InsereClientePessoa ('00000000005', 'pessoa1@emai5.com');
call InsereClientePessoa ('00000000006', 'pessoa1@emai6.com');
-- -----------------------------------------------------
-- Inserção de Funcionários
-- -----------------------------------------------------

INSERT INTO Funcionario
VALUES ('00000000000','200.00','4500.00','300','26/03/1999');

INSERT INTO Funcionario
VALUES ('00000000001','250','3500.00','400.00','26/05/2001');

INSERT INTO Funcionario
VALUES ('00000000002','200','300.00','300.00','10/03/2010');

INSERT INTO Funcionario
VALUES ('00000000003','250','3500.00','400.00','26/02/2015');

-- -----------------------------------------------------
-- Inserção de Fornecedor
-- -----------------------------------------------------
INSERT INTO `Fornecedor`
VALUES ('00000000000000000004', 'empresa4@email.com', 'www.empresa4.com');
INSERT INTO `Fornecedor`
VALUES ('00000000000000000005', 'empresa5@email.com', 'www.empresa5.com');
INSERT INTO `Fornecedor`
VALUES ('00000000000000000006', 'empresa6@email.com', 'www.empresa6.com');

-- -----------------------------------------------------
-- Inserção de Oficina
-- -----------------------------------------------------
INSERT INTO Oficina
VALUES ('00000000000000000007', 'Lanternagem', 'Rua da lanternagem, 7');
INSERT INTO Oficina
VALUES ('00000000000000000008', 'Motor', 'Rua do Motor, 8');
INSERT INTO Oficina
VALUES ('00000000000000000009', 'Autoelétrica', 'Rua da Autoelétrica, 9');


-- -----------------------------------------------------
-- Inserçaõ de `Endereço cliente`
-- -----------------------------------------------------

INSERT INTO `Endereço cliente`
VALUES (1, 'Rua do Cliente 1, 99');
INSERT INTO `Endereço cliente`
VALUES (2, 'Rua do Cliente 2, 99');
INSERT INTO `Endereço cliente`
VALUES (3, 'Rua do Cliente 3, 99');
INSERT INTO `Endereço cliente`
VALUES (3, 'Rua do Cliente 3, 100');
INSERT INTO `Endereço cliente`
VALUES (4, 'Rua do Cliente 4, 99');
INSERT INTO `Endereço cliente`
VALUES (5, 'Rua do Cliente 5, 99');
INSERT INTO `Endereço cliente`
VALUES (6, 'Rua do Cliente 6, 99');
INSERT INTO `Endereço cliente`
VALUES (6, 'Rua do Cliente 6, 100');


-- -----------------------------------------------------
-- iNSERÇÃO DE `telefone cliente`
-- -----------------------------------------------------

INSERT INTO `telefone cliente`
VALUES (1, '(35)99999-1111');
INSERT INTO `telefone cliente`
VALUES (2, '(35)99999-2222');
INSERT INTO `telefone cliente`
VALUES (2, '(35)98888-2222');
INSERT INTO `telefone cliente`
VALUES (3, '(35)98888-3333');
INSERT INTO `telefone cliente`
VALUES (4, '(35)98888-4444');
INSERT INTO `telefone cliente`
VALUES (5, '(35)98888-5555');
INSERT INTO `telefone cliente`
VALUES (6, '(35)98888-6666');


-- -----------------------------------------------------
-- Inserção de`Endereço fornecedor`
-- -----------------------------------------------------

INSERT INTO `Endereço fornecedor`
VALUES ('00000000000000000004', 'R. do Fornecedor 4, 10');
INSERT INTO `Endereço fornecedor`
VALUES ('00000000000000000005', 'R. do Fornecedor 5, 10');
INSERT INTO `Endereço fornecedor`
VALUES ('00000000000000000005', 'R. do Fornecedor 5, 11');
INSERT INTO `Endereço fornecedor`
VALUES ('00000000000000000006', 'R. do Fornecedor 6, 10');



-- -----------------------------------------------------
-- Insereção de`Contato fornecedor`
-- -----------------------------------------------------

INSERT INTO `Contato fornecedor`
VALUES ('00000000000000000006', 'Joao da silva');
INSERT INTO `Contato fornecedor`
VALUES ('00000000000000000006', 'Maria Aparecida');
INSERT INTO `Contato fornecedor`
VALUES ('00000000000000000005', 'Jose de Souza');
INSERT INTO `Contato fornecedor`
VALUES ('00000000000000000004', 'Antonio de Oliveira');


-- -----------------------------------------------------
-- Inserção de  `Telefone Oficina`
-- -----------------------------------------------------

INSERT INTO `Telefone Oficina`
VALUES ('00000000000000000007', '(35)99999-7777');
INSERT INTO `Telefone Oficina`
VALUES ('00000000000000000008', '(35)99999-8888');
INSERT INTO `Telefone Oficina`
VALUES ('00000000000000000009', '(35)99999-9999');
INSERT INTO `Telefone Oficina`
VALUES ('00000000000000000009', '(35)99999-1010');

-- -----------------------------------------------------
-- Inserção de`Produto`
-- -----------------------------------------------------
INSERT INTO Produto
VALUES (1, 'Inseticida', '105.99', 10);
INSERT INTO Produto
VALUES (2, 'Raticida', '99.99', 20);
INSERT INTO Produto
VALUES (3, 'Inseticida', '33.99', 30);
INSERT INTO Produto
VALUES (4, 'Raticida', '44.99', 5);
INSERT INTO Produto
VALUES (5, 'Inseticida', '105.99',12);
INSERT INTO Produto
VALUES (6, 'Raticida', '79.99', 21);
INSERT INTO Produto
VALUES (7, 'Inseticida', '133.99', 2);
INSERT INTO Produto
VALUES (8, 'Raticida', '54.99', 20);





-- -----------------------------------------------------
-- Inserção de Equipamentos
-- -----------------------------------------------------

INSERT INTO Equipamentos
VALUES (1,'Motosserra','250.00','disponivel');

INSERT INTO Equipamentos
VALUES (2,'Cortador de Grama','350.00','indisponivel');

INSERT INTO Equipamentos
VALUES (3,'Bomba Costal','disponivel');

INSERT INTO Equipamentos
VALUES (4,'Lança-Chamas','indisponivel');

INSERT INTO Equipamentos
VALUES (5,'Roçadeira','220.00','disponivel');

INSERT INTO Equipamentos
VALUES (6,'Furadeira','370.00','indisponivel');

-- -----------------------------------------------------
-- Inserção de Veículos
-- -----------------------------------------------------

INSERT INTO Veículo
VALUES ('aaa1111');

INSERT INTO Veículo
VALUES ('aaa2222');

INSERT INTO Veículo
VALUES ('aaa3333');

INSERT INTO Veículo
VALUES ('aaa4444');

INSERT INTO Veículo
VALUES ('aaa5555');

INSERT INTO Veículo
VALUES ('aaa6666');

INSERT INTO Veículo
VALUES ('aaa7777');

-- -----------------------------------------------------
-- Inserção de `Fornecimentos`
-- -----------------------------------------------------

INSERT INTO `Fornecimentos`
VALUES( 1,'00000000000000000004');
INSERT INTO `Fornecimentos`
VALUES(2,'00000000000000000004');
INSERT INTO `Fornecimentos`
VALUES(3, '00000000000000000004');
INSERT INTO `Fornecimentos`
VALUES(4, '00000000000000000005');
INSERT INTO `Fornecimentos`
VALUES(5, '00000000000000000005');
INSERT INTO `Fornecimentos`
VALUES(6, '00000000000000000006');

-- -----------------------------------------------------
-- Inserção de `Funcionalidades veículos`
-- -----------------------------------------------------


INSERT INTO `Funcionalidades veículos`
VALUES ('aaa1111','alta capacidade de carga');

INSERT INTO `Funcionalidades veículos`
VALUES ('aaa1111','veiculo fechado para uso na chuva');

INSERT INTO `Funcionalidades veículos`
VALUES ('aaa2222','Carrega 5 Passageiros');

INSERT INTO `Funcionalidades veículos`
VALUES ('aaa3333','Econômico');

INSERT INTO `Funcionalidades veículos`
VALUES ('aaa4444','veiculo fechado para uso na chuva');

INSERT INTO `Funcionalidades veículos`
VALUES ('aaa5555','Carrega 5 Passageiros');

INSERT INTO `Funcionalidades veículos`
VALUES ('aaa6666','Econômico');

-- -----------------------------------------------------
-- Inserçao de `Manutenção`
-- -----------------------------------------------------

INSERT INTO `Manutenção`
VALUES('00000000000000000007', 'aaa1111');
INSERT INTO `Manutenção`
VALUES('00000000000000000008', 'aaa2222');
INSERT INTO `Manutenção`
VALUES('00000000000000000009', 'aaa2222');
INSERT INTO `Manutenção`
VALUES('00000000000000000008', 'aaa3333');
INSERT INTO `Manutenção`
VALUES('00000000000000000009', 'aaa4444');


-- -----------------------------------------------------
-- Inserção de``Serviço``
-- -----------------------------------------------------

INSERT INTO `Serviço`
VALUES (1,1,'12/04/2006','10:00','remocao de vespeiro','2500.00','`Serviço` único');

INSERT INTO `Serviço`
VALUES (2,1,'16/07/2010','15:00','controle de abelhas','3500.00','trimestral');

INSERT INTO `Serviço`
VALUES (3,2,'02/08/2009','16:00','infestação de ratos','5000.00','`Serviço` único');

INSERT INTO `Serviço`
VALUES (4,3,'12/05/2006','10:00','remocao de vespeiro','2500.00','`Serviço` único');

INSERT INTO `Serviço`
VALUES (5,4,'16/02/2010','15:00','controle de abelhas','3500.00','trimestral');

INSERT INTO `Serviço`
VALUES (6,5,'02/04/2009','16:00','infestação de ratos','5000.00','`Serviço` único');

INSERT INTO `Serviço`
VALUES (7,6,'12/03/2006','10:00','remocao de vespeiro','2500.00','`Serviço` único');

INSERT INTO `Serviço`
VALUES (8,5,'16/01/2010','15:00','controle de abelhas','3500.00','biimestral');

INSERT INTO `Serviço`
VALUES (9,6,'02/12/2009','16:00','infestação de ratos','5000.00','`Serviço` único');

INSERT INTO `Serviço`
VALUES (10,1,'15/04/2006','10:00','remocao de vespeiro','2500.00','`Serviço` único');

INSERT INTO `Serviço`
VALUES (11,2,'16/07/2011','15:00','controle de abelhas','3500.00','biimestral');

INSERT INTO `Serviço`
VALUES (12,4,'07/08/2009','16:00','infestação de ratos','5000.00','`Serviço` único');

INSERT INTO `Serviço`
VALUES (13,6,'16/07/2011','16:00','controle de abelhas','5000.00','`Serviço` único');

-- -----------------------------------------------------
-- Inserção de`Uso equipamento`
-- -----------------------------------------------------

INSERT INTO `Uso equipamento`
VALUES (2, 1);
INSERT INTO `Uso equipamento`
VALUES (2, 2);
INSERT INTO `Uso equipamento`
VALUES (3, 4);
INSERT INTO `Uso equipamento`
VALUES (1, 5);
INSERT INTO `Uso equipamento`
VALUES (6, 1);
INSERT INTO `Uso equipamento`
VALUES (6, 4);
INSERT INTO `Uso equipamento`
VALUES (1, 11);


-- -----------------------------------------------------
-- Inserção de`Uso veículo`
-- -----------------------------------------------------
INSERT INTO `Uso veículo`
VALUES (1, 'aaa1111');
INSERT INTO `Uso veículo`
VALUES (2, 'aaa1111');
INSERT INTO `Uso veículo`
VALUES (3, 'aaa1111');
INSERT INTO `Uso veículo`
VALUES (4, 'aaa6666');
INSERT INTO `Uso veículo`
VALUES (5, 'aaa1111');
INSERT INTO `Uso veículo`
VALUES (6, 'aaa3333');
INSERT INTO `Uso veículo`
VALUES (7, 'aaa1111');
INSERT INTO `Uso veículo`
VALUES (8, 'aaa2222');
INSERT INTO `Uso veículo`
VALUES (9, 'aaa4444');
INSERT INTO `Uso veículo`
VALUES (10, 'aaa1111');
INSERT INTO `Uso veículo`
VALUES (11, 'aaa5555');
INSERT INTO `Uso veículo`
VALUES (12, 'aaa1111');



-- -----------------------------------------------------
-- Table `Uso produto`
-- -----------------------------------------------------

INSERT INTO `Uso produto`
VALUES (1, 1);
INSERT INTO `Uso produto`
VALUES (1, 2);
INSERT INTO `Uso produto`
VALUES (2, 3);
INSERT INTO `Uso produto`
VALUES (3, 4);
INSERT INTO `Uso produto`
VALUES (4, 10);
INSERT INTO `Uso produto`
VALUES (5, 11);
INSERT INTO `Uso produto`
VALUES (5, 9);
INSERT INTO `Uso produto`
VALUES (7, 5);
INSERT INTO `Uso produto`
VALUES (2, 11);
INSERT INTO `Uso produto`
VALUES (1, 4);
INSERT INTO `Uso produto`
VALUES (2, 7);
INSERT INTO `Uso produto`
VALUES (3, 5);
INSERT INTO `Uso produto`
VALUES (8, 10);
INSERT INTO `Uso produto`
VALUES (3, 11);
INSERT INTO `Uso produto`
VALUES (6, 9);
INSERT INTO `Uso produto`
VALUES (8, 5);



-- -----------------------------------------------------
-- Table `Trabalhou`
-- -----------------------------------------------------


INSERT INTO `Trabalhou` (`CPF Pessoa`, `idServiço`)
VALUES('00000000000', 1);
INSERT INTO `Trabalhou`
VALUES('00000000000', 2);
INSERT INTO `Trabalhou`
VALUES('00000000000', 3);
INSERT INTO `Trabalhou`
VALUES('00000000000', 4);
INSERT INTO `Trabalhou`
VALUES('00000000001', 3);
INSERT INTO `Trabalhou`
VALUES('00000000001', 5);
INSERT INTO `Trabalhou`
VALUES('00000000001', 6);
INSERT INTO `Trabalhou`
VALUES('00000000001', 7);
INSERT INTO `Trabalhou`
VALUES('00000000002', 8);
INSERT INTO `Trabalhou`
VALUES('00000000002', 9);
INSERT INTO `Trabalhou`
VALUES('00000000002', 1);
INSERT INTO `Trabalhou`
VALUES('00000000003', 10);
INSERT INTO `Trabalhou`
VALUES('00000000002', 11);
INSERT INTO `Trabalhou`
VALUES('00000000002', 12);
INSERT INTO `Trabalhou`
VALUES('00000000002', 4);





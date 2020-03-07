-- MySQL Workbench Forward Engineering

drop schema Agropadua;
create schema Agropadua;


SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema trabalhoPratico
-- -----------------------------------------------------

use Agropadua;


-- -----------------------------------------------------
-- Table `Cliente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Cliente` (
  `idCliente` INT NOT NULL AUTO_INCREMENT,
  `Email` VARCHAR(50) NULL UNIQUE,
  PRIMARY KEY (`idCliente`))
ENGINE = InnoDB;


-- Table `Pessoa`
-- -----------------------------------------------------

CREATE TABLE IF NOT EXISTS `Pessoa` (
  `CPF` VARCHAR(11) NOT NULL,
  `Nome` VARCHAR(60) NOT NULL,
  `idCliente` INT NULL,
  PRIMARY KEY (`CPF`),
  INDEX `fk_Pessoa_Cliente1_idx` (`idCliente` ASC),
  CONSTRAINT `fk_Pessoa_Cliente1`
    FOREIGN KEY (`idCliente`)
    REFERENCES `Cliente` (`idCliente`)
    ON DELETE SET NULL
    ON UPDATE CASCADE)
ENGINE = InnoDB;



-- -----------------------------------------------------
-- Table `Empresa`
-- -----------------------------------------------------

CREATE TABLE IF NOT EXISTS `Empresa` (
    `CNPJ` VARCHAR(20) NOT NULL,
    `idCliente` INT NULL,
    `Razão social` VARCHAR(60) NOT NULL,
    `Nome fantasia` VARCHAR(60) NULL,
    PRIMARY KEY (`CNPJ`),
    INDEX `fk_Empresa_Cliente1_idx` (`idCliente` ASC),
    CONSTRAINT `fk_Empresa_Cliente1` FOREIGN KEY (`idCliente`)
        REFERENCES `Cliente` (`idCliente`)
        ON DELETE SET NULL 
        ON UPDATE CASCADE
)  ENGINE=INNODB;




-- -----------------------------------------------------
-- Table `Funcionário`
-- -----------------------------------------------------

CREATE TABLE IF NOT EXISTS `Funcionario` (
  `CPF Pessoa` VARCHAR(11) NOT NULL,
  `Impostos` DECIMAL(8,2) NULL,
  `Salário` DECIMAL(8,2) NULL,
  `Outros` VARCHAR(45) NULL,
  `Data Contratação` VARCHAR(45) NULL,
  INDEX `fk_Funcionário_Pessoa1_idx` (`CPF Pessoa` ASC),
  PRIMARY KEY (`CPF Pessoa`),
  CONSTRAINT `fk_Funcionário_Pessoa1`
    FOREIGN KEY (`CPF Pessoa`)
    REFERENCES `Pessoa` (`CPF`)
    ON DELETE CASCADE
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `Fornecedor`
-- -----------------------------------------------------



CREATE TABLE IF NOT EXISTS `Fornecedor` (
  `CNPJ empresa` VARCHAR(20) NOT NULL,
  `Email` VARCHAR(50) NOT NULL,
  `Website` VARCHAR(60) NULL,
  PRIMARY KEY (`CNPJ empresa`),
  INDEX `fk_Fornecedor_Empresa_idx` (`CNPJ empresa` ASC),
  CONSTRAINT `fk_Fornecedor_Empresa`
    FOREIGN KEY (`CNPJ empresa`)
    REFERENCES `Empresa` (`CNPJ`)
    ON DELETE CASCADE
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `Oficina`
-- -----------------------------------------------------

CREATE TABLE IF NOT EXISTS `Oficina` (
  `CNPJ Empresa` VARCHAR(20) NOT NULL,
  `Tipo de serviço` VARCHAR(40) NULL,
  `Endereço` VARCHAR(150) NULL,
  INDEX `fk_Oficina_Empresa1_idx` (`CNPJ Empresa` ASC),
  PRIMARY KEY (`CNPJ Empresa`),
  CONSTRAINT `fk_Oficina_Empresa1`
    FOREIGN KEY (`CNPJ Empresa`)
    REFERENCES `Empresa` (`CNPJ`)
    ON DELETE CASCADE
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Endereço cliente`
-- -----------------------------------------------------

CREATE TABLE IF NOT EXISTS `Endereço cliente` (
  `idCliente` INT NOT NULL,
  `Endereço` VARCHAR(150) NOT NULL,
  INDEX `fk_Endereço cliente_Cliente1_idx` (`idCliente` ASC),
  PRIMARY KEY (`idCliente`, `Endereço`),
  CONSTRAINT `fk_Endereço cliente_Cliente1`
    FOREIGN KEY (`idCliente`)
    REFERENCES `Cliente` (`idCliente`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `telefone cliente`
-- -----------------------------------------------------

CREATE TABLE IF NOT EXISTS `telefone cliente` (
  `idCliente` INT NOT NULL,
  `Telefone` VARCHAR(45) NOT NULL,
  INDEX `fk_telefone cliente_Cliente1_idx` (`idCliente` ASC),
  PRIMARY KEY (`idCliente`, `Telefone`),
  CONSTRAINT `fk_telefone cliente_Cliente1`
    FOREIGN KEY (`idCliente`)
    REFERENCES `Cliente` (`idCliente`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;




-- -----------------------------------------------------
-- Table `Endereço fornecedor`
-- -----------------------------------------------------

CREATE TABLE IF NOT EXISTS `Endereço fornecedor` (
  `CNPJ fornecedor` VARCHAR(20) NOT NULL,
  `Endereço` VARCHAR(150) NOT NULL,
  INDEX `fk_Endereço fornecedor_Fornecedor1_idx` (`CNPJ fornecedor` ASC),
  PRIMARY KEY (`CNPJ fornecedor`, `Endereço`),
  CONSTRAINT `fk_Endereço fornecedor_Fornecedor1`
    FOREIGN KEY (`CNPJ fornecedor`)
    REFERENCES `Fornecedor` (`CNPJ empresa`)
    ON DELETE CASCADE
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Contato fornecedor`
-- -----------------------------------------------------

CREATE TABLE IF NOT EXISTS `Contato fornecedor` (
  `CNPJ fornecedor` VARCHAR(20) NOT NULL,
  `Contato` VARCHAR(45) NOT NULL,
  INDEX `fk_Contato fornecedor_Fornecedor1_idx` (`CNPJ fornecedor` ASC),
  PRIMARY KEY (`CNPJ fornecedor`, `Contato`),
  CONSTRAINT `fk_Contato fornecedor_Fornecedor1`
    FOREIGN KEY (`CNPJ fornecedor`)
    REFERENCES `Fornecedor` (`CNPJ empresa`)
    ON DELETE CASCADE
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Telefone Oficina`
-- -----------------------------------------------------


CREATE TABLE IF NOT EXISTS `Telefone Oficina` (
  `CNPJ oficina` VARCHAR(20) NOT NULL,
  `Telefone` VARCHAR(45) NOT NULL,
  INDEX `fk_Telefone Oficina_Oficina1_idx` (`CNPJ oficina` ASC),
  PRIMARY KEY (`CNPJ oficina`, `Telefone`),
  CONSTRAINT `fk_Telefone Oficina_Oficina1`
    FOREIGN KEY (`CNPJ oficina`)
    REFERENCES `Oficina` (`CNPJ Empresa`)
    ON DELETE CASCADE
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------









-- -----------------------------------------------------
-- Table `Produto`
-- -----------------------------------------------------

CREATE TABLE IF NOT EXISTS `Produto` (
  `Código` INT NOT NULL auto_increment,
  `Descrição` VARCHAR(45) NULL,
  `Preço` DECIMAL(8,2) NOT NULL,
  `Estoque` INT NOT NULL,
  PRIMARY KEY (`Código`))
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `Equipamentos`
-- -----------------------------------------------------

CREATE TABLE IF NOT EXISTS `Equipamentos` (
  `ID` INT NOT NULL auto_increment,
  `nome` VARCHAR(20) NULL,
  `preco` DECIMAL(8,2) NULL,
  `situacao` VARCHAR(45) NULL DEFAULT 'Disponível',
  PRIMARY KEY (`ID`))
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `Veículo`
-- -----------------------------------------------------

CREATE TABLE IF NOT EXISTS `Veículo` (
  `Placa` VARCHAR(7) NOT NULL,
  PRIMARY KEY (`Placa`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Fornecimentos`
-- -----------------------------------------------------

CREATE TABLE IF NOT EXISTS `Fornecimentos` (
  `Código produto` INT NOT NULL,
  `CNPJ fornecedor` VARCHAR(20) NOT NULL,
  
  INDEX `fk_Produto_has_Fornecedor_Fornecedor1_idx` (`CNPJ fornecedor` ASC),
  INDEX `fk_Produto_has_Fornecedor_Produto1_idx` (`Código produto` ASC),
  CONSTRAINT `fk_Produto_has_Fornecedor_Produto1`
    FOREIGN KEY (`Código produto`)
    REFERENCES `Produto` (`Código`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Produto_has_Fornecedor_Fornecedor1`
    FOREIGN KEY (`CNPJ fornecedor`)
    REFERENCES `Fornecedor` (`CNPJ empresa`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
PRIMARY KEY (`Código produto`, `CNPJ fornecedor`))
ENGINE = InnoDB;










-- -----------------------------------------------------
-- Table `Funcionalidades veículos`
-- -----------------------------------------------------

CREATE TABLE IF NOT EXISTS `Funcionalidades veículos` (
  `Veículo_Placa` VARCHAR(7) NOT NULL,
  `Funcionalidade` VARCHAR(150) NOT NULL,
  INDEX `fk_Funcionalidades veículos_Veículo1_idx` (`Veículo_Placa` ASC),
  PRIMARY KEY (`Veículo_Placa`, `Funcionalidade`),
  CONSTRAINT `fk_Funcionalidades veículos_Veículo1`
    FOREIGN KEY (`Veículo_Placa`)
    REFERENCES `Veículo` (`Placa`)
    ON DELETE CASCADE
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Manutenção`
-- -----------------------------------------------------

CREATE TABLE IF NOT EXISTS `Manutenção` (
  ` CNPJ Oficina` VARCHAR(20) NOT NULL,
  `Placa Veículo` VARCHAR(7) NOT NULL,
  PRIMARY KEY (` CNPJ Oficina`, `Placa Veículo`),
  INDEX `fk_Oficina_has_Veículo_Veículo1_idx` (`Placa Veículo` ASC),
  INDEX `fk_Oficina_has_Veículo_Oficina1_idx` (` CNPJ Oficina` ASC),
  CONSTRAINT `fk_Oficina_has_Veículo_Oficina1`
    FOREIGN KEY (` CNPJ Oficina`)
    REFERENCES `Oficina` (`CNPJ Empresa`)
    ON DELETE CASCADE
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Oficina_has_Veículo_Veículo1`
    FOREIGN KEY (`Placa Veículo`)
    REFERENCES `Veículo` (`Placa`)
    ON DELETE CASCADE
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Serviço`
-- -----------------------------------------------------

CREATE TABLE IF NOT EXISTS `Serviço` (
  `idServiço` INT NOT NULL AUTO_INCREMENT,
  `idCliente` INT NOT NULL,
  `Data` VARCHAR(10) NULL,
  `Hora` VARCHAR(6) NULL,
  `Descrição` VARCHAR(300) NULL,
  `Valor` DECIMAL NULL,
  `Periodicidade` VARCHAR(100) NULL,
  PRIMARY KEY (`idServiço`),
  INDEX `fk_Serviço_Cliente1_idx` (`idCliente` ASC),
  CONSTRAINT `fk_Serviço_Cliente1`
    FOREIGN KEY (`idCliente`)
    REFERENCES `Cliente` (`idCliente`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Uso equipamento`
-- -----------------------------------------------------

CREATE TABLE IF NOT EXISTS `Uso equipamento` (
  `id Equipamento` INT NOT NULL,
  `id Serviço` INT NOT NULL,
  PRIMARY KEY (`id Equipamento`, `id Serviço`),
  INDEX `fk_Equipamentos_has_Serviço_Serviço1_idx` (`id Serviço` ASC),
  INDEX `fk_Equipamentos_has_Serviço_Equipamentos1_idx` (`id Equipamento` ASC),
  CONSTRAINT `fk_Equipamentos_has_Serviço_Equipamentos1`
    FOREIGN KEY (`id Equipamento`)
    REFERENCES `Equipamentos` (`ID`)
    ON DELETE CASCADE
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Equipamentos_has_Serviço_Serviço1`
    FOREIGN KEY (`id Serviço`)
    REFERENCES `Serviço` (`idServiço`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Uso veículo`
-- -----------------------------------------------------

CREATE TABLE IF NOT EXISTS `Uso veículo` (
  `idServiço` INT NOT NULL,
  `Placa veículo` VARCHAR(7) NOT NULL,
  PRIMARY KEY (`idServiço`, `Placa veículo`),
  INDEX `fk_Serviço_has_Veículo_Veículo1_idx` (`Placa veículo` ASC),
  INDEX `fk_Serviço_has_Veículo_Serviço1_idx` (`idServiço` ASC),
  CONSTRAINT `fk_Serviço_has_Veículo_Serviço1`
    FOREIGN KEY (`idServiço`)
    REFERENCES `Serviço` (`idServiço`)
    ON DELETE CASCADE
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Serviço_has_Veículo_Veículo1`
    FOREIGN KEY (`Placa veículo`)
    REFERENCES `Veículo` (`Placa`)
    ON DELETE CASCADE
    ON UPDATE RESTRICT)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Uso produto`
-- -----------------------------------------------------

CREATE TABLE IF NOT EXISTS `Uso produto` (
  ` Código Produto` INT NOT NULL,
  `id Serviço` INT NOT NULL,
  PRIMARY KEY (` Código Produto`, `id Serviço`),
  INDEX `fk_Produto_has_Serviço_Serviço1_idx` (`id Serviço` ASC),
  INDEX `fk_Produto_has_Serviço_Produto1_idx` (` Código Produto` ASC),
  CONSTRAINT `fk_Produto_has_Serviço_Produto1`
    FOREIGN KEY (` Código Produto`)
    REFERENCES `Produto` (`Código`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_Produto_has_Serviço_Serviço1`
    FOREIGN KEY (`id Serviço`)
    REFERENCES `Serviço` (`idServiço`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Trabalhou`
-- -----------------------------------------------------

CREATE TABLE IF NOT EXISTS `Trabalhou` (
  `CPF Pessoa` VARCHAR(11) NOT NULL,
  `idServiço` INT NOT NULL,
  INDEX `fk_Funcionário_has_Serviço_Funcionário1_idx` (`CPF Pessoa` ASC),
  INDEX `fk_Funcionário_has_Serviço_Serviço1_idx` (`idServiço` ASC),
  
  
  CONSTRAINT `fk_Funcionário_has_Serviço_Funcionário1`
    FOREIGN KEY (`CPF Pessoa`)
    REFERENCES `Funcionario` (`CPF Pessoa`)
    ON DELETE CASCADE
    ON UPDATE RESTRICT,
  CONSTRAINT `fk_Funcionário_has_Serviço_Serviço1`
    FOREIGN KEY (`idServiço`)
    REFERENCES `Serviço` (`idServiço`)
    ON DELETE cascade
    ON UPDATE CASCADE,
    PRIMARY KEY (`CPF Pessoa`, `idServiço`))
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

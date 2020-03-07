-- phpMyAdmin SQL Dump
-- version 3.3.10
-- http://www.phpmyadmin.net
--
-- Servidor: localhost
-- Tempo de Geração: Out 15, 2011 as 09:18 AM
-- Versão do Servidor: 5.1.53
-- Versão do PHP: 5.3.5

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
set foreign_key_checks = 0;
create database Empresa;
use Empresa;

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Banco de Dados: `Empresa`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `DEPARTAMENTO`
--

CREATE TABLE IF NOT EXISTS `DEPARTAMENTO` (
  `Dnome` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `Dnumero` int(11) NOT NULL AUTO_INCREMENT,
  `Cpf_gerente` bigint(11) unsigned zerofill NOT NULL,
  `Data_inicio_gerente` date DEFAULT NULL,
  PRIMARY KEY (`Dnumero`),
  KEY `Cpf_gerente` (`Cpf_gerente`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=6 ;

--
-- Extraindo dados da tabela `DEPARTAMENTO`
--

INSERT INTO `DEPARTAMENTO` (`Dnome`, `Dnumero`, `Cpf_gerente`, `Data_inicio_gerente`) VALUES
('Matriz', 1, 88866555576, '1981-06-19'),
('Administração', 4, 98765432168, '1995-01-01'),
('Pesquisa', 5, 33344555587, '1988-05-22');

-- --------------------------------------------------------

--
-- Estrutura da tabela `DEPENDENTE`
--

CREATE TABLE IF NOT EXISTS `DEPENDENTE` (
  `Fcpf` bigint(11) unsigned zerofill NOT NULL DEFAULT '00000000000',
  `Nome_dependente` varchar(35) COLLATE utf8_unicode_ci NOT NULL,
  `Sexo` enum('m','f') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'f',
  `Datanasc` date DEFAULT NULL,
  `Parente` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`Fcpf`,`Nome_dependente`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Extraindo dados da tabela `DEPENDENTE`
--

INSERT INTO `DEPENDENTE` (`Fcpf`, `Nome_dependente`, `Sexo`, `Datanasc`, `Parente`) VALUES
(12345678966, 'Alicia', 'f', '1988-12-30', 'Filha'),
(12345678966, 'Elizabeth', 'f', '1967-05-05', 'Esposa'),
(12345678966, 'Michael', 'm', '1988-01-04', 'Filho'),
(33344555587, 'Alicia', 'f', '1986-04-05', 'Filha'),
(33344555587, 'Janaína', 'f', '1958-05-03', 'Esposa'),
(33344555587, 'Tiago', 'm', '1983-10-25', 'Filho'),
(98765432168, 'Antônio', 'm', '1942-02-28', 'Marido');

-- --------------------------------------------------------

--
-- Estrutura da tabela `FUNCIONARIO`
--

CREATE TABLE IF NOT EXISTS `FUNCIONARIO` (
  `Pnome` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `Minicial` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Unome` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `Cpf` bigint(11) unsigned zerofill NOT NULL,
  `Datanasc` date DEFAULT NULL,
  `Endereco` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Sexo` enum('m','f') COLLATE utf8_unicode_ci DEFAULT NULL,
  `Salario` float(7,2) DEFAULT NULL,
  `Cpf_supervisor` bigint(11) unsigned zerofill DEFAULT NULL,
  `Dnr` int(11) NOT NULL,
  PRIMARY KEY (`Cpf`),
  KEY `Dnr` (`Dnr`),
  KEY `Cpf_supervisor` (`Cpf_supervisor`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Extraindo dados da tabela `FUNCIONARIO`
--

INSERT INTO `FUNCIONARIO` (`Pnome`, `Minicial`, `Unome`, `Cpf`, `Datanasc`, `Endereco`, `Sexo`, `Salario`, `Cpf_supervisor`, `Dnr`) VALUE
('João', 'P', 'Pna', 44997252832, '1997-12-04', 'Rua primeiro de maio, MG', 'm', 35000.00, 33344555587, 1);

INSERT INTO `FUNCIONARIO` (`Pnome`, `Minicial`, `Unome`, `Cpf`, `Datanasc`, `Endereco`, `Sexo`, `Salario`, `Cpf_supervisor`, `Dnr`) VALUES
('João', 'B', 'Silva', 12345678966, '1965-01-09', 'Rua das Flores, SP', 'm', 30000.00, 33344555587, 5),
('Fernando', 'T', 'Wong', 33344555587, '1955-12-08', 'Rua da Lapa, SP', 'm', 40000.00, 88866555576, 5),
('Joice', 'A', 'Leite', 45345345376, '1972-07-31', 'Av Lucas Obes, SP', 'f', 25000.00, 33344555587, 5),
('Ronaldo', 'K', 'Lima', 66688444476, '1962-09-15', 'Rua Rebouças, SP', 'm', 38000.00, 33344555587, 5),
('Jorge', 'E', 'Brito', 88866555576, '1937-11-10', 'Rua do Horto, SP', 'm', 55000.00, NULL, 1),
('Jennifer', 'S', 'Souza', 98765432168, '1941-06-20', 'Av Arthur de Lima, SP', 'f', 43000.00, 88866555576, 4),
('André', 'V', 'Pereira', 98798798733, '1969-03-29', 'Rua Timbira, SP', 'm', 25000.00, 98765432168, 4),
('Alice', 'J', 'Zelaya', 99988777767, '1968-01-19', 'Rua Souza Lima, PR', 'f', 25000.00, 98765432168, 4);

--
-- Gatilhos `FUNCIONARIO`
--
DROP TRIGGER IF EXISTS `controle_salario`;
DELIMITER //
CREATE TRIGGER `controle_salario` AFTER INSERT ON `FUNCIONARIO`
 FOR EACH ROW IF (NEW.Salario > 50000) THEN 
   INSERT INTO CONTROLE VALUES (NULL, 'FUNCIONARIO', USER(), 'INSERT SALARIO', NOW());
 END IF
//
DELIMITER ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `LOCALIZACAO_DEP`
--

CREATE TABLE IF NOT EXISTS `LOCALIZACAO_DEP` (
  `Dnumero` int(11) NOT NULL DEFAULT '0',
  `Dlocal` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`Dnumero`,`Dlocal`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Extraindo dados da tabela `LOCALIZACAO_DEP`
--

INSERT INTO `LOCALIZACAO_DEP` (`Dnumero`, `Dlocal`) VALUES
(1, 'São Paulo'),
(4, 'Mauá'),
(5, 'Itú'),
(5, 'Santo André'),
(5, 'São Paulo');

-- --------------------------------------------------------

--
-- Estrutura da tabela `PROJETO`
--

CREATE TABLE IF NOT EXISTS `PROJETO` (
  `Projnome` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `Projnumero` int(11) NOT NULL AUTO_INCREMENT,
  `Projlocal` varchar(25) COLLATE utf8_unicode_ci NOT NULL,
  `Dnum` int(11) NOT NULL,
  PRIMARY KEY (`Projnumero`),
  KEY `Dnum` (`Dnum`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=31 ;

--
-- Extraindo dados da tabela `PROJETO`
--

INSERT INTO `PROJETO` (`Projnome`, `Projnumero`, `Projlocal`, `Dnum`) VALUES
('ProdutoX', 1, 'Santo André', 5),
('ProdutoY', 2, 'Itú', 5),
('ProdutoZ', 3, 'São Paulo', 5),
('Informatização', 10, 'Mauá', 4),
('Reorganização', 20, 'São Paulo', 1),
('Novos Benefícios', 30, 'Mauá', 4);

-- --------------------------------------------------------

--
-- Estrutura da tabela `TRABALHA_EM`
--

CREATE TABLE IF NOT EXISTS `TRABALHA_EM` (
  `Fcpf` bigint(11) unsigned zerofill NOT NULL DEFAULT '00000000000',
  `Pnr` int(11) NOT NULL DEFAULT '0',
  `Horas` time DEFAULT NULL,
  PRIMARY KEY (`Fcpf`,`Pnr`),
  KEY `Pnr` (`Pnr`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Extraindo dados da tabela `TRABALHA_EM`
--

INSERT INTO `TRABALHA_EM` (`Fcpf`, `Pnr`, `Horas`) VALUES
(12345678966, 1, '32:30:00'),
(12345678966, 2, '07:30:00'),
(33344555587, 2, '10:00:00'),
(33344555587, 3, '10:00:00'),
(33344555587, 10, '10:00:00'),
(33344555587, 20, '10:00:00'),
(45345345376, 1, '20:00:00'),
(45345345376, 2, '20:00:00'),
(66688444476, 3, '40:00:00'),
(88866555576, 20, NULL),
(98765432168, 20, '15:00:00'),
(98765432168, 30, '20:00:00'),
(98798798733, 10, '35:00:00'),
(98798798733, 30, '05:00:00'),
(99988777767, 10, '10:00:00'),
(99988777767, 30, '30:00:00');

--
-- Restrições para as tabelas dumpadas
--

--
-- Restrições para a tabela `DEPARTAMENTO`
--
ALTER TABLE `DEPARTAMENTO`
  ADD CONSTRAINT `DEPARTAMENTO_ibfk_1` FOREIGN KEY (`Cpf_gerente`) REFERENCES `FUNCIONARIO` (`Cpf`) ON UPDATE CASCADE;

--
-- Restrições para a tabela `DEPENDENTE`
--
ALTER TABLE `DEPENDENTE`
  ADD CONSTRAINT `DEPENDENTE_ibfk_1` FOREIGN KEY (`Fcpf`) REFERENCES `FUNCIONARIO` (`Cpf`);

--
-- Restrições para a tabela `FUNCIONARIO`
--
ALTER TABLE `FUNCIONARIO`
  ADD CONSTRAINT `FUNCIONARIO_ibfk_2` FOREIGN KEY (`Dnr`) REFERENCES `DEPARTAMENTO` (`Dnumero`) ON UPDATE CASCADE,
  ADD CONSTRAINT `FUNCIONARIO_ibfk_3` FOREIGN KEY (`Cpf_supervisor`) REFERENCES `FUNCIONARIO` (`Cpf`) ON UPDATE CASCADE;

--
-- Restrições para a tabela `LOCALIZACAO_DEP`
--
ALTER TABLE `LOCALIZACAO_DEP`
  ADD CONSTRAINT `LOCALIZACAO_DEP_ibfk_1` FOREIGN KEY (`Dnumero`) REFERENCES `DEPARTAMENTO` (`Dnumero`);

--
-- Restrições para a tabela `PROJETO`
--
ALTER TABLE `PROJETO`
  ADD CONSTRAINT `PROJETO_ibfk_1` FOREIGN KEY (`Dnum`) REFERENCES `DEPARTAMENTO` (`Dnumero`);

--
-- Restrições para a tabela `TRABALHA_EM`
--
ALTER TABLE `TRABALHA_EM`
  ADD CONSTRAINT `Pnr_fk` FOREIGN KEY (`Pnr`) REFERENCES `PROJETO` (`Projnumero`),
  ADD CONSTRAINT `TRABALHA_EM_ibfk_1` FOREIGN KEY (`Fcpf`) REFERENCES `FUNCIONARIO` (`Cpf`);


set foreign_key_checks = 1;

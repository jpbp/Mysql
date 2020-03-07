-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema escola
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema escola
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `escola` DEFAULT CHARACTER SET utf8 ;
USE `escola` ;

-- -----------------------------------------------------
-- Table `escola`.`Aluno`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `escola`.`Aluno` (
  `Nome_aluno` VARCHAR(80) NOT NULL,
  `Numero_aluno` INT NOT NULL AUTO_INCREMENT,
  `Tipo_aluno` VARCHAR(45) NOT NULL,
  `Curso` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`Numero_aluno`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `escola`.`Disciplina`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `escola`.`Disciplina` (
  `Nome_disciplina` VARCHAR(50) NOT NULL,
  `Numero_disciplina` VARCHAR(10) NOT NULL,
  `Creditos` INT NOT NULL,
  `Departamento` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`Numero_disciplina`),
  UNIQUE INDEX `Nome_disciplina_UNIQUE` (`Nome_disciplina` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `escola`.`Pre_requisito`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `escola`.`Pre_requisito` (
  `Numero_pre_requisito` VARCHAR(10) NOT NULL,
  `Numero_disciplina` VARCHAR(10) NOT NULL,
  INDEX `fk_Pre_requisito_Disciplina_idx` (`Numero_disciplina` ASC) VISIBLE,
  CONSTRAINT `fk_Pre_requisito_Disciplina`
    FOREIGN KEY (`Numero_disciplina`)
    REFERENCES `escola`.`Disciplina` (`Numero_disciplina`)
    ON DELETE CASCADE
    ON UPDATE NO ACTION)
ENGINE = InnoDB;
 

-- -----------------------------------------------------
-- Table `escola`.`Turma`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `escola`.`Turma` (
  `Id_turma` INT NOT NULL,
  `Semestre` VARCHAR(10) NOT NULL,
  `Ano` VARCHAR(4) NOT NULL,
  `Professor` VARCHAR(45) NOT NULL,
  `Numero_disciplina` VARCHAR(10) NOT NULL,
  PRIMARY KEY (`Id_turma`),
  INDEX `fk_Turma_Disciplina1_idx` (`Numero_disciplina` ASC) VISIBLE,
  CONSTRAINT `fk_Turma_Disciplina1`
    FOREIGN KEY (`Numero_disciplina`)
    REFERENCES `escola`.`Disciplina` (`Numero_disciplina`)
    ON DELETE RESTRICT
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `escola`.`Historico_escolar`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `escola`.`Historico_escolar` (
  `Nota` CHAR(1) NOT NULL,
  `Numero_aluno` INT NOT NULL,
  `Id_turma` INT NOT NULL,
  INDEX `fk_Historico_escolar_Aluno1_idx` (`Numero_aluno` ASC) VISIBLE,
  INDEX `fk_Historico_escolar_Turma1_idx` (`Id_turma` ASC) VISIBLE,
  PRIMARY KEY (`Numero_aluno`, `Id_turma`),
  CONSTRAINT `fk_Historico_escolar_Aluno1`
    FOREIGN KEY (`Numero_aluno`)
    REFERENCES `escola`.`Aluno` (`Numero_aluno`)
    ON DELETE CASCADE
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Historico_escolar_Turma1`
    FOREIGN KEY (`Id_turma`)
    REFERENCES `escola`.`Turma` (`Id_turma`)
    ON DELETE RESTRICT
    ON UPDATE NO ACTION)
ENGINE = InnoDB;



SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;


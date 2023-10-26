-- MySQL Script generated by MySQL Workbench
-- Thu Oct 26 11:06:49 2023
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`Cliente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Cliente` (
  `ID_Cliente` INT NOT NULL COMMENT 'Chave primária do cliente.',
  `Nome_Cliente` VARCHAR(45) NULL COMMENT 'Nome do cliente.',
  `Endereço_Cliente` VARCHAR(45) NULL COMMENT 'Endereço do cliente',
  `Informacoes_Contato_Cliente` VARCHAR(45) NULL COMMENT 'Informações de contato do cliente. E-mail, Telefone Celular, Telefone Fixo.',
  `CEP_Cliente` VARCHAR(45) NULL COMMENT 'Cep do cliente',
  `CPF_Cliente` VARCHAR(45) NULL COMMENT 'CPF do cliente.',
  `RG_Cliente` VARCHAR(45) NULL COMMENT 'RG do cliente.',
  PRIMARY KEY (`ID_Cliente`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Canal de Marketing`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Canal de Marketing` (
  `ID_Canal_de_Marketing` INT NOT NULL COMMENT 'ID do canal de marketing',
  `Nome_Canal` VARCHAR(45) NULL COMMENT 'Nome do canal de marketing',
  `Contato` VARCHAR(45) NULL COMMENT 'Contato do canal de marketing.',
  `Descricao` VARCHAR(45) NULL COMMENT 'Descrição do canal de marketing e projetos.',
  PRIMARY KEY (`ID_Canal_de_Marketing`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Transação`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Transação` (
  `ID-Transacao` INT NOT NULL COMMENT 'ID da transação.',
  `Data_Transacao` VARCHAR(45) NULL COMMENT 'Data de transação.',
  `Cliente_Transacao` VARCHAR(45) NULL COMMENT 'Cliente que cumpriu a transação.',
  `Risco_Residual_Transacao` VARCHAR(45) NULL COMMENT 'Risco residual da transação.',
  `Produtos_Comprados_Transação` VARCHAR(45) NULL COMMENT 'Produtos comprados',
  `Valor_Total_Transacao` VARCHAR(45) NULL COMMENT 'Valor total de transação do projeto',
  PRIMARY KEY (`ID-Transacao`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Projeto`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Projeto` (
  `ID_Projeto` INT NOT NULL COMMENT 'ID do projeto.',
  `Nome_Projeto` VARCHAR(45) NULL COMMENT 'Nome do Projeto',
  `Descricao_Projeto` VARCHAR(45) NULL COMMENT 'Descrição do projeto.\n',
  `Escopo_Inicial_Projeto` VARCHAR(45) NULL COMMENT 'Escopo inicial do projeto.',
  `Preço_Projeto` VARCHAR(45) NULL COMMENT 'Preço do projeto',
  `Categoria_Projeto` VARCHAR(45) NULL COMMENT 'Categoria do projeto',
  `Conclusao_Projeto` VARCHAR(45) NULL COMMENT 'Data limite de entrega do projeto.',
  `Cliente_ID_Cliente` INT NOT NULL,
  PRIMARY KEY (`ID_Projeto`, `Cliente_ID_Cliente`),
  INDEX `fk_Projeto_Cliente1_idx` (`Cliente_ID_Cliente` ASC) VISIBLE,
  CONSTRAINT `fk_Projeto_Cliente1`
    FOREIGN KEY (`Cliente_ID_Cliente`)
    REFERENCES `mydb`.`Cliente` (`ID_Cliente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Campanha de Marketing`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Campanha de Marketing` (
  `ID_Campanha_Marketing` INT NOT NULL COMMENT 'ID da campanha de marketing.',
  `Persona` VARCHAR(45) NOT NULL COMMENT 'Persona do projeto.',
  `Proposta_campanha` VARCHAR(45) NOT NULL COMMENT 'Proposta da campanha de marketing.',
  `Nome_Campanha` VARCHAR(45) NOT NULL COMMENT 'Nome da campanha',
  `Data_Inicio` VARCHAR(45) NOT NULL COMMENT 'Data de início da campanha',
  `Data_Termino` VARCHAR(45) NOT NULL COMMENT 'Data de termino da campanha de marketing.',
  `Descricao` VARCHAR(45) NOT NULL COMMENT 'Descrição da campanha de marketing',
  `Orcamento` VARCHAR(45) NOT NULL COMMENT 'Orçamento da campanha de marketing.',
  `Canal de Marketing_ID_Canal_de_Marketing` INT NOT NULL,
  PRIMARY KEY (`ID_Campanha_Marketing`, `Canal de Marketing_ID_Canal_de_Marketing`),
  INDEX `fk_Campanha de Marketing_Canal de Marketing1_idx` (`Canal de Marketing_ID_Canal_de_Marketing` ASC) VISIBLE,
  CONSTRAINT `fk_Campanha de Marketing_Canal de Marketing1`
    FOREIGN KEY (`Canal de Marketing_ID_Canal_de_Marketing`)
    REFERENCES `mydb`.`Canal de Marketing` (`ID_Canal_de_Marketing`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Funcionário`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Funcionário` (
  `ID_Funcionario` INT NOT NULL COMMENT 'ID do funcionário',
  `Nome_Funcionario` VARCHAR(45) NULL COMMENT 'Nome do funcionário',
  `Endereco_Funcionario` VARCHAR(45) NULL COMMENT 'Endereço do funcionário.',
  `Informações_Funcionário` VARCHAR(45) NULL COMMENT 'Informação do funcionário',
  `CNPJ_Funcionario` VARCHAR(45) NULL COMMENT 'CNPJ do funcionário',
  `CEP_Funcionario` VARCHAR(45) NULL COMMENT 'CEP do funcionário',
  `CPF_Funcionario` VARCHAR(45) NULL COMMENT 'CPF do funcionário',
  `RG_Funcionário` VARCHAR(45) NULL COMMENT 'RG do funcionário',
  `Estado_Social_Funcionario` VARCHAR(45) NULL COMMENT 'Estado social do funcionário',
  `Comprovante_Residencia_Funcionario` VARCHAR(45) NULL COMMENT 'Comprovante de residência do funcionário',
  `Protfólio_Funcionário` VARCHAR(45) NULL COMMENT 'Portfólio do funcionário.',
  `Salario_Funcionario` VARCHAR(45) NULL COMMENT 'Salário do funcionário.',
  `Transação_ID-Transacao` INT NOT NULL COMMENT 'ID de transação do funcionário.',
  `Campanha de Marketing_ID_Campanha_Marketing` INT NOT NULL COMMENT 'ID da campanha de marketing.',
  PRIMARY KEY (`ID_Funcionario`, `Transação_ID-Transacao`, `Campanha de Marketing_ID_Campanha_Marketing`),
  INDEX `fk_Funcionário_Transação1_idx` (`Transação_ID-Transacao` ASC) VISIBLE,
  INDEX `fk_Funcionário_Campanha de Marketing1_idx` (`Campanha de Marketing_ID_Campanha_Marketing` ASC) VISIBLE,
  CONSTRAINT `fk_Funcionário_Transação1`
    FOREIGN KEY (`Transação_ID-Transacao`)
    REFERENCES `mydb`.`Transação` (`ID-Transacao`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Funcionário_Campanha de Marketing1`
    FOREIGN KEY (`Campanha de Marketing_ID_Campanha_Marketing`)
    REFERENCES `mydb`.`Campanha de Marketing` (`ID_Campanha_Marketing`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Campanha de Marketing_has_Projeto`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Campanha de Marketing_has_Projeto` (
  `Campanha de Marketing_ID_Campanha_Marketing` INT NOT NULL COMMENT 'ID da campanha de marketing.',
  `Projeto_ID_Projeto` INT NOT NULL COMMENT 'ID do projeto.',
  PRIMARY KEY (`Campanha de Marketing_ID_Campanha_Marketing`, `Projeto_ID_Projeto`),
  INDEX `fk_Campanha de Marketing_has_Projeto_Projeto1_idx` (`Projeto_ID_Projeto` ASC) VISIBLE,
  INDEX `fk_Campanha de Marketing_has_Projeto_Campanha de Marketing1_idx` (`Campanha de Marketing_ID_Campanha_Marketing` ASC) VISIBLE,
  CONSTRAINT `fk_Campanha de Marketing_has_Projeto_Campanha de Marketing1`
    FOREIGN KEY (`Campanha de Marketing_ID_Campanha_Marketing`)
    REFERENCES `mydb`.`Campanha de Marketing` (`ID_Campanha_Marketing`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Campanha de Marketing_has_Projeto_Projeto1`
    FOREIGN KEY (`Projeto_ID_Projeto`)
    REFERENCES `mydb`.`Projeto` (`ID_Projeto`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

USE `mydb` ;

-- -----------------------------------------------------
-- Placeholder table for view `mydb`.`view1`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`view1` (`id` INT);

-- -----------------------------------------------------
-- View `mydb`.`view1`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`view1`;
USE `mydb`;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
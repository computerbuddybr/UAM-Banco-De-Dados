-- Comandos DDL para a criação somente da tabela CARGOS
-- -----------------------------------------------------
-- Table `construtora`.`CARGOS`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `construtora`.`CARGOS` (
  `pk_cod_cargo` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `cargo` VARCHAR(50) NOT NULL,
  `descricao` VARCHAR(500) NOT NULL,
  `salario` DECIMAL(10,2) NOT NULL,
  PRIMARY KEY (`pk_cod_cargo`));


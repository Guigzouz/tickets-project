-- MySQL Workbench Forward Engineering

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`User`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`User` (
  `idUser` INT NOT NULL,
  PRIMARY KEY (`idUser`));


-- -----------------------------------------------------
-- Table `mydb`.`profile`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`profile` (
  `idUser` INT not NULL,
  `name` VARCHAR(16) NOT NULL,
  `email` VARCHAR(255) NULL,
  `password` VARCHAR(32) NOT NULL,
  `createAt` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
  INDEX `idUser_idx` (`idUser` ASC),
  UNIQUE INDEX `email_UNIQUE` (`email` ASC),
  CONSTRAINT `fk_ProfileidUser`
    FOREIGN KEY (`idUser`)
    REFERENCES `mydb`.`User` (`idUser`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);


-- -----------------------------------------------------
-- Table `mydb`.`Project`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Project` (
  `idProject` INT NOT NULL,
  `title` VARCHAR(50) NULL,
  `description` TEXT NOT NULL,
  `owner` INT NULL DEFAULT CURRENT_TIMESTAMP,
  `createAt` TIMESTAMP NULL,
  PRIMARY KEY (`idProject`),
  INDEX `owner_idx` (`owner` ASC),
  CONSTRAINT `fk_Projectowner`
    FOREIGN KEY (`owner`)
    REFERENCES `mydb`.`User` (`idUser`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);


-- -----------------------------------------------------
-- Table `mydb`.`Ticket`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Ticket` (
  `idTicket` INT NOT NULL,
  `title` VARCHAR(50) NOT NULL,
  `description` TEXT NULL,
  `image` VARCHAR(100) NULL DEFAULT CURRENT_TIMESTAMP,
  `urgenceStatuts` ENUM('client', 'dev', 'chief') NULL,
  `createAt` TIMESTAMP NULL,
  `idProject` INT NULL,
  PRIMARY KEY (`idTicket`),
  INDEX `idProject_idx` (`idProject` ASC),
  CONSTRAINT `fk_TicketidProject`
    FOREIGN KEY (`idProject`)
    REFERENCES `mydb`.`Project` (`idProject`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);


-- -----------------------------------------------------
-- Table `mydb`.`Fix`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Fix` (
  `idUser` INT NOT NULL,
  `idTicket` INT NOT NULL,
  `createAt` TIMESTAMP NOT NULL,
  `commentFix` TEXT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`idUser`, `idTicket`),
  INDEX `idTicket_idx` (`idTicket` ASC),
  CONSTRAINT `fk_FixidUser`
    FOREIGN KEY (`idUser`)
    REFERENCES `mydb`.`User` (`idUser`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_FixidTicket`
    FOREIGN KEY (`idTicket`)
    REFERENCES `mydb`.`Ticket` (`idTicket`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);


-- -----------------------------------------------------
-- Table `mydb`.`invite`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`invite` (
  `idUser` INT NOT NULL,
  `IdProject` INT NOT NULL,
  `role` ENUM('client', 'dev', 'chief') NULL,
  PRIMARY KEY (`idUser`, `IdProject`),
  INDEX `idProject_idx` (`IdProject` ASC),
  CONSTRAINT `fk_InviteidUser`
    FOREIGN KEY (`idUser`)
    REFERENCES `mydb`.`User` (`idUser`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_InviteidProject`
    FOREIGN KEY (`IdProject`)
    REFERENCES `mydb`.`Project` (`idProject`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);
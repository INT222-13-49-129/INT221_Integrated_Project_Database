-- MySQL Script generated by MySQL Workbench
-- Tue Aug 24 16:36:25 2021
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema cfandb
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `cfandb` ;

-- -----------------------------------------------------
-- Schema cfandb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `cfandb` DEFAULT CHARACTER SET utf8 ;
USE `cfandb` ;

-- -----------------------------------------------------
-- Table `cfandb`.`User`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `cfandb`.`User` ;

CREATE TABLE IF NOT EXISTS `cfandb`.`User` (
  `Userid` INT NOT NULL,
  `Username` VARCHAR(50) NOT NULL,
  `Email` VARCHAR(50) NOT NULL,
  `Password` VARCHAR(255) NOT NULL,
  `Firstname` VARCHAR(50) NOT NULL,
  `Lastname` VARCHAR(50) NULL,
  `DoB` DATE NULL,
  `Gender` ENUM('M', 'F') NULL,
  `Weight` DECIMAL(5,2) NULL,
  `Height` DECIMAL(5,2) NULL,
  `Status` ENUM('NORMAL', 'ADMIN') NOT NULL DEFAULT 'NORMAL',
  PRIMARY KEY (`Userid`),
  UNIQUE INDEX `Username_UNIQUE` (`Username` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `cfandb`.`Ingredians`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `cfandb`.`Ingredians` ;

CREATE TABLE IF NOT EXISTS `cfandb`.`Ingredians` (
  `Ingradiansid` INT NOT NULL,
  `Ingradianname` VARCHAR(50) NOT NULL,
  `kcalpunit` INT NULL,
  `Unit` VARCHAR(50) NULL,
  `Descriptionunit` VARCHAR(255) NULL,
  `Ingrediantype` ENUM('Oil', 'Carb', 'Meat', 'Vegetable', 'Fruit', 'Condiment') NOT NULL,
  PRIMARY KEY (`Ingradiansid`),
  UNIQUE INDEX `Ingradianname_UNIQUE` (`Ingradianname` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `cfandb`.`Foodtype`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `cfandb`.`Foodtype` ;

CREATE TABLE IF NOT EXISTS `cfandb`.`Foodtype` (
  `Foodtypeid` INT NOT NULL,
  `Typename` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`Foodtypeid`),
  UNIQUE INDEX `Typename_UNIQUE` (`Typename` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `cfandb`.`Foodmenu`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `cfandb`.`Foodmenu` ;

CREATE TABLE IF NOT EXISTS `cfandb`.`Foodmenu` (
  `Foodmenuid` INT NOT NULL,
  `Foodname` VARCHAR(50) NOT NULL,
  `Totalkal` INT NULL,
  `Image` VARCHAR(255) NULL,
  `Description` VARCHAR(255) NULL,
  `Foodmenustatus` ENUM('PUBLISH', 'PERSONAL') NOT NULL DEFAULT 'PERSONAL',
  `Foodtype_Foodtypeid` INT NOT NULL,
  `User_Userid` INT NULL,
  PRIMARY KEY (`Foodmenuid`),
  UNIQUE INDEX `Foodname_UNIQUE` (`Foodname` ASC) VISIBLE,
  INDEX `fk_Foodmenu_Foodtype1_idx` (`Foodtype_Foodtypeid` ASC) VISIBLE,
  INDEX `fk_Foodmenu_User1_idx` (`User_Userid` ASC) VISIBLE,
  CONSTRAINT `fk_Foodmenu_Foodtype1`
    FOREIGN KEY (`Foodtype_Foodtypeid`)
    REFERENCES `cfandb`.`Foodtype` (`Foodtypeid`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Foodmenu_User1`
    FOREIGN KEY (`User_Userid`)
    REFERENCES `cfandb`.`User` (`Userid`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `cfandb`.`Meal`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `cfandb`.`Meal` ;

CREATE TABLE IF NOT EXISTS `cfandb`.`Meal` (
  `Mealid` INT NOT NULL,
  `Mealtime` ENUM('Breakfast', 'Lunch', 'Dinner', 'Lightmeal') NULL,
  `DateMeal` DATE NULL,
  `Totalkcal` INT NULL,
  `User_Userid` INT NOT NULL,
  PRIMARY KEY (`Mealid`),
  INDEX `fk_Meal_User1_idx` (`User_Userid` ASC) VISIBLE,
  CONSTRAINT `fk_Meal_User1`
    FOREIGN KEY (`User_Userid`)
    REFERENCES `cfandb`.`User` (`Userid`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `cfandb`.`Foodmenu_has_Ingredians`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `cfandb`.`Foodmenu_has_Ingredians` ;

CREATE TABLE IF NOT EXISTS `cfandb`.`Foodmenu_has_Ingredians` (
  `Foodmenu_Foodmenuid` INT NOT NULL,
  `Ingredians_Ingradiansid` INT NOT NULL,
  `Totalunit` INT NULL,
  `Totalkcal` INT NULL,
  PRIMARY KEY (`Foodmenu_Foodmenuid`, `Ingredians_Ingradiansid`),
  INDEX `fk_Foodmenu_has_Ingredians_Ingredians1_idx` (`Ingredians_Ingradiansid` ASC) VISIBLE,
  INDEX `fk_Foodmenu_has_Ingredians_Foodmenu1_idx` (`Foodmenu_Foodmenuid` ASC) VISIBLE,
  CONSTRAINT `fk_Foodmenu_has_Ingredians_Foodmenu1`
    FOREIGN KEY (`Foodmenu_Foodmenuid`)
    REFERENCES `cfandb`.`Foodmenu` (`Foodmenuid`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Foodmenu_has_Ingredians_Ingredians1`
    FOREIGN KEY (`Ingredians_Ingradiansid`)
    REFERENCES `cfandb`.`Ingredians` (`Ingradiansid`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `cfandb`.`Meal_has_Foodmenu`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `cfandb`.`Meal_has_Foodmenu` ;

CREATE TABLE IF NOT EXISTS `cfandb`.`Meal_has_Foodmenu` (
  `Meal_Mealid` INT NOT NULL,
  `Foodmenu_Foodmenuid` INT NOT NULL,
  `Totaldish` INT NULL,
  `Totalkcal` INT NULL,
  PRIMARY KEY (`Meal_Mealid`, `Foodmenu_Foodmenuid`),
  INDEX `fk_Meal_has_Foodmenu_Foodmenu1_idx` (`Foodmenu_Foodmenuid` ASC) VISIBLE,
  INDEX `fk_Meal_has_Foodmenu_Meal1_idx` (`Meal_Mealid` ASC) VISIBLE,
  CONSTRAINT `fk_Meal_has_Foodmenu_Meal1`
    FOREIGN KEY (`Meal_Mealid`)
    REFERENCES `cfandb`.`Meal` (`Mealid`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Meal_has_Foodmenu_Foodmenu1`
    FOREIGN KEY (`Foodmenu_Foodmenuid`)
    REFERENCES `cfandb`.`Foodmenu` (`Foodmenuid`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `cfandb`.`Request`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `cfandb`.`Request` ;

CREATE TABLE IF NOT EXISTS `cfandb`.`Request` (
  `Requestid` INT NOT NULL,
  `Status` ENUM('WAIT', 'APPROVE', 'DISAPPROVED') NOT NULL DEFAULT 'WAIT',
  `User_Userid` INT NOT NULL,
  PRIMARY KEY (`Requestid`),
  INDEX `fk_Request_User1_idx` (`User_Userid` ASC) VISIBLE,
  CONSTRAINT `fk_Request_User1`
    FOREIGN KEY (`User_Userid`)
    REFERENCES `cfandb`.`User` (`Userid`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `cfandb`.`Ingrediansreq`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `cfandb`.`Ingrediansreq` ;

CREATE TABLE IF NOT EXISTS `cfandb`.`Ingrediansreq` (
  `Ingradianname` VARCHAR(50) NOT NULL,
  `kcalpunit` INT NULL,
  `Unit` VARCHAR(50) NULL,
  `Descriptionunit` VARCHAR(255) NULL,
  `Ingrediantype` VARCHAR(45) NULL,
  `Request_Requestid` INT NOT NULL,
  UNIQUE INDEX `Ingradianname_UNIQUE` (`Ingradianname` ASC) VISIBLE,
  PRIMARY KEY (`Request_Requestid`),
  CONSTRAINT `fk_Ingredians_req_Request1`
    FOREIGN KEY (`Request_Requestid`)
    REFERENCES `cfandb`.`Request` (`Requestid`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `cfandb`.`Foodtypereq`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `cfandb`.`Foodtypereq` ;

CREATE TABLE IF NOT EXISTS `cfandb`.`Foodtypereq` (
  `Typename` VARCHAR(50) NOT NULL,
  `Request_Requestid` INT NOT NULL,
  UNIQUE INDEX `Typename_UNIQUE` (`Typename` ASC) VISIBLE,
  PRIMARY KEY (`Request_Requestid`),
  CONSTRAINT `fk_Foodtype_req_Request1`
    FOREIGN KEY (`Request_Requestid`)
    REFERENCES `cfandb`.`Request` (`Requestid`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

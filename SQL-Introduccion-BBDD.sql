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
-- Table `mydb`.`Autores`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Autores` (
  `idAutores` INT NOT NULL,
  `Nombre` VARCHAR(45) NULL DEFAULT NULL,
  `Apellido` VARCHAR(45) NULL DEFAULT NULL,
  `Nacionalidad` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`idAutores`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `mydb`.`Libro`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Libro` (
  `idLibro` INT NOT NULL,
  `Titulo` VARCHAR(45) NULL DEFAULT NULL,
  `Año` VARCHAR(45) NULL DEFAULT NULL,
  `Categoria` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`idLibro`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `mydb`.`Libro_has_Autores`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Libro_has_Autores` (
  `Libro_idLibro` INT NOT NULL,
  `Autores_idAutores` INT NOT NULL,
  PRIMARY KEY (`Libro_idLibro`, `Autores_idAutores`),
  INDEX `fk_Libro_has_Autores_Autores1_idx` (`Autores_idAutores` ASC) VISIBLE,
  INDEX `fk_Libro_has_Autores_Libro1_idx` (`Libro_idLibro` ASC) VISIBLE,
  CONSTRAINT `fk_Libro_has_Autores_Autores1`
    FOREIGN KEY (`Autores_idAutores`)
    REFERENCES `mydb`.`Autores` (`idAutores`),
  CONSTRAINT `fk_Libro_has_Autores_Libro1`
    FOREIGN KEY (`Libro_idLibro`)
    REFERENCES `mydb`.`Libro` (`idLibro`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `mydb`.`Usuarios`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Usuarios` (
  `idtable1` INT NOT NULL,
  `Nombre` VARCHAR(45) NULL DEFAULT NULL,
  `Apellido` VARCHAR(45) NULL DEFAULT NULL,
  `Fecha de Registro` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`idtable1`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `mydb`.`Prestamos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Prestamos` (
  `idPrestamos` INT NOT NULL,
  `Fecha Prestamos` VARCHAR(45) NULL DEFAULT NULL,
  `Fecha Devolucion` VARCHAR(45) NULL DEFAULT NULL,
  `Usuarios_idtable1` INT NOT NULL,
  PRIMARY KEY (`idPrestamos`),
  INDEX `fk_Prestamos_Usuarios1_idx` (`Usuarios_idtable1` ASC) VISIBLE,
  CONSTRAINT `fk_Prestamos_Usuarios1`
    FOREIGN KEY (`Usuarios_idtable1`)
    REFERENCES `mydb`.`Usuarios` (`idtable1`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `mydb`.`Prestamos_has_Libro`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Prestamos_has_Libro` (
  `Prestamos_idPrestamos` INT NOT NULL,
  `Libro_idLibro` INT NOT NULL,
  PRIMARY KEY (`Prestamos_idPrestamos`, `Libro_idLibro`),
  INDEX `fk_Prestamos_has_Libro_Libro1_idx` (`Libro_idLibro` ASC) VISIBLE,
  INDEX `fk_Prestamos_has_Libro_Prestamos_idx` (`Prestamos_idPrestamos` ASC) VISIBLE,
  CONSTRAINT `fk_Prestamos_has_Libro_Libro1`
    FOREIGN KEY (`Libro_idLibro`)
    REFERENCES `mydb`.`Libro` (`idLibro`),
  CONSTRAINT `fk_Prestamos_has_Libro_Prestamos`
    FOREIGN KEY (`Prestamos_idPrestamos`)
    REFERENCES `mydb`.`Prestamos` (`idPrestamos`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

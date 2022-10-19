- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema ProgramandoElFuturo_Consultas
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema ProgramandoElFuturo_Consultas
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `ProgramandoElFuturo_Consultas` DEFAULT CHARACTER SET utf8 ;
USE `ProgramandoElFuturo_Consultas` ;

-- -----------------------------------------------------
-- Table `ProgramandoElFuturo_Consultas`.`Usuario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ProgramandoElFuturo_Consultas`.`Usuario` (
  `Id_Usuario` INT NOT NULL AUTO_INCREMENT,
  `Nombre` VARCHAR(45) NOT NULL,
  `Apellido` VARCHAR(45) NOT NULL,
  `UserName` VARCHAR(45) NOT NULL,
  `Descripcion` VARCHAR(300) NULL,
  `FechaAlta` DATETIME NOT NULL,
  `Ciudad` VARCHAR(20) NOT NULL,
  `ImagenPerfil` VARCHAR(45) NULL,
  PRIMARY KEY (`Id_Usuario`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ProgramandoElFuturo_Consultas`.`Pregunta`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ProgramandoElFuturo_Consultas`.`Pregunta` (
  `Id_pregunta` INT NOT NULL AUTO_INCREMENT,
  `Titulo` VARCHAR(45) NOT NULL,
  `Descripcion` VARCHAR(500) NOT NULL,
  `FechaCreacion` DATETIME NOT NULL,
  `Etiqueta` VARCHAR(12) NOT NULL,
  `Usuario_Id_Usuario` INT NOT NULL,
  PRIMARY KEY (`Id_pregunta`),
  INDEX `fk_Pregunta_Usuario1_idx` (`Usuario_Id_Usuario` ASC) VISIBLE,
  CONSTRAINT `fk_Pregunta_Usuario1`
    FOREIGN KEY (`Usuario_Id_Usuario`)
    REFERENCES `ProgramandoElFuturo_Consultas`.`Usuario` (`Id_Usuario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ProgramandoElFuturo_Consultas`.`Categoria`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ProgramandoElFuturo_Consultas`.`Categoria` (
  `Id_Categoria` INT NOT NULL,
  `Nombre` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`Id_Categoria`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ProgramandoElFuturo_Consultas`.`Articulo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ProgramandoElFuturo_Consultas`.`Articulo` (
  `Id_Articulo` INT NOT NULL AUTO_INCREMENT,
  `Titulo` VARCHAR(45) NOT NULL,
  `Texto` VARCHAR(45) NOT NULL,
  `FechaCreacion` DATETIME NOT NULL,
  `Categoria_Id_Categoria` INT NOT NULL,
  PRIMARY KEY (`Id_Articulo`),
  INDEX `fk_Articulo_Categoria1_idx` (`Categoria_Id_Categoria` ASC) VISIBLE,
  CONSTRAINT `fk_Articulo_Categoria1`
    FOREIGN KEY (`Categoria_Id_Categoria`)
    REFERENCES `ProgramandoElFuturo_Consultas`.`Categoria` (`Id_Categoria`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ProgramandoElFuturo_Consultas`.`Comentario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ProgramandoElFuturo_Consultas`.`Comentario` (
  `Id_Comentario` INT NOT NULL AUTO_INCREMENT,
  `Texto` VARCHAR(400) NOT NULL,
  `FechaCreacion` DATETIME NOT NULL,
  `Usuario_Id_Usuario` INT NOT NULL,
  `Pregunta_Id_pregunta` INT NOT NULL,
  `Articulo_Id_Articulo` INT NOT NULL,
  PRIMARY KEY (`Id_Comentario`),
  INDEX `fk_Comentario_Usuario1_idx` (`Usuario_Id_Usuario` ASC) VISIBLE,
  INDEX `fk_Comentario_Pregunta1_idx` (`Pregunta_Id_pregunta` ASC) VISIBLE,
  INDEX `fk_Comentario_Articulo1_idx` (`Articulo_Id_Articulo` ASC) VISIBLE,
  CONSTRAINT `fk_Comentario_Usuario1`
    FOREIGN KEY (`Usuario_Id_Usuario`)
    REFERENCES `ProgramandoElFuturo_Consultas`.`Usuario` (`Id_Usuario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Comentario_Pregunta1`
    FOREIGN KEY (`Pregunta_Id_pregunta`)
    REFERENCES `ProgramandoElFuturo_Consultas`.`Pregunta` (`Id_pregunta`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Comentario_Articulo1`
    FOREIGN KEY (`Articulo_Id_Articulo`)
    REFERENCES `ProgramandoElFuturo_Consultas`.`Articulo` (`Id_Articulo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ProgramandoElFuturo_Consultas`.`Etiqueta`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ProgramandoElFuturo_Consultas`.`Etiqueta` (
  `Id_Etiqueta` INT NOT NULL AUTO_INCREMENT,
  `Nombre` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`Id_Etiqueta`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ProgramandoElFuturo_Consultas`.`Votos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ProgramandoElFuturo_Consultas`.`Votos` (
  `Id_votos` INT NOT NULL AUTO_INCREMENT,
  `Comentario_Id_Comentario` INT NOT NULL,
  `Pregunta_Id_pregunta` INT NOT NULL,
  PRIMARY KEY (`Id_votos`),
  INDEX `fk_Votos_Comentario1_idx` (`Comentario_Id_Comentario` ASC) VISIBLE,
  INDEX `fk_Votos_Pregunta1_idx` (`Pregunta_Id_pregunta` ASC) VISIBLE,
  CONSTRAINT `fk_Votos_Comentario1`
    FOREIGN KEY (`Comentario_Id_Comentario`)
    REFERENCES `ProgramandoElFuturo_Consultas`.`Comentario` (`Id_Comentario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Votos_Pregunta1`
    FOREIGN KEY (`Pregunta_Id_pregunta`)
    REFERENCES `ProgramandoElFuturo_Consultas`.`Pregunta` (`Id_pregunta`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ProgramandoElFuturo_Consultas`.`Roles`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ProgramandoElFuturo_Consultas`.`Roles` (
  `Id_Roles` INT NOT NULL AUTO_INCREMENT,
  `Nombre_Rol` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`Id_Roles`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ProgramandoElFuturo_Consultas`.`Roles_Usuario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ProgramandoElFuturo_Consultas`.`Roles_Usuario` (
  `Roles_Id_Roles` INT NOT NULL,
  `Usuario_Id_Usuario` INT NOT NULL,
  PRIMARY KEY (`Roles_Id_Roles`, `Usuario_Id_Usuario`),
  INDEX `fk_Roles_has_Usuario_Usuario1_idx` (`Usuario_Id_Usuario` ASC) VISIBLE,
  INDEX `fk_Roles_has_Usuario_Roles1_idx` (`Roles_Id_Roles` ASC) VISIBLE,
  CONSTRAINT `fk_Roles_has_Usuario_Roles1`
    FOREIGN KEY (`Roles_Id_Roles`)
    REFERENCES `ProgramandoElFuturo_Consultas`.`Roles` (`Id_Roles`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Roles_has_Usuario_Usuario1`
    FOREIGN KEY (`Usuario_Id_Usuario`)
    REFERENCES `ProgramandoElFuturo_Consultas`.`Usuario` (`Id_Usuario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ProgramandoElFuturo_Consultas`.`Pregunta_Etiqueta`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ProgramandoElFuturo_Consultas`.`Pregunta_Etiqueta` (
  `Etiqueta_Id_Etiqueta` INT NOT NULL,
  `Pregunta_Id_pregunta` INT NOT NULL,
  PRIMARY KEY (`Etiqueta_Id_Etiqueta`, `Pregunta_Id_pregunta`),
  INDEX `fk_Etiqueta_has_Pregunta_Pregunta1_idx` (`Pregunta_Id_pregunta` ASC) VISIBLE,
  INDEX `fk_Etiqueta_has_Pregunta_Etiqueta1_idx` (`Etiqueta_Id_Etiqueta` ASC) VISIBLE,
  CONSTRAINT `fk_Etiqueta_has_Pregunta_Etiqueta1`
    FOREIGN KEY (`Etiqueta_Id_Etiqueta`)
    REFERENCES `ProgramandoElFuturo_Consultas`.`Etiqueta` (`Id_Etiqueta`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Etiqueta_has_Pregunta_Pregunta1`
    FOREIGN KEY (`Pregunta_Id_pregunta`)
    REFERENCES `ProgramandoElFuturo_Consultas`.`Pregunta` (`Id_pregunta`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

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
-- Table `mydb`.`usuarios`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`usuarios` (
  `idusuarios` INT NOT NULL,
  `nombre` VARCHAR(100) NOT NULL,
  `gmail` VARCHAR(100) NOT NULL,
  `contraseña` VARCHAR(255) NOT NULL,
  `rol` ENUM('Docente', 'Inspector', 'UTP') NOT NULL,
  `fecha_registro` TIMESTAMP NULL,
  PRIMARY KEY (`idusuarios`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`cursos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`cursos` (
  `idcursos` INT NOT NULL AUTO_INCREMENT,
  `nombre_curso` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`idcursos`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`comunicaciones`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`comunicaciones` (
  `idcomunicaciones` INT NOT NULL,
  `titulo` VARCHAR(150) NOT NULL,
  `tipo_comunicado` ENUM('Aviso General', 'Salida Pedagógica', 'Justificación de Aula', 'Comunicado UTP') NULL,
  `descripcion` TEXT NOT NULL,
  `fecha_evento` DATE NOT NULL,
  `estado` ENUM('Pendiente', 'Aprobado', 'Cancelado') NULL,
  `usuarios_idusuarios` INT NOT NULL,
  `cursos_idcursos` INT NOT NULL,
  PRIMARY KEY (`idcomunicaciones`),
  INDEX `fk_comunicaciones_usuarios_idx` (`usuarios_idusuarios` ASC) VISIBLE,
  INDEX `fk_comunicaciones_cursos1_idx` (`cursos_idcursos` ASC) VISIBLE,
  CONSTRAINT `fk_comunicaciones_usuarios`
    FOREIGN KEY (`usuarios_idusuarios`)
    REFERENCES `mydb`.`usuarios` (`idusuarios`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_comunicaciones_cursos1`
    FOREIGN KEY (`cursos_idcursos`)
    REFERENCES `mydb`.`cursos` (`idcursos`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `geesat_db`.`estudiantes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`estudiantes` (
  `idestudiantes` INT NOT NULL,
  `rut` VARCHAR(12) NOT NULL,
  `nombre` VARCHAR(100) NOT NULL,
  `apellido` VARCHAR(100) NOT NULL,
  `cursos_idcursos` INT NOT NULL,
  PRIMARY KEY (`idestudiantes`),
  UNIQUE INDEX `rut_UNIQUE` (`rut` ASC) VISIBLE,
  INDEX `fk_estudiantes_cursos1_idx` (`cursos_idcursos` ASC) VISIBLE,
  CONSTRAINT `fk_estudiantes_cursos1`
    FOREIGN KEY (`cursos_idcursos`)
    REFERENCES `mydb`.`cursos` (`idcursos`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

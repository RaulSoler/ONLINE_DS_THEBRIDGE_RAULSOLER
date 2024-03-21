-- MySQL Script generated by MySQL Workbench
-- Thu Mar 21 15:18:04 2024
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
-- Table `mydb`.`Proveedores`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Proveedores` (
  `Id_Proveedor` INT NOT NULL,
  `Nombre` VARCHAR(45) NULL,
  `Direccion` VARCHAR(45) NULL,
  `Telefono` VARCHAR(45) NULL,
  PRIMARY KEY (`Id_Proveedor`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Productos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Productos` (
  `Id_Productos` INT NOT NULL,
  `Nombre` VARCHAR(45) NULL,
  `Tipo` VARCHAR(45) NULL,
  `Precio` VARCHAR(45) NULL,
  `Id_Proveedor` INT NOT NULL,
  PRIMARY KEY (`Id_Productos`),
  INDEX `Id_Proveedor_idx` (`Id_Proveedor` ASC) VISIBLE,
  CONSTRAINT `Id_Proveedor`
    FOREIGN KEY (`Id_Proveedor`)
    REFERENCES `mydb`.`Proveedores` (`Id_Proveedor`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Stock`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Stock` (
  `Id_Producto` INT NOT NULL,
  `Cantidad` INT NULL,
  `Fecha_Ingreso` DATE NULL,
  PRIMARY KEY (`Id_Producto`),
  CONSTRAINT `Id_Producto`
    FOREIGN KEY (`Id_Producto`)
    REFERENCES `mydb`.`Productos` (`Id_Productos`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Facturas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Facturas` (
  `Id_Factura` INT NOT NULL,
  `Fecha` DATE NULL,
  `Total` VARCHAR(45) NULL,
  `Id_Proveedor` INT NULL,
  PRIMARY KEY (`Id_Factura`),
  INDEX `Id_Proveedor_idx` (`Id_Proveedor` ASC) VISIBLE,
  CONSTRAINT `Id_Proveedor`
    FOREIGN KEY (`Id_Proveedor`)
    REFERENCES `mydb`.`Proveedores` (`Id_Proveedor`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Detalle_Factura`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Detalle_Factura` (
  `Id_Detalle` INT NOT NULL,
  `Id_Factura` INT NOT NULL,
  `Id_Producto` INT NOT NULL,
  `Cantidad` INT NULL,
  `Fecha` DATE NULL,
  INDEX `Id_Factura_idx` (`Id_Factura` ASC) VISIBLE,
  INDEX `Id_Producto_idx` (`Id_Producto` ASC) VISIBLE,
  PRIMARY KEY (`Id_Detalle`),
  CONSTRAINT `Id_Factura`
    FOREIGN KEY (`Id_Factura`)
    REFERENCES `mydb`.`Facturas` (`Id_Factura`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `Id_Producto`
    FOREIGN KEY (`Id_Producto`)
    REFERENCES `mydb`.`Productos` (`Id_Productos`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

USE `mydb` ;

-- -----------------------------------------------------
--  routine1
-- -----------------------------------------------------

DELIMITER $$
USE `mydb`$$
$$

DELIMITER ;

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

-- -----------------------------------------------------
-- Data for table `mydb`.`Proveedores`
-- -----------------------------------------------------
START TRANSACTION;
USE `mydb`;
INSERT INTO `mydb`.`Proveedores` (`Id_Proveedor`, `Nombre`, `Direccion`, `Telefono`) VALUES (1, 'Perico', 'Valencia', '1234');

COMMIT;


-- -----------------------------------------------------
-- Data for table `mydb`.`Productos`
-- -----------------------------------------------------
START TRANSACTION;
USE `mydb`;
INSERT INTO `mydb`.`Productos` (`Id_Productos`, `Nombre`, `Tipo`, `Precio`, `Id_Proveedor`) VALUES (2, 'SENSITIVE', 'DORMILON', '3', 1);

COMMIT;


-- -----------------------------------------------------
-- Data for table `mydb`.`Facturas`
-- -----------------------------------------------------
START TRANSACTION;
USE `mydb`;
INSERT INTO `mydb`.`Facturas` (`Id_Factura`, `Fecha`, `Total`, `Id_Proveedor`) VALUES (1, '23/02/2020', '3', 1);

COMMIT;


-- -----------------------------------------------------
-- Data for table `mydb`.`Detalle_Factura`
-- -----------------------------------------------------
START TRANSACTION;
USE `mydb`;
INSERT INTO `mydb`.`Detalle_Factura` (`Id_Detalle`, `Id_Factura`, `Id_Producto`, `Cantidad`, `Fecha`) VALUES (5, 1, 3, 5, '23/05/43');

COMMIT;


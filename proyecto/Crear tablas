Create schema proyecto2;
use proyecto2;

CREATE TABLE IF NOT EXISTS `proyecto2`.`cliente` (
  `id_cliente` INT(11) NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NULL DEFAULT NULL,
  `apellido` VARCHAR(45) NULL DEFAULT NULL,
  `organizacion` VARCHAR(45) NULL DEFAULT NULL,
  `cargo` VARCHAR(45) NULL DEFAULT NULL,
  `numPasaporte` VARCHAR(45) NULL DEFAULT NULL,
  `fechaNacimiento` DATE NULL DEFAULT NULL,
  `nacionalidad` VARCHAR(45) NULL DEFAULT NULL,
  `telefono` VARCHAR(45) NULL DEFAULT NULL,
  `fax` VARCHAR(45) NULL DEFAULT NULL,
  `email` VARCHAR(45) NULL DEFAULT NULL,
  `id_domicilio` INT(11) NOT NULL,
  PRIMARY KEY (`id_cliente`),
  INDEX `fk_participante_domicilio1_idx` (`id_domicilio` ASC) VISIBLE,
  CONSTRAINT `fk_participante_domicilio1`
    FOREIGN KEY (`id_domicilio`)
    REFERENCES `proyecto2`.`domicilio` (`id_domicilio`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);

CREATE TABLE IF NOT EXISTS `proyecto2`.`hotel` (
  `id_hotel` INT(11) NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`id_hotel`));

CREATE TABLE IF NOT EXISTS `proyecto2`.`reserva` (
  `id_reserva` INT(11) NOT NULL AUTO_INCREMENT,
  `fechaArribo` DATE NULL DEFAULT NULL,
  `fechaSalida` DATE NULL DEFAULT NULL,
  `numNoches` INT(11) NULL DEFAULT NULL,
  `vueloArribo` DATE NULL DEFAULT NULL,
  `vueloSalida` DATE NULL DEFAULT NULL,
  `early_check_in` VARCHAR(45) NULL DEFAULT NULL,
  `id_cliente` INT(11) NOT NULL,
  `id_tarjeta` INT(11) NOT NULL,
  `id_habitacion` INT(11) NOT NULL,
  PRIMARY KEY (`id_reserva`),
  INDEX `fk_reserva_participante1_idx` (`id_cliente` ASC) VISIBLE,
  INDEX `fk_reserva_tarjeta1_idx` (`id_tarjeta` ASC) VISIBLE,
  INDEX `fk_reserva_habitacion1_idx` (`id_habitacion` ASC) VISIBLE,
  CONSTRAINT `fk_reserva_participante1`
    FOREIGN KEY (`id_cliente`)
    REFERENCES `proyecto2`.`cliente` (`id_cliente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_reserva_tarjeta1`
    FOREIGN KEY (`id_tarjeta`)
    REFERENCES `proyecto2`.`tarjeta` (`id_tarjeta`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_reserva_habitacion1`
    FOREIGN KEY (`id_habitacion`)
    REFERENCES `proyecto2`.`habitacion` (`id_habitacion`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);

CREATE TABLE IF NOT EXISTS `proyecto2`.`tarjeta` (
  `id_tarjeta` INT(11) NOT NULL AUTO_INCREMENT,
  `numTarjeta` VARCHAR(45) NULL DEFAULT NULL,
  `fechaVencimiento` DATE NULL DEFAULT NULL,
  `nombreTitular` VARCHAR(45) NULL DEFAULT NULL,
  `id_cliente` INT(11) NOT NULL,
  `id_tipoTarjeta` INT(11) NOT NULL,
  PRIMARY KEY (`id_tarjeta`),
  INDEX `fk_tarjeta_participante1_idx` (`id_cliente` ASC) VISIBLE,
  INDEX `fk_tarjeta_tipoTarjeta1_idx` (`id_tipoTarjeta` ASC) VISIBLE,
  CONSTRAINT `fk_tarjeta_participante1`
    FOREIGN KEY (`id_cliente`)
    REFERENCES `proyecto2`.`cliente` (`id_cliente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_tarjeta_tipoTarjeta1`
    FOREIGN KEY (`id_tipoTarjeta`)
    REFERENCES `proyecto2`.`tipoTarjeta` (`id_tipoTarjeta`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);

CREATE TABLE IF NOT EXISTS `proyecto2`.`personaContacto` (
  `id_contacto` INT(11) NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NULL DEFAULT NULL,
  `telefono` VARCHAR(45) NULL DEFAULT NULL,
  `fax` VARCHAR(45) NULL DEFAULT NULL,
  `email` VARCHAR(45) NULL DEFAULT NULL,
  `id_hotel` INT(11) NOT NULL,
  PRIMARY KEY (`id_contacto`),
  INDEX `fk_contacto_hotel_idx` (`id_hotel` ASC) VISIBLE,
  CONSTRAINT `fk_contacto_hotel`
    FOREIGN KEY (`id_hotel`)
    REFERENCES `proyecto2`.`hotel` (`id_hotel`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);

CREATE TABLE IF NOT EXISTS `proyecto2`.`domicilio` (
  `id_domicilio` INT(11) NOT NULL AUTO_INCREMENT,
  `direccion` VARCHAR(45) NULL DEFAULT NULL,
  `id_ciudad` INT(11) NOT NULL,
  PRIMARY KEY (`id_domicilio`),
  INDEX `fk_domicilio_ciudad1_idx` (`id_ciudad` ASC) VISIBLE,
  CONSTRAINT `fk_domicilio_ciudad1`
    FOREIGN KEY (`id_ciudad`)
    REFERENCES `proyecto2`.`ciudad` (`id_ciudad`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);

CREATE TABLE IF NOT EXISTS `proyecto2`.`habitacion` (
  `id_habitacion` INT(11) NOT NULL AUTO_INCREMENT,
  `tipoHabitacion` VARCHAR(45) NULL DEFAULT NULL,
  `precio` DECIMAL NULL DEFAULT NULL,
  `id_hotel` INT(11) NOT NULL,
  PRIMARY KEY (`id_habitacion`),
  INDEX `fk_Habitacion_hotel1_idx` (`id_hotel` ASC) VISIBLE,
  CONSTRAINT `fk_Habitacion_hotel1`
    FOREIGN KEY (`id_hotel`)
    REFERENCES `proyecto2`.`hotel` (`id_hotel`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);

CREATE TABLE IF NOT EXISTS `proyecto2`.`tipoTarjeta` (
  `id_tipoTarjeta` INT(11) NOT NULL AUTO_INCREMENT,
  `tipo` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`id_tipoTarjeta`));

CREATE TABLE IF NOT EXISTS `proyecto2`.`ciudad` (
  `id_ciudad` INT(11) NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NULL DEFAULT NULL,
  `id_pais` INT(11) NOT NULL,
  PRIMARY KEY (`id_ciudad`),
  INDEX `fk_ciudad_pais1_idx` (`id_pais` ASC) VISIBLE,
  CONSTRAINT `fk_ciudad_pais1`
    FOREIGN KEY (`id_pais`)
    REFERENCES `proyecto2`.`pais` (`id_pais`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);

CREATE TABLE IF NOT EXISTS `proyecto2`.`pais` (
  `id_pais` INT(11) NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`id_pais`))

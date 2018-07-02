-- MySQL Workbench Synchronization
-- Generated: 2018-06-08 16:28
-- Model: New Model
-- Version: 1.0
-- Project: Name of the project
-- Author: Administrator

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

ALTER TABLE `mfn_db`.`Lexeme` 
ADD COLUMN `idUDPOS` INT(11) UNSIGNED NULL DEFAULT NULL AFTER `idEntity`,
DROP INDEX `idx_Lexeme_name` ,
ADD INDEX `idx_Lexeme_name` (`name` ASC),
ADD INDEX `fk_Lexeme_UDPOS_idx` (`idUDPOS` ASC);

ALTER TABLE `mfn_db`.`Lemma` 
ADD COLUMN `idUDPOS` INT(11) UNSIGNED NULL DEFAULT NULL AFTER `idEntity`,
DROP INDEX `idx_Lemma_name` ,
ADD INDEX `idx_Lemma_name` (`name` ASC),
ADD INDEX `fk_Lemma_UDPOS_idx` (`idUDPOS` ASC);

ALTER TABLE `mfn_db`.`Genre` 
ADD COLUMN `idGenreType` INT(11) NOT NULL AFTER `entry`,
DROP INDEX `idx_Genre_Entry` ,
ADD INDEX `idx_Genre_Entry` (`entry` ASC),
ADD INDEX `idx_Genre_GenreType` (`idGenreType` ASC);

CREATE TABLE IF NOT EXISTS `mfn_db`.`UDPOS` (
  `idUDPOS` INT(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `POS` VARCHAR(50) NULL DEFAULT NULL,
  `entry` VARCHAR(255) NULL DEFAULT NULL,
  `idEntity` INT(11) UNSIGNED NOT NULL,
  PRIMARY KEY (`idUDPOS`),
  INDEX `idx_udpos_pos` (`POS` ASC),
  INDEX `fk_UDPOS_Entity_idx` (`idEntity` ASC),
  CONSTRAINT `fk_UDPOS_Entity`
    FOREIGN KEY (`idEntity`)
    REFERENCES `mfn_db`.`Entity` (`idEntity`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;

CREATE TABLE IF NOT EXISTS `mfn_db`.`POS_UDPOS` (
  `idPOS` INT(11) UNSIGNED NOT NULL,
  `idUDPOS` INT(11) UNSIGNED NOT NULL,
  PRIMARY KEY (`idPOS`, `idUDPOS`),
  INDEX `fk_POS_has_UDPOS_UDPOS1_idx` (`idUDPOS` ASC),
  INDEX `fk_POS_has_UDPOS_POS1_idx` (`idPOS` ASC),
  CONSTRAINT `fk_POS_has_UDPOS_POS1`
    FOREIGN KEY (`idPOS`)
    REFERENCES `mfn_db`.`POS` (`idPOS`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_POS_has_UDPOS_UDPOS1`
    FOREIGN KEY (`idUDPOS`)
    REFERENCES `mfn_db`.`UDPOS` (`idUDPOS`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;

CREATE TABLE IF NOT EXISTS `mfn_db`.`WordForm_Lexeme` (
  `idWordForm` INT(11) UNSIGNED NOT NULL,
  `idLexeme` INT(11) UNSIGNED NOT NULL,
  PRIMARY KEY (`idWordForm`, `idLexeme`),
  INDEX `fk_WordForm_has_Lexeme_Lexeme_idx` (`idLexeme` ASC),
  INDEX `fk_WordForm_has_Lexeme_WordForm_idx` (`idWordForm` ASC),
  CONSTRAINT `fk_WordForm_has_Lexeme_WordForm`
    FOREIGN KEY (`idWordForm`)
    REFERENCES `mfn_db`.`WordForm` (`idWordForm`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_WordForm_has_Lexeme_Lexeme`
    FOREIGN KEY (`idLexeme`)
    REFERENCES `mfn_db`.`Lexeme` (`idLexeme`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;

CREATE TABLE IF NOT EXISTS `mfn_db`.`WordSegment` (
  `idWordSegment` INT(11) NOT NULL AUTO_INCREMENT,
  `segmentOrder` INT(11) NULL DEFAULT NULL,
  `idWordForm` INT(11) UNSIGNED NOT NULL,
  `idSegment` INT(11) UNSIGNED NOT NULL,
  PRIMARY KEY (`idWordSegment`),
  INDEX `fk_WordSegment_WordForm_idx` (`idWordForm` ASC),
  INDEX `fk_WordSegment_Segment_idx` (`idSegment` ASC),
  CONSTRAINT `fk_WordSegment_WordForm`
    FOREIGN KEY (`idWordForm`)
    REFERENCES `mfn_db`.`WordForm` (`idWordForm`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_WordSegment_Segment`
    FOREIGN KEY (`idSegment`)
    REFERENCES `mfn_db`.`WordForm` (`idWordForm`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;

CREATE TABLE IF NOT EXISTS `mfn_db`.`Qualia` (
  `idQualia` INT(11) NOT NULL AUTO_INCREMENT,
  `info` VARCHAR(50) NULL DEFAULT NULL,
  `idTypeInstance` INT(11) NOT NULL,
  `idEntity` INT(11) UNSIGNED NOT NULL,
  PRIMARY KEY (`idQualia`),
  INDEX `idx_Qualia_TypeInstance` (`idTypeInstance` ASC),
  INDEX `idx_Qualia_Entity` (`idEntity` ASC),
  CONSTRAINT `fk_Qualia_TypeInstance`
    FOREIGN KEY (`idTypeInstance`)
    REFERENCES `mfn_db`.`TypeInstance` (`idTypeInstance`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Qualia_Entity`
    FOREIGN KEY (`idEntity`)
    REFERENCES `mfn_db`.`Entity` (`idEntity`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;

CREATE TABLE IF NOT EXISTS `mfn_db`.`GenreType` (
  `idGenreType` INT(11) NOT NULL AUTO_INCREMENT,
  `entry` VARCHAR(255) NULL DEFAULT NULL,
  PRIMARY KEY (`idGenreType`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;

ALTER TABLE `mfn_db`.`Lexeme` 
ADD CONSTRAINT `fk_Lexeme_UDPOS`
  FOREIGN KEY (`idUDPOS`)
  REFERENCES `mfn_db`.`UDPOS` (`idUDPOS`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;

ALTER TABLE `mfn_db`.`Lemma` 
ADD CONSTRAINT `fk_Lemma_UDPOS`
  FOREIGN KEY (`idUDPOS`)
  REFERENCES `mfn_db`.`UDPOS` (`idUDPOS`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;

ALTER TABLE `mfn_db`.`Genre` 
ADD CONSTRAINT `fk_Genre_GenreType`
  FOREIGN KEY (`idGenreType`)
  REFERENCES `mfn_db`.`GenreType` (`idGenreType`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

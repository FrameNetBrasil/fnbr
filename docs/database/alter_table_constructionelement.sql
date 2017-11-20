-- MySQL Workbench Synchronization
-- Generated: 2017-11-18 01:26
-- Model: New Model
-- Version: 1.0
-- Project: Name of the project
-- Author: Administrator

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

ALTER TABLE `fnbr_db`.`ConstructionElement` 
CHANGE COLUMN `entry` `entry` VARCHAR(255) NULL DEFAULT NULL ,
ADD COLUMN `head` TINYINT(1) NULL DEFAULT 0 AFTER `optional`,
ADD COLUMN `multiple` TINYINT(1) NULL DEFAULT 1 AFTER `head`;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
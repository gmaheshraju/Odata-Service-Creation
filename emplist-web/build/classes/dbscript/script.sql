CREATE DATABASE  IF NOT EXISTS `odatadb` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `odatadb`;
/* dbscript file for simple Odata Demo Application */
DROP TABLE IF EXISTS `currency`;
CREATE TABLE `currency` (
  `idCurrency` varchar(25) NOT NULL,
  `name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idCurrency`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `currency` VALUES ('EUR','EURO'),('INR','Indian Rupees'),('KUW','Kuwait'),('USD','us Dollars');


DROP TABLE IF EXISTS `country`;
CREATE TABLE `country` (
  `id` varchar(25) NOT NULL,
  `currency_id` varchar(25) NOT NULL,
  `name` varchar(25) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `currency_id` (`currency_id`),
  CONSTRAINT `country_ibfk_1` FOREIGN KEY (`currency_id`) REFERENCES `currency` (`idCurrency`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
INSERT INTO `country` VALUES ('GER','EUR','germany'),('IND','INR','India'),('USA','USD','USA');



DROP TABLE IF EXISTS `city`;
CREATE TABLE `city` (
  `id` varchar(25) NOT NULL,
  `country_id` varchar(25) NOT NULL,
  `name` varchar(25) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `country_id` (`country_id`),
  CONSTRAINT `city_ibfk_1` FOREIGN KEY (`country_id`) REFERENCES `country` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
INSERT INTO `city` VALUES ('MUM','IND','Mumbai'),('NYC','usa','new York City'),('WDF','GER','Walldorf');


drop database `UrbanCompany_DB`;
create database if not exists `UrbanCompany_DB`;

use `UrbanCompany_DB`;

CREATE TABLE `Customer` (
  `id` int(9) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `address` varchar(100) NOT NULL,
  `pin` int(6) NOT NULL,
  `mobile` integer(10) NOT NULL UNIQUE KEY,
  `gender` varchar(1) NOT NULL,
  `email` varchar(10) NOT NULL UNIQUE KEY,
  
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `City` (
  `id` int(9) NOT NULL AUTO_INCREMENT,
  `name` varchar(10) NOT NULL,
  `state` varchar(30) NOT NULL,
  `country` varchar(30) NOT NULL,
  
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `Category` (
  `id` int(9) NOT NULL AUTO_INCREMENT,
  `title` varchar(10) NOT NULL,
  `description` varchar(30) NOT NULL,
  `city_id` int(9) NOT NULL,
  
  PRIMARY KEY (`id`),
  KEY `fk_Category_city_id_idx` (`city_id`),
  CONSTRAINT `fk_Category_city_id` FOREIGN KEY (`city_id`) 
  REFERENCES `City` (`id`) 
  ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `Partner` (
  `id` int(9) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `mobile` integer(10) NOT NULL UNIQUE KEY,
  `gender` varchar(1) NOT NULL,
  `email` varchar(10) NOT NULL UNIQUE KEY,
  `category_id` int(9) NOT NULL,
  
  PRIMARY KEY (`id`),
  UNIQUE KEY `mobile_unique` (`mobile`),
  UNIQUE KEY `email_unique` (`email`),
  KEY `fk_Partner_category_id_idx` (`category_id`),
  CONSTRAINT `fk_Partner_category_id` FOREIGN KEY (`category_id`) 
  REFERENCES `Category` (`id`) 
  ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `Service` (
  `id` int(9) NOT NULL AUTO_INCREMENT,
  `title` varchar(10) NOT NULL,
  `description` varchar(30) NOT NULL,
  `price` float NOT NULL,
  `status` varchar(10) NOT NULL,
  `category_id` int(9) NOT NULL,
  
  PRIMARY KEY (`id`),
  KEY `fk_Service_category_id_idx` (`category_id`),
  CONSTRAINT `fk_Service_category_id` FOREIGN KEY (`category_id`) 
  REFERENCES `Category` (`id`) 
  ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `Booking` (
  `id` int(9) NOT NULL AUTO_INCREMENT,
  `service_datetime` datetime NOT NULL,
  `booking_datetime` datetime NOT NULL,
  `remarks` varchar(20) NOT NULL,
  `customer_id` int(9) NOT NULL,
  `service_id` int(9) NOT NULL,
  
  PRIMARY KEY (`id`),
  KEY `fk_Booking_customer_id_idx` (`customer_id`),
  CONSTRAINT `fk_Booking_customer_id` FOREIGN KEY (`customer_id`) 
  REFERENCES `Customer` (`id`) 
  ON DELETE CASCADE ON UPDATE CASCADE,
  
  KEY `fk_Booking_service_id_idx` (`service_id`),
  CONSTRAINT `fk_Booking_service_id` FOREIGN KEY (`service_id`) 
  REFERENCES `Service` (`id`) 
  ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `Offer` (
  `id` int(9) NOT NULL AUTO_INCREMENT PRIMARY KEY,
  `code` varchar(10) NOT NULL,
  `description` varchar(30) NOT NULL,
  `discount` float NOT NULL,
  `offer_count` int(9) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


CREATE TABLE `Payment` (
  `id` int(9) NOT NULL AUTO_INCREMENT,
  `mode` varchar(10) NOT NULL,
  `amount` float NOT NULL,
  `booking_id` int(9) NOT NULL,
  `offer_id` int(9) NOT NULL,
  
  PRIMARY KEY (`id`),
  KEY `fk_Payment_booking_id_idx` (`booking_id`),
  CONSTRAINT `fk_Payment_booking_id` FOREIGN KEY (`booking_id`) 
  REFERENCES `Booking` (`id`)
  ON DELETE CASCADE ON UPDATE CASCADE,
  
  KEY `fk_Payment_offer_id_idx` (`offer_id`),
  CONSTRAINT `fk_Payment_offer_id` FOREIGN KEY (`offer_id`) 
  REFERENCES `Offer` (`id`) 
  ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `Feedback` (
  `id` int(9) NOT NULL AUTO_INCREMENT,
  `rating` float NOT NULL,
  `comment` varchar(30) NOT NULL,
  `booking_id` int(9) NOT NULL,
  `customer_id` int(9) NOT NULL,
  
  PRIMARY KEY (`id`),
  KEY `fk_Feedback_booking_id_idx` (`booking_id`),
  CONSTRAINT `fk_Feedback_booking_id` FOREIGN KEY (`booking_id`) 
  REFERENCES `Booking` (`id`)
  ON DELETE CASCADE ON UPDATE CASCADE,
  
  KEY `fk_Feedback_customer_id_idx` (`customer_id`),
  CONSTRAINT `fk_Feedback_customer_id` FOREIGN KEY (`customer_id`) 
  REFERENCES `Customer` (`id`) 
  ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


DROP TABLE IF EXISTS `log_OFFERS`;
CREATE TABLE `log_OFFERS` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `customer_id` VARCHAR(45) NOT NULL,
  `offer_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_logOffers_customer_id_idx` (`customer_id`),
  CONSTRAINT `fk_logOffers_customer_id` FOREIGN KEY (`customer_id`) 
  REFERENCES `Customer` (`id`),
  KEY `fk_logOffers_offer_id_idx` (`offer_id`),
  CONSTRAINT `fk_logOffers_offer_id` FOREIGN KEY (`offer_id`) 
  REFERENCES `Offer` (`id`)
  ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

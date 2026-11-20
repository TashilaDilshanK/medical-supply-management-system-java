-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               8.0.27 - MySQL Community Server - GPL
-- Server OS:                    Win64
-- HeidiSQL Version:             12.0.0.6468
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Dumping database structure for msd_db
CREATE DATABASE IF NOT EXISTS `msd_db` /*!40100 DEFAULT CHARACTER SET utf8 */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `msd_db`;

-- Dumping structure for table msd_db.batch_number
CREATE TABLE IF NOT EXISTS `batch_number` (
  `bn_id` int NOT NULL AUTO_INCREMENT,
  `prod` date NOT NULL DEFAULT '0000-00-00',
  `exd` date NOT NULL DEFAULT '0000-00-00',
  `conttry` varchar(45) NOT NULL,
  `ur` varchar(45) NOT NULL,
  `item_id` int NOT NULL,
  `brand_id` int NOT NULL,
  `m_id` int NOT NULL,
  PRIMARY KEY (`bn_id`),
  KEY `fk_batch_number_item1_idx` (`item_id`),
  KEY `fk_batch_number_brand1_idx` (`brand_id`),
  KEY `fk_batch_number_medicin1_idx` (`m_id`),
  CONSTRAINT `fk_batch_number_brand1` FOREIGN KEY (`brand_id`) REFERENCES `brand` (`id`),
  CONSTRAINT `fk_batch_number_item1` FOREIGN KEY (`item_id`) REFERENCES `item` (`id`),
  CONSTRAINT `fk_batch_number_medicin1` FOREIGN KEY (`m_id`) REFERENCES `medicin` (`m_id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb3;

-- Dumping data for table msd_db.batch_number: ~11 rows (approximately)
INSERT INTO `batch_number` (`bn_id`, `prod`, `exd`, `conttry`, `ur`, `item_id`, `brand_id`, `m_id`) VALUES
	(1, '2022-05-08', '2023-12-05', 'US', '250', 1, 1, 3),
	(2, '2022-06-06', '2025-04-01', 'UK', '300', 1, 2, 1),
	(3, '2022-01-05', '2025-04-12', 'JP', '800', 1, 2, 2),
	(4, '2021-04-05', '2023-08-19', 'Chaina', '525', 1, 1, 1),
	(5, '2022-05-09', '2025-04-05', 'Koreyan', '4000', 2, 3, 2),
	(6, '2022-06-05', '2025-05-09', 'UK', '250', 2, 1, 2),
	(7, '2022-07-29', '2025-07-29', 'AS', '450', 2, 2, 2),
	(8, '2022-07-28', '2027-07-30', 'JP', '45', 1, 1, 1),
	(9, '2022-07-30', '2024-07-30', 'UK', '50', 1, 6, 7),
	(10, '2022-07-25', '2024-12-30', 'US', '500', 2, 1, 6),
	(11, '2022-08-08', '2027-08-12', 'US', '500', 2, 8, 12);

-- Dumping structure for table msd_db.batch_number_has_suplyi_or
CREATE TABLE IF NOT EXISTS `batch_number_has_suplyi_or` (
  `id` int NOT NULL AUTO_INCREMENT,
  `bn_id` int NOT NULL,
  `sup_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_batch_number_has_suplyi_or_suplyi_or1_idx` (`sup_id`),
  KEY `fk_batch_number_has_suplyi_or_batch_number1_idx` (`bn_id`),
  CONSTRAINT `fk_batch_number_has_suplyi_or_batch_number1` FOREIGN KEY (`bn_id`) REFERENCES `batch_number` (`bn_id`),
  CONSTRAINT `fk_batch_number_has_suplyi_or_suplyi_or1` FOREIGN KEY (`sup_id`) REFERENCES `suplyi_or` (`sup_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb3;

-- Dumping data for table msd_db.batch_number_has_suplyi_or: ~7 rows (approximately)
INSERT INTO `batch_number_has_suplyi_or` (`id`, `bn_id`, `sup_id`) VALUES
	(1, 3, 1),
	(2, 2, 3),
	(3, 2, 26),
	(4, 3, 27),
	(5, 7, 28),
	(6, 7, 29),
	(7, 3, 29);

-- Dumping structure for table msd_db.brand
CREATE TABLE IF NOT EXISTS `brand` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb3;

-- Dumping data for table msd_db.brand: ~8 rows (approximately)
INSERT INTO `brand` (`id`, `name`) VALUES
	(1, 'MSC'),
	(2, 'SSM'),
	(3, 'LOMAC'),
	(4, 'LLB'),
	(5, 'SS'),
	(6, 'NISH'),
	(7, 'DER'),
	(8, 'NKS');

-- Dumping structure for table msd_db.company
CREATE TABLE IF NOT EXISTS `company` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `contact_number` varchar(12) NOT NULL,
  `email` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3;

-- Dumping data for table msd_db.company: ~4 rows (approximately)
INSERT INTO `company` (`id`, `name`, `contact_number`, `email`) VALUES
	(1, 'LODA', '0715589756', 'nikniogyud4@gmail.com'),
	(2, 'CKS', '0713478651', 'dh28@gmail.com'),
	(3, 'MS', '0702405879', 'fgavgh@gmail.com'),
	(4, 'DTOD', '0784569357', 'wer@gmail.com');

-- Dumping structure for table msd_db.famecies
CREATE TABLE IF NOT EXISTS `famecies` (
  `id` int NOT NULL AUTO_INCREMENT,
  `fname` varchar(45) NOT NULL,
  `lname` varchar(45) NOT NULL,
  `address` varchar(95) NOT NULL,
  `contact` varchar(12) NOT NULL,
  `email` varchar(50) NOT NULL,
  `gender_id` int NOT NULL,
  `hospitel_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_famecies_gender1_idx` (`gender_id`),
  KEY `fk_famecies_hospitel1_idx` (`hospitel_id`),
  CONSTRAINT `fk_famecies_gender1` FOREIGN KEY (`gender_id`) REFERENCES `gender` (`g_id`),
  CONSTRAINT `fk_famecies_hospitel1` FOREIGN KEY (`hospitel_id`) REFERENCES `hospitel` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3;

-- Dumping data for table msd_db.famecies: ~2 rows (approximately)
INSERT INTO `famecies` (`id`, `fname`, `lname`, `address`, `contact`, `email`, `gender_id`, `hospitel_id`) VALUES
	(1, 'Hasan', 'Dewka', '25/D,Gampaha', '0754698758', 'hdewka123@gmail.com', 2, 1),
	(2, 'Manuka', 'Deeptha', '45/D,Seethawaka', '0701245893', 'mdeeptha@gmail.com', 1, 1);

-- Dumping structure for table msd_db.gender
CREATE TABLE IF NOT EXISTS `gender` (
  `g_id` int NOT NULL AUTO_INCREMENT,
  `gender` varchar(6) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`g_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;

-- Dumping data for table msd_db.gender: ~2 rows (approximately)
INSERT INTO `gender` (`g_id`, `gender`) VALUES
	(1, 'Male'),
	(2, 'Female'),
	(3, 'Other');

-- Dumping structure for table msd_db.grn
CREATE TABLE IF NOT EXISTS `grn` (
  `id` int NOT NULL AUTO_INCREMENT,
  `supplier_id` int NOT NULL,
  `date_time` datetime NOT NULL,
  `user_id` int NOT NULL,
  `unique_id` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_grn_supplier1_idx` (`supplier_id`),
  KEY `fk_grn_user1_idx` (`user_id`),
  CONSTRAINT `fk_grn_supplier1` FOREIGN KEY (`supplier_id`) REFERENCES `supplier` (`id`),
  CONSTRAINT `fk_grn_user1` FOREIGN KEY (`user_id`) REFERENCES `user` (`u_id`)
) ENGINE=InnoDB AUTO_INCREMENT=71 DEFAULT CHARSET=utf8mb3;

-- Dumping data for table msd_db.grn: ~55 rows (approximately)
INSERT INTO `grn` (`id`, `supplier_id`, `date_time`, `user_id`, `unique_id`) VALUES
	(10, 1, '2022-07-29 02:50:10', 1, '1'),
	(11, 1, '2022-07-29 03:53:48', 1, '1'),
	(12, 1, '2022-07-29 03:56:03', 1, '1'),
	(13, 1, '2022-07-29 03:57:36', 1, '1'),
	(14, 1, '2022-07-29 04:00:15', 1, '1'),
	(15, 1, '2022-07-30 05:53:56', 1, '1'),
	(16, 1, '2022-07-30 05:55:20', 1, '1'),
	(17, 1, '2022-07-30 05:55:25', 1, '1'),
	(18, 1, '2022-07-30 05:55:30', 1, '1'),
	(19, 1, '2022-07-30 05:55:34', 1, '0'),
	(20, 1, '2022-07-30 05:55:43', 1, '0'),
	(21, 1, '2022-07-30 05:55:44', 1, '0'),
	(22, 1, '2022-07-30 05:55:44', 1, '0'),
	(23, 1, '2022-07-30 05:56:14', 1, '0'),
	(24, 1, '2022-07-30 05:56:16', 1, '0'),
	(25, 1, '2022-07-30 05:56:54', 1, '0'),
	(26, 1, '2022-07-30 05:56:55', 1, '0'),
	(27, 1, '2022-07-30 05:57:10', 1, '0'),
	(28, 1, '2022-07-30 05:57:42', 1, '0'),
	(29, 1, '2022-07-30 05:57:43', 1, '0'),
	(30, 1, '2022-07-30 05:57:45', 1, '0'),
	(31, 1, '2022-07-30 05:57:47', 1, '0'),
	(32, 1, '2022-07-30 05:57:48', 1, '0'),
	(33, 1, '2022-07-30 05:57:50', 1, '0'),
	(34, 1, '2022-07-30 05:57:52', 1, '0'),
	(35, 1, '2022-07-30 05:57:54', 1, '0'),
	(36, 1, '2022-07-30 05:57:55', 1, '0'),
	(37, 1, '2022-07-30 05:57:56', 1, '0'),
	(38, 1, '2022-07-30 05:57:59', 1, '0'),
	(39, 1, '2022-07-30 05:58:02', 1, '0'),
	(40, 1, '2022-07-30 05:58:03', 1, '0'),
	(41, 1, '2022-07-30 06:05:36', 1, '0'),
	(42, 1, '2022-07-30 06:09:06', 1, '0'),
	(43, 1, '2022-07-30 06:49:09', 1, '0'),
	(44, 1, '2022-07-30 06:50:29', 1, '0'),
	(45, 1, '2022-07-30 07:08:14', 1, '0'),
	(46, 2, '2022-08-03 04:57:50', 1, '0'),
	(47, 2, '2022-08-03 05:07:00', 1, '0'),
	(48, 2, '2022-08-03 05:09:10', 1, '0'),
	(49, 2, '2022-08-03 05:11:18', 1, '0'),
	(50, 2, '2022-08-03 05:12:53', 1, '0'),
	(51, 1, '2022-08-03 05:20:50', 1, '0'),
	(52, 1, '2022-08-03 05:22:53', 1, '0'),
	(54, 1, '2022-08-03 14:17:15', 1, '0'),
	(56, 2, '2022-08-03 15:10:08', 1, '1659519608239-0'),
	(57, 2, '2022-08-03 15:12:37', 1, '1659519757223-1'),
	(58, 2, '2022-08-03 15:17:53', 1, '1659520073062-1'),
	(63, 3, '2022-08-03 21:27:22', 1, '1659542242098-1'),
	(64, 3, '2022-08-03 21:27:32', 1, '1659542252206-1'),
	(65, 3, '2022-08-03 21:27:34', 1, '1659542254840-1'),
	(66, 3, '2022-08-03 21:32:23', 1, '1659542543945-1'),
	(67, 3, '2022-08-03 21:32:26', 1, '1659542546924-1'),
	(68, 3, '2022-08-03 21:32:29', 1, '1659542549456-1'),
	(69, 3, '2022-08-03 21:32:31', 1, '1659542551316-1'),
	(70, 3, '2022-08-03 21:36:43', 1, '1659542803152-1');

-- Dumping structure for table msd_db.grn_item
CREATE TABLE IF NOT EXISTS `grn_item` (
  `id` int NOT NULL AUTO_INCREMENT,
  `quantity` int NOT NULL,
  `grn_id` int NOT NULL,
  `stock_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_grn_item_grn1_idx` (`grn_id`),
  KEY `fk_grn_item_stock1_idx` (`stock_id`),
  CONSTRAINT `fk_grn_item_grn1` FOREIGN KEY (`grn_id`) REFERENCES `grn` (`id`),
  CONSTRAINT `fk_grn_item_stock1` FOREIGN KEY (`stock_id`) REFERENCES `stock` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8mb3;

-- Dumping data for table msd_db.grn_item: ~27 rows (approximately)
INSERT INTO `grn_item` (`id`, `quantity`, `grn_id`, `stock_id`) VALUES
	(1, 50, 10, 2),
	(2, 50, 11, 3),
	(3, 50, 11, 2),
	(4, 41, 13, 3),
	(5, 700, 15, 4),
	(6, 20, 43, 1),
	(7, 200, 44, 2),
	(8, 750, 45, 34),
	(9, 20, 46, 2),
	(10, 12, 47, 2),
	(11, 20, 48, 2),
	(12, 50, 49, 2),
	(13, 50, 50, 35),
	(14, 50, 51, 1),
	(15, 20, 52, 35),
	(16, 50, 54, 1),
	(17, 50, 56, 2),
	(18, 20, 57, 35),
	(19, 50, 58, 34),
	(20, 200, 63, 36),
	(21, 200, 64, 36),
	(22, 200, 65, 36),
	(23, 200, 66, 36),
	(24, 200, 67, 36),
	(25, 200, 68, 36),
	(26, 200, 69, 36),
	(27, 50, 70, 36);

-- Dumping structure for table msd_db.grn_payment
CREATE TABLE IF NOT EXISTS `grn_payment` (
  `id` int NOT NULL AUTO_INCREMENT,
  `grn_id` int NOT NULL,
  `payment_type_id` int NOT NULL,
  `payment` double NOT NULL,
  `balance` double DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_grn_payment_grn1_idx` (`grn_id`),
  KEY `fk_grn_payment_payment_type1_idx` (`payment_type_id`),
  CONSTRAINT `fk_grn_payment_grn1` FOREIGN KEY (`grn_id`) REFERENCES `grn` (`id`),
  CONSTRAINT `fk_grn_payment_payment_type1` FOREIGN KEY (`payment_type_id`) REFERENCES `payment_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=59 DEFAULT CHARSET=utf8mb3;

-- Dumping data for table msd_db.grn_payment: ~55 rows (approximately)
INSERT INTO `grn_payment` (`id`, `grn_id`, `payment_type_id`, `payment`, `balance`) VALUES
	(4, 10, 1, 2000, 1000),
	(5, 11, 1, 20000, 9000),
	(6, 12, 1, 5000, 2500),
	(7, 13, 1, 2000, 1795),
	(8, 14, 1, 100, 10),
	(9, 15, 1, 15000, 1000),
	(10, 16, 1, 10000, 2000),
	(11, 17, 1, 10000, 2000),
	(12, 18, 1, 10000, 2000),
	(13, 19, 1, 10000, 2000),
	(14, 20, 1, 10000, 2000),
	(15, 21, 1, 10000, 2000),
	(16, 22, 1, 10000, 2000),
	(17, 23, 1, 10000, 2000),
	(18, 24, 1, 10000, 2000),
	(19, 25, 1, 10000, 2000),
	(20, 26, 1, 10000, 2000),
	(21, 27, 1, 10000, 2000),
	(22, 28, 1, 10000, 2000),
	(23, 29, 1, 10000, 2000),
	(24, 30, 1, 10000, 2000),
	(25, 31, 1, 10000, 2000),
	(26, 32, 1, 10000, 2000),
	(27, 33, 1, 10000, 2000),
	(28, 34, 1, 10000, 2000),
	(29, 35, 1, 10000, 2000),
	(30, 36, 1, 10000, 2000),
	(31, 37, 1, 10000, 2000),
	(32, 38, 1, 10000, 2000),
	(33, 39, 1, 10000, 2000),
	(34, 40, 1, 10000, 2000),
	(35, 41, 1, 400, 0),
	(36, 42, 1, 10000, 0),
	(37, 43, 1, 500, 100),
	(38, 44, 1, 1000, 0),
	(39, 45, 1, 900000, 36000),
	(40, 46, 1, 100, 0),
	(41, 47, 1, 100, 40),
	(42, 48, 1, 1000, 900),
	(43, 49, 1, 2000, 1000),
	(44, 50, 1, 1000, 500),
	(45, 51, 1, 1000, 500),
	(46, 52, 1, 500, 300),
	(47, 54, 1, 2000, 1000),
	(48, 56, 2, 2000, 1000),
	(49, 57, 2, 500, 300),
	(50, 58, 2, 2000, 1000),
	(51, 63, 3, 10000, 0),
	(52, 64, 3, 10000, 0),
	(53, 65, 3, 10000, 0),
	(54, 66, 3, 10000, 0),
	(55, 67, 3, 10000, 0),
	(56, 68, 3, 10000, 0),
	(57, 69, 3, 10000, 0),
	(58, 70, 2, 2000, 1000);

-- Dumping structure for table msd_db.hed_famecies
CREATE TABLE IF NOT EXISTS `hed_famecies` (
  `id` int NOT NULL AUTO_INCREMENT,
  `fname` varchar(45) NOT NULL,
  `lname` varchar(45) NOT NULL,
  `address` varchar(95) NOT NULL,
  `contact` varchar(12) NOT NULL,
  `email` varchar(50) NOT NULL,
  `g_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_hed_famecies_gender1_idx` (`g_id`) USING BTREE,
  CONSTRAINT `fk_hed_famecies_gender1` FOREIGN KEY (`g_id`) REFERENCES `gender` (`g_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3;

-- Dumping data for table msd_db.hed_famecies: ~4 rows (approximately)
INSERT INTO `hed_famecies` (`id`, `fname`, `lname`, `address`, `contact`, `email`, `g_id`) VALUES
	(1, 'Kamal', 'senarathna', '25/d,mahara', '0784569520', 'ks23@gmail,com', 1),
	(2, 'Madul', 'Hashunka', '57/D,', '0775698743', 'mhashu8@gmail.com', 1),
	(3, 'Pubudu', 'Tharanga', '56/C', '0745657890', 'ftgfvlhyv;.igbj', 1),
	(4, 'Kasun', 'Heshan', '58/B Colombu', '0774568221', 'kha@gmail.com', 1);

-- Dumping structure for table msd_db.hospitel
CREATE TABLE IF NOT EXISTS `hospitel` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `address` varchar(75) NOT NULL,
  `email` varchar(45) NOT NULL,
  `contact` varchar(12) NOT NULL,
  `ms` varchar(100) NOT NULL,
  `hed_famecies_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_hospitel_hed_famecies1_idx` (`hed_famecies_id`),
  CONSTRAINT `fk_hospitel_hed_famecies1` FOREIGN KEY (`hed_famecies_id`) REFERENCES `hed_famecies` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3;

-- Dumping data for table msd_db.hospitel: ~4 rows (approximately)
INSERT INTO `hospitel` (`id`, `name`, `address`, `email`, `contact`, `ms`, `hed_famecies_id`) VALUES
	(1, 'Jathika Rohala', 'colombu', 'jathikarohala@gmail.com', '0112404605', 'Dr.Maheshan Wikramage', 2),
	(2, 'Disa Rohala', 'Gampaha', 'disarohalaG@gmail.com', '0112404698', 'Dr.kamal Disanayaka', 1),
	(3, 'Maha Rohala', 'Kaluthara', 'maharoh.k23@gmail.com', '0112404987', 'Dr.Manusha Dewka', 1),
	(4, 'Lama Rohala', 'Colombu', 'lamar.com@gmail', '0112404987', 'DR.Achintha Senadeera', 2);

-- Dumping structure for table msd_db.item
CREATE TABLE IF NOT EXISTS `item` (
  `id` int NOT NULL AUTO_INCREMENT,
  `item` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3;

-- Dumping data for table msd_db.item: ~2 rows (approximately)
INSERT INTO `item` (`id`, `item`) VALUES
	(1, 'Normal'),
	(2, 'Cool');

-- Dumping structure for table msd_db.medicin
CREATE TABLE IF NOT EXISTS `medicin` (
  `m_id` int NOT NULL AUTO_INCREMENT,
  `medicin` varchar(45) NOT NULL,
  PRIMARY KEY (`m_id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb3;

-- Dumping data for table msd_db.medicin: ~12 rows (approximately)
INSERT INTO `medicin` (`m_id`, `medicin`) VALUES
	(1, 'panadol'),
	(2, 'perasitamol'),
	(3, 'amocshilen'),
	(4, 'piretan'),
	(5, 'Digen'),
	(6, 'Panadol'),
	(7, 'Amocshilen'),
	(8, 'Selayine'),
	(9, 'Synofam'),
	(10, 'Covisheeld'),
	(11, 're'),
	(12, 'gg');

-- Dumping structure for table msd_db.office
CREATE TABLE IF NOT EXISTS `office` (
  `idoffice` int NOT NULL AUTO_INCREMENT,
  `contact` varchar(45) NOT NULL,
  `email` varchar(45) NOT NULL,
  PRIMARY KEY (`idoffice`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3;

-- Dumping data for table msd_db.office: ~2 rows (approximately)
INSERT INTO `office` (`idoffice`, `contact`, `email`) VALUES
	(1, '0112404569', 'gampahamaharohala@gmail.com'),
	(2, '0112404566', 'nuwarajathikarohala@gmail.com');

-- Dumping structure for table msd_db.payment_type
CREATE TABLE IF NOT EXISTS `payment_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;

-- Dumping data for table msd_db.payment_type: ~3 rows (approximately)
INSERT INTO `payment_type` (`id`, `name`) VALUES
	(1, 'Card'),
	(2, 'Cash'),
	(3, 'Chek');

-- Dumping structure for table msd_db.reqwest_order
CREATE TABLE IF NOT EXISTS `reqwest_order` (
  `id` int NOT NULL AUTO_INCREMENT,
  `date` varchar(10) NOT NULL,
  `name` varchar(45) NOT NULL,
  `qty` varchar(45) NOT NULL,
  `hospitel_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_order_hospitel1_idx` (`hospitel_id`),
  CONSTRAINT `fk_order_hospitel1` FOREIGN KEY (`hospitel_id`) REFERENCES `hospitel` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3;

-- Dumping data for table msd_db.reqwest_order: ~4 rows (approximately)
INSERT INTO `reqwest_order` (`id`, `date`, `name`, `qty`, `hospitel_id`) VALUES
	(1, '20201212', 'Pandol', '250', 1),
	(2, '20210206', 'Amocshilin', '500', 4),
	(3, '20210309', 'Digin', '700', 2),
	(4, '20210509', 'Piretan', '40', 3);

-- Dumping structure for table msd_db.stock
CREATE TABLE IF NOT EXISTS `stock` (
  `id` int NOT NULL AUTO_INCREMENT,
  `m_id` int NOT NULL,
  `qut` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_stock_medicin1_idx` (`m_id`),
  CONSTRAINT `fk_stock_medicin1` FOREIGN KEY (`m_id`) REFERENCES `medicin` (`m_id`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8mb3;

-- Dumping data for table msd_db.stock: ~7 rows (approximately)
INSERT INTO `stock` (`id`, `m_id`, `qut`) VALUES
	(1, 1, 260),
	(2, 2, 277),
	(3, 3, 91),
	(4, 4, 1200),
	(34, 7, 800),
	(35, 6, 90),
	(36, 12, 1450);

-- Dumping structure for table msd_db.suplyi_or
CREATE TABLE IF NOT EXISTS `suplyi_or` (
  `sup_id` int NOT NULL AUTO_INCREMENT,
  `date` date NOT NULL DEFAULT '0000-00-00',
  `qty` int NOT NULL,
  `v_id` int NOT NULL,
  `order_id` int NOT NULL,
  PRIMARY KEY (`sup_id`),
  KEY `fk_suplyi_or_Vehical1_idx` (`v_id`),
  KEY `fk_suplyi_or_reqwest_order1_idx` (`order_id`),
  CONSTRAINT `fk_suplyi_or_reqwest_order1` FOREIGN KEY (`order_id`) REFERENCES `reqwest_order` (`id`),
  CONSTRAINT `fk_suplyi_or_Vehical1` FOREIGN KEY (`v_id`) REFERENCES `vehical` (`v_id`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8mb3;

-- Dumping data for table msd_db.suplyi_or: ~9 rows (approximately)
INSERT INTO `suplyi_or` (`sup_id`, `date`, `qty`, `v_id`, `order_id`) VALUES
	(1, '2021-09-12', 250, 2, 1),
	(3, '2021-12-05', 500, 1, 2),
	(26, '2021-06-30', 500, 1, 3),
	(27, '2021-09-22', 25, 2, 4),
	(28, '2022-08-08', 45, 1, 4),
	(29, '2022-08-11', 85, 1, 4),
	(30, '2022-08-02', 500, 1, 4),
	(31, '2022-08-03', 500, 2, 3),
	(32, '2022-08-03', 20, 2, 4);

-- Dumping structure for table msd_db.supplier
CREATE TABLE IF NOT EXISTS `supplier` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `contact_number` varchar(45) NOT NULL,
  `email` varchar(45) NOT NULL,
  `company_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_supplier_company1_idx` (`company_id`),
  CONSTRAINT `fk_supplier_company1` FOREIGN KEY (`company_id`) REFERENCES `company` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;

-- Dumping data for table msd_db.supplier: ~3 rows (approximately)
INSERT INTO `supplier` (`id`, `name`, `contact_number`, `email`, `company_id`) VALUES
	(1, 'Sanka', '0714569852', 'ert@gmail.com', 1),
	(2, 'Pasidu', '0774598456', 'wet@gmail.com', 2),
	(3, 'kalana', '0714589658', 'ks23@gmail.com', 4);

-- Dumping structure for table msd_db.user
CREATE TABLE IF NOT EXISTS `user` (
  `u_id` int NOT NULL AUTO_INCREMENT,
  `fname` varchar(45) NOT NULL,
  `lname` varchar(45) NOT NULL,
  `mobile` varchar(12) NOT NULL,
  `email` varchar(80) NOT NULL,
  `password` varchar(50) NOT NULL,
  `g_id` int NOT NULL,
  `user_type_id` int NOT NULL,
  PRIMARY KEY (`u_id`),
  KEY `fk_user_user_type1_idx` (`user_type_id`),
  KEY `fk_user_gender1_idx` (`g_id`) USING BTREE,
  CONSTRAINT `fk_user_gender1` FOREIGN KEY (`g_id`) REFERENCES `gender` (`g_id`),
  CONSTRAINT `fk_user_user_type1` FOREIGN KEY (`user_type_id`) REFERENCES `user_type` (`type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3;

-- Dumping data for table msd_db.user: ~4 rows (approximately)
INSERT INTO `user` (`u_id`, `fname`, `lname`, `mobile`, `email`, `password`, `g_id`, `user_type_id`) VALUES
	(1, 'Tashila', 'Dilshan', '0713573651', 'tdkumara2@gmail.com', '123', 1, 1),
	(2, 'Maduka', 'Ashan', '0705698756', 'mashan@gmail.com', '123', 1, 2),
	(3, 'kamal', 'depadesh', '0778941269', 'kdep12@gmail.com', '123', 1, 2),
	(4, 'Kamal', 'Madusanka', '0714585697', 'km23@gmail.com', '456', 1, 2);

-- Dumping structure for table msd_db.user_type
CREATE TABLE IF NOT EXISTS `user_type` (
  `type_id` int NOT NULL AUTO_INCREMENT,
  `user_type` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3;

-- Dumping data for table msd_db.user_type: ~2 rows (approximately)
INSERT INTO `user_type` (`type_id`, `user_type`) VALUES
	(1, 'Super Addmin'),
	(2, 'Addming');

-- Dumping structure for table msd_db.vehical
CREATE TABLE IF NOT EXISTS `vehical` (
  `v_id` int NOT NULL AUTO_INCREMENT,
  `v_number` varchar(45) NOT NULL,
  `v_type_id` int NOT NULL,
  PRIMARY KEY (`v_id`),
  KEY `fk_Vehical_v_type1_idx` (`v_type_id`),
  CONSTRAINT `fk_Vehical_v_type1` FOREIGN KEY (`v_type_id`) REFERENCES `v_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3;

-- Dumping data for table msd_db.vehical: ~2 rows (approximately)
INSERT INTO `vehical` (`v_id`, `v_number`, `v_type_id`) VALUES
	(1, 'Gs-1245', 4),
	(2, 'C-5246', 3);

-- Dumping structure for table msd_db.v_type
CREATE TABLE IF NOT EXISTS `v_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `v_type` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb3;

-- Dumping data for table msd_db.v_type: ~8 rows (approximately)
INSERT INTO `v_type` (`id`, `v_type`) VALUES
	(1, 'Van'),
	(2, 'Cabs'),
	(3, 'Bus'),
	(4, 'Normal Lorry'),
	(5, 'Cool Lorry'),
	(6, 'Threewheel'),
	(7, 'Car'),
	(8, 'Ambulance');

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
usersauthoremployee
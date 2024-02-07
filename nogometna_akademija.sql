-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Feb 07, 2024 at 05:21 AM
-- Server version: 8.2.0
-- PHP Version: 8.2.13

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `nogometna_akademija`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

DROP TABLE IF EXISTS `admin`;
CREATE TABLE IF NOT EXISTS `admin` (
  `id` int NOT NULL AUTO_INCREMENT,
  `username_admin` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `pravo_id` int NOT NULL COMMENT 'FK',
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username_admin`),
  UNIQUE KEY `username_admin` (`username_admin`),
  KEY `FK_PravoAdmin` (`pravo_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`id`, `username_admin`, `pravo_id`) VALUES
(1, 'admin', 1);

-- --------------------------------------------------------

--
-- Table structure for table `ekipa`
--

DROP TABLE IF EXISTS `ekipa`;
CREATE TABLE IF NOT EXISTS `ekipa` (
  `id` int NOT NULL AUTO_INCREMENT,
  `uzrast` set('U13','U15','U17','U19','S') NOT NULL,
  `velicina_ekipe` int NOT NULL,
  `trener_id` int NOT NULL COMMENT 'FK',
  PRIMARY KEY (`id`),
  KEY `FK_TrenerEkipa` (`trener_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `ekipa`
--

INSERT INTO `ekipa` (`id`, `uzrast`, `velicina_ekipe`, `trener_id`) VALUES
(1, 'S', 18, 1),
(2, 'U19', 13, 1);

-- --------------------------------------------------------

--
-- Table structure for table `igrac`
--

DROP TABLE IF EXISTS `igrac`;
CREATE TABLE IF NOT EXISTS `igrac` (
  `id` int NOT NULL AUTO_INCREMENT,
  `ime` varchar(15) NOT NULL,
  `prezime` varchar(20) NOT NULL,
  `DOB` date NOT NULL,
  `pozicija` set('GK','DF','MF','WG','FW') NOT NULL,
  `jaca_noga` set('D','L') NOT NULL,
  `status` set('Dostupan','Ozlijeđen','Isključen') NOT NULL DEFAULT 'Dostupan',
  `username_igrac` varchar(25) NOT NULL COMMENT 'FK',
  `trener_username` varchar(25) DEFAULT NULL COMMENT 'FK',
  PRIMARY KEY (`id`),
  UNIQUE KEY `username_igrac` (`username_igrac`),
  KEY `FK_TrenerIgrac` (`trener_username`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `igrac`
--

INSERT INTO `igrac` (`id`, `ime`, `prezime`, `DOB`, `pozicija`, `jaca_noga`, `status`, `username_igrac`, `trener_username`) VALUES
(16, 'Ivko', 'Ivok', '2024-02-06', 'GK', 'D', 'Ozlijeđen', 'Ivo', 'Leao'),
(17, 'Petar', 'Perić', '2000-06-29', 'DF', 'L', 'Dostupan', 'Perko', 'Leao');

-- --------------------------------------------------------

--
-- Table structure for table `korisnik`
--

DROP TABLE IF EXISTS `korisnik`;
CREATE TABLE IF NOT EXISTS `korisnik` (
  `username` varchar(25) NOT NULL,
  `lozinka` varchar(25) NOT NULL,
  `pravo_id` int NOT NULL COMMENT 'FK',
  PRIMARY KEY (`username`),
  KEY `FK_PravoKorisnik` (`pravo_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `korisnik`
--

INSERT INTO `korisnik` (`username`, `lozinka`, `pravo_id`) VALUES
('admin', 'admin', 1),
('Bule', 'Bul', 2),
('Ivo', '123', 3),
('Leao', 'dona', 2),
('Perko', '123', 3),
('Pero', '123', 2),
('Prdo234', '123', 2);

-- --------------------------------------------------------

--
-- Table structure for table `prava`
--

DROP TABLE IF EXISTS `prava`;
CREATE TABLE IF NOT EXISTS `prava` (
  `id` int NOT NULL AUTO_INCREMENT,
  `naziv` varchar(25) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `prava`
--

INSERT INTO `prava` (`id`, `naziv`) VALUES
(1, 'Administrator'),
(2, 'Trener'),
(3, 'Igrač');

-- --------------------------------------------------------

--
-- Table structure for table `statistike`
--

DROP TABLE IF EXISTS `statistike`;
CREATE TABLE IF NOT EXISTS `statistike` (
  `username_igrac` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'FK',
  `nastupi` int DEFAULT NULL,
  `golovi` int DEFAULT NULL,
  `asistencije` int DEFAULT NULL,
  `zuti_karton` int DEFAULT NULL,
  `crveni_karton` int DEFAULT NULL,
  PRIMARY KEY (`username_igrac`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `statistike`
--

INSERT INTO `statistike` (`username_igrac`, `nastupi`, `golovi`, `asistencije`, `zuti_karton`, `crveni_karton`) VALUES
('Ivo', 12, 50, 100, 12, 0),
('Perko', 15, 6, 3, 4, 1);

-- --------------------------------------------------------

--
-- Table structure for table `trener`
--

DROP TABLE IF EXISTS `trener`;
CREATE TABLE IF NOT EXISTS `trener` (
  `id` int NOT NULL AUTO_INCREMENT,
  `ime` varchar(15) NOT NULL,
  `prezime` varchar(20) NOT NULL,
  `username_trener` varchar(25) NOT NULL COMMENT 'FK',
  PRIMARY KEY (`id`),
  UNIQUE KEY `username_trener` (`username_trener`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `trener`
--

INSERT INTO `trener` (`id`, `ime`, `prezime`, `username_trener`) VALUES
(5, 'Nikola', 'Marinović', 'Leao'),
(6, 'Ivan', 'Perić', 'Pero'),
(8, 'Toni', 'Buljić', 'Bule'),
(21, 'Pero', 'Peric', 'Prdo234');

-- --------------------------------------------------------

--
-- Table structure for table `utakmica`
--

DROP TABLE IF EXISTS `utakmica`;
CREATE TABLE IF NOT EXISTS `utakmica` (
  `id` int NOT NULL AUTO_INCREMENT,
  `natjecanje` set('Liga','Kup','Prijateljska') NOT NULL,
  `trener_username` varchar(25) NOT NULL COMMENT 'FK',
  `protivnik` varchar(30) NOT NULL,
  `rezultat` set('Pobjeda','Izjednačeno','Izgubljena') CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_TrenerUtakmica` (`trener_username`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `utakmica`
--

INSERT INTO `utakmica` (`id`, `natjecanje`, `trener_username`, `protivnik`, `rezultat`) VALUES
(10, 'Liga', 'Leao', 'Ip', 'Izjednačeno'),
(11, 'Kup', 'Bule', 'Buje', NULL);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `admin`
--
ALTER TABLE `admin`
  ADD CONSTRAINT `FK_KorisnikAdmin` FOREIGN KEY (`username_admin`) REFERENCES `korisnik` (`username`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `FK_PravoAdmin` FOREIGN KEY (`pravo_id`) REFERENCES `prava` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Constraints for table `igrac`
--
ALTER TABLE `igrac`
  ADD CONSTRAINT `FK_KorisnikIgrac` FOREIGN KEY (`username_igrac`) REFERENCES `korisnik` (`username`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `FK_TrenerIgrac` FOREIGN KEY (`trener_username`) REFERENCES `trener` (`username_trener`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Constraints for table `korisnik`
--
ALTER TABLE `korisnik`
  ADD CONSTRAINT `FK_PravoKorisnik` FOREIGN KEY (`pravo_id`) REFERENCES `prava` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Constraints for table `statistike`
--
ALTER TABLE `statistike`
  ADD CONSTRAINT `FK_IgracStatistika` FOREIGN KEY (`username_igrac`) REFERENCES `igrac` (`username_igrac`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Constraints for table `trener`
--
ALTER TABLE `trener`
  ADD CONSTRAINT `FK_KorisnikTrener` FOREIGN KEY (`username_trener`) REFERENCES `korisnik` (`username`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Constraints for table `utakmica`
--
ALTER TABLE `utakmica`
  ADD CONSTRAINT `FK_TrenerUtakmica` FOREIGN KEY (`trener_username`) REFERENCES `trener` (`username_trener`) ON DELETE RESTRICT ON UPDATE RESTRICT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

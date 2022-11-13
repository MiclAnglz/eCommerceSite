-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 13, 2022 at 10:16 AM
-- Server version: 10.4.22-MariaDB
-- PHP Version: 8.1.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `autoservices`
--
CREATE DATABASE IF NOT EXISTS `autoservices` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `autoservices`;

-- --------------------------------------------------------

--
-- Table structure for table `booking`
--

CREATE TABLE `booking` (
  `id` int(11) NOT NULL,
  `bookingNum` varchar(10) NOT NULL,
  `bookingDate` date NOT NULL,
  `rego` varchar(6) NOT NULL,
  `custNum` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `booking`
--

INSERT INTO `booking` (`id`, `bookingNum`, `bookingDate`, `rego`, `custNum`) VALUES
(1, 'B0001', '2022-01-11', 'SLOW', 8),
(2, 'B0002', '2022-01-12', 'BEYOND', 2),
(3, 'B0003', '2022-01-11', 'FUZZ', 9),
(4, 'B0004', '2022-01-11', 'NICE', 3),
(5, 'B0005', '2022-01-11', 'FAST', 3),
(6, 'B0006', '2022-01-12', 'SMART', 4),
(7, 'B0007', '2022-01-12', 'SLOWER', 8),
(8, 'B0008', '2022-01-12', '007', 11),
(9, 'B0009', '2022-01-12', 'COPZ', 9),
(10, 'B0010', '2022-01-12', 'LAMBY', 1),
(11, 'B0011', '2022-01-13', 'WRONG', 5),
(12, 'B0012', '2022-01-13', 'BEYOND', 2),
(13, 'B0013', '2022-01-13', 'FUZZ', 9),
(14, 'B0014', '2022-01-13', 'NICE', 3),
(15, 'B0015', '2022-01-13', 'FAST', 3),
(16, 'B0016', '2022-01-13', 'SMART', 4),
(17, 'B0017', '2022-01-12', 'SLOWER', 8),
(18, 'B0018', '2022-01-13', '007', 11),
(19, 'B0019', '2022-01-14', 'COPZ', 9),
(20, 'B0020', '2022-01-14', 'WRONG', 5),
(21, 'B0021', '2022-01-14', 'SLOW', 8),
(22, 'B0022', '2022-01-14', 'BEYOND', 2),
(23, 'B0023', '2022-01-14', 'GRUMBL', 6),
(24, 'B0024', '2022-01-14', 'TESTR', 12),
(25, 'B0025', '2022-01-14', 'FAST', 3),
(26, 'B0026', '2022-01-15', 'SMART', 4),
(27, 'B0027', '2022-01-15', 'XLR8', 10),
(28, 'B0028', '2022-01-15', '007', 11),
(29, 'B0029', '2022-01-15', 'SED8', 9),
(30, 'B0030', '2022-01-15', 'LAMBY', 1),
(31, 'B0031', '2022-01-17', 'GRUMBL', 6),
(32, 'B0032', '2022-01-17', 'NFNITY', 2),
(33, 'B0033', '2022-01-17', 'FUZZ', 9),
(34, 'B0034', '2022-01-17', 'XXXX82', 7),
(35, 'B0035', '2022-01-17', 'FAST', 3),
(36, 'B0036', '2022-01-17', 'SMART', 4),
(37, 'B0037', '2022-01-17', 'SLOWER', 8),
(38, 'B0038', '2022-01-17', 'XLR8', 10),
(39, 'B0039', '2022-01-17', 'COPZ', 9),
(40, 'B0040', '2022-01-17', 'LAMBY', 1),
(41, 'B0041', '2022-01-18', 'SLOW', 8),
(42, 'B0042', '2022-01-18', 'BEYOND', 2),
(43, 'B0043', '2022-01-18', 'SED8', 9),
(44, 'B0044', '2022-01-18', 'NICE', 3),
(45, 'B0045', '2022-01-19', 'TESTR', 12),
(46, 'B0046', '2022-01-19', 'XXXX82', 7),
(47, 'B0047', '2022-01-19', 'SLOWER', 8),
(48, 'B0048', '2022-01-19', 'GRUMBL', 6),
(49, 'B0049', '2022-01-19', 'COPZ', 9),
(50, 'B0050', '2022-01-19', 'LAMBY', 1),
(51, 'B0051', '2022-01-19', 'SLOW', 8),
(52, 'B0052', '2022-01-19', 'XXXX82', 7),
(53, 'B0053', '2022-01-20', 'FUZZ', 9),
(54, 'B0054', '2022-01-20', 'GRUMBL', 6),
(55, 'B0055', '2022-01-20', 'FAST', 3),
(56, 'B0056', '2022-01-20', 'SMART', 4),
(57, 'B0057', '2022-01-20', 'SLOWER', 8),
(58, 'B0058', '2022-01-20', '007', 11),
(59, 'B0059', '2022-01-20', 'WRONG', 5),
(60, 'B0060', '2022-01-20', 'NFNITY', 2),
(61, 'B0061', '2022-01-21', 'WRONG', 5),
(62, 'B0062', '2022-01-21', 'BEYOND', 2),
(63, 'B0063', '2022-01-21', 'FUZZ', 9),
(64, 'B0064', '2022-01-22', 'NICE', 3),
(65, 'B0065', '2022-01-22', 'FAST', 3),
(66, 'B0066', '2022-01-22', 'SMART', 4),
(67, 'B0067', '2022-01-22', 'SLOWER', 8),
(68, 'B0068', '2022-01-22', '007', 11),
(69, 'B0069', '2022-01-24', 'COPZ', 9),
(70, 'B0070', '2022-01-24', 'WRONG', 5),
(71, 'B0071', '2022-01-24', 'SLOW', 8),
(72, 'B0072', '2022-01-24', 'BEYOND', 2),
(73, 'B0073', '2022-01-24', 'GRUMBL', 6),
(74, 'B0074', '2022-01-25', 'NICE', 3),
(75, 'B0075', '2022-01-25', 'FAST', 3),
(76, 'B0076', '2022-01-25', 'SMART', 4),
(77, 'B0077', '2022-01-25', 'XLR8', 10),
(78, 'B0078', '2022-01-25', '007', 11),
(79, 'B0079', '2022-01-25', 'SED8', 9),
(80, 'B0080', '2022-01-25', 'LAMBY', 1),
(81, 'B0081', '2022-01-25', 'GRUMBL', 6),
(82, 'B0082', '2022-01-25', 'NFNITY', 2),
(83, 'B0083', '2022-01-25', 'FUZZ', 9),
(84, 'B0084', '2022-01-25', 'XXXX82', 7),
(85, 'B0085', '2022-01-25', 'FAST', 3),
(86, 'B0086', '2022-01-25', 'SMART', 4),
(87, 'B0087', '2022-01-26', 'SLOWER', 8),
(88, 'B0088', '2022-01-26', 'XLR8', 10),
(89, 'B0089', '2022-01-26', 'TESTR', 12),
(90, 'B0090', '2022-01-26', 'LAMBY', 1),
(91, 'B0091', '2022-01-26', 'SLOW', 8),
(92, 'B0092', '2022-01-27', 'BEYOND', 2),
(93, 'B0093', '2022-01-27', 'SED8', 9),
(94, 'B0094', '2022-01-27', 'NICE', 3),
(95, 'B0095', '2022-01-27', 'FAST', 3),
(96, 'B0096', '2022-01-27', 'XXXX82', 7),
(97, 'B0097', '2022-01-27', 'SLOWER', 8),
(98, 'B0098', '2022-01-27', 'GRUMBL', 6),
(99, 'B0099', '2022-01-28', 'COPZ', 9),
(100, 'B0100', '2022-01-28', 'LAMBY', 1),
(101, 'B0101', '2022-01-28', 'SLOW', 8),
(102, 'B0102', '2022-01-28', 'XXXX82', 7),
(103, 'B0103', '2022-01-28', 'FUZZ', 9),
(104, 'B0104', '2022-01-28', 'GRUMBL', 6),
(105, 'B0105', '2022-01-28', 'FAST', 3),
(106, 'B0106', '2022-01-28', 'SMART', 4),
(107, 'B0107', '2022-01-29', 'TESTR', 12),
(108, 'B0108', '2022-01-29', '007', 11),
(109, 'B0109', '2022-01-29', 'WRONG', 5),
(110, 'B0110', '2022-01-29', 'NFNITY', 2);

-- --------------------------------------------------------

--
-- Table structure for table `bookingservice`
--

CREATE TABLE `bookingservice` (
  `id` int(11) NOT NULL,
  `bookingNum` varchar(10) NOT NULL,
  `servNum` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `bookingservice`
--

INSERT INTO `bookingservice` (`id`, `bookingNum`, `servNum`) VALUES
(1, 'B0001', 1),
(2, 'B0001', 5),
(3, 'B0001', 14),
(4, 'B0002', 17),
(5, 'B0003', 20),
(6, 'B0003', 17),
(7, 'B0004', 3),
(8, 'B0004', 14),
(9, 'B0005', 4),
(10, 'B0006', 1),
(11, 'B0006', 3),
(12, 'B0006', 20),
(13, 'B0006', 17),
(14, 'B0007', 10),
(15, 'B0008', 17),
(16, 'B0009', 10),
(17, 'B0009', 17),
(18, 'B0010', 4),
(19, 'B0010', 20),
(20, 'B0011', 1),
(21, 'B0012', 1),
(22, 'B0013', 5),
(23, 'B0014', 14),
(24, 'B0014', 17),
(25, 'B0014', 20),
(26, 'B0014', 1),
(27, 'B0014', 3),
(28, 'B0015', 14),
(29, 'B0016', 4),
(30, 'B0017', 1),
(31, 'B0018', 3),
(32, 'B0019', 20),
(33, 'B0020', 17),
(34, 'B0021', 10),
(35, 'B0022', 17),
(36, 'B0022', 10),
(37, 'B0023', 17),
(38, 'B0023', 4),
(39, 'B0024', 20),
(40, 'B0024', 1),
(41, 'B0025', 1),
(42, 'B0026', 5),
(43, 'B0027', 14),
(44, 'B0028', 17),
(45, 'B0029', 20),
(46, 'B0030', 1),
(47, 'B0031', 3),
(48, 'B0032', 14),
(49, 'B0033', 4),
(50, 'B0034', 1),
(51, 'B0035', 3),
(52, 'B0036', 20),
(53, 'B0037', 17),
(54, 'B0038', 10),
(55, 'B0039', 17),
(56, 'B0040', 10),
(57, 'B0041', 17),
(58, 'B0042', 4),
(59, 'B0043', 20),
(60, 'B0044', 1),
(61, 'B0045', 1),
(62, 'B0046', 5),
(63, 'B0047', 14),
(64, 'B0048', 17),
(65, 'B0049', 20),
(66, 'B0050', 1),
(67, 'B0051', 3),
(68, 'B0052', 14),
(69, 'B0053', 4),
(70, 'B0054', 1),
(71, 'B0055', 3),
(72, 'B0056', 20),
(73, 'B0057', 17),
(74, 'B0058', 10),
(75, 'B0059', 17),
(76, 'B0060', 10),
(77, 'B0060', 17),
(78, 'B0060', 4),
(79, 'B0060', 20),
(80, 'B0061', 1),
(81, 'B0062', 1),
(82, 'B0063', 5),
(83, 'B0064', 14),
(84, 'B0064', 17),
(85, 'B0064', 20),
(86, 'B0064', 1),
(87, 'B0065', 3),
(88, 'B0065', 14),
(89, 'B0066', 4),
(90, 'B0067', 1),
(91, 'B0067', 3),
(92, 'B0068', 20),
(93, 'B0069', 17),
(94, 'B0069', 10),
(95, 'B0070', 17),
(96, 'B0070', 10),
(97, 'B0070', 17),
(98, 'B0071', 4),
(99, 'B0072', 20),
(100, 'B0073', 1),
(101, 'B0074', 1),
(102, 'B0075', 5),
(103, 'B0076', 14),
(104, 'B0077', 17),
(105, 'B0078', 20),
(106, 'B0079', 1),
(107, 'B0080', 3),
(108, 'B0081', 14),
(109, 'B0082', 4),
(110, 'B0083', 1),
(111, 'B0084', 3),
(112, 'B0084', 20),
(113, 'B0085', 17),
(114, 'B0086', 10),
(115, 'B0087', 17),
(116, 'B0088', 10),
(117, 'B0089', 17),
(118, 'B0090', 4),
(119, 'B0090', 20),
(120, 'B0090', 1),
(121, 'B0091', 1),
(122, 'B0092', 5),
(123, 'B0093', 14),
(124, 'B0093', 17),
(125, 'B0095', 20),
(126, 'B0096', 1),
(127, 'B0097', 3),
(128, 'B0098', 14),
(129, 'B0098', 4),
(130, 'B0099', 1),
(131, 'B0099', 3),
(132, 'B0099', 20),
(133, 'B0099', 17),
(134, 'B0100', 10),
(135, 'B0100', 17),
(136, 'B0101', 1),
(137, 'B0101', 20),
(138, 'B0102', 20),
(139, 'B0103', 7),
(140, 'B0104', 3),
(141, 'B0105', 5),
(142, 'B0106', 20),
(143, 'B0106', 17),
(144, 'B0107', 2),
(145, 'B0108', 9),
(146, 'B0109', 6),
(147, 'B0110', 5),
(148, 'B0110', 2),
(149, 'B0110', 20),
(150, 'B0107', 20),
(151, 'B0107', 6);

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `id` int(11) NOT NULL,
  `custNum` int(11) NOT NULL,
  `title` varchar(20) CHARACTER SET utf8 DEFAULT NULL,
  `firstName` varchar(20) CHARACTER SET utf8 DEFAULT NULL,
  `familyName` varchar(30) CHARACTER SET utf8 NOT NULL,
  `contact` varchar(10) CHARACTER SET utf8 DEFAULT NULL,
  `email` varchar(60) CHARACTER SET utf8 DEFAULT NULL,
  `houseNum` varchar(10) CHARACTER SET utf8 NOT NULL,
  `street` varchar(20) CHARACTER SET utf8 NOT NULL,
  `suburb` varchar(20) CHARACTER SET utf8 NOT NULL,
  `state` varchar(3) CHARACTER SET utf8 NOT NULL,
  `postCode` varchar(4) CHARACTER SET utf8 NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`id`, `custNum`, `title`, `firstName`, `familyName`, `contact`, `email`, `houseNum`, `street`, `suburb`, `state`, `postCode`) VALUES
(1, 1, 'Miss', 'Mary', 'Hadalittlelamb', '0246258898', 'baaaa@hotmail.com', '7', 'Fleece St', 'Meadowville', 'NSW', '2560'),
(2, 2, 'Mr', 'Buzz**', 'Lightyear', '0246552200', 'buzzboy@yahoo.com', '1000', '**Spaceranger Rd', '**IntergalacticHQ', 'NSW', '2566'),
(3, 3, 'Mrs', 'Ilene', 'Over', '0246261202', NULL, '12', 'Benlow Cl', 'Campbelltown', 'NSW', '2560'),
(4, 4, 'Mr', 'Simple', 'Ton', '0246897887', 'simpleton@gmail.com', '1', 'Difficult St', 'Bradbury', 'NSW', '2560'),
(5, 5, 'Miss', 'Under', 'Standing', '0248563453', 'gotitwrong@hotmail.com', '19', 'Mistaken Ave', 'Camden', 'NSW', '2570'),
(6, 6, 'Mrs', 'Mona', 'Lott', '0246257878', 'grumblebum@hotmail.com', '9', 'Darkcloud Pl', 'Ruse', 'NSW', '2560'),
(7, 7, 'Mr', 'Ben', 'Dover', '0246269090', NULL, '233', 'Long St', 'Ruse', 'NSW', '2560'),
(8, 8, 'Mr', 'Justin', 'Time', '0246203788', NULL, '1', 'Neverlate Pl', 'Leumeah', 'NSW', '2560'),
(9, 9, 'Miss', 'Laura', 'Norder', '0246344533', 'crimestopper@yahoo.com', '87', 'Straight street', 'Camden', 'NSW', '2570'),
(10, 10, 'Mr', 'Gene', 'Poole', '0246573434', NULL, '20', 'Chromosome Cl', 'Liverpool', 'NSW', '2555'),
(11, 11, 'Mr', 'James', 'Bond', '0246007007', 'bond@MI5.gov.uk', '1', 'Safe St', 'Sydney', 'NSW', '2000'),
(12, 12, 'Dr', 'Bob', 'Lightyear', '1234567890', 'bob@me.com', '21', 'Test Street', 'Testville', 'NSW', '2000');

-- --------------------------------------------------------

--
-- Table structure for table `customercar`
--

CREATE TABLE `customercar` (
  `id` int(11) NOT NULL,
  `custNum` int(11) NOT NULL,
  `rego` varchar(6) CHARACTER SET utf8 NOT NULL,
  `make` varchar(15) CHARACTER SET utf8 NOT NULL,
  `model` varchar(30) CHARACTER SET utf8 DEFAULT NULL,
  `yearMan` varchar(4) CHARACTER SET utf8 DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `customercar`
--

INSERT INTO `customercar` (`id`, `custNum`, `rego`, `make`, `model`, `yearMan`) VALUES
(1, 6, 'GRUMBL', 'Ford', 'Festiva', '1990'),
(2, 1, 'LAMBY', 'Toyota', 'Echo', '2005'),
(3, 2, 'NFNITY', 'Subaru', 'Liberty', '2007'),
(4, 2, 'BEYOND', 'Mitsubishi', 'Lancer Evolution IX Turbo', '2007'),
(5, 8, 'SLOW', 'Ford', 'Escort', '1970'),
(6, 8, 'SLOWER', 'Subaru', 'Impreza', '2016'),
(7, 9, 'FUZZ', 'Volvo', 'S40', '2002'),
(8, 10, 'XLR8', 'Porsche', 'Boxster 2.7L Roadster', '2010'),
(9, 4, 'SMART', 'Smart', 'Fortwo Turbo Coupe', '2010'),
(10, 5, 'WRONG', 'Daihatsu', 'Charade GL', '1990'),
(11, 7, 'XXXX82', 'Holden', 'Statesman', '1982'),
(12, 3, 'FAST', 'Lotus', 'EXIGE 1.8L Coupe', '2007'),
(13, 3, 'FASTER', 'SUBARU', 'Impreza WRX Sedan', '2007'),
(14, 3, 'NICE', 'BMW', 'Z4 3.0si Coupe', '2007'),
(16, 9, 'SED8', 'Ford', 'Focus', '2010'),
(17, 9, 'COPZ', 'Holden', 'Commodore SS', '2009'),
(20, 11, '007', 'Aston Martin', 'Vanquish S', '2006'),
(21, 12, 'TESTR', 'FORD', 'TERRITORY', '2009');

-- --------------------------------------------------------

--
-- Table structure for table `nextservice`
--

CREATE TABLE `nextservice` (
  `id` int(11) NOT NULL,
  `rego` varchar(6) CHARACTER SET utf8 NOT NULL,
  `serviceDue` datetime NOT NULL,
  `servNum` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `nextservice`
--

INSERT INTO `nextservice` (`id`, `rego`, `serviceDue`, `servNum`) VALUES
(1, 'FUZZ', '2022-06-06 00:00:00', 14),
(2, 'XLR8', '2022-06-16 00:00:00', 9),
(3, 'SLOWER', '2022-07-13 00:00:00', 15),
(4, 'FAST', '2022-05-25 00:00:00', 9),
(5, 'FASTER', '2022-10-14 00:00:00', 9),
(6, 'FASTER', '2022-10-14 00:00:00', 2),
(7, 'BEYOND', '2022-11-30 00:00:00', 10),
(8, 'FUZZ', '2022-10-27 00:00:00', 4),
(9, 'FUZZ', '2022-10-27 00:00:00', 1),
(10, 'FUZZ', '2022-10-27 00:00:00', 17),
(11, 'XLR8', '2022-04-20 00:00:00', 1),
(12, 'FAST', '2022-01-10 00:00:00', 4),
(13, 'SLOWER', '2022-03-18 00:00:00', 5);

-- --------------------------------------------------------

--
-- Table structure for table `service`
--

CREATE TABLE `service` (
  `id` int(11) NOT NULL,
  `servNum` int(11) NOT NULL,
  `servName` varchar(50) NOT NULL,
  `description` varchar(1000) NOT NULL DEFAULT 'no description available',
  `price` decimal(10,2) NOT NULL DEFAULT 0.00,
  `servType` char(1) NOT NULL DEFAULT 'a'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `service`
--

INSERT INTO `service` (`id`, `servNum`, `servName`, `description`, `price`, `servType`) VALUES
(1, 1, '**Wheel Alignment - Front Wheel Drive', '**Suitable for front wheel drive vehicles our superior wheel alignment service will help your car stay on track. Do you ever get that shuddering feeling in the steering wheel? It is likely that your wheels are out of alignment. Using the latest computerised equipment ensures the most accurate wheel alignment in town. Not only do we have the best equipment but the best trained mechanics around and we guarantee our work for 3 months or 5000 km - which ever comes first. Wheel balancing is included in this service.', '70.00', 'a'),
(2, 2, '**Wheel Alignment - Four Wheel Drive', '**Suitable for four wheel drive vehicles our off-road wheel alignment service will help your 4WD stay on track. For a 4WD (or AWD) vehicle it is recomended that all four wheels are adjusted thats why this service is a little more expensive. Using the latest computerised equipment ensures the most accurate wheel alignment in town. Not only do we have the best equipment but the best trained mechanics around and we guarantee our work for 3 months or 5000 km - which ever comes first. Wheel balancing of all wheels is included in this service.', '110.50', 'a'),
(3, 3, '**Wheel balance x 4', '**Help prolong the life of your tyres by ensuring that each wheel is properly balanced. We recommend this is done on a 6 monthly basis at the same time that you do a tyre rotation. We offer standard and premium balancing services. The prices shown are for a standard balance. Ask our staff about the benefits of a premium balance when you drop your car off for its next service. You\'ll be glad you did.', '30.00', 'a'),
(4, 4, '**Replace disc brake pads (front or rear)', '**Time to replace those brake pads? Then we can do it for you (for a price). We only use high quality brake pads so you don\'t need to worry about how long they will last. They won\'t fall apart or seize in extreme weather conditions unlike some that other mechanics use. Just tell us if it is front or rear brakes that need new pads - leave the rest to us.', '150.00', 'a'),
(5, 5, '**Replace drum brake linings (front or rear)', '**Got an older car with drum brakes? No problems, we can replace your worn brake linings for you. We only use high quality brake linings so you don\'t need to worry about how long they will last. They won\'t fall apart or seize in extreme weather conditions unlike some that other mechanics use. Just tell us if it is front or rear brakes that need new linings - leave the rest to us.', '170.00', 'a'),
(6, 6, '**Supply and install tow bar', '**Don\'t trust fitting a new tow bar to your car to anyone else. Our fitters are second to none. They\'ll get it right the first time.', '750.00', 'a'),
(8, 9, '**6 month log book service', '**Our 6 month log book service will ensure that you keep your new car warranty with the manufacturer. Guaranteed.', '250.00', 's'),
(9, 10, '**12 month log book service', '**Your car serviced by the manufacturers specification.  No need to worry about losing your new car warranty.', '260.00', 's'),
(10, 17, '**Full Car Detail', '**Want that new car feeling again? Then our Full Car Detail is for you and your car. We give your car a complete make over and make sure it is spotless from headlights to exhaust. We\'ll clean your engine bay, shampoo your carpets, clean and deodorise the seats, wash and polish the exterior. We even polish the tow ball. Your car won\'t know itself. And don\'t worry about water restrictions - we use fully recycled water in our environmentally friendly wash bays.', '120.00', 'a'),
(11, 14, '**Other minor service', '**Regular servicing of your car will keep running clean and healthy. Service includes 5 Litres of premium Oil, Oil filter and full safety inspection and report..', '120.00', 's'),
(12, 15, '**Other major service', '**Car out of warranty but due for a major service? Why not try Aus Autoservice. Service includes oil and filter change, diff oil change, transmission oil change, 4 spark plugs, engine tune. Engine & Safety inspection and report.', '550.00', 's'),
(13, 20, '**Testing Service', '**A new service for testing code**', '100.00', 'a');

-- --------------------------------------------------------

--
-- Table structure for table `staff`
--

CREATE TABLE `staff` (
  `id` int(11) NOT NULL,
  `staffID` varchar(6) CHARACTER SET utf8 NOT NULL,
  `password` varchar(20) CHARACTER SET utf8 NOT NULL,
  `firstName` varchar(20) NOT NULL,
  `familyName` varchar(30) NOT NULL,
  `job` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `staff`
--

INSERT INTO `staff` (`id`, `staffID`, `password`, `firstName`, `familyName`, `job`) VALUES
(1, 'V12345', 'letmein', 'Bob', 'Down', 'owner'),
(2, 'V22222', 'pleaseletmein', 'Fred', 'Smith', 'manager'),
(3, 'V23456', 'okgo', 'Granny', 'Smith', 'clerk'),
(4, 'V98765', 'nuts', 'Mike', 'Smith', 'mechanic'),
(5, 'V87654', 'smithfamily', 'Bill', 'Smith', 'mechanic'),
(6, 'V76543', 'caughtout', 'Joe', 'Sandilands', 'mechanic'),
(7, 'A123', 'hello', 'Mike', 'Mechanic', 'mechanic');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `booking`
--
ALTER TABLE `booking`
  ADD KEY `id` (`id`);

--
-- Indexes for table `bookingservice`
--
ALTER TABLE `bookingservice`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`);

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD KEY `id` (`id`);

--
-- Indexes for table `customercar`
--
ALTER TABLE `customercar`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`);

--
-- Indexes for table `nextservice`
--
ALTER TABLE `nextservice`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`);

--
-- Indexes for table `service`
--
ALTER TABLE `service`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`);

--
-- Indexes for table `staff`
--
ALTER TABLE `staff`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `booking`
--
ALTER TABLE `booking`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=111;

--
-- AUTO_INCREMENT for table `bookingservice`
--
ALTER TABLE `bookingservice`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=152;

--
-- AUTO_INCREMENT for table `customer`
--
ALTER TABLE `customer`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `customercar`
--
ALTER TABLE `customercar`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `nextservice`
--
ALTER TABLE `nextservice`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `service`
--
ALTER TABLE `service`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `staff`
--
ALTER TABLE `staff`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- Database: `eshop`
--
CREATE DATABASE IF NOT EXISTS `eshop` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `eshop`;

-- --------------------------------------------------------

--
-- Table structure for table `order_detail`
--

CREATE TABLE `order_detail` (
  `detail_id` int(11) NOT NULL,
  `detail_product_id` int(11) NOT NULL,
  `detail_qty` int(11) NOT NULL DEFAULT 1,
  `detail_price` float NOT NULL,
  `detail_order_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `order_detail`
--

INSERT INTO `order_detail` (`detail_id`, `detail_product_id`, `detail_qty`, `detail_price`, `detail_order_id`) VALUES
(3, 1, 1, 65, 31),
(4, 2, 19, 5, 31),
(5, 1, 19, 65, 32),
(6, 3, 1, 25, 32),
(7, 4, 9, 19, 32),
(8, 8, 11, 12, 32),
(9, 1, 1, 65, 35),
(10, 2, 1, 5, 35),
(20, 1, 1, 65, 49),
(21, 2, 5, 5, 49),
(55, 3, 1, 25, 70),
(56, 5, 2, 5, 71),
(57, 8, 2, 12, 71),
(58, 4, 1, 19, 72),
(59, 3, 1, 25, 73),
(60, 6, 5, 24, 73),
(61, 4, 9, 19, 74),
(62, 7, 7, 33, 74),
(63, 6, 1, 24, 74),
(64, 5, 1, 5, 75);

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `product_id` int(11) NOT NULL,
  `product_name` varchar(255) NOT NULL,
  `product_description` text NOT NULL,
  `product_price` float NOT NULL,
  `product_stock` int(11) NOT NULL,
  `product_image` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`product_id`, `product_name`, `product_description`, `product_price`, `product_stock`, `product_image`) VALUES
(1, 'DVD Player', 'The ultra compact DVD Player with intelligent multi-disc resume function, will keep the whole family entertained. Requires DVDs to play.', 65, 100, 'dvd-image.jpg'),
(2, 'Stylish Black Cap', 'A simplistic black cap can make a statement: \"I\'m wearing a black cap\".  This snap back style cap features a mesh back. Available colours: black', 5, 20, 'black-hat.jpg'),
(3, 'Round Basket Ball', 'From Round Balls is this Dominate Basketball that is for outdoor use and features an easier hand alignment and ball control with a soft-touch cushioned rubber that has an aggressive pebbled texture cover.', 25, 30, 'nike-ball.jpg'),
(4, 'Novelty Coffee Cup', 'Ever wanted to see how much coffee is left in your coffee cup? This novelty coffee cup with a cork heat resistant band is a great replacement to the paper cups given at local cafes. Never be left wondering do you still have coffee in your cup!', 19, 10, 'coffee-cup.jpg'),
(5, 'Can Holder', 'Organise your cans of drink in your fridge. Save Space, while having more cold drinks. ', 5, 30, 'drink-holder.jpg'),
(6, 'Novelty Light', 'Ever wanted to set the mood at night? This novelty light will make you feel like you\'re in a theme park!', 24, 15, 'novelty-light.jpg'),
(7, 'Hover Ball', 'Who needs a drone! This hover ball is great way to spend your weekends. Choking Hazard: Do not swallow the ball.', 33, 8, 'hover-ball.jpg'),
(8, 'Whisky Decanter', 'Nothing says sophistication better than a cheap decanter! Hand blown and comes with 2 tumblers.', 12, 13, 'decanter.jpg'),
(9, 'Stapler', 'This ply wood hand stapler is ergonomic allowing you to staple for hours. With its easy refilling mechanism it is essential for any home office. Staple holding capcity before refil: 5 staples.', 50, 0, 'stapler.jpg'),
(10, 'Dart Board', 'Liven up your parties by gathering around the dart board. Because it is electronic it tallies the score for you! It wil keep the fun rolling well after the party has finished.', 5, 0, 'dart-board.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `user_id` int(11) NOT NULL,
  `user_email` varchar(255) NOT NULL,
  `user_password` varchar(255) NOT NULL,
  `user_fname` varchar(45) NOT NULL,
  `user_lname` varchar(45) NOT NULL,
  `user_street` varchar(45) NOT NULL,
  `user_suburb` varchar(45) NOT NULL,
  `user_state` varchar(3) NOT NULL,
  `user_post_code` varchar(5) NOT NULL,
  `user_type` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`user_id`, `user_email`, `user_password`, `user_fname`, `user_lname`, `user_street`, `user_suburb`, `user_state`, `user_post_code`, `user_type`) VALUES
(1, 'admin@example.com', '8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918', 'John', 'Smith', '5 Chocolate Ln', 'Wonker', 'NSW', '2000', 'admin'),
(2, 'user@example.com', '4234a9cea21fa911110cf36e96cd887049543ca31e7c95e04028290bde1db1e0', 'Sarah', 'Michals', '55 John Street', 'parramatta', 'NSW', '2500', 'user'),
(48, '20455936@student.westernsydney.edu.au', '27c687ecd15feaa7c78878a671e1cced436e48259872a0e41cffbed5e19bca21', 'Michael', 'Angeles', '2 John Street', 'Quakers Hill', 'NSW', '2765', 'user'),
(49, 'michael.angeles1983@gmail.com', '1ac46917668aa9f1f97c7b65da31e1007be48659f29fcaa7c5fe8c9eae4a22e7', 'Chris', 'Scott', '15 Scaddan Street', 'parramatta', 'NSW', '2765', 'user'),
(53, 'mic_angeles@hotmail.com', '564eda9dc32c87f3f87f1634d6aae557050d0ecf20be253d65ca4b602995be6c', 'John', 'Smaith', '1 dsfsdfsd', 'parramatta', 'NSW', '2765', 'user'),
(54, 'c.wiria@me.com', 'ee25be255009049e69e0ad05c08596895df2b683eb635c1c6d178d7cf41fe2cb', 'Christina', 'Wiria', '27 Mathew Street', 'Blacktown', 'NSW', '2765', 'user'),
(55, 'dog@gmail.com', '201204bdb8584f477fc56376d2ecd1b2d5ce49f8d3bf5d05d7e4483ee85f3101', 'Harry', 'Potter', '15 Over Road', 'Cabramatta', 'NSW', '4567', 'user'),
(61, 'm@me.com', '55c382190674e477c6071ccc7a196dcc1ef66735f9e19323857a1626b287f486', 'Mark', 'Santos', '4 John street', 'parramatta', 'NSW', '2765', 'user'),
(62, 'gymp@gmail.com', '80af8846c4593d49bf96d093e9583cade31f3650f852114924ecc083b61f9fa3', 'Cam', 'Stansil', '1 Gymp Street', 'parramatta', 'NSW', '2765', 'user'),
(64, 'mic@gmail.com', 'c67cb0c443638fac85453062bdfb31483173737d97a01c2f353aee1e0e4d29e3', 'Mikael', 'Anglz', '4 Marion Street', 'Eastwood', 'NSW', '2587', 'user'),
(65, 'm@hot.com', '79e603e6ea3404e09fd2c83802db66767f25b6af8e9d0bb3e65c837218bf645a', 'Reyn', 'Angeles', '1 Markus Avenue', 'Parra', 'NSW', '2000', 'user'),
(66, 'testing@gmail.com', 'e2e81497493badb39e5d6eef8faf04550e44848e3738993fdc685a800a2b5f0a', 'Jason', 'Williams', '1 Grot Street', 'Parramatta', 'NSW', '2765', 'user'),
(67, 'grot@gmail.com', 'e2e81497493badb39e5d6eef8faf04550e44848e3738993fdc685a800a2b5f0a', 'Jay', 'Connor', '3 Grot', 'Parra', 'NSW', '2765', 'user'),
(68, 'reyn@gmail.com', 'e2e81497493badb39e5d6eef8faf04550e44848e3738993fdc685a800a2b5f0a', 'Reyn', 'Angeles', '1 Madeup', 'Hurtsville', 'TAS', '2435', 'user');

-- --------------------------------------------------------

--
-- Table structure for table `user_order`
--

CREATE TABLE `user_order` (
  `order_id` int(11) NOT NULL,
  `order_datetime` datetime NOT NULL,
  `order_user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `user_order`
--

INSERT INTO `user_order` (`order_id`, `order_datetime`, `order_user_id`) VALUES
(31, '2022-01-31 02:06:00', 2),
(32, '2022-01-31 02:17:18', 2),
(35, '2022-01-31 04:11:45', 48),
(49, '2022-02-01 01:49:40', 54),
(50, '2022-02-02 03:48:55', 2),
(51, '2022-02-02 03:52:16', 2),
(52, '2022-02-02 07:55:54', 2),
(53, '2022-02-02 07:59:20', 2),
(54, '2022-02-02 08:20:33', 2),
(60, '2022-02-03 04:52:09', 2),
(61, '2022-02-03 05:19:36', 2),
(67, '2022-02-03 07:25:21', 2),
(68, '2022-02-03 10:55:51', 2),
(69, '2022-02-03 11:22:57', 2),
(70, '2022-02-04 12:40:21', 2),
(71, '2022-04-28 03:29:49', 64),
(72, '2022-04-28 08:37:44', 65),
(73, '2022-05-03 08:31:59', 64),
(74, '2022-05-11 02:14:59', 64),
(75, '2022-11-11 06:38:38', 67);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `order_detail`
--
ALTER TABLE `order_detail`
  ADD PRIMARY KEY (`detail_id`),
  ADD KEY `order_fk_idx` (`detail_order_id`),
  ADD KEY `product_fk_idx` (`detail_product_id`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`product_id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`user_id`);

--
-- Indexes for table `user_order`
--
ALTER TABLE `user_order`
  ADD PRIMARY KEY (`order_id`),
  ADD KEY `user_fk_idx` (`order_user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `order_detail`
--
ALTER TABLE `order_detail`
  MODIFY `detail_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=65;

--
-- AUTO_INCREMENT for table `product`
--
ALTER TABLE `product`
  MODIFY `product_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=69;

--
-- AUTO_INCREMENT for table `user_order`
--
ALTER TABLE `user_order`
  MODIFY `order_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=76;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `order_detail`
--
ALTER TABLE `order_detail`
  ADD CONSTRAINT `order_fk` FOREIGN KEY (`detail_order_id`) REFERENCES `user_order` (`order_id`),
  ADD CONSTRAINT `product_fk` FOREIGN KEY (`detail_product_id`) REFERENCES `product` (`product_id`);

--
-- Constraints for table `user_order`
--
ALTER TABLE `user_order`
  ADD CONSTRAINT `user_fk` FOREIGN KEY (`order_user_id`) REFERENCES `user` (`user_id`);
--
-- Database: `phpmyadmin`
--
CREATE DATABASE IF NOT EXISTS `phpmyadmin` DEFAULT CHARACTER SET utf8 COLLATE utf8_bin;
USE `phpmyadmin`;

-- --------------------------------------------------------

--
-- Table structure for table `pma__bookmark`
--

CREATE TABLE `pma__bookmark` (
  `id` int(10) UNSIGNED NOT NULL,
  `dbase` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `user` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `label` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `query` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Bookmarks';

-- --------------------------------------------------------

--
-- Table structure for table `pma__central_columns`
--

CREATE TABLE `pma__central_columns` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `col_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `col_type` varchar(64) COLLATE utf8_bin NOT NULL,
  `col_length` text COLLATE utf8_bin DEFAULT NULL,
  `col_collation` varchar(64) COLLATE utf8_bin NOT NULL,
  `col_isNull` tinyint(1) NOT NULL,
  `col_extra` varchar(255) COLLATE utf8_bin DEFAULT '',
  `col_default` text COLLATE utf8_bin DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Central list of columns';

-- --------------------------------------------------------

--
-- Table structure for table `pma__column_info`
--

CREATE TABLE `pma__column_info` (
  `id` int(5) UNSIGNED NOT NULL,
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `column_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `comment` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `mimetype` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `transformation` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `transformation_options` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `input_transformation` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `input_transformation_options` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Column information for phpMyAdmin';

-- --------------------------------------------------------

--
-- Table structure for table `pma__designer_settings`
--

CREATE TABLE `pma__designer_settings` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `settings_data` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Settings related to Designer';

-- --------------------------------------------------------

--
-- Table structure for table `pma__export_templates`
--

CREATE TABLE `pma__export_templates` (
  `id` int(5) UNSIGNED NOT NULL,
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `export_type` varchar(10) COLLATE utf8_bin NOT NULL,
  `template_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `template_data` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Saved export templates';

-- --------------------------------------------------------

--
-- Table structure for table `pma__favorite`
--

CREATE TABLE `pma__favorite` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `tables` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Favorite tables';

-- --------------------------------------------------------

--
-- Table structure for table `pma__history`
--

CREATE TABLE `pma__history` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `username` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `db` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `table` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `timevalue` timestamp NOT NULL DEFAULT current_timestamp(),
  `sqlquery` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='SQL history for phpMyAdmin';

-- --------------------------------------------------------

--
-- Table structure for table `pma__navigationhiding`
--

CREATE TABLE `pma__navigationhiding` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `item_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `item_type` varchar(64) COLLATE utf8_bin NOT NULL,
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Hidden items of navigation tree';

-- --------------------------------------------------------

--
-- Table structure for table `pma__pdf_pages`
--

CREATE TABLE `pma__pdf_pages` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `page_nr` int(10) UNSIGNED NOT NULL,
  `page_descr` varchar(50) CHARACTER SET utf8 NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='PDF relation pages for phpMyAdmin';

-- --------------------------------------------------------

--
-- Table structure for table `pma__recent`
--

CREATE TABLE `pma__recent` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `tables` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Recently accessed tables';

--
-- Dumping data for table `pma__recent`
--

INSERT INTO `pma__recent` (`username`, `tables`) VALUES
('root', '[{\"db\":\"eshop\",\"table\":\"product\"},{\"db\":\"eshop\",\"table\":\"user_order\"},{\"db\":\"eshop\",\"table\":\"order_detail\"},{\"db\":\"eshop\",\"table\":\"user\"}]');

-- --------------------------------------------------------

--
-- Table structure for table `pma__relation`
--

CREATE TABLE `pma__relation` (
  `master_db` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `master_table` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `master_field` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `foreign_db` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `foreign_table` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `foreign_field` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Relation table';

-- --------------------------------------------------------

--
-- Table structure for table `pma__savedsearches`
--

CREATE TABLE `pma__savedsearches` (
  `id` int(5) UNSIGNED NOT NULL,
  `username` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `search_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `search_data` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Saved searches';

-- --------------------------------------------------------

--
-- Table structure for table `pma__table_coords`
--

CREATE TABLE `pma__table_coords` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `pdf_page_number` int(11) NOT NULL DEFAULT 0,
  `x` float UNSIGNED NOT NULL DEFAULT 0,
  `y` float UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Table coordinates for phpMyAdmin PDF output';

-- --------------------------------------------------------

--
-- Table structure for table `pma__table_info`
--

CREATE TABLE `pma__table_info` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `display_field` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Table information for phpMyAdmin';

-- --------------------------------------------------------

--
-- Table structure for table `pma__table_uiprefs`
--

CREATE TABLE `pma__table_uiprefs` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `prefs` text COLLATE utf8_bin NOT NULL,
  `last_update` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Tables'' UI preferences';

--
-- Dumping data for table `pma__table_uiprefs`
--

INSERT INTO `pma__table_uiprefs` (`username`, `db_name`, `table_name`, `prefs`, `last_update`) VALUES
('root', 'eshop', 'user', '{\"CREATE_TIME\":\"2022-01-17 15:42:36\",\"col_order\":[0,1,3,4,2,5,6,7,8,9],\"col_visib\":[1,1,1,1,1,1,1,1,1,1]}', '2022-01-31 02:51:03');

-- --------------------------------------------------------

--
-- Table structure for table `pma__tracking`
--

CREATE TABLE `pma__tracking` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `version` int(10) UNSIGNED NOT NULL,
  `date_created` datetime NOT NULL,
  `date_updated` datetime NOT NULL,
  `schema_snapshot` text COLLATE utf8_bin NOT NULL,
  `schema_sql` text COLLATE utf8_bin DEFAULT NULL,
  `data_sql` longtext COLLATE utf8_bin DEFAULT NULL,
  `tracking` set('UPDATE','REPLACE','INSERT','DELETE','TRUNCATE','CREATE DATABASE','ALTER DATABASE','DROP DATABASE','CREATE TABLE','ALTER TABLE','RENAME TABLE','DROP TABLE','CREATE INDEX','DROP INDEX','CREATE VIEW','ALTER VIEW','DROP VIEW') COLLATE utf8_bin DEFAULT NULL,
  `tracking_active` int(1) UNSIGNED NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Database changes tracking for phpMyAdmin';

-- --------------------------------------------------------

--
-- Table structure for table `pma__userconfig`
--

CREATE TABLE `pma__userconfig` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `timevalue` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `config_data` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='User preferences storage for phpMyAdmin';

--
-- Dumping data for table `pma__userconfig`
--

INSERT INTO `pma__userconfig` (`username`, `timevalue`, `config_data`) VALUES
('root', '2022-05-13 05:42:15', '{\"Console\\/Mode\":\"collapse\"}');

-- --------------------------------------------------------

--
-- Table structure for table `pma__usergroups`
--

CREATE TABLE `pma__usergroups` (
  `usergroup` varchar(64) COLLATE utf8_bin NOT NULL,
  `tab` varchar(64) COLLATE utf8_bin NOT NULL,
  `allowed` enum('Y','N') COLLATE utf8_bin NOT NULL DEFAULT 'N'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='User groups with configured menu items';

-- --------------------------------------------------------

--
-- Table structure for table `pma__users`
--

CREATE TABLE `pma__users` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `usergroup` varchar(64) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Users and their assignments to user groups';

--
-- Indexes for dumped tables
--

--
-- Indexes for table `pma__bookmark`
--
ALTER TABLE `pma__bookmark`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pma__central_columns`
--
ALTER TABLE `pma__central_columns`
  ADD PRIMARY KEY (`db_name`,`col_name`);

--
-- Indexes for table `pma__column_info`
--
ALTER TABLE `pma__column_info`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `db_name` (`db_name`,`table_name`,`column_name`);

--
-- Indexes for table `pma__designer_settings`
--
ALTER TABLE `pma__designer_settings`
  ADD PRIMARY KEY (`username`);

--
-- Indexes for table `pma__export_templates`
--
ALTER TABLE `pma__export_templates`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `u_user_type_template` (`username`,`export_type`,`template_name`);

--
-- Indexes for table `pma__favorite`
--
ALTER TABLE `pma__favorite`
  ADD PRIMARY KEY (`username`);

--
-- Indexes for table `pma__history`
--
ALTER TABLE `pma__history`
  ADD PRIMARY KEY (`id`),
  ADD KEY `username` (`username`,`db`,`table`,`timevalue`);

--
-- Indexes for table `pma__navigationhiding`
--
ALTER TABLE `pma__navigationhiding`
  ADD PRIMARY KEY (`username`,`item_name`,`item_type`,`db_name`,`table_name`);

--
-- Indexes for table `pma__pdf_pages`
--
ALTER TABLE `pma__pdf_pages`
  ADD PRIMARY KEY (`page_nr`),
  ADD KEY `db_name` (`db_name`);

--
-- Indexes for table `pma__recent`
--
ALTER TABLE `pma__recent`
  ADD PRIMARY KEY (`username`);

--
-- Indexes for table `pma__relation`
--
ALTER TABLE `pma__relation`
  ADD PRIMARY KEY (`master_db`,`master_table`,`master_field`),
  ADD KEY `foreign_field` (`foreign_db`,`foreign_table`);

--
-- Indexes for table `pma__savedsearches`
--
ALTER TABLE `pma__savedsearches`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `u_savedsearches_username_dbname` (`username`,`db_name`,`search_name`);

--
-- Indexes for table `pma__table_coords`
--
ALTER TABLE `pma__table_coords`
  ADD PRIMARY KEY (`db_name`,`table_name`,`pdf_page_number`);

--
-- Indexes for table `pma__table_info`
--
ALTER TABLE `pma__table_info`
  ADD PRIMARY KEY (`db_name`,`table_name`);

--
-- Indexes for table `pma__table_uiprefs`
--
ALTER TABLE `pma__table_uiprefs`
  ADD PRIMARY KEY (`username`,`db_name`,`table_name`);

--
-- Indexes for table `pma__tracking`
--
ALTER TABLE `pma__tracking`
  ADD PRIMARY KEY (`db_name`,`table_name`,`version`);

--
-- Indexes for table `pma__userconfig`
--
ALTER TABLE `pma__userconfig`
  ADD PRIMARY KEY (`username`);

--
-- Indexes for table `pma__usergroups`
--
ALTER TABLE `pma__usergroups`
  ADD PRIMARY KEY (`usergroup`,`tab`,`allowed`);

--
-- Indexes for table `pma__users`
--
ALTER TABLE `pma__users`
  ADD PRIMARY KEY (`username`,`usergroup`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `pma__bookmark`
--
ALTER TABLE `pma__bookmark`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pma__column_info`
--
ALTER TABLE `pma__column_info`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pma__export_templates`
--
ALTER TABLE `pma__export_templates`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pma__history`
--
ALTER TABLE `pma__history`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pma__pdf_pages`
--
ALTER TABLE `pma__pdf_pages`
  MODIFY `page_nr` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pma__savedsearches`
--
ALTER TABLE `pma__savedsearches`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- Database: `test`
--
CREATE DATABASE IF NOT EXISTS `test` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `test`;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

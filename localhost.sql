-- phpMyAdmin SQL Dump
-- version 2.11.11.3
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Apr 24, 2016 at 02:20 PM
-- Server version: 5.1.73
-- PHP Version: 5.3.3

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `cs4400_Team_20`
--
CREATE DATABASE `cs4400_Team_20` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `cs4400_Team_20`;

-- --------------------------------------------------------

--
-- Table structure for table `Customer`
--

DROP TABLE IF EXISTS `Customer`;
CREATE TABLE IF NOT EXISTS `Customer` (
  `Username` varchar(50) NOT NULL,
  `Email` varchar(50) NOT NULL,
  `IsStudent` tinyint(1) NOT NULL,
  PRIMARY KEY (`Username`),
  UNIQUE KEY `Email` (`Email`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Customer`
--

INSERT INTO `Customer` (`Username`, `Email`, `IsStudent`) VALUES
('GT01', 'GT01@gatech.edu', 1),
('GT02', 'GT02@gatech.edu', 1),
('GT03', 'GT03@gatech.edu', 1),
('GT04', 'GT04@gatech.edu', 1),
('GT05', 'GT05@gatech.edu', 1),
('GT06', 'GT06@gatech.edu', 1),
('GT07', 'GT07@gatech.edu', 1),
('GT08', 'GT08@gatech.edu', 1),
('GT09', 'GT09@gatech.edu', 1),
('GT10', 'GT10@gatech.edu', 1),
('NGT01', 'NGT01@gatech.edu', 0),
('NGT02', 'NGT02@gatech.edu', 0),
('NGT03', 'NGT03@gatech.edu', 0),
('NGT04', 'NGT04@gatech.edu', 0),
('NGT05', 'NGT05@gatech.edu', 0),
('NGT06', 'NGT06@gatech.edu', 0),
('NGT07', 'NGT07@gatech.edu', 0),
('NGT08', 'NGT08@gatech.edu', 0),
('NGT09', 'NGT09@gatech.edu', 0),
('NGT10', 'NGT10@gatech.edu', 0);

-- --------------------------------------------------------

--
-- Table structure for table `Manager`
--

DROP TABLE IF EXISTS `Manager`;
CREATE TABLE IF NOT EXISTS `Manager` (
  `Username` varchar(50) NOT NULL,
  PRIMARY KEY (`Username`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Manager`
--

INSERT INTO `Manager` (`Username`) VALUES
('M01'),
('M02'),
('M03'),
('M04'),
('M05');

-- --------------------------------------------------------

--
-- Table structure for table `PaymentInfo`
--

DROP TABLE IF EXISTS `PaymentInfo`;
CREATE TABLE IF NOT EXISTS `PaymentInfo` (
  `CardNum` char(16) NOT NULL,
  `CVV` char(3) NOT NULL,
  `ExpirationDate` date NOT NULL,
  `NameOnCard` varchar(50) NOT NULL,
  `Username` varchar(50) NOT NULL,
  PRIMARY KEY (`CardNum`),
  KEY `Username` (`Username`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `PaymentInfo`
--

INSERT INTO `PaymentInfo` (`CardNum`, `CVV`, `ExpirationDate`, `NameOnCard`, `Username`) VALUES
('0000000500020000', '123', '2016-05-31', 'Matt', 'NGT05'),
('0000000500010000', '123', '2016-05-31', 'Clough', 'NGT05'),
('0000000400020000', '123', '2016-05-31', 'Klaus', 'NGT04'),
('0000000400010000', '123', '2016-05-31', 'Derek', 'NGT04'),
('0000000300020000', '123', '2016-05-31', 'Burke', 'NGT03'),
('0000000300010000', '123', '2016-05-31', 'Meredith', 'NGT03'),
('0000000200020000', '123', '2016-05-31', 'Derek', 'NGT02'),
('0000000200010000', '123', '2016-05-31', 'Alex', 'NGT02'),
('0000000100020000', '123', '2016-05-31', 'Jack', 'NGT01'),
('0000000100010000', '123', '2016-05-31', 'Billy', 'NGT01'),
('0001000500020000', '123', '2016-05-31', 'Alice', 'GT05'),
('0001000500010000', '123', '2016-05-31', 'John', 'GT05'),
('0001000400020000', '123', '2016-05-31', 'John', 'GT04'),
('0001000400010000', '123', '2016-05-31', 'Alice', 'GT04'),
('0001000300020000', '123', '2016-05-31', 'Joey', 'GT03'),
('0001000200020000', '123', '2016-05-31', 'Rachel', 'GT02'),
('0001000300010000', '123', '2016-05-31', 'Joey', 'GT03'),
('0001000200010000', '123', '2016-05-31', 'Rachel', 'GT02'),
('0001000100010000', '123', '2016-05-31', 'Jerry', 'GT01'),
('0001000100020000', '123', '2016-05-31', 'Jerry', 'GT01');

-- --------------------------------------------------------

--
-- Table structure for table `Reservation`
--

DROP TABLE IF EXISTS `Reservation`;
CREATE TABLE IF NOT EXISTS `Reservation` (
  `ReserveID` int(11) NOT NULL,
  `IsCancelled` tinyint(1) NOT NULL,
  `Username` varchar(50) NOT NULL,
  `CardNum` char(16) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ReserveID`),
  KEY `Username` (`Username`),
  KEY `CardNum` (`CardNum`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Reservation`
--

INSERT INTO `Reservation` (`ReserveID`, `IsCancelled`, `Username`, `CardNum`) VALUES
(1, 1, 'GT01', '0001000100010000'),
(2, 1, 'GT01', '0001000100010000'),
(3, 1, 'GT01', '0001000100020000'),
(4, 1, 'GT01', '0001000100020000'),
(5, 1, 'GT02', '0001000200010000'),
(6, 1, 'GT02', '0001000200010000'),
(7, 1, 'GT02', '0001000200020000'),
(8, 1, 'GT02', '0001000200020000'),
(9, 1, 'GT03', '0001000300010000'),
(10, 1, 'GT03', '0001000300010000'),
(11, 0, 'GT03', '0001000300020000'),
(12, 0, 'GT03', '0001000300020000'),
(13, 0, 'GT04', '0001000400010000'),
(14, 0, 'GT04', '0001000400010000'),
(15, 0, 'GT04', '0001000400020000'),
(16, 0, 'GT04', '0001000400020000'),
(17, 0, 'GT05', '0001000500010000'),
(18, 0, 'GT05', '0001000500010000'),
(19, 0, 'GT05', '0001000500020000'),
(20, 0, 'GT05', '0001000500020000'),
(21, 0, 'NGT01', '0000000100010000'),
(22, 0, 'NGT01', '0000000100010000'),
(23, 0, 'NGT01', '0000000100020000'),
(24, 0, 'NGT01', '0000000100020000'),
(25, 0, 'NGT02', '0000000200010000'),
(26, 0, 'NGT02', '0000000200010000'),
(27, 0, 'NGT02', '0000000200020000'),
(28, 0, 'NGT02', '0000000200020000'),
(29, 0, 'NGT03', '0000000300010000'),
(30, 0, 'NGT03', '0000000300010000'),
(31, 0, 'NGT03', '0000000300020000'),
(32, 0, 'NGT03', '0000000300020000'),
(33, 0, 'NGT04', '0000000400010000'),
(34, 0, 'NGT04', '0000000400010000'),
(35, 0, 'NGT04', '0000000400020000'),
(36, 0, 'NGT04', '0000000400020000'),
(37, 0, 'NGT05', '0000000500010000'),
(38, 0, 'NGT05', '0000000500010000'),
(39, 0, 'NGT05', '0000000500020000'),
(40, 0, 'NGT05', '0000000500020000');

-- --------------------------------------------------------

--
-- Table structure for table `Reserve`
--

DROP TABLE IF EXISTS `Reserve`;
CREATE TABLE IF NOT EXISTS `Reserve` (
  `ReserveID` int(11) NOT NULL,
  `TrainNum` varchar(25) NOT NULL,
  `Class` varchar(10) NOT NULL,
  `DepartureDate` date NOT NULL,
  `PassengerName` varchar(50) NOT NULL,
  `NumOfBaggage` int(11) NOT NULL,
  `DepartFrom` varchar(50) NOT NULL,
  `ArriveAt` varchar(50) NOT NULL,
  `UpdateTimes` int(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ReserveID`,`TrainNum`),
  KEY `TrainNum` (`TrainNum`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Reserve`
--

INSERT INTO `Reserve` (`ReserveID`, `TrainNum`, `Class`, `DepartureDate`, `PassengerName`, `NumOfBaggage`, `DepartFrom`, `ArriveAt`, `UpdateTimes`) VALUES
(23, '777G', '1st Class', '2016-04-01', 'May', 3, 'Stamford', 'Nashville', 0),
(15, '777G', '1st Class', '2016-03-01', 'Adella', 3, 'Stamford', 'Nashville', 0),
(8, '777G', '1st Class', '2016-02-01', 'Amanda', 3, 'Stamford', 'Nashville', 0),
(4, '777G', '1st Class', '2016-01-01', 'Wendy', 3, 'Stamford', 'Nashville', 0),
(38, '666F', '2nd Class', '2016-05-01', 'Kitty', 2, 'New Orleans', 'Boston(BBY)', 0),
(30, '666F', '2nd Class', '2016-04-26', 'Betty', 2, 'New Orleans', 'Boston(BBY)', 0),
(22, '666F', '2nd Class', '2016-04-01', 'Janice', 2, 'New Orleans', 'Boston(BBY)', 0),
(14, '666F', '2nd Class', '2016-03-01', 'Faye', 2, 'New Orleans', 'Boston(BBY)', 0),
(7, '666F', '2nd Class', '2016-02-01', 'Jerry', 2, 'New Orleans', 'Boston(BBY)', 0),
(3, '666F', '2nd Class', '2016-01-01', 'Bush', 2, 'New Orleans', 'Boston(BBY)', 0),
(37, '555E', '1st Class', '2016-05-01', 'Trump', 1, 'Washington DC(Union)', 'Stamford', 0),
(29, '555E', '1st Class', '2016-04-26', 'Megan', 1, 'Washington DC(Union)', 'Stamford', 0),
(21, '555E', '1st Class', '2016-04-01', 'Susan', 1, 'Washington DC(Union)', 'Stamford', 0),
(13, '555E', '1st Class', '2016-03-01', 'James', 1, 'Washington DC(Union)', 'Stamford', 0),
(7, '555E', '1st Class', '2016-02-01', 'Jane', 1, 'Washington DC(Union)', 'Stamford', 0),
(3, '555E', '1st Class', '2016-01-01', 'Edward', 1, 'Washington DC(Union)', 'Stamford', 0),
(36, '444D', '2nd Class', '2016-05-01', 'Brian', 4, 'Miami', 'Atlanta(Windsor)', 0),
(28, '444D', '2nd Class', '2016-04-26', 'Matt', 4, 'Miami', 'Atlanta(Windsor)', 0),
(20, '444D', '2nd Class', '2016-04-01', 'Max', 4, 'Miami', 'Atlanta(Windsor)', 0),
(12, '444D', '2nd Class', '2016-03-01', 'Linda', 4, 'Miami', 'Atlanta(Windsor)', 0),
(6, '444D', '2nd Class', '2016-02-01', 'Briana', 4, 'Miami', 'Atlanta(Windsor)', 0),
(2, '444D', '2nd Class', '2016-01-01', 'Grace', 4, 'Miami', 'Atlanta(Windsor)', 0),
(35, '333C', '1st Class', '2016-05-01', 'Amy', 3, 'Atlanta(Windsor)', 'Boston(BBY)', 0),
(27, '333C', '1st Class', '2016-04-26', 'Nina', 3, 'Atlanta(Windsor)', 'Boston(BBY)', 0),
(19, '333C', '1st Class', '2016-04-01', 'Le', 3, 'Atlanta(Windsor)', 'Boston(BBY)', 0),
(11, '333C', '1st Class', '2016-03-01', 'Yvonne', 3, 'Atlanta(Windsor)', 'Boston(BBY)', 0),
(6, '333C', '1st Class', '2016-02-01', 'Helen', 3, 'Atlanta(Windsor)', 'Boston(BBY)', 0),
(2, '333C', '1st Class', '2016-01-01', 'Lina', 3, 'Atlanta(Windsor)', 'Boston(BBY)', 0),
(34, '222B', '2nd Class', '2016-05-01', 'Austin', 2, 'Washington DC(Union)', 'New London', 0),
(26, '222B', '2nd Class', '2016-04-26', 'Tom', 2, 'Washington DC(Union)', 'New London', 0),
(18, '222B', '2nd Class', '2016-04-01', 'Claire', 2, 'Washington DC(Union)', 'New London', 0),
(10, '222B', '2nd Class', '2016-03-01', 'Billy', 2, 'Washington DC(Union)', 'New London', 0),
(5, '222B', '2nd Class', '2016-02-01', 'Tylar', 2, 'Washington DC(Union)', 'New London', 0),
(1, '222B', '2nd Class', '2016-01-01', 'Emily', 2, 'Washington DC(Union)', 'New London', 0),
(33, '111A', '1st Class', '2016-05-01', 'Alice', 1, 'Boston(BBY)', 'Orlando', 0),
(25, '111A', '1st Class', '2016-04-25', 'John', 1, 'Boston(BBY)', 'Orlando', 0),
(17, '111A', '1st Class', '2016-04-01', 'Willam', 1, 'Boston(BBY)', 'Orlando', 0),
(9, '111A', '1st Class', '2016-03-01', 'Bill', 1, 'Boston(BBY)', 'Orlando', 0),
(5, '111A', '1st Class', '2016-02-01', 'Mary', 1, 'Boston(BBY)', 'Orlando', 0),
(1, '111A', '1st Class', '2016-01-01', 'Steven', 1, 'Boston(BBY)', 'Orlando', 0),
(31, '777G', '1st Class', '2016-04-26', 'Sheng', 3, 'Stamford', 'Nashville', 0),
(39, '777G', '1st Class', '2016-05-01', 'Jiahao', 3, 'Stamford', 'Nashville', 0),
(4, '888H', '2nd Class', '2016-01-01', 'Jinghua', 4, 'New York(Penn)', 'Miami', 0),
(8, '888H', '2nd Class', '2016-02-01', 'Henghao', 4, 'New York(Penn)', 'Miami', 0),
(16, '888H', '2nd Class', '2016-03-01', 'Joey', 4, 'New York(Penn)', 'Miami', 0),
(24, '888H', '2nd Class', '2016-04-01', 'Monica', 4, 'New York(Penn)', 'Miami', 0),
(32, '888H', '2nd Class', '2016-04-26', 'Rachel', 4, 'New York(Penn)', 'Miami', 0),
(40, '888H', '2nd Class', '2016-05-01', 'Ross', 4, 'New York(Penn)', 'Miami', 0),
(52, '666F', '2nd Class', '2016-04-30', 'John Smith', 4, 'Atlanta(Windsor)', 'Boston(BBY)', 4),
(53, '333C', '2nd Class', '2016-05-01', 'WU', 1, 'Atlanta(Windsor)', 'Boston(BBY)', 1),
(54, '666F', '1st Class', '2016-04-27', 'Gundam Exia', 4, 'Atlanta(Windsor)', 'Boston(BBY)', 4),
(54, '333C', '1st Class', '2016-04-27', 'Gundam F91', 4, 'Atlanta(Windsor)', 'Boston(BBY)', 4),
(55, '333C', '1st Class', '2016-04-28', 'Devilman', 4, 'Atlanta(Windsor)', 'Boston(BBY)', 4),
(56, '333C', '1st Class', '2016-04-24', 'Emiya', 4, 'Atlanta(Windsor)', 'Boston(BBY)', 4),
(57, '333C', '2nd Class', '2016-04-25', 'Adele', 4, 'Atlanta(Windsor)', 'New York(Penn)', 4),
(57, '444D', '1st Class', '2016-05-15', 'Prince', 2, 'Miami', 'New Orleans', 2),
(58, '666F', '1st Class', '2016-04-30', 'Ishtar', 4, 'Atlanta(Windsor)', 'Boston(BBY)', 4),
(59, '333C', '1st Class', '2016-04-30', 'Ragnarok', 4, 'Atlanta(Windsor)', 'Boston(BBY)', 0),
(60, '666F', '1st Class', '2016-05-05', 'Emily ', 3, 'Atlanta(Windsor)', 'Washington DC(Union)', 1),
(60, '444D', '1st Class', '2016-05-01', 'Bruce W', 1, 'Miami', 'Orlando', 2),
(61, '888H', '1st Class', '2016-05-06', 'AAA', 0, 'Atlanta(Windsor)', 'Miami', 0),
(62, '666F', '1st Class', '2016-05-03', 'Abel', 3, 'Atlanta(Windsor)', 'Boston(BBY)', 0),
(62, '333C', '2nd Class', '2016-04-25', 'Seth', 4, 'Atlanta(Windsor)', 'Boston(BBY)', 2),
(63, '666F', '1st Class', '2016-04-26', 'Lin', 1, 'Atlanta(Windsor)', 'Boston(BBY)', 0),
(63, '333C', '2nd Class', '2016-05-01', 'Wang', 3, 'Atlanta(Windsor)', 'Nashville', 0),
(64, '333C', '1st Class', '2016-04-26', 'XIAOYU', 2, 'Atlanta(Windsor)', 'Boston(BBY)', 0),
(65, '333C', '1st Class', '2016-05-01', 'Liz', 1, 'Atlanta(Windsor)', 'Boston(BBY)', 1),
(66, '666F', '1st Class', '2016-05-01', 'Wei', 1, 'Atlanta(Windsor)', 'Boston(BBY)', 1);

-- --------------------------------------------------------

--
-- Table structure for table `Review`
--

DROP TABLE IF EXISTS `Review`;
CREATE TABLE IF NOT EXISTS `Review` (
  `ReviewNum` int(11) NOT NULL AUTO_INCREMENT,
  `Comment` text,
  `Rating` varchar(9) NOT NULL,
  `Username` varchar(50) NOT NULL,
  `TrainNum` varchar(50) NOT NULL,
  PRIMARY KEY (`ReviewNum`),
  KEY `Username` (`Username`),
  KEY `TrainNum` (`TrainNum`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=31 ;

--
-- Dumping data for table `Review`
--

INSERT INTO `Review` (`ReviewNum`, `Comment`, `Rating`, `Username`, `TrainNum`) VALUES
(19, 'Bad', 'Bad', 'NGT09', '333C'),
(18, 'Neutral', 'Neutral', 'NGT08', '222B'),
(17, 'Good', 'Good', 'NGT07', '111A'),
(16, 'Very Good', 'Very Good', 'NGT06', '888H'),
(15, 'Very Bad', 'Very Bad', 'NGT05', '777G'),
(14, 'Bad', 'Bad', 'NGT04', '666F'),
(13, 'Neutral', 'Neutral', 'NGT03', '555E'),
(12, 'Good', 'Good', 'NGT02', '444D'),
(11, 'Very Good', 'Very Good', 'NGT01', '333C'),
(10, 'Very Bad', 'Very Bad', 'GT10', '222B'),
(9, 'Bad', 'Bad', 'GT09', '111A'),
(8, 'Neutral', 'Neutral', 'GT08', '888H'),
(7, 'Good', 'Good', 'GT07', '777G'),
(6, 'Very Good', 'Very Good', 'GT06', '666F'),
(5, 'Very Bad', 'Very Bad', 'GT05', '555E'),
(4, 'Bad', 'Bad', 'GT04', '444D'),
(3, 'Neutral', 'Neutral', 'GT03', '333C'),
(2, 'Good', 'Good', 'GT02', '222B'),
(1, 'Very Good', 'Very Good', 'GT01', '111A'),
(20, 'Very Bad', 'Very Bad', 'NGT10', '444D'),
(30, 'awesome', 'Very Good', 'GT01', '111A');

-- --------------------------------------------------------

--
-- Table structure for table `Station`
--

DROP TABLE IF EXISTS `Station`;
CREATE TABLE IF NOT EXISTS `Station` (
  `StationName` varchar(50) NOT NULL,
  `Location` varchar(50) NOT NULL,
  PRIMARY KEY (`StationName`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Station`
--

INSERT INTO `Station` (`StationName`, `Location`) VALUES
('New Orleans', 'New Orleans'),
('Orlando', 'Orlando'),
('Nashville', 'Nashville'),
('Washington DC(Union)', 'Washington DC'),
('New York(Penn)', 'New York'),
('Stamford', 'Stamford'),
('Atlanta(Windsor)', 'Atlanta'),
('New London', 'New London'),
('Boston(BBY)', 'Boston'),
('Miami', 'Miami');

-- --------------------------------------------------------

--
-- Table structure for table `Stop`
--

DROP TABLE IF EXISTS `Stop`;
CREATE TABLE IF NOT EXISTS `Stop` (
  `TrainNum` varchar(25) NOT NULL,
  `StationName` varchar(50) NOT NULL,
  `ArrivalTime` time DEFAULT NULL,
  `DepartureTime` time DEFAULT NULL,
  PRIMARY KEY (`TrainNum`,`StationName`),
  KEY `StationName` (`StationName`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Stop`
--

INSERT INTO `Stop` (`TrainNum`, `StationName`, `ArrivalTime`, `DepartureTime`) VALUES
('888H', 'Miami', '22:00:00', NULL),
('888H', 'Orlando', '18:00:00', '18:30:00'),
('888H', 'Atlanta(Windsor)', '13:00:00', '13:15:00'),
('888H', 'New York(Penn)', NULL, '08:00:00'),
('777G', 'Nashville', '19:00:00', NULL),
('777G', 'Washington DC(Union)', '16:00:00', '16:30:00'),
('777G', 'New York(Penn)', '13:00:00', '13:30:00'),
('777G', 'Stamford', NULL, '11:00:00'),
('666F', 'Boston(BBY)', '19:30:00', NULL),
('666F', 'Washington DC(Union)', '15:00:00', '15:30:00'),
('666F', 'Atlanta(Windsor)', '12:00:00', '12:30:00'),
('666F', 'New Orleans', NULL, '09:30:00'),
('555E', 'Stamford', '18:00:00', NULL),
('555E', 'New London', '14:00:00', '14:30:00'),
('555E', 'New York(Penn)', '12:00:00', '12:30:00'),
('555E', 'Washington DC(Union)', NULL, '10:00:00'),
('444D', 'Atlanta(Windsor)', '16:30:00', NULL),
('444D', 'New Orleans', '13:00:00', '13:30:00'),
('444D', 'Orlando', '10:30:00', '11:00:00'),
('444D', 'Miami', NULL, '09:00:00'),
('333C', 'Boston(BBY)', '17:00:00', NULL),
('333C', 'New York(Penn)', '14:00:00', '14:30:00'),
('333C', 'Nashville', '10:30:00', '11:00:00'),
('333C', 'Atlanta(Windsor)', NULL, '09:00:00'),
('222B', 'New London', '14:15:00', NULL),
('222B', 'Stamford', '13:00:00', '13:30:00'),
('222B', 'New York(Penn)', '11:00:00', '11:30:00'),
('222B', 'Washington DC(Union)', NULL, '08:00:00'),
('111A', 'Orlando', '16:00:00', NULL),
('111A', 'Atlanta(Windsor)', '14:00:00', '14:30:00'),
('111A', 'New London', '11:00:00', '12:30:00'),
('111A', 'Boston(BBY)', NULL, '10:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `SystemInfo`
--

DROP TABLE IF EXISTS `SystemInfo`;
CREATE TABLE IF NOT EXISTS `SystemInfo` (
  `MaxNumOfBaggage` int(11) NOT NULL,
  `NumOfFreeBaggage` int(11) NOT NULL,
  `StudentDiscount` decimal(3,2) NOT NULL,
  `ChangeFee` int(11) NOT NULL,
  PRIMARY KEY (`MaxNumOfBaggage`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `SystemInfo`
--

INSERT INTO `SystemInfo` (`MaxNumOfBaggage`, `NumOfFreeBaggage`, `StudentDiscount`, `ChangeFee`) VALUES
(4, 2, 0.20, 50);

-- --------------------------------------------------------

--
-- Stand-in structure for view `Tickets`
--
DROP VIEW IF EXISTS `Tickets`;
CREATE TABLE IF NOT EXISTS `Tickets` (
`ReserveID` int(11)
,`TrainNum` varchar(25)
,`Class` varchar(10)
,`DepartureDate` date
,`PassengerName` varchar(50)
,`NumOfBaggage` int(11)
,`DepartFrom` varchar(50)
,`ArriveAt` varchar(50)
,`UpdateTimes` int(1)
);
-- --------------------------------------------------------

--
-- Table structure for table `TrainRoute`
--

DROP TABLE IF EXISTS `TrainRoute`;
CREATE TABLE IF NOT EXISTS `TrainRoute` (
  `TrainNum` varchar(25) NOT NULL,
  `FstClassPrice` decimal(6,2) NOT NULL,
  `SndClassPrice` decimal(6,2) NOT NULL,
  PRIMARY KEY (`TrainNum`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `TrainRoute`
--

INSERT INTO `TrainRoute` (`TrainNum`, `FstClassPrice`, `SndClassPrice`) VALUES
('888H', 208.00, 108.00),
('777G', 207.00, 107.00),
('666F', 206.00, 106.00),
('555E', 205.00, 105.00),
('444D', 204.00, 104.00),
('333C', 203.00, 103.00),
('222B', 202.00, 102.00),
('111A', 201.00, 101.00);

-- --------------------------------------------------------

--
-- Table structure for table `User`
--

DROP TABLE IF EXISTS `User`;
CREATE TABLE IF NOT EXISTS `User` (
  `Username` varchar(50) NOT NULL,
  `Password` varchar(50) NOT NULL,
  PRIMARY KEY (`Username`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `User`
--

INSERT INTO `User` (`Username`, `Password`) VALUES
('M05', 'M05'),
('M04', 'M04'),
('M03', 'M03'),
('M02', 'M02'),
('M01', 'M01'),
('NGT10', 'NGT10'),
('NGT09', 'NGT09'),
('NGT08', 'NGT08'),
('NGT07', 'NGT07'),
('NGT06', 'NGT06'),
('NGT05', 'NGT05'),
('NGT04', 'NGT04'),
('NGT03', 'NGT03'),
('NGT02', 'NGT02'),
('NGT01', 'NGT01'),
('GT10', 'GT10'),
('GT09', 'GT09'),
('GT08', 'GT08'),
('GT07', 'GT07'),
('GT06', 'GT06'),
('GT05', 'GT05'),
('GT04', 'GT04'),
('GT03', 'GT03'),
('GT02', 'GT02'),
('GT01', 'GT01');

-- --------------------------------------------------------

--
-- Structure for view `Tickets`
--
DROP TABLE IF EXISTS `Tickets`;
-- in use(#1142 - SHOW VIEW command denied to user 'cs4400_Team_20'@'localhost' for table 'Tickets')
--
-- Database: `information_schema`
--
CREATE DATABASE `information_schema` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `information_schema`;

-- --------------------------------------------------------

--
-- Table structure for table `CHARACTER_SETS`
--

DROP TABLE IF EXISTS `CHARACTER_SETS`;
CREATE TEMPORARY TABLE `CHARACTER_SETS` (
  `CHARACTER_SET_NAME` varchar(32) NOT NULL DEFAULT '',
  `DEFAULT_COLLATE_NAME` varchar(32) NOT NULL DEFAULT '',
  `DESCRIPTION` varchar(60) NOT NULL DEFAULT '',
  `MAXLEN` bigint(3) NOT NULL DEFAULT '0'
) ENGINE=MEMORY DEFAULT CHARSET=utf8;

--
-- Dumping data for table `CHARACTER_SETS`
--

INSERT INTO `CHARACTER_SETS` (`CHARACTER_SET_NAME`, `DEFAULT_COLLATE_NAME`, `DESCRIPTION`, `MAXLEN`) VALUES
('big5', 'big5_chinese_ci', 'Big5 Traditional Chinese', 2),
('dec8', 'dec8_swedish_ci', 'DEC West European', 1),
('cp850', 'cp850_general_ci', 'DOS West European', 1),
('hp8', 'hp8_english_ci', 'HP West European', 1),
('koi8r', 'koi8r_general_ci', 'KOI8-R Relcom Russian', 1),
('latin1', 'latin1_swedish_ci', 'cp1252 West European', 1),
('latin2', 'latin2_general_ci', 'ISO 8859-2 Central European', 1),
('swe7', 'swe7_swedish_ci', '7bit Swedish', 1),
('ascii', 'ascii_general_ci', 'US ASCII', 1),
('ujis', 'ujis_japanese_ci', 'EUC-JP Japanese', 3),
('sjis', 'sjis_japanese_ci', 'Shift-JIS Japanese', 2),
('hebrew', 'hebrew_general_ci', 'ISO 8859-8 Hebrew', 1),
('tis620', 'tis620_thai_ci', 'TIS620 Thai', 1),
('euckr', 'euckr_korean_ci', 'EUC-KR Korean', 2),
('koi8u', 'koi8u_general_ci', 'KOI8-U Ukrainian', 1),
('gb2312', 'gb2312_chinese_ci', 'GB2312 Simplified Chinese', 2),
('greek', 'greek_general_ci', 'ISO 8859-7 Greek', 1),
('cp1250', 'cp1250_general_ci', 'Windows Central European', 1),
('gbk', 'gbk_chinese_ci', 'GBK Simplified Chinese', 2),
('latin5', 'latin5_turkish_ci', 'ISO 8859-9 Turkish', 1),
('armscii8', 'armscii8_general_ci', 'ARMSCII-8 Armenian', 1),
('utf8', 'utf8_general_ci', 'UTF-8 Unicode', 3),
('ucs2', 'ucs2_general_ci', 'UCS-2 Unicode', 2),
('cp866', 'cp866_general_ci', 'DOS Russian', 1),
('keybcs2', 'keybcs2_general_ci', 'DOS Kamenicky Czech-Slovak', 1),
('macce', 'macce_general_ci', 'Mac Central European', 1),
('macroman', 'macroman_general_ci', 'Mac West European', 1),
('cp852', 'cp852_general_ci', 'DOS Central European', 1),
('latin7', 'latin7_general_ci', 'ISO 8859-13 Baltic', 1),
('cp1251', 'cp1251_general_ci', 'Windows Cyrillic', 1),
('cp1256', 'cp1256_general_ci', 'Windows Arabic', 1),
('cp1257', 'cp1257_general_ci', 'Windows Baltic', 1),
('binary', 'binary', 'Binary pseudo charset', 1),
('geostd8', 'geostd8_general_ci', 'GEOSTD8 Georgian', 1),
('cp932', 'cp932_japanese_ci', 'SJIS for Windows Japanese', 2),
('eucjpms', 'eucjpms_japanese_ci', 'UJIS for Windows Japanese', 3);

-- --------------------------------------------------------

--
-- Table structure for table `COLLATIONS`
--

DROP TABLE IF EXISTS `COLLATIONS`;
CREATE TEMPORARY TABLE `COLLATIONS` (
  `COLLATION_NAME` varchar(32) NOT NULL DEFAULT '',
  `CHARACTER_SET_NAME` varchar(32) NOT NULL DEFAULT '',
  `ID` bigint(11) NOT NULL DEFAULT '0',
  `IS_DEFAULT` varchar(3) NOT NULL DEFAULT '',
  `IS_COMPILED` varchar(3) NOT NULL DEFAULT '',
  `SORTLEN` bigint(3) NOT NULL DEFAULT '0'
) ENGINE=MEMORY DEFAULT CHARSET=utf8;

--
-- Dumping data for table `COLLATIONS`
--

INSERT INTO `COLLATIONS` (`COLLATION_NAME`, `CHARACTER_SET_NAME`, `ID`, `IS_DEFAULT`, `IS_COMPILED`, `SORTLEN`) VALUES
('big5_chinese_ci', 'big5', 1, 'Yes', 'Yes', 1),
('big5_bin', 'big5', 84, '', 'Yes', 1),
('dec8_swedish_ci', 'dec8', 3, 'Yes', 'Yes', 1),
('dec8_bin', 'dec8', 69, '', 'Yes', 1),
('cp850_general_ci', 'cp850', 4, 'Yes', 'Yes', 1),
('cp850_bin', 'cp850', 80, '', 'Yes', 1),
('hp8_english_ci', 'hp8', 6, 'Yes', 'Yes', 1),
('hp8_bin', 'hp8', 72, '', 'Yes', 1),
('koi8r_general_ci', 'koi8r', 7, 'Yes', 'Yes', 1),
('koi8r_bin', 'koi8r', 74, '', 'Yes', 1),
('latin1_german1_ci', 'latin1', 5, '', 'Yes', 1),
('latin1_swedish_ci', 'latin1', 8, 'Yes', 'Yes', 1),
('latin1_danish_ci', 'latin1', 15, '', 'Yes', 1),
('latin1_german2_ci', 'latin1', 31, '', 'Yes', 2),
('latin1_bin', 'latin1', 47, '', 'Yes', 1),
('latin1_general_ci', 'latin1', 48, '', 'Yes', 1),
('latin1_general_cs', 'latin1', 49, '', 'Yes', 1),
('latin1_spanish_ci', 'latin1', 94, '', 'Yes', 1),
('latin2_czech_cs', 'latin2', 2, '', 'Yes', 4),
('latin2_general_ci', 'latin2', 9, 'Yes', 'Yes', 1),
('latin2_hungarian_ci', 'latin2', 21, '', 'Yes', 1),
('latin2_croatian_ci', 'latin2', 27, '', 'Yes', 1),
('latin2_bin', 'latin2', 77, '', 'Yes', 1),
('swe7_swedish_ci', 'swe7', 10, 'Yes', 'Yes', 1),
('swe7_bin', 'swe7', 82, '', 'Yes', 1),
('ascii_general_ci', 'ascii', 11, 'Yes', 'Yes', 1),
('ascii_bin', 'ascii', 65, '', 'Yes', 1),
('ujis_japanese_ci', 'ujis', 12, 'Yes', 'Yes', 1),
('ujis_bin', 'ujis', 91, '', 'Yes', 1),
('sjis_japanese_ci', 'sjis', 13, 'Yes', 'Yes', 1),
('sjis_bin', 'sjis', 88, '', 'Yes', 1),
('hebrew_general_ci', 'hebrew', 16, 'Yes', 'Yes', 1),
('hebrew_bin', 'hebrew', 71, '', 'Yes', 1),
('tis620_thai_ci', 'tis620', 18, 'Yes', 'Yes', 4),
('tis620_bin', 'tis620', 89, '', 'Yes', 1),
('euckr_korean_ci', 'euckr', 19, 'Yes', 'Yes', 1),
('euckr_bin', 'euckr', 85, '', 'Yes', 1),
('koi8u_general_ci', 'koi8u', 22, 'Yes', 'Yes', 1),
('koi8u_bin', 'koi8u', 75, '', 'Yes', 1),
('gb2312_chinese_ci', 'gb2312', 24, 'Yes', 'Yes', 1),
('gb2312_bin', 'gb2312', 86, '', 'Yes', 1),
('greek_general_ci', 'greek', 25, 'Yes', 'Yes', 1),
('greek_bin', 'greek', 70, '', 'Yes', 1),
('cp1250_general_ci', 'cp1250', 26, 'Yes', 'Yes', 1),
('cp1250_czech_cs', 'cp1250', 34, '', 'Yes', 2),
('cp1250_croatian_ci', 'cp1250', 44, '', 'Yes', 1),
('cp1250_bin', 'cp1250', 66, '', 'Yes', 1),
('cp1250_polish_ci', 'cp1250', 99, '', 'Yes', 1),
('gbk_chinese_ci', 'gbk', 28, 'Yes', 'Yes', 1),
('gbk_bin', 'gbk', 87, '', 'Yes', 1),
('latin5_turkish_ci', 'latin5', 30, 'Yes', 'Yes', 1),
('latin5_bin', 'latin5', 78, '', 'Yes', 1),
('armscii8_general_ci', 'armscii8', 32, 'Yes', 'Yes', 1),
('armscii8_bin', 'armscii8', 64, '', 'Yes', 1),
('utf8_general_ci', 'utf8', 33, 'Yes', 'Yes', 1),
('utf8_bin', 'utf8', 83, '', 'Yes', 1),
('utf8_unicode_ci', 'utf8', 192, '', 'Yes', 8),
('utf8_icelandic_ci', 'utf8', 193, '', 'Yes', 8),
('utf8_latvian_ci', 'utf8', 194, '', 'Yes', 8),
('utf8_romanian_ci', 'utf8', 195, '', 'Yes', 8),
('utf8_slovenian_ci', 'utf8', 196, '', 'Yes', 8),
('utf8_polish_ci', 'utf8', 197, '', 'Yes', 8),
('utf8_estonian_ci', 'utf8', 198, '', 'Yes', 8),
('utf8_spanish_ci', 'utf8', 199, '', 'Yes', 8),
('utf8_swedish_ci', 'utf8', 200, '', 'Yes', 8),
('utf8_turkish_ci', 'utf8', 201, '', 'Yes', 8),
('utf8_czech_ci', 'utf8', 202, '', 'Yes', 8),
('utf8_danish_ci', 'utf8', 203, '', 'Yes', 8),
('utf8_lithuanian_ci', 'utf8', 204, '', 'Yes', 8),
('utf8_slovak_ci', 'utf8', 205, '', 'Yes', 8),
('utf8_spanish2_ci', 'utf8', 206, '', 'Yes', 8),
('utf8_roman_ci', 'utf8', 207, '', 'Yes', 8),
('utf8_persian_ci', 'utf8', 208, '', 'Yes', 8),
('utf8_esperanto_ci', 'utf8', 209, '', 'Yes', 8),
('utf8_hungarian_ci', 'utf8', 210, '', 'Yes', 8),
('utf8_general_mysql500_ci', 'utf8', 223, '', 'Yes', 1),
('ucs2_general_ci', 'ucs2', 35, 'Yes', 'Yes', 1),
('ucs2_bin', 'ucs2', 90, '', 'Yes', 1),
('ucs2_unicode_ci', 'ucs2', 128, '', 'Yes', 8),
('ucs2_icelandic_ci', 'ucs2', 129, '', 'Yes', 8),
('ucs2_latvian_ci', 'ucs2', 130, '', 'Yes', 8),
('ucs2_romanian_ci', 'ucs2', 131, '', 'Yes', 8),
('ucs2_slovenian_ci', 'ucs2', 132, '', 'Yes', 8),
('ucs2_polish_ci', 'ucs2', 133, '', 'Yes', 8),
('ucs2_estonian_ci', 'ucs2', 134, '', 'Yes', 8),
('ucs2_spanish_ci', 'ucs2', 135, '', 'Yes', 8),
('ucs2_swedish_ci', 'ucs2', 136, '', 'Yes', 8),
('ucs2_turkish_ci', 'ucs2', 137, '', 'Yes', 8),
('ucs2_czech_ci', 'ucs2', 138, '', 'Yes', 8),
('ucs2_danish_ci', 'ucs2', 139, '', 'Yes', 8),
('ucs2_lithuanian_ci', 'ucs2', 140, '', 'Yes', 8),
('ucs2_slovak_ci', 'ucs2', 141, '', 'Yes', 8),
('ucs2_spanish2_ci', 'ucs2', 142, '', 'Yes', 8),
('ucs2_roman_ci', 'ucs2', 143, '', 'Yes', 8),
('ucs2_persian_ci', 'ucs2', 144, '', 'Yes', 8),
('ucs2_esperanto_ci', 'ucs2', 145, '', 'Yes', 8),
('ucs2_hungarian_ci', 'ucs2', 146, '', 'Yes', 8),
('ucs2_general_mysql500_ci', 'ucs2', 159, '', 'Yes', 1),
('cp866_general_ci', 'cp866', 36, 'Yes', 'Yes', 1),
('cp866_bin', 'cp866', 68, '', 'Yes', 1),
('keybcs2_general_ci', 'keybcs2', 37, 'Yes', 'Yes', 1),
('keybcs2_bin', 'keybcs2', 73, '', 'Yes', 1),
('macce_general_ci', 'macce', 38, 'Yes', 'Yes', 1),
('macce_bin', 'macce', 43, '', 'Yes', 1),
('macroman_general_ci', 'macroman', 39, 'Yes', 'Yes', 1),
('macroman_bin', 'macroman', 53, '', 'Yes', 1),
('cp852_general_ci', 'cp852', 40, 'Yes', 'Yes', 1),
('cp852_bin', 'cp852', 81, '', 'Yes', 1),
('latin7_estonian_cs', 'latin7', 20, '', 'Yes', 1),
('latin7_general_ci', 'latin7', 41, 'Yes', 'Yes', 1),
('latin7_general_cs', 'latin7', 42, '', 'Yes', 1),
('latin7_bin', 'latin7', 79, '', 'Yes', 1),
('cp1251_bulgarian_ci', 'cp1251', 14, '', 'Yes', 1),
('cp1251_ukrainian_ci', 'cp1251', 23, '', 'Yes', 1),
('cp1251_bin', 'cp1251', 50, '', 'Yes', 1),
('cp1251_general_ci', 'cp1251', 51, 'Yes', 'Yes', 1),
('cp1251_general_cs', 'cp1251', 52, '', 'Yes', 1),
('cp1256_general_ci', 'cp1256', 57, 'Yes', 'Yes', 1),
('cp1256_bin', 'cp1256', 67, '', 'Yes', 1),
('cp1257_lithuanian_ci', 'cp1257', 29, '', 'Yes', 1),
('cp1257_bin', 'cp1257', 58, '', 'Yes', 1),
('cp1257_general_ci', 'cp1257', 59, 'Yes', 'Yes', 1),
('binary', 'binary', 63, 'Yes', 'Yes', 1),
('geostd8_general_ci', 'geostd8', 92, 'Yes', 'Yes', 1),
('geostd8_bin', 'geostd8', 93, '', 'Yes', 1),
('cp932_japanese_ci', 'cp932', 95, 'Yes', 'Yes', 1),
('cp932_bin', 'cp932', 96, '', 'Yes', 1),
('eucjpms_japanese_ci', 'eucjpms', 97, 'Yes', 'Yes', 1),
('eucjpms_bin', 'eucjpms', 98, '', 'Yes', 1);

-- --------------------------------------------------------

--
-- Table structure for table `COLLATION_CHARACTER_SET_APPLICABILITY`
--

DROP TABLE IF EXISTS `COLLATION_CHARACTER_SET_APPLICABILITY`;
CREATE TEMPORARY TABLE `COLLATION_CHARACTER_SET_APPLICABILITY` (
  `COLLATION_NAME` varchar(32) NOT NULL DEFAULT '',
  `CHARACTER_SET_NAME` varchar(32) NOT NULL DEFAULT ''
) ENGINE=MEMORY DEFAULT CHARSET=utf8;

--
-- Dumping data for table `COLLATION_CHARACTER_SET_APPLICABILITY`
--

INSERT INTO `COLLATION_CHARACTER_SET_APPLICABILITY` (`COLLATION_NAME`, `CHARACTER_SET_NAME`) VALUES
('big5_chinese_ci', 'big5'),
('big5_bin', 'big5'),
('dec8_swedish_ci', 'dec8'),
('dec8_bin', 'dec8'),
('cp850_general_ci', 'cp850'),
('cp850_bin', 'cp850'),
('hp8_english_ci', 'hp8'),
('hp8_bin', 'hp8'),
('koi8r_general_ci', 'koi8r'),
('koi8r_bin', 'koi8r'),
('latin1_german1_ci', 'latin1'),
('latin1_swedish_ci', 'latin1'),
('latin1_danish_ci', 'latin1'),
('latin1_german2_ci', 'latin1'),
('latin1_bin', 'latin1'),
('latin1_general_ci', 'latin1'),
('latin1_general_cs', 'latin1'),
('latin1_spanish_ci', 'latin1'),
('latin2_czech_cs', 'latin2'),
('latin2_general_ci', 'latin2'),
('latin2_hungarian_ci', 'latin2'),
('latin2_croatian_ci', 'latin2'),
('latin2_bin', 'latin2'),
('swe7_swedish_ci', 'swe7'),
('swe7_bin', 'swe7'),
('ascii_general_ci', 'ascii'),
('ascii_bin', 'ascii'),
('ujis_japanese_ci', 'ujis'),
('ujis_bin', 'ujis'),
('sjis_japanese_ci', 'sjis'),
('sjis_bin', 'sjis'),
('hebrew_general_ci', 'hebrew'),
('hebrew_bin', 'hebrew'),
('filename', 'filename'),
('tis620_thai_ci', 'tis620'),
('tis620_bin', 'tis620'),
('euckr_korean_ci', 'euckr'),
('euckr_bin', 'euckr'),
('koi8u_general_ci', 'koi8u'),
('koi8u_bin', 'koi8u'),
('gb2312_chinese_ci', 'gb2312'),
('gb2312_bin', 'gb2312'),
('greek_general_ci', 'greek'),
('greek_bin', 'greek'),
('cp1250_general_ci', 'cp1250'),
('cp1250_czech_cs', 'cp1250'),
('cp1250_croatian_ci', 'cp1250'),
('cp1250_bin', 'cp1250'),
('cp1250_polish_ci', 'cp1250'),
('gbk_chinese_ci', 'gbk'),
('gbk_bin', 'gbk'),
('latin5_turkish_ci', 'latin5'),
('latin5_bin', 'latin5'),
('armscii8_general_ci', 'armscii8'),
('armscii8_bin', 'armscii8'),
('utf8_general_ci', 'utf8'),
('utf8_bin', 'utf8'),
('utf8_unicode_ci', 'utf8'),
('utf8_icelandic_ci', 'utf8'),
('utf8_latvian_ci', 'utf8'),
('utf8_romanian_ci', 'utf8'),
('utf8_slovenian_ci', 'utf8'),
('utf8_polish_ci', 'utf8'),
('utf8_estonian_ci', 'utf8'),
('utf8_spanish_ci', 'utf8'),
('utf8_swedish_ci', 'utf8'),
('utf8_turkish_ci', 'utf8'),
('utf8_czech_ci', 'utf8'),
('utf8_danish_ci', 'utf8'),
('utf8_lithuanian_ci', 'utf8'),
('utf8_slovak_ci', 'utf8'),
('utf8_spanish2_ci', 'utf8'),
('utf8_roman_ci', 'utf8'),
('utf8_persian_ci', 'utf8'),
('utf8_esperanto_ci', 'utf8'),
('utf8_hungarian_ci', 'utf8'),
('utf8_general_mysql500_ci', 'utf8'),
('ucs2_general_ci', 'ucs2'),
('ucs2_bin', 'ucs2'),
('ucs2_unicode_ci', 'ucs2'),
('ucs2_icelandic_ci', 'ucs2'),
('ucs2_latvian_ci', 'ucs2'),
('ucs2_romanian_ci', 'ucs2'),
('ucs2_slovenian_ci', 'ucs2'),
('ucs2_polish_ci', 'ucs2'),
('ucs2_estonian_ci', 'ucs2'),
('ucs2_spanish_ci', 'ucs2'),
('ucs2_swedish_ci', 'ucs2'),
('ucs2_turkish_ci', 'ucs2'),
('ucs2_czech_ci', 'ucs2'),
('ucs2_danish_ci', 'ucs2'),
('ucs2_lithuanian_ci', 'ucs2'),
('ucs2_slovak_ci', 'ucs2'),
('ucs2_spanish2_ci', 'ucs2'),
('ucs2_roman_ci', 'ucs2'),
('ucs2_persian_ci', 'ucs2'),
('ucs2_esperanto_ci', 'ucs2'),
('ucs2_hungarian_ci', 'ucs2'),
('ucs2_general_mysql500_ci', 'ucs2'),
('cp866_general_ci', 'cp866'),
('cp866_bin', 'cp866'),
('keybcs2_general_ci', 'keybcs2'),
('keybcs2_bin', 'keybcs2'),
('macce_general_ci', 'macce'),
('macce_bin', 'macce'),
('macroman_general_ci', 'macroman'),
('macroman_bin', 'macroman'),
('cp852_general_ci', 'cp852'),
('cp852_bin', 'cp852'),
('latin7_estonian_cs', 'latin7'),
('latin7_general_ci', 'latin7'),
('latin7_general_cs', 'latin7'),
('latin7_bin', 'latin7'),
('cp1251_bulgarian_ci', 'cp1251'),
('cp1251_ukrainian_ci', 'cp1251'),
('cp1251_bin', 'cp1251'),
('cp1251_general_ci', 'cp1251'),
('cp1251_general_cs', 'cp1251'),
('cp1256_general_ci', 'cp1256'),
('cp1256_bin', 'cp1256'),
('cp1257_lithuanian_ci', 'cp1257'),
('cp1257_bin', 'cp1257'),
('cp1257_general_ci', 'cp1257'),
('binary', 'binary'),
('geostd8_general_ci', 'geostd8'),
('geostd8_bin', 'geostd8'),
('cp932_japanese_ci', 'cp932'),
('cp932_bin', 'cp932'),
('eucjpms_japanese_ci', 'eucjpms'),
('eucjpms_bin', 'eucjpms');

-- --------------------------------------------------------

--
-- Table structure for table `COLUMNS`
--

DROP TABLE IF EXISTS `COLUMNS`;
CREATE TEMPORARY TABLE `COLUMNS` (
  `TABLE_CATALOG` varchar(512) DEFAULT NULL,
  `TABLE_SCHEMA` varchar(64) NOT NULL DEFAULT '',
  `TABLE_NAME` varchar(64) NOT NULL DEFAULT '',
  `COLUMN_NAME` varchar(64) NOT NULL DEFAULT '',
  `ORDINAL_POSITION` bigint(21) unsigned NOT NULL DEFAULT '0',
  `COLUMN_DEFAULT` longtext,
  `IS_NULLABLE` varchar(3) NOT NULL DEFAULT '',
  `DATA_TYPE` varchar(64) NOT NULL DEFAULT '',
  `CHARACTER_MAXIMUM_LENGTH` bigint(21) unsigned DEFAULT NULL,
  `CHARACTER_OCTET_LENGTH` bigint(21) unsigned DEFAULT NULL,
  `NUMERIC_PRECISION` bigint(21) unsigned DEFAULT NULL,
  `NUMERIC_SCALE` bigint(21) unsigned DEFAULT NULL,
  `CHARACTER_SET_NAME` varchar(32) DEFAULT NULL,
  `COLLATION_NAME` varchar(32) DEFAULT NULL,
  `COLUMN_TYPE` longtext NOT NULL,
  `COLUMN_KEY` varchar(3) NOT NULL DEFAULT '',
  `EXTRA` varchar(27) NOT NULL DEFAULT '',
  `PRIVILEGES` varchar(80) NOT NULL DEFAULT '',
  `COLUMN_COMMENT` varchar(255) NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `COLUMNS`
--

INSERT INTO `COLUMNS` (`TABLE_CATALOG`, `TABLE_SCHEMA`, `TABLE_NAME`, `COLUMN_NAME`, `ORDINAL_POSITION`, `COLUMN_DEFAULT`, `IS_NULLABLE`, `DATA_TYPE`, `CHARACTER_MAXIMUM_LENGTH`, `CHARACTER_OCTET_LENGTH`, `NUMERIC_PRECISION`, `NUMERIC_SCALE`, `CHARACTER_SET_NAME`, `COLLATION_NAME`, `COLUMN_TYPE`, `COLUMN_KEY`, `EXTRA`, `PRIVILEGES`, `COLUMN_COMMENT`) VALUES
(NULL, 'information_schema', 'CHARACTER_SETS', 'CHARACTER_SET_NAME', 1, '', 'NO', 'varchar', 32, 96, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(32)', '', '', 'select', ''),
(NULL, 'information_schema', 'CHARACTER_SETS', 'DEFAULT_COLLATE_NAME', 2, '', 'NO', 'varchar', 32, 96, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(32)', '', '', 'select', ''),
(NULL, 'information_schema', 'CHARACTER_SETS', 'DESCRIPTION', 3, '', 'NO', 'varchar', 60, 180, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(60)', '', '', 'select', ''),
(NULL, 'information_schema', 'CHARACTER_SETS', 'MAXLEN', 4, '0', 'NO', 'bigint', NULL, NULL, 19, 0, NULL, NULL, 'bigint(3)', '', '', 'select', ''),
(NULL, 'information_schema', 'COLLATIONS', 'COLLATION_NAME', 1, '', 'NO', 'varchar', 32, 96, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(32)', '', '', 'select', ''),
(NULL, 'information_schema', 'COLLATIONS', 'CHARACTER_SET_NAME', 2, '', 'NO', 'varchar', 32, 96, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(32)', '', '', 'select', ''),
(NULL, 'information_schema', 'COLLATIONS', 'ID', 3, '0', 'NO', 'bigint', NULL, NULL, 19, 0, NULL, NULL, 'bigint(11)', '', '', 'select', ''),
(NULL, 'information_schema', 'COLLATIONS', 'IS_DEFAULT', 4, '', 'NO', 'varchar', 3, 9, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(3)', '', '', 'select', ''),
(NULL, 'information_schema', 'COLLATIONS', 'IS_COMPILED', 5, '', 'NO', 'varchar', 3, 9, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(3)', '', '', 'select', ''),
(NULL, 'information_schema', 'COLLATIONS', 'SORTLEN', 6, '0', 'NO', 'bigint', NULL, NULL, 19, 0, NULL, NULL, 'bigint(3)', '', '', 'select', ''),
(NULL, 'information_schema', 'COLLATION_CHARACTER_SET_APPLICABILITY', 'COLLATION_NAME', 1, '', 'NO', 'varchar', 32, 96, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(32)', '', '', 'select', ''),
(NULL, 'information_schema', 'COLLATION_CHARACTER_SET_APPLICABILITY', 'CHARACTER_SET_NAME', 2, '', 'NO', 'varchar', 32, 96, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(32)', '', '', 'select', ''),
(NULL, 'information_schema', 'COLUMNS', 'TABLE_CATALOG', 1, NULL, 'YES', 'varchar', 512, 1536, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(512)', '', '', 'select', ''),
(NULL, 'information_schema', 'COLUMNS', 'TABLE_SCHEMA', 2, '', 'NO', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', ''),
(NULL, 'information_schema', 'COLUMNS', 'TABLE_NAME', 3, '', 'NO', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', ''),
(NULL, 'information_schema', 'COLUMNS', 'COLUMN_NAME', 4, '', 'NO', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', ''),
(NULL, 'information_schema', 'COLUMNS', 'ORDINAL_POSITION', 5, '0', 'NO', 'bigint', NULL, NULL, 20, 0, NULL, NULL, 'bigint(21) unsigned', '', '', 'select', ''),
(NULL, 'information_schema', 'COLUMNS', 'COLUMN_DEFAULT', 6, NULL, 'YES', 'longtext', 4294967295, 4294967295, NULL, NULL, 'utf8', 'utf8_general_ci', 'longtext', '', '', 'select', ''),
(NULL, 'information_schema', 'COLUMNS', 'IS_NULLABLE', 7, '', 'NO', 'varchar', 3, 9, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(3)', '', '', 'select', ''),
(NULL, 'information_schema', 'COLUMNS', 'DATA_TYPE', 8, '', 'NO', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', ''),
(NULL, 'information_schema', 'COLUMNS', 'CHARACTER_MAXIMUM_LENGTH', 9, NULL, 'YES', 'bigint', NULL, NULL, 20, 0, NULL, NULL, 'bigint(21) unsigned', '', '', 'select', ''),
(NULL, 'information_schema', 'COLUMNS', 'CHARACTER_OCTET_LENGTH', 10, NULL, 'YES', 'bigint', NULL, NULL, 20, 0, NULL, NULL, 'bigint(21) unsigned', '', '', 'select', ''),
(NULL, 'information_schema', 'COLUMNS', 'NUMERIC_PRECISION', 11, NULL, 'YES', 'bigint', NULL, NULL, 20, 0, NULL, NULL, 'bigint(21) unsigned', '', '', 'select', ''),
(NULL, 'information_schema', 'COLUMNS', 'NUMERIC_SCALE', 12, NULL, 'YES', 'bigint', NULL, NULL, 20, 0, NULL, NULL, 'bigint(21) unsigned', '', '', 'select', ''),
(NULL, 'information_schema', 'COLUMNS', 'CHARACTER_SET_NAME', 13, NULL, 'YES', 'varchar', 32, 96, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(32)', '', '', 'select', ''),
(NULL, 'information_schema', 'COLUMNS', 'COLLATION_NAME', 14, NULL, 'YES', 'varchar', 32, 96, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(32)', '', '', 'select', ''),
(NULL, 'information_schema', 'COLUMNS', 'COLUMN_TYPE', 15, NULL, 'NO', 'longtext', 4294967295, 4294967295, NULL, NULL, 'utf8', 'utf8_general_ci', 'longtext', '', '', 'select', ''),
(NULL, 'information_schema', 'COLUMNS', 'COLUMN_KEY', 16, '', 'NO', 'varchar', 3, 9, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(3)', '', '', 'select', ''),
(NULL, 'information_schema', 'COLUMNS', 'EXTRA', 17, '', 'NO', 'varchar', 27, 81, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(27)', '', '', 'select', ''),
(NULL, 'information_schema', 'COLUMNS', 'PRIVILEGES', 18, '', 'NO', 'varchar', 80, 240, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(80)', '', '', 'select', ''),
(NULL, 'information_schema', 'COLUMNS', 'COLUMN_COMMENT', 19, '', 'NO', 'varchar', 255, 765, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(255)', '', '', 'select', ''),
(NULL, 'information_schema', 'COLUMN_PRIVILEGES', 'GRANTEE', 1, '', 'NO', 'varchar', 81, 243, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(81)', '', '', 'select', ''),
(NULL, 'information_schema', 'COLUMN_PRIVILEGES', 'TABLE_CATALOG', 2, NULL, 'YES', 'varchar', 512, 1536, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(512)', '', '', 'select', ''),
(NULL, 'information_schema', 'COLUMN_PRIVILEGES', 'TABLE_SCHEMA', 3, '', 'NO', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', ''),
(NULL, 'information_schema', 'COLUMN_PRIVILEGES', 'TABLE_NAME', 4, '', 'NO', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', ''),
(NULL, 'information_schema', 'COLUMN_PRIVILEGES', 'COLUMN_NAME', 5, '', 'NO', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', ''),
(NULL, 'information_schema', 'COLUMN_PRIVILEGES', 'PRIVILEGE_TYPE', 6, '', 'NO', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', ''),
(NULL, 'information_schema', 'COLUMN_PRIVILEGES', 'IS_GRANTABLE', 7, '', 'NO', 'varchar', 3, 9, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(3)', '', '', 'select', ''),
(NULL, 'information_schema', 'ENGINES', 'ENGINE', 1, '', 'NO', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', ''),
(NULL, 'information_schema', 'ENGINES', 'SUPPORT', 2, '', 'NO', 'varchar', 8, 24, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(8)', '', '', 'select', ''),
(NULL, 'information_schema', 'ENGINES', 'COMMENT', 3, '', 'NO', 'varchar', 80, 240, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(80)', '', '', 'select', ''),
(NULL, 'information_schema', 'ENGINES', 'TRANSACTIONS', 4, NULL, 'YES', 'varchar', 3, 9, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(3)', '', '', 'select', ''),
(NULL, 'information_schema', 'ENGINES', 'XA', 5, NULL, 'YES', 'varchar', 3, 9, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(3)', '', '', 'select', ''),
(NULL, 'information_schema', 'ENGINES', 'SAVEPOINTS', 6, NULL, 'YES', 'varchar', 3, 9, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(3)', '', '', 'select', ''),
(NULL, 'information_schema', 'EVENTS', 'EVENT_CATALOG', 1, NULL, 'YES', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', ''),
(NULL, 'information_schema', 'EVENTS', 'EVENT_SCHEMA', 2, '', 'NO', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', ''),
(NULL, 'information_schema', 'EVENTS', 'EVENT_NAME', 3, '', 'NO', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', ''),
(NULL, 'information_schema', 'EVENTS', 'DEFINER', 4, '', 'NO', 'varchar', 77, 231, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(77)', '', '', 'select', ''),
(NULL, 'information_schema', 'EVENTS', 'TIME_ZONE', 5, '', 'NO', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', ''),
(NULL, 'information_schema', 'EVENTS', 'EVENT_BODY', 6, '', 'NO', 'varchar', 8, 24, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(8)', '', '', 'select', ''),
(NULL, 'information_schema', 'EVENTS', 'EVENT_DEFINITION', 7, NULL, 'NO', 'longtext', 4294967295, 4294967295, NULL, NULL, 'utf8', 'utf8_general_ci', 'longtext', '', '', 'select', ''),
(NULL, 'information_schema', 'EVENTS', 'EVENT_TYPE', 8, '', 'NO', 'varchar', 9, 27, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(9)', '', '', 'select', ''),
(NULL, 'information_schema', 'EVENTS', 'EXECUTE_AT', 9, NULL, 'YES', 'datetime', NULL, NULL, NULL, NULL, NULL, NULL, 'datetime', '', '', 'select', ''),
(NULL, 'information_schema', 'EVENTS', 'INTERVAL_VALUE', 10, NULL, 'YES', 'varchar', 256, 768, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(256)', '', '', 'select', ''),
(NULL, 'information_schema', 'EVENTS', 'INTERVAL_FIELD', 11, NULL, 'YES', 'varchar', 18, 54, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(18)', '', '', 'select', ''),
(NULL, 'information_schema', 'EVENTS', 'SQL_MODE', 12, '', 'NO', 'varchar', 8192, 24576, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(8192)', '', '', 'select', ''),
(NULL, 'information_schema', 'EVENTS', 'STARTS', 13, NULL, 'YES', 'datetime', NULL, NULL, NULL, NULL, NULL, NULL, 'datetime', '', '', 'select', ''),
(NULL, 'information_schema', 'EVENTS', 'ENDS', 14, NULL, 'YES', 'datetime', NULL, NULL, NULL, NULL, NULL, NULL, 'datetime', '', '', 'select', ''),
(NULL, 'information_schema', 'EVENTS', 'STATUS', 15, '', 'NO', 'varchar', 18, 54, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(18)', '', '', 'select', ''),
(NULL, 'information_schema', 'EVENTS', 'ON_COMPLETION', 16, '', 'NO', 'varchar', 12, 36, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(12)', '', '', 'select', ''),
(NULL, 'information_schema', 'EVENTS', 'CREATED', 17, '0000-00-00 00:00:00', 'NO', 'datetime', NULL, NULL, NULL, NULL, NULL, NULL, 'datetime', '', '', 'select', ''),
(NULL, 'information_schema', 'EVENTS', 'LAST_ALTERED', 18, '0000-00-00 00:00:00', 'NO', 'datetime', NULL, NULL, NULL, NULL, NULL, NULL, 'datetime', '', '', 'select', ''),
(NULL, 'information_schema', 'EVENTS', 'LAST_EXECUTED', 19, NULL, 'YES', 'datetime', NULL, NULL, NULL, NULL, NULL, NULL, 'datetime', '', '', 'select', ''),
(NULL, 'information_schema', 'EVENTS', 'EVENT_COMMENT', 20, '', 'NO', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', ''),
(NULL, 'information_schema', 'EVENTS', 'ORIGINATOR', 21, '0', 'NO', 'bigint', NULL, NULL, 19, 0, NULL, NULL, 'bigint(10)', '', '', 'select', ''),
(NULL, 'information_schema', 'EVENTS', 'CHARACTER_SET_CLIENT', 22, '', 'NO', 'varchar', 32, 96, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(32)', '', '', 'select', ''),
(NULL, 'information_schema', 'EVENTS', 'COLLATION_CONNECTION', 23, '', 'NO', 'varchar', 32, 96, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(32)', '', '', 'select', ''),
(NULL, 'information_schema', 'EVENTS', 'DATABASE_COLLATION', 24, '', 'NO', 'varchar', 32, 96, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(32)', '', '', 'select', ''),
(NULL, 'information_schema', 'FILES', 'FILE_ID', 1, '0', 'NO', 'bigint', NULL, NULL, 19, 0, NULL, NULL, 'bigint(4)', '', '', 'select', ''),
(NULL, 'information_schema', 'FILES', 'FILE_NAME', 2, NULL, 'YES', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', ''),
(NULL, 'information_schema', 'FILES', 'FILE_TYPE', 3, '', 'NO', 'varchar', 20, 60, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(20)', '', '', 'select', ''),
(NULL, 'information_schema', 'FILES', 'TABLESPACE_NAME', 4, NULL, 'YES', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', ''),
(NULL, 'information_schema', 'FILES', 'TABLE_CATALOG', 5, NULL, 'YES', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', ''),
(NULL, 'information_schema', 'FILES', 'TABLE_SCHEMA', 6, NULL, 'YES', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', ''),
(NULL, 'information_schema', 'FILES', 'TABLE_NAME', 7, NULL, 'YES', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', ''),
(NULL, 'information_schema', 'FILES', 'LOGFILE_GROUP_NAME', 8, NULL, 'YES', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', ''),
(NULL, 'information_schema', 'FILES', 'LOGFILE_GROUP_NUMBER', 9, NULL, 'YES', 'bigint', NULL, NULL, 19, 0, NULL, NULL, 'bigint(4)', '', '', 'select', ''),
(NULL, 'information_schema', 'FILES', 'ENGINE', 10, '', 'NO', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', ''),
(NULL, 'information_schema', 'FILES', 'FULLTEXT_KEYS', 11, NULL, 'YES', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', ''),
(NULL, 'information_schema', 'FILES', 'DELETED_ROWS', 12, NULL, 'YES', 'bigint', NULL, NULL, 19, 0, NULL, NULL, 'bigint(4)', '', '', 'select', ''),
(NULL, 'information_schema', 'FILES', 'UPDATE_COUNT', 13, NULL, 'YES', 'bigint', NULL, NULL, 19, 0, NULL, NULL, 'bigint(4)', '', '', 'select', ''),
(NULL, 'information_schema', 'FILES', 'FREE_EXTENTS', 14, NULL, 'YES', 'bigint', NULL, NULL, 19, 0, NULL, NULL, 'bigint(4)', '', '', 'select', ''),
(NULL, 'information_schema', 'FILES', 'TOTAL_EXTENTS', 15, NULL, 'YES', 'bigint', NULL, NULL, 19, 0, NULL, NULL, 'bigint(4)', '', '', 'select', ''),
(NULL, 'information_schema', 'FILES', 'EXTENT_SIZE', 16, '0', 'NO', 'bigint', NULL, NULL, 19, 0, NULL, NULL, 'bigint(4)', '', '', 'select', ''),
(NULL, 'information_schema', 'FILES', 'INITIAL_SIZE', 17, NULL, 'YES', 'bigint', NULL, NULL, 20, 0, NULL, NULL, 'bigint(21) unsigned', '', '', 'select', ''),
(NULL, 'information_schema', 'FILES', 'MAXIMUM_SIZE', 18, NULL, 'YES', 'bigint', NULL, NULL, 20, 0, NULL, NULL, 'bigint(21) unsigned', '', '', 'select', ''),
(NULL, 'information_schema', 'FILES', 'AUTOEXTEND_SIZE', 19, NULL, 'YES', 'bigint', NULL, NULL, 20, 0, NULL, NULL, 'bigint(21) unsigned', '', '', 'select', ''),
(NULL, 'information_schema', 'FILES', 'CREATION_TIME', 20, NULL, 'YES', 'datetime', NULL, NULL, NULL, NULL, NULL, NULL, 'datetime', '', '', 'select', ''),
(NULL, 'information_schema', 'FILES', 'LAST_UPDATE_TIME', 21, NULL, 'YES', 'datetime', NULL, NULL, NULL, NULL, NULL, NULL, 'datetime', '', '', 'select', ''),
(NULL, 'information_schema', 'FILES', 'LAST_ACCESS_TIME', 22, NULL, 'YES', 'datetime', NULL, NULL, NULL, NULL, NULL, NULL, 'datetime', '', '', 'select', ''),
(NULL, 'information_schema', 'FILES', 'RECOVER_TIME', 23, NULL, 'YES', 'bigint', NULL, NULL, 19, 0, NULL, NULL, 'bigint(4)', '', '', 'select', ''),
(NULL, 'information_schema', 'FILES', 'TRANSACTION_COUNTER', 24, NULL, 'YES', 'bigint', NULL, NULL, 19, 0, NULL, NULL, 'bigint(4)', '', '', 'select', ''),
(NULL, 'information_schema', 'FILES', 'VERSION', 25, NULL, 'YES', 'bigint', NULL, NULL, 20, 0, NULL, NULL, 'bigint(21) unsigned', '', '', 'select', ''),
(NULL, 'information_schema', 'FILES', 'ROW_FORMAT', 26, NULL, 'YES', 'varchar', 10, 30, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(10)', '', '', 'select', ''),
(NULL, 'information_schema', 'FILES', 'TABLE_ROWS', 27, NULL, 'YES', 'bigint', NULL, NULL, 20, 0, NULL, NULL, 'bigint(21) unsigned', '', '', 'select', ''),
(NULL, 'information_schema', 'FILES', 'AVG_ROW_LENGTH', 28, NULL, 'YES', 'bigint', NULL, NULL, 20, 0, NULL, NULL, 'bigint(21) unsigned', '', '', 'select', ''),
(NULL, 'information_schema', 'FILES', 'DATA_LENGTH', 29, NULL, 'YES', 'bigint', NULL, NULL, 20, 0, NULL, NULL, 'bigint(21) unsigned', '', '', 'select', ''),
(NULL, 'information_schema', 'FILES', 'MAX_DATA_LENGTH', 30, NULL, 'YES', 'bigint', NULL, NULL, 20, 0, NULL, NULL, 'bigint(21) unsigned', '', '', 'select', ''),
(NULL, 'information_schema', 'FILES', 'INDEX_LENGTH', 31, NULL, 'YES', 'bigint', NULL, NULL, 20, 0, NULL, NULL, 'bigint(21) unsigned', '', '', 'select', ''),
(NULL, 'information_schema', 'FILES', 'DATA_FREE', 32, NULL, 'YES', 'bigint', NULL, NULL, 20, 0, NULL, NULL, 'bigint(21) unsigned', '', '', 'select', ''),
(NULL, 'information_schema', 'FILES', 'CREATE_TIME', 33, NULL, 'YES', 'datetime', NULL, NULL, NULL, NULL, NULL, NULL, 'datetime', '', '', 'select', ''),
(NULL, 'information_schema', 'FILES', 'UPDATE_TIME', 34, NULL, 'YES', 'datetime', NULL, NULL, NULL, NULL, NULL, NULL, 'datetime', '', '', 'select', ''),
(NULL, 'information_schema', 'FILES', 'CHECK_TIME', 35, NULL, 'YES', 'datetime', NULL, NULL, NULL, NULL, NULL, NULL, 'datetime', '', '', 'select', ''),
(NULL, 'information_schema', 'FILES', 'CHECKSUM', 36, NULL, 'YES', 'bigint', NULL, NULL, 20, 0, NULL, NULL, 'bigint(21) unsigned', '', '', 'select', ''),
(NULL, 'information_schema', 'FILES', 'STATUS', 37, '', 'NO', 'varchar', 20, 60, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(20)', '', '', 'select', ''),
(NULL, 'information_schema', 'FILES', 'EXTRA', 38, NULL, 'YES', 'varchar', 255, 765, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(255)', '', '', 'select', ''),
(NULL, 'information_schema', 'GLOBAL_STATUS', 'VARIABLE_NAME', 1, '', 'NO', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', ''),
(NULL, 'information_schema', 'GLOBAL_STATUS', 'VARIABLE_VALUE', 2, NULL, 'YES', 'varchar', 1024, 3072, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(1024)', '', '', 'select', ''),
(NULL, 'information_schema', 'GLOBAL_VARIABLES', 'VARIABLE_NAME', 1, '', 'NO', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', ''),
(NULL, 'information_schema', 'GLOBAL_VARIABLES', 'VARIABLE_VALUE', 2, NULL, 'YES', 'varchar', 1024, 3072, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(1024)', '', '', 'select', ''),
(NULL, 'information_schema', 'KEY_COLUMN_USAGE', 'CONSTRAINT_CATALOG', 1, NULL, 'YES', 'varchar', 512, 1536, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(512)', '', '', 'select', ''),
(NULL, 'information_schema', 'KEY_COLUMN_USAGE', 'CONSTRAINT_SCHEMA', 2, '', 'NO', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', ''),
(NULL, 'information_schema', 'KEY_COLUMN_USAGE', 'CONSTRAINT_NAME', 3, '', 'NO', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', ''),
(NULL, 'information_schema', 'KEY_COLUMN_USAGE', 'TABLE_CATALOG', 4, NULL, 'YES', 'varchar', 512, 1536, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(512)', '', '', 'select', ''),
(NULL, 'information_schema', 'KEY_COLUMN_USAGE', 'TABLE_SCHEMA', 5, '', 'NO', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', ''),
(NULL, 'information_schema', 'KEY_COLUMN_USAGE', 'TABLE_NAME', 6, '', 'NO', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', ''),
(NULL, 'information_schema', 'KEY_COLUMN_USAGE', 'COLUMN_NAME', 7, '', 'NO', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', ''),
(NULL, 'information_schema', 'KEY_COLUMN_USAGE', 'ORDINAL_POSITION', 8, '0', 'NO', 'bigint', NULL, NULL, 19, 0, NULL, NULL, 'bigint(10)', '', '', 'select', ''),
(NULL, 'information_schema', 'KEY_COLUMN_USAGE', 'POSITION_IN_UNIQUE_CONSTRAINT', 9, NULL, 'YES', 'bigint', NULL, NULL, 19, 0, NULL, NULL, 'bigint(10)', '', '', 'select', ''),
(NULL, 'information_schema', 'KEY_COLUMN_USAGE', 'REFERENCED_TABLE_SCHEMA', 10, NULL, 'YES', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', ''),
(NULL, 'information_schema', 'KEY_COLUMN_USAGE', 'REFERENCED_TABLE_NAME', 11, NULL, 'YES', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', ''),
(NULL, 'information_schema', 'KEY_COLUMN_USAGE', 'REFERENCED_COLUMN_NAME', 12, NULL, 'YES', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', ''),
(NULL, 'information_schema', 'PARTITIONS', 'TABLE_CATALOG', 1, NULL, 'YES', 'varchar', 512, 1536, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(512)', '', '', 'select', ''),
(NULL, 'information_schema', 'PARTITIONS', 'TABLE_SCHEMA', 2, '', 'NO', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', ''),
(NULL, 'information_schema', 'PARTITIONS', 'TABLE_NAME', 3, '', 'NO', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', ''),
(NULL, 'information_schema', 'PARTITIONS', 'PARTITION_NAME', 4, NULL, 'YES', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', ''),
(NULL, 'information_schema', 'PARTITIONS', 'SUBPARTITION_NAME', 5, NULL, 'YES', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', ''),
(NULL, 'information_schema', 'PARTITIONS', 'PARTITION_ORDINAL_POSITION', 6, NULL, 'YES', 'bigint', NULL, NULL, 20, 0, NULL, NULL, 'bigint(21) unsigned', '', '', 'select', ''),
(NULL, 'information_schema', 'PARTITIONS', 'SUBPARTITION_ORDINAL_POSITION', 7, NULL, 'YES', 'bigint', NULL, NULL, 20, 0, NULL, NULL, 'bigint(21) unsigned', '', '', 'select', ''),
(NULL, 'information_schema', 'PARTITIONS', 'PARTITION_METHOD', 8, NULL, 'YES', 'varchar', 12, 36, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(12)', '', '', 'select', ''),
(NULL, 'information_schema', 'PARTITIONS', 'SUBPARTITION_METHOD', 9, NULL, 'YES', 'varchar', 12, 36, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(12)', '', '', 'select', ''),
(NULL, 'information_schema', 'PARTITIONS', 'PARTITION_EXPRESSION', 10, NULL, 'YES', 'longtext', 4294967295, 4294967295, NULL, NULL, 'utf8', 'utf8_general_ci', 'longtext', '', '', 'select', ''),
(NULL, 'information_schema', 'PARTITIONS', 'SUBPARTITION_EXPRESSION', 11, NULL, 'YES', 'longtext', 4294967295, 4294967295, NULL, NULL, 'utf8', 'utf8_general_ci', 'longtext', '', '', 'select', ''),
(NULL, 'information_schema', 'PARTITIONS', 'PARTITION_DESCRIPTION', 12, NULL, 'YES', 'longtext', 4294967295, 4294967295, NULL, NULL, 'utf8', 'utf8_general_ci', 'longtext', '', '', 'select', ''),
(NULL, 'information_schema', 'PARTITIONS', 'TABLE_ROWS', 13, '0', 'NO', 'bigint', NULL, NULL, 20, 0, NULL, NULL, 'bigint(21) unsigned', '', '', 'select', ''),
(NULL, 'information_schema', 'PARTITIONS', 'AVG_ROW_LENGTH', 14, '0', 'NO', 'bigint', NULL, NULL, 20, 0, NULL, NULL, 'bigint(21) unsigned', '', '', 'select', ''),
(NULL, 'information_schema', 'PARTITIONS', 'DATA_LENGTH', 15, '0', 'NO', 'bigint', NULL, NULL, 20, 0, NULL, NULL, 'bigint(21) unsigned', '', '', 'select', ''),
(NULL, 'information_schema', 'PARTITIONS', 'MAX_DATA_LENGTH', 16, NULL, 'YES', 'bigint', NULL, NULL, 20, 0, NULL, NULL, 'bigint(21) unsigned', '', '', 'select', ''),
(NULL, 'information_schema', 'PARTITIONS', 'INDEX_LENGTH', 17, '0', 'NO', 'bigint', NULL, NULL, 20, 0, NULL, NULL, 'bigint(21) unsigned', '', '', 'select', ''),
(NULL, 'information_schema', 'PARTITIONS', 'DATA_FREE', 18, '0', 'NO', 'bigint', NULL, NULL, 20, 0, NULL, NULL, 'bigint(21) unsigned', '', '', 'select', ''),
(NULL, 'information_schema', 'PARTITIONS', 'CREATE_TIME', 19, NULL, 'YES', 'datetime', NULL, NULL, NULL, NULL, NULL, NULL, 'datetime', '', '', 'select', ''),
(NULL, 'information_schema', 'PARTITIONS', 'UPDATE_TIME', 20, NULL, 'YES', 'datetime', NULL, NULL, NULL, NULL, NULL, NULL, 'datetime', '', '', 'select', ''),
(NULL, 'information_schema', 'PARTITIONS', 'CHECK_TIME', 21, NULL, 'YES', 'datetime', NULL, NULL, NULL, NULL, NULL, NULL, 'datetime', '', '', 'select', ''),
(NULL, 'information_schema', 'PARTITIONS', 'CHECKSUM', 22, NULL, 'YES', 'bigint', NULL, NULL, 20, 0, NULL, NULL, 'bigint(21) unsigned', '', '', 'select', ''),
(NULL, 'information_schema', 'PARTITIONS', 'PARTITION_COMMENT', 23, '', 'NO', 'varchar', 80, 240, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(80)', '', '', 'select', ''),
(NULL, 'information_schema', 'PARTITIONS', 'NODEGROUP', 24, '', 'NO', 'varchar', 12, 36, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(12)', '', '', 'select', ''),
(NULL, 'information_schema', 'PARTITIONS', 'TABLESPACE_NAME', 25, NULL, 'YES', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', ''),
(NULL, 'information_schema', 'PLUGINS', 'PLUGIN_NAME', 1, '', 'NO', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', ''),
(NULL, 'information_schema', 'PLUGINS', 'PLUGIN_VERSION', 2, '', 'NO', 'varchar', 20, 60, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(20)', '', '', 'select', ''),
(NULL, 'information_schema', 'PLUGINS', 'PLUGIN_STATUS', 3, '', 'NO', 'varchar', 10, 30, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(10)', '', '', 'select', ''),
(NULL, 'information_schema', 'PLUGINS', 'PLUGIN_TYPE', 4, '', 'NO', 'varchar', 80, 240, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(80)', '', '', 'select', ''),
(NULL, 'information_schema', 'PLUGINS', 'PLUGIN_TYPE_VERSION', 5, '', 'NO', 'varchar', 20, 60, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(20)', '', '', 'select', ''),
(NULL, 'information_schema', 'PLUGINS', 'PLUGIN_LIBRARY', 6, NULL, 'YES', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', ''),
(NULL, 'information_schema', 'PLUGINS', 'PLUGIN_LIBRARY_VERSION', 7, NULL, 'YES', 'varchar', 20, 60, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(20)', '', '', 'select', ''),
(NULL, 'information_schema', 'PLUGINS', 'PLUGIN_AUTHOR', 8, NULL, 'YES', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', ''),
(NULL, 'information_schema', 'PLUGINS', 'PLUGIN_DESCRIPTION', 9, NULL, 'YES', 'longtext', 4294967295, 4294967295, NULL, NULL, 'utf8', 'utf8_general_ci', 'longtext', '', '', 'select', ''),
(NULL, 'information_schema', 'PLUGINS', 'PLUGIN_LICENSE', 10, NULL, 'YES', 'varchar', 80, 240, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(80)', '', '', 'select', ''),
(NULL, 'information_schema', 'PROCESSLIST', 'ID', 1, '0', 'NO', 'bigint', NULL, NULL, 19, 0, NULL, NULL, 'bigint(4)', '', '', 'select', ''),
(NULL, 'information_schema', 'PROCESSLIST', 'USER', 2, '', 'NO', 'varchar', 16, 48, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(16)', '', '', 'select', ''),
(NULL, 'information_schema', 'PROCESSLIST', 'HOST', 3, '', 'NO', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', ''),
(NULL, 'information_schema', 'PROCESSLIST', 'DB', 4, NULL, 'YES', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', ''),
(NULL, 'information_schema', 'PROCESSLIST', 'COMMAND', 5, '', 'NO', 'varchar', 16, 48, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(16)', '', '', 'select', ''),
(NULL, 'information_schema', 'PROCESSLIST', 'TIME', 6, '0', 'NO', 'int', NULL, NULL, 10, 0, NULL, NULL, 'int(7)', '', '', 'select', ''),
(NULL, 'information_schema', 'PROCESSLIST', 'STATE', 7, NULL, 'YES', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', ''),
(NULL, 'information_schema', 'PROCESSLIST', 'INFO', 8, NULL, 'YES', 'longtext', 4294967295, 4294967295, NULL, NULL, 'utf8', 'utf8_general_ci', 'longtext', '', '', 'select', ''),
(NULL, 'information_schema', 'PROFILING', 'QUERY_ID', 1, '0', 'NO', 'int', NULL, NULL, 10, 0, NULL, NULL, 'int(20)', '', '', 'select', ''),
(NULL, 'information_schema', 'PROFILING', 'SEQ', 2, '0', 'NO', 'int', NULL, NULL, 10, 0, NULL, NULL, 'int(20)', '', '', 'select', ''),
(NULL, 'information_schema', 'PROFILING', 'STATE', 3, '', 'NO', 'varchar', 30, 90, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(30)', '', '', 'select', ''),
(NULL, 'information_schema', 'PROFILING', 'DURATION', 4, '0.000000', 'NO', 'decimal', NULL, NULL, 9, 6, NULL, NULL, 'decimal(9,6)', '', '', 'select', ''),
(NULL, 'information_schema', 'PROFILING', 'CPU_USER', 5, NULL, 'YES', 'decimal', NULL, NULL, 9, 6, NULL, NULL, 'decimal(9,6)', '', '', 'select', ''),
(NULL, 'information_schema', 'PROFILING', 'CPU_SYSTEM', 6, NULL, 'YES', 'decimal', NULL, NULL, 9, 6, NULL, NULL, 'decimal(9,6)', '', '', 'select', ''),
(NULL, 'information_schema', 'PROFILING', 'CONTEXT_VOLUNTARY', 7, NULL, 'YES', 'int', NULL, NULL, 10, 0, NULL, NULL, 'int(20)', '', '', 'select', ''),
(NULL, 'information_schema', 'PROFILING', 'CONTEXT_INVOLUNTARY', 8, NULL, 'YES', 'int', NULL, NULL, 10, 0, NULL, NULL, 'int(20)', '', '', 'select', ''),
(NULL, 'information_schema', 'PROFILING', 'BLOCK_OPS_IN', 9, NULL, 'YES', 'int', NULL, NULL, 10, 0, NULL, NULL, 'int(20)', '', '', 'select', ''),
(NULL, 'information_schema', 'PROFILING', 'BLOCK_OPS_OUT', 10, NULL, 'YES', 'int', NULL, NULL, 10, 0, NULL, NULL, 'int(20)', '', '', 'select', ''),
(NULL, 'information_schema', 'PROFILING', 'MESSAGES_SENT', 11, NULL, 'YES', 'int', NULL, NULL, 10, 0, NULL, NULL, 'int(20)', '', '', 'select', ''),
(NULL, 'information_schema', 'PROFILING', 'MESSAGES_RECEIVED', 12, NULL, 'YES', 'int', NULL, NULL, 10, 0, NULL, NULL, 'int(20)', '', '', 'select', ''),
(NULL, 'information_schema', 'PROFILING', 'PAGE_FAULTS_MAJOR', 13, NULL, 'YES', 'int', NULL, NULL, 10, 0, NULL, NULL, 'int(20)', '', '', 'select', ''),
(NULL, 'information_schema', 'PROFILING', 'PAGE_FAULTS_MINOR', 14, NULL, 'YES', 'int', NULL, NULL, 10, 0, NULL, NULL, 'int(20)', '', '', 'select', ''),
(NULL, 'information_schema', 'PROFILING', 'SWAPS', 15, NULL, 'YES', 'int', NULL, NULL, 10, 0, NULL, NULL, 'int(20)', '', '', 'select', ''),
(NULL, 'information_schema', 'PROFILING', 'SOURCE_FUNCTION', 16, NULL, 'YES', 'varchar', 30, 90, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(30)', '', '', 'select', ''),
(NULL, 'information_schema', 'PROFILING', 'SOURCE_FILE', 17, NULL, 'YES', 'varchar', 20, 60, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(20)', '', '', 'select', ''),
(NULL, 'information_schema', 'PROFILING', 'SOURCE_LINE', 18, NULL, 'YES', 'int', NULL, NULL, 10, 0, NULL, NULL, 'int(20)', '', '', 'select', ''),
(NULL, 'information_schema', 'REFERENTIAL_CONSTRAINTS', 'CONSTRAINT_CATALOG', 1, NULL, 'YES', 'varchar', 512, 1536, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(512)', '', '', 'select', ''),
(NULL, 'information_schema', 'REFERENTIAL_CONSTRAINTS', 'CONSTRAINT_SCHEMA', 2, '', 'NO', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', ''),
(NULL, 'information_schema', 'REFERENTIAL_CONSTRAINTS', 'CONSTRAINT_NAME', 3, '', 'NO', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', ''),
(NULL, 'information_schema', 'REFERENTIAL_CONSTRAINTS', 'UNIQUE_CONSTRAINT_CATALOG', 4, NULL, 'YES', 'varchar', 512, 1536, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(512)', '', '', 'select', ''),
(NULL, 'information_schema', 'REFERENTIAL_CONSTRAINTS', 'UNIQUE_CONSTRAINT_SCHEMA', 5, '', 'NO', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', ''),
(NULL, 'information_schema', 'REFERENTIAL_CONSTRAINTS', 'UNIQUE_CONSTRAINT_NAME', 6, NULL, 'YES', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', ''),
(NULL, 'information_schema', 'REFERENTIAL_CONSTRAINTS', 'MATCH_OPTION', 7, '', 'NO', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', ''),
(NULL, 'information_schema', 'REFERENTIAL_CONSTRAINTS', 'UPDATE_RULE', 8, '', 'NO', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', ''),
(NULL, 'information_schema', 'REFERENTIAL_CONSTRAINTS', 'DELETE_RULE', 9, '', 'NO', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', ''),
(NULL, 'information_schema', 'REFERENTIAL_CONSTRAINTS', 'TABLE_NAME', 10, '', 'NO', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', ''),
(NULL, 'information_schema', 'REFERENTIAL_CONSTRAINTS', 'REFERENCED_TABLE_NAME', 11, '', 'NO', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', ''),
(NULL, 'information_schema', 'ROUTINES', 'SPECIFIC_NAME', 1, '', 'NO', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', ''),
(NULL, 'information_schema', 'ROUTINES', 'ROUTINE_CATALOG', 2, NULL, 'YES', 'varchar', 512, 1536, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(512)', '', '', 'select', ''),
(NULL, 'information_schema', 'ROUTINES', 'ROUTINE_SCHEMA', 3, '', 'NO', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', ''),
(NULL, 'information_schema', 'ROUTINES', 'ROUTINE_NAME', 4, '', 'NO', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', ''),
(NULL, 'information_schema', 'ROUTINES', 'ROUTINE_TYPE', 5, '', 'NO', 'varchar', 9, 27, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(9)', '', '', 'select', ''),
(NULL, 'information_schema', 'ROUTINES', 'DTD_IDENTIFIER', 6, NULL, 'YES', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', ''),
(NULL, 'information_schema', 'ROUTINES', 'ROUTINE_BODY', 7, '', 'NO', 'varchar', 8, 24, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(8)', '', '', 'select', ''),
(NULL, 'information_schema', 'ROUTINES', 'ROUTINE_DEFINITION', 8, NULL, 'YES', 'longtext', 4294967295, 4294967295, NULL, NULL, 'utf8', 'utf8_general_ci', 'longtext', '', '', 'select', ''),
(NULL, 'information_schema', 'ROUTINES', 'EXTERNAL_NAME', 9, NULL, 'YES', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', ''),
(NULL, 'information_schema', 'ROUTINES', 'EXTERNAL_LANGUAGE', 10, NULL, 'YES', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', ''),
(NULL, 'information_schema', 'ROUTINES', 'PARAMETER_STYLE', 11, '', 'NO', 'varchar', 8, 24, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(8)', '', '', 'select', ''),
(NULL, 'information_schema', 'ROUTINES', 'IS_DETERMINISTIC', 12, '', 'NO', 'varchar', 3, 9, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(3)', '', '', 'select', ''),
(NULL, 'information_schema', 'ROUTINES', 'SQL_DATA_ACCESS', 13, '', 'NO', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', ''),
(NULL, 'information_schema', 'ROUTINES', 'SQL_PATH', 14, NULL, 'YES', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', ''),
(NULL, 'information_schema', 'ROUTINES', 'SECURITY_TYPE', 15, '', 'NO', 'varchar', 7, 21, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(7)', '', '', 'select', ''),
(NULL, 'information_schema', 'ROUTINES', 'CREATED', 16, '0000-00-00 00:00:00', 'NO', 'datetime', NULL, NULL, NULL, NULL, NULL, NULL, 'datetime', '', '', 'select', ''),
(NULL, 'information_schema', 'ROUTINES', 'LAST_ALTERED', 17, '0000-00-00 00:00:00', 'NO', 'datetime', NULL, NULL, NULL, NULL, NULL, NULL, 'datetime', '', '', 'select', ''),
(NULL, 'information_schema', 'ROUTINES', 'SQL_MODE', 18, '', 'NO', 'varchar', 8192, 24576, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(8192)', '', '', 'select', ''),
(NULL, 'information_schema', 'ROUTINES', 'ROUTINE_COMMENT', 19, '', 'NO', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', ''),
(NULL, 'information_schema', 'ROUTINES', 'DEFINER', 20, '', 'NO', 'varchar', 77, 231, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(77)', '', '', 'select', ''),
(NULL, 'information_schema', 'ROUTINES', 'CHARACTER_SET_CLIENT', 21, '', 'NO', 'varchar', 32, 96, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(32)', '', '', 'select', ''),
(NULL, 'information_schema', 'ROUTINES', 'COLLATION_CONNECTION', 22, '', 'NO', 'varchar', 32, 96, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(32)', '', '', 'select', ''),
(NULL, 'information_schema', 'ROUTINES', 'DATABASE_COLLATION', 23, '', 'NO', 'varchar', 32, 96, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(32)', '', '', 'select', ''),
(NULL, 'information_schema', 'SCHEMATA', 'CATALOG_NAME', 1, NULL, 'YES', 'varchar', 512, 1536, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(512)', '', '', 'select', ''),
(NULL, 'information_schema', 'SCHEMATA', 'SCHEMA_NAME', 2, '', 'NO', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', ''),
(NULL, 'information_schema', 'SCHEMATA', 'DEFAULT_CHARACTER_SET_NAME', 3, '', 'NO', 'varchar', 32, 96, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(32)', '', '', 'select', ''),
(NULL, 'information_schema', 'SCHEMATA', 'DEFAULT_COLLATION_NAME', 4, '', 'NO', 'varchar', 32, 96, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(32)', '', '', 'select', ''),
(NULL, 'information_schema', 'SCHEMATA', 'SQL_PATH', 5, NULL, 'YES', 'varchar', 512, 1536, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(512)', '', '', 'select', ''),
(NULL, 'information_schema', 'SCHEMA_PRIVILEGES', 'GRANTEE', 1, '', 'NO', 'varchar', 81, 243, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(81)', '', '', 'select', ''),
(NULL, 'information_schema', 'SCHEMA_PRIVILEGES', 'TABLE_CATALOG', 2, NULL, 'YES', 'varchar', 512, 1536, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(512)', '', '', 'select', ''),
(NULL, 'information_schema', 'SCHEMA_PRIVILEGES', 'TABLE_SCHEMA', 3, '', 'NO', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', ''),
(NULL, 'information_schema', 'SCHEMA_PRIVILEGES', 'PRIVILEGE_TYPE', 4, '', 'NO', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', ''),
(NULL, 'information_schema', 'SCHEMA_PRIVILEGES', 'IS_GRANTABLE', 5, '', 'NO', 'varchar', 3, 9, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(3)', '', '', 'select', ''),
(NULL, 'information_schema', 'SESSION_STATUS', 'VARIABLE_NAME', 1, '', 'NO', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', ''),
(NULL, 'information_schema', 'SESSION_STATUS', 'VARIABLE_VALUE', 2, NULL, 'YES', 'varchar', 1024, 3072, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(1024)', '', '', 'select', ''),
(NULL, 'information_schema', 'SESSION_VARIABLES', 'VARIABLE_NAME', 1, '', 'NO', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', ''),
(NULL, 'information_schema', 'SESSION_VARIABLES', 'VARIABLE_VALUE', 2, NULL, 'YES', 'varchar', 1024, 3072, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(1024)', '', '', 'select', ''),
(NULL, 'information_schema', 'STATISTICS', 'TABLE_CATALOG', 1, NULL, 'YES', 'varchar', 512, 1536, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(512)', '', '', 'select', ''),
(NULL, 'information_schema', 'STATISTICS', 'TABLE_SCHEMA', 2, '', 'NO', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', ''),
(NULL, 'information_schema', 'STATISTICS', 'TABLE_NAME', 3, '', 'NO', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', ''),
(NULL, 'information_schema', 'STATISTICS', 'NON_UNIQUE', 4, '0', 'NO', 'bigint', NULL, NULL, 19, 0, NULL, NULL, 'bigint(1)', '', '', 'select', ''),
(NULL, 'information_schema', 'STATISTICS', 'INDEX_SCHEMA', 5, '', 'NO', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', ''),
(NULL, 'information_schema', 'STATISTICS', 'INDEX_NAME', 6, '', 'NO', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', ''),
(NULL, 'information_schema', 'STATISTICS', 'SEQ_IN_INDEX', 7, '0', 'NO', 'bigint', NULL, NULL, 19, 0, NULL, NULL, 'bigint(2)', '', '', 'select', ''),
(NULL, 'information_schema', 'STATISTICS', 'COLUMN_NAME', 8, '', 'NO', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', ''),
(NULL, 'information_schema', 'STATISTICS', 'COLLATION', 9, NULL, 'YES', 'varchar', 1, 3, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(1)', '', '', 'select', ''),
(NULL, 'information_schema', 'STATISTICS', 'CARDINALITY', 10, NULL, 'YES', 'bigint', NULL, NULL, 19, 0, NULL, NULL, 'bigint(21)', '', '', 'select', ''),
(NULL, 'information_schema', 'STATISTICS', 'SUB_PART', 11, NULL, 'YES', 'bigint', NULL, NULL, 19, 0, NULL, NULL, 'bigint(3)', '', '', 'select', ''),
(NULL, 'information_schema', 'STATISTICS', 'PACKED', 12, NULL, 'YES', 'varchar', 10, 30, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(10)', '', '', 'select', ''),
(NULL, 'information_schema', 'STATISTICS', 'NULLABLE', 13, '', 'NO', 'varchar', 3, 9, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(3)', '', '', 'select', ''),
(NULL, 'information_schema', 'STATISTICS', 'INDEX_TYPE', 14, '', 'NO', 'varchar', 16, 48, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(16)', '', '', 'select', ''),
(NULL, 'information_schema', 'STATISTICS', 'COMMENT', 15, NULL, 'YES', 'varchar', 16, 48, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(16)', '', '', 'select', ''),
(NULL, 'information_schema', 'TABLES', 'TABLE_CATALOG', 1, NULL, 'YES', 'varchar', 512, 1536, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(512)', '', '', 'select', ''),
(NULL, 'information_schema', 'TABLES', 'TABLE_SCHEMA', 2, '', 'NO', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', ''),
(NULL, 'information_schema', 'TABLES', 'TABLE_NAME', 3, '', 'NO', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', ''),
(NULL, 'information_schema', 'TABLES', 'TABLE_TYPE', 4, '', 'NO', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', ''),
(NULL, 'information_schema', 'TABLES', 'ENGINE', 5, NULL, 'YES', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', ''),
(NULL, 'information_schema', 'TABLES', 'VERSION', 6, NULL, 'YES', 'bigint', NULL, NULL, 20, 0, NULL, NULL, 'bigint(21) unsigned', '', '', 'select', ''),
(NULL, 'information_schema', 'TABLES', 'ROW_FORMAT', 7, NULL, 'YES', 'varchar', 10, 30, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(10)', '', '', 'select', ''),
(NULL, 'information_schema', 'TABLES', 'TABLE_ROWS', 8, NULL, 'YES', 'bigint', NULL, NULL, 20, 0, NULL, NULL, 'bigint(21) unsigned', '', '', 'select', ''),
(NULL, 'information_schema', 'TABLES', 'AVG_ROW_LENGTH', 9, NULL, 'YES', 'bigint', NULL, NULL, 20, 0, NULL, NULL, 'bigint(21) unsigned', '', '', 'select', ''),
(NULL, 'information_schema', 'TABLES', 'DATA_LENGTH', 10, NULL, 'YES', 'bigint', NULL, NULL, 20, 0, NULL, NULL, 'bigint(21) unsigned', '', '', 'select', ''),
(NULL, 'information_schema', 'TABLES', 'MAX_DATA_LENGTH', 11, NULL, 'YES', 'bigint', NULL, NULL, 20, 0, NULL, NULL, 'bigint(21) unsigned', '', '', 'select', ''),
(NULL, 'information_schema', 'TABLES', 'INDEX_LENGTH', 12, NULL, 'YES', 'bigint', NULL, NULL, 20, 0, NULL, NULL, 'bigint(21) unsigned', '', '', 'select', ''),
(NULL, 'information_schema', 'TABLES', 'DATA_FREE', 13, NULL, 'YES', 'bigint', NULL, NULL, 20, 0, NULL, NULL, 'bigint(21) unsigned', '', '', 'select', ''),
(NULL, 'information_schema', 'TABLES', 'AUTO_INCREMENT', 14, NULL, 'YES', 'bigint', NULL, NULL, 20, 0, NULL, NULL, 'bigint(21) unsigned', '', '', 'select', ''),
(NULL, 'information_schema', 'TABLES', 'CREATE_TIME', 15, NULL, 'YES', 'datetime', NULL, NULL, NULL, NULL, NULL, NULL, 'datetime', '', '', 'select', ''),
(NULL, 'information_schema', 'TABLES', 'UPDATE_TIME', 16, NULL, 'YES', 'datetime', NULL, NULL, NULL, NULL, NULL, NULL, 'datetime', '', '', 'select', ''),
(NULL, 'information_schema', 'TABLES', 'CHECK_TIME', 17, NULL, 'YES', 'datetime', NULL, NULL, NULL, NULL, NULL, NULL, 'datetime', '', '', 'select', ''),
(NULL, 'information_schema', 'TABLES', 'TABLE_COLLATION', 18, NULL, 'YES', 'varchar', 32, 96, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(32)', '', '', 'select', ''),
(NULL, 'information_schema', 'TABLES', 'CHECKSUM', 19, NULL, 'YES', 'bigint', NULL, NULL, 20, 0, NULL, NULL, 'bigint(21) unsigned', '', '', 'select', ''),
(NULL, 'information_schema', 'TABLES', 'CREATE_OPTIONS', 20, NULL, 'YES', 'varchar', 255, 765, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(255)', '', '', 'select', ''),
(NULL, 'information_schema', 'TABLES', 'TABLE_COMMENT', 21, '', 'NO', 'varchar', 80, 240, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(80)', '', '', 'select', ''),
(NULL, 'information_schema', 'TABLE_CONSTRAINTS', 'CONSTRAINT_CATALOG', 1, NULL, 'YES', 'varchar', 512, 1536, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(512)', '', '', 'select', ''),
(NULL, 'information_schema', 'TABLE_CONSTRAINTS', 'CONSTRAINT_SCHEMA', 2, '', 'NO', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', ''),
(NULL, 'information_schema', 'TABLE_CONSTRAINTS', 'CONSTRAINT_NAME', 3, '', 'NO', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', ''),
(NULL, 'information_schema', 'TABLE_CONSTRAINTS', 'TABLE_SCHEMA', 4, '', 'NO', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', ''),
(NULL, 'information_schema', 'TABLE_CONSTRAINTS', 'TABLE_NAME', 5, '', 'NO', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', ''),
(NULL, 'information_schema', 'TABLE_CONSTRAINTS', 'CONSTRAINT_TYPE', 6, '', 'NO', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', ''),
(NULL, 'information_schema', 'TABLE_PRIVILEGES', 'GRANTEE', 1, '', 'NO', 'varchar', 81, 243, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(81)', '', '', 'select', ''),
(NULL, 'information_schema', 'TABLE_PRIVILEGES', 'TABLE_CATALOG', 2, NULL, 'YES', 'varchar', 512, 1536, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(512)', '', '', 'select', ''),
(NULL, 'information_schema', 'TABLE_PRIVILEGES', 'TABLE_SCHEMA', 3, '', 'NO', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', ''),
(NULL, 'information_schema', 'TABLE_PRIVILEGES', 'TABLE_NAME', 4, '', 'NO', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', ''),
(NULL, 'information_schema', 'TABLE_PRIVILEGES', 'PRIVILEGE_TYPE', 5, '', 'NO', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', ''),
(NULL, 'information_schema', 'TABLE_PRIVILEGES', 'IS_GRANTABLE', 6, '', 'NO', 'varchar', 3, 9, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(3)', '', '', 'select', ''),
(NULL, 'information_schema', 'TRIGGERS', 'TRIGGER_CATALOG', 1, NULL, 'YES', 'varchar', 512, 1536, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(512)', '', '', 'select', ''),
(NULL, 'information_schema', 'TRIGGERS', 'TRIGGER_SCHEMA', 2, '', 'NO', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', ''),
(NULL, 'information_schema', 'TRIGGERS', 'TRIGGER_NAME', 3, '', 'NO', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', ''),
(NULL, 'information_schema', 'TRIGGERS', 'EVENT_MANIPULATION', 4, '', 'NO', 'varchar', 6, 18, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(6)', '', '', 'select', ''),
(NULL, 'information_schema', 'TRIGGERS', 'EVENT_OBJECT_CATALOG', 5, NULL, 'YES', 'varchar', 512, 1536, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(512)', '', '', 'select', ''),
(NULL, 'information_schema', 'TRIGGERS', 'EVENT_OBJECT_SCHEMA', 6, '', 'NO', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', ''),
(NULL, 'information_schema', 'TRIGGERS', 'EVENT_OBJECT_TABLE', 7, '', 'NO', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', ''),
(NULL, 'information_schema', 'TRIGGERS', 'ACTION_ORDER', 8, '0', 'NO', 'bigint', NULL, NULL, 19, 0, NULL, NULL, 'bigint(4)', '', '', 'select', ''),
(NULL, 'information_schema', 'TRIGGERS', 'ACTION_CONDITION', 9, NULL, 'YES', 'longtext', 4294967295, 4294967295, NULL, NULL, 'utf8', 'utf8_general_ci', 'longtext', '', '', 'select', ''),
(NULL, 'information_schema', 'TRIGGERS', 'ACTION_STATEMENT', 10, NULL, 'NO', 'longtext', 4294967295, 4294967295, NULL, NULL, 'utf8', 'utf8_general_ci', 'longtext', '', '', 'select', ''),
(NULL, 'information_schema', 'TRIGGERS', 'ACTION_ORIENTATION', 11, '', 'NO', 'varchar', 9, 27, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(9)', '', '', 'select', ''),
(NULL, 'information_schema', 'TRIGGERS', 'ACTION_TIMING', 12, '', 'NO', 'varchar', 6, 18, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(6)', '', '', 'select', ''),
(NULL, 'information_schema', 'TRIGGERS', 'ACTION_REFERENCE_OLD_TABLE', 13, NULL, 'YES', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', ''),
(NULL, 'information_schema', 'TRIGGERS', 'ACTION_REFERENCE_NEW_TABLE', 14, NULL, 'YES', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', ''),
(NULL, 'information_schema', 'TRIGGERS', 'ACTION_REFERENCE_OLD_ROW', 15, '', 'NO', 'varchar', 3, 9, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(3)', '', '', 'select', ''),
(NULL, 'information_schema', 'TRIGGERS', 'ACTION_REFERENCE_NEW_ROW', 16, '', 'NO', 'varchar', 3, 9, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(3)', '', '', 'select', ''),
(NULL, 'information_schema', 'TRIGGERS', 'CREATED', 17, NULL, 'YES', 'datetime', NULL, NULL, NULL, NULL, NULL, NULL, 'datetime', '', '', 'select', ''),
(NULL, 'information_schema', 'TRIGGERS', 'SQL_MODE', 18, '', 'NO', 'varchar', 8192, 24576, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(8192)', '', '', 'select', ''),
(NULL, 'information_schema', 'TRIGGERS', 'DEFINER', 19, '', 'NO', 'varchar', 77, 231, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(77)', '', '', 'select', ''),
(NULL, 'information_schema', 'TRIGGERS', 'CHARACTER_SET_CLIENT', 20, '', 'NO', 'varchar', 32, 96, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(32)', '', '', 'select', ''),
(NULL, 'information_schema', 'TRIGGERS', 'COLLATION_CONNECTION', 21, '', 'NO', 'varchar', 32, 96, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(32)', '', '', 'select', '');
INSERT INTO `COLUMNS` (`TABLE_CATALOG`, `TABLE_SCHEMA`, `TABLE_NAME`, `COLUMN_NAME`, `ORDINAL_POSITION`, `COLUMN_DEFAULT`, `IS_NULLABLE`, `DATA_TYPE`, `CHARACTER_MAXIMUM_LENGTH`, `CHARACTER_OCTET_LENGTH`, `NUMERIC_PRECISION`, `NUMERIC_SCALE`, `CHARACTER_SET_NAME`, `COLLATION_NAME`, `COLUMN_TYPE`, `COLUMN_KEY`, `EXTRA`, `PRIVILEGES`, `COLUMN_COMMENT`) VALUES
(NULL, 'information_schema', 'TRIGGERS', 'DATABASE_COLLATION', 22, '', 'NO', 'varchar', 32, 96, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(32)', '', '', 'select', ''),
(NULL, 'information_schema', 'USER_PRIVILEGES', 'GRANTEE', 1, '', 'NO', 'varchar', 81, 243, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(81)', '', '', 'select', ''),
(NULL, 'information_schema', 'USER_PRIVILEGES', 'TABLE_CATALOG', 2, NULL, 'YES', 'varchar', 512, 1536, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(512)', '', '', 'select', ''),
(NULL, 'information_schema', 'USER_PRIVILEGES', 'PRIVILEGE_TYPE', 3, '', 'NO', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', ''),
(NULL, 'information_schema', 'USER_PRIVILEGES', 'IS_GRANTABLE', 4, '', 'NO', 'varchar', 3, 9, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(3)', '', '', 'select', ''),
(NULL, 'information_schema', 'VIEWS', 'TABLE_CATALOG', 1, NULL, 'YES', 'varchar', 512, 1536, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(512)', '', '', 'select', ''),
(NULL, 'information_schema', 'VIEWS', 'TABLE_SCHEMA', 2, '', 'NO', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', ''),
(NULL, 'information_schema', 'VIEWS', 'TABLE_NAME', 3, '', 'NO', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', ''),
(NULL, 'information_schema', 'VIEWS', 'VIEW_DEFINITION', 4, NULL, 'NO', 'longtext', 4294967295, 4294967295, NULL, NULL, 'utf8', 'utf8_general_ci', 'longtext', '', '', 'select', ''),
(NULL, 'information_schema', 'VIEWS', 'CHECK_OPTION', 5, '', 'NO', 'varchar', 8, 24, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(8)', '', '', 'select', ''),
(NULL, 'information_schema', 'VIEWS', 'IS_UPDATABLE', 6, '', 'NO', 'varchar', 3, 9, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(3)', '', '', 'select', ''),
(NULL, 'information_schema', 'VIEWS', 'DEFINER', 7, '', 'NO', 'varchar', 77, 231, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(77)', '', '', 'select', ''),
(NULL, 'information_schema', 'VIEWS', 'SECURITY_TYPE', 8, '', 'NO', 'varchar', 7, 21, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(7)', '', '', 'select', ''),
(NULL, 'information_schema', 'VIEWS', 'CHARACTER_SET_CLIENT', 9, '', 'NO', 'varchar', 32, 96, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(32)', '', '', 'select', ''),
(NULL, 'information_schema', 'VIEWS', 'COLLATION_CONNECTION', 10, '', 'NO', 'varchar', 32, 96, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(32)', '', '', 'select', ''),
(NULL, 'cs4400_Team_20', 'Customer', 'Username', 1, NULL, 'NO', 'varchar', 50, 50, NULL, NULL, 'latin1', 'latin1_swedish_ci', 'varchar(50)', 'PRI', '', 'select,insert,update', ''),
(NULL, 'cs4400_Team_20', 'Customer', 'Email', 2, NULL, 'NO', 'varchar', 50, 50, NULL, NULL, 'latin1', 'latin1_swedish_ci', 'varchar(50)', 'UNI', '', 'select,insert,update', ''),
(NULL, 'cs4400_Team_20', 'Customer', 'IsStudent', 3, NULL, 'NO', 'tinyint', NULL, NULL, 3, 0, NULL, NULL, 'tinyint(1)', '', '', 'select,insert,update', ''),
(NULL, 'cs4400_Team_20', 'Manager', 'Username', 1, NULL, 'NO', 'varchar', 50, 50, NULL, NULL, 'latin1', 'latin1_swedish_ci', 'varchar(50)', 'PRI', '', 'select,insert,update', ''),
(NULL, 'cs4400_Team_20', 'PaymentInfo', 'CardNum', 1, NULL, 'NO', 'char', 16, 16, NULL, NULL, 'latin1', 'latin1_swedish_ci', 'char(16)', 'PRI', '', 'select,insert,update', ''),
(NULL, 'cs4400_Team_20', 'PaymentInfo', 'CVV', 2, NULL, 'NO', 'char', 3, 3, NULL, NULL, 'latin1', 'latin1_swedish_ci', 'char(3)', '', '', 'select,insert,update', ''),
(NULL, 'cs4400_Team_20', 'PaymentInfo', 'ExpirationDate', 3, NULL, 'NO', 'date', NULL, NULL, NULL, NULL, NULL, NULL, 'date', '', '', 'select,insert,update', ''),
(NULL, 'cs4400_Team_20', 'PaymentInfo', 'NameOnCard', 4, NULL, 'NO', 'varchar', 50, 50, NULL, NULL, 'latin1', 'latin1_swedish_ci', 'varchar(50)', '', '', 'select,insert,update', ''),
(NULL, 'cs4400_Team_20', 'PaymentInfo', 'Username', 5, NULL, 'NO', 'varchar', 50, 50, NULL, NULL, 'latin1', 'latin1_swedish_ci', 'varchar(50)', 'MUL', '', 'select,insert,update', ''),
(NULL, 'cs4400_Team_20', 'Reservation', 'ReserveID', 1, NULL, 'NO', 'int', NULL, NULL, 10, 0, NULL, NULL, 'int(11)', 'PRI', '', 'select,insert,update', ''),
(NULL, 'cs4400_Team_20', 'Reservation', 'IsCancelled', 2, NULL, 'NO', 'tinyint', NULL, NULL, 3, 0, NULL, NULL, 'tinyint(1)', '', '', 'select,insert,update', ''),
(NULL, 'cs4400_Team_20', 'Reservation', 'Username', 3, NULL, 'NO', 'varchar', 50, 50, NULL, NULL, 'latin1', 'latin1_swedish_ci', 'varchar(50)', 'MUL', '', 'select,insert,update', ''),
(NULL, 'cs4400_Team_20', 'Reservation', 'CardNum', 4, '0', 'NO', 'char', 16, 16, NULL, NULL, 'latin1', 'latin1_swedish_ci', 'char(16)', 'MUL', '', 'select,insert,update', ''),
(NULL, 'cs4400_Team_20', 'Reserve', 'ReserveID', 1, NULL, 'NO', 'int', NULL, NULL, 10, 0, NULL, NULL, 'int(11)', 'PRI', '', 'select,insert,update', ''),
(NULL, 'cs4400_Team_20', 'Reserve', 'TrainNum', 2, NULL, 'NO', 'varchar', 25, 25, NULL, NULL, 'latin1', 'latin1_swedish_ci', 'varchar(25)', 'PRI', '', 'select,insert,update', ''),
(NULL, 'cs4400_Team_20', 'Reserve', 'Class', 3, NULL, 'NO', 'varchar', 10, 10, NULL, NULL, 'latin1', 'latin1_swedish_ci', 'varchar(10)', '', '', 'select,insert,update', ''),
(NULL, 'cs4400_Team_20', 'Reserve', 'DepartureDate', 4, NULL, 'NO', 'date', NULL, NULL, NULL, NULL, NULL, NULL, 'date', '', '', 'select,insert,update', ''),
(NULL, 'cs4400_Team_20', 'Reserve', 'PassengerName', 5, NULL, 'NO', 'varchar', 50, 50, NULL, NULL, 'latin1', 'latin1_swedish_ci', 'varchar(50)', '', '', 'select,insert,update', ''),
(NULL, 'cs4400_Team_20', 'Reserve', 'NumOfBaggage', 6, NULL, 'NO', 'int', NULL, NULL, 10, 0, NULL, NULL, 'int(11)', '', '', 'select,insert,update', ''),
(NULL, 'cs4400_Team_20', 'Reserve', 'DepartFrom', 7, NULL, 'NO', 'varchar', 50, 50, NULL, NULL, 'latin1', 'latin1_swedish_ci', 'varchar(50)', '', '', 'select,insert,update', ''),
(NULL, 'cs4400_Team_20', 'Reserve', 'ArriveAt', 8, NULL, 'NO', 'varchar', 50, 50, NULL, NULL, 'latin1', 'latin1_swedish_ci', 'varchar(50)', '', '', 'select,insert,update', ''),
(NULL, 'cs4400_Team_20', 'Reserve', 'UpdateTimes', 9, '0', 'NO', 'int', NULL, NULL, 10, 0, NULL, NULL, 'int(1)', '', '', 'select,insert,update', ''),
(NULL, 'cs4400_Team_20', 'Review', 'ReviewNum', 1, NULL, 'NO', 'int', NULL, NULL, 10, 0, NULL, NULL, 'int(11)', 'PRI', 'auto_increment', 'select,insert,update', ''),
(NULL, 'cs4400_Team_20', 'Review', 'Comment', 2, NULL, 'YES', 'text', 65535, 65535, NULL, NULL, 'latin1', 'latin1_swedish_ci', 'text', '', '', 'select,insert,update', ''),
(NULL, 'cs4400_Team_20', 'Review', 'Rating', 3, NULL, 'NO', 'varchar', 9, 9, NULL, NULL, 'latin1', 'latin1_swedish_ci', 'varchar(9)', '', '', 'select,insert,update', ''),
(NULL, 'cs4400_Team_20', 'Review', 'Username', 4, NULL, 'NO', 'varchar', 50, 50, NULL, NULL, 'latin1', 'latin1_swedish_ci', 'varchar(50)', 'MUL', '', 'select,insert,update', ''),
(NULL, 'cs4400_Team_20', 'Review', 'TrainNum', 5, NULL, 'NO', 'varchar', 50, 50, NULL, NULL, 'latin1', 'latin1_swedish_ci', 'varchar(50)', 'MUL', '', 'select,insert,update', ''),
(NULL, 'cs4400_Team_20', 'Station', 'StationName', 1, NULL, 'NO', 'varchar', 50, 50, NULL, NULL, 'latin1', 'latin1_swedish_ci', 'varchar(50)', 'PRI', '', 'select,insert,update', ''),
(NULL, 'cs4400_Team_20', 'Station', 'Location', 2, NULL, 'NO', 'varchar', 50, 50, NULL, NULL, 'latin1', 'latin1_swedish_ci', 'varchar(50)', '', '', 'select,insert,update', ''),
(NULL, 'cs4400_Team_20', 'Stop', 'TrainNum', 1, NULL, 'NO', 'varchar', 25, 25, NULL, NULL, 'latin1', 'latin1_swedish_ci', 'varchar(25)', 'PRI', '', 'select,insert,update', ''),
(NULL, 'cs4400_Team_20', 'Stop', 'StationName', 2, NULL, 'NO', 'varchar', 50, 50, NULL, NULL, 'latin1', 'latin1_swedish_ci', 'varchar(50)', 'PRI', '', 'select,insert,update', ''),
(NULL, 'cs4400_Team_20', 'Stop', 'ArrivalTime', 3, NULL, 'YES', 'time', NULL, NULL, NULL, NULL, NULL, NULL, 'time', '', '', 'select,insert,update', ''),
(NULL, 'cs4400_Team_20', 'Stop', 'DepartureTime', 4, NULL, 'YES', 'time', NULL, NULL, NULL, NULL, NULL, NULL, 'time', '', '', 'select,insert,update', ''),
(NULL, 'cs4400_Team_20', 'SystemInfo', 'MaxNumOfBaggage', 1, NULL, 'NO', 'int', NULL, NULL, 10, 0, NULL, NULL, 'int(11)', 'PRI', '', 'select,insert,update', ''),
(NULL, 'cs4400_Team_20', 'SystemInfo', 'NumOfFreeBaggage', 2, NULL, 'NO', 'int', NULL, NULL, 10, 0, NULL, NULL, 'int(11)', '', '', 'select,insert,update', ''),
(NULL, 'cs4400_Team_20', 'SystemInfo', 'StudentDiscount', 3, NULL, 'NO', 'decimal', NULL, NULL, 3, 2, NULL, NULL, 'decimal(3,2)', '', '', 'select,insert,update', ''),
(NULL, 'cs4400_Team_20', 'SystemInfo', 'ChangeFee', 4, NULL, 'NO', 'int', NULL, NULL, 10, 0, NULL, NULL, 'int(11)', '', '', 'select,insert,update', ''),
(NULL, 'cs4400_Team_20', 'Tickets', 'ReserveID', 1, NULL, 'NO', 'int', NULL, NULL, 10, 0, NULL, NULL, 'int(11)', '', '', 'select,insert,update', ''),
(NULL, 'cs4400_Team_20', 'Tickets', 'TrainNum', 2, NULL, 'NO', 'varchar', 25, 25, NULL, NULL, 'latin1', 'latin1_swedish_ci', 'varchar(25)', '', '', 'select,insert,update', ''),
(NULL, 'cs4400_Team_20', 'Tickets', 'Class', 3, NULL, 'NO', 'varchar', 10, 10, NULL, NULL, 'latin1', 'latin1_swedish_ci', 'varchar(10)', '', '', 'select,insert,update', ''),
(NULL, 'cs4400_Team_20', 'Tickets', 'DepartureDate', 4, NULL, 'NO', 'date', NULL, NULL, NULL, NULL, NULL, NULL, 'date', '', '', 'select,insert,update', ''),
(NULL, 'cs4400_Team_20', 'Tickets', 'PassengerName', 5, NULL, 'NO', 'varchar', 50, 50, NULL, NULL, 'latin1', 'latin1_swedish_ci', 'varchar(50)', '', '', 'select,insert,update', ''),
(NULL, 'cs4400_Team_20', 'Tickets', 'NumOfBaggage', 6, NULL, 'NO', 'int', NULL, NULL, 10, 0, NULL, NULL, 'int(11)', '', '', 'select,insert,update', ''),
(NULL, 'cs4400_Team_20', 'Tickets', 'DepartFrom', 7, NULL, 'NO', 'varchar', 50, 50, NULL, NULL, 'latin1', 'latin1_swedish_ci', 'varchar(50)', '', '', 'select,insert,update', ''),
(NULL, 'cs4400_Team_20', 'Tickets', 'ArriveAt', 8, NULL, 'NO', 'varchar', 50, 50, NULL, NULL, 'latin1', 'latin1_swedish_ci', 'varchar(50)', '', '', 'select,insert,update', ''),
(NULL, 'cs4400_Team_20', 'Tickets', 'UpdateTimes', 9, '0', 'NO', 'int', NULL, NULL, 10, 0, NULL, NULL, 'int(1)', '', '', 'select,insert,update', ''),
(NULL, 'cs4400_Team_20', 'TrainRoute', 'TrainNum', 1, NULL, 'NO', 'varchar', 25, 25, NULL, NULL, 'latin1', 'latin1_swedish_ci', 'varchar(25)', 'PRI', '', 'select,insert,update', ''),
(NULL, 'cs4400_Team_20', 'TrainRoute', 'FstClassPrice', 2, NULL, 'NO', 'decimal', NULL, NULL, 6, 2, NULL, NULL, 'decimal(6,2)', '', '', 'select,insert,update', ''),
(NULL, 'cs4400_Team_20', 'TrainRoute', 'SndClassPrice', 3, NULL, 'NO', 'decimal', NULL, NULL, 6, 2, NULL, NULL, 'decimal(6,2)', '', '', 'select,insert,update', ''),
(NULL, 'cs4400_Team_20', 'User', 'Username', 1, NULL, 'NO', 'varchar', 50, 50, NULL, NULL, 'latin1', 'latin1_swedish_ci', 'varchar(50)', 'PRI', '', 'select,insert,update', ''),
(NULL, 'cs4400_Team_20', 'User', 'Password', 2, NULL, 'NO', 'varchar', 50, 50, NULL, NULL, 'latin1', 'latin1_swedish_ci', 'varchar(50)', '', '', 'select,insert,update', '');

-- --------------------------------------------------------

--
-- Table structure for table `COLUMN_PRIVILEGES`
--

DROP TABLE IF EXISTS `COLUMN_PRIVILEGES`;
CREATE TEMPORARY TABLE `COLUMN_PRIVILEGES` (
  `GRANTEE` varchar(81) NOT NULL DEFAULT '',
  `TABLE_CATALOG` varchar(512) DEFAULT NULL,
  `TABLE_SCHEMA` varchar(64) NOT NULL DEFAULT '',
  `TABLE_NAME` varchar(64) NOT NULL DEFAULT '',
  `COLUMN_NAME` varchar(64) NOT NULL DEFAULT '',
  `PRIVILEGE_TYPE` varchar(64) NOT NULL DEFAULT '',
  `IS_GRANTABLE` varchar(3) NOT NULL DEFAULT ''
) ENGINE=MEMORY DEFAULT CHARSET=utf8;

--
-- Dumping data for table `COLUMN_PRIVILEGES`
--


-- --------------------------------------------------------

--
-- Table structure for table `ENGINES`
--

DROP TABLE IF EXISTS `ENGINES`;
CREATE TEMPORARY TABLE `ENGINES` (
  `ENGINE` varchar(64) NOT NULL DEFAULT '',
  `SUPPORT` varchar(8) NOT NULL DEFAULT '',
  `COMMENT` varchar(80) NOT NULL DEFAULT '',
  `TRANSACTIONS` varchar(3) DEFAULT NULL,
  `XA` varchar(3) DEFAULT NULL,
  `SAVEPOINTS` varchar(3) DEFAULT NULL
) ENGINE=MEMORY DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ENGINES`
--

INSERT INTO `ENGINES` (`ENGINE`, `SUPPORT`, `COMMENT`, `TRANSACTIONS`, `XA`, `SAVEPOINTS`) VALUES
('MRG_MYISAM', 'YES', 'Collection of identical MyISAM tables', 'NO', 'NO', 'NO'),
('CSV', 'YES', 'CSV storage engine', 'NO', 'NO', 'NO'),
('MyISAM', 'DEFAULT', 'Default engine as of MySQL 3.23 with great performance', 'NO', 'NO', 'NO'),
('InnoDB', 'YES', 'Supports transactions, row-level locking, and foreign keys', 'YES', 'YES', 'YES'),
('MEMORY', 'YES', 'Hash based, stored in memory, useful for temporary tables', 'NO', 'NO', 'NO');

-- --------------------------------------------------------

--
-- Table structure for table `EVENTS`
--

DROP TABLE IF EXISTS `EVENTS`;
CREATE TEMPORARY TABLE `EVENTS` (
  `EVENT_CATALOG` varchar(64) DEFAULT NULL,
  `EVENT_SCHEMA` varchar(64) NOT NULL DEFAULT '',
  `EVENT_NAME` varchar(64) NOT NULL DEFAULT '',
  `DEFINER` varchar(77) NOT NULL DEFAULT '',
  `TIME_ZONE` varchar(64) NOT NULL DEFAULT '',
  `EVENT_BODY` varchar(8) NOT NULL DEFAULT '',
  `EVENT_DEFINITION` longtext NOT NULL,
  `EVENT_TYPE` varchar(9) NOT NULL DEFAULT '',
  `EXECUTE_AT` datetime DEFAULT NULL,
  `INTERVAL_VALUE` varchar(256) DEFAULT NULL,
  `INTERVAL_FIELD` varchar(18) DEFAULT NULL,
  `SQL_MODE` varchar(8192) NOT NULL DEFAULT '',
  `STARTS` datetime DEFAULT NULL,
  `ENDS` datetime DEFAULT NULL,
  `STATUS` varchar(18) NOT NULL DEFAULT '',
  `ON_COMPLETION` varchar(12) NOT NULL DEFAULT '',
  `CREATED` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `LAST_ALTERED` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `LAST_EXECUTED` datetime DEFAULT NULL,
  `EVENT_COMMENT` varchar(64) NOT NULL DEFAULT '',
  `ORIGINATOR` bigint(10) NOT NULL DEFAULT '0',
  `CHARACTER_SET_CLIENT` varchar(32) NOT NULL DEFAULT '',
  `COLLATION_CONNECTION` varchar(32) NOT NULL DEFAULT '',
  `DATABASE_COLLATION` varchar(32) NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `EVENTS`
--


-- --------------------------------------------------------

--
-- Table structure for table `FILES`
--

DROP TABLE IF EXISTS `FILES`;
CREATE TEMPORARY TABLE `FILES` (
  `FILE_ID` bigint(4) NOT NULL DEFAULT '0',
  `FILE_NAME` varchar(64) DEFAULT NULL,
  `FILE_TYPE` varchar(20) NOT NULL DEFAULT '',
  `TABLESPACE_NAME` varchar(64) DEFAULT NULL,
  `TABLE_CATALOG` varchar(64) DEFAULT NULL,
  `TABLE_SCHEMA` varchar(64) DEFAULT NULL,
  `TABLE_NAME` varchar(64) DEFAULT NULL,
  `LOGFILE_GROUP_NAME` varchar(64) DEFAULT NULL,
  `LOGFILE_GROUP_NUMBER` bigint(4) DEFAULT NULL,
  `ENGINE` varchar(64) NOT NULL DEFAULT '',
  `FULLTEXT_KEYS` varchar(64) DEFAULT NULL,
  `DELETED_ROWS` bigint(4) DEFAULT NULL,
  `UPDATE_COUNT` bigint(4) DEFAULT NULL,
  `FREE_EXTENTS` bigint(4) DEFAULT NULL,
  `TOTAL_EXTENTS` bigint(4) DEFAULT NULL,
  `EXTENT_SIZE` bigint(4) NOT NULL DEFAULT '0',
  `INITIAL_SIZE` bigint(21) unsigned DEFAULT NULL,
  `MAXIMUM_SIZE` bigint(21) unsigned DEFAULT NULL,
  `AUTOEXTEND_SIZE` bigint(21) unsigned DEFAULT NULL,
  `CREATION_TIME` datetime DEFAULT NULL,
  `LAST_UPDATE_TIME` datetime DEFAULT NULL,
  `LAST_ACCESS_TIME` datetime DEFAULT NULL,
  `RECOVER_TIME` bigint(4) DEFAULT NULL,
  `TRANSACTION_COUNTER` bigint(4) DEFAULT NULL,
  `VERSION` bigint(21) unsigned DEFAULT NULL,
  `ROW_FORMAT` varchar(10) DEFAULT NULL,
  `TABLE_ROWS` bigint(21) unsigned DEFAULT NULL,
  `AVG_ROW_LENGTH` bigint(21) unsigned DEFAULT NULL,
  `DATA_LENGTH` bigint(21) unsigned DEFAULT NULL,
  `MAX_DATA_LENGTH` bigint(21) unsigned DEFAULT NULL,
  `INDEX_LENGTH` bigint(21) unsigned DEFAULT NULL,
  `DATA_FREE` bigint(21) unsigned DEFAULT NULL,
  `CREATE_TIME` datetime DEFAULT NULL,
  `UPDATE_TIME` datetime DEFAULT NULL,
  `CHECK_TIME` datetime DEFAULT NULL,
  `CHECKSUM` bigint(21) unsigned DEFAULT NULL,
  `STATUS` varchar(20) NOT NULL DEFAULT '',
  `EXTRA` varchar(255) DEFAULT NULL
) ENGINE=MEMORY DEFAULT CHARSET=utf8;

--
-- Dumping data for table `FILES`
--


-- --------------------------------------------------------

--
-- Table structure for table `GLOBAL_STATUS`
--

DROP TABLE IF EXISTS `GLOBAL_STATUS`;
CREATE TEMPORARY TABLE `GLOBAL_STATUS` (
  `VARIABLE_NAME` varchar(64) NOT NULL DEFAULT '',
  `VARIABLE_VALUE` varchar(1024) DEFAULT NULL
) ENGINE=MEMORY DEFAULT CHARSET=utf8;

--
-- Dumping data for table `GLOBAL_STATUS`
--

INSERT INTO `GLOBAL_STATUS` (`VARIABLE_NAME`, `VARIABLE_VALUE`) VALUES
('ABORTED_CLIENTS', '48260'),
('ABORTED_CONNECTS', '22180'),
('BINLOG_CACHE_DISK_USE', '0'),
('BINLOG_CACHE_USE', '0'),
('BYTES_RECEIVED', '455143483'),
('BYTES_SENT', '2940591786'),
('COM_ADMIN_COMMANDS', '1522'),
('COM_ASSIGN_TO_KEYCACHE', '0'),
('COM_ALTER_DB', '3'),
('COM_ALTER_DB_UPGRADE', '0'),
('COM_ALTER_EVENT', '0'),
('COM_ALTER_FUNCTION', '0'),
('COM_ALTER_PROCEDURE', '0'),
('COM_ALTER_SERVER', '0'),
('COM_ALTER_TABLE', '2632'),
('COM_ALTER_TABLESPACE', '0'),
('COM_ANALYZE', '15'),
('COM_BACKUP_TABLE', '0'),
('COM_BEGIN', '79'),
('COM_BINLOG', '0'),
('COM_CALL_PROCEDURE', '0'),
('COM_CHANGE_DB', '425875'),
('COM_CHANGE_MASTER', '0'),
('COM_CHECK', '21'),
('COM_CHECKSUM', '0'),
('COM_COMMIT', '14149'),
('COM_CREATE_DB', '264'),
('COM_CREATE_EVENT', '0'),
('COM_CREATE_FUNCTION', '0'),
('COM_CREATE_INDEX', '0'),
('COM_CREATE_PROCEDURE', '0'),
('COM_CREATE_SERVER', '0'),
('COM_CREATE_TABLE', '3275'),
('COM_CREATE_TRIGGER', '0'),
('COM_CREATE_UDF', '0'),
('COM_CREATE_USER', '1'),
('COM_CREATE_VIEW', '1093'),
('COM_DEALLOC_SQL', '49'),
('COM_DELETE', '8361'),
('COM_DELETE_MULTI', '25'),
('COM_DO', '0'),
('COM_DROP_DB', '2'),
('COM_DROP_EVENT', '0'),
('COM_DROP_FUNCTION', '0'),
('COM_DROP_INDEX', '0'),
('COM_DROP_PROCEDURE', '0'),
('COM_DROP_SERVER', '0'),
('COM_DROP_TABLE', '2161'),
('COM_DROP_TRIGGER', '0'),
('COM_DROP_USER', '0'),
('COM_DROP_VIEW', '395'),
('COM_EMPTY_QUERY', '0'),
('COM_EXECUTE_SQL', '49'),
('COM_FLUSH', '3'),
('COM_GRANT', '93'),
('COM_HA_CLOSE', '0'),
('COM_HA_OPEN', '0'),
('COM_HA_READ', '0'),
('COM_HELP', '0'),
('COM_INSERT', '54381'),
('COM_INSERT_SELECT', '67'),
('COM_INSTALL_PLUGIN', '0'),
('COM_KILL', '13'),
('COM_LOAD', '52'),
('COM_LOAD_MASTER_DATA', '0'),
('COM_LOAD_MASTER_TABLE', '0'),
('COM_LOCK_TABLES', '7'),
('COM_OPTIMIZE', '9'),
('COM_PRELOAD_KEYS', '0'),
('COM_PREPARE_SQL', '49'),
('COM_PURGE', '0'),
('COM_PURGE_BEFORE_DATE', '0'),
('COM_RELEASE_SAVEPOINT', '0'),
('COM_RENAME_TABLE', '46'),
('COM_RENAME_USER', '0'),
('COM_REPAIR', '24'),
('COM_REPLACE', '638'),
('COM_REPLACE_SELECT', '0'),
('COM_RESET', '0'),
('COM_RESTORE_TABLE', '0'),
('COM_REVOKE', '0'),
('COM_REVOKE_ALL', '0'),
('COM_ROLLBACK', '38'),
('COM_ROLLBACK_TO_SAVEPOINT', '0'),
('COM_SAVEPOINT', '0'),
('COM_SELECT', '948934'),
('COM_SET_OPTION', '1011932'),
('COM_SHOW_AUTHORS', '0'),
('COM_SHOW_BINLOG_EVENTS', '0'),
('COM_SHOW_BINLOGS', '3359'),
('COM_SHOW_CHARSETS', '178222'),
('COM_SHOW_COLLATIONS', '179250'),
('COM_SHOW_COLUMN_TYPES', '0'),
('COM_SHOW_CONTRIBUTORS', '0'),
('COM_SHOW_CREATE_DB', '0'),
('COM_SHOW_CREATE_EVENT', '0'),
('COM_SHOW_CREATE_FUNC', '0'),
('COM_SHOW_CREATE_PROC', '0'),
('COM_SHOW_CREATE_TABLE', '59436'),
('COM_SHOW_CREATE_TRIGGER', '0'),
('COM_SHOW_DATABASES', '179143'),
('COM_SHOW_ENGINE_LOGS', '0'),
('COM_SHOW_ENGINE_MUTEX', '0'),
('COM_SHOW_ENGINE_STATUS', '5'),
('COM_SHOW_EVENTS', '1'),
('COM_SHOW_ERRORS', '1'),
('COM_SHOW_FIELDS', '211808'),
('COM_SHOW_FUNCTION_STATUS', '2464'),
('COM_SHOW_GRANTS', '69162'),
('COM_SHOW_KEYS', '87197'),
('COM_SHOW_MASTER_STATUS', '0'),
('COM_SHOW_NEW_MASTER', '0'),
('COM_SHOW_OPEN_TABLES', '0'),
('COM_SHOW_PLUGINS', '9'),
('COM_SHOW_PRIVILEGES', '0'),
('COM_SHOW_PROCEDURE_STATUS', '2464'),
('COM_SHOW_PROCESSLIST', '41'),
('COM_SHOW_PROFILE', '59'),
('COM_SHOW_PROFILES', '0'),
('COM_SHOW_SLAVE_HOSTS', '0'),
('COM_SHOW_SLAVE_STATUS', '5'),
('COM_SHOW_STATUS', '4285'),
('COM_SHOW_STORAGE_ENGINES', '1441'),
('COM_SHOW_TABLE_STATUS', '558068'),
('COM_SHOW_TABLES', '202549'),
('COM_SHOW_TRIGGERS', '23514'),
('COM_SHOW_VARIABLES', '1097656'),
('COM_SHOW_WARNINGS', '10994'),
('COM_SLAVE_START', '0'),
('COM_SLAVE_STOP', '0'),
('COM_STMT_CLOSE', '1086'),
('COM_STMT_EXECUTE', '1086'),
('COM_STMT_FETCH', '0'),
('COM_STMT_PREPARE', '1091'),
('COM_STMT_REPREPARE', '0'),
('COM_STMT_RESET', '0'),
('COM_STMT_SEND_LONG_DATA', '0'),
('COM_TRUNCATE', '101'),
('COM_UNINSTALL_PLUGIN', '0'),
('COM_UNLOCK_TABLES', '4'),
('COM_UPDATE', '10229'),
('COM_UPDATE_MULTI', '169'),
('COM_XA_COMMIT', '0'),
('COM_XA_END', '0'),
('COM_XA_PREPARE', '0'),
('COM_XA_RECOVER', '0'),
('COM_XA_ROLLBACK', '0'),
('COM_XA_START', '0'),
('COMPRESSION', 'OFF'),
('CONNECTIONS', '301787'),
('CREATED_TMP_DISK_TABLES', '325589'),
('CREATED_TMP_FILES', '5'),
('CREATED_TMP_TABLES', '3031455'),
('DELAYED_ERRORS', '0'),
('DELAYED_INSERT_THREADS', '0'),
('DELAYED_WRITES', '0'),
('FLUSH_COMMANDS', '1'),
('HANDLER_COMMIT', '124378'),
('HANDLER_DELETE', '8360'),
('HANDLER_DISCOVER', '0'),
('HANDLER_PREPARE', '0'),
('HANDLER_READ_FIRST', '126341'),
('HANDLER_READ_KEY', '1074259'),
('HANDLER_READ_NEXT', '1937911'),
('HANDLER_READ_PREV', '1582'),
('HANDLER_READ_RND', '99324'),
('HANDLER_READ_RND_NEXT', '42291123'),
('HANDLER_ROLLBACK', '17959'),
('HANDLER_SAVEPOINT', '0'),
('HANDLER_SAVEPOINT_ROLLBACK', '0'),
('HANDLER_UPDATE', '274817'),
('HANDLER_WRITE', '37815332'),
('INNODB_BUFFER_POOL_PAGES_DATA', '506'),
('INNODB_BUFFER_POOL_PAGES_DIRTY', '0'),
('INNODB_BUFFER_POOL_PAGES_FLUSHED', '54631'),
('INNODB_BUFFER_POOL_PAGES_FREE', '0'),
('INNODB_BUFFER_POOL_PAGES_MISC', '6'),
('INNODB_BUFFER_POOL_PAGES_TOTAL', '512'),
('INNODB_BUFFER_POOL_READ_AHEAD_RND', '19'),
('INNODB_BUFFER_POOL_READ_AHEAD_SEQ', '0'),
('INNODB_BUFFER_POOL_READ_REQUESTS', '16573867'),
('INNODB_BUFFER_POOL_READS', '2102'),
('INNODB_BUFFER_POOL_WAIT_FREE', '0'),
('INNODB_BUFFER_POOL_WRITE_REQUESTS', '565058'),
('INNODB_DATA_FSYNCS', '49529'),
('INNODB_DATA_PENDING_FSYNCS', '0'),
('INNODB_DATA_PENDING_READS', '0'),
('INNODB_DATA_PENDING_WRITES', '0'),
('INNODB_DATA_READ', '37949440'),
('INNODB_DATA_READS', '2159'),
('INNODB_DATA_WRITES', '87545'),
('INNODB_DATA_WRITTEN', '1832067072'),
('INNODB_DBLWR_PAGES_WRITTEN', '54631'),
('INNODB_DBLWR_WRITES', '6889'),
('INNODB_LOG_WAITS', '0'),
('INNODB_LOG_WRITE_REQUESTS', '51738'),
('INNODB_LOG_WRITES', '29468'),
('INNODB_OS_LOG_FSYNCS', '35750'),
('INNODB_OS_LOG_PENDING_FSYNCS', '0'),
('INNODB_OS_LOG_PENDING_WRITES', '0'),
('INNODB_OS_LOG_WRITTEN', '38699520'),
('INNODB_PAGE_SIZE', '16384'),
('INNODB_PAGES_CREATED', '937'),
('INNODB_PAGES_READ', '2183'),
('INNODB_PAGES_WRITTEN', '54631'),
('INNODB_ROW_LOCK_CURRENT_WAITS', '0'),
('INNODB_ROW_LOCK_TIME', '1554697'),
('INNODB_ROW_LOCK_TIME_AVG', '44419'),
('INNODB_ROW_LOCK_TIME_MAX', '51667'),
('INNODB_ROW_LOCK_WAITS', '35'),
('INNODB_ROWS_DELETED', '1790'),
('INNODB_ROWS_INSERTED', '34254'),
('INNODB_ROWS_READ', '1812641'),
('INNODB_ROWS_UPDATED', '8895'),
('KEY_BLOCKS_NOT_FLUSHED', '0'),
('KEY_BLOCKS_UNUSED', '6673'),
('KEY_BLOCKS_USED', '172'),
('KEY_READ_REQUESTS', '960666'),
('KEY_READS', '47160'),
('KEY_WRITE_REQUESTS', '168761'),
('KEY_WRITES', '127212'),
('LAST_QUERY_COST', '0.000000'),
('MAX_USED_CONNECTIONS', '104'),
('NOT_FLUSHED_DELAYED_ROWS', '0'),
('OPEN_FILES', '69'),
('OPEN_STREAMS', '0'),
('OPEN_TABLE_DEFINITIONS', '256'),
('OPEN_TABLES', '64'),
('OPENED_FILES', '1746120'),
('OPENED_TABLE_DEFINITIONS', '78570'),
('OPENED_TABLES', '168650'),
('PREPARED_STMT_COUNT', '0'),
('QCACHE_FREE_BLOCKS', '0'),
('QCACHE_FREE_MEMORY', '0'),
('QCACHE_HITS', '0'),
('QCACHE_INSERTS', '0'),
('QCACHE_LOWMEM_PRUNES', '0'),
('QCACHE_NOT_CACHED', '0'),
('QCACHE_QUERIES_IN_CACHE', '0'),
('QCACHE_TOTAL_BLOCKS', '0'),
('QUERIES', '6095650'),
('QUESTIONS', '6093569'),
('RPL_STATUS', 'NULL'),
('SELECT_FULL_JOIN', '9897'),
('SELECT_FULL_RANGE_JOIN', '0'),
('SELECT_RANGE', '3149'),
('SELECT_RANGE_CHECK', '253'),
('SELECT_SCAN', '2983955'),
('SLAVE_OPEN_TEMP_TABLES', '0'),
('SLAVE_RETRIED_TRANSACTIONS', '0'),
('SLAVE_RUNNING', 'OFF'),
('SLOW_LAUNCH_THREADS', '0'),
('SLOW_QUERIES', '25'),
('SORT_MERGE_PASSES', '0'),
('SORT_RANGE', '2719'),
('SORT_ROWS', '218154'),
('SORT_SCAN', '16985'),
('SSL_ACCEPT_RENEGOTIATES', '0'),
('SSL_ACCEPTS', '0'),
('SSL_CALLBACK_CACHE_HITS', '0'),
('SSL_CIPHER', ''),
('SSL_CIPHER_LIST', ''),
('SSL_CLIENT_CONNECTS', '0'),
('SSL_CONNECT_RENEGOTIATES', '0'),
('SSL_CTX_VERIFY_DEPTH', '0'),
('SSL_CTX_VERIFY_MODE', '0'),
('SSL_DEFAULT_TIMEOUT', '0'),
('SSL_FINISHED_ACCEPTS', '0'),
('SSL_FINISHED_CONNECTS', '0'),
('SSL_SESSION_CACHE_HITS', '0'),
('SSL_SESSION_CACHE_MISSES', '0'),
('SSL_SESSION_CACHE_MODE', 'NONE'),
('SSL_SESSION_CACHE_OVERFLOWS', '0'),
('SSL_SESSION_CACHE_SIZE', '0'),
('SSL_SESSION_CACHE_TIMEOUTS', '0'),
('SSL_SESSIONS_REUSED', '0'),
('SSL_USED_SESSION_CACHE_ENTRIES', '0'),
('SSL_VERIFY_DEPTH', '0'),
('SSL_VERIFY_MODE', '0'),
('SSL_VERSION', ''),
('TABLE_LOCKS_IMMEDIATE', '523196'),
('TABLE_LOCKS_WAITED', '1'),
('TC_LOG_MAX_PAGES_USED', '0'),
('TC_LOG_PAGE_SIZE', '0'),
('TC_LOG_PAGE_WAITS', '0'),
('THREADS_CACHED', '0'),
('THREADS_CONNECTED', '98'),
('THREADS_CREATED', '301786'),
('THREADS_RUNNING', '1'),
('UPTIME', '7849471'),
('UPTIME_SINCE_FLUSH_STATUS', '7849471');

-- --------------------------------------------------------

--
-- Table structure for table `GLOBAL_VARIABLES`
--

DROP TABLE IF EXISTS `GLOBAL_VARIABLES`;
CREATE TEMPORARY TABLE `GLOBAL_VARIABLES` (
  `VARIABLE_NAME` varchar(64) NOT NULL DEFAULT '',
  `VARIABLE_VALUE` varchar(1024) DEFAULT NULL
) ENGINE=MEMORY DEFAULT CHARSET=utf8;

--
-- Dumping data for table `GLOBAL_VARIABLES`
--

INSERT INTO `GLOBAL_VARIABLES` (`VARIABLE_NAME`, `VARIABLE_VALUE`) VALUES
('MAX_PREPARED_STMT_COUNT', '16382'),
('CHARACTER_SETS_DIR', '/usr/share/mysql/charsets/'),
('HAVE_CRYPT', 'YES'),
('CONNECT_TIMEOUT', '10'),
('MYISAM_REPAIR_THREADS', '1'),
('AUTOMATIC_SP_PRIVILEGES', 'ON'),
('MAX_CONNECT_ERRORS', '10'),
('BINLOG_CACHE_SIZE', '32768'),
('INNODB_CONCURRENCY_TICKETS', '500'),
('BACK_LOG', '50'),
('MAX_CONNECTIONS', '750'),
('STORAGE_ENGINE', 'MyISAM'),
('DELAYED_INSERT_TIMEOUT', '300'),
('MAX_LENGTH_FOR_SORT_DATA', '1024'),
('LOG_BIN_TRUST_ROUTINE_CREATORS', 'OFF'),
('CHARACTER_SET_CONNECTION', 'latin1'),
('SSL_CIPHER', ''),
('CHARACTER_SET_RESULTS', 'latin1'),
('BASEDIR', '/usr/'),
('LARGE_PAGES', 'OFF'),
('UPDATABLE_VIEWS_WITH_LIMIT', 'YES'),
('TABLE_DEFINITION_CACHE', '256'),
('SLOW_LAUNCH_TIME', '2'),
('QUERY_ALLOC_BLOCK_SIZE', '8192'),
('INNODB_LOCK_WAIT_TIMEOUT', '50'),
('COMPLETION_TYPE', '0'),
('RELAY_LOG_INDEX', ''),
('COLLATION_SERVER', 'latin1_swedish_ci'),
('SQL_QUOTE_SHOW_CREATE', 'ON'),
('EVENT_SCHEDULER', 'OFF'),
('SQL_LOG_UPDATE', 'ON'),
('COLLATION_DATABASE', 'latin1_swedish_ci'),
('INNODB_USE_LEGACY_CARDINALITY_ALGORITHM', 'ON'),
('FT_MAX_WORD_LEN', '84'),
('LOCKED_IN_MEMORY', 'OFF'),
('CONCURRENT_INSERT', '1'),
('MYISAM_RECOVER_OPTIONS', 'OFF'),
('NET_WRITE_TIMEOUT', '60'),
('REPORT_HOST', ''),
('AUTO_INCREMENT_OFFSET', '1'),
('SSL_KEY', ''),
('FLUSH', 'OFF'),
('CHARACTER_SET_DATABASE', 'latin1'),
('DELAYED_INSERT_LIMIT', '100'),
('SLAVE_SKIP_ERRORS', 'OFF'),
('FT_QUERY_EXPANSION_LIMIT', '20'),
('INSERT_ID', '0'),
('SQL_LOW_PRIORITY_UPDATES', 'OFF'),
('RELAY_LOG_PURGE', 'ON'),
('LANGUAGE', '/usr/share/mysql/english/'),
('SKIP_SHOW_DATABASE', 'OFF'),
('KEY_CACHE_AGE_THRESHOLD', '300'),
('GROUP_CONCAT_MAX_LEN', '1024'),
('JOIN_BUFFER_SIZE', '131072'),
('INNODB_LOG_BUFFER_SIZE', '1048576'),
('LOG', 'OFF'),
('VERSION_COMPILE_MACHINE', 'x86_64'),
('READ_BUFFER_SIZE', '131072'),
('INNODB_MAX_PURGE_LAG', '0'),
('DELAYED_QUEUE_SIZE', '1000'),
('TRANSACTION_PREALLOC_SIZE', '4096'),
('INTERACTIVE_TIMEOUT', '28800'),
('VERSION_COMPILE_OS', 'redhat-linux-gnu'),
('WAIT_TIMEOUT', '28800'),
('SQL_NOTES', 'ON'),
('TABLE_OPEN_CACHE', '64'),
('LOW_PRIORITY_UPDATES', 'OFF'),
('LARGE_PAGE_SIZE', '0'),
('REPORT_PASSWORD', ''),
('INIT_SLAVE', ''),
('MAX_INSERT_DELAYED_THREADS', '20'),
('MAX_BINLOG_SIZE', '1073741824'),
('HAVE_COMPRESS', 'YES'),
('MAX_ERROR_COUNT', '64'),
('TRANSACTION_ALLOC_BLOCK_SIZE', '8192'),
('FT_MIN_WORD_LEN', '4'),
('THREAD_CACHE_SIZE', '0'),
('LOG_WARNINGS', '1'),
('INNODB_DOUBLEWRITE', 'ON'),
('SQL_LOG_OFF', 'OFF'),
('PSEUDO_THREAD_ID', '0'),
('MAX_LONG_DATA_SIZE', '16777216'),
('DEFAULT_WEEK_FORMAT', '0'),
('INNODB_FLUSH_METHOD', ''),
('LOG_OUTPUT', 'FILE'),
('LOWER_CASE_TABLE_NAMES', '0'),
('MAX_RELAY_LOG_SIZE', '0'),
('MYISAM_STATS_METHOD', 'nulls_unequal'),
('PROTOCOL_VERSION', '10'),
('NET_RETRY_COUNT', '10'),
('HAVE_SYMLINK', 'YES'),
('MAX_SORT_LENGTH', '1024'),
('TIME_ZONE', 'SYSTEM'),
('MAX_HEAP_TABLE_SIZE', '16777216'),
('INNODB_TABLE_LOCKS', 'ON'),
('FT_BOOLEAN_SYNTAX', '+ -><()~*:""&|'),
('INNODB_AUTOEXTEND_INCREMENT', '8'),
('LOG_QUERIES_NOT_USING_INDEXES', 'OFF'),
('MYISAM_DATA_POINTER_SIZE', '6'),
('NET_BUFFER_LENGTH', '16384'),
('INNODB_THREAD_SLEEP_DELAY', '10000'),
('FT_STOPWORD_FILE', '(built-in)'),
('SQL_AUTO_IS_NULL', 'ON'),
('DELAY_KEY_WRITE', 'ON'),
('SLAVE_TRANSACTION_RETRIES', '10'),
('MULTI_RANGE_COUNT', '256'),
('LOG_ERROR', '/var/log/mysqld.log'),
('LONG_QUERY_TIME', '10.000000'),
('GENERAL_LOG', 'OFF'),
('BULK_INSERT_BUFFER_SIZE', '8388608'),
('TABLE_TYPE', 'MyISAM'),
('SLAVE_MAX_ALLOWED_PACKET', '1073741824'),
('QUERY_CACHE_MIN_RES_UNIT', '4096'),
('MYISAM_USE_MMAP', 'OFF'),
('INNODB_STATS_ON_METADATA', 'ON'),
('MAX_BINLOG_CACHE_SIZE', '18446744073709547520'),
('INNODB_ROLLBACK_ON_TIMEOUT', 'OFF'),
('QUERY_CACHE_TYPE', 'ON'),
('PROFILING_HISTORY_SIZE', '15'),
('CHARACTER_SET_FILESYSTEM', 'binary'),
('INNODB_ADDITIONAL_MEM_POOL_SIZE', '1048576'),
('TX_ISOLATION', 'REPEATABLE-READ'),
('READ_RND_BUFFER_SIZE', '262144'),
('THREAD_HANDLING', 'one-thread-per-connection'),
('SECURE_AUTH', 'OFF'),
('BINLOG_DIRECT_NON_TRANSACTIONAL_UPDATES', 'OFF'),
('BIG_TABLES', 'OFF'),
('FLUSH_TIME', '0'),
('SQL_SELECT_LIMIT', '18446744073709551615'),
('HAVE_INNODB', 'YES'),
('DATE_FORMAT', '%Y-%m-%d'),
('OLD_PASSWORDS', 'OFF'),
('READ_ONLY', 'OFF'),
('QUERY_PREALLOC_SIZE', '8192'),
('RAND_SEED1', ''),
('SLOW_QUERY_LOG_FILE', '/var/run/mysqld/mysqld-slow.log'),
('INNODB_DATA_FILE_PATH', 'ibdata1:10M:autoextend'),
('MAX_SEEKS_FOR_KEY', '18446744073709551615'),
('QUERY_CACHE_LIMIT', '1048576'),
('SYSTEM_TIME_ZONE', 'EST'),
('PROFILING', 'OFF'),
('SSL_CERT', ''),
('QUERY_CACHE_SIZE', '0'),
('MYISAM_MAX_SORT_FILE_SIZE', '9223372036853727232'),
('KEY_CACHE_DIVISION_LIMIT', '100'),
('THREAD_STACK', '262144'),
('GENERAL_LOG_FILE', '/var/run/mysqld/mysqld.log'),
('OPEN_FILES_LIMIT', '3750'),
('MYISAM_SORT_BUFFER_SIZE', '8388608'),
('SKIP_NAME_RESOLVE', 'OFF'),
('AUTO_INCREMENT_INCREMENT', '1'),
('LAST_INSERT_ID', '0'),
('TMPDIR', '/tmp'),
('PID_FILE', '/var/run/mysqld/mysqld.pid'),
('EXPIRE_LOGS_DAYS', '0'),
('MAX_TMP_TABLES', '32'),
('HAVE_PARTITIONING', 'YES'),
('MIN_EXAMINED_ROW_LIMIT', '0'),
('FOREIGN_KEY_CHECKS', 'ON'),
('LARGE_FILES_SUPPORT', 'ON'),
('RELAY_LOG_INFO_FILE', 'relay-log.info'),
('SSL_CAPATH', ''),
('INNODB_AUTOINC_LOCK_MODE', '1'),
('VERSION_COMMENT', 'Source distribution'),
('INNODB_COMMIT_CONCURRENCY', '0'),
('OPTIMIZER_SWITCH', 'index_merge=on,index_merge_union=on,index_merge_sort_union=on,index_merge_intersection=on'),
('INNODB_MIRRORED_LOG_GROUPS', '1'),
('OPTIMIZER_PRUNE_LEVEL', '1'),
('UNIQUE_CHECKS', 'ON'),
('QUERY_CACHE_WLOCK_INVALIDATE', 'OFF'),
('VERSION', '5.1.73'),
('MAX_WRITE_LOCK_COUNT', '18446744073709551615'),
('INNODB_SUPPORT_XA', 'ON'),
('TIMED_MUTEXES', 'OFF'),
('INNODB_SYNC_SPIN_LOOPS', '20'),
('INIT_FILE', ''),
('COLLATION_CONNECTION', 'latin1_swedish_ci'),
('LC_TIME_NAMES', 'en_US'),
('HAVE_QUERY_CACHE', 'YES'),
('SERVER_ID', '0'),
('INNODB_ADAPTIVE_HASH_INDEX', 'ON'),
('SKIP_NETWORKING', 'OFF'),
('RPL_RECOVERY_RANK', '0'),
('CHARACTER_SET_SYSTEM', 'utf8'),
('DIV_PRECISION_INCREMENT', '4'),
('INIT_CONNECT', ''),
('DATADIR', '/var/lib/mysql/'),
('OPTIMIZER_SEARCH_DEPTH', '62'),
('INNODB_DATA_HOME_DIR', ''),
('AUTOCOMMIT', 'ON'),
('SKIP_EXTERNAL_LOCKING', 'ON'),
('KEY_CACHE_BLOCK_SIZE', '1024'),
('SQL_SLAVE_SKIP_COUNTER', ''),
('SQL_BIG_TABLES', 'OFF'),
('TIME_FORMAT', '%H:%i:%s'),
('TMP_TABLE_SIZE', '16777216'),
('INNODB_FORCE_RECOVERY', '0'),
('TABLE_LOCK_WAIT_TIMEOUT', '50'),
('INNODB_LOG_FILES_IN_GROUP', '2'),
('CHARACTER_SET_SERVER', 'latin1'),
('ERROR_COUNT', '0'),
('HOSTNAME', 'essay'),
('HAVE_DYNAMIC_LOADING', 'YES'),
('SQL_BUFFER_RESULT', 'OFF'),
('SYNC_BINLOG', '0'),
('LOG_BIN', 'OFF'),
('RELAY_LOG_SPACE_LIMIT', '0'),
('SQL_MODE', ''),
('INNODB_OPEN_FILES', '300'),
('MAX_USER_CONNECTIONS', '25'),
('OLD', 'OFF'),
('SLAVE_EXEC_MODE', 'STRICT'),
('INNODB_MAX_DIRTY_PAGES_PCT', '90'),
('SQL_MAX_JOIN_SIZE', '18446744073709551615'),
('HAVE_COMMUNITY_FEATURES', 'YES'),
('NEW', 'OFF'),
('KEY_BUFFER_SIZE', '8384512'),
('SECURE_FILE_PRIV', ''),
('HAVE_NDBCLUSTER', 'NO'),
('KEEP_FILES_ON_CREATE', 'OFF'),
('REPORT_PORT', '3306'),
('REPORT_USER', ''),
('INNODB_STATS_METHOD', 'nulls_equal'),
('ENGINE_CONDITION_PUSHDOWN', 'ON'),
('INNODB_FAST_SHUTDOWN', '1'),
('SQL_LOG_BIN', 'ON'),
('SSL_CA', ''),
('LOWER_CASE_FILE_SYSTEM', 'OFF'),
('INNODB_THREAD_CONCURRENCY', '8'),
('HAVE_CSV', 'YES'),
('SLAVE_NET_TIMEOUT', '3600'),
('SQL_SAFE_UPDATES', 'OFF'),
('INNODB_BUFFER_POOL_SIZE', '8388608'),
('PRELOAD_BUFFER_SIZE', '32768'),
('LOCAL_INFILE', 'ON'),
('SLAVE_COMPRESSED_PROTOCOL', 'OFF'),
('HAVE_RTREE_KEYS', 'YES'),
('HAVE_GEOMETRY', 'YES'),
('BINLOG_FORMAT', 'STATEMENT'),
('MAX_SP_RECURSION_DEPTH', '0'),
('OLD_ALTER_TABLE', 'OFF'),
('RELAY_LOG', ''),
('MYISAM_MMAP_SIZE', '18446744073709551615'),
('PLUGIN_DIR', '/usr/lib64/mysql/plugin'),
('LOG_SLOW_QUERIES', 'OFF'),
('IGNORE_BUILTIN_INNODB', 'OFF'),
('TIMESTAMP', '1461522044'),
('NET_READ_TIMEOUT', '30'),
('MAX_DELAYED_THREADS', '20'),
('SYNC_FRM', 'ON'),
('DATETIME_FORMAT', '%Y-%m-%d %H:%i:%s'),
('SLOW_QUERY_LOG', 'OFF'),
('INNODB_FLUSH_LOG_AT_TRX_COMMIT', '1'),
('WARNING_COUNT', '0'),
('INNODB_FILE_IO_THREADS', '4'),
('MAX_ALLOWED_PACKET', '16777216'),
('LICENSE', 'GPL'),
('SQL_BIG_SELECTS', 'ON'),
('RANGE_ALLOC_BLOCK_SIZE', '4096'),
('INNODB_CHECKSUMS', 'ON'),
('PORT', '3306'),
('INNODB_LOCKS_UNSAFE_FOR_BINLOG', 'OFF'),
('HAVE_SSL', 'DISABLED'),
('INNODB_LOG_FILE_SIZE', '5242880'),
('LOG_BIN_TRUST_FUNCTION_CREATORS', 'OFF'),
('LOG_SLAVE_UPDATES', 'OFF'),
('MAX_JOIN_SIZE', '18446744073709551615'),
('SORT_BUFFER_SIZE', '2097144'),
('HAVE_OPENSSL', 'DISABLED'),
('INNODB_FILE_PER_TABLE', 'OFF'),
('INNODB_LOG_GROUP_HOME_DIR', './'),
('SOCKET', '/var/lib/mysql/mysql.sock'),
('CHARACTER_SET_CLIENT', 'latin1'),
('RAND_SEED2', ''),
('IDENTITY', '0'),
('SQL_WARNINGS', 'OFF'),
('SLAVE_LOAD_TMPDIR', '/tmp');

-- --------------------------------------------------------

--
-- Table structure for table `KEY_COLUMN_USAGE`
--

DROP TABLE IF EXISTS `KEY_COLUMN_USAGE`;
CREATE TEMPORARY TABLE `KEY_COLUMN_USAGE` (
  `CONSTRAINT_CATALOG` varchar(512) DEFAULT NULL,
  `CONSTRAINT_SCHEMA` varchar(64) NOT NULL DEFAULT '',
  `CONSTRAINT_NAME` varchar(64) NOT NULL DEFAULT '',
  `TABLE_CATALOG` varchar(512) DEFAULT NULL,
  `TABLE_SCHEMA` varchar(64) NOT NULL DEFAULT '',
  `TABLE_NAME` varchar(64) NOT NULL DEFAULT '',
  `COLUMN_NAME` varchar(64) NOT NULL DEFAULT '',
  `ORDINAL_POSITION` bigint(10) NOT NULL DEFAULT '0',
  `POSITION_IN_UNIQUE_CONSTRAINT` bigint(10) DEFAULT NULL,
  `REFERENCED_TABLE_SCHEMA` varchar(64) DEFAULT NULL,
  `REFERENCED_TABLE_NAME` varchar(64) DEFAULT NULL,
  `REFERENCED_COLUMN_NAME` varchar(64) DEFAULT NULL
) ENGINE=MEMORY DEFAULT CHARSET=utf8;

--
-- Dumping data for table `KEY_COLUMN_USAGE`
--

INSERT INTO `KEY_COLUMN_USAGE` (`CONSTRAINT_CATALOG`, `CONSTRAINT_SCHEMA`, `CONSTRAINT_NAME`, `TABLE_CATALOG`, `TABLE_SCHEMA`, `TABLE_NAME`, `COLUMN_NAME`, `ORDINAL_POSITION`, `POSITION_IN_UNIQUE_CONSTRAINT`, `REFERENCED_TABLE_SCHEMA`, `REFERENCED_TABLE_NAME`, `REFERENCED_COLUMN_NAME`) VALUES
(NULL, 'cs4400_Team_20', 'PRIMARY', NULL, 'cs4400_Team_20', 'Customer', 'Username', 1, NULL, NULL, NULL, NULL),
(NULL, 'cs4400_Team_20', 'Email', NULL, 'cs4400_Team_20', 'Customer', 'Email', 1, NULL, NULL, NULL, NULL),
(NULL, 'cs4400_Team_20', 'PRIMARY', NULL, 'cs4400_Team_20', 'Manager', 'Username', 1, NULL, NULL, NULL, NULL),
(NULL, 'cs4400_Team_20', 'PRIMARY', NULL, 'cs4400_Team_20', 'PaymentInfo', 'CardNum', 1, NULL, NULL, NULL, NULL),
(NULL, 'cs4400_Team_20', 'PRIMARY', NULL, 'cs4400_Team_20', 'Reservation', 'ReserveID', 1, NULL, NULL, NULL, NULL),
(NULL, 'cs4400_Team_20', 'PRIMARY', NULL, 'cs4400_Team_20', 'Reserve', 'ReserveID', 1, NULL, NULL, NULL, NULL),
(NULL, 'cs4400_Team_20', 'PRIMARY', NULL, 'cs4400_Team_20', 'Reserve', 'TrainNum', 2, NULL, NULL, NULL, NULL),
(NULL, 'cs4400_Team_20', 'PRIMARY', NULL, 'cs4400_Team_20', 'Review', 'ReviewNum', 1, NULL, NULL, NULL, NULL),
(NULL, 'cs4400_Team_20', 'PRIMARY', NULL, 'cs4400_Team_20', 'Station', 'StationName', 1, NULL, NULL, NULL, NULL),
(NULL, 'cs4400_Team_20', 'PRIMARY', NULL, 'cs4400_Team_20', 'Stop', 'TrainNum', 1, NULL, NULL, NULL, NULL),
(NULL, 'cs4400_Team_20', 'PRIMARY', NULL, 'cs4400_Team_20', 'Stop', 'StationName', 2, NULL, NULL, NULL, NULL),
(NULL, 'cs4400_Team_20', 'PRIMARY', NULL, 'cs4400_Team_20', 'SystemInfo', 'MaxNumOfBaggage', 1, NULL, NULL, NULL, NULL),
(NULL, 'cs4400_Team_20', 'PRIMARY', NULL, 'cs4400_Team_20', 'TrainRoute', 'TrainNum', 1, NULL, NULL, NULL, NULL),
(NULL, 'cs4400_Team_20', 'PRIMARY', NULL, 'cs4400_Team_20', 'User', 'Username', 1, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `PARTITIONS`
--

DROP TABLE IF EXISTS `PARTITIONS`;
CREATE TEMPORARY TABLE `PARTITIONS` (
  `TABLE_CATALOG` varchar(512) DEFAULT NULL,
  `TABLE_SCHEMA` varchar(64) NOT NULL DEFAULT '',
  `TABLE_NAME` varchar(64) NOT NULL DEFAULT '',
  `PARTITION_NAME` varchar(64) DEFAULT NULL,
  `SUBPARTITION_NAME` varchar(64) DEFAULT NULL,
  `PARTITION_ORDINAL_POSITION` bigint(21) unsigned DEFAULT NULL,
  `SUBPARTITION_ORDINAL_POSITION` bigint(21) unsigned DEFAULT NULL,
  `PARTITION_METHOD` varchar(12) DEFAULT NULL,
  `SUBPARTITION_METHOD` varchar(12) DEFAULT NULL,
  `PARTITION_EXPRESSION` longtext,
  `SUBPARTITION_EXPRESSION` longtext,
  `PARTITION_DESCRIPTION` longtext,
  `TABLE_ROWS` bigint(21) unsigned NOT NULL DEFAULT '0',
  `AVG_ROW_LENGTH` bigint(21) unsigned NOT NULL DEFAULT '0',
  `DATA_LENGTH` bigint(21) unsigned NOT NULL DEFAULT '0',
  `MAX_DATA_LENGTH` bigint(21) unsigned DEFAULT NULL,
  `INDEX_LENGTH` bigint(21) unsigned NOT NULL DEFAULT '0',
  `DATA_FREE` bigint(21) unsigned NOT NULL DEFAULT '0',
  `CREATE_TIME` datetime DEFAULT NULL,
  `UPDATE_TIME` datetime DEFAULT NULL,
  `CHECK_TIME` datetime DEFAULT NULL,
  `CHECKSUM` bigint(21) unsigned DEFAULT NULL,
  `PARTITION_COMMENT` varchar(80) NOT NULL DEFAULT '',
  `NODEGROUP` varchar(12) NOT NULL DEFAULT '',
  `TABLESPACE_NAME` varchar(64) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `PARTITIONS`
--

INSERT INTO `PARTITIONS` (`TABLE_CATALOG`, `TABLE_SCHEMA`, `TABLE_NAME`, `PARTITION_NAME`, `SUBPARTITION_NAME`, `PARTITION_ORDINAL_POSITION`, `SUBPARTITION_ORDINAL_POSITION`, `PARTITION_METHOD`, `SUBPARTITION_METHOD`, `PARTITION_EXPRESSION`, `SUBPARTITION_EXPRESSION`, `PARTITION_DESCRIPTION`, `TABLE_ROWS`, `AVG_ROW_LENGTH`, `DATA_LENGTH`, `MAX_DATA_LENGTH`, `INDEX_LENGTH`, `DATA_FREE`, `CREATE_TIME`, `UPDATE_TIME`, `CHECK_TIME`, `CHECKSUM`, `PARTITION_COMMENT`, `NODEGROUP`, `TABLESPACE_NAME`) VALUES
(NULL, 'information_schema', 'CHARACTER_SETS', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 384, 0, 16434816, 0, 0, '2016-04-24 14:20:44', NULL, NULL, NULL, '', '', NULL),
(NULL, 'information_schema', 'COLLATIONS', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 231, 0, 16704765, 0, 0, '2016-04-24 14:20:44', NULL, NULL, NULL, '', '', NULL),
(NULL, 'information_schema', 'COLLATION_CHARACTER_SET_APPLICABILITY', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 195, 0, 16357770, 0, 0, '2016-04-24 14:20:44', NULL, NULL, NULL, '', '', NULL),
(NULL, 'information_schema', 'COLUMNS', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 281474976710655, 1024, 0, '2016-04-24 14:20:44', '2016-04-24 14:20:44', NULL, NULL, '', '', NULL),
(NULL, 'information_schema', 'COLUMN_PRIVILEGES', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 2565, 0, 16757145, 0, 0, '2016-04-24 14:20:44', NULL, NULL, NULL, '', '', NULL),
(NULL, 'information_schema', 'ENGINES', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 490, 0, 16574250, 0, 0, '2016-04-24 14:20:44', NULL, NULL, NULL, '', '', NULL),
(NULL, 'information_schema', 'EVENTS', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 281474976710655, 1024, 0, '2016-04-24 14:20:44', '2016-04-24 14:20:44', NULL, NULL, '', '', NULL),
(NULL, 'information_schema', 'FILES', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 2677, 0, 16758020, 0, 0, '2016-04-24 14:20:44', NULL, NULL, NULL, '', '', NULL),
(NULL, 'information_schema', 'GLOBAL_STATUS', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 3268, 0, 16755036, 0, 0, '2016-04-24 14:20:44', NULL, NULL, NULL, '', '', NULL),
(NULL, 'information_schema', 'GLOBAL_VARIABLES', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 3268, 0, 16755036, 0, 0, '2016-04-24 14:20:44', NULL, NULL, NULL, '', '', NULL),
(NULL, 'information_schema', 'KEY_COLUMN_USAGE', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 4637, 0, 16762755, 0, 0, '2016-04-24 14:20:44', NULL, NULL, NULL, '', '', NULL),
(NULL, 'information_schema', 'PARTITIONS', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 281474976710655, 1024, 0, '2016-04-24 14:20:44', '2016-04-24 14:20:44', NULL, NULL, '', '', NULL),
(NULL, 'information_schema', 'PLUGINS', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 281474976710655, 1024, 0, '2016-04-24 14:20:44', '2016-04-24 14:20:44', NULL, NULL, '', '', NULL),
(NULL, 'information_schema', 'PROCESSLIST', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 281474976710655, 1024, 0, '2016-04-24 14:20:44', '2016-04-24 14:20:44', NULL, NULL, '', '', NULL),
(NULL, 'information_schema', 'PROFILING', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 308, 0, 16562084, 0, 0, '2016-04-24 14:20:44', NULL, NULL, NULL, '', '', NULL),
(NULL, 'information_schema', 'REFERENTIAL_CONSTRAINTS', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 4814, 0, 16767162, 0, 0, '2016-04-24 14:20:44', NULL, NULL, NULL, '', '', NULL),
(NULL, 'information_schema', 'ROUTINES', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 281474976710655, 1024, 0, '2016-04-24 14:20:44', '2016-04-24 14:20:44', NULL, NULL, '', '', NULL),
(NULL, 'information_schema', 'SCHEMATA', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 3464, 0, 16738048, 0, 0, '2016-04-24 14:20:44', NULL, NULL, NULL, '', '', NULL),
(NULL, 'information_schema', 'SCHEMA_PRIVILEGES', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 2179, 0, 16736899, 0, 0, '2016-04-24 14:20:44', NULL, NULL, NULL, '', '', NULL),
(NULL, 'information_schema', 'SESSION_STATUS', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 3268, 0, 16755036, 0, 0, '2016-04-24 14:20:44', NULL, NULL, NULL, '', '', NULL),
(NULL, 'information_schema', 'SESSION_VARIABLES', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 3268, 0, 16755036, 0, 0, '2016-04-24 14:20:44', NULL, NULL, NULL, '', '', NULL),
(NULL, 'information_schema', 'STATISTICS', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 2679, 0, 16770540, 0, 0, '2016-04-24 14:20:44', NULL, NULL, NULL, '', '', NULL),
(NULL, 'information_schema', 'TABLES', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 3545, 0, 16743035, 0, 0, '2016-04-24 14:20:44', NULL, NULL, NULL, '', '', NULL),
(NULL, 'information_schema', 'TABLE_CONSTRAINTS', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 2504, 0, 16721712, 0, 0, '2016-04-24 14:20:44', NULL, NULL, NULL, '', '', NULL),
(NULL, 'information_schema', 'TABLE_PRIVILEGES', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 2372, 0, 16748692, 0, 0, '2016-04-24 14:20:44', NULL, NULL, NULL, '', '', NULL),
(NULL, 'information_schema', 'TRIGGERS', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 281474976710655, 1024, 0, '2016-04-24 14:20:44', '2016-04-24 14:20:44', NULL, NULL, '', '', NULL),
(NULL, 'information_schema', 'USER_PRIVILEGES', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1986, 0, 16726092, 0, 0, '2016-04-24 14:20:44', NULL, NULL, NULL, '', '', NULL),
(NULL, 'information_schema', 'VIEWS', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 281474976710655, 1024, 0, '2016-04-24 14:20:44', '2016-04-24 14:20:44', NULL, NULL, '', '', NULL),
(NULL, 'cs4400_Team_20', 'Customer', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 20, 28, 724, 281474976710655, 3072, 164, '2016-04-13 19:26:38', '2016-04-24 00:26:40', NULL, NULL, '', '', NULL),
(NULL, 'cs4400_Team_20', 'Manager', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 5, 20, 100, 281474976710655, 2048, 0, '2016-04-13 19:26:46', '2016-04-15 16:43:51', NULL, NULL, '', '', NULL),
(NULL, 'cs4400_Team_20', 'PaymentInfo', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 20, 58, 2072, 281474976710655, 3072, 904, '2016-04-13 19:27:03', '2016-04-24 11:41:39', '2016-04-24 05:22:11', NULL, '', '', NULL),
(NULL, 'cs4400_Team_20', 'Reservation', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 40, 32, 1280, 281474976710655, 4096, 0, '2016-04-24 14:07:21', '2016-04-24 14:18:56', '2016-04-24 14:12:14', NULL, '', '', NULL),
(NULL, 'cs4400_Team_20', 'Reserve', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 68, 64, 4372, 281474976710655, 3072, 0, '2016-04-23 20:51:39', '2016-04-24 13:52:26', '2016-04-24 05:49:43', NULL, '', '', NULL),
(NULL, 'cs4400_Team_20', 'Review', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 21, 53, 1116, 281474976710655, 4096, 0, '2016-04-16 17:34:40', '2016-04-24 11:22:40', '2016-04-24 05:19:30', NULL, '', '', NULL),
(NULL, 'cs4400_Team_20', 'Station', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, 47, 472, 281474976710655, 2048, 0, '2016-04-13 19:27:23', '2016-04-24 05:59:08', NULL, NULL, '', '', NULL),
(NULL, 'cs4400_Team_20', 'Stop', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 32, 44, 2256, 281474976710655, 5120, 844, '2016-04-15 20:51:19', '2016-04-24 10:46:21', '2016-04-24 05:45:25', NULL, '', '', NULL),
(NULL, 'cs4400_Team_20', 'SystemInfo', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 15, 30, 4222124650659839, 2048, 15, '2016-04-13 19:27:36', '2016-04-15 17:22:14', NULL, NULL, '', '', NULL),
(NULL, 'cs4400_Team_20', 'TrainRoute', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 8, 20, 160, 281474976710655, 2048, 0, '2016-04-24 05:50:07', '2016-04-24 05:50:07', NULL, NULL, '', '', NULL),
(NULL, 'cs4400_Team_20', 'User', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 25, 28, 880, 281474976710655, 2048, 180, '2016-04-13 19:26:16', '2016-04-24 00:28:10', NULL, NULL, '', '', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `PLUGINS`
--

DROP TABLE IF EXISTS `PLUGINS`;
CREATE TEMPORARY TABLE `PLUGINS` (
  `PLUGIN_NAME` varchar(64) NOT NULL DEFAULT '',
  `PLUGIN_VERSION` varchar(20) NOT NULL DEFAULT '',
  `PLUGIN_STATUS` varchar(10) NOT NULL DEFAULT '',
  `PLUGIN_TYPE` varchar(80) NOT NULL DEFAULT '',
  `PLUGIN_TYPE_VERSION` varchar(20) NOT NULL DEFAULT '',
  `PLUGIN_LIBRARY` varchar(64) DEFAULT NULL,
  `PLUGIN_LIBRARY_VERSION` varchar(20) DEFAULT NULL,
  `PLUGIN_AUTHOR` varchar(64) DEFAULT NULL,
  `PLUGIN_DESCRIPTION` longtext,
  `PLUGIN_LICENSE` varchar(80) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `PLUGINS`
--

INSERT INTO `PLUGINS` (`PLUGIN_NAME`, `PLUGIN_VERSION`, `PLUGIN_STATUS`, `PLUGIN_TYPE`, `PLUGIN_TYPE_VERSION`, `PLUGIN_LIBRARY`, `PLUGIN_LIBRARY_VERSION`, `PLUGIN_AUTHOR`, `PLUGIN_DESCRIPTION`, `PLUGIN_LICENSE`) VALUES
('binlog', '1.0', 'ACTIVE', 'STORAGE ENGINE', '50173.0', NULL, NULL, 'MySQL AB', 'This is a pseudo storage engine to represent the binlog in a transaction', 'GPL'),
('partition', '1.0', 'ACTIVE', 'STORAGE ENGINE', '50173.0', NULL, NULL, 'Mikael Ronstrom, MySQL AB', 'Partition Storage Engine Helper', 'GPL'),
('CSV', '1.0', 'ACTIVE', 'STORAGE ENGINE', '50173.0', NULL, NULL, 'Brian Aker, MySQL AB', 'CSV storage engine', 'GPL'),
('MEMORY', '1.0', 'ACTIVE', 'STORAGE ENGINE', '50173.0', NULL, NULL, 'MySQL AB', 'Hash based, stored in memory, useful for temporary tables', 'GPL'),
('InnoDB', '1.0', 'ACTIVE', 'STORAGE ENGINE', '50173.0', NULL, NULL, 'Innobase OY', 'Supports transactions, row-level locking, and foreign keys', 'GPL'),
('MyISAM', '1.0', 'ACTIVE', 'STORAGE ENGINE', '50173.0', NULL, NULL, 'MySQL AB', 'Default engine as of MySQL 3.23 with great performance', 'GPL'),
('MRG_MYISAM', '1.0', 'ACTIVE', 'STORAGE ENGINE', '50173.0', NULL, NULL, 'MySQL AB', 'Collection of identical MyISAM tables', 'GPL');

-- --------------------------------------------------------

--
-- Table structure for table `PROCESSLIST`
--

DROP TABLE IF EXISTS `PROCESSLIST`;
CREATE TEMPORARY TABLE `PROCESSLIST` (
  `ID` bigint(4) NOT NULL DEFAULT '0',
  `USER` varchar(16) NOT NULL DEFAULT '',
  `HOST` varchar(64) NOT NULL DEFAULT '',
  `DB` varchar(64) DEFAULT NULL,
  `COMMAND` varchar(16) NOT NULL DEFAULT '',
  `TIME` int(7) NOT NULL DEFAULT '0',
  `STATE` varchar(64) DEFAULT NULL,
  `INFO` longtext
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `PROCESSLIST`
--

INSERT INTO `PROCESSLIST` (`ID`, `USER`, `HOST`, `DB`, `COMMAND`, `TIME`, `STATE`, `INFO`) VALUES
(301786, 'cs4400_Team_20', 'localhost', NULL, 'Query', 0, 'executing', 'SELECT * FROM `information_schema`.`PROCESSLIST`'),
(297411, 'cs4400_Team_20', 'lawn-128-61-62-243.lawn.gatech.edu:57091', 'cs4400_Team_20', 'Sleep', 2002, '', NULL),
(290536, 'cs4400_Team_20', 'lawn-128-61-115-162.lawn.gatech.edu:60944', 'cs4400_Team_20', 'Sleep', 1698, '', NULL),
(289007, 'cs4400_Team_20', 'lawn-128-61-74-195.lawn.gatech.edu:61319', 'cs4400_Team_20', 'Sleep', 5924, '', NULL),
(288661, 'cs4400_Team_20', 'lawn-128-61-74-195.lawn.gatech.edu:61316', 'cs4400_Team_20', 'Sleep', 6596, '', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `PROFILING`
--

DROP TABLE IF EXISTS `PROFILING`;
CREATE TEMPORARY TABLE `PROFILING` (
  `QUERY_ID` int(20) NOT NULL DEFAULT '0',
  `SEQ` int(20) NOT NULL DEFAULT '0',
  `STATE` varchar(30) NOT NULL DEFAULT '',
  `DURATION` decimal(9,6) NOT NULL DEFAULT '0.000000',
  `CPU_USER` decimal(9,6) DEFAULT NULL,
  `CPU_SYSTEM` decimal(9,6) DEFAULT NULL,
  `CONTEXT_VOLUNTARY` int(20) DEFAULT NULL,
  `CONTEXT_INVOLUNTARY` int(20) DEFAULT NULL,
  `BLOCK_OPS_IN` int(20) DEFAULT NULL,
  `BLOCK_OPS_OUT` int(20) DEFAULT NULL,
  `MESSAGES_SENT` int(20) DEFAULT NULL,
  `MESSAGES_RECEIVED` int(20) DEFAULT NULL,
  `PAGE_FAULTS_MAJOR` int(20) DEFAULT NULL,
  `PAGE_FAULTS_MINOR` int(20) DEFAULT NULL,
  `SWAPS` int(20) DEFAULT NULL,
  `SOURCE_FUNCTION` varchar(30) DEFAULT NULL,
  `SOURCE_FILE` varchar(20) DEFAULT NULL,
  `SOURCE_LINE` int(20) DEFAULT NULL
) ENGINE=MEMORY DEFAULT CHARSET=utf8;

--
-- Dumping data for table `PROFILING`
--


-- --------------------------------------------------------

--
-- Table structure for table `REFERENTIAL_CONSTRAINTS`
--

DROP TABLE IF EXISTS `REFERENTIAL_CONSTRAINTS`;
CREATE TEMPORARY TABLE `REFERENTIAL_CONSTRAINTS` (
  `CONSTRAINT_CATALOG` varchar(512) DEFAULT NULL,
  `CONSTRAINT_SCHEMA` varchar(64) NOT NULL DEFAULT '',
  `CONSTRAINT_NAME` varchar(64) NOT NULL DEFAULT '',
  `UNIQUE_CONSTRAINT_CATALOG` varchar(512) DEFAULT NULL,
  `UNIQUE_CONSTRAINT_SCHEMA` varchar(64) NOT NULL DEFAULT '',
  `UNIQUE_CONSTRAINT_NAME` varchar(64) DEFAULT NULL,
  `MATCH_OPTION` varchar(64) NOT NULL DEFAULT '',
  `UPDATE_RULE` varchar(64) NOT NULL DEFAULT '',
  `DELETE_RULE` varchar(64) NOT NULL DEFAULT '',
  `TABLE_NAME` varchar(64) NOT NULL DEFAULT '',
  `REFERENCED_TABLE_NAME` varchar(64) NOT NULL DEFAULT ''
) ENGINE=MEMORY DEFAULT CHARSET=utf8;

--
-- Dumping data for table `REFERENTIAL_CONSTRAINTS`
--


-- --------------------------------------------------------

--
-- Table structure for table `ROUTINES`
--

DROP TABLE IF EXISTS `ROUTINES`;
CREATE TEMPORARY TABLE `ROUTINES` (
  `SPECIFIC_NAME` varchar(64) NOT NULL DEFAULT '',
  `ROUTINE_CATALOG` varchar(512) DEFAULT NULL,
  `ROUTINE_SCHEMA` varchar(64) NOT NULL DEFAULT '',
  `ROUTINE_NAME` varchar(64) NOT NULL DEFAULT '',
  `ROUTINE_TYPE` varchar(9) NOT NULL DEFAULT '',
  `DTD_IDENTIFIER` varchar(64) DEFAULT NULL,
  `ROUTINE_BODY` varchar(8) NOT NULL DEFAULT '',
  `ROUTINE_DEFINITION` longtext,
  `EXTERNAL_NAME` varchar(64) DEFAULT NULL,
  `EXTERNAL_LANGUAGE` varchar(64) DEFAULT NULL,
  `PARAMETER_STYLE` varchar(8) NOT NULL DEFAULT '',
  `IS_DETERMINISTIC` varchar(3) NOT NULL DEFAULT '',
  `SQL_DATA_ACCESS` varchar(64) NOT NULL DEFAULT '',
  `SQL_PATH` varchar(64) DEFAULT NULL,
  `SECURITY_TYPE` varchar(7) NOT NULL DEFAULT '',
  `CREATED` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `LAST_ALTERED` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `SQL_MODE` varchar(8192) NOT NULL DEFAULT '',
  `ROUTINE_COMMENT` varchar(64) NOT NULL DEFAULT '',
  `DEFINER` varchar(77) NOT NULL DEFAULT '',
  `CHARACTER_SET_CLIENT` varchar(32) NOT NULL DEFAULT '',
  `COLLATION_CONNECTION` varchar(32) NOT NULL DEFAULT '',
  `DATABASE_COLLATION` varchar(32) NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ROUTINES`
--


-- --------------------------------------------------------

--
-- Table structure for table `SCHEMATA`
--

DROP TABLE IF EXISTS `SCHEMATA`;
CREATE TEMPORARY TABLE `SCHEMATA` (
  `CATALOG_NAME` varchar(512) DEFAULT NULL,
  `SCHEMA_NAME` varchar(64) NOT NULL DEFAULT '',
  `DEFAULT_CHARACTER_SET_NAME` varchar(32) NOT NULL DEFAULT '',
  `DEFAULT_COLLATION_NAME` varchar(32) NOT NULL DEFAULT '',
  `SQL_PATH` varchar(512) DEFAULT NULL
) ENGINE=MEMORY DEFAULT CHARSET=utf8;

--
-- Dumping data for table `SCHEMATA`
--

INSERT INTO `SCHEMATA` (`CATALOG_NAME`, `SCHEMA_NAME`, `DEFAULT_CHARACTER_SET_NAME`, `DEFAULT_COLLATION_NAME`, `SQL_PATH`) VALUES
(NULL, 'information_schema', 'utf8', 'utf8_general_ci', NULL),
(NULL, 'cs4400_Team_20', 'latin1', 'latin1_swedish_ci', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `SCHEMA_PRIVILEGES`
--

DROP TABLE IF EXISTS `SCHEMA_PRIVILEGES`;
CREATE TEMPORARY TABLE `SCHEMA_PRIVILEGES` (
  `GRANTEE` varchar(81) NOT NULL DEFAULT '',
  `TABLE_CATALOG` varchar(512) DEFAULT NULL,
  `TABLE_SCHEMA` varchar(64) NOT NULL DEFAULT '',
  `PRIVILEGE_TYPE` varchar(64) NOT NULL DEFAULT '',
  `IS_GRANTABLE` varchar(3) NOT NULL DEFAULT ''
) ENGINE=MEMORY DEFAULT CHARSET=utf8;

--
-- Dumping data for table `SCHEMA_PRIVILEGES`
--

INSERT INTO `SCHEMA_PRIVILEGES` (`GRANTEE`, `TABLE_CATALOG`, `TABLE_SCHEMA`, `PRIVILEGE_TYPE`, `IS_GRANTABLE`) VALUES
('''cs4400_Team_20''@''%''', NULL, 'cs4400_Team_20', 'SELECT', 'NO'),
('''cs4400_Team_20''@''%''', NULL, 'cs4400_Team_20', 'INSERT', 'NO'),
('''cs4400_Team_20''@''%''', NULL, 'cs4400_Team_20', 'UPDATE', 'NO'),
('''cs4400_Team_20''@''%''', NULL, 'cs4400_Team_20', 'DELETE', 'NO'),
('''cs4400_Team_20''@''%''', NULL, 'cs4400_Team_20', 'CREATE', 'NO'),
('''cs4400_Team_20''@''%''', NULL, 'cs4400_Team_20', 'DROP', 'NO'),
('''cs4400_Team_20''@''%''', NULL, 'cs4400_Team_20', 'ALTER', 'NO'),
('''cs4400_Team_20''@''%''', NULL, 'cs4400_Team_20', 'LOCK TABLES', 'NO'),
('''cs4400_Team_20''@''%''', NULL, 'cs4400_Team_20', 'EXECUTE', 'NO'),
('''cs4400_Team_20''@''%''', NULL, 'cs4400_Team_20', 'CREATE VIEW', 'NO'),
('''cs4400_Team_20''@''%''', NULL, 'cs4400_Team_20', 'CREATE ROUTINE', 'NO'),
('''cs4400_Team_20''@''%''', NULL, 'cs4400_Team_20', 'ALTER ROUTINE', 'NO');

-- --------------------------------------------------------

--
-- Table structure for table `SESSION_STATUS`
--

DROP TABLE IF EXISTS `SESSION_STATUS`;
CREATE TEMPORARY TABLE `SESSION_STATUS` (
  `VARIABLE_NAME` varchar(64) NOT NULL DEFAULT '',
  `VARIABLE_VALUE` varchar(1024) DEFAULT NULL
) ENGINE=MEMORY DEFAULT CHARSET=utf8;

--
-- Dumping data for table `SESSION_STATUS`
--

INSERT INTO `SESSION_STATUS` (`VARIABLE_NAME`, `VARIABLE_VALUE`) VALUES
('ABORTED_CLIENTS', '48260'),
('ABORTED_CONNECTS', '22180'),
('BINLOG_CACHE_DISK_USE', '0'),
('BINLOG_CACHE_USE', '0'),
('BYTES_RECEIVED', '21781'),
('BYTES_SENT', '286172'),
('COM_ADMIN_COMMANDS', '0'),
('COM_ASSIGN_TO_KEYCACHE', '0'),
('COM_ALTER_DB', '0'),
('COM_ALTER_DB_UPGRADE', '0'),
('COM_ALTER_EVENT', '0'),
('COM_ALTER_FUNCTION', '0'),
('COM_ALTER_PROCEDURE', '0'),
('COM_ALTER_SERVER', '0'),
('COM_ALTER_TABLE', '0'),
('COM_ALTER_TABLESPACE', '0'),
('COM_ANALYZE', '0'),
('COM_BACKUP_TABLE', '0'),
('COM_BEGIN', '0'),
('COM_BINLOG', '0'),
('COM_CALL_PROCEDURE', '0'),
('COM_CHANGE_DB', '0'),
('COM_CHANGE_MASTER', '0'),
('COM_CHECK', '0'),
('COM_CHECKSUM', '0'),
('COM_COMMIT', '0'),
('COM_CREATE_DB', '0'),
('COM_CREATE_EVENT', '0'),
('COM_CREATE_FUNCTION', '0'),
('COM_CREATE_INDEX', '0'),
('COM_CREATE_PROCEDURE', '0'),
('COM_CREATE_SERVER', '0'),
('COM_CREATE_TABLE', '0'),
('COM_CREATE_TRIGGER', '0'),
('COM_CREATE_UDF', '0'),
('COM_CREATE_USER', '0'),
('COM_CREATE_VIEW', '0'),
('COM_DEALLOC_SQL', '0'),
('COM_DELETE', '0'),
('COM_DELETE_MULTI', '0'),
('COM_DO', '0'),
('COM_DROP_DB', '0'),
('COM_DROP_EVENT', '0'),
('COM_DROP_FUNCTION', '0'),
('COM_DROP_INDEX', '0'),
('COM_DROP_PROCEDURE', '0'),
('COM_DROP_SERVER', '0'),
('COM_DROP_TABLE', '0'),
('COM_DROP_TRIGGER', '0'),
('COM_DROP_USER', '0'),
('COM_DROP_VIEW', '0'),
('COM_EMPTY_QUERY', '0'),
('COM_EXECUTE_SQL', '0'),
('COM_FLUSH', '0'),
('COM_GRANT', '0'),
('COM_HA_CLOSE', '0'),
('COM_HA_OPEN', '0'),
('COM_HA_READ', '0'),
('COM_HELP', '0'),
('COM_INSERT', '0'),
('COM_INSERT_SELECT', '0'),
('COM_INSTALL_PLUGIN', '0'),
('COM_KILL', '0'),
('COM_LOAD', '0'),
('COM_LOAD_MASTER_DATA', '0'),
('COM_LOAD_MASTER_TABLE', '0'),
('COM_LOCK_TABLES', '0'),
('COM_OPTIMIZE', '0'),
('COM_PRELOAD_KEYS', '0'),
('COM_PREPARE_SQL', '0'),
('COM_PURGE', '0'),
('COM_PURGE_BEFORE_DATE', '0'),
('COM_RELEASE_SAVEPOINT', '0'),
('COM_RENAME_TABLE', '0'),
('COM_RENAME_USER', '0'),
('COM_REPAIR', '0'),
('COM_REPLACE', '0'),
('COM_REPLACE_SELECT', '0'),
('COM_RESET', '0'),
('COM_RESTORE_TABLE', '0'),
('COM_REVOKE', '0'),
('COM_REVOKE_ALL', '0'),
('COM_ROLLBACK', '0'),
('COM_ROLLBACK_TO_SAVEPOINT', '0'),
('COM_SAVEPOINT', '0'),
('COM_SELECT', '65'),
('COM_SET_OPTION', '37'),
('COM_SHOW_AUTHORS', '0'),
('COM_SHOW_BINLOG_EVENTS', '0'),
('COM_SHOW_BINLOGS', '0'),
('COM_SHOW_CHARSETS', '1'),
('COM_SHOW_COLLATIONS', '1'),
('COM_SHOW_COLUMN_TYPES', '0'),
('COM_SHOW_CONTRIBUTORS', '0'),
('COM_SHOW_CREATE_DB', '0'),
('COM_SHOW_CREATE_EVENT', '0'),
('COM_SHOW_CREATE_FUNC', '0'),
('COM_SHOW_CREATE_PROC', '0'),
('COM_SHOW_CREATE_TABLE', '32'),
('COM_SHOW_CREATE_TRIGGER', '0'),
('COM_SHOW_DATABASES', '1'),
('COM_SHOW_ENGINE_LOGS', '0'),
('COM_SHOW_ENGINE_MUTEX', '0'),
('COM_SHOW_ENGINE_STATUS', '0'),
('COM_SHOW_EVENTS', '0'),
('COM_SHOW_ERRORS', '0'),
('COM_SHOW_FIELDS', '0'),
('COM_SHOW_FUNCTION_STATUS', '0'),
('COM_SHOW_GRANTS', '0'),
('COM_SHOW_KEYS', '0'),
('COM_SHOW_MASTER_STATUS', '0'),
('COM_SHOW_NEW_MASTER', '0'),
('COM_SHOW_OPEN_TABLES', '0'),
('COM_SHOW_PLUGINS', '0'),
('COM_SHOW_PRIVILEGES', '0'),
('COM_SHOW_PROCEDURE_STATUS', '0'),
('COM_SHOW_PROCESSLIST', '0'),
('COM_SHOW_PROFILE', '0'),
('COM_SHOW_PROFILES', '0'),
('COM_SHOW_SLAVE_HOSTS', '0'),
('COM_SHOW_SLAVE_STATUS', '0'),
('COM_SHOW_STATUS', '0'),
('COM_SHOW_STORAGE_ENGINES', '0'),
('COM_SHOW_TABLE_STATUS', '127'),
('COM_SHOW_TABLES', '2'),
('COM_SHOW_TRIGGERS', '0'),
('COM_SHOW_VARIABLES', '4'),
('COM_SHOW_WARNINGS', '0'),
('COM_SLAVE_START', '0'),
('COM_SLAVE_STOP', '0'),
('COM_STMT_CLOSE', '0'),
('COM_STMT_EXECUTE', '0'),
('COM_STMT_FETCH', '0'),
('COM_STMT_PREPARE', '0'),
('COM_STMT_REPREPARE', '0'),
('COM_STMT_RESET', '0'),
('COM_STMT_SEND_LONG_DATA', '0'),
('COM_TRUNCATE', '0'),
('COM_UNINSTALL_PLUGIN', '0'),
('COM_UNLOCK_TABLES', '0'),
('COM_UPDATE', '0'),
('COM_UPDATE_MULTI', '0'),
('COM_XA_COMMIT', '0'),
('COM_XA_END', '0'),
('COM_XA_PREPARE', '0'),
('COM_XA_RECOVER', '0'),
('COM_XA_ROLLBACK', '0'),
('COM_XA_START', '0'),
('COMPRESSION', 'OFF'),
('CONNECTIONS', '301787'),
('CREATED_TMP_DISK_TABLES', '106'),
('CREATED_TMP_FILES', '5'),
('CREATED_TMP_TABLES', '426'),
('DELAYED_ERRORS', '0'),
('DELAYED_INSERT_THREADS', '0'),
('DELAYED_WRITES', '0'),
('FLUSH_COMMANDS', '1'),
('HANDLER_COMMIT', '0'),
('HANDLER_DELETE', '0'),
('HANDLER_DISCOVER', '0'),
('HANDLER_PREPARE', '0'),
('HANDLER_READ_FIRST', '3'),
('HANDLER_READ_KEY', '0'),
('HANDLER_READ_NEXT', '9'),
('HANDLER_READ_PREV', '0'),
('HANDLER_READ_RND', '0'),
('HANDLER_READ_RND_NEXT', '2104'),
('HANDLER_ROLLBACK', '0'),
('HANDLER_SAVEPOINT', '0'),
('HANDLER_SAVEPOINT_ROLLBACK', '0'),
('HANDLER_UPDATE', '0'),
('HANDLER_WRITE', '1832'),
('INNODB_BUFFER_POOL_PAGES_DATA', '506'),
('INNODB_BUFFER_POOL_PAGES_DIRTY', '0'),
('INNODB_BUFFER_POOL_PAGES_FLUSHED', '54631'),
('INNODB_BUFFER_POOL_PAGES_FREE', '0'),
('INNODB_BUFFER_POOL_PAGES_MISC', '6'),
('INNODB_BUFFER_POOL_PAGES_TOTAL', '512'),
('INNODB_BUFFER_POOL_READ_AHEAD_RND', '19'),
('INNODB_BUFFER_POOL_READ_AHEAD_SEQ', '0'),
('INNODB_BUFFER_POOL_READ_REQUESTS', '16573867'),
('INNODB_BUFFER_POOL_READS', '2102'),
('INNODB_BUFFER_POOL_WAIT_FREE', '0'),
('INNODB_BUFFER_POOL_WRITE_REQUESTS', '565058'),
('INNODB_DATA_FSYNCS', '49529'),
('INNODB_DATA_PENDING_FSYNCS', '0'),
('INNODB_DATA_PENDING_READS', '0'),
('INNODB_DATA_PENDING_WRITES', '0'),
('INNODB_DATA_READ', '37949440'),
('INNODB_DATA_READS', '2159'),
('INNODB_DATA_WRITES', '87545'),
('INNODB_DATA_WRITTEN', '1832067072'),
('INNODB_DBLWR_PAGES_WRITTEN', '54631'),
('INNODB_DBLWR_WRITES', '6889'),
('INNODB_LOG_WAITS', '0'),
('INNODB_LOG_WRITE_REQUESTS', '51738'),
('INNODB_LOG_WRITES', '29468'),
('INNODB_OS_LOG_FSYNCS', '35750'),
('INNODB_OS_LOG_PENDING_FSYNCS', '0'),
('INNODB_OS_LOG_PENDING_WRITES', '0'),
('INNODB_OS_LOG_WRITTEN', '38699520'),
('INNODB_PAGE_SIZE', '16384'),
('INNODB_PAGES_CREATED', '937'),
('INNODB_PAGES_READ', '2183'),
('INNODB_PAGES_WRITTEN', '54631'),
('INNODB_ROW_LOCK_CURRENT_WAITS', '0'),
('INNODB_ROW_LOCK_TIME', '1554697'),
('INNODB_ROW_LOCK_TIME_AVG', '44419'),
('INNODB_ROW_LOCK_TIME_MAX', '51667'),
('INNODB_ROW_LOCK_WAITS', '35'),
('INNODB_ROWS_DELETED', '1790'),
('INNODB_ROWS_INSERTED', '34254'),
('INNODB_ROWS_READ', '1812641'),
('INNODB_ROWS_UPDATED', '8895'),
('KEY_BLOCKS_NOT_FLUSHED', '0'),
('KEY_BLOCKS_UNUSED', '6673'),
('KEY_BLOCKS_USED', '172'),
('KEY_READ_REQUESTS', '960670'),
('KEY_READS', '47160'),
('KEY_WRITE_REQUESTS', '168761'),
('KEY_WRITES', '127212'),
('LAST_QUERY_COST', '10.499000'),
('MAX_USED_CONNECTIONS', '104'),
('NOT_FLUSHED_DELAYED_ROWS', '0'),
('OPEN_FILES', '69'),
('OPEN_STREAMS', '0'),
('OPEN_TABLE_DEFINITIONS', '256'),
('OPEN_TABLES', '64'),
('OPENED_FILES', '1746375'),
('OPENED_TABLE_DEFINITIONS', '5'),
('OPENED_TABLES', '23'),
('PREPARED_STMT_COUNT', '0'),
('QCACHE_FREE_BLOCKS', '0'),
('QCACHE_FREE_MEMORY', '0'),
('QCACHE_HITS', '0'),
('QCACHE_INSERTS', '0'),
('QCACHE_LOWMEM_PRUNES', '0'),
('QCACHE_NOT_CACHED', '0'),
('QCACHE_QUERIES_IN_CACHE', '0'),
('QCACHE_TOTAL_BLOCKS', '0'),
('QUERIES', '6095738'),
('QUESTIONS', '270'),
('RPL_STATUS', 'NULL'),
('SELECT_FULL_JOIN', '0'),
('SELECT_FULL_RANGE_JOIN', '0'),
('SELECT_RANGE', '0'),
('SELECT_RANGE_CHECK', '0'),
('SELECT_SCAN', '199'),
('SLAVE_OPEN_TEMP_TABLES', '0'),
('SLAVE_RETRIED_TRANSACTIONS', '0'),
('SLAVE_RUNNING', 'OFF'),
('SLOW_LAUNCH_THREADS', '0'),
('SLOW_QUERIES', '0'),
('SORT_MERGE_PASSES', '0'),
('SORT_RANGE', '0'),
('SORT_ROWS', '0'),
('SORT_SCAN', '0'),
('SSL_ACCEPT_RENEGOTIATES', '0'),
('SSL_ACCEPTS', '0'),
('SSL_CALLBACK_CACHE_HITS', '0'),
('SSL_CIPHER', ''),
('SSL_CIPHER_LIST', ''),
('SSL_CLIENT_CONNECTS', '0'),
('SSL_CONNECT_RENEGOTIATES', '0'),
('SSL_CTX_VERIFY_DEPTH', '0'),
('SSL_CTX_VERIFY_MODE', '0'),
('SSL_DEFAULT_TIMEOUT', '0'),
('SSL_FINISHED_ACCEPTS', '0'),
('SSL_FINISHED_CONNECTS', '0'),
('SSL_SESSION_CACHE_HITS', '0'),
('SSL_SESSION_CACHE_MISSES', '0'),
('SSL_SESSION_CACHE_MODE', 'NONE'),
('SSL_SESSION_CACHE_OVERFLOWS', '0'),
('SSL_SESSION_CACHE_SIZE', '0'),
('SSL_SESSION_CACHE_TIMEOUTS', '0'),
('SSL_SESSIONS_REUSED', '0'),
('SSL_USED_SESSION_CACHE_ENTRIES', '0'),
('SSL_VERIFY_DEPTH', '0'),
('SSL_VERIFY_MODE', '0'),
('SSL_VERSION', ''),
('TABLE_LOCKS_IMMEDIATE', '523197'),
('TABLE_LOCKS_WAITED', '1'),
('TC_LOG_MAX_PAGES_USED', '0'),
('TC_LOG_PAGE_SIZE', '0'),
('TC_LOG_PAGE_WAITS', '0'),
('THREADS_CACHED', '0'),
('THREADS_CONNECTED', '98'),
('THREADS_CREATED', '301786'),
('THREADS_RUNNING', '1'),
('UPTIME', '7849471'),
('UPTIME_SINCE_FLUSH_STATUS', '7849471');

-- --------------------------------------------------------

--
-- Table structure for table `SESSION_VARIABLES`
--

DROP TABLE IF EXISTS `SESSION_VARIABLES`;
CREATE TEMPORARY TABLE `SESSION_VARIABLES` (
  `VARIABLE_NAME` varchar(64) NOT NULL DEFAULT '',
  `VARIABLE_VALUE` varchar(1024) DEFAULT NULL
) ENGINE=MEMORY DEFAULT CHARSET=utf8;

--
-- Dumping data for table `SESSION_VARIABLES`
--

INSERT INTO `SESSION_VARIABLES` (`VARIABLE_NAME`, `VARIABLE_VALUE`) VALUES
('MAX_PREPARED_STMT_COUNT', '16382'),
('CHARACTER_SETS_DIR', '/usr/share/mysql/charsets/'),
('HAVE_CRYPT', 'YES'),
('CONNECT_TIMEOUT', '10'),
('MYISAM_REPAIR_THREADS', '1'),
('AUTOMATIC_SP_PRIVILEGES', 'ON'),
('MAX_CONNECT_ERRORS', '10'),
('BINLOG_CACHE_SIZE', '32768'),
('INNODB_CONCURRENCY_TICKETS', '500'),
('BACK_LOG', '50'),
('MAX_CONNECTIONS', '750'),
('STORAGE_ENGINE', 'MyISAM'),
('DELAYED_INSERT_TIMEOUT', '300'),
('MAX_LENGTH_FOR_SORT_DATA', '1024'),
('LOG_BIN_TRUST_ROUTINE_CREATORS', 'OFF'),
('CHARACTER_SET_CONNECTION', 'utf8'),
('SSL_CIPHER', ''),
('CHARACTER_SET_RESULTS', 'utf8'),
('BASEDIR', '/usr/'),
('LARGE_PAGES', 'OFF'),
('UPDATABLE_VIEWS_WITH_LIMIT', 'YES'),
('TABLE_DEFINITION_CACHE', '256'),
('SLOW_LAUNCH_TIME', '2'),
('QUERY_ALLOC_BLOCK_SIZE', '8192'),
('INNODB_LOCK_WAIT_TIMEOUT', '50'),
('COMPLETION_TYPE', '0'),
('RELAY_LOG_INDEX', ''),
('COLLATION_SERVER', 'latin1_swedish_ci'),
('SQL_QUOTE_SHOW_CREATE', 'ON'),
('EVENT_SCHEDULER', 'OFF'),
('SQL_LOG_UPDATE', 'ON'),
('COLLATION_DATABASE', 'latin1_swedish_ci'),
('INNODB_USE_LEGACY_CARDINALITY_ALGORITHM', 'ON'),
('FT_MAX_WORD_LEN', '84'),
('LOCKED_IN_MEMORY', 'OFF'),
('CONCURRENT_INSERT', '1'),
('MYISAM_RECOVER_OPTIONS', 'OFF'),
('NET_WRITE_TIMEOUT', '60'),
('REPORT_HOST', ''),
('AUTO_INCREMENT_OFFSET', '1'),
('SSL_KEY', ''),
('FLUSH', 'OFF'),
('CHARACTER_SET_DATABASE', 'latin1'),
('DELAYED_INSERT_LIMIT', '100'),
('SLAVE_SKIP_ERRORS', 'OFF'),
('FT_QUERY_EXPANSION_LIMIT', '20'),
('INSERT_ID', '0'),
('SQL_LOW_PRIORITY_UPDATES', 'OFF'),
('RELAY_LOG_PURGE', 'ON'),
('LANGUAGE', '/usr/share/mysql/english/'),
('SKIP_SHOW_DATABASE', 'OFF'),
('KEY_CACHE_AGE_THRESHOLD', '300'),
('GROUP_CONCAT_MAX_LEN', '1024'),
('JOIN_BUFFER_SIZE', '131072'),
('INNODB_LOG_BUFFER_SIZE', '1048576'),
('LOG', 'OFF'),
('VERSION_COMPILE_MACHINE', 'x86_64'),
('READ_BUFFER_SIZE', '131072'),
('INNODB_MAX_PURGE_LAG', '0'),
('DELAYED_QUEUE_SIZE', '1000'),
('TRANSACTION_PREALLOC_SIZE', '4096'),
('INTERACTIVE_TIMEOUT', '28800'),
('VERSION_COMPILE_OS', 'redhat-linux-gnu'),
('WAIT_TIMEOUT', '28800'),
('SQL_NOTES', 'ON'),
('TABLE_OPEN_CACHE', '64'),
('LOW_PRIORITY_UPDATES', 'OFF'),
('LARGE_PAGE_SIZE', '0'),
('REPORT_PASSWORD', ''),
('INIT_SLAVE', ''),
('MAX_INSERT_DELAYED_THREADS', '20'),
('MAX_BINLOG_SIZE', '1073741824'),
('HAVE_COMPRESS', 'YES'),
('MAX_ERROR_COUNT', '64'),
('TRANSACTION_ALLOC_BLOCK_SIZE', '8192'),
('FT_MIN_WORD_LEN', '4'),
('THREAD_CACHE_SIZE', '0'),
('LOG_WARNINGS', '1'),
('INNODB_DOUBLEWRITE', 'ON'),
('SQL_LOG_OFF', 'OFF'),
('PSEUDO_THREAD_ID', '301786'),
('MAX_LONG_DATA_SIZE', '16777216'),
('DEFAULT_WEEK_FORMAT', '0'),
('INNODB_FLUSH_METHOD', ''),
('LOG_OUTPUT', 'FILE'),
('LOWER_CASE_TABLE_NAMES', '0'),
('MAX_RELAY_LOG_SIZE', '0'),
('MYISAM_STATS_METHOD', 'nulls_unequal'),
('PROTOCOL_VERSION', '10'),
('NET_RETRY_COUNT', '10'),
('HAVE_SYMLINK', 'YES'),
('MAX_SORT_LENGTH', '1024'),
('TIME_ZONE', 'SYSTEM'),
('MAX_HEAP_TABLE_SIZE', '16777216'),
('INNODB_TABLE_LOCKS', 'ON'),
('FT_BOOLEAN_SYNTAX', '+ -><()~*:""&|'),
('INNODB_AUTOEXTEND_INCREMENT', '8'),
('LOG_QUERIES_NOT_USING_INDEXES', 'OFF'),
('MYISAM_DATA_POINTER_SIZE', '6'),
('NET_BUFFER_LENGTH', '16384'),
('INNODB_THREAD_SLEEP_DELAY', '10000'),
('FT_STOPWORD_FILE', '(built-in)'),
('SQL_AUTO_IS_NULL', 'ON'),
('DELAY_KEY_WRITE', 'ON'),
('SLAVE_TRANSACTION_RETRIES', '10'),
('MULTI_RANGE_COUNT', '256'),
('LOG_ERROR', '/var/log/mysqld.log'),
('LONG_QUERY_TIME', '10.000000'),
('GENERAL_LOG', 'OFF'),
('BULK_INSERT_BUFFER_SIZE', '8388608'),
('TABLE_TYPE', 'MyISAM'),
('SLAVE_MAX_ALLOWED_PACKET', '1073741824'),
('QUERY_CACHE_MIN_RES_UNIT', '4096'),
('MYISAM_USE_MMAP', 'OFF'),
('INNODB_STATS_ON_METADATA', 'ON'),
('MAX_BINLOG_CACHE_SIZE', '18446744073709547520'),
('INNODB_ROLLBACK_ON_TIMEOUT', 'OFF'),
('QUERY_CACHE_TYPE', 'ON'),
('PROFILING_HISTORY_SIZE', '15'),
('CHARACTER_SET_FILESYSTEM', 'binary'),
('INNODB_ADDITIONAL_MEM_POOL_SIZE', '1048576'),
('TX_ISOLATION', 'REPEATABLE-READ'),
('READ_RND_BUFFER_SIZE', '262144'),
('THREAD_HANDLING', 'one-thread-per-connection'),
('SECURE_AUTH', 'OFF'),
('BINLOG_DIRECT_NON_TRANSACTIONAL_UPDATES', 'OFF'),
('BIG_TABLES', 'OFF'),
('FLUSH_TIME', '0'),
('SQL_SELECT_LIMIT', '18446744073709551615'),
('HAVE_INNODB', 'YES'),
('DATE_FORMAT', '%Y-%m-%d'),
('OLD_PASSWORDS', 'OFF'),
('READ_ONLY', 'OFF'),
('QUERY_PREALLOC_SIZE', '8192'),
('RAND_SEED1', ''),
('SLOW_QUERY_LOG_FILE', '/var/run/mysqld/mysqld-slow.log'),
('INNODB_DATA_FILE_PATH', 'ibdata1:10M:autoextend'),
('MAX_SEEKS_FOR_KEY', '18446744073709551615'),
('QUERY_CACHE_LIMIT', '1048576'),
('SYSTEM_TIME_ZONE', 'EST'),
('PROFILING', 'OFF'),
('SSL_CERT', ''),
('QUERY_CACHE_SIZE', '0'),
('MYISAM_MAX_SORT_FILE_SIZE', '9223372036853727232'),
('KEY_CACHE_DIVISION_LIMIT', '100'),
('THREAD_STACK', '262144'),
('GENERAL_LOG_FILE', '/var/run/mysqld/mysqld.log'),
('OPEN_FILES_LIMIT', '3750'),
('MYISAM_SORT_BUFFER_SIZE', '8388608'),
('SKIP_NAME_RESOLVE', 'OFF'),
('AUTO_INCREMENT_INCREMENT', '1'),
('LAST_INSERT_ID', '0'),
('TMPDIR', '/tmp'),
('PID_FILE', '/var/run/mysqld/mysqld.pid'),
('EXPIRE_LOGS_DAYS', '0'),
('MAX_TMP_TABLES', '32'),
('HAVE_PARTITIONING', 'YES'),
('MIN_EXAMINED_ROW_LIMIT', '0'),
('FOREIGN_KEY_CHECKS', 'ON'),
('LARGE_FILES_SUPPORT', 'ON'),
('RELAY_LOG_INFO_FILE', 'relay-log.info'),
('SSL_CAPATH', ''),
('INNODB_AUTOINC_LOCK_MODE', '1'),
('VERSION_COMMENT', 'Source distribution'),
('INNODB_COMMIT_CONCURRENCY', '0'),
('OPTIMIZER_SWITCH', 'index_merge=on,index_merge_union=on,index_merge_sort_union=on,index_merge_intersection=on'),
('INNODB_MIRRORED_LOG_GROUPS', '1'),
('OPTIMIZER_PRUNE_LEVEL', '1'),
('UNIQUE_CHECKS', 'ON'),
('QUERY_CACHE_WLOCK_INVALIDATE', 'OFF'),
('VERSION', '5.1.73'),
('MAX_WRITE_LOCK_COUNT', '18446744073709551615'),
('INNODB_SUPPORT_XA', 'ON'),
('TIMED_MUTEXES', 'OFF'),
('INNODB_SYNC_SPIN_LOOPS', '20'),
('INIT_FILE', ''),
('COLLATION_CONNECTION', 'utf8_unicode_ci'),
('LC_TIME_NAMES', 'en_US'),
('HAVE_QUERY_CACHE', 'YES'),
('SERVER_ID', '0'),
('INNODB_ADAPTIVE_HASH_INDEX', 'ON'),
('SKIP_NETWORKING', 'OFF'),
('RPL_RECOVERY_RANK', '0'),
('CHARACTER_SET_SYSTEM', 'utf8'),
('DIV_PRECISION_INCREMENT', '4'),
('INIT_CONNECT', ''),
('DATADIR', '/var/lib/mysql/'),
('OPTIMIZER_SEARCH_DEPTH', '62'),
('INNODB_DATA_HOME_DIR', ''),
('AUTOCOMMIT', 'ON'),
('SKIP_EXTERNAL_LOCKING', 'ON'),
('KEY_CACHE_BLOCK_SIZE', '1024'),
('SQL_SLAVE_SKIP_COUNTER', ''),
('SQL_BIG_TABLES', 'OFF'),
('TIME_FORMAT', '%H:%i:%s'),
('TMP_TABLE_SIZE', '16777216'),
('INNODB_FORCE_RECOVERY', '0'),
('TABLE_LOCK_WAIT_TIMEOUT', '50'),
('INNODB_LOG_FILES_IN_GROUP', '2'),
('CHARACTER_SET_SERVER', 'latin1'),
('ERROR_COUNT', '0'),
('HOSTNAME', 'essay'),
('HAVE_DYNAMIC_LOADING', 'YES'),
('SQL_BUFFER_RESULT', 'OFF'),
('SYNC_BINLOG', '0'),
('LOG_BIN', 'OFF'),
('RELAY_LOG_SPACE_LIMIT', '0'),
('SQL_MODE', ''),
('INNODB_OPEN_FILES', '300'),
('MAX_USER_CONNECTIONS', '25'),
('OLD', 'OFF'),
('SLAVE_EXEC_MODE', 'STRICT'),
('INNODB_MAX_DIRTY_PAGES_PCT', '90'),
('SQL_MAX_JOIN_SIZE', '18446744073709551615'),
('HAVE_COMMUNITY_FEATURES', 'YES'),
('NEW', 'OFF'),
('KEY_BUFFER_SIZE', '8384512'),
('SECURE_FILE_PRIV', ''),
('HAVE_NDBCLUSTER', 'NO'),
('KEEP_FILES_ON_CREATE', 'OFF'),
('REPORT_PORT', '3306'),
('REPORT_USER', ''),
('INNODB_STATS_METHOD', 'nulls_equal'),
('ENGINE_CONDITION_PUSHDOWN', 'ON'),
('INNODB_FAST_SHUTDOWN', '1'),
('SQL_LOG_BIN', 'ON'),
('SSL_CA', ''),
('LOWER_CASE_FILE_SYSTEM', 'OFF'),
('INNODB_THREAD_CONCURRENCY', '8'),
('HAVE_CSV', 'YES'),
('SLAVE_NET_TIMEOUT', '3600'),
('SQL_SAFE_UPDATES', 'OFF'),
('INNODB_BUFFER_POOL_SIZE', '8388608'),
('PRELOAD_BUFFER_SIZE', '32768'),
('LOCAL_INFILE', 'ON'),
('SLAVE_COMPRESSED_PROTOCOL', 'OFF'),
('HAVE_RTREE_KEYS', 'YES'),
('HAVE_GEOMETRY', 'YES'),
('BINLOG_FORMAT', 'STATEMENT'),
('MAX_SP_RECURSION_DEPTH', '0'),
('OLD_ALTER_TABLE', 'OFF'),
('RELAY_LOG', ''),
('MYISAM_MMAP_SIZE', '18446744073709551615'),
('PLUGIN_DIR', '/usr/lib64/mysql/plugin'),
('LOG_SLOW_QUERIES', 'OFF'),
('IGNORE_BUILTIN_INNODB', 'OFF'),
('TIMESTAMP', '1461522044'),
('NET_READ_TIMEOUT', '30'),
('MAX_DELAYED_THREADS', '20'),
('SYNC_FRM', 'ON'),
('DATETIME_FORMAT', '%Y-%m-%d %H:%i:%s'),
('SLOW_QUERY_LOG', 'OFF'),
('INNODB_FLUSH_LOG_AT_TRX_COMMIT', '1'),
('WARNING_COUNT', '0'),
('INNODB_FILE_IO_THREADS', '4'),
('MAX_ALLOWED_PACKET', '16777216'),
('LICENSE', 'GPL'),
('SQL_BIG_SELECTS', 'ON'),
('RANGE_ALLOC_BLOCK_SIZE', '4096'),
('INNODB_CHECKSUMS', 'ON'),
('PORT', '3306'),
('INNODB_LOCKS_UNSAFE_FOR_BINLOG', 'OFF'),
('HAVE_SSL', 'DISABLED'),
('INNODB_LOG_FILE_SIZE', '5242880'),
('LOG_BIN_TRUST_FUNCTION_CREATORS', 'OFF'),
('LOG_SLAVE_UPDATES', 'OFF'),
('MAX_JOIN_SIZE', '18446744073709551615'),
('SORT_BUFFER_SIZE', '2097144'),
('HAVE_OPENSSL', 'DISABLED'),
('INNODB_FILE_PER_TABLE', 'OFF'),
('INNODB_LOG_GROUP_HOME_DIR', './'),
('SOCKET', '/var/lib/mysql/mysql.sock'),
('CHARACTER_SET_CLIENT', 'utf8'),
('RAND_SEED2', ''),
('IDENTITY', '0'),
('SQL_WARNINGS', 'OFF'),
('SLAVE_LOAD_TMPDIR', '/tmp');

-- --------------------------------------------------------

--
-- Table structure for table `STATISTICS`
--

DROP TABLE IF EXISTS `STATISTICS`;
CREATE TEMPORARY TABLE `STATISTICS` (
  `TABLE_CATALOG` varchar(512) DEFAULT NULL,
  `TABLE_SCHEMA` varchar(64) NOT NULL DEFAULT '',
  `TABLE_NAME` varchar(64) NOT NULL DEFAULT '',
  `NON_UNIQUE` bigint(1) NOT NULL DEFAULT '0',
  `INDEX_SCHEMA` varchar(64) NOT NULL DEFAULT '',
  `INDEX_NAME` varchar(64) NOT NULL DEFAULT '',
  `SEQ_IN_INDEX` bigint(2) NOT NULL DEFAULT '0',
  `COLUMN_NAME` varchar(64) NOT NULL DEFAULT '',
  `COLLATION` varchar(1) DEFAULT NULL,
  `CARDINALITY` bigint(21) DEFAULT NULL,
  `SUB_PART` bigint(3) DEFAULT NULL,
  `PACKED` varchar(10) DEFAULT NULL,
  `NULLABLE` varchar(3) NOT NULL DEFAULT '',
  `INDEX_TYPE` varchar(16) NOT NULL DEFAULT '',
  `COMMENT` varchar(16) DEFAULT NULL
) ENGINE=MEMORY DEFAULT CHARSET=utf8;

--
-- Dumping data for table `STATISTICS`
--

INSERT INTO `STATISTICS` (`TABLE_CATALOG`, `TABLE_SCHEMA`, `TABLE_NAME`, `NON_UNIQUE`, `INDEX_SCHEMA`, `INDEX_NAME`, `SEQ_IN_INDEX`, `COLUMN_NAME`, `COLLATION`, `CARDINALITY`, `SUB_PART`, `PACKED`, `NULLABLE`, `INDEX_TYPE`, `COMMENT`) VALUES
(NULL, 'cs4400_Team_20', 'Customer', 0, 'cs4400_Team_20', 'PRIMARY', 1, 'Username', 'A', 20, NULL, NULL, '', 'BTREE', ''),
(NULL, 'cs4400_Team_20', 'Customer', 0, 'cs4400_Team_20', 'Email', 1, 'Email', 'A', 20, NULL, NULL, '', 'BTREE', ''),
(NULL, 'cs4400_Team_20', 'Manager', 0, 'cs4400_Team_20', 'PRIMARY', 1, 'Username', 'A', 5, NULL, NULL, '', 'BTREE', ''),
(NULL, 'cs4400_Team_20', 'PaymentInfo', 0, 'cs4400_Team_20', 'PRIMARY', 1, 'CardNum', 'A', 20, NULL, NULL, '', 'BTREE', ''),
(NULL, 'cs4400_Team_20', 'PaymentInfo', 1, 'cs4400_Team_20', 'Username', 1, 'Username', 'A', 10, NULL, NULL, '', 'BTREE', ''),
(NULL, 'cs4400_Team_20', 'Reservation', 0, 'cs4400_Team_20', 'PRIMARY', 1, 'ReserveID', 'A', 40, NULL, NULL, '', 'BTREE', ''),
(NULL, 'cs4400_Team_20', 'Reservation', 1, 'cs4400_Team_20', 'Username', 1, 'Username', 'A', 10, NULL, NULL, '', 'BTREE', ''),
(NULL, 'cs4400_Team_20', 'Reservation', 1, 'cs4400_Team_20', 'CardNum', 1, 'CardNum', 'A', 20, NULL, NULL, '', 'BTREE', ''),
(NULL, 'cs4400_Team_20', 'Reserve', 0, 'cs4400_Team_20', 'PRIMARY', 1, 'ReserveID', 'A', 68, NULL, NULL, '', 'BTREE', ''),
(NULL, 'cs4400_Team_20', 'Reserve', 0, 'cs4400_Team_20', 'PRIMARY', 2, 'TrainNum', 'A', 68, NULL, NULL, '', 'BTREE', ''),
(NULL, 'cs4400_Team_20', 'Reserve', 1, 'cs4400_Team_20', 'TrainNum', 1, 'TrainNum', 'A', 11, NULL, NULL, '', 'BTREE', ''),
(NULL, 'cs4400_Team_20', 'Review', 0, 'cs4400_Team_20', 'PRIMARY', 1, 'ReviewNum', 'A', 21, NULL, NULL, '', 'BTREE', ''),
(NULL, 'cs4400_Team_20', 'Review', 1, 'cs4400_Team_20', 'Username', 1, 'Username', 'A', 21, NULL, NULL, '', 'BTREE', ''),
(NULL, 'cs4400_Team_20', 'Review', 1, 'cs4400_Team_20', 'TrainNum', 1, 'TrainNum', 'A', 10, NULL, NULL, '', 'BTREE', ''),
(NULL, 'cs4400_Team_20', 'Station', 0, 'cs4400_Team_20', 'PRIMARY', 1, 'StationName', 'A', 10, NULL, NULL, '', 'BTREE', ''),
(NULL, 'cs4400_Team_20', 'Stop', 0, 'cs4400_Team_20', 'PRIMARY', 1, 'TrainNum', 'A', 8, NULL, NULL, '', 'BTREE', ''),
(NULL, 'cs4400_Team_20', 'Stop', 0, 'cs4400_Team_20', 'PRIMARY', 2, 'StationName', 'A', 32, NULL, NULL, '', 'BTREE', ''),
(NULL, 'cs4400_Team_20', 'Stop', 1, 'cs4400_Team_20', 'StationName', 1, 'StationName', 'A', 10, NULL, NULL, '', 'BTREE', ''),
(NULL, 'cs4400_Team_20', 'SystemInfo', 0, 'cs4400_Team_20', 'PRIMARY', 1, 'MaxNumOfBaggage', 'A', 1, NULL, NULL, '', 'BTREE', ''),
(NULL, 'cs4400_Team_20', 'TrainRoute', 0, 'cs4400_Team_20', 'PRIMARY', 1, 'TrainNum', 'A', 8, NULL, NULL, '', 'BTREE', ''),
(NULL, 'cs4400_Team_20', 'User', 0, 'cs4400_Team_20', 'PRIMARY', 1, 'Username', 'A', 25, NULL, NULL, '', 'BTREE', '');

-- --------------------------------------------------------

--
-- Table structure for table `TABLES`
--

DROP TABLE IF EXISTS `TABLES`;
CREATE TEMPORARY TABLE `TABLES` (
  `TABLE_CATALOG` varchar(512) DEFAULT NULL,
  `TABLE_SCHEMA` varchar(64) NOT NULL DEFAULT '',
  `TABLE_NAME` varchar(64) NOT NULL DEFAULT '',
  `TABLE_TYPE` varchar(64) NOT NULL DEFAULT '',
  `ENGINE` varchar(64) DEFAULT NULL,
  `VERSION` bigint(21) unsigned DEFAULT NULL,
  `ROW_FORMAT` varchar(10) DEFAULT NULL,
  `TABLE_ROWS` bigint(21) unsigned DEFAULT NULL,
  `AVG_ROW_LENGTH` bigint(21) unsigned DEFAULT NULL,
  `DATA_LENGTH` bigint(21) unsigned DEFAULT NULL,
  `MAX_DATA_LENGTH` bigint(21) unsigned DEFAULT NULL,
  `INDEX_LENGTH` bigint(21) unsigned DEFAULT NULL,
  `DATA_FREE` bigint(21) unsigned DEFAULT NULL,
  `AUTO_INCREMENT` bigint(21) unsigned DEFAULT NULL,
  `CREATE_TIME` datetime DEFAULT NULL,
  `UPDATE_TIME` datetime DEFAULT NULL,
  `CHECK_TIME` datetime DEFAULT NULL,
  `TABLE_COLLATION` varchar(32) DEFAULT NULL,
  `CHECKSUM` bigint(21) unsigned DEFAULT NULL,
  `CREATE_OPTIONS` varchar(255) DEFAULT NULL,
  `TABLE_COMMENT` varchar(80) NOT NULL DEFAULT ''
) ENGINE=MEMORY DEFAULT CHARSET=utf8;

--
-- Dumping data for table `TABLES`
--

INSERT INTO `TABLES` (`TABLE_CATALOG`, `TABLE_SCHEMA`, `TABLE_NAME`, `TABLE_TYPE`, `ENGINE`, `VERSION`, `ROW_FORMAT`, `TABLE_ROWS`, `AVG_ROW_LENGTH`, `DATA_LENGTH`, `MAX_DATA_LENGTH`, `INDEX_LENGTH`, `DATA_FREE`, `AUTO_INCREMENT`, `CREATE_TIME`, `UPDATE_TIME`, `CHECK_TIME`, `TABLE_COLLATION`, `CHECKSUM`, `CREATE_OPTIONS`, `TABLE_COMMENT`) VALUES
(NULL, 'information_schema', 'CHARACTER_SETS', 'SYSTEM VIEW', 'MEMORY', 10, 'Fixed', NULL, 384, 0, 16434816, 0, 0, NULL, '2016-04-24 14:20:44', NULL, NULL, 'utf8_general_ci', NULL, 'max_rows=43690', ''),
(NULL, 'information_schema', 'COLLATIONS', 'SYSTEM VIEW', 'MEMORY', 10, 'Fixed', NULL, 231, 0, 16704765, 0, 0, NULL, '2016-04-24 14:20:44', NULL, NULL, 'utf8_general_ci', NULL, 'max_rows=72628', ''),
(NULL, 'information_schema', 'COLLATION_CHARACTER_SET_APPLICABILITY', 'SYSTEM VIEW', 'MEMORY', 10, 'Fixed', NULL, 195, 0, 16357770, 0, 0, NULL, '2016-04-24 14:20:44', NULL, NULL, 'utf8_general_ci', NULL, 'max_rows=86037', ''),
(NULL, 'information_schema', 'COLUMNS', 'SYSTEM VIEW', 'MyISAM', 10, 'Dynamic', NULL, 0, 0, 281474976710655, 1024, 0, NULL, '2016-04-24 14:20:44', '2016-04-24 14:20:44', NULL, 'utf8_general_ci', NULL, 'max_rows=4560', ''),
(NULL, 'information_schema', 'COLUMN_PRIVILEGES', 'SYSTEM VIEW', 'MEMORY', 10, 'Fixed', NULL, 2565, 0, 16757145, 0, 0, NULL, '2016-04-24 14:20:44', NULL, NULL, 'utf8_general_ci', NULL, 'max_rows=6540', ''),
(NULL, 'information_schema', 'ENGINES', 'SYSTEM VIEW', 'MEMORY', 10, 'Fixed', NULL, 490, 0, 16574250, 0, 0, NULL, '2016-04-24 14:20:44', NULL, NULL, 'utf8_general_ci', NULL, 'max_rows=34239', ''),
(NULL, 'information_schema', 'EVENTS', 'SYSTEM VIEW', 'MyISAM', 10, 'Dynamic', NULL, 0, 0, 281474976710655, 1024, 0, NULL, '2016-04-24 14:20:44', '2016-04-24 14:20:44', NULL, 'utf8_general_ci', NULL, 'max_rows=618', ''),
(NULL, 'information_schema', 'FILES', 'SYSTEM VIEW', 'MEMORY', 10, 'Fixed', NULL, 2677, 0, 16758020, 0, 0, NULL, '2016-04-24 14:20:44', NULL, NULL, 'utf8_general_ci', NULL, 'max_rows=6267', ''),
(NULL, 'information_schema', 'GLOBAL_STATUS', 'SYSTEM VIEW', 'MEMORY', 10, 'Fixed', NULL, 3268, 0, 16755036, 0, 0, NULL, '2016-04-24 14:20:44', NULL, NULL, 'utf8_general_ci', NULL, 'max_rows=5133', ''),
(NULL, 'information_schema', 'GLOBAL_VARIABLES', 'SYSTEM VIEW', 'MEMORY', 10, 'Fixed', NULL, 3268, 0, 16755036, 0, 0, NULL, '2016-04-24 14:20:44', NULL, NULL, 'utf8_general_ci', NULL, 'max_rows=5133', ''),
(NULL, 'information_schema', 'KEY_COLUMN_USAGE', 'SYSTEM VIEW', 'MEMORY', 10, 'Fixed', NULL, 4637, 0, 16762755, 0, 0, NULL, '2016-04-24 14:20:44', NULL, NULL, 'utf8_general_ci', NULL, 'max_rows=3618', ''),
(NULL, 'information_schema', 'PARTITIONS', 'SYSTEM VIEW', 'MyISAM', 10, 'Dynamic', NULL, 0, 0, 281474976710655, 1024, 0, NULL, '2016-04-24 14:20:44', '2016-04-24 14:20:44', NULL, 'utf8_general_ci', NULL, 'max_rows=5612', ''),
(NULL, 'information_schema', 'PLUGINS', 'SYSTEM VIEW', 'MyISAM', 10, 'Dynamic', NULL, 0, 0, 281474976710655, 1024, 0, NULL, '2016-04-24 14:20:44', '2016-04-24 14:20:44', NULL, 'utf8_general_ci', NULL, 'max_rows=13025', ''),
(NULL, 'information_schema', 'PROCESSLIST', 'SYSTEM VIEW', 'MyISAM', 10, 'Dynamic', NULL, 0, 0, 281474976710655, 1024, 0, NULL, '2016-04-24 14:20:44', '2016-04-24 14:20:44', NULL, 'utf8_general_ci', NULL, 'max_rows=23899', ''),
(NULL, 'information_schema', 'PROFILING', 'SYSTEM VIEW', 'MEMORY', 10, 'Fixed', NULL, 308, 0, 16562084, 0, 0, NULL, '2016-04-24 14:20:44', NULL, NULL, 'utf8_general_ci', NULL, 'max_rows=54471', ''),
(NULL, 'information_schema', 'REFERENTIAL_CONSTRAINTS', 'SYSTEM VIEW', 'MEMORY', 10, 'Fixed', NULL, 4814, 0, 16767162, 0, 0, NULL, '2016-04-24 14:20:44', NULL, NULL, 'utf8_general_ci', NULL, 'max_rows=3485', ''),
(NULL, 'information_schema', 'ROUTINES', 'SYSTEM VIEW', 'MyISAM', 10, 'Dynamic', NULL, 0, 0, 281474976710655, 1024, 0, NULL, '2016-04-24 14:20:44', '2016-04-24 14:20:44', NULL, 'utf8_general_ci', NULL, 'max_rows=588', ''),
(NULL, 'information_schema', 'SCHEMATA', 'SYSTEM VIEW', 'MEMORY', 10, 'Fixed', NULL, 3464, 0, 16738048, 0, 0, NULL, '2016-04-24 14:20:44', NULL, NULL, 'utf8_general_ci', NULL, 'max_rows=4843', ''),
(NULL, 'information_schema', 'SCHEMA_PRIVILEGES', 'SYSTEM VIEW', 'MEMORY', 10, 'Fixed', NULL, 2179, 0, 16736899, 0, 0, NULL, '2016-04-24 14:20:44', NULL, NULL, 'utf8_general_ci', NULL, 'max_rows=7699', ''),
(NULL, 'information_schema', 'SESSION_STATUS', 'SYSTEM VIEW', 'MEMORY', 10, 'Fixed', NULL, 3268, 0, 16755036, 0, 0, NULL, '2016-04-24 14:20:44', NULL, NULL, 'utf8_general_ci', NULL, 'max_rows=5133', ''),
(NULL, 'information_schema', 'SESSION_VARIABLES', 'SYSTEM VIEW', 'MEMORY', 10, 'Fixed', NULL, 3268, 0, 16755036, 0, 0, NULL, '2016-04-24 14:20:44', NULL, NULL, 'utf8_general_ci', NULL, 'max_rows=5133', ''),
(NULL, 'information_schema', 'STATISTICS', 'SYSTEM VIEW', 'MEMORY', 10, 'Fixed', NULL, 2679, 0, 16770540, 0, 0, NULL, '2016-04-24 14:20:44', NULL, NULL, 'utf8_general_ci', NULL, 'max_rows=6262', ''),
(NULL, 'information_schema', 'TABLES', 'SYSTEM VIEW', 'MEMORY', 10, 'Fixed', NULL, 3545, 0, 16743035, 0, 0, NULL, '2016-04-24 14:20:44', NULL, NULL, 'utf8_general_ci', NULL, 'max_rows=4732', ''),
(NULL, 'information_schema', 'TABLE_CONSTRAINTS', 'SYSTEM VIEW', 'MEMORY', 10, 'Fixed', NULL, 2504, 0, 16721712, 0, 0, NULL, '2016-04-24 14:20:44', NULL, NULL, 'utf8_general_ci', NULL, 'max_rows=6700', ''),
(NULL, 'information_schema', 'TABLE_PRIVILEGES', 'SYSTEM VIEW', 'MEMORY', 10, 'Fixed', NULL, 2372, 0, 16748692, 0, 0, NULL, '2016-04-24 14:20:44', NULL, NULL, 'utf8_general_ci', NULL, 'max_rows=7073', ''),
(NULL, 'information_schema', 'TRIGGERS', 'SYSTEM VIEW', 'MyISAM', 10, 'Dynamic', NULL, 0, 0, 281474976710655, 1024, 0, NULL, '2016-04-24 14:20:44', '2016-04-24 14:20:44', NULL, 'utf8_general_ci', NULL, 'max_rows=569', ''),
(NULL, 'information_schema', 'USER_PRIVILEGES', 'SYSTEM VIEW', 'MEMORY', 10, 'Fixed', NULL, 1986, 0, 16726092, 0, 0, NULL, '2016-04-24 14:20:44', NULL, NULL, 'utf8_general_ci', NULL, 'max_rows=8447', ''),
(NULL, 'information_schema', 'VIEWS', 'SYSTEM VIEW', 'MyISAM', 10, 'Dynamic', NULL, 0, 0, 281474976710655, 1024, 0, NULL, '2016-04-24 14:20:44', '2016-04-24 14:20:44', NULL, 'utf8_general_ci', NULL, 'max_rows=6932', ''),
(NULL, 'cs4400_Team_20', 'Customer', 'BASE TABLE', 'MyISAM', 10, 'Dynamic', 20, 28, 724, 281474976710655, 3072, 164, NULL, '2016-04-13 19:26:38', '2016-04-24 00:26:40', NULL, 'latin1_swedish_ci', NULL, '', ''),
(NULL, 'cs4400_Team_20', 'Manager', 'BASE TABLE', 'MyISAM', 10, 'Dynamic', 5, 20, 100, 281474976710655, 2048, 0, NULL, '2016-04-13 19:26:46', '2016-04-15 16:43:51', NULL, 'latin1_swedish_ci', NULL, '', ''),
(NULL, 'cs4400_Team_20', 'PaymentInfo', 'BASE TABLE', 'MyISAM', 10, 'Dynamic', 20, 58, 2072, 281474976710655, 3072, 904, NULL, '2016-04-13 19:27:03', '2016-04-24 11:41:39', '2016-04-24 05:22:11', 'latin1_swedish_ci', NULL, '', ''),
(NULL, 'cs4400_Team_20', 'Reservation', 'BASE TABLE', 'MyISAM', 10, 'Dynamic', 40, 32, 1280, 281474976710655, 4096, 0, NULL, '2016-04-24 14:07:21', '2016-04-24 14:18:56', '2016-04-24 14:12:14', 'latin1_swedish_ci', NULL, '', ''),
(NULL, 'cs4400_Team_20', 'Reserve', 'BASE TABLE', 'MyISAM', 10, 'Dynamic', 68, 64, 4372, 281474976710655, 3072, 0, NULL, '2016-04-23 20:51:39', '2016-04-24 13:52:26', '2016-04-24 05:49:43', 'latin1_swedish_ci', NULL, '', ''),
(NULL, 'cs4400_Team_20', 'Review', 'BASE TABLE', 'MyISAM', 10, 'Dynamic', 21, 53, 1116, 281474976710655, 4096, 0, 31, '2016-04-16 17:34:40', '2016-04-24 11:22:40', '2016-04-24 05:19:30', 'latin1_swedish_ci', NULL, '', ''),
(NULL, 'cs4400_Team_20', 'Station', 'BASE TABLE', 'MyISAM', 10, 'Dynamic', 10, 47, 472, 281474976710655, 2048, 0, NULL, '2016-04-13 19:27:23', '2016-04-24 05:59:08', NULL, 'latin1_swedish_ci', NULL, '', ''),
(NULL, 'cs4400_Team_20', 'Stop', 'BASE TABLE', 'MyISAM', 10, 'Dynamic', 32, 44, 2256, 281474976710655, 5120, 844, NULL, '2016-04-15 20:51:19', '2016-04-24 10:46:21', '2016-04-24 05:45:25', 'latin1_swedish_ci', NULL, '', ''),
(NULL, 'cs4400_Team_20', 'SystemInfo', 'BASE TABLE', 'MyISAM', 10, 'Fixed', 1, 15, 30, 4222124650659839, 2048, 15, NULL, '2016-04-13 19:27:36', '2016-04-15 17:22:14', NULL, 'latin1_swedish_ci', NULL, '', ''),
(NULL, 'cs4400_Team_20', 'Tickets', 'VIEW', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'VIEW'),
(NULL, 'cs4400_Team_20', 'TrainRoute', 'BASE TABLE', 'MyISAM', 10, 'Dynamic', 8, 20, 160, 281474976710655, 2048, 0, NULL, '2016-04-24 05:50:07', '2016-04-24 05:50:07', NULL, 'latin1_swedish_ci', NULL, '', ''),
(NULL, 'cs4400_Team_20', 'User', 'BASE TABLE', 'MyISAM', 10, 'Dynamic', 25, 28, 880, 281474976710655, 2048, 180, NULL, '2016-04-13 19:26:16', '2016-04-24 00:28:10', NULL, 'latin1_swedish_ci', NULL, '', '');

-- --------------------------------------------------------

--
-- Table structure for table `TABLE_CONSTRAINTS`
--

DROP TABLE IF EXISTS `TABLE_CONSTRAINTS`;
CREATE TEMPORARY TABLE `TABLE_CONSTRAINTS` (
  `CONSTRAINT_CATALOG` varchar(512) DEFAULT NULL,
  `CONSTRAINT_SCHEMA` varchar(64) NOT NULL DEFAULT '',
  `CONSTRAINT_NAME` varchar(64) NOT NULL DEFAULT '',
  `TABLE_SCHEMA` varchar(64) NOT NULL DEFAULT '',
  `TABLE_NAME` varchar(64) NOT NULL DEFAULT '',
  `CONSTRAINT_TYPE` varchar(64) NOT NULL DEFAULT ''
) ENGINE=MEMORY DEFAULT CHARSET=utf8;

--
-- Dumping data for table `TABLE_CONSTRAINTS`
--

INSERT INTO `TABLE_CONSTRAINTS` (`CONSTRAINT_CATALOG`, `CONSTRAINT_SCHEMA`, `CONSTRAINT_NAME`, `TABLE_SCHEMA`, `TABLE_NAME`, `CONSTRAINT_TYPE`) VALUES
(NULL, 'cs4400_Team_20', 'PRIMARY', 'cs4400_Team_20', 'Customer', 'PRIMARY KEY'),
(NULL, 'cs4400_Team_20', 'Email', 'cs4400_Team_20', 'Customer', 'UNIQUE'),
(NULL, 'cs4400_Team_20', 'PRIMARY', 'cs4400_Team_20', 'Manager', 'PRIMARY KEY'),
(NULL, 'cs4400_Team_20', 'PRIMARY', 'cs4400_Team_20', 'PaymentInfo', 'PRIMARY KEY'),
(NULL, 'cs4400_Team_20', 'PRIMARY', 'cs4400_Team_20', 'Reservation', 'PRIMARY KEY'),
(NULL, 'cs4400_Team_20', 'PRIMARY', 'cs4400_Team_20', 'Reserve', 'PRIMARY KEY'),
(NULL, 'cs4400_Team_20', 'PRIMARY', 'cs4400_Team_20', 'Review', 'PRIMARY KEY'),
(NULL, 'cs4400_Team_20', 'PRIMARY', 'cs4400_Team_20', 'Station', 'PRIMARY KEY'),
(NULL, 'cs4400_Team_20', 'PRIMARY', 'cs4400_Team_20', 'Stop', 'PRIMARY KEY'),
(NULL, 'cs4400_Team_20', 'PRIMARY', 'cs4400_Team_20', 'SystemInfo', 'PRIMARY KEY'),
(NULL, 'cs4400_Team_20', 'PRIMARY', 'cs4400_Team_20', 'TrainRoute', 'PRIMARY KEY'),
(NULL, 'cs4400_Team_20', 'PRIMARY', 'cs4400_Team_20', 'User', 'PRIMARY KEY');

-- --------------------------------------------------------

--
-- Table structure for table `TABLE_PRIVILEGES`
--

DROP TABLE IF EXISTS `TABLE_PRIVILEGES`;
CREATE TEMPORARY TABLE `TABLE_PRIVILEGES` (
  `GRANTEE` varchar(81) NOT NULL DEFAULT '',
  `TABLE_CATALOG` varchar(512) DEFAULT NULL,
  `TABLE_SCHEMA` varchar(64) NOT NULL DEFAULT '',
  `TABLE_NAME` varchar(64) NOT NULL DEFAULT '',
  `PRIVILEGE_TYPE` varchar(64) NOT NULL DEFAULT '',
  `IS_GRANTABLE` varchar(3) NOT NULL DEFAULT ''
) ENGINE=MEMORY DEFAULT CHARSET=utf8;

--
-- Dumping data for table `TABLE_PRIVILEGES`
--


-- --------------------------------------------------------

--
-- Table structure for table `TRIGGERS`
--

DROP TABLE IF EXISTS `TRIGGERS`;
CREATE TEMPORARY TABLE `TRIGGERS` (
  `TRIGGER_CATALOG` varchar(512) DEFAULT NULL,
  `TRIGGER_SCHEMA` varchar(64) NOT NULL DEFAULT '',
  `TRIGGER_NAME` varchar(64) NOT NULL DEFAULT '',
  `EVENT_MANIPULATION` varchar(6) NOT NULL DEFAULT '',
  `EVENT_OBJECT_CATALOG` varchar(512) DEFAULT NULL,
  `EVENT_OBJECT_SCHEMA` varchar(64) NOT NULL DEFAULT '',
  `EVENT_OBJECT_TABLE` varchar(64) NOT NULL DEFAULT '',
  `ACTION_ORDER` bigint(4) NOT NULL DEFAULT '0',
  `ACTION_CONDITION` longtext,
  `ACTION_STATEMENT` longtext NOT NULL,
  `ACTION_ORIENTATION` varchar(9) NOT NULL DEFAULT '',
  `ACTION_TIMING` varchar(6) NOT NULL DEFAULT '',
  `ACTION_REFERENCE_OLD_TABLE` varchar(64) DEFAULT NULL,
  `ACTION_REFERENCE_NEW_TABLE` varchar(64) DEFAULT NULL,
  `ACTION_REFERENCE_OLD_ROW` varchar(3) NOT NULL DEFAULT '',
  `ACTION_REFERENCE_NEW_ROW` varchar(3) NOT NULL DEFAULT '',
  `CREATED` datetime DEFAULT NULL,
  `SQL_MODE` varchar(8192) NOT NULL DEFAULT '',
  `DEFINER` varchar(77) NOT NULL DEFAULT '',
  `CHARACTER_SET_CLIENT` varchar(32) NOT NULL DEFAULT '',
  `COLLATION_CONNECTION` varchar(32) NOT NULL DEFAULT '',
  `DATABASE_COLLATION` varchar(32) NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `TRIGGERS`
--


-- --------------------------------------------------------

--
-- Table structure for table `USER_PRIVILEGES`
--

DROP TABLE IF EXISTS `USER_PRIVILEGES`;
CREATE TEMPORARY TABLE `USER_PRIVILEGES` (
  `GRANTEE` varchar(81) NOT NULL DEFAULT '',
  `TABLE_CATALOG` varchar(512) DEFAULT NULL,
  `PRIVILEGE_TYPE` varchar(64) NOT NULL DEFAULT '',
  `IS_GRANTABLE` varchar(3) NOT NULL DEFAULT ''
) ENGINE=MEMORY DEFAULT CHARSET=utf8;

--
-- Dumping data for table `USER_PRIVILEGES`
--

INSERT INTO `USER_PRIVILEGES` (`GRANTEE`, `TABLE_CATALOG`, `PRIVILEGE_TYPE`, `IS_GRANTABLE`) VALUES
('''cs4400_Team_20''@''%''', NULL, 'USAGE', 'NO');

-- --------------------------------------------------------

--
-- Table structure for table `VIEWS`
--

DROP TABLE IF EXISTS `VIEWS`;
CREATE TEMPORARY TABLE `VIEWS` (
  `TABLE_CATALOG` varchar(512) DEFAULT NULL,
  `TABLE_SCHEMA` varchar(64) NOT NULL DEFAULT '',
  `TABLE_NAME` varchar(64) NOT NULL DEFAULT '',
  `VIEW_DEFINITION` longtext NOT NULL,
  `CHECK_OPTION` varchar(8) NOT NULL DEFAULT '',
  `IS_UPDATABLE` varchar(3) NOT NULL DEFAULT '',
  `DEFINER` varchar(77) NOT NULL DEFAULT '',
  `SECURITY_TYPE` varchar(7) NOT NULL DEFAULT '',
  `CHARACTER_SET_CLIENT` varchar(32) NOT NULL DEFAULT '',
  `COLLATION_CONNECTION` varchar(32) NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `VIEWS`
--

INSERT INTO `VIEWS` (`TABLE_CATALOG`, `TABLE_SCHEMA`, `TABLE_NAME`, `VIEW_DEFINITION`, `CHECK_OPTION`, `IS_UPDATABLE`, `DEFINER`, `SECURITY_TYPE`, `CHARACTER_SET_CLIENT`, `COLLATION_CONNECTION`) VALUES
(NULL, 'cs4400_Team_20', 'Tickets', 'select `cs4400_Team_20`.`Reserve`.`ReserveID` AS `ReserveID`,`cs4400_Team_20`.`Reserve`.`TrainNum` AS `TrainNum`,`cs4400_Team_20`.`Reserve`.`Class` AS `Class`,`cs4400_Team_20`.`Reserve`.`DepartureDate` AS `DepartureDate`,`cs4400_Team_20`.`Reserve`.`PassengerName` AS `PassengerName`,`cs4400_Team_20`.`Reserve`.`NumOfBaggage` AS `NumOfBaggage`,`cs4400_Team_20`.`Reserve`.`DepartFrom` AS `DepartFrom`,`cs4400_Team_20`.`Reserve`.`ArriveAt` AS `ArriveAt`,`cs4400_Team_20`.`Reserve`.`UpdateTimes` AS `UpdateTimes` from `cs4400_Team_20`.`Reserve` where (`cs4400_Team_20`.`Reserve`.`ReserveID` = ''1'')', 'NONE', 'YES', 'cs4400_Team_20@%', 'DEFINER', 'utf8', 'utf8_unicode_ci');

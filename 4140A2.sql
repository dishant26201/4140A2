-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:8889
-- Generation Time: Oct 19, 2022 at 08:02 PM
-- Server version: 5.7.34
-- PHP Version: 8.0.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `4140A2`
--

-- --------------------------------------------------------

--
-- Table structure for table `Clients009`
--

CREATE TABLE `Clients009` (
  `clientId009` varchar(255) NOT NULL,
  `clientName009` varchar(255) NOT NULL,
  `clientCity009` varchar(255) NOT NULL,
  `clientPassword009` varchar(255) NOT NULL,
  `moneyOwed009` decimal(10,0) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `Clients009`
--

INSERT INTO `Clients009` (`clientId009`, `clientName009`, `clientCity009`, `clientPassword009`, `moneyOwed009`) VALUES
('B00843009', 'John Mayer', 'Los Angeles', 'Johnmayer123.', '5'),
('B00843010', 'Paul McCartney', 'Liverpool', 'Paul123.', '10'),
('B00843011', 'Michael Buble', 'Vancouver', 'Buble123.', '15');

-- --------------------------------------------------------

--
-- Table structure for table `Lines009`
--

CREATE TABLE `Lines009` (
  `poNo009` int(11) NOT NULL,
  `lineNo009` int(11) NOT NULL,
  `partNo009` int(11) NOT NULL,
  `qty009` int(11) NOT NULL,
  `priceOrdered009` decimal(10,0) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `Parts009`
--

CREATE TABLE `Parts009` (
  `partNo009` int(11) NOT NULL,
  `partName009` varchar(255) NOT NULL,
  `currentPrice009` decimal(10,0) NOT NULL,
  `qoh009` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `Parts009`
--

INSERT INTO `Parts009` (`partNo009`, `partName009`, `currentPrice009`, `qoh009`) VALUES
(1, 'Acoustic Guitar', '30', 5),
(2, 'Electric Guitar', '35', 5),
(3, 'Guitar Amp', '20', 10),
(4, 'Keyboard', '25', 7),
(5, 'Drums', '40', 4),
(6, 'Mic', '10', 10),
(7, 'Guitar Pedals', '10', 10),
(8, 'Bass Guitar', '25', 5),
(9, 'Wires', '5', 20),
(10, 'Percussion', '40', 2);

-- --------------------------------------------------------

--
-- Table structure for table `POs009`
--

CREATE TABLE `POs009` (
  `poNo009` int(11) NOT NULL,
  `clientCompID009` varchar(255) NOT NULL,
  `dateOfPO009` date NOT NULL,
  `status009` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `POs009`
--

INSERT INTO `POs009` (`poNo009`, `clientCompID009`, `dateOfPO009`, `status009`) VALUES
(1, 'B00843009', '2022-10-08', 'Active');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `Clients009`
--
ALTER TABLE `Clients009`
  ADD PRIMARY KEY (`clientId009`);

--
-- Indexes for table `Lines009`
--
ALTER TABLE `Lines009`
  ADD PRIMARY KEY (`poNo009`,`lineNo009`);

--
-- Indexes for table `Parts009`
--
ALTER TABLE `Parts009`
  ADD PRIMARY KEY (`partNo009`);

--
-- Indexes for table `POs009`
--
ALTER TABLE `POs009`
  ADD PRIMARY KEY (`poNo009`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 27, 2021 at 03:27 PM
-- Server version: 10.4.14-MariaDB
-- PHP Version: 7.4.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `warehouse`
--

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

CREATE TABLE `cart` (
  `id` int(11) NOT NULL,
  `name` varchar(24) NOT NULL,
  `quantity` int(11) NOT NULL DEFAULT 1,
  `price` float NOT NULL DEFAULT 0,
  `safetyStock` int(11) NOT NULL DEFAULT 0,
  `note` text DEFAULT NULL,
  `productId` int(11) NOT NULL DEFAULT 0,
  `createDate` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `history`
--

CREATE TABLE `history` (
  `id` int(11) NOT NULL,
  `type` varchar(24) NOT NULL,
  `status` varchar(24) NOT NULL,
  `note` varchar(24) DEFAULT 'none',
  `createDate` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `history`
--

INSERT INTO `history` (`id`, `type`, `status`, `note`, `createDate`) VALUES
(73, 'IMPORT', 'ACCEPT', 'none', '2021-02-27 20:41:43'),
(74, 'IMPORT', 'ACCEPT', 'none', '2021-02-27 20:41:56'),
(75, 'IMPORT', 'ACCEPT', 'none', '2021-02-27 20:42:25');

-- --------------------------------------------------------

--
-- Table structure for table `history_item`
--

CREATE TABLE `history_item` (
  `id` int(11) NOT NULL,
  `historyId` int(11) NOT NULL,
  `productId` int(11) DEFAULT NULL,
  `name` varchar(24) NOT NULL,
  `price` float NOT NULL,
  `quantity` int(11) NOT NULL,
  `safetyStock` int(11) NOT NULL,
  `note` text NOT NULL,
  `createDate` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `history_item`
--

INSERT INTO `history_item` (`id`, `historyId`, `productId`, `name`, `price`, `quantity`, `safetyStock`, `note`, `createDate`) VALUES
(71, 73, NULL, 'newza', 23, 1, 1, 'qwrqrw', NULL),
(72, 74, 23, 'newza', 23, 24, 1, 'qwrqrw', NULL),
(73, 75, 23, 'newza', 23, 100, 1, 'qwrqrw', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `name` varchar(24) NOT NULL,
  `quantity` int(11) NOT NULL DEFAULT 1,
  `price` float NOT NULL DEFAULT 0,
  `safetyStock` int(11) NOT NULL DEFAULT 0,
  `note` text DEFAULT '-',
  `createDate` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `name`, `quantity`, `price`, `safetyStock`, `note`, `createDate`) VALUES
(3, 'asdklklj', 2860, 213, 78, 'lnwza555', '2021-02-23 15:20:27'),
(4, 'bbno$', 3081, 1337, 600, 'What if elon musk has this on his playlist', '2021-02-23 15:38:34'),
(8, 'qwope', 2322, 125.25, 4442, 'lol out of stock', '2021-02-23 18:47:55'),
(14, 'บางอย่าง', 56, 244, 37, 'ซ่ามากๆๆๆๆๆๆ', '2021-02-23 23:34:21'),
(19, 'a lot of', 123982, 999, 7, 'เยอะจัดๆอ่ะครับๆๆๆๆ', '2021-02-27 00:01:03'),
(20, 'qerqeor', 123, 324, 1435, 'qwrkjkweporkowept', '2021-02-27 20:08:04'),
(23, 'newza', 125, 23, 1, 'qwrqrw', '2021-02-27 20:41:48');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `username` varchar(24) NOT NULL,
  `password` varchar(24) NOT NULL,
  `role` varchar(24) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `username`, `password`, `role`) VALUES
(2, 'admin', 'warehouse', 'admin');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `history`
--
ALTER TABLE `history`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `history_item`
--
ALTER TABLE `history_item`
  ADD PRIMARY KEY (`id`),
  ADD KEY `historyId` (`historyId`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `cart`
--
ALTER TABLE `cart`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=83;

--
-- AUTO_INCREMENT for table `history`
--
ALTER TABLE `history`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=76;

--
-- AUTO_INCREMENT for table `history_item`
--
ALTER TABLE `history_item`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=74;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `history_item`
--
ALTER TABLE `history_item`
  ADD CONSTRAINT `history_item_ibfk_1` FOREIGN KEY (`historyId`) REFERENCES `history` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

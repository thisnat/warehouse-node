-- phpMyAdmin SQL Dump
-- version 5.0.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 14, 2021 at 02:44 PM
-- Server version: 10.4.14-MariaDB
-- PHP Version: 7.2.34

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

CREATE DATABASE `warehouse`;

USE `warehouse`;

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
(110, 'IMPORT', 'ACCEPT', 'none', '2021-03-14 20:26:11'),
(111, 'IMPORT', 'ACCEPT', 'none', '2021-03-14 20:27:04'),
(112, 'IMPORT', 'ACCEPT', 'none', '2021-03-14 20:27:19'),
(113, 'IMPORT', 'ACCEPT', 'none', '2021-03-14 20:27:36'),
(114, 'IMPORT', 'ACCEPT', 'none', '2021-03-14 20:27:51'),
(115, 'IMPORT', 'ACCEPT', 'none', '2021-03-14 20:28:06'),
(116, 'IMPORT', 'ACCEPT', 'none', '2021-03-14 20:29:00'),
(117, 'IMPORT', 'ACCEPT', 'none', '2021-03-14 20:30:05'),
(118, 'IMPORT', 'ACCEPT', 'none', '2021-03-14 20:30:48'),
(119, 'IMPORT', 'ACCEPT', 'none', '2021-03-14 20:31:12'),
(120, 'IMPORT', 'ACCEPT', 'none', '2021-03-14 20:31:46'),
(121, 'IMPORT', 'ACCEPT', 'none', '2021-03-14 20:32:32'),
(122, 'IMPORT', 'ACCEPT', 'none', '2021-03-14 20:33:33'),
(123, 'IMPORT', 'ACCEPT', 'none', '2021-03-14 20:33:57'),
(124, 'IMPORT', 'ACCEPT', 'none', '2021-03-14 20:34:14'),
(125, 'IMPORT', 'ACCEPT', 'none', '2021-03-14 20:35:22'),
(126, 'IMPORT', 'ACCEPT', 'none', '2021-03-14 20:35:55'),
(127, 'IMPORT', 'ACCEPT', 'none', '2021-03-14 20:36:54'),
(128, 'IMPORT', 'ACCEPT', 'none', '2021-03-14 20:37:46'),
(129, 'IMPORT', 'ACCEPT', 'none', '2021-03-14 20:39:32'),
(130, 'IMPORT', 'ACCEPT', 'none', '2021-03-14 20:39:53'),
(131, 'IMPORT', 'ACCEPT', 'none', '2021-03-14 20:40:42'),
(132, 'IMPORT', 'ACCEPT', 'none', '2021-03-14 20:41:11'),
(133, 'IMPORT', 'ACCEPT', 'none', '2021-03-14 20:41:48'),
(134, 'IMPORT', 'ACCEPT', 'none', '2021-03-14 20:42:14');

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
(111, 110, NULL, 'กระดาษ (รีม)', 540, 200000, 150000, '', NULL),
(112, 111, NULL, 'กระดาษ (แผ่น)', 1, 300000, 200000, '', NULL),
(113, 112, NULL, 'ปากกา', 15, 120000, 80000, '', NULL),
(114, 113, NULL, 'ดินสอ', 10, 150000, 150000, '', NULL),
(115, 114, NULL, 'ดินสอกด', 65, 120000, 120000, '', NULL),
(116, 115, NULL, 'ยางลบ', 5, 100000, 100000, '', NULL),
(117, 116, NULL, 'กล่องดินสอ', 199, 120000, 100000, '', NULL),
(118, 117, NULL, 'กระดาษทิชชู่ (24 ม้วน)', 399, 100000, 200000, '', NULL),
(119, 118, NULL, 'จานเซรามิก', 29, 100000, 50000, 'จานเซรามิกอย่างดี สามารถเข้าไมโครเวฟได้', NULL),
(120, 119, NULL, 'ชามเซรามิก', 39, 80000, 100000, 'ชามเซรามิกอย่างดี สามารถเข้าไมโครเวฟได้', NULL),
(121, 120, NULL, 'มีด', 999, 20000, 15000, '', NULL),
(122, 121, NULL, 'เตาไฟฟ้า', 1699, 10000, 15000, 'เตาไฟฟ้าอย่างดี มาพร้อมกับพัดลมระบายอากาศ', NULL),
(123, 122, NULL, 'กระทะไฟฟ้า', 1999, 99999, 150000, '', NULL),
(124, 123, NULL, 'หม้อ', 999, 5555, 10000, '', NULL),
(125, 124, NULL, 'เขียง', 599, 10000, 15000, '', NULL),
(126, 125, NULL, 'ไครเวฟ', 1999, 15000, 10000, '', NULL),
(127, 126, NULL, 'กล่องเก็บอาหาร (พลาสติก)', 99, 100000, 100000, '', NULL),
(128, 127, NULL, 'กาต้มน้ำไฟฟ้า', 999, 150000, 100000, '', NULL),
(129, 128, NULL, 'เครื่องปิ้งขนมปัง', 699, 10000, 8000, '', NULL),
(130, 129, NULL, 'โต้ะ', 1890, 10000, 8000, 'กว้าง 60 ยาว 200 สูง 75', NULL),
(131, 130, NULL, 'เก้าอี้', 699, 10000, 8000, '', NULL),
(132, 131, NULL, 'ขาโต้ะ สำหรับท๊อปโต้ะ', 199, 10000, 7000, '', NULL),
(133, 132, NULL, 'หมอนพิงสำหรับใช้กับเก้าอ', 399, 5000, 3000, '', NULL),
(134, 133, NULL, 'เบาะรองเก้าอี้', 199, 5000, 2500, '', NULL),
(135, 134, NULL, 'โคมไฟ', 499, 5000, 4500, '', NULL);

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
  `note` text,
  `createDate` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `name`, `quantity`, `price`, `safetyStock`, `note`, `createDate`) VALUES
(43, 'กระดาษ (รีม)', 200000, 540, 150000, '', '2021-03-14 20:26:11'),
(44, 'กระดาษ (แผ่น)', 300000, 1, 200000, '', '2021-03-14 20:27:04'),
(45, 'ปากกา', 120000, 15, 80000, '', '2021-03-14 20:27:19'),
(46, 'ดินสอ', 150000, 10, 150000, '', '2021-03-14 20:27:36'),
(47, 'ดินสอกด', 120000, 65, 120000, '', '2021-03-14 20:27:51'),
(48, 'ยางลบ', 100000, 5, 100000, '', '2021-03-14 20:28:06'),
(49, 'กล่องดินสอ', 120000, 199, 100000, '', '2021-03-14 20:29:00'),
(50, 'กระดาษทิชชู่ (24 ม้วน)', 100000, 399, 200000, '', '2021-03-14 20:30:05'),
(51, 'จานเซรามิก', 100000, 29, 50000, 'จานเซรามิกอย่างดี สามารถเข้าไมโครเวฟได้', '2021-03-14 20:30:48'),
(52, 'ชามเซรามิก', 80000, 39, 100000, 'ชามเซรามิกอย่างดี สามารถเข้าไมโครเวฟได้', '2021-03-14 20:31:12'),
(53, 'มีด', 20000, 999, 15000, '', '2021-03-14 20:31:46'),
(54, 'เตาไฟฟ้า', 10000, 1699, 15000, 'เตาไฟฟ้าอย่างดี มาพร้อมกับพัดลมระบายอากาศ', '2021-03-14 20:32:32'),
(55, 'กระทะไฟฟ้า', 99999, 1999, 150000, '', '2021-03-14 20:33:33'),
(56, 'หม้อ', 5555, 999, 10000, '', '2021-03-14 20:33:57'),
(57, 'เขียง', 10000, 599, 15000, '', '2021-03-14 20:34:14'),
(58, 'ไครเวฟ', 15000, 1999, 10000, '', '2021-03-14 20:35:22'),
(59, 'กล่องเก็บอาหาร (พลาสติก)', 100000, 99, 100000, '', '2021-03-14 20:35:55'),
(60, 'กาต้มน้ำไฟฟ้า', 150000, 999, 100000, '', '2021-03-14 20:36:54'),
(61, 'เครื่องปิ้งขนมปัง', 10000, 699, 8000, '', '2021-03-14 20:37:46'),
(62, 'โต้ะ', 10000, 1890, 8000, 'กว้าง 60 ยาว 200 สูง 75', '2021-03-14 20:39:32'),
(63, 'เก้าอี้', 10000, 699, 8000, '', '2021-03-14 20:39:53'),
(64, 'ขาโต้ะ สำหรับท๊อปโต้ะ', 10000, 199, 7000, '', '2021-03-14 20:40:42'),
(65, 'หมอนพิงสำหรับใช้กับเก้าอ', 5000, 399, 3000, '', '2021-03-14 20:41:11'),
(66, 'เบาะรองเก้าอี้', 5000, 199, 2500, '', '2021-03-14 20:41:48'),
(67, 'โคมไฟ', 5000, 499, 4500, '', '2021-03-14 20:42:14');

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
(1, 'admin', 'warehouse', 'admin'),
(2, 'admin2', 'warehouse', 'admin');

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=89;

--
-- AUTO_INCREMENT for table `history`
--
ALTER TABLE `history`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=135;

--
-- AUTO_INCREMENT for table `history_item`
--
ALTER TABLE `history_item`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=136;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=68;

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

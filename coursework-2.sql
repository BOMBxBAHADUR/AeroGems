-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: May 10, 2024 at 01:53 AM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `coursework`
--

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

CREATE TABLE `cart` (
  `cart_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `product_Id` int(11) NOT NULL,
  `product_name` varchar(255) NOT NULL,
  `product_type` varchar(255) NOT NULL,
  `category` varchar(255) NOT NULL,
  `rating` int(11) NOT NULL,
  `price` int(11) NOT NULL,
  `stock` int(11) NOT NULL,
  `product_image` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`product_Id`, `product_name`, `product_type`, `category`, `rating`, `price`, `stock`, `product_image`) VALUES
(22, 'Drone Crash Guard', 'safety', 'Accessories', 4, 40, 25, 'drone crash guard.jpg'),
(23, 'Drone Parachute', 'safety', 'Accessories', 3, 20, 0, 'drone parachut.jpg'),
(24, 'DJI Mini 2', 'Mini Drone', 'Drone', 4, 250, 12, 'dji mini 2 se.png'),
(25, 'DJI Mini ', 'Mini Drone', 'Drone', 4, 270, 3, 'dji mini 2.jpg'),
(26, 'DJI Mini 4', 'Mini Drone', 'Drone', 5, 488, 13, 'dji mini 4 pro.jpg'),
(27, 'Mavic Pro 2', 'Medium Drone', 'Drone', 3, 1499, 7, 'mavic pro 2.png'),
(28, 'Mavic Pro 3', 'Medium Drone', 'Drone', 4, 2999, 22, 'mavic pro 3 folded.png'),
(29, 'Mavic 3', 'Medium Drone', 'Drone', 3, 2199, 9, 'mavic3 pro.png'),
(30, 'Gopro For Drone', 'gopro Camera', 'Camera', 5, 425, 30, 'gopro for drone.png'),
(31, 'DJI FPV 2', 'Goggles', 'FPV', 4, 720, 12, '2-DJI-FPV-Goggles.jpg'),
(32, 'Portable Lens Cover', 'Protection', 'Accessories', 1, 120, 6, 'hi.png'),
(33, 'VR D2 Goggles', 'Goggles', 'FPV', 2, 970, 12, 'vr-d2-goggles.png');

-- --------------------------------------------------------

--
-- Table structure for table `purchase`
--

CREATE TABLE `purchase` (
  `purchase_ID` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `purchase`
--

INSERT INTO `purchase` (`purchase_ID`, `user_id`, `product_id`) VALUES
(50, 90, 22),
(51, 90, 24),
(53, 90, 22);

-- --------------------------------------------------------

--
-- Table structure for table `register`
--

CREATE TABLE `register` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `address` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `phone` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `image` varchar(255) NOT NULL,
  `isadmin` varchar(20) NOT NULL DEFAULT 'false'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `register`
--

INSERT INTO `register` (`id`, `name`, `address`, `email`, `phone`, `password`, `image`, `isadmin`) VALUES
(89, 'Utsav Katuwal', 'kadhaghari', 'bomb@gmail.com', '8927323423', '4ûÛ=,¿Q#þã$a¼', '2ebd4b1b-1fa3-4c66-babb-b0329e460305.JPG', 'false'),
(90, 'Adarsha Dawadi', 'chabahil', 'dawadiadarsha2018@gmail.com', '9842447841', '4ûÛ=,¿Q#þã$a¼', 'IMG_0069.jpeg', 'true'),
(91, 'Aakriti Kandel', 'golfutar', 'aakriti@gmail.com', '9823332423', '4ûÛ=,¿Q#þã$a¼', 'compressed_gm_40_img_191928_2c490e8a_1691550189220_sc.jpg', 'false');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`cart_id`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`product_Id`);

--
-- Indexes for table `purchase`
--
ALTER TABLE `purchase`
  ADD PRIMARY KEY (`purchase_ID`);

--
-- Indexes for table `register`
--
ALTER TABLE `register`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `phone` (`phone`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `product`
--
ALTER TABLE `product`
  MODIFY `product_Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT for table `purchase`
--
ALTER TABLE `purchase`
  MODIFY `purchase_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=54;

--
-- AUTO_INCREMENT for table `register`
--
ALTER TABLE `register`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=94;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

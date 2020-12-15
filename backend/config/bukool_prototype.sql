-- phpMyAdmin SQL Dump
-- version 5.0.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 15, 2020 at 08:25 PM
-- Server version: 10.4.14-MariaDB
-- PHP Version: 7.4.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `bukool_prototype`
--

-- --------------------------------------------------------

--
-- Table structure for table `event`
--

CREATE TABLE `event` (
  `id` int(11) NOT NULL,
  `account_id` int(11) NOT NULL,
  `event_name` varchar(32) NOT NULL,
  `event_details` varchar(255) NOT NULL,
  `contact_number` varchar(32) NOT NULL,
  `event_type_id` int(11) NOT NULL,
  `event_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `event_services`
--

CREATE TABLE `event_services` (
  `event_id` int(11) NOT NULL,
  `service_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `event_type`
--

CREATE TABLE `event_type` (
  `id` int(11) NOT NULL,
  `name` varchar(32) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `event_type`
--

INSERT INTO `event_type` (`id`, `name`) VALUES
(1, 'wedding');

-- --------------------------------------------------------

--
-- Table structure for table `message`
--

CREATE TABLE `message` (
  `id` int(11) NOT NULL,
  `sender_id` int(11) NOT NULL,
  `receiver_id` int(11) NOT NULL,
  `message` varchar(255) NOT NULL,
  `active` varchar(32) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `service`
--

CREATE TABLE `service` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `event_type_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `service`
--

INSERT INTO `service` (`id`, `name`, `description`, `price`, `event_type_id`) VALUES
(1, 'Perfect Bliss', 'Photo\r\n– Prenup session and prenup slideshow\r\n– Unlimited photos taken on the day\r\n– High resolution images professionally edited and supplied with USB for high-quality printing\r\n– 40-page 10×10” premium fine art album (slim pages) with an 11×11″ desktop ', '50000.00', 1),
(2, 'Grey', '– Prenup session and prenup slideshow\r\n– Unlimited photos taken on the day\r\n– High resolution images professionally edited and supplied with USB for high-quality printing\r\n– 40-page 10×10” premium fine art album (slim pages) with an 11×11″ desktop crystal', '30000.00', 1),
(3, 'White', '– Prenup session and prenup slideshow\r\n– Unlimited photos taken on the day\r\n– High resolution images professionally edited and supplied with USB for high-quality printing\r\n– 30-page 10×10” premium fine art album (slim pages)\r\n– 2-3 professional photograph', '25000.00', 1),
(4, 'Brown', '– No prenup session\r\n– Unlimited photos taken on the day\r\n– High resolution images professionally edited and supplied with USB for high-quality printing\r\n– 20-page 10×10” premium fine art album (slim pages)\r\n– 2 professional photographers', '20000.00', 1),
(5, 'Prenup Only', '– Up to 6 hours of photoshoot – Unlimited photos taken on the day – High resolution images professionally edited and supplied with USB for high-quality printing – Prenup slideshow – 2 professional photographers', '10000.00', 0);

-- --------------------------------------------------------

--
-- Table structure for table `supplier`
--

CREATE TABLE `supplier` (
  `id` int(11) NOT NULL,
  `company_name` varchar(255) NOT NULL,
  `contact_person` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  `contact_number` int(32) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `username` varchar(32) NOT NULL,
  `password` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `user_type` varchar(32) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `username`, `password`, `email`, `user_type`) VALUES
(2, 'ricardo', '$2b$10$5VnjaHLFi3IK2hwHg8G5nufG5', 'ricardo@gmail.com', 'client'),
(3, 'lloyd', '$2b$10$MPea7kFvjRIsylm.rh0h8Ox8qzEyXdjGc/KLRigSPtHDJFP5gR1Fe', 'helloworldxzc@gmail.com', 'client'),
(4, 'username', 'password', 'email@email.com', ''),
(5, 'sample', 'wakwak', 'emailagain@gmai.com', '');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `event`
--
ALTER TABLE `event`
  ADD PRIMARY KEY (`id`),
  ADD KEY `event_type_id` (`event_type_id`),
  ADD KEY `account_id` (`account_id`);

--
-- Indexes for table `event_services`
--
ALTER TABLE `event_services`
  ADD KEY `event_id` (`event_id`),
  ADD KEY `service_id` (`service_id`);

--
-- Indexes for table `event_type`
--
ALTER TABLE `event_type`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `message`
--
ALTER TABLE `message`
  ADD PRIMARY KEY (`id`),
  ADD KEY `receiver_id` (`receiver_id`),
  ADD KEY `sender_id` (`sender_id`);

--
-- Indexes for table `service`
--
ALTER TABLE `service`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `supplier`
--
ALTER TABLE `supplier`
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
-- AUTO_INCREMENT for table `event`
--
ALTER TABLE `event`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `event_type`
--
ALTER TABLE `event_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `message`
--
ALTER TABLE `message`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `service`
--
ALTER TABLE `service`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `supplier`
--
ALTER TABLE `supplier`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `event`
--
ALTER TABLE `event`
  ADD CONSTRAINT `event_ibfk_1` FOREIGN KEY (`event_type_id`) REFERENCES `event_type` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `event_ibfk_2` FOREIGN KEY (`account_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `event_services`
--
ALTER TABLE `event_services`
  ADD CONSTRAINT `event_services_ibfk_1` FOREIGN KEY (`event_id`) REFERENCES `event` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `event_services_ibfk_2` FOREIGN KEY (`service_id`) REFERENCES `service` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `message`
--
ALTER TABLE `message`
  ADD CONSTRAINT `message_ibfk_1` FOREIGN KEY (`receiver_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `message_ibfk_2` FOREIGN KEY (`sender_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

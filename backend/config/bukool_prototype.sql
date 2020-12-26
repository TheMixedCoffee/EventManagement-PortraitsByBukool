-- phpMyAdmin SQL Dump
-- version 5.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 26, 2020 at 10:36 AM
-- Server version: 10.4.11-MariaDB
-- PHP Version: 7.4.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
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
-- Table structure for table `assigned_event`
--

CREATE TABLE `assigned_event` (
  `event_id` int(11) NOT NULL,
  `employee_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `assigned_event`
--

INSERT INTO `assigned_event` (`event_id`, `employee_id`) VALUES
(1, 11),
(1, 12),
(2, 11);

-- --------------------------------------------------------

--
-- Table structure for table `contact`
--

CREATE TABLE `contact` (
  `id` int(11) NOT NULL,
  `contact_name` varchar(255) NOT NULL,
  `contact_number` varchar(32) NOT NULL,
  `contact_desc` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `contact`
--

INSERT INTO `contact` (`id`, `contact_name`, `contact_number`, `contact_desc`) VALUES
(1, 'PLDT', '(02) 888 8171', 'Internet Service Provider'),
(2, 'VECO', '230 8326', 'Visayan Electric Company');

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
  `employee_id` int(11) NOT NULL,
  `event_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `event`
--

INSERT INTO `event` (`id`, `account_id`, `event_name`, `event_details`, `contact_number`, `event_type_id`, `employee_id`, `event_date`) VALUES
(1, 10, 'Keqing\'s Debut', 'Theme: dogs', '0922384736', 1, 1, '2020-12-16'),
(2, 7, 'Marc & Keqing Prenup', 'Idk what this is', '+639564259762', 1, 1, '2020-12-23');

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
(1, 'wedding'),
(2, 'debut'),
(3, 'events'),
(4, 'personal portfolio');

-- --------------------------------------------------------

--
-- Table structure for table `inbox`
--

CREATE TABLE `inbox` (
  `sender_id` int(11) NOT NULL,
  `receiver_id` int(11) NOT NULL,
  `message` varchar(255) NOT NULL,
  `created_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

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
  `description` varchar(1024) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `event_type_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `service`
--

INSERT INTO `service` (`id`, `name`, `description`, `price`, `event_type_id`) VALUES
(1, 'Perfect Bliss', 'Photo  – Prenup session and prenup slideshow\r\n– Unlimited photos taken on the day\r\n– High resolution images professionally edited and supplied with USB for high-quality printing\r\n– 40-page 10×10” premium fine art album (slim pages) with an 11×11″ desktop\r\nVideo\r\n– Prenup short film\r\n– Wedding coverage from dress-up to reception\r\n– Drone / Aerial Services\r\n– Same-Day-Edit\r\n– 3 professional cinematographers and 1 onsite editor', '50000.00', 1),
(2, 'Grey', '– Prenup session and prenup slideshow\r\n– Unlimited photos taken on the day\r\n– High resolution images professionally edited and supplied with USB for high-quality printing\r\n– 40-page 10×10” premium fine art album (slim pages) with an 11×11″ desktop crystal', '30000.00', 1),
(3, 'White', '– Prenup session and prenup slideshow\r\n– Unlimited photos taken on the day\r\n– High resolution images professionally edited and supplied with USB for high-quality printing\r\n– 30-page 10×10” premium fine art album (slim pages)\r\n– 2-3 professional photograph', '25000.00', 1),
(4, 'Brown', '– No prenup session\r\n– Unlimited photos taken on the day\r\n– High resolution images professionally edited and supplied with USB for high-quality printing\r\n– 20-page 10×10” premium fine art album (slim pages)\r\n– 2 professional photographers', '20000.00', 1),
(5, 'Prenup Only', '– Up to 6 hours of photoshoot – Unlimited photos taken on the day – High resolution images professionally edited and supplied with USB for high-quality printing – Prenup slideshow – 2 professional photographers', '10000.00', 1),
(6, 'Bliss', 'Photo\r\n– Pre-debut session and slideshow\r\n– Unlimited photos taken on the day\r\n– High resolution images professionally edited and supplied with USB for high-quality printing – 40-page 10×10” premium fine art album (slim pages) with an 11×11″ desktop crystal frame cover\r\n– One (1) 16×20” Wooden Claire™ photo frame\r\n– 3 professional photographers\r\nVideo\r\n– Pre-debut short film\r\n– Coverage from dress-up to reception\r\n– Drone / Aerial Services\r\n– Same-Day-Edit\r\n– Cinematic Highlights Final Output (3-5mins)\r\n– 3 professional cinematographers and 1 onsite editor', '40000.00', 2),
(7, 'Glee', '– Pre-debut session and slideshow\r\n– Unlimited photos taken on the day\r\n– High resolution images professionally edited and supplied with USB for high-quality printing\r\n– 40-page 10×10” premium fine art album (slim pages) with an 11×11″ desktop crystal fra', '25000.00', 2),
(8, 'Happy', '– Pre-debut session and slideshow\r\n– Unlimited photos taken on the day\r\n– High resolution images professionally edited and supplied with USB for high-quality printing\r\n– 20-page 10×10” premium fine art album (slim pages)\r\n– 2-3 professional photographers', '20000.00', 2),
(9, 'Fun', '– No pre-debut session\r\n– Unlimited photos taken on the day\r\n– High resolution images professionally edited and supplied with USB for high-quality printing\r\n– 20-page 10×10” premium fine art album (slim pages)\r\n– 2 professional photographers', '15000.00', 2),
(10, 'Director', 'Photo\r\n– Unlimited photos taken on the day\r\n– High resolution images professionally edited and supplied with USB for high-quality printing\r\n– 3 professional photographers\r\n\r\nVideo\r\n– Drone / Aerial Services\r\n– Same-Day-Edit\r\n– Cinematic Highlights Final Output (3-5mins)\r\n– 3 professional cinematographers and 1 onsite editor', '35000.00', 3),
(11, 'Executive', '– Unlimited photos taken on the day\r\n– High resolution images professionally edited and supplied with USB for high-quality printing\r\n– 2 professional photographers', '20000.00', 3),
(12, 'Photo Book Package', '– Up to 6 hours of photography session – Unlimited photos taken on the day – High resolution images professionally edited and supplied with USB for high-quality printing – 20-page 10×10” premium fine art album (slim pages) – 2 professional photographers', '15000.00', 4);

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
  `firstname` varchar(32) NOT NULL,
  `lastname` varchar(32) NOT NULL,
  `email` varchar(255) NOT NULL,
  `contact` varchar(32) NOT NULL,
  `user_type` varchar(32) NOT NULL,
  `employee_type` varchar(32) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `username`, `password`, `firstname`, `lastname`, `email`, `contact`, `user_type`, `employee_type`) VALUES
(3, 'lloyd', '$2b$10$MPea7kFvjRIsylm.rh0h8Ox8qzEyXdjGc/KLRigSPtHDJFP5gR1Fe', '', '', 'helloworldxzc@gmail.com', '', 'client', ''),
(7, 'maquisel', '$2b$10$9nDaU7uL0xb5riKsZVMCeenJspX9f997HjuskixBzPQ/czIvYDnLC', 'Marc Lloyd', 'Quisel', 'email.email.com', '', 'client', ''),
(8, 'manager1', '$2b$10$dBhOFDLmDU3EYKeFMmkFcuKZSH6VvOehxbjyLHXxDCA9KFRfm/fCW', 'Isaiah', 'Quinicot', 'manager@manager.com', '', 'manager', ''),
(9, 'admin1', '$2b$10$E5CuM/bJ98P9l8m2lRHxRuz/BKjPslVlhZOA.Zo0Itk.71UiYbHDW', 'Marc Lloyd', 'Quisel', 'admin@admin.com', '', 'admin', ''),
(10, 'keqing', '$2b$10$Ep8k0EjeYEB.puWy6PBOauYQfYTpBg/IMKSEI1t0euFvU3KISZ8um', 'Keqing', 'Waifu', 'email@email.com', '', 'client', ''),
(16, 'saemployee', '$2b$10$A/2CaMe3rIMxj.WW6bNOQuS47PZqb/I.Mz0xX5wX2RU1iwy2PpmOu', 'Sample', 'Employee', 'sample@gmail.com', '09563325649', 'employee', 'Photographer'),
(17, 'pacologne', '$2b$10$aFQLeCfUh.dBrt4m0qKfgOjaXsNzt1UYt5QbuOPJmVm85C6lI.dsu', 'Papa', 'Cologne', 'papacol@gmail.com', '+639458256588', 'employee', 'Videographer'),
(19, 'bemansell', '$2b$10$fvu0rMD96yXKaVLLMhUFFeIcZLOPnpZHHB/aUqLZDGN0aNGuddwVu', 'Benito', 'Mansell', 'benito@gmail.com', '+6395462231', 'employee', 'Photographer'),
(20, 'jaknapp', '$2b$10$EYhycRK0EJaaDT657sFwteNR1mdYJqfva./3o4E0FJL2Czd9bQfcy', 'Jadine', 'Knapp', 'jadine@gmail.com', '09542263587', 'employee', 'Videographer');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `contact`
--
ALTER TABLE `contact`
  ADD PRIMARY KEY (`id`);

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
-- AUTO_INCREMENT for table `contact`
--
ALTER TABLE `contact`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `event`
--
ALTER TABLE `event`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `event_type`
--
ALTER TABLE `event_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `message`
--
ALTER TABLE `message`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `service`
--
ALTER TABLE `service`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `supplier`
--
ALTER TABLE `supplier`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

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

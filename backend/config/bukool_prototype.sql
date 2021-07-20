-- phpMyAdmin SQL Dump
-- version 5.0.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 20, 2021 at 08:21 AM
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
(2, 11),
(1, 11),
(1, 12),
(2, 11),
(2, 19);

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
(2, 'VECO', '230 8326', 'Visayan Electric Company'),
(4, 'Test', '123213213', 'testttt');

-- --------------------------------------------------------

--
-- Table structure for table `contact_number`
--

CREATE TABLE `contact_number` (
  `id` int(11) NOT NULL,
  `contact_id` int(11) NOT NULL,
  `number` varchar(32) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `contact_number`
--

INSERT INTO `contact_number` (`id`, `contact_id`, `number`) VALUES
(4, 1, '+639563328746'),
(5, 2, '(032) 412-5010'),
(6, 3, '(032) 231 3275'),
(7, 4, '(032) 268-3712'),
(12, 2, '5589646'),
(13, 3, '+639230982273');

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
  `event_date` date NOT NULL,
  `status` varchar(32) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `event`
--

INSERT INTO `event` (`id`, `account_id`, `event_name`, `event_details`, `contact_number`, `event_type_id`, `employee_id`, `event_date`, `status`) VALUES
(1, 10, 'Keqing\'s Debut', 'Theme: dogs', '0922384736', 1, 1, '2020-12-16', 'ongoing'),
(2, 7, 'Marc & Keqing Prenup', 'Idk what this is', '+639564259762', 1, 1, '2020-12-23', 'ongoing'),
(8, 10, 'Tester\'s Event', 'Wedding anniversary of my parents.', '09456772847', 4, -1, '2021-05-25', 'completed'),
(9, 25, 'Test Event', 'This is a test event', '9151554554', 3, -1, '2021-07-21', 'ongoing');

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
  `contact_number` varchar(32) NOT NULL,
  `email` varchar(64) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `supplier`
--

INSERT INTO `supplier` (`id`, `company_name`, `contact_person`, `description`, `contact_number`, `email`) VALUES
(1, 'Shopify', 'Robert Magno', 'From creating designs to building your online store. Shopify has everything you need to start a business using print-on-demand.', '+639563328746', 'shopifyprint@gmail.com'),
(2, 'Hannahs Cake Decors And Party Needs', 'Hannah Montana', 'Hannah\'s Cake Decors and Party Needs is your one stop party shop! When it comes to party needs Hannah\'s is the place, Hannah\'s is the biggest party needs provider in Cebu and has the best balloons in Cebu when it comes to quality.', '(032) 412-5010', 'hannahparty@gmail.com'),
(3, 'Williams Printing & Packaging', 'William Jones', 'Williams Printing & Packaging provides quality packaging solutions such as boxes, labels, and stickers.', '(032) 231 3275', '\r\nsales@wcci.com.ph'),
(4, 'Elijah Advertising', 'Sir Jomar Samson', 'With print capabilities from the latest digital print through to 8-color on a sheet up to the most largest possible scale formats, we operate daily to met your deadlines with a smile.', '(032) 268-3712', 'production.elijahadvertising@gmail.com');

-- --------------------------------------------------------

--
-- Table structure for table `tasks`
--

CREATE TABLE `tasks` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `employee_id` int(11) NOT NULL,
  `event_id` int(11) NOT NULL,
  `status` varchar(32) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tasks`
--

INSERT INTO `tasks` (`id`, `name`, `start_date`, `end_date`, `employee_id`, `event_id`, `status`) VALUES
(1, 'Photoshoot', '2020-12-29', '2020-12-31', 19, 1, 'ongoing'),
(2, 'Edit Photos', '2021-01-01', '2021-01-03', 20, 1, 'ongoing'),
(3, 'Meeting with the client', '2020-12-30', '2021-01-01', 24, 1, 'ongoing'),
(5, 'Preparation of Venue', '2020-12-22', '2020-12-24', 19, 1, 'ongoing'),
(6, 'Photoshoot', '2021-05-26', '2021-05-28', 20, 2, 'ongoing'),
(7, 'Video shoot', '2021-05-27', '2021-05-29', 19, 2, 'ongoing'),
(8, 'Meet with Client', '2021-05-25', '2021-05-27', 19, 2, 'ongoing');

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
(19, 'bemansell', '$2b$10$fvu0rMD96yXKaVLLMhUFFeIcZLOPnpZHHB/aUqLZDGN0aNGuddwVu', 'Benito', 'Mansell', 'benito@gmail.com', '+6395462231', 'employee', 'Photographer'),
(20, 'jaknapp', '$2b$10$EYhycRK0EJaaDT657sFwteNR1mdYJqfva./3o4E0FJL2Czd9bQfcy', 'Jadine', 'Knapp', 'jadine@gmail.com', '09542263587', 'employee', 'Videographer'),
(24, 'roclarke', '$2b$10$rh3LKStJEpWkqlFNco07W.ZUOy1qYEebVP0k3ZTvCEiPq9aJqcR9O', 'Rory', 'Clarke', 'rory_clarke@gmail.com', '09563321546', 'employee', 'Editor'),
(25, 'test', '$2b$10$A1XIQFc9iJ4pqprcpBqWFOvlFh00hI.41FHVUL5Paflscv8fKSVlS', 'user', 'test', 'test@gmail.com', '9151554554', 'client', '');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `contact`
--
ALTER TABLE `contact`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `contact_number`
--
ALTER TABLE `contact_number`
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
-- Indexes for table `tasks`
--
ALTER TABLE `tasks`
  ADD PRIMARY KEY (`id`),
  ADD KEY `employee_id` (`employee_id`),
  ADD KEY `event_id` (`event_id`);

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `contact_number`
--
ALTER TABLE `contact_number`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `event`
--
ALTER TABLE `event`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `tasks`
--
ALTER TABLE `tasks`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

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

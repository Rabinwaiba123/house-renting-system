-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 03, 2026 at 07:51 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `rentnest_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `bookings`
--

CREATE TABLE `bookings` (
  `booking_id` int(11) NOT NULL,
  `property_id` int(11) NOT NULL,
  `tenant_id` int(11) NOT NULL,
  `owner_id` int(11) NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `message` text DEFAULT NULL,
  `status` varchar(20) DEFAULT 'pending',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `properties`
--

CREATE TABLE `properties` (
  `property_id` int(11) NOT NULL,
  `owner_id` int(11) NOT NULL,
  `title` varchar(100) NOT NULL,
  `type` varchar(50) NOT NULL,
  `location` varchar(100) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `rooms` int(11) NOT NULL,
  `description` text DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `status` enum('pending','approved','rejected') DEFAULT 'pending',
  `availability` enum('available','unavailable') DEFAULT 'available',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `properties`
--

INSERT INTO `properties` (`property_id`, `owner_id`, `title`, `type`, `location`, `price`, `rooms`, `description`, `image`, `status`, `availability`, `created_at`) VALUES
(1, 11, 'Apartment 2002 ', 'Room', 'Kathmandu,Nepal', 14000.00, 1, 'This is the best room you will get in Kathmandu', 'uploads/1777741318180_NkdE42gueGQGQo7h0OnOVxa4tJvhoIaGqAStn4k-ko4TSo_IhHWOQMz5_BzF5EldoWHs7bLclo4dydn-F3TJpwWGj43OWH7YJVGRExbdTWyYJFCx-0pK9St62SdtQ7zwoEi1XXebxi-OfV07Mwe_BuetAwKfsw-jXiN-zaiVh696JMwLR5tdVePKBjifMlKn.jpg', 'approved', 'available', '2026-05-02 17:01:58'),
(2, 11, 'Room in Lalitpur', 'Room', 'Lalitpur, Nepal', 13113.00, 12, 'This is the best room you will get in Kathmandu', 'uploads/1777743713610_register-house.jpg', 'approved', 'available', '2026-05-02 17:41:53');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `user_id` int(11) NOT NULL,
  `full_name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `phone` varchar(20) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role` varchar(20) DEFAULT NULL,
  `status` varchar(20) DEFAULT 'pending',
  `image_path` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `full_name`, `email`, `phone`, `password`, `role`, `status`, `image_path`, `created_at`) VALUES
(3, 'Admin User', 'admin@gmail.com', '9861402137', '$2a$10$fpPG74gQePO0Mwp2rF.M2.S/42gVq3dNMYa70ncf44rbYh8GKpz12', 'admin', 'ACTIVE', 'uploads/1777720501627_iz51dvUNc4PDvZfGa_njfQu9etCBbNZLPNlKAHcVDXDjRz_bppOsM2rNS6aqef5NKdop7FIDh3-X6Zuyhypw5N8IoNT9C0WrOW2xW-POGeWTWPY4WEdWwfmYhUUqwuQ-cuotjRCfeYFJOTBHSr34knd5FDouRh38MO0JCC7Y4NSlImzbEA7cEAXl2b4Z1I05.jpg', '2026-04-29 11:37:25'),
(10, 'Rav Waiba', 'rav123@gmail.com', '12321331313113', '$2a$10$pD.0Ka/rUpQUdqQq0lliVeQWlBvXDs8xOU7SMAHx9hmtibmZHcHtS', 'tenant', 'ACTIVE', NULL, '2026-05-02 11:28:40'),
(11, 'Rav Waiba', 'ravb@gmail.com', '123123123', '$2a$10$TZaeLUT0NbDMWcoumHjo.e4eMluC3lNyQskizSw/NHzdc3WGdpYyq', 'owner', 'ACTIVE', 'uploads/1777741239977_IwK9xy8HiJVPKHADEEJlYZ-mDZ06efYDycSUNdrld-Tk-U0PyP1xem1DUedk76l5-lVClyR4lWUWmA4KzkyUQcZxrHnT3PVhWpyG0ckhhQiYqc5GnMWITuq4CKbBsPRGVlkt5UeXcE4Fs6TyUQkpYpc9Z8jUZKDt4NeKsnjQjJOXdh5C9g3lQIjNErkGkqnA.jpg', '2026-05-02 17:00:41'),
(12, 'Bardan Rai', 'bardan@gmail.com', '2153265412', '$2a$10$PDU6J3DADcRp0aZcSw/xj.p2s/nsyxPqiJoveFJYLPWQel7806x22', 'tenant', 'ACTIVE', 'uploads/1777777455953_WMqsp7dBjw--NDbbsPDPhgXVtppwCiKH3aHOcUdSduaiyWmqfYAmaqsFdhqypMERxdOCpq7Q5Kqw_q6kyKeYJN4S9nR7SOTz-LBC3shXD3tAcUn6VkSwYSTQ9c2b_G2JHloL_4bYgjXDsyUYcWc0LUOLhClbXVD8tCvcITMdQvu74tIt-aFQF5WfYEbI9iV4.jpg', '2026-05-03 03:04:16'),
(13, 'bibek', 'bibek87@gmail.com', '987654320', '$2a$10$QH9uS9b7vq4DxJ2dqd3uDevnzrVCbKk8bYMKsKVNPuXWbeMHawZwm', 'tenant', 'ACTIVE', 'uploads/1777786160531_Screenshot 2026-05-02 094012.png', '2026-05-03 05:29:20');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `bookings`
--
ALTER TABLE `bookings`
  ADD PRIMARY KEY (`booking_id`),
  ADD KEY `property_id` (`property_id`),
  ADD KEY `tenant_id` (`tenant_id`),
  ADD KEY `owner_id` (`owner_id`);

--
-- Indexes for table `properties`
--
ALTER TABLE `properties`
  ADD PRIMARY KEY (`property_id`),
  ADD KEY `owner_id` (`owner_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `phone` (`phone`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `bookings`
--
ALTER TABLE `bookings`
  MODIFY `booking_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `properties`
--
ALTER TABLE `properties`
  MODIFY `property_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `bookings`
--
ALTER TABLE `bookings`
  ADD CONSTRAINT `bookings_ibfk_1` FOREIGN KEY (`property_id`) REFERENCES `properties` (`property_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `bookings_ibfk_2` FOREIGN KEY (`tenant_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `bookings_ibfk_3` FOREIGN KEY (`owner_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE;

--
-- Constraints for table `properties`
--
ALTER TABLE `properties`
  ADD CONSTRAINT `properties_ibfk_1` FOREIGN KEY (`owner_id`) REFERENCES `users` (`user_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

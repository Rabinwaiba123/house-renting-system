-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 21, 2026 at 02:28 AM
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
  `user_id` int(11) NOT NULL,
  `property_id` int(11) NOT NULL,
  `booking_date` date NOT NULL,
  `move_in_date` date DEFAULT NULL,
  `duration_months` int(11) DEFAULT NULL,
  `message` text DEFAULT NULL,
  `is_deleted` tinyint(1) DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `bookings`
--

INSERT INTO `bookings` (`booking_id`, `user_id`, `property_id`, `booking_date`, `move_in_date`, `duration_months`, `message`, `is_deleted`, `created_at`) VALUES
(11, 8, 10, '2026-05-19', '2026-05-21', 6, 'I want this room.', 0, '2026-05-19 03:23:17'),
(12, 4, 9, '2026-05-20', '2026-05-21', 1, 'vasvasv', 0, '2026-05-20 00:53:41');

-- --------------------------------------------------------

--
-- Table structure for table `contacts`
--

CREATE TABLE `contacts` (
  `contact_id` int(11) NOT NULL,
  `full_name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `subject` varchar(150) NOT NULL,
  `message` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `contacts`
--

INSERT INTO `contacts` (`contact_id`, `full_name`, `email`, `subject`, `message`) VALUES
(11, 'Rabin Waiba', 'rabin123@gmail.com', 'Rental Inquiry', 'Hello, I would like to know if the apartment in Kathmandu is still available for rent. Please provide more details about the monthly cost and facilities.');

-- --------------------------------------------------------

--
-- Table structure for table `properties`
--

CREATE TABLE `properties` (
  `property_id` int(11) NOT NULL,
  `title` varchar(150) NOT NULL,
  `type` varchar(50) NOT NULL,
  `location` varchar(150) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `rooms` int(11) NOT NULL,
  `bathrooms` int(11) NOT NULL,
  `area_sqft` int(11) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `availability` tinyint(1) DEFAULT 1,
  `status` tinyint(1) DEFAULT 1,
  `is_deleted` tinyint(1) DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `properties`
--

INSERT INTO `properties` (`property_id`, `title`, `type`, `location`, `price`, `rooms`, `bathrooms`, `area_sqft`, `description`, `image`, `availability`, `status`, `is_deleted`, `created_at`) VALUES
(6, 'Modern Apartment', 'Room', 'Kathmandu', 50000.00, 3, 1, 250, 'A modern fully furnished apartment located in the center of Kathmandu. The property includes two bedrooms, a spacious living room, attached bathroom, kitchen, WiFi, parking area, and 24-hour water facility. Suitable for families and working professionals.', 'uploads/properties/1778866788792_AB6AXuBGDh6mM79jRxIfrlKSPlWmwZhpWbweRM_Fz0_CEI26K-NL_krzz7hgaMa6oisYteDQ8-177t_dcvBKKS2ZfGPwdxfU_ZT2_j85_0px13v-XIe5cMPz7Iido3mQB8NcFUKSxZ0kQZcq-v90-QzFT77OakcXEXE04vIBaSGT5lNRZrDEk3SGrV6ENh69bFYkCPAW3NugAQrRL6ov3N.png', 1, 1, 0, '2026-05-15 17:39:48'),
(7, 'Single Room', 'Room', 'Lalitpur', 5000.00, 1, 1, 15, 'Affordable single room available in a peaceful area of Lalitpur. The room includes attached bathroom, study table, internet facility, and access to shared kitchen. Best for students and single tenants.', 'uploads/properties/1778866903876_homestay-nepal.jpg', 1, 1, 0, '2026-05-15 17:41:43'),
(8, 'Family House', 'House', 'Bhaktapur', 150000.00, 8, 3, 235, 'A beautiful family house with three bedrooms, garden area, parking space, and modern kitchen. Located in a quiet residential area with nearby schools, hospitals, and markets.', 'uploads/properties/1778867013335_atithi-house.jpg', 1, 1, 0, '2026-05-15 17:43:33'),
(9, 'Luxury Flat', 'Flat', 'Pokhara', 6000.00, 5, 1, 30, 'Luxury flat with mountain views located near Lakeside Pokhara. The property includes furnished bedrooms, balcony, modern bathroom, air conditioning, and high-speed internet. Ideal for tourists and long-term stays.', 'uploads/properties/1779157871207_AB6AXuBGDh6mM79jRxIfrlKSPlWmwZhpWbweRM_Fz0_CEI26K-NL_krzz7hgaMa6oisYteDQ8-177t_dcvBKKS2ZfGPwdxfU_ZT2_j85_0px13v-XIe5cMPz7Iido3mQB8NcFUKSxZ0kQZcq-v90-QzFT77OakcXEXE04vIBaSGT5lNRZrDEk3SGrV6ENh69bFYkCPAW3NugAQrRL6 (1).jpg', 0, 1, 0, '2026-05-19 02:31:11'),
(10, 'Shared Hostel Room', 'Room', 'Kathmandu', 5000.00, 1, 1, 80, 'Shared hostel room for students with affordable monthly rent. Includes WiFi, study space, shared kitchen, and security service. Located close to colleges and public transport.', 'uploads/properties/1779158126977_unnamed.jpg', 0, 1, 0, '2026-05-19 02:35:26'),
(11, 'Boys Hostel Room', 'Room', 'Bhaktapur', 4500.00, 2, 1, 65, 'This is the boy hostel room availabel for boys. It is located in Kapan, Kathmandu.', 'uploads/properties/1779164267521_boysHostel.jpg', 1, 1, 1, '2026-05-19 04:17:47');

-- --------------------------------------------------------

--
-- Table structure for table `reviews`
--

CREATE TABLE `reviews` (
  `review_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `property_id` int(11) NOT NULL,
  `rating` int(11) NOT NULL,
  `comment` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `reviews`
--

INSERT INTO `reviews` (`review_id`, `user_id`, `property_id`, `rating`, `comment`) VALUES
(1, 4, 7, 3, 'asdcvasvsa'),
(2, 4, 9, 4, 'asvasv');

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
  `address` varchar(255) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `role` varchar(20) DEFAULT 'user',
  `status` tinyint(1) DEFAULT 0,
  `is_deleted` tinyint(1) DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `full_name`, `email`, `phone`, `password`, `address`, `image`, `role`, `status`, `is_deleted`, `created_at`) VALUES
(1, 'Admin', 'admin@gmail.com', '9864402136', '$2a$10$hFKRWaAZoVZQ/Ygq4/ciSulrfQlOtJlIpghel1Kkn.87Og8yUFmQO', '12313124313', 'uploads/1778558602880_images.jpg', 'admin', 1, 0, '2026-05-12 04:03:23'),
(4, 'Bardan Raja', 'bardan@gmail.com', '9451625567', '$2a$10$VCzBsrZOq5dXhnDtgDBXUefoLn.od8h3bYB.0vSiV7sgQ3s.dlja2', '1232', 'uploads/users/1778897367984_images.jpg', 'tenant', 1, 0, '2026-05-12 04:24:03'),
(5, 'Rabin Waiba', 'rabin@gmail.com', '9832723118', '$2a$10$VCzBsrZOq5dXhnDtgDBXUefoLn.od8h3bYB.0vSiV7sgQ3s.dlja2', 'Kathmandu', 'uploads/1778867291225_register.jpg', 'tenant', 1, 0, '2026-05-15 17:48:11'),
(7, 'acasca', 'saca@gmail.com', 'ascasc', '$2a$10$a66xeDcBpQ3ActXGKWTO1ut9PFQ4s2WJXbw2/pRUhbQCqySDtrLVi', 'ascas', NULL, 'tenant', 1, 0, '2026-05-19 00:18:27'),
(8, 'Rabin Waiba', 'rabin123@gmail.com', '9861402135', '$2a$10$hFKRWaAZoVZQ/Ygq4/ciSulrfQlOtJlIpghel1Kkn.87Og8yUFmQO', 'Simaltar', 'uploads/1779153928799_licensed-image.jpg', 'tenant', 1, 0, '2026-05-19 01:25:29'),
(9, 'Riti', 'riti@gmail.com', '1234567891', '$2a$10$6JZXfO2Rx9hjp60UZ0s7fuNuQHN3NzqhRvwnXZ0rzAFg4F7vaQJ9W', 'avasv', NULL, 'tenant', 0, 0, '2026-05-20 09:39:13');

-- --------------------------------------------------------

--
-- Table structure for table `wishlist`
--

CREATE TABLE `wishlist` (
  `wishlist_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `property_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `wishlist`
--

INSERT INTO `wishlist` (`wishlist_id`, `user_id`, `property_id`) VALUES
(5, 8, 10);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `bookings`
--
ALTER TABLE `bookings`
  ADD PRIMARY KEY (`booking_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `property_id` (`property_id`);

--
-- Indexes for table `contacts`
--
ALTER TABLE `contacts`
  ADD PRIMARY KEY (`contact_id`);

--
-- Indexes for table `properties`
--
ALTER TABLE `properties`
  ADD PRIMARY KEY (`property_id`);

--
-- Indexes for table `reviews`
--
ALTER TABLE `reviews`
  ADD PRIMARY KEY (`review_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `property_id` (`property_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `phone` (`phone`);

--
-- Indexes for table `wishlist`
--
ALTER TABLE `wishlist`
  ADD PRIMARY KEY (`wishlist_id`),
  ADD UNIQUE KEY `user_id` (`user_id`,`property_id`),
  ADD KEY `property_id` (`property_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `bookings`
--
ALTER TABLE `bookings`
  MODIFY `booking_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `contacts`
--
ALTER TABLE `contacts`
  MODIFY `contact_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `properties`
--
ALTER TABLE `properties`
  MODIFY `property_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `reviews`
--
ALTER TABLE `reviews`
  MODIFY `review_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `wishlist`
--
ALTER TABLE `wishlist`
  MODIFY `wishlist_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `bookings`
--
ALTER TABLE `bookings`
  ADD CONSTRAINT `bookings_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`),
  ADD CONSTRAINT `bookings_ibfk_2` FOREIGN KEY (`property_id`) REFERENCES `properties` (`property_id`);

--
-- Constraints for table `reviews`
--
ALTER TABLE `reviews`
  ADD CONSTRAINT `reviews_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`),
  ADD CONSTRAINT `reviews_ibfk_2` FOREIGN KEY (`property_id`) REFERENCES `properties` (`property_id`);

--
-- Constraints for table `wishlist`
--
ALTER TABLE `wishlist`
  ADD CONSTRAINT `wishlist_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`),
  ADD CONSTRAINT `wishlist_ibfk_2` FOREIGN KEY (`property_id`) REFERENCES `properties` (`property_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

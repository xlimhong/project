-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 05, 2026 at 03:45 PM
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
-- Database: `tarumt_maintenance`
--

-- --------------------------------------------------------

--
-- Table structure for table `assets`
--

CREATE TABLE `assets` (
  `id` int(11) NOT NULL,
  `asset_tag` varchar(50) NOT NULL,
  `asset_name` varchar(100) NOT NULL,
  `category_id` int(11) DEFAULT NULL,
  `location_id` int(11) NOT NULL,
  `purchase_date` date DEFAULT NULL,
  `warranty_expiry` date DEFAULT NULL,
  `status` enum('Active','Under Maintenance','Decommissioned') DEFAULT 'Active',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `name` varchar(150) NOT NULL,
  `category` varchar(100) NOT NULL,
  `location` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `assets`
--

INSERT INTO `assets` (`id`, `asset_tag`, `asset_name`, `category_id`, `location_id`, `purchase_date`, `warranty_expiry`, `status`, `created_at`, `name`, `category`, `location`) VALUES
(4, 'adc', '', NULL, 0, NULL, NULL, '', '2026-09-06 10:59:20', 'ac', 'hvac', 'libary'),
(9, '1002', '', NULL, 0, NULL, NULL, 'Under Maintenance', '2026-09-06 11:01:37', 'electronic', 'hvac', 'room'),
(10, '1004', '', NULL, 0, NULL, NULL, 'Decommissioned', '2026-09-06 11:01:59', 'electronic', '1234', 'room22');

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int(11) NOT NULL,
  `category_name` varchar(50) NOT NULL,
  `description` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `category_name`, `description`) VALUES
(1, 'Electrical', 'Lighting, power outlets, wiring, circuit breakers'),
(2, 'Plumbing', 'Water leaks, pipes, taps, flush systems'),
(3, 'Furniture', 'Desks, chairs, whiteboards, podiums'),
(4, 'IT Equipment', 'Projectors, lab PCs, access points, monitors'),
(5, 'Building', 'Doors, windows, wall paint, ceiling tiles, roof leaks'),
(6, 'Cleaning', 'Waste disposal, stain removal, sanitization');

-- --------------------------------------------------------

--
-- Table structure for table `feedback`
--

CREATE TABLE `feedback` (
  `id` int(11) NOT NULL,
  `request_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  `rating` int(11) DEFAULT NULL CHECK (`rating` between 1 and 5),
  `comments` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `feedback`
--

INSERT INTO `feedback` (`id`, `request_id`, `user_id`, `rating`, `comments`, `created_at`) VALUES
(2, 8, 1, 4, 'still ok', '2026-09-03 05:12:10');

-- --------------------------------------------------------

--
-- Table structure for table `feedback_replies`
--

CREATE TABLE `feedback_replies` (
  `id` int(11) NOT NULL,
  `feedback_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `reply_text` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `feedback_replies`
--

INSERT INTO `feedback_replies` (`id`, `feedback_id`, `user_id`, `reply_text`, `created_at`) VALUES
(2, 2, 5, 'weak ass', '2026-09-03 05:48:11');

-- --------------------------------------------------------

--
-- Table structure for table `inventory`
--

CREATE TABLE `inventory` (
  `id` int(11) NOT NULL,
  `item_name` varchar(100) NOT NULL,
  `category` varchar(100) DEFAULT NULL,
  `min_stock` int(11) DEFAULT 0,
  `unit` varchar(50) DEFAULT 'pcs',
  `quantity` int(11) DEFAULT 0,
  `min_stock_alert` int(11) DEFAULT 5,
  `unit_cost` decimal(10,2) DEFAULT 0.00,
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `inventory`
--

INSERT INTO `inventory` (`id`, `item_name`, `category`, `min_stock`, `unit`, `quantity`, `min_stock_alert`, `unit_cost`, `updated_at`) VALUES
(1, 'light', 'Electrical', 5, 'pcs', 10, 5, 0.00, '2026-09-02 16:36:54'),
(3, 'sofa', 'Furniture', 10, 'pcs', 200, 5, 0.00, '2026-09-06 11:45:59'),
(4, 'ball', 'Electrical', 14, 'pcs', 13, 5, 0.00, '2026-09-06 11:46:45');

-- --------------------------------------------------------

--
-- Table structure for table `inventory_usage`
--

CREATE TABLE `inventory_usage` (
  `id` int(11) NOT NULL,
  `work_order_id` int(11) NOT NULL,
  `inventory_id` int(11) NOT NULL,
  `quantity_used` int(11) NOT NULL,
  `used_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `locations`
--

CREATE TABLE `locations` (
  `id` int(11) NOT NULL,
  `block_name` varchar(50) NOT NULL,
  `room_name` varchar(50) NOT NULL,
  `location_type` enum('Block','Classroom','Lab','Library','Toilet','Office','Other') DEFAULT 'Classroom'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `locations`
--

INSERT INTO `locations` (`id`, `block_name`, `room_name`, `location_type`) VALUES
(1, 'Block A', 'A101', 'Classroom'),
(2, 'Block DK', 'DK Main Lecture Hall', 'Classroom'),
(3, 'Cyber Centre', 'Lab 3', 'Lab'),
(4, 'Library', 'Level 2 Reading Room', 'Library'),
(5, 'Block B', 'B2 Ground Floor', 'Toilet'),
(6, 'Block M', 'M001', '');

-- --------------------------------------------------------

--
-- Table structure for table `maintenance_requests`
--

CREATE TABLE `maintenance_requests` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `block_location` varchar(50) NOT NULL,
  `room_number` varchar(20) NOT NULL,
  `category` enum('Electrical','Plumbing','Furniture','Air-Conditioning','IT Infrastructure','Other') NOT NULL,
  `priority` enum('Low','Medium','High','Urgent') DEFAULT 'Medium',
  `description` text NOT NULL,
  `status` enum('Pending','In Progress','Completed','Cancelled') DEFAULT 'Pending',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `ticket_no` varchar(50) DEFAULT NULL,
  `location` varchar(255) DEFAULT NULL,
  `attachment` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `maintenance_requests`
--

INSERT INTO `maintenance_requests` (`id`, `user_id`, `block_location`, `room_number`, `category`, `priority`, `description`, `status`, `created_at`, `updated_at`, `ticket_no`, `location`, `attachment`) VALUES
(1, 5, 'block m', 'a001', 'Electrical', '', 'help to do or fix it right now', 'In Progress', '2026-08-04 15:29:36', '2026-08-04 16:36:51', NULL, NULL, NULL),
(2, 5, 'block m', 'a001', 'Air-Conditioning', 'High', 'helpppppp', 'Completed', '2026-08-04 15:30:20', '2026-08-04 16:36:28', NULL, NULL, NULL),
(3, 1, 'block m', 'a001', 'Electrical', 'Medium', 'helpppppp', 'Cancelled', '2026-08-04 16:07:40', '2026-08-04 16:36:32', NULL, NULL, NULL),
(4, 1, 'libary', 'a001', 'Air-Conditioning', 'High', 'helpppp', 'Pending', '2026-09-02 07:48:45', '2026-09-02 07:48:45', 'TKT-20260902-9989', 'libary - a001', 'uploads/ticket_1788335325_1899.png'),
(5, 5, 'libary', '011', 'Electrical', 'High', 'aaaaaaaaaaaaaaaaa', 'Pending', '2026-09-02 08:11:33', '2026-09-02 08:11:33', 'TKT-20260902-9742', 'libary - 011', 'uploads/ticket_1788336693_7949.png'),
(6, 1, 'libary', '102', 'Air-Conditioning', 'High', '222222222aaaaaaaaaaaaaaaa', 'Pending', '2026-09-02 17:05:54', '2026-09-02 17:05:54', 'TKT-20260902-4868', 'libary - 102', 'uploads/ticket_1788368754_2388.png'),
(7, 1, 'libary', '133', 'Air-Conditioning', 'High', '111111111111111111133333333333', 'Pending', '2026-09-02 17:17:25', '2026-09-02 17:17:25', 'TKT-20260902-8576', 'libary - 133', 'uploads/ticket_1788369445_8888.png'),
(8, 1, 'libary', '011', 'Air-Conditioning', 'High', 'akNKandkND', 'Pending', '2026-09-02 17:25:58', '2026-09-02 17:25:58', 'TKT-20260902-8695', 'libary - 011', 'uploads/ticket_1788369958_1930.png'),
(9, 1, 'libary', '102', '', 'High', 'aaaaahhhhhhhhhhhhhhhhhhhhhhhhhhhh', 'Pending', '2026-09-03 06:00:35', '2026-09-03 06:00:35', 'TKT-20260903-6775', 'libary - 102', 'uploads/ticket_1788415235_5588.png'),
(10, 1, 'libary', '102', 'Furniture', '', 'oiujyhtgrfdesdfghjkl', 'Pending', '2026-09-03 06:20:16', '2026-09-03 06:20:16', 'TKT-20260903-2028', 'libary - 102', 'uploads/ticket_1788416416_9405.png'),
(11, 5, 'block m', 'biobb', 'Furniture', 'High', '09876rewsdfghjk', 'Completed', '2026-09-03 06:22:28', '2026-09-03 06:22:52', 'TKT-20260903-2393', 'block m - biobb', 'uploads/ticket_1788416548_9049.png'),
(12, 1, 'libary', '102', '', 'High', 'qddddddddddddd', 'Completed', '2026-09-03 17:30:31', '2026-09-03 17:32:25', 'TKT-20260903-8457', 'libary - 102', 'uploads/ticket_1788456631_7564.png'),
(13, 11, 'block m', 'M103', 'Air-Conditioning', 'High', 'panas sangat mai buat sat', 'Completed', '2026-09-06 15:17:22', '2026-09-06 15:21:12', 'TKT-20260906-6625', 'block m - M103', 'uploads/ticket_1788707842_6014.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

CREATE TABLE `notifications` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `target_role` varchar(50) DEFAULT NULL,
  `title` varchar(255) NOT NULL,
  `message` text NOT NULL,
  `type` varchar(50) DEFAULT 'info',
  `link` varchar(255) DEFAULT NULL,
  `is_read` tinyint(1) DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `role` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `notifications`
--

INSERT INTO `notifications` (`id`, `user_id`, `target_role`, `title`, `message`, `type`, `link`, `is_read`, `created_at`, `role`) VALUES
(1, NULL, NULL, 'New Request: TKT-20260903-8457', 'A new High priority IT Equipment request was submitted for libary - 102.', 'info', 'work_orders.php', 1, '2026-09-03 17:30:31', 'technician'),
(2, 1, NULL, 'Ticket Submitted', 'Your request TKT-20260903-8457 has been received and is pending review.', 'success', 'history.php', 0, '2026-09-03 17:30:31', NULL),
(3, 1, NULL, 'Work Order Completed', 'Great news! Your maintenance request TKT-20260903-8457 () has been marked as completed.', 'success', 'history.php', 0, '2026-09-03 17:32:32', NULL),
(4, 1, NULL, 'Work Order Updated', 'Your request TKT-20260903-6775 status was updated to \'Pending\'.', 'info', 'history.php', 0, '2026-09-06 10:42:06', NULL),
(5, NULL, NULL, 'New Request: TKT-20260906-6625', 'A new High priority Air-Conditioning request was submitted for block m - M103.', 'info', 'work_orders.php', 0, '2026-09-06 15:17:22', 'technician'),
(6, 11, NULL, 'Ticket Submitted', 'Your request TKT-20260906-6625 has been received and is pending review.', 'success', 'history.php', 0, '2026-09-06 15:17:22', NULL),
(7, 11, NULL, 'Work Order Completed', 'Great news! Your maintenance request TKT-20260906-6625 (Air-Conditioning) has been marked as completed.', 'success', 'history.php', 0, '2026-09-06 15:21:12', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `preventive_schedules`
--

CREATE TABLE `preventive_schedules` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `location` varchar(255) NOT NULL,
  `frequency_days` int(11) NOT NULL DEFAULT 30,
  `asset_id` int(11) DEFAULT NULL,
  `assigned_staff_id` int(11) DEFAULT NULL,
  `task_name` varchar(150) NOT NULL,
  `frequency` enum('Daily','Weekly','Monthly','Quarterly','Yearly') NOT NULL,
  `last_performed` date DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `next_due` date NOT NULL,
  `status` enum('Scheduled','Completed','Overdue') DEFAULT 'Scheduled'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `preventive_schedules`
--

INSERT INTO `preventive_schedules` (`id`, `title`, `location`, `frequency_days`, `asset_id`, `assigned_staff_id`, `task_name`, `frequency`, `last_performed`, `created_by`, `next_due`, `status`) VALUES
(4, 'alarm', 'libary', 90, NULL, NULL, '', 'Daily', '2026-09-06', 5, '0000-00-00', 'Scheduled'),
(5, 'water pipe', 'libary', 60, NULL, NULL, '', 'Daily', '2026-09-04', 5, '0000-00-00', 'Scheduled'),
(6, 'alarm', 'room', 7, NULL, NULL, '', 'Daily', '2026-09-01', 5, '0000-00-00', 'Scheduled'),
(7, 'libary', 'room12', 7, NULL, NULL, '', 'Daily', '2026-08-30', 5, '0000-00-00', 'Scheduled'),
(8, 'alarm', 'room12', 7, NULL, NULL, '', 'Daily', '2026-09-06', 5, '0000-00-00', 'Scheduled');

-- --------------------------------------------------------

--
-- Table structure for table `scheduled_maintenance`
--

CREATE TABLE `scheduled_maintenance` (
  `id` int(11) NOT NULL,
  `title` varchar(150) NOT NULL,
  `asset_name` varchar(150) NOT NULL,
  `location` varchar(150) NOT NULL,
  `frequency_days` int(11) NOT NULL DEFAULT 30,
  `last_performed` date DEFAULT NULL,
  `next_due_date` date NOT NULL,
  `assigned_role` enum('staff','technician','admin') DEFAULT 'technician',
  `status` enum('Pending','Due Soon','Completed','Overdue') DEFAULT 'Pending',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `system_logs`
--

CREATE TABLE `system_logs` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `action` varchar(100) NOT NULL,
  `details` text DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `tarumt_id` varchar(20) NOT NULL,
  `name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `role` enum('requester','technician','admin') DEFAULT 'requester',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `tarumt_id`, `name`, `email`, `phone`, `password`, `role`, `created_at`) VALUES
(1, '789@gmial.com', 'hx', '789@gmial.com', NULL, '$2y$10$od3JrCWt9ak03/Xq8mixuOMO4wqpzLRG4l4W9ZiJgrs2jYHMzObkq', 'requester', '2026-08-04 13:55:31'),
(5, '123@gmail.com', 'hx', '123@gmial.com', '', '$2y$10$A4QoXSiM8Vbk7CGu.CzuY.hHMiI2mbTBwZnJHHTlDTwj/FJjWTKzu', 'technician', '2026-08-04 15:15:08'),
(6, 'S12345', 'hx', '234@gmail.com', NULL, '$2y$10$OzoQlOoIb6ZJs8tn1AZgHudxg/aJnQqrqA2gv00qwBNIMa.D0vuru', 'technician', '2026-09-06 12:28:19'),
(7, '25pmd6893', 'hx', '111@gmail.com', NULL, '$2y$10$bbksy/SOZT8J4cmf7JEnsuTNPMAONtw0pyKlGfSu.qpewWEbkc4gi', 'requester', '2026-09-06 12:29:23'),
(11, '25pmd6894', 'hx', '123@gmail.com', NULL, '$2y$10$JL0R9uDZgpbUyrwO7vk9bOLSzRipJmiMKo5m4CtBsTQ1AfR/6zQfG', 'requester', '2026-09-06 15:02:15'),
(14, 'S12346', 'hx', '789@gmail.com', NULL, '$2y$10$kk8NQ1ny60rUhHN7PW4CdOIU6qTONN5tk8ADc3sCTMlekAqa1xIjS', 'technician', '2026-09-06 15:20:39'),
(16, 'S12342', 'hx', '321@gmail.com', NULL, '$2y$10$8asv4Gv9wnZLNF9.iCMG9uCcBXcCTvbaWK2NMpNlPKZLOY9S1ET7e', 'technician', '2026-09-08 02:23:03');

-- --------------------------------------------------------

--
-- Table structure for table `work_orders`
--

CREATE TABLE `work_orders` (
  `id` int(11) NOT NULL,
  `request_id` int(11) NOT NULL,
  `assigned_staff_id` int(11) NOT NULL,
  `created_by_admin` int(11) NOT NULL,
  `due_date` date NOT NULL,
  `work_notes` text DEFAULT NULL,
  `cost` decimal(10,2) DEFAULT 0.00,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `assets`
--
ALTER TABLE `assets`
  ADD PRIMARY KEY (`id`),
  ADD KEY `category_id` (`category_id`),
  ADD KEY `location_id` (`location_id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `category_name` (`category_name`);

--
-- Indexes for table `feedback`
--
ALTER TABLE `feedback`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `request_id` (`request_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `feedback_replies`
--
ALTER TABLE `feedback_replies`
  ADD PRIMARY KEY (`id`),
  ADD KEY `feedback_id` (`feedback_id`);

--
-- Indexes for table `inventory`
--
ALTER TABLE `inventory`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `inventory_usage`
--
ALTER TABLE `inventory_usage`
  ADD PRIMARY KEY (`id`),
  ADD KEY `work_order_id` (`work_order_id`),
  ADD KEY `inventory_id` (`inventory_id`);

--
-- Indexes for table `locations`
--
ALTER TABLE `locations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `maintenance_requests`
--
ALTER TABLE `maintenance_requests`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `target_role` (`target_role`),
  ADD KEY `is_read` (`is_read`);

--
-- Indexes for table `preventive_schedules`
--
ALTER TABLE `preventive_schedules`
  ADD PRIMARY KEY (`id`),
  ADD KEY `asset_id` (`asset_id`),
  ADD KEY `assigned_staff_id` (`assigned_staff_id`);

--
-- Indexes for table `scheduled_maintenance`
--
ALTER TABLE `scheduled_maintenance`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `system_logs`
--
ALTER TABLE `system_logs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `tarumt_id` (`tarumt_id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `work_orders`
--
ALTER TABLE `work_orders`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `request_id` (`request_id`),
  ADD KEY `assigned_staff_id` (`assigned_staff_id`),
  ADD KEY `created_by_admin` (`created_by_admin`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `assets`
--
ALTER TABLE `assets`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `feedback`
--
ALTER TABLE `feedback`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `feedback_replies`
--
ALTER TABLE `feedback_replies`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `inventory`
--
ALTER TABLE `inventory`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `inventory_usage`
--
ALTER TABLE `inventory_usage`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `locations`
--
ALTER TABLE `locations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `maintenance_requests`
--
ALTER TABLE `maintenance_requests`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `notifications`
--
ALTER TABLE `notifications`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `preventive_schedules`
--
ALTER TABLE `preventive_schedules`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `scheduled_maintenance`
--
ALTER TABLE `scheduled_maintenance`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `system_logs`
--
ALTER TABLE `system_logs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `work_orders`
--
ALTER TABLE `work_orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `feedback`
--
ALTER TABLE `feedback`
  ADD CONSTRAINT `feedback_ibfk_1` FOREIGN KEY (`request_id`) REFERENCES `maintenance_requests` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `feedback_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `feedback_replies`
--
ALTER TABLE `feedback_replies`
  ADD CONSTRAINT `feedback_replies_ibfk_1` FOREIGN KEY (`feedback_id`) REFERENCES `feedback` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `inventory_usage`
--
ALTER TABLE `inventory_usage`
  ADD CONSTRAINT `inventory_usage_ibfk_1` FOREIGN KEY (`work_order_id`) REFERENCES `work_orders` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `inventory_usage_ibfk_2` FOREIGN KEY (`inventory_id`) REFERENCES `inventory` (`id`);

--
-- Constraints for table `maintenance_requests`
--
ALTER TABLE `maintenance_requests`
  ADD CONSTRAINT `maintenance_requests_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `work_orders`
--
ALTER TABLE `work_orders`
  ADD CONSTRAINT `work_orders_ibfk_1` FOREIGN KEY (`request_id`) REFERENCES `maintenance_requests` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `work_orders_ibfk_2` FOREIGN KEY (`assigned_staff_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `work_orders_ibfk_3` FOREIGN KEY (`created_by_admin`) REFERENCES `users` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

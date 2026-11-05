-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 12, 2026 at 04:46 PM
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
-- Database: `books_stationery_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin_request`
--

CREATE TABLE `admin_request` (
  `id` varchar(40) NOT NULL,
  `user_id` varchar(36) DEFAULT NULL,
  `admin_id` varchar(36) DEFAULT NULL,
  `status` varchar(20) NOT NULL DEFAULT 'pending',
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `responded_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

CREATE TABLE `cart` (
  `cart_id` varchar(36) NOT NULL,
  `user_id` varchar(36) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cart_items`
--

CREATE TABLE `cart_items` (
  `cart_item_id` varchar(36) NOT NULL,
  `cart_id` varchar(36) DEFAULT NULL,
  `product_id` varchar(36) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `category_id` varchar(36) NOT NULL,
  `category_name` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`category_id`, `category_name`) VALUES
('1', 'Stationery & Writing'),
('2', 'Office Supplies'),
('3', 'Art Materials');

-- --------------------------------------------------------

--
-- Table structure for table `chat_messages`
--

CREATE TABLE `chat_messages` (
  `id` int(11) NOT NULL,
  `user_id` varchar(36) DEFAULT NULL,
  `message` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `chat_messages`
--

INSERT INTO `chat_messages` (`id`, `user_id`, `message`, `created_at`) VALUES
(1, '0', 'hi', '2026-04-07 03:59:37'),
(2, '0', 'Thank you for contacting Books & Stationery Store! 📚 An admin has been notified and will reply to you shortly. Our office hours are 9am - 6pm.', '2026-04-07 03:59:37'),
(3, '0', 'hello', '2026-04-10 08:26:23'),
(4, '0', '?', '2026-04-10 08:26:28'),
(5, '0', '1', '2026-04-10 08:27:04'),
(6, '0', '2', '2026-04-10 08:27:10'),
(7, '0', '1', '2026-04-10 08:27:34'),
(8, '0', '45', '2026-04-10 08:27:38'),
(9, 'ADM-980E7AA9', 'f', '2026-04-11 17:08:18'),
(10, 'ADM-980E7AA9', 'y ur a4 paper become half?', '2026-04-11 17:18:16'),
(11, 'ADM-980E7AA9', '??', '2026-04-11 17:18:23'),
(12, 'ADM-8AFE5C04', '1212321', '2026-04-12 05:42:09'),
(13, 'ADM-7CF81CA4', 'Thank you for contacting Books & Stationery Store! 📚 An admin has been notified and will reply to you shortly. Our office hours are 9am - 6pm.', '2026-04-12 05:42:09'),
(14, 'ADM-8AFE5C04', 'hello？', '2026-04-12 05:42:18'),
(15, 'ADM-7CF81CA4', 'Thank you for contacting Books & Stationery Store! 📚 An admin has been notified and will reply to you shortly. Our office hours are 9am - 6pm.', '2026-04-12 05:42:18');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `order_id` varchar(36) NOT NULL,
  `user_id` varchar(36) DEFAULT NULL,
  `total_amount` decimal(10,2) DEFAULT NULL,
  `status` varchar(50) DEFAULT NULL,
  `order_date` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `order_items`
--

CREATE TABLE `order_items` (
  `order_item_id` varchar(36) NOT NULL,
  `order_id` varchar(36) DEFAULT NULL,
  `product_id` varchar(36) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `price` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `product_id` varchar(36) NOT NULL,
  `product_name` varchar(100) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `price` decimal(10,2) DEFAULT NULL,
  `stock` int(11) DEFAULT NULL,
  `category_id` varchar(36) DEFAULT NULL,
  `photo` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`product_id`, `product_name`, `description`, `price`, `stock`, `category_id`, `photo`) VALUES
('P001', 'Blue Pen- 1pcs', 'Smooth writing blue ballpoint pen', 1.20, 93, '1', 'bluepen.png'),
('P002', 'Red Pen- 1pcs', 'Vibrant red ink pen for marking', 1.20, 99, '1', 'redpen.png'),
('P003', 'Black Pen- 1pcs', 'Standard black office pen', 1.20, 100, '1', 'blackpen.png'),
('P004', 'Colour Pencil- 10 Colours', 'Set of 10 break-resistant colour pencils', 14.90, 47, '1', 'colourpencil.png'),
('P005', 'Watercolour Pen- 15 Colours', 'Washable watercolour pens for kids', 21.00, 40, '3', 'watercolourpen.png'),
('P006', 'Paint Brush- 5pcs', 'Assorted sizes synthetic hair brushes', 14.00, 30, '3', 'paintbrush.png'),
('P007', 'Paint Colour 100ml- 15 Colours', 'High pigment acrylic paint set', 45.00, 20, '3', 'paintcolour.png'),
('P008', 'Notebook', 'A5 size ruled notebook 80 pages', 5.00, 200, '1', 'notebook.png'),
('P009', 'Foolscap Paper', 'High quality 70gsm foolscap paper', 5.00, 500, '2', 'foolscappaper.png'),
('P010', '570-ex Calculator', 'Scientific calculator for students', 102.00, 15, '2', 'calculator.png'),
('P011', 'Eraser- 10pcs', 'Dust-free white erasers', 12.00, 80, '1', 'eraser.png'),
('P012', 'Highlighter Pen- 10 Colours', 'Fluorescent neon highlighters', 15.00, 60, '1', 'highlighterpen.png'),
('P013', 'Ruler- 10pcs', '30cm clear plastic rulers', 10.00, 100, '1', 'ruler.png'),
('P014', 'Pencil- 10pcs', '2B graphite pencils for exam', 10.00, 150, '1', 'pencil.png'),
('P015', 'Crayon- 20 Colours', 'Non-toxic wax crayons for toddlers', 31.00, 100, '3', 'crayon.png');

-- --------------------------------------------------------

--
-- Table structure for table `reviews`
--

CREATE TABLE `reviews` (
  `review_id` int(11) NOT NULL,
  `product_id` varchar(36) DEFAULT NULL,
  `user_id` varchar(36) DEFAULT NULL,
  `rating` int(11) NOT NULL,
  `comment` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `token`
--

CREATE TABLE `token` (
  `id` varchar(100) NOT NULL,
  `code` varchar(6) NOT NULL,
  `expire` datetime NOT NULL,
  `user_id` varchar(36) DEFAULT NULL,
  `new_password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `token`
--

INSERT INTO `token` (`id`, `code`, `expire`, `user_id`, `new_password`) VALUES
('97d55b1a66fae2c218884254b60578c4eafc427b', '464140', '2026-04-12 20:52:05', 'ADM-B93AC945', '7c4a8d09ca3762af61e59520943dc26494f8941b');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` varchar(36) NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `role` enum('admin','member') DEFAULT NULL,
  `photo` varchar(255) DEFAULT NULL,
  `login_attempts` int(11) NOT NULL DEFAULT 0,
  `blocked_until` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `wishlist`
--

CREATE TABLE `wishlist` (
  `user_id` varchar(36) NOT NULL,
  `product_id` varchar(36) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `wishlist`
--

INSERT INTO `wishlist` (`user_id`, `product_id`, `created_at`) VALUES
('ADM-8AFE5C04', 'P004', '2026-04-12 05:52:08'),
('ADM-980E7AA9', 'P010', '2026-04-11 17:12:52'),
('ADM-980E7AA9', 'P011', '2026-04-11 17:12:56'),
('ADM-980E7AA9', 'P013', '2026-04-11 17:12:58'),
('ADM-980E7AA9', 'P015', '2026-04-11 17:12:16');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin_request`
--
ALTER TABLE `admin_request`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `admin_id` (`admin_id`);

--
-- Indexes for table `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`cart_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `cart_items`
--
ALTER TABLE `cart_items`
  ADD PRIMARY KEY (`cart_item_id`),
  ADD KEY `cart_id` (`cart_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`category_id`);

--
-- Indexes for table `chat_messages`
--
ALTER TABLE `chat_messages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`order_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `order_items`
--
ALTER TABLE `order_items`
  ADD PRIMARY KEY (`order_item_id`),
  ADD KEY `order_id` (`order_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`product_id`),
  ADD KEY `category_id` (`category_id`);

--
-- Indexes for table `reviews`
--
ALTER TABLE `reviews`
  ADD PRIMARY KEY (`review_id`);

--
-- Indexes for table `token`
--
ALTER TABLE `token`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `wishlist`
--
ALTER TABLE `wishlist`
  ADD PRIMARY KEY (`user_id`,`product_id`),
  ADD UNIQUE KEY `unique_wishlist` (`user_id`,`product_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `chat_messages`
--
ALTER TABLE `chat_messages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `reviews`
--
ALTER TABLE `reviews`
  MODIFY `review_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `admin_request`
--
ALTER TABLE `admin_request`
  ADD CONSTRAINT `admin_request_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `admin_request_ibfk_2` FOREIGN KEY (`admin_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `cart`
--
ALTER TABLE `cart`
  ADD CONSTRAINT `cart_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `cart_items`
--
ALTER TABLE `cart_items`
  ADD CONSTRAINT `cart_items_ibfk_1` FOREIGN KEY (`cart_id`) REFERENCES `cart` (`cart_id`),
  ADD CONSTRAINT `cart_items_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`);

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `order_items`
--
ALTER TABLE `order_items`
  ADD CONSTRAINT `order_items_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `orders` (`order_id`),
  ADD CONSTRAINT `order_items_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`);

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `categories` (`category_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

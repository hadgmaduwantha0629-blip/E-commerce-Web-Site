-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Mar 26, 2025 at 04:56 PM
-- Server version: 8.2.0
-- PHP Version: 8.2.13

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `footwearx`
--

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

DROP TABLE IF EXISTS `cart`;
CREATE TABLE IF NOT EXISTS `cart` (
  `cart_id` int NOT NULL AUTO_INCREMENT,
  `user_id` varchar(255) NOT NULL,
  `product_id` int NOT NULL,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`cart_id`),
  KEY `user_id` (`user_id`(250))
) ENGINE=MyISAM AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `cart`
--

INSERT INTO `cart` (`cart_id`, `user_id`, `product_id`, `updated_at`) VALUES
(24, 'freeportrait001@gmail.com', 3, '2025-03-22 11:05:12'),
(28, 'hadgmaduwantha0629@gmail.com', 1, '2025-03-22 14:25:43'),
(29, 'hadgmaduwantha0629@gmail.com', 8, '2025-03-25 06:00:07'),
(30, 'hadgmaduwantha0629@gmail.com', 4, '2025-03-25 06:00:13'),
(31, 'hadgmaduwantha0629@gmail.com', 2, '2025-03-25 06:00:20');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
CREATE TABLE IF NOT EXISTS `orders` (
  `order_id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `total_price` decimal(10,2) NOT NULL,
  `order_date` datetime DEFAULT CURRENT_TIMESTAMP,
  `product_id` int NOT NULL,
  `quantity` int NOT NULL,
  `payment_method` varchar(50) NOT NULL,
  `color` varchar(50) DEFAULT NULL,
  `size` varchar(50) DEFAULT NULL,
  `paid_status` enum('paid','cod_pending','site_visit_pending') NOT NULL DEFAULT 'cod_pending',
  `received_status` enum('pending','cod_pending','hold','delivered') NOT NULL DEFAULT 'pending',
  PRIMARY KEY (`order_id`),
  KEY `fk_product` (`product_id`),
  KEY `user_id` (`user_id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=42 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`order_id`, `user_id`, `total_price`, `order_date`, `product_id`, `quantity`, `payment_method`, `color`, `size`, `paid_status`, `received_status`) VALUES
(33, 22, 149.99, '2025-03-22 20:22:09', 8, 1, 'cod', 'white', '33', 'cod_pending', 'delivered'),
(32, 22, 160.00, '2025-03-22 20:20:33', 11, 1, 'cod', 'white', '33', 'cod_pending', 'cod_pending'),
(31, 22, 149.99, '2025-03-22 20:18:17', 8, 1, 'cod', 'white', '33', 'cod_pending', 'cod_pending'),
(30, 22, 200.00, '2025-03-22 20:17:25', 2, 2, 'cod', 'white', '33', 'cod_pending', 'cod_pending'),
(29, 22, 300.00, '2025-03-22 19:07:41', 2, 3, 'cod', 'white', '33', 'cod_pending', 'cod_pending'),
(28, 22, 50.59, '2025-03-22 18:32:08', 3, 1, 'cod', 'white', '33', 'cod_pending', 'cod_pending'),
(27, 22, 300.00, '2025-03-22 18:30:10', 13, 2, 'siteVisit', 'white', '33', 'site_visit_pending', 'hold'),
(26, 22, 300.00, '2025-03-22 18:28:55', 13, 2, '0', 'white', '33', 'site_visit_pending', 'hold'),
(19, 22, 813.36, '2025-03-21 13:41:30', 4, 3, '', 'black', '33', 'cod_pending', 'delivered'),
(20, 22, 101.18, '2025-03-21 14:10:44', 3, 2, '', 'white', '37', 'cod_pending', 'delivered'),
(21, 22, 252.95, '2025-03-21 15:55:25', 3, 5, '', 'white', '33', 'cod_pending', 'delivered'),
(22, 22, 50.59, '2025-03-21 16:17:27', 3, 1, '', 'white', '33', 'cod_pending', 'cod_pending'),
(23, 22, 813.36, '2025-03-21 16:19:01', 4, 3, '', 'white', '33', 'paid', 'delivered'),
(24, 22, 50.59, '2025-03-22 18:00:51', 3, 1, '', 'white', '33', 'paid', 'delivered'),
(25, 22, 271.12, '2025-03-22 18:16:17', 4, 1, '', 'white', '33', 'site_visit_pending', 'delivered'),
(34, 22, 149.99, '2025-03-22 20:22:29', 8, 1, 'cod', 'white', '33', 'cod_pending', 'cod_pending'),
(35, 22, 149.99, '2025-03-22 20:22:46', 8, 1, 'cod', 'white', '33', 'cod_pending', 'cod_pending'),
(36, 22, 100.00, '2025-03-24 12:52:28', 2, 1, 'cod', 'green', '35', 'cod_pending', 'cod_pending'),
(37, 22, 100.00, '2025-03-24 12:55:06', 2, 1, 'cod', 'white', '33', 'cod_pending', 'cod_pending'),
(38, 22, 100.00, '2025-03-24 14:18:35', 2, 1, 'cod', 'white', '33', 'cod_pending', 'cod_pending'),
(39, 22, 50.59, '2025-03-24 14:19:42', 3, 1, 'cod', 'white', '33', 'cod_pending', 'cod_pending'),
(40, 22, 542.24, '2025-03-26 13:38:05', 4, 2, 'cod', 'white', '33', 'cod_pending', 'cod_pending'),
(41, 22, 271.12, '2025-03-26 13:39:23', 4, 1, 'cod', 'white', '33', 'cod_pending', 'cod_pending');

-- --------------------------------------------------------

--
-- Table structure for table `payment_methods`
--

DROP TABLE IF EXISTS `payment_methods`;
CREATE TABLE IF NOT EXISTS `payment_methods` (
  `payment_id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `payment_type` enum('cod','card','siteVisit') NOT NULL,
  `card_number` varchar(16) DEFAULT NULL,
  `card_holder` varchar(100) DEFAULT NULL,
  `expiry_date` varchar(5) DEFAULT NULL,
  `cvv` varchar(4) DEFAULT NULL,
  `cod_name` varchar(100) DEFAULT NULL,
  `cod_address` text,
  `cod_description` text,
  `nic_number` varchar(12) DEFAULT NULL,
  `nic_name` varchar(100) DEFAULT NULL,
  `branch_name` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`payment_id`),
  KEY `user_id` (`user_id`)
) ENGINE=MyISAM AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
CREATE TABLE IF NOT EXISTS `products` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(253) DEFAULT NULL,
  `image` varchar(253) DEFAULT NULL,
  `price` decimal(10,2) DEFAULT NULL,
  `heel_height` varchar(50) DEFAULT NULL,
  `sku` varchar(50) DEFAULT NULL,
  `categories` text,
  `description` text,
  `reviews` text,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `quantity` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `name`, `image`, `price`, `heel_height`, `sku`, `categories`, `description`, `reviews`, `updated_at`, `quantity`) VALUES
(1, 'Nike Air Max Dn8', 'product1.png', 190.99, '10 inches', 'NIK-AMD8-001', 'Running Shoes, Sneakers, Men’s Footwear', 'Experience unparalleled comfort and movement with the Nike Air Max Dn8, featuring responsive cushioning and a sleek design.', 'John D.: \"Super comfortable and stylish! Worth the price.\" ⭐⭐⭐⭐⭐ | \r\n  Emma R.: \"Perfect for running, great support!\" ⭐⭐⭐⭐⭐ | \r\n  Mike B.: \"Love the design, but the size runs a bit small.\" ⭐⭐⭐⭐ | \r\n  Sarah K.: \"Very durable and lightweight, I wear them daily.\" ⭐⭐⭐⭐⭐ | \r\n  James L.: \"Good quality, but took a while to break in.\" ⭐⭐⭐⭐', '2025-03-21 06:26:32', 20),
(2, 'Nike C1TY', 'product2.png', 100.00, '1.2 inches', 'NIK-C1TY-002', 'Running Shoes, Casual Wear, Men’s Footwear', 'A mesh upper keeps the fit breathable, making this an excellent choice for everyday wear and running.', 'Alice T.: \"Very comfortable and stylish.\" ⭐⭐⭐⭐⭐ | \r\n  Robert M.: \"Breathability is great, but sizing runs a bit tight.\" ⭐⭐⭐⭐ | \r\n  Linda J.: \"Perfect for casual wear, love it!\" ⭐⭐⭐⭐⭐ | \r\n  Steve P.: \"Could use more cushioning, but overall great value.\" ⭐⭐⭐⭐ | \r\n  Susan W.: \"Lightweight and flexible, good for jogging.\" ⭐⭐⭐⭐⭐', '2025-03-24 08:48:35', 4),
(3, 'Eezay Flip-Flops', 'product3.avif', 50.59, '0.5 inches', 'PUMA-EEZAY-003', 'Flip-Flops, Casual, Beach Wear', 'Lightweight and durable flip-flops designed for everyday comfort and casual outings.', 'Michael R.: \"Super comfy and perfect for the beach!\" ⭐⭐⭐⭐⭐ | \r\n  Emma L.: \"Very lightweight, but could use more arch support.\" ⭐⭐⭐⭐ | \r\n  Daniel P.: \"Affordable and durable, love it!\" ⭐⭐⭐⭐⭐ | \r\n  Sophia K.: \"Simple design but high quality.\" ⭐⭐⭐⭐ | \r\n  Jason N.: \"Great for summer, easy to slip on and off.\" ⭐⭐⭐⭐⭐', '2025-03-24 08:49:42', 0),
(4, 'Speedcat OG', 'product4.avif', 271.12, '1.8 inches', 'SPD-OG-004', 'Formal, Luxury, Office Wear', 'Designed for formal occasions and office wear, the Speedcat OG offers premium style and durability.', 'David S.: \"Very elegant and comfortable!\" ⭐⭐⭐⭐⭐ | Jessica B.: \"Looks professional, but takes time to break in.\" ⭐⭐⭐⭐ | Tom H.: \"Excellent quality, worth the price.\" ⭐⭐⭐⭐⭐ | Rachel F.: \"Fits perfectly with my suits, love it.\" ⭐⭐⭐⭐⭐ | Andrew M.: \"Very classy and stylish, but needs polishing often.\" ⭐⭐⭐⭐', '2025-03-26 08:09:23', 0),
(5, 'floatZig X1 Shoes', 'product5.webp', 199.99, '1.7 inches', 'FLT-ZIGX1-005', 'Running Shoes, Performance, Lightweight', 'Lightweight running shoes designed for fast training and high performance.', 'Kevin P.: \"Amazing for fast runs, very responsive!\" ⭐⭐⭐⭐⭐ | Sandra L.: \"Super light, almost feels like walking on air.\" ⭐⭐⭐⭐⭐ | Chris D.: \"Great grip, but could use more arch support.\" ⭐⭐⭐⭐ | Nina W.: \"Perfect for long-distance running.\" ⭐⭐⭐⭐⭐ | Tom J.: \"Really comfortable, but expensive.\" ⭐⭐⭐⭐', '2025-03-18 08:12:03', 0),
(6, 'Adidas Ultraboost', 'product6.avif', 179.99, '1.8 inches', 'ADI-ULB-001', 'Running Shoes, Sneakers', 'Adidas Ultraboost delivers premium cushioning for long-lasting comfort.', 'Anna M.: \"Great support, feels amazing on my feet!\" ⭐⭐⭐⭐⭐ | Chris W.: \"Perfect for running, I feel more energized.\" ⭐⭐⭐⭐⭐ | Mike F.: \"Great fit, though a bit expensive.\" ⭐⭐⭐⭐', '2025-03-21 06:27:02', 3),
(7, 'Nike Air Zoom Pegasus 38', './product7.webp', 129.99, '1.2 inches', 'NIK-AZP-038', 'Running Shoes, Sports', 'Featuring breathable mesh and Zoom Air cushioning for explosive energy return.', 'Lucas P.: \"Best shoes for running, super light!\" ⭐⭐⭐⭐⭐ | Ella V.: \"Perfect fit and breathability.\" ⭐⭐⭐⭐⭐ | Ryan J.: \"Comfortable but could have more arch support.\" ⭐⭐⭐⭐', '2025-03-18 08:12:03', 0),
(8, 'Puma Speedcat', './product8.avif', 149.99, '1.4 inches', 'PUM-SPC-100', 'Sports, Sneakers', 'Puma Speedcat offers high-speed comfort with precision grip and style.', 'Mark S.: \"Great for sports, love the grip!\" ⭐⭐⭐⭐⭐ | Olivia T.: \"Comfortable and fits like a glove.\" ⭐⭐⭐⭐⭐ | George F.: \"Nice shoe, but I wish the sole was thicker.\" ⭐⭐⭐⭐', '2025-03-22 14:52:46', 5),
(9, 'Reebok Classic Leather', 'product9.jpeg', 109.99, '1.1 inches', 'REE-CLL-002', 'Casual Shoes, Sneakers', 'Reebok Classic Leather offers timeless design with a focus on comfort and durability.', 'Jessica R.: \"Comfortable for everyday wear.\" ⭐⭐⭐⭐⭐ | Chris M.: \"Classic look, but could be more breathable.\" ⭐⭐⭐⭐ | Daniel P.: \"Great price for the quality.\" ⭐⭐⭐⭐⭐', '2025-03-21 06:27:18', 7),
(10, 'New Balance Fresh Foam', 'product10.webp', 139.99, '1.6 inches', 'NB-FRM-010', 'Running Shoes, Sports', 'New Balance Fresh Foam combines responsive foam and a cushioned feel for every stride.', 'Emily G.: \"Fantastic comfort, perfect for long runs.\" ⭐⭐⭐⭐⭐|Oliver W.: \"Great for walking and running, very supportive.\" ⭐⭐⭐⭐⭐|Ava K.: \"Good shoe, but I wish it was a bit lighter.\" ⭐⭐⭐⭐', '2025-03-21 06:27:26', 3),
(11, 'Asics Gel-Kayano 27', 'product11.jpg', 160.00, '1.3 inches', 'ASC-GK27-003', 'Running Shoes, Sports', 'The Gel-Kayano 27 provides superior stability and cushioning for every stride.', 'Tom H.: \"Excellent support and comfort!\" ⭐⭐⭐⭐⭐|Jill S.: \"Perfect for long-distance runs, love them!\" ⭐⭐⭐⭐⭐|Ben R.: \"Great cushion but a bit heavy for my taste.\" ⭐⭐⭐⭐', '2025-03-22 14:50:33', 0),
(12, 'Under Armour HOVR Phantom', 'product12.jpg', 140.00, '1.0 inches', 'UA-HVPH-001', 'Running Shoes, Sports', 'These shoes feature HOVR technology for unmatched cushioning and energy return.', 'Andrew L.: \"Super comfortable, my feet feel fresh all day.\" ⭐⭐⭐⭐⭐|Rachel G.: \"Great bounce-back, perfect for training.\" ⭐⭐⭐⭐⭐|Sam D.: \"A bit too tight around the toes, but great overall.\" ⭐⭐⭐⭐', '2025-03-18 08:12:03', 0),
(13, 'Saucony Triumph 18', 'product13.jpg', 150.00, '1.2 inches', 'SAU-TRM18-005', 'Running Shoes, Sports', 'The Triumph 18 provides a smooth, plush ride thanks to its ample cushioning.', 'Michael T.: \"These shoes are incredibly cushioned, perfect for long runs.\" ⭐⭐⭐⭐⭐|Sarah H.: \"Great for recovery runs, feels like walking on clouds!\" ⭐⭐⭐⭐⭐|Tom K.: \"Too much cushioning for my liking, but great for others.\" ⭐⭐⭐⭐', '2025-03-22 13:00:10', 3),
(14, 'Vans Old Skool', 'product14.webp', 60.00, '1.0 inches', 'VNS-OS-010', 'Casual Shoes, Sneakers', 'The Old Skool features signature side stripes and sturdy canvas for everyday wear.', 'Liam J.: \"Classic look, goes with everything!\" ⭐⭐⭐⭐⭐|Sophie D.: \"Comfortable and stylish, great for daily wear.\" ⭐⭐⭐⭐⭐|Jack S.: \"Simple and durable, but could use more cushioning.\" ⭐⭐⭐⭐', '2025-03-21 06:27:45', 4),
(15, 'Puma Suede Classic', 'product15.webp', 75.00, '1.1 inches', 'PUM-SSC-004', 'Casual Shoes, Sneakers', 'The Puma Suede Classic combines comfort with a premium suede upper for a classic look.', 'James P.: \"Stylish and comfortable, my favorite pair!\" ⭐⭐⭐⭐⭐|Anna F.: \"Very versatile, can wear them anywhere.\" ⭐⭐⭐⭐⭐|Dave M.: \"Good quality but the material gets dirty easily.\" ⭐⭐⭐⭐', '2025-03-21 06:27:50', 7);

-- --------------------------------------------------------

--
-- Table structure for table `product_reviews`
--

DROP TABLE IF EXISTS `product_reviews`;
CREATE TABLE IF NOT EXISTS `product_reviews` (
  `review_id` int NOT NULL AUTO_INCREMENT,
  `product_id` int NOT NULL,
  `user_id` int NOT NULL,
  `pro_review` text NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`review_id`),
  KEY `product_id` (`product_id`),
  KEY `user_id` (`user_id`)
) ENGINE=MyISAM AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `product_reviews`
--

INSERT INTO `product_reviews` (`review_id`, `product_id`, `user_id`, `pro_review`, `created_at`) VALUES
(1, 2, 22, '1234', '2025-03-25 03:56:04'),
(2, 1, 22, 'bbbbb', '2025-03-25 03:57:01'),
(3, 2, 22, 'sdssssssdsd', '2025-03-25 03:58:14'),
(4, 2, 22, 'ghhfgfgfgbfgbf', '2025-03-25 03:58:22'),
(5, 1, 2, 'Great quality and super comfortable! Worth the price.', '2025-03-25 03:59:19'),
(6, 1, 3, 'Nice design, but the size runs a bit small.', '2025-03-25 03:59:19'),
(7, 2, 1, 'Absolutely love these shoes! Will buy again.', '2025-03-25 03:59:19'),
(8, 2, 4, 'Decent product, but delivery took longer than expected.', '2025-03-25 03:59:19'),
(9, 3, 5, 'Fantastic quality! Looks even better in real life.', '2025-03-25 03:59:19'),
(10, 3, 2, 'Comfortable fit and stylish. Perfect for casual wear.', '2025-03-25 03:59:19'),
(11, 4, 3, 'Not bad, but expected better material for the price.', '2025-03-25 03:59:19'),
(12, 4, 1, 'Amazing product! Fits perfectly and is very lightweight.', '2025-03-25 03:59:19'),
(13, 5, 25, 'I love these shoes! So stylish and comfy.', '2025-03-25 03:59:19'),
(14, 5, 25, 'The color is beautiful, and it feels premium.', '2025-03-25 03:59:19'),
(15, 1, 25, 'Nice shoes, but wish they had more color options.', '2025-03-25 03:59:19'),
(16, 1, 22, 'sfsdsdf', '2025-03-25 04:23:16'),
(17, 1, 22, 'sdfsdf', '2025-03-25 04:23:24'),
(18, 5, 22, 'dfdf', '2025-03-25 04:40:36'),
(19, 5, 22, 'fsdfsd', '2025-03-25 04:50:31'),
(20, 12, 22, 'sdsdfsd', '2025-03-25 05:07:31'),
(21, 12, 22, 'dfgdfgd', '2025-03-25 05:07:38'),
(22, 1, 22, 'sdfsdf', '2025-03-25 05:10:38'),
(23, 2, 22, 'wfs', '2025-03-25 05:11:18'),
(24, 1, 22, 'dfdfd', '2025-03-25 05:17:06'),
(25, 8, 22, 'nice', '2025-03-25 05:24:02');

-- --------------------------------------------------------

--
-- Table structure for table `reg_user`
--

DROP TABLE IF EXISTS `reg_user`;
CREATE TABLE IF NOT EXISTS `reg_user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `fullname` varchar(155) DEFAULT NULL,
  `email` varchar(155) NOT NULL,
  `password` varchar(155) DEFAULT NULL,
  `otp` varchar(6) NOT NULL,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `last_login` datetime DEFAULT NULL,
  PRIMARY KEY (`id`,`email`),
  UNIQUE KEY `email` (`email`)
) ENGINE=MyISAM AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `reg_user`
--

INSERT INTO `reg_user` (`id`, `fullname`, `email`, `password`, `otp`, `updated_at`, `last_login`) VALUES
(26, 'gevindu maduwantha', 'hadgmaduwantha0629@gmail.com', '$2y$10$e/8WO6AL5wCXTbOAn41sp.evZnMu/Q7tciFx2ST1zakFTPK4NaO.K', '', '2025-03-26 09:53:18', NULL),
(25, 'nuwan', 'freeportrait001@gmail.com', '$2y$10$wKel1ZtINY2qlggoU4UuHeqWZQgF/AJqCuNVh3kkcFcTZmvjnLUlO', '', '2025-03-22 19:00:23', '2025-03-22 13:38:28');

-- --------------------------------------------------------

--
-- Table structure for table `reviews`
--

DROP TABLE IF EXISTS `reviews`;
CREATE TABLE IF NOT EXISTS `reviews` (
  `name` varchar(100) NOT NULL,
  `review` varchar(200) NOT NULL,
  `date` date NOT NULL,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`date`,`review`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `reviews`
--

INSERT INTO `reviews` (`name`, `review`, `date`, `updated_at`) VALUES
('Amara Perera', 'Great selection of shoes! The quality is top-notch.', '2025-02-28', '2025-03-18 08:12:47'),
('gevindu', 'quality shoes', '2025-03-14', '2025-03-18 08:12:47'),
('Ruwan Fernando', 'Loved the quick delivery! The shoes fit perfectly.', '2025-03-01', '2025-03-18 08:12:47'),
('Nirmala Jayasinghe', 'Nice collection, but I wish there were more discounts.', '2025-03-02', '2025-03-18 08:12:47'),
('Janaka Bandara', 'The customer support was very helpful. Recommended!', '2025-03-03', '2025-03-18 08:12:47'),
('Tharushi Senanayake', 'Good variety, but I received the wrong size initially.', '2025-03-04', '2025-03-18 08:12:47'),
('Vimukthi De Silva', 'Amazing quality shoes at reasonable prices.', '2025-03-05', '2025-03-18 08:12:47'),
('Isuru Wijesinghe', 'The website is easy to use, and the checkout process is smooth.', '2025-03-06', '2025-03-18 08:12:47'),
('Sandali Rathnayake', 'Received my order on time. The packaging was great!', '2025-03-07', '2025-03-18 08:12:47'),
('Dilan Amarasinghe', 'Loved the design of the sneakers I bought.', '2025-03-08', '2025-03-18 08:12:47'),
('Menaka Gamage', 'Ordered for the first time, and I am very satisfied.', '2025-03-09', '2025-03-18 08:12:47'),
('Pasan Karunaratne', 'Affordable prices and good customer service.', '2025-03-10', '2025-03-18 08:12:47'),
('Hasini Wickramasinghe', 'My go-to store for all my shoe needs!', '2025-03-11', '2025-03-18 08:12:47'),
('Kasun Perera', 'The delivery took a bit longer than expected.', '2025-03-12', '2025-03-18 08:12:47'),
('Ravindu Gunasekara', 'Excellent quality shoes. Will shop again.', '2025-03-13', '2025-03-18 08:12:47'),
('Kavindi Ekanayake', 'Loved the comfort of the heels I bought.', '2025-03-14', '2025-03-18 08:12:47'),
('Shenal Dias', 'Good collection, but stock runs out fast.', '2025-03-15', '2025-03-18 08:12:47'),
('Nadun Jayasuriya', 'Received a discount on my first purchase. Happy customer!', '2025-03-16', '2025-03-18 08:12:47'),
('Dinuka Samarasekara', 'Shoes are stylish and durable. Highly recommend!', '2025-03-17', '2025-03-18 08:12:47'),
('Shehani Abeykoon', 'Best online shoe store in Sri Lanka!', '2025-03-18', '2025-03-18 08:12:47'),
('Roshan Alwis', 'The quality is worth the price.', '2025-03-19', '2025-03-18 08:12:47'),
('Yasodhi Madushanka', 'The shoes were comfortable, but the delivery took a while.', '2025-03-20', '2025-03-18 08:12:47'),
('Heshan Dissanayake', 'Easy payment methods and fast checkout.', '2025-03-21', '2025-03-18 08:12:47'),
('Chamodi Peris', 'Loved the kids’ collection. My daughter is so happy!', '2025-03-22', '2025-03-18 08:12:47'),
('Mahesh Liyanage', 'A must-visit website for all shoe lovers.', '2025-03-23', '2025-03-18 08:12:47'),
('Sajith Ratnayake', 'Received my sneakers today, and they are perfect!', '2025-03-24', '2025-03-18 08:12:47'),
('Thilina Abeywardena', 'Great selection but needs more size options.', '2025-03-25', '2025-03-18 08:12:47'),
('Dinushi Balasooriya', 'I always buy my formal shoes from here.', '2025-03-26', '2025-03-18 08:12:47'),
('Supun Liyanage', 'Website is well-designed and user-friendly.', '2025-03-27', '2025-03-18 08:12:47'),
('Anjalie Fernando', 'The customer service team quickly resolved my issue.', '2025-03-28', '2025-03-18 08:12:47'),
('Sachintha Weerakoon', 'One of the best shopping experiences I’ve had online.', '2025-03-29', '2025-03-18 08:12:47'),
('madushan', 'good', '2025-03-21', '2025-03-21 20:17:41'),
('gevindu', 'good', '2025-03-26', '2025-03-26 09:44:59');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

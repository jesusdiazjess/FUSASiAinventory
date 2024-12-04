-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 24, 2024 at 11:22 AM
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
-- Database: `database`
--

-- --------------------------------------------------------

--
-- Table structure for table `brands`
--

CREATE TABLE `brands` (
  `brand_id` int(11) NOT NULL,
  `brand_name` varchar(255) NOT NULL,
  `brand_active` int(11) NOT NULL DEFAULT 0,
  `brand_status` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `brands`
--

INSERT INTO `brands` (`brand_id`, `brand_name`, `brand_active`, `brand_status`) VALUES
(1, 'GENERIC', 1, 2),
(2, 'BRANDED', 1, 2),
(3, 'BRANDED', 1, 1),
(4, 'GENERIC', 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `categories_id` int(11) NOT NULL,
  `categories_name` varchar(255) NOT NULL,
  `categories_active` int(11) NOT NULL DEFAULT 0,
  `categories_status` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`categories_id`, `categories_name`, `categories_active`, `categories_status`) VALUES
(1, 'Ransomware', 1, 2),
(2, 'Worm', 1, 2),
(3, 'Genuine Software', 1, 2),
(4, 'HEADACHE', 1, 2),
(5, 'Rx HEADACHE', 1, 2),
(6, 'Rx PAIN RELIEVER', 1, 2),
(7, 'Rx Antibiotics', 1, 2),
(8, 'Antibiotics', 1, 1),
(9, 'AntiFungal', 1, 1),
(10, 'Antidepressamt', 1, 1),
(11, 'Antiviral', 1, 1),
(12, 'Anti inflamatory', 1, 1),
(13, 'Vaccines', 1, 1),
(14, 'Pain Relievers', 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `order_id` int(11) NOT NULL,
  `order_date` date NOT NULL,
  `client_name` varchar(255) NOT NULL,
  `client_contact` varchar(255) NOT NULL,
  `sub_total` varchar(255) NOT NULL,
  `vat` varchar(255) NOT NULL,
  `total_amount` varchar(255) NOT NULL,
  `discount` varchar(255) NOT NULL,
  `grand_total` varchar(255) NOT NULL,
  `paid` varchar(255) NOT NULL,
  `due` varchar(255) NOT NULL,
  `payment_type` int(11) NOT NULL,
  `payment_status` int(11) NOT NULL,
  `payment_place` int(11) NOT NULL,
  `gstn` varchar(255) NOT NULL,
  `order_status` int(11) NOT NULL DEFAULT 0,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`order_id`, `order_date`, `client_name`, `client_contact`, `sub_total`, `vat`, `total_amount`, `discount`, `grand_total`, `paid`, `due`, `payment_type`, `payment_status`, `payment_place`, `gstn`, `order_status`, `user_id`) VALUES
(1, '2024-10-10', 'MR.', '981817', '600.00', '108.00', '708.00', '12', '696.00', '12', '684.00', 2, 1, 1, '108.00', 2, 1),
(2, '2024-10-11', 'MR.', '123', '600.00', '108.00', '708.00', '25', '683.00', '123', '560.00', 2, 1, 1, '108.00', 1, 1),
(3, '2024-10-05', 'FUSA', '87651', '1.00', '0.18', '1.18', '1', '0.18', '43', '-42.82', 1, 1, 1, '0.18', 1, 1),
(4, '2024-10-06', 'Kitty', '123', '45.00', '8.10', '53.10', '0', '53.10', '55', '-1.90', 2, 1, 2, '8.10', 1, 1),
(5, '2024-10-07', 'JESUS', '8976', '82.50', '14.85', '97.35', '0', '97.35', '100', '-2.65', 2, 1, 2, '14.85', 1, 1),
(6, '2024-10-18', 'IYAM', '991', '50.00', '9.00', '59.00', '0', '59.00', '50', '9.00', 2, 1, 2, '9.00', 2, 15),
(7, '2024-10-20', 'm', '09', '2020.00', '363.60', '2383.60', '0', '2383.60', '2390', '-6.40', 2, 1, 2, '363.60', 2, 1);

-- --------------------------------------------------------

--
-- Table structure for table `order_item`
--

CREATE TABLE `order_item` (
  `order_item_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL DEFAULT 0,
  `product_id` int(11) NOT NULL DEFAULT 0,
  `quantity` varchar(255) NOT NULL,
  `rate` varchar(255) NOT NULL,
  `total` varchar(255) NOT NULL,
  `order_item_status` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `order_item`
--

INSERT INTO `order_item` (`order_item_id`, `order_id`, `product_id`, `quantity`, `rate`, `total`, `order_item_status`) VALUES
(1, 1, 1, '1', '600', '600.00', 2),
(2, 2, 1, '1', '600', '600.00', 1),
(4, 3, 2, '1', '1', '1.00', 1),
(5, 4, 3, '30', '1.50', '45.00', 1),
(6, 5, 3, '55', '1.50', '82.50', 1),
(7, 6, 5, '5', '10', '50.00', 2),
(8, 7, 6, '101', '20', '2020.00', 2);

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `product_id` int(11) NOT NULL,
  `product_name` varchar(255) NOT NULL,
  `product_image` text NOT NULL,
  `brand_id` int(11) NOT NULL,
  `categories_id` int(11) NOT NULL,
  `quantity` varchar(255) NOT NULL,
  `rate` varchar(255) NOT NULL,
  `active` int(11) NOT NULL DEFAULT 0,
  `status` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`product_id`, `product_name`, `product_image`, `brand_id`, `categories_id`, `quantity`, `rate`, `active`, `status`) VALUES
(1, 'FUSASIS', '../assests/images/stock/77671197566fff7df66a5b.png', 1, 3, '0', '600', 1, 1),
(2, 'CHED_TES', '../assests/images/stock/132409586666fffc3a79401.jpg', 1, 3, '19', '1', 2, 2),
(3, 'Paracetamol', '../assests/images/stock/192565441667014b967a1f4.png', 1, 5, '15', '1.50', 2, 2),
(4, 'Amoxicilin', '../assests/images/stock/11695373986711fac120460.png', 4, 8, '20', '7', 1, 1),
(5, 'Penicilin', '../assests/images/stock/9321618526711faefd2369.png', 3, 8, '45', '10', 1, 1),
(6, 'Ibuprofen', '../assests/images/stock/5554235946711fb307d427.png', 3, 14, '-1', '20', 1, 1),
(7, 'ADHD', '../assests/images/stock/13275217666711fb5c70688.png', 3, 10, '200', '40', 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `user_id` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `username`, `password`, `email`) VALUES
(1, 'FUSASIA', '3b537d2e2bd611c164c06824e273ff8a', ''),
(13, 'admin', '21232f297a57a5a743894a0e4a801fc3', ''),
(14, 'DIA22-3422', 'a42e30e5df837bae3f161290dd8e6230', 'jesus.social@proton.me'),
(15, '22-3276', '018d4abe3fe574828b553cdb89b99540', ''),
(16, 'RUB22-3173', 'c9c90e3d0a2121ca8a992d7191cdec3f', '');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `brands`
--
ALTER TABLE `brands`
  ADD PRIMARY KEY (`brand_id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`categories_id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`order_id`);

--
-- Indexes for table `order_item`
--
ALTER TABLE `order_item`
  ADD PRIMARY KEY (`order_item_id`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`product_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `brands`
--
ALTER TABLE `brands`
  MODIFY `brand_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `categories_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `order_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `order_item`
--
ALTER TABLE `order_item`
  MODIFY `order_item_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `product`
--
ALTER TABLE `product`
  MODIFY `product_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

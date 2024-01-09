-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 14, 2023 at 09:11 PM
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
-- Database: `e_commerce`
--
CREATE DATABASE IF NOT EXISTS `dunkyandfilscorporation` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `dunkyandfilscorporation`;

-- --------------------------------------------------------

--
-- Table structure for table `address`
--

CREATE TABLE `address` (
  `uid_Address` int(11) NOT NULL,
  `email_Address` varchar(255) NOT NULL,
  `phone_number_Address` varchar(11) DEFAULT NULL,
  `address_Address` text DEFAULT NULL,
  `postal_code_Address` int(11) DEFAULT NULL,
  `city_Address` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `address`
--

INSERT INTO `address` (`uid_Address`, `email_Address`, `phone_number_Address`, `address_Address`, `postal_code_Address`, `city_Address`) VALUES
(1, '+76gGKuWLtQTyMZsUsQjxRerFlZ4rE64k2EApO6qiZs=', 'sDH0+Ndq+Ed', 'b0SshgyqovXAnu24irAsYOX8+nziz/3jDyRlfpt0AlWV+ZMimG08lIprOHIeO46w', 21147, 'Port Idellamouth'),
(2, 'xrD8EIz+qViGVyHLgyUNTC62cfnX6Nw2j5Y3flIYR2g=', 'B4ZrW1w78z/', 'xNRY+ofNvrKS9TeFy4388sA04RbjMhHu4bTqPWaqEmOezKL3KB0XswPgiToT3gwa', 53838, 'East Geovannimouth'),
(3, 'Q1hvsjjFohnISdmoI0BbNSKpc/E2t4h+QF93WwUDBAM=', 'LqAOs9+89tf', 'LsKMLcl5hqsLafNUj+36Vq55H4lWn68cwkwUyDp1EbGLEa/Ec1SN8hF3mhQgn8OXVibJc+so5qu3Bjspnf6p4Q==', 39356, 'Bergstromstad');

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

CREATE TABLE `cart` (
  `uid_Cart` int(11) NOT NULL,
  `content_Cart` text DEFAULT NULL,
  `uid_Command` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `cart`
--

INSERT INTO `cart` (`uid_Cart`, `content_Cart`, `uid_Command`) VALUES
(1, 'Nostrum nihil porro ad temporibus sit.', NULL),
(2, 'Sunt earum ad provident consequuntur quidem.', NULL),
(3, 'Voluptas sint et sit quia nulla velit.', 3);

-- --------------------------------------------------------

--
-- Table structure for table `choose`
--

CREATE TABLE `choose` (
  `uid_Customer` int(11) NOT NULL,
  `uid_Product` int(11) NOT NULL,
  `product_img_Photo` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `choose`
--

INSERT INTO `choose` (`uid_Customer`, `uid_Product`, `product_img_Photo`) VALUES
(1, 1, 'http://lorempixel.com/640/480/?43427'),
(2, 3, 'http://lorempixel.com/640/480/?33352'),
(3, 2, 'http://lorempixel.com/640/480/?99597');

-- --------------------------------------------------------

--
-- Table structure for table `command`
--

CREATE TABLE `command` (
  `uid_Command` bigint(20) NOT NULL,
  `date_Command` date DEFAULT NULL,
  `status_Command` varchar(9) DEFAULT NULL,
  `shipping_info_Command` text DEFAULT NULL,
  `uid_Cart` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `command`
--

INSERT INTO `command` (`uid_Command`, `date_Command`, `status_Command`, `shipping_info_Command`, `uid_Cart`) VALUES
(1, '1982-07-06', 'shipped', 'Sunt nobis quidem facilis voluptas doloribus.', NULL),
(2, '1970-02-02', 'delivered', 'Quis explicabo qui culpa illo voluptatem non et.', NULL),
(3, '1991-11-09', 'shipped', 'Occaecati quia accusantium voluptatibus.', 3);

-- --------------------------------------------------------

--
-- Table structure for table `e_create`
--

CREATE TABLE `e_create` (
  `uid_Command` bigint(20) NOT NULL,
  `uid_Cart` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `e_create`
--

INSERT INTO `e_create` (`uid_Command`, `uid_Cart`) VALUES
(1, NULL),
(2, NULL),
(3, 3);

-- --------------------------------------------------------

--
-- Table structure for table `e_use`
--

CREATE TABLE `e_use` (
  `uid_Customer` int(11) NOT NULL,
  `uid_Rate` int(11) NOT NULL,
  `uid_Product` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `e_use`
--

INSERT INTO `e_use` (`uid_Customer`, `uid_Rate`, `uid_Product`) VALUES
(1, 1, 1),
(2, 2, 1),
(3, 3, 3);

-- --------------------------------------------------------

--
-- Table structure for table `e_user`
--

CREATE TABLE `e_user` (
  `uid_Customer` int(11) NOT NULL,
  `username_User` varchar(30) DEFAULT NULL,
  `password_User` text DEFAULT NULL,
  `first_name_Customer` varchar(30) DEFAULT NULL,
  `last_name_Customer` varchar(30) DEFAULT NULL,
  `status_Customer` varchar(7) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `e_user`
--

INSERT INTO `e_user` (`uid_Customer`, `username_User`, `password_User`, `first_name_Customer`, `last_name_Customer`, `status_Customer`) VALUES
(1, 'Wiegand.Rodolfo', 'OSNligQQF4qV+Vb1/hHCKCQn93fwE9eFnfD08z4swtk=', 'Leanne', '5duhA8aySC8VmQLnjh1dDA==', 'online'),
(2, 'Orie48', 'gHlYqVn7vDG1uKbfy0ZK6w==', 'Ward', '4XzQx7kfGkR0i18u8vjTbw==', 'online'),
(3, 'Libby55', '0evpwYJHCdJtPP2p7ZXXuQ==', 'Wiley', '33i+nd0h0d4DWjUEskP+bw==', 'offline');

-- --------------------------------------------------------

--
-- Table structure for table `fill`
--

CREATE TABLE `fill` (
  `uid_Command` bigint(20) NOT NULL,
  `credit_cardNB_Payment` varchar(255) NOT NULL,
  `email_Address` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `fill`
--

INSERT INTO `fill` (`uid_Command`, `credit_cardNB_Payment`, `email_Address`) VALUES
(1, 'rm0sUhsOwDjlCRyO8ScMhQ==', '+76gGKuWLtQTyMZsUsQjxRerFlZ4rE64k2EApO6qiZs='),
(2, '0TNh5TU5D9PewbadJ3E2sg==', 'xrD8EIz+qViGVyHLgyUNTC62cfnX6Nw2j5Y3flIYR2g='),
(3, 'gwX3Thz8jWgw8DK7N69mwg==', 'Q1hvsjjFohnISdmoI0BbNSKpc/E2t4h+QF93WwUDBAM=');

-- --------------------------------------------------------

--
-- Table structure for table `invoices`
--

CREATE TABLE `invoices` (
  `uid_Invoices` int(11) NOT NULL,
  `uid_Product` int(11) NOT NULL,
  `name_Product` varchar(30) DEFAULT NULL,
  `price_Product` float DEFAULT NULL,
  `uid_Customer` int(11) NOT NULL,
  `quantity_Invoices` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `invoices`
--

INSERT INTO `invoices` (`uid_Invoices`, `uid_Product`, `name_Product`, `price_Product`, `uid_Customer`, `quantity_Invoices`) VALUES
(1, 2, 'vel', 740.22, 1, 3),
(2, 3, 'et', 864.86, 3, 2),
(3, 1, 'laudantium', 757.98, 3, 6);

-- --------------------------------------------------------

--
-- Table structure for table `own`
--

CREATE TABLE `own` (
  `uid_Customer` int(11) NOT NULL,
  `uid_Cart` int(11) NOT NULL,
  `email_Address` varchar(255) NOT NULL,
  `credit_cardNB_Payment` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `own`
--

INSERT INTO `own` (`uid_Customer`, `uid_Cart`, `email_Address`, `credit_cardNB_Payment`) VALUES
(1, 1, '+76gGKuWLtQTyMZsUsQjxRerFlZ4rE64k2EApO6qiZs=', 'rm0sUhsOwDjlCRyO8ScMhQ=='),
(2, 2, 'xrD8EIz+qViGVyHLgyUNTC62cfnX6Nw2j5Y3flIYR2g=', '0TNh5TU5D9PewbadJ3E2sg=='),
(3, 3, 'Q1hvsjjFohnISdmoI0BbNSKpc/E2t4h+QF93WwUDBAM=', 'gwX3Thz8jWgw8DK7N69mwg==');

-- --------------------------------------------------------

--
-- Table structure for table `payment`
--

CREATE TABLE `payment` (
  `uid_Payment` int(11) NOT NULL,
  `credit_cardNB_Payment` varchar(255) NOT NULL,
  `credit_Card_Type_Payment` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `payment`
--

INSERT INTO `payment` (`uid_Payment`, `credit_cardNB_Payment`, `credit_Card_Type_Payment`) VALUES
(1, 'rm0sUhsOwDjlCRyO8ScMhQ==', 'AHRhrD6P9Ru1rB6dssCDTw=='),
(2, '0TNh5TU5D9PewbadJ3E2sg==', 'AHRhrD6P9Ru1rB6dssCDTw=='),
(3, 'gwX3Thz8jWgw8DK7N69mwg==', '6C9TWmGAE3F3IXTwS6eHFQ==');

-- --------------------------------------------------------

--
-- Table structure for table `photo`
--

CREATE TABLE `photo` (
  `uid_Photo` int(11) NOT NULL,
  `product_img_Photo` varchar(255) NOT NULL,
  `avatar_img_Photo` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `photo`
--

INSERT INTO `photo` (`uid_Photo`, `product_img_Photo`, `avatar_img_Photo`) VALUES
(1, 'http://lorempixel.com/640/480/?43427', 'http://lorempixel.com/640/480/?23100'),
(2, 'http://lorempixel.com/640/480/?99597', 'http://lorempixel.com/640/480/?19537'),
(3, 'http://lorempixel.com/640/480/?33352', 'http://lorempixel.com/640/480/?90141');

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `uid_Product` int(11) NOT NULL,
  `name_Product` varchar(30) DEFAULT NULL,
  `description_Product` text DEFAULT NULL,
  `price_Product` float DEFAULT NULL,
  `stock_Product` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`uid_Product`, `name_Product`, `description_Product`, `price_Product`, `stock_Product`) VALUES
(1, 'laudantium', 'Ipsam sequi facilis sed.', 757.98, 12439),
(2, 'vel', 'Consectetur sit eveniet id dolor et tempora.', 740.22, 51567),
(3, 'et', 'Ut ducimus voluptatem distinctio adipisci.', 864.86, 49274);

-- --------------------------------------------------------

--
-- Table structure for table `rate`
--

CREATE TABLE `rate` (
  `uid_Rate` int(11) NOT NULL,
  `uid_Product` int(11) NOT NULL,
  `uid_Customer` int(11) NOT NULL,
  `rating_Rate` int(11) DEFAULT NULL,
  `review_Rate` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `rate`
--

INSERT INTO `rate` (`uid_Rate`, `uid_Product`, `uid_Customer`, `rating_Rate`, `review_Rate`) VALUES
(1, 1, 1, 2, 'Qui voluptatem quo et voluptatem.'),
(2, 1, 2, 4, 'Id at numquam cumque cupiditate.'),
(3, 3, 3, 3, 'Velit numquam consequatur quo ipsum similique et.');

-- --------------------------------------------------------

--
-- Table structure for table `store`
--

CREATE TABLE `store` (
  `uid_Command` bigint(20) NOT NULL,
  `uid_Invoices` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `store`
--

INSERT INTO `store` (`uid_Command`, `uid_Invoices`) VALUES
(1, '1'),
(2, '2'),
(3, '3');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `address`
--
ALTER TABLE `address`
  ADD PRIMARY KEY (`uid_Address`,`email_Address`);

--
-- Indexes for table `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`uid_Cart`),
  ADD KEY `FK_Cart_uid_Command` (`uid_Command`);

--
-- Indexes for table `choose`
--
ALTER TABLE `choose`
  ADD PRIMARY KEY (`uid_Customer`,`uid_Product`,`product_img_Photo`);

--
-- Indexes for table `command`
--
ALTER TABLE `command`
  ADD PRIMARY KEY (`uid_Command`),
  ADD KEY `FK_Command_uid_Cart` (`uid_Cart`);

--
-- Indexes for table `e_create`
--
ALTER TABLE `e_create`
  ADD PRIMARY KEY (`uid_Command`);

--
-- Indexes for table `e_use`
--
ALTER TABLE `e_use`
  ADD PRIMARY KEY (`uid_Customer`,`uid_Rate`,`uid_Product`);

--
-- Indexes for table `e_user`
--
ALTER TABLE `e_user`
  ADD PRIMARY KEY (`uid_Customer`);

--
-- Indexes for table `fill`
--
ALTER TABLE `fill`
  ADD PRIMARY KEY (`uid_Command`,`credit_cardNB_Payment`,`email_Address`);

--
-- Indexes for table `invoices`
--
ALTER TABLE `invoices`
  ADD PRIMARY KEY (`uid_Invoices`,`uid_Product`);

--
-- Indexes for table `own`
--
ALTER TABLE `own`
  ADD PRIMARY KEY (`uid_Customer`,`uid_Cart`,`email_Address`,`credit_cardNB_Payment`);

--
-- Indexes for table `payment`
--
ALTER TABLE `payment`
  ADD PRIMARY KEY (`uid_Payment`,`credit_cardNB_Payment`);

--
-- Indexes for table `photo`
--
ALTER TABLE `photo`
  ADD PRIMARY KEY (`uid_Photo`,`product_img_Photo`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`uid_Product`);

--
-- Indexes for table `rate`
--
ALTER TABLE `rate`
  ADD PRIMARY KEY (`uid_Rate`,`uid_Product`,`uid_Customer`);

--
-- Indexes for table `store`
--
ALTER TABLE `store`
  ADD PRIMARY KEY (`uid_Command`,`uid_Invoices`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `address`
--
ALTER TABLE `address`
  MODIFY `uid_Address` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `cart`
--
ALTER TABLE `cart`
  MODIFY `uid_Cart` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `choose`
--
ALTER TABLE `choose`
  MODIFY `uid_Customer` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `command`
--
ALTER TABLE `command`
  MODIFY `uid_Command` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `e_use`
--
ALTER TABLE `e_use`
  MODIFY `uid_Customer` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `e_user`
--
ALTER TABLE `e_user`
  MODIFY `uid_Customer` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `invoices`
--
ALTER TABLE `invoices`
  MODIFY `uid_Invoices` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `own`
--
ALTER TABLE `own`
  MODIFY `uid_Customer` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `payment`
--
ALTER TABLE `payment`
  MODIFY `uid_Payment` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `photo`
--
ALTER TABLE `photo`
  MODIFY `uid_Photo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `product`
--
ALTER TABLE `product`
  MODIFY `uid_Product` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `rate`
--
ALTER TABLE `rate`
  MODIFY `uid_Rate` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `store`
--
ALTER TABLE `store`
  MODIFY `uid_Command` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `cart`
--
ALTER TABLE `cart`
  ADD CONSTRAINT `FK_Cart_uid_Command` FOREIGN KEY (`uid_Command`) REFERENCES `command` (`uid_Command`);

--
-- Constraints for table `command`
--
ALTER TABLE `command`
  ADD CONSTRAINT `FK_Command_uid_Cart` FOREIGN KEY (`uid_Cart`) REFERENCES `cart` (`uid_Cart`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

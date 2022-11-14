-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 14, 2022 at 01:11 AM
-- Server version: 10.4.22-MariaDB
-- PHP Version: 8.1.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `eshop`
--

-- --------------------------------------------------------

--
-- Table structure for table `order_detail`
--

CREATE TABLE `order_detail` (
  `detail_id` int(11) NOT NULL,
  `detail_product_id` int(11) NOT NULL,
  `detail_qty` int(11) NOT NULL DEFAULT 1,
  `detail_price` float NOT NULL,
  `detail_order_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `order_detail`
--

INSERT INTO `order_detail` (`detail_id`, `detail_product_id`, `detail_qty`, `detail_price`, `detail_order_id`) VALUES
(3, 1, 1, 65, 31),
(4, 2, 19, 5, 31),
(5, 1, 19, 65, 32),
(6, 3, 1, 25, 32),
(7, 4, 9, 19, 32),
(8, 8, 11, 12, 32),
(9, 1, 1, 65, 35),
(10, 2, 1, 5, 35),
(20, 1, 1, 65, 49),
(21, 2, 5, 5, 49),
(55, 3, 1, 25, 70),
(56, 5, 2, 5, 71),
(57, 8, 2, 12, 71),
(58, 4, 1, 19, 72),
(59, 3, 1, 25, 73),
(60, 6, 5, 24, 73),
(61, 4, 9, 19, 74),
(62, 7, 7, 33, 74),
(63, 6, 1, 24, 74),
(64, 5, 1, 5, 75),
(65, 2, 2, 5, 76),
(66, 7, 7, 33, 76),
(67, 6, 14, 24, 76),
(68, 5, 29, 5, 77),
(69, 2, 19, 5, 77);

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `product_id` int(11) NOT NULL,
  `product_name` varchar(255) NOT NULL,
  `product_description` text NOT NULL,
  `product_price` float NOT NULL,
  `product_stock` int(11) NOT NULL,
  `product_image` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`product_id`, `product_name`, `product_description`, `product_price`, `product_stock`, `product_image`) VALUES
(1, 'DVD Player', 'The ultra compact DVD Player with intelligent multi-disc resume function, will keep the whole family entertained. Requires DVDs to play.', 65, 100, 'dvd-image.jpg'),
(2, 'Stylish Black Cap', 'A simplistic black cap can make a statement: \"I\'m wearing a black cap\".  This snap back style cap features a mesh back. Available colours: black', 5, 20, 'black-hat.jpg'),
(3, 'Round Basket Ball', 'From Round Balls is this Dominate Basketball that is for outdoor use and features an easier hand alignment and ball control with a soft-touch cushioned rubber that has an aggressive pebbled texture cover.', 25, 30, 'nike-ball.jpg'),
(4, 'Novelty Coffee Cup', 'Ever wanted to see how much coffee is left in your coffee cup? This novelty coffee cup with a cork heat resistant band is a great replacement to the paper cups given at local cafes. Never be left wondering do you still have coffee in your cup!', 19, 10, 'coffee-cup.jpg'),
(5, 'Can Holder', 'Organise your cans of drink in your fridge. Save Space, while having more cold drinks. ', 5, 30, 'drink-holder.jpg'),
(6, 'Novelty Light', 'Ever wanted to set the mood at night? This novelty light will make you feel like you\'re in a theme park!', 24, 15, 'novelty-light.jpg'),
(7, 'Hover Ball', 'Who needs a drone! This hover ball is great way to spend your weekends. Choking Hazard: Do not swallow the ball.', 33, 8, 'hover-ball.jpg'),
(8, 'Whisky Decanter', 'Nothing says sophistication better than a cheap decanter! Hand blown and comes with 2 tumblers.', 12, 13, 'decanter.jpg'),
(9, 'Stapler', 'This ply wood hand stapler is ergonomic allowing you to staple for hours. With its easy refilling mechanism it is essential for any home office. Staple holding capcity before refil: 5 staples.', 50, 0, 'stapler.jpg'),
(10, 'Dart Board', 'Liven up your parties by gathering around the dart board. Because it is electronic it tallies the score for you! It wil keep the fun rolling well after the party has finished.', 5, 0, 'dart-board.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `user_id` int(11) NOT NULL,
  `user_email` varchar(255) NOT NULL,
  `user_password` varchar(255) NOT NULL,
  `user_fname` varchar(45) NOT NULL,
  `user_lname` varchar(45) NOT NULL,
  `user_street` varchar(45) NOT NULL,
  `user_suburb` varchar(45) NOT NULL,
  `user_state` varchar(3) NOT NULL,
  `user_post_code` varchar(5) NOT NULL,
  `user_type` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`user_id`, `user_email`, `user_password`, `user_fname`, `user_lname`, `user_street`, `user_suburb`, `user_state`, `user_post_code`, `user_type`) VALUES
(1, 'admin@example.com', '8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918', 'John', 'Smith', '5 Chocolate Ln', 'Wonker', 'NSW', '2000', 'admin'),
(2, 'user@example.com', '4234a9cea21fa911110cf36e96cd887049543ca31e7c95e04028290bde1db1e0', 'Sarah', 'Michals', '55 John Street', 'parramatta', 'NSW', '2500', 'user'),
(48, '20455936@student.westernsydney.edu.au', '27c687ecd15feaa7c78878a671e1cced436e48259872a0e41cffbed5e19bca21', 'Michael', 'Angeles', '2 John Street', 'Quakers Hill', 'NSW', '2765', 'user'),
(49, 'michael.angeles1983@gmail.com', '1ac46917668aa9f1f97c7b65da31e1007be48659f29fcaa7c5fe8c9eae4a22e7', 'Chris', 'Scott', '15 Scaddan Street', 'parramatta', 'NSW', '2765', 'user'),
(53, 'mic_angeles@hotmail.com', '564eda9dc32c87f3f87f1634d6aae557050d0ecf20be253d65ca4b602995be6c', 'John', 'Smaith', '1 dsfsdfsd', 'parramatta', 'NSW', '2765', 'user'),
(54, 'c.wiria@me.com', 'ee25be255009049e69e0ad05c08596895df2b683eb635c1c6d178d7cf41fe2cb', 'Christina', 'Wiria', '27 Mathew Street', 'Blacktown', 'NSW', '2765', 'user'),
(55, 'dog@gmail.com', '201204bdb8584f477fc56376d2ecd1b2d5ce49f8d3bf5d05d7e4483ee85f3101', 'Harry', 'Potter', '15 Over Road', 'Cabramatta', 'NSW', '4567', 'user'),
(61, 'm@me.com', '55c382190674e477c6071ccc7a196dcc1ef66735f9e19323857a1626b287f486', 'Mark', 'Santos', '4 John street', 'parramatta', 'NSW', '2765', 'user'),
(62, 'gymp@gmail.com', '80af8846c4593d49bf96d093e9583cade31f3650f852114924ecc083b61f9fa3', 'Cam', 'Stansil', '1 Gymp Street', 'parramatta', 'NSW', '2765', 'user'),
(64, 'mic@gmail.com', 'c67cb0c443638fac85453062bdfb31483173737d97a01c2f353aee1e0e4d29e3', 'Mikael', 'Anglz', '4 Marion Street', 'Eastwood', 'NSW', '2587', 'user'),
(65, 'm@hot.com', '79e603e6ea3404e09fd2c83802db66767f25b6af8e9d0bb3e65c837218bf645a', 'Reyn', 'Angeles', '1 Markus Avenue', 'Parra', 'NSW', '2000', 'user'),
(66, 'testing@gmail.com', 'e2e81497493badb39e5d6eef8faf04550e44848e3738993fdc685a800a2b5f0a', 'Jason', 'Williams', '1 Grot Street', 'Parramatta', 'NSW', '2765', 'user'),
(67, 'hi@gmail.com', 'e2e81497493badb39e5d6eef8faf04550e44848e3738993fdc685a800a2b5f0a', 'Jay', 'Connor', '3 Grot', 'Parra', 'NSW', '2765', 'user'),
(68, 'reyn@gmail.com', 'e2e81497493badb39e5d6eef8faf04550e44848e3738993fdc685a800a2b5f0a', 'Reyn', 'Angeles', '1 Madeup', 'Hurtsville', 'TAS', '2435', 'user');

-- --------------------------------------------------------

--
-- Table structure for table `user_order`
--

CREATE TABLE `user_order` (
  `order_id` int(11) NOT NULL,
  `order_datetime` datetime NOT NULL,
  `order_user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `user_order`
--

INSERT INTO `user_order` (`order_id`, `order_datetime`, `order_user_id`) VALUES
(31, '2022-01-31 02:06:00', 2),
(32, '2022-01-31 02:17:18', 2),
(35, '2022-01-31 04:11:45', 48),
(49, '2022-02-01 01:49:40', 54),
(50, '2022-02-02 03:48:55', 2),
(51, '2022-02-02 03:52:16', 2),
(52, '2022-02-02 07:55:54', 2),
(53, '2022-02-02 07:59:20', 2),
(54, '2022-02-02 08:20:33', 2),
(60, '2022-02-03 04:52:09', 2),
(61, '2022-02-03 05:19:36', 2),
(67, '2022-02-03 07:25:21', 2),
(68, '2022-02-03 10:55:51', 2),
(69, '2022-02-03 11:22:57', 2),
(70, '2022-02-04 12:40:21', 2),
(71, '2022-04-28 03:29:49', 64),
(72, '2022-04-28 08:37:44', 65),
(73, '2022-05-03 08:31:59', 64),
(74, '2022-05-11 02:14:59', 64),
(75, '2022-11-11 06:38:38', 67),
(76, '2022-11-14 01:07:34', 67),
(77, '2022-11-14 01:10:01', 67);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `order_detail`
--
ALTER TABLE `order_detail`
  ADD PRIMARY KEY (`detail_id`),
  ADD KEY `order_fk_idx` (`detail_order_id`),
  ADD KEY `product_fk_idx` (`detail_product_id`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`product_id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`user_id`);

--
-- Indexes for table `user_order`
--
ALTER TABLE `user_order`
  ADD PRIMARY KEY (`order_id`),
  ADD KEY `user_fk_idx` (`order_user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `order_detail`
--
ALTER TABLE `order_detail`
  MODIFY `detail_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=70;

--
-- AUTO_INCREMENT for table `product`
--
ALTER TABLE `product`
  MODIFY `product_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=69;

--
-- AUTO_INCREMENT for table `user_order`
--
ALTER TABLE `user_order`
  MODIFY `order_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=78;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `order_detail`
--
ALTER TABLE `order_detail`
  ADD CONSTRAINT `order_fk` FOREIGN KEY (`detail_order_id`) REFERENCES `user_order` (`order_id`),
  ADD CONSTRAINT `product_fk` FOREIGN KEY (`detail_product_id`) REFERENCES `product` (`product_id`);

--
-- Constraints for table `user_order`
--
ALTER TABLE `user_order`
  ADD CONSTRAINT `user_fk` FOREIGN KEY (`order_user_id`) REFERENCES `user` (`user_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

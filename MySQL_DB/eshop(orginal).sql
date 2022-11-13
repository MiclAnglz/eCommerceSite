-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Jan 17, 2022 at 03:13 PM
-- Server version: 8.0.20
-- PHP Version: 8.0.13

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
  `detail_id` int NOT NULL,
  `detail_product_id` int NOT NULL,
  `detail_qty` int NOT NULL DEFAULT '1',
  `detail_price` float NOT NULL,
  `detail_order_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `product_id` int NOT NULL,
  `product_name` varchar(255) NOT NULL,
  `product_description` text NOT NULL,
  `product_price` float NOT NULL,
  `product_stock` int NOT NULL,
  `product_image` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`product_id`, `product_name`, `product_description`, `product_price`, `product_stock`, `product_image`) VALUES
(1, 'DVD Player', 'The ultra compact DVD Player with intelligent multi-disc resume function, will keep the whole family entertained. Requires DVDs to play.', 65, 5, 'dvd-image.jpg'),
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
  `user_id` int NOT NULL,
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
(2, 'user@example.com', '4234a9cea21fa911110cf36e96cd887049543ca31e7c95e04028290bde1db1e0', 'Sarah', 'Michaels', '55 Bourbon St', 'Distillery', 'NSW', '2500', 'user');

-- --------------------------------------------------------

--
-- Table structure for table `user_order`
--

CREATE TABLE `user_order` (
  `order_id` int NOT NULL,
  `order_datetime` datetime NOT NULL,
  `order_user_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
  MODIFY `detail_id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `product`
--
ALTER TABLE `product`
  MODIFY `product_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `user_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `user_order`
--
ALTER TABLE `user_order`
  MODIFY `order_id` int NOT NULL AUTO_INCREMENT;

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

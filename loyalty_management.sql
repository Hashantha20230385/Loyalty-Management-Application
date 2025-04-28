-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 28, 2025 at 07:05 PM
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
-- Database: `loyalty_management`
--

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

CREATE TABLE `customers` (
  `customer_id` int(11) NOT NULL,
  `first_name` varchar(50) NOT NULL,
  `last_name` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `mobile` varchar(15) NOT NULL,
  `address` text NOT NULL,
  `identification_no` varchar(50) NOT NULL,
  `earned_points` int(11) DEFAULT 0,
  `redeemed_points` int(11) DEFAULT 0,
  `available_points` int(11) DEFAULT 0,
  `tier` varchar(20) DEFAULT 'Purple',
  `join_date` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `customers`
--

INSERT INTO `customers` (`customer_id`, `first_name`, `last_name`, `email`, `mobile`, `address`, `identification_no`, `earned_points`, `redeemed_points`, `available_points`, `tier`, `join_date`) VALUES
(10000001, 'Kamal', 'Perera', 'kamal.perera@email.com', '0771234567', '42, Galle Road, Colombo 3', '958423156V', 1500, 300, 1200, 'Gold', '2025-04-27 02:41:03'),
(10000002, 'Nimalika', 'Fernando', 'nimalika.f@email.com', '0712345678', '15, Kandy Road, Kandy', '865271963V', 3500, 500, 3000, 'Platinum', '2025-04-27 02:41:03'),
(10000003, 'Ashan', 'Silva', 'ashan.silva@email.com', '0772345679', '78, Beach Road, Galle', '923456789V', 750, 100, 650, 'Purple', '2025-04-27 02:41:03'),
(10000004, 'Chamari', 'Jayawardena', 'chamari.j@email.com', '0761234560', '23, Hospital Road, Matara', '886745321V', 2100, 400, 1700, 'Gold', '2025-04-27 02:41:03'),
(10000005, 'Ruwan', 'Wickramasinghe', 'ruwan.w@email.com', '0777891234', '56, Main Street, Negombo', '911234567V', 800, 0, 800, 'Purple', '2025-04-27 02:41:03'),
(10000006, 'Dilanthi', 'Bandara', 'dilanthi.b@email.com', '0789876543', '90, Temple Road, Anuradhapura', '895423678V', 3200, 600, 2600, 'Platinum', '2025-04-27 02:41:03'),
(10000007, 'Kasun', 'Rajapaksa', 'kasun.raj@email.com', '0775432109', '34, Park Avenue, Colombo 7', '943561289V', 450, 50, 400, 'Purple', '2025-04-27 02:41:03'),
(10000008, 'Sachini', 'Gunasekara', 'sachini.g@email.com', '0763452190', '67, Lake Road, Kurunegala', '968234567V', 1800, 250, 1550, 'Gold', '2025-04-27 02:41:03'),
(10000009, 'Janith', 'Dissanayake', 'janith.d@email.com', '0772134569', '12, Hill Street, Nuwara Eliya', '912345678V', 950, 150, 800, 'Purple', '2025-04-27 02:41:03'),
(10000010, 'Isuri', 'Wijesinghe', 'isuri.w@email.com', '0754321098', '89, School Lane, Ratnapura', '875423918V', 2700, 300, 2400, 'Gold', '2025-04-27 02:41:03'),
(10000011, 'Chathura', 'Senanayake', 'chathura.s@email.com', '0718765432', '45, Market Road, Jaffna', '903456789V', 600, 0, 600, 'Purple', '2025-04-27 02:41:03'),
(10000012, 'Madhavi', 'Ranasinghe', 'madhavi.r@email.com', '0769871234', '23, Station Road, Trincomalee', '847561234V', 4200, 1000, 3200, 'Platinum', '2025-04-27 02:41:03'),
(10000013, 'Tharindu', 'Mendis', 'tharindu.m@email.com', '0773214567', '56, College Road, Badulla', '932145678V', 1100, 100, 1000, 'Gold', '2025-04-27 02:41:03'),
(10000014, 'Dilini', 'Herath', 'dilini.h@email.com', '0713456789', '78, Temple Lane, Polonnaruwa', '896732145V', 850, 50, 800, 'Purple', '2025-04-27 02:41:03'),
(10000015, 'Nishan', 'Gamage', 'nishan.g@email.com', '0779876543', '90, Beach Road, Hikkaduwa', '951234567V', 2300, 500, 1800, 'Gold', '2025-04-27 02:41:03'),
(10000016, 'Sanduni', 'Samaraweera', 'sanduni.s@email.com', '0783456789', '34, Garden Lane, Maharagama', '878654321V', 700, 100, 600, 'Purple', '2025-04-27 02:41:03'),
(10000017, 'Pasan', 'Jayasuriya', 'pasan.j@email.com', '0764567890', '67, Railway Avenue, Moratuwa', '923457890V', 3800, 800, 3000, 'Platinum', '2025-04-27 02:41:03'),
(10000018, 'Gayani', 'Kariyawasam', 'gayani.k@email.com', '0775678901', '12, Church Road, Panadura', '885432167V', 950, 150, 800, 'Purple', '2025-04-27 02:41:03'),
(10000019, 'Dimuthu', 'Abeyratne', 'dimuthu.a@email.com', '0712789654', '45, Green Lane, Kegalle', '908765432V', 1600, 200, 1400, 'Gold', '2025-04-27 02:41:03'),
(10000020, 'Nadeesha', 'Weerasinghe', 'nadeesha.w@email.com', '0786543219', '23, River Road, Chilaw', '867543219V', 2900, 400, 2500, 'Gold', '2025-04-27 02:41:03'),
(10000021, 'Lakshan', 'Munasinghe', 'lakshan.m@email.com', '0773459876', '56, Mountain View, Bandarawela', '934567890V', 780, 80, 700, 'Purple', '2025-04-27 02:41:03'),
(10000022, 'Chathurika', 'Gunaratne', 'chathurika.g@email.com', '0767894561', '89, City Center, Batticaloa', '896543217V', 1200, 200, 1000, 'Gold', '2025-04-27 02:41:03'),
(10000023, 'Sameera', 'Ratnayake', 'sameera.r@email.com', '0714567890', '34, Fort Road, Galle', '921876543V', 3100, 600, 2500, 'Platinum', '2025-04-27 02:41:03'),
(10000024, 'Hiruni', 'Pathirana', 'hiruni.p@email.com', '0779871234', '67, Queens Road, Kandy', '887654321V', 650, 50, 600, 'Purple', '2025-04-27 02:41:03'),
(10000025, 'Dinesh', 'Liyanage', 'dinesh.l@email.com', '0785432109', '90, Main Road, Hambantota', '957894321V', 1900, 300, 1600, 'Gold', '2025-04-27 02:41:03'),
(10000026, 'Hashantha', 'Abewickrema', 'hashanthada12@gmail.com', '0774007218', '498, Galle Road, Colombo03', '19908908765V', 0, 0, 0, 'Purple', '2025-04-27 10:45:39'),
(10000027, 'Peter', 'Sullivan', 'peter123@email.com', '07123456789', '498, Galle Road, Colombo03', '123456789V', 0, 0, 0, 'Purple', '2025-04-27 11:11:59'),
(10000028, 'Nimal', 'Perera', 'nimalp@email.com', '0711051695', '498, Galle Road, Colombo03', '1990533476V', 0, 0, 0, 'Purple', '2025-04-28 06:16:48'),
(10000029, 'Umeshika', 'Silva', 'umeshika1@email.com', '0761234567', '498, Galle Road, Colombo03', '19945322456V', 0, 0, 0, 'Purple', '2025-04-28 07:23:18');

-- --------------------------------------------------------

--
-- Table structure for table `customer_segments`
--

CREATE TABLE `customer_segments` (
  `segment_id` int(11) NOT NULL,
  `segment_name` varchar(100) NOT NULL,
  `criteria` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`criteria`)),
  `created_by` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `customer_segments`
--

INSERT INTO `customer_segments` (`segment_id`, `segment_name`, `criteria`, `created_by`, `created_at`) VALUES
(1, 'Loyalty Purple Customers', '{\"tier\":\"Purple\",\"min_points\":500}', 2, '2025-04-27 05:54:10');

-- --------------------------------------------------------

--
-- Table structure for table `loyalty_history`
--

CREATE TABLE `loyalty_history` (
  `loyalty_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `invoice_id` varchar(50) DEFAULT NULL,
  `status` enum('earned','redeemed','cancelled','expired') NOT NULL,
  `points` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `loyalty_history`
--

INSERT INTO `loyalty_history` (`loyalty_id`, `customer_id`, `invoice_id`, `status`, `points`, `created_at`) VALUES
(173, 10000001, 'INV2024001', 'earned', 900, '2024-01-05 05:00:00'),
(174, 10000001, 'INV2024002', 'earned', 600, '2024-02-15 08:50:00'),
(175, 10000001, 'INV2024002', 'redeemed', 300, '2024-02-15 08:50:00'),
(176, 10000002, 'INV2024003', 'earned', 2000, '2024-01-10 05:45:00'),
(177, 10000002, 'INV2024004', 'earned', 1500, '2024-02-20 10:15:00'),
(178, 10000002, 'INV2024004', 'redeemed', 500, '2024-02-20 10:15:00'),
(179, 10000003, 'INV2024005', 'earned', 500, '2024-01-12 07:50:00'),
(180, 10000003, 'INV2024006', 'earned', 250, '2024-02-22 10:40:00'),
(181, 10000003, 'INV2024006', 'redeemed', 100, '2024-02-22 10:40:00'),
(182, 10000004, 'INV2024007', 'earned', 1200, '2024-01-15 04:30:00'),
(183, 10000004, 'INV2024008', 'earned', 900, '2024-02-28 09:00:00'),
(184, 10000004, 'INV2024008', 'redeemed', 400, '2024-02-28 09:00:00'),
(185, 10000005, 'INV2024009', 'earned', 800, '2024-01-18 06:15:00'),
(186, 10000006, 'INV2024010', 'earned', 1500, '2024-01-20 03:45:00'),
(187, 10000006, 'INV2024011', 'earned', 1000, '2024-02-10 09:30:00'),
(188, 10000006, 'INV2024011', 'redeemed', 200, '2024-02-10 09:30:00'),
(189, 10000006, 'INV2024012', 'earned', 700, '2024-03-10 05:00:00'),
(190, 10000006, 'INV2024012', 'redeemed', 400, '2024-03-10 05:00:00'),
(191, 10000007, 'INV2024013', 'earned', 450, '2024-01-22 09:10:00'),
(192, 10000007, 'INV2024013', 'redeemed', 50, '2024-01-22 09:10:00'),
(193, 10000008, 'INV2024014', 'earned', 1000, '2024-01-25 05:50:00'),
(194, 10000008, 'INV2024015', 'earned', 800, '2024-02-15 11:00:00'),
(195, 10000008, 'INV2024015', 'redeemed', 250, '2024-02-15 11:00:00'),
(196, 10000009, 'INV2024016', 'earned', 600, '2024-01-28 04:40:00'),
(197, 10000009, 'INV2024017', 'earned', 350, '2024-03-05 08:15:00'),
(198, 10000009, 'INV2024017', 'redeemed', 150, '2024-03-05 08:15:00'),
(199, 10000010, 'INV2024018', 'earned', 1500, '2024-01-30 04:20:00'),
(200, 10000010, 'INV2024019', 'earned', 1200, '2024-02-20 09:45:00'),
(201, 10000010, 'INV2024019', 'redeemed', 300, '2024-02-20 09:45:00'),
(202, 10000011, 'INV2024020', 'earned', 600, '2024-02-01 06:00:00'),
(203, 10000012, 'INV2024021', 'earned', 2000, '2024-02-05 05:15:00'),
(204, 10000012, 'INV2024022', 'earned', 1500, '2024-03-12 10:30:00'),
(205, 10000012, 'INV2024022', 'redeemed', 500, '2024-03-12 10:30:00'),
(206, 10000012, 'INV2024023', 'earned', 700, '2024-04-02 08:50:00'),
(207, 10000012, 'INV2024023', 'redeemed', 500, '2024-04-02 08:50:00'),
(208, 10000013, 'INV2024024', 'earned', 700, '2024-02-08 04:00:00'),
(209, 10000013, 'INV2024025', 'earned', 400, '2024-03-15 07:50:00'),
(210, 10000013, 'INV2024025', 'redeemed', 100, '2024-03-15 07:50:00'),
(211, 10000014, 'INV2024026', 'earned', 500, '2024-02-10 05:45:00'),
(212, 10000014, 'INV2024027', 'earned', 350, '2024-03-18 10:10:00'),
(213, 10000014, 'INV2024027', 'redeemed', 50, '2024-03-18 10:10:00'),
(214, 10000015, 'INV2024028', 'earned', 1300, '2024-02-12 04:30:00'),
(215, 10000015, 'INV2024029', 'earned', 1000, '2024-03-20 09:00:00'),
(216, 10000015, 'INV2024029', 'redeemed', 500, '2024-03-20 09:00:00'),
(217, 10000016, 'INV2024030', 'earned', 400, '2024-02-15 04:15:00'),
(218, 10000016, 'INV2024031', 'earned', 300, '2024-03-22 10:40:00'),
(219, 10000016, 'INV2024031', 'redeemed', 100, '2024-03-22 10:40:00'),
(220, 10000017, 'INV2024032', 'earned', 2000, '2024-02-18 06:00:00'),
(221, 10000017, 'INV2024033', 'earned', 1800, '2024-03-25 08:20:00'),
(222, 10000017, 'INV2024033', 'redeemed', 800, '2024-03-25 08:20:00'),
(223, 10000018, 'INV2024034', 'earned', 500, '2024-02-20 04:50:00'),
(224, 10000018, 'INV2024035', 'earned', 450, '2024-03-28 09:30:00'),
(225, 10000018, 'INV2024035', 'redeemed', 150, '2024-03-28 09:30:00'),
(226, 10000019, 'INV2024036', 'earned', 1000, '2024-02-22 03:45:00'),
(227, 10000019, 'INV2024037', 'earned', 600, '2024-03-30 09:10:00'),
(228, 10000019, 'INV2024037', 'redeemed', 200, '2024-03-30 09:10:00'),
(229, 10000020, 'INV2024038', 'earned', 1500, '2024-02-25 05:30:00'),
(230, 10000020, 'INV2024039', 'earned', 1000, '2024-04-01 10:50:00'),
(231, 10000020, 'INV2024039', 'redeemed', 200, '2024-04-01 10:50:00'),
(232, 10000020, 'INV2024040', 'earned', 400, '2024-04-10 04:45:00'),
(233, 10000020, 'INV2024040', 'redeemed', 200, '2024-04-10 04:45:00'),
(234, 10000021, 'INV2024041', 'earned', 780, '2024-02-28 05:00:00'),
(235, 10000021, 'INV2024041', 'redeemed', 80, '2024-02-28 05:00:00'),
(236, 10000022, 'INV2024042', 'earned', 700, '2024-03-02 04:15:00'),
(237, 10000022, 'INV2024043', 'earned', 500, '2024-04-05 08:50:00'),
(238, 10000022, 'INV2024043', 'redeemed', 200, '2024-04-05 08:50:00'),
(239, 10000023, 'INV2024044', 'earned', 1500, '2024-03-05 05:45:00'),
(240, 10000023, 'INV2024045', 'earned', 1600, '2024-04-08 09:00:00'),
(241, 10000023, 'INV2024045', 'redeemed', 600, '2024-04-08 09:00:00'),
(242, 10000024, 'INV2024046', 'earned', 400, '2024-03-08 04:30:00'),
(243, 10000024, 'INV2024047', 'earned', 250, '2024-04-10 10:15:00'),
(244, 10000024, 'INV2024047', 'redeemed', 50, '2024-04-10 10:15:00'),
(245, 10000025, 'INV2024048', 'earned', 1000, '2024-03-10 06:00:00'),
(246, 10000025, 'INV2024049', 'earned', 900, '2024-04-12 10:45:00'),
(247, 10000025, 'INV2024049', 'redeemed', 300, '2024-04-12 10:45:00');

-- --------------------------------------------------------

--
-- Table structure for table `loyalty_tiers`
--

CREATE TABLE `loyalty_tiers` (
  `tier_id` int(11) NOT NULL,
  `tier_name` varchar(50) NOT NULL,
  `threshold` int(11) NOT NULL,
  `discount` decimal(5,2) DEFAULT 0.00,
  `description` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `loyalty_tiers`
--

INSERT INTO `loyalty_tiers` (`tier_id`, `tier_name`, `threshold`, `discount`, `description`) VALUES
(1, 'Purple', 0, 0.00, 'Entry level tier'),
(2, 'Gold', 1000, 5.00, 'Gold tier with 5% discount'),
(3, 'Platinum', 3000, 10.00, 'Platinum tier with 10% discount');

-- --------------------------------------------------------

--
-- Table structure for table `points_structure`
--

CREATE TABLE `points_structure` (
  `id` int(11) NOT NULL,
  `spend_amount` decimal(10,2) NOT NULL,
  `points_awarded` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `points_structure`
--

INSERT INTO `points_structure` (`id`, `spend_amount`, `points_awarded`, `created_at`, `updated_at`) VALUES
(1, 200.00, 1, '2025-04-27 03:51:35', '2025-04-27 03:51:35');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `product_id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `category` varchar(50) NOT NULL,
  `selling_price` decimal(10,2) NOT NULL,
  `discount` decimal(5,2) DEFAULT 0.00
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`product_id`, `name`, `category`, `selling_price`, `discount`) VALUES
(1, 'LG OLED 65\" 4K Smart TV', 'TV & Home Entertainment', 899999.00, 5.00),
(2, 'Samsung 75\" QLED 8K TV', 'TV & Home Entertainment', 1299999.00, 10.00),
(3, 'Sony 55\" Bravia XR TV', 'TV & Home Entertainment', 399999.00, 8.00),
(4, 'Bose Soundbar 700', 'Home Audio', 189999.00, 5.00),
(5, 'JBL Flip 6 Bluetooth Speaker', 'Portable Audio', 39999.00, 5.00),
(6, 'Sony Home Theater System', 'Home Audio', 149999.00, 10.00),
(7, 'Bose QuietComfort Headphones', 'Personal Audio', 89999.00, 5.00),
(8, 'Apple AirPods Pro 2', 'Personal Audio', 69999.00, 3.00),
(9, 'Samsung Galaxy S24 Ultra 256GB', 'Mobile Phones', 389999.00, 3.00),
(10, 'Apple iPhone 15 Pro 128GB', 'Mobile Phones', 449999.00, 2.00),
(11, 'Apple iPad Pro 12.9\"', 'Tablets', 299999.00, 5.00),
(12, 'Dell XPS 13 Laptop i7', 'Laptops', 329999.00, 8.00),
(13, 'HP Envy 15 Laptop', 'Laptops', 259999.00, 10.00),
(14, 'Lenovo ThinkPad X1 Carbon', 'Laptops', 379999.00, 7.00),
(15, 'Sony PlayStation 5 Console', 'Gaming Consoles', 189999.00, 0.00),
(16, 'Xbox Series X Console', 'Gaming Consoles', 179999.00, 0.00),
(17, 'Nintendo Switch OLED', 'Gaming Consoles', 99999.00, 3.00),
(18, 'Logitech Gaming Keyboard', 'Gaming Accessories', 29999.00, 10.00),
(19, 'LG Side by Side Refrigerator 687L', 'Refrigerators', 459999.00, 12.00),
(20, 'Samsung Twin Cooling Plus Fridge', 'Refrigerators', 349999.00, 10.00),
(21, 'Haier Bottom Freezer 350L', 'Refrigerators', 189999.00, 8.00),
(22, 'Bosch Dishwasher 14 Place', 'Dishwashers', 159999.00, 12.00),
(23, 'Whirlpool Washing Machine 12kg', 'Washing Machines', 179999.00, 10.00),
(24, 'LG TwinWash 10/7kg', 'Washing Machines', 249999.00, 15.00),
(25, 'Abans Air Conditioner 18000BTU', 'Air Conditioners', 149999.00, 15.00),
(26, 'Gree Inverter AC 12000BTU', 'Air Conditioners', 129999.00, 12.00),
(27, 'Orient Stand Fan 16\"', 'Fans', 8999.00, 10.00),
(28, 'Abans Ceiling Fan 56\"', 'Fans', 12999.00, 10.00),
(29, 'Philips Air Fryer XL', 'Kitchen Appliances', 44999.00, 10.00),
(30, 'Kenwood Stand Mixer', 'Kitchen Appliances', 89999.00, 7.00),
(31, 'Panasonic Microwave Oven 32L', 'Kitchen Appliances', 34999.00, 8.00),
(32, 'Abans Rice Cooker 5L', 'Kitchen Appliances', 8999.00, 8.00),
(33, 'Moulinex Food Processor', 'Kitchen Appliances', 39999.00, 10.00),
(34, 'Nespresso Coffee Machine', 'Kitchen Appliances', 59999.00, 5.00),
(35, 'Tefal Steam Iron 2400W', 'Garment Care', 12999.00, 5.00),
(36, 'Philips Vacuum Cleaner 2000W', 'Home Care', 29999.00, 15.00),
(37, 'Braun Hair Dryer Pro', 'Personal Care', 14999.00, 10.00),
(38, 'Philips Electric Shaver', 'Personal Care', 24999.00, 8.00),
(39, 'Ashley Leather Sofa Set 3+2+1', 'Living Room Furniture', 389999.00, 15.00),
(40, 'La-Z-Boy Recliner Chair', 'Living Room Furniture', 149999.00, 10.00),
(41, 'Hatil Queen Size Bed Frame', 'Bedroom Furniture', 89999.00, 10.00),
(42, 'Spring Air Mattress Ortho', 'Mattresses', 64999.00, 20.00),
(43, 'Home Office Dining Table 6-Seater', 'Dining Furniture', 129999.00, 12.00),
(44, 'Ikea Wardrobe 3 Door', 'Storage Furniture', 79999.00, 10.00),
(45, 'Herman Miller Office Chair', 'Office Furniture', 89999.00, 15.00),
(46, 'Prestige Cookware Set 10pcs', 'Cookware', 29999.00, 10.00),
(47, 'Luminarc Dinnerware Set 40pcs', 'Tableware', 19999.00, 15.00),
(48, 'Pyrex Glass Container Set', 'Food Storage', 7999.00, 5.00),
(49, 'Zwilling Knife Set 7pcs', 'Kitchen Tools', 39999.00, 8.00),
(50, 'Under Armour HOVR Phantom 3', 'Athletic Footwear', 44999.00, 10.00),
(51, 'Under Armour Charged Assert 9', 'Athletic Footwear', 24999.00, 15.00),
(52, 'Under Armour Project Rock Training Shoes', 'Athletic Footwear', 49999.00, 5.00),
(53, 'Under Armour Storm Backpack', 'Bags & Accessories', 14999.00, 10.00),
(54, 'Under Armour Tech Polo Shirt', 'Athletic Apparel', 8999.00, 15.00),
(55, 'Under Armour Rival Fleece Hoodie', 'Athletic Apparel', 12999.00, 10.00),
(56, 'Under Armour Compression Shorts', 'Athletic Apparel', 7999.00, 20.00),
(57, 'Under Armour Gym Duffel Bag', 'Bags & Accessories', 11999.00, 8.00),
(58, 'Skechers GO WALK 6', 'Lifestyle Footwear', 22999.00, 15.00),
(59, 'Skechers Max Cushioning Elite', 'Athletic Footwear', 29999.00, 10.00),
(60, 'Skechers D Lites Fresh Start', 'Lifestyle Footwear', 19999.00, 20.00),
(61, 'Skechers Arch Fit Running Shoes', 'Athletic Footwear', 27999.00, 12.00),
(62, 'Skechers Relaxed Fit Sandals', 'Casual Footwear', 9999.00, 15.00),
(63, 'Skechers Bobs Sport Squad', 'Lifestyle Footwear', 17999.00, 10.00),
(64, 'Skechers Work Shoes Slip Resistant', 'Work Footwear', 21999.00, 8.00),
(65, 'Skechers Backpack', 'Bags & Accessories', 8999.00, 10.00),
(66, 'Abans Generator 3.5KW', 'Power Equipment', 189999.00, 5.00),
(67, 'LG Solar Panel System 5KW', 'Solar Solutions', 799999.00, 10.00),
(68, 'Bosch Lawn Mower Electric', 'Gardening Equipment', 54999.00, 8.00),
(69, 'Karcher Pressure Washer', 'Outdoor Equipment', 39999.00, 12.00);

-- --------------------------------------------------------

--
-- Table structure for table `product_purchased`
--

CREATE TABLE `product_purchased` (
  `id` int(11) NOT NULL,
  `invoice_id` varchar(50) NOT NULL,
  `product_id` int(11) NOT NULL,
  `product_name` varchar(100) NOT NULL,
  `quantity` int(11) NOT NULL,
  `discount` decimal(5,2) DEFAULT 0.00,
  `amount` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `product_purchased`
--

INSERT INTO `product_purchased` (`id`, `invoice_id`, `product_id`, `product_name`, `quantity`, `discount`, `amount`) VALUES
(204, 'INV2024001', 23, 'Whirlpool Washing Machine 12kg', 1, 10.00, 161999.10),
(205, 'INV2024001', 33, 'Tefal Steam Iron 2400W', 1, 5.00, 12349.05),
(206, 'INV2024001', 60, 'Pyrex Glass Container Set', 1, 5.00, 7599.05),
(207, 'INV2024002', 26, 'Gree Inverter AC 12000BTU', 1, 12.00, 114399.12),
(208, 'INV2024002', 57, 'Skechers Backpack', 1, 10.00, 8099.10),
(209, 'INV2024003', 9, 'Samsung Galaxy S24 Ultra 256GB', 1, 3.00, 378299.03),
(210, 'INV2024003', 36, 'Philips Electric Shaver', 1, 8.00, 22999.08),
(211, 'INV2024004', 11, 'Apple iPad Pro 12.9\"', 1, 5.00, 284999.05),
(212, 'INV2024004', 35, 'Braun Hair Dryer Pro', 1, 10.00, 13499.10),
(213, 'INV2024005', 17, 'Nintendo Switch OLED', 1, 3.00, 96999.03),
(214, 'INV2024006', 29, 'Philips Air Fryer XL', 1, 10.00, 40499.10),
(215, 'INV2024006', 32, 'Abans Rice Cooker 5L', 1, 8.00, 8279.08),
(216, 'INV2024007', 24, 'LG TwinWash 10/7kg', 1, 15.00, 212499.15),
(217, 'INV2024007', 18, 'Logitech Gaming Keyboard', 1, 10.00, 26999.10),
(218, 'INV2024008', 16, 'Xbox Series X Console', 1, 0.00, 179999.00),
(219, 'INV2024009', 25, 'Abans Air Conditioner 18000BTU', 1, 15.00, 127499.15),
(220, 'INV2024009', 31, 'Panasonic Microwave Oven 32L', 1, 8.00, 32199.08),
(221, 'INV2024010', 12, 'Dell XPS 13 Laptop i7', 1, 8.00, 303599.08),
(222, 'INV2024011', 62, 'Abans Generator 3.5KW', 1, 5.00, 180499.05),
(223, 'INV2024011', 55, 'Skechers Relaxed Fit Sandals', 2, 15.00, 16998.30),
(224, 'INV2024012', 38, 'La-Z-Boy Recliner Chair', 1, 10.00, 134999.10),
(225, 'INV2024013', 30, 'Kenwood Stand Mixer', 1, 7.00, 83699.07),
(226, 'INV2024013', 47, 'Under Armour Compression Shorts', 1, 20.00, 6399.20),
(227, 'INV2024014', 21, 'Haier Bottom Freezer 350L', 1, 8.00, 174719.08),
(228, 'INV2024014', 51, 'Skechers Max Cushioning Elite', 1, 10.00, 26999.10),
(229, 'INV2024015', 6, 'Sony Home Theater System', 1, 10.00, 134999.10),
(230, 'INV2024015', 34, 'Philips Vacuum Cleaner 2000W', 1, 15.00, 25499.15),
(231, 'INV2024016', 41, 'Home Office Dining Table 6-Seater', 1, 12.00, 114399.12),
(232, 'INV2024017', 61, 'Zwilling Knife Set 7pcs', 1, 8.00, 36799.08),
(233, 'INV2024017', 49, 'Under Armour HOVR Phantom 3', 1, 10.00, 40499.10),
(234, 'INV2024018', 14, 'Lenovo ThinkPad X1 Carbon', 1, 7.00, 353399.07),
(235, 'INV2024019', 3, 'Sony 55\" Bravia XR TV', 1, 8.00, 367999.08),
(236, 'INV2024020', 26, 'Gree Inverter AC 12000BTU', 1, 12.00, 114399.12),
(237, 'INV2024021', 10, 'Apple iPhone 15 Pro 128GB', 1, 2.00, 440999.02),
(238, 'INV2024022', 13, 'HP Envy 15 Laptop', 1, 10.00, 233999.10),
(239, 'INV2024022', 8, 'Apple AirPods Pro 2', 1, 3.00, 67899.03),
(240, 'INV2024023', 22, 'Bosch Dishwasher 14 Place', 1, 12.00, 140799.12),
(241, 'INV2024024', 26, 'Gree Inverter AC 12000BTU', 1, 12.00, 114399.12),
(242, 'INV2024024', 54, 'Skechers Arch Fit Running Shoes', 1, 12.00, 24639.12),
(243, 'INV2024025', 7, 'Bose QuietComfort Headphones', 1, 5.00, 85499.05),
(244, 'INV2024026', 39, 'Hatil Queen Size Bed Frame', 1, 10.00, 80999.10),
(245, 'INV2024026', 59, 'Luminarc Dinnerware Set 40pcs', 1, 15.00, 16999.15),
(246, 'INV2024027', 40, 'Spring Air Mattress Ortho', 1, 20.00, 51999.20),
(247, 'INV2024027', 50, 'Skechers GO WALK 6', 1, 15.00, 19549.15),
(248, 'INV2024028', 20, 'Samsung Twin Cooling Plus Fridge', 1, 10.00, 314999.10),
(249, 'INV2024029', 4, 'Bose Soundbar 700', 1, 5.00, 180499.05),
(250, 'INV2024029', 56, 'Skechers Bobs Sport Squad', 1, 10.00, 16199.10),
(251, 'INV2024030', 43, 'Herman Miller Office Chair', 1, 15.00, 76499.15),
(252, 'INV2024031', 34, 'Nespresso Coffee Machine', 1, 5.00, 56999.05),
(253, 'INV2024031', 27, 'Orient Stand Fan 16\"', 1, 10.00, 8099.10),
(254, 'INV2024032', 10, 'Apple iPhone 15 Pro 128GB', 1, 2.00, 440999.02),
(255, 'INV2024033', 37, 'Ashley Leather Sofa Set 3+2+1', 1, 15.00, 331499.15),
(256, 'INV2024033', 58, 'Prestige Cookware Set 10pcs', 1, 10.00, 26999.10),
(257, 'INV2024034', 17, 'Nintendo Switch OLED', 1, 3.00, 96999.03),
(258, 'INV2024035', 42, 'Ikea Wardrobe 3 Door', 1, 10.00, 71999.10),
(259, 'INV2024035', 52, 'Skechers D Lites Fresh Start', 1, 20.00, 15999.20),
(260, 'INV2024036', 4, 'Bose Soundbar 700', 1, 5.00, 180499.05),
(261, 'INV2024036', 45, 'Under Armour Tech Polo Shirt', 2, 15.00, 15298.30),
(262, 'INV2024037', 38, 'La-Z-Boy Recliner Chair', 1, 10.00, 134999.10),
(263, 'INV2024038', 12, 'Dell XPS 13 Laptop i7', 1, 8.00, 303599.08),
(264, 'INV2024039', 23, 'Whirlpool Washing Machine 12kg', 1, 10.00, 161999.10),
(265, 'INV2024039', 5, 'JBL Flip 6 Bluetooth Speaker', 1, 5.00, 37999.05),
(266, 'INV2024040', 64, 'Bosch Lawn Mower Electric', 1, 8.00, 50599.08),
(267, 'INV2024040', 48, 'Under Armour Gym Duffel Bag', 3, 8.00, 33082.08),
(268, 'INV2024041', 25, 'Abans Air Conditioner 18000BTU', 1, 15.00, 127499.15),
(269, 'INV2024041', 44, 'Under Armour Storm Backpack', 2, 10.00, 26998.20),
(270, 'INV2024042', 38, 'La-Z-Boy Recliner Chair', 1, 10.00, 134999.10),
(271, 'INV2024043', 17, 'Nintendo Switch OLED', 1, 3.00, 96999.03),
(272, 'INV2024044', 12, 'Dell XPS 13 Laptop i7', 1, 8.00, 303599.08),
(273, 'INV2024045', 20, 'Samsung Twin Cooling Plus Fridge', 1, 10.00, 314999.10),
(274, 'INV2024046', 39, 'Hatil Queen Size Bed Frame', 1, 10.00, 80999.10),
(275, 'INV2024047', 29, 'Philips Air Fryer XL', 1, 10.00, 40499.10),
(276, 'INV2024047', 47, 'Under Armour Compression Shorts', 1, 20.00, 6399.20),
(277, 'INV2024048', 15, 'Sony PlayStation 5 Console', 1, 0.00, 189999.00),
(278, 'INV2024048', 55, 'Skechers Relaxed Fit Sandals', 1, 15.00, 8499.15),
(279, 'INV2024049', 21, 'Haier Bottom Freezer 350L', 1, 8.00, 174719.08),
(280, 'INV2024049', 60, 'Pyrex Glass Container Set', 1, 5.00, 7599.05);

-- --------------------------------------------------------

--
-- Table structure for table `rewards`
--

CREATE TABLE `rewards` (
  `reward_id` int(11) NOT NULL,
  `reward_name` varchar(100) NOT NULL,
  `points_required` int(11) NOT NULL,
  `discount_value` decimal(5,2) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `active` tinyint(1) DEFAULT 1,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `rewards`
--

INSERT INTO `rewards` (`reward_id`, `reward_name`, `points_required`, `discount_value`, `description`, `active`, `created_at`) VALUES
(1, 'Onboarding Rewards', 1, 15.00, '', 1, '2025-04-28 15:24:12');

-- --------------------------------------------------------

--
-- Table structure for table `segment_customers`
--

CREATE TABLE `segment_customers` (
  `id` int(11) NOT NULL,
  `segment_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `segment_customers`
--

INSERT INTO `segment_customers` (`id`, `segment_id`, `customer_id`) VALUES
(1, 1, 10000003),
(2, 1, 10000005),
(3, 1, 10000009),
(4, 1, 10000011),
(5, 1, 10000014),
(6, 1, 10000016),
(7, 1, 10000018),
(8, 1, 10000021),
(9, 1, 10000024);

-- --------------------------------------------------------

--
-- Table structure for table `transactions`
--

CREATE TABLE `transactions` (
  `invoice_id` varchar(50) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `total_amount` decimal(10,2) NOT NULL,
  `points_earned` int(11) DEFAULT 0,
  `points_redeemed` int(11) DEFAULT 0,
  `invoice_date` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `transactions`
--

INSERT INTO `transactions` (`invoice_id`, `customer_id`, `total_amount`, `points_earned`, `points_redeemed`, `invoice_date`) VALUES
('INV2024001', 10000001, 180000.00, 900, 0, '2024-01-05 05:00:00'),
('INV2024002', 10000001, 120000.00, 600, 300, '2024-02-15 08:50:00'),
('INV2024003', 10000002, 400000.00, 2000, 0, '2024-01-10 05:45:00'),
('INV2024004', 10000002, 300000.00, 1500, 500, '2024-02-20 10:15:00'),
('INV2024005', 10000003, 100000.00, 500, 0, '2024-01-12 07:50:00'),
('INV2024006', 10000003, 50000.00, 250, 100, '2024-02-22 10:40:00'),
('INV2024007', 10000004, 240000.00, 1200, 0, '2024-01-15 04:30:00'),
('INV2024008', 10000004, 180000.00, 900, 400, '2024-02-28 09:00:00'),
('INV2024009', 10000005, 160000.00, 800, 0, '2024-01-18 06:15:00'),
('INV2024010', 10000006, 300000.00, 1500, 0, '2024-01-20 03:45:00'),
('INV2024011', 10000006, 200000.00, 1000, 200, '2024-02-10 09:30:00'),
('INV2024012', 10000006, 140000.00, 700, 400, '2024-03-10 05:00:00'),
('INV2024013', 10000007, 90000.00, 450, 50, '2024-01-22 09:10:00'),
('INV2024014', 10000008, 200000.00, 1000, 0, '2024-01-25 05:50:00'),
('INV2024015', 10000008, 160000.00, 800, 250, '2024-02-15 11:00:00'),
('INV2024016', 10000009, 120000.00, 600, 0, '2024-01-28 04:40:00'),
('INV2024017', 10000009, 70000.00, 350, 150, '2024-03-05 08:15:00'),
('INV2024018', 10000010, 300000.00, 1500, 0, '2024-01-30 04:20:00'),
('INV2024019', 10000010, 240000.00, 1200, 300, '2024-02-20 09:45:00'),
('INV2024020', 10000011, 120000.00, 600, 0, '2024-02-01 06:00:00'),
('INV2024021', 10000012, 400000.00, 2000, 0, '2024-02-05 05:15:00'),
('INV2024022', 10000012, 300000.00, 1500, 500, '2024-03-12 10:30:00'),
('INV2024023', 10000012, 140000.00, 700, 500, '2024-04-02 08:50:00'),
('INV2024024', 10000013, 140000.00, 700, 0, '2024-02-08 04:00:00'),
('INV2024025', 10000013, 80000.00, 400, 100, '2024-03-15 07:50:00'),
('INV2024026', 10000014, 100000.00, 500, 0, '2024-02-10 05:45:00'),
('INV2024027', 10000014, 70000.00, 350, 50, '2024-03-18 10:10:00'),
('INV2024028', 10000015, 260000.00, 1300, 0, '2024-02-12 04:30:00'),
('INV2024029', 10000015, 200000.00, 1000, 500, '2024-03-20 09:00:00'),
('INV2024030', 10000016, 80000.00, 400, 0, '2024-02-15 04:15:00'),
('INV2024031', 10000016, 60000.00, 300, 100, '2024-03-22 10:40:00'),
('INV2024032', 10000017, 400000.00, 2000, 0, '2024-02-18 06:00:00'),
('INV2024033', 10000017, 360000.00, 1800, 800, '2024-03-25 08:20:00'),
('INV2024034', 10000018, 100000.00, 500, 0, '2024-02-20 04:50:00'),
('INV2024035', 10000018, 90000.00, 450, 150, '2024-03-28 09:30:00'),
('INV2024036', 10000019, 200000.00, 1000, 0, '2024-02-22 03:45:00'),
('INV2024037', 10000019, 120000.00, 600, 200, '2024-03-30 09:10:00'),
('INV2024038', 10000020, 300000.00, 1500, 0, '2024-02-25 05:30:00'),
('INV2024039', 10000020, 200000.00, 1000, 200, '2024-04-01 10:50:00'),
('INV2024040', 10000020, 80000.00, 400, 200, '2024-04-10 04:45:00'),
('INV2024041', 10000021, 156000.00, 780, 80, '2024-02-28 05:00:00'),
('INV2024042', 10000022, 140000.00, 700, 0, '2024-03-02 04:15:00'),
('INV2024043', 10000022, 100000.00, 500, 200, '2024-04-05 08:50:00'),
('INV2024044', 10000023, 300000.00, 1500, 0, '2024-03-05 05:45:00'),
('INV2024045', 10000023, 320000.00, 1600, 600, '2024-04-08 09:00:00'),
('INV2024046', 10000024, 80000.00, 400, 0, '2024-03-08 04:30:00'),
('INV2024047', 10000024, 50000.00, 250, 50, '2024-04-10 10:15:00'),
('INV2024048', 10000025, 200000.00, 1000, 0, '2024-03-10 06:00:00'),
('INV2024049', 10000025, 180000.00, 900, 300, '2024-04-12 10:45:00');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `user_id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `first_name` varchar(50) NOT NULL,
  `last_name` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `department` varchar(50) DEFAULT NULL,
  `role` varchar(50) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `username`, `password`, `first_name`, `last_name`, `email`, `department`, `role`, `created_at`) VALUES
(2, 'admin', 'admin123', 'Admin', 'User', 'admin@loyalty360.com', 'IT', 'Administrator', '2025-04-17 16:35:18');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`customer_id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `mobile` (`mobile`),
  ADD UNIQUE KEY `identification_no` (`identification_no`);

--
-- Indexes for table `customer_segments`
--
ALTER TABLE `customer_segments`
  ADD PRIMARY KEY (`segment_id`),
  ADD KEY `created_by` (`created_by`);

--
-- Indexes for table `loyalty_history`
--
ALTER TABLE `loyalty_history`
  ADD PRIMARY KEY (`loyalty_id`),
  ADD KEY `customer_id` (`customer_id`),
  ADD KEY `invoice_id` (`invoice_id`);

--
-- Indexes for table `loyalty_tiers`
--
ALTER TABLE `loyalty_tiers`
  ADD PRIMARY KEY (`tier_id`);

--
-- Indexes for table `points_structure`
--
ALTER TABLE `points_structure`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`product_id`);

--
-- Indexes for table `product_purchased`
--
ALTER TABLE `product_purchased`
  ADD PRIMARY KEY (`id`),
  ADD KEY `invoice_id` (`invoice_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `rewards`
--
ALTER TABLE `rewards`
  ADD PRIMARY KEY (`reward_id`);

--
-- Indexes for table `segment_customers`
--
ALTER TABLE `segment_customers`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `segment_id` (`segment_id`,`customer_id`),
  ADD KEY `customer_id` (`customer_id`);

--
-- Indexes for table `transactions`
--
ALTER TABLE `transactions`
  ADD PRIMARY KEY (`invoice_id`),
  ADD KEY `customer_id` (`customer_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`),
  ADD UNIQUE KEY `username` (`username`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `customers`
--
ALTER TABLE `customers`
  MODIFY `customer_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10000030;

--
-- AUTO_INCREMENT for table `customer_segments`
--
ALTER TABLE `customer_segments`
  MODIFY `segment_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `loyalty_history`
--
ALTER TABLE `loyalty_history`
  MODIFY `loyalty_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=248;

--
-- AUTO_INCREMENT for table `loyalty_tiers`
--
ALTER TABLE `loyalty_tiers`
  MODIFY `tier_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `points_structure`
--
ALTER TABLE `points_structure`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `product_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=70;

--
-- AUTO_INCREMENT for table `product_purchased`
--
ALTER TABLE `product_purchased`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=281;

--
-- AUTO_INCREMENT for table `rewards`
--
ALTER TABLE `rewards`
  MODIFY `reward_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `segment_customers`
--
ALTER TABLE `segment_customers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `customer_segments`
--
ALTER TABLE `customer_segments`
  ADD CONSTRAINT `customer_segments_ibfk_1` FOREIGN KEY (`created_by`) REFERENCES `users` (`user_id`);

--
-- Constraints for table `loyalty_history`
--
ALTER TABLE `loyalty_history`
  ADD CONSTRAINT `loyalty_history_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`customer_id`),
  ADD CONSTRAINT `loyalty_history_ibfk_2` FOREIGN KEY (`invoice_id`) REFERENCES `transactions` (`invoice_id`);

--
-- Constraints for table `product_purchased`
--
ALTER TABLE `product_purchased`
  ADD CONSTRAINT `product_purchased_ibfk_1` FOREIGN KEY (`invoice_id`) REFERENCES `transactions` (`invoice_id`),
  ADD CONSTRAINT `product_purchased_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`);

--
-- Constraints for table `segment_customers`
--
ALTER TABLE `segment_customers`
  ADD CONSTRAINT `segment_customers_ibfk_1` FOREIGN KEY (`segment_id`) REFERENCES `customer_segments` (`segment_id`),
  ADD CONSTRAINT `segment_customers_ibfk_2` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`customer_id`);

--
-- Constraints for table `transactions`
--
ALTER TABLE `transactions`
  ADD CONSTRAINT `transactions_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`customer_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

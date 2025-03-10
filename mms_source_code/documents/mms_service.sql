-- phpMyAdmin SQL Dump
-- version 4.4.15.10
-- https://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Aug 23, 2023 at 06:30 AM
-- Server version: 8.0.27
-- PHP Version: 7.4.27

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `mms_service`
--

-- --------------------------------------------------------

--
-- Table structure for table `camera_details`
--

CREATE TABLE IF NOT EXISTS `camera_details` (
  `camera_id` int NOT NULL,
  `store_id` int NOT NULL,
  `camera_position` varchar(30) NOT NULL,
  `ip_address` varchar(40) NOT NULL,
  `camera_details` varchar(100) NOT NULL,
  `video_url` varchar(200) DEFAULT NULL,
  `start_stop_action` char(1) DEFAULT NULL,
  `camera_status` char(1) NOT NULL,
  `camera_entry_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `camera_details`
--

INSERT INTO `camera_details` (`camera_id`, `store_id`, `camera_position`, `ip_address`, `camera_details`, `video_url`, `start_stop_action`, `camera_status`, `camera_entry_date`) VALUES
(1, 1, 'Front Entrance', '192.168.1.27', 'Office Front Entrance', NULL, 'Y', 'Y', '2023-01-11 08:46:35'),
(2, 1, 'Back Entrance', '192.168.1.24', 'Office Back Entrance', NULL, 'Y', 'Y', '2023-01-10 18:30:00'),
(3, 1, 'Office Cabin 1', '192.168.1.22', 'Office Cabin 1', NULL, 'N', 'Y', '2023-01-10 18:30:00'),
(4, 1, 'Office Cabin 2', '192.168.1.29', 'Office Cabin 2', NULL, 'Y', 'Y', '2023-01-10 18:30:00'),
(5, 1, 'Office Reception', '192.168.1.25', 'Office Reception', NULL, 'N', 'Y', '2023-01-10 18:30:00');

-- --------------------------------------------------------

--
-- Table structure for table `customer_interest`
--

CREATE TABLE IF NOT EXISTS `customer_interest` (
  `customer_interest_id` int NOT NULL,
  `customer_id` int NOT NULL,
  `visitor_interest_id` int NOT NULL,
  `cus_int_status` char(1) NOT NULL,
  `cus_int_entry_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `customer_interest`
--

INSERT INTO `customer_interest` (`customer_interest_id`, `customer_id`, `visitor_interest_id`, `cus_int_status`, `cus_int_entry_date`) VALUES
(1, 8, 1, 'Y', '2023-01-31 02:39:38'),
(2, 8, 3, 'Y', '2023-01-31 02:39:38'),
(3, 8, 4, 'Y', '2023-01-31 02:39:38'),
(10, 23, 1, 'Y', '2023-02-01 10:36:33'),
(11, 23, 2, 'N', '2023-02-01 11:35:44'),
(12, 23, 6, 'Y', '2023-02-01 11:38:07'),
(13, 23, 4, 'Y', '2023-02-01 12:36:26'),
(14, 23, 3, 'Y', '2023-02-01 12:36:26'),
(15, 24, 1, 'N', '2023-02-01 12:37:47'),
(16, 24, 2, 'N', '2023-02-01 12:37:47'),
(17, 24, 3, 'Y', '2023-02-01 12:39:32'),
(18, 22, 5, 'Y', '2023-02-02 04:44:37'),
(19, 22, 1, 'Y', '2023-02-02 04:44:37'),
(20, 22, 3, 'Y', '2023-02-02 04:44:37'),
(21, 25, 5, 'Y', '2023-02-02 08:04:53'),
(22, 25, 4, 'Y', '2023-02-02 08:04:53'),
(23, 25, 3, 'Y', '2023-02-02 08:04:53');

-- --------------------------------------------------------

--
-- Table structure for table `customer_management`
--

CREATE TABLE IF NOT EXISTS `customer_management` (
  `customer_id` int NOT NULL,
  `store_id` int NOT NULL,
  `aws_faceid` varchar(50) NOT NULL,
  `visitor_id` varchar(25) NOT NULL,
  `customer_name` varchar(30) NOT NULL,
  `customer_mobile` varchar(10) NOT NULL,
  `customer_email` varchar(50) NOT NULL,
  `customer_gender` char(1) NOT NULL,
  `min_age` varchar(10) NOT NULL,
  `max_age` varchar(10) NOT NULL,
  `age_category` varchar(10) NOT NULL,
  `customer_interest` varchar(50) NOT NULL,
  `cus_mgt_status` char(1) NOT NULL,
  `cus_mgt_entry_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `cus_mgt_reg_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `customer_management`
--

INSERT INTO `customer_management` (`customer_id`, `store_id`, `aws_faceid`, `visitor_id`, `customer_name`, `customer_mobile`, `customer_email`, `customer_gender`, `min_age`, `max_age`, `age_category`, `customer_interest`, `cus_mgt_status`, `cus_mgt_entry_date`, `cus_mgt_reg_date`) VALUES
(19, 1, '8991031c-8370-41f8-a45f-628c9a4836e6', 'AA523028-133044-580', 'madhu', '8838964597', '', 'F', '25', '35', 'ADULT', '5,', 'Y', '2023-01-31 12:28:08', '2023-01-31 12:50:59'),
(22, 1, '48400a3f-16d9-41a2-86bb-f16c27125b401', 'AA123030-133321-1841', 'Arun', '9894606741', 'arun@yeejai.com', 'M', '34', '42', 'ADULT', '5,1,3,', 'Y', '2023-02-01 09:29:05', '2023-02-02 04:44:37'),
(23, 1, '3af94646-311b-4f3c-80a7-8c20395d01e4', 'AA123031-132220-720', 'shanthini', '6380885546', '', 'F', '20', '28', 'ADULT', '6,1,4,3,', 'N', '2023-02-01 10:36:33', '2023-02-01 12:36:25'),
(24, 1, 'feaedcc4-b71d-42f5-962f-9776096d0285', 'AA123031-175137-433', 'Sabi', '9361419661', '', 'F', '19', '27', 'ADULT', '3,', 'Y', '2023-02-01 12:37:47', '2023-02-01 12:39:32'),
(25, 1, 'f8df1f97-3c83-4f3a-b281-14cda466a8ae', 'AA123033-133451-564', 'GA', '9894606748', 'arun@yeejai.com', 'M', '35', '43', 'ADULT', '5,4,3,', 'N', '2023-02-02 08:04:53', '2023-02-02 08:04:53');

-- --------------------------------------------------------

--
-- Table structure for table `interest_list`
--

CREATE TABLE IF NOT EXISTS `interest_list` (
  `visitor_interest_id` int NOT NULL,
  `visitor_interest_title` varchar(30) NOT NULL,
  `visitor_interest_area` varchar(100) NOT NULL,
  `visitor_interest_status` char(1) NOT NULL,
  `visitor_interest_entdate` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 ROW_FORMAT=COMPACT;

--
-- Dumping data for table `interest_list`
--

INSERT INTO `interest_list` (`visitor_interest_id`, `visitor_interest_title`, `visitor_interest_area`, `visitor_interest_status`, `visitor_interest_entdate`) VALUES
(1, 'Foods & Beverages', 'Foods & Beverages', 'Y', '2023-01-10 18:30:00'),
(2, 'Movies', 'Movies', 'Y', '2023-01-10 18:30:00'),
(3, 'Shopping', 'Shopping', 'Y', '2023-01-10 18:30:00'),
(4, 'Groceries', 'Groceries', 'Y', '2023-01-10 18:30:00'),
(5, 'Deals & Discounts', 'Deals & Discounts', 'Y', '2023-01-10 18:30:00'),
(6, 'Entertainment', 'Entertainment', 'Y', '2023-01-10 18:30:00');

-- --------------------------------------------------------

--
-- Table structure for table `sms_updates`
--

CREATE TABLE IF NOT EXISTS `sms_updates` (
  `sms_update_id` int NOT NULL,
  `aws_faceid` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `sms_status` char(1) NOT NULL,
  `sms_entry_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `sms_updates`
--

INSERT INTO `sms_updates` (`sms_update_id`, `aws_faceid`, `sms_status`, `sms_entry_date`) VALUES
(1, '48400a3f-16d9-41a2-86bb-f16c27125b40', 'Y', '2023-01-28 12:42:35'),
(2, 'c0f7e246-0056-455a-b9b9-11fbdcb11613', 'Y', '2023-01-28 13:06:09'),
(3, '8991031c-8370-41f8-a45f-628c9a4836e6', 'Y', '2023-01-29 05:56:33'),
(4, 'c0f7e246-0056-455a-b9b9-11fbdcb11613', 'Y', '2023-01-29 06:21:55'),
(5, 'feaedcc4-b71d-42f5-962f-9776096d0285', 'Y', '2023-01-31 11:56:31');

-- --------------------------------------------------------

--
-- Table structure for table `store_details`
--

CREATE TABLE IF NOT EXISTS `store_details` (
  `store_id` int NOT NULL,
  `store_name` varchar(30) NOT NULL,
  `company_name` varchar(30) DEFAULT NULL,
  `store_address_details` varchar(100) DEFAULT NULL,
  `store_status` char(1) NOT NULL,
  `store_entry_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `store_details`
--

INSERT INTO `store_details` (`store_id`, `store_name`, `company_name`, `store_address_details`, `store_status`, `store_entry_date`) VALUES
(1, 'YJ-Office 1', 'YeeJai Technologies', '10, Perkinspuram, Aruppukkottai, TN, IND', 'Y', '2023-01-10 18:30:00'),
(2, 'YJ-Lab 1', 'YeeJai Technologies', '11, Perkinspuram, Aruppukkottai, TN, IND', 'Y', '2023-01-10 18:30:00'),
(3, 'YJ-Lab 2', 'YeeJai Technologies', '12, Perkinspuram, Aruppukkottai, TN, IND', 'Y', '2023-01-10 18:30:00');

-- --------------------------------------------------------

--
-- Table structure for table `unique_visitors`
--

CREATE TABLE IF NOT EXISTS `unique_visitors` (
  `unique_visitors_id` int NOT NULL,
  `aws_faceid` varchar(50) NOT NULL,
  `visitor_id` varchar(25) NOT NULL,
  `visitor_gender` char(1) NOT NULL,
  `min_age` varchar(10) NOT NULL,
  `max_age` varchar(10) NOT NULL,
  `age_category` varchar(10) NOT NULL,
  `unique_visitors_reference` varchar(50) NOT NULL,
  `unique_visitors_status` char(1) NOT NULL,
  `unique_visitors_entdate` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB AUTO_INCREMENT=72 DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `unique_visitors`
--

INSERT INTO `unique_visitors` (`unique_visitors_id`, `aws_faceid`, `visitor_id`, `visitor_gender`, `min_age`, `max_age`, `age_category`, `unique_visitors_reference`, `unique_visitors_status`, `unique_visitors_entdate`) VALUES
(11, '217eb778-b5c0-4014-98d6-be2f0e51f9eb', 'AA123025-141934-534', 'M', '38', '46', 'MIDDLE AGE', 'AWS new user', 'Y', '2023-01-25 08:49:35'),
(12, 'cb94e4c6-e5ca-4bdf-a3a6-9036deab3d7d', 'AA123025-142057-257', 'F', '21', '29', 'ADULT', 'AWS new user', 'Y', '2023-01-25 08:50:58'),
(14, '7a68c385-fc93-41d8-af78-412f77502d57', 'AA123028-112635-601', 'O', '19', '27', 'ADULT', 'AWS new user', 'Y', '2023-01-28 05:56:35'),
(16, 'c4f0c7cc-9769-46ab-af72-2059d6d76a98', 'AA523028-131231-979', 'F', '21', '29', 'ADULT', 'AWS new user', 'Y', '2023-01-28 07:40:32'),
(18, '8991031c-8370-41f8-a45f-628c9a4836e6', 'AA523028-133044-580', 'F', '25', '35', 'ADULT', 'AWS new user', 'Y', '2023-01-28 07:58:45'),
(59, 'c0f7e246-0056-455a-b9b9-11fbdcb11613', 'AA123030-133321-135', 'F', '16', '24', 'ADULT', 'AWS new user', 'Y', '2023-01-30 08:03:21'),
(61, '48400a3f-16d9-41a2-86bb-f16c27125b40', 'AA123030-133321-184', 'M', '34', '42', 'ADULT', 'AWS new user', 'Y', '2023-01-30 08:03:21'),
(62, '22e89349-8f1b-469d-8c8f-8b68f1bc1482', 'AA123030-181625-723', 'F', '31', '41', 'ADULT', 'AWS new user', 'Y', '2023-01-30 12:46:25'),
(64, '3af94646-311b-4f3c-80a7-8c20395d01e4', 'AA123031-132220-720', 'F', '20', '28', 'ADULT', 'AWS new user', 'Y', '2023-01-31 07:52:20'),
(65, 'feaedcc4-b71d-42f5-962f-9776096d0285', 'AA123031-175137-433', 'F', '19', '27', 'ADULT', 'AWS new user', 'Y', '2023-01-31 12:21:37'),
(66, 'a95b5be4-97f6-419b-9bfa-4467967dbf41', 'AA123032-143910-211', 'F', '18', '24', 'ADULT', 'AWS new user', 'Y', '2023-02-01 09:09:11'),
(67, 'ff1d9727-1704-4c3e-bcd9-f34ef833911a', 'AA123032-143942-276', 'F', '13', '21', 'TEEN', 'AWS new user', 'Y', '2023-02-01 09:09:42'),
(68, 'ff8920e9-56f9-4010-b29d-dce80234b413', 'AA123032-143954-285', 'F', '22', '30', 'ADULT', 'AWS new user', 'Y', '2023-02-01 09:09:54'),
(69, '45d170f6-ca04-4927-9a19-324d56e97fde', 'AA123032-144032-578', 'F', '13', '21', 'TEEN', 'AWS new user', 'Y', '2023-02-01 09:10:32'),
(70, 'e69ca72e-cab9-44ba-ac5d-2ad0d6e543d8', 'AA123032-144045-313', 'M', '30', '40', 'ADULT', 'AWS new user', 'Y', '2023-02-01 09:10:45'),
(71, 'f8df1f97-3c83-4f3a-b281-14cda466a8ae', 'AA123033-133451-564', 'M', '35', '43', 'ADULT', 'AWS new user', 'Y', '2023-02-02 08:04:53'),
(72, '9a690a95-4b5d-4df0-971b-961a81e5931c', 'AA123033-133416-429', 'M', '34', '42', 'ADULT', 'AWS new user', 'Y', '2023-02-02 08:04:16');

-- --------------------------------------------------------

--
-- Table structure for table `url_status`
--

CREATE TABLE IF NOT EXISTS `url_status` (
  `url_id` int NOT NULL,
  `url_name` varchar(50) NOT NULL,
  `url_status` char(1) NOT NULL,
  `url_entry_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `url_status`
--

INSERT INTO `url_status` (`url_id`, `url_name`, `url_status`, `url_entry_date`) VALUES
(1, 'https://yjtec.in/yjf_testing/entry1', 'N', '2023-01-30 10:17:00'),
(2, 'https://yjtec.in/yjf_testing/entry2', 'Y', '2023-01-30 10:17:00'),
(3, 'https://yjtec.in/yjf_testing/entry3', 'Y', '2023-01-30 10:17:00'),
(4, 'https://yjtec.in/yjf_testing/entry4', 'Y', '2023-01-30 10:17:00'),
(5, 'https://yjtec.in/yjf_testing/entry', 'Y', '2023-01-30 10:17:00');

-- --------------------------------------------------------

--
-- Table structure for table `user_management`
--

CREATE TABLE IF NOT EXISTS `user_management` (
  `user_id` int NOT NULL,
  `user_master_id` int NOT NULL,
  `user_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `login_id` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `login_password` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `user_email` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `user_mobile` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `usr_mgt_status` char(1) NOT NULL,
  `usr_mgt_entry_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `user_management`
--

INSERT INTO `user_management` (`user_id`, `user_master_id`, `user_name`, `login_id`, `login_password`, `user_email`, `user_mobile`, `usr_mgt_status`, `usr_mgt_entry_date`) VALUES
(1, 1, 'celebdigital', 'celebdigital', 'e58a3754522a05c1ff4d231f8e8cc1bd', 'arun@yeejai.com', '8888888888', 'Y', '2021-12-30 17:22:20');

-- --------------------------------------------------------

--
-- Table structure for table `user_master`
--

CREATE TABLE IF NOT EXISTS `user_master` (
  `user_master_id` int NOT NULL,
  `user_type` varchar(15) NOT NULL,
  `user_title` varchar(15) NOT NULL,
  `user_master_status` char(1) NOT NULL,
  `um_entry_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `user_master`
--

INSERT INTO `user_master` (`user_master_id`, `user_type`, `user_title`, `user_master_status`, `um_entry_date`) VALUES
(1, 'Super Admin', 'Super Admin', 'Y', '2021-12-14 02:01:00'),
(2, 'Visitor', 'Visitor', 'Y', '2021-12-14 02:01:04');

-- --------------------------------------------------------

--
-- Table structure for table `visitor_list`
--

CREATE TABLE IF NOT EXISTS `visitor_list` (
  `visitor_list_id` int NOT NULL,
  `store_id` int NOT NULL,
  `customer_id` int DEFAULT NULL,
  `camera_id` int NOT NULL,
  `visitor_gender` char(1) DEFAULT NULL,
  `min_age` varchar(10) DEFAULT NULL,
  `max_age` varchar(10) DEFAULT NULL,
  `age_category` varchar(10) DEFAULT NULL,
  `aws_faceid` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `visitor_id` varchar(25) DEFAULT NULL,
  `visitor_list_status` char(1) NOT NULL,
  `visitor_list_entdate` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB AUTO_INCREMENT=115 DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `visitor_list_runtime`
--

CREATE TABLE IF NOT EXISTS `visitor_list_runtime` (
  `vl_runtime_id` int NOT NULL,
  `store_id` int NOT NULL,
  `camera_id` int NOT NULL,
  `visitor_gender` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `visitor_gender_confidence` float NOT NULL,
  `min_age` varchar(10) DEFAULT NULL,
  `max_age` varchar(10) DEFAULT NULL,
  `aws_faceid` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `visitor_list_status` char(1) NOT NULL,
  `visitor_list_entdate` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB AUTO_INCREMENT=425 DEFAULT CHARSET=utf8mb3;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `camera_details`
--
ALTER TABLE `camera_details`
  ADD PRIMARY KEY (`camera_id`),
  ADD KEY `store_id` (`store_id`),
  ADD KEY `store_id_2` (`store_id`);

--
-- Indexes for table `customer_interest`
--
ALTER TABLE `customer_interest`
  ADD PRIMARY KEY (`customer_interest_id`),
  ADD KEY `customer_id` (`customer_id`),
  ADD KEY `customer_id_2` (`customer_id`,`visitor_interest_id`);

--
-- Indexes for table `customer_management`
--
ALTER TABLE `customer_management`
  ADD PRIMARY KEY (`customer_id`);

--
-- Indexes for table `interest_list`
--
ALTER TABLE `interest_list`
  ADD PRIMARY KEY (`visitor_interest_id`);

--
-- Indexes for table `sms_updates`
--
ALTER TABLE `sms_updates`
  ADD PRIMARY KEY (`sms_update_id`);

--
-- Indexes for table `store_details`
--
ALTER TABLE `store_details`
  ADD PRIMARY KEY (`store_id`);

--
-- Indexes for table `unique_visitors`
--
ALTER TABLE `unique_visitors`
  ADD PRIMARY KEY (`unique_visitors_id`);

--
-- Indexes for table `url_status`
--
ALTER TABLE `url_status`
  ADD PRIMARY KEY (`url_id`);

--
-- Indexes for table `user_management`
--
ALTER TABLE `user_management`
  ADD PRIMARY KEY (`user_id`),
  ADD KEY `user_master_id` (`user_master_id`),
  ADD KEY `user_master_id_2` (`user_master_id`);

--
-- Indexes for table `user_master`
--
ALTER TABLE `user_master`
  ADD PRIMARY KEY (`user_master_id`);

--
-- Indexes for table `visitor_list`
--
ALTER TABLE `visitor_list`
  ADD PRIMARY KEY (`visitor_list_id`),
  ADD KEY `store_id` (`store_id`,`customer_id`,`camera_id`),
  ADD KEY `store_id_2` (`store_id`,`customer_id`,`camera_id`);

--
-- Indexes for table `visitor_list_runtime`
--
ALTER TABLE `visitor_list_runtime`
  ADD PRIMARY KEY (`vl_runtime_id`),
  ADD KEY `store_id` (`store_id`,`camera_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `camera_details`
--
ALTER TABLE `camera_details`
  MODIFY `camera_id` int NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `customer_interest`
--
ALTER TABLE `customer_interest`
  MODIFY `customer_interest_id` int NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=24;
--
-- AUTO_INCREMENT for table `customer_management`
--
ALTER TABLE `customer_management`
  MODIFY `customer_id` int NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=26;
--
-- AUTO_INCREMENT for table `interest_list`
--
ALTER TABLE `interest_list`
  MODIFY `visitor_interest_id` int NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `sms_updates`
--
ALTER TABLE `sms_updates`
  MODIFY `sms_update_id` int NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `store_details`
--
ALTER TABLE `store_details`
  MODIFY `store_id` int NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `unique_visitors`
--
ALTER TABLE `unique_visitors`
  MODIFY `unique_visitors_id` int NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=73;
--
-- AUTO_INCREMENT for table `url_status`
--
ALTER TABLE `url_status`
  MODIFY `url_id` int NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `user_management`
--
ALTER TABLE `user_management`
  MODIFY `user_id` int NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `user_master`
--
ALTER TABLE `user_master`
  MODIFY `user_master_id` int NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `visitor_list`
--
ALTER TABLE `visitor_list`
  MODIFY `visitor_list_id` int NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=116;
--
-- AUTO_INCREMENT for table `visitor_list_runtime`
--
ALTER TABLE `visitor_list_runtime`
  MODIFY `vl_runtime_id` int NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=426;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `user_management`
--
ALTER TABLE `user_management`
  ADD CONSTRAINT `user_management_ibfk_1` FOREIGN KEY (`user_master_id`) REFERENCES `user_master` (`user_master_id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

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
-- Database: `mms_service_backup`
--

-- --------------------------------------------------------

--
-- Table structure for table `visitor_list_01012023`
--

CREATE TABLE IF NOT EXISTS `visitor_list_01012023` (
  `visitor_list_id` int NOT NULL,
  `store_id` int NOT NULL,
  `customer_id` int DEFAULT NULL,
  `camera_id` int NOT NULL,
  `visitor_gender` char(1) DEFAULT NULL,
  `min_age` varchar(10) DEFAULT NULL,
  `max_age` varchar(10) DEFAULT NULL,
  `age_category` varchar(10) DEFAULT NULL,
  `aws_faceid` varchar(50) DEFAULT NULL,
  `visitor_id` varchar(25) DEFAULT NULL,
  `visitor_list_status` char(1) NOT NULL,
  `visitor_list_entdate` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 ROW_FORMAT=COMPACT;

--
-- Dumping data for table `visitor_list_01012023`
--

INSERT INTO `visitor_list_01012023` (`visitor_list_id`, `store_id`, `customer_id`, `camera_id`, `visitor_gender`, `min_age`, `max_age`, `age_category`, `aws_faceid`, `visitor_id`, `visitor_list_status`, `visitor_list_entdate`) VALUES
(1, 1, 2, 2, 'M', '5', '15', 'KIDS', 'Htygh%^$%89256JH', NULL, 'Y', '2023-01-01 09:21:18'),
(2, 1, NULL, 2, 'F', '5', '15', 'KIDS', 'PIUe72Htygh%^$%89256JH', NULL, 'Y', '2023-01-01 12:45:55');

-- --------------------------------------------------------

--
-- Table structure for table `visitor_list_01022023`
--

CREATE TABLE IF NOT EXISTS `visitor_list_01022023` (
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
) ENGINE=InnoDB AUTO_INCREMENT=114 DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `visitor_list_01022023`
--

INSERT INTO `visitor_list_01022023` (`visitor_list_id`, `store_id`, `customer_id`, `camera_id`, `visitor_gender`, `min_age`, `max_age`, `age_category`, `aws_faceid`, `visitor_id`, `visitor_list_status`, `visitor_list_entdate`) VALUES
(98, 1, NULL, 1, 'F', '20', '25', 'ADULT', '3af94646-311b-4f3c-80a7-8c20395d01e4', 'AA123031-132220-720', 'Y', '2023-02-01 04:21:58'),
(99, 1, 20, 1, 'F', '20', '25', 'ADULT', '3af94646-311b-4f3c-80a7-8c20395d01e4', 'AA123031-132220-720', 'Y', '2023-02-01 09:09:05'),
(100, 1, NULL, 1, 'M', '35', '43', 'ADULT', '48400a3f-16d9-41a2-86bb-f16c27125b40', 'AA123030-133321-184', 'Y', '2023-02-01 09:09:05'),
(101, 1, NULL, 1, 'F', '13', '21', 'TEEN', 'ff1d9727-1704-4c3e-bcd9-f34ef833911a', 'AA123032-143942-276', 'Y', '2023-02-01 09:09:42'),
(102, 1, NULL, 1, 'F', '22', '30', 'ADULT', 'ff8920e9-56f9-4010-b29d-dce80234b413', 'AA123032-143954-285', 'Y', '2023-02-01 09:09:54'),
(103, 1, NULL, 1, 'F', '13', '21', 'TEEN', '45d170f6-ca04-4927-9a19-324d56e97fde', 'AA123032-144032-578', 'Y', '2023-02-01 09:10:32'),
(104, 1, NULL, 1, 'M', '30', '40', 'ADULT', 'e69ca72e-cab9-44ba-ac5d-2ad0d6e543d8', 'AA123032-144045-313', 'Y', '2023-02-01 09:10:45'),
(105, 1, NULL, 1, 'F', '13', '21', 'TEEN', 'ff1d9727-1704-4c3e-bcd9-f34ef833911a', 'AA123032-143942-276', 'Y', '2023-02-01 10:47:30'),
(106, 1, NULL, 1, 'F', '19', '27', 'ADULT', '3af94646-311b-4f3c-80a7-8c20395d01e4', 'AA123031-132220-720', 'Y', '2023-02-01 11:06:58'),
(107, 1, NULL, 1, 'F', '13', '21', 'TEEN', 'ff1d9727-1704-4c3e-bcd9-f34ef833911a', 'AA123032-143942-276', 'Y', '2023-02-01 11:12:02'),
(108, 1, NULL, 1, 'F', '20', '28', 'ADULT', '3af94646-311b-4f3c-80a7-8c20395d01e4', 'AA123031-132220-720', 'Y', '2023-02-01 12:53:20'),
(109, 1, NULL, 1, 'F', '13', '21', 'TEEN', 'ff1d9727-1704-4c3e-bcd9-f34ef833911a', 'AA123032-143942-276', 'Y', '2023-02-01 12:57:31'),
(110, 1, NULL, 1, 'F', '20', '28', 'ADULT', '3af94646-311b-4f3c-80a7-8c20395d01e4', 'AA123031-132220-720', 'Y', '2023-02-01 13:13:08'),
(111, 1, NULL, 1, 'F', '13', '21', 'TEEN', 'ff1d9727-1704-4c3e-bcd9-f34ef833911a', 'AA123032-143942-276', 'Y', '2023-02-01 13:14:04'),
(112, 1, NULL, 1, 'F', '20', '28', 'ADULT', '3af94646-311b-4f3c-80a7-8c20395d01e4', 'AA123031-132220-720', 'Y', '2023-02-01 13:44:36'),
(113, 1, NULL, 1, 'F', '13', '21', 'TEEN', 'ff1d9727-1704-4c3e-bcd9-f34ef833911a', 'AA123032-143942-276', 'Y', '2023-02-01 13:52:01'),
(114, 1, NULL, 1, 'F', '20', '28', 'ADULT', '3af94646-311b-4f3c-80a7-8c20395d01e4', 'AA123031-132220-720', 'Y', '2023-02-01 14:09:11');

-- --------------------------------------------------------

--
-- Table structure for table `visitor_list_01032023`
--

CREATE TABLE IF NOT EXISTS `visitor_list_01032023` (
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `visitor_list_01042023`
--

CREATE TABLE IF NOT EXISTS `visitor_list_01042023` (
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `visitor_list_02012023`
--

CREATE TABLE IF NOT EXISTS `visitor_list_02012023` (
  `visitor_list_id` int NOT NULL,
  `store_id` int NOT NULL,
  `customer_id` int DEFAULT NULL,
  `camera_id` int NOT NULL,
  `visitor_gender` char(1) DEFAULT NULL,
  `min_age` varchar(10) DEFAULT NULL,
  `max_age` varchar(10) DEFAULT NULL,
  `age_category` varchar(10) DEFAULT NULL,
  `aws_faceid` varchar(50) DEFAULT NULL,
  `visitor_id` varchar(25) DEFAULT NULL,
  `visitor_list_status` char(1) NOT NULL,
  `visitor_list_entdate` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 ROW_FORMAT=COMPACT;

--
-- Dumping data for table `visitor_list_02012023`
--

INSERT INTO `visitor_list_02012023` (`visitor_list_id`, `store_id`, `customer_id`, `camera_id`, `visitor_gender`, `min_age`, `max_age`, `age_category`, `aws_faceid`, `visitor_id`, `visitor_list_status`, `visitor_list_entdate`) VALUES
(1, 1, 2, 2, 'M', '5', '15', 'KIDS', 'Htygh%^$%89256JH', NULL, 'Y', '2023-01-02 05:21:18'),
(2, 1, NULL, 2, 'F', '5', '15', 'KIDS', 'PIUe72Htygh%^$%89256JH', NULL, 'Y', '2023-01-02 05:45:55'),
(3, 1, 2, 2, 'M', '5', '15', 'KIDS', 'Htygh%^$%89256JH', NULL, 'Y', '2023-01-02 00:51:18'),
(4, 1, NULL, 2, 'F', '5', '15', 'KIDS', 'PIUe72Htygh%^$%89256JH', NULL, 'Y', '2023-01-02 02:15:55'),
(5, 1, 1, 2, 'F', '5', '15', 'KIDS', 'PIUe72Htygh%^$%89256JH', NULL, 'Y', '2023-01-02 03:15:55');

-- --------------------------------------------------------

--
-- Table structure for table `visitor_list_02022023`
--

CREATE TABLE IF NOT EXISTS `visitor_list_02022023` (
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

--
-- Dumping data for table `visitor_list_02022023`
--

INSERT INTO `visitor_list_02022023` (`visitor_list_id`, `store_id`, `customer_id`, `camera_id`, `visitor_gender`, `min_age`, `max_age`, `age_category`, `aws_faceid`, `visitor_id`, `visitor_list_status`, `visitor_list_entdate`) VALUES
(115, 1, NULL, 1, 'M', '34', '42', 'ADULT', '9a690a95-4b5d-4df0-971b-961a81e5931c', 'AA123033-133416-429', 'Y', '2023-02-02 08:04:16');

-- --------------------------------------------------------

--
-- Table structure for table `visitor_list_02032023`
--

CREATE TABLE IF NOT EXISTS `visitor_list_02032023` (
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `visitor_list_02042023`
--

CREATE TABLE IF NOT EXISTS `visitor_list_02042023` (
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `visitor_list_03022023`
--

CREATE TABLE IF NOT EXISTS `visitor_list_03022023` (
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `visitor_list_03032023`
--

CREATE TABLE IF NOT EXISTS `visitor_list_03032023` (
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `visitor_list_03042023`
--

CREATE TABLE IF NOT EXISTS `visitor_list_03042023` (
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `visitor_list_04022023`
--

CREATE TABLE IF NOT EXISTS `visitor_list_04022023` (
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `visitor_list_04032023`
--

CREATE TABLE IF NOT EXISTS `visitor_list_04032023` (
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `visitor_list_04042023`
--

CREATE TABLE IF NOT EXISTS `visitor_list_04042023` (
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `visitor_list_05022023`
--

CREATE TABLE IF NOT EXISTS `visitor_list_05022023` (
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `visitor_list_05032023`
--

CREATE TABLE IF NOT EXISTS `visitor_list_05032023` (
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `visitor_list_05042023`
--

CREATE TABLE IF NOT EXISTS `visitor_list_05042023` (
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `visitor_list_06022023`
--

CREATE TABLE IF NOT EXISTS `visitor_list_06022023` (
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `visitor_list_06032023`
--

CREATE TABLE IF NOT EXISTS `visitor_list_06032023` (
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `visitor_list_06042023`
--

CREATE TABLE IF NOT EXISTS `visitor_list_06042023` (
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `visitor_list_07022023`
--

CREATE TABLE IF NOT EXISTS `visitor_list_07022023` (
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `visitor_list_07032023`
--

CREATE TABLE IF NOT EXISTS `visitor_list_07032023` (
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `visitor_list_07042023`
--

CREATE TABLE IF NOT EXISTS `visitor_list_07042023` (
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `visitor_list_08012023`
--

CREATE TABLE IF NOT EXISTS `visitor_list_08012023` (
  `visitor_list_id` int NOT NULL,
  `store_id` int NOT NULL,
  `customer_id` int DEFAULT NULL,
  `camera_id` int NOT NULL,
  `visitor_gender` char(1) DEFAULT NULL,
  `min_age` varchar(10) DEFAULT NULL,
  `max_age` varchar(10) DEFAULT NULL,
  `age_category` varchar(10) DEFAULT NULL,
  `aws_faceid` varchar(50) DEFAULT NULL,
  `visitor_id` varchar(25) DEFAULT NULL,
  `visitor_list_status` char(1) NOT NULL,
  `visitor_list_entdate` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 ROW_FORMAT=COMPACT;

--
-- Dumping data for table `visitor_list_08012023`
--

INSERT INTO `visitor_list_08012023` (`visitor_list_id`, `store_id`, `customer_id`, `camera_id`, `visitor_gender`, `min_age`, `max_age`, `age_category`, `aws_faceid`, `visitor_id`, `visitor_list_status`, `visitor_list_entdate`) VALUES
(1, 1, 2, 2, 'M', '5', '15', 'KIDS', 'Htygh%^$%89256JH', NULL, 'Y', '2023-01-08 03:41:18'),
(2, 1, NULL, 2, 'F', '5', '15', 'KIDS', 'PIUe72Htygh%^$%89256JH', NULL, 'Y', '2023-01-08 05:15:15'),
(3, 1, 2, 2, 'M', '5', '15', 'KIDS', 'Htygh%^$%89256JH', NULL, 'Y', '2023-01-08 03:11:18');

-- --------------------------------------------------------

--
-- Table structure for table `visitor_list_08022023`
--

CREATE TABLE IF NOT EXISTS `visitor_list_08022023` (
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `visitor_list_08032023`
--

CREATE TABLE IF NOT EXISTS `visitor_list_08032023` (
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `visitor_list_08042023`
--

CREATE TABLE IF NOT EXISTS `visitor_list_08042023` (
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `visitor_list_09022023`
--

CREATE TABLE IF NOT EXISTS `visitor_list_09022023` (
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `visitor_list_09032023`
--

CREATE TABLE IF NOT EXISTS `visitor_list_09032023` (
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `visitor_list_09042023`
--

CREATE TABLE IF NOT EXISTS `visitor_list_09042023` (
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `visitor_list_10012023`
--

CREATE TABLE IF NOT EXISTS `visitor_list_10012023` (
  `visitor_list_id` int NOT NULL,
  `store_id` int NOT NULL,
  `customer_id` int DEFAULT NULL,
  `camera_id` int NOT NULL,
  `visitor_gender` char(1) DEFAULT NULL,
  `min_age` varchar(10) DEFAULT NULL,
  `max_age` varchar(10) DEFAULT NULL,
  `age_category` varchar(10) DEFAULT NULL,
  `aws_faceid` varchar(50) DEFAULT NULL,
  `visitor_id` varchar(25) DEFAULT NULL,
  `visitor_list_status` char(1) NOT NULL,
  `visitor_list_entdate` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 ROW_FORMAT=COMPACT;

--
-- Dumping data for table `visitor_list_10012023`
--

INSERT INTO `visitor_list_10012023` (`visitor_list_id`, `store_id`, `customer_id`, `camera_id`, `visitor_gender`, `min_age`, `max_age`, `age_category`, `aws_faceid`, `visitor_id`, `visitor_list_status`, `visitor_list_entdate`) VALUES
(1, 1, 2, 2, 'M', '5', '15', 'KIDS', 'Htygh%^$%89256JH', NULL, 'Y', '2023-01-10 04:25:18'),
(2, 1, NULL, 2, 'F', '5', '15', 'KIDS', 'PIUe72Htygh%^$%89256JH', NULL, 'Y', '2023-01-10 04:25:18'),
(3, 1, 1, 2, 'M', '5', '15', 'KIDS', 'Htygh%^$%89256JH', NULL, 'Y', '2023-01-10 08:55:18'),
(4, 1, NULL, 2, 'F', '5', '15', 'KIDS', 'PIUe72Htygh%^$%89256JH', NULL, 'Y', '2023-01-10 15:55:18'),
(5, 1, 1, 2, 'M', '5', '15', 'KIDS', 'Htygh%^$%89256JH', NULL, 'Y', '2023-01-10 16:03:18'),
(6, 1, NULL, 2, 'F', '5', '15', 'KIDS', 'PIUe72Htygh%^$%89256JH', NULL, 'Y', '2023-01-10 16:45:18');

-- --------------------------------------------------------

--
-- Table structure for table `visitor_list_10022023`
--

CREATE TABLE IF NOT EXISTS `visitor_list_10022023` (
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `visitor_list_10032023`
--

CREATE TABLE IF NOT EXISTS `visitor_list_10032023` (
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `visitor_list_10042023`
--

CREATE TABLE IF NOT EXISTS `visitor_list_10042023` (
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `visitor_list_11022023`
--

CREATE TABLE IF NOT EXISTS `visitor_list_11022023` (
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `visitor_list_11032023`
--

CREATE TABLE IF NOT EXISTS `visitor_list_11032023` (
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `visitor_list_11042023`
--

CREATE TABLE IF NOT EXISTS `visitor_list_11042023` (
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `visitor_list_11122022`
--

CREATE TABLE IF NOT EXISTS `visitor_list_11122022` (
  `visitor_list_id` int NOT NULL,
  `store_id` int NOT NULL,
  `customer_id` int DEFAULT NULL,
  `camera_id` int NOT NULL,
  `visitor_gender` char(1) DEFAULT NULL,
  `min_age` varchar(10) DEFAULT NULL,
  `max_age` varchar(10) DEFAULT NULL,
  `age_category` varchar(10) DEFAULT NULL,
  `aws_faceid` varchar(50) DEFAULT NULL,
  `visitor_id` varchar(25) DEFAULT NULL,
  `visitor_list_status` char(1) NOT NULL,
  `visitor_list_entdate` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 ROW_FORMAT=COMPACT;

--
-- Dumping data for table `visitor_list_11122022`
--

INSERT INTO `visitor_list_11122022` (`visitor_list_id`, `store_id`, `customer_id`, `camera_id`, `visitor_gender`, `min_age`, `max_age`, `age_category`, `aws_faceid`, `visitor_id`, `visitor_list_status`, `visitor_list_entdate`) VALUES
(1, 1, 2, 2, 'M', '5', '15', 'KIDS', 'Htygh%^$%89256JH', NULL, 'Y', '2022-12-11 03:51:18'),
(2, 1, NULL, 2, 'F', '5', '15', 'KIDS', 'PIUe72Htygh%^$%89256JH', NULL, 'Y', '2022-12-11 06:15:55'),
(3, 1, NULL, 2, 'F', '5', '15', 'KIDS', 'PIUe72Htygh%^$%89256JH', NULL, 'Y', '2022-12-11 06:45:55'),
(4, 1, NULL, 2, 'F', '5', '15', 'KIDS', 'PIUe72Htygh%^$%89256JH', NULL, 'Y', '2022-12-11 08:03:11'),
(5, 1, 2, 2, 'F', '5', '15', 'KIDS', 'PIUe72Htygh%^$%89256JH', NULL, 'Y', '2022-12-11 09:03:11'),
(6, 1, 1, 2, 'F', '5', '15', 'KIDS', 'PIUe72Htygh%^$%89256JH', NULL, 'Y', '2022-12-11 10:03:11'),
(7, 1, NULL, 2, 'F', '5', '15', 'KIDS', 'PIUe72Htygh%^$%89256JH', NULL, 'Y', '2022-12-11 15:03:11');

-- --------------------------------------------------------

--
-- Table structure for table `visitor_list_12022023`
--

CREATE TABLE IF NOT EXISTS `visitor_list_12022023` (
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `visitor_list_12032023`
--

CREATE TABLE IF NOT EXISTS `visitor_list_12032023` (
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `visitor_list_12042023`
--

CREATE TABLE IF NOT EXISTS `visitor_list_12042023` (
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `visitor_list_13022023`
--

CREATE TABLE IF NOT EXISTS `visitor_list_13022023` (
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `visitor_list_13032023`
--

CREATE TABLE IF NOT EXISTS `visitor_list_13032023` (
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `visitor_list_13042023`
--

CREATE TABLE IF NOT EXISTS `visitor_list_13042023` (
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `visitor_list_14022023`
--

CREATE TABLE IF NOT EXISTS `visitor_list_14022023` (
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `visitor_list_14032023`
--

CREATE TABLE IF NOT EXISTS `visitor_list_14032023` (
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `visitor_list_14042023`
--

CREATE TABLE IF NOT EXISTS `visitor_list_14042023` (
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `visitor_list_15022023`
--

CREATE TABLE IF NOT EXISTS `visitor_list_15022023` (
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `visitor_list_15032023`
--

CREATE TABLE IF NOT EXISTS `visitor_list_15032023` (
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `visitor_list_15042023`
--

CREATE TABLE IF NOT EXISTS `visitor_list_15042023` (
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `visitor_list_16022023`
--

CREATE TABLE IF NOT EXISTS `visitor_list_16022023` (
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `visitor_list_16032023`
--

CREATE TABLE IF NOT EXISTS `visitor_list_16032023` (
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `visitor_list_16042023`
--

CREATE TABLE IF NOT EXISTS `visitor_list_16042023` (
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `visitor_list_16122022`
--

CREATE TABLE IF NOT EXISTS `visitor_list_16122022` (
  `visitor_list_id` int NOT NULL,
  `store_id` int NOT NULL,
  `customer_id` int DEFAULT NULL,
  `camera_id` int NOT NULL,
  `visitor_gender` char(1) DEFAULT NULL,
  `min_age` varchar(10) DEFAULT NULL,
  `max_age` varchar(10) DEFAULT NULL,
  `age_category` varchar(10) DEFAULT NULL,
  `aws_faceid` varchar(50) DEFAULT NULL,
  `visitor_id` varchar(25) DEFAULT NULL,
  `visitor_list_status` char(1) NOT NULL,
  `visitor_list_entdate` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 ROW_FORMAT=COMPACT;

--
-- Dumping data for table `visitor_list_16122022`
--

INSERT INTO `visitor_list_16122022` (`visitor_list_id`, `store_id`, `customer_id`, `camera_id`, `visitor_gender`, `min_age`, `max_age`, `age_category`, `aws_faceid`, `visitor_id`, `visitor_list_status`, `visitor_list_entdate`) VALUES
(1, 1, 2, 2, 'M', '5', '15', 'KIDS', 'Htygh%^$%89256JH', NULL, 'Y', '2022-12-16 03:51:18'),
(2, 1, NULL, 2, 'F', '5', '15', 'KIDS', 'PIUe72Htygh%^$%89256JH', NULL, 'Y', '2022-12-16 07:15:55'),
(3, 1, NULL, 2, 'F', '5', '15', 'KIDS', 'PIUe72Htygh%^$%89256JH', NULL, 'Y', '2022-12-16 11:45:55');

-- --------------------------------------------------------

--
-- Table structure for table `visitor_list_17012023`
--

CREATE TABLE IF NOT EXISTS `visitor_list_17012023` (
  `visitor_list_id` int NOT NULL,
  `store_id` int NOT NULL,
  `customer_id` int DEFAULT NULL,
  `camera_id` int NOT NULL,
  `visitor_gender` char(1) DEFAULT NULL,
  `min_age` varchar(10) DEFAULT NULL,
  `max_age` varchar(10) DEFAULT NULL,
  `age_category` varchar(10) DEFAULT NULL,
  `aws_faceid` varchar(50) DEFAULT NULL,
  `visitor_id` varchar(25) DEFAULT NULL,
  `visitor_list_status` char(1) NOT NULL,
  `visitor_list_entdate` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 ROW_FORMAT=COMPACT;

--
-- Dumping data for table `visitor_list_17012023`
--

INSERT INTO `visitor_list_17012023` (`visitor_list_id`, `store_id`, `customer_id`, `camera_id`, `visitor_gender`, `min_age`, `max_age`, `age_category`, `aws_faceid`, `visitor_id`, `visitor_list_status`, `visitor_list_entdate`) VALUES
(1, 1, 2, 2, 'M', '5', '15', 'KIDS', 'Htygh%^$%89256JH', NULL, 'Y', '2023-01-17 13:49:10'),
(2, 1, NULL, 2, 'F', '5', '15', 'KIDS', 'PIUe72Htygh%^$%89256JH', NULL, 'Y', '2023-01-17 14:55:33');

-- --------------------------------------------------------

--
-- Table structure for table `visitor_list_17022023`
--

CREATE TABLE IF NOT EXISTS `visitor_list_17022023` (
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `visitor_list_17032023`
--

CREATE TABLE IF NOT EXISTS `visitor_list_17032023` (
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `visitor_list_17042023`
--

CREATE TABLE IF NOT EXISTS `visitor_list_17042023` (
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `visitor_list_18022023`
--

CREATE TABLE IF NOT EXISTS `visitor_list_18022023` (
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `visitor_list_18032023`
--

CREATE TABLE IF NOT EXISTS `visitor_list_18032023` (
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `visitor_list_18042023`
--

CREATE TABLE IF NOT EXISTS `visitor_list_18042023` (
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `visitor_list_19012023`
--

CREATE TABLE IF NOT EXISTS `visitor_list_19012023` (
  `visitor_list_id` int NOT NULL,
  `store_id` int NOT NULL,
  `customer_id` int DEFAULT NULL,
  `camera_id` int NOT NULL,
  `visitor_gender` char(1) DEFAULT NULL,
  `min_age` varchar(10) DEFAULT NULL,
  `max_age` varchar(10) DEFAULT NULL,
  `age_category` varchar(10) DEFAULT NULL,
  `aws_faceid` varchar(50) DEFAULT NULL,
  `visitor_id` varchar(25) DEFAULT NULL,
  `visitor_list_status` char(1) NOT NULL,
  `visitor_list_entdate` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 ROW_FORMAT=COMPACT;

--
-- Dumping data for table `visitor_list_19012023`
--

INSERT INTO `visitor_list_19012023` (`visitor_list_id`, `store_id`, `customer_id`, `camera_id`, `visitor_gender`, `min_age`, `max_age`, `age_category`, `aws_faceid`, `visitor_id`, `visitor_list_status`, `visitor_list_entdate`) VALUES
(1, 1, 2, 2, 'M', '5', '15', 'KIDS', 'Htygh%^$%89256JH', NULL, 'Y', '2023-01-18 22:55:18'),
(2, 1, NULL, 2, 'F', '5', '15', 'KIDS', 'PIUe72Htygh%^$%89256JH', NULL, 'Y', '2023-01-18 22:55:18'),
(3, 1, 1, 2, 'M', '5', '15', 'KIDS', 'Htygh%^$%89256JH', NULL, 'Y', '2023-01-19 03:25:18'),
(4, 1, NULL, 2, 'F', '5', '15', 'KIDS', 'PIUe72Htygh%^$%89256JH', NULL, 'Y', '2023-01-19 10:25:18'),
(5, 1, 1, 2, 'M', '5', '15', 'KIDS', 'Htygh%^$%89256JH', NULL, 'Y', '2023-01-19 10:33:18'),
(6, 1, NULL, 2, 'F', '5', '15', 'KIDS', 'PIUe72Htygh%^$%89256JH', NULL, 'Y', '2023-01-19 11:15:18'),
(7, 1, NULL, 2, 'F', '5', '15', 'KIDS', 'PIUe72Htygh%^$%89256JH', NULL, 'Y', '2023-01-19 11:15:18'),
(8, 1, NULL, 2, 'F', '5', '15', 'KIDS', 'PIUe72Htygh%^$%89256JH', NULL, 'Y', '2023-01-19 11:15:18');

-- --------------------------------------------------------

--
-- Table structure for table `visitor_list_19022023`
--

CREATE TABLE IF NOT EXISTS `visitor_list_19022023` (
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `visitor_list_19032023`
--

CREATE TABLE IF NOT EXISTS `visitor_list_19032023` (
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `visitor_list_19042023`
--

CREATE TABLE IF NOT EXISTS `visitor_list_19042023` (
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `visitor_list_19122022`
--

CREATE TABLE IF NOT EXISTS `visitor_list_19122022` (
  `visitor_list_id` int NOT NULL,
  `store_id` int NOT NULL,
  `customer_id` int DEFAULT NULL,
  `camera_id` int NOT NULL,
  `visitor_gender` char(1) DEFAULT NULL,
  `min_age` varchar(10) DEFAULT NULL,
  `max_age` varchar(10) DEFAULT NULL,
  `age_category` varchar(10) DEFAULT NULL,
  `aws_faceid` varchar(50) DEFAULT NULL,
  `visitor_id` varchar(25) DEFAULT NULL,
  `visitor_list_status` char(1) NOT NULL,
  `visitor_list_entdate` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 ROW_FORMAT=COMPACT;

--
-- Dumping data for table `visitor_list_19122022`
--

INSERT INTO `visitor_list_19122022` (`visitor_list_id`, `store_id`, `customer_id`, `camera_id`, `visitor_gender`, `min_age`, `max_age`, `age_category`, `aws_faceid`, `visitor_id`, `visitor_list_status`, `visitor_list_entdate`) VALUES
(1, 1, 2, 2, 'M', '5', '15', 'KIDS', 'Htygh%^$%89256JH', NULL, 'Y', '2022-12-19 03:51:18'),
(2, 1, NULL, 2, 'F', '5', '15', 'KIDS', 'PIUe72Htygh%^$%89256JH', NULL, 'Y', '2022-12-19 07:15:55'),
(3, 1, NULL, 2, 'F', '5', '15', 'KIDS', 'PIUe72Htygh%^$%89256JH', NULL, 'Y', '2022-12-19 11:45:55'),
(4, 1, NULL, 2, 'F', '5', '15', 'KIDS', 'PIUe72Htygh%^$%89256JH', NULL, 'Y', '2022-12-19 14:03:11');

-- --------------------------------------------------------

--
-- Table structure for table `visitor_list_20012023`
--

CREATE TABLE IF NOT EXISTS `visitor_list_20012023` (
  `visitor_list_id` int NOT NULL,
  `store_id` int NOT NULL,
  `customer_id` int DEFAULT NULL,
  `camera_id` int NOT NULL,
  `visitor_gender` char(1) DEFAULT NULL,
  `min_age` varchar(10) DEFAULT NULL,
  `max_age` varchar(10) DEFAULT NULL,
  `age_category` varchar(10) DEFAULT NULL,
  `aws_faceid` varchar(50) DEFAULT NULL,
  `visitor_id` varchar(25) DEFAULT NULL,
  `visitor_list_status` char(1) NOT NULL,
  `visitor_list_entdate` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 ROW_FORMAT=COMPACT;

--
-- Dumping data for table `visitor_list_20012023`
--

INSERT INTO `visitor_list_20012023` (`visitor_list_id`, `store_id`, `customer_id`, `camera_id`, `visitor_gender`, `min_age`, `max_age`, `age_category`, `aws_faceid`, `visitor_id`, `visitor_list_status`, `visitor_list_entdate`) VALUES
(1, 1, 2, 2, 'M', '5', '15', 'KIDS', 'Htygh%^$%89256JH', NULL, 'Y', '2023-01-20 07:25:18'),
(2, 1, NULL, 2, 'F', '5', '15', 'KIDS', 'PIUe72Htygh%^$%89256JH', NULL, 'Y', '2023-01-20 08:25:18'),
(3, 1, 1, 2, 'M', '5', '15', 'KIDS', 'Htygh%^$%89256JH', NULL, 'Y', '2023-01-20 08:55:18'),
(4, 1, NULL, 2, 'F', '5', '15', 'KIDS', 'PIUe72Htygh%^$%89256JH', NULL, 'Y', '2023-01-20 09:55:18'),
(5, 1, 1, 2, 'M', '5', '15', 'KIDS', 'Htygh%^$%89256JH', NULL, 'Y', '2023-01-20 11:03:18'),
(6, 1, NULL, 2, 'F', '5', '15', 'KIDS', 'PIUe72Htygh%^$%89256JH', NULL, 'Y', '2023-01-20 11:45:18'),
(7, 1, NULL, 2, 'F', '5', '15', 'KIDS', 'PIUe72Htygh%^$%89256JH', NULL, 'Y', '2023-01-20 12:45:18'),
(8, 1, NULL, 2, 'F', '5', '15', 'KIDS', 'PIUe72Htygh%^$%89256JH', NULL, 'Y', '2023-01-20 13:45:18');

-- --------------------------------------------------------

--
-- Table structure for table `visitor_list_20022023`
--

CREATE TABLE IF NOT EXISTS `visitor_list_20022023` (
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `visitor_list_20032023`
--

CREATE TABLE IF NOT EXISTS `visitor_list_20032023` (
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `visitor_list_20042023`
--

CREATE TABLE IF NOT EXISTS `visitor_list_20042023` (
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `visitor_list_21012023`
--

CREATE TABLE IF NOT EXISTS `visitor_list_21012023` (
  `visitor_list_id` int NOT NULL,
  `store_id` int NOT NULL,
  `customer_id` int DEFAULT NULL,
  `camera_id` int NOT NULL,
  `visitor_gender` char(1) DEFAULT NULL,
  `min_age` varchar(10) DEFAULT NULL,
  `max_age` varchar(10) DEFAULT NULL,
  `age_category` varchar(10) DEFAULT NULL,
  `aws_faceid` varchar(50) DEFAULT NULL,
  `visitor_id` varchar(25) DEFAULT NULL,
  `visitor_list_status` char(1) NOT NULL,
  `visitor_list_entdate` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 ROW_FORMAT=COMPACT;

--
-- Dumping data for table `visitor_list_21012023`
--

INSERT INTO `visitor_list_21012023` (`visitor_list_id`, `store_id`, `customer_id`, `camera_id`, `visitor_gender`, `min_age`, `max_age`, `age_category`, `aws_faceid`, `visitor_id`, `visitor_list_status`, `visitor_list_entdate`) VALUES
(1, 1, 2, 2, 'M', '5', '15', 'KIDS', 'Htygh%^$%89256JH', NULL, 'Y', '2023-01-21 07:25:18'),
(2, 1, NULL, 2, 'F', '5', '15', 'KIDS', 'PIUe72Htygh%^$%89256JH', NULL, 'Y', '2023-01-21 08:25:18'),
(3, 1, 1, 2, 'M', '5', '15', 'KIDS', 'Htygh%^$%89256JH', NULL, 'Y', '2023-01-21 08:55:18'),
(4, 1, NULL, 2, 'F', '5', '15', 'KIDS', 'PIUe72Htygh%^$%89256JH', NULL, 'Y', '2023-01-21 09:55:18'),
(5, 1, 1, 2, 'M', '5', '15', 'KIDS', 'Htygh%^$%89256JH', NULL, 'Y', '2023-01-21 11:03:18'),
(6, 1, NULL, 2, 'F', '5', '15', 'KIDS', 'PIUe72Htygh%^$%89256JH', NULL, 'Y', '2023-01-21 11:45:18'),
(7, 1, NULL, 2, 'F', '5', '15', 'KIDS', 'PIUe72Htygh%^$%89256JH', NULL, 'Y', '2023-01-21 12:45:18'),
(8, 1, NULL, 2, 'F', '5', '15', 'KIDS', 'PIUe72Htygh%^$%89256JH', NULL, 'Y', '2023-01-21 13:45:18'),
(9, 1, NULL, 2, 'F', '5', '15', 'KIDS', 'PIUe72Htygh%^$%89256JH', NULL, 'Y', '2023-01-21 14:45:18');

-- --------------------------------------------------------

--
-- Table structure for table `visitor_list_21022023`
--

CREATE TABLE IF NOT EXISTS `visitor_list_21022023` (
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `visitor_list_21032023`
--

CREATE TABLE IF NOT EXISTS `visitor_list_21032023` (
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `visitor_list_21042023`
--

CREATE TABLE IF NOT EXISTS `visitor_list_21042023` (
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `visitor_list_22022023`
--

CREATE TABLE IF NOT EXISTS `visitor_list_22022023` (
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `visitor_list_22032023`
--

CREATE TABLE IF NOT EXISTS `visitor_list_22032023` (
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `visitor_list_22042023`
--

CREATE TABLE IF NOT EXISTS `visitor_list_22042023` (
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `visitor_list_23012023`
--

CREATE TABLE IF NOT EXISTS `visitor_list_23012023` (
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 ROW_FORMAT=COMPACT;

--
-- Dumping data for table `visitor_list_23012023`
--

INSERT INTO `visitor_list_23012023` (`visitor_list_id`, `store_id`, `customer_id`, `camera_id`, `visitor_gender`, `min_age`, `max_age`, `age_category`, `aws_faceid`, `visitor_id`, `visitor_list_status`, `visitor_list_entdate`) VALUES
(2, 1, NULL, 1, 'F', '18', '26', 'ADULT', 'c0f7e246-0056-455a-b9b9-11fbdcb11613', 'AA123022-135943-280', 'Y', '2023-01-22 08:29:43'),
(3, 1, NULL, 1, 'M', '34', '42', 'ADULT', '113858a0-5723-4e85-b6af-3ddc3cc93cfb', 'AA123022-140935-545', 'Y', '2023-01-22 08:39:35'),
(4, 1, NULL, 1, 'F', '18', '26', 'ADULT', 'c0f7e246-0056-455a-b9b9-11fbdcb11613', 'AA123022-135943-280', 'Y', '2023-01-22 09:24:17'),
(5, 1, NULL, 1, 'F', '18', '26', 'ADULT', 'c0f7e246-0056-455a-b9b9-11fbdcb11613', 'AA123022-135943-280', 'Y', '2023-01-22 09:33:52'),
(6, 1, NULL, 1, 'F', '18', '26', 'ADULT', 'c0f7e246-0056-455a-b9b9-11fbdcb11613', 'AA123022-135943-280', 'Y', '2023-01-22 09:38:09'),
(7, 1, NULL, 1, 'F', '18', '26', 'ADULT', 'c0f7e246-0056-455a-b9b9-11fbdcb11613', 'AA123022-135943-280', 'Y', '2023-01-22 09:42:57'),
(8, 1, NULL, 1, 'M', '34', '42', '	 ADULT', '113858a0-5723-4e85-b6af-3ddc3cc93cfb', 'AA123022-140935-545', 'Y', '2023-01-22 09:42:57'),
(9, 1, NULL, 1, 'F', '20', '28', 'ADULT', 'caa085da-e088-4146-b6a4-098062553732', 'AA123022-152240-311', 'Y', '2023-01-22 09:52:40'),
(10, 1, NULL, 1, 'F', '18', '26', 'ADULT', 'c0f7e246-0056-455a-b9b9-11fbdcb11613', 'AA123022-135943-280', 'Y', '2023-01-22 09:55:42'),
(11, 1, NULL, 1, 'F', '20', '28', 'ADULT', 'caa085da-e088-4146-b6a4-098062553732', 'AA123022-152240-311', 'Y', '2023-01-22 09:55:43'),
(12, 1, NULL, 1, 'M', '27', '37', 'ADULT', '6d89e78b-1e70-47b2-be9b-862cc154a7e7', 'AA123022-201124-740', 'Y', '2023-01-22 14:41:24'),
(13, 1, NULL, 1, 'M', '41', '49', 'MIDDLE AGE', '802cee66-34d8-437a-b9fd-fbaf36f51160', 'AA123022-211100-399', 'Y', '2023-01-22 15:41:00'),
(14, 1, NULL, 1, 'M', '34', '42', '	 ADULT', '113858a0-5723-4e85-b6af-3ddc3cc93cfb', 'AA123022-140935-545', 'Y', '2023-01-23 04:40:19'),
(15, 1, NULL, 1, 'M', '22', '30', 'ADULT', 'e69ca72e-cab9-44ba-ac5d-2ad0d6e543d8', 'AA123023-101210-880', 'Y', '2023-01-23 04:42:10'),
(16, 1, NULL, 1, 'M', '25', '35', 'ADULT', 'f6d61989-0579-4470-b165-40ce15db8201', 'AA123023-101230-589', 'Y', '2023-01-23 04:42:30'),
(17, 1, NULL, 1, 'M', '38', '46', 'MIDDLE AGE', 'f2d125e1-4a4f-410a-a7a6-6188d927ea5e', 'AA123023-101606-379', 'Y', '2023-01-23 04:46:06'),
(18, 1, NULL, 1, 'M', '25', '35', 'ADULT', 'f6d61989-0579-4470-b165-40ce15db8201', 'AA123023-101230-589', 'Y', '2023-01-23 04:47:44');

-- --------------------------------------------------------

--
-- Table structure for table `visitor_list_23022023`
--

CREATE TABLE IF NOT EXISTS `visitor_list_23022023` (
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `visitor_list_23032023`
--

CREATE TABLE IF NOT EXISTS `visitor_list_23032023` (
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `visitor_list_23042023`
--

CREATE TABLE IF NOT EXISTS `visitor_list_23042023` (
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `visitor_list_24022023`
--

CREATE TABLE IF NOT EXISTS `visitor_list_24022023` (
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `visitor_list_24032023`
--

CREATE TABLE IF NOT EXISTS `visitor_list_24032023` (
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `visitor_list_24042023`
--

CREATE TABLE IF NOT EXISTS `visitor_list_24042023` (
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `visitor_list_25012023`
--

CREATE TABLE IF NOT EXISTS `visitor_list_25012023` (
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 ROW_FORMAT=COMPACT;

--
-- Dumping data for table `visitor_list_25012023`
--

INSERT INTO `visitor_list_25012023` (`visitor_list_id`, `store_id`, `customer_id`, `camera_id`, `visitor_gender`, `min_age`, `max_age`, `age_category`, `aws_faceid`, `visitor_id`, `visitor_list_status`, `visitor_list_entdate`) VALUES
(1, 1, NULL, 1, 'F', '16', '24', 'ADULT', 'c0f7e246-0056-455a-b9b9-11fbdcb11613', 'AA123024-114923-806', 'Y', '2023-01-24 06:19:23'),
(2, 1, 1, 1, 'F', '16', '24', 'ADULT', 'c0f7e246-0056-455a-b9b9-11fbdcb11613', 'AA123024-114923-806', 'Y', '2023-01-24 06:42:07'),
(3, 1, 1, 1, 'F', '16', '24', 'ADULT', 'c0f7e246-0056-455a-b9b9-11fbdcb11613', 'AA123024-114923-806', 'Y', '2023-01-24 07:57:08'),
(4, 1, NULL, 1, 'M', '33', '41', 'ADULT', 'f6d61989-0579-4470-b165-40ce15db8201', 'AA123024-132715-27', 'Y', '2023-01-24 07:57:15'),
(5, 1, 1, 1, 'F', '16', '24', 'ADULT', 'c0f7e246-0056-455a-b9b9-11fbdcb11613', 'AA123024-114923-806', 'Y', '2023-01-24 08:00:35'),
(6, 1, 1, 1, 'F', '16', '24', 'ADULT', 'c0f7e246-0056-455a-b9b9-11fbdcb11613', 'AA123024-114923-806', 'Y', '2023-01-24 08:06:30'),
(7, 1, NULL, 1, 'F', '18', '24', 'ADULT', 'e860ff08-493b-4eb2-ab5d-1698dc6eb19f', 'AA123024-133635-756', 'Y', '2023-01-24 08:06:35'),
(8, 1, 1, 1, 'F', '16', '24', 'ADULT', 'c0f7e246-0056-455a-b9b9-11fbdcb11613', 'AA123024-114923-806', 'Y', '2023-01-24 08:57:39'),
(9, 1, 1, 1, 'F', '16', '24', 'ADULT', 'c0f7e246-0056-455a-b9b9-11fbdcb11613', 'AA123024-114923-806', 'Y', '2023-01-24 09:09:44'),
(10, 1, 1, 1, 'F', '16', '24', 'ADULT', 'c0f7e246-0056-455a-b9b9-11fbdcb11613', 'AA123024-114923-806', 'Y', '2023-01-25 04:17:17'),
(11, 1, 1, 1, 'F', '16', '24', 'ADULT', 'c0f7e246-0056-455a-b9b9-11fbdcb11613', 'AA123024-114923-806', 'Y', '2023-01-25 04:25:17'),
(12, 1, 1, 1, 'F', '16', '24', 'ADULT', 'c0f7e246-0056-455a-b9b9-11fbdcb11613', 'AA123024-114923-806', 'Y', '2023-01-25 04:42:04'),
(13, 1, NULL, 1, 'F', '21', '29', 'ADULT', 'cdfd0d3a-17cf-4303-890c-a7c8690432a8', 'AA123025-100521-344', 'Y', '2023-01-25 04:35:21'),
(14, 1, 1, 1, 'F', '16', '24', 'ADULT', 'c0f7e246-0056-455a-b9b9-11fbdcb11613', 'AA123024-114923-806', 'Y', '2023-01-25 04:47:42'),
(15, 1, 1, 1, 'F', '16', '24', 'ADULT', 'c0f7e246-0056-455a-b9b9-11fbdcb11613', 'AA123024-114923-806', 'Y', '2023-01-25 04:47:42'),
(16, 1, 1, 1, 'F', '16', '24', 'ADULT', 'c0f7e246-0056-455a-b9b9-11fbdcb11613', 'AA123024-114923-806', 'Y', '2023-01-25 04:47:42'),
(17, 1, 1, 1, 'F', '16', '24', 'ADULT', 'c0f7e246-0056-455a-b9b9-11fbdcb11613', 'AA123024-114923-806', 'Y', '2023-01-25 04:47:42'),
(18, 1, 1, 1, 'F', '16', '24', 'ADULT', 'c0f7e246-0056-455a-b9b9-11fbdcb11613', 'AA123024-114923-806', 'Y', '2023-01-25 04:47:42'),
(19, 1, 1, 1, 'F', '16', '24', 'ADULT', 'c0f7e246-0056-455a-b9b9-11fbdcb11613', 'AA123024-114923-806', 'Y', '2023-01-25 04:53:15'),
(20, 1, 1, 1, 'F', '16', '24', 'ADULT', 'c0f7e246-0056-455a-b9b9-11fbdcb11613', 'AA123024-114923-806', 'Y', '2023-01-25 05:05:15'),
(21, 1, 1, 1, 'F', '16', '24', 'ADULT', 'c0f7e246-0056-455a-b9b9-11fbdcb11613', 'AA123024-114923-806', 'Y', '2023-01-25 05:11:15'),
(22, 1, 1, 1, 'F', '16', '24', 'ADULT', 'c0f7e246-0056-455a-b9b9-11fbdcb11613', 'AA123024-114923-806', 'Y', '2023-01-25 06:45:33');

-- --------------------------------------------------------

--
-- Table structure for table `visitor_list_25022023`
--

CREATE TABLE IF NOT EXISTS `visitor_list_25022023` (
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `visitor_list_25032023`
--

CREATE TABLE IF NOT EXISTS `visitor_list_25032023` (
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `visitor_list_25042023`
--

CREATE TABLE IF NOT EXISTS `visitor_list_25042023` (
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `visitor_list_25122022`
--

CREATE TABLE IF NOT EXISTS `visitor_list_25122022` (
  `visitor_list_id` int NOT NULL,
  `store_id` int NOT NULL,
  `customer_id` int DEFAULT NULL,
  `camera_id` int NOT NULL,
  `visitor_gender` char(1) DEFAULT NULL,
  `min_age` varchar(10) DEFAULT NULL,
  `max_age` varchar(10) DEFAULT NULL,
  `age_category` varchar(10) DEFAULT NULL,
  `aws_faceid` varchar(50) DEFAULT NULL,
  `visitor_id` varchar(25) DEFAULT NULL,
  `visitor_list_status` char(1) NOT NULL,
  `visitor_list_entdate` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 ROW_FORMAT=COMPACT;

--
-- Dumping data for table `visitor_list_25122022`
--

INSERT INTO `visitor_list_25122022` (`visitor_list_id`, `store_id`, `customer_id`, `camera_id`, `visitor_gender`, `min_age`, `max_age`, `age_category`, `aws_faceid`, `visitor_id`, `visitor_list_status`, `visitor_list_entdate`) VALUES
(1, 1, 2, 2, 'M', '5', '15', 'KIDS', 'Htygh%^$%89256JH', NULL, 'Y', '2022-12-25 03:51:18'),
(2, 1, NULL, 2, 'F', '5', '15', 'KIDS', 'PIUe72Htygh%^$%89256JH', NULL, 'Y', '2022-12-25 07:15:55'),
(3, 1, NULL, 2, 'F', '5', '15', 'KIDS', 'PIUe72Htygh%^$%89256JH', NULL, 'Y', '2022-12-25 11:45:55'),
(4, 1, NULL, 2, 'F', '5', '15', 'KIDS', 'PIUe72Htygh%^$%89256JH', NULL, 'Y', '2022-12-25 14:03:11');

-- --------------------------------------------------------

--
-- Table structure for table `visitor_list_26022023`
--

CREATE TABLE IF NOT EXISTS `visitor_list_26022023` (
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `visitor_list_26032023`
--

CREATE TABLE IF NOT EXISTS `visitor_list_26032023` (
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `visitor_list_26042023`
--

CREATE TABLE IF NOT EXISTS `visitor_list_26042023` (
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `visitor_list_27022023`
--

CREATE TABLE IF NOT EXISTS `visitor_list_27022023` (
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `visitor_list_27032023`
--

CREATE TABLE IF NOT EXISTS `visitor_list_27032023` (
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `visitor_list_27042023`
--

CREATE TABLE IF NOT EXISTS `visitor_list_27042023` (
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `visitor_list_28022023`
--

CREATE TABLE IF NOT EXISTS `visitor_list_28022023` (
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `visitor_list_28032023`
--

CREATE TABLE IF NOT EXISTS `visitor_list_28032023` (
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `visitor_list_29012023`
--

CREATE TABLE IF NOT EXISTS `visitor_list_29012023` (
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
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `visitor_list_29012023`
--

INSERT INTO `visitor_list_29012023` (`visitor_list_id`, `store_id`, `customer_id`, `camera_id`, `visitor_gender`, `min_age`, `max_age`, `age_category`, `aws_faceid`, `visitor_id`, `visitor_list_status`, `visitor_list_entdate`) VALUES
(1, 1, 1, 1, 'F', '8', '10', 'ADULT', 'c0f7e246-0056-455a-b9b9-11fbdcb11613', 'AA123024-114923-806', 'Y', '2023-01-29 05:33:31'),
(2, 1, 1, 1, 'F', '18', '24', 'ADULT', 'c0f7e246-0056-455a-b9b9-11fbdcb11613', 'AA123024-114923-806', 'Y', '2023-01-29 05:42:15'),
(3, 1, 1, 1, 'M', '18', '26', 'ADULT', 'c0f7e246-0056-455a-b9b9-11fbdcb11613', 'AA123024-114923-806', 'Y', '2023-01-29 05:46:16'),
(4, 1, 1, 1, 'F', '18', '26', 'ADULT', 'c0f7e246-0056-455a-b9b9-11fbdcb11613', 'AA123024-114923-806', 'Y', '2023-01-29 05:47:28'),
(5, 1, 15, 1, 'M', '10', '11', 'ADULT', '8991031c-8370-41f8-a45f-628c9a4836e6', 'AA523028-133044-580', 'Y', '2023-01-29 05:56:33'),
(6, 1, NULL, 1, 'F', '20', '28', 'ADULT', 'c0f7e246-0056-455a-b9b9-11fbdcb11613', 'AA123024-114923-806', 'Y', '2023-01-29 05:51:18'),
(7, 1, NULL, 1, 'F', '20', '28', 'ADULT', 'c0f7e246-0056-455a-b9b9-11fbdcb11613', 'AA123024-114923-806', 'Y', '2023-01-29 06:01:00'),
(8, 1, 1, 1, 'F', '7', '10', 'ADULT', 'c0f7e246-0056-455a-b9b9-11fbdcb11613', 'AA123024-114923-806', 'Y', '2023-01-29 06:21:55'),
(9, 1, 1, 1, 'M', '18', '26', 'ADULT', 'c0f7e246-0056-455a-b9b9-11fbdcb11613', 'AA123024-114923-806', 'Y', '2023-01-29 07:21:12'),
(10, 1, 1, 1, 'F', '18', '26', 'ADULT', 'c0f7e246-0056-455a-b9b9-11fbdcb11613', 'AA123024-114923-806', 'Y', '2023-01-29 07:28:02'),
(11, 1, 1, 1, 'F', '18', '26', 'ADULT', 'c0f7e246-0056-455a-b9b9-11fbdcb11613', 'AA123024-114923-806', 'Y', '2023-01-29 07:30:47'),
(12, 1, 1, 1, 'M', '10', '12', 'ADULT', 'c0f7e246-0056-455a-b9b9-11fbdcb11613', 'AA123024-114923-806', 'Y', '2023-01-29 07:37:55'),
(13, 1, 1, 1, 'F', '18', '26', 'ADULT', 'c0f7e246-0056-455a-b9b9-11fbdcb11613', 'AA123024-114923-806', 'Y', '2023-01-29 07:50:16'),
(14, 1, 1, 1, 'F', '18', '26', 'ADULT', 'c0f7e246-0056-455a-b9b9-11fbdcb11613', 'AA123024-114923-806', 'Y', '2023-01-29 07:58:12'),
(15, 1, 1, 1, 'F', '18', '26', 'ADULT', 'c0f7e246-0056-455a-b9b9-11fbdcb11613', 'AA123024-114923-806', 'Y', '2023-01-29 08:00:34'),
(16, 1, 1, 1, 'F', '18', '26', 'ADULT', 'c0f7e246-0056-455a-b9b9-11fbdcb11613', 'AA123024-114923-806', 'Y', '2023-01-29 08:04:51'),
(17, 1, 1, 1, 'F', '18', '26', 'ADULT', 'c0f7e246-0056-455a-b9b9-11fbdcb11613', 'AA123024-114923-806', 'Y', '2023-01-29 08:24:32'),
(18, 1, 1, 1, 'F', '18', '26', 'ADULT', 'c0f7e246-0056-455a-b9b9-11fbdcb11613', 'AA123024-114923-806', 'Y', '2023-01-29 08:36:14'),
(19, 1, 1, 1, 'F', '18', '26', 'ADULT', 'c0f7e246-0056-455a-b9b9-11fbdcb11613', 'AA123024-114923-806', 'Y', '2023-01-29 09:29:07'),
(20, 1, NULL, 1, 'F', '20', '28', 'ADULT', 'c0f7e246-0056-455a-b9b9-11fbdcb11613', 'AA123024-114923-806', 'Y', '2023-01-29 09:49:52'),
(21, 1, NULL, 1, 'F', '20', '28', 'ADULT', 'c0f7e246-0056-455a-b9b9-11fbdcb11613', 'AA123024-114923-806', 'Y', '2023-01-29 10:02:53'),
(22, 1, NULL, 1, 'F', '20', '28', 'ADULT', 'c0f7e246-0056-455a-b9b9-11fbdcb11613', 'AA123024-114923-806', 'Y', '2023-01-29 10:21:08'),
(23, 1, NULL, 1, 'F', '20', '28', 'ADULT', 'c0f7e246-0056-455a-b9b9-11fbdcb11613', 'AA123024-114923-806', 'Y', '2023-01-29 11:42:12'),
(24, 1, NULL, 1, 'F', '20', '28', 'ADULT', 'c0f7e246-0056-455a-b9b9-11fbdcb11613', 'AA123024-114923-806', 'Y', '2023-01-29 11:50:20');

-- --------------------------------------------------------

--
-- Table structure for table `visitor_list_29032023`
--

CREATE TABLE IF NOT EXISTS `visitor_list_29032023` (
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `visitor_list_30012023`
--

CREATE TABLE IF NOT EXISTS `visitor_list_30012023` (
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
) ENGINE=InnoDB AUTO_INCREMENT=86 DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `visitor_list_30012023`
--

INSERT INTO `visitor_list_30012023` (`visitor_list_id`, `store_id`, `customer_id`, `camera_id`, `visitor_gender`, `min_age`, `max_age`, `age_category`, `aws_faceid`, `visitor_id`, `visitor_list_status`, `visitor_list_entdate`) VALUES
(68, 1, NULL, 1, 'F', '16', '24', 'ADULT', 'c0f7e246-0056-455a-b9b9-11fbdcb11613', 'AA123030-133321-135', 'Y', '2023-01-30 08:03:21'),
(69, 1, NULL, 1, 'F', '21', '29', 'ADULT', 'feaedcc4-b71d-42f5-962f-9776096d0285', 'AA123030-133321-821', 'Y', '2023-01-30 08:03:21'),
(70, 1, NULL, 1, 'M', '35', '43', 'ADULT', '48400a3f-16d9-41a2-86bb-f16c27125b40', 'AA123030-133321-184', 'Y', '2023-01-30 08:03:21'),
(71, 1, NULL, 1, 'F', '16', '24', 'ADULT', 'c0f7e246-0056-455a-b9b9-11fbdcb11613', 'AA123030-133321-135', 'Y', '2023-01-30 08:13:16'),
(72, 1, NULL, 1, 'F', '16', '24', 'ADULT', 'c0f7e246-0056-455a-b9b9-11fbdcb11613', 'AA123030-133321-135', 'Y', '2023-01-30 08:28:00'),
(73, 1, NULL, 1, 'F', '16', '24', 'ADULT', 'c0f7e246-0056-455a-b9b9-11fbdcb11613', 'AA123030-133321-135', 'Y', '2023-01-30 09:15:47'),
(74, 1, NULL, 1, 'F', '16', '24', 'ADULT', 'c0f7e246-0056-455a-b9b9-11fbdcb11613', 'AA123030-133321-135', 'Y', '2023-01-30 09:19:39'),
(75, 1, NULL, 1, 'F', '16', '24', 'ADULT', 'c0f7e246-0056-455a-b9b9-11fbdcb11613', 'AA123030-133321-135', 'Y', '2023-01-30 11:05:59'),
(76, 1, NULL, 1, 'F', '16', '24', 'ADULT', 'c0f7e246-0056-455a-b9b9-11fbdcb11613', 'AA123030-133321-135', 'Y', '2023-01-30 12:09:17'),
(77, 1, NULL, 1, 'F', '21', '29', 'ADULT', 'feaedcc4-b71d-42f5-962f-9776096d0285', 'AA123030-133321-821', 'Y', '2023-01-30 12:09:47'),
(78, 1, NULL, 1, 'F', '16', '24', 'ADULT', 'c0f7e246-0056-455a-b9b9-11fbdcb11613', 'AA123030-133321-135', 'Y', '2023-01-30 12:44:12'),
(79, 1, NULL, 1, 'F', '16', '24', 'ADULT', 'c0f7e246-0056-455a-b9b9-11fbdcb11613', 'AA123030-133321-135', 'Y', '2023-01-30 12:46:24'),
(80, 1, NULL, 1, 'F', '31', '41', 'ADULT', '22e89349-8f1b-469d-8c8f-8b68f1bc1482', 'AA123030-181625-723', 'Y', '2023-01-30 12:46:25'),
(81, 1, NULL, 1, 'F', '16', '24', 'ADULT', 'c0f7e246-0056-455a-b9b9-11fbdcb11613', 'AA123030-133321-135', 'Y', '2023-01-30 12:51:53'),
(82, 1, NULL, 1, 'F', '16', '24', 'ADULT', 'c0f7e246-0056-455a-b9b9-11fbdcb11613', 'AA123030-133321-135', 'Y', '2023-01-30 13:29:30'),
(83, 1, NULL, 1, 'M', '35', '43', 'ADULT', '48400a3f-16d9-41a2-86bb-f16c27125b40', 'AA123030-133321-184', 'Y', '2023-01-30 13:29:30'),
(84, 1, NULL, 1, 'F', '16', '24', 'ADULT', 'c0f7e246-0056-455a-b9b9-11fbdcb11613', 'AA123030-133321-135', 'Y', '2023-01-30 13:33:08'),
(85, 1, NULL, 1, 'F', '16', '24', 'ADULT', 'c0f7e246-0056-455a-b9b9-11fbdcb11613', 'AA123030-133321-135', 'Y', '2023-01-30 14:05:31'),
(86, 1, NULL, 1, 'F', '16', '24', 'ADULT', 'c0f7e246-0056-455a-b9b9-11fbdcb11613', 'AA123030-133321-135', 'Y', '2023-01-30 14:07:34');

-- --------------------------------------------------------

--
-- Table structure for table `visitor_list_30032023`
--

CREATE TABLE IF NOT EXISTS `visitor_list_30032023` (
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `visitor_list_31012023`
--

CREATE TABLE IF NOT EXISTS `visitor_list_31012023` (
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
) ENGINE=InnoDB AUTO_INCREMENT=97 DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `visitor_list_31012023`
--

INSERT INTO `visitor_list_31012023` (`visitor_list_id`, `store_id`, `customer_id`, `camera_id`, `visitor_gender`, `min_age`, `max_age`, `age_category`, `aws_faceid`, `visitor_id`, `visitor_list_status`, `visitor_list_entdate`) VALUES
(87, 1, NULL, 1, 'F', '16', '24', 'ADULT', 'c0f7e246-0056-455a-b9b9-11fbdcb11613', 'AA123030-133321-135', 'Y', '2023-01-31 04:52:02'),
(88, 1, NULL, 1, 'F', '16', '24', 'ADULT', 'c0f7e246-0056-455a-b9b9-11fbdcb11613', 'AA123030-133321-135', 'Y', '2023-01-31 05:50:06'),
(89, 1, NULL, 1, 'F', '16', '24', 'ADULT', 'c0f7e246-0056-455a-b9b9-11fbdcb11613', 'AA123030-133321-135', 'Y', '2023-01-31 05:54:34'),
(90, 1, NULL, 1, 'M', '35', '43', 'ADULT', '48400a3f-16d9-41a2-86bb-f16c27125b40', 'AA123030-133321-184', 'Y', '2023-01-31 05:54:34'),
(93, 1, NULL, 1, 'F', '20', '25', 'ADULT', '3af94646-311b-4f3c-80a7-8c20395d01e4', 'AA123031-132220-720', 'Y', '2023-01-31 07:52:20'),
(94, 1, NULL, 1, 'F', '20', '25', 'ADULT', '3af94646-311b-4f3c-80a7-8c20395d01e4', 'AA123031-132220-720', 'Y', '2023-01-31 12:56:20'),
(96, 1, NULL, 1, 'F', '22', '30', 'ADULT', 'feaedcc4-b71d-42f5-962f-9776096d0285', 'AA123031-175137-433', 'Y', '2023-01-31 13:21:37'),
(97, 1, NULL, 1, 'F', '20', '25', 'ADULT', '3af94646-311b-4f3c-80a7-8c20395d01e4', 'AA123031-132220-720', 'Y', '2023-01-31 14:25:33');

-- --------------------------------------------------------

--
-- Table structure for table `visitor_list_31032023`
--

CREATE TABLE IF NOT EXISTS `visitor_list_31032023` (
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `visitor_list_01012023`
--
ALTER TABLE `visitor_list_01012023`
  ADD PRIMARY KEY (`visitor_list_id`),
  ADD KEY `store_id` (`store_id`,`customer_id`,`camera_id`);

--
-- Indexes for table `visitor_list_01022023`
--
ALTER TABLE `visitor_list_01022023`
  ADD PRIMARY KEY (`visitor_list_id`),
  ADD KEY `store_id` (`store_id`,`customer_id`,`camera_id`),
  ADD KEY `store_id_2` (`store_id`,`customer_id`,`camera_id`);

--
-- Indexes for table `visitor_list_01032023`
--
ALTER TABLE `visitor_list_01032023`
  ADD PRIMARY KEY (`visitor_list_id`),
  ADD KEY `store_id` (`store_id`,`customer_id`,`camera_id`),
  ADD KEY `store_id_2` (`store_id`,`customer_id`,`camera_id`);

--
-- Indexes for table `visitor_list_01042023`
--
ALTER TABLE `visitor_list_01042023`
  ADD PRIMARY KEY (`visitor_list_id`),
  ADD KEY `store_id` (`store_id`,`customer_id`,`camera_id`),
  ADD KEY `store_id_2` (`store_id`,`customer_id`,`camera_id`);

--
-- Indexes for table `visitor_list_02012023`
--
ALTER TABLE `visitor_list_02012023`
  ADD PRIMARY KEY (`visitor_list_id`),
  ADD KEY `store_id` (`store_id`,`customer_id`,`camera_id`);

--
-- Indexes for table `visitor_list_02022023`
--
ALTER TABLE `visitor_list_02022023`
  ADD PRIMARY KEY (`visitor_list_id`),
  ADD KEY `store_id` (`store_id`,`customer_id`,`camera_id`),
  ADD KEY `store_id_2` (`store_id`,`customer_id`,`camera_id`);

--
-- Indexes for table `visitor_list_02032023`
--
ALTER TABLE `visitor_list_02032023`
  ADD PRIMARY KEY (`visitor_list_id`),
  ADD KEY `store_id` (`store_id`,`customer_id`,`camera_id`),
  ADD KEY `store_id_2` (`store_id`,`customer_id`,`camera_id`);

--
-- Indexes for table `visitor_list_02042023`
--
ALTER TABLE `visitor_list_02042023`
  ADD PRIMARY KEY (`visitor_list_id`),
  ADD KEY `store_id` (`store_id`,`customer_id`,`camera_id`),
  ADD KEY `store_id_2` (`store_id`,`customer_id`,`camera_id`);

--
-- Indexes for table `visitor_list_03022023`
--
ALTER TABLE `visitor_list_03022023`
  ADD PRIMARY KEY (`visitor_list_id`),
  ADD KEY `store_id` (`store_id`,`customer_id`,`camera_id`),
  ADD KEY `store_id_2` (`store_id`,`customer_id`,`camera_id`);

--
-- Indexes for table `visitor_list_03032023`
--
ALTER TABLE `visitor_list_03032023`
  ADD PRIMARY KEY (`visitor_list_id`),
  ADD KEY `store_id` (`store_id`,`customer_id`,`camera_id`),
  ADD KEY `store_id_2` (`store_id`,`customer_id`,`camera_id`);

--
-- Indexes for table `visitor_list_03042023`
--
ALTER TABLE `visitor_list_03042023`
  ADD PRIMARY KEY (`visitor_list_id`),
  ADD KEY `store_id` (`store_id`,`customer_id`,`camera_id`),
  ADD KEY `store_id_2` (`store_id`,`customer_id`,`camera_id`);

--
-- Indexes for table `visitor_list_04022023`
--
ALTER TABLE `visitor_list_04022023`
  ADD PRIMARY KEY (`visitor_list_id`),
  ADD KEY `store_id` (`store_id`,`customer_id`,`camera_id`),
  ADD KEY `store_id_2` (`store_id`,`customer_id`,`camera_id`);

--
-- Indexes for table `visitor_list_04032023`
--
ALTER TABLE `visitor_list_04032023`
  ADD PRIMARY KEY (`visitor_list_id`),
  ADD KEY `store_id` (`store_id`,`customer_id`,`camera_id`),
  ADD KEY `store_id_2` (`store_id`,`customer_id`,`camera_id`);

--
-- Indexes for table `visitor_list_04042023`
--
ALTER TABLE `visitor_list_04042023`
  ADD PRIMARY KEY (`visitor_list_id`),
  ADD KEY `store_id` (`store_id`,`customer_id`,`camera_id`),
  ADD KEY `store_id_2` (`store_id`,`customer_id`,`camera_id`);

--
-- Indexes for table `visitor_list_05022023`
--
ALTER TABLE `visitor_list_05022023`
  ADD PRIMARY KEY (`visitor_list_id`),
  ADD KEY `store_id` (`store_id`,`customer_id`,`camera_id`),
  ADD KEY `store_id_2` (`store_id`,`customer_id`,`camera_id`);

--
-- Indexes for table `visitor_list_05032023`
--
ALTER TABLE `visitor_list_05032023`
  ADD PRIMARY KEY (`visitor_list_id`),
  ADD KEY `store_id` (`store_id`,`customer_id`,`camera_id`),
  ADD KEY `store_id_2` (`store_id`,`customer_id`,`camera_id`);

--
-- Indexes for table `visitor_list_05042023`
--
ALTER TABLE `visitor_list_05042023`
  ADD PRIMARY KEY (`visitor_list_id`),
  ADD KEY `store_id` (`store_id`,`customer_id`,`camera_id`),
  ADD KEY `store_id_2` (`store_id`,`customer_id`,`camera_id`);

--
-- Indexes for table `visitor_list_06022023`
--
ALTER TABLE `visitor_list_06022023`
  ADD PRIMARY KEY (`visitor_list_id`),
  ADD KEY `store_id` (`store_id`,`customer_id`,`camera_id`),
  ADD KEY `store_id_2` (`store_id`,`customer_id`,`camera_id`);

--
-- Indexes for table `visitor_list_06032023`
--
ALTER TABLE `visitor_list_06032023`
  ADD PRIMARY KEY (`visitor_list_id`),
  ADD KEY `store_id` (`store_id`,`customer_id`,`camera_id`),
  ADD KEY `store_id_2` (`store_id`,`customer_id`,`camera_id`);

--
-- Indexes for table `visitor_list_06042023`
--
ALTER TABLE `visitor_list_06042023`
  ADD PRIMARY KEY (`visitor_list_id`),
  ADD KEY `store_id` (`store_id`,`customer_id`,`camera_id`),
  ADD KEY `store_id_2` (`store_id`,`customer_id`,`camera_id`);

--
-- Indexes for table `visitor_list_07022023`
--
ALTER TABLE `visitor_list_07022023`
  ADD PRIMARY KEY (`visitor_list_id`),
  ADD KEY `store_id` (`store_id`,`customer_id`,`camera_id`),
  ADD KEY `store_id_2` (`store_id`,`customer_id`,`camera_id`);

--
-- Indexes for table `visitor_list_07032023`
--
ALTER TABLE `visitor_list_07032023`
  ADD PRIMARY KEY (`visitor_list_id`),
  ADD KEY `store_id` (`store_id`,`customer_id`,`camera_id`),
  ADD KEY `store_id_2` (`store_id`,`customer_id`,`camera_id`);

--
-- Indexes for table `visitor_list_07042023`
--
ALTER TABLE `visitor_list_07042023`
  ADD PRIMARY KEY (`visitor_list_id`),
  ADD KEY `store_id` (`store_id`,`customer_id`,`camera_id`),
  ADD KEY `store_id_2` (`store_id`,`customer_id`,`camera_id`);

--
-- Indexes for table `visitor_list_08012023`
--
ALTER TABLE `visitor_list_08012023`
  ADD PRIMARY KEY (`visitor_list_id`),
  ADD KEY `store_id` (`store_id`,`customer_id`,`camera_id`);

--
-- Indexes for table `visitor_list_08022023`
--
ALTER TABLE `visitor_list_08022023`
  ADD PRIMARY KEY (`visitor_list_id`),
  ADD KEY `store_id` (`store_id`,`customer_id`,`camera_id`),
  ADD KEY `store_id_2` (`store_id`,`customer_id`,`camera_id`);

--
-- Indexes for table `visitor_list_08032023`
--
ALTER TABLE `visitor_list_08032023`
  ADD PRIMARY KEY (`visitor_list_id`),
  ADD KEY `store_id` (`store_id`,`customer_id`,`camera_id`),
  ADD KEY `store_id_2` (`store_id`,`customer_id`,`camera_id`);

--
-- Indexes for table `visitor_list_08042023`
--
ALTER TABLE `visitor_list_08042023`
  ADD PRIMARY KEY (`visitor_list_id`),
  ADD KEY `store_id` (`store_id`,`customer_id`,`camera_id`),
  ADD KEY `store_id_2` (`store_id`,`customer_id`,`camera_id`);

--
-- Indexes for table `visitor_list_09022023`
--
ALTER TABLE `visitor_list_09022023`
  ADD PRIMARY KEY (`visitor_list_id`),
  ADD KEY `store_id` (`store_id`,`customer_id`,`camera_id`),
  ADD KEY `store_id_2` (`store_id`,`customer_id`,`camera_id`);

--
-- Indexes for table `visitor_list_09032023`
--
ALTER TABLE `visitor_list_09032023`
  ADD PRIMARY KEY (`visitor_list_id`),
  ADD KEY `store_id` (`store_id`,`customer_id`,`camera_id`),
  ADD KEY `store_id_2` (`store_id`,`customer_id`,`camera_id`);

--
-- Indexes for table `visitor_list_09042023`
--
ALTER TABLE `visitor_list_09042023`
  ADD PRIMARY KEY (`visitor_list_id`),
  ADD KEY `store_id` (`store_id`,`customer_id`,`camera_id`),
  ADD KEY `store_id_2` (`store_id`,`customer_id`,`camera_id`);

--
-- Indexes for table `visitor_list_10012023`
--
ALTER TABLE `visitor_list_10012023`
  ADD PRIMARY KEY (`visitor_list_id`),
  ADD KEY `store_id` (`store_id`,`customer_id`,`camera_id`);

--
-- Indexes for table `visitor_list_10022023`
--
ALTER TABLE `visitor_list_10022023`
  ADD PRIMARY KEY (`visitor_list_id`),
  ADD KEY `store_id` (`store_id`,`customer_id`,`camera_id`),
  ADD KEY `store_id_2` (`store_id`,`customer_id`,`camera_id`);

--
-- Indexes for table `visitor_list_10032023`
--
ALTER TABLE `visitor_list_10032023`
  ADD PRIMARY KEY (`visitor_list_id`),
  ADD KEY `store_id` (`store_id`,`customer_id`,`camera_id`),
  ADD KEY `store_id_2` (`store_id`,`customer_id`,`camera_id`);

--
-- Indexes for table `visitor_list_10042023`
--
ALTER TABLE `visitor_list_10042023`
  ADD PRIMARY KEY (`visitor_list_id`),
  ADD KEY `store_id` (`store_id`,`customer_id`,`camera_id`),
  ADD KEY `store_id_2` (`store_id`,`customer_id`,`camera_id`);

--
-- Indexes for table `visitor_list_11022023`
--
ALTER TABLE `visitor_list_11022023`
  ADD PRIMARY KEY (`visitor_list_id`),
  ADD KEY `store_id` (`store_id`,`customer_id`,`camera_id`),
  ADD KEY `store_id_2` (`store_id`,`customer_id`,`camera_id`);

--
-- Indexes for table `visitor_list_11032023`
--
ALTER TABLE `visitor_list_11032023`
  ADD PRIMARY KEY (`visitor_list_id`),
  ADD KEY `store_id` (`store_id`,`customer_id`,`camera_id`),
  ADD KEY `store_id_2` (`store_id`,`customer_id`,`camera_id`);

--
-- Indexes for table `visitor_list_11042023`
--
ALTER TABLE `visitor_list_11042023`
  ADD PRIMARY KEY (`visitor_list_id`),
  ADD KEY `store_id` (`store_id`,`customer_id`,`camera_id`),
  ADD KEY `store_id_2` (`store_id`,`customer_id`,`camera_id`);

--
-- Indexes for table `visitor_list_11122022`
--
ALTER TABLE `visitor_list_11122022`
  ADD PRIMARY KEY (`visitor_list_id`),
  ADD KEY `store_id` (`store_id`,`customer_id`,`camera_id`);

--
-- Indexes for table `visitor_list_12022023`
--
ALTER TABLE `visitor_list_12022023`
  ADD PRIMARY KEY (`visitor_list_id`),
  ADD KEY `store_id` (`store_id`,`customer_id`,`camera_id`),
  ADD KEY `store_id_2` (`store_id`,`customer_id`,`camera_id`);

--
-- Indexes for table `visitor_list_12032023`
--
ALTER TABLE `visitor_list_12032023`
  ADD PRIMARY KEY (`visitor_list_id`),
  ADD KEY `store_id` (`store_id`,`customer_id`,`camera_id`),
  ADD KEY `store_id_2` (`store_id`,`customer_id`,`camera_id`);

--
-- Indexes for table `visitor_list_12042023`
--
ALTER TABLE `visitor_list_12042023`
  ADD PRIMARY KEY (`visitor_list_id`),
  ADD KEY `store_id` (`store_id`,`customer_id`,`camera_id`),
  ADD KEY `store_id_2` (`store_id`,`customer_id`,`camera_id`);

--
-- Indexes for table `visitor_list_13022023`
--
ALTER TABLE `visitor_list_13022023`
  ADD PRIMARY KEY (`visitor_list_id`),
  ADD KEY `store_id` (`store_id`,`customer_id`,`camera_id`),
  ADD KEY `store_id_2` (`store_id`,`customer_id`,`camera_id`);

--
-- Indexes for table `visitor_list_13032023`
--
ALTER TABLE `visitor_list_13032023`
  ADD PRIMARY KEY (`visitor_list_id`),
  ADD KEY `store_id` (`store_id`,`customer_id`,`camera_id`),
  ADD KEY `store_id_2` (`store_id`,`customer_id`,`camera_id`);

--
-- Indexes for table `visitor_list_13042023`
--
ALTER TABLE `visitor_list_13042023`
  ADD PRIMARY KEY (`visitor_list_id`),
  ADD KEY `store_id` (`store_id`,`customer_id`,`camera_id`),
  ADD KEY `store_id_2` (`store_id`,`customer_id`,`camera_id`);

--
-- Indexes for table `visitor_list_14022023`
--
ALTER TABLE `visitor_list_14022023`
  ADD PRIMARY KEY (`visitor_list_id`),
  ADD KEY `store_id` (`store_id`,`customer_id`,`camera_id`),
  ADD KEY `store_id_2` (`store_id`,`customer_id`,`camera_id`);

--
-- Indexes for table `visitor_list_14032023`
--
ALTER TABLE `visitor_list_14032023`
  ADD PRIMARY KEY (`visitor_list_id`),
  ADD KEY `store_id` (`store_id`,`customer_id`,`camera_id`),
  ADD KEY `store_id_2` (`store_id`,`customer_id`,`camera_id`);

--
-- Indexes for table `visitor_list_14042023`
--
ALTER TABLE `visitor_list_14042023`
  ADD PRIMARY KEY (`visitor_list_id`),
  ADD KEY `store_id` (`store_id`,`customer_id`,`camera_id`),
  ADD KEY `store_id_2` (`store_id`,`customer_id`,`camera_id`);

--
-- Indexes for table `visitor_list_15022023`
--
ALTER TABLE `visitor_list_15022023`
  ADD PRIMARY KEY (`visitor_list_id`),
  ADD KEY `store_id` (`store_id`,`customer_id`,`camera_id`),
  ADD KEY `store_id_2` (`store_id`,`customer_id`,`camera_id`);

--
-- Indexes for table `visitor_list_15032023`
--
ALTER TABLE `visitor_list_15032023`
  ADD PRIMARY KEY (`visitor_list_id`),
  ADD KEY `store_id` (`store_id`,`customer_id`,`camera_id`),
  ADD KEY `store_id_2` (`store_id`,`customer_id`,`camera_id`);

--
-- Indexes for table `visitor_list_15042023`
--
ALTER TABLE `visitor_list_15042023`
  ADD PRIMARY KEY (`visitor_list_id`),
  ADD KEY `store_id` (`store_id`,`customer_id`,`camera_id`),
  ADD KEY `store_id_2` (`store_id`,`customer_id`,`camera_id`);

--
-- Indexes for table `visitor_list_16022023`
--
ALTER TABLE `visitor_list_16022023`
  ADD PRIMARY KEY (`visitor_list_id`),
  ADD KEY `store_id` (`store_id`,`customer_id`,`camera_id`),
  ADD KEY `store_id_2` (`store_id`,`customer_id`,`camera_id`);

--
-- Indexes for table `visitor_list_16032023`
--
ALTER TABLE `visitor_list_16032023`
  ADD PRIMARY KEY (`visitor_list_id`),
  ADD KEY `store_id` (`store_id`,`customer_id`,`camera_id`),
  ADD KEY `store_id_2` (`store_id`,`customer_id`,`camera_id`);

--
-- Indexes for table `visitor_list_16042023`
--
ALTER TABLE `visitor_list_16042023`
  ADD PRIMARY KEY (`visitor_list_id`),
  ADD KEY `store_id` (`store_id`,`customer_id`,`camera_id`),
  ADD KEY `store_id_2` (`store_id`,`customer_id`,`camera_id`);

--
-- Indexes for table `visitor_list_16122022`
--
ALTER TABLE `visitor_list_16122022`
  ADD PRIMARY KEY (`visitor_list_id`),
  ADD KEY `store_id` (`store_id`,`customer_id`,`camera_id`);

--
-- Indexes for table `visitor_list_17012023`
--
ALTER TABLE `visitor_list_17012023`
  ADD PRIMARY KEY (`visitor_list_id`),
  ADD KEY `store_id` (`store_id`,`customer_id`,`camera_id`);

--
-- Indexes for table `visitor_list_17022023`
--
ALTER TABLE `visitor_list_17022023`
  ADD PRIMARY KEY (`visitor_list_id`),
  ADD KEY `store_id` (`store_id`,`customer_id`,`camera_id`),
  ADD KEY `store_id_2` (`store_id`,`customer_id`,`camera_id`);

--
-- Indexes for table `visitor_list_17032023`
--
ALTER TABLE `visitor_list_17032023`
  ADD PRIMARY KEY (`visitor_list_id`),
  ADD KEY `store_id` (`store_id`,`customer_id`,`camera_id`),
  ADD KEY `store_id_2` (`store_id`,`customer_id`,`camera_id`);

--
-- Indexes for table `visitor_list_17042023`
--
ALTER TABLE `visitor_list_17042023`
  ADD PRIMARY KEY (`visitor_list_id`),
  ADD KEY `store_id` (`store_id`,`customer_id`,`camera_id`),
  ADD KEY `store_id_2` (`store_id`,`customer_id`,`camera_id`);

--
-- Indexes for table `visitor_list_18022023`
--
ALTER TABLE `visitor_list_18022023`
  ADD PRIMARY KEY (`visitor_list_id`),
  ADD KEY `store_id` (`store_id`,`customer_id`,`camera_id`),
  ADD KEY `store_id_2` (`store_id`,`customer_id`,`camera_id`);

--
-- Indexes for table `visitor_list_18032023`
--
ALTER TABLE `visitor_list_18032023`
  ADD PRIMARY KEY (`visitor_list_id`),
  ADD KEY `store_id` (`store_id`,`customer_id`,`camera_id`),
  ADD KEY `store_id_2` (`store_id`,`customer_id`,`camera_id`);

--
-- Indexes for table `visitor_list_18042023`
--
ALTER TABLE `visitor_list_18042023`
  ADD PRIMARY KEY (`visitor_list_id`),
  ADD KEY `store_id` (`store_id`,`customer_id`,`camera_id`),
  ADD KEY `store_id_2` (`store_id`,`customer_id`,`camera_id`);

--
-- Indexes for table `visitor_list_19012023`
--
ALTER TABLE `visitor_list_19012023`
  ADD PRIMARY KEY (`visitor_list_id`),
  ADD KEY `store_id` (`store_id`,`customer_id`,`camera_id`);

--
-- Indexes for table `visitor_list_19022023`
--
ALTER TABLE `visitor_list_19022023`
  ADD PRIMARY KEY (`visitor_list_id`),
  ADD KEY `store_id` (`store_id`,`customer_id`,`camera_id`),
  ADD KEY `store_id_2` (`store_id`,`customer_id`,`camera_id`);

--
-- Indexes for table `visitor_list_19032023`
--
ALTER TABLE `visitor_list_19032023`
  ADD PRIMARY KEY (`visitor_list_id`),
  ADD KEY `store_id` (`store_id`,`customer_id`,`camera_id`),
  ADD KEY `store_id_2` (`store_id`,`customer_id`,`camera_id`);

--
-- Indexes for table `visitor_list_19042023`
--
ALTER TABLE `visitor_list_19042023`
  ADD PRIMARY KEY (`visitor_list_id`),
  ADD KEY `store_id` (`store_id`,`customer_id`,`camera_id`),
  ADD KEY `store_id_2` (`store_id`,`customer_id`,`camera_id`);

--
-- Indexes for table `visitor_list_19122022`
--
ALTER TABLE `visitor_list_19122022`
  ADD PRIMARY KEY (`visitor_list_id`),
  ADD KEY `store_id` (`store_id`,`customer_id`,`camera_id`);

--
-- Indexes for table `visitor_list_20012023`
--
ALTER TABLE `visitor_list_20012023`
  ADD PRIMARY KEY (`visitor_list_id`),
  ADD KEY `store_id` (`store_id`,`customer_id`,`camera_id`);

--
-- Indexes for table `visitor_list_20022023`
--
ALTER TABLE `visitor_list_20022023`
  ADD PRIMARY KEY (`visitor_list_id`),
  ADD KEY `store_id` (`store_id`,`customer_id`,`camera_id`),
  ADD KEY `store_id_2` (`store_id`,`customer_id`,`camera_id`);

--
-- Indexes for table `visitor_list_20032023`
--
ALTER TABLE `visitor_list_20032023`
  ADD PRIMARY KEY (`visitor_list_id`),
  ADD KEY `store_id` (`store_id`,`customer_id`,`camera_id`),
  ADD KEY `store_id_2` (`store_id`,`customer_id`,`camera_id`);

--
-- Indexes for table `visitor_list_20042023`
--
ALTER TABLE `visitor_list_20042023`
  ADD PRIMARY KEY (`visitor_list_id`),
  ADD KEY `store_id` (`store_id`,`customer_id`,`camera_id`),
  ADD KEY `store_id_2` (`store_id`,`customer_id`,`camera_id`);

--
-- Indexes for table `visitor_list_21012023`
--
ALTER TABLE `visitor_list_21012023`
  ADD PRIMARY KEY (`visitor_list_id`),
  ADD KEY `store_id` (`store_id`,`customer_id`,`camera_id`);

--
-- Indexes for table `visitor_list_21022023`
--
ALTER TABLE `visitor_list_21022023`
  ADD PRIMARY KEY (`visitor_list_id`),
  ADD KEY `store_id` (`store_id`,`customer_id`,`camera_id`),
  ADD KEY `store_id_2` (`store_id`,`customer_id`,`camera_id`);

--
-- Indexes for table `visitor_list_21032023`
--
ALTER TABLE `visitor_list_21032023`
  ADD PRIMARY KEY (`visitor_list_id`),
  ADD KEY `store_id` (`store_id`,`customer_id`,`camera_id`),
  ADD KEY `store_id_2` (`store_id`,`customer_id`,`camera_id`);

--
-- Indexes for table `visitor_list_21042023`
--
ALTER TABLE `visitor_list_21042023`
  ADD PRIMARY KEY (`visitor_list_id`),
  ADD KEY `store_id` (`store_id`,`customer_id`,`camera_id`),
  ADD KEY `store_id_2` (`store_id`,`customer_id`,`camera_id`);

--
-- Indexes for table `visitor_list_22022023`
--
ALTER TABLE `visitor_list_22022023`
  ADD PRIMARY KEY (`visitor_list_id`),
  ADD KEY `store_id` (`store_id`,`customer_id`,`camera_id`),
  ADD KEY `store_id_2` (`store_id`,`customer_id`,`camera_id`);

--
-- Indexes for table `visitor_list_22032023`
--
ALTER TABLE `visitor_list_22032023`
  ADD PRIMARY KEY (`visitor_list_id`),
  ADD KEY `store_id` (`store_id`,`customer_id`,`camera_id`),
  ADD KEY `store_id_2` (`store_id`,`customer_id`,`camera_id`);

--
-- Indexes for table `visitor_list_22042023`
--
ALTER TABLE `visitor_list_22042023`
  ADD PRIMARY KEY (`visitor_list_id`),
  ADD KEY `store_id` (`store_id`,`customer_id`,`camera_id`),
  ADD KEY `store_id_2` (`store_id`,`customer_id`,`camera_id`);

--
-- Indexes for table `visitor_list_23012023`
--
ALTER TABLE `visitor_list_23012023`
  ADD PRIMARY KEY (`visitor_list_id`),
  ADD KEY `store_id` (`store_id`,`customer_id`,`camera_id`),
  ADD KEY `store_id_2` (`store_id`,`customer_id`,`camera_id`);

--
-- Indexes for table `visitor_list_23022023`
--
ALTER TABLE `visitor_list_23022023`
  ADD PRIMARY KEY (`visitor_list_id`),
  ADD KEY `store_id` (`store_id`,`customer_id`,`camera_id`),
  ADD KEY `store_id_2` (`store_id`,`customer_id`,`camera_id`);

--
-- Indexes for table `visitor_list_23032023`
--
ALTER TABLE `visitor_list_23032023`
  ADD PRIMARY KEY (`visitor_list_id`),
  ADD KEY `store_id` (`store_id`,`customer_id`,`camera_id`),
  ADD KEY `store_id_2` (`store_id`,`customer_id`,`camera_id`);

--
-- Indexes for table `visitor_list_23042023`
--
ALTER TABLE `visitor_list_23042023`
  ADD PRIMARY KEY (`visitor_list_id`),
  ADD KEY `store_id` (`store_id`,`customer_id`,`camera_id`),
  ADD KEY `store_id_2` (`store_id`,`customer_id`,`camera_id`);

--
-- Indexes for table `visitor_list_24022023`
--
ALTER TABLE `visitor_list_24022023`
  ADD PRIMARY KEY (`visitor_list_id`),
  ADD KEY `store_id` (`store_id`,`customer_id`,`camera_id`),
  ADD KEY `store_id_2` (`store_id`,`customer_id`,`camera_id`);

--
-- Indexes for table `visitor_list_24032023`
--
ALTER TABLE `visitor_list_24032023`
  ADD PRIMARY KEY (`visitor_list_id`),
  ADD KEY `store_id` (`store_id`,`customer_id`,`camera_id`),
  ADD KEY `store_id_2` (`store_id`,`customer_id`,`camera_id`);

--
-- Indexes for table `visitor_list_24042023`
--
ALTER TABLE `visitor_list_24042023`
  ADD PRIMARY KEY (`visitor_list_id`),
  ADD KEY `store_id` (`store_id`,`customer_id`,`camera_id`),
  ADD KEY `store_id_2` (`store_id`,`customer_id`,`camera_id`);

--
-- Indexes for table `visitor_list_25012023`
--
ALTER TABLE `visitor_list_25012023`
  ADD PRIMARY KEY (`visitor_list_id`),
  ADD KEY `store_id` (`store_id`,`customer_id`,`camera_id`),
  ADD KEY `store_id_2` (`store_id`,`customer_id`,`camera_id`);

--
-- Indexes for table `visitor_list_25022023`
--
ALTER TABLE `visitor_list_25022023`
  ADD PRIMARY KEY (`visitor_list_id`),
  ADD KEY `store_id` (`store_id`,`customer_id`,`camera_id`),
  ADD KEY `store_id_2` (`store_id`,`customer_id`,`camera_id`);

--
-- Indexes for table `visitor_list_25032023`
--
ALTER TABLE `visitor_list_25032023`
  ADD PRIMARY KEY (`visitor_list_id`),
  ADD KEY `store_id` (`store_id`,`customer_id`,`camera_id`),
  ADD KEY `store_id_2` (`store_id`,`customer_id`,`camera_id`);

--
-- Indexes for table `visitor_list_25042023`
--
ALTER TABLE `visitor_list_25042023`
  ADD PRIMARY KEY (`visitor_list_id`),
  ADD KEY `store_id` (`store_id`,`customer_id`,`camera_id`),
  ADD KEY `store_id_2` (`store_id`,`customer_id`,`camera_id`);

--
-- Indexes for table `visitor_list_25122022`
--
ALTER TABLE `visitor_list_25122022`
  ADD PRIMARY KEY (`visitor_list_id`),
  ADD KEY `store_id` (`store_id`,`customer_id`,`camera_id`);

--
-- Indexes for table `visitor_list_26022023`
--
ALTER TABLE `visitor_list_26022023`
  ADD PRIMARY KEY (`visitor_list_id`),
  ADD KEY `store_id` (`store_id`,`customer_id`,`camera_id`),
  ADD KEY `store_id_2` (`store_id`,`customer_id`,`camera_id`);

--
-- Indexes for table `visitor_list_26032023`
--
ALTER TABLE `visitor_list_26032023`
  ADD PRIMARY KEY (`visitor_list_id`),
  ADD KEY `store_id` (`store_id`,`customer_id`,`camera_id`),
  ADD KEY `store_id_2` (`store_id`,`customer_id`,`camera_id`);

--
-- Indexes for table `visitor_list_26042023`
--
ALTER TABLE `visitor_list_26042023`
  ADD PRIMARY KEY (`visitor_list_id`),
  ADD KEY `store_id` (`store_id`,`customer_id`,`camera_id`),
  ADD KEY `store_id_2` (`store_id`,`customer_id`,`camera_id`);

--
-- Indexes for table `visitor_list_27022023`
--
ALTER TABLE `visitor_list_27022023`
  ADD PRIMARY KEY (`visitor_list_id`),
  ADD KEY `store_id` (`store_id`,`customer_id`,`camera_id`),
  ADD KEY `store_id_2` (`store_id`,`customer_id`,`camera_id`);

--
-- Indexes for table `visitor_list_27032023`
--
ALTER TABLE `visitor_list_27032023`
  ADD PRIMARY KEY (`visitor_list_id`),
  ADD KEY `store_id` (`store_id`,`customer_id`,`camera_id`),
  ADD KEY `store_id_2` (`store_id`,`customer_id`,`camera_id`);

--
-- Indexes for table `visitor_list_27042023`
--
ALTER TABLE `visitor_list_27042023`
  ADD PRIMARY KEY (`visitor_list_id`),
  ADD KEY `store_id` (`store_id`,`customer_id`,`camera_id`),
  ADD KEY `store_id_2` (`store_id`,`customer_id`,`camera_id`);

--
-- Indexes for table `visitor_list_28022023`
--
ALTER TABLE `visitor_list_28022023`
  ADD PRIMARY KEY (`visitor_list_id`),
  ADD KEY `store_id` (`store_id`,`customer_id`,`camera_id`),
  ADD KEY `store_id_2` (`store_id`,`customer_id`,`camera_id`);

--
-- Indexes for table `visitor_list_28032023`
--
ALTER TABLE `visitor_list_28032023`
  ADD PRIMARY KEY (`visitor_list_id`),
  ADD KEY `store_id` (`store_id`,`customer_id`,`camera_id`),
  ADD KEY `store_id_2` (`store_id`,`customer_id`,`camera_id`);

--
-- Indexes for table `visitor_list_29012023`
--
ALTER TABLE `visitor_list_29012023`
  ADD PRIMARY KEY (`visitor_list_id`),
  ADD KEY `store_id` (`store_id`,`customer_id`,`camera_id`),
  ADD KEY `store_id_2` (`store_id`,`customer_id`,`camera_id`);

--
-- Indexes for table `visitor_list_29032023`
--
ALTER TABLE `visitor_list_29032023`
  ADD PRIMARY KEY (`visitor_list_id`),
  ADD KEY `store_id` (`store_id`,`customer_id`,`camera_id`),
  ADD KEY `store_id_2` (`store_id`,`customer_id`,`camera_id`);

--
-- Indexes for table `visitor_list_30012023`
--
ALTER TABLE `visitor_list_30012023`
  ADD PRIMARY KEY (`visitor_list_id`),
  ADD KEY `store_id` (`store_id`,`customer_id`,`camera_id`),
  ADD KEY `store_id_2` (`store_id`,`customer_id`,`camera_id`);

--
-- Indexes for table `visitor_list_30032023`
--
ALTER TABLE `visitor_list_30032023`
  ADD PRIMARY KEY (`visitor_list_id`),
  ADD KEY `store_id` (`store_id`,`customer_id`,`camera_id`),
  ADD KEY `store_id_2` (`store_id`,`customer_id`,`camera_id`);

--
-- Indexes for table `visitor_list_31012023`
--
ALTER TABLE `visitor_list_31012023`
  ADD PRIMARY KEY (`visitor_list_id`),
  ADD KEY `store_id` (`store_id`,`customer_id`,`camera_id`),
  ADD KEY `store_id_2` (`store_id`,`customer_id`,`camera_id`);

--
-- Indexes for table `visitor_list_31032023`
--
ALTER TABLE `visitor_list_31032023`
  ADD PRIMARY KEY (`visitor_list_id`),
  ADD KEY `store_id` (`store_id`,`customer_id`,`camera_id`),
  ADD KEY `store_id_2` (`store_id`,`customer_id`,`camera_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `visitor_list_01012023`
--
ALTER TABLE `visitor_list_01012023`
  MODIFY `visitor_list_id` int NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `visitor_list_01022023`
--
ALTER TABLE `visitor_list_01022023`
  MODIFY `visitor_list_id` int NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=115;
--
-- AUTO_INCREMENT for table `visitor_list_01032023`
--
ALTER TABLE `visitor_list_01032023`
  MODIFY `visitor_list_id` int NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `visitor_list_01042023`
--
ALTER TABLE `visitor_list_01042023`
  MODIFY `visitor_list_id` int NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `visitor_list_02012023`
--
ALTER TABLE `visitor_list_02012023`
  MODIFY `visitor_list_id` int NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `visitor_list_02022023`
--
ALTER TABLE `visitor_list_02022023`
  MODIFY `visitor_list_id` int NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=116;
--
-- AUTO_INCREMENT for table `visitor_list_02032023`
--
ALTER TABLE `visitor_list_02032023`
  MODIFY `visitor_list_id` int NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `visitor_list_02042023`
--
ALTER TABLE `visitor_list_02042023`
  MODIFY `visitor_list_id` int NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `visitor_list_03022023`
--
ALTER TABLE `visitor_list_03022023`
  MODIFY `visitor_list_id` int NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `visitor_list_03032023`
--
ALTER TABLE `visitor_list_03032023`
  MODIFY `visitor_list_id` int NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `visitor_list_03042023`
--
ALTER TABLE `visitor_list_03042023`
  MODIFY `visitor_list_id` int NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `visitor_list_04022023`
--
ALTER TABLE `visitor_list_04022023`
  MODIFY `visitor_list_id` int NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `visitor_list_04032023`
--
ALTER TABLE `visitor_list_04032023`
  MODIFY `visitor_list_id` int NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `visitor_list_04042023`
--
ALTER TABLE `visitor_list_04042023`
  MODIFY `visitor_list_id` int NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `visitor_list_05022023`
--
ALTER TABLE `visitor_list_05022023`
  MODIFY `visitor_list_id` int NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `visitor_list_05032023`
--
ALTER TABLE `visitor_list_05032023`
  MODIFY `visitor_list_id` int NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `visitor_list_05042023`
--
ALTER TABLE `visitor_list_05042023`
  MODIFY `visitor_list_id` int NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `visitor_list_06022023`
--
ALTER TABLE `visitor_list_06022023`
  MODIFY `visitor_list_id` int NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `visitor_list_06032023`
--
ALTER TABLE `visitor_list_06032023`
  MODIFY `visitor_list_id` int NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `visitor_list_06042023`
--
ALTER TABLE `visitor_list_06042023`
  MODIFY `visitor_list_id` int NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `visitor_list_07022023`
--
ALTER TABLE `visitor_list_07022023`
  MODIFY `visitor_list_id` int NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `visitor_list_07032023`
--
ALTER TABLE `visitor_list_07032023`
  MODIFY `visitor_list_id` int NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `visitor_list_07042023`
--
ALTER TABLE `visitor_list_07042023`
  MODIFY `visitor_list_id` int NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `visitor_list_08012023`
--
ALTER TABLE `visitor_list_08012023`
  MODIFY `visitor_list_id` int NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `visitor_list_08022023`
--
ALTER TABLE `visitor_list_08022023`
  MODIFY `visitor_list_id` int NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `visitor_list_08032023`
--
ALTER TABLE `visitor_list_08032023`
  MODIFY `visitor_list_id` int NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `visitor_list_08042023`
--
ALTER TABLE `visitor_list_08042023`
  MODIFY `visitor_list_id` int NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `visitor_list_09022023`
--
ALTER TABLE `visitor_list_09022023`
  MODIFY `visitor_list_id` int NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `visitor_list_09032023`
--
ALTER TABLE `visitor_list_09032023`
  MODIFY `visitor_list_id` int NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `visitor_list_09042023`
--
ALTER TABLE `visitor_list_09042023`
  MODIFY `visitor_list_id` int NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `visitor_list_10012023`
--
ALTER TABLE `visitor_list_10012023`
  MODIFY `visitor_list_id` int NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `visitor_list_10022023`
--
ALTER TABLE `visitor_list_10022023`
  MODIFY `visitor_list_id` int NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `visitor_list_10032023`
--
ALTER TABLE `visitor_list_10032023`
  MODIFY `visitor_list_id` int NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `visitor_list_10042023`
--
ALTER TABLE `visitor_list_10042023`
  MODIFY `visitor_list_id` int NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `visitor_list_11022023`
--
ALTER TABLE `visitor_list_11022023`
  MODIFY `visitor_list_id` int NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `visitor_list_11032023`
--
ALTER TABLE `visitor_list_11032023`
  MODIFY `visitor_list_id` int NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `visitor_list_11042023`
--
ALTER TABLE `visitor_list_11042023`
  MODIFY `visitor_list_id` int NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `visitor_list_11122022`
--
ALTER TABLE `visitor_list_11122022`
  MODIFY `visitor_list_id` int NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `visitor_list_12022023`
--
ALTER TABLE `visitor_list_12022023`
  MODIFY `visitor_list_id` int NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `visitor_list_12032023`
--
ALTER TABLE `visitor_list_12032023`
  MODIFY `visitor_list_id` int NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `visitor_list_12042023`
--
ALTER TABLE `visitor_list_12042023`
  MODIFY `visitor_list_id` int NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `visitor_list_13022023`
--
ALTER TABLE `visitor_list_13022023`
  MODIFY `visitor_list_id` int NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `visitor_list_13032023`
--
ALTER TABLE `visitor_list_13032023`
  MODIFY `visitor_list_id` int NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `visitor_list_13042023`
--
ALTER TABLE `visitor_list_13042023`
  MODIFY `visitor_list_id` int NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `visitor_list_14022023`
--
ALTER TABLE `visitor_list_14022023`
  MODIFY `visitor_list_id` int NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `visitor_list_14032023`
--
ALTER TABLE `visitor_list_14032023`
  MODIFY `visitor_list_id` int NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `visitor_list_14042023`
--
ALTER TABLE `visitor_list_14042023`
  MODIFY `visitor_list_id` int NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `visitor_list_15022023`
--
ALTER TABLE `visitor_list_15022023`
  MODIFY `visitor_list_id` int NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `visitor_list_15032023`
--
ALTER TABLE `visitor_list_15032023`
  MODIFY `visitor_list_id` int NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `visitor_list_15042023`
--
ALTER TABLE `visitor_list_15042023`
  MODIFY `visitor_list_id` int NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `visitor_list_16022023`
--
ALTER TABLE `visitor_list_16022023`
  MODIFY `visitor_list_id` int NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `visitor_list_16032023`
--
ALTER TABLE `visitor_list_16032023`
  MODIFY `visitor_list_id` int NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `visitor_list_16042023`
--
ALTER TABLE `visitor_list_16042023`
  MODIFY `visitor_list_id` int NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `visitor_list_16122022`
--
ALTER TABLE `visitor_list_16122022`
  MODIFY `visitor_list_id` int NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `visitor_list_17012023`
--
ALTER TABLE `visitor_list_17012023`
  MODIFY `visitor_list_id` int NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `visitor_list_17022023`
--
ALTER TABLE `visitor_list_17022023`
  MODIFY `visitor_list_id` int NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `visitor_list_17032023`
--
ALTER TABLE `visitor_list_17032023`
  MODIFY `visitor_list_id` int NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `visitor_list_17042023`
--
ALTER TABLE `visitor_list_17042023`
  MODIFY `visitor_list_id` int NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `visitor_list_18022023`
--
ALTER TABLE `visitor_list_18022023`
  MODIFY `visitor_list_id` int NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `visitor_list_18032023`
--
ALTER TABLE `visitor_list_18032023`
  MODIFY `visitor_list_id` int NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `visitor_list_18042023`
--
ALTER TABLE `visitor_list_18042023`
  MODIFY `visitor_list_id` int NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `visitor_list_19012023`
--
ALTER TABLE `visitor_list_19012023`
  MODIFY `visitor_list_id` int NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT for table `visitor_list_19022023`
--
ALTER TABLE `visitor_list_19022023`
  MODIFY `visitor_list_id` int NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `visitor_list_19032023`
--
ALTER TABLE `visitor_list_19032023`
  MODIFY `visitor_list_id` int NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `visitor_list_19042023`
--
ALTER TABLE `visitor_list_19042023`
  MODIFY `visitor_list_id` int NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `visitor_list_19122022`
--
ALTER TABLE `visitor_list_19122022`
  MODIFY `visitor_list_id` int NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `visitor_list_20012023`
--
ALTER TABLE `visitor_list_20012023`
  MODIFY `visitor_list_id` int NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT for table `visitor_list_20022023`
--
ALTER TABLE `visitor_list_20022023`
  MODIFY `visitor_list_id` int NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `visitor_list_20032023`
--
ALTER TABLE `visitor_list_20032023`
  MODIFY `visitor_list_id` int NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `visitor_list_20042023`
--
ALTER TABLE `visitor_list_20042023`
  MODIFY `visitor_list_id` int NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `visitor_list_21012023`
--
ALTER TABLE `visitor_list_21012023`
  MODIFY `visitor_list_id` int NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT for table `visitor_list_21022023`
--
ALTER TABLE `visitor_list_21022023`
  MODIFY `visitor_list_id` int NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `visitor_list_21032023`
--
ALTER TABLE `visitor_list_21032023`
  MODIFY `visitor_list_id` int NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `visitor_list_21042023`
--
ALTER TABLE `visitor_list_21042023`
  MODIFY `visitor_list_id` int NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `visitor_list_22022023`
--
ALTER TABLE `visitor_list_22022023`
  MODIFY `visitor_list_id` int NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `visitor_list_22032023`
--
ALTER TABLE `visitor_list_22032023`
  MODIFY `visitor_list_id` int NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `visitor_list_22042023`
--
ALTER TABLE `visitor_list_22042023`
  MODIFY `visitor_list_id` int NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `visitor_list_23012023`
--
ALTER TABLE `visitor_list_23012023`
  MODIFY `visitor_list_id` int NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=19;
--
-- AUTO_INCREMENT for table `visitor_list_23022023`
--
ALTER TABLE `visitor_list_23022023`
  MODIFY `visitor_list_id` int NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `visitor_list_23032023`
--
ALTER TABLE `visitor_list_23032023`
  MODIFY `visitor_list_id` int NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `visitor_list_23042023`
--
ALTER TABLE `visitor_list_23042023`
  MODIFY `visitor_list_id` int NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `visitor_list_24022023`
--
ALTER TABLE `visitor_list_24022023`
  MODIFY `visitor_list_id` int NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `visitor_list_24032023`
--
ALTER TABLE `visitor_list_24032023`
  MODIFY `visitor_list_id` int NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `visitor_list_24042023`
--
ALTER TABLE `visitor_list_24042023`
  MODIFY `visitor_list_id` int NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `visitor_list_25012023`
--
ALTER TABLE `visitor_list_25012023`
  MODIFY `visitor_list_id` int NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=23;
--
-- AUTO_INCREMENT for table `visitor_list_25022023`
--
ALTER TABLE `visitor_list_25022023`
  MODIFY `visitor_list_id` int NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `visitor_list_25032023`
--
ALTER TABLE `visitor_list_25032023`
  MODIFY `visitor_list_id` int NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `visitor_list_25042023`
--
ALTER TABLE `visitor_list_25042023`
  MODIFY `visitor_list_id` int NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `visitor_list_25122022`
--
ALTER TABLE `visitor_list_25122022`
  MODIFY `visitor_list_id` int NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `visitor_list_26022023`
--
ALTER TABLE `visitor_list_26022023`
  MODIFY `visitor_list_id` int NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `visitor_list_26032023`
--
ALTER TABLE `visitor_list_26032023`
  MODIFY `visitor_list_id` int NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `visitor_list_26042023`
--
ALTER TABLE `visitor_list_26042023`
  MODIFY `visitor_list_id` int NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `visitor_list_27022023`
--
ALTER TABLE `visitor_list_27022023`
  MODIFY `visitor_list_id` int NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `visitor_list_27032023`
--
ALTER TABLE `visitor_list_27032023`
  MODIFY `visitor_list_id` int NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `visitor_list_27042023`
--
ALTER TABLE `visitor_list_27042023`
  MODIFY `visitor_list_id` int NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `visitor_list_28022023`
--
ALTER TABLE `visitor_list_28022023`
  MODIFY `visitor_list_id` int NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `visitor_list_28032023`
--
ALTER TABLE `visitor_list_28032023`
  MODIFY `visitor_list_id` int NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `visitor_list_29012023`
--
ALTER TABLE `visitor_list_29012023`
  MODIFY `visitor_list_id` int NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=25;
--
-- AUTO_INCREMENT for table `visitor_list_29032023`
--
ALTER TABLE `visitor_list_29032023`
  MODIFY `visitor_list_id` int NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `visitor_list_30012023`
--
ALTER TABLE `visitor_list_30012023`
  MODIFY `visitor_list_id` int NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=87;
--
-- AUTO_INCREMENT for table `visitor_list_30032023`
--
ALTER TABLE `visitor_list_30032023`
  MODIFY `visitor_list_id` int NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `visitor_list_31012023`
--
ALTER TABLE `visitor_list_31012023`
  MODIFY `visitor_list_id` int NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=98;
--
-- AUTO_INCREMENT for table `visitor_list_31032023`
--
ALTER TABLE `visitor_list_31032023`
  MODIFY `visitor_list_id` int NOT NULL AUTO_INCREMENT;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

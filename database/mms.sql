-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 15, 2024 at 07:10 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `mms`
--

DELIMITER $$
--
-- Procedures
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `api_log` (IN `in_originalUrl` VARCHAR(255), IN `ip_address` VARCHAR(255), IN `in_request_id` VARCHAR(255), IN `bearerHeader` VARCHAR(255), IN `in_user_id` INT)  NO SQL BEGIN
    DECLARE Error_message VARCHAR(255);

    BEGIN
        DECLARE error_msg TEXT;
        GET DIAGNOSTICS CONDITION 1 error_msg = MESSAGE_TEXT;

        -- Check for fatal errors and decide whether to rollback
        IF POSITION('fatal' IN error_msg) > 0 THEN
            ROLLBACK;
        END IF;

        -- SELECT CONCAT('error: ', error_msg) AS response_msg;
    END;

    START TRANSACTION; 

    -- Insert statement when count is 0
    INSERT INTO api_log (
        api_log_id, user_id, api_url, ip_address, request_id, response_status, response_comments, api_log_status, api_log_entry_date
    ) VALUES (
        NULL, 00, in_originalUrl, ip_address, in_request_id, 'N', '-', 'Y', CURRENT_TIMESTAMP
    );

    SET @new_api = CONCAT(
        'SELECT COUNT(*) INTO @new_log FROM api_log WHERE request_id = "', in_request_id,
        '" AND response_status != "N" AND api_log_status="Y"'
    );

    PREPARE stmt FROM @new_api;
    EXECUTE stmt;
    DEALLOCATE PREPARE stmt;

    IF @new_log != 0 THEN
        UPDATE api_log SET
            response_status = 'F',
            response_date = CURRENT_TIMESTAMP,
            response_comments = 'Request already processed'
        WHERE request_id = in_request_id AND response_status = 'N';

        -- Failed [Request already processed]
        SELECT 'Request already processed' AS response_msg, 'Status' AS Status;
    END IF;

    IF LENGTH(bearerHeader) > 0 THEN
        -- Construct dynamic query
        SET @check_bearer = CONCAT(
            'SELECT COALESCE(user_id) INTO @result_user_id FROM user_management WHERE user_bearer_token = "',
            bearerHeader, '" AND usr_mgt_status = "Y"'
        );

        SET Error_message = 'Invalid token';

        IF LENGTH(in_user_id) > 0 THEN
            SET @check_bearer = CONCAT(@check_bearer, ' AND user_id = ', in_user_id);
            SET Error_message = 'Invalid token or User ID';
        END IF;

        -- SELECT @check_bearer;

        PREPARE stmt FROM @check_bearer;
        EXECUTE stmt;
        DEALLOCATE PREPARE stmt;

        IF @result_user_id IS NULL THEN
            -- Failed [Invalid token or User ID]
            UPDATE api_log SET
                response_status = 'F',
                response_date = CURRENT_TIMESTAMP,
                response_comments = Error_message
            WHERE request_id = in_request_id AND response_status = 'N';

            -- Failed [Invalid token or User ID]
            SELECT Error_message AS response_msg, 'Failed' AS Failed;
        ELSE
            UPDATE api_log SET user_id = @result_user_id WHERE request_id = in_request_id AND response_status = 'N';
            SELECT @result_user_id AS response_user_id, 'success' AS Success;
        END IF;
    ELSE
        UPDATE api_log SET
            response_status = 'F',
            response_date = CURRENT_TIMESTAMP,
            response_comments = 'Token is required'
        WHERE request_id = in_request_id AND response_status = 'N';

        -- Failed [Token is required]
        SELECT 'Token is required' AS response_msg, 'failed' AS Failed;
    END IF;

    COMMIT;
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `api_log`
--

CREATE TABLE `api_log` (
  `api_log_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `api_url` varchar(50) NOT NULL,
  `ip_address` varchar(50) NOT NULL,
  `request_id` varchar(30) NOT NULL,
  `response_status` char(1) DEFAULT NULL,
  `response_comments` varchar(100) DEFAULT NULL,
  `response_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `api_log_status` char(1) NOT NULL,
  `api_log_entry_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `api_log`
--

INSERT INTO `api_log` (`api_log_id`, `user_id`, `api_url`, `ip_address`, `request_id`, `response_status`, `response_comments`, `response_date`, `api_log_status`, `api_log_entry_date`) VALUES
(3, 1, '/user/change_password', 'undefined', 'kjscnek', 'F', 'Token expired', '2024-06-12 17:57:05', 'Y', '2024-06-12 17:57:05'),
(4, 1, '/logout', 'undefined', 'djvbn', 'F', 'Error Occurred.', '2024-06-12 18:07:30', 'Y', '2024-06-12 18:04:53'),
(5, 1, '/logout', 'undefined', 'djvbn', 'F', 'Error Occurred.', '2024-06-12 18:07:30', 'Y', '2024-06-12 18:07:30'),
(6, 1, '/login', 'undefined', 'ncdvdn', 'F', 'Error Occurred.', '2024-06-12 18:25:07', 'Y', '2024-06-12 18:25:07'),
(7, 1, '/login', 'undefined', 'ncdvdn', 'F', 'Request already processed', '2024-06-12 18:26:41', 'Y', '2024-06-12 18:26:41'),
(8, 1, '/login', 'undefined', 'sjfcsdj', 'F', 'Error Occurred.', '2024-06-12 18:26:48', 'Y', '2024-06-12 18:26:48'),
(9, 1, '/login', 'undefined', 'sjfcsdj', 'F', 'Request already processed', '2024-06-12 18:28:28', 'Y', '2024-06-12 18:28:28'),
(10, 1, '/login', 'undefined', 'djhvcvjhd', 'F', 'Invalid Password. Kindly try again with the valid details!', '2024-06-12 18:28:39', 'Y', '2024-06-12 18:28:39'),
(11, 1, '/login', 'undefined', 'djfreuvr', 'S', 'Success', '2024-06-12 18:28:59', 'Y', '2024-06-12 18:28:59'),
(12, 1, '/login', 'undefined', 'djfreuvr', 'F', 'Request already processed', '2024-06-13 09:38:58', 'Y', '2024-06-13 09:38:58'),
(13, 1, '/login', 'undefined', 'djfhbcvdhjkv', 'S', 'Success', '2024-06-13 09:39:04', 'Y', '2024-06-13 09:39:04'),
(14, 1, '/logout', 'undefined', 'djvbn', 'F', 'Request already processed', '2024-06-13 09:54:17', 'Y', '2024-06-13 09:54:17'),
(15, 1, '/logout', 'undefined', 'fjdvcnj', 'F', 'Error Occurred.', '2024-06-13 09:54:24', 'Y', '2024-06-13 09:54:24'),
(16, 1, '/logout', 'undefined', 'sjkdb', 'S', 'Success', '2024-06-13 09:56:21', 'Y', '2024-06-13 09:56:21'),
(19, 0, '/user/change_password', 'undefined', 'icjdn', 'F', 'Invalid token', '2024-06-13 10:06:54', 'Y', '2024-06-13 10:06:54'),
(20, 1, '/login', 'undefined', 'ljfdjbvbvrli', 'S', 'Success', '2024-06-13 10:07:56', 'Y', '2024-06-13 10:07:56'),
(21, 0, '/user/change_password', 'undefined', 'icjdn', 'F', 'Request already processed', '2024-06-13 10:08:39', 'Y', '2024-06-13 10:08:39'),
(22, 1, '/user/change_password', 'undefined', 'ekfjcevkl', 'F', 'Token expired', '2024-06-13 10:08:46', 'Y', '2024-06-13 10:08:46'),
(23, 0, '/user/change_password', 'undefined', 'ekfjwkjxbcevkl', 'F', 'Invalid token', '2024-06-13 10:09:39', 'Y', '2024-06-13 10:09:39'),
(24, 0, '/user/change_password', 'undefined', 'ekfjwkjxbcevkl', 'F', 'Request already processed', '2024-06-13 10:10:52', 'Y', '2024-06-13 10:10:52'),
(25, 1, '/user/change_password', 'undefined', 'jkdxwnx', 'F', 'Token expired', '2024-06-13 10:11:07', 'Y', '2024-06-13 10:11:07'),
(26, 1, '/login', 'undefined', 'djvbdjv', 'S', 'Success', '2024-06-13 10:11:25', 'Y', '2024-06-13 10:11:25'),
(27, 1, '/user/change_password', 'undefined', 'kdvjb', 'F', 'Token expired', '2024-06-13 10:12:08', 'Y', '2024-06-13 10:12:08'),
(28, 1, '/user/change_password', 'undefined', 'dfurlv', 'F', 'Token expired', '2024-06-13 10:17:34', 'Y', '2024-06-13 10:17:34'),
(29, 1, '/user/change_password', 'undefined', 'hjjvhj', 'N', '-', '0000-00-00 00:00:00', 'Y', '2024-06-13 10:19:54'),
(30, 1, '/login', 'undefined', 'djvkbdjv', 'F', 'Invalid Password. Kindly try again with the valid details!', '2024-06-13 10:20:13', 'Y', '2024-06-13 10:20:13'),
(31, 1, '/login', 'undefined', 'djvkdjkcbdjv', 'S', 'Success', '2024-06-13 10:20:27', 'Y', '2024-06-13 10:20:27'),
(32, 1, '/user/dashbord_change', 'undefined', 'undefined', 'F', 'Error occurred', '2024-06-13 12:39:10', 'Y', '2024-06-13 10:21:56'),
(33, 1, '/user/today_report', 'undefined', 'undefined', 'F', 'Error occurred', '2024-06-13 12:39:10', 'Y', '2024-06-13 11:33:14'),
(34, 1, '/user/today_report', 'undefined', 'undefined', 'F', 'Error occurred', '2024-06-13 12:39:10', 'Y', '2024-06-13 11:41:08'),
(35, 1, '/user/today_report', 'undefined', 'undefined', 'F', 'Error occurred', '2024-06-13 12:39:10', 'Y', '2024-06-13 11:46:47'),
(36, 1, '/user/today_report', 'undefined', 'undefined', 'F', 'Error occurred', '2024-06-13 12:39:10', 'Y', '2024-06-13 11:57:35'),
(37, 1, '/user/today_report', 'undefined', 'undefined', 'F', 'Error occurred', '2024-06-13 12:39:10', 'Y', '2024-06-13 12:04:06'),
(38, 1, '/user/today_report', 'undefined', 'undefined', 'F', 'Error occurred', '2024-06-13 12:39:10', 'Y', '2024-06-13 12:06:36'),
(39, 1, '/user/today_report', 'undefined', 'undefined', 'F', 'Error occurred', '2024-06-13 12:39:10', 'Y', '2024-06-13 12:09:00'),
(40, 0, '/user/ltd_report', 'undefined', 'undefined', 'F', 'Request already processed', '2024-06-13 12:40:13', 'Y', '2024-06-13 12:40:13'),
(41, 1, '/user/ltd_report', 'undefined', 'gnbldfdkwr', 'F', 'Invalid token or User ID', '2024-06-13 13:17:28', 'Y', '2024-06-13 12:42:18'),
(42, 1, '/user/ltd_report', 'undefined', 'gnbldfdkwr', 'F', 'Invalid token or User ID', '2024-06-13 13:17:28', 'Y', '2024-06-13 12:43:57'),
(43, 1, '/user/ltd_report', 'undefined', 'gnbldfdkwr', 'F', 'Invalid token or User ID', '2024-06-13 13:17:28', 'Y', '2024-06-13 12:47:45'),
(44, 1, '/user/ltd_report', 'undefined', 'gnbldfdkwr', 'F', 'Invalid token or User ID', '2024-06-13 13:17:28', 'Y', '2024-06-13 12:51:34'),
(45, 1, '/user/ltd_report', 'undefined', 'gnbldfdkwr', 'F', 'Invalid token or User ID', '2024-06-13 13:17:28', 'Y', '2024-06-13 12:55:18'),
(46, 1, '/user/ltd_report', 'undefined', 'gnbldfdkwr', 'F', 'Invalid token or User ID', '2024-06-13 13:17:28', 'Y', '2024-06-13 13:01:10'),
(47, 1, '/user/ltd_report', 'undefined', 'gnbldfdkwr', 'F', 'Invalid token or User ID', '2024-06-13 13:17:28', 'Y', '2024-06-13 13:10:37'),
(48, 1, '/user/ltd_report', 'undefined', 'gnbldfdkwr', 'F', 'Invalid token or User ID', '2024-06-13 13:17:28', 'Y', '2024-06-13 13:15:11'),
(49, 1, '/user/ltd_report', 'undefined', 'gnbldfdkwr', 'F', 'Invalid token or User ID', '2024-06-13 13:17:28', 'Y', '2024-06-13 13:15:24'),
(50, 0, '/user/ltd_report', 'undefined', 'gnbldfdkwr', 'F', 'Invalid token or User ID', '2024-06-13 13:17:28', 'Y', '2024-06-13 13:17:28'),
(51, 0, '/user/ltd_report', 'undefined', 'gnbldfdkwr', 'F', 'Request already processed', '2024-06-13 13:17:45', 'Y', '2024-06-13 13:17:45'),
(52, 1, '/user/ltd_report', 'undefined', 'dejhvblcledhbv', 'N', '-', '0000-00-00 00:00:00', 'Y', '2024-06-13 13:17:53'),
(53, 1, '/user/ltd_report', 'undefined', 'dejhvblcledhbv', 'N', '-', '0000-00-00 00:00:00', 'Y', '2024-06-13 13:20:07'),
(54, 1, '/user/ltd_report', 'undefined', 'dejhvblcledhbv', 'N', '-', '0000-00-00 00:00:00', 'Y', '2024-06-13 13:26:21'),
(55, 1, '/user/ltd_report', 'undefined', 'dejhvblcledhbv', 'N', '-', '0000-00-00 00:00:00', 'Y', '2024-06-13 13:33:35'),
(56, 0, '/user/today_report', 'undefined', 'undefined', 'F', 'Request already processed', '2024-06-13 15:11:39', 'Y', '2024-06-13 15:11:39'),
(59, 0, '/user/ltd_report', 'undefined', 'vjdbl', 'F', 'Error occurred', '2024-06-13 16:33:58', 'Y', '2024-06-13 16:33:58'),
(60, 0, '/user/ltd_report', 'undefined', 'vjdbl', 'F', 'Request already processed', '2024-06-13 16:35:02', 'Y', '2024-06-13 16:35:02'),
(61, 1, '/user/ltd_report', 'undefined', 'kfvnldknbv', 'N', '-', '0000-00-00 00:00:00', 'Y', '2024-06-13 16:35:12'),
(62, 1, '/user/ltd_report', 'undefined', 'kfvnldknbv', 'N', '-', '0000-00-00 00:00:00', 'Y', '2024-06-13 16:35:41'),
(63, 1, '/user/ltd_report', 'undefined', 'kfvnldknbv', 'N', '-', '0000-00-00 00:00:00', 'Y', '2024-06-13 16:37:18'),
(64, 1, '/user/ltd_report', 'undefined', 'kfvnldknbv', 'N', '-', '0000-00-00 00:00:00', 'Y', '2024-06-13 16:38:09'),
(65, 1, '/user/ltd_report', 'undefined', 'kfvnldknbv', 'N', '-', '0000-00-00 00:00:00', 'Y', '2024-06-13 16:39:21'),
(66, 1, '/user/ltd_report', 'undefined', 'kfvnldknbv', 'N', '-', '0000-00-00 00:00:00', 'Y', '2024-06-13 16:39:49'),
(67, 1, '/user/ltd_report', 'undefined', 'kfvnldknbv', 'N', '-', '0000-00-00 00:00:00', 'Y', '2024-06-13 16:41:47'),
(68, 1, '/user/ltd_report', 'undefined', 'kfvnldknbv', 'N', '-', '0000-00-00 00:00:00', 'Y', '2024-06-13 16:44:20'),
(69, 1, '/user/ltd_report', 'undefined', 'kfvnldknbv', 'N', '-', '0000-00-00 00:00:00', 'Y', '2024-06-13 16:44:41'),
(70, 1, '/user/ltd_report', 'undefined', 'jcfevh;', 'N', '-', '0000-00-00 00:00:00', 'Y', '2024-06-13 16:44:47'),
(71, 1, '/user/ltd_report', 'undefined', 'jcfevh;', 'N', '-', '0000-00-00 00:00:00', 'Y', '2024-06-13 16:46:30'),
(72, 1, '/user/ltd_report', 'undefined', 'jcfevh;', 'N', '-', '0000-00-00 00:00:00', 'Y', '2024-06-13 16:46:50'),
(73, 1, '/user/ltd_report', 'undefined', 'jcfevh;', 'N', '-', '0000-00-00 00:00:00', 'Y', '2024-06-13 16:52:37'),
(74, 1, '/user/ltd_report', 'undefined', 'jcfevh;', 'N', '-', '0000-00-00 00:00:00', 'Y', '2024-06-13 16:53:29'),
(75, 1, '/user/ltd_report', 'undefined', 'jcfevh;', 'N', '-', '0000-00-00 00:00:00', 'Y', '2024-06-13 16:54:07'),
(76, 1, '/user/ltd_report', 'undefined', 'jcfevh;', 'N', '-', '0000-00-00 00:00:00', 'Y', '2024-06-13 16:55:50'),
(77, 1, '/user/ltd_report', 'undefined', 'jcfevh;', 'N', '-', '0000-00-00 00:00:00', 'Y', '2024-06-13 16:59:27'),
(78, 0, '/user/ltd_report', 'undefined', 'undefined', 'F', 'Request already processed', '2024-06-13 17:04:44', 'Y', '2024-06-13 17:04:44'),
(79, 1, '/user/ltd_report', 'undefined', 'jcfevh;', 'N', '-', '0000-00-00 00:00:00', 'Y', '2024-06-13 17:07:20'),
(80, 1, '/user/ltd_report', 'undefined', 'jcfevh;', 'N', '-', '0000-00-00 00:00:00', 'Y', '2024-06-13 17:10:07'),
(81, 1, '/user/ltd_report', 'undefined', 'jcfevh;', 'N', '-', '0000-00-00 00:00:00', 'Y', '2024-06-13 17:10:21'),
(82, 1, '/user/ltd_report', 'undefined', 'jcfevh;', 'N', '-', '0000-00-00 00:00:00', 'Y', '2024-06-13 17:10:31'),
(83, 1, '/user/ltd_report', 'undefined', 'jcfevh;', 'N', '-', '0000-00-00 00:00:00', 'Y', '2024-06-13 17:11:01'),
(84, 1, '/user/ltd_report', 'undefined', 'jcfevh;', 'N', '-', '0000-00-00 00:00:00', 'Y', '2024-06-13 17:11:26'),
(85, 0, '/user/ltd_report', 'undefined', 'undefined', 'F', 'Request already processed', '2024-06-13 17:12:03', 'Y', '2024-06-13 17:12:03'),
(86, 0, '/user/ltd_report', 'undefined', 'undefined', 'F', 'Request already processed', '2024-06-13 17:14:13', 'Y', '2024-06-13 17:14:13'),
(87, 0, '/user/ltd_report', 'undefined', 'undefined', 'F', 'Request already processed', '2024-06-13 17:14:34', 'Y', '2024-06-13 17:14:34'),
(88, 1, '/login', 'undefined', 'djvkdjkcbdjv', 'F', 'Request already processed', '2024-06-14 12:02:30', 'Y', '2024-06-14 12:02:30'),
(89, 1, '/login', 'undefined', 'i am naga', 'S', 'Success', '2024-06-14 12:02:40', 'Y', '2024-06-14 12:02:40'),
(90, 1, '/user/change_password', 'undefined', 'hjjvhj', 'N', '-', '0000-00-00 00:00:00', 'Y', '2024-06-14 12:03:27'),
(91, 0, '/user/camera_check/', 'undefined', 'i am naga', 'F', 'Request already processed', '2024-06-14 12:04:49', 'Y', '2024-06-14 12:04:49'),
(92, 1, '/user/camera_check/', 'undefined', 'naga', 'N', '-', '0000-00-00 00:00:00', 'Y', '2024-06-14 12:04:56'),
(93, 0, '/user/dashbord_change', 'undefined', 'undefined', 'F', 'Request already processed', '2024-06-14 12:05:09', 'Y', '2024-06-14 12:05:09'),
(94, 0, '/user/dashbord_change', 'undefined', 'undefined', 'F', 'Request already processed', '2024-06-14 12:06:07', 'Y', '2024-06-14 12:06:07'),
(95, 1, '/logout', 'undefined', 'svddfvws', 'S', 'Success', '2024-06-14 12:47:10', 'Y', '2024-06-14 12:47:10'),
(96, 0, '/logout', 'undefined', 'ekjcfnjdjd', 'F', 'Invalid token or User ID', '2024-06-14 12:50:20', 'Y', '2024-06-14 12:50:20'),
(97, 0, '/login', 'undefined', 'i am naga', 'F', 'Request already processed', '2024-06-14 12:50:43', 'Y', '2024-06-14 12:50:43'),
(98, 0, '/login', 'undefined', 'iam naga', 'F', 'Token is required', '2024-06-14 12:50:55', 'Y', '2024-06-14 12:50:55'),
(99, 0, '/login', 'undefined', 'cdjvdbj', 'F', 'Token is required', '2024-06-14 12:51:07', 'Y', '2024-06-14 12:51:07'),
(100, 0, '/login', 'undefined', 'cdjvdbj', 'F', 'Request already processed', '2024-06-14 12:51:44', 'Y', '2024-06-14 12:51:44'),
(101, 0, '/login', 'undefined', 'ckjdbndjkvv', 'F', 'Token is required', '2024-06-14 12:51:49', 'Y', '2024-06-14 12:51:49'),
(102, 0, '/login', 'undefined', 'ckjdbndjkvv', 'F', 'Request already processed', '2024-06-14 12:52:31', 'Y', '2024-06-14 12:52:31'),
(103, 0, '/login', 'undefined', 'djshcvbdw', 'F', 'Invalid token', '2024-06-14 12:52:37', 'Y', '2024-06-14 12:52:37'),
(104, 0, '/logout', 'undefined', 'xavdvdv', 'F', 'Invalid token or User ID', '2024-06-14 12:53:18', 'Y', '2024-06-14 12:53:18'),
(105, 0, '/login', 'undefined', 'djshsn cvbdw', 'F', 'Invalid token', '2024-06-14 12:53:28', 'Y', '2024-06-14 12:53:28'),
(106, 0, '/login', 'undefined', 'djshsn cvbdw', 'F', 'Request already processed', '2024-06-14 12:53:38', 'Y', '2024-06-14 12:53:38'),
(107, 0, '/login', 'undefined', 'djshsncvbdw', 'F', 'Invalid token', '2024-06-14 12:53:41', 'Y', '2024-06-14 12:53:41'),
(108, 0, '/login', 'undefined', 'xcdjhlvbl', 'F', 'Token is required', '2024-06-14 12:54:09', 'Y', '2024-06-14 12:54:09'),
(109, 1, '/login', 'undefined', 'xcdjhlvbl', 'F', 'Request already processed', '2024-06-14 12:56:12', 'Y', '2024-06-14 12:56:12'),
(110, 1, '/login', 'undefined', 'wjchbejh', 'S', 'Success', '2024-06-14 12:56:17', 'Y', '2024-06-14 12:56:17'),
(111, 1, '/logout', 'undefined', 'dkjc vnb;', 'S', 'Success', '2024-06-14 13:06:07', 'Y', '2024-06-14 13:05:44'),
(112, 1, '/logout', 'undefined', 'dkjc vnb;', 'S', 'Success', '2024-06-14 13:06:07', 'Y', '2024-06-14 13:06:07'),
(113, 1, '/logout', 'undefined', 'dkjc vnb;', 'S', 'Success', '2024-06-14 13:06:07', 'Y', '2024-06-14 13:06:07'),
(114, 1, '/login', 'undefined', 'KJDFCED', 'S', 'Success', '2024-06-14 13:06:55', 'Y', '2024-06-14 13:06:55'),
(115, 1, '/user/change_password', 'undefined', 'cdkbvj', 'N', '-', '0000-00-00 00:00:00', 'Y', '2024-06-14 15:03:20'),
(116, 1, '/user/change_password', 'undefined', 'efjrn;o', 'N', '-', '0000-00-00 00:00:00', 'Y', '2024-06-14 15:03:52'),
(117, 1, '/login', 'undefined', 'feere', 'F', 'Invalid Password. Kindly try again with the valid details!', '2024-06-14 15:32:48', 'Y', '2024-06-14 15:32:48'),
(118, 1, '/login', 'undefined', 'f4rfrf', 'S', 'Success', '2024-06-14 15:33:04', 'Y', '2024-06-14 15:33:03'),
(119, 1, '/login', 'undefined', 'f4rfrf', 'F', 'Request already processed', '2024-06-14 15:50:07', 'Y', '2024-06-14 15:50:07'),
(120, 1, '/login', 'undefined', 'f4rfrf', 'F', 'Request already processed', '2024-06-14 16:00:05', 'Y', '2024-06-14 16:00:05'),
(121, 1, '/login', 'undefined', 'f4rehjcfbherfrf', 'S', 'Success', '2024-06-14 16:00:30', 'Y', '2024-06-14 16:00:30'),
(122, 1, '/login', 'undefined', '2024165161503_3832', 'S', 'Success', '2024-06-14 16:15:04', 'Y', '2024-06-14 16:15:03'),
(123, 1, '/login', 'undefined', '2024165161641_2638', 'S', 'Success', '2024-06-14 16:16:41', 'Y', '2024-06-14 16:16:41'),
(124, 1, '/login', 'undefined', '2024165162644_7256', 'S', 'Success', '2024-06-14 16:26:44', 'Y', '2024-06-14 16:26:44'),
(125, 1, '/login', 'undefined', '2024165164422_6463', 'S', 'Success', '2024-06-14 16:44:23', 'Y', '2024-06-14 16:44:22'),
(126, 1, '/login', 'undefined', '2024165164433_3891', 'S', 'Success', '2024-06-14 16:44:33', 'Y', '2024-06-14 16:44:33'),
(127, 1, '/login', 'undefined', '2024165164438_2450', 'S', 'Success', '2024-06-14 16:44:38', 'Y', '2024-06-14 16:44:38'),
(128, 1, '/login', 'undefined', '2024165164449_3318', 'S', 'Success', '2024-06-14 16:44:49', 'Y', '2024-06-14 16:44:49'),
(129, 1, '/login', 'undefined', '2024165164716_4655', 'S', 'Success', '2024-06-14 16:47:16', 'Y', '2024-06-14 16:47:16'),
(130, 1, '/login', 'undefined', '2024165164800_5153', 'S', 'Success', '2024-06-14 16:48:00', 'Y', '2024-06-14 16:48:00'),
(131, 1, '/login', 'undefined', '2024165165135_7422', 'S', 'Success', '2024-06-14 16:51:35', 'Y', '2024-06-14 16:51:35'),
(132, 1, '/login', 'undefined', '2024165170335_4917', 'S', 'Success', '2024-06-14 17:03:35', 'Y', '2024-06-14 17:03:35'),
(133, 1, '/login', 'undefined', '2024165170341_3379', 'S', 'Success', '2024-06-14 17:03:41', 'Y', '2024-06-14 17:03:41'),
(134, 1, '/login', 'undefined', '2024165170532_6868', 'S', 'Success', '2024-06-14 17:05:32', 'Y', '2024-06-14 17:05:32'),
(135, 1, '/login', 'undefined', '2024165170536_2841', 'S', 'Success', '2024-06-14 17:05:36', 'Y', '2024-06-14 17:05:36'),
(136, 1, '/login', 'undefined', '2024165171612_7822', 'S', 'Success', '2024-06-14 17:16:12', 'Y', '2024-06-14 17:16:12'),
(137, 1, '/login', 'undefined', '2024165182103_6512', 'S', 'Success', '2024-06-14 18:21:03', 'Y', '2024-06-14 18:21:03'),
(138, 1, '/login', 'undefined', '2024165182157_1782', 'S', 'Success', '2024-06-14 18:21:57', 'Y', '2024-06-14 18:21:57'),
(139, 1, '/login', 'undefined', '2024165182333_7310', 'S', 'Success', '2024-06-14 18:23:33', 'Y', '2024-06-14 18:23:33'),
(140, 1, '/login', 'undefined', '2024165182423_5991', 'S', 'Success', '2024-06-14 18:24:23', 'Y', '2024-06-14 18:24:23'),
(141, 1, '/login', 'undefined', '2024165183218_8872', 'S', 'Success', '2024-06-14 18:32:18', 'Y', '2024-06-14 18:32:18'),
(142, 1, '/login', 'undefined', '2024165183433_7621', 'S', 'Success', '2024-06-14 18:34:33', 'Y', '2024-06-14 18:34:33'),
(143, 0, '/user/change_password', 'undefined', 'jedhfvrjhle', 'F', 'Invalid token', '2024-06-14 18:36:03', 'Y', '2024-06-14 18:36:03'),
(144, 0, '/user/change_password', 'undefined', 'jedhfvrjhle', 'F', 'Request already processed', '2024-06-14 18:36:46', 'Y', '2024-06-14 18:36:46'),
(145, 0, '/user/change_password', 'undefined', 'whfbcehwkv', 'F', 'Invalid token', '2024-06-14 18:36:52', 'Y', '2024-06-14 18:36:52'),
(146, 0, '/user/change_password', 'undefined', 'wfkje', 'F', 'Invalid token', '2024-06-14 18:37:16', 'Y', '2024-06-14 18:37:16'),
(147, 1, '/login', 'undefined', 'dfnc dkvr', 'S', 'Success', '2024-06-14 18:37:53', 'Y', '2024-06-14 18:37:53'),
(148, 1, '/user/change_password', 'undefined', 'ekljefjrbh', 'N', '-', '0000-00-00 00:00:00', 'Y', '2024-06-14 18:38:22'),
(149, 1, '/login', 'undefined', '2024165184037_3930', 'F', 'Invalid Password. Kindly try again with the valid details!', '2024-06-14 18:40:37', 'Y', '2024-06-14 18:40:37'),
(150, 1, '/login', 'undefined', '2024165184045_8449', 'S', 'Success', '2024-06-14 18:40:45', 'Y', '2024-06-14 18:40:45'),
(151, 1, '/login', 'undefined', '2024166100025_9226', 'F', 'Invalid Password. Kindly try again with the valid details!', '2024-06-15 10:00:25', 'Y', '2024-06-15 10:00:25'),
(152, 1, '/login', 'undefined', '2024166100101_2868', 'S', 'Success', '2024-06-15 10:01:01', 'Y', '2024-06-15 10:01:01'),
(153, 1, '/login', 'undefined', 'dvdhfrvh', 'S', 'Success', '2024-06-15 10:36:53', 'Y', '2024-06-15 10:36:53');

-- --------------------------------------------------------

--
-- Table structure for table `api_log1`
--

CREATE TABLE `api_log1` (
  `log_id` int(11) NOT NULL,
  `api_url` varchar(50) NOT NULL,
  `ip_address` varchar(30) NOT NULL,
  `request_id` varchar(30) NOT NULL,
  `response_status` char(1) NOT NULL,
  `response_comments` varchar(150) NOT NULL,
  `response_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `log_status` char(1) NOT NULL,
  `log_entry_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `api_log1`
--

INSERT INTO `api_log1` (`log_id`, `api_url`, `ip_address`, `request_id`, `response_status`, `response_comments`, `response_date`, `log_status`, `log_entry_date`) VALUES
(1, '/login', 'undefined', 'jdhweld', 'F', 'Invalid User. Kindly try again with the valid User!', '2024-06-11 18:19:10', 'Y', '2024-06-11 18:19:10'),
(2, '/login', 'undefined', 'jdhweld', 'F', 'Request already processed', '2024-06-11 18:19:32', 'Y', '2024-06-11 18:19:32'),
(3, '/login', 'undefined', '283672', 'F', 'Invalid Password. Kindly try again with the valid details!', '2024-06-11 18:20:08', 'Y', '2024-06-11 18:20:08'),
(4, '/login', 'undefined', '283672', 'F', 'Request already processed', '2024-06-11 18:20:49', 'Y', '2024-06-11 18:20:48'),
(5, '/login', 'undefined', 'kxbhwjs', 'S', 'Success', '2024-06-11 18:20:57', 'Y', '2024-06-11 18:20:57'),
(6, '/login', 'undefined', '283672', 'F', 'Request already processed', '2024-06-12 09:30:17', 'Y', '2024-06-12 09:30:17'),
(7, '/login', 'undefined', 'dfhjd', 'F', 'Invalid Password. Kindly try again with the valid details!', '2024-06-12 09:30:25', 'Y', '2024-06-12 09:30:25'),
(8, '/login', 'undefined', 'dfhjd', 'F', 'Request already processed', '2024-06-12 09:30:42', 'Y', '2024-06-12 09:30:42'),
(9, '/login', 'undefined', 'jnjnj', 'S', 'Success', '2024-06-12 09:30:50', 'Y', '2024-06-12 09:30:50'),
(10, '/login', 'undefined', 'jnjnj', 'F', 'Request already processed', '2024-06-12 11:18:30', 'Y', '2024-06-12 11:18:30'),
(11, '/login', 'undefined', 'cbnd', 'F', 'Invalid Password. Kindly try again with the valid details!', '2024-06-12 15:38:33', 'Y', '2024-06-12 15:38:33'),
(12, '/login', 'undefined', 'cbnd', 'F', 'Request already processed', '2024-06-12 15:38:44', 'Y', '2024-06-12 15:38:44'),
(13, '/login', 'undefined', 'jdkvbjkd', 'S', 'Success', '2024-06-12 15:38:53', 'Y', '2024-06-12 15:38:53'),
(14, '/logout', 'undefined', 'ejhcdjdx', 'F', 'Error Occurred.', '2024-06-12 15:48:33', 'Y', '2024-06-12 15:48:33'),
(15, '/login', 'undefined', 'jdkvbjkd', 'F', 'Request already processed', '2024-06-12 15:54:08', 'Y', '2024-06-12 15:54:08'),
(16, '/login', 'undefined', 'jkfbvjf', 'S', 'Success', '2024-06-12 15:54:16', 'Y', '2024-06-12 15:54:16'),
(17, '/logout', 'undefined', 'djvbn', 'S', 'Success', '2024-06-12 15:55:17', 'Y', '2024-06-12 15:55:17'),
(18, '/login', 'undefined', 'CDUHJVCD', 'S', 'Success', '2024-06-12 16:08:25', 'Y', '2024-06-12 16:08:25');

-- --------------------------------------------------------

--
-- Table structure for table `camera_details`
--

CREATE TABLE `camera_details` (
  `camera_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  `camera_position` varchar(30) NOT NULL,
  `ip_address` varchar(40) NOT NULL,
  `camera_details` varchar(100) NOT NULL,
  `video_url` varchar(200) DEFAULT NULL,
  `start_stop_action` char(1) DEFAULT NULL,
  `camera_status` char(1) NOT NULL,
  `camera_entry_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `camera_details`
--

INSERT INTO `camera_details` (`camera_id`, `store_id`, `camera_position`, `ip_address`, `camera_details`, `video_url`, `start_stop_action`, `camera_status`, `camera_entry_date`) VALUES
(1, 1, 'Front Entrance', '192.168.1.27', 'Office Front Entrance', NULL, 'Y', 'Y', '2023-01-11 14:16:35'),
(2, 1, 'Back Entrance', '192.168.1.24', 'Office Back Entrance', NULL, 'Y', 'Y', '2023-01-11 00:00:00'),
(3, 1, 'Office Cabin 1', '192.168.1.22', 'Office Cabin 1', NULL, 'Y', 'Y', '2023-01-11 00:00:00'),
(4, 1, 'Office Cabin 2', '192.168.1.29', 'Office Cabin 2', NULL, 'Y', 'Y', '2023-01-11 00:00:00'),
(5, 1, 'Office Reception', '192.168.1.25', 'Office Reception', NULL, 'N', 'Y', '2023-01-11 00:00:00'),
(6, 1, 'Front Entrance', '192.168.1.100', 'Indoor camera', 'NULL', 'N', 'Y', '2024-06-12 12:43:56'),
(7, 1, 'Front Entrance', '192.168.1.100', 'Indoor camera', 'NULL', 'N', 'Y', '2024-06-14 12:04:56');

-- --------------------------------------------------------

--
-- Table structure for table `customer_interest`
--

CREATE TABLE `customer_interest` (
  `customer_interest_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `visitor_interest_id` int(11) NOT NULL,
  `cus_int_status` char(1) NOT NULL,
  `cus_int_entry_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `customer_interest`
--

INSERT INTO `customer_interest` (`customer_interest_id`, `customer_id`, `visitor_interest_id`, `cus_int_status`, `cus_int_entry_date`) VALUES
(1, 1, 1, 'Y', '2023-01-31 13:39:38'),
(2, 1, 3, 'Y', '2023-01-31 13:39:38'),
(3, 1, 4, 'Y', '2023-01-31 13:39:38'),
(4, 23, 1, 'Y', '2023-07-26 11:26:38'),
(5, 23, 2, 'Y', '2023-07-26 11:26:38'),
(6, 23, 3, 'Y', '2023-07-26 11:26:38'),
(7, 26, 6, 'Y', '2023-07-26 13:27:06'),
(8, 27, 5, 'Y', '2024-05-21 16:58:47'),
(9, 27, 2, 'Y', '2024-05-21 16:58:47');

-- --------------------------------------------------------

--
-- Table structure for table `customer_management`
--

CREATE TABLE `customer_management` (
  `customer_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `customer_management`
--

INSERT INTO `customer_management` (`customer_id`, `store_id`, `aws_faceid`, `visitor_id`, `customer_name`, `customer_mobile`, `customer_email`, `customer_gender`, `min_age`, `max_age`, `age_category`, `customer_interest`, `cus_mgt_status`, `cus_mgt_entry_date`, `cus_mgt_reg_date`) VALUES
(19, 1, '8991031c-8370-41f8-a45f-628c9a4836e6', 'AA523028-133044-580', 'madhu', '8838964597', '', 'F', '25', '35', 'ADULT', '5,', 'Y', '2024-01-31 17:58:08', '2024-01-31 18:20:59'),
(22, 1, '48400a3f-16d9-41a2-86bb-f16c27125b401', 'AA123030-133321-1841', 'Arun', '9894606741', 'arun@yeejai.com', 'M', '34', '42', 'ADULT', '5,1,3,', 'Y', '2024-02-01 14:59:05', '2024-02-02 10:14:37'),
(23, 1, '3af94646-311b-4f3c-80a7-8c20395d01e4', 'AA123031-132220-720', 'Shanthini', '6380885546', 'shanthini1822001@gmail.com', 'F', '18', '24', 'ADULT', '1,2,3,', 'Y', '2024-02-01 16:06:33', '2024-07-26 11:26:38'),
(24, 1, 'feaedcc4-b71d-42f5-962f-9776096d0285', 'AA123031-175137-433', 'Sabi', '9361419661', '', 'F', '19', '27', 'ADULT', '3,', 'Y', '2024-02-01 18:07:47', '2024-02-01 18:09:32'),
(25, 1, 'f8df1f97-3c83-4f3a-b281-14cda466a8ae', 'AA123033-133451-564', 'GA', '9894606748', 'arun@yeejai.com', 'M', '35', '43', 'ADULT', '5,4,3,', 'Y', '2024-02-02 13:34:53', '2024-02-02 13:34:53'),
(26, 1, '35277aef-f356-4619-bccd-f73dfaa24771', 'AA123207-132705-385', 'Sangari S', '9344145033', 'sangari@gmail.com', 'F', '27', '37', 'ADULT', '6,', 'Y', '2024-06-06 13:27:05', '2024-07-26 13:27:05'),
(27, 1, '0b24d184-f12e-4a66-b266-6d26295baae9', 'AA124142-165847-716', 'Nagendran', '9361601845', 'nagendran@gmail.com', 'M', '24', '34', 'ADULT', '5,2,', 'Y', '2023-06-06 13:27:06', '2023-06-06 13:27:06');

-- --------------------------------------------------------

--
-- Table structure for table `interest_list`
--

CREATE TABLE `interest_list` (
  `visitor_interest_id` int(11) NOT NULL,
  `visitor_interest_title` varchar(30) NOT NULL,
  `visitor_interest_area` varchar(100) NOT NULL,
  `visitor_interest_status` char(1) NOT NULL,
  `visitor_interest_entdate` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci ROW_FORMAT=COMPACT;

--
-- Dumping data for table `interest_list`
--

INSERT INTO `interest_list` (`visitor_interest_id`, `visitor_interest_title`, `visitor_interest_area`, `visitor_interest_status`, `visitor_interest_entdate`) VALUES
(1, 'Foods & Beverages', 'Foods & Beverages', 'Y', '2023-01-11 00:00:00'),
(2, 'Movies', 'Movies', 'Y', '2023-01-11 00:00:00'),
(3, 'Shopping', 'Shopping', 'Y', '2023-01-11 00:00:00'),
(4, 'Groceries', 'Groceries', 'Y', '2023-01-11 00:00:00'),
(5, 'Deals & Discounts', 'Deals & Discounts', 'Y', '2023-01-11 00:00:00'),
(6, 'Entertainment', 'Entertainment', 'Y', '2023-01-11 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `sms_updates`
--

CREATE TABLE `sms_updates` (
  `sms_update_id` int(11) NOT NULL,
  `aws_faceid` varchar(50) NOT NULL,
  `sms_status` char(1) NOT NULL,
  `sms_entry_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `sms_updates`
--

INSERT INTO `sms_updates` (`sms_update_id`, `aws_faceid`, `sms_status`, `sms_entry_date`) VALUES
(1, '3af94646-311b-4f3c-80a7-8c20395d01e4', 'Y', '2023-07-26 11:28:20');

-- --------------------------------------------------------

--
-- Table structure for table `store_details`
--

CREATE TABLE `store_details` (
  `store_id` int(11) NOT NULL,
  `store_name` varchar(30) NOT NULL,
  `company_name` varchar(30) DEFAULT NULL,
  `store_address_details` varchar(100) DEFAULT NULL,
  `store_status` char(1) NOT NULL,
  `store_entry_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `store_details`
--

INSERT INTO `store_details` (`store_id`, `store_name`, `company_name`, `store_address_details`, `store_status`, `store_entry_date`) VALUES
(1, 'YJ-Office 1', 'YeeJai Technologies', '10, Perkinspuram, Aruppukkottai, TN, IND', 'Y', '2023-01-11 00:00:00'),
(2, 'YJ-Lab 1', 'YeeJai Technologies', '11, Perkinspuram, Aruppukkottai, TN, IND', 'Y', '2023-01-11 00:00:00'),
(3, 'YJ-Lab 2', 'YeeJai Technologies', '12, Perkinspuram, Aruppukkottai, TN, IND', 'Y', '2023-01-11 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `unique_visitors`
--

CREATE TABLE `unique_visitors` (
  `unique_visitors_id` int(11) NOT NULL,
  `aws_faceid` varchar(50) NOT NULL,
  `visitor_id` varchar(25) NOT NULL,
  `visitor_gender` char(1) NOT NULL,
  `min_age` varchar(10) NOT NULL,
  `max_age` varchar(10) NOT NULL,
  `age_category` varchar(10) NOT NULL,
  `unique_visitors_reference` varchar(50) NOT NULL,
  `unique_visitors_status` char(1) NOT NULL,
  `unique_visitors_entdate` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `unique_visitors`
--

INSERT INTO `unique_visitors` (`unique_visitors_id`, `aws_faceid`, `visitor_id`, `visitor_gender`, `min_age`, `max_age`, `age_category`, `unique_visitors_reference`, `unique_visitors_status`, `unique_visitors_entdate`) VALUES
(67, '9ec75130-b090-4f13-b458-e350364bbea1', 'AA923030-092544-742', 'M', '24', '34', 'ADULT', 'AWS new user', 'Y', '2023-01-30 09:25:44'),
(68, '752e5ff0-3aa6-4790-b959-365310d62501', 'AA923030-093714-400', 'M', '23', '33', 'ADULT', 'AWS new user', 'Y', '2023-01-30 09:37:14'),
(69, 'eb4ab58c-37a2-4657-a894-b984bce52f68', 'AA923030-093719-759', 'M', '22', '30', 'ADULT', 'AWS new user', 'Y', '2023-01-30 09:37:19'),
(70, '72b03a5b-72d8-4200-8e2b-47d8ae88fbb0', 'AA923030-095411-946', 'M', '23', '31', 'ADULT', 'AWS new user', 'Y', '2023-01-30 09:54:11'),
(71, 'c5a6a81f-705f-4d85-a0cb-187870505b66', 'AA923030-095529-844', 'M', '23', '33', 'ADULT', 'AWS new user', 'Y', '2023-01-30 09:55:29'),
(72, 'ca70f7f3-3bed-45fd-87e9-582bdc525343', 'AA923030-095652-583', 'M', '23', '33', 'ADULT', 'AWS new user', 'Y', '2023-01-30 09:56:52'),
(73, '08784b67-e1f7-4509-8770-76e467a0d027', 'AA923030-095907-517', 'F', '19', '27', 'ADULT', 'AWS new user', 'Y', '2023-01-30 09:59:07'),
(74, '11d7ef8f-8781-4687-82ba-8c040f2f070a', 'AA923030-100156-652', 'M', '28', '38', 'ADULT', 'AWS new user', 'Y', '2023-01-30 10:01:56'),
(75, '23045746-cc3a-49bd-a62e-c47e9a8229e3', 'AA923030-100943-796', 'F', '23', '33', 'ADULT', 'AWS new user', 'Y', '2023-01-30 10:09:43'),
(76, 'b30c9710-b70f-4beb-9d9a-8a79c10ebdbd', 'AA923030-102525-756', 'M', '22', '30', 'ADULT', 'AWS new user', 'Y', '2023-01-30 10:25:25'),
(77, '24b80f09-92f8-4682-9265-c47d959a6812', 'AA923030-105009-502', 'M', '20', '28', 'ADULT', 'AWS new user', 'Y', '2023-01-30 10:50:09'),
(78, '3039f4cd-4b06-4186-89dc-554e46e96e2b', 'AA923030-105010-124', 'M', '22', '30', 'ADULT', 'AWS new user', 'Y', '2023-01-30 10:50:10'),
(79, 'b05412c0-e835-40a7-9d81-83063f30d056', 'AA923030-105018-78', 'M', '22', '30', 'ADULT', 'AWS new user', 'Y', '2023-01-30 10:50:18'),
(80, 'b3092f9b-eec7-49cb-9200-e8805aa29c19', 'AA923030-105320-399', 'M', '38', '46', 'MIDDLE AGE', 'AWS new user', 'Y', '2023-01-30 10:53:20'),
(81, '4f4e53f5-47bc-4682-b300-3a8269583fd6', 'AA923030-112351-861', 'M', '34', '42', 'ADULT', 'AWS new user', 'Y', '2023-01-30 11:23:51'),
(82, '8355b061-5d5c-45cf-8216-8136e72fcfcb', 'AA923030-112356-979', 'M', '22', '30', 'ADULT', 'AWS new user', 'Y', '2023-01-30 11:23:56'),
(83, '4ae120cd-a758-4be9-ac48-78cb27319c4a', 'AA923030-123924-845', 'M', '20', '28', 'ADULT', 'AWS new user', 'Y', '2023-01-30 12:39:24'),
(84, '33160105-b34a-4155-93db-604a1e7cd25c', 'AA923030-124847-675', 'M', '24', '34', 'ADULT', 'AWS new user', 'Y', '2023-01-30 12:48:47'),
(85, '65e01eb7-d4b6-48b3-9c89-d93b659bd6c9', 'AA923030-133919-318', 'F', '20', '28', 'ADULT', 'AWS new user', 'Y', '2023-01-30 13:39:19'),
(86, '65e01eb7-d4b6-48b3-9c89-d93b659bd6c9', 'AA923030-133923-103', 'F', '19', '27', 'ADULT', 'AWS new user', 'Y', '2023-01-30 13:39:23'),
(87, 'f41ab014-ced5-41e7-8660-4ae168b8a06e', 'AA923030-134442-649', 'M', '28', '38', 'ADULT', 'AWS new user', 'Y', '2023-01-30 13:44:42'),
(88, 'a044b5c3-4a2b-4c6c-a99f-62d004f4e2c6', 'AA923030-134451-235', 'M', '23', '33', 'ADULT', 'AWS new user', 'Y', '2023-01-30 13:44:51'),
(89, 'cafd3106-625e-4122-9e01-f95b8af75f0c', 'AA923030-134524-80', 'M', '37', '45', 'MIDDLE AGE', 'AWS new user', 'Y', '2023-01-30 13:45:24'),
(90, '77f08ce9-162d-48cb-b8ba-d5979597830a', 'AA923030-134529-825', 'O', '28', '38', 'ADULT', 'AWS new user', 'Y', '2023-01-30 13:45:29'),
(91, '5afb5d2d-150a-4d0b-8ce9-0aa4d28ef07d', 'AA923030-134858-497', 'M', '23', '31', 'ADULT', 'AWS new user', 'Y', '2023-01-30 13:48:58'),
(92, 'b024abcb-3d6e-42f2-8cb0-386e28084a5a', 'AA923030-134858-39', 'M', '25', '35', 'ADULT', 'AWS new user', 'Y', '2023-01-30 13:48:58'),
(93, 'b6231cc5-a42a-4fbb-ab2b-02515d968666', 'AA923030-134949-573', 'F', '18', '26', 'ADULT', 'AWS new user', 'Y', '2023-01-30 13:49:49'),
(94, 'ba73e0aa-4d42-4c37-bcf1-d5174a8604bd', 'AA923030-140220-263', 'M', '30', '40', 'ADULT', 'AWS new user', 'Y', '2023-01-30 14:02:20'),
(95, 'f6537c5a-7652-494e-86fa-d36879f60062', 'AA923030-140418-103', 'O', '16', '22', 'TEEN', 'AWS new user', 'Y', '2023-01-30 14:04:18'),
(96, '0bbfffe2-3d19-4eb2-97b1-d11deaf69330', 'AA923030-140423-902', 'M', '27', '37', 'ADULT', 'AWS new user', 'Y', '2023-01-30 14:04:23'),
(97, '503acb4f-8d66-4e74-9124-5687fdf19122', 'AA923030-140423-422', 'M', '21', '29', 'ADULT', 'AWS new user', 'Y', '2023-01-30 14:04:23'),
(98, '0e70f37e-4fe4-4cd2-8e7f-9061fb51e4b2', 'AA923030-140524-224', 'M', '24', '34', 'ADULT', 'AWS new user', 'Y', '2023-01-30 14:05:24'),
(99, 'a911a49f-8067-4df3-8945-6030034c7419', 'AA923030-141003-37', 'F', '23', '33', 'ADULT', 'AWS new user', 'Y', '2023-01-30 14:10:03'),
(100, '29e6401f-ce3f-43fb-a88f-954599a50f17', 'AA923030-141008-149', 'F', '27', '37', 'ADULT', 'AWS new user', 'Y', '2023-01-30 14:10:08'),
(101, '7c153419-8cc2-4571-a458-cc2ab45620c8', 'AA923030-141107-589', 'F', '23', '31', 'ADULT', 'AWS new user', 'Y', '2023-01-30 14:11:07'),
(102, '979c6343-edbc-4917-aa42-845b15ff7e9b', 'AA923030-141120-890', 'F', '24', '34', 'ADULT', 'AWS new user', 'Y', '2023-01-30 14:11:20'),
(103, '979c6343-edbc-4917-aa42-845b15ff7e9b', 'AA923030-141159-995', 'F', '13', '21', 'TEEN', 'AWS new user', 'Y', '2023-01-30 14:11:59'),
(104, '0c7997e5-bfb8-472c-9814-c7b961a97513', 'AA923030-141247-71', 'M', '29', '39', 'ADULT', 'AWS new user', 'Y', '2023-01-30 14:12:47'),
(105, 'a6c9f6ef-c473-46fc-801b-9799cc1b37d2', 'AA923030-141252-482', 'M', '31', '41', 'ADULT', 'AWS new user', 'Y', '2023-01-30 14:12:52'),
(106, 'a6c9f6ef-c473-46fc-801b-9799cc1b37d2', 'AA923030-141256-882', 'M', '31', '41', 'ADULT', 'AWS new user', 'Y', '2023-01-30 14:12:56'),
(107, '393367d5-da54-49a8-b7af-be041c06db22', 'AA923030-141621-383', 'M', '25', '35', 'ADULT', 'AWS new user', 'Y', '2023-01-30 14:16:21'),
(108, 'eb407709-7eba-4fc1-bf52-0c43f6430dcb', 'AA923030-141844-196', 'M', '24', '34', 'ADULT', 'AWS new user', 'Y', '2023-01-30 14:18:44'),
(109, '56033e02-da71-4ee1-9290-36a098412b7f', 'AA923030-141930-780', 'O', '19', '27', 'ADULT', 'AWS new user', 'Y', '2023-01-30 14:19:30'),
(110, '370753cc-a16b-49f1-ab4d-cb269bad9794', 'AA923030-141939-152', 'M', '16', '22', 'TEEN', 'AWS new user', 'Y', '2023-01-30 14:19:39'),
(111, 'e0dd038f-d35b-4e82-af88-78a84ab140cf', 'AA923030-142552-645', 'F', '20', '28', 'ADULT', 'AWS new user', 'Y', '2023-01-30 14:25:52'),
(112, 'cc60bdfc-4a31-48ed-9dc4-297d6e319de0', 'AA923030-143303-109', 'M', '22', '30', 'ADULT', 'AWS new user', 'Y', '2023-01-30 14:33:03'),
(113, '3647d280-e257-47b3-b27e-8f5255529374', 'AA923030-143307-52', 'M', '31', '41', 'ADULT', 'AWS new user', 'Y', '2023-01-30 14:33:07'),
(114, '6727a658-1219-49bd-ba98-fdcb3a438805', 'AA923030-143307-578', 'M', '22', '30', 'ADULT', 'AWS new user', 'Y', '2023-01-30 14:33:07'),
(115, '37e5fc86-1692-4d42-add0-2c447be3bb25', 'AA923030-143630-372', 'O', '19', '27', 'ADULT', 'AWS new user', 'Y', '2023-01-30 14:36:30'),
(116, 'f1b3b6e6-2c81-40b6-b69b-9e9642a64087', 'AA923030-143753-973', 'M', '20', '28', 'ADULT', 'AWS new user', 'Y', '2023-01-30 14:37:53'),
(117, '574ef219-b61e-4f4c-91b5-298f7f13c83c', 'AA923030-144025-970', 'M', '24', '34', 'ADULT', 'AWS new user', 'Y', '2023-01-30 14:40:25'),
(118, '0bdfe3ab-9257-46c1-941e-50ec96e983c7', 'AA923030-150036-143', 'M', '39', '47', 'MIDDLE AGE', 'AWS new user', 'Y', '2023-01-30 15:00:36'),
(119, 'af4ed10b-662b-4b15-9113-16c72e6a785e', 'AA923030-150036-242', 'M', '26', '36', 'ADULT', 'AWS new user', 'Y', '2023-01-30 15:00:36'),
(120, '18a40098-9c0a-470c-a5c9-8d08d494ae14', 'AA923030-152018-823', 'M', '21', '29', 'ADULT', 'AWS new user', 'Y', '2023-01-30 15:20:18'),
(121, 'a54c603a-eb0d-4a6c-9c25-1faa1877f738', 'AA923030-152125-345', 'M', '23', '33', 'ADULT', 'AWS new user', 'Y', '2023-01-30 15:21:25'),
(122, '18851c48-92e3-4168-af9b-46cfea1af4e3', 'AA923030-152548-83', 'O', '20', '28', 'ADULT', 'AWS new user', 'Y', '2023-01-30 15:25:48'),
(123, '828efbbb-7d2a-4286-afe0-8e2cefb2cac9', 'AA923030-152715-246', 'M', '23', '31', 'ADULT', 'AWS new user', 'Y', '2023-01-30 15:27:15'),
(124, '313b732c-a9e9-4332-9d9c-5731344150b4', 'AA923030-155354-631', 'M', '23', '31', 'ADULT', 'AWS new user', 'Y', '2023-01-30 15:53:54'),
(125, 'ffe2cd31-d913-4827-9124-e0c737ae5e1b', 'AA923030-161144-685', 'M', '33', '41', 'ADULT', 'AWS new user', 'Y', '2023-01-30 16:11:44'),
(126, 'ffe2cd31-d913-4827-9124-e0c737ae5e1b', 'AA923030-161148-869', 'M', '30', '40', 'ADULT', 'AWS new user', 'Y', '2023-01-30 16:11:48'),
(127, '960731be-e3ce-4e2a-88b8-c33456646bd2', 'AA923030-165123-912', 'M', '29', '39', 'ADULT', 'AWS new user', 'Y', '2023-01-30 16:51:23'),
(128, '105a7ef5-6935-446e-ac81-5ba305f7aff2', 'AA923030-174928-686', 'F', '16', '24', 'ADULT', 'AWS new user', 'Y', '2023-01-30 17:49:28'),
(129, '250cd868-4794-42b7-b104-0102c919dee6', 'AA923030-180626-299', 'F', '18', '24', 'ADULT', 'AWS new user', 'Y', '2023-01-30 18:06:26'),
(130, '41f61b8d-cd7e-496a-aad5-212b84eada4c', 'AA923030-181201-210', 'M', '27', '37', 'ADULT', 'AWS new user', 'Y', '2023-01-30 18:12:01'),
(131, 'd0aef97c-34d7-47c4-801a-10e2dfebd1d6', 'AA923030-181738-730', 'M', '19', '27', 'ADULT', 'AWS new user', 'Y', '2023-01-30 18:17:38'),
(132, '3af94646-311b-4f3c-80a7-8c20395d01e4', 'AA123030-194459-939', 'F', '18', '24', 'ADULT', 'AWS new user', 'Y', '2023-01-30 19:44:59'),
(133, 'feaedcc4-b71d-42f5-962f-9776096d0285', 'AA123030-194459-617', 'F', '19', '27', 'ADULT', 'AWS new user', 'Y', '2023-01-30 19:44:59'),
(134, '48400a3f-16d9-41a2-86bb-f16c27125b40', 'AA123030-194459-475', 'M', '38', '46', 'MIDDLE AGE', 'AWS new user', 'Y', '2023-01-30 19:44:59'),
(135, '777bf0fc-7a2b-4891-8fb3-62021f383dba', 'AA923031-182457-946', 'M', '37', '45', 'MIDDLE AGE', 'AWS new user', 'Y', '2023-01-31 18:24:57'),
(136, '6d89e78b-1e70-47b2-be9b-862cc154a7e7', 'AA923031-182501-317', 'M', '35', '43', 'ADULT', 'AWS new user', 'Y', '2023-01-31 18:25:01'),
(137, '3ed1f7c0-48e0-46b0-a5da-b23fe9aecfee', 'AA923031-183618-437', 'M', '23', '31', 'ADULT', 'AWS new user', 'Y', '2023-01-31 18:36:18'),
(138, '4dabbbe7-224b-4e34-9a18-c639bdec6e3d', 'AA923031-184058-845', 'F', '22', '30', 'ADULT', 'AWS new user', 'Y', '2023-01-31 18:40:58'),
(139, '200052b1-3cb1-4f0d-a938-d458945eb050', 'AA923031-184058-193', 'M', '25', '35', 'ADULT', 'AWS new user', 'Y', '2023-01-31 18:40:58'),
(140, 'f78583a5-c54f-40cb-b8fd-e439d6c8c5d8', 'AA923031-184121-132', 'O', '22', '30', 'ADULT', 'AWS new user', 'Y', '2023-01-31 18:41:21'),
(141, '427e60b9-d073-41bf-8323-c6f4ce958516', 'AA923031-184211-268', 'F', '21', '29', 'ADULT', 'AWS new user', 'Y', '2023-01-31 18:42:11'),
(142, 'df00dec1-91e7-45e3-9bad-9813e243aa41', 'AA923032-130111-536', 'M', '26', '36', 'ADULT', 'AWS new user', 'Y', '2023-02-01 13:01:11'),
(143, '94fe7beb-4fa8-4548-ac96-c9b62b7fa9ed', 'AA923032-130111-903', 'M', '30', '40', 'ADULT', 'AWS new user', 'Y', '2023-02-01 13:01:11'),
(144, 'c8645165-be37-4572-929a-ba2a11a56042', 'AA923032-132522-24', 'M', '23', '31', 'ADULT', 'AWS new user', 'Y', '2023-02-01 13:25:22'),
(145, '5707821e-66d2-43f4-8a42-f4753e687dac', 'AA923032-132734-320', 'M', '29', '39', 'ADULT', 'AWS new user', 'Y', '2023-02-01 13:27:34'),
(146, 'a6c983ec-b150-4438-b262-d6b3df6336fa', 'AA923032-135249-751', 'O', '27', '37', 'ADULT', 'AWS new user', 'Y', '2023-02-01 13:52:49'),
(147, '508bfa62-9ef2-42e0-834c-fc65a60a33dd', 'AA923032-140416-687', 'M', '23', '33', 'ADULT', 'AWS new user', 'Y', '2023-02-01 14:04:16'),
(148, '49da5e74-9aff-4723-8501-be14ed11a731', 'AA923032-140705-451', 'M', '35', '43', 'ADULT', 'AWS new user', 'Y', '2023-02-01 14:07:05'),
(149, 'a0ce5148-2470-4f59-bf5e-d1300350ddbb', 'AA923032-140710-410', 'F', '12', '20', 'TEEN', 'AWS new user', 'Y', '2023-02-01 14:07:10'),
(150, '3c3b61b2-8e3c-4738-871e-038358db6e50', 'AA923032-140815-732', 'M', '19', '27', 'ADULT', 'AWS new user', 'Y', '2023-02-01 14:08:15'),
(151, 'd6bf5da3-d979-4837-9a47-7c04f39f8cec', 'AA923032-140825-593', 'M', '28', '38', 'ADULT', 'AWS new user', 'Y', '2023-02-01 14:08:25'),
(152, '27bfd58c-df35-4cc4-b280-7f7243398451', 'AA923032-141018-428', 'M', '23', '31', 'ADULT', 'AWS new user', 'Y', '2023-02-01 14:10:18'),
(153, '252a58be-994b-4af0-aa5b-3c3a77e3e8bf', 'AA923032-141028-759', 'M', '28', '38', 'ADULT', 'AWS new user', 'Y', '2023-02-01 14:10:28'),
(154, '262457bd-1033-4474-bb54-a95a9aabb3dc', 'AA923032-141339-605', 'M', '45', '53', 'MIDDLE AGE', 'AWS new user', 'Y', '2023-02-01 14:13:39'),
(155, '00de2045-e42b-4527-b50b-b376e27e0872', 'AA923032-141339-551', 'M', '33', '41', 'ADULT', 'AWS new user', 'Y', '2023-02-01 14:13:39'),
(156, '1ca1a026-e176-4c1e-9622-51fdcd2a854c', 'AA923032-141343-586', 'M', '27', '37', 'ADULT', 'AWS new user', 'Y', '2023-02-01 14:13:43'),
(157, '3acbdc31-acc2-439d-9f43-9b8574ba6d30', 'AA923032-142015-458', 'M', '31', '41', 'ADULT', 'AWS new user', 'Y', '2023-02-01 14:20:15'),
(158, 'd7e3bd86-76c6-4098-a910-6b438043371c', 'AA923032-144858-538', 'M', '34', '42', 'ADULT', 'AWS new user', 'Y', '2023-02-01 14:48:58'),
(159, '1905810b-5b90-43cd-9198-6c8e15848514', 'AA923032-150012-899', 'M', '22', '30', 'ADULT', 'AWS new user', 'Y', '2023-02-01 15:00:12'),
(160, '70eb5d1d-6a2c-44e2-a772-317232f61a0a', 'AA923032-151149-540', 'F', '6', '16', 'KIDS', 'AWS new user', 'Y', '2023-02-01 15:11:49'),
(161, 'b91e98e5-1995-4548-a201-ecf2e326a5cb', 'AA923032-151221-825', 'F', '14', '22', 'TEEN', 'AWS new user', 'Y', '2023-02-01 15:12:21'),
(162, 'a5758f44-0927-4fda-95aa-f35afb7ab7a9', 'AA923032-152535-2', 'M', '27', '37', 'ADULT', 'AWS new user', 'Y', '2023-02-01 15:25:35'),
(163, '4ed2dbdf-4722-4655-8878-e190fc260f70', 'AA923032-152912-154', 'O', '38', '46', 'MIDDLE AGE', 'AWS new user', 'Y', '2023-02-01 15:29:12'),
(164, '970ff13c-7c71-44c7-b5d0-8e153f807f84', 'AA923032-160401-820', 'M', '22', '30', 'ADULT', 'AWS new user', 'Y', '2023-02-01 16:04:01'),
(165, '263559fd-ec4c-49c4-80b8-c22d735064e4', 'AA923032-163406-204', 'M', '23', '31', 'ADULT', 'AWS new user', 'Y', '2023-02-01 16:34:06'),
(166, 'f903a5a2-16e2-4dc3-971b-3194a54f4918', 'AA923032-163614-846', 'F', '16', '22', 'TEEN', 'AWS new user', 'Y', '2023-02-01 16:36:14'),
(167, 'da68ee0b-fa60-4852-b2cb-d679d7d4d0cc', 'AA923032-180435-942', 'M', '26', '36', 'ADULT', 'AWS new user', 'Y', '2023-02-01 18:04:35'),
(168, 'e0b682e7-dc77-4542-90b4-a36f9cc9d91e', 'AA923032-182958-142', 'F', '18', '24', 'ADULT', 'AWS new user', 'Y', '2023-02-01 18:29:58'),
(169, '41f7a730-4694-46f5-b6ea-4dd7da2f36cb', 'AA123191-104422-887', 'F', '18', '24', 'ADULT', 'AWS new user', 'Y', '2023-07-10 10:44:22'),
(170, '35277aef-f356-4619-bccd-f73dfaa24771', 'AA123207-132705-385', 'F', '27', '37', 'ADULT', 'AWS new user', 'Y', '2023-07-26 13:27:05'),
(171, '0b24d184-f12e-4a66-b266-6d26295baae9', 'AA124142-165847-716', 'M', '24', '34', 'ADULT', 'AWS new user', 'Y', '2024-05-21 16:58:47');

-- --------------------------------------------------------

--
-- Table structure for table `url_status`
--

CREATE TABLE `url_status` (
  `url_id` int(11) NOT NULL,
  `url_name` varchar(50) NOT NULL,
  `url_status` char(1) NOT NULL,
  `url_entry_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `url_status`
--

INSERT INTO `url_status` (`url_id`, `url_name`, `url_status`, `url_entry_date`) VALUES
(1, 'https://yj360.in/yjf/entry1', 'Y', '2023-01-30 15:47:00'),
(2, 'https://yj360.in/yjf/entry2', 'Y', '2023-01-30 15:47:00'),
(3, 'https://yj360.in/yjf/entry3', 'Y', '2023-01-30 15:47:00'),
(4, 'https://yj360.in/yjf/entry4', 'Y', '2023-01-30 15:47:00'),
(5, 'https://yj360.in/yjf/entry', 'Y', '2023-01-30 15:47:00');

-- --------------------------------------------------------

--
-- Table structure for table `user_log`
--

CREATE TABLE `user_log` (
  `user_log_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `ip_address` varchar(50) DEFAULT NULL,
  `login_date` date NOT NULL,
  `login_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `logout_time` timestamp NULL DEFAULT '0000-00-00 00:00:00',
  `user_log_status` char(1) NOT NULL,
  `user_log_entry_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `user_log`
--

INSERT INTO `user_log` (`user_log_id`, `user_id`, `ip_address`, `login_date`, `login_time`, `logout_time`, `user_log_status`, `user_log_entry_date`) VALUES
(1, 1, 'undefined', '2024-06-11', '2024-06-11 18:20:57', '2024-06-13 10:17:34', 'O', '2024-06-11 18:20:57'),
(2, 1, 'undefined', '2024-06-12', '2024-06-12 09:30:50', '2024-06-13 10:17:34', 'O', '2024-06-12 09:30:50'),
(3, 1, 'undefined', '2024-06-12', '2024-06-12 15:38:53', '2024-06-13 10:17:34', 'O', '2024-06-12 15:38:53'),
(4, 1, 'undefined', '2024-06-12', '2024-06-12 15:54:16', '2024-06-13 10:17:34', 'O', '2024-06-12 15:54:16'),
(5, 1, 'undefined', '2024-06-12', '2024-06-12 16:08:25', '2024-06-13 10:17:34', 'O', '2024-06-12 16:08:25'),
(6, 1, 'undefined', '2024-06-12', '2024-06-12 18:28:59', '2024-06-13 10:17:34', 'O', '2024-06-12 18:28:59'),
(7, 1, 'undefined', '2024-06-13', '2024-06-13 09:39:04', '2024-06-13 10:17:34', 'O', '2024-06-13 09:39:04'),
(8, 1, 'undefined', '2024-06-13', '2024-06-13 10:07:56', '2024-06-13 10:17:34', 'O', '2024-06-13 10:07:56'),
(9, 1, 'undefined', '2024-06-13', '2024-06-13 10:11:25', '2024-06-13 10:17:34', 'O', '2024-06-13 10:11:25'),
(10, 1, 'undefined', '2024-06-13', '2024-06-13 10:20:27', NULL, 'I', '2024-06-13 10:20:27'),
(11, 1, 'undefined', '2024-06-14', '2024-06-14 12:02:40', '2024-06-14 12:47:10', 'O', '2024-06-14 12:02:40'),
(12, 1, 'undefined', '2024-06-14', '2024-06-14 12:56:17', '2024-06-14 13:06:07', 'O', '2024-06-14 12:56:17'),
(13, 1, 'undefined', '2024-06-14', '2024-06-14 13:06:55', '2024-06-14 15:33:03', 'O', '2024-06-14 13:06:55'),
(14, 1, 'undefined', '2024-06-14', '2024-06-14 15:33:03', '2024-06-14 16:00:30', 'O', '2024-06-14 15:33:03'),
(15, 1, 'undefined', '2024-06-14', '2024-06-14 16:00:30', '2024-06-14 16:15:04', 'O', '2024-06-14 16:00:30'),
(16, 1, 'undefined', '2024-06-14', '2024-06-14 16:15:04', '2024-06-14 16:16:41', 'O', '2024-06-14 16:15:04'),
(17, 1, 'undefined', '2024-06-14', '2024-06-14 16:16:41', '2024-06-14 16:26:44', 'O', '2024-06-14 16:16:41'),
(18, 1, 'undefined', '2024-06-14', '2024-06-14 16:26:44', '2024-06-14 16:44:23', 'O', '2024-06-14 16:26:44'),
(19, 1, 'undefined', '2024-06-14', '2024-06-14 16:44:23', '2024-06-14 16:44:33', 'O', '2024-06-14 16:44:23'),
(20, 1, 'undefined', '2024-06-14', '2024-06-14 16:44:33', '2024-06-14 16:44:38', 'O', '2024-06-14 16:44:33'),
(21, 1, 'undefined', '2024-06-14', '2024-06-14 16:44:38', '2024-06-14 16:44:49', 'O', '2024-06-14 16:44:38'),
(22, 1, 'undefined', '2024-06-14', '2024-06-14 16:44:49', '2024-06-14 16:47:16', 'O', '2024-06-14 16:44:49'),
(23, 1, 'undefined', '2024-06-14', '2024-06-14 16:47:16', '2024-06-14 16:48:00', 'O', '2024-06-14 16:47:16'),
(24, 1, 'undefined', '2024-06-14', '2024-06-14 16:48:00', '2024-06-14 16:51:35', 'O', '2024-06-14 16:48:00'),
(25, 1, 'undefined', '2024-06-14', '2024-06-14 16:51:35', '2024-06-14 17:03:35', 'O', '2024-06-14 16:51:35'),
(26, 1, 'undefined', '2024-06-14', '2024-06-14 17:03:35', '2024-06-14 17:03:41', 'O', '2024-06-14 17:03:35'),
(27, 1, 'undefined', '2024-06-14', '2024-06-14 17:03:41', '2024-06-14 17:05:32', 'O', '2024-06-14 17:03:41'),
(28, 1, 'undefined', '2024-06-14', '2024-06-14 17:05:32', '2024-06-14 17:05:36', 'O', '2024-06-14 17:05:32'),
(29, 1, 'undefined', '2024-06-14', '2024-06-14 17:05:36', '2024-06-14 17:16:12', 'O', '2024-06-14 17:05:36'),
(30, 1, 'undefined', '2024-06-14', '2024-06-14 17:16:12', '2024-06-14 18:21:03', 'O', '2024-06-14 17:16:12'),
(31, 1, 'undefined', '2024-06-14', '2024-06-14 18:21:03', '2024-06-14 18:21:57', 'O', '2024-06-14 18:21:03'),
(32, 1, 'undefined', '2024-06-14', '2024-06-14 18:21:57', '2024-06-14 18:23:33', 'O', '2024-06-14 18:21:57'),
(33, 1, 'undefined', '2024-06-14', '2024-06-14 18:23:33', '2024-06-14 18:24:23', 'O', '2024-06-14 18:23:33'),
(34, 1, 'undefined', '2024-06-14', '2024-06-14 18:24:23', '2024-06-14 18:32:18', 'O', '2024-06-14 18:24:23'),
(35, 1, 'undefined', '2024-06-14', '2024-06-14 18:32:18', '2024-06-14 18:34:33', 'O', '2024-06-14 18:32:18'),
(36, 1, 'undefined', '2024-06-14', '2024-06-14 18:34:33', '2024-06-14 18:37:53', 'O', '2024-06-14 18:34:33'),
(37, 1, 'undefined', '2024-06-14', '2024-06-14 18:37:53', '2024-06-14 18:40:45', 'O', '2024-06-14 18:37:53'),
(38, 1, 'undefined', '2024-06-14', '2024-06-14 18:40:45', NULL, 'I', '2024-06-14 18:40:45'),
(39, 1, 'undefined', '2024-06-15', '2024-06-15 10:01:01', '2024-06-15 10:36:53', 'O', '2024-06-15 10:01:01'),
(40, 1, 'undefined', '2024-06-15', '2024-06-15 10:36:53', NULL, 'I', '2024-06-15 10:36:53');

-- --------------------------------------------------------

--
-- Table structure for table `user_management`
--

CREATE TABLE `user_management` (
  `user_id` int(11) NOT NULL,
  `user_master_id` int(11) NOT NULL,
  `parent_id` int(11) NOT NULL,
  `user_name` varchar(30) NOT NULL,
  `api_key` varchar(30) DEFAULT NULL,
  `login_id` varchar(30) NOT NULL,
  `login_password` varchar(50) NOT NULL,
  `user_email` varchar(50) DEFAULT NULL,
  `user_mobile` varchar(10) DEFAULT NULL,
  `usr_mgt_status` char(1) NOT NULL,
  `usr_mgt_entry_date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `user_bearer_token` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user_management`
--

INSERT INTO `user_management` (`user_id`, `user_master_id`, `parent_id`, `user_name`, `api_key`, `login_id`, `login_password`, `user_email`, `user_mobile`, `usr_mgt_status`, `usr_mgt_entry_date`, `user_bearer_token`) VALUES
(1, 1, 1, 'celebdigital', 'AA1DE999B6B65D2', 'celebdigital', '6a7aeb15b637d682e624561e1c9bbc45', 'arun@yeejai.com', '8888888888', 'Y', '2024-06-15 10:36:53', 'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VybmFtZSI6ImNlbGViZGlnaXRhbCIsInVzZXJfcGFzc3dvcmQiOiJZanQxMjMkJCIsImlhdCI6MTcxODQyODAxMywiZXhwIjoxNzE5MDMyODEzfQ.E3WEuUVXs__Zg3bewT6rCPBHwW_y6O_vHl64qOHyi4E');

-- --------------------------------------------------------

--
-- Table structure for table `user_management10`
--

CREATE TABLE `user_management10` (
  `user_id` int(11) NOT NULL,
  `user_master_id` int(11) NOT NULL,
  `parent_id` int(11) NOT NULL,
  `user_name` varchar(30) NOT NULL,
  `api_key` varchar(30) DEFAULT NULL,
  `login_id` varchar(30) NOT NULL,
  `login_password` varchar(50) NOT NULL,
  `user_email` varchar(50) DEFAULT NULL,
  `user_mobile` varchar(10) DEFAULT NULL,
  `usr_mgt_status` char(1) NOT NULL,
  `usr_mgt_entry_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `bearer_token` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci ROW_FORMAT=COMPACT;

--
-- Dumping data for table `user_management10`
--

INSERT INTO `user_management10` (`user_id`, `user_master_id`, `parent_id`, `user_name`, `api_key`, `login_id`, `login_password`, `user_email`, `user_mobile`, `usr_mgt_status`, `usr_mgt_entry_date`, `bearer_token`) VALUES
(1, 1, 1, 'celebdigital', 'AA1DE999B6B65D2', 'celebdigital', '6a7aeb15b637d682e624561e1c9bbc45', 'arun@yeejai.com', '8888888888', 'Y', '2021-12-30 17:22:20', 'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VybmFtZSI6ImNlbGViZGlnaXRhbCIsInVzZXJfcGFzc3dvcmQiOiJZanRAMTIzIyIsImlhdCI6MTcxODE4ODcwNSwiZXhwIjoxNzE4NzkzNTA1fQ.tgu_0EzcjrvQviQjxy7MkgVI_wVt8MiJk0eAe8XKEfo');

-- --------------------------------------------------------

--
-- Table structure for table `user_master`
--

CREATE TABLE `user_master` (
  `user_master_id` int(11) NOT NULL,
  `user_type` varchar(15) NOT NULL,
  `user_title` varchar(15) NOT NULL,
  `user_master_status` char(1) NOT NULL,
  `um_entry_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `user_master`
--

INSERT INTO `user_master` (`user_master_id`, `user_type`, `user_title`, `user_master_status`, `um_entry_date`) VALUES
(1, 'Super Admin', 'Super Admin', 'Y', '2021-12-14 07:31:00'),
(2, 'Visitor', 'Visitor', 'Y', '2021-12-14 07:31:04');

-- --------------------------------------------------------

--
-- Table structure for table `visitor_list`
--

CREATE TABLE `visitor_list` (
  `visitor_list_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  `customer_id` int(11) DEFAULT NULL,
  `camera_id` int(11) NOT NULL,
  `visitor_gender` char(1) DEFAULT NULL,
  `min_age` varchar(10) DEFAULT NULL,
  `max_age` varchar(10) DEFAULT NULL,
  `age_category` varchar(10) DEFAULT NULL,
  `aws_faceid` varchar(50) DEFAULT NULL,
  `visitor_id` varchar(25) DEFAULT NULL,
  `visitor_list_status` char(1) NOT NULL,
  `visitor_list_entdate` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `visitor_list`
--

INSERT INTO `visitor_list` (`visitor_list_id`, `store_id`, `customer_id`, `camera_id`, `visitor_gender`, `min_age`, `max_age`, `age_category`, `aws_faceid`, `visitor_id`, `visitor_list_status`, `visitor_list_entdate`) VALUES
(11, 1, 1, 11, 'F', '18', '20', 'ADULT', 'djhvbdlvjldhdjhbhuevikdu', 'cdjjvvjdbhlrhf', 'Y', '2024-06-14 09:23:12');

-- --------------------------------------------------------

--
-- Table structure for table `visitor_list_runtime`
--

CREATE TABLE `visitor_list_runtime` (
  `vl_runtime_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  `camera_id` int(11) NOT NULL,
  `visitor_gender` varchar(15) DEFAULT NULL,
  `visitor_gender_confidence` float NOT NULL,
  `min_age` varchar(10) DEFAULT NULL,
  `max_age` varchar(10) DEFAULT NULL,
  `aws_faceid` varchar(50) DEFAULT NULL,
  `visitor_list_status` char(1) NOT NULL,
  `visitor_list_entdate` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `api_log`
--
ALTER TABLE `api_log`
  ADD PRIMARY KEY (`api_log_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `api_log1`
--
ALTER TABLE `api_log1`
  ADD PRIMARY KEY (`log_id`);

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
-- Indexes for table `user_log`
--
ALTER TABLE `user_log`
  ADD PRIMARY KEY (`user_log_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `user_log_id` (`user_log_id`,`user_id`);

--
-- Indexes for table `user_management`
--
ALTER TABLE `user_management`
  ADD PRIMARY KEY (`user_id`);

--
-- Indexes for table `user_management10`
--
ALTER TABLE `user_management10`
  ADD PRIMARY KEY (`user_id`),
  ADD KEY `user_master_id` (`user_master_id`,`parent_id`);

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
  ADD KEY `store_id_2` (`store_id`,`customer_id`,`camera_id`),
  ADD KEY `visitor_list_id` (`visitor_list_id`,`visitor_list_entdate`),
  ADD KEY `visitor_list_id_2` (`visitor_list_id`,`store_id`,`customer_id`,`camera_id`,`visitor_id`,`visitor_list_entdate`);

--
-- Indexes for table `visitor_list_runtime`
--
ALTER TABLE `visitor_list_runtime`
  ADD PRIMARY KEY (`vl_runtime_id`),
  ADD KEY `store_id` (`store_id`,`camera_id`),
  ADD KEY `vl_runtime_id` (`vl_runtime_id`,`store_id`,`camera_id`,`aws_faceid`,`visitor_list_entdate`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `api_log`
--
ALTER TABLE `api_log`
  MODIFY `api_log_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=154;

--
-- AUTO_INCREMENT for table `api_log1`
--
ALTER TABLE `api_log1`
  MODIFY `log_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `camera_details`
--
ALTER TABLE `camera_details`
  MODIFY `camera_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `customer_interest`
--
ALTER TABLE `customer_interest`
  MODIFY `customer_interest_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `customer_management`
--
ALTER TABLE `customer_management`
  MODIFY `customer_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT for table `interest_list`
--
ALTER TABLE `interest_list`
  MODIFY `visitor_interest_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `sms_updates`
--
ALTER TABLE `sms_updates`
  MODIFY `sms_update_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `store_details`
--
ALTER TABLE `store_details`
  MODIFY `store_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `unique_visitors`
--
ALTER TABLE `unique_visitors`
  MODIFY `unique_visitors_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=172;

--
-- AUTO_INCREMENT for table `url_status`
--
ALTER TABLE `url_status`
  MODIFY `url_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `user_log`
--
ALTER TABLE `user_log`
  MODIFY `user_log_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT for table `user_management`
--
ALTER TABLE `user_management`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `user_management10`
--
ALTER TABLE `user_management10`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `user_master`
--
ALTER TABLE `user_master`
  MODIFY `user_master_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `visitor_list`
--
ALTER TABLE `visitor_list`
  MODIFY `visitor_list_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=331;

--
-- AUTO_INCREMENT for table `visitor_list_runtime`
--
ALTER TABLE `visitor_list_runtime`
  MODIFY `vl_runtime_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=996;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

-- phpMyAdmin SQL Dump
-- version 5.1.1deb5ubuntu1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Aug 20, 2026 at 06:47 AM
-- Server version: 8.0.46-0ubuntu0.22.04.3
-- PHP Version: 8.3.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `fox_payroll`
--

-- --------------------------------------------------------

--
-- Table structure for table `agents`
--

CREATE TABLE `agents` (
  `agent_id` char(4) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `first_name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone_number` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `birth_day` date DEFAULT NULL,
  `status` tinyint NOT NULL,
  `role_id` char(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `did` char(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `seat_id` char(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `skill_id` char(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `gender` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `performance` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `agents`
--

INSERT INTO `agents` (`agent_id`, `user_id`, `first_name`, `last_name`, `phone_number`, `birth_day`, `status`, `role_id`, `did`, `seat_id`, `skill_id`, `gender`, `address`, `description`, `performance`, `created_at`, `updated_at`) VALUES
('3639', 89, 'md', 'test', NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-07-29 12:48:27', '2026-07-29 12:48:27');

-- --------------------------------------------------------

--
-- Table structure for table `announcements`
--

CREATE TABLE `announcements` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `category` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `branch_id` bigint UNSIGNED DEFAULT NULL,
  `department_id` bigint UNSIGNED DEFAULT NULL,
  `audience` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `attendance_policies`
--

CREATE TABLE `attendance_policies` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `late_after_minutes` int UNSIGNED NOT NULL DEFAULT '0',
  `working_hours` decimal(4,2) NOT NULL DEFAULT '8.00',
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `attendance_policies`
--

INSERT INTO `attendance_policies` (`id`, `name`, `code`, `late_after_minutes`, `working_hours`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Standard Policy', 'STD', 0, '8.00', 1, '2026-08-12 07:17:24', '2026-08-12 07:17:24');

-- --------------------------------------------------------

--
-- Table structure for table `award_types`
--

CREATE TABLE `award_types` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `bank_info`
--

CREATE TABLE `bank_info` (
  `id` bigint UNSIGNED NOT NULL,
  `lead_id` bigint UNSIGNED NOT NULL,
  `form_id` char(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_by` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `location` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `status` enum('active','inactive') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `logo_upload` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `total_amount` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `bank_info`
--

INSERT INTO `bank_info` (`id`, `lead_id`, `form_id`, `created_by`, `name`, `location`, `status`, `logo_upload`, `start_date`, `created_at`, `updated_at`, `total_amount`) VALUES
(1, 403, '1051895449', 'shimla1236', 'Rafi Khan', 'banani', 'active', 'ASH1825037M_SDA_REPORT (1)-1_1730789615.pdf', '2024-11-06', '2024-11-05 06:53:35', '2024-11-05 06:54:31', NULL),
(2, 403, '1051895449', 'shimla1236', 'sadman', 'kalshi,dhaka', 'inactive', 'scan_659_report_1730789732.html', '2024-12-03', '2024-11-05 06:55:32', '2024-11-05 06:55:32', NULL),
(3, 403, '1051895449', 'shimla1236', 'Kasfiye', NULL, 'inactive', 'andi-rieger-vfEqA8sKe6A-unsplash_1730358844_1730790026.jpg', NULL, '2024-11-05 06:58:51', '2024-11-05 07:00:26', NULL),
(4, 404, '1051895449', 'root', 'IFIC', 'dhaka', 'active', 'andi-rieger-vfEqA8sKe6A-unsplash_1730358844_1730790657.jpg', '2024-11-19', '2024-11-05 07:09:59', '2024-11-05 07:24:23', NULL),
(5, 404, '1051895449', 'shimla1236', 'UCB', 'Bahundhara', 'active', NULL, NULL, '2024-11-05 07:21:42', '2024-11-05 07:21:42', NULL),
(6, 411, '1051895449', 'root', 'EBL', 'Mirpur 12', 'active', 'andi-rieger-vfEqA8sKe6A-unsplash_1730358844_1730798599.jpg', '2024-11-06', '2024-11-05 09:23:19', '2024-11-05 10:02:42', NULL),
(7, 418, '1051895449', 'moni123', 'City Bank', 'banani', 'active', '', NULL, '2024-11-05 10:19:12', '2024-11-05 10:19:12', NULL),
(8, 430, '1051895449', 'kzprince', 'The city bank', 'Gulshan 2', 'active', 'Profile-Picture_1730870065.jpg', '2024-11-01', '2024-11-06 05:14:25', '2024-11-06 05:14:25', 0);

-- --------------------------------------------------------

--
-- Table structure for table `billing_address`
--

CREATE TABLE `billing_address` (
  `id` int NOT NULL,
  `user_id` int DEFAULT NULL,
  `session_id` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `first_name` varchar(70) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `last_name` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `company_name` varchar(30) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `email` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `mobile` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `city` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `state` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `zip` varchar(10) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `shipping_address` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `shipping_address_2` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Dumping data for table `billing_address`
--

INSERT INTO `billing_address` (`id`, `user_id`, `session_id`, `first_name`, `last_name`, `company_name`, `email`, `mobile`, `city`, `state`, `zip`, `shipping_address`, `shipping_address_2`, `created_at`, `updated_at`, `status`) VALUES
(16, NULL, 'ABCDEF1234', 'SHANGIDA', 'BINTE', 'Man Power', 'tamjidmahmud1518@gmail.com', '01717761611', 'Dhaka', 'Dhaka', '1201', 'Feni, Mastar para, Mohipal, Feni', 'Feni, Mastar para, Mohipal, Feni', '2024-12-14 19:41:41', '2024-12-14 19:41:41', 1),
(17, 80, NULL, 'Obaidul', 'Obaidul', 'Roads & Highway', NULL, '01919001122', 'Dhaka', 'Dhaka', '1200', 'Master para, Feni', NULL, '2024-12-29 23:31:43', '2024-12-29 23:31:43', 1),
(18, NULL, '2744779658736', 'uzzal', 'jakir', NULL, NULL, '01959994205', 'dfsda', 'dfgdsg', 'dfgdf', 'zigatola', NULL, '2026-07-04 12:12:47', '2026-07-04 12:12:47', 1),
(19, NULL, '2744779658736', 'uzzal', 'jakir', NULL, NULL, '01959994205', 'dfsda', 'dfgdsg', 'dfgdf', 'zigatola', NULL, '2026-07-04 12:15:00', '2026-07-04 12:15:00', 1),
(20, NULL, '3167295478638', 'Md jakir hosen uzzal', NULL, NULL, NULL, '01959994205', NULL, NULL, NULL, 'zigatola', NULL, '2026-07-04 12:27:41', '2026-07-04 12:27:41', 1),
(21, NULL, '8400725125403', 'ghgvbhjg', NULL, NULL, NULL, '01959994205', NULL, NULL, NULL, 'zigatola', NULL, '2026-07-04 13:20:55', '2026-07-04 13:20:55', 1),
(22, NULL, '8400725125403', 'Md jakir hosen uzzal', NULL, NULL, NULL, '01959994205', NULL, NULL, NULL, 'zigatola', NULL, '2026-07-04 13:22:31', '2026-07-04 13:22:31', 1),
(23, NULL, '8400725125403', 'Md jakir hosen uzzal', NULL, NULL, NULL, '01959994205', NULL, NULL, NULL, 'zigatola', NULL, '2026-07-04 13:48:18', '2026-07-04 13:48:18', 1),
(24, 83, NULL, 'jakir', NULL, NULL, NULL, '01959994205', NULL, NULL, NULL, 'zigatola', NULL, '2026-07-04 13:54:43', '2026-07-04 13:54:43', 1),
(25, NULL, '9477375682897', 'Md jakir hosen uzzal', NULL, NULL, NULL, '01959994205', NULL, NULL, NULL, 'zigatola', NULL, '2026-07-04 14:08:31', '2026-07-04 14:08:31', 1),
(26, 83, NULL, 'jakir', NULL, NULL, NULL, '01959994205', NULL, NULL, NULL, 'zigatola', NULL, '2026-07-04 14:15:53', '2026-07-04 14:15:53', 1),
(27, 82, NULL, 'Md jakir hosen uzzal', NULL, NULL, NULL, '01959994205', NULL, NULL, NULL, 'zigatola', NULL, '2026-07-14 07:48:00', '2026-07-14 07:48:00', 1),
(28, 82, NULL, 'Md jakir hosen 111', NULL, NULL, NULL, '01959994205', NULL, NULL, NULL, 'zigatola', NULL, '2026-07-14 08:07:24', '2026-07-18 10:37:41', 1),
(29, 82, NULL, 'Md jakir hosen uzzal', NULL, NULL, NULL, '01959994205', NULL, NULL, NULL, 'zigatola', NULL, '2026-07-14 13:33:20', '2026-07-14 13:33:20', 1),
(30, 89, NULL, 'sakib', NULL, NULL, NULL, '01304993998', NULL, NULL, NULL, 'zigatola', NULL, '2026-07-30 08:23:41', '2026-07-30 08:23:41', 1),
(31, 82, NULL, 'Jared', NULL, NULL, NULL, '01393456789', NULL, NULL, NULL, 'Reprehenderit quidem', NULL, '2026-07-30 12:30:02', '2026-07-30 12:30:02', 1),
(32, 82, NULL, 'Md jakir hosen uzzal', NULL, NULL, NULL, '01959994205', NULL, NULL, NULL, 'zigatola', NULL, '2026-08-01 13:53:50', '2026-08-01 13:53:50', 1),
(33, 82, NULL, 'sakib', NULL, NULL, NULL, '01304994998', NULL, NULL, NULL, 'fgfh fghghh dfgh', NULL, '2026-08-02 06:19:47', '2026-08-02 06:19:47', 1),
(34, 82, NULL, 'Md jakir hosen uzzal', NULL, NULL, NULL, '01959994205', NULL, NULL, NULL, 'zigatola', NULL, '2026-08-02 06:23:35', '2026-08-02 06:23:35', 1),
(35, 82, NULL, 'Md jakir hosen uzzal', NULL, NULL, NULL, '01959994205', NULL, NULL, NULL, 'zigatola', NULL, '2026-08-08 07:05:51', '2026-08-08 07:05:51', 1);

-- --------------------------------------------------------

--
-- Table structure for table `bloggers_category`
--

CREATE TABLE `bloggers_category` (
  `id` bigint UNSIGNED NOT NULL,
  `parent_id` char(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `category_name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `category_description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `category_image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `bloggers_category`
--

INSERT INTO `bloggers_category` (`id`, `parent_id`, `category_name`, `category_description`, `category_image`, `status`, `created_at`, `updated_at`) VALUES
(1, NULL, 'Music', 'This is a category description', 'tree-top-commercial-logo_1733720454.png', 1, '2024-12-08 22:56:47', '2024-12-08 23:00:54'),
(3, NULL, 'Health', NULL, '', 1, '2024-12-09 23:35:24', '2024-12-09 23:35:24'),
(4, NULL, 'Forest', NULL, '', 1, '2024-12-09 23:35:47', '2024-12-09 23:35:47'),
(5, NULL, 'Alohata', NULL, '', 1, '2024-12-21 16:12:17', '2024-12-21 16:12:17');

-- --------------------------------------------------------

--
-- Table structure for table `blogs`
--

CREATE TABLE `blogs` (
  `id` bigint UNSIGNED NOT NULL,
  `blog_category_id` int DEFAULT NULL,
  `blog_name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `blog_description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `blog_image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `branches`
--

CREATE TABLE `branches` (
  `id` bigint UNSIGNED NOT NULL,
  `state_id` int DEFAULT NULL,
  `city_id` int DEFAULT NULL,
  `branch_name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `branch_code` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `email` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `contact` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `branches`
--

INSERT INTO `branches` (`id`, `state_id`, `city_id`, `branch_name`, `branch_code`, `status`, `created_at`, `updated_at`, `email`, `contact`) VALUES
(1, NULL, NULL, 'Main Branch', 'MAIN', 1, '2026-08-12 07:17:24', '2026-08-12 07:17:24', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `brands`
--

CREATE TABLE `brands` (
  `id` int NOT NULL,
  `brand_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `brand_image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `brand_description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `brands`
--

INSERT INTO `brands` (`id`, `brand_name`, `brand_image`, `brand_description`, `status`, `created_at`, `updated_at`) VALUES
(10, 'self', '4672ea5f-22c9-44b7-bf02-1bf1278d6975.jpg', NULL, 1, '2026-07-25 11:03:57', '2026-07-25 11:03:57');

-- --------------------------------------------------------

--
-- Table structure for table `campaigns`
--

CREATE TABLE `campaigns` (
  `id` bigint UNSIGNED NOT NULL,
  `form_id` char(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email_template_id` int DEFAULT NULL,
  `sms_template_id` int DEFAULT NULL,
  `campaign_title` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `start_date` datetime DEFAULT NULL,
  `end_date` datetime DEFAULT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `campaign_type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `template_type` varchar(192) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `campaign_limit` int DEFAULT NULL,
  `campaign_service` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint NOT NULL,
  `promotion_id` bigint UNSIGNED DEFAULT NULL,
  `created_by` int UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `campaigns`
--

INSERT INTO `campaigns` (`id`, `form_id`, `email_template_id`, `sms_template_id`, `campaign_title`, `start_date`, `end_date`, `description`, `campaign_type`, `template_type`, `campaign_limit`, `campaign_service`, `status`, `promotion_id`, `created_by`, `created_at`, `updated_at`) VALUES
(24, '6820060189', 42, NULL, 'Demo Campaign', '2024-11-06 16:56:00', '2024-11-06 16:56:00', NULL, 'Content Marketing', 'Email', 2, NULL, 1, NULL, 1, '2024-11-06 10:57:02', '2024-11-06 10:57:02');

-- --------------------------------------------------------

--
-- Table structure for table `campaign_data`
--

CREATE TABLE `campaign_data` (
  `id` bigint UNSIGNED NOT NULL,
  `campaign_id` bigint DEFAULT NULL,
  `phone` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_template_id` int DEFAULT NULL,
  `sms_template_id` int DEFAULT NULL,
  `status` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `careers`
--

CREATE TABLE `careers` (
  `id` bigint UNSIGNED NOT NULL,
  `career_category_id` int DEFAULT NULL,
  `job_title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `job_description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `job_image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `careers`
--

INSERT INTO `careers` (`id`, `career_category_id`, `job_title`, `job_description`, `job_image`, `status`, `created_at`, `updated_at`) VALUES
(1, NULL, 'Full-Stack Developer & Product Manager', '<div class=\"col-sm-12\" style=\"--c1: #d1fbd0; --c2: #25c220; --c3: #008020; position: relative; min-height: 1px; padding-right: 15px; padding-left: 15px; float: left; width: 916.8px; color: rgb(51, 51, 51); font-family: Inter, &quot;Noto Sans Bengali UI&quot;, ui-icon, sans-serif; font-size: 14px;\"><h3 class=\"sectitle\" id=\"sum\" style=\"margin-bottom: 10px; --c1: #d1fbd0; --c2: #25c220; --c3: #008020; line-height: 1.5; color: rgb(179, 45, 125); font-size: 16px !important;\">Summary</h3><h4 class=\"sectxt\" id=\"req\" style=\"margin-bottom: 10px; --c1: #d1fbd0; --c2: #25c220; --c3: #008020; font-family: inherit; line-height: 1.1; color: rgb(179, 45, 125); font-size: 16px !important;\"><ul class=\"summery__items\" style=\"--c1: #d1fbd0; --c2: #25c220; --c3: #008020; padding-left: 0px; list-style: none; display: grid; grid-template-columns: 1fr 1fr 1fr; column-gap: 15px; color: rgb(51, 51, 51); font-size: 14px; margin-bottom: 0px !important;\"><li style=\"--c1: #d1fbd0; --c2: #25c220; --c3: #008020; line-height: 24px;\"><span style=\"font-weight: 400;\">Vacancy: </span>12</li><li style=\"font-weight: 400; --c1: #d1fbd0; --c2: #25c220; --c3: #008020; line-height: 24px;\">Age:&nbsp;<span class=\"txtbold\" style=\"--c1: #d1fbd0; --c2: #25c220; --c3: #008020; font-weight: 600;\">at least 18 years</span></li><li style=\"font-weight: 400; --c1: #d1fbd0; --c2: #25c220; --c3: #008020; line-height: 24px;\">Location:&nbsp;<span class=\"txtbold\" style=\"--c1: #d1fbd0; --c2: #25c220; --c3: #008020; font-weight: 600;\">Bangladesh</span></li><li style=\"font-weight: 400; --c1: #d1fbd0; --c2: #25c220; --c3: #008020; line-height: 24px;\">Salary:&nbsp;<span class=\"txtbold\" style=\"--c1: #d1fbd0; --c2: #25c220; --c3: #008020; font-weight: 600;\">Tk. 15000 - 25000 (Monthly)</span></li><li style=\"font-weight: 400; --c1: #d1fbd0; --c2: #25c220; --c3: #008020; line-height: 24px;\">Experience:&nbsp;<span class=\"txtbold\" style=\"--c1: #d1fbd0; --c2: #25c220; --c3: #008020; font-weight: 600;\">1 to 5 years</span></li><li style=\"font-weight: 400; --c1: #d1fbd0; --c2: #25c220; --c3: #008020; line-height: 24px;\">Published:&nbsp;<span class=\"txtbold\" style=\"--c1: #d1fbd0; --c2: #25c220; --c3: #008020; font-weight: 600;\">23 Dec 2024</span></li></ul></h4><h4 class=\"sectxt\" id=\"req\" style=\"margin-bottom: 10px; --c1: #d1fbd0; --c2: #25c220; --c3: #008020; font-family: inherit; line-height: 1.1; color: rgb(179, 45, 125); font-size: 16px !important;\"><br></h4><h4 class=\"sectxt\" id=\"req\" style=\"margin-bottom: 10px; --c1: #d1fbd0; --c2: #25c220; --c3: #008020; font-family: inherit; line-height: 1.1; color: rgb(179, 45, 125); font-size: 16px !important;\">Requirements</h4></div><div class=\"col-sm-12 mb-3\" style=\"--c1: #d1fbd0; --c2: #25c220; --c3: #008020; position: relative; min-height: 1px; padding-right: 15px; padding-left: 15px; float: left; width: 916.8px; color: rgb(51, 51, 51); font-family: Inter, &quot;Noto Sans Bengali UI&quot;, ui-icon, sans-serif; font-size: 14px; margin-bottom: 1rem !important;\"><h5 class=\"subheading\" id=\"req\" style=\"margin-bottom: 6px; --c1: #d1fbd0; --c2: #25c220; --c3: #008020; font-family: inherit; line-height: 1.1; color: rgb(51, 51, 51); font-size: 14px;\">Education</h5><ul style=\"--c1: #d1fbd0; --c2: #25c220; --c3: #008020; padding-left: 0px; margin-bottom: 0px !important; margin-left: 24px !important;\"><li style=\"--c1: #d1fbd0; --c2: #25c220; --c3: #008020; line-height: 24px; padding-bottom: 5px;\">Bachelor in Engineering (BEngg) in Computing &amp; Information System</li></ul></div><div class=\"col-sm-12 mb-3\" style=\"--c1: #d1fbd0; --c2: #25c220; --c3: #008020; position: relative; min-height: 1px; padding-right: 15px; padding-left: 15px; float: left; width: 916.8px; color: rgb(51, 51, 51); font-family: Inter, &quot;Noto Sans Bengali UI&quot;, ui-icon, sans-serif; font-size: 14px; margin-bottom: 1rem !important;\"><h5 class=\"subheading\" id=\"req\" style=\"margin-bottom: 6px; --c1: #d1fbd0; --c2: #25c220; --c3: #008020; font-family: inherit; line-height: 1.1; color: rgb(51, 51, 51); font-size: 14px;\">Experience</h5><ul style=\"--c1: #d1fbd0; --c2: #25c220; --c3: #008020; padding-left: 0px; margin-bottom: 0px !important; margin-left: 24px !important;\"><li style=\"--c1: #d1fbd0; --c2: #25c220; --c3: #008020; line-height: 24px; padding-bottom: 5px;\">1 to 5 years</li></ul></div><div class=\"col-sm-12\" style=\"--c1: #d1fbd0; --c2: #25c220; --c3: #008020; position: relative; min-height: 1px; padding-right: 15px; padding-left: 15px; float: left; width: 916.8px; color: rgb(51, 51, 51); font-family: Inter, &quot;Noto Sans Bengali UI&quot;, ui-icon, sans-serif; font-size: 14px;\"><h5 class=\"subheading\" id=\"req\" style=\"margin-bottom: 6px; --c1: #d1fbd0; --c2: #25c220; --c3: #008020; font-family: inherit; line-height: 1.1; color: rgb(51, 51, 51); font-size: 14px;\">Additional Requirements</h5><ul style=\"--c1: #d1fbd0; --c2: #25c220; --c3: #008020; padding-left: 0px; margin-bottom: 0px !important; margin-left: 24px !important;\"><li style=\"--c1: #d1fbd0; --c2: #25c220; --c3: #008020; line-height: 24px; padding-bottom: 5px;\">Age at least 18 years</li></ul><hr style=\"box-sizing: content-box; --c1: #d1fbd0; --c2: #25c220; --c3: #008020; height: 0px; border-top: 1px solid rgb(238, 238, 238); margin-top: 10px !important; margin-bottom: 10px !important;\"></div><div class=\"col-sm-12\" style=\"--c1: #d1fbd0; --c2: #25c220; --c3: #008020; position: relative; min-height: 1px; padding-right: 15px; padding-left: 15px; float: left; width: 916.8px; color: rgb(51, 51, 51); font-family: Inter, &quot;Noto Sans Bengali UI&quot;, ui-icon, sans-serif; font-size: 14px;\"><h4 class=\"sectxt\" id=\"job_resp\" style=\"margin-bottom: 10px; --c1: #d1fbd0; --c2: #25c220; --c3: #008020; font-family: inherit; line-height: 1.1; color: rgb(179, 45, 125); font-size: 16px !important;\">Responsibilities &amp; Context</h4><p style=\"margin-bottom: 10px; --c1: #d1fbd0; --c2: #25c220; --c3: #008020; line-height: 24px;\">Job Title: Full-Stack Developer &amp; Product Manager</p><p style=\"margin-bottom: 10px; --c1: #d1fbd0; --c2: #25c220; --c3: #008020; line-height: 24px;\">Location: Remote (Flexible) - Startup</p><p style=\"margin-bottom: 10px; --c1: #d1fbd0; --c2: #25c220; --c3: #008020; line-height: 24px;\">Salary: 15k-25k BDT(space to grow)</p><p style=\"margin-bottom: 10px; --c1: #d1fbd0; --c2: #25c220; --c3: #008020; line-height: 24px;\"><span style=\"--c1: #d1fbd0; --c2: #25c220; --c3: #008020; font-weight: 700;\">Freshers encouraged to apply, please add your updated portfolio.</span></p><p style=\"margin-bottom: 10px; --c1: #d1fbd0; --c2: #25c220; --c3: #008020; line-height: 24px;\"><span style=\"--c1: #d1fbd0; --c2: #25c220; --c3: #008020; font-weight: 700;\">Email: mahmudtechie@gmail.com</span></p><p style=\"margin-bottom: 10px; --c1: #d1fbd0; --c2: #25c220; --c3: #008020; line-height: 24px;\">Company: IT startup company based in Toronto (Canada)</p><p style=\"margin-bottom: 10px; --c1: #d1fbd0; --c2: #25c220; --c3: #008020; line-height: 24px;\">About Pawfect: Pawfect is a new platform designed to connect dog and cat owners with reliable, trusted pet sitters. Our mission is to provide a seamless and safe pet-sitting experience, making it easier for pet owners to find the right caregiver for their furry friends. We’re looking for a dynamic and driven individual to help bring this vision to life and take the product from concept to launch.</p><p style=\"margin-bottom: 10px; --c1: #d1fbd0; --c2: #25c220; --c3: #008020; line-height: 24px;\">Job Description: We are seeking a Full-Stack Developer with strong product management experience to help us design, develop, and launch our innovative pet-sitting platform. You will be responsible for both the technical and strategic aspects of the product, ensuring a smooth user experience while addressing key market needs. This is an exciting opportunity for someone with a passion for technology, product development, and pets!</p><p style=\"margin-bottom: 10px; --c1: #d1fbd0; --c2: #25c220; --c3: #008020; line-height: 24px;\">Responsibilities: Product Development: Lead the design and development of a scalable, user-friendly web and mobile platform (React, Node.js, PostgreSQL, AWS, etc.).</p><p style=\"margin-bottom: 10px; --c1: #d1fbd0; --c2: #25c220; --c3: #008020; line-height: 24px;\">Product Strategy: Work closely with the founders to define the product vision, roadmaps, and key features based on market research and customer feedback.</p><p style=\"margin-bottom: 10px; --c1: #d1fbd0; --c2: #25c220; --c3: #008020; line-height: 24px;\">User Experience: Create intuitive interfaces and seamless user experiences that resonate with pet owners and sitters. API Integrations: Implement necessary third-party APIs for payments, location tracking, and messaging. Market Research: Continuously monitor the pet care industry, analyze competitors (e.g., Rover, Wag), and suggest new features to differentiate Pawfect.</p><p style=\"margin-bottom: 10px; --c1: #d1fbd0; --c2: #25c220; --c3: #008020; line-height: 24px;\">Testing &amp; Iteration: Oversee testing phases to ensure a bug-free launch, iterating on feedback and ensuring the product meets both user needs and business goals. Launch &amp; Marketing: Help coordinate marketing strategies and product launch plans, ensuring a smooth go-to-market approach.</p><p style=\"margin-bottom: 10px; --c1: #d1fbd0; --c2: #25c220; --c3: #008020; line-height: 24px;\">Requirements: Proven experience as a Full-Stack Developer, with expertise in both front-end and back-end technologies (React, Node.js, MongoDB, PostgreSQL, or similar). Strong understanding of product management principles, including product lifecycle, roadmap planning, and user research. Familiarity with building and launching consumer-facing platforms and mobile applications. Excellent problem-solving skills and attention to detail. Ability to work independently in a fast-paced startup environment. Passion for animals and pet care services is a plus.</p><p style=\"margin-bottom: 10px; --c1: #d1fbd0; --c2: #25c220; --c3: #008020; line-height: 24px;\">Preferred Qualifications: Experience working in the pet care industry or on related platforms (dog-walking, pet-sitting, etc.). Familiarity with agile methodologies (Scrum, Kanban). Knowledge of cloud platforms (AWS, Google Cloud). Experience in UI/UX design and prototyping tools (Figma, Sketch, etc.). Benefits: Flexible work hours and remote work options. Opportunity to be part of an early-stage startup and make a direct impact on product development. Competitive compensation and equity options.</p><p style=\"margin-bottom: 10px; --c1: #d1fbd0; --c2: #25c220; --c3: #008020; line-height: 24px;\">How to Apply: Please submit your resume, portfolio, and a brief cover letter explaining why you’re passionate about building Pawfect and how your skills align with this role at mahmudtechie@gmail.com</p><hr style=\"box-sizing: content-box; --c1: #d1fbd0; --c2: #25c220; --c3: #008020; height: 0px; border-top: 1px solid rgb(238, 238, 238); margin-top: 10px !important; margin-bottom: 10px !important;\"></div><div class=\"col-sm-12 mb-3\" style=\"--c1: #d1fbd0; --c2: #25c220; --c3: #008020; position: relative; min-height: 1px; padding-right: 15px; padding-left: 15px; float: left; width: 916.8px; color: rgb(51, 51, 51); font-family: Inter, &quot;Noto Sans Bengali UI&quot;, ui-icon, sans-serif; font-size: 14px; margin-bottom: 1rem !important;\"><h4 class=\"sectxt\" id=\"benefits\" style=\"margin-bottom: 10px; --c1: #d1fbd0; --c2: #25c220; --c3: #008020; font-family: inherit; line-height: 1.1; color: rgb(179, 45, 125); font-size: 16px !important;\">Compensation &amp; Other Benefits</h4><ul style=\"--c1: #d1fbd0; --c2: #25c220; --c3: #008020; padding-left: 0px; margin-bottom: 0px !important; margin-left: 24px !important;\"><li style=\"--c1: #d1fbd0; --c2: #25c220; --c3: #008020; line-height: 24px; padding-bottom: 5px;\">Performance bonus</li></ul><p style=\"margin-bottom: 10px; --c1: #d1fbd0; --c2: #25c220; --c3: #008020; line-height: 24px;\">Profit sharing for the right candidate who brings growth and business for the company.</p></div><div class=\"col-sm-12 mb-3\" style=\"--c1: #d1fbd0; --c2: #25c220; --c3: #008020; position: relative; min-height: 1px; padding-right: 15px; padding-left: 15px; float: left; width: 916.8px; color: rgb(51, 51, 51); font-family: Inter, &quot;Noto Sans Bengali UI&quot;, ui-icon, sans-serif; font-size: 14px; margin-bottom: 1rem !important;\"><h4 class=\"sectxt\" style=\"margin-bottom: 10px; --c1: #d1fbd0; --c2: #25c220; --c3: #008020; font-family: inherit; line-height: 1.1; color: rgb(179, 45, 125); font-size: 16px !important;\">Workplace</h4><p style=\"margin-bottom: 10px; --c1: #d1fbd0; --c2: #25c220; --c3: #008020; line-height: 24px;\">Work from home, Work at office</p></div><div class=\"col-sm-12 mb-3\" style=\"--c1: #d1fbd0; --c2: #25c220; --c3: #008020; position: relative; min-height: 1px; padding-right: 15px; padding-left: 15px; float: left; width: 916.8px; color: rgb(51, 51, 51); font-family: Inter, &quot;Noto Sans Bengali UI&quot;, ui-icon, sans-serif; font-size: 14px; margin-bottom: 1rem !important;\"><h4 class=\"sectxt\" style=\"margin-bottom: 10px; --c1: #d1fbd0; --c2: #25c220; --c3: #008020; font-family: inherit; line-height: 1.1; color: rgb(179, 45, 125); font-size: 16px !important;\">Employment Status</h4><p style=\"margin-bottom: 10px; --c1: #d1fbd0; --c2: #25c220; --c3: #008020; line-height: 24px;\">Full Time</p></div><div class=\"col-sm-12 mb-3\" style=\"--c1: #d1fbd0; --c2: #25c220; --c3: #008020; position: relative; min-height: 1px; padding-right: 15px; padding-left: 15px; float: left; width: 916.8px; color: rgb(51, 51, 51); font-family: Inter, &quot;Noto Sans Bengali UI&quot;, ui-icon, sans-serif; font-size: 14px; margin-bottom: 1rem !important;\"><h4 class=\"sectxt\" style=\"margin-bottom: 10px; --c1: #d1fbd0; --c2: #25c220; --c3: #008020; font-family: inherit; line-height: 1.1; color: rgb(179, 45, 125); font-size: 16px !important;\">Job Location</h4><p style=\"margin-bottom: 10px; --c1: #d1fbd0; --c2: #25c220; --c3: #008020; line-height: 24px;\">Bangladesh</p></div>', 'istockphoto-1418703197-612x612_1734978724.jpg', 1, '2024-12-24 00:54:13', '2024-12-24 00:54:13');

-- --------------------------------------------------------

--
-- Table structure for table `carts`
--

CREATE TABLE `carts` (
  `id` int NOT NULL,
  `user_id` int DEFAULT NULL,
  `session_id` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `product_id` int NOT NULL,
  `product_image` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `product_name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `product_color` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `product_size` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `unit_price` decimal(10,2) DEFAULT NULL,
  `quantity` int DEFAULT NULL,
  `total_price` decimal(10,2) DEFAULT NULL,
  `discount` decimal(10,2) DEFAULT NULL,
  `final_price` decimal(10,2) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Dumping data for table `carts`
--

INSERT INTO `carts` (`id`, `user_id`, `session_id`, `product_id`, `product_image`, `product_name`, `product_color`, `product_size`, `unit_price`, `quantity`, `total_price`, `discount`, `final_price`, `created_at`, `updated_at`) VALUES
(23, NULL, '1896601834711', 26, '0W-20Front_1732976577.webp', 'Lubricant one', NULL, NULL, '15000.00', 1, '15000.00', '0.00', '15000.00', '2024-12-16 08:41:47', '2024-12-16 08:41:47'),
(22, NULL, '1896601834711', 22, 'bluearth-es-es32_f7a53050-f195-494a-9917-05ad044d7355_1732978368.webp', 'Tyre two', NULL, NULL, '300.00', 1, '300.00', '0.00', '300.00', '2024-12-16 08:41:28', '2024-12-16 08:41:28'),
(21, NULL, '290034973108', 30, '58281767_2413160688708610_3553364363970609152_n_1732977518.webp', 'Break Shoe two', NULL, NULL, '7000.00', 1, '7000.00', '0.00', '7000.00', '2024-12-14 19:52:54', '2024-12-14 19:52:54'),
(20, NULL, '290034973108', 23, 'bluearth-es-es32_656e4e68-955e-4553-a103-e263aa6772da_1732977261.webp', 'Tyre one', NULL, NULL, '250.00', 1, '250.00', '0.00', '250.00', '2024-12-14 19:51:52', '2024-12-14 19:51:52'),
(29, NULL, '8880974750054', 24, 'prdt-2-008ae571-5546-4e61-8416-b66d49686718-_1_fa5b6442-891d-4af1-a22b-865958ba3c2d_1732976770.webp', 'Lubricant Four', NULL, NULL, '500.00', 1, '500.00', '0.00', '500.00', '2025-01-04 00:01:27', '2025-01-04 00:01:27'),
(28, 79, NULL, 20, 'MAP31-03d21e46-9f5d-4e30-a3f7-a41e02ec696a-_1_2b65e8ec-acbe-417b-afc6-34fe9563f139_1732977466.webp', 'Tyre four', NULL, NULL, '1200.00', 1, '1200.00', '0.00', '1200.00', '2024-12-31 15:21:09', '2024-12-31 15:21:09'),
(27, NULL, '4341729444125', 22, 'bluearth-es-es32_f7a53050-f195-494a-9917-05ad044d7355_1732978368.webp', 'Tyre two', NULL, NULL, '300.00', 1, '300.00', '0.00', '300.00', '2024-12-30 07:46:55', '2024-12-30 07:46:55'),
(30, NULL, '8818304593869', 24, 'prdt-2-008ae571-5546-4e61-8416-b66d49686718-_1_fa5b6442-891d-4af1-a22b-865958ba3c2d_1732976770.webp', 'Lubricant Four', NULL, NULL, '500.00', 1, '500.00', '0.00', '500.00', '2025-01-04 00:06:55', '2025-01-04 00:06:55'),
(31, NULL, '4106431734779', 23, 'bluearth-es-es32_656e4e68-955e-4553-a103-e263aa6772da_1732977261.webp', 'Tyre one', NULL, NULL, '250.00', 1, '250.00', '0.00', '250.00', '2025-01-05 16:25:24', '2025-01-05 16:25:24'),
(32, NULL, '8656524936537', 22, 'bluearth-es-es32_f7a53050-f195-494a-9917-05ad044d7355_1732978368.webp', 'Tyre two', NULL, NULL, '300.00', 1, '300.00', '0.00', '300.00', '2025-01-06 02:22:32', '2025-01-06 02:22:32'),
(33, NULL, '7758476829844', 29, '62252651_2761929307182190_4775183599341142016_n_1732977442.webp', 'Break Shoe', NULL, NULL, '5000.00', 1, '5000.00', '0.00', '5000.00', '2025-01-06 12:01:45', '2025-01-06 12:01:45'),
(34, NULL, '9096323714674', 31, '1_a2ab0679-e718-4ae4-8ff1-7866643dac8f_1732977586.webp', 'Battery One', NULL, NULL, '6000.00', 1, '6000.00', '0.00', '6000.00', '2025-01-06 12:01:45', '2025-01-06 12:01:45'),
(35, NULL, '9074015513006', 23, 'bluearth-es-es32_656e4e68-955e-4553-a103-e263aa6772da_1732977261.webp', 'Tyre one', NULL, NULL, '250.00', 1, '250.00', '0.00', '250.00', '2025-01-06 12:01:45', '2025-01-06 12:01:45'),
(36, NULL, '3782084036884', 28, 'WhatsAppImage2024-06-09at12.13.09_fc5eaabd_1734869806.webp', 'Joyroom JR-PBF04 20000mAh 65W Fast Charging Power Bank', NULL, NULL, '900.00', 1, '900.00', '0.00', '900.00', '2025-01-06 12:01:45', '2025-01-06 12:01:45'),
(37, NULL, '1090675096848', 30, '58281767_2413160688708610_3553364363970609152_n_1732977518.webp', 'Break Shoe two', NULL, NULL, '7000.00', 1, '7000.00', '0.00', '7000.00', '2025-01-06 12:01:45', '2025-01-06 12:01:45'),
(38, NULL, '5345342647087', 22, 'bluearth-es-es32_f7a53050-f195-494a-9917-05ad044d7355_1732978368.webp', 'Tyre two', NULL, NULL, '300.00', 1, '300.00', '0.00', '300.00', '2025-01-06 12:01:45', '2025-01-06 12:01:45'),
(39, NULL, '8438203562023', 20, 'MAP31-03d21e46-9f5d-4e30-a3f7-a41e02ec696a-_1_2b65e8ec-acbe-417b-afc6-34fe9563f139_1732977466.webp', 'Tyre four', NULL, NULL, '1200.00', 1, '1200.00', '0.00', '1200.00', '2025-01-06 12:01:45', '2025-01-06 12:01:45'),
(40, NULL, '7163467651666', 27, 'Mobil1-0w-20.png_1732976713.webp', 'Lubricant Three', NULL, NULL, '800.00', 1, '800.00', '0.00', '800.00', '2025-01-06 12:01:45', '2025-01-06 12:01:45'),
(41, NULL, '3675885948162', 21, 'cinturato-p1-verde-3-4-1505470090255_13005552-be62-4f0a-8dcd-ef347186fb95_1732977344.webp', 'Tyre three', NULL, NULL, '150.00', 1, '150.00', '0.00', '150.00', '2025-01-06 12:01:45', '2025-01-06 12:01:45'),
(42, NULL, '8633844567812', 23, 'bluearth-es-es32_656e4e68-955e-4553-a103-e263aa6772da_1732977261.webp', 'Tyre one', NULL, NULL, '250.00', 1, '250.00', '0.00', '250.00', '2025-01-06 13:29:16', '2025-01-06 13:29:16'),
(43, NULL, '7883314510159', 23, 'bluearth-es-es32_656e4e68-955e-4553-a103-e263aa6772da_1732977261.webp', 'Tyre one', NULL, NULL, '250.00', 1, '250.00', '0.00', '250.00', '2025-01-07 13:36:01', '2025-01-07 13:36:01'),
(44, NULL, '3585292806906', 24, 'prdt-2-008ae571-5546-4e61-8416-b66d49686718-_1_fa5b6442-891d-4af1-a22b-865958ba3c2d_1732976770.webp', 'Lubricant Four', NULL, NULL, '500.00', 1, '500.00', '0.00', '500.00', '2025-01-07 17:10:27', '2025-01-07 17:10:27'),
(45, NULL, '4587541272224', 32, '2_1c236bfd-ba8a-4272-8686-ea7607eb96ec_1732977634.webp', 'Battery two', NULL, NULL, '8000.00', 1, '8000.00', '0.00', '8000.00', '2025-01-07 23:27:13', '2025-01-07 23:27:13'),
(46, NULL, '4084104040430', 31, '1_a2ab0679-e718-4ae4-8ff1-7866643dac8f_1732977586.webp', 'Battery One', NULL, NULL, '6000.00', 1, '6000.00', '0.00', '6000.00', '2025-01-09 06:52:30', '2025-01-09 06:52:30'),
(47, NULL, '6428029649288', 30, '58281767_2413160688708610_3553364363970609152_n_1732977518.webp', 'Break Shoe two', NULL, NULL, '7000.00', 1, '7000.00', '0.00', '7000.00', '2025-01-09 07:01:21', '2025-01-09 07:01:21'),
(48, NULL, '6874589231388', 22, 'bluearth-es-es32_f7a53050-f195-494a-9917-05ad044d7355_1732978368.webp', 'Tyre two', NULL, NULL, '300.00', 1, '300.00', '0.00', '300.00', '2025-01-09 07:16:00', '2025-01-09 07:16:00'),
(49, NULL, '4857765933412', 23, 'bluearth-es-es32_656e4e68-955e-4553-a103-e263aa6772da_1732977261.webp', 'Tyre one', NULL, NULL, '250.00', 1, '250.00', '0.00', '250.00', '2025-01-09 08:02:11', '2025-01-09 08:02:11'),
(50, NULL, '6009292250264', 21, 'cinturato-p1-verde-3-4-1505470090255_13005552-be62-4f0a-8dcd-ef347186fb95_1732977344.webp', 'Tyre three', NULL, NULL, '150.00', 1, '150.00', '0.00', '150.00', '2025-01-09 08:21:15', '2025-01-09 08:21:15'),
(51, NULL, '5299475074885', 32, '2_1c236bfd-ba8a-4272-8686-ea7607eb96ec_1732977634.webp', 'Battery two', NULL, NULL, '8000.00', 1, '8000.00', '0.00', '8000.00', '2025-01-09 08:30:42', '2025-01-09 08:30:42'),
(52, NULL, '6882127061839', 20, 'MAP31-03d21e46-9f5d-4e30-a3f7-a41e02ec696a-_1_2b65e8ec-acbe-417b-afc6-34fe9563f139_1732977466.webp', 'Tyre four', NULL, NULL, '1200.00', 1, '1200.00', '0.00', '1200.00', '2025-01-09 08:43:53', '2025-01-09 08:43:53'),
(53, NULL, '4216214372258', 29, '62252651_2761929307182190_4775183599341142016_n_1732977442.webp', 'Break Shoe', NULL, NULL, '5000.00', 1, '5000.00', '0.00', '5000.00', '2025-01-09 08:53:32', '2025-01-09 08:53:32'),
(54, NULL, '2905894198175', 23, 'bluearth-es-es32_656e4e68-955e-4553-a103-e263aa6772da_1732977261.webp', 'Tyre one', NULL, NULL, '250.00', 1, '250.00', '0.00', '250.00', '2025-01-10 03:19:06', '2025-01-10 03:19:06'),
(55, NULL, '5769366053181', 20, 'MAP31-03d21e46-9f5d-4e30-a3f7-a41e02ec696a-_1_2b65e8ec-acbe-417b-afc6-34fe9563f139_1732977466.webp', 'Tyre four', NULL, NULL, '1200.00', 1, '1200.00', '0.00', '1200.00', '2025-01-10 09:01:25', '2025-01-10 09:01:25'),
(56, NULL, '5775879903339', 23, 'bluearth-es-es32_656e4e68-955e-4553-a103-e263aa6772da_1732977261.webp', 'Tyre one', NULL, NULL, '250.00', 1, '250.00', '0.00', '250.00', '2025-01-11 00:01:54', '2025-01-11 00:01:54'),
(57, NULL, '4100457446824', 21, 'cinturato-p1-verde-3-4-1505470090255_13005552-be62-4f0a-8dcd-ef347186fb95_1732977344.webp', 'Tyre three', NULL, NULL, '150.00', 1, '150.00', '0.00', '150.00', '2025-01-11 00:01:55', '2025-01-11 00:01:55'),
(58, NULL, '9688371060190', 20, 'MAP31-03d21e46-9f5d-4e30-a3f7-a41e02ec696a-_1_2b65e8ec-acbe-417b-afc6-34fe9563f139_1732977466.webp', 'Tyre four', NULL, NULL, '1200.00', 1, '1200.00', '0.00', '1200.00', '2025-01-11 00:01:55', '2025-01-11 00:01:55'),
(59, NULL, '2749045918274', 22, 'bluearth-es-es32_f7a53050-f195-494a-9917-05ad044d7355_1732978368.webp', 'Tyre two', NULL, NULL, '300.00', 1, '300.00', '0.00', '300.00', '2025-01-11 00:01:55', '2025-01-11 00:01:55'),
(60, NULL, '9797085022726', 24, 'prdt-2-008ae571-5546-4e61-8416-b66d49686718-_1_fa5b6442-891d-4af1-a22b-865958ba3c2d_1732976770.webp', 'Lubricant Four', NULL, NULL, '500.00', 1, '500.00', '0.00', '500.00', '2025-01-11 00:01:56', '2025-01-11 00:01:56'),
(61, NULL, '5955918455058', 27, 'Mobil1-0w-20.png_1732976713.webp', 'Lubricant Three', NULL, NULL, '800.00', 1, '800.00', '0.00', '800.00', '2025-01-11 00:01:57', '2025-01-11 00:01:57'),
(62, NULL, '2795266600600', 29, '62252651_2761929307182190_4775183599341142016_n_1732977442.webp', 'Break Shoe', NULL, NULL, '5000.00', 1, '5000.00', '0.00', '5000.00', '2025-01-11 00:01:59', '2025-01-11 00:01:59'),
(63, NULL, '4228363315090', 28, 'WhatsAppImage2024-06-09at12.13.09_fc5eaabd_1734869806.webp', 'Joyroom JR-PBF04 20000mAh 65W Fast Charging Power Bank', NULL, NULL, '900.00', 1, '900.00', '0.00', '900.00', '2025-01-11 00:01:59', '2025-01-11 00:01:59'),
(64, NULL, '5853744935557', 26, '0W-20Front_1732976577.webp', 'Lubricant one', NULL, NULL, '1500.00', 1, '1500.00', '0.00', '1500.00', '2025-01-11 00:01:59', '2025-01-11 00:01:59'),
(65, NULL, '2085837466412', 30, '58281767_2413160688708610_3553364363970609152_n_1732977518.webp', 'Break Shoe two', NULL, NULL, '7000.00', 1, '7000.00', '0.00', '7000.00', '2025-01-11 00:01:59', '2025-01-11 00:01:59'),
(66, NULL, '7686591327207', 26, '0W-20Front_1732976577.webp', 'Lubricant one', NULL, NULL, '1500.00', 1, '1500.00', '0.00', '1500.00', '2025-01-13 06:38:24', '2025-01-13 06:38:24'),
(67, NULL, '7568307397626', 23, 'bluearth-es-es32_656e4e68-955e-4553-a103-e263aa6772da_1732977261.webp', 'Tyre one', NULL, NULL, '250.00', 1, '250.00', '0.00', '250.00', '2025-01-14 21:31:11', '2025-01-14 21:31:11'),
(68, NULL, '8949411785662', 33, 'attachment_135902894_1736048574.jpg', 'Test product', NULL, NULL, '500.00', 1, '500.00', '0.00', '500.00', '2025-01-16 18:36:09', '2025-01-16 18:36:09'),
(69, NULL, '8979866469338', 26, '0W-20Front_1732976577.webp', 'Lubricant one', NULL, NULL, '1500.00', 1, '1500.00', '0.00', '1500.00', '2025-01-17 10:34:27', '2025-01-17 10:34:27'),
(70, NULL, '2768077223758', 21, 'cinturato-p1-verde-3-4-1505470090255_13005552-be62-4f0a-8dcd-ef347186fb95_1732977344.webp', 'Tyre three', NULL, NULL, '150.00', 1, '150.00', '0.00', '150.00', '2025-01-17 13:28:55', '2025-01-17 13:28:55'),
(71, NULL, '6571753626754', 28, 'WhatsAppImage2024-06-09at12.13.09_fc5eaabd_1734869806.webp', 'Joyroom JR-PBF04 20000mAh 65W Fast Charging Power Bank', NULL, NULL, '900.00', 1, '900.00', '0.00', '900.00', '2025-01-17 14:56:26', '2025-01-17 14:56:26'),
(72, NULL, '7870379333002', 20, 'MAP31-03d21e46-9f5d-4e30-a3f7-a41e02ec696a-_1_2b65e8ec-acbe-417b-afc6-34fe9563f139_1732977466.webp', 'Tyre four', NULL, NULL, '1200.00', 1, '1200.00', '0.00', '1200.00', '2025-01-17 19:47:37', '2025-01-17 19:47:37'),
(73, NULL, '1227972380128', 32, '2_1c236bfd-ba8a-4272-8686-ea7607eb96ec_1732977634.webp', 'Battery two', NULL, NULL, '8000.00', 1, '8000.00', '0.00', '8000.00', '2025-01-17 21:19:20', '2025-01-17 21:19:20'),
(74, NULL, '5892599428619', 23, 'bluearth-es-es32_656e4e68-955e-4553-a103-e263aa6772da_1732977261.webp', 'Tyre one', NULL, NULL, '250.00', 1, '250.00', '0.00', '250.00', '2025-01-17 22:39:07', '2025-01-17 22:39:07'),
(75, NULL, '6209120559217', 31, '1_a2ab0679-e718-4ae4-8ff1-7866643dac8f_1732977586.webp', 'Battery One', NULL, NULL, '6000.00', 1, '6000.00', '0.00', '6000.00', '2025-01-18 01:38:48', '2025-01-18 01:38:48'),
(76, NULL, '4469344822945', 28, 'WhatsAppImage2024-06-09at12.13.09_fc5eaabd_1734869806.webp', 'Joyroom JR-PBF04 20000mAh 65W Fast Charging Power Bank', NULL, NULL, '900.00', 1, '900.00', '0.00', '900.00', '2025-01-20 04:26:26', '2025-01-20 04:26:26'),
(77, NULL, '2212779753387', 34, 'For-Web-2nd-copy_1737347058.jpg', 'Race car wash shampoo', NULL, NULL, '520.00', 1, '520.00', '0.00', '520.00', '2025-01-20 10:25:27', '2025-01-20 10:25:27'),
(78, 79, NULL, 32, '2_1c236bfd-ba8a-4272-8686-ea7607eb96ec_1732977634.webp', 'Battery two', NULL, NULL, '8000.00', 1, '8000.00', '0.00', '8000.00', '2025-01-20 16:41:44', '2025-01-20 16:41:44'),
(79, NULL, '2852946905707', 34, 'IMG-20250120-WA0001_1737358006.jpg', 'Race car wash shampoo', NULL, NULL, '520.00', 1, '520.00', '0.00', '520.00', '2025-01-20 21:34:23', '2025-01-20 21:34:23'),
(80, NULL, '6310318805705', 21, 'cinturato-p1-verde-3-4-1505470090255_13005552-be62-4f0a-8dcd-ef347186fb95_1732977344.webp', 'Tyre three', NULL, NULL, '150.00', 1, '150.00', '0.00', '150.00', '2025-01-22 16:36:14', '2025-01-22 16:36:14'),
(81, NULL, '6310318805705', 22, 'bluearth-es-es32_f7a53050-f195-494a-9917-05ad044d7355_1732978368.webp', 'Tyre two', NULL, NULL, '300.00', 1, '300.00', '0.00', '300.00', '2025-01-22 16:36:21', '2025-01-22 16:36:21'),
(82, NULL, '6310318805705', 24, 'prdt-2-008ae571-5546-4e61-8416-b66d49686718-_1_fa5b6442-891d-4af1-a22b-865958ba3c2d_1732976770.webp', 'Lubricant Four', NULL, NULL, '500.00', 1, '500.00', '0.00', '500.00', '2025-01-22 16:36:29', '2025-01-22 16:36:29'),
(84, NULL, '6404096038099', 24, 'prdt-2-008ae571-5546-4e61-8416-b66d49686718-_1_fa5b6442-891d-4af1-a22b-865958ba3c2d_1732976770.webp', 'Lubricant Four', NULL, NULL, '500.00', 5, '2500.00', '0.00', '2500.00', '2025-01-26 14:03:23', '2025-01-26 17:26:11'),
(85, NULL, '6404096038099', 31, '1_a2ab0679-e718-4ae4-8ff1-7866643dac8f_1732977586.webp', 'Battery One', NULL, NULL, '6000.00', 2, '12000.00', '0.00', '12000.00', '2025-01-26 14:03:32', '2025-01-26 17:26:11'),
(89, NULL, '1388275300828', 45, '50e579cdb46bb8b2d95aba76a50bae52_1782559595.jpg', 'Gas Stove Double', NULL, NULL, '4000.00', 1, '4000.00', '0.00', '4000.00', '2026-06-27 15:09:17', '2026-06-27 15:09:17'),
(90, NULL, '4243437569872', 21, 'cinturato-p1-verde-3-4-1505470090255_13005552-be62-4f0a-8dcd-ef347186fb95_1732977344.webp', 'Tyre three', NULL, NULL, '150.00', 1, '150.00', '0.00', '150.00', '2026-06-27 16:42:31', '2026-06-27 16:42:31'),
(91, NULL, '1612573543086', 28, 'WhatsAppImage2024-06-09at12.13.09_fc5eaabd_1734869806.webp', 'Joyroom JR-PBF04 20000mAh 65W Fast Charging Power Bank', NULL, NULL, '900.00', 1, '900.00', '0.00', '900.00', '2026-06-27 20:13:05', '2026-06-27 20:13:05'),
(92, NULL, '5988383160891', 50, 'IMG_20260628_033221_1782597665.jpg', 'Loyal Still Golden Auto gas stove LPG', NULL, NULL, '1650.00', 1, '1650.00', '0.00', '1650.00', '2026-06-27 22:01:51', '2026-06-27 22:02:05'),
(93, NULL, '9627156688094', 48, 'IMG_20260628_025152_1782593698.jpg', 'Lg Front glass Gas stove', NULL, NULL, '1650.00', 1, '1650.00', '0.00', '1650.00', '2026-06-27 22:54:01', '2026-06-27 22:54:01'),
(94, NULL, '1834508158455', 47, 'IMG_20260628_023624_1782592874.jpg', 'Loyal Glass Single Gas stove', NULL, NULL, '2190.00', 1, '2190.00', '0.00', '2190.00', '2026-06-27 23:03:31', '2026-06-27 23:03:31'),
(95, NULL, '4369328849471', 49, 'IMG_20260628_030900_1782595483.jpg', 'Loyal Princess Double Glass gas Stove -3D', NULL, NULL, '3500.00', 1, '3500.00', '0.00', '3500.00', '2026-06-28 01:32:06', '2026-06-28 01:32:06'),
(96, NULL, '9472987594195', 50, 'IMG_20260628_033221_1782597665.jpg', 'Loyal Still Golden Auto gas stove LPG', NULL, NULL, '1650.00', 1, '1650.00', '0.00', '1650.00', '2026-06-28 02:34:28', '2026-06-28 02:34:28'),
(97, NULL, '3997051693775', 50, 'IMG_20260628_033221_1782597665.jpg', 'Loyal Still Golden Auto gas stove LPG', NULL, NULL, '1650.00', 1, '1650.00', '0.00', '1650.00', '2026-06-28 07:10:42', '2026-06-28 07:10:42'),
(98, NULL, '7199967129926', 47, 'IMG_20260628_023624_1782592874.jpg', 'Loyal Glass Single Gas stove', NULL, NULL, '2190.00', 1, '2190.00', '0.00', '2190.00', '2026-06-28 07:51:22', '2026-06-28 07:51:22'),
(99, NULL, '2116480479251', 49, 'IMG_20260628_030900_1782595483.jpg', 'Loyal Princess Double Glass gas Stove -3D', NULL, NULL, '3500.00', 1, '3500.00', '0.00', '3500.00', '2026-06-28 09:22:49', '2026-06-28 09:22:49'),
(100, NULL, '8183302366510', 48, 'IMG_20260628_025152_1782593698.jpg', 'Lg Front glass Gas stove', NULL, NULL, '1650.00', 1, '1650.00', '0.00', '1650.00', '2026-06-28 11:30:53', '2026-06-28 11:30:53'),
(101, NULL, '5378047002612', 47, 'IMG_20260628_023624_1782592874.jpg', 'Loyal Glass Single Gas stove', NULL, NULL, '2190.00', 1, '2190.00', '0.00', '2190.00', '2026-06-28 13:02:41', '2026-06-28 13:02:41'),
(102, NULL, '5378047002612', 48, 'IMG_20260628_025152_1782593698.jpg', 'Lg Front glass Gas stove', NULL, NULL, '1650.00', 1, '1650.00', '0.00', '1650.00', '2026-06-28 13:02:42', '2026-06-28 13:02:42'),
(103, NULL, '5378047002612', 49, 'IMG_20260628_030900_1782595483.jpg', 'Loyal Princess Double Glass gas Stove -3D', NULL, NULL, '3500.00', 1, '3500.00', '0.00', '3500.00', '2026-06-28 13:02:43', '2026-06-28 13:02:43'),
(104, NULL, '5209637003285', 48, 'IMG_20260628_025152_1782593698.jpg', 'Lg Front glass Gas stove', NULL, NULL, '1650.00', 1, '1650.00', '0.00', '1650.00', '2026-06-29 19:56:52', '2026-06-29 19:56:52'),
(105, NULL, '887976172448', 47, 'IMG_20260628_023624_1782592874.jpg', 'Loyal Glass Single Gas stove', NULL, NULL, '2190.00', 1, '2190.00', '0.00', '2190.00', '2026-06-30 10:24:42', '2026-06-30 10:24:42'),
(106, NULL, '8926268811452', 48, 'IMG_20260628_025152_1782593698.jpg', 'Lg Front glass Gas stove', NULL, NULL, '1650.00', 1, '1650.00', '0.00', '1650.00', '2026-06-30 10:24:42', '2026-06-30 10:24:42'),
(107, NULL, '5145618946823', 49, 'IMG_20260628_030900_1782595483.jpg', 'Loyal Princess Double Glass gas Stove -3D', NULL, NULL, '3500.00', 1, '3500.00', '0.00', '3500.00', '2026-06-30 10:24:42', '2026-06-30 10:24:42'),
(108, NULL, '4326918858381', 50, 'IMG_20260628_033221_1782597665.jpg', 'Loyal Still Golden Auto gas stove LPG', NULL, NULL, '1650.00', 1, '1650.00', '0.00', '1650.00', '2026-06-30 10:24:42', '2026-06-30 10:24:42'),
(139, NULL, '254723704665', 51, 'IMG_20260702_031136_1782940308.jpg', 'Loyal Single Auto 120mm Still gas Stove', NULL, NULL, '1450.00', 1, '1450.00', '0.00', '1450.00', '2026-07-01 22:11:49', '2026-07-01 22:11:49'),
(113, NULL, '1212351122523', 47, 'IMG_20260628_023624_1782592874.jpg', 'Loyal Glass Single Gas stove', NULL, NULL, '2190.00', 1, '2190.00', '0.00', '2190.00', '2026-06-30 10:26:11', '2026-06-30 10:26:11'),
(137, NULL, '2605686230327', 47, 'IMG_20260628_023624_1782592874.jpg', 'Loyal Glass Single Gas stove', NULL, NULL, '2190.00', 1, '2190.00', '0.00', '2190.00', '2026-06-30 20:02:33', '2026-06-30 20:02:33'),
(129, NULL, '3430561752810', 48, 'IMG_20260628_025152_1782593698.jpg', 'Lg Front glass Gas stove', NULL, NULL, '1650.00', 1, '1650.00', '0.00', '1650.00', '2026-06-30 11:00:11', '2026-06-30 11:00:11'),
(135, NULL, '1486418864728', 48, 'IMG_20260628_025152_1782593698.jpg', 'Lg Front glass Gas stove', NULL, NULL, '1650.00', 1, '1650.00', '0.00', '1650.00', '2026-06-30 19:00:05', '2026-06-30 19:00:05'),
(133, NULL, '5938417091984', 50, 'IMG_20260628_033221_1782597665.jpg', 'Loyal Still Golden Auto gas stove LPG', NULL, NULL, '1650.00', 1, '1650.00', '0.00', '1650.00', '2026-06-30 13:37:08', '2026-06-30 13:37:08'),
(134, NULL, '4274017787916', 50, 'IMG_20260628_033221_1782597665.jpg', 'Loyal Still Golden Auto gas stove LPG', NULL, NULL, '1650.00', 1, '1650.00', '0.00', '1650.00', '2026-06-30 18:18:25', '2026-06-30 18:18:25'),
(119, NULL, '249808950534', 47, 'IMG_20260628_023624_1782592874.jpg', 'Loyal Glass Single Gas stove', NULL, NULL, '2190.00', 1, '2190.00', '0.00', '2190.00', '2026-06-30 10:26:11', '2026-06-30 10:26:11'),
(138, NULL, '1659115612413', 51, 'IMG_20260702_031136_1782940308.jpg', 'Loyal Single Auto 120mm Still gas Stove', NULL, NULL, '1450.00', 1, '1450.00', '0.00', '1450.00', '2026-07-01 21:51:51', '2026-07-01 21:51:51'),
(125, NULL, '3097534627394', 48, 'IMG_20260628_025152_1782593698.jpg', 'Lg Front glass Gas stove', NULL, NULL, '1650.00', 1, '1650.00', '0.00', '1650.00', '2026-06-30 10:36:19', '2026-06-30 10:36:19'),
(136, NULL, '9259113281138', 47, 'IMG_20260628_023624_1782592874.jpg', 'Loyal Glass Single Gas stove', NULL, NULL, '2190.00', 1, '2190.00', '0.00', '2190.00', '2026-06-30 19:40:15', '2026-06-30 19:40:15'),
(140, NULL, '6349281713361', 52, 'IMG_20260702_170425_1782990366.jpg', 'LG Ms Still Double Auto Gas Stove', NULL, NULL, '1899.00', 1, '1899.00', '0.00', '1899.00', '2026-07-02 12:24:55', '2026-07-02 12:24:55'),
(141, NULL, '5318483490984', 52, 'IMG_20260702_170425_1782990366.jpg', 'LG Ms Still Double Auto Gas Stove', NULL, NULL, '1899.00', 1, '1899.00', '0.00', '1899.00', '2026-07-02 13:07:15', '2026-07-02 13:07:15'),
(142, NULL, '1661577855247', 52, 'IMG_20260702_170425_1782990366.jpg', 'LG Ms Still Double Auto Gas Stove', NULL, NULL, '1899.00', 1, '1899.00', '0.00', '1899.00', '2026-07-02 14:07:15', '2026-07-02 14:07:15'),
(143, NULL, '3920670544396', 52, 'IMG_20260702_170425_1782990366.jpg', 'LG Ms Still Double Auto Gas Stove', NULL, NULL, '1899.00', 1, '1899.00', '0.00', '1899.00', '2026-07-02 14:07:59', '2026-07-02 14:07:59'),
(144, NULL, '8809805552040', 53, 'IMG_20260703_121325_1783059287.jpg', 'Loyal Single Honeycomb Burner Auto gas stove', NULL, NULL, '1190.00', 1, '1190.00', '0.00', '1190.00', '2026-07-03 06:31:53', '2026-07-03 06:31:53'),
(145, NULL, '5751287093557', 53, 'IMG_20260703_121325_1783059287.jpg', 'Loyal Single Honeycomb Burner Auto gas stove', NULL, NULL, '1190.00', 1, '1190.00', '0.00', '1190.00', '2026-07-03 10:18:41', '2026-07-03 10:18:41'),
(146, NULL, '5407616414323', 54, 'IMG_20260703_124119_1783062419.jpg', '120mm Double LG Gas stove', NULL, NULL, '2290.00', 1, '2290.00', '0.00', '2290.00', '2026-07-03 10:29:22', '2026-07-03 10:29:22'),
(147, NULL, '3232366185134', 54, 'IMG_20260703_124119_1783062419.jpg', '120mm Double LG Gas stove', NULL, NULL, '2290.00', 1, '2290.00', '0.00', '2290.00', '2026-07-03 11:07:47', '2026-07-03 11:07:47'),
(148, NULL, '6269533065512', 54, 'IMG_20260703_124119_1783062419.jpg', '120mm Double LG Gas stove', NULL, NULL, '2290.00', 1, '2290.00', '0.00', '2290.00', '2026-07-03 19:05:19', '2026-07-03 19:05:19'),
(149, NULL, '2043102292079', 54, 'IMG_20260703_124119_1783062419.jpg', '120mm Double LG Gas stove', NULL, NULL, '2290.00', 1, '2290.00', '0.00', '2290.00', '2026-07-03 19:23:57', '2026-07-03 19:23:57'),
(150, NULL, '413953034502', 48, 'IMG_20260628_025152_1782593698.jpg', 'Lg Front glass Gas stove', NULL, NULL, '1650.00', 1, '1650.00', '0.00', '1650.00', '2026-07-04 01:13:11', '2026-07-04 01:13:11'),
(151, NULL, '3463277176115', 49, 'IMG_20260628_030900_1782595483.jpg', 'Loyal Princess Double Glass gas Stove -3D', NULL, NULL, '3500.00', 1, '3500.00', '0.00', '3500.00', '2026-07-04 01:14:52', '2026-07-04 01:14:52'),
(152, NULL, '3824341463624', 47, 'IMG_20260628_023624_1782592874.jpg', 'Loyal Glass Single Gas stove', NULL, NULL, '2190.00', 1, '2190.00', '0.00', '2190.00', '2026-07-04 02:30:49', '2026-07-04 02:30:49'),
(153, NULL, '6724712439012', 51, 'IMG_20260703_122617_1783060058.jpg', 'Loyal Single Auto 120mm Still gas Stove', NULL, NULL, '1450.00', 1, '1450.00', '0.00', '1450.00', '2026-07-04 02:42:50', '2026-07-04 02:42:50'),
(155, NULL, '3784193209859', 49, 'IMG_20260628_030900_1782595483.jpg', 'Loyal Princess Double Glass gas Stove -3D', NULL, NULL, '3500.00', 1, '3500.00', '0.00', '3500.00', '2026-07-04 08:34:10', '2026-07-04 08:34:13'),
(163, NULL, '4285710770757', 52, 'IMG_20260702_170425_1782990366.jpg', 'LG Ms Still Double Auto Gas Stove', NULL, NULL, '1899.00', 1, '1899.00', '0.00', '1899.00', '2026-07-04 13:49:06', '2026-07-04 13:49:41'),
(162, NULL, '4285710770757', 50, 'IMG_20260628_033221_1782597665.jpg', 'Loyal Still Golden Auto gas stove LPG', NULL, NULL, '1650.00', 1, '1650.00', '0.00', '1650.00', '2026-07-04 13:48:56', '2026-07-04 13:49:41'),
(164, NULL, '4285710770757', 54, 'IMG_20260703_124119_1783062419.jpg', '120mm Double LG Gas stove', NULL, NULL, '2290.00', 1, '2290.00', '0.00', '2290.00', '2026-07-04 13:50:19', '2026-07-04 13:50:19'),
(170, NULL, '5173770420130', 55, '67285487491ac-square_1783858920.jpg', 'Zenaida Vinson', NULL, NULL, '1100.00', 1, '1100.00', '0.00', '1100.00', '2026-07-14 07:04:00', '2026-07-14 07:04:00'),
(197, NULL, '7911359348360', 68, '6a0da8cfd1e8b-square_1783946161.jpg', 'Jelani Maddox', NULL, NULL, '300.00', 1, '300.00', '0.00', '300.00', '2026-07-14 11:21:36', '2026-07-14 11:21:36'),
(202, 88, NULL, 70, '62178453a886d-square_1784012614.jpg', 'men Shirt color and size', 'Green', 'M', '500.00', 1, '500.00', '0.00', '500.00', '2026-07-19 12:45:22', '2026-07-19 12:45:22'),
(177, NULL, 'codex-refresh-test', 55, '67285487491ac-square_1783858920.jpg', 'Zenaida Vinson', 'Green', 'L', '1400.00', 3, '4200.00', '0.00', '4200.00', '2026-07-14 07:15:41', '2026-07-14 07:15:41'),
(200, NULL, '4766069984822', 56, '66c1f1a693459-square_1783859916.jpg', 'Jemima Shelton', NULL, NULL, '863.00', 1, '863.00', '0.00', '863.00', '2026-07-15 11:52:32', '2026-07-15 11:52:32');

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` bigint UNSIGNED NOT NULL,
  `parent_id` char(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `category_name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `category_slug` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `category_description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `category_image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `has_child` tinyint(1) NOT NULL DEFAULT '0',
  `status` tinyint NOT NULL,
  `is_display_products` tinyint(1) NOT NULL DEFAULT '0',
  `is_menu` tinyint(1) NOT NULL DEFAULT '0',
  `is_slider_bottom` tinyint(1) NOT NULL DEFAULT '0',
  `is_feature` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `parent_id`, `category_name`, `category_slug`, `category_description`, `category_image`, `has_child`, `status`, `is_display_products`, `is_menu`, `is_slider_bottom`, `is_feature`, `created_at`, `updated_at`) VALUES
(36, NULL, 'Men', 'men', NULL, '67c4f8805a51e-square_1783858460.jpg', 0, 1, 1, 1, 1, 1, '2026-07-12 12:14:20', '2026-07-14 06:23:07'),
(37, NULL, 'Women', 'women', NULL, '67dc35b5a0fc5-square_1783935514.png', 0, 1, 1, 1, 1, 1, '2026-07-13 09:38:34', '2026-07-14 06:22:53'),
(38, '36', 'Shirt', 'shirt', NULL, '67285487491ac-square_1784010418.jpg', 0, 1, 1, 1, 1, 1, '2026-07-14 06:26:58', '2026-07-14 06:28:27'),
(39, NULL, 'Summer', 'summer', NULL, 'c3aaf6e5-8cc9-4cfc-b7de-d12749d033ae.png', 0, 1, 1, 1, 0, 0, '2026-07-25 11:02:38', '2026-07-25 11:02:38');

-- --------------------------------------------------------

--
-- Table structure for table `city`
--

CREATE TABLE `city` (
  `id` bigint UNSIGNED NOT NULL,
  `country_id` int NOT NULL,
  `state_id` int NOT NULL,
  `city_name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `countries`
--

CREATE TABLE `countries` (
  `id` bigint NOT NULL,
  `name` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `status` tinyint NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `countries`
--

INSERT INTO `countries` (`id`, `name`, `status`, `created_at`, `updated_at`) VALUES
(4, 'United States', 1, '2024-10-06 03:35:55', NULL),
(5, 'England', 1, '2024-10-06 03:35:55', NULL),
(6, 'Bangladesh', 1, '2024-10-06 03:36:16', NULL),
(7, 'Australia', 1, '2024-10-06 03:36:16', NULL),
(8, 'Saudi Arabia', 1, '2024-10-06 03:41:22', NULL),
(9, 'Iran', 1, '2024-10-06 03:41:22', NULL),
(11, 'pakistan', 1, '2024-10-30 00:11:49', '2024-10-30 00:11:49'),
(13, 'Iceland', 0, '2024-10-30 00:17:25', '2024-10-30 00:17:25');

-- --------------------------------------------------------

--
-- Table structure for table `country`
--

CREATE TABLE `country` (
  `id` bigint UNSIGNED NOT NULL,
  `country_name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `currencies`
--

CREATE TABLE `currencies` (
  `id` bigint NOT NULL,
  `name` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `symbol` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `status` tinyint NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `currencies`
--

INSERT INTO `currencies` (`id`, `name`, `symbol`, `status`, `created_at`, `updated_at`) VALUES
(4, 'USD', '$', 1, '2024-08-25 01:03:24', '2024-08-25 01:03:24'),
(5, 'BDT', NULL, 0, NULL, NULL),
(6, 'EURO', NULL, 0, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

CREATE TABLE `customers` (
  `id` bigint UNSIGNED NOT NULL,
  `lead_id` char(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `customer_id` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mobile_number` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email_address` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `contact_address` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `customer_group` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `customer_notes` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `customers_old`
--

CREATE TABLE `customers_old` (
  `id` bigint UNSIGNED NOT NULL,
  `lead_id` char(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `customer_id` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `customer_group` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `customer_notes` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `customers_old`
--

INSERT INTO `customers_old` (`id`, `lead_id`, `customer_id`, `customer_group`, `customer_notes`, `created_at`, `updated_at`) VALUES
(7, '411', '93HFL', 'NEW CLIENT', 'This is our new customer', '2024-11-05 12:00:27', '2024-11-05 12:00:27'),
(8, '418', '5CE2K', 'SERVICE BASED', 'service based product', '2024-11-06 04:37:07', '2024-11-06 04:37:07');

-- --------------------------------------------------------

--
-- Table structure for table `customer_info`
--

CREATE TABLE `customer_info` (
  `id` bigint UNSIGNED NOT NULL,
  `lead_id` bigint UNSIGNED NOT NULL,
  `form_id` char(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_by` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `customer_name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `mobile_number` char(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `total_balance` char(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image_upload_file` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `customer_info`
--

INSERT INTO `customer_info` (`id`, `lead_id`, `form_id`, `created_by`, `customer_name`, `address`, `mobile_number`, `total_balance`, `image_upload_file`, `created_at`, `updated_at`) VALUES
(1, 403, '1051895449', 'shimla1236', 'Safi Islam', 'jatrabari', '01764655236', '1000000000000000', 'andi-rieger-vfEqA8sKe6A-unsplash_1730358844_1730789843.jpg', '2024-11-05 06:57:23', '2024-11-05 06:57:23'),
(2, 404, '1051895449', 'shimla1236', 'Rony Islam', NULL, '01764655896', '120000000000000', 'andi-rieger-vfEqA8sKe6A-unsplash_1730358844_1730790814.jpg', '2024-11-05 07:13:34', '2024-11-05 07:13:34'),
(3, 404, '1051895449', 'shimla1236', NULL, NULL, NULL, '1234567890123456', NULL, '2024-11-05 07:15:40', '2024-11-05 07:16:43'),
(4, 411, '1051895449', 'moni123', 'kamrul islam', 'bashundhara', '01764655236', '1200', 'ASH1825037M_SDA_REPORT (1)-1_1730789615_1730798599.pdf', '2024-11-05 09:23:19', '2024-11-05 09:23:19'),
(5, 418, '1051895449', 'moni123', 'anny', '', '01762390934', '150000', '', '2024-11-05 10:19:12', '2024-11-05 10:19:12'),
(6, 430, '1051895449', 'kzprince', 'The city bank', 'Gulshan 2', '01717761611', '', 'Profile-Picture_1730870065.jpg', '2024-11-06 05:14:25', '2024-11-06 05:14:25');

-- --------------------------------------------------------

--
-- Table structure for table `departments`
--

CREATE TABLE `departments` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `branch_id` bigint UNSIGNED DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `departments`
--

INSERT INTO `departments` (`id`, `name`, `code`, `branch_id`, `status`, `created_at`, `updated_at`) VALUES
(1, 'General', 'GEN', NULL, 1, '2026-08-12 07:17:24', '2026-08-12 07:17:24');

-- --------------------------------------------------------

--
-- Table structure for table `designations`
--

CREATE TABLE `designations` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `department_id` bigint UNSIGNED DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `designations`
--

INSERT INTO `designations` (`id`, `name`, `code`, `department_id`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Employee', 'EMP', NULL, 1, '2026-08-12 07:17:24', '2026-08-12 07:17:24');

-- --------------------------------------------------------

--
-- Table structure for table `developer department`
--

CREATE TABLE `developer department` (
  `id` bigint UNSIGNED NOT NULL,
  `lead_id` bigint UNSIGNED NOT NULL,
  `form_id` char(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `web design` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `machine learning` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `document_types`
--

CREATE TABLE `document_types` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `is_required` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `document_types`
--

INSERT INTO `document_types` (`id`, `name`, `code`, `status`, `created_at`, `updated_at`, `description`, `is_required`) VALUES
(1, 'Identity Proof', 'ID', 1, '2026-08-12 07:17:24', '2026-08-12 07:17:24', NULL, 0),
(2, 'Address Proof', 'ADDR', 1, '2026-08-12 07:17:24', '2026-08-12 07:17:24', NULL, 0),
(3, 'Educational Certificate', 'EDU', 1, '2026-08-12 07:17:24', '2026-08-12 07:17:24', NULL, 0);

-- --------------------------------------------------------

--
-- Table structure for table `email_log`
--

CREATE TABLE `email_log` (
  `id` bigint UNSIGNED NOT NULL,
  `campaign_id` bigint UNSIGNED DEFAULT NULL,
  `lead_id` bigint UNSIGNED DEFAULT NULL,
  `customer_id` bigint UNSIGNED DEFAULT NULL,
  `user_id` bigint UNSIGNED DEFAULT NULL,
  `email_from` char(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_to` char(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_subject` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `log_time` datetime DEFAULT NULL,
  `delivery_time` datetime DEFAULT NULL,
  `send_status` tinyint DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `email_queue`
--

CREATE TABLE `email_queue` (
  `id` bigint UNSIGNED NOT NULL,
  `campaign_id` bigint DEFAULT NULL,
  `lead_id` bigint DEFAULT NULL,
  `meeting_id` bigint DEFAULT NULL,
  `email_from` char(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email_to` char(180) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_subject` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `send_status` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `csv_id` char(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `priority_level` tinyint DEFAULT NULL,
  `log_time` datetime DEFAULT NULL,
  `schedule_time` datetime DEFAULT NULL,
  `status` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `email_templates`
--

CREATE TABLE `email_templates` (
  `id` bigint UNSIGNED NOT NULL,
  `email_subject` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint DEFAULT NULL,
  `created_by` bigint DEFAULT NULL,
  `updated_by` bigint DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `email_templates`
--

INSERT INTO `email_templates` (`id`, `email_subject`, `email_content`, `status`, `created_by`, `updated_by`, `created_at`, `updated_at`) VALUES
(42, 'Email template1', '<p>Send email template1</p><p><br></p>', 1, 1, NULL, '2024-10-30 23:36:52', '2024-10-30 23:36:52'),
(43, 'Moni template', '<p>Moni email template</p>', 1, 69, NULL, '2024-10-30 23:44:21', '2024-10-30 23:44:21'),
(44, 'Kashfi template', '<p>Kashfi email template</p>', 1, 67, 1, '2024-10-30 23:46:49', '2024-10-31 06:38:37'),
(45, 'create agents templete', '<p><strong>The Need for Speed:</strong></p>\r\n\r\n\r\n\r\n<ul><li> The first reason to use a sanity check is for speed. Nobody would refuse some buffer time to fix the <a href=\"https://testgrid.io/blog/bug-finding-ways-in-software/\" target=\"_blank\" data-type=\"post\" data-id=\"5932\" rel=\"noreferrer noopener\">discovered bugs</a>.\r\n However, this testing is limited in scope and has clearly defined \r\nexamination areas. This testing can be done intuitively without a \r\nspecific test case.</li></ul>\r\n\r\n\r\n\r\n<p><strong>No Extra Effort Is Necessary:</strong> </p>\r\n\r\n\r\n\r\n<ul><li>Second, the sanity check keeps you from doing anything you don’t \r\nneed to. It indicates whether additional tests should be performed. This\r\n eliminates extra work but gives the test team more time and simplifies \r\nthe process by eliminating formal bug reporting.</li></ul>\r\n\r\n\r\n\r\n<p><strong>Identifying Outward Issues:</strong> </p>\r\n\r\n\r\n\r\n<ul><li>A sanity check reveals deployment issues. For example, the tester \r\nmight encounter an inaccurate user interface if the developers did not \r\ninclude all the resource files in the compilation. </li><li>Furthermore, developers may fail to specify some critical features \r\nto make them visible to testers. A sanity check detects such issues and \r\nprovides a quick solution for a stable release.</li></ul>\r\n\r\n\r\n\r\n<p><strong>Quick Responses:</strong> </p>\r\n\r\n\r\n\r\n<ul><li>Finally, a test quickly defines the product’s status and predicts \r\nthe next steps. In the event of a failure, you can direct your test team\r\n to resolve the issues discovered before the product release before \r\nmoving on to the next task. </li><li>Simultaneously, if you pass this test, you can ask your team to move\r\n on to the next task, involving only one developer or tester in the \r\nmodifications and fixes, or you can set aside some time to correct the \r\nerrors.</li></ul>', 1, 75, 75, '2024-11-05 08:32:15', '2024-11-05 08:33:11'),
(46, 'second agent created email', '<p>It aids in the rapid identification of issues in the core \r\nfunctionality. As a result, the application’s stability can be validated\r\n quickly, and any problems can be reported and fixed quickly.</p>\r\n\r\n\r\n\r\n<p>Because no documentation is required, these tests can be completed less than other formal tests.</p>\r\n\r\n\r\n\r\n<p>If problems are discovered during Sanity testing, then the build is \r\nrejected. This saves a significant amount of time and resources that \r\nwould otherwise be used to run regression tests.</p><p>It aids in the rapid identification of issues in the core \r\nfunctionality. As a result, the application’s stability can be validated\r\n quickly, and any problems can be reported and fixed quickly.</p>\r\n\r\n\r\n\r\n<p>Because no documentation is required, these tests can be completed less than other formal tests.</p>\r\n\r\n\r\n\r\n<p>If problems are discovered during Sanity testing, then the build is \r\nrejected. This saves a significant amount of time and resources that \r\nwould otherwise be used to run regression tests.</p><p></p><p></p>', 1, 69, 69, '2024-11-05 09:30:22', '2024-11-05 09:30:38');

-- --------------------------------------------------------

--
-- Table structure for table `employees`
--

CREATE TABLE `employees` (
  `id` bigint UNSIGNED NOT NULL,
  `employee_code` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `branch` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `department` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `designation` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `date_of_joining` date NOT NULL,
  `employment_status` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Active',
  `login_status` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `biometric_code` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `password` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date_of_birth` date DEFAULT NULL,
  `gender` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `profile_image` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `branch_id` bigint UNSIGNED DEFAULT NULL,
  `department_id` bigint UNSIGNED DEFAULT NULL,
  `designation_id` bigint UNSIGNED DEFAULT NULL,
  `shift_id` bigint UNSIGNED DEFAULT NULL,
  `attendance_policy_id` bigint UNSIGNED DEFAULT NULL,
  `employment_type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Full-time',
  `address_line_1` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address_line_2` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `state` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `postal_code` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `emergency_contact_name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `emergency_contact_relationship` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `emergency_contact_phone` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bank_name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `account_holder_name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `account_number` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bank_identifier_code` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bank_branch` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tax_id` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `base_salary` decimal(14,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `employee_documents`
--

CREATE TABLE `employee_documents` (
  `id` bigint UNSIGNED NOT NULL,
  `employee_id` bigint UNSIGNED NOT NULL,
  `document_type_id` bigint UNSIGNED DEFAULT NULL,
  `file_path` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiry_date` date DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint UNSIGNED NOT NULL,
  `uuid` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `failed_jobs`
--

INSERT INTO `failed_jobs` (`id`, `uuid`, `connection`, `queue`, `payload`, `exception`, `failed_at`) VALUES
(1, '778181e1-8bd2-4449-a6b7-2f59ffd9d571', 'database', 'default', '{\"uuid\":\"778181e1-8bd2-4449-a6b7-2f59ffd9d571\",\"displayName\":\"App\\\\Mail\\\\BulkEmail\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Mail\\\\SendQueuedMailable\",\"command\":\"O:34:\\\"Illuminate\\\\Mail\\\\SendQueuedMailable\\\":15:{s:8:\\\"mailable\\\";O:18:\\\"App\\\\Mail\\\\BulkEmail\\\":4:{s:7:\\\"subject\\\";s:13:\\\"Moni template\\\";s:4:\\\"body\\\";s:26:\\\"<p>Moni email template<\\/p>\\\";s:2:\\\"to\\\";a:1:{i:0;a:2:{s:4:\\\"name\\\";N;s:7:\\\"address\\\";s:18:\\\"singara(breakfast)\\\";}}s:6:\\\"mailer\\\";s:4:\\\"smtp\\\";}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:13:\\\"maxExceptions\\\";N;s:17:\\\"shouldBeEncrypted\\\";b:0;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:3:\\\"job\\\";N;}\"}}', 'Symfony\\Component\\Mime\\Exception\\RfcComplianceException: Email \"singara(breakfast)\" does not comply with addr-spec of RFC 2822. in /usr/local/apache2/htdocs/gplexCRM_resource/vendor/symfony/mime/Address.php:54\nStack trace:\n#0 /usr/local/apache2/htdocs/gplexCRM_resource/vendor/laravel/framework/src/Illuminate/Mail/Message.php(246): Symfony\\Component\\Mime\\Address->__construct()\n#1 /usr/local/apache2/htdocs/gplexCRM_resource/vendor/laravel/framework/src/Illuminate/Mail/Message.php(110): Illuminate\\Mail\\Message->addAddresses()\n#2 /usr/local/apache2/htdocs/gplexCRM_resource/vendor/laravel/framework/src/Illuminate/Mail/Mailable.php(433): Illuminate\\Mail\\Message->to()\n#3 /usr/local/apache2/htdocs/gplexCRM_resource/vendor/laravel/framework/src/Illuminate/Mail/Mailable.php(207): Illuminate\\Mail\\Mailable->buildRecipients()\n#4 /usr/local/apache2/htdocs/gplexCRM_resource/vendor/laravel/framework/src/Illuminate/Mail/Mailer.php(317): Illuminate\\Mail\\Mailable->Illuminate\\Mail\\{closure}()\n#5 /usr/local/apache2/htdocs/gplexCRM_resource/vendor/laravel/framework/src/Illuminate/Mail/Mailable.php(205): Illuminate\\Mail\\Mailer->send()\n#6 /usr/local/apache2/htdocs/gplexCRM_resource/vendor/laravel/framework/src/Illuminate/Support/Traits/Localizable.php(19): Illuminate\\Mail\\Mailable->Illuminate\\Mail\\{closure}()\n#7 /usr/local/apache2/htdocs/gplexCRM_resource/vendor/laravel/framework/src/Illuminate/Mail/Mailable.php(198): Illuminate\\Mail\\Mailable->withLocale()\n#8 /usr/local/apache2/htdocs/gplexCRM_resource/vendor/laravel/framework/src/Illuminate/Mail/SendQueuedMailable.php(83): Illuminate\\Mail\\Mailable->send()\n#9 /usr/local/apache2/htdocs/gplexCRM_resource/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(36): Illuminate\\Mail\\SendQueuedMailable->handle()\n#10 /usr/local/apache2/htdocs/gplexCRM_resource/vendor/laravel/framework/src/Illuminate/Container/Util.php(41): Illuminate\\Container\\BoundMethod::Illuminate\\Container\\{closure}()\n#11 /usr/local/apache2/htdocs/gplexCRM_resource/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(93): Illuminate\\Container\\Util::unwrapIfClosure()\n#12 /usr/local/apache2/htdocs/gplexCRM_resource/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(35): Illuminate\\Container\\BoundMethod::callBoundMethod()\n#13 /usr/local/apache2/htdocs/gplexCRM_resource/vendor/laravel/framework/src/Illuminate/Container/Container.php(662): Illuminate\\Container\\BoundMethod::call()\n#14 /usr/local/apache2/htdocs/gplexCRM_resource/vendor/laravel/framework/src/Illuminate/Bus/Dispatcher.php(128): Illuminate\\Container\\Container->call()\n#15 /usr/local/apache2/htdocs/gplexCRM_resource/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(144): Illuminate\\Bus\\Dispatcher->Illuminate\\Bus\\{closure}()\n#16 /usr/local/apache2/htdocs/gplexCRM_resource/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(119): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}()\n#17 /usr/local/apache2/htdocs/gplexCRM_resource/vendor/laravel/framework/src/Illuminate/Bus/Dispatcher.php(132): Illuminate\\Pipeline\\Pipeline->then()\n#18 /usr/local/apache2/htdocs/gplexCRM_resource/vendor/laravel/framework/src/Illuminate/Queue/CallQueuedHandler.php(123): Illuminate\\Bus\\Dispatcher->dispatchNow()\n#19 /usr/local/apache2/htdocs/gplexCRM_resource/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(144): Illuminate\\Queue\\CallQueuedHandler->Illuminate\\Queue\\{closure}()\n#20 /usr/local/apache2/htdocs/gplexCRM_resource/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(119): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}()\n#21 /usr/local/apache2/htdocs/gplexCRM_resource/vendor/laravel/framework/src/Illuminate/Queue/CallQueuedHandler.php(122): Illuminate\\Pipeline\\Pipeline->then()\n#22 /usr/local/apache2/htdocs/gplexCRM_resource/vendor/laravel/framework/src/Illuminate/Queue/CallQueuedHandler.php(70): Illuminate\\Queue\\CallQueuedHandler->dispatchThroughMiddleware()\n#23 /usr/local/apache2/htdocs/gplexCRM_resource/vendor/laravel/framework/src/Illuminate/Queue/Jobs/Job.php(102): Illuminate\\Queue\\CallQueuedHandler->call()\n#24 /usr/local/apache2/htdocs/gplexCRM_resource/vendor/laravel/framework/src/Illuminate/Queue/Worker.php(439): Illuminate\\Queue\\Jobs\\Job->fire()\n#25 /usr/local/apache2/htdocs/gplexCRM_resource/vendor/laravel/framework/src/Illuminate/Queue/Worker.php(389): Illuminate\\Queue\\Worker->process()\n#26 /usr/local/apache2/htdocs/gplexCRM_resource/vendor/laravel/framework/src/Illuminate/Queue/Worker.php(176): Illuminate\\Queue\\Worker->runJob()\n#27 /usr/local/apache2/htdocs/gplexCRM_resource/vendor/laravel/framework/src/Illuminate/Queue/Console/WorkCommand.php(137): Illuminate\\Queue\\Worker->daemon()\n#28 /usr/local/apache2/htdocs/gplexCRM_resource/vendor/laravel/framework/src/Illuminate/Queue/Console/WorkCommand.php(120): Illuminate\\Queue\\Console\\WorkCommand->runWorker()\n#29 /usr/local/apache2/htdocs/gplexCRM_resource/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(36): Illuminate\\Queue\\Console\\WorkCommand->handle()\n#30 /usr/local/apache2/htdocs/gplexCRM_resource/vendor/laravel/framework/src/Illuminate/Container/Util.php(41): Illuminate\\Container\\BoundMethod::Illuminate\\Container\\{closure}()\n#31 /usr/local/apache2/htdocs/gplexCRM_resource/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(93): Illuminate\\Container\\Util::unwrapIfClosure()\n#32 /usr/local/apache2/htdocs/gplexCRM_resource/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(35): Illuminate\\Container\\BoundMethod::callBoundMethod()\n#33 /usr/local/apache2/htdocs/gplexCRM_resource/vendor/laravel/framework/src/Illuminate/Container/Container.php(662): Illuminate\\Container\\BoundMethod::call()\n#34 /usr/local/apache2/htdocs/gplexCRM_resource/vendor/laravel/framework/src/Illuminate/Console/Command.php(211): Illuminate\\Container\\Container->call()\n#35 /usr/local/apache2/htdocs/gplexCRM_resource/vendor/symfony/console/Command/Command.php(326): Illuminate\\Console\\Command->execute()\n#36 /usr/local/apache2/htdocs/gplexCRM_resource/vendor/laravel/framework/src/Illuminate/Console/Command.php(180): Symfony\\Component\\Console\\Command\\Command->run()\n#37 /usr/local/apache2/htdocs/gplexCRM_resource/vendor/symfony/console/Application.php(1096): Illuminate\\Console\\Command->run()\n#38 /usr/local/apache2/htdocs/gplexCRM_resource/vendor/symfony/console/Application.php(324): Symfony\\Component\\Console\\Application->doRunCommand()\n#39 /usr/local/apache2/htdocs/gplexCRM_resource/vendor/symfony/console/Application.php(175): Symfony\\Component\\Console\\Application->doRun()\n#40 /usr/local/apache2/htdocs/gplexCRM_resource/vendor/laravel/framework/src/Illuminate/Foundation/Console/Kernel.php(201): Symfony\\Component\\Console\\Application->run()\n#41 /usr/local/apache2/htdocs/gplexCRM_resource/artisan(35): Illuminate\\Foundation\\Console\\Kernel->handle()\n#42 {main}', '2024-11-05 08:08:51'),
(2, '1c1146b9-867f-493c-b7af-c0a4306bc57e', 'database', 'default', '{\"uuid\":\"1c1146b9-867f-493c-b7af-c0a4306bc57e\",\"displayName\":\"App\\\\Mail\\\\BulkEmail\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Mail\\\\SendQueuedMailable\",\"command\":\"O:34:\\\"Illuminate\\\\Mail\\\\SendQueuedMailable\\\":15:{s:8:\\\"mailable\\\";O:18:\\\"App\\\\Mail\\\\BulkEmail\\\":4:{s:7:\\\"subject\\\";s:13:\\\"Moni template\\\";s:4:\\\"body\\\";s:26:\\\"<p>Moni email template<\\/p>\\\";s:2:\\\"to\\\";a:1:{i:0;a:2:{s:4:\\\"name\\\";N;s:7:\\\"address\\\";s:13:\\\"buscuit,badam\\\";}}s:6:\\\"mailer\\\";s:4:\\\"smtp\\\";}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:13:\\\"maxExceptions\\\";N;s:17:\\\"shouldBeEncrypted\\\";b:0;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:3:\\\"job\\\";N;}\"}}', 'Symfony\\Component\\Mime\\Exception\\RfcComplianceException: Email \"buscuit,badam\" does not comply with addr-spec of RFC 2822. in /usr/local/apache2/htdocs/gplexCRM_resource/vendor/symfony/mime/Address.php:54\nStack trace:\n#0 /usr/local/apache2/htdocs/gplexCRM_resource/vendor/laravel/framework/src/Illuminate/Mail/Message.php(246): Symfony\\Component\\Mime\\Address->__construct()\n#1 /usr/local/apache2/htdocs/gplexCRM_resource/vendor/laravel/framework/src/Illuminate/Mail/Message.php(110): Illuminate\\Mail\\Message->addAddresses()\n#2 /usr/local/apache2/htdocs/gplexCRM_resource/vendor/laravel/framework/src/Illuminate/Mail/Mailable.php(433): Illuminate\\Mail\\Message->to()\n#3 /usr/local/apache2/htdocs/gplexCRM_resource/vendor/laravel/framework/src/Illuminate/Mail/Mailable.php(207): Illuminate\\Mail\\Mailable->buildRecipients()\n#4 /usr/local/apache2/htdocs/gplexCRM_resource/vendor/laravel/framework/src/Illuminate/Mail/Mailer.php(317): Illuminate\\Mail\\Mailable->Illuminate\\Mail\\{closure}()\n#5 /usr/local/apache2/htdocs/gplexCRM_resource/vendor/laravel/framework/src/Illuminate/Mail/Mailable.php(205): Illuminate\\Mail\\Mailer->send()\n#6 /usr/local/apache2/htdocs/gplexCRM_resource/vendor/laravel/framework/src/Illuminate/Support/Traits/Localizable.php(19): Illuminate\\Mail\\Mailable->Illuminate\\Mail\\{closure}()\n#7 /usr/local/apache2/htdocs/gplexCRM_resource/vendor/laravel/framework/src/Illuminate/Mail/Mailable.php(198): Illuminate\\Mail\\Mailable->withLocale()\n#8 /usr/local/apache2/htdocs/gplexCRM_resource/vendor/laravel/framework/src/Illuminate/Mail/SendQueuedMailable.php(83): Illuminate\\Mail\\Mailable->send()\n#9 /usr/local/apache2/htdocs/gplexCRM_resource/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(36): Illuminate\\Mail\\SendQueuedMailable->handle()\n#10 /usr/local/apache2/htdocs/gplexCRM_resource/vendor/laravel/framework/src/Illuminate/Container/Util.php(41): Illuminate\\Container\\BoundMethod::Illuminate\\Container\\{closure}()\n#11 /usr/local/apache2/htdocs/gplexCRM_resource/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(93): Illuminate\\Container\\Util::unwrapIfClosure()\n#12 /usr/local/apache2/htdocs/gplexCRM_resource/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(35): Illuminate\\Container\\BoundMethod::callBoundMethod()\n#13 /usr/local/apache2/htdocs/gplexCRM_resource/vendor/laravel/framework/src/Illuminate/Container/Container.php(662): Illuminate\\Container\\BoundMethod::call()\n#14 /usr/local/apache2/htdocs/gplexCRM_resource/vendor/laravel/framework/src/Illuminate/Bus/Dispatcher.php(128): Illuminate\\Container\\Container->call()\n#15 /usr/local/apache2/htdocs/gplexCRM_resource/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(144): Illuminate\\Bus\\Dispatcher->Illuminate\\Bus\\{closure}()\n#16 /usr/local/apache2/htdocs/gplexCRM_resource/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(119): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}()\n#17 /usr/local/apache2/htdocs/gplexCRM_resource/vendor/laravel/framework/src/Illuminate/Bus/Dispatcher.php(132): Illuminate\\Pipeline\\Pipeline->then()\n#18 /usr/local/apache2/htdocs/gplexCRM_resource/vendor/laravel/framework/src/Illuminate/Queue/CallQueuedHandler.php(123): Illuminate\\Bus\\Dispatcher->dispatchNow()\n#19 /usr/local/apache2/htdocs/gplexCRM_resource/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(144): Illuminate\\Queue\\CallQueuedHandler->Illuminate\\Queue\\{closure}()\n#20 /usr/local/apache2/htdocs/gplexCRM_resource/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(119): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}()\n#21 /usr/local/apache2/htdocs/gplexCRM_resource/vendor/laravel/framework/src/Illuminate/Queue/CallQueuedHandler.php(122): Illuminate\\Pipeline\\Pipeline->then()\n#22 /usr/local/apache2/htdocs/gplexCRM_resource/vendor/laravel/framework/src/Illuminate/Queue/CallQueuedHandler.php(70): Illuminate\\Queue\\CallQueuedHandler->dispatchThroughMiddleware()\n#23 /usr/local/apache2/htdocs/gplexCRM_resource/vendor/laravel/framework/src/Illuminate/Queue/Jobs/Job.php(102): Illuminate\\Queue\\CallQueuedHandler->call()\n#24 /usr/local/apache2/htdocs/gplexCRM_resource/vendor/laravel/framework/src/Illuminate/Queue/Worker.php(439): Illuminate\\Queue\\Jobs\\Job->fire()\n#25 /usr/local/apache2/htdocs/gplexCRM_resource/vendor/laravel/framework/src/Illuminate/Queue/Worker.php(389): Illuminate\\Queue\\Worker->process()\n#26 /usr/local/apache2/htdocs/gplexCRM_resource/vendor/laravel/framework/src/Illuminate/Queue/Worker.php(176): Illuminate\\Queue\\Worker->runJob()\n#27 /usr/local/apache2/htdocs/gplexCRM_resource/vendor/laravel/framework/src/Illuminate/Queue/Console/WorkCommand.php(137): Illuminate\\Queue\\Worker->daemon()\n#28 /usr/local/apache2/htdocs/gplexCRM_resource/vendor/laravel/framework/src/Illuminate/Queue/Console/WorkCommand.php(120): Illuminate\\Queue\\Console\\WorkCommand->runWorker()\n#29 /usr/local/apache2/htdocs/gplexCRM_resource/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(36): Illuminate\\Queue\\Console\\WorkCommand->handle()\n#30 /usr/local/apache2/htdocs/gplexCRM_resource/vendor/laravel/framework/src/Illuminate/Container/Util.php(41): Illuminate\\Container\\BoundMethod::Illuminate\\Container\\{closure}()\n#31 /usr/local/apache2/htdocs/gplexCRM_resource/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(93): Illuminate\\Container\\Util::unwrapIfClosure()\n#32 /usr/local/apache2/htdocs/gplexCRM_resource/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(35): Illuminate\\Container\\BoundMethod::callBoundMethod()\n#33 /usr/local/apache2/htdocs/gplexCRM_resource/vendor/laravel/framework/src/Illuminate/Container/Container.php(662): Illuminate\\Container\\BoundMethod::call()\n#34 /usr/local/apache2/htdocs/gplexCRM_resource/vendor/laravel/framework/src/Illuminate/Console/Command.php(211): Illuminate\\Container\\Container->call()\n#35 /usr/local/apache2/htdocs/gplexCRM_resource/vendor/symfony/console/Command/Command.php(326): Illuminate\\Console\\Command->execute()\n#36 /usr/local/apache2/htdocs/gplexCRM_resource/vendor/laravel/framework/src/Illuminate/Console/Command.php(180): Symfony\\Component\\Console\\Command\\Command->run()\n#37 /usr/local/apache2/htdocs/gplexCRM_resource/vendor/symfony/console/Application.php(1096): Illuminate\\Console\\Command->run()\n#38 /usr/local/apache2/htdocs/gplexCRM_resource/vendor/symfony/console/Application.php(324): Symfony\\Component\\Console\\Application->doRunCommand()\n#39 /usr/local/apache2/htdocs/gplexCRM_resource/vendor/symfony/console/Application.php(175): Symfony\\Component\\Console\\Application->doRun()\n#40 /usr/local/apache2/htdocs/gplexCRM_resource/vendor/laravel/framework/src/Illuminate/Foundation/Console/Kernel.php(201): Symfony\\Component\\Console\\Application->run()\n#41 /usr/local/apache2/htdocs/gplexCRM_resource/artisan(35): Illuminate\\Foundation\\Console\\Kernel->handle()\n#42 {main}', '2024-11-05 08:08:51'),
(3, '4495fef4-1d28-427e-8126-815a9a984ffb', 'database', 'default', '{\"uuid\":\"4495fef4-1d28-427e-8126-815a9a984ffb\",\"displayName\":\"App\\\\Mail\\\\BulkEmail\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Mail\\\\SendQueuedMailable\",\"command\":\"O:34:\\\"Illuminate\\\\Mail\\\\SendQueuedMailable\\\":15:{s:8:\\\"mailable\\\";O:18:\\\"App\\\\Mail\\\\BulkEmail\\\":4:{s:7:\\\"subject\\\";s:13:\\\"Moni template\\\";s:4:\\\"body\\\";s:26:\\\"<p>Moni email template<\\/p>\\\";s:2:\\\"to\\\";a:1:{i:0;a:2:{s:4:\\\"name\\\";N;s:7:\\\"address\\\";s:18:\\\"singara(breakfast)\\\";}}s:6:\\\"mailer\\\";s:4:\\\"smtp\\\";}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:13:\\\"maxExceptions\\\";N;s:17:\\\"shouldBeEncrypted\\\";b:0;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:3:\\\"job\\\";N;}\"}}', 'Symfony\\Component\\Mime\\Exception\\RfcComplianceException: Email \"singara(breakfast)\" does not comply with addr-spec of RFC 2822. in /usr/local/apache2/htdocs/gplexCRM_resource/vendor/symfony/mime/Address.php:54\nStack trace:\n#0 /usr/local/apache2/htdocs/gplexCRM_resource/vendor/laravel/framework/src/Illuminate/Mail/Message.php(246): Symfony\\Component\\Mime\\Address->__construct()\n#1 /usr/local/apache2/htdocs/gplexCRM_resource/vendor/laravel/framework/src/Illuminate/Mail/Message.php(110): Illuminate\\Mail\\Message->addAddresses()\n#2 /usr/local/apache2/htdocs/gplexCRM_resource/vendor/laravel/framework/src/Illuminate/Mail/Mailable.php(433): Illuminate\\Mail\\Message->to()\n#3 /usr/local/apache2/htdocs/gplexCRM_resource/vendor/laravel/framework/src/Illuminate/Mail/Mailable.php(207): Illuminate\\Mail\\Mailable->buildRecipients()\n#4 /usr/local/apache2/htdocs/gplexCRM_resource/vendor/laravel/framework/src/Illuminate/Mail/Mailer.php(317): Illuminate\\Mail\\Mailable->Illuminate\\Mail\\{closure}()\n#5 /usr/local/apache2/htdocs/gplexCRM_resource/vendor/laravel/framework/src/Illuminate/Mail/Mailable.php(205): Illuminate\\Mail\\Mailer->send()\n#6 /usr/local/apache2/htdocs/gplexCRM_resource/vendor/laravel/framework/src/Illuminate/Support/Traits/Localizable.php(19): Illuminate\\Mail\\Mailable->Illuminate\\Mail\\{closure}()\n#7 /usr/local/apache2/htdocs/gplexCRM_resource/vendor/laravel/framework/src/Illuminate/Mail/Mailable.php(198): Illuminate\\Mail\\Mailable->withLocale()\n#8 /usr/local/apache2/htdocs/gplexCRM_resource/vendor/laravel/framework/src/Illuminate/Mail/SendQueuedMailable.php(83): Illuminate\\Mail\\Mailable->send()\n#9 /usr/local/apache2/htdocs/gplexCRM_resource/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(36): Illuminate\\Mail\\SendQueuedMailable->handle()\n#10 /usr/local/apache2/htdocs/gplexCRM_resource/vendor/laravel/framework/src/Illuminate/Container/Util.php(41): Illuminate\\Container\\BoundMethod::Illuminate\\Container\\{closure}()\n#11 /usr/local/apache2/htdocs/gplexCRM_resource/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(93): Illuminate\\Container\\Util::unwrapIfClosure()\n#12 /usr/local/apache2/htdocs/gplexCRM_resource/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(35): Illuminate\\Container\\BoundMethod::callBoundMethod()\n#13 /usr/local/apache2/htdocs/gplexCRM_resource/vendor/laravel/framework/src/Illuminate/Container/Container.php(662): Illuminate\\Container\\BoundMethod::call()\n#14 /usr/local/apache2/htdocs/gplexCRM_resource/vendor/laravel/framework/src/Illuminate/Bus/Dispatcher.php(128): Illuminate\\Container\\Container->call()\n#15 /usr/local/apache2/htdocs/gplexCRM_resource/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(144): Illuminate\\Bus\\Dispatcher->Illuminate\\Bus\\{closure}()\n#16 /usr/local/apache2/htdocs/gplexCRM_resource/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(119): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}()\n#17 /usr/local/apache2/htdocs/gplexCRM_resource/vendor/laravel/framework/src/Illuminate/Bus/Dispatcher.php(132): Illuminate\\Pipeline\\Pipeline->then()\n#18 /usr/local/apache2/htdocs/gplexCRM_resource/vendor/laravel/framework/src/Illuminate/Queue/CallQueuedHandler.php(123): Illuminate\\Bus\\Dispatcher->dispatchNow()\n#19 /usr/local/apache2/htdocs/gplexCRM_resource/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(144): Illuminate\\Queue\\CallQueuedHandler->Illuminate\\Queue\\{closure}()\n#20 /usr/local/apache2/htdocs/gplexCRM_resource/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(119): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}()\n#21 /usr/local/apache2/htdocs/gplexCRM_resource/vendor/laravel/framework/src/Illuminate/Queue/CallQueuedHandler.php(122): Illuminate\\Pipeline\\Pipeline->then()\n#22 /usr/local/apache2/htdocs/gplexCRM_resource/vendor/laravel/framework/src/Illuminate/Queue/CallQueuedHandler.php(70): Illuminate\\Queue\\CallQueuedHandler->dispatchThroughMiddleware()\n#23 /usr/local/apache2/htdocs/gplexCRM_resource/vendor/laravel/framework/src/Illuminate/Queue/Jobs/Job.php(102): Illuminate\\Queue\\CallQueuedHandler->call()\n#24 /usr/local/apache2/htdocs/gplexCRM_resource/vendor/laravel/framework/src/Illuminate/Queue/Worker.php(439): Illuminate\\Queue\\Jobs\\Job->fire()\n#25 /usr/local/apache2/htdocs/gplexCRM_resource/vendor/laravel/framework/src/Illuminate/Queue/Worker.php(389): Illuminate\\Queue\\Worker->process()\n#26 /usr/local/apache2/htdocs/gplexCRM_resource/vendor/laravel/framework/src/Illuminate/Queue/Worker.php(176): Illuminate\\Queue\\Worker->runJob()\n#27 /usr/local/apache2/htdocs/gplexCRM_resource/vendor/laravel/framework/src/Illuminate/Queue/Console/WorkCommand.php(137): Illuminate\\Queue\\Worker->daemon()\n#28 /usr/local/apache2/htdocs/gplexCRM_resource/vendor/laravel/framework/src/Illuminate/Queue/Console/WorkCommand.php(120): Illuminate\\Queue\\Console\\WorkCommand->runWorker()\n#29 /usr/local/apache2/htdocs/gplexCRM_resource/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(36): Illuminate\\Queue\\Console\\WorkCommand->handle()\n#30 /usr/local/apache2/htdocs/gplexCRM_resource/vendor/laravel/framework/src/Illuminate/Container/Util.php(41): Illuminate\\Container\\BoundMethod::Illuminate\\Container\\{closure}()\n#31 /usr/local/apache2/htdocs/gplexCRM_resource/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(93): Illuminate\\Container\\Util::unwrapIfClosure()\n#32 /usr/local/apache2/htdocs/gplexCRM_resource/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(35): Illuminate\\Container\\BoundMethod::callBoundMethod()\n#33 /usr/local/apache2/htdocs/gplexCRM_resource/vendor/laravel/framework/src/Illuminate/Container/Container.php(662): Illuminate\\Container\\BoundMethod::call()\n#34 /usr/local/apache2/htdocs/gplexCRM_resource/vendor/laravel/framework/src/Illuminate/Console/Command.php(211): Illuminate\\Container\\Container->call()\n#35 /usr/local/apache2/htdocs/gplexCRM_resource/vendor/symfony/console/Command/Command.php(326): Illuminate\\Console\\Command->execute()\n#36 /usr/local/apache2/htdocs/gplexCRM_resource/vendor/laravel/framework/src/Illuminate/Console/Command.php(180): Symfony\\Component\\Console\\Command\\Command->run()\n#37 /usr/local/apache2/htdocs/gplexCRM_resource/vendor/symfony/console/Application.php(1096): Illuminate\\Console\\Command->run()\n#38 /usr/local/apache2/htdocs/gplexCRM_resource/vendor/symfony/console/Application.php(324): Symfony\\Component\\Console\\Application->doRunCommand()\n#39 /usr/local/apache2/htdocs/gplexCRM_resource/vendor/symfony/console/Application.php(175): Symfony\\Component\\Console\\Application->doRun()\n#40 /usr/local/apache2/htdocs/gplexCRM_resource/vendor/laravel/framework/src/Illuminate/Foundation/Console/Kernel.php(201): Symfony\\Component\\Console\\Application->run()\n#41 /usr/local/apache2/htdocs/gplexCRM_resource/artisan(35): Illuminate\\Foundation\\Console\\Kernel->handle()\n#42 {main}', '2024-11-05 08:08:51'),
(4, '7ecc1aff-3bb5-4150-8048-54ce88e6e2f0', 'database', 'default', '{\"uuid\":\"7ecc1aff-3bb5-4150-8048-54ce88e6e2f0\",\"displayName\":\"App\\\\Mail\\\\BulkEmail\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Mail\\\\SendQueuedMailable\",\"command\":\"O:34:\\\"Illuminate\\\\Mail\\\\SendQueuedMailable\\\":15:{s:8:\\\"mailable\\\";O:18:\\\"App\\\\Mail\\\\BulkEmail\\\":4:{s:7:\\\"subject\\\";s:13:\\\"Moni template\\\";s:4:\\\"body\\\";s:26:\\\"<p>Moni email template<\\/p>\\\";s:2:\\\"to\\\";a:1:{i:0;a:2:{s:4:\\\"name\\\";N;s:7:\\\"address\\\";s:9:\\\"ice cream\\\";}}s:6:\\\"mailer\\\";s:4:\\\"smtp\\\";}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:13:\\\"maxExceptions\\\";N;s:17:\\\"shouldBeEncrypted\\\";b:0;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:3:\\\"job\\\";N;}\"}}', 'Symfony\\Component\\Mime\\Exception\\RfcComplianceException: Email \"ice cream\" does not comply with addr-spec of RFC 2822. in /usr/local/apache2/htdocs/gplexCRM_resource/vendor/symfony/mime/Address.php:54\nStack trace:\n#0 /usr/local/apache2/htdocs/gplexCRM_resource/vendor/laravel/framework/src/Illuminate/Mail/Message.php(246): Symfony\\Component\\Mime\\Address->__construct()\n#1 /usr/local/apache2/htdocs/gplexCRM_resource/vendor/laravel/framework/src/Illuminate/Mail/Message.php(110): Illuminate\\Mail\\Message->addAddresses()\n#2 /usr/local/apache2/htdocs/gplexCRM_resource/vendor/laravel/framework/src/Illuminate/Mail/Mailable.php(433): Illuminate\\Mail\\Message->to()\n#3 /usr/local/apache2/htdocs/gplexCRM_resource/vendor/laravel/framework/src/Illuminate/Mail/Mailable.php(207): Illuminate\\Mail\\Mailable->buildRecipients()\n#4 /usr/local/apache2/htdocs/gplexCRM_resource/vendor/laravel/framework/src/Illuminate/Mail/Mailer.php(317): Illuminate\\Mail\\Mailable->Illuminate\\Mail\\{closure}()\n#5 /usr/local/apache2/htdocs/gplexCRM_resource/vendor/laravel/framework/src/Illuminate/Mail/Mailable.php(205): Illuminate\\Mail\\Mailer->send()\n#6 /usr/local/apache2/htdocs/gplexCRM_resource/vendor/laravel/framework/src/Illuminate/Support/Traits/Localizable.php(19): Illuminate\\Mail\\Mailable->Illuminate\\Mail\\{closure}()\n#7 /usr/local/apache2/htdocs/gplexCRM_resource/vendor/laravel/framework/src/Illuminate/Mail/Mailable.php(198): Illuminate\\Mail\\Mailable->withLocale()\n#8 /usr/local/apache2/htdocs/gplexCRM_resource/vendor/laravel/framework/src/Illuminate/Mail/SendQueuedMailable.php(83): Illuminate\\Mail\\Mailable->send()\n#9 /usr/local/apache2/htdocs/gplexCRM_resource/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(36): Illuminate\\Mail\\SendQueuedMailable->handle()\n#10 /usr/local/apache2/htdocs/gplexCRM_resource/vendor/laravel/framework/src/Illuminate/Container/Util.php(41): Illuminate\\Container\\BoundMethod::Illuminate\\Container\\{closure}()\n#11 /usr/local/apache2/htdocs/gplexCRM_resource/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(93): Illuminate\\Container\\Util::unwrapIfClosure()\n#12 /usr/local/apache2/htdocs/gplexCRM_resource/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(35): Illuminate\\Container\\BoundMethod::callBoundMethod()\n#13 /usr/local/apache2/htdocs/gplexCRM_resource/vendor/laravel/framework/src/Illuminate/Container/Container.php(662): Illuminate\\Container\\BoundMethod::call()\n#14 /usr/local/apache2/htdocs/gplexCRM_resource/vendor/laravel/framework/src/Illuminate/Bus/Dispatcher.php(128): Illuminate\\Container\\Container->call()\n#15 /usr/local/apache2/htdocs/gplexCRM_resource/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(144): Illuminate\\Bus\\Dispatcher->Illuminate\\Bus\\{closure}()\n#16 /usr/local/apache2/htdocs/gplexCRM_resource/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(119): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}()\n#17 /usr/local/apache2/htdocs/gplexCRM_resource/vendor/laravel/framework/src/Illuminate/Bus/Dispatcher.php(132): Illuminate\\Pipeline\\Pipeline->then()\n#18 /usr/local/apache2/htdocs/gplexCRM_resource/vendor/laravel/framework/src/Illuminate/Queue/CallQueuedHandler.php(123): Illuminate\\Bus\\Dispatcher->dispatchNow()\n#19 /usr/local/apache2/htdocs/gplexCRM_resource/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(144): Illuminate\\Queue\\CallQueuedHandler->Illuminate\\Queue\\{closure}()\n#20 /usr/local/apache2/htdocs/gplexCRM_resource/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(119): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}()\n#21 /usr/local/apache2/htdocs/gplexCRM_resource/vendor/laravel/framework/src/Illuminate/Queue/CallQueuedHandler.php(122): Illuminate\\Pipeline\\Pipeline->then()\n#22 /usr/local/apache2/htdocs/gplexCRM_resource/vendor/laravel/framework/src/Illuminate/Queue/CallQueuedHandler.php(70): Illuminate\\Queue\\CallQueuedHandler->dispatchThroughMiddleware()\n#23 /usr/local/apache2/htdocs/gplexCRM_resource/vendor/laravel/framework/src/Illuminate/Queue/Jobs/Job.php(102): Illuminate\\Queue\\CallQueuedHandler->call()\n#24 /usr/local/apache2/htdocs/gplexCRM_resource/vendor/laravel/framework/src/Illuminate/Queue/Worker.php(439): Illuminate\\Queue\\Jobs\\Job->fire()\n#25 /usr/local/apache2/htdocs/gplexCRM_resource/vendor/laravel/framework/src/Illuminate/Queue/Worker.php(389): Illuminate\\Queue\\Worker->process()\n#26 /usr/local/apache2/htdocs/gplexCRM_resource/vendor/laravel/framework/src/Illuminate/Queue/Worker.php(176): Illuminate\\Queue\\Worker->runJob()\n#27 /usr/local/apache2/htdocs/gplexCRM_resource/vendor/laravel/framework/src/Illuminate/Queue/Console/WorkCommand.php(137): Illuminate\\Queue\\Worker->daemon()\n#28 /usr/local/apache2/htdocs/gplexCRM_resource/vendor/laravel/framework/src/Illuminate/Queue/Console/WorkCommand.php(120): Illuminate\\Queue\\Console\\WorkCommand->runWorker()\n#29 /usr/local/apache2/htdocs/gplexCRM_resource/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(36): Illuminate\\Queue\\Console\\WorkCommand->handle()\n#30 /usr/local/apache2/htdocs/gplexCRM_resource/vendor/laravel/framework/src/Illuminate/Container/Util.php(41): Illuminate\\Container\\BoundMethod::Illuminate\\Container\\{closure}()\n#31 /usr/local/apache2/htdocs/gplexCRM_resource/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(93): Illuminate\\Container\\Util::unwrapIfClosure()\n#32 /usr/local/apache2/htdocs/gplexCRM_resource/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(35): Illuminate\\Container\\BoundMethod::callBoundMethod()\n#33 /usr/local/apache2/htdocs/gplexCRM_resource/vendor/laravel/framework/src/Illuminate/Container/Container.php(662): Illuminate\\Container\\BoundMethod::call()\n#34 /usr/local/apache2/htdocs/gplexCRM_resource/vendor/laravel/framework/src/Illuminate/Console/Command.php(211): Illuminate\\Container\\Container->call()\n#35 /usr/local/apache2/htdocs/gplexCRM_resource/vendor/symfony/console/Command/Command.php(326): Illuminate\\Console\\Command->execute()\n#36 /usr/local/apache2/htdocs/gplexCRM_resource/vendor/laravel/framework/src/Illuminate/Console/Command.php(180): Symfony\\Component\\Console\\Command\\Command->run()\n#37 /usr/local/apache2/htdocs/gplexCRM_resource/vendor/symfony/console/Application.php(1096): Illuminate\\Console\\Command->run()\n#38 /usr/local/apache2/htdocs/gplexCRM_resource/vendor/symfony/console/Application.php(324): Symfony\\Component\\Console\\Application->doRunCommand()\n#39 /usr/local/apache2/htdocs/gplexCRM_resource/vendor/symfony/console/Application.php(175): Symfony\\Component\\Console\\Application->doRun()\n#40 /usr/local/apache2/htdocs/gplexCRM_resource/vendor/laravel/framework/src/Illuminate/Foundation/Console/Kernel.php(201): Symfony\\Component\\Console\\Application->run()\n#41 /usr/local/apache2/htdocs/gplexCRM_resource/artisan(35): Illuminate\\Foundation\\Console\\Kernel->handle()\n#42 {main}', '2024-11-05 08:08:51'),
(5, 'f814b60b-5c06-43de-a48e-513e174092e4', 'database', 'default', '{\"uuid\":\"f814b60b-5c06-43de-a48e-513e174092e4\",\"displayName\":\"App\\\\Mail\\\\BulkEmail\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Mail\\\\SendQueuedMailable\",\"command\":\"O:34:\\\"Illuminate\\\\Mail\\\\SendQueuedMailable\\\":15:{s:8:\\\"mailable\\\";O:18:\\\"App\\\\Mail\\\\BulkEmail\\\":4:{s:7:\\\"subject\\\";s:13:\\\"Moni template\\\";s:4:\\\"body\\\";s:26:\\\"<p>Moni email template<\\/p>\\\";s:2:\\\"to\\\";a:1:{i:0;a:2:{s:4:\\\"name\\\";N;s:7:\\\"address\\\";s:19:\\\"labang,borhani,mojo\\\";}}s:6:\\\"mailer\\\";s:4:\\\"smtp\\\";}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:13:\\\"maxExceptions\\\";N;s:17:\\\"shouldBeEncrypted\\\";b:0;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:3:\\\"job\\\";N;}\"}}', 'Symfony\\Component\\Mime\\Exception\\RfcComplianceException: Email \"labang,borhani,mojo\" does not comply with addr-spec of RFC 2822. in /usr/local/apache2/htdocs/gplexCRM_resource/vendor/symfony/mime/Address.php:54\nStack trace:\n#0 /usr/local/apache2/htdocs/gplexCRM_resource/vendor/laravel/framework/src/Illuminate/Mail/Message.php(246): Symfony\\Component\\Mime\\Address->__construct()\n#1 /usr/local/apache2/htdocs/gplexCRM_resource/vendor/laravel/framework/src/Illuminate/Mail/Message.php(110): Illuminate\\Mail\\Message->addAddresses()\n#2 /usr/local/apache2/htdocs/gplexCRM_resource/vendor/laravel/framework/src/Illuminate/Mail/Mailable.php(433): Illuminate\\Mail\\Message->to()\n#3 /usr/local/apache2/htdocs/gplexCRM_resource/vendor/laravel/framework/src/Illuminate/Mail/Mailable.php(207): Illuminate\\Mail\\Mailable->buildRecipients()\n#4 /usr/local/apache2/htdocs/gplexCRM_resource/vendor/laravel/framework/src/Illuminate/Mail/Mailer.php(317): Illuminate\\Mail\\Mailable->Illuminate\\Mail\\{closure}()\n#5 /usr/local/apache2/htdocs/gplexCRM_resource/vendor/laravel/framework/src/Illuminate/Mail/Mailable.php(205): Illuminate\\Mail\\Mailer->send()\n#6 /usr/local/apache2/htdocs/gplexCRM_resource/vendor/laravel/framework/src/Illuminate/Support/Traits/Localizable.php(19): Illuminate\\Mail\\Mailable->Illuminate\\Mail\\{closure}()\n#7 /usr/local/apache2/htdocs/gplexCRM_resource/vendor/laravel/framework/src/Illuminate/Mail/Mailable.php(198): Illuminate\\Mail\\Mailable->withLocale()\n#8 /usr/local/apache2/htdocs/gplexCRM_resource/vendor/laravel/framework/src/Illuminate/Mail/SendQueuedMailable.php(83): Illuminate\\Mail\\Mailable->send()\n#9 /usr/local/apache2/htdocs/gplexCRM_resource/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(36): Illuminate\\Mail\\SendQueuedMailable->handle()\n#10 /usr/local/apache2/htdocs/gplexCRM_resource/vendor/laravel/framework/src/Illuminate/Container/Util.php(41): Illuminate\\Container\\BoundMethod::Illuminate\\Container\\{closure}()\n#11 /usr/local/apache2/htdocs/gplexCRM_resource/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(93): Illuminate\\Container\\Util::unwrapIfClosure()\n#12 /usr/local/apache2/htdocs/gplexCRM_resource/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(35): Illuminate\\Container\\BoundMethod::callBoundMethod()\n#13 /usr/local/apache2/htdocs/gplexCRM_resource/vendor/laravel/framework/src/Illuminate/Container/Container.php(662): Illuminate\\Container\\BoundMethod::call()\n#14 /usr/local/apache2/htdocs/gplexCRM_resource/vendor/laravel/framework/src/Illuminate/Bus/Dispatcher.php(128): Illuminate\\Container\\Container->call()\n#15 /usr/local/apache2/htdocs/gplexCRM_resource/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(144): Illuminate\\Bus\\Dispatcher->Illuminate\\Bus\\{closure}()\n#16 /usr/local/apache2/htdocs/gplexCRM_resource/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(119): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}()\n#17 /usr/local/apache2/htdocs/gplexCRM_resource/vendor/laravel/framework/src/Illuminate/Bus/Dispatcher.php(132): Illuminate\\Pipeline\\Pipeline->then()\n#18 /usr/local/apache2/htdocs/gplexCRM_resource/vendor/laravel/framework/src/Illuminate/Queue/CallQueuedHandler.php(123): Illuminate\\Bus\\Dispatcher->dispatchNow()\n#19 /usr/local/apache2/htdocs/gplexCRM_resource/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(144): Illuminate\\Queue\\CallQueuedHandler->Illuminate\\Queue\\{closure}()\n#20 /usr/local/apache2/htdocs/gplexCRM_resource/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(119): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}()\n#21 /usr/local/apache2/htdocs/gplexCRM_resource/vendor/laravel/framework/src/Illuminate/Queue/CallQueuedHandler.php(122): Illuminate\\Pipeline\\Pipeline->then()\n#22 /usr/local/apache2/htdocs/gplexCRM_resource/vendor/laravel/framework/src/Illuminate/Queue/CallQueuedHandler.php(70): Illuminate\\Queue\\CallQueuedHandler->dispatchThroughMiddleware()\n#23 /usr/local/apache2/htdocs/gplexCRM_resource/vendor/laravel/framework/src/Illuminate/Queue/Jobs/Job.php(102): Illuminate\\Queue\\CallQueuedHandler->call()\n#24 /usr/local/apache2/htdocs/gplexCRM_resource/vendor/laravel/framework/src/Illuminate/Queue/Worker.php(439): Illuminate\\Queue\\Jobs\\Job->fire()\n#25 /usr/local/apache2/htdocs/gplexCRM_resource/vendor/laravel/framework/src/Illuminate/Queue/Worker.php(389): Illuminate\\Queue\\Worker->process()\n#26 /usr/local/apache2/htdocs/gplexCRM_resource/vendor/laravel/framework/src/Illuminate/Queue/Worker.php(176): Illuminate\\Queue\\Worker->runJob()\n#27 /usr/local/apache2/htdocs/gplexCRM_resource/vendor/laravel/framework/src/Illuminate/Queue/Console/WorkCommand.php(137): Illuminate\\Queue\\Worker->daemon()\n#28 /usr/local/apache2/htdocs/gplexCRM_resource/vendor/laravel/framework/src/Illuminate/Queue/Console/WorkCommand.php(120): Illuminate\\Queue\\Console\\WorkCommand->runWorker()\n#29 /usr/local/apache2/htdocs/gplexCRM_resource/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(36): Illuminate\\Queue\\Console\\WorkCommand->handle()\n#30 /usr/local/apache2/htdocs/gplexCRM_resource/vendor/laravel/framework/src/Illuminate/Container/Util.php(41): Illuminate\\Container\\BoundMethod::Illuminate\\Container\\{closure}()\n#31 /usr/local/apache2/htdocs/gplexCRM_resource/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(93): Illuminate\\Container\\Util::unwrapIfClosure()\n#32 /usr/local/apache2/htdocs/gplexCRM_resource/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(35): Illuminate\\Container\\BoundMethod::callBoundMethod()\n#33 /usr/local/apache2/htdocs/gplexCRM_resource/vendor/laravel/framework/src/Illuminate/Container/Container.php(662): Illuminate\\Container\\BoundMethod::call()\n#34 /usr/local/apache2/htdocs/gplexCRM_resource/vendor/laravel/framework/src/Illuminate/Console/Command.php(211): Illuminate\\Container\\Container->call()\n#35 /usr/local/apache2/htdocs/gplexCRM_resource/vendor/symfony/console/Command/Command.php(326): Illuminate\\Console\\Command->execute()\n#36 /usr/local/apache2/htdocs/gplexCRM_resource/vendor/laravel/framework/src/Illuminate/Console/Command.php(180): Symfony\\Component\\Console\\Command\\Command->run()\n#37 /usr/local/apache2/htdocs/gplexCRM_resource/vendor/symfony/console/Application.php(1096): Illuminate\\Console\\Command->run()\n#38 /usr/local/apache2/htdocs/gplexCRM_resource/vendor/symfony/console/Application.php(324): Symfony\\Component\\Console\\Application->doRunCommand()\n#39 /usr/local/apache2/htdocs/gplexCRM_resource/vendor/symfony/console/Application.php(175): Symfony\\Component\\Console\\Application->doRun()\n#40 /usr/local/apache2/htdocs/gplexCRM_resource/vendor/laravel/framework/src/Illuminate/Foundation/Console/Kernel.php(201): Symfony\\Component\\Console\\Application->run()\n#41 /usr/local/apache2/htdocs/gplexCRM_resource/artisan(35): Illuminate\\Foundation\\Console\\Kernel->handle()\n#42 {main}', '2024-11-05 08:08:51'),
(6, '225088b6-a74f-4bb2-945e-fbf831aa33b8', 'database', 'default', '{\"uuid\":\"225088b6-a74f-4bb2-945e-fbf831aa33b8\",\"displayName\":\"App\\\\Mail\\\\BulkEmail\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Mail\\\\SendQueuedMailable\",\"command\":\"O:34:\\\"Illuminate\\\\Mail\\\\SendQueuedMailable\\\":15:{s:8:\\\"mailable\\\";O:18:\\\"App\\\\Mail\\\\BulkEmail\\\":4:{s:7:\\\"subject\\\";s:13:\\\"Moni template\\\";s:4:\\\"body\\\";s:26:\\\"<p>Moni email template<\\/p>\\\";s:2:\\\"to\\\";a:1:{i:0;a:2:{s:4:\\\"name\\\";N;s:7:\\\"address\\\";s:14:\\\"peyara,kasundi\\\";}}s:6:\\\"mailer\\\";s:4:\\\"smtp\\\";}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:13:\\\"maxExceptions\\\";N;s:17:\\\"shouldBeEncrypted\\\";b:0;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:3:\\\"job\\\";N;}\"}}', 'Symfony\\Component\\Mime\\Exception\\RfcComplianceException: Email \"peyara,kasundi\" does not comply with addr-spec of RFC 2822. in /usr/local/apache2/htdocs/gplexCRM_resource/vendor/symfony/mime/Address.php:54\nStack trace:\n#0 /usr/local/apache2/htdocs/gplexCRM_resource/vendor/laravel/framework/src/Illuminate/Mail/Message.php(246): Symfony\\Component\\Mime\\Address->__construct()\n#1 /usr/local/apache2/htdocs/gplexCRM_resource/vendor/laravel/framework/src/Illuminate/Mail/Message.php(110): Illuminate\\Mail\\Message->addAddresses()\n#2 /usr/local/apache2/htdocs/gplexCRM_resource/vendor/laravel/framework/src/Illuminate/Mail/Mailable.php(433): Illuminate\\Mail\\Message->to()\n#3 /usr/local/apache2/htdocs/gplexCRM_resource/vendor/laravel/framework/src/Illuminate/Mail/Mailable.php(207): Illuminate\\Mail\\Mailable->buildRecipients()\n#4 /usr/local/apache2/htdocs/gplexCRM_resource/vendor/laravel/framework/src/Illuminate/Mail/Mailer.php(317): Illuminate\\Mail\\Mailable->Illuminate\\Mail\\{closure}()\n#5 /usr/local/apache2/htdocs/gplexCRM_resource/vendor/laravel/framework/src/Illuminate/Mail/Mailable.php(205): Illuminate\\Mail\\Mailer->send()\n#6 /usr/local/apache2/htdocs/gplexCRM_resource/vendor/laravel/framework/src/Illuminate/Support/Traits/Localizable.php(19): Illuminate\\Mail\\Mailable->Illuminate\\Mail\\{closure}()\n#7 /usr/local/apache2/htdocs/gplexCRM_resource/vendor/laravel/framework/src/Illuminate/Mail/Mailable.php(198): Illuminate\\Mail\\Mailable->withLocale()\n#8 /usr/local/apache2/htdocs/gplexCRM_resource/vendor/laravel/framework/src/Illuminate/Mail/SendQueuedMailable.php(83): Illuminate\\Mail\\Mailable->send()\n#9 /usr/local/apache2/htdocs/gplexCRM_resource/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(36): Illuminate\\Mail\\SendQueuedMailable->handle()\n#10 /usr/local/apache2/htdocs/gplexCRM_resource/vendor/laravel/framework/src/Illuminate/Container/Util.php(41): Illuminate\\Container\\BoundMethod::Illuminate\\Container\\{closure}()\n#11 /usr/local/apache2/htdocs/gplexCRM_resource/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(93): Illuminate\\Container\\Util::unwrapIfClosure()\n#12 /usr/local/apache2/htdocs/gplexCRM_resource/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(35): Illuminate\\Container\\BoundMethod::callBoundMethod()\n#13 /usr/local/apache2/htdocs/gplexCRM_resource/vendor/laravel/framework/src/Illuminate/Container/Container.php(662): Illuminate\\Container\\BoundMethod::call()\n#14 /usr/local/apache2/htdocs/gplexCRM_resource/vendor/laravel/framework/src/Illuminate/Bus/Dispatcher.php(128): Illuminate\\Container\\Container->call()\n#15 /usr/local/apache2/htdocs/gplexCRM_resource/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(144): Illuminate\\Bus\\Dispatcher->Illuminate\\Bus\\{closure}()\n#16 /usr/local/apache2/htdocs/gplexCRM_resource/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(119): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}()\n#17 /usr/local/apache2/htdocs/gplexCRM_resource/vendor/laravel/framework/src/Illuminate/Bus/Dispatcher.php(132): Illuminate\\Pipeline\\Pipeline->then()\n#18 /usr/local/apache2/htdocs/gplexCRM_resource/vendor/laravel/framework/src/Illuminate/Queue/CallQueuedHandler.php(123): Illuminate\\Bus\\Dispatcher->dispatchNow()\n#19 /usr/local/apache2/htdocs/gplexCRM_resource/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(144): Illuminate\\Queue\\CallQueuedHandler->Illuminate\\Queue\\{closure}()\n#20 /usr/local/apache2/htdocs/gplexCRM_resource/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(119): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}()\n#21 /usr/local/apache2/htdocs/gplexCRM_resource/vendor/laravel/framework/src/Illuminate/Queue/CallQueuedHandler.php(122): Illuminate\\Pipeline\\Pipeline->then()\n#22 /usr/local/apache2/htdocs/gplexCRM_resource/vendor/laravel/framework/src/Illuminate/Queue/CallQueuedHandler.php(70): Illuminate\\Queue\\CallQueuedHandler->dispatchThroughMiddleware()\n#23 /usr/local/apache2/htdocs/gplexCRM_resource/vendor/laravel/framework/src/Illuminate/Queue/Jobs/Job.php(102): Illuminate\\Queue\\CallQueuedHandler->call()\n#24 /usr/local/apache2/htdocs/gplexCRM_resource/vendor/laravel/framework/src/Illuminate/Queue/Worker.php(439): Illuminate\\Queue\\Jobs\\Job->fire()\n#25 /usr/local/apache2/htdocs/gplexCRM_resource/vendor/laravel/framework/src/Illuminate/Queue/Worker.php(389): Illuminate\\Queue\\Worker->process()\n#26 /usr/local/apache2/htdocs/gplexCRM_resource/vendor/laravel/framework/src/Illuminate/Queue/Worker.php(176): Illuminate\\Queue\\Worker->runJob()\n#27 /usr/local/apache2/htdocs/gplexCRM_resource/vendor/laravel/framework/src/Illuminate/Queue/Console/WorkCommand.php(137): Illuminate\\Queue\\Worker->daemon()\n#28 /usr/local/apache2/htdocs/gplexCRM_resource/vendor/laravel/framework/src/Illuminate/Queue/Console/WorkCommand.php(120): Illuminate\\Queue\\Console\\WorkCommand->runWorker()\n#29 /usr/local/apache2/htdocs/gplexCRM_resource/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(36): Illuminate\\Queue\\Console\\WorkCommand->handle()\n#30 /usr/local/apache2/htdocs/gplexCRM_resource/vendor/laravel/framework/src/Illuminate/Container/Util.php(41): Illuminate\\Container\\BoundMethod::Illuminate\\Container\\{closure}()\n#31 /usr/local/apache2/htdocs/gplexCRM_resource/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(93): Illuminate\\Container\\Util::unwrapIfClosure()\n#32 /usr/local/apache2/htdocs/gplexCRM_resource/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(35): Illuminate\\Container\\BoundMethod::callBoundMethod()\n#33 /usr/local/apache2/htdocs/gplexCRM_resource/vendor/laravel/framework/src/Illuminate/Container/Container.php(662): Illuminate\\Container\\BoundMethod::call()\n#34 /usr/local/apache2/htdocs/gplexCRM_resource/vendor/laravel/framework/src/Illuminate/Console/Command.php(211): Illuminate\\Container\\Container->call()\n#35 /usr/local/apache2/htdocs/gplexCRM_resource/vendor/symfony/console/Command/Command.php(326): Illuminate\\Console\\Command->execute()\n#36 /usr/local/apache2/htdocs/gplexCRM_resource/vendor/laravel/framework/src/Illuminate/Console/Command.php(180): Symfony\\Component\\Console\\Command\\Command->run()\n#37 /usr/local/apache2/htdocs/gplexCRM_resource/vendor/symfony/console/Application.php(1096): Illuminate\\Console\\Command->run()\n#38 /usr/local/apache2/htdocs/gplexCRM_resource/vendor/symfony/console/Application.php(324): Symfony\\Component\\Console\\Application->doRunCommand()\n#39 /usr/local/apache2/htdocs/gplexCRM_resource/vendor/symfony/console/Application.php(175): Symfony\\Component\\Console\\Application->doRun()\n#40 /usr/local/apache2/htdocs/gplexCRM_resource/vendor/laravel/framework/src/Illuminate/Foundation/Console/Kernel.php(201): Symfony\\Component\\Console\\Application->run()\n#41 /usr/local/apache2/htdocs/gplexCRM_resource/artisan(35): Illuminate\\Foundation\\Console\\Kernel->handle()\n#42 {main}', '2024-11-05 08:08:51');
INSERT INTO `failed_jobs` (`id`, `uuid`, `connection`, `queue`, `payload`, `exception`, `failed_at`) VALUES
(7, 'c927f8e3-c1d5-4e1e-a456-6a718c75fffe', 'database', 'default', '{\"uuid\":\"c927f8e3-c1d5-4e1e-a456-6a718c75fffe\",\"displayName\":\"App\\\\Mail\\\\BulkEmail\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Mail\\\\SendQueuedMailable\",\"command\":\"O:34:\\\"Illuminate\\\\Mail\\\\SendQueuedMailable\\\":15:{s:8:\\\"mailable\\\";O:18:\\\"App\\\\Mail\\\\BulkEmail\\\":4:{s:7:\\\"subject\\\";s:13:\\\"Moni template\\\";s:4:\\\"body\\\";s:26:\\\"<p>Moni email template<\\/p>\\\";s:2:\\\"to\\\";a:1:{i:0;a:2:{s:4:\\\"name\\\";N;s:7:\\\"address\\\";s:18:\\\"singara(breakfast)\\\";}}s:6:\\\"mailer\\\";s:4:\\\"smtp\\\";}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:13:\\\"maxExceptions\\\";N;s:17:\\\"shouldBeEncrypted\\\";b:0;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:3:\\\"job\\\";N;}\"}}', 'Symfony\\Component\\Mime\\Exception\\RfcComplianceException: Email \"singara(breakfast)\" does not comply with addr-spec of RFC 2822. in /usr/local/apache2/htdocs/gplexCRM_resource/vendor/symfony/mime/Address.php:54\nStack trace:\n#0 /usr/local/apache2/htdocs/gplexCRM_resource/vendor/laravel/framework/src/Illuminate/Mail/Message.php(246): Symfony\\Component\\Mime\\Address->__construct()\n#1 /usr/local/apache2/htdocs/gplexCRM_resource/vendor/laravel/framework/src/Illuminate/Mail/Message.php(110): Illuminate\\Mail\\Message->addAddresses()\n#2 /usr/local/apache2/htdocs/gplexCRM_resource/vendor/laravel/framework/src/Illuminate/Mail/Mailable.php(433): Illuminate\\Mail\\Message->to()\n#3 /usr/local/apache2/htdocs/gplexCRM_resource/vendor/laravel/framework/src/Illuminate/Mail/Mailable.php(207): Illuminate\\Mail\\Mailable->buildRecipients()\n#4 /usr/local/apache2/htdocs/gplexCRM_resource/vendor/laravel/framework/src/Illuminate/Mail/Mailer.php(317): Illuminate\\Mail\\Mailable->Illuminate\\Mail\\{closure}()\n#5 /usr/local/apache2/htdocs/gplexCRM_resource/vendor/laravel/framework/src/Illuminate/Mail/Mailable.php(205): Illuminate\\Mail\\Mailer->send()\n#6 /usr/local/apache2/htdocs/gplexCRM_resource/vendor/laravel/framework/src/Illuminate/Support/Traits/Localizable.php(19): Illuminate\\Mail\\Mailable->Illuminate\\Mail\\{closure}()\n#7 /usr/local/apache2/htdocs/gplexCRM_resource/vendor/laravel/framework/src/Illuminate/Mail/Mailable.php(198): Illuminate\\Mail\\Mailable->withLocale()\n#8 /usr/local/apache2/htdocs/gplexCRM_resource/vendor/laravel/framework/src/Illuminate/Mail/SendQueuedMailable.php(83): Illuminate\\Mail\\Mailable->send()\n#9 /usr/local/apache2/htdocs/gplexCRM_resource/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(36): Illuminate\\Mail\\SendQueuedMailable->handle()\n#10 /usr/local/apache2/htdocs/gplexCRM_resource/vendor/laravel/framework/src/Illuminate/Container/Util.php(41): Illuminate\\Container\\BoundMethod::Illuminate\\Container\\{closure}()\n#11 /usr/local/apache2/htdocs/gplexCRM_resource/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(93): Illuminate\\Container\\Util::unwrapIfClosure()\n#12 /usr/local/apache2/htdocs/gplexCRM_resource/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(35): Illuminate\\Container\\BoundMethod::callBoundMethod()\n#13 /usr/local/apache2/htdocs/gplexCRM_resource/vendor/laravel/framework/src/Illuminate/Container/Container.php(662): Illuminate\\Container\\BoundMethod::call()\n#14 /usr/local/apache2/htdocs/gplexCRM_resource/vendor/laravel/framework/src/Illuminate/Bus/Dispatcher.php(128): Illuminate\\Container\\Container->call()\n#15 /usr/local/apache2/htdocs/gplexCRM_resource/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(144): Illuminate\\Bus\\Dispatcher->Illuminate\\Bus\\{closure}()\n#16 /usr/local/apache2/htdocs/gplexCRM_resource/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(119): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}()\n#17 /usr/local/apache2/htdocs/gplexCRM_resource/vendor/laravel/framework/src/Illuminate/Bus/Dispatcher.php(132): Illuminate\\Pipeline\\Pipeline->then()\n#18 /usr/local/apache2/htdocs/gplexCRM_resource/vendor/laravel/framework/src/Illuminate/Queue/CallQueuedHandler.php(123): Illuminate\\Bus\\Dispatcher->dispatchNow()\n#19 /usr/local/apache2/htdocs/gplexCRM_resource/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(144): Illuminate\\Queue\\CallQueuedHandler->Illuminate\\Queue\\{closure}()\n#20 /usr/local/apache2/htdocs/gplexCRM_resource/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(119): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}()\n#21 /usr/local/apache2/htdocs/gplexCRM_resource/vendor/laravel/framework/src/Illuminate/Queue/CallQueuedHandler.php(122): Illuminate\\Pipeline\\Pipeline->then()\n#22 /usr/local/apache2/htdocs/gplexCRM_resource/vendor/laravel/framework/src/Illuminate/Queue/CallQueuedHandler.php(70): Illuminate\\Queue\\CallQueuedHandler->dispatchThroughMiddleware()\n#23 /usr/local/apache2/htdocs/gplexCRM_resource/vendor/laravel/framework/src/Illuminate/Queue/Jobs/Job.php(102): Illuminate\\Queue\\CallQueuedHandler->call()\n#24 /usr/local/apache2/htdocs/gplexCRM_resource/vendor/laravel/framework/src/Illuminate/Queue/Worker.php(439): Illuminate\\Queue\\Jobs\\Job->fire()\n#25 /usr/local/apache2/htdocs/gplexCRM_resource/vendor/laravel/framework/src/Illuminate/Queue/Worker.php(389): Illuminate\\Queue\\Worker->process()\n#26 /usr/local/apache2/htdocs/gplexCRM_resource/vendor/laravel/framework/src/Illuminate/Queue/Worker.php(176): Illuminate\\Queue\\Worker->runJob()\n#27 /usr/local/apache2/htdocs/gplexCRM_resource/vendor/laravel/framework/src/Illuminate/Queue/Console/WorkCommand.php(137): Illuminate\\Queue\\Worker->daemon()\n#28 /usr/local/apache2/htdocs/gplexCRM_resource/vendor/laravel/framework/src/Illuminate/Queue/Console/WorkCommand.php(120): Illuminate\\Queue\\Console\\WorkCommand->runWorker()\n#29 /usr/local/apache2/htdocs/gplexCRM_resource/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(36): Illuminate\\Queue\\Console\\WorkCommand->handle()\n#30 /usr/local/apache2/htdocs/gplexCRM_resource/vendor/laravel/framework/src/Illuminate/Container/Util.php(41): Illuminate\\Container\\BoundMethod::Illuminate\\Container\\{closure}()\n#31 /usr/local/apache2/htdocs/gplexCRM_resource/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(93): Illuminate\\Container\\Util::unwrapIfClosure()\n#32 /usr/local/apache2/htdocs/gplexCRM_resource/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(35): Illuminate\\Container\\BoundMethod::callBoundMethod()\n#33 /usr/local/apache2/htdocs/gplexCRM_resource/vendor/laravel/framework/src/Illuminate/Container/Container.php(662): Illuminate\\Container\\BoundMethod::call()\n#34 /usr/local/apache2/htdocs/gplexCRM_resource/vendor/laravel/framework/src/Illuminate/Console/Command.php(211): Illuminate\\Container\\Container->call()\n#35 /usr/local/apache2/htdocs/gplexCRM_resource/vendor/symfony/console/Command/Command.php(326): Illuminate\\Console\\Command->execute()\n#36 /usr/local/apache2/htdocs/gplexCRM_resource/vendor/laravel/framework/src/Illuminate/Console/Command.php(180): Symfony\\Component\\Console\\Command\\Command->run()\n#37 /usr/local/apache2/htdocs/gplexCRM_resource/vendor/symfony/console/Application.php(1096): Illuminate\\Console\\Command->run()\n#38 /usr/local/apache2/htdocs/gplexCRM_resource/vendor/symfony/console/Application.php(324): Symfony\\Component\\Console\\Application->doRunCommand()\n#39 /usr/local/apache2/htdocs/gplexCRM_resource/vendor/symfony/console/Application.php(175): Symfony\\Component\\Console\\Application->doRun()\n#40 /usr/local/apache2/htdocs/gplexCRM_resource/vendor/laravel/framework/src/Illuminate/Foundation/Console/Kernel.php(201): Symfony\\Component\\Console\\Application->run()\n#41 /usr/local/apache2/htdocs/gplexCRM_resource/artisan(35): Illuminate\\Foundation\\Console\\Kernel->handle()\n#42 {main}', '2024-11-05 08:08:51'),
(8, '0cc9cc28-a422-4630-b125-8302615539e1', 'database', 'default', '{\"uuid\":\"0cc9cc28-a422-4630-b125-8302615539e1\",\"displayName\":\"App\\\\Mail\\\\BulkEmail\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Mail\\\\SendQueuedMailable\",\"command\":\"O:34:\\\"Illuminate\\\\Mail\\\\SendQueuedMailable\\\":15:{s:8:\\\"mailable\\\";O:18:\\\"App\\\\Mail\\\\BulkEmail\\\":4:{s:7:\\\"subject\\\";s:13:\\\"Moni template\\\";s:4:\\\"body\\\";s:26:\\\"<p>Moni email template<\\/p>\\\";s:2:\\\"to\\\";a:1:{i:0;a:2:{s:4:\\\"name\\\";N;s:7:\\\"address\\\";s:14:\\\"Mojo- 4(litre)\\\";}}s:6:\\\"mailer\\\";s:4:\\\"smtp\\\";}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:13:\\\"maxExceptions\\\";N;s:17:\\\"shouldBeEncrypted\\\";b:0;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:3:\\\"job\\\";N;}\"}}', 'Symfony\\Component\\Mime\\Exception\\RfcComplianceException: Email \"Mojo- 4(litre)\" does not comply with addr-spec of RFC 2822. in /usr/local/apache2/htdocs/gplexCRM_resource/vendor/symfony/mime/Address.php:54\nStack trace:\n#0 /usr/local/apache2/htdocs/gplexCRM_resource/vendor/laravel/framework/src/Illuminate/Mail/Message.php(246): Symfony\\Component\\Mime\\Address->__construct()\n#1 /usr/local/apache2/htdocs/gplexCRM_resource/vendor/laravel/framework/src/Illuminate/Mail/Message.php(110): Illuminate\\Mail\\Message->addAddresses()\n#2 /usr/local/apache2/htdocs/gplexCRM_resource/vendor/laravel/framework/src/Illuminate/Mail/Mailable.php(433): Illuminate\\Mail\\Message->to()\n#3 /usr/local/apache2/htdocs/gplexCRM_resource/vendor/laravel/framework/src/Illuminate/Mail/Mailable.php(207): Illuminate\\Mail\\Mailable->buildRecipients()\n#4 /usr/local/apache2/htdocs/gplexCRM_resource/vendor/laravel/framework/src/Illuminate/Mail/Mailer.php(317): Illuminate\\Mail\\Mailable->Illuminate\\Mail\\{closure}()\n#5 /usr/local/apache2/htdocs/gplexCRM_resource/vendor/laravel/framework/src/Illuminate/Mail/Mailable.php(205): Illuminate\\Mail\\Mailer->send()\n#6 /usr/local/apache2/htdocs/gplexCRM_resource/vendor/laravel/framework/src/Illuminate/Support/Traits/Localizable.php(19): Illuminate\\Mail\\Mailable->Illuminate\\Mail\\{closure}()\n#7 /usr/local/apache2/htdocs/gplexCRM_resource/vendor/laravel/framework/src/Illuminate/Mail/Mailable.php(198): Illuminate\\Mail\\Mailable->withLocale()\n#8 /usr/local/apache2/htdocs/gplexCRM_resource/vendor/laravel/framework/src/Illuminate/Mail/SendQueuedMailable.php(83): Illuminate\\Mail\\Mailable->send()\n#9 /usr/local/apache2/htdocs/gplexCRM_resource/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(36): Illuminate\\Mail\\SendQueuedMailable->handle()\n#10 /usr/local/apache2/htdocs/gplexCRM_resource/vendor/laravel/framework/src/Illuminate/Container/Util.php(41): Illuminate\\Container\\BoundMethod::Illuminate\\Container\\{closure}()\n#11 /usr/local/apache2/htdocs/gplexCRM_resource/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(93): Illuminate\\Container\\Util::unwrapIfClosure()\n#12 /usr/local/apache2/htdocs/gplexCRM_resource/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(35): Illuminate\\Container\\BoundMethod::callBoundMethod()\n#13 /usr/local/apache2/htdocs/gplexCRM_resource/vendor/laravel/framework/src/Illuminate/Container/Container.php(662): Illuminate\\Container\\BoundMethod::call()\n#14 /usr/local/apache2/htdocs/gplexCRM_resource/vendor/laravel/framework/src/Illuminate/Bus/Dispatcher.php(128): Illuminate\\Container\\Container->call()\n#15 /usr/local/apache2/htdocs/gplexCRM_resource/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(144): Illuminate\\Bus\\Dispatcher->Illuminate\\Bus\\{closure}()\n#16 /usr/local/apache2/htdocs/gplexCRM_resource/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(119): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}()\n#17 /usr/local/apache2/htdocs/gplexCRM_resource/vendor/laravel/framework/src/Illuminate/Bus/Dispatcher.php(132): Illuminate\\Pipeline\\Pipeline->then()\n#18 /usr/local/apache2/htdocs/gplexCRM_resource/vendor/laravel/framework/src/Illuminate/Queue/CallQueuedHandler.php(123): Illuminate\\Bus\\Dispatcher->dispatchNow()\n#19 /usr/local/apache2/htdocs/gplexCRM_resource/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(144): Illuminate\\Queue\\CallQueuedHandler->Illuminate\\Queue\\{closure}()\n#20 /usr/local/apache2/htdocs/gplexCRM_resource/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(119): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}()\n#21 /usr/local/apache2/htdocs/gplexCRM_resource/vendor/laravel/framework/src/Illuminate/Queue/CallQueuedHandler.php(122): Illuminate\\Pipeline\\Pipeline->then()\n#22 /usr/local/apache2/htdocs/gplexCRM_resource/vendor/laravel/framework/src/Illuminate/Queue/CallQueuedHandler.php(70): Illuminate\\Queue\\CallQueuedHandler->dispatchThroughMiddleware()\n#23 /usr/local/apache2/htdocs/gplexCRM_resource/vendor/laravel/framework/src/Illuminate/Queue/Jobs/Job.php(102): Illuminate\\Queue\\CallQueuedHandler->call()\n#24 /usr/local/apache2/htdocs/gplexCRM_resource/vendor/laravel/framework/src/Illuminate/Queue/Worker.php(439): Illuminate\\Queue\\Jobs\\Job->fire()\n#25 /usr/local/apache2/htdocs/gplexCRM_resource/vendor/laravel/framework/src/Illuminate/Queue/Worker.php(389): Illuminate\\Queue\\Worker->process()\n#26 /usr/local/apache2/htdocs/gplexCRM_resource/vendor/laravel/framework/src/Illuminate/Queue/Worker.php(176): Illuminate\\Queue\\Worker->runJob()\n#27 /usr/local/apache2/htdocs/gplexCRM_resource/vendor/laravel/framework/src/Illuminate/Queue/Console/WorkCommand.php(137): Illuminate\\Queue\\Worker->daemon()\n#28 /usr/local/apache2/htdocs/gplexCRM_resource/vendor/laravel/framework/src/Illuminate/Queue/Console/WorkCommand.php(120): Illuminate\\Queue\\Console\\WorkCommand->runWorker()\n#29 /usr/local/apache2/htdocs/gplexCRM_resource/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(36): Illuminate\\Queue\\Console\\WorkCommand->handle()\n#30 /usr/local/apache2/htdocs/gplexCRM_resource/vendor/laravel/framework/src/Illuminate/Container/Util.php(41): Illuminate\\Container\\BoundMethod::Illuminate\\Container\\{closure}()\n#31 /usr/local/apache2/htdocs/gplexCRM_resource/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(93): Illuminate\\Container\\Util::unwrapIfClosure()\n#32 /usr/local/apache2/htdocs/gplexCRM_resource/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(35): Illuminate\\Container\\BoundMethod::callBoundMethod()\n#33 /usr/local/apache2/htdocs/gplexCRM_resource/vendor/laravel/framework/src/Illuminate/Container/Container.php(662): Illuminate\\Container\\BoundMethod::call()\n#34 /usr/local/apache2/htdocs/gplexCRM_resource/vendor/laravel/framework/src/Illuminate/Console/Command.php(211): Illuminate\\Container\\Container->call()\n#35 /usr/local/apache2/htdocs/gplexCRM_resource/vendor/symfony/console/Command/Command.php(326): Illuminate\\Console\\Command->execute()\n#36 /usr/local/apache2/htdocs/gplexCRM_resource/vendor/laravel/framework/src/Illuminate/Console/Command.php(180): Symfony\\Component\\Console\\Command\\Command->run()\n#37 /usr/local/apache2/htdocs/gplexCRM_resource/vendor/symfony/console/Application.php(1096): Illuminate\\Console\\Command->run()\n#38 /usr/local/apache2/htdocs/gplexCRM_resource/vendor/symfony/console/Application.php(324): Symfony\\Component\\Console\\Application->doRunCommand()\n#39 /usr/local/apache2/htdocs/gplexCRM_resource/vendor/symfony/console/Application.php(175): Symfony\\Component\\Console\\Application->doRun()\n#40 /usr/local/apache2/htdocs/gplexCRM_resource/vendor/laravel/framework/src/Illuminate/Foundation/Console/Kernel.php(201): Symfony\\Component\\Console\\Application->run()\n#41 /usr/local/apache2/htdocs/gplexCRM_resource/artisan(35): Illuminate\\Foundation\\Console\\Kernel->handle()\n#42 {main}', '2024-11-05 08:08:51'),
(9, 'e2d4728e-0646-42e1-bfe8-187b989fbc10', 'database', 'default', '{\"uuid\":\"e2d4728e-0646-42e1-bfe8-187b989fbc10\",\"displayName\":\"App\\\\Mail\\\\BulkEmail\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Mail\\\\SendQueuedMailable\",\"command\":\"O:34:\\\"Illuminate\\\\Mail\\\\SendQueuedMailable\\\":15:{s:8:\\\"mailable\\\";O:18:\\\"App\\\\Mail\\\\BulkEmail\\\":4:{s:7:\\\"subject\\\";s:13:\\\"Moni template\\\";s:4:\\\"body\\\";s:26:\\\"<p>Moni email template<\\/p>\\\";s:2:\\\"to\\\";a:1:{i:0;a:2:{s:4:\\\"name\\\";N;s:7:\\\"address\\\";s:14:\\\"Ice cream,Mojo\\\";}}s:6:\\\"mailer\\\";s:4:\\\"smtp\\\";}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:13:\\\"maxExceptions\\\";N;s:17:\\\"shouldBeEncrypted\\\";b:0;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:3:\\\"job\\\";N;}\"}}', 'Symfony\\Component\\Mime\\Exception\\RfcComplianceException: Email \"Ice cream,Mojo\" does not comply with addr-spec of RFC 2822. in /usr/local/apache2/htdocs/gplexCRM_resource/vendor/symfony/mime/Address.php:54\nStack trace:\n#0 /usr/local/apache2/htdocs/gplexCRM_resource/vendor/laravel/framework/src/Illuminate/Mail/Message.php(246): Symfony\\Component\\Mime\\Address->__construct()\n#1 /usr/local/apache2/htdocs/gplexCRM_resource/vendor/laravel/framework/src/Illuminate/Mail/Message.php(110): Illuminate\\Mail\\Message->addAddresses()\n#2 /usr/local/apache2/htdocs/gplexCRM_resource/vendor/laravel/framework/src/Illuminate/Mail/Mailable.php(433): Illuminate\\Mail\\Message->to()\n#3 /usr/local/apache2/htdocs/gplexCRM_resource/vendor/laravel/framework/src/Illuminate/Mail/Mailable.php(207): Illuminate\\Mail\\Mailable->buildRecipients()\n#4 /usr/local/apache2/htdocs/gplexCRM_resource/vendor/laravel/framework/src/Illuminate/Mail/Mailer.php(317): Illuminate\\Mail\\Mailable->Illuminate\\Mail\\{closure}()\n#5 /usr/local/apache2/htdocs/gplexCRM_resource/vendor/laravel/framework/src/Illuminate/Mail/Mailable.php(205): Illuminate\\Mail\\Mailer->send()\n#6 /usr/local/apache2/htdocs/gplexCRM_resource/vendor/laravel/framework/src/Illuminate/Support/Traits/Localizable.php(19): Illuminate\\Mail\\Mailable->Illuminate\\Mail\\{closure}()\n#7 /usr/local/apache2/htdocs/gplexCRM_resource/vendor/laravel/framework/src/Illuminate/Mail/Mailable.php(198): Illuminate\\Mail\\Mailable->withLocale()\n#8 /usr/local/apache2/htdocs/gplexCRM_resource/vendor/laravel/framework/src/Illuminate/Mail/SendQueuedMailable.php(83): Illuminate\\Mail\\Mailable->send()\n#9 /usr/local/apache2/htdocs/gplexCRM_resource/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(36): Illuminate\\Mail\\SendQueuedMailable->handle()\n#10 /usr/local/apache2/htdocs/gplexCRM_resource/vendor/laravel/framework/src/Illuminate/Container/Util.php(41): Illuminate\\Container\\BoundMethod::Illuminate\\Container\\{closure}()\n#11 /usr/local/apache2/htdocs/gplexCRM_resource/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(93): Illuminate\\Container\\Util::unwrapIfClosure()\n#12 /usr/local/apache2/htdocs/gplexCRM_resource/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(35): Illuminate\\Container\\BoundMethod::callBoundMethod()\n#13 /usr/local/apache2/htdocs/gplexCRM_resource/vendor/laravel/framework/src/Illuminate/Container/Container.php(662): Illuminate\\Container\\BoundMethod::call()\n#14 /usr/local/apache2/htdocs/gplexCRM_resource/vendor/laravel/framework/src/Illuminate/Bus/Dispatcher.php(128): Illuminate\\Container\\Container->call()\n#15 /usr/local/apache2/htdocs/gplexCRM_resource/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(144): Illuminate\\Bus\\Dispatcher->Illuminate\\Bus\\{closure}()\n#16 /usr/local/apache2/htdocs/gplexCRM_resource/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(119): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}()\n#17 /usr/local/apache2/htdocs/gplexCRM_resource/vendor/laravel/framework/src/Illuminate/Bus/Dispatcher.php(132): Illuminate\\Pipeline\\Pipeline->then()\n#18 /usr/local/apache2/htdocs/gplexCRM_resource/vendor/laravel/framework/src/Illuminate/Queue/CallQueuedHandler.php(123): Illuminate\\Bus\\Dispatcher->dispatchNow()\n#19 /usr/local/apache2/htdocs/gplexCRM_resource/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(144): Illuminate\\Queue\\CallQueuedHandler->Illuminate\\Queue\\{closure}()\n#20 /usr/local/apache2/htdocs/gplexCRM_resource/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(119): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}()\n#21 /usr/local/apache2/htdocs/gplexCRM_resource/vendor/laravel/framework/src/Illuminate/Queue/CallQueuedHandler.php(122): Illuminate\\Pipeline\\Pipeline->then()\n#22 /usr/local/apache2/htdocs/gplexCRM_resource/vendor/laravel/framework/src/Illuminate/Queue/CallQueuedHandler.php(70): Illuminate\\Queue\\CallQueuedHandler->dispatchThroughMiddleware()\n#23 /usr/local/apache2/htdocs/gplexCRM_resource/vendor/laravel/framework/src/Illuminate/Queue/Jobs/Job.php(102): Illuminate\\Queue\\CallQueuedHandler->call()\n#24 /usr/local/apache2/htdocs/gplexCRM_resource/vendor/laravel/framework/src/Illuminate/Queue/Worker.php(439): Illuminate\\Queue\\Jobs\\Job->fire()\n#25 /usr/local/apache2/htdocs/gplexCRM_resource/vendor/laravel/framework/src/Illuminate/Queue/Worker.php(389): Illuminate\\Queue\\Worker->process()\n#26 /usr/local/apache2/htdocs/gplexCRM_resource/vendor/laravel/framework/src/Illuminate/Queue/Worker.php(176): Illuminate\\Queue\\Worker->runJob()\n#27 /usr/local/apache2/htdocs/gplexCRM_resource/vendor/laravel/framework/src/Illuminate/Queue/Console/WorkCommand.php(137): Illuminate\\Queue\\Worker->daemon()\n#28 /usr/local/apache2/htdocs/gplexCRM_resource/vendor/laravel/framework/src/Illuminate/Queue/Console/WorkCommand.php(120): Illuminate\\Queue\\Console\\WorkCommand->runWorker()\n#29 /usr/local/apache2/htdocs/gplexCRM_resource/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(36): Illuminate\\Queue\\Console\\WorkCommand->handle()\n#30 /usr/local/apache2/htdocs/gplexCRM_resource/vendor/laravel/framework/src/Illuminate/Container/Util.php(41): Illuminate\\Container\\BoundMethod::Illuminate\\Container\\{closure}()\n#31 /usr/local/apache2/htdocs/gplexCRM_resource/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(93): Illuminate\\Container\\Util::unwrapIfClosure()\n#32 /usr/local/apache2/htdocs/gplexCRM_resource/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(35): Illuminate\\Container\\BoundMethod::callBoundMethod()\n#33 /usr/local/apache2/htdocs/gplexCRM_resource/vendor/laravel/framework/src/Illuminate/Container/Container.php(662): Illuminate\\Container\\BoundMethod::call()\n#34 /usr/local/apache2/htdocs/gplexCRM_resource/vendor/laravel/framework/src/Illuminate/Console/Command.php(211): Illuminate\\Container\\Container->call()\n#35 /usr/local/apache2/htdocs/gplexCRM_resource/vendor/symfony/console/Command/Command.php(326): Illuminate\\Console\\Command->execute()\n#36 /usr/local/apache2/htdocs/gplexCRM_resource/vendor/laravel/framework/src/Illuminate/Console/Command.php(180): Symfony\\Component\\Console\\Command\\Command->run()\n#37 /usr/local/apache2/htdocs/gplexCRM_resource/vendor/symfony/console/Application.php(1096): Illuminate\\Console\\Command->run()\n#38 /usr/local/apache2/htdocs/gplexCRM_resource/vendor/symfony/console/Application.php(324): Symfony\\Component\\Console\\Application->doRunCommand()\n#39 /usr/local/apache2/htdocs/gplexCRM_resource/vendor/symfony/console/Application.php(175): Symfony\\Component\\Console\\Application->doRun()\n#40 /usr/local/apache2/htdocs/gplexCRM_resource/vendor/laravel/framework/src/Illuminate/Foundation/Console/Kernel.php(201): Symfony\\Component\\Console\\Application->run()\n#41 /usr/local/apache2/htdocs/gplexCRM_resource/artisan(35): Illuminate\\Foundation\\Console\\Kernel->handle()\n#42 {main}', '2024-11-05 08:08:51'),
(10, '5fa15165-fd1d-488e-ab13-5b3e7396fb71', 'database', 'default', '{\"uuid\":\"5fa15165-fd1d-488e-ab13-5b3e7396fb71\",\"displayName\":\"App\\\\Mail\\\\BulkEmail\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Mail\\\\SendQueuedMailable\",\"command\":\"O:34:\\\"Illuminate\\\\Mail\\\\SendQueuedMailable\\\":15:{s:8:\\\"mailable\\\";O:18:\\\"App\\\\Mail\\\\BulkEmail\\\":4:{s:7:\\\"subject\\\";s:13:\\\"Moni template\\\";s:4:\\\"body\\\";s:26:\\\"<p>Moni email template<\\/p>\\\";s:2:\\\"to\\\";a:1:{i:0;a:2:{s:4:\\\"name\\\";N;s:7:\\\"address\\\";s:18:\\\"singara(breakfast)\\\";}}s:6:\\\"mailer\\\";s:4:\\\"smtp\\\";}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:13:\\\"maxExceptions\\\";N;s:17:\\\"shouldBeEncrypted\\\";b:0;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:3:\\\"job\\\";N;}\"}}', 'Symfony\\Component\\Mime\\Exception\\RfcComplianceException: Email \"singara(breakfast)\" does not comply with addr-spec of RFC 2822. in /usr/local/apache2/htdocs/gplexCRM_resource/vendor/symfony/mime/Address.php:54\nStack trace:\n#0 /usr/local/apache2/htdocs/gplexCRM_resource/vendor/laravel/framework/src/Illuminate/Mail/Message.php(246): Symfony\\Component\\Mime\\Address->__construct()\n#1 /usr/local/apache2/htdocs/gplexCRM_resource/vendor/laravel/framework/src/Illuminate/Mail/Message.php(110): Illuminate\\Mail\\Message->addAddresses()\n#2 /usr/local/apache2/htdocs/gplexCRM_resource/vendor/laravel/framework/src/Illuminate/Mail/Mailable.php(433): Illuminate\\Mail\\Message->to()\n#3 /usr/local/apache2/htdocs/gplexCRM_resource/vendor/laravel/framework/src/Illuminate/Mail/Mailable.php(207): Illuminate\\Mail\\Mailable->buildRecipients()\n#4 /usr/local/apache2/htdocs/gplexCRM_resource/vendor/laravel/framework/src/Illuminate/Mail/Mailer.php(317): Illuminate\\Mail\\Mailable->Illuminate\\Mail\\{closure}()\n#5 /usr/local/apache2/htdocs/gplexCRM_resource/vendor/laravel/framework/src/Illuminate/Mail/Mailable.php(205): Illuminate\\Mail\\Mailer->send()\n#6 /usr/local/apache2/htdocs/gplexCRM_resource/vendor/laravel/framework/src/Illuminate/Support/Traits/Localizable.php(19): Illuminate\\Mail\\Mailable->Illuminate\\Mail\\{closure}()\n#7 /usr/local/apache2/htdocs/gplexCRM_resource/vendor/laravel/framework/src/Illuminate/Mail/Mailable.php(198): Illuminate\\Mail\\Mailable->withLocale()\n#8 /usr/local/apache2/htdocs/gplexCRM_resource/vendor/laravel/framework/src/Illuminate/Mail/SendQueuedMailable.php(83): Illuminate\\Mail\\Mailable->send()\n#9 /usr/local/apache2/htdocs/gplexCRM_resource/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(36): Illuminate\\Mail\\SendQueuedMailable->handle()\n#10 /usr/local/apache2/htdocs/gplexCRM_resource/vendor/laravel/framework/src/Illuminate/Container/Util.php(41): Illuminate\\Container\\BoundMethod::Illuminate\\Container\\{closure}()\n#11 /usr/local/apache2/htdocs/gplexCRM_resource/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(93): Illuminate\\Container\\Util::unwrapIfClosure()\n#12 /usr/local/apache2/htdocs/gplexCRM_resource/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(35): Illuminate\\Container\\BoundMethod::callBoundMethod()\n#13 /usr/local/apache2/htdocs/gplexCRM_resource/vendor/laravel/framework/src/Illuminate/Container/Container.php(662): Illuminate\\Container\\BoundMethod::call()\n#14 /usr/local/apache2/htdocs/gplexCRM_resource/vendor/laravel/framework/src/Illuminate/Bus/Dispatcher.php(128): Illuminate\\Container\\Container->call()\n#15 /usr/local/apache2/htdocs/gplexCRM_resource/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(144): Illuminate\\Bus\\Dispatcher->Illuminate\\Bus\\{closure}()\n#16 /usr/local/apache2/htdocs/gplexCRM_resource/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(119): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}()\n#17 /usr/local/apache2/htdocs/gplexCRM_resource/vendor/laravel/framework/src/Illuminate/Bus/Dispatcher.php(132): Illuminate\\Pipeline\\Pipeline->then()\n#18 /usr/local/apache2/htdocs/gplexCRM_resource/vendor/laravel/framework/src/Illuminate/Queue/CallQueuedHandler.php(123): Illuminate\\Bus\\Dispatcher->dispatchNow()\n#19 /usr/local/apache2/htdocs/gplexCRM_resource/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(144): Illuminate\\Queue\\CallQueuedHandler->Illuminate\\Queue\\{closure}()\n#20 /usr/local/apache2/htdocs/gplexCRM_resource/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(119): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}()\n#21 /usr/local/apache2/htdocs/gplexCRM_resource/vendor/laravel/framework/src/Illuminate/Queue/CallQueuedHandler.php(122): Illuminate\\Pipeline\\Pipeline->then()\n#22 /usr/local/apache2/htdocs/gplexCRM_resource/vendor/laravel/framework/src/Illuminate/Queue/CallQueuedHandler.php(70): Illuminate\\Queue\\CallQueuedHandler->dispatchThroughMiddleware()\n#23 /usr/local/apache2/htdocs/gplexCRM_resource/vendor/laravel/framework/src/Illuminate/Queue/Jobs/Job.php(102): Illuminate\\Queue\\CallQueuedHandler->call()\n#24 /usr/local/apache2/htdocs/gplexCRM_resource/vendor/laravel/framework/src/Illuminate/Queue/Worker.php(439): Illuminate\\Queue\\Jobs\\Job->fire()\n#25 /usr/local/apache2/htdocs/gplexCRM_resource/vendor/laravel/framework/src/Illuminate/Queue/Worker.php(389): Illuminate\\Queue\\Worker->process()\n#26 /usr/local/apache2/htdocs/gplexCRM_resource/vendor/laravel/framework/src/Illuminate/Queue/Worker.php(176): Illuminate\\Queue\\Worker->runJob()\n#27 /usr/local/apache2/htdocs/gplexCRM_resource/vendor/laravel/framework/src/Illuminate/Queue/Console/WorkCommand.php(137): Illuminate\\Queue\\Worker->daemon()\n#28 /usr/local/apache2/htdocs/gplexCRM_resource/vendor/laravel/framework/src/Illuminate/Queue/Console/WorkCommand.php(120): Illuminate\\Queue\\Console\\WorkCommand->runWorker()\n#29 /usr/local/apache2/htdocs/gplexCRM_resource/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(36): Illuminate\\Queue\\Console\\WorkCommand->handle()\n#30 /usr/local/apache2/htdocs/gplexCRM_resource/vendor/laravel/framework/src/Illuminate/Container/Util.php(41): Illuminate\\Container\\BoundMethod::Illuminate\\Container\\{closure}()\n#31 /usr/local/apache2/htdocs/gplexCRM_resource/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(93): Illuminate\\Container\\Util::unwrapIfClosure()\n#32 /usr/local/apache2/htdocs/gplexCRM_resource/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(35): Illuminate\\Container\\BoundMethod::callBoundMethod()\n#33 /usr/local/apache2/htdocs/gplexCRM_resource/vendor/laravel/framework/src/Illuminate/Container/Container.php(662): Illuminate\\Container\\BoundMethod::call()\n#34 /usr/local/apache2/htdocs/gplexCRM_resource/vendor/laravel/framework/src/Illuminate/Console/Command.php(211): Illuminate\\Container\\Container->call()\n#35 /usr/local/apache2/htdocs/gplexCRM_resource/vendor/symfony/console/Command/Command.php(326): Illuminate\\Console\\Command->execute()\n#36 /usr/local/apache2/htdocs/gplexCRM_resource/vendor/laravel/framework/src/Illuminate/Console/Command.php(180): Symfony\\Component\\Console\\Command\\Command->run()\n#37 /usr/local/apache2/htdocs/gplexCRM_resource/vendor/symfony/console/Application.php(1096): Illuminate\\Console\\Command->run()\n#38 /usr/local/apache2/htdocs/gplexCRM_resource/vendor/symfony/console/Application.php(324): Symfony\\Component\\Console\\Application->doRunCommand()\n#39 /usr/local/apache2/htdocs/gplexCRM_resource/vendor/symfony/console/Application.php(175): Symfony\\Component\\Console\\Application->doRun()\n#40 /usr/local/apache2/htdocs/gplexCRM_resource/vendor/laravel/framework/src/Illuminate/Foundation/Console/Kernel.php(201): Symfony\\Component\\Console\\Application->run()\n#41 /usr/local/apache2/htdocs/gplexCRM_resource/artisan(35): Illuminate\\Foundation\\Console\\Kernel->handle()\n#42 {main}', '2024-11-05 08:08:51'),
(11, '8b8eeaf6-c862-454d-90d9-347aaa383421', 'database', 'default', '{\"uuid\":\"8b8eeaf6-c862-454d-90d9-347aaa383421\",\"displayName\":\"App\\\\Mail\\\\BulkEmail\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Mail\\\\SendQueuedMailable\",\"command\":\"O:34:\\\"Illuminate\\\\Mail\\\\SendQueuedMailable\\\":15:{s:8:\\\"mailable\\\";O:18:\\\"App\\\\Mail\\\\BulkEmail\\\":4:{s:7:\\\"subject\\\";s:13:\\\"Moni template\\\";s:4:\\\"body\\\";s:26:\\\"<p>Moni email template<\\/p>\\\";s:2:\\\"to\\\";a:1:{i:0;a:2:{s:4:\\\"name\\\";N;s:7:\\\"address\\\";s:14:\\\"Labang,RC,mojo\\\";}}s:6:\\\"mailer\\\";s:4:\\\"smtp\\\";}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:13:\\\"maxExceptions\\\";N;s:17:\\\"shouldBeEncrypted\\\";b:0;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:3:\\\"job\\\";N;}\"}}', 'Symfony\\Component\\Mime\\Exception\\RfcComplianceException: Email \"Labang,RC,mojo\" does not comply with addr-spec of RFC 2822. in /usr/local/apache2/htdocs/gplexCRM_resource/vendor/symfony/mime/Address.php:54\nStack trace:\n#0 /usr/local/apache2/htdocs/gplexCRM_resource/vendor/laravel/framework/src/Illuminate/Mail/Message.php(246): Symfony\\Component\\Mime\\Address->__construct()\n#1 /usr/local/apache2/htdocs/gplexCRM_resource/vendor/laravel/framework/src/Illuminate/Mail/Message.php(110): Illuminate\\Mail\\Message->addAddresses()\n#2 /usr/local/apache2/htdocs/gplexCRM_resource/vendor/laravel/framework/src/Illuminate/Mail/Mailable.php(433): Illuminate\\Mail\\Message->to()\n#3 /usr/local/apache2/htdocs/gplexCRM_resource/vendor/laravel/framework/src/Illuminate/Mail/Mailable.php(207): Illuminate\\Mail\\Mailable->buildRecipients()\n#4 /usr/local/apache2/htdocs/gplexCRM_resource/vendor/laravel/framework/src/Illuminate/Mail/Mailer.php(317): Illuminate\\Mail\\Mailable->Illuminate\\Mail\\{closure}()\n#5 /usr/local/apache2/htdocs/gplexCRM_resource/vendor/laravel/framework/src/Illuminate/Mail/Mailable.php(205): Illuminate\\Mail\\Mailer->send()\n#6 /usr/local/apache2/htdocs/gplexCRM_resource/vendor/laravel/framework/src/Illuminate/Support/Traits/Localizable.php(19): Illuminate\\Mail\\Mailable->Illuminate\\Mail\\{closure}()\n#7 /usr/local/apache2/htdocs/gplexCRM_resource/vendor/laravel/framework/src/Illuminate/Mail/Mailable.php(198): Illuminate\\Mail\\Mailable->withLocale()\n#8 /usr/local/apache2/htdocs/gplexCRM_resource/vendor/laravel/framework/src/Illuminate/Mail/SendQueuedMailable.php(83): Illuminate\\Mail\\Mailable->send()\n#9 /usr/local/apache2/htdocs/gplexCRM_resource/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(36): Illuminate\\Mail\\SendQueuedMailable->handle()\n#10 /usr/local/apache2/htdocs/gplexCRM_resource/vendor/laravel/framework/src/Illuminate/Container/Util.php(41): Illuminate\\Container\\BoundMethod::Illuminate\\Container\\{closure}()\n#11 /usr/local/apache2/htdocs/gplexCRM_resource/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(93): Illuminate\\Container\\Util::unwrapIfClosure()\n#12 /usr/local/apache2/htdocs/gplexCRM_resource/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(35): Illuminate\\Container\\BoundMethod::callBoundMethod()\n#13 /usr/local/apache2/htdocs/gplexCRM_resource/vendor/laravel/framework/src/Illuminate/Container/Container.php(662): Illuminate\\Container\\BoundMethod::call()\n#14 /usr/local/apache2/htdocs/gplexCRM_resource/vendor/laravel/framework/src/Illuminate/Bus/Dispatcher.php(128): Illuminate\\Container\\Container->call()\n#15 /usr/local/apache2/htdocs/gplexCRM_resource/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(144): Illuminate\\Bus\\Dispatcher->Illuminate\\Bus\\{closure}()\n#16 /usr/local/apache2/htdocs/gplexCRM_resource/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(119): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}()\n#17 /usr/local/apache2/htdocs/gplexCRM_resource/vendor/laravel/framework/src/Illuminate/Bus/Dispatcher.php(132): Illuminate\\Pipeline\\Pipeline->then()\n#18 /usr/local/apache2/htdocs/gplexCRM_resource/vendor/laravel/framework/src/Illuminate/Queue/CallQueuedHandler.php(123): Illuminate\\Bus\\Dispatcher->dispatchNow()\n#19 /usr/local/apache2/htdocs/gplexCRM_resource/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(144): Illuminate\\Queue\\CallQueuedHandler->Illuminate\\Queue\\{closure}()\n#20 /usr/local/apache2/htdocs/gplexCRM_resource/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(119): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}()\n#21 /usr/local/apache2/htdocs/gplexCRM_resource/vendor/laravel/framework/src/Illuminate/Queue/CallQueuedHandler.php(122): Illuminate\\Pipeline\\Pipeline->then()\n#22 /usr/local/apache2/htdocs/gplexCRM_resource/vendor/laravel/framework/src/Illuminate/Queue/CallQueuedHandler.php(70): Illuminate\\Queue\\CallQueuedHandler->dispatchThroughMiddleware()\n#23 /usr/local/apache2/htdocs/gplexCRM_resource/vendor/laravel/framework/src/Illuminate/Queue/Jobs/Job.php(102): Illuminate\\Queue\\CallQueuedHandler->call()\n#24 /usr/local/apache2/htdocs/gplexCRM_resource/vendor/laravel/framework/src/Illuminate/Queue/Worker.php(439): Illuminate\\Queue\\Jobs\\Job->fire()\n#25 /usr/local/apache2/htdocs/gplexCRM_resource/vendor/laravel/framework/src/Illuminate/Queue/Worker.php(389): Illuminate\\Queue\\Worker->process()\n#26 /usr/local/apache2/htdocs/gplexCRM_resource/vendor/laravel/framework/src/Illuminate/Queue/Worker.php(176): Illuminate\\Queue\\Worker->runJob()\n#27 /usr/local/apache2/htdocs/gplexCRM_resource/vendor/laravel/framework/src/Illuminate/Queue/Console/WorkCommand.php(137): Illuminate\\Queue\\Worker->daemon()\n#28 /usr/local/apache2/htdocs/gplexCRM_resource/vendor/laravel/framework/src/Illuminate/Queue/Console/WorkCommand.php(120): Illuminate\\Queue\\Console\\WorkCommand->runWorker()\n#29 /usr/local/apache2/htdocs/gplexCRM_resource/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(36): Illuminate\\Queue\\Console\\WorkCommand->handle()\n#30 /usr/local/apache2/htdocs/gplexCRM_resource/vendor/laravel/framework/src/Illuminate/Container/Util.php(41): Illuminate\\Container\\BoundMethod::Illuminate\\Container\\{closure}()\n#31 /usr/local/apache2/htdocs/gplexCRM_resource/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(93): Illuminate\\Container\\Util::unwrapIfClosure()\n#32 /usr/local/apache2/htdocs/gplexCRM_resource/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(35): Illuminate\\Container\\BoundMethod::callBoundMethod()\n#33 /usr/local/apache2/htdocs/gplexCRM_resource/vendor/laravel/framework/src/Illuminate/Container/Container.php(662): Illuminate\\Container\\BoundMethod::call()\n#34 /usr/local/apache2/htdocs/gplexCRM_resource/vendor/laravel/framework/src/Illuminate/Console/Command.php(211): Illuminate\\Container\\Container->call()\n#35 /usr/local/apache2/htdocs/gplexCRM_resource/vendor/symfony/console/Command/Command.php(326): Illuminate\\Console\\Command->execute()\n#36 /usr/local/apache2/htdocs/gplexCRM_resource/vendor/laravel/framework/src/Illuminate/Console/Command.php(180): Symfony\\Component\\Console\\Command\\Command->run()\n#37 /usr/local/apache2/htdocs/gplexCRM_resource/vendor/symfony/console/Application.php(1096): Illuminate\\Console\\Command->run()\n#38 /usr/local/apache2/htdocs/gplexCRM_resource/vendor/symfony/console/Application.php(324): Symfony\\Component\\Console\\Application->doRunCommand()\n#39 /usr/local/apache2/htdocs/gplexCRM_resource/vendor/symfony/console/Application.php(175): Symfony\\Component\\Console\\Application->doRun()\n#40 /usr/local/apache2/htdocs/gplexCRM_resource/vendor/laravel/framework/src/Illuminate/Foundation/Console/Kernel.php(201): Symfony\\Component\\Console\\Application->run()\n#41 /usr/local/apache2/htdocs/gplexCRM_resource/artisan(35): Illuminate\\Foundation\\Console\\Kernel->handle()\n#42 {main}', '2024-11-05 08:08:51'),
(12, '0c9a06ad-bd1f-4c2c-b1f5-8eef47dc8777', 'database', 'default', '{\"uuid\":\"0c9a06ad-bd1f-4c2c-b1f5-8eef47dc8777\",\"displayName\":\"App\\\\Mail\\\\BulkEmail\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Mail\\\\SendQueuedMailable\",\"command\":\"O:34:\\\"Illuminate\\\\Mail\\\\SendQueuedMailable\\\":15:{s:8:\\\"mailable\\\";O:18:\\\"App\\\\Mail\\\\BulkEmail\\\":4:{s:7:\\\"subject\\\";s:13:\\\"Moni template\\\";s:4:\\\"body\\\";s:26:\\\"<p>Moni email template<\\/p>\\\";s:2:\\\"to\\\";a:1:{i:0;a:2:{s:4:\\\"name\\\";N;s:7:\\\"address\\\";s:28:\\\"Peyara,biscuit,badam,kasundi\\\";}}s:6:\\\"mailer\\\";s:4:\\\"smtp\\\";}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:13:\\\"maxExceptions\\\";N;s:17:\\\"shouldBeEncrypted\\\";b:0;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:3:\\\"job\\\";N;}\"}}', 'Symfony\\Component\\Mime\\Exception\\RfcComplianceException: Email \"Peyara,biscuit,badam,kasundi\" does not comply with addr-spec of RFC 2822. in /usr/local/apache2/htdocs/gplexCRM_resource/vendor/symfony/mime/Address.php:54\nStack trace:\n#0 /usr/local/apache2/htdocs/gplexCRM_resource/vendor/laravel/framework/src/Illuminate/Mail/Message.php(246): Symfony\\Component\\Mime\\Address->__construct()\n#1 /usr/local/apache2/htdocs/gplexCRM_resource/vendor/laravel/framework/src/Illuminate/Mail/Message.php(110): Illuminate\\Mail\\Message->addAddresses()\n#2 /usr/local/apache2/htdocs/gplexCRM_resource/vendor/laravel/framework/src/Illuminate/Mail/Mailable.php(433): Illuminate\\Mail\\Message->to()\n#3 /usr/local/apache2/htdocs/gplexCRM_resource/vendor/laravel/framework/src/Illuminate/Mail/Mailable.php(207): Illuminate\\Mail\\Mailable->buildRecipients()\n#4 /usr/local/apache2/htdocs/gplexCRM_resource/vendor/laravel/framework/src/Illuminate/Mail/Mailer.php(317): Illuminate\\Mail\\Mailable->Illuminate\\Mail\\{closure}()\n#5 /usr/local/apache2/htdocs/gplexCRM_resource/vendor/laravel/framework/src/Illuminate/Mail/Mailable.php(205): Illuminate\\Mail\\Mailer->send()\n#6 /usr/local/apache2/htdocs/gplexCRM_resource/vendor/laravel/framework/src/Illuminate/Support/Traits/Localizable.php(19): Illuminate\\Mail\\Mailable->Illuminate\\Mail\\{closure}()\n#7 /usr/local/apache2/htdocs/gplexCRM_resource/vendor/laravel/framework/src/Illuminate/Mail/Mailable.php(198): Illuminate\\Mail\\Mailable->withLocale()\n#8 /usr/local/apache2/htdocs/gplexCRM_resource/vendor/laravel/framework/src/Illuminate/Mail/SendQueuedMailable.php(83): Illuminate\\Mail\\Mailable->send()\n#9 /usr/local/apache2/htdocs/gplexCRM_resource/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(36): Illuminate\\Mail\\SendQueuedMailable->handle()\n#10 /usr/local/apache2/htdocs/gplexCRM_resource/vendor/laravel/framework/src/Illuminate/Container/Util.php(41): Illuminate\\Container\\BoundMethod::Illuminate\\Container\\{closure}()\n#11 /usr/local/apache2/htdocs/gplexCRM_resource/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(93): Illuminate\\Container\\Util::unwrapIfClosure()\n#12 /usr/local/apache2/htdocs/gplexCRM_resource/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(35): Illuminate\\Container\\BoundMethod::callBoundMethod()\n#13 /usr/local/apache2/htdocs/gplexCRM_resource/vendor/laravel/framework/src/Illuminate/Container/Container.php(662): Illuminate\\Container\\BoundMethod::call()\n#14 /usr/local/apache2/htdocs/gplexCRM_resource/vendor/laravel/framework/src/Illuminate/Bus/Dispatcher.php(128): Illuminate\\Container\\Container->call()\n#15 /usr/local/apache2/htdocs/gplexCRM_resource/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(144): Illuminate\\Bus\\Dispatcher->Illuminate\\Bus\\{closure}()\n#16 /usr/local/apache2/htdocs/gplexCRM_resource/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(119): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}()\n#17 /usr/local/apache2/htdocs/gplexCRM_resource/vendor/laravel/framework/src/Illuminate/Bus/Dispatcher.php(132): Illuminate\\Pipeline\\Pipeline->then()\n#18 /usr/local/apache2/htdocs/gplexCRM_resource/vendor/laravel/framework/src/Illuminate/Queue/CallQueuedHandler.php(123): Illuminate\\Bus\\Dispatcher->dispatchNow()\n#19 /usr/local/apache2/htdocs/gplexCRM_resource/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(144): Illuminate\\Queue\\CallQueuedHandler->Illuminate\\Queue\\{closure}()\n#20 /usr/local/apache2/htdocs/gplexCRM_resource/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(119): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}()\n#21 /usr/local/apache2/htdocs/gplexCRM_resource/vendor/laravel/framework/src/Illuminate/Queue/CallQueuedHandler.php(122): Illuminate\\Pipeline\\Pipeline->then()\n#22 /usr/local/apache2/htdocs/gplexCRM_resource/vendor/laravel/framework/src/Illuminate/Queue/CallQueuedHandler.php(70): Illuminate\\Queue\\CallQueuedHandler->dispatchThroughMiddleware()\n#23 /usr/local/apache2/htdocs/gplexCRM_resource/vendor/laravel/framework/src/Illuminate/Queue/Jobs/Job.php(102): Illuminate\\Queue\\CallQueuedHandler->call()\n#24 /usr/local/apache2/htdocs/gplexCRM_resource/vendor/laravel/framework/src/Illuminate/Queue/Worker.php(439): Illuminate\\Queue\\Jobs\\Job->fire()\n#25 /usr/local/apache2/htdocs/gplexCRM_resource/vendor/laravel/framework/src/Illuminate/Queue/Worker.php(389): Illuminate\\Queue\\Worker->process()\n#26 /usr/local/apache2/htdocs/gplexCRM_resource/vendor/laravel/framework/src/Illuminate/Queue/Worker.php(176): Illuminate\\Queue\\Worker->runJob()\n#27 /usr/local/apache2/htdocs/gplexCRM_resource/vendor/laravel/framework/src/Illuminate/Queue/Console/WorkCommand.php(137): Illuminate\\Queue\\Worker->daemon()\n#28 /usr/local/apache2/htdocs/gplexCRM_resource/vendor/laravel/framework/src/Illuminate/Queue/Console/WorkCommand.php(120): Illuminate\\Queue\\Console\\WorkCommand->runWorker()\n#29 /usr/local/apache2/htdocs/gplexCRM_resource/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(36): Illuminate\\Queue\\Console\\WorkCommand->handle()\n#30 /usr/local/apache2/htdocs/gplexCRM_resource/vendor/laravel/framework/src/Illuminate/Container/Util.php(41): Illuminate\\Container\\BoundMethod::Illuminate\\Container\\{closure}()\n#31 /usr/local/apache2/htdocs/gplexCRM_resource/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(93): Illuminate\\Container\\Util::unwrapIfClosure()\n#32 /usr/local/apache2/htdocs/gplexCRM_resource/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(35): Illuminate\\Container\\BoundMethod::callBoundMethod()\n#33 /usr/local/apache2/htdocs/gplexCRM_resource/vendor/laravel/framework/src/Illuminate/Container/Container.php(662): Illuminate\\Container\\BoundMethod::call()\n#34 /usr/local/apache2/htdocs/gplexCRM_resource/vendor/laravel/framework/src/Illuminate/Console/Command.php(211): Illuminate\\Container\\Container->call()\n#35 /usr/local/apache2/htdocs/gplexCRM_resource/vendor/symfony/console/Command/Command.php(326): Illuminate\\Console\\Command->execute()\n#36 /usr/local/apache2/htdocs/gplexCRM_resource/vendor/laravel/framework/src/Illuminate/Console/Command.php(180): Symfony\\Component\\Console\\Command\\Command->run()\n#37 /usr/local/apache2/htdocs/gplexCRM_resource/vendor/symfony/console/Application.php(1096): Illuminate\\Console\\Command->run()\n#38 /usr/local/apache2/htdocs/gplexCRM_resource/vendor/symfony/console/Application.php(324): Symfony\\Component\\Console\\Application->doRunCommand()\n#39 /usr/local/apache2/htdocs/gplexCRM_resource/vendor/symfony/console/Application.php(175): Symfony\\Component\\Console\\Application->doRun()\n#40 /usr/local/apache2/htdocs/gplexCRM_resource/vendor/laravel/framework/src/Illuminate/Foundation/Console/Kernel.php(201): Symfony\\Component\\Console\\Application->run()\n#41 /usr/local/apache2/htdocs/gplexCRM_resource/artisan(35): Illuminate\\Foundation\\Console\\Kernel->handle()\n#42 {main}', '2024-11-05 08:08:51');
INSERT INTO `failed_jobs` (`id`, `uuid`, `connection`, `queue`, `payload`, `exception`, `failed_at`) VALUES
(13, '2ca095c3-655a-450b-a53a-68be23a37627', 'database', 'default', '{\"uuid\":\"2ca095c3-655a-450b-a53a-68be23a37627\",\"displayName\":\"App\\\\Mail\\\\BulkEmail\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Mail\\\\SendQueuedMailable\",\"command\":\"O:34:\\\"Illuminate\\\\Mail\\\\SendQueuedMailable\\\":15:{s:8:\\\"mailable\\\";O:18:\\\"App\\\\Mail\\\\BulkEmail\\\":4:{s:7:\\\"subject\\\";s:13:\\\"Moni template\\\";s:4:\\\"body\\\";s:26:\\\"<p>Moni email template<\\/p>\\\";s:2:\\\"to\\\";a:1:{i:0;a:2:{s:4:\\\"name\\\";N;s:7:\\\"address\\\";s:12:\\\"labang,matha\\\";}}s:6:\\\"mailer\\\";s:4:\\\"smtp\\\";}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:13:\\\"maxExceptions\\\";N;s:17:\\\"shouldBeEncrypted\\\";b:0;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:3:\\\"job\\\";N;}\"}}', 'Symfony\\Component\\Mime\\Exception\\RfcComplianceException: Email \"labang,matha\" does not comply with addr-spec of RFC 2822. in /usr/local/apache2/htdocs/gplexCRM_resource/vendor/symfony/mime/Address.php:54\nStack trace:\n#0 /usr/local/apache2/htdocs/gplexCRM_resource/vendor/laravel/framework/src/Illuminate/Mail/Message.php(246): Symfony\\Component\\Mime\\Address->__construct()\n#1 /usr/local/apache2/htdocs/gplexCRM_resource/vendor/laravel/framework/src/Illuminate/Mail/Message.php(110): Illuminate\\Mail\\Message->addAddresses()\n#2 /usr/local/apache2/htdocs/gplexCRM_resource/vendor/laravel/framework/src/Illuminate/Mail/Mailable.php(433): Illuminate\\Mail\\Message->to()\n#3 /usr/local/apache2/htdocs/gplexCRM_resource/vendor/laravel/framework/src/Illuminate/Mail/Mailable.php(207): Illuminate\\Mail\\Mailable->buildRecipients()\n#4 /usr/local/apache2/htdocs/gplexCRM_resource/vendor/laravel/framework/src/Illuminate/Mail/Mailer.php(317): Illuminate\\Mail\\Mailable->Illuminate\\Mail\\{closure}()\n#5 /usr/local/apache2/htdocs/gplexCRM_resource/vendor/laravel/framework/src/Illuminate/Mail/Mailable.php(205): Illuminate\\Mail\\Mailer->send()\n#6 /usr/local/apache2/htdocs/gplexCRM_resource/vendor/laravel/framework/src/Illuminate/Support/Traits/Localizable.php(19): Illuminate\\Mail\\Mailable->Illuminate\\Mail\\{closure}()\n#7 /usr/local/apache2/htdocs/gplexCRM_resource/vendor/laravel/framework/src/Illuminate/Mail/Mailable.php(198): Illuminate\\Mail\\Mailable->withLocale()\n#8 /usr/local/apache2/htdocs/gplexCRM_resource/vendor/laravel/framework/src/Illuminate/Mail/SendQueuedMailable.php(83): Illuminate\\Mail\\Mailable->send()\n#9 /usr/local/apache2/htdocs/gplexCRM_resource/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(36): Illuminate\\Mail\\SendQueuedMailable->handle()\n#10 /usr/local/apache2/htdocs/gplexCRM_resource/vendor/laravel/framework/src/Illuminate/Container/Util.php(41): Illuminate\\Container\\BoundMethod::Illuminate\\Container\\{closure}()\n#11 /usr/local/apache2/htdocs/gplexCRM_resource/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(93): Illuminate\\Container\\Util::unwrapIfClosure()\n#12 /usr/local/apache2/htdocs/gplexCRM_resource/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(35): Illuminate\\Container\\BoundMethod::callBoundMethod()\n#13 /usr/local/apache2/htdocs/gplexCRM_resource/vendor/laravel/framework/src/Illuminate/Container/Container.php(662): Illuminate\\Container\\BoundMethod::call()\n#14 /usr/local/apache2/htdocs/gplexCRM_resource/vendor/laravel/framework/src/Illuminate/Bus/Dispatcher.php(128): Illuminate\\Container\\Container->call()\n#15 /usr/local/apache2/htdocs/gplexCRM_resource/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(144): Illuminate\\Bus\\Dispatcher->Illuminate\\Bus\\{closure}()\n#16 /usr/local/apache2/htdocs/gplexCRM_resource/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(119): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}()\n#17 /usr/local/apache2/htdocs/gplexCRM_resource/vendor/laravel/framework/src/Illuminate/Bus/Dispatcher.php(132): Illuminate\\Pipeline\\Pipeline->then()\n#18 /usr/local/apache2/htdocs/gplexCRM_resource/vendor/laravel/framework/src/Illuminate/Queue/CallQueuedHandler.php(123): Illuminate\\Bus\\Dispatcher->dispatchNow()\n#19 /usr/local/apache2/htdocs/gplexCRM_resource/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(144): Illuminate\\Queue\\CallQueuedHandler->Illuminate\\Queue\\{closure}()\n#20 /usr/local/apache2/htdocs/gplexCRM_resource/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(119): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}()\n#21 /usr/local/apache2/htdocs/gplexCRM_resource/vendor/laravel/framework/src/Illuminate/Queue/CallQueuedHandler.php(122): Illuminate\\Pipeline\\Pipeline->then()\n#22 /usr/local/apache2/htdocs/gplexCRM_resource/vendor/laravel/framework/src/Illuminate/Queue/CallQueuedHandler.php(70): Illuminate\\Queue\\CallQueuedHandler->dispatchThroughMiddleware()\n#23 /usr/local/apache2/htdocs/gplexCRM_resource/vendor/laravel/framework/src/Illuminate/Queue/Jobs/Job.php(102): Illuminate\\Queue\\CallQueuedHandler->call()\n#24 /usr/local/apache2/htdocs/gplexCRM_resource/vendor/laravel/framework/src/Illuminate/Queue/Worker.php(439): Illuminate\\Queue\\Jobs\\Job->fire()\n#25 /usr/local/apache2/htdocs/gplexCRM_resource/vendor/laravel/framework/src/Illuminate/Queue/Worker.php(389): Illuminate\\Queue\\Worker->process()\n#26 /usr/local/apache2/htdocs/gplexCRM_resource/vendor/laravel/framework/src/Illuminate/Queue/Worker.php(176): Illuminate\\Queue\\Worker->runJob()\n#27 /usr/local/apache2/htdocs/gplexCRM_resource/vendor/laravel/framework/src/Illuminate/Queue/Console/WorkCommand.php(137): Illuminate\\Queue\\Worker->daemon()\n#28 /usr/local/apache2/htdocs/gplexCRM_resource/vendor/laravel/framework/src/Illuminate/Queue/Console/WorkCommand.php(120): Illuminate\\Queue\\Console\\WorkCommand->runWorker()\n#29 /usr/local/apache2/htdocs/gplexCRM_resource/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(36): Illuminate\\Queue\\Console\\WorkCommand->handle()\n#30 /usr/local/apache2/htdocs/gplexCRM_resource/vendor/laravel/framework/src/Illuminate/Container/Util.php(41): Illuminate\\Container\\BoundMethod::Illuminate\\Container\\{closure}()\n#31 /usr/local/apache2/htdocs/gplexCRM_resource/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(93): Illuminate\\Container\\Util::unwrapIfClosure()\n#32 /usr/local/apache2/htdocs/gplexCRM_resource/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(35): Illuminate\\Container\\BoundMethod::callBoundMethod()\n#33 /usr/local/apache2/htdocs/gplexCRM_resource/vendor/laravel/framework/src/Illuminate/Container/Container.php(662): Illuminate\\Container\\BoundMethod::call()\n#34 /usr/local/apache2/htdocs/gplexCRM_resource/vendor/laravel/framework/src/Illuminate/Console/Command.php(211): Illuminate\\Container\\Container->call()\n#35 /usr/local/apache2/htdocs/gplexCRM_resource/vendor/symfony/console/Command/Command.php(326): Illuminate\\Console\\Command->execute()\n#36 /usr/local/apache2/htdocs/gplexCRM_resource/vendor/laravel/framework/src/Illuminate/Console/Command.php(180): Symfony\\Component\\Console\\Command\\Command->run()\n#37 /usr/local/apache2/htdocs/gplexCRM_resource/vendor/symfony/console/Application.php(1096): Illuminate\\Console\\Command->run()\n#38 /usr/local/apache2/htdocs/gplexCRM_resource/vendor/symfony/console/Application.php(324): Symfony\\Component\\Console\\Application->doRunCommand()\n#39 /usr/local/apache2/htdocs/gplexCRM_resource/vendor/symfony/console/Application.php(175): Symfony\\Component\\Console\\Application->doRun()\n#40 /usr/local/apache2/htdocs/gplexCRM_resource/vendor/laravel/framework/src/Illuminate/Foundation/Console/Kernel.php(201): Symfony\\Component\\Console\\Application->run()\n#41 /usr/local/apache2/htdocs/gplexCRM_resource/artisan(35): Illuminate\\Foundation\\Console\\Kernel->handle()\n#42 {main}', '2024-11-05 08:08:51');

-- --------------------------------------------------------

--
-- Table structure for table `faqs`
--

CREATE TABLE `faqs` (
  `id` bigint UNSIGNED NOT NULL,
  `question` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `answer` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `sort_order` int UNSIGNED NOT NULL DEFAULT '0',
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `faqs`
--

INSERT INTO `faqs` (`id`, `question`, `answer`, `sort_order`, `is_active`, `created_at`, `updated_at`) VALUES
(1, 'How do I create a new design in Fabrilife?', 'Go the the “Create” page on the top menu bar of the website or follow (farbilife.com/design). There you will find your preferred type of Tee ready to be designed with various designing options. You can write texts with various fonts and colors and outlines, or you can attach image from your own machine, or use our custom emojis. You can even search for various custom artworks and use them. Besides, there is a drawing tool by which you can draw any pattern or shape you prefer on your Tee', 1, 1, '2026-07-19 13:32:54', '2026-07-19 13:32:54'),
(2, 'What is a Campaign?', 'A campaign is a designed product you have created using our design tool in order to sell. Every item you create for selling purpose is named as “campaign”.', 0, 1, '2026-07-19 13:33:16', '2026-07-19 13:33:16');

-- --------------------------------------------------------

--
-- Table structure for table `file_section`
--

CREATE TABLE `file_section` (
  `id` bigint UNSIGNED NOT NULL,
  `lead_id` bigint UNSIGNED NOT NULL,
  `form_id` char(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_by` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `file_title` char(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `upload_file` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `file_section`
--

INSERT INTO `file_section` (`id`, `lead_id`, `form_id`, `created_by`, `file_title`, `upload_file`, `created_at`, `updated_at`) VALUES
(22, 406, '6820060189', 'shimla1236', '', 'invoice_INV-000032_1730199755_1730791521.pdf', '2024-11-05 07:25:21', '2024-11-05 07:25:21'),
(23, 407, '6820060189', NULL, 'xyz', '', NULL, NULL),
(24, 420, '6820060189', NULL, 'lead file', '', NULL, NULL),
(25, 425, '6820060189', NULL, 'fgh', '', NULL, NULL),
(26, 429, '6820060189', 'moni123', 'insurance file', 'ASH1825037M_SDA_REPORT (1)-1_1730789615_1730864202.pdf', '2024-11-06 03:36:42', '2024-11-06 03:36:42');

-- --------------------------------------------------------

--
-- Table structure for table `holidays`
--

CREATE TABLE `holidays` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `holiday_date` date DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `category` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `branch_id` bigint UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `home_page_settings`
--

CREATE TABLE `home_page_settings` (
  `id` bigint UNSIGNED NOT NULL,
  `banner_section_status` tinyint(1) NOT NULL DEFAULT '1',
  `banner_one_image` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `banner_one_url` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `banner_two_image` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `banner_two_url` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `about_section_status` tinyint(1) NOT NULL DEFAULT '1',
  `about_title` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Fabrilife',
  `about_subtitle` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `about_description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `about_image` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `about_url` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `promo_section_status` tinyint(1) NOT NULL DEFAULT '1',
  `promo_left_media` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `promo_left_url` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `promo_right_media` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `promo_right_url` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bulk_section_status` tinyint(1) NOT NULL DEFAULT '1',
  `bulk_title` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bulk_description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `bulk_image` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bulk_url` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `partners_section_status` tinyint(1) NOT NULL DEFAULT '1',
  `partners_title` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `partners_subtitle` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `partners_description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `featured_partner_logo` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `partner_logos` json DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `home_page_settings`
--

INSERT INTO `home_page_settings` (`id`, `banner_section_status`, `banner_one_image`, `banner_one_url`, `banner_two_image`, `banner_two_url`, `about_section_status`, `about_title`, `about_subtitle`, `about_description`, `about_image`, `about_url`, `promo_section_status`, `promo_left_media`, `promo_left_url`, `promo_right_media`, `promo_right_url`, `bulk_section_status`, `bulk_title`, `bulk_description`, `bulk_image`, `bulk_url`, `partners_section_status`, `partners_title`, `partners_subtitle`, `partners_description`, `featured_partner_logo`, `partner_logos`, `created_at`, `updated_at`) VALUES
(1, 1, '59c23d52-fd48-4249-a1f7-f6e7c9fc7725.jpg', '/shop-new', 'ffb5cf19-4534-4a5f-a9c3-14ff589e838d.jpg', '/shop-new', 1, 'FebriStudio', 'Because comfort and confidence go hand in hand.', 'We focus on carefully selecting the best clothing that is comfortable, looks great, and makes you confident. Apart from the fabric, design and fit, we go through strict quality control parameters to give you what you truly deserve. The power of a good outfit is how it can influence your perception of yourself.', 'f6f62fe2-5325-428f-8ffb-fc7cf8a6ed19.png', '/about-us', 1, 'ccaa2343-019c-4382-a157-8134731fdf8c.mp4', '/shop-new', 'feb/img/c05bff0974554daeb5f5f024112564f4.avif', '/shop-new', 1, 'Bulk Order / Wholesale', 'We provide plain t-shirts and apparel for all your custom branding needs from the top brands worldwide at unbeatable wholesale prices. With no minimum orders, everyone can enjoy the benefits of buying bulk t-shirts without ordering bulk quantities.', 'feb/image-gallery/5edc1d60d1b41.jpg', '/corporate', 1, 'Work with us Today', 'We are the official merchandising partner of', 'We are proud to work with over a thousand brands and organizations that we call friends. As your partner, we value long-term relationships and collaborate toward results.', '936b4e1c-beb3-45f2-9e4e-4da9f1ba4712.jpg', '[\"feb/img/clients/1.jpg\", \"feb/img/clients/2.jpg\", \"feb/img/clients/3.jpg\", \"feb/img/clients/4.jpg\", \"feb/img/clients/5.jpg\", \"feb/img/clients/6.jpg\", \"feb/img/clients/7.jpg\", \"feb/img/clients/8.jpg\", \"feb/img/clients/9.jpg\", \"feb/img/clients/10.jpg\", \"feb/img/clients/11.jpg\", \"feb/img/clients/13.jpg\", \"feb/img/clients/14.jpg\", \"feb/img/clients/15.jpg\", \"feb/img/clients/16.jpg\", \"feb/img/clients/17.jpg\", \"feb/img/clients/18.jpg\", \"feb/img/clients/19.jpg\", \"feb/img/clients/20.jpg\", \"feb/img/clients/21.jpg\", \"feb/img/clients/22.jpg\", \"feb/img/clients/23.jpg\", \"feb/img/clients/24.jpg\", \"feb/img/clients/25.jpg\", \"feb/img/clients/26.jpg\", \"feb/img/clients/27.jpg\", \"feb/img/clients/28.jpg\", \"feb/img/clients/29.jpg\", \"feb/img/clients/30.jpg\", \"feb/img/clients/31.jpg\", \"feb/img/clients/32.jpg\", \"feb/img/clients/33.jpg\", \"feb/img/clients/34.jpg\", \"feb/img/clients/35.jpg\", \"feb/img/clients/36.jpg\", \"feb/img/clients/37.jpg\", \"feb/img/clients/38.jpg\", \"feb/img/clients/39.jpg\", \"feb/img/clients/40.jpg\", \"feb/img/clients/41.jpg\", \"feb/img/clients/42.jpg\", \"feb/img/clients/43.jpg\", \"feb/img/clients/44.jpg\", \"feb/img/clients/45.jpg\", \"feb/img/clients/46.jpg\", \"feb/img/clients/47.jpg\", \"feb/img/clients/48.jpg\", \"feb/img/clients/49.jpg\", \"feb/img/clients/50.jpg\", \"feb/img/clients/51.jpg\", \"feb/img/clients/52.jpg\", \"feb/img/clients/53.jpg\", \"feb/img/clients/54.jpg\"]', '2026-07-15 06:49:48', '2026-07-20 11:02:33');

-- --------------------------------------------------------

--
-- Table structure for table `invoices`
--

CREATE TABLE `invoices` (
  `id` bigint UNSIGNED NOT NULL,
  `customer_id` bigint UNSIGNED NOT NULL,
  `invoice_number` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `invoice_date` date NOT NULL,
  `due_date` date NOT NULL,
  `currency` varchar(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'BDT',
  `sub_total` decimal(15,2) NOT NULL DEFAULT '0.00',
  `discount` decimal(15,2) NOT NULL DEFAULT '0.00',
  `discount_type` enum('No discount','Before tax','After tax') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'No discount',
  `adjustment` decimal(15,2) NOT NULL DEFAULT '0.00',
  `total_amount` decimal(15,2) NOT NULL DEFAULT '0.00',
  `address` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `admin_note` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `client_note` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `terms_conditions` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `item_description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `prevent_reminders` tinyint DEFAULT NULL,
  `is_recurring` tinyint DEFAULT NULL,
  `payment_mode` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sale_agent_id` bigint UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `invoice_custom_form`
--

CREATE TABLE `invoice_custom_form` (
  `id` bigint UNSIGNED NOT NULL,
  `invoice_name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `field_details` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `footer_details` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `total_in_word` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bank_details` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `issued_by` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint UNSIGNED NOT NULL,
  `queue` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `attempts` tinyint UNSIGNED NOT NULL,
  `reserved_at` int UNSIGNED DEFAULT NULL,
  `available_at` int UNSIGNED NOT NULL,
  `created_at` int UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `leave_applications`
--

CREATE TABLE `leave_applications` (
  `id` bigint UNSIGNED NOT NULL,
  `employee_id` bigint UNSIGNED NOT NULL,
  `leave_type_id` bigint UNSIGNED NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `days_count` int NOT NULL,
  `reason` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `attachment_path` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Pending',
  `applied_on` date NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `leave_balances`
--

CREATE TABLE `leave_balances` (
  `id` bigint UNSIGNED NOT NULL,
  `employee_id` bigint UNSIGNED NOT NULL,
  `leave_type_id` bigint UNSIGNED NOT NULL,
  `year` int NOT NULL,
  `total_days` int NOT NULL DEFAULT '0',
  `used_days` int NOT NULL DEFAULT '0',
  `available_days` int NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `leave_policies`
--

CREATE TABLE `leave_policies` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `leave_type_id` bigint UNSIGNED NOT NULL,
  `carry_forward_limit` int NOT NULL DEFAULT '0',
  `min_days` int NOT NULL DEFAULT '1',
  `max_days` int NOT NULL DEFAULT '14',
  `requires_approval` tinyint(1) NOT NULL DEFAULT '1',
  `status` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `leave_policies`
--

INSERT INTO `leave_policies` (`id`, `name`, `description`, `leave_type_id`, `carry_forward_limit`, `min_days`, `max_days`, `requires_approval`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Annual Leave Policy', 'Standard annual leave policy with yearly accrual and carry forward provisions', 1, 5, 1, 15, 1, 'Active', '2026-08-19 10:43:48', '2026-08-19 10:43:48');

-- --------------------------------------------------------

--
-- Table structure for table `leave_types`
--

CREATE TABLE `leave_types` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `max_days` int NOT NULL,
  `color` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_paid` tinyint(1) NOT NULL DEFAULT '1',
  `status` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `leave_types`
--

INSERT INTO `leave_types` (`id`, `name`, `description`, `max_days`, `color`, `is_paid`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Annual Leave', 'Yearly vacation leave for rest and recreation', 20, '#3BB2F6', 1, 'Active', '2026-08-19 10:39:14', '2026-08-19 10:39:14');

-- --------------------------------------------------------

--
-- Table structure for table `logs`
--

CREATE TABLE `logs` (
  `id` bigint NOT NULL,
  `user_id` bigint NOT NULL,
  `lead_id` int DEFAULT NULL,
  `module` varchar(180) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `sub_module` varchar(180) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `log_message` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `status` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `logs`
--

INSERT INTO `logs` (`id`, `user_id`, `lead_id`, `module`, `sub_module`, `log_message`, `status`, `created_at`, `updated_at`) VALUES
(1, 1, NULL, NULL, NULL, 'test Email Template Created', 1, '2024-07-28 02:16:07', '2024-07-28 02:16:07'),
(2, 1, NULL, NULL, NULL, 'jjj Email Template Updated', 1, '2024-07-29 23:40:29', '2024-07-29 23:40:29'),
(3, 1, NULL, 'Email Template', 'Email Template Create', 'Test template Email Template Created', 1, '2024-10-24 00:00:07', '2024-10-24 00:00:07'),
(4, 1, NULL, 'Email Template', 'Email Template Delete', 'application for email templete creation Email Template Deleted', 1, '2024-10-24 00:00:20', '2024-10-24 00:00:20'),
(5, 1, NULL, 'Email Template', 'Email Template Delete', 'Test template Email Template Deleted', 1, '2024-10-24 00:00:35', '2024-10-24 00:00:35'),
(6, 1, NULL, 'Email Template', 'Email Template Update', 'test Email Template Updated', 1, '2024-10-24 00:00:54', '2024-10-24 00:00:54'),
(7, 1, NULL, 'Email Template', 'Email Template Update', 'test123 Email Template Updated', 1, '2024-10-24 00:04:24', '2024-10-24 00:04:24'),
(8, 1, NULL, 'Email Template', 'Email Template Update', 'test123 Email Template Updated', 1, '2024-10-24 04:32:36', '2024-10-24 04:32:36'),
(9, 1, NULL, 'Email Template', 'Email Template Delete', 'xxxxx Email Template Deleted', 1, '2024-10-27 00:35:26', '2024-10-27 00:35:26'),
(10, 1, NULL, 'Email Template', 'Email Template Delete', 'hhh => Email Template => Deleted', 1, '2024-10-29 03:42:57', '2024-10-29 03:42:57'),
(11, 1, NULL, 'Email Template', 'Email Template Create', 'ghjg => Email Template => Created', 1, '2024-10-29 03:43:04', '2024-10-29 03:43:04'),
(12, 1, NULL, 'Email Template', 'Email Template Delete', 'ghjg => Email Template => Deleted', 1, '2024-10-29 03:43:09', '2024-10-29 03:43:09'),
(13, 1, NULL, 'Email Template', 'Email Template Update', 'test123 => Email Template => Updated', 1, '2024-10-29 03:43:15', '2024-10-29 03:43:15'),
(14, 1, NULL, 'Email Template', 'Email Template Create', 'testing => Email Template => Created', 1, '2024-10-29 03:44:23', '2024-10-29 03:44:23'),
(15, 1, NULL, 'Email Template', 'Email Template Update', 'testing-> => Email Template => Updated', 1, '2024-10-29 03:44:35', '2024-10-29 03:44:35'),
(16, 1, NULL, 'Email Template', 'Email Template Delete', 'uuu => Email Template => Deleted', 1, '2024-10-29 03:44:40', '2024-10-29 03:44:40'),
(17, 1, NULL, 'Email Template', 'Email Template Delete', 'efff => Email Template => Deleted', 1, '2024-10-29 03:48:54', '2024-10-29 03:48:54'),
(18, 1, 391, 'Email Module', 'Send an Email', 'Email send successfully to khadija@genusys.us => Email Module => Send Email', 1, '2024-10-29 04:10:21', '2024-10-29 04:10:21'),
(19, 1, 391, 'SMS Module', 'Send SMS', 'SMS send successfully to 01764655648 => SMS Module => Send SMS', 1, '2024-10-29 04:20:39', '2024-10-29 04:20:39'),
(20, 1, 391, 'SMS Module', 'Send SMS', 'SMS send successfully to 01764655648 => SMS Module => Send SMS', 1, '2024-10-29 04:26:27', '2024-10-29 04:26:27'),
(21, 1, NULL, 'Email Template', 'Email Template Create', 'Email template1 => Email Template => Created', 1, '2024-10-30 23:36:52', '2024-10-30 23:36:52'),
(22, 69, NULL, 'Email Template', 'Email Template Create', 'Moni template => Email Template => Created', 1, '2024-10-30 23:44:21', '2024-10-30 23:44:21'),
(23, 67, NULL, 'Email Template', 'Email Template Create', 'Kashfi template => Email Template => Created', 1, '2024-10-30 23:46:49', '2024-10-30 23:46:49'),
(24, 1, NULL, 'SMS Template', 'SMS Template Create', 'SMS template1 => SMS Template => Created', 1, '2024-10-30 23:48:22', '2024-10-30 23:48:22'),
(25, 69, NULL, 'SMS Template', 'SMS Template Create', 'Moni template => SMS Template => Created', 1, '2024-10-30 23:48:59', '2024-10-30 23:48:59'),
(26, 69, NULL, 'Email Module', 'Send an Email', 'Email send successfully to ishtiak@genusys.us => Email Module => Send Email', 1, '2024-10-30 23:49:36', '2024-10-30 23:49:36'),
(27, 69, NULL, 'Email Module', 'Send Bulk Email', 'Email send successfully to ishtiak@genusys.us => Email Module  => Send Bulk Email', 1, NULL, NULL),
(28, 69, NULL, 'Email Module', 'Send Bulk Email', 'Email send successfully to ishtiak.myplace@gmail.com => Email Module  => Send Bulk Email', 1, NULL, NULL),
(29, 69, NULL, 'Email Module', 'Send Bulk Email', 'Email send successfully to ishtiak.ia@gmail.com => Email Module  => Send Bulk Email', 1, NULL, NULL),
(30, 67, NULL, 'SMS Template', 'SMS Template Create', 'Kashfi template => SMS Template => Created', 1, '2024-10-30 23:55:13', '2024-10-30 23:55:13'),
(31, 1, 306, 'SMS Module', 'Send SMS', 'SMS send successfully to 01788888888 => SMS Module => Send SMS', 1, '2024-10-30 23:55:35', '2024-10-30 23:55:35'),
(32, 1, NULL, 'SMS Module', 'Send Bulk SMS', 'SMS send successfully to 01555555555 => SMS Module  => Send Bulk SMS', 1, NULL, NULL),
(33, 1, NULL, 'SMS Module', 'Send Bulk SMS', 'SMS send successfully to 01455555555 => SMS Module  => Send Bulk SMS', 1, NULL, NULL),
(34, 1, NULL, 'SMS Module', 'Send Bulk SMS', 'SMS send successfully to 01717898891 => SMS Module  => Send Bulk SMS', 1, NULL, NULL),
(35, 1, NULL, 'Products', 'Update Product', 'ems => Products => Updated', 1, '2024-10-30 23:56:46', '2024-10-30 23:56:46'),
(36, 1, NULL, 'Products', 'Update Product', 'ems => Products => Updated', 1, '2024-10-30 23:56:53', '2024-10-30 23:56:53'),
(37, 1, 266, 'SMS Module', 'Send SMS', 'SMS send successfully to 01875644444 => SMS Module => Send SMS', 1, '2024-10-30 23:59:55', '2024-10-30 23:59:55'),
(38, 1, NULL, 'Email Template', 'Email Template Update', 'Kashfi template => Email Template => Updated', 1, '2024-10-31 06:38:37', '2024-10-31 06:38:37'),
(39, 1, 401, 'SMS Module', 'Send SMS', 'SMS send successfully to 01796321456', 1, '2024-11-05 04:49:00', '2024-11-05 04:49:00'),
(40, 1, NULL, 'SMS Module', 'Send Bulk SMS', 'SMS send successfully to 0Route Name one => SMS Module  => Send Bulk SMS', 1, '2024-11-05 04:50:02', NULL),
(41, 1, NULL, 'SMS Module', 'Send Bulk SMS', 'SMS send successfully to 0Route Name two => SMS Module  => Send Bulk SMS', 1, '2024-11-05 04:50:02', NULL),
(42, 1, NULL, 'SMS Module', 'Send Bulk SMS', 'SMS send successfully to 0Route Name Three => SMS Module  => Send Bulk SMS', 1, '2024-11-05 04:50:02', NULL),
(43, 1, NULL, 'SMS Module', 'Send Bulk SMS', 'SMS send successfully to 0Route Name Four => SMS Module  => Send Bulk SMS', 1, '2024-11-05 04:50:02', NULL),
(44, 1, NULL, 'SMS Module', 'Send Bulk SMS', 'SMS send successfully to 0Route Name Five => SMS Module  => Send Bulk SMS', 1, '2024-11-05 04:50:02', NULL),
(45, 1, NULL, 'SMS Module', 'Send Bulk SMS', 'SMS send successfully to 0Route Name six => SMS Module  => Send Bulk SMS', 1, '2024-11-05 04:50:02', NULL),
(46, 1, NULL, 'SMS Module', 'Send Bulk SMS', 'SMS send successfully to 0Route Name seven => SMS Module  => Send Bulk SMS', 1, '2024-11-05 04:50:02', NULL),
(47, 1, NULL, 'SMS Module', 'Send Bulk SMS', 'SMS send successfully to 0Route Name nine => SMS Module  => Send Bulk SMS', 1, '2024-11-05 04:50:02', NULL),
(48, 1, 401, 'SMS Module', 'Send SMS', 'SMS send successfully to 01796321456', 1, '2024-11-05 05:38:56', '2024-11-05 05:38:56'),
(49, 1, 402, 'SMS Module', 'Send SMS', 'SMS send successfully to 01764655648', 1, '2024-11-05 05:39:41', '2024-11-05 05:39:41'),
(50, 1, 402, 'Email Module', 'Send an Email', 'Email send successfully to rayhan@ymail.com', 1, '2024-11-05 05:41:20', '2024-11-05 05:41:20'),
(51, 1, NULL, 'Email Module', 'Send an Email', 'Email send successfully to ishtiak@genusys.us', 1, '2024-11-05 06:05:06', '2024-11-05 06:05:06'),
(52, 1, NULL, 'Email Module', 'Send Bulk Email', 'Email send successfully to singara(breakfast) => Email Module  => Send Bulk Email', 1, '2024-11-05 07:09:08', NULL),
(53, 1, NULL, 'Email Module', 'Send Bulk Email', 'Email send successfully to buscuit,badam => Email Module  => Send Bulk Email', 1, '2024-11-05 07:09:08', NULL),
(54, 1, NULL, 'Email Module', 'Send Bulk Email', 'Email send successfully to singara(breakfast) => Email Module  => Send Bulk Email', 1, '2024-11-05 07:09:08', NULL),
(55, 1, NULL, 'Email Module', 'Send Bulk Email', 'Email send successfully to ice cream => Email Module  => Send Bulk Email', 1, '2024-11-05 07:09:08', NULL),
(56, 1, NULL, 'Email Module', 'Send Bulk Email', 'Email send successfully to labang,borhani,mojo => Email Module  => Send Bulk Email', 1, '2024-11-05 07:09:08', NULL),
(57, 1, NULL, 'Email Module', 'Send Bulk Email', 'Email send successfully to peyara,kasundi => Email Module  => Send Bulk Email', 1, '2024-11-05 07:09:08', NULL),
(58, 1, NULL, 'Email Module', 'Send Bulk Email', 'Email send successfully to singara(breakfast) => Email Module  => Send Bulk Email', 1, '2024-11-05 07:09:08', NULL),
(59, 1, NULL, 'Email Module', 'Send Bulk Email', 'Email send successfully to Mojo- 4(litre) => Email Module  => Send Bulk Email', 1, '2024-11-05 07:09:08', NULL),
(60, 1, NULL, 'Email Module', 'Send Bulk Email', 'Email send successfully to Ice cream,Mojo => Email Module  => Send Bulk Email', 1, '2024-11-05 07:09:08', NULL),
(61, 1, NULL, 'Email Module', 'Send Bulk Email', 'Email send successfully to singara(breakfast) => Email Module  => Send Bulk Email', 1, '2024-11-05 07:09:08', NULL),
(62, 1, NULL, 'Email Module', 'Send Bulk Email', 'Email send successfully to Labang,RC,mojo => Email Module  => Send Bulk Email', 1, '2024-11-05 07:09:08', NULL),
(63, 1, NULL, 'Email Module', 'Send Bulk Email', 'Email send successfully to Peyara,biscuit,badam,kasundi => Email Module  => Send Bulk Email', 1, '2024-11-05 07:09:08', NULL),
(64, 1, NULL, 'Email Module', 'Send Bulk Email', 'Email send successfully to labang,matha => Email Module  => Send Bulk Email', 1, '2024-11-05 07:09:08', NULL),
(65, 1, NULL, 'Email Module', 'Send Bulk Email', 'Email send successfully to ishtiak@genusys.us => Email Module  => Send Bulk Email', 1, '2024-11-05 08:07:48', NULL),
(66, 1, NULL, 'Email Module', 'Send Bulk Email', 'Email send successfully to ishtiak.myplace@gmail.com => Email Module  => Send Bulk Email', 1, '2024-11-05 08:07:48', NULL),
(67, 1, NULL, 'Email Module', 'Send Bulk Email', 'Email send successfully to ishtiak.ia@gmail.com => Email Module  => Send Bulk Email', 1, '2024-11-05 08:07:48', NULL),
(68, 75, NULL, 'Email Template', 'Email Template Create', 'create agent templete', 1, '2024-11-05 08:32:15', '2024-11-05 08:32:15'),
(69, 75, NULL, 'Email Template', 'Email Template Update', 'create agents templete', 1, '2024-11-05 08:33:11', '2024-11-05 08:33:11'),
(70, 75, 403, 'Email Module', 'Send an Email', 'Email send successfully to rakib@gmail.com', 1, '2024-11-05 08:34:26', '2024-11-05 08:34:26'),
(71, 75, 406, 'Email Module', 'Send an Email', 'Email send successfully to Faisal@gmail.com', 1, '2024-11-05 08:35:54', '2024-11-05 08:35:54'),
(72, 75, 404, 'Email Module', 'Send an Email', 'Email send successfully to shoshe@gmail.com', 1, '2024-11-05 08:38:03', '2024-11-05 08:38:03'),
(73, 75, 406, 'SMS Module', 'Send SMS', 'SMS send successfully to 01769632541', 1, '2024-11-05 08:40:27', '2024-11-05 08:40:27'),
(74, 75, 406, 'SMS Module', 'Send SMS', 'SMS send successfully to 01769632541', 1, '2024-11-05 08:46:51', '2024-11-05 08:46:51'),
(75, 75, NULL, 'Email Module', 'Send Bulk Email', 'Email send successfully to khadija@genusys.us => Email Module  => Send Bulk Email', 1, '2024-11-05 08:52:19', NULL),
(76, 75, NULL, 'Email Module', 'Send Bulk Email', 'Email send successfully to akterkhadija309@genusys.us => Email Module  => Send Bulk Email', 1, '2024-11-05 08:52:19', NULL),
(77, 75, NULL, 'Email Module', 'Send Bulk Email', 'Email send successfully to khadija+1@genusys.us => Email Module  => Send Bulk Email', 1, '2024-11-05 08:52:19', NULL),
(78, 75, 406, 'Email Module', 'Send Bulk Email', 'Email send successfully to Faisal@gmail.com => Email Module  => Send Bulk Email', 1, '2024-11-05 08:52:19', NULL),
(79, 75, 404, 'Email Module', 'Send Bulk Email', 'Email send successfully to shoshe@gmail.com => Email Module  => Send Bulk Email', 1, '2024-11-05 08:52:19', NULL),
(80, 75, 403, 'Email Module', 'Send Bulk Email', 'Email send successfully to rakib@gmail.com => Email Module  => Send Bulk Email', 1, '2024-11-05 08:52:19', NULL),
(81, 75, NULL, 'SMS Module', 'Send Bulk SMS', 'SMS send successfully to 01787877123 => SMS Module  => Send Bulk SMS', 1, '2024-11-05 09:02:27', NULL),
(82, 75, NULL, 'SMS Module', 'Send Bulk SMS', 'SMS send successfully to 01787877113 => SMS Module  => Send Bulk SMS', 1, '2024-11-05 09:02:27', NULL),
(83, 75, NULL, 'SMS Module', 'Send Bulk SMS', 'SMS send successfully to 01787877123 => SMS Module  => Send Bulk SMS', 1, '2024-11-05 09:02:27', NULL),
(84, 75, NULL, 'SMS Module', 'Send Bulk SMS', 'SMS send successfully to 01667655555 => SMS Module  => Send Bulk SMS', 1, '2024-11-05 09:02:27', NULL),
(85, 75, 406, 'SMS Module', 'Send Bulk SMS', 'SMS send successfully to 01769632541 => SMS Module  => Send Bulk SMS', 1, '2024-11-05 09:02:27', NULL),
(86, 75, 404, 'SMS Module', 'Send Bulk SMS', 'SMS send successfully to 01762680927 => SMS Module  => Send Bulk SMS', 1, '2024-11-05 09:02:27', NULL),
(87, 75, 403, 'SMS Module', 'Send Bulk SMS', 'SMS send successfully to 01645239865 => SMS Module  => Send Bulk SMS', 1, '2024-11-05 09:02:27', NULL),
(88, 69, 411, 'Meeting', 'Create Meeting', 'Meeting created successfully', 1, '2024-11-05 09:28:06', '2024-11-05 09:28:06'),
(89, 69, NULL, 'Email Template', 'Email Template Create', 'second agent created email', 1, '2024-11-05 09:30:22', '2024-11-05 09:30:22'),
(90, 69, NULL, 'Email Template', 'Email Template Update', 'second agent created email', 1, '2024-11-05 09:30:38', '2024-11-05 09:30:38'),
(91, 69, NULL, 'Email Template', 'Email Template Create', 'dfgd', 1, '2024-11-05 09:30:48', '2024-11-05 09:30:48'),
(92, 69, NULL, 'Email Template', 'Email Template Delete', 'dfgd', 1, '2024-11-05 09:30:55', '2024-11-05 09:30:55'),
(93, 69, 411, 'Email Module', 'Send an Email', 'Email send successfully to rony@gmail.com', 1, '2024-11-05 09:31:43', '2024-11-05 09:31:43'),
(94, 69, 411, 'Email Module', 'Send an Email', 'Email send successfully to rony@gmail.com', 1, '2024-11-05 09:32:27', '2024-11-05 09:32:27'),
(95, 69, 411, 'Meeting', 'Edit Meeting', 'Meeting edited successfully', 1, '2024-11-05 09:34:38', '2024-11-05 09:34:38'),
(96, 69, 411, 'Meeting', 'Create Meeting', 'Meeting created successfully', 1, '2024-11-05 09:34:54', '2024-11-05 09:34:54'),
(97, 69, 411, 'Meeting', 'Edit Meeting', 'Meeting edited successfully', 1, '2024-11-05 09:35:38', '2024-11-05 09:35:38'),
(98, 69, NULL, 'Meeting', 'updateFeedback', 'Meeting feedback updated successfully', 1, '2024-11-05 09:36:00', '2024-11-05 09:36:00'),
(99, 69, 411, 'Meeting', 'Create Meeting', 'Meeting created successfully', 1, '2024-11-05 09:37:26', '2024-11-05 09:37:26'),
(100, 69, 411, 'Meeting', 'Create Meeting', 'Meeting created successfully', 1, '2024-11-05 09:37:50', '2024-11-05 09:37:50'),
(101, 69, NULL, 'Meeting', 'updateFeedback', 'Meeting feedback updated successfully', 1, '2024-11-05 09:38:08', '2024-11-05 09:38:08'),
(102, 69, NULL, 'Meeting', 'updateFeedback', 'Meeting feedback updated successfully', 1, '2024-11-05 09:38:16', '2024-11-05 09:38:16'),
(103, 69, 411, 'Meeting', 'Edit Meeting', 'Meeting edited successfully', 1, '2024-11-05 09:38:42', '2024-11-05 09:38:42'),
(104, 75, 404, 'Meeting', 'Create Meeting', 'Meeting created successfully', 1, '2024-11-05 09:40:02', '2024-11-05 09:40:02'),
(105, 1, NULL, 'Meeting', 'delete Meeting', 'Meeting deleted successfully', 1, '2024-11-05 09:47:04', '2024-11-05 09:47:04'),
(106, 1, 411, 'Meeting', 'Create Meeting', 'Meeting created successfully', 1, '2024-11-05 09:47:24', '2024-11-05 09:47:24'),
(107, 69, NULL, 'SMS Module', 'Send Bulk SMS', 'SMS send successfully to 01787877123 => SMS Module  => Send Bulk SMS', 1, '2024-11-05 09:51:18', NULL),
(108, 69, NULL, 'SMS Module', 'Send Bulk SMS', 'SMS send successfully to 01787877113 => SMS Module  => Send Bulk SMS', 1, '2024-11-05 09:51:18', NULL),
(109, 69, NULL, 'SMS Module', 'Send Bulk SMS', 'SMS send successfully to 01787877123 => SMS Module  => Send Bulk SMS', 1, '2024-11-05 09:51:18', NULL),
(110, 69, NULL, 'SMS Module', 'Send Bulk SMS', 'SMS send successfully to 01667655555 => SMS Module  => Send Bulk SMS', 1, '2024-11-05 09:51:18', NULL),
(111, 69, 406, 'SMS Module', 'Send Bulk SMS', 'SMS send successfully to 01769632541 => SMS Module  => Send Bulk SMS', 1, '2024-11-05 09:51:18', NULL),
(112, 69, 404, 'SMS Module', 'Send Bulk SMS', 'SMS send successfully to 01762680927 => SMS Module  => Send Bulk SMS', 1, '2024-11-05 09:51:18', NULL),
(113, 69, 403, 'SMS Module', 'Send Bulk SMS', 'SMS send successfully to 01645239865 => SMS Module  => Send Bulk SMS', 1, '2024-11-05 09:51:18', NULL),
(114, 69, 411, 'SMS Module', 'Send Bulk SMS', 'SMS send successfully to 01764655652 => SMS Module  => Send Bulk SMS', 1, '2024-11-05 09:51:18', NULL),
(115, 69, 411, 'SMS Module', 'Send SMS', 'SMS send successfully to 01764655652', 1, '2024-11-05 09:52:10', '2024-11-05 09:52:10'),
(116, 69, 411, 'Meeting', 'Edit Meeting', 'Meeting edited successfully', 1, '2024-11-05 09:52:54', '2024-11-05 09:52:54'),
(117, 69, 411, 'Meeting', 'Create Meeting', 'Meeting created successfully', 1, '2024-11-05 10:09:19', '2024-11-05 10:09:19'),
(118, 69, NULL, 'Meeting', 'delete Meeting', 'Meeting deleted successfully', 1, '2024-11-05 10:09:22', '2024-11-05 10:09:22'),
(119, 1, NULL, 'Meeting', 'delete Meeting', 'Meeting deleted successfully', 1, '2024-11-05 10:09:39', '2024-11-05 10:09:39'),
(120, 1, NULL, 'Meeting', 'delete Meeting', 'Meeting deleted successfully', 1, '2024-11-05 10:09:57', '2024-11-05 10:09:57'),
(121, 69, NULL, 'SMS Template', 'SMS Template Create', 'agent sms templete', 1, '2024-11-05 10:11:31', '2024-11-05 10:11:31'),
(122, 69, 418, 'SMS Module', 'Send SMS', 'SMS send successfully to 01764655985', 1, '2024-11-05 10:24:09', '2024-11-05 10:24:09'),
(123, 69, 425, 'Email Module', 'Send an Email', 'Email send successfully to wer@gmail.com', 1, '2024-11-05 10:35:46', '2024-11-05 10:35:46'),
(124, 69, 425, 'SMS Module', 'Send SMS', 'SMS send successfully to 01698745632', 1, '2024-11-05 10:36:47', '2024-11-05 10:36:47'),
(125, 69, 425, 'Meeting', 'Create Meeting', 'Meeting created successfully', 1, '2024-11-05 10:37:12', '2024-11-05 10:37:12'),
(126, 69, NULL, 'SMS Module', 'Send Bulk SMS', 'SMS send successfully to 01787877123 => SMS Module  => Send Bulk SMS', 1, '2024-11-05 10:39:15', NULL),
(127, 69, NULL, 'SMS Module', 'Send Bulk SMS', 'SMS send successfully to 01787877113 => SMS Module  => Send Bulk SMS', 1, '2024-11-05 10:39:15', NULL),
(128, 69, NULL, 'SMS Module', 'Send Bulk SMS', 'SMS send successfully to 01787877123 => SMS Module  => Send Bulk SMS', 1, '2024-11-05 10:39:15', NULL),
(129, 69, NULL, 'SMS Module', 'Send Bulk SMS', 'SMS send successfully to 01667655555 => SMS Module  => Send Bulk SMS', 1, '2024-11-05 10:39:15', NULL),
(130, 69, 406, 'SMS Module', 'Send Bulk SMS', 'SMS send successfully to 01769632541 => SMS Module  => Send Bulk SMS', 1, '2024-11-05 10:39:15', NULL),
(131, 69, 404, 'SMS Module', 'Send Bulk SMS', 'SMS send successfully to 01762680927 => SMS Module  => Send Bulk SMS', 1, '2024-11-05 10:39:15', NULL),
(132, 69, 403, 'SMS Module', 'Send Bulk SMS', 'SMS send successfully to 01645239865 => SMS Module  => Send Bulk SMS', 1, '2024-11-05 10:39:15', NULL),
(133, 69, NULL, 'Email Module', 'Send Bulk Email', 'Email send successfully to khadija@genusys.us => Email Module  => Send Bulk Email', 1, '2024-11-05 10:43:03', NULL),
(134, 69, NULL, 'Email Module', 'Send Bulk Email', 'Email send successfully to akterkhadija309@genusys.us => Email Module  => Send Bulk Email', 1, '2024-11-05 10:43:03', NULL),
(135, 69, NULL, 'Email Module', 'Send Bulk Email', 'Email send successfully to khadija+1@genusys.us => Email Module  => Send Bulk Email', 1, '2024-11-05 10:43:03', NULL),
(136, 69, 406, 'Email Module', 'Send Bulk Email', 'Email send successfully to Faisal@gmail.com => Email Module  => Send Bulk Email', 1, '2024-11-05 10:43:03', NULL),
(137, 69, 404, 'Email Module', 'Send Bulk Email', 'Email send successfully to shoshe@gmail.com => Email Module  => Send Bulk Email', 1, '2024-11-05 10:43:03', NULL),
(138, 69, 403, 'Email Module', 'Send Bulk Email', 'Email send successfully to rakib@gmail.com => Email Module  => Send Bulk Email', 1, '2024-11-05 10:43:03', NULL),
(139, 69, 425, 'Email Module', 'Send Bulk Email', 'Email send successfully to wer@gmail.com => Email Module  => Send Bulk Email', 1, '2024-11-05 10:43:03', NULL),
(140, 69, 411, 'Email Module', 'Send Bulk Email', 'Email send successfully to rony@gmail.com => Email Module  => Send Bulk Email', 1, '2024-11-05 10:43:03', NULL),
(141, 1, 420, 'proposal', 'save proposal', 'proposal sent successfully', 1, '2024-11-05 10:55:11', '2024-11-05 10:55:11'),
(142, 1, 420, 'proposal', 'edit proposal', 'proposal edited', 1, '2024-11-05 10:55:22', '2024-11-05 10:55:22'),
(143, 69, NULL, 'Products', 'Add Product', 'Social', 1, '2024-11-05 10:57:48', '2024-11-05 10:57:48'),
(144, 69, 411, 'proposal', 'save proposal', 'proposal sent successfully', 1, '2024-11-05 12:09:48', '2024-11-05 12:09:48'),
(145, 69, 406, 'proposal', 'edit proposal', 'proposal edited', 1, '2024-11-06 03:25:41', '2024-11-06 03:25:41'),
(146, 69, 406, 'proposal', 'edit proposal', 'proposal edited', 1, '2024-11-06 03:26:15', '2024-11-06 03:26:15'),
(147, 1, 403, 'proposal', 'edit proposal', 'proposal edited', 1, '2024-11-06 03:27:28', '2024-11-06 03:27:28'),
(148, 69, NULL, 'Products', 'Delete Product', 'Social', 1, '2024-11-06 03:59:20', '2024-11-06 03:59:20'),
(149, 69, NULL, 'Products', 'Add Product', 'Social', 1, '2024-11-06 03:59:50', '2024-11-06 03:59:50'),
(150, 69, NULL, 'Products', 'Update Product', 'Social', 1, '2024-11-06 04:00:13', '2024-11-06 04:00:13'),
(151, 1, 411, 'proposal', 'edit proposal', 'proposal edited', 1, '2024-11-06 04:09:43', '2024-11-06 04:09:43'),
(152, 69, 297, 'proposal', 'delete proposal', 'proposal deleted successfully', 1, '2024-11-06 04:15:43', '2024-11-06 04:15:43'),
(153, 1, 266, 'proposal', 'delete proposal', 'proposal deleted successfully', 1, '2024-11-06 04:16:01', '2024-11-06 04:16:01'),
(154, 69, 420, 'proposal', 'delete proposal', 'proposal deleted successfully', 1, '2024-11-06 04:16:15', '2024-11-06 04:16:15'),
(155, 69, 411, 'proposal', 'delete proposal', 'proposal deleted successfully', 1, '2024-11-06 04:16:20', '2024-11-06 04:16:20'),
(156, 69, 404, 'proposal', 'save proposal', 'proposal sent successfully', 1, '2024-11-06 04:18:09', '2024-11-06 04:18:09'),
(157, 69, 404, 'proposal', 'delete proposal', 'proposal deleted successfully', 1, '2024-11-06 04:18:21', '2024-11-06 04:18:21'),
(158, 1, 407, 'proposal', 'save proposal', 'proposal sent successfully', 1, '2024-11-06 04:20:00', '2024-11-06 04:20:00'),
(159, 1, 407, 'proposal', 'edit proposal', 'proposal edited', 1, '2024-11-06 04:20:13', '2024-11-06 04:20:13'),
(160, 1, 407, 'proposal', 'delete proposal', 'proposal deleted successfully', 1, '2024-11-06 04:20:19', '2024-11-06 04:20:19'),
(161, 1, 406, 'proposal', 'save proposal', 'proposal sent successfully', 1, '2024-11-06 04:24:33', '2024-11-06 04:24:33'),
(162, 1, 403, 'proposal', 'save proposal', 'proposal sent successfully', 1, '2024-11-06 04:26:53', '2024-11-06 04:26:53'),
(163, 69, 411, 'proposal', 'save proposal', 'proposal sent successfully', 1, '2024-11-06 04:38:59', '2024-11-06 04:38:59'),
(164, 69, 429, 'Email Module', 'Send an Email', 'Email send successfully to Sadman@Gmail.com', 1, '2024-11-06 05:01:57', '2024-11-06 05:01:57'),
(165, 69, 429, 'SMS Module', 'Send SMS', 'SMS send successfully to 01764652365', 1, '2024-11-06 05:02:14', '2024-11-06 05:02:14'),
(166, 69, 429, 'Meeting', 'Edit Meeting', 'Meeting edited successfully', 1, '2024-11-06 05:03:11', '2024-11-06 05:03:11'),
(167, 78, 430, 'Email Module', 'Send an Email', 'Email send successfully to sh@genusys.us', 1, '2024-11-06 05:17:22', '2024-11-06 05:17:22'),
(168, 78, 430, 'SMS Module', 'Send SMS', 'SMS send successfully to 01717761611', 1, '2024-11-06 05:19:09', '2024-11-06 05:19:09'),
(169, 78, 430, 'Meeting', 'Create Meeting', 'Meeting created successfully', 1, '2024-11-06 05:21:46', '2024-11-06 05:21:46'),
(170, 78, NULL, 'Meeting', 'updateFeedback', 'Meeting feedback updated successfully', 1, '2024-11-06 05:23:31', '2024-11-06 05:23:31'),
(171, 1, NULL, 'Tasks', 'Add Task', 'New task added, New task', 1, '2024-11-06 05:56:43', '2024-11-06 05:56:43'),
(172, 1, NULL, 'Tasks', 'Task Status Change', 'Status Change of task, New task', 1, '2024-11-06 06:01:38', '2024-11-06 06:01:38'),
(173, 1, NULL, 'Tasks', 'Task Delete', 'Delete task, New task', 1, '2024-11-06 06:01:50', '2024-11-06 06:01:50'),
(174, 1, NULL, 'SMS Module', 'Send SMS', 'SMS send successfully to 01233333333', 1, '2024-11-06 11:42:06', '2024-11-06 11:42:06'),
(175, 1, NULL, 'Meeting', 'Edit Meeting', 'Meeting edited successfully', 1, '2024-11-06 11:50:39', '2024-11-06 11:50:39'),
(176, 1, NULL, 'Meeting', 'Edit Meeting', 'Meeting edited successfully', 1, '2024-11-06 11:50:52', '2024-11-06 11:50:52'),
(177, 1, 403, 'Meeting', 'Create Meeting', 'Meeting created successfully', 1, '2024-11-07 04:29:19', '2024-11-07 04:29:19'),
(178, 1, NULL, 'Email Module', 'Send an Email', 'Email sent successfully to masud.haque@genusys.us', 1, '2024-11-07 05:09:58', '2024-11-07 05:09:58'),
(179, 1, NULL, 'Email Module', 'Send an Email', 'Email sent successfully to rokib@gmail.com', 1, '2024-11-07 05:10:00', '2024-11-07 05:10:00'),
(180, 1, NULL, 'Email Module', 'Send an Email', 'Email sent successfully to k@gmail.com', 1, '2024-11-07 05:10:01', '2024-11-07 05:10:01'),
(181, 1, NULL, 'Email Module', 'Send an Email', 'Email sent successfully to khadija@gmail.com', 1, '2024-11-07 05:10:02', '2024-11-07 05:10:02'),
(182, 1, NULL, 'Email Module', 'Send an Email', 'Email sent successfully to kasfi@gmail.com', 1, '2024-11-07 05:10:04', '2024-11-07 05:10:04'),
(183, 1, NULL, 'Email Module', 'Send an Email', 'Email sent successfully to khadija@gmail.com', 1, '2024-11-07 05:10:05', '2024-11-07 05:10:05'),
(184, 1, NULL, 'Email Module', 'Send an Email', 'Email sent successfully to rifa@gmail.com', 1, '2024-11-07 05:10:06', '2024-11-07 05:10:06'),
(185, 1, NULL, 'Email Module', 'Send an Email', 'Email sent successfully to asif@gmail.com', 1, '2024-11-07 05:10:07', '2024-11-07 05:10:07'),
(186, 1, NULL, 'Email Module', 'Send an Email', 'Email sent successfully to puja@gmail.com', 1, '2024-11-07 05:10:09', '2024-11-07 05:10:09'),
(187, 1, NULL, 'Email Module', 'Send an Email', 'Email sent successfully to prokrity@gmail.com', 1, '2024-11-07 05:10:10', '2024-11-07 05:10:10'),
(188, 1, NULL, 'Email Module', 'Send an Email', 'Email sent successfully to rafi@gmail.com', 1, '2024-11-07 05:10:12', '2024-11-07 05:10:12'),
(189, 1, NULL, 'Email Module', 'Send an Email', 'Email sent successfully to kasfi@gmail.com', 1, '2024-11-07 05:10:13', '2024-11-07 05:10:13'),
(190, 1, NULL, 'Email Module', 'Send an Email', 'Email sent successfully to khan@gmail.com', 1, '2024-11-07 05:10:14', '2024-11-07 05:10:14'),
(191, 1, NULL, 'Email Module', 'Send an Email', 'Email sent successfully to rokib@gmail.com', 1, '2024-11-07 05:10:15', '2024-11-07 05:10:15'),
(192, 1, NULL, 'Email Module', 'Send an Email', 'Email sent successfully to jaman@gmail.com', 1, '2024-11-07 05:10:17', '2024-11-07 05:10:17'),
(193, 1, 403, 'SMS Module', 'Send SMS', 'SMS send successfully to 01645239865', 1, '2024-11-07 05:11:18', '2024-11-07 05:11:18'),
(194, 1, NULL, 'Email Module', 'Send an Email', 'Email sent successfully to xxx@gmail', 1, '2024-11-07 05:30:25', '2024-11-07 05:30:25'),
(195, 1, NULL, 'Email Module', 'Send an Email', 'Email sent successfully to dffdfsdf@dtttttt', 1, '2024-11-07 05:30:27', '2024-11-07 05:30:27'),
(196, 1, NULL, 'Email Module', 'Send an Email', 'Email sent successfully to sayma@gmail.com', 1, '2024-11-07 05:30:28', '2024-11-07 05:30:28'),
(197, 1, NULL, 'Email Module', 'Send an Email', 'Email sent successfully to shoshe@gmail.com', 1, '2024-11-07 05:30:30', '2024-11-07 05:30:30'),
(198, 1, NULL, 'Email Module', 'Send an Email', 'Email sent successfully to xyz@gmail.com', 1, '2024-11-07 05:30:31', '2024-11-07 05:30:31'),
(199, 1, NULL, 'Email Module', 'Send an Email', 'Email sent successfully to karim@gmail.com', 1, '2024-11-07 05:30:32', '2024-11-07 05:30:32'),
(200, 1, NULL, 'Email Module', 'Send an Email', 'Email sent successfully to khadija@genusys.us', 1, '2024-11-07 05:30:34', '2024-11-07 05:30:34'),
(201, 1, NULL, 'Email Module', 'Send an Email', 'Email sent successfully to sami@yahoo.com', 1, '2024-11-07 05:30:35', '2024-11-07 05:30:35'),
(202, 1, NULL, 'Email Module', 'Send an Email', 'Email sent successfully to khadija+1@genusys.us', 1, '2024-11-07 05:30:36', '2024-11-07 05:30:36'),
(203, 1, NULL, 'Email Module', 'Send an Email', 'Email sent successfully to khadija+1@genusys.us', 1, '2024-11-07 05:30:38', '2024-11-07 05:30:38'),
(204, 1, NULL, 'Email Module', 'Send an Email', 'Email sent successfully to kamrul@gmail.com', 1, '2024-11-07 05:30:39', '2024-11-07 05:30:39'),
(205, 1, NULL, 'Email Module', 'Send an Email', 'Email sent successfully to ishtiak@genusys.us', 1, '2024-11-07 05:30:40', '2024-11-07 05:30:40'),
(206, 1, NULL, 'Email Module', 'Send an Email', 'Email sent successfully to ishtiak@genusys.us', 1, '2024-11-07 05:30:42', '2024-11-07 05:30:42'),
(207, 1, NULL, 'Email Module', 'Send an Email', 'Email sent successfully to ishtiak@genusys.us', 1, '2024-11-07 05:30:43', '2024-11-07 05:30:43'),
(208, 1, NULL, 'Email Module', 'Send an Email', 'Email sent successfully to ishtiak@genusys.us', 1, '2024-11-07 05:30:44', '2024-11-07 05:30:44'),
(209, 1, NULL, 'Email Module', 'Send an Email', 'Email sent successfully to rony@gmail.com', 1, '2024-11-07 05:31:59', '2024-11-07 05:31:59'),
(210, 1, NULL, 'Email Module', 'Send an Email', 'Email sent successfully to rony@gmail.com', 1, '2024-11-07 05:32:00', '2024-11-07 05:32:00'),
(211, 1, NULL, 'Email Module', 'Send an Email', 'Email sent successfully to jaman@gmail.com', 1, '2024-11-07 05:32:02', '2024-11-07 05:32:02'),
(212, 1, NULL, 'Email Module', 'Send an Email', 'Email sent successfully to asif@gmail.com', 1, '2024-11-07 05:32:03', '2024-11-07 05:32:03'),
(213, 1, NULL, 'Email Module', 'Send an Email', 'Email sent successfully to rokibuzzaman@genusys.us', 1, '2024-11-07 05:32:05', '2024-11-07 05:32:05'),
(214, 1, 403, 'Email Module', 'Send an Email', 'Email sent successfully to rokibuzzaman@genusys.us', 1, '2024-11-07 05:32:06', '2024-11-07 05:32:06'),
(215, 1, NULL, 'Email Module', 'Send an Email', 'Email sent successfully to ishtiak@genusys.us', 1, '2024-11-07 05:32:08', '2024-11-07 05:32:08'),
(216, 1, NULL, 'Email Module', 'Send an Email', 'Email sent successfully to ishtiak.myplace@gmail.com', 1, '2024-11-07 05:32:09', '2024-11-07 05:32:09'),
(217, 1, NULL, 'Email Module', 'Send an Email', 'Email sent successfully to ishtiak.ia@gmail.com', 1, '2024-11-07 05:32:10', '2024-11-07 05:32:10'),
(218, 1, NULL, 'Email Module', 'Send an Email', 'Email sent successfully to ishtiak@genusys.us', 1, '2024-11-07 11:10:04', '2024-11-07 11:10:04'),
(219, 1, 404, 'SMS Module', 'Send SMS', 'SMS send successfully to 01762680927', 1, '2024-11-07 11:11:08', '2024-11-07 11:11:08'),
(220, 1, NULL, 'Email Module', 'Send an Email', 'Email sent successfully to ishtiak@genusys.us', 1, '2024-11-07 11:14:04', '2024-11-07 11:14:04'),
(221, 1, NULL, 'Email Module', 'Send an Email', 'Email sent successfully to ishtiak.myplace@gmail.com', 1, '2024-11-07 11:14:05', '2024-11-07 11:14:05'),
(222, 1, NULL, 'Email Module', 'Send an Email', 'Email sent successfully to ishtiak.ia@gmail.com', 1, '2024-11-07 11:14:07', '2024-11-07 11:14:07'),
(223, 1, 404, 'Email Module', 'Send an Email', 'Email sent successfully to khadija@genusys.us', 1, '2024-11-07 11:18:04', '2024-11-07 11:18:04'),
(224, 1, NULL, 'Products', 'Add Product MOBIL 1 0W-20 Fully Synthetic 4 Litre', 'MOBIL 1 0W-20 Fully Synthetic 4 Litre', 1, '2024-11-25 19:16:00', '2024-11-25 19:16:00'),
(225, 1, NULL, 'Products', 'Update Product', 'MOBIL 1 0W-20 Fully Synthetic 4 Litre', 1, '2024-11-25 19:41:20', '2024-11-25 19:41:20'),
(226, 79, NULL, 'Products', 'Update Product', 'Tyre four', 1, '2024-12-22 18:10:01', '2024-12-22 18:10:01'),
(227, 79, NULL, 'Products', 'Update Product', 'Tyre one', 1, '2024-12-22 18:10:53', '2024-12-22 18:10:53'),
(228, 79, NULL, 'Products', 'Update Product', 'Tyre two', 1, '2024-12-22 18:11:04', '2024-12-22 18:11:04'),
(229, 79, NULL, 'Products', 'Update Product', 'Tyre three', 1, '2024-12-22 18:11:14', '2024-12-22 18:11:14'),
(230, 79, NULL, 'Products', 'Update Product', 'Joyroom JR-PBF04 20000mAh 65W Fast Charging Power Bank', 1, '2024-12-22 18:16:46', '2024-12-22 18:16:46'),
(231, 79, NULL, 'Products', 'Update Product', 'Joyroom JR-PBF04 20000mAh 65W Fast Charging Power Bank', 1, '2024-12-22 18:17:14', '2024-12-22 18:17:14'),
(232, 79, NULL, 'Products', 'Update Product', 'Lubricant Three', 1, '2024-12-22 18:17:41', '2024-12-22 18:17:41'),
(233, 79, NULL, 'Products', 'Update Product', 'Lubricant one', 1, '2024-12-22 18:17:53', '2024-12-22 18:17:53'),
(234, 79, NULL, 'Products', 'Update Product', 'Lubricant Four', 1, '2024-12-22 18:18:19', '2024-12-22 18:18:19'),
(235, 79, NULL, 'Products', 'Update Product', 'Break Shoe two', 1, '2024-12-22 18:45:09', '2024-12-22 18:45:09'),
(236, 79, NULL, 'Products', 'Update Product', 'Break Shoe', 1, '2024-12-22 18:45:26', '2024-12-22 18:45:26'),
(237, 79, NULL, 'Products', 'Update Product', 'Battery two', 1, '2024-12-22 18:49:38', '2024-12-22 18:49:38'),
(238, 79, NULL, 'Products', 'Update Product', 'Battery One', 1, '2024-12-22 18:49:47', '2024-12-22 18:49:47'),
(239, 79, NULL, 'Products', 'Add Product Test product', 'Test product', 1, '2025-01-05 09:40:49', '2025-01-05 09:40:49'),
(240, 79, NULL, 'Products', 'Update Product', 'Test product', 1, '2025-01-05 09:41:24', '2025-01-05 09:41:24'),
(241, 79, NULL, 'Products', 'Update Product', 'Test product', 1, '2025-01-05 09:42:54', '2025-01-05 09:42:54'),
(242, 79, NULL, 'Products', 'Add Product Race car wash shampoo', 'Race car wash shampoo', 1, '2025-01-20 10:24:18', '2025-01-20 10:24:18'),
(243, 79, NULL, 'Products', 'Add Product Car Wash Shampoo', 'Car Wash Shampoo', 1, '2025-01-20 10:30:41', '2025-01-20 10:30:41'),
(244, 79, NULL, 'Products', 'Delete Product', 'Car Wash Shampoo', 1, '2025-01-20 10:31:47', '2025-01-20 10:31:47'),
(245, 79, NULL, 'Products', 'Update Product', 'Race car wash shampoo', 1, '2025-01-20 10:39:40', '2025-01-20 10:39:40'),
(246, 79, NULL, 'Products', 'Update Product', 'Race car wash shampoo', 1, '2025-01-20 12:56:37', '2025-01-20 12:56:37'),
(247, 79, NULL, 'Products', 'Update Product', 'Race car wash shampoo', 1, '2025-01-20 12:58:23', '2025-01-20 12:58:23'),
(248, 79, NULL, 'Products', 'Update Product', 'Race car wash shampoo', 1, '2025-01-20 13:20:36', '2025-01-20 13:20:36'),
(249, 79, NULL, 'Products', 'Add Product Air Freshener', 'Air Freshener', 1, '2025-01-20 13:21:55', '2025-01-20 13:21:55'),
(250, 79, NULL, 'Products', 'Add Product Air freshener 02', 'Air freshener 02', 1, '2025-01-20 13:23:40', '2025-01-20 13:23:40'),
(251, 79, NULL, 'Products', 'Update Product', 'Race car wash shampoo', 1, '2025-01-20 13:26:47', '2025-01-20 13:26:47'),
(252, 79, NULL, 'Products', 'Add Product New one', 'New one', 1, '2025-01-20 13:51:23', '2025-01-20 13:51:23'),
(253, 79, NULL, 'Products', 'Delete Product', 'New one', 1, '2025-01-20 16:17:23', '2025-01-20 16:17:23'),
(254, 79, NULL, 'Products', 'Add Product Shampoo', 'Shampoo', 1, '2025-01-20 16:18:29', '2025-01-20 16:18:29'),
(255, 79, NULL, 'Products', 'Add Product Shampoo 01', 'Shampoo 01', 1, '2025-01-20 16:21:31', '2025-01-20 16:21:31'),
(256, 79, NULL, 'Products', 'Update Product', 'Shampoo 01', 1, '2025-01-20 18:11:07', '2025-01-20 18:11:07'),
(257, 79, NULL, 'Products', 'Add Product Leather Conditioner', 'Leather Conditioner', 1, '2025-01-20 18:12:55', '2025-01-20 18:12:55'),
(258, 79, NULL, 'Products', 'Add Product gvfbvf', 'gvfbvf', 1, '2025-01-20 18:15:46', '2025-01-20 18:15:46'),
(259, 79, NULL, 'Products', 'Add Product New test product', 'New test product', 1, '2025-01-20 18:22:47', '2025-01-20 18:22:47'),
(260, 79, NULL, 'Products', 'Delete Product', 'New test product', 1, '2025-01-20 18:26:58', '2025-01-20 18:26:58'),
(261, 79, NULL, 'Products', 'Delete Product', 'gvfbvf', 1, '2025-01-20 18:27:01', '2025-01-20 18:27:01'),
(262, 79, NULL, 'Products', 'Delete Product', 'Leather Conditioner', 1, '2025-01-20 18:28:27', '2025-01-20 18:28:27'),
(263, 79, NULL, 'Products', 'Delete Product', 'Test product', 1, '2025-01-20 18:28:38', '2025-01-20 18:28:38'),
(264, 79, NULL, 'Products', 'Delete Product', 'Shampoo 01', 1, '2025-01-20 18:28:58', '2025-01-20 18:28:58'),
(265, 79, NULL, 'Products', 'Delete Product', 'Shampoo', 1, '2025-01-20 18:29:01', '2025-01-20 18:29:01'),
(266, 79, NULL, 'Products', 'Delete Product', 'Air freshener 02', 1, '2025-01-20 18:29:04', '2025-01-20 18:29:04'),
(267, 79, NULL, 'Products', 'Delete Product', 'Air Freshener', 1, '2025-01-20 18:29:08', '2025-01-20 18:29:08'),
(268, 79, NULL, 'Products', 'Add Product abcd', 'abcd', 1, '2025-01-20 18:33:45', '2025-01-20 18:33:45'),
(269, 79, NULL, 'Products', 'Update Product', 'abcd', 1, '2025-01-20 18:36:06', '2025-01-20 18:36:06'),
(270, 82, NULL, 'Products', 'Add Product Gas Stove Double', 'Gas Stove Double', 1, '2026-06-27 11:26:35', '2026-06-27 11:26:35'),
(271, 82, NULL, 'Products', 'Delete Product', 'abcd', 1, '2026-06-27 15:12:48', '2026-06-27 15:12:48'),
(272, 82, NULL, 'Products', 'Delete Product', 'Race car wash shampoo', 1, '2026-06-27 15:15:17', '2026-06-27 15:15:17'),
(273, 82, NULL, 'Products', 'Add Product Loyal Single Gas Stove', 'Loyal Single Gas Stove', 1, '2026-06-27 15:26:28', '2026-06-27 15:26:28'),
(274, 82, NULL, 'Products', 'Delete Product', 'Gas Stove Double', 1, '2026-06-27 20:31:39', '2026-06-27 20:31:39'),
(275, 82, NULL, 'Products', 'Delete Product', 'Loyal Single Gas Stove', 1, '2026-06-27 20:31:46', '2026-06-27 20:31:46'),
(276, 82, NULL, 'Products', 'Delete Product', 'Battery two', 1, '2026-06-27 20:31:52', '2026-06-27 20:31:52'),
(277, 82, NULL, 'Products', 'Delete Product', 'Battery One', 1, '2026-06-27 20:32:05', '2026-06-27 20:32:05'),
(278, 82, NULL, 'Products', 'Delete Product', 'Break Shoe two', 1, '2026-06-27 20:32:09', '2026-06-27 20:32:09'),
(279, 82, NULL, 'Products', 'Delete Product', 'Break Shoe', 1, '2026-06-27 20:32:37', '2026-06-27 20:32:37'),
(280, 82, NULL, 'Products', 'Delete Product', 'Joyroom JR-PBF04 20000mAh 65W Fast Charging Power Bank', 1, '2026-06-27 20:32:46', '2026-06-27 20:32:46'),
(281, 82, NULL, 'Products', 'Delete Product', 'Lubricant one', 1, '2026-06-27 20:32:58', '2026-06-27 20:32:58'),
(282, 82, NULL, 'Products', 'Delete Product', 'Lubricant Three', 1, '2026-06-27 20:33:03', '2026-06-27 20:33:03'),
(283, 82, NULL, 'Products', 'Delete Product', 'Lubricant Four', 1, '2026-06-27 20:33:08', '2026-06-27 20:33:08'),
(284, 82, NULL, 'Products', 'Delete Product', 'Tyre one', 1, '2026-06-27 20:33:12', '2026-06-27 20:33:12'),
(285, 82, NULL, 'Products', 'Delete Product', 'Tyre two', 1, '2026-06-27 20:33:16', '2026-06-27 20:33:16'),
(286, 82, NULL, 'Products', 'Delete Product', 'Tyre three', 1, '2026-06-27 20:33:20', '2026-06-27 20:33:20'),
(287, 82, NULL, 'Products', 'Delete Product', 'Tyre four', 1, '2026-06-27 20:33:25', '2026-06-27 20:33:25'),
(288, 82, NULL, 'Products', 'Add Product Loyal Glass Single Gas stove', 'Loyal Glass Single Gas stove', 1, '2026-06-27 20:41:14', '2026-06-27 20:41:14'),
(289, 82, NULL, 'Products', 'Add Product Lg Front glass Gas stove', 'Lg Front glass Gas stove', 1, '2026-06-27 20:54:58', '2026-06-27 20:54:58'),
(290, 82, NULL, 'Products', 'Add Product Loyal Angel Glass gas Stove -3D', 'Loyal Angel Glass gas Stove -3D', 1, '2026-06-27 21:24:43', '2026-06-27 21:24:43'),
(291, 82, NULL, 'Products', 'Update Product', 'Loyal Princess Double Glass gas Stove -3D', 1, '2026-06-27 21:26:58', '2026-06-27 21:26:58'),
(292, 82, NULL, 'Products', 'Update Product', 'Loyal Princess Double Glass gas Stove -3D', 1, '2026-06-27 21:28:00', '2026-06-27 21:28:00'),
(293, 82, NULL, 'Products', 'Add Product Loyal Still Golden Auto gas stove LPG', 'Loyal Still Golden Auto gas stove LPG', 1, '2026-06-27 22:01:05', '2026-06-27 22:01:05'),
(294, 82, NULL, 'Products', 'Update Product', 'Loyal Glass Single Gas stove', 1, '2026-07-01 20:23:03', '2026-07-01 20:23:03'),
(295, 82, NULL, 'Products', 'Update Product', 'Lg Front glass Gas stove', 1, '2026-07-01 20:23:48', '2026-07-01 20:23:48'),
(296, 82, NULL, 'Products', 'Add Product Loyal Single Auto 120mm Still gas Stove', 'Loyal Single Auto 120mm Still gas Stove', 1, '2026-07-01 21:11:48', '2026-07-01 21:11:48'),
(297, 82, NULL, 'Products', 'Add Product LG Ms Still Double Auto Gas Stove', 'LG Ms Still Double Auto Gas Stove', 1, '2026-07-02 11:06:06', '2026-07-02 11:06:06'),
(298, 82, NULL, 'Products', 'Update Product', 'Lg Front glass Gas stove', 1, '2026-07-03 05:50:06', '2026-07-03 05:50:06'),
(299, 82, NULL, 'Products', 'Update Product', 'Loyal Glass Single Gas stove', 1, '2026-07-03 05:50:25', '2026-07-03 05:50:25'),
(300, 82, NULL, 'Products', 'Add Product Loyal Single Honeycomb Burner Auto gas stove', 'Loyal Single Honeycomb Burner Auto gas stove', 1, '2026-07-03 06:04:52', '2026-07-03 06:04:52'),
(301, 82, NULL, 'Products', 'Update Product', 'Loyal Single Honeycomb Burner Auto gas stove', 1, '2026-07-03 06:14:47', '2026-07-03 06:14:47'),
(302, 82, NULL, 'Products', 'Update Product', 'Loyal Single Auto 120mm Still gas Stove', 1, '2026-07-03 06:27:38', '2026-07-03 06:27:38'),
(303, 82, NULL, 'Products', 'Add Product 120mm Double LG Gas stove', '120mm Double LG Gas stove', 1, '2026-07-03 07:06:59', '2026-07-03 07:06:59'),
(304, 82, NULL, 'Products', 'Update Product', '120mm Double LG Gas stove', 1, '2026-07-12 08:56:04', '2026-07-12 08:56:04'),
(305, 82, NULL, 'Products', 'Delete Product', 'Loyal Glass Single Gas stove', 1, '2026-07-12 12:03:33', '2026-07-12 12:03:33'),
(306, 82, NULL, 'Products', 'Delete Product', 'Lg Front glass Gas stove', 1, '2026-07-12 12:03:38', '2026-07-12 12:03:38'),
(307, 82, NULL, 'Products', 'Delete Product', 'Loyal Princess Double Glass gas Stove -3D', 1, '2026-07-12 12:03:42', '2026-07-12 12:03:42'),
(308, 82, NULL, 'Products', 'Delete Product', 'Loyal Still Golden Auto gas stove LPG', 1, '2026-07-12 12:03:46', '2026-07-12 12:03:46'),
(309, 82, NULL, 'Products', 'Delete Product', 'Loyal Single Auto 120mm Still gas Stove', 1, '2026-07-12 12:03:52', '2026-07-12 12:03:52'),
(310, 82, NULL, 'Products', 'Delete Product', 'LG Ms Still Double Auto Gas Stove', 1, '2026-07-12 12:03:56', '2026-07-12 12:03:56'),
(311, 82, NULL, 'Products', 'Delete Product', 'Loyal Single Honeycomb Burner Auto gas stove', 1, '2026-07-12 12:04:01', '2026-07-12 12:04:01'),
(312, 82, NULL, 'Products', 'Delete Product', '120mm Double LG Gas stove', 1, '2026-07-12 12:04:06', '2026-07-12 12:04:06'),
(313, 82, NULL, 'Products', 'Add Product Zenaida Vinson', 'Zenaida Vinson', 1, '2026-07-12 12:22:00', '2026-07-12 12:22:00'),
(314, 82, NULL, 'Products', 'Add Product Jemima Shelton', 'Jemima Shelton', 1, '2026-07-12 12:38:36', '2026-07-12 12:38:36'),
(315, 82, NULL, 'Products', 'Add Product Keely Coleman', 'Keely Coleman', 1, '2026-07-12 12:40:16', '2026-07-12 12:40:16'),
(316, 82, NULL, 'Products', 'Add Product Abdul Barr', 'Abdul Barr', 1, '2026-07-12 12:47:51', '2026-07-12 12:47:51'),
(317, 82, NULL, 'Products', 'Add Product Courtney Kinney', 'Courtney Kinney', 1, '2026-07-12 13:07:22', '2026-07-12 13:07:22'),
(318, 82, NULL, 'Products', 'Add Product Yeo Baker', 'Yeo Baker', 1, '2026-07-12 13:09:45', '2026-07-12 13:09:45'),
(319, 82, NULL, 'Products', 'Add Product Jin Gray Exercitationem neces', 'Jin Gray Exercitationem neces', 1, '2026-07-12 13:11:27', '2026-07-12 13:11:27'),
(320, 82, NULL, 'Products', 'Add Product Mufutau Moran do quam quidem e', 'Mufutau Moran do quam quidem e', 1, '2026-07-12 13:13:23', '2026-07-12 13:13:23'),
(321, 82, NULL, 'Products', 'Update Product', 'Mufutau Moran do quam quidem e', 1, '2026-07-12 13:15:24', '2026-07-12 13:15:24'),
(322, 82, NULL, 'Products', 'Update Product', 'Mufutau Moran do quam quidem e', 1, '2026-07-13 06:33:27', '2026-07-13 06:33:27'),
(323, 82, NULL, 'Products', 'Update Product', 'Jin Gray Exercitationem neces', 1, '2026-07-13 06:35:16', '2026-07-13 06:35:16'),
(324, 82, NULL, 'Products', 'Add Product Women\'s Premium Kurti - Empress Pink', 'Women\'s Premium Kurti - Empress Pink', 1, '2026-07-13 09:44:40', '2026-07-13 09:44:40'),
(325, 82, NULL, 'Products', 'Add Product Womens Premium Kurti - Sylis', 'Womens Premium Kurti - Sylis', 1, '2026-07-13 09:47:49', '2026-07-13 09:47:49'),
(326, 82, NULL, 'Products', 'Add Product Womens Premium Kurti - Petra', 'Womens Premium Kurti - Petra', 1, '2026-07-13 12:27:59', '2026-07-13 12:27:59'),
(327, 82, NULL, 'Products', 'Add Product Teens Premium Tunic - Luniva', 'Teens Premium Tunic - Luniva', 1, '2026-07-13 12:29:23', '2026-07-13 12:29:23'),
(328, 82, NULL, 'Products', 'Add Product Women Premium Tops -Parisha', 'Women Premium Tops -Parisha', 1, '2026-07-13 12:32:19', '2026-07-13 12:32:19'),
(329, 82, NULL, 'Products', 'Add Product Jelani Maddox', 'Jelani Maddox', 1, '2026-07-13 12:33:58', '2026-07-13 12:33:58'),
(330, 82, NULL, 'Products', 'Add Product Castor Vasquez', 'Castor Vasquez', 1, '2026-07-13 12:34:54', '2026-07-13 12:34:54'),
(331, 82, NULL, 'Products', 'Update Product', 'Castor Vasquez', 1, '2026-07-13 12:35:17', '2026-07-13 12:35:17'),
(332, 82, NULL, 'Products', 'Update Product', 'Jelani Maddox', 1, '2026-07-13 12:36:01', '2026-07-13 12:36:01'),
(333, 82, NULL, 'Products', 'Add Product men Shirt color and size', 'men Shirt color and size', 1, '2026-07-14 06:55:37', '2026-07-14 06:55:37'),
(334, 82, NULL, 'Products', 'Update Product', 'men Shirt color and size', 1, '2026-07-14 07:03:09', '2026-07-14 07:03:09'),
(335, 82, NULL, 'Products', 'Update Product', 'men Shirt color and size', 1, '2026-07-14 07:03:34', '2026-07-14 07:03:34'),
(336, 82, NULL, 'Products', 'Add Product test', 'test', 1, '2026-07-15 13:04:34', '2026-07-15 13:04:34'),
(337, 82, NULL, 'Products', 'Update Product', 'dfgd fgh fgh ghjngh gjgh', 1, '2026-07-15 13:06:40', '2026-07-15 13:06:40'),
(338, 82, NULL, 'Products', 'Add Product tyht gjyuy', 'tyht gjyuy', 1, '2026-07-20 08:18:25', '2026-07-20 08:18:25'),
(339, 82, NULL, 'Products', 'Update Product', 'dfgd fgh fgh ghjngh gjgh', 1, '2026-07-20 08:19:24', '2026-07-20 08:19:24');

-- --------------------------------------------------------

--
-- Table structure for table `meetings`
--

CREATE TABLE `meetings` (
  `id` bigint UNSIGNED NOT NULL,
  `lead_id` int UNSIGNED DEFAULT NULL,
  `recipients` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_by` int UNSIGNED DEFAULT NULL,
  `meeting_subject` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `meeting_description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `meeting_date` datetime NOT NULL,
  `meeting_link` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `attachments` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `duration` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `send_email` tinyint DEFAULT NULL,
  `send_sms` tinyint DEFAULT NULL,
  `meeting_feedback` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `rating` tinyint UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `menus`
--

CREATE TABLE `menus` (
  `id` int NOT NULL,
  `parent_id` int DEFAULT NULL,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `sub_name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `show_in_menu` tinyint(1) NOT NULL DEFAULT '1',
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `menus`
--

INSERT INTO `menus` (`id`, `parent_id`, `name`, `sub_name`, `show_in_menu`, `status`, `created_at`, `updated_at`) VALUES
(2, NULL, 'Leads Form', '', 1, 1, '2024-05-21 06:24:20', NULL),
(3, NULL, 'Lead Management', '', 1, 1, '2024-05-21 06:24:44', NULL),
(4, NULL, 'Campaign', 'campaign-index', 1, 1, '2024-05-21 06:24:44', '2024-07-02 01:15:12'),
(5, NULL, 'Email Module', '', 1, 1, '2024-05-21 06:25:33', NULL),
(6, NULL, 'SMS Module', '', 1, 1, '2024-05-21 06:25:33', NULL),
(9, 2, 'Form List', 'leadsform-index', 1, 1, '2024-06-02 04:15:59', NULL),
(10, 2, 'Create Form', 'leadsform-create', 1, 1, '2024-06-02 04:17:55', NULL),
(11, 2, 'Create Dynamic Tables', 'dynamictable-create', 1, 1, '2024-06-02 04:18:13', NULL),
(12, 2, 'Dynamic Tables List', 'dynamictable-index', 1, 1, '2024-06-02 04:18:17', NULL),
(13, 3, 'Leads', 'lead-index', 1, 1, '2024-06-02 04:19:20', NULL),
(14, 3, 'Create a Lead', 'lead-create', 1, 1, '2024-06-02 04:19:59', NULL),
(15, 4, 'Campaign List', 'campaign-index', 1, 0, '2024-06-02 04:22:56', '2024-07-02 01:14:49'),
(16, 4, 'Create a Campaign', 'campaign-create', 1, 0, '2024-06-02 04:23:07', '2024-07-02 01:15:06'),
(17, 4, 'Promotion List', 'promotion-index', 1, 1, '2024-06-02 04:23:26', NULL),
(18, 4, 'Create Promotion', 'promotion-create', 1, 1, '2024-06-02 04:23:27', NULL),
(19, 5, 'Send an Email', 'send-email', 1, 1, '2024-06-02 04:34:05', NULL),
(20, 5, 'Emails', 'send-email-list', 1, 0, '2024-06-02 04:40:06', '2024-09-25 22:27:02'),
(21, 5, 'Email Templates', 'email-template', 1, 1, '2024-06-02 04:41:38', NULL),
(22, 5, 'Create Template', 'email-template-create', 1, 1, '2024-06-02 04:41:59', '2024-06-06 04:39:55'),
(23, 6, 'SMS List', 'send-sms-list', 1, 0, '2024-06-02 04:42:59', '2024-09-18 23:27:32'),
(24, 6, 'Send SMS', 'send-sms', 1, 0, '2024-06-02 04:43:26', '2024-09-25 21:36:35'),
(25, 6, 'SMS Templates', 'sms-template', 1, 0, '2024-06-02 04:44:29', '2024-09-18 23:23:41'),
(26, 6, 'Create Template', 'sms-template-create', 1, 0, '2024-06-02 04:44:51', '2024-09-25 04:16:33'),
(28, 6, 'Send Bulk SMS', 'send-bulk-sms', 1, 1, '2024-06-06 04:22:37', '2024-06-19 22:57:56'),
(47, 46, 'Task List', 'task-list', 1, 1, '2024-07-01 00:00:45', '2024-07-01 00:00:45'),
(46, NULL, 'Tasks', 'tasks', 1, 1, '2024-06-30 23:59:49', '2024-06-30 23:59:49'),
(35, 5, 'Bulk Upload', 'send-bulk-email', 1, 1, '2024-06-24 05:00:54', '2024-06-24 05:00:54'),
(36, 3, 'Upload Lead', 'leads-upload', 0, 1, '2024-06-26 00:21:28', '2024-11-05 09:55:30'),
(174, 6, 'Create SMS Template', 'sms-template-create', 0, 1, '2024-09-18 23:25:20', '2024-09-25 04:18:28'),
(48, 46, 'Add Task', 'add-task', 1, 1, '2024-07-01 00:01:10', '2024-07-01 00:01:10'),
(49, NULL, 'Employees', 'employees', 1, 1, '2024-07-08 00:11:35', '2026-08-11 15:55:35'),
(50, 49, 'Employee List', 'employee-list', 1, 1, '2024-07-08 00:12:04', '2026-08-11 16:03:49'),
(51, 49, 'Add Employee', 'add-employee', 1, 1, '2024-07-08 00:12:24', '2026-08-11 16:03:49'),
(119, NULL, 'User Management', NULL, 1, 1, '2024-09-17 23:31:53', '2024-09-17 23:31:53'),
(57, 1, 'Agents Edit', 'agents-edit', 0, 1, '2024-09-17 05:45:08', '2024-09-17 05:46:28'),
(56, 1, 'Agents Show', 'agents-show', 0, 1, '2024-09-17 05:43:33', '2024-09-17 05:43:33'),
(60, 1, 'Agents Destroy', 'agents-destroy', 0, 1, '2024-09-17 05:51:06', '2024-09-17 05:51:06'),
(62, 2, 'Leads Form Show', 'leadsform-show', 0, 1, '2024-09-17 21:50:23', '2024-09-23 23:06:48'),
(63, 2, 'Leads Form Edit', 'leadsform-edit', 0, 1, '2024-09-17 21:51:02', '2024-09-17 21:52:27'),
(65, 2, 'Leads Form Destroy', 'leadsform-destroy', 0, 1, '2024-09-17 21:53:48', '2024-09-17 21:53:48'),
(67, 2, 'Dynamic Table Edit', 'dynamictable-edit', 0, 1, '2024-09-17 21:57:24', '2024-09-17 21:57:24'),
(70, 2, 'Dynamic Table Show', 'dynamictable-show', 0, 1, '2024-09-17 22:02:02', '2024-09-17 22:02:02'),
(71, 2, 'Dynamic Table Destroy', 'dynamictable-destroy', 0, 1, '2024-09-17 22:02:45', '2024-09-17 22:02:45'),
(76, 3, 'Lead Show', 'lead-show', 0, 1, '2024-09-17 22:16:07', '2024-09-17 22:16:07'),
(77, 3, 'Lead Edit', 'lead-edit', 0, 1, '2024-09-17 22:19:10', '2024-09-17 22:19:10'),
(80, 3, 'Lead Destroy', 'lead-destroy', 0, 1, '2024-09-17 22:21:45', '2024-09-17 22:21:45'),
(82, 3, 'Leads Add', 'leads-add', 0, 1, '2024-09-17 22:24:35', '2024-09-17 22:24:35'),
(84, 3, 'Delete Table Data', 'delete-tabledata', 0, 1, '2024-09-17 22:26:40', '2024-09-17 22:26:40'),
(85, 3, 'Lead Edit Table Data', 'lead-edit-tabledata', 0, 1, '2024-09-17 22:27:31', '2024-09-17 22:27:31'),
(91, 4, 'Campaign Lead Upload File', 'campaign-lead-upload-file', 0, 1, '2024-09-17 23:00:20', '2024-09-17 23:00:20'),
(93, 4, 'Campaign Show', 'campaign-show', 0, 1, '2024-09-17 23:01:20', '2024-09-17 23:01:20'),
(94, 4, 'Campaign Edit', 'campaign-edit', 0, 1, '2024-09-17 23:01:45', '2024-09-17 23:01:45'),
(96, 4, 'Campaign Destroy', 'campaign-destroy', 0, 1, '2024-09-17 23:02:53', '2024-09-17 23:02:53'),
(100, 4, 'Campaign Lead Upload', 'campaign-lead-upload', 0, 1, '2024-09-17 23:06:20', '2024-09-17 23:06:20'),
(101, 4, 'Campaign Data', 'campaign-data', 0, 1, '2024-09-17 23:06:49', '2024-09-17 23:06:49'),
(191, 188, 'Logs Data', 'log-list', 1, 1, '2024-10-30 23:14:55', '2024-10-30 23:54:24'),
(104, 179, 'Meeting List', 'meeting-index', 1, 1, '2024-09-17 23:15:01', '2024-09-26 05:06:58'),
(105, 179, 'Create Meeting', 'meeting-create', 1, 1, '2024-09-17 23:15:38', '2024-09-26 05:07:20'),
(107, 179, 'Meeting Show', 'meeting-show', 0, 1, '2024-09-17 23:16:33', '2024-09-26 05:14:58'),
(108, 179, 'Meeting Edit', 'meeting-edit', 0, 1, '2024-09-17 23:16:58', '2024-09-26 05:15:37'),
(110, 179, 'Meeting Destroy', 'meeting-destroy', 0, 1, '2024-09-17 23:18:45', '2024-09-26 05:16:00'),
(113, 4, 'Promotion Show', 'promotion-show', 0, 1, '2024-09-17 23:20:25', '2024-09-17 23:20:25'),
(114, 4, 'Promotion Edit', 'promotion-edit', 0, 1, '2024-09-17 23:21:15', '2024-09-17 23:21:15'),
(120, 119, 'User List', 'users.index', 1, 1, '2024-09-17 23:33:14', '2024-09-17 23:33:14'),
(121, 119, 'User Show', 'user.show', 0, 1, '2024-09-17 23:34:32', '2024-09-17 23:35:38'),
(122, 119, 'Create User', 'create-user', 1, 1, '2024-09-17 23:36:09', '2024-09-17 23:36:09'),
(189, 188, 'Customer List', 'customers', 1, 1, '2024-10-30 02:38:20', '2024-10-30 02:39:52'),
(124, 119, 'User Edit', 'user.edit', 0, 1, '2024-09-17 23:37:05', '2024-09-17 23:37:05'),
(126, 119, 'User Destroy', 'user.destroy', 0, 1, '2024-09-17 23:38:21', '2024-09-17 23:38:21'),
(187, 185, 'Create Invoice', 'invoice-create', 1, 1, '2024-10-24 00:34:37', '2024-10-24 00:34:37'),
(128, 119, 'Profile Edit', 'profile-edit', 1, 1, '2024-09-17 23:39:55', '2024-09-17 23:39:55'),
(129, 119, 'User Details', 'show', 0, 1, '2024-09-17 23:40:58', '2024-09-17 23:40:58'),
(130, 119, 'Profile Update', 'profile-update', 0, 1, '2024-09-17 23:41:42', '2024-09-17 23:41:42'),
(188, NULL, 'Customers', NULL, 1, 1, '2024-10-30 02:37:59', '2024-10-30 02:37:59'),
(132, 119, 'Update Profile Image', 'update-profile-image', 0, 1, '2024-09-17 23:42:47', '2024-09-17 23:42:47'),
(133, 119, 'Permissions', 'permission.index', 1, 1, '2024-09-17 23:47:41', '2024-09-17 23:48:28'),
(134, 119, 'Permission Show', 'permission.show', 0, 1, '2024-09-17 23:49:11', '2024-09-17 23:49:11'),
(135, 119, 'Create Permission', 'create-permission', 1, 1, '2024-09-17 23:49:43', '2024-09-17 23:49:43'),
(186, 185, 'Invoice List', 'invoice-index', 1, 1, '2024-10-24 00:32:13', '2024-10-24 00:32:13'),
(137, 119, 'Permission Edit', 'permission.edit', 0, 1, '2024-09-17 23:51:38', '2024-09-17 23:51:38'),
(184, 182, 'Add Proposal', 'add-proposal', 1, 1, '2024-10-23 03:37:36', '2024-10-23 03:37:36'),
(139, 119, 'Permission Show', 'permission_show', 0, 1, '2024-09-17 23:52:43', '2024-09-17 23:52:43'),
(140, 119, 'Permission Destroy', 'permission.destroy', 0, 1, '2024-09-17 23:53:31', '2024-09-17 23:53:31'),
(185, NULL, 'Invoice', NULL, 1, 1, '2024-10-24 00:26:34', '2024-10-24 00:26:34'),
(142, 119, 'Roles', 'role-list', 1, 1, '2024-09-17 23:54:50', '2024-09-17 23:54:50'),
(143, 119, 'Role Show', 'role.show', 0, 1, '2024-09-17 23:55:15', '2024-09-17 23:55:15'),
(144, 119, 'Create Role', 'role-create', 1, 1, '2024-09-17 23:56:51', '2024-09-17 23:56:51'),
(183, 182, 'Proposal List', 'proposal-list', 1, 1, '2024-10-23 03:37:08', '2024-10-23 03:37:08'),
(146, 119, 'Role Edit', 'role-edit', 0, 1, '2024-09-17 23:58:11', '2024-09-17 23:58:11'),
(182, NULL, 'Proposal', NULL, 1, 1, '2024-10-23 03:36:27', '2024-10-23 03:36:27'),
(148, 119, 'Role Destroy', 'role-destroy', 0, 1, '2024-09-17 23:59:07', '2024-09-17 23:59:07'),
(151, 5, 'Email Template Edit', 'email-template-edit', 0, 1, '2024-09-18 00:08:55', '2024-09-18 00:08:55'),
(152, 5, 'Email Template Show', 'email-template-show', 0, 1, '2024-09-18 00:09:27', '2024-09-18 00:09:27'),
(154, 5, 'Email Template Delete', 'email-template-delete', 0, 1, '2024-09-18 00:10:30', '2024-09-18 00:10:30'),
(159, 6, 'Sms Template Edit', 'sms-template-edit', 0, 1, '2024-09-18 00:22:54', '2024-09-18 00:22:54'),
(160, 6, 'Sms Template Show', 'sms-template-show', 0, 1, '2024-09-18 00:24:50', '2024-09-18 00:24:50'),
(163, 6, 'Sms Template Delete', 'sms-template-delete', 0, 1, '2024-09-18 00:26:41', '2024-09-18 00:26:41'),
(168, 46, 'Task Delete', 'delete-task', 0, 1, '2024-09-18 00:36:21', '2024-09-18 00:36:21'),
(178, 4, 'Promotion Destroy', 'promotion-destroy', 0, 1, '2024-09-24 22:42:37', '2024-09-24 22:42:37'),
(170, 49, 'Product Delete', 'product-delete', 0, 1, '2024-09-18 00:38:50', '2026-08-11 15:55:35'),
(171, 49, 'Product Show', 'product-show', 0, 1, '2024-09-18 00:39:21', '2026-08-11 15:55:35'),
(172, 49, 'Product Edit', 'product-edit', 0, 1, '2024-09-18 00:39:55', '2026-08-11 15:55:35'),
(179, NULL, 'Meeting', NULL, 1, 1, '2024-09-26 05:02:51', '2024-09-26 05:02:51'),
(195, 5, 'Send Email Show', 'send-email-show', 0, 1, '2024-11-05 08:49:42', '2024-11-05 09:02:22'),
(196, 6, 'Send SMS show', 'send-sms-show', 0, 1, '2024-11-05 09:12:59', '2024-11-05 09:12:59'),
(197, 182, 'Delete Proposal', 'delete-proposal', 0, 1, '2024-11-05 11:39:36', '2024-11-05 11:39:36'),
(198, 182, 'Proposal Edit', 'proposal-edit', 0, 1, '2024-11-05 11:45:47', '2024-11-05 11:45:47'),
(200, 182, 'Proposal Show', 'proposal-show', 0, 1, '2024-11-05 11:49:20', '2024-11-05 11:49:20'),
(201, 188, 'Add Customer', 'add-customer', 0, 1, '2024-11-05 11:59:29', '2024-11-05 11:59:29'),
(202, 185, 'Invoice Show', 'invoice-show', 0, 1, '2024-11-05 12:15:36', '2024-11-05 12:15:36'),
(203, 185, 'invoice edit', 'invoice-edit', 0, 1, '2024-11-05 12:16:34', '2024-11-05 12:16:34'),
(204, 49, 'Add Product Specification', 'product-specification-create', 0, 1, '2024-11-12 08:05:56', '2026-08-11 15:55:35'),
(205, 49, 'Product Specification List', 'product-specification-index', 0, 1, '2024-11-12 08:07:06', '2026-08-11 15:55:35'),
(206, NULL, 'Sliders', NULL, 1, 1, '2024-12-21 15:39:22', '2024-12-21 15:39:22'),
(207, 206, 'Slider List', 'slider-list', 1, 1, '2024-12-21 15:40:03', '2024-12-21 15:40:03'),
(208, 206, 'Craete Slider', 'slider-create', 1, 1, '2024-12-21 15:40:26', '2024-12-21 15:40:45'),
(209, 206, 'Edit Slider', 'slider-edit', 0, 1, '2024-12-21 15:41:27', '2024-12-21 15:41:27'),
(210, 206, 'Show Slider', 'slider-show', 0, 1, '2024-12-21 15:42:04', '2024-12-21 15:42:04'),
(211, NULL, 'Blog', NULL, 1, 1, '2024-12-21 15:42:34', '2024-12-21 15:43:33'),
(212, 211, 'Blog Category List', 'blogger-category-list', 1, 1, '2024-12-21 15:43:15', '2024-12-21 15:43:15'),
(213, 211, 'Blog List', 'blog-list', 1, 1, '2024-12-21 15:43:58', '2024-12-21 15:43:58'),
(214, NULL, 'Brands', NULL, 1, 1, '2024-12-21 15:44:10', '2024-12-21 15:44:10'),
(215, 214, 'Brand List', 'brand-list', 1, 1, '2024-12-21 15:44:41', '2024-12-21 15:44:41'),
(216, 214, 'Create Brand', 'brand-create', 1, 1, '2024-12-21 15:45:00', '2024-12-21 15:45:00'),
(217, NULL, 'Orders', NULL, 1, 1, '2024-12-21 15:47:45', '2024-12-21 15:47:45'),
(218, 217, 'Order List', 'orders-index', 1, 1, '2024-12-21 15:48:11', '2024-12-21 15:48:11'),
(219, NULL, 'Menu Category', NULL, 1, 1, '2024-12-21 16:13:57', '2024-12-21 16:13:57'),
(220, 219, 'Category List', 'category-list', 1, 1, '2024-12-21 16:14:12', '2024-12-21 16:14:12'),
(221, 219, 'Create Category', 'category-create', 1, 1, '2024-12-21 16:14:46', '2024-12-21 16:14:46'),
(222, NULL, 'Settings', NULL, 1, 1, '2025-02-09 15:22:57', '2025-02-09 15:22:57'),
(223, 222, 'App Settings', 'app-settings', 1, 1, '2025-02-09 15:23:20', '2025-02-09 15:23:20'),
(224, NULL, 'Route Permissions', 'route-permissions', 0, 1, '2026-07-29 13:40:40', '2026-07-29 13:40:40'),
(225, 224, 'Send Pending Email', 'send-pending-email', 0, 1, '2026-07-29 13:40:40', '2026-07-29 13:40:40'),
(226, 224, 'Admin Faqs Index', 'admin-faqs.index', 0, 1, '2026-07-29 13:40:40', '2026-07-29 13:40:40'),
(227, 224, 'Admin Faqs Store', 'admin-faqs.store', 0, 1, '2026-07-29 13:40:40', '2026-07-29 13:40:40'),
(228, 224, 'Admin Faqs Update', 'admin-faqs.update', 0, 1, '2026-07-29 13:40:40', '2026-07-29 13:40:40'),
(229, 224, 'Admin Faqs Destroy', 'admin-faqs.destroy', 0, 1, '2026-07-29 13:40:40', '2026-07-29 13:40:40'),
(230, 224, 'Admin Newsletter Index', 'admin-newsletter.index', 0, 1, '2026-07-29 13:40:40', '2026-07-29 13:40:40'),
(231, 224, 'Admin Newsletter Destroy', 'admin-newsletter.destroy', 0, 1, '2026-07-29 13:40:40', '2026-07-29 13:40:40'),
(232, 224, 'Courier Integrations Index', 'courier-integrations.index', 0, 1, '2026-07-29 13:40:40', '2026-07-29 13:40:40'),
(233, 224, 'Courier Integrations Update', 'courier-integrations.update', 0, 1, '2026-07-29 13:40:40', '2026-07-29 13:40:40'),
(234, 224, 'Courier Integrations Steadfast Update', 'courier-integrations.steadfast.update', 0, 1, '2026-07-29 13:40:40', '2026-07-29 13:40:40'),
(235, 224, 'Courier Integrations Steadfast Delete', 'courier-integrations.steadfast.delete', 0, 1, '2026-07-29 13:40:40', '2026-07-29 13:40:40'),
(236, 224, 'Courier Integrations Steadfast Balance', 'courier-integrations.steadfast.balance', 0, 1, '2026-07-29 13:40:40', '2026-07-29 13:40:40'),
(237, 217, 'Orders Fraud Check', 'orders-fraud-check', 0, 1, '2026-07-29 13:40:40', '2026-07-29 13:57:02'),
(238, 217, 'Orders Steadfast Place', 'orders-steadfast-place', 0, 1, '2026-07-29 13:40:40', '2026-07-29 13:57:02'),
(239, 217, 'Orders Steadfast Status', 'orders-steadfast-status', 0, 1, '2026-07-29 13:40:40', '2026-07-29 13:57:02'),
(240, 217, 'Orders Courier Bulk Send', 'orders-courier-bulk-send', 0, 1, '2026-07-29 13:40:40', '2026-07-29 13:57:02'),
(241, 224, 'Agents Index', 'agents-index', 0, 1, '2026-07-29 13:40:40', '2026-07-29 13:40:40'),
(242, 224, 'Agents Create', 'agents-create', 0, 1, '2026-07-29 13:40:40', '2026-07-29 13:40:40'),
(243, 224, 'Agents Store', 'agents-store', 0, 1, '2026-07-29 13:40:40', '2026-07-29 13:40:40'),
(244, 224, 'Agents Update', 'agents-update', 0, 1, '2026-07-29 13:40:40', '2026-07-29 13:40:40'),
(245, 224, 'Agents Search', 'agents-search', 0, 1, '2026-07-29 13:40:40', '2026-07-29 13:40:40'),
(246, 224, 'Promotion Store', 'promotion-store', 0, 1, '2026-07-29 13:40:40', '2026-07-29 13:40:40'),
(247, 224, 'Promotion Update', 'promotion-update', 0, 1, '2026-07-29 13:40:40', '2026-07-29 13:40:40'),
(248, 224, 'Promotion Search', 'promotion-search', 0, 1, '2026-07-29 13:40:40', '2026-07-29 13:40:40'),
(249, 224, 'Store User', 'store-user', 0, 1, '2026-07-29 13:40:40', '2026-07-29 13:40:40'),
(250, 224, 'User Update', 'user.update', 0, 1, '2026-07-29 13:40:40', '2026-07-29 13:40:40'),
(251, 224, 'User Search', 'user-search', 0, 1, '2026-07-29 13:40:40', '2026-07-29 13:40:40'),
(252, 224, 'Save App Settings', 'save-app-settings', 0, 1, '2026-07-29 13:40:40', '2026-07-29 13:40:40'),
(253, 224, 'Store Permission', 'store-permission', 0, 1, '2026-07-29 13:40:40', '2026-07-29 13:40:40'),
(254, 224, 'Permission Update', 'permission.update', 0, 1, '2026-07-29 13:40:40', '2026-07-29 13:40:40'),
(255, 224, 'Permission Search', 'permission-search', 0, 1, '2026-07-29 13:40:40', '2026-07-29 13:40:40'),
(256, 224, 'Role Store', 'role-store', 0, 1, '2026-07-29 13:40:41', '2026-07-29 13:40:41'),
(257, 224, 'Role Update', 'role-update', 0, 1, '2026-07-29 13:40:41', '2026-07-29 13:40:41'),
(258, 224, 'Role Search', 'role-search', 0, 1, '2026-07-29 13:40:41', '2026-07-29 13:40:41'),
(259, 224, 'Email Template Store', 'email-template-store', 0, 1, '2026-07-29 13:40:41', '2026-07-29 13:40:41'),
(260, 224, 'Email Template Update', 'email-template-update', 0, 1, '2026-07-29 13:40:41', '2026-07-29 13:40:41'),
(261, 224, 'Send Email Process', 'send-email-process', 0, 1, '2026-07-29 13:40:41', '2026-07-29 13:40:41'),
(262, 224, 'Send Bulk Email Process', 'send-bulk-email-process', 0, 1, '2026-07-29 13:40:41', '2026-07-29 13:40:41'),
(263, 224, 'Sms Template Store', 'sms-template-store', 0, 1, '2026-07-29 13:40:41', '2026-07-29 13:40:41'),
(264, 224, 'Sms Template Update', 'sms-template-update', 0, 1, '2026-07-29 13:40:41', '2026-07-29 13:40:41'),
(265, 224, 'Send Sms Pro', 'send-sms-pro', 0, 1, '2026-07-29 13:40:41', '2026-07-29 13:40:41'),
(266, 224, 'Send Bulk Sms Pro', 'send-bulk-sms-pro', 0, 1, '2026-07-29 13:40:41', '2026-07-29 13:40:41'),
(267, 224, 'Product Stock Report', 'product-stock-report', 0, 1, '2026-07-29 13:40:41', '2026-07-29 13:40:41'),
(268, 224, 'Add Product Pro', 'add-product-pro', 0, 1, '2026-07-29 13:40:41', '2026-07-29 13:40:41'),
(269, 224, 'Product Update Pro', 'product-update-pro', 0, 1, '2026-07-29 13:40:41', '2026-07-29 13:40:41'),
(270, 224, 'Product Color List', 'product-color-list', 0, 1, '2026-07-29 13:40:41', '2026-07-29 13:40:41'),
(271, 224, 'Product Color Store', 'product-color-store', 0, 1, '2026-07-29 13:40:41', '2026-07-29 13:40:41'),
(272, 224, 'Product Color Edit', 'product-color-edit', 0, 1, '2026-07-29 13:40:41', '2026-07-29 13:40:41'),
(273, 224, 'Product Color Update', 'product-color-update', 0, 1, '2026-07-29 13:40:41', '2026-07-29 13:40:41'),
(274, 224, 'Product Color Destroy', 'product-color-destroy', 0, 1, '2026-07-29 13:40:41', '2026-07-29 13:40:41'),
(275, 224, 'Product Size List', 'product-size-list', 0, 1, '2026-07-29 13:40:41', '2026-07-29 13:40:41'),
(276, 224, 'Product Size Store', 'product-size-store', 0, 1, '2026-07-29 13:40:41', '2026-07-29 13:40:41'),
(277, 224, 'Product Size Edit', 'product-size-edit', 0, 1, '2026-07-29 13:40:41', '2026-07-29 13:40:41'),
(278, 224, 'Product Size Update', 'product-size-update', 0, 1, '2026-07-29 13:40:41', '2026-07-29 13:40:41'),
(279, 224, 'Product Size Destroy', 'product-size-destroy', 0, 1, '2026-07-29 13:40:41', '2026-07-29 13:40:41'),
(280, 224, 'Shipping Method List', 'shipping-method-list', 0, 1, '2026-07-29 13:40:41', '2026-07-29 13:40:41'),
(281, 224, 'Shipping Method Store', 'shipping-method-store', 0, 1, '2026-07-29 13:40:41', '2026-07-29 13:40:41'),
(282, 224, 'Shipping Method Edit', 'shipping-method-edit', 0, 1, '2026-07-29 13:40:41', '2026-07-29 13:40:41'),
(283, 224, 'Shipping Method Update', 'shipping-method-update', 0, 1, '2026-07-29 13:40:41', '2026-07-29 13:40:41'),
(284, 224, 'Shipping Method Destroy', 'shipping-method-destroy', 0, 1, '2026-07-29 13:40:41', '2026-07-29 13:40:41'),
(285, 224, 'Outlet Location List', 'outlet-location-list', 0, 1, '2026-07-29 13:40:41', '2026-07-29 13:40:41'),
(286, 224, 'Outlet Location Create', 'outlet-location-create', 0, 1, '2026-07-29 13:40:41', '2026-07-29 13:40:41'),
(287, 224, 'Outlet Location Store', 'outlet-location-store', 0, 1, '2026-07-29 13:40:41', '2026-07-29 13:40:41'),
(288, 224, 'Outlet Location Edit', 'outlet-location-edit', 0, 1, '2026-07-29 13:40:41', '2026-07-29 13:40:41'),
(289, 224, 'Outlet Location Update', 'outlet-location-update', 0, 1, '2026-07-29 13:40:41', '2026-07-29 13:40:41'),
(290, 224, 'Outlet Location Destroy', 'outlet-location-destroy', 0, 1, '2026-07-29 13:40:41', '2026-07-29 13:40:41'),
(291, 224, 'Outlet Location Banner', 'outlet-location-banner', 0, 1, '2026-07-29 13:40:41', '2026-07-29 13:40:41'),
(292, 224, 'Home Page Setting Edit', 'home-page-setting-edit', 0, 1, '2026-07-29 13:40:41', '2026-07-29 13:40:41'),
(293, 224, 'Home Page Setting Update', 'home-page-setting-update', 0, 1, '2026-07-29 13:40:41', '2026-07-29 13:40:41'),
(294, 224, 'Home Page Setting Partner Logo Delete', 'home-page-setting-partner-logo-delete', 0, 1, '2026-07-29 13:40:41', '2026-07-29 13:40:41'),
(295, 224, 'Country List', 'country-list', 0, 1, '2026-07-29 13:40:41', '2026-07-29 13:40:41'),
(296, 224, 'Add Country', 'add-country', 0, 1, '2026-07-29 13:40:41', '2026-07-29 13:40:41'),
(297, 224, 'Add Country Pro', 'add-country-pro', 0, 1, '2026-07-29 13:40:41', '2026-07-29 13:40:41'),
(298, 224, 'Country Delete', 'country-delete', 0, 1, '2026-07-29 13:40:41', '2026-07-29 13:40:41'),
(299, 224, 'Currency List', 'currency-list', 0, 1, '2026-07-29 13:40:41', '2026-07-29 13:40:41'),
(300, 224, 'Add Currency', 'add-currency', 0, 1, '2026-07-29 13:40:41', '2026-07-29 13:40:41'),
(301, 224, 'Add Currency Pro', 'add-currency-pro', 0, 1, '2026-07-29 13:40:41', '2026-07-29 13:40:41'),
(302, 224, 'Currency Delete', 'currency-delete', 0, 1, '2026-07-29 13:40:41', '2026-07-29 13:40:41'),
(303, 224, 'Post Add Customer', 'post-add-customer', 0, 1, '2026-07-29 13:40:41', '2026-07-29 13:40:41'),
(304, 224, 'Slider Store', 'slider-store', 0, 1, '2026-07-29 13:40:41', '2026-07-29 13:40:41'),
(305, 224, 'Slider Update', 'slider-update', 0, 1, '2026-07-29 13:40:41', '2026-07-29 13:40:41'),
(306, 224, 'Slider Search', 'slider-search', 0, 1, '2026-07-29 13:40:41', '2026-07-29 13:40:41'),
(307, 224, 'Slider Destroy', 'slider-destroy', 0, 1, '2026-07-29 13:40:41', '2026-07-29 13:40:41'),
(308, 224, 'Update Slider Image', 'update-slider-image', 0, 1, '2026-07-29 13:40:41', '2026-07-29 13:40:41'),
(309, 224, 'Brand Store', 'brand-store', 0, 1, '2026-07-29 13:40:41', '2026-07-29 13:40:41'),
(310, 224, 'Brand Show', 'brand-show', 0, 1, '2026-07-29 13:40:41', '2026-07-29 13:40:41'),
(311, 224, 'Brand Edit', 'brand-edit', 0, 1, '2026-07-29 13:40:41', '2026-07-29 13:40:41'),
(312, 224, 'Brand Update', 'brand-update', 0, 1, '2026-07-29 13:40:41', '2026-07-29 13:40:41'),
(313, 224, 'Brand Search', 'brand-search', 0, 1, '2026-07-29 13:40:41', '2026-07-29 13:40:41'),
(314, 224, 'Brand Destroy', 'brand-destroy', 0, 1, '2026-07-29 13:40:41', '2026-07-29 13:40:41'),
(315, 224, 'Update Brand Image', 'update-brand-image', 0, 1, '2026-07-29 13:40:41', '2026-07-29 13:40:41'),
(316, 224, 'Category Store', 'category-store', 0, 1, '2026-07-29 13:40:41', '2026-07-29 13:40:41'),
(317, 224, 'Category Show', 'category-show', 0, 1, '2026-07-29 13:40:41', '2026-07-29 13:40:41'),
(318, 224, 'Category Edit', 'category-edit', 0, 1, '2026-07-29 13:40:41', '2026-07-29 13:40:41'),
(319, 224, 'Category Update', 'category-update', 0, 1, '2026-07-29 13:40:41', '2026-07-29 13:40:41'),
(320, 224, 'Category Search', 'category-search', 0, 1, '2026-07-29 13:40:41', '2026-07-29 13:40:41'),
(321, 224, 'Category Destroy', 'category-destroy', 0, 1, '2026-07-29 13:40:41', '2026-07-29 13:40:41'),
(322, 224, 'Update Category Image', 'update-category-image', 0, 1, '2026-07-29 13:40:41', '2026-07-29 13:40:41'),
(323, 217, 'Orders Create', 'orders-create', 0, 1, '2026-07-29 13:40:41', '2026-07-29 13:57:03'),
(324, 217, 'Orders Store', 'orders-store', 0, 1, '2026-07-29 13:40:41', '2026-07-29 13:57:03'),
(325, 217, 'Orders Invoice', 'orders-invoice', 0, 1, '2026-07-29 13:40:41', '2026-07-29 13:57:03'),
(326, 217, 'Orders Show', 'orders-show', 0, 1, '2026-07-29 13:40:41', '2026-07-29 13:57:03'),
(327, 217, 'Orders Edit', 'orders-edit', 0, 1, '2026-07-29 13:40:41', '2026-07-29 13:57:03'),
(328, 217, 'Orders Customer Delivery Update', 'orders-customer-delivery-update', 0, 1, '2026-07-29 13:40:41', '2026-07-29 13:57:03'),
(329, 217, 'Orders Items Add', 'orders-items-add', 0, 1, '2026-07-29 13:40:41', '2026-07-29 13:57:03'),
(330, 217, 'Orders Items Update', 'orders-items-update', 0, 1, '2026-07-29 13:40:41', '2026-07-29 13:57:03'),
(331, 217, 'Orders Items Delete', 'orders-items-delete', 0, 1, '2026-07-29 13:40:41', '2026-07-29 13:57:03'),
(332, 217, 'Orders Assign Agent', 'orders-assign-agent', 0, 1, '2026-07-29 13:40:41', '2026-07-29 13:57:03'),
(333, 217, 'Orders Update', 'orders-update', 0, 1, '2026-07-29 13:40:41', '2026-07-29 13:57:03'),
(334, 217, 'Orders Search', 'orders-search', 0, 1, '2026-07-29 13:40:41', '2026-07-29 13:57:03'),
(335, 217, 'Orders Destroy', 'orders-destroy', 0, 1, '2026-07-29 13:40:41', '2026-07-29 13:57:03'),
(336, 224, 'Blogger Category Create', 'blogger-category-create', 0, 1, '2026-07-29 13:40:41', '2026-07-29 13:40:41'),
(337, 224, 'Blogger Category Store', 'blogger-category-store', 0, 1, '2026-07-29 13:40:41', '2026-07-29 13:40:41'),
(338, 224, 'Blogger Category Show', 'blogger-category-show', 0, 1, '2026-07-29 13:40:41', '2026-07-29 13:40:41'),
(339, 224, 'Blogger Category Edit', 'blogger-category-edit', 0, 1, '2026-07-29 13:40:41', '2026-07-29 13:40:41'),
(340, 224, 'Blogger Category Update', 'blogger-category-update', 0, 1, '2026-07-29 13:40:41', '2026-07-29 13:40:41'),
(341, 224, 'Blogger Category Search', 'blogger-category-search', 0, 1, '2026-07-29 13:40:41', '2026-07-29 13:40:41'),
(342, 224, 'Blogger Category Destroy', 'blogger-category-destroy', 0, 1, '2026-07-29 13:40:41', '2026-07-29 13:40:41'),
(343, 224, 'Update Blogger Category Image', 'update-blogger-category-image', 0, 1, '2026-07-29 13:40:42', '2026-07-29 13:40:42'),
(344, 224, 'Create Blog', 'create-blog', 0, 1, '2026-07-29 13:40:42', '2026-07-29 13:40:42'),
(345, 224, 'Blog Store', 'blog-store', 0, 1, '2026-07-29 13:40:42', '2026-07-29 13:40:42'),
(346, 224, 'Blog Show', 'blog-show', 0, 1, '2026-07-29 13:40:42', '2026-07-29 13:40:42'),
(347, 224, 'Blog Edit', 'blog-edit', 0, 1, '2026-07-29 13:40:42', '2026-07-29 13:40:42'),
(348, 224, 'Blog Update', 'blog-update', 0, 1, '2026-07-29 13:40:42', '2026-07-29 13:40:42'),
(349, 224, 'Blog Search', 'blog-search', 0, 1, '2026-07-29 13:40:42', '2026-07-29 13:40:42'),
(350, 224, 'Blog Delete', 'blog-delete', 0, 1, '2026-07-29 13:40:42', '2026-07-29 13:40:42'),
(351, 224, 'Update Blog Image', 'update-blog-image', 0, 1, '2026-07-29 13:40:42', '2026-07-29 13:40:42'),
(352, 224, 'Career List', 'career-list', 0, 1, '2026-07-29 13:40:42', '2026-07-29 13:40:42'),
(353, 224, 'Create Career', 'create-career', 0, 1, '2026-07-29 13:40:42', '2026-07-29 13:40:42'),
(354, 224, 'Career Store', 'career-store', 0, 1, '2026-07-29 13:40:42', '2026-07-29 13:40:42'),
(355, 224, 'Career Show', 'career-show', 0, 1, '2026-07-29 13:40:42', '2026-07-29 13:40:42'),
(356, 224, 'Career Edit', 'career-edit', 0, 1, '2026-07-29 13:40:42', '2026-07-29 13:40:42'),
(357, 224, 'Career Update', 'career-update', 0, 1, '2026-07-29 13:40:42', '2026-07-29 13:40:42'),
(358, 224, 'Career Search', 'career-search', 0, 1, '2026-07-29 13:40:42', '2026-07-29 13:40:42'),
(359, 224, 'Career Delete', 'career-delete', 0, 1, '2026-07-29 13:40:42', '2026-07-29 13:40:42'),
(360, 224, 'Update Career Image', 'update-career-image', 0, 1, '2026-07-29 13:40:42', '2026-07-29 13:40:42'),
(361, 224, 'Address List', 'address-list', 0, 1, '2026-07-29 13:40:42', '2026-07-29 13:40:42'),
(362, 224, 'Address Create', 'address-create', 0, 1, '2026-07-29 13:40:42', '2026-07-29 13:40:42'),
(363, 224, 'Address Store', 'address-store', 0, 1, '2026-07-29 13:40:42', '2026-07-29 13:40:42'),
(364, 224, 'Address Edit', 'address-edit', 0, 1, '2026-07-29 13:40:42', '2026-07-29 13:40:42'),
(365, 224, 'Address Update', 'address-update', 0, 1, '2026-07-29 13:40:42', '2026-07-29 13:40:42'),
(366, 224, 'Address Destroy', 'address-destroy', 0, 1, '2026-07-29 13:40:42', '2026-07-29 13:40:42'),
(367, NULL, 'Organization Structure', 'organization-structure', 1, 1, '2026-08-12 07:15:47', '2026-08-12 07:15:47'),
(368, 367, 'Branches', 'branches', 1, 1, '2026-08-12 07:15:47', '2026-08-12 07:28:43'),
(369, 367, 'Departments', 'departments', 1, 1, '2026-08-12 07:15:47', '2026-08-12 07:28:43'),
(370, 367, 'Designations', 'designations', 1, 1, '2026-08-12 07:15:47', '2026-08-12 07:28:43'),
(371, 367, 'Shifts', 'shifts', 0, 1, '2026-08-12 07:15:47', '2026-08-12 07:28:43'),
(372, 367, 'Attendance Policies', 'attendance-policies', 0, 1, '2026-08-12 07:15:47', '2026-08-12 07:28:43'),
(373, 367, 'Document Types', 'document-types', 1, 1, '2026-08-12 07:15:47', '2026-08-12 07:28:43'),
(374, 367, 'Holidays', 'holidays', 1, 1, '2026-08-12 07:28:43', '2026-08-12 07:28:43'),
(375, 367, 'Announcements', 'announcements', 1, 1, '2026-08-12 07:28:43', '2026-08-12 07:28:43'),
(376, 367, 'Award Types', 'award-types', 1, 1, '2026-08-12 07:28:43', '2026-08-12 07:28:43'),
(377, NULL, 'Leave Management', '', 1, 1, '2026-08-19 10:22:04', '2026-08-19 10:22:04'),
(378, 377, 'Leave Applications', 'leave-applications', 1, 1, '2026-08-19 10:22:04', '2026-08-19 10:22:04'),
(379, 377, 'Leave Balances', 'leave-balances', 1, 1, '2026-08-19 10:22:04', '2026-08-19 10:22:04'),
(380, 377, 'Leave Types', 'leave-types', 1, 1, '2026-08-19 10:22:04', '2026-08-19 10:22:04'),
(381, 377, 'Leave Policies', 'leave-policies', 1, 1, '2026-08-19 10:22:04', '2026-08-19 10:22:04');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int UNSIGNED NOT NULL,
  `migration` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_reset_tokens_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(5, '2023_11_19_033501_create_sessions_table', 1),
(6, '2023_11_19_051107_create_products_table', 1),
(7, '2023_12_21_061156_create_salesman_table;', 1),
(8, '2024_01_03_072535_create_country_table', 1),
(9, '2024_01_03_072636_create_state_table', 1),
(10, '2024_01_03_085517_create_branches_table', 1),
(11, '2024_01_03_085813_create_city_table', 1),
(12, '2024_01_23_105143_create_sms_templates_table', 1),
(13, '2024_01_23_122842_create_email_templates_table', 1),
(14, '2024_01_29_100457_create_table_sms_queue_table', 1),
(15, '2024_01_29_100510_create_table_sms_log_table', 1),
(16, '2024_02_01_035044_add_additional_fields_to_users_table', 1),
(17, '2024_02_07_074144_create_email_queue_table', 2),
(18, '2024_02_07_074625_create_email_log_table', 3),
(19, '2024_04_24_090556_create_leads_table', 4),
(22, '2024_04_25_110936_create_promotions_table', 5),
(23, '2024_04_25_111147_create_campaigns_table', 6),
(24, '2024_04_28_095043_create_leads_forms_table', 7),
(25, '2024_04_28_103607_create_lead_form_details_table', 8),
(26, '2024_04_28_121706_create_leads_table', 9),
(27, '2024_04_28_124539_create_leads_custom_data_table', 10),
(28, '2024_04_28_125650_create_leads_form_json_table', 11),
(29, '2024_04_29_034649_create_lead_survey_people_table', 12),
(30, '2024_04_29_035234_create_lead_survey_child_table', 13),
(31, '2024_04_30_044646_create_users_table', 14),
(32, '2024_04_30_050803_create_leads_form_table', 15),
(33, '2024_04_30_053636_create_lead_form_details_table', 16),
(34, '2024_04_30_074713_create_permission_groups_table', 17),
(35, '2024_04_30_073603_create_permissions_table', 18),
(36, '2024_04_30_092116_create_roles_table', 19),
(37, '2024_04_30_101349_create_roles_table', 20),
(38, '2024_04_30_101511_create_permissions_table', 21),
(39, '2024_04_30_102006_create_roles_permissions_table', 22),
(40, '2024_05_13_092102_create_agents_table', 23),
(41, '2024_05_13_095540_create_agents_table', 24),
(42, '2024_05_13_130323_create_agents_table', 25),
(43, '2024_05_13_131409_create_agents_table', 26),
(44, '2024_05_15_092501_create_users_table', 27),
(45, '2024_05_15_095923_create_agents_table', 28),
(46, '2024_05_16_085211_create_users_table', 29),
(47, '2024_05_16_085710_create_agents_table', 30),
(48, '2024_05_20_041755_create_users_table', 31),
(49, '2024_05_20_042013_create_agents_table', 32),
(50, '2024_05_28_034337_create_lead_form_details_table', 33),
(51, '2024_05_28_034612_create_lead_form_details_table', 34),
(52, '2026_07_12_000001_add_homepage_flags_to_products_table', 35),
(53, '2026_07_12_000002_add_best_deal_flag_to_products_table', 36),
(54, '2026_07_12_000003_add_is_display_products_to_categories_table', 37),
(55, '2026_07_13_000001_add_category_slug_to_categories_table', 38),
(56, '2026_07_13_155708_add_slug_to_products_table', 39),
(57, '2026_07_14_000001_add_display_flags_to_categories_table', 40),
(58, '2026_07_14_000002_create_product_colors_and_sizes_tables', 41),
(59, '2026_07_14_000003_add_product_variants_to_carts_table', 42),
(60, '2026_07_14_000004_create_shipping_methods_table', 43),
(61, '2026_07_14_000005_create_outlet_locations_tables', 44),
(62, '2026_07_15_000001_create_home_page_settings_table', 45),
(63, '2026_07_18_000001_add_assigned_agent_id_to_orders_table', 46),
(64, '2026_07_18_000002_add_fraud_checker_settings_to_settings_table', 47),
(65, '2026_07_19_000001_add_steadfast_integration_fields', 48),
(66, '2026_07_19_000002_create_faqs_table', 49),
(67, '2026_07_20_000001_add_size_chart_to_products_table', 50),
(68, '2026_07_20_000002_create_size_chart_templates_table', 51),
(69, '2024_02_01_061101_create_users_roles_table', 52),
(70, '2024_05_30_050914_create_jobs_table', 53),
(71, '2024_05_30_074625_create_email_log_table', 54),
(72, '2024_06_26_074625_create_tasks_table', 55),
(73, '2024_07_30_094855_create_campaign_data_table', 56),
(74, '2024_09_08_054822_create_meetings_table', 57),
(75, '2024_09_29_112654_create_invoices_table', 58),
(76, '2024_10_29_085530_create_invoice_custom_form_table', 59),
(77, '2024_11_07_131711_create_product_specification_table', 59),
(78, '2026_07_21_000001_add_app_promo_image_to_settings_table', 59),
(79, '2026_07_21_000002_add_app_promo_enabled_to_settings_table', 60),
(80, '2026_07_21_000003_add_currency_rate_to_settings_table', 61),
(81, '2026_07_21_000004_add_favicon_to_settings_table', 62),
(82, '2026_07_28_000001_add_footer_socials_and_create_newsletter_subscribers', 63),
(83, '2026_07_28_000002_add_content_pages_to_settings_table', 64),
(84, '2026_07_29_000001_expand_menu_permission_columns', 64),
(85, '2026_08_01_000001_add_marketing_codes_to_settings_table', 65),
(86, '2026_08_01_000002_add_custom_codes_to_settings_table', 66),
(87, '2026_08_02_000001_add_product_variants_to_order_details_table', 67),
(88, '2026_08_11_000003_create_employees_table', 68),
(89, '2026_08_12_000001_expand_employee_and_create_organization_tables', 69),
(90, '2026_08_12_000002_create_remaining_organization_tables', 70),
(91, '2026_08_12_000003_expand_organization_module_fields', 71),
(92, '2026_08_19_000001_create_leave_types_table', 72),
(93, '2026_08_19_000002_create_leave_policies_table', 73),
(94, '2026_08_19_000003_create_leave_applications_table', 74),
(95, '2026_08_19_000004_create_leave_balances_table', 74);

-- --------------------------------------------------------

--
-- Table structure for table `newsletter_subscribers`
--

CREATE TABLE `newsletter_subscribers` (
  `id` bigint UNSIGNED NOT NULL,
  `email` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `source` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'footer',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `newsletter_subscribers`
--

INSERT INTO `newsletter_subscribers` (`id`, `email`, `source`, `created_at`, `updated_at`) VALUES
(1, 'mduzzal999111@gmail.com', 'footer', '2026-08-01 07:57:37', '2026-08-01 07:57:37'),
(2, 'hgjg@gmail.com', 'footer', '2026-08-01 07:57:50', '2026-08-01 07:57:50');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` int NOT NULL,
  `user_id` int DEFAULT NULL,
  `session_id` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `billing_address_id` int DEFAULT NULL,
  `assigned_agent_id` char(4) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `custom_order_id` varchar(10) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `order_phone_number` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `total_price` decimal(10,2) DEFAULT NULL,
  `discount` decimal(10,2) DEFAULT NULL,
  `final_price` decimal(10,2) DEFAULT NULL,
  `coupon` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `payment_status` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `payment_type` varchar(30) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `pay_amount` decimal(10,2) DEFAULT NULL,
  `delivery_charge` decimal(10,2) NOT NULL DEFAULT '0.00',
  `shipping_method` varchar(191) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `delivery_status` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT 'Pending',
  `order_note` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `delivery_note` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `order_status` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `cancel_reason` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `possible_delivery_date` datetime DEFAULT NULL,
  `delivery_date` datetime DEFAULT NULL,
  `cancel_date` datetime DEFAULT NULL,
  `sms_response` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL,
  `steadfast_consignment_id` bigint UNSIGNED DEFAULT NULL,
  `steadfast_tracking_code` varchar(191) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `steadfast_status` varchar(191) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `steadfast_response` json DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `user_id`, `session_id`, `billing_address_id`, `assigned_agent_id`, `custom_order_id`, `order_phone_number`, `total_price`, `discount`, `final_price`, `coupon`, `payment_status`, `payment_type`, `pay_amount`, `delivery_charge`, `shipping_method`, `delivery_status`, `order_note`, `delivery_note`, `order_status`, `cancel_reason`, `possible_delivery_date`, `delivery_date`, `cancel_date`, `sms_response`, `created_at`, `updated_at`, `steadfast_consignment_id`, `steadfast_tracking_code`, `steadfast_status`, `steadfast_response`) VALUES
(9, NULL, '2744779658736', 18, '3639', 'B7VUOB', '01959994205', '2360.00', '0.00', '2360.00', NULL, 'NOT PAID', 'Cash on Delivery', NULL, '70.00', NULL, 'Pending', NULL, NULL, 'PROCESSING', NULL, '2026-07-06 06:12:47', NULL, NULL, NULL, '2026-07-04 12:12:47', '2026-07-30 08:18:02', NULL, NULL, NULL, NULL),
(11, NULL, '3167295478638', 20, '2273', 'NKX3ZP', '01959994205', '2260.00', '0.00', '2260.00', NULL, 'NOT PAID', 'Cash on Delivery', '0.00', '70.00', NULL, 'Pending', NULL, NULL, 'Pending', NULL, '2026-07-06 06:27:41', NULL, NULL, '{\"response_code\":202,\"message_id\":3418077,\"success_message\":\"SMS Submitted Successfully 1\",\"error_message\":\"\"}', '2026-07-04 12:27:41', '2026-07-30 08:22:16', NULL, NULL, NULL, NULL),
(12, NULL, '8400725125403', 23, '3639', '2UUTQA', '01959994205', '2700.00', '0.00', '2770.00', NULL, 'NOT PAID', 'Cash on Delivery', '0.00', '70.00', NULL, 'Pending', 'dgfhfb fghtj nh', NULL, 'PROCESSING', NULL, '2026-07-06 07:48:18', NULL, NULL, '{\"response_code\":202,\"message_id\":3425884,\"success_message\":\"SMS Submitted Successfully 1\",\"error_message\":\"\"}', '2026-07-04 13:48:18', '2026-07-30 08:17:50', NULL, NULL, NULL, NULL),
(19, 89, NULL, 30, '3639', 'FRJQ9W', '01304993998', '400.00', '0.00', '520.00', NULL, 'NOT PAID', 'Cash on Delivery', NULL, '120.00', 'Outside Dhaka', 'Pending', 'scdsff', NULL, 'PROCESSING', NULL, '2026-08-01 02:23:41', NULL, NULL, '{\"response_code\":202,\"message_id\":6188274,\"success_message\":\"SMS Submitted Successfully 1\",\"error_message\":\"\"}', '2026-07-30 08:23:41', '2026-07-30 08:24:27', NULL, NULL, NULL, NULL),
(20, 82, NULL, 31, '3639', 'Q92GMG', '01393456789', '600.00', '0.00', '720.00', NULL, 'NOT PAID', 'Cash on Delivery', NULL, '120.00', 'Outside Dhaka', 'Pending', 'Dolorum voluptatum d', NULL, 'PROCESSING', NULL, '2026-08-01 06:30:02', NULL, NULL, '{\"response_code\":202,\"message_id\":6222307,\"success_message\":\"SMS Submitted Successfully 1\",\"error_message\":\"\"}', '2026-07-30 12:30:02', '2026-07-30 12:30:52', NULL, NULL, NULL, NULL),
(21, 82, NULL, 32, NULL, '4P1D95', '01959994205', '500.00', '0.00', '570.00', NULL, 'NOT PAID', 'Cash on Delivery', NULL, '70.00', 'Inside Dhaka', 'Pending', 'asefdesfs', NULL, 'PROCESSING', NULL, '2026-08-03 07:53:50', NULL, NULL, '{\"response_code\":202,\"message_id\":6445971,\"success_message\":\"SMS Submitted Successfully 1\",\"error_message\":\"\"}', '2026-08-01 13:53:50', '2026-08-01 13:53:50', NULL, NULL, NULL, NULL),
(22, 82, NULL, 33, NULL, 'EV26EJ', '01304994998', '500.00', '0.00', '620.00', NULL, 'NOT PAID', 'Cash on Delivery', NULL, '120.00', 'Outside Dhaka', 'Pending', 'ghgfh ghfghg', NULL, 'PROCESSING', NULL, '2026-08-04 12:19:47', NULL, NULL, '{\"response_code\":202,\"message_id\":6525992,\"success_message\":\"SMS Submitted Successfully 1\",\"error_message\":\"\"}', '2026-08-02 06:19:47', '2026-08-02 06:19:48', NULL, NULL, NULL, NULL),
(23, 82, NULL, 34, NULL, 'Y9L739', '01959994205', '1750.00', '0.00', '1820.00', NULL, 'PAID', 'Cash on Delivery', '0.00', '70.00', 'Inside Dhaka', 'Pending', 'dfgh,mnfdsfb fhgdsadhkhgfdsghjffsdfghjgds fg fg gfg', NULL, 'Pending', NULL, '2026-08-04 12:23:35', NULL, NULL, '{\"response_code\":202,\"message_id\":6527177,\"success_message\":\"SMS Submitted Successfully 1\",\"error_message\":\"\"}', '2026-08-02 06:23:35', '2026-08-02 12:13:32', NULL, NULL, NULL, NULL),
(24, 82, NULL, 35, NULL, 'DYGTQ6', '01959994205', '300.00', '0.00', '370.00', NULL, 'NOT PAID', 'Cash on Delivery', NULL, '70.00', 'Inside Dhaka', 'Pending', NULL, NULL, 'PROCESSING', NULL, '2026-08-10 01:05:51', NULL, NULL, '{\"response_code\":202,\"message_id\":7330283,\"success_message\":\"SMS Submitted Successfully 1\",\"error_message\":\"\"}', '2026-08-08 07:05:51', '2026-08-08 07:05:52', NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `order_details`
--

CREATE TABLE `order_details` (
  `id` int NOT NULL,
  `user_id` int DEFAULT NULL,
  `session_id` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `product_id` int NOT NULL,
  `order_id` int NOT NULL,
  `quantity` int NOT NULL,
  `unit_price` decimal(10,2) DEFAULT NULL,
  `total` decimal(10,2) NOT NULL,
  `delivery_status` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `order_status` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL,
  `product_color` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `product_size` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Dumping data for table `order_details`
--

INSERT INTO `order_details` (`id`, `user_id`, `session_id`, `product_id`, `order_id`, `quantity`, `unit_price`, `total`, `delivery_status`, `order_status`, `created_at`, `updated_at`, `product_color`, `product_size`) VALUES
(28, NULL, '2744779658736', 54, 9, 1, '2290.00', '2290.00', NULL, NULL, '2026-07-04 12:12:47', '2026-07-04 12:12:47', NULL, NULL),
(29, NULL, '3167295478638', 47, 11, 1, '2190.00', '2190.00', NULL, NULL, '2026-07-04 12:27:41', '2026-07-04 12:27:41', NULL, NULL),
(40, NULL, '8400725125403', 70, 12, 2, '500.00', '1000.00', NULL, NULL, '2026-07-18 11:16:15', '2026-07-18 11:16:15', NULL, NULL),
(41, NULL, '8400725125403', 61, 12, 1, '1700.00', '1700.00', NULL, NULL, '2026-07-18 11:18:50', '2026-07-18 11:19:15', NULL, NULL),
(43, 89, NULL, 69, 19, 1, '400.00', '400.00', NULL, NULL, '2026-07-30 08:23:41', '2026-07-30 08:24:27', NULL, NULL),
(44, 82, NULL, 68, 20, 2, '300.00', '600.00', NULL, NULL, '2026-07-30 12:30:02', '2026-07-30 12:30:02', NULL, NULL),
(45, 82, NULL, 70, 21, 1, '500.00', '500.00', NULL, NULL, '2026-08-01 13:53:50', '2026-08-01 13:53:50', NULL, NULL),
(46, 82, NULL, 70, 22, 1, '500.00', '500.00', NULL, NULL, '2026-08-02 06:19:47', '2026-08-02 06:19:47', NULL, NULL),
(47, 82, NULL, 71, 23, 1, '750.00', '750.00', NULL, NULL, '2026-08-02 06:23:35', '2026-08-02 06:23:35', NULL, NULL),
(48, 82, NULL, 70, 23, 2, '500.00', '1000.00', NULL, NULL, '2026-08-02 06:23:35', '2026-08-02 06:23:35', NULL, NULL),
(49, 82, NULL, 68, 24, 1, '300.00', '300.00', NULL, NULL, '2026-08-08 07:05:51', '2026-08-08 07:05:51', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `order_info`
--

CREATE TABLE `order_info` (
  `order_id` int NOT NULL,
  `invoice_no` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `customer_id` int DEFAULT NULL,
  `mobile_number` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `area` enum('Inside Dhaka','Outside Dhaka') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `contact_address` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `sub_total` decimal(10,2) NOT NULL,
  `order_tax` decimal(10,2) DEFAULT '0.00',
  `shipping_charge` decimal(10,2) DEFAULT '0.00',
  `discount` decimal(10,2) DEFAULT '0.00',
  `payable_amount` decimal(10,2) NOT NULL,
  `status` enum('New','Pending','Processing','Completed','Cancelled') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'New',
  `order_date` datetime DEFAULT CURRENT_TIMESTAMP,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `outlet_locations`
--

CREATE TABLE `outlet_locations` (
  `id` bigint UNSIGNED NOT NULL,
  `location_name` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `hotline` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `map_url` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `sort_order` int UNSIGNED NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `outlet_locations`
--

INSERT INTO `outlet_locations` (`id`, `location_name`, `address`, `hotline`, `map_url`, `sort_order`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Mirpur 1 (Dhaka)', 'Rupayan Latifa Shamsuddin Square (opposite of Sony Square), 1st Floor, Mirpur Section 1, Dhaka', '01332502911', 'https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3069.714512295742!2d90.35571362755202!3d23.799875666793998!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3755c14977a020ef%3A0xea738f68516b9a5a!2sFabrilife!5e0!3m2!1sen!2sbd!4v1730535919852!5m2!1sen!2sbd', 1, 1, '2026-07-14 11:39:00', '2026-07-14 11:39:00'),
(2, 'Uttara (Dhaka)', 'Level 3, Plot - 67 (Meena Bazar Building), Gausul Azam Avenue, Sector 14, Uttara, Dhaka 1230', '01332502910', 'https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3648.578295120551!2d90.38374011215896!3d23.86910397850021!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3755c50037c40075%3A0x2eb20c0e30b623f1!2sFabrilife%20Uttara%20Outlet!5e0!3m2!1sen!2sbd!4v1730535973054!5m2!1sen!2sbd', 2, 1, '2026-07-14 11:39:00', '2026-07-14 11:39:00'),
(3, 'Mohammadpur (Dhaka)', 'Urban Life, Level 1, House: 18-A/4, Block: F (Near Hatil Showroom), Ring Road, Adabor, Dhaka', '01827080121', 'https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3651.4009381493406!2d90.35577611215679!3d23.76873297856885!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3755c10037d60baf%3A0x4b1f9dec5874626b!2sFabrilife%20Mohammadpur%20Outlet!5e0!3m2!1sen!2sbd!4v1730535990238!5m2!1sen!2sbd', 3, 1, '2026-07-14 11:39:00', '2026-07-14 11:39:00'),
(4, 'Khilgoan (Dhaka)', '926/C (Besides Blue Moon Restaurant & Apan Coffee House), Taltola More, Khilgoan, Dhaka 1219', '01332502906', 'https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3651.8819908621226!2d90.42021331215646!3d23.751587278580626!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3755b9002d5e80c5%3A0x1d5f6af4577ce33!2sFabrilife%20Khilgaon!5e0!3m2!1sen!2sbd!4v1730536277096!5m2!1sen!2sbd', 4, 1, '2026-07-14 11:39:00', '2026-07-14 11:39:00'),
(5, 'GEC (Chittagong)', 'Madina Tower, Level 2, Opposite of Hotel Peninsula, Beside Yunusco City Centre, GEC, Chattogram', '01620220606', 'https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3689.8957791500075!2d91.81869441212753!3d22.357563779560678!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x30acd9c7b19c37dd%3A0x1695a20f97af77e7!2sFabrilife%20Chattogram%20GEC%20Outlet!5e0!3m2!1sen!2sbd!4v1730536297158!5m2!1sen!2sbd', 5, 1, '2026-07-14 11:39:00', '2026-07-14 11:39:00'),
(6, 'Khulna', 'Ground Floor, Beside Miniso, 27 KDA Approach Rd, Khulna', '01332836616', 'https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3677.440540647982!2d89.54748767600398!3d22.823185223738154!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x39ff91e495a45c7d%3A0x5889a1215b930d14!2sFabrilife%20Khulna%20Outlet!5e0!3m2!1sen!2sbd!4v1738218320810!5m2!1sen!2sbd', 6, 1, '2026-07-14 11:39:00', '2026-07-14 11:39:00'),
(7, 'Kushtia', 'Ground Floor, Chand Mohammad Rd, Opposite of Aarong, Kushtia-7000', '01332836617', 'https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d911.8589190797671!2d89.12742431543988!3d23.90962179706477!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x39fe97001cdd5195%3A0x86ef39739967215e!2sFabrilife%20Kushtia%20Outlet!5e0!3m2!1sen!2sbd!4v1738218017507!5m2!1sen!2sbd', 7, 1, '2026-07-14 11:39:00', '2026-07-14 11:39:00'),
(8, 'Jamuna Future Park', '1st Floor, Through Center Court, Beside ILLIYEEN & Yellow, Jamuna Future Park, Progoti Shoroni, Dhaka', '01332836615', 'https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3650.1422244897517!2d90.42165901215776!3d23.813541078538208!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3755c62fb95f16c1%3A0xb333248370356dee!2sJamuna%20Future%20Park!5e0!3m2!1sen!2sbd!4v1730536332390!5m2!1sen!2sbd', 8, 1, '2026-07-14 11:39:00', '2026-07-14 11:39:00'),
(9, 'Sylhet', '1st Floor, House- 34, Block- A, Kumarpara Road, Kumarpara, Sylhet', '01324264998', 'https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3619.030800474299!2d91.8783084!3d24.896931000000002!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x375055b16f823d19%3A0xcabfc289b2c14750!2sFabrilife%20Sylhet%20Outlet!5e0!3m2!1sen!2sbd!4v1752580127252!5m2!1sen!2sbd', 9, 1, '2026-07-14 11:39:00', '2026-07-14 11:39:00'),
(10, 'Banani', 'Beside Sheraton, between Bata & Bay, Kamal Ataturk Avenue, Banani, Dhaka', '01332502929', 'https://www.google.com/maps/embed?pb=!1m14!1m8!1m3!1d228.1685739170851!2d90.40492882234824!3d23.793795291473806!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3755c79c5ba6fa3b%3A0x5f1002e9eca6bc64!2sDelta%20Dahlia!5e0!3m2!1sen!2sbd!4v1752580307998!5m2!1sen!2sbd', 10, 1, '2026-07-14 11:39:00', '2026-07-14 11:39:00'),
(11, 'Rajshahi', 'South Side of New Market, 341 Station Rd, Rajshahi 6100', '+8801324264999', 'https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d1864992.163147838!2d88.1581217054132!3d24.081695308463363!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x39fbef02162ba0bb%3A0xefd17480f9e9f102!2sFabrilife%20Rajshahi%20Outlet!5e0!3m2!1sen!2sbd!4v1755880435171!5m2!1sen!2sbd', 11, 1, '2026-07-14 11:39:00', '2026-07-14 11:39:00'),
(12, 'Dhanmondi', 'House-56, Road No. 3A, Jigatola, Dhanmondi, Dhaka', '+8801324264997', 'https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3652.205057455127!2d90.37230701163426!3d23.74006597858851!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3755b9c7bd0134cb%3A0x392f3b40bc596c46!2sFabrilife%20Dhanmondi%20Outlet!5e0!3m2!1sen!2sbd!4v1755880788752!5m2!1sen!2sbd', 12, 1, '2026-07-14 11:39:00', '2026-07-14 11:39:00'),
(13, 'Wari', '28 Rankin St, Dhaka', '+0881335183197', 'https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d913.1938139725384!2d90.41516857611931!3d23.719718523048954!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3755b8541365f65d%3A0x13c9a75479f74e8a!2s28%20Rankin%20St%2C%20Dhaka%201203!5e0!3m2!1sen!2sbd!4v1769426988915!5m2!1sen!2sbd', 13, 1, '2026-07-14 11:39:00', '2026-07-14 11:39:00');

-- --------------------------------------------------------

--
-- Table structure for table `outlet_page_settings`
--

CREATE TABLE `outlet_page_settings` (
  `id` bigint UNSIGNED NOT NULL,
  `banner_image` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `permissions`
--

CREATE TABLE `permissions` (
  `id` bigint UNSIGNED NOT NULL,
  `parent_id` int DEFAULT NULL,
  `permission_group_id` bigint UNSIGNED NOT NULL,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `details` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `permission_groups`
--

CREATE TABLE `permission_groups` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint UNSIGNED NOT NULL,
  `tokenable_type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint UNSIGNED NOT NULL,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `personal_access_tokens`
--

INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `expires_at`, `created_at`, `updated_at`) VALUES
(1, 'App\\Models\\User', 1, 'gpleCRMToken', '0970f2e9be65303bee4b46dd2c7cf229d55ec3a94520768872b4fab7196431a9', '[\"*\"]', NULL, NULL, '2024-04-30 03:39:52', '2024-04-30 03:39:52'),
(2, 'App\\Models\\User', 1, 'gpleCRMToken', '3d2c3352dd17459faac06bf4f2a2f7352dca86f488321ddaa0a3e5627e64f44a', '[\"*\"]', NULL, NULL, '2024-05-04 23:55:07', '2024-05-04 23:55:07'),
(3, 'App\\Models\\User', 1, 'gpleCRMToken', 'a0c7fbeb9117eb8a2cd220b47e0381b035218a70fb95615f1a17c88d0891510f', '[\"*\"]', '2024-05-05 00:32:16', NULL, '2024-05-04 23:56:06', '2024-05-05 00:32:16'),
(4, 'App\\Models\\User', 1, 'gpleCRMToken', '2858a3a1658d14c48d2b22e9737ece0c79a33dbd83fbdb008950f3c88f4ae3fe', '[\"*\"]', '2024-05-05 00:31:57', NULL, '2024-05-05 00:30:34', '2024-05-05 00:31:57'),
(5, 'App\\Models\\User', 1, 'gpleCRMToken', '6834f92012607dce3757beb3b051fa7ca816ed66697533035e16374b9c9b8a2b', '[\"*\"]', '2024-05-07 06:48:27', NULL, '2024-05-05 01:25:59', '2024-05-07 06:48:27'),
(6, 'App\\Models\\User', 1, 'gpleCRMToken', 'c7e87624bf37316db967aa11e69d29ce25986a898828d8faa7eba29d5a7098ea', '[\"*\"]', '2024-05-07 06:47:52', NULL, '2024-05-05 02:58:12', '2024-05-07 06:47:52'),
(7, 'App\\Models\\User', 1, 'gpleCRMToken', '068b7d9dcfdb1998324d54275c37856078ae44277a5afa73167c97166523d052', '[\"*\"]', '2024-05-05 03:53:54', NULL, '2024-05-05 03:38:15', '2024-05-05 03:53:54'),
(8, 'App\\Models\\User', 1, 'gpleCRMToken', '474a0f9194148a5ea7b78e5bca25ba2b66371ebdb41ce38c1dc2fe813e164d90', '[\"*\"]', NULL, NULL, '2024-05-05 03:40:34', '2024-05-05 03:40:34'),
(9, 'App\\Models\\User', 1, 'gpleCRMToken', 'e8de52ea86403848356bf96d04232ede81bbbe05b0498cf95bf27b2261836c99', '[\"*\"]', '2024-05-07 06:48:24', NULL, '2024-05-05 03:40:58', '2024-05-07 06:48:24'),
(10, 'App\\Models\\User', 4, 'gpleCRMToken', '70a6abf5b1b961e39cb3bd6f78bbb5b45d4cd876ab50987da5839dd174293e7d', '[\"*\"]', NULL, NULL, '2024-05-13 06:20:17', '2024-05-13 06:20:17'),
(11, 'App\\Models\\User', 2, 'gpleCRMToken', '860eca8582c2c8f2713aca3eed8704c90572d2ca9106d105921c062dee8a89d3', '[\"*\"]', NULL, NULL, '2024-05-15 04:44:35', '2024-05-15 04:44:35'),
(12, 'App\\Models\\User', 1, 'gpleCRMToken', 'e7afa19f6d684a2fee3b5d82d52b7263ab841717e950174af3798747a4c73253', '[\"*\"]', NULL, NULL, '2024-05-16 03:17:59', '2024-05-16 03:17:59'),
(13, 'App\\Models\\User', 1, 'gpleCRMToken', 'c64612dccc667876dcf0137036d1e5ca032f82ac9369207de24b21ff022c258d', '[\"*\"]', NULL, NULL, '2024-05-19 22:24:44', '2024-05-19 22:24:44');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` bigint UNSIGNED NOT NULL,
  `category_id` int DEFAULT NULL,
  `brand_id` int DEFAULT NULL,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `product_specification` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `how_to_order` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `return_policy` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `key_features` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `club_point` int DEFAULT '0',
  `product_type` char(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `product_cost` double(20,2) DEFAULT NULL,
  `product_value` double(20,2) DEFAULT NULL,
  `discount_price` decimal(10,2) DEFAULT NULL,
  `product_code` char(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `img_path` varchar(180) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `img_path_2` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `img_path_3` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `img_path_4` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `img_path_5` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `img_path_6` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `max_purchase_limit` tinyint DEFAULT NULL,
  `stock_status` char(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'In Stock',
  `stock_quantity` int NOT NULL DEFAULT '1',
  `xxs_stock` int NOT NULL DEFAULT '0',
  `xs_stock` int NOT NULL DEFAULT '0',
  `s_stock` int NOT NULL DEFAULT '0',
  `m_stock` int NOT NULL DEFAULT '0',
  `l_stock` int NOT NULL DEFAULT '0',
  `xl_stock` int NOT NULL DEFAULT '0',
  `xxl_stock` int NOT NULL DEFAULT '0',
  `xxxl_stock` int NOT NULL DEFAULT '0',
  `xxxxl_stock` int NOT NULL DEFAULT '0',
  `total_sell` int NOT NULL DEFAULT '0',
  `colors` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(1) NOT NULL,
  `is_trending` tinyint(1) NOT NULL DEFAULT '0',
  `is_lifestyle` tinyint(1) NOT NULL DEFAULT '0',
  `is_best_deal` tinyint(1) NOT NULL DEFAULT '0',
  `created_by` bigint DEFAULT NULL,
  `updated_by` bigint DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `size_chart_title` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `size_chart_columns` json DEFAULT NULL,
  `size_chart_rows` json DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `category_id`, `brand_id`, `name`, `slug`, `description`, `product_specification`, `how_to_order`, `return_policy`, `key_features`, `club_point`, `product_type`, `product_cost`, `product_value`, `discount_price`, `product_code`, `img_path`, `img_path_2`, `img_path_3`, `img_path_4`, `img_path_5`, `img_path_6`, `max_purchase_limit`, `stock_status`, `stock_quantity`, `xxs_stock`, `xs_stock`, `s_stock`, `m_stock`, `l_stock`, `xl_stock`, `xxl_stock`, `xxxl_stock`, `xxxxl_stock`, `total_sell`, `colors`, `status`, `is_trending`, `is_lifestyle`, `is_best_deal`, `created_by`, `updated_by`, `created_at`, `updated_at`, `size_chart_title`, `size_chart_columns`, `size_chart_rows`) VALUES
(55, 36, 8, 'Zenaida Vinson', 'zenaida-vinson', 'Vel eos ut aut non i. ghjn nbmh bnmb', 'Rerum consequatur ni. bhnmjhg hjg&nbsp; hjm', NULL, NULL, '', 0, 'Physical', NULL, 1400.00, '1100.00', 'Aut id vel eiusmod', '67285487491ac-square_1783858920.jpg', '677136bcd5618-square_1783858920.jpg', '6a467cc13ae9d-square_1783858920.jpg', NULL, NULL, NULL, 10, 'In Stock', 500, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 1, 1, 1, 1, 82, NULL, '2026-07-12 12:22:00', '2026-07-13 10:45:33', NULL, NULL, NULL),
(56, 36, 8, 'Jemima Shelton', 'jemima-shelton', '<p>jghjhhjkhk fgfdhgf</p>', NULL, NULL, NULL, '', 0, 'Physical', NULL, 900.00, '863.00', 'Ea eaque qui ut mini', '66c1f1a693459-square_1783859916.jpg', '', '', NULL, NULL, NULL, 10, 'In Stock', 800, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 1, 1, 1, 1, 82, NULL, '2026-07-12 12:38:36', '2026-07-13 10:45:33', NULL, NULL, NULL),
(57, 36, 5, 'Keely Coleman', 'keely-coleman', 'dfgdg bfghfg ghjgfn ghngfjn', NULL, NULL, NULL, '', 0, 'Physical', NULL, 900.00, '810.00', 'Assumenda possimus', '650182af2f2e1-square_1783860016.jpeg', '', '', NULL, NULL, NULL, 10, 'In Stock', 320, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 1, 1, 1, 1, 82, NULL, '2026-07-12 12:40:16', '2026-07-13 10:45:33', NULL, NULL, NULL),
(58, 36, 9, 'Abdul Barr', 'abdul-barr', '&nbsp;gfh ghjg bjmnhg bnj bnmjhk', '<p>tyhjutyuj</p>', NULL, NULL, '', 0, 'Physical', 400.00, 900.00, '585.00', 'Labore', '67dba9546f2b0-square_1783860471.jpg', '', '', NULL, NULL, NULL, 10, 'In Stock', 927, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 1, 1, 1, 1, 82, NULL, '2026-07-12 12:47:51', '2026-07-13 10:45:33', NULL, NULL, NULL),
(59, 36, 5, 'Courtney Kinney', 'courtney-kinney', 'Qui temporibus iste .&nbsp; bfghb', NULL, NULL, NULL, '', 0, 'Physical', NULL, 1500.00, '899.00', 'Quasi', '6939455737a2c-square_1783861642.jpg', '', '', NULL, NULL, NULL, 10, 'In Stock', 17, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 1, 1, 1, 1, 82, NULL, '2026-07-12 13:07:22', '2026-07-13 10:45:33', NULL, NULL, NULL),
(60, 36, 8, 'Yeo Baker', 'yeo-baker', '<p>nbmjhbj vhng&nbsp;</p>', NULL, NULL, NULL, '', 0, 'Physical', NULL, 1600.00, '909.00', 'vbg', '6714980c6a404-square_1783861785.jpg', '', '', NULL, NULL, NULL, 10, 'In Stock', 356, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 1, 1, 1, 1, 82, NULL, '2026-07-12 13:09:45', '2026-07-13 10:45:33', NULL, NULL, NULL),
(61, 36, 5, 'Jin Gray Exercitationem neces', 'jin-gray-exercitationem-neces', 'Assumenda nihil irur. cvbcg fxggfffff', NULL, NULL, NULL, '', 0, 'Physical', NULL, 1800.00, '1700.00', 'Exercitationem', '677136bcd5618-square_1783861887.jpg', '', '', NULL, NULL, NULL, 10, 'In Stock', 37, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 1, 1, 1, 1, 82, 82, '2026-07-12 13:11:27', '2026-07-13 10:45:34', NULL, NULL, NULL),
(62, 36, 8, 'Mufutau Moran do quam quidem e', 'mufutau-moran-do-quam-quidem-e', 'Saepe fugiat lorem a.fd fthf&nbsp; &nbsp; &nbsp;fhg ghngj hjgh&nbsp;&nbsp;', NULL, NULL, NULL, '', 0, 'Physical', NULL, 800.00, '461.00', 'Rem', '69d5da3bddb9d-square_1783862003.jpg', '', '', NULL, NULL, NULL, 10, 'Limit Out', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 1, 1, 1, 1, 82, 82, '2026-07-12 13:13:23', '2026-07-13 10:45:34', NULL, NULL, NULL),
(63, 37, 8, 'Women\'s Premium Kurti - Empress Pink', 'womens-premium-kurti-empress-pink', '<p>fdgdgdfgd</p>', NULL, NULL, NULL, '', 0, 'Physical', NULL, 1800.00, NULL, 'Empress Pink', '67c055688b021-square_1783935880.jpg', '', '', NULL, NULL, NULL, 10, 'In Stock', 500, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 1, 1, 0, 0, 82, NULL, '2026-07-13 09:44:40', '2026-07-13 10:45:34', NULL, NULL, NULL),
(64, 37, 8, 'Womens Premium Kurti - Sylis', 'womens-premium-kurti-sylis', '<p>zxcxzvxxv&nbsp; vbxczb cvb xcb xcz</p>', '<p>xv cxvxcv xvcv xzcv</p>', NULL, NULL, '', 0, 'Physical', NULL, 990.00, NULL, 'Kurti - Sylis', '69d5da3bddb9d-square_1783936069.jpg', '', '', NULL, NULL, NULL, 10, 'In Stock', 500, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 1, 0, 1, 0, 82, NULL, '2026-07-13 09:47:49', '2026-07-13 10:45:34', NULL, NULL, NULL),
(65, 37, 9, 'Womens Premium Kurti - Petra', 'womens-premium-kurti-petra', '<p>dfsfg fchtfgh gjhg</p>', '<p>gjhngjghj</p>', NULL, NULL, '', 0, 'Physical', NULL, 1800.00, '1290.00', 'Kurti - Petra', '69e61281da4a7-square_1783945679.jpg', '', '', NULL, NULL, NULL, 10, 'In Stock', 500, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 1, 0, 0, 1, 82, NULL, '2026-07-13 12:27:59', '2026-07-13 12:27:59', NULL, NULL, NULL),
(66, 37, 9, 'Teens Premium Tunic - Luniva', 'teens-premium-tunic-luniva', '<p>asdsfdgdfgfdgfdghfdh fhdf&nbsp; &nbsp; ghhhhhhhhhhhhhg</p>', NULL, NULL, NULL, '', 0, 'Physical', NULL, 2500.00, '1890.00', 'Tunic - Luniva', '68e26194d2cf2-square_1783945763.jpg', '', '', NULL, NULL, NULL, 10, 'In Stock', 500, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 1, 1, 0, 0, 82, NULL, '2026-07-13 12:29:23', '2026-07-13 12:29:23', NULL, NULL, NULL),
(67, 37, 9, 'Women Premium Tops -Parisha', 'women-premium-tops-parisha', '<p>gfhnfgjhhhhhhhh</p>', NULL, NULL, NULL, '', 0, 'Physical', NULL, 3000.00, '2500.00', 'Tops -Parisha', '6a22c00255a92-square_1783945939.jpg', '', '', NULL, NULL, NULL, 10, 'In Stock', 500, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 1, 0, 1, 0, 82, NULL, '2026-07-13 12:32:19', '2026-07-13 12:32:19', NULL, NULL, NULL),
(68, 37, 9, 'Jelani Maddox', 'jelani-maddox', '<p>fghhhhhhhhfh</p>', NULL, NULL, NULL, '', 0, 'Physical', NULL, 1500.00, '300.00', 'Cupiditate dolores a', '6a0da8cfd1e8b-square_1783946161.jpg', '', '', NULL, NULL, NULL, 10, 'In Stock', 440, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 1, 0, 0, 1, 82, 82, '2026-07-13 12:33:58', '2026-07-13 12:36:01', NULL, NULL, NULL),
(69, 37, 9, 'Castor Vasquez', 'castor-vasquez', 'Velit ea ut inventor. bfxgbfh fdgdfsg', NULL, NULL, NULL, '', 0, 'Physical', NULL, 1300.00, '400.00', 'Ipsam et voluptatum', '67dba9546f2b0-square_1783946094.jpg', '', '', NULL, NULL, NULL, 10, 'Limit Out', 637, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 1, 0, 1, 1, 82, 82, '2026-07-13 12:34:54', '2026-07-13 12:35:17', NULL, NULL, NULL),
(70, 38, 8, 'men Shirt color and size', 'men-shirt-color-and-size', '<p>dffffffffgfdsb ghfgh dsffffffffhdfs sdfghs fghdffgh&nbsp; &nbsp;fh d fhdf h fghhs sdfgsdf sdfgdfgs dsdfgsdf fgsdg sdfga&nbsp; gh</p>', NULL, NULL, NULL, '', 0, 'Physical', NULL, 800.00, '500.00', 'men Shirt', '62178453a886d-square_1784012614.jpg', '69722a3a15ee7-square_1784012137.jpg', '664643eec9365-square_1784012137.jpeg', NULL, NULL, NULL, 10, 'In Stock', 800, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 1, 1, 1, 1, 82, 82, '2026-07-14 06:55:37', '2026-07-14 07:03:34', NULL, NULL, NULL),
(71, 38, 9, 'dfgd fgh fgh ghjngh gjgh', 'test', '<p>fghn fgggggggggggg fgnhhhhhhgjhg</p>', NULL, NULL, NULL, '', 0, 'Physical', NULL, 800.00, '750.00', 'test', '554cfc47-b974-4e7d-9053-94d1c6eb80cb.jpg', '', '', '', '', '', 10, 'In Stock', 500, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 1, 0, 0, 0, 82, 82, '2026-07-15 13:04:34', '2026-07-20 08:19:24', 'Size chart - In Inches (Expected Deviation < 3%)', '[\"Size\", \"Chest (round)\", \"Length\", \"Sleeve\"]', '[{\"size\": \"M\", \"chest\": \"39\", \"length\": \"27.5\", \"sleeve\": \"8.25\"}, {\"size\": \"L\", \"chest\": \"40.5\", \"length\": \"28.5\", \"sleeve\": \"8.5\"}, {\"size\": \"XL\", \"chest\": \"43\", \"length\": \"29\", \"sleeve\": \"9\"}, {\"size\": \"2XL\", \"chest\": \"45\", \"length\": \"30\", \"sleeve\": \"9.49\"}]'),
(72, 38, 9, 'tyht gjyuy', 'tyht-gjyuy', '<p>fhggy hjn hbjjkfhj</p>', NULL, NULL, NULL, '', 0, 'Physical', NULL, 500.00, '450.00', 'yjhgut', '87319641-166c-43cb-9bca-4b7af334bca0.jpg', '', '', '', '', '', 10, 'In Stock', 500, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 1, 1, 0, 1, 82, NULL, '2026-07-20 08:18:25', '2026-07-20 08:18:25', 'Size chart - In Inches (Expected Deviation < 3%)', '[\"Size\", \"Chest (round)\", \"Length\", \"Sleeve\"]', '[{\"size\": \"M\", \"chest\": \"39\", \"length\": \"27.5\", \"sleeve\": \"8.25\"}, {\"size\": \"L\", \"chest\": \"40.5\", \"length\": \"28.5\", \"sleeve\": \"8.5\"}, {\"size\": \"XL\", \"chest\": \"43\", \"length\": \"29\", \"sleeve\": \"9\"}, {\"size\": \"2XL\", \"chest\": \"45\", \"length\": \"30\", \"sleeve\": \"9.49\"}]');

-- --------------------------------------------------------

--
-- Table structure for table `product_color`
--

CREATE TABLE `product_color` (
  `product_id` bigint UNSIGNED NOT NULL,
  `product_color_id` bigint UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `product_color`
--

INSERT INTO `product_color` (`product_id`, `product_color_id`) VALUES
(70, 1),
(71, 1),
(70, 2),
(70, 3),
(71, 3);

-- --------------------------------------------------------

--
-- Table structure for table `product_colors`
--

CREATE TABLE `product_colors` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `hex_code` varchar(7) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `product_colors`
--

INSERT INTO `product_colors` (`id`, `name`, `hex_code`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Blue', '#0D1C8C', 1, '2026-07-14 06:50:39', '2026-07-14 06:50:39'),
(2, 'Red', '#C81414', 1, '2026-07-14 06:50:49', '2026-07-14 06:50:49'),
(3, 'Green', '#12812E', 1, '2026-07-14 06:51:03', '2026-07-14 06:51:03');

-- --------------------------------------------------------

--
-- Table structure for table `product_size`
--

CREATE TABLE `product_size` (
  `product_id` bigint UNSIGNED NOT NULL,
  `product_size_id` bigint UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `product_size`
--

INSERT INTO `product_size` (`product_id`, `product_size_id`) VALUES
(70, 1),
(70, 2),
(71, 2),
(70, 3),
(71, 3),
(70, 4),
(70, 5);

-- --------------------------------------------------------

--
-- Table structure for table `product_sizes`
--

CREATE TABLE `product_sizes` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `sort_order` int UNSIGNED NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `product_sizes`
--

INSERT INTO `product_sizes` (`id`, `name`, `sort_order`, `status`, `created_at`, `updated_at`) VALUES
(1, 'S', 1, 1, '2026-07-14 06:51:25', '2026-07-14 06:51:25'),
(2, 'M', 2, 1, '2026-07-14 06:51:35', '2026-07-14 06:51:35'),
(3, 'L', 3, 1, '2026-07-14 06:51:44', '2026-07-14 06:51:44'),
(4, 'XL', 4, 1, '2026-07-14 06:51:58', '2026-07-14 06:51:58'),
(5, 'XXL', 5, 1, '2026-07-14 06:52:10', '2026-07-14 06:52:20');

-- --------------------------------------------------------

--
-- Table structure for table `product_specification`
--

CREATE TABLE `product_specification` (
  `id` bigint UNSIGNED NOT NULL,
  `product_id` int UNSIGNED DEFAULT NULL,
  `work_order_number` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `work_order_value` decimal(15,2) NOT NULL,
  `work_order_file` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `work_order_rate` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `purchase_order_value` decimal(15,2) DEFAULT NULL,
  `purchase_order_file` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `amc_start_date` date DEFAULT NULL,
  `amc_renewal_date` date DEFAULT NULL,
  `amc_rate` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `amc_effective_amount` decimal(15,2) DEFAULT NULL,
  `amc_agreement_documents` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `service_type` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `software_value` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `hardware_value` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `implementation_value` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `invoice_mushak_file` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tax_exemption_certificate` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `note` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `promotions`
--

CREATE TABLE `promotions` (
  `id` bigint UNSIGNED NOT NULL,
  `promotion_title` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `file_location` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `promo_type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `promotions`
--

INSERT INTO `promotions` (`id`, `promotion_title`, `description`, `file_location`, `start_date`, `end_date`, `promo_type`, `status`, `created_at`, `updated_at`) VALUES
(44, 'Web Development', NULL, '', NULL, NULL, NULL, 1, '2024-05-27 01:40:04', '2024-05-27 01:40:04'),
(45, 'Android', NULL, '', NULL, NULL, NULL, 1, '2024-05-27 01:40:13', '2024-05-27 01:40:13'),
(48, 'website development', 'Discover impactful marketing campaigns and strategies for brand growth. Learn from the best and craft your own successful plan.', '', '2024-06-19', '2024-07-01', 'website development', 1, '2024-07-02 03:01:42', '2024-07-02 03:01:42'),
(49, 'Sell Home', 'a planned group of especially political, business, or military activities that are intended to achieve a particular aim: The protests were part of their campaign against the proposed building development in the area. The city has just launched (= begun) its annual campaign to stop drunk driving.', 'sample-file_1719917220.csv', '2024-06-01', '2024-08-21', 'Sell Home', 1, '2024-07-02 03:10:41', '2024-07-02 04:47:00'),
(50, 'x', 'xxx', 'VIVR Rest API Document Utility Bill Payment-1.0.0_1719916149.pdf', '2024-07-03', '2024-07-31', 'xx', 1, '2024-07-02 04:29:09', '2024-07-02 04:29:09'),
(51, 'y', 'y', 'sample-file_1719917248.csv', '2024-07-01', '2024-07-31', 'y', 1, '2024-07-02 04:30:05', '2024-07-02 04:47:28'),
(52, 'oop edit', 'oop', 'sample-test_1719920954.csv', '2024-07-01', '2024-07-31', 'oop', 1, '2024-07-02 05:49:14', '2024-07-02 21:49:45'),
(53, 'buy 1 get 1 offer', 'Software developers write code using programming languages, build software components, and test their designs. As a part of software testing, developers address issues or errors. After deploying an application, software developers perform maintenance, updates, and upgrades as needed.', 'sample-test_1720077503.csv', '2024-07-01', '2024-07-24', 'buy 1 get 1 offer', 1, '2024-07-04 01:18:23', '2024-07-04 01:18:23'),
(54, '50% discount', NULL, 'CRM(1)_1720077770.xlsx', NULL, NULL, NULL, 1, '2024-07-04 01:22:50', '2024-07-04 01:22:50'),
(56, '70% discount', '70% discount for all product', 'ASH1825037M_SDA_REPORT (1)_1720078225.pdf', '2024-07-01', '2024-07-31', '70% discount for all product', 1, '2024-07-04 01:30:25', '2024-07-04 01:30:25'),
(57, 'buy 1 get 2', NULL, 'VIVR Rest API Document Utility Bill Payment-1.0.0_1720079359.pdf', NULL, NULL, NULL, 1, '2024-07-04 01:49:19', '2024-07-04 01:49:19'),
(59, 'buy up to 1000tk get 100 tk discount', 'Copyright © 2013 by the American Psychological Association. This content may be reproduced for classroom or teaching purposes\r\nprovided that credit is given to the American Psychological Association. For any other use, please contact the APA Permissions Office.\r\nBlock Quotation Examples\r\nExample 1\r\nThis example demonstrates a block quote. Because some introductory phrases will lead\r\nnaturally into the block quote,\r\nyou might choose to begin the block quote with a lowercase letter. In this and the later\r\nexamples we use “Lorem ipsum” text to ensure that each block quotation contains 40 words or\r\nmore. Lorem ipsum dolor sit amet, consectetur adipiscing elit. (Organa, 2013, p', 'string_1720082913.docx', '2024-07-23', '2024-07-31', 'buy up to 1000tk get 100 tk discount', 1, '2024-07-04 02:48:33', '2024-07-04 02:48:33'),
(60, 'ff', NULL, '', NULL, NULL, NULL, 1, '2024-07-04 03:00:44', '2024-07-04 03:00:44'),
(61, 'gg', NULL, '', NULL, NULL, NULL, 1, '2024-07-04 03:00:49', '2024-07-04 03:00:49'),
(62, 'gg', NULL, 'sample-test_1720083661.csv', NULL, NULL, NULL, 1, '2024-07-04 03:01:01', '2024-07-04 03:01:01'),
(63, 'rr', NULL, 'mobile_1720083674.xlsx', NULL, NULL, NULL, 1, '2024-07-04 03:01:14', '2024-07-04 03:01:14'),
(65, 'dd', NULL, 'ASH1825037M_SDA_REPORT (1)_1720083699.pdf', NULL, NULL, NULL, 1, '2024-07-04 03:01:39', '2024-07-04 03:01:39'),
(69, 'ggg', 'ggg', '', '2024-06-01', '2024-07-26', NULL, 1, '2024-07-04 03:06:47', '2024-07-04 03:06:47'),
(70, 'c', NULL, '', NULL, NULL, NULL, 1, '2024-07-04 04:43:57', '2024-07-04 04:43:57'),
(71, 'Test promotion1', NULL, '', '2024-07-09', '2024-07-11', NULL, 1, '2024-07-08 05:02:28', '2024-07-08 05:02:28'),
(72, '50% discount offer', 'xyz', 'Knowledge Based System (KBS)_1727238023.pdf', '2024-09-01', '2024-09-06', '50% discount sell', 1, '2024-09-24 22:20:23', '2024-09-24 22:20:23');

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` int NOT NULL,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `menu_details` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `permission_details` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin,
  `permission_ids` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin,
  `status` tinyint NOT NULL COMMENT '0 => Inactive, 1 => Active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `slug`, `menu_details`, `permission_details`, `permission_ids`, `status`, `created_at`, `updated_at`) VALUES
(5, 'Super Admin', 'super_admin', '{\"Leads_Form\":{\"leadsform-index\":\"Form List\",\"leadsform-create\":\"Create Form\",\"dynamictable-create\":\"Create Dynamic Tables\",\"dynamictable-index\":\"Dynamic Tables List\"},\"Lead_Management\":{\"lead-index\":\"Leads\",\"lead-create\":\"Create a Lead\"},\"Campaign\":{\"campaign-index\":\"Campaign List\",\"campaign-create\":\"Create a Campaign\",\"promotion-index\":\"Promotion List\",\"promotion-create\":\"Create Promotion\"},\"Email_Module\":{\"send-email\":\"Send an Email\",\"send-email-list\":\"Emails\",\"email-template\":\"Email Templates\",\"email-template-create\":\"Create Template\",\"send-bulk-email\":\"Bulk Upload\"},\"SMS_Module\":{\"send-sms-list\":\"SMS List\",\"send-sms\":\"Send SMS\",\"sms-template\":\"SMS Templates\",\"sms-template-create\":\"Create Template\",\"send-bulk-sms\":\"Send Bulk SMS\"},\"Tasks\":{\"task-list\":\"Task List\",\"add-task\":\"Add Task\"},\"Employees\":{\"employee-list\":\"Employee List\",\"add-employee\":\"Add Employee\"},\"Customers\":{\"customers\":\"Customer List\"},\"Invoice\":{\"invoice-create\":\"Create Invoice\",\"invoice-index\":\"Invoice List\"},\"Organization_Structure\":{\"branches\":\"Branches\",\"departments\":\"Departments\",\"designations\":\"Designations\",\"holidays\":\"Holidays\",\"announcements\":\"Announcements\",\"award-types\":\"Award Types\",\"document-types\":\"Document Types\"}}', '{\"Leads_Form\":{\"leadsform-index\":\"Form List\",\"leadsform-create\":\"Create Form\",\"dynamictable-create\":\"Create Dynamic Tables\",\"dynamictable-index\":\"Dynamic Tables List\",\"leadsform-show\":\"Leads Form Show\",\"leadsform-edit\":\"Leads Form Edit\",\"leadsform-destroy\":\"Leads Form Destroy\",\"dynamictable-edit\":\"Dynamic Table Edit\",\"dynamictable-show\":\"Dynamic Table Show\",\"dynamictable-destroy\":\"Dynamic Table Destroy\"},\"Lead_Management\":{\"lead-index\":\"Leads\",\"lead-create\":\"Create a Lead\",\"leads-upload\":\"Upload Lead\",\"lead-show\":\"Lead Show\",\"lead-edit\":\"Lead Edit\",\"lead-destroy\":\"Lead Destroy\",\"leads-add\":\"Leads Add\",\"delete-tabledata\":\"Delete Table Data\",\"lead-edit-tabledata\":\"Lead Edit Table Data\"},\"Campaign\":{\"campaign-index\":\"Campaign List\",\"campaign-create\":\"Create a Campaign\",\"promotion-index\":\"Promotion List\",\"promotion-create\":\"Create Promotion\",\"campaign-lead-upload-file\":\"Campaign Lead Upload File\",\"campaign-show\":\"Campaign Show\",\"campaign-edit\":\"Campaign Edit\",\"campaign-destroy\":\"Campaign Destroy\",\"campaign-lead-upload\":\"Campaign Lead Upload\",\"campaign-data\":\"Campaign Data\",\"promotion-show\":\"Promotion Show\",\"promotion-edit\":\"Promotion Edit\",\"promotion-destroy\":\"Promotion Destroy\"},\"Email_Module\":{\"send-email\":\"Send an Email\",\"send-email-list\":\"Emails\",\"email-template\":\"Email Templates\",\"email-template-create\":\"Create Template\",\"send-bulk-email\":\"Bulk Upload\",\"email-template-edit\":\"Email Template Edit\",\"email-template-show\":\"Email Template Show\",\"email-template-delete\":\"Email Template Delete\"},\"SMS_Module\":{\"send-sms-list\":\"SMS List\",\"send-sms\":\"Send SMS\",\"sms-template\":\"SMS Templates\",\"sms-template-create\":\"Create SMS Template\",\"send-bulk-sms\":\"Send Bulk SMS\",\"sms-template-edit\":\"Sms Template Edit\",\"sms-template-show\":\"Sms Template Show\",\"sms-template-delete\":\"Sms Template Delete\"},\"Tasks\":{\"task-list\":\"Task List\",\"add-task\":\"Add Task\",\"delete-task\":\"Task Delete\"},\"Customers\":{\"customers\":\"Customer List\",\"add-customer\":\"Add Customer\"},\"Invoice\":{\"invoice-create\":\"Create Invoice\",\"invoice-index\":\"Invoice List\"},\"Employees\":{\"employee-list\":\"Employee List\",\"add-employee\":\"Add Employee\",\"employee-store\":\"Employee Store\",\"employee-edit\":\"Employee Edit\",\"employee-update\":\"Employee Update\",\"employee-delete\":\"Employee Delete\"},\"Organization_Structure\":{\"branches\":\"Branches\",\"departments\":\"Departments\",\"designations\":\"Designations\",\"shifts\":\"Shifts\",\"attendance-policies\":\"Attendance Policies\",\"document-types\":\"Document Types\",\"organization.index\":\"Organization List\",\"organization.create\":\"Organization Create\",\"organization.store\":\"Organization Store\",\"organization.edit\":\"Organization Edit\",\"organization.update\":\"Organization Update\",\"organization.destroy\":\"Organization Delete\",\"holidays\":\"Holidays\",\"announcements\":\"Announcements\",\"award-types\":\"Award Types\"}}', '{\"Leads_Form\":[\"9\",\"10\",\"11\",\"12\",\"62\",\"63\",\"65\",\"67\",\"70\",\"71\"],\"Lead_Management\":[\"13\",\"14\",\"36\",\"76\",\"77\",\"80\",\"82\",\"84\",\"85\"],\"Campaign\":[\"15\",\"16\",\"17\",\"18\",\"91\",\"93\",\"94\",\"96\",\"100\",\"101\",\"113\",\"114\",\"178\"],\"Email_Module\":[\"19\",\"20\",\"21\",\"22\",\"35\",\"151\",\"152\",\"154\"],\"SMS_Module\":[\"23\",\"24\",\"25\",\"26\",\"28\",\"174\",\"159\",\"160\",\"163\"],\"Tasks\":[\"47\",\"48\",\"168\"],\"Products\":[\"50\",\"51\",\"170\",\"171\",\"172\",\"204\",\"205\"],\"Customers\":[\"189\",\"201\"],\"Invoice\":[\"187\",\"186\"]}', 1, '2024-06-01 22:47:22', '2026-08-12 07:28:43'),
(26, 'root-user', 'root-user', '{\"Employees\":{\"employee-list\":\"Employee List\",\"add-employee\":\"Add Employee\"},\"Customers\":{\"customers\":\"Customer List\"},\"Invoice\":{\"invoice-create\":\"Create Invoice\",\"invoice-index\":\"Invoice List\"},\"Sliders\":{\"slider-list\":\"Slider List\",\"slider-create\":\"Craete Slider\"},\"Blog\":{\"blogger-category-list\":\"Blog Category List\",\"blog-list\":\"Blog List\"},\"Brands\":{\"brand-list\":\"Brand List\",\"brand-create\":\"Create Brand\"},\"Orders\":{\"orders-index\":\"Order List\"},\"Menu_Category\":{\"category-list\":\"Category List\",\"category-create\":\"Create Category\"},\"Settings\":{\"app-settings\":\"App Settings\"},\"Organization_Structure\":{\"branches\":\"Branches\",\"departments\":\"Departments\",\"designations\":\"Designations\",\"holidays\":\"Holidays\",\"announcements\":\"Announcements\",\"award-types\":\"Award Types\",\"document-types\":\"Document Types\"}}', '{\"Products\":{\"product-show\":\"Product Show\"},\"Customers\":{\"customers\":\"Customer List\",\"add-customer\":\"Add Customer\"},\"Invoice\":{\"invoice-create\":\"Create Invoice\",\"invoice-index\":\"Invoice List\",\"invoice-show\":\"Invoice Show\",\"invoice-edit\":\"invoice edit\"},\"Sliders\":{\"slider-list\":\"Slider List\",\"slider-create\":\"Craete Slider\",\"slider-edit\":\"Edit Slider\",\"slider-show\":\"Show Slider\"},\"Blog\":{\"blogger-category-list\":\"Blog Category List\",\"blog-list\":\"Blog List\"},\"Brands\":{\"brand-list\":\"Brand List\",\"brand-create\":\"Create Brand\"},\"Orders\":{\"orders-index\":\"Order List\"},\"Menu_Category\":{\"category-list\":\"Category List\",\"category-create\":\"Create Category\"},\"Settings\":{\"app-settings\":\"App Settings\"},\"Employees\":{\"employee-list\":\"Employee List\",\"add-employee\":\"Add Employee\",\"employee-delete\":\"Employee Delete\",\"employee-edit\":\"Employee Edit\"}}', '{\"Products\":[\"50\",\"51\",\"170\",\"171\",\"172\"],\"Customers\":[\"189\",\"201\"],\"Invoice\":[\"187\",\"186\",\"202\",\"203\"],\"Sliders\":[\"207\",\"208\",\"209\",\"210\"],\"Blog\":[\"212\",\"213\"],\"Brands\":[\"215\",\"216\"],\"Orders\":[\"218\"],\"Menu_Category\":[\"220\",\"221\"],\"Settings\":[\"223\"]}', 1, '2026-06-27 10:37:04', '2026-08-12 07:46:05'),
(25, 'New Super Admin', 'new_super_admin', '{\"Agents\":{\"agents-index\":\"Agent List\",\"agents-create\":\"Create Agent\"},\"Employees\":{\"employee-list\":\"Employee List\",\"add-employee\":\"Add Employee\"},\"User_Management\":{\"users.index\":\"User List\",\"create-user\":\"Create User\",\"profile-edit\":\"Profile Edit\",\"permission.index\":\"Permissions\",\"create-permission\":\"Create Permission\",\"role-list\":\"Roles\",\"role-create\":\"Create Role\"},\"Customers\":{\"log-list\":\"Logs Data\",\"customers\":\"Customer List\"},\"Sliders\":{\"slider-list\":\"Slider List\",\"slider-create\":\"Craete Slider\"},\"Blog\":{\"blogger-category-list\":\"Blog Category List\",\"blog-list\":\"Blog List\"},\"Brands\":{\"brand-list\":\"Brand List\",\"brand-create\":\"Create Brand\"},\"Orders\":{\"orders-index\":\"Order List\"},\"Menu_Category\":{\"category-list\":\"Category List\",\"category-create\":\"Create Category\"},\"Settings\":{\"app-settings\":\"App Settings\"},\"Organization_Structure\":{\"branches\":\"Branches\",\"departments\":\"Departments\",\"designations\":\"Designations\",\"holidays\":\"Holidays\",\"announcements\":\"Announcements\",\"award-types\":\"Award Types\",\"document-types\":\"Document Types\"}}', '{\"Agents\":{\"agents-index\":\"Agent List\",\"agents-create\":\"Create Agent\",\"agents-edit\":\"Agents Edit\",\"agents-show\":\"Agents Show\",\"agents-destroy\":\"Agents Destroy\"},\"Products\":{\"product-show\":\"Product Show\"},\"User_Management\":{\"users.index\":\"User List\",\"user.show\":\"User Show\",\"create-user\":\"Create User\",\"user.edit\":\"User Edit\",\"user.destroy\":\"User Destroy\",\"profile-edit\":\"Profile Edit\",\"show\":\"User Details\",\"profile-update\":\"Profile Update\",\"update-profile-image\":\"Update Profile Image\",\"permission.index\":\"Permissions\",\"permission.show\":\"Permission Show\",\"create-permission\":\"Create Permission\",\"permission.edit\":\"Permission Edit\",\"permission_show\":\"Permission Show\",\"permission.destroy\":\"Permission Destroy\",\"role-list\":\"Roles\",\"role.show\":\"Role Show\",\"role-create\":\"Create Role\",\"role-edit\":\"Role Edit\",\"role-destroy\":\"Role Destroy\"},\"Customers\":{\"log-list\":\"Logs Data\",\"customers\":\"Customer List\",\"add-customer\":\"Add Customer\"},\"Sliders\":{\"slider-list\":\"Slider List\",\"slider-create\":\"Craete Slider\",\"slider-edit\":\"Edit Slider\",\"slider-show\":\"Show Slider\"},\"Blog\":{\"blogger-category-list\":\"Blog Category List\",\"blog-list\":\"Blog List\"},\"Brands\":{\"brand-list\":\"Brand List\",\"brand-create\":\"Create Brand\"},\"Orders\":{\"orders-index\":\"Order List\"},\"Menu_Category\":{\"category-list\":\"Category List\",\"category-create\":\"Create Category\"},\"Settings\":{\"app-settings\":\"App Settings\"},\"Employees\":{\"employee-list\":\"Employee List\",\"add-employee\":\"Add Employee\",\"employee-delete\":\"Employee Delete\",\"employee-edit\":\"Employee Edit\"}}', '{\"Agents\":[\"7\",\"8\",\"57\",\"56\",\"60\"],\"Products\":[\"50\",\"51\",\"170\",\"171\",\"172\"],\"User_Management\":[\"120\",\"121\",\"122\",\"124\",\"126\",\"128\",\"129\",\"130\",\"132\",\"133\",\"134\",\"135\",\"137\",\"139\",\"140\",\"142\",\"143\",\"144\",\"146\",\"148\"],\"Customers\":[\"191\",\"189\",\"201\"],\"Sliders\":[\"207\",\"208\",\"209\",\"210\"],\"Blog\":[\"212\",\"213\"],\"Brands\":[\"215\",\"216\"],\"Orders\":[\"218\"],\"Menu_Category\":[\"220\",\"221\"],\"Settings\":[\"223\"]}', 1, '2024-12-21 15:51:52', '2026-08-12 07:46:05'),
(27, 'modaretor', 'modaretor', '{\"Orders\":{\"orders-index\":\"Order List\"}}', '{\"Orders\":{\"orders-index\":\"Order List\",\"orders-show\":\"Orders Show\"}}', '{\"Orders\":[\"218\",\"326\"]}', 1, '2026-07-29 12:51:14', '2026-07-29 13:57:18');

-- --------------------------------------------------------

--
-- Table structure for table `roles_permissions`
--

CREATE TABLE `roles_permissions` (
  `role_id` char(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `permission_id` char(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `salesman`
--

CREATE TABLE `salesman` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone_number` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `profile_image` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_agent` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `payload` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_activity` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

CREATE TABLE `settings` (
  `id` int NOT NULL,
  `product_contact_address` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `whats_app_chat_link` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `messanger_link` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `facebook_link` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `whats_app_link` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `instagram_link` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `youtube_link` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `twitter_link` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `linkedin_link` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `google_map_link` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `office_phone_number` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone_number_2` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone_number_3` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `about_us` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `contact_address` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `top_header_message` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `return_policy` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `refund_policy` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `terms_and_conditions` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `charge_inside_dhaka` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `charge_outside_dhaka` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `footer_message` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `faq` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `sidebar_image_01` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sidebar_image_02` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `about_us_img` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `site_logo` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL,
  `fraud_checker_base_url` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fraud_checker_api_key` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `steadfast_base_url` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `steadfast_api_key` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `steadfast_secret_key` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `steadfast_bearer_token` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `steadfast_active` tinyint(1) NOT NULL DEFAULT '0',
  `app_promo_image` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `app_promo_link` varchar(2048) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `app_promo_enabled` tinyint(1) NOT NULL DEFAULT '1',
  `myr_to_bdt_rate` decimal(12,4) NOT NULL DEFAULT '30.2300',
  `favicon` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tiktok_link` varchar(2048) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pinterest_link` varchar(2048) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `size_guide` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `privacy_policy` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `cookie_policy` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `meta_pixel_code` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `gtm_head_code` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `gtm_footer_code` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `google_analytics_code` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `custom_header_code` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `custom_footer_code` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`id`, `product_contact_address`, `whats_app_chat_link`, `messanger_link`, `facebook_link`, `whats_app_link`, `instagram_link`, `youtube_link`, `twitter_link`, `linkedin_link`, `google_map_link`, `office_phone_number`, `phone_number_2`, `phone_number_3`, `about_us`, `contact_address`, `top_header_message`, `return_policy`, `refund_policy`, `terms_and_conditions`, `charge_inside_dhaka`, `charge_outside_dhaka`, `footer_message`, `faq`, `sidebar_image_01`, `sidebar_image_02`, `about_us_img`, `site_logo`, `created_at`, `updated_at`, `fraud_checker_base_url`, `fraud_checker_api_key`, `steadfast_base_url`, `steadfast_api_key`, `steadfast_secret_key`, `steadfast_bearer_token`, `steadfast_active`, `app_promo_image`, `app_promo_link`, `app_promo_enabled`, `myr_to_bdt_rate`, `favicon`, `tiktok_link`, `pinterest_link`, `size_guide`, `privacy_policy`, `cookie_policy`, `meta_pixel_code`, `gtm_head_code`, `gtm_footer_code`, `google_analytics_code`, `custom_header_code`, `custom_footer_code`) VALUES
(1, '<h3 style=\"border: 0px solid rgb(229, 231, 235); --tw-border-spacing-x: 0; --tw-border-spacing-y: 0; --tw-translate-x: 0; --tw-translate-y: 0; --tw-rotate: 0; --tw-skew-x: 0; --tw-skew-y: 0; --tw-scale-x: 1; --tw-scale-y: 1; --tw-scroll-snap-strictness: proximity; --tw-ring-offset-width: 0px; --tw-ring-offset-color: #fff; --tw-ring-color: rgba(59,130,246,.5019607843137255); --tw-ring-offset-shadow: 0 0 transparent; --tw-ring-shadow: 0 0 transparent; --tw-shadow: 0 0 transparent; --tw-shadow-colored: 0 0 transparent; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); font-size: 1.25em; margin-top: 1em; margin-bottom: 0.85em; font-family: &quot;Basic Commercial&quot;, sans-serif; color: var(--color-heading-text); line-height: 1.6;\"><span style=\"border: 0px solid rgb(229, 231, 235); --tw-border-spacing-x: 0; --tw-border-spacing-y: 0; --tw-translate-x: 0; --tw-translate-y: 0; --tw-rotate: 0; --tw-skew-x: 0; --tw-skew-y: 0; --tw-scale-x: 1; --tw-scale-y: 1; --tw-scroll-snap-strictness: proximity; --tw-ring-offset-width: 0px; --tw-ring-offset-color: #fff; --tw-ring-color: rgba(59,130,246,.5019607843137255); --tw-ring-offset-shadow: 0 0 transparent; --tw-ring-shadow: 0 0 transparent; --tw-shadow: 0 0 transparent; --tw-shadow-colored: 0 0 transparent; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); color: currentcolor;\">আমাদের যে কোন পণ্য অর্ডার করতে কল বা WhatsApp করুন:</span><a href=\"tel:+8801321208940\" style=\"border: 0px solid rgb(229, 231, 235); --tw-border-spacing-x: 0; --tw-border-spacing-y: 0; --tw-translate-x: 0; --tw-translate-y: 0; --tw-rotate: 0; --tw-skew-x: 0; --tw-skew-y: 0; --tw-scale-x: 1; --tw-scale-y: 1; --tw-scroll-snap-strictness: proximity; --tw-ring-offset-width: 0px; --tw-ring-offset-color: #fff; --tw-ring-color: rgba(59,130,246,.5019607843137255); --tw-ring-offset-shadow: 0 0 transparent; --tw-ring-shadow: 0 0 transparent; --tw-shadow: 0 0 transparent; --tw-shadow-colored: 0 0 transparent; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); color: var(--tw-prose-links); text-decoration-line: underline; cursor: pointer; font-weight: 500;\"><br style=\"border: 0px solid rgb(229, 231, 235); --tw-border-spacing-x: 0; --tw-border-spacing-y: 0; --tw-translate-x: 0; --tw-translate-y: 0; --tw-rotate: 0; --tw-skew-x: 0; --tw-skew-y: 0; --tw-scale-x: 1; --tw-scale-y: 1; --tw-scroll-snap-strictness: proximity; --tw-ring-offset-width: 0px; --tw-ring-offset-color: #fff; --tw-ring-color: rgba(59,130,246,.5019607843137255); --tw-ring-offset-shadow: 0 0 transparent; --tw-ring-shadow: 0 0 transparent; --tw-shadow: 0 0 transparent; --tw-shadow-colored: 0 0 transparent; -webkit-tap-highlight-color: rgba(0, 0, 0, 0);\">+8801321208940</a><a href=\"tel:09642-922922\" style=\"border: 0px solid rgb(229, 231, 235); --tw-border-spacing-x: 0; --tw-border-spacing-y: 0; --tw-translate-x: 0; --tw-translate-y: 0; --tw-rotate: 0; --tw-skew-x: 0; --tw-skew-y: 0; --tw-scale-x: 1; --tw-scale-y: 1; --tw-scroll-snap-strictness: proximity; --tw-ring-offset-width: 0px; --tw-ring-offset-color: #fff; --tw-ring-color: rgba(59,130,246,.5019607843137255); --tw-ring-offset-shadow: 0 0 transparent; --tw-ring-shadow: 0 0 transparent; --tw-shadow: 0 0 transparent; --tw-shadow-colored: 0 0 transparent; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); color: var(--tw-prose-links); text-decoration-line: underline; cursor: pointer; font-weight: 500;\"><br style=\"border: 0px solid rgb(229, 231, 235); --tw-border-spacing-x: 0; --tw-border-spacing-y: 0; --tw-translate-x: 0; --tw-translate-y: 0; --tw-rotate: 0; --tw-skew-x: 0; --tw-skew-y: 0; --tw-scale-x: 1; --tw-scale-y: 1; --tw-scroll-snap-strictness: proximity; --tw-ring-offset-width: 0px; --tw-ring-offset-color: #fff; --tw-ring-color: rgba(59,130,246,.5019607843137255); --tw-ring-offset-shadow: 0 0 transparent; --tw-ring-shadow: 0 0 transparent; --tw-shadow: 0 0 transparent; --tw-shadow-colored: 0 0 transparent; -webkit-tap-highlight-color: rgba(0, 0, 0, 0);\">হট লাইন: 09642-922922</a></h3>', 'https://wa.me/8801776060286', NULL, 'https://www.facebook.com/share/18N8DNypLY/', 'https://wa.me/8801776060286?text=Hi%20there!%20Welcome%20to%20Loyal%20Home%20Appliance%20chat', 'https://www.instagram.com/loyalhomeappliance?utm_source=qr&igsh=MTU2amhqaWp0bjBseQ==', NULL, NULL, NULL, NULL, '01776060286', '01719080239', NULL, '<div class=\"tpabout__inner-story mb-40\" style=\"padding-right:30px;border-right: 1px solid #ddd;\">\r\n                        <p dir=\"ltr\"><b>Welcome to Loyal Home Appliance</b></p><p dir=\"ltr\">​At <b>Loyal Home Appliance</b>, we believe that the kitchen is the heart of a home, and a high-quality gas stove is the pulse that keeps it beating. We are committed to bringing innovation, safety, and durability into every kitchen in Bangladesh.</p><p dir=\"ltr\">​We take pride in our direct-import and manufacturing model. By sourcing premium parts directly from China and assembling them in our own factory using top-grade steel and toughened glass, we ensure that every <b>Loyal Gas Stove</b> meets the highest standards of performance and safety.</p><p dir=\"ltr\">​<b>Why Choose Us?</b></p><ul>\r\n<li dir=\"ltr\">​<b>Factory-Direct Quality:</b> By controlling the manufacturing process, we deliver superior products at competitive, wholesale prices.</li>\r\n<li dir=\"ltr\">​<b>Safety First:</b> Our stoves are engineered with advanced technology to ensure secure and efficient cooking experiences.</li>\r\n<li dir=\"ltr\">​<b>Reliability:</b> We are building our reputation on trust, durability, and a commitment to helping families cook with ease.</li>\r\n</ul><p dir=\"ltr\">​At <b>Loyal Home Appliance</b>, we don\'t just sell products; we provide reliable kitchen solutions that stand the test of time.</p><p dir=\"ltr\">​<b>বাংলা সংস্করণ</b></p><p dir=\"ltr\">​<b>Loyal Home Appliance-এ আপনাকে স্বাগতম</b></p><p dir=\"ltr\">​<b>Loyal Home Appliance</b>-এ আমরা বিশ্বাস করি, রান্নাঘর হলো একটি বাড়ির প্রাণকেন্দ্র, আর একটি মানসম্মত গ্যাস স্টোভ বা চুলা হলো সেই প্রাণের স্পন্দন। আমরা প্রতিটি বাংলাদেশী রান্নাঘরে আধুনিক প্রযুক্তি, নিরাপত্তা এবং স্থায়িত্ব পৌঁছে দিতে প্রতিশ্রুতিবদ্ধ।</p><p dir=\"ltr\">​আমরা সরাসরি চায়না থেকে মানসম্মত পার্টস আমদানি করি এবং আমাদের নিজস্ব ফ্যাক্টরিতে প্রিমিয়াম স্টিল ও উন্নতমানের গ্লাস ব্যবহার করে অত্যন্ত যত্নসহকারে চুলা তৈরি করি। এভাবেই আমরা প্রতিটি <b>Loyal Gas Stove</b>-এর গুণমান ও নিরাপত্তা নিশ্চিত করি।</p><p dir=\"ltr\">​<b>কেন আমাদের বেছে নেবেন?</b></p><ul>\r\n<li dir=\"ltr\">​<b>সরাসরি ফ্যাক্টরি থেকে:</b> উৎপাদন প্রক্রিয়ার প্রতিটি ধাপ আমাদের নিয়ন্ত্রণে থাকায়, আমরা সাশ্রয়ী পাইকারি মূল্যে সেরা পণ্যটি আপনার কাছে পৌঁছে দিতে পারি।</li>\r\n<li dir=\"ltr\">​<b>নিরাপত্তাই প্রধান:</b> আমাদের চুলাগুলো অত্যাধুনিক প্রযুক্তিতে তৈরি, যা রান্নার সময় সর্বোচ্চ নিরাপত্তা ও কর্মদক্ষতা নিশ্চিত করে।</li>\r\n<li dir=\"ltr\">​<b>নির্ভরযোগ্যতা:</b> আমাদের প্রতিটি পণ্য দীর্ঘস্থায়ী স্থায়িত্বের নিশ্চয়তা দেয়, যা আপনার দৈনন্দিন জীবনকে করে তোলে সহজ ও নিশ্চিন্ত।</li>\r\n</ul><p dir=\"ltr\">​<b>Loyal Home Appliance</b>-এ আমরা কেবল পণ্য বিক্রি করি না, বরং রান্নাঘরের জন্য এমন টেকসই সলিউশন প্রদান করি যা বছরের পর বছর আপনার আস্থা বজায় রাখবে।</p>\r\n                     </div><p></p>', '<p>Manikdia, Shobujbag Dhaka.</p><p>Hot Line: </p><p><b>+8801776060286</b></p><p><b> +8801719080239</b></p>', 'আমাদের যে কোন পণ্য অর্ডার করতে কল বা WhatsApp করুন:  +8801789944503 | হট লাইন: 01926-313321', '<div class=\"tpabout__inner-title-area mt-25 mb-45\">\r\n                        <h4 class=\"tpabout__inner-sub-title\">Policies</h4>\r\n                        <h4 class=\"tpabout__inner-title\">Return and Refund policy</h4>\r\n                     </div>\r\n\r\n                     \r\n                        <p>\r\n                           If you are not satisfied with your purchase \r\nproducts, You may return the items in the new condition that they were \r\nreceived by you in their original packaging within 24 hours of receiving\r\n the items. You must notify the return issue within 12 hours over \r\nWhatsApp/ Facebook / Email / Call with reason. We will contact you to \r\nreturn the parcel after confirmation by you.\r\n\r\n                        </p>\r\n                        <p style=\"margin-top: 60px;padding-left:10px !important;\">\r\n                           </p><ul><li>You must contact us within 12 hours of receiving the items.</li><li>You must show the \"Carclinic\" money reciept that you have received.</li><li>In the case that there are missing, \r\ndamaged, or incorrect packages, please retain the item, indicate the \r\nproblem on the Delivery Note.</li><li>We request for you to WhatsApp or \r\nemail pictures of damaged or defective items and also the packaging \r\nboxes, So we can understand how the damage happened and prevent future \r\nitems from similar damages.</li><li>For minor damages, We may send repair parts to you and ask you to repair the damages.</li><li>Damage that makes by the customer will not return. </li><li>Your refund will be issued after we received and inspected the items.</li><li>For the items that shipped free, We will deduct the original shipping charges from your refund.</li></ul>', NULL, '<p dir=\"ltr\"><b>THE OBJECT OF THE TERMS AND THE GENERAL CONDITIONS:</b></p><p dir=\"ltr\">The e-shop with the address [<a href=\"https://www.yourwebsite.com\">www.loyalhomeappliance.com</a>] is managed and operated by <b>Loyal Home Appliance</b>, , located at [Manikdia, Shobujbag, Dhaka, Bangladesh]. Email: [loyalhomeappliance@gmail.com], Telephone: [+8801776060286].</p><p dir=\"ltr\">​These terms regulate the legal relationship between <b>Loyal Home Appliance</b> (the Seller) and the user (the Buyer). As a direct importer of high-quality components from China and&nbsp; professional assembler of auto gas stoves (Steel &amp; Glass), we strive to provide the best products. Our services include the sale and distribution of these appliances. By using this website, the Buyer confirms their agreement to these terms. If you do not agree, please refrain from using our services.</p><p dir=\"ltr\">​<b>PARTIES TO THE TRANSACTION:</b></p><p dir=\"ltr\">A Buyer must be an adult (at least 18 years old) or a legal entity. By placing an order, the Buyer confirms that they have read and understood these terms.</p><p dir=\"ltr\">​<b>PRODUCT INFORMATION &amp; MANUFACTURING:</b></p><ol>\r\n<li dir=\"ltr\">​<b>Quality &amp; Assembly:</b> Loyal Home Appliance imports components directly from China and performs professional assembly in Bangladesh. Please note that product photos are illustrative; slight variations may occur due to the assembly process or design updates.</li>\r\n<li dir=\"ltr\">​<b>Pricing:</b> All prices are in BDT. The Seller reserves the right to change prices at any time without prior notice.</li>\r\n<li dir=\"ltr\">​<b>Wholesale Policy:</b> As we are primarily a wholesale supplier, bulk order terms may differ. Please contact our sales team for specific wholesale pricing and shipping arrangements.</li>\r\n</ol><p dir=\"ltr\">​<b>ORDERING AND CONTRACT:</b></p><ol>\r\n<li dir=\"ltr\">​To purchase, the Buyer must add items to the cart and proceed to checkout.</li>\r\n<li dir=\"ltr\">​The Buyer is responsible for providing accurate shipping and contact information.</li>\r\n<li dir=\"ltr\">​The Seller reserves the right to cancel orders if payments are not completed or if technical errors occur in pricing/stock information.</li>\r\n</ol><p dir=\"ltr\">​<b>PRIVACY POLICY:</b></p><p dir=\"ltr\">We prioritize the security of your personal data. We collect only the information necessary to process your orders. We do not disclose your personal information to third parties without your consent, except as required by law.</p><h2 dir=\"ltr\">​শর্তাবলি (বাংলা)</h2><p dir=\"ltr\">​<b>শর্তাবলির উদ্দেশ্য:</b></p><p dir=\"ltr\">[<a href=\"https://www.yourwebsite.com\">www.loyalhomeappliance.com</a>] ওয়েবসাইটটি <b>Loyal Home Appliance</b> দ্বারা পরিচালিত। আমাদের ঠিকানা: [মানিকদিয়া সবুজবাগ,ঢাকা বাংলাদেশ ],&nbsp; ইমেইল: [loyalhomeappliance@gmail.com], ফোন: [+8801776060286]।</p><p dir=\"ltr\">​এই শর্তাবলি <b>Loyal Home Appliance</b> (বিক্রেতা) এবং ব্যবহারকারী (ক্রেতা)-এর মধ্যকার আইনি সম্পর্ক নিয়ন্ত্রণ করে। আমরা চীন থেকে উচ্চমানের পার্টস আমদানি করে বাংলাদেশে অটোগ্যাস স্টোভ (স্টিল ও গ্লাস) অ্যাসেম্বল বা ফিটিং করে থাকি। আমাদের এই ওয়েবসাইট ব্যবহারের মাধ্যমে ক্রেতা এই শর্তাবলির সাথে একমত পোষণ করছেন। আপনি যদি এই শর্তাবলিতে সম্মত না হন, তবে দয়া করে আমাদের পরিষেবা ব্যবহার করা থেকে বিরত থাকুন।</p><p dir=\"ltr\">​<b>লেনদেনের পক্ষসমূহ:</b></p><p dir=\"ltr\">ক্রেতাকে অবশ্যই প্রাপ্তবয়স্ক (ন্যূনতম ১৮ বছর) অথবা একটি বৈধ আইনি সত্তা হতে হবে। অর্ডার দেওয়ার মাধ্যমে ক্রেতা নিশ্চিত করছেন যে তিনি এই শর্তাবলি পড়েছেন এবং বুঝেছেন।</p><p dir=\"ltr\">​<b>পণ্য সংক্রান্ত তথ্য ও সংযোজন:</b></p><p dir=\"ltr\">১. <b>মান ও সংযোজন:</b> Loyal Home Appliance সরাসরি চীন থেকে পার্টস আমদানি করে আমাদের কারখানায় পেশাদারভাবে ফিটিং বা অ্যাসেম্বল করে। ওয়েবসাইটের পণ্যের ছবিগুলো নির্দেশনামূলক; অ্যাসেম্বল বা ডিজাইনের পরিবর্তনের কারণে বাস্তবে সামান্য পার্থক্য থাকতে পারে।</p><p dir=\"ltr\">২. <b>মূল্য:</b> সকল পণ্যের মূল্য বিডিটি (BDT)-তে নির্ধারিত। বিক্রেতা কোনো পূর্ব ঘোষণা ছাড়াই যেকোনো সময় মূল্য পরিবর্তন করার অধিকার সংরক্ষণ করেন।</p><p dir=\"ltr\">৩. <b>পাইকারি নীতি:</b> যেহেতু আমরা পাইকারি বিক্রেতা, তাই পাইকারি অর্ডারের ক্ষেত্রে আলাদা শর্ত প্রযোজ্য হতে পারে। বিশেষ পাইকারি মূল্য এবং ডেলিভারি ব্যবস্থার জন্য আমাদের সেলস টিমের সাথে যোগাযোগ করুন।</p><p dir=\"ltr\">​<b>অর্ডার ও বিক্রয় চুক্তি:</b></p><p dir=\"ltr\">১. পণ্য কেনার জন্য ক্রেতাকে অবশ্যই ব্যাংকে অথবা ক্যাশে আইটেম যোগ করে চেকআউট সম্পন্ন করতে হবে।</p><p dir=\"ltr\">২. ক্রেতা তার সঠিক ডেলিভারি ঠিকানা এবং যোগাযোগের তথ্য প্রদান করতে বাধ্য।</p><p dir=\"ltr\">৩. পেমেন্ট সম্পন্ন না হলে বা ওয়েবসাইটের কারিগরি ত্রুটির কারণে মূল্য বা স্টক সংক্রান্ত ভুল দেখা দিলে বিক্রেতা অর্ডার বাতিল করার অধিকার রাখেন।</p><p dir=\"ltr\">​<b>গোপনীয়তা নীতি (Privacy Policy):</b></p><p style=\"margin-right: -25px; margin-bottom: 0px; color: var(--tp-text-secondary); font-family: Jost, sans-serif; font-size: 18px; line-height: 26px; transition: 0.3s ease-out;\">\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n</p><p dir=\"ltr\">আমরা আপনার ব্যক্তিগত তথ্যের নিরাপত্তাকে সর্বোচ্চ গুরুত্ব দেই। অর্ডার প্রসেস করার জন্য প্রয়োজনীয় তথ্য ছাড়া আমরা কোনো ব্যক্তিগত তথ্য সংগ্রহ করি না এবং আইনত বাধ্য না হলে কোনো তৃতীয় পক্ষের কাছে তা প্রকাশ করি না।</p>', '70', '120', '<p>Febric Studio is a largest ecommerce clothing shop</p>', '<div class=\"elementor-column elementor-col-50 elementor-top-column elementor-element elementor-element-b81656f\" data-id=\"b81656f\" data-element_type=\"column\"><div class=\"elementor-widget-wrap elementor-element-populated\"><div class=\"elementor-element elementor-element-d259d2a elementor-widget elementor-widget-text-editor\" data-id=\"d259d2a\" data-element_type=\"widget\" data-widget_type=\"text-editor.default\"><div class=\"elementor-widget-container\"><div class=\"section__header text-center\" style=\"border: 0px solid rgb(229, 231, 235); --tw-border-spacing-x: 0; --tw-border-spacing-y: 0; --tw-translate-x: 0; --tw-translate-y: 0; --tw-rotate: 0; --tw-skew-x: 0; --tw-skew-y: 0; --tw-scale-x: 1; --tw-scale-y: 1; --tw-scroll-snap-strictness: proximity; --tw-ring-offset-width: 0px; --tw-ring-offset-color: #fff; --tw-ring-color: rgba(59,130,246,.5019607843137255); --tw-ring-offset-shadow: 0 0 transparent; --tw-ring-shadow: 0 0 transparent; --tw-shadow: 0 0 transparent; --tw-shadow-colored: 0 0 transparent; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); margin-bottom: 50px; padding-left: 1.25rem; padding-right: 1.25rem; color: rgb(0, 0, 0); font-family: &quot;Basic Commercial&quot;, sans-serif; font-size: 16px;\"><h2 class=\"section__heading\" style=\"border: 0px solid rgb(229, 231, 235); --tw-border-spacing-x: 0; --tw-border-spacing-y: 0; --tw-translate-x: 0; --tw-translate-y: 0; --tw-rotate: 0; --tw-skew-x: 0; --tw-skew-y: 0; --tw-scale-x: 1; --tw-scale-y: 1; --tw-scroll-snap-strictness: proximity; --tw-ring-offset-width: 0px; --tw-ring-offset-color: #fff; --tw-ring-color: rgba(59,130,246,.5019607843137255); --tw-ring-offset-shadow: 0 0 transparent; --tw-ring-shadow: 0 0 transparent; --tw-shadow: 0 0 transparent; --tw-shadow-colored: 0 0 transparent; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); font-weight: var(--font-weight-header); margin-bottom: 0px; letter-spacing: 0px; font-family: var(--font-stack-header); font-style: var(--font-style-header); color: var(--color-heading-text); font-size: 34px !important; line-height: 44px !important;\">Frequently Asked Questions</h2></div><div class=\"prod__accordion\" style=\"border: 0px solid rgb(229, 231, 235); --tw-border-spacing-x: 0; --tw-border-spacing-y: 0; --tw-translate-x: 0; --tw-translate-y: 0; --tw-rotate: 0; --tw-skew-x: 0; --tw-skew-y: 0; --tw-scale-x: 1; --tw-scale-y: 1; --tw-scroll-snap-strictness: proximity; --tw-ring-offset-width: 0px; --tw-ring-offset-color: #fff; --tw-ring-color: rgba(59,130,246,.5019607843137255); --tw-ring-offset-shadow: 0 0 transparent; --tw-ring-shadow: 0 0 transparent; --tw-shadow: 0 0 transparent; --tw-shadow-colored: 0 0 transparent; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); color: rgb(0, 0, 0); font-family: &quot;Basic Commercial&quot;, sans-serif; font-size: 16px;\"><collapsible-tab class=\"collapsible__item no-js-hidden is-expanded\" data-block-id=\"collapsible-tab-item_AqVqVb\" open=\"true\" style=\"border: 0px solid rgb(229, 231, 235); --tw-border-spacing-x: 0; --tw-border-spacing-y: 0; --tw-translate-x: 0; --tw-translate-y: 0; --tw-rotate: 0; --tw-skew-x: 0; --tw-skew-y: 0; --tw-scale-x: 1; --tw-scale-y: 1; --tw-scroll-snap-strictness: proximity; --tw-ring-offset-width: 0px; --tw-ring-offset-color: #fff; --tw-ring-color: rgba(59,130,246,.5019607843137255); --tw-ring-offset-shadow: 0 0 transparent; --tw-ring-shadow: 0 0 transparent; --tw-shadow: 0 0 transparent; --tw-shadow-colored: 0 0 transparent; -webkit-tap-highlight-color: rgba(0, 0, 0, 0);\"><h3 class=\"collapsible__button lg:text-[18px] py-4 pr-4 border-b border-color-border\" data-trigger=\"\" aria-expanded=\"true\" style=\"border-width: 0px 0px 1px; border-style: solid; border-color: rgb(0, 0, 0); border-image: initial; --tw-border-spacing-x: 0; --tw-border-spacing-y: 0; --tw-translate-x: 0; --tw-translate-y: 0; --tw-rotate: 0; --tw-skew-x: 0; --tw-skew-y: 0; --tw-scale-x: 1; --tw-scale-y: 1; --tw-scroll-snap-strictness: proximity; --tw-ring-offset-width: 0px; --tw-ring-offset-color: #fff; --tw-ring-color: rgba(59,130,246,.5019607843137255); --tw-ring-offset-shadow: 0 0 transparent; --tw-ring-shadow: 0 0 transparent; --tw-shadow: 0 0 transparent; --tw-shadow-colored: 0 0 transparent; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); font-size: 18px; font-weight: 500; margin-bottom: 0px; letter-spacing: 0px; font-family: var(--font-stack-header); font-style: var(--font-style-header); color: var(--color-heading-text); line-height: normal; padding-right: 2rem; display: flex; user-select: none; width: 708px; cursor: pointer; position: relative;\"><span style=\"border: 0px solid rgb(229, 231, 235); --tw-border-spacing-x: 0; --tw-border-spacing-y: 0; --tw-translate-x: 0; --tw-translate-y: 0; --tw-rotate: 0; --tw-skew-x: 0; --tw-skew-y: 0; --tw-scale-x: 1; --tw-scale-y: 1; --tw-scroll-snap-strictness: proximity; --tw-ring-offset-width: 0px; --tw-ring-offset-color: #fff; --tw-ring-color: rgba(59,130,246,.5019607843137255); --tw-ring-offset-shadow: 0 0 transparent; --tw-ring-shadow: 0 0 transparent; --tw-shadow: 0 0 transparent; --tw-shadow-colored: 0 0 transparent; -webkit-tap-highlight-color: rgba(0, 0, 0, 0);\">অর্ডার পেতে আমার কতক্ষণ সময় লাগবে ?</span></h3><div class=\"collapsible__content\" data-content=\"\" aria-hidden=\"false\" style=\"border: 0px solid rgb(229, 231, 235); --tw-border-spacing-x: 0; --tw-border-spacing-y: 0; --tw-translate-x: 0; --tw-translate-y: 0; --tw-rotate: 0; --tw-skew-x: 0; --tw-skew-y: 0; --tw-scale-x: 1; --tw-scale-y: 1; --tw-scroll-snap-strictness: proximity; --tw-ring-offset-width: 0px; --tw-ring-offset-color: #fff; --tw-ring-color: rgba(59,130,246,.5019607843137255); --tw-ring-offset-shadow: 0 0 transparent; --tw-ring-shadow: 0 0 transparent; --tw-shadow: 0 0 transparent; --tw-shadow-colored: 0 0 transparent; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); height: auto; overflow: hidden; transition: height 0.35s; will-change: height;\"><div class=\"collapsible__content-inner pt-5 pb-10 prose\" style=\"border: 0px solid rgb(229, 231, 235); --tw-border-spacing-x: 0; --tw-border-spacing-y: 0; --tw-translate-x: 0; --tw-translate-y: 0; --tw-rotate: 0; --tw-skew-x: 0; --tw-skew-y: 0; --tw-scale-x: 1; --tw-scale-y: 1; --tw-scroll-snap-strictness: proximity; --tw-ring-offset-width: 0px; --tw-ring-offset-color: #fff; --tw-ring-color: rgba(59,130,246,.5019607843137255); --tw-ring-offset-shadow: 0 0 transparent; --tw-ring-shadow: 0 0 transparent; --tw-shadow: 0 0 transparent; --tw-shadow-colored: 0 0 transparent; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); color: var(--color-body-text,#000); max-width: 100%; --tw-prose-body: #374151; --tw-prose-headings: #111827; --tw-prose-lead: #4b5563; --tw-prose-links: #111827; --tw-prose-bold: #111827; --tw-prose-counters: #6b7280; --tw-prose-bullets: #d1d5db; --tw-prose-hr: #e5e7eb; --tw-prose-quotes: #111827; --tw-prose-quote-borders: #e5e7eb; --tw-prose-captions: #6b7280; --tw-prose-code: #111827; --tw-prose-pre-code: #e5e7eb; --tw-prose-pre-bg: #1f2937; --tw-prose-th-borders: #d1d5db; --tw-prose-td-borders: #e5e7eb; --tw-prose-invert-body: #d1d5db; --tw-prose-invert-headings: #fff; --tw-prose-invert-lead: #9ca3af; --tw-prose-invert-links: #fff; --tw-prose-invert-bold: #fff; --tw-prose-invert-counters: #9ca3af; --tw-prose-invert-bullets: #4b5563; --tw-prose-invert-hr: #374151; --tw-prose-invert-quotes: #f3f4f6; --tw-prose-invert-quote-borders: #374151; --tw-prose-invert-captions: #9ca3af; --tw-prose-invert-code: #fff; --tw-prose-invert-pre-code: #d1d5db; --tw-prose-invert-pre-bg: rgba(0,0,0,.5019607843137255); --tw-prose-invert-th-borders: #4b5563; --tw-prose-invert-td-borders: #374151; font-size: 1rem; line-height: 1.75; padding-top: 16px; padding-bottom: 16px;\"><p style=\"border: 0px solid rgb(229, 231, 235); --tw-border-spacing-x: 0; --tw-border-spacing-y: 0; --tw-translate-x: 0; --tw-translate-y: 0; --tw-rotate: 0; --tw-skew-x: 0; --tw-skew-y: 0; --tw-scale-x: 1; --tw-scale-y: 1; --tw-scroll-snap-strictness: proximity; --tw-ring-offset-width: 0px; --tw-ring-offset-color: #fff; --tw-ring-color: rgba(59,130,246,.5019607843137255); --tw-ring-offset-shadow: 0 0 transparent; --tw-ring-shadow: 0 0 transparent; --tw-shadow: 0 0 transparent; --tw-shadow-colored: 0 0 transparent; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); margin-top: 0.75em; margin-bottom: 0.75em;\">সাধারণত আমরা প্রি-অর্ডার ব্যাতীত ২ থেকে ৩ দিনের মধ্যে পণ্য সরবাহরহ করি এবং কখনো কোনো অনাকাঙ্ক্ষিত পরিস্থিতি তৈরি হলে আমরা ফোনে গ্রাহকের সাথে যোগাযোগ করে ডেলিভারি এর সময় সম্পর্কে অবগত করি।</p><div class=\"prod__accordion\" style=\"border: 0px solid rgb(229, 231, 235); --tw-border-spacing-x: 0; --tw-border-spacing-y: 0; --tw-translate-x: 0; --tw-translate-y: 0; --tw-rotate: 0; --tw-skew-x: 0; --tw-skew-y: 0; --tw-scale-x: 1; --tw-scale-y: 1; --tw-scroll-snap-strictness: proximity; --tw-ring-offset-width: 0px; --tw-ring-offset-color: #fff; --tw-ring-color: rgba(59,130,246,.5019607843137255); --tw-ring-offset-shadow: 0 0 transparent; --tw-ring-shadow: 0 0 transparent; --tw-shadow: 0 0 transparent; --tw-shadow-colored: 0 0 transparent; -webkit-tap-highlight-color: rgba(0, 0, 0, 0);\"><collapsible-tab class=\"collapsible__item no-js-hidden is-collapsed\" data-block-id=\"collapsible-tab-item_AqVqVb\" style=\"border: 0px solid rgb(229, 231, 235); --tw-border-spacing-x: 0; --tw-border-spacing-y: 0; --tw-translate-x: 0; --tw-translate-y: 0; --tw-rotate: 0; --tw-skew-x: 0; --tw-skew-y: 0; --tw-scale-x: 1; --tw-scale-y: 1; --tw-scroll-snap-strictness: proximity; --tw-ring-offset-width: 0px; --tw-ring-offset-color: #fff; --tw-ring-color: rgba(59,130,246,.5019607843137255); --tw-ring-offset-shadow: 0 0 transparent; --tw-ring-shadow: 0 0 transparent; --tw-shadow: 0 0 transparent; --tw-shadow-colored: 0 0 transparent; -webkit-tap-highlight-color: rgba(0, 0, 0, 0);\"><div class=\"collapsible__content\" data-content=\"\" aria-hidden=\"true\" style=\"border: 0px solid rgb(229, 231, 235); --tw-border-spacing-x: 0; --tw-border-spacing-y: 0; --tw-translate-x: 0; --tw-translate-y: 0; --tw-rotate: 0; --tw-skew-x: 0; --tw-skew-y: 0; --tw-scale-x: 1; --tw-scale-y: 1; --tw-scroll-snap-strictness: proximity; --tw-ring-offset-width: 0px; --tw-ring-offset-color: #fff; --tw-ring-color: rgba(59,130,246,.5019607843137255); --tw-ring-offset-shadow: 0 0 transparent; --tw-ring-shadow: 0 0 transparent; --tw-shadow: 0 0 transparent; --tw-shadow-colored: 0 0 transparent; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); height: 0px; overflow: hidden; transition: height 0.35s; will-change: height;\"><div class=\"collapsible__content-inner pt-5 pb-10 prose\" style=\"border: 0px solid rgb(229, 231, 235); --tw-border-spacing-x: 0; --tw-border-spacing-y: 0; --tw-translate-x: 0; --tw-translate-y: 0; --tw-rotate: 0; --tw-skew-x: 0; --tw-skew-y: 0; --tw-scale-x: 1; --tw-scale-y: 1; --tw-scroll-snap-strictness: proximity; --tw-ring-offset-width: 0px; --tw-ring-offset-color: #fff; --tw-ring-color: rgba(59,130,246,.5019607843137255); --tw-ring-offset-shadow: 0 0 transparent; --tw-ring-shadow: 0 0 transparent; --tw-shadow: 0 0 transparent; --tw-shadow-colored: 0 0 transparent; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); color: var(--color-body-text,#000); max-width: 100%; --tw-prose-body: #374151; --tw-prose-headings: #111827; --tw-prose-lead: #4b5563; --tw-prose-links: #111827; --tw-prose-bold: #111827; --tw-prose-counters: #6b7280; --tw-prose-bullets: #d1d5db; --tw-prose-hr: #e5e7eb; --tw-prose-quotes: #111827; --tw-prose-quote-borders: #e5e7eb; --tw-prose-captions: #6b7280; --tw-prose-code: #111827; --tw-prose-pre-code: #e5e7eb; --tw-prose-pre-bg: #1f2937; --tw-prose-th-borders: #d1d5db; --tw-prose-td-borders: #e5e7eb; --tw-prose-invert-body: #d1d5db; --tw-prose-invert-headings: #fff; --tw-prose-invert-lead: #9ca3af; --tw-prose-invert-links: #fff; --tw-prose-invert-bold: #fff; --tw-prose-invert-counters: #9ca3af; --tw-prose-invert-bullets: #4b5563; --tw-prose-invert-hr: #374151; --tw-prose-invert-quotes: #f3f4f6; --tw-prose-invert-quote-borders: #374151; --tw-prose-invert-captions: #9ca3af; --tw-prose-invert-code: #fff; --tw-prose-invert-pre-code: #d1d5db; --tw-prose-invert-pre-bg: rgba(0,0,0,.5019607843137255); --tw-prose-invert-th-borders: #4b5563; --tw-prose-invert-td-borders: #374151; font-size: 1rem; line-height: 1.75; padding-top: 16px; padding-bottom: 16px;\"><p style=\"border: 0px solid rgb(229, 231, 235); --tw-border-spacing-x: 0; --tw-border-spacing-y: 0; --tw-translate-x: 0; --tw-translate-y: 0; --tw-rotate: 0; --tw-skew-x: 0; --tw-skew-y: 0; --tw-scale-x: 1; --tw-scale-y: 1; --tw-scroll-snap-strictness: proximity; --tw-ring-offset-width: 0px; --tw-ring-offset-color: #fff; --tw-ring-color: rgba(59,130,246,.5019607843137255); --tw-ring-offset-shadow: 0 0 transparent; --tw-ring-shadow: 0 0 transparent; --tw-shadow: 0 0 transparent; --tw-shadow-colored: 0 0 transparent; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); margin-top: 0.75em; margin-bottom: 0.75em;\"></p></div></div></collapsible-tab><collapsible-tab class=\"collapsible__item no-js-hidden is-expanded\" data-block-id=\"collapsible-tab-item_x4NNAW\" open=\"true\" style=\"border: 0px solid rgb(229, 231, 235); --tw-border-spacing-x: 0; --tw-border-spacing-y: 0; --tw-translate-x: 0; --tw-translate-y: 0; --tw-rotate: 0; --tw-skew-x: 0; --tw-skew-y: 0; --tw-scale-x: 1; --tw-scale-y: 1; --tw-scroll-snap-strictness: proximity; --tw-ring-offset-width: 0px; --tw-ring-offset-color: #fff; --tw-ring-color: rgba(59,130,246,.5019607843137255); --tw-ring-offset-shadow: 0 0 transparent; --tw-ring-shadow: 0 0 transparent; --tw-shadow: 0 0 transparent; --tw-shadow-colored: 0 0 transparent; -webkit-tap-highlight-color: rgba(0, 0, 0, 0);\"><h3 class=\"collapsible__button lg:text-[18px] py-4 pr-4 border-b border-color-border\" data-trigger=\"\" aria-expanded=\"true\" style=\"border-width: 0px 0px 1px; border-style: solid; border-color: rgb(0, 0, 0); border-image: initial; --tw-border-spacing-x: 0; --tw-border-spacing-y: 0; --tw-translate-x: 0; --tw-translate-y: 0; --tw-rotate: 0; --tw-skew-x: 0; --tw-skew-y: 0; --tw-scale-x: 1; --tw-scale-y: 1; --tw-scroll-snap-strictness: proximity; --tw-ring-offset-width: 0px; --tw-ring-offset-color: #fff; --tw-ring-color: rgba(59,130,246,.5019607843137255); --tw-ring-offset-shadow: 0 0 transparent; --tw-ring-shadow: 0 0 transparent; --tw-shadow: 0 0 transparent; --tw-shadow-colored: 0 0 transparent; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); font-size: 18px; font-weight: 500; margin-bottom: 0px; letter-spacing: 0px; font-family: var(--font-stack-header); font-style: var(--font-style-header); color: var(--color-heading-text); line-height: normal; padding-right: 2rem; display: flex; user-select: none; width: 708px; cursor: pointer; position: relative;\"><span style=\"border: 0px solid rgb(229, 231, 235); --tw-border-spacing-x: 0; --tw-border-spacing-y: 0; --tw-translate-x: 0; --tw-translate-y: 0; --tw-rotate: 0; --tw-skew-x: 0; --tw-skew-y: 0; --tw-scale-x: 1; --tw-scale-y: 1; --tw-scroll-snap-strictness: proximity; --tw-ring-offset-width: 0px; --tw-ring-offset-color: #fff; --tw-ring-color: rgba(59,130,246,.5019607843137255); --tw-ring-offset-shadow: 0 0 transparent; --tw-ring-shadow: 0 0 transparent; --tw-shadow: 0 0 transparent; --tw-shadow-colored: 0 0 transparent; -webkit-tap-highlight-color: rgba(0, 0, 0, 0);\">ডেলিভারি চার্জ</span></h3><div class=\"collapsible__content\" data-content=\"\" aria-hidden=\"false\" style=\"border: 0px solid rgb(229, 231, 235); --tw-border-spacing-x: 0; --tw-border-spacing-y: 0; --tw-translate-x: 0; --tw-translate-y: 0; --tw-rotate: 0; --tw-skew-x: 0; --tw-skew-y: 0; --tw-scale-x: 1; --tw-scale-y: 1; --tw-scroll-snap-strictness: proximity; --tw-ring-offset-width: 0px; --tw-ring-offset-color: #fff; --tw-ring-color: rgba(59,130,246,.5019607843137255); --tw-ring-offset-shadow: 0 0 transparent; --tw-ring-shadow: 0 0 transparent; --tw-shadow: 0 0 transparent; --tw-shadow-colored: 0 0 transparent; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); height: auto; overflow: hidden; transition: height 0.35s; will-change: height;\"><div class=\"collapsible__content-inner pt-5 pb-10 prose\" style=\"border: 0px solid rgb(229, 231, 235); --tw-border-spacing-x: 0; --tw-border-spacing-y: 0; --tw-translate-x: 0; --tw-translate-y: 0; --tw-rotate: 0; --tw-skew-x: 0; --tw-skew-y: 0; --tw-scale-x: 1; --tw-scale-y: 1; --tw-scroll-snap-strictness: proximity; --tw-ring-offset-width: 0px; --tw-ring-offset-color: #fff; --tw-ring-color: rgba(59,130,246,.5019607843137255); --tw-ring-offset-shadow: 0 0 transparent; --tw-ring-shadow: 0 0 transparent; --tw-shadow: 0 0 transparent; --tw-shadow-colored: 0 0 transparent; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); color: var(--color-body-text,#000); max-width: 100%; --tw-prose-body: #374151; --tw-prose-headings: #111827; --tw-prose-lead: #4b5563; --tw-prose-links: #111827; --tw-prose-bold: #111827; --tw-prose-counters: #6b7280; --tw-prose-bullets: #d1d5db; --tw-prose-hr: #e5e7eb; --tw-prose-quotes: #111827; --tw-prose-quote-borders: #e5e7eb; --tw-prose-captions: #6b7280; --tw-prose-code: #111827; --tw-prose-pre-code: #e5e7eb; --tw-prose-pre-bg: #1f2937; --tw-prose-th-borders: #d1d5db; --tw-prose-td-borders: #e5e7eb; --tw-prose-invert-body: #d1d5db; --tw-prose-invert-headings: #fff; --tw-prose-invert-lead: #9ca3af; --tw-prose-invert-links: #fff; --tw-prose-invert-bold: #fff; --tw-prose-invert-counters: #9ca3af; --tw-prose-invert-bullets: #4b5563; --tw-prose-invert-hr: #374151; --tw-prose-invert-quotes: #f3f4f6; --tw-prose-invert-quote-borders: #374151; --tw-prose-invert-captions: #9ca3af; --tw-prose-invert-code: #fff; --tw-prose-invert-pre-code: #d1d5db; --tw-prose-invert-pre-bg: rgba(0,0,0,.5019607843137255); --tw-prose-invert-th-borders: #4b5563; --tw-prose-invert-td-borders: #374151; font-size: 1rem; line-height: 1.75; padding-top: 16px; padding-bottom: 16px;\"><p style=\"border: 0px solid rgb(229, 231, 235); --tw-border-spacing-x: 0; --tw-border-spacing-y: 0; --tw-translate-x: 0; --tw-translate-y: 0; --tw-rotate: 0; --tw-skew-x: 0; --tw-skew-y: 0; --tw-scale-x: 1; --tw-scale-y: 1; --tw-scroll-snap-strictness: proximity; --tw-ring-offset-width: 0px; --tw-ring-offset-color: #fff; --tw-ring-color: rgba(59,130,246,.5019607843137255); --tw-ring-offset-shadow: 0 0 transparent; --tw-ring-shadow: 0 0 transparent; --tw-shadow: 0 0 transparent; --tw-shadow-colored: 0 0 transparent; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); margin-top: 0.75em; margin-bottom: 0.75em;\">ঢাকার শহরের ভিতর - ১০০ টাকা।<br style=\"border: 0px solid rgb(229, 231, 235); --tw-border-spacing-x: 0; --tw-border-spacing-y: 0; --tw-translate-x: 0; --tw-translate-y: 0; --tw-rotate: 0; --tw-skew-x: 0; --tw-skew-y: 0; --tw-scale-x: 1; --tw-scale-y: 1; --tw-scroll-snap-strictness: proximity; --tw-ring-offset-width: 0px; --tw-ring-offset-color: #fff; --tw-ring-color: rgba(59,130,246,.5019607843137255); --tw-ring-offset-shadow: 0 0 transparent; --tw-ring-shadow: 0 0 transparent; --tw-shadow: 0 0 transparent; --tw-shadow-colored: 0 0 transparent; -webkit-tap-highlight-color: rgba(0, 0, 0, 0);\">ঢাকা&nbsp; বাইরে- ১৫০ টাকা।</p><div class=\"prod__accordion\" style=\"border: 0px solid rgb(229, 231, 235); --tw-border-spacing-x: 0; --tw-border-spacing-y: 0; --tw-translate-x: 0; --tw-translate-y: 0; --tw-rotate: 0; --tw-skew-x: 0; --tw-skew-y: 0; --tw-scale-x: 1; --tw-scale-y: 1; --tw-scroll-snap-strictness: proximity; --tw-ring-offset-width: 0px; --tw-ring-offset-color: #fff; --tw-ring-color: rgba(59,130,246,.5019607843137255); --tw-ring-offset-shadow: 0 0 transparent; --tw-ring-shadow: 0 0 transparent; --tw-shadow: 0 0 transparent; --tw-shadow-colored: 0 0 transparent; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); font-size: 16px;\"><collapsible-tab class=\"collapsible__item no-js-hidden is-collapsed\" data-block-id=\"collapsible-tab-item_x4NNAW\" style=\"border: 0px solid rgb(229, 231, 235); --tw-border-spacing-x: 0; --tw-border-spacing-y: 0; --tw-translate-x: 0; --tw-translate-y: 0; --tw-rotate: 0; --tw-skew-x: 0; --tw-skew-y: 0; --tw-scale-x: 1; --tw-scale-y: 1; --tw-scroll-snap-strictness: proximity; --tw-ring-offset-width: 0px; --tw-ring-offset-color: #fff; --tw-ring-color: rgba(59,130,246,.5019607843137255); --tw-ring-offset-shadow: 0 0 transparent; --tw-ring-shadow: 0 0 transparent; --tw-shadow: 0 0 transparent; --tw-shadow-colored: 0 0 transparent; -webkit-tap-highlight-color: rgba(0, 0, 0, 0);\"><div class=\"collapsible__content\" data-content=\"\" aria-hidden=\"true\" style=\"border: 0px solid rgb(229, 231, 235); --tw-border-spacing-x: 0; --tw-border-spacing-y: 0; --tw-translate-x: 0; --tw-translate-y: 0; --tw-rotate: 0; --tw-skew-x: 0; --tw-skew-y: 0; --tw-scale-x: 1; --tw-scale-y: 1; --tw-scroll-snap-strictness: proximity; --tw-ring-offset-width: 0px; --tw-ring-offset-color: #fff; --tw-ring-color: rgba(59,130,246,.5019607843137255); --tw-ring-offset-shadow: 0 0 transparent; --tw-ring-shadow: 0 0 transparent; --tw-shadow: 0 0 transparent; --tw-shadow-colored: 0 0 transparent; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); height: 0px; overflow: hidden; transition: height 0.35s; will-change: height;\"><div class=\"collapsible__content-inner pt-5 pb-10 prose\" style=\"border: 0px solid rgb(229, 231, 235); --tw-border-spacing-x: 0; --tw-border-spacing-y: 0; --tw-translate-x: 0; --tw-translate-y: 0; --tw-rotate: 0; --tw-skew-x: 0; --tw-skew-y: 0; --tw-scale-x: 1; --tw-scale-y: 1; --tw-scroll-snap-strictness: proximity; --tw-ring-offset-width: 0px; --tw-ring-offset-color: #fff; --tw-ring-color: rgba(59,130,246,.5019607843137255); --tw-ring-offset-shadow: 0 0 transparent; --tw-ring-shadow: 0 0 transparent; --tw-shadow: 0 0 transparent; --tw-shadow-colored: 0 0 transparent; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); color: var(--color-body-text,#000); max-width: 100%; --tw-prose-body: #374151; --tw-prose-headings: #111827; --tw-prose-lead: #4b5563; --tw-prose-links: #111827; --tw-prose-bold: #111827; --tw-prose-counters: #6b7280; --tw-prose-bullets: #d1d5db; --tw-prose-hr: #e5e7eb; --tw-prose-quotes: #111827; --tw-prose-quote-borders: #e5e7eb; --tw-prose-captions: #6b7280; --tw-prose-code: #111827; --tw-prose-pre-code: #e5e7eb; --tw-prose-pre-bg: #1f2937; --tw-prose-th-borders: #d1d5db; --tw-prose-td-borders: #e5e7eb; --tw-prose-invert-body: #d1d5db; --tw-prose-invert-headings: #fff; --tw-prose-invert-lead: #9ca3af; --tw-prose-invert-links: #fff; --tw-prose-invert-bold: #fff; --tw-prose-invert-counters: #9ca3af; --tw-prose-invert-bullets: #4b5563; --tw-prose-invert-hr: #374151; --tw-prose-invert-quotes: #f3f4f6; --tw-prose-invert-quote-borders: #374151; --tw-prose-invert-captions: #9ca3af; --tw-prose-invert-code: #fff; --tw-prose-invert-pre-code: #d1d5db; --tw-prose-invert-pre-bg: rgba(0,0,0,.5019607843137255); --tw-prose-invert-th-borders: #4b5563; --tw-prose-invert-td-borders: #374151; font-size: 1rem; line-height: 1.75; padding-top: 16px; padding-bottom: 16px;\"><p style=\"border: 0px solid rgb(229, 231, 235); --tw-border-spacing-x: 0; --tw-border-spacing-y: 0; --tw-translate-x: 0; --tw-translate-y: 0; --tw-rotate: 0; --tw-skew-x: 0; --tw-skew-y: 0; --tw-scale-x: 1; --tw-scale-y: 1; --tw-scroll-snap-strictness: proximity; --tw-ring-offset-width: 0px; --tw-ring-offset-color: #fff; --tw-ring-color: rgba(59,130,246,.5019607843137255); --tw-ring-offset-shadow: 0 0 transparent; --tw-ring-shadow: 0 0 transparent; --tw-shadow: 0 0 transparent; --tw-shadow-colored: 0 0 transparent; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); margin-top: 0.75em; margin-bottom: 0.75em;\"><br style=\"border: 0px solid rgb(229, 231, 235); --tw-border-spacing-x: 0; --tw-border-spacing-y: 0; --tw-translate-x: 0; --tw-translate-y: 0; --tw-rotate: 0; --tw-skew-x: 0; --tw-skew-y: 0; --tw-scale-x: 1; --tw-scale-y: 1; --tw-scroll-snap-strictness: proximity; --tw-ring-offset-width: 0px; --tw-ring-offset-color: #fff; --tw-ring-color: rgba(59,130,246,.5019607843137255); --tw-ring-offset-shadow: 0 0 transparent; --tw-ring-shadow: 0 0 transparent; --tw-shadow: 0 0 transparent; --tw-shadow-colored: 0 0 transparent; -webkit-tap-highlight-color: rgba(0, 0, 0, 0);\"></p></div></div></collapsible-tab><collapsible-tab class=\"collapsible__item no-js-hidden is-expanded\" data-block-id=\"collapsible-tab-item_9wjAb8\" open=\"true\" style=\"border: 0px solid rgb(229, 231, 235); --tw-border-spacing-x: 0; --tw-border-spacing-y: 0; --tw-translate-x: 0; --tw-translate-y: 0; --tw-rotate: 0; --tw-skew-x: 0; --tw-skew-y: 0; --tw-scale-x: 1; --tw-scale-y: 1; --tw-scroll-snap-strictness: proximity; --tw-ring-offset-width: 0px; --tw-ring-offset-color: #fff; --tw-ring-color: rgba(59,130,246,.5019607843137255); --tw-ring-offset-shadow: 0 0 transparent; --tw-ring-shadow: 0 0 transparent; --tw-shadow: 0 0 transparent; --tw-shadow-colored: 0 0 transparent; -webkit-tap-highlight-color: rgba(0, 0, 0, 0);\"><h3 class=\"collapsible__button lg:text-[18px] py-4 pr-4 border-b border-color-border\" data-trigger=\"\" aria-expanded=\"true\" style=\"border-width: 0px 0px 1px; border-style: solid; border-color: rgb(0, 0, 0); border-image: initial; --tw-border-spacing-x: 0; --tw-border-spacing-y: 0; --tw-translate-x: 0; --tw-translate-y: 0; --tw-rotate: 0; --tw-skew-x: 0; --tw-skew-y: 0; --tw-scale-x: 1; --tw-scale-y: 1; --tw-scroll-snap-strictness: proximity; --tw-ring-offset-width: 0px; --tw-ring-offset-color: #fff; --tw-ring-color: rgba(59,130,246,.5019607843137255); --tw-ring-offset-shadow: 0 0 transparent; --tw-ring-shadow: 0 0 transparent; --tw-shadow: 0 0 transparent; --tw-shadow-colored: 0 0 transparent; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); font-size: 18px; font-weight: 500; margin-bottom: 0px; letter-spacing: 0px; font-family: var(--font-stack-header); font-style: var(--font-style-header); color: var(--color-heading-text); line-height: normal; padding-right: 2rem; display: flex; user-select: none; width: 708px; cursor: pointer; position: relative;\"><span style=\"border: 0px solid rgb(229, 231, 235); --tw-border-spacing-x: 0; --tw-border-spacing-y: 0; --tw-translate-x: 0; --tw-translate-y: 0; --tw-rotate: 0; --tw-skew-x: 0; --tw-skew-y: 0; --tw-scale-x: 1; --tw-scale-y: 1; --tw-scroll-snap-strictness: proximity; --tw-ring-offset-width: 0px; --tw-ring-offset-color: #fff; --tw-ring-color: rgba(59,130,246,.5019607843137255); --tw-ring-offset-shadow: 0 0 transparent; --tw-ring-shadow: 0 0 transparent; --tw-shadow: 0 0 transparent; --tw-shadow-colored: 0 0 transparent; -webkit-tap-highlight-color: rgba(0, 0, 0, 0);\">গ্রাহক সেবা</span></h3><div class=\"collapsible__content\" data-content=\"\" aria-hidden=\"false\" style=\"border: 0px solid rgb(229, 231, 235); --tw-border-spacing-x: 0; --tw-border-spacing-y: 0; --tw-translate-x: 0; --tw-translate-y: 0; --tw-rotate: 0; --tw-skew-x: 0; --tw-skew-y: 0; --tw-scale-x: 1; --tw-scale-y: 1; --tw-scroll-snap-strictness: proximity; --tw-ring-offset-width: 0px; --tw-ring-offset-color: #fff; --tw-ring-color: rgba(59,130,246,.5019607843137255); --tw-ring-offset-shadow: 0 0 transparent; --tw-ring-shadow: 0 0 transparent; --tw-shadow: 0 0 transparent; --tw-shadow-colored: 0 0 transparent; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); height: auto; overflow: hidden; transition: height 0.35s; will-change: height;\"><div class=\"collapsible__content-inner pt-5 pb-10 prose\" style=\"border: 0px solid rgb(229, 231, 235); --tw-border-spacing-x: 0; --tw-border-spacing-y: 0; --tw-translate-x: 0; --tw-translate-y: 0; --tw-rotate: 0; --tw-skew-x: 0; --tw-skew-y: 0; --tw-scale-x: 1; --tw-scale-y: 1; --tw-scroll-snap-strictness: proximity; --tw-ring-offset-width: 0px; --tw-ring-offset-color: #fff; --tw-ring-color: rgba(59,130,246,.5019607843137255); --tw-ring-offset-shadow: 0 0 transparent; --tw-ring-shadow: 0 0 transparent; --tw-shadow: 0 0 transparent; --tw-shadow-colored: 0 0 transparent; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); color: var(--color-body-text,#000); max-width: 100%; --tw-prose-body: #374151; --tw-prose-headings: #111827; --tw-prose-lead: #4b5563; --tw-prose-links: #111827; --tw-prose-bold: #111827; --tw-prose-counters: #6b7280; --tw-prose-bullets: #d1d5db; --tw-prose-hr: #e5e7eb; --tw-prose-quotes: #111827; --tw-prose-quote-borders: #e5e7eb; --tw-prose-captions: #6b7280; --tw-prose-code: #111827; --tw-prose-pre-code: #e5e7eb; --tw-prose-pre-bg: #1f2937; --tw-prose-th-borders: #d1d5db; --tw-prose-td-borders: #e5e7eb; --tw-prose-invert-body: #d1d5db; --tw-prose-invert-headings: #fff; --tw-prose-invert-lead: #9ca3af; --tw-prose-invert-links: #fff; --tw-prose-invert-bold: #fff; --tw-prose-invert-counters: #9ca3af; --tw-prose-invert-bullets: #4b5563; --tw-prose-invert-hr: #374151; --tw-prose-invert-quotes: #f3f4f6; --tw-prose-invert-quote-borders: #374151; --tw-prose-invert-captions: #9ca3af; --tw-prose-invert-code: #fff; --tw-prose-invert-pre-code: #d1d5db; --tw-prose-invert-pre-bg: rgba(0,0,0,.5019607843137255); --tw-prose-invert-th-borders: #4b5563; --tw-prose-invert-td-borders: #374151; font-size: 1rem; line-height: 1.75; padding-top: 16px; padding-bottom: 16px;\"><p style=\"border: 0px solid rgb(229, 231, 235); --tw-border-spacing-x: 0; --tw-border-spacing-y: 0; --tw-translate-x: 0; --tw-translate-y: 0; --tw-rotate: 0; --tw-skew-x: 0; --tw-skew-y: 0; --tw-scale-x: 1; --tw-scale-y: 1; --tw-scroll-snap-strictness: proximity; --tw-ring-offset-width: 0px; --tw-ring-offset-color: #fff; --tw-ring-color: rgba(59,130,246,.5019607843137255); --tw-ring-offset-shadow: 0 0 transparent; --tw-ring-shadow: 0 0 transparent; --tw-shadow: 0 0 transparent; --tw-shadow-colored: 0 0 transparent; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); margin-top: 0.75em; margin-bottom: 0.75em;\">২৪ ঘন্টা একটি অভিযোগ টিম এবং গ্রাহক সেবা টিম কাজ করে এবং গ্রাহক সেবা প্রদান করে । মূলত গ্রাহক সঠিক অর্ডারের মাধ্যমে সঠিক পণ্যটি পেয়েছে কি না অথবা পণ্য / ডেলিভারি সম্পর্কে কোন অভিযোগ আছে কি না টা নিশ্চিত করা হয় এবং সে অনুযায়ী বাবস্থা গ্রহণ করা হয় ।</p><p style=\"border: 0px solid rgb(229, 231, 235); --tw-border-spacing-x: 0; --tw-border-spacing-y: 0; --tw-translate-x: 0; --tw-translate-y: 0; --tw-rotate: 0; --tw-skew-x: 0; --tw-skew-y: 0; --tw-scale-x: 1; --tw-scale-y: 1; --tw-scroll-snap-strictness: proximity; --tw-ring-offset-width: 0px; --tw-ring-offset-color: #fff; --tw-ring-color: rgba(59,130,246,.5019607843137255); --tw-ring-offset-shadow: 0 0 transparent; --tw-ring-shadow: 0 0 transparent; --tw-shadow: 0 0 transparent; --tw-shadow-colored: 0 0 transparent; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); margin-top: 0.75em; margin-bottom: 0.75em;\">অভিযোগ/ মন্তব্য পাওয়ার ১ ঘণ্টার মধ্যে একটি প্রথমিক জবাব প্রদান করা হয় এবং ২৪ ঘন্টার মধ্যে পূর্নাঙ্গ সমাধান করতে আমরা প্রতিশ্রুতিবদ্ধ।</p></div></div></collapsible-tab></div></div></div></collapsible-tab></div></div></div></collapsible-tab></div></div></div></div></div>', NULL, NULL, NULL, 'fabrilife_1783858139.svg', '2025-01-12 14:07:36', '2026-08-03 06:51:26', 'https://api.bdcourier.com/courier-check', 'eyJpdiI6ImpxTW8wZkh4TDMyL0gzVSthVUN0OFE9PSIsInZhbHVlIjoidmpQbzE0bmREak8xN2cwREJRUnZFOGVHU3NucTRlNS9qd01SNW1nYzRMczlTQjFmMzR1ZXJrZFNuODMwVklVbTdTekU3TnZVZ1drYzhaM3lUYlFybkE9PSIsIm1hYyI6IjE1ZDg5MTYxODBmYjIxYTlmYTgyZWJiMWJiYTQzNjNmMmEyNjQ3OWRmNGM1YmY4ODJiMTFmZDA1YTI3NmMxYzEiLCJ0YWciOiIifQ==', NULL, NULL, NULL, NULL, 0, '0de897ef-9fdd-4124-acef-c5c638ecfb00.jpg', NULL, 1, '30.2300', 'a16c2593-05be-41ce-a046-7aec15434369.ico', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `shifts`
--

CREATE TABLE `shifts` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `start_time` time DEFAULT NULL,
  `end_time` time DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `shifts`
--

INSERT INTO `shifts` (`id`, `name`, `code`, `start_time`, `end_time`, `status`, `created_at`, `updated_at`) VALUES
(1, 'General Shift', 'GS', NULL, NULL, 1, '2026-08-12 07:17:24', '2026-08-12 07:17:24');

-- --------------------------------------------------------

--
-- Table structure for table `shipping_methods`
--

CREATE TABLE `shipping_methods` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` decimal(12,2) NOT NULL DEFAULT '0.00',
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `shipping_methods`
--

INSERT INTO `shipping_methods` (`id`, `name`, `price`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Inside Dhaka', '70.00', 1, '2026-07-14 08:13:46', '2026-07-14 08:13:46'),
(2, 'Outside Dhaka', '120.00', 1, '2026-07-14 08:13:46', '2026-07-14 08:13:46');

-- --------------------------------------------------------

--
-- Table structure for table `size_chart_templates`
--

CREATE TABLE `size_chart_templates` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `columns` json NOT NULL,
  `rows` json NOT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `size_chart_templates`
--

INSERT INTO `size_chart_templates` (`id`, `name`, `title`, `columns`, `rows`, `is_active`, `created_at`, `updated_at`) VALUES
(1, 'Size chart - In Inches', 'Size chart - In Inches (Expected Deviation < 3%)', '[\"Size\", \"Chest (round)\", \"Length\", \"Sleeve\"]', '[{\"size\": \"M\", \"chest\": \"39\", \"length\": \"27.5\", \"sleeve\": \"8.25\"}, {\"size\": \"L\", \"chest\": \"40.5\", \"length\": \"28.5\", \"sleeve\": \"8.5\"}, {\"size\": \"XL\", \"chest\": \"43\", \"length\": \"29\", \"sleeve\": \"9\"}, {\"size\": \"2XL\", \"chest\": \"45\", \"length\": \"30\", \"sleeve\": \"9.49\"}]', 1, '2026-07-20 08:18:25', '2026-07-20 08:18:25');

-- --------------------------------------------------------

--
-- Table structure for table `sliders`
--

CREATE TABLE `sliders` (
  `id` int NOT NULL,
  `slider_title` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `slider_image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slider_description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sliders`
--

INSERT INTO `sliders` (`id`, `slider_title`, `slider_image`, `slider_description`, `status`, `created_at`, `updated_at`) VALUES
(4, 'Slider 1', '6a2202b1d7863-fan-adition-jersey-1_1783857222.jpg', NULL, 1, '2026-07-12 11:53:42', '2026-07-12 11:53:42'),
(7, 'slider 2', '6a21771727efd-website-secondary-banner-fhd_1783857423.jpg', NULL, 1, '2026-07-12 11:57:03', '2026-07-12 11:57:03'),
(8, 'slider 3', '6a2202639a9ce-official-adition-jersey-1_1783857455.jpg', NULL, 1, '2026-07-12 11:57:35', '2026-07-12 11:57:35');

-- --------------------------------------------------------

--
-- Table structure for table `sms_log`
--

CREATE TABLE `sms_log` (
  `id` bigint UNSIGNED NOT NULL,
  `campaign_id` char(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` char(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `sms_from` char(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `sms_to` char(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `sms_text` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `log_time` datetime DEFAULT NULL,
  `delivery_time` datetime DEFAULT NULL,
  `send_status` tinyint DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sms_queue`
--

CREATE TABLE `sms_queue` (
  `id` bigint UNSIGNED NOT NULL,
  `campaign_id` char(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `customer_id` bigint DEFAULT NULL,
  `meeting_id` char(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sms_from` char(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `sms_to` char(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `sms_text` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `send_status` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `lead_id` bigint DEFAULT NULL,
  `csv_id` char(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `priority_level` tinyint DEFAULT NULL,
  `log_time` datetime DEFAULT NULL,
  `schedule_time` datetime DEFAULT NULL,
  `retry_status` tinyint DEFAULT NULL,
  `delete_request` tinyint DEFAULT NULL,
  `user_id` bigint DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sms_queue`
--

INSERT INTO `sms_queue` (`id`, `campaign_id`, `customer_id`, `meeting_id`, `sms_from`, `sms_to`, `sms_text`, `send_status`, `lead_id`, `csv_id`, `priority_level`, `log_time`, `schedule_time`, `retry_status`, `delete_request`, `user_id`, `created_at`, `updated_at`) VALUES
(148, NULL, NULL, NULL, '0111111111', '01788888888', 'Kashfi SMS template', '1', 306, NULL, NULL, '2024-10-31 05:55:34', NULL, NULL, NULL, 1, '2024-10-30 23:55:34', '2024-10-30 23:55:34'),
(149, NULL, NULL, NULL, '0111111111', '01555555555', 'Moni sms  template', '1', NULL, NULL, NULL, '2024-10-31 05:56:01', NULL, NULL, NULL, 1, NULL, NULL),
(150, NULL, NULL, NULL, '0111111111', '01455555555', 'Moni sms  template', '1', NULL, NULL, NULL, '2024-10-31 05:56:01', NULL, NULL, NULL, 1, NULL, NULL),
(151, NULL, NULL, NULL, '0111111111', '01717898891', 'Moni sms  template', '1', NULL, NULL, NULL, '2024-10-31 05:56:01', NULL, NULL, NULL, 1, NULL, NULL),
(152, NULL, NULL, NULL, '0111111111', '01875644444', 'SMS template1 test', '1', 266, NULL, NULL, '2024-10-31 05:59:55', NULL, NULL, NULL, 1, '2024-10-30 23:59:55', '2024-10-30 23:59:55'),
(153, NULL, NULL, NULL, '0111111111', '01796321456', 'SMS template1 test', '1', 401, NULL, NULL, '2024-11-05 10:49:00', NULL, NULL, NULL, 1, '2024-11-05 04:49:00', '2024-11-05 04:49:00'),
(154, NULL, NULL, NULL, '0111111111', '0Route Name one', 'Moni sms  template', '1', NULL, NULL, NULL, '2024-11-05 10:50:02', NULL, NULL, NULL, 1, NULL, NULL),
(155, NULL, NULL, NULL, '0111111111', '0Route Name two', 'Moni sms  template', '1', NULL, NULL, NULL, '2024-11-05 10:50:02', NULL, NULL, NULL, 1, NULL, NULL),
(156, NULL, NULL, NULL, '0111111111', '0Route Name Three', 'Moni sms  template', '1', NULL, NULL, NULL, '2024-11-05 10:50:02', NULL, NULL, NULL, 1, NULL, NULL),
(157, NULL, NULL, NULL, '0111111111', '0Route Name Four', 'Moni sms  template', '1', NULL, NULL, NULL, '2024-11-05 10:50:02', NULL, NULL, NULL, 1, NULL, NULL),
(158, NULL, NULL, NULL, '0111111111', '0Route Name Five', 'Moni sms  template', '1', NULL, NULL, NULL, '2024-11-05 10:50:02', NULL, NULL, NULL, 1, NULL, NULL),
(159, NULL, NULL, NULL, '0111111111', '0Route Name six', 'Moni sms  template', '1', NULL, NULL, NULL, '2024-11-05 10:50:02', NULL, NULL, NULL, 1, NULL, NULL),
(160, NULL, NULL, NULL, '0111111111', '0Route Name seven', 'Moni sms  template', '1', NULL, NULL, NULL, '2024-11-05 10:50:02', NULL, NULL, NULL, 1, NULL, NULL),
(161, NULL, NULL, NULL, '0111111111', '0Route Name nine', 'Moni sms  template', '1', NULL, NULL, NULL, '2024-11-05 10:50:02', NULL, NULL, NULL, 1, NULL, NULL),
(162, NULL, NULL, NULL, '0111111111', '01796321456', 'Kashfi SMS template', '1', 401, NULL, NULL, '2024-11-05 11:38:56', NULL, NULL, NULL, 1, '2024-11-05 05:38:56', '2024-11-05 05:38:56'),
(163, NULL, NULL, NULL, '0111111111', '01764655648', 'SMS template1 test', '1', 402, NULL, NULL, '2024-11-05 11:39:41', NULL, NULL, NULL, 1, '2024-11-05 05:39:41', '2024-11-05 05:39:41'),
(164, NULL, NULL, NULL, '0111111111', '01769632541', 'SMS template1 test', '1', 406, NULL, NULL, '2024-11-05 14:40:27', NULL, NULL, NULL, 75, '2024-11-05 08:40:27', '2024-11-05 08:40:27'),
(165, NULL, NULL, NULL, '0111111111', '01769632541', 'SMS template1 test', '1', 406, NULL, NULL, '2024-11-05 14:46:51', NULL, NULL, NULL, 75, '2024-11-05 08:46:51', '2024-11-05 08:46:51'),
(166, NULL, NULL, NULL, '0111111111', '01787877123', 'SMS template1 test', '1', NULL, NULL, NULL, '2024-11-05 15:02:27', NULL, NULL, NULL, 75, NULL, NULL),
(167, NULL, NULL, NULL, '0111111111', '01787877113', 'SMS template1 test', '1', NULL, NULL, NULL, '2024-11-05 15:02:27', NULL, NULL, NULL, 75, NULL, NULL),
(168, NULL, NULL, NULL, '0111111111', '01787877123', 'SMS template1 test', '1', NULL, NULL, NULL, '2024-11-05 15:02:27', NULL, NULL, NULL, 75, NULL, NULL),
(169, NULL, NULL, NULL, '0111111111', '01667655555', 'SMS template1 test', '1', NULL, NULL, NULL, '2024-11-05 15:02:27', NULL, NULL, NULL, 75, NULL, NULL),
(170, NULL, NULL, NULL, '0111111111', '01769632541', 'SMS template1 test', '1', 406, NULL, NULL, '2024-11-05 15:02:27', NULL, NULL, NULL, 75, NULL, NULL),
(171, NULL, NULL, NULL, '0111111111', '01762680927', 'SMS template1 test', '1', 404, NULL, NULL, '2024-11-05 15:02:27', NULL, NULL, NULL, 75, NULL, NULL),
(172, NULL, NULL, NULL, '0111111111', '01645239865', 'SMS template1 test', '1', 403, NULL, NULL, '2024-11-05 15:02:27', NULL, NULL, NULL, 75, NULL, NULL),
(173, NULL, NULL, NULL, '0111111111', '01787877123', 'Moni sms  template', '1', NULL, NULL, NULL, '2024-11-05 15:51:18', NULL, NULL, NULL, 69, NULL, NULL),
(174, NULL, NULL, NULL, '0111111111', '01787877113', 'Moni sms  template', '1', NULL, NULL, NULL, '2024-11-05 15:51:18', NULL, NULL, NULL, 69, NULL, NULL),
(175, NULL, NULL, NULL, '0111111111', '01787877123', 'Moni sms  template', '1', NULL, NULL, NULL, '2024-11-05 15:51:18', NULL, NULL, NULL, 69, NULL, NULL),
(176, NULL, NULL, NULL, '0111111111', '01667655555', 'Moni sms  template', '1', NULL, NULL, NULL, '2024-11-05 15:51:18', NULL, NULL, NULL, 69, NULL, NULL),
(177, NULL, NULL, NULL, '0111111111', '01769632541', 'Moni sms  template', '1', 406, NULL, NULL, '2024-11-05 15:51:18', NULL, NULL, NULL, 69, NULL, NULL),
(178, NULL, NULL, NULL, '0111111111', '01762680927', 'Moni sms  template', '1', 404, NULL, NULL, '2024-11-05 15:51:18', NULL, NULL, NULL, 69, NULL, NULL),
(179, NULL, NULL, NULL, '0111111111', '01645239865', 'Moni sms  template', '1', 403, NULL, NULL, '2024-11-05 15:51:18', NULL, NULL, NULL, 69, NULL, NULL),
(180, NULL, NULL, NULL, '0111111111', '01764655652', 'Moni sms  template', '1', 411, NULL, NULL, '2024-11-05 15:51:18', NULL, NULL, NULL, 69, NULL, NULL),
(181, NULL, NULL, NULL, '0111111111', '01764655652', 'SMS template1 test', '1', 411, NULL, NULL, '2024-11-05 15:52:10', NULL, NULL, NULL, 69, '2024-11-05 09:52:10', '2024-11-05 09:52:10'),
(182, NULL, NULL, NULL, '0111111111', '01764655985', 'Test Steps:    From the Leave menu, select Public Holidays or Holidays.', '1', 418, NULL, NULL, '2024-11-05 16:24:09', NULL, NULL, NULL, 69, '2024-11-05 10:24:09', '2024-11-05 10:24:09'),
(183, NULL, NULL, NULL, '0111111111', '01698745632', 'Test Steps:    From the Leave menu, select Public Holidays or Holidays.', '1', 425, NULL, NULL, '2024-11-05 16:36:47', NULL, NULL, NULL, 69, '2024-11-05 10:36:47', '2024-11-05 10:36:47'),
(184, NULL, NULL, NULL, '0111111111', '01787877123', 'Test Steps:    From the Leave menu, select Public Holidays or Holidays.', '1', NULL, NULL, NULL, '2024-11-05 16:39:15', NULL, NULL, NULL, 69, NULL, NULL),
(185, NULL, NULL, NULL, '0111111111', '01787877113', 'Test Steps:    From the Leave menu, select Public Holidays or Holidays.', '1', NULL, NULL, NULL, '2024-11-05 16:39:15', NULL, NULL, NULL, 69, NULL, NULL),
(186, NULL, NULL, NULL, '0111111111', '01787877123', 'Test Steps:    From the Leave menu, select Public Holidays or Holidays.', '1', NULL, NULL, NULL, '2024-11-05 16:39:15', NULL, NULL, NULL, 69, NULL, NULL),
(187, NULL, NULL, NULL, '0111111111', '01667655555', 'Test Steps:    From the Leave menu, select Public Holidays or Holidays.', '1', NULL, NULL, NULL, '2024-11-05 16:39:15', NULL, NULL, NULL, 69, NULL, NULL),
(188, NULL, NULL, NULL, '0111111111', '01769632541', 'Test Steps:    From the Leave menu, select Public Holidays or Holidays.', '1', 406, NULL, NULL, '2024-11-05 16:39:15', NULL, NULL, NULL, 69, NULL, NULL),
(189, NULL, NULL, NULL, '0111111111', '01762680927', 'Test Steps:    From the Leave menu, select Public Holidays or Holidays.', '1', 404, NULL, NULL, '2024-11-05 16:39:15', NULL, NULL, NULL, 69, NULL, NULL),
(190, NULL, NULL, NULL, '0111111111', '01645239865', 'Test Steps:    From the Leave menu, select Public Holidays or Holidays.', '1', 403, NULL, NULL, '2024-11-05 16:39:15', NULL, NULL, NULL, 69, NULL, NULL),
(194, NULL, NULL, NULL, '0111111111', '01764652365', 'Test Steps:    From the Leave menu, select Public Holidays or Holidays.', '1', 429, NULL, NULL, '2024-11-06 11:02:14', NULL, NULL, NULL, 69, '2024-11-06 05:02:14', '2024-11-06 05:02:14'),
(195, NULL, NULL, NULL, '0111111111', '01717761611', 'Test Steps:    From the Leave menu, select Public Holidays or Holidays.', '1', 430, NULL, NULL, '2024-11-06 11:19:09', NULL, NULL, NULL, 78, '2024-11-06 05:19:09', '2024-11-06 05:19:09'),
(196, NULL, NULL, NULL, '0111111111', '01233333333', 'Test Steps:    From the Leave menu, select Public Holidays or Holidays.', '1', NULL, NULL, NULL, '2024-11-06 17:42:06', NULL, NULL, NULL, 1, '2024-11-06 11:42:06', '2024-11-06 11:42:06'),
(197, NULL, NULL, '31', 'Genuity', '01645239865', 'Meeting With ishtiak vai Meeting Link: https://mail.google.com/mail/u/0/#inbox', 'Pending', NULL, NULL, NULL, '2024-11-07 10:29:19', NULL, NULL, NULL, 1, '2024-11-07 04:29:19', '2024-11-07 04:29:19'),
(198, NULL, NULL, NULL, '0111111111', '01645239865', 'Moni sms  template', '1', 403, NULL, NULL, '2024-11-07 11:11:18', NULL, NULL, NULL, 1, '2024-11-07 05:11:18', '2024-11-07 05:11:18'),
(199, NULL, NULL, NULL, '0111111111', '01762680927', 'Test Steps:    From the Leave menu, select Public Holidays or Holidays.', '1', 404, NULL, NULL, '2024-11-07 17:11:08', NULL, NULL, NULL, 1, '2024-11-07 11:11:08', '2024-11-07 11:11:08');

-- --------------------------------------------------------

--
-- Table structure for table `sms_templates`
--

CREATE TABLE `sms_templates` (
  `id` bigint UNSIGNED NOT NULL,
  `title` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint DEFAULT NULL,
  `created_by` bigint DEFAULT NULL,
  `updated_by` bigint DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sms_templates`
--

INSERT INTO `sms_templates` (`id`, `title`, `description`, `status`, `created_by`, `updated_by`, `created_at`, `updated_at`) VALUES
(28, 'SMS template1', 'SMS template1 test', 1, 1, NULL, '2024-10-30 23:48:22', '2024-10-30 23:48:22'),
(29, 'Moni template', 'Moni sms  template', 1, 69, NULL, '2024-10-30 23:48:59', '2024-10-30 23:48:59'),
(30, 'Kashfi template', 'Kashfi SMS template', 1, 67, NULL, '2024-10-30 23:55:13', '2024-10-30 23:55:13'),
(31, 'agent sms templete', 'Test Steps:\r\n\r\n    From the Leave menu, select Public Holidays or Holidays.', 1, 69, NULL, '2024-11-05 10:11:31', '2024-11-05 10:11:31');

-- --------------------------------------------------------

--
-- Table structure for table `state`
--

CREATE TABLE `state` (
  `id` bigint UNSIGNED NOT NULL,
  `country_id` int NOT NULL,
  `state_name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tasks`
--

CREATE TABLE `tasks` (
  `id` bigint UNSIGNED NOT NULL,
  `task_name` char(180) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `due_date` datetime NOT NULL,
  `assigned_to` bigint NOT NULL,
  `created_by` bigint NOT NULL,
  `status` tinyint DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` char(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `username` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `first_name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone_number` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_type` char(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `gender` char(6) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `profile_image` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `state` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `zip` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `role_id` char(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `user_id`, `username`, `first_name`, `last_name`, `email`, `phone_number`, `user_type`, `gender`, `profile_image`, `city`, `state`, `zip`, `address`, `role_id`, `email_verified_at`, `password`, `remember_token`, `status`, `created_at`, `updated_at`) VALUES
(1, NULL, 'root', 'Khan1', 'Riyad', 'khan@gmail.com', '01731415537', 'admin', NULL, '313405982_1289255718315219_4110666478942719247_n_1732727105.jpg', NULL, NULL, NULL, NULL, '5', NULL, '$2y$12$W9G7uVmQHVeqsgNQrmpvtueBNg6QS4JzgaXwNixuZ8mv9KV5x57yi', NULL, '1', '2024-05-19 22:24:44', '2024-11-27 17:05:05'),
(79, '2181464017486', 'car-clinic', 'Car Clinic', 'Admin', 'car@gmail.com', '01717761611', 'admin', 'Male', NULL, NULL, NULL, NULL, NULL, '25', NULL, '$2y$12$kvmKmafQPO4IyN7JDefXWOQXcR2DdcIqTOzrXo404o/v1Bf3wDN8q', NULL, '1', '2024-12-21 15:52:47', '2024-12-21 15:53:02'),
(80, NULL, NULL, 'Obaidul', 'Obaidul', NULL, '01919001122', 'customer', NULL, NULL, 'Dhaka', 'Dhaka', NULL, 'Master para, Feni', NULL, NULL, '$2y$12$pIk9MuTLqSRODCGkO.1olO95/JoJB0Qiy0h5Jr09ZrEi4lSkU7erG', NULL, '1', '2024-12-29 23:29:42', '2024-12-29 23:30:37'),
(81, NULL, NULL, 'Md.Mehedi Hasan', 'Md.Mehedi Hasan', NULL, '01789944503', 'customer', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '$2y$12$ztGlUlpVLp6UE7f3U17K2OEC5sIEpiQUj5uLb89VHr3covBKkR0mu', NULL, '1', '2025-01-11 13:17:40', '2025-01-11 13:17:40'),
(82, '4239749851274', 'rasel-123', 'Rasel', 'Khan', 'rasel@gmail.com', NULL, 'admin', 'Male', '49816a5d-bf7b-4035-a3c4-8c2749dae354.jpg', NULL, NULL, NULL, NULL, '26', NULL, '$2y$12$71DUrVSYIL1JIx8JB/27oeQEc0mkjrmz9iuRaSmqCaCaXqiv/RGqS', NULL, '1', '2026-06-27 10:38:23', '2026-07-21 06:23:09'),
(83, NULL, NULL, 'jakir', 'jakir', 'mduzzal999111@gmail.com', '01959994205', 'customer', NULL, NULL, 'dhaka', NULL, '2300', 'zigatola', NULL, NULL, '$2y$12$nE9MMkItrAh9xoU03d0lEeLlHSDWdR7SW..FMpMpTnyrDvsMxsDvW', NULL, '1', '2026-07-04 13:52:52', '2026-07-04 13:53:52'),
(85, NULL, NULL, 'jakir', 'uzzal', NULL, '01959994206', 'customer', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '$2y$12$7LBzZKDLkHE20acTh2mwkOD50mNIqbKzHWL8Ecs3w0Lc5hSK6YR9O', NULL, '1', '2026-07-14 11:23:00', '2026-07-14 11:23:00'),
(88, NULL, NULL, 'ujbhuj', 'hh', NULL, '01304993998', 'customer', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '$2y$12$c2CHX/n3qHAEKWeaIew4pe/bkWxKAaR19GRuIDxSCRXF1NlDI95ga', NULL, '1', '2026-07-19 12:44:20', '2026-07-19 12:44:20'),
(89, '1443637067806', 'test', 'md', 'test', 'test@gmail.com', NULL, 'agent', NULL, '', NULL, NULL, NULL, NULL, '27', NULL, '$2y$12$Zowo2uFr7Ntm//iIdGyWT.Si75LKBLo2z/vJNOZM9N4ogxynJIV8C', NULL, '1', '2026-07-29 12:48:27', '2026-07-29 12:51:55');

-- --------------------------------------------------------

--
-- Table structure for table `users_roles`
--

CREATE TABLE `users_roles` (
  `user_id` char(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `role_id` bigint UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `wishlists`
--

CREATE TABLE `wishlists` (
  `id` int NOT NULL,
  `user_id` int DEFAULT NULL,
  `session_id` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `product_id` int NOT NULL,
  `product_name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `product_image` varchar(190) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `unit_price` decimal(10,2) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Dumping data for table `wishlists`
--

INSERT INTO `wishlists` (`id`, `user_id`, `session_id`, `product_id`, `product_name`, `product_image`, `unit_price`, `created_at`, `updated_at`) VALUES
(2, NULL, '8274272736099', 23, 'Tyre one', 'bluearth-es-es32_656e4e68-955e-4553-a103-e263aa6772da_1732977261.webp', '250.00', '2024-12-15 01:08:38', '2024-12-15 01:08:38'),
(3, NULL, '8274272736099', 29, 'Break Shoe', '62252651_2761929307182190_4775183599341142016_n_1732977442.webp', '5000.00', '2024-12-15 01:08:51', '2024-12-15 01:08:51'),
(4, NULL, '8274272736099', 30, 'Break Shoe two', '58281767_2413160688708610_3553364363970609152_n_1732977518.webp', '7000.00', '2024-12-15 01:08:53', '2024-12-15 01:08:53'),
(5, NULL, '8274272736099', 20, 'Tyre four', 'MAP31-03d21e46-9f5d-4e30-a3f7-a41e02ec696a-_1_2b65e8ec-acbe-417b-afc6-34fe9563f139_1732977466.webp', '1200.00', '2024-12-15 01:09:02', '2024-12-15 01:09:02'),
(7, NULL, '7122928462708', 26, 'Lubricant one', '0W-20Front_1732976577.webp', '15000.00', '2024-12-22 18:19:20', '2024-12-22 18:19:20'),
(8, NULL, '7966379075114', 28, 'Joyroom JR-PBF04 20000mAh 65W Fast Charging Power Bank', 'WhatsAppImage2024-06-09at12.13.09_fc5eaabd_1734869806.webp', '32432432.00', '2024-12-23 12:22:50', '2024-12-23 12:22:50'),
(9, NULL, '7966379075114', 27, 'Lubricant Three', 'Mobil1-0w-20.png_1732976713.webp', '234324.00', '2024-12-23 12:23:06', '2024-12-23 12:23:06'),
(10, NULL, '4341729444125', 22, 'Tyre two', 'bluearth-es-es32_f7a53050-f195-494a-9917-05ad044d7355_1732978368.webp', '300.00', '2024-12-30 07:46:46', '2024-12-30 07:46:46'),
(11, 79, '8780592802388', 20, 'Tyre four', 'MAP31-03d21e46-9f5d-4e30-a3f7-a41e02ec696a-_1_2b65e8ec-acbe-417b-afc6-34fe9563f139_1732977466.webp', '1200.00', '2024-12-31 15:19:47', '2024-12-31 15:19:47'),
(12, NULL, '6571628651942', 21, 'Tyre three', 'cinturato-p1-verde-3-4-1505470090255_13005552-be62-4f0a-8dcd-ef347186fb95_1732977344.webp', '150.00', '2025-01-04 01:52:03', '2025-01-04 01:52:03'),
(13, NULL, '9867960032522', 32, 'Battery two', '2_1c236bfd-ba8a-4272-8686-ea7607eb96ec_1732977634.webp', '8000.00', '2025-01-07 21:06:56', '2025-01-07 21:06:56'),
(14, NULL, '350739034940', 20, 'Tyre four', 'MAP31-03d21e46-9f5d-4e30-a3f7-a41e02ec696a-_1_2b65e8ec-acbe-417b-afc6-34fe9563f139_1732977466.webp', '1200.00', '2025-01-20 12:37:20', '2025-01-20 12:37:20'),
(20, NULL, '7004298849474', 23, 'Tyre one', 'bluearth-es-es32_656e4e68-955e-4553-a103-e263aa6772da_1732977261.webp', '250.00', '2025-10-06 22:28:58', '2025-10-06 22:28:58'),
(19, NULL, '4260015302297', 21, 'Tyre three', 'cinturato-p1-verde-3-4-1505470090255_13005552-be62-4f0a-8dcd-ef347186fb95_1732977344.webp', '150.00', '2025-08-03 16:33:47', '2025-08-03 16:33:47'),
(18, NULL, '1143393864281', 21, 'Tyre three', 'cinturato-p1-verde-3-4-1505470090255_13005552-be62-4f0a-8dcd-ef347186fb95_1732977344.webp', '150.00', '2025-01-21 16:32:59', '2025-01-21 16:32:59'),
(22, NULL, '5988383160891', 49, 'Loyal Princess Double Glass gas Stove -3D', 'IMG_20260628_030900_1782595483.jpg', '3500.00', '2026-06-27 21:27:05', '2026-06-27 21:27:05'),
(23, NULL, '2905562793330', 48, 'Lg Front glass Gas stove', 'IMG_20260628_025152_1782593698.jpg', '1650.00', '2026-06-28 14:29:17', '2026-06-28 14:29:17'),
(36, 85, NULL, 62, 'Mufutau Moran do quam quidem e', '69d5da3bddb9d-square_1783862003.jpg', '461.00', '2026-07-14 11:23:24', '2026-07-14 11:23:24'),
(35, 85, NULL, 69, 'Castor Vasquez', '67dba9546f2b0-square_1783946094.jpg', '400.00', '2026-07-14 11:23:13', '2026-07-14 11:23:13');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `agents`
--
ALTER TABLE `agents`
  ADD PRIMARY KEY (`agent_id`),
  ADD KEY `agents_user_id_foreign` (`user_id`);

--
-- Indexes for table `announcements`
--
ALTER TABLE `announcements`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `attendance_policies`
--
ALTER TABLE `attendance_policies`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `award_types`
--
ALTER TABLE `award_types`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `bank_info`
--
ALTER TABLE `bank_info`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `billing_address`
--
ALTER TABLE `billing_address`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `bloggers_category`
--
ALTER TABLE `bloggers_category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `blogs`
--
ALTER TABLE `blogs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `branches`
--
ALTER TABLE `branches`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `brands`
--
ALTER TABLE `brands`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `campaigns`
--
ALTER TABLE `campaigns`
  ADD PRIMARY KEY (`id`),
  ADD KEY `campaigns_promotion_id_index` (`promotion_id`);

--
-- Indexes for table `campaign_data`
--
ALTER TABLE `campaign_data`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `campaign_data_email_unique` (`email`);

--
-- Indexes for table `careers`
--
ALTER TABLE `careers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `carts`
--
ALTER TABLE `carts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `categories_category_slug_unique` (`category_slug`);

--
-- Indexes for table `city`
--
ALTER TABLE `city`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `countries`
--
ALTER TABLE `countries`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `country`
--
ALTER TABLE `country`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `currencies`
--
ALTER TABLE `currencies`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `customers_old`
--
ALTER TABLE `customers_old`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `customer_id` (`customer_id`);

--
-- Indexes for table `customer_info`
--
ALTER TABLE `customer_info`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `departments`
--
ALTER TABLE `departments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `designations`
--
ALTER TABLE `designations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `developer department`
--
ALTER TABLE `developer department`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `developer department_web design_unique` (`web design`);

--
-- Indexes for table `document_types`
--
ALTER TABLE `document_types`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `email_log`
--
ALTER TABLE `email_log`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `email_queue`
--
ALTER TABLE `email_queue`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `email_templates`
--
ALTER TABLE `email_templates`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `employees`
--
ALTER TABLE `employees`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `employees_employee_code_unique` (`employee_code`),
  ADD UNIQUE KEY `employees_email_unique` (`email`);

--
-- Indexes for table `employee_documents`
--
ALTER TABLE `employee_documents`
  ADD PRIMARY KEY (`id`),
  ADD KEY `employee_documents_employee_id_index` (`employee_id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `faqs`
--
ALTER TABLE `faqs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `faqs_is_active_sort_order_index` (`is_active`,`sort_order`);

--
-- Indexes for table `file_section`
--
ALTER TABLE `file_section`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `holidays`
--
ALTER TABLE `holidays`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `home_page_settings`
--
ALTER TABLE `home_page_settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `invoices`
--
ALTER TABLE `invoices`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `invoice_custom_form`
--
ALTER TABLE `invoice_custom_form`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`);

--
-- Indexes for table `leave_applications`
--
ALTER TABLE `leave_applications`
  ADD PRIMARY KEY (`id`),
  ADD KEY `leave_applications_employee_id_foreign` (`employee_id`),
  ADD KEY `leave_applications_leave_type_id_foreign` (`leave_type_id`);

--
-- Indexes for table `leave_balances`
--
ALTER TABLE `leave_balances`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `leave_balances_employee_id_leave_type_id_year_unique` (`employee_id`,`leave_type_id`,`year`),
  ADD KEY `leave_balances_leave_type_id_foreign` (`leave_type_id`);

--
-- Indexes for table `leave_policies`
--
ALTER TABLE `leave_policies`
  ADD PRIMARY KEY (`id`),
  ADD KEY `leave_policies_leave_type_id_foreign` (`leave_type_id`);

--
-- Indexes for table `leave_types`
--
ALTER TABLE `leave_types`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `logs`
--
ALTER TABLE `logs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `meetings`
--
ALTER TABLE `meetings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `menus`
--
ALTER TABLE `menus`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `newsletter_subscribers`
--
ALTER TABLE `newsletter_subscribers`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `newsletter_subscribers_email_unique` (`email`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `orders_assigned_agent_id_index` (`assigned_agent_id`),
  ADD KEY `orders_steadfast_consignment_id_index` (`steadfast_consignment_id`),
  ADD KEY `orders_steadfast_tracking_code_index` (`steadfast_tracking_code`);

--
-- Indexes for table `order_details`
--
ALTER TABLE `order_details`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `order_info`
--
ALTER TABLE `order_info`
  ADD PRIMARY KEY (`order_id`);

--
-- Indexes for table `outlet_locations`
--
ALTER TABLE `outlet_locations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `outlet_locations_status_index` (`status`);

--
-- Indexes for table `outlet_page_settings`
--
ALTER TABLE `outlet_page_settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `permissions_permission_group_id_foreign` (`permission_group_id`);

--
-- Indexes for table `permission_groups`
--
ALTER TABLE `permission_groups`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `products_slug_unique` (`slug`);

--
-- Indexes for table `product_color`
--
ALTER TABLE `product_color`
  ADD PRIMARY KEY (`product_id`,`product_color_id`),
  ADD KEY `product_color_product_color_id_foreign` (`product_color_id`);

--
-- Indexes for table `product_colors`
--
ALTER TABLE `product_colors`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `product_colors_name_unique` (`name`);

--
-- Indexes for table `product_size`
--
ALTER TABLE `product_size`
  ADD PRIMARY KEY (`product_id`,`product_size_id`),
  ADD KEY `product_size_product_size_id_foreign` (`product_size_id`);

--
-- Indexes for table `product_sizes`
--
ALTER TABLE `product_sizes`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `product_sizes_name_unique` (`name`);

--
-- Indexes for table `product_specification`
--
ALTER TABLE `product_specification`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `promotions`
--
ALTER TABLE `promotions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `roles_permissions`
--
ALTER TABLE `roles_permissions`
  ADD PRIMARY KEY (`role_id`,`permission_id`),
  ADD KEY `roles_permissions_permission_id_foreign` (`permission_id`);

--
-- Indexes for table `salesman`
--
ALTER TABLE `salesman`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

--
-- Indexes for table `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `shifts`
--
ALTER TABLE `shifts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `shipping_methods`
--
ALTER TABLE `shipping_methods`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `shipping_methods_name_unique` (`name`);

--
-- Indexes for table `size_chart_templates`
--
ALTER TABLE `size_chart_templates`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `size_chart_templates_name_unique` (`name`);

--
-- Indexes for table `sliders`
--
ALTER TABLE `sliders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sms_log`
--
ALTER TABLE `sms_log`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sms_queue`
--
ALTER TABLE `sms_queue`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sms_templates`
--
ALTER TABLE `sms_templates`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `state`
--
ALTER TABLE `state`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tasks`
--
ALTER TABLE `tasks`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `wishlists`
--
ALTER TABLE `wishlists`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `announcements`
--
ALTER TABLE `announcements`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `attendance_policies`
--
ALTER TABLE `attendance_policies`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `award_types`
--
ALTER TABLE `award_types`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `bank_info`
--
ALTER TABLE `bank_info`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `billing_address`
--
ALTER TABLE `billing_address`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT for table `bloggers_category`
--
ALTER TABLE `bloggers_category`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `blogs`
--
ALTER TABLE `blogs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `branches`
--
ALTER TABLE `branches`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `brands`
--
ALTER TABLE `brands`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `campaigns`
--
ALTER TABLE `campaigns`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `campaign_data`
--
ALTER TABLE `campaign_data`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `careers`
--
ALTER TABLE `careers`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `carts`
--
ALTER TABLE `carts`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=216;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;

--
-- AUTO_INCREMENT for table `city`
--
ALTER TABLE `city`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `countries`
--
ALTER TABLE `countries`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `country`
--
ALTER TABLE `country`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `currencies`
--
ALTER TABLE `currencies`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `customers_old`
--
ALTER TABLE `customers_old`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `customer_info`
--
ALTER TABLE `customer_info`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `departments`
--
ALTER TABLE `departments`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `designations`
--
ALTER TABLE `designations`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `developer department`
--
ALTER TABLE `developer department`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `document_types`
--
ALTER TABLE `document_types`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `email_log`
--
ALTER TABLE `email_log`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `email_queue`
--
ALTER TABLE `email_queue`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=299;

--
-- AUTO_INCREMENT for table `email_templates`
--
ALTER TABLE `email_templates`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=48;

--
-- AUTO_INCREMENT for table `employees`
--
ALTER TABLE `employees`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `employee_documents`
--
ALTER TABLE `employee_documents`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `faqs`
--
ALTER TABLE `faqs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `file_section`
--
ALTER TABLE `file_section`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `holidays`
--
ALTER TABLE `holidays`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `home_page_settings`
--
ALTER TABLE `home_page_settings`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `invoices`
--
ALTER TABLE `invoices`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `invoice_custom_form`
--
ALTER TABLE `invoice_custom_form`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `leave_applications`
--
ALTER TABLE `leave_applications`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `leave_balances`
--
ALTER TABLE `leave_balances`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `leave_policies`
--
ALTER TABLE `leave_policies`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `leave_types`
--
ALTER TABLE `leave_types`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `logs`
--
ALTER TABLE `logs`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=340;

--
-- AUTO_INCREMENT for table `meetings`
--
ALTER TABLE `meetings`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `menus`
--
ALTER TABLE `menus`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=382;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=96;

--
-- AUTO_INCREMENT for table `newsletter_subscribers`
--
ALTER TABLE `newsletter_subscribers`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `order_details`
--
ALTER TABLE `order_details`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=50;

--
-- AUTO_INCREMENT for table `order_info`
--
ALTER TABLE `order_info`
  MODIFY `order_id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `outlet_locations`
--
ALTER TABLE `outlet_locations`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `outlet_page_settings`
--
ALTER TABLE `outlet_page_settings`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `permission_groups`
--
ALTER TABLE `permission_groups`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=73;

--
-- AUTO_INCREMENT for table `product_colors`
--
ALTER TABLE `product_colors`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `product_sizes`
--
ALTER TABLE `product_sizes`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `product_specification`
--
ALTER TABLE `product_specification`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `promotions`
--
ALTER TABLE `promotions`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=73;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT for table `salesman`
--
ALTER TABLE `salesman`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `settings`
--
ALTER TABLE `settings`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `shifts`
--
ALTER TABLE `shifts`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `shipping_methods`
--
ALTER TABLE `shipping_methods`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `size_chart_templates`
--
ALTER TABLE `size_chart_templates`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `sliders`
--
ALTER TABLE `sliders`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `sms_log`
--
ALTER TABLE `sms_log`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sms_queue`
--
ALTER TABLE `sms_queue`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=200;

--
-- AUTO_INCREMENT for table `sms_templates`
--
ALTER TABLE `sms_templates`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT for table `state`
--
ALTER TABLE `state`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tasks`
--
ALTER TABLE `tasks`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=90;

--
-- AUTO_INCREMENT for table `wishlists`
--
ALTER TABLE `wishlists`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=47;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `agents`
--
ALTER TABLE `agents`
  ADD CONSTRAINT `agents_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `campaigns`
--
ALTER TABLE `campaigns`
  ADD CONSTRAINT `campaigns_promotion_id_foreign` FOREIGN KEY (`promotion_id`) REFERENCES `promotions` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `leave_applications`
--
ALTER TABLE `leave_applications`
  ADD CONSTRAINT `leave_applications_employee_id_foreign` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `leave_applications_leave_type_id_foreign` FOREIGN KEY (`leave_type_id`) REFERENCES `leave_types` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `leave_balances`
--
ALTER TABLE `leave_balances`
  ADD CONSTRAINT `leave_balances_employee_id_foreign` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `leave_balances_leave_type_id_foreign` FOREIGN KEY (`leave_type_id`) REFERENCES `leave_types` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `leave_policies`
--
ALTER TABLE `leave_policies`
  ADD CONSTRAINT `leave_policies_leave_type_id_foreign` FOREIGN KEY (`leave_type_id`) REFERENCES `leave_types` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `permissions`
--
ALTER TABLE `permissions`
  ADD CONSTRAINT `permissions_permission_group_id_foreign` FOREIGN KEY (`permission_group_id`) REFERENCES `permission_groups` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `product_color`
--
ALTER TABLE `product_color`
  ADD CONSTRAINT `product_color_product_color_id_foreign` FOREIGN KEY (`product_color_id`) REFERENCES `product_colors` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `product_color_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `product_size`
--
ALTER TABLE `product_size`
  ADD CONSTRAINT `product_size_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `product_size_product_size_id_foreign` FOREIGN KEY (`product_size_id`) REFERENCES `product_sizes` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

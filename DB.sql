-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 28, 2023 at 07:58 AM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `is_2`
--

-- --------------------------------------------------------

--
-- Table structure for table `accounts`
--

CREATE TABLE `accounts` (
  `Account_id` int(10) UNSIGNED NOT NULL,
  `credit_card_id` int(10) UNSIGNED DEFAULT NULL,
  `Customer_id` bigint(20) UNSIGNED NOT NULL,
  `Account_no` varchar(11) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Amount` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `accounts`
--

INSERT INTO `accounts` (`Account_id`, `credit_card_id`, `Customer_id`, `Account_no`, `Amount`, `created_at`, `updated_at`) VALUES
(1, 1, 1, '123456', 110000000, '2023-10-22 12:32:04', '2023-10-22 12:32:04'),
(12345687, 2, 13, '0GJKAPXQ2W', 1077115382, '2023-11-18 16:22:04', '2023-11-18 16:22:04'),
(12345688, 3, 14, 'BW2VK9M508', 9000, '2023-11-26 14:04:14', '2023-11-26 14:13:02');

-- --------------------------------------------------------

--
-- Table structure for table `admin_menu`
--

CREATE TABLE `admin_menu` (
  `id` int(10) UNSIGNED NOT NULL,
  `parent_id` int(11) NOT NULL DEFAULT 0,
  `order` int(11) NOT NULL DEFAULT 0,
  `title` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `icon` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `uri` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `permission` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `admin_menu`
--

INSERT INTO `admin_menu` (`id`, `parent_id`, `order`, `title`, `icon`, `uri`, `permission`, `created_at`, `updated_at`) VALUES
(1, 0, 1, 'Dashboard', 'icon-chart-bar', '/', NULL, NULL, NULL),
(2, 0, 2, 'Admin', 'icon-server', '', NULL, NULL, NULL),
(3, 2, 3, 'Users', 'icon-users', 'auth/users', NULL, NULL, NULL),
(4, 2, 4, 'Roles', 'icon-user', 'auth/roles', NULL, NULL, NULL),
(5, 2, 5, 'Permission', 'icon-ban', 'auth/permissions', NULL, NULL, NULL),
(6, 2, 6, 'Menu', 'icon-bars', 'auth/menu', NULL, NULL, NULL),
(7, 2, 7, 'Operation log', 'icon-history', 'auth/logs', NULL, NULL, NULL),
(8, 0, 7, 'Helpers', 'icon-cogs', '', NULL, '2023-09-26 09:40:55', '2023-09-26 09:40:55'),
(9, 8, 8, 'Scaffold', 'icon-keyboard', 'helpers/scaffold', NULL, '2023-09-26 09:40:55', '2023-09-26 09:40:55'),
(10, 8, 9, 'Database terminal', 'icon-database', 'helpers/terminal/database', NULL, '2023-09-26 09:40:55', '2023-09-26 09:40:55'),
(11, 8, 10, 'Laravel artisan', 'icon-terminal', 'helpers/terminal/artisan', NULL, '2023-09-26 09:40:56', '2023-09-26 09:40:56'),
(12, 8, 11, 'Routes', 'icon-list-alt', 'helpers/routes', NULL, '2023-09-26 09:40:57', '2023-09-26 09:40:57'),
(13, 0, 11, 'Customers', 'icon-users', 'customers', NULL, '2023-09-26 09:50:48', '2023-10-26 04:02:19'),
(14, 0, 11, 'Accounts', 'icon-donate', 'accounts', NULL, '2023-09-26 10:52:32', '2023-10-26 04:01:25'),
(15, 0, 11, 'Credit_-cards', 'icon-address-card', 'credit_-cards', NULL, '2023-09-26 11:00:13', '2023-10-26 04:01:55'),
(16, 0, 11, 'Report-transactions', 'icon-align-justify', 'report-transactions', NULL, '2023-09-26 14:23:56', '2023-10-26 04:02:42'),
(17, 0, 11, 'Transactions', 'icon-hand-holding-usd', 'transactions', NULL, '2023-10-12 16:53:16', '2023-10-26 04:03:19'),
(18, 0, 0, 'predictions', 'icon-balance-scale', 'predict', '*', '2023-10-24 08:39:08', '2023-10-26 03:52:08');

-- --------------------------------------------------------

--
-- Table structure for table `admin_operation_log`
--

CREATE TABLE `admin_operation_log` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL,
  `path` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `method` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ip` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `input` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `admin_operation_log`
--

INSERT INTO `admin_operation_log` (`id`, `user_id`, `path`, `method`, `ip`, `input`, `created_at`, `updated_at`) VALUES
(1, 1, 'admin', 'GET', '127.0.0.1', '[]', '2023-09-26 09:37:17', '2023-09-26 09:37:17'),
(2, 1, 'admin/auth/users', 'GET', '127.0.0.1', '[]', '2023-09-26 09:37:36', '2023-09-26 09:37:36'),
(3, 1, 'admin/auth/roles', 'GET', '127.0.0.1', '[]', '2023-09-26 09:37:48', '2023-09-26 09:37:48'),
(4, 1, 'admin/auth/roles', 'GET', '127.0.0.1', '[]', '2023-09-26 09:42:22', '2023-09-26 09:42:22'),
(5, 1, 'admin/helpers/scaffold', 'GET', '127.0.0.1', '[]', '2023-09-26 09:42:29', '2023-09-26 09:42:29'),
(6, 1, 'admin/helpers/scaffold', 'POST', '127.0.0.1', '{\"table_name\":\"user\",\"model_name\":\"App\\\\Models\\\\user\",\"controller_name\":\"App\\\\Admin\\\\Controllers\\\\user\",\"create\":[\"migration\",\"model\",\"controller\",\"migrate\",\"menu_item\"],\"fields\":[{\"name\":\"Email\",\"type\":\"string\",\"key\":\"unique\",\"default\":null,\"comment\":null},{\"name\":\"Password\",\"type\":\"string\",\"key\":null,\"default\":null,\"comment\":null},{\"name\":\"Account_no\",\"type\":\"integer\",\"key\":null,\"default\":null,\"comment\":null},{\"name\":\"Created_at\",\"type\":\"dateTime\",\"key\":null,\"default\":null,\"comment\":null}],\"timestamps\":\"on\",\"primary_key\":\"user_id\",\"_token\":\"wSpWB49CUoKJB8TxDDQDLMgy1hM9EUfkF2hOnJjc\"}', '2023-09-26 09:44:50', '2023-09-26 09:44:50'),
(7, 1, 'admin/helpers/scaffold', 'GET', '127.0.0.1', '[]', '2023-09-26 09:44:51', '2023-09-26 09:44:51'),
(8, 1, 'admin/helpers/scaffold', 'POST', '127.0.0.1', '{\"table_name\":\"customer\",\"model_name\":\"App\\\\Models\\\\customer\",\"controller_name\":\"App\\\\Admin\\\\Controllers\\\\customer\",\"create\":[\"migration\",\"model\",\"controller\",\"migrate\",\"menu_item\"],\"fields\":[{\"name\":\"Email\",\"type\":\"string\",\"key\":\"unique\",\"default\":null,\"comment\":null},{\"name\":\"Password\",\"type\":\"string\",\"key\":null,\"default\":null,\"comment\":null},{\"name\":\"Account_no\",\"type\":\"integer\",\"key\":null,\"default\":null,\"comment\":null},{\"name\":\"Created_at\",\"type\":\"dateTime\",\"key\":null,\"default\":null,\"comment\":null}],\"timestamps\":\"on\",\"primary_key\":\"id\",\"_token\":\"wSpWB49CUoKJB8TxDDQDLMgy1hM9EUfkF2hOnJjc\"}', '2023-09-26 09:45:17', '2023-09-26 09:45:17'),
(9, 1, 'admin/helpers/scaffold', 'GET', '127.0.0.1', '[]', '2023-09-26 09:45:18', '2023-09-26 09:45:18'),
(10, 1, 'admin/helpers/scaffold', 'POST', '127.0.0.1', '{\"table_name\":\"customer\",\"model_name\":\"App\\\\Models\\\\customer\",\"controller_name\":\"App\\\\Admin\\\\Controllers\\\\customer\",\"create\":[\"migration\",\"model\",\"controller\",\"migrate\",\"menu_item\"],\"fields\":[{\"name\":\"Email\",\"type\":\"string\",\"key\":\"unique\",\"default\":null,\"comment\":null},{\"name\":\"Password\",\"type\":\"string\",\"key\":null,\"default\":null,\"comment\":null},{\"name\":\"Account_no\",\"type\":\"integer\",\"key\":null,\"default\":null,\"comment\":null}],\"timestamps\":\"on\",\"primary_key\":\"customer_id\",\"_token\":\"wSpWB49CUoKJB8TxDDQDLMgy1hM9EUfkF2hOnJjc\"}', '2023-09-26 09:50:39', '2023-09-26 09:50:39'),
(11, 1, 'admin/helpers/scaffold', 'GET', '127.0.0.1', '[]', '2023-09-26 09:50:48', '2023-09-26 09:50:48'),
(12, 1, 'admin/helpers/scaffold', 'GET', '127.0.0.1', '[]', '2023-09-26 10:17:20', '2023-09-26 10:17:20'),
(13, 1, 'admin/customers', 'GET', '127.0.0.1', '[]', '2023-09-26 10:20:47', '2023-09-26 10:20:47'),
(14, 1, 'admin/customers', 'GET', '127.0.0.1', '[]', '2023-09-26 10:34:27', '2023-09-26 10:34:27'),
(15, 1, 'admin', 'GET', '127.0.0.1', '[]', '2023-09-26 10:35:55', '2023-09-26 10:35:55'),
(16, 1, 'admin/customers', 'GET', '127.0.0.1', '[]', '2023-09-26 10:37:58', '2023-09-26 10:37:58'),
(17, 1, 'admin', 'GET', '127.0.0.1', '[]', '2023-09-26 10:39:00', '2023-09-26 10:39:00'),
(18, 1, 'admin/helpers/scaffold', 'GET', '127.0.0.1', '[]', '2023-09-26 10:39:13', '2023-09-26 10:39:13'),
(19, 1, 'admin/helpers/routes', 'GET', '127.0.0.1', '[]', '2023-09-26 10:39:18', '2023-09-26 10:39:18'),
(20, 1, 'admin/helpers/routes', 'GET', '127.0.0.1', '[]', '2023-09-26 10:39:22', '2023-09-26 10:39:22'),
(21, 1, 'admin/helpers/routes', 'GET', '127.0.0.1', '[]', '2023-09-26 10:39:23', '2023-09-26 10:39:23'),
(22, 1, 'admin/helpers/terminal/artisan', 'GET', '127.0.0.1', '[]', '2023-09-26 10:39:26', '2023-09-26 10:39:26'),
(23, 1, 'admin/helpers/routes', 'GET', '127.0.0.1', '[]', '2023-09-26 10:39:32', '2023-09-26 10:39:32'),
(24, 1, 'admin/helpers/terminal/database', 'GET', '127.0.0.1', '[]', '2023-09-26 10:39:33', '2023-09-26 10:39:33'),
(25, 1, 'admin/helpers/scaffold', 'GET', '127.0.0.1', '[]', '2023-09-26 10:39:36', '2023-09-26 10:39:36'),
(26, 1, 'admin/auth/users', 'GET', '127.0.0.1', '[]', '2023-09-26 10:39:40', '2023-09-26 10:39:40'),
(27, 1, 'admin/auth/roles', 'GET', '127.0.0.1', '[]', '2023-09-26 10:39:45', '2023-09-26 10:39:45'),
(28, 1, 'admin/helpers/scaffold', 'GET', '127.0.0.1', '[]', '2023-09-26 10:45:03', '2023-09-26 10:45:03'),
(29, 1, 'admin/helpers/terminal/database', 'GET', '127.0.0.1', '[]', '2023-09-26 10:45:10', '2023-09-26 10:45:10'),
(30, 1, 'admin/helpers/scaffold', 'GET', '127.0.0.1', '[]', '2023-09-26 10:45:16', '2023-09-26 10:45:16'),
(31, 1, 'admin/helpers/scaffold', 'POST', '127.0.0.1', '{\"table_name\":\"Accounts\",\"model_name\":\"App\\\\Models\\\\accounts\",\"controller_name\":\"App\\\\Admin\\\\Controllers\\\\accounts_controller\",\"create\":[\"migration\",\"model\",\"controller\",\"migrate\",\"menu_item\"],\"fields\":[{\"name\":\"credit_card_id\",\"type\":\"bigInteger\",\"key\":null,\"default\":null,\"comment\":null},{\"name\":\"Customer_id\",\"type\":\"integer\",\"key\":null,\"default\":null,\"comment\":null},{\"name\":\"Account_no\",\"type\":\"bigInteger\",\"key\":null,\"default\":null,\"comment\":null},{\"name\":\"Amount\",\"type\":\"integer\",\"key\":null,\"default\":null,\"comment\":null}],\"timestamps\":\"on\",\"primary_key\":\"Account_id\",\"_token\":\"wSpWB49CUoKJB8TxDDQDLMgy1hM9EUfkF2hOnJjc\"}', '2023-09-26 10:52:30', '2023-09-26 10:52:30'),
(32, 1, 'admin/helpers/scaffold', 'GET', '127.0.0.1', '[]', '2023-09-26 10:52:32', '2023-09-26 10:52:32'),
(33, 1, 'admin/helpers/scaffold', 'GET', '127.0.0.1', '[]', '2023-09-26 10:53:40', '2023-09-26 10:53:40'),
(34, 1, 'admin/accounts', 'GET', '127.0.0.1', '[]', '2023-09-26 10:53:45', '2023-09-26 10:53:45'),
(35, 1, 'admin/customers', 'GET', '127.0.0.1', '[]', '2023-09-26 10:54:22', '2023-09-26 10:54:22'),
(36, 1, 'admin/accounts', 'GET', '127.0.0.1', '[]', '2023-09-26 10:54:27', '2023-09-26 10:54:27'),
(37, 1, 'admin/customers', 'GET', '127.0.0.1', '[]', '2023-09-26 10:54:29', '2023-09-26 10:54:29'),
(38, 1, 'admin/accounts', 'GET', '127.0.0.1', '[]', '2023-09-26 10:54:30', '2023-09-26 10:54:30'),
(39, 1, 'admin/customers', 'GET', '127.0.0.1', '[]', '2023-09-26 10:54:33', '2023-09-26 10:54:33'),
(40, 1, 'admin/customers', 'GET', '127.0.0.1', '[]', '2023-09-26 10:56:38', '2023-09-26 10:56:38'),
(41, 1, 'admin/accounts', 'GET', '127.0.0.1', '[]', '2023-09-26 10:56:44', '2023-09-26 10:56:44'),
(42, 1, 'admin/customers', 'GET', '127.0.0.1', '[]', '2023-09-26 10:56:48', '2023-09-26 10:56:48'),
(43, 1, 'admin/customers/create', 'GET', '127.0.0.1', '[]', '2023-09-26 10:56:49', '2023-09-26 10:56:49'),
(44, 1, 'admin/customers', 'POST', '127.0.0.1', '{\"Email\":\"test@test.com\",\"Password\":\"12345678\",\"Account_no\":\"1\",\"_token\":\"wSpWB49CUoKJB8TxDDQDLMgy1hM9EUfkF2hOnJjc\"}', '2023-09-26 10:57:23', '2023-09-26 10:57:23'),
(45, 1, 'admin/customers', 'GET', '127.0.0.1', '[]', '2023-09-26 10:57:25', '2023-09-26 10:57:25'),
(46, 1, 'admin/accounts', 'GET', '127.0.0.1', '[]', '2023-09-26 10:57:42', '2023-09-26 10:57:42'),
(47, 1, 'admin/helpers/scaffold', 'GET', '127.0.0.1', '[]', '2023-09-26 10:57:51', '2023-09-26 10:57:51'),
(48, 1, 'admin/helpers/scaffold', 'POST', '127.0.0.1', '{\"table_name\":\"Credit_Card\",\"model_name\":\"App\\\\Models\\\\credit_Card\",\"controller_name\":\"App\\\\Admin\\\\Controllers\\\\card_Controller\",\"create\":[\"migration\",\"model\",\"controller\",\"migrate\",\"menu_item\"],\"fields\":[{\"name\":\"card_no\",\"type\":\"integer\",\"key\":null,\"default\":null,\"comment\":null},{\"name\":\"Account_id\",\"type\":\"integer\",\"key\":null,\"default\":null,\"comment\":null},{\"name\":\"Amount\",\"type\":\"bigInteger\",\"key\":null,\"default\":null,\"comment\":null},{\"name\":\"CVV\",\"type\":\"integer\",\"key\":null,\"default\":null,\"comment\":null}],\"timestamps\":\"on\",\"primary_key\":\"card_id\",\"_token\":\"wSpWB49CUoKJB8TxDDQDLMgy1hM9EUfkF2hOnJjc\"}', '2023-09-26 11:00:07', '2023-09-26 11:00:07'),
(49, 1, 'admin/helpers/scaffold', 'GET', '127.0.0.1', '[]', '2023-09-26 11:00:15', '2023-09-26 11:00:15'),
(50, 1, 'admin/helpers/scaffold', 'GET', '127.0.0.1', '[]', '2023-09-26 11:00:20', '2023-09-26 11:00:20'),
(51, 1, 'admin/helpers/scaffold', 'GET', '127.0.0.1', '[]', '2023-09-26 11:01:32', '2023-09-26 11:01:32'),
(52, 1, 'admin/accounts', 'GET', '127.0.0.1', '[]', '2023-09-26 11:01:35', '2023-09-26 11:01:35'),
(53, 1, 'admin/helpers/scaffold', 'GET', '127.0.0.1', '[]', '2023-09-26 11:01:37', '2023-09-26 11:01:37'),
(54, 1, 'admin/helpers/scaffold', 'GET', '127.0.0.1', '[]', '2023-09-26 11:02:45', '2023-09-26 11:02:45'),
(55, 1, 'admin/helpers/scaffold', 'GET', '127.0.0.1', '[]', '2023-09-26 11:03:01', '2023-09-26 11:03:01'),
(56, 1, 'admin/credit_-cards', 'GET', '127.0.0.1', '[]', '2023-09-26 11:03:04', '2023-09-26 11:03:04'),
(57, 1, 'admin/accounts', 'GET', '127.0.0.1', '[]', '2023-09-26 11:05:23', '2023-09-26 11:05:23'),
(58, 1, 'admin/customers', 'GET', '127.0.0.1', '[]', '2023-09-26 11:05:26', '2023-09-26 11:05:26'),
(59, 1, 'admin/accounts', 'GET', '127.0.0.1', '[]', '2023-09-26 11:05:28', '2023-09-26 11:05:28'),
(60, 1, 'admin/customers', 'GET', '127.0.0.1', '[]', '2023-09-26 11:05:32', '2023-09-26 11:05:32'),
(61, 1, 'admin', 'GET', '127.0.0.1', '[]', '2023-09-26 11:05:46', '2023-09-26 11:05:46'),
(62, 1, 'admin/auth/users', 'GET', '127.0.0.1', '[]', '2023-09-26 11:05:49', '2023-09-26 11:05:49'),
(63, 1, 'admin/auth/roles', 'GET', '127.0.0.1', '[]', '2023-09-26 11:05:56', '2023-09-26 11:05:56'),
(64, 1, 'admin/auth/roles/1/edit', 'GET', '127.0.0.1', '[]', '2023-09-26 11:06:11', '2023-09-26 11:06:11'),
(65, 1, 'admin/auth/roles/1', 'PUT', '127.0.0.1', '{\"slug\":\"Super_admin\",\"name\":\"Administrator\",\"permissions\":[\"1\",null],\"_token\":\"wSpWB49CUoKJB8TxDDQDLMgy1hM9EUfkF2hOnJjc\",\"_method\":\"PUT\"}', '2023-09-26 11:06:56', '2023-09-26 11:06:56'),
(66, 1, 'admin/auth/roles', 'GET', '127.0.0.1', '[]', '2023-09-26 11:06:59', '2023-09-26 11:06:59'),
(67, 1, 'admin/auth/users', 'GET', '127.0.0.1', '[]', '2023-09-26 11:07:06', '2023-09-26 11:07:06'),
(68, 1, 'admin/auth/users/create', 'GET', '127.0.0.1', '[]', '2023-09-26 11:07:10', '2023-09-26 11:07:10'),
(69, 1, 'admin/auth/roles', 'GET', '127.0.0.1', '[]', '2023-09-26 11:07:45', '2023-09-26 11:07:45'),
(70, 1, 'admin/auth/roles/create', 'GET', '127.0.0.1', '[]', '2023-09-26 11:07:49', '2023-09-26 11:07:49'),
(71, 1, 'admin/auth/roles', 'POST', '127.0.0.1', '{\"slug\":\"Minor\",\"name\":\"Admin\",\"permissions\":[\"2\",\"3\",\"6\",null],\"_token\":\"wSpWB49CUoKJB8TxDDQDLMgy1hM9EUfkF2hOnJjc\"}', '2023-09-26 11:08:54', '2023-09-26 11:08:54'),
(72, 1, 'admin/auth/roles', 'GET', '127.0.0.1', '[]', '2023-09-26 11:08:56', '2023-09-26 11:08:56'),
(73, 1, 'admin/auth/roles/1/edit', 'GET', '127.0.0.1', '[]', '2023-09-26 11:09:09', '2023-09-26 11:09:09'),
(74, 1, 'admin/auth/roles/1', 'PUT', '127.0.0.1', '{\"slug\":\"Super_admin\",\"name\":\"super_Administrator\",\"permissions\":[\"1\",null],\"_token\":\"wSpWB49CUoKJB8TxDDQDLMgy1hM9EUfkF2hOnJjc\",\"_method\":\"PUT\"}', '2023-09-26 11:09:19', '2023-09-26 11:09:19'),
(75, 1, 'admin/auth/roles', 'GET', '127.0.0.1', '[]', '2023-09-26 11:09:21', '2023-09-26 11:09:21'),
(76, 1, 'admin/auth/logout', 'GET', '127.0.0.1', '[]', '2023-09-26 11:09:32', '2023-09-26 11:09:32'),
(77, 1, 'admin', 'GET', '127.0.0.1', '[]', '2023-09-26 11:10:05', '2023-09-26 11:10:05'),
(78, 1, 'admin/auth/users', 'GET', '127.0.0.1', '[]', '2023-09-26 11:10:11', '2023-09-26 11:10:11'),
(79, 1, 'admin/auth/users/create', 'GET', '127.0.0.1', '[]', '2023-09-26 11:10:15', '2023-09-26 11:10:15'),
(80, 1, 'admin/auth/users', 'POST', '127.0.0.1', '{\"username\":\"admin\",\"name\":\"Ben\",\"password\":\"*****-filtered-out-*****\",\"password_confirmation\":\"12345\",\"roles\":[\"2\",null],\"search_terms\":null,\"permissions\":[null],\"_token\":\"bZYCe7M5QHKFKWR4rxj56SeNKJchUwTRV555kXZr\"}', '2023-09-26 11:10:50', '2023-09-26 11:10:50'),
(81, 1, 'admin/auth/users/create', 'GET', '127.0.0.1', '[]', '2023-09-26 11:10:50', '2023-09-26 11:10:50'),
(82, 1, 'admin/auth/users', 'POST', '127.0.0.1', '{\"username\":\"Ben\",\"name\":\"Ben\",\"password\":\"*****-filtered-out-*****\",\"password_confirmation\":\"12345\",\"roles\":[\"2\",null],\"search_terms\":null,\"permissions\":[null],\"_token\":\"bZYCe7M5QHKFKWR4rxj56SeNKJchUwTRV555kXZr\"}', '2023-09-26 11:11:00', '2023-09-26 11:11:00'),
(83, 1, 'admin/auth/users', 'GET', '127.0.0.1', '[]', '2023-09-26 11:11:05', '2023-09-26 11:11:05'),
(84, 1, 'admin/auth/logout', 'GET', '127.0.0.1', '[]', '2023-09-26 11:11:13', '2023-09-26 11:11:13'),
(85, 2, 'admin', 'GET', '127.0.0.1', '[]', '2023-09-26 11:11:24', '2023-09-26 11:11:24'),
(86, 2, 'admin/customers', 'GET', '127.0.0.1', '[]', '2023-09-26 11:11:35', '2023-09-26 11:11:35'),
(87, 2, 'admin/accounts', 'GET', '127.0.0.1', '[]', '2023-09-26 11:11:40', '2023-09-26 11:11:40'),
(88, 2, 'admin/credit_-cards', 'GET', '127.0.0.1', '[]', '2023-09-26 11:11:41', '2023-09-26 11:11:41'),
(89, 2, 'admin/auth/logout', 'GET', '127.0.0.1', '[]', '2023-09-26 11:11:46', '2023-09-26 11:11:46'),
(90, 1, 'admin', 'GET', '127.0.0.1', '[]', '2023-09-26 11:11:54', '2023-09-26 11:11:54'),
(91, 1, 'admin/auth/users', 'GET', '127.0.0.1', '[]', '2023-09-26 11:12:04', '2023-09-26 11:12:04'),
(92, 1, 'admin', 'GET', '127.0.0.1', '[]', '2023-09-26 11:12:20', '2023-09-26 11:12:20'),
(93, 1, 'admin/auth/roles', 'GET', '127.0.0.1', '[]', '2023-09-26 11:12:22', '2023-09-26 11:12:22'),
(94, 1, 'admin/auth/roles/2/edit', 'GET', '127.0.0.1', '[]', '2023-09-26 11:12:25', '2023-09-26 11:12:25'),
(95, 1, 'admin/auth/roles/2', 'PUT', '127.0.0.1', '{\"slug\":\"Minor\",\"name\":\"Admin\",\"permissions\":[\"2\",\"3\",\"5\",\"6\",null],\"_token\":\"FhQH3oq3wUQFa2RNJaMOkJULBeFjgk8C8g6g26A4\",\"_method\":\"PUT\"}', '2023-09-26 11:13:34', '2023-09-26 11:13:34'),
(96, 1, 'admin/auth/roles', 'GET', '127.0.0.1', '[]', '2023-09-26 11:13:35', '2023-09-26 11:13:35'),
(97, 1, 'admin/auth/roles', 'GET', '127.0.0.1', '[]', '2023-09-26 11:13:45', '2023-09-26 11:13:45'),
(98, 1, 'admin/auth/logout', 'GET', '127.0.0.1', '[]', '2023-09-26 11:13:55', '2023-09-26 11:13:55'),
(99, 2, 'admin', 'GET', '127.0.0.1', '[]', '2023-09-26 11:14:09', '2023-09-26 11:14:09'),
(100, 2, 'admin/customers', 'GET', '127.0.0.1', '[]', '2023-09-26 11:14:16', '2023-09-26 11:14:16'),
(101, 2, 'admin/accounts', 'GET', '127.0.0.1', '[]', '2023-09-26 11:14:18', '2023-09-26 11:14:18'),
(102, 2, 'admin/credit_-cards', 'GET', '127.0.0.1', '[]', '2023-09-26 11:14:19', '2023-09-26 11:14:19'),
(103, 2, 'admin/helpers/terminal/database', 'GET', '127.0.0.1', '[]', '2023-09-26 11:14:24', '2023-09-26 11:14:24'),
(104, 2, 'admin/helpers/scaffold', 'GET', '127.0.0.1', '[]', '2023-09-26 11:14:26', '2023-09-26 11:14:26'),
(105, 2, 'admin/auth/roles', 'GET', '127.0.0.1', '[]', '2023-09-26 11:14:35', '2023-09-26 11:14:35'),
(106, 2, 'admin/auth/roles/2/edit', 'GET', '127.0.0.1', '[]', '2023-09-26 11:14:38', '2023-09-26 11:14:38'),
(107, 2, 'admin/auth/roles', 'GET', '127.0.0.1', '[]', '2023-09-26 11:14:43', '2023-09-26 11:14:43'),
(108, 2, 'admin/auth/roles/2/edit', 'GET', '127.0.0.1', '[]', '2023-09-26 11:14:46', '2023-09-26 11:14:46'),
(109, 2, 'admin/auth/logout', 'GET', '127.0.0.1', '[]', '2023-09-26 11:14:51', '2023-09-26 11:14:51'),
(110, 1, 'admin', 'GET', '127.0.0.1', '[]', '2023-09-26 11:15:01', '2023-09-26 11:15:01'),
(111, 1, 'admin/auth/users', 'GET', '127.0.0.1', '[]', '2023-09-26 11:15:07', '2023-09-26 11:15:07'),
(112, 1, 'admin/auth/users/2/edit', 'GET', '127.0.0.1', '[]', '2023-09-26 11:15:10', '2023-09-26 11:15:10'),
(113, 1, 'admin/auth/users', 'GET', '127.0.0.1', '[]', '2023-09-26 11:15:14', '2023-09-26 11:15:14'),
(114, 1, 'admin/auth/roles', 'GET', '127.0.0.1', '[]', '2023-09-26 11:15:17', '2023-09-26 11:15:17'),
(115, 1, 'admin/auth/roles/2/edit', 'GET', '127.0.0.1', '[]', '2023-09-26 11:15:26', '2023-09-26 11:15:26'),
(116, 1, 'admin/auth/permissions', 'GET', '127.0.0.1', '[]', '2023-09-26 11:15:38', '2023-09-26 11:15:38'),
(117, 1, 'admin/auth/roles', 'GET', '127.0.0.1', '[]', '2023-09-26 11:16:23', '2023-09-26 11:16:23'),
(118, 1, 'admin/auth/roles/2/edit', 'GET', '127.0.0.1', '[]', '2023-09-26 11:16:31', '2023-09-26 11:16:31'),
(119, 1, 'admin/auth/permissions', 'GET', '127.0.0.1', '[]', '2023-09-26 11:16:52', '2023-09-26 11:16:52'),
(120, 1, 'admin/auth/roles', 'GET', '127.0.0.1', '[]', '2023-09-26 11:17:25', '2023-09-26 11:17:25'),
(121, 1, 'admin/auth/roles/2/edit', 'GET', '127.0.0.1', '[]', '2023-09-26 11:17:28', '2023-09-26 11:17:28'),
(122, 1, 'admin/auth/users', 'GET', '127.0.0.1', '[]', '2023-09-26 11:17:32', '2023-09-26 11:17:32'),
(123, 1, 'admin/auth/users/2/edit', 'GET', '127.0.0.1', '[]', '2023-09-26 11:17:34', '2023-09-26 11:17:34'),
(124, 1, 'admin/auth/roles', 'GET', '127.0.0.1', '[]', '2023-09-26 11:18:31', '2023-09-26 11:18:31'),
(125, 1, 'admin/auth/roles/2/edit', 'GET', '127.0.0.1', '[]', '2023-09-26 11:18:34', '2023-09-26 11:18:34'),
(126, 1, 'admin/auth/roles/2', 'PUT', '127.0.0.1', '{\"slug\":\"Minor\",\"name\":\"Admin\",\"permissions\":[\"2\",\"3\",\"5\",null],\"_token\":\"vjNUEeMZrs3fYkt5udpF5hy9m5g3U0gkOof5OoHm\",\"_method\":\"PUT\"}', '2023-09-26 11:18:43', '2023-09-26 11:18:43'),
(127, 1, 'admin/auth/roles', 'GET', '127.0.0.1', '[]', '2023-09-26 11:18:44', '2023-09-26 11:18:44'),
(128, 1, 'admin/auth/permissions', 'GET', '127.0.0.1', '[]', '2023-09-26 11:18:47', '2023-09-26 11:18:47'),
(129, 1, 'admin/auth/users', 'GET', '127.0.0.1', '[]', '2023-09-26 11:18:49', '2023-09-26 11:18:49'),
(130, 1, 'admin/auth/users/2/edit', 'GET', '127.0.0.1', '[]', '2023-09-26 11:18:51', '2023-09-26 11:18:51'),
(131, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '[]', '2023-09-26 11:19:05', '2023-09-26 11:19:05'),
(132, 1, 'admin/auth/permissions', 'GET', '127.0.0.1', '[]', '2023-09-26 11:19:08', '2023-09-26 11:19:08'),
(133, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '[]', '2023-09-26 11:19:08', '2023-09-26 11:19:08'),
(134, 1, 'admin/auth/permissions', 'GET', '127.0.0.1', '[]', '2023-09-26 11:19:12', '2023-09-26 11:19:12'),
(135, 1, 'admin/auth/roles', 'GET', '127.0.0.1', '[]', '2023-09-26 11:19:47', '2023-09-26 11:19:47'),
(136, 1, 'admin/auth/users', 'GET', '127.0.0.1', '[]', '2023-09-26 11:19:49', '2023-09-26 11:19:49'),
(137, 1, 'admin/auth/users/2/edit', 'GET', '127.0.0.1', '[]', '2023-09-26 11:19:53', '2023-09-26 11:19:53'),
(138, 1, 'admin/auth/users/2', 'PUT', '127.0.0.1', '{\"username\":\"Ben\",\"name\":\"Ben\",\"password\":\"*****-filtered-out-*****\",\"password_confirmation\":\"$2y$10$lO01bv\\/mZcrA6av2godXfuGBn2Se3.INFEP3OE0afgjkuwlhZjMJ.\",\"search_terms\":null,\"roles\":[null],\"permissions\":[\"2\",\"3\",\"4\",null],\"_token\":\"vjNUEeMZrs3fYkt5udpF5hy9m5g3U0gkOof5OoHm\",\"_method\":\"PUT\"}', '2023-09-26 11:20:56', '2023-09-26 11:20:56'),
(139, 1, 'admin/auth/users', 'GET', '127.0.0.1', '[]', '2023-09-26 11:21:02', '2023-09-26 11:21:02'),
(140, 1, 'admin', 'GET', '127.0.0.1', '[]', '2023-09-26 11:21:12', '2023-09-26 11:21:12'),
(141, 1, 'admin/auth/logout', 'GET', '127.0.0.1', '[]', '2023-09-26 11:21:19', '2023-09-26 11:21:19'),
(142, 2, 'admin', 'GET', '127.0.0.1', '[]', '2023-09-26 11:21:34', '2023-09-26 11:21:34'),
(143, 2, 'admin/customers', 'GET', '127.0.0.1', '[]', '2023-09-26 11:21:40', '2023-09-26 11:21:40'),
(144, 2, 'admin/accounts', 'GET', '127.0.0.1', '[]', '2023-09-26 11:21:42', '2023-09-26 11:21:42'),
(145, 2, 'admin/credit_-cards', 'GET', '127.0.0.1', '[]', '2023-09-26 11:21:46', '2023-09-26 11:21:46'),
(146, 2, 'admin/helpers/scaffold', 'GET', '127.0.0.1', '[]', '2023-09-26 11:21:51', '2023-09-26 11:21:51'),
(147, 2, 'admin', 'GET', '127.0.0.1', '[]', '2023-09-26 11:21:55', '2023-09-26 11:21:55'),
(148, 2, 'admin/auth/logout', 'GET', '127.0.0.1', '[]', '2023-09-26 11:21:59', '2023-09-26 11:21:59'),
(149, 1, 'admin', 'GET', '127.0.0.1', '[]', '2023-09-26 11:22:08', '2023-09-26 11:22:08'),
(150, 1, 'admin/auth/permissions', 'GET', '127.0.0.1', '[]', '2023-09-26 11:22:17', '2023-09-26 11:22:17'),
(151, 1, 'admin/customers', 'GET', '127.0.0.1', '[]', '2023-09-26 11:22:45', '2023-09-26 11:22:45'),
(152, 1, 'admin/accounts', 'GET', '127.0.0.1', '[]', '2023-09-26 11:22:47', '2023-09-26 11:22:47'),
(153, 1, 'admin/credit_-cards', 'GET', '127.0.0.1', '[]', '2023-09-26 11:22:50', '2023-09-26 11:22:50'),
(154, 1, 'admin/helpers/routes', 'GET', '127.0.0.1', '[]', '2023-09-26 11:22:55', '2023-09-26 11:22:55'),
(155, 1, 'admin/auth/roles', 'GET', '127.0.0.1', '[]', '2023-09-26 11:23:01', '2023-09-26 11:23:01'),
(156, 1, 'admin/auth/permissions', 'GET', '127.0.0.1', '[]', '2023-09-26 11:23:07', '2023-09-26 11:23:07'),
(157, 1, 'admin/auth/permissions/create', 'GET', '127.0.0.1', '[]', '2023-09-26 11:23:10', '2023-09-26 11:23:10'),
(158, 1, 'admin/customers', 'GET', '127.0.0.1', '[]', '2023-09-26 11:23:47', '2023-09-26 11:23:47'),
(159, 1, 'admin/accounts', 'GET', '127.0.0.1', '[]', '2023-09-26 11:23:50', '2023-09-26 11:23:50'),
(160, 1, 'admin/credit_-cards', 'GET', '127.0.0.1', '[]', '2023-09-26 11:23:52', '2023-09-26 11:23:52'),
(161, 1, 'admin/auth/permissions', 'GET', '127.0.0.1', '[]', '2023-09-26 11:24:10', '2023-09-26 11:24:10'),
(162, 1, 'admin/customers', 'GET', '127.0.0.1', '[]', '2023-09-26 11:24:17', '2023-09-26 11:24:17'),
(163, 1, 'admin/auth/permissions', 'POST', '127.0.0.1', '{\"slug\":\"read\",\"name\":\"tables\",\"http_method\":[\"GET\",null],\"search_terms\":null,\"http_path\":\"\\/admin\\/customers\\r\\n\\/admin\\/accounts\\r\\n\\/admin\\/credit_-cards\",\"_token\":\"4Td0IPbfh75afkIbNMUX3WRvudbuAT8vlVeqy95I\"}', '2023-09-26 11:25:00', '2023-09-26 11:25:00'),
(164, 1, 'admin/auth/permissions', 'GET', '127.0.0.1', '[]', '2023-09-26 11:25:01', '2023-09-26 11:25:01'),
(165, 1, 'admin/auth/permissions/7/edit', 'GET', '127.0.0.1', '[]', '2023-09-26 11:25:13', '2023-09-26 11:25:13'),
(166, 1, 'admin/auth/permissions/7', 'PUT', '127.0.0.1', '{\"slug\":\"auth.Tables\",\"name\":\"tables\",\"http_method\":[\"GET\",\"POST\",\"PUT\",null],\"search_terms\":null,\"http_path\":\"\\/admin\\/customers\\r\\n\\/admin\\/accounts\\r\\n\\/admin\\/credit_-cards\",\"_token\":\"4Td0IPbfh75afkIbNMUX3WRvudbuAT8vlVeqy95I\",\"_method\":\"PUT\"}', '2023-09-26 11:25:35', '2023-09-26 11:25:35'),
(167, 1, 'admin/auth/permissions', 'GET', '127.0.0.1', '[]', '2023-09-26 11:25:36', '2023-09-26 11:25:36'),
(168, 1, 'admin/auth/permissions/7/edit', 'GET', '127.0.0.1', '[]', '2023-09-26 11:25:42', '2023-09-26 11:25:42'),
(169, 1, 'admin/auth/permissions/7', 'PUT', '127.0.0.1', '{\"slug\":\"auth.Tables\",\"name\":\"tables\",\"search_terms\":null,\"http_method\":[null],\"http_path\":\"\\/admin\\/customers\\r\\n\\/admin\\/accounts\\r\\n\\/admin\\/credit_-cards\",\"_token\":\"4Td0IPbfh75afkIbNMUX3WRvudbuAT8vlVeqy95I\",\"_method\":\"PUT\"}', '2023-09-26 11:25:53', '2023-09-26 11:25:53'),
(170, 1, 'admin/auth/permissions', 'GET', '127.0.0.1', '[]', '2023-09-26 11:25:54', '2023-09-26 11:25:54'),
(171, 1, 'admin/auth/roles', 'GET', '127.0.0.1', '[]', '2023-09-26 11:26:01', '2023-09-26 11:26:01'),
(172, 1, 'admin/auth/roles/2/edit', 'GET', '127.0.0.1', '[]', '2023-09-26 11:26:04', '2023-09-26 11:26:04'),
(173, 1, 'admin/auth/roles/2', 'PUT', '127.0.0.1', '{\"slug\":\"Minor\",\"name\":\"Admin\",\"permissions\":[\"2\",\"3\",\"5\",\"7\",null],\"_token\":\"4Td0IPbfh75afkIbNMUX3WRvudbuAT8vlVeqy95I\",\"_method\":\"PUT\"}', '2023-09-26 11:26:13', '2023-09-26 11:26:13'),
(174, 1, 'admin/auth/roles', 'GET', '127.0.0.1', '[]', '2023-09-26 11:26:14', '2023-09-26 11:26:14'),
(175, 1, 'admin/auth/users', 'GET', '127.0.0.1', '[]', '2023-09-26 11:26:20', '2023-09-26 11:26:20'),
(176, 1, 'admin/auth/users/2/edit', 'GET', '127.0.0.1', '[]', '2023-09-26 11:26:23', '2023-09-26 11:26:23'),
(177, 1, 'admin/auth/users/2', 'PUT', '127.0.0.1', '{\"username\":\"Ben\",\"name\":\"Ben\",\"password\":\"*****-filtered-out-*****\",\"password_confirmation\":\"$2y$10$lO01bv\\/mZcrA6av2godXfuGBn2Se3.INFEP3OE0afgjkuwlhZjMJ.\",\"roles\":[\"2\",null],\"search_terms\":null,\"permissions\":[null],\"_token\":\"4Td0IPbfh75afkIbNMUX3WRvudbuAT8vlVeqy95I\",\"_method\":\"PUT\"}', '2023-09-26 11:26:30', '2023-09-26 11:26:30'),
(178, 1, 'admin/auth/users', 'GET', '127.0.0.1', '[]', '2023-09-26 11:26:34', '2023-09-26 11:26:34'),
(179, 1, 'admin/auth/logout', 'GET', '127.0.0.1', '[]', '2023-09-26 11:26:42', '2023-09-26 11:26:42'),
(180, 2, 'admin', 'GET', '127.0.0.1', '[]', '2023-09-26 11:26:57', '2023-09-26 11:26:57'),
(181, 2, 'admin/customers', 'GET', '127.0.0.1', '[]', '2023-09-26 11:27:04', '2023-09-26 11:27:04'),
(182, 2, 'admin/accounts', 'GET', '127.0.0.1', '[]', '2023-09-26 11:27:07', '2023-09-26 11:27:07'),
(183, 2, 'admin/credit_-cards', 'GET', '127.0.0.1', '[]', '2023-09-26 11:27:09', '2023-09-26 11:27:09'),
(184, 2, 'admin/accounts', 'GET', '127.0.0.1', '[]', '2023-09-26 11:27:10', '2023-09-26 11:27:10'),
(185, 2, 'admin/customers', 'GET', '127.0.0.1', '[]', '2023-09-26 11:27:12', '2023-09-26 11:27:12'),
(186, 2, 'admin/credit_-cards', 'GET', '127.0.0.1', '[]', '2023-09-26 11:27:15', '2023-09-26 11:27:15'),
(187, 2, 'admin/auth/logout', 'GET', '127.0.0.1', '[]', '2023-09-26 11:27:18', '2023-09-26 11:27:18'),
(188, 1, 'admin', 'GET', '127.0.0.1', '[]', '2023-09-26 11:27:33', '2023-09-26 11:27:33'),
(189, 1, 'admin/credit_-cards', 'GET', '127.0.0.1', '[]', '2023-09-26 11:27:41', '2023-09-26 11:27:41'),
(190, 1, 'admin/auth/users', 'GET', '127.0.0.1', '[]', '2023-09-26 11:27:47', '2023-09-26 11:27:47'),
(191, 1, 'admin/auth/permissions', 'GET', '127.0.0.1', '[]', '2023-09-26 11:27:50', '2023-09-26 11:27:50'),
(192, 1, 'admin/auth/permissions/7/edit', 'GET', '127.0.0.1', '[]', '2023-09-26 11:28:06', '2023-09-26 11:28:06'),
(193, 1, 'admin/auth/permissions/7', 'PUT', '127.0.0.1', '{\"slug\":\"auth.Tables\",\"name\":\"tables\",\"search_terms\":null,\"http_method\":[null],\"http_path\":\"\\/customers\\r\\n\\/accounts\\r\\n\\/credit_-cards\",\"_token\":\"BqhkfQwO5vIYSY6tJeFBWEpYNtGXSwz755bgEDaz\",\"_method\":\"PUT\"}', '2023-09-26 11:28:24', '2023-09-26 11:28:24'),
(194, 1, 'admin/auth/permissions', 'GET', '127.0.0.1', '[]', '2023-09-26 11:28:25', '2023-09-26 11:28:25'),
(195, 1, 'admin/auth/logout', 'GET', '127.0.0.1', '[]', '2023-09-26 11:28:32', '2023-09-26 11:28:32'),
(196, 2, 'admin', 'GET', '127.0.0.1', '[]', '2023-09-26 11:28:46', '2023-09-26 11:28:46'),
(197, 2, 'admin/customers', 'GET', '127.0.0.1', '[]', '2023-09-26 11:28:52', '2023-09-26 11:28:52'),
(198, 2, 'admin/accounts', 'GET', '127.0.0.1', '[]', '2023-09-26 11:28:53', '2023-09-26 11:28:53'),
(199, 2, 'admin/credit_-cards', 'GET', '127.0.0.1', '[]', '2023-09-26 11:28:55', '2023-09-26 11:28:55'),
(200, 2, 'admin', 'GET', '127.0.0.1', '[]', '2023-09-26 14:02:59', '2023-09-26 14:02:59'),
(201, 2, 'admin/customers', 'GET', '127.0.0.1', '[]', '2023-09-26 14:03:17', '2023-09-26 14:03:17'),
(202, 2, 'admin/customers', 'GET', '127.0.0.1', '[]', '2023-09-26 14:04:37', '2023-09-26 14:04:37'),
(203, 2, 'admin/customers/1/edit', 'GET', '127.0.0.1', '[]', '2023-09-26 14:04:43', '2023-09-26 14:04:43'),
(204, 2, 'admin/accounts', 'GET', '127.0.0.1', '[]', '2023-09-26 14:04:52', '2023-09-26 14:04:52'),
(205, 2, 'admin/accounts/create', 'GET', '127.0.0.1', '[]', '2023-09-26 14:04:55', '2023-09-26 14:04:55'),
(206, 2, 'admin/credit_-cards', 'GET', '127.0.0.1', '[]', '2023-09-26 14:04:57', '2023-09-26 14:04:57'),
(207, 2, 'admin/credit_-cards/create', 'GET', '127.0.0.1', '[]', '2023-09-26 14:05:29', '2023-09-26 14:05:29'),
(208, 2, 'admin', 'GET', '127.0.0.1', '[]', '2023-09-26 14:05:32', '2023-09-26 14:05:32'),
(209, 2, 'admin/auth/logout', 'GET', '127.0.0.1', '[]', '2023-09-26 14:05:59', '2023-09-26 14:05:59'),
(210, 1, 'admin', 'GET', '127.0.0.1', '[]', '2023-09-26 14:06:09', '2023-09-26 14:06:09'),
(211, 1, 'admin/accounts', 'GET', '127.0.0.1', '[]', '2023-09-26 14:06:20', '2023-09-26 14:06:20'),
(212, 1, 'admin/customers', 'GET', '127.0.0.1', '[]', '2023-09-26 14:06:25', '2023-09-26 14:06:25'),
(213, 1, 'admin/auth/permissions', 'GET', '127.0.0.1', '[]', '2023-09-26 14:06:36', '2023-09-26 14:06:36'),
(214, 1, 'admin/auth/permissions/7/edit', 'GET', '127.0.0.1', '[]', '2023-09-26 14:06:47', '2023-09-26 14:06:47'),
(215, 1, 'admin/auth/permissions/7', 'PUT', '127.0.0.1', '{\"slug\":\"auth.Tables\",\"name\":\"tables\",\"search_terms\":null,\"http_method\":[null],\"http_path\":\"\\/customers\\r\\n\\/accounts\\r\\n\\/credit_-cards\\r\\n\\/accounts\\/create\",\"_token\":\"VMu5rlfXqbgMIaWJaFeSYDIUEh43Fpl2RhXP9cGi\",\"_method\":\"PUT\"}', '2023-09-26 14:07:09', '2023-09-26 14:07:09'),
(216, 1, 'admin/auth/permissions', 'GET', '127.0.0.1', '[]', '2023-09-26 14:07:09', '2023-09-26 14:07:09'),
(217, 1, 'admin/helpers/scaffold', 'GET', '127.0.0.1', '[]', '2023-09-26 14:07:35', '2023-09-26 14:07:35'),
(218, 1, 'admin/credit_-cards', 'GET', '127.0.0.1', '[]', '2023-09-26 14:21:15', '2023-09-26 14:21:15'),
(219, 1, 'admin/accounts', 'GET', '127.0.0.1', '[]', '2023-09-26 14:22:16', '2023-09-26 14:22:16'),
(220, 1, 'admin/customers', 'GET', '127.0.0.1', '[]', '2023-09-26 14:22:20', '2023-09-26 14:22:20'),
(221, 1, 'admin/helpers/scaffold', 'POST', '127.0.0.1', '{\"table_name\":\"Report_Transaction\",\"model_name\":\"App\\\\Models\\\\reportTransaction\",\"controller_name\":\"App\\\\Admin\\\\Controllers\\\\reportTransaction_controller\",\"create\":[\"migration\",\"model\",\"controller\",\"migrate\",\"menu_item\"],\"fields\":[{\"name\":\"transaction_id\",\"type\":\"integer\",\"key\":null,\"default\":null,\"comment\":null},{\"name\":\"card_id\",\"type\":\"integer\",\"key\":null,\"default\":null,\"comment\":null},{\"name\":\"details\",\"type\":\"longText\",\"key\":null,\"default\":null,\"comment\":null},{\"name\":\"is_resolved\",\"type\":\"boolean\",\"key\":null,\"default\":\"0\",\"comment\":null}],\"timestamps\":\"on\",\"primary_key\":\"report_id\",\"_token\":\"VMu5rlfXqbgMIaWJaFeSYDIUEh43Fpl2RhXP9cGi\"}', '2023-09-26 14:23:42', '2023-09-26 14:23:42'),
(222, 1, 'admin/helpers/scaffold', 'GET', '127.0.0.1', '[]', '2023-09-26 14:24:02', '2023-09-26 14:24:02'),
(223, 1, 'admin/helpers/scaffold', 'GET', '127.0.0.1', '[]', '2023-09-26 14:24:22', '2023-09-26 14:24:22'),
(224, 1, 'admin/report-transactions', 'GET', '127.0.0.1', '[]', '2023-09-26 14:24:29', '2023-09-26 14:24:29'),
(225, 1, 'admin/auth/permissions', 'GET', '127.0.0.1', '[]', '2023-09-26 14:24:39', '2023-09-26 14:24:39'),
(226, 1, 'admin/report-transactions', 'GET', '127.0.0.1', '[]', '2023-09-26 14:24:45', '2023-09-26 14:24:45'),
(227, 1, 'admin/report-transactions/create', 'GET', '127.0.0.1', '[]', '2023-09-26 14:24:47', '2023-09-26 14:24:47'),
(228, 1, 'admin/auth/permissions', 'GET', '127.0.0.1', '[]', '2023-09-26 14:25:00', '2023-09-26 14:25:00'),
(229, 1, 'admin/auth/permissions/7/edit', 'GET', '127.0.0.1', '[]', '2023-09-26 14:25:06', '2023-09-26 14:25:06'),
(230, 1, 'admin/auth/permissions/7', 'PUT', '127.0.0.1', '{\"slug\":\"auth.Tables\",\"name\":\"tables\",\"search_terms\":null,\"http_method\":[null],\"http_path\":\"\\/customers\\r\\n\\/accounts\\r\\n\\/credit_-cards\\r\\n\\/accounts\\/create\\r\\n\\/report-transactions\\r\\n\\/report-transactions\\/create\",\"_token\":\"VMu5rlfXqbgMIaWJaFeSYDIUEh43Fpl2RhXP9cGi\",\"_method\":\"PUT\"}', '2023-09-26 14:25:23', '2023-09-26 14:25:23'),
(231, 1, 'admin/auth/permissions', 'GET', '127.0.0.1', '[]', '2023-09-26 14:25:27', '2023-09-26 14:25:27'),
(232, 1, 'admin/auth/permissions/7/edit', 'GET', '127.0.0.1', '[]', '2023-09-26 14:25:32', '2023-09-26 14:25:32'),
(233, 1, 'admin/auth/permissions/7', 'PUT', '127.0.0.1', '{\"slug\":\"auth.Tables\",\"name\":\"Admin CRUD\",\"search_terms\":null,\"http_method\":[null],\"http_path\":\"\\/customers\\r\\n\\/accounts\\r\\n\\/credit_-cards\\r\\n\\/accounts\\/create\\r\\n\\/report-transactions\\r\\n\\/report-transactions\\/create\",\"_token\":\"VMu5rlfXqbgMIaWJaFeSYDIUEh43Fpl2RhXP9cGi\",\"_method\":\"PUT\"}', '2023-09-26 14:25:48', '2023-09-26 14:25:48'),
(234, 1, 'admin/auth/permissions', 'GET', '127.0.0.1', '[]', '2023-09-26 14:25:49', '2023-09-26 14:25:49'),
(235, 1, 'admin/auth/logout', 'GET', '127.0.0.1', '[]', '2023-09-26 14:25:59', '2023-09-26 14:25:59'),
(236, 2, 'admin', 'GET', '127.0.0.1', '[]', '2023-09-26 14:26:15', '2023-09-26 14:26:15'),
(237, 2, 'admin/report-transactions', 'GET', '127.0.0.1', '[]', '2023-09-26 14:26:19', '2023-09-26 14:26:19'),
(238, 2, 'admin/report-transactions/create', 'GET', '127.0.0.1', '[]', '2023-09-26 14:26:21', '2023-09-26 14:26:21'),
(239, 2, 'admin/report-transactions', 'POST', '127.0.0.1', '{\"transaction_id\":\"1\",\"card_id\":\"1\",\"details\":\"Sent X amount, received Y amount\",\"is_resolved\":\"off\",\"_token\":\"6INmmbtrJH2aJzi5JqY7EritJrtFM1eZeVA5QkrT\"}', '2023-09-26 14:27:07', '2023-09-26 14:27:07'),
(240, 2, 'admin/report-transactions', 'GET', '127.0.0.1', '[]', '2023-09-26 14:27:08', '2023-09-26 14:27:08'),
(241, 2, 'admin/report-transactions/1', 'GET', '127.0.0.1', '[]', '2023-09-26 14:27:15', '2023-09-26 14:27:15'),
(242, 2, 'admin/report-transactions', 'GET', '127.0.0.1', '[]', '2023-09-26 14:27:18', '2023-09-26 14:27:18'),
(243, 2, 'admin/report-transactions/1/edit', 'GET', '127.0.0.1', '[]', '2023-09-26 14:27:25', '2023-09-26 14:27:25'),
(244, 2, 'admin/report-transactions', 'GET', '127.0.0.1', '[]', '2023-09-26 14:27:28', '2023-09-26 14:27:28'),
(245, 2, 'admin/auth/logout', 'GET', '127.0.0.1', '[]', '2023-09-26 14:27:38', '2023-09-26 14:27:38'),
(246, 1, 'admin', 'GET', '127.0.0.1', '[]', '2023-09-26 14:27:50', '2023-09-26 14:27:50'),
(247, 1, 'admin/auth/permissions', 'GET', '127.0.0.1', '[]', '2023-09-26 14:28:04', '2023-09-26 14:28:04'),
(248, 1, 'admin/auth/permissions/7/edit', 'GET', '127.0.0.1', '[]', '2023-09-26 14:28:08', '2023-09-26 14:28:08'),
(249, 1, 'admin/auth/permissions/7', 'PUT', '127.0.0.1', '{\"slug\":\"auth.Read\",\"name\":\"Admin Read\",\"search_terms\":null,\"http_method\":[null],\"http_path\":\"\\/customers\\r\\n\\/accounts\\r\\n\\/credit_-cards\\r\\n\\/accounts\\r\\n\\/report-transactions\",\"_token\":\"4ENFiLIFa8sskACTkHiYPFlcgrAiTwGLPnAaqOsj\",\"_method\":\"PUT\"}', '2023-09-26 14:28:50', '2023-09-26 14:28:50'),
(250, 1, 'admin/auth/permissions', 'GET', '127.0.0.1', '[]', '2023-09-26 14:28:50', '2023-09-26 14:28:50'),
(251, 1, 'admin/auth/users', 'GET', '127.0.0.1', '[]', '2023-09-26 14:28:56', '2023-09-26 14:28:56'),
(252, 1, 'admin/auth/users/2/edit', 'GET', '127.0.0.1', '[]', '2023-09-26 14:29:02', '2023-09-26 14:29:02'),
(253, 1, 'admin/auth/roles', 'GET', '127.0.0.1', '[]', '2023-09-26 14:29:11', '2023-09-26 14:29:11'),
(254, 1, 'admin/auth/roles/2/edit', 'GET', '127.0.0.1', '[]', '2023-09-26 14:29:15', '2023-09-26 14:29:15'),
(255, 1, 'admin/auth/permissions', 'GET', '127.0.0.1', '[]', '2023-09-26 14:29:21', '2023-09-26 14:29:21'),
(256, 1, 'admin/auth/permissions/create', 'GET', '127.0.0.1', '[]', '2023-09-26 14:29:26', '2023-09-26 14:29:26'),
(257, 1, 'admin/auth/permissions', 'POST', '127.0.0.1', '{\"slug\":\"auth.Create\",\"name\":\"Admin_Create\",\"search_terms\":null,\"http_method\":[null],\"http_path\":\"\\/customers\\/create\\r\\n\\/credit_-cards\\/create\\r\\n\\/accounts\\/create\\r\\n\\/report-transactions\\/create\",\"_token\":\"4ENFiLIFa8sskACTkHiYPFlcgrAiTwGLPnAaqOsj\"}', '2023-09-26 14:31:08', '2023-09-26 14:31:08'),
(258, 1, 'admin/auth/permissions', 'GET', '127.0.0.1', '[]', '2023-09-26 14:31:09', '2023-09-26 14:31:09'),
(259, 1, 'admin/auth/permissions/create', 'GET', '127.0.0.1', '[]', '2023-09-26 14:31:18', '2023-09-26 14:31:18'),
(260, 1, 'admin/auth/permissions', 'POST', '127.0.0.1', '{\"slug\":\"auth.Edit\",\"name\":\"Admin_Edit\",\"search_terms\":null,\"http_method\":[null],\"http_path\":\"\\/customers\\/edit\\r\\n\\/accounts\\/edit\\r\\n\\/credit_-cards\\/edit\\r\\n\\/report-transactions\\/edit\",\"_token\":\"4ENFiLIFa8sskACTkHiYPFlcgrAiTwGLPnAaqOsj\"}', '2023-09-26 14:32:21', '2023-09-26 14:32:21'),
(261, 1, 'admin/auth/permissions', 'GET', '127.0.0.1', '[]', '2023-09-26 14:32:24', '2023-09-26 14:32:24'),
(262, 1, 'admin/auth/permissions/9', 'GET', '127.0.0.1', '[]', '2023-09-26 14:32:33', '2023-09-26 14:32:33'),
(263, 1, 'admin/report-transactions', 'GET', '127.0.0.1', '[]', '2023-09-26 14:32:44', '2023-09-26 14:32:44'),
(264, 1, 'admin/report-transactions/1', 'GET', '127.0.0.1', '[]', '2023-09-26 14:32:47', '2023-09-26 14:32:47'),
(265, 1, 'admin/report-transactions', 'GET', '127.0.0.1', '[]', '2023-09-26 14:32:53', '2023-09-26 14:32:53'),
(266, 1, 'admin/auth/roles', 'GET', '127.0.0.1', '[]', '2023-09-26 14:33:08', '2023-09-26 14:33:08'),
(267, 1, 'admin/auth/roles/2/edit', 'GET', '127.0.0.1', '[]', '2023-09-26 14:33:12', '2023-09-26 14:33:12'),
(268, 1, 'admin/auth/roles/2', 'PUT', '127.0.0.1', '{\"slug\":\"Minor\",\"name\":\"Admin\",\"permissions\":[\"2\",\"3\",\"5\",\"7\",\"8\",\"9\",null],\"_token\":\"4ENFiLIFa8sskACTkHiYPFlcgrAiTwGLPnAaqOsj\",\"_method\":\"PUT\"}', '2023-09-26 14:33:22', '2023-09-26 14:33:22'),
(269, 1, 'admin/auth/roles', 'GET', '127.0.0.1', '[]', '2023-09-26 14:33:23', '2023-09-26 14:33:23'),
(270, 1, 'admin/auth/roles', 'GET', '127.0.0.1', '{\"_export_\":\"all\"}', '2023-09-26 14:33:29', '2023-09-26 14:33:29'),
(271, 1, 'admin/auth/logout', 'GET', '127.0.0.1', '[]', '2023-09-26 14:33:40', '2023-09-26 14:33:40'),
(272, 1, 'admin', 'GET', '127.0.0.1', '[]', '2023-09-26 14:34:09', '2023-09-26 14:34:09'),
(273, 1, 'admin/customers', 'GET', '127.0.0.1', '[]', '2023-09-26 14:34:15', '2023-09-26 14:34:15'),
(274, 1, 'admin/customers/1/edit', 'GET', '127.0.0.1', '[]', '2023-09-26 14:34:21', '2023-09-26 14:34:21'),
(275, 1, 'admin/customers', 'GET', '127.0.0.1', '[]', '2023-09-26 14:34:35', '2023-09-26 14:34:35'),
(276, 1, 'admin/accounts', 'GET', '127.0.0.1', '[]', '2023-09-26 14:34:46', '2023-09-26 14:34:46'),
(277, 1, 'admin/credit_-cards', 'GET', '127.0.0.1', '[]', '2023-09-26 14:34:50', '2023-09-26 14:34:50'),
(278, 1, 'admin/report-transactions', 'GET', '127.0.0.1', '[]', '2023-09-26 14:34:51', '2023-09-26 14:34:51'),
(279, 1, 'admin/report-transactions/1/edit', 'GET', '127.0.0.1', '[]', '2023-09-26 14:34:56', '2023-09-26 14:34:56'),
(280, 1, 'admin/auth/permissions', 'GET', '127.0.0.1', '[]', '2023-09-26 14:35:12', '2023-09-26 14:35:12'),
(281, 1, 'admin/auth/permissions/9/edit', 'GET', '127.0.0.1', '[]', '2023-09-26 14:35:15', '2023-09-26 14:35:15'),
(282, 1, 'admin/auth/permissions/9', 'PUT', '127.0.0.1', '{\"slug\":\"auth.Edit\",\"name\":\"Admin_Edit\",\"search_terms\":null,\"http_method\":[null],\"http_path\":\"\\/accounts\\/edit\\r\\n\\/credit_-cards\\/edit\\r\\n\\/report-transactions\\/edit\",\"_token\":\"CNBi2Sq3fqtxRQkMSiopXkkRRU8eb5i7TZ72UBZg\",\"_method\":\"PUT\"}', '2023-09-26 14:35:40', '2023-09-26 14:35:40'),
(283, 1, 'admin/auth/permissions', 'GET', '127.0.0.1', '[]', '2023-09-26 14:35:41', '2023-09-26 14:35:41'),
(284, 1, 'admin/auth/permissions/1', 'GET', '127.0.0.1', '[]', '2023-09-26 14:36:08', '2023-09-26 14:36:08'),
(285, 1, 'admin/auth/permissions', 'GET', '127.0.0.1', '[]', '2023-09-26 14:36:15', '2023-09-26 14:36:15'),
(286, 1, 'admin/auth/permissions/7/edit', 'GET', '127.0.0.1', '[]', '2023-09-26 14:36:34', '2023-09-26 14:36:34'),
(287, 1, 'admin/auth/permissions', 'GET', '127.0.0.1', '[]', '2023-09-26 14:36:41', '2023-09-26 14:36:41'),
(288, 1, 'admin/auth/permissions/create', 'GET', '127.0.0.1', '[]', '2023-09-26 14:36:44', '2023-09-26 14:36:44'),
(289, 1, 'admin/auth/permissions', 'POST', '127.0.0.1', '{\"slug\":\"auth.Delete\",\"name\":\"Admin_Delete\",\"search_terms\":null,\"http_method\":[null],\"http_path\":\"\\/customers\\/delete\\r\\n\\/accounts\\/delete\\r\\n\\/credit_-cards\\/delete\\r\\n\\/accounts\\/delete\\r\\n\\/report-transactions\\/delete\",\"_token\":\"CNBi2Sq3fqtxRQkMSiopXkkRRU8eb5i7TZ72UBZg\"}', '2023-09-26 14:37:40', '2023-09-26 14:37:40'),
(290, 1, 'admin/auth/permissions', 'GET', '127.0.0.1', '[]', '2023-09-26 14:37:43', '2023-09-26 14:37:43'),
(291, 1, 'admin/auth/permissions', 'GET', '127.0.0.1', '[]', '2023-09-26 14:37:49', '2023-09-26 14:37:49'),
(292, 1, 'admin/auth/roles', 'GET', '127.0.0.1', '[]', '2023-09-26 14:37:51', '2023-09-26 14:37:51'),
(293, 1, 'admin/auth/roles/2/edit', 'GET', '127.0.0.1', '[]', '2023-09-26 14:37:54', '2023-09-26 14:37:54'),
(294, 1, 'admin/auth/roles/2', 'PUT', '127.0.0.1', '{\"slug\":\"Minor\",\"name\":\"Admin\",\"permissions\":[\"2\",\"3\",\"5\",\"7\",\"8\",\"9\",\"10\",null],\"_token\":\"CNBi2Sq3fqtxRQkMSiopXkkRRU8eb5i7TZ72UBZg\",\"_method\":\"PUT\"}', '2023-09-26 14:38:00', '2023-09-26 14:38:00'),
(295, 1, 'admin/auth/roles', 'GET', '127.0.0.1', '[]', '2023-09-26 14:38:01', '2023-09-26 14:38:01'),
(296, 1, 'admin/auth/logout', 'GET', '127.0.0.1', '[]', '2023-09-26 14:38:07', '2023-09-26 14:38:07'),
(297, 2, 'admin', 'GET', '127.0.0.1', '[]', '2023-09-26 14:38:32', '2023-09-26 14:38:32'),
(298, 2, 'admin/customers', 'GET', '127.0.0.1', '[]', '2023-09-26 14:38:37', '2023-09-26 14:38:37'),
(299, 2, 'admin/accounts', 'GET', '127.0.0.1', '[]', '2023-09-26 14:38:40', '2023-09-26 14:38:40'),
(300, 2, 'admin/credit_-cards', 'GET', '127.0.0.1', '[]', '2023-09-26 14:38:42', '2023-09-26 14:38:42'),
(301, 2, 'admin/report-transactions', 'GET', '127.0.0.1', '[]', '2023-09-26 14:38:44', '2023-09-26 14:38:44'),
(302, 2, 'admin/customers', 'GET', '127.0.0.1', '[]', '2023-09-26 14:38:47', '2023-09-26 14:38:47'),
(303, 2, 'admin/customers/1/edit', 'GET', '127.0.0.1', '[]', '2023-09-26 14:38:50', '2023-09-26 14:38:50'),
(304, 2, 'admin/accounts', 'GET', '127.0.0.1', '[]', '2023-09-26 14:39:02', '2023-09-26 14:39:02'),
(305, 2, 'admin/credit_-cards', 'GET', '127.0.0.1', '[]', '2023-09-26 14:39:04', '2023-09-26 14:39:04'),
(306, 2, 'admin/report-transactions', 'GET', '127.0.0.1', '[]', '2023-09-26 14:39:07', '2023-09-26 14:39:07'),
(307, 2, 'admin/auth/logout', 'GET', '127.0.0.1', '[]', '2023-09-26 14:39:13', '2023-09-26 14:39:13'),
(308, 1, 'admin', 'GET', '127.0.0.1', '[]', '2023-09-26 14:39:20', '2023-09-26 14:39:20'),
(309, 1, 'admin/customers', 'GET', '127.0.0.1', '[]', '2023-09-26 14:39:29', '2023-09-26 14:39:29'),
(310, 1, 'admin/customers/1/edit', 'GET', '127.0.0.1', '[]', '2023-09-26 14:39:34', '2023-09-26 14:39:34'),
(311, 1, 'admin/auth/users', 'GET', '127.0.0.1', '[]', '2023-09-26 14:39:40', '2023-09-26 14:39:40'),
(312, 1, 'admin/auth/users/2/edit', 'GET', '127.0.0.1', '[]', '2023-09-26 14:39:43', '2023-09-26 14:39:43'),
(313, 1, 'admin/auth/roles', 'GET', '127.0.0.1', '[]', '2023-09-26 14:39:51', '2023-09-26 14:39:51'),
(314, 1, 'admin/auth/roles/2/edit', 'GET', '127.0.0.1', '[]', '2023-09-26 14:39:53', '2023-09-26 14:39:53'),
(315, 1, 'admin/auth/permissions', 'GET', '127.0.0.1', '[]', '2023-09-26 14:39:57', '2023-09-26 14:39:57'),
(316, 1, 'admin/auth/permissions/9/edit', 'GET', '127.0.0.1', '[]', '2023-09-26 14:40:01', '2023-09-26 14:40:01'),
(317, 1, 'admin/auth/permissions/9', 'PUT', '127.0.0.1', '{\"slug\":\"auth.Edit\",\"name\":\"Admin_Edit\",\"search_terms\":null,\"http_method\":[null],\"http_path\":\"\\/accounts\\/*\\/edit\\r\\n\\/credit_-cards\\/*\\/edit\\r\\n\\/report-transactions\\/*\\/edit\",\"_token\":\"ZO9yO1QdJxNeyHFl5N7ENzCQlUCZP1baYSU4V5vT\",\"_method\":\"PUT\"}', '2023-09-26 14:40:20', '2023-09-26 14:40:20'),
(318, 1, 'admin/auth/permissions', 'GET', '127.0.0.1', '[]', '2023-09-26 14:40:21', '2023-09-26 14:40:21'),
(319, 1, 'admin/auth/logout', 'GET', '127.0.0.1', '[]', '2023-09-26 14:40:33', '2023-09-26 14:40:33'),
(320, 2, 'admin', 'GET', '127.0.0.1', '[]', '2023-09-26 14:40:46', '2023-09-26 14:40:46'),
(321, 2, 'admin/customers', 'GET', '127.0.0.1', '[]', '2023-09-26 14:40:52', '2023-09-26 14:40:52'),
(322, 2, 'admin/customers/1/edit', 'GET', '127.0.0.1', '[]', '2023-09-26 14:40:55', '2023-09-26 14:40:55'),
(323, 2, 'admin/customers/1', 'GET', '127.0.0.1', '[]', '2023-09-26 14:41:01', '2023-09-26 14:41:01'),
(324, 2, 'admin/customers', 'GET', '127.0.0.1', '[]', '2023-09-26 14:41:04', '2023-09-26 14:41:04'),
(325, 2, 'admin/customers/1/edit', 'GET', '127.0.0.1', '[]', '2023-09-26 14:41:10', '2023-09-26 14:41:10'),
(326, 2, 'admin/customers', 'GET', '127.0.0.1', '[]', '2023-09-26 14:41:14', '2023-09-26 14:41:14'),
(327, 2, 'admin/auth/logout', 'GET', '127.0.0.1', '[]', '2023-09-26 14:41:16', '2023-09-26 14:41:16'),
(328, 1, 'admin', 'GET', '127.0.0.1', '[]', '2023-09-26 14:41:22', '2023-09-26 14:41:22'),
(329, 1, 'admin/customers', 'GET', '127.0.0.1', '[]', '2023-09-26 14:41:29', '2023-09-26 14:41:29'),
(330, 1, 'admin/auth/permissions', 'GET', '127.0.0.1', '[]', '2023-09-26 14:41:35', '2023-09-26 14:41:35'),
(331, 1, 'admin/auth/permissions/7/edit', 'GET', '127.0.0.1', '[]', '2023-09-26 14:41:49', '2023-09-26 14:41:49'),
(332, 1, 'admin/auth/permissions', 'GET', '127.0.0.1', '[]', '2023-09-26 14:41:57', '2023-09-26 14:41:57'),
(333, 1, 'admin/auth/permissions/create', 'GET', '127.0.0.1', '[]', '2023-09-26 14:42:01', '2023-09-26 14:42:01'),
(334, 1, 'admin/auth/permissions', 'POST', '127.0.0.1', '{\"slug\":\"auth.View\",\"name\":\"Admin_View\",\"search_terms\":null,\"http_method\":[null],\"http_path\":\"\\/customers\\/*\\r\\n\\/accounts\\/*\\r\\n\\/credit_-cards\\/*\\r\\n\\/accounts\\/*\\r\\n\\/report-transactions\\/*\",\"_token\":\"hzcQOzKLWwp7DDKNGpHeXO6zcWIju8Wmsgs3eKMb\"}', '2023-09-26 14:42:37', '2023-09-26 14:42:37'),
(335, 1, 'admin/auth/permissions', 'GET', '127.0.0.1', '[]', '2023-09-26 14:42:39', '2023-09-26 14:42:39'),
(336, 1, 'admin/auth/roles', 'GET', '127.0.0.1', '[]', '2023-09-26 14:42:45', '2023-09-26 14:42:45'),
(337, 1, 'admin/auth/roles/2/edit', 'GET', '127.0.0.1', '[]', '2023-09-26 14:42:48', '2023-09-26 14:42:48'),
(338, 1, 'admin/auth/roles/2', 'PUT', '127.0.0.1', '{\"slug\":\"Minor\",\"name\":\"Admin\",\"permissions\":[\"2\",\"3\",\"5\",\"7\",\"8\",\"9\",\"10\",\"11\",null],\"_token\":\"hzcQOzKLWwp7DDKNGpHeXO6zcWIju8Wmsgs3eKMb\",\"_method\":\"PUT\"}', '2023-09-26 14:42:52', '2023-09-26 14:42:52'),
(339, 1, 'admin/auth/roles', 'GET', '127.0.0.1', '[]', '2023-09-26 14:42:54', '2023-09-26 14:42:54'),
(340, 1, 'admin/auth/roles/2', 'PUT', '127.0.0.1', '{\"slug\":\"Minor\",\"name\":\"Admin\",\"permissions\":[\"2\",\"3\",\"5\",\"7\",\"8\",\"9\",\"10\",\"11\",null],\"_token\":\"hzcQOzKLWwp7DDKNGpHeXO6zcWIju8Wmsgs3eKMb\",\"_method\":\"PUT\"}', '2023-09-26 14:42:56', '2023-09-26 14:42:56'),
(341, 1, 'admin/auth/roles', 'GET', '127.0.0.1', '[]', '2023-09-26 14:42:57', '2023-09-26 14:42:57'),
(342, 1, 'admin/auth/logout', 'GET', '127.0.0.1', '[]', '2023-09-26 14:43:09', '2023-09-26 14:43:09'),
(343, 2, 'admin', 'GET', '127.0.0.1', '[]', '2023-09-26 14:43:17', '2023-09-26 14:43:17'),
(344, 2, 'admin/customers', 'GET', '127.0.0.1', '[]', '2023-09-26 14:43:26', '2023-09-26 14:43:26'),
(345, 2, 'admin/customers/1/edit', 'GET', '127.0.0.1', '[]', '2023-09-26 14:43:30', '2023-09-26 14:43:30'),
(346, 2, 'admin/report-transactions', 'GET', '127.0.0.1', '[]', '2023-09-26 14:43:36', '2023-09-26 14:43:36'),
(347, 2, 'admin/report-transactions/1/edit', 'GET', '127.0.0.1', '[]', '2023-09-26 14:43:39', '2023-09-26 14:43:39'),
(348, 2, 'admin/report-transactions', 'GET', '127.0.0.1', '[]', '2023-09-26 14:43:44', '2023-09-26 14:43:44'),
(349, 2, 'admin/auth/logout', 'GET', '127.0.0.1', '[]', '2023-09-26 14:50:28', '2023-09-26 14:50:28'),
(350, 2, 'admin', 'GET', '127.0.0.1', '[]', '2023-10-02 15:18:23', '2023-10-02 15:18:23'),
(351, 2, 'admin/report-transactions', 'GET', '127.0.0.1', '[]', '2023-10-02 15:19:32', '2023-10-02 15:19:32'),
(352, 2, 'admin/credit_-cards', 'GET', '127.0.0.1', '[]', '2023-10-02 15:19:46', '2023-10-02 15:19:46'),
(353, 2, 'admin/accounts', 'GET', '127.0.0.1', '[]', '2023-10-02 15:20:13', '2023-10-02 15:20:13'),
(354, 2, 'admin/customers', 'GET', '127.0.0.1', '[]', '2023-10-02 15:20:18', '2023-10-02 15:20:18'),
(355, 2, 'admin/helpers/scaffold', 'GET', '127.0.0.1', '[]', '2023-10-02 15:20:27', '2023-10-02 15:20:27'),
(356, 2, 'admin/helpers/terminal/database', 'GET', '127.0.0.1', '[]', '2023-10-02 15:20:30', '2023-10-02 15:20:30'),
(357, 2, 'admin/helpers/terminal/artisan', 'GET', '127.0.0.1', '[]', '2023-10-02 15:20:32', '2023-10-02 15:20:32'),
(358, 2, 'admin/helpers/routes', 'GET', '127.0.0.1', '[]', '2023-10-02 15:20:33', '2023-10-02 15:20:33'),
(359, 2, 'admin', 'GET', '127.0.0.1', '[]', '2023-10-02 15:20:38', '2023-10-02 15:20:38'),
(360, 2, 'admin/report-transactions', 'GET', '127.0.0.1', '[]', '2023-10-02 15:20:40', '2023-10-02 15:20:40'),
(361, 2, 'admin/customers', 'GET', '127.0.0.1', '[]', '2023-10-02 15:22:12', '2023-10-02 15:22:12'),
(362, 2, 'admin/accounts', 'GET', '127.0.0.1', '[]', '2023-10-02 15:22:19', '2023-10-02 15:22:19'),
(363, 2, 'admin/report-transactions', 'GET', '127.0.0.1', '[]', '2023-10-02 15:22:45', '2023-10-02 15:22:45'),
(364, 2, 'admin/credit_-cards', 'GET', '127.0.0.1', '[]', '2023-10-02 15:22:49', '2023-10-02 15:22:49'),
(365, 2, 'admin/credit_-cards/create', 'GET', '127.0.0.1', '[]', '2023-10-02 15:22:54', '2023-10-02 15:22:54'),
(366, 2, 'admin/credit_-cards', 'POST', '127.0.0.1', '{\"card_no\":\"1\",\"Account_id\":\"1\",\"Amount\":\"6000\",\"CVV\":\"543\",\"_token\":\"G7HoOq7REiz8UWznbxrsPrQwgws0S5L1inezFpSq\"}', '2023-10-02 15:23:11', '2023-10-02 15:23:11'),
(367, 2, 'admin/credit_-cards', 'GET', '127.0.0.1', '[]', '2023-10-02 15:23:12', '2023-10-02 15:23:12'),
(368, 2, 'admin/customers', 'GET', '127.0.0.1', '[]', '2023-10-02 15:23:17', '2023-10-02 15:23:17'),
(369, 2, 'admin/customers', 'GET', '127.0.0.1', '{\"_export_\":\"all\"}', '2023-10-02 15:23:22', '2023-10-02 15:23:22'),
(370, 2, 'admin/credit_-cards', 'GET', '127.0.0.1', '[]', '2023-10-02 15:25:29', '2023-10-02 15:25:29'),
(371, 2, 'admin/credit_-cards/1/edit', 'GET', '127.0.0.1', '[]', '2023-10-02 15:25:31', '2023-10-02 15:25:31'),
(372, 2, 'admin/auth/logout', 'GET', '127.0.0.1', '[]', '2023-10-02 15:25:37', '2023-10-02 15:25:37'),
(373, 1, 'admin', 'GET', '127.0.0.1', '[]', '2023-10-02 15:29:28', '2023-10-02 15:29:28'),
(374, 1, 'admin/helpers/scaffold', 'GET', '127.0.0.1', '[]', '2023-10-02 15:29:37', '2023-10-02 15:29:37'),
(375, 1, 'admin/auth/logout', 'GET', '127.0.0.1', '[]', '2023-10-02 15:29:58', '2023-10-02 15:29:58');
INSERT INTO `admin_operation_log` (`id`, `user_id`, `path`, `method`, `ip`, `input`, `created_at`, `updated_at`) VALUES
(376, 1, 'admin', 'GET', '127.0.0.1', '[]', '2023-10-03 05:14:16', '2023-10-03 05:14:16'),
(377, 1, 'admin/auth/permissions', 'GET', '127.0.0.1', '[]', '2023-10-03 05:14:44', '2023-10-03 05:14:44'),
(378, 1, 'admin/auth/logout', 'GET', '127.0.0.1', '[]', '2023-10-03 05:15:43', '2023-10-03 05:15:43'),
(379, 2, 'admin', 'GET', '127.0.0.1', '[]', '2023-10-03 05:15:57', '2023-10-03 05:15:57'),
(380, 2, 'admin/customers', 'GET', '127.0.0.1', '[]', '2023-10-03 05:16:21', '2023-10-03 05:16:21'),
(381, 2, 'admin/customers/1/edit', 'GET', '127.0.0.1', '[]', '2023-10-03 05:16:27', '2023-10-03 05:16:27'),
(382, 2, 'admin/accounts', 'GET', '127.0.0.1', '[]', '2023-10-03 05:16:42', '2023-10-03 05:16:42'),
(383, 2, 'admin/credit_-cards', 'GET', '127.0.0.1', '[]', '2023-10-03 05:16:45', '2023-10-03 05:16:45'),
(384, 2, 'admin/report-transactions', 'GET', '127.0.0.1', '[]', '2023-10-03 05:16:48', '2023-10-03 05:16:48'),
(385, 2, 'admin/customers', 'GET', '127.0.0.1', '[]', '2023-10-03 05:17:22', '2023-10-03 05:17:22'),
(386, 2, 'admin/customers/1/edit', 'GET', '127.0.0.1', '[]', '2023-10-03 05:17:27', '2023-10-03 05:17:27'),
(387, 2, 'admin/report-transactions', 'GET', '127.0.0.1', '[]', '2023-10-03 05:18:09', '2023-10-03 05:18:09'),
(388, 2, 'admin/report-transactions/create', 'GET', '127.0.0.1', '[]', '2023-10-03 05:18:12', '2023-10-03 05:18:12'),
(389, 2, 'admin', 'GET', '127.0.0.1', '[]', '2023-10-03 05:19:07', '2023-10-03 05:19:07'),
(390, 2, 'admin/auth/logout', 'GET', '127.0.0.1', '[]', '2023-10-03 05:24:09', '2023-10-03 05:24:09'),
(391, 1, 'admin', 'GET', '127.0.0.1', '[]', '2023-10-10 09:47:12', '2023-10-10 09:47:12'),
(392, 1, 'admin/customers', 'GET', '127.0.0.1', '[]', '2023-10-10 09:47:28', '2023-10-10 09:47:28'),
(393, 1, 'admin/helpers/scaffold', 'GET', '127.0.0.1', '[]', '2023-10-10 09:47:47', '2023-10-10 09:47:47'),
(394, 1, 'admin/customers', 'GET', '127.0.0.1', '[]', '2023-10-10 09:48:04', '2023-10-10 09:48:04'),
(395, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '[]', '2023-10-10 09:48:12', '2023-10-10 09:48:12'),
(396, 1, 'admin/auth/roles', 'GET', '127.0.0.1', '[]', '2023-10-10 09:48:35', '2023-10-10 09:48:35'),
(397, 1, 'admin/helpers/routes', 'GET', '127.0.0.1', '[]', '2023-10-10 09:48:47', '2023-10-10 09:48:47'),
(398, 1, 'admin/customers', 'GET', '127.0.0.1', '[]', '2023-10-10 09:48:51', '2023-10-10 09:48:51'),
(399, 1, 'admin/customers/1/edit', 'GET', '127.0.0.1', '[]', '2023-10-10 09:48:56', '2023-10-10 09:48:56'),
(400, 1, 'admin/customers', 'GET', '127.0.0.1', '[]', '2023-10-10 09:49:26', '2023-10-10 09:49:26'),
(401, 1, 'admin/customers/1', 'DELETE', '127.0.0.1', '{\"_method\":\"delete\",\"_token\":\"NfE8JX2H2XEPqoyTrq1tTld3vo8t5lL9z2u3RuAZ\"}', '2023-10-10 09:49:38', '2023-10-10 09:49:38'),
(402, 1, 'admin/customers', 'GET', '127.0.0.1', '[]', '2023-10-10 09:49:39', '2023-10-10 09:49:39'),
(403, 1, 'admin/accounts', 'GET', '127.0.0.1', '[]', '2023-10-10 09:49:47', '2023-10-10 09:49:47'),
(404, 1, 'admin/credit_-cards', 'GET', '127.0.0.1', '[]', '2023-10-10 09:49:51', '2023-10-10 09:49:51'),
(405, 1, 'admin/credit_-cards/1', 'DELETE', '127.0.0.1', '{\"_method\":\"delete\",\"_token\":\"NfE8JX2H2XEPqoyTrq1tTld3vo8t5lL9z2u3RuAZ\"}', '2023-10-10 09:49:55', '2023-10-10 09:49:55'),
(406, 1, 'admin/credit_-cards', 'GET', '127.0.0.1', '[]', '2023-10-10 09:49:55', '2023-10-10 09:49:55'),
(407, 1, 'admin/report-transactions', 'GET', '127.0.0.1', '[]', '2023-10-10 09:49:57', '2023-10-10 09:49:57'),
(408, 1, 'admin/report-transactions/1', 'DELETE', '127.0.0.1', '{\"_method\":\"delete\",\"_token\":\"NfE8JX2H2XEPqoyTrq1tTld3vo8t5lL9z2u3RuAZ\"}', '2023-10-10 09:50:00', '2023-10-10 09:50:00'),
(409, 1, 'admin/report-transactions', 'GET', '127.0.0.1', '[]', '2023-10-10 09:50:01', '2023-10-10 09:50:01'),
(410, 1, 'admin/customers', 'GET', '127.0.0.1', '[]', '2023-10-10 09:50:02', '2023-10-10 09:50:02'),
(411, 1, 'admin/helpers/scaffold', 'GET', '127.0.0.1', '[]', '2023-10-10 09:50:15', '2023-10-10 09:50:15'),
(412, 1, 'admin/helpers/terminal/database', 'GET', '127.0.0.1', '[]', '2023-10-10 09:50:24', '2023-10-10 09:50:24'),
(413, 1, 'admin/helpers/terminal/artisan', 'GET', '127.0.0.1', '[]', '2023-10-10 09:50:27', '2023-10-10 09:50:27'),
(414, 1, 'admin/helpers/terminal/database', 'GET', '127.0.0.1', '[]', '2023-10-10 09:50:33', '2023-10-10 09:50:33'),
(415, 1, 'admin/helpers/terminal/database', 'POST', '127.0.0.1', '{\"c\":\"db:mysql\",\"q\":\"ALTER TABLE `customer` ADD COLUMN `First_Name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL AFTER `customer_id`, ADD COLUMN `Second_Name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL AFTER `First_Name`;\",\"_token\":\"NfE8JX2H2XEPqoyTrq1tTld3vo8t5lL9z2u3RuAZ\"}', '2023-10-10 09:53:43', '2023-10-10 09:53:43'),
(416, 1, 'admin/customers', 'GET', '127.0.0.1', '[]', '2023-10-10 09:53:52', '2023-10-10 09:53:52'),
(417, 1, 'admin/customers', 'GET', '127.0.0.1', '[]', '2023-10-10 09:53:57', '2023-10-10 09:53:57'),
(418, 1, 'admin/customers', 'GET', '127.0.0.1', '[]', '2023-10-10 09:54:17', '2023-10-10 09:54:17'),
(419, 1, 'admin/customers', 'GET', '127.0.0.1', '[]', '2023-10-10 09:58:10', '2023-10-10 09:58:10'),
(420, 1, 'admin/auth/logout', 'GET', '127.0.0.1', '[]', '2023-10-10 09:58:17', '2023-10-10 09:58:17'),
(421, 1, 'admin', 'GET', '127.0.0.1', '[]', '2023-10-10 11:38:51', '2023-10-10 11:38:51'),
(422, 1, 'admin/accounts', 'GET', '127.0.0.1', '[]', '2023-10-10 11:38:58', '2023-10-10 11:38:58'),
(423, 1, 'admin/credit_-cards', 'GET', '127.0.0.1', '[]', '2023-10-10 11:39:00', '2023-10-10 11:39:00'),
(424, 1, 'admin/report-transactions', 'GET', '127.0.0.1', '[]', '2023-10-10 11:39:02', '2023-10-10 11:39:02'),
(425, 1, 'admin/report-transactions', 'GET', '127.0.0.1', '[]', '2023-10-10 11:41:01', '2023-10-10 11:41:01'),
(426, 1, 'admin/report-transactions', 'GET', '127.0.0.1', '[]', '2023-10-10 11:43:57', '2023-10-10 11:43:57'),
(427, 1, 'admin', 'GET', '127.0.0.1', '[]', '2023-10-10 11:44:05', '2023-10-10 11:44:05'),
(428, 1, 'admin/auth/users', 'GET', '127.0.0.1', '[]', '2023-10-10 11:44:08', '2023-10-10 11:44:08'),
(429, 1, 'admin/auth/users', 'GET', '127.0.0.1', '[]', '2023-10-10 11:44:48', '2023-10-10 11:44:48'),
(430, 1, 'admin/accounts', 'GET', '127.0.0.1', '[]', '2023-10-10 11:44:54', '2023-10-10 11:44:54'),
(431, 1, 'admin/accounts', 'GET', '127.0.0.1', '[]', '2023-10-10 11:45:41', '2023-10-10 11:45:41'),
(432, 1, 'admin/credit_-cards', 'GET', '127.0.0.1', '[]', '2023-10-10 11:45:45', '2023-10-10 11:45:45'),
(433, 1, 'admin/report-transactions', 'GET', '127.0.0.1', '[]', '2023-10-10 11:45:45', '2023-10-10 11:45:45'),
(434, 2, 'admin', 'GET', '127.0.0.1', '[]', '2023-10-12 16:12:29', '2023-10-12 16:12:29'),
(435, 2, 'admin', 'GET', '127.0.0.1', '[]', '2023-10-12 16:14:38', '2023-10-12 16:14:38'),
(436, 2, 'admin', 'GET', '127.0.0.1', '[]', '2023-10-12 16:16:17', '2023-10-12 16:16:17'),
(437, 2, 'admin', 'GET', '127.0.0.1', '[]', '2023-10-12 16:16:20', '2023-10-12 16:16:20'),
(438, 2, 'admin/customers', 'GET', '127.0.0.1', '[]', '2023-10-12 16:16:23', '2023-10-12 16:16:23'),
(439, 2, 'admin/helpers/scaffold', 'GET', '127.0.0.1', '[]', '2023-10-12 16:16:34', '2023-10-12 16:16:34'),
(440, 2, 'admin', 'GET', '127.0.0.1', '[]', '2023-10-12 16:16:36', '2023-10-12 16:16:36'),
(441, 2, 'admin/auth/logout', 'GET', '127.0.0.1', '[]', '2023-10-12 16:16:50', '2023-10-12 16:16:50'),
(442, 1, 'admin', 'GET', '127.0.0.1', '[]', '2023-10-12 16:17:00', '2023-10-12 16:17:00'),
(443, 1, 'admin/auth/permissions', 'GET', '127.0.0.1', '[]', '2023-10-12 16:17:13', '2023-10-12 16:17:13'),
(444, 1, 'admin/auth/permissions/9/edit', 'GET', '127.0.0.1', '[]', '2023-10-12 16:17:29', '2023-10-12 16:17:29'),
(445, 1, 'admin/auth/permissions/9', 'PUT', '127.0.0.1', '{\"slug\":\"auth.Edit\",\"name\":\"Admin_Edit\",\"search_terms\":null,\"http_method\":[null],\"http_path\":\"\\/report-transactions\\/*\\/edit\",\"_token\":\"zLEs40bfr9NYlICWPweK1TLcAvRYxRSWjlzvYNDk\",\"_method\":\"PUT\"}', '2023-10-12 16:18:04', '2023-10-12 16:18:04'),
(446, 1, 'admin/auth/permissions', 'GET', '127.0.0.1', '[]', '2023-10-12 16:18:05', '2023-10-12 16:18:05'),
(447, 1, 'admin/auth/permissions/11/edit', 'GET', '127.0.0.1', '[]', '2023-10-12 16:18:16', '2023-10-12 16:18:16'),
(448, 1, 'admin/auth/permissions/11', 'PUT', '127.0.0.1', '{\"slug\":\"auth.View\",\"name\":\"Admin_View\",\"search_terms\":null,\"http_method\":[null],\"http_path\":\"\\/customers\\r\\n\\/accounts\\r\\n\\/credit_-cards\\r\\n\\/report-transactions\\/*\",\"_token\":\"zLEs40bfr9NYlICWPweK1TLcAvRYxRSWjlzvYNDk\",\"_method\":\"PUT\"}', '2023-10-12 16:18:32', '2023-10-12 16:18:32'),
(449, 1, 'admin/auth/permissions', 'GET', '127.0.0.1', '[]', '2023-10-12 16:18:32', '2023-10-12 16:18:32'),
(450, 1, 'admin/auth/permissions/11/edit', 'GET', '127.0.0.1', '[]', '2023-10-12 16:18:38', '2023-10-12 16:18:38'),
(451, 1, 'admin/auth/permissions/11', 'PUT', '127.0.0.1', '{\"slug\":\"auth.View\",\"name\":\"Admin_View\",\"search_terms\":null,\"http_method\":[null],\"http_path\":\"\\/customers\\/*\\r\\n\\/accounts\\/*\\r\\n\\/credit_-cards\\/*\\r\\n\\/report-transactions\\/*\",\"_token\":\"zLEs40bfr9NYlICWPweK1TLcAvRYxRSWjlzvYNDk\",\"_method\":\"PUT\"}', '2023-10-12 16:18:52', '2023-10-12 16:18:52'),
(452, 1, 'admin/auth/permissions', 'GET', '127.0.0.1', '[]', '2023-10-12 16:18:52', '2023-10-12 16:18:52'),
(453, 1, 'admin/customers', 'GET', '127.0.0.1', '[]', '2023-10-12 16:18:55', '2023-10-12 16:18:55'),
(454, 1, 'admin/accounts', 'GET', '127.0.0.1', '[]', '2023-10-12 16:18:57', '2023-10-12 16:18:57'),
(455, 1, 'admin/credit_-cards', 'GET', '127.0.0.1', '[]', '2023-10-12 16:18:59', '2023-10-12 16:18:59'),
(456, 1, 'admin/report-transactions', 'GET', '127.0.0.1', '[]', '2023-10-12 16:19:01', '2023-10-12 16:19:01'),
(457, 1, 'admin/auth/logout', 'GET', '127.0.0.1', '[]', '2023-10-12 16:19:12', '2023-10-12 16:19:12'),
(458, 1, 'admin', 'GET', '127.0.0.1', '[]', '2023-10-12 16:48:37', '2023-10-12 16:48:37'),
(459, 1, 'admin/helpers/scaffold', 'GET', '127.0.0.1', '[]', '2023-10-12 16:48:52', '2023-10-12 16:48:52'),
(460, 1, 'admin/helpers/scaffold', 'POST', '127.0.0.1', '{\"table_name\":\"transaction\",\"model_name\":\"App\\\\Models\\\\transaction\",\"controller_name\":\"App\\\\Admin\\\\Controllers\\\\transaction_controller\",\"create\":[\"migration\",\"model\",\"controller\",\"migrate\",\"menu_item\"],\"fields\":{\"1\":{\"name\":\"card_no\",\"type\":\"integer\",\"key\":null,\"default\":null,\"comment\":null},\"2\":{\"name\":\"beneficiary_no\",\"type\":\"integer\",\"key\":null,\"default\":null,\"comment\":\"beneficiaries card number\"},\"3\":{\"name\":\"Amount\",\"type\":\"integer\",\"nullable\":\"on\",\"key\":null,\"default\":null,\"comment\":null}},\"timestamps\":\"on\",\"primary_key\":\"transaction_id\",\"_token\":\"bIgwnTpNiYnCJBH04kqoxZcXXGYnsUh3vmjglonm\"}', '2023-10-12 16:53:15', '2023-10-12 16:53:15'),
(461, 1, 'admin/helpers/scaffold', 'GET', '127.0.0.1', '[]', '2023-10-12 16:53:18', '2023-10-12 16:53:18'),
(462, 1, 'admin/helpers/scaffold', 'GET', '127.0.0.1', '[]', '2023-10-12 16:53:58', '2023-10-12 16:53:58'),
(463, 1, 'admin/transactions', 'GET', '127.0.0.1', '[]', '2023-10-12 16:54:01', '2023-10-12 16:54:01'),
(464, 1, 'admin/accounts', 'GET', '127.0.0.1', '[]', '2023-10-12 16:54:06', '2023-10-12 16:54:06'),
(465, 1, 'admin/accounts', 'GET', '127.0.0.1', '[]', '2023-10-12 17:21:19', '2023-10-12 17:21:19'),
(466, 1, 'admin/customers', 'GET', '127.0.0.1', '[]', '2023-10-12 17:21:26', '2023-10-12 17:21:26'),
(467, 1, 'admin/accounts', 'GET', '127.0.0.1', '[]', '2023-10-12 17:21:29', '2023-10-12 17:21:29'),
(468, 1, 'admin/accounts/create', 'GET', '127.0.0.1', '[]', '2023-10-12 17:21:30', '2023-10-12 17:21:30'),
(469, 1, 'admin/accounts', 'GET', '127.0.0.1', '[]', '2023-10-12 17:21:45', '2023-10-12 17:21:45'),
(470, 1, 'admin/accounts/create', 'GET', '127.0.0.1', '[]', '2023-10-12 17:21:50', '2023-10-12 17:21:50'),
(471, 1, 'admin/customers', 'GET', '127.0.0.1', '[]', '2023-10-12 17:21:57', '2023-10-12 17:21:57'),
(472, 1, 'admin/customers/create', 'GET', '127.0.0.1', '[]', '2023-10-12 17:22:13', '2023-10-12 17:22:13'),
(473, 1, 'admin/customers', 'POST', '127.0.0.1', '{\"Email\":\"testing@test.com\",\"Password\":\"12345\",\"Account_id\":\"2\",\"_token\":\"bIgwnTpNiYnCJBH04kqoxZcXXGYnsUh3vmjglonm\"}', '2023-10-12 17:22:50', '2023-10-12 17:22:50'),
(474, 1, 'admin/customers', 'GET', '127.0.0.1', '[]', '2023-10-12 17:22:53', '2023-10-12 17:22:53'),
(475, 1, 'admin/customers', 'GET', '127.0.0.1', '[]', '2023-10-12 17:25:45', '2023-10-12 17:25:45'),
(476, 1, 'admin/customers/2', 'DELETE', '127.0.0.1', '{\"_method\":\"delete\",\"_token\":\"bIgwnTpNiYnCJBH04kqoxZcXXGYnsUh3vmjglonm\"}', '2023-10-12 17:25:54', '2023-10-12 17:25:54'),
(477, 1, 'admin/customers', 'GET', '127.0.0.1', '[]', '2023-10-12 17:25:55', '2023-10-12 17:25:55'),
(478, 1, 'admin/customers/create', 'GET', '127.0.0.1', '[]', '2023-10-12 17:25:58', '2023-10-12 17:25:58'),
(479, 1, 'admin/customers', 'POST', '127.0.0.1', '{\"Email\":\"testing@test.com\",\"First_Name\":\"testing\",\"Second_Name\":\"test\",\"Password\":\"12345\",\"Account_id\":null,\"_token\":\"bIgwnTpNiYnCJBH04kqoxZcXXGYnsUh3vmjglonm\"}', '2023-10-12 17:26:35', '2023-10-12 17:26:35'),
(480, 1, 'admin/customers/create', 'GET', '127.0.0.1', '[]', '2023-10-12 17:26:39', '2023-10-12 17:26:39'),
(481, 1, 'admin/customers', 'POST', '127.0.0.1', '{\"Email\":\"testing@test.com\",\"First_Name\":\"testing\",\"Second_Name\":\"test\",\"Password\":\"12345\",\"Account_id\":\"77788\",\"_token\":\"bIgwnTpNiYnCJBH04kqoxZcXXGYnsUh3vmjglonm\"}', '2023-10-12 17:26:56', '2023-10-12 17:26:56'),
(482, 1, 'admin/customers', 'GET', '127.0.0.1', '[]', '2023-10-12 17:26:57', '2023-10-12 17:26:57'),
(483, 1, 'admin/customers', 'GET', '127.0.0.1', '[]', '2023-10-12 17:27:25', '2023-10-12 17:27:25'),
(484, 1, 'admin/customers/3', 'DELETE', '127.0.0.1', '{\"_method\":\"delete\",\"_token\":\"bIgwnTpNiYnCJBH04kqoxZcXXGYnsUh3vmjglonm\"}', '2023-10-12 17:34:48', '2023-10-12 17:34:48'),
(485, 1, 'admin/customers', 'GET', '127.0.0.1', '[]', '2023-10-12 17:34:49', '2023-10-12 17:34:49'),
(486, 1, 'admin/customers', 'GET', '127.0.0.1', '[]', '2023-10-12 17:34:49', '2023-10-12 17:34:49'),
(487, 1, 'admin/customers', 'GET', '127.0.0.1', '[]', '2023-10-12 17:34:54', '2023-10-12 17:34:54'),
(488, 1, 'admin/customers/3', 'DELETE', '127.0.0.1', '{\"_method\":\"delete\",\"_token\":\"bIgwnTpNiYnCJBH04kqoxZcXXGYnsUh3vmjglonm\"}', '2023-10-12 17:35:04', '2023-10-12 17:35:04'),
(489, 1, 'admin/customers', 'GET', '127.0.0.1', '[]', '2023-10-12 17:35:06', '2023-10-12 17:35:06'),
(490, 1, 'admin/customers', 'GET', '127.0.0.1', '[]', '2023-10-12 17:35:07', '2023-10-12 17:35:07'),
(491, 1, 'admin/customers/create', 'GET', '127.0.0.1', '[]', '2023-10-12 17:35:12', '2023-10-12 17:35:12'),
(492, 1, 'admin/customers/create', 'GET', '127.0.0.1', '[]', '2023-10-12 17:35:13', '2023-10-12 17:35:13'),
(493, 1, 'admin/customers/create', 'GET', '127.0.0.1', '[]', '2023-10-12 17:35:15', '2023-10-12 17:35:15'),
(494, 1, 'admin/customers/create', 'GET', '127.0.0.1', '[]', '2023-10-12 17:35:16', '2023-10-12 17:35:16'),
(495, 1, 'admin/customers/create', 'GET', '127.0.0.1', '[]', '2023-10-12 17:35:17', '2023-10-12 17:35:17'),
(496, 1, 'admin/customers/create', 'GET', '127.0.0.1', '[]', '2023-10-12 17:35:18', '2023-10-12 17:35:18'),
(497, 1, 'admin/customers/create', 'GET', '127.0.0.1', '[]', '2023-10-12 17:35:20', '2023-10-12 17:35:20'),
(498, 1, 'admin/customers/create', 'GET', '127.0.0.1', '[]', '2023-10-12 17:35:21', '2023-10-12 17:35:21'),
(499, 1, 'admin/customers/create', 'GET', '127.0.0.1', '[]', '2023-10-12 17:35:23', '2023-10-12 17:35:23'),
(500, 1, 'admin/customers/create', 'GET', '127.0.0.1', '[]', '2023-10-12 17:35:24', '2023-10-12 17:35:24'),
(501, 1, 'admin/customers/create', 'GET', '127.0.0.1', '[]', '2023-10-12 17:35:25', '2023-10-12 17:35:25'),
(502, 1, 'admin/customers/create', 'GET', '127.0.0.1', '[]', '2023-10-12 17:35:27', '2023-10-12 17:35:27'),
(503, 1, 'admin/customers/create', 'GET', '127.0.0.1', '[]', '2023-10-12 17:35:28', '2023-10-12 17:35:28'),
(504, 1, 'admin/customers/create', 'GET', '127.0.0.1', '[]', '2023-10-12 17:35:29', '2023-10-12 17:35:29'),
(505, 1, 'admin/customers/create', 'GET', '127.0.0.1', '[]', '2023-10-12 17:35:30', '2023-10-12 17:35:30'),
(506, 1, 'admin/customers/create', 'GET', '127.0.0.1', '[]', '2023-10-12 17:35:31', '2023-10-12 17:35:31'),
(507, 1, 'admin/customers/create', 'GET', '127.0.0.1', '[]', '2023-10-12 17:35:32', '2023-10-12 17:35:32'),
(508, 1, 'admin/customers/create', 'GET', '127.0.0.1', '[]', '2023-10-12 17:35:33', '2023-10-12 17:35:33'),
(509, 1, 'admin/customers/create', 'GET', '127.0.0.1', '[]', '2023-10-12 17:35:34', '2023-10-12 17:35:34'),
(510, 1, 'admin/customers/create', 'GET', '127.0.0.1', '[]', '2023-10-12 17:35:34', '2023-10-12 17:35:34'),
(511, 1, 'admin/customers/create', 'GET', '127.0.0.1', '[]', '2023-10-12 17:35:36', '2023-10-12 17:35:36'),
(512, 1, 'admin/customers/create', 'GET', '127.0.0.1', '[]', '2023-10-12 17:35:52', '2023-10-12 17:35:52'),
(513, 1, 'admin/customers', 'GET', '127.0.0.1', '[]', '2023-10-12 17:38:00', '2023-10-12 17:38:00'),
(514, 1, 'admin/customers/3', 'DELETE', '127.0.0.1', '{\"_method\":\"delete\",\"_token\":\"bIgwnTpNiYnCJBH04kqoxZcXXGYnsUh3vmjglonm\"}', '2023-10-12 17:38:06', '2023-10-12 17:38:06'),
(515, 1, 'admin/customers', 'GET', '127.0.0.1', '[]', '2023-10-12 17:38:09', '2023-10-12 17:38:09'),
(516, 1, 'admin/customers/create', 'GET', '127.0.0.1', '[]', '2023-10-12 17:38:12', '2023-10-12 17:38:12'),
(517, 1, 'admin/transactions', 'GET', '127.0.0.1', '[]', '2023-10-12 17:38:19', '2023-10-12 17:38:19'),
(518, 1, 'admin/accounts', 'GET', '127.0.0.1', '[]', '2023-10-12 17:38:21', '2023-10-12 17:38:21'),
(519, 1, 'admin/transactions/create', 'GET', '127.0.0.1', '[]', '2023-10-12 17:38:24', '2023-10-12 17:38:24'),
(520, 1, 'admin/credit_-cards', 'GET', '127.0.0.1', '[]', '2023-10-12 17:38:30', '2023-10-12 17:38:30'),
(521, 1, 'admin/accounts', 'GET', '127.0.0.1', '[]', '2023-10-12 17:38:35', '2023-10-12 17:38:35'),
(522, 1, 'admin/accounts/create', 'GET', '127.0.0.1', '[]', '2023-10-12 17:38:37', '2023-10-12 17:38:37'),
(523, 1, 'admin/accounts', 'POST', '127.0.0.1', '{\"credit_card_id\":\"2\",\"Customer_id\":\"2\",\"Account_no\":\"2\",\"Amount\":\"900\",\"_token\":\"bIgwnTpNiYnCJBH04kqoxZcXXGYnsUh3vmjglonm\"}', '2023-10-12 17:38:57', '2023-10-12 17:38:57'),
(524, 1, 'admin/accounts/create', 'GET', '127.0.0.1', '[]', '2023-10-12 17:38:57', '2023-10-12 17:38:57'),
(525, 1, 'admin/accounts', 'POST', '127.0.0.1', '{\"credit_card_id\":\"2\",\"Customer_id\":\"2\",\"Account_no\":\"1\",\"Amount\":\"900\",\"_token\":\"bIgwnTpNiYnCJBH04kqoxZcXXGYnsUh3vmjglonm\"}', '2023-10-12 17:39:22', '2023-10-12 17:39:22'),
(526, 1, 'admin/accounts/create', 'GET', '127.0.0.1', '[]', '2023-10-12 17:39:23', '2023-10-12 17:39:23'),
(527, 1, 'admin/customers', 'GET', '127.0.0.1', '[]', '2023-10-12 17:39:38', '2023-10-12 17:39:38'),
(528, 1, 'admin/customers/1/edit', 'GET', '127.0.0.1', '[]', '2023-10-12 17:39:48', '2023-10-12 17:39:48'),
(529, 1, 'admin/accounts', 'GET', '127.0.0.1', '[]', '2023-10-12 17:40:20', '2023-10-12 17:40:20'),
(530, 1, 'admin/accounts/create', 'GET', '127.0.0.1', '[]', '2023-10-12 17:40:23', '2023-10-12 17:40:23'),
(531, 1, 'admin/accounts', 'POST', '127.0.0.1', '{\"credit_card_id\":\"1\",\"Customer_id\":\"1\",\"Account_no\":\"12345678\",\"Amount\":\"900000000\",\"_token\":\"bIgwnTpNiYnCJBH04kqoxZcXXGYnsUh3vmjglonm\"}', '2023-10-12 17:40:36', '2023-10-12 17:40:36'),
(532, 1, 'admin/accounts/create', 'GET', '127.0.0.1', '[]', '2023-10-12 17:40:37', '2023-10-12 17:40:37'),
(533, 1, 'admin/accounts', 'POST', '127.0.0.1', '{\"credit_card_id\":\"1\",\"Customer_id\":\"1\",\"Account_no\":\"12345678\",\"Amount\":\"900000000\",\"_token\":\"bIgwnTpNiYnCJBH04kqoxZcXXGYnsUh3vmjglonm\"}', '2023-10-12 17:41:00', '2023-10-12 17:41:00'),
(534, 1, 'admin/accounts/create', 'GET', '127.0.0.1', '[]', '2023-10-12 17:41:01', '2023-10-12 17:41:01'),
(535, 1, 'admin/accounts/create', 'GET', '127.0.0.1', '[]', '2023-10-12 17:41:31', '2023-10-12 17:41:31'),
(536, 1, 'admin/accounts', 'GET', '127.0.0.1', '[]', '2023-10-12 17:41:38', '2023-10-12 17:41:38'),
(537, 1, 'admin/accounts/create', 'GET', '127.0.0.1', '[]', '2023-10-12 17:41:40', '2023-10-12 17:41:40'),
(538, 1, 'admin/accounts/create', 'GET', '127.0.0.1', '[]', '2023-10-12 17:42:11', '2023-10-12 17:42:11'),
(539, 1, 'admin/accounts', 'GET', '127.0.0.1', '[]', '2023-10-12 17:42:16', '2023-10-12 17:42:16'),
(540, 1, 'admin/accounts/create', 'GET', '127.0.0.1', '[]', '2023-10-12 17:42:19', '2023-10-12 17:42:19'),
(541, 1, 'admin/customers', 'GET', '127.0.0.1', '[]', '2023-10-12 17:43:10', '2023-10-12 17:43:10'),
(542, 1, 'admin/accounts', 'GET', '127.0.0.1', '[]', '2023-10-12 17:43:14', '2023-10-12 17:43:14'),
(543, 1, 'admin/credit_-cards', 'GET', '127.0.0.1', '[]', '2023-10-12 17:43:15', '2023-10-12 17:43:15'),
(544, 1, 'admin/accounts', 'GET', '127.0.0.1', '[]', '2023-10-12 17:43:16', '2023-10-12 17:43:16'),
(545, 1, 'admin/credit_-cards/create', 'GET', '127.0.0.1', '[]', '2023-10-12 17:43:18', '2023-10-12 17:43:18'),
(546, 1, 'admin/accounts', 'GET', '127.0.0.1', '[]', '2023-10-12 17:43:22', '2023-10-12 17:43:22'),
(547, 1, 'admin/accounts/create', 'GET', '127.0.0.1', '[]', '2023-10-12 17:43:24', '2023-10-12 17:43:24'),
(548, 1, 'admin/accounts/create', 'GET', '127.0.0.1', '[]', '2023-10-12 17:43:38', '2023-10-12 17:43:38'),
(549, 1, 'admin/accounts/create', 'GET', '127.0.0.1', '[]', '2023-10-12 17:45:04', '2023-10-12 17:45:04'),
(550, 1, 'admin/customers', 'GET', '127.0.0.1', '[]', '2023-10-12 17:45:08', '2023-10-12 17:45:08'),
(551, 1, 'admin/customers/create', 'GET', '127.0.0.1', '[]', '2023-10-12 17:45:10', '2023-10-12 17:45:10'),
(552, 1, 'admin/accounts', 'GET', '127.0.0.1', '[]', '2023-10-12 17:45:16', '2023-10-12 17:45:16'),
(553, 1, 'admin/customers', 'GET', '127.0.0.1', '[]', '2023-10-12 17:45:22', '2023-10-12 17:45:22'),
(554, 1, 'admin/accounts', 'GET', '127.0.0.1', '[]', '2023-10-12 17:45:38', '2023-10-12 17:45:38'),
(555, 1, 'admin/accounts/create', 'GET', '127.0.0.1', '[]', '2023-10-12 17:45:41', '2023-10-12 17:45:41'),
(556, 1, 'admin/customers', 'GET', '127.0.0.1', '[]', '2023-10-12 17:45:53', '2023-10-12 17:45:53'),
(557, 1, 'admin/customers/create', 'GET', '127.0.0.1', '[]', '2023-10-12 17:45:55', '2023-10-12 17:45:55'),
(558, 1, 'admin/customers', 'POST', '127.0.0.1', '{\"Email\":\"ben@ben.com\",\"First_Name\":\"ben\",\"Second_Name\":\"ben\",\"Password\":\"12345\",\"Account_id\":\"1\",\"_token\":\"bIgwnTpNiYnCJBH04kqoxZcXXGYnsUh3vmjglonm\"}', '2023-10-12 17:46:17', '2023-10-12 17:46:17'),
(559, 1, 'admin/customers', 'GET', '127.0.0.1', '[]', '2023-10-12 17:46:18', '2023-10-12 17:46:18'),
(560, 1, 'admin/accounts', 'GET', '127.0.0.1', '[]', '2023-10-12 17:46:29', '2023-10-12 17:46:29'),
(561, 1, 'admin/accounts/create', 'GET', '127.0.0.1', '[]', '2023-10-12 17:46:30', '2023-10-12 17:46:30'),
(562, 1, 'admin/accounts', 'POST', '127.0.0.1', '{\"credit_card_id\":\"1\",\"Customer_id\":\"1\",\"Account_no\":\"2345\",\"Amount\":\"23456\",\"_token\":\"bIgwnTpNiYnCJBH04kqoxZcXXGYnsUh3vmjglonm\"}', '2023-10-12 17:46:46', '2023-10-12 17:46:46'),
(563, 1, 'admin/accounts/create', 'GET', '127.0.0.1', '[]', '2023-10-12 17:46:47', '2023-10-12 17:46:47'),
(564, 1, 'admin/accounts', 'POST', '127.0.0.1', '{\"credit_card_id\":\"1\",\"Customer_id\":\"1\",\"Account_no\":\"1\",\"Amount\":\"23456\",\"_token\":\"bIgwnTpNiYnCJBH04kqoxZcXXGYnsUh3vmjglonm\"}', '2023-10-12 17:46:55', '2023-10-12 17:46:55'),
(565, 1, 'admin/accounts/create', 'GET', '127.0.0.1', '[]', '2023-10-12 17:46:56', '2023-10-12 17:46:56'),
(566, 1, 'admin/accounts', 'GET', '127.0.0.1', '[]', '2023-10-12 17:47:01', '2023-10-12 17:47:01'),
(567, 1, 'admin/customers', 'GET', '127.0.0.1', '[]', '2023-10-12 17:47:06', '2023-10-12 17:47:06'),
(568, 1, 'admin/accounts', 'GET', '127.0.0.1', '[]', '2023-10-12 17:47:10', '2023-10-12 17:47:10'),
(569, 1, 'admin/accounts/create', 'GET', '127.0.0.1', '[]', '2023-10-12 17:47:15', '2023-10-12 17:47:15'),
(570, 1, 'admin/accounts', 'POST', '127.0.0.1', '{\"credit_card_id\":\"1\",\"Customer_id\":\"1\",\"Account_no\":\"1\",\"Amount\":\"1\",\"_token\":\"bIgwnTpNiYnCJBH04kqoxZcXXGYnsUh3vmjglonm\"}', '2023-10-12 17:47:24', '2023-10-12 17:47:24'),
(571, 1, 'admin/accounts/create', 'GET', '127.0.0.1', '[]', '2023-10-12 17:47:25', '2023-10-12 17:47:25'),
(572, 1, 'admin/accounts', 'GET', '127.0.0.1', '[]', '2023-10-12 17:47:51', '2023-10-12 17:47:51'),
(573, 1, 'admin/customers', 'GET', '127.0.0.1', '[]', '2023-10-12 17:47:53', '2023-10-12 17:47:53'),
(574, 1, 'admin/accounts', 'GET', '127.0.0.1', '[]', '2023-10-12 17:48:19', '2023-10-12 17:48:19'),
(575, 1, 'admin/customers', 'GET', '127.0.0.1', '[]', '2023-10-12 17:48:51', '2023-10-12 17:48:51'),
(576, 1, 'admin/accounts', 'GET', '127.0.0.1', '[]', '2023-10-12 17:48:53', '2023-10-12 17:48:53'),
(577, 1, 'admin/accounts/create', 'GET', '127.0.0.1', '[]', '2023-10-12 17:48:56', '2023-10-12 17:48:56'),
(578, 1, 'admin/accounts', 'POST', '127.0.0.1', '{\"credit_card_id\":\"1\",\"Customer_id\":\"1\",\"Account_no\":\"1\",\"Amount\":\"1\",\"_token\":\"bIgwnTpNiYnCJBH04kqoxZcXXGYnsUh3vmjglonm\"}', '2023-10-12 17:49:00', '2023-10-12 17:49:00'),
(579, 1, 'admin/accounts/create', 'GET', '127.0.0.1', '[]', '2023-10-12 17:49:01', '2023-10-12 17:49:01'),
(580, 1, 'admin/accounts', 'GET', '127.0.0.1', '[]', '2023-10-12 17:49:18', '2023-10-12 17:49:18'),
(581, 1, 'admin/customers', 'GET', '127.0.0.1', '[]', '2023-10-12 17:49:26', '2023-10-12 17:49:26'),
(582, 1, 'admin', 'GET', '127.0.0.1', '[]', '2023-10-22 08:54:17', '2023-10-22 08:54:17'),
(583, 1, 'admin/transactions', 'GET', '127.0.0.1', '[]', '2023-10-22 08:54:41', '2023-10-22 08:54:41'),
(584, 1, 'admin/credit_-cards', 'GET', '127.0.0.1', '[]', '2023-10-22 08:55:03', '2023-10-22 08:55:03'),
(585, 1, 'admin/credit_-cards/create', 'GET', '127.0.0.1', '[]', '2023-10-22 08:55:07', '2023-10-22 08:55:07'),
(586, 1, 'admin/customers', 'GET', '127.0.0.1', '[]', '2023-10-22 08:55:18', '2023-10-22 08:55:18'),
(587, 1, 'admin/customers', 'GET', '127.0.0.1', '[]', '2023-10-22 09:44:59', '2023-10-22 09:44:59'),
(588, 1, 'admin/customers/1/edit', 'GET', '127.0.0.1', '[]', '2023-10-22 09:45:09', '2023-10-22 09:45:09'),
(589, 1, 'admin/credit_-cards', 'GET', '127.0.0.1', '[]', '2023-10-22 09:45:38', '2023-10-22 09:45:38'),
(590, 1, 'admin/report-transactions', 'GET', '127.0.0.1', '[]', '2023-10-22 09:45:40', '2023-10-22 09:45:40'),
(591, 1, 'admin/transactions', 'GET', '127.0.0.1', '[]', '2023-10-22 09:45:43', '2023-10-22 09:45:43'),
(592, 1, 'admin/customers', 'GET', '127.0.0.1', '[]', '2023-10-22 09:45:53', '2023-10-22 09:45:53'),
(593, 1, 'admin/customers', 'GET', '127.0.0.1', '[]', '2023-10-22 09:46:16', '2023-10-22 09:46:16'),
(594, 1, 'admin/customers', 'GET', '127.0.0.1', '[]', '2023-10-22 09:46:40', '2023-10-22 09:46:40'),
(595, 1, 'admin/customers', 'GET', '127.0.0.1', '[]', '2023-10-22 09:47:28', '2023-10-22 09:47:28'),
(596, 1, 'admin/customers', 'GET', '127.0.0.1', '[]', '2023-10-22 09:48:09', '2023-10-22 09:48:09'),
(597, 1, 'admin/customers/1/edit', 'GET', '127.0.0.1', '[]', '2023-10-22 09:48:47', '2023-10-22 09:48:47'),
(598, 1, 'admin/customers', 'GET', '127.0.0.1', '[]', '2023-10-22 09:48:51', '2023-10-22 09:48:51'),
(599, 1, 'admin/customers', 'GET', '127.0.0.1', '[]', '2023-10-22 09:49:08', '2023-10-22 09:49:08'),
(600, 1, 'admin/accounts', 'GET', '127.0.0.1', '[]', '2023-10-22 09:49:13', '2023-10-22 09:49:13'),
(601, 1, 'admin/credit_-cards', 'GET', '127.0.0.1', '[]', '2023-10-22 09:49:16', '2023-10-22 09:49:16'),
(602, 1, 'admin/report-transactions', 'GET', '127.0.0.1', '[]', '2023-10-22 09:49:19', '2023-10-22 09:49:19'),
(603, 1, 'admin/transactions', 'GET', '127.0.0.1', '[]', '2023-10-22 09:49:20', '2023-10-22 09:49:20'),
(604, 1, 'admin/transactions', 'GET', '127.0.0.1', '[]', '2023-10-22 09:50:55', '2023-10-22 09:50:55'),
(605, 1, 'admin/transactions', 'GET', '127.0.0.1', '[]', '2023-10-22 09:51:21', '2023-10-22 09:51:21'),
(606, 1, 'admin/report-transactions', 'GET', '127.0.0.1', '[]', '2023-10-22 10:01:52', '2023-10-22 10:01:52'),
(607, 1, 'admin/report-transactions/create', 'GET', '127.0.0.1', '[]', '2023-10-22 10:01:55', '2023-10-22 10:01:55'),
(608, 1, 'admin/report-transactions', 'GET', '127.0.0.1', '[]', '2023-10-22 10:02:03', '2023-10-22 10:02:03'),
(609, 1, 'admin/customers', 'GET', '127.0.0.1', '[]', '2023-10-22 10:03:16', '2023-10-22 10:03:16'),
(610, 1, 'admin/customers/create', 'GET', '127.0.0.1', '[]', '2023-10-22 10:03:20', '2023-10-22 10:03:20'),
(611, 1, 'admin/accounts', 'GET', '127.0.0.1', '[]', '2023-10-22 10:03:23', '2023-10-22 10:03:23'),
(612, 1, 'admin/accounts/create', 'GET', '127.0.0.1', '[]', '2023-10-22 10:03:25', '2023-10-22 10:03:25'),
(613, 1, 'admin/credit_-cards', 'GET', '127.0.0.1', '[]', '2023-10-22 10:04:07', '2023-10-22 10:04:07'),
(614, 1, 'admin/report-transactions', 'GET', '127.0.0.1', '[]', '2023-10-22 10:04:10', '2023-10-22 10:04:10'),
(615, 1, 'admin/transactions', 'GET', '127.0.0.1', '[]', '2023-10-22 10:04:14', '2023-10-22 10:04:14'),
(616, 1, 'admin/credit_-cards', 'GET', '127.0.0.1', '[]', '2023-10-22 10:04:15', '2023-10-22 10:04:15'),
(617, 1, 'admin/credit_-cards/create', 'GET', '127.0.0.1', '[]', '2023-10-22 10:04:43', '2023-10-22 10:04:43'),
(618, 1, 'admin/credit_-cards/create', 'GET', '127.0.0.1', '[]', '2023-10-22 10:04:55', '2023-10-22 10:04:55'),
(619, 1, 'admin', 'GET', '127.0.0.1', '[]', '2023-10-22 10:05:08', '2023-10-22 10:05:08'),
(620, 1, 'admin', 'GET', '127.0.0.1', '[]', '2023-10-22 10:07:23', '2023-10-22 10:07:23'),
(621, 1, 'admin', 'GET', '127.0.0.1', '[]', '2023-10-22 10:07:49', '2023-10-22 10:07:49'),
(622, 1, 'admin', 'GET', '127.0.0.1', '[]', '2023-10-22 10:08:11', '2023-10-22 10:08:11'),
(623, 1, 'admin/auth/logout', 'GET', '127.0.0.1', '[]', '2023-10-22 10:08:49', '2023-10-22 10:08:49'),
(624, 1, 'admin', 'GET', '127.0.0.1', '[]', '2023-10-24 05:00:32', '2023-10-24 05:00:32'),
(625, 1, 'admin/customers', 'GET', '127.0.0.1', '[]', '2023-10-24 05:00:56', '2023-10-24 05:00:56'),
(626, 1, 'admin/customers', 'GET', '127.0.0.1', '[]', '2023-10-24 05:00:57', '2023-10-24 05:00:57'),
(627, 1, 'admin/customers', 'GET', '127.0.0.1', '[]', '2023-10-24 05:00:59', '2023-10-24 05:00:59'),
(628, 1, 'admin/customers', 'GET', '127.0.0.1', '[]', '2023-10-24 05:00:59', '2023-10-24 05:00:59'),
(629, 1, 'admin/customers', 'GET', '127.0.0.1', '[]', '2023-10-24 05:01:01', '2023-10-24 05:01:01'),
(630, 1, 'admin/customers', 'GET', '127.0.0.1', '[]', '2023-10-24 05:01:02', '2023-10-24 05:01:02'),
(631, 1, 'admin/customers', 'GET', '127.0.0.1', '[]', '2023-10-24 05:01:04', '2023-10-24 05:01:04'),
(632, 1, 'admin/customers', 'GET', '127.0.0.1', '[]', '2023-10-24 05:01:05', '2023-10-24 05:01:05'),
(633, 1, 'admin/customers', 'GET', '127.0.0.1', '[]', '2023-10-24 05:01:05', '2023-10-24 05:01:05'),
(634, 1, 'admin/customers', 'GET', '127.0.0.1', '[]', '2023-10-24 05:01:07', '2023-10-24 05:01:07'),
(635, 1, 'admin/customers', 'GET', '127.0.0.1', '[]', '2023-10-24 05:01:08', '2023-10-24 05:01:08'),
(636, 1, 'admin/customers', 'GET', '127.0.0.1', '[]', '2023-10-24 05:01:09', '2023-10-24 05:01:09'),
(637, 1, 'admin/customers', 'GET', '127.0.0.1', '[]', '2023-10-24 05:01:11', '2023-10-24 05:01:11'),
(638, 1, 'admin/customers', 'GET', '127.0.0.1', '[]', '2023-10-24 05:01:12', '2023-10-24 05:01:12'),
(639, 1, 'admin/customers', 'GET', '127.0.0.1', '[]', '2023-10-24 05:01:13', '2023-10-24 05:01:13'),
(640, 1, 'admin/customers', 'GET', '127.0.0.1', '[]', '2023-10-24 05:01:15', '2023-10-24 05:01:15'),
(641, 1, 'admin/customers', 'GET', '127.0.0.1', '[]', '2023-10-24 05:01:16', '2023-10-24 05:01:16'),
(642, 1, 'admin/customers', 'GET', '127.0.0.1', '[]', '2023-10-24 05:01:17', '2023-10-24 05:01:17'),
(643, 1, 'admin/customers', 'GET', '127.0.0.1', '[]', '2023-10-24 05:01:18', '2023-10-24 05:01:18'),
(644, 1, 'admin/customers', 'GET', '127.0.0.1', '[]', '2023-10-24 05:01:19', '2023-10-24 05:01:19'),
(645, 1, 'admin/customers', 'GET', '127.0.0.1', '[]', '2023-10-24 05:01:20', '2023-10-24 05:01:20'),
(646, 1, 'admin/customers', 'GET', '127.0.0.1', '[]', '2023-10-24 05:01:26', '2023-10-24 05:01:26'),
(647, 1, 'admin/customers', 'GET', '127.0.0.1', '[]', '2023-10-24 05:01:27', '2023-10-24 05:01:27'),
(648, 1, 'admin/customers', 'GET', '127.0.0.1', '[]', '2023-10-24 05:01:28', '2023-10-24 05:01:28'),
(649, 1, 'admin/customers', 'GET', '127.0.0.1', '[]', '2023-10-24 05:01:29', '2023-10-24 05:01:29'),
(650, 1, 'admin/customers', 'GET', '127.0.0.1', '[]', '2023-10-24 05:01:30', '2023-10-24 05:01:30'),
(651, 1, 'admin/customers', 'GET', '127.0.0.1', '[]', '2023-10-24 05:01:31', '2023-10-24 05:01:31'),
(652, 1, 'admin/customers', 'GET', '127.0.0.1', '[]', '2023-10-24 05:01:32', '2023-10-24 05:01:32'),
(653, 1, 'admin/customers', 'GET', '127.0.0.1', '[]', '2023-10-24 05:01:33', '2023-10-24 05:01:33'),
(654, 1, 'admin/customers', 'GET', '127.0.0.1', '[]', '2023-10-24 05:01:35', '2023-10-24 05:01:35'),
(655, 1, 'admin/customers', 'GET', '127.0.0.1', '[]', '2023-10-24 05:01:36', '2023-10-24 05:01:36'),
(656, 1, 'admin/customers', 'GET', '127.0.0.1', '[]', '2023-10-24 05:01:37', '2023-10-24 05:01:37'),
(657, 1, 'admin/customers', 'GET', '127.0.0.1', '[]', '2023-10-24 05:01:38', '2023-10-24 05:01:38'),
(658, 1, 'admin/customers', 'GET', '127.0.0.1', '[]', '2023-10-24 05:01:39', '2023-10-24 05:01:39'),
(659, 1, 'admin/customers', 'GET', '127.0.0.1', '[]', '2023-10-24 05:01:40', '2023-10-24 05:01:40'),
(660, 1, 'admin/customers', 'GET', '127.0.0.1', '[]', '2023-10-24 05:01:42', '2023-10-24 05:01:42'),
(661, 1, 'admin/customers', 'GET', '127.0.0.1', '[]', '2023-10-24 05:01:43', '2023-10-24 05:01:43'),
(662, 1, 'admin/customers', 'GET', '127.0.0.1', '[]', '2023-10-24 05:01:44', '2023-10-24 05:01:44'),
(663, 1, 'admin/customers', 'GET', '127.0.0.1', '[]', '2023-10-24 05:01:46', '2023-10-24 05:01:46'),
(664, 1, 'admin/customers', 'GET', '127.0.0.1', '[]', '2023-10-24 05:01:48', '2023-10-24 05:01:48'),
(665, 1, 'admin/customers', 'GET', '127.0.0.1', '[]', '2023-10-24 05:01:49', '2023-10-24 05:01:49'),
(666, 1, 'admin/customers', 'GET', '127.0.0.1', '[]', '2023-10-24 05:01:51', '2023-10-24 05:01:51'),
(667, 1, 'admin/transactions', 'GET', '127.0.0.1', '[]', '2023-10-24 05:02:25', '2023-10-24 05:02:25'),
(668, 1, 'admin/customers', 'GET', '127.0.0.1', '[]', '2023-10-24 05:02:40', '2023-10-24 05:02:40'),
(669, 1, 'admin/accounts', 'GET', '127.0.0.1', '[]', '2023-10-24 05:02:42', '2023-10-24 05:02:42'),
(670, 1, 'admin/credit_-cards', 'GET', '127.0.0.1', '[]', '2023-10-24 05:02:44', '2023-10-24 05:02:44'),
(671, 1, 'admin/report-transactions', 'GET', '127.0.0.1', '[]', '2023-10-24 05:02:46', '2023-10-24 05:02:46'),
(672, 1, 'admin/transactions', 'GET', '127.0.0.1', '[]', '2023-10-24 05:02:48', '2023-10-24 05:02:48'),
(673, 1, 'admin', 'GET', '127.0.0.1', '[]', '2023-10-24 05:02:52', '2023-10-24 05:02:52'),
(674, 1, 'admin/auth/logout', 'GET', '127.0.0.1', '[]', '2023-10-24 05:03:14', '2023-10-24 05:03:14'),
(675, 2, 'admin', 'GET', '127.0.0.1', '[]', '2023-10-24 05:04:33', '2023-10-24 05:04:33'),
(676, 2, 'admin/customers', 'GET', '127.0.0.1', '[]', '2023-10-24 05:04:39', '2023-10-24 05:04:39'),
(677, 2, 'admin/customers/1/edit', 'GET', '127.0.0.1', '[]', '2023-10-24 05:04:43', '2023-10-24 05:04:43'),
(678, 2, 'admin/customers', 'GET', '127.0.0.1', '[]', '2023-10-24 05:04:49', '2023-10-24 05:04:49'),
(679, 2, 'admin/accounts', 'GET', '127.0.0.1', '[]', '2023-10-24 05:04:52', '2023-10-24 05:04:52'),
(680, 2, 'admin/accounts/1/edit', 'GET', '127.0.0.1', '[]', '2023-10-24 05:04:55', '2023-10-24 05:04:55'),
(681, 2, 'admin/credit_-cards', 'GET', '127.0.0.1', '[]', '2023-10-24 05:04:59', '2023-10-24 05:04:59'),
(682, 2, 'admin/credit_-cards/1/edit', 'GET', '127.0.0.1', '[]', '2023-10-24 05:05:02', '2023-10-24 05:05:02'),
(683, 2, 'admin/report-transactions', 'GET', '127.0.0.1', '[]', '2023-10-24 05:05:07', '2023-10-24 05:05:07'),
(684, 2, 'admin/transactions', 'GET', '127.0.0.1', '[]', '2023-10-24 05:05:09', '2023-10-24 05:05:09'),
(685, 2, 'admin/credit_-cards', 'GET', '127.0.0.1', '[]', '2023-10-24 05:05:11', '2023-10-24 05:05:11'),
(686, 2, 'admin/transactions', 'GET', '127.0.0.1', '[]', '2023-10-24 05:05:14', '2023-10-24 05:05:14'),
(687, 2, 'admin/credit_-cards', 'GET', '127.0.0.1', '[]', '2023-10-24 05:05:16', '2023-10-24 05:05:16'),
(688, 2, 'admin/credit_-cards/1/edit', 'GET', '127.0.0.1', '[]', '2023-10-24 05:05:20', '2023-10-24 05:05:20'),
(689, 2, 'admin/credit_-cards/1/edit', 'GET', '127.0.0.1', '[]', '2023-10-24 05:05:46', '2023-10-24 05:05:46'),
(690, 2, 'admin/transactions', 'GET', '127.0.0.1', '[]', '2023-10-24 05:05:54', '2023-10-24 05:05:54'),
(691, 2, 'admin/auth/logout', 'GET', '127.0.0.1', '[]', '2023-10-24 05:05:57', '2023-10-24 05:05:57'),
(692, 1, 'admin', 'GET', '127.0.0.1', '[]', '2023-10-24 05:06:05', '2023-10-24 05:06:05'),
(693, 1, 'admin/transactions', 'GET', '127.0.0.1', '[]', '2023-10-24 05:06:12', '2023-10-24 05:06:12'),
(694, 1, 'admin/auth/users', 'GET', '127.0.0.1', '[]', '2023-10-24 05:06:18', '2023-10-24 05:06:18'),
(695, 1, 'admin/auth/users/2/edit', 'GET', '127.0.0.1', '[]', '2023-10-24 05:06:22', '2023-10-24 05:06:22'),
(696, 1, 'admin/auth/permissions', 'GET', '127.0.0.1', '[]', '2023-10-24 05:06:45', '2023-10-24 05:06:45'),
(697, 1, 'admin/auth/permissions/11/edit', 'GET', '127.0.0.1', '[]', '2023-10-24 05:07:00', '2023-10-24 05:07:00'),
(698, 1, 'admin/auth/permissions/11', 'PUT', '127.0.0.1', '{\"slug\":\"auth.View\",\"name\":\"Admin_View\",\"search_terms\":null,\"http_method\":[null],\"http_path\":\"\\/customers\\/*\\r\\n\\/accounts\\/*\\r\\n\\/credit_-cards\\/*\\r\\n\\/report-transactions\\/*\\r\\n\\/transactions\\/*\",\"_token\":\"JwsmbdP4D6AvNF4eIGy5LVBnKhTSRxDWFsVWA9Sw\",\"_method\":\"PUT\"}', '2023-10-24 05:07:28', '2023-10-24 05:07:28'),
(699, 1, 'admin/auth/permissions', 'GET', '127.0.0.1', '[]', '2023-10-24 05:07:28', '2023-10-24 05:07:28'),
(700, 1, 'admin/auth/permissions/7/edit', 'GET', '127.0.0.1', '[]', '2023-10-24 05:07:51', '2023-10-24 05:07:51'),
(701, 1, 'admin/auth/permissions/7', 'PUT', '127.0.0.1', '{\"slug\":\"auth.Read\",\"name\":\"Admin Read\",\"search_terms\":null,\"http_method\":[null],\"http_path\":\"\\/customers\\r\\n\\/accounts\\r\\n\\/credit_-cards\\r\\n\\/accounts\\r\\n\\/report-transactions\\r\\n\\/transactions\",\"_token\":\"JwsmbdP4D6AvNF4eIGy5LVBnKhTSRxDWFsVWA9Sw\",\"_method\":\"PUT\"}', '2023-10-24 05:08:04', '2023-10-24 05:08:04'),
(702, 1, 'admin/auth/permissions', 'GET', '127.0.0.1', '[]', '2023-10-24 05:08:05', '2023-10-24 05:08:05'),
(703, 1, 'admin/auth/logout', 'GET', '127.0.0.1', '[]', '2023-10-24 05:08:12', '2023-10-24 05:08:12'),
(704, 2, 'admin', 'GET', '127.0.0.1', '[]', '2023-10-24 05:08:23', '2023-10-24 05:08:23'),
(705, 2, 'admin/transactions', 'GET', '127.0.0.1', '[]', '2023-10-24 05:08:32', '2023-10-24 05:08:32'),
(706, 2, 'admin/transactions/1/edit', 'GET', '127.0.0.1', '[]', '2023-10-24 05:08:35', '2023-10-24 05:08:35'),
(707, 2, 'admin/transactions', 'GET', '127.0.0.1', '[]', '2023-10-24 05:08:42', '2023-10-24 05:08:42'),
(708, 2, 'admin/auth/logout', 'GET', '127.0.0.1', '[]', '2023-10-24 05:08:45', '2023-10-24 05:08:45'),
(709, 1, 'admin', 'GET', '127.0.0.1', '[]', '2023-10-24 05:08:53', '2023-10-24 05:08:53'),
(710, 1, 'admin/auth/permissions', 'GET', '127.0.0.1', '[]', '2023-10-24 05:09:04', '2023-10-24 05:09:04'),
(711, 1, 'admin/auth/permissions/11/edit', 'GET', '127.0.0.1', '[]', '2023-10-24 05:09:14', '2023-10-24 05:09:14'),
(712, 1, 'admin/auth/permissions/11', 'PUT', '127.0.0.1', '{\"slug\":\"auth.View\",\"name\":\"Admin_View\",\"search_terms\":null,\"http_method\":[null],\"http_path\":\"\\/customers\\/*\\r\\n\\/accounts\\/*\\r\\n\\/credit_-cards\\/*\\r\\n\\/report-transactions\\/*\",\"_token\":\"7l0x9sGQXCTrMqYiZeQIEBAioXY2Y5Su7yLVVQp3\",\"_method\":\"PUT\"}', '2023-10-24 05:09:21', '2023-10-24 05:09:21'),
(713, 1, 'admin/auth/permissions', 'GET', '127.0.0.1', '[]', '2023-10-24 05:09:22', '2023-10-24 05:09:22'),
(714, 1, 'admin/auth/permissions/10/edit', 'GET', '127.0.0.1', '[]', '2023-10-24 05:22:57', '2023-10-24 05:22:57'),
(715, 1, 'admin/auth/permissions/10', 'PUT', '127.0.0.1', '{\"slug\":\"auth.Delete\",\"name\":\"Admin_Delete\",\"search_terms\":null,\"http_method\":[null],\"http_path\":\"\\/customers\\/delete\\r\\n\\/accounts\\/delete\\r\\n\\/credit_-cards\\/delete\\r\\n\\/report-transactions\\/delete\",\"_token\":\"7l0x9sGQXCTrMqYiZeQIEBAioXY2Y5Su7yLVVQp3\",\"_method\":\"PUT\"}', '2023-10-24 05:23:07', '2023-10-24 05:23:07'),
(716, 1, 'admin/auth/permissions', 'GET', '127.0.0.1', '[]', '2023-10-24 05:23:09', '2023-10-24 05:23:09'),
(717, 1, 'admin', 'GET', '127.0.0.1', '[]', '2023-10-24 08:35:17', '2023-10-24 08:35:17'),
(718, 1, 'admin', 'GET', '127.0.0.1', '[]', '2023-10-24 08:35:30', '2023-10-24 08:35:30'),
(719, 1, 'admin', 'GET', '127.0.0.1', '[]', '2023-10-24 08:37:02', '2023-10-24 08:37:02'),
(720, 1, 'admin/auth/users', 'GET', '127.0.0.1', '[]', '2023-10-24 08:37:07', '2023-10-24 08:37:07'),
(721, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '[]', '2023-10-24 08:37:13', '2023-10-24 08:37:13'),
(722, 1, 'admin', 'GET', '127.0.0.1', '[]', '2023-10-24 08:38:29', '2023-10-24 08:38:29'),
(723, 1, 'admin/auth/menu', 'POST', '127.0.0.1', '{\"parent_id\":\"0\",\"search_terms\":null,\"title\":\"predictions\",\"icon\":\"icon-balance-scale\",\"uri\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/predictions\",\"roles\":[\"2\",\"1\",null],\"permission\":\"*\",\"_token\":\"lFRNXHRZoyeNdwizRCPSuRvKFUASQSIUELyULfwB\"}', '2023-10-24 08:39:07', '2023-10-24 08:39:07'),
(724, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '[]', '2023-10-24 08:39:09', '2023-10-24 08:39:09'),
(725, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '[]', '2023-10-24 08:39:17', '2023-10-24 08:39:17'),
(726, 1, 'admin/auth/menu/18/edit', 'GET', '127.0.0.1', '[]', '2023-10-24 08:39:54', '2023-10-24 08:39:54'),
(727, 1, 'admin/auth/menu/18', 'PUT', '127.0.0.1', '{\"parent_id\":\"17\",\"search_terms\":null,\"title\":\"predictions\",\"icon\":\"icon-balance-scale\",\"uri\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/predictions\",\"roles\":[\"2\",\"1\",null],\"permission\":\"*\",\"_token\":\"lFRNXHRZoyeNdwizRCPSuRvKFUASQSIUELyULfwB\",\"_method\":\"PUT\"}', '2023-10-24 08:40:26', '2023-10-24 08:40:26'),
(728, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '[]', '2023-10-24 08:40:27', '2023-10-24 08:40:27'),
(729, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '[]', '2023-10-24 08:40:35', '2023-10-24 08:40:35'),
(730, 1, 'admin/auth/menu/18/edit', 'GET', '127.0.0.1', '[]', '2023-10-24 08:40:50', '2023-10-24 08:40:50'),
(731, 1, 'admin/transactions', 'GET', '127.0.0.1', '[]', '2023-10-24 08:41:07', '2023-10-24 08:41:07'),
(732, 1, 'admin/auth/menu/18', 'PUT', '127.0.0.1', '{\"parent_id\":\"17\",\"search_terms\":null,\"title\":\"predictions\",\"icon\":\"icon-balance-scale\",\"uri\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/transactions\",\"roles\":[\"2\",\"1\",null],\"permission\":\"*\",\"_token\":\"lFRNXHRZoyeNdwizRCPSuRvKFUASQSIUELyULfwB\",\"_method\":\"PUT\"}', '2023-10-24 08:41:28', '2023-10-24 08:41:28'),
(733, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '[]', '2023-10-24 08:41:29', '2023-10-24 08:41:29'),
(734, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '[]', '2023-10-24 08:41:37', '2023-10-24 08:41:37'),
(735, 1, 'admin', 'GET', '127.0.0.1', '[]', '2023-10-24 08:41:52', '2023-10-24 08:41:52'),
(736, 1, 'admin/transactions', 'GET', '127.0.0.1', '[]', '2023-10-24 08:41:55', '2023-10-24 08:41:55'),
(737, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '[]', '2023-10-24 08:42:14', '2023-10-24 08:42:14'),
(738, 1, 'admin/auth/menu/18/edit', 'GET', '127.0.0.1', '[]', '2023-10-24 08:42:18', '2023-10-24 08:42:18'),
(739, 1, 'admin/auth/menu/18', 'PUT', '127.0.0.1', '{\"parent_id\":\"17\",\"search_terms\":null,\"title\":\"predictions\",\"icon\":\"icon-balance-scale\",\"uri\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/transactions\\/predict\",\"roles\":[\"2\",\"1\",null],\"permission\":\"*\",\"_token\":\"lFRNXHRZoyeNdwizRCPSuRvKFUASQSIUELyULfwB\",\"_method\":\"PUT\"}', '2023-10-24 08:42:31', '2023-10-24 08:42:31'),
(740, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '[]', '2023-10-24 08:42:32', '2023-10-24 08:42:32'),
(741, 1, 'admin/auth/menu/17/edit', 'GET', '127.0.0.1', '[]', '2023-10-24 08:42:40', '2023-10-24 08:42:40'),
(742, 1, 'admin/auth/menu/17', 'PUT', '127.0.0.1', '{\"parent_id\":\"0\",\"search_terms\":null,\"title\":\"Transactions\",\"icon\":\"icon-file\",\"uri\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/transactions\",\"roles\":[null],\"permission\":null,\"_token\":\"lFRNXHRZoyeNdwizRCPSuRvKFUASQSIUELyULfwB\",\"_method\":\"PUT\"}', '2023-10-24 08:42:57', '2023-10-24 08:42:57'),
(743, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '[]', '2023-10-24 08:42:58', '2023-10-24 08:42:58'),
(744, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '[]', '2023-10-24 08:43:05', '2023-10-24 08:43:05'),
(745, 1, 'admin/transactions/predict', 'GET', '127.0.0.1', '[]', '2023-10-24 08:43:12', '2023-10-24 08:43:12'),
(746, 1, 'admin/auth/menu/18/edit', 'GET', '127.0.0.1', '[]', '2023-10-24 08:43:17', '2023-10-24 08:43:17'),
(747, 1, 'admin/auth/menu/18', 'PUT', '127.0.0.1', '{\"parent_id\":\"0\",\"search_terms\":null,\"title\":\"predictions\",\"icon\":\"icon-balance-scale\",\"uri\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/predict\",\"roles\":[\"2\",\"1\",null],\"permission\":\"*\",\"_token\":\"lFRNXHRZoyeNdwizRCPSuRvKFUASQSIUELyULfwB\",\"_method\":\"PUT\"}', '2023-10-24 08:43:37', '2023-10-24 08:43:37'),
(748, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '[]', '2023-10-24 08:43:39', '2023-10-24 08:43:39'),
(749, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '[]', '2023-10-24 08:43:42', '2023-10-24 08:43:42'),
(750, 1, 'admin/transactions', 'GET', '127.0.0.1', '[]', '2023-10-24 08:43:47', '2023-10-24 08:43:47'),
(751, 1, 'admin/transactions', 'GET', '127.0.0.1', '[]', '2023-10-24 08:43:54', '2023-10-24 08:43:54'),
(752, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '[]', '2023-10-24 08:44:13', '2023-10-24 08:44:13'),
(753, 1, 'admin/auth/menu/17/edit', 'GET', '127.0.0.1', '[]', '2023-10-24 08:44:20', '2023-10-24 08:44:20'),
(754, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '[]', '2023-10-24 08:44:29', '2023-10-24 08:44:29'),
(755, 1, 'admin/auth/menu/18/edit', 'GET', '127.0.0.1', '[]', '2023-10-24 08:44:33', '2023-10-24 08:44:33'),
(756, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '[]', '2023-10-24 08:44:45', '2023-10-24 08:44:45'),
(757, 1, 'admin/auth/menu/18/edit', 'GET', '127.0.0.1', '[]', '2023-10-24 08:45:28', '2023-10-24 08:45:28'),
(758, 1, 'admin/predict', 'GET', '127.0.0.1', '[]', '2023-10-24 08:49:10', '2023-10-24 08:49:10'),
(759, 1, 'admin/auth/menu/18/edit', 'GET', '127.0.0.1', '[]', '2023-10-24 08:50:02', '2023-10-24 08:50:02'),
(760, 1, 'admin/predict', 'GET', '127.0.0.1', '[]', '2023-10-24 08:50:07', '2023-10-24 08:50:07'),
(761, 1, 'admin/predict', 'GET', '127.0.0.1', '[]', '2023-10-24 08:51:22', '2023-10-24 08:51:22'),
(762, 1, 'admin/predict', 'GET', '127.0.0.1', '[]', '2023-10-24 08:53:37', '2023-10-24 08:53:37'),
(763, 1, 'admin/predict', 'GET', '127.0.0.1', '[]', '2023-10-24 08:56:03', '2023-10-24 08:56:03'),
(764, 1, 'admin/predict', 'GET', '127.0.0.1', '[]', '2023-10-24 08:56:11', '2023-10-24 08:56:11'),
(765, 1, 'admin/auth/menu/18/edit', 'GET', '127.0.0.1', '[]', '2023-10-24 08:56:37', '2023-10-24 08:56:37'),
(766, 1, 'admin', 'GET', '127.0.0.1', '[]', '2023-10-24 09:01:35', '2023-10-24 09:01:35'),
(767, 1, 'admin', 'GET', '127.0.0.1', '[]', '2023-10-24 09:01:36', '2023-10-24 09:01:36'),
(768, 1, 'admin', 'GET', '127.0.0.1', '[]', '2023-10-24 09:01:36', '2023-10-24 09:01:36'),
(769, 1, 'admin', 'GET', '127.0.0.1', '[]', '2023-10-24 09:01:37', '2023-10-24 09:01:37'),
(770, 1, 'admin', 'GET', '127.0.0.1', '[]', '2023-10-24 09:01:37', '2023-10-24 09:01:37'),
(771, 1, 'admin', 'GET', '127.0.0.1', '[]', '2023-10-24 09:01:38', '2023-10-24 09:01:38'),
(772, 1, 'admin', 'GET', '127.0.0.1', '[]', '2023-10-24 09:01:38', '2023-10-24 09:01:38'),
(773, 1, 'admin', 'GET', '127.0.0.1', '[]', '2023-10-24 09:01:39', '2023-10-24 09:01:39'),
(774, 1, 'admin', 'GET', '127.0.0.1', '[]', '2023-10-24 09:01:39', '2023-10-24 09:01:39'),
(775, 1, 'admin', 'GET', '127.0.0.1', '[]', '2023-10-24 09:01:40', '2023-10-24 09:01:40'),
(776, 1, 'admin', 'GET', '127.0.0.1', '[]', '2023-10-24 09:01:40', '2023-10-24 09:01:40'),
(777, 1, 'admin', 'GET', '127.0.0.1', '[]', '2023-10-24 09:01:41', '2023-10-24 09:01:41'),
(778, 1, 'admin', 'GET', '127.0.0.1', '[]', '2023-10-24 09:01:41', '2023-10-24 09:01:41'),
(779, 1, 'admin', 'GET', '127.0.0.1', '[]', '2023-10-24 09:01:42', '2023-10-24 09:01:42'),
(780, 1, 'admin', 'GET', '127.0.0.1', '[]', '2023-10-24 09:01:42', '2023-10-24 09:01:42'),
(781, 1, 'admin', 'GET', '127.0.0.1', '[]', '2023-10-24 09:01:43', '2023-10-24 09:01:43'),
(782, 1, 'admin', 'GET', '127.0.0.1', '[]', '2023-10-24 09:01:43', '2023-10-24 09:01:43'),
(783, 1, 'admin', 'GET', '127.0.0.1', '[]', '2023-10-24 09:01:44', '2023-10-24 09:01:44'),
(784, 1, 'admin', 'GET', '127.0.0.1', '[]', '2023-10-24 09:01:44', '2023-10-24 09:01:44'),
(785, 1, 'admin', 'GET', '127.0.0.1', '[]', '2023-10-24 09:01:45', '2023-10-24 09:01:45'),
(786, 1, 'admin', 'GET', '127.0.0.1', '[]', '2023-10-24 09:01:46', '2023-10-24 09:01:46'),
(787, 1, 'admin', 'GET', '127.0.0.1', '[]', '2023-10-24 09:01:48', '2023-10-24 09:01:48'),
(788, 1, 'admin', 'GET', '127.0.0.1', '[]', '2023-10-24 09:02:37', '2023-10-24 09:02:37'),
(789, 1, 'admin', 'GET', '127.0.0.1', '[]', '2023-10-24 09:02:40', '2023-10-24 09:02:40'),
(790, 1, 'admin', 'GET', '127.0.0.1', '[]', '2023-10-24 09:02:52', '2023-10-24 09:02:52'),
(791, 1, 'admin', 'GET', '127.0.0.1', '[]', '2023-10-24 09:02:54', '2023-10-24 09:02:54'),
(792, 1, 'admin', 'GET', '127.0.0.1', '[]', '2023-10-24 09:03:32', '2023-10-24 09:03:32'),
(793, 1, 'admin', 'GET', '127.0.0.1', '[]', '2023-10-24 09:04:06', '2023-10-24 09:04:06'),
(794, 1, 'admin', 'GET', '127.0.0.1', '[]', '2023-10-24 09:05:39', '2023-10-24 09:05:39'),
(795, 1, 'admin', 'GET', '127.0.0.1', '[]', '2023-10-24 09:06:25', '2023-10-24 09:06:25'),
(796, 1, 'admin', 'GET', '127.0.0.1', '[]', '2023-10-24 09:11:01', '2023-10-24 09:11:01'),
(797, 1, 'admin', 'GET', '127.0.0.1', '[]', '2023-10-24 09:12:07', '2023-10-24 09:12:07'),
(798, 1, 'admin', 'GET', '127.0.0.1', '[]', '2023-10-24 09:12:29', '2023-10-24 09:12:29'),
(799, 1, 'admin', 'GET', '127.0.0.1', '[]', '2023-10-24 09:15:07', '2023-10-24 09:15:07'),
(800, 1, 'admin', 'GET', '127.0.0.1', '[]', '2023-10-24 09:15:32', '2023-10-24 09:15:32');
INSERT INTO `admin_operation_log` (`id`, `user_id`, `path`, `method`, `ip`, `input`, `created_at`, `updated_at`) VALUES
(801, 1, 'admin', 'GET', '127.0.0.1', '[]', '2023-10-24 09:15:49', '2023-10-24 09:15:49'),
(802, 1, 'admin', 'GET', '127.0.0.1', '[]', '2023-10-24 09:16:08', '2023-10-24 09:16:08'),
(803, 1, 'admin', 'GET', '127.0.0.1', '[]', '2023-10-24 09:17:01', '2023-10-24 09:17:01'),
(804, 1, 'admin', 'GET', '127.0.0.1', '[]', '2023-10-24 09:17:21', '2023-10-24 09:17:21'),
(805, 1, 'admin', 'GET', '127.0.0.1', '[]', '2023-10-24 09:18:06', '2023-10-24 09:18:06'),
(806, 1, 'admin', 'GET', '127.0.0.1', '[]', '2023-10-24 09:18:30', '2023-10-24 09:18:30'),
(807, 1, 'admin', 'GET', '127.0.0.1', '[]', '2023-10-24 09:19:04', '2023-10-24 09:19:04'),
(808, 1, 'admin', 'GET', '127.0.0.1', '[]', '2023-10-24 09:19:43', '2023-10-24 09:19:43'),
(809, 1, 'admin', 'GET', '127.0.0.1', '[]', '2023-10-24 09:20:10', '2023-10-24 09:20:10'),
(810, 1, 'admin', 'GET', '127.0.0.1', '[]', '2023-10-24 09:21:02', '2023-10-24 09:21:02'),
(811, 1, 'admin', 'GET', '127.0.0.1', '[]', '2023-10-24 09:28:47', '2023-10-24 09:28:47'),
(812, 1, 'admin', 'GET', '127.0.0.1', '[]', '2023-10-24 09:29:59', '2023-10-24 09:29:59'),
(813, 1, 'admin', 'GET', '127.0.0.1', '[]', '2023-10-26 03:48:06', '2023-10-26 03:48:06'),
(814, 1, 'admin/customers', 'GET', '127.0.0.1', '[]', '2023-10-26 03:49:09', '2023-10-26 03:49:09'),
(815, 1, 'admin/accounts', 'GET', '127.0.0.1', '[]', '2023-10-26 03:49:29', '2023-10-26 03:49:29'),
(816, 1, 'admin/credit_-cards', 'GET', '127.0.0.1', '[]', '2023-10-26 03:49:32', '2023-10-26 03:49:32'),
(817, 1, 'admin/report-transactions', 'GET', '127.0.0.1', '[]', '2023-10-26 03:49:39', '2023-10-26 03:49:39'),
(818, 1, 'admin/transactions', 'GET', '127.0.0.1', '[]', '2023-10-26 03:49:42', '2023-10-26 03:49:42'),
(819, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '[]', '2023-10-26 03:49:56', '2023-10-26 03:49:56'),
(820, 1, 'admin/auth/menu/17/edit', 'GET', '127.0.0.1', '[]', '2023-10-26 03:50:07', '2023-10-26 03:50:07'),
(821, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '[]', '2023-10-26 03:50:23', '2023-10-26 03:50:23'),
(822, 1, 'admin/auth/menu/13/edit', 'GET', '127.0.0.1', '[]', '2023-10-26 03:50:30', '2023-10-26 03:50:30'),
(823, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '[]', '2023-10-26 03:50:38', '2023-10-26 03:50:38'),
(824, 1, 'admin/auth/menu/17/edit', 'GET', '127.0.0.1', '[]', '2023-10-26 03:50:41', '2023-10-26 03:50:41'),
(825, 1, 'admin/auth/menu/17', 'PUT', '127.0.0.1', '{\"parent_id\":\"0\",\"search_terms\":null,\"title\":\"Transactions\",\"icon\":\"icon-file\",\"uri\":\"transactions\",\"roles\":[null],\"permission\":null,\"_token\":\"30HVuq302pceTU9wLXZgD5gjCJlEytuVJVoS5JCx\",\"_method\":\"PUT\"}', '2023-10-26 03:50:49', '2023-10-26 03:50:49'),
(826, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '[]', '2023-10-26 03:50:50', '2023-10-26 03:50:50'),
(827, 1, 'admin/transactions', 'GET', '127.0.0.1', '[]', '2023-10-26 03:50:53', '2023-10-26 03:50:53'),
(828, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '[]', '2023-10-26 03:50:58', '2023-10-26 03:50:58'),
(829, 1, 'admin/transactions', 'GET', '127.0.0.1', '[]', '2023-10-26 03:51:04', '2023-10-26 03:51:04'),
(830, 1, 'admin/report-transactions', 'GET', '127.0.0.1', '[]', '2023-10-26 03:51:12', '2023-10-26 03:51:12'),
(831, 1, 'admin/credit_-cards', 'GET', '127.0.0.1', '[]', '2023-10-26 03:51:36', '2023-10-26 03:51:36'),
(832, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '[]', '2023-10-26 03:51:53', '2023-10-26 03:51:53'),
(833, 1, 'admin/auth/menu/18/edit', 'GET', '127.0.0.1', '[]', '2023-10-26 03:51:58', '2023-10-26 03:51:58'),
(834, 1, 'admin/auth/menu/18', 'PUT', '127.0.0.1', '{\"parent_id\":\"0\",\"search_terms\":null,\"title\":\"predictions\",\"icon\":\"icon-balance-scale\",\"uri\":\"predict\",\"roles\":[\"2\",\"1\",null],\"permission\":\"*\",\"_token\":\"30HVuq302pceTU9wLXZgD5gjCJlEytuVJVoS5JCx\",\"_method\":\"PUT\"}', '2023-10-26 03:52:07', '2023-10-26 03:52:07'),
(835, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '[]', '2023-10-26 03:52:09', '2023-10-26 03:52:09'),
(836, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '[]', '2023-10-26 03:52:15', '2023-10-26 03:52:15'),
(837, 1, 'admin', 'GET', '127.0.0.1', '[]', '2023-10-26 03:53:19', '2023-10-26 03:53:19'),
(838, 1, 'admin/auth/logout', 'GET', '127.0.0.1', '[]', '2023-10-26 03:53:41', '2023-10-26 03:53:41'),
(839, 2, 'admin', 'GET', '127.0.0.1', '[]', '2023-10-26 03:53:51', '2023-10-26 03:53:51'),
(840, 2, 'admin/auth/logout', 'GET', '127.0.0.1', '[]', '2023-10-26 03:54:01', '2023-10-26 03:54:01'),
(841, 1, 'admin', 'GET', '127.0.0.1', '[]', '2023-10-26 03:55:01', '2023-10-26 03:55:01'),
(842, 1, 'admin/auth/permissions', 'GET', '127.0.0.1', '[]', '2023-10-26 03:55:21', '2023-10-26 03:55:21'),
(843, 1, 'admin/auth/permissions', 'GET', '127.0.0.1', '[]', '2023-10-26 03:56:00', '2023-10-26 03:56:00'),
(844, 1, 'admin/auth/permissions/create', 'GET', '127.0.0.1', '[]', '2023-10-26 03:56:05', '2023-10-26 03:56:05'),
(845, 1, 'admin/auth/permissions', 'GET', '127.0.0.1', '[]', '2023-10-26 03:56:12', '2023-10-26 03:56:12'),
(846, 1, 'admin/auth/permissions/11/edit', 'GET', '127.0.0.1', '[]', '2023-10-26 03:56:15', '2023-10-26 03:56:15'),
(847, 1, 'admin/auth/permissions', 'GET', '127.0.0.1', '[]', '2023-10-26 03:56:19', '2023-10-26 03:56:19'),
(848, 1, 'admin/auth/permissions/7/edit', 'GET', '127.0.0.1', '[]', '2023-10-26 03:56:22', '2023-10-26 03:56:22'),
(849, 1, 'admin/auth/permissions/7', 'PUT', '127.0.0.1', '{\"slug\":\"auth.Read\",\"name\":\"Admin Read\",\"search_terms\":null,\"http_method\":[null],\"http_path\":\"\\/customers\\r\\n\\/accounts\\r\\n\\/credit_-cards\\r\\n\\/accounts\\r\\n\\/report-transactions\\r\\n\\/predict\\r\\n\\/transactions\",\"_token\":\"Zw3S91Y75chAdDBg3Pf8LUvk3yLkeMRMOAwZD3rW\",\"_method\":\"PUT\"}', '2023-10-26 03:56:44', '2023-10-26 03:56:44'),
(850, 1, 'admin/auth/permissions', 'GET', '127.0.0.1', '[]', '2023-10-26 03:56:44', '2023-10-26 03:56:44'),
(851, 1, 'admin/auth/logout', 'GET', '127.0.0.1', '[]', '2023-10-26 03:56:51', '2023-10-26 03:56:51'),
(852, 2, 'admin', 'GET', '127.0.0.1', '[]', '2023-10-26 03:57:05', '2023-10-26 03:57:05'),
(853, 2, 'admin', 'GET', '127.0.0.1', '[]', '2023-10-26 03:57:17', '2023-10-26 03:57:17'),
(854, 2, 'admin/auth/logout', 'GET', '127.0.0.1', '[]', '2023-10-26 03:57:40', '2023-10-26 03:57:40'),
(855, 1, 'admin', 'GET', '127.0.0.1', '[]', '2023-10-26 03:57:48', '2023-10-26 03:57:48'),
(856, 1, 'admin/auth/permissions', 'GET', '127.0.0.1', '[]', '2023-10-26 03:57:57', '2023-10-26 03:57:57'),
(857, 1, 'admin/auth/roles', 'GET', '127.0.0.1', '[]', '2023-10-26 03:58:55', '2023-10-26 03:58:55'),
(858, 1, 'admin/auth/users', 'GET', '127.0.0.1', '[]', '2023-10-26 03:59:14', '2023-10-26 03:59:14'),
(859, 1, 'admin', 'GET', '127.0.0.1', '[]', '2023-10-26 03:59:24', '2023-10-26 03:59:24'),
(860, 1, 'admin/transactions', 'GET', '127.0.0.1', '[]', '2023-10-26 03:59:29', '2023-10-26 03:59:29'),
(861, 1, 'admin', 'GET', '127.0.0.1', '[]', '2023-10-26 03:59:38', '2023-10-26 03:59:38'),
(862, 1, 'admin/customers', 'GET', '127.0.0.1', '[]', '2023-10-26 03:59:45', '2023-10-26 03:59:45'),
(863, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '[]', '2023-10-26 03:59:51', '2023-10-26 03:59:51'),
(864, 1, 'admin/auth/menu/13/edit', 'GET', '127.0.0.1', '[]', '2023-10-26 03:59:55', '2023-10-26 03:59:55'),
(865, 1, 'admin/auth/menu/13', 'PUT', '127.0.0.1', '{\"parent_id\":\"0\",\"search_terms\":null,\"title\":\"Customers\",\"icon\":\"icon-address-card\",\"uri\":\"customers\",\"roles\":[null],\"permission\":null,\"_token\":\"PR0bvYRsvGEk1jO8LUAWGNY8kPBVtwHYeX3O9Iuy\",\"_method\":\"PUT\"}', '2023-10-26 04:00:08', '2023-10-26 04:00:08'),
(866, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '[]', '2023-10-26 04:00:09', '2023-10-26 04:00:09'),
(867, 1, 'admin/auth/menu/14/edit', 'GET', '127.0.0.1', '[]', '2023-10-26 04:00:16', '2023-10-26 04:00:16'),
(868, 1, 'admin/auth/menu/14', 'PUT', '127.0.0.1', '{\"parent_id\":\"0\",\"search_terms\":null,\"title\":\"Accounts\",\"icon\":\"icon-donate\",\"uri\":\"accounts\",\"roles\":[null],\"permission\":null,\"_token\":\"PR0bvYRsvGEk1jO8LUAWGNY8kPBVtwHYeX3O9Iuy\",\"_method\":\"PUT\"}', '2023-10-26 04:01:24', '2023-10-26 04:01:24'),
(869, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '[]', '2023-10-26 04:01:26', '2023-10-26 04:01:26'),
(870, 1, 'admin/auth/menu/15/edit', 'GET', '127.0.0.1', '[]', '2023-10-26 04:01:32', '2023-10-26 04:01:32'),
(871, 1, 'admin/auth/menu/15', 'PUT', '127.0.0.1', '{\"parent_id\":\"0\",\"search_terms\":null,\"title\":\"Credit_-cards\",\"icon\":\"icon-address-card\",\"uri\":\"credit_-cards\",\"roles\":[null],\"permission\":null,\"_token\":\"PR0bvYRsvGEk1jO8LUAWGNY8kPBVtwHYeX3O9Iuy\",\"_method\":\"PUT\"}', '2023-10-26 04:01:55', '2023-10-26 04:01:55'),
(872, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '[]', '2023-10-26 04:01:56', '2023-10-26 04:01:56'),
(873, 1, 'admin/auth/menu/13/edit', 'GET', '127.0.0.1', '[]', '2023-10-26 04:02:01', '2023-10-26 04:02:01'),
(874, 1, 'admin/auth/menu/13', 'PUT', '127.0.0.1', '{\"parent_id\":\"0\",\"search_terms\":null,\"title\":\"Customers\",\"icon\":\"icon-users\",\"uri\":\"customers\",\"roles\":[null],\"permission\":null,\"_token\":\"PR0bvYRsvGEk1jO8LUAWGNY8kPBVtwHYeX3O9Iuy\",\"_method\":\"PUT\"}', '2023-10-26 04:02:19', '2023-10-26 04:02:19'),
(875, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '[]', '2023-10-26 04:02:20', '2023-10-26 04:02:20'),
(876, 1, 'admin/auth/menu/16/edit', 'GET', '127.0.0.1', '[]', '2023-10-26 04:02:26', '2023-10-26 04:02:26'),
(877, 1, 'admin/auth/menu/16', 'PUT', '127.0.0.1', '{\"parent_id\":\"0\",\"search_terms\":null,\"title\":\"Report-transactions\",\"icon\":\"icon-align-justify\",\"uri\":\"report-transactions\",\"roles\":[null],\"permission\":null,\"_token\":\"PR0bvYRsvGEk1jO8LUAWGNY8kPBVtwHYeX3O9Iuy\",\"_method\":\"PUT\"}', '2023-10-26 04:02:42', '2023-10-26 04:02:42'),
(878, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '[]', '2023-10-26 04:02:42', '2023-10-26 04:02:42'),
(879, 1, 'admin/auth/menu/17/edit', 'GET', '127.0.0.1', '[]', '2023-10-26 04:02:46', '2023-10-26 04:02:46'),
(880, 1, 'admin/auth/menu/17', 'PUT', '127.0.0.1', '{\"parent_id\":\"0\",\"search_terms\":null,\"title\":\"Transactions\",\"icon\":\"icon-hand-holding-usd\",\"uri\":\"transactions\",\"roles\":[null],\"permission\":null,\"_token\":\"PR0bvYRsvGEk1jO8LUAWGNY8kPBVtwHYeX3O9Iuy\",\"_method\":\"PUT\"}', '2023-10-26 04:03:19', '2023-10-26 04:03:19'),
(881, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '[]', '2023-10-26 04:03:20', '2023-10-26 04:03:20'),
(882, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '[]', '2023-10-26 04:03:24', '2023-10-26 04:03:24'),
(883, 1, 'admin/accounts', 'GET', '127.0.0.1', '[]', '2023-10-26 05:24:06', '2023-10-26 05:24:06'),
(884, 1, 'admin', 'GET', '127.0.0.1', '[]', '2023-10-26 05:25:02', '2023-10-26 05:25:02'),
(885, 1, 'admin/customers', 'GET', '127.0.0.1', '[]', '2023-10-26 05:43:00', '2023-10-26 05:43:00'),
(886, 1, 'admin/customers/1/edit', 'GET', '127.0.0.1', '[]', '2023-10-26 05:43:22', '2023-10-26 05:43:22'),
(887, 1, 'admin/accounts', 'GET', '127.0.0.1', '[]', '2023-10-26 05:43:29', '2023-10-26 05:43:29'),
(888, 1, 'admin/accounts/1/edit', 'GET', '127.0.0.1', '[]', '2023-10-26 05:43:34', '2023-10-26 05:43:34'),
(889, 1, 'admin/credit_-cards', 'GET', '127.0.0.1', '[]', '2023-10-26 05:43:38', '2023-10-26 05:43:38'),
(890, 1, 'admin/report-transactions', 'GET', '127.0.0.1', '[]', '2023-10-26 05:43:41', '2023-10-26 05:43:41'),
(891, 1, 'admin/transactions', 'GET', '127.0.0.1', '[]', '2023-10-26 05:43:44', '2023-10-26 05:43:44'),
(892, 1, 'admin/auth/roles', 'GET', '127.0.0.1', '[]', '2023-10-26 05:44:05', '2023-10-26 05:44:05'),
(893, 1, 'admin/report-transactions', 'GET', '127.0.0.1', '[]', '2023-10-26 06:01:48', '2023-10-26 06:01:48'),
(894, 1, 'admin/transactions', 'GET', '127.0.0.1', '[]', '2023-10-26 06:02:04', '2023-10-26 06:02:04'),
(895, 1, 'admin', 'GET', '127.0.0.1', '[]', '2023-10-26 06:15:29', '2023-10-26 06:15:29'),
(896, 1, 'admin/transactions', 'GET', '127.0.0.1', '[]', '2023-10-26 06:15:58', '2023-10-26 06:15:58'),
(897, 1, 'admin/transactions', 'GET', '127.0.0.1', '{\"_export_\":\"all\"}', '2023-10-26 06:18:38', '2023-10-26 06:18:38'),
(898, 1, 'admin/auth/logout', 'GET', '127.0.0.1', '[]', '2023-10-26 06:20:03', '2023-10-26 06:20:03'),
(899, 1, 'admin', 'GET', '127.0.0.1', '[]', '2023-11-18 13:23:52', '2023-11-18 13:23:52'),
(900, 1, 'admin/credit_-cards', 'GET', '127.0.0.1', '[]', '2023-11-18 13:24:07', '2023-11-18 13:24:07'),
(901, 1, 'admin/report-transactions', 'GET', '127.0.0.1', '[]', '2023-11-18 13:24:12', '2023-11-18 13:24:12'),
(902, 1, 'admin/transactions', 'GET', '127.0.0.1', '[]', '2023-11-18 13:24:16', '2023-11-18 13:24:16'),
(903, 1, 'admin/accounts', 'GET', '127.0.0.1', '[]', '2023-11-18 13:24:19', '2023-11-18 13:24:19'),
(904, 1, 'admin/customers', 'GET', '127.0.0.1', '[]', '2023-11-18 13:24:21', '2023-11-18 13:24:21'),
(905, 1, 'admin/accounts', 'GET', '127.0.0.1', '[]', '2023-11-18 13:24:29', '2023-11-18 13:24:29'),
(906, 1, 'admin/accounts/create', 'GET', '127.0.0.1', '[]', '2023-11-18 13:24:31', '2023-11-18 13:24:31'),
(907, 1, 'admin/accounts', 'POST', '127.0.0.1', '{\"credit_card_id\":\"1\",\"Customer_id\":\"5\",\"Account_no\":\"2\",\"Amount\":\"0\",\"_token\":\"hcEHFCsmqJ84hbSAoOfrZ5MtnVJn0dl9u7KRZ16O\"}', '2023-11-18 13:24:51', '2023-11-18 13:24:51'),
(908, 1, 'admin/accounts/create', 'GET', '127.0.0.1', '[]', '2023-11-18 13:24:54', '2023-11-18 13:24:54'),
(909, 1, 'admin/accounts', 'POST', '127.0.0.1', '{\"credit_card_id\":\"2\",\"Customer_id\":\"5\",\"Account_no\":\"2\",\"Amount\":\"0\",\"_token\":\"hcEHFCsmqJ84hbSAoOfrZ5MtnVJn0dl9u7KRZ16O\"}', '2023-11-18 13:25:06', '2023-11-18 13:25:06'),
(910, 1, 'admin/accounts/create', 'GET', '127.0.0.1', '[]', '2023-11-18 13:25:08', '2023-11-18 13:25:08'),
(911, 1, 'admin/accounts', 'POST', '127.0.0.1', '{\"credit_card_id\":\"2\",\"Customer_id\":\"5\",\"Account_no\":\"2\",\"Amount\":\"0\",\"_token\":\"hcEHFCsmqJ84hbSAoOfrZ5MtnVJn0dl9u7KRZ16O\"}', '2023-11-18 13:27:22', '2023-11-18 13:27:22'),
(912, 1, 'admin/accounts', 'GET', '127.0.0.1', '[]', '2023-11-18 13:27:24', '2023-11-18 13:27:24'),
(913, 1, 'admin/customers', 'GET', '127.0.0.1', '[]', '2023-11-18 13:28:01', '2023-11-18 13:28:01'),
(914, 1, 'admin/accounts', 'GET', '127.0.0.1', '[]', '2023-11-18 13:28:04', '2023-11-18 13:28:04'),
(915, 1, 'admin/accounts/create', 'GET', '127.0.0.1', '[]', '2023-11-18 13:28:09', '2023-11-18 13:28:09'),
(916, 1, 'admin/credit_-cards', 'GET', '127.0.0.1', '[]', '2023-11-18 13:28:15', '2023-11-18 13:28:15'),
(917, 1, 'admin/credit_-cards', 'GET', '127.0.0.1', '[]', '2023-11-18 13:28:20', '2023-11-18 13:28:20'),
(918, 1, 'admin/customers', 'GET', '127.0.0.1', '[]', '2023-11-18 13:28:28', '2023-11-18 13:28:28'),
(919, 1, 'admin/accounts', 'GET', '127.0.0.1', '[]', '2023-11-18 13:28:32', '2023-11-18 13:28:32'),
(920, 1, 'admin/accounts/12345681/edit', 'GET', '127.0.0.1', '[]', '2023-11-18 13:28:39', '2023-11-18 13:28:39'),
(921, 1, 'admin/customers', 'GET', '127.0.0.1', '[]', '2023-11-18 13:28:53', '2023-11-18 13:28:53'),
(922, 1, 'admin/accounts', 'GET', '127.0.0.1', '[]', '2023-11-18 13:28:56', '2023-11-18 13:28:56'),
(923, 2, 'admin', 'GET', '127.0.0.1', '[]', '2023-11-26 14:09:05', '2023-11-26 14:09:05'),
(924, 2, 'admin/credit_-cards', 'GET', '127.0.0.1', '[]', '2023-11-26 14:09:33', '2023-11-26 14:09:33'),
(925, 2, 'admin/credit_-cards/create', 'GET', '127.0.0.1', '[]', '2023-11-26 14:09:44', '2023-11-26 14:09:44'),
(926, 2, 'admin/credit_-cards', 'GET', '127.0.0.1', '[]', '2023-11-26 14:09:50', '2023-11-26 14:09:50'),
(927, 2, 'admin/accounts', 'GET', '127.0.0.1', '[]', '2023-11-26 14:09:56', '2023-11-26 14:09:56'),
(928, 2, 'admin/credit_-cards', 'GET', '127.0.0.1', '[]', '2023-11-26 14:10:15', '2023-11-26 14:10:15'),
(929, 2, 'admin/credit_-cards/create', 'GET', '127.0.0.1', '[]', '2023-11-26 14:10:17', '2023-11-26 14:10:17'),
(930, 2, 'admin/credit_-cards', 'GET', '127.0.0.1', '[]', '2023-11-26 14:10:22', '2023-11-26 14:10:22'),
(931, 2, 'admin/accounts', 'GET', '127.0.0.1', '[]', '2023-11-26 14:10:31', '2023-11-26 14:10:31'),
(932, 2, 'admin/accounts/12345688/edit', 'GET', '127.0.0.1', '[]', '2023-11-26 14:10:43', '2023-11-26 14:10:43'),
(933, 2, 'admin/accounts', 'GET', '127.0.0.1', '[]', '2023-11-26 14:11:18', '2023-11-26 14:11:18'),
(934, 2, 'admin/accounts/12345688/edit', 'GET', '127.0.0.1', '[]', '2023-11-26 14:11:23', '2023-11-26 14:11:23'),
(935, 2, 'admin/accounts', 'GET', '127.0.0.1', '[]', '2023-11-26 14:11:39', '2023-11-26 14:11:39'),
(936, 2, 'admin/accounts', 'GET', '127.0.0.1', '[]', '2023-11-26 14:12:50', '2023-11-26 14:12:50'),
(937, 2, 'admin/accounts/12345688/edit', 'GET', '127.0.0.1', '[]', '2023-11-26 14:12:55', '2023-11-26 14:12:55'),
(938, 2, 'admin/accounts/12345688', 'PUT', '127.0.0.1', '{\"credit_card_id\":\"3\",\"_token\":\"QJpklKiWScXSLCSwOs6JamhJGe5yYJKEuc2KIM3c\",\"_method\":\"PUT\"}', '2023-11-26 14:13:01', '2023-11-26 14:13:01'),
(939, 2, 'admin/accounts', 'GET', '127.0.0.1', '[]', '2023-11-26 14:13:03', '2023-11-26 14:13:03'),
(940, 2, 'admin/credit_-cards', 'GET', '127.0.0.1', '[]', '2023-11-26 14:13:11', '2023-11-26 14:13:11'),
(941, 2, 'admin/credit_-cards/create', 'GET', '127.0.0.1', '[]', '2023-11-26 14:13:16', '2023-11-26 14:13:16'),
(942, 2, 'admin/credit_-cards', 'GET', '127.0.0.1', '[]', '2023-11-26 14:13:21', '2023-11-26 14:13:21'),
(943, 2, 'admin/credit_-cards', 'GET', '127.0.0.1', '[]', '2023-11-26 14:18:06', '2023-11-26 14:18:06'),
(944, 2, 'admin/report-transactions', 'GET', '127.0.0.1', '[]', '2023-11-26 14:18:27', '2023-11-26 14:18:27'),
(945, 2, 'admin/credit_-cards', 'GET', '127.0.0.1', '[]', '2023-11-26 14:18:29', '2023-11-26 14:18:29'),
(946, 2, 'admin/accounts', 'GET', '127.0.0.1', '[]', '2023-11-26 14:20:08', '2023-11-26 14:20:08'),
(947, 2, 'admin/credit_-cards', 'GET', '127.0.0.1', '[]', '2023-11-26 14:20:28', '2023-11-26 14:20:28'),
(948, 2, 'admin/credit_-cards/create', 'GET', '127.0.0.1', '[]', '2023-11-26 14:20:29', '2023-11-26 14:20:29'),
(949, 2, 'admin/credit_-cards', 'POST', '127.0.0.1', '{\"Account_id\":\"12345688\",\"card_no\":\"3\",\"CVV\":\"565\",\"_token\":\"QJpklKiWScXSLCSwOs6JamhJGe5yYJKEuc2KIM3c\"}', '2023-11-26 14:20:43', '2023-11-26 14:20:43'),
(950, 2, 'admin/credit_-cards', 'GET', '127.0.0.1', '[]', '2023-11-26 14:20:43', '2023-11-26 14:20:43'),
(951, 2, 'admin/credit_-cards/2/edit', 'GET', '127.0.0.1', '[]', '2023-11-26 14:20:51', '2023-11-26 14:20:51'),
(952, 2, 'admin/credit_-cards/2', 'PUT', '127.0.0.1', '{\"Account_id\":\"12345687\",\"card_no\":\"2\",\"CVV\":\"5567\",\"created_at\":null,\"updated_at\":null,\"_token\":\"QJpklKiWScXSLCSwOs6JamhJGe5yYJKEuc2KIM3c\",\"_method\":\"PUT\"}', '2023-11-26 14:20:55', '2023-11-26 14:20:55'),
(953, 2, 'admin/credit_-cards', 'GET', '127.0.0.1', '[]', '2023-11-26 14:20:56', '2023-11-26 14:20:56'),
(954, 2, 'admin/credit_-cards/2/edit', 'GET', '127.0.0.1', '[]', '2023-11-26 14:21:02', '2023-11-26 14:21:02'),
(955, 2, 'admin/credit_-cards/2/edit', 'GET', '127.0.0.1', '[]', '2023-11-26 14:22:15', '2023-11-26 14:22:15'),
(956, 2, 'admin/credit_-cards/2', 'PUT', '127.0.0.1', '{\"Account_id\":\"12345687\",\"card_no\":\"2\",\"CVV\":\"5567\",\"created_at\":\"2023-11-26\",\"updated_at\":\"2023-11-26\",\"_token\":\"QJpklKiWScXSLCSwOs6JamhJGe5yYJKEuc2KIM3c\",\"_method\":\"PUT\"}', '2023-11-26 14:22:28', '2023-11-26 14:22:28'),
(957, 2, 'admin/credit_-cards', 'GET', '127.0.0.1', '[]', '2023-11-26 14:22:29', '2023-11-26 14:22:29'),
(958, 2, 'admin/accounts', 'GET', '127.0.0.1', '[]', '2023-11-26 14:22:34', '2023-11-26 14:22:34'),
(959, 2, 'admin/accounts', 'GET', '127.0.0.1', '[]', '2023-11-26 14:22:59', '2023-11-26 14:22:59'),
(960, 2, 'admin/customers', 'GET', '127.0.0.1', '[]', '2023-11-26 14:23:54', '2023-11-26 14:23:54'),
(961, 2, 'admin/customers', 'GET', '127.0.0.1', '[]', '2023-11-26 14:24:30', '2023-11-26 14:24:30'),
(962, 2, 'admin/customers', 'GET', '127.0.0.1', '[]', '2023-11-26 14:25:32', '2023-11-26 14:25:32'),
(963, 2, 'admin/transactions', 'GET', '127.0.0.1', '[]', '2023-11-26 14:25:49', '2023-11-26 14:25:49'),
(964, 2, 'admin', 'GET', '127.0.0.1', '[]', '2023-11-26 14:26:59', '2023-11-26 14:26:59'),
(965, 2, 'admin/auth/logout', 'GET', '127.0.0.1', '[]', '2023-11-26 14:29:34', '2023-11-26 14:29:34');

-- --------------------------------------------------------

--
-- Table structure for table `admin_permissions`
--

CREATE TABLE `admin_permissions` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `http_method` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `http_path` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `admin_permissions`
--

INSERT INTO `admin_permissions` (`id`, `name`, `slug`, `http_method`, `http_path`, `created_at`, `updated_at`) VALUES
(1, 'All permission', '*', '', '*', NULL, NULL),
(2, 'Dashboard', 'dashboard', 'GET', '/', NULL, NULL),
(3, 'Login', 'auth.login', '', '/auth/login\r\n/auth/logout', NULL, NULL),
(4, 'User setting', 'auth.setting', 'GET,PUT', '/auth/setting', NULL, NULL),
(5, 'Auth management', 'auth.management', '', '/auth/roles\r\n/auth/permissions\r\n/auth/menu\r\n/auth/logs', NULL, NULL),
(6, 'Admin helpers', 'ext.helpers', '', '/helpers/*', '2023-09-26 09:40:58', '2023-09-26 09:40:58'),
(7, 'Admin Read', 'auth.Read', '', '/customers\r\n/accounts\r\n/credit_-cards\r\n/accounts\r\n/report-transactions\r\n/predict\r\n/transactions', '2023-09-26 11:25:00', '2023-10-26 03:56:44'),
(8, 'Admin_Create', 'auth.Create', '', '/customers/create\r\n/credit_-cards/create\r\n/accounts/create\r\n/report-transactions/create', '2023-09-26 14:31:08', '2023-09-26 14:31:08'),
(9, 'Admin_Edit', 'auth.Edit', '', '/report-transactions/*/edit', '2023-09-26 14:32:24', '2023-10-12 16:18:04'),
(10, 'Admin_Delete', 'auth.Delete', '', '/customers/delete\r\n/accounts/delete\r\n/credit_-cards/delete\r\n/report-transactions/delete', '2023-09-26 14:37:40', '2023-10-24 05:23:08'),
(11, 'Admin_View', 'auth.View', '', '/customers/*\r\n/accounts/*\r\n/credit_-cards/*\r\n/report-transactions/*', '2023-09-26 14:42:38', '2023-10-24 05:09:22');

-- --------------------------------------------------------

--
-- Table structure for table `admin_roles`
--

CREATE TABLE `admin_roles` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `admin_roles`
--

INSERT INTO `admin_roles` (`id`, `name`, `slug`, `created_at`, `updated_at`) VALUES
(1, 'super_Administrator', 'Super_admin', '2023-09-26 09:29:07', '2023-09-26 11:09:20'),
(2, 'Admin', 'Minor', '2023-09-26 11:08:54', '2023-09-26 11:08:54');

-- --------------------------------------------------------

--
-- Table structure for table `admin_role_menu`
--

CREATE TABLE `admin_role_menu` (
  `role_id` int(11) NOT NULL,
  `menu_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `admin_role_menu`
--

INSERT INTO `admin_role_menu` (`role_id`, `menu_id`, `created_at`, `updated_at`) VALUES
(1, 2, NULL, NULL),
(2, 18, NULL, NULL),
(1, 18, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `admin_role_permissions`
--

CREATE TABLE `admin_role_permissions` (
  `role_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `admin_role_permissions`
--

INSERT INTO `admin_role_permissions` (`role_id`, `permission_id`, `created_at`, `updated_at`) VALUES
(1, 1, NULL, NULL),
(2, 2, NULL, NULL),
(2, 3, NULL, NULL),
(2, 5, NULL, NULL),
(2, 7, NULL, NULL),
(2, 8, NULL, NULL),
(2, 9, NULL, NULL),
(2, 10, NULL, NULL),
(2, 11, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `admin_role_users`
--

CREATE TABLE `admin_role_users` (
  `role_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `admin_role_users`
--

INSERT INTO `admin_role_users` (`role_id`, `user_id`, `created_at`, `updated_at`) VALUES
(1, 1, NULL, NULL),
(2, 2, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `admin_users`
--

CREATE TABLE `admin_users` (
  `id` int(10) UNSIGNED NOT NULL,
  `username` varchar(190) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `avatar` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `admin_users`
--

INSERT INTO `admin_users` (`id`, `username`, `password`, `name`, `avatar`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'admin', '$2y$10$tsyyJMtEV4/Aki04gzUJPuF0beJLm4OqUAKPS2ZfNHRZgfTlsoQuO', 'Administrator', NULL, 'upVTlYjE4nHko1Rvhy9i86vQVV1JfTcH4SdrKYSG2kwDGQvw85gZLNTUr0qA', '2023-09-26 09:29:06', '2023-09-26 09:29:06'),
(2, 'Ben', '$2y$10$lO01bv/mZcrA6av2godXfuGBn2Se3.INFEP3OE0afgjkuwlhZjMJ.', 'Ben', NULL, NULL, '2023-09-26 11:11:01', '2023-09-26 11:11:01');

-- --------------------------------------------------------

--
-- Table structure for table `admin_user_permissions`
--

CREATE TABLE `admin_user_permissions` (
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `credit_card`
--

CREATE TABLE `credit_card` (
  `card_id` int(10) UNSIGNED NOT NULL,
  `card_no` int(11) NOT NULL,
  `Account_id` int(10) UNSIGNED NOT NULL,
  `Amount` bigint(20) NOT NULL DEFAULT 0,
  `CVV` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `credit_card`
--

INSERT INTO `credit_card` (`card_id`, `card_no`, `Account_id`, `Amount`, `CVV`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 10000, 678, '2023-10-22 12:17:39', '2023-10-22 12:17:39'),
(2, 2, 12345687, 1260, 5567, '2023-11-25 21:00:00', '2023-11-25 21:00:00'),
(3, 3, 12345688, 0, 565, '2023-11-26 14:20:43', '2023-11-26 14:20:43');

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `customer_id` int(10) UNSIGNED NOT NULL,
  `First_Name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Second_Name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Account_no` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `fraudulent_transactions`
--

CREATE TABLE `fraudulent_transactions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `sender_account` varchar(11) COLLATE utf8mb4_unicode_ci NOT NULL,
  `recipient_account` varchar(11) COLLATE utf8mb4_unicode_ci NOT NULL,
  `amount` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `fraudulent_transactions`
--

INSERT INTO `fraudulent_transactions` (`id`, `sender_account`, `recipient_account`, `amount`, `created_at`, `updated_at`) VALUES
(1, '123456', '0GJKAPXQ2W', 99, '2023-11-21 14:29:50', '2023-11-21 14:29:50'),
(2, '0GJKAPXQ2W', '123456', 90000, '2023-11-21 15:38:47', '2023-11-21 15:38:47'),
(3, '0GJKAPXQ2W', '123456', 9000, '2023-11-21 15:48:42', '2023-11-21 15:48:42'),
(4, '0GJKAPXQ2W', '123456', 99, '2023-11-21 16:17:45', '2023-11-21 16:17:45'),
(5, '0GJKAPXQ2W', '123456', 200000, '2023-11-21 16:19:55', '2023-11-21 16:19:55'),
(6, '123456', '0GJKAPXQ2W', 7996223, '2023-11-26 09:22:03', '2023-11-26 09:22:03'),
(7, '123456', '0GJKAPXQ2W', 1, '2023-11-26 09:22:41', '2023-11-26 09:22:41'),
(8, '123456', '0GJKAPXQ2W', 1, '2023-11-26 09:23:30', '2023-11-26 09:23:30'),
(9, '123456', '0GJKAPXQ2W', 9000, '2023-11-26 09:24:53', '2023-11-26 09:24:53'),
(10, '123456', '0GJKAPXQ2W', 900001, '2023-11-26 09:28:25', '2023-11-26 09:28:25'),
(11, '123456', '0GJKAPXQ2W', 10, '2023-11-26 09:38:47', '2023-11-26 09:38:47'),
(12, '123456', '0GJKAPXQ2W', 999999999, '2023-11-26 09:43:17', '2023-11-26 09:43:17'),
(13, 'BW2VK9M508', '0GJKAPXQ2W', 1, '2023-11-26 14:43:19', '2023-11-26 14:43:19'),
(14, 'BW2VK9M508', '123456', 2, '2023-11-26 14:43:33', '2023-11-26 14:43:33'),
(15, 'BW2VK9M508', '0GJKAPXQ2W', 1000, '2023-11-26 14:43:44', '2023-11-26 14:43:44'),
(16, 'BW2VK9M508', '123456', 10000, '2023-11-26 14:44:14', '2023-11-26 14:44:14');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_reset_tokens_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(5, '2016_01_04_173148_create_admin_tables', 2),
(6, '2023_09_26_125039_create_customer_table', 3),
(7, '2023_09_26_135230_create_Accounts_table', 4),
(8, '2023_09_26_140008_create_Credit_Card_table', 5),
(9, '2023_09_26_172342_create_Report_Transaction_table', 6),
(10, '2023_10_12_195315_create_transaction_table', 7),
(11, '2023_10_23_195215_add_two_factor_columns_to_users_table', 8),
(12, '2023_11_21_165947_create_fraudulent_transactions_table', 9);

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `report_transaction`
--

CREATE TABLE `report_transaction` (
  `report_id` int(10) UNSIGNED NOT NULL,
  `transaction_id` int(10) UNSIGNED NOT NULL,
  `card_id` int(10) UNSIGNED NOT NULL,
  `details` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_resolved` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `transaction`
--

CREATE TABLE `transaction` (
  `transaction_id` int(10) UNSIGNED NOT NULL,
  `card_id` int(10) UNSIGNED NOT NULL,
  `card_no` varchar(11) COLLATE utf8mb4_unicode_ci NOT NULL,
  `beneficiary_no` varchar(11) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'beneficiaries card number',
  `Amount` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `transaction`
--

INSERT INTO `transaction` (`transaction_id`, `card_id`, `card_no`, `beneficiary_no`, `Amount`, `created_at`, `updated_at`) VALUES
(1, 1, '12345', '54321', 234567, '2023-10-17 09:30:12', '2023-10-17 09:30:12'),
(3, 1, '123456', '2', 10, '2023-11-19 12:02:08', '2023-11-19 12:02:08'),
(4, 1, '123456', '1', 8780, '2023-11-19 12:06:00', '2023-11-19 12:06:00'),
(5, 1, '123456', '2', 17560, '2023-11-19 12:06:33', '2023-11-19 12:06:33'),
(6, 1, '123456', '1', 1, '2023-11-19 12:38:17', '2023-11-19 12:38:17'),
(7, 1, '123456', '1', 100, '2023-11-19 12:45:29', '2023-11-19 12:45:29'),
(8, 1, '123456', '2', 100, '2023-11-19 12:50:14', '2023-11-19 12:50:14'),
(9, 1, '123456', '1', 90, '2023-11-19 12:50:34', '2023-11-19 12:50:34'),
(10, 1, '123456', '1', 100000, '2023-11-19 12:51:15', '2023-11-19 12:51:15'),
(11, 1, '123456', '2', 99999, '2023-11-19 12:51:38', '2023-11-19 12:51:38'),
(12, 2, '0GJKAPXQ2W', '1', 8999, '2023-11-21 15:30:02', '2023-11-21 15:30:02'),
(13, 2, '0GJKAPXQ2W', '1', 9000, '2023-11-21 15:38:25', '2023-11-21 15:38:25'),
(14, 2, '0GJKAPXQ2W', '1', 9000, '2023-11-21 15:38:57', '2023-11-21 15:38:57'),
(15, 2, '0GJKAPXQ2W', '1', 70000, '2023-11-21 15:39:27', '2023-11-21 15:39:27'),
(16, 2, '0GJKAPXQ2W', '1', 982, '2023-11-21 15:46:28', '2023-11-21 15:46:28'),
(17, 2, '0GJKAPXQ2W', '1', 9000, '2023-11-21 15:46:42', '2023-11-21 15:46:42'),
(18, 2, '0GJKAPXQ2W', '2', 9000, '2023-11-21 15:47:05', '2023-11-21 15:47:05'),
(19, 2, '0GJKAPXQ2W', '2', 982, '2023-11-21 15:47:56', '2023-11-21 15:47:56'),
(20, 2, '0GJKAPXQ2W', '2', 900001, '2023-11-21 15:49:02', '2023-11-21 15:49:02'),
(21, 2, '0GJKAPXQ2W', '2', 1, '2023-11-21 15:57:45', '2023-11-21 15:57:45'),
(22, 2, '0GJKAPXQ2W', '2', 7777, '2023-11-21 15:58:02', '2023-11-21 15:58:02'),
(23, 2, '0GJKAPXQ2W', '2', 9000, '2023-11-21 16:10:16', '2023-11-21 16:10:16'),
(24, 2, '0GJKAPXQ2W', '2', 1, '2023-11-21 16:10:41', '2023-11-21 16:10:41'),
(25, 2, '0GJKAPXQ2W', '1', 80000, '2023-11-21 16:10:55', '2023-11-21 16:10:55'),
(26, 2, '0GJKAPXQ2W', '1', 8000000, '2023-11-21 16:11:10', '2023-11-21 16:11:10'),
(27, 2, '0GJKAPXQ2W', '2', 7159290, '2023-11-21 16:12:07', '2023-11-21 16:12:07'),
(28, 2, '0GJKAPXQ2W', '1', 9, '2023-11-21 16:12:21', '2023-11-21 16:12:21'),
(29, 2, '0GJKAPXQ2W', '1', 62, '2023-11-21 16:12:43', '2023-11-21 16:12:43'),
(30, 2, '0GJKAPXQ2W', '1', 99, '2023-11-21 16:13:11', '2023-11-21 16:13:11'),
(31, 2, '0GJKAPXQ2W', '2', 150, '2023-11-21 16:13:44', '2023-11-21 16:13:44'),
(32, 2, '0GJKAPXQ2W', '2', 9000, '2023-11-21 16:18:39', '2023-11-21 16:18:39'),
(33, 2, '0GJKAPXQ2W', '2', 900, '2023-11-21 16:19:28', '2023-11-21 16:19:28'),
(34, 1, '123456', '2', 200000, '2023-11-26 09:04:35', '2023-11-26 09:04:35'),
(35, 1, '123456', '2', 9000, '2023-11-26 09:14:49', '2023-11-26 09:14:49'),
(36, 1, '123456', '2', 7996222, '2023-11-26 09:22:16', '2023-11-26 09:22:16'),
(37, 1, '123456', '1', 99, '2023-11-26 09:27:57', '2023-11-26 09:27:57'),
(38, 1, '123456', '1', 100000, '2023-11-26 09:28:48', '2023-11-26 09:28:48'),
(39, 1, '123456', '1', 1000000, '2023-11-26 09:29:01', '2023-11-26 09:29:01'),
(40, 1, '123456', '1', 99999999, '2023-11-26 09:29:31', '2023-11-26 09:29:31'),
(41, 1, '123456', '2', 1100098, '2023-11-26 09:30:07', '2023-11-26 09:30:07'),
(42, 1, '123456', '2', 100000000, '2023-11-26 09:30:19', '2023-11-26 09:30:19'),
(43, 1, '123456', '1', 1000000, '2023-11-26 09:31:33', '2023-11-26 09:31:33'),
(44, 1, '123456', '1', 10000000, '2023-11-26 09:31:43', '2023-11-26 09:31:43'),
(45, 1, '123456', '1', 100000000, '2023-11-26 09:31:59', '2023-11-26 09:31:59'),
(46, 1, '123456', '1', 1, '2023-11-26 09:32:43', '2023-11-26 09:32:43'),
(47, 1, '123456', '1', 111000002, '2023-11-26 09:33:06', '2023-11-26 09:33:06'),
(48, 1, '123456', '1', 222000004, '2023-11-26 09:34:52', '2023-11-26 09:34:52'),
(49, 1, '123456', '1', 999999999, '2023-11-26 09:35:23', '2023-11-26 09:35:23'),
(50, 1, '123456', '1', 444000007, '2023-11-26 09:36:03', '2023-11-26 09:36:03'),
(51, 1, '123456', '1', 44400000, '2023-11-26 09:36:37', '2023-11-26 09:36:37'),
(52, 1, '123456', '2', 9000000, '2023-11-26 09:37:14', '2023-11-26 09:37:14'),
(53, 1, '123456', '1', 1, '2023-11-26 09:37:46', '2023-11-26 09:37:46'),
(54, 1, '123456', '1', 479400006, '2023-11-26 09:38:22', '2023-11-26 09:38:22'),
(55, 1, '123456', '2', 958800012, '2023-11-26 09:38:36', '2023-11-26 09:38:36'),
(56, 1, '123456', '1', 1, '2023-11-26 09:41:18', '2023-11-26 09:41:18'),
(57, 1, '123456', '1', 1, '2023-11-26 09:41:26', '2023-11-26 09:41:26'),
(58, 1, '123456', '1', 9999999, '2023-11-26 09:42:38', '2023-11-26 09:42:38'),
(59, 1, '123456', '1', 99999999, '2023-11-26 09:43:03', '2023-11-26 09:43:03'),
(60, 3, 'BW2VK9M508', '2', 100, '2023-11-26 14:37:56', '2023-11-26 14:37:56'),
(61, 3, 'BW2VK9M508', '3', 9000, '2023-11-26 14:43:56', '2023-11-26 14:43:56');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `First_Name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Second_Name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `two_factor_secret` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `two_factor_recovery_codes` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`two_factor_recovery_codes`))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `First_Name`, `Second_Name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`, `two_factor_secret`, `two_factor_recovery_codes`) VALUES
(1, 'test', 'test', 'test@test.com', NULL, '$2y$10$P0VVA8fSYL8.gc9ovBnwqepv1yWhd18TBYeAEOqFn/gaNbiL1fa0u', NULL, '2023-10-10 12:58:28', '2023-10-10 12:58:28', NULL, NULL),
(13, 'test', 'test', 'JohnDoe@gmail.com', NULL, '$2y$10$wsw16msmsKjzlNzxyUo66eRmNpnkkunGkaGxvDfAQXTG8CMZGabuy', NULL, '2023-11-18 16:21:45', '2023-11-18 16:21:45', NULL, NULL),
(14, 'test', 'test', 'Bernard.otieno@strathmore.edu', NULL, '$2y$10$nkojRgCRqe034rV2/pWY5OC418OkKw./lg/ebn2q3hsxLKVavB/EW', NULL, '2023-11-26 14:03:57', '2023-11-26 14:03:57', NULL, NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `accounts`
--
ALTER TABLE `accounts`
  ADD PRIMARY KEY (`Account_id`),
  ADD UNIQUE KEY `credit_card_id` (`credit_card_id`),
  ADD KEY `Account_no` (`Account_no`),
  ADD KEY `credit_card_id_2` (`credit_card_id`),
  ADD KEY `Customer_id` (`Customer_id`);

--
-- Indexes for table `admin_menu`
--
ALTER TABLE `admin_menu`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `admin_operation_log`
--
ALTER TABLE `admin_operation_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `admin_operation_log_user_id_index` (`user_id`);

--
-- Indexes for table `admin_permissions`
--
ALTER TABLE `admin_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `admin_permissions_name_unique` (`name`),
  ADD UNIQUE KEY `admin_permissions_slug_unique` (`slug`);

--
-- Indexes for table `admin_roles`
--
ALTER TABLE `admin_roles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `admin_roles_name_unique` (`name`),
  ADD UNIQUE KEY `admin_roles_slug_unique` (`slug`);

--
-- Indexes for table `admin_role_menu`
--
ALTER TABLE `admin_role_menu`
  ADD KEY `admin_role_menu_role_id_menu_id_index` (`role_id`,`menu_id`);

--
-- Indexes for table `admin_role_permissions`
--
ALTER TABLE `admin_role_permissions`
  ADD KEY `admin_role_permissions_role_id_permission_id_index` (`role_id`,`permission_id`);

--
-- Indexes for table `admin_role_users`
--
ALTER TABLE `admin_role_users`
  ADD KEY `admin_role_users_role_id_user_id_index` (`role_id`,`user_id`);

--
-- Indexes for table `admin_users`
--
ALTER TABLE `admin_users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `admin_users_username_unique` (`username`);

--
-- Indexes for table `admin_user_permissions`
--
ALTER TABLE `admin_user_permissions`
  ADD KEY `admin_user_permissions_user_id_permission_id_index` (`user_id`,`permission_id`);

--
-- Indexes for table `credit_card`
--
ALTER TABLE `credit_card`
  ADD PRIMARY KEY (`card_id`),
  ADD UNIQUE KEY `card_no_2` (`card_no`),
  ADD UNIQUE KEY `Account_id_2` (`Account_id`),
  ADD KEY `card_no` (`card_no`),
  ADD KEY `Account_id` (`Account_id`);

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`customer_id`),
  ADD UNIQUE KEY `customer_email_unique` (`Email`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `fraudulent_transactions`
--
ALTER TABLE `fraudulent_transactions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `report_transaction`
--
ALTER TABLE `report_transaction`
  ADD PRIMARY KEY (`report_id`),
  ADD UNIQUE KEY `transaction_id_2` (`transaction_id`),
  ADD UNIQUE KEY `card_id_2` (`card_id`),
  ADD KEY `transaction_id` (`transaction_id`),
  ADD KEY `card_id` (`card_id`);

--
-- Indexes for table `transaction`
--
ALTER TABLE `transaction`
  ADD PRIMARY KEY (`transaction_id`),
  ADD KEY `card_id` (`card_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `accounts`
--
ALTER TABLE `accounts`
  MODIFY `Account_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12345689;

--
-- AUTO_INCREMENT for table `admin_menu`
--
ALTER TABLE `admin_menu`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `admin_operation_log`
--
ALTER TABLE `admin_operation_log`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=966;

--
-- AUTO_INCREMENT for table `admin_permissions`
--
ALTER TABLE `admin_permissions`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `admin_roles`
--
ALTER TABLE `admin_roles`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `admin_users`
--
ALTER TABLE `admin_users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `credit_card`
--
ALTER TABLE `credit_card`
  MODIFY `card_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `customer`
--
ALTER TABLE `customer`
  MODIFY `customer_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `fraudulent_transactions`
--
ALTER TABLE `fraudulent_transactions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `report_transaction`
--
ALTER TABLE `report_transaction`
  MODIFY `report_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `transaction`
--
ALTER TABLE `transaction`
  MODIFY `transaction_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=62;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `accounts`
--
ALTER TABLE `accounts`
  ADD CONSTRAINT `accounts_ibfk_1` FOREIGN KEY (`Customer_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `credit_card`
--
ALTER TABLE `credit_card`
  ADD CONSTRAINT `fk_credit-card_accounts` FOREIGN KEY (`Account_id`) REFERENCES `accounts` (`Account_id`);

--
-- Constraints for table `report_transaction`
--
ALTER TABLE `report_transaction`
  ADD CONSTRAINT `fk_reports_transaction` FOREIGN KEY (`transaction_id`) REFERENCES `transaction` (`transaction_id`),
  ADD CONSTRAINT `fk_reports_transaction2` FOREIGN KEY (`card_id`) REFERENCES `transaction` (`card_id`);

--
-- Constraints for table `transaction`
--
ALTER TABLE `transaction`
  ADD CONSTRAINT `fk_transaction_credit-card` FOREIGN KEY (`card_id`) REFERENCES `credit_card` (`card_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

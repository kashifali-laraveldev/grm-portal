-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 04, 2026 at 02:55 PM
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
-- Database: `grm_demo`
--

-- --------------------------------------------------------

--
-- Table structure for table `audits`
--

CREATE TABLE `audits` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_type` varchar(255) DEFAULT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `event` varchar(255) DEFAULT NULL,
  `auditable_type` varchar(255) DEFAULT NULL,
  `auditable_id` bigint(20) UNSIGNED DEFAULT NULL,
  `old_values` longtext DEFAULT NULL,
  `new_values` longtext DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `ip_address` varchar(255) DEFAULT NULL,
  `user_agent` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `audits`
--

INSERT INTO `audits` (`id`, `user_type`, `user_id`, `event`, `auditable_type`, `auditable_id`, `old_values`, `new_values`, `url`, `ip_address`, `user_agent`, `created_at`, `updated_at`) VALUES
(1, 'admin', 1, 'EntityPeriodMapping updated', 'EntityPeriodMapping', 1, '{\"company_status\":\"Under_liquidation\"}', '{\"company_status\":\"Dormant\"}', '/group-finance/legal-entity/1/detail', '192.168.1.10', 'Chrome/123 Safari/537.36', '2026-03-30 07:00:00', '2026-03-30 07:00:00'),
(2, 'admin', 1, 'EntityMappingAttachment created', 'EntityMappingAttachment', 50, NULL, '{\"type\":\"tax_corporate_tax_certificate\",\"mapping_id\":1}', '/group-finance/legal-entity/1/attachments/upload', '192.168.1.10', 'Edge/122.0', '2026-03-30 06:50:00', '2026-03-30 06:50:00'),
(3, 'admin', 1, 'EntityPeriodMapping updated', 'EntityPeriodMapping', 2, '{\"company_status\":\"Active\"}', '{\"company_status\":\"Active\"}', '/group-finance/legal-entity/2/detail', '127.0.0.1', 'Edge/122.0', '2026-03-30 06:15:00', '2026-03-30 06:15:00'),
(4, 'admin', 1, 'EntityPeriodMapping updated', 'EntityPeriodMapping', 3, '{\"company_status\":\"Disposed\"}', '{\"company_status\":\"Disposed\"}', '/group-finance/legal-entity/3/detail', '10.0.0.22', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64)', '2026-03-30 05:30:00', '2026-03-30 05:30:00'),
(5, 'admin', 3, 'EntityPeriodMapping updated', 'EntityPeriodMapping', 4, '{\"company_status\":\"Active\"}', '{\"company_status\":\"Dormant\"}', '/group-finance/legal-entity/4/detail', '192.168.1.10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64)', '2026-03-30 04:45:00', '2026-03-30 04:45:00'),
(6, 'admin', 3, 'EntityMappingAttachment created', 'EntityMappingAttachment', 12, NULL, '{\"type\":\"financial_doa\",\"mapping_id\":4}', '/group-finance/legal-entity/4/attachments/upload', '10.0.0.22', 'Chrome/123 Safari/537.36', '2026-03-30 04:35:00', '2026-03-30 04:35:00'),
(7, 'admin', 3, 'EntityPeriodMapping updated', 'EntityPeriodMapping', 5, '{\"company_status\":\"Disposed\"}', '{\"company_status\":\"Dormant\"}', '/group-finance/legal-entity/5/detail', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64)', '2026-03-30 04:00:00', '2026-03-30 04:00:00'),
(8, 'admin', 2, 'EntityPeriodMapping updated', 'EntityPeriodMapping', 6, '{\"company_status\":\"Active\"}', '{\"company_status\":\"Disposed\"}', '/group-finance/legal-entity/6/detail', '192.168.1.10', 'Edge/122.0', '2026-03-30 03:15:00', '2026-03-30 03:15:00'),
(9, 'admin', 3, 'EntityPeriodMapping updated', 'EntityPeriodMapping', 7, '{\"company_status\":\"Dormant\"}', '{\"company_status\":\"Disposed\"}', '/group-finance/legal-entity/7/detail', '127.0.0.1', 'Edge/122.0', '2026-03-30 02:30:00', '2026-03-30 02:30:00'),
(10, 'admin', 3, 'EntityMappingAttachment created', 'EntityMappingAttachment', 49, NULL, '{\"type\":\"financial_doa\",\"mapping_id\":7}', '/group-finance/legal-entity/7/attachments/upload', '192.168.1.10', 'Chrome/123 Safari/537.36', '2026-03-30 02:20:00', '2026-03-30 02:20:00'),
(11, 'admin', 3, 'EntityPeriodMapping updated', 'EntityPeriodMapping', 8, '{\"company_status\":\"Under_liquidation\"}', '{\"company_status\":\"Active\"}', '/group-finance/legal-entity/8/detail', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64)', '2026-03-30 01:45:00', '2026-03-30 01:45:00'),
(12, 'admin', 3, 'EntityPeriodMapping updated', 'EntityPeriodMapping', 9, '{\"company_status\":\"Under_liquidation\"}', '{\"company_status\":\"Dormant\"}', '/group-finance/legal-entity/9/detail', '10.0.0.22', 'Edge/122.0', '2026-03-30 01:00:00', '2026-03-30 01:00:00'),
(13, 'admin', 3, 'EntityPeriodMapping updated', 'EntityPeriodMapping', 10, '{\"company_status\":\"Dormant\"}', '{\"company_status\":\"Disposed\"}', '/group-finance/legal-entity/10/detail', '192.168.1.10', 'Chrome/123 Safari/537.36', '2026-03-30 00:15:00', '2026-03-30 00:15:00'),
(14, 'admin', 3, 'EntityMappingAttachment created', 'EntityMappingAttachment', 52, NULL, '{\"type\":\"general_trade_license_number\",\"mapping_id\":10}', '/group-finance/legal-entity/10/attachments/upload', '192.168.1.10', 'Edge/122.0', '2026-03-30 00:05:00', '2026-03-30 00:05:00'),
(15, 'admin', 2, 'EntityPeriodMapping updated', 'EntityPeriodMapping', 11, '{\"company_status\":\"Dormant\"}', '{\"company_status\":\"Disposed\"}', '/group-finance/legal-entity/11/detail', '127.0.0.1', 'Chrome/123 Safari/537.36', '2026-03-29 23:30:00', '2026-03-29 23:30:00'),
(16, 'admin', 1, 'EntityPeriodMapping updated', 'EntityPeriodMapping', 12, '{\"company_status\":\"Dormant\"}', '{\"company_status\":\"Dormant\"}', '/group-finance/legal-entity/12/detail', '192.168.1.10', 'Chrome/123 Safari/537.36', '2026-03-29 22:45:00', '2026-03-29 22:45:00'),
(17, 'admin', 3, 'EntityPeriodMapping updated', 'EntityPeriodMapping', 13, '{\"company_status\":\"Under_liquidation\"}', '{\"company_status\":\"Active\"}', '/group-finance/legal-entity/13/detail', '127.0.0.1', 'Edge/122.0', '2026-03-29 22:00:00', '2026-03-29 22:00:00'),
(18, 'admin', 3, 'EntityMappingAttachment created', 'EntityMappingAttachment', 77, NULL, '{\"type\":\"general_trade_license_number\",\"mapping_id\":13}', '/group-finance/legal-entity/13/attachments/upload', '192.168.1.10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64)', '2026-03-29 21:50:00', '2026-03-29 21:50:00'),
(19, 'admin', 3, 'EntityPeriodMapping updated', 'EntityPeriodMapping', 14, '{\"company_status\":\"Under_liquidation\"}', '{\"company_status\":\"Dormant\"}', '/group-finance/legal-entity/14/detail', '192.168.1.10', 'Chrome/123 Safari/537.36', '2026-03-29 21:15:00', '2026-03-29 21:15:00'),
(20, 'admin', 2, 'EntityPeriodMapping updated', 'EntityPeriodMapping', 15, '{\"company_status\":\"Active\"}', '{\"company_status\":\"Disposed\"}', '/group-finance/legal-entity/15/detail', '10.0.0.22', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64)', '2026-03-29 20:30:00', '2026-03-29 20:30:00'),
(21, 'admin', 2, 'EntityPeriodMapping updated', 'EntityPeriodMapping', 16, '{\"company_status\":\"Active\"}', '{\"company_status\":\"Dormant\"}', '/group-finance/legal-entity/16/detail', '127.0.0.1', 'Chrome/123 Safari/537.36', '2026-03-29 19:45:00', '2026-03-29 19:45:00'),
(22, 'admin', 2, 'EntityMappingAttachment created', 'EntityMappingAttachment', 58, NULL, '{\"type\":\"tax_corporate_tax_certificate\",\"mapping_id\":16}', '/group-finance/legal-entity/16/attachments/upload', '10.0.0.22', 'Chrome/123 Safari/537.36', '2026-03-29 19:35:00', '2026-03-29 19:35:00'),
(23, 'admin', 3, 'EntityPeriodMapping updated', 'EntityPeriodMapping', 17, '{\"company_status\":\"Active\"}', '{\"company_status\":\"Dormant\"}', '/group-finance/legal-entity/17/detail', '10.0.0.22', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64)', '2026-03-29 19:00:00', '2026-03-29 19:00:00'),
(24, 'admin', 1, 'EntityPeriodMapping updated', 'EntityPeriodMapping', 18, '{\"company_status\":\"Active\"}', '{\"company_status\":\"Dormant\"}', '/group-finance/legal-entity/18/detail', '192.168.1.10', 'Edge/122.0', '2026-03-29 18:15:00', '2026-03-29 18:15:00'),
(25, 'admin', 2, 'EntityPeriodMapping updated', 'EntityPeriodMapping', 19, '{\"company_status\":\"Under_liquidation\"}', '{\"company_status\":\"Under_liquidation\"}', '/group-finance/legal-entity/19/detail', '192.168.1.10', 'Chrome/123 Safari/537.36', '2026-03-29 17:30:00', '2026-03-29 17:30:00'),
(26, 'admin', 2, 'EntityMappingAttachment created', 'EntityMappingAttachment', 54, NULL, '{\"type\":\"general_trade_license_number\",\"mapping_id\":19}', '/group-finance/legal-entity/19/attachments/upload', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64)', '2026-03-29 17:20:00', '2026-03-29 17:20:00'),
(27, 'admin', 3, 'EntityPeriodMapping updated', 'EntityPeriodMapping', 20, '{\"company_status\":\"Disposed\"}', '{\"company_status\":\"Dormant\"}', '/group-finance/legal-entity/20/detail', '192.168.1.10', 'Edge/122.0', '2026-03-29 16:45:00', '2026-03-29 16:45:00'),
(28, 'admin', 1, 'EntityReportingMatrix updated', 'EntityReportingMatrix', 1, '{\"submission_date\":null}', '{\"submission_date\":\"2026-03-25\"}', '/dashboard/timeline', '10.0.0.22', 'Chrome/123 Safari/537.36', '2026-03-30 06:40:00', '2026-03-30 06:40:00'),
(29, 'admin', 3, 'EntityReportingMatrix updated', 'EntityReportingMatrix', 2, '{\"submission_date\":null}', '{\"submission_date\":\"2026-03-23\"}', '/dashboard/timeline', '192.168.1.10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64)', '2026-03-30 06:05:00', '2026-03-30 06:05:00'),
(30, 'admin', 2, 'EntityReportingMatrix updated', 'EntityReportingMatrix', 3, '{\"submission_date\":null}', '{\"submission_date\":\"2026-03-16\"}', '/dashboard/timeline', '192.168.1.10', 'Edge/122.0', '2026-03-30 05:30:00', '2026-03-30 05:30:00'),
(31, 'admin', 3, 'EntityReportingMatrix updated', 'EntityReportingMatrix', 4, '{\"submission_date\":null}', '{\"submission_date\":\"2026-03-16\"}', '/dashboard/timeline', '192.168.1.10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64)', '2026-03-30 04:55:00', '2026-03-30 04:55:00'),
(32, 'admin', 1, 'EntityReportingMatrix updated', 'EntityReportingMatrix', 5, '{\"submission_date\":null}', '{\"submission_date\":\"2026-03-25\"}', '/dashboard/timeline', '10.0.0.22', 'Chrome/123 Safari/537.36', '2026-03-30 04:20:00', '2026-03-30 04:20:00'),
(33, 'admin', 3, 'EntityReportingMatrix updated', 'EntityReportingMatrix', 6, '{\"submission_date\":null}', '{\"submission_date\":\"2026-03-20\"}', '/dashboard/timeline', '192.168.1.10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64)', '2026-03-30 03:45:00', '2026-03-30 03:45:00'),
(34, 'admin', 3, 'EntityReportingMatrix updated', 'EntityReportingMatrix', 7, '{\"submission_date\":null}', '{\"submission_date\":\"2026-03-16\"}', '/dashboard/timeline', '10.0.0.22', 'Chrome/123 Safari/537.36', '2026-03-30 03:10:00', '2026-03-30 03:10:00'),
(35, 'admin', 1, 'EntityReportingMatrix updated', 'EntityReportingMatrix', 8, '{\"submission_date\":null}', '{\"submission_date\":\"2026-03-23\"}', '/dashboard/timeline', '10.0.0.22', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64)', '2026-03-30 02:35:00', '2026-03-30 02:35:00'),
(36, 'admin', 2, 'EntityReportingMatrix updated', 'EntityReportingMatrix', 9, '{\"submission_date\":null}', '{\"submission_date\":\"2026-03-25\"}', '/dashboard/timeline', '10.0.0.22', 'Chrome/123 Safari/537.36', '2026-03-30 02:00:00', '2026-03-30 02:00:00'),
(37, 'admin', 3, 'EntityReportingMatrix updated', 'EntityReportingMatrix', 10, '{\"submission_date\":null}', '{\"submission_date\":\"2026-03-25\"}', '/dashboard/timeline', '192.168.1.10', 'Chrome/123 Safari/537.36', '2026-03-30 01:25:00', '2026-03-30 01:25:00'),
(38, 'admin', 3, 'EntityReportingMatrix updated', 'EntityReportingMatrix', 11, '{\"submission_date\":null}', '{\"submission_date\":\"2026-03-25\"}', '/dashboard/timeline', '10.0.0.22', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64)', '2026-03-30 00:50:00', '2026-03-30 00:50:00'),
(39, 'admin', 3, 'EntityReportingMatrix updated', 'EntityReportingMatrix', 12, '{\"submission_date\":null}', '{\"submission_date\":\"2026-03-20\"}', '/dashboard/timeline', '10.0.0.22', 'Edge/122.0', '2026-03-30 00:15:00', '2026-03-30 00:15:00'),
(40, 'admin', 3, 'EntityReportingMatrix updated', 'EntityReportingMatrix', 13, '{\"submission_date\":null}', '{\"submission_date\":\"2026-03-20\"}', '/dashboard/timeline', '192.168.1.10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64)', '2026-03-29 23:40:00', '2026-03-29 23:40:00'),
(41, 'admin', 1, 'EntityReportingMatrix updated', 'EntityReportingMatrix', 14, '{\"submission_date\":null}', '{\"submission_date\":\"2026-03-20\"}', '/dashboard/timeline', '127.0.0.1', 'Chrome/123 Safari/537.36', '2026-03-29 23:05:00', '2026-03-29 23:05:00'),
(42, 'admin', 3, 'EntityReportingMatrix updated', 'EntityReportingMatrix', 15, '{\"submission_date\":null}', '{\"submission_date\":\"2026-03-16\"}', '/dashboard/timeline', '192.168.1.10', 'Chrome/123 Safari/537.36', '2026-03-29 22:30:00', '2026-03-29 22:30:00'),
(43, 'admin', 3, 'EntityReportingMatrix updated', 'EntityReportingMatrix', 16, '{\"submission_date\":null}', '{\"submission_date\":\"2026-03-25\"}', '/dashboard/timeline', '192.168.1.10', 'Edge/122.0', '2026-03-29 21:55:00', '2026-03-29 21:55:00'),
(44, 'admin', 2, 'EntityReportingMatrix updated', 'EntityReportingMatrix', 17, '{\"submission_date\":null}', '{\"submission_date\":\"2026-03-20\"}', '/dashboard/timeline', '10.0.0.22', 'Edge/122.0', '2026-03-29 21:20:00', '2026-03-29 21:20:00'),
(45, 'admin', 1, 'EntityReportingMatrix updated', 'EntityReportingMatrix', 18, '{\"submission_date\":null}', '{\"submission_date\":\"2026-03-16\"}', '/dashboard/timeline', '192.168.1.10', 'Edge/122.0', '2026-03-29 20:45:00', '2026-03-29 20:45:00'),
(46, 'admin', 2, 'EntityReportingMatrix updated', 'EntityReportingMatrix', 19, '{\"submission_date\":null}', '{\"submission_date\":\"2026-03-16\"}', '/dashboard/timeline', '10.0.0.22', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64)', '2026-03-29 20:10:00', '2026-03-29 20:10:00'),
(47, 'admin', 2, 'EntityReportingMatrix updated', 'EntityReportingMatrix', 20, '{\"submission_date\":null}', '{\"submission_date\":\"2026-03-23\"}', '/dashboard/timeline', '192.168.1.10', 'Chrome/123 Safari/537.36', '2026-03-29 19:35:00', '2026-03-29 19:35:00'),
(48, 'admin', 1, 'EntityReportingMatrix updated', 'EntityReportingMatrix', 21, '{\"submission_date\":null}', '{\"submission_date\":\"2026-03-23\"}', '/dashboard/timeline', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64)', '2026-03-29 19:00:00', '2026-03-29 19:00:00'),
(49, 'admin', 3, 'EntityReportingMatrix updated', 'EntityReportingMatrix', 22, '{\"submission_date\":null}', '{\"submission_date\":\"2026-03-25\"}', '/dashboard/timeline', '192.168.1.10', 'Chrome/123 Safari/537.36', '2026-03-29 18:25:00', '2026-03-29 18:25:00'),
(50, 'admin', 1, 'EntityReportingMatrix updated', 'EntityReportingMatrix', 23, '{\"submission_date\":null}', '{\"submission_date\":\"2026-03-25\"}', '/dashboard/timeline', '10.0.0.22', 'Edge/122.0', '2026-03-29 17:50:00', '2026-03-29 17:50:00'),
(51, 'admin', 1, 'EntityReportingMatrix updated', 'EntityReportingMatrix', 24, '{\"submission_date\":null}', '{\"submission_date\":\"2026-03-25\"}', '/dashboard/timeline', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64)', '2026-03-29 17:15:00', '2026-03-29 17:15:00'),
(52, 'admin', 1, 'EntityReportingMatrix updated', 'EntityReportingMatrix', 25, '{\"submission_date\":null}', '{\"submission_date\":\"2026-03-20\"}', '/dashboard/timeline', '127.0.0.1', 'Edge/122.0', '2026-03-29 16:40:00', '2026-03-29 16:40:00'),
(53, 'admin', 1, 'EntityMappingAttachment deleted', 'EntityMappingAttachment', 1, '{\"deleted_attachment_id\":1}', NULL, '/group-finance/legal-entity/11/attachments/1/delete', '127.0.0.1', 'Chrome/123 Safari/537.36', '2026-03-30 06:55:00', '2026-03-30 06:55:00'),
(54, 'admin', 2, 'EntityMappingAttachment deleted', 'EntityMappingAttachment', 2, '{\"deleted_attachment_id\":2}', NULL, '/group-finance/legal-entity/21/attachments/2/delete', '127.0.0.1', 'Chrome/123 Safari/537.36', '2026-03-30 06:05:00', '2026-03-30 06:05:00'),
(55, 'admin', 2, 'EntityMappingAttachment deleted', 'EntityMappingAttachment', 3, '{\"deleted_attachment_id\":3}', NULL, '/group-finance/legal-entity/48/attachments/3/delete', '192.168.1.10', 'Chrome/123 Safari/537.36', '2026-03-30 05:15:00', '2026-03-30 05:15:00'),
(56, 'admin', 2, 'EntityMappingAttachment deleted', 'EntityMappingAttachment', 4, '{\"deleted_attachment_id\":4}', NULL, '/group-finance/legal-entity/35/attachments/4/delete', '127.0.0.1', 'Chrome/123 Safari/537.36', '2026-03-30 04:25:00', '2026-03-30 04:25:00'),
(57, 'admin', 3, 'EntityMappingAttachment deleted', 'EntityMappingAttachment', 5, '{\"deleted_attachment_id\":5}', NULL, '/group-finance/legal-entity/40/attachments/5/delete', '127.0.0.1', 'Chrome/123 Safari/537.36', '2026-03-30 03:35:00', '2026-03-30 03:35:00'),
(58, 'admin', 1, 'EntityMappingAttachment deleted', 'EntityMappingAttachment', 6, '{\"deleted_attachment_id\":6}', NULL, '/group-finance/legal-entity/41/attachments/6/delete', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64)', '2026-03-30 02:45:00', '2026-03-30 02:45:00'),
(59, 'admin', 3, 'EntityMappingAttachment deleted', 'EntityMappingAttachment', 7, '{\"deleted_attachment_id\":7}', NULL, '/group-finance/legal-entity/5/attachments/7/delete', '10.0.0.22', 'Edge/122.0', '2026-03-30 01:55:00', '2026-03-30 01:55:00'),
(60, 'admin', 1, 'EntityMappingAttachment deleted', 'EntityMappingAttachment', 8, '{\"deleted_attachment_id\":8}', NULL, '/group-finance/legal-entity/5/attachments/8/delete', '127.0.0.1', 'Edge/122.0', '2026-03-30 01:05:00', '2026-03-30 01:05:00'),
(61, 'admin', 2, 'EntityMappingAttachment deleted', 'EntityMappingAttachment', 9, '{\"deleted_attachment_id\":9}', NULL, '/group-finance/legal-entity/21/attachments/9/delete', '10.0.0.22', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64)', '2026-03-30 00:15:00', '2026-03-30 00:15:00'),
(62, 'admin', 3, 'EntityMappingAttachment deleted', 'EntityMappingAttachment', 10, '{\"deleted_attachment_id\":10}', NULL, '/group-finance/legal-entity/10/attachments/10/delete', '10.0.0.22', 'Chrome/123 Safari/537.36', '2026-03-29 23:25:00', '2026-03-29 23:25:00'),
(63, 'admin', 1, 'EntityMappingAttachment deleted', 'EntityMappingAttachment', 11, '{\"deleted_attachment_id\":11}', NULL, '/group-finance/legal-entity/17/attachments/11/delete', '192.168.1.10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64)', '2026-03-29 22:35:00', '2026-03-29 22:35:00'),
(64, 'admin', 2, 'EntityMappingAttachment deleted', 'EntityMappingAttachment', 12, '{\"deleted_attachment_id\":12}', NULL, '/group-finance/legal-entity/7/attachments/12/delete', '10.0.0.22', 'Chrome/123 Safari/537.36', '2026-03-29 21:45:00', '2026-03-29 21:45:00');

-- --------------------------------------------------------

--
-- Table structure for table `cache`
--

CREATE TABLE `cache` (
  `key` varchar(255) NOT NULL,
  `value` mediumtext NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cache_locks`
--

CREATE TABLE `cache_locks` (
  `key` varchar(255) NOT NULL,
  `owner` varchar(255) NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `countries`
--

CREATE TABLE `countries` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `phone_code` varchar(255) DEFAULT NULL,
  `country_code` varchar(255) DEFAULT NULL,
  `country_name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `countries`
--

INSERT INTO `countries` (`id`, `phone_code`, `country_code`, `country_name`, `created_at`, `updated_at`) VALUES
(1, '+971', 'AE', 'UAE', '2026-04-04 07:54:03', '2026-04-04 07:54:03'),
(2, '+1', 'US', 'USA', '2026-04-04 07:54:03', '2026-04-04 07:54:03'),
(3, '+44', 'GB', 'UK', '2026-04-04 07:54:03', '2026-04-04 07:54:03'),
(4, '+966', 'SA', 'Saudi Arabia', '2026-04-04 07:54:03', '2026-04-04 07:54:03'),
(5, '+974', 'QA', 'Qatar', '2026-04-04 07:54:03', '2026-04-04 07:54:03'),
(6, '+965', 'KW', 'Kuwait', '2026-04-04 07:54:03', '2026-04-04 07:54:03'),
(7, '+973', 'BH', 'Bahrain', '2026-04-04 07:54:03', '2026-04-04 07:54:03'),
(8, '+968', 'OM', 'Oman', '2026-04-04 07:54:03', '2026-04-04 07:54:03'),
(9, '+20', 'EG', 'Egypt', '2026-04-04 07:54:03', '2026-04-04 07:54:03'),
(10, '+962', 'JO', 'Jordan', '2026-04-04 07:54:03', '2026-04-04 07:54:03'),
(11, '+92', 'PK', 'Pakistan', '2026-04-04 07:54:03', '2026-04-04 07:54:03'),
(12, '+91', 'IN', 'India', '2026-04-04 07:54:03', '2026-04-04 07:54:03'),
(13, '+65', 'SG', 'Singapore', '2026-04-04 07:54:03', '2026-04-04 07:54:03'),
(14, '+1', 'KY', 'Cayman Islands', '2026-04-04 07:54:03', '2026-04-04 07:54:03'),
(15, '+1', 'VG', 'British Virgin Islands', '2026-04-04 07:54:03', '2026-04-04 07:54:03'),
(16, '+231', 'LR', 'Liberia', '2026-04-04 07:54:03', '2026-04-04 07:54:03'),
(17, '+1', 'BS', 'Bahamas', '2026-04-04 07:54:03', '2026-04-04 07:54:03'),
(18, '+352', 'LU', 'Luxembourg', '2026-04-04 07:54:03', '2026-04-04 07:54:03'),
(19, '+31', 'NL', 'Netherlands', '2026-04-04 07:54:03', '2026-04-04 07:54:03'),
(20, '+41', 'CH', 'Switzerland', '2026-04-04 07:54:03', '2026-04-04 07:54:03'),
(21, '+49', 'DE', 'Germany', '2026-04-04 07:54:03', '2026-04-04 07:54:03'),
(22, '+33', 'FR', 'France', '2026-04-04 07:54:03', '2026-04-04 07:54:03'),
(23, '+61', 'AU', 'Australia', '2026-04-04 07:54:03', '2026-04-04 07:54:03'),
(24, '+1', 'CA', 'Canada', '2026-04-04 07:54:03', '2026-04-04 07:54:03'),
(25, '+353', 'IE', 'Ireland', '2026-04-04 07:54:03', '2026-04-04 07:54:03'),
(26, '+34', 'ES', 'Spain', '2026-04-04 07:54:03', '2026-04-04 07:54:03'),
(27, '+39', 'IT', 'Italy', '2026-04-04 07:54:03', '2026-04-04 07:54:03'),
(28, '+46', 'SE', 'Sweden', '2026-04-04 07:54:03', '2026-04-04 07:54:03'),
(29, '+47', 'NO', 'Norway', '2026-04-04 07:54:03', '2026-04-04 07:54:03'),
(30, '+45', 'DK', 'Denmark', '2026-04-04 07:54:03', '2026-04-04 07:54:03');

-- --------------------------------------------------------

--
-- Table structure for table `deliverable_contact_list`
--

CREATE TABLE `deliverable_contact_list` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `report_matrix_id` bigint(20) UNSIGNED NOT NULL,
  `contact_name` varchar(255) NOT NULL,
  `contact_email` varchar(255) NOT NULL,
  `is_deleted` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `deliverable_templates`
--

CREATE TABLE `deliverable_templates` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `deliverable_id` bigint(20) UNSIGNED NOT NULL,
  `template_name` varchar(255) NOT NULL,
  `template_period` varchar(255) DEFAULT NULL,
  `template_year` smallint(5) UNSIGNED DEFAULT NULL,
  `template_path` varchar(255) DEFAULT NULL,
  `display_order` smallint(5) UNSIGNED NOT NULL DEFAULT 1,
  `is_deleted` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `deliverable_templates`
--

INSERT INTO `deliverable_templates` (`id`, `deliverable_id`, `template_name`, `template_period`, `template_year`, `template_path`, `display_order`, `is_deleted`, `created_at`, `updated_at`) VALUES
(1, 1, 'Financial Reporting Template', 'June', 2026, 'templates/fr_2026_june.docx', 1, 0, '2026-04-04 07:54:09', '2026-04-04 07:54:09'),
(2, 2, 'Treasury Reporting Template', 'June', 2026, 'templates/tr_2026_june.docx', 2, 0, '2026-04-04 07:54:09', '2026-04-04 07:54:09'),
(3, 3, 'Project Champion Template', 'June', 2026, 'templates/pc_2026_june.docx', 3, 0, '2026-04-04 07:54:09', '2026-04-04 07:54:09'),
(4, 4, 'Variance Analysis Template', 'June', 2026, 'templates/va_2026_june.docx', 4, 0, '2026-04-04 07:54:09', '2026-04-04 07:54:09'),
(5, 5, 'Reco Report Template', 'June', 2026, 'templates/rr_2026_june.docx', 5, 0, '2026-04-04 07:54:09', '2026-04-04 07:54:09'),
(6, 6, 'Representation Letter Template', 'June', 2026, 'templates/rl_2026_june.docx', 6, 0, '2026-04-04 07:54:09', '2026-04-04 07:54:09'),
(7, 7, 'Accounting Policies Template', 'June', 2026, 'templates/apt_2026_june.docx', 7, 0, '2026-04-04 07:54:09', '2026-04-04 07:54:09'),
(8, 8, 'Signed Financial Statements Template', 'June', 2026, 'templates/sfs_2026_june.docx', 8, 0, '2026-04-04 07:54:09', '2026-04-04 07:54:09'),
(9, 9, 'Board Resolution Template', 'June', 2026, 'templates/br_2026_june.docx', 9, 0, '2026-04-04 07:54:09', '2026-04-04 07:54:09'),
(10, 10, 'Management Accounts Template', 'June', 2026, 'templates/ma_2026_june.docx', 10, 0, '2026-04-04 07:54:09', '2026-04-04 07:54:09');

-- --------------------------------------------------------

--
-- Table structure for table `email_groups`
--

CREATE TABLE `email_groups` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `group_name` varchar(255) NOT NULL,
  `is_default` varchar(1) DEFAULT NULL,
  `created_by` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `email_groups`
--

INSERT INTO `email_groups` (`id`, `group_name`, `is_default`, `created_by`, `created_at`, `updated_at`) VALUES
(1, 'Finance Team Recipients', '1', NULL, '2026-04-04 07:54:11', '2026-04-04 07:54:11'),
(2, 'Legal Team Recipients', '0', NULL, '2026-04-04 07:54:11', '2026-04-04 07:54:11'),
(3, 'Executive Recipients', '0', NULL, '2026-04-04 07:54:11', '2026-04-04 07:54:11');

-- --------------------------------------------------------

--
-- Table structure for table `email_groups_recipients`
--

CREATE TABLE `email_groups_recipients` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `group_id` bigint(20) UNSIGNED NOT NULL,
  `recipient_id` bigint(20) UNSIGNED NOT NULL,
  `type` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `email_groups_recipients`
--

INSERT INTO `email_groups_recipients` (`id`, `group_id`, `recipient_id`, `type`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 'to', '2026-04-04 07:54:11', '2026-04-04 07:54:11'),
(2, 1, 4, 'to', '2026-04-04 07:54:11', '2026-04-04 07:54:11'),
(3, 1, 5, 'to', '2026-04-04 07:54:11', '2026-04-04 07:54:11'),
(4, 2, 2, 'to', '2026-04-04 07:54:11', '2026-04-04 07:54:11'),
(5, 2, 3, 'to', '2026-04-04 07:54:11', '2026-04-04 07:54:11'),
(6, 3, 4, 'to', '2026-04-04 07:54:11', '2026-04-04 07:54:11');

-- --------------------------------------------------------

--
-- Table structure for table `email_notifications`
--

CREATE TABLE `email_notifications` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `notification_title` varchar(255) NOT NULL,
  `notification_subject` varchar(255) NOT NULL,
  `group_id` bigint(20) UNSIGNED DEFAULT NULL,
  `template_id` bigint(20) UNSIGNED DEFAULT NULL,
  `deadline_condition` varchar(255) DEFAULT NULL,
  `sts` varchar(255) DEFAULT NULL,
  `reporting_period_id` bigint(20) UNSIGNED DEFAULT NULL,
  `from_email` varchar(255) DEFAULT NULL,
  `from_name` varchar(255) DEFAULT NULL,
  `email_send_date` datetime DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `email_notifications`
--

INSERT INTO `email_notifications` (`id`, `notification_title`, `notification_subject`, `group_id`, `template_id`, `deadline_condition`, `sts`, `reporting_period_id`, `from_email`, `from_name`, `email_send_date`, `created_at`, `updated_at`) VALUES
(1, 'FR Deadline Alert', 'FR due in 7 days', 1, 1, '7_days_before', 'active', NULL, 'noreply@demo.com', 'GRM Portal', '2026-04-06 12:54:11', '2026-04-04 07:54:11', '2026-04-04 07:54:11'),
(2, 'TR Overdue Alert', 'TR overdue submission', 2, 2, 'overdue', 'active', NULL, 'noreply@demo.com', 'GRM Portal', '2026-04-05 12:54:11', '2026-04-04 07:54:11', '2026-04-04 07:54:11'),
(3, 'Monthly Summary', 'Monthly submission summary', 3, 3, 'month_end', 'inactive', NULL, 'noreply@demo.com', 'GRM Portal', '2026-04-14 12:54:11', '2026-04-04 07:54:11', '2026-04-04 07:54:11');

-- --------------------------------------------------------

--
-- Table structure for table `email_recipients`
--

CREATE TABLE `email_recipients` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `full_name` varchar(255) NOT NULL,
  `email_address` varchar(255) NOT NULL,
  `designation` varchar(255) DEFAULT NULL,
  `contact_number` varchar(255) DEFAULT NULL,
  `created_by` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `email_recipients`
--

INSERT INTO `email_recipients` (`id`, `full_name`, `email_address`, `designation`, `contact_number`, `created_by`, `created_at`, `updated_at`) VALUES
(1, 'Demo Finance Lead', 'finance.lead@demo.com', 'Finance Lead', '+971500000000', NULL, '2026-04-04 07:54:11', '2026-04-04 07:54:11'),
(2, 'Demo Legal Lead', 'legal.lead@demo.com', 'Legal Lead', '+971500000000', NULL, '2026-04-04 07:54:11', '2026-04-04 07:54:11'),
(3, 'Demo Auditor', 'auditor@demo.com', 'Auditor', '+971500000000', NULL, '2026-04-04 07:54:11', '2026-04-04 07:54:11'),
(4, 'Demo Group CFO', 'cfo@demo.com', 'Group CFO', '+971500000000', NULL, '2026-04-04 07:54:11', '2026-04-04 07:54:11'),
(5, 'Demo Controller', 'controller@demo.com', 'Controller', '+971500000000', NULL, '2026-04-04 07:54:11', '2026-04-04 07:54:11');

-- --------------------------------------------------------

--
-- Table structure for table `email_templates`
--

CREATE TABLE `email_templates` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `template_name` varchar(255) NOT NULL,
  `template_body` longtext DEFAULT NULL,
  `attachment_path` varchar(255) DEFAULT NULL,
  `sts` tinyint(1) NOT NULL DEFAULT 0,
  `created_by` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `email_templates`
--

INSERT INTO `email_templates` (`id`, `template_name`, `template_body`, `attachment_path`, `sts`, `created_by`, `created_at`, `updated_at`) VALUES
(1, 'Deadline Reminder', 'Please submit before deadline.', NULL, 1, NULL, '2026-04-04 07:54:11', '2026-04-04 07:54:11'),
(2, 'Overdue Alert', 'Submission is overdue. Please take action.', NULL, 1, NULL, '2026-04-04 07:54:11', '2026-04-04 07:54:11'),
(3, 'Completion Confirmation', 'Submission completed successfully.', NULL, 1, NULL, '2026-04-04 07:54:11', '2026-04-04 07:54:11');

-- --------------------------------------------------------

--
-- Table structure for table `entity`
--

CREATE TABLE `entity` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `entity_short_code` varchar(255) DEFAULT NULL,
  `is_deleted` tinyint(1) NOT NULL DEFAULT 0,
  `created_by` bigint(20) UNSIGNED DEFAULT NULL,
  `updated_by` bigint(20) UNSIGNED DEFAULT NULL,
  `mapping_id` varchar(255) DEFAULT NULL,
  `cognos_code` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `entity`
--

INSERT INTO `entity` (`id`, `entity_short_code`, `is_deleted`, `created_by`, `updated_by`, `mapping_id`, `cognos_code`, `created_at`, `updated_at`) VALUES
(1, 'ENT0001', 0, NULL, NULL, 'MAP-0001', 'COG-0001', '2026-04-04 07:54:03', '2026-04-04 07:54:03'),
(2, 'ENT0002', 0, NULL, NULL, 'MAP-0002', 'COG-0002', '2026-04-04 07:54:03', '2026-04-04 07:54:03'),
(3, 'ENT0003', 0, NULL, NULL, 'MAP-0003', 'COG-0003', '2026-04-04 07:54:03', '2026-04-04 07:54:03'),
(4, 'ENT0004', 0, NULL, NULL, 'MAP-0004', 'COG-0004', '2026-04-04 07:54:03', '2026-04-04 07:54:03'),
(5, 'ENT0005', 0, NULL, NULL, 'MAP-0005', 'COG-0005', '2026-04-04 07:54:03', '2026-04-04 07:54:03'),
(6, 'ENT0006', 0, NULL, NULL, 'MAP-0006', 'COG-0006', '2026-04-04 07:54:03', '2026-04-04 07:54:03'),
(7, 'ENT0007', 0, NULL, NULL, 'MAP-0007', 'COG-0007', '2026-04-04 07:54:03', '2026-04-04 07:54:03'),
(8, 'ENT0008', 0, NULL, NULL, 'MAP-0008', 'COG-0008', '2026-04-04 07:54:03', '2026-04-04 07:54:03'),
(9, 'ENT0009', 0, NULL, NULL, 'MAP-0009', 'COG-0009', '2026-04-04 07:54:03', '2026-04-04 07:54:03'),
(10, 'ENT0010', 0, NULL, NULL, 'MAP-0010', 'COG-0010', '2026-04-04 07:54:03', '2026-04-04 07:54:03'),
(11, 'ENT0011', 0, NULL, NULL, 'MAP-0011', 'COG-0011', '2026-04-04 07:54:03', '2026-04-04 07:54:03'),
(12, 'ENT0012', 0, NULL, NULL, 'MAP-0012', 'COG-0012', '2026-04-04 07:54:03', '2026-04-04 07:54:03'),
(13, 'ENT0013', 0, NULL, NULL, 'MAP-0013', 'COG-0013', '2026-04-04 07:54:03', '2026-04-04 07:54:03'),
(14, 'ENT0014', 0, NULL, NULL, 'MAP-0014', 'COG-0014', '2026-04-04 07:54:03', '2026-04-04 07:54:03'),
(15, 'ENT0015', 0, NULL, NULL, 'MAP-0015', 'COG-0015', '2026-04-04 07:54:03', '2026-04-04 07:54:03'),
(16, 'ENT0016', 0, NULL, NULL, 'MAP-0016', 'COG-0016', '2026-04-04 07:54:03', '2026-04-04 07:54:03'),
(17, 'ENT0017', 0, NULL, NULL, 'MAP-0017', 'COG-0017', '2026-04-04 07:54:03', '2026-04-04 07:54:03'),
(18, 'ENT0018', 0, NULL, NULL, 'MAP-0018', 'COG-0018', '2026-04-04 07:54:03', '2026-04-04 07:54:03'),
(19, 'ENT0019', 0, NULL, NULL, 'MAP-0019', 'COG-0019', '2026-04-04 07:54:03', '2026-04-04 07:54:03'),
(20, 'ENT0020', 0, NULL, NULL, 'MAP-0020', 'COG-0020', '2026-04-04 07:54:03', '2026-04-04 07:54:03'),
(21, 'ENT0021', 0, NULL, NULL, 'MAP-0021', 'COG-0021', '2026-04-04 07:54:03', '2026-04-04 07:54:03'),
(22, 'ENT0022', 0, NULL, NULL, 'MAP-0022', 'COG-0022', '2026-04-04 07:54:03', '2026-04-04 07:54:03'),
(23, 'ENT0023', 0, NULL, NULL, 'MAP-0023', 'COG-0023', '2026-04-04 07:54:03', '2026-04-04 07:54:03'),
(24, 'ENT0024', 0, NULL, NULL, 'MAP-0024', 'COG-0024', '2026-04-04 07:54:03', '2026-04-04 07:54:03'),
(25, 'ENT0025', 0, NULL, NULL, 'MAP-0025', 'COG-0025', '2026-04-04 07:54:03', '2026-04-04 07:54:03'),
(26, 'ENT0026', 0, NULL, NULL, 'MAP-0026', 'COG-0026', '2026-04-04 07:54:03', '2026-04-04 07:54:03'),
(27, 'ENT0027', 0, NULL, NULL, 'MAP-0027', 'COG-0027', '2026-04-04 07:54:03', '2026-04-04 07:54:03'),
(28, 'ENT0028', 0, NULL, NULL, 'MAP-0028', 'COG-0028', '2026-04-04 07:54:03', '2026-04-04 07:54:03'),
(29, 'ENT0029', 0, NULL, NULL, 'MAP-0029', 'COG-0029', '2026-04-04 07:54:03', '2026-04-04 07:54:03'),
(30, 'ENT0030', 0, NULL, NULL, 'MAP-0030', 'COG-0030', '2026-04-04 07:54:03', '2026-04-04 07:54:03'),
(31, 'ENT0031', 0, NULL, NULL, 'MAP-0031', 'COG-0031', '2026-04-04 07:54:03', '2026-04-04 07:54:03'),
(32, 'ENT0032', 0, NULL, NULL, 'MAP-0032', 'COG-0032', '2026-04-04 07:54:03', '2026-04-04 07:54:03'),
(33, 'ENT0033', 0, NULL, NULL, 'MAP-0033', 'COG-0033', '2026-04-04 07:54:03', '2026-04-04 07:54:03'),
(34, 'ENT0034', 0, NULL, NULL, 'MAP-0034', 'COG-0034', '2026-04-04 07:54:03', '2026-04-04 07:54:03'),
(35, 'ENT0035', 0, NULL, NULL, 'MAP-0035', 'COG-0035', '2026-04-04 07:54:03', '2026-04-04 07:54:03'),
(36, 'ENT0036', 0, NULL, NULL, 'MAP-0036', 'COG-0036', '2026-04-04 07:54:03', '2026-04-04 07:54:03'),
(37, 'ENT0037', 0, NULL, NULL, 'MAP-0037', 'COG-0037', '2026-04-04 07:54:03', '2026-04-04 07:54:03'),
(38, 'ENT0038', 0, NULL, NULL, 'MAP-0038', 'COG-0038', '2026-04-04 07:54:03', '2026-04-04 07:54:03'),
(39, 'ENT0039', 0, NULL, NULL, 'MAP-0039', 'COG-0039', '2026-04-04 07:54:03', '2026-04-04 07:54:03'),
(40, 'ENT0040', 0, NULL, NULL, 'MAP-0040', 'COG-0040', '2026-04-04 07:54:03', '2026-04-04 07:54:03'),
(41, 'ENT0041', 0, NULL, NULL, 'MAP-0041', 'COG-0041', '2026-04-04 07:54:03', '2026-04-04 07:54:03'),
(42, 'ENT0042', 0, NULL, NULL, 'MAP-0042', 'COG-0042', '2026-04-04 07:54:03', '2026-04-04 07:54:03'),
(43, 'ENT0043', 0, NULL, NULL, 'MAP-0043', 'COG-0043', '2026-04-04 07:54:03', '2026-04-04 07:54:03'),
(44, 'ENT0044', 0, NULL, NULL, 'MAP-0044', 'COG-0044', '2026-04-04 07:54:03', '2026-04-04 07:54:03'),
(45, 'ENT0045', 0, NULL, NULL, 'MAP-0045', 'COG-0045', '2026-04-04 07:54:03', '2026-04-04 07:54:03'),
(46, 'ENT0046', 0, NULL, NULL, 'MAP-0046', 'COG-0046', '2026-04-04 07:54:03', '2026-04-04 07:54:03'),
(47, 'ENT0047', 0, NULL, NULL, 'MAP-0047', 'COG-0047', '2026-04-04 07:54:03', '2026-04-04 07:54:03'),
(48, 'ENT0048', 0, NULL, NULL, 'MAP-0048', 'COG-0048', '2026-04-04 07:54:03', '2026-04-04 07:54:03'),
(49, 'ENT0049', 0, NULL, NULL, 'MAP-0049', 'COG-0049', '2026-04-04 07:54:03', '2026-04-04 07:54:03'),
(50, 'ENT0050', 0, NULL, NULL, 'MAP-0050', 'COG-0050', '2026-04-04 07:54:03', '2026-04-04 07:54:03');

-- --------------------------------------------------------

--
-- Table structure for table `entity_item`
--

CREATE TABLE `entity_item` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  `short_name` varchar(255) NOT NULL,
  `is_default` tinyint(1) NOT NULL DEFAULT 0,
  `status` smallint(5) UNSIGNED NOT NULL DEFAULT 1,
  `is_annual` tinyint(1) NOT NULL DEFAULT 1,
  `is_reminder` tinyint(1) NOT NULL DEFAULT 0,
  `display_order` smallint(5) UNSIGNED NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `entity_item`
--

INSERT INTO `entity_item` (`id`, `title`, `short_name`, `is_default`, `status`, `is_annual`, `is_reminder`, `display_order`, `created_at`, `updated_at`) VALUES
(1, 'Financial Reporting', 'FR', 1, 1, 1, 1, 1, '2026-04-04 07:54:03', '2026-04-04 07:54:03'),
(2, 'Treasury Reporting', 'TR', 0, 1, 1, 1, 2, '2026-04-04 07:54:03', '2026-04-04 07:54:03'),
(3, 'Project Champion', 'PC', 0, 1, 1, 0, 3, '2026-04-04 07:54:03', '2026-04-04 07:54:03'),
(4, 'Variance Analysis', 'VA', 0, 1, 1, 1, 4, '2026-04-04 07:54:03', '2026-04-04 07:54:03'),
(5, 'Reco Report', 'RR', 0, 1, 1, 0, 5, '2026-04-04 07:54:03', '2026-04-04 07:54:03'),
(6, 'Representation Letter', 'RL', 0, 1, 1, 1, 6, '2026-04-04 07:54:03', '2026-04-04 07:54:03'),
(7, 'Accounting Policies', 'APT', 0, 1, 1, 0, 7, '2026-04-04 07:54:03', '2026-04-04 07:54:03'),
(8, 'Signed Financial Statements', 'SFS', 0, 1, 1, 1, 8, '2026-04-04 07:54:03', '2026-04-04 07:54:03'),
(9, 'Board Resolution', 'BR', 0, 1, 1, 0, 9, '2026-04-04 07:54:03', '2026-04-04 07:54:03'),
(10, 'Management Accounts', 'MA', 0, 1, 1, 0, 10, '2026-04-04 07:54:03', '2026-04-04 07:54:03');

-- --------------------------------------------------------

--
-- Table structure for table `entity_item_mapping`
--

CREATE TABLE `entity_item_mapping` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `entity_item_id` bigint(20) UNSIGNED NOT NULL,
  `year` smallint(5) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `entity_item_mapping`
--

INSERT INTO `entity_item_mapping` (`id`, `entity_item_id`, `year`, `created_at`, `updated_at`) VALUES
(1, 1, 2018, '2026-04-04 07:54:03', '2026-04-04 07:54:03'),
(2, 1, 2019, '2026-04-04 07:54:03', '2026-04-04 07:54:03'),
(3, 1, 2020, '2026-04-04 07:54:03', '2026-04-04 07:54:03'),
(4, 1, 2021, '2026-04-04 07:54:03', '2026-04-04 07:54:03'),
(5, 1, 2022, '2026-04-04 07:54:03', '2026-04-04 07:54:03'),
(6, 1, 2023, '2026-04-04 07:54:03', '2026-04-04 07:54:03'),
(7, 1, 2024, '2026-04-04 07:54:03', '2026-04-04 07:54:03'),
(8, 1, 2025, '2026-04-04 07:54:03', '2026-04-04 07:54:03'),
(9, 1, 2026, '2026-04-04 07:54:03', '2026-04-04 07:54:03'),
(10, 1, 2027, '2026-04-04 07:54:03', '2026-04-04 07:54:03'),
(11, 1, 2028, '2026-04-04 07:54:03', '2026-04-04 07:54:03'),
(12, 2, 2018, '2026-04-04 07:54:03', '2026-04-04 07:54:03'),
(13, 2, 2019, '2026-04-04 07:54:03', '2026-04-04 07:54:03'),
(14, 2, 2020, '2026-04-04 07:54:03', '2026-04-04 07:54:03'),
(15, 2, 2021, '2026-04-04 07:54:03', '2026-04-04 07:54:03'),
(16, 2, 2022, '2026-04-04 07:54:03', '2026-04-04 07:54:03'),
(17, 2, 2023, '2026-04-04 07:54:03', '2026-04-04 07:54:03'),
(18, 2, 2024, '2026-04-04 07:54:03', '2026-04-04 07:54:03'),
(19, 2, 2025, '2026-04-04 07:54:03', '2026-04-04 07:54:03'),
(20, 2, 2026, '2026-04-04 07:54:03', '2026-04-04 07:54:03'),
(21, 2, 2027, '2026-04-04 07:54:03', '2026-04-04 07:54:03'),
(22, 2, 2028, '2026-04-04 07:54:03', '2026-04-04 07:54:03'),
(23, 3, 2018, '2026-04-04 07:54:03', '2026-04-04 07:54:03'),
(24, 3, 2019, '2026-04-04 07:54:03', '2026-04-04 07:54:03'),
(25, 3, 2020, '2026-04-04 07:54:03', '2026-04-04 07:54:03'),
(26, 3, 2021, '2026-04-04 07:54:03', '2026-04-04 07:54:03'),
(27, 3, 2022, '2026-04-04 07:54:03', '2026-04-04 07:54:03'),
(28, 3, 2023, '2026-04-04 07:54:03', '2026-04-04 07:54:03'),
(29, 3, 2024, '2026-04-04 07:54:03', '2026-04-04 07:54:03'),
(30, 3, 2025, '2026-04-04 07:54:03', '2026-04-04 07:54:03'),
(31, 3, 2026, '2026-04-04 07:54:03', '2026-04-04 07:54:03'),
(32, 3, 2027, '2026-04-04 07:54:03', '2026-04-04 07:54:03'),
(33, 3, 2028, '2026-04-04 07:54:03', '2026-04-04 07:54:03'),
(34, 4, 2018, '2026-04-04 07:54:03', '2026-04-04 07:54:03'),
(35, 4, 2019, '2026-04-04 07:54:03', '2026-04-04 07:54:03'),
(36, 4, 2020, '2026-04-04 07:54:03', '2026-04-04 07:54:03'),
(37, 4, 2021, '2026-04-04 07:54:03', '2026-04-04 07:54:03'),
(38, 4, 2022, '2026-04-04 07:54:03', '2026-04-04 07:54:03'),
(39, 4, 2023, '2026-04-04 07:54:03', '2026-04-04 07:54:03'),
(40, 4, 2024, '2026-04-04 07:54:03', '2026-04-04 07:54:03'),
(41, 4, 2025, '2026-04-04 07:54:03', '2026-04-04 07:54:03'),
(42, 4, 2026, '2026-04-04 07:54:03', '2026-04-04 07:54:03'),
(43, 4, 2027, '2026-04-04 07:54:03', '2026-04-04 07:54:03'),
(44, 4, 2028, '2026-04-04 07:54:03', '2026-04-04 07:54:03'),
(45, 5, 2018, '2026-04-04 07:54:03', '2026-04-04 07:54:03'),
(46, 5, 2019, '2026-04-04 07:54:03', '2026-04-04 07:54:03'),
(47, 5, 2020, '2026-04-04 07:54:03', '2026-04-04 07:54:03'),
(48, 5, 2021, '2026-04-04 07:54:03', '2026-04-04 07:54:03'),
(49, 5, 2022, '2026-04-04 07:54:03', '2026-04-04 07:54:03'),
(50, 5, 2023, '2026-04-04 07:54:03', '2026-04-04 07:54:03'),
(51, 5, 2024, '2026-04-04 07:54:03', '2026-04-04 07:54:03'),
(52, 5, 2025, '2026-04-04 07:54:03', '2026-04-04 07:54:03'),
(53, 5, 2026, '2026-04-04 07:54:03', '2026-04-04 07:54:03'),
(54, 5, 2027, '2026-04-04 07:54:03', '2026-04-04 07:54:03'),
(55, 5, 2028, '2026-04-04 07:54:03', '2026-04-04 07:54:03'),
(56, 6, 2018, '2026-04-04 07:54:03', '2026-04-04 07:54:03'),
(57, 6, 2019, '2026-04-04 07:54:03', '2026-04-04 07:54:03'),
(58, 6, 2020, '2026-04-04 07:54:03', '2026-04-04 07:54:03'),
(59, 6, 2021, '2026-04-04 07:54:03', '2026-04-04 07:54:03'),
(60, 6, 2022, '2026-04-04 07:54:03', '2026-04-04 07:54:03'),
(61, 6, 2023, '2026-04-04 07:54:03', '2026-04-04 07:54:03'),
(62, 6, 2024, '2026-04-04 07:54:03', '2026-04-04 07:54:03'),
(63, 6, 2025, '2026-04-04 07:54:03', '2026-04-04 07:54:03'),
(64, 6, 2026, '2026-04-04 07:54:03', '2026-04-04 07:54:03'),
(65, 6, 2027, '2026-04-04 07:54:03', '2026-04-04 07:54:03'),
(66, 7, 2018, '2026-04-04 07:54:03', '2026-04-04 07:54:03'),
(67, 7, 2019, '2026-04-04 07:54:03', '2026-04-04 07:54:03'),
(68, 7, 2020, '2026-04-04 07:54:03', '2026-04-04 07:54:03'),
(69, 7, 2021, '2026-04-04 07:54:03', '2026-04-04 07:54:03'),
(70, 7, 2022, '2026-04-04 07:54:03', '2026-04-04 07:54:03'),
(71, 7, 2023, '2026-04-04 07:54:03', '2026-04-04 07:54:03'),
(72, 7, 2024, '2026-04-04 07:54:03', '2026-04-04 07:54:03'),
(73, 7, 2025, '2026-04-04 07:54:03', '2026-04-04 07:54:03'),
(74, 7, 2026, '2026-04-04 07:54:03', '2026-04-04 07:54:03'),
(75, 7, 2027, '2026-04-04 07:54:03', '2026-04-04 07:54:03'),
(76, 7, 2028, '2026-04-04 07:54:03', '2026-04-04 07:54:03'),
(77, 8, 2018, '2026-04-04 07:54:03', '2026-04-04 07:54:03'),
(78, 8, 2019, '2026-04-04 07:54:03', '2026-04-04 07:54:03'),
(79, 8, 2020, '2026-04-04 07:54:03', '2026-04-04 07:54:03'),
(80, 8, 2021, '2026-04-04 07:54:03', '2026-04-04 07:54:03'),
(81, 8, 2022, '2026-04-04 07:54:03', '2026-04-04 07:54:03'),
(82, 8, 2023, '2026-04-04 07:54:03', '2026-04-04 07:54:03'),
(83, 8, 2024, '2026-04-04 07:54:03', '2026-04-04 07:54:03'),
(84, 8, 2025, '2026-04-04 07:54:03', '2026-04-04 07:54:03'),
(85, 8, 2026, '2026-04-04 07:54:03', '2026-04-04 07:54:03'),
(86, 8, 2027, '2026-04-04 07:54:03', '2026-04-04 07:54:03'),
(87, 8, 2028, '2026-04-04 07:54:03', '2026-04-04 07:54:03'),
(88, 9, 2020, '2026-04-04 07:54:03', '2026-04-04 07:54:03'),
(89, 9, 2021, '2026-04-04 07:54:03', '2026-04-04 07:54:03'),
(90, 9, 2022, '2026-04-04 07:54:03', '2026-04-04 07:54:03'),
(91, 9, 2023, '2026-04-04 07:54:03', '2026-04-04 07:54:03'),
(92, 9, 2024, '2026-04-04 07:54:03', '2026-04-04 07:54:03'),
(93, 9, 2025, '2026-04-04 07:54:03', '2026-04-04 07:54:03'),
(94, 9, 2026, '2026-04-04 07:54:03', '2026-04-04 07:54:03'),
(95, 9, 2027, '2026-04-04 07:54:03', '2026-04-04 07:54:03'),
(96, 9, 2028, '2026-04-04 07:54:03', '2026-04-04 07:54:03'),
(97, 10, 2021, '2026-04-04 07:54:03', '2026-04-04 07:54:03'),
(98, 10, 2022, '2026-04-04 07:54:03', '2026-04-04 07:54:03'),
(99, 10, 2023, '2026-04-04 07:54:03', '2026-04-04 07:54:03'),
(100, 10, 2024, '2026-04-04 07:54:03', '2026-04-04 07:54:03'),
(101, 10, 2025, '2026-04-04 07:54:03', '2026-04-04 07:54:03'),
(102, 10, 2026, '2026-04-04 07:54:03', '2026-04-04 07:54:03'),
(103, 10, 2027, '2026-04-04 07:54:03', '2026-04-04 07:54:03'),
(104, 10, 2028, '2026-04-04 07:54:03', '2026-04-04 07:54:03');

-- --------------------------------------------------------

--
-- Table structure for table `entity_mapping_attachments`
--

CREATE TABLE `entity_mapping_attachments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `period_id` bigint(20) UNSIGNED DEFAULT NULL,
  `entity_mapping_id` bigint(20) UNSIGNED DEFAULT NULL,
  `attachment_path` varchar(255) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `filename` varchar(255) DEFAULT NULL,
  `actual_filename` varchar(255) DEFAULT NULL,
  `is_reminder` varchar(255) DEFAULT NULL,
  `expiry_date` date DEFAULT NULL,
  `created_by` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `entity_mapping_attachments`
--

INSERT INTO `entity_mapping_attachments` (`id`, `period_id`, `entity_mapping_id`, `attachment_path`, `type`, `filename`, `actual_filename`, `is_reminder`, `expiry_date`, `created_by`, `created_at`, `updated_at`) VALUES
(1, 5, 1, 'attachments/1/general_liquidation_date_1.pdf', 'general_liquidation_date', 'GENERAL_LIQUIDATION_DATE_1.pdf', 'GENERAL_LIQUIDATION_DATE_1.pdf', 'yes', '2027-03-26', NULL, '2026-04-04 07:54:09', '2026-04-04 07:54:09'),
(2, 5, 1, 'attachments/1/tax_corporate_tax_certificate_2.pdf', 'tax_corporate_tax_certificate', 'TAX_CORPORATE_TAX_CERTIFICATE_2.pdf', 'TAX_CORPORATE_TAX_CERTIFICATE_2.pdf', 'yes', '2026-11-08', NULL, '2026-04-04 07:54:09', '2026-04-04 07:54:09'),
(3, 5, 1, 'attachments/1/general_liquidation_date_3.pdf', 'general_liquidation_date', 'GENERAL_LIQUIDATION_DATE_3.pdf', 'GENERAL_LIQUIDATION_DATE_3.pdf', 'yes', '2027-03-23', NULL, '2026-04-04 07:54:09', '2026-04-04 07:54:09'),
(4, 5, 2, 'attachments/2/tax_corporate_tax_certificate_1.pdf', 'tax_corporate_tax_certificate', 'TAX_CORPORATE_TAX_CERTIFICATE_1.pdf', 'TAX_CORPORATE_TAX_CERTIFICATE_1.pdf', 'yes', '2026-05-17', NULL, '2026-04-04 07:54:09', '2026-04-04 07:54:09'),
(5, 5, 3, 'attachments/3/tax_corporate_tax_certificate_1.pdf', 'tax_corporate_tax_certificate', 'TAX_CORPORATE_TAX_CERTIFICATE_1.pdf', 'TAX_CORPORATE_TAX_CERTIFICATE_1.pdf', 'yes', '2026-04-30', NULL, '2026-04-04 07:54:09', '2026-04-04 07:54:09'),
(6, 5, 4, 'attachments/4/general_trade_license_number_1.pdf', 'general_trade_license_number', 'GENERAL_TRADE_LICENSE_NUMBER_1.pdf', 'GENERAL_TRADE_LICENSE_NUMBER_1.pdf', 'no', '2026-11-29', NULL, '2026-04-04 07:54:09', '2026-04-04 07:54:09'),
(7, 5, 5, 'attachments/5/general_trade_license_number_1.pdf', 'general_trade_license_number', 'GENERAL_TRADE_LICENSE_NUMBER_1.pdf', 'GENERAL_TRADE_LICENSE_NUMBER_1.pdf', 'no', '2026-06-04', NULL, '2026-04-04 07:54:09', '2026-04-04 07:54:09'),
(8, 5, 5, 'attachments/5/financial_doa_2.pdf', 'financial_doa', 'FINANCIAL_DOA_2.pdf', 'FINANCIAL_DOA_2.pdf', 'no', '2026-11-21', NULL, '2026-04-04 07:54:09', '2026-04-04 07:54:09'),
(9, 5, 6, 'attachments/6/tax_corporate_tax_certificate_1.pdf', 'tax_corporate_tax_certificate', 'TAX_CORPORATE_TAX_CERTIFICATE_1.pdf', 'TAX_CORPORATE_TAX_CERTIFICATE_1.pdf', 'yes', '2027-03-24', NULL, '2026-04-04 07:54:09', '2026-04-04 07:54:09'),
(10, 5, 6, 'attachments/6/general_liquidation_date_2.pdf', 'general_liquidation_date', 'GENERAL_LIQUIDATION_DATE_2.pdf', 'GENERAL_LIQUIDATION_DATE_2.pdf', 'no', '2026-11-01', NULL, '2026-04-04 07:54:09', '2026-04-04 07:54:09'),
(11, 5, 6, 'attachments/6/financial_doa_3.pdf', 'financial_doa', 'FINANCIAL_DOA_3.pdf', 'FINANCIAL_DOA_3.pdf', 'yes', '2026-07-10', NULL, '2026-04-04 07:54:09', '2026-04-04 07:54:09'),
(12, 5, 7, 'attachments/7/general_liquidation_date_1.pdf', 'general_liquidation_date', 'GENERAL_LIQUIDATION_DATE_1.pdf', 'GENERAL_LIQUIDATION_DATE_1.pdf', 'yes', '2026-06-19', NULL, '2026-04-04 07:54:09', '2026-04-04 07:54:09'),
(13, 5, 7, 'attachments/7/tax_corporate_tax_certificate_2.pdf', 'tax_corporate_tax_certificate', 'TAX_CORPORATE_TAX_CERTIFICATE_2.pdf', 'TAX_CORPORATE_TAX_CERTIFICATE_2.pdf', 'yes', '2026-07-15', NULL, '2026-04-04 07:54:09', '2026-04-04 07:54:09'),
(14, 5, 7, 'attachments/7/financial_doa_3.pdf', 'financial_doa', 'FINANCIAL_DOA_3.pdf', 'FINANCIAL_DOA_3.pdf', 'no', '2026-09-28', NULL, '2026-04-04 07:54:09', '2026-04-04 07:54:09'),
(15, 5, 8, 'attachments/8/financial_doa_1.pdf', 'financial_doa', 'FINANCIAL_DOA_1.pdf', 'FINANCIAL_DOA_1.pdf', 'yes', '2026-09-06', NULL, '2026-04-04 07:54:09', '2026-04-04 07:54:09'),
(16, 5, 8, 'attachments/8/general_liquidation_date_2.pdf', 'general_liquidation_date', 'GENERAL_LIQUIDATION_DATE_2.pdf', 'GENERAL_LIQUIDATION_DATE_2.pdf', 'no', '2026-12-25', NULL, '2026-04-04 07:54:09', '2026-04-04 07:54:09'),
(17, 5, 8, 'attachments/8/tax_corporate_tax_certificate_3.pdf', 'tax_corporate_tax_certificate', 'TAX_CORPORATE_TAX_CERTIFICATE_3.pdf', 'TAX_CORPORATE_TAX_CERTIFICATE_3.pdf', 'yes', '2027-01-11', NULL, '2026-04-04 07:54:09', '2026-04-04 07:54:09'),
(18, 5, 9, 'attachments/9/general_trade_license_number_1.pdf', 'general_trade_license_number', 'GENERAL_TRADE_LICENSE_NUMBER_1.pdf', 'GENERAL_TRADE_LICENSE_NUMBER_1.pdf', 'yes', '2027-03-27', NULL, '2026-04-04 07:54:09', '2026-04-04 07:54:09'),
(19, 5, 10, 'attachments/10/tax_corporate_tax_certificate_1.pdf', 'tax_corporate_tax_certificate', 'TAX_CORPORATE_TAX_CERTIFICATE_1.pdf', 'TAX_CORPORATE_TAX_CERTIFICATE_1.pdf', 'no', '2026-11-11', NULL, '2026-04-04 07:54:09', '2026-04-04 07:54:09'),
(20, 5, 11, 'attachments/11/general_liquidation_date_1.pdf', 'general_liquidation_date', 'GENERAL_LIQUIDATION_DATE_1.pdf', 'GENERAL_LIQUIDATION_DATE_1.pdf', 'no', '2026-07-04', NULL, '2026-04-04 07:54:09', '2026-04-04 07:54:09'),
(21, 5, 11, 'attachments/11/tax_corporate_tax_certificate_2.pdf', 'tax_corporate_tax_certificate', 'TAX_CORPORATE_TAX_CERTIFICATE_2.pdf', 'TAX_CORPORATE_TAX_CERTIFICATE_2.pdf', 'no', '2027-02-20', NULL, '2026-04-04 07:54:09', '2026-04-04 07:54:09'),
(22, 5, 12, 'attachments/12/general_trade_license_number_1.pdf', 'general_trade_license_number', 'GENERAL_TRADE_LICENSE_NUMBER_1.pdf', 'GENERAL_TRADE_LICENSE_NUMBER_1.pdf', 'no', '2027-02-13', NULL, '2026-04-04 07:54:09', '2026-04-04 07:54:09'),
(23, 5, 12, 'attachments/12/tax_corporate_tax_certificate_2.pdf', 'tax_corporate_tax_certificate', 'TAX_CORPORATE_TAX_CERTIFICATE_2.pdf', 'TAX_CORPORATE_TAX_CERTIFICATE_2.pdf', 'yes', '2027-03-14', NULL, '2026-04-04 07:54:09', '2026-04-04 07:54:09'),
(24, 5, 13, 'attachments/13/general_trade_license_number_1.pdf', 'general_trade_license_number', 'GENERAL_TRADE_LICENSE_NUMBER_1.pdf', 'GENERAL_TRADE_LICENSE_NUMBER_1.pdf', 'no', '2026-12-19', NULL, '2026-04-04 07:54:09', '2026-04-04 07:54:09'),
(25, 5, 14, 'attachments/14/financial_doa_1.pdf', 'financial_doa', 'FINANCIAL_DOA_1.pdf', 'FINANCIAL_DOA_1.pdf', 'no', '2026-08-16', NULL, '2026-04-04 07:54:09', '2026-04-04 07:54:09'),
(26, 5, 14, 'attachments/14/tax_corporate_tax_certificate_2.pdf', 'tax_corporate_tax_certificate', 'TAX_CORPORATE_TAX_CERTIFICATE_2.pdf', 'TAX_CORPORATE_TAX_CERTIFICATE_2.pdf', 'yes', '2026-12-29', NULL, '2026-04-04 07:54:09', '2026-04-04 07:54:09'),
(27, 5, 15, 'attachments/15/financial_doa_1.pdf', 'financial_doa', 'FINANCIAL_DOA_1.pdf', 'FINANCIAL_DOA_1.pdf', 'no', '2026-12-26', NULL, '2026-04-04 07:54:09', '2026-04-04 07:54:09'),
(28, 5, 15, 'attachments/15/tax_corporate_tax_certificate_2.pdf', 'tax_corporate_tax_certificate', 'TAX_CORPORATE_TAX_CERTIFICATE_2.pdf', 'TAX_CORPORATE_TAX_CERTIFICATE_2.pdf', 'yes', '2026-07-22', NULL, '2026-04-04 07:54:09', '2026-04-04 07:54:09'),
(29, 5, 16, 'attachments/16/financial_doa_1.pdf', 'financial_doa', 'FINANCIAL_DOA_1.pdf', 'FINANCIAL_DOA_1.pdf', 'no', '2026-08-07', NULL, '2026-04-04 07:54:09', '2026-04-04 07:54:09'),
(30, 5, 17, 'attachments/17/general_liquidation_date_1.pdf', 'general_liquidation_date', 'GENERAL_LIQUIDATION_DATE_1.pdf', 'GENERAL_LIQUIDATION_DATE_1.pdf', 'no', '2026-12-05', NULL, '2026-04-04 07:54:09', '2026-04-04 07:54:09'),
(31, 5, 17, 'attachments/17/tax_corporate_tax_certificate_2.pdf', 'tax_corporate_tax_certificate', 'TAX_CORPORATE_TAX_CERTIFICATE_2.pdf', 'TAX_CORPORATE_TAX_CERTIFICATE_2.pdf', 'yes', '2026-06-06', NULL, '2026-04-04 07:54:09', '2026-04-04 07:54:09'),
(32, 5, 18, 'attachments/18/general_trade_license_number_1.pdf', 'general_trade_license_number', 'GENERAL_TRADE_LICENSE_NUMBER_1.pdf', 'GENERAL_TRADE_LICENSE_NUMBER_1.pdf', 'no', '2026-12-16', NULL, '2026-04-04 07:54:09', '2026-04-04 07:54:09'),
(33, 5, 19, 'attachments/19/tax_corporate_tax_certificate_1.pdf', 'tax_corporate_tax_certificate', 'TAX_CORPORATE_TAX_CERTIFICATE_1.pdf', 'TAX_CORPORATE_TAX_CERTIFICATE_1.pdf', 'no', '2026-09-03', NULL, '2026-04-04 07:54:09', '2026-04-04 07:54:09'),
(34, 5, 19, 'attachments/19/general_liquidation_date_2.pdf', 'general_liquidation_date', 'GENERAL_LIQUIDATION_DATE_2.pdf', 'GENERAL_LIQUIDATION_DATE_2.pdf', 'yes', '2026-09-15', NULL, '2026-04-04 07:54:09', '2026-04-04 07:54:09'),
(35, 5, 20, 'attachments/20/general_trade_license_number_1.pdf', 'general_trade_license_number', 'GENERAL_TRADE_LICENSE_NUMBER_1.pdf', 'GENERAL_TRADE_LICENSE_NUMBER_1.pdf', 'yes', '2026-04-20', NULL, '2026-04-04 07:54:09', '2026-04-04 07:54:09'),
(36, 5, 21, 'attachments/21/general_trade_license_number_1.pdf', 'general_trade_license_number', 'GENERAL_TRADE_LICENSE_NUMBER_1.pdf', 'GENERAL_TRADE_LICENSE_NUMBER_1.pdf', 'yes', '2026-12-17', NULL, '2026-04-04 07:54:09', '2026-04-04 07:54:09'),
(37, 5, 21, 'attachments/21/general_liquidation_date_2.pdf', 'general_liquidation_date', 'GENERAL_LIQUIDATION_DATE_2.pdf', 'GENERAL_LIQUIDATION_DATE_2.pdf', 'no', '2026-10-19', NULL, '2026-04-04 07:54:09', '2026-04-04 07:54:09'),
(38, 5, 21, 'attachments/21/general_liquidation_date_3.pdf', 'general_liquidation_date', 'GENERAL_LIQUIDATION_DATE_3.pdf', 'GENERAL_LIQUIDATION_DATE_3.pdf', 'no', '2026-10-23', NULL, '2026-04-04 07:54:09', '2026-04-04 07:54:09'),
(39, 5, 22, 'attachments/22/general_liquidation_date_1.pdf', 'general_liquidation_date', 'GENERAL_LIQUIDATION_DATE_1.pdf', 'GENERAL_LIQUIDATION_DATE_1.pdf', 'yes', '2027-01-18', NULL, '2026-04-04 07:54:09', '2026-04-04 07:54:09'),
(40, 5, 22, 'attachments/22/tax_corporate_tax_certificate_2.pdf', 'tax_corporate_tax_certificate', 'TAX_CORPORATE_TAX_CERTIFICATE_2.pdf', 'TAX_CORPORATE_TAX_CERTIFICATE_2.pdf', 'yes', '2027-01-27', NULL, '2026-04-04 07:54:09', '2026-04-04 07:54:09'),
(41, 5, 22, 'attachments/22/financial_doa_3.pdf', 'financial_doa', 'FINANCIAL_DOA_3.pdf', 'FINANCIAL_DOA_3.pdf', 'no', '2026-11-24', NULL, '2026-04-04 07:54:09', '2026-04-04 07:54:09'),
(42, 5, 23, 'attachments/23/tax_corporate_tax_certificate_1.pdf', 'tax_corporate_tax_certificate', 'TAX_CORPORATE_TAX_CERTIFICATE_1.pdf', 'TAX_CORPORATE_TAX_CERTIFICATE_1.pdf', 'no', '2026-06-01', NULL, '2026-04-04 07:54:09', '2026-04-04 07:54:09'),
(43, 5, 24, 'attachments/24/tax_corporate_tax_certificate_1.pdf', 'tax_corporate_tax_certificate', 'TAX_CORPORATE_TAX_CERTIFICATE_1.pdf', 'TAX_CORPORATE_TAX_CERTIFICATE_1.pdf', 'yes', '2026-08-12', NULL, '2026-04-04 07:54:09', '2026-04-04 07:54:09'),
(44, 5, 24, 'attachments/24/financial_doa_2.pdf', 'financial_doa', 'FINANCIAL_DOA_2.pdf', 'FINANCIAL_DOA_2.pdf', 'yes', '2026-10-29', NULL, '2026-04-04 07:54:09', '2026-04-04 07:54:09'),
(45, 5, 24, 'attachments/24/general_liquidation_date_3.pdf', 'general_liquidation_date', 'GENERAL_LIQUIDATION_DATE_3.pdf', 'GENERAL_LIQUIDATION_DATE_3.pdf', 'yes', '2026-06-18', NULL, '2026-04-04 07:54:09', '2026-04-04 07:54:09'),
(46, 5, 25, 'attachments/25/tax_corporate_tax_certificate_1.pdf', 'tax_corporate_tax_certificate', 'TAX_CORPORATE_TAX_CERTIFICATE_1.pdf', 'TAX_CORPORATE_TAX_CERTIFICATE_1.pdf', 'no', '2026-10-04', NULL, '2026-04-04 07:54:09', '2026-04-04 07:54:09'),
(47, 5, 26, 'attachments/26/general_trade_license_number_1.pdf', 'general_trade_license_number', 'GENERAL_TRADE_LICENSE_NUMBER_1.pdf', 'GENERAL_TRADE_LICENSE_NUMBER_1.pdf', 'yes', '2026-07-17', NULL, '2026-04-04 07:54:09', '2026-04-04 07:54:09'),
(48, 5, 26, 'attachments/26/tax_corporate_tax_certificate_2.pdf', 'tax_corporate_tax_certificate', 'TAX_CORPORATE_TAX_CERTIFICATE_2.pdf', 'TAX_CORPORATE_TAX_CERTIFICATE_2.pdf', 'yes', '2026-08-10', NULL, '2026-04-04 07:54:09', '2026-04-04 07:54:09'),
(49, 5, 27, 'attachments/27/financial_doa_1.pdf', 'financial_doa', 'FINANCIAL_DOA_1.pdf', 'FINANCIAL_DOA_1.pdf', 'no', '2026-06-21', NULL, '2026-04-04 07:54:09', '2026-04-04 07:54:09'),
(50, 5, 27, 'attachments/27/financial_doa_2.pdf', 'financial_doa', 'FINANCIAL_DOA_2.pdf', 'FINANCIAL_DOA_2.pdf', 'yes', '2026-08-25', NULL, '2026-04-04 07:54:09', '2026-04-04 07:54:09'),
(51, 5, 28, 'attachments/28/general_liquidation_date_1.pdf', 'general_liquidation_date', 'GENERAL_LIQUIDATION_DATE_1.pdf', 'GENERAL_LIQUIDATION_DATE_1.pdf', 'no', '2027-01-22', NULL, '2026-04-04 07:54:09', '2026-04-04 07:54:09'),
(52, 5, 28, 'attachments/28/general_trade_license_number_2.pdf', 'general_trade_license_number', 'GENERAL_TRADE_LICENSE_NUMBER_2.pdf', 'GENERAL_TRADE_LICENSE_NUMBER_2.pdf', 'yes', '2026-05-04', NULL, '2026-04-04 07:54:09', '2026-04-04 07:54:09'),
(53, 5, 28, 'attachments/28/general_trade_license_number_3.pdf', 'general_trade_license_number', 'GENERAL_TRADE_LICENSE_NUMBER_3.pdf', 'GENERAL_TRADE_LICENSE_NUMBER_3.pdf', 'no', '2027-01-14', NULL, '2026-04-04 07:54:09', '2026-04-04 07:54:09'),
(54, 5, 29, 'attachments/29/general_trade_license_number_1.pdf', 'general_trade_license_number', 'GENERAL_TRADE_LICENSE_NUMBER_1.pdf', 'GENERAL_TRADE_LICENSE_NUMBER_1.pdf', 'yes', '2026-11-13', NULL, '2026-04-04 07:54:09', '2026-04-04 07:54:09'),
(55, 5, 29, 'attachments/29/general_trade_license_number_2.pdf', 'general_trade_license_number', 'GENERAL_TRADE_LICENSE_NUMBER_2.pdf', 'GENERAL_TRADE_LICENSE_NUMBER_2.pdf', 'no', '2026-12-06', NULL, '2026-04-04 07:54:09', '2026-04-04 07:54:09'),
(56, 5, 30, 'attachments/30/general_trade_license_number_1.pdf', 'general_trade_license_number', 'GENERAL_TRADE_LICENSE_NUMBER_1.pdf', 'GENERAL_TRADE_LICENSE_NUMBER_1.pdf', 'yes', '2026-08-12', NULL, '2026-04-04 07:54:09', '2026-04-04 07:54:09'),
(57, 5, 30, 'attachments/30/general_trade_license_number_2.pdf', 'general_trade_license_number', 'GENERAL_TRADE_LICENSE_NUMBER_2.pdf', 'GENERAL_TRADE_LICENSE_NUMBER_2.pdf', 'no', '2026-04-17', NULL, '2026-04-04 07:54:09', '2026-04-04 07:54:09'),
(58, 5, 31, 'attachments/31/general_trade_license_number_1.pdf', 'general_trade_license_number', 'GENERAL_TRADE_LICENSE_NUMBER_1.pdf', 'GENERAL_TRADE_LICENSE_NUMBER_1.pdf', 'yes', '2026-08-24', NULL, '2026-04-04 07:54:09', '2026-04-04 07:54:09'),
(59, 5, 32, 'attachments/32/tax_corporate_tax_certificate_1.pdf', 'tax_corporate_tax_certificate', 'TAX_CORPORATE_TAX_CERTIFICATE_1.pdf', 'TAX_CORPORATE_TAX_CERTIFICATE_1.pdf', 'no', '2026-08-01', NULL, '2026-04-04 07:54:09', '2026-04-04 07:54:09'),
(60, 5, 33, 'attachments/33/tax_corporate_tax_certificate_1.pdf', 'tax_corporate_tax_certificate', 'TAX_CORPORATE_TAX_CERTIFICATE_1.pdf', 'TAX_CORPORATE_TAX_CERTIFICATE_1.pdf', 'no', '2026-05-25', NULL, '2026-04-04 07:54:09', '2026-04-04 07:54:09'),
(61, 5, 33, 'attachments/33/tax_corporate_tax_certificate_2.pdf', 'tax_corporate_tax_certificate', 'TAX_CORPORATE_TAX_CERTIFICATE_2.pdf', 'TAX_CORPORATE_TAX_CERTIFICATE_2.pdf', 'no', '2027-03-01', NULL, '2026-04-04 07:54:09', '2026-04-04 07:54:09'),
(62, 5, 33, 'attachments/33/general_liquidation_date_3.pdf', 'general_liquidation_date', 'GENERAL_LIQUIDATION_DATE_3.pdf', 'GENERAL_LIQUIDATION_DATE_3.pdf', 'no', '2026-05-14', NULL, '2026-04-04 07:54:09', '2026-04-04 07:54:09'),
(63, 5, 34, 'attachments/34/general_liquidation_date_1.pdf', 'general_liquidation_date', 'GENERAL_LIQUIDATION_DATE_1.pdf', 'GENERAL_LIQUIDATION_DATE_1.pdf', 'no', '2026-12-18', NULL, '2026-04-04 07:54:09', '2026-04-04 07:54:09'),
(64, 5, 34, 'attachments/34/tax_corporate_tax_certificate_2.pdf', 'tax_corporate_tax_certificate', 'TAX_CORPORATE_TAX_CERTIFICATE_2.pdf', 'TAX_CORPORATE_TAX_CERTIFICATE_2.pdf', 'yes', '2026-08-17', NULL, '2026-04-04 07:54:09', '2026-04-04 07:54:09'),
(65, 5, 34, 'attachments/34/general_liquidation_date_3.pdf', 'general_liquidation_date', 'GENERAL_LIQUIDATION_DATE_3.pdf', 'GENERAL_LIQUIDATION_DATE_3.pdf', 'yes', '2026-06-27', NULL, '2026-04-04 07:54:09', '2026-04-04 07:54:09'),
(66, 5, 35, 'attachments/35/financial_doa_1.pdf', 'financial_doa', 'FINANCIAL_DOA_1.pdf', 'FINANCIAL_DOA_1.pdf', 'yes', '2026-09-28', NULL, '2026-04-04 07:54:09', '2026-04-04 07:54:09'),
(67, 5, 35, 'attachments/35/general_trade_license_number_2.pdf', 'general_trade_license_number', 'GENERAL_TRADE_LICENSE_NUMBER_2.pdf', 'GENERAL_TRADE_LICENSE_NUMBER_2.pdf', 'yes', '2026-10-07', NULL, '2026-04-04 07:54:09', '2026-04-04 07:54:09'),
(68, 5, 35, 'attachments/35/general_liquidation_date_3.pdf', 'general_liquidation_date', 'GENERAL_LIQUIDATION_DATE_3.pdf', 'GENERAL_LIQUIDATION_DATE_3.pdf', 'yes', '2027-03-09', NULL, '2026-04-04 07:54:09', '2026-04-04 07:54:09'),
(69, 5, 36, 'attachments/36/general_liquidation_date_1.pdf', 'general_liquidation_date', 'GENERAL_LIQUIDATION_DATE_1.pdf', 'GENERAL_LIQUIDATION_DATE_1.pdf', 'yes', '2026-12-26', NULL, '2026-04-04 07:54:09', '2026-04-04 07:54:09'),
(70, 5, 36, 'attachments/36/financial_doa_2.pdf', 'financial_doa', 'FINANCIAL_DOA_2.pdf', 'FINANCIAL_DOA_2.pdf', 'yes', '2026-06-01', NULL, '2026-04-04 07:54:09', '2026-04-04 07:54:09'),
(71, 5, 36, 'attachments/36/general_liquidation_date_3.pdf', 'general_liquidation_date', 'GENERAL_LIQUIDATION_DATE_3.pdf', 'GENERAL_LIQUIDATION_DATE_3.pdf', 'yes', '2026-04-24', NULL, '2026-04-04 07:54:09', '2026-04-04 07:54:09'),
(72, 5, 37, 'attachments/37/general_liquidation_date_1.pdf', 'general_liquidation_date', 'GENERAL_LIQUIDATION_DATE_1.pdf', 'GENERAL_LIQUIDATION_DATE_1.pdf', 'no', '2027-01-03', NULL, '2026-04-04 07:54:09', '2026-04-04 07:54:09'),
(73, 5, 38, 'attachments/38/general_trade_license_number_1.pdf', 'general_trade_license_number', 'GENERAL_TRADE_LICENSE_NUMBER_1.pdf', 'GENERAL_TRADE_LICENSE_NUMBER_1.pdf', 'yes', '2027-01-14', NULL, '2026-04-04 07:54:09', '2026-04-04 07:54:09'),
(74, 5, 38, 'attachments/38/tax_corporate_tax_certificate_2.pdf', 'tax_corporate_tax_certificate', 'TAX_CORPORATE_TAX_CERTIFICATE_2.pdf', 'TAX_CORPORATE_TAX_CERTIFICATE_2.pdf', 'no', '2026-07-20', NULL, '2026-04-04 07:54:09', '2026-04-04 07:54:09'),
(75, 5, 39, 'attachments/39/general_liquidation_date_1.pdf', 'general_liquidation_date', 'GENERAL_LIQUIDATION_DATE_1.pdf', 'GENERAL_LIQUIDATION_DATE_1.pdf', 'no', '2026-06-26', NULL, '2026-04-04 07:54:09', '2026-04-04 07:54:09'),
(76, 5, 39, 'attachments/39/general_liquidation_date_2.pdf', 'general_liquidation_date', 'GENERAL_LIQUIDATION_DATE_2.pdf', 'GENERAL_LIQUIDATION_DATE_2.pdf', 'yes', '2026-09-02', NULL, '2026-04-04 07:54:09', '2026-04-04 07:54:09'),
(77, 5, 40, 'attachments/40/tax_corporate_tax_certificate_1.pdf', 'tax_corporate_tax_certificate', 'TAX_CORPORATE_TAX_CERTIFICATE_1.pdf', 'TAX_CORPORATE_TAX_CERTIFICATE_1.pdf', 'no', '2026-04-23', NULL, '2026-04-04 07:54:09', '2026-04-04 07:54:09'),
(78, 5, 40, 'attachments/40/tax_corporate_tax_certificate_2.pdf', 'tax_corporate_tax_certificate', 'TAX_CORPORATE_TAX_CERTIFICATE_2.pdf', 'TAX_CORPORATE_TAX_CERTIFICATE_2.pdf', 'no', '2027-01-03', NULL, '2026-04-04 07:54:09', '2026-04-04 07:54:09'),
(79, 5, 41, 'attachments/41/general_liquidation_date_1.pdf', 'general_liquidation_date', 'GENERAL_LIQUIDATION_DATE_1.pdf', 'GENERAL_LIQUIDATION_DATE_1.pdf', 'no', '2027-03-24', NULL, '2026-04-04 07:54:09', '2026-04-04 07:54:09'),
(80, 5, 41, 'attachments/41/tax_corporate_tax_certificate_2.pdf', 'tax_corporate_tax_certificate', 'TAX_CORPORATE_TAX_CERTIFICATE_2.pdf', 'TAX_CORPORATE_TAX_CERTIFICATE_2.pdf', 'no', '2026-04-19', NULL, '2026-04-04 07:54:09', '2026-04-04 07:54:09'),
(81, 5, 42, 'attachments/42/financial_doa_1.pdf', 'financial_doa', 'FINANCIAL_DOA_1.pdf', 'FINANCIAL_DOA_1.pdf', 'no', '2026-08-24', NULL, '2026-04-04 07:54:09', '2026-04-04 07:54:09'),
(82, 5, 42, 'attachments/42/financial_doa_2.pdf', 'financial_doa', 'FINANCIAL_DOA_2.pdf', 'FINANCIAL_DOA_2.pdf', 'yes', '2026-08-12', NULL, '2026-04-04 07:54:09', '2026-04-04 07:54:09'),
(83, 5, 42, 'attachments/42/general_trade_license_number_3.pdf', 'general_trade_license_number', 'GENERAL_TRADE_LICENSE_NUMBER_3.pdf', 'GENERAL_TRADE_LICENSE_NUMBER_3.pdf', 'no', '2026-09-19', NULL, '2026-04-04 07:54:09', '2026-04-04 07:54:09'),
(84, 5, 43, 'attachments/43/general_liquidation_date_1.pdf', 'general_liquidation_date', 'GENERAL_LIQUIDATION_DATE_1.pdf', 'GENERAL_LIQUIDATION_DATE_1.pdf', 'no', '2026-12-29', NULL, '2026-04-04 07:54:09', '2026-04-04 07:54:09'),
(85, 5, 44, 'attachments/44/tax_corporate_tax_certificate_1.pdf', 'tax_corporate_tax_certificate', 'TAX_CORPORATE_TAX_CERTIFICATE_1.pdf', 'TAX_CORPORATE_TAX_CERTIFICATE_1.pdf', 'no', '2027-01-29', NULL, '2026-04-04 07:54:09', '2026-04-04 07:54:09'),
(86, 5, 45, 'attachments/45/general_trade_license_number_1.pdf', 'general_trade_license_number', 'GENERAL_TRADE_LICENSE_NUMBER_1.pdf', 'GENERAL_TRADE_LICENSE_NUMBER_1.pdf', 'no', '2027-02-02', NULL, '2026-04-04 07:54:09', '2026-04-04 07:54:09'),
(87, 5, 45, 'attachments/45/general_trade_license_number_2.pdf', 'general_trade_license_number', 'GENERAL_TRADE_LICENSE_NUMBER_2.pdf', 'GENERAL_TRADE_LICENSE_NUMBER_2.pdf', 'yes', '2026-08-28', NULL, '2026-04-04 07:54:09', '2026-04-04 07:54:09'),
(88, 5, 46, 'attachments/46/financial_doa_1.pdf', 'financial_doa', 'FINANCIAL_DOA_1.pdf', 'FINANCIAL_DOA_1.pdf', 'no', '2026-08-13', NULL, '2026-04-04 07:54:09', '2026-04-04 07:54:09'),
(89, 5, 46, 'attachments/46/general_trade_license_number_2.pdf', 'general_trade_license_number', 'GENERAL_TRADE_LICENSE_NUMBER_2.pdf', 'GENERAL_TRADE_LICENSE_NUMBER_2.pdf', 'yes', '2026-09-16', NULL, '2026-04-04 07:54:09', '2026-04-04 07:54:09'),
(90, 5, 46, 'attachments/46/tax_corporate_tax_certificate_3.pdf', 'tax_corporate_tax_certificate', 'TAX_CORPORATE_TAX_CERTIFICATE_3.pdf', 'TAX_CORPORATE_TAX_CERTIFICATE_3.pdf', 'yes', '2027-02-16', NULL, '2026-04-04 07:54:09', '2026-04-04 07:54:09'),
(91, 5, 47, 'attachments/47/general_liquidation_date_1.pdf', 'general_liquidation_date', 'GENERAL_LIQUIDATION_DATE_1.pdf', 'GENERAL_LIQUIDATION_DATE_1.pdf', 'no', '2027-03-28', NULL, '2026-04-04 07:54:09', '2026-04-04 07:54:09'),
(92, 5, 47, 'attachments/47/financial_doa_2.pdf', 'financial_doa', 'FINANCIAL_DOA_2.pdf', 'FINANCIAL_DOA_2.pdf', 'yes', '2026-06-04', NULL, '2026-04-04 07:54:09', '2026-04-04 07:54:09'),
(93, 5, 48, 'attachments/48/financial_doa_1.pdf', 'financial_doa', 'FINANCIAL_DOA_1.pdf', 'FINANCIAL_DOA_1.pdf', 'no', '2027-03-26', NULL, '2026-04-04 07:54:09', '2026-04-04 07:54:09'),
(94, 5, 49, 'attachments/49/tax_corporate_tax_certificate_1.pdf', 'tax_corporate_tax_certificate', 'TAX_CORPORATE_TAX_CERTIFICATE_1.pdf', 'TAX_CORPORATE_TAX_CERTIFICATE_1.pdf', 'no', '2027-01-03', NULL, '2026-04-04 07:54:09', '2026-04-04 07:54:09'),
(95, 5, 50, 'attachments/50/tax_corporate_tax_certificate_1.pdf', 'tax_corporate_tax_certificate', 'TAX_CORPORATE_TAX_CERTIFICATE_1.pdf', 'TAX_CORPORATE_TAX_CERTIFICATE_1.pdf', 'no', '2026-07-02', NULL, '2026-04-04 07:54:09', '2026-04-04 07:54:09'),
(96, 5, 50, 'attachments/50/general_liquidation_date_2.pdf', 'general_liquidation_date', 'GENERAL_LIQUIDATION_DATE_2.pdf', 'GENERAL_LIQUIDATION_DATE_2.pdf', 'no', '2026-06-23', NULL, '2026-04-04 07:54:09', '2026-04-04 07:54:09');

-- --------------------------------------------------------

--
-- Table structure for table `entity_periods`
--

CREATE TABLE `entity_periods` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `reporting_year` smallint(5) UNSIGNED NOT NULL,
  `reporting_month` varchar(20) NOT NULL,
  `is_lock_period` tinyint(1) NOT NULL DEFAULT 0,
  `status` smallint(5) UNSIGNED NOT NULL DEFAULT 1,
  `created_by` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `entity_periods`
--

INSERT INTO `entity_periods` (`id`, `reporting_year`, `reporting_month`, `is_lock_period`, `status`, `created_by`, `created_at`, `updated_at`) VALUES
(1, 2024, 'June', 0, 0, NULL, '2026-04-04 07:54:03', '2026-04-04 07:54:03'),
(2, 2024, 'December', 0, 0, NULL, '2026-04-04 07:54:03', '2026-04-04 07:54:03'),
(3, 2025, 'June', 0, 0, NULL, '2026-04-04 07:54:03', '2026-04-04 07:54:03'),
(4, 2025, 'December', 0, 0, NULL, '2026-04-04 07:54:03', '2026-04-04 07:54:03'),
(5, 2026, 'June', 0, 1, NULL, '2026-04-04 07:54:03', '2026-04-04 07:54:03'),
(6, 2026, 'Annual', 0, 0, NULL, '2026-04-04 07:54:03', '2026-04-04 07:54:03');

-- --------------------------------------------------------

--
-- Table structure for table `entity_period_mapping`
--

CREATE TABLE `entity_period_mapping` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `entity_id` bigint(20) UNSIGNED NOT NULL,
  `entity_name` varchar(255) NOT NULL,
  `general_company_legal_type` varchar(255) DEFAULT NULL,
  `country_of_incorporation` bigint(20) UNSIGNED DEFAULT NULL,
  `general_jurisdiction_of_incorporation` varchar(255) DEFAULT NULL,
  `general_incorporation_date` date DEFAULT NULL,
  `general_authorised_signatories` varchar(255) DEFAULT NULL,
  `general_registered_office_address` text DEFAULT NULL,
  `general_trade_license_number` varchar(255) DEFAULT NULL,
  `general_trade_license_expiry_date` date DEFAULT NULL,
  `general_share_capital` decimal(20,2) DEFAULT NULL,
  `general_numbers_of_shares` bigint(20) UNSIGNED DEFAULT NULL,
  `general_liquidation_date` date DEFAULT NULL,
  `assigned_to` varchar(255) DEFAULT NULL,
  `ownership_percentage` decimal(6,2) DEFAULT NULL,
  `category_name` varchar(255) DEFAULT NULL,
  `company_status` varchar(255) DEFAULT NULL,
  `auditor` varchar(255) DEFAULT NULL,
  `classification` varchar(255) DEFAULT NULL,
  `parent` int(11) DEFAULT NULL,
  `legal_ownership` varchar(255) DEFAULT NULL,
  `principal_activities` text DEFAULT NULL,
  `is_reporting_entity` tinyint(1) NOT NULL DEFAULT 1,
  `period_id` bigint(20) UNSIGNED DEFAULT NULL,
  `is_lock_entity` tinyint(1) NOT NULL DEFAULT 0,
  `is_deleted` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `entity_period_mapping`
--

INSERT INTO `entity_period_mapping` (`id`, `entity_id`, `entity_name`, `general_company_legal_type`, `country_of_incorporation`, `general_jurisdiction_of_incorporation`, `general_incorporation_date`, `general_authorised_signatories`, `general_registered_office_address`, `general_trade_license_number`, `general_trade_license_expiry_date`, `general_share_capital`, `general_numbers_of_shares`, `general_liquidation_date`, `assigned_to`, `ownership_percentage`, `category_name`, `company_status`, `auditor`, `classification`, `parent`, `legal_ownership`, `principal_activities`, `is_reporting_entity`, `period_id`, `is_lock_entity`, `is_deleted`, `created_at`, `updated_at`) VALUES
(1, 1, 'ENT0001 - 1', 'Ltd', 10, 'Jurisdiction ENT0001', '2022-03-31', 'Signatory A; Signatory B', 'Registered Office ENT0001', 'TLN-ENT0001', '2023-04-02', 6204258.00, 135668, NULL, 'Finance', 71.00, 'Medium', 'Active', 'Auditor A', 'Medium Group', NULL, 'Direct', 'Principal activities for ENT0001', 1, 5, 0, 0, '2026-04-04 07:54:03', '2026-04-04 07:54:03'),
(2, 2, 'ENT0002 - 2', 'Corp', 2, 'Jurisdiction ENT0002', '2019-01-23', 'Signatory A; Signatory B', 'Registered Office ENT0002', 'TLN-ENT0002', '2018-12-31', 5686042.00, 1286002, NULL, 'Legal', 53.00, 'Large', 'Dormant', 'Auditor B', 'Large Group', 1, 'Direct', 'Principal activities for ENT0002', 1, 5, 0, 0, '2026-04-04 07:54:03', '2026-04-04 07:54:03'),
(3, 3, 'ENT0003 - 3', 'Investments', 20, 'Jurisdiction ENT0003', '2015-03-12', 'Signatory A; Signatory B', 'Registered Office ENT0003', 'TLN-ENT0003', '2015-12-08', 7362598.00, 1343923, NULL, 'Finance', 63.00, 'Medium', 'Active', 'Auditor C', 'Medium Group', 1, 'Direct', 'Principal activities for ENT0003', 1, 5, 0, 0, '2026-04-04 07:54:03', '2026-04-04 07:54:03'),
(4, 4, 'ENT0004 - 4', 'Holdings', 18, 'Jurisdiction ENT0004', '2005-03-25', 'Signatory A; Signatory B', 'Registered Office ENT0004', 'TLN-ENT0004', '2005-01-18', 5577820.00, 740097, NULL, 'Legal', 92.00, 'Medium', 'Under_liquidation', 'Auditor D', 'Medium Group', 1, 'Direct', 'Principal activities for ENT0004', 1, 5, 0, 0, '2026-04-04 07:54:03', '2026-04-04 07:54:03'),
(5, 5, 'ENT0005 - 5', 'Trading LLC', 27, 'Jurisdiction ENT0005', '2000-06-21', 'Signatory A; Signatory B', 'Registered Office ENT0005', 'TLN-ENT0005', '2001-05-27', 7787800.00, 1317289, NULL, 'Legal', 84.00, 'Small', 'Under_liquidation', 'Auditor E', 'Small Group', 2, 'Direct', 'Principal activities for ENT0005', 1, 5, 0, 0, '2026-04-04 07:54:03', '2026-04-04 07:54:03'),
(6, 6, 'ENT0006 - 6', 'LLC', 28, 'Jurisdiction ENT0006', '1999-09-21', 'Signatory A; Signatory B', 'Registered Office ENT0006', 'TLN-ENT0006', '2000-01-21', 1263334.00, 1295964, NULL, 'Finance', 80.00, 'Medium', 'Active', 'Auditor F', 'Medium Group', 2, 'Direct', 'Principal activities for ENT0006', 1, 5, 0, 0, '2026-04-04 07:54:03', '2026-04-04 07:54:03'),
(7, 7, 'ENT0007 - 7', 'Ltd', 11, 'Jurisdiction ENT0007', '1990-07-18', 'Signatory A; Signatory B', 'Registered Office ENT0007', 'TLN-ENT0007', '1990-03-07', 370653.00, 1858524, NULL, 'Finance', 75.00, 'Medium', 'Active', 'Auditor G', 'Medium Group', 2, 'Direct', 'Principal activities for ENT0007', 1, 5, 0, 0, '2026-04-04 07:54:03', '2026-04-04 07:54:03'),
(8, 8, 'ENT0008 - 8', 'Corp', 21, 'Jurisdiction ENT0008', '1982-03-01', 'Signatory A; Signatory B', 'Registered Office ENT0008', 'TLN-ENT0008', '1982-12-27', 5539498.00, 1719963, NULL, 'Finance', 71.00, 'Large', 'Active', 'Auditor H', 'Large Group', 3, 'Direct', 'Principal activities for ENT0008', 1, 5, 0, 0, '2026-04-04 07:54:03', '2026-04-04 07:54:03'),
(9, 9, 'ENT0009 - 9', 'Investments', 29, 'Jurisdiction ENT0009', '1977-01-01', 'Signatory A; Signatory B', 'Registered Office ENT0009', 'TLN-ENT0009', '1977-07-30', 7097409.00, 1865784, NULL, 'Finance', 56.00, 'Small', 'Active', 'Auditor I', 'Small Group', 3, 'Direct', 'Principal activities for ENT0009', 1, 5, 0, 0, '2026-04-04 07:54:03', '2026-04-04 07:54:03'),
(10, 10, 'ENT0010 - 10', 'Holdings', 20, 'Jurisdiction ENT0010', '1974-09-29', 'Signatory A; Signatory B', 'Registered Office ENT0010', 'TLN-ENT0010', '1975-08-20', 4524405.00, 512622, NULL, 'Finance', 89.00, 'Small', 'Active', 'Auditor J', 'Small Group', 3, 'Direct', 'Principal activities for ENT0010', 1, 5, 0, 0, '2026-04-04 07:54:03', '2026-04-04 07:54:03'),
(11, 11, 'ENT0011 - 11', 'Trading LLC', 13, 'Jurisdiction ENT0011', '1972-04-16', 'Signatory A; Signatory B', 'Registered Office ENT0011', 'TLN-ENT0011', '1972-10-02', 7551870.00, 1922787, NULL, 'Finance', 71.00, 'Large', 'Active', 'Auditor K', 'Large Group', 4, 'Direct', 'Principal activities for ENT0011', 1, 5, 0, 0, '2026-04-04 07:54:03', '2026-04-04 07:54:03'),
(12, 12, 'ENT0012 - 12', 'LLC', 21, 'Jurisdiction ENT0012', '1966-07-06', 'Signatory A; Signatory B', 'Registered Office ENT0012', 'TLN-ENT0012', '1966-01-22', 5289127.00, 1736277, NULL, 'Finance', 66.00, 'Small', 'Active', 'Auditor L', 'Small Group', 4, 'Direct', 'Principal activities for ENT0012', 1, 5, 0, 0, '2026-04-04 07:54:03', '2026-04-04 07:54:03'),
(13, 13, 'ENT0013 - 13', 'Ltd', 8, 'Jurisdiction ENT0013', '1962-07-26', 'Signatory A; Signatory B', 'Registered Office ENT0013', 'TLN-ENT0013', '1963-03-30', 1719516.00, 500426, '1962-06-19', 'Legal', 57.00, 'Medium', 'Disposed', 'Auditor M', 'Medium Group', 4, 'Direct', 'Principal activities for ENT0013', 1, 5, 0, 0, '2026-04-04 07:54:03', '2026-04-04 07:54:03'),
(14, 14, 'ENT0014 - 14', 'Corp', 27, 'Jurisdiction ENT0014', '1957-12-08', 'Signatory A; Signatory B', 'Registered Office ENT0014', 'TLN-ENT0014', '1957-09-09', 6915288.00, 869767, NULL, 'Finance', 85.00, 'Large', 'Active', 'Auditor N', 'Large Group', 5, 'Direct', 'Principal activities for ENT0014', 1, 5, 0, 0, '2026-04-04 07:54:03', '2026-04-04 07:54:03'),
(15, 15, 'ENT0015 - 15', 'Investments', 25, 'Jurisdiction ENT0015', '1949-11-06', 'Signatory A; Signatory B', 'Registered Office ENT0015', 'TLN-ENT0015', '1950-06-02', 5218484.00, 1980731, NULL, 'Legal', 76.00, 'Small', 'Dormant', 'Auditor O', 'Small Group', 5, 'Direct', 'Principal activities for ENT0015', 1, 5, 0, 0, '2026-04-04 07:54:03', '2026-04-04 07:54:03'),
(16, 16, 'ENT0016 - 16', 'Holdings', 26, 'Jurisdiction ENT0016', '1942-02-08', 'Signatory A; Signatory B', 'Registered Office ENT0016', 'TLN-ENT0016', '1942-03-04', 6792003.00, 1677888, NULL, 'Legal', 100.00, 'Large', 'Dormant', 'Auditor P', 'Large Group', 5, 'Direct', 'Principal activities for ENT0016', 1, 5, 0, 0, '2026-04-04 07:54:03', '2026-04-04 07:54:03'),
(17, 17, 'ENT0017 - 17', 'Trading LLC', 7, 'Jurisdiction ENT0017', '1935-07-09', 'Signatory A; Signatory B', 'Registered Office ENT0017', 'TLN-ENT0017', '1935-09-24', 8485562.00, 1871987, '1935-06-06', 'Legal', 58.00, 'Large', 'Disposed', 'Auditor Q', 'Large Group', 6, 'Direct', 'Principal activities for ENT0017', 1, 5, 0, 0, '2026-04-04 07:54:03', '2026-04-04 07:54:03'),
(18, 18, 'ENT0018 - 18', 'LLC', 15, 'Jurisdiction ENT0018', '1927-06-11', 'Signatory A; Signatory B', 'Registered Office ENT0018', 'TLN-ENT0018', '1928-05-23', 1102071.00, 29616, NULL, 'Finance', 78.00, 'Medium', 'Active', 'Auditor R', 'Medium Group', 6, 'Direct', 'Principal activities for ENT0018', 1, 5, 0, 0, '2026-04-04 07:54:03', '2026-04-04 07:54:03'),
(19, 19, 'ENT0019 - 19', 'Ltd', 1, 'Jurisdiction ENT0019', '1920-04-23', 'Signatory A; Signatory B', 'Registered Office ENT0019', 'TLN-ENT0019', '1920-06-22', 4188857.00, 1716908, NULL, 'Finance', 78.00, 'Medium', 'Active', 'Auditor S', 'Medium Group', 6, 'Direct', 'Principal activities for ENT0019', 1, 5, 0, 0, '2026-04-04 07:54:03', '2026-04-04 07:54:03'),
(20, 20, 'ENT0020 - 20', 'Corp', 12, 'Jurisdiction ENT0020', '1916-07-10', 'Signatory A; Signatory B', 'Registered Office ENT0020', 'TLN-ENT0020', '1916-04-05', 5143844.00, 1976773, NULL, 'Legal', 96.00, 'Small', 'Under_liquidation', 'Auditor T', 'Small Group', 7, 'Direct', 'Principal activities for ENT0020', 1, 5, 0, 0, '2026-04-04 07:54:03', '2026-04-04 07:54:03'),
(21, 21, 'ENT0021 - 21', 'Investments', 12, 'Jurisdiction ENT0021', '1914-02-19', 'Signatory A; Signatory B', 'Registered Office ENT0021', 'TLN-ENT0021', '1913-12-04', 3771946.00, 608142, NULL, 'Finance', 67.00, 'Medium', 'Active', 'Auditor U', 'Medium Group', 7, 'Direct', 'Principal activities for ENT0021', 1, 5, 0, 0, '2026-04-04 07:54:03', '2026-04-04 07:54:03'),
(22, 22, 'ENT0022 - 22', 'Holdings', 22, 'Jurisdiction ENT0022', '1910-05-22', 'Signatory A; Signatory B', 'Registered Office ENT0022', 'TLN-ENT0022', '1910-06-27', 5723794.00, 1190466, NULL, 'Finance', 95.00, 'Large', 'Active', 'Auditor V', 'Large Group', 7, 'Direct', 'Principal activities for ENT0022', 1, 5, 0, 0, '2026-04-04 07:54:03', '2026-04-04 07:54:03'),
(23, 23, 'ENT0023 - 23', 'Trading LLC', 23, 'Jurisdiction ENT0023', '1902-02-11', 'Signatory A; Signatory B', 'Registered Office ENT0023', 'TLN-ENT0023', '1902-09-30', 4436252.00, 1687395, NULL, 'Legal', 79.00, 'Small', 'Dormant', 'Auditor W', 'Small Group', 8, 'Direct', 'Principal activities for ENT0023', 1, 5, 0, 0, '2026-04-04 07:54:03', '2026-04-04 07:54:03'),
(24, 24, 'ENT0024 - 24', 'LLC', 23, 'Jurisdiction ENT0024', '1896-12-14', 'Signatory A; Signatory B', 'Registered Office ENT0024', 'TLN-ENT0024', '1897-10-12', 2887879.00, 1803226, NULL, 'Finance', 73.00, 'Small', 'Active', 'Auditor X', 'Small Group', 8, 'Direct', 'Principal activities for ENT0024', 1, 5, 0, 0, '2026-04-04 07:54:03', '2026-04-04 07:54:03'),
(25, 25, 'ENT0025 - 25', 'Ltd', 5, 'Jurisdiction ENT0025', '1890-09-02', 'Signatory A; Signatory B', 'Registered Office ENT0025', 'TLN-ENT0025', '1891-09-21', 2936872.00, 1343850, NULL, 'Legal', 55.00, 'Medium', 'Dormant', 'Auditor Y', 'Medium Group', 8, 'Direct', 'Principal activities for ENT0025', 1, 5, 0, 0, '2026-04-04 07:54:03', '2026-04-04 07:54:03'),
(26, 26, 'ENT0026 - 26', 'Corp', 14, 'Jurisdiction ENT0026', '1888-12-13', 'Signatory A; Signatory B', 'Registered Office ENT0026', 'TLN-ENT0026', '1889-03-01', 4764133.00, 725997, NULL, 'Legal', 57.00, 'Medium', 'Under_liquidation', 'Auditor Z', 'Medium Group', 9, 'Direct', 'Principal activities for ENT0026', 1, 5, 0, 0, '2026-04-04 07:54:03', '2026-04-04 07:54:03'),
(27, 27, 'ENT0027 - 27', 'Investments', 20, 'Jurisdiction ENT0027', '1883-01-13', 'Signatory A; Signatory B', 'Registered Office ENT0027', 'TLN-ENT0027', '1883-10-03', 613681.00, 554744, NULL, 'Legal', 61.00, 'Small', 'Dormant', 'Auditor A', 'Small Group', 9, 'Direct', 'Principal activities for ENT0027', 1, 5, 0, 0, '2026-04-04 07:54:03', '2026-04-04 07:54:03'),
(28, 28, 'ENT0028 - 28', 'Holdings', 21, 'Jurisdiction ENT0028', '1873-11-08', 'Signatory A; Signatory B', 'Registered Office ENT0028', 'TLN-ENT0028', '1873-09-13', 3555747.00, 1088363, NULL, 'Finance', 54.00, 'Medium', 'Active', 'Auditor B', 'Medium Group', 9, 'Direct', 'Principal activities for ENT0028', 1, 5, 0, 0, '2026-04-04 07:54:03', '2026-04-04 07:54:03'),
(29, 29, 'ENT0029 - 29', 'Trading LLC', 26, 'Jurisdiction ENT0029', '1869-01-08', 'Signatory A; Signatory B', 'Registered Office ENT0029', 'TLN-ENT0029', '1869-02-16', 6277956.00, 1445834, NULL, 'Legal', 63.00, 'Small', 'Under_liquidation', 'Auditor C', 'Small Group', 10, 'Direct', 'Principal activities for ENT0029', 1, 5, 0, 0, '2026-04-04 07:54:03', '2026-04-04 07:54:03'),
(30, 30, 'ENT0030 - 30', 'LLC', 26, 'Jurisdiction ENT0030', '1865-11-18', 'Signatory A; Signatory B', 'Registered Office ENT0030', 'TLN-ENT0030', '1865-09-08', 4749206.00, 287595, NULL, 'Finance', 75.00, 'Small', 'Active', 'Auditor D', 'Small Group', 10, 'Direct', 'Principal activities for ENT0030', 1, 5, 0, 0, '2026-04-04 07:54:03', '2026-04-04 07:54:03'),
(31, 31, 'ENT0031 - 31', 'Ltd', 6, 'Jurisdiction ENT0031', '1864-03-13', 'Signatory A; Signatory B', 'Registered Office ENT0031', 'TLN-ENT0031', '1864-07-06', 4089430.00, 1597218, NULL, 'Legal', 92.00, 'Medium', 'Dormant', 'Auditor E', 'Medium Group', 10, 'Direct', 'Principal activities for ENT0031', 1, 5, 0, 0, '2026-04-04 07:54:03', '2026-04-04 07:54:03'),
(32, 32, 'ENT0032 - 32', 'Corp', 29, 'Jurisdiction ENT0032', '1854-11-24', 'Signatory A; Signatory B', 'Registered Office ENT0032', 'TLN-ENT0032', '1855-08-30', 3030352.00, 759833, NULL, 'Legal', 54.00, 'Medium', 'Dormant', 'Auditor F', 'Medium Group', 11, 'Direct', 'Principal activities for ENT0032', 1, 5, 0, 0, '2026-04-04 07:54:03', '2026-04-04 07:54:03'),
(33, 33, 'ENT0033 - 33', 'Investments', 25, 'Jurisdiction ENT0033', '1850-10-31', 'Signatory A; Signatory B', 'Registered Office ENT0033', 'TLN-ENT0033', '1851-04-08', 2023140.00, 1669347, '1850-09-21', 'Legal', 76.00, 'Large', 'Disposed', 'Auditor G', 'Large Group', 11, 'Direct', 'Principal activities for ENT0033', 1, 5, 0, 0, '2026-04-04 07:54:03', '2026-04-04 07:54:03'),
(34, 34, 'ENT0034 - 34', 'Holdings', 12, 'Jurisdiction ENT0034', '1840-01-20', 'Signatory A; Signatory B', 'Registered Office ENT0034', 'TLN-ENT0034', '1841-01-05', 4987227.00, 1696832, NULL, 'Legal', 61.00, 'Medium', 'Dormant', 'Auditor H', 'Medium Group', 11, 'Direct', 'Principal activities for ENT0034', 1, 5, 0, 0, '2026-04-04 07:54:03', '2026-04-04 07:54:03'),
(35, 35, 'ENT0035 - 35', 'Trading LLC', 15, 'Jurisdiction ENT0035', '1832-12-20', 'Signatory A; Signatory B', 'Registered Office ENT0035', 'TLN-ENT0035', '1832-10-13', 458958.00, 583389, NULL, 'Finance', 80.00, 'Large', 'Active', 'Auditor I', 'Large Group', 12, 'Direct', 'Principal activities for ENT0035', 1, 5, 0, 0, '2026-04-04 07:54:03', '2026-04-04 07:54:03'),
(36, 36, 'ENT0036 - 36', 'LLC', 4, 'Jurisdiction ENT0036', '1822-07-16', 'Signatory A; Signatory B', 'Registered Office ENT0036', 'TLN-ENT0036', '1822-08-24', 7152644.00, 1248010, NULL, 'Finance', 88.00, 'Medium', 'Active', 'Auditor J', 'Medium Group', 12, 'Direct', 'Principal activities for ENT0036', 1, 5, 0, 0, '2026-04-04 07:54:03', '2026-04-04 07:54:03'),
(37, 37, 'ENT0037 - 37', 'Ltd', 26, 'Jurisdiction ENT0037', '1817-03-13', 'Signatory A; Signatory B', 'Registered Office ENT0037', 'TLN-ENT0037', '1817-08-20', 5585485.00, 1719858, NULL, 'Finance', 54.00, 'Medium', 'Active', 'Auditor K', 'Medium Group', 12, 'Direct', 'Principal activities for ENT0037', 1, 5, 0, 0, '2026-04-04 07:54:03', '2026-04-04 07:54:03'),
(38, 38, 'ENT0038 - 38', 'Corp', 13, 'Jurisdiction ENT0038', '1810-06-04', 'Signatory A; Signatory B', 'Registered Office ENT0038', 'TLN-ENT0038', '1810-08-03', 3114241.00, 1304892, NULL, 'Legal', 55.00, 'Medium', 'Dormant', 'Auditor L', 'Medium Group', 13, 'Direct', 'Principal activities for ENT0038', 1, 5, 0, 0, '2026-04-04 07:54:03', '2026-04-04 07:54:03'),
(39, 39, 'ENT0039 - 39', 'Investments', 18, 'Jurisdiction ENT0039', '1804-05-22', 'Signatory A; Signatory B', 'Registered Office ENT0039', 'TLN-ENT0039', '1805-03-17', 4135188.00, 837832, NULL, 'Finance', 66.00, 'Large', 'Active', 'Auditor M', 'Large Group', 13, 'Direct', 'Principal activities for ENT0039', 1, 5, 0, 0, '2026-04-04 07:54:03', '2026-04-04 07:54:03'),
(40, 40, 'ENT0040 - 40', 'Holdings', 20, 'Jurisdiction ENT0040', '1796-09-20', 'Signatory A; Signatory B', 'Registered Office ENT0040', 'TLN-ENT0040', '1796-04-07', 5621942.00, 1442015, NULL, 'Finance', 82.00, 'Large', 'Active', 'Auditor N', 'Large Group', 13, 'Direct', 'Principal activities for ENT0040', 1, 5, 0, 0, '2026-04-04 07:54:03', '2026-04-04 07:54:03'),
(41, 41, 'ENT0041 - 41', 'Trading LLC', 4, 'Jurisdiction ENT0041', '1790-02-14', 'Signatory A; Signatory B', 'Registered Office ENT0041', 'TLN-ENT0041', '1789-12-16', 8144255.00, 928388, NULL, 'Legal', 67.00, 'Large', 'Dormant', 'Auditor O', 'Large Group', 14, 'Direct', 'Principal activities for ENT0041', 1, 5, 0, 0, '2026-04-04 07:54:03', '2026-04-04 07:54:03'),
(42, 42, 'ENT0042 - 42', 'LLC', 25, 'Jurisdiction ENT0042', '1784-08-14', 'Signatory A; Signatory B', 'Registered Office ENT0042', 'TLN-ENT0042', '1784-02-01', 4306858.00, 294634, '1781-12-16', 'Legal', 74.00, 'Medium', 'Disposed', 'Auditor P', 'Medium Group', 14, 'Direct', 'Principal activities for ENT0042', 1, 5, 0, 0, '2026-04-04 07:54:03', '2026-04-04 07:54:03'),
(43, 43, 'ENT0043 - 43', 'Ltd', 27, 'Jurisdiction ENT0043', '1780-04-23', 'Signatory A; Signatory B', 'Registered Office ENT0043', 'TLN-ENT0043', '1780-05-31', 112475.00, 1225038, NULL, 'Finance', 100.00, 'Small', 'Active', 'Auditor Q', 'Small Group', 14, 'Direct', 'Principal activities for ENT0043', 1, 5, 0, 0, '2026-04-04 07:54:03', '2026-04-04 07:54:03'),
(44, 44, 'ENT0044 - 44', 'Corp', 4, 'Jurisdiction ENT0044', '1777-06-12', 'Signatory A; Signatory B', 'Registered Office ENT0044', 'TLN-ENT0044', '1777-09-28', 2778671.00, 700316, NULL, 'Finance', 94.00, 'Medium', 'Active', 'Auditor R', 'Medium Group', 15, 'Direct', 'Principal activities for ENT0044', 1, 5, 0, 0, '2026-04-04 07:54:03', '2026-04-04 07:54:03'),
(45, 45, 'ENT0045 - 45', 'Investments', 17, 'Jurisdiction ENT0045', '1775-01-06', 'Signatory A; Signatory B', 'Registered Office ENT0045', 'TLN-ENT0045', '1775-04-09', 6801870.00, 1275296, NULL, 'Finance', 73.00, 'Medium', 'Active', 'Auditor S', 'Medium Group', 15, 'Direct', 'Principal activities for ENT0045', 1, 5, 0, 0, '2026-04-04 07:54:03', '2026-04-04 07:54:03'),
(46, 46, 'ENT0046 - 46', 'Holdings', 12, 'Jurisdiction ENT0046', '1772-01-02', 'Signatory A; Signatory B', 'Registered Office ENT0046', 'TLN-ENT0046', '1772-01-17', 5917596.00, 1281287, NULL, 'Finance', 64.00, 'Medium', 'Active', 'Auditor T', 'Medium Group', 15, 'Direct', 'Principal activities for ENT0046', 1, 5, 0, 0, '2026-04-04 07:54:03', '2026-04-04 07:54:03'),
(47, 47, 'ENT0047 - 47', 'Trading LLC', 4, 'Jurisdiction ENT0047', '1769-06-13', 'Signatory A; Signatory B', 'Registered Office ENT0047', 'TLN-ENT0047', '1770-06-06', 386351.00, 1743916, NULL, 'Legal', 96.00, 'Medium', 'Under_liquidation', 'Auditor U', 'Medium Group', 49, 'Direct', 'Principal activities for ENT0047', 1, 5, 0, 0, '2026-04-04 07:54:03', '2026-04-04 07:54:03'),
(48, 48, 'ENT0048 - 48', 'LLC', 23, 'Jurisdiction ENT0048', '1768-02-15', 'Signatory A; Signatory B', 'Registered Office ENT0048', 'TLN-ENT0048', '1768-09-02', 8057255.00, 72600, NULL, 'Finance', 67.00, 'Small', 'Active', 'Auditor V', 'Small Group', 49, 'Direct', 'Principal activities for ENT0048', 1, 5, 0, 0, '2026-04-04 07:54:03', '2026-04-04 07:54:03'),
(49, 49, 'ENT0049 - 49', 'Ltd', 9, 'Jurisdiction ENT0049', '1764-04-10', 'Signatory A; Signatory B', 'Registered Office ENT0049', 'TLN-ENT0049', '1764-02-08', 5269868.00, 21308, NULL, 'Finance', 93.00, 'Small', 'Active', 'Auditor W', 'Small Group', 16, 'Direct', 'Principal activities for ENT0049', 1, 5, 0, 0, '2026-04-04 07:54:03', '2026-04-04 07:54:03'),
(50, 50, 'ENT0050 - 50', 'Corp', 11, 'Jurisdiction ENT0050', '1762-06-20', 'Signatory A; Signatory B', 'Registered Office ENT0050', 'TLN-ENT0050', '1763-02-18', 5888303.00, 1850024, NULL, 'Legal', 97.00, 'Medium', 'Under_liquidation', 'Auditor X', 'Medium Group', 49, 'Direct', 'Principal activities for ENT0050', 1, 5, 0, 0, '2026-04-04 07:54:03', '2026-04-04 07:54:03');

-- --------------------------------------------------------

--
-- Table structure for table `entity_reporting_matrix`
--

CREATE TABLE `entity_reporting_matrix` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `entity_id` bigint(20) UNSIGNED NOT NULL,
  `item_id` bigint(20) UNSIGNED NOT NULL,
  `reporting_year` smallint(5) UNSIGNED NOT NULL,
  `reporting_month` varchar(20) NOT NULL,
  `deadline_date` date NOT NULL,
  `submission_date` date DEFAULT NULL,
  `reviewed_date` date DEFAULT NULL,
  `completed_date` date DEFAULT NULL,
  `is_deleted` tinyint(1) NOT NULL DEFAULT 0,
  `created_by` bigint(20) UNSIGNED DEFAULT NULL,
  `updated_by` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `entity_reporting_matrix`
--

INSERT INTO `entity_reporting_matrix` (`id`, `entity_id`, `item_id`, `reporting_year`, `reporting_month`, `deadline_date`, `submission_date`, `reviewed_date`, `completed_date`, `is_deleted`, `created_by`, `updated_by`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 2025, 'June', '2026-02-04', '2026-02-15', '2026-02-16', '2026-02-25', 0, NULL, NULL, '2026-04-04 07:54:03', '2026-04-04 07:54:03'),
(2, 1, 2, 2025, 'June', '2026-04-02', NULL, NULL, NULL, 0, NULL, NULL, '2026-04-04 07:54:03', '2026-04-04 07:54:03'),
(3, 1, 3, 2025, 'June', '2026-01-16', '2026-01-16', '2026-01-19', '2026-01-20', 0, NULL, NULL, '2026-04-04 07:54:03', '2026-04-04 07:54:03'),
(4, 1, 4, 2025, 'June', '2026-08-03', '2026-08-03', '2026-08-04', '2026-08-05', 0, NULL, NULL, '2026-04-04 07:54:03', '2026-04-04 07:54:03'),
(5, 1, 5, 2025, 'June', '2026-03-01', '2026-03-01', '2026-03-06', '2026-03-11', 0, NULL, NULL, '2026-04-04 07:54:03', '2026-04-04 07:54:03'),
(6, 1, 6, 2025, 'June', '2025-11-06', NULL, NULL, NULL, 0, NULL, NULL, '2026-04-04 07:54:03', '2026-04-04 07:54:03'),
(7, 1, 7, 2025, 'June', '2025-12-31', '2026-01-04', '2026-01-08', '2026-01-10', 0, NULL, NULL, '2026-04-04 07:54:03', '2026-04-04 07:54:03'),
(8, 1, 8, 2025, 'June', '2025-11-03', '2025-11-05', '2025-11-07', '2025-11-07', 0, NULL, NULL, '2026-04-04 07:54:03', '2026-04-04 07:54:03'),
(9, 1, 9, 2025, 'June', '2026-03-19', '2026-03-13', '2026-03-14', '2026-03-15', 0, NULL, NULL, '2026-04-04 07:54:03', '2026-04-04 07:54:03'),
(10, 1, 10, 2025, 'June', '2026-05-11', NULL, NULL, NULL, 0, NULL, NULL, '2026-04-04 07:54:03', '2026-04-04 07:54:03'),
(11, 2, 1, 2025, 'June', '2026-02-10', '2026-02-17', '2026-02-24', '2026-03-01', 0, NULL, NULL, '2026-04-04 07:54:03', '2026-04-04 07:54:03'),
(12, 2, 2, 2025, 'June', '2025-12-24', '2025-12-24', '2026-01-02', '2026-01-07', 0, NULL, NULL, '2026-04-04 07:54:03', '2026-04-04 07:54:03'),
(13, 2, 3, 2025, 'June', '2025-12-21', '2025-12-29', '2026-01-06', '2026-01-12', 0, NULL, NULL, '2026-04-04 07:54:03', '2026-04-04 07:54:03'),
(14, 2, 4, 2025, 'June', '2026-03-16', '2026-03-16', '2026-03-20', '2026-03-22', 0, NULL, NULL, '2026-04-04 07:54:03', '2026-04-04 07:54:03'),
(15, 2, 5, 2025, 'June', '2026-05-29', '2026-05-20', '2026-05-20', '2026-05-22', 0, NULL, NULL, '2026-04-04 07:54:03', '2026-04-04 07:54:03'),
(16, 2, 6, 2025, 'June', '2026-03-02', '2026-03-02', '2026-03-02', '2026-03-12', 0, NULL, NULL, '2026-04-04 07:54:03', '2026-04-04 07:54:03'),
(17, 2, 7, 2025, 'June', '2026-07-27', '2026-07-27', '2026-08-01', '2026-08-04', 0, NULL, NULL, '2026-04-04 07:54:03', '2026-04-04 07:54:03'),
(18, 2, 8, 2025, 'June', '2026-05-09', '2026-05-09', '2026-05-16', '2026-05-21', 0, NULL, NULL, '2026-04-04 07:54:03', '2026-04-04 07:54:03'),
(19, 2, 9, 2025, 'June', '2026-02-25', '2026-02-12', '2026-02-16', '2026-02-22', 0, NULL, NULL, '2026-04-04 07:54:03', '2026-04-04 07:54:03'),
(20, 2, 10, 2025, 'June', '2026-01-16', NULL, NULL, NULL, 0, NULL, NULL, '2026-04-04 07:54:03', '2026-04-04 07:54:03'),
(21, 3, 1, 2025, 'June', '2025-12-08', '2025-11-26', '2025-12-05', '2025-12-08', 0, NULL, NULL, '2026-04-04 07:54:03', '2026-04-04 07:54:03'),
(22, 3, 2, 2025, 'June', '2026-07-30', '2026-07-18', '2026-07-21', '2026-07-26', 0, NULL, NULL, '2026-04-04 07:54:03', '2026-04-04 07:54:03'),
(23, 3, 3, 2025, 'June', '2026-06-10', '2026-06-01', '2026-06-01', '2026-06-03', 0, NULL, NULL, '2026-04-04 07:54:03', '2026-04-04 07:54:03'),
(24, 3, 4, 2025, 'June', '2025-12-06', '2025-12-06', '2025-12-11', '2025-12-14', 0, NULL, NULL, '2026-04-04 07:54:03', '2026-04-04 07:54:03'),
(25, 3, 5, 2025, 'June', '2026-04-02', NULL, NULL, NULL, 0, NULL, NULL, '2026-04-04 07:54:03', '2026-04-04 07:54:03'),
(26, 3, 6, 2025, 'June', '2026-02-15', '2026-02-15', '2026-02-15', '2026-02-21', 0, NULL, NULL, '2026-04-04 07:54:03', '2026-04-04 07:54:03'),
(27, 3, 7, 2025, 'June', '2026-01-11', '2026-01-11', '2026-01-11', '2026-01-17', 0, NULL, NULL, '2026-04-04 07:54:03', '2026-04-04 07:54:03'),
(28, 3, 8, 2025, 'June', '2026-07-10', '2026-07-10', '2026-07-13', '2026-07-14', 0, NULL, NULL, '2026-04-04 07:54:03', '2026-04-04 07:54:03'),
(29, 3, 9, 2025, 'June', '2025-11-23', '2025-12-05', '2025-12-05', '2025-12-15', 0, NULL, NULL, '2026-04-04 07:54:03', '2026-04-04 07:54:03'),
(30, 3, 10, 2025, 'June', '2026-04-02', NULL, NULL, NULL, 0, NULL, NULL, '2026-04-04 07:54:03', '2026-04-04 07:54:03'),
(31, 4, 1, 2025, 'June', '2026-08-03', '2026-07-29', '2026-08-04', '2026-08-14', 0, NULL, NULL, '2026-04-04 07:54:03', '2026-04-04 07:54:03'),
(32, 4, 2, 2025, 'June', '2026-03-11', '2026-03-10', '2026-03-16', '2026-03-24', 0, NULL, NULL, '2026-04-04 07:54:03', '2026-04-04 07:54:03'),
(33, 4, 3, 2025, 'June', '2026-04-16', '2026-04-16', '2026-04-18', '2026-04-26', 0, NULL, NULL, '2026-04-04 07:54:03', '2026-04-04 07:54:03'),
(34, 4, 4, 2025, 'June', '2026-04-10', '2026-04-10', '2026-04-14', '2026-04-24', 0, NULL, NULL, '2026-04-04 07:54:03', '2026-04-04 07:54:03'),
(35, 4, 5, 2025, 'June', '2026-02-10', '2026-02-10', '2026-02-19', '2026-02-26', 0, NULL, NULL, '2026-04-04 07:54:03', '2026-04-04 07:54:03'),
(36, 4, 6, 2025, 'June', '2025-12-30', '2025-12-30', '2026-01-02', '2026-01-03', 0, NULL, NULL, '2026-04-04 07:54:03', '2026-04-04 07:54:03'),
(37, 4, 7, 2025, 'June', '2026-03-10', '2026-03-21', '2026-03-22', '2026-03-31', 0, NULL, NULL, '2026-04-04 07:54:03', '2026-04-04 07:54:03'),
(38, 4, 8, 2025, 'June', '2026-02-11', '2026-01-29', '2026-02-06', '2026-02-14', 0, NULL, NULL, '2026-04-04 07:54:03', '2026-04-04 07:54:03'),
(39, 4, 9, 2025, 'June', '2025-12-26', '2025-12-14', '2025-12-17', '2025-12-22', 0, NULL, NULL, '2026-04-04 07:54:03', '2026-04-04 07:54:03'),
(40, 4, 10, 2025, 'June', '2026-08-03', NULL, NULL, NULL, 0, NULL, NULL, '2026-04-04 07:54:03', '2026-04-04 07:54:03'),
(41, 5, 1, 2025, 'June', '2026-06-09', NULL, NULL, NULL, 0, NULL, NULL, '2026-04-04 07:54:03', '2026-04-04 07:54:03'),
(42, 5, 2, 2025, 'June', '2026-01-25', NULL, NULL, NULL, 0, NULL, NULL, '2026-04-04 07:54:03', '2026-04-04 07:54:03'),
(43, 5, 3, 2025, 'June', '2026-03-16', NULL, NULL, NULL, 0, NULL, NULL, '2026-04-04 07:54:03', '2026-04-04 07:54:03'),
(44, 5, 4, 2025, 'June', '2026-05-30', '2026-05-25', '2026-05-31', '2026-06-10', 0, NULL, NULL, '2026-04-04 07:54:03', '2026-04-04 07:54:03'),
(45, 5, 5, 2025, 'June', '2026-02-26', '2026-02-26', '2026-02-27', '2026-03-10', 0, NULL, NULL, '2026-04-04 07:54:03', '2026-04-04 07:54:03'),
(46, 5, 6, 2025, 'June', '2025-12-08', NULL, NULL, NULL, 0, NULL, NULL, '2026-04-04 07:54:03', '2026-04-04 07:54:03'),
(47, 5, 7, 2025, 'June', '2026-04-07', '2026-04-05', '2026-04-08', '2026-04-15', 0, NULL, NULL, '2026-04-04 07:54:03', '2026-04-04 07:54:03'),
(48, 5, 8, 2025, 'June', '2026-06-07', '2026-06-02', '2026-06-08', '2026-06-18', 0, NULL, NULL, '2026-04-04 07:54:03', '2026-04-04 07:54:03'),
(49, 5, 9, 2025, 'June', '2026-07-11', '2026-07-11', '2026-07-17', '2026-07-19', 0, NULL, NULL, '2026-04-04 07:54:03', '2026-04-04 07:54:03'),
(50, 5, 10, 2025, 'June', '2026-02-12', '2026-01-31', '2026-02-09', '2026-02-12', 0, NULL, NULL, '2026-04-04 07:54:03', '2026-04-04 07:54:03'),
(51, 6, 1, 2025, 'June', '2026-03-26', '2026-03-14', '2026-03-21', '2026-03-28', 0, NULL, NULL, '2026-04-04 07:54:03', '2026-04-04 07:54:03'),
(52, 6, 2, 2025, 'June', '2026-08-10', '2026-08-03', '2026-08-05', '2026-08-07', 0, NULL, NULL, '2026-04-04 07:54:03', '2026-04-04 07:54:03'),
(53, 6, 3, 2025, 'June', '2026-06-24', '2026-06-12', '2026-06-21', '2026-06-24', 0, NULL, NULL, '2026-04-04 07:54:03', '2026-04-04 07:54:03'),
(54, 6, 4, 2025, 'June', '2026-06-09', NULL, NULL, NULL, 0, NULL, NULL, '2026-04-04 07:54:03', '2026-04-04 07:54:03'),
(55, 6, 5, 2025, 'June', '2026-04-02', NULL, NULL, NULL, 0, NULL, NULL, '2026-04-04 07:54:03', '2026-04-04 07:54:03'),
(56, 6, 6, 2025, 'June', '2026-07-22', '2026-07-22', '2026-07-31', '2026-08-07', 0, NULL, NULL, '2026-04-04 07:54:03', '2026-04-04 07:54:03'),
(57, 6, 7, 2025, 'June', '2025-12-26', NULL, NULL, NULL, 0, NULL, NULL, '2026-04-04 07:54:03', '2026-04-04 07:54:03'),
(58, 6, 8, 2025, 'June', '2026-05-24', NULL, NULL, NULL, 0, NULL, NULL, '2026-04-04 07:54:03', '2026-04-04 07:54:03'),
(59, 6, 9, 2025, 'June', '2026-08-10', '2026-08-10', '2026-08-13', '2026-08-16', 0, NULL, NULL, '2026-04-04 07:54:03', '2026-04-04 07:54:03'),
(60, 6, 10, 2025, 'June', '2026-03-20', '2026-03-20', '2026-03-23', '2026-03-24', 0, NULL, NULL, '2026-04-04 07:54:03', '2026-04-04 07:54:03'),
(61, 7, 1, 2025, 'June', '2025-11-10', '2025-11-17', '2025-11-24', '2025-11-29', 0, NULL, NULL, '2026-04-04 07:54:03', '2026-04-04 07:54:03'),
(62, 7, 2, 2025, 'June', '2026-03-30', '2026-04-03', '2026-04-07', '2026-04-09', 0, NULL, NULL, '2026-04-04 07:54:04', '2026-04-04 07:54:04'),
(63, 7, 3, 2025, 'June', '2026-02-07', '2026-02-05', '2026-02-08', '2026-02-15', 0, NULL, NULL, '2026-04-04 07:54:04', '2026-04-04 07:54:04'),
(64, 7, 4, 2025, 'June', '2026-03-28', '2026-03-18', '2026-03-23', '2026-03-28', 0, NULL, NULL, '2026-04-04 07:54:04', '2026-04-04 07:54:04'),
(65, 7, 5, 2025, 'June', '2026-05-17', '2026-05-07', '2026-05-12', '2026-05-17', 0, NULL, NULL, '2026-04-04 07:54:04', '2026-04-04 07:54:04'),
(66, 7, 6, 2025, 'June', '2026-03-22', '2026-04-04', '2026-04-05', '2026-04-16', 0, NULL, NULL, '2026-04-04 07:54:04', '2026-04-04 07:54:04'),
(67, 7, 7, 2025, 'June', '2026-05-16', '2026-05-07', '2026-05-13', '2026-05-13', 0, NULL, NULL, '2026-04-04 07:54:04', '2026-04-04 07:54:04'),
(68, 7, 8, 2025, 'June', '2026-06-17', '2026-06-04', '2026-06-08', '2026-06-14', 0, NULL, NULL, '2026-04-04 07:54:04', '2026-04-04 07:54:04'),
(69, 7, 9, 2025, 'June', '2026-04-02', NULL, NULL, NULL, 0, NULL, NULL, '2026-04-04 07:54:04', '2026-04-04 07:54:04'),
(70, 7, 10, 2025, 'June', '2026-03-20', '2026-03-15', '2026-03-21', '2026-03-31', 0, NULL, NULL, '2026-04-04 07:54:04', '2026-04-04 07:54:04'),
(71, 8, 1, 2025, 'June', '2026-04-02', NULL, NULL, NULL, 0, NULL, NULL, '2026-04-04 07:54:04', '2026-04-04 07:54:04'),
(72, 8, 2, 2025, 'June', '2026-08-24', NULL, NULL, NULL, 0, NULL, NULL, '2026-04-04 07:54:04', '2026-04-04 07:54:04'),
(73, 8, 3, 2025, 'June', '2026-06-21', '2026-06-11', '2026-06-16', '2026-06-21', 0, NULL, NULL, '2026-04-04 07:54:04', '2026-04-04 07:54:04'),
(74, 8, 4, 2025, 'June', '2026-03-07', '2026-03-17', '2026-03-17', '2026-03-25', 0, NULL, NULL, '2026-04-04 07:54:04', '2026-04-04 07:54:04'),
(75, 8, 5, 2025, 'June', '2026-04-02', NULL, NULL, NULL, 0, NULL, NULL, '2026-04-04 07:54:04', '2026-04-04 07:54:04'),
(76, 8, 6, 2025, 'June', '2026-05-30', '2026-05-30', '2026-06-04', '2026-06-09', 0, NULL, NULL, '2026-04-04 07:54:04', '2026-04-04 07:54:04'),
(77, 8, 7, 2025, 'June', '2026-02-21', '2026-02-25', '2026-03-01', '2026-03-03', 0, NULL, NULL, '2026-04-04 07:54:04', '2026-04-04 07:54:04'),
(78, 8, 8, 2025, 'June', '2025-12-13', NULL, NULL, NULL, 0, NULL, NULL, '2026-04-04 07:54:04', '2026-04-04 07:54:04'),
(79, 8, 9, 2025, 'June', '2025-12-17', '2025-12-07', '2025-12-12', '2025-12-17', 0, NULL, NULL, '2026-04-04 07:54:04', '2026-04-04 07:54:04'),
(80, 8, 10, 2025, 'June', '2026-05-12', '2026-05-02', '2026-05-03', '2026-05-06', 0, NULL, NULL, '2026-04-04 07:54:04', '2026-04-04 07:54:04'),
(81, 9, 1, 2025, 'June', '2026-01-15', '2026-01-27', '2026-01-29', '2026-02-08', 0, NULL, NULL, '2026-04-04 07:54:04', '2026-04-04 07:54:04'),
(82, 9, 2, 2025, 'June', '2025-12-12', '2025-12-22', '2025-12-22', '2025-12-30', 0, NULL, NULL, '2026-04-04 07:54:04', '2026-04-04 07:54:04'),
(83, 9, 3, 2025, 'June', '2026-07-31', '2026-07-19', '2026-07-22', '2026-07-27', 0, NULL, NULL, '2026-04-04 07:54:04', '2026-04-04 07:54:04'),
(84, 9, 4, 2025, 'June', '2025-11-24', '2025-11-21', '2025-11-29', '2025-12-09', 0, NULL, NULL, '2026-04-04 07:54:04', '2026-04-04 07:54:04'),
(85, 9, 5, 2025, 'June', '2025-12-10', NULL, NULL, NULL, 0, NULL, NULL, '2026-04-04 07:54:04', '2026-04-04 07:54:04'),
(86, 9, 6, 2025, 'June', '2026-05-28', '2026-05-20', '2026-05-29', '2026-05-30', 0, NULL, NULL, '2026-04-04 07:54:04', '2026-04-04 07:54:04'),
(87, 9, 7, 2025, 'June', '2026-04-09', NULL, NULL, NULL, 0, NULL, NULL, '2026-04-04 07:54:04', '2026-04-04 07:54:04'),
(88, 9, 8, 2025, 'June', '2026-04-02', NULL, NULL, NULL, 0, NULL, NULL, '2026-04-04 07:54:04', '2026-04-04 07:54:04'),
(89, 9, 9, 2025, 'June', '2025-12-08', '2025-12-08', '2025-12-11', '2025-12-20', 0, NULL, NULL, '2026-04-04 07:54:04', '2026-04-04 07:54:04'),
(90, 9, 10, 2025, 'June', '2026-01-08', '2025-12-31', '2026-01-03', '2026-01-06', 0, NULL, NULL, '2026-04-04 07:54:04', '2026-04-04 07:54:04'),
(91, 10, 1, 2025, 'June', '2026-01-28', '2026-01-28', '2026-02-03', '2026-02-07', 0, NULL, NULL, '2026-04-04 07:54:04', '2026-04-04 07:54:04'),
(92, 10, 2, 2025, 'June', '2026-03-11', '2026-03-11', '2026-03-19', '2026-03-23', 0, NULL, NULL, '2026-04-04 07:54:04', '2026-04-04 07:54:04'),
(93, 10, 3, 2025, 'June', '2026-05-08', '2026-05-08', '2026-05-12', '2026-05-12', 0, NULL, NULL, '2026-04-04 07:54:04', '2026-04-04 07:54:04'),
(94, 10, 4, 2025, 'June', '2026-05-25', '2026-05-25', '2026-06-02', '2026-06-06', 0, NULL, NULL, '2026-04-04 07:54:04', '2026-04-04 07:54:04'),
(95, 10, 5, 2025, 'June', '2025-11-21', '2025-12-02', '2025-12-11', '2025-12-20', 0, NULL, NULL, '2026-04-04 07:54:04', '2026-04-04 07:54:04'),
(96, 10, 6, 2025, 'June', '2026-04-11', '2026-04-01', '2026-04-06', '2026-04-11', 0, NULL, NULL, '2026-04-04 07:54:04', '2026-04-04 07:54:04'),
(97, 10, 7, 2025, 'June', '2026-04-20', '2026-04-20', '2026-04-21', '2026-04-30', 0, NULL, NULL, '2026-04-04 07:54:04', '2026-04-04 07:54:04'),
(98, 10, 8, 2025, 'June', '2026-07-20', '2026-07-07', '2026-07-15', '2026-07-23', 0, NULL, NULL, '2026-04-04 07:54:04', '2026-04-04 07:54:04'),
(99, 10, 9, 2025, 'June', '2026-08-22', '2026-08-22', '2026-08-27', '2026-09-01', 0, NULL, NULL, '2026-04-04 07:54:04', '2026-04-04 07:54:04'),
(100, 10, 10, 2025, 'June', '2026-01-08', '2026-01-15', '2026-01-22', '2026-01-27', 0, NULL, NULL, '2026-04-04 07:54:04', '2026-04-04 07:54:04'),
(101, 11, 1, 2025, 'June', '2026-06-21', '2026-06-21', '2026-06-21', '2026-06-27', 0, NULL, NULL, '2026-04-04 07:54:04', '2026-04-04 07:54:04'),
(102, 11, 2, 2025, 'June', '2026-01-08', '2026-01-08', '2026-01-10', '2026-01-10', 0, NULL, NULL, '2026-04-04 07:54:04', '2026-04-04 07:54:04'),
(103, 11, 3, 2025, 'June', '2025-12-05', '2025-11-22', '2025-11-22', '2025-11-26', 0, NULL, NULL, '2026-04-04 07:54:04', '2026-04-04 07:54:04'),
(104, 11, 4, 2025, 'June', '2026-02-14', '2026-02-14', '2026-02-20', '2026-02-22', 0, NULL, NULL, '2026-04-04 07:54:04', '2026-04-04 07:54:04'),
(105, 11, 5, 2025, 'June', '2026-07-31', NULL, NULL, NULL, 0, NULL, NULL, '2026-04-04 07:54:04', '2026-04-04 07:54:04'),
(106, 11, 6, 2025, 'June', '2025-11-12', '2025-11-12', '2025-11-20', '2025-11-28', 0, NULL, NULL, '2026-04-04 07:54:04', '2026-04-04 07:54:04'),
(107, 11, 7, 2025, 'June', '2026-08-04', '2026-08-04', '2026-08-11', '2026-08-16', 0, NULL, NULL, '2026-04-04 07:54:04', '2026-04-04 07:54:04'),
(108, 11, 8, 2025, 'June', '2025-12-21', '2025-12-08', '2025-12-16', '2025-12-24', 0, NULL, NULL, '2026-04-04 07:54:04', '2026-04-04 07:54:04'),
(109, 11, 9, 2025, 'June', '2026-08-22', '2026-08-15', '2026-08-23', '2026-08-23', 0, NULL, NULL, '2026-04-04 07:54:04', '2026-04-04 07:54:04'),
(110, 11, 10, 2025, 'June', '2026-07-02', '2026-07-02', '2026-07-08', '2026-07-14', 0, NULL, NULL, '2026-04-04 07:54:04', '2026-04-04 07:54:04'),
(111, 12, 1, 2025, 'June', '2025-11-09', '2025-11-14', '2025-11-19', '2025-11-22', 0, NULL, NULL, '2026-04-04 07:54:04', '2026-04-04 07:54:04'),
(112, 12, 2, 2025, 'June', '2026-05-12', '2026-05-12', '2026-05-20', '2026-05-28', 0, NULL, NULL, '2026-04-04 07:54:04', '2026-04-04 07:54:04'),
(113, 12, 3, 2025, 'June', '2026-08-21', '2026-08-17', '2026-08-22', '2026-08-31', 0, NULL, NULL, '2026-04-04 07:54:04', '2026-04-04 07:54:04'),
(114, 12, 4, 2025, 'June', '2026-01-18', NULL, NULL, NULL, 0, NULL, NULL, '2026-04-04 07:54:04', '2026-04-04 07:54:04'),
(115, 12, 5, 2025, 'June', '2026-02-06', '2026-01-23', '2026-01-28', '2026-02-04', 0, NULL, NULL, '2026-04-04 07:54:04', '2026-04-04 07:54:04'),
(116, 12, 6, 2025, 'June', '2026-01-26', NULL, NULL, NULL, 0, NULL, NULL, '2026-04-04 07:54:04', '2026-04-04 07:54:04'),
(117, 12, 7, 2025, 'June', '2026-05-18', '2026-05-18', '2026-05-22', '2026-06-01', 0, NULL, NULL, '2026-04-04 07:54:04', '2026-04-04 07:54:04'),
(118, 12, 8, 2025, 'June', '2026-08-15', '2026-08-15', '2026-08-22', '2026-08-27', 0, NULL, NULL, '2026-04-04 07:54:04', '2026-04-04 07:54:04'),
(119, 12, 9, 2025, 'June', '2025-12-05', '2025-12-05', '2025-12-10', '2025-12-15', 0, NULL, NULL, '2026-04-04 07:54:04', '2026-04-04 07:54:04'),
(120, 12, 10, 2025, 'June', '2026-07-24', '2026-07-15', '2026-07-19', '2026-07-23', 0, NULL, NULL, '2026-04-04 07:54:04', '2026-04-04 07:54:04'),
(121, 13, 1, 2025, 'June', '2026-06-27', '2026-06-21', '2026-06-28', '2026-07-09', 0, NULL, NULL, '2026-04-04 07:54:04', '2026-04-04 07:54:04'),
(122, 13, 2, 2025, 'June', '2026-02-04', '2026-01-30', '2026-02-05', '2026-02-15', 0, NULL, NULL, '2026-04-04 07:54:04', '2026-04-04 07:54:04'),
(123, 13, 3, 2025, 'June', '2026-08-19', '2026-08-19', '2026-08-26', '2026-09-02', 0, NULL, NULL, '2026-04-04 07:54:04', '2026-04-04 07:54:04'),
(124, 13, 4, 2025, 'June', '2026-08-01', '2026-07-22', '2026-07-23', '2026-07-26', 0, NULL, NULL, '2026-04-04 07:54:04', '2026-04-04 07:54:04'),
(125, 13, 5, 2025, 'June', '2025-11-26', '2025-11-26', '2025-12-01', '2025-12-04', 0, NULL, NULL, '2026-04-04 07:54:04', '2026-04-04 07:54:04'),
(126, 13, 6, 2025, 'June', '2026-01-06', '2026-01-06', '2026-01-09', '2026-01-20', 0, NULL, NULL, '2026-04-04 07:54:04', '2026-04-04 07:54:04'),
(127, 13, 7, 2025, 'June', '2025-11-18', '2025-11-28', '2025-11-28', '2025-12-06', 0, NULL, NULL, '2026-04-04 07:54:04', '2026-04-04 07:54:04'),
(128, 13, 8, 2025, 'June', '2026-03-19', '2026-03-23', '2026-03-27', '2026-03-29', 0, NULL, NULL, '2026-04-04 07:54:04', '2026-04-04 07:54:04'),
(129, 13, 9, 2025, 'June', '2026-04-02', NULL, NULL, NULL, 0, NULL, NULL, '2026-04-04 07:54:04', '2026-04-04 07:54:04'),
(130, 13, 10, 2025, 'June', '2026-03-15', NULL, NULL, NULL, 0, NULL, NULL, '2026-04-04 07:54:04', '2026-04-04 07:54:04'),
(131, 14, 1, 2025, 'June', '2025-12-12', '2025-12-06', '2025-12-07', '2025-12-08', 0, NULL, NULL, '2026-04-04 07:54:04', '2026-04-04 07:54:04'),
(132, 14, 2, 2025, 'June', '2026-02-05', '2026-01-28', '2026-02-06', '2026-02-07', 0, NULL, NULL, '2026-04-04 07:54:04', '2026-04-04 07:54:04'),
(133, 14, 3, 2025, 'June', '2026-04-16', NULL, NULL, NULL, 0, NULL, NULL, '2026-04-04 07:54:04', '2026-04-04 07:54:04'),
(134, 14, 4, 2025, 'June', '2026-05-02', '2026-05-02', '2026-05-09', '2026-05-14', 0, NULL, NULL, '2026-04-04 07:54:04', '2026-04-04 07:54:04'),
(135, 14, 5, 2025, 'June', '2025-12-21', NULL, NULL, NULL, 0, NULL, NULL, '2026-04-04 07:54:04', '2026-04-04 07:54:04'),
(136, 14, 6, 2025, 'June', '2026-05-17', '2026-05-17', '2026-05-17', '2026-05-27', 0, NULL, NULL, '2026-04-04 07:54:04', '2026-04-04 07:54:04'),
(137, 14, 7, 2025, 'June', '2026-04-02', NULL, NULL, NULL, 0, NULL, NULL, '2026-04-04 07:54:04', '2026-04-04 07:54:04'),
(138, 14, 8, 2025, 'June', '2026-07-27', NULL, NULL, NULL, 0, NULL, NULL, '2026-04-04 07:54:04', '2026-04-04 07:54:04'),
(139, 14, 9, 2025, 'June', '2025-12-30', '2026-01-03', '2026-01-07', '2026-01-09', 0, NULL, NULL, '2026-04-04 07:54:04', '2026-04-04 07:54:04'),
(140, 14, 10, 2025, 'June', '2026-04-07', '2026-03-25', '2026-03-25', '2026-03-29', 0, NULL, NULL, '2026-04-04 07:54:04', '2026-04-04 07:54:04'),
(141, 15, 1, 2025, 'June', '2026-04-02', NULL, NULL, NULL, 0, NULL, NULL, '2026-04-04 07:54:04', '2026-04-04 07:54:04'),
(142, 15, 2, 2025, 'June', '2026-01-12', '2026-01-19', '2026-01-26', '2026-01-31', 0, NULL, NULL, '2026-04-04 07:54:04', '2026-04-04 07:54:04'),
(143, 15, 3, 2025, 'June', '2026-05-18', '2026-05-13', '2026-05-19', '2026-05-29', 0, NULL, NULL, '2026-04-04 07:54:04', '2026-04-04 07:54:04'),
(144, 15, 4, 2025, 'June', '2026-07-03', '2026-07-01', '2026-07-04', '2026-07-11', 0, NULL, NULL, '2026-04-04 07:54:04', '2026-04-04 07:54:04'),
(145, 15, 5, 2025, 'June', '2026-08-19', '2026-08-10', '2026-08-14', '2026-08-18', 0, NULL, NULL, '2026-04-04 07:54:04', '2026-04-04 07:54:04'),
(146, 15, 6, 2025, 'June', '2026-08-08', '2026-08-08', '2026-08-10', '2026-08-20', 0, NULL, NULL, '2026-04-04 07:54:04', '2026-04-04 07:54:04'),
(147, 15, 7, 2025, 'June', '2026-06-07', '2026-06-07', '2026-06-09', '2026-06-11', 0, NULL, NULL, '2026-04-04 07:54:04', '2026-04-04 07:54:04'),
(148, 15, 8, 2025, 'June', '2025-12-04', '2025-11-26', '2025-12-05', '2025-12-06', 0, NULL, NULL, '2026-04-04 07:54:04', '2026-04-04 07:54:04'),
(149, 15, 9, 2025, 'June', '2026-06-14', '2026-06-14', '2026-06-22', '2026-06-28', 0, NULL, NULL, '2026-04-04 07:54:04', '2026-04-04 07:54:04'),
(150, 15, 10, 2025, 'June', '2026-02-28', '2026-02-28', '2026-03-08', '2026-03-16', 0, NULL, NULL, '2026-04-04 07:54:04', '2026-04-04 07:54:04'),
(151, 16, 1, 2025, 'June', '2026-01-12', '2026-01-12', '2026-01-18', '2026-01-22', 0, NULL, NULL, '2026-04-04 07:54:04', '2026-04-04 07:54:04'),
(152, 16, 2, 2025, 'June', '2025-12-11', '2025-12-11', '2025-12-15', '2025-12-25', 0, NULL, NULL, '2026-04-04 07:54:04', '2026-04-04 07:54:04'),
(153, 16, 3, 2025, 'June', '2026-02-19', '2026-03-03', '2026-03-05', '2026-03-15', 0, NULL, NULL, '2026-04-04 07:54:04', '2026-04-04 07:54:04'),
(154, 16, 4, 2025, 'June', '2025-11-19', '2025-11-16', '2025-11-20', '2025-11-28', 0, NULL, NULL, '2026-04-04 07:54:04', '2026-04-04 07:54:04'),
(155, 16, 5, 2025, 'June', '2025-11-16', '2025-11-16', '2025-11-21', '2025-11-22', 0, NULL, NULL, '2026-04-04 07:54:04', '2026-04-04 07:54:04'),
(156, 16, 6, 2025, 'June', '2025-12-04', '2025-12-08', '2025-12-12', '2025-12-14', 0, NULL, NULL, '2026-04-04 07:54:04', '2026-04-04 07:54:04'),
(157, 16, 7, 2025, 'June', '2026-01-11', '2025-12-28', '2026-01-02', '2026-01-09', 0, NULL, NULL, '2026-04-04 07:54:04', '2026-04-04 07:54:04'),
(158, 16, 8, 2025, 'June', '2026-08-14', '2026-08-01', '2026-08-05', '2026-08-11', 0, NULL, NULL, '2026-04-04 07:54:04', '2026-04-04 07:54:04'),
(159, 16, 9, 2025, 'June', '2026-03-13', '2026-03-22', '2026-03-31', '2026-04-07', 0, NULL, NULL, '2026-04-04 07:54:04', '2026-04-04 07:54:04'),
(160, 16, 10, 2025, 'June', '2026-07-12', NULL, NULL, NULL, 0, NULL, NULL, '2026-04-04 07:54:04', '2026-04-04 07:54:04'),
(161, 17, 1, 2025, 'June', '2026-03-16', '2026-03-16', '2026-03-24', '2026-04-01', 0, NULL, NULL, '2026-04-04 07:54:04', '2026-04-04 07:54:04'),
(162, 17, 2, 2025, 'June', '2025-11-06', '2025-11-06', '2025-11-12', '2025-11-16', 0, NULL, NULL, '2026-04-04 07:54:04', '2026-04-04 07:54:04'),
(163, 17, 3, 2025, 'June', '2025-12-02', '2025-12-12', '2025-12-12', '2025-12-20', 0, NULL, NULL, '2026-04-04 07:54:04', '2026-04-04 07:54:04'),
(164, 17, 4, 2025, 'June', '2026-01-21', '2026-01-21', '2026-01-25', '2026-01-25', 0, NULL, NULL, '2026-04-04 07:54:04', '2026-04-04 07:54:04'),
(165, 17, 5, 2025, 'June', '2026-04-06', '2026-04-02', '2026-04-07', '2026-04-16', 0, NULL, NULL, '2026-04-04 07:54:04', '2026-04-04 07:54:04'),
(166, 17, 6, 2025, 'June', '2026-06-01', '2026-05-23', '2026-05-29', '2026-05-29', 0, NULL, NULL, '2026-04-04 07:54:04', '2026-04-04 07:54:04'),
(167, 17, 7, 2025, 'June', '2026-07-16', '2026-07-04', '2026-07-07', '2026-07-12', 0, NULL, NULL, '2026-04-04 07:54:04', '2026-04-04 07:54:04'),
(168, 17, 8, 2025, 'June', '2026-03-13', '2026-03-13', '2026-03-17', '2026-03-21', 0, NULL, NULL, '2026-04-04 07:54:04', '2026-04-04 07:54:04'),
(169, 17, 9, 2025, 'June', '2026-07-18', NULL, NULL, NULL, 0, NULL, NULL, '2026-04-04 07:54:04', '2026-04-04 07:54:04'),
(170, 17, 10, 2025, 'June', '2026-03-26', '2026-03-26', '2026-03-27', '2026-04-05', 0, NULL, NULL, '2026-04-04 07:54:04', '2026-04-04 07:54:04'),
(171, 18, 1, 2025, 'June', '2026-06-21', NULL, NULL, NULL, 0, NULL, NULL, '2026-04-04 07:54:04', '2026-04-04 07:54:04'),
(172, 18, 2, 2025, 'June', '2026-02-27', '2026-02-27', '2026-03-08', '2026-03-15', 0, NULL, NULL, '2026-04-04 07:54:04', '2026-04-04 07:54:04'),
(173, 18, 3, 2025, 'June', '2026-05-18', '2026-05-15', '2026-05-19', '2026-05-27', 0, NULL, NULL, '2026-04-04 07:54:04', '2026-04-04 07:54:04'),
(174, 18, 4, 2025, 'June', '2025-12-12', '2025-12-24', '2025-12-26', '2026-01-05', 0, NULL, NULL, '2026-04-04 07:54:04', '2026-04-04 07:54:04'),
(175, 18, 5, 2025, 'June', '2026-08-24', NULL, NULL, NULL, 0, NULL, NULL, '2026-04-04 07:54:04', '2026-04-04 07:54:04'),
(176, 18, 6, 2025, 'June', '2025-11-15', '2025-11-15', '2025-11-17', '2025-11-25', 0, NULL, NULL, '2026-04-04 07:54:04', '2026-04-04 07:54:04'),
(177, 18, 7, 2025, 'June', '2026-03-19', NULL, NULL, NULL, 0, NULL, NULL, '2026-04-04 07:54:04', '2026-04-04 07:54:04'),
(178, 18, 8, 2025, 'June', '2025-11-25', NULL, NULL, NULL, 0, NULL, NULL, '2026-04-04 07:54:04', '2026-04-04 07:54:04'),
(179, 18, 9, 2025, 'June', '2026-03-11', '2026-02-28', '2026-03-02', '2026-03-06', 0, NULL, NULL, '2026-04-04 07:54:04', '2026-04-04 07:54:04'),
(180, 18, 10, 2025, 'June', '2025-12-08', '2025-12-08', '2025-12-16', '2025-12-22', 0, NULL, NULL, '2026-04-04 07:54:04', '2026-04-04 07:54:04'),
(181, 19, 1, 2025, 'June', '2026-04-02', NULL, NULL, NULL, 0, NULL, NULL, '2026-04-04 07:54:04', '2026-04-04 07:54:04'),
(182, 19, 2, 2025, 'June', '2025-12-27', '2025-12-27', '2026-01-05', '2026-01-10', 0, NULL, NULL, '2026-04-04 07:54:04', '2026-04-04 07:54:04'),
(183, 19, 3, 2025, 'June', '2026-05-20', '2026-05-20', '2026-05-22', '2026-05-24', 0, NULL, NULL, '2026-04-04 07:54:04', '2026-04-04 07:54:04'),
(184, 19, 4, 2025, 'June', '2026-02-02', '2026-02-02', '2026-02-02', '2026-02-12', 0, NULL, NULL, '2026-04-04 07:54:04', '2026-04-04 07:54:04'),
(185, 19, 5, 2025, 'June', '2026-03-09', '2026-03-09', '2026-03-15', '2026-03-17', 0, NULL, NULL, '2026-04-04 07:54:04', '2026-04-04 07:54:04'),
(186, 19, 6, 2025, 'June', '2026-04-02', NULL, NULL, NULL, 0, NULL, NULL, '2026-04-04 07:54:04', '2026-04-04 07:54:04'),
(187, 19, 7, 2025, 'June', '2025-12-28', '2025-12-28', '2025-12-29', '2026-01-05', 0, NULL, NULL, '2026-04-04 07:54:04', '2026-04-04 07:54:04'),
(188, 19, 8, 2025, 'June', '2026-02-05', '2026-02-16', '2026-02-25', '2026-03-06', 0, NULL, NULL, '2026-04-04 07:54:04', '2026-04-04 07:54:04'),
(189, 19, 9, 2025, 'June', '2026-08-11', '2026-08-11', '2026-08-17', '2026-08-19', 0, NULL, NULL, '2026-04-04 07:54:04', '2026-04-04 07:54:04'),
(190, 19, 10, 2025, 'June', '2026-02-24', '2026-02-24', '2026-03-03', '2026-03-10', 0, NULL, NULL, '2026-04-04 07:54:04', '2026-04-04 07:54:04'),
(191, 20, 1, 2025, 'June', '2026-07-06', '2026-07-06', '2026-07-11', '2026-07-12', 0, NULL, NULL, '2026-04-04 07:54:04', '2026-04-04 07:54:04'),
(192, 20, 2, 2025, 'June', '2026-03-29', '2026-03-19', '2026-03-20', '2026-03-23', 0, NULL, NULL, '2026-04-04 07:54:04', '2026-04-04 07:54:04'),
(193, 20, 3, 2025, 'June', '2026-01-02', '2026-01-02', '2026-01-04', '2026-01-04', 0, NULL, NULL, '2026-04-04 07:54:04', '2026-04-04 07:54:04'),
(194, 20, 4, 2025, 'June', '2026-06-16', NULL, NULL, NULL, 0, NULL, NULL, '2026-04-04 07:54:04', '2026-04-04 07:54:04'),
(195, 20, 5, 2025, 'June', '2026-02-14', '2026-02-14', '2026-02-14', '2026-02-24', 0, NULL, NULL, '2026-04-04 07:54:04', '2026-04-04 07:54:04'),
(196, 20, 6, 2025, 'June', '2026-02-02', '2026-02-12', '2026-02-12', '2026-02-20', 0, NULL, NULL, '2026-04-04 07:54:04', '2026-04-04 07:54:04'),
(197, 20, 7, 2025, 'June', '2026-05-07', '2026-04-30', '2026-05-08', '2026-05-08', 0, NULL, NULL, '2026-04-04 07:54:04', '2026-04-04 07:54:04'),
(198, 20, 8, 2025, 'June', '2026-01-14', '2026-01-02', '2026-01-11', '2026-01-14', 0, NULL, NULL, '2026-04-04 07:54:04', '2026-04-04 07:54:04'),
(199, 20, 9, 2025, 'June', '2026-07-27', '2026-07-27', '2026-08-02', '2026-08-06', 0, NULL, NULL, '2026-04-04 07:54:04', '2026-04-04 07:54:04'),
(200, 20, 10, 2025, 'June', '2026-02-03', '2026-02-03', '2026-02-10', '2026-02-17', 0, NULL, NULL, '2026-04-04 07:54:04', '2026-04-04 07:54:04'),
(201, 21, 1, 2025, 'June', '2025-12-21', '2025-12-21', '2025-12-30', '2026-01-04', 0, NULL, NULL, '2026-04-04 07:54:04', '2026-04-04 07:54:04'),
(202, 21, 2, 2025, 'June', '2025-11-13', '2025-11-13', '2025-11-22', '2025-12-01', 0, NULL, NULL, '2026-04-04 07:54:04', '2026-04-04 07:54:04'),
(203, 21, 3, 2025, 'June', '2026-04-02', NULL, NULL, NULL, 0, NULL, NULL, '2026-04-04 07:54:04', '2026-04-04 07:54:04'),
(204, 21, 4, 2025, 'June', '2026-07-16', '2026-07-04', '2026-07-07', '2026-07-12', 0, NULL, NULL, '2026-04-04 07:54:04', '2026-04-04 07:54:04'),
(205, 21, 5, 2025, 'June', '2025-11-30', '2025-12-08', '2025-12-16', '2025-12-22', 0, NULL, NULL, '2026-04-04 07:54:04', '2026-04-04 07:54:04'),
(206, 21, 6, 2025, 'June', '2026-01-02', '2025-12-24', '2025-12-24', '2025-12-26', 0, NULL, NULL, '2026-04-04 07:54:04', '2026-04-04 07:54:04'),
(207, 21, 7, 2025, 'June', '2025-11-15', '2025-11-10', '2025-11-16', '2025-11-26', 0, NULL, NULL, '2026-04-04 07:54:04', '2026-04-04 07:54:04'),
(208, 21, 8, 2025, 'June', '2026-06-11', '2026-06-11', '2026-06-20', '2026-06-25', 0, NULL, NULL, '2026-04-04 07:54:04', '2026-04-04 07:54:04'),
(209, 21, 9, 2025, 'June', '2025-11-22', '2025-11-13', '2025-11-13', '2025-11-15', 0, NULL, NULL, '2026-04-04 07:54:04', '2026-04-04 07:54:04'),
(210, 21, 10, 2025, 'June', '2026-03-18', '2026-03-08', '2026-03-09', '2026-03-12', 0, NULL, NULL, '2026-04-04 07:54:04', '2026-04-04 07:54:04'),
(211, 22, 1, 2025, 'June', '2026-02-13', '2026-02-13', '2026-02-15', '2026-02-25', 0, NULL, NULL, '2026-04-04 07:54:04', '2026-04-04 07:54:04'),
(212, 22, 2, 2025, 'June', '2026-07-04', NULL, NULL, NULL, 0, NULL, NULL, '2026-04-04 07:54:04', '2026-04-04 07:54:04'),
(213, 22, 3, 2025, 'June', '2026-05-08', '2026-05-03', '2026-05-09', '2026-05-19', 0, NULL, NULL, '2026-04-04 07:54:04', '2026-04-04 07:54:04'),
(214, 22, 4, 2025, 'June', '2026-02-02', '2026-02-10', '2026-02-18', '2026-02-24', 0, NULL, NULL, '2026-04-04 07:54:04', '2026-04-04 07:54:04'),
(215, 22, 5, 2025, 'June', '2026-02-09', '2026-02-18', '2026-02-27', '2026-03-06', 0, NULL, NULL, '2026-04-04 07:54:04', '2026-04-04 07:54:04'),
(216, 22, 6, 2025, 'June', '2025-12-02', '2025-11-25', '2025-11-27', '2025-11-29', 0, NULL, NULL, '2026-04-04 07:54:04', '2026-04-04 07:54:04'),
(217, 22, 7, 2025, 'June', '2026-03-10', NULL, NULL, NULL, 0, NULL, NULL, '2026-04-04 07:54:04', '2026-04-04 07:54:04'),
(218, 22, 8, 2025, 'June', '2026-06-23', '2026-06-20', '2026-06-28', '2026-07-08', 0, NULL, NULL, '2026-04-04 07:54:04', '2026-04-04 07:54:04'),
(219, 22, 9, 2025, 'June', '2026-01-30', '2026-01-26', '2026-02-04', '2026-02-15', 0, NULL, NULL, '2026-04-04 07:54:04', '2026-04-04 07:54:04'),
(220, 22, 10, 2025, 'June', '2026-06-04', '2026-06-04', '2026-06-11', '2026-06-18', 0, NULL, NULL, '2026-04-04 07:54:04', '2026-04-04 07:54:04'),
(221, 23, 1, 2025, 'June', '2025-11-27', '2025-11-22', '2025-11-22', '2025-11-22', 0, NULL, NULL, '2026-04-04 07:54:04', '2026-04-04 07:54:04'),
(222, 23, 2, 2025, 'June', '2025-11-26', '2025-12-08', '2025-12-10', '2025-12-20', 0, NULL, NULL, '2026-04-04 07:54:04', '2026-04-04 07:54:04'),
(223, 23, 3, 2025, 'June', '2025-12-31', NULL, NULL, NULL, 0, NULL, NULL, '2026-04-04 07:54:04', '2026-04-04 07:54:04'),
(224, 23, 4, 2025, 'June', '2026-04-26', '2026-04-13', '2026-04-21', '2026-04-29', 0, NULL, NULL, '2026-04-04 07:54:04', '2026-04-04 07:54:04'),
(225, 23, 5, 2025, 'June', '2026-01-16', '2026-01-16', '2026-01-23', '2026-01-28', 0, NULL, NULL, '2026-04-04 07:54:04', '2026-04-04 07:54:04'),
(226, 23, 6, 2025, 'June', '2026-07-02', '2026-07-02', '2026-07-08', '2026-07-14', 0, NULL, NULL, '2026-04-04 07:54:04', '2026-04-04 07:54:04'),
(227, 23, 7, 2025, 'June', '2026-08-29', '2026-08-29', '2026-09-01', '2026-09-12', 0, NULL, NULL, '2026-04-04 07:54:04', '2026-04-04 07:54:04'),
(228, 23, 8, 2025, 'June', '2026-05-20', '2026-05-20', '2026-05-22', '2026-06-01', 0, NULL, NULL, '2026-04-04 07:54:04', '2026-04-04 07:54:04'),
(229, 23, 9, 2025, 'June', '2026-06-01', NULL, NULL, NULL, 0, NULL, NULL, '2026-04-04 07:54:04', '2026-04-04 07:54:04'),
(230, 23, 10, 2025, 'June', '2026-03-11', '2026-03-11', '2026-03-15', '2026-03-15', 0, NULL, NULL, '2026-04-04 07:54:04', '2026-04-04 07:54:04'),
(231, 24, 1, 2025, 'June', '2026-05-26', '2026-05-26', '2026-05-31', '2026-06-03', 0, NULL, NULL, '2026-04-04 07:54:04', '2026-04-04 07:54:04'),
(232, 24, 2, 2025, 'June', '2026-04-20', '2026-04-09', '2026-04-11', '2026-04-15', 0, NULL, NULL, '2026-04-04 07:54:04', '2026-04-04 07:54:04'),
(233, 24, 3, 2025, 'June', '2026-06-03', '2026-06-03', '2026-06-12', '2026-06-17', 0, NULL, NULL, '2026-04-04 07:54:04', '2026-04-04 07:54:04'),
(234, 24, 4, 2025, 'June', '2026-04-02', '2026-04-02', '2026-04-09', '2026-04-12', 0, NULL, NULL, '2026-04-04 07:54:04', '2026-04-04 07:54:04'),
(235, 24, 5, 2025, 'June', '2026-06-08', '2026-06-04', '2026-06-13', '2026-06-24', 0, NULL, NULL, '2026-04-04 07:54:04', '2026-04-04 07:54:04'),
(236, 24, 6, 2025, 'June', '2026-06-24', NULL, NULL, NULL, 0, NULL, NULL, '2026-04-04 07:54:04', '2026-04-04 07:54:04'),
(237, 24, 7, 2025, 'June', '2026-01-20', '2026-01-24', '2026-01-28', '2026-01-30', 0, NULL, NULL, '2026-04-04 07:54:04', '2026-04-04 07:54:04'),
(238, 24, 8, 2025, 'June', '2026-04-02', NULL, NULL, NULL, 0, NULL, NULL, '2026-04-04 07:54:04', '2026-04-04 07:54:04'),
(239, 24, 9, 2025, 'June', '2026-07-24', '2026-07-24', '2026-07-25', '2026-07-26', 0, NULL, NULL, '2026-04-04 07:54:04', '2026-04-04 07:54:04'),
(240, 24, 10, 2025, 'June', '2026-04-02', NULL, NULL, NULL, 0, NULL, NULL, '2026-04-04 07:54:04', '2026-04-04 07:54:04'),
(241, 25, 1, 2025, 'June', '2026-05-12', '2026-04-28', '2026-05-03', '2026-05-10', 0, NULL, NULL, '2026-04-04 07:54:04', '2026-04-04 07:54:04'),
(242, 25, 2, 2025, 'June', '2025-11-14', '2025-11-26', '2025-11-26', '2025-12-06', 0, NULL, NULL, '2026-04-04 07:54:04', '2026-04-04 07:54:04'),
(243, 25, 3, 2025, 'June', '2026-05-06', '2026-04-24', '2026-05-03', '2026-05-06', 0, NULL, NULL, '2026-04-04 07:54:04', '2026-04-04 07:54:04'),
(244, 25, 4, 2025, 'June', '2026-08-10', '2026-08-10', '2026-08-11', '2026-08-18', 0, NULL, NULL, '2026-04-04 07:54:04', '2026-04-04 07:54:04'),
(245, 25, 5, 2025, 'June', '2026-01-26', '2026-02-08', '2026-02-09', '2026-02-20', 0, NULL, NULL, '2026-04-04 07:54:04', '2026-04-04 07:54:04'),
(246, 25, 6, 2025, 'June', '2025-12-21', '2025-12-26', '2025-12-31', '2026-01-03', 0, NULL, NULL, '2026-04-04 07:54:04', '2026-04-04 07:54:04'),
(247, 25, 7, 2025, 'June', '2025-11-13', '2025-11-13', '2025-11-15', '2025-11-23', 0, NULL, NULL, '2026-04-04 07:54:04', '2026-04-04 07:54:04'),
(248, 25, 8, 2025, 'June', '2026-03-12', '2026-03-12', '2026-03-18', '2026-03-20', 0, NULL, NULL, '2026-04-04 07:54:04', '2026-04-04 07:54:04'),
(249, 25, 9, 2025, 'June', '2026-01-12', '2026-01-12', '2026-01-13', '2026-01-24', 0, NULL, NULL, '2026-04-04 07:54:04', '2026-04-04 07:54:04'),
(250, 25, 10, 2025, 'June', '2026-04-02', NULL, NULL, NULL, 0, NULL, NULL, '2026-04-04 07:54:04', '2026-04-04 07:54:04'),
(251, 26, 1, 2025, 'June', '2025-11-05', '2025-11-05', '2025-11-06', '2025-11-13', 0, NULL, NULL, '2026-04-04 07:54:04', '2026-04-04 07:54:04'),
(252, 26, 2, 2025, 'June', '2026-03-13', '2026-03-22', '2026-03-31', '2026-04-07', 0, NULL, NULL, '2026-04-04 07:54:04', '2026-04-04 07:54:04'),
(253, 26, 3, 2025, 'June', '2026-07-13', '2026-06-30', '2026-06-30', '2026-07-04', 0, NULL, NULL, '2026-04-04 07:54:04', '2026-04-04 07:54:04'),
(254, 26, 4, 2025, 'June', '2025-12-17', '2025-12-30', '2025-12-31', '2026-01-11', 0, NULL, NULL, '2026-04-04 07:54:04', '2026-04-04 07:54:04'),
(255, 26, 5, 2025, 'June', '2026-02-05', '2026-02-07', '2026-02-09', '2026-02-09', 0, NULL, NULL, '2026-04-04 07:54:04', '2026-04-04 07:54:04'),
(256, 26, 6, 2025, 'June', '2026-02-27', '2026-02-27', '2026-02-27', '2026-03-07', 0, NULL, NULL, '2026-04-04 07:54:04', '2026-04-04 07:54:04'),
(257, 26, 7, 2025, 'June', '2026-07-12', '2026-07-09', '2026-07-13', '2026-07-21', 0, NULL, NULL, '2026-04-04 07:54:04', '2026-04-04 07:54:04'),
(258, 26, 8, 2025, 'June', '2026-03-01', '2026-02-23', '2026-03-02', '2026-03-13', 0, NULL, NULL, '2026-04-04 07:54:04', '2026-04-04 07:54:04'),
(259, 26, 9, 2025, 'June', '2026-04-20', '2026-04-11', '2026-04-17', '2026-04-17', 0, NULL, NULL, '2026-04-04 07:54:04', '2026-04-04 07:54:04'),
(260, 26, 10, 2025, 'June', '2026-01-10', '2026-01-10', '2026-01-10', '2026-01-20', 0, NULL, NULL, '2026-04-04 07:54:04', '2026-04-04 07:54:04'),
(261, 27, 1, 2025, 'June', '2026-02-03', NULL, NULL, NULL, 0, NULL, NULL, '2026-04-04 07:54:04', '2026-04-04 07:54:04'),
(262, 27, 2, 2025, 'June', '2026-03-21', '2026-03-21', '2026-03-28', '2026-03-31', 0, NULL, NULL, '2026-04-04 07:54:04', '2026-04-04 07:54:04'),
(263, 27, 3, 2025, 'June', '2026-01-29', '2026-01-29', '2026-01-29', '2026-02-06', 0, NULL, NULL, '2026-04-04 07:54:04', '2026-04-04 07:54:04'),
(264, 27, 4, 2025, 'June', '2026-01-14', '2026-01-14', '2026-01-19', '2026-01-24', 0, NULL, NULL, '2026-04-04 07:54:04', '2026-04-04 07:54:04'),
(265, 27, 5, 2025, 'June', '2026-06-30', '2026-06-17', '2026-06-21', '2026-06-27', 0, NULL, NULL, '2026-04-04 07:54:04', '2026-04-04 07:54:04'),
(266, 27, 6, 2025, 'June', '2026-06-21', NULL, NULL, NULL, 0, NULL, NULL, '2026-04-04 07:54:04', '2026-04-04 07:54:04'),
(267, 27, 7, 2025, 'June', '2025-12-13', '2025-12-04', '2025-12-10', '2025-12-10', 0, NULL, NULL, '2026-04-04 07:54:04', '2026-04-04 07:54:04'),
(268, 27, 8, 2025, 'June', '2026-03-08', '2026-02-22', '2026-02-27', '2026-03-06', 0, NULL, NULL, '2026-04-04 07:54:04', '2026-04-04 07:54:04'),
(269, 27, 9, 2025, 'June', '2026-03-02', '2026-03-04', '2026-03-06', '2026-03-06', 0, NULL, NULL, '2026-04-04 07:54:04', '2026-04-04 07:54:04'),
(270, 27, 10, 2025, 'June', '2026-06-25', '2026-06-25', '2026-06-29', '2026-07-09', 0, NULL, NULL, '2026-04-04 07:54:04', '2026-04-04 07:54:04'),
(271, 28, 1, 2025, 'June', '2026-04-12', '2026-04-12', '2026-04-15', '2026-04-24', 0, NULL, NULL, '2026-04-04 07:54:04', '2026-04-04 07:54:04'),
(272, 28, 2, 2025, 'June', '2026-03-06', '2026-03-06', '2026-03-07', '2026-03-08', 0, NULL, NULL, '2026-04-04 07:54:04', '2026-04-04 07:54:04'),
(273, 28, 3, 2025, 'June', '2026-02-22', '2026-02-18', '2026-02-23', '2026-03-04', 0, NULL, NULL, '2026-04-04 07:54:04', '2026-04-04 07:54:04'),
(274, 28, 4, 2025, 'June', '2025-12-28', '2025-12-16', '2025-12-19', '2025-12-24', 0, NULL, NULL, '2026-04-04 07:54:04', '2026-04-04 07:54:04'),
(275, 28, 5, 2025, 'June', '2025-11-22', '2025-11-22', '2025-11-24', '2025-11-26', 0, NULL, NULL, '2026-04-04 07:54:04', '2026-04-04 07:54:04'),
(276, 28, 6, 2025, 'June', '2026-04-03', '2026-04-03', '2026-04-12', '2026-04-21', 0, NULL, NULL, '2026-04-04 07:54:04', '2026-04-04 07:54:04'),
(277, 28, 7, 2025, 'June', '2025-12-04', '2025-12-16', '2025-12-16', '2025-12-26', 0, NULL, NULL, '2026-04-04 07:54:04', '2026-04-04 07:54:04'),
(278, 28, 8, 2025, 'June', '2026-01-03', '2025-12-24', '2025-12-31', '2026-01-01', 0, NULL, NULL, '2026-04-04 07:54:04', '2026-04-04 07:54:04'),
(279, 28, 9, 2025, 'June', '2025-11-15', '2025-11-13', '2025-11-20', '2025-11-29', 0, NULL, NULL, '2026-04-04 07:54:04', '2026-04-04 07:54:04'),
(280, 28, 10, 2025, 'June', '2026-01-31', '2026-01-31', '2026-02-03', '2026-02-06', 0, NULL, NULL, '2026-04-04 07:54:04', '2026-04-04 07:54:04'),
(281, 29, 1, 2025, 'June', '2026-04-02', NULL, NULL, NULL, 0, NULL, NULL, '2026-04-04 07:54:04', '2026-04-04 07:54:04'),
(282, 29, 2, 2025, 'June', '2026-01-31', '2026-02-11', '2026-02-12', '2026-02-21', 0, NULL, NULL, '2026-04-04 07:54:04', '2026-04-04 07:54:04'),
(283, 29, 3, 2025, 'June', '2025-12-30', '2025-12-30', '2026-01-04', '2026-01-09', 0, NULL, NULL, '2026-04-04 07:54:04', '2026-04-04 07:54:04'),
(284, 29, 4, 2025, 'June', '2026-07-28', '2026-07-14', '2026-07-19', '2026-07-26', 0, NULL, NULL, '2026-04-04 07:54:04', '2026-04-04 07:54:04'),
(285, 29, 5, 2025, 'June', '2025-11-25', '2025-11-14', '2025-11-16', '2025-11-20', 0, NULL, NULL, '2026-04-04 07:54:04', '2026-04-04 07:54:04'),
(286, 29, 6, 2025, 'June', '2026-01-14', '2026-01-02', '2026-01-05', '2026-01-10', 0, NULL, NULL, '2026-04-04 07:54:04', '2026-04-04 07:54:04'),
(287, 29, 7, 2025, 'June', '2026-03-04', '2026-02-27', '2026-03-05', '2026-03-15', 0, NULL, NULL, '2026-04-04 07:54:04', '2026-04-04 07:54:04'),
(288, 29, 8, 2025, 'June', '2026-05-29', '2026-05-29', '2026-06-03', '2026-06-04', 0, NULL, NULL, '2026-04-04 07:54:04', '2026-04-04 07:54:04'),
(289, 29, 9, 2025, 'June', '2026-07-30', '2026-07-30', '2026-08-04', '2026-08-05', 0, NULL, NULL, '2026-04-04 07:54:04', '2026-04-04 07:54:04'),
(290, 29, 10, 2025, 'June', '2026-01-01', '2026-01-01', '2026-01-01', '2026-01-09', 0, NULL, NULL, '2026-04-04 07:54:04', '2026-04-04 07:54:04'),
(291, 30, 1, 2025, 'June', '2026-05-14', '2026-05-14', '2026-05-14', '2026-05-22', 0, NULL, NULL, '2026-04-04 07:54:04', '2026-04-04 07:54:04'),
(292, 30, 2, 2025, 'June', '2025-12-01', '2025-12-01', '2025-12-10', '2025-12-15', 0, NULL, NULL, '2026-04-04 07:54:04', '2026-04-04 07:54:04'),
(293, 30, 3, 2025, 'June', '2026-04-23', '2026-04-12', '2026-04-20', '2026-04-22', 0, NULL, NULL, '2026-04-04 07:54:04', '2026-04-04 07:54:04'),
(294, 30, 4, 2025, 'June', '2026-07-08', '2026-07-08', '2026-07-12', '2026-07-12', 0, NULL, NULL, '2026-04-04 07:54:04', '2026-04-04 07:54:04'),
(295, 30, 5, 2025, 'June', '2026-04-20', '2026-04-07', '2026-04-07', '2026-04-11', 0, NULL, NULL, '2026-04-04 07:54:04', '2026-04-04 07:54:04'),
(296, 30, 6, 2025, 'June', '2026-03-05', '2026-02-28', '2026-03-06', '2026-03-16', 0, NULL, NULL, '2026-04-04 07:54:04', '2026-04-04 07:54:04'),
(297, 30, 7, 2025, 'June', '2026-02-26', '2026-02-26', '2026-03-07', '2026-03-14', 0, NULL, NULL, '2026-04-04 07:54:04', '2026-04-04 07:54:04'),
(298, 30, 8, 2025, 'June', '2026-04-21', '2026-04-21', '2026-04-28', '2026-05-03', 0, NULL, NULL, '2026-04-04 07:54:04', '2026-04-04 07:54:04'),
(299, 30, 9, 2025, 'June', '2026-03-20', '2026-04-01', '2026-04-01', '2026-04-11', 0, NULL, NULL, '2026-04-04 07:54:04', '2026-04-04 07:54:04'),
(300, 30, 10, 2025, 'June', '2026-02-21', '2026-02-21', '2026-02-28', '2026-03-03', 0, NULL, NULL, '2026-04-04 07:54:04', '2026-04-04 07:54:04'),
(301, 31, 1, 2025, 'June', '2026-07-04', '2026-06-21', '2026-06-29', '2026-07-07', 0, NULL, NULL, '2026-04-04 07:54:04', '2026-04-04 07:54:04'),
(302, 31, 2, 2025, 'June', '2026-08-28', '2026-08-18', '2026-08-19', '2026-08-22', 0, NULL, NULL, '2026-04-04 07:54:04', '2026-04-04 07:54:04'),
(303, 31, 3, 2025, 'June', '2026-04-02', NULL, NULL, NULL, 0, NULL, NULL, '2026-04-04 07:54:04', '2026-04-04 07:54:04'),
(304, 31, 4, 2025, 'June', '2026-07-12', '2026-07-12', '2026-07-20', '2026-07-28', 0, NULL, NULL, '2026-04-04 07:54:04', '2026-04-04 07:54:04'),
(305, 31, 5, 2025, 'June', '2026-04-16', '2026-04-15', '2026-04-21', '2026-04-29', 0, NULL, NULL, '2026-04-04 07:54:04', '2026-04-04 07:54:04'),
(306, 31, 6, 2025, 'June', '2026-05-03', '2026-05-03', '2026-05-07', '2026-05-07', 0, NULL, NULL, '2026-04-04 07:54:04', '2026-04-04 07:54:04'),
(307, 31, 7, 2025, 'June', '2026-06-07', '2026-06-07', '2026-06-08', '2026-06-09', 0, NULL, NULL, '2026-04-04 07:54:04', '2026-04-04 07:54:04'),
(308, 31, 8, 2025, 'June', '2025-11-17', '2025-11-05', '2025-11-12', '2025-11-19', 0, NULL, NULL, '2026-04-04 07:54:04', '2026-04-04 07:54:04'),
(309, 31, 9, 2025, 'June', '2026-04-10', '2026-04-10', '2026-04-16', '2026-04-20', 0, NULL, NULL, '2026-04-04 07:54:04', '2026-04-04 07:54:04'),
(310, 31, 10, 2025, 'June', '2026-08-11', '2026-07-31', '2026-08-02', '2026-08-06', 0, NULL, NULL, '2026-04-04 07:54:04', '2026-04-04 07:54:04'),
(311, 32, 1, 2025, 'June', '2025-12-02', NULL, NULL, NULL, 0, NULL, NULL, '2026-04-04 07:54:04', '2026-04-04 07:54:04'),
(312, 32, 2, 2025, 'June', '2026-07-16', '2026-07-16', '2026-07-16', '2026-07-24', 0, NULL, NULL, '2026-04-04 07:54:04', '2026-04-04 07:54:04'),
(313, 32, 3, 2025, 'June', '2026-02-23', '2026-03-06', '2026-03-07', '2026-03-16', 0, NULL, NULL, '2026-04-04 07:54:04', '2026-04-04 07:54:04'),
(314, 32, 4, 2025, 'June', '2025-12-22', '2026-01-01', '2026-01-01', '2026-01-09', 0, NULL, NULL, '2026-04-04 07:54:04', '2026-04-04 07:54:04'),
(315, 32, 5, 2025, 'June', '2025-12-06', '2025-12-02', '2025-12-07', '2025-12-16', 0, NULL, NULL, '2026-04-04 07:54:04', '2026-04-04 07:54:04'),
(316, 32, 6, 2025, 'June', '2026-02-11', '2026-02-14', '2026-02-17', '2026-02-18', 0, NULL, NULL, '2026-04-04 07:54:04', '2026-04-04 07:54:04'),
(317, 32, 7, 2025, 'June', '2026-02-24', '2026-02-24', '2026-02-25', '2026-02-26', 0, NULL, NULL, '2026-04-04 07:54:04', '2026-04-04 07:54:04'),
(318, 32, 8, 2025, 'June', '2026-07-28', '2026-07-19', '2026-07-23', '2026-07-27', 0, NULL, NULL, '2026-04-04 07:54:04', '2026-04-04 07:54:04'),
(319, 32, 9, 2025, 'June', '2026-01-21', '2026-01-21', '2026-01-30', '2026-02-08', 0, NULL, NULL, '2026-04-04 07:54:04', '2026-04-04 07:54:04'),
(320, 32, 10, 2025, 'June', '2026-04-02', NULL, NULL, NULL, 0, NULL, NULL, '2026-04-04 07:54:04', '2026-04-04 07:54:04'),
(321, 33, 1, 2025, 'June', '2026-02-26', '2026-02-26', '2026-02-28', '2026-03-02', 0, NULL, NULL, '2026-04-04 07:54:04', '2026-04-04 07:54:04'),
(322, 33, 2, 2025, 'June', '2026-01-08', NULL, NULL, NULL, 0, NULL, NULL, '2026-04-04 07:54:04', '2026-04-04 07:54:04'),
(323, 33, 3, 2025, 'June', '2026-06-06', NULL, NULL, NULL, 0, NULL, NULL, '2026-04-04 07:54:04', '2026-04-04 07:54:04'),
(324, 33, 4, 2025, 'June', '2026-03-29', '2026-03-29', '2026-04-02', '2026-04-04', 0, NULL, NULL, '2026-04-04 07:54:04', '2026-04-04 07:54:04'),
(325, 33, 5, 2025, 'June', '2025-11-02', '2025-11-02', '2025-11-05', '2025-11-08', 0, NULL, NULL, '2026-04-04 07:54:04', '2026-04-04 07:54:04'),
(326, 33, 6, 2025, 'June', '2025-11-11', NULL, NULL, NULL, 0, NULL, NULL, '2026-04-04 07:54:04', '2026-04-04 07:54:04'),
(327, 33, 7, 2025, 'June', '2026-02-16', '2026-02-06', '2026-02-13', '2026-02-14', 0, NULL, NULL, '2026-04-04 07:54:04', '2026-04-04 07:54:04'),
(328, 33, 8, 2025, 'June', '2026-03-02', '2026-02-25', '2026-02-25', '2026-02-25', 0, NULL, NULL, '2026-04-04 07:54:04', '2026-04-04 07:54:04'),
(329, 33, 9, 2025, 'June', '2026-06-18', '2026-06-18', '2026-06-25', '2026-06-30', 0, NULL, NULL, '2026-04-04 07:54:04', '2026-04-04 07:54:04'),
(330, 33, 10, 2025, 'June', '2026-07-19', '2026-07-16', '2026-07-20', '2026-07-28', 0, NULL, NULL, '2026-04-04 07:54:04', '2026-04-04 07:54:04'),
(331, 34, 1, 2025, 'June', '2026-04-02', NULL, NULL, NULL, 0, NULL, NULL, '2026-04-04 07:54:04', '2026-04-04 07:54:04'),
(332, 34, 2, 2025, 'June', '2026-05-25', NULL, NULL, NULL, 0, NULL, NULL, '2026-04-04 07:54:04', '2026-04-04 07:54:04'),
(333, 34, 3, 2025, 'June', '2026-08-15', '2026-08-11', '2026-08-20', '2026-08-31', 0, NULL, NULL, '2026-04-04 07:54:04', '2026-04-04 07:54:04'),
(334, 34, 4, 2025, 'June', '2025-12-28', '2025-12-24', '2025-12-29', '2026-01-07', 0, NULL, NULL, '2026-04-04 07:54:04', '2026-04-04 07:54:04'),
(335, 34, 5, 2025, 'June', '2026-08-25', '2026-08-12', '2026-08-16', '2026-08-22', 0, NULL, NULL, '2026-04-04 07:54:04', '2026-04-04 07:54:04'),
(336, 34, 6, 2025, 'June', '2026-07-14', NULL, NULL, NULL, 0, NULL, NULL, '2026-04-04 07:54:04', '2026-04-04 07:54:04'),
(337, 34, 7, 2025, 'June', '2026-05-19', '2026-05-12', '2026-05-20', '2026-05-20', 0, NULL, NULL, '2026-04-04 07:54:04', '2026-04-04 07:54:04'),
(338, 34, 8, 2025, 'June', '2026-08-08', NULL, NULL, NULL, 0, NULL, NULL, '2026-04-04 07:54:04', '2026-04-04 07:54:04'),
(339, 34, 9, 2025, 'June', '2026-07-26', '2026-07-14', '2026-07-23', '2026-07-26', 0, NULL, NULL, '2026-04-04 07:54:04', '2026-04-04 07:54:04'),
(340, 34, 10, 2025, 'June', '2026-02-17', '2026-02-17', '2026-02-22', '2026-03-05', 0, NULL, NULL, '2026-04-04 07:54:04', '2026-04-04 07:54:04'),
(341, 35, 1, 2025, 'June', '2026-06-16', '2026-06-08', '2026-06-17', '2026-06-18', 0, NULL, NULL, '2026-04-04 07:54:04', '2026-04-04 07:54:04'),
(342, 35, 2, 2025, 'June', '2026-03-27', '2026-03-27', '2026-04-01', '2026-04-02', 0, NULL, NULL, '2026-04-04 07:54:04', '2026-04-04 07:54:04'),
(343, 35, 3, 2025, 'June', '2026-08-18', '2026-08-18', '2026-08-25', '2026-08-30', 0, NULL, NULL, '2026-04-04 07:54:04', '2026-04-04 07:54:04'),
(344, 35, 4, 2025, 'June', '2026-08-08', '2026-07-29', '2026-08-05', '2026-08-06', 0, NULL, NULL, '2026-04-04 07:54:05', '2026-04-04 07:54:05'),
(345, 35, 5, 2025, 'June', '2025-11-25', '2025-11-29', '2025-12-03', '2025-12-05', 0, NULL, NULL, '2026-04-04 07:54:05', '2026-04-04 07:54:05'),
(346, 35, 6, 2025, 'June', '2026-01-26', '2026-01-24', '2026-01-31', '2026-02-09', 0, NULL, NULL, '2026-04-04 07:54:05', '2026-04-04 07:54:05'),
(347, 35, 7, 2025, 'June', '2026-06-20', '2026-06-11', '2026-06-11', '2026-06-13', 0, NULL, NULL, '2026-04-04 07:54:05', '2026-04-04 07:54:05'),
(348, 35, 8, 2025, 'June', '2025-11-17', '2025-11-17', '2025-11-18', '2025-11-27', 0, NULL, NULL, '2026-04-04 07:54:05', '2026-04-04 07:54:05'),
(349, 35, 9, 2025, 'June', '2026-08-20', NULL, NULL, NULL, 0, NULL, NULL, '2026-04-04 07:54:05', '2026-04-04 07:54:05'),
(350, 35, 10, 2025, 'June', '2026-04-02', NULL, NULL, NULL, 0, NULL, NULL, '2026-04-04 07:54:05', '2026-04-04 07:54:05'),
(351, 36, 1, 2025, 'June', '2026-02-11', '2026-02-04', '2026-02-06', '2026-02-08', 0, NULL, NULL, '2026-04-04 07:54:05', '2026-04-04 07:54:05'),
(352, 36, 2, 2025, 'June', '2026-07-07', '2026-06-29', '2026-07-08', '2026-07-09', 0, NULL, NULL, '2026-04-04 07:54:05', '2026-04-04 07:54:05'),
(353, 36, 3, 2025, 'June', '2026-08-25', '2026-08-14', '2026-08-20', '2026-08-26', 0, NULL, NULL, '2026-04-04 07:54:05', '2026-04-04 07:54:05'),
(354, 36, 4, 2025, 'June', '2026-07-18', '2026-07-17', '2026-07-19', '2026-07-25', 0, NULL, NULL, '2026-04-04 07:54:05', '2026-04-04 07:54:05'),
(355, 36, 5, 2025, 'June', '2025-12-01', '2025-12-05', '2025-12-09', '2025-12-11', 0, NULL, NULL, '2026-04-04 07:54:05', '2026-04-04 07:54:05'),
(356, 36, 6, 2025, 'June', '2025-11-23', '2025-11-23', '2025-11-25', '2025-11-27', 0, NULL, NULL, '2026-04-04 07:54:05', '2026-04-04 07:54:05'),
(357, 36, 7, 2025, 'June', '2025-12-28', '2025-12-28', '2025-12-31', '2026-01-03', 0, NULL, NULL, '2026-04-04 07:54:05', '2026-04-04 07:54:05'),
(358, 36, 8, 2025, 'June', '2026-07-11', '2026-07-09', '2026-07-16', '2026-07-25', 0, NULL, NULL, '2026-04-04 07:54:05', '2026-04-04 07:54:05'),
(359, 36, 9, 2025, 'June', '2026-04-02', NULL, NULL, NULL, 0, NULL, NULL, '2026-04-04 07:54:05', '2026-04-04 07:54:05'),
(360, 36, 10, 2025, 'June', '2026-08-10', '2026-08-01', '2026-08-01', '2026-08-03', 0, NULL, NULL, '2026-04-04 07:54:05', '2026-04-04 07:54:05');
INSERT INTO `entity_reporting_matrix` (`id`, `entity_id`, `item_id`, `reporting_year`, `reporting_month`, `deadline_date`, `submission_date`, `reviewed_date`, `completed_date`, `is_deleted`, `created_by`, `updated_by`, `created_at`, `updated_at`) VALUES
(361, 37, 1, 2025, 'June', '2026-06-29', '2026-06-29', '2026-07-02', '2026-07-13', 0, NULL, NULL, '2026-04-04 07:54:05', '2026-04-04 07:54:05'),
(362, 37, 2, 2025, 'June', '2026-04-22', '2026-04-08', '2026-04-09', '2026-04-14', 0, NULL, NULL, '2026-04-04 07:54:05', '2026-04-04 07:54:05'),
(363, 37, 3, 2025, 'June', '2026-02-03', '2026-02-07', '2026-02-11', '2026-02-13', 0, NULL, NULL, '2026-04-04 07:54:05', '2026-04-04 07:54:05'),
(364, 37, 4, 2025, 'June', '2026-04-02', NULL, NULL, NULL, 0, NULL, NULL, '2026-04-04 07:54:05', '2026-04-04 07:54:05'),
(365, 37, 5, 2025, 'June', '2025-11-23', '2025-11-14', '2025-11-20', '2025-11-20', 0, NULL, NULL, '2026-04-04 07:54:05', '2026-04-04 07:54:05'),
(366, 37, 6, 2025, 'June', '2025-11-08', '2025-11-08', '2025-11-16', '2025-11-22', 0, NULL, NULL, '2026-04-04 07:54:05', '2026-04-04 07:54:05'),
(367, 37, 7, 2025, 'June', '2026-03-07', '2026-02-23', '2026-03-02', '2026-03-09', 0, NULL, NULL, '2026-04-04 07:54:05', '2026-04-04 07:54:05'),
(368, 37, 8, 2025, 'June', '2025-12-12', '2025-12-02', '2025-12-09', '2025-12-10', 0, NULL, NULL, '2026-04-04 07:54:05', '2026-04-04 07:54:05'),
(369, 37, 9, 2025, 'June', '2025-12-13', NULL, NULL, NULL, 0, NULL, NULL, '2026-04-04 07:54:05', '2026-04-04 07:54:05'),
(370, 37, 10, 2025, 'June', '2025-12-14', '2025-12-04', '2025-12-05', '2025-12-08', 0, NULL, NULL, '2026-04-04 07:54:05', '2026-04-04 07:54:05'),
(371, 38, 1, 2025, 'June', '2026-05-02', '2026-05-02', '2026-05-07', '2026-05-18', 0, NULL, NULL, '2026-04-04 07:54:05', '2026-04-04 07:54:05'),
(372, 38, 2, 2025, 'June', '2026-04-02', NULL, NULL, NULL, 0, NULL, NULL, '2026-04-04 07:54:05', '2026-04-04 07:54:05'),
(373, 38, 3, 2025, 'June', '2026-07-18', '2026-07-18', '2026-07-20', '2026-07-20', 0, NULL, NULL, '2026-04-04 07:54:05', '2026-04-04 07:54:05'),
(374, 38, 4, 2025, 'June', '2026-07-02', NULL, NULL, NULL, 0, NULL, NULL, '2026-04-04 07:54:05', '2026-04-04 07:54:05'),
(375, 38, 5, 2025, 'June', '2026-04-09', '2026-04-02', '2026-04-10', '2026-04-10', 0, NULL, NULL, '2026-04-04 07:54:05', '2026-04-04 07:54:05'),
(376, 38, 6, 2025, 'June', '2026-04-05', '2026-04-05', '2026-04-05', '2026-04-13', 0, NULL, NULL, '2026-04-04 07:54:05', '2026-04-04 07:54:05'),
(377, 38, 7, 2025, 'June', '2025-12-25', '2025-12-27', '2025-12-29', '2025-12-29', 0, NULL, NULL, '2026-04-04 07:54:05', '2026-04-04 07:54:05'),
(378, 38, 8, 2025, 'June', '2026-02-14', '2026-02-08', '2026-02-15', '2026-02-26', 0, NULL, NULL, '2026-04-04 07:54:05', '2026-04-04 07:54:05'),
(379, 38, 9, 2025, 'June', '2026-03-18', '2026-03-24', '2026-03-30', '2026-04-03', 0, NULL, NULL, '2026-04-04 07:54:05', '2026-04-04 07:54:05'),
(380, 38, 10, 2025, 'June', '2026-01-01', '2025-12-24', '2025-12-27', '2025-12-30', 0, NULL, NULL, '2026-04-04 07:54:05', '2026-04-04 07:54:05'),
(381, 39, 1, 2025, 'June', '2026-07-03', '2026-07-03', '2026-07-06', '2026-07-07', 0, NULL, NULL, '2026-04-04 07:54:05', '2026-04-04 07:54:05'),
(382, 39, 2, 2025, 'June', '2026-06-27', NULL, NULL, NULL, 0, NULL, NULL, '2026-04-04 07:54:05', '2026-04-04 07:54:05'),
(383, 39, 3, 2025, 'June', '2026-06-24', '2026-06-24', '2026-07-02', '2026-07-10', 0, NULL, NULL, '2026-04-04 07:54:05', '2026-04-04 07:54:05'),
(384, 39, 4, 2025, 'June', '2025-12-05', '2025-12-05', '2025-12-14', '2025-12-23', 0, NULL, NULL, '2026-04-04 07:54:05', '2026-04-04 07:54:05'),
(385, 39, 5, 2025, 'June', '2026-01-04', NULL, NULL, NULL, 0, NULL, NULL, '2026-04-04 07:54:05', '2026-04-04 07:54:05'),
(386, 39, 6, 2025, 'June', '2026-02-17', '2026-02-10', '2026-02-18', '2026-02-18', 0, NULL, NULL, '2026-04-04 07:54:05', '2026-04-04 07:54:05'),
(387, 39, 7, 2025, 'June', '2026-07-08', '2026-07-03', '2026-07-03', '2026-07-03', 0, NULL, NULL, '2026-04-04 07:54:05', '2026-04-04 07:54:05'),
(388, 39, 8, 2025, 'June', '2026-03-02', '2026-03-02', '2026-03-07', '2026-03-10', 0, NULL, NULL, '2026-04-04 07:54:05', '2026-04-04 07:54:05'),
(389, 39, 9, 2025, 'June', '2026-01-05', '2026-01-15', '2026-01-15', '2026-01-23', 0, NULL, NULL, '2026-04-04 07:54:05', '2026-04-04 07:54:05'),
(390, 39, 10, 2025, 'June', '2026-07-02', '2026-07-02', '2026-07-04', '2026-07-04', 0, NULL, NULL, '2026-04-04 07:54:05', '2026-04-04 07:54:05'),
(391, 40, 1, 2025, 'June', '2025-12-03', '2025-11-30', '2025-12-04', '2025-12-12', 0, NULL, NULL, '2026-04-04 07:54:05', '2026-04-04 07:54:05'),
(392, 40, 2, 2025, 'June', '2026-04-28', '2026-04-27', '2026-04-29', '2026-05-05', 0, NULL, NULL, '2026-04-04 07:54:05', '2026-04-04 07:54:05'),
(393, 40, 3, 2025, 'June', '2025-11-18', '2025-11-18', '2025-11-22', '2025-12-02', 0, NULL, NULL, '2026-04-04 07:54:05', '2026-04-04 07:54:05'),
(394, 40, 4, 2025, 'June', '2026-02-15', '2026-02-21', '2026-02-27', '2026-03-03', 0, NULL, NULL, '2026-04-04 07:54:05', '2026-04-04 07:54:05'),
(395, 40, 5, 2025, 'June', '2026-01-29', '2026-01-29', '2026-02-03', '2026-02-08', 0, NULL, NULL, '2026-04-04 07:54:05', '2026-04-04 07:54:05'),
(396, 40, 6, 2025, 'June', '2026-05-10', NULL, NULL, NULL, 0, NULL, NULL, '2026-04-04 07:54:05', '2026-04-04 07:54:05'),
(397, 40, 7, 2025, 'June', '2026-08-20', '2026-08-20', '2026-08-27', '2026-09-03', 0, NULL, NULL, '2026-04-04 07:54:05', '2026-04-04 07:54:05'),
(398, 40, 8, 2025, 'June', '2026-05-07', '2026-05-04', '2026-05-12', '2026-05-22', 0, NULL, NULL, '2026-04-04 07:54:05', '2026-04-04 07:54:05'),
(399, 40, 9, 2025, 'June', '2026-03-19', '2026-03-14', '2026-03-20', '2026-03-30', 0, NULL, NULL, '2026-04-04 07:54:05', '2026-04-04 07:54:05'),
(400, 40, 10, 2025, 'June', '2025-12-14', '2025-12-25', '2025-12-26', '2026-01-04', 0, NULL, NULL, '2026-04-04 07:54:05', '2026-04-04 07:54:05'),
(401, 41, 1, 2025, 'June', '2026-03-01', '2026-03-01', '2026-03-01', '2026-03-09', 0, NULL, NULL, '2026-04-04 07:54:05', '2026-04-04 07:54:05'),
(402, 41, 2, 2025, 'June', '2026-03-30', '2026-03-16', '2026-03-21', '2026-03-28', 0, NULL, NULL, '2026-04-04 07:54:05', '2026-04-04 07:54:05'),
(403, 41, 3, 2025, 'June', '2026-05-10', '2026-05-10', '2026-05-16', '2026-05-20', 0, NULL, NULL, '2026-04-04 07:54:05', '2026-04-04 07:54:05'),
(404, 41, 4, 2025, 'June', '2026-01-19', '2026-01-19', '2026-01-21', '2026-01-29', 0, NULL, NULL, '2026-04-04 07:54:05', '2026-04-04 07:54:05'),
(405, 41, 5, 2025, 'June', '2026-06-13', '2026-06-13', '2026-06-18', '2026-06-23', 0, NULL, NULL, '2026-04-04 07:54:05', '2026-04-04 07:54:05'),
(406, 41, 6, 2025, 'June', '2026-01-28', '2026-01-28', '2026-02-03', '2026-02-07', 0, NULL, NULL, '2026-04-04 07:54:05', '2026-04-04 07:54:05'),
(407, 41, 7, 2025, 'June', '2026-04-02', NULL, NULL, NULL, 0, NULL, NULL, '2026-04-04 07:54:05', '2026-04-04 07:54:05'),
(408, 41, 8, 2025, 'June', '2025-11-24', '2025-11-11', '2025-11-11', '2025-11-15', 0, NULL, NULL, '2026-04-04 07:54:05', '2026-04-04 07:54:05'),
(409, 41, 9, 2025, 'June', '2026-01-03', '2026-01-03', '2026-01-09', '2026-01-13', 0, NULL, NULL, '2026-04-04 07:54:05', '2026-04-04 07:54:05'),
(410, 41, 10, 2025, 'June', '2025-12-31', NULL, NULL, NULL, 0, NULL, NULL, '2026-04-04 07:54:05', '2026-04-04 07:54:05'),
(411, 42, 1, 2025, 'June', '2026-04-18', '2026-04-12', '2026-04-13', '2026-04-14', 0, NULL, NULL, '2026-04-04 07:54:05', '2026-04-04 07:54:05'),
(412, 42, 2, 2025, 'June', '2025-11-19', '2025-11-06', '2025-11-06', '2025-11-10', 0, NULL, NULL, '2026-04-04 07:54:05', '2026-04-04 07:54:05'),
(413, 42, 3, 2025, 'June', '2026-06-09', '2026-06-09', '2026-06-12', '2026-06-21', 0, NULL, NULL, '2026-04-04 07:54:05', '2026-04-04 07:54:05'),
(414, 42, 4, 2025, 'June', '2026-06-22', '2026-06-22', '2026-06-27', '2026-06-28', 0, NULL, NULL, '2026-04-04 07:54:05', '2026-04-04 07:54:05'),
(415, 42, 5, 2025, 'June', '2026-05-03', '2026-05-03', '2026-05-10', '2026-05-15', 0, NULL, NULL, '2026-04-04 07:54:05', '2026-04-04 07:54:05'),
(416, 42, 6, 2025, 'June', '2026-06-07', '2026-06-07', '2026-06-16', '2026-06-25', 0, NULL, NULL, '2026-04-04 07:54:05', '2026-04-04 07:54:05'),
(417, 42, 7, 2025, 'June', '2025-12-31', '2025-12-31', '2025-12-31', '2026-01-06', 0, NULL, NULL, '2026-04-04 07:54:05', '2026-04-04 07:54:05'),
(418, 42, 8, 2025, 'June', '2026-07-05', NULL, NULL, NULL, 0, NULL, NULL, '2026-04-04 07:54:05', '2026-04-04 07:54:05'),
(419, 42, 9, 2025, 'June', '2026-03-29', '2026-03-19', '2026-03-24', '2026-03-29', 0, NULL, NULL, '2026-04-04 07:54:05', '2026-04-04 07:54:05'),
(420, 42, 10, 2025, 'June', '2026-06-04', '2026-06-04', '2026-06-10', '2026-06-12', 0, NULL, NULL, '2026-04-04 07:54:05', '2026-04-04 07:54:05'),
(421, 43, 1, 2025, 'June', '2026-01-07', '2025-12-29', '2025-12-29', '2025-12-31', 0, NULL, NULL, '2026-04-04 07:54:05', '2026-04-04 07:54:05'),
(422, 43, 2, 2025, 'June', '2025-11-15', '2025-11-04', '2025-11-06', '2025-11-10', 0, NULL, NULL, '2026-04-04 07:54:05', '2026-04-04 07:54:05'),
(423, 43, 3, 2025, 'June', '2026-07-10', '2026-06-30', '2026-07-05', '2026-07-10', 0, NULL, NULL, '2026-04-04 07:54:05', '2026-04-04 07:54:05'),
(424, 43, 4, 2025, 'June', '2026-05-25', '2026-05-25', '2026-05-26', '2026-06-02', 0, NULL, NULL, '2026-04-04 07:54:05', '2026-04-04 07:54:05'),
(425, 43, 5, 2025, 'June', '2026-04-08', '2026-04-04', '2026-04-13', '2026-04-24', 0, NULL, NULL, '2026-04-04 07:54:05', '2026-04-04 07:54:05'),
(426, 43, 6, 2025, 'June', '2026-05-16', NULL, NULL, NULL, 0, NULL, NULL, '2026-04-04 07:54:05', '2026-04-04 07:54:05'),
(427, 43, 7, 2025, 'June', '2025-11-15', '2025-11-27', '2025-11-27', '2025-12-07', 0, NULL, NULL, '2026-04-04 07:54:05', '2026-04-04 07:54:05'),
(428, 43, 8, 2025, 'June', '2026-05-20', '2026-05-07', '2026-05-15', '2026-05-23', 0, NULL, NULL, '2026-04-04 07:54:05', '2026-04-04 07:54:05'),
(429, 43, 9, 2025, 'June', '2026-04-05', '2026-03-22', '2026-03-23', '2026-03-28', 0, NULL, NULL, '2026-04-04 07:54:05', '2026-04-04 07:54:05'),
(430, 43, 10, 2025, 'June', '2026-06-24', '2026-06-24', '2026-07-01', '2026-07-04', 0, NULL, NULL, '2026-04-04 07:54:05', '2026-04-04 07:54:05'),
(431, 44, 1, 2025, 'June', '2026-01-31', '2026-02-11', '2026-02-12', '2026-02-21', 0, NULL, NULL, '2026-04-04 07:54:05', '2026-04-04 07:54:05'),
(432, 44, 2, 2025, 'June', '2025-11-18', '2025-11-18', '2025-11-21', '2025-11-24', 0, NULL, NULL, '2026-04-04 07:54:05', '2026-04-04 07:54:05'),
(433, 44, 3, 2025, 'June', '2026-02-15', '2026-02-17', '2026-02-19', '2026-02-19', 0, NULL, NULL, '2026-04-04 07:54:05', '2026-04-04 07:54:05'),
(434, 44, 4, 2025, 'June', '2026-03-16', '2026-03-23', '2026-03-30', '2026-04-04', 0, NULL, NULL, '2026-04-04 07:54:05', '2026-04-04 07:54:05'),
(435, 44, 5, 2025, 'June', '2026-08-19', '2026-08-19', '2026-08-19', '2026-08-29', 0, NULL, NULL, '2026-04-04 07:54:05', '2026-04-04 07:54:05'),
(436, 44, 6, 2025, 'June', '2026-07-11', '2026-07-11', '2026-07-17', '2026-07-21', 0, NULL, NULL, '2026-04-04 07:54:05', '2026-04-04 07:54:05'),
(437, 44, 7, 2025, 'June', '2026-08-27', '2026-08-18', '2026-08-22', '2026-08-26', 0, NULL, NULL, '2026-04-04 07:54:05', '2026-04-04 07:54:05'),
(438, 44, 8, 2025, 'June', '2025-12-28', '2025-12-14', '2025-12-19', '2025-12-26', 0, NULL, NULL, '2026-04-04 07:54:05', '2026-04-04 07:54:05'),
(439, 44, 9, 2025, 'June', '2025-12-19', NULL, NULL, NULL, 0, NULL, NULL, '2026-04-04 07:54:05', '2026-04-04 07:54:05'),
(440, 44, 10, 2025, 'June', '2026-04-09', NULL, NULL, NULL, 0, NULL, NULL, '2026-04-04 07:54:05', '2026-04-04 07:54:05'),
(441, 45, 1, 2025, 'June', '2026-04-18', '2026-04-18', '2026-04-23', '2026-04-24', 0, NULL, NULL, '2026-04-04 07:54:05', '2026-04-04 07:54:05'),
(442, 45, 2, 2025, 'June', '2026-05-24', '2026-05-24', '2026-05-25', '2026-05-26', 0, NULL, NULL, '2026-04-04 07:54:05', '2026-04-04 07:54:05'),
(443, 45, 3, 2025, 'June', '2026-07-10', NULL, NULL, NULL, 0, NULL, NULL, '2026-04-04 07:54:05', '2026-04-04 07:54:05'),
(444, 45, 4, 2025, 'June', '2026-04-02', NULL, NULL, NULL, 0, NULL, NULL, '2026-04-04 07:54:05', '2026-04-04 07:54:05'),
(445, 45, 5, 2025, 'June', '2026-06-17', '2026-06-10', '2026-06-12', '2026-06-14', 0, NULL, NULL, '2026-04-04 07:54:05', '2026-04-04 07:54:05'),
(446, 45, 6, 2025, 'June', '2026-01-29', '2026-01-29', '2026-01-31', '2026-02-10', 0, NULL, NULL, '2026-04-04 07:54:05', '2026-04-04 07:54:05'),
(447, 45, 7, 2025, 'June', '2026-06-30', NULL, NULL, NULL, 0, NULL, NULL, '2026-04-04 07:54:05', '2026-04-04 07:54:05'),
(448, 45, 8, 2025, 'June', '2025-11-12', NULL, NULL, NULL, 0, NULL, NULL, '2026-04-04 07:54:05', '2026-04-04 07:54:05'),
(449, 45, 9, 2025, 'June', '2025-11-19', NULL, NULL, NULL, 0, NULL, NULL, '2026-04-04 07:54:05', '2026-04-04 07:54:05'),
(450, 45, 10, 2025, 'June', '2025-11-17', '2025-11-17', '2025-11-19', '2025-11-29', 0, NULL, NULL, '2026-04-04 07:54:05', '2026-04-04 07:54:05'),
(451, 46, 1, 2025, 'June', '2026-02-11', '2026-02-04', '2026-02-06', '2026-02-08', 0, NULL, NULL, '2026-04-04 07:54:05', '2026-04-04 07:54:05'),
(452, 46, 2, 2025, 'June', '2026-06-30', '2026-06-19', '2026-06-27', '2026-06-29', 0, NULL, NULL, '2026-04-04 07:54:05', '2026-04-04 07:54:05'),
(453, 46, 3, 2025, 'June', '2026-03-24', '2026-04-01', '2026-04-09', '2026-04-15', 0, NULL, NULL, '2026-04-04 07:54:05', '2026-04-04 07:54:05'),
(454, 46, 4, 2025, 'June', '2026-05-25', '2026-05-25', '2026-05-29', '2026-05-31', 0, NULL, NULL, '2026-04-04 07:54:05', '2026-04-04 07:54:05'),
(455, 46, 5, 2025, 'June', '2026-04-02', NULL, NULL, NULL, 0, NULL, NULL, '2026-04-04 07:54:05', '2026-04-04 07:54:05'),
(456, 46, 6, 2025, 'June', '2025-12-10', NULL, NULL, NULL, 0, NULL, NULL, '2026-04-04 07:54:05', '2026-04-04 07:54:05'),
(457, 46, 7, 2025, 'June', '2026-08-19', '2026-08-17', '2026-08-20', '2026-08-27', 0, NULL, NULL, '2026-04-04 07:54:05', '2026-04-04 07:54:05'),
(458, 46, 8, 2025, 'June', '2025-12-29', '2026-01-10', '2026-01-10', '2026-01-20', 0, NULL, NULL, '2026-04-04 07:54:05', '2026-04-04 07:54:05'),
(459, 46, 9, 2025, 'June', '2026-02-25', '2026-03-01', '2026-03-05', '2026-03-07', 0, NULL, NULL, '2026-04-04 07:54:05', '2026-04-04 07:54:05'),
(460, 46, 10, 2025, 'June', '2026-01-12', '2026-01-14', '2026-01-16', '2026-01-16', 0, NULL, NULL, '2026-04-04 07:54:05', '2026-04-04 07:54:05'),
(461, 47, 1, 2025, 'June', '2026-06-16', '2026-06-11', '2026-06-11', '2026-06-11', 0, NULL, NULL, '2026-04-04 07:54:05', '2026-04-04 07:54:05'),
(462, 47, 2, 2025, 'June', '2026-04-25', '2026-04-13', '2026-04-16', '2026-04-21', 0, NULL, NULL, '2026-04-04 07:54:05', '2026-04-04 07:54:05'),
(463, 47, 3, 2025, 'June', '2026-02-04', '2026-02-12', '2026-02-20', '2026-02-26', 0, NULL, NULL, '2026-04-04 07:54:05', '2026-04-04 07:54:05'),
(464, 47, 4, 2025, 'June', '2025-11-17', '2025-11-27', '2025-11-27', '2025-12-05', 0, NULL, NULL, '2026-04-04 07:54:05', '2026-04-04 07:54:05'),
(465, 47, 5, 2025, 'June', '2026-02-06', NULL, NULL, NULL, 0, NULL, NULL, '2026-04-04 07:54:05', '2026-04-04 07:54:05'),
(466, 47, 6, 2025, 'June', '2026-02-03', '2026-01-31', '2026-02-08', '2026-02-18', 0, NULL, NULL, '2026-04-04 07:54:05', '2026-04-04 07:54:05'),
(467, 47, 7, 2025, 'June', '2026-05-04', '2026-05-04', '2026-05-13', '2026-05-20', 0, NULL, NULL, '2026-04-04 07:54:05', '2026-04-04 07:54:05'),
(468, 47, 8, 2025, 'June', '2026-06-04', '2026-06-04', '2026-06-10', '2026-06-16', 0, NULL, NULL, '2026-04-04 07:54:05', '2026-04-04 07:54:05'),
(469, 47, 9, 2025, 'June', '2025-12-18', '2025-12-26', '2026-01-03', '2026-01-09', 0, NULL, NULL, '2026-04-04 07:54:05', '2026-04-04 07:54:05'),
(470, 47, 10, 2025, 'June', '2026-01-02', '2026-01-05', '2026-01-08', '2026-01-09', 0, NULL, NULL, '2026-04-04 07:54:05', '2026-04-04 07:54:05'),
(471, 48, 1, 2025, 'June', '2026-04-15', '2026-04-06', '2026-04-10', '2026-04-14', 0, NULL, NULL, '2026-04-04 07:54:05', '2026-04-04 07:54:05'),
(472, 48, 2, 2025, 'June', '2025-12-03', '2025-12-08', '2025-12-13', '2025-12-16', 0, NULL, NULL, '2026-04-04 07:54:05', '2026-04-04 07:54:05'),
(473, 48, 3, 2025, 'June', '2026-07-22', '2026-07-11', '2026-07-13', '2026-07-17', 0, NULL, NULL, '2026-04-04 07:54:05', '2026-04-04 07:54:05'),
(474, 48, 4, 2025, 'June', '2026-06-18', '2026-06-09', '2026-06-13', '2026-06-17', 0, NULL, NULL, '2026-04-04 07:54:05', '2026-04-04 07:54:05'),
(475, 48, 5, 2025, 'June', '2026-06-15', '2026-06-15', '2026-06-23', '2026-06-27', 0, NULL, NULL, '2026-04-04 07:54:05', '2026-04-04 07:54:05'),
(476, 48, 6, 2025, 'June', '2026-06-13', '2026-05-31', '2026-06-08', '2026-06-16', 0, NULL, NULL, '2026-04-04 07:54:05', '2026-04-04 07:54:05'),
(477, 48, 7, 2025, 'June', '2026-04-24', '2026-04-14', '2026-04-21', '2026-04-22', 0, NULL, NULL, '2026-04-04 07:54:05', '2026-04-04 07:54:05'),
(478, 48, 8, 2025, 'June', '2026-02-27', NULL, NULL, NULL, 0, NULL, NULL, '2026-04-04 07:54:05', '2026-04-04 07:54:05'),
(479, 48, 9, 2025, 'June', '2026-08-23', '2026-08-20', '2026-08-24', '2026-09-01', 0, NULL, NULL, '2026-04-04 07:54:05', '2026-04-04 07:54:05'),
(480, 48, 10, 2025, 'June', '2026-01-15', '2026-01-08', '2026-01-10', '2026-01-12', 0, NULL, NULL, '2026-04-04 07:54:05', '2026-04-04 07:54:05'),
(481, 49, 1, 2025, 'June', '2026-06-21', '2026-06-09', '2026-06-12', '2026-06-17', 0, NULL, NULL, '2026-04-04 07:54:05', '2026-04-04 07:54:05'),
(482, 49, 2, 2025, 'June', '2026-01-30', '2026-01-30', '2026-02-02', '2026-02-13', 0, NULL, NULL, '2026-04-04 07:54:05', '2026-04-04 07:54:05'),
(483, 49, 3, 2025, 'June', '2026-06-20', '2026-06-13', '2026-06-21', '2026-06-21', 0, NULL, NULL, '2026-04-04 07:54:05', '2026-04-04 07:54:05'),
(484, 49, 4, 2025, 'June', '2025-11-25', NULL, NULL, NULL, 0, NULL, NULL, '2026-04-04 07:54:05', '2026-04-04 07:54:05'),
(485, 49, 5, 2025, 'June', '2026-08-12', NULL, NULL, NULL, 0, NULL, NULL, '2026-04-04 07:54:05', '2026-04-04 07:54:05'),
(486, 49, 6, 2025, 'June', '2025-11-02', '2025-11-04', '2025-11-06', '2025-11-06', 0, NULL, NULL, '2026-04-04 07:54:05', '2026-04-04 07:54:05'),
(487, 49, 7, 2025, 'June', '2026-04-29', '2026-04-29', '2026-05-04', '2026-05-09', 0, NULL, NULL, '2026-04-04 07:54:05', '2026-04-04 07:54:05'),
(488, 49, 8, 2025, 'June', '2026-07-23', '2026-07-23', '2026-07-24', '2026-07-31', 0, NULL, NULL, '2026-04-04 07:54:05', '2026-04-04 07:54:05'),
(489, 49, 9, 2025, 'June', '2025-12-08', '2025-11-25', '2025-11-25', '2025-11-29', 0, NULL, NULL, '2026-04-04 07:54:05', '2026-04-04 07:54:05'),
(490, 49, 10, 2025, 'June', '2025-11-01', '2025-11-01', '2025-11-06', '2025-11-09', 0, NULL, NULL, '2026-04-04 07:54:05', '2026-04-04 07:54:05'),
(491, 50, 1, 2025, 'June', '2026-06-09', '2026-06-09', '2026-06-13', '2026-06-15', 0, NULL, NULL, '2026-04-04 07:54:05', '2026-04-04 07:54:05'),
(492, 50, 2, 2025, 'June', '2026-04-02', NULL, NULL, NULL, 0, NULL, NULL, '2026-04-04 07:54:05', '2026-04-04 07:54:05'),
(493, 50, 3, 2025, 'June', '2026-08-06', '2026-07-25', '2026-07-28', '2026-08-02', 0, NULL, NULL, '2026-04-04 07:54:05', '2026-04-04 07:54:05'),
(494, 50, 4, 2025, 'June', '2025-12-30', '2025-12-30', '2025-12-30', '2026-01-09', 0, NULL, NULL, '2026-04-04 07:54:05', '2026-04-04 07:54:05'),
(495, 50, 5, 2025, 'June', '2026-01-21', '2026-01-13', '2026-01-16', '2026-01-19', 0, NULL, NULL, '2026-04-04 07:54:05', '2026-04-04 07:54:05'),
(496, 50, 6, 2025, 'June', '2026-07-03', '2026-07-03', '2026-07-10', '2026-07-15', 0, NULL, NULL, '2026-04-04 07:54:05', '2026-04-04 07:54:05'),
(497, 50, 7, 2025, 'June', '2026-05-14', '2026-05-14', '2026-05-19', '2026-05-24', 0, NULL, NULL, '2026-04-04 07:54:05', '2026-04-04 07:54:05'),
(498, 50, 8, 2025, 'June', '2026-02-12', '2026-02-22', '2026-02-22', '2026-03-02', 0, NULL, NULL, '2026-04-04 07:54:05', '2026-04-04 07:54:05'),
(499, 50, 9, 2025, 'June', '2026-05-06', '2026-04-24', '2026-04-27', '2026-05-02', 0, NULL, NULL, '2026-04-04 07:54:05', '2026-04-04 07:54:05'),
(500, 50, 10, 2025, 'June', '2025-12-16', '2025-12-27', '2025-12-28', '2026-01-06', 0, NULL, NULL, '2026-04-04 07:54:05', '2026-04-04 07:54:05'),
(501, 1, 1, 2025, 'December', '2026-03-22', '2026-03-12', '2026-03-13', '2026-03-16', 0, NULL, NULL, '2026-04-04 07:54:05', '2026-04-04 07:54:05'),
(502, 1, 2, 2025, 'December', '2026-02-25', '2026-03-06', '2026-03-15', '2026-03-22', 0, NULL, NULL, '2026-04-04 07:54:05', '2026-04-04 07:54:05'),
(503, 1, 3, 2025, 'December', '2026-08-13', NULL, NULL, NULL, 0, NULL, NULL, '2026-04-04 07:54:05', '2026-04-04 07:54:05'),
(504, 1, 4, 2025, 'December', '2026-01-14', '2026-01-26', '2026-01-26', '2026-02-05', 0, NULL, NULL, '2026-04-04 07:54:05', '2026-04-04 07:54:05'),
(505, 1, 5, 2025, 'December', '2026-03-01', '2026-03-01', '2026-03-02', '2026-03-13', 0, NULL, NULL, '2026-04-04 07:54:05', '2026-04-04 07:54:05'),
(506, 1, 6, 2025, 'December', '2026-07-27', '2026-07-25', '2026-08-01', '2026-08-10', 0, NULL, NULL, '2026-04-04 07:54:05', '2026-04-04 07:54:05'),
(507, 1, 7, 2025, 'December', '2026-02-07', NULL, NULL, NULL, 0, NULL, NULL, '2026-04-04 07:54:05', '2026-04-04 07:54:05'),
(508, 1, 8, 2025, 'December', '2025-11-03', '2025-11-06', '2025-11-09', '2025-11-10', 0, NULL, NULL, '2026-04-04 07:54:05', '2026-04-04 07:54:05'),
(509, 1, 9, 2025, 'December', '2026-01-03', '2026-01-15', '2026-01-15', '2026-01-25', 0, NULL, NULL, '2026-04-04 07:54:05', '2026-04-04 07:54:05'),
(510, 1, 10, 2025, 'December', '2026-06-23', '2026-06-23', '2026-06-28', '2026-06-29', 0, NULL, NULL, '2026-04-04 07:54:05', '2026-04-04 07:54:05'),
(511, 2, 1, 2025, 'December', '2025-12-12', NULL, NULL, NULL, 0, NULL, NULL, '2026-04-04 07:54:05', '2026-04-04 07:54:05'),
(512, 2, 2, 2025, 'December', '2025-12-29', '2025-12-24', '2025-12-30', '2026-01-09', 0, NULL, NULL, '2026-04-04 07:54:05', '2026-04-04 07:54:05'),
(513, 2, 3, 2025, 'December', '2026-05-25', '2026-05-14', '2026-05-20', '2026-05-26', 0, NULL, NULL, '2026-04-04 07:54:05', '2026-04-04 07:54:05'),
(514, 2, 4, 2025, 'December', '2025-11-16', '2025-11-19', '2025-11-22', '2025-11-23', 0, NULL, NULL, '2026-04-04 07:54:05', '2026-04-04 07:54:05'),
(515, 2, 5, 2025, 'December', '2026-01-28', '2026-01-28', '2026-02-03', '2026-02-05', 0, NULL, NULL, '2026-04-04 07:54:05', '2026-04-04 07:54:05'),
(516, 2, 6, 2025, 'December', '2026-07-15', '2026-07-03', '2026-07-10', '2026-07-17', 0, NULL, NULL, '2026-04-04 07:54:05', '2026-04-04 07:54:05'),
(517, 2, 7, 2025, 'December', '2025-11-15', '2025-11-06', '2025-11-10', '2025-11-14', 0, NULL, NULL, '2026-04-04 07:54:05', '2026-04-04 07:54:05'),
(518, 2, 8, 2025, 'December', '2026-05-09', '2026-05-09', '2026-05-13', '2026-05-17', 0, NULL, NULL, '2026-04-04 07:54:05', '2026-04-04 07:54:05'),
(519, 2, 9, 2025, 'December', '2025-12-18', '2025-12-25', '2026-01-01', '2026-01-06', 0, NULL, NULL, '2026-04-04 07:54:05', '2026-04-04 07:54:05'),
(520, 2, 10, 2025, 'December', '2026-01-16', NULL, NULL, NULL, 0, NULL, NULL, '2026-04-04 07:54:05', '2026-04-04 07:54:05'),
(521, 3, 1, 2025, 'December', '2025-12-08', '2025-11-27', '2025-12-05', '2025-12-07', 0, NULL, NULL, '2026-04-04 07:54:05', '2026-04-04 07:54:05'),
(522, 3, 2, 2025, 'December', '2026-07-30', '2026-07-25', '2026-07-25', '2026-07-25', 0, NULL, NULL, '2026-04-04 07:54:05', '2026-04-04 07:54:05'),
(523, 3, 3, 2025, 'December', '2025-12-13', '2025-12-13', '2025-12-15', '2025-12-15', 0, NULL, NULL, '2026-04-04 07:54:05', '2026-04-04 07:54:05'),
(524, 3, 4, 2025, 'December', '2025-12-06', '2025-12-06', '2025-12-11', '2025-12-22', 0, NULL, NULL, '2026-04-04 07:54:05', '2026-04-04 07:54:05'),
(525, 3, 5, 2025, 'December', '2026-08-07', '2026-08-07', '2026-08-11', '2026-08-15', 0, NULL, NULL, '2026-04-04 07:54:05', '2026-04-04 07:54:05'),
(526, 3, 6, 2025, 'December', '2026-04-02', NULL, NULL, NULL, 0, NULL, NULL, '2026-04-04 07:54:05', '2026-04-04 07:54:05'),
(527, 3, 7, 2025, 'December', '2025-11-23', '2025-11-12', '2025-11-14', '2025-11-18', 0, NULL, NULL, '2026-04-04 07:54:05', '2026-04-04 07:54:05'),
(528, 3, 8, 2025, 'December', '2026-07-03', '2026-06-24', '2026-06-24', '2026-06-26', 0, NULL, NULL, '2026-04-04 07:54:05', '2026-04-04 07:54:05'),
(529, 3, 9, 2025, 'December', '2026-05-16', '2026-05-09', '2026-05-11', '2026-05-13', 0, NULL, NULL, '2026-04-04 07:54:05', '2026-04-04 07:54:05'),
(530, 3, 10, 2025, 'December', '2026-07-16', '2026-07-16', '2026-07-24', '2026-08-01', 0, NULL, NULL, '2026-04-04 07:54:05', '2026-04-04 07:54:05'),
(531, 4, 1, 2025, 'December', '2026-08-18', '2026-08-18', '2026-08-18', '2026-08-26', 0, NULL, NULL, '2026-04-04 07:54:05', '2026-04-04 07:54:05'),
(532, 4, 2, 2025, 'December', '2026-03-11', '2026-03-09', '2026-03-12', '2026-03-19', 0, NULL, NULL, '2026-04-04 07:54:05', '2026-04-04 07:54:05'),
(533, 4, 3, 2025, 'December', '2026-01-21', '2026-01-08', '2026-01-16', '2026-01-24', 0, NULL, NULL, '2026-04-04 07:54:05', '2026-04-04 07:54:05'),
(534, 4, 4, 2025, 'December', '2026-04-10', '2026-04-10', '2026-04-19', '2026-04-26', 0, NULL, NULL, '2026-04-04 07:54:05', '2026-04-04 07:54:05'),
(535, 4, 5, 2025, 'December', '2026-07-25', '2026-07-11', '2026-07-16', '2026-07-23', 0, NULL, NULL, '2026-04-04 07:54:05', '2026-04-04 07:54:05'),
(536, 4, 6, 2025, 'December', '2025-12-30', '2025-12-30', '2025-12-31', '2026-01-01', 0, NULL, NULL, '2026-04-04 07:54:05', '2026-04-04 07:54:05'),
(537, 4, 7, 2025, 'December', '2026-07-18', NULL, NULL, NULL, 0, NULL, NULL, '2026-04-04 07:54:05', '2026-04-04 07:54:05'),
(538, 4, 8, 2025, 'December', '2026-01-22', '2026-01-29', '2026-02-05', '2026-02-10', 0, NULL, NULL, '2026-04-04 07:54:05', '2026-04-04 07:54:05'),
(539, 4, 9, 2025, 'December', '2025-12-26', '2025-12-15', '2025-12-23', '2025-12-25', 0, NULL, NULL, '2026-04-04 07:54:05', '2026-04-04 07:54:05'),
(540, 4, 10, 2025, 'December', '2026-05-13', '2026-05-13', '2026-05-18', '2026-05-29', 0, NULL, NULL, '2026-04-04 07:54:05', '2026-04-04 07:54:05'),
(541, 5, 1, 2025, 'December', '2025-12-20', '2025-12-20', '2025-12-28', '2026-01-05', 0, NULL, NULL, '2026-04-04 07:54:05', '2026-04-04 07:54:05'),
(542, 5, 2, 2025, 'December', '2026-01-26', '2026-02-02', '2026-02-09', '2026-02-14', 0, NULL, NULL, '2026-04-04 07:54:05', '2026-04-04 07:54:05'),
(543, 5, 3, 2025, 'December', '2026-03-16', NULL, NULL, NULL, 0, NULL, NULL, '2026-04-04 07:54:05', '2026-04-04 07:54:05'),
(544, 5, 4, 2025, 'December', '2026-05-30', '2026-05-22', '2026-05-31', '2026-06-01', 0, NULL, NULL, '2026-04-04 07:54:05', '2026-04-04 07:54:05'),
(545, 5, 5, 2025, 'December', '2026-02-26', '2026-02-26', '2026-03-03', '2026-03-04', 0, NULL, NULL, '2026-04-04 07:54:05', '2026-04-04 07:54:05'),
(546, 5, 6, 2025, 'December', '2026-08-09', '2026-08-09', '2026-08-10', '2026-08-19', 0, NULL, NULL, '2026-04-04 07:54:05', '2026-04-04 07:54:05'),
(547, 5, 7, 2025, 'December', '2026-08-18', NULL, NULL, NULL, 0, NULL, NULL, '2026-04-04 07:54:05', '2026-04-04 07:54:05'),
(548, 5, 8, 2025, 'December', '2026-06-06', '2026-06-06', '2026-06-13', '2026-06-16', 0, NULL, NULL, '2026-04-04 07:54:05', '2026-04-04 07:54:05'),
(549, 5, 9, 2025, 'December', '2026-04-19', '2026-04-18', '2026-04-24', '2026-05-02', 0, NULL, NULL, '2026-04-04 07:54:05', '2026-04-04 07:54:05'),
(550, 5, 10, 2025, 'December', '2026-05-16', '2026-05-16', '2026-05-17', '2026-05-28', 0, NULL, NULL, '2026-04-04 07:54:05', '2026-04-04 07:54:05'),
(551, 6, 1, 2025, 'December', '2026-08-16', '2026-08-16', '2026-08-18', '2026-08-20', 0, NULL, NULL, '2026-04-04 07:54:05', '2026-04-04 07:54:05'),
(552, 6, 2, 2025, 'December', '2026-03-31', '2026-03-31', '2026-04-06', '2026-04-10', 0, NULL, NULL, '2026-04-04 07:54:05', '2026-04-04 07:54:05'),
(553, 6, 3, 2025, 'December', '2026-01-21', NULL, NULL, NULL, 0, NULL, NULL, '2026-04-04 07:54:05', '2026-04-04 07:54:05'),
(554, 6, 4, 2025, 'December', '2026-01-25', '2026-01-25', '2026-02-03', '2026-02-10', 0, NULL, NULL, '2026-04-04 07:54:05', '2026-04-04 07:54:05'),
(555, 6, 5, 2025, 'December', '2026-06-21', '2026-06-21', '2026-06-25', '2026-06-25', 0, NULL, NULL, '2026-04-04 07:54:05', '2026-04-04 07:54:05'),
(556, 6, 6, 2025, 'December', '2026-07-31', '2026-07-28', '2026-08-01', '2026-08-09', 0, NULL, NULL, '2026-04-04 07:54:05', '2026-04-04 07:54:05'),
(557, 6, 7, 2025, 'December', '2025-12-06', '2025-11-27', '2025-12-03', '2025-12-03', 0, NULL, NULL, '2026-04-04 07:54:05', '2026-04-04 07:54:05'),
(558, 6, 8, 2025, 'December', '2026-01-28', '2026-01-23', '2026-01-29', '2026-02-08', 0, NULL, NULL, '2026-04-04 07:54:05', '2026-04-04 07:54:05'),
(559, 6, 9, 2025, 'December', '2026-08-10', '2026-08-10', '2026-08-17', '2026-08-20', 0, NULL, NULL, '2026-04-04 07:54:05', '2026-04-04 07:54:05'),
(560, 6, 10, 2025, 'December', '2026-07-19', NULL, NULL, NULL, 0, NULL, NULL, '2026-04-04 07:54:05', '2026-04-04 07:54:05'),
(561, 7, 1, 2025, 'December', '2026-01-30', NULL, NULL, NULL, 0, NULL, NULL, '2026-04-04 07:54:05', '2026-04-04 07:54:05'),
(562, 7, 2, 2025, 'December', '2026-08-08', '2026-08-08', '2026-08-16', '2026-08-20', 0, NULL, NULL, '2026-04-04 07:54:05', '2026-04-04 07:54:05'),
(563, 7, 3, 2025, 'December', '2026-03-17', '2026-03-17', '2026-03-18', '2026-03-27', 0, NULL, NULL, '2026-04-04 07:54:05', '2026-04-04 07:54:05'),
(564, 7, 4, 2025, 'December', '2026-03-28', '2026-03-26', '2026-03-29', '2026-04-05', 0, NULL, NULL, '2026-04-04 07:54:05', '2026-04-04 07:54:05'),
(565, 7, 5, 2025, 'December', '2026-05-17', '2026-05-16', '2026-05-22', '2026-05-30', 0, NULL, NULL, '2026-04-04 07:54:05', '2026-04-04 07:54:05'),
(566, 7, 6, 2025, 'December', '2025-12-22', '2025-12-19', '2025-12-27', '2026-01-06', 0, NULL, NULL, '2026-04-04 07:54:05', '2026-04-04 07:54:05'),
(567, 7, 7, 2025, 'December', '2026-05-16', '2026-05-13', '2026-05-21', '2026-05-31', 0, NULL, NULL, '2026-04-04 07:54:05', '2026-04-04 07:54:05'),
(568, 7, 8, 2025, 'December', '2026-03-09', NULL, NULL, NULL, 0, NULL, NULL, '2026-04-04 07:54:05', '2026-04-04 07:54:05'),
(569, 7, 9, 2025, 'December', '2026-04-26', '2026-04-18', '2026-04-21', '2026-04-24', 0, NULL, NULL, '2026-04-04 07:54:05', '2026-04-04 07:54:05'),
(570, 7, 10, 2025, 'December', '2025-12-22', '2026-01-02', '2026-01-11', '2026-01-20', 0, NULL, NULL, '2026-04-04 07:54:05', '2026-04-04 07:54:05'),
(571, 8, 1, 2025, 'December', '2026-03-15', '2026-03-08', '2026-03-10', '2026-03-12', 0, NULL, NULL, '2026-04-04 07:54:05', '2026-04-04 07:54:05'),
(572, 8, 2, 2025, 'December', '2026-04-30', '2026-04-17', '2026-04-17', '2026-04-21', 0, NULL, NULL, '2026-04-04 07:54:05', '2026-04-04 07:54:05'),
(573, 8, 3, 2025, 'December', '2026-06-21', '2026-06-08', '2026-06-16', '2026-06-24', 0, NULL, NULL, '2026-04-04 07:54:05', '2026-04-04 07:54:05'),
(574, 8, 4, 2025, 'December', '2026-08-15', '2026-08-15', '2026-08-16', '2026-08-23', 0, NULL, NULL, '2026-04-04 07:54:05', '2026-04-04 07:54:05'),
(575, 8, 5, 2025, 'December', '2025-12-16', '2025-12-16', '2025-12-20', '2025-12-24', 0, NULL, NULL, '2026-04-04 07:54:05', '2026-04-04 07:54:05'),
(576, 8, 6, 2025, 'December', '2026-03-03', NULL, NULL, NULL, 0, NULL, NULL, '2026-04-04 07:54:05', '2026-04-04 07:54:05'),
(577, 8, 7, 2025, 'December', '2026-02-21', '2026-02-27', '2026-03-05', '2026-03-09', 0, NULL, NULL, '2026-04-04 07:54:05', '2026-04-04 07:54:05'),
(578, 8, 8, 2025, 'December', '2026-08-18', '2026-08-07', '2026-08-13', '2026-08-19', 0, NULL, NULL, '2026-04-04 07:54:05', '2026-04-04 07:54:05'),
(579, 8, 9, 2025, 'December', '2026-05-11', NULL, NULL, NULL, 0, NULL, NULL, '2026-04-04 07:54:05', '2026-04-04 07:54:05'),
(580, 8, 10, 2025, 'December', '2026-04-29', '2026-04-29', '2026-05-03', '2026-05-03', 0, NULL, NULL, '2026-04-04 07:54:05', '2026-04-04 07:54:05'),
(581, 9, 1, 2025, 'December', '2026-04-01', '2026-04-01', '2026-04-05', '2026-04-09', 0, NULL, NULL, '2026-04-04 07:54:05', '2026-04-04 07:54:05'),
(582, 9, 2, 2025, 'December', '2025-12-12', '2025-12-14', '2025-12-16', '2025-12-16', 0, NULL, NULL, '2026-04-04 07:54:05', '2026-04-04 07:54:05'),
(583, 9, 3, 2025, 'December', '2026-07-31', '2026-07-18', '2026-07-18', '2026-07-22', 0, NULL, NULL, '2026-04-04 07:54:05', '2026-04-04 07:54:05'),
(584, 9, 4, 2025, 'December', '2025-11-24', '2025-11-12', '2025-11-19', '2025-11-26', 0, NULL, NULL, '2026-04-04 07:54:05', '2026-04-04 07:54:05'),
(585, 9, 5, 2025, 'December', '2026-07-24', '2026-07-24', '2026-08-01', '2026-08-09', 0, NULL, NULL, '2026-04-04 07:54:05', '2026-04-04 07:54:05'),
(586, 9, 6, 2025, 'December', '2026-06-13', '2026-06-13', '2026-06-14', '2026-06-23', 0, NULL, NULL, '2026-04-04 07:54:05', '2026-04-04 07:54:05'),
(587, 9, 7, 2025, 'December', '2026-01-20', '2026-01-20', '2026-01-22', '2026-02-01', 0, NULL, NULL, '2026-04-04 07:54:05', '2026-04-04 07:54:05'),
(588, 9, 8, 2025, 'December', '2026-02-12', '2026-02-20', '2026-02-28', '2026-03-06', 0, NULL, NULL, '2026-04-04 07:54:05', '2026-04-04 07:54:05'),
(589, 9, 9, 2025, 'December', '2026-04-02', NULL, NULL, NULL, 0, NULL, NULL, '2026-04-04 07:54:05', '2026-04-04 07:54:05'),
(590, 9, 10, 2025, 'December', '2026-01-08', '2026-01-05', '2026-01-09', '2026-01-17', 0, NULL, NULL, '2026-04-04 07:54:05', '2026-04-04 07:54:05'),
(591, 10, 1, 2025, 'December', '2026-01-28', '2026-01-28', '2026-02-02', '2026-02-05', 0, NULL, NULL, '2026-04-04 07:54:05', '2026-04-04 07:54:05'),
(592, 10, 2, 2025, 'December', '2025-12-09', '2025-12-21', '2025-12-23', '2026-01-02', 0, NULL, NULL, '2026-04-04 07:54:05', '2026-04-04 07:54:05'),
(593, 10, 3, 2025, 'December', '2025-11-19', '2025-11-05', '2025-11-10', '2025-11-17', 0, NULL, NULL, '2026-04-04 07:54:05', '2026-04-04 07:54:05'),
(594, 10, 4, 2025, 'December', '2026-07-15', '2026-07-06', '2026-07-06', '2026-07-08', 0, NULL, NULL, '2026-04-04 07:54:05', '2026-04-04 07:54:05'),
(595, 10, 5, 2025, 'December', '2026-04-05', '2026-04-05', '2026-04-07', '2026-04-17', 0, NULL, NULL, '2026-04-04 07:54:05', '2026-04-04 07:54:05'),
(596, 10, 6, 2025, 'December', '2025-12-26', NULL, NULL, NULL, 0, NULL, NULL, '2026-04-04 07:54:05', '2026-04-04 07:54:05'),
(597, 10, 7, 2025, 'December', '2026-04-20', '2026-04-20', '2026-04-25', '2026-04-26', 0, NULL, NULL, '2026-04-04 07:54:05', '2026-04-04 07:54:05'),
(598, 10, 8, 2025, 'December', '2026-07-20', '2026-07-15', '2026-07-15', '2026-07-15', 0, NULL, NULL, '2026-04-04 07:54:05', '2026-04-04 07:54:05'),
(599, 10, 9, 2025, 'December', '2026-08-22', '2026-08-22', '2026-08-25', '2026-09-03', 0, NULL, NULL, '2026-04-04 07:54:05', '2026-04-04 07:54:05'),
(600, 10, 10, 2025, 'December', '2026-03-12', '2026-03-01', '2026-03-07', '2026-03-13', 0, NULL, NULL, '2026-04-04 07:54:05', '2026-04-04 07:54:05'),
(601, 11, 1, 2025, 'December', '2026-06-21', '2026-06-21', '2026-06-28', '2026-07-01', 0, NULL, NULL, '2026-04-04 07:54:05', '2026-04-04 07:54:05'),
(602, 11, 2, 2025, 'December', '2026-01-26', '2026-01-17', '2026-01-23', '2026-01-23', 0, NULL, NULL, '2026-04-04 07:54:05', '2026-04-04 07:54:05'),
(603, 11, 3, 2025, 'December', '2025-12-24', '2025-12-27', '2025-12-30', '2025-12-31', 0, NULL, NULL, '2026-04-04 07:54:05', '2026-04-04 07:54:05'),
(604, 11, 4, 2025, 'December', '2026-06-20', NULL, NULL, NULL, 0, NULL, NULL, '2026-04-04 07:54:05', '2026-04-04 07:54:05'),
(605, 11, 5, 2025, 'December', '2025-11-18', '2025-11-24', '2025-11-30', '2025-12-04', 0, NULL, NULL, '2026-04-04 07:54:05', '2026-04-04 07:54:05'),
(606, 11, 6, 2025, 'December', '2025-11-12', '2025-11-12', '2025-11-18', '2025-11-22', 0, NULL, NULL, '2026-04-04 07:54:05', '2026-04-04 07:54:05'),
(607, 11, 7, 2025, 'December', '2026-08-04', '2026-08-04', '2026-08-05', '2026-08-14', 0, NULL, NULL, '2026-04-04 07:54:05', '2026-04-04 07:54:05'),
(608, 11, 8, 2025, 'December', '2026-04-02', NULL, NULL, NULL, 0, NULL, NULL, '2026-04-04 07:54:05', '2026-04-04 07:54:05'),
(609, 11, 9, 2025, 'December', '2026-08-22', '2026-08-18', '2026-08-27', '2026-09-07', 0, NULL, NULL, '2026-04-04 07:54:05', '2026-04-04 07:54:05'),
(610, 11, 10, 2025, 'December', '2026-07-02', '2026-07-02', '2026-07-04', '2026-07-06', 0, NULL, NULL, '2026-04-04 07:54:05', '2026-04-04 07:54:05'),
(611, 12, 1, 2025, 'December', '2026-04-02', NULL, NULL, NULL, 0, NULL, NULL, '2026-04-04 07:54:05', '2026-04-04 07:54:05'),
(612, 12, 2, 2025, 'December', '2025-12-22', '2025-12-18', '2025-12-27', '2026-01-07', 0, NULL, NULL, '2026-04-04 07:54:05', '2026-04-04 07:54:05'),
(613, 12, 3, 2025, 'December', '2026-08-21', '2026-08-08', '2026-08-16', '2026-08-24', 0, NULL, NULL, '2026-04-04 07:54:05', '2026-04-04 07:54:05'),
(614, 12, 4, 2025, 'December', '2026-04-10', '2026-04-10', '2026-04-16', '2026-04-18', 0, NULL, NULL, '2026-04-04 07:54:05', '2026-04-04 07:54:05'),
(615, 12, 5, 2025, 'December', '2026-07-25', NULL, NULL, NULL, 0, NULL, NULL, '2026-04-04 07:54:05', '2026-04-04 07:54:05'),
(616, 12, 6, 2025, 'December', '2026-07-18', '2026-07-18', '2026-07-19', '2026-07-26', 0, NULL, NULL, '2026-04-04 07:54:05', '2026-04-04 07:54:05'),
(617, 12, 7, 2025, 'December', '2026-02-11', '2026-01-28', '2026-02-02', '2026-02-09', 0, NULL, NULL, '2026-04-04 07:54:05', '2026-04-04 07:54:05'),
(618, 12, 8, 2025, 'December', '2026-04-02', NULL, NULL, NULL, 0, NULL, NULL, '2026-04-04 07:54:05', '2026-04-04 07:54:05'),
(619, 12, 9, 2025, 'December', '2025-11-15', '2025-11-27', '2025-11-27', '2025-12-07', 0, NULL, NULL, '2026-04-04 07:54:05', '2026-04-04 07:54:05'),
(620, 12, 10, 2025, 'December', '2026-04-02', NULL, NULL, NULL, 0, NULL, NULL, '2026-04-04 07:54:05', '2026-04-04 07:54:05'),
(621, 13, 1, 2025, 'December', '2026-06-27', '2026-06-19', '2026-06-22', '2026-06-25', 0, NULL, NULL, '2026-04-04 07:54:05', '2026-04-04 07:54:05'),
(622, 13, 2, 2025, 'December', '2026-07-14', '2026-07-14', '2026-07-21', '2026-07-24', 0, NULL, NULL, '2026-04-04 07:54:05', '2026-04-04 07:54:05'),
(623, 13, 3, 2025, 'December', '2026-08-19', '2026-08-19', '2026-08-27', '2026-08-31', 0, NULL, NULL, '2026-04-04 07:54:05', '2026-04-04 07:54:05'),
(624, 13, 4, 2025, 'December', '2026-05-04', '2026-05-04', '2026-05-06', '2026-05-16', 0, NULL, NULL, '2026-04-04 07:54:05', '2026-04-04 07:54:05'),
(625, 13, 5, 2025, 'December', '2025-11-30', '2025-11-16', '2025-11-21', '2025-11-28', 0, NULL, NULL, '2026-04-04 07:54:05', '2026-04-04 07:54:05'),
(626, 13, 6, 2025, 'December', '2026-01-06', '2026-01-06', '2026-01-11', '2026-01-16', 0, NULL, NULL, '2026-04-04 07:54:05', '2026-04-04 07:54:05'),
(627, 13, 7, 2025, 'December', '2025-11-17', '2025-11-17', '2025-11-22', '2025-11-23', 0, NULL, NULL, '2026-04-04 07:54:05', '2026-04-04 07:54:05'),
(628, 13, 8, 2025, 'December', '2026-03-19', '2026-03-30', '2026-03-31', '2026-04-09', 0, NULL, NULL, '2026-04-04 07:54:05', '2026-04-04 07:54:05'),
(629, 13, 9, 2025, 'December', '2025-12-16', '2025-12-24', '2026-01-01', '2026-01-07', 0, NULL, NULL, '2026-04-04 07:54:05', '2026-04-04 07:54:05'),
(630, 13, 10, 2025, 'December', '2026-06-26', '2026-06-17', '2026-06-23', '2026-06-23', 0, NULL, NULL, '2026-04-04 07:54:05', '2026-04-04 07:54:05'),
(631, 14, 1, 2025, 'December', '2026-06-01', '2026-06-01', '2026-06-08', '2026-06-11', 0, NULL, NULL, '2026-04-04 07:54:05', '2026-04-04 07:54:05'),
(632, 14, 2, 2025, 'December', '2026-07-12', '2026-07-12', '2026-07-21', '2026-07-30', 0, NULL, NULL, '2026-04-04 07:54:05', '2026-04-04 07:54:05'),
(633, 14, 3, 2025, 'December', '2025-12-17', '2025-12-11', '2025-12-12', '2025-12-13', 0, NULL, NULL, '2026-04-04 07:54:05', '2026-04-04 07:54:05'),
(634, 14, 4, 2025, 'December', '2026-08-03', '2026-07-29', '2026-07-29', '2026-07-29', 0, NULL, NULL, '2026-04-04 07:54:05', '2026-04-04 07:54:05'),
(635, 14, 5, 2025, 'December', '2025-12-02', '2025-11-26', '2025-11-27', '2025-11-28', 0, NULL, NULL, '2026-04-04 07:54:05', '2026-04-04 07:54:05'),
(636, 14, 6, 2025, 'December', '2026-04-02', NULL, NULL, NULL, 0, NULL, NULL, '2026-04-04 07:54:05', '2026-04-04 07:54:05'),
(637, 14, 7, 2025, 'December', '2025-12-23', '2026-01-03', '2026-01-12', '2026-01-21', 0, NULL, NULL, '2026-04-04 07:54:05', '2026-04-04 07:54:05'),
(638, 14, 8, 2025, 'December', '2025-11-16', '2025-11-16', '2025-11-23', '2025-11-26', 0, NULL, NULL, '2026-04-04 07:54:05', '2026-04-04 07:54:05'),
(639, 14, 9, 2025, 'December', '2025-12-11', '2025-11-29', '2025-12-06', '2025-12-13', 0, NULL, NULL, '2026-04-04 07:54:05', '2026-04-04 07:54:05'),
(640, 14, 10, 2025, 'December', '2026-04-07', '2026-03-26', '2026-04-02', '2026-04-09', 0, NULL, NULL, '2026-04-04 07:54:05', '2026-04-04 07:54:05'),
(641, 15, 1, 2025, 'December', '2026-02-23', '2026-02-26', '2026-03-01', '2026-03-02', 0, NULL, NULL, '2026-04-04 07:54:05', '2026-04-04 07:54:05'),
(642, 15, 2, 2025, 'December', '2026-01-20', '2026-01-20', '2026-01-25', '2026-01-26', 0, NULL, NULL, '2026-04-04 07:54:05', '2026-04-04 07:54:05'),
(643, 15, 3, 2025, 'December', '2026-06-25', '2026-06-25', '2026-06-28', '2026-07-07', 0, NULL, NULL, '2026-04-04 07:54:05', '2026-04-04 07:54:05'),
(644, 15, 4, 2025, 'December', '2026-04-02', NULL, NULL, NULL, 0, NULL, NULL, '2026-04-04 07:54:05', '2026-04-04 07:54:05'),
(645, 15, 5, 2025, 'December', '2026-04-02', NULL, NULL, NULL, 0, NULL, NULL, '2026-04-04 07:54:05', '2026-04-04 07:54:05'),
(646, 15, 6, 2025, 'December', '2026-08-08', '2026-08-08', '2026-08-12', '2026-08-22', 0, NULL, NULL, '2026-04-04 07:54:05', '2026-04-04 07:54:05'),
(647, 15, 7, 2025, 'December', '2026-06-07', '2026-06-07', '2026-06-10', '2026-06-21', 0, NULL, NULL, '2026-04-04 07:54:05', '2026-04-04 07:54:05'),
(648, 15, 8, 2025, 'December', '2026-04-02', NULL, NULL, NULL, 0, NULL, NULL, '2026-04-04 07:54:05', '2026-04-04 07:54:05'),
(649, 15, 9, 2025, 'December', '2026-08-01', '2026-07-20', '2026-07-29', '2026-08-01', 0, NULL, NULL, '2026-04-04 07:54:05', '2026-04-04 07:54:05'),
(650, 15, 10, 2025, 'December', '2026-02-28', '2026-02-28', '2026-03-07', '2026-03-10', 0, NULL, NULL, '2026-04-04 07:54:05', '2026-04-04 07:54:05'),
(651, 16, 1, 2025, 'December', '2026-01-20', '2026-01-11', '2026-01-15', '2026-01-19', 0, NULL, NULL, '2026-04-04 07:54:05', '2026-04-04 07:54:05'),
(652, 16, 2, 2025, 'December', '2025-12-11', '2025-12-11', '2025-12-18', '2025-12-21', 0, NULL, NULL, '2026-04-04 07:54:05', '2026-04-04 07:54:05'),
(653, 16, 3, 2025, 'December', '2026-02-26', NULL, NULL, NULL, 0, NULL, NULL, '2026-04-04 07:54:05', '2026-04-04 07:54:05'),
(654, 16, 4, 2025, 'December', '2026-08-21', NULL, NULL, NULL, 0, NULL, NULL, '2026-04-04 07:54:05', '2026-04-04 07:54:05'),
(655, 16, 5, 2025, 'December', '2026-01-23', NULL, NULL, NULL, 0, NULL, NULL, '2026-04-04 07:54:05', '2026-04-04 07:54:05'),
(656, 16, 6, 2025, 'December', '2026-04-04', '2026-04-04', '2026-04-09', '2026-04-10', 0, NULL, NULL, '2026-04-04 07:54:05', '2026-04-04 07:54:05'),
(657, 16, 7, 2025, 'December', '2026-03-28', '2026-04-09', '2026-04-09', '2026-04-19', 0, NULL, NULL, '2026-04-04 07:54:05', '2026-04-04 07:54:05'),
(658, 16, 8, 2025, 'December', '2026-08-14', '2026-07-31', '2026-08-01', '2026-08-06', 0, NULL, NULL, '2026-04-04 07:54:05', '2026-04-04 07:54:05'),
(659, 16, 9, 2025, 'December', '2026-06-30', '2026-06-19', '2026-06-25', '2026-07-01', 0, NULL, NULL, '2026-04-04 07:54:05', '2026-04-04 07:54:05'),
(660, 16, 10, 2025, 'December', '2026-03-30', '2026-03-30', '2026-04-01', '2026-04-01', 0, NULL, NULL, '2026-04-04 07:54:05', '2026-04-04 07:54:05'),
(661, 17, 1, 2025, 'December', '2026-01-29', '2026-02-03', '2026-02-08', '2026-02-11', 0, NULL, NULL, '2026-04-04 07:54:05', '2026-04-04 07:54:05'),
(662, 17, 2, 2025, 'December', '2025-11-06', '2025-11-06', '2025-11-11', '2025-11-12', 0, NULL, NULL, '2026-04-04 07:54:05', '2026-04-04 07:54:05'),
(663, 17, 3, 2025, 'December', '2025-12-02', '2025-12-14', '2025-12-14', '2025-12-24', 0, NULL, NULL, '2026-04-04 07:54:05', '2026-04-04 07:54:05'),
(664, 17, 4, 2025, 'December', '2026-01-21', '2026-01-21', '2026-01-22', '2026-01-31', 0, NULL, NULL, '2026-04-04 07:54:05', '2026-04-04 07:54:05'),
(665, 17, 5, 2025, 'December', '2025-12-05', NULL, NULL, NULL, 0, NULL, NULL, '2026-04-04 07:54:05', '2026-04-04 07:54:05'),
(666, 17, 6, 2025, 'December', '2026-06-01', '2026-05-30', '2026-06-06', '2026-06-15', 0, NULL, NULL, '2026-04-04 07:54:05', '2026-04-04 07:54:05'),
(667, 17, 7, 2025, 'December', '2026-07-16', '2026-07-15', '2026-07-17', '2026-07-23', 0, NULL, NULL, '2026-04-04 07:54:05', '2026-04-04 07:54:05'),
(668, 17, 8, 2025, 'December', '2026-03-13', '2026-03-13', '2026-03-14', '2026-03-25', 0, NULL, NULL, '2026-04-04 07:54:05', '2026-04-04 07:54:05'),
(669, 17, 9, 2025, 'December', '2026-01-06', '2026-01-01', '2026-01-01', '2026-01-01', 0, NULL, NULL, '2026-04-04 07:54:05', '2026-04-04 07:54:05'),
(670, 17, 10, 2025, 'December', '2026-06-26', '2026-06-19', '2026-06-21', '2026-06-23', 0, NULL, NULL, '2026-04-04 07:54:05', '2026-04-04 07:54:05'),
(671, 18, 1, 2025, 'December', '2025-12-25', '2026-01-07', '2026-01-08', '2026-01-19', 0, NULL, NULL, '2026-04-04 07:54:05', '2026-04-04 07:54:05'),
(672, 18, 2, 2025, 'December', '2026-04-01', '2026-03-24', '2026-03-27', '2026-03-30', 0, NULL, NULL, '2026-04-04 07:54:05', '2026-04-04 07:54:05'),
(673, 18, 3, 2025, 'December', '2026-04-02', NULL, NULL, NULL, 0, NULL, NULL, '2026-04-04 07:54:05', '2026-04-04 07:54:05'),
(674, 18, 4, 2025, 'December', '2025-12-12', '2025-12-24', '2025-12-24', '2026-01-03', 0, NULL, NULL, '2026-04-04 07:54:05', '2026-04-04 07:54:05'),
(675, 18, 5, 2025, 'December', '2025-12-18', '2025-12-18', '2025-12-23', '2026-01-03', 0, NULL, NULL, '2026-04-04 07:54:05', '2026-04-04 07:54:05'),
(676, 18, 6, 2025, 'December', '2026-03-31', '2026-03-21', '2026-03-26', '2026-03-31', 0, NULL, NULL, '2026-04-04 07:54:05', '2026-04-04 07:54:05'),
(677, 18, 7, 2025, 'December', '2026-02-06', '2026-02-04', '2026-02-11', '2026-02-20', 0, NULL, NULL, '2026-04-04 07:54:05', '2026-04-04 07:54:05'),
(678, 18, 8, 2025, 'December', '2026-08-02', '2026-07-25', '2026-08-03', '2026-08-04', 0, NULL, NULL, '2026-04-04 07:54:05', '2026-04-04 07:54:05'),
(679, 18, 9, 2025, 'December', '2026-03-31', '2026-04-12', '2026-04-14', '2026-04-24', 0, NULL, NULL, '2026-04-04 07:54:05', '2026-04-04 07:54:05'),
(680, 18, 10, 2025, 'December', '2025-12-01', '2025-11-22', '2025-11-26', '2025-11-30', 0, NULL, NULL, '2026-04-04 07:54:05', '2026-04-04 07:54:05'),
(681, 19, 1, 2025, 'December', '2026-04-02', NULL, NULL, NULL, 0, NULL, NULL, '2026-04-04 07:54:05', '2026-04-04 07:54:05'),
(682, 19, 2, 2025, 'December', '2026-01-14', '2026-01-02', '2026-01-05', '2026-01-10', 0, NULL, NULL, '2026-04-04 07:54:05', '2026-04-04 07:54:05'),
(683, 19, 3, 2025, 'December', '2026-02-27', '2026-02-26', '2026-02-28', '2026-03-06', 0, NULL, NULL, '2026-04-04 07:54:05', '2026-04-04 07:54:05'),
(684, 19, 4, 2025, 'December', '2025-12-29', '2025-12-24', '2025-12-24', '2025-12-24', 0, NULL, NULL, '2026-04-04 07:54:05', '2026-04-04 07:54:05'),
(685, 19, 5, 2025, 'December', '2026-08-25', '2026-08-19', '2026-08-20', '2026-08-21', 0, NULL, NULL, '2026-04-04 07:54:05', '2026-04-04 07:54:05'),
(686, 19, 6, 2025, 'December', '2026-04-04', '2026-03-27', '2026-04-05', '2026-04-06', 0, NULL, NULL, '2026-04-04 07:54:05', '2026-04-04 07:54:05'),
(687, 19, 7, 2025, 'December', '2025-12-28', '2025-12-28', '2026-01-06', '2026-01-15', 0, NULL, NULL, '2026-04-04 07:54:05', '2026-04-04 07:54:05'),
(688, 19, 8, 2025, 'December', '2025-11-28', '2025-11-28', '2025-12-05', '2025-12-12', 0, NULL, NULL, '2026-04-04 07:54:05', '2026-04-04 07:54:05'),
(689, 19, 9, 2025, 'December', '2026-08-11', '2026-08-11', '2026-08-11', '2026-08-19', 0, NULL, NULL, '2026-04-04 07:54:05', '2026-04-04 07:54:05'),
(690, 19, 10, 2025, 'December', '2026-02-24', '2026-02-24', '2026-03-02', '2026-03-06', 0, NULL, NULL, '2026-04-04 07:54:05', '2026-04-04 07:54:05'),
(691, 20, 1, 2025, 'December', '2025-11-18', '2025-11-29', '2025-11-30', '2025-12-09', 0, NULL, NULL, '2026-04-04 07:54:05', '2026-04-04 07:54:05'),
(692, 20, 2, 2025, 'December', '2026-02-21', '2026-02-21', '2026-02-24', '2026-03-05', 0, NULL, NULL, '2026-04-04 07:54:05', '2026-04-04 07:54:05'),
(693, 20, 3, 2025, 'December', '2026-05-17', '2026-05-09', '2026-05-18', '2026-05-19', 0, NULL, NULL, '2026-04-04 07:54:05', '2026-04-04 07:54:05'),
(694, 20, 4, 2025, 'December', '2026-02-21', NULL, NULL, NULL, 0, NULL, NULL, '2026-04-04 07:54:05', '2026-04-04 07:54:05'),
(695, 20, 5, 2025, 'December', '2026-02-14', '2026-02-14', '2026-02-17', '2026-02-26', 0, NULL, NULL, '2026-04-04 07:54:05', '2026-04-04 07:54:05'),
(696, 20, 6, 2025, 'December', '2026-03-21', '2026-03-21', '2026-03-29', '2026-04-04', 0, NULL, NULL, '2026-04-04 07:54:05', '2026-04-04 07:54:05'),
(697, 20, 7, 2025, 'December', '2026-05-07', '2026-04-27', '2026-04-28', '2026-05-01', 0, NULL, NULL, '2026-04-04 07:54:05', '2026-04-04 07:54:05'),
(698, 20, 8, 2025, 'December', '2026-03-02', '2026-03-02', '2026-03-11', '2026-03-18', 0, NULL, NULL, '2026-04-04 07:54:05', '2026-04-04 07:54:05'),
(699, 20, 9, 2025, 'December', '2026-03-03', '2026-02-23', '2026-02-26', '2026-03-01', 0, NULL, NULL, '2026-04-04 07:54:05', '2026-04-04 07:54:05'),
(700, 20, 10, 2025, 'December', '2026-07-31', NULL, NULL, NULL, 0, NULL, NULL, '2026-04-04 07:54:05', '2026-04-04 07:54:05'),
(701, 21, 1, 2025, 'December', '2025-11-17', '2025-11-09', '2025-11-18', '2025-11-19', 0, NULL, NULL, '2026-04-04 07:54:05', '2026-04-04 07:54:05'),
(702, 21, 2, 2025, 'December', '2026-07-12', '2026-07-11', '2026-07-13', '2026-07-19', 0, NULL, NULL, '2026-04-04 07:54:05', '2026-04-04 07:54:05'),
(703, 21, 3, 2025, 'December', '2026-07-12', '2026-07-12', '2026-07-17', '2026-07-20', 0, NULL, NULL, '2026-04-04 07:54:05', '2026-04-04 07:54:05'),
(704, 21, 4, 2025, 'December', '2026-07-16', '2026-07-13', '2026-07-21', '2026-07-31', 0, NULL, NULL, '2026-04-04 07:54:05', '2026-04-04 07:54:05'),
(705, 21, 5, 2025, 'December', '2025-11-30', '2025-12-13', '2025-12-14', '2025-12-25', 0, NULL, NULL, '2026-04-04 07:54:05', '2026-04-04 07:54:05'),
(706, 21, 6, 2025, 'December', '2026-04-02', NULL, NULL, NULL, 0, NULL, NULL, '2026-04-04 07:54:05', '2026-04-04 07:54:05'),
(707, 21, 7, 2025, 'December', '2025-11-15', '2025-11-13', '2025-11-16', '2025-11-23', 0, NULL, NULL, '2026-04-04 07:54:05', '2026-04-04 07:54:05'),
(708, 21, 8, 2025, 'December', '2026-03-30', '2026-04-10', '2026-04-19', '2026-04-28', 0, NULL, NULL, '2026-04-04 07:54:05', '2026-04-04 07:54:05'),
(709, 21, 9, 2025, 'December', '2026-05-07', '2026-05-07', '2026-05-16', '2026-05-21', 0, NULL, NULL, '2026-04-04 07:54:05', '2026-04-04 07:54:05'),
(710, 21, 10, 2025, 'December', '2026-03-18', '2026-03-08', '2026-03-13', '2026-03-18', 0, NULL, NULL, '2026-04-04 07:54:05', '2026-04-04 07:54:05'),
(711, 22, 1, 2025, 'December', '2026-02-13', '2026-02-13', '2026-02-17', '2026-02-17', 0, NULL, NULL, '2026-04-04 07:54:05', '2026-04-04 07:54:05'),
(712, 22, 2, 2025, 'December', '2026-03-22', '2026-03-16', '2026-03-17', '2026-03-18', 0, NULL, NULL, '2026-04-04 07:54:05', '2026-04-04 07:54:05');
INSERT INTO `entity_reporting_matrix` (`id`, `entity_id`, `item_id`, `reporting_year`, `reporting_month`, `deadline_date`, `submission_date`, `reviewed_date`, `completed_date`, `is_deleted`, `created_by`, `updated_by`, `created_at`, `updated_at`) VALUES
(713, 22, 3, 2025, 'December', '2026-04-04', NULL, NULL, NULL, 0, NULL, NULL, '2026-04-04 07:54:05', '2026-04-04 07:54:05'),
(714, 22, 4, 2025, 'December', '2026-03-13', '2026-03-07', '2026-03-08', '2026-03-09', 0, NULL, NULL, '2026-04-04 07:54:05', '2026-04-04 07:54:05'),
(715, 22, 5, 2025, 'December', '2026-01-24', '2026-01-16', '2026-01-25', '2026-01-26', 0, NULL, NULL, '2026-04-04 07:54:05', '2026-04-04 07:54:05'),
(716, 22, 6, 2025, 'December', '2026-01-25', '2026-01-28', '2026-01-31', '2026-02-01', 0, NULL, NULL, '2026-04-04 07:54:05', '2026-04-04 07:54:05'),
(717, 22, 7, 2025, 'December', '2026-06-16', NULL, NULL, NULL, 0, NULL, NULL, '2026-04-04 07:54:05', '2026-04-04 07:54:05'),
(718, 22, 8, 2025, 'December', '2026-02-05', NULL, NULL, NULL, 0, NULL, NULL, '2026-04-04 07:54:05', '2026-04-04 07:54:05'),
(719, 22, 9, 2025, 'December', '2026-04-02', NULL, NULL, NULL, 0, NULL, NULL, '2026-04-04 07:54:06', '2026-04-04 07:54:06'),
(720, 22, 10, 2025, 'December', '2026-05-31', '2026-05-28', '2026-06-05', '2026-06-15', 0, NULL, NULL, '2026-04-04 07:54:06', '2026-04-04 07:54:06'),
(721, 23, 1, 2025, 'December', '2025-11-27', '2025-11-19', '2025-11-28', '2025-11-29', 0, NULL, NULL, '2026-04-04 07:54:06', '2026-04-04 07:54:06'),
(722, 23, 2, 2025, 'December', '2026-07-20', '2026-07-20', '2026-07-29', '2026-08-03', 0, NULL, NULL, '2026-04-04 07:54:06', '2026-04-04 07:54:06'),
(723, 23, 3, 2025, 'December', '2026-03-02', '2026-02-23', '2026-02-25', '2026-02-27', 0, NULL, NULL, '2026-04-04 07:54:06', '2026-04-04 07:54:06'),
(724, 23, 4, 2025, 'December', '2025-12-11', '2025-12-11', '2025-12-20', '2025-12-29', 0, NULL, NULL, '2026-04-04 07:54:06', '2026-04-04 07:54:06'),
(725, 23, 5, 2025, 'December', '2026-01-16', '2026-01-16', '2026-01-21', '2026-01-26', 0, NULL, NULL, '2026-04-04 07:54:06', '2026-04-04 07:54:06'),
(726, 23, 6, 2025, 'December', '2026-07-23', '2026-07-17', '2026-07-24', '2026-08-04', 0, NULL, NULL, '2026-04-04 07:54:06', '2026-04-04 07:54:06'),
(727, 23, 7, 2025, 'December', '2026-03-01', '2026-02-26', '2026-03-02', '2026-03-10', 0, NULL, NULL, '2026-04-04 07:54:06', '2026-04-04 07:54:06'),
(728, 23, 8, 2025, 'December', '2026-02-15', '2026-02-03', '2026-02-12', '2026-02-15', 0, NULL, NULL, '2026-04-04 07:54:06', '2026-04-04 07:54:06'),
(729, 23, 9, 2025, 'December', '2026-04-08', '2026-03-30', '2026-04-05', '2026-04-05', 0, NULL, NULL, '2026-04-04 07:54:06', '2026-04-04 07:54:06'),
(730, 23, 10, 2025, 'December', '2026-02-11', '2026-02-08', '2026-02-16', '2026-02-26', 0, NULL, NULL, '2026-04-04 07:54:06', '2026-04-04 07:54:06'),
(731, 24, 1, 2025, 'December', '2025-12-02', '2025-11-28', '2025-12-03', '2025-12-12', 0, NULL, NULL, '2026-04-04 07:54:06', '2026-04-04 07:54:06'),
(732, 24, 2, 2025, 'December', '2026-01-10', '2026-01-10', '2026-01-15', '2026-01-18', 0, NULL, NULL, '2026-04-04 07:54:06', '2026-04-04 07:54:06'),
(733, 24, 3, 2025, 'December', '2026-06-03', '2026-06-03', '2026-06-03', '2026-06-11', 0, NULL, NULL, '2026-04-04 07:54:06', '2026-04-04 07:54:06'),
(734, 24, 4, 2025, 'December', '2026-04-02', NULL, NULL, NULL, 0, NULL, NULL, '2026-04-04 07:54:06', '2026-04-04 07:54:06'),
(735, 24, 5, 2025, 'December', '2026-05-07', '2026-05-07', '2026-05-12', '2026-05-23', 0, NULL, NULL, '2026-04-04 07:54:06', '2026-04-04 07:54:06'),
(736, 24, 6, 2025, 'December', '2026-06-12', '2026-06-12', '2026-06-13', '2026-06-24', 0, NULL, NULL, '2026-04-04 07:54:06', '2026-04-04 07:54:06'),
(737, 24, 7, 2025, 'December', '2026-08-09', '2026-08-09', '2026-08-12', '2026-08-23', 0, NULL, NULL, '2026-04-04 07:54:06', '2026-04-04 07:54:06'),
(738, 24, 8, 2025, 'December', '2026-04-02', NULL, NULL, NULL, 0, NULL, NULL, '2026-04-04 07:54:06', '2026-04-04 07:54:06'),
(739, 24, 9, 2025, 'December', '2025-11-20', '2025-12-02', '2025-12-02', '2025-12-12', 0, NULL, NULL, '2026-04-04 07:54:06', '2026-04-04 07:54:06'),
(740, 24, 10, 2025, 'December', '2026-01-07', '2026-01-04', '2026-01-08', '2026-01-16', 0, NULL, NULL, '2026-04-04 07:54:06', '2026-04-04 07:54:06'),
(741, 25, 1, 2025, 'December', '2026-04-02', NULL, NULL, NULL, 0, NULL, NULL, '2026-04-04 07:54:06', '2026-04-04 07:54:06'),
(742, 25, 2, 2025, 'December', '2026-05-19', NULL, NULL, NULL, 0, NULL, NULL, '2026-04-04 07:54:06', '2026-04-04 07:54:06'),
(743, 25, 3, 2025, 'December', '2026-01-22', NULL, NULL, NULL, 0, NULL, NULL, '2026-04-04 07:54:06', '2026-04-04 07:54:06'),
(744, 25, 4, 2025, 'December', '2026-03-11', '2026-02-28', '2026-03-08', '2026-03-10', 0, NULL, NULL, '2026-04-04 07:54:06', '2026-04-04 07:54:06'),
(745, 25, 5, 2025, 'December', '2026-03-16', '2026-03-16', '2026-03-19', '2026-03-22', 0, NULL, NULL, '2026-04-04 07:54:06', '2026-04-04 07:54:06'),
(746, 25, 6, 2025, 'December', '2026-06-18', '2026-06-06', '2026-06-09', '2026-06-14', 0, NULL, NULL, '2026-04-04 07:54:06', '2026-04-04 07:54:06'),
(747, 25, 7, 2025, 'December', '2026-02-09', '2026-02-12', '2026-02-15', '2026-02-16', 0, NULL, NULL, '2026-04-04 07:54:06', '2026-04-04 07:54:06'),
(748, 25, 8, 2025, 'December', '2026-03-12', '2026-03-12', '2026-03-17', '2026-03-18', 0, NULL, NULL, '2026-04-04 07:54:06', '2026-04-04 07:54:06'),
(749, 25, 9, 2025, 'December', '2026-02-12', '2026-02-24', '2026-02-24', '2026-03-06', 0, NULL, NULL, '2026-04-04 07:54:06', '2026-04-04 07:54:06'),
(750, 25, 10, 2025, 'December', '2026-06-23', '2026-06-23', '2026-06-23', '2026-06-29', 0, NULL, NULL, '2026-04-04 07:54:06', '2026-04-04 07:54:06'),
(751, 26, 1, 2025, 'December', '2026-07-14', '2026-07-01', '2026-07-05', '2026-07-11', 0, NULL, NULL, '2026-04-04 07:54:06', '2026-04-04 07:54:06'),
(752, 26, 2, 2025, 'December', '2026-03-17', '2026-03-17', '2026-03-23', '2026-03-25', 0, NULL, NULL, '2026-04-04 07:54:06', '2026-04-04 07:54:06'),
(753, 26, 3, 2025, 'December', '2026-04-02', NULL, NULL, NULL, 0, NULL, NULL, '2026-04-04 07:54:06', '2026-04-04 07:54:06'),
(754, 26, 4, 2025, 'December', '2025-11-17', NULL, NULL, NULL, 0, NULL, NULL, '2026-04-04 07:54:06', '2026-04-04 07:54:06'),
(755, 26, 5, 2025, 'December', '2026-01-04', '2025-12-26', '2025-12-26', '2025-12-28', 0, NULL, NULL, '2026-04-04 07:54:06', '2026-04-04 07:54:06'),
(756, 26, 6, 2025, 'December', '2026-08-29', '2026-08-25', '2026-09-03', '2026-09-14', 0, NULL, NULL, '2026-04-04 07:54:06', '2026-04-04 07:54:06'),
(757, 26, 7, 2025, 'December', '2026-08-02', '2026-08-02', '2026-08-04', '2026-08-12', 0, NULL, NULL, '2026-04-04 07:54:06', '2026-04-04 07:54:06'),
(758, 26, 8, 2025, 'December', '2026-05-28', NULL, NULL, NULL, 0, NULL, NULL, '2026-04-04 07:54:06', '2026-04-04 07:54:06'),
(759, 26, 9, 2025, 'December', '2026-04-20', '2026-04-15', '2026-04-15', '2026-04-15', 0, NULL, NULL, '2026-04-04 07:54:06', '2026-04-04 07:54:06'),
(760, 26, 10, 2025, 'December', '2025-12-14', '2025-12-23', '2026-01-01', '2026-01-08', 0, NULL, NULL, '2026-04-04 07:54:06', '2026-04-04 07:54:06'),
(761, 27, 1, 2025, 'December', '2026-04-01', '2026-03-27', '2026-04-02', '2026-04-12', 0, NULL, NULL, '2026-04-04 07:54:06', '2026-04-04 07:54:06'),
(762, 27, 2, 2025, 'December', '2026-03-21', '2026-03-21', '2026-03-26', '2026-03-29', 0, NULL, NULL, '2026-04-04 07:54:06', '2026-04-04 07:54:06'),
(763, 27, 3, 2025, 'December', '2026-02-12', '2026-02-14', '2026-02-16', '2026-02-16', 0, NULL, NULL, '2026-04-04 07:54:06', '2026-04-04 07:54:06'),
(764, 27, 4, 2025, 'December', '2025-11-22', NULL, NULL, NULL, 0, NULL, NULL, '2026-04-04 07:54:06', '2026-04-04 07:54:06'),
(765, 27, 5, 2025, 'December', '2026-04-02', NULL, NULL, NULL, 0, NULL, NULL, '2026-04-04 07:54:06', '2026-04-04 07:54:06'),
(766, 27, 6, 2025, 'December', '2026-02-01', '2026-01-28', '2026-02-06', '2026-02-17', 0, NULL, NULL, '2026-04-04 07:54:06', '2026-04-04 07:54:06'),
(767, 27, 7, 2025, 'December', '2026-04-02', NULL, NULL, NULL, 0, NULL, NULL, '2026-04-04 07:54:06', '2026-04-04 07:54:06'),
(768, 27, 8, 2025, 'December', '2026-03-08', '2026-02-25', '2026-03-03', '2026-03-09', 0, NULL, NULL, '2026-04-04 07:54:06', '2026-04-04 07:54:06'),
(769, 27, 9, 2025, 'December', '2026-08-25', '2026-08-25', '2026-08-31', '2026-09-06', 0, NULL, NULL, '2026-04-04 07:54:06', '2026-04-04 07:54:06'),
(770, 27, 10, 2025, 'December', '2026-02-25', NULL, NULL, NULL, 0, NULL, NULL, '2026-04-04 07:54:06', '2026-04-04 07:54:06'),
(771, 28, 1, 2025, 'December', '2026-01-09', '2026-01-21', '2026-01-21', '2026-01-31', 0, NULL, NULL, '2026-04-04 07:54:06', '2026-04-04 07:54:06'),
(772, 28, 2, 2025, 'December', '2026-04-11', '2026-04-01', '2026-04-08', '2026-04-09', 0, NULL, NULL, '2026-04-04 07:54:06', '2026-04-04 07:54:06'),
(773, 28, 3, 2025, 'December', '2026-02-22', '2026-02-17', '2026-02-23', '2026-03-05', 0, NULL, NULL, '2026-04-04 07:54:06', '2026-04-04 07:54:06'),
(774, 28, 4, 2025, 'December', '2026-04-02', NULL, NULL, NULL, 0, NULL, NULL, '2026-04-04 07:54:06', '2026-04-04 07:54:06'),
(775, 28, 5, 2025, 'December', '2026-02-13', '2026-02-07', '2026-02-08', '2026-02-09', 0, NULL, NULL, '2026-04-04 07:54:06', '2026-04-04 07:54:06'),
(776, 28, 6, 2025, 'December', '2026-06-29', NULL, NULL, NULL, 0, NULL, NULL, '2026-04-04 07:54:06', '2026-04-04 07:54:06'),
(777, 28, 7, 2025, 'December', '2026-01-31', '2026-01-31', '2026-02-02', '2026-02-02', 0, NULL, NULL, '2026-04-04 07:54:06', '2026-04-04 07:54:06'),
(778, 28, 8, 2025, 'December', '2026-02-19', '2026-02-19', '2026-02-20', '2026-03-03', 0, NULL, NULL, '2026-04-04 07:54:06', '2026-04-04 07:54:06'),
(779, 28, 9, 2025, 'December', '2025-11-15', '2025-11-08', '2025-11-16', '2025-11-16', 0, NULL, NULL, '2026-04-04 07:54:06', '2026-04-04 07:54:06'),
(780, 28, 10, 2025, 'December', '2026-01-31', '2026-01-31', '2026-01-31', '2026-02-10', 0, NULL, NULL, '2026-04-04 07:54:06', '2026-04-04 07:54:06'),
(781, 29, 1, 2025, 'December', '2025-12-22', '2025-12-29', '2026-01-05', '2026-01-10', 0, NULL, NULL, '2026-04-04 07:54:06', '2026-04-04 07:54:06'),
(782, 29, 2, 2025, 'December', '2026-07-23', '2026-07-17', '2026-07-24', '2026-08-04', 0, NULL, NULL, '2026-04-04 07:54:06', '2026-04-04 07:54:06'),
(783, 29, 3, 2025, 'December', '2026-03-11', '2026-03-17', '2026-03-23', '2026-03-27', 0, NULL, NULL, '2026-04-04 07:54:06', '2026-04-04 07:54:06'),
(784, 29, 4, 2025, 'December', '2026-07-28', '2026-07-15', '2026-07-19', '2026-07-25', 0, NULL, NULL, '2026-04-04 07:54:06', '2026-04-04 07:54:06'),
(785, 29, 5, 2025, 'December', '2026-03-22', '2026-03-22', '2026-03-31', '2026-04-07', 0, NULL, NULL, '2026-04-04 07:54:06', '2026-04-04 07:54:06'),
(786, 29, 6, 2025, 'December', '2026-05-21', NULL, NULL, NULL, 0, NULL, NULL, '2026-04-04 07:54:06', '2026-04-04 07:54:06'),
(787, 29, 7, 2025, 'December', '2026-03-04', '2026-02-19', '2026-02-19', '2026-02-23', 0, NULL, NULL, '2026-04-04 07:54:06', '2026-04-04 07:54:06'),
(788, 29, 8, 2025, 'December', '2026-07-06', '2026-07-02', '2026-07-07', '2026-07-16', 0, NULL, NULL, '2026-04-04 07:54:06', '2026-04-04 07:54:06'),
(789, 29, 9, 2025, 'December', '2026-07-30', '2026-07-30', '2026-08-05', '2026-08-11', 0, NULL, NULL, '2026-04-04 07:54:06', '2026-04-04 07:54:06'),
(790, 29, 10, 2025, 'December', '2025-11-24', NULL, NULL, NULL, 0, NULL, NULL, '2026-04-04 07:54:06', '2026-04-04 07:54:06'),
(791, 30, 1, 2025, 'December', '2026-05-14', '2026-05-14', '2026-05-22', '2026-05-30', 0, NULL, NULL, '2026-04-04 07:54:06', '2026-04-04 07:54:06'),
(792, 30, 2, 2025, 'December', '2025-12-02', '2025-11-21', '2025-11-27', '2025-12-03', 0, NULL, NULL, '2026-04-04 07:54:06', '2026-04-04 07:54:06'),
(793, 30, 3, 2025, 'December', '2026-07-30', '2026-07-30', '2026-07-31', '2026-08-11', 0, NULL, NULL, '2026-04-04 07:54:06', '2026-04-04 07:54:06'),
(794, 30, 4, 2025, 'December', '2026-07-08', '2026-07-08', '2026-07-13', '2026-07-14', 0, NULL, NULL, '2026-04-04 07:54:06', '2026-04-04 07:54:06'),
(795, 30, 5, 2025, 'December', '2026-04-20', '2026-04-09', '2026-04-17', '2026-04-19', 0, NULL, NULL, '2026-04-04 07:54:06', '2026-04-04 07:54:06'),
(796, 30, 6, 2025, 'December', '2026-01-13', '2026-01-25', '2026-01-25', '2026-02-04', 0, NULL, NULL, '2026-04-04 07:54:06', '2026-04-04 07:54:06'),
(797, 30, 7, 2025, 'December', '2026-01-24', NULL, NULL, NULL, 0, NULL, NULL, '2026-04-04 07:54:06', '2026-04-04 07:54:06'),
(798, 30, 8, 2025, 'December', '2026-04-21', '2026-04-21', '2026-04-23', '2026-05-01', 0, NULL, NULL, '2026-04-04 07:54:06', '2026-04-04 07:54:06'),
(799, 30, 9, 2025, 'December', '2026-04-02', NULL, NULL, NULL, 0, NULL, NULL, '2026-04-04 07:54:06', '2026-04-04 07:54:06'),
(800, 30, 10, 2025, 'December', '2026-01-17', '2026-01-13', '2026-01-22', '2026-02-02', 0, NULL, NULL, '2026-04-04 07:54:06', '2026-04-04 07:54:06'),
(801, 31, 1, 2025, 'December', '2026-07-16', '2026-07-16', '2026-07-18', '2026-07-20', 0, NULL, NULL, '2026-04-04 07:54:06', '2026-04-04 07:54:06'),
(802, 31, 2, 2025, 'December', '2026-03-10', '2026-03-22', '2026-03-24', '2026-04-03', 0, NULL, NULL, '2026-04-04 07:54:06', '2026-04-04 07:54:06'),
(803, 31, 3, 2025, 'December', '2026-01-22', '2026-02-03', '2026-02-05', '2026-02-15', 0, NULL, NULL, '2026-04-04 07:54:06', '2026-04-04 07:54:06'),
(804, 31, 4, 2025, 'December', '2025-11-23', '2025-11-13', '2025-11-20', '2025-11-21', 0, NULL, NULL, '2026-04-04 07:54:06', '2026-04-04 07:54:06'),
(805, 31, 5, 2025, 'December', '2026-05-11', NULL, NULL, NULL, 0, NULL, NULL, '2026-04-04 07:54:06', '2026-04-04 07:54:06'),
(806, 31, 6, 2025, 'December', '2026-04-02', NULL, NULL, NULL, 0, NULL, NULL, '2026-04-04 07:54:06', '2026-04-04 07:54:06'),
(807, 31, 7, 2025, 'December', '2026-06-07', '2026-06-07', '2026-06-13', '2026-06-17', 0, NULL, NULL, '2026-04-04 07:54:06', '2026-04-04 07:54:06'),
(808, 31, 8, 2025, 'December', '2026-07-24', NULL, NULL, NULL, 0, NULL, NULL, '2026-04-04 07:54:06', '2026-04-04 07:54:06'),
(809, 31, 9, 2025, 'December', '2026-01-04', '2025-12-25', '2026-01-01', '2026-01-02', 0, NULL, NULL, '2026-04-04 07:54:06', '2026-04-04 07:54:06'),
(810, 31, 10, 2025, 'December', '2026-08-22', '2026-08-22', '2026-08-27', '2026-08-28', 0, NULL, NULL, '2026-04-04 07:54:06', '2026-04-04 07:54:06'),
(811, 32, 1, 2025, 'December', '2026-01-25', '2026-02-01', '2026-02-08', '2026-02-13', 0, NULL, NULL, '2026-04-04 07:54:06', '2026-04-04 07:54:06'),
(812, 32, 2, 2025, 'December', '2026-07-16', '2026-07-16', '2026-07-23', '2026-07-28', 0, NULL, NULL, '2026-04-04 07:54:06', '2026-04-04 07:54:06'),
(813, 32, 3, 2025, 'December', '2026-03-14', '2026-03-04', '2026-03-09', '2026-03-14', 0, NULL, NULL, '2026-04-04 07:54:06', '2026-04-04 07:54:06'),
(814, 32, 4, 2025, 'December', '2026-08-11', '2026-08-11', '2026-08-13', '2026-08-21', 0, NULL, NULL, '2026-04-04 07:54:06', '2026-04-04 07:54:06'),
(815, 32, 5, 2025, 'December', '2026-06-08', NULL, NULL, NULL, 0, NULL, NULL, '2026-04-04 07:54:06', '2026-04-04 07:54:06'),
(816, 32, 6, 2025, 'December', '2025-12-27', '2025-12-27', '2026-01-04', '2026-01-10', 0, NULL, NULL, '2026-04-04 07:54:06', '2026-04-04 07:54:06'),
(817, 32, 7, 2025, 'December', '2026-06-24', '2026-06-22', '2026-06-25', '2026-07-02', 0, NULL, NULL, '2026-04-04 07:54:06', '2026-04-04 07:54:06'),
(818, 32, 8, 2025, 'December', '2026-03-02', '2026-03-11', '2026-03-20', '2026-03-27', 0, NULL, NULL, '2026-04-04 07:54:06', '2026-04-04 07:54:06'),
(819, 32, 9, 2025, 'December', '2026-01-21', '2026-01-21', '2026-01-22', '2026-02-02', 0, NULL, NULL, '2026-04-04 07:54:06', '2026-04-04 07:54:06'),
(820, 32, 10, 2025, 'December', '2026-01-05', '2026-01-05', '2026-01-07', '2026-01-17', 0, NULL, NULL, '2026-04-04 07:54:06', '2026-04-04 07:54:06'),
(821, 33, 1, 2025, 'December', '2026-02-26', '2026-02-26', '2026-03-01', '2026-03-02', 0, NULL, NULL, '2026-04-04 07:54:06', '2026-04-04 07:54:06'),
(822, 33, 2, 2025, 'December', '2026-06-27', '2026-06-18', '2026-06-18', '2026-06-20', 0, NULL, NULL, '2026-04-04 07:54:06', '2026-04-04 07:54:06'),
(823, 33, 3, 2025, 'December', '2026-08-13', '2026-08-05', '2026-08-08', '2026-08-11', 0, NULL, NULL, '2026-04-04 07:54:06', '2026-04-04 07:54:06'),
(824, 33, 4, 2025, 'December', '2026-03-29', '2026-03-29', '2026-03-29', '2026-04-04', 0, NULL, NULL, '2026-04-04 07:54:06', '2026-04-04 07:54:06'),
(825, 33, 5, 2025, 'December', '2026-08-23', '2026-08-12', '2026-08-20', '2026-08-22', 0, NULL, NULL, '2026-04-04 07:54:06', '2026-04-04 07:54:06'),
(826, 33, 6, 2025, 'December', '2026-01-29', '2026-02-10', '2026-02-10', '2026-02-20', 0, NULL, NULL, '2026-04-04 07:54:06', '2026-04-04 07:54:06'),
(827, 33, 7, 2025, 'December', '2026-05-07', '2026-05-07', '2026-05-10', '2026-05-13', 0, NULL, NULL, '2026-04-04 07:54:06', '2026-04-04 07:54:06'),
(828, 33, 8, 2025, 'December', '2026-03-02', '2026-02-22', '2026-03-03', '2026-03-04', 0, NULL, NULL, '2026-04-04 07:54:06', '2026-04-04 07:54:06'),
(829, 33, 9, 2025, 'December', '2026-06-18', '2026-06-18', '2026-06-19', '2026-06-20', 0, NULL, NULL, '2026-04-04 07:54:06', '2026-04-04 07:54:06'),
(830, 33, 10, 2025, 'December', '2025-11-09', NULL, NULL, NULL, 0, NULL, NULL, '2026-04-04 07:54:06', '2026-04-04 07:54:06'),
(831, 34, 1, 2025, 'December', '2026-07-06', '2026-07-06', '2026-07-07', '2026-07-14', 0, NULL, NULL, '2026-04-04 07:54:06', '2026-04-04 07:54:06'),
(832, 34, 2, 2025, 'December', '2026-06-29', '2026-06-18', '2026-06-26', '2026-06-28', 0, NULL, NULL, '2026-04-04 07:54:06', '2026-04-04 07:54:06'),
(833, 34, 3, 2025, 'December', '2026-08-15', '2026-08-05', '2026-08-06', '2026-08-09', 0, NULL, NULL, '2026-04-04 07:54:06', '2026-04-04 07:54:06'),
(834, 34, 4, 2025, 'December', '2026-03-19', '2026-03-31', '2026-04-02', '2026-04-12', 0, NULL, NULL, '2026-04-04 07:54:06', '2026-04-04 07:54:06'),
(835, 34, 5, 2025, 'December', '2026-08-25', '2026-08-14', '2026-08-20', '2026-08-26', 0, NULL, NULL, '2026-04-04 07:54:06', '2026-04-04 07:54:06'),
(836, 34, 6, 2025, 'December', '2026-07-10', '2026-06-29', '2026-07-01', '2026-07-05', 0, NULL, NULL, '2026-04-04 07:54:06', '2026-04-04 07:54:06'),
(837, 34, 7, 2025, 'December', '2025-11-24', '2025-11-27', '2025-11-30', '2025-12-01', 0, NULL, NULL, '2026-04-04 07:54:06', '2026-04-04 07:54:06'),
(838, 34, 8, 2025, 'December', '2026-08-14', '2026-08-14', '2026-08-22', '2026-08-30', 0, NULL, NULL, '2026-04-04 07:54:06', '2026-04-04 07:54:06'),
(839, 34, 9, 2025, 'December', '2026-07-26', '2026-07-18', '2026-07-27', '2026-07-28', 0, NULL, NULL, '2026-04-04 07:54:06', '2026-04-04 07:54:06'),
(840, 34, 10, 2025, 'December', '2026-02-17', '2026-02-17', '2026-02-26', '2026-03-07', 0, NULL, NULL, '2026-04-04 07:54:06', '2026-04-04 07:54:06'),
(841, 35, 1, 2025, 'December', '2026-02-13', '2026-02-13', '2026-02-17', '2026-02-27', 0, NULL, NULL, '2026-04-04 07:54:06', '2026-04-04 07:54:06'),
(842, 35, 2, 2025, 'December', '2026-08-11', '2026-08-02', '2026-08-06', '2026-08-10', 0, NULL, NULL, '2026-04-04 07:54:06', '2026-04-04 07:54:06'),
(843, 35, 3, 2025, 'December', '2026-04-02', NULL, NULL, NULL, 0, NULL, NULL, '2026-04-04 07:54:06', '2026-04-04 07:54:06'),
(844, 35, 4, 2025, 'December', '2026-04-15', NULL, NULL, NULL, 0, NULL, NULL, '2026-04-04 07:54:06', '2026-04-04 07:54:06'),
(845, 35, 5, 2025, 'December', '2026-06-19', '2026-06-18', '2026-06-24', '2026-07-02', 0, NULL, NULL, '2026-04-04 07:54:06', '2026-04-04 07:54:06'),
(846, 35, 6, 2025, 'December', '2025-12-28', '2026-01-07', '2026-01-07', '2026-01-15', 0, NULL, NULL, '2026-04-04 07:54:06', '2026-04-04 07:54:06'),
(847, 35, 7, 2025, 'December', '2026-06-20', '2026-06-12', '2026-06-21', '2026-06-22', 0, NULL, NULL, '2026-04-04 07:54:06', '2026-04-04 07:54:06'),
(848, 35, 8, 2025, 'December', '2026-04-24', '2026-04-19', '2026-04-25', '2026-05-05', 0, NULL, NULL, '2026-04-04 07:54:06', '2026-04-04 07:54:06'),
(849, 35, 9, 2025, 'December', '2025-11-05', '2025-11-10', '2025-11-15', '2025-11-18', 0, NULL, NULL, '2026-04-04 07:54:06', '2026-04-04 07:54:06'),
(850, 35, 10, 2025, 'December', '2026-08-16', '2026-08-14', '2026-08-17', '2026-08-24', 0, NULL, NULL, '2026-04-04 07:54:06', '2026-04-04 07:54:06'),
(851, 36, 1, 2025, 'December', '2026-04-02', NULL, NULL, NULL, 0, NULL, NULL, '2026-04-04 07:54:06', '2026-04-04 07:54:06'),
(852, 36, 2, 2025, 'December', '2026-04-02', NULL, NULL, NULL, 0, NULL, NULL, '2026-04-04 07:54:06', '2026-04-04 07:54:06'),
(853, 36, 3, 2025, 'December', '2026-03-21', '2026-03-23', '2026-03-25', '2026-03-25', 0, NULL, NULL, '2026-04-04 07:54:06', '2026-04-04 07:54:06'),
(854, 36, 4, 2025, 'December', '2026-07-18', '2026-07-17', '2026-07-19', '2026-07-25', 0, NULL, NULL, '2026-04-04 07:54:06', '2026-04-04 07:54:06'),
(855, 36, 5, 2025, 'December', '2026-08-11', '2026-08-11', '2026-08-16', '2026-08-27', 0, NULL, NULL, '2026-04-04 07:54:06', '2026-04-04 07:54:06'),
(856, 36, 6, 2025, 'December', '2026-04-19', '2026-04-17', '2026-04-20', '2026-04-27', 0, NULL, NULL, '2026-04-04 07:54:06', '2026-04-04 07:54:06'),
(857, 36, 7, 2025, 'December', '2026-05-06', NULL, NULL, NULL, 0, NULL, NULL, '2026-04-04 07:54:06', '2026-04-04 07:54:06'),
(858, 36, 8, 2025, 'December', '2026-04-27', NULL, NULL, NULL, 0, NULL, NULL, '2026-04-04 07:54:06', '2026-04-04 07:54:06'),
(859, 36, 9, 2025, 'December', '2026-08-28', '2026-08-15', '2026-08-19', '2026-08-25', 0, NULL, NULL, '2026-04-04 07:54:06', '2026-04-04 07:54:06'),
(860, 36, 10, 2025, 'December', '2026-07-29', NULL, NULL, NULL, 0, NULL, NULL, '2026-04-04 07:54:06', '2026-04-04 07:54:06'),
(861, 37, 1, 2025, 'December', '2026-06-29', '2026-06-29', '2026-07-08', '2026-07-15', 0, NULL, NULL, '2026-04-04 07:54:06', '2026-04-04 07:54:06'),
(862, 37, 2, 2025, 'December', '2026-05-28', '2026-05-28', '2026-05-31', '2026-06-11', 0, NULL, NULL, '2026-04-04 07:54:06', '2026-04-04 07:54:06'),
(863, 37, 3, 2025, 'December', '2026-04-02', NULL, NULL, NULL, 0, NULL, NULL, '2026-04-04 07:54:06', '2026-04-04 07:54:06'),
(864, 37, 4, 2025, 'December', '2026-03-06', '2026-03-06', '2026-03-14', '2026-03-20', 0, NULL, NULL, '2026-04-04 07:54:06', '2026-04-04 07:54:06'),
(865, 37, 5, 2025, 'December', '2026-04-22', '2026-04-22', '2026-04-29', '2026-05-02', 0, NULL, NULL, '2026-04-04 07:54:06', '2026-04-04 07:54:06'),
(866, 37, 6, 2025, 'December', '2025-11-08', '2025-11-08', '2025-11-10', '2025-11-10', 0, NULL, NULL, '2026-04-04 07:54:06', '2026-04-04 07:54:06'),
(867, 37, 7, 2025, 'December', '2026-03-23', '2026-04-03', '2026-04-12', '2026-04-21', 0, NULL, NULL, '2026-04-04 07:54:06', '2026-04-04 07:54:06'),
(868, 37, 8, 2025, 'December', '2025-12-18', '2025-12-18', '2025-12-19', '2025-12-20', 0, NULL, NULL, '2026-04-04 07:54:06', '2026-04-04 07:54:06'),
(869, 37, 9, 2025, 'December', '2026-01-11', '2026-01-15', '2026-01-19', '2026-01-21', 0, NULL, NULL, '2026-04-04 07:54:06', '2026-04-04 07:54:06'),
(870, 37, 10, 2025, 'December', '2026-08-13', '2026-08-13', '2026-08-22', '2026-08-29', 0, NULL, NULL, '2026-04-04 07:54:06', '2026-04-04 07:54:06'),
(871, 38, 1, 2025, 'December', '2026-04-07', '2026-03-24', '2026-03-25', '2026-03-30', 0, NULL, NULL, '2026-04-04 07:54:06', '2026-04-04 07:54:06'),
(872, 38, 2, 2025, 'December', '2026-06-13', '2026-06-13', '2026-06-14', '2026-06-25', 0, NULL, NULL, '2026-04-04 07:54:06', '2026-04-04 07:54:06'),
(873, 38, 3, 2025, 'December', '2026-07-24', NULL, NULL, NULL, 0, NULL, NULL, '2026-04-04 07:54:06', '2026-04-04 07:54:06'),
(874, 38, 4, 2025, 'December', '2026-03-21', '2026-03-21', '2026-03-23', '2026-03-25', 0, NULL, NULL, '2026-04-04 07:54:06', '2026-04-04 07:54:06'),
(875, 38, 5, 2025, 'December', '2026-08-21', NULL, NULL, NULL, 0, NULL, NULL, '2026-04-04 07:54:06', '2026-04-04 07:54:06'),
(876, 38, 6, 2025, 'December', '2026-04-05', '2026-04-05', '2026-04-07', '2026-04-17', 0, NULL, NULL, '2026-04-04 07:54:06', '2026-04-04 07:54:06'),
(877, 38, 7, 2025, 'December', '2026-04-02', NULL, NULL, NULL, 0, NULL, NULL, '2026-04-04 07:54:06', '2026-04-04 07:54:06'),
(878, 38, 8, 2025, 'December', '2026-01-27', '2026-01-27', '2026-01-28', '2026-01-29', 0, NULL, NULL, '2026-04-04 07:54:06', '2026-04-04 07:54:06'),
(879, 38, 9, 2025, 'December', '2026-04-07', NULL, NULL, NULL, 0, NULL, NULL, '2026-04-04 07:54:06', '2026-04-04 07:54:06'),
(880, 38, 10, 2025, 'December', '2026-05-21', '2026-05-21', '2026-05-29', '2026-06-04', 0, NULL, NULL, '2026-04-04 07:54:06', '2026-04-04 07:54:06'),
(881, 39, 1, 2025, 'December', '2026-06-22', '2026-06-18', '2026-06-27', '2026-07-08', 0, NULL, NULL, '2026-04-04 07:54:06', '2026-04-04 07:54:06'),
(882, 39, 2, 2025, 'December', '2026-06-27', NULL, NULL, NULL, 0, NULL, NULL, '2026-04-04 07:54:06', '2026-04-04 07:54:06'),
(883, 39, 3, 2025, 'December', '2026-05-11', NULL, NULL, NULL, 0, NULL, NULL, '2026-04-04 07:54:06', '2026-04-04 07:54:06'),
(884, 39, 4, 2025, 'December', '2026-02-15', '2026-02-14', '2026-02-16', '2026-02-22', 0, NULL, NULL, '2026-04-04 07:54:06', '2026-04-04 07:54:06'),
(885, 39, 5, 2025, 'December', '2026-08-01', NULL, NULL, NULL, 0, NULL, NULL, '2026-04-04 07:54:06', '2026-04-04 07:54:06'),
(886, 39, 6, 2025, 'December', '2026-02-17', '2026-02-14', '2026-02-18', '2026-02-26', 0, NULL, NULL, '2026-04-04 07:54:06', '2026-04-04 07:54:06'),
(887, 39, 7, 2025, 'December', '2026-07-08', '2026-06-28', '2026-07-05', '2026-07-06', 0, NULL, NULL, '2026-04-04 07:54:06', '2026-04-04 07:54:06'),
(888, 39, 8, 2025, 'December', '2026-03-02', '2026-03-02', '2026-03-11', '2026-03-20', 0, NULL, NULL, '2026-04-04 07:54:06', '2026-04-04 07:54:06'),
(889, 39, 9, 2025, 'December', '2026-01-05', '2026-01-16', '2026-01-17', '2026-01-26', 0, NULL, NULL, '2026-04-04 07:54:06', '2026-04-04 07:54:06'),
(890, 39, 10, 2025, 'December', '2026-05-20', NULL, NULL, NULL, 0, NULL, NULL, '2026-04-04 07:54:06', '2026-04-04 07:54:06'),
(891, 40, 1, 2025, 'December', '2025-12-04', '2025-12-04', '2025-12-13', '2025-12-18', 0, NULL, NULL, '2026-04-04 07:54:06', '2026-04-04 07:54:06'),
(892, 40, 2, 2025, 'December', '2025-11-28', '2025-12-06', '2025-12-14', '2025-12-20', 0, NULL, NULL, '2026-04-04 07:54:06', '2026-04-04 07:54:06'),
(893, 40, 3, 2025, 'December', '2025-11-18', '2025-11-18', '2025-11-25', '2025-11-28', 0, NULL, NULL, '2026-04-04 07:54:06', '2026-04-04 07:54:06'),
(894, 40, 4, 2025, 'December', '2026-03-08', '2026-03-08', '2026-03-14', '2026-03-16', 0, NULL, NULL, '2026-04-04 07:54:06', '2026-04-04 07:54:06'),
(895, 40, 5, 2025, 'December', '2026-01-29', '2026-01-29', '2026-02-04', '2026-02-10', 0, NULL, NULL, '2026-04-04 07:54:06', '2026-04-04 07:54:06'),
(896, 40, 6, 2025, 'December', '2025-12-22', '2025-12-22', '2025-12-24', '2025-12-26', 0, NULL, NULL, '2026-04-04 07:54:06', '2026-04-04 07:54:06'),
(897, 40, 7, 2025, 'December', '2026-08-20', '2026-08-20', '2026-08-21', '2026-09-01', 0, NULL, NULL, '2026-04-04 07:54:06', '2026-04-04 07:54:06'),
(898, 40, 8, 2025, 'December', '2026-05-07', '2026-04-28', '2026-05-02', '2026-05-06', 0, NULL, NULL, '2026-04-04 07:54:06', '2026-04-04 07:54:06'),
(899, 40, 9, 2025, 'December', '2026-08-30', NULL, NULL, NULL, 0, NULL, NULL, '2026-04-04 07:54:06', '2026-04-04 07:54:06'),
(900, 40, 10, 2025, 'December', '2026-08-13', '2026-08-13', '2026-08-18', '2026-08-19', 0, NULL, NULL, '2026-04-04 07:54:06', '2026-04-04 07:54:06'),
(901, 41, 1, 2025, 'December', '2026-03-01', '2026-03-01', '2026-03-03', '2026-03-13', 0, NULL, NULL, '2026-04-04 07:54:06', '2026-04-04 07:54:06'),
(902, 41, 2, 2025, 'December', '2026-03-30', '2026-03-21', '2026-03-21', '2026-03-23', 0, NULL, NULL, '2026-04-04 07:54:06', '2026-04-04 07:54:06'),
(903, 41, 3, 2025, 'December', '2026-02-08', '2026-02-04', '2026-02-13', '2026-02-24', 0, NULL, NULL, '2026-04-04 07:54:06', '2026-04-04 07:54:06'),
(904, 41, 4, 2025, 'December', '2026-01-19', '2026-01-19', '2026-01-28', '2026-02-02', 0, NULL, NULL, '2026-04-04 07:54:06', '2026-04-04 07:54:06'),
(905, 41, 5, 2025, 'December', '2026-06-13', '2026-06-13', '2026-06-15', '2026-06-17', 0, NULL, NULL, '2026-04-04 07:54:06', '2026-04-04 07:54:06'),
(906, 41, 6, 2025, 'December', '2026-06-30', '2026-06-21', '2026-06-25', '2026-06-29', 0, NULL, NULL, '2026-04-04 07:54:06', '2026-04-04 07:54:06'),
(907, 41, 7, 2025, 'December', '2026-03-15', '2026-03-21', '2026-03-27', '2026-03-31', 0, NULL, NULL, '2026-04-04 07:54:06', '2026-04-04 07:54:06'),
(908, 41, 8, 2025, 'December', '2025-11-24', '2025-11-13', '2025-11-15', '2025-11-19', 0, NULL, NULL, '2026-04-04 07:54:06', '2026-04-04 07:54:06'),
(909, 41, 9, 2025, 'December', '2026-01-03', '2026-01-03', '2026-01-10', '2026-01-15', 0, NULL, NULL, '2026-04-04 07:54:06', '2026-04-04 07:54:06'),
(910, 41, 10, 2025, 'December', '2026-06-08', '2026-06-04', '2026-06-09', '2026-06-18', 0, NULL, NULL, '2026-04-04 07:54:06', '2026-04-04 07:54:06'),
(911, 42, 1, 2025, 'December', '2026-04-18', '2026-04-04', '2026-04-05', '2026-04-10', 0, NULL, NULL, '2026-04-04 07:54:06', '2026-04-04 07:54:06'),
(912, 42, 2, 2025, 'December', '2026-03-23', '2026-03-26', '2026-03-29', '2026-03-30', 0, NULL, NULL, '2026-04-04 07:54:06', '2026-04-04 07:54:06'),
(913, 42, 3, 2025, 'December', '2025-12-22', '2025-12-26', '2025-12-30', '2026-01-01', 0, NULL, NULL, '2026-04-04 07:54:06', '2026-04-04 07:54:06'),
(914, 42, 4, 2025, 'December', '2026-03-09', '2026-02-26', '2026-02-28', '2026-03-04', 0, NULL, NULL, '2026-04-04 07:54:06', '2026-04-04 07:54:06'),
(915, 42, 5, 2025, 'December', '2026-07-18', NULL, NULL, NULL, 0, NULL, NULL, '2026-04-04 07:54:06', '2026-04-04 07:54:06'),
(916, 42, 6, 2025, 'December', '2026-06-17', '2026-06-05', '2026-06-12', '2026-06-19', 0, NULL, NULL, '2026-04-04 07:54:06', '2026-04-04 07:54:06'),
(917, 42, 7, 2025, 'December', '2026-08-19', NULL, NULL, NULL, 0, NULL, NULL, '2026-04-04 07:54:06', '2026-04-04 07:54:06'),
(918, 42, 8, 2025, 'December', '2026-01-10', '2026-01-10', '2026-01-11', '2026-01-22', 0, NULL, NULL, '2026-04-04 07:54:06', '2026-04-04 07:54:06'),
(919, 42, 9, 2025, 'December', '2026-03-29', '2026-03-22', '2026-03-30', '2026-03-30', 0, NULL, NULL, '2026-04-04 07:54:06', '2026-04-04 07:54:06'),
(920, 42, 10, 2025, 'December', '2026-06-04', '2026-06-04', '2026-06-13', '2026-06-18', 0, NULL, NULL, '2026-04-04 07:54:06', '2026-04-04 07:54:06'),
(921, 43, 1, 2025, 'December', '2026-05-31', '2026-05-31', '2026-06-01', '2026-06-10', 0, NULL, NULL, '2026-04-04 07:54:06', '2026-04-04 07:54:06'),
(922, 43, 2, 2025, 'December', '2026-06-23', NULL, NULL, NULL, 0, NULL, NULL, '2026-04-04 07:54:06', '2026-04-04 07:54:06'),
(923, 43, 3, 2025, 'December', '2026-06-08', '2026-06-08', '2026-06-17', '2026-06-24', 0, NULL, NULL, '2026-04-04 07:54:06', '2026-04-04 07:54:06'),
(924, 43, 4, 2025, 'December', '2026-05-25', '2026-05-25', '2026-05-29', '2026-06-08', 0, NULL, NULL, '2026-04-04 07:54:06', '2026-04-04 07:54:06'),
(925, 43, 5, 2025, 'December', '2026-03-24', '2026-03-24', '2026-03-27', '2026-04-07', 0, NULL, NULL, '2026-04-04 07:54:06', '2026-04-04 07:54:06'),
(926, 43, 6, 2025, 'December', '2026-08-04', '2026-08-04', '2026-08-08', '2026-08-18', 0, NULL, NULL, '2026-04-04 07:54:06', '2026-04-04 07:54:06'),
(927, 43, 7, 2025, 'December', '2026-01-02', '2025-12-25', '2025-12-28', '2025-12-31', 0, NULL, NULL, '2026-04-04 07:54:06', '2026-04-04 07:54:06'),
(928, 43, 8, 2025, 'December', '2026-05-20', '2026-05-12', '2026-05-21', '2026-05-22', 0, NULL, NULL, '2026-04-04 07:54:06', '2026-04-04 07:54:06'),
(929, 43, 9, 2025, 'December', '2026-04-05', '2026-03-31', '2026-04-06', '2026-04-16', 0, NULL, NULL, '2026-04-04 07:54:06', '2026-04-04 07:54:06'),
(930, 43, 10, 2025, 'December', '2026-06-24', '2026-06-24', '2026-06-25', '2026-07-06', 0, NULL, NULL, '2026-04-04 07:54:06', '2026-04-04 07:54:06'),
(931, 44, 1, 2025, 'December', '2026-04-02', NULL, NULL, NULL, 0, NULL, NULL, '2026-04-04 07:54:06', '2026-04-04 07:54:06'),
(932, 44, 2, 2025, 'December', '2025-12-26', '2026-01-04', '2026-01-13', '2026-01-20', 0, NULL, NULL, '2026-04-04 07:54:06', '2026-04-04 07:54:06'),
(933, 44, 3, 2025, 'December', '2026-02-04', NULL, NULL, NULL, 0, NULL, NULL, '2026-04-04 07:54:06', '2026-04-04 07:54:06'),
(934, 44, 4, 2025, 'December', '2026-06-19', NULL, NULL, NULL, 0, NULL, NULL, '2026-04-04 07:54:06', '2026-04-04 07:54:06'),
(935, 44, 5, 2025, 'December', '2025-11-16', '2025-11-06', '2025-11-07', '2025-11-10', 0, NULL, NULL, '2026-04-04 07:54:06', '2026-04-04 07:54:06'),
(936, 44, 6, 2025, 'December', '2026-01-02', '2026-01-12', '2026-01-12', '2026-01-20', 0, NULL, NULL, '2026-04-04 07:54:06', '2026-04-04 07:54:06'),
(937, 44, 7, 2025, 'December', '2025-11-27', '2025-12-08', '2025-12-17', '2025-12-26', 0, NULL, NULL, '2026-04-04 07:54:06', '2026-04-04 07:54:06'),
(938, 44, 8, 2025, 'December', '2026-05-25', NULL, NULL, NULL, 0, NULL, NULL, '2026-04-04 07:54:06', '2026-04-04 07:54:06'),
(939, 44, 9, 2025, 'December', '2025-12-24', '2025-12-24', '2025-12-31', '2026-01-05', 0, NULL, NULL, '2026-04-04 07:54:06', '2026-04-04 07:54:06'),
(940, 44, 10, 2025, 'December', '2025-11-23', '2025-11-23', '2025-11-23', '2025-12-03', 0, NULL, NULL, '2026-04-04 07:54:06', '2026-04-04 07:54:06'),
(941, 45, 1, 2025, 'December', '2026-04-18', '2026-04-18', '2026-04-23', '2026-05-04', 0, NULL, NULL, '2026-04-04 07:54:06', '2026-04-04 07:54:06'),
(942, 45, 2, 2025, 'December', '2026-01-09', '2025-12-31', '2026-01-04', '2026-01-08', 0, NULL, NULL, '2026-04-04 07:54:06', '2026-04-04 07:54:06'),
(943, 45, 3, 2025, 'December', '2026-07-21', '2026-07-21', '2026-07-28', '2026-08-02', 0, NULL, NULL, '2026-04-04 07:54:06', '2026-04-04 07:54:06'),
(944, 45, 4, 2025, 'December', '2026-04-02', NULL, NULL, NULL, 0, NULL, NULL, '2026-04-04 07:54:06', '2026-04-04 07:54:06'),
(945, 45, 5, 2025, 'December', '2026-06-14', '2026-06-14', '2026-06-16', '2026-06-16', 0, NULL, NULL, '2026-04-04 07:54:06', '2026-04-04 07:54:06'),
(946, 45, 6, 2025, 'December', '2026-03-07', '2026-03-13', '2026-03-19', '2026-03-23', 0, NULL, NULL, '2026-04-04 07:54:06', '2026-04-04 07:54:06'),
(947, 45, 7, 2025, 'December', '2026-06-22', '2026-06-22', '2026-06-23', '2026-06-24', 0, NULL, NULL, '2026-04-04 07:54:06', '2026-04-04 07:54:06'),
(948, 45, 8, 2025, 'December', '2026-06-11', NULL, NULL, NULL, 0, NULL, NULL, '2026-04-04 07:54:06', '2026-04-04 07:54:06'),
(949, 45, 9, 2025, 'December', '2026-05-17', '2026-05-13', '2026-05-22', '2026-06-02', 0, NULL, NULL, '2026-04-04 07:54:06', '2026-04-04 07:54:06'),
(950, 45, 10, 2025, 'December', '2026-06-10', '2026-05-30', '2026-06-07', '2026-06-09', 0, NULL, NULL, '2026-04-04 07:54:06', '2026-04-04 07:54:06'),
(951, 46, 1, 2025, 'December', '2026-02-11', '2026-01-29', '2026-02-02', '2026-02-08', 0, NULL, NULL, '2026-04-04 07:54:06', '2026-04-04 07:54:06'),
(952, 46, 2, 2025, 'December', '2026-08-09', '2026-08-09', '2026-08-16', '2026-08-19', 0, NULL, NULL, '2026-04-04 07:54:06', '2026-04-04 07:54:06'),
(953, 46, 3, 2025, 'December', '2026-05-11', '2026-05-08', '2026-05-12', '2026-05-20', 0, NULL, NULL, '2026-04-04 07:54:06', '2026-04-04 07:54:06'),
(954, 46, 4, 2025, 'December', '2026-05-25', '2026-05-25', '2026-06-03', '2026-06-10', 0, NULL, NULL, '2026-04-04 07:54:06', '2026-04-04 07:54:06'),
(955, 46, 5, 2025, 'December', '2025-12-17', '2025-12-17', '2025-12-20', '2025-12-23', 0, NULL, NULL, '2026-04-04 07:54:06', '2026-04-04 07:54:06'),
(956, 46, 6, 2025, 'December', '2026-01-21', '2026-01-21', '2026-01-30', '2026-02-06', 0, NULL, NULL, '2026-04-04 07:54:06', '2026-04-04 07:54:06'),
(957, 46, 7, 2025, 'December', '2025-12-13', '2025-12-19', '2025-12-25', '2025-12-29', 0, NULL, NULL, '2026-04-04 07:54:06', '2026-04-04 07:54:06'),
(958, 46, 8, 2025, 'December', '2026-02-23', '2026-02-19', '2026-02-24', '2026-03-05', 0, NULL, NULL, '2026-04-04 07:54:06', '2026-04-04 07:54:06'),
(959, 46, 9, 2025, 'December', '2026-07-20', '2026-07-19', '2026-07-21', '2026-07-27', 0, NULL, NULL, '2026-04-04 07:54:06', '2026-04-04 07:54:06'),
(960, 46, 10, 2025, 'December', '2026-04-04', '2026-04-04', '2026-04-05', '2026-04-12', 0, NULL, NULL, '2026-04-04 07:54:06', '2026-04-04 07:54:06'),
(961, 47, 1, 2025, 'December', '2026-06-16', '2026-06-06', '2026-06-07', '2026-06-10', 0, NULL, NULL, '2026-04-04 07:54:06', '2026-04-04 07:54:06'),
(962, 47, 2, 2025, 'December', '2026-05-10', '2026-05-10', '2026-05-13', '2026-05-24', 0, NULL, NULL, '2026-04-04 07:54:06', '2026-04-04 07:54:06'),
(963, 47, 3, 2025, 'December', '2026-03-08', '2026-03-03', '2026-03-03', '2026-03-03', 0, NULL, NULL, '2026-04-04 07:54:06', '2026-04-04 07:54:06'),
(964, 47, 4, 2025, 'December', '2025-11-17', '2025-11-29', '2025-12-01', '2025-12-11', 0, NULL, NULL, '2026-04-04 07:54:06', '2026-04-04 07:54:06'),
(965, 47, 5, 2025, 'December', '2026-04-02', NULL, NULL, NULL, 0, NULL, NULL, '2026-04-04 07:54:06', '2026-04-04 07:54:06'),
(966, 47, 6, 2025, 'December', '2026-07-05', '2026-07-05', '2026-07-14', '2026-07-19', 0, NULL, NULL, '2026-04-04 07:54:06', '2026-04-04 07:54:06'),
(967, 47, 7, 2025, 'December', '2026-01-08', NULL, NULL, NULL, 0, NULL, NULL, '2026-04-04 07:54:06', '2026-04-04 07:54:06'),
(968, 47, 8, 2025, 'December', '2026-05-14', NULL, NULL, NULL, 0, NULL, NULL, '2026-04-04 07:54:06', '2026-04-04 07:54:06'),
(969, 47, 9, 2025, 'December', '2026-07-24', '2026-07-24', '2026-07-24', '2026-08-03', 0, NULL, NULL, '2026-04-04 07:54:06', '2026-04-04 07:54:06'),
(970, 47, 10, 2025, 'December', '2025-12-10', '2025-12-10', '2025-12-15', '2025-12-20', 0, NULL, NULL, '2026-04-04 07:54:06', '2026-04-04 07:54:06'),
(971, 48, 1, 2025, 'December', '2026-04-15', '2026-04-01', '2026-04-02', '2026-04-07', 0, NULL, NULL, '2026-04-04 07:54:06', '2026-04-04 07:54:06'),
(972, 48, 2, 2025, 'December', '2026-05-15', NULL, NULL, NULL, 0, NULL, NULL, '2026-04-04 07:54:06', '2026-04-04 07:54:06'),
(973, 48, 3, 2025, 'December', '2026-03-08', NULL, NULL, NULL, 0, NULL, NULL, '2026-04-04 07:54:06', '2026-04-04 07:54:06'),
(974, 48, 4, 2025, 'December', '2026-02-20', '2026-03-04', '2026-03-04', '2026-03-14', 0, NULL, NULL, '2026-04-04 07:54:06', '2026-04-04 07:54:06'),
(975, 48, 5, 2025, 'December', '2026-01-24', '2026-01-12', '2026-01-19', '2026-01-26', 0, NULL, NULL, '2026-04-04 07:54:06', '2026-04-04 07:54:06'),
(976, 48, 6, 2025, 'December', '2026-06-13', '2026-06-07', '2026-06-14', '2026-06-25', 0, NULL, NULL, '2026-04-04 07:54:06', '2026-04-04 07:54:06'),
(977, 48, 7, 2025, 'December', '2026-03-07', '2026-03-07', '2026-03-12', '2026-03-23', 0, NULL, NULL, '2026-04-04 07:54:06', '2026-04-04 07:54:06'),
(978, 48, 8, 2025, 'December', '2026-07-14', '2026-07-14', '2026-07-23', '2026-07-28', 0, NULL, NULL, '2026-04-04 07:54:06', '2026-04-04 07:54:06'),
(979, 48, 9, 2025, 'December', '2026-02-08', '2026-02-08', '2026-02-10', '2026-02-12', 0, NULL, NULL, '2026-04-04 07:54:06', '2026-04-04 07:54:06'),
(980, 48, 10, 2025, 'December', '2025-12-18', '2025-12-18', '2025-12-21', '2025-12-24', 0, NULL, NULL, '2026-04-04 07:54:06', '2026-04-04 07:54:06'),
(981, 49, 1, 2025, 'December', '2026-07-20', '2026-07-20', '2026-07-21', '2026-07-28', 0, NULL, NULL, '2026-04-04 07:54:06', '2026-04-04 07:54:06'),
(982, 49, 2, 2025, 'December', '2026-01-30', '2026-01-30', '2026-02-06', '2026-02-13', 0, NULL, NULL, '2026-04-04 07:54:06', '2026-04-04 07:54:06'),
(983, 49, 3, 2025, 'December', '2025-11-30', '2025-11-30', '2025-12-01', '2025-12-08', 0, NULL, NULL, '2026-04-04 07:54:06', '2026-04-04 07:54:06'),
(984, 49, 4, 2025, 'December', '2026-04-02', NULL, NULL, NULL, 0, NULL, NULL, '2026-04-04 07:54:06', '2026-04-04 07:54:06'),
(985, 49, 5, 2025, 'December', '2026-01-01', '2026-01-01', '2026-01-04', '2026-01-07', 0, NULL, NULL, '2026-04-04 07:54:06', '2026-04-04 07:54:06'),
(986, 49, 6, 2025, 'December', '2025-11-24', '2025-11-24', '2025-11-26', '2025-12-04', 0, NULL, NULL, '2026-04-04 07:54:06', '2026-04-04 07:54:06'),
(987, 49, 7, 2025, 'December', '2025-11-10', NULL, NULL, NULL, 0, NULL, NULL, '2026-04-04 07:54:06', '2026-04-04 07:54:06'),
(988, 49, 8, 2025, 'December', '2026-07-23', '2026-07-23', '2026-08-01', '2026-08-10', 0, NULL, NULL, '2026-04-04 07:54:06', '2026-04-04 07:54:06'),
(989, 49, 9, 2025, 'December', '2026-06-18', '2026-06-18', '2026-06-27', '2026-07-06', 0, NULL, NULL, '2026-04-04 07:54:06', '2026-04-04 07:54:06'),
(990, 49, 10, 2025, 'December', '2026-01-15', '2026-01-24', '2026-02-02', '2026-02-09', 0, NULL, NULL, '2026-04-04 07:54:06', '2026-04-04 07:54:06'),
(991, 50, 1, 2025, 'December', '2026-07-29', NULL, NULL, NULL, 0, NULL, NULL, '2026-04-04 07:54:06', '2026-04-04 07:54:06'),
(992, 50, 2, 2025, 'December', '2026-01-31', '2026-01-31', '2026-02-02', '2026-02-04', 0, NULL, NULL, '2026-04-04 07:54:06', '2026-04-04 07:54:06'),
(993, 50, 3, 2025, 'December', '2026-08-06', '2026-08-01', '2026-08-07', '2026-08-17', 0, NULL, NULL, '2026-04-04 07:54:06', '2026-04-04 07:54:06'),
(994, 50, 4, 2025, 'December', '2025-12-07', '2025-12-01', '2025-12-02', '2025-12-03', 0, NULL, NULL, '2026-04-04 07:54:06', '2026-04-04 07:54:06'),
(995, 50, 5, 2025, 'December', '2026-01-21', '2026-01-10', '2026-01-18', '2026-01-20', 0, NULL, NULL, '2026-04-04 07:54:06', '2026-04-04 07:54:06'),
(996, 50, 6, 2025, 'December', '2026-06-24', NULL, NULL, NULL, 0, NULL, NULL, '2026-04-04 07:54:06', '2026-04-04 07:54:06'),
(997, 50, 7, 2025, 'December', '2026-05-14', '2026-05-14', '2026-05-22', '2026-05-26', 0, NULL, NULL, '2026-04-04 07:54:06', '2026-04-04 07:54:06'),
(998, 50, 8, 2025, 'December', '2025-12-17', NULL, NULL, NULL, 0, NULL, NULL, '2026-04-04 07:54:06', '2026-04-04 07:54:06'),
(999, 50, 9, 2025, 'December', '2026-05-06', '2026-04-27', '2026-05-03', '2026-05-03', 0, NULL, NULL, '2026-04-04 07:54:06', '2026-04-04 07:54:06'),
(1000, 50, 10, 2025, 'December', '2026-01-03', '2025-12-24', '2025-12-31', '2026-01-01', 0, NULL, NULL, '2026-04-04 07:54:06', '2026-04-04 07:54:06'),
(1001, 1, 1, 2026, 'June', '2026-02-04', '2026-02-14', '2026-02-14', '2026-02-22', 0, NULL, NULL, '2026-04-04 07:54:06', '2026-04-04 07:54:06'),
(1002, 1, 2, 2026, 'June', '2026-05-07', '2026-04-27', '2026-04-28', '2026-05-01', 0, NULL, NULL, '2026-04-04 07:54:06', '2026-04-04 07:54:06'),
(1003, 1, 3, 2026, 'June', '2026-03-21', '2026-03-10', '2026-03-12', '2026-03-16', 0, NULL, NULL, '2026-04-04 07:54:06', '2026-04-04 07:54:06'),
(1004, 1, 4, 2026, 'June', '2026-01-23', '2026-01-12', '2026-01-14', '2026-01-18', 0, NULL, NULL, '2026-04-04 07:54:06', '2026-04-04 07:54:06'),
(1005, 1, 5, 2026, 'June', '2026-03-12', '2026-03-05', '2026-03-13', '2026-03-13', 0, NULL, NULL, '2026-04-04 07:54:06', '2026-04-04 07:54:06'),
(1006, 1, 6, 2026, 'June', '2026-02-19', '2026-03-01', '2026-03-01', '2026-03-09', 0, NULL, NULL, '2026-04-04 07:54:06', '2026-04-04 07:54:06'),
(1007, 1, 7, 2026, 'June', '2025-12-03', '2025-11-21', '2025-11-24', '2025-11-29', 0, NULL, NULL, '2026-04-04 07:54:06', '2026-04-04 07:54:06'),
(1008, 1, 8, 2026, 'June', '2026-04-02', NULL, NULL, NULL, 0, NULL, NULL, '2026-04-04 07:54:06', '2026-04-04 07:54:06'),
(1009, 1, 9, 2026, 'June', '2026-03-19', '2026-03-08', '2026-03-10', '2026-03-14', 0, NULL, NULL, '2026-04-04 07:54:06', '2026-04-04 07:54:06'),
(1010, 1, 10, 2026, 'June', '2025-12-23', '2025-12-20', '2025-12-28', '2026-01-07', 0, NULL, NULL, '2026-04-04 07:54:06', '2026-04-04 07:54:06'),
(1011, 2, 1, 2026, 'June', '2026-05-12', '2026-05-12', '2026-05-14', '2026-05-22', 0, NULL, NULL, '2026-04-04 07:54:06', '2026-04-04 07:54:06'),
(1012, 2, 2, 2026, 'June', '2026-03-24', '2026-03-26', '2026-03-28', '2026-03-28', 0, NULL, NULL, '2026-04-04 07:54:06', '2026-04-04 07:54:06'),
(1013, 2, 3, 2026, 'June', '2026-05-25', '2026-05-13', '2026-05-16', '2026-05-21', 0, NULL, NULL, '2026-04-04 07:54:06', '2026-04-04 07:54:06'),
(1014, 2, 4, 2026, 'June', '2026-04-07', '2026-04-06', '2026-04-12', '2026-04-20', 0, NULL, NULL, '2026-04-04 07:54:06', '2026-04-04 07:54:06'),
(1015, 2, 5, 2026, 'June', '2026-03-25', NULL, NULL, NULL, 0, NULL, NULL, '2026-04-04 07:54:06', '2026-04-04 07:54:06'),
(1016, 2, 6, 2026, 'June', '2026-03-18', '2026-03-29', '2026-04-07', '2026-04-16', 0, NULL, NULL, '2026-04-04 07:54:06', '2026-04-04 07:54:06'),
(1017, 2, 7, 2026, 'June', '2026-03-11', '2026-03-18', '2026-03-25', '2026-03-30', 0, NULL, NULL, '2026-04-04 07:54:06', '2026-04-04 07:54:06'),
(1018, 2, 8, 2026, 'June', '2026-06-26', NULL, NULL, NULL, 0, NULL, NULL, '2026-04-04 07:54:06', '2026-04-04 07:54:06'),
(1019, 2, 9, 2026, 'June', '2026-02-25', '2026-02-21', '2026-02-26', '2026-03-07', 0, NULL, NULL, '2026-04-04 07:54:06', '2026-04-04 07:54:06'),
(1020, 2, 10, 2026, 'June', '2026-07-04', '2026-07-04', '2026-07-13', '2026-07-22', 0, NULL, NULL, '2026-04-04 07:54:06', '2026-04-04 07:54:06'),
(1021, 3, 1, 2026, 'June', '2025-11-03', NULL, NULL, NULL, 0, NULL, NULL, '2026-04-04 07:54:06', '2026-04-04 07:54:06'),
(1022, 3, 2, 2026, 'June', '2026-07-30', '2026-07-17', '2026-07-17', '2026-07-21', 0, NULL, NULL, '2026-04-04 07:54:06', '2026-04-04 07:54:06'),
(1023, 3, 3, 2026, 'June', '2026-06-10', '2026-06-08', '2026-06-15', '2026-06-24', 0, NULL, NULL, '2026-04-04 07:54:06', '2026-04-04 07:54:06'),
(1024, 3, 4, 2026, 'June', '2025-12-06', '2025-12-06', '2025-12-08', '2025-12-18', 0, NULL, NULL, '2026-04-04 07:54:06', '2026-04-04 07:54:06'),
(1025, 3, 5, 2026, 'June', '2026-04-13', NULL, NULL, NULL, 0, NULL, NULL, '2026-04-04 07:54:06', '2026-04-04 07:54:06'),
(1026, 3, 6, 2026, 'June', '2026-04-02', NULL, NULL, NULL, 0, NULL, NULL, '2026-04-04 07:54:06', '2026-04-04 07:54:06'),
(1027, 3, 7, 2026, 'June', '2026-01-15', NULL, NULL, NULL, 0, NULL, NULL, '2026-04-04 07:54:06', '2026-04-04 07:54:06'),
(1028, 3, 8, 2026, 'June', '2026-02-13', NULL, NULL, NULL, 0, NULL, NULL, '2026-04-04 07:54:06', '2026-04-04 07:54:06'),
(1029, 3, 9, 2026, 'June', '2026-04-17', NULL, NULL, NULL, 0, NULL, NULL, '2026-04-04 07:54:06', '2026-04-04 07:54:06'),
(1030, 3, 10, 2026, 'June', '2026-04-02', NULL, NULL, NULL, 0, NULL, NULL, '2026-04-04 07:54:06', '2026-04-04 07:54:06'),
(1031, 4, 1, 2026, 'June', '2026-08-18', '2026-08-18', '2026-08-21', '2026-08-30', 0, NULL, NULL, '2026-04-04 07:54:06', '2026-04-04 07:54:06'),
(1032, 4, 2, 2026, 'June', '2026-02-25', '2026-02-25', '2026-02-28', '2026-03-11', 0, NULL, NULL, '2026-04-04 07:54:06', '2026-04-04 07:54:06'),
(1033, 4, 3, 2026, 'June', '2026-01-21', '2026-01-09', '2026-01-16', '2026-01-23', 0, NULL, NULL, '2026-04-04 07:54:06', '2026-04-04 07:54:06'),
(1034, 4, 4, 2026, 'June', '2026-01-30', '2026-02-02', '2026-02-05', '2026-02-06', 0, NULL, NULL, '2026-04-04 07:54:06', '2026-04-04 07:54:06'),
(1035, 4, 5, 2026, 'June', '2026-04-02', NULL, NULL, NULL, 0, NULL, NULL, '2026-04-04 07:54:06', '2026-04-04 07:54:06'),
(1036, 4, 6, 2026, 'June', '2026-05-30', '2026-05-18', '2026-05-25', '2026-06-01', 0, NULL, NULL, '2026-04-04 07:54:06', '2026-04-04 07:54:06'),
(1037, 4, 7, 2026, 'June', '2025-11-25', '2025-11-25', '2025-11-27', '2025-12-05', 0, NULL, NULL, '2026-04-04 07:54:06', '2026-04-04 07:54:06'),
(1038, 4, 8, 2026, 'June', '2026-01-12', '2026-01-12', '2026-01-17', '2026-01-28', 0, NULL, NULL, '2026-04-04 07:54:06', '2026-04-04 07:54:06'),
(1039, 4, 9, 2026, 'June', '2025-12-26', '2025-12-22', '2025-12-31', '2026-01-11', 0, NULL, NULL, '2026-04-04 07:54:06', '2026-04-04 07:54:06'),
(1040, 4, 10, 2026, 'June', '2025-12-02', '2025-11-26', '2025-11-27', '2025-11-28', 0, NULL, NULL, '2026-04-04 07:54:06', '2026-04-04 07:54:06'),
(1041, 5, 1, 2026, 'June', '2025-12-20', '2025-12-20', '2025-12-23', '2026-01-01', 0, NULL, NULL, '2026-04-04 07:54:06', '2026-04-04 07:54:06'),
(1042, 5, 2, 2026, 'June', '2026-01-26', '2026-02-06', '2026-02-07', '2026-02-16', 0, NULL, NULL, '2026-04-04 07:54:06', '2026-04-04 07:54:06'),
(1043, 5, 3, 2026, 'June', '2026-07-17', '2026-07-11', '2026-07-12', '2026-07-13', 0, NULL, NULL, '2026-04-04 07:54:06', '2026-04-04 07:54:06'),
(1044, 5, 4, 2026, 'June', '2026-04-13', '2026-04-13', '2026-04-16', '2026-04-17', 0, NULL, NULL, '2026-04-04 07:54:06', '2026-04-04 07:54:06'),
(1045, 5, 5, 2026, 'June', '2026-04-02', NULL, NULL, NULL, 0, NULL, NULL, '2026-04-04 07:54:06', '2026-04-04 07:54:06'),
(1046, 5, 6, 2026, 'June', '2026-02-18', '2026-02-04', '2026-02-05', '2026-02-10', 0, NULL, NULL, '2026-04-04 07:54:06', '2026-04-04 07:54:06'),
(1047, 5, 7, 2026, 'June', '2026-02-02', '2026-02-14', '2026-02-16', '2026-02-26', 0, NULL, NULL, '2026-04-04 07:54:06', '2026-04-04 07:54:06'),
(1048, 5, 8, 2026, 'June', '2026-06-07', '2026-06-05', '2026-06-12', '2026-06-21', 0, NULL, NULL, '2026-04-04 07:54:06', '2026-04-04 07:54:06'),
(1049, 5, 9, 2026, 'June', '2026-07-11', '2026-07-11', '2026-07-16', '2026-07-21', 0, NULL, NULL, '2026-04-04 07:54:06', '2026-04-04 07:54:06'),
(1050, 5, 10, 2026, 'June', '2026-04-02', NULL, NULL, NULL, 0, NULL, NULL, '2026-04-04 07:54:06', '2026-04-04 07:54:06'),
(1051, 6, 1, 2026, 'June', '2026-08-16', '2026-08-16', '2026-08-16', '2026-08-22', 0, NULL, NULL, '2026-04-04 07:54:06', '2026-04-04 07:54:06'),
(1052, 6, 2, 2026, 'June', '2026-08-10', '2026-07-31', '2026-08-07', '2026-08-08', 0, NULL, NULL, '2026-04-04 07:54:06', '2026-04-04 07:54:06'),
(1053, 6, 3, 2026, 'June', '2026-06-24', '2026-06-23', '2026-06-25', '2026-07-01', 0, NULL, NULL, '2026-04-04 07:54:06', '2026-04-04 07:54:06'),
(1054, 6, 4, 2026, 'June', '2026-04-02', NULL, NULL, NULL, 0, NULL, NULL, '2026-04-04 07:54:06', '2026-04-04 07:54:06'),
(1055, 6, 5, 2026, 'June', '2026-06-21', '2026-06-21', '2026-06-27', '2026-07-03', 0, NULL, NULL, '2026-04-04 07:54:06', '2026-04-04 07:54:06'),
(1056, 6, 6, 2026, 'June', '2026-07-31', '2026-07-24', '2026-07-26', '2026-07-28', 0, NULL, NULL, '2026-04-04 07:54:06', '2026-04-04 07:54:06'),
(1057, 6, 7, 2026, 'June', '2026-04-02', NULL, NULL, NULL, 0, NULL, NULL, '2026-04-04 07:54:06', '2026-04-04 07:54:06'),
(1058, 6, 8, 2026, 'June', '2026-01-08', '2026-01-15', '2026-01-22', '2026-01-27', 0, NULL, NULL, '2026-04-04 07:54:06', '2026-04-04 07:54:06'),
(1059, 6, 9, 2026, 'June', '2026-06-21', '2026-06-18', '2026-06-26', '2026-07-06', 0, NULL, NULL, '2026-04-04 07:54:06', '2026-04-04 07:54:06'),
(1060, 6, 10, 2026, 'June', '2026-07-19', NULL, NULL, NULL, 0, NULL, NULL, '2026-04-04 07:54:06', '2026-04-04 07:54:06'),
(1061, 7, 1, 2026, 'June', '2025-11-19', '2025-11-19', '2025-11-20', '2025-12-01', 0, NULL, NULL, '2026-04-04 07:54:06', '2026-04-04 07:54:06'),
(1062, 7, 2, 2026, 'June', '2026-08-08', '2026-08-08', '2026-08-09', '2026-08-18', 0, NULL, NULL, '2026-04-04 07:54:06', '2026-04-04 07:54:06'),
(1063, 7, 3, 2026, 'June', '2026-03-17', '2026-03-17', '2026-03-17', '2026-03-27', 0, NULL, NULL, '2026-04-04 07:54:06', '2026-04-04 07:54:06'),
(1064, 7, 4, 2026, 'June', '2026-07-12', '2026-07-12', '2026-07-18', '2026-07-22', 0, NULL, NULL, '2026-04-04 07:54:06', '2026-04-04 07:54:06');
INSERT INTO `entity_reporting_matrix` (`id`, `entity_id`, `item_id`, `reporting_year`, `reporting_month`, `deadline_date`, `submission_date`, `reviewed_date`, `completed_date`, `is_deleted`, `created_by`, `updated_by`, `created_at`, `updated_at`) VALUES
(1065, 7, 5, 2026, 'June', '2026-06-07', '2026-06-07', '2026-06-11', '2026-06-11', 0, NULL, NULL, '2026-04-04 07:54:06', '2026-04-04 07:54:06'),
(1066, 7, 6, 2026, 'June', '2025-12-22', '2025-12-19', '2025-12-27', '2026-01-06', 0, NULL, NULL, '2026-04-04 07:54:06', '2026-04-04 07:54:06'),
(1067, 7, 7, 2026, 'June', '2026-08-16', '2026-08-16', '2026-08-23', '2026-08-26', 0, NULL, NULL, '2026-04-04 07:54:06', '2026-04-04 07:54:06'),
(1068, 7, 8, 2026, 'June', '2026-03-01', '2026-03-12', '2026-03-21', '2026-03-30', 0, NULL, NULL, '2026-04-04 07:54:06', '2026-04-04 07:54:06'),
(1069, 7, 9, 2026, 'June', '2026-03-08', '2026-03-08', '2026-03-12', '2026-03-22', 0, NULL, NULL, '2026-04-04 07:54:06', '2026-04-04 07:54:06'),
(1070, 7, 10, 2026, 'June', '2026-03-20', '2026-03-06', '2026-03-07', '2026-03-12', 0, NULL, NULL, '2026-04-04 07:54:06', '2026-04-04 07:54:06'),
(1071, 8, 1, 2026, 'June', '2025-12-12', '2025-12-17', '2025-12-22', '2025-12-25', 0, NULL, NULL, '2026-04-04 07:54:06', '2026-04-04 07:54:06'),
(1072, 8, 2, 2026, 'June', '2025-11-11', '2025-11-11', '2025-11-18', '2025-11-25', 0, NULL, NULL, '2026-04-04 07:54:06', '2026-04-04 07:54:06'),
(1073, 8, 3, 2026, 'June', '2026-07-26', '2026-07-26', '2026-07-30', '2026-07-30', 0, NULL, NULL, '2026-04-04 07:54:06', '2026-04-04 07:54:06'),
(1074, 8, 4, 2026, 'June', '2026-08-15', '2026-08-15', '2026-08-20', '2026-08-31', 0, NULL, NULL, '2026-04-04 07:54:06', '2026-04-04 07:54:06'),
(1075, 8, 5, 2026, 'June', '2025-12-16', '2025-12-16', '2025-12-20', '2025-12-24', 0, NULL, NULL, '2026-04-04 07:54:06', '2026-04-04 07:54:06'),
(1076, 8, 6, 2026, 'June', '2026-01-16', '2026-01-26', '2026-01-26', '2026-02-03', 0, NULL, NULL, '2026-04-04 07:54:06', '2026-04-04 07:54:06'),
(1077, 8, 7, 2026, 'June', '2026-04-02', NULL, NULL, NULL, 0, NULL, NULL, '2026-04-04 07:54:06', '2026-04-04 07:54:06'),
(1078, 8, 8, 2026, 'June', '2026-08-18', '2026-08-10', '2026-08-13', '2026-08-16', 0, NULL, NULL, '2026-04-04 07:54:06', '2026-04-04 07:54:06'),
(1079, 8, 9, 2026, 'June', '2025-12-17', '2025-12-08', '2025-12-14', '2025-12-14', 0, NULL, NULL, '2026-04-04 07:54:06', '2026-04-04 07:54:06'),
(1080, 8, 10, 2026, 'June', '2026-05-12', '2026-04-30', '2026-05-03', '2026-05-08', 0, NULL, NULL, '2026-04-04 07:54:06', '2026-04-04 07:54:06'),
(1081, 9, 1, 2026, 'June', '2026-08-01', '2026-07-22', '2026-07-29', '2026-07-30', 0, NULL, NULL, '2026-04-04 07:54:06', '2026-04-04 07:54:06'),
(1082, 9, 2, 2026, 'June', '2026-08-15', NULL, NULL, NULL, 0, NULL, NULL, '2026-04-04 07:54:06', '2026-04-04 07:54:06'),
(1083, 9, 3, 2026, 'June', '2026-07-31', '2026-07-22', '2026-07-26', '2026-07-30', 0, NULL, NULL, '2026-04-04 07:54:06', '2026-04-04 07:54:06'),
(1084, 9, 4, 2026, 'June', '2025-11-24', '2025-11-14', '2025-11-19', '2025-11-24', 0, NULL, NULL, '2026-04-04 07:54:06', '2026-04-04 07:54:06'),
(1085, 9, 5, 2026, 'June', '2026-07-24', '2026-07-24', '2026-07-26', '2026-07-28', 0, NULL, NULL, '2026-04-04 07:54:06', '2026-04-04 07:54:06'),
(1086, 9, 6, 2026, 'June', '2026-06-13', '2026-06-13', '2026-06-17', '2026-06-21', 0, NULL, NULL, '2026-04-04 07:54:06', '2026-04-04 07:54:06'),
(1087, 9, 7, 2026, 'June', '2026-01-20', '2026-01-20', '2026-01-22', '2026-01-22', 0, NULL, NULL, '2026-04-04 07:54:06', '2026-04-04 07:54:06'),
(1088, 9, 8, 2026, 'June', '2026-01-16', '2026-01-16', '2026-01-23', '2026-01-26', 0, NULL, NULL, '2026-04-04 07:54:06', '2026-04-04 07:54:06'),
(1089, 9, 9, 2026, 'June', '2025-12-08', '2025-12-08', '2025-12-12', '2025-12-16', 0, NULL, NULL, '2026-04-04 07:54:06', '2026-04-04 07:54:06'),
(1090, 9, 10, 2026, 'June', '2026-01-08', '2025-12-26', '2025-12-30', '2026-01-05', 0, NULL, NULL, '2026-04-04 07:54:06', '2026-04-04 07:54:06'),
(1091, 10, 1, 2026, 'June', '2026-01-28', '2026-01-28', '2026-01-31', '2026-02-11', 0, NULL, NULL, '2026-04-04 07:54:06', '2026-04-04 07:54:06'),
(1092, 10, 2, 2026, 'June', '2026-03-11', '2026-03-11', '2026-03-16', '2026-03-19', 0, NULL, NULL, '2026-04-04 07:54:06', '2026-04-04 07:54:06'),
(1093, 10, 3, 2026, 'June', '2026-02-08', '2026-02-21', '2026-02-22', '2026-03-05', 0, NULL, NULL, '2026-04-04 07:54:06', '2026-04-04 07:54:06'),
(1094, 10, 4, 2026, 'June', '2026-04-02', NULL, NULL, NULL, 0, NULL, NULL, '2026-04-04 07:54:06', '2026-04-04 07:54:06'),
(1095, 10, 5, 2026, 'June', '2025-11-17', '2025-11-10', '2025-11-18', '2025-11-18', 0, NULL, NULL, '2026-04-04 07:54:06', '2026-04-04 07:54:06'),
(1096, 10, 6, 2026, 'June', '2025-11-27', '2025-11-27', '2025-11-30', '2025-12-11', 0, NULL, NULL, '2026-04-04 07:54:06', '2026-04-04 07:54:06'),
(1097, 10, 7, 2026, 'June', '2026-05-26', '2026-05-17', '2026-05-23', '2026-05-23', 0, NULL, NULL, '2026-04-04 07:54:06', '2026-04-04 07:54:06'),
(1098, 10, 8, 2026, 'June', '2026-07-20', '2026-07-14', '2026-07-21', '2026-08-01', 0, NULL, NULL, '2026-04-04 07:54:06', '2026-04-04 07:54:06'),
(1099, 10, 9, 2026, 'June', '2026-08-22', '2026-08-22', '2026-08-23', '2026-08-30', 0, NULL, NULL, '2026-04-04 07:54:06', '2026-04-04 07:54:06'),
(1100, 10, 10, 2026, 'June', '2026-03-12', '2026-03-03', '2026-03-07', '2026-03-11', 0, NULL, NULL, '2026-04-04 07:54:06', '2026-04-04 07:54:06'),
(1101, 11, 1, 2026, 'June', '2026-06-21', '2026-06-21', '2026-06-22', '2026-07-01', 0, NULL, NULL, '2026-04-04 07:54:06', '2026-04-04 07:54:06'),
(1102, 11, 2, 2026, 'June', '2026-01-26', '2026-01-15', '2026-01-21', '2026-01-27', 0, NULL, NULL, '2026-04-04 07:54:07', '2026-04-04 07:54:07'),
(1103, 11, 3, 2026, 'June', '2026-02-24', '2026-02-24', '2026-02-27', '2026-03-10', 0, NULL, NULL, '2026-04-04 07:54:07', '2026-04-04 07:54:07'),
(1104, 11, 4, 2026, 'June', '2025-12-12', NULL, NULL, NULL, 0, NULL, NULL, '2026-04-04 07:54:07', '2026-04-04 07:54:07'),
(1105, 11, 5, 2026, 'June', '2026-04-02', NULL, NULL, NULL, 0, NULL, NULL, '2026-04-04 07:54:07', '2026-04-04 07:54:07'),
(1106, 11, 6, 2026, 'June', '2025-11-12', '2025-11-12', '2025-11-17', '2025-11-20', 0, NULL, NULL, '2026-04-04 07:54:07', '2026-04-04 07:54:07'),
(1107, 11, 7, 2026, 'June', '2026-06-03', '2026-05-29', '2026-05-29', '2026-05-29', 0, NULL, NULL, '2026-04-04 07:54:07', '2026-04-04 07:54:07'),
(1108, 11, 8, 2026, 'June', '2025-12-05', NULL, NULL, NULL, 0, NULL, NULL, '2026-04-04 07:54:07', '2026-04-04 07:54:07'),
(1109, 11, 9, 2026, 'June', '2026-08-22', '2026-08-10', '2026-08-19', '2026-08-22', 0, NULL, NULL, '2026-04-04 07:54:07', '2026-04-04 07:54:07'),
(1110, 11, 10, 2026, 'June', '2026-05-04', NULL, NULL, NULL, 0, NULL, NULL, '2026-04-04 07:54:07', '2026-04-04 07:54:07'),
(1111, 12, 1, 2026, 'June', '2026-02-06', '2026-01-28', '2026-01-28', '2026-01-30', 0, NULL, NULL, '2026-04-04 07:54:07', '2026-04-04 07:54:07'),
(1112, 12, 2, 2026, 'June', '2026-05-12', '2026-05-12', '2026-05-13', '2026-05-20', 0, NULL, NULL, '2026-04-04 07:54:07', '2026-04-04 07:54:07'),
(1113, 12, 3, 2026, 'June', '2026-08-21', '2026-08-08', '2026-08-16', '2026-08-24', 0, NULL, NULL, '2026-04-04 07:54:07', '2026-04-04 07:54:07'),
(1114, 12, 4, 2026, 'June', '2026-04-10', '2026-04-10', '2026-04-14', '2026-04-16', 0, NULL, NULL, '2026-04-04 07:54:07', '2026-04-04 07:54:07'),
(1115, 12, 5, 2026, 'June', '2025-11-24', '2025-11-28', '2025-12-02', '2025-12-04', 0, NULL, NULL, '2026-04-04 07:54:07', '2026-04-04 07:54:07'),
(1116, 12, 6, 2026, 'June', '2026-07-08', '2026-06-25', '2026-07-03', '2026-07-11', 0, NULL, NULL, '2026-04-04 07:54:07', '2026-04-04 07:54:07'),
(1117, 12, 7, 2026, 'June', '2026-05-18', '2026-05-18', '2026-05-27', '2026-06-01', 0, NULL, NULL, '2026-04-04 07:54:07', '2026-04-04 07:54:07'),
(1118, 12, 8, 2026, 'June', '2026-08-15', '2026-08-15', '2026-08-16', '2026-08-23', 0, NULL, NULL, '2026-04-04 07:54:07', '2026-04-04 07:54:07'),
(1119, 12, 9, 2026, 'June', '2025-12-05', '2025-12-05', '2025-12-13', '2025-12-21', 0, NULL, NULL, '2026-04-04 07:54:07', '2026-04-04 07:54:07'),
(1120, 12, 10, 2026, 'June', '2026-07-24', '2026-07-10', '2026-07-15', '2026-07-22', 0, NULL, NULL, '2026-04-04 07:54:07', '2026-04-04 07:54:07'),
(1121, 13, 1, 2026, 'June', '2026-01-21', '2026-01-21', '2026-01-22', '2026-01-23', 0, NULL, NULL, '2026-04-04 07:54:07', '2026-04-04 07:54:07'),
(1122, 13, 2, 2026, 'June', '2026-07-14', '2026-07-14', '2026-07-17', '2026-07-18', 0, NULL, NULL, '2026-04-04 07:54:07', '2026-04-04 07:54:07'),
(1123, 13, 3, 2026, 'June', '2026-08-19', '2026-08-19', '2026-08-21', '2026-08-31', 0, NULL, NULL, '2026-04-04 07:54:07', '2026-04-04 07:54:07'),
(1124, 13, 4, 2026, 'June', '2026-08-01', '2026-07-21', '2026-07-27', '2026-08-02', 0, NULL, NULL, '2026-04-04 07:54:07', '2026-04-04 07:54:07'),
(1125, 13, 5, 2026, 'June', '2025-12-24', '2026-01-01', '2026-01-09', '2026-01-15', 0, NULL, NULL, '2026-04-04 07:54:07', '2026-04-04 07:54:07'),
(1126, 13, 6, 2026, 'June', '2026-01-06', '2026-01-06', '2026-01-10', '2026-01-12', 0, NULL, NULL, '2026-04-04 07:54:07', '2026-04-04 07:54:07'),
(1127, 13, 7, 2026, 'June', '2026-02-22', NULL, NULL, NULL, 0, NULL, NULL, '2026-04-04 07:54:07', '2026-04-04 07:54:07'),
(1128, 13, 8, 2026, 'June', '2026-04-30', '2026-04-20', '2026-04-27', '2026-04-28', 0, NULL, NULL, '2026-04-04 07:54:07', '2026-04-04 07:54:07'),
(1129, 13, 9, 2026, 'June', '2025-12-09', '2025-11-26', '2025-11-30', '2025-12-06', 0, NULL, NULL, '2026-04-04 07:54:07', '2026-04-04 07:54:07'),
(1130, 13, 10, 2026, 'June', '2026-01-24', '2026-01-24', '2026-01-30', '2026-02-03', 0, NULL, NULL, '2026-04-04 07:54:07', '2026-04-04 07:54:07'),
(1131, 14, 1, 2026, 'June', '2025-12-12', '2025-11-29', '2025-11-29', '2025-12-03', 0, NULL, NULL, '2026-04-04 07:54:07', '2026-04-04 07:54:07'),
(1132, 14, 2, 2026, 'June', '2026-02-05', '2026-01-29', '2026-02-06', '2026-02-06', 0, NULL, NULL, '2026-04-04 07:54:07', '2026-04-04 07:54:07'),
(1133, 14, 3, 2026, 'June', '2026-04-16', NULL, NULL, NULL, 0, NULL, NULL, '2026-04-04 07:54:07', '2026-04-04 07:54:07'),
(1134, 14, 4, 2026, 'June', '2026-05-02', '2026-05-02', '2026-05-04', '2026-05-04', 0, NULL, NULL, '2026-04-04 07:54:07', '2026-04-04 07:54:07'),
(1135, 14, 5, 2026, 'June', '2026-05-02', NULL, NULL, NULL, 0, NULL, NULL, '2026-04-04 07:54:07', '2026-04-04 07:54:07'),
(1136, 14, 6, 2026, 'June', '2026-02-08', '2026-02-19', '2026-02-20', '2026-03-01', 0, NULL, NULL, '2026-04-04 07:54:07', '2026-04-04 07:54:07'),
(1137, 14, 7, 2026, 'June', '2026-03-28', '2026-03-28', '2026-03-29', '2026-03-30', 0, NULL, NULL, '2026-04-04 07:54:07', '2026-04-04 07:54:07'),
(1138, 14, 8, 2026, 'June', '2026-07-27', NULL, NULL, NULL, 0, NULL, NULL, '2026-04-04 07:54:07', '2026-04-04 07:54:07'),
(1139, 14, 9, 2026, 'June', '2026-01-17', '2026-01-17', '2026-01-18', '2026-01-27', 0, NULL, NULL, '2026-04-04 07:54:07', '2026-04-04 07:54:07'),
(1140, 14, 10, 2026, 'June', '2025-11-20', '2025-11-20', '2025-11-20', '2025-11-30', 0, NULL, NULL, '2026-04-04 07:54:07', '2026-04-04 07:54:07'),
(1141, 15, 1, 2026, 'June', '2026-07-04', '2026-07-04', '2026-07-10', '2026-07-16', 0, NULL, NULL, '2026-04-04 07:54:07', '2026-04-04 07:54:07'),
(1142, 15, 2, 2026, 'June', '2026-08-11', NULL, NULL, NULL, 0, NULL, NULL, '2026-04-04 07:54:07', '2026-04-04 07:54:07'),
(1143, 15, 3, 2026, 'June', '2026-05-18', '2026-05-09', '2026-05-13', '2026-05-17', 0, NULL, NULL, '2026-04-04 07:54:07', '2026-04-04 07:54:07'),
(1144, 15, 4, 2026, 'June', '2026-02-09', NULL, NULL, NULL, 0, NULL, NULL, '2026-04-04 07:54:07', '2026-04-04 07:54:07'),
(1145, 15, 5, 2026, 'June', '2026-02-16', '2026-03-01', '2026-03-02', '2026-03-13', 0, NULL, NULL, '2026-04-04 07:54:07', '2026-04-04 07:54:07'),
(1146, 15, 6, 2026, 'June', '2026-08-08', '2026-08-08', '2026-08-11', '2026-08-20', 0, NULL, NULL, '2026-04-04 07:54:07', '2026-04-04 07:54:07'),
(1147, 15, 7, 2026, 'June', '2026-06-01', NULL, NULL, NULL, 0, NULL, NULL, '2026-04-04 07:54:07', '2026-04-04 07:54:07'),
(1148, 15, 8, 2026, 'June', '2026-07-11', NULL, NULL, NULL, 0, NULL, NULL, '2026-04-04 07:54:07', '2026-04-04 07:54:07'),
(1149, 15, 9, 2026, 'June', '2026-08-01', '2026-07-30', '2026-08-06', '2026-08-15', 0, NULL, NULL, '2026-04-04 07:54:07', '2026-04-04 07:54:07'),
(1150, 15, 10, 2026, 'June', '2025-12-13', '2025-12-22', '2025-12-31', '2026-01-07', 0, NULL, NULL, '2026-04-04 07:54:07', '2026-04-04 07:54:07'),
(1151, 16, 1, 2026, 'June', '2026-01-12', '2026-01-12', '2026-01-21', '2026-01-28', 0, NULL, NULL, '2026-04-04 07:54:07', '2026-04-04 07:54:07'),
(1152, 16, 2, 2026, 'June', '2026-08-05', NULL, NULL, NULL, 0, NULL, NULL, '2026-04-04 07:54:07', '2026-04-04 07:54:07'),
(1153, 16, 3, 2026, 'June', '2026-02-19', '2026-02-26', '2026-03-05', '2026-03-10', 0, NULL, NULL, '2026-04-04 07:54:07', '2026-04-04 07:54:07'),
(1154, 16, 4, 2026, 'June', '2026-01-17', '2026-01-17', '2026-01-18', '2026-01-25', 0, NULL, NULL, '2026-04-04 07:54:07', '2026-04-04 07:54:07'),
(1155, 16, 5, 2026, 'June', '2026-01-23', NULL, NULL, NULL, 0, NULL, NULL, '2026-04-04 07:54:07', '2026-04-04 07:54:07'),
(1156, 16, 6, 2026, 'June', '2026-02-06', NULL, NULL, NULL, 0, NULL, NULL, '2026-04-04 07:54:07', '2026-04-04 07:54:07'),
(1157, 16, 7, 2026, 'June', '2026-01-11', '2026-01-04', '2026-01-06', '2026-01-08', 0, NULL, NULL, '2026-04-04 07:54:07', '2026-04-04 07:54:07'),
(1158, 16, 8, 2026, 'June', '2026-08-14', '2026-08-10', '2026-08-15', '2026-08-24', 0, NULL, NULL, '2026-04-04 07:54:07', '2026-04-04 07:54:07'),
(1159, 16, 9, 2026, 'June', '2026-06-30', '2026-06-16', '2026-06-17', '2026-06-22', 0, NULL, NULL, '2026-04-04 07:54:07', '2026-04-04 07:54:07'),
(1160, 16, 10, 2026, 'June', '2025-11-26', '2025-11-20', '2025-11-27', '2025-12-08', 0, NULL, NULL, '2026-04-04 07:54:07', '2026-04-04 07:54:07'),
(1161, 17, 1, 2026, 'June', '2026-06-28', NULL, NULL, NULL, 0, NULL, NULL, '2026-04-04 07:54:07', '2026-04-04 07:54:07'),
(1162, 17, 2, 2026, 'June', '2026-03-03', '2026-03-15', '2026-03-17', '2026-03-27', 0, NULL, NULL, '2026-04-04 07:54:07', '2026-04-04 07:54:07'),
(1163, 17, 3, 2026, 'June', '2026-02-21', NULL, NULL, NULL, 0, NULL, NULL, '2026-04-04 07:54:07', '2026-04-04 07:54:07'),
(1164, 17, 4, 2026, 'June', '2026-02-16', '2026-02-12', '2026-02-21', '2026-03-04', 0, NULL, NULL, '2026-04-04 07:54:07', '2026-04-04 07:54:07'),
(1165, 17, 5, 2026, 'June', '2026-04-06', '2026-03-24', '2026-03-24', '2026-03-28', 0, NULL, NULL, '2026-04-04 07:54:07', '2026-04-04 07:54:07'),
(1166, 17, 6, 2026, 'June', '2026-01-12', '2026-01-12', '2026-01-15', '2026-01-18', 0, NULL, NULL, '2026-04-04 07:54:07', '2026-04-04 07:54:07'),
(1167, 17, 7, 2026, 'June', '2026-04-15', NULL, NULL, NULL, 0, NULL, NULL, '2026-04-04 07:54:07', '2026-04-04 07:54:07'),
(1168, 17, 8, 2026, 'June', '2026-03-13', '2026-03-13', '2026-03-16', '2026-03-19', 0, NULL, NULL, '2026-04-04 07:54:07', '2026-04-04 07:54:07'),
(1169, 17, 9, 2026, 'June', '2026-04-20', '2026-04-20', '2026-04-23', '2026-05-04', 0, NULL, NULL, '2026-04-04 07:54:07', '2026-04-04 07:54:07'),
(1170, 17, 10, 2026, 'June', '2026-03-26', '2026-03-26', '2026-03-30', '2026-03-30', 0, NULL, NULL, '2026-04-04 07:54:07', '2026-04-04 07:54:07'),
(1171, 18, 1, 2026, 'June', '2026-08-15', '2026-08-01', '2026-08-02', '2026-08-07', 0, NULL, NULL, '2026-04-04 07:54:07', '2026-04-04 07:54:07'),
(1172, 18, 2, 2026, 'June', '2026-04-01', '2026-03-25', '2026-03-27', '2026-03-29', 0, NULL, NULL, '2026-04-04 07:54:07', '2026-04-04 07:54:07'),
(1173, 18, 3, 2026, 'June', '2026-05-18', '2026-05-08', '2026-05-09', '2026-05-12', 0, NULL, NULL, '2026-04-04 07:54:07', '2026-04-04 07:54:07'),
(1174, 18, 4, 2026, 'June', '2026-04-02', NULL, NULL, NULL, 0, NULL, NULL, '2026-04-04 07:54:07', '2026-04-04 07:54:07'),
(1175, 18, 5, 2026, 'June', '2026-05-16', '2026-05-02', '2026-05-03', '2026-05-08', 0, NULL, NULL, '2026-04-04 07:54:07', '2026-04-04 07:54:07'),
(1176, 18, 6, 2026, 'June', '2026-04-02', NULL, NULL, NULL, 0, NULL, NULL, '2026-04-04 07:54:07', '2026-04-04 07:54:07'),
(1177, 18, 7, 2026, 'June', '2026-02-06', '2026-01-24', '2026-02-01', '2026-02-09', 0, NULL, NULL, '2026-04-04 07:54:07', '2026-04-04 07:54:07'),
(1178, 18, 8, 2026, 'June', '2026-07-27', '2026-07-27', '2026-07-31', '2026-08-10', 0, NULL, NULL, '2026-04-04 07:54:07', '2026-04-04 07:54:07'),
(1179, 18, 9, 2026, 'June', '2026-05-30', '2026-05-30', '2026-06-04', '2026-06-07', 0, NULL, NULL, '2026-04-04 07:54:07', '2026-04-04 07:54:07'),
(1180, 18, 10, 2026, 'June', '2025-12-08', '2025-12-08', '2025-12-09', '2025-12-18', 0, NULL, NULL, '2026-04-04 07:54:07', '2026-04-04 07:54:07'),
(1181, 19, 1, 2026, 'June', '2026-04-08', NULL, NULL, NULL, 0, NULL, NULL, '2026-04-04 07:54:07', '2026-04-04 07:54:07'),
(1182, 19, 2, 2026, 'June', '2026-01-14', '2026-01-07', '2026-01-15', '2026-01-15', 0, NULL, NULL, '2026-04-04 07:54:07', '2026-04-04 07:54:07'),
(1183, 19, 3, 2026, 'June', '2026-05-20', '2026-05-20', '2026-05-29', '2026-06-07', 0, NULL, NULL, '2026-04-04 07:54:07', '2026-04-04 07:54:07'),
(1184, 19, 4, 2026, 'June', '2026-01-17', '2026-01-27', '2026-01-27', '2026-02-04', 0, NULL, NULL, '2026-04-04 07:54:07', '2026-04-04 07:54:07'),
(1185, 19, 5, 2026, 'June', '2026-08-25', '2026-08-21', '2026-08-26', '2026-09-04', 0, NULL, NULL, '2026-04-04 07:54:07', '2026-04-04 07:54:07'),
(1186, 19, 6, 2026, 'June', '2026-08-29', '2026-08-29', '2026-09-03', '2026-09-04', 0, NULL, NULL, '2026-04-04 07:54:07', '2026-04-04 07:54:07'),
(1187, 19, 7, 2026, 'June', '2025-11-26', NULL, NULL, NULL, 0, NULL, NULL, '2026-04-04 07:54:07', '2026-04-04 07:54:07'),
(1188, 19, 8, 2026, 'June', '2025-11-28', '2025-11-28', '2025-12-06', '2025-12-10', 0, NULL, NULL, '2026-04-04 07:54:07', '2026-04-04 07:54:07'),
(1189, 19, 9, 2026, 'June', '2026-02-22', '2026-02-14', '2026-02-23', '2026-02-24', 0, NULL, NULL, '2026-04-04 07:54:07', '2026-04-04 07:54:07'),
(1190, 19, 10, 2026, 'June', '2026-01-30', '2026-02-11', '2026-02-13', '2026-02-23', 0, NULL, NULL, '2026-04-04 07:54:07', '2026-04-04 07:54:07'),
(1191, 20, 1, 2026, 'June', '2026-08-25', '2026-08-12', '2026-08-12', '2026-08-16', 0, NULL, NULL, '2026-04-04 07:54:07', '2026-04-04 07:54:07'),
(1192, 20, 2, 2026, 'June', '2026-02-21', '2026-02-21', '2026-02-25', '2026-02-27', 0, NULL, NULL, '2026-04-04 07:54:07', '2026-04-04 07:54:07'),
(1193, 20, 3, 2026, 'June', '2026-05-17', '2026-05-11', '2026-05-18', '2026-05-29', 0, NULL, NULL, '2026-04-04 07:54:07', '2026-04-04 07:54:07'),
(1194, 20, 4, 2026, 'June', '2025-12-18', '2025-12-18', '2025-12-18', '2025-12-26', 0, NULL, NULL, '2026-04-04 07:54:07', '2026-04-04 07:54:07'),
(1195, 20, 5, 2026, 'June', '2026-01-16', '2026-01-27', '2026-02-05', '2026-02-14', 0, NULL, NULL, '2026-04-04 07:54:07', '2026-04-04 07:54:07'),
(1196, 20, 6, 2026, 'June', '2026-04-02', NULL, NULL, NULL, 0, NULL, NULL, '2026-04-04 07:54:07', '2026-04-04 07:54:07'),
(1197, 20, 7, 2026, 'June', '2026-05-07', '2026-04-29', '2026-05-02', '2026-05-05', 0, NULL, NULL, '2026-04-04 07:54:07', '2026-04-04 07:54:07'),
(1198, 20, 8, 2026, 'June', '2026-03-02', '2026-03-02', '2026-03-08', '2026-03-14', 0, NULL, NULL, '2026-04-04 07:54:07', '2026-04-04 07:54:07'),
(1199, 20, 9, 2026, 'June', '2026-03-03', '2026-02-27', '2026-03-08', '2026-03-19', 0, NULL, NULL, '2026-04-04 07:54:07', '2026-04-04 07:54:07'),
(1200, 20, 10, 2026, 'June', '2026-02-03', '2026-02-03', '2026-02-08', '2026-02-09', 0, NULL, NULL, '2026-04-04 07:54:07', '2026-04-04 07:54:07'),
(1201, 21, 1, 2026, 'June', '2026-06-23', NULL, NULL, NULL, 0, NULL, NULL, '2026-04-04 07:54:07', '2026-04-04 07:54:07'),
(1202, 21, 2, 2026, 'June', '2026-07-12', '2026-07-03', '2026-07-09', '2026-07-09', 0, NULL, NULL, '2026-04-04 07:54:07', '2026-04-04 07:54:07'),
(1203, 21, 3, 2026, 'June', '2026-02-15', '2026-02-14', '2026-02-20', '2026-02-28', 0, NULL, NULL, '2026-04-04 07:54:07', '2026-04-04 07:54:07'),
(1204, 21, 4, 2026, 'June', '2026-07-16', '2026-07-09', '2026-07-17', '2026-07-17', 0, NULL, NULL, '2026-04-04 07:54:07', '2026-04-04 07:54:07'),
(1205, 21, 5, 2026, 'June', '2025-12-03', '2025-12-03', '2025-12-04', '2025-12-05', 0, NULL, NULL, '2026-04-04 07:54:07', '2026-04-04 07:54:07'),
(1206, 21, 6, 2026, 'June', '2026-04-14', '2026-04-14', '2026-04-15', '2026-04-16', 0, NULL, NULL, '2026-04-04 07:54:07', '2026-04-04 07:54:07'),
(1207, 21, 7, 2026, 'June', '2025-11-15', '2025-11-11', '2025-11-16', '2025-11-25', 0, NULL, NULL, '2026-04-04 07:54:07', '2026-04-04 07:54:07'),
(1208, 21, 8, 2026, 'June', '2026-03-30', '2026-04-09', '2026-04-09', '2026-04-17', 0, NULL, NULL, '2026-04-04 07:54:07', '2026-04-04 07:54:07'),
(1209, 21, 9, 2026, 'June', '2026-02-19', '2026-02-22', '2026-02-25', '2026-02-26', 0, NULL, NULL, '2026-04-04 07:54:07', '2026-04-04 07:54:07'),
(1210, 21, 10, 2026, 'June', '2026-03-18', '2026-03-13', '2026-03-19', '2026-03-29', 0, NULL, NULL, '2026-04-04 07:54:07', '2026-04-04 07:54:07'),
(1211, 22, 1, 2026, 'June', '2026-02-13', '2026-02-13', '2026-02-16', '2026-02-25', 0, NULL, NULL, '2026-04-04 07:54:07', '2026-04-04 07:54:07'),
(1212, 22, 2, 2026, 'June', '2025-11-28', '2025-12-05', '2025-12-12', '2025-12-17', 0, NULL, NULL, '2026-04-04 07:54:07', '2026-04-04 07:54:07'),
(1213, 22, 3, 2026, 'June', '2026-05-08', '2026-04-30', '2026-05-09', '2026-05-10', 0, NULL, NULL, '2026-04-04 07:54:07', '2026-04-04 07:54:07'),
(1214, 22, 4, 2026, 'June', '2026-02-02', '2026-02-13', '2026-02-22', '2026-03-03', 0, NULL, NULL, '2026-04-04 07:54:07', '2026-04-04 07:54:07'),
(1215, 22, 5, 2026, 'June', '2026-06-10', NULL, NULL, NULL, 0, NULL, NULL, '2026-04-04 07:54:07', '2026-04-04 07:54:07'),
(1216, 22, 6, 2026, 'June', '2026-06-18', NULL, NULL, NULL, 0, NULL, NULL, '2026-04-04 07:54:07', '2026-04-04 07:54:07'),
(1217, 22, 7, 2026, 'June', '2026-07-27', '2026-07-16', '2026-07-24', '2026-07-26', 0, NULL, NULL, '2026-04-04 07:54:07', '2026-04-04 07:54:07'),
(1218, 22, 8, 2026, 'June', '2026-04-02', NULL, NULL, NULL, 0, NULL, NULL, '2026-04-04 07:54:07', '2026-04-04 07:54:07'),
(1219, 22, 9, 2026, 'June', '2026-05-05', NULL, NULL, NULL, 0, NULL, NULL, '2026-04-04 07:54:07', '2026-04-04 07:54:07'),
(1220, 22, 10, 2026, 'June', '2026-05-31', '2026-05-22', '2026-05-22', '2026-05-24', 0, NULL, NULL, '2026-04-04 07:54:07', '2026-04-04 07:54:07'),
(1221, 23, 1, 2026, 'June', '2025-11-27', '2025-11-21', '2025-11-28', '2025-12-09', 0, NULL, NULL, '2026-04-04 07:54:07', '2026-04-04 07:54:07'),
(1222, 23, 2, 2026, 'June', '2026-07-20', '2026-07-20', '2026-07-22', '2026-07-30', 0, NULL, NULL, '2026-04-04 07:54:07', '2026-04-04 07:54:07'),
(1223, 23, 3, 2026, 'June', '2026-02-11', '2026-02-11', '2026-02-16', '2026-02-17', 0, NULL, NULL, '2026-04-04 07:54:07', '2026-04-04 07:54:07'),
(1224, 23, 4, 2026, 'June', '2025-12-11', '2025-12-11', '2025-12-16', '2025-12-19', 0, NULL, NULL, '2026-04-04 07:54:07', '2026-04-04 07:54:07'),
(1225, 23, 5, 2026, 'June', '2026-03-06', '2026-03-02', '2026-03-11', '2026-03-22', 0, NULL, NULL, '2026-04-04 07:54:07', '2026-04-04 07:54:07'),
(1226, 23, 6, 2026, 'June', '2026-07-08', NULL, NULL, NULL, 0, NULL, NULL, '2026-04-04 07:54:07', '2026-04-04 07:54:07'),
(1227, 23, 7, 2026, 'June', '2026-03-01', '2026-02-28', '2026-03-02', '2026-03-08', 0, NULL, NULL, '2026-04-04 07:54:07', '2026-04-04 07:54:07'),
(1228, 23, 8, 2026, 'June', '2025-12-24', NULL, NULL, NULL, 0, NULL, NULL, '2026-04-04 07:54:07', '2026-04-04 07:54:07'),
(1229, 23, 9, 2026, 'June', '2026-02-12', '2026-02-15', '2026-02-18', '2026-02-19', 0, NULL, NULL, '2026-04-04 07:54:07', '2026-04-04 07:54:07'),
(1230, 23, 10, 2026, 'June', '2026-03-11', '2026-03-11', '2026-03-16', '2026-03-19', 0, NULL, NULL, '2026-04-04 07:54:07', '2026-04-04 07:54:07'),
(1231, 24, 1, 2026, 'June', '2025-12-23', '2025-12-27', '2025-12-31', '2026-01-02', 0, NULL, NULL, '2026-04-04 07:54:07', '2026-04-04 07:54:07'),
(1232, 24, 2, 2026, 'June', '2026-04-20', '2026-04-12', '2026-04-15', '2026-04-18', 0, NULL, NULL, '2026-04-04 07:54:07', '2026-04-04 07:54:07'),
(1233, 24, 3, 2026, 'June', '2026-06-03', '2026-06-03', '2026-06-11', '2026-06-15', 0, NULL, NULL, '2026-04-04 07:54:07', '2026-04-04 07:54:07'),
(1234, 24, 4, 2026, 'June', '2026-07-28', '2026-07-27', '2026-07-29', '2026-08-04', 0, NULL, NULL, '2026-04-04 07:54:07', '2026-04-04 07:54:07'),
(1235, 24, 5, 2026, 'June', '2026-06-08', '2026-06-05', '2026-06-13', '2026-06-23', 0, NULL, NULL, '2026-04-04 07:54:07', '2026-04-04 07:54:07'),
(1236, 24, 6, 2026, 'June', '2026-06-12', '2026-06-12', '2026-06-14', '2026-06-22', 0, NULL, NULL, '2026-04-04 07:54:07', '2026-04-04 07:54:07'),
(1237, 24, 7, 2026, 'June', '2026-08-09', '2026-08-09', '2026-08-18', '2026-08-27', 0, NULL, NULL, '2026-04-04 07:54:07', '2026-04-04 07:54:07'),
(1238, 24, 8, 2026, 'June', '2026-04-19', NULL, NULL, NULL, 0, NULL, NULL, '2026-04-04 07:54:07', '2026-04-04 07:54:07'),
(1239, 24, 9, 2026, 'June', '2026-07-12', '2026-07-07', '2026-07-07', '2026-07-07', 0, NULL, NULL, '2026-04-04 07:54:07', '2026-04-04 07:54:07'),
(1240, 24, 10, 2026, 'June', '2026-01-07', '2026-01-19', '2026-01-19', '2026-01-29', 0, NULL, NULL, '2026-04-04 07:54:07', '2026-04-04 07:54:07'),
(1241, 25, 1, 2026, 'June', '2026-05-12', '2026-05-02', '2026-05-09', '2026-05-10', 0, NULL, NULL, '2026-04-04 07:54:07', '2026-04-04 07:54:07'),
(1242, 25, 2, 2026, 'June', '2026-06-27', '2026-06-27', '2026-06-28', '2026-07-07', 0, NULL, NULL, '2026-04-04 07:54:07', '2026-04-04 07:54:07'),
(1243, 25, 3, 2026, 'June', '2026-05-06', '2026-04-23', '2026-04-27', '2026-05-03', 0, NULL, NULL, '2026-04-04 07:54:07', '2026-04-04 07:54:07'),
(1244, 25, 4, 2026, 'June', '2025-11-06', NULL, NULL, NULL, 0, NULL, NULL, '2026-04-04 07:54:07', '2026-04-04 07:54:07'),
(1245, 25, 5, 2026, 'June', '2026-01-22', '2026-01-21', '2026-01-23', '2026-01-29', 0, NULL, NULL, '2026-04-04 07:54:07', '2026-04-04 07:54:07'),
(1246, 25, 6, 2026, 'June', '2026-07-26', '2026-07-26', '2026-08-03', '2026-08-09', 0, NULL, NULL, '2026-04-04 07:54:07', '2026-04-04 07:54:07'),
(1247, 25, 7, 2026, 'June', '2025-11-13', '2025-11-13', '2025-11-18', '2025-11-29', 0, NULL, NULL, '2026-04-04 07:54:07', '2026-04-04 07:54:07'),
(1248, 25, 8, 2026, 'June', '2026-03-12', '2026-03-12', '2026-03-13', '2026-03-22', 0, NULL, NULL, '2026-04-04 07:54:07', '2026-04-04 07:54:07'),
(1249, 25, 9, 2026, 'June', '2026-04-02', NULL, NULL, NULL, 0, NULL, NULL, '2026-04-04 07:54:07', '2026-04-04 07:54:07'),
(1250, 25, 10, 2026, 'June', '2026-06-23', '2026-06-23', '2026-07-02', '2026-07-09', 0, NULL, NULL, '2026-04-04 07:54:07', '2026-04-04 07:54:07'),
(1251, 26, 1, 2026, 'June', '2025-11-05', '2025-11-05', '2025-11-07', '2025-11-17', 0, NULL, NULL, '2026-04-04 07:54:07', '2026-04-04 07:54:07'),
(1252, 26, 2, 2026, 'June', '2026-07-30', NULL, NULL, NULL, 0, NULL, NULL, '2026-04-04 07:54:07', '2026-04-04 07:54:07'),
(1253, 26, 3, 2026, 'June', '2026-01-14', '2026-01-23', '2026-02-01', '2026-02-08', 0, NULL, NULL, '2026-04-04 07:54:07', '2026-04-04 07:54:07'),
(1254, 26, 4, 2026, 'June', '2026-02-18', '2026-02-18', '2026-02-24', '2026-03-02', 0, NULL, NULL, '2026-04-04 07:54:07', '2026-04-04 07:54:07'),
(1255, 26, 5, 2026, 'June', '2026-06-27', NULL, NULL, NULL, 0, NULL, NULL, '2026-04-04 07:54:07', '2026-04-04 07:54:07'),
(1256, 26, 6, 2026, 'June', '2026-02-27', '2026-02-27', '2026-02-28', '2026-03-11', 0, NULL, NULL, '2026-04-04 07:54:07', '2026-04-04 07:54:07'),
(1257, 26, 7, 2026, 'June', '2026-08-02', '2026-08-02', '2026-08-03', '2026-08-10', 0, NULL, NULL, '2026-04-04 07:54:07', '2026-04-04 07:54:07'),
(1258, 26, 8, 2026, 'June', '2026-01-06', '2026-01-18', '2026-01-20', '2026-01-30', 0, NULL, NULL, '2026-04-04 07:54:07', '2026-04-04 07:54:07'),
(1259, 26, 9, 2026, 'June', '2026-04-02', NULL, NULL, NULL, 0, NULL, NULL, '2026-04-04 07:54:07', '2026-04-04 07:54:07'),
(1260, 26, 10, 2026, 'June', '2026-07-18', NULL, NULL, NULL, 0, NULL, NULL, '2026-04-04 07:54:07', '2026-04-04 07:54:07'),
(1261, 27, 1, 2026, 'June', '2026-04-02', NULL, NULL, NULL, 0, NULL, NULL, '2026-04-04 07:54:07', '2026-04-04 07:54:07'),
(1262, 27, 2, 2026, 'June', '2026-03-21', '2026-03-21', '2026-03-23', '2026-04-02', 0, NULL, NULL, '2026-04-04 07:54:07', '2026-04-04 07:54:07'),
(1263, 27, 3, 2026, 'June', '2025-11-02', NULL, NULL, NULL, 0, NULL, NULL, '2026-04-04 07:54:07', '2026-04-04 07:54:07'),
(1264, 27, 4, 2026, 'June', '2026-01-14', '2026-01-14', '2026-01-14', '2026-01-22', 0, NULL, NULL, '2026-04-04 07:54:07', '2026-04-04 07:54:07'),
(1265, 27, 5, 2026, 'June', '2026-06-30', '2026-06-16', '2026-06-17', '2026-06-22', 0, NULL, NULL, '2026-04-04 07:54:07', '2026-04-04 07:54:07'),
(1266, 27, 6, 2026, 'June', '2026-08-29', '2026-08-29', '2026-09-02', '2026-09-12', 0, NULL, NULL, '2026-04-04 07:54:07', '2026-04-04 07:54:07'),
(1267, 27, 7, 2026, 'June', '2026-02-05', '2026-02-14', '2026-02-23', '2026-03-02', 0, NULL, NULL, '2026-04-04 07:54:07', '2026-04-04 07:54:07'),
(1268, 27, 8, 2026, 'June', '2026-03-08', '2026-02-23', '2026-02-27', '2026-03-05', 0, NULL, NULL, '2026-04-04 07:54:07', '2026-04-04 07:54:07'),
(1269, 27, 9, 2026, 'June', '2025-11-02', NULL, NULL, NULL, 0, NULL, NULL, '2026-04-04 07:54:07', '2026-04-04 07:54:07'),
(1270, 27, 10, 2026, 'June', '2026-07-01', '2026-06-21', '2026-06-26', '2026-07-01', 0, NULL, NULL, '2026-04-04 07:54:07', '2026-04-04 07:54:07'),
(1271, 28, 1, 2026, 'June', '2026-06-02', '2026-05-28', '2026-05-28', '2026-05-28', 0, NULL, NULL, '2026-04-04 07:54:07', '2026-04-04 07:54:07'),
(1272, 28, 2, 2026, 'June', '2026-06-18', NULL, NULL, NULL, 0, NULL, NULL, '2026-04-04 07:54:07', '2026-04-04 07:54:07'),
(1273, 28, 3, 2026, 'June', '2026-08-08', '2026-08-08', '2026-08-16', '2026-08-24', 0, NULL, NULL, '2026-04-04 07:54:07', '2026-04-04 07:54:07'),
(1274, 28, 4, 2026, 'June', '2025-11-12', NULL, NULL, NULL, 0, NULL, NULL, '2026-04-04 07:54:07', '2026-04-04 07:54:07'),
(1275, 28, 5, 2026, 'June', '2025-11-22', '2025-11-22', '2025-11-23', '2025-11-24', 0, NULL, NULL, '2026-04-04 07:54:07', '2026-04-04 07:54:07'),
(1276, 28, 6, 2026, 'June', '2026-07-09', '2026-07-02', '2026-07-10', '2026-07-10', 0, NULL, NULL, '2026-04-04 07:54:07', '2026-04-04 07:54:07'),
(1277, 28, 7, 2026, 'June', '2026-01-31', '2026-01-31', '2026-02-09', '2026-02-18', 0, NULL, NULL, '2026-04-04 07:54:07', '2026-04-04 07:54:07'),
(1278, 28, 8, 2026, 'June', '2026-01-03', '2025-12-21', '2025-12-29', '2026-01-06', 0, NULL, NULL, '2026-04-04 07:54:07', '2026-04-04 07:54:07'),
(1279, 28, 9, 2026, 'June', '2025-11-15', '2025-11-06', '2025-11-10', '2025-11-14', 0, NULL, NULL, '2026-04-04 07:54:07', '2026-04-04 07:54:07'),
(1280, 28, 10, 2026, 'June', '2026-04-02', NULL, NULL, NULL, 0, NULL, NULL, '2026-04-04 07:54:07', '2026-04-04 07:54:07'),
(1281, 29, 1, 2026, 'June', '2026-03-05', '2026-02-20', '2026-02-24', '2026-03-02', 0, NULL, NULL, '2026-04-04 07:54:07', '2026-04-04 07:54:07'),
(1282, 29, 2, 2026, 'June', '2026-07-23', '2026-07-19', '2026-07-28', '2026-08-08', 0, NULL, NULL, '2026-04-04 07:54:07', '2026-04-04 07:54:07'),
(1283, 29, 3, 2026, 'June', '2025-12-11', NULL, NULL, NULL, 0, NULL, NULL, '2026-04-04 07:54:07', '2026-04-04 07:54:07'),
(1284, 29, 4, 2026, 'June', '2026-07-28', '2026-07-25', '2026-08-02', '2026-08-12', 0, NULL, NULL, '2026-04-04 07:54:07', '2026-04-04 07:54:07'),
(1285, 29, 5, 2026, 'June', '2026-03-22', '2026-03-22', '2026-03-22', '2026-04-01', 0, NULL, NULL, '2026-04-04 07:54:07', '2026-04-04 07:54:07'),
(1286, 29, 6, 2026, 'June', '2026-04-02', NULL, NULL, NULL, 0, NULL, NULL, '2026-04-04 07:54:07', '2026-04-04 07:54:07'),
(1287, 29, 7, 2026, 'June', '2026-03-04', '2026-02-22', '2026-03-01', '2026-03-02', 0, NULL, NULL, '2026-04-04 07:54:07', '2026-04-04 07:54:07'),
(1288, 29, 8, 2026, 'June', '2025-11-01', '2025-11-03', '2025-11-05', '2025-11-05', 0, NULL, NULL, '2026-04-04 07:54:07', '2026-04-04 07:54:07'),
(1289, 29, 9, 2026, 'June', '2026-02-15', '2026-02-08', '2026-02-16', '2026-02-16', 0, NULL, NULL, '2026-04-04 07:54:07', '2026-04-04 07:54:07'),
(1290, 29, 10, 2026, 'June', '2026-08-15', NULL, NULL, NULL, 0, NULL, NULL, '2026-04-04 07:54:07', '2026-04-04 07:54:07'),
(1291, 30, 1, 2026, 'June', '2026-02-19', '2026-02-24', '2026-03-01', '2026-03-04', 0, NULL, NULL, '2026-04-04 07:54:07', '2026-04-04 07:54:07'),
(1292, 30, 2, 2026, 'June', '2025-12-01', '2025-12-01', '2025-12-01', '2025-12-09', 0, NULL, NULL, '2026-04-04 07:54:07', '2026-04-04 07:54:07'),
(1293, 30, 3, 2026, 'June', '2025-11-11', '2025-11-22', '2025-12-01', '2025-12-10', 0, NULL, NULL, '2026-04-04 07:54:07', '2026-04-04 07:54:07'),
(1294, 30, 4, 2026, 'June', '2026-06-11', '2026-06-03', '2026-06-06', '2026-06-09', 0, NULL, NULL, '2026-04-04 07:54:07', '2026-04-04 07:54:07'),
(1295, 30, 5, 2026, 'June', '2026-08-24', '2026-08-24', '2026-08-29', '2026-09-09', 0, NULL, NULL, '2026-04-04 07:54:07', '2026-04-04 07:54:07'),
(1296, 30, 6, 2026, 'June', '2026-07-23', '2026-07-23', '2026-07-28', '2026-08-02', 0, NULL, NULL, '2026-04-04 07:54:07', '2026-04-04 07:54:07'),
(1297, 30, 7, 2026, 'June', '2026-01-16', '2026-01-09', '2026-01-11', '2026-01-13', 0, NULL, NULL, '2026-04-04 07:54:07', '2026-04-04 07:54:07'),
(1298, 30, 8, 2026, 'June', '2026-04-02', NULL, NULL, NULL, 0, NULL, NULL, '2026-04-04 07:54:07', '2026-04-04 07:54:07'),
(1299, 30, 9, 2026, 'June', '2026-06-29', '2026-06-27', '2026-07-04', '2026-07-13', 0, NULL, NULL, '2026-04-04 07:54:07', '2026-04-04 07:54:07'),
(1300, 30, 10, 2026, 'June', '2025-11-02', '2025-11-14', '2025-11-14', '2025-11-24', 0, NULL, NULL, '2026-04-04 07:54:07', '2026-04-04 07:54:07'),
(1301, 31, 1, 2026, 'June', '2026-02-26', '2026-03-02', '2026-03-06', '2026-03-08', 0, NULL, NULL, '2026-04-04 07:54:07', '2026-04-04 07:54:07'),
(1302, 31, 2, 2026, 'June', '2026-08-28', '2026-08-23', '2026-08-29', '2026-09-08', 0, NULL, NULL, '2026-04-04 07:54:07', '2026-04-04 07:54:07'),
(1303, 31, 3, 2026, 'June', '2026-01-11', NULL, NULL, NULL, 0, NULL, NULL, '2026-04-04 07:54:07', '2026-04-04 07:54:07'),
(1304, 31, 4, 2026, 'June', '2026-01-01', '2026-01-13', '2026-01-13', '2026-01-23', 0, NULL, NULL, '2026-04-04 07:54:07', '2026-04-04 07:54:07'),
(1305, 31, 5, 2026, 'June', '2026-04-16', '2026-04-02', '2026-04-07', '2026-04-14', 0, NULL, NULL, '2026-04-04 07:54:07', '2026-04-04 07:54:07'),
(1306, 31, 6, 2026, 'June', '2025-11-06', '2025-11-11', '2025-11-16', '2025-11-19', 0, NULL, NULL, '2026-04-04 07:54:07', '2026-04-04 07:54:07'),
(1307, 31, 7, 2026, 'June', '2025-12-15', '2025-12-24', '2026-01-02', '2026-01-09', 0, NULL, NULL, '2026-04-04 07:54:07', '2026-04-04 07:54:07'),
(1308, 31, 8, 2026, 'June', '2025-11-14', '2025-11-14', '2025-11-16', '2025-11-18', 0, NULL, NULL, '2026-04-04 07:54:07', '2026-04-04 07:54:07'),
(1309, 31, 9, 2026, 'June', '2026-04-02', NULL, NULL, NULL, 0, NULL, NULL, '2026-04-04 07:54:07', '2026-04-04 07:54:07'),
(1310, 31, 10, 2026, 'June', '2026-08-22', '2026-08-22', '2026-08-25', '2026-08-28', 0, NULL, NULL, '2026-04-04 07:54:07', '2026-04-04 07:54:07'),
(1311, 32, 1, 2026, 'June', '2026-01-24', '2026-01-24', '2026-01-29', '2026-02-01', 0, NULL, NULL, '2026-04-04 07:54:07', '2026-04-04 07:54:07'),
(1312, 32, 2, 2026, 'June', '2026-01-28', '2026-01-16', '2026-01-25', '2026-01-28', 0, NULL, NULL, '2026-04-04 07:54:07', '2026-04-04 07:54:07'),
(1313, 32, 3, 2026, 'June', '2026-02-07', '2026-02-07', '2026-02-09', '2026-02-17', 0, NULL, NULL, '2026-04-04 07:54:07', '2026-04-04 07:54:07'),
(1314, 32, 4, 2026, 'June', '2026-08-11', '2026-08-11', '2026-08-12', '2026-08-23', 0, NULL, NULL, '2026-04-04 07:54:07', '2026-04-04 07:54:07'),
(1315, 32, 5, 2026, 'June', '2026-01-30', '2026-02-01', '2026-02-03', '2026-02-03', 0, NULL, NULL, '2026-04-04 07:54:07', '2026-04-04 07:54:07'),
(1316, 32, 6, 2026, 'June', '2026-04-02', NULL, NULL, NULL, 0, NULL, NULL, '2026-04-04 07:54:07', '2026-04-04 07:54:07'),
(1317, 32, 7, 2026, 'June', '2026-06-24', '2026-06-11', '2026-06-19', '2026-06-27', 0, NULL, NULL, '2026-04-04 07:54:07', '2026-04-04 07:54:07'),
(1318, 32, 8, 2026, 'June', '2026-07-28', '2026-07-20', '2026-07-23', '2026-07-26', 0, NULL, NULL, '2026-04-04 07:54:07', '2026-04-04 07:54:07'),
(1319, 32, 9, 2026, 'June', '2026-01-21', '2026-01-21', '2026-01-25', '2026-01-25', 0, NULL, NULL, '2026-04-04 07:54:07', '2026-04-04 07:54:07'),
(1320, 32, 10, 2026, 'June', '2026-01-05', '2026-01-05', '2026-01-05', '2026-01-15', 0, NULL, NULL, '2026-04-04 07:54:07', '2026-04-04 07:54:07'),
(1321, 33, 1, 2026, 'June', '2025-12-02', NULL, NULL, NULL, 0, NULL, NULL, '2026-04-04 07:54:07', '2026-04-04 07:54:07'),
(1322, 33, 2, 2026, 'June', '2026-01-24', '2026-01-24', '2026-01-25', '2026-02-05', 0, NULL, NULL, '2026-04-04 07:54:07', '2026-04-04 07:54:07'),
(1323, 33, 3, 2026, 'June', '2025-12-18', '2025-12-23', '2025-12-28', '2025-12-31', 0, NULL, NULL, '2026-04-04 07:54:07', '2026-04-04 07:54:07'),
(1324, 33, 4, 2026, 'June', '2025-12-25', '2025-12-13', '2025-12-16', '2025-12-21', 0, NULL, NULL, '2026-04-04 07:54:07', '2026-04-04 07:54:07'),
(1325, 33, 5, 2026, 'June', '2026-03-27', NULL, NULL, NULL, 0, NULL, NULL, '2026-04-04 07:54:07', '2026-04-04 07:54:07'),
(1326, 33, 6, 2026, 'June', '2026-03-21', '2026-03-21', '2026-03-26', '2026-04-06', 0, NULL, NULL, '2026-04-04 07:54:07', '2026-04-04 07:54:07'),
(1327, 33, 7, 2026, 'June', '2026-05-07', '2026-05-07', '2026-05-11', '2026-05-11', 0, NULL, NULL, '2026-04-04 07:54:07', '2026-04-04 07:54:07'),
(1328, 33, 8, 2026, 'June', '2026-08-16', '2026-08-16', '2026-08-25', '2026-09-01', 0, NULL, NULL, '2026-04-04 07:54:07', '2026-04-04 07:54:07'),
(1329, 33, 9, 2026, 'June', '2026-06-18', '2026-06-18', '2026-06-26', '2026-07-04', 0, NULL, NULL, '2026-04-04 07:54:07', '2026-04-04 07:54:07'),
(1330, 33, 10, 2026, 'June', '2026-07-19', '2026-07-07', '2026-07-16', '2026-07-19', 0, NULL, NULL, '2026-04-04 07:54:07', '2026-04-04 07:54:07'),
(1331, 34, 1, 2026, 'June', '2026-07-06', '2026-07-06', '2026-07-10', '2026-07-14', 0, NULL, NULL, '2026-04-04 07:54:07', '2026-04-04 07:54:07'),
(1332, 34, 2, 2026, 'June', '2026-06-29', '2026-06-26', '2026-07-04', '2026-07-14', 0, NULL, NULL, '2026-04-04 07:54:07', '2026-04-04 07:54:07'),
(1333, 34, 3, 2026, 'June', '2025-12-15', '2025-12-15', '2025-12-17', '2025-12-19', 0, NULL, NULL, '2026-04-04 07:54:07', '2026-04-04 07:54:07'),
(1334, 34, 4, 2026, 'June', '2026-04-02', NULL, NULL, NULL, 0, NULL, NULL, '2026-04-04 07:54:07', '2026-04-04 07:54:07'),
(1335, 34, 5, 2026, 'June', '2026-08-30', '2026-08-30', '2026-09-08', '2026-09-17', 0, NULL, NULL, '2026-04-04 07:54:07', '2026-04-04 07:54:07'),
(1336, 34, 6, 2026, 'June', '2026-03-05', '2026-03-13', '2026-03-21', '2026-03-27', 0, NULL, NULL, '2026-04-04 07:54:07', '2026-04-04 07:54:07'),
(1337, 34, 7, 2026, 'June', '2026-04-02', NULL, NULL, NULL, 0, NULL, NULL, '2026-04-04 07:54:07', '2026-04-04 07:54:07'),
(1338, 34, 8, 2026, 'June', '2026-08-14', '2026-08-14', '2026-08-14', '2026-08-24', 0, NULL, NULL, '2026-04-04 07:54:07', '2026-04-04 07:54:07'),
(1339, 34, 9, 2026, 'June', '2026-07-26', '2026-07-21', '2026-07-27', '2026-08-06', 0, NULL, NULL, '2026-04-04 07:54:07', '2026-04-04 07:54:07'),
(1340, 34, 10, 2026, 'June', '2026-03-04', '2026-02-27', '2026-03-05', '2026-03-15', 0, NULL, NULL, '2026-04-04 07:54:07', '2026-04-04 07:54:07'),
(1341, 35, 1, 2026, 'June', '2026-02-13', '2026-02-13', '2026-02-15', '2026-02-23', 0, NULL, NULL, '2026-04-04 07:54:07', '2026-04-04 07:54:07'),
(1342, 35, 2, 2026, 'June', '2026-03-27', '2026-03-27', '2026-04-05', '2026-04-12', 0, NULL, NULL, '2026-04-04 07:54:07', '2026-04-04 07:54:07'),
(1343, 35, 3, 2026, 'June', '2025-12-10', '2025-12-01', '2025-12-07', '2025-12-07', 0, NULL, NULL, '2026-04-04 07:54:07', '2026-04-04 07:54:07'),
(1344, 35, 4, 2026, 'June', '2026-08-08', '2026-07-26', '2026-07-26', '2026-07-30', 0, NULL, NULL, '2026-04-04 07:54:07', '2026-04-04 07:54:07'),
(1345, 35, 5, 2026, 'June', '2025-11-25', '2025-12-05', '2025-12-05', '2025-12-13', 0, NULL, NULL, '2026-04-04 07:54:07', '2026-04-04 07:54:07'),
(1346, 35, 6, 2026, 'June', '2026-01-26', '2026-01-15', '2026-01-17', '2026-01-21', 0, NULL, NULL, '2026-04-04 07:54:07', '2026-04-04 07:54:07'),
(1347, 35, 7, 2026, 'June', '2026-06-20', '2026-06-10', '2026-06-17', '2026-06-18', 0, NULL, NULL, '2026-04-04 07:54:07', '2026-04-04 07:54:07'),
(1348, 35, 8, 2026, 'June', '2026-04-02', NULL, NULL, NULL, 0, NULL, NULL, '2026-04-04 07:54:07', '2026-04-04 07:54:07'),
(1349, 35, 9, 2026, 'June', '2025-11-05', '2025-11-07', '2025-11-09', '2025-11-09', 0, NULL, NULL, '2026-04-04 07:54:07', '2026-04-04 07:54:07'),
(1350, 35, 10, 2026, 'June', '2025-12-09', '2025-12-09', '2025-12-10', '2025-12-17', 0, NULL, NULL, '2026-04-04 07:54:07', '2026-04-04 07:54:07'),
(1351, 36, 1, 2026, 'June', '2026-05-24', NULL, NULL, NULL, 0, NULL, NULL, '2026-04-04 07:54:07', '2026-04-04 07:54:07'),
(1352, 36, 2, 2026, 'June', '2025-12-07', '2025-12-09', '2025-12-11', '2025-12-11', 0, NULL, NULL, '2026-04-04 07:54:07', '2026-04-04 07:54:07'),
(1353, 36, 3, 2026, 'June', '2026-08-25', '2026-08-17', '2026-08-26', '2026-08-27', 0, NULL, NULL, '2026-04-04 07:54:07', '2026-04-04 07:54:07'),
(1354, 36, 4, 2026, 'June', '2026-06-14', '2026-06-14', '2026-06-23', '2026-06-28', 0, NULL, NULL, '2026-04-04 07:54:07', '2026-04-04 07:54:07'),
(1355, 36, 5, 2026, 'June', '2026-08-11', '2026-08-11', '2026-08-16', '2026-08-21', 0, NULL, NULL, '2026-04-04 07:54:07', '2026-04-04 07:54:07'),
(1356, 36, 6, 2026, 'June', '2026-04-19', '2026-04-09', '2026-04-16', '2026-04-17', 0, NULL, NULL, '2026-04-04 07:54:07', '2026-04-04 07:54:07'),
(1357, 36, 7, 2026, 'June', '2026-02-28', '2026-02-15', '2026-02-19', '2026-02-25', 0, NULL, NULL, '2026-04-04 07:54:07', '2026-04-04 07:54:07'),
(1358, 36, 8, 2026, 'June', '2026-08-15', '2026-08-15', '2026-08-15', '2026-08-23', 0, NULL, NULL, '2026-04-04 07:54:07', '2026-04-04 07:54:07'),
(1359, 36, 9, 2026, 'June', '2026-08-28', '2026-08-20', '2026-08-29', '2026-08-30', 0, NULL, NULL, '2026-04-04 07:54:07', '2026-04-04 07:54:07'),
(1360, 36, 10, 2026, 'June', '2025-11-09', '2025-11-09', '2025-11-18', '2025-11-23', 0, NULL, NULL, '2026-04-04 07:54:07', '2026-04-04 07:54:07'),
(1361, 37, 1, 2026, 'June', '2026-06-29', '2026-06-29', '2026-07-07', '2026-07-13', 0, NULL, NULL, '2026-04-04 07:54:07', '2026-04-04 07:54:07'),
(1362, 37, 2, 2026, 'June', '2026-05-28', '2026-05-28', '2026-05-28', '2026-06-05', 0, NULL, NULL, '2026-04-04 07:54:07', '2026-04-04 07:54:07'),
(1363, 37, 3, 2026, 'June', '2025-11-26', '2025-11-22', '2025-11-27', '2025-12-06', 0, NULL, NULL, '2026-04-04 07:54:07', '2026-04-04 07:54:07'),
(1364, 37, 4, 2026, 'June', '2026-03-06', '2026-03-06', '2026-03-12', '2026-03-14', 0, NULL, NULL, '2026-04-04 07:54:07', '2026-04-04 07:54:07'),
(1365, 37, 5, 2026, 'June', '2026-04-22', '2026-04-22', '2026-04-27', '2026-04-30', 0, NULL, NULL, '2026-04-04 07:54:07', '2026-04-04 07:54:07'),
(1366, 37, 6, 2026, 'June', '2025-11-08', '2025-11-08', '2025-11-11', '2025-11-12', 0, NULL, NULL, '2026-04-04 07:54:07', '2026-04-04 07:54:07'),
(1367, 37, 7, 2026, 'June', '2026-03-07', '2026-02-23', '2026-02-26', '2026-03-03', 0, NULL, NULL, '2026-04-04 07:54:07', '2026-04-04 07:54:07'),
(1368, 37, 8, 2026, 'June', '2025-12-18', '2025-12-18', '2025-12-22', '2025-12-26', 0, NULL, NULL, '2026-04-04 07:54:07', '2026-04-04 07:54:07'),
(1369, 37, 9, 2026, 'June', '2025-11-12', '2025-11-12', '2025-11-17', '2025-11-18', 0, NULL, NULL, '2026-04-04 07:54:07', '2026-04-04 07:54:07'),
(1370, 37, 10, 2026, 'June', '2026-01-09', '2026-01-13', '2026-01-17', '2026-01-19', 0, NULL, NULL, '2026-04-04 07:54:07', '2026-04-04 07:54:07'),
(1371, 38, 1, 2026, 'June', '2026-05-02', '2026-05-02', '2026-05-02', '2026-05-12', 0, NULL, NULL, '2026-04-04 07:54:07', '2026-04-04 07:54:07'),
(1372, 38, 2, 2026, 'June', '2026-04-21', NULL, NULL, NULL, 0, NULL, NULL, '2026-04-04 07:54:07', '2026-04-04 07:54:07'),
(1373, 38, 3, 2026, 'June', '2026-03-15', '2026-03-24', '2026-04-02', '2026-04-09', 0, NULL, NULL, '2026-04-04 07:54:07', '2026-04-04 07:54:07'),
(1374, 38, 4, 2026, 'June', '2026-02-23', '2026-02-22', '2026-02-24', '2026-03-02', 0, NULL, NULL, '2026-04-04 07:54:07', '2026-04-04 07:54:07'),
(1375, 38, 5, 2026, 'June', '2026-04-09', '2026-04-01', '2026-04-04', '2026-04-07', 0, NULL, NULL, '2026-04-04 07:54:07', '2026-04-04 07:54:07'),
(1376, 38, 6, 2026, 'June', '2026-04-05', '2026-04-05', '2026-04-10', '2026-04-13', 0, NULL, NULL, '2026-04-04 07:54:07', '2026-04-04 07:54:07'),
(1377, 38, 7, 2026, 'June', '2026-02-14', '2026-02-14', '2026-02-23', '2026-03-02', 0, NULL, NULL, '2026-04-04 07:54:07', '2026-04-04 07:54:07'),
(1378, 38, 8, 2026, 'June', '2026-02-14', '2026-02-03', '2026-02-09', '2026-02-15', 0, NULL, NULL, '2026-04-04 07:54:07', '2026-04-04 07:54:07'),
(1379, 38, 9, 2026, 'June', '2026-03-18', '2026-03-23', '2026-03-28', '2026-03-31', 0, NULL, NULL, '2026-04-04 07:54:07', '2026-04-04 07:54:07'),
(1380, 38, 10, 2026, 'June', '2026-01-01', '2025-12-21', '2025-12-29', '2025-12-31', 0, NULL, NULL, '2026-04-04 07:54:07', '2026-04-04 07:54:07'),
(1381, 39, 1, 2026, 'June', '2026-07-03', '2026-07-03', '2026-07-09', '2026-07-13', 0, NULL, NULL, '2026-04-04 07:54:07', '2026-04-04 07:54:07'),
(1382, 39, 2, 2026, 'June', '2026-02-05', '2026-01-31', '2026-02-06', '2026-02-16', 0, NULL, NULL, '2026-04-04 07:54:07', '2026-04-04 07:54:07'),
(1383, 39, 3, 2026, 'June', '2026-06-24', '2026-06-24', '2026-06-24', '2026-07-04', 0, NULL, NULL, '2026-04-04 07:54:07', '2026-04-04 07:54:07'),
(1384, 39, 4, 2026, 'June', '2026-02-15', '2026-02-02', '2026-02-10', '2026-02-18', 0, NULL, NULL, '2026-04-04 07:54:07', '2026-04-04 07:54:07'),
(1385, 39, 5, 2026, 'June', '2026-04-03', '2026-03-26', '2026-04-04', '2026-04-05', 0, NULL, NULL, '2026-04-04 07:54:07', '2026-04-04 07:54:07'),
(1386, 39, 6, 2026, 'June', '2026-02-09', NULL, NULL, NULL, 0, NULL, NULL, '2026-04-04 07:54:07', '2026-04-04 07:54:07'),
(1387, 39, 7, 2026, 'June', '2026-07-08', '2026-07-02', '2026-07-09', '2026-07-20', 0, NULL, NULL, '2026-04-04 07:54:07', '2026-04-04 07:54:07'),
(1388, 39, 8, 2026, 'June', '2026-03-02', '2026-03-02', '2026-03-08', '2026-03-10', 0, NULL, NULL, '2026-04-04 07:54:07', '2026-04-04 07:54:07'),
(1389, 39, 9, 2026, 'June', '2026-04-22', '2026-04-22', '2026-04-24', '2026-05-04', 0, NULL, NULL, '2026-04-04 07:54:07', '2026-04-04 07:54:07'),
(1390, 39, 10, 2026, 'June', '2026-01-24', '2026-01-29', '2026-02-03', '2026-02-06', 0, NULL, NULL, '2026-04-04 07:54:07', '2026-04-04 07:54:07'),
(1391, 40, 1, 2026, 'June', '2025-12-04', '2025-12-04', '2025-12-07', '2025-12-10', 0, NULL, NULL, '2026-04-04 07:54:07', '2026-04-04 07:54:07'),
(1392, 40, 2, 2026, 'June', '2026-04-14', '2026-04-14', '2026-04-15', '2026-04-24', 0, NULL, NULL, '2026-04-04 07:54:07', '2026-04-04 07:54:07'),
(1393, 40, 3, 2026, 'June', '2025-11-18', '2025-11-18', '2025-11-19', '2025-11-20', 0, NULL, NULL, '2026-04-04 07:54:07', '2026-04-04 07:54:07'),
(1394, 40, 4, 2026, 'June', '2026-05-13', '2026-05-05', '2026-05-08', '2026-05-11', 0, NULL, NULL, '2026-04-04 07:54:07', '2026-04-04 07:54:07'),
(1395, 40, 5, 2026, 'June', '2026-01-10', '2026-01-16', '2026-01-22', '2026-01-26', 0, NULL, NULL, '2026-04-04 07:54:07', '2026-04-04 07:54:07'),
(1396, 40, 6, 2026, 'June', '2026-05-08', '2026-04-28', '2026-05-05', '2026-05-06', 0, NULL, NULL, '2026-04-04 07:54:07', '2026-04-04 07:54:07'),
(1397, 40, 7, 2026, 'June', '2025-12-12', '2025-12-07', '2025-12-13', '2025-12-23', 0, NULL, NULL, '2026-04-04 07:54:07', '2026-04-04 07:54:07'),
(1398, 40, 8, 2026, 'June', '2026-05-10', '2026-05-10', '2026-05-11', '2026-05-20', 0, NULL, NULL, '2026-04-04 07:54:07', '2026-04-04 07:54:07'),
(1399, 40, 9, 2026, 'June', '2026-03-18', '2026-03-21', '2026-03-24', '2026-03-25', 0, NULL, NULL, '2026-04-04 07:54:07', '2026-04-04 07:54:07'),
(1400, 40, 10, 2026, 'June', '2026-05-21', '2026-05-16', '2026-05-16', '2026-05-16', 0, NULL, NULL, '2026-04-04 07:54:07', '2026-04-04 07:54:07'),
(1401, 41, 1, 2026, 'June', '2026-02-09', '2026-02-03', '2026-02-10', '2026-02-21', 0, NULL, NULL, '2026-04-04 07:54:07', '2026-04-04 07:54:07'),
(1402, 41, 2, 2026, 'June', '2025-11-24', '2025-12-02', '2025-12-10', '2025-12-16', 0, NULL, NULL, '2026-04-04 07:54:07', '2026-04-04 07:54:07'),
(1403, 41, 3, 2026, 'June', '2026-05-10', '2026-05-10', '2026-05-13', '2026-05-16', 0, NULL, NULL, '2026-04-04 07:54:07', '2026-04-04 07:54:07'),
(1404, 41, 4, 2026, 'June', '2026-01-19', '2026-01-19', '2026-01-26', '2026-02-02', 0, NULL, NULL, '2026-04-04 07:54:07', '2026-04-04 07:54:07'),
(1405, 41, 5, 2026, 'June', '2026-06-13', '2026-06-13', '2026-06-16', '2026-06-19', 0, NULL, NULL, '2026-04-04 07:54:07', '2026-04-04 07:54:07'),
(1406, 41, 6, 2026, 'June', '2026-06-30', '2026-06-26', '2026-07-05', '2026-07-16', 0, NULL, NULL, '2026-04-04 07:54:07', '2026-04-04 07:54:07'),
(1407, 41, 7, 2026, 'June', '2026-04-02', NULL, NULL, NULL, 0, NULL, NULL, '2026-04-04 07:54:07', '2026-04-04 07:54:07'),
(1408, 41, 8, 2026, 'June', '2025-11-24', '2025-11-13', '2025-11-19', '2025-11-25', 0, NULL, NULL, '2026-04-04 07:54:07', '2026-04-04 07:54:07'),
(1409, 41, 9, 2026, 'June', '2025-12-07', '2025-12-20', '2025-12-21', '2026-01-01', 0, NULL, NULL, '2026-04-04 07:54:07', '2026-04-04 07:54:07'),
(1410, 41, 10, 2026, 'June', '2025-11-25', '2025-12-06', '2025-12-15', '2025-12-24', 0, NULL, NULL, '2026-04-04 07:54:07', '2026-04-04 07:54:07'),
(1411, 42, 1, 2026, 'June', '2026-08-25', '2026-08-25', '2026-08-29', '2026-08-29', 0, NULL, NULL, '2026-04-04 07:54:07', '2026-04-04 07:54:07'),
(1412, 42, 2, 2026, 'June', '2025-11-19', '2025-11-05', '2025-11-10', '2025-11-17', 0, NULL, NULL, '2026-04-04 07:54:07', '2026-04-04 07:54:07'),
(1413, 42, 3, 2026, 'June', '2025-12-22', '2025-12-28', '2026-01-03', '2026-01-07', 0, NULL, NULL, '2026-04-04 07:54:07', '2026-04-04 07:54:07'),
(1414, 42, 4, 2026, 'June', '2026-03-09', '2026-03-04', '2026-03-04', '2026-03-04', 0, NULL, NULL, '2026-04-04 07:54:07', '2026-04-04 07:54:07'),
(1415, 42, 5, 2026, 'June', '2026-05-03', '2026-05-03', '2026-05-11', '2026-05-15', 0, NULL, NULL, '2026-04-04 07:54:07', '2026-04-04 07:54:07'),
(1416, 42, 6, 2026, 'June', '2026-06-17', '2026-06-04', '2026-06-12', '2026-06-20', 0, NULL, NULL, '2026-04-04 07:54:07', '2026-04-04 07:54:07'),
(1417, 42, 7, 2026, 'June', '2026-08-19', NULL, NULL, NULL, 0, NULL, NULL, '2026-04-04 07:54:07', '2026-04-04 07:54:07'),
(1418, 42, 8, 2026, 'June', '2026-01-10', '2026-01-10', '2026-01-13', '2026-01-24', 0, NULL, NULL, '2026-04-04 07:54:07', '2026-04-04 07:54:07'),
(1419, 42, 9, 2026, 'June', '2026-02-17', '2026-02-17', '2026-02-25', '2026-03-01', 0, NULL, NULL, '2026-04-04 07:54:07', '2026-04-04 07:54:07');
INSERT INTO `entity_reporting_matrix` (`id`, `entity_id`, `item_id`, `reporting_year`, `reporting_month`, `deadline_date`, `submission_date`, `reviewed_date`, `completed_date`, `is_deleted`, `created_by`, `updated_by`, `created_at`, `updated_at`) VALUES
(1420, 42, 10, 2026, 'June', '2025-12-04', '2025-11-20', '2025-11-21', '2025-11-26', 0, NULL, NULL, '2026-04-04 07:54:07', '2026-04-04 07:54:07'),
(1421, 43, 1, 2026, 'June', '2026-05-31', '2026-05-31', '2026-06-07', '2026-06-12', 0, NULL, NULL, '2026-04-04 07:54:07', '2026-04-04 07:54:07'),
(1422, 43, 2, 2026, 'June', '2025-11-15', '2025-11-09', '2025-11-16', '2025-11-27', 0, NULL, NULL, '2026-04-04 07:54:07', '2026-04-04 07:54:07'),
(1423, 43, 3, 2026, 'June', '2026-06-20', NULL, NULL, NULL, 0, NULL, NULL, '2026-04-04 07:54:07', '2026-04-04 07:54:07'),
(1424, 43, 4, 2026, 'June', '2026-05-25', '2026-05-25', '2026-06-03', '2026-06-12', 0, NULL, NULL, '2026-04-04 07:54:07', '2026-04-04 07:54:07'),
(1425, 43, 5, 2026, 'June', '2026-04-08', '2026-03-30', '2026-03-30', '2026-04-01', 0, NULL, NULL, '2026-04-04 07:54:07', '2026-04-04 07:54:07'),
(1426, 43, 6, 2026, 'June', '2025-11-16', '2025-11-09', '2025-11-17', '2025-11-17', 0, NULL, NULL, '2026-04-04 07:54:07', '2026-04-04 07:54:07'),
(1427, 43, 7, 2026, 'June', '2026-01-02', '2025-12-30', '2026-01-03', '2026-01-11', 0, NULL, NULL, '2026-04-04 07:54:07', '2026-04-04 07:54:07'),
(1428, 43, 8, 2026, 'June', '2026-05-20', '2026-05-08', '2026-05-15', '2026-05-22', 0, NULL, NULL, '2026-04-04 07:54:07', '2026-04-04 07:54:07'),
(1429, 43, 9, 2026, 'June', '2026-04-05', '2026-03-23', '2026-03-31', '2026-04-08', 0, NULL, NULL, '2026-04-04 07:54:07', '2026-04-04 07:54:07'),
(1430, 43, 10, 2026, 'June', '2026-02-07', '2026-02-14', '2026-02-21', '2026-02-26', 0, NULL, NULL, '2026-04-04 07:54:07', '2026-04-04 07:54:07'),
(1431, 44, 1, 2026, 'June', '2025-11-15', '2025-11-02', '2025-11-10', '2025-11-18', 0, NULL, NULL, '2026-04-04 07:54:07', '2026-04-04 07:54:07'),
(1432, 44, 2, 2026, 'June', '2025-12-26', '2026-01-07', '2026-01-07', '2026-01-17', 0, NULL, NULL, '2026-04-04 07:54:07', '2026-04-04 07:54:07'),
(1433, 44, 3, 2026, 'June', '2026-01-04', '2026-01-04', '2026-01-05', '2026-01-16', 0, NULL, NULL, '2026-04-04 07:54:07', '2026-04-04 07:54:07'),
(1434, 44, 4, 2026, 'June', '2025-12-21', '2025-12-21', '2025-12-23', '2025-12-23', 0, NULL, NULL, '2026-04-04 07:54:07', '2026-04-04 07:54:07'),
(1435, 44, 5, 2026, 'June', '2026-01-17', '2026-01-28', '2026-02-06', '2026-02-15', 0, NULL, NULL, '2026-04-04 07:54:07', '2026-04-04 07:54:07'),
(1436, 44, 6, 2026, 'June', '2026-04-02', NULL, NULL, NULL, 0, NULL, NULL, '2026-04-04 07:54:07', '2026-04-04 07:54:07'),
(1437, 44, 7, 2026, 'June', '2026-08-27', '2026-08-21', '2026-08-28', '2026-09-08', 0, NULL, NULL, '2026-04-04 07:54:07', '2026-04-04 07:54:07'),
(1438, 44, 8, 2026, 'June', '2026-05-18', '2026-05-18', '2026-05-24', '2026-05-26', 0, NULL, NULL, '2026-04-04 07:54:07', '2026-04-04 07:54:07'),
(1439, 44, 9, 2026, 'June', '2026-08-29', '2026-08-23', '2026-08-30', '2026-09-10', 0, NULL, NULL, '2026-04-04 07:54:07', '2026-04-04 07:54:07'),
(1440, 44, 10, 2026, 'June', '2026-03-29', '2026-03-26', '2026-03-30', '2026-04-07', 0, NULL, NULL, '2026-04-04 07:54:07', '2026-04-04 07:54:07'),
(1441, 45, 1, 2026, 'June', '2025-11-20', '2025-11-13', '2025-11-21', '2025-11-21', 0, NULL, NULL, '2026-04-04 07:54:07', '2026-04-04 07:54:07'),
(1442, 45, 2, 2026, 'June', '2026-05-24', '2026-05-24', '2026-06-01', '2026-06-05', 0, NULL, NULL, '2026-04-04 07:54:07', '2026-04-04 07:54:07'),
(1443, 45, 3, 2026, 'June', '2026-04-02', NULL, NULL, NULL, 0, NULL, NULL, '2026-04-04 07:54:07', '2026-04-04 07:54:07'),
(1444, 45, 4, 2026, 'June', '2026-04-02', NULL, NULL, NULL, 0, NULL, NULL, '2026-04-04 07:54:07', '2026-04-04 07:54:07'),
(1445, 45, 5, 2026, 'June', '2026-06-24', NULL, NULL, NULL, 0, NULL, NULL, '2026-04-04 07:54:07', '2026-04-04 07:54:07'),
(1446, 45, 6, 2026, 'June', '2026-01-29', '2026-01-29', '2026-02-02', '2026-02-06', 0, NULL, NULL, '2026-04-04 07:54:07', '2026-04-04 07:54:07'),
(1447, 45, 7, 2026, 'June', '2026-03-04', '2026-03-02', '2026-03-09', '2026-03-18', 0, NULL, NULL, '2026-04-04 07:54:07', '2026-04-04 07:54:07'),
(1448, 45, 8, 2026, 'June', '2026-07-03', '2026-06-26', '2026-07-04', '2026-07-04', 0, NULL, NULL, '2026-04-04 07:54:07', '2026-04-04 07:54:07'),
(1449, 45, 9, 2026, 'June', '2026-01-07', '2026-01-17', '2026-01-17', '2026-01-25', 0, NULL, NULL, '2026-04-04 07:54:07', '2026-04-04 07:54:07'),
(1450, 45, 10, 2026, 'June', '2025-11-17', '2025-11-17', '2025-11-18', '2025-11-19', 0, NULL, NULL, '2026-04-04 07:54:07', '2026-04-04 07:54:07'),
(1451, 46, 1, 2026, 'June', '2026-01-04', '2026-01-07', '2026-01-10', '2026-01-11', 0, NULL, NULL, '2026-04-04 07:54:07', '2026-04-04 07:54:07'),
(1452, 46, 2, 2026, 'June', '2026-03-22', NULL, NULL, NULL, 0, NULL, NULL, '2026-04-04 07:54:07', '2026-04-04 07:54:07'),
(1453, 46, 3, 2026, 'June', '2026-05-11', '2026-05-03', '2026-05-12', '2026-05-13', 0, NULL, NULL, '2026-04-04 07:54:07', '2026-04-04 07:54:07'),
(1454, 46, 4, 2026, 'June', '2026-01-15', '2026-01-22', '2026-01-29', '2026-02-03', 0, NULL, NULL, '2026-04-04 07:54:07', '2026-04-04 07:54:07'),
(1455, 46, 5, 2026, 'June', '2026-01-11', '2026-01-15', '2026-01-19', '2026-01-21', 0, NULL, NULL, '2026-04-04 07:54:07', '2026-04-04 07:54:07'),
(1456, 46, 6, 2026, 'June', '2026-01-21', '2026-01-21', '2026-01-30', '2026-02-04', 0, NULL, NULL, '2026-04-04 07:54:07', '2026-04-04 07:54:07'),
(1457, 46, 7, 2026, 'June', '2026-07-11', NULL, NULL, NULL, 0, NULL, NULL, '2026-04-04 07:54:07', '2026-04-04 07:54:07'),
(1458, 46, 8, 2026, 'June', '2025-12-29', '2026-01-01', '2026-01-04', '2026-01-05', 0, NULL, NULL, '2026-04-04 07:54:07', '2026-04-04 07:54:07'),
(1459, 46, 9, 2026, 'June', '2026-05-09', '2026-05-09', '2026-05-12', '2026-05-13', 0, NULL, NULL, '2026-04-04 07:54:07', '2026-04-04 07:54:07'),
(1460, 46, 10, 2026, 'June', '2026-04-04', '2026-04-04', '2026-04-13', '2026-04-20', 0, NULL, NULL, '2026-04-04 07:54:07', '2026-04-04 07:54:07'),
(1461, 47, 1, 2026, 'June', '2026-06-16', '2026-06-06', '2026-06-07', '2026-06-10', 0, NULL, NULL, '2026-04-04 07:54:07', '2026-04-04 07:54:07'),
(1462, 47, 2, 2026, 'June', '2026-05-10', '2026-05-10', '2026-05-16', '2026-05-20', 0, NULL, NULL, '2026-04-04 07:54:07', '2026-04-04 07:54:07'),
(1463, 47, 3, 2026, 'June', '2026-02-04', '2026-02-11', '2026-02-18', '2026-02-23', 0, NULL, NULL, '2026-04-04 07:54:07', '2026-04-04 07:54:07'),
(1464, 47, 4, 2026, 'June', '2026-04-02', NULL, NULL, NULL, 0, NULL, NULL, '2026-04-04 07:54:07', '2026-04-04 07:54:07'),
(1465, 47, 5, 2026, 'June', '2026-02-23', '2026-02-23', '2026-03-02', '2026-03-09', 0, NULL, NULL, '2026-04-04 07:54:07', '2026-04-04 07:54:07'),
(1466, 47, 6, 2026, 'June', '2026-02-03', '2026-01-24', '2026-01-31', '2026-02-01', 0, NULL, NULL, '2026-04-04 07:54:07', '2026-04-04 07:54:07'),
(1467, 47, 7, 2026, 'June', '2026-06-24', '2026-06-13', '2026-06-21', '2026-06-23', 0, NULL, NULL, '2026-04-04 07:54:07', '2026-04-04 07:54:07'),
(1468, 47, 8, 2026, 'June', '2026-06-04', '2026-06-04', '2026-06-06', '2026-06-06', 0, NULL, NULL, '2026-04-04 07:54:07', '2026-04-04 07:54:07'),
(1469, 47, 9, 2026, 'June', '2026-03-15', '2026-03-05', '2026-03-12', '2026-03-13', 0, NULL, NULL, '2026-04-04 07:54:07', '2026-04-04 07:54:07'),
(1470, 47, 10, 2026, 'June', '2026-01-02', '2026-01-12', '2026-01-12', '2026-01-20', 0, NULL, NULL, '2026-04-04 07:54:07', '2026-04-04 07:54:07'),
(1471, 48, 1, 2026, 'June', '2026-04-15', '2026-04-06', '2026-04-06', '2026-04-08', 0, NULL, NULL, '2026-04-04 07:54:07', '2026-04-04 07:54:07'),
(1472, 48, 2, 2026, 'June', '2026-05-25', '2026-05-25', '2026-05-25', '2026-06-04', 0, NULL, NULL, '2026-04-04 07:54:07', '2026-04-04 07:54:07'),
(1473, 48, 3, 2026, 'June', '2026-04-05', '2026-04-05', '2026-04-08', '2026-04-11', 0, NULL, NULL, '2026-04-04 07:54:07', '2026-04-04 07:54:07'),
(1474, 48, 4, 2026, 'June', '2026-04-18', '2026-04-18', '2026-04-27', '2026-05-04', 0, NULL, NULL, '2026-04-04 07:54:07', '2026-04-04 07:54:07'),
(1475, 48, 5, 2026, 'June', '2025-11-22', '2025-12-05', '2025-12-06', '2025-12-17', 0, NULL, NULL, '2026-04-04 07:54:07', '2026-04-04 07:54:07'),
(1476, 48, 6, 2026, 'June', '2026-01-31', '2026-01-31', '2026-02-03', '2026-02-06', 0, NULL, NULL, '2026-04-04 07:54:07', '2026-04-04 07:54:07'),
(1477, 48, 7, 2026, 'June', '2026-03-07', '2026-03-07', '2026-03-09', '2026-03-17', 0, NULL, NULL, '2026-04-04 07:54:07', '2026-04-04 07:54:07'),
(1478, 48, 8, 2026, 'June', '2026-07-07', '2026-06-24', '2026-06-28', '2026-07-04', 0, NULL, NULL, '2026-04-04 07:54:08', '2026-04-04 07:54:08'),
(1479, 48, 9, 2026, 'June', '2026-02-08', '2026-02-08', '2026-02-09', '2026-02-16', 0, NULL, NULL, '2026-04-04 07:54:08', '2026-04-04 07:54:08'),
(1480, 48, 10, 2026, 'June', '2026-01-15', '2026-01-01', '2026-01-02', '2026-01-07', 0, NULL, NULL, '2026-04-04 07:54:08', '2026-04-04 07:54:08'),
(1481, 49, 1, 2026, 'June', '2026-04-21', NULL, NULL, NULL, 0, NULL, NULL, '2026-04-04 07:54:08', '2026-04-04 07:54:08'),
(1482, 49, 2, 2026, 'June', '2026-01-29', '2026-01-18', '2026-01-24', '2026-01-30', 0, NULL, NULL, '2026-04-04 07:54:08', '2026-04-04 07:54:08'),
(1483, 49, 3, 2026, 'June', '2025-11-30', '2025-11-30', '2025-12-03', '2025-12-14', 0, NULL, NULL, '2026-04-04 07:54:08', '2026-04-04 07:54:08'),
(1484, 49, 4, 2026, 'June', '2026-02-25', '2026-03-03', '2026-03-09', '2026-03-13', 0, NULL, NULL, '2026-04-04 07:54:08', '2026-04-04 07:54:08'),
(1485, 49, 5, 2026, 'June', '2026-01-01', '2026-01-01', '2026-01-10', '2026-01-15', 0, NULL, NULL, '2026-04-04 07:54:08', '2026-04-04 07:54:08'),
(1486, 49, 6, 2026, 'June', '2025-11-24', '2025-11-24', '2025-11-27', '2025-11-30', 0, NULL, NULL, '2026-04-04 07:54:08', '2026-04-04 07:54:08'),
(1487, 49, 7, 2026, 'June', '2026-07-04', NULL, NULL, NULL, 0, NULL, NULL, '2026-04-04 07:54:08', '2026-04-04 07:54:08'),
(1488, 49, 8, 2026, 'June', '2026-07-23', '2026-07-23', '2026-07-29', '2026-07-31', 0, NULL, NULL, '2026-04-04 07:54:08', '2026-04-04 07:54:08'),
(1489, 49, 9, 2026, 'June', '2025-12-08', '2025-11-28', '2025-11-29', '2025-12-02', 0, NULL, NULL, '2026-04-04 07:54:08', '2026-04-04 07:54:08'),
(1490, 49, 10, 2026, 'June', '2026-06-29', '2026-06-15', '2026-06-16', '2026-06-21', 0, NULL, NULL, '2026-04-04 07:54:08', '2026-04-04 07:54:08'),
(1491, 50, 1, 2026, 'June', '2026-06-09', '2026-06-09', '2026-06-10', '2026-06-19', 0, NULL, NULL, '2026-04-04 07:54:08', '2026-04-04 07:54:08'),
(1492, 50, 2, 2026, 'June', '2026-04-02', NULL, NULL, NULL, 0, NULL, NULL, '2026-04-04 07:54:08', '2026-04-04 07:54:08'),
(1493, 50, 3, 2026, 'June', '2026-03-07', '2026-03-07', '2026-03-11', '2026-03-11', 0, NULL, NULL, '2026-04-04 07:54:08', '2026-04-04 07:54:08'),
(1494, 50, 4, 2026, 'June', '2026-04-02', NULL, NULL, NULL, 0, NULL, NULL, '2026-04-04 07:54:08', '2026-04-04 07:54:08'),
(1495, 50, 5, 2026, 'June', '2026-01-21', '2026-01-12', '2026-01-12', '2026-01-14', 0, NULL, NULL, '2026-04-04 07:54:08', '2026-04-04 07:54:08'),
(1496, 50, 6, 2026, 'June', '2026-07-03', '2026-07-03', '2026-07-11', '2026-07-19', 0, NULL, NULL, '2026-04-04 07:54:08', '2026-04-04 07:54:08'),
(1497, 50, 7, 2026, 'June', '2026-05-05', '2026-04-24', '2026-04-26', '2026-04-30', 0, NULL, NULL, '2026-04-04 07:54:08', '2026-04-04 07:54:08'),
(1498, 50, 8, 2026, 'June', '2026-08-24', '2026-08-24', '2026-08-25', '2026-09-01', 0, NULL, NULL, '2026-04-04 07:54:08', '2026-04-04 07:54:08'),
(1499, 50, 9, 2026, 'June', '2026-08-01', NULL, NULL, NULL, 0, NULL, NULL, '2026-04-04 07:54:08', '2026-04-04 07:54:08'),
(1500, 50, 10, 2026, 'June', '2026-06-30', NULL, NULL, NULL, 0, NULL, NULL, '2026-04-04 07:54:08', '2026-04-04 07:54:08'),
(1501, 1, 1, 2026, 'Annual', '2026-03-22', '2026-03-13', '2026-03-19', '2026-03-19', 0, NULL, NULL, '2026-04-04 07:54:08', '2026-04-04 07:54:08'),
(1502, 1, 2, 2026, 'Annual', '2025-12-09', '2025-12-09', '2025-12-09', '2025-12-15', 0, NULL, NULL, '2026-04-04 07:54:08', '2026-04-04 07:54:08'),
(1503, 1, 3, 2026, 'Annual', '2025-11-02', '2025-11-12', '2025-11-12', '2025-11-20', 0, NULL, NULL, '2026-04-04 07:54:08', '2026-04-04 07:54:08'),
(1504, 1, 4, 2026, 'Annual', '2026-01-23', '2026-01-15', '2026-01-24', '2026-01-25', 0, NULL, NULL, '2026-04-04 07:54:08', '2026-04-04 07:54:08'),
(1505, 1, 5, 2026, 'Annual', '2026-03-12', '2026-03-05', '2026-03-13', '2026-03-13', 0, NULL, NULL, '2026-04-04 07:54:08', '2026-04-04 07:54:08'),
(1506, 1, 6, 2026, 'Annual', '2026-07-27', '2026-07-15', '2026-07-24', '2026-07-27', 0, NULL, NULL, '2026-04-04 07:54:08', '2026-04-04 07:54:08'),
(1507, 1, 7, 2026, 'Annual', '2025-12-31', '2026-01-07', '2026-01-14', '2026-01-19', 0, NULL, NULL, '2026-04-04 07:54:08', '2026-04-04 07:54:08'),
(1508, 1, 8, 2026, 'Annual', '2026-02-21', '2026-02-21', '2026-02-25', '2026-03-01', 0, NULL, NULL, '2026-04-04 07:54:08', '2026-04-04 07:54:08'),
(1509, 1, 9, 2026, 'Annual', '2026-04-20', '2026-04-20', '2026-04-26', '2026-04-28', 0, NULL, NULL, '2026-04-04 07:54:08', '2026-04-04 07:54:08'),
(1510, 1, 10, 2026, 'Annual', '2026-05-11', NULL, NULL, NULL, 0, NULL, NULL, '2026-04-04 07:54:08', '2026-04-04 07:54:08'),
(1511, 2, 1, 2026, 'Annual', '2026-05-30', '2026-05-17', '2026-05-25', '2026-06-02', 0, NULL, NULL, '2026-04-04 07:54:08', '2026-04-04 07:54:08'),
(1512, 2, 2, 2026, 'Annual', '2026-03-24', '2026-04-05', '2026-04-07', '2026-04-17', 0, NULL, NULL, '2026-04-04 07:54:08', '2026-04-04 07:54:08'),
(1513, 2, 3, 2026, 'Annual', '2026-05-25', '2026-05-16', '2026-05-16', '2026-05-18', 0, NULL, NULL, '2026-04-04 07:54:08', '2026-04-04 07:54:08'),
(1514, 2, 4, 2026, 'Annual', '2026-04-07', '2026-04-01', '2026-04-08', '2026-04-19', 0, NULL, NULL, '2026-04-04 07:54:08', '2026-04-04 07:54:08'),
(1515, 2, 5, 2026, 'Annual', '2026-05-29', '2026-05-20', '2026-05-24', '2026-05-28', 0, NULL, NULL, '2026-04-04 07:54:08', '2026-04-04 07:54:08'),
(1516, 2, 6, 2026, 'Annual', '2026-03-02', '2026-03-02', '2026-03-05', '2026-03-16', 0, NULL, NULL, '2026-04-04 07:54:08', '2026-04-04 07:54:08'),
(1517, 2, 7, 2026, 'Annual', '2025-11-15', '2025-11-01', '2025-11-06', '2025-11-13', 0, NULL, NULL, '2026-04-04 07:54:08', '2026-04-04 07:54:08'),
(1518, 2, 8, 2026, 'Annual', '2026-05-09', '2026-05-09', '2026-05-11', '2026-05-19', 0, NULL, NULL, '2026-04-04 07:54:08', '2026-04-04 07:54:08'),
(1519, 2, 9, 2026, 'Annual', '2026-05-01', NULL, NULL, NULL, 0, NULL, NULL, '2026-04-04 07:54:08', '2026-04-04 07:54:08'),
(1520, 2, 10, 2026, 'Annual', '2026-01-22', '2026-02-02', '2026-02-11', '2026-02-20', 0, NULL, NULL, '2026-04-04 07:54:08', '2026-04-04 07:54:08'),
(1521, 3, 1, 2026, 'Annual', '2025-12-04', '2025-12-04', '2025-12-08', '2025-12-10', 0, NULL, NULL, '2026-04-04 07:54:08', '2026-04-04 07:54:08'),
(1522, 3, 2, 2026, 'Annual', '2026-02-17', '2026-02-28', '2026-03-09', '2026-03-18', 0, NULL, NULL, '2026-04-04 07:54:08', '2026-04-04 07:54:08'),
(1523, 3, 3, 2026, 'Annual', '2026-06-10', '2026-05-27', '2026-05-28', '2026-06-02', 0, NULL, NULL, '2026-04-04 07:54:08', '2026-04-04 07:54:08'),
(1524, 3, 4, 2026, 'Annual', '2025-12-06', '2025-12-06', '2025-12-11', '2025-12-12', 0, NULL, NULL, '2026-04-04 07:54:08', '2026-04-04 07:54:08'),
(1525, 3, 5, 2026, 'Annual', '2026-08-07', '2026-08-07', '2026-08-16', '2026-08-23', 0, NULL, NULL, '2026-04-04 07:54:08', '2026-04-04 07:54:08'),
(1526, 3, 6, 2026, 'Annual', '2026-07-20', '2026-07-13', '2026-07-15', '2026-07-17', 0, NULL, NULL, '2026-04-04 07:54:08', '2026-04-04 07:54:08'),
(1527, 3, 7, 2026, 'Annual', '2026-01-11', '2026-01-11', '2026-01-18', '2026-01-23', 0, NULL, NULL, '2026-04-04 07:54:08', '2026-04-04 07:54:08'),
(1528, 3, 8, 2026, 'Annual', '2025-11-16', '2025-11-25', '2025-12-04', '2025-12-11', 0, NULL, NULL, '2026-04-04 07:54:08', '2026-04-04 07:54:08'),
(1529, 3, 9, 2026, 'Annual', '2025-11-23', '2025-12-06', '2025-12-07', '2025-12-18', 0, NULL, NULL, '2026-04-04 07:54:08', '2026-04-04 07:54:08'),
(1530, 3, 10, 2026, 'Annual', '2025-11-03', '2025-11-13', '2025-11-13', '2025-11-21', 0, NULL, NULL, '2026-04-04 07:54:08', '2026-04-04 07:54:08'),
(1531, 4, 1, 2026, 'Annual', '2026-08-18', '2026-08-18', '2026-08-23', '2026-09-03', 0, NULL, NULL, '2026-04-04 07:54:08', '2026-04-04 07:54:08'),
(1532, 4, 2, 2026, 'Annual', '2026-03-11', '2026-03-08', '2026-03-16', '2026-03-26', 0, NULL, NULL, '2026-04-04 07:54:08', '2026-04-04 07:54:08'),
(1533, 4, 3, 2026, 'Annual', '2026-04-16', '2026-04-16', '2026-04-16', '2026-04-26', 0, NULL, NULL, '2026-04-04 07:54:08', '2026-04-04 07:54:08'),
(1534, 4, 4, 2026, 'Annual', '2026-04-10', '2026-04-10', '2026-04-14', '2026-04-16', 0, NULL, NULL, '2026-04-04 07:54:08', '2026-04-04 07:54:08'),
(1535, 4, 5, 2026, 'Annual', '2025-11-30', '2025-12-10', '2025-12-10', '2025-12-18', 0, NULL, NULL, '2026-04-04 07:54:08', '2026-04-04 07:54:08'),
(1536, 4, 6, 2026, 'Annual', '2026-05-30', '2026-05-18', '2026-05-25', '2026-06-01', 0, NULL, NULL, '2026-04-04 07:54:08', '2026-04-04 07:54:08'),
(1537, 4, 7, 2026, 'Annual', '2025-11-25', '2025-11-25', '2025-12-03', '2025-12-09', 0, NULL, NULL, '2026-04-04 07:54:08', '2026-04-04 07:54:08'),
(1538, 4, 8, 2026, 'Annual', '2026-01-12', '2026-01-12', '2026-01-12', '2026-01-20', 0, NULL, NULL, '2026-04-04 07:54:08', '2026-04-04 07:54:08'),
(1539, 4, 9, 2026, 'Annual', '2026-06-17', '2026-06-17', '2026-06-21', '2026-06-25', 0, NULL, NULL, '2026-04-04 07:54:08', '2026-04-04 07:54:08'),
(1540, 4, 10, 2026, 'Annual', '2025-12-02', '2025-11-19', '2025-11-23', '2025-11-29', 0, NULL, NULL, '2026-04-04 07:54:08', '2026-04-04 07:54:08'),
(1541, 5, 1, 2026, 'Annual', '2026-06-09', NULL, NULL, NULL, 0, NULL, NULL, '2026-04-04 07:54:08', '2026-04-04 07:54:08'),
(1542, 5, 2, 2026, 'Annual', '2026-01-26', '2026-02-02', '2026-02-09', '2026-02-14', 0, NULL, NULL, '2026-04-04 07:54:08', '2026-04-04 07:54:08'),
(1543, 5, 3, 2026, 'Annual', '2026-03-24', '2026-03-24', '2026-03-28', '2026-03-28', 0, NULL, NULL, '2026-04-04 07:54:08', '2026-04-04 07:54:08'),
(1544, 5, 4, 2026, 'Annual', '2026-02-17', '2026-02-28', '2026-03-09', '2026-03-18', 0, NULL, NULL, '2026-04-04 07:54:08', '2026-04-04 07:54:08'),
(1545, 5, 5, 2026, 'Annual', '2026-07-21', '2026-07-07', '2026-07-12', '2026-07-19', 0, NULL, NULL, '2026-04-04 07:54:08', '2026-04-04 07:54:08'),
(1546, 5, 6, 2026, 'Annual', '2026-08-09', '2026-08-09', '2026-08-16', '2026-08-21', 0, NULL, NULL, '2026-04-04 07:54:08', '2026-04-04 07:54:08'),
(1547, 5, 7, 2026, 'Annual', '2026-04-07', '2026-03-26', '2026-03-29', '2026-04-03', 0, NULL, NULL, '2026-04-04 07:54:08', '2026-04-04 07:54:08'),
(1548, 5, 8, 2026, 'Annual', '2026-02-13', NULL, NULL, NULL, 0, NULL, NULL, '2026-04-04 07:54:08', '2026-04-04 07:54:08'),
(1549, 5, 9, 2026, 'Annual', '2026-07-11', '2026-07-11', '2026-07-13', '2026-07-23', 0, NULL, NULL, '2026-04-04 07:54:08', '2026-04-04 07:54:08'),
(1550, 5, 10, 2026, 'Annual', '2026-02-12', '2026-02-01', '2026-02-09', '2026-02-11', 0, NULL, NULL, '2026-04-04 07:54:08', '2026-04-04 07:54:08'),
(1551, 6, 1, 2026, 'Annual', '2026-03-26', '2026-03-17', '2026-03-23', '2026-03-23', 0, NULL, NULL, '2026-04-04 07:54:08', '2026-04-04 07:54:08'),
(1552, 6, 2, 2026, 'Annual', '2026-08-10', '2026-08-08', '2026-08-11', '2026-08-18', 0, NULL, NULL, '2026-04-04 07:54:08', '2026-04-04 07:54:08'),
(1553, 6, 3, 2026, 'Annual', '2026-05-08', '2026-05-08', '2026-05-12', '2026-05-16', 0, NULL, NULL, '2026-04-04 07:54:08', '2026-04-04 07:54:08'),
(1554, 6, 4, 2026, 'Annual', '2026-04-28', '2026-04-14', '2026-04-15', '2026-04-20', 0, NULL, NULL, '2026-04-04 07:54:08', '2026-04-04 07:54:08'),
(1555, 6, 5, 2026, 'Annual', '2026-06-15', '2026-06-13', '2026-06-20', '2026-06-29', 0, NULL, NULL, '2026-04-04 07:54:08', '2026-04-04 07:54:08'),
(1556, 6, 6, 2026, 'Annual', '2025-11-04', '2025-11-17', '2025-11-18', '2025-11-29', 0, NULL, NULL, '2026-04-04 07:54:08', '2026-04-04 07:54:08'),
(1557, 6, 7, 2026, 'Annual', '2025-12-06', '2025-11-30', '2025-12-01', '2025-12-02', 0, NULL, NULL, '2026-04-04 07:54:08', '2026-04-04 07:54:08'),
(1558, 6, 8, 2026, 'Annual', '2026-01-28', '2026-01-26', '2026-02-02', '2026-02-11', 0, NULL, NULL, '2026-04-04 07:54:08', '2026-04-04 07:54:08'),
(1559, 6, 9, 2026, 'Annual', '2026-08-10', '2026-08-10', '2026-08-16', '2026-08-18', 0, NULL, NULL, '2026-04-04 07:54:08', '2026-04-04 07:54:08'),
(1560, 6, 10, 2026, 'Annual', '2026-03-20', '2026-03-20', '2026-03-27', '2026-04-03', 0, NULL, NULL, '2026-04-04 07:54:08', '2026-04-04 07:54:08'),
(1561, 7, 1, 2026, 'Annual', '2026-05-18', '2026-05-12', '2026-05-19', '2026-05-30', 0, NULL, NULL, '2026-04-04 07:54:08', '2026-04-04 07:54:08'),
(1562, 7, 2, 2026, 'Annual', '2026-03-30', '2026-04-10', '2026-04-11', '2026-04-20', 0, NULL, NULL, '2026-04-04 07:54:08', '2026-04-04 07:54:08'),
(1563, 7, 3, 2026, 'Annual', '2026-02-07', '2026-02-01', '2026-02-08', '2026-02-19', 0, NULL, NULL, '2026-04-04 07:54:08', '2026-04-04 07:54:08'),
(1564, 7, 4, 2026, 'Annual', '2026-03-28', '2026-03-19', '2026-03-25', '2026-03-25', 0, NULL, NULL, '2026-04-04 07:54:08', '2026-04-04 07:54:08'),
(1565, 7, 5, 2026, 'Annual', '2026-06-07', '2026-06-07', '2026-06-10', '2026-06-13', 0, NULL, NULL, '2026-04-04 07:54:08', '2026-04-04 07:54:08'),
(1566, 7, 6, 2026, 'Annual', '2026-03-22', '2026-04-03', '2026-04-03', '2026-04-13', 0, NULL, NULL, '2026-04-04 07:54:08', '2026-04-04 07:54:08'),
(1567, 7, 7, 2026, 'Annual', '2026-05-16', '2026-05-07', '2026-05-13', '2026-05-13', 0, NULL, NULL, '2026-04-04 07:54:08', '2026-04-04 07:54:08'),
(1568, 7, 8, 2026, 'Annual', '2026-01-20', '2026-01-20', '2026-01-27', '2026-02-03', 0, NULL, NULL, '2026-04-04 07:54:08', '2026-04-04 07:54:08'),
(1569, 7, 9, 2026, 'Annual', '2026-03-08', '2026-03-08', '2026-03-13', '2026-03-14', 0, NULL, NULL, '2026-04-04 07:54:08', '2026-04-04 07:54:08'),
(1570, 7, 10, 2026, 'Annual', '2026-08-27', NULL, NULL, NULL, 0, NULL, NULL, '2026-04-04 07:54:08', '2026-04-04 07:54:08'),
(1571, 8, 1, 2026, 'Annual', '2026-08-09', '2026-08-09', '2026-08-09', '2026-08-19', 0, NULL, NULL, '2026-04-04 07:54:08', '2026-04-04 07:54:08'),
(1572, 8, 2, 2026, 'Annual', '2025-11-11', '2025-11-11', '2025-11-14', '2025-11-23', 0, NULL, NULL, '2026-04-04 07:54:08', '2026-04-04 07:54:08'),
(1573, 8, 3, 2026, 'Annual', '2026-07-26', '2026-07-26', '2026-07-29', '2026-07-30', 0, NULL, NULL, '2026-04-04 07:54:08', '2026-04-04 07:54:08'),
(1574, 8, 4, 2026, 'Annual', '2026-08-15', '2026-08-15', '2026-08-21', '2026-08-27', 0, NULL, NULL, '2026-04-04 07:54:08', '2026-04-04 07:54:08'),
(1575, 8, 5, 2026, 'Annual', '2026-04-02', NULL, NULL, NULL, 0, NULL, NULL, '2026-04-04 07:54:08', '2026-04-04 07:54:08'),
(1576, 8, 6, 2026, 'Annual', '2026-04-29', '2026-04-20', '2026-04-20', '2026-04-22', 0, NULL, NULL, '2026-04-04 07:54:08', '2026-04-04 07:54:08'),
(1577, 8, 7, 2026, 'Annual', '2026-07-08', '2026-07-08', '2026-07-12', '2026-07-22', 0, NULL, NULL, '2026-04-04 07:54:08', '2026-04-04 07:54:08'),
(1578, 8, 8, 2026, 'Annual', '2026-03-20', '2026-03-20', '2026-03-29', '2026-04-05', 0, NULL, NULL, '2026-04-04 07:54:08', '2026-04-04 07:54:08'),
(1579, 8, 9, 2026, 'Annual', '2026-08-11', '2026-08-11', '2026-08-18', '2026-08-21', 0, NULL, NULL, '2026-04-04 07:54:08', '2026-04-04 07:54:08'),
(1580, 8, 10, 2026, 'Annual', '2026-06-05', NULL, NULL, NULL, 0, NULL, NULL, '2026-04-04 07:54:08', '2026-04-04 07:54:08'),
(1581, 9, 1, 2026, 'Annual', '2026-08-01', '2026-07-30', '2026-08-06', '2026-08-15', 0, NULL, NULL, '2026-04-04 07:54:08', '2026-04-04 07:54:08'),
(1582, 9, 2, 2026, 'Annual', '2025-12-12', '2025-12-18', '2025-12-24', '2025-12-28', 0, NULL, NULL, '2026-04-04 07:54:08', '2026-04-04 07:54:08'),
(1583, 9, 3, 2026, 'Annual', '2026-06-11', '2026-06-11', '2026-06-15', '2026-06-19', 0, NULL, NULL, '2026-04-04 07:54:08', '2026-04-04 07:54:08'),
(1584, 9, 4, 2026, 'Annual', '2026-03-10', NULL, NULL, NULL, 0, NULL, NULL, '2026-04-04 07:54:08', '2026-04-04 07:54:08'),
(1585, 9, 5, 2026, 'Annual', '2025-12-17', '2025-12-21', '2025-12-25', '2025-12-27', 0, NULL, NULL, '2026-04-04 07:54:08', '2026-04-04 07:54:08'),
(1586, 9, 6, 2026, 'Annual', '2025-12-06', '2025-12-17', '2025-12-26', '2026-01-04', 0, NULL, NULL, '2026-04-04 07:54:08', '2026-04-04 07:54:08'),
(1587, 9, 7, 2026, 'Annual', '2026-04-13', '2026-04-04', '2026-04-08', '2026-04-12', 0, NULL, NULL, '2026-04-04 07:54:08', '2026-04-04 07:54:08'),
(1588, 9, 8, 2026, 'Annual', '2026-01-16', '2026-01-16', '2026-01-20', '2026-01-22', 0, NULL, NULL, '2026-04-04 07:54:08', '2026-04-04 07:54:08'),
(1589, 9, 9, 2026, 'Annual', '2025-12-08', '2025-12-08', '2025-12-14', '2025-12-20', 0, NULL, NULL, '2026-04-04 07:54:08', '2026-04-04 07:54:08'),
(1590, 9, 10, 2026, 'Annual', '2026-01-08', '2025-12-29', '2026-01-05', '2026-01-06', 0, NULL, NULL, '2026-04-04 07:54:08', '2026-04-04 07:54:08'),
(1591, 10, 1, 2026, 'Annual', '2026-01-28', '2026-01-28', '2026-02-06', '2026-02-15', 0, NULL, NULL, '2026-04-04 07:54:08', '2026-04-04 07:54:08'),
(1592, 10, 2, 2026, 'Annual', '2026-04-02', NULL, NULL, NULL, 0, NULL, NULL, '2026-04-04 07:54:08', '2026-04-04 07:54:08'),
(1593, 10, 3, 2026, 'Annual', '2026-02-08', '2026-02-12', '2026-02-16', '2026-02-18', 0, NULL, NULL, '2026-04-04 07:54:08', '2026-04-04 07:54:08'),
(1594, 10, 4, 2026, 'Annual', '2026-07-15', '2026-07-04', '2026-07-10', '2026-07-16', 0, NULL, NULL, '2026-04-04 07:54:08', '2026-04-04 07:54:08'),
(1595, 10, 5, 2026, 'Annual', '2025-11-17', '2025-11-08', '2025-11-08', '2025-11-10', 0, NULL, NULL, '2026-04-04 07:54:08', '2026-04-04 07:54:08'),
(1596, 10, 6, 2026, 'Annual', '2025-11-27', '2025-11-27', '2025-11-28', '2025-11-29', 0, NULL, NULL, '2026-04-04 07:54:08', '2026-04-04 07:54:08'),
(1597, 10, 7, 2026, 'Annual', '2026-04-20', '2026-04-20', '2026-04-24', '2026-04-26', 0, NULL, NULL, '2026-04-04 07:54:08', '2026-04-04 07:54:08'),
(1598, 10, 8, 2026, 'Annual', '2026-05-17', NULL, NULL, NULL, 0, NULL, NULL, '2026-04-04 07:54:08', '2026-04-04 07:54:08'),
(1599, 10, 9, 2026, 'Annual', '2026-06-03', '2026-05-23', '2026-05-25', '2026-05-29', 0, NULL, NULL, '2026-04-04 07:54:08', '2026-04-04 07:54:08'),
(1600, 10, 10, 2026, 'Annual', '2026-07-01', '2026-07-01', '2026-07-07', '2026-07-13', 0, NULL, NULL, '2026-04-04 07:54:08', '2026-04-04 07:54:08'),
(1601, 11, 1, 2026, 'Annual', '2026-06-11', '2026-06-06', '2026-06-06', '2026-06-06', 0, NULL, NULL, '2026-04-04 07:54:08', '2026-04-04 07:54:08'),
(1602, 11, 2, 2026, 'Annual', '2026-04-02', NULL, NULL, NULL, 0, NULL, NULL, '2026-04-04 07:54:08', '2026-04-04 07:54:08'),
(1603, 11, 3, 2026, 'Annual', '2025-11-26', NULL, NULL, NULL, 0, NULL, NULL, '2026-04-04 07:54:08', '2026-04-04 07:54:08'),
(1604, 11, 4, 2026, 'Annual', '2025-12-12', NULL, NULL, NULL, 0, NULL, NULL, '2026-04-04 07:54:08', '2026-04-04 07:54:08'),
(1605, 11, 5, 2026, 'Annual', '2026-03-23', NULL, NULL, NULL, 0, NULL, NULL, '2026-04-04 07:54:08', '2026-04-04 07:54:08'),
(1606, 11, 6, 2026, 'Annual', '2026-03-28', '2026-04-06', '2026-04-15', '2026-04-22', 0, NULL, NULL, '2026-04-04 07:54:08', '2026-04-04 07:54:08'),
(1607, 11, 7, 2026, 'Annual', '2026-08-04', '2026-08-04', '2026-08-07', '2026-08-16', 0, NULL, NULL, '2026-04-04 07:54:08', '2026-04-04 07:54:08'),
(1608, 11, 8, 2026, 'Annual', '2025-11-16', '2025-11-16', '2025-11-17', '2025-11-26', 0, NULL, NULL, '2026-04-04 07:54:08', '2026-04-04 07:54:08'),
(1609, 11, 9, 2026, 'Annual', '2026-04-24', '2026-04-24', '2026-04-26', '2026-04-28', 0, NULL, NULL, '2026-04-04 07:54:08', '2026-04-04 07:54:08'),
(1610, 11, 10, 2026, 'Annual', '2026-02-06', '2026-02-03', '2026-02-07', '2026-02-15', 0, NULL, NULL, '2026-04-04 07:54:08', '2026-04-04 07:54:08'),
(1611, 12, 1, 2026, 'Annual', '2026-02-06', '2026-01-24', '2026-01-24', '2026-01-28', 0, NULL, NULL, '2026-04-04 07:54:08', '2026-04-04 07:54:08'),
(1612, 12, 2, 2026, 'Annual', '2025-12-22', '2025-12-09', '2025-12-13', '2025-12-19', 0, NULL, NULL, '2026-04-04 07:54:08', '2026-04-04 07:54:08'),
(1613, 12, 3, 2026, 'Annual', '2025-12-16', '2025-12-16', '2025-12-16', '2025-12-22', 0, NULL, NULL, '2026-04-04 07:54:08', '2026-04-04 07:54:08'),
(1614, 12, 4, 2026, 'Annual', '2026-04-02', NULL, NULL, NULL, 0, NULL, NULL, '2026-04-04 07:54:08', '2026-04-04 07:54:08'),
(1615, 12, 5, 2026, 'Annual', '2026-03-02', '2026-03-02', '2026-03-11', '2026-03-20', 0, NULL, NULL, '2026-04-04 07:54:08', '2026-04-04 07:54:08'),
(1616, 12, 6, 2026, 'Annual', '2026-03-12', '2026-03-25', '2026-03-26', '2026-04-06', 0, NULL, NULL, '2026-04-04 07:54:08', '2026-04-04 07:54:08'),
(1617, 12, 7, 2026, 'Annual', '2026-05-18', '2026-05-18', '2026-05-25', '2026-06-01', 0, NULL, NULL, '2026-04-04 07:54:08', '2026-04-04 07:54:08'),
(1618, 12, 8, 2026, 'Annual', '2026-03-09', '2026-03-01', '2026-03-10', '2026-03-11', 0, NULL, NULL, '2026-04-04 07:54:08', '2026-04-04 07:54:08'),
(1619, 12, 9, 2026, 'Annual', '2026-01-18', '2026-01-05', '2026-01-13', '2026-01-21', 0, NULL, NULL, '2026-04-04 07:54:08', '2026-04-04 07:54:08'),
(1620, 12, 10, 2026, 'Annual', '2026-04-02', NULL, NULL, NULL, 0, NULL, NULL, '2026-04-04 07:54:08', '2026-04-04 07:54:08'),
(1621, 13, 1, 2026, 'Annual', '2026-06-02', NULL, NULL, NULL, 0, NULL, NULL, '2026-04-04 07:54:08', '2026-04-04 07:54:08'),
(1622, 13, 2, 2026, 'Annual', '2026-02-04', '2026-01-21', '2026-01-22', '2026-01-27', 0, NULL, NULL, '2026-04-04 07:54:08', '2026-04-04 07:54:08'),
(1623, 13, 3, 2026, 'Annual', '2025-12-15', '2025-12-05', '2025-12-10', '2025-12-15', 0, NULL, NULL, '2026-04-04 07:54:08', '2026-04-04 07:54:08'),
(1624, 13, 4, 2026, 'Annual', '2026-08-01', '2026-07-21', '2026-07-27', '2026-08-02', 0, NULL, NULL, '2026-04-04 07:54:08', '2026-04-04 07:54:08'),
(1625, 13, 5, 2026, 'Annual', '2025-11-26', '2025-11-26', '2025-11-29', '2025-12-10', 0, NULL, NULL, '2026-04-04 07:54:08', '2026-04-04 07:54:08'),
(1626, 13, 6, 2026, 'Annual', '2026-01-24', '2026-01-17', '2026-01-19', '2026-01-21', 0, NULL, NULL, '2026-04-04 07:54:08', '2026-04-04 07:54:08'),
(1627, 13, 7, 2026, 'Annual', '2025-11-17', '2025-11-17', '2025-11-23', '2025-11-29', 0, NULL, NULL, '2026-04-04 07:54:08', '2026-04-04 07:54:08'),
(1628, 13, 8, 2026, 'Annual', '2026-04-30', '2026-04-20', '2026-04-21', '2026-04-24', 0, NULL, NULL, '2026-04-04 07:54:08', '2026-04-04 07:54:08'),
(1629, 13, 9, 2026, 'Annual', '2025-12-28', NULL, NULL, NULL, 0, NULL, NULL, '2026-04-04 07:54:08', '2026-04-04 07:54:08'),
(1630, 13, 10, 2026, 'Annual', '2026-01-24', '2026-01-24', '2026-01-29', '2026-02-03', 0, NULL, NULL, '2026-04-04 07:54:08', '2026-04-04 07:54:08'),
(1631, 14, 1, 2026, 'Annual', '2026-06-01', '2026-06-01', '2026-06-10', '2026-06-17', 0, NULL, NULL, '2026-04-04 07:54:08', '2026-04-04 07:54:08'),
(1632, 14, 2, 2026, 'Annual', '2026-02-14', '2026-02-22', '2026-03-02', '2026-03-08', 0, NULL, NULL, '2026-04-04 07:54:08', '2026-04-04 07:54:08'),
(1633, 14, 3, 2026, 'Annual', '2026-04-16', NULL, NULL, NULL, 0, NULL, NULL, '2026-04-04 07:54:08', '2026-04-04 07:54:08'),
(1634, 14, 4, 2026, 'Annual', '2026-05-02', '2026-05-02', '2026-05-09', '2026-05-16', 0, NULL, NULL, '2026-04-04 07:54:08', '2026-04-04 07:54:08'),
(1635, 14, 5, 2026, 'Annual', '2025-11-24', '2025-11-24', '2025-12-02', '2025-12-06', 0, NULL, NULL, '2026-04-04 07:54:08', '2026-04-04 07:54:08'),
(1636, 14, 6, 2026, 'Annual', '2026-05-17', '2026-05-17', '2026-05-20', '2026-05-31', 0, NULL, NULL, '2026-04-04 07:54:08', '2026-04-04 07:54:08'),
(1637, 14, 7, 2026, 'Annual', '2026-06-15', '2026-06-01', '2026-06-06', '2026-06-13', 0, NULL, NULL, '2026-04-04 07:54:08', '2026-04-04 07:54:08'),
(1638, 14, 8, 2026, 'Annual', '2026-05-02', '2026-04-23', '2026-04-29', '2026-04-29', 0, NULL, NULL, '2026-04-04 07:54:08', '2026-04-04 07:54:08'),
(1639, 14, 9, 2026, 'Annual', '2026-06-16', NULL, NULL, NULL, 0, NULL, NULL, '2026-04-04 07:54:08', '2026-04-04 07:54:08'),
(1640, 14, 10, 2026, 'Annual', '2026-04-07', '2026-04-03', '2026-04-12', '2026-04-23', 0, NULL, NULL, '2026-04-04 07:54:08', '2026-04-04 07:54:08'),
(1641, 15, 1, 2026, 'Annual', '2026-07-04', '2026-07-04', '2026-07-06', '2026-07-08', 0, NULL, NULL, '2026-04-04 07:54:08', '2026-04-04 07:54:08'),
(1642, 15, 2, 2026, 'Annual', '2026-01-20', '2026-01-20', '2026-01-25', '2026-01-30', 0, NULL, NULL, '2026-04-04 07:54:08', '2026-04-04 07:54:08'),
(1643, 15, 3, 2026, 'Annual', '2026-04-02', NULL, NULL, NULL, 0, NULL, NULL, '2026-04-04 07:54:08', '2026-04-04 07:54:08'),
(1644, 15, 4, 2026, 'Annual', '2026-07-03', '2026-06-27', '2026-06-28', '2026-06-29', 0, NULL, NULL, '2026-04-04 07:54:08', '2026-04-04 07:54:08'),
(1645, 15, 5, 2026, 'Annual', '2025-11-10', '2025-11-10', '2025-11-11', '2025-11-22', 0, NULL, NULL, '2026-04-04 07:54:08', '2026-04-04 07:54:08'),
(1646, 15, 6, 2026, 'Annual', '2026-07-04', '2026-06-21', '2026-06-25', '2026-07-01', 0, NULL, NULL, '2026-04-04 07:54:08', '2026-04-04 07:54:08'),
(1647, 15, 7, 2026, 'Annual', '2026-02-07', '2026-02-01', '2026-02-02', '2026-02-03', 0, NULL, NULL, '2026-04-04 07:54:08', '2026-04-04 07:54:08'),
(1648, 15, 8, 2026, 'Annual', '2026-04-25', '2026-04-25', '2026-05-02', '2026-05-05', 0, NULL, NULL, '2026-04-04 07:54:08', '2026-04-04 07:54:08'),
(1649, 15, 9, 2026, 'Annual', '2026-07-05', NULL, NULL, NULL, 0, NULL, NULL, '2026-04-04 07:54:08', '2026-04-04 07:54:08'),
(1650, 15, 10, 2026, 'Annual', '2026-02-28', '2026-02-28', '2026-03-04', '2026-03-14', 0, NULL, NULL, '2026-04-04 07:54:08', '2026-04-04 07:54:08'),
(1651, 16, 1, 2026, 'Annual', '2026-01-12', '2026-01-12', '2026-01-14', '2026-01-14', 0, NULL, NULL, '2026-04-04 07:54:08', '2026-04-04 07:54:08'),
(1652, 16, 2, 2026, 'Annual', '2025-12-11', '2025-12-11', '2025-12-16', '2025-12-19', 0, NULL, NULL, '2026-04-04 07:54:08', '2026-04-04 07:54:08'),
(1653, 16, 3, 2026, 'Annual', '2026-02-19', '2026-03-01', '2026-03-01', '2026-03-09', 0, NULL, NULL, '2026-04-04 07:54:08', '2026-04-04 07:54:08'),
(1654, 16, 4, 2026, 'Annual', '2025-11-19', '2025-11-05', '2025-11-06', '2025-11-11', 0, NULL, NULL, '2026-04-04 07:54:08', '2026-04-04 07:54:08'),
(1655, 16, 5, 2026, 'Annual', '2025-11-16', '2025-11-16', '2025-11-25', '2025-12-04', 0, NULL, NULL, '2026-04-04 07:54:08', '2026-04-04 07:54:08'),
(1656, 16, 6, 2026, 'Annual', '2026-04-04', '2026-04-04', '2026-04-12', '2026-04-20', 0, NULL, NULL, '2026-04-04 07:54:08', '2026-04-04 07:54:08'),
(1657, 16, 7, 2026, 'Annual', '2026-01-11', '2026-01-01', '2026-01-06', '2026-01-11', 0, NULL, NULL, '2026-04-04 07:54:08', '2026-04-04 07:54:08'),
(1658, 16, 8, 2026, 'Annual', '2026-03-09', '2026-03-16', '2026-03-23', '2026-03-28', 0, NULL, NULL, '2026-04-04 07:54:08', '2026-04-04 07:54:08'),
(1659, 16, 9, 2026, 'Annual', '2026-04-02', NULL, NULL, NULL, 0, NULL, NULL, '2026-04-04 07:54:08', '2026-04-04 07:54:08'),
(1660, 16, 10, 2026, 'Annual', '2026-03-30', '2026-04-12', '2026-04-13', '2026-04-24', 0, NULL, NULL, '2026-04-04 07:54:08', '2026-04-04 07:54:08'),
(1661, 17, 1, 2026, 'Annual', '2026-01-29', '2026-02-11', '2026-02-12', '2026-02-23', 0, NULL, NULL, '2026-04-04 07:54:08', '2026-04-04 07:54:08'),
(1662, 17, 2, 2026, 'Annual', '2026-01-05', NULL, NULL, NULL, 0, NULL, NULL, '2026-04-04 07:54:08', '2026-04-04 07:54:08'),
(1663, 17, 3, 2026, 'Annual', '2025-12-02', '2025-12-11', '2025-12-20', '2025-12-27', 0, NULL, NULL, '2026-04-04 07:54:08', '2026-04-04 07:54:08'),
(1664, 17, 4, 2026, 'Annual', '2026-03-31', '2026-04-10', '2026-04-10', '2026-04-18', 0, NULL, NULL, '2026-04-04 07:54:08', '2026-04-04 07:54:08'),
(1665, 17, 5, 2026, 'Annual', '2026-04-02', NULL, NULL, NULL, 0, NULL, NULL, '2026-04-04 07:54:08', '2026-04-04 07:54:08'),
(1666, 17, 6, 2026, 'Annual', '2026-01-12', '2026-01-12', '2026-01-18', '2026-01-20', 0, NULL, NULL, '2026-04-04 07:54:08', '2026-04-04 07:54:08'),
(1667, 17, 7, 2026, 'Annual', '2026-07-16', '2026-07-07', '2026-07-13', '2026-07-13', 0, NULL, NULL, '2026-04-04 07:54:08', '2026-04-04 07:54:08'),
(1668, 17, 8, 2026, 'Annual', '2026-03-27', '2026-03-29', '2026-03-31', '2026-03-31', 0, NULL, NULL, '2026-04-04 07:54:08', '2026-04-04 07:54:08'),
(1669, 17, 9, 2026, 'Annual', '2026-04-20', '2026-04-20', '2026-04-21', '2026-04-22', 0, NULL, NULL, '2026-04-04 07:54:08', '2026-04-04 07:54:08'),
(1670, 17, 10, 2026, 'Annual', '2026-03-26', '2026-03-26', '2026-04-02', '2026-04-07', 0, NULL, NULL, '2026-04-04 07:54:08', '2026-04-04 07:54:08'),
(1671, 18, 1, 2026, 'Annual', '2026-06-21', NULL, NULL, NULL, 0, NULL, NULL, '2026-04-04 07:54:08', '2026-04-04 07:54:08'),
(1672, 18, 2, 2026, 'Annual', '2026-02-27', '2026-02-27', '2026-03-02', '2026-03-11', 0, NULL, NULL, '2026-04-04 07:54:08', '2026-04-04 07:54:08'),
(1673, 18, 3, 2026, 'Annual', '2026-03-08', '2026-03-19', '2026-03-28', '2026-04-06', 0, NULL, NULL, '2026-04-04 07:54:08', '2026-04-04 07:54:08'),
(1674, 18, 4, 2026, 'Annual', '2026-05-14', '2026-05-14', '2026-05-18', '2026-05-28', 0, NULL, NULL, '2026-04-04 07:54:08', '2026-04-04 07:54:08'),
(1675, 18, 5, 2026, 'Annual', '2026-05-16', '2026-05-05', '2026-05-07', '2026-05-11', 0, NULL, NULL, '2026-04-04 07:54:08', '2026-04-04 07:54:08'),
(1676, 18, 6, 2026, 'Annual', '2026-03-31', '2026-03-20', '2026-03-26', '2026-04-01', 0, NULL, NULL, '2026-04-04 07:54:08', '2026-04-04 07:54:08'),
(1677, 18, 7, 2026, 'Annual', '2026-01-01', '2026-01-01', '2026-01-07', '2026-01-09', 0, NULL, NULL, '2026-04-04 07:54:08', '2026-04-04 07:54:08'),
(1678, 18, 8, 2026, 'Annual', '2026-08-02', '2026-07-28', '2026-07-28', '2026-07-28', 0, NULL, NULL, '2026-04-04 07:54:08', '2026-04-04 07:54:08'),
(1679, 18, 9, 2026, 'Annual', '2026-03-31', '2026-04-09', '2026-04-18', '2026-04-25', 0, NULL, NULL, '2026-04-04 07:54:08', '2026-04-04 07:54:08'),
(1680, 18, 10, 2026, 'Annual', '2026-02-07', '2026-02-19', '2026-02-21', '2026-03-03', 0, NULL, NULL, '2026-04-04 07:54:08', '2026-04-04 07:54:08'),
(1681, 19, 1, 2026, 'Annual', '2025-11-15', '2025-11-15', '2025-11-19', '2025-11-21', 0, NULL, NULL, '2026-04-04 07:54:08', '2026-04-04 07:54:08'),
(1682, 19, 2, 2026, 'Annual', '2026-08-24', NULL, NULL, NULL, 0, NULL, NULL, '2026-04-04 07:54:08', '2026-04-04 07:54:08'),
(1683, 19, 3, 2026, 'Annual', '2026-04-02', NULL, NULL, NULL, 0, NULL, NULL, '2026-04-04 07:54:08', '2026-04-04 07:54:08'),
(1684, 19, 4, 2026, 'Annual', '2026-02-02', '2026-02-02', '2026-02-09', '2026-02-14', 0, NULL, NULL, '2026-04-04 07:54:08', '2026-04-04 07:54:08'),
(1685, 19, 5, 2026, 'Annual', '2026-03-09', '2026-03-09', '2026-03-11', '2026-03-13', 0, NULL, NULL, '2026-04-04 07:54:08', '2026-04-04 07:54:08'),
(1686, 19, 6, 2026, 'Annual', '2026-04-04', '2026-04-02', '2026-04-09', '2026-04-18', 0, NULL, NULL, '2026-04-04 07:54:08', '2026-04-04 07:54:08'),
(1687, 19, 7, 2026, 'Annual', '2026-08-26', '2026-08-16', '2026-08-21', '2026-08-26', 0, NULL, NULL, '2026-04-04 07:54:08', '2026-04-04 07:54:08'),
(1688, 19, 8, 2026, 'Annual', '2025-11-28', '2025-11-28', '2025-12-06', '2025-12-12', 0, NULL, NULL, '2026-04-04 07:54:08', '2026-04-04 07:54:08'),
(1689, 19, 9, 2026, 'Annual', '2026-02-11', NULL, NULL, NULL, 0, NULL, NULL, '2026-04-04 07:54:08', '2026-04-04 07:54:08'),
(1690, 19, 10, 2026, 'Annual', '2026-01-31', '2026-01-18', '2026-01-22', '2026-01-28', 0, NULL, NULL, '2026-04-04 07:54:08', '2026-04-04 07:54:08'),
(1691, 20, 1, 2026, 'Annual', '2026-08-25', '2026-08-13', '2026-08-20', '2026-08-27', 0, NULL, NULL, '2026-04-04 07:54:08', '2026-04-04 07:54:08'),
(1692, 20, 2, 2026, 'Annual', '2026-03-29', '2026-03-20', '2026-03-20', '2026-03-22', 0, NULL, NULL, '2026-04-04 07:54:08', '2026-04-04 07:54:08'),
(1693, 20, 3, 2026, 'Annual', '2026-05-17', '2026-05-14', '2026-05-18', '2026-05-26', 0, NULL, NULL, '2026-04-04 07:54:08', '2026-04-04 07:54:08'),
(1694, 20, 4, 2026, 'Annual', '2025-12-15', '2025-12-02', '2025-12-02', '2025-12-06', 0, NULL, NULL, '2026-04-04 07:54:08', '2026-04-04 07:54:08'),
(1695, 20, 5, 2026, 'Annual', '2026-05-09', '2026-05-04', '2026-05-04', '2026-05-04', 0, NULL, NULL, '2026-04-04 07:54:08', '2026-04-04 07:54:08'),
(1696, 20, 6, 2026, 'Annual', '2026-06-26', '2026-06-24', '2026-06-27', '2026-07-04', 0, NULL, NULL, '2026-04-04 07:54:08', '2026-04-04 07:54:08'),
(1697, 20, 7, 2026, 'Annual', '2026-07-24', NULL, NULL, NULL, 0, NULL, NULL, '2026-04-04 07:54:08', '2026-04-04 07:54:08'),
(1698, 20, 8, 2026, 'Annual', '2026-01-14', '2026-01-03', '2026-01-05', '2026-01-09', 0, NULL, NULL, '2026-04-04 07:54:08', '2026-04-04 07:54:08'),
(1699, 20, 9, 2026, 'Annual', '2026-07-27', '2026-07-27', '2026-08-04', '2026-08-10', 0, NULL, NULL, '2026-04-04 07:54:08', '2026-04-04 07:54:08'),
(1700, 20, 10, 2026, 'Annual', '2026-01-31', '2026-01-23', '2026-01-26', '2026-01-29', 0, NULL, NULL, '2026-04-04 07:54:08', '2026-04-04 07:54:08'),
(1701, 21, 1, 2026, 'Annual', '2025-11-17', '2025-11-06', '2025-11-14', '2025-11-16', 0, NULL, NULL, '2026-04-04 07:54:08', '2026-04-04 07:54:08'),
(1702, 21, 2, 2026, 'Annual', '2025-11-13', '2025-11-13', '2025-11-20', '2025-11-25', 0, NULL, NULL, '2026-04-04 07:54:08', '2026-04-04 07:54:08'),
(1703, 21, 3, 2026, 'Annual', '2026-02-15', '2026-02-05', '2026-02-06', '2026-02-09', 0, NULL, NULL, '2026-04-04 07:54:08', '2026-04-04 07:54:08'),
(1704, 21, 4, 2026, 'Annual', '2026-08-16', '2026-08-16', '2026-08-21', '2026-09-01', 0, NULL, NULL, '2026-04-04 07:54:08', '2026-04-04 07:54:08'),
(1705, 21, 5, 2026, 'Annual', '2025-12-05', NULL, NULL, NULL, 0, NULL, NULL, '2026-04-04 07:54:08', '2026-04-04 07:54:08'),
(1706, 21, 6, 2026, 'Annual', '2026-01-02', '2025-12-20', '2025-12-24', '2025-12-30', 0, NULL, NULL, '2026-04-04 07:54:08', '2026-04-04 07:54:08'),
(1707, 21, 7, 2026, 'Annual', '2026-03-31', '2026-04-05', '2026-04-10', '2026-04-13', 0, NULL, NULL, '2026-04-04 07:54:08', '2026-04-04 07:54:08'),
(1708, 21, 8, 2026, 'Annual', '2026-04-02', NULL, NULL, NULL, 0, NULL, NULL, '2026-04-04 07:54:08', '2026-04-04 07:54:08'),
(1709, 21, 9, 2026, 'Annual', '2026-05-07', '2026-05-07', '2026-05-10', '2026-05-11', 0, NULL, NULL, '2026-04-04 07:54:08', '2026-04-04 07:54:08'),
(1710, 21, 10, 2026, 'Annual', '2026-05-13', NULL, NULL, NULL, 0, NULL, NULL, '2026-04-04 07:54:08', '2026-04-04 07:54:08'),
(1711, 22, 1, 2026, 'Annual', '2026-02-13', '2026-02-13', '2026-02-21', '2026-02-27', 0, NULL, NULL, '2026-04-04 07:54:08', '2026-04-04 07:54:08'),
(1712, 22, 2, 2026, 'Annual', '2026-06-26', '2026-06-26', '2026-07-01', '2026-07-02', 0, NULL, NULL, '2026-04-04 07:54:08', '2026-04-04 07:54:08'),
(1713, 22, 3, 2026, 'Annual', '2026-04-04', NULL, NULL, NULL, 0, NULL, NULL, '2026-04-04 07:54:08', '2026-04-04 07:54:08'),
(1714, 22, 4, 2026, 'Annual', '2026-02-02', '2026-02-09', '2026-02-16', '2026-02-21', 0, NULL, NULL, '2026-04-04 07:54:08', '2026-04-04 07:54:08'),
(1715, 22, 5, 2026, 'Annual', '2026-04-02', NULL, NULL, NULL, 0, NULL, NULL, '2026-04-04 07:54:08', '2026-04-04 07:54:08'),
(1716, 22, 6, 2026, 'Annual', '2026-02-03', '2026-02-03', '2026-02-05', '2026-02-07', 0, NULL, NULL, '2026-04-04 07:54:08', '2026-04-04 07:54:08'),
(1717, 22, 7, 2026, 'Annual', '2026-07-27', '2026-07-13', '2026-07-14', '2026-07-19', 0, NULL, NULL, '2026-04-04 07:54:08', '2026-04-04 07:54:08'),
(1718, 22, 8, 2026, 'Annual', '2026-06-23', '2026-06-09', '2026-06-14', '2026-06-21', 0, NULL, NULL, '2026-04-04 07:54:08', '2026-04-04 07:54:08'),
(1719, 22, 9, 2026, 'Annual', '2026-01-30', '2026-01-20', '2026-01-21', '2026-01-24', 0, NULL, NULL, '2026-04-04 07:54:08', '2026-04-04 07:54:08'),
(1720, 22, 10, 2026, 'Annual', '2026-05-31', '2026-05-27', '2026-06-01', '2026-06-10', 0, NULL, NULL, '2026-04-04 07:54:08', '2026-04-04 07:54:08'),
(1721, 23, 1, 2026, 'Annual', '2026-06-15', '2026-06-15', '2026-06-18', '2026-06-19', 0, NULL, NULL, '2026-04-04 07:54:08', '2026-04-04 07:54:08'),
(1722, 23, 2, 2026, 'Annual', '2026-01-16', '2026-01-07', '2026-01-13', '2026-01-13', 0, NULL, NULL, '2026-04-04 07:54:08', '2026-04-04 07:54:08'),
(1723, 23, 3, 2026, 'Annual', '2026-04-02', NULL, NULL, NULL, 0, NULL, NULL, '2026-04-04 07:54:08', '2026-04-04 07:54:08'),
(1724, 23, 4, 2026, 'Annual', '2025-12-11', '2025-12-11', '2025-12-19', '2025-12-23', 0, NULL, NULL, '2026-04-04 07:54:08', '2026-04-04 07:54:08'),
(1725, 23, 5, 2026, 'Annual', '2026-01-16', '2026-01-16', '2026-01-22', '2026-01-24', 0, NULL, NULL, '2026-04-04 07:54:08', '2026-04-04 07:54:08'),
(1726, 23, 6, 2026, 'Annual', '2026-07-23', '2026-07-20', '2026-07-24', '2026-08-01', 0, NULL, NULL, '2026-04-04 07:54:08', '2026-04-04 07:54:08'),
(1727, 23, 7, 2026, 'Annual', '2026-03-01', '2026-02-26', '2026-03-02', '2026-03-10', 0, NULL, NULL, '2026-04-04 07:54:08', '2026-04-04 07:54:08'),
(1728, 23, 8, 2026, 'Annual', '2026-05-29', NULL, NULL, NULL, 0, NULL, NULL, '2026-04-04 07:54:08', '2026-04-04 07:54:08'),
(1729, 23, 9, 2026, 'Annual', '2026-04-08', '2026-04-02', '2026-04-03', '2026-04-04', 0, NULL, NULL, '2026-04-04 07:54:08', '2026-04-04 07:54:08'),
(1730, 23, 10, 2026, 'Annual', '2026-03-30', '2026-04-06', '2026-04-13', '2026-04-18', 0, NULL, NULL, '2026-04-04 07:54:08', '2026-04-04 07:54:08'),
(1731, 24, 1, 2026, 'Annual', '2026-08-05', NULL, NULL, NULL, 0, NULL, NULL, '2026-04-04 07:54:08', '2026-04-04 07:54:08'),
(1732, 24, 2, 2026, 'Annual', '2026-04-02', NULL, NULL, NULL, 0, NULL, NULL, '2026-04-04 07:54:08', '2026-04-04 07:54:08'),
(1733, 24, 3, 2026, 'Annual', '2026-06-03', '2026-06-03', '2026-06-11', '2026-06-19', 0, NULL, NULL, '2026-04-04 07:54:08', '2026-04-04 07:54:08'),
(1734, 24, 4, 2026, 'Annual', '2026-02-22', '2026-02-25', '2026-02-28', '2026-03-01', 0, NULL, NULL, '2026-04-04 07:54:08', '2026-04-04 07:54:08'),
(1735, 24, 5, 2026, 'Annual', '2026-05-07', '2026-05-07', '2026-05-15', '2026-05-21', 0, NULL, NULL, '2026-04-04 07:54:08', '2026-04-04 07:54:08'),
(1736, 24, 6, 2026, 'Annual', '2026-06-12', '2026-06-12', '2026-06-15', '2026-06-16', 0, NULL, NULL, '2026-04-04 07:54:08', '2026-04-04 07:54:08'),
(1737, 24, 7, 2026, 'Annual', '2026-08-09', '2026-08-09', '2026-08-14', '2026-08-15', 0, NULL, NULL, '2026-04-04 07:54:08', '2026-04-04 07:54:08'),
(1738, 24, 8, 2026, 'Annual', '2026-05-21', '2026-05-09', '2026-05-18', '2026-05-21', 0, NULL, NULL, '2026-04-04 07:54:08', '2026-04-04 07:54:08'),
(1739, 24, 9, 2026, 'Annual', '2026-07-12', '2026-07-09', '2026-07-17', '2026-07-27', 0, NULL, NULL, '2026-04-04 07:54:08', '2026-04-04 07:54:08'),
(1740, 24, 10, 2026, 'Annual', '2026-07-25', NULL, NULL, NULL, 0, NULL, NULL, '2026-04-04 07:54:08', '2026-04-04 07:54:08'),
(1741, 25, 1, 2026, 'Annual', '2025-12-17', NULL, NULL, NULL, 0, NULL, NULL, '2026-04-04 07:54:08', '2026-04-04 07:54:08'),
(1742, 25, 2, 2026, 'Annual', '2026-06-27', '2026-06-27', '2026-06-30', '2026-07-11', 0, NULL, NULL, '2026-04-04 07:54:08', '2026-04-04 07:54:08'),
(1743, 25, 3, 2026, 'Annual', '2026-05-20', '2026-05-20', '2026-05-21', '2026-06-01', 0, NULL, NULL, '2026-04-04 07:54:08', '2026-04-04 07:54:08'),
(1744, 25, 4, 2026, 'Annual', '2026-08-10', '2026-08-10', '2026-08-12', '2026-08-12', 0, NULL, NULL, '2026-04-04 07:54:08', '2026-04-04 07:54:08'),
(1745, 25, 5, 2026, 'Annual', '2025-12-12', NULL, NULL, NULL, 0, NULL, NULL, '2026-04-04 07:54:08', '2026-04-04 07:54:08'),
(1746, 25, 6, 2026, 'Annual', '2025-12-21', '2025-12-27', '2026-01-02', '2026-01-06', 0, NULL, NULL, '2026-04-04 07:54:08', '2026-04-04 07:54:08'),
(1747, 25, 7, 2026, 'Annual', '2026-04-26', '2026-04-23', '2026-04-27', '2026-05-05', 0, NULL, NULL, '2026-04-04 07:54:08', '2026-04-04 07:54:08'),
(1748, 25, 8, 2026, 'Annual', '2026-06-22', '2026-06-18', '2026-06-23', '2026-07-02', 0, NULL, NULL, '2026-04-04 07:54:08', '2026-04-04 07:54:08'),
(1749, 25, 9, 2026, 'Annual', '2026-04-02', NULL, NULL, NULL, 0, NULL, NULL, '2026-04-04 07:54:08', '2026-04-04 07:54:08'),
(1750, 25, 10, 2026, 'Annual', '2026-06-23', '2026-06-23', '2026-06-28', '2026-07-01', 0, NULL, NULL, '2026-04-04 07:54:08', '2026-04-04 07:54:08'),
(1751, 26, 1, 2026, 'Annual', '2026-07-14', '2026-07-03', '2026-07-11', '2026-07-13', 0, NULL, NULL, '2026-04-04 07:54:08', '2026-04-04 07:54:08'),
(1752, 26, 2, 2026, 'Annual', '2026-03-17', '2026-03-17', '2026-03-22', '2026-03-23', 0, NULL, NULL, '2026-04-04 07:54:08', '2026-04-04 07:54:08'),
(1753, 26, 3, 2026, 'Annual', '2026-07-13', '2026-07-01', '2026-07-08', '2026-07-15', 0, NULL, NULL, '2026-04-04 07:54:08', '2026-04-04 07:54:08'),
(1754, 26, 4, 2026, 'Annual', '2026-02-18', '2026-02-18', '2026-02-23', '2026-03-06', 0, NULL, NULL, '2026-04-04 07:54:08', '2026-04-04 07:54:08'),
(1755, 26, 5, 2026, 'Annual', '2026-04-06', '2026-04-06', '2026-04-11', '2026-04-14', 0, NULL, NULL, '2026-04-04 07:54:08', '2026-04-04 07:54:08'),
(1756, 26, 6, 2026, 'Annual', '2026-02-27', '2026-02-27', '2026-03-01', '2026-03-03', 0, NULL, NULL, '2026-04-04 07:54:08', '2026-04-04 07:54:08'),
(1757, 26, 7, 2026, 'Annual', '2026-07-12', '2026-07-11', '2026-07-17', '2026-07-25', 0, NULL, NULL, '2026-04-04 07:54:08', '2026-04-04 07:54:08'),
(1758, 26, 8, 2026, 'Annual', '2026-03-01', '2026-02-25', '2026-03-06', '2026-03-17', 0, NULL, NULL, '2026-04-04 07:54:08', '2026-04-04 07:54:08'),
(1759, 26, 9, 2026, 'Annual', '2025-11-09', '2025-11-09', '2025-11-10', '2025-11-11', 0, NULL, NULL, '2026-04-04 07:54:08', '2026-04-04 07:54:08'),
(1760, 26, 10, 2026, 'Annual', '2025-12-14', '2025-12-20', '2025-12-26', '2025-12-30', 0, NULL, NULL, '2026-04-04 07:54:08', '2026-04-04 07:54:08'),
(1761, 27, 1, 2026, 'Annual', '2026-02-14', '2026-02-14', '2026-02-23', '2026-02-28', 0, NULL, NULL, '2026-04-04 07:54:08', '2026-04-04 07:54:08'),
(1762, 27, 2, 2026, 'Annual', '2026-04-02', NULL, NULL, NULL, 0, NULL, NULL, '2026-04-04 07:54:08', '2026-04-04 07:54:08'),
(1763, 27, 3, 2026, 'Annual', '2026-02-12', '2026-02-20', '2026-02-28', '2026-03-06', 0, NULL, NULL, '2026-04-04 07:54:08', '2026-04-04 07:54:08'),
(1764, 27, 4, 2026, 'Annual', '2026-02-06', '2026-02-03', '2026-02-11', '2026-02-21', 0, NULL, NULL, '2026-04-04 07:54:08', '2026-04-04 07:54:08'),
(1765, 27, 5, 2026, 'Annual', '2026-06-30', '2026-06-23', '2026-06-25', '2026-06-27', 0, NULL, NULL, '2026-04-04 07:54:08', '2026-04-04 07:54:08'),
(1766, 27, 6, 2026, 'Annual', '2026-08-29', '2026-08-29', '2026-09-05', '2026-09-10', 0, NULL, NULL, '2026-04-04 07:54:08', '2026-04-04 07:54:08'),
(1767, 27, 7, 2026, 'Annual', '2025-12-04', '2025-12-04', '2025-12-04', '2025-12-10', 0, NULL, NULL, '2026-04-04 07:54:08', '2026-04-04 07:54:08'),
(1768, 27, 8, 2026, 'Annual', '2026-03-09', '2026-03-13', '2026-03-17', '2026-03-19', 0, NULL, NULL, '2026-04-04 07:54:08', '2026-04-04 07:54:08'),
(1769, 27, 9, 2026, 'Annual', '2026-08-25', '2026-08-25', '2026-08-25', '2026-09-02', 0, NULL, NULL, '2026-04-04 07:54:08', '2026-04-04 07:54:08'),
(1770, 27, 10, 2026, 'Annual', '2026-06-29', NULL, NULL, NULL, 0, NULL, NULL, '2026-04-04 07:54:08', '2026-04-04 07:54:08');
INSERT INTO `entity_reporting_matrix` (`id`, `entity_id`, `item_id`, `reporting_year`, `reporting_month`, `deadline_date`, `submission_date`, `reviewed_date`, `completed_date`, `is_deleted`, `created_by`, `updated_by`, `created_at`, `updated_at`) VALUES
(1771, 28, 1, 2026, 'Annual', '2026-01-09', '2026-01-12', '2026-01-15', '2026-01-16', 0, NULL, NULL, '2026-04-04 07:54:08', '2026-04-04 07:54:08'),
(1772, 28, 2, 2026, 'Annual', '2025-12-26', '2025-12-28', '2025-12-30', '2025-12-30', 0, NULL, NULL, '2026-04-04 07:54:08', '2026-04-04 07:54:08'),
(1773, 28, 3, 2026, 'Annual', '2026-02-22', '2026-02-10', '2026-02-19', '2026-02-22', 0, NULL, NULL, '2026-04-04 07:54:08', '2026-04-04 07:54:08'),
(1774, 28, 4, 2026, 'Annual', '2025-12-28', '2025-12-23', '2025-12-23', '2025-12-23', 0, NULL, NULL, '2026-04-04 07:54:08', '2026-04-04 07:54:08'),
(1775, 28, 5, 2026, 'Annual', '2026-02-13', '2026-02-10', '2026-02-18', '2026-02-28', 0, NULL, NULL, '2026-04-04 07:54:08', '2026-04-04 07:54:08'),
(1776, 28, 6, 2026, 'Annual', '2026-06-29', NULL, NULL, NULL, 0, NULL, NULL, '2026-04-04 07:54:08', '2026-04-04 07:54:08'),
(1777, 28, 7, 2026, 'Annual', '2026-02-12', '2026-02-03', '2026-02-09', '2026-02-09', 0, NULL, NULL, '2026-04-04 07:54:08', '2026-04-04 07:54:08'),
(1778, 28, 8, 2026, 'Annual', '2026-02-19', '2026-02-19', '2026-02-23', '2026-02-25', 0, NULL, NULL, '2026-04-04 07:54:08', '2026-04-04 07:54:08'),
(1779, 28, 9, 2026, 'Annual', '2025-11-15', '2025-11-12', '2025-11-20', '2025-11-30', 0, NULL, NULL, '2026-04-04 07:54:08', '2026-04-04 07:54:08'),
(1780, 28, 10, 2026, 'Annual', '2026-01-31', '2026-01-31', '2026-02-04', '2026-02-06', 0, NULL, NULL, '2026-04-04 07:54:08', '2026-04-04 07:54:08'),
(1781, 29, 1, 2026, 'Annual', '2025-12-22', '2025-12-24', '2025-12-26', '2025-12-26', 0, NULL, NULL, '2026-04-04 07:54:08', '2026-04-04 07:54:08'),
(1782, 29, 2, 2026, 'Annual', '2026-04-02', NULL, NULL, NULL, 0, NULL, NULL, '2026-04-04 07:54:08', '2026-04-04 07:54:08'),
(1783, 29, 3, 2026, 'Annual', '2026-04-02', NULL, NULL, NULL, 0, NULL, NULL, '2026-04-04 07:54:08', '2026-04-04 07:54:08'),
(1784, 29, 4, 2026, 'Annual', '2026-02-12', NULL, NULL, NULL, 0, NULL, NULL, '2026-04-04 07:54:08', '2026-04-04 07:54:08'),
(1785, 29, 5, 2026, 'Annual', '2025-11-25', '2025-11-21', '2025-11-26', '2025-12-05', 0, NULL, NULL, '2026-04-04 07:54:08', '2026-04-04 07:54:08'),
(1786, 29, 6, 2026, 'Annual', '2026-04-26', '2026-04-26', '2026-05-05', '2026-05-12', 0, NULL, NULL, '2026-04-04 07:54:08', '2026-04-04 07:54:08'),
(1787, 29, 7, 2026, 'Annual', '2026-03-07', '2026-03-07', '2026-03-12', '2026-03-23', 0, NULL, NULL, '2026-04-04 07:54:08', '2026-04-04 07:54:08'),
(1788, 29, 8, 2026, 'Annual', '2026-07-06', '2026-06-24', '2026-06-27', '2026-07-02', 0, NULL, NULL, '2026-04-04 07:54:08', '2026-04-04 07:54:08'),
(1789, 29, 9, 2026, 'Annual', '2026-07-30', '2026-07-30', '2026-08-07', '2026-08-15', 0, NULL, NULL, '2026-04-04 07:54:08', '2026-04-04 07:54:08'),
(1790, 29, 10, 2026, 'Annual', '2026-01-01', '2026-01-01', '2026-01-03', '2026-01-13', 0, NULL, NULL, '2026-04-04 07:54:08', '2026-04-04 07:54:08'),
(1791, 30, 1, 2026, 'Annual', '2026-05-14', '2026-05-14', '2026-05-23', '2026-06-01', 0, NULL, NULL, '2026-04-04 07:54:08', '2026-04-04 07:54:08'),
(1792, 30, 2, 2026, 'Annual', '2025-12-02', '2025-11-30', '2025-12-03', '2025-12-10', 0, NULL, NULL, '2026-04-04 07:54:08', '2026-04-04 07:54:08'),
(1793, 30, 3, 2026, 'Annual', '2026-06-09', NULL, NULL, NULL, 0, NULL, NULL, '2026-04-04 07:54:08', '2026-04-04 07:54:08'),
(1794, 30, 4, 2026, 'Annual', '2026-06-11', '2026-06-06', '2026-06-06', '2026-06-06', 0, NULL, NULL, '2026-04-04 07:54:08', '2026-04-04 07:54:08'),
(1795, 30, 5, 2026, 'Annual', '2026-08-24', '2026-08-24', '2026-08-25', '2026-09-03', 0, NULL, NULL, '2026-04-04 07:54:08', '2026-04-04 07:54:08'),
(1796, 30, 6, 2026, 'Annual', '2026-03-05', '2026-02-26', '2026-03-06', '2026-03-06', 0, NULL, NULL, '2026-04-04 07:54:08', '2026-04-04 07:54:08'),
(1797, 30, 7, 2026, 'Annual', '2026-01-16', '2026-01-03', '2026-01-03', '2026-01-07', 0, NULL, NULL, '2026-04-04 07:54:08', '2026-04-04 07:54:08'),
(1798, 30, 8, 2026, 'Annual', '2026-04-21', '2026-04-21', '2026-04-25', '2026-05-05', 0, NULL, NULL, '2026-04-04 07:54:08', '2026-04-04 07:54:08'),
(1799, 30, 9, 2026, 'Annual', '2026-03-17', '2026-03-17', '2026-03-18', '2026-03-27', 0, NULL, NULL, '2026-04-04 07:54:08', '2026-04-04 07:54:08'),
(1800, 30, 10, 2026, 'Annual', '2026-01-17', '2026-01-16', '2026-01-22', '2026-01-30', 0, NULL, NULL, '2026-04-04 07:54:08', '2026-04-04 07:54:08'),
(1801, 31, 1, 2026, 'Annual', '2026-07-16', '2026-07-16', '2026-07-18', '2026-07-26', 0, NULL, NULL, '2026-04-04 07:54:08', '2026-04-04 07:54:08'),
(1802, 31, 2, 2026, 'Annual', '2026-08-26', '2026-08-26', '2026-08-30', '2026-09-09', 0, NULL, NULL, '2026-04-04 07:54:08', '2026-04-04 07:54:08'),
(1803, 31, 3, 2026, 'Annual', '2026-01-01', '2025-12-29', '2026-01-06', '2026-01-16', 0, NULL, NULL, '2026-04-04 07:54:08', '2026-04-04 07:54:08'),
(1804, 31, 4, 2026, 'Annual', '2025-11-23', '2025-11-11', '2025-11-18', '2025-11-25', 0, NULL, NULL, '2026-04-04 07:54:08', '2026-04-04 07:54:08'),
(1805, 31, 5, 2026, 'Annual', '2026-04-16', '2026-04-15', '2026-04-21', '2026-04-29', 0, NULL, NULL, '2026-04-04 07:54:08', '2026-04-04 07:54:08'),
(1806, 31, 6, 2026, 'Annual', '2026-05-03', '2026-05-03', '2026-05-06', '2026-05-17', 0, NULL, NULL, '2026-04-04 07:54:08', '2026-04-04 07:54:08'),
(1807, 31, 7, 2026, 'Annual', '2025-12-15', '2025-12-24', '2026-01-02', '2026-01-09', 0, NULL, NULL, '2026-04-04 07:54:08', '2026-04-04 07:54:08'),
(1808, 31, 8, 2026, 'Annual', '2026-07-24', NULL, NULL, NULL, 0, NULL, NULL, '2026-04-04 07:54:08', '2026-04-04 07:54:08'),
(1809, 31, 9, 2026, 'Annual', '2026-04-12', NULL, NULL, NULL, 0, NULL, NULL, '2026-04-04 07:54:08', '2026-04-04 07:54:08'),
(1810, 31, 10, 2026, 'Annual', '2026-08-11', '2026-07-31', '2026-08-02', '2026-08-06', 0, NULL, NULL, '2026-04-04 07:54:08', '2026-04-04 07:54:08'),
(1811, 32, 1, 2026, 'Annual', '2026-01-24', '2026-01-24', '2026-01-27', '2026-01-28', 0, NULL, NULL, '2026-04-04 07:54:08', '2026-04-04 07:54:08'),
(1812, 32, 2, 2026, 'Annual', '2026-01-28', '2026-01-17', '2026-01-19', '2026-01-23', 0, NULL, NULL, '2026-04-04 07:54:08', '2026-04-04 07:54:08'),
(1813, 32, 3, 2026, 'Annual', '2026-03-14', '2026-03-09', '2026-03-15', '2026-03-25', 0, NULL, NULL, '2026-04-04 07:54:08', '2026-04-04 07:54:08'),
(1814, 32, 4, 2026, 'Annual', '2026-08-11', '2026-08-11', '2026-08-11', '2026-08-21', 0, NULL, NULL, '2026-04-04 07:54:08', '2026-04-04 07:54:08'),
(1815, 32, 5, 2026, 'Annual', '2026-06-08', NULL, NULL, NULL, 0, NULL, NULL, '2026-04-04 07:54:08', '2026-04-04 07:54:08'),
(1816, 32, 6, 2026, 'Annual', '2026-02-11', '2026-02-14', '2026-02-17', '2026-02-18', 0, NULL, NULL, '2026-04-04 07:54:08', '2026-04-04 07:54:08'),
(1817, 32, 7, 2026, 'Annual', '2026-02-24', '2026-02-24', '2026-02-24', '2026-03-06', 0, NULL, NULL, '2026-04-04 07:54:08', '2026-04-04 07:54:08'),
(1818, 32, 8, 2026, 'Annual', '2026-04-02', NULL, NULL, NULL, 0, NULL, NULL, '2026-04-04 07:54:08', '2026-04-04 07:54:08'),
(1819, 32, 9, 2026, 'Annual', '2026-01-11', '2026-01-13', '2026-01-15', '2026-01-15', 0, NULL, NULL, '2026-04-04 07:54:08', '2026-04-04 07:54:08'),
(1820, 32, 10, 2026, 'Annual', '2026-01-05', '2026-01-05', '2026-01-08', '2026-01-17', 0, NULL, NULL, '2026-04-04 07:54:08', '2026-04-04 07:54:08'),
(1821, 33, 1, 2026, 'Annual', '2026-02-26', '2026-02-26', '2026-02-28', '2026-03-08', 0, NULL, NULL, '2026-04-04 07:54:08', '2026-04-04 07:54:08'),
(1822, 33, 2, 2026, 'Annual', '2026-01-24', '2026-02-02', '2026-02-11', '2026-02-18', 0, NULL, NULL, '2026-04-04 07:54:08', '2026-04-04 07:54:08'),
(1823, 33, 3, 2026, 'Annual', '2025-12-17', '2025-12-17', '2025-12-20', '2025-12-29', 0, NULL, NULL, '2026-04-04 07:54:08', '2026-04-04 07:54:08'),
(1824, 33, 4, 2026, 'Annual', '2026-03-29', '2026-03-29', '2026-04-03', '2026-04-08', 0, NULL, NULL, '2026-04-04 07:54:08', '2026-04-04 07:54:08'),
(1825, 33, 5, 2026, 'Annual', '2026-03-12', '2026-03-23', '2026-03-24', '2026-04-02', 0, NULL, NULL, '2026-04-04 07:54:08', '2026-04-04 07:54:08'),
(1826, 33, 6, 2026, 'Annual', '2026-03-21', '2026-03-21', '2026-03-21', '2026-03-29', 0, NULL, NULL, '2026-04-04 07:54:08', '2026-04-04 07:54:08'),
(1827, 33, 7, 2026, 'Annual', '2026-05-07', '2026-05-07', '2026-05-16', '2026-05-21', 0, NULL, NULL, '2026-04-04 07:54:08', '2026-04-04 07:54:08'),
(1828, 33, 8, 2026, 'Annual', '2026-03-02', '2026-02-22', '2026-03-03', '2026-03-04', 0, NULL, NULL, '2026-04-04 07:54:08', '2026-04-04 07:54:08'),
(1829, 33, 9, 2026, 'Annual', '2026-06-18', '2026-06-18', '2026-06-25', '2026-06-28', 0, NULL, NULL, '2026-04-04 07:54:08', '2026-04-04 07:54:08'),
(1830, 33, 10, 2026, 'Annual', '2026-07-29', '2026-07-29', '2026-08-06', '2026-08-12', 0, NULL, NULL, '2026-04-04 07:54:08', '2026-04-04 07:54:08'),
(1831, 34, 1, 2026, 'Annual', '2026-07-06', '2026-07-06', '2026-07-15', '2026-07-24', 0, NULL, NULL, '2026-04-04 07:54:08', '2026-04-04 07:54:08'),
(1832, 34, 2, 2026, 'Annual', '2026-06-29', '2026-06-20', '2026-06-24', '2026-06-28', 0, NULL, NULL, '2026-04-04 07:54:08', '2026-04-04 07:54:08'),
(1833, 34, 3, 2026, 'Annual', '2026-07-23', NULL, NULL, NULL, 0, NULL, NULL, '2026-04-04 07:54:08', '2026-04-04 07:54:08'),
(1834, 34, 4, 2026, 'Annual', '2026-03-19', '2026-03-31', '2026-04-02', '2026-04-12', 0, NULL, NULL, '2026-04-04 07:54:08', '2026-04-04 07:54:08'),
(1835, 34, 5, 2026, 'Annual', '2026-03-26', '2026-03-30', '2026-04-03', '2026-04-05', 0, NULL, NULL, '2026-04-04 07:54:08', '2026-04-04 07:54:08'),
(1836, 34, 6, 2026, 'Annual', '2026-07-29', '2026-07-29', '2026-08-02', '2026-08-06', 0, NULL, NULL, '2026-04-04 07:54:08', '2026-04-04 07:54:08'),
(1837, 34, 7, 2026, 'Annual', '2026-05-19', '2026-05-14', '2026-05-20', '2026-05-30', 0, NULL, NULL, '2026-04-04 07:54:08', '2026-04-04 07:54:08'),
(1838, 34, 8, 2026, 'Annual', '2026-03-03', '2026-02-20', '2026-02-26', '2026-03-04', 0, NULL, NULL, '2026-04-04 07:54:08', '2026-04-04 07:54:08'),
(1839, 34, 9, 2026, 'Annual', '2026-07-26', '2026-07-17', '2026-07-21', '2026-07-25', 0, NULL, NULL, '2026-04-04 07:54:08', '2026-04-04 07:54:08'),
(1840, 34, 10, 2026, 'Annual', '2026-03-04', '2026-02-25', '2026-02-27', '2026-03-01', 0, NULL, NULL, '2026-04-04 07:54:08', '2026-04-04 07:54:08'),
(1841, 35, 1, 2026, 'Annual', '2026-06-16', '2026-06-05', '2026-06-07', '2026-06-11', 0, NULL, NULL, '2026-04-04 07:54:08', '2026-04-04 07:54:08'),
(1842, 35, 2, 2026, 'Annual', '2025-12-23', '2026-01-05', '2026-01-06', '2026-01-17', 0, NULL, NULL, '2026-04-04 07:54:08', '2026-04-04 07:54:08'),
(1843, 35, 3, 2026, 'Annual', '2026-08-18', '2026-08-18', '2026-08-24', '2026-08-28', 0, NULL, NULL, '2026-04-04 07:54:08', '2026-04-04 07:54:08'),
(1844, 35, 4, 2026, 'Annual', '2026-04-21', '2026-04-21', '2026-04-26', '2026-05-01', 0, NULL, NULL, '2026-04-04 07:54:08', '2026-04-04 07:54:08'),
(1845, 35, 5, 2026, 'Annual', '2026-06-19', '2026-06-09', '2026-06-14', '2026-06-19', 0, NULL, NULL, '2026-04-04 07:54:08', '2026-04-04 07:54:08'),
(1846, 35, 6, 2026, 'Annual', '2026-06-10', NULL, NULL, NULL, 0, NULL, NULL, '2026-04-04 07:54:08', '2026-04-04 07:54:08'),
(1847, 35, 7, 2026, 'Annual', '2026-02-27', '2026-03-10', '2026-03-19', '2026-03-28', 0, NULL, NULL, '2026-04-04 07:54:08', '2026-04-04 07:54:08'),
(1848, 35, 8, 2026, 'Annual', '2026-04-24', '2026-04-14', '2026-04-19', '2026-04-24', 0, NULL, NULL, '2026-04-04 07:54:08', '2026-04-04 07:54:08'),
(1849, 35, 9, 2026, 'Annual', '2025-11-05', '2025-11-17', '2025-11-19', '2025-11-29', 0, NULL, NULL, '2026-04-04 07:54:08', '2026-04-04 07:54:08'),
(1850, 35, 10, 2026, 'Annual', '2025-12-05', '2025-12-15', '2025-12-15', '2025-12-23', 0, NULL, NULL, '2026-04-04 07:54:08', '2026-04-04 07:54:08'),
(1851, 36, 1, 2026, 'Annual', '2026-02-11', '2026-02-10', '2026-02-16', '2026-02-24', 0, NULL, NULL, '2026-04-04 07:54:08', '2026-04-04 07:54:08'),
(1852, 36, 2, 2026, 'Annual', '2026-04-15', NULL, NULL, NULL, 0, NULL, NULL, '2026-04-04 07:54:08', '2026-04-04 07:54:08'),
(1853, 36, 3, 2026, 'Annual', '2026-06-09', '2026-06-09', '2026-06-11', '2026-06-21', 0, NULL, NULL, '2026-04-04 07:54:08', '2026-04-04 07:54:08'),
(1854, 36, 4, 2026, 'Annual', '2026-07-18', '2026-07-10', '2026-07-13', '2026-07-16', 0, NULL, NULL, '2026-04-04 07:54:08', '2026-04-04 07:54:08'),
(1855, 36, 5, 2026, 'Annual', '2026-02-23', '2026-02-10', '2026-02-10', '2026-02-14', 0, NULL, NULL, '2026-04-04 07:54:08', '2026-04-04 07:54:08'),
(1856, 36, 6, 2026, 'Annual', '2026-04-19', '2026-04-17', '2026-04-20', '2026-04-27', 0, NULL, NULL, '2026-04-04 07:54:08', '2026-04-04 07:54:08'),
(1857, 36, 7, 2026, 'Annual', '2025-12-28', '2025-12-28', '2025-12-29', '2026-01-09', 0, NULL, NULL, '2026-04-04 07:54:08', '2026-04-04 07:54:08'),
(1858, 36, 8, 2026, 'Annual', '2026-07-11', '2026-07-06', '2026-07-06', '2026-07-06', 0, NULL, NULL, '2026-04-04 07:54:08', '2026-04-04 07:54:08'),
(1859, 36, 9, 2026, 'Annual', '2026-03-13', '2026-03-13', '2026-03-21', '2026-03-29', 0, NULL, NULL, '2026-04-04 07:54:08', '2026-04-04 07:54:08'),
(1860, 36, 10, 2026, 'Annual', '2026-01-17', '2026-01-28', '2026-02-06', '2026-02-15', 0, NULL, NULL, '2026-04-04 07:54:08', '2026-04-04 07:54:08'),
(1861, 37, 1, 2026, 'Annual', '2026-06-07', '2026-05-26', '2026-06-04', '2026-06-07', 0, NULL, NULL, '2026-04-04 07:54:08', '2026-04-04 07:54:08'),
(1862, 37, 2, 2026, 'Annual', '2026-05-28', '2026-05-28', '2026-05-31', '2026-06-09', 0, NULL, NULL, '2026-04-04 07:54:08', '2026-04-04 07:54:08'),
(1863, 37, 3, 2026, 'Annual', '2025-11-26', '2025-11-16', '2025-11-21', '2025-11-26', 0, NULL, NULL, '2026-04-04 07:54:08', '2026-04-04 07:54:08'),
(1864, 37, 4, 2026, 'Annual', '2026-01-14', '2026-01-09', '2026-01-15', '2026-01-25', 0, NULL, NULL, '2026-04-04 07:54:08', '2026-04-04 07:54:08'),
(1865, 37, 5, 2026, 'Annual', '2026-04-22', '2026-04-22', '2026-05-01', '2026-05-08', 0, NULL, NULL, '2026-04-04 07:54:09', '2026-04-04 07:54:09'),
(1866, 37, 6, 2026, 'Annual', '2025-11-08', '2025-11-08', '2025-11-12', '2025-11-14', 0, NULL, NULL, '2026-04-04 07:54:09', '2026-04-04 07:54:09'),
(1867, 37, 7, 2026, 'Annual', '2026-04-02', NULL, NULL, NULL, 0, NULL, NULL, '2026-04-04 07:54:09', '2026-04-04 07:54:09'),
(1868, 37, 8, 2026, 'Annual', '2025-12-12', '2025-12-06', '2025-12-13', '2025-12-24', 0, NULL, NULL, '2026-04-04 07:54:09', '2026-04-04 07:54:09'),
(1869, 37, 9, 2026, 'Annual', '2025-11-12', '2025-11-12', '2025-11-19', '2025-11-22', 0, NULL, NULL, '2026-04-04 07:54:09', '2026-04-04 07:54:09'),
(1870, 37, 10, 2026, 'Annual', '2025-12-14', '2025-12-08', '2025-12-09', '2025-12-10', 0, NULL, NULL, '2026-04-04 07:54:09', '2026-04-04 07:54:09'),
(1871, 38, 1, 2026, 'Annual', '2026-05-02', '2026-05-02', '2026-05-10', '2026-05-18', 0, NULL, NULL, '2026-04-04 07:54:09', '2026-04-04 07:54:09'),
(1872, 38, 2, 2026, 'Annual', '2026-04-21', NULL, NULL, NULL, 0, NULL, NULL, '2026-04-04 07:54:09', '2026-04-04 07:54:09'),
(1873, 38, 3, 2026, 'Annual', '2026-03-15', '2026-03-26', '2026-03-27', '2026-04-05', 0, NULL, NULL, '2026-04-04 07:54:09', '2026-04-04 07:54:09'),
(1874, 38, 4, 2026, 'Annual', '2026-03-21', '2026-03-21', '2026-03-30', '2026-04-04', 0, NULL, NULL, '2026-04-04 07:54:09', '2026-04-04 07:54:09'),
(1875, 38, 5, 2026, 'Annual', '2026-08-12', '2026-08-12', '2026-08-17', '2026-08-22', 0, NULL, NULL, '2026-04-04 07:54:09', '2026-04-04 07:54:09'),
(1876, 38, 6, 2026, 'Annual', '2026-04-02', NULL, NULL, NULL, 0, NULL, NULL, '2026-04-04 07:54:09', '2026-04-04 07:54:09'),
(1877, 38, 7, 2026, 'Annual', '2026-02-14', '2026-02-14', '2026-02-15', '2026-02-16', 0, NULL, NULL, '2026-04-04 07:54:09', '2026-04-04 07:54:09'),
(1878, 38, 8, 2026, 'Annual', '2026-01-27', '2026-01-27', '2026-02-05', '2026-02-14', 0, NULL, NULL, '2026-04-04 07:54:09', '2026-04-04 07:54:09'),
(1879, 38, 9, 2026, 'Annual', '2026-03-30', '2026-03-30', '2026-03-31', '2026-04-07', 0, NULL, NULL, '2026-04-04 07:54:09', '2026-04-04 07:54:09'),
(1880, 38, 10, 2026, 'Annual', '2026-03-28', '2026-04-05', '2026-04-13', '2026-04-19', 0, NULL, NULL, '2026-04-04 07:54:09', '2026-04-04 07:54:09'),
(1881, 39, 1, 2026, 'Annual', '2026-03-01', '2026-03-14', '2026-03-15', '2026-03-26', 0, NULL, NULL, '2026-04-04 07:54:09', '2026-04-04 07:54:09'),
(1882, 39, 2, 2026, 'Annual', '2026-02-05', '2026-01-29', '2026-01-31', '2026-02-02', 0, NULL, NULL, '2026-04-04 07:54:09', '2026-04-04 07:54:09'),
(1883, 39, 3, 2026, 'Annual', '2026-01-24', '2026-01-26', '2026-01-28', '2026-01-28', 0, NULL, NULL, '2026-04-04 07:54:09', '2026-04-04 07:54:09'),
(1884, 39, 4, 2026, 'Annual', '2025-11-10', '2025-11-16', '2025-11-22', '2025-11-26', 0, NULL, NULL, '2026-04-04 07:54:09', '2026-04-04 07:54:09'),
(1885, 39, 5, 2026, 'Annual', '2026-04-02', NULL, NULL, NULL, 0, NULL, NULL, '2026-04-04 07:54:09', '2026-04-04 07:54:09'),
(1886, 39, 6, 2026, 'Annual', '2026-07-26', '2026-07-26', '2026-07-27', '2026-08-03', 0, NULL, NULL, '2026-04-04 07:54:09', '2026-04-04 07:54:09'),
(1887, 39, 7, 2026, 'Annual', '2025-12-17', '2025-12-19', '2025-12-21', '2025-12-21', 0, NULL, NULL, '2026-04-04 07:54:09', '2026-04-04 07:54:09'),
(1888, 39, 8, 2026, 'Annual', '2026-03-02', '2026-03-02', '2026-03-10', '2026-03-18', 0, NULL, NULL, '2026-04-04 07:54:09', '2026-04-04 07:54:09'),
(1889, 39, 9, 2026, 'Annual', '2026-07-26', NULL, NULL, NULL, 0, NULL, NULL, '2026-04-04 07:54:09', '2026-04-04 07:54:09'),
(1890, 39, 10, 2026, 'Annual', '2026-02-26', '2026-02-16', '2026-02-17', '2026-02-20', 0, NULL, NULL, '2026-04-04 07:54:09', '2026-04-04 07:54:09'),
(1891, 40, 1, 2026, 'Annual', '2025-12-04', '2025-12-04', '2025-12-06', '2025-12-06', 0, NULL, NULL, '2026-04-04 07:54:09', '2026-04-04 07:54:09'),
(1892, 40, 2, 2026, 'Annual', '2026-04-14', '2026-04-14', '2026-04-17', '2026-04-20', 0, NULL, NULL, '2026-04-04 07:54:09', '2026-04-04 07:54:09'),
(1893, 40, 3, 2026, 'Annual', '2026-03-11', '2026-02-26', '2026-03-06', '2026-03-14', 0, NULL, NULL, '2026-04-04 07:54:09', '2026-04-04 07:54:09'),
(1894, 40, 4, 2026, 'Annual', '2026-05-13', '2026-05-03', '2026-05-08', '2026-05-13', 0, NULL, NULL, '2026-04-04 07:54:09', '2026-04-04 07:54:09'),
(1895, 40, 5, 2026, 'Annual', '2026-06-29', '2026-06-17', '2026-06-20', '2026-06-25', 0, NULL, NULL, '2026-04-04 07:54:09', '2026-04-04 07:54:09'),
(1896, 40, 6, 2026, 'Annual', '2026-05-08', '2026-04-24', '2026-04-29', '2026-05-06', 0, NULL, NULL, '2026-04-04 07:54:09', '2026-04-04 07:54:09'),
(1897, 40, 7, 2026, 'Annual', '2026-08-20', '2026-08-20', '2026-08-21', '2026-08-22', 0, NULL, NULL, '2026-04-04 07:54:09', '2026-04-04 07:54:09'),
(1898, 40, 8, 2026, 'Annual', '2026-05-10', '2026-05-10', '2026-05-13', '2026-05-22', 0, NULL, NULL, '2026-04-04 07:54:09', '2026-04-04 07:54:09'),
(1899, 40, 9, 2026, 'Annual', '2026-06-29', '2026-06-29', '2026-07-01', '2026-07-03', 0, NULL, NULL, '2026-04-04 07:54:09', '2026-04-04 07:54:09'),
(1900, 40, 10, 2026, 'Annual', '2026-08-13', '2026-08-13', '2026-08-14', '2026-08-25', 0, NULL, NULL, '2026-04-04 07:54:09', '2026-04-04 07:54:09'),
(1901, 41, 1, 2026, 'Annual', '2026-03-01', '2026-03-01', '2026-03-04', '2026-03-15', 0, NULL, NULL, '2026-04-04 07:54:09', '2026-04-04 07:54:09'),
(1902, 41, 2, 2026, 'Annual', '2025-11-24', '2025-12-02', '2025-12-10', '2025-12-16', 0, NULL, NULL, '2026-04-04 07:54:09', '2026-04-04 07:54:09'),
(1903, 41, 3, 2026, 'Annual', '2026-02-08', '2026-01-27', '2026-02-05', '2026-02-08', 0, NULL, NULL, '2026-04-04 07:54:09', '2026-04-04 07:54:09'),
(1904, 41, 4, 2026, 'Annual', '2026-01-19', '2026-01-19', '2026-01-27', '2026-02-04', 0, NULL, NULL, '2026-04-04 07:54:09', '2026-04-04 07:54:09'),
(1905, 41, 5, 2026, 'Annual', '2026-06-13', '2026-06-13', '2026-06-19', '2026-06-23', 0, NULL, NULL, '2026-04-04 07:54:09', '2026-04-04 07:54:09'),
(1906, 41, 6, 2026, 'Annual', '2026-06-10', NULL, NULL, NULL, 0, NULL, NULL, '2026-04-04 07:54:09', '2026-04-04 07:54:09'),
(1907, 41, 7, 2026, 'Annual', '2026-08-18', '2026-08-05', '2026-08-13', '2026-08-21', 0, NULL, NULL, '2026-04-04 07:54:09', '2026-04-04 07:54:09'),
(1908, 41, 8, 2026, 'Annual', '2025-11-24', '2025-11-11', '2025-11-19', '2025-11-27', 0, NULL, NULL, '2026-04-04 07:54:09', '2026-04-04 07:54:09'),
(1909, 41, 9, 2026, 'Annual', '2026-01-03', '2026-01-03', '2026-01-10', '2026-01-15', 0, NULL, NULL, '2026-04-04 07:54:09', '2026-04-04 07:54:09'),
(1910, 41, 10, 2026, 'Annual', '2026-06-08', '2026-05-29', '2026-06-05', '2026-06-06', 0, NULL, NULL, '2026-04-04 07:54:09', '2026-04-04 07:54:09'),
(1911, 42, 1, 2026, 'Annual', '2026-08-25', '2026-08-25', '2026-09-03', '2026-09-10', 0, NULL, NULL, '2026-04-04 07:54:09', '2026-04-04 07:54:09'),
(1912, 42, 2, 2026, 'Annual', '2026-04-11', '2026-04-11', '2026-04-16', '2026-04-21', 0, NULL, NULL, '2026-04-04 07:54:09', '2026-04-04 07:54:09'),
(1913, 42, 3, 2026, 'Annual', '2026-06-09', '2026-06-09', '2026-06-12', '2026-06-13', 0, NULL, NULL, '2026-04-04 07:54:09', '2026-04-04 07:54:09'),
(1914, 42, 4, 2026, 'Annual', '2026-03-09', '2026-02-26', '2026-03-04', '2026-03-10', 0, NULL, NULL, '2026-04-04 07:54:09', '2026-04-04 07:54:09'),
(1915, 42, 5, 2026, 'Annual', '2026-05-03', '2026-05-03', '2026-05-04', '2026-05-15', 0, NULL, NULL, '2026-04-04 07:54:09', '2026-04-04 07:54:09'),
(1916, 42, 6, 2026, 'Annual', '2026-03-29', '2026-04-10', '2026-04-10', '2026-04-20', 0, NULL, NULL, '2026-04-04 07:54:09', '2026-04-04 07:54:09'),
(1917, 42, 7, 2026, 'Annual', '2025-12-31', '2025-12-31', '2026-01-06', '2026-01-12', 0, NULL, NULL, '2026-04-04 07:54:09', '2026-04-04 07:54:09'),
(1918, 42, 8, 2026, 'Annual', '2026-01-10', '2026-01-10', '2026-01-11', '2026-01-18', 0, NULL, NULL, '2026-04-04 07:54:09', '2026-04-04 07:54:09'),
(1919, 42, 9, 2026, 'Annual', '2026-03-29', '2026-03-17', '2026-03-24', '2026-03-31', 0, NULL, NULL, '2026-04-04 07:54:09', '2026-04-04 07:54:09'),
(1920, 42, 10, 2026, 'Annual', '2026-03-05', NULL, NULL, NULL, 0, NULL, NULL, '2026-04-04 07:54:09', '2026-04-04 07:54:09'),
(1921, 43, 1, 2026, 'Annual', '2026-05-31', '2026-05-31', '2026-05-31', '2026-06-10', 0, NULL, NULL, '2026-04-04 07:54:09', '2026-04-04 07:54:09'),
(1922, 43, 2, 2026, 'Annual', '2026-04-22', '2026-04-22', '2026-04-22', '2026-04-30', 0, NULL, NULL, '2026-04-04 07:54:09', '2026-04-04 07:54:09'),
(1923, 43, 3, 2026, 'Annual', '2026-04-02', NULL, NULL, NULL, 0, NULL, NULL, '2026-04-04 07:54:09', '2026-04-04 07:54:09'),
(1924, 43, 4, 2026, 'Annual', '2026-03-25', '2026-04-05', '2026-04-14', '2026-04-23', 0, NULL, NULL, '2026-04-04 07:54:09', '2026-04-04 07:54:09'),
(1925, 43, 5, 2026, 'Annual', '2026-04-08', '2026-03-28', '2026-04-03', '2026-04-09', 0, NULL, NULL, '2026-04-04 07:54:09', '2026-04-04 07:54:09'),
(1926, 43, 6, 2026, 'Annual', '2026-08-04', '2026-08-04', '2026-08-13', '2026-08-18', 0, NULL, NULL, '2026-04-04 07:54:09', '2026-04-04 07:54:09'),
(1927, 43, 7, 2026, 'Annual', '2026-04-02', NULL, NULL, NULL, 0, NULL, NULL, '2026-04-04 07:54:09', '2026-04-04 07:54:09'),
(1928, 43, 8, 2026, 'Annual', '2026-05-20', '2026-05-17', '2026-05-25', '2026-06-04', 0, NULL, NULL, '2026-04-04 07:54:09', '2026-04-04 07:54:09'),
(1929, 43, 9, 2026, 'Annual', '2026-04-05', '2026-04-04', '2026-04-06', '2026-04-12', 0, NULL, NULL, '2026-04-04 07:54:09', '2026-04-04 07:54:09'),
(1930, 43, 10, 2026, 'Annual', '2026-01-25', '2026-01-22', '2026-01-30', '2026-02-09', 0, NULL, NULL, '2026-04-04 07:54:09', '2026-04-04 07:54:09'),
(1931, 44, 1, 2026, 'Annual', '2026-05-07', '2026-05-07', '2026-05-07', '2026-05-13', 0, NULL, NULL, '2026-04-04 07:54:09', '2026-04-04 07:54:09'),
(1932, 44, 2, 2026, 'Annual', '2025-11-18', '2025-11-18', '2025-11-27', '2025-12-02', 0, NULL, NULL, '2026-04-04 07:54:09', '2026-04-04 07:54:09'),
(1933, 44, 3, 2026, 'Annual', '2026-02-15', '2026-02-26', '2026-03-07', '2026-03-16', 0, NULL, NULL, '2026-04-04 07:54:09', '2026-04-04 07:54:09'),
(1934, 44, 4, 2026, 'Annual', '2025-12-21', '2025-12-21', '2025-12-26', '2025-12-31', 0, NULL, NULL, '2026-04-04 07:54:09', '2026-04-04 07:54:09'),
(1935, 44, 5, 2026, 'Annual', '2025-11-16', '2025-11-06', '2025-11-07', '2025-11-10', 0, NULL, NULL, '2026-04-04 07:54:09', '2026-04-04 07:54:09'),
(1936, 44, 6, 2026, 'Annual', '2026-07-11', '2026-06-28', '2026-07-02', '2026-07-08', 0, NULL, NULL, '2026-04-04 07:54:09', '2026-04-04 07:54:09'),
(1937, 44, 7, 2026, 'Annual', '2026-08-27', '2026-08-21', '2026-08-22', '2026-08-23', 0, NULL, NULL, '2026-04-04 07:54:09', '2026-04-04 07:54:09'),
(1938, 44, 8, 2026, 'Annual', '2025-12-28', '2025-12-16', '2025-12-23', '2025-12-30', 0, NULL, NULL, '2026-04-04 07:54:09', '2026-04-04 07:54:09'),
(1939, 44, 9, 2026, 'Annual', '2025-12-24', '2025-12-24', '2025-12-31', '2026-01-07', 0, NULL, NULL, '2026-04-04 07:54:09', '2026-04-04 07:54:09'),
(1940, 44, 10, 2026, 'Annual', '2026-03-29', '2026-03-19', '2026-03-20', '2026-03-23', 0, NULL, NULL, '2026-04-04 07:54:09', '2026-04-04 07:54:09'),
(1941, 45, 1, 2026, 'Annual', '2026-02-03', NULL, NULL, NULL, 0, NULL, NULL, '2026-04-04 07:54:09', '2026-04-04 07:54:09'),
(1942, 45, 2, 2026, 'Annual', '2026-01-09', '2025-12-31', '2026-01-04', '2026-01-08', 0, NULL, NULL, '2026-04-04 07:54:09', '2026-04-04 07:54:09'),
(1943, 45, 3, 2026, 'Annual', '2026-07-21', '2026-07-21', '2026-07-25', '2026-07-29', 0, NULL, NULL, '2026-04-04 07:54:09', '2026-04-04 07:54:09'),
(1944, 45, 4, 2026, 'Annual', '2026-04-29', '2026-04-28', '2026-05-04', '2026-05-12', 0, NULL, NULL, '2026-04-04 07:54:09', '2026-04-04 07:54:09'),
(1945, 45, 5, 2026, 'Annual', '2026-06-14', '2026-06-14', '2026-06-18', '2026-06-28', 0, NULL, NULL, '2026-04-04 07:54:09', '2026-04-04 07:54:09'),
(1946, 45, 6, 2026, 'Annual', '2026-01-18', '2026-01-16', '2026-01-23', '2026-02-01', 0, NULL, NULL, '2026-04-04 07:54:09', '2026-04-04 07:54:09'),
(1947, 45, 7, 2026, 'Annual', '2026-03-04', '2026-02-19', '2026-02-27', '2026-03-07', 0, NULL, NULL, '2026-04-04 07:54:09', '2026-04-04 07:54:09'),
(1948, 45, 8, 2026, 'Annual', '2025-12-01', '2025-12-05', '2025-12-09', '2025-12-11', 0, NULL, NULL, '2026-04-04 07:54:09', '2026-04-04 07:54:09'),
(1949, 45, 9, 2026, 'Annual', '2026-05-17', '2026-05-04', '2026-05-08', '2026-05-14', 0, NULL, NULL, '2026-04-04 07:54:09', '2026-04-04 07:54:09'),
(1950, 45, 10, 2026, 'Annual', '2025-11-17', '2025-11-17', '2025-11-20', '2025-11-23', 0, NULL, NULL, '2026-04-04 07:54:09', '2026-04-04 07:54:09'),
(1951, 46, 1, 2026, 'Annual', '2026-04-28', NULL, NULL, NULL, 0, NULL, NULL, '2026-04-04 07:54:09', '2026-04-04 07:54:09'),
(1952, 46, 2, 2026, 'Annual', '2026-02-13', '2026-02-25', '2026-02-25', '2026-03-07', 0, NULL, NULL, '2026-04-04 07:54:09', '2026-04-04 07:54:09'),
(1953, 46, 3, 2026, 'Annual', '2026-05-11', '2026-05-09', '2026-05-12', '2026-05-19', 0, NULL, NULL, '2026-04-04 07:54:09', '2026-04-04 07:54:09'),
(1954, 46, 4, 2026, 'Annual', '2026-03-29', '2026-03-20', '2026-03-24', '2026-03-28', 0, NULL, NULL, '2026-04-04 07:54:09', '2026-04-04 07:54:09'),
(1955, 46, 5, 2026, 'Annual', '2026-05-13', '2026-05-08', '2026-05-08', '2026-05-08', 0, NULL, NULL, '2026-04-04 07:54:09', '2026-04-04 07:54:09'),
(1956, 46, 6, 2026, 'Annual', '2026-07-01', '2026-06-20', '2026-06-26', '2026-07-02', 0, NULL, NULL, '2026-04-04 07:54:09', '2026-04-04 07:54:09'),
(1957, 46, 7, 2026, 'Annual', '2026-08-19', '2026-08-14', '2026-08-14', '2026-08-14', 0, NULL, NULL, '2026-04-04 07:54:09', '2026-04-04 07:54:09'),
(1958, 46, 8, 2026, 'Annual', '2025-12-29', '2025-12-31', '2026-01-02', '2026-01-02', 0, NULL, NULL, '2026-04-04 07:54:09', '2026-04-04 07:54:09'),
(1959, 46, 9, 2026, 'Annual', '2026-03-23', NULL, NULL, NULL, 0, NULL, NULL, '2026-04-04 07:54:09', '2026-04-04 07:54:09'),
(1960, 46, 10, 2026, 'Annual', '2026-08-20', '2026-08-07', '2026-08-15', '2026-08-23', 0, NULL, NULL, '2026-04-04 07:54:09', '2026-04-04 07:54:09'),
(1961, 47, 1, 2026, 'Annual', '2026-06-16', '2026-06-05', '2026-06-13', '2026-06-15', 0, NULL, NULL, '2026-04-04 07:54:09', '2026-04-04 07:54:09'),
(1962, 47, 2, 2026, 'Annual', '2026-04-25', NULL, NULL, NULL, 0, NULL, NULL, '2026-04-04 07:54:09', '2026-04-04 07:54:09'),
(1963, 47, 3, 2026, 'Annual', '2026-03-08', '2026-03-07', '2026-03-09', '2026-03-15', 0, NULL, NULL, '2026-04-04 07:54:09', '2026-04-04 07:54:09'),
(1964, 47, 4, 2026, 'Annual', '2026-05-10', '2026-04-26', '2026-05-01', '2026-05-08', 0, NULL, NULL, '2026-04-04 07:54:09', '2026-04-04 07:54:09'),
(1965, 47, 5, 2026, 'Annual', '2026-06-26', '2026-06-12', '2026-06-17', '2026-06-24', 0, NULL, NULL, '2026-04-04 07:54:09', '2026-04-04 07:54:09'),
(1966, 47, 6, 2026, 'Annual', '2026-07-05', '2026-07-05', '2026-07-10', '2026-07-11', 0, NULL, NULL, '2026-04-04 07:54:09', '2026-04-04 07:54:09'),
(1967, 47, 7, 2026, 'Annual', '2026-06-24', '2026-06-20', '2026-06-29', '2026-07-10', 0, NULL, NULL, '2026-04-04 07:54:09', '2026-04-04 07:54:09'),
(1968, 47, 8, 2026, 'Annual', '2026-04-02', NULL, NULL, NULL, 0, NULL, NULL, '2026-04-04 07:54:09', '2026-04-04 07:54:09'),
(1969, 47, 9, 2026, 'Annual', '2026-05-08', NULL, NULL, NULL, 0, NULL, NULL, '2026-04-04 07:54:09', '2026-04-04 07:54:09'),
(1970, 47, 10, 2026, 'Annual', '2026-06-17', NULL, NULL, NULL, 0, NULL, NULL, '2026-04-04 07:54:09', '2026-04-04 07:54:09'),
(1971, 48, 1, 2026, 'Annual', '2026-04-15', '2026-04-04', '2026-04-10', '2026-04-16', 0, NULL, NULL, '2026-04-04 07:54:09', '2026-04-04 07:54:09'),
(1972, 48, 2, 2026, 'Annual', '2026-05-25', '2026-05-25', '2026-05-31', '2026-06-04', 0, NULL, NULL, '2026-04-04 07:54:09', '2026-04-04 07:54:09'),
(1973, 48, 3, 2026, 'Annual', '2026-07-22', '2026-07-21', '2026-07-27', '2026-08-04', 0, NULL, NULL, '2026-04-04 07:54:09', '2026-04-04 07:54:09'),
(1974, 48, 4, 2026, 'Annual', '2026-06-18', '2026-06-04', '2026-06-05', '2026-06-10', 0, NULL, NULL, '2026-04-04 07:54:09', '2026-04-04 07:54:09'),
(1975, 48, 5, 2026, 'Annual', '2026-06-15', '2026-06-15', '2026-06-21', '2026-06-23', 0, NULL, NULL, '2026-04-04 07:54:09', '2026-04-04 07:54:09'),
(1976, 48, 6, 2026, 'Annual', '2026-03-30', NULL, NULL, NULL, 0, NULL, NULL, '2026-04-04 07:54:09', '2026-04-04 07:54:09'),
(1977, 48, 7, 2026, 'Annual', '2026-03-07', '2026-03-07', '2026-03-08', '2026-03-09', 0, NULL, NULL, '2026-04-04 07:54:09', '2026-04-04 07:54:09'),
(1978, 48, 8, 2026, 'Annual', '2026-07-07', '2026-06-24', '2026-06-28', '2026-07-04', 0, NULL, NULL, '2026-04-04 07:54:09', '2026-04-04 07:54:09'),
(1979, 48, 9, 2026, 'Annual', '2026-08-23', '2026-08-20', '2026-08-28', '2026-09-07', 0, NULL, NULL, '2026-04-04 07:54:09', '2026-04-04 07:54:09'),
(1980, 48, 10, 2026, 'Annual', '2025-12-18', '2025-12-18', '2025-12-23', '2026-01-03', 0, NULL, NULL, '2026-04-04 07:54:09', '2026-04-04 07:54:09'),
(1981, 49, 1, 2026, 'Annual', '2026-07-20', '2026-07-20', '2026-07-28', '2026-08-05', 0, NULL, NULL, '2026-04-04 07:54:09', '2026-04-04 07:54:09'),
(1982, 49, 2, 2026, 'Annual', '2026-04-02', NULL, NULL, NULL, 0, NULL, NULL, '2026-04-04 07:54:09', '2026-04-04 07:54:09'),
(1983, 49, 3, 2026, 'Annual', '2025-11-30', '2025-11-30', '2025-12-09', '2025-12-16', 0, NULL, NULL, '2026-04-04 07:54:09', '2026-04-04 07:54:09'),
(1984, 49, 4, 2026, 'Annual', '2026-08-12', '2026-08-11', '2026-08-17', '2026-08-25', 0, NULL, NULL, '2026-04-04 07:54:09', '2026-04-04 07:54:09'),
(1985, 49, 5, 2026, 'Annual', '2026-01-01', '2026-01-01', '2026-01-02', '2026-01-11', 0, NULL, NULL, '2026-04-04 07:54:09', '2026-04-04 07:54:09'),
(1986, 49, 6, 2026, 'Annual', '2025-11-02', '2025-11-12', '2025-11-12', '2025-11-20', 0, NULL, NULL, '2026-04-04 07:54:09', '2026-04-04 07:54:09'),
(1987, 49, 7, 2026, 'Annual', '2026-04-29', '2026-04-29', '2026-05-03', '2026-05-03', 0, NULL, NULL, '2026-04-04 07:54:09', '2026-04-04 07:54:09'),
(1988, 49, 8, 2026, 'Annual', '2026-03-05', '2026-03-08', '2026-03-11', '2026-03-12', 0, NULL, NULL, '2026-04-04 07:54:09', '2026-04-04 07:54:09'),
(1989, 49, 9, 2026, 'Annual', '2025-11-26', NULL, NULL, NULL, 0, NULL, NULL, '2026-04-04 07:54:09', '2026-04-04 07:54:09'),
(1990, 49, 10, 2026, 'Annual', '2025-11-01', '2025-11-01', '2025-11-10', '2025-11-17', 0, NULL, NULL, '2026-04-04 07:54:09', '2026-04-04 07:54:09'),
(1991, 50, 1, 2026, 'Annual', '2026-06-09', '2026-06-09', '2026-06-12', '2026-06-21', 0, NULL, NULL, '2026-04-04 07:54:09', '2026-04-04 07:54:09'),
(1992, 50, 2, 2026, 'Annual', '2026-01-31', '2026-01-31', '2026-02-08', '2026-02-12', 0, NULL, NULL, '2026-04-04 07:54:09', '2026-04-04 07:54:09'),
(1993, 50, 3, 2026, 'Annual', '2026-08-06', '2026-07-30', '2026-08-07', '2026-08-07', 0, NULL, NULL, '2026-04-04 07:54:09', '2026-04-04 07:54:09'),
(1994, 50, 4, 2026, 'Annual', '2025-12-07', '2025-11-24', '2025-11-24', '2025-11-28', 0, NULL, NULL, '2026-04-04 07:54:09', '2026-04-04 07:54:09'),
(1995, 50, 5, 2026, 'Annual', '2026-01-21', '2026-01-16', '2026-01-22', '2026-02-01', 0, NULL, NULL, '2026-04-04 07:54:09', '2026-04-04 07:54:09'),
(1996, 50, 6, 2026, 'Annual', '2026-07-03', '2026-07-03', '2026-07-04', '2026-07-13', 0, NULL, NULL, '2026-04-04 07:54:09', '2026-04-04 07:54:09'),
(1997, 50, 7, 2026, 'Annual', '2026-05-05', '2026-04-30', '2026-04-30', '2026-04-30', 0, NULL, NULL, '2026-04-04 07:54:09', '2026-04-04 07:54:09'),
(1998, 50, 8, 2026, 'Annual', '2026-02-12', '2026-02-20', '2026-02-28', '2026-03-06', 0, NULL, NULL, '2026-04-04 07:54:09', '2026-04-04 07:54:09'),
(1999, 50, 9, 2026, 'Annual', '2025-12-26', '2025-12-26', '2025-12-30', '2026-01-01', 0, NULL, NULL, '2026-04-04 07:54:09', '2026-04-04 07:54:09'),
(2000, 50, 10, 2026, 'Annual', '2026-05-29', '2026-05-29', '2026-05-31', '2026-06-08', 0, NULL, NULL, '2026-04-04 07:54:09', '2026-04-04 07:54:09');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `generated_periods`
--

CREATE TABLE `generated_periods` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `year` smallint(5) UNSIGNED NOT NULL,
  `period` varchar(255) NOT NULL,
  `updated_by` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `group_structure_team_permissions`
--

CREATE TABLE `group_structure_team_permissions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `team_id` bigint(20) UNSIGNED NOT NULL,
  `module_id` bigint(20) UNSIGNED NOT NULL,
  `permission` smallint(5) UNSIGNED NOT NULL DEFAULT 1,
  `is_required` tinyint(1) NOT NULL DEFAULT 0,
  `module_category_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `queue` varchar(255) NOT NULL,
  `payload` longtext NOT NULL,
  `attempts` tinyint(3) UNSIGNED NOT NULL,
  `reserved_at` int(10) UNSIGNED DEFAULT NULL,
  `available_at` int(10) UNSIGNED NOT NULL,
  `created_at` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `job_batches`
--

CREATE TABLE `job_batches` (
  `id` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `total_jobs` int(11) NOT NULL,
  `pending_jobs` int(11) NOT NULL,
  `failed_jobs` int(11) NOT NULL,
  `failed_job_ids` longtext NOT NULL,
  `options` mediumtext DEFAULT NULL,
  `cancelled_at` int(11) DEFAULT NULL,
  `created_at` int(11) NOT NULL,
  `finished_at` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '0001_01_01_000000_create_users_table', 1),
(2, '0001_01_01_000001_create_cache_table', 1),
(3, '0001_01_01_000002_create_jobs_table', 1),
(4, '2026_03_30_020000_create_grm_portal_tables', 1),
(5, '2026_03_30_030000_create_sessions_table', 1),
(6, '2026_03_31_000100_add_attachment_path_to_email_templates', 1);

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(255) NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `user_agent` text DEFAULT NULL,
  `payload` longtext NOT NULL,
  `last_activity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sessions`
--

INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('fESqe5nz6ha5Rrqzze2z0aOv6RMm8DFlysqRqWlj', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', 'YTo3OntzOjY6Il90b2tlbiI7czo0MDoiM1dZOGxMTXZGbXlFaHFVamx2ZUZsNFlqSnl5VUZrYjBkMVhnZjB4ayI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDg6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMS9ncm91cC1maW5hbmNlL2xlZ2FsLWVudGl0eSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fXM6ODoiYWRtaW5faWQiO2k6MTtzOjEwOiJhZG1pbl9uYW1lIjtzOjE1OiJEZW1vIEFkbWluIFVzZXIiO3M6MTY6ImFkbWluX3JvbGVfbmFtZXMiO2E6MTp7aTowO3M6MTE6IlN1cGVyIEFkbWluIjt9czoyMToiYWxsb3dlZF9tb2R1bGVfcm91dGVzIjthOjUxOntpOjA7czoyMToiZGFzaGJvYXJkLmF1ZGl0X3RyYWlsIjtpOjE7czoyODoiZGFzaGJvYXJkLmZpbmFuY2Vfc3RhdGlzdGljcyI7aToyO3M6MjU6ImRhc2hib2FyZC5ncm91cF9yZXBvcnRpbmciO2k6MztzOjIzOiJkYXNoYm9hcmQudGltZWxpbmVfdmlldyI7aTo0O3M6MTY6ImRlbGl2ZXJhYmxlcy5hbGwiO2k6NTtzOjIyOiJkZWxpdmVyYWJsZXMudGVtcGxhdGVzIjtpOjY7czoyODoiZGVsaXZlcmFibGVzLnRlbXBsYXRlcy5zdG9yZSI7aTo3O3M6MjY6ImVtYWlsX25vdGlmaWNhdGlvbnMuZ3JvdXBzIjtpOjg7czozNDoiZW1haWxfbm90aWZpY2F0aW9ucy5ncm91cHMuZGVzdHJveSI7aTo5O3M6MzI6ImVtYWlsX25vdGlmaWNhdGlvbnMuZ3JvdXBzLnN0b3JlIjtpOjEwO3M6MzM6ImVtYWlsX25vdGlmaWNhdGlvbnMuZ3JvdXBzLnVwZGF0ZSI7aToxMTtzOjMzOiJlbWFpbF9ub3RpZmljYXRpb25zLm5vdGlmaWNhdGlvbnMiO2k6MTI7czo0MToiZW1haWxfbm90aWZpY2F0aW9ucy5ub3RpZmljYXRpb25zLmRlc3Ryb3kiO2k6MTM7czozOToiZW1haWxfbm90aWZpY2F0aW9ucy5ub3RpZmljYXRpb25zLnN0b3JlIjtpOjE0O3M6NDA6ImVtYWlsX25vdGlmaWNhdGlvbnMubm90aWZpY2F0aW9ucy51cGRhdGUiO2k6MTU7czozMDoiZW1haWxfbm90aWZpY2F0aW9ucy5yZWNpcGllbnRzIjtpOjE2O3M6Mzg6ImVtYWlsX25vdGlmaWNhdGlvbnMucmVjaXBpZW50cy5kZXN0cm95IjtpOjE3O3M6MzY6ImVtYWlsX25vdGlmaWNhdGlvbnMucmVjaXBpZW50cy5zdG9yZSI7aToxODtzOjM3OiJlbWFpbF9ub3RpZmljYXRpb25zLnJlY2lwaWVudHMudXBkYXRlIjtpOjE5O3M6Mjk6ImVtYWlsX25vdGlmaWNhdGlvbnMudGVtcGxhdGVzIjtpOjIwO3M6Mzc6ImVtYWlsX25vdGlmaWNhdGlvbnMudGVtcGxhdGVzLmRlc3Ryb3kiO2k6MjE7czozNToiZW1haWxfbm90aWZpY2F0aW9ucy50ZW1wbGF0ZXMuc3RvcmUiO2k6MjI7czozNjoiZW1haWxfbm90aWZpY2F0aW9ucy50ZW1wbGF0ZXMudXBkYXRlIjtpOjIzO3M6Mjg6Imdyb3VwX2ZpbmFuY2UuZHJhZnRfZW50aXRpZXMiO2k6MjQ7czozMzoiZ3JvdXBfZmluYW5jZS5nZW5lcmF0ZV9uZXdfcGVyaW9kIjtpOjI1O3M6Mzk6Imdyb3VwX2ZpbmFuY2UuZ2VuZXJhdGVfbmV3X3BlcmlvZC5zdG9yZSI7aToyNjtzOjM3OiJncm91cF9maW5hbmNlLmxlZ2FsX2VudGl0eV9tYW5hZ2VtZW50IjtpOjI3O3M6NTY6Imdyb3VwX2ZpbmFuY2UubGVnYWxfZW50aXR5X21hbmFnZW1lbnQuYXR0YWNobWVudHMuZGVsZXRlIjtpOjI4O3M6NTY6Imdyb3VwX2ZpbmFuY2UubGVnYWxfZW50aXR5X21hbmFnZW1lbnQuYXR0YWNobWVudHMudXBsb2FkIjtpOjI5O3M6NDQ6Imdyb3VwX2ZpbmFuY2UubGVnYWxfZW50aXR5X21hbmFnZW1lbnQuZGV0YWlsIjtpOjMwO3M6NDM6Imdyb3VwX2ZpbmFuY2UubGVnYWxfZW50aXR5X21hbmFnZW1lbnQuZ3JhcGgiO2k6MzE7czo0NzoiZ3JvdXBfZmluYW5jZS5sZWdhbF9lbnRpdHlfbWFuYWdlbWVudC5ncmFwaF9wZGYiO2k6MzI7czoyNzoiZ3JvdXBfZmluYW5jZS5yZXBvcnRfbWF0cml4IjtpOjMzO3M6NDc6Imdyb3VwX2ZpbmFuY2UucmVwb3J0X21hdHJpeC5tYXBwaW5nX2F0dGFjaG1lbnRzIjtpOjM0O3M6Mzk6Imdyb3VwX2ZpbmFuY2UucmVwb3J0X21hdHJpeC51cGRhdGVfZGF0ZSI7aTozNTtzOjI3OiJncm91cF9maW5hbmNlLnNoYXJlX2hvbGRlcnMiO2k6MzY7czoyNToibWFuYWdlX21vZHVsZXMuY2F0ZWdvcmllcyI7aTozNztzOjMzOiJtYW5hZ2VfbW9kdWxlcy5jYXRlZ29yaWVzLmRlc3Ryb3kiO2k6Mzg7czozMToibWFuYWdlX21vZHVsZXMuY2F0ZWdvcmllcy5zdG9yZSI7aTozOTtzOjMyOiJtYW5hZ2VfbW9kdWxlcy5jYXRlZ29yaWVzLnVwZGF0ZSI7aTo0MDtzOjIwOiJtYW5hZ2VfbW9kdWxlcy5pbmRleCI7aTo0MTtzOjE4OiJtYW5hZ2VfdXNlcnMuaW5kZXgiO2k6NDI7czoxODoibWFuYWdlX3VzZXJzLnN0b3JlIjtpOjQzO3M6MTM6InByb2ZpbGUuaW5kZXgiO2k6NDQ7czoxNDoicHJvZmlsZS51cGRhdGUiO2k6NDU7czoxMDoicm9sZXMuZWRpdCI7aTo0NjtzOjExOiJyb2xlcy5pbmRleCI7aTo0NztzOjExOiJyb2xlcy5zdG9yZSI7aTo0ODtzOjEyOiJyb2xlcy51cGRhdGUiO2k6NDk7czoxMToidGVhbXMuaW5kZXgiO2k6NTA7czoxMToidGVhbXMuc3RvcmUiO319', 1775307328);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_admin`
--

CREATE TABLE `tbl_admin` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `employee_ad_id` bigint(20) UNSIGNED NOT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `password` varchar(255) NOT NULL,
  `entity_type` varchar(255) NOT NULL DEFAULT 'all',
  `deliverable_entity_type` varchar(255) NOT NULL DEFAULT 'all',
  `deliverable_type` varchar(255) NOT NULL DEFAULT 'all',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tbl_admin`
--

INSERT INTO `tbl_admin` (`id`, `employee_ad_id`, `is_active`, `password`, `entity_type`, `deliverable_entity_type`, `deliverable_type`, `created_at`, `updated_at`) VALUES
(1, 1001, 1, '$2y$12$oJfokz91yJTIQXWQHj15POC31h2XTpXBL6pJgkqBqGi6hVOYeIeYW', 'all', 'all', 'all', NULL, NULL),
(2, 1002, 1, '$2y$12$.TbXuKx0TQe5n/6Rv4x9IezeXjP3DRpeHjr7hCeuZT6tYLXhIdxmC', 'all', 'all', 'all', NULL, NULL),
(3, 1003, 1, '$2y$12$UHtgzgLOBsE0Ypz9ACMx9ecgRPwj7E.opDYOOJtg6pnG1QysHaSoC', 'all', 'all', 'all', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_admin_user_entities`
--

CREATE TABLE `tbl_admin_user_entities` (
  `ID` bigint(20) UNSIGNED NOT NULL,
  `admin_ID` bigint(20) UNSIGNED NOT NULL,
  `entity_ID` bigint(20) UNSIGNED NOT NULL,
  `added_by` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_admin_user_roles`
--

CREATE TABLE `tbl_admin_user_roles` (
  `ID` bigint(20) UNSIGNED NOT NULL,
  `admin_ID` bigint(20) UNSIGNED NOT NULL,
  `role_ID` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tbl_admin_user_roles`
--

INSERT INTO `tbl_admin_user_roles` (`ID`, `admin_ID`, `role_ID`, `created_at`, `updated_at`) VALUES
(1, 1, 1, '2026-04-04 07:54:10', '2026-04-04 07:54:10'),
(2, 2, 2, '2026-04-04 07:54:10', '2026-04-04 07:54:10'),
(3, 3, 4, '2026-04-04 07:54:11', '2026-04-04 07:54:11');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_admin_user_teams`
--

CREATE TABLE `tbl_admin_user_teams` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `admin_id` bigint(20) UNSIGNED NOT NULL,
  `team_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tbl_admin_user_teams`
--

INSERT INTO `tbl_admin_user_teams` (`id`, `admin_id`, `team_id`, `created_at`, `updated_at`) VALUES
(1, 1, 1, '2026-04-04 07:54:11', '2026-04-04 07:54:11'),
(2, 2, 2, '2026-04-04 07:54:11', '2026-04-04 07:54:11'),
(3, 3, 3, '2026-04-04 07:54:11', '2026-04-04 07:54:11');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_employees`
--

CREATE TABLE `tbl_employees` (
  `ID` bigint(20) UNSIGNED NOT NULL,
  `employee_ad_id` bigint(20) UNSIGNED NOT NULL,
  `full_name` varchar(255) NOT NULL,
  `email_address` varchar(255) NOT NULL,
  `department` varchar(255) DEFAULT NULL,
  `company` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tbl_employees`
--

INSERT INTO `tbl_employees` (`ID`, `employee_ad_id`, `full_name`, `email_address`, `department`, `company`, `created_at`, `updated_at`) VALUES
(1, 1001, 'Demo Admin User', 'admin@demo.com', 'Finance', 'Demo Organization', NULL, NULL),
(2, 1002, 'Demo Officer User', 'officer@demo.com', 'Legal', 'Demo Organization', NULL, NULL),
(3, 1003, 'Demo Viewer User', 'viewer@demo.com', 'Operations', 'Demo Organization', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_modules`
--

CREATE TABLE `tbl_modules` (
  `ID` bigint(20) UNSIGNED NOT NULL,
  `module_category_ID` bigint(20) UNSIGNED DEFAULT NULL,
  `module_name` varchar(255) NOT NULL,
  `route` varchar(255) NOT NULL,
  `show_in_menu` tinyint(1) NOT NULL DEFAULT 1,
  `display_order` smallint(5) UNSIGNED NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tbl_modules`
--

INSERT INTO `tbl_modules` (`ID`, `module_category_ID`, `module_name`, `route`, `show_in_menu`, `display_order`, `created_at`, `updated_at`) VALUES
(1, 1, 'Group Reporting', 'dashboard.group_reporting', 1, 1, NULL, NULL),
(2, 1, 'Timeline View', 'dashboard.timeline_view', 1, 2, NULL, NULL),
(3, 1, 'Finance Statistics', 'dashboard.finance_statistics', 1, 3, NULL, NULL),
(4, 1, 'Audit Trail', 'dashboard.audit_trail', 1, 4, NULL, NULL),
(5, 1, 'Profile', 'profile.index', 0, 5, NULL, NULL),
(6, 1, 'Profile Update', 'profile.update', 0, 6, NULL, NULL),
(7, 2, 'Legal Entity Management', 'group_finance.legal_entity_management', 1, 1, NULL, NULL),
(8, 2, 'Legal Entity — Detail', 'group_finance.legal_entity_management.detail', 0, 2, NULL, NULL),
(9, 2, 'Legal Entity — Graph', 'group_finance.legal_entity_management.graph', 0, 3, NULL, NULL),
(10, 2, 'Legal Entity — Graph PDF', 'group_finance.legal_entity_management.graph_pdf', 0, 4, NULL, NULL),
(11, 2, 'Legal Entity — Upload attachment', 'group_finance.legal_entity_management.attachments.upload', 0, 5, NULL, NULL),
(12, 2, 'Legal Entity — Delete attachment', 'group_finance.legal_entity_management.attachments.delete', 0, 6, NULL, NULL),
(13, 2, 'Share Holders', 'group_finance.share_holders', 1, 7, NULL, NULL),
(14, 2, 'Draft Entities', 'group_finance.draft_entities', 1, 8, NULL, NULL),
(15, 2, 'Generate New Period', 'group_finance.generate_new_period', 1, 9, NULL, NULL),
(16, 2, 'Generate New Period — Store', 'group_finance.generate_new_period.store', 0, 10, NULL, NULL),
(17, 2, 'Report Matrix', 'group_finance.report_matrix', 1, 11, NULL, NULL),
(18, 2, 'Report Matrix — Mapping attachments (JSON)', 'group_finance.report_matrix.mapping_attachments', 0, 12, NULL, NULL),
(19, 2, 'Report Matrix — Update date', 'group_finance.report_matrix.update_date', 0, 13, NULL, NULL),
(20, 3, 'All Deliverables', 'deliverables.all', 1, 1, NULL, NULL),
(21, 3, 'Deliverable Templates', 'deliverables.templates', 1, 2, NULL, NULL),
(22, 3, 'Deliverable Templates — Store', 'deliverables.templates.store', 0, 3, NULL, NULL),
(23, 4, 'Manage Users', 'manage_users.index', 1, 1, NULL, NULL),
(24, 4, 'Manage Users — Actions', 'manage_users.store', 0, 2, NULL, NULL),
(25, 5, 'Roles Management', 'roles.index', 1, 1, NULL, NULL),
(26, 5, 'Roles — Store', 'roles.store', 0, 2, NULL, NULL),
(27, 5, 'Roles — Edit', 'roles.edit', 0, 3, NULL, NULL),
(28, 5, 'Roles — Update', 'roles.update', 0, 4, NULL, NULL),
(29, 6, 'Teams', 'teams.index', 1, 1, NULL, NULL),
(30, 6, 'Teams — Actions', 'teams.store', 0, 2, NULL, NULL),
(31, 8, 'Modules Listing', 'manage_modules.index', 1, 1, NULL, NULL),
(32, 8, 'Module Categories', 'manage_modules.categories', 0, 2, NULL, NULL),
(33, 8, 'Module Categories — Store', 'manage_modules.categories.store', 0, 3, NULL, NULL),
(34, 8, 'Module Categories — Update', 'manage_modules.categories.update', 0, 4, NULL, NULL),
(35, 8, 'Module Categories — Destroy', 'manage_modules.categories.destroy', 0, 5, NULL, NULL),
(36, 7, 'Email Templates', 'email_notifications.templates', 1, 1, NULL, NULL),
(37, 7, 'Email Templates — Store', 'email_notifications.templates.store', 0, 2, NULL, NULL),
(38, 7, 'Email Templates — Update', 'email_notifications.templates.update', 0, 3, NULL, NULL),
(39, 7, 'Email Templates — Destroy', 'email_notifications.templates.destroy', 0, 4, NULL, NULL),
(40, 7, 'Email Groups', 'email_notifications.groups', 1, 5, NULL, NULL),
(41, 7, 'Email Groups — Store', 'email_notifications.groups.store', 0, 6, NULL, NULL),
(42, 7, 'Email Groups — Update', 'email_notifications.groups.update', 0, 7, NULL, NULL),
(43, 7, 'Email Groups — Destroy', 'email_notifications.groups.destroy', 0, 8, NULL, NULL),
(44, 7, 'Email Recipients', 'email_notifications.recipients', 1, 9, NULL, NULL),
(45, 7, 'Email Recipients — Store', 'email_notifications.recipients.store', 0, 10, NULL, NULL),
(46, 7, 'Email Recipients — Update', 'email_notifications.recipients.update', 0, 11, NULL, NULL),
(47, 7, 'Email Recipients — Destroy', 'email_notifications.recipients.destroy', 0, 12, NULL, NULL),
(48, 7, 'Email Notifications', 'email_notifications.notifications', 1, 13, NULL, NULL),
(49, 7, 'Email Notifications — Store', 'email_notifications.notifications.store', 0, 14, NULL, NULL),
(50, 7, 'Email Notifications — Update', 'email_notifications.notifications.update', 0, 15, NULL, NULL),
(51, 7, 'Email Notifications — Destroy', 'email_notifications.notifications.destroy', 0, 16, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_module_categories`
--

CREATE TABLE `tbl_module_categories` (
  `ID` bigint(20) UNSIGNED NOT NULL,
  `category_name` varchar(255) NOT NULL,
  `css_class` varchar(255) DEFAULT NULL,
  `display_order` smallint(5) UNSIGNED NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tbl_module_categories`
--

INSERT INTO `tbl_module_categories` (`ID`, `category_name`, `css_class`, `display_order`, `created_at`, `updated_at`) VALUES
(1, 'Dashboard', 'dashboard', 1, NULL, NULL),
(2, 'Group Finance Matrix', 'gfm', 2, NULL, NULL),
(3, 'Manage Deliverables', 'deliverables', 3, NULL, NULL),
(4, 'Manage Users', 'users', 4, NULL, NULL),
(5, 'Roles Management', 'roles', 5, NULL, NULL),
(6, 'Teams', 'teams', 6, NULL, NULL),
(7, 'Email Notifications', 'emails', 7, NULL, NULL),
(8, 'Manage Modules', 'modules', 8, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_roles`
--

CREATE TABLE `tbl_roles` (
  `ID` bigint(20) UNSIGNED NOT NULL,
  `role_name` varchar(255) NOT NULL,
  `display_order` smallint(5) UNSIGNED NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tbl_roles`
--

INSERT INTO `tbl_roles` (`ID`, `role_name`, `display_order`, `created_at`, `updated_at`) VALUES
(1, 'Super Admin', 1, NULL, NULL),
(2, 'Finance Admin', 2, NULL, NULL),
(3, 'Legal Officer', 3, NULL, NULL),
(4, 'Viewer', 4, NULL, NULL),
(5, 'Entity Manager', 5, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_role_privileges`
--

CREATE TABLE `tbl_role_privileges` (
  `ID` bigint(20) UNSIGNED NOT NULL,
  `role_ID` bigint(20) UNSIGNED NOT NULL,
  `module_ID` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tbl_role_privileges`
--

INSERT INTO `tbl_role_privileges` (`ID`, `role_ID`, `module_ID`, `created_at`, `updated_at`) VALUES
(1, 1, 1, '2026-04-04 07:54:09', '2026-04-04 07:54:09'),
(2, 1, 2, '2026-04-04 07:54:09', '2026-04-04 07:54:09'),
(3, 1, 3, '2026-04-04 07:54:09', '2026-04-04 07:54:09'),
(4, 1, 4, '2026-04-04 07:54:09', '2026-04-04 07:54:09'),
(5, 1, 5, '2026-04-04 07:54:09', '2026-04-04 07:54:09'),
(6, 1, 6, '2026-04-04 07:54:09', '2026-04-04 07:54:09'),
(7, 1, 7, '2026-04-04 07:54:09', '2026-04-04 07:54:09'),
(8, 1, 8, '2026-04-04 07:54:09', '2026-04-04 07:54:09'),
(9, 1, 9, '2026-04-04 07:54:09', '2026-04-04 07:54:09'),
(10, 1, 10, '2026-04-04 07:54:09', '2026-04-04 07:54:09'),
(11, 1, 11, '2026-04-04 07:54:09', '2026-04-04 07:54:09'),
(12, 1, 12, '2026-04-04 07:54:09', '2026-04-04 07:54:09'),
(13, 1, 13, '2026-04-04 07:54:09', '2026-04-04 07:54:09'),
(14, 1, 14, '2026-04-04 07:54:09', '2026-04-04 07:54:09'),
(15, 1, 15, '2026-04-04 07:54:09', '2026-04-04 07:54:09'),
(16, 1, 16, '2026-04-04 07:54:09', '2026-04-04 07:54:09'),
(17, 1, 17, '2026-04-04 07:54:09', '2026-04-04 07:54:09'),
(18, 1, 18, '2026-04-04 07:54:09', '2026-04-04 07:54:09'),
(19, 1, 19, '2026-04-04 07:54:09', '2026-04-04 07:54:09'),
(20, 1, 20, '2026-04-04 07:54:09', '2026-04-04 07:54:09'),
(21, 1, 21, '2026-04-04 07:54:09', '2026-04-04 07:54:09'),
(22, 1, 22, '2026-04-04 07:54:09', '2026-04-04 07:54:09'),
(23, 1, 23, '2026-04-04 07:54:09', '2026-04-04 07:54:09'),
(24, 1, 24, '2026-04-04 07:54:09', '2026-04-04 07:54:09'),
(25, 1, 25, '2026-04-04 07:54:09', '2026-04-04 07:54:09'),
(26, 1, 26, '2026-04-04 07:54:09', '2026-04-04 07:54:09'),
(27, 1, 27, '2026-04-04 07:54:09', '2026-04-04 07:54:09'),
(28, 1, 28, '2026-04-04 07:54:09', '2026-04-04 07:54:09'),
(29, 1, 29, '2026-04-04 07:54:09', '2026-04-04 07:54:09'),
(30, 1, 30, '2026-04-04 07:54:09', '2026-04-04 07:54:09'),
(31, 1, 31, '2026-04-04 07:54:09', '2026-04-04 07:54:09'),
(32, 1, 32, '2026-04-04 07:54:09', '2026-04-04 07:54:09'),
(33, 1, 33, '2026-04-04 07:54:09', '2026-04-04 07:54:09'),
(34, 1, 34, '2026-04-04 07:54:09', '2026-04-04 07:54:09'),
(35, 1, 35, '2026-04-04 07:54:09', '2026-04-04 07:54:09'),
(36, 1, 36, '2026-04-04 07:54:09', '2026-04-04 07:54:09'),
(37, 1, 37, '2026-04-04 07:54:09', '2026-04-04 07:54:09'),
(38, 1, 38, '2026-04-04 07:54:09', '2026-04-04 07:54:09'),
(39, 1, 39, '2026-04-04 07:54:09', '2026-04-04 07:54:09'),
(40, 1, 40, '2026-04-04 07:54:09', '2026-04-04 07:54:09'),
(41, 1, 41, '2026-04-04 07:54:09', '2026-04-04 07:54:09'),
(42, 1, 42, '2026-04-04 07:54:09', '2026-04-04 07:54:09'),
(43, 1, 43, '2026-04-04 07:54:09', '2026-04-04 07:54:09'),
(44, 1, 44, '2026-04-04 07:54:09', '2026-04-04 07:54:09'),
(45, 1, 45, '2026-04-04 07:54:09', '2026-04-04 07:54:09'),
(46, 1, 46, '2026-04-04 07:54:09', '2026-04-04 07:54:09'),
(47, 1, 47, '2026-04-04 07:54:09', '2026-04-04 07:54:09'),
(48, 1, 48, '2026-04-04 07:54:09', '2026-04-04 07:54:09'),
(49, 1, 49, '2026-04-04 07:54:09', '2026-04-04 07:54:09'),
(50, 1, 50, '2026-04-04 07:54:09', '2026-04-04 07:54:09'),
(51, 1, 51, '2026-04-04 07:54:09', '2026-04-04 07:54:09'),
(52, 2, 1, '2026-04-04 07:54:09', '2026-04-04 07:54:09'),
(53, 2, 2, '2026-04-04 07:54:09', '2026-04-04 07:54:09'),
(54, 2, 3, '2026-04-04 07:54:09', '2026-04-04 07:54:09'),
(55, 2, 4, '2026-04-04 07:54:09', '2026-04-04 07:54:09'),
(56, 2, 5, '2026-04-04 07:54:09', '2026-04-04 07:54:09'),
(57, 2, 6, '2026-04-04 07:54:09', '2026-04-04 07:54:09'),
(58, 2, 7, '2026-04-04 07:54:09', '2026-04-04 07:54:09'),
(59, 2, 13, '2026-04-04 07:54:09', '2026-04-04 07:54:09'),
(60, 2, 14, '2026-04-04 07:54:09', '2026-04-04 07:54:09'),
(61, 2, 15, '2026-04-04 07:54:09', '2026-04-04 07:54:09'),
(62, 2, 17, '2026-04-04 07:54:09', '2026-04-04 07:54:09'),
(63, 2, 18, '2026-04-04 07:54:09', '2026-04-04 07:54:09'),
(64, 2, 20, '2026-04-04 07:54:09', '2026-04-04 07:54:09'),
(65, 2, 21, '2026-04-04 07:54:09', '2026-04-04 07:54:09'),
(66, 2, 23, '2026-04-04 07:54:09', '2026-04-04 07:54:09'),
(67, 2, 25, '2026-04-04 07:54:09', '2026-04-04 07:54:09'),
(68, 2, 29, '2026-04-04 07:54:09', '2026-04-04 07:54:09'),
(69, 2, 36, '2026-04-04 07:54:09', '2026-04-04 07:54:09'),
(70, 2, 40, '2026-04-04 07:54:09', '2026-04-04 07:54:09'),
(71, 2, 44, '2026-04-04 07:54:09', '2026-04-04 07:54:09'),
(72, 2, 48, '2026-04-04 07:54:09', '2026-04-04 07:54:09'),
(73, 2, 19, '2026-04-04 07:54:09', '2026-04-04 07:54:09'),
(74, 3, 1, '2026-04-04 07:54:09', '2026-04-04 07:54:09'),
(75, 3, 2, '2026-04-04 07:54:09', '2026-04-04 07:54:09'),
(76, 3, 3, '2026-04-04 07:54:09', '2026-04-04 07:54:09'),
(77, 3, 4, '2026-04-04 07:54:09', '2026-04-04 07:54:09'),
(78, 3, 5, '2026-04-04 07:54:09', '2026-04-04 07:54:09'),
(79, 3, 6, '2026-04-04 07:54:09', '2026-04-04 07:54:09'),
(80, 3, 7, '2026-04-04 07:54:09', '2026-04-04 07:54:09'),
(81, 3, 13, '2026-04-04 07:54:09', '2026-04-04 07:54:09'),
(82, 3, 14, '2026-04-04 07:54:09', '2026-04-04 07:54:09'),
(83, 3, 15, '2026-04-04 07:54:09', '2026-04-04 07:54:09'),
(84, 3, 17, '2026-04-04 07:54:09', '2026-04-04 07:54:09'),
(85, 3, 18, '2026-04-04 07:54:10', '2026-04-04 07:54:10'),
(86, 3, 20, '2026-04-04 07:54:10', '2026-04-04 07:54:10'),
(87, 3, 21, '2026-04-04 07:54:10', '2026-04-04 07:54:10'),
(88, 3, 23, '2026-04-04 07:54:10', '2026-04-04 07:54:10'),
(89, 3, 25, '2026-04-04 07:54:10', '2026-04-04 07:54:10'),
(90, 3, 29, '2026-04-04 07:54:10', '2026-04-04 07:54:10'),
(91, 3, 36, '2026-04-04 07:54:10', '2026-04-04 07:54:10'),
(92, 3, 40, '2026-04-04 07:54:10', '2026-04-04 07:54:10'),
(93, 3, 44, '2026-04-04 07:54:10', '2026-04-04 07:54:10'),
(94, 3, 48, '2026-04-04 07:54:10', '2026-04-04 07:54:10'),
(95, 4, 1, '2026-04-04 07:54:10', '2026-04-04 07:54:10'),
(96, 4, 2, '2026-04-04 07:54:10', '2026-04-04 07:54:10'),
(97, 4, 3, '2026-04-04 07:54:10', '2026-04-04 07:54:10'),
(98, 4, 4, '2026-04-04 07:54:10', '2026-04-04 07:54:10'),
(99, 4, 5, '2026-04-04 07:54:10', '2026-04-04 07:54:10'),
(100, 4, 6, '2026-04-04 07:54:10', '2026-04-04 07:54:10'),
(101, 4, 7, '2026-04-04 07:54:10', '2026-04-04 07:54:10'),
(102, 4, 13, '2026-04-04 07:54:10', '2026-04-04 07:54:10'),
(103, 4, 14, '2026-04-04 07:54:10', '2026-04-04 07:54:10'),
(104, 4, 15, '2026-04-04 07:54:10', '2026-04-04 07:54:10'),
(105, 4, 17, '2026-04-04 07:54:10', '2026-04-04 07:54:10'),
(106, 4, 18, '2026-04-04 07:54:10', '2026-04-04 07:54:10'),
(107, 4, 20, '2026-04-04 07:54:10', '2026-04-04 07:54:10'),
(108, 4, 21, '2026-04-04 07:54:10', '2026-04-04 07:54:10'),
(109, 4, 23, '2026-04-04 07:54:10', '2026-04-04 07:54:10'),
(110, 4, 25, '2026-04-04 07:54:10', '2026-04-04 07:54:10'),
(111, 4, 29, '2026-04-04 07:54:10', '2026-04-04 07:54:10'),
(112, 4, 36, '2026-04-04 07:54:10', '2026-04-04 07:54:10'),
(113, 4, 40, '2026-04-04 07:54:10', '2026-04-04 07:54:10'),
(114, 4, 44, '2026-04-04 07:54:10', '2026-04-04 07:54:10'),
(115, 4, 48, '2026-04-04 07:54:10', '2026-04-04 07:54:10'),
(116, 5, 1, '2026-04-04 07:54:10', '2026-04-04 07:54:10'),
(117, 5, 2, '2026-04-04 07:54:10', '2026-04-04 07:54:10'),
(118, 5, 3, '2026-04-04 07:54:10', '2026-04-04 07:54:10'),
(119, 5, 4, '2026-04-04 07:54:10', '2026-04-04 07:54:10'),
(120, 5, 5, '2026-04-04 07:54:10', '2026-04-04 07:54:10'),
(121, 5, 6, '2026-04-04 07:54:10', '2026-04-04 07:54:10'),
(122, 5, 7, '2026-04-04 07:54:10', '2026-04-04 07:54:10'),
(123, 5, 13, '2026-04-04 07:54:10', '2026-04-04 07:54:10'),
(124, 5, 14, '2026-04-04 07:54:10', '2026-04-04 07:54:10'),
(125, 5, 15, '2026-04-04 07:54:10', '2026-04-04 07:54:10'),
(126, 5, 17, '2026-04-04 07:54:10', '2026-04-04 07:54:10'),
(127, 5, 18, '2026-04-04 07:54:10', '2026-04-04 07:54:10'),
(128, 5, 20, '2026-04-04 07:54:10', '2026-04-04 07:54:10'),
(129, 5, 21, '2026-04-04 07:54:10', '2026-04-04 07:54:10'),
(130, 5, 23, '2026-04-04 07:54:10', '2026-04-04 07:54:10'),
(131, 5, 25, '2026-04-04 07:54:10', '2026-04-04 07:54:10'),
(132, 5, 29, '2026-04-04 07:54:10', '2026-04-04 07:54:10'),
(133, 5, 36, '2026-04-04 07:54:10', '2026-04-04 07:54:10'),
(134, 5, 40, '2026-04-04 07:54:10', '2026-04-04 07:54:10'),
(135, 5, 44, '2026-04-04 07:54:10', '2026-04-04 07:54:10'),
(136, 5, 48, '2026-04-04 07:54:10', '2026-04-04 07:54:10');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_teams`
--

CREATE TABLE `tbl_teams` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `team_name` varchar(255) NOT NULL,
  `created_by` bigint(20) UNSIGNED DEFAULT NULL,
  `display_order` smallint(5) UNSIGNED NOT NULL DEFAULT 1,
  `is_deleted` tinyint(1) NOT NULL DEFAULT 0,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tbl_teams`
--

INSERT INTO `tbl_teams` (`id`, `team_name`, `created_by`, `display_order`, `is_deleted`, `is_active`, `created_at`, `updated_at`) VALUES
(1, 'Finance Team', NULL, 1, 0, 1, '2026-04-04 07:54:11', '2026-04-04 07:54:11'),
(2, 'Legal Team', NULL, 2, 0, 1, '2026-04-04 07:54:11', '2026-04-04 07:54:11'),
(3, 'HR Team', NULL, 3, 0, 1, '2026-04-04 07:54:11', '2026-04-04 07:54:11'),
(4, 'Tax Team', NULL, 4, 0, 1, '2026-04-04 07:54:11', '2026-04-04 07:54:11'),
(5, 'Entity Team', NULL, 5, 0, 1, '2026-04-04 07:54:11', '2026-04-04 07:54:11');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `audits`
--
ALTER TABLE `audits`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cache`
--
ALTER TABLE `cache`
  ADD PRIMARY KEY (`key`);

--
-- Indexes for table `cache_locks`
--
ALTER TABLE `cache_locks`
  ADD PRIMARY KEY (`key`);

--
-- Indexes for table `countries`
--
ALTER TABLE `countries`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `deliverable_contact_list`
--
ALTER TABLE `deliverable_contact_list`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `deliverable_templates`
--
ALTER TABLE `deliverable_templates`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `email_groups`
--
ALTER TABLE `email_groups`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `email_groups_recipients`
--
ALTER TABLE `email_groups_recipients`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `email_notifications`
--
ALTER TABLE `email_notifications`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `email_recipients`
--
ALTER TABLE `email_recipients`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `email_templates`
--
ALTER TABLE `email_templates`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `entity`
--
ALTER TABLE `entity`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `entity_item`
--
ALTER TABLE `entity_item`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `entity_item_mapping`
--
ALTER TABLE `entity_item_mapping`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `entity_mapping_attachments`
--
ALTER TABLE `entity_mapping_attachments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `entity_periods`
--
ALTER TABLE `entity_periods`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `entity_period_mapping`
--
ALTER TABLE `entity_period_mapping`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `entity_reporting_matrix`
--
ALTER TABLE `entity_reporting_matrix`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `generated_periods`
--
ALTER TABLE `generated_periods`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `group_structure_team_permissions`
--
ALTER TABLE `group_structure_team_permissions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`);

--
-- Indexes for table `job_batches`
--
ALTER TABLE `job_batches`
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
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

--
-- Indexes for table `tbl_admin`
--
ALTER TABLE `tbl_admin`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `tbl_admin_employee_ad_id_unique` (`employee_ad_id`);

--
-- Indexes for table `tbl_admin_user_entities`
--
ALTER TABLE `tbl_admin_user_entities`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `tbl_admin_user_roles`
--
ALTER TABLE `tbl_admin_user_roles`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `tbl_admin_user_teams`
--
ALTER TABLE `tbl_admin_user_teams`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_employees`
--
ALTER TABLE `tbl_employees`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `tbl_employees_employee_ad_id_unique` (`employee_ad_id`);

--
-- Indexes for table `tbl_modules`
--
ALTER TABLE `tbl_modules`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `tbl_modules_route_unique` (`route`);

--
-- Indexes for table `tbl_module_categories`
--
ALTER TABLE `tbl_module_categories`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `tbl_roles`
--
ALTER TABLE `tbl_roles`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `tbl_role_privileges`
--
ALTER TABLE `tbl_role_privileges`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `tbl_teams`
--
ALTER TABLE `tbl_teams`
  ADD PRIMARY KEY (`id`);

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
-- AUTO_INCREMENT for table `audits`
--
ALTER TABLE `audits`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=65;

--
-- AUTO_INCREMENT for table `countries`
--
ALTER TABLE `countries`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `deliverable_contact_list`
--
ALTER TABLE `deliverable_contact_list`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `deliverable_templates`
--
ALTER TABLE `deliverable_templates`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `email_groups`
--
ALTER TABLE `email_groups`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `email_groups_recipients`
--
ALTER TABLE `email_groups_recipients`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `email_notifications`
--
ALTER TABLE `email_notifications`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `email_recipients`
--
ALTER TABLE `email_recipients`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `email_templates`
--
ALTER TABLE `email_templates`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `entity`
--
ALTER TABLE `entity`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;

--
-- AUTO_INCREMENT for table `entity_item`
--
ALTER TABLE `entity_item`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `entity_item_mapping`
--
ALTER TABLE `entity_item_mapping`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=105;

--
-- AUTO_INCREMENT for table `entity_mapping_attachments`
--
ALTER TABLE `entity_mapping_attachments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=97;

--
-- AUTO_INCREMENT for table `entity_periods`
--
ALTER TABLE `entity_periods`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `entity_period_mapping`
--
ALTER TABLE `entity_period_mapping`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;

--
-- AUTO_INCREMENT for table `entity_reporting_matrix`
--
ALTER TABLE `entity_reporting_matrix`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2001;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `generated_periods`
--
ALTER TABLE `generated_periods`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `group_structure_team_permissions`
--
ALTER TABLE `group_structure_team_permissions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `tbl_admin`
--
ALTER TABLE `tbl_admin`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `tbl_admin_user_entities`
--
ALTER TABLE `tbl_admin_user_entities`
  MODIFY `ID` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_admin_user_roles`
--
ALTER TABLE `tbl_admin_user_roles`
  MODIFY `ID` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `tbl_admin_user_teams`
--
ALTER TABLE `tbl_admin_user_teams`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `tbl_employees`
--
ALTER TABLE `tbl_employees`
  MODIFY `ID` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `tbl_modules`
--
ALTER TABLE `tbl_modules`
  MODIFY `ID` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=52;

--
-- AUTO_INCREMENT for table `tbl_module_categories`
--
ALTER TABLE `tbl_module_categories`
  MODIFY `ID` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `tbl_roles`
--
ALTER TABLE `tbl_roles`
  MODIFY `ID` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `tbl_role_privileges`
--
ALTER TABLE `tbl_role_privileges`
  MODIFY `ID` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=137;

--
-- AUTO_INCREMENT for table `tbl_teams`
--
ALTER TABLE `tbl_teams`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

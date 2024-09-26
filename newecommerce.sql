-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 14, 2024 at 04:48 PM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 8.1.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `newecommerce`
--

-- --------------------------------------------------------

--
-- Table structure for table `attributes`
--

CREATE TABLE `attributes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `slug` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `attributes`
--

INSERT INTO `attributes` (`id`, `name`, `slug`, `created_at`, `updated_at`) VALUES
(1, 'Processor1', 'laptop_processor_', '2023-12-04 12:08:05', '2023-12-14 10:36:44'),
(3, 'TouchScreen', 'touchscreenLaptop', '2023-12-14 11:08:33', '2023-12-14 11:08:33');

-- --------------------------------------------------------

--
-- Table structure for table `attribute_values`
--

CREATE TABLE `attribute_values` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `attributes_id` bigint(20) UNSIGNED NOT NULL,
  `value` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `attribute_values`
--

INSERT INTO `attribute_values` (`id`, `attributes_id`, `value`, `created_at`, `updated_at`) VALUES
(1, 1, 'i-7', NULL, NULL),
(3, 3, 'yes', '2023-12-14 11:08:46', '2023-12-14 11:08:46'),
(4, 1, 'i-9', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `brands`
--

CREATE TABLE `brands` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `text` varchar(255) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `brands`
--

INSERT INTO `brands` (`id`, `text`, `image`, `created_at`, `updated_at`) VALUES
(1, 'HOTSTYLE', 'images/brands/1707549697.webp', '2023-12-17 11:47:03', '2024-02-10 01:51:37'),
(2, 'SOLSTICE', 'images/brands/1707549735.webp', '2024-02-10 01:52:15', '2024-02-10 01:52:15'),
(3, 'Baggit', 'images/brands/1707549762.webp', '2024-02-10 01:52:42', '2024-02-10 01:52:42');

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `slug` varchar(255) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `parent_category_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`, `slug`, `image`, `parent_category_id`, `created_at`, `updated_at`) VALUES
(1, 'Home Appliances', 'Home Appliances', 'images/categories/1702824225.jpg', 2, '2023-12-16 11:43:18', '2023-12-17 09:13:45'),
(2, 'Laptop', 'laptop', 'images/categories/1702746837.jpg', 1, '2023-12-16 11:43:57', '2023-12-16 11:43:57'),
(3, 'Processor', 'ts', 'images/categories/1702747114.jpg', 1, '2023-12-16 11:48:34', '2023-12-16 11:48:34'),
(4, 'Laptop', 'laptop_processor', 'images/categories/1702747417.jpg', 1, '2023-12-16 11:53:37', '2023-12-16 11:53:37'),
(5, 'vineet', 'xasxsa', 'images/categories/1702747623.jpg', NULL, '2023-12-16 11:57:03', '2023-12-16 11:57:03'),
(6, 'Clothing', 'clothing', 'images/categories/1707549483.webp', NULL, '2024-02-10 01:48:03', '2024-02-10 01:48:03'),
(7, 'Shirt for Men', 'shirt for men', 'images/categories/1707549527.webp', 6, '2024-02-10 01:48:47', '2024-02-10 01:48:47'),
(8, 'Men\'s Shoes', 'shoes for men', 'images/categories/1707549561.webp', 6, '2024-02-10 01:49:21', '2024-02-10 01:49:21'),
(9, 'Women Fashion', 'women fashion', 'images/categories/1707923474.webp', NULL, '2024-02-14 09:41:14', '2024-02-14 09:41:14'),
(10, 'Women Hand Bag', 'women hand bag', 'images/categories/1707923505.webp', 9, '2024-02-14 09:41:45', '2024-02-14 09:41:45');

-- --------------------------------------------------------

--
-- Table structure for table `category_attribute`
--

CREATE TABLE `category_attribute` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `category_id` bigint(20) UNSIGNED NOT NULL,
  `attribute_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `category_attribute`
--

INSERT INTO `category_attribute` (`id`, `category_id`, `attribute_id`, `created_at`, `updated_at`) VALUES
(1, 1, 3, NULL, '2023-12-17 11:31:37'),
(2, 4, 3, '2023-12-17 10:14:19', '2023-12-17 11:31:30'),
(3, 4, 1, '2023-12-17 11:30:00', '2023-12-17 11:30:00');

-- --------------------------------------------------------

--
-- Table structure for table `colors`
--

CREATE TABLE `colors` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `text` varchar(255) DEFAULT NULL,
  `value` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `colors`
--

INSERT INTO `colors` (`id`, `text`, `value`, `created_at`, `updated_at`) VALUES
(1, 'Light Red', '#FF7F7F', '2023-11-26 10:58:26', '2023-11-26 10:58:26'),
(3, 'Dark Red', '#8B0000', '2023-11-26 11:00:47', '2023-11-26 11:00:47'),
(4, 'black', '#000', '2023-12-04 10:37:13', '2023-12-04 10:40:52'),
(5, 'White', 'ffff', '2024-02-10 01:58:09', '2024-02-10 01:58:09'),
(6, 'Blue', '#0000FF', '2024-02-10 01:58:33', '2024-02-10 01:58:33');

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
-- Table structure for table `home_banners`
--

CREATE TABLE `home_banners` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `text` varchar(255) DEFAULT NULL,
  `link` varchar(255) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `home_banners`
--

INSERT INTO `home_banners` (`id`, `text`, `link`, `image`, `created_at`, `updated_at`) VALUES
(4, 'Get the Best Discounted Products at 10% OFF', 'test21212', 'images/1707549363.webp', '2023-11-22 11:19:38', '2024-02-10 01:46:03'),
(5, 'Get the Best Shirt available at Best Price', 'test', 'images/1707549404.webp', '2024-02-10 01:46:44', '2024-02-10 01:46:44');

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
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_reset_tokens_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(5, '2023_10_17_164112_create_roles_table', 2),
(6, '2023_10_17_164230_create_user_roles_table', 3),
(8, '2023_11_01_170203_alter_users_table', 4),
(9, '2023_11_01_170759_alter_users_image_table', 5),
(10, '2023_11_13_145940_create_home_banners_table', 6),
(13, '2023_11_26_153947_create_sizes_table', 7),
(14, '2023_11_26_161813_create_colors_table', 8),
(15, '2023_12_04_163347_create_attributes_table', 9),
(16, '2023_12_04_163522_create_attribute_values_table', 9),
(17, '2023_12_14_164402_create_categories_table', 10),
(18, '2023_12_14_171340_create_category_attribute_table', 11),
(19, '2023_12_17_170708_create_brands_table', 12),
(20, '2023_12_24_135902_create_taxes_table', 13),
(21, '2023_12_24_143803_create_products_table', 14),
(22, '2023_12_24_143906_create_product_attributes_table', 14),
(24, '2023_12_24_143949_create_product_attrs_table', 14),
(25, '2023_12_24_170207_create_product_attr_images_table', 15);

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
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `personal_access_tokens`
--

INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `expires_at`, `created_at`, `updated_at`) VALUES
(2, 'App\\Models\\User', 1, 'API Token', '88cd3171d8b18758b3f2550722fc3ba2c699f9569c63846b0e0257ac36e8a8aa', '[\"*\"]', NULL, NULL, '2024-02-01 11:40:15', '2024-02-01 11:40:15'),
(3, 'App\\Models\\User', 1, 'API Token', '81c5e74960b2846ed4df19df9a4fe93c161512a71e44006ab73c37df09024ec9', '[\"*\"]', NULL, NULL, '2024-02-01 11:41:05', '2024-02-01 11:41:05'),
(4, 'App\\Models\\User', 1, 'API Token', '771597b2bf08d16a49f0b232f3bc371d216ceea3966db3f219713bb5b9a4a512', '[\"*\"]', NULL, NULL, '2024-02-01 11:42:41', '2024-02-01 11:42:41'),
(5, 'App\\Models\\User', 1, 'API Token', '88dc8c227f9f1f1291cd09c07575ed17e18a5711d826115f893e392cfbddfcb7', '[\"*\"]', NULL, NULL, '2024-02-01 11:43:24', '2024-02-01 11:43:24'),
(6, 'App\\Models\\User', 1, 'API Token', '4624dc10d25732d006eeeb05e28cc493b9f4d8a368f002c887c3afa41c6e6503', '[\"*\"]', '2024-02-01 11:49:43', NULL, '2024-02-01 11:44:49', '2024-02-01 11:49:43'),
(7, 'App\\Models\\User', 1, 'API Token', 'a0c871a2cef4398042327480b9194627e86f31a7b09e8acd06e1df79e4f8f293', '[\"*\"]', NULL, NULL, '2024-02-01 12:28:10', '2024-02-01 12:28:10'),
(8, 'App\\Models\\User', 1, 'API Token', '1344c5238796d51afe7e323bc62983d1f272adb1ff855dcd7235d768dcac7e3f', '[\"*\"]', '2024-02-01 12:30:48', NULL, '2024-02-01 12:28:41', '2024-02-01 12:30:48'),
(9, 'App\\Models\\User', 1, 'API Token', '656dda6afce4693a89ecc710ddc59c7a54ae92d293019efd931d000e68f1ed83', '[\"*\"]', '2024-02-01 12:32:38', NULL, '2024-02-01 12:31:51', '2024-02-01 12:32:38'),
(10, 'App\\Models\\User', 1, 'API Token', 'ffc9834ebae817817f4342de92c7b683e8491c0c546b2681a2ca184225d88796', '[\"*\"]', NULL, NULL, '2024-02-01 12:33:48', '2024-02-01 12:33:48');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `slug` varchar(255) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `item_code` varchar(255) DEFAULT NULL,
  `keywords` varchar(255) DEFAULT NULL,
  `description` longtext DEFAULT NULL,
  `category_id` bigint(20) UNSIGNED NOT NULL,
  `brand_id` bigint(20) UNSIGNED NOT NULL,
  `tax_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `name`, `slug`, `image`, `item_code`, `keywords`, `description`, `category_id`, `brand_id`, `tax_id`, `created_at`, `updated_at`) VALUES
(27, 'FAST Trendy Loafers For Men  (White)', 'shoes for men', 'images/products/FAST Trendy Loafers For Men  (White)1707550040.webp', 'shoe-1', 'best shoes for men , shoes for men', '<h3 style=\"text-align:start\"><span style=\"font-size:18px\"><strong><span style=\"color:#0f1111\"><span style=\"font-family:&quot;Amazon Ember&quot;,Arial,sans-serif\"><span style=\"background-color:#ffffff\">Product details</span></span></span></strong></span></h3>\r\n\r\n<div class=\"a-fixed-left-grid product-facts-detail\" style=\"margin-bottom:8px; text-align:start\">\r\n<div class=\"a-fixed-left-grid-inner\" style=\"padding:0px 0px 0px 140px\">\r\n<div class=\"a-col-left a-fixed-left-grid-col\" style=\"margin-left:-140px; padding-right:0px; width:140px\"><span style=\"font-size:14px\"><span style=\"color:#0f1111\"><span style=\"font-family:&quot;Amazon Ember&quot;,Arial,sans-serif\"><span style=\"background-color:#ffffff\"><span style=\"color:#0f1111 !important\">Material type</span></span></span></span></span></div>\r\n\r\n<div class=\"a-col-right a-fixed-left-grid-col\" style=\"padding-left:14.1125px; width:235.312px\"><span style=\"font-size:14px\"><span style=\"color:#0f1111\"><span style=\"font-family:&quot;Amazon Ember&quot;,Arial,sans-serif\"><span style=\"background-color:#ffffff\"><span style=\"color:#0f1111 !important\">Mesh</span></span></span></span></span></div>\r\n</div>\r\n</div>\r\n\r\n<div class=\"a-fixed-left-grid product-facts-detail\" style=\"margin-bottom:8px; text-align:start\">\r\n<div class=\"a-fixed-left-grid-inner\" style=\"padding:0px 0px 0px 140px\">\r\n<div class=\"a-col-left a-fixed-left-grid-col\" style=\"margin-left:-140px; padding-right:0px; width:140px\"><span style=\"font-size:14px\"><span style=\"color:#0f1111\"><span style=\"font-family:&quot;Amazon Ember&quot;,Arial,sans-serif\"><span style=\"background-color:#ffffff\"><span style=\"color:#0f1111 !important\">Closure type</span></span></span></span></span></div>\r\n\r\n<div class=\"a-col-right a-fixed-left-grid-col\" style=\"padding-left:14.1125px; width:235.312px\"><span style=\"font-size:14px\"><span style=\"color:#0f1111\"><span style=\"font-family:&quot;Amazon Ember&quot;,Arial,sans-serif\"><span style=\"background-color:#ffffff\"><span style=\"color:#0f1111 !important\">Lace-Up</span></span></span></span></span></div>\r\n</div>\r\n</div>\r\n\r\n<div class=\"a-fixed-left-grid product-facts-detail\" style=\"margin-bottom:8px; text-align:start\">\r\n<div class=\"a-fixed-left-grid-inner\" style=\"padding:0px 0px 0px 140px\">\r\n<div class=\"a-col-left a-fixed-left-grid-col\" style=\"margin-left:-140px; padding-right:0px; width:140px\"><span style=\"font-size:14px\"><span style=\"color:#0f1111\"><span style=\"font-family:&quot;Amazon Ember&quot;,Arial,sans-serif\"><span style=\"background-color:#ffffff\"><span style=\"color:#0f1111 !important\">Heel type</span></span></span></span></span></div>\r\n\r\n<div class=\"a-col-right a-fixed-left-grid-col\" style=\"padding-left:14.1125px; width:235.312px\"><span style=\"font-size:14px\"><span style=\"color:#0f1111\"><span style=\"font-family:&quot;Amazon Ember&quot;,Arial,sans-serif\"><span style=\"background-color:#ffffff\"><span style=\"color:#0f1111 !important\">Flat</span></span></span></span></span></div>\r\n</div>\r\n</div>\r\n\r\n<div class=\"a-fixed-left-grid product-facts-detail\" style=\"margin-bottom:8px; text-align:start\">\r\n<div class=\"a-fixed-left-grid-inner\" style=\"padding:0px 0px 0px 140px\">\r\n<div class=\"a-col-left a-fixed-left-grid-col\" style=\"margin-left:-140px; padding-right:0px; width:140px\"><span style=\"font-size:14px\"><span style=\"color:#0f1111\"><span style=\"font-family:&quot;Amazon Ember&quot;,Arial,sans-serif\"><span style=\"background-color:#ffffff\"><span style=\"color:#0f1111 !important\">Water resistance level</span></span></span></span></span></div>\r\n\r\n<div class=\"a-col-right a-fixed-left-grid-col\" style=\"padding-left:14.1125px; width:235.312px\"><span style=\"font-size:14px\"><span style=\"color:#0f1111\"><span style=\"font-family:&quot;Amazon Ember&quot;,Arial,sans-serif\"><span style=\"background-color:#ffffff\"><span style=\"color:#0f1111 !important\">Not Water Resistant</span></span></span></span></span></div>\r\n</div>\r\n</div>\r\n\r\n<div class=\"a-fixed-left-grid product-facts-detail\" style=\"margin-bottom:8px; text-align:start\">\r\n<div class=\"a-fixed-left-grid-inner\" style=\"padding:0px 0px 0px 140px\">\r\n<div class=\"a-col-left a-fixed-left-grid-col\" style=\"margin-left:-140px; padding-right:0px; width:140px\"><span style=\"font-size:14px\"><span style=\"color:#0f1111\"><span style=\"font-family:&quot;Amazon Ember&quot;,Arial,sans-serif\"><span style=\"background-color:#ffffff\"><span style=\"color:#0f1111 !important\">Sole material</span></span></span></span></span></div>\r\n\r\n<div class=\"a-col-right a-fixed-left-grid-col\" style=\"padding-left:14.1125px; width:235.312px\"><span style=\"font-size:14px\"><span style=\"color:#0f1111\"><span style=\"font-family:&quot;Amazon Ember&quot;,Arial,sans-serif\"><span style=\"background-color:#ffffff\"><span style=\"color:#0f1111 !important\">Polyvinyl Chloride</span></span></span></span></span></div>\r\n</div>\r\n</div>\r\n\r\n<div class=\"a-fixed-left-grid product-facts-detail\" style=\"margin-bottom:8px; text-align:start\">\r\n<div class=\"a-fixed-left-grid-inner\" style=\"padding:0px 0px 0px 140px\">\r\n<div class=\"a-col-left a-fixed-left-grid-col\" style=\"margin-left:-140px; padding-right:0px; width:140px\"><span style=\"font-size:14px\"><span style=\"color:#0f1111\"><span style=\"font-family:&quot;Amazon Ember&quot;,Arial,sans-serif\"><span style=\"background-color:#ffffff\"><span style=\"color:#0f1111 !important\">Style</span></span></span></span></span></div>\r\n\r\n<div class=\"a-col-right a-fixed-left-grid-col\" style=\"padding-left:14.1125px; width:235.312px\"><span style=\"font-size:14px\"><span style=\"color:#0f1111\"><span style=\"font-family:&quot;Amazon Ember&quot;,Arial,sans-serif\"><span style=\"background-color:#ffffff\"><span style=\"color:#0f1111 !important\">Mid-Top</span></span></span></span></span></div>\r\n</div>\r\n</div>\r\n\r\n<div class=\"a-fixed-left-grid product-facts-detail\" style=\"margin-bottom:8px; text-align:start\">\r\n<div class=\"a-fixed-left-grid-inner\" style=\"padding:0px 0px 0px 140px\">\r\n<div class=\"a-col-left a-fixed-left-grid-col\" style=\"margin-left:-140px; padding-right:0px; width:140px\"><span style=\"font-size:14px\"><span style=\"color:#0f1111\"><span style=\"font-family:&quot;Amazon Ember&quot;,Arial,sans-serif\"><span style=\"background-color:#ffffff\"><span style=\"color:#0f1111 !important\">Country of Origin</span></span></span></span></span></div>\r\n\r\n<div class=\"a-col-right a-fixed-left-grid-col\" style=\"padding-left:14.1125px; width:235.312px\"><span style=\"font-size:14px\"><span style=\"color:#0f1111\"><span style=\"font-family:&quot;Amazon Ember&quot;,Arial,sans-serif\"><span style=\"background-color:#ffffff\"><span style=\"color:#0f1111 !important\">India</span></span></span></span></span></div>\r\n</div>\r\n</div>\r\n\r\n<hr />\r\n<h3 style=\"text-align:start\"><span style=\"font-size:18px\"><strong><span style=\"color:#0f1111\"><span style=\"font-family:&quot;Amazon Ember&quot;,Arial,sans-serif\"><span style=\"background-color:#ffffff\">About this item</span></span></span></strong></span></h3>\r\n\r\n<ul style=\"margin-left:18px\">\r\n	<li><span style=\"font-size:14px !important\"><span style=\"color:#0f1111\">Shoe Type: Running Shoe</span></span></li>\r\n</ul>\r\n\r\n<ul style=\"margin-left:18px\">\r\n	<li><span style=\"font-size:14px !important\"><span style=\"color:#0f1111\">Sole Material: PVC</span></span></li>\r\n</ul>\r\n\r\n<ul style=\"margin-left:18px\">\r\n	<li><span style=\"font-size:14px !important\"><span style=\"color:#0f1111\">Upper Material: MESH</span></span></li>\r\n</ul>\r\n\r\n<ul style=\"margin-left:18px\">\r\n	<li><span style=\"font-size:14px !important\"><span style=\"color:#0f1111\">Closure: SLIP ON</span></span></li>\r\n</ul>\r\n\r\n<ul style=\"margin-left:18px\">\r\n	<li><span style=\"font-size:14px !important\"><span style=\"color:#0f1111\">Toe Style: Closed Toe</span></span></li>\r\n</ul>', 8, 1, 1, '2024-01-20 11:11:17', '2024-02-10 01:57:20'),
(29, 'Men\'s Cotton Plain Casual Regular Fit Shirt | Men Full Sleeves Chinese Collar Shirt', 'Men\'s Cotton Plain Casual Regular Fit Shirt | Men Full Sleeves Chinese Collar Shirt', 'images/products/Mens-Cotton-Plain-Casual-Regular-Fit-Shirt--Men-Full-Sleeves-Chinese-Collar-Shirt1707923136.webp', 'shirt-12', 'shirt for men , SOLSTICE-shirt', '<h3 style=\"text-align:start\"><span style=\"font-size:18px\"><strong><span style=\"color:#0f1111\"><span style=\"font-family:&quot;Amazon Ember&quot;,Arial,sans-serif\"><span style=\"background-color:#ffffff\">Product details</span></span></span></strong></span></h3>\r\n\r\n<div class=\"a-fixed-left-grid product-facts-detail\" style=\"margin-bottom:8px; text-align:start\">\r\n<div class=\"a-fixed-left-grid-inner\" style=\"padding:0px 0px 0px 140px\">\r\n<div class=\"a-col-left a-fixed-left-grid-col\" style=\"margin-left:-140px; padding-right:0px; width:140px\"><span style=\"font-size:14px\"><span style=\"color:#0f1111\"><span style=\"font-family:&quot;Amazon Ember&quot;,Arial,sans-serif\"><span style=\"background-color:#ffffff\"><span style=\"color:#0f1111 !important\">Material composition</span></span></span></span></span></div>\r\n\r\n<div class=\"a-col-right a-fixed-left-grid-col\" style=\"padding-left:21.2px; width:353.388px\"><span style=\"font-size:14px\"><span style=\"color:#0f1111\"><span style=\"font-family:&quot;Amazon Ember&quot;,Arial,sans-serif\"><span style=\"background-color:#ffffff\"><span style=\"color:#0f1111 !important\">Cotton</span></span></span></span></span></div>\r\n</div>\r\n</div>\r\n\r\n<div class=\"a-fixed-left-grid product-facts-detail\" style=\"margin-bottom:8px; text-align:start\">\r\n<div class=\"a-fixed-left-grid-inner\" style=\"padding:0px 0px 0px 140px\">\r\n<div class=\"a-col-left a-fixed-left-grid-col\" style=\"margin-left:-140px; padding-right:0px; width:140px\"><span style=\"font-size:14px\"><span style=\"color:#0f1111\"><span style=\"font-family:&quot;Amazon Ember&quot;,Arial,sans-serif\"><span style=\"background-color:#ffffff\"><span style=\"color:#0f1111 !important\">Fit type</span></span></span></span></span></div>\r\n\r\n<div class=\"a-col-right a-fixed-left-grid-col\" style=\"padding-left:21.2px; width:353.388px\"><span style=\"font-size:14px\"><span style=\"color:#0f1111\"><span style=\"font-family:&quot;Amazon Ember&quot;,Arial,sans-serif\"><span style=\"background-color:#ffffff\"><span style=\"color:#0f1111 !important\">Regular Fit</span></span></span></span></span></div>\r\n</div>\r\n</div>\r\n\r\n<div class=\"a-fixed-left-grid product-facts-detail\" style=\"margin-bottom:8px; text-align:start\">\r\n<div class=\"a-fixed-left-grid-inner\" style=\"padding:0px 0px 0px 140px\">\r\n<div class=\"a-col-left a-fixed-left-grid-col\" style=\"margin-left:-140px; padding-right:0px; width:140px\"><span style=\"font-size:14px\"><span style=\"color:#0f1111\"><span style=\"font-family:&quot;Amazon Ember&quot;,Arial,sans-serif\"><span style=\"background-color:#ffffff\"><span style=\"color:#0f1111 !important\">Sleeve type</span></span></span></span></span></div>\r\n\r\n<div class=\"a-col-right a-fixed-left-grid-col\" style=\"padding-left:21.2px; width:353.388px\"><span style=\"font-size:14px\"><span style=\"color:#0f1111\"><span style=\"font-family:&quot;Amazon Ember&quot;,Arial,sans-serif\"><span style=\"background-color:#ffffff\"><span style=\"color:#0f1111 !important\">Short Sleeve</span></span></span></span></span></div>\r\n</div>\r\n</div>\r\n\r\n<div class=\"a-fixed-left-grid product-facts-detail\" style=\"margin-bottom:8px; text-align:start\">\r\n<div class=\"a-fixed-left-grid-inner\" style=\"padding:0px 0px 0px 140px\">\r\n<div class=\"a-col-left a-fixed-left-grid-col\" style=\"margin-left:-140px; padding-right:0px; width:140px\"><span style=\"font-size:14px\"><span style=\"color:#0f1111\"><span style=\"font-family:&quot;Amazon Ember&quot;,Arial,sans-serif\"><span style=\"background-color:#ffffff\"><span style=\"color:#0f1111 !important\">Collar style</span></span></span></span></span></div>\r\n\r\n<div class=\"a-col-right a-fixed-left-grid-col\" style=\"padding-left:21.2px; width:353.388px\"><span style=\"font-size:14px\"><span style=\"color:#0f1111\"><span style=\"font-family:&quot;Amazon Ember&quot;,Arial,sans-serif\"><span style=\"background-color:#ffffff\"><span style=\"color:#0f1111 !important\">Spread Collar</span></span></span></span></span></div>\r\n</div>\r\n</div>\r\n\r\n<div class=\"a-fixed-left-grid product-facts-detail\" style=\"margin-bottom:8px; text-align:start\">\r\n<div class=\"a-fixed-left-grid-inner\" style=\"padding:0px 0px 0px 140px\">\r\n<div class=\"a-col-left a-fixed-left-grid-col\" style=\"margin-left:-140px; padding-right:0px; width:140px\"><span style=\"font-size:14px\"><span style=\"color:#0f1111\"><span style=\"font-family:&quot;Amazon Ember&quot;,Arial,sans-serif\"><span style=\"background-color:#ffffff\"><span style=\"color:#0f1111 !important\">Length</span></span></span></span></span></div>\r\n\r\n<div class=\"a-col-right a-fixed-left-grid-col\" style=\"padding-left:21.2px; width:353.388px\"><span style=\"font-size:14px\"><span style=\"color:#0f1111\"><span style=\"font-family:&quot;Amazon Ember&quot;,Arial,sans-serif\"><span style=\"background-color:#ffffff\"><span style=\"color:#0f1111 !important\">Standard Length</span></span></span></span></span></div>\r\n</div>\r\n</div>\r\n\r\n<div class=\"a-fixed-left-grid product-facts-detail\" style=\"margin-bottom:8px; text-align:start\">\r\n<div class=\"a-fixed-left-grid-inner\" style=\"padding:0px 0px 0px 140px\">\r\n<div class=\"a-col-left a-fixed-left-grid-col\" style=\"margin-left:-140px; padding-right:0px; width:140px\"><span style=\"font-size:14px\"><span style=\"color:#0f1111\"><span style=\"font-family:&quot;Amazon Ember&quot;,Arial,sans-serif\"><span style=\"background-color:#ffffff\"><span style=\"color:#0f1111 !important\">Neck style</span></span></span></span></span></div>\r\n\r\n<div class=\"a-col-right a-fixed-left-grid-col\" style=\"padding-left:21.2px; width:353.388px\"><span style=\"font-size:14px\"><span style=\"color:#0f1111\"><span style=\"font-family:&quot;Amazon Ember&quot;,Arial,sans-serif\"><span style=\"background-color:#ffffff\"><span style=\"color:#0f1111 !important\">V-Neck</span></span></span></span></span></div>\r\n</div>\r\n</div>\r\n\r\n<div class=\"a-fixed-left-grid product-facts-detail\" style=\"margin-bottom:8px; text-align:start\">\r\n<div class=\"a-fixed-left-grid-inner\" style=\"padding:0px 0px 0px 140px\">\r\n<div class=\"a-col-left a-fixed-left-grid-col\" style=\"margin-left:-140px; padding-right:0px; width:140px\"><span style=\"font-size:14px\"><span style=\"color:#0f1111\"><span style=\"font-family:&quot;Amazon Ember&quot;,Arial,sans-serif\"><span style=\"background-color:#ffffff\"><span style=\"color:#0f1111 !important\">Country of Origin</span></span></span></span></span></div>\r\n\r\n<div class=\"a-col-right a-fixed-left-grid-col\" style=\"padding-left:21.2px; width:353.388px\"><span style=\"font-size:14px\"><span style=\"color:#0f1111\"><span style=\"font-family:&quot;Amazon Ember&quot;,Arial,sans-serif\"><span style=\"background-color:#ffffff\"><span style=\"color:#0f1111 !important\">India</span></span></span></span></span></div>\r\n</div>\r\n</div>\r\n\r\n<hr />\r\n<h3 style=\"text-align:start\"><span style=\"font-size:18px\"><strong><span style=\"color:#0f1111\"><span style=\"font-family:&quot;Amazon Ember&quot;,Arial,sans-serif\"><span style=\"background-color:#ffffff\">About this item</span></span></span></strong></span></h3>\r\n\r\n<ul style=\"margin-left:18px\">\r\n	<li><span style=\"font-size:14px !important\"><span style=\"color:#0f1111\">Care Instructions: Machine Wash</span></span></li>\r\n</ul>\r\n\r\n<ul style=\"margin-left:18px\">\r\n	<li><span style=\"font-size:14px !important\"><span style=\"color:#0f1111\">Breathable fabric ensures comfort even in warm weather.</span></span></li>\r\n</ul>\r\n\r\n<ul style=\"margin-left:18px\">\r\n	<li><span style=\"font-size:14px !important\"><span style=\"color:#0f1111\">High Qluality Fabric And Stitching Show As Same Of Images Products</span></span></li>\r\n</ul>\r\n\r\n<ul style=\"margin-left:18px\">\r\n	<li><span style=\"font-size:14px !important\"><span style=\"color:#0f1111\">Classic Chinese collar design adds a refined touch to your outfit.</span></span></li>\r\n</ul>\r\n\r\n<ul style=\"margin-left:18px\">\r\n	<li><span style=\"font-size:14px !important\"><span style=\"color:#0f1111\">Easy to pair: Pair with jeans for a laid-back vibe or dress it up with chinos for a smart-casual ensemble.</span></span></li>\r\n</ul>\r\n\r\n<hr />\r\n<h3 style=\"text-align:start\"><span style=\"font-size:18px\"><strong><span style=\"color:#0f1111\"><span style=\"font-family:&quot;Amazon Ember&quot;,Arial,sans-serif\"><span style=\"background-color:#ffffff\">Additional Information</span></span></span></strong></span></h3>\r\n\r\n<div class=\"a-fixed-left-grid product-facts-detail\" style=\"margin-bottom:8px; text-align:start\">\r\n<div class=\"a-fixed-left-grid-inner\" style=\"padding:0px 0px 0px 140px\">\r\n<div class=\"a-col-left a-fixed-left-grid-col\" style=\"margin-left:-140px; padding-right:0px; width:140px\"><span style=\"font-size:14px\"><span style=\"color:#0f1111\"><span style=\"font-family:&quot;Amazon Ember&quot;,Arial,sans-serif\"><span style=\"background-color:#ffffff\"><span style=\"color:#0f1111 !important\">Manufacturer</span></span></span></span></span></div>\r\n\r\n<div class=\"a-col-right a-fixed-left-grid-col\" style=\"padding-left:21.2px; width:353.388px\"><span style=\"font-size:14px\"><span style=\"color:#0f1111\"><span style=\"font-family:&quot;Amazon Ember&quot;,Arial,sans-serif\"><span style=\"background-color:#ffffff\"><span style=\"color:#0f1111 !important\">Generic - INDIA</span></span></span></span></span></div>\r\n</div>\r\n</div>\r\n\r\n<div class=\"a-fixed-left-grid product-facts-detail\" style=\"margin-bottom:8px; text-align:start\">\r\n<div class=\"a-fixed-left-grid-inner\" style=\"padding:0px 0px 0px 140px\">\r\n<div class=\"a-col-left a-fixed-left-grid-col\" style=\"margin-left:-140px; padding-right:0px; width:140px\"><span style=\"font-size:14px\"><span style=\"color:#0f1111\"><span style=\"font-family:&quot;Amazon Ember&quot;,Arial,sans-serif\"><span style=\"background-color:#ffffff\"><span style=\"color:#0f1111 !important\">Packer</span></span></span></span></span></div>\r\n\r\n<div class=\"a-col-right a-fixed-left-grid-col\" style=\"padding-left:21.2px; width:353.388px\"><span style=\"font-size:14px\"><span style=\"color:#0f1111\"><span style=\"font-family:&quot;Amazon Ember&quot;,Arial,sans-serif\"><span style=\"background-color:#ffffff\"><span style=\"color:#0f1111 !important\">KHODIYAR ENTERPRISE MART - INDIA</span></span></span></span></span></div>\r\n</div>\r\n</div>\r\n\r\n<div class=\"a-fixed-left-grid product-facts-detail\" style=\"margin-bottom:8px; text-align:start\">\r\n<div class=\"a-fixed-left-grid-inner\" style=\"padding:0px 0px 0px 140px\">\r\n<div class=\"a-col-left a-fixed-left-grid-col\" style=\"margin-left:-140px; padding-right:0px; width:140px\"><span style=\"font-size:14px\"><span style=\"color:#0f1111\"><span style=\"font-family:&quot;Amazon Ember&quot;,Arial,sans-serif\"><span style=\"background-color:#ffffff\"><span style=\"color:#0f1111 !important\">Importer</span></span></span></span></span></div>\r\n\r\n<div class=\"a-col-right a-fixed-left-grid-col\" style=\"padding-left:21.2px; width:353.388px\"><span style=\"font-size:14px\"><span style=\"color:#0f1111\"><span style=\"font-family:&quot;Amazon Ember&quot;,Arial,sans-serif\"><span style=\"background-color:#ffffff\"><span style=\"color:#0f1111 !important\">KHODIYAR ENTERPRISE MART - INDIA</span></span></span></span></span></div>\r\n</div>\r\n</div>\r\n\r\n<div class=\"a-fixed-left-grid product-facts-detail\" style=\"margin-bottom:8px; text-align:start\">\r\n<div class=\"a-fixed-left-grid-inner\" style=\"padding:0px 0px 0px 140px\">\r\n<div class=\"a-col-left a-fixed-left-grid-col\" style=\"margin-left:-140px; padding-right:0px; width:140px\"><span style=\"font-size:14px\"><span style=\"color:#0f1111\"><span style=\"font-family:&quot;Amazon Ember&quot;,Arial,sans-serif\"><span style=\"background-color:#ffffff\"><span style=\"color:#0f1111 !important\">Item Weight</span></span></span></span></span></div>\r\n\r\n<div class=\"a-col-right a-fixed-left-grid-col\" style=\"padding-left:21.2px; width:353.388px\"><span style=\"font-size:14px\"><span style=\"color:#0f1111\"><span style=\"font-family:&quot;Amazon Ember&quot;,Arial,sans-serif\"><span style=\"background-color:#ffffff\"><span style=\"color:#0f1111 !important\">299 g</span></span></span></span></span></div>\r\n</div>\r\n</div>\r\n\r\n<div class=\"a-fixed-left-grid product-facts-detail\" style=\"margin-bottom:8px; text-align:start\">\r\n<div class=\"a-fixed-left-grid-inner\" style=\"padding:0px 0px 0px 140px\">\r\n<div class=\"a-col-left a-fixed-left-grid-col\" style=\"margin-left:-140px; padding-right:0px; width:140px\"><span style=\"font-size:14px\"><span style=\"color:#0f1111\"><span style=\"font-family:&quot;Amazon Ember&quot;,Arial,sans-serif\"><span style=\"background-color:#ffffff\"><span style=\"color:#0f1111 !important\">Item Dimensions LxWxH</span></span></span></span></span></div>\r\n\r\n<div class=\"a-col-right a-fixed-left-grid-col\" style=\"padding-left:21.2px; width:353.388px\"><span style=\"font-size:14px\"><span style=\"color:#0f1111\"><span style=\"font-family:&quot;Amazon Ember&quot;,Arial,sans-serif\"><span style=\"background-color:#ffffff\"><span style=\"color:#0f1111 !important\">28 x 25 x 5 Centimeters</span></span></span></span></span></div>\r\n</div>\r\n</div>\r\n\r\n<div class=\"a-fixed-left-grid product-facts-detail\" style=\"margin-bottom:8px; text-align:start\">\r\n<div class=\"a-fixed-left-grid-inner\" style=\"padding:0px 0px 0px 140px\">\r\n<div class=\"a-col-left a-fixed-left-grid-col\" style=\"margin-left:-140px; padding-right:0px; width:140px\"><span style=\"font-size:14px\"><span style=\"color:#0f1111\"><span style=\"font-family:&quot;Amazon Ember&quot;,Arial,sans-serif\"><span style=\"background-color:#ffffff\"><span style=\"color:#0f1111 !important\">Net Quantity</span></span></span></span></span></div>\r\n\r\n<div class=\"a-col-right a-fixed-left-grid-col\" style=\"padding-left:21.2px; width:353.388px\"><span style=\"font-size:14px\"><span style=\"color:#0f1111\"><span style=\"font-family:&quot;Amazon Ember&quot;,Arial,sans-serif\"><span style=\"background-color:#ffffff\"><span style=\"color:#0f1111 !important\">1.00 count</span></span></span></span></span></div>\r\n</div>\r\n</div>\r\n\r\n<div class=\"a-fixed-left-grid product-facts-detail\" style=\"margin-bottom:8px; text-align:start\">\r\n<div class=\"a-fixed-left-grid-inner\" style=\"padding:0px 0px 0px 140px\">\r\n<div class=\"a-col-left a-fixed-left-grid-col\" style=\"margin-left:-140px; padding-right:0px; width:140px\"><span style=\"font-size:14px\"><span style=\"color:#0f1111\"><span style=\"font-family:&quot;Amazon Ember&quot;,Arial,sans-serif\"><span style=\"background-color:#ffffff\"><span style=\"color:#0f1111 !important\">Generic Name</span></span></span></span></span></div>\r\n\r\n<div class=\"a-col-right a-fixed-left-grid-col\" style=\"padding-left:21.2px; width:353.388px\"><span style=\"font-size:14px\"><span style=\"color:#0f1111\"><span style=\"font-family:&quot;Amazon Ember&quot;,Arial,sans-serif\"><span style=\"background-color:#ffffff\"><span style=\"color:#0f1111 !important\">Shirt</span></span></span></span></span></div>\r\n</div>\r\n</div>', 7, 2, 1, '2024-02-10 12:33:11', '2024-02-14 09:35:36'),
(30, 'Baggit Women\'s Satchel Handbag - Medium', 'Baggit Women\'s Satchel Handbag - Medium', 'images/products/Baggit-Womens-Satchel-Handbag---Medium1707923675.webp', 'bag-1231', 'Baggit Women\'s Satchel Handbag - Medium , hand bag for women', '<h3 style=\"text-align:start\"><span style=\"font-size:18px\"><strong><span style=\"color:#0f1111\"><span style=\"font-family:&quot;Amazon Ember&quot;,Arial,sans-serif\"><span style=\"background-color:#ffffff\">Product details</span></span></span></strong></span></h3>\r\n\r\n<div class=\"a-fixed-left-grid product-facts-detail\" style=\"margin-bottom:8px; text-align:start\">\r\n<div class=\"a-fixed-left-grid-inner\" style=\"padding:0px 0px 0px 140px\">\r\n<div class=\"a-col-left a-fixed-left-grid-col\" style=\"margin-left:-140px; padding-right:0px; width:140px\"><span style=\"font-size:14px\"><span style=\"color:#0f1111\"><span style=\"font-family:&quot;Amazon Ember&quot;,Arial,sans-serif\"><span style=\"background-color:#ffffff\"><span style=\"color:#0f1111 !important\">Closure type</span></span></span></span></span></div>\r\n\r\n<div class=\"a-col-right a-fixed-left-grid-col\" style=\"padding-left:17.0375px; width:284px\"><span style=\"font-size:14px\"><span style=\"color:#0f1111\"><span style=\"font-family:&quot;Amazon Ember&quot;,Arial,sans-serif\"><span style=\"background-color:#ffffff\"><span style=\"color:#0f1111 !important\">Zipper</span></span></span></span></span></div>\r\n</div>\r\n</div>\r\n\r\n<div class=\"a-fixed-left-grid product-facts-detail\" style=\"margin-bottom:8px; text-align:start\">\r\n<div class=\"a-fixed-left-grid-inner\" style=\"padding:0px 0px 0px 140px\">\r\n<div class=\"a-col-left a-fixed-left-grid-col\" style=\"margin-left:-140px; padding-right:0px; width:140px\"><span style=\"font-size:14px\"><span style=\"color:#0f1111\"><span style=\"font-family:&quot;Amazon Ember&quot;,Arial,sans-serif\"><span style=\"background-color:#ffffff\"><span style=\"color:#0f1111 !important\">Outer material</span></span></span></span></span></div>\r\n\r\n<div class=\"a-col-right a-fixed-left-grid-col\" style=\"padding-left:17.0375px; width:284px\"><span style=\"font-size:14px\"><span style=\"color:#0f1111\"><span style=\"font-family:&quot;Amazon Ember&quot;,Arial,sans-serif\"><span style=\"background-color:#ffffff\"><span style=\"color:#0f1111 !important\">Polyvinyl Chloride</span></span></span></span></span></div>\r\n</div>\r\n</div>\r\n\r\n<div class=\"a-fixed-left-grid product-facts-detail\" style=\"margin-bottom:8px; text-align:start\">\r\n<div class=\"a-fixed-left-grid-inner\" style=\"padding:0px 0px 0px 140px\">\r\n<div class=\"a-col-left a-fixed-left-grid-col\" style=\"margin-left:-140px; padding-right:0px; width:140px\"><span style=\"font-size:14px\"><span style=\"color:#0f1111\"><span style=\"font-family:&quot;Amazon Ember&quot;,Arial,sans-serif\"><span style=\"background-color:#ffffff\"><span style=\"color:#0f1111 !important\">Style</span></span></span></span></span></div>\r\n\r\n<div class=\"a-col-right a-fixed-left-grid-col\" style=\"padding-left:17.0375px; width:284px\"><span style=\"font-size:14px\"><span style=\"color:#0f1111\"><span style=\"font-family:&quot;Amazon Ember&quot;,Arial,sans-serif\"><span style=\"background-color:#ffffff\"><span style=\"color:#0f1111 !important\">Satchel Handbag</span></span></span></span></span></div>\r\n</div>\r\n</div>\r\n\r\n<div class=\"a-fixed-left-grid product-facts-detail\" style=\"margin-bottom:8px; text-align:start\">\r\n<div class=\"a-fixed-left-grid-inner\" style=\"padding:0px 0px 0px 140px\">\r\n<div class=\"a-col-left a-fixed-left-grid-col\" style=\"margin-left:-140px; padding-right:0px; width:140px\"><span style=\"font-size:14px\"><span style=\"color:#0f1111\"><span style=\"font-family:&quot;Amazon Ember&quot;,Arial,sans-serif\"><span style=\"background-color:#ffffff\"><span style=\"color:#0f1111 !important\">Occasion type</span></span></span></span></span></div>\r\n\r\n<div class=\"a-col-right a-fixed-left-grid-col\" style=\"padding-left:17.0375px; width:284px\"><span style=\"font-size:14px\"><span style=\"color:#0f1111\"><span style=\"font-family:&quot;Amazon Ember&quot;,Arial,sans-serif\"><span style=\"background-color:#ffffff\"><span style=\"color:#0f1111 !important\">Casual</span></span></span></span></span></div>\r\n</div>\r\n</div>\r\n\r\n<div class=\"a-fixed-left-grid product-facts-detail\" style=\"margin-bottom:8px; text-align:start\">\r\n<div class=\"a-fixed-left-grid-inner\" style=\"padding:0px 0px 0px 140px\">\r\n<div class=\"a-col-left a-fixed-left-grid-col\" style=\"margin-left:-140px; padding-right:0px; width:140px\"><span style=\"font-size:14px\"><span style=\"color:#0f1111\"><span style=\"font-family:&quot;Amazon Ember&quot;,Arial,sans-serif\"><span style=\"background-color:#ffffff\"><span style=\"color:#0f1111 !important\">Number of pockets</span></span></span></span></span></div>\r\n\r\n<div class=\"a-col-right a-fixed-left-grid-col\" style=\"padding-left:17.0375px; width:284px\"><span style=\"font-size:14px\"><span style=\"color:#0f1111\"><span style=\"font-family:&quot;Amazon Ember&quot;,Arial,sans-serif\"><span style=\"background-color:#ffffff\"><span style=\"color:#0f1111 !important\">3</span></span></span></span></span></div>\r\n</div>\r\n</div>\r\n\r\n<div class=\"a-fixed-left-grid product-facts-detail\" style=\"margin-bottom:8px; text-align:start\">\r\n<div class=\"a-fixed-left-grid-inner\" style=\"padding:0px 0px 0px 140px\">\r\n<div class=\"a-col-left a-fixed-left-grid-col\" style=\"margin-left:-140px; padding-right:0px; width:140px\"><span style=\"font-size:14px\"><span style=\"color:#0f1111\"><span style=\"font-family:&quot;Amazon Ember&quot;,Arial,sans-serif\"><span style=\"background-color:#ffffff\"><span style=\"color:#0f1111 !important\">Lining</span></span></span></span></span></div>\r\n\r\n<div class=\"a-col-right a-fixed-left-grid-col\" style=\"padding-left:17.0375px; width:284px\"><span style=\"font-size:14px\"><span style=\"color:#0f1111\"><span style=\"font-family:&quot;Amazon Ember&quot;,Arial,sans-serif\"><span style=\"background-color:#ffffff\"><span style=\"color:#0f1111 !important\">Polyurethane</span></span></span></span></span></div>\r\n</div>\r\n</div>\r\n\r\n<div class=\"a-fixed-left-grid product-facts-detail\" style=\"margin-bottom:8px; text-align:start\">\r\n<div class=\"a-fixed-left-grid-inner\" style=\"padding:0px 0px 0px 140px\">\r\n<div class=\"a-col-left a-fixed-left-grid-col\" style=\"margin-left:-140px; padding-right:0px; width:140px\"><span style=\"font-size:14px\"><span style=\"color:#0f1111\"><span style=\"font-family:&quot;Amazon Ember&quot;,Arial,sans-serif\"><span style=\"background-color:#ffffff\"><span style=\"color:#0f1111 !important\">Country of Origin</span></span></span></span></span></div>\r\n\r\n<div class=\"a-col-right a-fixed-left-grid-col\" style=\"padding-left:17.0375px; width:284px\"><span style=\"font-size:14px\"><span style=\"color:#0f1111\"><span style=\"font-family:&quot;Amazon Ember&quot;,Arial,sans-serif\"><span style=\"background-color:#ffffff\"><span style=\"color:#0f1111 !important\">India</span></span></span></span></span></div>\r\n</div>\r\n</div>\r\n\r\n<hr />\r\n<h3 style=\"text-align:start\"><span style=\"font-size:18px\"><strong><span style=\"color:#0f1111\"><span style=\"font-family:&quot;Amazon Ember&quot;,Arial,sans-serif\"><span style=\"background-color:#ffffff\">About this item</span></span></span></strong></span></h3>\r\n\r\n<ul style=\"margin-left:18px\">\r\n	<li><span style=\"font-size:14px !important\"><span style=\"color:#0f1111\">Wallet sling</span></span></li>\r\n</ul>\r\n\r\n<ul style=\"margin-left:18px\">\r\n	<li><span style=\"font-size:14px !important\"><span style=\"color:#0f1111\">Beige exterior</span></span></li>\r\n</ul>\r\n\r\n<ul style=\"margin-left:18px\">\r\n	<li><span style=\"font-size:14px !important\"><span style=\"color:#0f1111\">Size XL</span></span></li>\r\n</ul>\r\n\r\n<ul style=\"margin-left:18px\">\r\n	<li><span style=\"font-size:14px !important\"><span style=\"color:#0f1111\">1 main compartment with zippered partition</span></span></li>\r\n</ul>\r\n\r\n<ul style=\"margin-left:18px\">\r\n	<li><span style=\"font-size:14px !important\"><span style=\"color:#0f1111\">Multiple card slots</span></span></li>\r\n</ul>\r\n\r\n<ul style=\"margin-left:18px\">\r\n	<li><span style=\"font-size:14px !important\"><span style=\"color:#0f1111\">Zipper closure Inside zipper Quick access zipper on the outside</span></span></li>\r\n</ul>\r\n\r\n<hr />\r\n<h3 style=\"text-align:start\"><span style=\"font-size:18px\"><strong><span style=\"color:#0f1111\"><span style=\"font-family:&quot;Amazon Ember&quot;,Arial,sans-serif\"><span style=\"background-color:#ffffff\">Additional Information</span></span></span></strong></span></h3>\r\n\r\n<div class=\"a-fixed-left-grid product-facts-detail\" style=\"margin-bottom:8px; text-align:start\">\r\n<div class=\"a-fixed-left-grid-inner\" style=\"padding:0px 0px 0px 140px\">\r\n<div class=\"a-col-left a-fixed-left-grid-col\" style=\"margin-left:-140px; padding-right:0px; width:140px\"><span style=\"font-size:14px\"><span style=\"color:#0f1111\"><span style=\"font-family:&quot;Amazon Ember&quot;,Arial,sans-serif\"><span style=\"background-color:#ffffff\"><span style=\"color:#0f1111 !important\">Manufacturer</span></span></span></span></span></div>\r\n\r\n<div class=\"a-col-right a-fixed-left-grid-col\" style=\"padding-left:17.0375px; width:284px\"><span style=\"font-size:14px\"><span style=\"color:#0f1111\"><span style=\"font-family:&quot;Amazon Ember&quot;,Arial,sans-serif\"><span style=\"background-color:#ffffff\"><span style=\"color:#0f1111 !important\">Baggit India Pvt Ltd, Baggit India Pvt Ltd</span></span></span></span></span></div>\r\n</div>\r\n</div>\r\n\r\n<div class=\"a-fixed-left-grid product-facts-detail\" style=\"margin-bottom:8px; text-align:start\">\r\n<div class=\"a-fixed-left-grid-inner\" style=\"padding:0px 0px 0px 140px\">\r\n<div class=\"a-col-left a-fixed-left-grid-col\" style=\"margin-left:-140px; padding-right:0px; width:140px\"><span style=\"font-size:14px\"><span style=\"color:#0f1111\"><span style=\"font-family:&quot;Amazon Ember&quot;,Arial,sans-serif\"><span style=\"background-color:#ffffff\"><span style=\"color:#0f1111 !important\">Packer</span></span></span></span></span></div>\r\n\r\n<div class=\"a-col-right a-fixed-left-grid-col\" style=\"padding-left:17.0375px; width:284px\"><span style=\"font-size:14px\"><span style=\"color:#0f1111\"><span style=\"font-family:&quot;Amazon Ember&quot;,Arial,sans-serif\"><span style=\"background-color:#ffffff\"><span style=\"color:#0f1111 !important\">Baggit India Pvt Ltd</span></span></span></span></span></div>\r\n</div>\r\n</div>\r\n\r\n<div class=\"a-fixed-left-grid product-facts-detail\" style=\"margin-bottom:8px; text-align:start\">\r\n<div class=\"a-fixed-left-grid-inner\" style=\"padding:0px 0px 0px 140px\">\r\n<div class=\"a-col-left a-fixed-left-grid-col\" style=\"margin-left:-140px; padding-right:0px; width:140px\"><span style=\"font-size:14px\"><span style=\"color:#0f1111\"><span style=\"font-family:&quot;Amazon Ember&quot;,Arial,sans-serif\"><span style=\"background-color:#ffffff\"><span style=\"color:#0f1111 !important\">Importer</span></span></span></span></span></div>\r\n\r\n<div class=\"a-col-right a-fixed-left-grid-col\" style=\"padding-left:17.0375px; width:284px\"><span style=\"font-size:14px\"><span style=\"color:#0f1111\"><span style=\"font-family:&quot;Amazon Ember&quot;,Arial,sans-serif\"><span style=\"background-color:#ffffff\"><span style=\"color:#0f1111 !important\">Baggit India Pvt Ltd</span></span></span></span></span></div>\r\n</div>\r\n</div>\r\n\r\n<div class=\"a-fixed-left-grid product-facts-detail\" style=\"margin-bottom:8px; text-align:start\">\r\n<div class=\"a-fixed-left-grid-inner\" style=\"padding:0px 0px 0px 140px\">\r\n<div class=\"a-col-left a-fixed-left-grid-col\" style=\"margin-left:-140px; padding-right:0px; width:140px\"><span style=\"font-size:14px\"><span style=\"color:#0f1111\"><span style=\"font-family:&quot;Amazon Ember&quot;,Arial,sans-serif\"><span style=\"background-color:#ffffff\"><span style=\"color:#0f1111 !important\">Item Weight</span></span></span></span></span></div>\r\n\r\n<div class=\"a-col-right a-fixed-left-grid-col\" style=\"padding-left:17.0375px; width:284px\"><span style=\"font-size:14px\"><span style=\"color:#0f1111\"><span style=\"font-family:&quot;Amazon Ember&quot;,Arial,sans-serif\"><span style=\"background-color:#ffffff\"><span style=\"color:#0f1111 !important\">250 g</span></span></span></span></span></div>\r\n</div>\r\n</div>\r\n\r\n<div class=\"a-fixed-left-grid product-facts-detail\" style=\"margin-bottom:8px; text-align:start\">\r\n<div class=\"a-fixed-left-grid-inner\" style=\"padding:0px 0px 0px 140px\">\r\n<div class=\"a-col-left a-fixed-left-grid-col\" style=\"margin-left:-140px; padding-right:0px; width:140px\"><span style=\"font-size:14px\"><span style=\"color:#0f1111\"><span style=\"font-family:&quot;Amazon Ember&quot;,Arial,sans-serif\"><span style=\"background-color:#ffffff\"><span style=\"color:#0f1111 !important\">Item Dimensions LxWxH</span></span></span></span></span></div>\r\n\r\n<div class=\"a-col-right a-fixed-left-grid-col\" style=\"padding-left:17.0375px; width:284px\"><span style=\"font-size:14px\"><span style=\"color:#0f1111\"><span style=\"font-family:&quot;Amazon Ember&quot;,Arial,sans-serif\"><span style=\"background-color:#ffffff\"><span style=\"color:#0f1111 !important\">35.6 x 11.4 x 22.9 Centimeters</span></span></span></span></span></div>\r\n</div>\r\n</div>\r\n\r\n<div class=\"a-fixed-left-grid product-facts-detail\" style=\"margin-bottom:8px; text-align:start\">\r\n<div class=\"a-fixed-left-grid-inner\" style=\"padding:0px 0px 0px 140px\">\r\n<div class=\"a-col-left a-fixed-left-grid-col\" style=\"margin-left:-140px; padding-right:0px; width:140px\"><span style=\"font-size:14px\"><span style=\"color:#0f1111\"><span style=\"font-family:&quot;Amazon Ember&quot;,Arial,sans-serif\"><span style=\"background-color:#ffffff\"><span style=\"color:#0f1111 !important\">Net Quantity</span></span></span></span></span></div>\r\n\r\n<div class=\"a-col-right a-fixed-left-grid-col\" style=\"padding-left:17.0375px; width:284px\"><span style=\"font-size:14px\"><span style=\"color:#0f1111\"><span style=\"font-family:&quot;Amazon Ember&quot;,Arial,sans-serif\"><span style=\"background-color:#ffffff\"><span style=\"color:#0f1111 !important\">1.00 count</span></span></span></span></span></div>\r\n</div>\r\n</div>\r\n\r\n<div class=\"a-fixed-left-grid product-facts-detail\" style=\"margin-bottom:8px; text-align:start\">\r\n<div class=\"a-fixed-left-grid-inner\" style=\"padding:0px 0px 0px 140px\">\r\n<div class=\"a-col-left a-fixed-left-grid-col\" style=\"margin-left:-140px; padding-right:0px; width:140px\"><span style=\"font-size:14px\"><span style=\"color:#0f1111\"><span style=\"font-family:&quot;Amazon Ember&quot;,Arial,sans-serif\"><span style=\"background-color:#ffffff\"><span style=\"color:#0f1111 !important\">Included Components</span></span></span></span></span></div>\r\n\r\n<div class=\"a-col-right a-fixed-left-grid-col\" style=\"padding-left:17.0375px; width:284px\"><span style=\"font-size:14px\"><span style=\"color:#0f1111\"><span style=\"font-family:&quot;Amazon Ember&quot;,Arial,sans-serif\"><span style=\"background-color:#ffffff\"><span style=\"color:#0f1111 !important\">cosmetic_bag</span></span></span></span></span></div>\r\n</div>\r\n</div>\r\n\r\n<div class=\"a-fixed-left-grid product-facts-detail\" style=\"margin-bottom:8px; text-align:start\">\r\n<div class=\"a-fixed-left-grid-inner\" style=\"padding:0px 0px 0px 140px\">\r\n<div class=\"a-col-left a-fixed-left-grid-col\" style=\"margin-left:-140px; padding-right:0px; width:140px\"><span style=\"font-size:14px\"><span style=\"color:#0f1111\"><span style=\"font-family:&quot;Amazon Ember&quot;,Arial,sans-serif\"><span style=\"background-color:#ffffff\"><span style=\"color:#0f1111 !important\">Generic Name</span></span></span></span></span></div>\r\n\r\n<div class=\"a-col-right a-fixed-left-grid-col\" style=\"padding-left:17.0375px; width:284px\"><span style=\"font-size:14px\"><span style=\"color:#0f1111\"><span style=\"font-family:&quot;Amazon Ember&quot;,Arial,sans-serif\"><span style=\"background-color:#ffffff\"><span style=\"color:#0f1111 !important\">Satchel Handbag</span></span></span></span></span></div>\r\n</div>\r\n</div>', 10, 3, 1, '2024-02-14 09:44:35', '2024-02-14 09:44:35');

-- --------------------------------------------------------

--
-- Table structure for table `product_attributes`
--

CREATE TABLE `product_attributes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `category_id` bigint(20) UNSIGNED NOT NULL,
  `attribute_value_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `product_attributes`
--

INSERT INTO `product_attributes` (`id`, `product_id`, `category_id`, `attribute_value_id`, `created_at`, `updated_at`) VALUES
(188, 27, 8, 1, '2024-02-10 02:02:13', '2024-02-10 02:02:13'),
(189, 27, 8, 4, '2024-02-10 02:02:13', '2024-02-10 02:02:13');

-- --------------------------------------------------------

--
-- Table structure for table `product_attrs`
--

CREATE TABLE `product_attrs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `color_id` bigint(20) UNSIGNED NOT NULL,
  `size_id` bigint(20) UNSIGNED NOT NULL,
  `sku` varchar(255) DEFAULT NULL,
  `mrp` int(11) NOT NULL DEFAULT 0,
  `price` int(11) NOT NULL DEFAULT 0,
  `qty` int(11) NOT NULL DEFAULT 0,
  `length` varchar(255) NOT NULL DEFAULT '0',
  `breadth` varchar(255) NOT NULL DEFAULT '0',
  `height` varchar(255) NOT NULL DEFAULT '0',
  `weight` varchar(255) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `product_attrs`
--

INSERT INTO `product_attrs` (`id`, `product_id`, `color_id`, `size_id`, `sku`, `mrp`, `price`, `qty`, `length`, `breadth`, `height`, `weight`, `created_at`, `updated_at`) VALUES
(24, 27, 5, 3, '1000', 1200, 999, 0, '20', '10', '15', '200', '2024-01-20 11:11:17', '2024-02-10 02:02:13'),
(33, 27, 6, 4, '1001', 1200, 998, 0, '20', '10', '20', '200', '2024-02-10 01:57:20', '2024-02-10 02:02:13'),
(34, 29, 3, 1, '123', 1399, 999, 0, '12', '12', '12', '200', '2024-02-10 12:33:11', '2024-02-14 09:35:36'),
(35, 29, 4, 1, '231', 1299, 999, 0, '12', '12', '12', '12', '2024-02-14 09:35:36', '2024-02-14 09:35:36'),
(36, 30, 1, 1, '12221', 1599, 1299, 0, '12', '12', '12', '100', '2024-02-14 09:44:35', '2024-02-14 09:44:35'),
(37, 30, 3, 1, '32187', 1699, 1299, 0, '12', '12', '12', '200', '2024-02-14 09:44:35', '2024-02-14 09:44:35');

-- --------------------------------------------------------

--
-- Table structure for table `product_attr_images`
--

CREATE TABLE `product_attr_images` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `product_attr_id` bigint(20) UNSIGNED NOT NULL,
  `image` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `product_attr_images`
--

INSERT INTO `product_attr_images` (`id`, `product_id`, `product_attr_id`, `image`, `created_at`, `updated_at`) VALUES
(39, 27, 24, 'images/productsAttr/408759test1706460918.jpg', '2024-01-28 11:25:18', '2024-01-28 11:25:18'),
(91, 27, 24, 'images/productsAttr/712495FAST Trendy Loafers For Men  (White)1707550040.webp', '2024-02-10 01:57:20', '2024-02-10 01:57:20'),
(92, 27, 24, 'images/productsAttr/689505FAST Trendy Loafers For Men  (White)1707550333.webp', '2024-02-10 02:02:13', '2024-02-10 02:02:13'),
(93, 27, 24, 'images/productsAttr/293867FAST Trendy Loafers For Men  (White)1707550333.webp', '2024-02-10 02:02:13', '2024-02-10 02:02:13'),
(94, 27, 24, 'images/productsAttr/822779FAST Trendy Loafers For Men  (White)1707550333.webp', '2024-02-10 02:02:13', '2024-02-10 02:02:13'),
(95, 27, 24, 'images/productsAttr/801587FAST Trendy Loafers For Men  (White)1707550333.webp', '2024-02-10 02:02:13', '2024-02-10 02:02:13'),
(96, 27, 33, 'images/productsAttr/599070FAST Trendy Loafers For Men  (White)1707550333.webp', '2024-02-10 02:02:13', '2024-02-10 02:02:13'),
(97, 27, 33, 'images/productsAttr/604042FAST Trendy Loafers For Men  (White)1707550333.webp', '2024-02-10 02:02:13', '2024-02-10 02:02:13'),
(98, 27, 33, 'images/productsAttr/901086FAST Trendy Loafers For Men  (White)1707550333.webp', '2024-02-10 02:02:13', '2024-02-10 02:02:13'),
(99, 27, 33, 'images/productsAttr/319734FAST Trendy Loafers For Men  (White)1707550333.webp', '2024-02-10 02:02:13', '2024-02-10 02:02:13'),
(101, 29, 34, 'images/productsAttr/728045Mens-Cotton-Plain-Casual-Regular-Fit-Shirt--Men-Full-Sleeves-Chinese-Collar-Shirt1707923136.webp', '2024-02-14 09:35:36', '2024-02-14 09:35:36'),
(102, 29, 34, 'images/productsAttr/851588Mens-Cotton-Plain-Casual-Regular-Fit-Shirt--Men-Full-Sleeves-Chinese-Collar-Shirt1707923136.webp', '2024-02-14 09:35:36', '2024-02-14 09:35:36'),
(103, 29, 34, 'images/productsAttr/318360Mens-Cotton-Plain-Casual-Regular-Fit-Shirt--Men-Full-Sleeves-Chinese-Collar-Shirt1707923136.webp', '2024-02-14 09:35:36', '2024-02-14 09:35:36'),
(104, 29, 35, 'images/productsAttr/131050Mens-Cotton-Plain-Casual-Regular-Fit-Shirt--Men-Full-Sleeves-Chinese-Collar-Shirt1707923136.webp', '2024-02-14 09:35:36', '2024-02-14 09:35:36'),
(105, 29, 35, 'images/productsAttr/492651Mens-Cotton-Plain-Casual-Regular-Fit-Shirt--Men-Full-Sleeves-Chinese-Collar-Shirt1707923136.webp', '2024-02-14 09:35:36', '2024-02-14 09:35:36'),
(106, 29, 35, 'images/productsAttr/939836Mens-Cotton-Plain-Casual-Regular-Fit-Shirt--Men-Full-Sleeves-Chinese-Collar-Shirt1707923136.webp', '2024-02-14 09:35:36', '2024-02-14 09:35:36'),
(107, 30, 36, 'images/productsAttr/148435Baggit-Womens-Satchel-Handbag---Medium1707923675.webp', '2024-02-14 09:44:35', '2024-02-14 09:44:35'),
(108, 30, 36, 'images/productsAttr/775083Baggit-Womens-Satchel-Handbag---Medium1707923675.webp', '2024-02-14 09:44:35', '2024-02-14 09:44:35'),
(109, 30, 36, 'images/productsAttr/868329Baggit-Womens-Satchel-Handbag---Medium1707923675.webp', '2024-02-14 09:44:35', '2024-02-14 09:44:35'),
(110, 30, 37, 'images/productsAttr/278167Baggit-Womens-Satchel-Handbag---Medium1707923675.webp', '2024-02-14 09:44:35', '2024-02-14 09:44:35'),
(111, 30, 37, 'images/productsAttr/114028Baggit-Womens-Satchel-Handbag---Medium1707923675.webp', '2024-02-14 09:44:35', '2024-02-14 09:44:35'),
(112, 30, 37, 'images/productsAttr/769647Baggit-Womens-Satchel-Handbag---Medium1707923675.webp', '2024-02-14 09:44:35', '2024-02-14 09:44:35');

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `slug`, `created_at`, `updated_at`) VALUES
(1, 'Admin', 'admin', NULL, NULL),
(2, 'Seller', 'seller', NULL, NULL),
(3, 'Customer', 'customer', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `sizes`
--

CREATE TABLE `sizes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `text` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sizes`
--

INSERT INTO `sizes` (`id`, `text`, `created_at`, `updated_at`) VALUES
(1, 'S', '2023-11-26 10:42:41', '2023-11-26 10:42:41'),
(3, 'uk-9', '2024-02-10 01:59:44', '2024-02-10 01:59:44'),
(4, 'uk-10', '2024-02-10 01:59:56', '2024-02-10 01:59:56');

-- --------------------------------------------------------

--
-- Table structure for table `taxes`
--

CREATE TABLE `taxes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `text` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `taxes`
--

INSERT INTO `taxes` (`id`, `text`, `created_at`, `updated_at`) VALUES
(1, 10, '2023-12-24 08:37:05', '2023-12-24 08:37:12');

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
  `phone` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `twitter_link` varchar(255) DEFAULT NULL,
  `fb_link` varchar(255) DEFAULT NULL,
  `insta_link` varchar(255) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `phone`, `address`, `twitter_link`, `fb_link`, `insta_link`, `image`, `created_at`, `updated_at`) VALUES
(1, 'codeWithVineetMaanas', 'admin@gmail.com', NULL, '$2y$10$NbZNyNiQGpY7j9reaY0WZugmXpeIsfBVFkhOrSaSt6CJtvGVYpy0.', NULL, '2131241421', 'test', 'test', 'test', 'test', 'images/Admin1702746112.png', '2023-10-17 11:21:25', '2024-02-01 12:30:48'),
(2, 'codeWithVineetMaanas', 'vineet@gmail.com', NULL, '$2y$10$moleCBNIkMuCg/OhRWcxkOwFebUHHhVxnNn4VlhNaZx6qwED9Kizu', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-01-30 14:16:06', '2024-02-01 12:35:22');

-- --------------------------------------------------------

--
-- Table structure for table `user_roles`
--

CREATE TABLE `user_roles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `user_roles`
--

INSERT INTO `user_roles` (`id`, `user_id`, `role_id`) VALUES
(1, 1, 1),
(2, 2, 3);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `attributes`
--
ALTER TABLE `attributes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `attribute_values`
--
ALTER TABLE `attribute_values`
  ADD PRIMARY KEY (`id`),
  ADD KEY `attribute_values_attributes_id_foreign` (`attributes_id`);

--
-- Indexes for table `brands`
--
ALTER TABLE `brands`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `categories_parent_category_id_foreign` (`parent_category_id`);

--
-- Indexes for table `category_attribute`
--
ALTER TABLE `category_attribute`
  ADD PRIMARY KEY (`id`),
  ADD KEY `category_attribute_category_id_foreign` (`category_id`),
  ADD KEY `category_attribute_attribute_id_foreign` (`attribute_id`);

--
-- Indexes for table `colors`
--
ALTER TABLE `colors`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `home_banners`
--
ALTER TABLE `home_banners`
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
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `products_category_id_foreign` (`category_id`),
  ADD KEY `products_brand_id_foreign` (`brand_id`),
  ADD KEY `products_tax_id_foreign` (`tax_id`);

--
-- Indexes for table `product_attributes`
--
ALTER TABLE `product_attributes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_attributes_product_id_foreign` (`product_id`),
  ADD KEY `product_attributes_category_id_foreign` (`category_id`),
  ADD KEY `product_attributes_attribute_value_id_foreign` (`attribute_value_id`);

--
-- Indexes for table `product_attrs`
--
ALTER TABLE `product_attrs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_attrs_product_id_foreign` (`product_id`),
  ADD KEY `product_attrs_color_id_foreign` (`color_id`),
  ADD KEY `product_attrs_size_id_foreign` (`size_id`);

--
-- Indexes for table `product_attr_images`
--
ALTER TABLE `product_attr_images`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_attr_images_product_id_foreign` (`product_id`),
  ADD KEY `product_attr_images_product_attr_id_foreign` (`product_attr_id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sizes`
--
ALTER TABLE `sizes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `taxes`
--
ALTER TABLE `taxes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- Indexes for table `user_roles`
--
ALTER TABLE `user_roles`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_roles_user_id_foreign` (`user_id`),
  ADD KEY `user_roles_role_id_foreign` (`role_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `attributes`
--
ALTER TABLE `attributes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `attribute_values`
--
ALTER TABLE `attribute_values`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `brands`
--
ALTER TABLE `brands`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `category_attribute`
--
ALTER TABLE `category_attribute`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `colors`
--
ALTER TABLE `colors`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `home_banners`
--
ALTER TABLE `home_banners`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `product_attributes`
--
ALTER TABLE `product_attributes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=190;

--
-- AUTO_INCREMENT for table `product_attrs`
--
ALTER TABLE `product_attrs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

--
-- AUTO_INCREMENT for table `product_attr_images`
--
ALTER TABLE `product_attr_images`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=113;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `sizes`
--
ALTER TABLE `sizes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `taxes`
--
ALTER TABLE `taxes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `user_roles`
--
ALTER TABLE `user_roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `attribute_values`
--
ALTER TABLE `attribute_values`
  ADD CONSTRAINT `attribute_values_attributes_id_foreign` FOREIGN KEY (`attributes_id`) REFERENCES `attributes` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `categories`
--
ALTER TABLE `categories`
  ADD CONSTRAINT `categories_parent_category_id_foreign` FOREIGN KEY (`parent_category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `category_attribute`
--
ALTER TABLE `category_attribute`
  ADD CONSTRAINT `category_attribute_attribute_id_foreign` FOREIGN KEY (`attribute_id`) REFERENCES `attributes` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `category_attribute_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_brand_id_foreign` FOREIGN KEY (`brand_id`) REFERENCES `brands` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `products_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `products_tax_id_foreign` FOREIGN KEY (`tax_id`) REFERENCES `taxes` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `product_attributes`
--
ALTER TABLE `product_attributes`
  ADD CONSTRAINT `product_attributes_attribute_value_id_foreign` FOREIGN KEY (`attribute_value_id`) REFERENCES `attribute_values` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `product_attributes_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `product_attributes_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `product_attrs`
--
ALTER TABLE `product_attrs`
  ADD CONSTRAINT `product_attrs_color_id_foreign` FOREIGN KEY (`color_id`) REFERENCES `colors` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `product_attrs_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `product_attrs_size_id_foreign` FOREIGN KEY (`size_id`) REFERENCES `sizes` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `product_attr_images`
--
ALTER TABLE `product_attr_images`
  ADD CONSTRAINT `product_attr_images_product_attr_id_foreign` FOREIGN KEY (`product_attr_id`) REFERENCES `product_attrs` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `product_attr_images_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `user_roles`
--
ALTER TABLE `user_roles`
  ADD CONSTRAINT `user_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `user_roles_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

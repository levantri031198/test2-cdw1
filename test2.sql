-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1:3306
-- Thời gian đã tạo: Th4 01, 2019 lúc 10:16 AM
-- Phiên bản máy phục vụ: 5.7.23
-- Phiên bản PHP: 7.2.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `test2`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `airplanes`
--

DROP TABLE IF EXISTS `airplanes`;
CREATE TABLE IF NOT EXISTS `airplanes` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `airplane_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `airplanes`
--

INSERT INTO `airplanes` (`id`, `airplane_name`, `created_at`, `updated_at`) VALUES
(1, 'Vietnam Airlines', NULL, NULL),
(2, 'VietJet Air', NULL, NULL),
(3, 'Japan Airlines', NULL, NULL),
(4, 'Bamboo Airways', NULL, NULL),
(5, 'China Airways', NULL, NULL),
(6, 'American Airlines', NULL, NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `airports`
--

DROP TABLE IF EXISTS `airports`;
CREATE TABLE IF NOT EXISTS `airports` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `airport_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `airport_code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `city_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `airports`
--

INSERT INTO `airports` (`id`, `airport_name`, `airport_code`, `city_name`, `created_at`, `updated_at`) VALUES
(1, 'Noi Bai', 'HAN', 'Ha Noi', NULL, NULL),
(2, 'Tan Son Nhat', 'SGN', 'Ho Chi Minh City', NULL, NULL),
(3, 'Tokyo International Airport', 'HND', 'Tokyo', NULL, NULL),
(4, 'Hokaido Airport', 'HKO', 'Hokaido', NULL, NULL),
(5, 'Shanghai International Airport', 'SHI', 'Shanghai', NULL, NULL),
(6, 'Beijing International Airport', 'BEG', 'Beijing', NULL, NULL),
(7, 'Kennendy International Airport', 'KEN', 'New York', NULL, NULL),
(8, 'San Francisco International Airport', 'SAN', 'San Francisco', NULL, NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `booking_list`
--

DROP TABLE IF EXISTS `booking_list`;
CREATE TABLE IF NOT EXISTS `booking_list` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` int(10) UNSIGNED NOT NULL,
  `total_passenger` int(11) NOT NULL DEFAULT '0',
  `total_cost` int(11) NOT NULL DEFAULT '0',
  `payment_method` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `card_number` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name_card` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ccv_code` varchar(5) COLLATE utf8mb4_unicode_ci NOT NULL,
  `flight_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=60 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `booking_list`
--

INSERT INTO `booking_list` (`id`, `user_id`, `total_passenger`, `total_cost`, `payment_method`, `card_number`, `name_card`, `ccv_code`, `flight_id`, `created_at`, `updated_at`) VALUES
(48, 4, 2, 12000000, 'transfer', '111112222233333', 'phucbui', '123', 9, '2019-03-28 19:50:03', '2019-03-28 19:50:03'),
(49, 4, 3, 120000000, 'paypal', '2131232132132121', 'phucbui', '113', 10, '2019-03-28 19:51:49', '2019-03-28 19:51:49'),
(50, 5, 2, 4000000, 'paypal', '1232132131232112', 'tiencao', '113', 11, '2019-03-28 19:54:27', '2019-03-28 19:54:27'),
(52, 5, 2, 4000000, 'paypal', '113344241241241', 'tiencao', '331', 11, '2019-03-28 20:00:59', '2019-03-28 20:00:59'),
(53, 6, 2, 12000000, 'credit_card', '2131312321321312', 'letri', '111', 13, '2019-03-28 20:05:30', '2019-03-28 20:05:30'),
(55, 6, 2, 60000000, 'transfer', '21312321323213', 'letri', '113', 18, '2019-03-28 20:09:07', '2019-03-28 20:09:07'),
(57, 7, 5, 15000000, 'transfer', '2222222222124', 'duytran', '414', 15, '2019-03-28 20:12:51', '2019-03-28 20:12:51'),
(58, 7, 3, 90000000, 'credit_card', '1232333333333', 'trile', '132', 16, '2019-03-28 20:14:03', '2019-03-28 20:14:03'),
(59, 8, 1, 6000000, 'credit_card', '23231232131213', 'thuanpham', '133', 9, '2019-03-28 20:15:42', '2019-03-28 20:15:42');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `countries`
--

DROP TABLE IF EXISTS `countries`;
CREATE TABLE IF NOT EXISTS `countries` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `country_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `countries`
--

INSERT INTO `countries` (`id`, `country_name`, `created_at`, `updated_at`) VALUES
(1, 'Viet Nam', NULL, NULL),
(2, 'Japan', NULL, NULL),
(3, 'China', NULL, NULL),
(4, 'America', NULL, NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `flights`
--

DROP TABLE IF EXISTS `flights`;
CREATE TABLE IF NOT EXISTS `flights` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `flight_class_id` int(10) UNSIGNED NOT NULL,
  `flight_type` int(10) UNSIGNED NOT NULL,
  `flight_code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `flight_airplane_id` int(10) UNSIGNED NOT NULL,
  `flight_total_passenger` int(11) NOT NULL DEFAULT '0',
  `flight_cost` int(11) NOT NULL DEFAULT '0',
  `flight_airport_from_id` int(10) UNSIGNED NOT NULL,
  `flight_airport_to_id` int(10) UNSIGNED NOT NULL,
  `flight_departure_date` date DEFAULT NULL,
  `flight_return_date` date DEFAULT NULL,
  `flight_departure_time` datetime NOT NULL,
  `flight_arrival_time` datetime NOT NULL,
  `duration` time DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `flights`
--

INSERT INTO `flights` (`id`, `flight_class_id`, `flight_type`, `flight_code`, `flight_airplane_id`, `flight_total_passenger`, `flight_cost`, `flight_airport_from_id`, `flight_airport_to_id`, `flight_departure_date`, `flight_return_date`, `flight_departure_time`, `flight_arrival_time`, `duration`, `created_at`, `updated_at`) VALUES
(9, 1, 1, 'FC001', 1, 0, 6000000, 1, 2, '2019-03-30', '2019-03-30', '2019-03-30 01:00:00', '2019-03-30 03:00:00', '02:00:00', '2019-03-28 19:21:36', '2019-03-28 19:21:36'),
(10, 1, 1, 'FC002', 1, 0, 20000000, 2, 3, '2019-04-01', '2019-04-04', '2019-04-01 03:30:00', '2019-04-01 14:15:00', '10:45:00', '2019-03-28 19:23:15', '2019-03-28 19:23:15'),
(11, 2, 1, 'FC003', 3, 0, 2000000, 3, 4, '2019-04-01', '2019-04-04', '2019-04-01 06:00:00', '2019-04-01 07:00:00', '01:00:00', '2019-03-28 19:24:43', '2019-03-28 19:24:43'),
(12, 2, 2, 'FC004', 3, 0, 20000000, 4, 5, '2019-04-01', '2019-04-08', '2019-04-01 13:00:00', '2019-04-01 20:35:00', '07:35:00', '2019-03-28 19:26:45', '2019-03-28 19:26:45'),
(13, 1, 2, 'FC005', 5, 0, 6000000, 5, 6, '2019-04-01', '2019-04-03', '2019-04-02 06:30:00', '2019-04-02 10:30:00', '04:00:00', '2019-03-28 19:28:21', '2019-03-28 19:28:21'),
(14, 3, 2, 'FC006', 5, 0, 30000000, 6, 7, '2019-04-01', '2019-05-01', '2019-04-01 17:30:00', '2019-04-03 06:30:00', '13:00:00', '2019-03-28 19:30:08', '2019-03-28 19:30:08'),
(15, 3, 1, 'FC007', 6, 0, 3000000, 7, 8, '2019-04-05', '2019-04-08', '2019-04-05 10:35:00', '2019-04-05 12:30:00', '01:55:00', '2019-03-28 19:32:01', '2019-03-28 19:32:01'),
(16, 2, 1, 'FC008', 1, 0, 30000000, 2, 7, '2019-04-04', NULL, '2019-04-04 17:30:00', '2019-04-07 04:10:00', '10:40:00', '2019-03-28 19:35:01', '2019-03-28 19:35:01'),
(17, 1, 2, 'FC009', 6, 0, 30000000, 7, 2, '2019-04-06', '2019-06-10', '2019-04-06 16:00:00', '2019-04-08 08:00:00', '16:00:00', '2019-03-28 19:36:28', '2019-03-28 19:36:28'),
(18, 3, 2, 'FC010', 4, 0, 30000000, 7, 4, '2019-04-19', '2019-04-25', '2019-04-19 09:30:00', '2019-04-20 22:55:00', '13:25:00', '2019-03-28 19:37:49', '2019-03-28 19:37:49');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `flight_classes`
--

DROP TABLE IF EXISTS `flight_classes`;
CREATE TABLE IF NOT EXISTS `flight_classes` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `flight_class_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `flight_classes`
--

INSERT INTO `flight_classes` (`id`, `flight_class_name`, `created_at`, `updated_at`) VALUES
(1, 'Economy', NULL, NULL),
(2, 'Business', NULL, NULL),
(3, 'Premium Economy', NULL, NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `migrations`
--

DROP TABLE IF EXISTS `migrations`;
CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_03_06_024258_create_flights_table', 1),
(4, '2019_03_06_032825_create_flight_classes_table', 1),
(5, '2019_03_06_041007_create_airplanes_table', 1),
(6, '2019_03_06_041051_create_airports_table', 1),
(7, '2019_03_12_032612_create_countries_table', 1),
(8, '2019_03_22_122123_create_passenger_table', 2),
(9, '2019_03_22_124410_create_booking_list_table', 2),
(10, '2019_03_22_125557_create_booking_list_table', 3),
(11, '2019_03_22_150146_create_passenger_table', 4),
(12, '2019_03_22_150301_create_booking_list_table', 4);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `passenger`
--

DROP TABLE IF EXISTS `passenger`;
CREATE TABLE IF NOT EXISTS `passenger` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `pas_first_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `pas_last_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `flight_id` int(11) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=71 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `passenger`
--

INSERT INTO `passenger` (`id`, `title`, `pas_first_name`, `pas_last_name`, `flight_id`, `user_id`, `created_at`, `updated_at`) VALUES
(47, 'mr', 'Phuc', 'Bui', 9, 4, '2019-03-28 19:50:03', '2019-03-28 19:50:03'),
(48, 'mrs', 'Tien', 'Cao', 9, 4, '2019-03-28 19:50:03', '2019-03-28 19:50:03'),
(49, 'mr', 'Phuc', 'Bui', 10, 4, '2019-03-28 19:51:48', '2019-03-28 19:51:48'),
(50, 'mrs', 'Tien', 'Cao', 10, 4, '2019-03-28 19:51:49', '2019-03-28 19:51:49'),
(51, 'mrs', 'Duy', 'Tran', 10, 4, '2019-03-28 19:51:49', '2019-03-28 19:51:49'),
(52, 'mr', 'Tien', 'Cao', 11, 5, '2019-03-28 19:54:26', '2019-03-28 19:54:26'),
(53, 'mrs', 'Duy', 'Tran', 11, 5, '2019-03-28 19:54:27', '2019-03-28 19:54:27'),
(56, 'mr', 'Tien', 'Chinh', 11, 5, '2019-03-28 20:00:58', '2019-03-28 20:00:58'),
(57, 'mr', 'Tien', 'Tran', 11, 5, '2019-03-28 20:00:59', '2019-03-28 20:00:59'),
(58, 'mrs', 'Tri', 'Hoang', 13, 6, '2019-03-28 20:05:29', '2019-03-28 20:05:29'),
(59, 'mrs', 'Tien', 'Tran', 13, 6, '2019-03-28 20:05:30', '2019-03-28 20:05:30'),
(67, 'mr', 'Phuc', 'Chinh', 16, 7, '2019-03-28 20:14:03', '2019-03-28 20:14:03'),
(68, 'mr', 'Duy', 'Cao', 16, 7, '2019-03-28 20:14:03', '2019-03-28 20:14:03'),
(69, 'mr', 'Duy', 'Tran', 16, 7, '2019-03-28 20:14:03', '2019-03-28 20:14:03'),
(70, 'mr', 'Thuan', 'Pham', 9, 8, '2019-03-28 20:15:41', '2019-03-28 20:15:41');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `password_resets`
--

DROP TABLE IF EXISTS `password_resets`;
CREATE TABLE IF NOT EXISTS `password_resets` (
  `email` varchar(55) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(55) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `dob` date DEFAULT NULL,
  `gender` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `isAdmin` tinyint(1) DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `password`, `dob`, `gender`, `phone`, `address`, `isAdmin`, `remember_token`, `created_at`, `updated_at`) VALUES
(4, 'Bùi Văn Phúc', 'phucbui@gmail.com', '$2y$10$t1OqxbW1k.VsErB8UyrFvujpggseK0LrtDVr908Rcz8lnAfW5m/VO', NULL, NULL, '1111111111', NULL, NULL, 'NgH9rVQYFeqRvlfZaxk1KtOfpCRONVxZDTjk3iqvVVDMMg55Zi9N5bA5B6LI', '2019-03-28 19:13:06', '2019-03-28 19:13:06'),
(5, 'Cao Lê Viết Tiến', 'tiencao@gmail.com', '$2y$10$Gc6bHYg1llQhzeSR40pYmuNr.bpY2yUeB4E7VwY3weeVK6G85e7vu', NULL, NULL, '2222222222', NULL, NULL, 'It1ZZyyy0SX7D8CSth0QDdhlontyfZyTLmTv3rhNeJj4U1ysEMjKf6xnx3Mi', '2019-03-28 19:13:44', '2019-03-28 19:13:44'),
(6, 'Lê Văn Trí', 'trile@gmail.com', '$2y$10$0agFJg86Y84WitE.t4Y54ukN8pIAnXdxXqDNDl90OqzfmErVnK8sS', NULL, NULL, '3333333333', NULL, NULL, 'k7OzZiEx20FCDNp1C0pTIWwGKZkVBpuiIbU1r4Sd3weuQmhSz6KWcO21T5Oa', '2019-03-28 19:14:21', '2019-03-28 19:14:21'),
(7, 'Trần Thanh Duy', 'duytran@gmail.com', '$2y$10$4on9QV1lDRfuiQ/ZU.B1qOZKSBTZdIO3PqtZfOUg8gJK9dpnBRyq2', NULL, NULL, '4444444444', NULL, NULL, 'NO4cfPvppq2BlITkJCCFaaVJluBuQjfEmAGsY9E2ImwXaWZAIZzBcM1N9drL', '2019-03-28 19:14:51', '2019-03-28 19:14:51'),
(8, 'Phạm Minh Thuận', 'thuanpham@gmail.com', '$2y$10$3pmaf71hiCZz1ljk0.kw5.XiQCSSu/OZplVHTdxb1BgFqwQhKtdiy', NULL, NULL, '5555555555', NULL, NULL, 'NTmrUQhs7vQj2popjB8kqiLX9F03jc3TRBa11GFy3iUJ2z1pvhTA3XU2KjUV', '2019-03-28 19:15:18', '2019-03-28 19:15:18'),
(9, 'ADMIN', 'admin@gmail.com', '$2y$10$k6V.lctJrtvVGZhW.RTbIeBLtSxZodNxRwwtQFaLDeGAqHTHtC3BS', NULL, NULL, '5555555554', NULL, 1, 'ikqxubec7fm1k37ZpOzOssYV7qZCAaR1ALJDTciCWIGuEsGDpm2kytY5bGDd', '2019-03-28 19:17:17', '2019-03-28 19:17:17');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

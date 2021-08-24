-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Gép: 127.0.0.1
-- Létrehozás ideje: 2021. Aug 24. 14:43
-- Kiszolgáló verziója: 10.4.19-MariaDB
-- PHP verzió: 8.0.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Adatbázis: `ws2017_day2`
--

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- A tábla adatainak kiíratása `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2021_08_24_081838_create_places_table', 1),
(5, '2021_08_24_081850_create_schedules_table', 1);

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `places`
--

CREATE TABLE `places` (
  `id` int(11) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `latitude` float DEFAULT NULL,
  `longitude` float DEFAULT NULL,
  `x` int(11) DEFAULT NULL,
  `y` int(11) DEFAULT NULL,
  `image_path` varchar(50) DEFAULT NULL,
  `description` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- A tábla adatainak kiíratása `places`
--

INSERT INTO `places` (`id`, `name`, `latitude`, `longitude`, `x`, `y`, `image_path`, `description`) VALUES
(1, 'Saadiyat Public Beach', 24.547, 54.4359, 570, 169, 'saadiyat-public-beach.jpg', 'A meditative yoga session is what you need to find your inner calm with stroll along the white sandy shorelines Saadiyat Public Beach offers you a perfect setting for an everyday retreat'),
(2, 'Manarat Al Saadiyat', 24.5338, 54.4189, 517, 212, 'manarat-al-saadiyat.jpg', 'Manarat Al Saadiyat meanings the place of enlightenment is a purpose-built art and culture centre with multiple gallery spaces'),
(3, 'Ferrari World', 24.4832, 54.6074, 1103, 378, 'ferrari-world.jpg', 'Ferrari World Abu Dhabi was created in tribute to Ferrari passion heritage excellence innovation and performance'),
(4, 'Etihad Plaza', 24.4433, 54.6085, 1106, 509, 'etihad-plaza.jpg', 'Etihad Plaza is a development of 789 residential units in Khalifa City featuring comprehensive lifestyle amenities including 4973 square metres of retail and 4'),
(5, 'Abu Dhabi International Airport', 24.4419, 54.6501, 1236, 513, 'abu-dhabi-international-airport.jpg', 'The construction of the Midfield Terminal Complex (MTC) and overall expansion of Abu Dhabi International Airport are vital to enable the diversification of the Emirate economy'),
(6, 'Zayed University', 24.3937, 54.5843, 1031, 671, 'zayed-university.jpg', 'Zayed University is a national and regional leader in educational innovation. Founded in 1998 and proudly bearing the name of the Founder of the Nation'),
(7, 'Sheikh Zayed Grand Mosque', 24.4125, 54.4751, 692, 609, 'sheikh-zayed-grand-mosque.jpg', 'Sheikh Zayed Grand Mosque is located in Abu Dhabi  the capital city of the United Arab Emirates  and is considered to be the key site for worship in the country'),
(8, 'Mangrove National Park', 24.4561, 54.4178, 514, 467, 'mangrove-national-park.jpg', 'Most often found growing in the sea waters of tropical and sub-tropical coastal areas. This hardy tree acts as a natural windbreak.'),
(9, 'Al Ghaf Park', 24.4354, 54.4103, 491, 534, 'al-ghaf-park.jpg', 'The low-rise residential towers which feature a range of studio one two and three-bedroom apartments are the ideal location for professionals and small families'),
(10, 'Umm Al Emarat Park', 24.4531, 54.3808, 399, 477, 'umm-al-emarat-park.jpg', 'Umm Al Emarat Park was first opened to visitors in 1982. It is one of the oldest and largest urban parks in Abu Dhabi centrally located on 15th Street between Airport Road and Karamah Street'),
(11, 'Electra Park', 24.4966, 54.3764, 386, 334, 'electra-park.jpg', 'Abu Dhabi has more than 2000 well-maintained parks and gardens. Electra park is one of the main parks in Abudhabi situated near by corniche'),
(12, 'Qasr Al Hosn', 24.4822, 54.3547, 318, 381, 'qasr-al-hosn.jpg', 'It remained the emir`s palace and seat of government until 1966.'),
(13, 'Emirates Palace', 24.4616, 54.3174, 202, 449, 'emirates-palace.jpg', 'The Emirates Palace is a luxury hotel in Abu Dhabi. United Arab Emirates operated by Kempinski and opened in February 2005.'),
(14, 'Lorem ipsum2', 24.3883, 52.3882, 5791, 688, 'asd', 'Lorem ipsum dolor sit amet de param static.');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `schedules`
--

CREATE TABLE `schedules` (
  `id` int(11) NOT NULL,
  `type` enum('TRAIN','BUS') DEFAULT 'TRAIN',
  `line` int(11) DEFAULT NULL,
  `from_place_id` int(11) NOT NULL,
  `to_place_id` int(11) NOT NULL,
  `departure_time` time DEFAULT NULL,
  `arrival_time` time DEFAULT NULL,
  `distance` int(11) DEFAULT NULL,
  `speed` int(11) DEFAULT NULL,
  `status` enum('AVAILABLE','UNAVAILABLE') DEFAULT 'AVAILABLE'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- A tábla adatainak kiíratása `schedules`
--

INSERT INTO `schedules` (`id`, `type`, `line`, `from_place_id`, `to_place_id`, `departure_time`, `arrival_time`, `distance`, `speed`, `status`) VALUES
(1, 'TRAIN', 1, 2, 3, '08:00:00', '08:16:00', 19900, 75, 'AVAILABLE'),
(2, 'TRAIN', 1, 3, 5, '08:18:00', '08:24:00', 6310, 75, 'AVAILABLE'),
(3, 'TRAIN', 1, 5, 6, '08:26:00', '08:33:00', 8570, 75, 'AVAILABLE'),
(4, 'TRAIN', 1, 6, 7, '08:35:00', '08:45:00', 11300, 75, 'AVAILABLE'),
(5, 'TRAIN', 1, 7, 9, '08:47:00', '08:53:00', 7050, 75, 'AVAILABLE'),
(6, 'TRAIN', 1, 9, 10, '08:55:00', '08:58:00', 3580, 75, 'AVAILABLE'),
(7, 'TRAIN', 1, 10, 11, '09:00:00', '09:04:00', 4860, 75, 'AVAILABLE'),
(8, 'TRAIN', 1, 11, 2, '09:06:00', '09:11:00', 5970, 75, 'AVAILABLE'),
(9, 'TRAIN', 2, 2, 11, '08:45:00', '08:50:00', 5970, 75, 'AVAILABLE'),
(10, 'TRAIN', 2, 11, 10, '08:52:00', '08:56:00', 4860, 75, 'AVAILABLE'),
(11, 'TRAIN', 2, 10, 9, '08:58:00', '09:01:00', 3580, 75, 'AVAILABLE'),
(12, 'TRAIN', 2, 9, 7, '09:03:00', '09:09:00', 7050, 75, 'AVAILABLE'),
(13, 'TRAIN', 2, 7, 6, '09:11:00', '09:21:00', 11300, 75, 'AVAILABLE'),
(14, 'TRAIN', 2, 6, 5, '09:23:00', '09:30:00', 8570, 75, 'AVAILABLE'),
(15, 'TRAIN', 2, 5, 3, '09:32:00', '09:38:00', 6310, 75, 'AVAILABLE'),
(16, 'TRAIN', 2, 3, 2, '09:40:00', '09:56:00', 19900, 75, 'AVAILABLE'),
(17, 'TRAIN', 1, 2, 3, '09:30:00', '09:46:00', 19900, 75, 'AVAILABLE'),
(18, 'TRAIN', 1, 3, 5, '09:48:00', '09:54:00', 6310, 75, 'AVAILABLE'),
(19, 'TRAIN', 1, 5, 6, '09:56:00', '10:03:00', 8570, 75, 'AVAILABLE'),
(20, 'TRAIN', 1, 6, 7, '10:05:00', '10:15:00', 11300, 75, 'AVAILABLE'),
(21, 'TRAIN', 1, 7, 9, '10:17:00', '10:23:00', 7050, 75, 'AVAILABLE'),
(22, 'TRAIN', 1, 9, 10, '10:25:00', '10:28:00', 3580, 75, 'AVAILABLE'),
(23, 'TRAIN', 1, 10, 11, '10:30:00', '10:34:00', 4860, 75, 'AVAILABLE'),
(24, 'TRAIN', 1, 11, 2, '10:36:00', '10:41:00', 5970, 75, 'AVAILABLE'),
(25, 'TRAIN', 2, 2, 11, '10:15:00', '10:20:00', 5970, 75, 'AVAILABLE'),
(26, 'TRAIN', 2, 11, 10, '10:22:00', '10:26:00', 4860, 75, 'AVAILABLE'),
(27, 'TRAIN', 2, 10, 9, '10:28:00', '10:31:00', 3580, 75, 'AVAILABLE'),
(28, 'TRAIN', 2, 9, 7, '10:33:00', '10:39:00', 7050, 75, 'AVAILABLE'),
(29, 'TRAIN', 2, 7, 6, '10:41:00', '10:51:00', 11300, 75, 'AVAILABLE'),
(30, 'TRAIN', 2, 6, 5, '10:53:00', '11:00:00', 8570, 75, 'AVAILABLE'),
(31, 'TRAIN', 2, 5, 3, '11:02:00', '11:08:00', 6310, 75, 'AVAILABLE'),
(32, 'TRAIN', 2, 3, 2, '11:10:00', '11:26:00', 19900, 75, 'AVAILABLE'),
(33, 'TRAIN', 1, 2, 3, '11:00:00', '11:16:00', 19900, 75, 'AVAILABLE'),
(34, 'TRAIN', 1, 3, 5, '11:18:00', '11:24:00', 6310, 75, 'AVAILABLE'),
(35, 'TRAIN', 1, 5, 6, '11:26:00', '11:33:00', 8570, 75, 'AVAILABLE'),
(36, 'TRAIN', 1, 6, 7, '11:35:00', '11:45:00', 11300, 75, 'AVAILABLE'),
(37, 'TRAIN', 1, 7, 9, '11:47:00', '11:53:00', 7050, 75, 'AVAILABLE'),
(38, 'TRAIN', 1, 9, 10, '11:55:00', '11:58:00', 3580, 75, 'AVAILABLE'),
(39, 'TRAIN', 1, 10, 11, '12:00:00', '12:04:00', 4860, 75, 'AVAILABLE'),
(40, 'TRAIN', 1, 11, 2, '12:06:00', '12:11:00', 5970, 75, 'AVAILABLE'),
(41, 'TRAIN', 2, 2, 11, '11:45:00', '11:50:00', 5970, 75, 'AVAILABLE'),
(42, 'TRAIN', 2, 11, 10, '11:52:00', '11:56:00', 4860, 75, 'AVAILABLE'),
(43, 'TRAIN', 2, 10, 9, '11:58:00', '12:01:00', 3580, 75, 'AVAILABLE'),
(44, 'TRAIN', 2, 9, 7, '12:03:00', '12:09:00', 7050, 75, 'AVAILABLE'),
(45, 'TRAIN', 2, 7, 6, '12:11:00', '12:21:00', 11300, 75, 'AVAILABLE'),
(46, 'TRAIN', 2, 6, 5, '12:23:00', '12:30:00', 8570, 75, 'AVAILABLE'),
(47, 'TRAIN', 2, 5, 3, '12:32:00', '12:38:00', 6310, 75, 'AVAILABLE'),
(48, 'TRAIN', 2, 3, 2, '12:40:00', '12:56:00', 19900, 75, 'AVAILABLE'),
(49, 'TRAIN', 1, 2, 3, '12:30:00', '12:46:00', 19900, 75, 'AVAILABLE'),
(50, 'TRAIN', 1, 3, 5, '12:48:00', '12:54:00', 6310, 75, 'AVAILABLE'),
(51, 'TRAIN', 1, 5, 6, '12:56:00', '13:03:00', 8570, 75, 'AVAILABLE'),
(52, 'TRAIN', 1, 6, 7, '13:05:00', '13:15:00', 11300, 75, 'AVAILABLE'),
(53, 'TRAIN', 1, 7, 9, '13:17:00', '13:23:00', 7050, 75, 'AVAILABLE'),
(54, 'TRAIN', 1, 9, 10, '13:25:00', '13:28:00', 3580, 75, 'AVAILABLE'),
(55, 'TRAIN', 1, 10, 11, '13:30:00', '13:34:00', 4860, 75, 'AVAILABLE'),
(56, 'TRAIN', 1, 11, 2, '13:36:00', '13:41:00', 5970, 75, 'AVAILABLE'),
(57, 'TRAIN', 2, 2, 11, '13:15:00', '13:20:00', 5970, 75, 'AVAILABLE'),
(58, 'TRAIN', 2, 11, 10, '13:22:00', '13:26:00', 4860, 75, 'AVAILABLE'),
(59, 'TRAIN', 2, 10, 9, '13:28:00', '13:31:00', 3580, 75, 'AVAILABLE'),
(60, 'TRAIN', 2, 9, 7, '13:33:00', '13:39:00', 7050, 75, 'AVAILABLE'),
(61, 'TRAIN', 2, 7, 6, '13:41:00', '13:51:00', 11300, 75, 'AVAILABLE'),
(62, 'TRAIN', 2, 6, 5, '13:53:00', '14:00:00', 8570, 75, 'AVAILABLE'),
(63, 'TRAIN', 2, 5, 3, '14:02:00', '14:08:00', 6310, 75, 'AVAILABLE'),
(64, 'TRAIN', 2, 3, 2, '14:10:00', '14:26:00', 19900, 75, 'AVAILABLE'),
(65, 'TRAIN', 1, 2, 3, '14:00:00', '14:16:00', 19900, 75, 'AVAILABLE'),
(66, 'TRAIN', 1, 3, 5, '14:18:00', '14:24:00', 6310, 75, 'AVAILABLE'),
(67, 'TRAIN', 1, 5, 6, '14:26:00', '14:33:00', 8570, 75, 'AVAILABLE'),
(68, 'TRAIN', 1, 6, 7, '14:35:00', '14:45:00', 11300, 75, 'AVAILABLE'),
(69, 'TRAIN', 1, 7, 9, '14:47:00', '14:53:00', 7050, 75, 'AVAILABLE'),
(70, 'TRAIN', 1, 9, 10, '14:55:00', '14:58:00', 3580, 75, 'AVAILABLE'),
(71, 'TRAIN', 1, 10, 11, '15:00:00', '15:04:00', 4860, 75, 'AVAILABLE'),
(72, 'TRAIN', 1, 11, 2, '15:06:00', '15:11:00', 5970, 75, 'AVAILABLE'),
(73, 'TRAIN', 2, 2, 11, '14:45:00', '14:50:00', 5970, 75, 'AVAILABLE'),
(74, 'TRAIN', 2, 11, 10, '14:52:00', '14:56:00', 4860, 75, 'AVAILABLE'),
(75, 'TRAIN', 2, 10, 9, '14:58:00', '15:01:00', 3580, 75, 'AVAILABLE'),
(76, 'TRAIN', 2, 9, 7, '15:03:00', '15:09:00', 7050, 75, 'AVAILABLE'),
(77, 'TRAIN', 2, 7, 6, '15:11:00', '15:21:00', 11300, 75, 'AVAILABLE'),
(78, 'TRAIN', 2, 6, 5, '15:23:00', '15:30:00', 8570, 75, 'AVAILABLE'),
(79, 'TRAIN', 2, 5, 3, '15:32:00', '15:38:00', 6310, 75, 'AVAILABLE'),
(80, 'TRAIN', 2, 3, 2, '15:40:00', '15:56:00', 19900, 75, 'AVAILABLE'),
(81, 'TRAIN', 1, 2, 3, '15:30:00', '15:46:00', 19900, 75, 'AVAILABLE'),
(82, 'TRAIN', 1, 3, 5, '15:48:00', '15:54:00', 6310, 75, 'AVAILABLE'),
(83, 'TRAIN', 1, 5, 6, '15:56:00', '16:03:00', 8570, 75, 'AVAILABLE'),
(84, 'TRAIN', 1, 6, 7, '16:05:00', '16:15:00', 11300, 75, 'AVAILABLE'),
(85, 'TRAIN', 1, 7, 9, '16:17:00', '16:23:00', 7050, 75, 'AVAILABLE'),
(86, 'TRAIN', 1, 9, 10, '16:25:00', '16:28:00', 3580, 75, 'AVAILABLE'),
(87, 'TRAIN', 1, 10, 11, '16:30:00', '16:34:00', 4860, 75, 'AVAILABLE'),
(88, 'TRAIN', 1, 11, 2, '16:36:00', '16:41:00', 5970, 75, 'AVAILABLE'),
(89, 'TRAIN', 2, 2, 11, '16:15:00', '16:20:00', 5970, 75, 'AVAILABLE'),
(90, 'TRAIN', 2, 11, 10, '16:22:00', '16:26:00', 4860, 75, 'AVAILABLE'),
(91, 'TRAIN', 2, 10, 9, '16:28:00', '16:31:00', 3580, 75, 'AVAILABLE'),
(92, 'TRAIN', 2, 9, 7, '16:33:00', '16:39:00', 7050, 75, 'AVAILABLE'),
(93, 'TRAIN', 2, 7, 6, '16:41:00', '16:51:00', 11300, 75, 'AVAILABLE'),
(94, 'TRAIN', 2, 6, 5, '16:53:00', '17:00:00', 8570, 75, 'AVAILABLE'),
(95, 'TRAIN', 2, 5, 3, '17:02:00', '17:08:00', 6310, 75, 'AVAILABLE'),
(96, 'TRAIN', 2, 3, 2, '17:10:00', '17:26:00', 19900, 75, 'AVAILABLE'),
(97, 'TRAIN', 1, 2, 3, '17:00:00', '17:16:00', 19900, 75, 'AVAILABLE'),
(98, 'TRAIN', 1, 3, 5, '17:18:00', '17:24:00', 6310, 75, 'AVAILABLE'),
(99, 'TRAIN', 1, 5, 6, '17:26:00', '17:33:00', 8570, 75, 'AVAILABLE'),
(100, 'TRAIN', 1, 6, 7, '17:35:00', '17:45:00', 11300, 75, 'AVAILABLE'),
(101, 'TRAIN', 1, 7, 9, '17:47:00', '17:53:00', 7050, 75, 'AVAILABLE'),
(102, 'TRAIN', 1, 9, 10, '17:55:00', '17:58:00', 3580, 75, 'AVAILABLE'),
(103, 'TRAIN', 1, 10, 11, '18:00:00', '18:04:00', 4860, 75, 'AVAILABLE'),
(104, 'TRAIN', 1, 11, 2, '18:06:00', '18:11:00', 5970, 75, 'AVAILABLE'),
(105, 'TRAIN', 2, 2, 11, '17:45:00', '17:50:00', 5970, 75, 'AVAILABLE'),
(106, 'TRAIN', 2, 11, 10, '17:52:00', '17:56:00', 4860, 75, 'AVAILABLE'),
(107, 'TRAIN', 2, 10, 9, '17:58:00', '18:01:00', 3580, 75, 'AVAILABLE'),
(108, 'TRAIN', 2, 9, 7, '18:03:00', '18:09:00', 7050, 75, 'AVAILABLE'),
(109, 'TRAIN', 2, 7, 6, '18:11:00', '18:21:00', 11300, 75, 'AVAILABLE'),
(110, 'TRAIN', 2, 6, 5, '18:23:00', '18:30:00', 8570, 75, 'AVAILABLE'),
(111, 'TRAIN', 2, 5, 3, '18:32:00', '18:38:00', 6310, 75, 'AVAILABLE'),
(112, 'TRAIN', 2, 3, 2, '18:40:00', '18:56:00', 19900, 75, 'AVAILABLE'),
(113, 'TRAIN', 1, 2, 3, '18:30:00', '18:46:00', 19900, 75, 'AVAILABLE'),
(114, 'TRAIN', 1, 3, 5, '18:48:00', '18:54:00', 6310, 75, 'AVAILABLE'),
(115, 'TRAIN', 1, 5, 6, '18:56:00', '19:03:00', 8570, 75, 'AVAILABLE'),
(116, 'TRAIN', 1, 6, 7, '19:05:00', '19:15:00', 11300, 75, 'AVAILABLE'),
(117, 'TRAIN', 1, 7, 9, '19:17:00', '19:23:00', 7050, 75, 'AVAILABLE'),
(118, 'TRAIN', 1, 9, 10, '19:25:00', '19:28:00', 3580, 75, 'AVAILABLE'),
(119, 'TRAIN', 1, 10, 11, '19:30:00', '19:34:00', 4860, 75, 'AVAILABLE'),
(120, 'TRAIN', 1, 11, 2, '19:36:00', '19:41:00', 5970, 75, 'AVAILABLE'),
(121, 'TRAIN', 2, 2, 11, '19:15:00', '19:20:00', 5970, 75, 'AVAILABLE'),
(122, 'TRAIN', 2, 11, 10, '19:22:00', '19:26:00', 4860, 75, 'AVAILABLE'),
(123, 'TRAIN', 2, 10, 9, '19:28:00', '19:31:00', 3580, 75, 'AVAILABLE'),
(124, 'TRAIN', 2, 9, 7, '19:33:00', '19:39:00', 7050, 75, 'AVAILABLE'),
(125, 'TRAIN', 2, 7, 6, '19:41:00', '19:51:00', 11300, 75, 'AVAILABLE'),
(126, 'TRAIN', 2, 6, 5, '19:53:00', '20:00:00', 8570, 75, 'AVAILABLE'),
(127, 'TRAIN', 2, 5, 3, '20:02:00', '20:08:00', 6310, 75, 'AVAILABLE'),
(128, 'TRAIN', 2, 3, 2, '20:10:00', '20:26:00', 19900, 75, 'AVAILABLE'),
(129, 'TRAIN', 1, 2, 3, '20:00:00', '20:16:00', 19900, 75, 'AVAILABLE'),
(130, 'TRAIN', 1, 3, 5, '20:18:00', '20:24:00', 6310, 75, 'AVAILABLE'),
(131, 'TRAIN', 1, 5, 6, '20:26:00', '20:33:00', 8570, 75, 'AVAILABLE'),
(132, 'TRAIN', 1, 6, 7, '20:35:00', '20:45:00', 11300, 75, 'AVAILABLE'),
(133, 'TRAIN', 1, 7, 9, '20:47:00', '20:53:00', 7050, 75, 'AVAILABLE'),
(134, 'TRAIN', 1, 9, 10, '20:55:00', '20:58:00', 3580, 75, 'AVAILABLE'),
(135, 'TRAIN', 1, 10, 11, '21:00:00', '21:04:00', 4860, 75, 'AVAILABLE'),
(136, 'TRAIN', 1, 11, 2, '21:06:00', '21:11:00', 5970, 75, 'AVAILABLE'),
(137, 'BUS', 3, 7, 8, '08:00:00', '08:11:00', 7570, 45, 'AVAILABLE'),
(138, 'BUS', 3, 8, 10, '08:13:00', '08:19:00', 3760, 45, 'AVAILABLE'),
(139, 'BUS', 3, 10, 12, '08:21:00', '08:27:00', 4190, 45, 'AVAILABLE'),
(140, 'BUS', 4, 12, 10, '08:30:00', '08:36:00', 4190, 45, 'AVAILABLE'),
(141, 'BUS', 4, 10, 8, '08:38:00', '08:44:00', 3760, 45, 'AVAILABLE'),
(142, 'BUS', 4, 8, 7, '08:46:00', '08:57:00', 7570, 45, 'AVAILABLE'),
(143, 'BUS', 3, 7, 8, '10:00:00', '10:11:00', 7570, 45, 'AVAILABLE'),
(144, 'BUS', 3, 8, 10, '10:13:00', '10:19:00', 3760, 45, 'AVAILABLE'),
(145, 'BUS', 3, 10, 12, '10:21:00', '10:27:00', 4190, 45, 'AVAILABLE'),
(146, 'BUS', 4, 12, 10, '10:30:00', '10:36:00', 4190, 45, 'AVAILABLE'),
(147, 'BUS', 4, 10, 8, '10:38:00', '10:44:00', 3760, 45, 'AVAILABLE'),
(148, 'BUS', 4, 8, 7, '10:46:00', '10:57:00', 7570, 45, 'AVAILABLE'),
(149, 'BUS', 3, 7, 8, '12:00:00', '12:11:00', 7570, 45, 'AVAILABLE'),
(150, 'BUS', 3, 8, 10, '12:13:00', '12:19:00', 3760, 45, 'AVAILABLE'),
(151, 'BUS', 3, 10, 12, '12:21:00', '12:27:00', 4190, 45, 'AVAILABLE'),
(152, 'BUS', 4, 12, 10, '12:30:00', '12:36:00', 4190, 45, 'AVAILABLE'),
(153, 'BUS', 4, 10, 8, '12:38:00', '12:44:00', 3760, 45, 'AVAILABLE'),
(154, 'BUS', 4, 8, 7, '12:46:00', '12:57:00', 7570, 45, 'AVAILABLE'),
(155, 'BUS', 3, 7, 8, '14:00:00', '14:11:00', 7570, 45, 'AVAILABLE'),
(156, 'BUS', 3, 8, 10, '14:13:00', '14:19:00', 3760, 45, 'AVAILABLE'),
(157, 'BUS', 3, 10, 12, '14:21:00', '14:27:00', 4190, 45, 'AVAILABLE'),
(158, 'BUS', 4, 12, 10, '14:30:00', '14:36:00', 4190, 45, 'AVAILABLE'),
(159, 'BUS', 4, 10, 8, '14:38:00', '14:44:00', 3760, 45, 'AVAILABLE'),
(160, 'BUS', 4, 8, 7, '14:46:00', '14:57:00', 7570, 45, 'AVAILABLE'),
(161, 'BUS', 3, 7, 8, '16:00:00', '16:11:00', 7570, 45, 'AVAILABLE'),
(162, 'BUS', 3, 8, 10, '16:13:00', '16:19:00', 3760, 45, 'AVAILABLE'),
(163, 'BUS', 3, 10, 12, '16:21:00', '16:27:00', 4190, 45, 'AVAILABLE'),
(164, 'BUS', 4, 12, 10, '16:30:00', '16:36:00', 4190, 45, 'AVAILABLE'),
(165, 'BUS', 4, 10, 8, '16:38:00', '16:44:00', 3760, 45, 'AVAILABLE'),
(166, 'BUS', 4, 8, 7, '16:46:00', '16:57:00', 7570, 45, 'AVAILABLE'),
(167, 'BUS', 3, 7, 8, '18:00:00', '18:11:00', 7570, 45, 'AVAILABLE'),
(168, 'BUS', 3, 8, 10, '18:13:00', '18:19:00', 3760, 45, 'AVAILABLE'),
(169, 'BUS', 3, 10, 12, '18:21:00', '18:27:00', 4190, 45, 'AVAILABLE'),
(170, 'BUS', 4, 12, 10, '18:30:00', '18:36:00', 4190, 45, 'AVAILABLE'),
(171, 'BUS', 4, 10, 8, '18:38:00', '18:44:00', 3760, 45, 'AVAILABLE'),
(172, 'BUS', 4, 8, 7, '18:46:00', '18:57:00', 7570, 45, 'AVAILABLE'),
(173, 'BUS', 3, 7, 8, '20:00:00', '20:11:00', 7570, 45, 'AVAILABLE'),
(174, 'BUS', 3, 8, 10, '20:13:00', '20:19:00', 3760, 45, 'AVAILABLE'),
(175, 'BUS', 3, 10, 12, '20:21:00', '20:27:00', 4190, 45, 'AVAILABLE'),
(176, 'BUS', 4, 12, 10, '20:30:00', '20:36:00', 4190, 45, 'AVAILABLE'),
(177, 'BUS', 4, 10, 8, '20:38:00', '20:44:00', 3760, 45, 'AVAILABLE'),
(178, 'BUS', 4, 8, 7, '20:46:00', '20:57:00', 7570, 45, 'AVAILABLE'),
(179, 'BUS', 5, 11, 12, '09:00:00', '09:04:00', 2720, 45, 'AVAILABLE'),
(180, 'BUS', 5, 12, 13, '09:06:00', '09:12:00', 4420, 45, 'AVAILABLE'),
(181, 'BUS', 5, 13, 9, '09:14:00', '09:28:00', 9850, 45, 'AVAILABLE'),
(182, 'BUS', 6, 9, 13, '10:00:00', '10:14:00', 9850, 45, 'AVAILABLE'),
(183, 'BUS', 6, 13, 12, '10:16:00', '10:22:00', 4420, 45, 'AVAILABLE'),
(184, 'BUS', 6, 12, 11, '10:24:00', '10:28:00', 2720, 45, 'AVAILABLE'),
(185, 'BUS', 5, 11, 12, '11:00:00', '11:04:00', 2720, 45, 'AVAILABLE'),
(186, 'BUS', 5, 12, 13, '11:06:00', '11:12:00', 4420, 45, 'AVAILABLE'),
(187, 'BUS', 5, 13, 9, '11:14:00', '11:28:00', 9850, 45, 'AVAILABLE'),
(188, 'BUS', 6, 9, 13, '12:00:00', '12:14:00', 9850, 45, 'AVAILABLE'),
(189, 'BUS', 6, 13, 12, '12:16:00', '12:22:00', 4420, 45, 'AVAILABLE'),
(190, 'BUS', 6, 12, 11, '12:24:00', '12:28:00', 2720, 45, 'AVAILABLE'),
(191, 'BUS', 5, 11, 12, '13:00:00', '13:04:00', 2720, 45, 'AVAILABLE'),
(192, 'BUS', 5, 12, 13, '13:06:00', '13:12:00', 4420, 45, 'AVAILABLE'),
(193, 'BUS', 5, 13, 9, '13:14:00', '13:28:00', 9850, 45, 'AVAILABLE'),
(194, 'BUS', 6, 9, 13, '14:00:00', '14:14:00', 9850, 45, 'AVAILABLE'),
(195, 'BUS', 6, 13, 12, '14:16:00', '14:22:00', 4420, 45, 'AVAILABLE'),
(196, 'BUS', 6, 12, 11, '14:24:00', '14:28:00', 2720, 45, 'AVAILABLE'),
(197, 'BUS', 5, 11, 12, '15:00:00', '15:04:00', 2720, 45, 'AVAILABLE'),
(198, 'BUS', 5, 12, 13, '15:06:00', '15:12:00', 4420, 45, 'AVAILABLE'),
(199, 'BUS', 5, 13, 9, '15:14:00', '15:28:00', 9850, 45, 'AVAILABLE'),
(200, 'BUS', 6, 9, 13, '16:00:00', '16:14:00', 9850, 45, 'AVAILABLE'),
(201, 'BUS', 6, 13, 12, '16:16:00', '16:22:00', 4420, 45, 'AVAILABLE'),
(202, 'BUS', 6, 12, 11, '16:24:00', '16:28:00', 2720, 45, 'AVAILABLE'),
(203, 'BUS', 5, 11, 12, '17:00:00', '17:04:00', 2720, 45, 'AVAILABLE'),
(204, 'BUS', 5, 12, 13, '17:06:00', '17:12:00', 4420, 45, 'AVAILABLE'),
(205, 'BUS', 5, 13, 9, '17:14:00', '17:28:00', 9850, 45, 'AVAILABLE'),
(206, 'BUS', 6, 9, 13, '18:00:00', '18:14:00', 9850, 45, 'AVAILABLE'),
(207, 'BUS', 6, 13, 12, '18:16:00', '18:22:00', 4420, 45, 'AVAILABLE'),
(208, 'BUS', 6, 12, 11, '18:24:00', '18:28:00', 2720, 45, 'AVAILABLE'),
(209, 'BUS', 5, 11, 12, '19:00:00', '19:04:00', 2720, 45, 'AVAILABLE'),
(210, 'BUS', 5, 12, 13, '19:06:00', '19:12:00', 4420, 45, 'AVAILABLE'),
(211, 'BUS', 5, 13, 9, '19:14:00', '19:28:00', 9850, 45, 'AVAILABLE'),
(212, 'BUS', 6, 9, 13, '20:00:00', '20:14:00', 9850, 45, 'AVAILABLE'),
(213, 'BUS', 6, 13, 12, '20:16:00', '20:22:00', 4420, 45, 'AVAILABLE'),
(214, 'BUS', 6, 12, 11, '20:24:00', '20:28:00', 2720, 45, 'AVAILABLE'),
(215, 'BUS', 7, 1, 2, '09:00:00', '09:04:00', 2260, 45, 'AVAILABLE'),
(216, 'BUS', 8, 2, 1, '09:00:00', '09:04:00', 2260, 45, 'AVAILABLE'),
(217, 'BUS', 7, 1, 2, '09:30:00', '09:34:00', 2260, 45, 'AVAILABLE'),
(218, 'BUS', 8, 2, 1, '09:30:00', '09:34:00', 2260, 45, 'AVAILABLE'),
(219, 'BUS', 7, 1, 2, '11:00:00', '11:04:00', 2260, 45, 'AVAILABLE'),
(220, 'BUS', 8, 2, 1, '11:00:00', '11:04:00', 2260, 45, 'AVAILABLE'),
(221, 'BUS', 7, 1, 2, '11:30:00', '11:34:00', 2260, 45, 'AVAILABLE'),
(222, 'BUS', 8, 2, 1, '11:30:00', '11:34:00', 2260, 45, 'AVAILABLE'),
(223, 'BUS', 7, 1, 2, '13:00:00', '13:04:00', 2260, 45, 'AVAILABLE'),
(224, 'BUS', 8, 2, 1, '13:00:00', '13:04:00', 2260, 45, 'AVAILABLE'),
(225, 'BUS', 7, 1, 2, '13:30:00', '13:34:00', 2260, 45, 'AVAILABLE'),
(226, 'BUS', 8, 2, 1, '13:30:00', '13:34:00', 2260, 45, 'AVAILABLE'),
(227, 'BUS', 7, 1, 2, '15:00:00', '15:04:00', 2260, 45, 'AVAILABLE'),
(228, 'BUS', 8, 2, 1, '15:00:00', '15:04:00', 2260, 45, 'AVAILABLE'),
(229, 'BUS', 7, 1, 2, '15:30:00', '15:34:00', 2260, 45, 'AVAILABLE'),
(230, 'BUS', 8, 2, 1, '15:30:00', '15:34:00', 2260, 45, 'AVAILABLE'),
(231, 'BUS', 7, 1, 2, '17:00:00', '17:04:00', 2260, 45, 'AVAILABLE'),
(232, 'BUS', 8, 2, 1, '17:00:00', '17:04:00', 2260, 45, 'AVAILABLE'),
(233, 'BUS', 7, 1, 2, '17:30:00', '17:34:00', 2260, 45, 'AVAILABLE'),
(234, 'BUS', 8, 2, 1, '17:30:00', '17:34:00', 2260, 45, 'AVAILABLE'),
(235, 'BUS', 7, 1, 2, '19:00:00', '19:04:00', 2260, 45, 'AVAILABLE'),
(236, 'BUS', 8, 2, 1, '19:00:00', '19:04:00', 2260, 45, 'AVAILABLE'),
(237, 'BUS', 7, 1, 2, '19:30:00', '19:34:00', 2260, 45, 'AVAILABLE'),
(238, 'BUS', 8, 2, 1, '19:30:00', '19:34:00', 2260, 45, 'AVAILABLE'),
(239, 'BUS', 7, 1, 2, '21:00:00', '21:04:00', 2260, 45, 'AVAILABLE'),
(240, 'BUS', 8, 2, 1, '21:00:00', '21:04:00', 2260, 45, 'AVAILABLE'),
(241, 'BUS', 9, 3, 4, '08:00:00', '08:06:00', 4450, 45, 'AVAILABLE'),
(242, 'BUS', 9, 4, 5, '08:08:00', '08:14:00', 4220, 45, 'AVAILABLE'),
(243, 'BUS', 9, 5, 3, '08:16:00', '08:25:00', 6310, 45, 'AVAILABLE'),
(244, 'BUS', 10, 3, 5, '09:00:00', '09:09:00', 6310, 45, 'AVAILABLE'),
(245, 'BUS', 10, 5, 4, '09:11:00', '09:17:00', 4220, 45, 'AVAILABLE'),
(246, 'BUS', 10, 4, 3, '09:19:00', '09:25:00', 4450, 45, 'AVAILABLE'),
(247, 'BUS', 9, 3, 4, '10:00:00', '10:06:00', 4450, 45, 'AVAILABLE'),
(248, 'BUS', 9, 4, 5, '10:08:00', '10:14:00', 4220, 45, 'AVAILABLE'),
(249, 'BUS', 9, 5, 3, '10:16:00', '10:25:00', 6310, 45, 'AVAILABLE'),
(250, 'BUS', 10, 3, 5, '11:00:00', '11:09:00', 6310, 45, 'AVAILABLE'),
(251, 'BUS', 10, 5, 4, '11:11:00', '11:17:00', 4220, 45, 'AVAILABLE'),
(252, 'BUS', 10, 4, 3, '11:19:00', '11:25:00', 4450, 45, 'AVAILABLE'),
(253, 'BUS', 9, 3, 4, '12:00:00', '12:06:00', 4450, 45, 'AVAILABLE'),
(254, 'BUS', 9, 4, 5, '12:08:00', '12:14:00', 4220, 45, 'AVAILABLE'),
(255, 'BUS', 9, 5, 3, '12:16:00', '12:25:00', 6310, 45, 'AVAILABLE'),
(256, 'BUS', 10, 3, 5, '13:00:00', '13:09:00', 6310, 45, 'AVAILABLE'),
(257, 'BUS', 10, 5, 4, '13:11:00', '13:17:00', 4220, 45, 'AVAILABLE'),
(258, 'BUS', 10, 4, 3, '13:19:00', '13:25:00', 4450, 45, 'AVAILABLE'),
(259, 'BUS', 9, 3, 4, '14:00:00', '14:06:00', 4450, 45, 'AVAILABLE'),
(260, 'BUS', 9, 4, 5, '14:08:00', '14:14:00', 4220, 45, 'AVAILABLE'),
(261, 'BUS', 9, 5, 3, '14:16:00', '14:25:00', 6310, 45, 'AVAILABLE'),
(262, 'BUS', 10, 3, 5, '15:00:00', '15:09:00', 6310, 45, 'AVAILABLE'),
(263, 'BUS', 10, 5, 4, '15:11:00', '15:17:00', 4220, 45, 'AVAILABLE'),
(264, 'BUS', 10, 4, 3, '15:19:00', '15:25:00', 4450, 45, 'AVAILABLE'),
(265, 'BUS', 9, 3, 4, '16:00:00', '16:06:00', 4450, 45, 'AVAILABLE'),
(266, 'BUS', 9, 4, 5, '16:08:00', '16:14:00', 4220, 45, 'AVAILABLE'),
(267, 'BUS', 9, 5, 3, '16:16:00', '16:25:00', 6310, 45, 'AVAILABLE'),
(268, 'BUS', 10, 3, 5, '17:00:00', '17:09:00', 6310, 45, 'AVAILABLE'),
(269, 'BUS', 10, 5, 4, '17:11:00', '17:17:00', 4220, 45, 'AVAILABLE'),
(270, 'BUS', 10, 4, 3, '17:19:00', '17:25:00', 4450, 45, 'AVAILABLE'),
(271, 'BUS', 9, 3, 4, '18:00:00', '18:06:00', 4450, 45, 'AVAILABLE'),
(272, 'BUS', 9, 4, 5, '18:08:00', '18:14:00', 4220, 45, 'AVAILABLE'),
(273, 'BUS', 9, 5, 3, '18:16:00', '18:25:00', 6310, 45, 'AVAILABLE'),
(274, 'BUS', 10, 3, 5, '19:00:00', '19:09:00', 6310, 45, 'AVAILABLE'),
(275, 'BUS', 10, 5, 4, '19:11:00', '19:17:00', 4220, 45, 'AVAILABLE'),
(276, 'BUS', 10, 4, 3, '19:19:00', '19:25:00', 4450, 45, 'AVAILABLE'),
(277, 'BUS', 9, 3, 4, '20:00:00', '20:06:00', 4450, 45, 'AVAILABLE'),
(278, 'BUS', 9, 4, 5, '20:08:00', '20:14:00', 4220, 45, 'AVAILABLE'),
(279, 'BUS', 9, 5, 3, '20:16:00', '20:25:00', 6310, 45, 'AVAILABLE'),
(280, 'BUS', 11, 6, 4, '08:15:00', '08:24:00', 6040, 45, 'AVAILABLE'),
(281, 'BUS', 11, 4, 5, '08:26:00', '08:32:00', 4220, 45, 'AVAILABLE'),
(282, 'BUS', 11, 5, 6, '08:34:00', '08:46:00', 8570, 45, 'AVAILABLE'),
(283, 'BUS', 12, 6, 5, '09:45:00', '09:57:00', 8570, 45, 'AVAILABLE'),
(284, 'BUS', 12, 5, 4, '09:59:00', '10:05:00', 4220, 45, 'AVAILABLE'),
(285, 'BUS', 12, 4, 6, '10:07:00', '10:16:00', 6040, 45, 'AVAILABLE'),
(286, 'BUS', 11, 6, 4, '11:15:00', '11:24:00', 6040, 45, 'AVAILABLE'),
(287, 'BUS', 11, 4, 5, '11:26:00', '11:32:00', 4220, 45, 'AVAILABLE'),
(288, 'BUS', 11, 5, 6, '11:34:00', '11:46:00', 8570, 45, 'AVAILABLE'),
(289, 'BUS', 12, 6, 5, '12:45:00', '12:57:00', 8570, 45, 'AVAILABLE'),
(290, 'BUS', 12, 5, 4, '12:59:00', '13:05:00', 4220, 45, 'AVAILABLE'),
(291, 'BUS', 12, 4, 6, '13:07:00', '13:16:00', 6040, 45, 'AVAILABLE'),
(292, 'BUS', 11, 6, 4, '14:15:00', '14:24:00', 6040, 45, 'AVAILABLE'),
(293, 'BUS', 11, 4, 5, '14:26:00', '14:32:00', 4220, 45, 'AVAILABLE'),
(294, 'BUS', 11, 5, 6, '14:34:00', '14:46:00', 8570, 45, 'AVAILABLE'),
(295, 'BUS', 12, 6, 5, '15:45:00', '15:57:00', 8570, 45, 'AVAILABLE'),
(296, 'BUS', 12, 5, 4, '15:59:00', '16:05:00', 4220, 45, 'AVAILABLE'),
(297, 'BUS', 12, 4, 6, '16:07:00', '16:16:00', 6040, 45, 'AVAILABLE'),
(298, 'BUS', 11, 6, 4, '17:15:00', '17:24:00', 6040, 45, 'AVAILABLE'),
(299, 'BUS', 11, 4, 5, '17:26:00', '17:32:00', 4220, 45, 'AVAILABLE'),
(300, 'BUS', 11, 5, 6, '17:34:00', '17:46:00', 8570, 45, 'AVAILABLE'),
(301, 'BUS', 12, 6, 5, '18:45:00', '18:57:00', 8570, 45, 'AVAILABLE'),
(302, 'BUS', 12, 5, 4, '18:59:00', '19:05:00', 4220, 45, 'AVAILABLE'),
(303, 'BUS', 12, 4, 6, '19:07:00', '19:16:00', 6040, 45, 'AVAILABLE'),
(304, 'BUS', 11, 6, 4, '20:15:00', '20:24:00', 6040, 45, 'AVAILABLE'),
(305, 'BUS', 11, 4, 5, '20:26:00', '20:32:00', 4220, 45, 'AVAILABLE'),
(306, 'BUS', 11, 5, 6, '20:34:00', '20:46:00', 8570, 45, 'AVAILABLE');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `selections`
--

CREATE TABLE `selections` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `from_place_id` int(11) NOT NULL,
  `to_place_id` int(11) NOT NULL,
  `schedule_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `username` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `role` enum('ADMIN','USER') COLLATE utf8mb4_unicode_ci NOT NULL,
  `api_token` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- A tábla adatainak kiíratása `users`
--

INSERT INTO `users` (`id`, `username`, `password`, `role`, `api_token`, `created_at`, `updated_at`) VALUES
(1, 'admin', '$2y$10$P2oKrQBV8O9doTOFLea1Re4ZAg6XiAmgA3dcwayULx.hzHof8PaDi', 'ADMIN', '21232f297a57a5a743894a0e4a801fc3', '2021-08-24 06:27:23', '2021-08-24 06:57:11'),
(2, 'user1', '$2y$10$PVO/oPEzJeYevsCXP0sbyeuZ5RSoE7tQCjvBegFXWXK2kjH4vXGuS', 'USER', NULL, '2021-08-24 06:27:23', '2021-08-24 06:27:23'),
(3, 'user2', '$2y$10$T4rVKuz7Q0r27znJIV6JFu/CQBYRmQS.CeN2jYjKB9ghakTepwgpO', 'USER', NULL, '2021-08-24 06:27:23', '2021-08-24 06:27:23');

--
-- Indexek a kiírt táblákhoz
--

--
-- A tábla indexei `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- A tábla indexei `places`
--
ALTER TABLE `places`
  ADD PRIMARY KEY (`id`);

--
-- A tábla indexei `schedules`
--
ALTER TABLE `schedules`
  ADD PRIMARY KEY (`id`),
  ADD KEY `from_place_id` (`from_place_id`),
  ADD KEY `to_place_id` (`to_place_id`);

--
-- A tábla indexei `selections`
--
ALTER TABLE `selections`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `from_place_id` (`from_place_id`),
  ADD KEY `to_place_id` (`to_place_id`),
  ADD KEY `schedule_id` (`schedule_id`);

--
-- A tábla indexei `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- A kiírt táblák AUTO_INCREMENT értéke
--

--
-- AUTO_INCREMENT a táblához `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT a táblához `places`
--
ALTER TABLE `places`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT a táblához `schedules`
--
ALTER TABLE `schedules`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=308;

--
-- AUTO_INCREMENT a táblához `selections`
--
ALTER TABLE `selections`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT a táblához `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Megkötések a kiírt táblákhoz
--

--
-- Megkötések a táblához `schedules`
--
ALTER TABLE `schedules`
  ADD CONSTRAINT `schedules_ibfk_1` FOREIGN KEY (`from_place_id`) REFERENCES `places` (`id`),
  ADD CONSTRAINT `schedules_ibfk_2` FOREIGN KEY (`to_place_id`) REFERENCES `places` (`id`);

--
-- Megkötések a táblához `selections`
--
ALTER TABLE `selections`
  ADD CONSTRAINT `selections_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `selections_ibfk_2` FOREIGN KEY (`from_place_id`) REFERENCES `places` (`id`),
  ADD CONSTRAINT `selections_ibfk_3` FOREIGN KEY (`to_place_id`) REFERENCES `places` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

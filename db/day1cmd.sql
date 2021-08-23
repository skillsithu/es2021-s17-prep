-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Gép: 127.0.0.1
-- Létrehozás ideje: 2021. Aug 23. 09:06
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
-- Adatbázis: `day1cmd`
--

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `wp_commentmeta`
--

CREATE TABLE `wp_commentmeta` (
  `meta_id` bigint(20) UNSIGNED NOT NULL,
  `comment_id` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `meta_key` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_value` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `wp_comments`
--

CREATE TABLE `wp_comments` (
  `comment_ID` bigint(20) UNSIGNED NOT NULL,
  `comment_post_ID` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `comment_author` tinytext COLLATE utf8mb4_unicode_ci NOT NULL,
  `comment_author_email` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `comment_author_url` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `comment_author_IP` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `comment_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `comment_date_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `comment_content` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `comment_karma` int(11) NOT NULL DEFAULT 0,
  `comment_approved` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1',
  `comment_agent` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `comment_type` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'comment',
  `comment_parent` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `user_id` bigint(20) UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `wp_links`
--

CREATE TABLE `wp_links` (
  `link_id` bigint(20) UNSIGNED NOT NULL,
  `link_url` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `link_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `link_image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `link_target` varchar(25) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `link_description` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `link_visible` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Y',
  `link_owner` bigint(20) UNSIGNED NOT NULL DEFAULT 1,
  `link_rating` int(11) NOT NULL DEFAULT 0,
  `link_updated` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `link_rel` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `link_notes` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `link_rss` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `wp_options`
--

CREATE TABLE `wp_options` (
  `option_id` bigint(20) UNSIGNED NOT NULL,
  `option_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `option_value` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `autoload` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'yes'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- A tábla adatainak kiíratása `wp_options`
--

INSERT INTO `wp_options` (`option_id`, `option_name`, `option_value`, `autoload`) VALUES
(1, 'siteurl', 'http://localhost/day1/cms', 'yes'),
(2, 'home', 'http://localhost/day1/cms', 'yes'),
(3, 'blogname', 'Kazan Museum Tour', 'yes'),
(4, 'blogdescription', 'Museums of Wonder', 'yes'),
(5, 'users_can_register', '0', 'yes'),
(6, 'admin_email', 'es2021@es2021.hu', 'yes'),
(7, 'start_of_week', '1', 'yes'),
(8, 'use_balanceTags', '0', 'yes'),
(9, 'use_smilies', '1', 'yes'),
(10, 'require_name_email', '1', 'yes'),
(11, 'comments_notify', '', 'yes'),
(12, 'posts_per_rss', '10', 'yes'),
(13, 'rss_use_excerpt', '0', 'yes'),
(14, 'mailserver_url', 'mail.example.com', 'yes'),
(15, 'mailserver_login', 'login@example.com', 'yes'),
(16, 'mailserver_pass', 'password', 'yes'),
(17, 'mailserver_port', '110', 'yes'),
(18, 'default_category', '1', 'yes'),
(19, 'default_comment_status', 'open', 'yes'),
(20, 'default_ping_status', 'open', 'yes'),
(21, 'default_pingback_flag', '1', 'yes'),
(22, 'posts_per_page', '10', 'yes'),
(23, 'date_format', 'F j, Y', 'yes'),
(24, 'time_format', 'g:i a', 'yes'),
(25, 'links_updated_date_format', 'F j, Y g:i a', 'yes'),
(26, 'comment_moderation', '', 'yes'),
(27, 'moderation_notify', '1', 'yes'),
(28, 'permalink_structure', '/%postname%/', 'yes'),
(29, 'rewrite_rules', 'a:92:{s:11:\"^wp-json/?$\";s:22:\"index.php?rest_route=/\";s:14:\"^wp-json/(.*)?\";s:33:\"index.php?rest_route=/$matches[1]\";s:21:\"^index.php/wp-json/?$\";s:22:\"index.php?rest_route=/\";s:24:\"^index.php/wp-json/(.*)?\";s:33:\"index.php?rest_route=/$matches[1]\";s:17:\"^wp-sitemap\\.xml$\";s:23:\"index.php?sitemap=index\";s:17:\"^wp-sitemap\\.xsl$\";s:36:\"index.php?sitemap-stylesheet=sitemap\";s:23:\"^wp-sitemap-index\\.xsl$\";s:34:\"index.php?sitemap-stylesheet=index\";s:48:\"^wp-sitemap-([a-z]+?)-([a-z\\d_-]+?)-(\\d+?)\\.xml$\";s:75:\"index.php?sitemap=$matches[1]&sitemap-subtype=$matches[2]&paged=$matches[3]\";s:34:\"^wp-sitemap-([a-z]+?)-(\\d+?)\\.xml$\";s:47:\"index.php?sitemap=$matches[1]&paged=$matches[2]\";s:43:\"news/(.+?)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:52:\"index.php?category_name=$matches[1]&feed=$matches[2]\";s:38:\"news/(.+?)/(feed|rdf|rss|rss2|atom)/?$\";s:52:\"index.php?category_name=$matches[1]&feed=$matches[2]\";s:19:\"news/(.+?)/embed/?$\";s:46:\"index.php?category_name=$matches[1]&embed=true\";s:31:\"news/(.+?)/page/?([0-9]{1,})/?$\";s:53:\"index.php?category_name=$matches[1]&paged=$matches[2]\";s:13:\"news/(.+?)/?$\";s:35:\"index.php?category_name=$matches[1]\";s:44:\"tag/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:42:\"index.php?tag=$matches[1]&feed=$matches[2]\";s:39:\"tag/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:42:\"index.php?tag=$matches[1]&feed=$matches[2]\";s:20:\"tag/([^/]+)/embed/?$\";s:36:\"index.php?tag=$matches[1]&embed=true\";s:32:\"tag/([^/]+)/page/?([0-9]{1,})/?$\";s:43:\"index.php?tag=$matches[1]&paged=$matches[2]\";s:14:\"tag/([^/]+)/?$\";s:25:\"index.php?tag=$matches[1]\";s:45:\"type/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:50:\"index.php?post_format=$matches[1]&feed=$matches[2]\";s:40:\"type/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:50:\"index.php?post_format=$matches[1]&feed=$matches[2]\";s:21:\"type/([^/]+)/embed/?$\";s:44:\"index.php?post_format=$matches[1]&embed=true\";s:33:\"type/([^/]+)/page/?([0-9]{1,})/?$\";s:51:\"index.php?post_format=$matches[1]&paged=$matches[2]\";s:15:\"type/([^/]+)/?$\";s:33:\"index.php?post_format=$matches[1]\";s:48:\".*wp-(atom|rdf|rss|rss2|feed|commentsrss2)\\.php$\";s:18:\"index.php?feed=old\";s:20:\".*wp-app\\.php(/.*)?$\";s:19:\"index.php?error=403\";s:18:\".*wp-register.php$\";s:23:\"index.php?register=true\";s:32:\"feed/(feed|rdf|rss|rss2|atom)/?$\";s:27:\"index.php?&feed=$matches[1]\";s:27:\"(feed|rdf|rss|rss2|atom)/?$\";s:27:\"index.php?&feed=$matches[1]\";s:8:\"embed/?$\";s:21:\"index.php?&embed=true\";s:20:\"page/?([0-9]{1,})/?$\";s:28:\"index.php?&paged=$matches[1]\";s:27:\"comment-page-([0-9]{1,})/?$\";s:39:\"index.php?&page_id=17&cpage=$matches[1]\";s:41:\"comments/feed/(feed|rdf|rss|rss2|atom)/?$\";s:42:\"index.php?&feed=$matches[1]&withcomments=1\";s:36:\"comments/(feed|rdf|rss|rss2|atom)/?$\";s:42:\"index.php?&feed=$matches[1]&withcomments=1\";s:17:\"comments/embed/?$\";s:21:\"index.php?&embed=true\";s:44:\"search/(.+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:40:\"index.php?s=$matches[1]&feed=$matches[2]\";s:39:\"search/(.+)/(feed|rdf|rss|rss2|atom)/?$\";s:40:\"index.php?s=$matches[1]&feed=$matches[2]\";s:20:\"search/(.+)/embed/?$\";s:34:\"index.php?s=$matches[1]&embed=true\";s:32:\"search/(.+)/page/?([0-9]{1,})/?$\";s:41:\"index.php?s=$matches[1]&paged=$matches[2]\";s:14:\"search/(.+)/?$\";s:23:\"index.php?s=$matches[1]\";s:47:\"author/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:50:\"index.php?author_name=$matches[1]&feed=$matches[2]\";s:42:\"author/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:50:\"index.php?author_name=$matches[1]&feed=$matches[2]\";s:23:\"author/([^/]+)/embed/?$\";s:44:\"index.php?author_name=$matches[1]&embed=true\";s:35:\"author/([^/]+)/page/?([0-9]{1,})/?$\";s:51:\"index.php?author_name=$matches[1]&paged=$matches[2]\";s:17:\"author/([^/]+)/?$\";s:33:\"index.php?author_name=$matches[1]\";s:69:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/feed/(feed|rdf|rss|rss2|atom)/?$\";s:80:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&feed=$matches[4]\";s:64:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/(feed|rdf|rss|rss2|atom)/?$\";s:80:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&feed=$matches[4]\";s:45:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/embed/?$\";s:74:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&embed=true\";s:57:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/page/?([0-9]{1,})/?$\";s:81:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&paged=$matches[4]\";s:39:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/?$\";s:63:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]\";s:56:\"([0-9]{4})/([0-9]{1,2})/feed/(feed|rdf|rss|rss2|atom)/?$\";s:64:\"index.php?year=$matches[1]&monthnum=$matches[2]&feed=$matches[3]\";s:51:\"([0-9]{4})/([0-9]{1,2})/(feed|rdf|rss|rss2|atom)/?$\";s:64:\"index.php?year=$matches[1]&monthnum=$matches[2]&feed=$matches[3]\";s:32:\"([0-9]{4})/([0-9]{1,2})/embed/?$\";s:58:\"index.php?year=$matches[1]&monthnum=$matches[2]&embed=true\";s:44:\"([0-9]{4})/([0-9]{1,2})/page/?([0-9]{1,})/?$\";s:65:\"index.php?year=$matches[1]&monthnum=$matches[2]&paged=$matches[3]\";s:26:\"([0-9]{4})/([0-9]{1,2})/?$\";s:47:\"index.php?year=$matches[1]&monthnum=$matches[2]\";s:43:\"([0-9]{4})/feed/(feed|rdf|rss|rss2|atom)/?$\";s:43:\"index.php?year=$matches[1]&feed=$matches[2]\";s:38:\"([0-9]{4})/(feed|rdf|rss|rss2|atom)/?$\";s:43:\"index.php?year=$matches[1]&feed=$matches[2]\";s:19:\"([0-9]{4})/embed/?$\";s:37:\"index.php?year=$matches[1]&embed=true\";s:31:\"([0-9]{4})/page/?([0-9]{1,})/?$\";s:44:\"index.php?year=$matches[1]&paged=$matches[2]\";s:13:\"([0-9]{4})/?$\";s:26:\"index.php?year=$matches[1]\";s:27:\".?.+?/attachment/([^/]+)/?$\";s:32:\"index.php?attachment=$matches[1]\";s:37:\".?.+?/attachment/([^/]+)/trackback/?$\";s:37:\"index.php?attachment=$matches[1]&tb=1\";s:57:\".?.+?/attachment/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:52:\".?.+?/attachment/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:52:\".?.+?/attachment/([^/]+)/comment-page-([0-9]{1,})/?$\";s:50:\"index.php?attachment=$matches[1]&cpage=$matches[2]\";s:33:\".?.+?/attachment/([^/]+)/embed/?$\";s:43:\"index.php?attachment=$matches[1]&embed=true\";s:16:\"(.?.+?)/embed/?$\";s:41:\"index.php?pagename=$matches[1]&embed=true\";s:20:\"(.?.+?)/trackback/?$\";s:35:\"index.php?pagename=$matches[1]&tb=1\";s:40:\"(.?.+?)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:47:\"index.php?pagename=$matches[1]&feed=$matches[2]\";s:35:\"(.?.+?)/(feed|rdf|rss|rss2|atom)/?$\";s:47:\"index.php?pagename=$matches[1]&feed=$matches[2]\";s:28:\"(.?.+?)/page/?([0-9]{1,})/?$\";s:48:\"index.php?pagename=$matches[1]&paged=$matches[2]\";s:35:\"(.?.+?)/comment-page-([0-9]{1,})/?$\";s:48:\"index.php?pagename=$matches[1]&cpage=$matches[2]\";s:24:\"(.?.+?)(?:/([0-9]+))?/?$\";s:47:\"index.php?pagename=$matches[1]&page=$matches[2]\";s:27:\"[^/]+/attachment/([^/]+)/?$\";s:32:\"index.php?attachment=$matches[1]\";s:37:\"[^/]+/attachment/([^/]+)/trackback/?$\";s:37:\"index.php?attachment=$matches[1]&tb=1\";s:57:\"[^/]+/attachment/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:52:\"[^/]+/attachment/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:52:\"[^/]+/attachment/([^/]+)/comment-page-([0-9]{1,})/?$\";s:50:\"index.php?attachment=$matches[1]&cpage=$matches[2]\";s:33:\"[^/]+/attachment/([^/]+)/embed/?$\";s:43:\"index.php?attachment=$matches[1]&embed=true\";s:16:\"([^/]+)/embed/?$\";s:37:\"index.php?name=$matches[1]&embed=true\";s:20:\"([^/]+)/trackback/?$\";s:31:\"index.php?name=$matches[1]&tb=1\";s:40:\"([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:43:\"index.php?name=$matches[1]&feed=$matches[2]\";s:35:\"([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:43:\"index.php?name=$matches[1]&feed=$matches[2]\";s:28:\"([^/]+)/page/?([0-9]{1,})/?$\";s:44:\"index.php?name=$matches[1]&paged=$matches[2]\";s:35:\"([^/]+)/comment-page-([0-9]{1,})/?$\";s:44:\"index.php?name=$matches[1]&cpage=$matches[2]\";s:24:\"([^/]+)(?:/([0-9]+))?/?$\";s:43:\"index.php?name=$matches[1]&page=$matches[2]\";s:16:\"[^/]+/([^/]+)/?$\";s:32:\"index.php?attachment=$matches[1]\";s:26:\"[^/]+/([^/]+)/trackback/?$\";s:37:\"index.php?attachment=$matches[1]&tb=1\";s:46:\"[^/]+/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:41:\"[^/]+/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:41:\"[^/]+/([^/]+)/comment-page-([0-9]{1,})/?$\";s:50:\"index.php?attachment=$matches[1]&cpage=$matches[2]\";s:22:\"[^/]+/([^/]+)/embed/?$\";s:43:\"index.php?attachment=$matches[1]&embed=true\";}', 'yes'),
(30, 'hack_file', '0', 'yes'),
(31, 'blog_charset', 'UTF-8', 'yes'),
(32, 'moderation_keys', '', 'no'),
(33, 'active_plugins', 'a:2:{i:0;s:30:\"advanced-custom-fields/acf.php\";i:3;s:41:\"wp-turbolinks-5-master/wp-turbolinks5.php\";}', 'yes'),
(34, 'category_base', '/news', 'yes'),
(35, 'ping_sites', 'http://rpc.pingomatic.com/', 'yes'),
(36, 'comment_max_links', '2', 'yes'),
(37, 'gmt_offset', '0', 'yes'),
(38, 'default_email_category', '1', 'yes'),
(39, 'recently_edited', '', 'no'),
(40, 'template', 'sample_underscores', 'yes'),
(41, 'stylesheet', 'kazan_museumtour', 'yes'),
(42, 'comment_registration', '', 'yes'),
(43, 'html_type', 'text/html', 'yes'),
(44, 'use_trackback', '0', 'yes'),
(45, 'default_role', 'subscriber', 'yes'),
(46, 'db_version', '49752', 'yes'),
(47, 'uploads_use_yearmonth_folders', '1', 'yes'),
(48, 'upload_path', '', 'yes'),
(49, 'blog_public', '1', 'yes'),
(50, 'default_link_category', '2', 'yes'),
(51, 'show_on_front', 'posts', 'yes'),
(52, 'tag_base', '', 'yes'),
(53, 'show_avatars', '1', 'yes'),
(54, 'avatar_rating', 'G', 'yes'),
(55, 'upload_url_path', '', 'yes'),
(56, 'thumbnail_size_w', '150', 'yes'),
(57, 'thumbnail_size_h', '150', 'yes'),
(58, 'thumbnail_crop', '1', 'yes'),
(59, 'medium_size_w', '300', 'yes'),
(60, 'medium_size_h', '300', 'yes'),
(61, 'avatar_default', 'mystery', 'yes'),
(62, 'large_size_w', '1024', 'yes'),
(63, 'large_size_h', '1024', 'yes'),
(64, 'image_default_link_type', 'none', 'yes'),
(65, 'image_default_size', '', 'yes'),
(66, 'image_default_align', '', 'yes'),
(67, 'close_comments_for_old_posts', '', 'yes'),
(68, 'close_comments_days_old', '14', 'yes'),
(69, 'thread_comments', '1', 'yes'),
(70, 'thread_comments_depth', '5', 'yes'),
(71, 'page_comments', '', 'yes'),
(72, 'comments_per_page', '50', 'yes'),
(73, 'default_comments_page', 'newest', 'yes'),
(74, 'comment_order', 'asc', 'yes'),
(75, 'sticky_posts', 'a:0:{}', 'yes'),
(76, 'widget_categories', 'a:2:{i:1;a:0:{}s:12:\"_multiwidget\";i:1;}', 'yes'),
(77, 'widget_text', 'a:2:{i:1;a:0:{}s:12:\"_multiwidget\";i:1;}', 'yes'),
(78, 'widget_rss', 'a:2:{i:1;a:0:{}s:12:\"_multiwidget\";i:1;}', 'yes'),
(79, 'uninstall_plugins', 'a:2:{s:46:\"wonderplugin-carousel/wonderplugincarousel.php\";s:31:\"wonderplugin_carousel_uninstall\";s:59:\"wp-responsive-jquery-slider/wp-responsive-jquery-slider.php\";s:21:\"wrjs_uninstall_slider\";}', 'no'),
(80, 'timezone_string', '', 'yes'),
(81, 'page_for_posts', '15', 'yes'),
(82, 'page_on_front', '17', 'yes'),
(83, 'default_post_format', '0', 'yes'),
(84, 'link_manager_enabled', '0', 'yes'),
(85, 'finished_splitting_shared_terms', '1', 'yes'),
(86, 'site_icon', '0', 'yes'),
(87, 'medium_large_size_w', '768', 'yes'),
(88, 'medium_large_size_h', '0', 'yes'),
(89, 'wp_page_for_privacy_policy', '3', 'yes'),
(90, 'show_comments_cookies_opt_in', '1', 'yes'),
(91, 'admin_email_lifespan', '1644059172', 'yes'),
(92, 'disallowed_keys', '', 'no'),
(93, 'comment_previously_approved', '1', 'yes'),
(94, 'auto_plugin_theme_update_emails', 'a:0:{}', 'no'),
(95, 'auto_update_core_dev', 'enabled', 'yes'),
(96, 'auto_update_core_minor', 'enabled', 'yes'),
(97, 'auto_update_core_major', 'enabled', 'yes'),
(98, 'wp_force_deactivated_plugins', 'a:0:{}', 'yes'),
(99, 'initial_db_version', '49752', 'yes'),
(100, 'wp_user_roles', 'a:5:{s:13:\"administrator\";a:2:{s:4:\"name\";s:13:\"Administrator\";s:12:\"capabilities\";a:61:{s:13:\"switch_themes\";b:1;s:11:\"edit_themes\";b:1;s:16:\"activate_plugins\";b:1;s:12:\"edit_plugins\";b:1;s:10:\"edit_users\";b:1;s:10:\"edit_files\";b:1;s:14:\"manage_options\";b:1;s:17:\"moderate_comments\";b:1;s:17:\"manage_categories\";b:1;s:12:\"manage_links\";b:1;s:12:\"upload_files\";b:1;s:6:\"import\";b:1;s:15:\"unfiltered_html\";b:1;s:10:\"edit_posts\";b:1;s:17:\"edit_others_posts\";b:1;s:20:\"edit_published_posts\";b:1;s:13:\"publish_posts\";b:1;s:10:\"edit_pages\";b:1;s:4:\"read\";b:1;s:8:\"level_10\";b:1;s:7:\"level_9\";b:1;s:7:\"level_8\";b:1;s:7:\"level_7\";b:1;s:7:\"level_6\";b:1;s:7:\"level_5\";b:1;s:7:\"level_4\";b:1;s:7:\"level_3\";b:1;s:7:\"level_2\";b:1;s:7:\"level_1\";b:1;s:7:\"level_0\";b:1;s:17:\"edit_others_pages\";b:1;s:20:\"edit_published_pages\";b:1;s:13:\"publish_pages\";b:1;s:12:\"delete_pages\";b:1;s:19:\"delete_others_pages\";b:1;s:22:\"delete_published_pages\";b:1;s:12:\"delete_posts\";b:1;s:19:\"delete_others_posts\";b:1;s:22:\"delete_published_posts\";b:1;s:20:\"delete_private_posts\";b:1;s:18:\"edit_private_posts\";b:1;s:18:\"read_private_posts\";b:1;s:20:\"delete_private_pages\";b:1;s:18:\"edit_private_pages\";b:1;s:18:\"read_private_pages\";b:1;s:12:\"delete_users\";b:1;s:12:\"create_users\";b:1;s:17:\"unfiltered_upload\";b:1;s:14:\"edit_dashboard\";b:1;s:14:\"update_plugins\";b:1;s:14:\"delete_plugins\";b:1;s:15:\"install_plugins\";b:1;s:13:\"update_themes\";b:1;s:14:\"install_themes\";b:1;s:11:\"update_core\";b:1;s:10:\"list_users\";b:1;s:12:\"remove_users\";b:1;s:13:\"promote_users\";b:1;s:18:\"edit_theme_options\";b:1;s:13:\"delete_themes\";b:1;s:6:\"export\";b:1;}}s:6:\"editor\";a:2:{s:4:\"name\";s:6:\"Editor\";s:12:\"capabilities\";a:34:{s:17:\"moderate_comments\";b:1;s:17:\"manage_categories\";b:1;s:12:\"manage_links\";b:1;s:12:\"upload_files\";b:1;s:15:\"unfiltered_html\";b:1;s:10:\"edit_posts\";b:1;s:17:\"edit_others_posts\";b:1;s:20:\"edit_published_posts\";b:1;s:13:\"publish_posts\";b:1;s:10:\"edit_pages\";b:1;s:4:\"read\";b:1;s:7:\"level_7\";b:1;s:7:\"level_6\";b:1;s:7:\"level_5\";b:1;s:7:\"level_4\";b:1;s:7:\"level_3\";b:1;s:7:\"level_2\";b:1;s:7:\"level_1\";b:1;s:7:\"level_0\";b:1;s:17:\"edit_others_pages\";b:1;s:20:\"edit_published_pages\";b:1;s:13:\"publish_pages\";b:1;s:12:\"delete_pages\";b:1;s:19:\"delete_others_pages\";b:1;s:22:\"delete_published_pages\";b:1;s:12:\"delete_posts\";b:1;s:19:\"delete_others_posts\";b:1;s:22:\"delete_published_posts\";b:1;s:20:\"delete_private_posts\";b:1;s:18:\"edit_private_posts\";b:1;s:18:\"read_private_posts\";b:1;s:20:\"delete_private_pages\";b:1;s:18:\"edit_private_pages\";b:1;s:18:\"read_private_pages\";b:1;}}s:6:\"author\";a:2:{s:4:\"name\";s:6:\"Author\";s:12:\"capabilities\";a:10:{s:12:\"upload_files\";b:1;s:10:\"edit_posts\";b:1;s:20:\"edit_published_posts\";b:1;s:13:\"publish_posts\";b:1;s:4:\"read\";b:1;s:7:\"level_2\";b:1;s:7:\"level_1\";b:1;s:7:\"level_0\";b:1;s:12:\"delete_posts\";b:1;s:22:\"delete_published_posts\";b:1;}}s:11:\"contributor\";a:2:{s:4:\"name\";s:11:\"Contributor\";s:12:\"capabilities\";a:5:{s:10:\"edit_posts\";b:1;s:4:\"read\";b:1;s:7:\"level_1\";b:1;s:7:\"level_0\";b:1;s:12:\"delete_posts\";b:1;}}s:10:\"subscriber\";a:2:{s:4:\"name\";s:10:\"Subscriber\";s:12:\"capabilities\";a:2:{s:4:\"read\";b:1;s:7:\"level_0\";b:1;}}}', 'yes'),
(101, 'fresh_site', '0', 'yes'),
(102, 'widget_block', 'a:7:{i:3;a:1:{s:7:\"content\";s:893:\"<!-- wp:group -->\n<div class=\"wp-block-group\"><!-- wp:gallery {\"ids\":[57,58,59],\"linkTo\":\"none\"} -->\n<figure class=\"wp-block-gallery columns-3 is-cropped\"><ul class=\"blocks-gallery-grid\"><li class=\"blocks-gallery-item\"><figure><img src=\"http://localhost/day1/cms/wp-content/uploads/2021/08/kzn-1-1.jpg\" alt=\"\" data-id=\"57\" data-link=\"http://localhost/day1/cms/kzn-1-1/\" class=\"wp-image-57\"/></figure></li><li class=\"blocks-gallery-item\"><figure><img src=\"http://localhost/day1/cms/wp-content/uploads/2021/08/kzn-2.jpg\" alt=\"\" data-id=\"58\" data-link=\"http://localhost/day1/cms/kzn-2/\" class=\"wp-image-58\"/></figure></li><li class=\"blocks-gallery-item\"><figure><img src=\"http://localhost/day1/cms/wp-content/uploads/2021/08/kzn-3.jpg\" alt=\"\" data-id=\"59\" data-link=\"http://localhost/day1/cms/kzn-3/\" class=\"wp-image-59\"/></figure></li></ul></figure>\n<!-- /wp:gallery --></div>\n<!-- /wp:group -->\";}i:4;a:1:{s:7:\"content\";s:71:\"<!-- wp:group -->\n<div class=\"wp-block-group\"></div>\n<!-- /wp:group -->\";}i:5;a:1:{s:7:\"content\";s:71:\"<!-- wp:group -->\n<div class=\"wp-block-group\"></div>\n<!-- /wp:group -->\";}i:6;a:1:{s:7:\"content\";s:71:\"<!-- wp:group -->\n<div class=\"wp-block-group\"></div>\n<!-- /wp:group -->\";}i:7;a:1:{s:7:\"content\";s:175:\"<!-- wp:heading {\"className\":\"welcome\"} -->\n<h2 class=\"welcome\">Welcome Fellow Explorer, and thank you for visiting Kazan, and its beautiful museums.</h2>\n<!-- /wp:heading -->\";}i:8;a:1:{s:7:\"content\";s:306:\"<h3>Contact Us</h3>\n<form method=\"post\" action=\"https://formspree.io/admin@example.com\">\n<input type=\"text\" name=\"name\" placeholder=\"Name\"><br>\n<input type=\"email\" name=\"email\" placeholder=\"Email\"><br>\n<textarea name=\"content\" placeholder=\"Message\"></textarea><br>\n<button>Send Message</button><br>\n</form>\";}s:12:\"_multiwidget\";i:1;}', 'yes'),
(103, 'sidebars_widgets', 'a:3:{s:19:\"wp_inactive_widgets\";a:0:{}s:9:\"sidebar-1\";a:6:{i:0;s:7:\"block-7\";i:1;s:7:\"block-3\";i:2;s:7:\"block-8\";i:3;s:7:\"block-4\";i:4;s:7:\"block-5\";i:5;s:7:\"block-6\";}s:13:\"array_version\";i:3;}', 'yes'),
(104, 'cron', 'a:7:{i:1660654475;a:1:{s:20:\"jetpack_clean_nonces\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:6:\"hourly\";s:4:\"args\";a:0:{}s:8:\"interval\";i:3600;}}}i:1660655173;a:1:{s:34:\"wp_privacy_delete_old_export_files\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:6:\"hourly\";s:4:\"args\";a:0:{}s:8:\"interval\";i:3600;}}}i:1660691173;a:4:{s:18:\"wp_https_detection\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:10:\"twicedaily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:43200;}}s:16:\"wp_version_check\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:10:\"twicedaily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:43200;}}s:17:\"wp_update_plugins\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:10:\"twicedaily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:43200;}}s:16:\"wp_update_themes\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:10:\"twicedaily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:43200;}}}i:1660734373;a:1:{s:32:\"recovery_mode_clean_expired_keys\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:5:\"daily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:86400;}}}i:1660734379;a:3:{s:19:\"wp_scheduled_delete\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:5:\"daily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:86400;}}s:25:\"delete_expired_transients\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:5:\"daily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:86400;}}s:30:\"wp_scheduled_auto_draft_delete\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:5:\"daily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:86400;}}}i:1661252773;a:1:{s:30:\"wp_site_health_scheduled_check\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:6:\"weekly\";s:4:\"args\";a:0:{}s:8:\"interval\";i:604800;}}}s:7:\"version\";i:2;}', 'yes'),
(105, 'widget_pages', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(106, 'widget_calendar', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(107, 'widget_archives', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(108, 'widget_media_audio', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(109, 'widget_media_image', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(110, 'widget_media_gallery', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(111, 'widget_media_video', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(112, 'widget_meta', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(113, 'widget_search', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(114, 'widget_tag_cloud', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(115, 'widget_nav_menu', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(116, 'widget_custom_html', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(118, 'recovery_keys', 'a:0:{}', 'yes'),
(119, 'https_detection_errors', 'a:2:{s:23:\"ssl_verification_failed\";a:1:{i:0;s:24:\"SSL verification failed.\";}s:17:\"bad_response_code\";a:1:{i:0;s:9:\"Forbidden\";}}', 'yes'),
(120, '_site_transient_update_core', 'O:8:\"stdClass\":3:{s:7:\"updates\";a:0:{}s:15:\"version_checked\";s:3:\"5.8\";s:12:\"last_checked\";i:1660652901;}', 'no'),
(121, '_site_transient_update_plugins', 'O:8:\"stdClass\":1:{s:12:\"last_checked\";i:1629117257;}', 'no'),
(124, '_site_transient_update_themes', 'O:8:\"stdClass\":1:{s:12:\"last_checked\";i:1660652901;}', 'no'),
(125, 'theme_mods_twentytwentyone', 'a:2:{s:18:\"custom_css_post_id\";i:-1;s:16:\"sidebars_widgets\";a:2:{s:4:\"time\";i:1628507969;s:4:\"data\";a:3:{s:19:\"wp_inactive_widgets\";a:0:{}s:9:\"sidebar-1\";a:3:{i:0;s:7:\"block-2\";i:1;s:7:\"block-3\";i:2;s:7:\"block-4\";}s:9:\"sidebar-2\";a:2:{i:0;s:7:\"block-5\";i:1;s:7:\"block-6\";}}}}', 'yes'),
(129, 'can_compress_scripts', '1', 'no'),
(131, 'widget_recent-comments', 'a:2:{i:1;a:0:{}s:12:\"_multiwidget\";i:1;}', 'yes'),
(132, 'widget_recent-posts', 'a:2:{i:1;a:0:{}s:12:\"_multiwidget\";i:1;}', 'yes'),
(135, 'theme_mods_sample_underscores', 'a:3:{s:18:\"custom_css_post_id\";i:-1;s:18:\"nav_menu_locations\";a:1:{s:6:\"menu-1\";i:8;}s:16:\"sidebars_widgets\";a:2:{s:4:\"time\";i:1629116412;s:4:\"data\";a:2:{s:19:\"wp_inactive_widgets\";a:0:{}s:9:\"sidebar-1\";a:6:{i:0;s:7:\"block-7\";i:1;s:7:\"block-3\";i:2;s:7:\"block-8\";i:3;s:7:\"block-4\";i:4;s:7:\"block-5\";i:5;s:7:\"block-6\";}}}}', 'yes'),
(136, 'theme_mods_blankslate', 'a:1:{s:18:\"custom_css_post_id\";i:-1;}', 'yes'),
(139, 'finished_updating_comment_type', '1', 'yes'),
(140, 'recently_activated', 'a:5:{s:46:\"wonderplugin-carousel/wonderplugincarousel.php\";i:1628513637;s:19:\"akismet/akismet.php\";i:1628513591;s:35:\"autodescription/autodescription.php\";i:1628513584;s:59:\"wp-responsive-jquery-slider/wp-responsive-jquery-slider.php\";i:1628513550;s:63:\"elegant-responsive-content-slider/responsive-content-slider.php\";i:1628513476;}', 'yes'),
(141, 'acf_version', '5.8.0', 'yes'),
(142, 'current_theme', 'Kazan Museum Tour', 'yes'),
(143, 'theme_mods_kazan_museumtour', 'a:4:{i:0;b:0;s:18:\"nav_menu_locations\";a:2:{s:6:\"menu-1\";i:8;s:6:\"footer\";i:9;}s:18:\"custom_css_post_id\";i:-1;s:16:\"sidebars_widgets\";a:2:{s:4:\"time\";i:1629116393;s:4:\"data\";a:2:{s:19:\"wp_inactive_widgets\";a:0:{}s:9:\"sidebar-1\";a:6:{i:0;s:7:\"block-7\";i:1;s:7:\"block-3\";i:2;s:7:\"block-8\";i:3;s:7:\"block-4\";i:4;s:7:\"block-5\";i:5;s:7:\"block-6\";}}}}', 'yes'),
(144, 'theme_switched', '', 'yes'),
(146, 'recovery_mode_email_last_sent', '1628508241', 'yes'),
(147, 'WPLANG', '', 'yes'),
(148, 'new_admin_email', 'es2021@es2021.hu', 'yes'),
(174, 'category_children', 'a:0:{}', 'yes'),
(179, 'nav_menu_options', 'a:2:{i:0;b:0;s:8:\"auto_add\";a:0:{}}', 'yes'),
(190, 'wonderplugin_carousel_userrole', 'manage_options', 'yes'),
(191, 'wonderplugin_carousel_thumbnailsize', 'large', 'yes'),
(192, 'wonderplugin-carousel-engine', 'Responsive WordPress Carousel Slider', 'yes'),
(193, 'the_seo_framework_tested_upgrade_version', '3104', 'yes'),
(194, 'autodescription-updates-cache', 'a:1:{s:26:\"check_seo_plugin_conflicts\";i:0;}', 'yes'),
(195, 'the_seo_framework_initial_db_version', '3104', 'no'),
(196, 'autodescription-site-settings', 'a:111:{s:18:\"alter_search_query\";i:1;s:19:\"alter_archive_query\";i:1;s:24:\"alter_archive_query_type\";s:8:\"in_query\";s:23:\"alter_search_query_type\";s:8:\"in_query\";s:17:\"cache_meta_schema\";i:0;s:13:\"cache_sitemap\";i:1;s:12:\"cache_object\";i:1;s:22:\"display_seo_bar_tables\";i:1;s:23:\"display_seo_bar_metabox\";i:0;s:21:\"display_pixel_counter\";i:1;s:25:\"display_character_counter\";i:1;s:16:\"canonical_scheme\";s:9:\"automatic\";s:17:\"timestamps_format\";s:1:\"1\";s:19:\"disabled_post_types\";a:0:{}s:15:\"title_separator\";s:4:\"pipe\";s:14:\"title_location\";s:5:\"right\";s:19:\"title_rem_additions\";i:0;s:18:\"title_rem_prefixes\";i:0;s:16:\"title_strip_tags\";i:1;s:16:\"auto_description\";i:1;s:16:\"category_noindex\";i:0;s:11:\"tag_noindex\";i:0;s:14:\"author_noindex\";i:0;s:12:\"date_noindex\";i:1;s:14:\"search_noindex\";i:1;s:18:\"attachment_noindex\";i:1;s:12:\"site_noindex\";i:0;s:18:\"noindex_post_types\";a:1:{s:10:\"attachment\";i:1;}s:17:\"category_nofollow\";i:0;s:12:\"tag_nofollow\";i:0;s:15:\"author_nofollow\";i:0;s:13:\"date_nofollow\";i:0;s:15:\"search_nofollow\";i:0;s:19:\"attachment_nofollow\";i:0;s:13:\"site_nofollow\";i:0;s:19:\"nofollow_post_types\";a:0:{}s:18:\"category_noarchive\";i:0;s:13:\"tag_noarchive\";i:0;s:16:\"author_noarchive\";i:0;s:14:\"date_noarchive\";i:0;s:16:\"search_noarchive\";i:0;s:20:\"attachment_noarchive\";i:0;s:14:\"site_noarchive\";i:0;s:20:\"noarchive_post_types\";a:0:{}s:13:\"paged_noindex\";i:1;s:18:\"home_paged_noindex\";i:0;s:16:\"homepage_noindex\";i:0;s:17:\"homepage_nofollow\";i:0;s:18:\"homepage_noarchive\";i:0;s:14:\"homepage_title\";s:0:\"\";s:16:\"homepage_tagline\";i:1;s:20:\"homepage_description\";s:0:\"\";s:22:\"homepage_title_tagline\";s:0:\"\";s:19:\"home_title_location\";s:4:\"left\";s:17:\"homepage_og_title\";s:0:\"\";s:23:\"homepage_og_description\";s:0:\"\";s:22:\"homepage_twitter_title\";s:0:\"\";s:28:\"homepage_twitter_description\";s:0:\"\";s:25:\"homepage_social_image_url\";s:0:\"\";s:24:\"homepage_social_image_id\";i:0;s:13:\"shortlink_tag\";i:0;s:15:\"prev_next_posts\";i:1;s:18:\"prev_next_archives\";i:1;s:19:\"prev_next_frontpage\";i:1;s:18:\"facebook_publisher\";s:0:\"\";s:15:\"facebook_author\";s:0:\"\";s:14:\"facebook_appid\";s:0:\"\";s:17:\"post_publish_time\";i:1;s:16:\"post_modify_time\";i:1;s:12:\"twitter_card\";s:19:\"summary_large_image\";s:12:\"twitter_site\";s:0:\"\";s:15:\"twitter_creator\";s:0:\"\";s:7:\"og_tags\";i:1;s:13:\"facebook_tags\";i:1;s:12:\"twitter_tags\";i:1;s:19:\"social_image_fb_url\";s:0:\"\";s:18:\"social_image_fb_id\";i:0;s:19:\"google_verification\";s:0:\"\";s:17:\"bing_verification\";s:0:\"\";s:19:\"yandex_verification\";s:0:\"\";s:17:\"pint_verification\";s:0:\"\";s:16:\"knowledge_output\";i:1;s:14:\"knowledge_type\";s:12:\"organization\";s:14:\"knowledge_logo\";i:1;s:14:\"knowledge_name\";s:0:\"\";s:18:\"knowledge_logo_url\";s:0:\"\";s:17:\"knowledge_logo_id\";i:0;s:18:\"knowledge_facebook\";s:0:\"\";s:17:\"knowledge_twitter\";s:0:\"\";s:15:\"knowledge_gplus\";s:0:\"\";s:19:\"knowledge_instagram\";s:0:\"\";s:17:\"knowledge_youtube\";s:0:\"\";s:18:\"knowledge_linkedin\";s:0:\"\";s:19:\"knowledge_pinterest\";s:0:\"\";s:20:\"knowledge_soundcloud\";s:0:\"\";s:16:\"knowledge_tumblr\";s:0:\"\";s:15:\"sitemaps_output\";i:1;s:19:\"sitemap_query_limit\";i:1200;s:17:\"sitemaps_modified\";i:1;s:17:\"sitemaps_priority\";i:0;s:15:\"sitemaps_robots\";i:1;s:11:\"ping_google\";i:1;s:9:\"ping_bing\";i:1;s:14:\"sitemap_styles\";i:1;s:12:\"sitemap_logo\";i:1;s:18:\"sitemap_color_main\";s:3:\"333\";s:20:\"sitemap_color_accent\";s:6:\"00cd98\";s:16:\"excerpt_the_feed\";i:1;s:15:\"source_the_feed\";i:1;s:17:\"ld_json_searchbox\";i:1;s:19:\"ld_json_breadcrumbs\";i:1;}', 'no'),
(197, 'the_seo_framework_upgraded_db_version', '3104', 'yes'),
(198, 'get_settings_option', 'a:11:{s:10:\"width_wrjs\";s:3:\"960\";s:12:\"caption_wrjs\";s:3:\"yes\";s:11:\"height_wrjs\";s:3:\"350\";s:11:\"effect_wrjs\";s:5:\"slide\";s:14:\"direction_wrjs\";s:8:\"vertical\";s:9:\"post_wrjs\";s:6:\"vslide\";s:10:\"delay_wrjs\";s:4:\"5000\";s:13:\"duration_wrjs\";s:3:\"600\";s:19:\"show_panel_nav_wrjs\";s:1:\"1\";s:10:\"start_wrjs\";i:1;s:17:\"pauseOnHover_wrjs\";s:1:\"1\";}', 'yes'),
(201, 'jetpack_activated', '1', 'yes'),
(204, 'jetpack_activation_source', 'a:2:{i:0;s:4:\"list\";i:1;N;}', 'yes'),
(205, 'jetpack_options', 'a:3:{s:7:\"version\";s:16:\"7.3.1:1628513566\";s:11:\"old_version\";s:16:\"7.3.1:1628513566\";s:28:\"fallback_no_verify_ssl_certs\";i:0;}', 'yes'),
(206, 'jetpack_sync_settings_disable', '0', 'yes'),
(207, 'jetpack_testimonial', '0', 'yes'),
(209, 'do_activate', '0', 'yes'),
(215, 'widget_akismet_widget', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(272, '_transient_health-check-site-status-result', '{\"good\":12,\"recommended\":5,\"critical\":2}', 'yes'),
(276, '_site_transient_timeout_theme_roots', '1660654701', 'no'),
(277, '_site_transient_theme_roots', 'a:6:{s:10:\"blankslate\";s:7:\"/themes\";s:16:\"kazan_museumtour\";s:7:\"/themes\";s:18:\"sample_underscores\";s:7:\"/themes\";s:14:\"twentynineteen\";s:7:\"/themes\";s:12:\"twentytwenty\";s:7:\"/themes\";s:15:\"twentytwentyone\";s:7:\"/themes\";}', 'no');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `wp_postmeta`
--

CREATE TABLE `wp_postmeta` (
  `meta_id` bigint(20) UNSIGNED NOT NULL,
  `post_id` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `meta_key` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_value` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- A tábla adatainak kiíratása `wp_postmeta`
--

INSERT INTO `wp_postmeta` (`meta_id`, `post_id`, `meta_key`, `meta_value`) VALUES
(1, 2, '_wp_page_template', 'default'),
(2, 3, '_wp_page_template', 'default'),
(5, 2, '_edit_lock', '1628508823:1'),
(6, 2, '_edit_last', '1'),
(9, 10, '_edit_lock', '1628517696:1'),
(10, 10, '_edit_last', '1'),
(11, 11, '_wp_attached_file', '2021/08/soviet-lifestyle-museum-4.jpg'),
(12, 11, '_wp_attachment_metadata', 'a:5:{s:5:\"width\";i:1050;s:6:\"height\";i:660;s:4:\"file\";s:37:\"2021/08/soviet-lifestyle-museum-4.jpg\";s:5:\"sizes\";a:0:{}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),
(14, 10, '_thumbnail_id', '11'),
(15, 1, '_edit_last', '1'),
(16, 1, '_edit_lock', '1628509227:1'),
(17, 15, '_edit_lock', '1628509319:1'),
(18, 17, '_edit_lock', '1628514464:1'),
(23, 21, '_edit_lock', '1628517553:1'),
(24, 21, '_edit_last', '1'),
(25, 22, '_wp_attached_file', '2021/08/national-museum-of-the-republic-of-tatarstan-2.jpg'),
(26, 22, '_wp_attachment_metadata', 'a:5:{s:5:\"width\";i:1086;s:6:\"height\";i:724;s:4:\"file\";s:58:\"2021/08/national-museum-of-the-republic-of-tatarstan-2.jpg\";s:5:\"sizes\";a:0:{}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),
(27, 21, '_thumbnail_id', '22'),
(31, 28, '_edit_lock', '1628517552:1'),
(32, 28, '_edit_last', '1'),
(33, 29, '_wp_attached_file', '2021/08/museum-of-islamic-culture-3.jpg'),
(34, 29, '_wp_attachment_metadata', 'a:5:{s:5:\"width\";i:1470;s:6:\"height\";i:1103;s:4:\"file\";s:39:\"2021/08/museum-of-islamic-culture-3.jpg\";s:5:\"sizes\";a:0:{}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),
(35, 30, '_wp_attached_file', '2021/08/museum-of-national-culture-1.jpg'),
(36, 30, '_wp_attachment_metadata', 'a:5:{s:5:\"width\";i:1632;s:6:\"height\";i:918;s:4:\"file\";s:40:\"2021/08/museum-of-national-culture-1.jpg\";s:5:\"sizes\";a:0:{}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),
(37, 28, '_thumbnail_id', '30'),
(38, 32, '_edit_lock', '1628517645:1'),
(39, 32, '_edit_last', '1'),
(40, 33, '_wp_attached_file', '2021/08/chak-chak-museum-2.png'),
(41, 33, '_wp_attachment_metadata', 'a:5:{s:5:\"width\";i:1024;s:6:\"height\";i:726;s:4:\"file\";s:30:\"2021/08/chak-chak-museum-2.png\";s:5:\"sizes\";a:0:{}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),
(42, 32, '_thumbnail_id', '33'),
(53, 37, '_menu_item_type', 'post_type'),
(54, 37, '_menu_item_menu_item_parent', '0'),
(55, 37, '_menu_item_object_id', '15'),
(56, 37, '_menu_item_object', 'page'),
(57, 37, '_menu_item_target', ''),
(58, 37, '_menu_item_classes', 'a:1:{i:0;s:0:\"\";}'),
(59, 37, '_menu_item_xfn', ''),
(60, 37, '_menu_item_url', ''),
(61, 37, '_menu_item_orphaned', '1628510119'),
(62, 38, '_menu_item_type', 'taxonomy'),
(63, 38, '_menu_item_menu_item_parent', '0'),
(64, 38, '_menu_item_object_id', '3'),
(65, 38, '_menu_item_object', 'category'),
(66, 38, '_menu_item_target', ''),
(67, 38, '_menu_item_classes', 'a:1:{i:0;s:0:\"\";}'),
(68, 38, '_menu_item_xfn', ''),
(69, 38, '_menu_item_url', ''),
(71, 39, '_menu_item_type', 'custom'),
(72, 39, '_menu_item_menu_item_parent', '0'),
(73, 39, '_menu_item_object_id', '39'),
(74, 39, '_menu_item_object', 'custom'),
(75, 39, '_menu_item_target', ''),
(76, 39, '_menu_item_classes', 'a:1:{i:0;s:0:\"\";}'),
(77, 39, '_menu_item_xfn', ''),
(78, 39, '_menu_item_url', '#'),
(89, 41, '_wp_attached_file', '2021/08/Destination-Kazan.jpg'),
(90, 41, '_wp_attachment_metadata', 'a:5:{s:5:\"width\";i:1280;s:6:\"height\";i:550;s:4:\"file\";s:29:\"2021/08/Destination-Kazan.jpg\";s:5:\"sizes\";a:0:{}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"1\";s:8:\"keywords\";a:0:{}}}'),
(94, 46, '_menu_item_type', 'post_type'),
(95, 46, '_menu_item_menu_item_parent', '39'),
(96, 46, '_menu_item_object_id', '32'),
(97, 46, '_menu_item_object', 'page'),
(98, 46, '_menu_item_target', ''),
(99, 46, '_menu_item_classes', 'a:1:{i:0;s:0:\"\";}'),
(100, 46, '_menu_item_xfn', ''),
(101, 46, '_menu_item_url', ''),
(103, 47, '_menu_item_type', 'post_type'),
(104, 47, '_menu_item_menu_item_parent', '39'),
(105, 47, '_menu_item_object_id', '28'),
(106, 47, '_menu_item_object', 'page'),
(107, 47, '_menu_item_target', ''),
(108, 47, '_menu_item_classes', 'a:1:{i:0;s:0:\"\";}'),
(109, 47, '_menu_item_xfn', ''),
(110, 47, '_menu_item_url', ''),
(112, 48, '_menu_item_type', 'post_type'),
(113, 48, '_menu_item_menu_item_parent', '39'),
(114, 48, '_menu_item_object_id', '21'),
(115, 48, '_menu_item_object', 'page'),
(116, 48, '_menu_item_target', ''),
(117, 48, '_menu_item_classes', 'a:1:{i:0;s:0:\"\";}'),
(118, 48, '_menu_item_xfn', ''),
(119, 48, '_menu_item_url', ''),
(121, 49, '_menu_item_type', 'post_type'),
(122, 49, '_menu_item_menu_item_parent', '39'),
(123, 49, '_menu_item_object_id', '10'),
(124, 49, '_menu_item_object', 'page'),
(125, 49, '_menu_item_target', ''),
(126, 49, '_menu_item_classes', 'a:1:{i:0;s:0:\"\";}'),
(127, 49, '_menu_item_xfn', ''),
(128, 49, '_menu_item_url', ''),
(130, 50, '_edit_lock', '1628516046:1'),
(139, 55, '_wp_attached_file', '2021/08/kzn-1.jpg'),
(140, 55, '_wp_attachment_metadata', 'a:5:{s:5:\"width\";i:1904;s:6:\"height\";i:824;s:4:\"file\";s:17:\"2021/08/kzn-1.jpg\";s:5:\"sizes\";a:0:{}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:37:\"This content is subject to copyright.\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),
(141, 57, '_wp_attached_file', '2021/08/kzn-1-1.jpg'),
(142, 57, '_wp_attachment_metadata', 'a:5:{s:5:\"width\";i:1904;s:6:\"height\";i:824;s:4:\"file\";s:19:\"2021/08/kzn-1-1.jpg\";s:5:\"sizes\";a:0:{}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:37:\"This content is subject to copyright.\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),
(143, 58, '_wp_attached_file', '2021/08/kzn-2.jpg'),
(144, 58, '_wp_attachment_metadata', 'a:5:{s:5:\"width\";i:1904;s:6:\"height\";i:824;s:4:\"file\";s:17:\"2021/08/kzn-2.jpg\";s:5:\"sizes\";a:0:{}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:11:\"yulenochekk\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),
(145, 59, '_wp_attached_file', '2021/08/kzn-3.jpg'),
(146, 59, '_wp_attachment_metadata', 'a:5:{s:5:\"width\";i:1904;s:6:\"height\";i:824;s:4:\"file\";s:17:\"2021/08/kzn-3.jpg\";s:5:\"sizes\";a:0:{}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:37:\"This content is subject to copyright.\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),
(147, 60, '_wp_attached_file', '2021/08/kzn-4.jpg'),
(148, 60, '_wp_attachment_metadata', 'a:5:{s:5:\"width\";i:1904;s:6:\"height\";i:824;s:4:\"file\";s:17:\"2021/08/kzn-4.jpg\";s:5:\"sizes\";a:0:{}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:37:\"This content is subject to copyright.\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),
(154, 63, '_menu_item_type', 'custom'),
(155, 63, '_menu_item_menu_item_parent', '0'),
(156, 63, '_menu_item_object_id', '63'),
(157, 63, '_menu_item_object', 'custom'),
(158, 63, '_menu_item_target', ''),
(159, 63, '_menu_item_classes', 'a:1:{i:0;s:0:\"\";}'),
(160, 63, '_menu_item_xfn', ''),
(161, 63, '_menu_item_url', 'http://localhost/day1/cms/'),
(163, 64, '_edit_lock', '1628516057:1'),
(170, 66, '_edit_lock', '1628516104:1'),
(175, 68, '_menu_item_type', 'custom'),
(176, 68, '_menu_item_menu_item_parent', '0'),
(177, 68, '_menu_item_object_id', '68'),
(178, 68, '_menu_item_object', 'custom'),
(179, 68, '_menu_item_target', ''),
(180, 68, '_menu_item_classes', 'a:1:{i:0;s:0:\"\";}'),
(181, 68, '_menu_item_xfn', ''),
(182, 68, '_menu_item_url', '#'),
(184, 69, '_menu_item_type', 'custom'),
(185, 69, '_menu_item_menu_item_parent', '0'),
(186, 69, '_menu_item_object_id', '69'),
(187, 69, '_menu_item_object', 'custom'),
(188, 69, '_menu_item_target', ''),
(189, 69, '_menu_item_classes', 'a:1:{i:0;s:0:\"\";}'),
(190, 69, '_menu_item_xfn', ''),
(191, 69, '_menu_item_url', '#'),
(193, 70, '_menu_item_type', 'custom'),
(194, 70, '_menu_item_menu_item_parent', '0'),
(195, 70, '_menu_item_object_id', '70'),
(196, 70, '_menu_item_object', 'custom'),
(197, 70, '_menu_item_target', ''),
(198, 70, '_menu_item_classes', 'a:1:{i:0;s:0:\"\";}'),
(199, 70, '_menu_item_xfn', ''),
(200, 70, '_menu_item_url', '#'),
(206, 74, '_edit_lock', '1628517322:1'),
(207, 78, '_edit_lock', '1628517965:1'),
(208, 78, '_edit_last', '1'),
(209, 32, 'museum_news_category', '7'),
(210, 32, '_museum_news_category', 'field_611133f73260a'),
(211, 80, 'museum_news_category', '7'),
(212, 80, '_museum_news_category', 'field_611133f73260a'),
(213, 28, 'museum_news_category', '6'),
(214, 28, '_museum_news_category', 'field_611133f73260a'),
(215, 81, 'museum_news_category', '6'),
(216, 81, '_museum_news_category', 'field_611133f73260a'),
(217, 21, 'museum_news_category', '5'),
(218, 21, '_museum_news_category', 'field_611133f73260a'),
(219, 82, 'museum_news_category', '5'),
(220, 82, '_museum_news_category', 'field_611133f73260a'),
(221, 10, 'museum_news_category', '4'),
(222, 10, '_museum_news_category', 'field_611133f73260a'),
(223, 83, 'museum_news_category', '4'),
(224, 83, '_museum_news_category', 'field_611133f73260a');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `wp_posts`
--

CREATE TABLE `wp_posts` (
  `ID` bigint(20) UNSIGNED NOT NULL,
  `post_author` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `post_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_date_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_content` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `post_title` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `post_excerpt` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `post_status` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'publish',
  `comment_status` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'open',
  `ping_status` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'open',
  `post_password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `post_name` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `to_ping` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `pinged` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `post_modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_modified_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_content_filtered` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `post_parent` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `guid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `menu_order` int(11) NOT NULL DEFAULT 0,
  `post_type` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'post',
  `post_mime_type` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `comment_count` bigint(20) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- A tábla adatainak kiíratása `wp_posts`
--

INSERT INTO `wp_posts` (`ID`, `post_author`, `post_date`, `post_date_gmt`, `post_content`, `post_title`, `post_excerpt`, `post_status`, `comment_status`, `ping_status`, `post_password`, `post_name`, `to_ping`, `pinged`, `post_modified`, `post_modified_gmt`, `post_content_filtered`, `post_parent`, `guid`, `menu_order`, `post_type`, `post_mime_type`, `comment_count`) VALUES
(1, 1, '2021-08-09 11:06:13', '2021-08-09 11:06:13', '<!-- wp:paragraph -->\n<p>Welcome to WordPress. This is your first post. Edit or delete it, then start writing!</p>\n<!-- /wp:paragraph -->', 'Hello world!', '', 'draft', 'open', 'open', '', 'hello-world', '', '', '2021-08-09 11:40:27', '2021-08-09 11:40:27', '', 0, 'http://localhost/day1/cms/?p=1', 0, 'post', '', 0),
(2, 1, '2021-08-09 11:06:13', '2021-08-09 11:06:13', '<!-- wp:paragraph -->\n<p>This is an example page. It\'s different from a blog post because it will stay in one place and will show up in your site navigation (in most themes). Most people start with an About page that introduces them to potential site visitors. It might say something like this:</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:quote -->\n<blockquote class=\"wp-block-quote\"><p>Hi there! I\'m a bike messenger by day, aspiring actor by night, and this is my website. I live in Los Angeles, have a great dog named Jack, and I like pi&#241;a coladas. (And gettin\' caught in the rain.)</p></blockquote>\n<!-- /wp:quote -->\n\n<!-- wp:paragraph -->\n<p>...or something like this:</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:quote -->\n<blockquote class=\"wp-block-quote\"><p>The XYZ Doohickey Company was founded in 1971, and has been providing quality doohickeys to the public ever since. Located in Gotham City, XYZ employs over 2,000 people and does all kinds of awesome things for the Gotham community.</p></blockquote>\n<!-- /wp:quote -->\n\n<!-- wp:paragraph -->\n<p>As a new WordPress user, you should go to <a href=\"http://localhost/day1/cms/wp-admin/\">your dashboard</a> to delete this page and create new pages for your content. Have fun!</p>\n<!-- /wp:paragraph -->', 'Sample Page', '', 'draft', 'closed', 'closed', '', 'sample-page', '', '', '2021-08-09 11:33:43', '2021-08-09 11:33:43', '', 0, 'http://localhost/day1/cms/?page_id=2', 0, 'page', '', 0),
(3, 1, '2021-08-09 11:06:13', '2021-08-09 11:06:13', '<!-- wp:heading --><h2>Who we are</h2><!-- /wp:heading --><!-- wp:paragraph --><p><strong class=\"privacy-policy-tutorial\">Suggested text: </strong>Our website address is: http://localhost/day1/cms.</p><!-- /wp:paragraph --><!-- wp:heading --><h2>Comments</h2><!-- /wp:heading --><!-- wp:paragraph --><p><strong class=\"privacy-policy-tutorial\">Suggested text: </strong>When visitors leave comments on the site we collect the data shown in the comments form, and also the visitor&#8217;s IP address and browser user agent string to help spam detection.</p><!-- /wp:paragraph --><!-- wp:paragraph --><p>An anonymized string created from your email address (also called a hash) may be provided to the Gravatar service to see if you are using it. The Gravatar service privacy policy is available here: https://automattic.com/privacy/. After approval of your comment, your profile picture is visible to the public in the context of your comment.</p><!-- /wp:paragraph --><!-- wp:heading --><h2>Media</h2><!-- /wp:heading --><!-- wp:paragraph --><p><strong class=\"privacy-policy-tutorial\">Suggested text: </strong>If you upload images to the website, you should avoid uploading images with embedded location data (EXIF GPS) included. Visitors to the website can download and extract any location data from images on the website.</p><!-- /wp:paragraph --><!-- wp:heading --><h2>Cookies</h2><!-- /wp:heading --><!-- wp:paragraph --><p><strong class=\"privacy-policy-tutorial\">Suggested text: </strong>If you leave a comment on our site you may opt-in to saving your name, email address and website in cookies. These are for your convenience so that you do not have to fill in your details again when you leave another comment. These cookies will last for one year.</p><!-- /wp:paragraph --><!-- wp:paragraph --><p>If you visit our login page, we will set a temporary cookie to determine if your browser accepts cookies. This cookie contains no personal data and is discarded when you close your browser.</p><!-- /wp:paragraph --><!-- wp:paragraph --><p>When you log in, we will also set up several cookies to save your login information and your screen display choices. Login cookies last for two days, and screen options cookies last for a year. If you select &quot;Remember Me&quot;, your login will persist for two weeks. If you log out of your account, the login cookies will be removed.</p><!-- /wp:paragraph --><!-- wp:paragraph --><p>If you edit or publish an article, an additional cookie will be saved in your browser. This cookie includes no personal data and simply indicates the post ID of the article you just edited. It expires after 1 day.</p><!-- /wp:paragraph --><!-- wp:heading --><h2>Embedded content from other websites</h2><!-- /wp:heading --><!-- wp:paragraph --><p><strong class=\"privacy-policy-tutorial\">Suggested text: </strong>Articles on this site may include embedded content (e.g. videos, images, articles, etc.). Embedded content from other websites behaves in the exact same way as if the visitor has visited the other website.</p><!-- /wp:paragraph --><!-- wp:paragraph --><p>These websites may collect data about you, use cookies, embed additional third-party tracking, and monitor your interaction with that embedded content, including tracking your interaction with the embedded content if you have an account and are logged in to that website.</p><!-- /wp:paragraph --><!-- wp:heading --><h2>Who we share your data with</h2><!-- /wp:heading --><!-- wp:paragraph --><p><strong class=\"privacy-policy-tutorial\">Suggested text: </strong>If you request a password reset, your IP address will be included in the reset email.</p><!-- /wp:paragraph --><!-- wp:heading --><h2>How long we retain your data</h2><!-- /wp:heading --><!-- wp:paragraph --><p><strong class=\"privacy-policy-tutorial\">Suggested text: </strong>If you leave a comment, the comment and its metadata are retained indefinitely. This is so we can recognize and approve any follow-up comments automatically instead of holding them in a moderation queue.</p><!-- /wp:paragraph --><!-- wp:paragraph --><p>For users that register on our website (if any), we also store the personal information they provide in their user profile. All users can see, edit, or delete their personal information at any time (except they cannot change their username). Website administrators can also see and edit that information.</p><!-- /wp:paragraph --><!-- wp:heading --><h2>What rights you have over your data</h2><!-- /wp:heading --><!-- wp:paragraph --><p><strong class=\"privacy-policy-tutorial\">Suggested text: </strong>If you have an account on this site, or have left comments, you can request to receive an exported file of the personal data we hold about you, including any data you have provided to us. You can also request that we erase any personal data we hold about you. This does not include any data we are obliged to keep for administrative, legal, or security purposes.</p><!-- /wp:paragraph --><!-- wp:heading --><h2>Where we send your data</h2><!-- /wp:heading --><!-- wp:paragraph --><p><strong class=\"privacy-policy-tutorial\">Suggested text: </strong>Visitor comments may be checked through an automated spam detection service.</p><!-- /wp:paragraph -->', 'Privacy Policy', '', 'draft', 'closed', 'open', '', 'privacy-policy', '', '', '2021-08-09 11:06:13', '2021-08-09 11:06:13', '', 0, 'http://localhost/day1/cms/?page_id=3', 0, 'page', '', 0),
(7, 1, '2021-08-09 11:33:43', '2021-08-09 11:33:43', '<!-- wp:paragraph -->\n<p>This is an example page. It\'s different from a blog post because it will stay in one place and will show up in your site navigation (in most themes). Most people start with an About page that introduces them to potential site visitors. It might say something like this:</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:quote -->\n<blockquote class=\"wp-block-quote\"><p>Hi there! I\'m a bike messenger by day, aspiring actor by night, and this is my website. I live in Los Angeles, have a great dog named Jack, and I like pi&#241;a coladas. (And gettin\' caught in the rain.)</p></blockquote>\n<!-- /wp:quote -->\n\n<!-- wp:paragraph -->\n<p>...or something like this:</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:quote -->\n<blockquote class=\"wp-block-quote\"><p>The XYZ Doohickey Company was founded in 1971, and has been providing quality doohickeys to the public ever since. Located in Gotham City, XYZ employs over 2,000 people and does all kinds of awesome things for the Gotham community.</p></blockquote>\n<!-- /wp:quote -->\n\n<!-- wp:paragraph -->\n<p>As a new WordPress user, you should go to <a href=\"http://localhost/day1/cms/wp-admin/\">your dashboard</a> to delete this page and create new pages for your content. Have fun!</p>\n<!-- /wp:paragraph -->', 'Sample Page', '', 'inherit', 'closed', 'closed', '', '2-revision-v1', '', '', '2021-08-09 11:33:43', '2021-08-09 11:33:43', '', 2, 'http://localhost/day1/cms/?p=7', 0, 'revision', '', 0),
(10, 1, '2021-08-09 11:39:43', '2021-08-09 11:39:43', 'The State Russian Museum (Russian: Государственный Русский музей), formerly the Russian Museum of His Imperial Majesty Alexander III (Russian: Русский Музей Императора Александра III), located on Arts Square in Saint Petersburg, is the world\'s largest depository of Russian fine art. It is also one of the largest museums in the country.\n\nA unique place where every visitor can take a trip into the forgotten Soviet past. The Soviet Lifestyle Museum is located in an authentic Soviet \"kommunalka\" or in English, \"communal apartment\" with brick walls, old wiring and cast-iron wall heaters. Exhibitions here carry titles relevant to the museum: \"USSR in Space\", \"Toys: Made in the USSR\", \"Bad Habits in the USSR\", \"The Rock and Roll Hall of Fame\" and others. The museum’s main goal is to evoke a feeling of pleasant nostalgia and positive emotions among its visitors as they look through items of a bygone era. Exhibits are not chosen based on any particular special value (although among them, some are quite valuable and even rare); the most important thing here is the history and emotions that each item brings to visitors who may or may not have experienced the heyday of the not-so-distant-past era.\n\n<strong>Creation</strong>\n\nThe museum was established on April 13, 1895, upon enthronement of Nicholas II to commemorate his father, Alexander III. Its original collection was composed of artworks taken from the Hermitage Museum, Alexander Palace, and the Imperial Academy of Arts. After the Russian Revolution of 1917, many private collections were nationalized and relocated to the Russian Museum. These included Kazimir Malevich\'s Black Square.', 'Soviet Lifestyle Museum', '', 'publish', 'closed', 'open', '', 'soviet-lifestyle-museum', '', '', '2021-08-09 14:01:35', '2021-08-09 14:01:35', '', 0, 'http://localhost/day1/cms/?post_type=museum&#038;p=10', 0, 'page', '', 0),
(11, 1, '2021-08-09 11:38:01', '2021-08-09 11:38:01', '', 'soviet-lifestyle-museum-4', '', 'inherit', 'open', 'closed', '', 'soviet-lifestyle-museum-4', '', '', '2021-08-09 11:38:01', '2021-08-09 11:38:01', '', 10, 'http://localhost/day1/cms/wp-content/uploads/2021/08/soviet-lifestyle-museum-4.jpg', 0, 'attachment', 'image/jpeg', 0),
(13, 1, '2021-08-09 11:39:43', '2021-08-09 11:39:43', 'The State Russian Museum (Russian: Государственный Русский музей), formerly the Russian Museum of His Imperial Majesty Alexander III (Russian: Русский Музей Императора Александра III), located on Arts Square in Saint Petersburg, is the world\'s largest depository of Russian fine art. It is also one of the largest museums in the country.\r\n\r\nA unique place where every visitor can take a trip into the forgotten Soviet past. The Soviet Lifestyle Museum is located in an authentic Soviet \"kommunalka\" or in English, \"communal apartment\" with brick walls, old wiring and cast-iron wall heaters. Exhibitions here carry titles relevant to the museum: \"USSR in Space\", \"Toys: Made in the USSR\", \"Bad Habits in the USSR\", \"The Rock and Roll Hall of Fame\" and others. The museum’s main goal is to evoke a feeling of pleasant nostalgia and positive emotions among its visitors as they look through items of a bygone era. Exhibits are not chosen based on any particular special value (although among them, some are quite valuable and even rare); the most important thing here is the history and emotions that each item brings to visitors who may or may not have experienced the heyday of the not-so-distant-past era.\r\n\r\n<strong>Creation</strong>\r\n\r\nThe museum was established on April 13, 1895, upon enthronement of Nicholas II to commemorate his father, Alexander III. Its original collection was composed of artworks taken from the Hermitage Museum, Alexander Palace, and the Imperial Academy of Arts. After the Russian Revolution of 1917, many private collections were nationalized and relocated to the Russian Museum. These included Kazimir Malevich\'s Black Square.', 'Soviet Lifestyle Museum', '', 'inherit', 'closed', 'closed', '', '10-revision-v1', '', '', '2021-08-09 11:39:43', '2021-08-09 11:39:43', '', 10, 'http://localhost/day1/cms/?p=13', 0, 'revision', '', 0),
(14, 1, '2021-08-09 11:40:27', '2021-08-09 11:40:27', '<!-- wp:paragraph -->\n<p>Welcome to WordPress. This is your first post. Edit or delete it, then start writing!</p>\n<!-- /wp:paragraph -->', 'Hello world!', '', 'inherit', 'closed', 'closed', '', '1-revision-v1', '', '', '2021-08-09 11:40:27', '2021-08-09 11:40:27', '', 1, 'http://localhost/day1/cms/?p=14', 0, 'revision', '', 0),
(15, 1, '2021-08-09 11:41:40', '2021-08-09 11:41:40', '', 'News', '', 'publish', 'closed', 'closed', '', 'news', '', '', '2021-08-09 11:41:40', '2021-08-09 11:41:40', '', 0, 'http://localhost/day1/cms/?page_id=15', 0, 'page', '', 0),
(16, 1, '2021-08-09 11:41:40', '2021-08-09 11:41:40', '', 'News', '', 'inherit', 'closed', 'closed', '', '15-revision-v1', '', '', '2021-08-09 11:41:40', '2021-08-09 11:41:40', '', 15, 'http://localhost/day1/cms/?p=16', 0, 'revision', '', 0),
(17, 1, '2021-08-09 11:42:20', '2021-08-09 11:42:20', '', 'Homepage', '', 'publish', 'closed', 'closed', '', 'homepage', '', '', '2021-08-09 11:42:20', '2021-08-09 11:42:20', '', 0, 'http://localhost/day1/cms/?page_id=17', 0, 'page', '', 0),
(18, 1, '2021-08-09 11:42:20', '2021-08-09 11:42:20', '', 'Homepage', '', 'inherit', 'closed', 'closed', '', '17-revision-v1', '', '', '2021-08-09 11:42:20', '2021-08-09 11:42:20', '', 17, 'http://localhost/day1/cms/?p=18', 0, 'revision', '', 0),
(21, 1, '2021-08-09 11:45:21', '2021-08-09 11:45:21', 'The National Museum of the Republic of Tatarstan (NMRT) is the largest museum in Tatarstan. It was founded as a Kazan Town Scientific and Industrial Museum in 1894 and opened on April 5, 1895. The basis of the museum is a private collection of 40 thousandth items of Andrei Fedorovich Likhachev (1832-90), a well-known regional archaeologist, numismatist, collector also the exhibits of scientific and industrial exhibition in 1890. Well-known scientists of Kazan University stood at the roots of the establishment of the museum and of the museum\'s collections formation, such as: A.A. Stuckenberg, N.P. Zagoskin, P.I. Krotov, N.F. Vysotsky, N.F. Catania and others. The museum occupies the former building of Gostinniy dvor (guest house), a monument of architecture and history of Russian Federation and the Republic of Tatarstan.\nThere are over 800 thousand units in the museum\'s collection.\n\nNowadays the museum is in the process of reconstruction, the project of which provides creation of a permanent exhibition on the area of more than 6 000 sq.m. 2001, the Cabinet of Ministers of the Republic of Tatarstan approved the scientific concept of creation of exposition of NM RT in Gostiny Dvor building; consisting of three main parts: \"History of Tatarstan, from ancient times to present days,\" \"Nature and a Man\", \"Culture: the interaction of cultures of peoples of Tatarstan\". Now the museum has the following exhibitions: \"Ancient History of Tatarstan\", \"Money, trade and trade routes in the Middle Ages\", \"Tatar Golden Treasures,\" \"Kazan Province in the XVIII century\", there are also temporary exhibitions.', 'National Museum of the Republic of Tatarstan', '', 'publish', 'closed', 'open', '', 'national-museum-of-the-republic-of-tatarstan', '', '', '2021-08-09 14:01:25', '2021-08-09 14:01:25', '', 0, 'http://localhost/day1/cms/?post_type=museum&#038;p=21', 0, 'page', '', 0),
(22, 1, '2021-08-09 11:45:05', '2021-08-09 11:45:05', '', 'national-museum-of-the-republic-of-tatarstan-2', '', 'inherit', 'open', 'closed', '', 'national-museum-of-the-republic-of-tatarstan-2', '', '', '2021-08-09 11:45:05', '2021-08-09 11:45:05', '', 21, 'http://localhost/day1/cms/wp-content/uploads/2021/08/national-museum-of-the-republic-of-tatarstan-2.jpg', 0, 'attachment', 'image/jpeg', 0),
(23, 1, '2021-08-09 11:45:21', '2021-08-09 11:45:21', 'The National Museum of the Republic of Tatarstan (NMRT) is the largest museum in Tatarstan. It was founded as a Kazan Town Scientific and Industrial Museum in 1894 and opened on April 5, 1895. The basis of the museum is a private collection of 40 thousandth items of Andrei Fedorovich Likhachev (1832-90), a well-known regional archaeologist, numismatist, collector also the exhibits of scientific and industrial exhibition in 1890. Well-known scientists of Kazan University stood at the roots of the establishment of the museum and of the museum\'s collections formation, such as: A.A. Stuckenberg, N.P. Zagoskin, P.I. Krotov, N.F. Vysotsky, N.F. Catania and others. The museum occupies the former building of Gostinniy dvor (guest house), a monument of architecture and history of Russian Federation and the Republic of Tatarstan.\r\nThere are over 800 thousand units in the museum\'s collection.\r\n\r\nNowadays the museum is in the process of reconstruction, the project of which provides creation of a permanent exhibition on the area of more than 6 000 sq.m. 2001, the Cabinet of Ministers of the Republic of Tatarstan approved the scientific concept of creation of exposition of NM RT in Gostiny Dvor building; consisting of three main parts: \"History of Tatarstan, from ancient times to present days,\" \"Nature and a Man\", \"Culture: the interaction of cultures of peoples of Tatarstan\". Now the museum has the following exhibitions: \"Ancient History of Tatarstan\", \"Money, trade and trade routes in the Middle Ages\", \"Tatar Golden Treasures,\" \"Kazan Province in the XVIII century\", there are also temporary exhibitions.', 'National Museum of the Republic of Tatarstan', '', 'inherit', 'closed', 'closed', '', '21-revision-v1', '', '', '2021-08-09 11:45:21', '2021-08-09 11:45:21', '', 21, 'http://localhost/day1/cms/?p=23', 0, 'revision', '', 0),
(28, 1, '2021-08-09 11:51:15', '2021-08-09 11:51:15', 'The museum is located on the site of the original Aztec building that was a part of Moctezuma\'s \"New Palaces\" complex called the \"Casa Denegrida\" (Black House) by Spanish conquerors, who described it as a windowless room painted in black. In here, Moctezuma would meditate on what he was told by professional seers and shamans.[3] During the Conquest, this Black House, along with the rest of Moctezuma\'s New Palaces was nearly destroyed.[4] This site was part of lands given to Hernán Cortés by the Spanish Crown as a reward for the conquest of Mexico,[5] and Cortés rebuilt the New Palaces/Black House complex in Spanish style, using much of the building materials of the old Aztec buildings.[4] Cortes’ son later inherited this palace, only to later sell it back to Felipe V in order to establish the vice-regal palace.[5]\nRecently, excavations here and next door at the National Palace have unearthed parts of a wall and a basalt floor believed to be part of the Black House. More excavations are planned.[3]\n\nThis colonial-era building was named a national monument in 1931,[2] but when the new Museum of Anthropology opened the site was left vacant. Beatriz Barba and Julio César Olivé proposed that the space be converted into a museum featuring world cultures.[8] After renovation, the building opened on 5 December 1965,[9] with Barba serving as its deputy director until 1976[10] as the Cultural Museum, with rooms dedicated to demonstrating cultural artifacts from around the world.[2] This museum dedicated to the world\'s past and present cultures is the only one of its type in Latin America.[11] The museum has sixteen permanent display rooms and three rooms for temporary exhibits. Some of the rooms are dedicated prehistoric cultures remains such as cave paintings and implements associated with the origins of sedentary, agricultural societies. Other rooms are devoted to ancient Mesopotamia as well as ancient Greece and Rome.\nIn the Age of Exploration room, items from the time of initial European contact with the Americas are on display. For modern cultures, there are exhibits from all continents and some dedicated to cultures little-known in Mexico such as that of Samoa or New Ireland.[5][12] Since its founding, the museum has received over 12,000 pieces from around the world. These pieces include textiles, glass objects, porcelain, photographs, arms, kimonos, masks, jewelry and sculptures. Many of these objects are originals and some are quite old. The museum still receives donations of objects. One of the most recent is of board inlaid with mother-of-pearl from Vietnam.[5]', 'Museum of National Culture', '', 'publish', 'closed', 'open', '', 'museum-of-national-culture', '', '', '2021-08-09 14:01:10', '2021-08-09 14:01:10', '', 0, 'http://localhost/day1/cms/?post_type=museum&#038;p=28', 0, 'page', '', 0),
(29, 1, '2021-08-09 11:50:41', '2021-08-09 11:50:41', '', 'museum-of-islamic-culture-3', '', 'inherit', 'open', 'closed', '', 'museum-of-islamic-culture-3', '', '', '2021-08-09 11:50:41', '2021-08-09 11:50:41', '', 28, 'http://localhost/day1/cms/wp-content/uploads/2021/08/museum-of-islamic-culture-3.jpg', 0, 'attachment', 'image/jpeg', 0),
(30, 1, '2021-08-09 11:51:12', '2021-08-09 11:51:12', '', 'museum-of-national-culture-1', '', 'inherit', 'open', 'closed', '', 'museum-of-national-culture-1', '', '', '2021-08-09 11:51:12', '2021-08-09 11:51:12', '', 28, 'http://localhost/day1/cms/wp-content/uploads/2021/08/museum-of-national-culture-1.jpg', 0, 'attachment', 'image/jpeg', 0),
(31, 1, '2021-08-09 11:51:15', '2021-08-09 11:51:15', 'The museum is located on the site of the original Aztec building that was a part of Moctezuma\'s \"New Palaces\" complex called the \"Casa Denegrida\" (Black House) by Spanish conquerors, who described it as a windowless room painted in black. In here, Moctezuma would meditate on what he was told by professional seers and shamans.[3] During the Conquest, this Black House, along with the rest of Moctezuma\'s New Palaces was nearly destroyed.[4] This site was part of lands given to Hernán Cortés by the Spanish Crown as a reward for the conquest of Mexico,[5] and Cortés rebuilt the New Palaces/Black House complex in Spanish style, using much of the building materials of the old Aztec buildings.[4] Cortes’ son later inherited this palace, only to later sell it back to Felipe V in order to establish the vice-regal palace.[5]\r\nRecently, excavations here and next door at the National Palace have unearthed parts of a wall and a basalt floor believed to be part of the Black House. More excavations are planned.[3]\r\n\r\nThis colonial-era building was named a national monument in 1931,[2] but when the new Museum of Anthropology opened the site was left vacant. Beatriz Barba and Julio César Olivé proposed that the space be converted into a museum featuring world cultures.[8] After renovation, the building opened on 5 December 1965,[9] with Barba serving as its deputy director until 1976[10] as the Cultural Museum, with rooms dedicated to demonstrating cultural artifacts from around the world.[2] This museum dedicated to the world\'s past and present cultures is the only one of its type in Latin America.[11] The museum has sixteen permanent display rooms and three rooms for temporary exhibits. Some of the rooms are dedicated prehistoric cultures remains such as cave paintings and implements associated with the origins of sedentary, agricultural societies. Other rooms are devoted to ancient Mesopotamia as well as ancient Greece and Rome.\r\nIn the Age of Exploration room, items from the time of initial European contact with the Americas are on display. For modern cultures, there are exhibits from all continents and some dedicated to cultures little-known in Mexico such as that of Samoa or New Ireland.[5][12] Since its founding, the museum has received over 12,000 pieces from around the world. These pieces include textiles, glass objects, porcelain, photographs, arms, kimonos, masks, jewelry and sculptures. Many of these objects are originals and some are quite old. The museum still receives donations of objects. One of the most recent is of board inlaid with mother-of-pearl from Vietnam.[5]', 'Museum of National Culture', '', 'inherit', 'closed', 'closed', '', '28-revision-v1', '', '', '2021-08-09 11:51:15', '2021-08-09 11:51:15', '', 28, 'http://localhost/day1/cms/?p=31', 0, 'revision', '', 0),
(32, 1, '2021-08-09 11:51:59', '2021-08-09 11:51:59', 'The Chak-Chak Museum is located within the historical Old Tatar Quarter complex. Inside the museum, in a homely atmosphere guests can drink fragrant tea from a samovar and taste Tatar desserts such as the traditional chak-chak, baursak and kak-tosh made from almonds, prepared using the recipe of Tatar enlightener Kayum Nasyri. While guests drink tea and sample desserts, the guides share stories and examples about the typical ancient Tatar peoples’ everyday life, traditions, customs, and of course, the secret to making the perfect chak-chak and other Tatar dishes.', 'Chak-Chak Museum', '', 'publish', 'closed', 'open', '', 'chak-chak-museum', '', '', '2021-08-09 13:57:24', '2021-08-09 13:57:24', '', 0, 'http://localhost/day1/cms/?post_type=museum&#038;p=32', 0, 'page', '', 0),
(33, 1, '2021-08-09 11:51:57', '2021-08-09 11:51:57', '', 'chak-chak-museum-2', '', 'inherit', 'open', 'closed', '', 'chak-chak-museum-2', '', '', '2021-08-09 11:51:57', '2021-08-09 11:51:57', '', 32, 'http://localhost/day1/cms/wp-content/uploads/2021/08/chak-chak-museum-2.png', 0, 'attachment', 'image/png', 0),
(34, 1, '2021-08-09 11:51:59', '2021-08-09 11:51:59', 'The Chak-Chak Museum is located within the historical Old Tatar Quarter complex. Inside the museum, in a homely atmosphere guests can drink fragrant tea from a samovar and taste Tatar desserts such as the traditional chak-chak, baursak and kak-tosh made from almonds, prepared using the recipe of Tatar enlightener Kayum Nasyri. While guests drink tea and sample desserts, the guides share stories and examples about the typical ancient Tatar peoples’ everyday life, traditions, customs, and of course, the secret to making the perfect chak-chak and other Tatar dishes.', 'Chak-Chak Museum', '', 'inherit', 'closed', 'closed', '', '32-revision-v1', '', '', '2021-08-09 11:51:59', '2021-08-09 11:51:59', '', 32, 'http://localhost/day1/cms/?p=34', 0, 'revision', '', 0),
(37, 1, '2021-08-09 11:55:19', '0000-00-00 00:00:00', ' ', '', '', 'draft', 'closed', 'closed', '', '', '', '', '2021-08-09 11:55:19', '0000-00-00 00:00:00', '', 0, 'http://localhost/day1/cms/?p=37', 1, 'nav_menu_item', '', 0),
(38, 1, '2021-08-09 13:24:35', '2021-08-09 11:56:09', ' ', '', '', 'publish', 'closed', 'closed', '', '38', '', '', '2021-08-09 13:24:35', '2021-08-09 13:24:35', '', 0, 'http://localhost/day1/cms/?p=38', 7, 'nav_menu_item', '', 0),
(39, 1, '2021-08-09 13:24:35', '2021-08-09 11:56:09', '', 'Museums', '', 'publish', 'closed', 'closed', '', 'museums', '', '', '2021-08-09 13:24:35', '2021-08-09 13:24:35', '', 0, 'http://localhost/day1/cms/?p=39', 2, 'nav_menu_item', '', 0),
(41, 1, '2021-08-09 12:06:55', '2021-08-09 12:06:55', '', 'Destination-Kazan', '', 'inherit', 'open', 'closed', '', 'destination-kazan', '', '', '2021-08-09 12:06:55', '2021-08-09 12:06:55', '', 0, 'http://localhost/day1/cms/wp-content/uploads/2021/08/Destination-Kazan.jpg', 0, 'attachment', 'image/jpeg', 0),
(46, 1, '2021-08-09 13:24:35', '2021-08-09 12:29:46', ' ', '', '', 'publish', 'closed', 'closed', '', '46', '', '', '2021-08-09 13:24:35', '2021-08-09 13:24:35', '', 0, 'http://localhost/day1/cms/?p=46', 3, 'nav_menu_item', '', 0),
(47, 1, '2021-08-09 13:24:35', '2021-08-09 12:29:46', ' ', '', '', 'publish', 'closed', 'closed', '', '47', '', '', '2021-08-09 13:24:35', '2021-08-09 13:24:35', '', 0, 'http://localhost/day1/cms/?p=47', 4, 'nav_menu_item', '', 0),
(48, 1, '2021-08-09 13:24:35', '2021-08-09 12:29:46', ' ', '', '', 'publish', 'closed', 'closed', '', '48', '', '', '2021-08-09 13:24:35', '2021-08-09 13:24:35', '', 0, 'http://localhost/day1/cms/?p=48', 5, 'nav_menu_item', '', 0),
(49, 1, '2021-08-09 13:24:35', '2021-08-09 12:29:46', ' ', '', '', 'publish', 'closed', 'closed', '', '49', '', '', '2021-08-09 13:24:35', '2021-08-09 13:24:35', '', 0, 'http://localhost/day1/cms/?p=49', 6, 'nav_menu_item', '', 0),
(50, 1, '2021-08-09 12:41:39', '2021-08-09 12:41:39', '<!-- wp:paragraph -->\n<p>Lorem Ipsum Dolor Sit Amet.  Lorem Ipsum Dolor Sit Amet.   Lorem Ipsum Dolor Sit Amet.   Lorem Ipsum Dolor Sit Amet.   Lorem Ipsum Dolor Sit Amet.   Lorem Ipsum Dolor Sit Amet.   Lorem Ipsum Dolor Sit Amet.   Lorem Ipsum Dolor Sit Amet.   Lorem Ipsum Dolor Sit Amet.   Lorem Ipsum Dolor Sit Amet.   Lorem Ipsum Dolor Sit Amet.   Lorem Ipsum Dolor Sit Amet.   Lorem Ipsum Dolor Sit Amet.   Lorem Ipsum Dolor Sit Amet.   Lorem Ipsum Dolor Sit Amet.   Lorem Ipsum Dolor Sit Amet.   Lorem Ipsum Dolor Sit Amet.   Lorem Ipsum Dolor Sit Amet.   Lorem Ipsum Dolor Sit Amet.   Lorem Ipsum Dolor Sit Amet.   Lorem Ipsum Dolor Sit Amet.   Lorem Ipsum Dolor Sit Amet.   Lorem Ipsum Dolor Sit Amet.  </p>\n<!-- /wp:paragraph -->', 'News about Chak-Chak museum', '', 'publish', 'closed', 'open', '', 'news-about-chak-chak-museum', '', '', '2021-08-09 13:23:52', '2021-08-09 13:23:52', '', 0, 'http://localhost/day1/cms/?p=50', 0, 'post', '', 0),
(51, 1, '2021-08-09 12:41:39', '2021-08-09 12:41:39', '<!-- wp:paragraph -->\n<p>Lorem Ipsum Dolor Sit Amet.  Lorem Ipsum Dolor Sit Amet.   Lorem Ipsum Dolor Sit Amet.   Lorem Ipsum Dolor Sit Amet.   Lorem Ipsum Dolor Sit Amet.   Lorem Ipsum Dolor Sit Amet.   Lorem Ipsum Dolor Sit Amet.   Lorem Ipsum Dolor Sit Amet.   Lorem Ipsum Dolor Sit Amet.   Lorem Ipsum Dolor Sit Amet.   Lorem Ipsum Dolor Sit Amet.   Lorem Ipsum Dolor Sit Amet.   Lorem Ipsum Dolor Sit Amet.   Lorem Ipsum Dolor Sit Amet.   Lorem Ipsum Dolor Sit Amet.   Lorem Ipsum Dolor Sit Amet.   Lorem Ipsum Dolor Sit Amet.   Lorem Ipsum Dolor Sit Amet.   Lorem Ipsum Dolor Sit Amet.   Lorem Ipsum Dolor Sit Amet.   Lorem Ipsum Dolor Sit Amet.   Lorem Ipsum Dolor Sit Amet.   Lorem Ipsum Dolor Sit Amet.  </p>\n<!-- /wp:paragraph -->', 'News about Chak-Chak museum', '', 'inherit', 'closed', 'closed', '', '50-revision-v1', '', '', '2021-08-09 12:41:39', '2021-08-09 12:41:39', '', 50, 'http://localhost/day1/cms/?p=51', 0, 'revision', '', 0),
(55, 1, '2021-08-09 12:47:24', '2021-08-09 12:47:24', '', 'kzn-1', '', 'inherit', 'open', 'closed', '', 'kzn-1', '', '', '2021-08-09 12:47:24', '2021-08-09 12:47:24', '', 0, 'http://localhost/day1/cms/wp-content/uploads/2021/08/kzn-1.jpg', 0, 'attachment', 'image/jpeg', 0),
(57, 1, '2021-08-09 12:55:07', '2021-08-09 12:55:07', '', 'kzn-1-1', '', 'inherit', 'open', 'closed', '', 'kzn-1-1', '', '', '2021-08-09 12:55:07', '2021-08-09 12:55:07', '', 0, 'http://localhost/day1/cms/wp-content/uploads/2021/08/kzn-1-1.jpg', 0, 'attachment', 'image/jpeg', 0),
(58, 1, '2021-08-09 12:55:08', '2021-08-09 12:55:08', '', 'kzn-2', '', 'inherit', 'open', 'closed', '', 'kzn-2', '', '', '2021-08-09 12:55:08', '2021-08-09 12:55:08', '', 0, 'http://localhost/day1/cms/wp-content/uploads/2021/08/kzn-2.jpg', 0, 'attachment', 'image/jpeg', 0),
(59, 1, '2021-08-09 12:55:08', '2021-08-09 12:55:08', '', 'kzn-3', '', 'inherit', 'open', 'closed', '', 'kzn-3', '', '', '2021-08-09 12:55:08', '2021-08-09 12:55:08', '', 0, 'http://localhost/day1/cms/wp-content/uploads/2021/08/kzn-3.jpg', 0, 'attachment', 'image/jpeg', 0),
(60, 1, '2021-08-09 12:55:09', '2021-08-09 12:55:09', '', 'kzn-4', '', 'inherit', 'open', 'closed', '', 'kzn-4', '', '', '2021-08-09 12:55:09', '2021-08-09 12:55:09', '', 0, 'http://localhost/day1/cms/wp-content/uploads/2021/08/kzn-4.jpg', 0, 'attachment', 'image/jpeg', 0),
(63, 1, '2021-08-09 13:24:35', '2021-08-09 13:10:52', '', 'Home', '', 'publish', 'closed', 'closed', '', 'home-2', '', '', '2021-08-09 13:24:35', '2021-08-09 13:24:35', '', 0, 'http://localhost/day1/cms/?p=63', 1, 'nav_menu_item', '', 0),
(64, 1, '2021-08-09 13:11:37', '2021-08-09 13:11:37', '<!-- wp:paragraph -->\n<p>Lorem Ipsum Dolor Sit Amet. Lorem Ipsum Dolor Sit Amet. Lorem Ipsum Dolor Sit Amet. Lorem Ipsum Dolor Sit Amet. Lorem Ipsum Dolor Sit Amet. Lorem Ipsum Dolor Sit Amet. Lorem Ipsum Dolor Sit Amet. Lorem Ipsum Dolor Sit Amet. Lorem Ipsum Dolor Sit Amet. Lorem Ipsum Dolor Sit Amet. Lorem Ipsum Dolor Sit Amet. Lorem Ipsum Dolor Sit Amet. Lorem Ipsum Dolor Sit Amet. Lorem Ipsum Dolor Sit Amet. Lorem Ipsum Dolor Sit Amet. Lorem Ipsum Dolor Sit Amet. Lorem Ipsum Dolor Sit Amet. Lorem Ipsum Dolor Sit Amet. Lorem Ipsum Dolor Sit Amet. Lorem Ipsum Dolor Sit Amet. Lorem Ipsum Dolor Sit Amet. Lorem Ipsum Dolor Sit Amet. Lorem Ipsum Dolor Sit Amet.</p>\n<!-- /wp:paragraph -->', 'News for National Museum', '', 'publish', 'closed', 'open', '', 'news-for-national-museum', '', '', '2021-08-09 13:23:49', '2021-08-09 13:23:49', '', 0, 'http://localhost/day1/cms/?p=64', 0, 'post', '', 0),
(65, 1, '2021-08-09 13:11:37', '2021-08-09 13:11:37', '<!-- wp:paragraph -->\n<p>Lorem Ipsum Dolor Sit Amet. Lorem Ipsum Dolor Sit Amet. Lorem Ipsum Dolor Sit Amet. Lorem Ipsum Dolor Sit Amet. Lorem Ipsum Dolor Sit Amet. Lorem Ipsum Dolor Sit Amet. Lorem Ipsum Dolor Sit Amet. Lorem Ipsum Dolor Sit Amet. Lorem Ipsum Dolor Sit Amet. Lorem Ipsum Dolor Sit Amet. Lorem Ipsum Dolor Sit Amet. Lorem Ipsum Dolor Sit Amet. Lorem Ipsum Dolor Sit Amet. Lorem Ipsum Dolor Sit Amet. Lorem Ipsum Dolor Sit Amet. Lorem Ipsum Dolor Sit Amet. Lorem Ipsum Dolor Sit Amet. Lorem Ipsum Dolor Sit Amet. Lorem Ipsum Dolor Sit Amet. Lorem Ipsum Dolor Sit Amet. Lorem Ipsum Dolor Sit Amet. Lorem Ipsum Dolor Sit Amet. Lorem Ipsum Dolor Sit Amet.</p>\n<!-- /wp:paragraph -->', 'News for National Museum', '', 'inherit', 'closed', 'closed', '', '64-revision-v1', '', '', '2021-08-09 13:11:37', '2021-08-09 13:11:37', '', 64, 'http://localhost/day1/cms/?p=65', 0, 'revision', '', 0),
(66, 1, '2021-08-09 13:25:24', '2021-08-09 13:25:24', '<!-- wp:paragraph -->\n<p>Coming Soon</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>Lorem lorem lorem. Ipsum amet. Lorem. Dolor sit.  Lorem lorem lorem. Ipsum amet. Lorem. Dolor sit.   Lorem lorem lorem. Ipsum amet. Lorem. Dolor sit.   Lorem lorem lorem. Ipsum amet. Lorem. Dolor sit. </p>\n<!-- /wp:paragraph -->', 'Seasonal Event 2021', '', 'publish', 'closed', 'open', '', 'seasonal-event-2021', '', '', '2021-08-09 13:37:27', '2021-08-09 13:37:27', '', 0, 'http://localhost/day1/cms/?p=66', 0, 'post', '', 0),
(67, 1, '2021-08-09 13:25:24', '2021-08-09 13:25:24', '<!-- wp:paragraph -->\n<p>Lorem Soon</p>\n<!-- /wp:paragraph -->', 'Seasonal Event 2021', '', 'inherit', 'closed', 'closed', '', '66-revision-v1', '', '', '2021-08-09 13:25:24', '2021-08-09 13:25:24', '', 66, 'http://localhost/day1/cms/?p=67', 0, 'revision', '', 0),
(68, 1, '2021-08-09 13:36:43', '2021-08-09 13:34:59', '', 'Twitter', '', 'publish', 'closed', 'closed', '', 'twitter', '', '', '2021-08-09 13:36:43', '2021-08-09 13:36:43', '', 0, 'http://localhost/day1/cms/?p=68', 1, 'nav_menu_item', '', 0),
(69, 1, '2021-08-09 13:36:43', '2021-08-09 13:34:59', '', 'Facebook', '', 'publish', 'closed', 'closed', '', 'facebook', '', '', '2021-08-09 13:36:43', '2021-08-09 13:36:43', '', 0, 'http://localhost/day1/cms/?p=69', 2, 'nav_menu_item', '', 0),
(70, 1, '2021-08-09 13:36:43', '2021-08-09 13:35:00', '', 'Instagram', '', 'publish', 'closed', 'closed', '', 'menu-item', '', '', '2021-08-09 13:36:43', '2021-08-09 13:36:43', '', 0, 'http://localhost/day1/cms/?p=70', 3, 'nav_menu_item', '', 0),
(71, 1, '2021-08-09 13:37:27', '2021-08-09 13:37:27', '<!-- wp:paragraph -->\n<p>Coming Soon</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>Lorem lorem lorem. Ipsum amet. Lorem. Dolor sit.  Lorem lorem lorem. Ipsum amet. Lorem. Dolor sit.   Lorem lorem lorem. Ipsum amet. Lorem. Dolor sit.   Lorem lorem lorem. Ipsum amet. Lorem. Dolor sit. </p>\n<!-- /wp:paragraph -->', 'Seasonal Event 2021', '', 'inherit', 'closed', 'closed', '', '66-revision-v1', '', '', '2021-08-09 13:37:27', '2021-08-09 13:37:27', '', 66, 'http://localhost/day1/cms/?p=71', 0, 'revision', '', 0),
(74, 1, '2021-08-09 13:49:48', '2021-08-09 13:49:48', '<!-- wp:shortcode -->\n[kazan_login]\n<!-- /wp:shortcode -->\n\n<!-- wp:paragraph -->\n<p></p>\n<!-- /wp:paragraph -->', 'Login', '', 'publish', 'closed', 'closed', '', 'admin', '', '', '2021-08-09 13:52:09', '2021-08-09 13:52:09', '', 0, 'http://localhost/day1/cms/?page_id=74', 0, 'page', '', 0),
(75, 1, '2021-08-09 13:49:48', '2021-08-09 13:49:48', '<!-- wp:shortcode -->\n[kazan_login]\n<!-- /wp:shortcode -->', 'Login', '', 'inherit', 'closed', 'closed', '', '74-revision-v1', '', '', '2021-08-09 13:49:48', '2021-08-09 13:49:48', '', 74, 'http://localhost/day1/cms/?p=75', 0, 'revision', '', 0),
(76, 1, '2021-08-09 13:50:29', '2021-08-09 13:50:29', '<!-- wp:shortcode -->\n[kazan_login]\n<!-- /wp:shortcode -->', 'Login', '', 'inherit', 'closed', 'closed', '', '74-autosave-v1', '', '', '2021-08-09 13:50:29', '2021-08-09 13:50:29', '', 74, 'http://localhost/day1/cms/?p=76', 0, 'revision', '', 0),
(77, 1, '2021-08-09 13:52:09', '2021-08-09 13:52:09', '<!-- wp:shortcode -->\n[kazan_login]\n<!-- /wp:shortcode -->\n\n<!-- wp:paragraph -->\n<p></p>\n<!-- /wp:paragraph -->', 'Login', '', 'inherit', 'closed', 'closed', '', '74-revision-v1', '', '', '2021-08-09 13:52:09', '2021-08-09 13:52:09', '', 74, 'http://localhost/day1/cms/?p=77', 0, 'revision', '', 0),
(78, 1, '2021-08-09 13:54:17', '2021-08-09 13:54:17', 'a:7:{s:8:\"location\";a:1:{i:0;a:1:{i:0;a:3:{s:5:\"param\";s:9:\"post_type\";s:8:\"operator\";s:2:\"==\";s:5:\"value\";s:4:\"page\";}}}s:8:\"position\";s:4:\"side\";s:5:\"style\";s:7:\"default\";s:15:\"label_placement\";s:3:\"top\";s:21:\"instruction_placement\";s:5:\"label\";s:14:\"hide_on_screen\";s:0:\"\";s:11:\"description\";s:0:\"\";}', 'Museum News Category', 'museum-news-category', 'publish', 'closed', 'closed', '', 'group_6111336e7ec6f', '', '', '2021-08-09 13:57:13', '2021-08-09 13:57:13', '', 0, 'http://localhost/day1/cms/?post_type=acf-field-group&#038;p=78', 0, 'acf-field-group', '', 0),
(79, 1, '2021-08-09 13:56:27', '2021-08-09 13:56:27', 'a:13:{s:4:\"type\";s:8:\"taxonomy\";s:12:\"instructions\";s:0:\"\";s:8:\"required\";i:0;s:17:\"conditional_logic\";i:0;s:7:\"wrapper\";a:3:{s:5:\"width\";s:0:\"\";s:5:\"class\";s:0:\"\";s:2:\"id\";s:0:\"\";}s:8:\"taxonomy\";s:8:\"category\";s:10:\"field_type\";s:6:\"select\";s:10:\"allow_null\";i:1;s:8:\"add_term\";i:0;s:10:\"save_terms\";i:0;s:10:\"load_terms\";i:0;s:13:\"return_format\";s:2:\"id\";s:8:\"multiple\";i:0;}', 'Museum News Category', 'museum_news_category', 'publish', 'closed', 'closed', '', 'field_611133f73260a', '', '', '2021-08-09 13:57:12', '2021-08-09 13:57:12', '', 78, 'http://localhost/day1/cms/?post_type=acf-field&#038;p=79', 0, 'acf-field', '', 0),
(80, 1, '2021-08-09 13:57:24', '2021-08-09 13:57:24', 'The Chak-Chak Museum is located within the historical Old Tatar Quarter complex. Inside the museum, in a homely atmosphere guests can drink fragrant tea from a samovar and taste Tatar desserts such as the traditional chak-chak, baursak and kak-tosh made from almonds, prepared using the recipe of Tatar enlightener Kayum Nasyri. While guests drink tea and sample desserts, the guides share stories and examples about the typical ancient Tatar peoples’ everyday life, traditions, customs, and of course, the secret to making the perfect chak-chak and other Tatar dishes.', 'Chak-Chak Museum', '', 'inherit', 'closed', 'closed', '', '32-revision-v1', '', '', '2021-08-09 13:57:24', '2021-08-09 13:57:24', '', 32, 'http://localhost/day1/cms/?p=80', 0, 'revision', '', 0),
(81, 1, '2021-08-09 14:01:10', '2021-08-09 14:01:10', 'The museum is located on the site of the original Aztec building that was a part of Moctezuma\'s \"New Palaces\" complex called the \"Casa Denegrida\" (Black House) by Spanish conquerors, who described it as a windowless room painted in black. In here, Moctezuma would meditate on what he was told by professional seers and shamans.[3] During the Conquest, this Black House, along with the rest of Moctezuma\'s New Palaces was nearly destroyed.[4] This site was part of lands given to Hernán Cortés by the Spanish Crown as a reward for the conquest of Mexico,[5] and Cortés rebuilt the New Palaces/Black House complex in Spanish style, using much of the building materials of the old Aztec buildings.[4] Cortes’ son later inherited this palace, only to later sell it back to Felipe V in order to establish the vice-regal palace.[5]\nRecently, excavations here and next door at the National Palace have unearthed parts of a wall and a basalt floor believed to be part of the Black House. More excavations are planned.[3]\n\nThis colonial-era building was named a national monument in 1931,[2] but when the new Museum of Anthropology opened the site was left vacant. Beatriz Barba and Julio César Olivé proposed that the space be converted into a museum featuring world cultures.[8] After renovation, the building opened on 5 December 1965,[9] with Barba serving as its deputy director until 1976[10] as the Cultural Museum, with rooms dedicated to demonstrating cultural artifacts from around the world.[2] This museum dedicated to the world\'s past and present cultures is the only one of its type in Latin America.[11] The museum has sixteen permanent display rooms and three rooms for temporary exhibits. Some of the rooms are dedicated prehistoric cultures remains such as cave paintings and implements associated with the origins of sedentary, agricultural societies. Other rooms are devoted to ancient Mesopotamia as well as ancient Greece and Rome.\nIn the Age of Exploration room, items from the time of initial European contact with the Americas are on display. For modern cultures, there are exhibits from all continents and some dedicated to cultures little-known in Mexico such as that of Samoa or New Ireland.[5][12] Since its founding, the museum has received over 12,000 pieces from around the world. These pieces include textiles, glass objects, porcelain, photographs, arms, kimonos, masks, jewelry and sculptures. Many of these objects are originals and some are quite old. The museum still receives donations of objects. One of the most recent is of board inlaid with mother-of-pearl from Vietnam.[5]', 'Museum of National Culture', '', 'inherit', 'closed', 'closed', '', '28-revision-v1', '', '', '2021-08-09 14:01:10', '2021-08-09 14:01:10', '', 28, 'http://localhost/day1/cms/?p=81', 0, 'revision', '', 0),
(82, 1, '2021-08-09 14:01:25', '2021-08-09 14:01:25', 'The National Museum of the Republic of Tatarstan (NMRT) is the largest museum in Tatarstan. It was founded as a Kazan Town Scientific and Industrial Museum in 1894 and opened on April 5, 1895. The basis of the museum is a private collection of 40 thousandth items of Andrei Fedorovich Likhachev (1832-90), a well-known regional archaeologist, numismatist, collector also the exhibits of scientific and industrial exhibition in 1890. Well-known scientists of Kazan University stood at the roots of the establishment of the museum and of the museum\'s collections formation, such as: A.A. Stuckenberg, N.P. Zagoskin, P.I. Krotov, N.F. Vysotsky, N.F. Catania and others. The museum occupies the former building of Gostinniy dvor (guest house), a monument of architecture and history of Russian Federation and the Republic of Tatarstan.\nThere are over 800 thousand units in the museum\'s collection.\n\nNowadays the museum is in the process of reconstruction, the project of which provides creation of a permanent exhibition on the area of more than 6 000 sq.m. 2001, the Cabinet of Ministers of the Republic of Tatarstan approved the scientific concept of creation of exposition of NM RT in Gostiny Dvor building; consisting of three main parts: \"History of Tatarstan, from ancient times to present days,\" \"Nature and a Man\", \"Culture: the interaction of cultures of peoples of Tatarstan\". Now the museum has the following exhibitions: \"Ancient History of Tatarstan\", \"Money, trade and trade routes in the Middle Ages\", \"Tatar Golden Treasures,\" \"Kazan Province in the XVIII century\", there are also temporary exhibitions.', 'National Museum of the Republic of Tatarstan', '', 'inherit', 'closed', 'closed', '', '21-revision-v1', '', '', '2021-08-09 14:01:25', '2021-08-09 14:01:25', '', 21, 'http://localhost/day1/cms/?p=82', 0, 'revision', '', 0),
(83, 1, '2021-08-09 14:01:35', '2021-08-09 14:01:35', 'The State Russian Museum (Russian: Государственный Русский музей), formerly the Russian Museum of His Imperial Majesty Alexander III (Russian: Русский Музей Императора Александра III), located on Arts Square in Saint Petersburg, is the world\'s largest depository of Russian fine art. It is also one of the largest museums in the country.\n\nA unique place where every visitor can take a trip into the forgotten Soviet past. The Soviet Lifestyle Museum is located in an authentic Soviet \"kommunalka\" or in English, \"communal apartment\" with brick walls, old wiring and cast-iron wall heaters. Exhibitions here carry titles relevant to the museum: \"USSR in Space\", \"Toys: Made in the USSR\", \"Bad Habits in the USSR\", \"The Rock and Roll Hall of Fame\" and others. The museum’s main goal is to evoke a feeling of pleasant nostalgia and positive emotions among its visitors as they look through items of a bygone era. Exhibits are not chosen based on any particular special value (although among them, some are quite valuable and even rare); the most important thing here is the history and emotions that each item brings to visitors who may or may not have experienced the heyday of the not-so-distant-past era.\n\n<strong>Creation</strong>\n\nThe museum was established on April 13, 1895, upon enthronement of Nicholas II to commemorate his father, Alexander III. Its original collection was composed of artworks taken from the Hermitage Museum, Alexander Palace, and the Imperial Academy of Arts. After the Russian Revolution of 1917, many private collections were nationalized and relocated to the Russian Museum. These included Kazimir Malevich\'s Black Square.', 'Soviet Lifestyle Museum', '', 'inherit', 'closed', 'closed', '', '10-revision-v1', '', '', '2021-08-09 14:01:35', '2021-08-09 14:01:35', '', 10, 'http://localhost/day1/cms/?p=83', 0, 'revision', '', 0),
(87, 1, '2021-08-16 12:32:47', '0000-00-00 00:00:00', '', 'Auto Draft', '', 'auto-draft', 'open', 'open', '', '', '', '', '2021-08-16 12:32:47', '0000-00-00 00:00:00', '', 0, 'http://localhost/day1/cms/?p=87', 0, 'post', '', 0);

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `wp_termmeta`
--

CREATE TABLE `wp_termmeta` (
  `meta_id` bigint(20) UNSIGNED NOT NULL,
  `term_id` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `meta_key` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_value` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `wp_terms`
--

CREATE TABLE `wp_terms` (
  `term_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `slug` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `term_group` bigint(10) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- A tábla adatainak kiíratása `wp_terms`
--

INSERT INTO `wp_terms` (`term_id`, `name`, `slug`, `term_group`) VALUES
(1, 'Uncategorized', 'uncategorized', 0),
(2, 'Site Updates', 'site-updates', 0),
(3, 'Seasonal Events', 'seasonal-events', 0),
(4, 'Soviet Lifestyle Museum', 'soviet-lifestyle-museum', 0),
(5, 'National Museum of the Republic of Tatarstan', 'national-museum-of-the-republic-of-tatarstan', 0),
(6, 'Museum of National Culture', 'museum-of-national-culture', 0),
(7, 'Chak-Chak Museum', 'chak-chak-museum', 0),
(8, 'Primary Menu', 'primary-menu', 0),
(9, 'Footer', 'footer', 0);

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `wp_term_relationships`
--

CREATE TABLE `wp_term_relationships` (
  `object_id` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `term_taxonomy_id` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `term_order` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- A tábla adatainak kiíratása `wp_term_relationships`
--

INSERT INTO `wp_term_relationships` (`object_id`, `term_taxonomy_id`, `term_order`) VALUES
(1, 1, 0),
(38, 8, 0),
(39, 8, 0),
(46, 8, 0),
(47, 8, 0),
(48, 8, 0),
(49, 8, 0),
(50, 7, 0),
(63, 8, 0),
(64, 5, 0),
(66, 3, 0),
(68, 9, 0),
(69, 9, 0),
(70, 9, 0);

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `wp_term_taxonomy`
--

CREATE TABLE `wp_term_taxonomy` (
  `term_taxonomy_id` bigint(20) UNSIGNED NOT NULL,
  `term_id` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `taxonomy` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `description` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `parent` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `count` bigint(20) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- A tábla adatainak kiíratása `wp_term_taxonomy`
--

INSERT INTO `wp_term_taxonomy` (`term_taxonomy_id`, `term_id`, `taxonomy`, `description`, `parent`, `count`) VALUES
(1, 1, 'category', '', 0, 0),
(2, 2, 'category', '', 0, 0),
(3, 3, 'category', '', 0, 1),
(4, 4, 'category', '', 0, 0),
(5, 5, 'category', '', 0, 1),
(6, 6, 'category', '', 0, 0),
(7, 7, 'category', '', 0, 1),
(8, 8, 'nav_menu', '', 0, 7),
(9, 9, 'nav_menu', '', 0, 3);

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `wp_usermeta`
--

CREATE TABLE `wp_usermeta` (
  `umeta_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `meta_key` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_value` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- A tábla adatainak kiíratása `wp_usermeta`
--

INSERT INTO `wp_usermeta` (`umeta_id`, `user_id`, `meta_key`, `meta_value`) VALUES
(1, 1, 'nickname', 'es2021'),
(2, 1, 'first_name', ''),
(3, 1, 'last_name', ''),
(4, 1, 'description', ''),
(5, 1, 'rich_editing', 'true'),
(6, 1, 'syntax_highlighting', 'true'),
(7, 1, 'comment_shortcuts', 'false'),
(8, 1, 'admin_color', 'fresh'),
(9, 1, 'use_ssl', '0'),
(10, 1, 'show_admin_bar_front', 'true'),
(11, 1, 'locale', ''),
(12, 1, 'wp_capabilities', 'a:1:{s:13:\"administrator\";b:1;}'),
(13, 1, 'wp_user_level', '10'),
(14, 1, 'dismissed_wp_pointers', ''),
(15, 1, 'show_welcome_panel', '0'),
(16, 1, 'session_tokens', 'a:2:{s:64:\"ce3538aa4a1af61606a74e2c6d7611648836fd7c8e7543fc0747274126e71770\";a:4:{s:10:\"expiration\";i:1629716779;s:2:\"ip\";s:3:\"::1\";s:2:\"ua\";s:115:\"Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.131 Safari/537.36\";s:5:\"login\";i:1628507179;}s:64:\"80bdfe150fc39e96407fa3fcf9c7c80beeb8741db50790c44cfcf4fb564ca277\";a:4:{s:10:\"expiration\";i:1630326628;s:2:\"ip\";s:3:\"::1\";s:2:\"ua\";s:115:\"Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.131 Safari/537.36\";s:5:\"login\";i:1629117028;}}'),
(17, 1, 'wp_dashboard_quick_press_last_post_id', '87'),
(18, 2, 'nickname', 'admin'),
(19, 2, 'first_name', 'Admin'),
(20, 2, 'last_name', 'Admin'),
(21, 2, 'description', ''),
(22, 2, 'rich_editing', 'true'),
(23, 2, 'syntax_highlighting', 'true'),
(24, 2, 'comment_shortcuts', 'false'),
(25, 2, 'admin_color', 'fresh'),
(26, 2, 'use_ssl', '0'),
(27, 2, 'show_admin_bar_front', 'true'),
(28, 2, 'locale', ''),
(29, 2, 'wp_capabilities', 'a:1:{s:13:\"administrator\";b:1;}'),
(30, 2, 'wp_user_level', '10'),
(31, 2, 'dismissed_wp_pointers', ''),
(32, 3, 'nickname', 'editor'),
(33, 3, 'first_name', 'Editor'),
(34, 3, 'last_name', 'Editor'),
(35, 3, 'description', ''),
(36, 3, 'rich_editing', 'true'),
(37, 3, 'syntax_highlighting', 'true'),
(38, 3, 'comment_shortcuts', 'false'),
(39, 3, 'admin_color', 'fresh'),
(40, 3, 'use_ssl', '0'),
(41, 3, 'show_admin_bar_front', 'true'),
(42, 3, 'locale', ''),
(43, 3, 'wp_capabilities', 'a:1:{s:6:\"editor\";b:1;}'),
(44, 3, 'wp_user_level', '7'),
(45, 3, 'dismissed_wp_pointers', ''),
(46, 1, 'closedpostboxes_dashboard', 'a:0:{}'),
(47, 1, 'metaboxhidden_dashboard', 'a:2:{i:0;s:21:\"dashboard_site_health\";i:1;s:17:\"dashboard_primary\";}'),
(48, 1, 'managenav-menuscolumnshidden', 'a:5:{i:0;s:11:\"link-target\";i:1;s:11:\"css-classes\";i:2;s:3:\"xfn\";i:3;s:11:\"description\";i:4;s:15:\"title-attribute\";}'),
(49, 1, 'metaboxhidden_nav-menus', 'a:2:{i:0;s:20:\"add-post-type-museum\";i:1;s:12:\"add-post_tag\";}'),
(50, 1, 'closedpostboxes_museum', 'a:0:{}'),
(51, 1, 'metaboxhidden_museum', 'a:0:{}'),
(52, 1, 'wp_user-settings', 'libraryContent=browse'),
(53, 1, 'wp_user-settings-time', '1628509107'),
(54, 1, 'nav_menu_recently_edited', '9'),
(55, 1, 'closedpostboxes_acf-field-group', 'a:0:{}'),
(56, 1, 'metaboxhidden_acf-field-group', 'a:1:{i:0;s:7:\"slugdiv\";}'),
(57, 1, 'jetpack_tracks_anon_id', 'jetpack:+/2m7GHbMBENlf9c5Jhx0ewg'),
(58, 1, 'enable_custom_fields', ''),
(59, 1, 'closedpostboxes_', 'a:0:{}'),
(60, 1, 'metaboxhidden_', 'a:0:{}'),
(61, 1, 'meta-box-order_', 'a:4:{s:6:\"normal\";s:23:\"acf-group_6111336e7ec6f\";s:15:\"acf_after_title\";s:0:\"\";s:4:\"side\";s:0:\"\";s:8:\"advanced\";s:0:\"\";}'),
(63, 2, 'wp_dashboard_quick_press_last_post_id', '84'),
(64, 2, 'closedpostboxes_dashboard', 'a:0:{}'),
(65, 2, 'metaboxhidden_dashboard', 'a:2:{i:0;s:21:\"dashboard_site_health\";i:1;s:17:\"dashboard_primary\";}'),
(67, 3, 'wp_dashboard_quick_press_last_post_id', '85'),
(68, 3, 'closedpostboxes_dashboard', 'a:0:{}'),
(69, 3, 'metaboxhidden_dashboard', 'a:1:{i:0;s:17:\"dashboard_primary\";}'),
(70, 2, 'session_tokens', 'a:2:{s:64:\"fa024d4247ade5cef652eb1fa9e068511bd9b6f99ef5053bfb93f7ca517e4dbe\";a:4:{s:10:\"expiration\";i:1628690852;s:2:\"ip\";s:3:\"::1\";s:2:\"ua\";s:115:\"Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.131 Safari/537.36\";s:5:\"login\";i:1628518052;}s:64:\"1feb45f4ee8f599bb68b842cdef93b5de0d472105dcb3186f406b78faa0e6383\";a:4:{s:10:\"expiration\";i:1628690916;s:2:\"ip\";s:3:\"::1\";s:2:\"ua\";s:115:\"Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.131 Safari/537.36\";s:5:\"login\";i:1628518116;}}');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `wp_users`
--

CREATE TABLE `wp_users` (
  `ID` bigint(20) UNSIGNED NOT NULL,
  `user_login` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `user_pass` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `user_nicename` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `user_email` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `user_url` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `user_registered` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `user_activation_key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `user_status` int(11) NOT NULL DEFAULT 0,
  `display_name` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- A tábla adatainak kiíratása `wp_users`
--

INSERT INTO `wp_users` (`ID`, `user_login`, `user_pass`, `user_nicename`, `user_email`, `user_url`, `user_registered`, `user_activation_key`, `user_status`, `display_name`) VALUES
(1, 'es2021', '$P$ByC9jRUslC7nPxKeRHnHpjDKghEMWD/', 'es2021', 'es2021@es2021.hu', 'http://localhost/day1/cms', '2021-08-09 11:06:13', '', 0, 'es2021'),
(2, 'admin', '$P$BQ.ra.jaJc/v.nP54t7K5F7v3SjnPz0', 'admin', 'admin@es2021.hu', '', '2021-08-09 11:07:44', '', 0, 'Admin Admin'),
(3, 'editor', '$P$BWuT4xFtL1UOriHGJSUM7KwGYOjM..0', 'editor', 'editor@es2021.hu', '', '2021-08-09 11:08:10', '', 0, 'Editor Editor');

--
-- Indexek a kiírt táblákhoz
--

--
-- A tábla indexei `wp_commentmeta`
--
ALTER TABLE `wp_commentmeta`
  ADD PRIMARY KEY (`meta_id`),
  ADD KEY `comment_id` (`comment_id`),
  ADD KEY `meta_key` (`meta_key`(191));

--
-- A tábla indexei `wp_comments`
--
ALTER TABLE `wp_comments`
  ADD PRIMARY KEY (`comment_ID`),
  ADD KEY `comment_post_ID` (`comment_post_ID`),
  ADD KEY `comment_approved_date_gmt` (`comment_approved`,`comment_date_gmt`),
  ADD KEY `comment_date_gmt` (`comment_date_gmt`),
  ADD KEY `comment_parent` (`comment_parent`),
  ADD KEY `comment_author_email` (`comment_author_email`(10));

--
-- A tábla indexei `wp_links`
--
ALTER TABLE `wp_links`
  ADD PRIMARY KEY (`link_id`),
  ADD KEY `link_visible` (`link_visible`);

--
-- A tábla indexei `wp_options`
--
ALTER TABLE `wp_options`
  ADD PRIMARY KEY (`option_id`),
  ADD UNIQUE KEY `option_name` (`option_name`),
  ADD KEY `autoload` (`autoload`);

--
-- A tábla indexei `wp_postmeta`
--
ALTER TABLE `wp_postmeta`
  ADD PRIMARY KEY (`meta_id`),
  ADD KEY `post_id` (`post_id`),
  ADD KEY `meta_key` (`meta_key`(191));

--
-- A tábla indexei `wp_posts`
--
ALTER TABLE `wp_posts`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `post_name` (`post_name`(191)),
  ADD KEY `type_status_date` (`post_type`,`post_status`,`post_date`,`ID`),
  ADD KEY `post_parent` (`post_parent`),
  ADD KEY `post_author` (`post_author`);

--
-- A tábla indexei `wp_termmeta`
--
ALTER TABLE `wp_termmeta`
  ADD PRIMARY KEY (`meta_id`),
  ADD KEY `term_id` (`term_id`),
  ADD KEY `meta_key` (`meta_key`(191));

--
-- A tábla indexei `wp_terms`
--
ALTER TABLE `wp_terms`
  ADD PRIMARY KEY (`term_id`),
  ADD KEY `slug` (`slug`(191)),
  ADD KEY `name` (`name`(191));

--
-- A tábla indexei `wp_term_relationships`
--
ALTER TABLE `wp_term_relationships`
  ADD PRIMARY KEY (`object_id`,`term_taxonomy_id`),
  ADD KEY `term_taxonomy_id` (`term_taxonomy_id`);

--
-- A tábla indexei `wp_term_taxonomy`
--
ALTER TABLE `wp_term_taxonomy`
  ADD PRIMARY KEY (`term_taxonomy_id`),
  ADD UNIQUE KEY `term_id_taxonomy` (`term_id`,`taxonomy`),
  ADD KEY `taxonomy` (`taxonomy`);

--
-- A tábla indexei `wp_usermeta`
--
ALTER TABLE `wp_usermeta`
  ADD PRIMARY KEY (`umeta_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `meta_key` (`meta_key`(191));

--
-- A tábla indexei `wp_users`
--
ALTER TABLE `wp_users`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `user_login_key` (`user_login`),
  ADD KEY `user_nicename` (`user_nicename`),
  ADD KEY `user_email` (`user_email`);

--
-- A kiírt táblák AUTO_INCREMENT értéke
--

--
-- AUTO_INCREMENT a táblához `wp_commentmeta`
--
ALTER TABLE `wp_commentmeta`
  MODIFY `meta_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT a táblához `wp_comments`
--
ALTER TABLE `wp_comments`
  MODIFY `comment_ID` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT a táblához `wp_links`
--
ALTER TABLE `wp_links`
  MODIFY `link_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT a táblához `wp_options`
--
ALTER TABLE `wp_options`
  MODIFY `option_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=278;

--
-- AUTO_INCREMENT a táblához `wp_postmeta`
--
ALTER TABLE `wp_postmeta`
  MODIFY `meta_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=225;

--
-- AUTO_INCREMENT a táblához `wp_posts`
--
ALTER TABLE `wp_posts`
  MODIFY `ID` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=88;

--
-- AUTO_INCREMENT a táblához `wp_termmeta`
--
ALTER TABLE `wp_termmeta`
  MODIFY `meta_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT a táblához `wp_terms`
--
ALTER TABLE `wp_terms`
  MODIFY `term_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT a táblához `wp_term_taxonomy`
--
ALTER TABLE `wp_term_taxonomy`
  MODIFY `term_taxonomy_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT a táblához `wp_usermeta`
--
ALTER TABLE `wp_usermeta`
  MODIFY `umeta_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=71;

--
-- AUTO_INCREMENT a táblához `wp_users`
--
ALTER TABLE `wp_users`
  MODIFY `ID` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

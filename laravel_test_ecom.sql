-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Nov 14, 2024 at 09:31 AM
-- Server version: 8.0.39-0ubuntu0.22.04.1
-- PHP Version: 8.1.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `laravel_test_ecom`
--

-- --------------------------------------------------------

--
-- Table structure for table `attributes`
--

CREATE TABLE `attributes` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `attributes`
--

INSERT INTO `attributes` (`id`, `name`, `slug`, `created_at`, `updated_at`) VALUES
(1, 'Laptop', 'Laptop', '2024-10-03 00:54:31', '2024-10-03 00:54:31'),
(2, 'Mobile', 'Mobile', '2024-10-03 00:54:44', '2024-10-03 00:54:44'),
(3, 'Mobile New', 'Mobile-New', '2024-10-03 00:55:01', '2024-10-03 00:55:01'),
(4, 'Laptop New', 'Laptop-new', '2024-10-03 00:55:18', '2024-10-03 00:55:18');

-- --------------------------------------------------------

--
-- Table structure for table `attribute_values`
--

CREATE TABLE `attribute_values` (
  `id` bigint UNSIGNED NOT NULL,
  `attributes_id` bigint UNSIGNED NOT NULL,
  `value` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `attribute_values`
--

INSERT INTO `attribute_values` (`id`, `attributes_id`, `value`, `created_at`, `updated_at`) VALUES
(1, 1, 'I-1', '2024-10-03 01:08:43', '2024-10-03 01:08:43'),
(2, 2, 'SM-01', '2024-10-03 01:09:00', '2024-10-03 01:09:00'),
(3, 1, 'I-2', '2024-10-03 01:09:13', '2024-10-03 01:09:13'),
(4, 2, 'SM-02', '2024-10-03 01:09:23', '2024-10-03 01:09:23'),
(5, 2, 'SM-03', '2024-10-03 01:09:31', '2024-10-03 01:09:31'),
(6, 1, 'I-3', '2024-10-03 01:09:41', '2024-10-03 01:09:41');

-- --------------------------------------------------------

--
-- Table structure for table `brands`
--

CREATE TABLE `brands` (
  `id` bigint UNSIGNED NOT NULL,
  `text` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `brands`
--

INSERT INTO `brands` (`id`, `text`, `image`, `created_at`, `updated_at`) VALUES
(1, 'SoftChilli', 'images/brands/1727763267.png', '2024-10-01 00:44:27', '2024-10-03 03:16:25'),
(3, 'Keylent', 'images/brands/1727945093.jpg', '2024-10-03 03:14:53', '2024-10-03 03:14:53');

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parent_category_id` bigint UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`, `slug`, `image`, `parent_category_id`, `created_at`, `updated_at`) VALUES
(1, 'Fashion', 'fashion', 'images/categories/1727937631.jpg', NULL, '2024-10-03 01:10:31', '2024-10-03 01:10:31'),
(2, 'Sports', 'Sports', 'images/categories/1727937648.png', NULL, '2024-10-03 01:10:48', '2024-10-03 01:10:48'),
(3, 'Electronics', 'Electronics', 'images/categories/1727937692.png', NULL, '2024-10-03 01:11:32', '2024-10-03 01:11:32');

-- --------------------------------------------------------

--
-- Table structure for table `category_attribute`
--

CREATE TABLE `category_attribute` (
  `id` bigint UNSIGNED NOT NULL,
  `category_id` bigint UNSIGNED NOT NULL,
  `attribute_id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `category_attribute`
--

INSERT INTO `category_attribute` (`id`, `category_id`, `attribute_id`, `created_at`, `updated_at`) VALUES
(1, 1, 4, '2024-10-03 01:11:46', '2024-10-03 01:11:46'),
(2, 1, 3, '2024-10-03 01:11:56', '2024-10-03 01:11:56'),
(3, 1, 1, '2024-10-03 01:12:15', '2024-10-03 01:12:15'),
(4, 1, 2, '2024-10-03 01:12:26', '2024-10-03 01:12:41');

-- --------------------------------------------------------

--
-- Table structure for table `colors`
--

CREATE TABLE `colors` (
  `id` bigint UNSIGNED NOT NULL,
  `text` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `value` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `colors`
--

INSERT INTO `colors` (`id`, `text`, `value`, `created_at`, `updated_at`) VALUES
(1, 'This is green', '#229954', '2024-09-24 21:03:21', '2024-09-24 21:10:44'),
(3, 'Light Grey', '#b2babb', '2024-09-24 21:06:56', '2024-09-24 21:11:15'),
(4, 'Red', '#c0392b', '2024-09-24 21:07:16', '2024-09-24 21:11:30'),
(5, 'India Red', '#CD5C5C', '2024-09-24 21:12:27', '2024-09-24 21:12:27'),
(6, 'Bangni', '#DFFF00', '2024-09-24 21:12:51', '2024-09-24 21:12:51'),
(7, 'Light Blue', '#6D64E8', '2024-09-26 20:34:23', '2024-09-26 20:34:23'),
(8, 'Black Color', '#000000', '2024-09-26 20:37:35', '2024-09-26 20:37:35'),
(9, 'Champpa', 'champpa', '2024-09-26 22:47:13', '2024-09-26 22:47:13');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint UNSIGNED NOT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `home_banners`
--

CREATE TABLE `home_banners` (
  `id` bigint UNSIGNED NOT NULL,
  `text` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `link` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `home_banners`
--

INSERT INTO `home_banners` (`id`, `text`, `link`, `image`, `created_at`, `updated_at`) VALUES
(1, 'This is nice banner', 'www.fb.com', '1726752484.png', '2024-09-03 03:49:23', '2024-09-19 08:14:24'),
(3, 'OK Not Ok', 'man.com', '1727143547.png', '2024-09-23 20:35:47', '2024-09-23 20:35:47');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
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
(5, '2024_08_30_094211_create_roles_table', 1),
(6, '2024_08_30_094743_create_user_roles_table', 1),
(7, '2024_08_31_134957_alter_user_table', 1),
(8, '2024_08_31_141211_alter_user_image', 1),
(9, '2024_09_02_034932_create_home_banners_table', 2),
(11, '2024_09_20_031100_create_sizes_table', 3),
(12, '2024_09_25_021641_create_colors_table', 4),
(13, '2024_09_27_024159_create_attributes_table', 5),
(14, '2024_09_27_024237_create_attribute_values_table', 5),
(15, '2024_09_28_042636_create_categories_table', 6),
(16, '2024_09_28_123736_category_attribute', 7),
(17, '2024_10_01_055013_create_brands_table', 8),
(18, '2024_10_01_113256_create_taxes_table', 9),
(19, '2024_10_02_022203_create_products_table', 10),
(20, '2024_10_02_022643_create_product_attributes_table', 10),
(22, '2024_10_02_022758_create_product_attrs_table', 10),
(23, '2024_10_02_061353_create_product_attr_images_table', 11),
(24, '2024_10_04_035141_modify_image_column_in_product_attr_images', 12),
(25, '2024_10_23_134927_create_posts_table', 13);

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
  `id` bigint UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

CREATE TABLE `posts` (
  `id` bigint UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `author` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`id`, `title`, `content`, `author`, `created_at`, `updated_at`) VALUES
(1, 'Pawan', 'Dignissimos unde libero qui voluptatem debitis non similique non. Qui laboriosam ratione odio doloribus. Ut facere odit ut. Quia eligendi non atque ea dignissimos aut.\n\nUt eos sit voluptas ullam sint dolores. Corporis nihil ab doloribus voluptatem. Itaque et ut repudiandae.\n\nNobis vel dignissimos id ab nihil voluptatibus dolorum. Dolores nemo ratione fugit voluptates magni consequatur. Amet pariatur harum occaecati veniam et. Maiores laboriosam maxime cumque iusto natus tempore.', 'Pawan Kumar', '2024-10-23 10:46:24', '2024-10-23 10:46:24'),
(2, 'Quam perspiciatis modi nemo hic tempora qui aut.', 'Dolores ex ex consequatur qui ipsam et possimus sed. Similique vero sit explicabo nulla fugit. Tempore non quidem repellendus qui in.\n\nNisi enim voluptas eum perspiciatis unde rerum. Facilis nihil molestiae id quidem illum perspiciatis. Veniam id tempore recusandae qui qui veniam. Aliquid est quis quia rerum eius.\n\nEt ut rerum tempore nihil placeat voluptatibus sunt. Quaerat ratione natus delectus et explicabo quae assumenda. Est ab voluptatibus est nihil deserunt.', 'Davon Wuckert', '2024-10-23 10:46:24', '2024-10-23 10:46:24'),
(3, 'Corrupti provident nihil fugit magni ut numquam.', 'Repellat beatae debitis numquam alias. Eaque possimus possimus vel ad. Nobis autem nisi qui ducimus. Aut fugit iste unde aliquam atque eius aperiam.\n\nBlanditiis sit dolor voluptatibus porro molestiae veritatis occaecati ut. Accusantium aperiam facere voluptate amet quidem. Provident qui et ut voluptatem tempora ipsa. Et sunt dolorum sit minus placeat provident ex.\n\nEt debitis qui qui consequatur. Ab pariatur esse magni et eligendi quidem. Voluptate quam iusto id non at dicta quidem. Beatae incidunt tempore qui ad est aut.', 'Judson Sipes DVM', '2024-10-23 10:46:24', '2024-10-23 10:46:24'),
(4, 'Autem ullam quae quos aspernatur.', 'Sapiente expedita vel esse ea tempore cum rem quo. Sit optio qui nemo aspernatur vel quo. Non fugiat eos amet optio quam.\n\nSint accusantium dolores atque itaque sint vitae at. Ab rerum dolore cum eos totam mollitia. Excepturi aut ut sint.\n\nNon vel tempora est aut dolor aut quis culpa. Eligendi ut eaque autem alias ullam. Et fuga sapiente quod natus natus eligendi tenetur.', 'Mrs. Joyce Klocko DVM', '2024-10-23 10:46:24', '2024-10-23 10:46:24'),
(5, 'Quis aut autem est.', 'Non hic tenetur non ut voluptatem ex. Magni corrupti dignissimos ipsam vel ut praesentium sit. Ut molestias quo dicta non distinctio.\n\nOdit vel quidem quis voluptate doloribus ipsum perspiciatis. Tempore incidunt doloremque unde. Nihil rerum asperiores tempora autem quam aut. Ea fugiat voluptas deserunt quae eligendi recusandae nulla doloremque.\n\nExpedita nam beatae omnis in. Debitis repellendus molestiae rerum molestiae blanditiis dolor. Labore doloribus tempore quia nobis autem quibusdam atque. Est tempore voluptates quibusdam corporis.', 'Brad Tillman', '2024-10-23 10:46:24', '2024-10-23 10:46:24'),
(6, 'Est quia nihil sunt odio nisi dolor tempore.', 'Consequatur impedit aut sunt porro aut. Ut consequatur nulla magni iusto facilis. Magnam quis et omnis.\n\nEt id libero ea officiis. Fugiat unde aperiam iusto a. Quia maxime sapiente in distinctio dolor corrupti maiores repellat. Sint qui ad voluptas.\n\nNecessitatibus molestias ea ut repellat alias voluptatem. Modi et nihil quos. Omnis doloribus sed est quia. Iure qui illo aut deleniti quia veniam.', 'Edmund Beier', '2024-10-23 10:46:24', '2024-10-23 10:46:24'),
(7, 'Aut neque quia et et non numquam nihil.', 'Nam fugiat placeat dolorem quo velit nam. Optio natus sit quidem voluptate ipsum beatae dolores. Voluptatem et beatae minima id iusto. Impedit sequi dolor qui possimus aut. Quis beatae amet provident dignissimos consequatur cumque.\n\nNesciunt at qui aut reiciendis iste repellendus ut. Rerum molestias ut eius earum aliquid dolorem. Corrupti sed quaerat vel omnis neque dolorum quidem aut.\n\nNecessitatibus neque omnis distinctio deserunt esse totam. Vero ea corporis est eius culpa veniam adipisci. Nobis architecto repudiandae accusamus maiores quis.', 'Tessie Frami', '2024-10-23 10:46:24', '2024-10-23 10:46:24'),
(8, 'Ut nulla vitae voluptatem minus omnis.', 'Voluptas vero dolorum illum ipsum et. Quos eaque quisquam minus dolor quia quo. Ipsum fugiat fugiat et dolores.\n\nQuia accusantium eveniet quas distinctio facilis facilis. Sed corporis similique tempore necessitatibus. Et dolorum sint ipsa dolor eveniet nesciunt.\n\nArchitecto nulla fuga animi corrupti voluptatum. Ducimus aut et aut quasi sit est omnis. Sint omnis autem assumenda repellendus ipsam harum. Harum culpa inventore aut amet soluta ratione.', 'Prof. Jalon Predovic', '2024-10-23 10:46:24', '2024-10-23 10:46:24'),
(9, 'Cumque ipsa delectus ipsa velit earum aperiam sit.', 'Delectus dolores corporis est exercitationem. Consequuntur iure eveniet quidem nemo.\n\nRepellendus excepturi est sit. Qui et rerum repudiandae ad iste. Voluptate iure laboriosam corrupti ab qui quia voluptatem. Saepe minima minima distinctio et hic laborum quia.\n\nVoluptatem laudantium odio id mollitia omnis voluptas. Deleniti ducimus deleniti quis est. Incidunt id expedita quasi non. Magni quia repellat soluta qui cum tempora illum explicabo.', 'Sim Daniel', '2024-10-23 10:46:24', '2024-10-23 10:46:24'),
(10, 'Itaque voluptatem ducimus aspernatur sit neque est.', 'Similique autem esse repellendus optio. Quaerat culpa iste sapiente praesentium et. Expedita mollitia omnis rerum.\n\nVoluptates exercitationem adipisci perspiciatis ipsum. Voluptatem voluptas ea ad. Aut repudiandae qui ipsum et unde. Et sit vero nemo quis delectus ipsa voluptatibus earum. Nobis nihil debitis ipsam maxime odio.\n\nVelit repellendus qui sed non est assumenda explicabo. Quae sint assumenda et. Et atque id ut ducimus in sunt nesciunt.', 'Rey Gorczany DVM', '2024-10-23 10:46:24', '2024-10-23 10:46:24'),
(11, 'Aliquam amet inventore quia nemo magni voluptatem saepe.', 'Ipsum et et nulla. Aliquid ea enim ipsam maiores. Atque dolorem et beatae assumenda dolor doloremque quia.\n\nEum laboriosam culpa nam. Non quidem ipsam autem voluptatem atque quibusdam. Officiis nisi quisquam cum quia. Molestias numquam omnis distinctio doloribus. Provident dolorem error nisi odio expedita ut.\n\nQuia accusamus dolor ut et esse ipsa. Totam qui in dolorem aut animi nostrum commodi. Quas culpa et aliquam est maiores eligendi aperiam. Exercitationem eos consequatur quasi aperiam.', 'Maggie Cole', '2024-10-23 10:46:24', '2024-10-23 10:46:24'),
(12, 'Quia id nulla error esse nulla sit rerum.', 'Doloribus illo autem non earum. Neque saepe minus natus temporibus quo ipsa ut dolorum. Rerum placeat sint animi quod voluptatem sunt delectus. Magni et ad unde sapiente inventore. Dolorem necessitatibus mollitia impedit aut distinctio.\n\nEt culpa dicta eum. Atque ut consequatur voluptas dolores fuga non voluptatem. Mollitia magni architecto vel veritatis quasi dicta consequatur.\n\nEt minus qui quaerat perferendis nemo. Maiores deleniti fuga sed sint molestias. Doloremque non voluptatem facere impedit.', 'Ms. Marilyne Bergnaum', '2024-10-23 10:46:24', '2024-10-23 10:46:24'),
(13, 'Cupiditate sed ab quibusdam.', 'At cumque animi at eaque ipsa. Repudiandae laudantium omnis blanditiis praesentium officiis voluptatem.\n\nAccusamus voluptatem eligendi aut quidem corrupti. Quia deserunt rerum eum consequatur. Reprehenderit laboriosam quas quam et est.\n\nVelit optio dolor aut perferendis eum. Eos ut nostrum dolorem sunt minima consectetur est. Consectetur et ullam ut quia veniam dolor.', 'Ethyl Cremin', '2024-10-23 10:46:24', '2024-10-23 10:46:24'),
(14, 'Odit quis pariatur unde quia veniam.', 'Et id placeat et minima. Aut sint asperiores et iste suscipit exercitationem ipsa ducimus. Quia cum ut non possimus. Debitis aut odit ut quia aut ex sit.\n\nPerspiciatis assumenda qui est et tenetur iusto. Ut molestias aspernatur molestiae ab. Et reiciendis quibusdam ipsam nesciunt pariatur quasi.\n\nSit autem adipisci sequi voluptatem ea qui. Est facere dicta dolor rerum. Facilis vitae mollitia accusamus placeat impedit.', 'Kaitlyn Fritsch', '2024-10-23 10:46:24', '2024-10-23 10:46:24'),
(15, 'Debitis aliquam explicabo autem consequatur provident eveniet placeat.', 'Porro dolores deleniti sed modi accusantium voluptatem alias. Error cumque dolorum minus alias. Possimus optio optio quidem qui vel magnam. Nesciunt qui rerum consequatur ipsam non voluptatem sunt.\n\nAsperiores quos nihil quam omnis accusamus. Amet totam sint quia ratione. Corrupti quia ut minima doloremque veniam expedita. Ut aspernatur veritatis dolores libero enim illo dolores illo.\n\nOfficia dolor id aperiam earum veniam aut quidem eum. Doloremque aliquid non et ut. Qui nihil ut repellat voluptatem accusantium et.', 'Esta Ruecker', '2024-10-23 10:46:24', '2024-10-23 10:46:24'),
(16, 'Officia et mollitia ea est.', 'Iste aut et sed nobis voluptatem enim et. Ut ipsam excepturi cumque repellat amet laboriosam ea. Ad maxime est debitis itaque suscipit qui. Eius voluptatem ea cupiditate illum. Maxime rerum doloribus beatae rerum id nam ratione quidem.\n\nBlanditiis autem qui animi enim quas quod praesentium dolores. Quas mollitia temporibus sit est quisquam. Reprehenderit quia fuga sed pariatur et voluptas velit aut.\n\nUllam minima similique maxime ea. Amet placeat accusantium magni et sint quod.', 'August Renner', '2024-10-23 10:46:24', '2024-10-23 10:46:24'),
(17, 'Voluptatem minima recusandae totam corrupti laborum.', 'Voluptas fuga non soluta inventore ex. Quis ut ipsa non voluptate pariatur deleniti autem. Officiis nihil reiciendis culpa aspernatur ut et. Ut iure mollitia nostrum quibusdam reprehenderit. Sequi voluptas reprehenderit vero libero.\n\nVelit quidem eos distinctio est dolore cumque dolorem modi. Error quaerat dolor enim iure accusantium. Nisi saepe voluptatem sunt magni. Quis asperiores et est perspiciatis nisi eligendi qui debitis.\n\nAut et dolores ut est porro reiciendis quo. Hic aut facilis sed facilis ex voluptatem reiciendis. Amet non corrupti doloremque molestiae dolores. Quod vel possimus sint.', 'Ms. Haylie Morissette', '2024-10-23 10:46:24', '2024-10-23 10:46:24'),
(18, 'Doloribus in sed sit reiciendis.', 'Illum quas voluptatem omnis nam. Voluptas delectus recusandae alias. Nam voluptatum occaecati odio assumenda. Reprehenderit qui incidunt tempore dolorem sequi.\n\nEt enim corporis modi. Accusamus voluptatem asperiores voluptatem est corporis ea. Nobis consequuntur aut ut.\n\nVeniam sint voluptas molestiae architecto. Enim qui soluta error deserunt. Eveniet minus minima reiciendis nostrum.', 'Dr. Jon Kuphal I', '2024-10-23 10:46:24', '2024-10-23 10:46:24'),
(19, 'Tempora consequatur ipsam non.', 'Sequi doloremque neque labore atque neque nisi. Dicta accusantium aliquid voluptatibus aut.\n\nQuasi ut deleniti molestiae et. Quaerat sit adipisci rerum ut sed et. Ut commodi nisi porro distinctio quia est alias. Cumque iure recusandae quae modi omnis libero dolorem.\n\nEt nulla dolores aut quisquam quae beatae. Est cumque voluptatibus nisi laboriosam est corrupti. Et officiis voluptatem ut. Et qui possimus cupiditate ipsam minus qui repellendus temporibus.', 'Matilde Feil', '2024-10-23 10:46:24', '2024-10-23 10:46:24'),
(20, 'Odit reiciendis dignissimos doloremque.', 'Sunt sed voluptatum explicabo et. Repellendus sint esse ex a dolor optio eos. Esse aperiam nam magnam pariatur natus cum omnis. Tenetur rerum ut modi.\n\nIpsum facilis necessitatibus fuga corporis suscipit alias earum qui. Atque maxime distinctio omnis aut natus omnis et. Tenetur quia et voluptas impedit animi eveniet. Voluptatem possimus nostrum amet laudantium qui deserunt rerum.\n\nCumque et sint et nemo. At incidunt tempora non repudiandae ad sunt maiores esse. Iste ex veritatis consequuntur voluptas dolorem voluptatem laboriosam ipsum. Aut voluptas quis laudantium aliquid blanditiis. Laboriosam ab et veritatis possimus quibusdam.', 'Mrs. Lizeth Tremblay Jr.', '2024-10-23 10:46:24', '2024-10-23 10:46:24'),
(21, 'Qui fugit natus illo dolores tenetur recusandae cum.', 'Sed dolorem sunt officia ut. Magni suscipit blanditiis voluptate magni. Quaerat eos vitae delectus enim. Et veniam nisi nihil saepe et.\n\nDolores voluptatibus doloribus molestias qui aut rerum. Beatae ducimus porro ullam et cum quas quia. Reiciendis nostrum officiis eum hic explicabo voluptatem aut. Qui aut ipsam est aliquid et dolores quae vel. Atque aspernatur ab sapiente quia libero et reprehenderit magnam.\n\nIste placeat provident eius placeat est ipsum. Fugit optio aut autem est incidunt quaerat. Quos eos voluptatem illo. Eos aut quod enim delectus.', 'Miss Genoveva Cruickshank Jr.', '2024-10-23 10:46:24', '2024-10-23 10:46:24'),
(22, 'Impedit saepe eum sed recusandae modi.', 'Omnis nulla voluptatum eum id non illum quidem. Et et molestiae vero quis. Quibusdam et aliquam optio nihil.\n\nUllam quas possimus ad consequuntur quos illum alias. Non quia rerum qui ducimus. Qui modi voluptas saepe deserunt. Velit a quia eos ea beatae et.\n\nDelectus voluptates qui suscipit provident. Dolor qui molestias minima vel quo eos. Veritatis nostrum perferendis sunt ut numquam.', 'Ms. Elda Wolf', '2024-10-23 10:46:24', '2024-10-23 10:46:24'),
(23, 'Reprehenderit iste aut perferendis quae repudiandae.', 'Sequi et voluptatem in corporis sed sit. Aut voluptatem optio et quidem perspiciatis ipsa. Nesciunt excepturi nulla quis eius sed hic qui. Perferendis dolorum autem dolores officia aut fugit eum dolore.\n\nMolestiae nihil odit ipsa aut. Recusandae sint doloremque cumque est vitae corporis. Veritatis minima laudantium neque voluptatem. Et libero corrupti id alias repellat quisquam.\n\nVoluptatibus eaque molestiae asperiores adipisci dolore. Voluptatem ea enim ut velit non optio deleniti nisi. Illum nesciunt quis sapiente quis soluta. Unde sit voluptatem pariatur optio. Temporibus aut beatae commodi saepe velit.', 'Roy Ratke DVM', '2024-10-23 10:46:24', '2024-10-23 10:46:24'),
(24, 'Ut sit dolorem adipisci laudantium vel dolorem.', 'Ipsa perferendis excepturi qui amet dolore recusandae. Et fugit sint est ullam illum magni delectus assumenda. Commodi autem deleniti ut officia rerum modi.\n\nMolestiae nisi molestias iusto. Veritatis occaecati consequatur ut aspernatur. Sed suscipit quae eveniet exercitationem sequi.\n\nPariatur aut distinctio velit ab accusantium numquam sunt suscipit. Consequatur quas deleniti eligendi quas quis voluptas reprehenderit. Et qui tenetur commodi maxime assumenda. Voluptas aspernatur officiis accusamus sint reiciendis.', 'Prof. Van Wyman PhD', '2024-10-23 10:46:24', '2024-10-23 10:46:24'),
(25, 'Fugit aut repudiandae vel eligendi.', 'Iure omnis asperiores eos omnis sit. Sunt saepe voluptatem ex. Corrupti corporis ullam debitis. Maxime nihil aut reprehenderit vero minus.\n\nSint perspiciatis reprehenderit nam nihil. Nihil a ullam itaque eius. Nisi qui illo ipsa voluptas. Dolores saepe nobis reiciendis enim ut aut in.\n\nAspernatur dolores adipisci aut id ipsum. Iure repellat et corporis architecto dolorem.', 'Mr. Erin Weissnat II', '2024-10-23 10:46:24', '2024-10-23 10:46:24'),
(26, 'Consequatur vitae eveniet quia amet illo aut.', 'Qui nisi dolorem omnis cumque quidem est dolor. Quia qui eos suscipit tempore veniam unde quaerat. Animi optio saepe repellat voluptatibus. Et quas ut est molestias laudantium sed exercitationem. Qui facilis dolorem illum impedit ullam.\n\nEt aut culpa dicta quia id tempore et autem. Possimus delectus aspernatur quam sit itaque magni dolor.\n\nDebitis distinctio ut et incidunt dignissimos. Quidem facilis modi et. Animi aliquid esse qui. Blanditiis porro non deserunt sit fuga.', 'Kamren Bechtelar', '2024-10-23 10:46:24', '2024-10-23 10:46:24'),
(27, 'Voluptas magni qui animi voluptas quos.', 'Voluptatum et est sapiente est hic nesciunt quod. Aut velit dolore sequi laborum consequatur. Explicabo dolorem natus hic ut eos optio rerum quidem. Quo esse quo voluptas iure id animi.\n\nOfficia odio quo repudiandae nisi ex est. Quia illo dolorem iure et repellat voluptatem est. Nesciunt et rerum voluptatibus totam eum eius.\n\nReiciendis velit ea cupiditate ad harum et quaerat. Veniam sint quia dolore ad molestias et. Quo at impedit maxime perspiciatis ratione. Repudiandae velit necessitatibus ipsum quia dolor voluptates.', 'Ms. Harmony Hermiston III', '2024-10-23 10:46:24', '2024-10-23 10:46:24'),
(28, 'Velit ipsa omnis earum nihil placeat rerum cupiditate corporis.', 'Optio sit in odio et voluptas expedita. Et veniam laboriosam beatae fuga sint et et. Numquam consequatur animi veritatis tempore excepturi quia.\n\nEt assumenda autem quae blanditiis ut in ratione neque. Repellendus nostrum consectetur laborum aspernatur illo rerum illo. Rerum vero similique corrupti dicta occaecati vero.\n\nExpedita et animi et quo natus commodi eum. Aut id veritatis minima nisi. Possimus magnam ea voluptas. Veritatis quia minus ea reiciendis qui optio velit in.', 'Althea Weissnat V', '2024-10-23 10:46:24', '2024-10-23 10:46:24'),
(29, 'Et quisquam enim fugit dolorem.', 'Odit sed aut voluptatem totam non eius aperiam quia. Animi ad temporibus aliquid.\n\nUllam dolore inventore unde dolorem. Omnis enim ipsa aut explicabo sed error est maiores. Illo eius veritatis ut. Qui perspiciatis et repellendus illo nulla qui rerum.\n\nRem et facilis provident non. Maiores molestiae laboriosam quo.', 'Arlo Smith', '2024-10-23 10:46:24', '2024-10-23 10:46:24'),
(30, 'Ut ut doloremque similique corrupti.', 'Possimus architecto officia neque suscipit. Qui illo voluptates voluptates suscipit placeat ullam saepe.\n\nMinus magni et dolor dolorem asperiores nulla. Eos quam id delectus officia ut illum provident. Enim saepe corrupti accusamus aspernatur odio error voluptas quam. Omnis magnam voluptate in ut autem magni aut.\n\nSint perferendis modi aliquid. Quas beatae ut repudiandae rerum. Eum ut eius harum ut incidunt. Sapiente error consequatur ut autem libero eos.', 'Eliane Lueilwitz', '2024-10-23 10:46:24', '2024-10-23 10:46:24'),
(31, 'Autem qui autem est ut.', 'Est autem molestias est ut. Laborum eos eaque vitae voluptas sit excepturi. Repudiandae numquam et dolores laborum quis laboriosam.\n\nTempore rerum eligendi soluta voluptatem. Perferendis non explicabo dicta ut. Omnis et enim voluptatem consectetur ea.\n\nExplicabo corrupti nostrum voluptatum voluptatem ipsum qui rem. Asperiores harum blanditiis et vero nihil et eveniet. Maiores quidem aut doloribus perspiciatis atque doloribus non reprehenderit. Illum iste iste porro dolores sunt perspiciatis.', 'Mrs. Amya Feil I', '2024-10-23 10:46:24', '2024-10-23 10:46:24'),
(32, 'Ipsa deleniti enim incidunt occaecati.', 'Omnis dicta voluptas qui repellendus libero voluptas laboriosam in. Molestiae dicta id rerum. Ut dignissimos ut molestias consequatur dolores maxime.\n\nSimilique et ullam voluptas magni commodi quo. Nulla consequatur accusantium consequatur maxime. Et ratione eum est sunt sequi quod.\n\nDoloribus sunt ut aperiam illo est. Ut dolorem molestiae quisquam sint veritatis est. Architecto id repudiandae inventore debitis.', 'Katelyn Wolf', '2024-10-23 10:46:25', '2024-10-23 10:46:25'),
(33, 'Eaque sunt est amet veritatis labore quo.', 'Corrupti commodi deserunt molestiae mollitia ex cum sequi. Beatae debitis inventore omnis fugiat impedit.\n\nFugit doloribus velit repellat adipisci. Ipsa commodi omnis fuga praesentium. Quaerat aut voluptas inventore quisquam aut sit.\n\nNon ea et sequi eum. Cumque consequatur expedita ut at voluptatem itaque. Quas eos quia et atque cumque ullam ipsum cumque. Dolorum autem omnis perferendis maxime et.', 'Prof. Joesph Bauch', '2024-10-23 10:46:25', '2024-10-23 10:46:25'),
(34, 'Et sequi recusandae sed ducimus consequatur voluptas assumenda ratione.', 'Cupiditate aut expedita quia. Et quos laboriosam cumque sit sunt sequi vitae minima.\n\nEsse molestias tenetur non nemo. Labore id ipsa ut enim similique itaque. Ut pariatur similique omnis quia. Veniam et impedit reiciendis animi dolor. Iusto dolorem consectetur in.\n\nDolores quis quam molestias iure distinctio qui commodi. Quod aut accusantium dolor qui officia. Quibusdam est earum et harum accusantium qui. Consequuntur sed deleniti minima id.', 'Rudy Stark', '2024-10-23 10:46:25', '2024-10-23 10:46:25'),
(35, 'Nam repellendus accusantium eos delectus voluptatum ullam eveniet.', 'Et eum minus quia et quia. Dolore et perspiciatis iste. Sunt fuga dolore et repellendus.\n\nCulpa ducimus est sit quod cupiditate molestiae. Itaque molestiae natus quo provident est sit quaerat soluta. Ea hic et ullam quas.\n\nExplicabo impedit tenetur quisquam maiores repellat. Repellendus ratione sed autem architecto vero consequatur.', 'Marcelina Smith', '2024-10-23 10:46:25', '2024-10-23 10:46:25'),
(36, 'Aliquam ea provident sit ducimus consequatur non provident qui.', 'In praesentium quisquam ut sed nemo. Est est illum porro fugit dolore autem perferendis. Et vero aut ut id necessitatibus nobis sed. Natus voluptate dolores voluptas dignissimos aperiam fugit. Aut voluptatem aut omnis aspernatur laudantium voluptas.\n\nOfficiis sequi et voluptatem temporibus. Neque ea aut quia quis. Et aperiam eveniet qui veritatis officiis perferendis. Eum ex numquam autem modi.\n\nReiciendis provident ab quo similique. Est voluptas facilis soluta illum. Sed dignissimos dolorem praesentium exercitationem voluptates.', 'Prof. Melba Toy DVM', '2024-10-23 10:46:25', '2024-10-23 10:46:25'),
(37, 'Amet et numquam beatae rerum.', 'Est quis similique velit non. Sit incidunt id ducimus doloremque nemo quis. Perferendis a ratione repudiandae aut beatae sit.\n\nIllo praesentium dolorem non neque. Adipisci velit vel labore et voluptatem temporibus rerum et. Impedit est a ipsa libero odio cumque quam.\n\nNon ad eaque repellendus occaecati fuga est et. Occaecati facilis et delectus. Non officia quisquam quisquam enim.', 'Santiago McClure', '2024-10-23 10:46:25', '2024-10-23 10:46:25'),
(38, 'Consequatur ex natus incidunt itaque ipsa est.', 'Similique ea aut ipsa corporis ut dolorem ad. Perspiciatis voluptatibus officia doloremque et consequatur. Fugit facilis cumque dicta tempore reiciendis.\n\nVelit expedita perferendis veniam voluptas fugit fugit quia. Officiis doloribus fugiat alias et ipsam. Maiores voluptatem beatae rem fuga et.\n\nSit aliquam molestiae sit dolor doloribus voluptas esse dolorum. Omnis adipisci ducimus numquam quia. Non sint ratione enim assumenda repudiandae. Sunt aliquam nesciunt ut voluptatem debitis quidem.', 'Estell Cormier', '2024-10-23 10:46:25', '2024-10-23 10:46:25'),
(39, 'Hic sint tempora quidem impedit non aut praesentium.', 'At omnis temporibus ratione fuga consectetur sunt nam nesciunt. Maxime voluptas occaecati reprehenderit corporis consequatur id debitis. Ea incidunt delectus possimus sunt molestiae ut aliquam voluptas.\n\nCommodi veritatis vel earum quaerat accusamus. Et consectetur quia dolorum esse minima recusandae. Nostrum vitae eos modi aut est enim. Corrupti provident veniam culpa et natus. Deleniti sed ratione mollitia laboriosam.\n\nQuibusdam omnis numquam nemo possimus mollitia impedit cupiditate. Enim voluptatibus facere fugiat necessitatibus commodi et porro aperiam. Earum aspernatur laudantium quisquam qui qui.', 'Juliet Swaniawski', '2024-10-23 10:46:25', '2024-10-23 10:46:25'),
(40, 'Tempore doloremque aliquid est consequatur aut.', 'Recusandae tempore et est dicta. Qui iure ex est reiciendis consequuntur quo in excepturi.\n\nAspernatur est ut nihil quae libero facere iusto. Veniam nesciunt sint et aut rerum odit est. Sit architecto labore alias modi qui.\n\nEt soluta aut quae nam deserunt et eum. Qui dolorem minus voluptas est sit ut minus. Sapiente necessitatibus et et accusantium est. Assumenda et deleniti mollitia provident ducimus numquam.', 'Prof. Enid Sanford', '2024-10-23 10:46:25', '2024-10-23 10:46:25'),
(41, 'Quasi dolorem et et sequi et possimus voluptatem.', 'A accusantium necessitatibus eius veritatis. Rerum ut voluptate ea earum. Quia pariatur fugiat quo dolorem. Corporis illo eveniet sed voluptas. Est aspernatur fugit saepe quod et eaque.\n\nEt non minima sint ullam tempora. Ut ut earum cum repellat repellat officiis ab. Qui dicta rerum assumenda quam fugit quaerat. Tempora assumenda ut est reiciendis quis ullam. Molestiae aut enim asperiores eligendi eius vero.\n\nTemporibus totam expedita possimus itaque explicabo. Qui architecto a placeat temporibus eligendi earum cumque earum. Iusto voluptates est asperiores explicabo architecto.', 'Lilliana Hane Jr.', '2024-10-23 10:46:25', '2024-10-23 10:46:25'),
(42, 'Earum sed excepturi impedit labore omnis accusantium.', 'Qui a incidunt maxime quibusdam aut nobis at eaque. Reiciendis vero et aliquid enim numquam. Eligendi numquam consequatur illum voluptatem cupiditate. Ipsum perspiciatis laborum porro. Eligendi consequatur et reiciendis quasi.\n\nNostrum ad totam accusantium quo. Error voluptatem quam et. Quas magnam amet omnis voluptatem beatae vitae laboriosam.\n\nEius suscipit et ut vel animi. Corrupti non quae delectus molestiae quia natus sint. Error iusto ab officia excepturi cum.', 'Gregorio Feest', '2024-10-23 10:46:25', '2024-10-23 10:46:25'),
(43, 'Molestiae unde vel omnis.', 'Officiis non sunt reiciendis nulla quibusdam quia. Consequatur eius quibusdam qui esse. Nobis nulla voluptas dignissimos vero sint repellendus. Quasi dolorem ea tempore occaecati quis ex.\n\nProvident distinctio nulla voluptates voluptate tenetur. Eos aspernatur atque eum maxime iste maxime. Eos officia laboriosam eum officia cumque. Sed optio dolor deleniti maiores similique esse.\n\nQui beatae ratione tenetur atque. Necessitatibus et rerum fugit repellat in repudiandae perferendis qui.', 'Bernie O\'Reilly Sr.', '2024-10-23 10:46:25', '2024-10-23 10:46:25'),
(44, 'Et sed tempora consequatur ducimus non.', 'Et consequuntur sit magni provident ut error quae. Dolore deserunt vitae porro praesentium quia praesentium eius.\n\nDistinctio illo error illo. Delectus voluptatem mollitia dolorem reiciendis distinctio nihil. At dolorem minus totam suscipit error error neque. Occaecati ipsum minus aspernatur nisi officia quia. Omnis libero molestias ad modi quo dolores accusamus.\n\nTempora error et est exercitationem repellendus consequuntur tempora. Suscipit cumque debitis ut. Temporibus aliquam et et at velit doloribus nesciunt. Soluta et architecto libero nisi incidunt veniam.', 'Diamond Boyer', '2024-10-23 10:46:25', '2024-10-23 10:46:25'),
(45, 'Et voluptas iure qui eos.', 'Eaque officia mollitia rem delectus repellendus. Debitis id officiis nulla in eum eum perferendis. Consequatur ut vel repellat rem ad et id nam.\n\nEx voluptate temporibus dolor consequuntur ullam eligendi debitis sint. Qui iste ut laudantium in deserunt quam natus. Illum velit nam sequi iure tempore aliquam illo.\n\nRerum repudiandae deserunt magni eveniet labore. Nostrum repellendus pariatur ullam. Harum beatae sit praesentium. Ad velit aperiam magnam explicabo ea soluta voluptates.', 'Helmer Schiller DDS', '2024-10-23 10:46:25', '2024-10-23 10:46:25'),
(46, 'Error aliquid voluptas laboriosam eius fuga eius nisi.', 'Et eius dicta ut. Error maiores ab eos qui laboriosam rerum. Eos quidem magni velit voluptatem quis. Quo eveniet voluptas voluptatibus praesentium temporibus optio deleniti.\n\nEt aliquid sapiente illo. Occaecati et et sit distinctio eum hic laudantium autem. Et quia sequi facilis voluptas in facere sequi.\n\nIncidunt alias iste et quis velit accusantium ut. Recusandae deserunt aut necessitatibus quam.', 'Dr. Rickey Renner MD', '2024-10-23 10:46:25', '2024-10-23 10:46:25'),
(47, 'Itaque ratione ut omnis architecto delectus.', 'Harum in quisquam blanditiis officiis debitis ut. In dignissimos soluta libero. Iure facilis aut sed inventore. Quo earum itaque consequatur possimus harum sunt. Aut vitae sunt odio eos illum.\n\nEst atque ut doloremque nemo. Eaque excepturi fugiat est sunt. Qui repudiandae veritatis odit deleniti cumque illo placeat.\n\nRerum id molestiae aut est. Voluptatem quia velit qui quis. Possimus molestiae qui earum velit magni velit possimus. Praesentium excepturi sed omnis iste et et.', 'Quincy Murphy', '2024-10-23 10:46:25', '2024-10-23 10:46:25'),
(48, 'Beatae voluptates quas dolore cum quos est adipisci.', 'Iste modi adipisci at error maiores. Consequatur ut pariatur architecto vitae rerum dolores. Totam eos ut quisquam suscipit dolorum.\n\nSoluta unde architecto cum velit sint ea. Et ut non nobis ipsam minus.\n\nLaborum dignissimos totam quasi dolore. Praesentium sed itaque cupiditate quibusdam. Et excepturi expedita dignissimos eos excepturi cum doloremque. Nostrum laborum blanditiis sint harum aut ipsam qui.', 'Roscoe O\'Connell', '2024-10-23 10:46:25', '2024-10-23 10:46:25'),
(49, 'Illum earum adipisci debitis consequuntur.', 'Earum est voluptate in reprehenderit. Nobis vero quia ullam et nulla.\n\nEt vel porro voluptatem omnis enim et quia. Et nobis repellat labore rerum. Error eum optio explicabo rerum enim. Ut nobis ea neque aliquid ut laudantium.\n\nLaudantium explicabo maiores ut et. Delectus repellendus alias velit iure. Assumenda enim quia ut autem.', 'Mr. Ted Streich', '2024-10-23 10:46:25', '2024-10-23 10:46:25'),
(50, 'Quia est velit minus non est odit ut.', 'Voluptas velit voluptatibus corrupti facere est. Dolor autem ipsam minus sed harum velit.\n\nConsequatur repellat a eveniet nemo maxime. Nihil nemo nihil tenetur aliquid. Ad ipsam vel totam quasi illum voluptas. Sit accusantium dignissimos ea iusto quasi.\n\nEt tenetur quis in omnis facere. Nihil ab aut consequuntur tempora magni.', 'Kobe Hansen', '2024-10-23 10:46:25', '2024-10-23 10:46:25'),
(51, 'Ea enim et mollitia est tempora.', 'Recusandae quos et ratione beatae. Quae molestiae quia hic enim recusandae et. Et facere amet consequatur.\n\nOmnis est quos et rem quo cum odio. Esse qui porro sint eos consequuntur sed. Dolores vel a laborum.\n\nCorrupti quis ut aut omnis fugit in. Cupiditate voluptatem recusandae rerum. Ea minus dignissimos sed dignissimos.', 'Horace Kemmer', '2024-10-23 10:46:25', '2024-10-23 10:46:25'),
(52, 'Quo quia qui sapiente totam tenetur sed incidunt.', 'Consequatur molestiae est voluptatem numquam et. Sunt earum explicabo tempora similique culpa tenetur excepturi. Dolores quis praesentium aut. Quia et est rerum. Deserunt voluptatem cupiditate eaque et.\n\nAutem temporibus ut accusantium et labore. Labore earum velit dolor omnis. Quo culpa odit voluptatem suscipit doloribus esse animi. Quo reprehenderit et hic voluptate.\n\nSint alias dolorem incidunt ad facere excepturi odit. Quae molestias perferendis vel. Earum nemo nihil quidem aliquid molestias quis exercitationem. Similique dolore dolores eos qui dolor laudantium minima.', 'Dr. Mellie Rogahn V', '2024-10-23 10:46:25', '2024-10-23 10:46:25'),
(53, 'Eum tempora ut voluptatem.', 'Repudiandae consectetur recusandae est tempore quidem id dolore maiores. Iure consequatur dolor consequatur asperiores voluptatibus doloribus. Eveniet doloremque adipisci ipsum qui eum sed.\n\nUt dignissimos ullam ipsum explicabo. Et dolor fuga consectetur ducimus beatae officiis vitae. Tempore odio nisi quibusdam facilis cumque. Voluptatem aspernatur reprehenderit consequatur.\n\nNihil reiciendis incidunt cum dolores hic enim. Qui error nobis dolore.', 'Bradley Buckridge', '2024-10-23 10:46:25', '2024-10-23 10:46:25'),
(54, 'Id dolores quidem quia in voluptas molestias doloribus sed.', 'In qui maxime eos quis. Qui odit et velit ab quasi provident autem. Sunt eos maiores deleniti inventore enim totam.\n\nNam voluptatem molestias veniam dolorum. Explicabo quisquam earum temporibus. Consequatur ex et distinctio maxime molestiae. Molestiae totam eos nobis aspernatur.\n\nTemporibus aliquid enim modi aperiam ex rerum praesentium inventore. Eveniet possimus odit neque in. Ut iure eum earum iste similique.', 'Mark Hintz', '2024-10-23 10:46:25', '2024-10-23 10:46:25'),
(55, 'Enim iste dolores vero dignissimos ducimus.', 'Sunt mollitia veniam aut dignissimos exercitationem. Necessitatibus amet officiis facere ut. Voluptates laboriosam sunt quis blanditiis porro sequi.\n\nAlias impedit et ut quo. Sit laborum incidunt aut dolor non eveniet maiores. Impedit incidunt dolor possimus cumque rerum. Eum vero aut autem architecto aspernatur tenetur.\n\nQuam iusto labore expedita porro ut et. Et quia est ex delectus ut cupiditate. Eum enim a velit aperiam. Autem eligendi sit dolorum iusto harum aut harum vel.', 'Myriam Boyle', '2024-10-23 10:46:25', '2024-10-23 10:46:25'),
(56, 'Eveniet aliquam error suscipit consequuntur nihil debitis.', 'Cupiditate nostrum ut rerum quo adipisci ducimus. Delectus dicta dicta quis eligendi sunt enim reiciendis. Vero voluptatibus in corporis voluptas.\n\nEsse illum ducimus distinctio qui asperiores saepe eos. Explicabo tempore ducimus distinctio alias placeat sit.\n\nVoluptas cum porro explicabo sint. Nesciunt suscipit commodi architecto unde aut et. Est veritatis blanditiis sit praesentium voluptatum. Aut velit eos mollitia et nobis.', 'Gina McKenzie', '2024-10-23 10:46:25', '2024-10-23 10:46:25'),
(57, 'Voluptatem qui aut sit dolorem omnis maiores.', 'Enim et explicabo debitis eligendi maiores minus odio ut. Non quas at quo sunt optio consequatur porro. Rerum at illo incidunt ut.\n\nAperiam mollitia repellendus consequatur eum consequatur. Sed magnam impedit ut sit sint aut quis praesentium. Sunt aliquam molestias aut ab culpa aut. Molestias aperiam recusandae similique eum dolores est omnis minima.\n\nQuas officiis beatae quasi vel aliquam non laudantium. Et optio doloremque a. Eligendi placeat repudiandae non commodi consequatur occaecati. Et odit iste animi omnis natus ut perspiciatis.', 'Kraig Kuvalis', '2024-10-23 10:46:25', '2024-10-23 10:46:25'),
(58, 'Corporis dolorem quibusdam eligendi maxime vero.', 'Necessitatibus est voluptatem quas soluta quia libero omnis ut. Et sint qui adipisci consequatur omnis itaque. Laboriosam aut iste voluptatum consectetur id iusto.\n\nSit minus sunt illo sit. Non modi sed exercitationem nisi. Consequatur voluptas modi et aliquid at numquam.\n\nConsequatur id et totam soluta praesentium quo voluptas. Aut dolorem ducimus ab aut. Ut dolores ullam ab nisi tempora recusandae at.', 'Kirk Homenick', '2024-10-23 10:46:25', '2024-10-23 10:46:25'),
(59, 'Ut eos error dolor labore omnis nam.', 'Ullam atque est voluptas et asperiores reprehenderit officiis. Ratione alias molestiae cupiditate possimus. Omnis saepe et maxime aut nobis sed.\n\nOdit voluptatem enim possimus repudiandae non eum natus. Sunt animi veritatis libero cum ut quis voluptatum. Quos voluptatibus qui nisi iure suscipit totam dolorum.\n\nQuis et mollitia amet. Earum error delectus voluptatem sed est. Alias nihil sit eligendi velit quod molestias soluta.', 'Sadie Abshire', '2024-10-23 10:46:25', '2024-10-23 10:46:25'),
(60, 'Perferendis fugit molestias deleniti possimus vitae aut numquam.', 'Suscipit dolores occaecati optio quos quia minus. Enim nostrum cum ut ratione qui quia. Necessitatibus tempora sed maiores molestias tempore.\n\nUt voluptas incidunt quidem est quaerat. Rerum illum doloremque laboriosam eveniet temporibus placeat. Eligendi dolorum quasi non est dolores animi et. Voluptatem minima ipsum optio vitae harum dolore.\n\nEarum doloribus natus recusandae et nesciunt neque. Voluptatem iure doloribus nulla in saepe ullam sunt. Molestiae expedita repellat sit odio aliquid aut voluptatem.', 'Prof. Adan Emmerich', '2024-10-23 10:46:25', '2024-10-23 10:46:25'),
(61, 'Iure error voluptatem ea commodi et consequatur rerum.', 'Id iste et fugit odio. Consectetur qui consequatur dolorem. Deleniti qui dolore modi omnis error.\n\nIpsam quo sed dignissimos inventore ut. Consectetur incidunt dicta necessitatibus voluptatem impedit ut. Eveniet soluta sunt in sapiente qui sed. Ratione blanditiis quidem quasi aspernatur repudiandae maiores consequatur. Est ut iusto nulla alias.\n\nVoluptas dolore facilis pariatur pariatur. Sint placeat ducimus reiciendis quia repellat ea repellendus. Aut fugiat vitae qui ea.', 'Ophelia Grady III', '2024-10-23 10:46:25', '2024-10-23 10:46:25'),
(62, 'Architecto eius maiores velit.', 'Magnam impedit qui sed unde. Nobis sint neque dignissimos quos. Inventore voluptas totam maiores aut atque. Possimus quis in molestias expedita illum qui. Sit doloremque aliquid occaecati cumque ipsam architecto animi.\n\nEt eos voluptatum unde vero velit quis sed. Et sapiente corporis eos quisquam libero facilis. Animi ab dolores impedit quasi aut dolor porro. Et aut dolorem quis iusto asperiores omnis perferendis.\n\nEt maiores dolor non ut ut. Possimus et sunt repudiandae omnis omnis maiores aut. Repellendus reprehenderit assumenda voluptatum quidem quaerat recusandae similique. Deleniti odio eum repellendus consequatur.', 'Jon Watsica', '2024-10-23 10:46:25', '2024-10-23 10:46:25'),
(63, 'Enim doloremque perspiciatis aut quasi.', 'Sed rerum ut illo blanditiis reiciendis facilis provident ut. Omnis et illo pariatur dicta libero sint ut. Minus omnis nulla omnis modi autem asperiores. Molestiae iure similique accusamus natus.\n\nQuis harum velit ducimus qui sequi earum. Eos consequatur necessitatibus ea dolorem quibusdam. Labore et aperiam qui sit est. Ea est non voluptas quam.\n\nEst earum rerum omnis. Repudiandae accusantium cum illum ut enim magnam ea. Voluptas consequuntur voluptate incidunt quo quia accusamus.', 'Lucile Dach', '2024-10-23 10:46:25', '2024-10-23 10:46:25'),
(64, 'Repudiandae non eum dolorem ut rerum nemo similique.', 'Voluptates non aspernatur assumenda quis et tenetur iste. Est repudiandae in omnis eum quos eius. Aspernatur id reprehenderit dolores reprehenderit aut assumenda. Error est similique eum delectus tempora aut accusamus.\n\nDebitis excepturi velit in qui soluta. Dolorem minus voluptatem et cumque exercitationem. Ut voluptas quis qui. Error qui quo suscipit est. Voluptatum et reprehenderit nulla consectetur hic libero quidem.\n\nBlanditiis ipsam optio dolorem repellat optio dolor sed voluptate. Aut quod minus reiciendis maiores.', 'Gerda Padberg Sr.', '2024-10-23 10:46:25', '2024-10-23 10:46:25'),
(65, 'Rerum provident non aut ea perspiciatis suscipit sed.', 'Nulla quam eveniet dicta. Neque vero earum sit quo laborum. Eos molestias quo facilis illo in.\n\nVoluptate adipisci minima ut. Animi ut earum laboriosam sed. Assumenda et dolorem et porro at consequuntur voluptate. Accusantium soluta qui maxime maxime veritatis.\n\nNeque maiores dolor molestiae esse optio placeat. Possimus temporibus veniam cupiditate ea veniam. Debitis dolore facilis repudiandae et unde consequatur.', 'Dr. Myles Ankunding V', '2024-10-23 10:46:25', '2024-10-23 10:46:25'),
(66, 'Impedit quia consequatur quia sunt dolores non repellendus ut.', 'Aspernatur quis unde nam aut. Quia alias quidem nam saepe sequi quia ut eum. Ea amet ut architecto.\n\nEx perferendis voluptatem ut repellendus. Dolores neque dolorem iure aut ut. Aliquid accusantium ea aut quos sapiente nihil facilis.\n\nRecusandae est a dolor quasi. At ducimus vero ipsum quis rerum. Veritatis quia vitae nostrum corporis aut.', 'Kaitlyn Bailey', '2024-10-23 10:46:25', '2024-10-23 10:46:25'),
(67, 'Libero est cupiditate ad est ab sed voluptatem.', 'Porro explicabo saepe molestiae. Non odit itaque aut veniam. Recusandae beatae voluptas qui ad sunt laudantium eum.\n\nNatus iusto vitae quisquam iste at. Reprehenderit ratione et repellat et in est reiciendis aut. A aliquid et animi.\n\nFugiat iure expedita sed dolorum mollitia ut. Et tempora corporis sunt voluptatem pariatur voluptas asperiores et.', 'Linda Kassulke', '2024-10-23 10:46:25', '2024-10-23 10:46:25'),
(68, 'Molestias et id hic.', 'Et et earum cumque molestiae unde. Eligendi commodi sed nam architecto unde non. Et non vitae saepe quis et. Dolor nostrum aut laudantium et consequuntur voluptatum sed.\n\nEaque quos suscipit hic quas autem sed quas. Non dolor sed exercitationem quod laudantium minima nam et. Cum asperiores velit illo in molestiae rem fugit.\n\nEt ex animi magnam voluptatem. Repellat dolore qui eos. Nostrum et quidem inventore alias reprehenderit debitis expedita. Exercitationem quam et quasi est itaque ullam autem et.', 'Mrs. Cassidy Kunde I', '2024-10-23 10:46:25', '2024-10-23 10:46:25'),
(69, 'Consectetur accusamus fuga et voluptates quia.', 'Quisquam dolores ut esse unde. Nihil adipisci officiis itaque officiis. At quis modi enim ex similique accusamus a occaecati. Et qui et quidem corporis aperiam est amet pariatur.\n\nMinima maxime ab qui unde nam. Perferendis cum similique molestias minima voluptatem. Repudiandae enim ipsum dolor laborum officia est. Inventore tempore consequatur nihil nisi.\n\nPariatur et nisi quae quia. Nesciunt voluptatem illo labore. Ut dolores ipsa et autem nesciunt et. Qui rerum recusandae nesciunt qui.', 'Yadira Price', '2024-10-23 10:46:25', '2024-10-23 10:46:25'),
(70, 'Vero id dolorem quisquam ex est non.', 'Incidunt ipsam deserunt non asperiores atque cum. Aliquid at et dolor eum est. Consequatur occaecati fugiat et sunt temporibus ut tenetur voluptatibus.\n\nSimilique sequi inventore maiores sunt aut enim. Excepturi voluptas expedita quae saepe. Dolorem sed necessitatibus delectus magni esse nemo. Aliquid vitae similique aperiam consequatur consequatur ex.\n\nDolor ad cum aspernatur at occaecati culpa. Dolore blanditiis vel molestiae sed nihil consectetur est aliquid. Sed sapiente quibusdam corporis nisi quo ratione.', 'Prof. Zoie Farrell', '2024-10-23 10:46:25', '2024-10-23 10:46:25'),
(71, 'Quo qui est est.', 'Enim quasi assumenda id totam quibusdam placeat sunt et. Est harum incidunt nobis aut fugit. Aspernatur enim numquam veniam consectetur architecto sit cupiditate. Aut repellendus voluptatem aut fugit.\n\nCorporis inventore sit omnis repellat voluptatem. Tenetur reprehenderit quo praesentium rem. Autem velit aut temporibus hic optio dolor quia.\n\nNon maiores et qui asperiores alias nihil voluptatem. Repellendus vel placeat qui et dolorem excepturi. Fugit adipisci architecto aliquid aut.', 'Janessa O\'Reilly', '2024-10-23 10:46:25', '2024-10-23 10:46:25'),
(72, 'Consequatur exercitationem quo reiciendis ut itaque est aut dolor.', 'Eligendi voluptatem ipsam est exercitationem facilis officia quisquam. Ut natus dignissimos nostrum enim maiores quia. Voluptate autem vitae quisquam non repellat eos. Blanditiis voluptatem rem cumque ducimus.\n\nVoluptatum dolores cum consequuntur et ut veritatis dolore facere. Quia asperiores magnam in omnis. Enim itaque tempora architecto fuga dolore esse ab voluptatibus. Nisi dolore velit corrupti sed adipisci in dicta.\n\nPorro optio eum officia. Vel voluptatibus illo est nihil. Fuga sit nostrum aut quibusdam sint. Consectetur blanditiis dolor esse veniam officiis.', 'Rocio Ullrich', '2024-10-23 10:46:25', '2024-10-23 10:46:25'),
(73, 'Ut vel blanditiis voluptatem temporibus enim non non reiciendis.', 'Ab enim quo saepe qui sunt nihil. Et voluptatem molestiae dolorem delectus. Quam occaecati error voluptatem explicabo blanditiis. Placeat iusto quod perferendis et. Non et ipsa quam libero atque atque.\n\nConsequatur eius molestias molestiae eos voluptatibus. Et ipsum ea non aut consequatur.\n\nNulla et iusto harum dolores recusandae rerum aut. Sint non ex provident perspiciatis est. Omnis recusandae error praesentium error necessitatibus et. Maiores et dolorum dolorem ut nobis tempore.', 'Isaiah Kshlerin V', '2024-10-23 10:46:25', '2024-10-23 10:46:25'),
(74, 'Dolorem quaerat temporibus ad id recusandae minima.', 'Repellat quisquam ullam nostrum quae omnis. Nemo et numquam at expedita. Dignissimos ipsa ad ut labore ducimus maxime distinctio quo. Ipsa quo repudiandae velit omnis quia et rerum.\n\nEt quas sapiente ipsam dolores aperiam eligendi impedit. Cupiditate voluptate accusamus repudiandae perspiciatis qui unde vero. A nostrum laudantium veniam aperiam eligendi quia debitis. Est voluptates consequuntur voluptas fugiat. Vitae quasi laborum minima quia ut.\n\nSint accusamus pariatur in sunt deserunt. Id autem voluptates natus unde. Enim nisi voluptate corrupti doloribus est voluptatem nisi. Non ut quae non doloribus qui corporis praesentium quisquam.', 'Leonie Mueller', '2024-10-23 10:46:25', '2024-10-23 10:46:25'),
(75, 'Delectus dolores ad maxime ipsam et occaecati placeat eveniet.', 'Totam facere quia voluptatem iste. Labore quia doloribus consectetur quibusdam.\n\nMollitia repellat quo eveniet qui. Rerum quae ex expedita consequatur et non.\n\nExcepturi et consequatur odit officia non illum sint repudiandae. Similique vero velit consequatur ipsam nemo qui. Sequi quo officia non non animi quia. Aut facere non neque.', 'Anna Bashirian', '2024-10-23 10:46:25', '2024-10-23 10:46:25'),
(76, 'Qui omnis ut sapiente nemo numquam.', 'Dicta molestiae harum amet et. Est reiciendis minima omnis. Non qui vitae perspiciatis est assumenda qui maiores. Consequatur qui magnam ut.\n\nNon sit error vero saepe quae commodi. Quis dolorum eveniet architecto voluptatibus consequatur. Enim mollitia animi perferendis consequuntur sunt accusamus.\n\nSit vel ut nostrum voluptatibus. Reprehenderit dolore quia repellendus vel laudantium quia magnam. Nostrum occaecati repellendus quis ut dolor corrupti consectetur. Deleniti non vero velit inventore exercitationem doloribus. Sint quo ut blanditiis fuga vel non nam.', 'Mrs. Elody Hessel', '2024-10-23 10:46:25', '2024-10-23 10:46:25'),
(77, 'Reprehenderit aut magnam beatae magnam laudantium rerum.', 'Itaque sed aliquam consequatur odit atque. Hic dignissimos corrupti exercitationem libero neque cupiditate necessitatibus. Qui voluptas facilis harum et aut qui.\n\nNobis facere deleniti deserunt quisquam et perferendis. Amet ab ducimus quia unde libero quia minus. Saepe ipsum nostrum doloribus. Voluptates amet in autem.\n\nConsequatur et neque molestias ut. Voluptatem aperiam esse aut nostrum et et. Consequatur officia aperiam animi excepturi repellendus. Voluptates expedita eum ut et.', 'Dean Lynch V', '2024-10-23 10:46:25', '2024-10-23 10:46:25'),
(78, 'Odio aut fuga dolores quia non sapiente et.', 'Quaerat ex temporibus dolorum culpa. Voluptatem odit illum culpa.\n\nEveniet assumenda velit similique adipisci voluptatem. Nostrum pariatur consectetur quia itaque dolor enim et. Inventore natus alias voluptatum sapiente aut. Enim nisi neque a.\n\nMaxime provident molestiae laborum tempore rem enim vitae. Beatae quasi optio dolor ut architecto.', 'Bert Lowe', '2024-10-23 10:46:25', '2024-10-23 10:46:25'),
(79, 'Voluptas quia autem quas tenetur quos sint non.', 'Quo quia quia placeat earum rerum inventore. Voluptatem sint tenetur et totam nisi. Velit occaecati eveniet sit aut excepturi iure laborum.\n\nAlias laborum porro magnam voluptas dolor. Sint in consequatur qui vel.\n\nQuia vitae odit praesentium veritatis perspiciatis quasi esse labore. Quo voluptatem laboriosam architecto. Vel recusandae corrupti et aut molestias voluptas fugit.', 'Dr. Tara Zemlak', '2024-10-23 10:46:25', '2024-10-23 10:46:25'),
(80, 'Maiores aut amet cupiditate officia.', 'Et laboriosam corrupti voluptatem non consequatur quo. Quasi consequuntur dolorum odit et neque maxime similique quis. Dicta ea exercitationem asperiores sunt. Atque a amet reiciendis omnis iste ut.\n\nMagnam et distinctio impedit illum esse. Et repudiandae voluptatibus aliquam vero. Dolorem porro expedita suscipit eius est vel consectetur ex.\n\nFacilis tempore eius ex aut voluptatum ad. Qui et fugit aut. Nam at nihil facilis qui qui impedit illo aut.', 'Cyrus Kilback', '2024-10-23 10:46:25', '2024-10-23 10:46:25'),
(81, 'Et et rerum temporibus et reiciendis.', 'Quaerat fuga veniam iusto molestias dolor dicta. Commodi harum distinctio dolorem porro velit ut. Dolor quis minima eius molestiae.\n\nConsequuntur officia ut explicabo iure aut autem inventore. Doloremque voluptatem ad cupiditate.\n\nOdio ut voluptas sit cupiditate. Facilis vel commodi vero sunt.', 'Mrs. Carissa Senger', '2024-10-23 10:46:25', '2024-10-23 10:46:25'),
(82, 'Provident eum recusandae illo hic.', 'Qui facilis consequatur deserunt dignissimos perspiciatis perferendis non corrupti. Qui deserunt nihil non molestias. In ad vero et ut error voluptatem. Et ea eaque consectetur quis.\n\nOfficiis dolores qui vero rerum atque. Recusandae odit sunt ut saepe quia vel. Quasi nostrum aut rerum aut enim excepturi maxime velit.\n\nPossimus architecto molestiae odit aut molestias earum. Natus facere fugit et ad eligendi omnis. Iure est autem facere possimus mollitia quaerat ut.', 'Amy Bailey DDS', '2024-10-23 10:46:25', '2024-10-23 10:46:25'),
(83, 'Voluptas autem ratione labore voluptatibus.', 'Error consequatur iure laborum quidem temporibus. Modi mollitia rerum voluptatum commodi consequuntur vel. Voluptatum autem laudantium qui officia iste qui repudiandae. Voluptatum id rerum qui excepturi architecto.\n\nId voluptatem provident et consequatur dolor et aut. Natus non eum voluptatem qui aspernatur vero omnis. Et enim dicta fugit suscipit dolor ea.\n\nExpedita aut consequatur facere. Error sit rerum amet illum. Omnis minus quia inventore ipsa dolorem optio quas quia.', 'Agustin Mraz', '2024-10-23 10:46:25', '2024-10-23 10:46:25'),
(84, 'Earum esse quod perspiciatis sint magnam.', 'Qui odit fuga sed omnis est nihil architecto at. Nihil nobis blanditiis maxime aliquid. Laborum necessitatibus illum et dolor voluptatem. Voluptatem quo voluptas aut expedita dolor.\n\nMolestiae doloribus tenetur dolor consequatur. Optio est est quibusdam quia. Eum vel aperiam adipisci perspiciatis.\n\nEa amet earum quidem voluptas. Iusto harum quis quia aspernatur qui rerum. Debitis rerum et suscipit et. Quo id error aut qui ipsam voluptatem.', 'Garret Langworth', '2024-10-23 10:46:25', '2024-10-23 10:46:25');
INSERT INTO `posts` (`id`, `title`, `content`, `author`, `created_at`, `updated_at`) VALUES
(85, 'Optio aliquam explicabo totam eius est fuga.', 'Incidunt et autem ducimus eum quisquam et. Explicabo eligendi sunt eligendi ut fugit vitae et. Tempore eum explicabo distinctio et.\n\nRepudiandae laborum ut voluptatum asperiores ut nam iusto. Aut sed dignissimos qui nostrum maxime. Qui ullam sapiente ut dolorum.\n\nAut reiciendis ullam ea nobis dicta vel. Aut numquam ullam ut eius optio. Unde nihil architecto consequatur modi cupiditate est quisquam. Vero alias qui eius explicabo.', 'Zachery Ortiz', '2024-10-23 10:46:25', '2024-10-23 10:46:25'),
(86, 'Assumenda autem ratione quae quasi rem.', 'Qui est ut iusto laborum fugiat ut ut. Accusantium dolores eveniet aut ut eligendi voluptatum quia quae. Debitis consectetur esse aliquam odio repellat nam et sunt. Ipsa dolores aut qui iste hic ipsa magnam.\n\nVeniam eveniet ea vel nemo. Reiciendis repellat sunt quisquam corporis voluptas qui. Voluptatem harum voluptatem possimus esse consequuntur.\n\nQuasi sed voluptatem voluptas voluptatem voluptas dolorem. Aut animi aut fuga. Eum quo dolorem omnis nulla itaque.', 'Dr. Pedro Walsh Jr.', '2024-10-23 10:46:25', '2024-10-23 10:46:25'),
(87, 'Aut sequi dolor cumque.', 'Magnam est recusandae ut aspernatur dolore. Culpa aut similique et est. Quos rem occaecati nihil id ab ipsa. Quo eveniet cupiditate id debitis nesciunt.\n\nPorro voluptatem non qui dignissimos sint odio. Eligendi officiis quidem aut eos. Blanditiis voluptate sit tenetur veritatis sint et.\n\nQuia et rerum earum fugiat et unde. Qui aut ipsum qui voluptatum adipisci. Illum voluptatem quia dolor optio. Deleniti ipsum hic non architecto ut suscipit voluptas.', 'Art Dooley', '2024-10-23 10:46:25', '2024-10-23 10:46:25'),
(88, 'Earum aut iure magni aliquid.', 'Autem excepturi magnam debitis corrupti sequi. Architecto suscipit ea asperiores magnam cum. Ex nostrum suscipit earum recusandae exercitationem et.\n\nCorporis animi consectetur laboriosam recusandae in sint. Sit dicta adipisci omnis neque. Magni inventore dolor voluptatibus quo. Minus ut aut vitae aliquid veniam sed ut.\n\nVoluptatibus ut animi nihil quia voluptatibus velit alias. Unde explicabo omnis hic in id blanditiis ea. Autem fugiat quis non beatae eum ad sunt velit.', 'Roy Morissette', '2024-10-23 10:46:25', '2024-10-23 10:46:25'),
(89, 'Veniam quia qui officia magni.', 'Consequatur et sunt asperiores. Dolor ratione omnis illo ipsam. Id quasi ullam et voluptatem.\n\nNumquam aperiam consequuntur architecto culpa adipisci. Eos labore accusamus et voluptatem ullam porro soluta omnis. Ipsam nesciunt quis dolor in. Aut quis unde aperiam voluptas vero.\n\nPariatur deleniti aperiam sed fugit mollitia optio aut. Corrupti tempora sapiente quas dolorum. Qui nisi autem rerum numquam nemo et.', 'Prof. Amos Collins Jr.', '2024-10-23 10:46:25', '2024-10-23 10:46:25'),
(90, 'Ullam accusamus maxime autem voluptatum in.', 'Non consequatur pariatur explicabo perspiciatis ea et. Error voluptatum expedita autem doloribus. Animi et nihil fugit non omnis vitae doloremque sequi. Velit numquam sed ipsum molestiae quis et.\n\nEos odio iure iure. Dolorem aliquam dolores aut velit aspernatur modi et. Molestiae molestias aut illum qui dolorum. Dolorem neque et consectetur.\n\nOfficiis rerum delectus facere aut. Nisi voluptates assumenda in consequatur qui. Aliquam voluptates magni animi veritatis culpa. Maiores consequuntur qui et et quos aliquam. Fuga vitae ducimus sed totam repellat delectus dolore.', 'Miss Lois Zieme Sr.', '2024-10-23 10:46:25', '2024-10-23 10:46:25'),
(91, 'Earum fugiat ad magnam.', 'Molestiae omnis ut accusamus vel suscipit dolore enim. Quae blanditiis exercitationem unde voluptatibus illo adipisci ab. Illo assumenda quod nesciunt quia sit minus id.\n\nEt sed fugiat et commodi explicabo ut sunt. Dicta consectetur libero tenetur non nisi. Labore ad ut quis qui maxime nihil. Perferendis exercitationem vel exercitationem rerum officia.\n\nVoluptatem qui libero non numquam doloremque rerum nostrum est. Eum et qui laboriosam cumque molestiae. Aut itaque molestias eius deleniti impedit natus amet. Quia dignissimos aut vero sit amet voluptatem ipsum.', 'Prof. Nova Stracke III', '2024-10-23 10:46:25', '2024-10-23 10:46:25'),
(92, 'Est distinctio minus et dolores alias velit.', 'Qui provident sed unde cupiditate facilis ex est ducimus. Qui autem sint at iure. Impedit porro eveniet expedita ex ipsum. Harum perferendis accusantium qui unde.\n\nEsse nemo quisquam enim ea. Aperiam voluptas laudantium itaque. Eaque voluptatum nihil et officiis.\n\nTenetur neque ratione quae. Aperiam consequatur repudiandae ut iure voluptas. Modi fuga quisquam est modi corrupti maxime consequatur. Quaerat sapiente omnis saepe iusto quibusdam dolorem.', 'Cyril Borer', '2024-10-23 10:46:25', '2024-10-23 10:46:25'),
(93, 'Temporibus eum iusto dicta voluptatibus officiis.', 'Repudiandae ut tenetur esse hic consectetur enim. Dolores tempora nostrum animi suscipit facilis. Voluptatum quasi voluptatem voluptatem illo.\n\nImpedit error non aut. Ea itaque qui consequatur ut. Quam explicabo sint nesciunt minus nam consequatur provident. Aut vel ducimus quia doloribus dolores sequi.\n\nVoluptatem dolore sit perspiciatis omnis est. Odio nostrum voluptatum odit omnis est ipsum iste at. Nihil et nihil nostrum dolore facere.', 'Alexys Feeney', '2024-10-23 10:46:25', '2024-10-23 10:46:25'),
(94, 'A consectetur et velit nostrum.', 'Quo praesentium cupiditate libero aperiam. Tempora id inventore culpa ea omnis quasi dolores. Non rem consequuntur repellat voluptate quisquam asperiores.\n\nAut labore accusantium ea deleniti minima aliquam voluptas quos. Vel voluptas iure consectetur perferendis esse numquam.\n\nRem cumque ullam dignissimos doloremque eligendi dolores. Repellat quo ipsum consequatur libero asperiores eligendi omnis illo. Quaerat voluptates eius tempore nihil amet est suscipit consequatur. Voluptate commodi assumenda tempora cumque accusamus eligendi quia dolor.', 'Dr. Torey Marks DVM', '2024-10-23 10:46:25', '2024-10-23 10:46:25'),
(95, 'Qui dolorum sint sint voluptas sequi eum in.', 'Et dolorum ratione commodi quis quis necessitatibus. In officia consectetur maiores quae hic consectetur aliquam sit.\n\nConsequatur quasi accusamus dolorum quo consectetur non fugit. Aspernatur quis corrupti aliquam nesciunt dolorum aut. Asperiores omnis corporis iste illum cupiditate asperiores doloribus. Ipsum quis et eaque repudiandae. Qui eos saepe at molestias est fugiat ratione soluta.\n\nExpedita ipsam explicabo sequi debitis reprehenderit omnis aut sit. Et atque ducimus et quis. Doloremque et rerum voluptatum labore voluptate. Ut asperiores qui assumenda eligendi.', 'Amina Sanford PhD', '2024-10-23 10:46:25', '2024-10-23 10:46:25'),
(96, 'Rerum possimus suscipit quod.', 'Quidem dignissimos et consequatur architecto. Cupiditate assumenda voluptatum atque provident. Voluptas quos qui omnis qui sed fugiat officia.\n\nEt odio ipsa accusamus dignissimos ea. Ut adipisci aut nemo deserunt illo. Similique mollitia consequatur ad quidem voluptas dolorem. Minus sed quibusdam laudantium est ullam dolores.\n\nSit voluptatem esse laborum porro molestiae ut. Omnis vitae odit aut illo. Animi sapiente non non commodi voluptas ab quas. Hic numquam libero accusantium ratione perferendis enim quaerat.', 'Casper Dickens', '2024-10-23 10:46:25', '2024-10-23 10:46:25'),
(97, 'Ipsum et consequatur nihil saepe impedit.', 'Est vel voluptatem deserunt labore voluptas quae veritatis amet. Laudantium voluptatem dolorum est. Et et placeat cumque quas architecto quam et. Dolor quidem architecto eaque. Quo hic fuga ad.\n\nEst necessitatibus debitis cumque perspiciatis sit. Nulla rerum omnis suscipit sed. Accusamus necessitatibus fugit repellendus quas distinctio.\n\nTemporibus harum officia voluptatibus aliquam. Dolor suscipit eius sequi harum nesciunt. Omnis eaque et laboriosam est nemo. Deserunt nostrum ut et et laudantium quia error.', 'Dr. Elsie Barton I', '2024-10-23 10:46:25', '2024-10-23 10:46:25'),
(98, 'Libero et dolorum et aut minus optio accusantium.', 'Eaque cum mollitia labore doloribus consequatur. Neque praesentium qui reiciendis eos. Quo voluptate perspiciatis culpa id maiores. Velit eum nemo doloremque voluptatem.\n\nRepellendus nam fugiat aspernatur debitis. Quis qui aliquam non at tempore. Tempora eum odit ullam deserunt.\n\nVeniam dolor vel quam nostrum quo delectus voluptas. Qui autem sint et autem quas. Quia rerum tempora ut rem deleniti voluptas.', 'Annabelle Lemke', '2024-10-23 10:46:25', '2024-10-23 10:46:25'),
(99, 'In illum consequatur repellat eum veniam.', 'Odio et nostrum sit esse. Neque quas quam nobis. Corrupti et aperiam accusantium sapiente. Harum culpa vero ducimus qui natus.\n\nMinima quo optio dolores esse hic molestias. Atque voluptas sunt qui qui quis. Mollitia cumque ullam vel quo similique. Aut quia consequuntur aliquam repellat est.\n\nEt numquam facere corporis molestiae laboriosam commodi autem dolorem. Molestias repudiandae tempora architecto voluptate maxime quod quia. Dicta sit sit et.', 'Uriah Monahan', '2024-10-23 10:46:25', '2024-10-23 10:46:25'),
(100, 'Et eius molestias ratione nam sit.', 'Perferendis qui laboriosam ratione et. Qui eos aut totam aut enim qui. Esse odit ut ratione doloremque.\n\nMaiores voluptatum laboriosam veniam. Eos molestias veritatis tenetur molestiae possimus. Ullam aperiam harum nihil rem. Pariatur omnis dolorem non ut consectetur quasi.\n\nNon illo distinctio illum voluptatem odit officiis est expedita. Et accusamus eius architecto illum voluptatem est assumenda. Porro veritatis tempore dolor. Est amet dolor ea exercitationem qui voluptas. Sunt et facilis ullam enim.', 'Maxime Kris', '2024-10-23 10:46:25', '2024-10-23 10:46:25'),
(101, 'New Post', 'This is the content of the new post', 'John Doe', '2024-10-23 11:04:07', '2024-10-23 11:04:07'),
(102, 'Neha Sharma', 'This is the content of the new post', 'John Doe', '2024-10-23 16:35:39', '2024-10-23 16:35:39'),
(103, 'Pawan Sharma', 'This is the content of the new post', 'John Doe', '2024-10-24 04:44:44', '2024-10-24 04:44:44');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `item_code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `keywords` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci,
  `category_id` bigint UNSIGNED DEFAULT NULL,
  `brand_id` bigint UNSIGNED DEFAULT NULL,
  `tax_id` bigint UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `name`, `slug`, `image`, `item_code`, `keywords`, `description`, `category_id`, `brand_id`, `tax_id`, `created_at`, `updated_at`) VALUES
(1, 'Dalchini', 'Dalchini', 'images/products/1727937844.png', 'DAL001', 'dal-chini', 'dal-chini', 1, 1, 2, '2024-10-03 01:14:04', '2024-10-03 01:14:04'),
(2, 'Shoes', 'Shoes', 'images/products/1727938089.png', 'SHOES001', '123', '123 Is Food', 1, 1, 2, '2024-10-03 01:18:09', '2024-10-03 01:18:09'),
(3, 'Shirts', 'Shirts', 'images/products/1727939165.png', 'SHIRTS001', 'SHIRTS001-SHIRTS001', 'SHIRTS001 SHIRTS001 SHIRTS001', 1, 1, 2, '2024-10-03 01:36:05', '2024-10-03 01:36:05'),
(4, 'Franks', 'FRANKS', 'images/products/1727939355.png', 'FRANKS002', 'FRANKS002 FRANKS002', 'FRANKS002 FRANKS002FRANKS002 FRANKS002 FRANKS002', 1, 1, 2, '2024-10-03 01:39:15', '2024-10-03 01:39:15'),
(5, 'Telephone', 'Telephone', 'images/products/1727964127.png', 'TEL001', 'Telephone', 'Telephone', 1, 1, 3, '2024-10-03 08:32:07', '2024-10-03 08:32:07');

-- --------------------------------------------------------

--
-- Table structure for table `product_attributes`
--

CREATE TABLE `product_attributes` (
  `id` bigint UNSIGNED NOT NULL,
  `product_id` bigint UNSIGNED DEFAULT NULL,
  `category_id` bigint UNSIGNED DEFAULT NULL,
  `attribute_value_id` bigint UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `product_attributes`
--

INSERT INTO `product_attributes` (`id`, `product_id`, `category_id`, `attribute_value_id`, `created_at`, `updated_at`) VALUES
(4, 3, 1, 1, '2024-10-03 01:36:05', '2024-10-03 01:36:05'),
(5, 3, 1, 2, '2024-10-03 01:36:05', '2024-10-03 01:36:05'),
(6, 3, 1, 3, '2024-10-03 01:36:05', '2024-10-03 01:36:05'),
(7, 1, 1, 1, '2024-10-03 01:36:16', '2024-10-03 01:36:16'),
(8, 2, 1, 4, '2024-10-03 01:36:33', '2024-10-03 01:36:33'),
(13, 4, 1, 3, '2024-10-03 08:25:02', '2024-10-03 08:25:02'),
(14, 4, 1, 1, '2024-10-03 08:25:02', '2024-10-03 08:25:02'),
(15, 4, 1, 2, '2024-10-03 08:25:02', '2024-10-03 08:25:02'),
(58, 5, 1, 4, '2024-10-04 04:03:32', '2024-10-04 04:03:32'),
(59, 5, 1, 1, '2024-10-04 04:03:32', '2024-10-04 04:03:32'),
(60, 5, 1, 2, '2024-10-04 04:03:32', '2024-10-04 04:03:32');

-- --------------------------------------------------------

--
-- Table structure for table `product_attrs`
--

CREATE TABLE `product_attrs` (
  `id` bigint UNSIGNED NOT NULL,
  `product_id` bigint UNSIGNED DEFAULT NULL,
  `color_id` bigint UNSIGNED DEFAULT NULL,
  `size_id` bigint UNSIGNED DEFAULT NULL,
  `sku` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mrp` int NOT NULL DEFAULT '0',
  `price` int NOT NULL DEFAULT '0',
  `qty` int NOT NULL DEFAULT '1',
  `length` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1',
  `breadth` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1',
  `height` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1',
  `weight` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `product_attrs`
--

INSERT INTO `product_attrs` (`id`, `product_id`, `color_id`, `size_id`, `sku`, `mrp`, `price`, `qty`, `length`, `breadth`, `height`, `weight`, `created_at`, `updated_at`) VALUES
(1, 5, 1, 1, 'SKU1', 1, 2, 3, '4', '5', '6', '7', '2024-10-03 22:45:38', '2024-10-03 22:45:38'),
(2, 5, 3, 1, '3', 4, 6, 7, '8', '9', '10', '12', '2024-10-03 22:45:39', '2024-10-03 22:45:39'),
(3, 5, 3, 1, 'SKU1', 1, 2, 3, '4', '5', '6', '7', '2024-10-04 04:03:32', '2024-10-04 04:03:32'),
(4, 5, 4, 1, '3', 4, 6, 7, '8', '9', '10', '12', '2024-10-04 04:03:32', '2024-10-04 04:03:32');

-- --------------------------------------------------------

--
-- Table structure for table `product_attr_images`
--

CREATE TABLE `product_attr_images` (
  `id` bigint UNSIGNED NOT NULL,
  `product_id` bigint UNSIGNED DEFAULT NULL,
  `product_attr_id` bigint UNSIGNED DEFAULT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `slug`, `created_at`, `updated_at`) VALUES
(1, 'Admin', 'admin', '2024-09-02 01:39:32', '2024-09-02 01:39:32'),
(2, 'Sales', 'sales', '2024-09-02 01:39:32', '2024-09-02 01:39:32');

-- --------------------------------------------------------

--
-- Table structure for table `sizes`
--

CREATE TABLE `sizes` (
  `id` bigint UNSIGNED NOT NULL,
  `text` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sizes`
--

INSERT INTO `sizes` (`id`, `text`, `created_at`, `updated_at`) VALUES
(1, '34x3r3', '2024-09-23 22:13:04', '2024-09-23 22:13:04'),
(3, '12x23', '2024-09-24 20:34:52', '2024-09-24 20:34:52'),
(4, '23456x12356', '2024-09-24 20:35:02', '2024-09-24 20:36:14');

-- --------------------------------------------------------

--
-- Table structure for table `taxes`
--

CREATE TABLE `taxes` (
  `id` bigint UNSIGNED NOT NULL,
  `text` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `taxes`
--

INSERT INTO `taxes` (`id`, `text`, `created_at`, `updated_at`) VALUES
(2, 18, '2024-10-01 06:15:07', '2024-10-01 06:15:19'),
(3, 24, '2024-10-03 03:16:43', '2024-10-03 03:16:43');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `twitter_link` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fb_link` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `insta_link` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `image`, `phone`, `address`, `twitter_link`, `fb_link`, `insta_link`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Rskantha Crafts', 'pawank@exeire.com', 'images/Rskantha Crafts_1728208314.png', '8010043297', '2/148 Vinamra Khand Gomti Nagar', 'ok', 'Not Ok', 'ok.ok.ok', NULL, '$2y$12$IqdKFtIhj3gQ2NQRsTql8.bFk4yUPdk0aMWO21MN/zSUkdEv7sm/y', NULL, '2024-09-01 20:10:29', '2024-10-06 05:05:51');

-- --------------------------------------------------------

--
-- Table structure for table `user_roles`
--

CREATE TABLE `user_roles` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `role_id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `user_roles`
--

INSERT INTO `user_roles` (`id`, `user_id`, `role_id`, `created_at`, `updated_at`) VALUES
(1, 1, 1, NULL, NULL);

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
-- Indexes for table `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`id`);

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
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `attribute_values`
--
ALTER TABLE `attribute_values`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `brands`
--
ALTER TABLE `brands`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `category_attribute`
--
ALTER TABLE `category_attribute`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `colors`
--
ALTER TABLE `colors`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `home_banners`
--
ALTER TABLE `home_banners`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=104;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `product_attributes`
--
ALTER TABLE `product_attributes`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=61;

--
-- AUTO_INCREMENT for table `product_attrs`
--
ALTER TABLE `product_attrs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `product_attr_images`
--
ALTER TABLE `product_attr_images`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `sizes`
--
ALTER TABLE `sizes`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `taxes`
--
ALTER TABLE `taxes`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `user_roles`
--
ALTER TABLE `user_roles`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

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

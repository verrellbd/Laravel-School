-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 04, 2020 at 05:08 AM
-- Server version: 10.1.35-MariaDB
-- PHP Version: 7.2.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `sekolah`
--

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `guru`
--

CREATE TABLE `guru` (
  `id` int(11) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `telepon` varchar(15) NOT NULL,
  `alamat` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `guru`
--

INSERT INTO `guru` (`id`, `nama`, `telepon`, `alamat`, `created_at`, `updated_at`) VALUES
(1, 'sarjono', '087871498655', 'Depok', '2019-11-10 02:13:39', '0000-00-00 00:00:00'),
(2, 'adi', '082132847987', 'Jakarta', '2019-11-10 02:13:39', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `mapel`
--

CREATE TABLE `mapel` (
  `id` int(11) NOT NULL,
  `kode` varchar(191) NOT NULL,
  `nama` varchar(191) NOT NULL,
  `semester` varchar(45) NOT NULL,
  `guru_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `mapel`
--

INSERT INTO `mapel` (`id`, `kode`, `nama`, `semester`, `guru_id`, `created_at`, `updated_at`) VALUES
(1, 'M-001', 'Matematika Dasar', 'ganjil', 1, '2019-11-06 01:53:25', '0000-00-00 00:00:00'),
(2, 'B-001', 'Bahasa Indonesia', 'ganjil', 1, '2019-11-06 01:53:25', '0000-00-00 00:00:00'),
(3, 'A-001', 'Agama', 'ganjil', 2, '2019-11-10 02:14:52', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `mapel_siswa`
--

CREATE TABLE `mapel_siswa` (
  `id` int(11) NOT NULL,
  `siswa_id` int(11) NOT NULL,
  `mapel_id` int(11) NOT NULL,
  `nilai` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `mapel_siswa`
--

INSERT INTO `mapel_siswa` (`id`, `siswa_id`, `mapel_id`, `nilai`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 90, '2019-11-06 01:54:15', '2019-11-09 14:05:12'),
(3, 2, 1, 95, '2019-11-06 01:55:57', '0000-00-00 00:00:00'),
(4, 1, 2, 85, '2019-11-09 19:17:14', '2019-11-10 02:17:14'),
(5, 1, 3, 70, '2019-11-09 19:17:22', '2019-11-10 02:17:22'),
(6, 3, 1, 80, '2019-11-12 19:17:51', '2019-11-13 02:17:51'),
(7, 4, 3, 60, '2019-11-12 19:18:04', '2019-11-13 02:18:04');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_11_01_021850_create_siswa_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

CREATE TABLE `posts` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `content` text NOT NULL,
  `slug` varchar(255) NOT NULL,
  `thumbnail` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`id`, `user_id`, `title`, `content`, `slug`, `thumbnail`, `created_at`, `updated_at`) VALUES
(1, 1, 'ini berita pertama', 'ini berita pertama lagi pengen coba aja apakah masuk atau ngak', 'ini-berita-pertama', '', '2019-11-15 07:16:46', '0000-00-00 00:00:00'),
(2, 1, 'pengumuman kelulusan', 'yak jadi diumumkan bahwa tahun sekian ini akan diluluskan murid berjumlah', 'pengumuman-kelulusan', '', '2019-11-16 03:02:37', '0000-00-00 00:00:00'),
(3, 1, 'post ketiga', '<p>kasdnklsal <i><strong>asjnklsansld </strong></i>kasndsad jkasnklsdnklas asknklsdankl kasdndlkdnsklas</p>', 'post-ketiga', '/photos/1/rare sply.png', '2019-11-15 22:33:47', '2019-11-16 05:33:47'),
(4, 1, 'post ketiga', '<p>kasdnklsal <i><strong>asjnklsansld </strong></i>kasndsad jkasnklsdnklas asknklsdankl kasdndlkdnsklas</p>', 'post-ketiga-1', '/photos/1/rare sply.png', '2019-11-15 22:34:07', '2019-11-16 05:34:07');

-- --------------------------------------------------------

--
-- Table structure for table `siswa`
--

CREATE TABLE `siswa` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL,
  `nama_depan` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nama_belakang` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `jenis_kelamin` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `agama` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `alamat` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `avatar` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `siswa`
--

INSERT INTO `siswa` (`id`, `user_id`, `nama_depan`, `nama_belakang`, `jenis_kelamin`, `agama`, `alamat`, `avatar`, `created_at`, `updated_at`) VALUES
(1, 0, 'Dean', 'Verrell', 'L', 'Khonghucu', 'Jl.Nusantara Raya no 61', NULL, '2019-10-31 17:00:00', '2019-11-04 20:54:06'),
(2, 0, 'Hackler', 'Pro', 'P', 'Hacking', 'Jl. Kebangsaan hacker', NULL, NULL, NULL),
(5, 7, 'Siapa', 'Aja', 'L', 'sadasdasdasd', 'asdasasdasdasd', NULL, '2019-11-14 22:32:23', '2019-11-14 22:32:23'),
(6, 10, 'Apaan', 'Hiya', 'L', 'asndjka', 'njknsadkasd', NULL, '2019-11-14 22:35:43', '2019-11-14 22:35:43'),
(7, 11, 'Test', 'Test', 'S', 'sadasas', 'asdsdaasd', NULL, '2019-11-14 22:55:04', '2019-11-14 22:55:04'),
(8, 100, 'Isac O\'Keefe Sr.', '', 'L', 'Budha', '80160 Randal Circle\nPort Avery, UT 17539', NULL, '2019-11-18 19:59:17', '2019-11-18 19:59:17'),
(9, 100, 'Raegan Lubowitz', '', 'L', 'Hindu', '754 Herzog Mountain\nGreenholtmouth, MS 59971-2953', NULL, '2019-11-18 19:59:17', '2019-11-18 19:59:17'),
(10, 100, 'Pascale Hilpert', '', 'P', 'Katolik', '6873 Hermiston Field\nJohnnyfort, DC 32737-0791', NULL, '2019-11-18 19:59:17', '2019-11-18 19:59:17'),
(11, 100, 'Dr. Verlie Zulauf PhD', '', 'L', 'Hindu', '18423 Mohr Fords\nDooleyville, OR 08491-3063', NULL, '2019-11-18 19:59:17', '2019-11-18 19:59:17'),
(12, 100, 'Tressa Reinger', '', 'L', 'Kristen', '6172 Berge Roads Apt. 789\nProsaccoland, MN 19378-2433', NULL, '2019-11-18 19:59:17', '2019-11-18 19:59:17'),
(13, 100, 'Rafael Kautzer', '', 'L', 'Kristen', '76206 Alford Locks\nHeidenreichborough, VT 44922-8729', NULL, '2019-11-18 19:59:17', '2019-11-18 19:59:17'),
(14, 100, 'Alan Hammes', '', 'L', 'Khonghucu', '847 McClure Skyway Suite 435\nLake Mayhaven, SD 62674', NULL, '2019-11-18 19:59:17', '2019-11-18 19:59:17'),
(15, 100, 'Edgardo Considine', '', 'L', 'Islam', '70600 Ryan Inlet\nSchambergerbury, RI 42534', NULL, '2019-11-18 19:59:17', '2019-11-18 19:59:17'),
(16, 100, 'Francisca Cartwright', '', 'L', 'Hindu', '7630 Dannie Street Apt. 148\nEast Dariusborough, NC 55417-7366', NULL, '2019-11-18 19:59:17', '2019-11-18 19:59:17'),
(17, 100, 'Jaylon Schuppe', '', 'P', 'Khonghucu', '9898 Patrick Highway\nLeoneborough, SC 40061', NULL, '2019-11-18 19:59:18', '2019-11-18 19:59:18'),
(18, 100, 'Prof. Agnes Bode MD', '', 'P', 'Islam', '1569 Afton Gardens Suite 213\nAmelieberg, MT 88295-6774', NULL, '2019-11-18 19:59:18', '2019-11-18 19:59:18'),
(19, 100, 'Mozell Koss', '', 'L', 'Budha', '235 Waters Isle\nBrekkeberg, MT 51227', NULL, '2019-11-18 19:59:18', '2019-11-18 19:59:18'),
(20, 100, 'Jeromy Daugherty', '', 'L', 'Kristen', '39515 Kozey Course Suite 640\nJaniceport, AK 36914-3714', NULL, '2019-11-18 19:59:18', '2019-11-18 19:59:18'),
(21, 100, 'Prof. Therese Nienow', '', 'P', 'Islam', '545 Loma Course Apt. 668\nPort Araceliton, MA 29520', NULL, '2019-11-18 19:59:18', '2019-11-18 19:59:18'),
(22, 100, 'Vita Sporer', '', 'P', 'Hindu', '69833 Aurelie Crossroad Apt. 216\nNorth Raoul, MD 03009-4851', NULL, '2019-11-18 19:59:18', '2019-11-18 19:59:18'),
(23, 100, 'Prof. Leonel Keeling III', '', 'P', 'Katolik', '823 Tressie Rest Apt. 918\nRauburgh, ME 19343', NULL, '2019-11-18 19:59:18', '2019-11-18 19:59:18'),
(24, 100, 'Jeremie Rosenbaum Sr.', '', 'P', 'Budha', '776 Sanford Port\nBaileyborough, ND 94463', NULL, '2019-11-18 19:59:18', '2019-11-18 19:59:18'),
(25, 100, 'Monte Reichert', '', 'P', 'Islam', '25585 Pagac Highway Apt. 451\nHodkiewiczville, DC 06617-0819', NULL, '2019-11-18 19:59:18', '2019-11-18 19:59:18'),
(26, 100, 'Miss Lelah Hayes Sr.', '', 'L', 'Kristen', '53056 Delta Oval\nEast Ivamouth, WV 69016', NULL, '2019-11-18 19:59:18', '2019-11-18 19:59:18'),
(27, 100, 'Victor Upton', '', 'P', 'Hindu', '533 Steuber Neck\nFerrybury, WI 77756', NULL, '2019-11-18 19:59:18', '2019-11-18 19:59:18'),
(28, 100, 'Minerva Ritchie', '', 'P', 'Kristen', '5043 Astrid Union Suite 363\nPort Janaebury, MA 24095-9932', NULL, '2019-11-18 19:59:18', '2019-11-18 19:59:18'),
(29, 100, 'Mr. Ernest Hermiston II', '', 'P', 'Khonghucu', '8716 Collins Motorway\nPort Kaylaburgh, IL 07683-6581', NULL, '2019-11-18 19:59:18', '2019-11-18 19:59:18'),
(30, 100, 'Devante Ryan', '', 'L', 'Budha', '36719 Lind Manor\nNorth Jacinto, IL 30749', NULL, '2019-11-18 19:59:18', '2019-11-18 19:59:18'),
(31, 100, 'Tiffany Stiedemann', '', 'P', 'Islam', '2336 Littel Station Apt. 736\nAraville, NH 43252-4498', NULL, '2019-11-18 19:59:18', '2019-11-18 19:59:18'),
(32, 100, 'June Funk V', '', 'L', 'Hindu', '628 Ratke Common Apt. 530\nPort Hillardport, PA 19846', NULL, '2019-11-18 19:59:18', '2019-11-18 19:59:18'),
(33, 100, 'Prof. Bartholome Luettgen PhD', '', 'P', 'Hindu', '66394 Nayeli Isle Apt. 241\nPort Rashawn, MS 13227-5569', NULL, '2019-11-18 19:59:18', '2019-11-18 19:59:18'),
(34, 100, 'Jeffrey DuBuque', '', 'P', 'Islam', '16501 Monte Shore Suite 657\nNew Liana, MI 40983-0516', NULL, '2019-11-18 19:59:18', '2019-11-18 19:59:18'),
(35, 100, 'Demond Crooks', '', 'L', 'Katolik', '10577 O\'Connell Meadow\nHacketttown, MT 48094-6975', NULL, '2019-11-18 19:59:18', '2019-11-18 19:59:18'),
(36, 100, 'Miss Lelah Crist', '', 'P', 'Kristen', '7889 Miller Glens\nNew Lucas, CT 86714-4440', NULL, '2019-11-18 19:59:18', '2019-11-18 19:59:18'),
(37, 100, 'Jerel Bergstrom', '', 'P', 'Kristen', '295 Emard Valley\nEast Lexie, DE 14477-9343', NULL, '2019-11-18 19:59:18', '2019-11-18 19:59:18'),
(38, 100, 'Margot Kshlerin', '', 'L', 'Katolik', '326 Holly Lane\nSouth Marielle, DE 26001-8078', NULL, '2019-11-18 19:59:18', '2019-11-18 19:59:18'),
(39, 100, 'Prof. Grace Graham', '', 'L', 'Budha', '3844 Theresia Path Apt. 277\nHodkiewiczmouth, WI 04459', NULL, '2019-11-18 19:59:18', '2019-11-18 19:59:18'),
(40, 100, 'Ida Koch MD', '', 'P', 'Budha', '939 Homenick Course Apt. 112\nKathleenside, ND 35477', NULL, '2019-11-18 19:59:18', '2019-11-18 19:59:18'),
(42, 100, 'Vilma Paucek', '', 'P', 'Hindu', '58529 Mellie Mission Suite 778\nPort Marshall, OR 65048', NULL, '2019-11-18 19:59:18', '2019-11-18 19:59:18'),
(43, 100, 'Stephany Sawayn', '', 'P', 'Budha', '632 Mann Tunnel Suite 379\nNew Mikaylafort, OH 31795', NULL, '2019-11-18 19:59:18', '2019-11-18 19:59:18'),
(44, 100, 'Mrs. Dorris Cremin PhD', '', 'L', 'Hindu', '31298 Ebert Valley\nHilpertchester, ME 70038', NULL, '2019-11-18 19:59:18', '2019-11-18 19:59:18'),
(45, 100, 'Mr. Jean Will', '', 'P', 'Katolik', '312 Earline Highway Apt. 363\nJerrodview, FL 86280', NULL, '2019-11-18 19:59:19', '2019-11-18 19:59:19'),
(46, 100, 'Matilde Kirlin PhD', '', 'L', 'Islam', '939 Stark Path\nHesselton, NJ 63455-5459', NULL, '2019-11-18 19:59:19', '2019-11-18 19:59:19'),
(47, 100, 'Ciara Mills', '', 'P', 'Islam', '460 Turner Skyway Apt. 224\nRobelshire, CT 14148-5407', NULL, '2019-11-18 19:59:19', '2019-11-18 19:59:19'),
(48, 100, 'Felipe Zieme II', '', 'P', 'Kristen', '4718 Spencer Curve\nCloydchester, CA 06191-2481', NULL, '2019-11-18 19:59:19', '2019-11-18 19:59:19'),
(49, 100, 'Jarvis Dooley', '', 'L', 'Budha', '52377 Purdy Vista Apt. 106\nEast Gilberto, DE 45877', NULL, '2019-11-18 19:59:19', '2019-11-18 19:59:19'),
(50, 100, 'Blanche Ullrich', '', 'L', 'Hindu', '90763 Toy River Suite 774\nWest Marquis, AZ 59630', NULL, '2019-11-18 19:59:19', '2019-11-18 19:59:19'),
(51, 100, 'Gavin Heaney', '', 'L', 'Kristen', '643 Zboncak Crest Suite 036\nEast Caleigh, MT 09249-8849', NULL, '2019-11-18 19:59:19', '2019-11-18 19:59:19'),
(52, 100, 'Miss Concepcion Shields PhD', '', 'P', 'Budha', '8945 Jaskolski Path Suite 350\nNew Mariane, VT 55690-3889', NULL, '2019-11-18 19:59:19', '2019-11-18 19:59:19'),
(53, 100, 'Dr. Dell Predovic DDS', '', 'L', 'Islam', '39838 Pfannerstill Forks Apt. 932\nLake Vinnie, TX 79035', NULL, '2019-11-18 19:59:19', '2019-11-18 19:59:19'),
(54, 100, 'Scotty Stroman DVM', '', 'L', 'Hindu', '668 Volkman Dam Apt. 634\nRafaelland, NC 59868', NULL, '2019-11-18 19:59:19', '2019-11-18 19:59:19'),
(55, 100, 'Mr. Vince Anderson IV', '', 'L', 'Hindu', '4213 Lesch Circles\nPort Otisberg, MN 07057', NULL, '2019-11-18 19:59:19', '2019-11-18 19:59:19'),
(56, 100, 'Mrs. Wava Schneider', '', 'P', 'Hindu', '259 Cartwright Station\nJuliethaven, NM 26740', NULL, '2019-11-18 19:59:19', '2019-11-18 19:59:19'),
(57, 100, 'Kiarra Schneider', '', 'P', 'Khonghucu', '598 Stoltenberg Green\nJenkinsmouth, DC 09850-8220', NULL, '2019-11-18 19:59:19', '2019-11-18 19:59:19'),
(58, 100, 'Prof. Grover Hessel', '', 'L', 'Kristen', '63498 Edgar Grove Apt. 080\nNorth Kieramouth, IL 91083-6387', NULL, '2019-11-18 19:59:19', '2019-11-18 19:59:19'),
(59, 100, 'Vesta Romaguera', '', 'L', 'Islam', '22286 Larson Union Suite 222\nSouth Caylafurt, TN 64819-7748', NULL, '2019-11-18 19:59:19', '2019-11-18 19:59:19'),
(60, 100, 'Major Haag', '', 'L', 'Khonghucu', '1737 Monte Junction Apt. 459\nLake Rylanmouth, ND 15991-7473', NULL, '2019-11-18 19:59:19', '2019-11-18 19:59:19'),
(61, 100, 'Mr. Ahmed Lynch PhD', '', 'P', 'Kristen', '9538 Dariana Vista Suite 776\nNorth Ozella, WI 76898', NULL, '2019-11-18 19:59:19', '2019-11-18 19:59:19'),
(62, 100, 'Trinity Shanahan', '', 'P', 'Katolik', '30089 Donald Loaf Apt. 083\nMorarport, MA 94961', NULL, '2019-11-18 19:59:19', '2019-11-18 19:59:19'),
(63, 100, 'Dr. Chris Ryan', '', 'L', 'Kristen', '26138 Lisandro Flats\nStrackemouth, IA 33385', NULL, '2019-11-18 19:59:19', '2019-11-18 19:59:19'),
(64, 100, 'Maxwell Medhurst I', '', 'P', 'Hindu', '60688 Kshlerin Corners\nPort Brannon, KS 11516-0779', NULL, '2019-11-18 19:59:19', '2019-11-18 19:59:19'),
(65, 100, 'Dr. Bertha Herzog I', '', 'L', 'Katolik', '73686 Gleason Alley Suite 489\nSouth Verlahaven, DE 30829-8749', NULL, '2019-11-18 19:59:19', '2019-11-18 19:59:19'),
(66, 100, 'Mr. Andres Rohan', '', 'L', 'Islam', '9317 Wilhelmine Isle\nLake Annetteton, KY 80042', NULL, '2019-11-18 19:59:19', '2019-11-18 19:59:19'),
(67, 100, 'Prof. Emanuel Kiehn', '', 'L', 'Kristen', '609 Zoey Island\nPort Arnold, ME 52421-2909', NULL, '2019-11-18 19:59:19', '2019-11-18 19:59:19'),
(68, 100, 'Susan Bartoletti', '', 'P', 'Khonghucu', '83649 Witting Point Suite 506\nQuigleyhaven, VA 64196', NULL, '2019-11-18 19:59:19', '2019-11-18 19:59:19'),
(69, 100, 'Damien Nader', '', 'L', 'Khonghucu', '93835 Buckridge Cape Suite 800\nKurtisport, IN 31399-4427', NULL, '2019-11-18 19:59:19', '2019-11-18 19:59:19'),
(70, 100, 'Dr. Orville Sipes', '', 'P', 'Kristen', '8761 Nitzsche Ports Apt. 593\nSouth Georgiannaborough, IN 20183-8556', NULL, '2019-11-18 19:59:19', '2019-11-18 19:59:19'),
(71, 100, 'Mr. D\'angelo Gottlieb II', '', 'L', 'Budha', '66450 Larissa Cliff\nMillerside, IN 88229', NULL, '2019-11-18 19:59:19', '2019-11-18 19:59:19'),
(72, 100, 'Caroline Ryan', '', 'P', 'Hindu', '1266 Marcelo Mews\nSouth Donaldburgh, KY 58914-3182', NULL, '2019-11-18 19:59:19', '2019-11-18 19:59:19'),
(73, 100, 'Bonnie Ledner', '', 'P', 'Hindu', '372 Abshire Street\nWest Hollyside, IL 10495', NULL, '2019-11-18 19:59:20', '2019-11-18 19:59:20'),
(74, 100, 'Matilda O\'Reilly', '', 'P', 'Islam', '276 Joel Meadows\nEast Shanonborough, MS 68215', NULL, '2019-11-18 19:59:20', '2019-11-18 19:59:20'),
(75, 100, 'Salvador Powlowski', '', 'L', 'Budha', '592 Dickens Summit\nLaurineton, IN 10714', NULL, '2019-11-18 19:59:20', '2019-11-18 19:59:20'),
(76, 100, 'Opal Leuschke', '', 'P', 'Katolik', '443 Milo Street Apt. 993\nNew Orinhaven, DE 98336-9098', NULL, '2019-11-18 19:59:20', '2019-11-18 19:59:20'),
(77, 100, 'Bertrand Corkery', '', 'P', 'Budha', '36675 Schaefer Cliff\nPort Alexandrine, PA 48950', NULL, '2019-11-18 19:59:20', '2019-11-18 19:59:20'),
(78, 100, 'Stephania Nicolas', '', 'L', 'Hindu', '449 Kiehn Track\nKeeganstad, WY 64779', NULL, '2019-11-18 19:59:20', '2019-11-18 19:59:20'),
(79, 100, 'Taylor Davis V', '', 'P', 'Katolik', '10815 Windler Port Apt. 885\nWaelchiview, RI 97461', NULL, '2019-11-18 19:59:20', '2019-11-18 19:59:20'),
(80, 100, 'Jarvis O\'Connell', '', 'L', 'Hindu', '2808 McCullough Glens Apt. 615\nSmithamstad, SD 19423', NULL, '2019-11-18 19:59:20', '2019-11-18 19:59:20'),
(81, 100, 'Ms. Paige Crona PhD', '', 'P', 'Khonghucu', '75541 Deion Landing Apt. 816\nLake Mona, NJ 21418', NULL, '2019-11-18 19:59:20', '2019-11-18 19:59:20'),
(82, 100, 'Ms. Leola Metz II', '', 'L', 'Katolik', '375 Johnston Path\nLeemouth, CA 87223', NULL, '2019-11-18 19:59:20', '2019-11-18 19:59:20'),
(83, 100, 'Alessandro Konopelski', '', 'P', 'Katolik', '5498 Klocko Throughway Apt. 466\nNorth Wendellmouth, IN 36745', NULL, '2019-11-18 19:59:20', '2019-11-18 19:59:20'),
(84, 100, 'Polly Johnston', '', 'L', 'Hindu', '495 Cecilia Unions Suite 061\nOndrickaside, DE 26596-0172', NULL, '2019-11-18 19:59:20', '2019-11-18 19:59:20'),
(85, 100, 'Emerald Miller', '', 'L', 'Kristen', '234 Zboncak Extension\nWest Nicklaus, NM 42791', NULL, '2019-11-18 19:59:20', '2019-11-18 19:59:20'),
(86, 100, 'Ike Kreiger DDS', '', 'P', 'Katolik', '2620 Considine Court\nPort Paris, OR 16928-8137', NULL, '2019-11-18 19:59:20', '2019-11-18 19:59:20'),
(87, 100, 'Gudrun Schimmel', '', 'L', 'Khonghucu', '4321 Mills Plain Apt. 312\nLake Myafurt, OH 25660-2542', NULL, '2019-11-18 19:59:20', '2019-11-18 19:59:20'),
(88, 100, 'Lourdes Kling II', '', 'P', 'Katolik', '966 Jada Gateway\nKaiafort, TN 20099-9010', NULL, '2019-11-18 19:59:20', '2019-11-18 19:59:20'),
(89, 100, 'Delmer Gerlach', '', 'L', 'Katolik', '158 Magali Grove Apt. 576\nWest Fatimashire, MD 59454-3040', NULL, '2019-11-18 19:59:20', '2019-11-18 19:59:20'),
(90, 100, 'Dr. Trever Weissnat DVM', '', 'P', 'Budha', '8215 Stiedemann Mountains Apt. 477\nWest Anthony, AL 01252-6138', NULL, '2019-11-18 19:59:20', '2019-11-18 19:59:20'),
(91, 100, 'Natalie Rogahn', '', 'L', 'Budha', '665 Ethan Mount Suite 539\nSouth Victorview, KS 08625-2305', NULL, '2019-11-18 19:59:20', '2019-11-18 19:59:20'),
(92, 100, 'Precious Keebler', '', 'P', 'Katolik', '941 Stroman Ports Suite 112\nAnnaberg, UT 96695-7195', NULL, '2019-11-18 19:59:20', '2019-11-18 19:59:20'),
(93, 100, 'Daphnee O\'Connell', '', 'P', 'Budha', '270 Jamey Isle\nWalterfort, TN 24647', NULL, '2019-11-18 19:59:20', '2019-11-18 19:59:20'),
(94, 100, 'Percy Kuvalis', '', 'L', 'Budha', '2369 Jane Harbors\nNew Keshaun, ME 27906-7999', NULL, '2019-11-18 19:59:20', '2019-11-18 19:59:20'),
(95, 100, 'Nichole Kertzmann IV', '', 'P', 'Hindu', '4612 Conor Village Apt. 523\nEast Silas, IN 31701', NULL, '2019-11-18 19:59:20', '2019-11-18 19:59:20'),
(96, 100, 'Prof. Gilberto Nolan', '', 'P', 'Khonghucu', '16418 Petra Center\nLake Theo, ME 84234-8149', NULL, '2019-11-18 19:59:20', '2019-11-18 19:59:20'),
(97, 100, 'Eleonore Bernhard', '', 'P', 'Khonghucu', '5402 Elissa Flats\nNorth Tyrelfort, OH 44172', NULL, '2019-11-18 19:59:20', '2019-11-18 19:59:20'),
(98, 100, 'Samantha Cummerata', '', 'L', 'Katolik', '83999 Moen Row\nSouth Rita, VT 81943', NULL, '2019-11-18 19:59:20', '2019-11-18 19:59:20'),
(99, 100, 'Kasey Morissette', '', 'L', 'Budha', '1101 Jevon Hollow\nSwaniawskibury, ME 14453-8851', NULL, '2019-11-18 19:59:20', '2019-11-18 19:59:20'),
(100, 100, 'Mr. Florian Willms III', '', 'P', 'Kristen', '329 Feest Ways Apt. 202\nEast Ed, VT 72667-2928', NULL, '2019-11-18 19:59:21', '2019-11-18 19:59:21'),
(101, 100, 'Shanie Murazik', '', 'L', 'Islam', '621 Alene Rapid\nRolandoville, AR 05206-3185', NULL, '2019-11-18 19:59:21', '2019-11-18 19:59:21'),
(102, 100, 'Shanon Hegmann', '', 'L', 'Khonghucu', '9030 Pollich Viaduct Apt. 089\nPort Domenicastad, OR 51891', NULL, '2019-11-18 19:59:21', '2019-11-18 19:59:21'),
(103, 100, 'Prof. Deon Harris IV', '', 'L', 'Katolik', '410 Mills Mall Suite 436\nMaribelburgh, NC 25825', NULL, '2019-11-18 19:59:21', '2019-11-18 19:59:21'),
(104, 100, 'Prince Larson', '', 'P', 'Khonghucu', '7391 Jaeden Squares\nSawaynfurt, KS 55758', NULL, '2019-11-18 19:59:21', '2019-11-18 19:59:21'),
(105, 100, 'Giovani Schaden', '', 'P', 'Hindu', '980 Terry Parks\nLurafort, IN 72906-0029', NULL, '2019-11-18 19:59:21', '2019-11-18 19:59:21'),
(106, 100, 'Tavares Jacobi', '', 'L', 'Budha', '3600 Ari Plains\nKrajcikville, IN 56148', NULL, '2019-11-18 19:59:21', '2019-11-18 19:59:21'),
(107, 100, 'Prof. Maurine Mann', '', 'L', 'Hindu', '5322 Lionel Squares Suite 483\nSouth Gerald, MO 72973-4747', NULL, '2019-11-18 19:59:21', '2019-11-18 19:59:21'),
(108, 12, 'verrell', 'bd', 'L', 'sdaasd', 'safasfasdafs', NULL, '2019-11-19 19:28:39', '2019-11-19 19:28:39'),
(109, 0, 'Gatau ini ', ' ', 'P', 'sajkad', 'sand', NULL, '2019-11-20 00:06:22', '2019-11-20 00:06:22'),
(110, 0, 'Apaan sih', ' ', 'L', 'sadkndlas', 'klsdal', NULL, '2019-11-20 00:06:22', '2019-11-20 00:06:22');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `role` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `role`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'admin', 'Hackler', 'hackler@gmail.com', NULL, '$2y$10$sVmgr7yh25bVSt1493FnwurHoc9OyqA420JVtwAAukTjs46ce05rO', 'XCB2y7WY9Zoc93dJ0FYiyeHh5Rdl3X5gWHESFZrFYCpdvIftA6D5OomQco5w', '2019-11-04 07:06:57', '2019-11-04 07:06:57'),
(2, 'siswa', 'hiya', 'hiya@gmail.com', NULL, '$2y$10$ZOv0836sXcVpSg6Drs4NPexEs0qdVgHdGm28Fbk6aMvIJE8FN84Di', 'KWh18Whi28FttVWTMQCiDDyyyEIbIb9QFtU1mHWVoV0Xn0Ec5Ufn6YtdJv93', '2019-11-04 23:27:52', '2019-11-04 23:27:52'),
(3, 'siswa', 'Dedek', 'dedek@gmail.com', NULL, '$2y$10$bZA0MifVCXtgG0kjAShu3uumH1u8rcqM1PVQxIX/VAl2hg2MbBr3C', 'jr9ql2ALlu74CxCsdVZtbvf1oXkoHAbzAQrQVKsoX71uxCnfMKMNNtsXy7xO', '2019-11-14 22:26:14', '2019-11-14 22:26:14'),
(5, 'siswa', 'dasa', 'asd@gmail.com', NULL, '$2y$10$p2GnFS0qY42zm0XmYWwotOIThM/M2ZCH/krDRUvTUeGpz61E9jmuC', 'oeKZBoDyRGbKRsuNuxeujcopU60HMwzaqqtSrEZa38pID03iTn02qIJMclTk', '2019-11-14 22:30:01', '2019-11-14 22:30:01'),
(6, 'siswa', 'Sayang', 'sayang@gmail.com', NULL, '$2y$10$G2bqE9TTqalNxqF8tW4xOuHQXvlHvpG9D8bBKdDeIiQDexh2VnZ4S', 'fKwvmqE5oPFnLE4zMMhdjSKDrkgNc0NfzV5X9Yv7Mkkn3jANhopqJsfydHe5', '2019-11-14 22:31:23', '2019-11-14 22:31:23'),
(7, 'siswa', 'Siapa', 'siapa@gmail.com', NULL, '$2y$10$w8fpkOAbCMOpbq2QuVHdiOVOw8xAuPsitLCX0NiwipE4UgiNO.Ce2', 'N48JA2vlg1bvhZyLwCgYuG4R3fpu0yMyjH4CfpjBXTkN2TiG4QIDOebZOaSu', '2019-11-14 22:32:23', '2019-11-14 22:32:23'),
(10, 'siswa', 'Apaan', 'apaan@gmail.com', NULL, '$2y$10$Kjle5Qhh.rGixUwQUgCe/ObWu0NPshgakIYNCT.f/HwyuzyXkTRCm', '8Ya6CXS5fVT7dKCA3XpcgitAh7mzQKOOkT7BRlxRnYaAzi75SdsV7dGmkRBD', '2019-11-14 22:35:43', '2019-11-14 22:35:43'),
(11, 'siswa', 'Test', 'test@gmail.com', NULL, '$2y$10$XD2mM/dK9NTkFqDLCdOB9uHltkGT3N6ahOtuWil39puaekrHR7.TO', 'ZCLP5kRngoWkqUd2qInztQMmHrFk0Ozuc6dwSBPS9qWuVWJFwHfTLZEkHEzm', '2019-11-14 22:55:04', '2019-11-14 22:55:04'),
(12, 'siswa', 'verrell', 'ler@gmail.com', NULL, '$2y$10$asPZ3uV0s/TnfQx0Zz6FH.4ZEl4aG2UFNGnw/7nBCeCt9tfoAJ9qe', 'dM5pNFrgehQQLq7hP8HW8uVlwj1HJlWEtKqLOHPU9alh57lxLueUPdK56Rmn', '2019-11-19 19:28:39', '2019-11-19 19:28:39');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `guru`
--
ALTER TABLE `guru`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `mapel`
--
ALTER TABLE `mapel`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `mapel_siswa`
--
ALTER TABLE `mapel_siswa`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `siswa`
--
ALTER TABLE `siswa`
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
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `guru`
--
ALTER TABLE `guru`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `mapel`
--
ALTER TABLE `mapel`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `mapel_siswa`
--
ALTER TABLE `mapel_siswa`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `siswa`
--
ALTER TABLE `siswa`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=111;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

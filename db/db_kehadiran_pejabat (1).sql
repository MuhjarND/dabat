-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 20, 2025 at 04:22 AM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 7.4.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_kehadiran_pejabat`
--

-- --------------------------------------------------------

--
-- Table structure for table `employees`
--

CREATE TABLE `employees` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `position` varchar(255) DEFAULT NULL,
  `category` varchar(255) NOT NULL DEFAULT 'Kesekretariatan',
  `photo` varchar(255) DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `employees`
--

INSERT INTO `employees` (`id`, `name`, `position`, `category`, `photo`, `is_active`, `created_at`, `updated_at`) VALUES
(3, 'Drs. Muhammad Takdir, S.H., M.H.', 'Hakim Tinggi', 'Hakim Tinggi', 'photos/FbOjHrb4yMPD6tiwyjYmIwd73hwFywr16m8BUu3d.png', 1, '2025-07-29 01:01:50', '2025-08-08 07:51:34'),
(4, 'Drs Basyirun, M.H.', 'Hakim Tinggi', 'Hakim Tinggi', 'photos/49S8v3AFUTa8YRqzKflbJhhBU2yBcH8ahvYSAvXN.png', 1, '2025-07-29 01:02:52', '2025-08-08 07:51:25'),
(5, 'Drs. Rahmat Farid, M.H.', 'Hakim Tinggi', 'Hakim Tinggi', 'photos/1ZiQ6KAgXCqWuD4aCgXWeulUZHz6y3rMkKBEQtD0.png', 1, '2025-07-29 01:03:19', '2025-08-08 07:51:43'),
(7, 'Raswin, S.H.I.', 'Kepala Bagian Umum dan Keuangan', 'Kepala Bagian', 'photos/dDhyz27LvW99HQQv6FqigRJFXqi8y2Lk6p254egi.png', 1, '2025-07-29 01:05:20', '2025-08-08 07:52:38'),
(8, 'Syamsul Bahri, S.H.I.', 'Kepala Bagian Perencana dan Kepegawaian', 'Kepala Bagian', 'photos/S3dopGL94gkVhvJFseuliexHnIKUIgh8HhuYzC7M.png', 1, '2025-07-29 01:06:34', '2025-08-08 07:53:26'),
(10, 'Ummu Mukhlisa, S.H., M.H.', 'Kepala Sub Bagian Tata Usaha dan Rumah Tangga', 'Kepala Sub Bagian', 'photos/mJXOUNAkATcEhEZPlPlUY1ZePAxwkz9jviwPq08J.png', 1, '2025-07-29 01:07:47', '2025-08-11 02:38:37'),
(12, 'Dr. Imran, S.Ag., S.H., M.H.', 'Panitera', 'Sekretaris dan Panitera', 'photos/qYxE9Lus2kP3YO2o0ktsuedjbpbOWxECVGigTtOR.png', 1, '2025-07-29 01:09:25', '2025-08-08 07:50:13'),
(13, 'Drs. H. Pandi, S.H., M.H.', 'Ketua', 'Pimpinan', 'photos/DqLvEKbK87NOFHCPCHeH7RnOzktPQj3ktVpBVE6a.png', 1, '2025-07-29 01:14:08', '2025-07-30 12:56:30'),
(14, 'Dr. Drs. H. Moh. Faishol Hasanuddin, S.H., M.H.', 'Wakil Ketua', 'Pimpinan', 'photos/03fK0IGa5CI8RBp67AyhJsgZfnuS7IuLkBwXkQlR.png', 1, '2025-07-29 01:18:15', '2025-08-08 06:29:42'),
(15, 'Manik Rochmani, S.H.', 'Kepala Sub Bagian Rencana Program dan Anggaran', 'Kepala Sub Bagian', 'photos/GHfcUbQzBEkwn75vuRkwbDzLcGiIrsyBvpDlGYlB.png', 1, '2025-07-29 01:19:32', '2025-08-11 02:38:52'),
(16, 'Suria Kencana, S.E.', 'Kepala Sub Bagian Keuangan dan Pelaporan', 'Kepala Sub Bagian', 'photos/mVUk5TJ3LIz9YtQlZ5Rxb7m6ajbF9RwVycoiSbZv.png', 1, '2025-07-29 01:20:02', '2025-08-09 02:12:08'),
(17, 'Khoiriyah, S.Ag., M.H.', 'Panitera Muda Hukum', 'Panitera Muda', 'photos/fG8alnrTgWnlzXO3e8CsKC69Isd7GBTKWLiWk8OM.png', 1, '2025-07-29 01:20:51', '2025-08-08 07:51:53'),
(18, 'Musa Sholawat, S.H.I.', 'Panitera Muda Banding', 'Panitera Muda', 'photos/wcitzTaGd41JiiPf19ofjg93BGId5DdTYrBEjLIg.png', 1, '2025-07-29 01:21:41', '2025-08-08 07:52:29'),
(21, 'Missah Hamzah Suara, S.H.', 'Panitera Pengganti', 'Panitera Pengganti', 'photos/iUkMIXv6ib029Cnd68gjsgQI7baJ7Oi1NuNRmCHx.png', 1, '2025-07-29 01:24:17', '2025-08-08 07:52:21'),
(22, 'Akram, S.H., M.H.', 'Panitera Pengganti', 'Panitera Pengganti', 'photos/5mNRifzQmgLvBE5jK2VD5mxK3eVuPyYu9giI8cYm.png', 1, '2025-07-29 01:24:38', '2025-08-08 06:42:43'),
(24, 'Nurmansyah, S.Ag., M.H', 'Sekretaris', 'Sekretaris dan Panitera', 'photos/TncE9xi2SpF6CY1YvFPnhf8PEIPAAYfWb97fsz9C.png', 1, '2025-08-09 02:12:54', '2025-08-09 02:12:54');

-- --------------------------------------------------------

--
-- Table structure for table `employee_statuses`
--

CREATE TABLE `employee_statuses` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `employee_id` bigint(20) UNSIGNED NOT NULL,
  `status` enum('ada','tidak_ada') NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `employee_statuses`
--

INSERT INTO `employee_statuses` (`id`, `employee_id`, `status`, `created_at`, `updated_at`) VALUES
(3, 3, 'tidak_ada', '2025-07-29 01:01:50', '2025-07-29 01:01:50'),
(4, 4, 'tidak_ada', '2025-07-29 01:02:52', '2025-08-11 02:39:38'),
(5, 5, 'tidak_ada', '2025-07-29 01:03:19', '2025-07-29 01:03:19'),
(7, 7, 'tidak_ada', '2025-07-29 01:05:20', '2025-07-30 11:17:35'),
(8, 8, 'tidak_ada', '2025-07-29 01:06:34', '2025-07-29 01:06:34'),
(10, 10, 'tidak_ada', '2025-07-29 01:07:47', '2025-07-29 01:07:47'),
(12, 12, 'tidak_ada', '2025-07-29 01:09:25', '2025-07-29 01:09:25'),
(13, 13, 'tidak_ada', '2025-07-29 01:14:08', '2025-07-30 06:43:04'),
(14, 14, 'tidak_ada', '2025-07-29 01:18:15', '2025-08-11 02:39:37'),
(15, 15, 'tidak_ada', '2025-07-29 01:19:32', '2025-07-29 01:19:32'),
(16, 16, 'tidak_ada', '2025-07-29 01:20:02', '2025-07-29 01:20:02'),
(17, 17, 'tidak_ada', '2025-07-29 01:20:51', '2025-07-29 01:20:51'),
(18, 18, 'tidak_ada', '2025-07-29 01:21:41', '2025-07-29 01:21:41'),
(21, 21, 'tidak_ada', '2025-07-29 01:24:17', '2025-07-29 01:24:17'),
(22, 22, 'tidak_ada', '2025-07-29 01:24:38', '2025-07-29 01:24:38'),
(24, 24, 'tidak_ada', '2025-08-09 02:12:54', '2025-08-09 02:12:54');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
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
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2024_01_01_000000_create_employees_table', 1),
(5, '2024_01_01_000001_create_employee_statuses_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Admin', 'admin@example.com', NULL, '$2y$10$jq/6Pup0Bj.fPurgtobZJuqDgMDVAbrY3zCA/0MvjfCPM0EFiQyuy', NULL, NULL, NULL),
(2, 'Nur Komariah', 'nurkomariah.ptapabar@gmail.com', NULL, '$2y$10$XdAyEY5SVEacPoP5LSmBneFeAY.Tjs4SqXMtwNXoxbjQl1dxlLgPy', NULL, '2025-08-20 02:16:17', '2025-08-20 02:16:17');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `employees`
--
ALTER TABLE `employees`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `employee_statuses`
--
ALTER TABLE `employee_statuses`
  ADD PRIMARY KEY (`id`),
  ADD KEY `employee_statuses_employee_id_foreign` (`employee_id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
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
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `employees`
--
ALTER TABLE `employees`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `employee_statuses`
--
ALTER TABLE `employee_statuses`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `employee_statuses`
--
ALTER TABLE `employee_statuses`
  ADD CONSTRAINT `employee_statuses_employee_id_foreign` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 31, 2025 at 01:33 AM
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
(3, 'Drs. Muhammad Takdir, S.H., M.H.', 'Hakim Tinggi', 'HakimTinggi', 'photos/FbOjHrb4yMPD6tiwyjYmIwd73hwFywr16m8BUu3d.png', 1, '2025-07-29 01:01:50', '2025-07-30 12:57:09'),
(4, 'Drs Basyirun, M.H.', 'Hakim Tinggi', 'HakimTinggi', 'photos/49S8v3AFUTa8YRqzKflbJhhBU2yBcH8ahvYSAvXN.png', 1, '2025-07-29 01:02:52', '2025-07-30 12:56:45'),
(5, 'Drs. Rahmat Farid, M.H.', 'Hakim Tinggi', 'HakimTinggi', 'photos/1ZiQ6KAgXCqWuD4aCgXWeulUZHz6y3rMkKBEQtD0.png', 1, '2025-07-29 01:03:19', '2025-07-30 12:57:30'),
(6, 'Nurmansyah, S.Ag., M.H', 'Sekretaris', 'Kesekretariatan', 'photos/rqoSKxSgLMsQr0vLnV4737x5PK2Su2dIQ3lWUn5o.png', 1, '2025-07-29 01:04:38', '2025-07-30 11:54:36'),
(7, 'Raswin, S.H.I.', 'Kepala Bagian Umum dan Keuangan', 'Kesekretariatan', 'photos/dDhyz27LvW99HQQv6FqigRJFXqi8y2Lk6p254egi.png', 1, '2025-07-29 01:05:20', '2025-07-30 11:51:41'),
(8, 'Syamsul Bahri, S.H.I.', 'Kepala Bagian Perencana dan Kepegawaian', 'Kesekretariatan', 'photos/S3dopGL94gkVhvJFseuliexHnIKUIgh8HhuYzC7M.png', 1, '2025-07-29 01:06:34', '2025-07-30 12:09:39'),
(10, 'Ummu Mukhlisa, S.H., M.H.', 'Kepala Subbagian Tata Usaha dan Rumah Tangga', 'Kesekretariatan', 'photos/AeJEMzV35nPmIxU3EaGFHVCpI2fZqyS2ig0521FW.png', 1, '2025-07-29 01:07:47', '2025-07-30 12:15:36'),
(12, 'Dr. Imran, S.Ag., S.H., M.H.', 'Panitera', 'Kepaniteraan', 'photos/qYxE9Lus2kP3YO2o0ktsuedjbpbOWxECVGigTtOR.png', 1, '2025-07-29 01:09:25', '2025-07-30 11:46:17'),
(13, 'Drs. H. Pandi, S.H., M.H.', 'Ketua', 'Pimpinan', 'photos/DqLvEKbK87NOFHCPCHeH7RnOzktPQj3ktVpBVE6a.png', 1, '2025-07-29 01:14:08', '2025-07-30 12:56:30'),
(14, 'Dr. Drs. H. Moh. Faishol Hasanuddin, S.H., M.H.', 'Wakil Ketua', 'Pimpinan', 'photos/03fK0IGa5CI8RBp67AyhJsgZfnuS7IuLkBwXkQlR.png', 1, '2025-07-29 01:18:15', '2025-07-30 12:53:52'),
(15, 'Manik Rochmani, S.H.', 'Kepala Subbagian Rencana Program dan Anggaran', 'Kesekretariatan', 'photos/lXc4kLTnAGMkkM0VHFsOreuTzAihI60phVUbLeDv.png', 1, '2025-07-29 01:19:32', '2025-07-30 12:04:23'),
(16, 'Suria Kencana, S.E.', 'Kepala Subbagian Keuangan dan Pelaporan', 'Kesekretariatan', 'photos/mVUk5TJ3LIz9YtQlZ5Rxb7m6ajbF9RwVycoiSbZv.png', 1, '2025-07-29 01:20:02', '2025-07-30 12:57:47'),
(17, 'Khoiriyah, S.Ag., M.H.', 'Panitera Muda Hukum', 'Kepaniteraan', 'photos/fG8alnrTgWnlzXO3e8CsKC69Isd7GBTKWLiWk8OM.png', 1, '2025-07-29 01:20:51', '2025-07-30 12:00:16'),
(18, 'Musa Sholawat, S.H.I.', 'Panitera Muda Banding', 'Kepaniteraan', 'photos/wcitzTaGd41JiiPf19ofjg93BGId5DdTYrBEjLIg.png', 1, '2025-07-29 01:21:41', '2025-07-30 13:00:52'),
(19, 'Zubaidah Hi Hamzah, S.H.', 'Panitera Pengganti', 'Kepaniteraan', 'photos/R5dpohVMXH3JdFXcgbsPzKZAO88NCNhrMyRwIrSd.png', 1, '2025-07-29 01:22:41', '2025-07-30 13:00:18'),
(20, 'Nasir Maswatu, S.H.I.', 'Panitera Pengganti', 'Kepaniteraan', 'photos/kuSL54zl6BSRujhbn0fkSKktVgGVn4nRS8O2QFqN.png', 1, '2025-07-29 01:23:17', '2025-07-30 13:00:02'),
(21, 'Missah Hamzah Suara, S.H.', 'Panitera Pengganti', 'Kepaniteraan', 'photos/iUkMIXv6ib029Cnd68gjsgQI7baJ7Oi1NuNRmCHx.png', 1, '2025-07-29 01:24:17', '2025-07-30 12:58:29'),
(22, 'Akram, S.H., M.H.', 'Panitera Pengganti', 'Kepaniteraan', 'photos/5mNRifzQmgLvBE5jK2VD5mxK3eVuPyYu9giI8cYm.png', 1, '2025-07-29 01:24:38', '2025-07-30 11:45:17');

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
(4, 4, 'tidak_ada', '2025-07-29 01:02:52', '2025-07-30 11:17:39'),
(5, 5, 'tidak_ada', '2025-07-29 01:03:19', '2025-07-29 01:03:19'),
(6, 6, 'tidak_ada', '2025-07-29 01:04:38', '2025-07-29 01:04:38'),
(7, 7, 'tidak_ada', '2025-07-29 01:05:20', '2025-07-30 11:17:35'),
(8, 8, 'tidak_ada', '2025-07-29 01:06:34', '2025-07-29 01:06:34'),
(10, 10, 'tidak_ada', '2025-07-29 01:07:47', '2025-07-29 01:07:47'),
(12, 12, 'tidak_ada', '2025-07-29 01:09:25', '2025-07-29 01:09:25'),
(13, 13, 'tidak_ada', '2025-07-29 01:14:08', '2025-07-30 06:43:04'),
(14, 14, 'tidak_ada', '2025-07-29 01:18:15', '2025-07-30 06:39:40'),
(15, 15, 'tidak_ada', '2025-07-29 01:19:32', '2025-07-29 01:19:32'),
(16, 16, 'tidak_ada', '2025-07-29 01:20:02', '2025-07-29 01:20:02'),
(17, 17, 'tidak_ada', '2025-07-29 01:20:51', '2025-07-29 01:20:51'),
(18, 18, 'tidak_ada', '2025-07-29 01:21:41', '2025-07-29 01:21:41'),
(19, 19, 'tidak_ada', '2025-07-29 01:22:41', '2025-07-29 01:22:41'),
(20, 20, 'tidak_ada', '2025-07-29 01:23:17', '2025-07-29 01:23:17'),
(21, 21, 'tidak_ada', '2025-07-29 01:24:17', '2025-07-29 01:24:17'),
(22, 22, 'tidak_ada', '2025-07-29 01:24:38', '2025-07-29 01:24:38');

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
(1, 'Admin', 'admin@example.com', NULL, '$2y$10$jq/6Pup0Bj.fPurgtobZJuqDgMDVAbrY3zCA/0MvjfCPM0EFiQyuy', NULL, NULL, NULL);

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
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `employee_statuses`
--
ALTER TABLE `employee_statuses`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

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
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

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

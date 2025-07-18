-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 16, 2025 at 04:12 PM
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
-- Database: `taks_management_app`
--

-- --------------------------------------------------------

--
-- Table structure for table `boards`
--

CREATE TABLE `boards` (
  `id` int(11) NOT NULL,
  `title` varchar(100) NOT NULL,
  `created_at` date DEFAULT curdate()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `task_history`
--

CREATE TABLE `task_history` (
  `id` int(11) NOT NULL,
  `task_id` int(11) NOT NULL,
  `old_status` enum('NEW','IN PROGRESS','COMPLETED') DEFAULT NULL,
  `new_status` enum('NEW','IN PROGRESS','COMPLETED') DEFAULT NULL,
  `changed_at` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_comment`
--

CREATE TABLE `tbl_comment` (
  `id` int(11) NOT NULL,
  `task_id` int(11) NOT NULL,
  `user_name` varchar(100) DEFAULT NULL,
  `comment` text NOT NULL,
  `created_at` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_comment`
--

INSERT INTO `tbl_comment` (`id`, `task_id`, `user_name`, `comment`, `created_at`) VALUES
(1, 1, 'Carenita', 'Task ini butuh revisi segera!', '2025-07-16 20:27:54');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_contacts`
--

CREATE TABLE `tbl_contacts` (
  `id` int(11) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `pesan` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_contacts`
--

INSERT INTO `tbl_contacts` (`id`, `nama`, `email`, `pesan`, `created_at`) VALUES
(11, 'julia', 'juliacarenitareriola@gmail.com', 'hbjhjkk', '2025-07-15 16:14:53'),
(12, 'julia', 'juliacarenitareriola@gmail.com', 'wdnmnw', '2025-07-15 16:21:40'),
(13, 'julia', 'juliacarenitareriola@gmail.com', 'yuyyg', '2025-07-15 17:44:18'),
(14, 'julia', 'juliacarenitareriola@gmail.com', 'sdfbhjmf,sbfl', '2025-07-16 11:42:22'),
(15, 'julia', 'juliacarenitareriola@gmail.com', 'nsmdbhjsd', '2025-07-16 11:46:02'),
(16, 'julia', 'juliacarenitareriola@gmail.com', 'sjfgsjhgfjhskfhwjkfh', '2025-07-16 11:46:11');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_kanbans`
--

CREATE TABLE `tbl_kanbans` (
  `id` int(11) NOT NULL,
  `title` varchar(100) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `created_at` date DEFAULT NULL,
  `deadline` date DEFAULT NULL,
  `tag` varchar(50) DEFAULT NULL,
  `category` varchar(50) DEFAULT NULL,
  `status` enum('NEW','TODO','ON GOING','IN REVIEW','COMPLETED') DEFAULT 'NEW',
  `likes` int(11) DEFAULT 0,
  `comments` int(11) DEFAULT 0,
  `assignees` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_kanbans`
--

INSERT INTO `tbl_kanbans` (`id`, `title`, `description`, `created_at`, `deadline`, `tag`, `category`, `status`, `likes`, `comments`, `assignees`) VALUES
(1, 'New Dashboard Design', 'Desain tampilan baru untuk dashboard admin.', '2025-07-15', '2025-07-20', '#SPK-01', 'UI/UX', 'NEW', 12, 2, 'user1.jpg,user2.jpg,user3.jpg'),
(2, 'Kenyaman Tidur', 'fsvdg', '2025-07-16', '2025-07-17', 'fsfsf', 'Davd', 'NEW', 0, 0, ''),
(3, 'Kenyaman Tidur', 'dsfd', '2025-07-16', '2025-07-17', 'fsfsf', 'Davd', 'IN REVIEW', 0, 0, ''),
(5, 'Kenyaman Tidur', 'sdcd', '2025-07-16', '2025-07-17', 'fsfsf', 'Davd', 'IN REVIEW', 0, 0, ''),
(6, 'Kenyaman Tidur', 'jhgjhggjh', '2025-07-16', '2025-07-17', 'fsfsf', 'ui/ux', 'NEW', 0, 0, ''),
(7, 'Kenyaman Tidur', 'hvhgvghhg', '2025-07-16', '2025-07-17', 'fsfsf', 'ui/ux', 'NEW', 0, 0, ''),
(8, 'Kenyaman Tidur', 'fgdx', '2025-07-16', '2025-07-17', 'fsfsf', 'ui/ux', 'NEW', 0, 0, ''),
(9, 'Kenyaman Tidur', 'fbdfbd', '2025-07-16', '2025-07-17', 'fsfsf', 'ui/ux', 'IN REVIEW', 0, 0, ''),
(10, 'Kenyaman Tidur', 'dcs', '2025-07-16', '2025-07-17', 'fsfsf', 'ui/ux', 'COMPLETED', 0, 0, ''),
(11, 'Kenyaman Tidur', 'fdgdf', '2025-07-16', '2025-07-17', 'fsfsf', 'ui/ux', 'NEW', 0, 0, ''),
(12, 'Kenyaman Tidur', 'efa', '2025-07-16', '2025-07-17', 'fsfsf', 'ui/ux', 'COMPLETED', 0, 0, ''),
(13, 'Kenyaman Tidur', 'sfbsaghsb', '2025-07-16', '2025-07-17', 'fsfsf', 'ui/ux', 'IN REVIEW', 0, 0, ''),
(14, 'Kenyaman Tidur', 'nmcc nn', '2025-07-16', '2025-07-17', 'fsfsf', 'ui/ux', 'NEW', 0, 0, ''),
(15, 'desain', 'mendesain halaman home', '2022-12-11', '2023-02-02', 'ui/ux', 'hight', 'TODO', 0, 0, '');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_tasks`
--

CREATE TABLE `tbl_tasks` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `status` enum('NEW','IN PROGRESS','COMPLETED') NOT NULL DEFAULT 'NEW',
  `created_at` date NOT NULL,
  `updated_at` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_tasks`
--

INSERT INTO `tbl_tasks` (`id`, `title`, `description`, `status`, `created_at`, `updated_at`) VALUES
(1, '2', 'dss', 'COMPLETED', '2025-07-15', '2025-07-16'),
(3, 'ignbj', 'imel', 'COMPLETED', '2025-07-15', '2025-07-16'),
(4, 'Kenyaman Tidur', 'gvv', 'IN PROGRESS', '2025-07-15', '2025-07-15');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_users`
--

CREATE TABLE `tbl_users` (
  `id` int(11) NOT NULL,
  `first_name` varchar(100) NOT NULL,
  `username` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_users`
--

INSERT INTO `tbl_users` (`id`, `first_name`, `username`, `password`, `created_at`) VALUES
(1, 'carenita', 'admin', '$2y$10$YBPi99uuEj5AlItxxVbV1eJl1w480/wHdzmB2I4YtP8eVKlXL36BS', '2025-07-10 16:31:43');

-- --------------------------------------------------------

--
-- Table structure for table `teams`
--

CREATE TABLE `teams` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `description` text DEFAULT NULL,
  `created_at` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `teams`
--

INSERT INTO `teams` (`id`, `name`, `description`, `created_at`) VALUES
(1, 'nnn', 'ketua', '2025-07-15'),
(2, 'b', 'wakil\r\n', '2025-07-15'),
(3, 'iimlw', 'ketua', '2025-07-16'),
(4, 'desain', 'untuk kuliah', '2025-07-16');

-- --------------------------------------------------------

--
-- Table structure for table `team_members`
--

CREATE TABLE `team_members` (
  `id` int(11) NOT NULL,
  `team_id` int(11) DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL,
  `role` varchar(50) DEFAULT NULL,
  `joined_at` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `team_members`
--

INSERT INTO `team_members` (`id`, `team_id`, `name`, `role`, `joined_at`) VALUES
(1, 1, 'carenita reri', 'ketua q', '2025-07-02'),
(2, 1, 'carenita reri', 'wakil', '2025-07-24'),
(3, 1, 'carenita', 'ui ux', '2025-07-17');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `boards`
--
ALTER TABLE `boards`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `task_history`
--
ALTER TABLE `task_history`
  ADD PRIMARY KEY (`id`),
  ADD KEY `task_id` (`task_id`);

--
-- Indexes for table `tbl_comment`
--
ALTER TABLE `tbl_comment`
  ADD PRIMARY KEY (`id`),
  ADD KEY `task_id` (`task_id`);

--
-- Indexes for table `tbl_contacts`
--
ALTER TABLE `tbl_contacts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_kanbans`
--
ALTER TABLE `tbl_kanbans`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_tasks`
--
ALTER TABLE `tbl_tasks`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_users`
--
ALTER TABLE `tbl_users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `teams`
--
ALTER TABLE `teams`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `team_members`
--
ALTER TABLE `team_members`
  ADD PRIMARY KEY (`id`),
  ADD KEY `team_id` (`team_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `boards`
--
ALTER TABLE `boards`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `task_history`
--
ALTER TABLE `task_history`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_comment`
--
ALTER TABLE `tbl_comment`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tbl_contacts`
--
ALTER TABLE `tbl_contacts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `tbl_kanbans`
--
ALTER TABLE `tbl_kanbans`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `tbl_tasks`
--
ALTER TABLE `tbl_tasks`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `tbl_users`
--
ALTER TABLE `tbl_users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `teams`
--
ALTER TABLE `teams`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `team_members`
--
ALTER TABLE `team_members`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `task_history`
--
ALTER TABLE `task_history`
  ADD CONSTRAINT `task_history_ibfk_1` FOREIGN KEY (`task_id`) REFERENCES `tbl_tasks` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `tbl_comment`
--
ALTER TABLE `tbl_comment`
  ADD CONSTRAINT `tbl_comment_ibfk_1` FOREIGN KEY (`task_id`) REFERENCES `tbl_kanbans` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `team_members`
--
ALTER TABLE `team_members`
  ADD CONSTRAINT `team_members_ibfk_1` FOREIGN KEY (`team_id`) REFERENCES `teams` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

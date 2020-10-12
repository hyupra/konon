-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 12, 2020 at 03:56 AM
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
-- Database: `konon`
--

-- --------------------------------------------------------

--
-- Table structure for table `concerts`
--

CREATE TABLE `concerts` (
  `id` bigint(225) NOT NULL,
  `banner` varchar(100) NOT NULL,
  `banner2` varchar(100) NOT NULL,
  `banner3` varchar(100) NOT NULL,
  `date` varchar(100) NOT NULL,
  `about` text NOT NULL,
  `title` varchar(100) NOT NULL,
  `artist` varchar(100) NOT NULL,
  `price` varchar(225) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `concerts`
--

INSERT INTO `concerts` (`id`, `banner`, `banner2`, `banner3`, `date`, `about`, `title`, `artist`, `price`) VALUES
(1, 'bts1.jpg', 'bts2.jpg', 'bts3.jpg', '12 Okt 2020', 'BTS The Wings Tour akan hadir di jakarta.\r\n\r\nTonton konser BTS secara virtual sekarang juga!!', 'The Wings Tour JKT - BTS', 'BTS', '0'),
(2, 'blackpink1.jpg', 'blackpink2.jpg', 'blackpink3.png', '12 Okt 2020', 'BLACKPINK 2020 World Tour [In Your Area]', 'BLACKPINK IN YOUR AREA', 'BLACKPINK', '0'),
(3, 'didi1.jpg', 'didi2.jpg', 'didi3.jpg', '12 Okt 2020', 'Pakde Didi Kempot Bersama Sobat Ambyar', 'Sang Pahlawan Sakit Hati', 'Didi Kempot', '0'),
(4, 'beatles1.jpg', 'beatles2.jpeg', 'beatles3.jpg', '12 Okt 2020', 'The beatles will be present in your country', 'A HARD DAYS NIGHT', 'THE BEATLES', '0'),
(5, 'queen1.jpg', 'queen2.jpg', 'queen3.jpg', '12 Okt 2020', 'Freedy is Back Dine With Queen', 'WE WIIL ROCK YOU IMAX', 'queen', '0'),
(6, 'virgoun1.jpg', 'virgoun2.jpg', 'virgoun3.jpg', '12 Okt 2020', 'Nonton Konser Virgoun dengan Jarak 1 Meter', 'SURAT CINTA UNTUK STARLA', 'Virgoun', '0');

-- --------------------------------------------------------

--
-- Table structure for table `tickets`
--

CREATE TABLE `tickets` (
  `id` bigint(225) NOT NULL,
  `id_user` bigint(225) NOT NULL,
  `id_concert` bigint(225) NOT NULL,
  `code` varchar(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tickets`
--

INSERT INTO `tickets` (`id`, `id_user`, `id_concert`, `code`) VALUES
(3, 4, 1, 'VSxdi'),
(4, 9, 1, 'Y7qEA'),
(5, 9, 1, '1jL39'),
(6, 9, 6, 'seOtl'),
(7, 9, 6, 'WkgEN'),
(8, 9, 2, '453lw'),
(9, 10, 1, 'kkopO'),
(10, 9, 2, 'dh1d8'),
(11, 13, 1, 'ionA9'),
(12, 9, 6, 'Yt3qf'),
(13, 13, 1, 'MPNjU');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(225) NOT NULL,
  `name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(200) NOT NULL,
  `birth` date NOT NULL,
  `gender` enum('1','2') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `password`, `birth`, `gender`) VALUES
(4, 'Tegar Santosa', 'tganteng77@gmail.com', '$2a$10$l14eNmLij14hnl/iOqAnJ.xJtAcImVBw2PuIF0Du2TFBMuaQXDia6', '2020-10-28', '1'),
(7, 'Dhimas', 'dhimas@putra.com', '$2a$10$7G1F6O4awHS5aVRcZOvYde81Jvs.kNjpOGWWNvRKqrbppYsrqvxai', '2020-09-28', '1'),
(9, 'wahyu', 'wahyu@gmail.com', '$2a$10$5kmsywvZOs44W8K.HprlcegCfKlEvlrshFpxqRGF2iEOAG8vcHCFm', '2020-09-28', '1'),
(10, 'Dhimas Putra Hartono', 'Dhimasputra@gmail.com', '$2a$10$kTB9KDe/NeMfMK.J5NQ8R.asJ0k8o9xP1QOJco8BfUQhdCMbNepA2', '2020-10-14', '1'),
(12, 'Dhimas Putra Hartono', 'dhimas00@putra.com', '$2a$10$Q9ZF1mqWhksD3.zVSd4qYOyhW1IM40IlSWIcnnBdYjGvI7TSiIQ9y', '2002-10-01', '1'),
(13, 'Dhimas Putra Hartono', 'dhimasputra99@gmail.com', '$2a$10$FgJGzi3WQkV0Mh3qc.Iepuw5/aCy1xBoqPJRwR9/VjCRB/T63/UG6', '2020-10-06', '1');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `concerts`
--
ALTER TABLE `concerts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tickets`
--
ALTER TABLE `tickets`
  ADD PRIMARY KEY (`id`),
  ADD KEY `foreign_id_user` (`id_user`),
  ADD KEY `foreign_id_concert` (`id_concert`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `concerts`
--
ALTER TABLE `concerts`
  MODIFY `id` bigint(225) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `tickets`
--
ALTER TABLE `tickets`
  MODIFY `id` bigint(225) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(225) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `tickets`
--
ALTER TABLE `tickets`
  ADD CONSTRAINT `foreign_id_concert` FOREIGN KEY (`id_concert`) REFERENCES `concerts` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `foreign_id_user` FOREIGN KEY (`id_user`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

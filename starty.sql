-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Lis 12, 2024 at 12:06 PM
-- Wersja serwera: 10.4.28-MariaDB
-- Wersja PHP: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `starty`
--

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `firmy`
--

CREATE TABLE `firmy` (
  `id_firmy` int(11) NOT NULL,
  `nazwa_firmy` varchar(50) NOT NULL,
  `kraj_firmy` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `firmy`
--

INSERT INTO `firmy` (`id_firmy`, `nazwa_firmy`, `kraj_firmy`) VALUES
(1, 'SpaceX', 'USA'),
(2, 'Rocket Lab', 'USA'),
(3, 'ULA', 'USA'),
(4, 'Blue Origin', 'USA'),
(5, 'Firefly Aerospace', 'USA'),
(6, 'ISRO', 'Indie'),
(7, 'MHI', 'Japonia'),
(8, 'CASC', 'Chiny'),
(9, 'Galactic Energy', 'Chiny'),
(10, 'Roskosmos', 'Rosja'),
(11, 'Arianespace', 'Europa'),
(12, 'Space One', 'Japonia');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `ladunki`
--

CREATE TABLE `ladunki` (
  `id_ladunku` int(11) NOT NULL,
  `nazwa_ladunku` varchar(50) NOT NULL,
  `operator_ladunku` varchar(50) NOT NULL,
  `masa_ladunku` int(11) NOT NULL,
  `id_startu` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `ladunki`
--

INSERT INTO `ladunki` (`id_ladunku`, `nazwa_ladunku`, `operator_ladunku`, `masa_ladunku`, `id_startu`) VALUES
(1, 'Starlink-1', 'SpaceX', 16, 1),
(2, 'Starlink-2', 'SpaceX', 16, 3),
(3, 'Koreasat-6A', 'KT Sat', 4, 2),
(7, 'Europa Clipper', 'NASA', 6, 4),
(8, 'PREFIRE-1', 'NASA', 1, 5),
(9, 'NROL-156', 'NRO', 10, 6),
(10, 'Dream Chaser', 'Sierra Space', 9, 7),
(11, 'ESA', 'Lockheed Martin', 1, 8),
(12, 'GSAT-1', 'ISRO', 1, 9),
(13, 'GSAT-2', 'ISRO', 1, 9),
(14, 'Chandrayaan-3', 'ISRO', 8, 10),
(15, 'Kirameki-3', 'JAXA', 6, 11),
(16, 'PIESAT-1', 'CNSA', 2, 12),
(17, 'Jilin-1', 'CASC', 1, 13),
(18, 'Progress MS-19', 'Roskosmos', 7, 14),
(19, 'Meteor-M', 'Roskosmos', 2, 15),
(20, 'Pars 1', 'Iran', 1, 15),
(21, 'Luch-5X', 'Rosyjskie MON', 5, 16),
(22, 'CSO-3', 'CNES', 7, 17),
(23, 'Sentinel-2C', 'UE', 2, 18),
(24, 'Pleiades Neo-1', 'UE', 1, 19),
(25, 'Pleiades Neo-2', 'UE', 1, 19),
(26, 'ASNARO 2', 'JAXA', 1, 20);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `miejsca`
--

CREATE TABLE `miejsca` (
  `id_miejsca` int(11) NOT NULL,
  `nazwa_miejsca` varchar(50) NOT NULL,
  `kraj_miejsca` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `miejsca`
--

INSERT INTO `miejsca` (`id_miejsca`, `nazwa_miejsca`, `kraj_miejsca`) VALUES
(1, 'Kennedy Space Center', 'USA'),
(2, 'Cape Canaveral SFS', 'USA'),
(3, 'Vandenberg SFB', 'USA'),
(4, 'Wallops FF', 'USA'),
(5, 'Rocket Lab LC-1', 'Nowa Zelandia'),
(6, 'Guiana Space Center', 'Gujana Francuska'),
(7, 'Jiuquan SLC', 'Chiny'),
(8, 'Xichang SLC', 'Chiny'),
(9, 'Shatish Dhawan SC', 'Indie'),
(10, 'Tanegashima SC', 'Japonia'),
(11, 'Space Port Kii', 'Japonia'),
(12, 'Kosmodrom Bajkonur', 'Kazachstan'),
(13, 'Kosmodrom Wostocznyj', 'Rosja');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `rakiety`
--

CREATE TABLE `rakiety` (
  `id_rakiety` int(11) NOT NULL,
  `nazwa_rakiety` varchar(50) NOT NULL,
  `kategoria_rakiety` enum('lekka','srednia','ciezka','superciezka') NOT NULL,
  `udzwig_rakiety` int(11) NOT NULL,
  `id_firmy` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `rakiety`
--

INSERT INTO `rakiety` (`id_rakiety`, `nazwa_rakiety`, `kategoria_rakiety`, `udzwig_rakiety`, `id_firmy`) VALUES
(1, 'Falcon 9', 'srednia', 23, 1),
(2, 'Falcon Heavy', 'superciezka', 65, 1),
(3, 'Electron', 'lekka', 1, 2),
(4, 'Atlas V', 'srednia', 19, 3),
(5, 'Vulcan', 'ciezka', 27, 3),
(6, 'New Glenn', 'ciezka', 45, 4),
(7, 'Alpha', 'lekka', 1, 5),
(8, 'PSLV', 'srednia', 4, 6),
(9, 'LVM3', 'srednia', 10, 6),
(10, 'H3', 'srednia', 28, 7),
(11, 'Chang Zheng 2C', 'srednia', 4, 8),
(12, 'Ceres-1', 'lekka', 1, 9),
(13, 'Sojuz 2.1b', 'srednia', 8, 10),
(14, 'Proton', 'srednia', 24, 10),
(15, 'Ariane 6', 'srednia', 22, 11),
(16, 'Vega C', 'srednia', 2, 11),
(17, 'KAIROS', 'lekka', 1, 12);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `starty`
--

CREATE TABLE `starty` (
  `id_startu` int(11) NOT NULL,
  `data_startu` date NOT NULL,
  `status_startu` enum('sukces','porazka') NOT NULL,
  `id_miejsca` int(11) NOT NULL,
  `id_rakiety` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `starty`
--

INSERT INTO `starty` (`id_startu`, `data_startu`, `status_startu`, `id_miejsca`, `id_rakiety`) VALUES
(1, '2024-10-03', 'sukces', 2, 1),
(2, '2024-11-01', 'sukces', 1, 1),
(3, '2024-10-22', 'sukces', 3, 1),
(4, '2024-10-15', 'sukces', 1, 2),
(5, '2024-09-29', 'sukces', 5, 3),
(6, '2024-09-18', 'sukces', 2, 4),
(7, '2024-10-30', 'sukces', 2, 5),
(8, '2024-09-17', 'sukces', 3, 7),
(9, '2024-09-09', 'sukces', 9, 8),
(10, '2024-11-03', 'sukces', 9, 9),
(11, '2024-10-11', 'sukces', 10, 10),
(12, '2024-09-28', 'porazka', 8, 11),
(13, '2024-11-09', 'sukces', 7, 12),
(14, '2024-09-09', 'sukces', 12, 13),
(15, '2024-10-04', 'sukces', 13, 13),
(16, '2024-09-11', 'porazka', 12, 14),
(17, '2024-09-19', 'sukces', 6, 15),
(18, '2024-10-17', 'sukces', 6, 16),
(19, '2024-11-03', 'sukces', 6, 16),
(20, '2024-09-19', 'porazka', 11, 17);

--
-- Indeksy dla zrzutów tabel
--

--
-- Indeksy dla tabeli `firmy`
--
ALTER TABLE `firmy`
  ADD PRIMARY KEY (`id_firmy`);

--
-- Indeksy dla tabeli `ladunki`
--
ALTER TABLE `ladunki`
  ADD PRIMARY KEY (`id_ladunku`),
  ADD KEY `id_startu` (`id_startu`);

--
-- Indeksy dla tabeli `miejsca`
--
ALTER TABLE `miejsca`
  ADD PRIMARY KEY (`id_miejsca`);

--
-- Indeksy dla tabeli `rakiety`
--
ALTER TABLE `rakiety`
  ADD PRIMARY KEY (`id_rakiety`),
  ADD KEY `id_firmy` (`id_firmy`);

--
-- Indeksy dla tabeli `starty`
--
ALTER TABLE `starty`
  ADD PRIMARY KEY (`id_startu`),
  ADD KEY `id_miejsca` (`id_miejsca`),
  ADD KEY `id_rakiety` (`id_rakiety`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `firmy`
--
ALTER TABLE `firmy`
  MODIFY `id_firmy` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `ladunki`
--
ALTER TABLE `ladunki`
  MODIFY `id_ladunku` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `miejsca`
--
ALTER TABLE `miejsca`
  MODIFY `id_miejsca` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `rakiety`
--
ALTER TABLE `rakiety`
  MODIFY `id_rakiety` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `starty`
--
ALTER TABLE `starty`
  MODIFY `id_startu` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `ladunki`
--
ALTER TABLE `ladunki`
  ADD CONSTRAINT `ladunki_ibfk_1` FOREIGN KEY (`id_startu`) REFERENCES `starty` (`id_startu`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `rakiety`
--
ALTER TABLE `rakiety`
  ADD CONSTRAINT `rakiety_ibfk_1` FOREIGN KEY (`id_firmy`) REFERENCES `firmy` (`id_firmy`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `starty`
--
ALTER TABLE `starty`
  ADD CONSTRAINT `starty_ibfk_1` FOREIGN KEY (`id_rakiety`) REFERENCES `rakiety` (`id_rakiety`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `starty_ibfk_2` FOREIGN KEY (`id_miejsca`) REFERENCES `miejsca` (`id_miejsca`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

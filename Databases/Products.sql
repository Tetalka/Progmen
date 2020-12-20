-- phpMyAdmin SQL Dump
-- version 4.9.5
-- https://www.phpmyadmin.net/
--
-- Хост: localhost:3306
-- Время создания: Дек 20 2020 г., 13:39
-- Версия сервера: 10.3.16-MariaDB
-- Версия PHP: 7.3.23

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `id15446174_progmen`
--

-- --------------------------------------------------------

--
-- Структура таблицы `Products`
--

CREATE TABLE `Products` (
  `ID` int(12) NOT NULL,
  `Model` varchar(60) COLLATE utf8_unicode_ci NOT NULL,
  `Diagonal` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `Resolution` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `Display` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `Processor` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `ROM` varchar(8) COLLATE utf8_unicode_ci NOT NULL,
  `RAM` varchar(6) COLLATE utf8_unicode_ci NOT NULL,
  `Cores` int(2) NOT NULL,
  `Videoprocessor` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `Camera` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `Front camera` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `Wireless interface` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `Unit of Wi-Fi` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `Numbers of SIM-card` int(1) NOT NULL,
  `Type of SIM` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `Battery` int(5) NOT NULL,
  `Face_image` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `Price` int(7) NOT NULL,
  `MainColor` varchar(50) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Дамп данных таблицы `Products`
--

INSERT INTO `Products` VALUES(3, 'Cumphone 7 PRO 16/512 Gb', '6.67”', '2340x1080', 'AMOLED', 'Snapdragon 955 Plus 2.3 Hz', '512 Gb', '16 Gb', 12, 'Adreno 615', '108 MP + 12 MP + 24 MP', '24MP w/ HDR', 'Bluetooth, Wi-Fi, NFC', '802.11ax', 2, 'Nano-SIM', 7000, 'CPhone.png', 69990, 'Black');
INSERT INTO `Products` VALUES(4, 'Cumphone 7 8/256 Gb', '6.67”', '2340x1080', 'AMOLED', 'Snapdragon 955 2.3 Hz', '256 Gb', '8 Gb', 8, 'Adreno 510', '108 MP + 12 MP', '16MP w/ HDR', 'Bluetooth, Wi-Fi, NFC', '802.11ax', 2, 'Nano-SIM', 5700, 'CPhone.png', 49990, 'Black');
INSERT INTO `Products` VALUES(5, 'Cumphone 3 3/64 Gb', '5.1”', '1600x720', 'AMOLED', 'Snapdragon 900 1.5 Hz', '64', '3', 4, 'Adreno 310', '20 MP ', '5 MP', 'Bluetooth, Wi-Fi, NFC', '802.11ax', 2, 'Nano-SIM', 3100, 'CPhone.png', 10999, 'Black');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `Products`
--
ALTER TABLE `Products`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `Model` (`Model`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `Products`
--
ALTER TABLE `Products`
  MODIFY `ID` int(12) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

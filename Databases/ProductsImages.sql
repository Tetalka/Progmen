-- phpMyAdmin SQL Dump
-- version 4.9.5
-- https://www.phpmyadmin.net/
--
-- Хост: localhost:3306
-- Время создания: Дек 20 2020 г., 13:40
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
-- Структура таблицы `ProductsImages`
--

CREATE TABLE `ProductsImages` (
  `ID` int(12) NOT NULL,
  `Path` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `Color` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `Value` varchar(25) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Дамп данных таблицы `ProductsImages`
--

INSERT INTO `ProductsImages` VALUES(1, 'production_info/right_black.png', 'Black', '#000');
INSERT INTO `ProductsImages` VALUES(2, 'production_info/right_ocean.png', 'Ocean', '#3a5e6e');
INSERT INTO `ProductsImages` VALUES(3, 'production_info/right_orange.png', 'Orange', '#aa281e');
INSERT INTO `ProductsImages` VALUES(4, 'production_info/right_violet.png', 'Darkblue', '#33407e');
INSERT INTO `ProductsImages` VALUES(5, 'production_info/back_black.png', 'Black', '#000');
INSERT INTO `ProductsImages` VALUES(6, 'production_info/back_ocean.png', 'Ocean', '#3a5e6e');
INSERT INTO `ProductsImages` VALUES(7, 'production_info/back_orange.png', 'Orange', '#aa281e');
INSERT INTO `ProductsImages` VALUES(8, 'production_info/back_violet.png', 'Darkblue', '#33407e');
INSERT INTO `ProductsImages` VALUES(9, 'production_info/main_ocean.png', 'Ocean', '#3a5e6e');
INSERT INTO `ProductsImages` VALUES(10, 'production_info/main_orange.png', 'Orange', '#aa281e');
INSERT INTO `ProductsImages` VALUES(11, 'production_info/main_violet.png', 'Darkblue', '#33407e');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `ProductsImages`
--
ALTER TABLE `ProductsImages`
  ADD PRIMARY KEY (`ID`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `ProductsImages`
--
ALTER TABLE `ProductsImages`
  MODIFY `ID` int(12) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

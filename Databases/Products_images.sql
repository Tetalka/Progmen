-- phpMyAdmin SQL Dump
-- version 4.9.5
-- https://www.phpmyadmin.net/
--
-- Хост: localhost:3306
-- Время создания: Дек 20 2020 г., 13:41
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
-- Структура таблицы `Products_images`
--

CREATE TABLE `Products_images` (
  `ID` int(11) NOT NULL,
  `ID_Model` int(12) NOT NULL,
  `ID_Image` int(12) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Дамп данных таблицы `Products_images`
--

INSERT INTO `Products_images` VALUES(1, 3, 1);
INSERT INTO `Products_images` VALUES(3, 3, 2);
INSERT INTO `Products_images` VALUES(4, 3, 3);
INSERT INTO `Products_images` VALUES(5, 3, 4);
INSERT INTO `Products_images` VALUES(6, 4, 1);
INSERT INTO `Products_images` VALUES(7, 4, 2);
INSERT INTO `Products_images` VALUES(8, 4, 3);
INSERT INTO `Products_images` VALUES(9, 4, 4);
INSERT INTO `Products_images` VALUES(10, 3, 5);
INSERT INTO `Products_images` VALUES(11, 3, 6);
INSERT INTO `Products_images` VALUES(12, 3, 7);
INSERT INTO `Products_images` VALUES(13, 3, 8);
INSERT INTO `Products_images` VALUES(14, 4, 5);
INSERT INTO `Products_images` VALUES(15, 4, 6);
INSERT INTO `Products_images` VALUES(16, 4, 7);
INSERT INTO `Products_images` VALUES(17, 4, 8);
INSERT INTO `Products_images` VALUES(18, 5, 1);
INSERT INTO `Products_images` VALUES(19, 5, 5);
INSERT INTO `Products_images` VALUES(23, 4, 9);
INSERT INTO `Products_images` VALUES(24, 4, 10);
INSERT INTO `Products_images` VALUES(25, 4, 11);
INSERT INTO `Products_images` VALUES(26, 3, 9);
INSERT INTO `Products_images` VALUES(27, 3, 10);
INSERT INTO `Products_images` VALUES(28, 3, 11);

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `Products_images`
--
ALTER TABLE `Products_images`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `ID_Model` (`ID_Model`),
  ADD KEY `ID_Image` (`ID_Image`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `Products_images`
--
ALTER TABLE `Products_images`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `Products_images`
--
ALTER TABLE `Products_images`
  ADD CONSTRAINT `Products_images_ibfk_1` FOREIGN KEY (`ID_Model`) REFERENCES `Products` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `Products_images_ibfk_2` FOREIGN KEY (`ID_Image`) REFERENCES `ProductsImages` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

-- phpMyAdmin SQL Dump
-- version 4.9.5
-- https://www.phpmyadmin.net/
--
-- Хост: localhost:3306
-- Время создания: Дек 21 2020 г., 13:42
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
-- Структура таблицы `Clients`
--

CREATE TABLE `Clients` (
  `User_ID` int(12) NOT NULL,
  `Login` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `Password` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Дамп данных таблицы `Clients`
--

INSERT INTO `Clients` VALUES(4, '123', '$2y$10$zUooQLEzYeoGRR27Et88c.pcAqxglASvPNiKSRVU.3.s0QV/xotrC');

-- --------------------------------------------------------

--
-- Структура таблицы `Orders`
--

CREATE TABLE `Orders` (
  `ID` int(12) NOT NULL,
  `ID_User` int(12) NOT NULL,
  `ID_Model` int(12) NOT NULL,
  `ID_Image` int(12) NOT NULL,
  `Color` varchar(30) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Дублирующая структура для представления `Phones`
-- (См. Ниже фактическое представление)
--
CREATE TABLE `Phones` (
`ID_Model` int(12)
,`ID_Image` int(12)
,`Model` varchar(60)
,`Path` varchar(255)
,`Value` varchar(25)
,`Color` varchar(30)
,`Diagonal` varchar(10)
,`Resolution` varchar(20)
,`Display` varchar(255)
,`Processor` varchar(255)
,`ROM` varchar(8)
,`RAM` varchar(6)
,`Cores` int(2)
,`Videoprocessor` varchar(50)
,`Camera` varchar(255)
,`Front camera` varchar(255)
,`Wireless interface` varchar(255)
,`Unit of Wi-Fi` varchar(255)
,`Numbers of SIM-card` int(1)
,`Type of SIM` varchar(50)
,`Battery` int(5)
,`Face_image` varchar(255)
,`MainColor` varchar(50)
,`Price` int(7)
);

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

-- --------------------------------------------------------

--
-- Структура для представления `Phones`
--
DROP TABLE IF EXISTS `Phones`;

CREATE ALGORITHM=MERGE DEFINER=`id15446174_progman`@`%` SQL SECURITY DEFINER VIEW `Phones`  AS  select `Tempo`.`ID_Model` AS `ID_Model`,`Tempo`.`ID_Image` AS `ID_Image`,`Tempo`.`Model` AS `Model`,`Tempo`.`Path` AS `Path`,`Tempo`.`Value` AS `Value`,`Tempo`.`Color` AS `Color`,`Tempo`.`Diagonal` AS `Diagonal`,`Tempo`.`Resolution` AS `Resolution`,`Tempo`.`Display` AS `Display`,`Tempo`.`Processor` AS `Processor`,`Tempo`.`ROM` AS `ROM`,`Tempo`.`RAM` AS `RAM`,`Tempo`.`Cores` AS `Cores`,`Tempo`.`Videoprocessor` AS `Videoprocessor`,`Tempo`.`Camera` AS `Camera`,`Tempo`.`Front camera` AS `Front camera`,`Tempo`.`Wireless interface` AS `Wireless interface`,`Tempo`.`Unit of Wi-Fi` AS `Unit of Wi-Fi`,`Tempo`.`Numbers of SIM-card` AS `Numbers of SIM-card`,`Tempo`.`Type of SIM` AS `Type of SIM`,`Tempo`.`Battery` AS `Battery`,`Tempo`.`Face_image` AS `Face_image`,`Tempo`.`MainColor` AS `MainColor`,`Tempo`.`Price` AS `Price` from (select `Products`.`ID` AS `ID`,`Products`.`Model` AS `Model`,`Products`.`Diagonal` AS `Diagonal`,`Products`.`Resolution` AS `Resolution`,`Products`.`Display` AS `Display`,`Products`.`Processor` AS `Processor`,`Products`.`ROM` AS `ROM`,`Products`.`RAM` AS `RAM`,`Products`.`Cores` AS `Cores`,`Products`.`Videoprocessor` AS `Videoprocessor`,`Products`.`Camera` AS `Camera`,`Products`.`Front camera` AS `Front camera`,`Products`.`Wireless interface` AS `Wireless interface`,`Products`.`Unit of Wi-Fi` AS `Unit of Wi-Fi`,`Products`.`Numbers of SIM-card` AS `Numbers of SIM-card`,`Products`.`Type of SIM` AS `Type of SIM`,`Products`.`Battery` AS `Battery`,`Products`.`Face_image` AS `Face_image`,`Products`.`MainColor` AS `MainColor`,`Products`.`Price` AS `Price`,`Products_images`.`ID_Model` AS `ID_Model`,`Products_images`.`ID_Image` AS `ID_Image`,`ProductsImages`.`Value` AS `Value`,`ProductsImages`.`Color` AS `Color`,`ProductsImages`.`Path` AS `Path` from ((`Products_images` join `Products` on(`Products_images`.`ID_Model` = `Products`.`ID`)) join `ProductsImages` on(`Products_images`.`ID_Image` = `ProductsImages`.`ID`))) `Tempo` ;

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `Clients`
--
ALTER TABLE `Clients`
  ADD PRIMARY KEY (`User_ID`),
  ADD UNIQUE KEY `Login` (`Login`);

--
-- Индексы таблицы `Orders`
--
ALTER TABLE `Orders`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `ID_User` (`ID_User`),
  ADD KEY `ID_Model` (`ID_Model`),
  ADD KEY `ID_Image` (`ID_Image`);

--
-- Индексы таблицы `Products`
--
ALTER TABLE `Products`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `Model` (`Model`);

--
-- Индексы таблицы `ProductsImages`
--
ALTER TABLE `ProductsImages`
  ADD PRIMARY KEY (`ID`);

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
-- AUTO_INCREMENT для таблицы `Clients`
--
ALTER TABLE `Clients`
  MODIFY `User_ID` int(12) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT для таблицы `Orders`
--
ALTER TABLE `Orders`
  MODIFY `ID` int(12) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `Products`
--
ALTER TABLE `Products`
  MODIFY `ID` int(12) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT для таблицы `ProductsImages`
--
ALTER TABLE `ProductsImages`
  MODIFY `ID` int(12) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT для таблицы `Products_images`
--
ALTER TABLE `Products_images`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `Orders`
--
ALTER TABLE `Orders`
  ADD CONSTRAINT `Orders_ibfk_1` FOREIGN KEY (`ID_User`) REFERENCES `Clients` (`User_ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `Orders_ibfk_2` FOREIGN KEY (`ID_Model`) REFERENCES `Products` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `Orders_ibfk_3` FOREIGN KEY (`ID_Image`) REFERENCES `ProductsImages` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE;

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

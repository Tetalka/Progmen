-- phpMyAdmin SQL Dump
-- version 4.9.5
-- https://www.phpmyadmin.net/
--
-- Хост: localhost:3306
-- Время создания: Дек 20 2020 г., 13:42
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
-- Структура для представления `Phones`
--

CREATE ALGORITHM=MERGE DEFINER=`id15446174_progman`@`%` SQL SECURITY DEFINER VIEW `Phones`  AS  select `Tempo`.`ID_Model` AS `ID_Model`,`Tempo`.`ID_Image` AS `ID_Image`,`Tempo`.`Model` AS `Model`,`Tempo`.`Path` AS `Path`,`Tempo`.`Value` AS `Value`,`Tempo`.`Color` AS `Color`,`Tempo`.`Diagonal` AS `Diagonal`,`Tempo`.`Resolution` AS `Resolution`,`Tempo`.`Display` AS `Display`,`Tempo`.`Processor` AS `Processor`,`Tempo`.`ROM` AS `ROM`,`Tempo`.`RAM` AS `RAM`,`Tempo`.`Cores` AS `Cores`,`Tempo`.`Videoprocessor` AS `Videoprocessor`,`Tempo`.`Camera` AS `Camera`,`Tempo`.`Front camera` AS `Front camera`,`Tempo`.`Wireless interface` AS `Wireless interface`,`Tempo`.`Unit of Wi-Fi` AS `Unit of Wi-Fi`,`Tempo`.`Numbers of SIM-card` AS `Numbers of SIM-card`,`Tempo`.`Type of SIM` AS `Type of SIM`,`Tempo`.`Battery` AS `Battery`,`Tempo`.`Face_image` AS `Face_image`,`Tempo`.`MainColor` AS `MainColor`,`Tempo`.`Price` AS `Price` from (select `Products`.`ID` AS `ID`,`Products`.`Model` AS `Model`,`Products`.`Diagonal` AS `Diagonal`,`Products`.`Resolution` AS `Resolution`,`Products`.`Display` AS `Display`,`Products`.`Processor` AS `Processor`,`Products`.`ROM` AS `ROM`,`Products`.`RAM` AS `RAM`,`Products`.`Cores` AS `Cores`,`Products`.`Videoprocessor` AS `Videoprocessor`,`Products`.`Camera` AS `Camera`,`Products`.`Front camera` AS `Front camera`,`Products`.`Wireless interface` AS `Wireless interface`,`Products`.`Unit of Wi-Fi` AS `Unit of Wi-Fi`,`Products`.`Numbers of SIM-card` AS `Numbers of SIM-card`,`Products`.`Type of SIM` AS `Type of SIM`,`Products`.`Battery` AS `Battery`,`Products`.`Face_image` AS `Face_image`,`Products`.`MainColor` AS `MainColor`,`Products`.`Price` AS `Price`,`Products_images`.`ID_Model` AS `ID_Model`,`Products_images`.`ID_Image` AS `ID_Image`,`ProductsImages`.`Value` AS `Value`,`ProductsImages`.`Color` AS `Color`,`ProductsImages`.`Path` AS `Path` from ((`Products_images` join `Products` on(`Products_images`.`ID_Model` = `Products`.`ID`)) join `ProductsImages` on(`Products_images`.`ID_Image` = `ProductsImages`.`ID`))) `Tempo` ;

--
-- VIEW  `Phones`
-- Данные: Ниодного
--

COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

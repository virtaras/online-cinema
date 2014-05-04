-- phpMyAdmin SQL Dump
-- version 3.5.8.2
-- http://www.phpmyadmin.net
--
-- Хост: localhost
-- Час створення: Трв 03 2014 р., 16:15
-- Версія сервера: 5.1.73-1
-- Версія PHP: 5.2.6-1+lenny13

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- База даних: `caribou_ppa`
--

-- --------------------------------------------------------

--
-- Структура таблиці `clients_fields`
--

CREATE TABLE IF NOT EXISTS `clients_fields` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `title` varchar(200) NOT NULL,
  `code` varchar(200) NOT NULL,
  `fieldtype` bigint(20) DEFAULT NULL,
  `items` varchar(1000) NOT NULL,
  `isrequired` int(11) NOT NULL DEFAULT '0',
  `showorder` int(11) NOT NULL DEFAULT '0',
  `order_field` bigint(20) NOT NULL DEFAULT '0',
  `in_register` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=10 ;

--
-- Дамп даних таблиці `clients_fields`
--

INSERT INTO `clients_fields` (`id`, `title`, `code`, `fieldtype`, `items`, `isrequired`, `showorder`, `order_field`, `in_register`) VALUES
(1, 'Имя', 'r1201', 1, '', 1, 1, 1, 0),
(2, 'Фамилия', 'r1202', 1, '', 0, 2, -1, 0),
(3, 'Телефон', 'r1203', 1, '', 1, 3, 2, 0),
(4, 'Пол', 'r1204', 2, 'Мужской;Женский', 0, 4, -1, 1),
(5, 'Адрес доставки 1', 'r1205', 1, '', 1, 5, 4, 0),
(6, 'Адрес доставки 2', 'r1206', 1, '', 0, 6, -1, 0),
(7, 'Город', 'r1207', 1, '', 0, 7, -1, 0),
(8, 'Почтовый индекс', 'r1208', 1, '', 0, 8, -1, 0),
(9, 'Страна', 'r1209', 1, '', 0, 9, -1, 0);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

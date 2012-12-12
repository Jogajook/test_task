-- phpMyAdmin SQL Dump
-- version 3.5.1
-- http://www.phpmyadmin.net
--
-- Хост: 127.0.0.1
-- Время создания: Дек 12 2012 г., 21:33
-- Версия сервера: 5.5.25
-- Версия PHP: 5.3.13

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- База данных: `test`
--

-- --------------------------------------------------------

--
-- Структура таблицы `users`
--

CREATE TABLE IF NOT EXISTS `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL COMMENT 'Full name',
  `login` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'User login',
  `password` varchar(50) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL COMMENT 'User password (plain text)',
  `enabled` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '1 = enabled, 0 - disabled',
  `short_info` varchar(100) NOT NULL,
  `treatment` varchar(100) NOT NULL,
  `experience` varchar(20) NOT NULL,
  `address_city` varchar(100) NOT NULL,
  `phone_home` varchar(15) NOT NULL,
  `phone_work` varchar(15) NOT NULL,
  `phone_mobile` varchar(15) NOT NULL,
  `fax` varchar(15) NOT NULL,
  `email_primary` varchar(50) NOT NULL,
  `email_work` varchar(50) NOT NULL,
  `surname` varchar(45) DEFAULT NULL,
  `second_name` varchar(45) NOT NULL,
  `address_index` int(10) unsigned NOT NULL,
  `address_street_name` varchar(45) NOT NULL,
  `address_street_num` varchar(10) NOT NULL,
  `address_country` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `login_unique` (`login`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='User credentials' AUTO_INCREMENT=3 ;

--
-- Дамп данных таблицы `users`
--

INSERT INTO `users` (`id`, `name`, `login`, `password`, `enabled`, `short_info`, `treatment`, `experience`, `address_city`, `phone_home`, `phone_work`, `phone_mobile`, `fax`, `email_primary`, `email_work`, `surname`, `second_name`, `address_index`, `address_street_name`, `address_street_num`, `address_country`) VALUES
(1, 'Людмила', 'lyuda', '123', 1, 'Печатные работы по цифровой рентгенографии, рентгеновской диагностике заболевания желудка.', '"Провожу консультации с позиции "партнерства""', 'Более 16 лет', 'Киев', '380501234567', '380443492911', '380443492912', '380443492912', 'info@sinevo.com', 'vishnevskaya@gmail.com', 'Вишневская', 'Юрьевна', 20133, 'Московский1', '12/206', 'Украна');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: 25-Jun-2018 às 20:51
-- Versão do servidor: 5.7.19
-- PHP Version: 5.6.31

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `a11v1r15_symmetrical-meme`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `terrain`
--

DROP TABLE IF EXISTS `terrain`;
CREATE TABLE IF NOT EXISTS `terrain` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL DEFAULT '0',
  `coord` text NOT NULL,
  `image` text NOT NULL,
  `hp` int(11) NOT NULL DEFAULT '2000',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `user`
--

DROP TABLE IF EXISTS `user`;
CREATE TABLE IF NOT EXISTS `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `login` text NOT NULL,
  `password` text NOT NULL,
  `email` text NOT NULL,
  `nick` text NOT NULL,
  `image` blob,
  `points` int(11) NOT NULL DEFAULT '0',
  `rock` int(11) NOT NULL DEFAULT '500',
  `food` int(11) NOT NULL DEFAULT '500',
  `gold` int(11) NOT NULL DEFAULT '500',
  `wood` int(11) NOT NULL DEFAULT '500',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `user`
--

INSERT INTO `user` (`id`, `login`, `password`, `email`, `nick`, `image`, `points`, `rock`, `food`, `gold`, `wood`) VALUES
(0, 'admin', 'admin', 'admin@symmetrical.meme', 'admin', NULL, 99999999, 500, 500, 500, 500),
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

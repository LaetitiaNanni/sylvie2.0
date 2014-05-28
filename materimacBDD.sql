-- phpMyAdmin SQL Dump
-- version 3.5.1
-- http://www.phpmyadmin.net
--
-- Client: localhost
-- Généré le: Mer 28 Mai 2014 à 07:04
-- Version du serveur: 5.5.24-log
-- Version de PHP: 5.3.13

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de données: `materimacbdd`
--

-- --------------------------------------------------------

--
-- Structure de la table `category`
--

CREATE TABLE IF NOT EXISTS `category` (
  `ID_Category` int(11) NOT NULL AUTO_INCREMENT,
  `label` varchar(64) NOT NULL,
  `Color` varchar(36) NOT NULL,
  PRIMARY KEY (`ID_Category`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- Contenu de la table `category`
--

INSERT INTO `category` (`ID_Category`, `label`, `Color`) VALUES
(1, 'photo-video', 'blue'),
(2, 'son', 'red'),
(3, 'lumiere', 'yellow'),
(4, 'accessoires', 'green');

-- --------------------------------------------------------

--
-- Structure de la table `item`
--

CREATE TABLE IF NOT EXISTS `item` (
  `ID_item` varchar(32) NOT NULL,
  `label` varchar(128) NOT NULL,
  `description` text NOT NULL,
  `ID_Kit` int(11) NOT NULL,
  `ID_Type` int(11) NOT NULL,
  `brand` enum('Sony','Canon','Nikon','Autre') NOT NULL,
  `model` varchar(64) NOT NULL,
  PRIMARY KEY (`ID_item`),
  KEY `ID_Set` (`ID_Kit`,`ID_Type`),
  KEY `ID_Type` (`ID_Type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `item`
--

INSERT INTO `item` (`ID_item`, `label`, `description`, `ID_Kit`, `ID_Type`, `brand`, `model`) VALUES
('1', 'appareil photo', 'appareil photo', 1, 4, 'Canon', '600D'),
('2', 'oculus rift', 'oculus rift', 2, 6, 'Autre', '1'),
('3', 'projecteur', 'projecteur', 3, 7, 'Autre', 'none'),
('4', 'Mbox', 'mbox', 4, 8, 'Autre', 'none'),
('5', 'objectif', 'objectif', 1, 5, 'Canon', '18-135mm');

-- --------------------------------------------------------

--
-- Structure de la table `kit`
--

CREATE TABLE IF NOT EXISTS `kit` (
  `ID_Kit` int(11) NOT NULL AUTO_INCREMENT,
  `label` varchar(128) NOT NULL,
  `description` text NOT NULL,
  PRIMARY KEY (`ID_Kit`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- Contenu de la table `kit`
--

INSERT INTO `kit` (`ID_Kit`, `label`, `description`) VALUES
(1, 'Kit Appareil photo', 'Appareil photo '),
(2, 'Kit Oculus', 'Oculus rift'),
(3, 'Kit Projecteur', 'projecteur'),
(4, 'Kit Mbox', 'mbox');

-- --------------------------------------------------------

--
-- Structure de la table `lending`
--

CREATE TABLE IF NOT EXISTS `lending` (
  `ID_User` int(11) NOT NULL,
  `ID_Loan` int(11) NOT NULL,
  `ID_Kit` int(11) NOT NULL,
  PRIMARY KEY (`ID_Loan`,`ID_Kit`),
  KEY `ID_User` (`ID_User`,`ID_Loan`,`ID_Kit`),
  KEY `ID_Kit` (`ID_Kit`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `lending`
--

INSERT INTO `lending` (`ID_User`, `ID_Loan`, `ID_Kit`) VALUES
(2, 3, 1),
(2, 3, 2),
(2, 4, 3),
(2, 4, 4),
(2, 5, 1);

-- --------------------------------------------------------

--
-- Structure de la table `loan`
--

CREATE TABLE IF NOT EXISTS `loan` (
  `ID_Loan` int(11) NOT NULL AUTO_INCREMENT,
  `tutor` varchar(32) NOT NULL COMMENT 'Enseignant Responsable',
  `project_name` varchar(32) NOT NULL,
  `loan_date` datetime NOT NULL COMMENT 'date du pret',
  `due_date` datetime NOT NULL COMMENT 'date du rendu',
  `collaborators` text COMMENT 'autres membres',
  `ID_State` int(11) NOT NULL,
  PRIMARY KEY (`ID_Loan`),
  KEY `ID_State` (`ID_State`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=6 ;

--
-- Contenu de la table `loan`
--

INSERT INTO `loan` (`ID_Loan`, `tutor`, `project_name`, `loan_date`, `due_date`, `collaborators`, `ID_State`) VALUES
(3, 'Vincent Nozick', 'lol', '2014-05-08 00:00:00', '2014-05-23 00:00:00', NULL, 1),
(4, 'Mathieu Constant', 'lolilol', '2014-06-11 00:00:00', '2014-06-19 00:00:00', NULL, 3),
(5, 'Biri', 'troll', '2014-06-18 00:00:00', '2014-06-25 00:00:00', NULL, 2);

-- --------------------------------------------------------

--
-- Structure de la table `state`
--

CREATE TABLE IF NOT EXISTS `state` (
  `ID_State` int(11) NOT NULL AUTO_INCREMENT,
  `name_state` varchar(50) NOT NULL,
  PRIMARY KEY (`ID_State`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=7 ;

--
-- Contenu de la table `state`
--

INSERT INTO `state` (`ID_State`, `name_state`) VALUES
(1, 'emprunté'),
(2, 'en cours de validation'),
(3, 'validé'),
(4, 'annulé'),
(5, 'refusé'),
(6, 'retourné');

-- --------------------------------------------------------

--
-- Structure de la table `type`
--

CREATE TABLE IF NOT EXISTS `type` (
  `ID_Type` int(11) NOT NULL AUTO_INCREMENT,
  `label` varchar(32) NOT NULL,
  `ID_Category` int(11) NOT NULL,
  PRIMARY KEY (`ID_Type`),
  KEY `ID_Category` (`ID_Category`),
  KEY `ID_Category_2` (`ID_Category`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=9 ;

--
-- Contenu de la table `type`
--

INSERT INTO `type` (`ID_Type`, `label`, `ID_Category`) VALUES
(4, 'photo', 1),
(5, 'objectif', 1),
(6, 'oculus rift', 1),
(7, 'projecteur', 1),
(8, 'mbox', 2);

-- --------------------------------------------------------

--
-- Structure de la table `user`
--

CREATE TABLE IF NOT EXISTS `user` (
  `ID_User` int(11) NOT NULL AUTO_INCREMENT,
  `ID_Student` int(11) NOT NULL,
  `login` varchar(16) NOT NULL,
  `lastname` varchar(32) NOT NULL,
  `firstname` varchar(32) NOT NULL,
  `e_mail` varchar(32) NOT NULL,
  `grade` varchar(32) NOT NULL,
  PRIMARY KEY (`ID_User`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Contenu de la table `user`
--

INSERT INTO `user` (`ID_User`, `ID_Student`, `login`, `lastname`, `firstname`, `e_mail`, `grade`) VALUES
(1, 0, 'admin', 'admin', 'admin', 'admin@gmail.com', 'nograde'),
(2, 82431, 'jpo', 'po', 'julie', 'pojulie07@gmail.com', 'imac2');

--
-- Contraintes pour les tables exportées
--

--
-- Contraintes pour la table `item`
--
ALTER TABLE `item`
  ADD CONSTRAINT `item_ibfk_1` FOREIGN KEY (`ID_Kit`) REFERENCES `kit` (`ID_Kit`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `item_ibfk_2` FOREIGN KEY (`ID_Type`) REFERENCES `type` (`ID_Type`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `lending`
--
ALTER TABLE `lending`
  ADD CONSTRAINT `lending_ibfk_1` FOREIGN KEY (`ID_User`) REFERENCES `user` (`ID_User`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `lending_ibfk_3` FOREIGN KEY (`ID_Kit`) REFERENCES `kit` (`ID_Kit`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `lending_ibfk_4` FOREIGN KEY (`ID_Loan`) REFERENCES `loan` (`ID_Loan`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `type`
--
ALTER TABLE `type`
  ADD CONSTRAINT `type_ibfk_1` FOREIGN KEY (`ID_Category`) REFERENCES `category` (`ID_Category`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

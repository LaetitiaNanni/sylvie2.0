-- phpMyAdmin SQL Dump
-- version 4.1.14
-- http://www.phpmyadmin.net
--
-- Client :  127.0.0.1
-- Généré le :  Mar 27 Mai 2014 à 17:03
-- Version du serveur :  5.6.17
-- Version de PHP :  5.5.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de données :  `materimac`
--

-- --------------------------------------------------------

--
-- Structure de la table `category`
--

CREATE TABLE IF NOT EXISTS `category` (
  `ID_Category` int(11) NOT NULL AUTO_INCREMENT,
  `label` varchar(64) NOT NULL,
  PRIMARY KEY (`ID_Category`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

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

-- --------------------------------------------------------

--
-- Structure de la table `kit`
--

CREATE TABLE IF NOT EXISTS `kit` (
  `ID_Kit` int(11) NOT NULL AUTO_INCREMENT,
  `label` varchar(128) NOT NULL,
  `description` text NOT NULL,
  PRIMARY KEY (`ID_Kit`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

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
  `collaborators` text NOT NULL COMMENT 'autres membres',
  PRIMARY KEY (`ID_Loan`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Contraintes pour les tables exportées
--

--
-- Contraintes pour la table `item`
--
ALTER TABLE `item`
  ADD CONSTRAINT `item_ibfk_2` FOREIGN KEY (`ID_Type`) REFERENCES `type` (`ID_Type`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `item_ibfk_1` FOREIGN KEY (`ID_Kit`) REFERENCES `kit` (`ID_Kit`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `lending`
--
ALTER TABLE `lending`
  ADD CONSTRAINT `lending_ibfk_4` FOREIGN KEY (`ID_Loan`) REFERENCES `loan` (`ID_Loan`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `lending_ibfk_1` FOREIGN KEY (`ID_User`) REFERENCES `user` (`ID_User`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `lending_ibfk_3` FOREIGN KEY (`ID_Kit`) REFERENCES `kit` (`ID_Kit`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `type`
--
ALTER TABLE `type`
  ADD CONSTRAINT `type_ibfk_1` FOREIGN KEY (`ID_Category`) REFERENCES `category` (`ID_Category`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

-- phpMyAdmin SQL Dump
-- version 4.0.9
-- http://www.phpmyadmin.net
--
-- Client: 127.0.0.1
-- Généré le: Mer 28 Mai 2014 à 15:49
-- Version du serveur: 5.5.34
-- Version de PHP: 5.4.22

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de données: `materimac_bdd_tempo`
--

-- --------------------------------------------------------

--
-- Structure de la table `brand`
--

CREATE TABLE IF NOT EXISTS `brand` (
  `ID_Brand` int(11) NOT NULL AUTO_INCREMENT,
  `label` varchar(32) NOT NULL,
  PRIMARY KEY (`ID_Brand`),
  UNIQUE KEY `label` (`label`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=23 ;

--
-- Contenu de la table `brand`
--

INSERT INTO `brand` (`ID_Brand`, `label`) VALUES
(2, 'Arduino'),
(1, 'Autre'),
(3, 'Avid'),
(4, 'Canon'),
(5, 'Dea Factory'),
(6, 'DSLR Rig'),
(7, 'GoPro'),
(8, 'Lastolite'),
(9, 'Leap Motion'),
(10, 'Manfrotto'),
(11, 'Microsoft'),
(12, 'Oculus VR'),
(13, 'Parrot'),
(14, 'Rode'),
(15, 'Roland'),
(16, 'Sennheiser'),
(17, 'Sigma'),
(18, 'Tomann'),
(19, 'Transcend'),
(20, 'Viewfinder'),
(21, 'Zeppelin'),
(22, 'Zoom');

-- --------------------------------------------------------

--
-- Structure de la table `category`
--

CREATE TABLE IF NOT EXISTS `category` (
  `ID_Category` int(11) NOT NULL AUTO_INCREMENT,
  `label` varchar(64) NOT NULL,
  `Color` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`ID_Category`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=6 ;

--
-- Contenu de la table `category`
--

INSERT INTO `category` (`ID_Category`, `label`, `Color`) VALUES
(1, 'Autres', '#000000'),
(2, 'Photo/Vidéo', '#2C8ECD'),
(3, 'Accessoire', '#222222'),
(4, 'Interactivité', '#90C541'),
(5, 'Audio', '#E51A2F');

-- --------------------------------------------------------

--
-- Structure de la table `check`
--

CREATE TABLE IF NOT EXISTS `check` (
  `ID_Check` int(11) NOT NULL AUTO_INCREMENT,
  `element` varchar(64) NOT NULL COMMENT 'élément à vérifier ',
  `ID_Type` int(11) NOT NULL,
  PRIMARY KEY (`ID_Check`),
  KEY `ID_Type` (`ID_Type`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=16 ;

--
-- Contenu de la table `check`
--

INSERT INTO `check` (`ID_Check`, `element`, `ID_Type`) VALUES
(1, 'Appareil nu, cache', 34),
(2, 'Boite, 2 notices, housse, flash, socle', 4),
(3, 'Boite, micro, support', 18),
(4, 'Carte, boite', 28),
(5, 'Carte, boite', 29),
(6, 'GoPro, monture (coque et elastique), notice, boite, cable', 25),
(7, 'Mandarine, ampoule intacte, cable, pied ', 22),
(8, 'Mbox, clé USB licence, cable, adaptateur jack, adaptateur 2 mini', 19),
(9, 'Notice, autocollants, 4 prises, coque, batterie, chargeur, drone', 33),
(10, 'Notice, boite, leapmotion, cable', 2),
(11, 'Notice, jeu Kinect adventure, Kinect, 2 cables', 24),
(12, 'Notice, oculus, adaptateur dvi hdmi, 3 prises, chiffon, 2 cables', 15),
(13, 'Notice, pochette, réflecteur', 7),
(14, 'Objectif, 2 caches', 16),
(15, 'Tissu', 6);

-- --------------------------------------------------------

--
-- Structure de la table `item`
--

CREATE TABLE IF NOT EXISTS `item` (
  `PREFIX` varchar(5) NOT NULL DEFAULT 'CN-' COMMENT 'CN (Campus Numérique), XRX (Sans référence)',
  `ID_Item` int(11) NOT NULL,
  `label` varchar(128) NOT NULL,
  `description` text,
  `ID_Kit` int(11) NOT NULL,
  `ID_Type` int(11) NOT NULL,
  `model` varchar(64) DEFAULT NULL,
  `available` enum('oui','non') NOT NULL DEFAULT 'oui',
  `ID_Brand` int(11) NOT NULL,
  `Img` varchar(256) DEFAULT NULL,
  PRIMARY KEY (`PREFIX`,`ID_Item`),
  KEY `ID_Set` (`ID_Kit`,`ID_Type`),
  KEY `ID_Type` (`ID_Type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `item`
--

INSERT INTO `item` (`PREFIX`, `ID_Item`, `label`, `description`, `ID_Kit`, `ID_Type`, `model`, `available`, `ID_Brand`, `Img`) VALUES
('CN-', 1527, 'Adaptateur réseau', NULL, 1, 35, NULL, 'oui', 11, NULL),
('CN-', 1612, 'Bloc alimentation', NULL, 1, 30, NULL, 'oui', 11, NULL),
('CN-', 1613, 'Carte compact Flash 32Go', NULL, 5, 29, NULL, 'oui', 4, 'CompactFlash.jpg'),
('CN-', 1761, 'appareil photo', 'L''EOS 7D est à la fois performant et polyvalent, et il permet de filmer en Haute Définition. Avec une résolution de 18 millions de pixels, l''appareil offre une qualité d''image exceptionnelle.\n', 5, 34, NULL, 'oui', 4, 'canon7D.jpg'),
('CN-', 1762, 'appareil photo', 'L''EOS 7D est à la fois performant et polyvalent, et il permet de filmer en Haute Définition. Avec une résolution de 18 millions de pixels, l''appareil offre une qualité d''image exceptionnelle.\n', 7, 34, NULL, 'oui', 4, 'canon7D.jpg'),
('CN-', 1763, 'objectif 30mm', NULL, 5, 16, NULL, 'oui', 17, 'objectif30.jpg'),
('CN-', 1764, 'objectif 50mm', NULL, 7, 16, NULL, 'oui', 4, 'objectif50_2.jpg'),
('CN-', 1765, 'objectif 70-300', NULL, 1, 16, NULL, 'oui', 4, 'objectif70-300_2.jpg'),
('CN-', 1766, 'LCD extender', 'Le LCD Extender transforme la vision directe de l''écran de l''appareil afin d''obtenir une image plus précise.\n', 1, 23, NULL, 'oui', 20, 'lcd_extender2.jpg'),
('CN-', 1767, 'LCD extender', 'Le LCD Extender transforme la vision directe de l''écran de l''appareil afin d''obtenir une image plus précise.\n', 1, 23, NULL, 'oui', 20, 'lcd_extender2.jpg'),
('CN-', 1768, 'LCD extender', 'Le LCD Extender transforme la vision directe de l''écran de l''appareil afin d''obtenir une image plus précise.\n', 1, 23, NULL, 'oui', 20, 'lcd_extender2.jpg'),
('CN-', 1769, 'batterie', NULL, 5, 31, NULL, 'oui', 4, 'batterie.jpg'),
('CN-', 1770, 'batterie', NULL, 6, 31, NULL, 'oui', 4, 'batterie.jpg'),
('CN-', 1771, 'Microphone', NULL, 8, 18, NULL, 'oui', 16, 'micro2.jpg'),
('CN-', 1772, 'Microphone', NULL, 9, 18, NULL, 'oui', 16, 'micro2.jpg'),
('CN-', 1773, 'Microphone', NULL, 1, 17, NULL, 'oui', 16, 'micro2.jpg'),
('CN-', 1774, 'Microphone', NULL, 1, 17, NULL, 'oui', 16, 'micro2.jpg'),
('CN-', 1775, 'Microphone', NULL, 1, 17, NULL, 'oui', 16, 'micro2.jpg'),
('CN-', 1776, 'pied cam', NULL, 1, 13, NULL, 'oui', 10, 'petit_pied.jpg'),
('CN-', 1777, 'pied cam', NULL, 1, 13, NULL, 'oui', 10, 'petit_pied.jpg'),
('CN-', 1778, 'perche', NULL, 8, 14, NULL, 'oui', 21, 'perche.jpg'),
('CN-', 1779, 'perche', NULL, 9, 14, NULL, 'oui', 21, 'perche.jpg'),
('CN-', 1780, 'clavier', NULL, 1, 26, NULL, 'oui', 15, NULL),
('CN-', 1786, 'objectif 30mm', NULL, 6, 16, NULL, 'oui', 1, 'objectif30.jpg'),
('CN-', 1787, 'go pro', 'La Go Pro HD Hero 2 est fournie avec un caisson étanche et une fixation élastique modulable. Elle possède un super grand-angle de 170° et permet de filmer 120 images/s.\n', 1, 25, NULL, 'oui', 7, 'go_pro.jpg'),
('CN-', 1790, 'Sacoche', NULL, 1, 9, NULL, 'oui', 1, 'sacoche.jpg'),
('CN-', 2603, 'poignée rig', NULL, 1, 12, NULL, 'oui', 6, 'rig2.jpg'),
('CN-', 2604, 'poignée rig', NULL, 1, 12, NULL, 'oui', 6, 'rig2.jpg'),
('CN-', 2694, 'manette ps3', NULL, 1, 21, NULL, 'oui', 5, 'manette.jpg'),
('CN-', 2695, 'AR Drone', 'L''AR.Drone est un quadricoptère qui peut se piloter avec un appareil sous iOs, Android ou Symbian  (téléphones Nokia) via une liaison Wi-Fi.\n', 10, 33, NULL, 'oui', 13, 'ardrone2.jpg'),
('CN-', 2696, 'batterie AR Drone', NULL, 10, 32, NULL, 'oui', 13, 'batterie_ardrone.jpg'),
('CN-', 2699, 'Carte mémoire', NULL, 6, 29, NULL, 'oui', 1, NULL),
('CN-', 2700, 'Carte mémoire canon', NULL, 7, 29, NULL, 'oui', 1, NULL),
('CN-', 2701, 'Mbox Mini (+Pro Tools)', 'La Mbox offre la possibilité de connecter des instruments, micros… En associant Pro Tools, vous pouvez enregistrer, éditer et mixer avec une qualité sonore époustouflante.\n', 1, 19, NULL, 'oui', 3, 'mbox2.jpg'),
('CN-', 2702, 'Mbox Mini (+Pro Tools)', 'La Mbox offre la possibilité de connecter des instruments, micros… En associant Pro Tools, vous pouvez enregistrer, éditer et mixer avec une qualité sonore époustouflante.\n', 1, 19, NULL, 'oui', 3, 'mbox2.jpg'),
('CN-', 2703, 'Mbox Mini (+Pro Tools)', 'La Mbox offre la possibilité de connecter des instruments, micros… En associant Pro Tools, vous pouvez enregistrer, éditer et mixer avec une qualité sonore époustouflante.\n', 1, 19, NULL, 'oui', 3, 'mbox2.jpg'),
('CN-', 2704, 'Mbox Mini (+Pro Tools)', 'La Mbox offre la possibilité de connecter des instruments, micros… En associant Pro Tools, vous pouvez enregistrer, éditer et mixer avec une qualité sonore époustouflante.\n', 1, 19, NULL, 'oui', 3, 'mbox2.jpg'),
('CN-', 2705, 'Mbox Mini (+Pro Tools)', 'La Mbox offre la possibilité de connecter des instruments, micros… En associant Pro Tools, vous pouvez enregistrer, éditer et mixer avec une qualité sonore époustouflante.\n', 1, 19, NULL, 'oui', 3, 'mbox2.jpg'),
('CN-', 2706, 'Mbox Mini (+Pro Tools)', 'La Mbox offre la possibilité de connecter des instruments, micros… En associant Pro Tools, vous pouvez enregistrer, éditer et mixer avec une qualité sonore époustouflante.\n', 1, 19, NULL, 'oui', 3, 'mbox2.jpg'),
('CN-', 2707, 'Mbox Mini (+Pro Tools)', 'La Mbox offre la possibilité de connecter des instruments, micros… En associant Pro Tools, vous pouvez enregistrer, éditer et mixer avec une qualité sonore époustouflante.\n', 1, 19, NULL, 'oui', 3, 'mbox2.jpg'),
('CN-', 2708, 'Mbox Mini (+Pro Tools)', 'La Mbox offre la possibilité de connecter des instruments, micros… En associant Pro Tools, vous pouvez enregistrer, éditer et mixer avec une qualité sonore époustouflante.\n', 1, 19, NULL, 'oui', 3, 'mbox2.jpg'),
('CN-', 2709, 'Mbox Mini (+Pro Tools)', 'La Mbox offre la possibilité de connecter des instruments, micros… En associant Pro Tools, vous pouvez enregistrer, éditer et mixer avec une qualité sonore époustouflante.\n', 1, 19, NULL, 'oui', 3, 'mbox2.jpg'),
('CN-', 2710, 'Mbox Mini (+Pro Tools)', 'La Mbox offre la possibilité de connecter des instruments, micros… En associant Pro Tools, vous pouvez enregistrer, éditer et mixer avec une qualité sonore époustouflante.\n', 1, 19, NULL, 'oui', 3, 'mbox2.jpg'),
('CN-', 2711, 'Mbox Mini (+Pro Tools)', 'La Mbox offre la possibilité de connecter des instruments, micros… En associant Pro Tools, vous pouvez enregistrer, éditer et mixer avec une qualité sonore époustouflante.\n', 1, 19, NULL, 'oui', 3, 'mbox2.jpg'),
('CN-', 2712, 'Mbox Mini (+Pro Tools)', 'La Mbox offre la possibilité de connecter des instruments, micros… En associant Pro Tools, vous pouvez enregistrer, éditer et mixer avec une qualité sonore époustouflante.\n', 1, 19, NULL, 'oui', 3, 'mbox2.jpg'),
('CN-', 2731, 'appareil photo', 'L''EOS 7D est à la fois performant et polyvalent, et il permet de filmer en Haute Définition. Avec une résolution de 18 millions de pixels, l''appareil offre une qualité d''image exceptionnelle.\n', 6, 34, NULL, 'oui', 4, 'canon7D.jpg'),
('CN-', 2786, 'Chargeur Piles', NULL, 1, 27, NULL, 'oui', 1, NULL),
('CN-', 2810, 'leap motion', NULL, 1, 2, NULL, 'oui', 9, 'leap_motion.jpg'),
('CN-', 2852, 'leap motion', NULL, 1, 2, NULL, 'oui', 9, 'leap_motion3.jpg'),
('CN-', 2854, 'Kinect XBOX 360', 'Kinect vous laisse les mains libres pour profiter de vos jeux et de vos divertissements. Celle-ci vous permet de développer des applications interactives.\n', 1, 24, NULL, 'oui', 11, 'kinect2.jpg'),
('CN-', 2855, 'Kinect XBOX 360', 'Kinect vous laisse les mains libres pour profiter de vos jeux et de vos divertissements. Celle-ci vous permet de développer des applications interactives.\n', 1, 24, NULL, 'oui', 11, 'kinect2.jpg'),
('CN-', 2863, 'Oculus Rift', NULL, 1, 15, NULL, 'oui', 12, 'oculus2.jpg'),
('CN-', 2864, 'h4n', NULL, 1, 8, NULL, 'oui', 22, NULL),
('CN-', 2866, 'h4n', NULL, 1, 8, NULL, 'oui', 22, NULL),
('CN-', 2867, 'Mandarine', 'Projecteur de forme demi-sphérique utilisé pour la photographie et le cinéma. Ses 4 volets amovibles permettent de moduler et orienter la lumière.\n', 1, 22, NULL, 'oui', 1, 'mandarine.jpg'),
('CN-', 2868, 'Mandarine', 'Projecteur de forme demi-sphérique utilisé pour la photographie et le cinéma. Ses 4 volets amovibles permettent de moduler et orienter la lumière.\n', 1, 22, NULL, 'oui', 1, 'mandarine.jpg'),
('CN-', 2869, 'Mandarine', 'Projecteur de forme demi-sphérique utilisé pour la photographie et le cinéma. Ses 4 volets amovibles permettent de moduler et orienter la lumière.\n', 1, 22, NULL, 'oui', 1, 'mandarine.jpg'),
('CN-', 2998, 'flash', NULL, 1, 4, NULL, 'oui', 4, 'flash.jpg'),
('XRX-', 1, 'Carte SD 32GO', NULL, 1, 28, NULL, 'oui', 19, 'SD32.jpg'),
('XRX-', 2, 'Matériel Arduino', NULL, 1, 20, NULL, 'oui', 2, NULL),
('XRX-', 3, 'objectif 18-135', NULL, 1, 16, NULL, 'oui', 4, NULL),
('XRX-', 4, 'Robot Arduino', NULL, 1, 11, NULL, 'oui', 2, NULL),
('XRX-', 5, 'rode attache micro', NULL, 8, 10, NULL, 'oui', 14, 'rode2.jpg'),
('XRX-', 6, 'rode attache micro', NULL, 9, 10, NULL, 'oui', 14, 'rode2.jpg'),
('XRX-', 7, 'Carte SD 32GO', NULL, 1, 28, NULL, 'oui', 19, 'SD32.jpg'),
('XRX-', 8, 'Réflecteurs cirulaires', NULL, 1, 7, NULL, 'oui', 8, 'reflecteur2.jpg'),
('XRX-', 9, 'Réflecteurs cirulaires', NULL, 1, 7, NULL, 'oui', 8, 'reflecteur2.jpg'),
('XRX-', 10, 'Réflecteurs cirulaires', NULL, 1, 7, NULL, 'oui', 8, 'reflecteur2.jpg'),
('XRX-', 11, 'Pieds fond vert', NULL, 1, 6, NULL, 'oui', 1, NULL),
('XRX-', 12, 'Cross épaule', NULL, 1, 5, NULL, 'oui', 1, 'cross_epaule2.jpg'),
('XRX-', 13, 'cable xlr xlr x2', NULL, 1, 3, NULL, 'oui', 18, NULL),
('XRX-', 14, 'cable xlr jck', NULL, 1, 3, NULL, 'oui', 18, NULL);

-- --------------------------------------------------------

--
-- Structure de la table `kit`
--

CREATE TABLE IF NOT EXISTS `kit` (
  `ID_Kit` int(11) NOT NULL AUTO_INCREMENT,
  `label` varchar(128) NOT NULL,
  `description` text NOT NULL,
  PRIMARY KEY (`ID_Kit`),
  UNIQUE KEY `label` (`label`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=11 ;

--
-- Contenu de la table `kit`
--

INSERT INTO `kit` (`ID_Kit`, `label`, `description`) VALUES
(1, 'NO_KIT', '--'),
(5, 'Pack Canon 1', ''),
(6, 'Pack Canon 2', ''),
(7, 'Pack Canon 3', ''),
(8, 'Pack Micro/Perche 1', ''),
(9, 'Pack Micro/Perche 2', ''),
(10, 'Pack AR Drone 1', '');

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
  `tutor` varchar(32) DEFAULT NULL COMMENT 'Enseignant Responsable',
  `project_name` varchar(32) NOT NULL,
  `loan_date` datetime NOT NULL COMMENT 'date du pret',
  `due_date` datetime NOT NULL COMMENT 'date du rendu',
  `collaborators` text COMMENT 'autres membres',
  `ID_State` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`ID_Loan`),
  KEY `state` (`ID_State`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `state`
--

CREATE TABLE IF NOT EXISTS `state` (
  `ID_State` int(11) NOT NULL AUTO_INCREMENT,
  `state_name` varchar(32) NOT NULL,
  PRIMARY KEY (`ID_State`),
  UNIQUE KEY `label` (`state_name`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=8 ;

--
-- Contenu de la table `state`
--

INSERT INTO `state` (`ID_State`, `state_name`) VALUES
(6, 'annulé'),
(2, 'emprunté'),
(4, 'en retard'),
(1, 'non validé'),
(7, 'refusé'),
(5, 'rendu');

-- --------------------------------------------------------

--
-- Structure de la table `type`
--

CREATE TABLE IF NOT EXISTS `type` (
  `ID_Type` int(11) NOT NULL AUTO_INCREMENT,
  `label` varchar(32) NOT NULL,
  `ID_Category` int(11) NOT NULL,
  PRIMARY KEY (`ID_Type`),
  UNIQUE KEY `label` (`label`),
  KEY `ID_Category` (`ID_Category`),
  KEY `ID_Category_2` (`ID_Category`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=36 ;

--
-- Contenu de la table `type`
--

INSERT INTO `type` (`ID_Type`, `label`, `ID_Category`) VALUES
(1, 'NO_TYPE', 1),
(2, 'Leap Motion', 4),
(3, 'Cable', 3),
(4, 'Flash', 3),
(5, 'Cross épaule', 3),
(6, 'Fond vert', 3),
(7, 'Réflecteur', 3),
(8, 'Zoom', 2),
(9, 'Sacoche', 3),
(10, 'Rode', 3),
(11, 'Robot Arduino', 4),
(12, 'Poignée Rig', 3),
(13, 'Pied cam', 3),
(14, 'Perche', 5),
(15, 'Oculus', 4),
(16, 'Objectif', 2),
(17, 'Microphone', 3),
(18, 'Micro', 3),
(19, 'Mbox', 5),
(20, 'Arduino', 4),
(21, 'Manette PS3', 4),
(22, 'Mandarine', 2),
(23, 'LCD extender', 3),
(24, 'Kinect', 4),
(25, 'GoPro', 2),
(26, 'Clavier', 3),
(27, 'Chargeur', 3),
(28, 'Carte SD', 3),
(29, 'Compact Flash', 3),
(30, 'Bloc Alimentation Kinect', 3),
(31, 'Batterie Canon', 3),
(32, 'Batterie AR Drone', 3),
(33, 'AR Drone', 3),
(34, 'Canon 7D', 2),
(35, 'Adaptateur réseau Kinect', 3);

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
  `grade` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`ID_User`),
  UNIQUE KEY `login` (`login`,`e_mail`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=6 ;

--
-- Contenu de la table `user`
--

INSERT INTO `user` (`ID_User`, `ID_Student`, `login`, `lastname`, `firstname`, `e_mail`, `grade`) VALUES
(1, 200, 'vnozick', 'Nozick', 'Vincent', 'vnozick@upem.fr', 'prof'),
(2, 56, 'biri', 'Biri', 'Venceslas', 'biri@u-pem.fr', 'prof'),
(3, 42, 'shinawatra', 'Shinawatra', 'Yingluck', 'shin@gmail.com', 'student'),
(4, 99, 'jean', 'Delatour', 'Jean', 'jean@etudiant.u-pem.fr', 'jean'),
(5, 124, 'chantilly', 'Gauffre', 'Chantilly', 'gauffre-chantilly@gmail.com', 'student');

--
-- Contraintes pour les tables exportées
--

--
-- Contraintes pour la table `check`
--
ALTER TABLE `check`
  ADD CONSTRAINT `check_ibfk_1` FOREIGN KEY (`ID_Type`) REFERENCES `type` (`ID_Type`) ON DELETE CASCADE ON UPDATE CASCADE;

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
-- Contraintes pour la table `loan`
--
ALTER TABLE `loan`
  ADD CONSTRAINT `loan_ibfk_1` FOREIGN KEY (`ID_State`) REFERENCES `state` (`ID_State`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `type`
--
ALTER TABLE `type`
  ADD CONSTRAINT `type_ibfk_1` FOREIGN KEY (`ID_Category`) REFERENCES `category` (`ID_Category`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

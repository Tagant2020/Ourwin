-- phpMyAdmin SQL Dump
-- version 4.1.14
-- http://www.phpmyadmin.net
--
-- Client :  127.0.0.1
-- Généré le :  Mar 17 Novembre 2020 à 17:14
-- Version du serveur :  5.6.17
-- Version de PHP :  5.5.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de données :  `loginfo`
--

-- --------------------------------------------------------

--
-- Structure de la table `boissons`
--

CREATE TABLE IF NOT EXISTS `boissons` (
  `num_bss` int(11) NOT NULL AUTO_INCREMENT,
  `boissons` varchar(50) DEFAULT NULL,
  `prix_boissons` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`num_bss`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=7 ;

--
-- Contenu de la table `boissons`
--

INSERT INTO `boissons` (`num_bss`, `boissons`, `prix_boissons`) VALUES
(5, 'guiness', '15'),
(6, 'pamplemousse', '6');

-- --------------------------------------------------------

--
-- Structure de la table `boite_interim`
--

CREATE TABLE IF NOT EXISTS `boite_interim` (
  `num_bi` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(100) DEFAULT NULL,
  `ep_num` int(11) DEFAULT NULL,
  PRIMARY KEY (`num_bi`),
  KEY `ep_num` (`ep_num`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Contenu de la table `boite_interim`
--

INSERT INTO `boite_interim` (`num_bi`, `nom`, `ep_num`) VALUES
(1, 'Adequat', 1),
(2, 'Planete', 1);

-- --------------------------------------------------------

--
-- Structure de la table `commandes`
--

CREATE TABLE IF NOT EXISTS `commandes` (
  `num_cmd` int(11) NOT NULL AUTO_INCREMENT,
  `repas_num` int(11) DEFAULT NULL,
  `bss_num` int(11) DEFAULT NULL,
  `users_num` int(11) DEFAULT NULL,
  PRIMARY KEY (`num_cmd`),
  KEY `repas_num` (`repas_num`),
  KEY `bss_num` (`bss_num`),
  KEY `users_num` (`users_num`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- Contenu de la table `commandes`
--

INSERT INTO `commandes` (`num_cmd`, `repas_num`, `bss_num`, `users_num`) VALUES
(4, 3, 5, 12);

-- --------------------------------------------------------

--
-- Structure de la table `destinataire`
--

CREATE TABLE IF NOT EXISTS `destinataire` (
  `num_dest` int(11) NOT NULL AUTO_INCREMENT,
  `libelle` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`num_dest`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Contenu de la table `destinataire`
--

INSERT INTO `destinataire` (`num_dest`, `libelle`) VALUES
(1, 'Loginfo'),
(2, 'Entreprise');

-- --------------------------------------------------------

--
-- Structure de la table `droit`
--

CREATE TABLE IF NOT EXISTS `droit` (
  `num_droit` int(11) NOT NULL AUTO_INCREMENT,
  `libelle` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`num_droit`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Contenu de la table `droit`
--

INSERT INTO `droit` (`num_droit`, `libelle`) VALUES
(1, 'admin'),
(2, 'users'),
(3, 'gastronome');

-- --------------------------------------------------------

--
-- Structure de la table `enregistrement`
--

CREATE TABLE IF NOT EXISTS `enregistrement` (
  `num_enreg` int(11) NOT NULL AUTO_INCREMENT,
  `datess` date DEFAULT NULL,
  `heure_debut` time DEFAULT NULL,
  `heure_fin` time DEFAULT NULL,
  `users_num` int(11) DEFAULT NULL,
  PRIMARY KEY (`num_enreg`),
  KEY `users_num` (`users_num`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=30 ;

--
-- Contenu de la table `enregistrement`
--

INSERT INTO `enregistrement` (`num_enreg`, `datess`, `heure_debut`, `heure_fin`, `users_num`) VALUES
(22, '2022-12-12', '16:00:00', '00:30:00', 12),
(23, '2022-12-08', '16:00:00', '00:30:00', 12),
(24, '2020-11-10', '08:30:00', '22:05:00', 12),
(25, '2020-11-13', '16:00:00', '22:05:00', 12),
(27, '2020-11-13', '16:00:00', '23:30:00', 12),
(29, '2020-11-17', '16:30:00', '22:10:00', 12);

-- --------------------------------------------------------

--
-- Structure de la table `entreprise`
--

CREATE TABLE IF NOT EXISTS `entreprise` (
  `num_ep` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(100) DEFAULT NULL,
  `identifiant` text,
  `code_activation` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`num_ep`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Contenu de la table `entreprise`
--

INSERT INTO `entreprise` (`num_ep`, `nom`, `identifiant`, `code_activation`) VALUES
(1, 'ID LOGISTICS', 'brie_comte_robert', NULL);

-- --------------------------------------------------------

--
-- Structure de la table `groupe_users`
--

CREATE TABLE IF NOT EXISTS `groupe_users` (
  `num_gp_users` int(11) NOT NULL AUTO_INCREMENT,
  `zone` varchar(30) DEFAULT NULL,
  `periode` varchar(30) DEFAULT NULL,
  `msg_num` int(11) DEFAULT NULL,
  PRIMARY KEY (`num_gp_users`),
  KEY `msg_num` (`msg_num`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=19 ;

--
-- Contenu de la table `groupe_users`
--

INSERT INTO `groupe_users` (`num_gp_users`, `zone`, `periode`, `msg_num`) VALUES
(17, '211', 'apres-midi', 31),
(18, '208', 'apres-midi', 31);

-- --------------------------------------------------------

--
-- Structure de la table `message`
--

CREATE TABLE IF NOT EXISTS `message` (
  `num_msg` int(11) NOT NULL AUTO_INCREMENT,
  `users_num` int(11) DEFAULT NULL,
  `libelle` text,
  `anonymat` varchar(5) DEFAULT NULL,
  `message_referent` int(11) DEFAULT NULL,
  `statut_diffusion` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`num_msg`),
  KEY `users_num` (`users_num`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=35 ;

--
-- Contenu de la table `message`
--

INSERT INTO `message` (`num_msg`, `users_num`, `libelle`, `anonymat`, `message_referent`, `statut_diffusion`) VALUES
(31, 12, 'Ouf ca passe', NULL, NULL, 'actif'),
(32, 12, 'parce que ca passe', 'Non', 31, NULL),
(34, 12, 'j''en ai marre', 'Oui', 31, NULL);

-- --------------------------------------------------------

--
-- Structure de la table `planning`
--

CREATE TABLE IF NOT EXISTS `planning` (
  `num_planning` int(11) NOT NULL AUTO_INCREMENT,
  `libelle` varchar(100) DEFAULT NULL,
  `ep_num` int(11) DEFAULT NULL,
  PRIMARY KEY (`num_planning`),
  KEY `ep_num` (`ep_num`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `repas`
--

CREATE TABLE IF NOT EXISTS `repas` (
  `num_repas` int(11) NOT NULL AUTO_INCREMENT,
  `repas` varchar(50) DEFAULT NULL,
  `prix_repas` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`num_repas`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Contenu de la table `repas`
--

INSERT INTO `repas` (`num_repas`, `repas`, `prix_repas`) VALUES
(3, 'NdolÃ©', '18');

-- --------------------------------------------------------

--
-- Structure de la table `suggestion`
--

CREATE TABLE IF NOT EXISTS `suggestion` (
  `num_sugg` int(11) NOT NULL AUTO_INCREMENT,
  `suggestions` text,
  `users_num` int(11) DEFAULT NULL,
  PRIMARY KEY (`num_sugg`),
  KEY `users_num` (`users_num`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `users`
--

CREATE TABLE IF NOT EXISTS `users` (
  `num_users` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(50) DEFAULT NULL,
  `prenom` varchar(50) DEFAULT NULL,
  `periode` varchar(10) DEFAULT NULL,
  `mdp` varchar(200) DEFAULT NULL,
  `tel` int(11) DEFAULT NULL,
  `sexe` varchar(10) DEFAULT NULL,
  `bi_num` int(11) DEFAULT NULL,
  `droit_num` int(11) DEFAULT NULL,
  `ep_num` int(11) DEFAULT NULL,
  `zone` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`num_users`),
  KEY `bi_num` (`bi_num`),
  KEY `droit_num` (`droit_num`),
  KEY `ep_num` (`ep_num`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=14 ;

--
-- Contenu de la table `users`
--

INSERT INTO `users` (`num_users`, `nom`, `prenom`, `periode`, `mdp`, `tel`, `sexe`, `bi_num`, `droit_num`, `ep_num`, `zone`) VALUES
(11, 'test', 'borel', 'matin', 'c4a2d99bc28d236098a095277b7eb0718d6be068', 11258, 'h', 1, 1, 1, '202'),
(12, 'ff', 'dd', 'apres-midi', 'c4b5c86bd577da3d93fea7c89cba61c78b48e589', 5774, 'h', 2, 3, 1, '208'),
(13, 'toto', 'tate', 'soir', '39dfa55283318d31afe5a3ff4a0e3253e2045e43', 54961, 'h', 1, 2, 1, '202');

--
-- Contraintes pour les tables exportées
--

--
-- Contraintes pour la table `boite_interim`
--
ALTER TABLE `boite_interim`
  ADD CONSTRAINT `boite_interim_ibfk_1` FOREIGN KEY (`ep_num`) REFERENCES `entreprise` (`num_ep`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `commandes`
--
ALTER TABLE `commandes`
  ADD CONSTRAINT `commandes_ibfk_2` FOREIGN KEY (`repas_num`) REFERENCES `repas` (`num_repas`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `commandes_ibfk_3` FOREIGN KEY (`bss_num`) REFERENCES `boissons` (`num_bss`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `commandes_ibfk_4` FOREIGN KEY (`users_num`) REFERENCES `users` (`num_users`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `enregistrement`
--
ALTER TABLE `enregistrement`
  ADD CONSTRAINT `enregistrement_ibfk_1` FOREIGN KEY (`users_num`) REFERENCES `users` (`num_users`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `groupe_users`
--
ALTER TABLE `groupe_users`
  ADD CONSTRAINT `groupe_users_ibfk_1` FOREIGN KEY (`msg_num`) REFERENCES `message` (`num_msg`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `message`
--
ALTER TABLE `message`
  ADD CONSTRAINT `message_ibfk_1` FOREIGN KEY (`users_num`) REFERENCES `users` (`num_users`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `planning`
--
ALTER TABLE `planning`
  ADD CONSTRAINT `planning_ibfk_1` FOREIGN KEY (`ep_num`) REFERENCES `entreprise` (`num_ep`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `suggestion`
--
ALTER TABLE `suggestion`
  ADD CONSTRAINT `suggestion_ibfk_1` FOREIGN KEY (`users_num`) REFERENCES `users` (`num_users`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_ibfk_2` FOREIGN KEY (`bi_num`) REFERENCES `boite_interim` (`num_bi`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `users_ibfk_3` FOREIGN KEY (`droit_num`) REFERENCES `droit` (`num_droit`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `users_ibfk_4` FOREIGN KEY (`ep_num`) REFERENCES `entreprise` (`num_ep`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

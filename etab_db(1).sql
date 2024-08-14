-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : mer. 14 août 2024 à 09:39
-- Version du serveur : 10.4.21-MariaDB
-- Version de PHP : 7.3.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `etab_db`
--

DELIMITER $$
--
-- Procédures
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `AjouterEleve` (IN `p_classe` VARCHAR(50), IN `p_matricule` VARCHAR(50), IN `p_id_personne` INT)  BEGIN
    INSERT INTO Eleve (classe, matricule, id_personne)
    VALUES (p_classe, p_matricule, p_id_personne);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `AjouterProfesseur` (IN `p_vacant` BOOLEAN, IN `p_matieresEnseigne` VARCHAR(255), IN `p_prochainCours` VARCHAR(255), IN `p_sujetProchaineReunion` VARCHAR(255), IN `p_id_personne` INT)  BEGIN
    INSERT INTO Professeur (vacant, matieresEnseigne, prochainCours, sujetProchaineReunion, id_personne)
    VALUES (p_vacant, p_matieresEnseigne, p_prochainCours, p_sujetProchaineReunion, p_id_personne);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `ModifierEleve` (IN `p_id` INT, IN `p_classe` VARCHAR(50), IN `p_matricule` VARCHAR(50))  BEGIN
    UPDATE Eleve
    SET classe = p_classe,
        matricule = p_matricule
    WHERE id = p_id;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `ModifierProfesseur` (IN `p_id` INT, IN `p_vacant` BOOLEAN, IN `p_matieresEnseigne` VARCHAR(255), IN `p_prochainCours` VARCHAR(255), IN `p_sujetProchaineReunion` VARCHAR(255))  BEGIN
    UPDATE Professeur
    SET vacant = p_vacant,
        matieresEnseigne = p_matieresEnseigne,
        prochainCours = p_prochainCours,
        sujetProchaineReunion = p_sujetProchaineReunion
    WHERE id = p_id;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `ObtenirEleve` (IN `p_id` INT)  BEGIN
    SELECT * FROM Eleve WHERE id = p_id;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `ObtenirProfesseur` (IN `p_id` INT)  BEGIN
    SELECT * FROM Professeur WHERE id = p_id;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `SupprimerEleve` (IN `p_id` INT)  BEGIN
    DELETE FROM Eleve WHERE id = p_id;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `SupprimerProfesseur` (IN `p_id` INT)  BEGIN
    DELETE FROM Professeur WHERE id = p_id;
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Structure de la table `eleve`
--

CREATE TABLE `eleve` (
  `id` int(11) NOT NULL,
  `classe` varchar(50) NOT NULL,
  `matricule` varchar(50) NOT NULL,
  `id_personne` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `personne`
--

CREATE TABLE `personne` (
  `id` int(11) NOT NULL,
  `dateNaissance` date NOT NULL,
  `ville` varchar(100) NOT NULL,
  `prenom` varchar(100) NOT NULL,
  `nom` varchar(100) NOT NULL,
  `telephone` varchar(15) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `professeur`
--

CREATE TABLE `professeur` (
  `id` int(11) NOT NULL,
  `vacant` tinyint(1) NOT NULL,
  `matieresEnseigne` varchar(255) NOT NULL,
  `prochainCours` varchar(255) DEFAULT NULL,
  `sujetProchaineReunion` varchar(255) DEFAULT NULL,
  `id_personne` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `utilisateur`
--

CREATE TABLE `utilisateur` (
  `id` int(11) NOT NULL,
  `pseudo` varchar(50) NOT NULL,
  `motDePasse` varchar(255) NOT NULL,
  `dateCreation` date NOT NULL,
  `id_personne` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `utilisateur`
--

INSERT INTO `utilisateur` (`id`, `pseudo`, `motDePasse`, `dateCreation`, `id_personne`) VALUES
(4, 'admin', 'admin', '2024-08-13', 1);

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `eleve`
--
ALTER TABLE `eleve`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `matricule` (`matricule`),
  ADD KEY `id_personne` (`id_personne`);

--
-- Index pour la table `personne`
--
ALTER TABLE `personne`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `professeur`
--
ALTER TABLE `professeur`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_personne` (`id_personne`);

--
-- Index pour la table `utilisateur`
--
ALTER TABLE `utilisateur`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `pseudo` (`pseudo`),
  ADD KEY `id_personne` (`id_personne`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `eleve`
--
ALTER TABLE `eleve`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `personne`
--
ALTER TABLE `personne`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `professeur`
--
ALTER TABLE `professeur`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `utilisateur`
--
ALTER TABLE `utilisateur`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

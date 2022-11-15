-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Hôte : localhost:8889
-- Généré le : mar. 15 nov. 2022 à 14:51
-- Version du serveur :  5.7.34
-- Version de PHP : 8.0.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `Classe`
--

-- --------------------------------------------------------

--
-- Structure de la table `classes`
--

CREATE TABLE `classes` (
  `ID` int(11) NOT NULL,
  `classe` varchar(255) NOT NULL,
  `nb_eleve` int(11) NOT NULL,
  `id_ecole` int(11) NOT NULL,
  `id_prof` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


CREATE TABLE `ecole` (
  `ID` int(11) NOT NULL,
  `nom_ecole` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


CREATE TABLE `matiereprof` (
  `id_prof` int(11) NOT NULL,
  `id_matiere` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



CREATE TABLE `matieres` (
  `ID` int(11) NOT NULL,
  `nom_matiere` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


CREATE TABLE `prof` (
  `ID` int(11) NOT NULL,
  `nom` varchar(255) NOT NULL,
  `prenom` varchar(255) NOT NULL,
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


ALTER TABLE `classes`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `classe` (`classe`),
  ADD KEY `id_ecole` (`id_ecole`);


ALTER TABLE `ecole`
  ADD PRIMARY KEY (`ID`);


ALTER TABLE `matiereprof`
  ADD KEY `id_matiere` (`id_matiere`),
  ADD KEY `id_prof` (`id_prof`);


ALTER TABLE `matieres`
  ADD PRIMARY KEY (`ID`);


ALTER TABLE `prof`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `id_matiere` (`id_matiere`);


ALTER TABLE `classes`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;


ALTER TABLE `ecole`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;


ALTER TABLE `matieres`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;


ALTER TABLE `prof`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;


ALTER TABLE `classes`
  ADD CONSTRAINT `classes_ibfk_1` FOREIGN KEY (`id_ecole`) REFERENCES `ecole` (`ID`),
  ADD CONSTRAINT `classes_ibfk_2` FOREIGN KEY (`id_prof`) REFERENCES `prof` (`ID`);


ALTER TABLE `matiereprof`
  ADD CONSTRAINT `matiereprof_ibfk_1` FOREIGN KEY (`id_prof`) REFERENCES `prof` (`ID`),
  ADD CONSTRAINT `matiereprof_ibfk_2` FOREIGN KEY (`id_matiere`) REFERENCES `matieres` (`ID`);


ALTER TABLE `prof`
  ADD CONSTRAINT `prof_ibfk_1` FOREIGN KEY (`id_classe`) REFERENCES `classes` (`ID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Hôte : localhost:3306
-- Généré le : ven. 06 août 2021 à 18:22
-- Version du serveur :  5.7.24
-- Version de PHP : 7.2.19

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `db_eureka_wenze`
--

DELIMITER $$
--
-- Procédures
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `addRateProduct` (IN `idProduct` INT(11))  BEGIN

       SET @v1 := ( SELECT rate_product FROM t_product WHERE id_product = idProduct);
       UPDATE t_product SET  rate_product=@v1+1 where id_product=idproduct;
     
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `addUser` (IN `name` VARCHAR(100), IN `lastname` VARCHAR(100), IN `address` VARCHAR(100), IN `phone` VARCHAR(100), IN `email` VARCHAR(100), IN `password` VARCHAR(255))  NO SQL
INSERT INTO `t_user`(`name_user`, `lastname_user`, `address_user`, `phone_user`, `email_user`, `password_user`) VALUES (name,lastname,address,phone,email,password)$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `deleteAllCart` ()  NO SQL
TRUNCATE `t_cart`$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `deleteAllProduct` ()  NO SQL
TRUNCATE `t_product`$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `deleteAllUser` ()  NO SQL
TRUNCATE `t_user`$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `deleteOneCart` (IN `id` INT)  NO SQL
DELETE FROM `t_cart` WHERE `id_cart`=id$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `deleteOneProduct` (IN `id` INT)  NO SQL
DELETE FROM `t_product` WHERE `id_product`=id$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `deleteOneUser` (IN `id` INT)  NO SQL
DELETE FROM `t_user` WHERE `id_user`=id$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `detailProduct` (IN `idProduct` INT)  NO SQL
SELECT * FROM `t_product` WHERE `id_product`=idProduct$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `proc_save_cart` (IN `fkuser` INT, IN `fkproduct` INT, IN `qte` INT, IN `pt` INT)  NO SQL
INSERT INTO `t_cart`(`fk_user`, `fk_product`, `qte_cart`, `pt_cart`) VALUES (fkuser,fkproduct,qte,pt)$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `proc_save_product` (IN `name` VARCHAR(150), IN `price` VARCHAR(50), IN `image` VARCHAR(255), IN `userfk` VARCHAR(255))  NO SQL
INSERT INTO `t_product`(`id_product`, `name_product`, `price_product`, `image_product`,`id_user_create`) VALUES (null,name,price,image,userfk)$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `proc_save_user` (IN `name` VARCHAR(100), IN `lastname` VARCHAR(100), IN `address` VARCHAR(255), IN `phone` VARCHAR(50), IN `email` VARCHAR(100), IN `password` VARCHAR(255))  NO SQL
INSERT INTO `t_user`(`id_user`, `name_user`, `lastname_user`, `address_user`, `phone_user`, `email_user`, `password_user`) VALUES (null,name, lastname,address,phone,email,password)$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `removeRateProduct` (IN `idProduct` INT)  NO SQL
BEGIN

       SET @v1 := ( SELECT rate_product FROM t_product WHERE id_product = idProduct);
       UPDATE t_product SET  rate_product=@v1-1 where id_product=idProduct;
     
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Doublure de structure pour la vue `listproduct`
-- (Voir ci-dessous la vue réelle)
--
CREATE TABLE `listproduct` (
`id_product` int(11)
,`name_product` varchar(255)
,`price_product` varchar(100)
,`fk_category` int(11)
,`rate_product` int(11)
,`image_product` varchar(255)
,`date_saved_product` datetime
,`date_update_product` datetime
,`fk_user_created` int(11)
,`id_category` int(11)
,`name_category` varchar(100)
,`commentaire_category` varchar(255)
);

-- --------------------------------------------------------

--
-- Doublure de structure pour la vue `total_cart`
-- (Voir ci-dessous la vue réelle)
--
CREATE TABLE `total_cart` (
`nb_cart` bigint(21)
);

-- --------------------------------------------------------

--
-- Doublure de structure pour la vue `total_product`
-- (Voir ci-dessous la vue réelle)
--
CREATE TABLE `total_product` (
`nb_product` bigint(21)
);

-- --------------------------------------------------------

--
-- Doublure de structure pour la vue `total_user`
-- (Voir ci-dessous la vue réelle)
--
CREATE TABLE `total_user` (
`nb_user` bigint(21)
);

-- --------------------------------------------------------

--
-- Structure de la table `t_cart`
--

CREATE TABLE `t_cart` (
  `id_cart` int(11) NOT NULL,
  `fk_user` int(11) NOT NULL,
  `fk_product` int(11) NOT NULL,
  `qte_cart` int(11) NOT NULL,
  `pt_cart` int(11) NOT NULL,
  `date_saved` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `date_deliver` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `t_cart`
--

INSERT INTO `t_cart` (`id_cart`, `fk_user`, `fk_product`, `qte_cart`, `pt_cart`, `date_saved`, `date_deliver`) VALUES
(1, 2, 1, 5, 2000, '2020-12-22 14:06:25', NULL);

-- --------------------------------------------------------

--
-- Structure de la table `t_category`
--

CREATE TABLE `t_category` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `commentaire` varchar(255) DEFAULT NULL,
  `imgCat` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `t_category`
--

INSERT INTO `t_category` (`id`, `name`, `commentaire`, `imgCat`) VALUES
(1, 'Electronique', 'tous composant informatique', 'assets/categorie/electronique.png'),
(2, 'Chaussure', ' ', 'assets/categorie/chaussure.png'),
(3, 'Vetement', ' ', 'assets/categorie/vetement.png'),
(4, 'Meuble', ' ', 'assets/categorie/meuble.png'),
(5, 'Voiture', NULL, 'assets/categorie/car.png');

-- --------------------------------------------------------

--
-- Structure de la table `t_product`
--

CREATE TABLE `t_product` (
  `id_product` int(11) NOT NULL,
  `name_product` varchar(255) NOT NULL,
  `price_product` varchar(100) NOT NULL,
  `category` int(11) DEFAULT NULL,
  `rate_product` int(11) NOT NULL DEFAULT '0',
  `image_product` varchar(255) DEFAULT NULL,
  `date_saved` datetime DEFAULT CURRENT_TIMESTAMP,
  `date_update` datetime DEFAULT CURRENT_TIMESTAMP,
  `id_user_create` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `t_product`
--

INSERT INTO `t_product` (`id_product`, `name_product`, `price_product`, `category`, `rate_product`, `image_product`, `date_saved`, `date_update`, `id_user_create`) VALUES
(1, 'casque', '2500', 2, 6, 'assets/last/casque.png', '2020-12-22 14:28:24', '2020-12-22 14:28:24', 1),
(2, 'jeans', '5000', 5, 1, 'assets/last/jeans.png', '2020-12-23 13:27:24', '2020-12-23 13:27:24', 1),
(3, 'phone', '50000', 5, 0, 'assets/last/phone.png', '2020-12-23 13:27:34', '2020-12-23 13:27:34', 1),
(4, 'sac', '1500', 3, 0, 'assets/last/sac.png', '2020-12-23 13:27:41', '2021-01-05 20:46:09', 1),
(5, 'soulier', '500', 1, 0, 'assets/last/soulier.png', '2020-12-23 14:01:13', '2020-12-23 14:01:13', 1);

-- --------------------------------------------------------

--
-- Structure de la table `t_user`
--

CREATE TABLE `t_user` (
  `id_user` int(11) NOT NULL,
  `name_user` varchar(100) NOT NULL,
  `lastname_user` varchar(100) NOT NULL,
  `address_user` varchar(255) NOT NULL,
  `phone_user` varchar(50) NOT NULL,
  `email_user` varchar(100) NOT NULL,
  `password_user` longtext NOT NULL,
  `image_user` varchar(255) DEFAULT NULL,
  `role_user` int(11) DEFAULT '0',
  `date_saved` datetime DEFAULT CURRENT_TIMESTAMP,
  `date_update` datetime DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `t_user`
--

INSERT INTO `t_user` (`id_user`, `name_user`, `lastname_user`, `address_user`, `phone_user`, `email_user`, `password_user`, `image_user`, `role_user`, `date_saved`, `date_update`) VALUES
(5, 'ngbowa', 'ezechiel', 'ngbowa', 'ezechiel', 'a@gmail.com', 'ezechiel', NULL, 0, '2020-12-29 15:31:01', '2020-12-29 15:31:01'),
(6, 'jessy', 'miller', 'jessy', 'miller', 'miller@gmail.com', 'miller', NULL, 0, '2021-01-06 10:57:54', '2021-01-06 10:57:54'),
(7, 'miller', 'jessuy', 'miller', 'jessuy', 'miller@gmail.xom', 'jessuy', NULL, 0, '2021-01-06 11:08:02', '2021-01-06 11:08:02'),
(8, 'miller', 'jessuy', 'miller', 'jessuy', 'miller@gmail.co', 'jessuy', NULL, 0, '2021-01-06 11:18:15', '2021-01-06 11:18:15');

-- --------------------------------------------------------

--
-- Doublure de structure pour la vue `userinfos`
-- (Voir ci-dessous la vue réelle)
--
CREATE TABLE `userinfos` (
`name_user` varchar(100)
,`lastname_user` varchar(100)
,`address_user` varchar(255)
,`phone_user` varchar(50)
,`email_user` varchar(100)
,`role_user` int(11)
,`date_saved_user` datetime
,`date_update_user` datetime
,`pk_user` int(11)
,`name_product` varchar(255)
,`price_product` varchar(100)
,`rate_product` int(11)
,`image_product` varchar(255)
,`date_saved_product` datetime
,`date_update_product` datetime
,`fk_user_create` int(11)
,`pk_product` int(11)
,`pk_cart` int(11)
,`qte_cart` int(11)
,`total_cart` int(11)
);

-- --------------------------------------------------------

--
-- Structure de la vue `listproduct`
--
DROP TABLE IF EXISTS `listproduct`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `listproduct`  AS SELECT `t_product`.`id_product` AS `id_product`, `t_product`.`name_product` AS `name_product`, `t_product`.`price_product` AS `price_product`, `t_product`.`category` AS `fk_category`, `t_product`.`rate_product` AS `rate_product`, `t_product`.`image_product` AS `image_product`, `t_product`.`date_saved` AS `date_saved_product`, `t_product`.`date_update` AS `date_update_product`, `t_product`.`id_user_create` AS `fk_user_created`, `t_category`.`id` AS `id_category`, `t_category`.`name` AS `name_category`, `t_category`.`commentaire` AS `commentaire_category` FROM (`t_product` join `t_category`) WHERE (`t_product`.`category` = `t_category`.`id`) ;

-- --------------------------------------------------------

--
-- Structure de la vue `total_cart`
--
DROP TABLE IF EXISTS `total_cart`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `total_cart`  AS SELECT count(0) AS `nb_cart` FROM `t_cart` ;

-- --------------------------------------------------------

--
-- Structure de la vue `total_product`
--
DROP TABLE IF EXISTS `total_product`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `total_product`  AS SELECT count(0) AS `nb_product` FROM `t_product` ;

-- --------------------------------------------------------

--
-- Structure de la vue `total_user`
--
DROP TABLE IF EXISTS `total_user`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `total_user`  AS SELECT count(0) AS `nb_user` FROM `t_user` ;

-- --------------------------------------------------------

--
-- Structure de la vue `userinfos`
--
DROP TABLE IF EXISTS `userinfos`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `userinfos`  AS SELECT `t_user`.`name_user` AS `name_user`, `t_user`.`lastname_user` AS `lastname_user`, `t_user`.`address_user` AS `address_user`, `t_user`.`phone_user` AS `phone_user`, `t_user`.`email_user` AS `email_user`, `t_user`.`role_user` AS `role_user`, `t_user`.`date_saved` AS `date_saved_user`, `t_user`.`date_update` AS `date_update_user`, `t_user`.`id_user` AS `pk_user`, `t_product`.`name_product` AS `name_product`, `t_product`.`price_product` AS `price_product`, `t_product`.`rate_product` AS `rate_product`, `t_product`.`image_product` AS `image_product`, `t_product`.`date_saved` AS `date_saved_product`, `t_product`.`date_update` AS `date_update_product`, `t_product`.`id_user_create` AS `fk_user_create`, `t_product`.`id_product` AS `pk_product`, `t_cart`.`id_cart` AS `pk_cart`, `t_cart`.`qte_cart` AS `qte_cart`, `t_cart`.`pt_cart` AS `total_cart` FROM ((`t_user` join `t_product`) join `t_cart`) WHERE ((`t_user`.`id_user` = `t_cart`.`fk_user`) AND (`t_product`.`id_product` = `t_cart`.`fk_product`)) ;

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `t_cart`
--
ALTER TABLE `t_cart`
  ADD PRIMARY KEY (`id_cart`);

--
-- Index pour la table `t_category`
--
ALTER TABLE `t_category`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `t_product`
--
ALTER TABLE `t_product`
  ADD PRIMARY KEY (`id_product`);

--
-- Index pour la table `t_user`
--
ALTER TABLE `t_user`
  ADD PRIMARY KEY (`id_user`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `t_cart`
--
ALTER TABLE `t_cart`
  MODIFY `id_cart` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT pour la table `t_category`
--
ALTER TABLE `t_category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT pour la table `t_product`
--
ALTER TABLE `t_product`
  MODIFY `id_product` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT pour la table `t_user`
--
ALTER TABLE `t_user`
  MODIFY `id_user` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

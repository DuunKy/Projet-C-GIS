-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : mar. 14 nov. 2023 à 15:16
-- Version du serveur : 10.4.28-MariaDB
-- Version de PHP : 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `mydatabase77`
--

-- --------------------------------------------------------

--
-- Structure de la table `addresses`
--

CREATE TABLE `addresses` (
  `Address_Address` varchar(80) NOT NULL,
  `Address_CityName` varchar(80) NOT NULL,
  `Address_PostalCode` int(11) NOT NULL,
  `Address_State` varchar(80) DEFAULT NULL,
  `Address_Country` varchar(80) DEFAULT NULL,
  `User_Id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `addresses`
--

INSERT INTO `addresses` (`Address_Address`, `Address_CityName`, `Address_PostalCode`, `Address_State`, `Address_Country`, `User_Id`) VALUES
('495 Celine Forge Apt. 691\nNorth Ted, WY 70376', 'Ernserside', 91018, 'New Mexico', 'Seychelles', 1),
('40258 Kozey Crest Suite 089\nAgustinashire, WI 49922-1515', 'New Orvalville', 8807, 'New York', 'Liechtenstein', 2),
('485 Esteban Lake Apt. 427\nHuelsfurt, OK 04307', 'Vickiechester', 80628, 'South Carolina', 'Malta', 3),
('6485 Gregg Passage\nEast Jaren, NJ 41140', 'Littelton', 26774, 'New Jersey', 'Switzerland', 4),
('74561 Roman Shores Suite 888\nLake Kenshire, NV 01741', 'Darwinstad', 49858, 'Arizona', 'Sudan', 5),
('42574 Lorena Crossing Suite 816\nDeanland, MN 84647-9360', 'Camdenborough', 25603, 'Florida', 'Uzbekistan', 6),
('1974 Destiney Valleys\nBergnaumfurt, GA 12587', 'Rogahnfort', 49829, 'Missouri', 'Montenegro', 7),
('2952 Lolita Camp\nSusanatown, TN 84602-0511', 'Dickinsonfort', 19356, 'Georgia', 'Cape Verde', 8),
('37039 Wisozk Mission Suite 517\nPort Norristown, MS 53578', 'Kristoferborough', 53899, 'Ohio', 'Mauritius', 9),
('24346 Torp Corner Apt. 022\nHudsonbury, CA 74402', 'Reginaldburgh', 34723, 'Pennsylvania', 'Suriname', 10);

-- --------------------------------------------------------

--
-- Structure de la table `carts`
--

CREATE TABLE `carts` (
  `Shoplist_Id` int(11) DEFAULT NULL,
  `Product_Id` int(11) DEFAULT NULL,
  `Cart_Total` int(11) NOT NULL,
  `Cart_ProductCount` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `carts`
--

INSERT INTO `carts` (`Shoplist_Id`, `Product_Id`, `Cart_Total`, `Cart_ProductCount`) VALUES
(1, 1, 221, 7),
(1, 1, 117, 23),
(1, 3, 61, 14),
(4, 4, 105, 16),
(4, 2, 330, 17),
(1, 6, 349, 7),
(1, 7, 36, 22),
(1, 3, 358, 6),
(7, 1, 447, 6),
(10, 4, 50, 33);

-- --------------------------------------------------------

--
-- Structure de la table `commands`
--

CREATE TABLE `commands` (
  `Command_Id` int(11) NOT NULL,
  `Shoplist_Id` int(11) DEFAULT NULL,
  `Command_OrderDate` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `commands`
--

INSERT INTO `commands` (`Command_Id`, `Shoplist_Id`, `Command_OrderDate`) VALUES
(1, 1, '1983-05-21'),
(2, 2, '2017-06-11'),
(3, 3, '1979-05-13'),
(4, 4, '2011-04-23'),
(5, 5, '2021-01-18'),
(6, 6, '2003-07-06'),
(7, 7, '1970-01-12'),
(8, 8, '1983-12-27'),
(9, 9, '1992-02-25'),
(10, 10, '2001-11-10');

-- --------------------------------------------------------

--
-- Structure de la table `invoices`
--

CREATE TABLE `invoices` (
  `Invoices_Id` int(11) NOT NULL,
  `Command_Id` int(11) DEFAULT NULL,
  `Invoice_Date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `invoices`
--

INSERT INTO `invoices` (`Invoices_Id`, `Command_Id`, `Invoice_Date`) VALUES
(1, 1, '1984-11-02'),
(2, 2, '1998-10-27'),
(3, 3, '2018-11-15'),
(4, 4, '2010-07-01'),
(5, 5, '2010-03-11'),
(6, 6, '2020-02-17'),
(7, 7, '1972-07-23'),
(8, 8, '1971-12-23'),
(9, 9, '1987-10-11'),
(10, 10, '2001-02-14');

-- --------------------------------------------------------

--
-- Structure de la table `payements`
--

CREATE TABLE `payements` (
  `User_Id` int(11) DEFAULT NULL,
  `Payement_CartNumber` int(11) NOT NULL,
  `Payement_ExpirationDate` date NOT NULL,
  `Payement_Name` varchar(80) NOT NULL,
  `Payement_SafeCode` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `payements`
--

INSERT INTO `payements` (`User_Id`, `Payement_CartNumber`, `Payement_ExpirationDate`, `Payement_Name`, `Payement_SafeCode`) VALUES
(1, 79539, '2018-03-21', 'Ortiz', 79642164),
(2, 79673, '2010-01-14', 'Rogahn', 170078),
(3, 12774794, '2004-09-03', 'Armstrong', 78895),
(4, 97488946, '1975-03-28', 'Mosciski', 4979799),
(5, 8119, '1972-11-15', 'Bartoletti', 1113303),
(6, 79, '1992-09-13', 'Krajcik', 57254885),
(7, 858, '1973-12-27', 'Skiles', 7999519),
(8, 0, '1994-07-12', 'Connelly', 8),
(9, 187653, '2019-09-21', 'Sanford', 832),
(10, 315428, '2014-06-12', 'Feil', 3776);

-- --------------------------------------------------------

--
-- Structure de la table `photos`
--

CREATE TABLE `photos` (
  `User_Id` int(11) DEFAULT NULL,
  `Product_Id` int(11) DEFAULT NULL,
  `Photo_Photo` varchar(80) NOT NULL,
  `Photo_Id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `photos`
--

INSERT INTO `photos` (`User_Id`, `Product_Id`, `Photo_Photo`, `Photo_Id`) VALUES
(1, NULL, 'South Eldora.jpeg', 1),
(NULL, 1, 'New Delphine.jpeg', 2),
(NULL, 3, 'East Tyriquemouth.jpeg', 3),
(1, NULL, 'Cecileport.jpeg', 4),
(NULL, 2, 'West Noble.jpeg', 5),
(3, NULL, 'Aidenhaven.jpeg', 6),
(NULL, 7, 'Lake Shaunberg.jpeg', 7),
(7, NULL, 'New Ursulahaven.jpeg', 8),
(5, NULL, 'North Newell.jpeg', 9),
(3, NULL, 'North Tyrelborough.jpeg', 10);

-- --------------------------------------------------------

--
-- Structure de la table `products`
--

CREATE TABLE `products` (
  `Product_Id` int(11) NOT NULL,
  `Product_Name` varchar(80) NOT NULL,
  `Product_Description` varchar(120) NOT NULL,
  `Product_Type` varchar(80) NOT NULL,
  `Product_Price` int(11) NOT NULL,
  `Product_NumberLeft` int(11) NOT NULL,
  `Product_TotalRate` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `products`
--

INSERT INTO `products` (`Product_Id`, `Product_Name`, `Product_Description`, `Product_Type`, `Product_Price`, `Product_NumberLeft`, `Product_TotalRate`) VALUES
(1, 'beer', 'Voluptatem iure magni sed nam et nulla. Nisi reprehenderit ipsum est esse. Mollitia nostrum earum velit qui id corporis ', 'PaleVioletRed', 808669476, 830472, 5),
(2, 'thiel', 'Tempora voluptatem nobis maiores nam quae. Vitae quibusdam fugit culpa esse. Minima animi error eaque accusantium et exc', 'Peru', 39, 16587062, 4),
(3, 'denesik', 'Maiores dignissimos sint sequi molestiae numquam numquam laboriosam. Nobis harum commodi sunt nostrum sint iusto. Volupt', 'LightSteelBlue', 0, 865383, 3),
(4, 'greenholt', 'Et deserunt quod non nostrum aperiam. Voluptates ad nisi placeat non doloremque repellendus iure. Eum sapiente sint vel ', 'DodgerBlue', 812, 14363, 1),
(5, 'rempel', 'Cumque dolor veritatis quae consequatur eius illum. Sapiente velit explicabo dolor facere consequatur. Quis quod quia re', 'Maroon', 56156635, 86, 0),
(6, 'frami', 'Illum voluptas consequatur et velit sit. Voluptatem et asperiores ullam labore ea. Consequatur consequatur voluptatem es', 'PowderBlue', 17013, 45012, 5),
(7, 'marquardt', 'Consectetur accusantium quia nobis sed. Pariatur non et dolores soluta. Tenetur quaerat optio quae perspiciatis. Corpori', 'LightCyan', 9, 915961461, 3),
(8, 'roberts', 'Omnis sequi laboriosam quo unde dolores. Rerum ut assumenda quod sint eos. Non id quibusdam explicabo placeat.', 'Gold', 6032, 277698926, 0),
(9, 'gusikowski', 'Est illo rem quaerat quis suscipit voluptatem eaque eaque. Sunt ipsa est ut et pariatur aut ullam. At maiores qui quis n', 'LightSkyBlue', 2665, 412007354, 4),
(10, 'reichel', 'Sit alias minus rem perferendis nihil dignissimos fugiat numquam. Voluptas natus vel fuga non. Et illo numquam dicta err', 'LightGray', 67009, 77733, 5);

-- --------------------------------------------------------

--
-- Structure de la table `rates`
--

CREATE TABLE `rates` (
  `Rate_Rate` int(11) NOT NULL,
  `User_Id` int(11) DEFAULT NULL,
  `Product_Id` int(11) DEFAULT NULL,
  `Rate_Id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `rates`
--

INSERT INTO `rates` (`Rate_Rate`, `User_Id`, `Product_Id`, `Rate_Id`) VALUES
(4, 1, 1, 1),
(1, 1, 1, 2),
(5, 2, 3, 3),
(1, 1, 4, 4),
(4, 5, 2, 5),
(3, 3, 6, 6),
(4, 2, 7, 7),
(1, 7, 3, 8),
(2, 5, 1, 9),
(4, 3, 4, 10);

-- --------------------------------------------------------

--
-- Structure de la table `shoplists`
--

CREATE TABLE `shoplists` (
  `Shoplist_Id` int(11) NOT NULL,
  `User_Id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `shoplists`
--

INSERT INTO `shoplists` (`Shoplist_Id`, `User_Id`) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5),
(6, 6),
(7, 7),
(8, 8),
(9, 9),
(10, 10);

-- --------------------------------------------------------

--
-- Structure de la table `users`
--

CREATE TABLE `users` (
  `User_Id` int(11) NOT NULL,
  `User_FirstName` varchar(80) NOT NULL,
  `User_LastName` varchar(80) NOT NULL,
  `User_Email` varchar(80) NOT NULL,
  `User_Password` varchar(80) NOT NULL,
  `User_Phone` varchar(80) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `users`
--

INSERT INTO `users` (`User_Id`, `User_FirstName`, `User_LastName`, `User_Email`, `User_Password`, `User_Phone`) VALUES
(1, 'Kale', 'Farrell', 'kling.kenneth@kilback.com', 'v9kEF&JrX@<*4X', '+1 (952) 367-0147'),
(2, 'Bryce', 'Koelpin', 'ibogisich@schowalter.net', 'lagnqd>`+{~C&kw', '407.570.5610'),
(3, 'Catherine', 'Stroman', 'queenie05@wisozk.com', 'ah.+hJ]<m', '(386) 501-5060'),
(4, 'Burnice', 'Hessel', 'destin96@blick.com', 'mE\"LSA', '434.784.9960'),
(5, 'Lacy', 'Hegmann', 'vlueilwitz@yahoo.com', 'hA#jIK<4lgv]$)$d', '1-786-893-6824'),
(6, 'Bennie', 'Baumbach', 'maximillia26@hotmail.com', '0A`^iDTva', '+1-914-234-8198'),
(7, 'Sydnie', 'Gottlieb', 'cordelia.runolfsdottir@larson.com', '{r%Ss.*^njWjz>_e)x', '+1-364-383-8180'),
(8, 'Leone', 'Nikolaus', 'dickinson.sylvia@yahoo.com', '+vs\"-a.n|', '(360) 242-5232'),
(9, 'Rickie', 'Berge', 'bogisich.jennyfer@von.net', 'G2\"o8~VJu?<4.Ot', '+17476684440'),
(10, 'Cielo', 'Kuvalis', 'rosanna94@gleason.com', 'uS04yS?g2Z*x', '(820) 812-8297');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `addresses`
--
ALTER TABLE `addresses`
  ADD KEY `Fk_User_Id` (`User_Id`);

--
-- Index pour la table `carts`
--
ALTER TABLE `carts`
  ADD KEY `Shoplist_Id` (`Shoplist_Id`),
  ADD KEY `Product_Id` (`Product_Id`);

--
-- Index pour la table `commands`
--
ALTER TABLE `commands`
  ADD PRIMARY KEY (`Command_Id`),
  ADD KEY `Shoplist_Id` (`Shoplist_Id`);

--
-- Index pour la table `invoices`
--
ALTER TABLE `invoices`
  ADD PRIMARY KEY (`Invoices_Id`),
  ADD KEY `Command_Id` (`Command_Id`);

--
-- Index pour la table `payements`
--
ALTER TABLE `payements`
  ADD KEY `User_Id` (`User_Id`);

--
-- Index pour la table `photos`
--
ALTER TABLE `photos`
  ADD PRIMARY KEY (`Photo_Id`),
  ADD KEY `User_Id` (`User_Id`),
  ADD KEY `Product_Id` (`Product_Id`);

--
-- Index pour la table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`Product_Id`);

--
-- Index pour la table `rates`
--
ALTER TABLE `rates`
  ADD PRIMARY KEY (`Rate_Id`),
  ADD KEY `User_Id` (`User_Id`),
  ADD KEY `Product_Id` (`Product_Id`);

--
-- Index pour la table `shoplists`
--
ALTER TABLE `shoplists`
  ADD PRIMARY KEY (`Shoplist_Id`),
  ADD KEY `User_Id` (`User_Id`);

--
-- Index pour la table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`User_Id`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `commands`
--
ALTER TABLE `commands`
  MODIFY `Command_Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT pour la table `invoices`
--
ALTER TABLE `invoices`
  MODIFY `Invoices_Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT pour la table `photos`
--
ALTER TABLE `photos`
  MODIFY `Photo_Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT pour la table `products`
--
ALTER TABLE `products`
  MODIFY `Product_Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT pour la table `rates`
--
ALTER TABLE `rates`
  MODIFY `Rate_Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT pour la table `shoplists`
--
ALTER TABLE `shoplists`
  MODIFY `Shoplist_Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT pour la table `users`
--
ALTER TABLE `users`
  MODIFY `User_Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `addresses`
--
ALTER TABLE `addresses`
  ADD CONSTRAINT `Fk_User_Id` FOREIGN KEY (`User_Id`) REFERENCES `users` (`User_Id`);

--
-- Contraintes pour la table `carts`
--
ALTER TABLE `carts`
  ADD CONSTRAINT `carts_ibfk_1` FOREIGN KEY (`Shoplist_Id`) REFERENCES `shoplists` (`Shoplist_Id`),
  ADD CONSTRAINT `carts_ibfk_2` FOREIGN KEY (`Product_Id`) REFERENCES `products` (`Product_Id`);

--
-- Contraintes pour la table `commands`
--
ALTER TABLE `commands`
  ADD CONSTRAINT `commands_ibfk_1` FOREIGN KEY (`Shoplist_Id`) REFERENCES `shoplists` (`Shoplist_Id`);

--
-- Contraintes pour la table `invoices`
--
ALTER TABLE `invoices`
  ADD CONSTRAINT `invoices_ibfk_1` FOREIGN KEY (`Command_Id`) REFERENCES `commands` (`Command_Id`);

--
-- Contraintes pour la table `payements`
--
ALTER TABLE `payements`
  ADD CONSTRAINT `payements_ibfk_1` FOREIGN KEY (`User_Id`) REFERENCES `users` (`User_Id`);

--
-- Contraintes pour la table `photos`
--
ALTER TABLE `photos`
  ADD CONSTRAINT `photos_ibfk_1` FOREIGN KEY (`User_Id`) REFERENCES `users` (`User_Id`),
  ADD CONSTRAINT `photos_ibfk_2` FOREIGN KEY (`Product_Id`) REFERENCES `products` (`Product_Id`);

--
-- Contraintes pour la table `rates`
--
ALTER TABLE `rates`
  ADD CONSTRAINT `rates_ibfk_1` FOREIGN KEY (`User_Id`) REFERENCES `users` (`User_Id`),
  ADD CONSTRAINT `rates_ibfk_2` FOREIGN KEY (`Product_Id`) REFERENCES `products` (`Product_Id`);

--
-- Contraintes pour la table `shoplists`
--
ALTER TABLE `shoplists`
  ADD CONSTRAINT `shoplists_ibfk_1` FOREIGN KEY (`User_Id`) REFERENCES `users` (`User_Id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

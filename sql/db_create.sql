-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Mar 14, 2023 at 08:24 AM
-- Server version: 10.4.17-MariaDB
-- PHP Version: 8.0.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ProjectDB`
--
CREATE DATABASE IF NOT EXISTS `ProjectDB` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `ProjectDB`;

-- --------------------------------------------------------

--
-- Table structure for table `Item`
--

CREATE TABLE `Item` (
  `itemID` int(11) NOT NULL,
  `supplierID` varchar(50) NOT NULL,
  `itemName` varchar(255) NOT NULL,
  `ImageFile` varchar(50) NOT NULL,
  `itemDescription` text DEFAULT NULL,
  `stockItemQty` int(11) NOT NULL DEFAULT 0,
  `price` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `Item`
--

INSERT INTO `Item` (`itemID`, `supplierID`, `itemName`, `ImageFile`, `itemDescription`, `stockItemQty`, `price`) VALUES
(1, 's001', 'Local Potato (1 pc)', '1.png', 'The potato is a starchy food, a tuber of the plant Solanum tuberosum and is a root vegetable native to the Americas. The plant is a perennial in the nightshade family Solanaceae.', 5000, 16),
(2, 's001', 'Australia Carrot (1 pc)', '2.png', 'The carrot (Daucus carota subsp. sativus) is a root vegetable, typically orange in color, though purple, black, red, white, and yellow cultivars exist, all of which are domesticated forms of the wild carrot, Daucus carota, native to Europe and Southwestern Asia. The plant probably originated in Persia and was originally cultivated for its leaves and seeds. The most commonly eaten part of the plant is the taproot, although the stems and leaves are also eaten. The domestic carrot has been selectively bred for its enlarged, more palatable, less woody-textured taproot.', 800, 25),
(3, 's002', 'Red Apple (1 pc)', '3.png', 'An apple is an edible fruit produced by an apple tree (Malus domestica). Apple trees are cultivated worldwide and are the most widely grown species in the genus Malus. The tree originated in Central Asia, where its wild ancestor, Malus sieversii, is still found today. Apples have been grown for thousands of years in Asia and Europe and were brought to North America by European colonists. Apples have religious and mythological significance in many cultures, including Norse, Greek, and European Christian tradition.', 2000, 6),
(4, 's003', 'Red Apple (3 pcs)', '4.png', 'Apples grown from seed tend to be very different from those of their parents, and the resultant fruit frequently lacks desired characteristics. Generally, apple cultivars are propagated by clonal grafting onto rootstocks. Apple trees grown without rootstocks tend to be larger and much slower to fruit after planting. Rootstocks are used to control the speed of growth and the size of the resulting tree, allowing for easier harvesting.', 2500, 15),
(5, 's003', 'Orange (1 pc)', '5.png', 'An orange is a fruit of various citrus species in the family Rutaceae (see list of plants known as orange); it primarily refers to Citrus × sinensis, which is also called sweet orange, to distinguish it from the related Citrus × aurantium, referred to as bitter orange. The sweet orange reproduces asexually (apomixis through nucellar embryony); varieties of sweet orange arise through mutations.', 2300, 8),
(6, 's002', 'Mango (2 pcs)', '6.png', 'A mango is an edible stone fruit produced by the tropical tree Mangifera indica. It is believed to have originated between northwestern Myanmar, Bangladesh, and northeastern India. M. indica has been cultivated in South and Southeast Asia since ancient times resulting in two types of modern mango cultivars: the \"Indian type\" and the \"Southeast Asian type\". Other species in the genus Mangifera also produce edible fruits that are also called \"mangoes\", the majority of which are found in the Malesian ecoregion.', 1000, 52),
(7, 's002', 'Lemon (1 pc)', '7.png', 'The lemon (Citrus limon) is a species of small evergreen trees in the flowering plant family Rutaceae, native to Asia, primarily Northeast India (Assam), Northern Myanmar or China.', 0, 5);

-- --------------------------------------------------------

--
-- Table structure for table `Orders`
--

CREATE TABLE `Orders` (
  `orderID` int(11) NOT NULL,
  `purchaseManagerID` varchar(50) NOT NULL,
  `orderDateTime` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `deliveryAddress` varchar(255) NOT NULL,
  `deliveryDate` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `Orders`
--

INSERT INTO `Orders` (`orderID`, `purchaseManagerID`, `orderDateTime`, `deliveryAddress`, `deliveryDate`) VALUES
(1, 'p001', '2023-03-24 13:12:13', 'Unit 4015/Fl. Silvercord Tower 230 Canton Road', '2023-09-18'),
(2, 'p001', '2023-04-10 14:10:20', 'Flat 8, Chates Farm Court, John Street, Hong Kong', '2023-01-15'),
(3, 'p002', '2023-04-12 14:10:20', '39 Cadogan St Kennedy Town, Central And Western District', '0000-00-00');

-- --------------------------------------------------------

--
-- Table structure for table `OrdersItem`
--

CREATE TABLE `OrdersItem` (
  `orderID` int(11) NOT NULL,
  `itemID` int(11) NOT NULL,
  `orderQty` int(5) NOT NULL,
  `itemPrice` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `OrdersItem`
--

INSERT INTO `OrdersItem` (`orderID`, `itemID`, `orderQty`, `itemPrice`) VALUES
(1, 1, 100, 16),
(1, 2, 150, 25),
(2, 3, 100, 6),
(3, 5, 100, 8),
(3, 6, 200, 52);

-- --------------------------------------------------------

--
-- Table structure for table `PurchaseManager`
--

CREATE TABLE `PurchaseManager` (
  `purchaseManagerID` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `managerName` varchar(100) NOT NULL,
  `contactNumber` varchar(30) NOT NULL,
  `warehouseAddress` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `PurchaseManager`
--

INSERT INTO `PurchaseManager` (`purchaseManagerID`, `password`, `managerName`, `contactNumber`, `warehouseAddress`) VALUES
('p001', 'p123', 'Chan Tai Man', '23942912', 'Unit 4015/Fl. Silvercord Tower 230 Canton Road'),
('p002', 'p123', 'Wong Ka Ho', '94857463', '39 Cadogan St Kennedy Town, Central And Western District'),
('p003', 'p123', 'Chan ka Chung', '34731832', '303 Lockhart Rd, Wan Chai');

-- --------------------------------------------------------

--
-- Table structure for table `Supplier`
--

CREATE TABLE `Supplier` (
  `supplierID` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `companyName` varchar(100) NOT NULL,
  `contactName` varchar(100) NOT NULL,
  `contactNumber` varchar(30) NOT NULL,
  `address` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `Supplier`
--

INSERT INTO `Supplier` (`supplierID`, `password`, `companyName`, `contactName`, `contactNumber`, `address`) VALUES
('s001', 's123', 'Seafood Company', 'Chan Ming Yiu', '28475621', '2 Bonham Std W,Sheung Wan '),
('s002', 's123', 'Fruit Company', 'Wong Kwan', '38574832', 'Greenfield Tower East,  Tsim Sha Tsui'),
('s003', 's123', 'Apple Company', 'Cheung Tai Man', '38576942', '8 Queen Rd C, Central District');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `Item`
--
ALTER TABLE `Item`
  ADD PRIMARY KEY (`itemID`),
  ADD KEY `FKItem544686` (`supplierID`);

--
-- Indexes for table `Orders`
--
ALTER TABLE `Orders`
  ADD PRIMARY KEY (`orderID`),
  ADD KEY `FKOrders266694` (`purchaseManagerID`);

--
-- Indexes for table `OrdersItem`
--
ALTER TABLE `OrdersItem`
  ADD PRIMARY KEY (`orderID`,`itemID`),
  ADD KEY `FKOrdersItem40035` (`itemID`),
  ADD KEY `FKOrdersItem51349` (`orderID`);

--
-- Indexes for table `PurchaseManager`
--
ALTER TABLE `PurchaseManager`
  ADD PRIMARY KEY (`purchaseManagerID`);

--
-- Indexes for table `Supplier`
--
ALTER TABLE `Supplier`
  ADD PRIMARY KEY (`supplierID`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `Item`
--
ALTER TABLE `Item`
  ADD CONSTRAINT `FKItem544686` FOREIGN KEY (`supplierID`) REFERENCES `Supplier` (`supplierID`);

--
-- Constraints for table `Orders`
--
ALTER TABLE `Orders`
  ADD CONSTRAINT `FKOrders266694` FOREIGN KEY (`purchaseManagerID`) REFERENCES `PurchaseManager` (`purchaseManagerID`);

--
-- Constraints for table `OrdersItem`
--
ALTER TABLE `OrdersItem`
  ADD CONSTRAINT `FKOrdersItem40035` FOREIGN KEY (`itemID`) REFERENCES `Item` (`itemID`),
  ADD CONSTRAINT `FKOrdersItem51349` FOREIGN KEY (`orderID`) REFERENCES `Orders` (`orderID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

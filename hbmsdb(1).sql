-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 21, 2021 at 09:51 AM
-- Server version: 10.4.19-MariaDB
-- PHP Version: 7.4.19

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `hbmsdb`
--

-- --------------------------------------------------------

--
-- Table structure for table `fooddetail`
--

CREATE TABLE `fooddetail` (
  `OrderID` varchar(50) NOT NULL,
  `FoodID` varchar(50) NOT NULL,
  `Quantity` varchar(50) DEFAULT NULL,
  `Amount` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `payment`
--

CREATE TABLE `payment` (
  `PaymentID` varchar(50) NOT NULL,
  `PaymentType` varchar(50) DEFAULT NULL,
  `AccNo` varchar(50) DEFAULT NULL,
  `OrderID` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `tbladmin`
--

CREATE TABLE `tbladmin` (
  `ID` int(10) NOT NULL,
  `AdminName` varchar(120) DEFAULT NULL,
  `UserName` varchar(200) DEFAULT NULL,
  `MobileNumber` bigint(10) DEFAULT NULL,
  `Email` varchar(200) DEFAULT NULL,
  `Password` varchar(200) DEFAULT NULL,
  `AdminRegdate` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbladmin`
--

INSERT INTO `tbladmin` (`ID`, `AdminName`, `UserName`, `MobileNumber`, `Email`, `Password`, `AdminRegdate`) VALUES
(1, 'Admin', 'Admin', 5689784592, 'admin@gmail.com', '76d80224611fc919a5d54f0ff9fba446', '2020-02-27 07:25:30');

-- --------------------------------------------------------

--
-- Table structure for table `tblbooking`
--

CREATE TABLE `tblbooking` (
  `ID` int(10) NOT NULL,
  `RoomId` int(5) DEFAULT NULL,
  `BookingNumber` varchar(120) DEFAULT NULL,
  `UserID` int(5) NOT NULL,
  `IDType` varchar(120) DEFAULT NULL,
  `Gender` varchar(50) DEFAULT NULL,
  `Address` mediumtext DEFAULT NULL,
  `CheckinDate` varchar(200) DEFAULT NULL,
  `CheckoutDate` varchar(200) DEFAULT NULL,
  `BookingDate` timestamp NULL DEFAULT current_timestamp(),
  `Remark` varchar(50) DEFAULT NULL,
  `Status` varchar(50) DEFAULT NULL,
  `UpdationDate` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tblbooking`
--

INSERT INTO `tblbooking` (`ID`, `RoomId`, `BookingNumber`, `UserID`, `IDType`, `Gender`, `Address`, `CheckinDate`, `CheckoutDate`, `BookingDate`, `Remark`, `Status`, `UpdationDate`) VALUES
(10, 3, '284521005', 8, 'Driving Licence Card', 'Male', 'ASDadsad', '2021-01-30', '2021-02-06', '2021-01-22 17:23:06', 'You Can Stay', 'Approved', '2021-01-22 17:24:26'),
(11, 1, '783959902', 8, 'Driving Licence Card', 'Female', '11119 Cabriolet Run\r\nFort Wayne', '2021-05-25', '2021-05-28', '2021-05-17 05:36:01', NULL, NULL, NULL),
(12, 3, '604114221', 8, 'Passport', 'Female', '11119 Cabriolet Run\r\nFort Wayne', '2021-05-18', '2021-05-31', '2021-05-17 05:38:09', NULL, NULL, NULL),
(13, 8, '539412794', 8, 'Voter Card', 'Female', '11119 Cabriolet Run\r\nFort Wayne', '2021-05-27', '2021-06-05', '2021-05-17 06:22:50', NULL, NULL, NULL),
(14, 7, '607736669', 8, 'Adhar Card', 'Female', '11119 Cabriolet Run\r\nFort Wayne', '2021-06-02', '2021-06-05', '2021-05-17 06:24:30', NULL, NULL, NULL),
(15, 1, '914920071', 9, 'Driving Licence Card', 'Female', '11119 Cabriolet Run\r\nFort Wayne', '2021-05-20', '2021-05-27', '2021-05-17 06:36:14', 'good', 'Approved', '2021-05-17 06:36:59'),
(16, 1, '194106683', 10, 'Passport', 'Female', 'sfsd', '2021-06-25', '2021-06-30', '2021-06-24 09:39:14', 'nk', 'Cancelled', '2021-07-01 06:05:21'),
(17, 1, '613092978', 11, 'Passport', 'Female', 'sfdsa', '2021-07-02', '2021-07-29', '2021-07-01 05:53:37', 'k', 'Approved', '2021-07-01 06:05:11');

-- --------------------------------------------------------

--
-- Table structure for table `tblcategory`
--

CREATE TABLE `tblcategory` (
  `ID` int(10) NOT NULL,
  `CategoryName` varchar(120) DEFAULT NULL,
  `Description` mediumtext DEFAULT NULL,
  `Price` int(5) NOT NULL,
  `Date` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tblcategory`
--

INSERT INTO `tblcategory` (`ID`, `CategoryName`, `Description`, `Price`, `Date`) VALUES
(1, 'Single Room', 'Only for one person', 800, '2020-02-28 06:43:55'),
(2, 'Double Room', 'For Two Person', 1100, '2020-02-28 06:44:55'),
(3, 'Triple Room', 'A room assigned to three people. May have two or more beds.', 1200, '2020-02-28 06:45:27'),
(4, 'Quad Room', 'A room assigned to four people. May have two or more beds.', 1800, '2020-02-28 06:45:56'),
(5, 'Queen Room', 'A room with a queen-sized bed. May be occupied by one or more people', 2000, '2020-02-28 06:46:30');

-- --------------------------------------------------------

--
-- Table structure for table `tblcontact`
--

CREATE TABLE `tblcontact` (
  `ID` int(10) NOT NULL,
  `Name` varchar(200) DEFAULT NULL,
  `MobileNumber` bigint(10) DEFAULT NULL,
  `Email` varchar(200) DEFAULT NULL,
  `Message` mediumtext DEFAULT NULL,
  `EnquiryDate` timestamp NULL DEFAULT current_timestamp(),
  `IsRead` int(5) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tblcontact`
--

INSERT INTO `tblcontact` (`ID`, `Name`, `MobileNumber`, `Email`, `Message`, `EnquiryDate`, `IsRead`) VALUES
(1, 'Himanshi', 9879797979, 'himanshi@gmail.com', 'Can I get some discount', '2020-03-01 13:49:20', 1),
(2, 'Rakesh Jha', 4564654654, 'jha@gmail.com', 'fhhsdfkjhf', '2020-03-01 13:50:07', 1),
(3, 'Harish', 9879746547, 'harish@gmail.com', 'yiuoic cbhjgdh jhgdhsadb ', '2020-03-01 13:50:46', 1),
(4, 'Mukesh', 5465446446, 'mukesh@gmail.com', 'jkhihihckjdshfhiuweayrufh', '2020-04-06 13:25:45', 1),
(5, 'Anuj', 2715351263, 'djshajdhas@gmail.com', 'Test Message', '2020-04-27 15:02:22', 1),
(6, 'waihanphyoe', 953543664, 'zkham09@gmail.com', 'Hello Hi  jfklshfjk  whuid hiofdhsf  jdkfdklsh fhdsofh jd iusd hfusehjfa hdkjaf hjfjdslfa  huiewau uyeai jkfhduifhjdk  fjdklahfeuisahfjdk hfjdkslhfjdk uehwjkhfa ufdjaklfhejskduhfjek hfdjkahfuiesa', '2021-01-22 17:26:56', 1);

-- --------------------------------------------------------

--
-- Table structure for table `tblfacility`
--

CREATE TABLE `tblfacility` (
  `ID` int(10) NOT NULL,
  `FacilityTitle` varchar(200) DEFAULT NULL,
  `Description` mediumtext DEFAULT NULL,
  `Image` varchar(200) DEFAULT NULL,
  `CreationDate` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tblfacility`
--

INSERT INTO `tblfacility` (`ID`, `FacilityTitle`, `Description`, `Image`, `CreationDate`) VALUES
(1, '24-Hour room service', '24-Hour room service available', 'b9fb9d37bdf15a699bc071ce49baea531582890659.jpg', '2020-02-28 11:50:59'),
(2, 'Free wireless internet access', 'Free wireless internet access available in room restro area', '7fdc1a630c238af0815181f9faa190f51582890845.jpg', '2020-02-28 11:54:05'),
(3, 'Laundry service', 'Free Laundry service available for a customer who book queen and king size room', '3c7baecb174a0cbcc64507e9c3308c4b1582890987.jpg', '2020-02-28 11:56:27'),
(4, 'Tour & excursions', 'vehicle are available for tour and travels', '1e6ae4ada992769567b71815f124fac51582891174.jpg', '2020-02-28 11:59:34'),
(5, 'Airport transfers', 'Airport transfers facility available on demand', 'c9e82378a39eec108727a123b09056651582891272.jpg', '2020-02-28 12:01:12'),
(6, 'Babysitting on request', 'Babysitting on request', 'c26be60cfd1ba40772b5ac48b95ab19b1582891331.png', '2020-02-28 12:02:11'),
(7, '24-Hour doctor on call', '24-Hour doctor on call', '55ccf27d26d7b23839986b6ae2e447ab1582891425.jpg', '2020-02-28 12:03:45'),
(8, 'Meeting facilities', 'Meeting facilities available for company person', 'efc1a80c391be252d7d777a437f868701582891713.jpg', '2020-02-28 12:08:33');

-- --------------------------------------------------------

--
-- Table structure for table `tblfood`
--

CREATE TABLE `tblfood` (
  `foodid` int(11) NOT NULL,
  `foodname` varchar(50) NOT NULL,
  `foodprice` varchar(50) NOT NULL,
  `image` varchar(255) NOT NULL,
  `fooddescription` varchar(50) NOT NULL,
  `foodtypeid` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tblfood`
--

INSERT INTO `tblfood` (`foodid`, `foodname`, `foodprice`, `image`, `fooddescription`, `foodtypeid`) VALUES
(1, 'Hawaiian Pizza', '2500', 'images_hawaiian.jpg', 'Pineapple,Ham', '2');

-- --------------------------------------------------------

--
-- Table structure for table `tblfoodtype`
--

CREATE TABLE `tblfoodtype` (
  `foodtypeid` int(10) NOT NULL,
  `foodtypename` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tblfoodtype`
--

INSERT INTO `tblfoodtype` (`foodtypeid`, `foodtypename`) VALUES
(1, 'Chinese'),
(2, 'Italian'),
(3, 'Burmese'),
(4, 'Indian');

-- --------------------------------------------------------

--
-- Table structure for table `tblorder`
--

CREATE TABLE `tblorder` (
  `OrderID` varchar(50) NOT NULL,
  `TotalPrice` varchar(50) DEFAULT NULL,
  `OrderDate` varchar(50) DEFAULT NULL,
  `OrderTime` varchar(50) DEFAULT NULL,
  `CustomerID` varchar(50) DEFAULT NULL,
  `CusName` varchar(30) NOT NULL,
  `CusAddress` varchar(30) NOT NULL,
  `CusPhNo` varchar(30) NOT NULL,
  `OrderStatus` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `tblpage`
--

CREATE TABLE `tblpage` (
  `ID` int(10) NOT NULL,
  `PageType` varchar(120) DEFAULT NULL,
  `PageTitle` varchar(200) DEFAULT NULL,
  `PageDescription` mediumtext DEFAULT NULL,
  `Email` varchar(120) DEFAULT NULL,
  `MobileNumber` bigint(10) DEFAULT NULL,
  `UpdationDate` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tblpage`
--

INSERT INTO `tblpage` (`ID`, `PageType`, `PageTitle`, `PageDescription`, `Email`, `MobileNumber`, `UpdationDate`) VALUES
(1, 'aboutus', 'About Us', 'We have 72 comfortably equipped rooms, including two suites: The President Suite and the Ambassador Suite, with over one hundred metres of surface area, which are sure to awe even the most demanding Guests. We offer 7 rooms, where we have been preparing family and business meetings already for 15 years.', NULL, NULL, NULL),
(2, 'contactus', 'Contact Us', 'D-204, Hole Town South West,Delhi-110096,India', 'info@gmail.com', 8529631236, '2020-02-29 14:14:30');

-- --------------------------------------------------------

--
-- Table structure for table `tblplan`
--

CREATE TABLE `tblplan` (
  `ID` int(11) NOT NULL,
  `Name` varchar(50) NOT NULL,
  `Photo` varchar(255) NOT NULL,
  `Price` varchar(50) NOT NULL,
  `Description` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tblroom`
--

CREATE TABLE `tblroom` (
  `ID` int(10) NOT NULL,
  `RoomType` int(10) DEFAULT NULL,
  `RoomName` varchar(200) DEFAULT NULL,
  `MaxAdult` int(5) DEFAULT NULL,
  `MaxChild` int(5) DEFAULT NULL,
  `RoomDesc` mediumtext DEFAULT NULL,
  `NoofBed` int(5) DEFAULT NULL,
  `Image` varchar(200) DEFAULT NULL,
  `RoomFacility` varchar(200) DEFAULT NULL,
  `CreationDate` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tblroom`
--

INSERT INTO `tblroom` (`ID`, `RoomType`, `RoomName`, `MaxAdult`, `MaxChild`, `RoomDesc`, `NoofBed`, `Image`, `RoomFacility`, `CreationDate`) VALUES
(1, 1, '101', 1, 2, 'A single room is for one person and contains a single bed, and will usually be quite small', 1, 'edab7ba7e203cd7576d1200465194ea81611050567.jpg', NULL, '2020-02-29 11:33:14'),
(2, 2, '102', 2, 2, 'A double room is a room intended for two people, usually a couple, to stay in. One person occupying a double room has to pay a supplement.', 2, 'db3a17f7bcac837ecc1fe2bc630a54731611050584.jpg', NULL, '2020-02-29 11:35:47'),
(3, 3, '103', 4, 2, 'A triple room is a hotel room that is made to comfortably accommodate three people. The triple room , simply called a triple, at times, may be configured with different bed sizes to ensure three hotel guests can be accommodated comfortably.', 3, '39539cb2e751a92425e1223763fae2d91611050600.jpg', NULL, '2020-02-29 11:43:58'),
(4, 4, '104', 6, 3, 'A quad, when referring to hotel rooms, is a room that can accommodate four people. The quad room may be configured with different bed sizes to ensure four hotel guests can be accommodated comfortably:', 4, '9414a8f5b810972c3c9a0e2860c075321611050615.jpg', NULL, '2020-02-29 11:45:49'),
(7, 1, '107', 1, 1, 'Single Room', 1, '358f3bd296746c5a47a4c6b90bee3d271611069729.jpg', '', '2021-01-19 10:50:57'),
(8, 4, '201', 1, 1, 'Good', 1, '19bdc43ae2ac0e89e5b4bbbcf38781ed1619362340.jpg', NULL, '2021-04-25 14:52:20'),
(12, 5, '201', 2, 1, 'Very Big Room', 3, '19bdc43ae2ac0e89e5b4bbbcf38781ed1623042276.jpg', NULL, '2021-06-07 05:04:36');

-- --------------------------------------------------------

--
-- Table structure for table `tbluser`
--

CREATE TABLE `tbluser` (
  `ID` int(10) NOT NULL,
  `FullName` varchar(200) DEFAULT NULL,
  `MobileNumber` bigint(10) DEFAULT NULL,
  `Email` varchar(120) DEFAULT NULL,
  `Password` varchar(120) DEFAULT NULL,
  `RegDate` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbluser`
--

INSERT INTO `tbluser` (`ID`, `FullName`, `MobileNumber`, `Email`, `Password`, `RegDate`) VALUES
(9, 'koko', 978652132, 'ko@gmail.com', '202cb962ac59075b964b07152d234b70', '2021-05-17 06:35:50'),
(10, 'sasa', 232323233, 'ss123@gmail.com', 'f9d1b14208b860b229d183bd693f0852', '2021-06-24 09:38:05'),
(11, 'saisai', 1233343, 'saisai@gmail.com', 'f9d1b14208b860b229d183bd693f0852', '2021-07-01 05:52:53');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `fooddetail`
--
ALTER TABLE `fooddetail`
  ADD PRIMARY KEY (`OrderID`,`FoodID`),
  ADD KEY `FoodID` (`FoodID`);

--
-- Indexes for table `payment`
--
ALTER TABLE `payment`
  ADD PRIMARY KEY (`PaymentID`),
  ADD KEY `OrderID` (`OrderID`);

--
-- Indexes for table `tbladmin`
--
ALTER TABLE `tbladmin`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `tblbooking`
--
ALTER TABLE `tblbooking`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `tblcategory`
--
ALTER TABLE `tblcategory`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `ID` (`ID`);

--
-- Indexes for table `tblcontact`
--
ALTER TABLE `tblcontact`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `tblfacility`
--
ALTER TABLE `tblfacility`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `tblfood`
--
ALTER TABLE `tblfood`
  ADD PRIMARY KEY (`foodid`);

--
-- Indexes for table `tblfoodtype`
--
ALTER TABLE `tblfoodtype`
  ADD PRIMARY KEY (`foodtypeid`);

--
-- Indexes for table `tblorder`
--
ALTER TABLE `tblorder`
  ADD PRIMARY KEY (`OrderID`),
  ADD KEY `CustomerID` (`CustomerID`);

--
-- Indexes for table `tblpage`
--
ALTER TABLE `tblpage`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `tblplan`
--
ALTER TABLE `tblplan`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `tblroom`
--
ALTER TABLE `tblroom`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `RoomType` (`RoomType`);

--
-- Indexes for table `tbluser`
--
ALTER TABLE `tbluser`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `ID` (`ID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tbladmin`
--
ALTER TABLE `tbladmin`
  MODIFY `ID` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `tblbooking`
--
ALTER TABLE `tblbooking`
  MODIFY `ID` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `tblcategory`
--
ALTER TABLE `tblcategory`
  MODIFY `ID` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `tblcontact`
--
ALTER TABLE `tblcontact`
  MODIFY `ID` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `tblfacility`
--
ALTER TABLE `tblfacility`
  MODIFY `ID` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `tblfood`
--
ALTER TABLE `tblfood`
  MODIFY `foodid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `tblfoodtype`
--
ALTER TABLE `tblfoodtype`
  MODIFY `foodtypeid` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `tblpage`
--
ALTER TABLE `tblpage`
  MODIFY `ID` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tblplan`
--
ALTER TABLE `tblplan`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tblroom`
--
ALTER TABLE `tblroom`
  MODIFY `ID` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `tbluser`
--
ALTER TABLE `tbluser`
  MODIFY `ID` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

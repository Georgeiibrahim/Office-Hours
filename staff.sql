-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 15, 2021 at 09:23 PM
-- Server version: 10.4.17-MariaDB
-- PHP Version: 8.0.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `staff`
--

-- --------------------------------------------------------

--
-- Table structure for table `appointment`
--

CREATE TABLE `appointment` (
  `ID` int(11) NOT NULL,
  `officeHoursID` int(11) NOT NULL,
  `StaffID` int(11) NOT NULL,
  `StudentID` int(11) NOT NULL,
  `slot` varchar(20) NOT NULL,
  `Date` date NOT NULL,
  `day` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `appointment`
--

INSERT INTO `appointment` (`ID`, `officeHoursID`, `StaffID`, `StudentID`, `slot`, `Date`, `day`) VALUES
(40, 4, 6, 1, '7:30-8:00', '2021-01-15', 'friday'),
(41, 4, 6, 1, '7:30-8:00', '2021-01-15', 'friday');

-- --------------------------------------------------------

--
-- Table structure for table `enrolled_in`
--

CREATE TABLE `enrolled_in` (
  `StudID` int(11) NOT NULL,
  `SubjectID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `enrolled_in`
--

INSERT INTO `enrolled_in` (`StudID`, `SubjectID`) VALUES
(1, 1),
(5, 4),
(1, 3),
(4, 4),
(3, 2);

-- --------------------------------------------------------

--
-- Table structure for table `messages`
--

CREATE TABLE `messages` (
  `email1` varchar(200) NOT NULL,
  `email2` varchar(200) NOT NULL,
  `content` varchar(200) NOT NULL,
  `ID` int(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `messages`
--

INSERT INTO `messages` (`email1`, `email2`, `content`, `ID`) VALUES
('george.hima@yahoo.com', 'gogo@koko', 'komoasdnjasbf asf', 1),
('george.hima@yahoo.com', 'gogo@kokoo', 'komoasdnjasbf asf', 2),
('georgehima@yahoo.com', 'george.hima@yahoo.com', 'sadafasf', 3),
('george.hima@yahoo.com', 'george@yahoo.com', '3625', 4),
('george.hima@yahoo.com', 'george@yahoo.com', '3625', 5),
('george.hima@yahoo.com', 'george@yahoo.com', '3625', 6),
('george.hima@yahoo.com', 'george@yahoo.com', 'das', 7),
('george.hima@yahoo.com', 'george@yahoo.com', 'das', 8),
('george.hima@yahoo.com', 'george@yahoo.com', 'das', 9),
('george.hima@yahoo.com', 'george.hima@yahoo.com', 'sadsd', 10),
('george.hima@yahoo.com', 'george.hima@yahoo.com', 'sadsd', 11),
('george.hima@yahoo.com', 'george.hima@yahoo.com', 'sddasd', 12),
('george.hima@yahoo.com', 'george.hima@yahoo.com', 'rrrrr', 13),
('george.hima@yahoo.com', 'georgehima@yahoo.com', 'dadsad', 14),
('george.hima@yahoo.com', 'georgehima@yahoo.com', 'sadssasd', 15),
('george.hima@yahoo.com', 'asdasd', 'sasaddasasda', 16),
('george.hima@yahoo.com', 'asdasd', 'sasaddasasda', 17),
('george.hima@yahoo.com', 'asdasd', 'sasaddasasda', 18),
('george.hima@yahoo.com', 'asdasd', 'sasaddasasda', 19),
('george.hima@yahoo.com', 'asdasd', 'sasaddasasda', 20),
('george.hima@yahoo.com', 'georg22e@yahoo.comdas', 'asdafaca', 21),
('george@yahoo.com', 'george.hima@yahoo.com', '3625185', 22),
('george.hima@yahoo.com', 'george@yahoo.com', 'sad362514', 23),
('george.hima@yahoo.com', 'georgehima@yahoo.com', 'shokrn', 24),
('george@yahoo.com', 'george.hima@yahoo.com', 'shokrnnnasfj', 25);

-- --------------------------------------------------------

--
-- Table structure for table `msg`
--

CREATE TABLE `msg` (
  `id` int(255) NOT NULL,
  `msg` varchar(255) NOT NULL,
  `from` varchar(255) NOT NULL,
  `to` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `msg`
--

INSERT INTO `msg` (`id`, `msg`, `from`, `to`) VALUES
(1, 'awl msg', 'george', 'malk'),
(2, 'tani msg', 'george', 'rawda');

-- --------------------------------------------------------

--
-- Table structure for table `officehours`
--

CREATE TABLE `officehours` (
  `ID` int(11) NOT NULL,
  `staffID` int(11) NOT NULL,
  `day` varchar(20) NOT NULL,
  `time` varchar(20) NOT NULL,
  `status` varchar(20) NOT NULL,
  `location` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `officehours`
--

INSERT INTO `officehours` (`ID`, `staffID`, `day`, `time`, `status`, `location`) VALUES
(2, 5, 'tuesday', '9:00-9:30', 'online', 'cairo'),
(3, 1, 'bokra', '9:30-10', 'offline', 'Giza'),
(4, 6, 'friday', '7:30-8:00', 'online', 'giza'),
(5, 4, 'wed', '8:30-9:00', 'offline', 'cairo'),
(6, 4, '8:30-9:30', 'b3d-bokra', 'online', 'cairo-giza');

-- --------------------------------------------------------

--
-- Table structure for table `register`
--

CREATE TABLE `register` (
  `username` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `register`
--

INSERT INTO `register` (`username`, `email`, `address`, `password`) VALUES
('ff', 'ff', 'ff', ''),
('tena ', 'yoyosung4@gmail.com', 'ksadn sa ', ''),
('????', 'yoyosung4@gmail.com', 'sad', ''),
('gogo', 'yoyosung4@gmail.com', 'sad', '7347'),
('gogoasdasd', 'yoyosung4@gmail.com', 'sadsda', '4195'),
('malk', 'Malkrizk@gmail.com', 'ay haga ', '6302'),
('george', 'gogo@gamil.com', 'asdn', '2081'),
('george', 'gogo@gamil.com', 'asdn', '1881'),
('georgee', 'george@yahoo.com', 'asd', '6734'),
('georgee', 'george@yahoo.com', 'asd', '1552'),
('georgee', 'georg2e@yahoo.com', 'asddd', '7295');

-- --------------------------------------------------------

--
-- Table structure for table `staff`
--

CREATE TABLE `staff` (
  `username` varchar(255) NOT NULL,
  `id` int(255) NOT NULL,
  `subject` varchar(255) NOT NULL,
  `type` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `staff`
--

INSERT INTO `staff` (`username`, `id`, `subject`, `type`) VALUES
('amgd', 1, 'science', 'dr'),
('rafat', 2, 'math', 'dr');

-- --------------------------------------------------------

--
-- Table structure for table `staff2`
--

CREATE TABLE `staff2` (
  `StaffID` int(11) NOT NULL,
  `StaffPassword` varchar(100) NOT NULL,
  `StaffName` varchar(50) NOT NULL,
  `StaffAddres` varchar(120) NOT NULL,
  `StaffEmail` varchar(100) NOT NULL,
  `type` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `staff2`
--

INSERT INTO `staff2` (`StaffID`, `StaffPassword`, `StaffName`, `StaffAddres`, `StaffEmail`, `type`) VALUES
(1, '3207', 'george', '2663', 'george.hima55@gmail.com', 'ta'),
(2, '5867', 'fepe', 'kmomomaidn', 'george.hima@yahoo.com', 'TA'),
(3, '2388', 'gogo', 'sadsdasda', 'george.hima@yahoo.com', 'ssadd'),
(4, '9900', 'fepee', 'asd', 'asdasd', 'asdafaf'),
(5, '1792', 'fobya', 'shar3 bas', 'gogo@koko.com', 'gender'),
(6, '6361', 'koasdnin', 'sjan', 'koko@hsbbdn.com', 'nasfjas'),
(7, '9932', 'malk', 'monfya', 'malkrizk@gmail.com', 'TA'),
(8, '6020', 'Rawda', 'mansora', 'rawdaahmed165@gmail.com', 'Dr');

-- --------------------------------------------------------

--
-- Table structure for table `student`
--

CREATE TABLE `student` (
  `StudentID` int(255) NOT NULL,
  `StudentPassword` varchar(255) NOT NULL,
  `StudentName` varchar(255) NOT NULL,
  `StudentAddres` varchar(255) NOT NULL,
  `StudentMobile` varchar(255) NOT NULL,
  `StudentEmail` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `student`
--

INSERT INTO `student` (`StudentID`, `StudentPassword`, `StudentName`, `StudentAddres`, `StudentMobile`, `StudentEmail`) VALUES
(1, '1111', 'George', 'sharbya', '120', 'george@yahoo.com'),
(2, '8618', 'georgee', 'asd', 'asd', 'georg22e@yahoo.com'),
(3, '7660', 'georgeeskdnajn', 'asd', 'asd', 'georg22e@yahoo.com'),
(4, '3926', 'georgeeskdnajnsdaasad', 'asd', 'asd', 'georg22e@yahoo.comdas'),
(5, '1241', 'ggg', 'ssas', 'ssas', 'dfsf@asda.com');

-- --------------------------------------------------------

--
-- Table structure for table `subject`
--

CREATE TABLE `subject` (
  `SubjectID` int(11) NOT NULL,
  `SubjectName` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `subject`
--

INSERT INTO `subject` (`SubjectID`, `SubjectName`) VALUES
(1, 'English'),
(2, 'Arabic'),
(3, 'science'),
(4, 'Architic');

-- --------------------------------------------------------

--
-- Table structure for table `works_in`
--

CREATE TABLE `works_in` (
  `StaffID` int(11) NOT NULL,
  `SubjectID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `works_in`
--

INSERT INTO `works_in` (`StaffID`, `SubjectID`) VALUES
(1, 4),
(5, 3),
(4, 3),
(6, 3),
(2, 4),
(2, 2),
(6, 2);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `appointment`
--
ALTER TABLE `appointment`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `officeHoursID` (`officeHoursID`),
  ADD KEY `StudentID` (`StudentID`),
  ADD KEY `StaffID` (`StaffID`);

--
-- Indexes for table `enrolled_in`
--
ALTER TABLE `enrolled_in`
  ADD KEY `StudID` (`StudID`),
  ADD KEY `SubjectID` (`SubjectID`);

--
-- Indexes for table `messages`
--
ALTER TABLE `messages`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `msg`
--
ALTER TABLE `msg`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `officehours`
--
ALTER TABLE `officehours`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `staffID` (`staffID`);

--
-- Indexes for table `staff`
--
ALTER TABLE `staff`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `staff2`
--
ALTER TABLE `staff2`
  ADD PRIMARY KEY (`StaffID`);

--
-- Indexes for table `student`
--
ALTER TABLE `student`
  ADD PRIMARY KEY (`StudentID`);

--
-- Indexes for table `subject`
--
ALTER TABLE `subject`
  ADD PRIMARY KEY (`SubjectID`);

--
-- Indexes for table `works_in`
--
ALTER TABLE `works_in`
  ADD KEY `StaffID` (`StaffID`),
  ADD KEY `SubjectID` (`SubjectID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `appointment`
--
ALTER TABLE `appointment`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;

--
-- AUTO_INCREMENT for table `messages`
--
ALTER TABLE `messages`
  MODIFY `ID` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `msg`
--
ALTER TABLE `msg`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `officehours`
--
ALTER TABLE `officehours`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `staff`
--
ALTER TABLE `staff`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `staff2`
--
ALTER TABLE `staff2`
  MODIFY `StaffID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `student`
--
ALTER TABLE `student`
  MODIFY `StudentID` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `subject`
--
ALTER TABLE `subject`
  MODIFY `SubjectID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `appointment`
--
ALTER TABLE `appointment`
  ADD CONSTRAINT `appointment_ibfk_1` FOREIGN KEY (`officeHoursID`) REFERENCES `officehours` (`ID`),
  ADD CONSTRAINT `appointment_ibfk_2` FOREIGN KEY (`StudentID`) REFERENCES `student` (`StudentID`),
  ADD CONSTRAINT `appointment_ibfk_3` FOREIGN KEY (`StaffID`) REFERENCES `staff2` (`StaffID`);

--
-- Constraints for table `enrolled_in`
--
ALTER TABLE `enrolled_in`
  ADD CONSTRAINT `enrolled_in_ibfk_1` FOREIGN KEY (`StudID`) REFERENCES `student` (`StudentID`),
  ADD CONSTRAINT `enrolled_in_ibfk_2` FOREIGN KEY (`SubjectID`) REFERENCES `subject` (`SubjectID`);

--
-- Constraints for table `officehours`
--
ALTER TABLE `officehours`
  ADD CONSTRAINT `officehours_ibfk_1` FOREIGN KEY (`staffID`) REFERENCES `staff2` (`StaffID`);

--
-- Constraints for table `works_in`
--
ALTER TABLE `works_in`
  ADD CONSTRAINT `works_in_ibfk_1` FOREIGN KEY (`StaffID`) REFERENCES `staff2` (`StaffID`),
  ADD CONSTRAINT `works_in_ibfk_2` FOREIGN KEY (`SubjectID`) REFERENCES `subject` (`SubjectID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

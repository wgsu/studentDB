-- phpMyAdmin SQL Dump
-- version 4.2.11
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Apr 13, 2015 at 04:02 PM
-- Server version: 5.6.21
-- PHP Version: 5.6.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `student_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `advice`
--

CREATE TABLE IF NOT EXISTS `advice` (
  `SID` int(10) NOT NULL,
  `I_ID` int(7) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `advice`
--

INSERT INTO `advice` (`SID`, `I_ID`) VALUES
(1228748, 1),
(1234567, 1),
(1456372, 2),
(1672943, 3),
(1943044, 4),
(2343551, 5),
(2378492, 6),
(2745960, 7),
(2894783, 8),
(2936523, 9);

-- --------------------------------------------------------

--
-- Table structure for table `chairof`
--

CREATE TABLE IF NOT EXISTS `chairof` (
  `I_ID` int(7) NOT NULL,
  `D_ID` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `chairof`
--

INSERT INTO `chairof` (`I_ID`, `D_ID`) VALUES
(1, 'cmpsc'),
(2, 'ec'),
(3, 'eng'),
(4, 'gvt'),
(5, 'hst'),
(6, 'math'),
(7, 'phil'),
(8, 'phys'),
(9, 'soc');

-- --------------------------------------------------------
--
-- Triggers `chairof`
--
DELIMITER //
CREATE TRIGGER `noDelete` BEFORE DELETE ON `chairof`
 FOR EACH ROW BEGIN
  IF OLD.I_ID = 1 THEN -- Abort when trying to remove this record
    CALL cannot_delete_error;
  END IF;
END
//
DELIMITER ;

--
-- Table structure for table `course`
--

CREATE TABLE IF NOT EXISTS `course` (
  `course_number` int(3) NOT NULL,
  `D_ID` varchar(10) NOT NULL,
  `section_number` varchar(3) NOT NULL,
  `title` varchar(100) NOT NULL,
  `credit` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `course`
--

INSERT INTO `course` (`course_number`, `D_ID`, `section_number`, `title`, `credit`) VALUES
(131, 'cmpsc', 'A', 'computer science 1', 4),
(102, 'ec', 'A', 'global macro', 4),
(101, 'eng', 'A', 'english 1', 4),
(110, 'gvt', 'A', 'introAmericaDem', 4),
(208, 'gvt', 'A', 'politics/religion', 4),
(121, 'hst', 'A', 'world history 1', 4),
(136, 'math', 'A', 'cal', 4),
(123, 'phil', 'A', 'social ethics', 4),
(113, 'soc', 'A', 'intro_to_soc', 4),
(116, 'soc', 'A', 'social problem', 4);

-- --------------------------------------------------------

--
-- Table structure for table `department`
--

CREATE TABLE IF NOT EXISTS `department` (
  `D_ID` varchar(100) NOT NULL,
  `department_name` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `department`
--

INSERT INTO `department` (`D_ID`, `department_name`) VALUES
('cmpsc', 'computer science'),
('ec', 'economics'),
('eng', 'english'),
('gvt', 'government'),
('hst', 'history'),
('math', 'math'),
('phil', 'philosophy'),
('phys', 'physics'),
('soc', 'siciology');

-- --------------------------------------------------------

--
-- Table structure for table `enroll`
--

CREATE TABLE IF NOT EXISTS `enroll` (
  `SID` int(20) NOT NULL,
  `D_ID` varchar(10) NOT NULL,
  `course_number` int(3) NOT NULL,
  `section_number` varchar(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `enroll`
--

INSERT INTO `enroll` (`SID`, `D_ID`, `course_number`, `section_number`) VALUES
(1228748, 'cmpsc', 131, 'A'),
(2343551, 'cmpsc', 131, 'A'),
(1234567, 'ec', 102, 'A'),
(2894783, 'ec', 102, 'A'),
(1456372, 'eng', 101, 'A'),
(1672943, 'gvt', 110, 'A'),
(1943044, 'hst', 121, 'A'),
(2343551, 'math', 136, 'A'),
(2745960, 'phil', 123, 'A'),
(2378492, 'soc', 116, 'A'),
(2745960, 'soc', 113, 'A');

-- --------------------------------------------------------

--
-- Table structure for table `exchange`
--

CREATE TABLE IF NOT EXISTS `exchange` (
  `SID` int(10) NOT NULL,
  `school` varchar(30) NOT NULL,
  `start` date NOT NULL,
  `end` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `exchange`
--

INSERT INTO `exchange` (`SID`, `school`, `start`, `end`) VALUES
(1228748, 'college of art and science', '2014-04-03', '2014-04-18'),
(1943044, 'dman school of art', '2014-04-25', '2014-04-26');

-- --------------------------------------------------------

--
-- Table structure for table `instructor`
--

CREATE TABLE IF NOT EXISTS `instructor` (
  `I_ID` int(7) NOT NULL,
  `instr_name` varchar(30) NOT NULL,
  `D_ID` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `instructor`
--

INSERT INTO `instructor` (`I_ID`, `instr_name`, `D_ID`) VALUES
(1, 'John Smith', 'cmpsc'),
(2, 'Tony', 'ec'),
(3, 'cid', 'soc'),
(4, 'either', 'eng'),
(5, 'david', 'gvt'),
(6, 'wu', 'hst'),
(7, 'wei', 'math'),
(8, 'david', 'phil'),
(9, 'shu', 'phys'),
(10, 'link', 'soc');

-- --------------------------------------------------------

--
-- Table structure for table `student`
--

CREATE TABLE IF NOT EXISTS `student` (
  `SID` int(10) NOT NULL,
  `name` varchar(30) NOT NULL,
  `address` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `major` varchar(20) NOT NULL,
  `phone` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `student`
--

INSERT INTO `student` (`SID`, `name`, `address`, `email`, `major`, `phone`) VALUES
(1228748, 'Kain Edwards', '1200 Quincy Ct.', '1228748@su.edu', 'Accounting', '6170000000'),
(1234567, 'Hello World', '1 beacon street', '1234567@su.edu', 'Computer Science', '6171234567'),
(1456372, 'Cecil Martin', '225 Hazelwood Dr', '1456372@suufolk.edu', 'Finacne', '6177842210'),
(1672943, 'Rose Rydia', '111 Lincoln Street', '1672943@su.edu', 'Graphic Design', '9875692356'),
(1943044, 'Allen Walker', '44 Lynn Street ', '1943044@su.edu', 'History', '61755567676'),
(2343551, 'Bartz Hall', '45 jump street', '2343551@su.edu', 'Computer Science', '6179492500'),
(2378492, 'Tina Taylor', '426 water street', '2378492@su.edu', 'History', '6170211343'),
(2745960, 'Join Freemen', ' 20 summer street', '2745960@su.edu', 'Accounting', '6712024530'),
(2894783, 'Cid Ward', '100 winter street', '2894783@su.edu', 'Computer Graphic', '6710981234'),
(2936523, 'Ben Miller', '100 summer street', '2936523@su.edu', 'Computer Science', '6172221111');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `advice`
--
ALTER TABLE `advice`
 ADD PRIMARY KEY (`SID`,`I_ID`), ADD KEY `I_ID` (`I_ID`);

--
-- Indexes for table `chairof`
--
ALTER TABLE `chairof`
 ADD PRIMARY KEY (`I_ID`,`D_ID`), ADD KEY `D_ID` (`D_ID`);

--
-- Indexes for table `course`
--
ALTER TABLE `course`
 ADD PRIMARY KEY (`D_ID`,`course_number`,`section_number`), ADD KEY `D_ID` (`D_ID`);

--
-- Indexes for table `department`
--
ALTER TABLE `department`
 ADD PRIMARY KEY (`D_ID`);

--
-- Indexes for table `enroll`
--
ALTER TABLE `enroll`
 ADD PRIMARY KEY (`SID`,`D_ID`,`course_number`,`section_number`), ADD KEY `D_ID` (`D_ID`);

--
-- Indexes for table `exchange`
--
ALTER TABLE `exchange`
 ADD PRIMARY KEY (`SID`);

--
-- Indexes for table `instructor`
--
ALTER TABLE `instructor`
 ADD PRIMARY KEY (`I_ID`);

--
-- Indexes for table `student`
--
ALTER TABLE `student`
 ADD PRIMARY KEY (`SID`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `advice`
--
ALTER TABLE `advice`
ADD CONSTRAINT `advice_ibfk_1` FOREIGN KEY (`SID`) REFERENCES `student` (`SID`) ON DELETE CASCADE ON UPDATE CASCADE,
ADD CONSTRAINT `advice_ibfk_2` FOREIGN KEY (`I_ID`) REFERENCES `instructor` (`I_ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `chairof`
--
ALTER TABLE `chairof`
ADD CONSTRAINT `chairof_ibfk_1` FOREIGN KEY (`I_ID`) REFERENCES `instructor` (`I_ID`) ON DELETE CASCADE ON UPDATE CASCADE,
ADD CONSTRAINT `chairof_ibfk_2` FOREIGN KEY (`D_ID`) REFERENCES `department` (`D_ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `course`
--
ALTER TABLE `course`
ADD CONSTRAINT `course_ibfk_1` FOREIGN KEY (`D_ID`) REFERENCES `department` (`D_ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `enroll`
--
ALTER TABLE `enroll`
ADD CONSTRAINT `enroll_ibfk_1` FOREIGN KEY (`SID`) REFERENCES `student` (`SID`) ON DELETE CASCADE ON UPDATE CASCADE,
ADD CONSTRAINT `enroll_ibfk_2` FOREIGN KEY (`D_ID`) REFERENCES `department` (`D_ID`) ON DELETE CASCADE;

--
-- Constraints for table `exchange`
--
ALTER TABLE `exchange`
ADD CONSTRAINT `exchange_ibfk_1` FOREIGN KEY (`SID`) REFERENCES `student` (`SID`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

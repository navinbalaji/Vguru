-- phpMyAdmin SQL Dump
-- version 4.7.1
-- https://www.phpmyadmin.net/
--
-- Host: b0wwyqhyt7t9fqaabyej-mysql.services.clever-cloud.com
-- Generation Time: Aug 19, 2020 at 12:18 PM
-- Server version: 8.0.15-5
-- PHP Version: 7.0.33-0ubuntu0.16.04.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `b0wwyqhyt7t9fqaabyej`
--
CREATE DATABASE IF NOT EXISTS `b0wwyqhyt7t9fqaabyej` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `b0wwyqhyt7t9fqaabyej`;

-- --------------------------------------------------------

--
-- Table structure for table `information`
--

CREATE TABLE `information` (
  `standard` varchar(10) NOT NULL,
  `info` text NOT NULL,
  `date` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `information`
--

INSERT INTO `information` (`standard`, `info`, `date`) VALUES
('PreKg', 'No Information', '-'),
('LKG', 'No Information', '-'),
('UKG', 'No Information', '-'),
('1', 'No Information', '-'),
('2', 'No Information', '-'),
('3', 'No Information', '-'),
('4', 'No Information', '-'),
('5', 'No Information', '-'),
('6', 'No Information', '-'),
('7', 'No Information', '-'),
('8', 'No Information', '-'),
('9', 'No Information', '-'),
('10', 'No Information', '-'),
('11', 'No Information', '-'),
('12', 'Please Complete As Soon As Possibles', '10-08-2020 22:22:33'),
('ForAll', 'No Information', '-');

-- --------------------------------------------------------

--
-- Table structure for table `lesson`
--

CREATE TABLE `lesson` (
  `standard` varchar(100) NOT NULL,
  `subject` varchar(100) NOT NULL,
  `lessonName` varchar(200) NOT NULL,
  `lesson` text NOT NULL,
  `createdDate` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `lesson`
--

INSERT INTO `lesson` (`standard`, `subject`, `lessonName`, `lesson`, `createdDate`) VALUES
('12', 'Physics', 'Lesson-1', 'what is ohms\'s law', '26-07-2020 22:19:40'),
('10', 'Tamil', '&#2980;&#3007;&#2992;&#3009;&#2965;&#3021;&#2965;&#3009;&#2993;&#2995;&#3021;', '&#2949;&#2965;&#2992; &#2990;&#3009;&#2980;&#2994; &#2958;&#2996;&#3009;&#2980;&#3021;&#2980;&#3014;&#2994;&#3021;&#2994;&#3006;&#2990;&#3021; &#2950;&#2980;&#3007;\r\n&#2986;&#2965;&#2997;&#2985;&#3021; &#2990;&#3009;&#2980;&#2993;&#3021;&#2993;&#3015; &#2953;&#2994;&#2965;&#3009;', '27-07-2020 21:41:31'),
('10', 'English', 'General', 'what is Dictionary', '27-07-2020 21:43:28'),
('10', 'English', 'Knowledge', 'who is the father of Nation?\r\n                                             -Mahatma Gandhi', '27-07-2020 23:11:54');

-- --------------------------------------------------------

--
-- Table structure for table `mentor`
--

CREATE TABLE `mentor` (
  `name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `standard` varchar(100) NOT NULL,
  `lastlogin` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `mentor`
--

INSERT INTO `mentor` (`name`, `email`, `password`, `standard`, `lastlogin`) VALUES
('navin', 'navin@gmail.com', 'navin', '12', '16-08-2020 11:54:15');

-- --------------------------------------------------------

--
-- Table structure for table `puzzle`
--

CREATE TABLE `puzzle` (
  `name` varchar(200) NOT NULL,
  `email` varchar(200) NOT NULL,
  `standard` varchar(200) NOT NULL,
  `puzzleName` varchar(200) NOT NULL,
  `testAuthentication` int(100) NOT NULL,
  `marks` int(100) NOT NULL,
  `totalmarks` int(100) NOT NULL,
  `DateAndTime` varchar(200) NOT NULL,
  `finishtime` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `puzzle`
--

INSERT INTO `puzzle` (`name`, `email`, `standard`, `puzzleName`, `testAuthentication`, `marks`, `totalmarks`, `DateAndTime`, `finishtime`) VALUES
('Pasupathieswaran  V', 'pasupathi4cs@gmail.com', '10', 'general', 1, 0, 2, '12-08-2020 06:37:03', '12-08-2020 06:37:09'),
('Pasupathieswaran  V', 'pasupathi4cs@gmail.com', '10', 'b', 1, 0, 2, '12-08-2020 06:53:44', '12-08-2020 06:53:53'),
('sudharsan  v', 'sudharsanthirumalai27@gmail.com', '10', 'general', 1, 0, 0, '17-08-2020 06:26:07', '17-08-2020 06:26:07'),
('Meiyazhagan  K', 'kmeiyazhagan14@gmail.com', '10', 'general', 1, 0, 2, '19-08-2020 05:31:54', '19-08-2020 05:32:00'),
('Meiyazhagan  K', 'kmeiyazhagan14@gmail.com', '10', 'b', 1, 0, 2, '19-08-2020 05:32:09', '19-08-2020 05:32:14');

-- --------------------------------------------------------

--
-- Table structure for table `puzzlequestions`
--

CREATE TABLE `puzzlequestions` (
  `standard` varchar(100) NOT NULL,
  `puzzleName` varchar(100) NOT NULL,
  `question` text NOT NULL,
  `option1` varchar(200) NOT NULL,
  `option2` varchar(200) NOT NULL,
  `option3` varchar(200) NOT NULL,
  `option4` varchar(200) NOT NULL,
  `correctAnswer` varchar(200) NOT NULL,
  `createdDate` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `puzzlequestions`
--

INSERT INTO `puzzlequestions` (`standard`, `puzzleName`, `question`, `option1`, `option2`, `option3`, `option4`, `correctAnswer`, `createdDate`) VALUES
('10', 'general', 'a', 'a', 'b', 'c', 'd', 'a', '28-07-2020 15:06:22'),
('10', 'b', 'b', 'a', 'b', 'c', 'd', 'b', '28-07-2020 15:06:52'),
('10', 'general', 'a', 'a', 'b', 'c', 'd', 'd', '28-07-2020 15:28:03'),
('10', 'b', 'skdblss', 'sds', 'dvsa', 'dvs', 'dv', 'dv', '28-07-2020 15:52:40');

-- --------------------------------------------------------

--
-- Table structure for table `test`
--

CREATE TABLE `test` (
  `name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `standard` varchar(100) NOT NULL,
  `subject` varchar(100) NOT NULL,
  `testname` varchar(100) NOT NULL,
  `testAuthentication` int(100) NOT NULL,
  `marks` int(100) NOT NULL,
  `totalmarks` int(100) NOT NULL,
  `DateAndTime` varchar(100) NOT NULL,
  `finishtime` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `test`
--

INSERT INTO `test` (`name`, `email`, `standard`, `subject`, `testname`, `testAuthentication`, `marks`, `totalmarks`, `DateAndTime`, `finishtime`) VALUES
('Navin  R K', 'navinbalaji1199@gmail.com', '12', 'Physics', 'practice', 1, 3, 3, '11-08-2020 22:38:29', '11-08-2020 22:39:07'),
('Pasupathieswaran  V', 'pasupathi4cs@gmail.com', '10', 'English', 'Practice', 1, 0, 1, '12-08-2020 06:55:17', '12-08-2020 06:55:21'),
('Arun  T', 'arunvibin12@gmail.com', '10', 'English', 'Practice', 1, 1, 1, '13-08-2020 05:16:18', '13-08-2020 05:16:20'),
('Navin  R K', 'navinbalaji1199@gmail.com', '12', 'Physics', 'demo', 1, 0, 1, '14-08-2020 23:22:09', '14-08-2020 23:22:09');

-- --------------------------------------------------------

--
-- Table structure for table `testname`
--

CREATE TABLE `testname` (
  `SID` varchar(10) NOT NULL,
  `standard` varchar(50) NOT NULL,
  `subject` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `testname`
--

INSERT INTO `testname` (`SID`, `standard`, `subject`) VALUES
('tamil', '10', 'tamil test'),
('English', '10', 'English test'),
('Maths', '10', 'Maths test'),
('Science', '10', 'Science test'),
('Biology', '12', 'Biology  test'),
('Chemistry', '12', 'Chemistry test'),
('Physics', '12', 'Physics test');

-- --------------------------------------------------------

--
-- Table structure for table `testquestions`
--

CREATE TABLE `testquestions` (
  `standard` varchar(10) NOT NULL,
  `subject` varchar(50) NOT NULL,
  `testtopic` varchar(100) NOT NULL,
  `question` text NOT NULL,
  `option1` varchar(100) NOT NULL,
  `option2` varchar(100) NOT NULL,
  `option3` varchar(100) NOT NULL,
  `option4` varchar(100) NOT NULL,
  `correctanswer` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `testquestions`
--

INSERT INTO `testquestions` (`standard`, `subject`, `testtopic`, `question`, `option1`, `option2`, `option3`, `option4`, `correctanswer`) VALUES
('10', 'Science', 'Practice', 'what is short form of infrared sensor', 'ir', 'rr', 'rr', 'rr', 'ir'),
('10', 'Science', 'Practice', 'what is ohms law', 'm', 'r', 'rr', 'ohm', 'ohm'),
('12', 'Physics', 'practice', 'what is color of water', 'nocolor', 'blue', 'red', 'green', 'nocolor'),
('12', 'Physics', 'practice', 'what is color of sky', 'nocolor', 'blue', 'red', 'green', 'blue'),
('10', 'English', 'Practice', 'wergyu', '1', '2', '3', '4', '1'),
('12', 'Physics', 'Practice', 'what is newton law', '3', '4', '5', '6', '3'),
('10', '-Select Subject-', 'practice', 'dfgh', 'hjvv', 'gc', 'hvj', 'ghc', 'hvj'),
('10', 'English', 'demo', 'waqqa', 'wqf', 'wf', 'wd', 'AD', 'q'),
('10', '-Select Subject-', 'demo', 'zxv', 'zsvd', 'zdvs', 'zadvs', 'asdvsda', 'AVSVasf'),
('10', 'no', 'demo', 'zdsv', 'aSvf', 'asvf', 'afv', 'aaWV', 'awfwaS'),
('12', 'Physics', 'demo', '1. Radiocarbon is produced in the atmosphere as a result of', 'collision between fast neutrons and nitrogen nuclei present in the atmosphere', 'action of ultraviolet light from the sun on atmospheric oxygen', 'action of solar radiations particularly cosmic rays on carbon dioxide present in the atmosphere', 'lightning discharge in atmosphere', 'collision between fast neutrons and nitrogen nuclei present in the atmosphere');

-- --------------------------------------------------------

--
-- Table structure for table `testsubject`
--

CREATE TABLE `testsubject` (
  `ID` varchar(12) NOT NULL,
  `standard` varchar(100) NOT NULL,
  `subject` varchar(100) NOT NULL,
  `lastupdated` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `testsubject`
--

INSERT INTO `testsubject` (`ID`, `standard`, `subject`, `lastupdated`) VALUES
('1', '10', 'Tamil', '27-07-2020 21:41:31'),
('2', '10', 'English', '27-07-2020 23:11:54'),
('3', '10', 'Maths', ''),
('4', '10', 'Science', ''),
('5', '10', 'Social Science', ''),
('1', '12', 'Biology', ''),
('2', '12', 'Physics', ''),
('3', '12', 'Chemistry', ''),
('2', '1', 'English', ''),
('3', '1', 'Maths', ''),
('4', '1', 'Science', ''),
('5', '1', 'SocialScience', ''),
('1', '2', 'Tamil', ''),
('2', '2', 'English', ''),
('3', '2', 'Maths', ''),
('4', '2', 'Science', ''),
('5', '2', 'SocialScience', ''),
('1', '3', 'Tamil', ''),
('2', '3', 'English', ''),
('3', '3', 'Maths', ''),
('4', '3', 'Science', ''),
('5', '3', 'SocialScience', ''),
('1', '4', 'Tamil', ''),
('2', '4', 'English', ''),
('3', '4', 'Maths', ''),
('4', '4', 'Science', ''),
('5', '4', 'SocialScience', ''),
('1', '5', 'Tamil', ''),
('2', '5', 'English', ''),
('3', '5', 'Maths', ''),
('4', '5', 'Science', ''),
('5', '5', 'SocialScience', ''),
('1', '6', 'Tamil', ''),
('2', '6', 'English', ''),
('3', '6', 'Maths', ''),
('4', '6', 'Science', ''),
('5', '6', 'SocialScience', ''),
('1', '7', 'Tamil', ''),
('2', '7', 'English', ''),
('3', '7', 'Maths', ''),
('4', '7', 'Science', ''),
('5', '7', 'SocialScience', ''),
('1', '8', 'Tamil', ''),
('2', '8', 'English', ''),
('3', '8', 'Maths', ''),
('4', '8', 'Science', ''),
('5', '8', 'SocialScience', ''),
('1', '9', 'Tamil', ''),
('2', '9', 'English', ''),
('3', '9', 'Maths', ''),
('4', '9', 'Science', ''),
('5', '9', 'SocialScience', ''),
('1', '1', 'Tamil', ''),
('4', '12', 'Mathematics', '-'),
('5', '12', 'Tamil', '-'),
('6', '12', 'English', '-');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `Firstname` varchar(200) NOT NULL,
  `Lastname` varchar(200) NOT NULL,
  `email` varchar(200) NOT NULL,
  `DateofBirth` varchar(200) NOT NULL,
  `Gender` varchar(200) NOT NULL,
  `BloodGroup` varchar(200) NOT NULL,
  `Standard` varchar(200) NOT NULL,
  `Address` varchar(200) NOT NULL,
  `City` varchar(200) NOT NULL,
  `State` varchar(200) NOT NULL,
  `Zip` varchar(200) NOT NULL,
  `Phonenumber` varchar(200) NOT NULL,
  `Fathername` varchar(200) NOT NULL,
  `Mothername` varchar(200) NOT NULL,
  `parentsnumber` varchar(200) NOT NULL,
  `Parentsemail` varchar(200) NOT NULL,
  `Password` varchar(200) NOT NULL,
  `otp` varchar(100) NOT NULL,
  `Authentication` int(11) NOT NULL,
  `LastLogin` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`Firstname`, `Lastname`, `email`, `DateofBirth`, `Gender`, `BloodGroup`, `Standard`, `Address`, `City`, `State`, `Zip`, `Phonenumber`, `Fathername`, `Mothername`, `parentsnumber`, `Parentsemail`, `Password`, `otp`, `Authentication`, `LastLogin`) VALUES
('Arun', 'T', 'arunvibin12@gmail.com', '2018-07-14', 'Male', 'O+', '10', 'Namakkal(DT)', 'Coimbatore', 'Tamil Nadu', '637407', '6379101556', 'Thangarasu', 'Kavitha', '6379101556', 'arunvibin12@gmail.com', 'arun0209', '924084', 1, '13-08-2020 05:16:05'),
('Balaji', 'H', 'balaji@gmail.com', '12-12-2002', 'Male', 'b+ve', '10', 'panamarathupatti', 'salem', 'tamilnadu', '636008', '1234567', 'Harikrishnan', 'thagam', '12345678', 'balaji@gmail.com', 'balaji', '12345', 1, '10-08-2020 23:51:47'),
('Meiyazhagan', 'K', 'kmeiyazhagan14@gmail.com', '2020-08-19', 'Male', 'O+', '10', '3/183, Sithampoondi, (Po), Paramathi Velur(Tk), Namakkal(Dist).', 'Paramathi Velur', 'Tamil Nadu', '637203', '9080335279', 'Appa', 'Amma', '9080335279', 'appa@gmail.com', 'AuthUser', 'AuthUser', 1, '19-08-2020 05:31:17'),
('Navaneethan', 'Mahesh', 'navaneethannavee17@gmail.com', '2000-04-17', 'Male', 'B+ve', '12', 'Perumanallur', 'Tiruppur', 'Tamilnadu', '641666', '6380183244', 'Mahesh', 'Chitra', '9952374177', 'maheshpnrr@gmail.com', 'AuthUser', 'AuthUser', 1, '13-08-2020 07:56:37'),
('Navin', 'R K', 'navinbalaji1199@gmail.com', '1999-09-11', 'Male', '0-ve', '12', '7/2/227 Ayyandhirumaligai,Kannankurichi(po),salem-8', 'Salem', 'Tamil Nadu', '636008', '1234567890', 'k', 'm', '1234567890', 'navinbalaji1199@gmail.com', 'navin', '417901', 1, '14-08-2020 23:28:13'),
('Pasupathieswaran', 'V', 'pasupathi4cs@gmail.com', '2020-08-06', 'male', 'b+', '10', 'Salem', 'Salem', 'TAmil NAdu', '636007', '789797979', 'xxxxxxxxxxxx', 'yyyyyyyyyyyyyy', '7687678687', 'hshkjahdkj@email.com', 'AuthUser', 'AuthUser', 1, '12-08-2020 06:53:24'),
('sudharsan', 'v', 'sudharsanthirumalai27@gmail.com', '1999-09-27', 'male', 'B+', '10', '123,salem', 'salem', 'tamilnadu', '636006', '7010420002', 'venkat', 'lakxmi', '9345659594', 'venkat@gmail.com', 'asdf', '496326', 1, '17-08-2020 06:28:08');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`email`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

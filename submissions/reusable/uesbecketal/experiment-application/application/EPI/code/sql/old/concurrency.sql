-- phpMyAdmin SQL Dump
-- version 4.5.5.1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Oct 05, 2016 at 11:03 PM
-- Server version: 5.7.9
-- PHP Version: 5.6.24

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `concurrency`
--

-- --------------------------------------------------------

--
-- Table structure for table `codes`
--

CREATE TABLE `codes` (
  `code` int(11) NOT NULL,
  `desc` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `codes`
--

INSERT INTO `codes` (`code`, `desc`) VALUES
(1, 'start'),
(2, 'acceptConsent'),
(3, 'declineConsent'),
(4, 'classificationEnd'),
(5, 'sampleStart'),
(6, 'codeStart'),
(7, 'periodicCode'),
(8, 'codeFinished'),
(10, 'surveyEnd'),
(11, 'end'),
(12, 'codeCheck'),
(13, 'timeUpCodeSubmit'),
(14, 'sampleSwitch'),
(15, 'acceptConsentSurvey'),
(16, 'declineConsentSurvey'),
(17, 'acknowledgeSurveyInfo'),
(18, 'surveyQuestionFinished'),
(19, 'extraSurveyDone'),
(20, 'extraSurveyStart'),
(21, 'extraSurveyValidationError');

-- --------------------------------------------------------

--
-- Table structure for table `events`
--

CREATE TABLE `events` (
  `eventid` int(11) NOT NULL,
  `id` int(11) NOT NULL,
  `uuid` varchar(60) DEFAULT NULL,
  `event` int(11) NOT NULL,
  `category` int(11) DEFAULT NULL,
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `task` int(11) DEFAULT NULL,
  `entry` text,
  `output` text
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Stand-in structure for view `eventswithcodenames`
--
CREATE TABLE `eventswithcodenames` (
`eventid` int(11)
,`id` int(11)
,`event` int(11)
,`category` int(11)
,`time` timestamp
,`task` int(11)
,`entry` text
,`output` text
,`code` int(11)
,`desc` varchar(255)
);

-- --------------------------------------------------------

--
-- Table structure for table `extrasurvey`
--

CREATE TABLE `extrasurvey` (
  `id` int(11) NOT NULL,
  `uuid` varchar(60) DEFAULT NULL,
  `qid` varchar(60) NOT NULL,
  `optionname` varchar(60) NOT NULL,
  `value` int(11) NOT NULL,
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `language`
--

CREATE TABLE `language` (
  `year` char(25) NOT NULL,
  `nextLanguage` int(11) NOT NULL,
  `numL1` int(11) DEFAULT NULL,
  `numL2` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `language`
--

INSERT INTO `language` (`year`, `nextLanguage`, `numL1`, `numL2`) VALUES
('Freshman', 0, NULL, NULL),
('Graduate', 0, NULL, NULL),
('Junior', 0, NULL, NULL),
('Non-degree seeking', 0, NULL, NULL),
('Not Applicable', 0, NULL, NULL),
('Post-graduate', 0, NULL, NULL),
('Senior', 0, NULL, NULL),
('Sophomore', 0, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `participants`
--

CREATE TABLE `participants` (
  `id` int(11) NOT NULL,
  `email` varchar(255) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `courseNum` varchar(255) DEFAULT NULL,
  `courseName` varchar(255) DEFAULT NULL,
  `instructor` varchar(255) DEFAULT NULL,
  `lang` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `survey`
--

CREATE TABLE `survey` (
  `id` int(11) NOT NULL,
  `uuid` varchar(60) DEFAULT NULL,
  `totalxp` int(11) DEFAULT NULL,
  `jobxp` int(11) DEFAULT NULL,
  `education` char(25) DEFAULT NULL,
  `institution` varchar(255) DEFAULT NULL,
  `major` varchar(255) DEFAULT NULL,
  `degree` varchar(255) DEFAULT NULL,
  `year` char(25) DEFAULT NULL,
  `gpa` char(25) DEFAULT NULL,
  `origin` char(30) DEFAULT NULL,
  `language` char(30) DEFAULT NULL,
  `fluency` int(11) DEFAULT NULL,
  `colorBlind` tinyint(1) DEFAULT NULL,
  `lowVisual` tinyint(1) DEFAULT NULL,
  `blind` tinyint(1) DEFAULT NULL,
  `lowAural` tinyint(1) DEFAULT NULL,
  `deaf` tinyint(1) DEFAULT NULL,
  `motorImpaired` tinyint(1) DEFAULT NULL,
  `learning` tinyint(1) DEFAULT NULL,
  `age` int(11) DEFAULT NULL,
  `gender` char(10) DEFAULT NULL,
  `internxp` int(11) DEFAULT NULL,
  `lang1` int(11) DEFAULT NULL,
  `lang2` int(11) DEFAULT NULL,
  `lang3` int(11) DEFAULT NULL,
  `lang4` int(11) DEFAULT NULL,
  `lang5` int(11) DEFAULT NULL,
  `lang6` int(11) DEFAULT NULL,
  `lang7` int(11) DEFAULT NULL,
  `lang8` int(11) DEFAULT NULL,
  `lang9` int(11) DEFAULT NULL,
  `lang10` int(11) DEFAULT NULL,
  `lang11` int(11) DEFAULT NULL,
  `lang12` int(11) DEFAULT NULL,
  `lang13` int(11) DEFAULT NULL,
  `lang14` int(11) DEFAULT NULL,
  `lang15` int(11) DEFAULT NULL,
  `lang16` int(11) DEFAULT NULL,
  `lang17` int(11) DEFAULT NULL,
  `course1` char(10) DEFAULT NULL,
  `course2` char(10) DEFAULT NULL,
  `course3` char(10) DEFAULT NULL,
  `course4` char(10) DEFAULT NULL,
  `course5` char(10) DEFAULT NULL,
  `course6` char(10) DEFAULT NULL,
  `course7` char(10) DEFAULT NULL,
  `course8` char(10) DEFAULT NULL,
  `course9` char(10) DEFAULT NULL,
  `course10` char(10) DEFAULT NULL,
  `course11` char(10) DEFAULT NULL,
  `course12` char(10) DEFAULT NULL,
  `course13` char(10) DEFAULT NULL,
  `course14` char(10) DEFAULT NULL,
  `course15` char(10) DEFAULT NULL,
  `course16` char(10) DEFAULT NULL,
  `course17` char(10) DEFAULT NULL,
  `course18` char(10) DEFAULT NULL,
  `course19` char(10) DEFAULT NULL,
  `concepts` text,
  `design` text,
  `comments` text
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure for view `eventswithcodenames`
--
DROP TABLE IF EXISTS `eventswithcodenames`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `eventswithcodenames`  AS  select `events`.`eventid` AS `eventid`,`events`.`id` AS `id`,`events`.`event` AS `event`,`events`.`category` AS `category`,`events`.`time` AS `time`,`events`.`task` AS `task`,`events`.`entry` AS `entry`,`events`.`output` AS `output`,`codes`.`code` AS `code`,`codes`.`desc` AS `desc` from (`events` join `codes` on((`events`.`event` = `codes`.`code`))) ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `codes`
--
ALTER TABLE `codes`
  ADD PRIMARY KEY (`code`),
  ADD UNIQUE KEY `code` (`code`);

--
-- Indexes for table `events`
--
ALTER TABLE `events`
  ADD PRIMARY KEY (`eventid`);

--
-- Indexes for table `extrasurvey`
--
ALTER TABLE `extrasurvey`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `language`
--
ALTER TABLE `language`
  ADD PRIMARY KEY (`year`);

--
-- Indexes for table `participants`
--
ALTER TABLE `participants`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `survey`
--
ALTER TABLE `survey`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--


/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

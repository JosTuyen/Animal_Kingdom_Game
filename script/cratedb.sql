

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `cratedb`
--
DROP DATABASE IF EXISTS `cratedb`;
CREATE DATABASE `cratedb`;
USE `cratedb`;
-- --------------------------------------------------------

--
-- Table structure for table `puzzles`
--

DROP TABLE IF EXISTS `puzzles`;
CREATE TABLE `puzzles` (
   `seedlev` int(11) NOT NULL  COMMENT 'pk:  seed, with lastdig giving lev',
   `puzname`varchar(128) NOT NULL COMMENT 'name to show on list',
   `name` varchar(128) NOT NULL COMMENT 'Tag Name of the discoverer. fk to users',  
   `recname` varchar(128) NOT NULL COMMENT 'Tag of cur recordholder fk to users',
   `score` int(11) NOT NULL COMMENT 'record score',
   `when`  timestamp NOT NULL comment 'when record was set',
    PRIMARY KEY (`seedlev`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=8 ;

--
-- Dumping data for table `puzzles`
--

INSERT INTO `puzzles` VALUES(62341, 'Shifty', 'Doug', 'Doug', 112, '2013-10-03 13:37:57');
INSERT INTO `puzzles` VALUES(462341, 'Trouble', 'Bob', 'Doug', 12, '2013-10-03 13:37:57');
INSERT INTO `puzzles` VALUES(123421, 'Circle', 'Doug', 'Champ', 77, '2013-10-03 13:37:57');
INSERT INTO `puzzles` VALUES(223421, 'Circ', 'Doug', 'Doug', 77, '2013-10-03 13:37:57');
INSERT INTO `puzzles` VALUES(323421, 'Circxle', 'Doug', 'Doug', 77, '2012-10-03 13:37:57');
INSERT INTO `puzzles` VALUES(423421, 'Circyle', 'Doug', 'Champ', 77, '2013-10-03 13:37:57');
INSERT INTO `puzzles` VALUES(523421, 'Circzle', 'Doug', 'Doug', 77, '2013-10-03 13:37:57');
INSERT INTO `puzzles` VALUES(3421, 'Ciracle', 'Doug', 'Champ', 77, '2013-10-03 13:37:57');
INSERT INTO `puzzles` VALUES(2421, 'Cirbcle', 'Doug', 'Doug', 77, '2013-10-03 13:37:57');
INSERT INTO `puzzles` VALUES(64251, 'Square', 'Doug', 'Champ', 77, '2013-10-03 13:37:57');
INSERT INTO `puzzles` VALUES(62321, 'Sneaky', 'Doug', 'Champ', 77, '2013-10-03 13:37:57');
INSERT INTO `puzzles` VALUES(6421, 'Tiger', 'Doug', 'Bob', 77, '2013-10-03 13:37:57');
INSERT INTO `puzzles` VALUES(923421, 'Shark', 'Doug', 'Doug', 77, '2013-10-03 13:37:57');
INSERT INTO `puzzles` VALUES(683421, 'Tribble', 'Doug', 'Doug', 77, '2013-10-03 13:37:57');
INSERT INTO `puzzles` VALUES(673421, 'Dancer', 'Doug', 'Doug', 77, '2013-10-03 13:37:57');
INSERT INTO `puzzles` VALUES(663421, 'Circle', 'Doug', 'Doug', 77, '2013-10-03 13:37:57');


-- --------------------------------------------------------

--
-- Table structure for table `scores`
--
/*
DROP TABLE IF EXISTS `scores`;
CREATE TABLE `scores` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL COMMENT 'Foreign Key for users table',
  `game_id` int(11) NOT NULL COMMENT 'Foreign Key for games table',
  `outcome` int(1) NOT NULL COMMENT 'negative means lost, 0 means tie, positive means won',
  `gametime` int(11) NOT NULL COMMENT 'Length of the game in seconds',
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=79 ;

--
-- Dumping data for table `scores`
--

INSERT INTO `scores` VALUES(1, 1, 1, 1, 500, '2010-11-05 14:38:04');
INSERT INTO `scores` VALUES(2, 1, 1, -1, 700, '2010-11-04 14:37:57');
INSERT INTO `scores` VALUES(3, 1, 1, -1, 660, '2010-11-02 14:37:57');
INSERT INTO `scores` VALUES(4, 1, 1, 1, 480, '2010-11-02 14:47:57');
INSERT INTO `scores` VALUES(5, 1, 1, -1, 610, '2010-11-03 14:37:57');
INSERT INTO `scores` VALUES(6, 1, 1, -1, 605, '2010-11-03 13:37:57');
INSERT INTO `scores` VALUES(7, 1, 1, -1, 400, '2010-11-03 15:37:57');
INSERT INTO `scores` VALUES(8, 1, 1, 1, 600, '2010-11-02 16:37:57');
INSERT INTO `scores` VALUES(9, 1, 1, -1, 700, '2010-11-02 10:37:57');
INSERT INTO `scores` VALUES(10, 1, 1, -1, 900, '2010-11-02 11:37:57');
INSERT INTO `scores` VALUES(11, 1, 1, -1, 760, '2010-10-02 14:37:57');
INSERT INTO `scores` VALUES(12, 1, 1, 1, 520, '2010-10-02 14:47:57');
INSERT INTO `scores` VALUES(13, 1, 1, -1, 600, '2010-10-03 14:37:57');
INSERT INTO `scores` VALUES(14, 1, 1, -1, 620, '2010-10-03 13:37:57');
INSERT INTO `scores` VALUES(15, 1, 1, -1, 670, '2010-10-03 15:37:57');
INSERT INTO `scores` VALUES(16, 1, 1, 1, 470, '2010-10-02 16:37:57');
INSERT INTO `scores` VALUES(17, 1, 1, -1, 500, '2010-10-02 10:37:57');
INSERT INTO `scores` VALUES(18, 1, 1, -1, 360, '2010-10-02 11:37:57');
INSERT INTO `scores` VALUES(19, 3, 1, 1, 360, '2010-11-05 14:38:04');
INSERT INTO `scores` VALUES(20, 3, 1, 1, 720, '2010-11-04 14:37:57');
INSERT INTO `scores` VALUES(21, 3, 1, -1, 660, '2010-11-02 14:37:57');
INSERT INTO `scores` VALUES(22, 3, 1, 1, 520, '2010-11-02 14:47:57');
INSERT INTO `scores` VALUES(23, 3, 1, 1, 540, '2010-11-03 14:37:57');
INSERT INTO `scores` VALUES(24, 3, 1, -1, 480, '2010-11-03 13:37:57');
INSERT INTO `scores` VALUES(25, 3, 1, -1, 600, '2010-11-03 15:37:57');
INSERT INTO `scores` VALUES(26, 3, 1, 1, 600, '2010-11-02 16:37:57');
INSERT INTO `scores` VALUES(27, 3, 1, -1, 500, '2010-11-02 10:37:57');
INSERT INTO `scores` VALUES(28, 3, 1, -1, 400, '2010-11-02 11:37:57');
INSERT INTO `scores` VALUES(29, 3, 1, 1, 480, '2010-10-02 14:37:57');
INSERT INTO `scores` VALUES(30, 3, 1, 1, 360, '2010-10-02 14:47:57');
INSERT INTO `scores` VALUES(31, 3, 1, -1, 540, '2010-10-03 14:37:57');
INSERT INTO `scores` VALUES(32, 3, 1, 1, 600, '2010-10-03 13:37:57');
INSERT INTO `scores` VALUES(33, 3, 1, 1, 700, '2010-10-03 15:37:57');
INSERT INTO `scores` VALUES(34, 3, 1, 1, 400, '2010-10-02 16:37:57');
INSERT INTO `scores` VALUES(35, 3, 1, -1, 440, '2010-10-02 10:37:57');
INSERT INTO `scores` VALUES(36, 3, 1, 1, 600, '2010-10-02 11:37:57');
INSERT INTO `scores` VALUES(37, 4, 1, 1, 500, '2010-11-05 14:38:04');
INSERT INTO `scores` VALUES(38, 4, 1, 1, 700, '2010-11-04 14:37:57');
INSERT INTO `scores` VALUES(39, 4, 1, -1, 650, '2010-11-02 14:37:57');
INSERT INTO `scores` VALUES(40, 4, 1, 1, 500, '2010-11-02 14:47:57');
INSERT INTO `scores` VALUES(41, 4, 1, 1, 600, '2010-11-03 14:37:57');
INSERT INTO `scores` VALUES(42, 4, 1, -1, 605, '2010-11-03 13:37:57');
INSERT INTO `scores` VALUES(43, 4, 1, -1, 320, '2010-11-03 15:37:57');
INSERT INTO `scores` VALUES(44, 4, 1, 1, 440, '2010-11-02 16:37:57');
INSERT INTO `scores` VALUES(45, 4, 1, -1, 360, '2010-11-02 10:37:57');
INSERT INTO `scores` VALUES(46, 4, 1, -1, 200, '2010-11-02 11:37:57');
INSERT INTO `scores` VALUES(47, 4, 1, 1, 700, '2010-10-02 14:37:57');
INSERT INTO `scores` VALUES(48, 4, 1, 1, 350, '2010-10-02 14:47:57');
INSERT INTO `scores` VALUES(49, 4, 1, -1, 540, '2010-10-03 14:37:57');
INSERT INTO `scores` VALUES(50, 4, 1, -1, 600, '2010-10-03 13:37:57');
INSERT INTO `scores` VALUES(51, 4, 1, 1, 500, '2010-10-03 15:37:57');
INSERT INTO `scores` VALUES(52, 4, 1, 1, 700, '2010-10-02 16:37:57');
INSERT INTO `scores` VALUES(53, 4, 1, 1, 800, '2010-10-02 10:37:57');
INSERT INTO `scores` VALUES(54, 4, 1, 1, 610, '2010-10-02 11:37:57');
INSERT INTO `scores` VALUES(55, 1, 1, -1, 500, '2010-11-05 14:38:04');
INSERT INTO `scores` VALUES(56, 1, 1, -1, 700, '2010-11-04 14:37:57');
INSERT INTO `scores` VALUES(57, 1, 1, -1, 650, '2010-11-02 14:37:57');
INSERT INTO `scores` VALUES(58, 1, 1, -1, 500, '2010-11-02 14:47:57');
INSERT INTO `scores` VALUES(59, 1, 1, -1, 600, '2010-11-03 14:37:57');
INSERT INTO `scores` VALUES(60, 1, 1, -1, 605, '2010-11-03 13:37:57');
INSERT INTO `scores` VALUES(61, 1, 1, -1, 320, '2010-11-03 15:37:57');
INSERT INTO `scores` VALUES(62, 1, 1, -1, 440, '2010-11-02 16:37:57');
INSERT INTO `scores` VALUES(63, 1, 1, -1, 360, '2010-11-02 10:37:57');
INSERT INTO `scores` VALUES(64, 1, 1, -1, 200, '2010-11-02 11:37:57');
INSERT INTO `scores` VALUES(65, 1, 1, -1, 700, '2010-10-02 14:37:57');
INSERT INTO `scores` VALUES(66, 1, 1, -1, 350, '2010-10-02 14:47:57');
INSERT INTO `scores` VALUES(67, 1, 1, -1, 540, '2010-10-03 14:37:57');
INSERT INTO `scores` VALUES(68, 1, 1, -1, 600, '2010-10-03 13:37:57');
INSERT INTO `scores` VALUES(69, 1, 1, -1, 500, '2010-10-03 15:37:57');
INSERT INTO `scores` VALUES(70, 1, 1, -1, 700, '2010-10-02 16:37:57');
INSERT INTO `scores` VALUES(71, 1, 1, -1, 800, '2010-10-02 10:37:57');
INSERT INTO `scores` VALUES(72, 1, 1, -1, 610, '2010-10-02 11:37:57');
INSERT INTO `scores` VALUES(73, 5, 1, 1, 600, '2010-10-03 13:37:57');
INSERT INTO `scores` VALUES(74, 5, 1, 1, 500, '2010-10-03 15:37:57');
INSERT INTO `scores` VALUES(75, 5, 1, 1, 700, '2010-10-02 16:37:57');
INSERT INTO `scores` VALUES(76, 5, 1, 1, 800, '2010-10-02 10:37:57');
INSERT INTO `scores` VALUES(77, 5, 1, 1, 610, '2010-10-02 11:37:57');
INSERT INTO `scores` VALUES(78, 5, 1, 1, 540, '2010-10-03 14:37:57');

-- --------------------------------------------------------
*/
--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (  
  `tag` varchar(128) NOT NULL COMMENT 'for display in puzzle list',
  `info` varchar(128) COMMENT 'whatever for future use',
  `password` varchar(32) NOT NULL COMMENT 'User password stored as an MD5 hash',
  `email` varchar(32) NOT NULL COMMENT 'PK: used for authentication also',
  PRIMARY KEY (`email`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `users`
--

INSERT INTO `users` VALUES( 'Doug', NULL,            MD5('tater'), 'doug@usd.edu');
INSERT INTO `users` VALUES( 'Champ', NULL,            MD5('tater'), 'djennewe@usd.edu');
INSERT INTO `users` VALUES( 'Bob', 'really Joe',  MD5('tater'), 'joe.reynoldson@gmail.com');


/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

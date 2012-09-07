use psych;
delimiter $$

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";

--
-- Database: `psych`
--

-- --------------------------------------------------------

--
-- Table structure for table `messagearchive`
--
delimiter $$
CREATE TABLE IF NOT EXISTS `messagearchive` (
  `id` int(11) NOT NULL,
  `added` varchar(20) NOT NULL,
  `toNumber` varchar(20) NOT NULL,
  `fromNumber` varchar(20) NOT NULL,
  `message` varchar(170) NOT NULL,
  `timeout` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1$$;

--
-- Dumping data for table `messagearchive`
--

INSERT INTO `psych`.`messagearchive` (`id`, `added`, `toNumber`, `fromNumber`, `message`, `timeout`) VALUES
(41, '08:00:19 PM', '+17706956434', '424-223-5737', 'Psych!!', 10),
(43, '08:02:42 PM', '+17706956434', '424-223-5737', 'Psych!!', 10),
(44, '08:13:14 PM', '+17706956434', '424-223-5737', 'Psych!!', 10);

-- --------------------------------------------------------

--
-- Table structure for table `messagequarantine`
--
delimiter $$
CREATE TABLE IF NOT EXISTS `messagequarantine` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `added` varchar(20) NOT NULL,
  `toNumber` varchar(20) NOT NULL,
  `fromNumber` varchar(20) NOT NULL,
  `message` varchar(170) NOT NULL,
  `timeout` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  AUTO_INCREMENT=47 DEFAULT CHARSET=latin1$$




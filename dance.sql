


SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";

CREATE TABLE `admin` (
  `aid` int(11) NOT NULL,
  `name` varchar(30) NOT NULL,
  `psw` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO `admin` (`aid`, `name`, `psw`) VALUES
(1, 'admin', 'admin');

CREATE TABLE `coach` (
  `cid` int(11) NOT NULL,
  `wid` int(11) NOT NULL,
  `cname` varchar(30) NOT NULL,
  `uname` varchar(30) NOT NULL,
  `gender` varchar(10) NOT NULL,
  `dstyle` varchar(30) NOT NULL,
  `psw` varchar(30) NOT NULL,
  `email` varchar(50) NOT NULL,
  `cselect` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO `coach` (`cid`, `wid`, `cname`, `uname`, `gender`, `dstyle`, `psw`, `email`, `cselect`) VALUES
(1, 0, 'Rajesh', 'rajesh', 'Male', 'Free Style', 'rajesh', 'raj@gmail.com', 'Not Action'),
(2, 0, 'Rajeev', 'rajeev', 'Male', 'Bharatanatyam', 'rajeev', 'rajeev@gmail.com', 'Not Action'),
(3, 0, 'Nayana', 'nayana', 'Female', 'Ballet', 'nayana', 'n@gmail.com', 'Not Action'),
(4, 0, 'anusha', 'anu', 'Female', 'Bharatanatyam', 'anu', 'anu@gmail.com', 'Not Action'),
(5, 3, 'NIKITA', 'NIKITA', 'Female', 'Bharatanatyam', '1234', 'abcd@gmail.com', 'Selected');

CREATE TABLE `performer` (
  `pid` int(11) NOT NULL,
  `wid` int(11) NOT NULL,
  `pname` varchar(30) NOT NULL,
  `uname` varchar(30) NOT NULL,
  `age` varchar(10) NOT NULL,
  `email` varchar(50) NOT NULL,
  `psw` varchar(20) NOT NULL,
  `dance_style` varchar(20) NOT NULL,
  `dtime` varchar(20) NOT NULL,
  `ddate` date NOT NULL,
  `bookingdate` date NOT NULL,
  `payment` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO `performer` (`pid`, `wid`, `pname`, `uname`, `age`, `email`, `psw`, `dance_style`, `dtime`, `ddate`, `bookingdate`, `payment`) VALUES
(3, 0, 'Nimisha', 'nimisha', '20', 'ni@gmail.com','nimisha', 'Bharatanatyam', '9 am', '2019-11-29', '2019-11-23', 'not'),
(5, 0, 'chaitra', 'chai', '20', 'chai@gmail.com','chai', 'Kathakali', '9 am', '2019-11-24', '2019-11-23', 'not'),
(6, 0, 'preethi', 'pre', '20', 'preethi@gmail.com','pree', 'Free Style', '9 am', '2019-11-24', '2019-11-23', 'not');

CREATE TABLE `workshop` (
  `wid` int(11) NOT NULL,
  `wname` varchar(40) NOT NULL,
  `wdate` date NOT NULL,
  `venue` varchar(50) NOT NULL,
  `fees` varchar(10) NOT NULL,
  `wshow` int(11) NOT NULL,
  `wdesc` varchar(150) NOT NULL,
  `wtime` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO `workshop` (`wid`, `wname`, `wdate`, `venue`, `fees`, `wshow`, `wdesc`, `wtime`) VALUES
(1, 'Hook Crook', '2024-03-24', 'Bangalore', '1000', 0, 'Dreams Becomes Reality Overhere', '9 am'),
(2, 'summer workshop', '2024-03-30', 'mangalore', '500', 0, 'beach side workshop for one week', '9am '),
(3, 'KALAKRUTHI', '2024-03-30', 'MANGALORE', '500', 1, 'dance your own style', '10 AM');

DELIMITER $$
CREATE TRIGGER `func` AFTER UPDATE ON `workshop` FOR EACH ROW UPDATE performer SET wid='0',payment='not';
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `func1` BEFORE UPDATE ON `workshop` FOR EACH ROW UPDATE coach SET wid='0',cselect='Not Action';
$$
DELIMITER ;

ALTER TABLE `admin`
  ADD PRIMARY KEY (`aid`);

ALTER TABLE `coach`
  ADD PRIMARY KEY (`cid`);

ALTER TABLE `performer`
  ADD PRIMARY KEY (`pid`);

ALTER TABLE `workshop`
  ADD PRIMARY KEY (`wid`);

ALTER TABLE `admin`
  MODIFY `aid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

ALTER TABLE `coach`
  MODIFY `cid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

ALTER TABLE `performer`
  MODIFY `pid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

ALTER TABLE `workshop`
  MODIFY `wid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

ALTER TABLE `coach`
  ADD CONSTRAINT `fk_coach_workshop` FOREIGN KEY (`wid`) REFERENCES `workshop` (`wid`) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE `performer`
  ADD CONSTRAINT `fk_performer_workshop` FOREIGN KEY (`wid`) REFERENCES `workshop` (`wid`) ON DELETE CASCADE ON UPDATE CASCADE;

COMMIT;


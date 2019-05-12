-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Sep 21, 2017 at 09:09 AM
-- Server version: 10.1.16-MariaDB
-- PHP Version: 7.0.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `company`
--

CREATE DATABASE COMPANY;

USE COMPANY;
-- --------------------------------------------------------

--
-- Table structure for table `department`
--

CREATE TABLE `department` (
  `dname` varchar(20) NOT NULL,
  `dnumber` int(11) NOT NULL,
  `mgr_ssn` varchar(20) NOT NULL,
  `mgr_start_date` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `department`
--

INSERT INTO `department` (`dname`, `dnumber`, `mgr_ssn`, `mgr_start_date`) VALUES
('Headquarters', 1, '888665555', '1981-06-19'),
('Administration', 4, '987654321', '1995-01-01'),
('Research', 5, '333445555', '1988-05-22');

-- --------------------------------------------------------

--
-- Table structure for table `department_locations`
--

CREATE TABLE `department_locations` (
  `dnumber` int(11) NOT NULL,
  `dlocation` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `department_locations`
--

INSERT INTO `department_locations` (`dnumber`, `dlocation`) VALUES
(1, 'Houston'),
(4, 'Stafford'),
(5, 'Bellaire'),
(5, 'Houston'),
(5, 'Sugarland');

-- --------------------------------------------------------

--
-- Table structure for table `dependent`
--

CREATE TABLE `dependent` (
  `essn` varchar(20) NOT NULL,
  `dependent_name` varchar(20) NOT NULL,
  `sex` varchar(10) NOT NULL,
  `bdate` date NOT NULL,
  `relationship` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `dependent`
--

INSERT INTO `dependent` (`essn`, `dependent_name`, `sex`, `bdate`, `relationship`) VALUES
('123456789', 'Elizabeth', 'F', '1967-05-05', 'spouse'),
('123456789', 'michael', 'M', '1988-01-04', 'son'),
('333445555', 'Alice', 'F', '1986-04-05', 'daughter'),
('333445555', 'joy', 'F', '1958-05-03', 'spouse'),
('333445555', 'Theodore', 'M', '1983-10-25', 'son'),
('987654321', 'abner', 'M', '1942-02-28', 'spouse');

-- --------------------------------------------------------

--
-- Table structure for table `employee`
--

CREATE TABLE `employee` (
  `fname` varchar(20) NOT NULL,
  `minit` varchar(20) DEFAULT NULL,
  `lname` varchar(20) NOT NULL,
  `ssn` varchar(20) NOT NULL,
  `bdate` varchar(20) NOT NULL,
  `address` varchar(40) NOT NULL,
  `sex` varchar(10) NOT NULL,
  `salary` float NOT NULL,
  `super_ssn` varchar(20) NOT NULL,
  `dno` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `employee`
--

INSERT INTO `employee` (`fname`, `minit`, `lname`, `ssn`, `bdate`, `address`, `sex`, `salary`, `super_ssn`, `dno`) VALUES
('John', 'B', 'Smith', '123456789', '1965-01-09', '731 Fondren,Houston,TX', 'M', 30000, '333445555', 5),
('Franklin', 'T', 'Wong', '333445555', '1955-12-08', '638 Voss,Houston,TX', 'M', 40000, '888665555', 5),
('Joyce', 'A', 'English', '453453453', '1972-07-31', '5631 Rice Oak,Houston,TX', 'F', 25000, '333445555', 5),
('Ramesh', 'K', 'Narayan', '666884444', '1962-09-15', '971 Fire Oak,Humble,TX', 'M', 38000, '333445555', 5),
('James', 'E', 'Borg', '888665555', '1937-11-10', '450 Stone,Houston,TX', 'M', 55000, '', 1),
('Jennifer', 'S', 'Wallace', '987654321', '1941-06-20', '291 Berry,Bellaire,TX', 'F', 43000, '888665555', 4),
('Ahmad', 'V', 'Jabbar', '987987987', '1969-03-29', '980 Dallas,Houston,TX', 'M', 25000, '987654321', 4),
('Alicia', 'J', 'Zelaya', '999887777', '1968-01-19', '3321 Castle,Spring,TX', 'F', 25000, '987654321', 4);

-- --------------------------------------------------------

--
-- Table structure for table `project`
--

CREATE TABLE `project` (
  `project_name` varchar(20) NOT NULL,
  `project_id` int(11) NOT NULL,
  `location` varchar(20) NOT NULL,
  `department_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `project`
--

INSERT INTO `project` (`project_name`, `project_id`, `location`, `department_id`) VALUES
('ProductX', 1, 'Bellaire', 5),
('ProductY', 2, 'Sugarland', 5),
('ProductZ', 3, 'Houston', 5),
('Computerization', 10, 'Stafford', 4),
('Reorganization', 20, 'Houston', 1),
('Newbenefits', 30, 'Stafford', 4);

-- --------------------------------------------------------

--
-- Table structure for table `works_on`
--

CREATE TABLE `works_on` (
  `w_ssn` varchar(20) NOT NULL,
  `w_project_id` int(11) NOT NULL,
  `hours` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `works_on`
--

INSERT INTO `works_on` (`w_ssn`, `w_project_id`, `hours`) VALUES
('123456789', 1, 32.5),
('123456789', 2, 7.5),
('333445555', 2, 10),
('333445555', 3, 10),
('333445555', 10, 10),
('333445555', 20, 10),
('453453453', 1, 20),
('453453453', 2, 20),
('666884444', 3, 40),
('888665555', 20, 0),
('987654321', 20, 15),
('987654321', 30, 20),
('987987987', 10, 35),
('987987987', 30, 5),
('999887777', 10, 10),
('999887777', 30, 30);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `department`
--
ALTER TABLE `department`
  ADD PRIMARY KEY (`dnumber`);

--
-- Indexes for table `department_locations`
--
ALTER TABLE `department_locations`
  ADD PRIMARY KEY (`dnumber`,`dlocation`),
  ADD KEY `l_dept_id` (`dnumber`),
  ADD KEY `location` (`dlocation`),
  ADD KEY `l_dept_id_2` (`dnumber`),
  ADD KEY `location_2` (`dlocation`);

--
-- Indexes for table `dependent`
--
ALTER TABLE `dependent`
  ADD PRIMARY KEY (`essn`,`dependent_name`),
  ADD KEY `essn` (`essn`);

--
-- Indexes for table `employee`
--
ALTER TABLE `employee`
  ADD PRIMARY KEY (`ssn`),
  ADD KEY `super_ssn` (`super_ssn`);

--
-- Indexes for table `project`
--
ALTER TABLE `project`
  ADD PRIMARY KEY (`project_id`);

--
-- Indexes for table `works_on`
--
ALTER TABLE `works_on`
  ADD PRIMARY KEY (`w_ssn`,`w_project_id`),
  ADD KEY `w_ssn` (`w_ssn`),
  ADD KEY `w_project_id` (`w_project_id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Dec 02, 2024 at 04:31 PM
-- Server version: 5.7.36
-- PHP Version: 7.4.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `mediscoop`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

DROP TABLE IF EXISTS `admin`;
CREATE TABLE IF NOT EXISTS `admin` (
  `admin_id` int(10) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `first_name` varchar(255) DEFAULT NULL,
  `last_name` varchar(255) DEFAULT NULL,
  `email` varchar(255) NOT NULL,
  `contact_number` varchar(20) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`admin_id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`admin_id`, `username`, `password`, `first_name`, `last_name`, `email`, `contact_number`, `address`) VALUES
(1, 'admin', 'admin', NULL, NULL, 'admin', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `appointments`
--

DROP TABLE IF EXISTS `appointments`;
CREATE TABLE IF NOT EXISTS `appointments` (
  `app_id` int(11) NOT NULL AUTO_INCREMENT,
  `patient_id` int(11) DEFAULT NULL,
  `patient_email` varchar(255) DEFAULT NULL,
  `doctor_name` varchar(255) DEFAULT NULL,
  `diseases` varchar(255) DEFAULT NULL,
  `app_date` date DEFAULT NULL,
  `message` text,
  PRIMARY KEY (`app_id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `appointments`
--

INSERT INTO `appointments` (`app_id`, `patient_id`, `patient_email`, `doctor_name`, `diseases`, `app_date`, `message`) VALUES
(1, 1, 'john.doe@example.com', 'doc1', 'Fever', '2023-11-02', '\"Not feeling well.\"'),
(2, 2, 'jane.smith@example.com', 'doc2', 'Headache', '2023-10-27', 'Frequent headaches'),
(3, 3, 'robert.johnson@example.com', 'doc4', 'Back pain', '2023-11-03', 'Severe lower back pain');

-- --------------------------------------------------------

--
-- Table structure for table `doctor`
--

DROP TABLE IF EXISTS `doctor`;
CREATE TABLE IF NOT EXISTS `doctor` (
  `doctor_id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `first_name` varchar(255) DEFAULT NULL,
  `last_name` varchar(255) DEFAULT NULL,
  `phone_number` varchar(20) DEFAULT NULL,
  `gender` varchar(10) DEFAULT NULL,
  `date_of_birth` date DEFAULT NULL,
  `about_me` text,
  `address` text,
  `specialization` varchar(255) DEFAULT NULL,
  `reg_date` datetime DEFAULT NULL,
  PRIMARY KEY (`doctor_id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `doctor`
--

INSERT INTO `doctor` (`doctor_id`, `username`, `password`, `email`, `first_name`, `last_name`, `phone_number`, `gender`, `date_of_birth`, `about_me`, `address`, `specialization`, `reg_date`) VALUES
(1, 'doc1', 'doc1', 'doc1@example.com', 'John', 'Doe', '1234567890', 'Male', '1985-05-15', 'About Me', '123 Main Street', 'cardiologist', '2023-10-24 23:10:33'),
(2, 'doc2', 'doc2', 'doc2@example.com', 'Jane', 'Smith', '9876543210', 'Female', '2023-10-02', 'About ', '456 Oak Avenue', 'dermatologist', '2023-10-25 11:20:29'),
(3, 'doc3', 'doc3', 'doc3@example.com', 'Michael', 'Johnson', '5551234567', 'Male', '1994-06-06', 'About Me	', '789 Pine Road', 'pediatrician', '2023-10-25 11:21:46'),
(4, 'doc4', 'doc4', 'doc4@example.com', 'Sarah', 'Davis', '4447890123', 'Female', '1983-05-18', 'About ', '101 Cedar Lane', 'neurologist', '2023-10-25 11:22:42'),
(5, 'doc5', 'doc5', 'doc5@example.com', 'Robert', 'Brown', '6662223333', 'Male', '1991-06-11', 'About Me	', '202 Willow Boulevard', 'orthopedic_surgeon', '2023-10-25 11:23:39');

-- --------------------------------------------------------

--
-- Table structure for table `patient`
--

DROP TABLE IF EXISTS `patient`;
CREATE TABLE IF NOT EXISTS `patient` (
  `patient_id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `first_name` varchar(255) DEFAULT NULL,
  `last_name` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `phone_number` varchar(20) DEFAULT NULL,
  `gender` varchar(10) DEFAULT NULL,
  `date_of_birth` varchar(10) DEFAULT NULL,
  `blood_group` varchar(10) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `city` varchar(50) DEFAULT NULL,
  `state` varchar(255) DEFAULT NULL,
  `zip_code` varchar(10) DEFAULT NULL,
  `reg_date` datetime DEFAULT NULL,
  PRIMARY KEY (`patient_id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `patient`
--

INSERT INTO `patient` (`patient_id`, `username`, `password`, `first_name`, `last_name`, `email`, `phone_number`, `gender`, `date_of_birth`, `blood_group`, `address`, `city`, `state`, `zip_code`, `reg_date`) VALUES
(1, 'patient1', 'patient1', 'John', 'Doe', 'john.doe@example.com', '123-456-7890', 'Male', '2023-09-13', 'AB+', '123 Main St', 'Anytown', 'CA', '12345', '2023-10-25 11:26:22'),
(2, 'patient2', 'patient2', 'Jane', 'Smith', 'jane.smith@example.com', '987-654-3210', 'Female', '2023-09-18', 'B-', '456 Elm St', 'Smallville', 'NY', '54321', '2023-10-25 11:27:23'),
(3, 'patient3', 'patient3', 'Robert', 'Johnson', 'robert.johnson@example.com', '555-123-7890', 'Male', '2023-10-02', 'O+', '789 Oak St', 'Metroville', 'TX', '67890', '2023-10-25 11:28:10'),
(4, 'patient4', 'patient4', 'Maria', 'Garcia', 'maria.garcia@example.com', '333-555-9999', 'Female', '2023-08-29', 'AB+', '101 Pine St', 'Harbor City', 'CA', '56789', '2023-10-25 11:29:03'),
(5, 'patient5', 'patient5', 'Michael', 'Wilson', 'michael.wilson@example.com', ' 777-888-1111', 'Male', '2023-07-26', 'A-', '222 Cedar St', 'Lakeside', 'MI', '98765', '2023-10-25 11:29:52');

-- --------------------------------------------------------

--
-- Table structure for table `specialization`
--

DROP TABLE IF EXISTS `specialization`;
CREATE TABLE IF NOT EXISTS `specialization` (
  `specialization_id` int(11) NOT NULL AUTO_INCREMENT,
  `spc_name` varchar(255) NOT NULL,
  `spc_dec` text,
  `creation_date` datetime DEFAULT NULL,
  PRIMARY KEY (`specialization_id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `specialization`
--

INSERT INTO `specialization` (`specialization_id`, `spc_name`, `spc_dec`, `creation_date`) VALUES
(1, 'Cardiology', 'Specializes in heart-related issues.', '2023-10-25 11:31:04'),
(2, 'Orthopedics', 'Specializes in bone and joint problems.', '2023-10-25 11:31:12'),
(3, 'Dermatology', 'Specializes in skin diseases and conditions.', '2023-10-25 11:31:19'),
(4, 'Pediatrics', 'Specializes in medical care for infants, children, and adolescents.', '2023-10-25 11:31:26'),
(5, 'Ophthalmology', 'Specializes in eye care and diseases.', '2023-10-25 11:31:35');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

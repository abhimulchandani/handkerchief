-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 01, 2020 at 01:36 AM
-- Server version: 10.1.38-MariaDB
-- PHP Version: 7.3.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `handkerchief`
--

-- --------------------------------------------------------

--
-- Table structure for table `movie`
--

CREATE TABLE `movie` (
  `movie_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `language` varchar(255) NOT NULL,
  `genre` varchar(255) NOT NULL,
  `release_date` date NOT NULL,
  `age_certificate` varchar(30) NOT NULL,
  `format` varchar(30) NOT NULL,
  `runtime` int(11) NOT NULL,
  `poster` varchar(255) DEFAULT NULL,
  `rating` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `movie`
--

INSERT INTO `movie` (`movie_id`, `name`, `language`, `genre`, `release_date`, `age_certificate`, `format`, `runtime`, `poster`, `rating`) VALUES
(1, 'Andhadhun', 'Hindi', 'Crime, Thriller', '2018-10-05', 'U/A', '2D', 139, 'posters/Andhadhun.jpg', NULL),
(2, 'Raazi', 'Hindi', 'Action, Drama, Thriller', '2018-05-11', 'U/A', '2D', 138, 'posters/Raazi.jpg', NULL),
(3, 'Bhavesh Joshi Superhero', 'Hindi', 'Action, Drama', '2018-06-01', 'U/A', '2D', 154, 'posters/BhaveshJoshiSuperhero.jpg', NULL),
(4, 'Manto', 'Hindi', 'Biography, Drama', '2018-09-21', 'U/A', '2D', 112, 'posters/Manto.jpg', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `movie_rating`
--

CREATE TABLE `movie_rating` (
  `rating_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `movie_id` int(11) NOT NULL,
  `rating` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `movie_rating`
--

INSERT INTO `movie_rating` (`rating_id`, `user_id`, `movie_id`, `rating`) VALUES
(1, 1, 1, 100);

-- --------------------------------------------------------

--
-- Table structure for table `movie_show`
--

CREATE TABLE `movie_show` (
  `show_id` int(11) NOT NULL,
  `date` date NOT NULL,
  `time` time NOT NULL,
  `movie_id` int(11) NOT NULL,
  `screen_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `movie_show`
--

INSERT INTO `movie_show` (`show_id`, `date`, `time`, `movie_id`, `screen_id`) VALUES
(1, '2020-08-29', '22:00:00', 1, 1),
(2, '2020-08-29', '19:30:00', 1, 1),
(3, '2020-08-30', '22:00:00', 1, 1),
(4, '2020-08-30', '19:30:00', 1, 1),
(5, '2020-08-29', '17:15:00', 2, 1),
(6, '2020-08-29', '10:45:00', 2, 1),
(7, '2020-08-30', '17:15:00', 2, 1),
(8, '2020-08-30', '10:45:00', 2, 1),
(9, '2020-08-29', '14:00:00', 3, 1),
(10, '2020-08-30', '14:00:00', 3, 1),
(11, '2020-08-29', '09:30:00', 3, 2),
(12, '2020-08-30', '09:30:00', 3, 2),
(13, '2020-08-29', '12:45:00', 1, 2),
(14, '2020-08-29', '15:25:00', 3, 2),
(15, '2020-08-30', '12:45:00', 1, 2),
(16, '2020-08-30', '15:25:00', 3, 2),
(17, '2020-08-29', '21:00:00', 3, 2),
(18, '2020-08-30', '21:00:00', 3, 2),
(19, '2020-08-29', '18:15:00', 1, 2),
(20, '2020-08-30', '18:15:00', 1, 2),
(21, '2020-08-30', '08:30:00', 4, 1),
(22, '2020-08-29', '08:30:00', 4, 1);

-- --------------------------------------------------------

--
-- Table structure for table `screen`
--

CREATE TABLE `screen` (
  `screen_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `capacity` int(11) NOT NULL,
  `seat_map` longtext NOT NULL,
  `theatre_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `screen`
--

INSERT INTO `screen` (`screen_id`, `name`, `capacity`, `seat_map`, `theatre_id`) VALUES
(1, 'Screen 1', 143, '<html>\r\n	<head>\r\n		<style>\r\n			.seat\r\n			{\r\n				color: green;\r\n                width: 40px;\r\n                height: 40px;\r\n                text-align: center;\r\n                line-height: 40px;\r\n                border: 1px solid green;\r\n				border-radius: 12px;\r\n				margin: 5px;\r\n			}\r\n\r\n			.space\r\n			{\r\n                width: 40px;\r\n                height: 40px;\r\n                border: 1px dotted;\r\n				border-radius: 12px;\r\n				margin: 5px;\r\n				display: none;\r\n			}\r\n\r\n			.available\r\n            {\r\n                background-color: white;\r\n                color: green;\r\n            }\r\n            \r\n            .available:hover\r\n            {\r\n                cursor: pointer;\r\n				color: white;\r\n                background-color: green;\r\n            }\r\n\r\n            .booked\r\n            {\r\n                background-color: darkgray;\r\n                color: white;\r\n                border-color: darkgray; \r\n            }\r\n            \r\n            .booked:hover\r\n            {\r\n                cursor: default;\r\n                background-color: darkgray;\r\n                border-color: darkgray;\r\n            }\r\n            \r\n            .clicked\r\n            {\r\n                background-color: green;\r\n                color: white;\r\n                cursor: pointer;\r\n            }\r\n            \r\n		</style>\r\n	</head>\r\n	<body>\r\n		<div id=\'seatmap\' style=\"width: 900px; margin-left: auto; margin-right: auto;\">\r\n			<span class=\"text\">Platinum: &#8377; 200</span>\r\n			<hr>\r\n			<table>	\r\n				<tr>\r\n					<td><div class=\'seat available\' data-class=\'Platinum\' data-price=\'200\' onclick=\'clicked(this.id)\' id=\'A-1\'><span>A-1</span></div></td>\r\n					<td><div class=\'seat available\' data-class=\'Platinum\' data-price=\'200\' onclick=\'clicked(this.id)\' id=\'A-2\'><span>A-2</span></div></td>\r\n					<td><div class=\'seat available\' data-class=\'Platinum\' data-price=\'200\' onclick=\'clicked(this.id)\' id=\'A-3\'><span>A-3</span></div></td>\r\n					<td><div class=\'seat available\' data-class=\'Platinum\' data-price=\'200\' onclick=\'clicked(this.id)\' id=\'A-4\'><span>A-4</span></div></td>\r\n					<td><div class=\'space\'></div></td>\r\n					<td><div class=\'space\'></div></td>\r\n					<td><div class=\'space\'></div></td>\r\n					<td><div class=\'space\'></div></td>\r\n					<td><div class=\'space\'></div></td>\r\n					<td><div class=\'space\'></div></td>\r\n					<td><div class=\'space\'></div></td>\r\n					<td><div class=\'space\'></div></td>\r\n					<td><div class=\'space\'></div></td>\r\n					<td><div class=\'seat available\' data-class=\'Platinum\' data-price=\'200\' onclick=\'clicked(this.id)\' id=\'A-5\'><span>A-5</span></div></td>\r\n					<td><div class=\'seat available\' data-class=\'Platinum\' data-price=\'200\' onclick=\'clicked(this.id)\' id=\'A-6\'><span>A-6</span></div></td>\r\n					<td><div class=\'seat available\' data-class=\'Platinum\' data-price=\'200\' onclick=\'clicked(this.id)\' id=\'A-7\'><span>A-7</span></div></td>\r\n				</tr>\r\n				<tr>\r\n					<td><div class=\'seat available\' data-class=\'Platinum\' data-price=\'200\' onclick=\'clicked(this.id)\' id=\'B-1\'><span>B-1</span></div></td>\r\n					<td><div class=\'seat available\' data-class=\'Platinum\' data-price=\'200\' onclick=\'clicked(this.id)\' id=\'B-2\'><span>B-2</span></div></td>\r\n					<td><div class=\'seat available\' data-class=\'Platinum\' data-price=\'200\' onclick=\'clicked(this.id)\' id=\'B-3\'><span>B-3</span></div></td>\r\n					<td><div class=\'seat available\' data-class=\'Platinum\' data-price=\'200\' onclick=\'clicked(this.id)\' id=\'B-4\'><span>B-4</span></div></td>\r\n					<td><div class=\'space\'></div></td>\r\n					<td><div class=\'space\'></div></td>\r\n					<td><div class=\'space\'></div></td>\r\n					<td><div class=\'space\'></div></td>\r\n					<td><div class=\'space\'></div></td>\r\n					<td><div class=\'space\'></div></td>\r\n					<td><div class=\'space\'></div></td>\r\n					<td><div class=\'space\'></div></td>\r\n					<td><div class=\'seat available\' data-class=\'Platinum\' data-price=\'200\' onclick=\'clicked(this.id)\' id=\'B-5\'><span>B-5</span></div></td>\r\n					<td><div class=\'seat available\' data-class=\'Platinum\' data-price=\'200\' onclick=\'clicked(this.id)\' id=\'B-6\'><span>B-6</span></div></td>\r\n					<td><div class=\'seat available\' data-class=\'Platinum\' data-price=\'200\' onclick=\'clicked(this.id)\' id=\'B-7\'><span>B-7</span></div></td>\r\n					<td><div class=\'seat available\' data-class=\'Platinum\' data-price=\'200\' onclick=\'clicked(this.id)\' id=\'B-8\'><span>B-8</span></div></td>\r\n				</tr>\r\n				<tr>\r\n					<td><div class=\'seat available\' data-class=\'Platinum\' data-price=\'200\' onclick=\'clicked(this.id)\' id=\'C-1\'><span>C-1</span></div></td>\r\n					<td><div class=\'seat available\' data-class=\'Platinum\' data-price=\'200\' onclick=\'clicked(this.id)\' id=\'C-2\'><span>C-2</span></div></td>\r\n					<td><div class=\'seat available\' data-class=\'Platinum\' data-price=\'200\' onclick=\'clicked(this.id)\' id=\'C-3\'><span>C-3</span></div></td>\r\n					<td><div class=\'seat available\' data-class=\'Platinum\' data-price=\'200\' onclick=\'clicked(this.id)\' id=\'C-4\'><span>C-4</span></div></td>\r\n					<td><div class=\'seat available\' data-class=\'Platinum\' data-price=\'200\' onclick=\'clicked(this.id)\' id=\'C-5\'><span>C-5</span></div></td>\r\n					<td><div class=\'seat available\' data-class=\'Platinum\' data-price=\'200\' onclick=\'clicked(this.id)\' id=\'C-6\'><span>C-6</span></div></td>\r\n					<td><div class=\'seat available\' data-class=\'Platinum\' data-price=\'200\' onclick=\'clicked(this.id)\' id=\'C-7\'><span>C-7</span></div></td>\r\n					<td><div class=\'seat available\' data-class=\'Platinum\' data-price=\'200\' onclick=\'clicked(this.id)\' id=\'C-8\'><span>C-8</span></div></td>\r\n					<td><div class=\'seat available\' data-class=\'Platinum\' data-price=\'200\' onclick=\'clicked(this.id)\' id=\'C-9\'><span>C-9</span></div></td>\r\n					<td><div class=\'seat available\' data-class=\'Platinum\' data-price=\'200\' onclick=\'clicked(this.id)\' id=\'C-10\'><span>C-10</span></div></td>\r\n					<td><div class=\'seat available\' data-class=\'Platinum\' data-price=\'200\' onclick=\'clicked(this.id)\' id=\'C-11\'><span>C-11</span></div></td>\r\n					<td><div class=\'seat available\' data-class=\'Platinum\' data-price=\'200\' onclick=\'clicked(this.id)\' id=\'C-12\'><span>C-12</span></div></td>\r\n					<td><div class=\'seat available\' data-class=\'Platinum\' data-price=\'200\' onclick=\'clicked(this.id)\' id=\'C-13\'><span>C-13</span></div></td>\r\n					<td><div class=\'seat available\' data-class=\'Platinum\' data-price=\'200\' onclick=\'clicked(this.id)\' id=\'C-14\'><span>C-14</span></div></td>\r\n					<td><div class=\'seat available\' data-class=\'Platinum\' data-price=\'200\' onclick=\'clicked(this.id)\' id=\'C-15\'><span>C-15</span></div></td>\r\n					<td><div class=\'seat available\' data-class=\'Platinum\' data-price=\'200\' onclick=\'clicked(this.id)\' id=\'C-16\'><span>C-16</span></div></td>\r\n				</tr>\r\n				<tr>\r\n					<td><div class=\'seat available\' data-class=\'Platinum\' data-price=\'200\' onclick=\'clicked(this.id)\' id=\'D-1\'><span>D-1</span></div></td>\r\n					<td><div class=\'seat available\' data-class=\'Platinum\' data-price=\'200\' onclick=\'clicked(this.id)\' id=\'D-2\'><span>D-2</span></div></td>\r\n					<td><div class=\'seat available\' data-class=\'Platinum\' data-price=\'200\' onclick=\'clicked(this.id)\' id=\'D-3\'><span>D-3</span></div></td>\r\n					<td><div class=\'seat available\' data-class=\'Platinum\' data-price=\'200\' onclick=\'clicked(this.id)\' id=\'D-4\'><span>D-4</span></div></td>\r\n					<td><div class=\'seat available\' data-class=\'Platinum\' data-price=\'200\' onclick=\'clicked(this.id)\' id=\'D-5\'><span>D-5</span></div></td>\r\n					<td><div class=\'seat available\' data-class=\'Platinum\' data-price=\'200\' onclick=\'clicked(this.id)\' id=\'D-6\'><span>D-6</span></div></td>\r\n					<td><div class=\'seat available\' data-class=\'Platinum\' data-price=\'200\' onclick=\'clicked(this.id)\' id=\'D-7\'><span>D-7</span></div></td>\r\n					<td><div class=\'seat available\' data-class=\'Platinum\' data-price=\'200\' onclick=\'clicked(this.id)\' id=\'D-8\'><span>D-8</span></div></td>\r\n					<td><div class=\'seat available\' data-class=\'Platinum\' data-price=\'200\' onclick=\'clicked(this.id)\' id=\'D-9\'><span>D-9</span></div></td>\r\n					<td><div class=\'seat available\' data-class=\'Platinum\' data-price=\'200\' onclick=\'clicked(this.id)\' id=\'D-10\'><span>D-10</span></div></td>\r\n					<td><div class=\'seat available\' data-class=\'Platinum\' data-price=\'200\' onclick=\'clicked(this.id)\' id=\'D-11\'><span>D-11</span></div></td>\r\n					<td><div class=\'seat available\' data-class=\'Platinum\' data-price=\'200\' onclick=\'clicked(this.id)\' id=\'D-12\'><span>D-12</span></div></td>\r\n					<td><div class=\'seat available\' data-class=\'Platinum\' data-price=\'200\' onclick=\'clicked(this.id)\' id=\'D-13\'><span>D-13</span></div></td>\r\n					<td><div class=\'seat available\' data-class=\'Platinum\' data-price=\'200\' onclick=\'clicked(this.id)\' id=\'D-14\'><span>D-14</span></div></td>\r\n					<td><div class=\'seat available\' data-class=\'Platinum\' data-price=\'200\' onclick=\'clicked(this.id)\' id=\'D-15\'><span>D-15</span></div></td>\r\n					<td><div class=\'seat available\' data-class=\'Platinum\' data-price=\'200\' onclick=\'clicked(this.id)\' id=\'D-16\'><span>D-16</span></div></td>\r\n				</tr>\r\n				<tr>\r\n					<td><div class=\'seat available\' data-class=\'Platinum\' data-price=\'200\' onclick=\'clicked(this.id)\' id=\'E-1\'><span>E-1</span></div></td>\r\n					<td><div class=\'seat available\' data-class=\'Platinum\' data-price=\'200\' onclick=\'clicked(this.id)\' id=\'E-2\'><span>E-2</span></div></td>\r\n					<td><div class=\'seat available\' data-class=\'Platinum\' data-price=\'200\' onclick=\'clicked(this.id)\' id=\'E-3\'><span>E-3</span></div></td>\r\n					<td><div class=\'seat available\' data-class=\'Platinum\' data-price=\'200\' onclick=\'clicked(this.id)\' id=\'E-4\'><span>E-4</span></div></td>\r\n					<td><div class=\'seat available\' data-class=\'Platinum\' data-price=\'200\' onclick=\'clicked(this.id)\' id=\'E-5\'><span>E-5</span></div></td>\r\n					<td><div class=\'seat available\' data-class=\'Platinum\' data-price=\'200\' onclick=\'clicked(this.id)\' id=\'E-6\'><span>E-6</span></div></td>\r\n					<td><div class=\'seat available\' data-class=\'Platinum\' data-price=\'200\' onclick=\'clicked(this.id)\' id=\'E-7\'><span>E-7</span></div></td>\r\n					<td><div class=\'seat available\' data-class=\'Platinum\' data-price=\'200\' onclick=\'clicked(this.id)\' id=\'E-8\'><span>E-8</span></div></td>\r\n					<td><div class=\'seat available\' data-class=\'Platinum\' data-price=\'200\' onclick=\'clicked(this.id)\' id=\'E-9\'><span>E-9</span></div></td>\r\n					<td><div class=\'seat available\' data-class=\'Platinum\' data-price=\'200\' onclick=\'clicked(this.id)\' id=\'E-10\'><span>E-10</span></div></td>\r\n					<td><div class=\'seat available\' data-class=\'Platinum\' data-price=\'200\' onclick=\'clicked(this.id)\' id=\'E-11\'><span>E-11</span></div></td>\r\n					<td><div class=\'seat available\' data-class=\'Platinum\' data-price=\'200\' onclick=\'clicked(this.id)\' id=\'E-12\'><span>E-12</span></div></td>\r\n					<td><div class=\'seat available\' data-class=\'Platinum\' data-price=\'200\' onclick=\'clicked(this.id)\' id=\'E-13\'><span>E-13</span></div></td>\r\n					<td><div class=\'seat available\' data-class=\'Platinum\' data-price=\'200\' onclick=\'clicked(this.id)\' id=\'E-14\'><span>E-14</span></div></td>\r\n					<td><div class=\'seat available\' data-class=\'Platinum\' data-price=\'200\' onclick=\'clicked(this.id)\' id=\'E-15\'><span>E-15</span></div></td>\r\n					<td><div class=\'seat available\' data-class=\'Platinum\' data-price=\'200\' onclick=\'clicked(this.id)\' id=\'E-16\'><span>E-16</span></div></td>\r\n				</tr>\r\n			</table>\r\n\r\n			<span class=\"text\">Gold: &#8377; 180</span>\r\n			<hr>\r\n\r\n			<table>\r\n				<tr>\r\n					<td><div class=\'seat available\' data-class=\'Gold\' data-price=\'180\' onclick=\'clicked(this.id)\' id=\'F-1\'><span>F-1</span></div></td>\r\n					<td><div class=\'seat available\' data-class=\'Gold\' data-price=\'180\' onclick=\'clicked(this.id)\' id=\'F-2\'><span>F-2</span></div></td>\r\n					<td><div class=\'seat available\' data-class=\'Gold\' data-price=\'180\' onclick=\'clicked(this.id)\' id=\'F-3\'><span>F-3</span></div></td>\r\n					<td><div class=\'seat available\' data-class=\'Gold\' data-price=\'180\' onclick=\'clicked(this.id)\' id=\'F-4\'><span>F-4</span></div></td>\r\n					<td><div class=\'seat available\' data-class=\'Gold\' data-price=\'180\' onclick=\'clicked(this.id)\' id=\'F-5\'><span>F-5</span></div></td>\r\n					<td><div class=\'seat available\' data-class=\'Gold\' data-price=\'180\' onclick=\'clicked(this.id)\' id=\'F-6\'><span>F-6</span></div></td>\r\n					<td><div class=\'seat available\' data-class=\'Gold\' data-price=\'180\' onclick=\'clicked(this.id)\' id=\'F-7\'><span>F-7</span></div></td>\r\n					<td><div class=\'seat available\' data-class=\'Gold\' data-price=\'180\' onclick=\'clicked(this.id)\' id=\'F-8\'><span>F-8</span></div></td>\r\n					<td><div class=\'seat available\' data-class=\'Gold\' data-price=\'180\' onclick=\'clicked(this.id)\' id=\'F-9\'><span>F-9</span></div></td>\r\n					<td><div class=\'seat available\' data-class=\'Gold\' data-price=\'180\' onclick=\'clicked(this.id)\' id=\'F-10\'><span>F-10</span></div></td>\r\n					<td><div class=\'seat available\' data-class=\'Gold\' data-price=\'180\' onclick=\'clicked(this.id)\' id=\'F-11\'><span>F-11</span></div></td>\r\n					<td><div class=\'seat available\' data-class=\'Gold\' data-price=\'180\' onclick=\'clicked(this.id)\' id=\'F-12\'><span>F-12</span></div></td>\r\n					<td><div class=\'seat available\' data-class=\'Gold\' data-price=\'180\' onclick=\'clicked(this.id)\' id=\'F-13\'><span>F-13</span></div></td>\r\n					<td><div class=\'seat available\' data-class=\'Gold\' data-price=\'180\' onclick=\'clicked(this.id)\' id=\'F-14\'><span>F-14</span></div></td>\r\n					<td><div class=\'seat available\' data-class=\'Gold\' data-price=\'180\' onclick=\'clicked(this.id)\' id=\'F-15\'><span>F-15</span></div></td>\r\n					<td><div class=\'seat available\' data-class=\'Gold\' data-price=\'180\' onclick=\'clicked(this.id)\' id=\'F-16\'><span>F-16</span></div></td>\r\n				</tr>\r\n				<tr>\r\n					<td><div class=\'seat available\' data-class=\'Gold\' data-price=\'180\' onclick=\'clicked(this.id)\' id=\'G-1\'><span>G-1</span></div></td>\r\n					<td><div class=\'seat available\' data-class=\'Gold\' data-price=\'180\' onclick=\'clicked(this.id)\' id=\'G-2\'><span>G-2</span></div></td>\r\n					<td><div class=\'seat available\' data-class=\'Gold\' data-price=\'180\' onclick=\'clicked(this.id)\' id=\'G-3\'><span>G-3</span></div></td>\r\n					<td><div class=\'seat available\' data-class=\'Gold\' data-price=\'180\' onclick=\'clicked(this.id)\' id=\'G-4\'><span>G-4</span></div></td>\r\n					<td><div class=\'seat available\' data-class=\'Gold\' data-price=\'180\' onclick=\'clicked(this.id)\' id=\'G-5\'><span>G-5</span></div></td>\r\n					<td><div class=\'seat available\' data-class=\'Gold\' data-price=\'180\' onclick=\'clicked(this.id)\' id=\'G-6\'><span>G-6</span></div></td>\r\n					<td><div class=\'seat available\' data-class=\'Gold\' data-price=\'180\' onclick=\'clicked(this.id)\' id=\'G-7\'><span>G-7</span></div></td>\r\n					<td><div class=\'seat available\' data-class=\'Gold\' data-price=\'180\' onclick=\'clicked(this.id)\' id=\'G-8\'><span>G-8</span></div></td>\r\n					<td><div class=\'seat available\' data-class=\'Gold\' data-price=\'180\' onclick=\'clicked(this.id)\' id=\'G-9\'><span>G-9</span></div></td>\r\n					<td><div class=\'seat available\' data-class=\'Gold\' data-price=\'180\' onclick=\'clicked(this.id)\' id=\'G-10\'><span>G-10</span></div></td>\r\n					<td><div class=\'seat available\' data-class=\'Gold\' data-price=\'180\' onclick=\'clicked(this.id)\' id=\'G-11\'><span>G-11</span></div></td>\r\n					<td><div class=\'seat available\' data-class=\'Gold\' data-price=\'180\' onclick=\'clicked(this.id)\' id=\'G-12\'><span>G-12</span></div></td>\r\n					<td><div class=\'seat available\' data-class=\'Gold\' data-price=\'180\' onclick=\'clicked(this.id)\' id=\'G-13\'><span>G-13</span></div></td>\r\n					<td><div class=\'seat available\' data-class=\'Gold\' data-price=\'180\' onclick=\'clicked(this.id)\' id=\'G-14\'><span>G-14</span></div></td>\r\n					<td><div class=\'seat available\' data-class=\'Gold\' data-price=\'180\' onclick=\'clicked(this.id)\' id=\'G-15\'><span>G-15</span></div></td>\r\n					<td><div class=\'seat available\' data-class=\'Gold\' data-price=\'180\' onclick=\'clicked(this.id)\' id=\'G-16\'><span>G-16</span></div></td>\r\n				</tr>\r\n				<tr>\r\n					<td><div class=\'seat available\' data-class=\'Gold\' data-price=\'180\' onclick=\'clicked(this.id)\' id=\'H-1\'><span>H-1</span></div></td>\r\n					<td><div class=\'seat available\' data-class=\'Gold\' data-price=\'180\' onclick=\'clicked(this.id)\' id=\'H-2\'><span>H-2</span></div></td>\r\n					<td><div class=\'seat available\' data-class=\'Gold\' data-price=\'180\' onclick=\'clicked(this.id)\' id=\'H-3\'><span>H-3</span></div></td>\r\n					<td><div class=\'seat available\' data-class=\'Gold\' data-price=\'180\' onclick=\'clicked(this.id)\' id=\'H-4\'><span>H-4</span></div></td>\r\n					<td><div class=\'seat available\' data-class=\'Gold\' data-price=\'180\' onclick=\'clicked(this.id)\' id=\'H-5\'><span>H-5</span></div></td>\r\n					<td><div class=\'seat available\' data-class=\'Gold\' data-price=\'180\' onclick=\'clicked(this.id)\' id=\'H-6\'><span>H-6</span></div></td>\r\n					<td><div class=\'seat available\' data-class=\'Gold\' data-price=\'180\' onclick=\'clicked(this.id)\' id=\'H-7\'><span>H-7</span></div></td>\r\n					<td><div class=\'seat available\' data-class=\'Gold\' data-price=\'180\' onclick=\'clicked(this.id)\' id=\'H-8\'><span>H-8</span></div></td>\r\n					<td><div class=\'seat available\' data-class=\'Gold\' data-price=\'180\' onclick=\'clicked(this.id)\' id=\'H-9\'><span>H-9</span></div></td>\r\n					<td><div class=\'seat available\' data-class=\'Gold\' data-price=\'180\' onclick=\'clicked(this.id)\' id=\'H-10\'><span>H-10</span></div></td>\r\n					<td><div class=\'seat available\' data-class=\'Gold\' data-price=\'180\' onclick=\'clicked(this.id)\' id=\'H-11\'><span>H-11</span></div></td>\r\n					<td><div class=\'seat available\' data-class=\'Gold\' data-price=\'180\' onclick=\'clicked(this.id)\' id=\'H-12\'><span>H-12</span></div></td>\r\n					<td><div class=\'seat available\' data-class=\'Gold\' data-price=\'180\' onclick=\'clicked(this.id)\' id=\'H-13\'><span>H-13</span></div></td>\r\n					<td><div class=\'seat available\' data-class=\'Gold\' data-price=\'180\' onclick=\'clicked(this.id)\' id=\'H-14\'><span>H-14</span></div></td>\r\n					<td><div class=\'seat available\' data-class=\'Gold\' data-price=\'180\' onclick=\'clicked(this.id)\' id=\'H-15\'><span>H-15</span></div></td>\r\n					<td><div class=\'seat available\' data-class=\'Gold\' data-price=\'180\' onclick=\'clicked(this.id)\' id=\'H-16\'><span>H-16</span></div></td>\r\n				</tr>\r\n			</table>\r\n\r\n			<span class=\"text\">Silver: &#8377; 160</span>\r\n			<hr>\r\n\r\n			<table>\r\n				<tr>\r\n					<td><div class=\'seat available\' data-class=\'Silver\' data-price=\'160\' onclick=\'clicked(this.id)\' id=\'I-1\'><span>I-1</span></div></td>\r\n					<td><div class=\'seat available\' data-class=\'Silver\' data-price=\'160\' onclick=\'clicked(this.id)\' id=\'I-2\'><span>I-2</span></div></td>\r\n					<td><div class=\'seat available\' data-class=\'Silver\' data-price=\'160\' onclick=\'clicked(this.id)\' id=\'I-3\'><span>I-3</span></div></td>\r\n					<td><div class=\'seat available\' data-class=\'Silver\' data-price=\'160\' onclick=\'clicked(this.id)\' id=\'I-4\'><span>I-4</span></div></td>\r\n					<td><div class=\'seat available\' data-class=\'Silver\' data-price=\'160\' onclick=\'clicked(this.id)\' id=\'I-5\'><span>I-5</span></div></td>\r\n					<td><div class=\'seat available\' data-class=\'Silver\' data-price=\'160\' onclick=\'clicked(this.id)\' id=\'I-6\'><span>I-6</span></div></td>\r\n					<td><div class=\'seat available\' data-class=\'Silver\' data-price=\'160\' onclick=\'clicked(this.id)\' id=\'I-7\'><span>I-7</span></div></td>\r\n					<td><div class=\'seat available\' data-class=\'Silver\' data-price=\'160\' onclick=\'clicked(this.id)\' id=\'I-8\'><span>I-8</span></div></td>\r\n					<td><div class=\'seat available\' data-class=\'Silver\' data-price=\'160\' onclick=\'clicked(this.id)\' id=\'I-9\'><span>I-9</span></div></td>\r\n					<td><div class=\'seat available\' data-class=\'Silver\' data-price=\'160\' onclick=\'clicked(this.id)\' id=\'I-10\'><span>I-10</span></div></td>\r\n					<td><div class=\'seat available\' data-class=\'Silver\' data-price=\'160\' onclick=\'clicked(this.id)\' id=\'I-11\'><span>I-11</span></div></td>\r\n					<td><div class=\'seat available\' data-class=\'Silver\' data-price=\'160\' onclick=\'clicked(this.id)\' id=\'I-12\'><span>I-12</span></div></td>\r\n					<td><div class=\'seat available\' data-class=\'Silver\' data-price=\'160\' onclick=\'clicked(this.id)\' id=\'I-13\'><span>I-13</span></div></td>\r\n					<td><div class=\'seat available\' data-class=\'Silver\' data-price=\'160\' onclick=\'clicked(this.id)\' id=\'I-14\'><span>I-14</span></div></td>\r\n					<td><div class=\'seat available\' data-class=\'Silver\' data-price=\'160\' onclick=\'clicked(this.id)\' id=\'I-15\'><span>I-15</span></div></td>\r\n					<td><div class=\'seat available\' data-class=\'Silver\' data-price=\'160\' onclick=\'clicked(this.id)\' id=\'I-16\'><span>I-16</span></div></td>\r\n				</tr>\r\n				<tr>\r\n					<td><div class=\'seat available\' data-class=\'Silver\' data-price=\'160\' onclick=\'clicked(this.id)\' id=\'J-1\'><span>J-1</span></div></td>\r\n					<td><div class=\'seat available\' data-class=\'Silver\' data-price=\'160\' onclick=\'clicked(this.id)\' id=\'J-2\'><span>J-2</span></div></td>\r\n					<td><div class=\'seat available\' data-class=\'Silver\' data-price=\'160\' onclick=\'clicked(this.id)\' id=\'J-3\'><span>J-3</span></div></td>\r\n					<td><div class=\'seat available\' data-class=\'Silver\' data-price=\'160\' onclick=\'clicked(this.id)\' id=\'J-4\'><span>J-4</span></div></td>\r\n					<td><div class=\'seat available\' data-class=\'Silver\' data-price=\'160\' onclick=\'clicked(this.id)\' id=\'J-5\'><span>J-5</span></div></td>\r\n					<td><div class=\'seat available\' data-class=\'Silver\' data-price=\'160\' onclick=\'clicked(this.id)\' id=\'J-6\'><span>J-6</span></div></td>\r\n					<td><div class=\'seat available\' data-class=\'Silver\' data-price=\'160\' onclick=\'clicked(this.id)\' id=\'J-7\'><span>J-7</span></div></td>\r\n					<td><div class=\'seat available\' data-class=\'Silver\' data-price=\'160\' onclick=\'clicked(this.id)\' id=\'J-8\'><span>J-8</span></div></td>\r\n					<td><div class=\'seat available\' data-class=\'Silver\' data-price=\'160\' onclick=\'clicked(this.id)\' id=\'J-9\'><span>J-9</span></div></td>\r\n					<td><div class=\'seat available\' data-class=\'Silver\' data-price=\'160\' onclick=\'clicked(this.id)\' id=\'J-10\'><span>J-10</span></div></td>\r\n					<td><div class=\'seat available\' data-class=\'Silver\' data-price=\'160\' onclick=\'clicked(this.id)\' id=\'J-11\'><span>J-11</span></div></td>\r\n					<td><div class=\'seat available\' data-class=\'Silver\' data-price=\'160\' onclick=\'clicked(this.id)\' id=\'J-12\'><span>J-12</span></div></td>\r\n					<td><div class=\'seat available\' data-class=\'Silver\' data-price=\'160\' onclick=\'clicked(this.id)\' id=\'J-13\'><span>J-13</span></div></td>\r\n					<td><div class=\'seat available\' data-class=\'Silver\' data-price=\'160\' onclick=\'clicked(this.id)\' id=\'J-14\'><span>J-14</span></div></td>\r\n					<td><div class=\'seat available\' data-class=\'Silver\' data-price=\'160\' onclick=\'clicked(this.id)\' id=\'J-15\'><span>J-15</span></div></td>\r\n					<td><div class=\'seat available\' data-class=\'Silver\' data-price=\'160\' onclick=\'clicked(this.id)\' id=\'J-16\'><span>J-16</span></div></td>\r\n				</tr>\r\n			</table>\r\n\r\n			<hr size=6 noshade style=\"margin-top: 50px\">\r\n			<span class=\"text\">Screen this way</span>\r\n\r\n</div>\r\n\r\n		<script>\r\n			\r\n			function clicked(str)\r\n            {\r\n                obj = document.getElementById(str);\r\n             	\r\n             	if(obj.className == \'seat available\')\r\n                    obj.className = \'seat clicked\';\r\n                \r\n                else if(obj.className == \'seat clicked\')\r\n                    obj.className = \'seat available\';\r\n            }\r\n            \r\n		</script>\r\n	</body>\r\n</html>', 1),
(2, 'Screen 2', 23, '<html>\r\n	<head>\r\n		<style>\r\n			.seat\r\n			{\r\n				color: green;\r\n                width: 40px;\r\n                height: 40px;\r\n                text-align: center;\r\n                line-height: 40px;\r\n                border: 1px solid green;\r\n				border-radius: 12px;\r\n				margin: 5px;\r\n			}\r\n\r\n			.space\r\n			{\r\n                width: 40px;\r\n                height: 40px;\r\n                border: 1px dotted;\r\n				border-radius: 12px;\r\n				margin: 5px;\r\n				display: none;\r\n			}\r\n\r\n			.available\r\n            {\r\n                background-color: white;\r\n                color: green;\r\n            }\r\n            \r\n            .available:hover\r\n            {\r\n                cursor: pointer;\r\n				color: white;\r\n                background-color: green;\r\n            }\r\n\r\n            .booked\r\n            {\r\n                background-color: darkgray;\r\n                color: white;\r\n                border-color: darkgray; \r\n            }\r\n            \r\n            .booked:hover\r\n            {\r\n                cursor: default;\r\n                background-color: darkgray;\r\n                border-color: darkgray;\r\n            }\r\n            \r\n            .clicked\r\n            {\r\n                background-color: green;\r\n                color: white;\r\n                cursor: pointer;\r\n            }\r\n            \r\n		</style>\r\n	</head>\r\n	<body>\r\n		<div style=\"width: 360px; margin-left: auto; margin-right: auto;\">\r\n			<span class=\"text\">Special: &#8377; 180</span>\r\n			<hr>\r\n			<table>	\r\n				<tr>\r\n					<td><div class=\'seat available\' data-class=\'Special\' data-price=\'180\' onclick=\'clicked(this.id)\' id=\'A-1\'><span>A-1</span></div></td>\r\n					<td><div class=\'seat available\' data-class=\'Special\' data-price=\'180\' onclick=\'clicked(this.id)\' id=\'A-2\'><span>A-2</span></div></td>\r\n					<td><div class=\'seat available\' data-class=\'Special\' data-price=\'180\' onclick=\'clicked(this.id)\' id=\'A-3\'><span>A-3</span></div></td>\r\n					<td><div class=\'space\'></div></td>\r\n					<td><div class=\'space\'></div></td>\r\n				</tr>\r\n				\r\n				<tr>\r\n					<td><div class=\'seat available\' data-class=\'Special\' data-price=\'180\' onclick=\'clicked(this.id)\' id=\'B-1\'><span>B-1</span></div></td>\r\n					<td><div class=\'seat available\' data-class=\'Special\' data-price=\'180\' onclick=\'clicked(this.id)\' id=\'B-2\'><span>B-2</span></div></td>\r\n					<td><div class=\'seat available\' data-class=\'Special\' data-price=\'180\' onclick=\'clicked(this.id)\' id=\'B-3\'><span>B-3</span></div></td>\r\n					<td><div class=\'seat available\' data-class=\'Special\' data-price=\'180\' onclick=\'clicked(this.id)\' id=\'B-4\'><span>B-4</span></div></td>\r\n					<td><div class=\'seat available\' data-class=\'Special\' data-price=\'180\' onclick=\'clicked(this.id)\' id=\'B-5\'><span>B-5</span></div></td>					\r\n				</tr>\r\n\r\n				<tr>\r\n					<td><div class=\'seat available\' data-class=\'Special\' data-price=\'180\' onclick=\'clicked(this.id)\' id=\'C-1\'><span>C-1</span></div></td>\r\n					<td><div class=\'seat available\' data-class=\'Special\' data-price=\'180\' onclick=\'clicked(this.id)\' id=\'C-2\'><span>C-2</span></div></td>\r\n					<td><div class=\'seat available\' data-class=\'Special\' data-price=\'180\' onclick=\'clicked(this.id)\' id=\'C-3\'><span>C-3</span></div></td>\r\n					<td><div class=\'seat available\' data-class=\'Special\' data-price=\'180\' onclick=\'clicked(this.id)\' id=\'C-4\'><span>C-4</span></div></td>\r\n					<td><div class=\'seat available\' data-class=\'Special\' data-price=\'180\' onclick=\'clicked(this.id)\' id=\'C-5\'><span>C-5</span></div></td>					\r\n				</tr>\r\n\r\n				<tr>\r\n					<td><div class=\'seat available\' data-class=\'Special\' data-price=\'180\' onclick=\'clicked(this.id)\' id=\'D-1\'><span>D-1</span></div></td>\r\n					<td><div class=\'seat available\' data-class=\'Special\' data-price=\'180\' onclick=\'clicked(this.id)\' id=\'D-2\'><span>D-2</span></div></td>\r\n					<td><div class=\'seat available\' data-class=\'Special\' data-price=\'180\' onclick=\'clicked(this.id)\' id=\'D-3\'><span>D-3</span></div></td>\r\n					<td><div class=\'seat available\' data-class=\'Special\' data-price=\'180\' onclick=\'clicked(this.id)\' id=\'D-4\'><span>D-4</span></div></td>\r\n					<td><div class=\'seat available\' data-class=\'Special\' data-price=\'180\' onclick=\'clicked(this.id)\' id=\'D-5\'><span>D-5</span></div></td>					\r\n				</tr>\r\n\r\n				<tr>\r\n					<td><div class=\'seat available\' data-class=\'Special\' data-price=\'180\' onclick=\'clicked(this.id)\' id=\'F-1\'><span>F-1</span></div></td>\r\n					<td><div class=\'seat available\' data-class=\'Special\' data-price=\'180\' onclick=\'clicked(this.id)\' id=\'F-2\'><span>F-2</span></div></td>\r\n					<td><div class=\'seat available\' data-class=\'Special\' data-price=\'180\' onclick=\'clicked(this.id)\' id=\'F-3\'><span>F-3</span></div></td>\r\n					<td><div class=\'seat available\' data-class=\'Special\' data-price=\'180\' onclick=\'clicked(this.id)\' id=\'F-4\'><span>F-4</span></div></td>\r\n					<td><div class=\'seat available\' data-class=\'Special\' data-price=\'180\' onclick=\'clicked(this.id)\' id=\'F-5\'><span>F-5</span></div></td>					\r\n				</tr>\r\n			</table>\r\n\r\n			\r\n			<hr size=6 noshade style=\"margin-top: 50px\">\r\n			<span class=\"text\">Screen this way</span>\r\n\r\n\r\n		</div>\r\n\r\n		<script>\r\n			\r\n			function clicked(str)\r\n            {\r\n                obj = document.getElementById(str);\r\n             	\r\n             	if(obj.className == \'seat available\')\r\n                    obj.className = \'seat clicked\';\r\n                \r\n                else if(obj.className == \'seat clicked\')\r\n                    obj.className = \'seat available\';\r\n            }\r\n            \r\n		</script>\r\n	</body>\r\n</html>', 1);

-- --------------------------------------------------------

--
-- Table structure for table `theatre`
--

CREATE TABLE `theatre` (
  `theatre_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `address` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `theatre`
--

INSERT INTO `theatre` (`theatre_id`, `name`, `address`, `phone`) VALUES
(1, 'Abhishek Movieplex', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `ticket`
--

CREATE TABLE `ticket` (
  `ticket_id` int(11) NOT NULL,
  `seat_number` varchar(30) NOT NULL,
  `seat_type` varchar(30) NOT NULL,
  `price` float NOT NULL,
  `transaction_id` int(11) NOT NULL,
  `show_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ticket`
--

INSERT INTO `ticket` (`ticket_id`, `seat_number`, `seat_type`, `price`, `transaction_id`, `show_id`) VALUES
(9, 'A-6', 'Platinum', 200, 7, 2),
(10, 'A-7', 'Platinum', 200, 7, 2),
(11, 'F-7', 'Gold', 180, 8, 2),
(12, 'F-8', 'Gold', 180, 8, 2),
(13, 'F-9', 'Gold', 180, 8, 2),
(14, 'I-16', 'Silver', 160, 8, 2),
(15, 'I-15', 'Silver', 160, 9, 2),
(16, 'A-1', 'Platinum', 200, 10, 2),
(17, 'A-2', 'Platinum', 200, 10, 2),
(18, 'C-7', 'Platinum', 200, 11, 2),
(19, 'C-8', 'Platinum', 200, 11, 2),
(20, 'C-9', 'Platinum', 200, 11, 2),
(21, 'A-1', 'Platinum', 200, 12, 1),
(22, 'A-2', 'Platinum', 200, 12, 1),
(23, 'F-1', 'Gold', 180, 13, 1),
(24, 'F-2', 'Gold', 180, 13, 1),
(25, 'I-15', 'Silver', 160, 13, 1),
(26, 'I-16', 'Silver', 160, 13, 1),
(27, 'A-6', 'Platinum', 200, 14, 1),
(28, 'A-7', 'Platinum', 200, 14, 1),
(29, 'C-7', 'Platinum', 200, 15, 1),
(30, 'C-8', 'Platinum', 200, 15, 1),
(31, 'C-9', 'Platinum', 200, 15, 1),
(32, 'C-10', 'Platinum', 200, 15, 1),
(33, 'F-15', 'Gold', 180, 16, 1),
(34, 'F-16', 'Gold', 180, 16, 1),
(35, 'F-7', 'Gold', 180, 17, 1),
(36, 'F-8', 'Gold', 180, 17, 1),
(37, 'F-9', 'Gold', 180, 17, 1),
(38, 'F-10', 'Gold', 180, 17, 1),
(39, 'C-10', 'Platinum', 200, 18, 2),
(40, 'C-11', 'Platinum', 200, 18, 2),
(41, 'C-5', 'Platinum', 200, 19, 4),
(42, 'C-6', 'Platinum', 200, 19, 4),
(43, 'C-7', 'Platinum', 200, 19, 4),
(44, 'C-8', 'Platinum', 200, 19, 4),
(45, 'C-9', 'Platinum', 200, 19, 4),
(46, 'C-10', 'Platinum', 200, 19, 4),
(47, 'C-11', 'Platinum', 200, 19, 4),
(48, 'A-5', 'Platinum', 200, 20, 2),
(49, 'C-7', 'Platinum', 200, 21, 3),
(50, 'C-8', 'Platinum', 200, 21, 3),
(51, 'C-9', 'Platinum', 200, 21, 3),
(52, 'C-10', 'Platinum', 200, 21, 3),
(53, 'A-6', 'Platinum', 200, 22, 4),
(54, 'A-7', 'Platinum', 200, 22, 4),
(55, 'A-1', 'Platinum', 200, 23, 4),
(56, 'A-2', 'Platinum', 200, 23, 4),
(57, 'B-7', 'Platinum', 200, 24, 2),
(58, 'B-8', 'Platinum', 200, 24, 2),
(59, 'A-3', 'Platinum', 200, 25, 1),
(60, 'A-4', 'Platinum', 200, 25, 1),
(61, 'B-1', 'Platinum', 200, 26, 1),
(62, 'B-2', 'Platinum', 200, 27, 1),
(63, 'B-3', 'Platinum', 200, 28, 1),
(64, 'B-4', 'Platinum', 200, 29, 1),
(65, 'B-5', 'Platinum', 200, 30, 1),
(66, 'B-6', 'Platinum', 200, 31, 1),
(67, 'B-7', 'Platinum', 200, 32, 1),
(68, 'B-8', 'Platinum', 200, 33, 1),
(69, 'C-11', 'Platinum', 200, 34, 1),
(70, 'C-12', 'Platinum', 200, 34, 1),
(71, 'C-13', 'Platinum', 200, 34, 1),
(72, 'C-14', 'Platinum', 200, 34, 1),
(73, 'A-5', 'Platinum', 200, 35, 3),
(74, 'A-6', 'Platinum', 200, 35, 3),
(75, 'A-7', 'Platinum', 200, 35, 3),
(76, 'A-1', 'Platinum', 200, 36, 3),
(77, 'A-5', 'Platinum', 200, 37, 1),
(78, 'B-2', 'Special', 180, 38, 19),
(79, 'B-3', 'Special', 180, 38, 19),
(80, 'B-4', 'Special', 180, 38, 19),
(81, 'A-1', 'Special', 180, 39, 19),
(82, 'A-2', 'Special', 180, 39, 19);

-- --------------------------------------------------------

--
-- Table structure for table `transaction`
--

CREATE TABLE `transaction` (
  `transaction_id` int(11) NOT NULL,
  `amount` float NOT NULL,
  `payment_method` varchar(255) NOT NULL,
  `time_of_booking` datetime NOT NULL,
  `number_of_tickets` int(11) NOT NULL,
  `movie_name` varchar(255) NOT NULL,
  `screen_name` varchar(255) NOT NULL,
  `theatre_name` varchar(255) NOT NULL,
  `show_date` date NOT NULL,
  `show_time` time NOT NULL,
  `show_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `transaction`
--

INSERT INTO `transaction` (`transaction_id`, `amount`, `payment_method`, `time_of_booking`, `number_of_tickets`, `movie_name`, `screen_name`, `theatre_name`, `show_date`, `show_time`, `show_id`, `user_id`) VALUES
(7, 400, 'UPI', '2020-07-29 12:19:35', 2, 'Andhadhun', 'Screen 1', 'Funcity Big Cinemas', '2020-08-29', '19:30:00', 2, 1),
(8, 700, 'UPI', '2020-07-29 12:22:24', 4, 'Andhadhun', 'Screen 1', 'Funcity Big Cinemas', '2020-08-29', '19:30:00', 2, 1),
(9, 160, 'UPI', '2020-07-29 12:26:02', 1, 'Andhadhun', 'Screen 1', 'Funcity Big Cinemas', '2020-08-29', '19:30:00', 2, 1),
(10, 400, 'UPI', '2020-07-29 12:27:23', 2, 'Andhadhun', 'Screen 1', 'Funcity Big Cinemas', '2020-08-29', '19:30:00', 2, 1),
(11, 600, 'UPI', '2020-07-29 16:27:49', 3, 'Andhadhun', 'Screen 1', 'Funcity Big Cinemas', '2020-08-29', '19:30:00', 2, 1),
(12, 400, 'UPI', '2020-07-29 15:59:21', 2, 'Andhadhun', 'Screen 1', 'Funcity Big Cinemas', '2020-08-29', '22:00:00', 1, 1),
(13, 680, 'UPI', '2020-07-29 16:13:45', 4, 'Andhadhun', 'Screen 1', 'Funcity Big Cinemas', '2020-08-29', '22:00:00', 1, 1),
(14, 400, 'UPI', '2020-07-29 16:17:10', 2, 'Andhadhun', 'Screen 1', 'Funcity Big Cinemas', '2020-08-29', '22:00:00', 1, 1),
(15, 800, 'UPI', '2020-07-29 16:19:46', 4, 'Andhadhun', 'Screen 1', 'Funcity Big Cinemas', '2020-08-29', '22:00:00', 1, 1),
(16, 360, 'UPI', '2020-07-29 16:20:20', 2, 'Andhadhun', 'Screen 1', 'Funcity Big Cinemas', '2020-08-29', '22:00:00', 1, 1),
(17, 720, 'UPI', '2020-07-30 11:49:14', 4, 'Andhadhun', 'Screen 1', 'Funcity Big Cinemas', '2020-08-29', '22:00:00', 1, 1),
(18, 400, 'UPI', '2020-07-30 11:55:16', 2, 'Andhadhun', 'Screen 1', 'Funcity Big Cinemas', '2020-08-29', '19:30:00', 2, 5),
(19, 1400, 'UPI', '2020-07-30 12:00:50', 7, 'Andhadhun', 'Screen 1', 'Funcity Big Cinemas', '2020-08-30', '19:30:00', 4, 5),
(20, 200, 'UPI', '2020-07-30 12:13:17', 1, 'Andhadhun', 'Screen 1', 'Funcity Big Cinemas', '2020-08-29', '19:30:00', 2, 1),
(21, 800, 'UPI', '2020-07-30 14:22:03', 4, 'Andhadhun', 'Screen 1', 'Funcity Big Cinemas', '2020-08-30', '22:00:00', 3, 6),
(22, 400, 'UPI', '2020-07-31 17:09:28', 2, 'Andhadhun', 'Screen 1', 'Funcity Big Cinemas', '2020-08-30', '19:30:00', 4, 7),
(23, 400, 'UPI', '2020-08-01 02:48:31', 2, 'Andhadhun', 'Screen 1', 'Funcity Big Cinemas', '2020-08-30', '19:30:00', 4, 7),
(24, 400, 'UPI', '2020-08-01 03:04:09', 2, 'Andhadhun', 'Screen 1', 'Funcity Big Cinemas', '2020-08-29', '19:30:00', 2, 1),
(25, 400, 'UPI', '2020-08-01 03:08:30', 2, 'Andhadhun', 'Screen 1', 'Funcity Big Cinemas', '2020-08-29', '22:00:00', 1, 1),
(26, 200, 'UPI', '2020-08-01 03:09:19', 1, 'Andhadhun', 'Screen 1', 'Funcity Big Cinemas', '2020-08-29', '22:00:00', 1, 1),
(27, 200, 'UPI', '2020-08-01 03:09:27', 1, 'Andhadhun', 'Screen 1', 'Funcity Big Cinemas', '2020-08-29', '22:00:00', 1, 1),
(28, 200, 'UPI', '2020-08-01 03:09:56', 1, 'Andhadhun', 'Screen 1', 'Funcity Big Cinemas', '2020-08-29', '22:00:00', 1, 1),
(29, 200, 'UPI', '2020-08-01 03:10:10', 1, 'Andhadhun', 'Screen 1', 'Funcity Big Cinemas', '2020-08-29', '22:00:00', 1, 1),
(30, 200, 'UPI', '2020-08-01 03:10:53', 1, 'Andhadhun', 'Screen 1', 'Funcity Big Cinemas', '2020-08-29', '22:00:00', 1, 1),
(31, 200, 'UPI', '2020-08-01 03:11:03', 1, 'Andhadhun', 'Screen 1', 'Funcity Big Cinemas', '2020-08-29', '22:00:00', 1, 1),
(32, 200, 'UPI', '2020-08-01 03:11:33', 1, 'Andhadhun', 'Screen 1', 'Funcity Big Cinemas', '2020-08-29', '22:00:00', 1, 1),
(33, 200, 'UPI', '2020-08-01 03:11:52', 1, 'Andhadhun', 'Screen 1', 'Funcity Big Cinemas', '2020-08-29', '22:00:00', 1, 1),
(34, 800, 'UPI', '2020-08-01 03:12:13', 4, 'Andhadhun', 'Screen 1', 'Funcity Big Cinemas', '2020-08-29', '22:00:00', 1, 1),
(35, 600, 'UPI', '2020-08-01 03:14:25', 3, 'Andhadhun', 'Screen 1', 'Funcity Big Cinemas', '2020-08-30', '22:00:00', 3, 1),
(36, 200, 'UPI', '2020-08-01 03:14:59', 1, 'Andhadhun', 'Screen 1', 'Funcity Big Cinemas', '2020-08-30', '22:00:00', 3, 1),
(37, 200, 'UPI', '2020-08-01 03:24:15', 1, 'Andhadhun', 'Screen 1', 'Funcity Big Cinemas', '2020-08-29', '22:00:00', 1, 1),
(38, 540, 'UPI', '2020-08-01 04:18:36', 3, 'Andhadhun', 'Screen 2', 'Abhishek Movieplex', '2020-08-29', '18:15:00', 19, 1),
(39, 360, 'UPI', '2020-08-01 04:29:54', 2, 'Andhadhun', 'Screen 2', 'Abhishek Movieplex', '2020-08-29', '18:15:00', 19, 5);

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `user_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `birth_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`user_id`, `name`, `email`, `password`, `birth_date`) VALUES
(1, 'Abhishek Mulchandani', 'abhi@gmail.com', '3498a8379d2ec5624c0e986daf317554', '1998-03-30'),
(5, 'Mayur Mulchandani', 'mayur@gmail.com', 'b86c7fd45850cee3258a315c80c05d07', '2000-10-04'),
(6, 'Sagar Kamrani', 'sagar@gmail.com', '02cd328bc0c32b1de133975a38e65022', '1998-02-26'),
(7, 'Vrushali Maste', 'vrushali@gmail.com', '39f19fdc92a1e1ea98bae205182c3450', '1999-08-12');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `movie`
--
ALTER TABLE `movie`
  ADD PRIMARY KEY (`movie_id`);

--
-- Indexes for table `movie_rating`
--
ALTER TABLE `movie_rating`
  ADD PRIMARY KEY (`rating_id`),
  ADD KEY `movie_id` (`movie_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `movie_show`
--
ALTER TABLE `movie_show`
  ADD PRIMARY KEY (`show_id`),
  ADD KEY `movie_id` (`movie_id`),
  ADD KEY `screen_id` (`screen_id`);

--
-- Indexes for table `screen`
--
ALTER TABLE `screen`
  ADD PRIMARY KEY (`screen_id`),
  ADD KEY `theatre_id` (`theatre_id`);

--
-- Indexes for table `theatre`
--
ALTER TABLE `theatre`
  ADD PRIMARY KEY (`theatre_id`);

--
-- Indexes for table `ticket`
--
ALTER TABLE `ticket`
  ADD PRIMARY KEY (`ticket_id`),
  ADD KEY `transaction_id` (`transaction_id`),
  ADD KEY `show_id` (`show_id`);

--
-- Indexes for table `transaction`
--
ALTER TABLE `transaction`
  ADD PRIMARY KEY (`transaction_id`),
  ADD KEY `show_id` (`show_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `movie`
--
ALTER TABLE `movie`
  MODIFY `movie_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `movie_rating`
--
ALTER TABLE `movie_rating`
  MODIFY `rating_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `movie_show`
--
ALTER TABLE `movie_show`
  MODIFY `show_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `screen`
--
ALTER TABLE `screen`
  MODIFY `screen_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `theatre`
--
ALTER TABLE `theatre`
  MODIFY `theatre_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `ticket`
--
ALTER TABLE `ticket`
  MODIFY `ticket_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=83;

--
-- AUTO_INCREMENT for table `transaction`
--
ALTER TABLE `transaction`
  MODIFY `transaction_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `movie_rating`
--
ALTER TABLE `movie_rating`
  ADD CONSTRAINT `movie_rating_ibfk_1` FOREIGN KEY (`movie_id`) REFERENCES `movie` (`movie_id`),
  ADD CONSTRAINT `movie_rating_ibfk_2` FOREIGN KEY (`movie_id`) REFERENCES `movie` (`movie_id`),
  ADD CONSTRAINT `movie_rating_ibfk_3` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`);

--
-- Constraints for table `movie_show`
--
ALTER TABLE `movie_show`
  ADD CONSTRAINT `movie_show_ibfk_1` FOREIGN KEY (`movie_id`) REFERENCES `movie` (`movie_id`),
  ADD CONSTRAINT `movie_show_ibfk_2` FOREIGN KEY (`screen_id`) REFERENCES `screen` (`screen_id`);

--
-- Constraints for table `screen`
--
ALTER TABLE `screen`
  ADD CONSTRAINT `screen_ibfk_1` FOREIGN KEY (`theatre_id`) REFERENCES `theatre` (`theatre_id`);

--
-- Constraints for table `ticket`
--
ALTER TABLE `ticket`
  ADD CONSTRAINT `ticket_ibfk_1` FOREIGN KEY (`transaction_id`) REFERENCES `transaction` (`transaction_id`),
  ADD CONSTRAINT `ticket_ibfk_2` FOREIGN KEY (`show_id`) REFERENCES `movie_show` (`show_id`);

--
-- Constraints for table `transaction`
--
ALTER TABLE `transaction`
  ADD CONSTRAINT `transaction_ibfk_1` FOREIGN KEY (`show_id`) REFERENCES `movie_show` (`show_id`),
  ADD CONSTRAINT `transaction_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

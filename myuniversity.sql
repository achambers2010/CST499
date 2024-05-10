-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 10, 2024 at 05:16 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `myuniversity`
--

-- --------------------------------------------------------

--
-- Table structure for table `courses_table`
--

CREATE TABLE `courses_table` (
  `course_id` varchar(10) NOT NULL,
  `course_name` varchar(20) NOT NULL,
  `description` varchar(100) NOT NULL,
  `max_enrollment` int(3) NOT NULL,
  `semester_offered` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `courses_table`
--

INSERT INTO `courses_table` (`course_id`, `course_name`, `description`, `max_enrollment`, `semester_offered`) VALUES
('CSC101', 'Advanced Programming', 'Deep dive into advanced programming concepts and techniques.', 40, 'Spring'),
('CSC102', 'Web Development II', 'Advanced topics in web development including frameworks and APIs.', 35, 'Fall'),
('CSC103', 'Data Structures', 'Comprehensive coverage of data structures like trees, graphs, and algorithms.', 30, 'Fall'),
('CSC104', 'Software Engineering', 'Study of software development life cycles, methodologies, and practices.', 25, 'Spring'),
('CSC105', 'Operating Systems', 'Exploration of modern operating systems, their design and implementation.', 30, 'Winter'),
('CSC201', 'Machine Learning', 'Introduction to machine learning concepts and applications.', 35, 'Fall'),
('CSC202', 'Cloud Computing', 'Overview of cloud services, infrastructure, and deployment models.', 30, 'Fall'),
('CSC203', 'Network Security', 'Principles of network security and practical approaches to securing infrastructure.', 25, 'Winter'),
('CSC204', 'Database Design', 'Study of database design principles, normalization, and SQL programming.', 40, 'Fall'),
('CSC205', 'Mobile App Developme', 'Development of applications for mobile devices using various frameworks.', 30, 'Winter'),
('CSC301', 'Quantum Computing', 'Introduction to quantum computing principles and practical applications.', 20, 'Fall'),
('CSC302', 'Artificial Intellige', 'Study of AI principles, algorithms, and their applications.', 25, 'Spring'),
('CSC303', 'Cybersecurity Fundam', 'Fundamentals of securing digital environments and protecting data.', 35, 'Fall'),
('CSC304', 'Game Development', 'Techniques and tools for developing engaging computer games.', 30, 'Winter');

-- --------------------------------------------------------

--
-- Table structure for table `enrollment_table`
--

CREATE TABLE `enrollment_table` (
  `enrollment_id` int(10) NOT NULL,
  `user_id` int(11) NOT NULL,
  `course_id` varchar(10) NOT NULL,
  `status` varchar(15) NOT NULL,
  `enroll_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `enrollment_table`
--

INSERT INTO `enrollment_table` (`enrollment_id`, `user_id`, `course_id`, `status`, `enroll_date`) VALUES
(11, 32, 'CSC103', 'enrolled', '2024-04-28'),
(12, 33, 'CSC103', 'enrolled', '2024-04-28'),
(13, 34, 'CSC103', 'enrolled', '2024-04-28'),
(14, 35, 'CSC103', 'enrolled', '2024-04-28'),
(15, 36, 'CSC103', 'enrolled', '2024-04-28'),
(16, 37, 'CSC103', 'enrolled', '2024-04-28'),
(17, 38, 'CSC103', 'enrolled', '2024-04-28'),
(18, 39, 'CSC103', 'enrolled', '2024-04-28'),
(19, 40, 'CSC103', 'enrolled', '2024-04-28'),
(20, 41, 'CSC103', 'enrolled', '2024-04-28'),
(21, 42, 'CSC103', 'enrolled', '2024-04-28'),
(22, 43, 'CSC103', 'enrolled', '2024-04-28'),
(23, 44, 'CSC103', 'enrolled', '2024-04-28'),
(24, 45, 'CSC103', 'enrolled', '2024-04-28'),
(25, 46, 'CSC103', 'enrolled', '2024-04-28'),
(26, 47, 'CSC103', 'enrolled', '2024-04-28'),
(27, 48, 'CSC103', 'enrolled', '2024-04-28'),
(28, 49, 'CSC103', 'enrolled', '2024-04-28'),
(29, 50, 'CSC103', 'enrolled', '2024-04-28'),
(30, 51, 'CSC103', 'enrolled', '2024-04-28'),
(31, 52, 'CSC103', 'enrolled', '2024-04-28'),
(32, 53, 'CSC103', 'enrolled', '2024-04-28'),
(33, 54, 'CSC103', 'enrolled', '2024-04-28'),
(34, 55, 'CSC103', 'enrolled', '2024-04-28'),
(35, 56, 'CSC103', 'enrolled', '2024-04-28'),
(36, 57, 'CSC103', 'enrolled', '2024-04-28'),
(37, 58, 'CSC103', 'enrolled', '2024-04-28'),
(38, 59, 'CSC103', 'enrolled', '2024-04-28'),
(39, 60, 'CSC103', 'enrolled', '2024-04-28'),
(57, 61, 'CSC302', 'enrolled', '2024-04-28'),
(58, 61, 'CSC104', 'enrolled', '2024-04-28'),
(69, 61, 'CSC202', 'enrolled', '2024-05-06'),
(70, 61, 'CSC303', 'enrolled', '2024-05-06'),
(71, 61, 'CSC204', 'enrolled', '2024-05-06'),
(72, 61, 'CSC103', 'enrolled', '2024-05-06'),
(73, 61, 'CSC201', 'enrolled', '2024-05-06'),
(74, 61, 'CSC301', 'enrolled', '2024-05-06'),
(75, 61, 'CSC102', 'enrolled', '2024-05-06'),
(76, 61, 'CSC101', 'enrolled', '2024-05-06'),
(77, 61, 'CSC304', 'enrolled', '2024-05-06'),
(78, 61, 'CSC205', 'enrolled', '2024-05-06'),
(79, 61, 'CSC203', 'enrolled', '2024-05-06'),
(80, 61, 'CSC105', 'enrolled', '2024-05-06');

-- --------------------------------------------------------

--
-- Table structure for table `users_table`
--

CREATE TABLE `users_table` (
  `user_id` int(11) NOT NULL,
  `username` varchar(20) NOT NULL,
  `password_hash` varchar(255) NOT NULL,
  `email` varchar(50) NOT NULL,
  `full_name` varchar(50) NOT NULL,
  `phone_number` varchar(10) NOT NULL,
  `created_at` date NOT NULL,
  `updated_at` date NOT NULL,
  `address` varchar(1000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users_table`
--

INSERT INTO `users_table` (`user_id`, `username`, `password_hash`, `email`, `full_name`, `phone_number`, `created_at`, `updated_at`, `address`) VALUES
(5, 'actest1', '$2y$10$2zS62z1UY3YFMg3ABEv9kOk3RIArjK4VC/uhsW6wkbTUGIZ5mRRtS', 'actest@test.com', 'AC Test', '1234567890', '2024-04-28', '0000-00-00', '1234 AC TEST Drive'),
(31, 'alexjohnson01', '$2y$10$2zS62z1UY3YFMg3ABEv9kOk3RIArjK4VC/uhsW6wkbTUGIZ5mRRtS', 'alexjohnson01@example.com', 'Alex Johnson', '6145550123', '2024-04-28', '2024-04-28', '1502 Maple Ave, Columbus, OH 43210'),
(32, 'bettywhite02', '$2y$10$2zS62z1UY3YFMg3ABEv9kOk3RIArjK4VC/uhsW6wkbTUGIZ5mRRtS', 'betty.white02@example.com', 'Betty White', '9165550154', '2024-04-28', '2024-04-28', '2301 Pine St, Sacramento, CA 95814'),
(33, 'charlesxavier03', '$2y$10$2zS62z1UY3YFMg3ABEv9kOk3RIArjK4VC/uhsW6wkbTUGIZ5mRRtS', 'charles.xavier03@example.com', 'Charles Xavier', '4125550198', '2024-04-28', '2024-04-28', '1407 Elm St, Pittsburgh, PA 15222'),
(34, 'diana.prince04', '$2y$10$2zS62z1UY3YFMg3ABEv9kOk3RIArjK4VC/uhsW6wkbTUGIZ5mRRtS', 'diana.prince04@example.com', 'Diana Prince', '2145550176', '2024-04-28', '2024-04-28', '4701 Cedar Ave, Dallas, TX 75205'),
(35, 'ethan.hunt05', '$2y$10$2zS62z1UY3YFMg3ABEv9kOk3RIArjK4VC/uhsW6wkbTUGIZ5mRRtS', 'ethan.hunt05@example.com', 'Ethan Hunt', '3055550145', '2024-04-28', '2024-04-28', '3609 Oak Dr, Miami, FL 33133'),
(36, 'fiona.gallagher06', '$2y$10$2zS62z1UY3YFMg3ABEv9kOk3RIArjK4VC/uhsW6wkbTUGIZ5mRRtS', 'fiona.gallagher06@example.com', 'Fiona Gallagher', '2675550119', '2024-04-28', '2024-04-28', '1203 Vine St, Philadelphia, PA 19107'),
(37, 'georgekingsley07', '$2y$10$2zS62z1UY3YFMg3ABEv9kOk3RIArjK4VC/uhsW6wkbTUGIZ5mRRtS', 'george.kingsley07@example.com', 'George Kingsley', '4155550183', '2024-04-28', '2024-04-28', '908 Cherry Ct, San Francisco, CA 94122'),
(38, 'helenapierce08', '$2y$10$2zS62z1UY3YFMg3ABEv9kOk3RIArjK4VC/uhsW6wkbTUGIZ5mRRtS', 'helena.pierce08@example.com', 'Helena Pierce', '3035550132', '2024-04-28', '2024-04-28', '522 Ash St, Denver, CO 80220'),
(39, 'ianmalcolm09', '$2y$10$2zS62z1UY3YFMg3ABEv9kOk3RIArjK4VC/uhsW6wkbTUGIZ5mRRtS', 'ian.malcolm09@example.com', 'Ian Malcolm', '2065550164', '2024-04-28', '2024-04-28', '6603 Pine St, Seattle, WA 98115'),
(40, 'julietcapulet10', '$2y$10$2zS62z1UY3YFMg3ABEv9kOk3RIArjK4VC/uhsW6wkbTUGIZ5mRRtS', 'juliet.capulet10@example.com', 'Juliet Capulet', '5125550128', '2024-04-28', '2024-04-28', '2710 Maple Ave, Austin, TX 78701'),
(41, 'kara.thrace11', '$2y$10$2zS62z1UY3YFMg3ABEv9kOk3RIArjK4VC/uhsW6wkbTUGIZ5mRRtS', 'kara.thrace11@example.com', 'Kara Thrace', '7025550177', '2024-04-28', '2024-04-28', '7842 Cedar Dr, Las Vegas, NV 89101'),
(42, 'liam.griffin12', '$2y$10$2zS62z1UY3YFMg3ABEv9kOk3RIArjK4VC/uhsW6wkbTUGIZ5mRRtS', 'liam.griffin12@example.com', 'Liam Griffin', '8015550123', '2024-04-28', '2024-04-28', '1285 Birch Ln, Salt Lake City, UT 84101'),
(43, 'morgan.stark13', '$2y$10$2zS62z1UY3YFMg3ABEv9kOk3RIArjK4VC/uhsW6wkbTUGIZ5mRRtS', 'morgan.stark13@example.com', 'Morgan Stark', '6025550148', '2024-04-28', '2024-04-28', '3327 Willow St, Phoenix, AZ 85001'),
(44, 'natalia.romanov14', '$2y$10$2zS62z1UY3YFMg3ABEv9kOk3RIArjK4VC/uhsW6wkbTUGIZ5mRRtS', 'natalia.romanov14@example.com', 'Natalia Romanov', '9165550155', '2024-04-28', '2024-04-28', '4498 Maple Ct, Sacramento, CA 95814'),
(45, 'oscar.wilde15', '$2y$10$2zS62z1UY3YFMg3ABEv9kOk3RIArjK4VC/uhsW6wkbTUGIZ5mRRtS', 'oscar.wilde15@example.com', 'Oscar Wilde', '4085550189', '2024-04-28', '2024-04-28', '7119 Oak Blvd, San Jose, CA 95112'),
(46, 'peter.parker16', '$2y$10$2zS62z1UY3YFMg3ABEv9kOk3RIArjK4VC/uhsW6wkbTUGIZ5mRRtS', 'peter.parker16@example.com', 'Peter Parker', '2125550173', '2024-04-28', '2024-04-28', '2721 Elm St, New York, NY 10001'),
(47, 'quincy.adams17', '$2y$10$2zS62z1UY3YFMg3ABEv9kOk3RIArjK4VC/uhsW6wkbTUGIZ5mRRtS', 'quincy.adams17@example.com', 'Quincy Adams', '6175550144', '2024-04-28', '2024-04-28', '8346 Pine Rd, Boston, MA 02108'),
(48, 'rachel.green18', '$2y$10$2zS62z1UY3YFMg3ABEv9kOk3RIArjK4VC/uhsW6wkbTUGIZ5mRRtS', 'rachel.green18@example.com', 'Rachel Green', '3125550135', '2024-04-28', '2024-04-28', '5294 Cherry Ave, Chicago, IL 60601'),
(49, 'steven.grant19', '$2y$10$2zS62z1UY3YFMg3ABEv9kOk3RIArjK4VC/uhsW6wkbTUGIZ5mRRtS', 'steven.grant19@example.com', 'Steven Grant', '7135550166', '2024-04-28', '2024-04-28', '6283 Ash Way, Houston, TX 77001'),
(50, 'tonya.harding20', '$2y$10$2zS62z1UY3YFMg3ABEv9kOk3RIArjK4VC/uhsW6wkbTUGIZ5mRRtS', 'tonya.harding20@example.com', 'Tonya Harding', '5035550112', '2024-04-28', '2024-04-28', '1438 Birch Park, Portland, OR 97201'),
(51, 'samanthajoy', '$2y$10$2zS62z1UY3YFMg3ABEv9kOk3RIArjK4VC/uhsW6wkbTUGIZ5mRRtS', 'samantha.joy@example.com', 'Samantha Joy', '2065550171', '2024-04-28', '2024-04-28', '4682 Pine Street, Seattle, WA 98101'),
(52, 'ethanwright', '$2y$10$2zS62z1UY3YFMg3ABEv9kOk3RIArjK4VC/uhsW6wkbTUGIZ5mRRtS', 'ethan.wright@example.com', 'Ethan Wright', '3035550204', '2024-04-28', '2024-04-28', '9133 Maple Avenue, Denver, CO 80203'),
(53, 'oliviagrace', '$2y$10$2zS62z1UY3YFMg3ABEv9kOk3RIArjK4VC/uhsW6wkbTUGIZ5mRRtS', 'olivia.grace@example.com', 'Olivia Grace', '4075550153', '2024-04-28', '2024-04-28', '1522 Cedar Lane, Orlando, FL 32801'),
(54, 'noahsmith', '$2y$10$2zS62z1UY3YFMg3ABEv9kOk3RIArjK4VC/uhsW6wkbTUGIZ5mRRtS', 'noah.smith@example.com', 'Noah Smith', '4055550147', '2024-04-28', '2024-04-28', '3449 Grove Avenue, Oklahoma City, OK 73102'),
(55, 'emilyjohnson', '$2y$10$2zS62z1UY3YFMg3ABEv9kOk3RIArjK4VC/uhsW6wkbTUGIZ5mRRtS', 'emily.johnson@example.com', 'Emily Johnson', '4155550132', '2024-04-28', '2024-04-28', '2754 Meadow Lane, San Francisco, CA 94108'),
(56, 'jacoblee', '$2y$10$2zS62z1UY3YFMg3ABEv9kOk3RIArjK4VC/uhsW6wkbTUGIZ5mRRtS', 'jacob.lee@example.com', 'Jacob Lee', '9735550186', '2024-04-28', '2024-04-28', '4900 Hilltop Haven Drive, Newark, NJ 07102'),
(57, 'miachavez', '$2y$10$2zS62z1UY3YFMg3ABEv9kOk3RIArjK4VC/uhsW6wkbTUGIZ5mRRtS', 'mia.chavez@example.com', 'Mia Chavez', '2135550129', '2024-04-28', '2024-04-28', '4861 Oakwood Circle, Los Angeles, CA 90017'),
(58, 'lucasmoore', '$2y$10$2zS62z1UY3YFMg3ABEv9kOk3RIArjK4VC/uhsW6wkbTUGIZ5mRRtS', 'lucas.moore@example.com', 'Lucas Moore', '2155550194', '2024-04-28', '2024-04-28', '1031 Franklee Lane, Philadelphia, PA 19108'),
(59, 'ameliadavis', '$2y$10$2zS62z1UY3YFMg3ABEv9kOk3RIArjK4VC/uhsW6wkbTUGIZ5mRRtS', 'amelia.davis@example.com', 'Amelia Davis', '7045550141', '2024-04-28', '2024-04-28', '4467 Hannah Street, Charlotte, NC 28202'),
(60, 'matthewharris', '$2y$10$2zS62z1UY3YFMg3ABEv9kOk3RIArjK4VC/uhsW6wkbTUGIZ5mRRtS', 'matthew.harris@example.com', 'Matthew Harris', '8135550110', '2024-04-28', '2024-04-28', '3191 Monroe Avenue, Tampa, FL 33602'),
(61, 'isabella.ross', '$2y$10$2zS62z1UY3YFMg3ABEv9kOk3RIArjK4VC/uhsW6wkbTUGIZ5mRRtS', 'isabella.ross@example.com', 'Isabella Ross', '9165550101', '2024-04-28', '2024-04-28', '7832 Oak Drive, Sacramento, CA 95814'),
(62, 'jack.miller', '$2y$10$2zS62z1UY3YFMg3ABEv9kOk3RIArjK4VC/uhsW6wkbTUGIZ5mRRtS', 'jack.miller@example.com', 'Jack Miller', '4045550122', '2024-04-28', '2024-04-28', '4692 Pine Street, Atlanta, GA 30303'),
(63, 'sophia.lopez', '$2y$10$2zS62z1UY3YFMg3ABEv9kOk3RIArjK4VC/uhsW6wkbTUGIZ5mRRtS', 'sophia.lopez@example.com', 'Sophia Lopez', '7205550133', '2024-04-28', '2024-04-28', '6581 Elm Lane, Denver, CO 80202'),
(64, 'aiden.smith', '$2y$10$2zS62z1UY3YFMg3ABEv9kOk3RIArjK4VC/uhsW6wkbTUGIZ5mRRtS', 'aiden.smith@example.com', 'Aiden Smith', '6175550144', '2024-04-28', '2024-04-28', '2934 Maple Court, Boston, MA 02108'),
(65, 'olivia.jones', '$2y$10$2zS62z1UY3YFMg3ABEv9kOk3RIArjK4VC/uhsW6wkbTUGIZ5mRRtS', 'olivia.jones@example.com', 'Olivia Jones', '6025550155', '2024-04-28', '2024-04-28', '8704 Cedar Street, Phoenix, AZ 85001'),
(66, 'mason.davis', '$2y$10$2zS62z1UY3YFMg3ABEv9kOk3RIArjK4VC/uhsW6wkbTUGIZ5mRRtS', 'mason.davis@example.com', 'Mason Davis', '5035550166', '2024-04-28', '2024-04-28', '3825 Oak Avenue, Portland, OR 97204'),
(67, 'emma.wilson', '$2y$10$2zS62z1UY3YFMg3ABEv9kOk3RIArjK4VC/uhsW6wkbTUGIZ5mRRtS', 'emma.wilson@example.com', 'Emma Wilson', '3125550177', '2024-04-28', '2024-04-28', '2176 Ash Lane, Chicago, IL 60605'),
(68, 'logan.moore', '$2y$10$2zS62z1UY3YFMg3ABEv9kOk3RIArjK4VC/uhsW6wkbTUGIZ5mRRtS', 'logan.moore@example.com', 'Logan Moore', '7135550188', '2024-04-28', '2024-04-28', '4258 Pine Street, Houston, TX 77002'),
(69, 'amelia.taylor', '$2y$10$2zS62z1UY3YFMg3ABEv9kOk3RIArjK4VC/uhsW6wkbTUGIZ5mRRtS', 'amelia.taylor@example.com', 'Amelia Taylor', '3055550199', '2024-04-28', '2024-04-28', '6352 Birch Street, Miami, FL 33101'),
(70, 'james.anderson', '$2y$10$2zS62z1UY3YFMg3ABEv9kOk3RIArjK4VC/uhsW6wkbTUGIZ5mRRtS', 'james.anderson@example.com', 'James Anderson', '2125550200', '2024-04-28', '2024-04-28', '9486 Cedar Drive, New York, NY 10001'),
(71, 'charlotte.thomas', '$2y$10$2zS62z1UY3YFMg3ABEv9kOk3RIArjK4VC/uhsW6wkbTUGIZ5mRRtS', 'charlotte.thomas@example.com', 'Charlotte Thomas', '2065550211', '2024-04-28', '2024-04-28', '2045 Maple Avenue, Seattle, WA 98101'),
(72, 'oliver.jackson', '$2y$10$2zS62z1UY3YFMg3ABEv9kOk3RIArjK4VC/uhsW6wkbTUGIZ5mRRtS', 'oliver.jackson@example.com', 'Oliver Jackson', '6125550222', '2024-04-28', '2024-04-28', '6712 Elm Street, Minneapolis, MN 55415'),
(73, 'ava.white', '$2y$10$2zS62z1UY3YFMg3ABEv9kOk3RIArjK4VC/uhsW6wkbTUGIZ5mRRtS', 'ava.white@example.com', 'Ava White', '4155550233', '2024-04-28', '2024-04-28', '7930 Oak Drive, San Francisco, CA 94103'),
(74, 'elijah.harris', '$2y$10$2zS62z1UY3YFMg3ABEv9kOk3RIArjK4VC/uhsW6wkbTUGIZ5mRRtS', 'elijah.harris@example.com', 'Elijah Harris', '2135550244', '2024-04-28', '2024-04-28', '3665 Birch Street, Los Angeles, CA 90017'),
(75, 'mia.martin', '$2y$10$2zS62z1UY3YFMg3ABEv9kOk3RIArjK4VC/uhsW6wkbTUGIZ5mRRtS', 'mia.martin@example.com', 'Mia Martin', '2145550255', '2024-04-28', '2024-04-28', '4896 Pine Street, Dallas, TX 75201'),
(76, 'harper.lee', '$2y$10$2zS62z1UY3YFMg3ABEv9kOk3RIArjK4VC/uhsW6wkbTUGIZ5mRRtS', 'harper.lee@example.com', 'Harper Lee', '4045550266', '2024-04-28', '2024-04-28', '7323 Cedar Avenue, Atlanta, GA 30303'),
(77, 'ethan.clark', '$2y$10$2zS62z1UY3YFMg3ABEv9kOk3RIArjK4VC/uhsW6wkbTUGIZ5mRRtS', 'ethan.clark@example.com', 'Ethan Clark', '8165550277', '2024-04-28', '2024-04-28', '8745 Ash Street, Kansas City, MO 64106'),
(78, 'abigail.lewis', '$2y$10$2zS62z1UY3YFMg3ABEv9kOk3RIArjK4VC/uhsW6wkbTUGIZ5mRRtS', 'abigail.lewis@example.com', 'Abigail Lewis', '2155550288', '2024-04-28', '2024-04-28', '5487 Elm Lane, Philadelphia, PA 19103'),
(79, 'liam.walker', '$2y$10$2zS62z1UY3YFMg3ABEv9kOk3RIArjK4VC/uhsW6wkbTUGIZ5mRRtS', 'liam.walker@example.com', 'Liam Walker', '4105550299', '2024-04-28', '2024-04-28', '1023 Birch Drive, Baltimore, MD 21202'),
(80, 'ella.hall', '$2y$10$2zS62z1UY3YFMg3ABEv9kOk3RIArjK4VC/uhsW6wkbTUGIZ5mRRtS', 'ella.hall@example.com', 'Ella Hall', '2165550300', '2024-04-28', '2024-04-28', '3674 Maple Court, Cleveland, OH 44115'),
(81, 'thrall', '$2y$10$2zS62z1UY3YFMg3ABEv9kOk3RIArjK4VC/uhsW6wkbTUGIZ5mRRtS', 'thrall@example.com', 'Thrall Warchief', '5550000001', '2024-04-28', '2024-04-28', 'Orgrimmar, Durotar'),
(82, 'jaina', '$2y$10$2zS62z1UY3YFMg3ABEv9kOk3RIArjK4VC/uhsW6wkbTUGIZ5mRRtS', 'jaina@example.com', 'Jaina Proudmoore', '5550000002', '2024-04-28', '2024-04-28', 'Theramore Isle'),
(83, 'arthas', '$2y$10$2zS62z1UY3YFMg3ABEv9kOk3RIArjK4VC/uhsW6wkbTUGIZ5mRRtS', 'arthas@example.com', 'Arthas Menethil', '5550000003', '2024-04-28', '2024-04-28', 'Icecrown Citadel'),
(84, 'sylvanas', '$2y$10$2zS62z1UY3YFMg3ABEv9kOk3RIArjK4VC/uhsW6wkbTUGIZ5mRRtS', 'sylvanas@example.com', 'Sylvanas Windrunner', '5550000004', '2024-04-28', '2024-04-28', 'Undercity, Lordaeron'),
(85, 'illidan', '$2y$10$2zS62z1UY3YFMg3ABEv9kOk3RIArjK4VC/uhsW6wkbTUGIZ5mRRtS', 'illidan@example.com', 'Illidan Stormrage', '5550000005', '2024-04-28', '2024-04-28', 'The Black Temple'),
(86, 'anduin', '$2y$10$2zS62z1UY3YFMg3ABEv9kOk3RIArjK4VC/uhsW6wkbTUGIZ5mRRtS', 'anduin@example.com', 'Anduin Wrynn', '5550000006', '2024-04-28', '2024-04-28', 'Stormwind Castle'),
(87, 'tyrande', '$2y$10$2zS62z1UY3YFMg3ABEv9kOk3RIArjK4VC/uhsW6wkbTUGIZ5mRRtS', 'tyrande@example.com', 'Tyrande Whisperwind', '5550000007', '2024-04-28', '2024-04-28', 'Temple of the Moon, Darnassus'),
(88, 'guldan', '$2y$10$2zS62z1UY3YFMg3ABEv9kOk3RIArjK4VC/uhsW6wkbTUGIZ5mRRtS', 'guldan@example.com', 'Gul\'dan', '5550000008', '2024-04-28', '2024-04-28', 'Tomb of Sargeras'),
(89, 'garrosh', '$2y$10$2zS62z1UY3YFMg3ABEv9kOk3RIArjK4VC/uhsW6wkbTUGIZ5mRRtS', 'garrosh@example.com', 'Garrosh Hellscream', '5550000009', '2024-04-28', '2024-04-28', 'Grommash Hold, Orgrimmar'),
(90, 'varian', '$2y$10$2zS62z1UY3YFMg3ABEv9kOk3RIArjK4VC/uhsW6wkbTUGIZ5mRRtS', 'varian@example.com', 'Varian Wrynn', '5550000010', '2024-04-28', '2024-04-28', 'Stormwind Keep');

-- --------------------------------------------------------

--
-- Table structure for table `waitlist_table`
--

CREATE TABLE `waitlist_table` (
  `waitlist_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `course_id` varchar(15) NOT NULL,
  `position` int(11) NOT NULL,
  `added_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `waitlist_table`
--

INSERT INTO `waitlist_table` (`waitlist_id`, `user_id`, `course_id`, `position`, `added_date`) VALUES
(3, 62, 'CSC103', 2, '2024-04-28'),
(4, 63, 'CSC103', 3, '2024-04-28'),
(5, 64, 'CSC103', 4, '2024-04-28'),
(6, 65, 'CSC103', 5, '2024-04-28'),
(7, 66, 'CSC103', 6, '2024-04-28'),
(8, 67, 'CSC103', 7, '2024-04-28'),
(9, 68, 'CSC103', 8, '2024-04-28'),
(10, 69, 'CSC103', 9, '2024-04-28'),
(11, 70, 'CSC103', 10, '2024-04-28');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `courses_table`
--
ALTER TABLE `courses_table`
  ADD PRIMARY KEY (`course_id`);

--
-- Indexes for table `enrollment_table`
--
ALTER TABLE `enrollment_table`
  ADD PRIMARY KEY (`enrollment_id`);

--
-- Indexes for table `users_table`
--
ALTER TABLE `users_table`
  ADD PRIMARY KEY (`user_id`);

--
-- Indexes for table `waitlist_table`
--
ALTER TABLE `waitlist_table`
  ADD PRIMARY KEY (`waitlist_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `enrollment_table`
--
ALTER TABLE `enrollment_table`
  MODIFY `enrollment_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=81;

--
-- AUTO_INCREMENT for table `users_table`
--
ALTER TABLE `users_table`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=91;

--
-- AUTO_INCREMENT for table `waitlist_table`
--
ALTER TABLE `waitlist_table`
  MODIFY `waitlist_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

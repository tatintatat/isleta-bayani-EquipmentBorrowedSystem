-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Host: sql313.infinityfree.com
-- Generation Time: Apr 04, 2026 at 01:49 AM
-- Server version: 11.4.10-MariaDB
-- PHP Version: 7.2.22

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `if0_41554928_db_equipment_borrowing`
--

-- --------------------------------------------------------

--
-- Table structure for table `borrow_records`
--

CREATE TABLE `borrow_records` (
  `id` int(11) NOT NULL,
  `borrower_name` varchar(150) NOT NULL,
  `borrower_email` varchar(150) DEFAULT NULL,
  `borrower_contact` varchar(50) DEFAULT NULL,
  `department` varchar(100) DEFAULT NULL,
  `equipment_id` int(11) NOT NULL,
  `quantity_borrowed` int(11) NOT NULL DEFAULT 1,
  `purpose` text DEFAULT NULL,
  `borrow_date` date NOT NULL,
  `expected_return` date NOT NULL,
  `actual_return` date DEFAULT NULL,
  `status` enum('Borrowed','Returned','Overdue') DEFAULT 'Borrowed',
  `notes` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `borrow_records`
--

INSERT INTO `borrow_records` (`id`, `borrower_name`, `borrower_email`, `borrower_contact`, `department`, `equipment_id`, `quantity_borrowed`, `purpose`, `borrow_date`, `expected_return`, `actual_return`, `status`, `notes`, `created_at`) VALUES
(1, 'Boss Rhein', 'rhein@danag.edu', '09171234567', 'Computer Science', 1, 1, 'Thesis project development', '2026-03-11', '2026-04-04', NULL, 'Borrowed', 'Idol Boss Rhein to', '2026-04-02 05:00:41'),
(2, 'Lee Pang Asu', 'leepangasu@rico.edu.ph', '09281234567', 'Information Technology', 4, 1, 'IoT class project', '2026-03-18', '2026-04-06', NULL, 'Borrowed', '', '2026-04-02 05:00:41'),
(3, 'Nicko Albus', 'nickoalbes@inclover.ph', '09391234567', 'Team Solid', 7, 1, 'Embedded systems project', '2026-03-25', '2026-04-01', NULL, 'Borrowed', '', '2026-04-02 05:00:41');

-- --------------------------------------------------------

--
-- Table structure for table `equipment`
--

CREATE TABLE `equipment` (
  `id` int(11) NOT NULL,
  `name` varchar(150) NOT NULL,
  `category` varchar(100) NOT NULL,
  `description` text DEFAULT NULL,
  `serial_number` varchar(100) DEFAULT NULL,
  `total_quantity` int(11) NOT NULL DEFAULT 1,
  `available_quantity` int(11) NOT NULL DEFAULT 1,
  `condition_status` enum('Excellent','Good','Fair','Needs Repair') DEFAULT 'Good',
  `image_url` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `equipment`
--

INSERT INTO `equipment` (`id`, `name`, `category`, `description`, `serial_number`, `total_quantity`, `available_quantity`, `condition_status`, `image_url`, `created_at`) VALUES
(1, 'Laptop - Dell Inspiron 15', 'Computing', '15.6\" FHD display, Intel Core i5, 8GB RAM, 512GB SSD', 'DL-INS-2024-001', 5, 4, 'Excellent', NULL, '2026-04-02 05:00:41'),
(2, 'Projector - Epson EX3280', 'Presentation', '3LCD projector, SVGA, 3,600 lumens brightness', 'EP-EX32-2023-001', 3, 3, 'Good', NULL, '2026-04-02 05:00:41'),
(3, 'DSLR Camera - Canon EOS 2000D', 'Photography', '24.1MP APS-C CMOS sensor, Full HD video', 'CN-EOS2-2022-001', 2, 2, 'Good', NULL, '2026-04-02 05:00:41'),
(4, 'Arduino Uno R3 Kit', 'Electronics', 'Microcontroller board with sensors and components kit', 'AR-UNO-2024-001', 10, 9, 'Excellent', NULL, '2026-04-02 05:00:41'),
(5, 'Oscilloscope - Rigol DS1054Z', 'Electronics', '4-channel digital oscilloscope, 50MHz bandwidth', 'RG-DS10-2023-001', 2, 2, 'Good', NULL, '2026-04-02 05:00:41'),
(6, 'Portable Speaker - JBL Charge 5', 'Audio', 'Bluetooth portable speaker with IP67 waterproof rating', 'JBL-CH5-2024-001', 4, 4, 'Excellent', NULL, '2026-04-02 05:00:41'),
(7, 'Raspberry Pi 4 Model B', 'Computing', '4GB RAM, Broadcom BCM2711 quad-core Cortex-A72', 'RP-PI4-2024-001', 8, 7, 'Excellent', NULL, '2026-04-02 05:00:41'),
(8, 'Tripod - Manfrotto MT055', 'Photography', 'Professional aluminum tripod, max height 170cm', 'MF-MT05-2022-001', 3, 3, 'Fair', NULL, '2026-04-02 05:00:41'),
(9, 'Soldering Station - Hakko FX-888D', 'Electronics', 'Digital soldering station, temperature range 200–480°C', 'HK-FX88-2023-001', 2, 2, 'Good', NULL, '2026-04-02 05:00:41'),
(10, 'Extension Cord 10m', 'Utilities', 'Heavy-duty 3-socket extension cord with surge protection', 'EC-10M-2024-001', 6, 6, 'Good', NULL, '2026-04-02 05:00:41');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `borrow_records`
--
ALTER TABLE `borrow_records`
  ADD PRIMARY KEY (`id`),
  ADD KEY `equipment_id` (`equipment_id`);

--
-- Indexes for table `equipment`
--
ALTER TABLE `equipment`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `borrow_records`
--
ALTER TABLE `borrow_records`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `equipment`
--
ALTER TABLE `equipment`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";

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

INSERT INTO `borrow_records` (`id`, `borrower_name`, `borrower_email`, `borrower_contact`, `department`, `equipment_id`, `quantity_borrowed`, `purpose`, `borrow_date`, `expected_return`, `actual_return`, `status`, `notes`, `created_at`) VALUES
(1, 'Boss Rhein', 'rhein@danag.edu', '09171234567', 'Computer Science', 1, 1, 'Thesis project development', '2026-03-11', '2026-04-04', NULL, 'Borrowed', 'Idol Boss Rhein to', '2026-04-02 05:00:41'),
(2, 'Lee Pang Asu', 'leepangasu@rico.edu.ph', '09281234567', 'Information Technology', 4, 1, 'IoT class project', '2026-03-18', '2026-04-06', NULL, 'Borrowed', '', '2026-04-02 05:00:41'),
(3, 'Nicko Albus', 'nickoalbes@inclover.ph', '09391234567', 'Team Solid', 7, 1, 'Embedded systems project', '2026-03-25', '2026-04-01', NULL, 'Borrowed', '', '2026-04-02 05:00:41');

CREATE TABLE `equipment` (
  `id` int(11) NOT NULL,
  `name` varchar(150) NOT NULL,
  `category` varchar(100) NOT NULL,
  `description` text DEFAULT NULL,
  `total_quantity` int(11) NOT NULL DEFAULT 1,
  `available_quantity` int(11) NOT NULL DEFAULT 1,
  `condition_status` enum('Excellent','Good','Fair','Needs Repair') DEFAULT 'Good',
  `image_url` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

INSERT INTO `equipment` (`id`, `name`, `category`, `description`, `total_quantity`, `available_quantity`, `condition_status`, `image_url`, `created_at`) VALUES
(1, 'Laptop - Dell Inspiron 15', 'Computing', '15.6\" FHD display, Intel Core i5, 8GB RAM, 512GB SSD', 5, 4, 'Excellent', NULL, '2026-04-02 05:00:41'),
(2, 'Projector - Epson EX3280', 'Presentation', '3LCD projector, SVGA, 3,600 lumens brightness', 3, 3, 'Good', NULL, '2026-04-02 05:00:41'),
(3, 'DSLR Camera - Canon EOS 2000D', 'Photography', '24.1MP APS-C CMOS sensor, Full HD video', 2, 2, 'Good', NULL, '2026-04-02 05:00:41'),
(4, 'Arduino Uno R3 Kit', 'Electronics', 'Microcontroller board with sensors and components kit', 10, 9, 'Excellent', NULL, '2026-04-02 05:00:41'),
(5, 'Oscilloscope - Rigol DS1054Z', 'Electronics', '4-channel digital oscilloscope, 50MHz bandwidth', 2, 2, 'Good', NULL, '2026-04-02 05:00:41'),
(6, 'Portable Speaker - JBL Charge 5', 'Audio', 'Bluetooth portable speaker with IP67 waterproof rating', 4, 4, 'Excellent', NULL, '2026-04-02 05:00:41'),
(7, 'Raspberry Pi 4 Model B', 'Computing', '4GB RAM, Broadcom BCM2711 quad-core Cortex-A72', 8, 7, 'Excellent', NULL, '2026-04-02 05:00:41'),
(8, 'Tripod - Manfrotto MT055', 'Photography', 'Professional aluminum tripod, max height 170cm', 3, 3, 'Fair', NULL, '2026-04-02 05:00:41'),
(9, 'Soldering Station - Hakko FX-888D', 'Electronics', 'Digital soldering station, temperature range 200–480°C', 2, 2, 'Good', NULL, '2026-04-02 05:00:41'),
(10, 'Extension Cord 10m', 'Utilities', 'Heavy-duty 3-socket extension cord with surge protection', 6, 6, 'Good', NULL, '2026-04-02 05:00:41');

ALTER TABLE `borrow_records`
  ADD PRIMARY KEY (`id`),
  ADD KEY `equipment_id` (`equipment_id`);


ALTER TABLE `equipment`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `borrow_records`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

ALTER TABLE `equipment`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
COMMIT;

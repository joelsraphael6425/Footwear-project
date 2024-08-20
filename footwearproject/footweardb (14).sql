-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 17, 2024 at 04:42 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `footweardb`
--

-- --------------------------------------------------------

--
-- Table structure for table `auth_group`
--

CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL,
  `name` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `auth_group_permissions`
--

CREATE TABLE `auth_group_permissions` (
  `id` bigint(20) NOT NULL,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `auth_permission`
--

CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `auth_permission`
--

INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
(1, 'Can add footwear', 1, 'add_footwear'),
(2, 'Can change footwear', 1, 'change_footwear'),
(3, 'Can delete footwear', 1, 'delete_footwear'),
(4, 'Can view footwear', 1, 'view_footwear'),
(5, 'Can add log entry', 2, 'add_logentry'),
(6, 'Can change log entry', 2, 'change_logentry'),
(7, 'Can delete log entry', 2, 'delete_logentry'),
(8, 'Can view log entry', 2, 'view_logentry'),
(9, 'Can add permission', 3, 'add_permission'),
(10, 'Can change permission', 3, 'change_permission'),
(11, 'Can delete permission', 3, 'delete_permission'),
(12, 'Can view permission', 3, 'view_permission'),
(13, 'Can add group', 4, 'add_group'),
(14, 'Can change group', 4, 'change_group'),
(15, 'Can delete group', 4, 'delete_group'),
(16, 'Can view group', 4, 'view_group'),
(17, 'Can add user', 5, 'add_user'),
(18, 'Can change user', 5, 'change_user'),
(19, 'Can delete user', 5, 'delete_user'),
(20, 'Can view user', 5, 'view_user'),
(21, 'Can add content type', 6, 'add_contenttype'),
(22, 'Can change content type', 6, 'change_contenttype'),
(23, 'Can delete content type', 6, 'delete_contenttype'),
(24, 'Can view content type', 6, 'view_contenttype'),
(25, 'Can add session', 7, 'add_session'),
(26, 'Can change session', 7, 'change_session'),
(27, 'Can delete session', 7, 'delete_session'),
(28, 'Can view session', 7, 'view_session'),
(29, 'Can add customer', 8, 'add_customer'),
(30, 'Can change customer', 8, 'change_customer'),
(31, 'Can delete customer', 8, 'delete_customer'),
(32, 'Can view customer', 8, 'view_customer'),
(33, 'Can add bill', 9, 'add_bill'),
(34, 'Can change bill', 9, 'change_bill'),
(35, 'Can delete bill', 9, 'delete_bill'),
(36, 'Can view bill', 9, 'view_bill'),
(37, 'Can add bill item', 10, 'add_billitem'),
(38, 'Can change bill item', 10, 'change_billitem'),
(39, 'Can delete bill item', 10, 'delete_billitem'),
(40, 'Can view bill item', 10, 'view_billitem'),
(41, 'Can add custom user', 11, 'add_customuser'),
(42, 'Can change custom user', 11, 'change_customuser'),
(43, 'Can delete custom user', 11, 'delete_customuser'),
(44, 'Can view custom user', 11, 'view_customuser'),
(45, 'Can add otp code', 12, 'add_otpcode'),
(46, 'Can change otp code', 12, 'change_otpcode'),
(47, 'Can delete otp code', 12, 'delete_otpcode'),
(48, 'Can view otp code', 12, 'view_otpcode');

-- --------------------------------------------------------

--
-- Table structure for table `auth_user`
--

CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_groups`
--

CREATE TABLE `auth_user_groups` (
  `id` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_user_permissions`
--

CREATE TABLE `auth_user_user_permissions` (
  `id` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `django_admin_log`
--

CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext DEFAULT NULL,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) UNSIGNED NOT NULL CHECK (`action_flag` >= 0),
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `django_content_type`
--

CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(2, 'admin', 'logentry'),
(4, 'auth', 'group'),
(3, 'auth', 'permission'),
(5, 'auth', 'user'),
(6, 'contenttypes', 'contenttype'),
(9, 'footwearapp', 'bill'),
(10, 'footwearapp', 'billitem'),
(8, 'footwearapp', 'customer'),
(11, 'footwearapp', 'customuser'),
(1, 'footwearapp', 'footwear'),
(12, 'footwearapp', 'otpcode'),
(7, 'sessions', 'session');

-- --------------------------------------------------------

--
-- Table structure for table `django_migrations`
--

CREATE TABLE `django_migrations` (
  `id` bigint(20) NOT NULL,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'contenttypes', '0001_initial', '2024-08-02 04:27:57.831491'),
(2, 'auth', '0001_initial', '2024-08-02 04:27:58.284986'),
(3, 'admin', '0001_initial', '2024-08-02 04:27:58.378670'),
(4, 'admin', '0002_logentry_remove_auto_add', '2024-08-02 04:27:58.385817'),
(5, 'admin', '0003_logentry_add_action_flag_choices', '2024-08-02 04:27:58.394540'),
(6, 'contenttypes', '0002_remove_content_type_name', '2024-08-02 04:27:58.481488'),
(7, 'auth', '0002_alter_permission_name_max_length', '2024-08-02 04:27:58.528406'),
(8, 'auth', '0003_alter_user_email_max_length', '2024-08-02 04:27:58.541105'),
(9, 'auth', '0004_alter_user_username_opts', '2024-08-02 04:27:58.547406'),
(10, 'auth', '0005_alter_user_last_login_null', '2024-08-02 04:27:58.591298'),
(11, 'auth', '0006_require_contenttypes_0002', '2024-08-02 04:27:58.593669'),
(12, 'auth', '0007_alter_validators_add_error_messages', '2024-08-02 04:27:58.601216'),
(13, 'auth', '0008_alter_user_username_max_length', '2024-08-02 04:27:58.613767'),
(14, 'auth', '0009_alter_user_last_name_max_length', '2024-08-02 04:27:58.630121'),
(15, 'auth', '0010_alter_group_name_max_length', '2024-08-02 04:27:58.644800'),
(16, 'auth', '0011_update_proxy_permissions', '2024-08-02 04:27:58.651104'),
(17, 'auth', '0012_alter_user_first_name_max_length', '2024-08-02 04:27:58.665121'),
(18, 'footwearapp', '0001_initial', '2024-08-02 04:27:58.677856'),
(19, 'sessions', '0001_initial', '2024-08-02 04:27:58.705333'),
(20, 'footwearapp', '0002_bill_customer_billitem_bill_customer', '2024-08-13 04:51:38.825128'),
(21, 'footwearapp', '0003_remove_bill_customer_remove_billitem_bill_and_more', '2024-08-13 05:56:14.669417'),
(22, 'footwearapp', '0004_bill_customer_billitem_bill_customer', '2024-08-13 06:07:52.253744'),
(23, 'footwearapp', '0005_remove_bill_customer_remove_billitem_bill_and_more', '2024-08-13 06:16:48.040554'),
(24, 'footwearapp', '0006_bill_customer_billitem_bill_customer', '2024-08-13 06:21:20.292978'),
(25, 'footwearapp', '0007_customuser_alter_bill_options_alter_billitem_options', '2024-08-14 16:18:39.746034'),
(26, 'footwearapp', '0008_alter_footwear_size', '2024-08-15 10:04:00.329469'),
(27, 'footwearapp', '0009_alter_footwear_size', '2024-08-15 10:04:00.335467'),
(28, 'footwearapp', '0010_otpcode', '2024-08-15 16:01:26.411492'),
(29, 'footwearapp', '0011_alter_otpcode_created_at', '2024-08-15 20:04:06.294503');

-- --------------------------------------------------------

--
-- Table structure for table `django_session`
--

CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `django_session`
--

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
('15ywko5cjc28fey0ai9gueiknjpawoel', 'eyJ1c2VyX2lkIjoyNH0:1sebZe:m4N8gEgk9bnu39KXto9px_YaBrvxFqWfU6zP79h_OMw', '2024-08-29 20:05:34.493209'),
('fdpenc4aph2les0rysypq1iv80izoiyi', 'eyJ1c2VyX2lkIjo1fQ:1seTRK:atL-AO0xymfUFwgMRnMKBDNC-Ihgc1XYvumjo_hXIgk', '2024-08-29 11:24:26.865698'),
('hsxeg1g18a1cs0bm2njzp9as76kf4miw', 'eyJ1c2VyX2lkIjozM30:1sfJcZ:ksjYHMWf_8nIMXDaaWn4leKVWws6o4cDSNqskbWGIGo', '2024-08-31 19:07:31.701776');

-- --------------------------------------------------------

--
-- Table structure for table `footwearapp_bill`
--

CREATE TABLE `footwearapp_bill` (
  `id` bigint(20) NOT NULL,
  `bill_code` varchar(10) NOT NULL,
  `date` date NOT NULL,
  `time` time(6) NOT NULL,
  `total_amount` decimal(10,2) NOT NULL,
  `gst_amount` decimal(10,2) NOT NULL,
  `grand_total` decimal(10,2) NOT NULL,
  `customer_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `footwearapp_bill`
--

INSERT INTO `footwearapp_bill` (`id`, `bill_code`, `date`, `time`, `total_amount`, `gst_amount`, `grand_total`, `customer_id`) VALUES
(52, 'MOYRBFZQUM', '2024-08-14', '09:52:45.835622', 2311.00, 415.98, 2726.98, 6),
(63, 'AGNGUNLALK', '2024-08-17', '20:01:10.828321', 2400.00, 288.00, 2688.00, 6),
(65, 'JNHH6QB7PI', '2024-08-17', '20:06:09.946208', 1111.00, 199.98, 1310.98, 6);

-- --------------------------------------------------------

--
-- Table structure for table `footwearapp_billitem`
--

CREATE TABLE `footwearapp_billitem` (
  `id` bigint(20) NOT NULL,
  `quantity` int(200) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `total_price` decimal(10,2) NOT NULL,
  `bill_id` bigint(20) NOT NULL,
  `footwear_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `footwearapp_billitem`
--

INSERT INTO `footwearapp_billitem` (`id`, `quantity`, `price`, `total_price`, `bill_id`, `footwear_id`) VALUES
(45, 1, 1111.00, 1111.00, 52, 3),
(46, 1, 1200.00, 1200.00, 52, 1),
(58, 2, 1200.00, 2400.00, 63, 1),
(59, 1, 1111.00, 1111.00, 65, 3);

-- --------------------------------------------------------

--
-- Table structure for table `footwearapp_customer`
--

CREATE TABLE `footwearapp_customer` (
  `id` bigint(20) NOT NULL,
  `name` varchar(100) NOT NULL,
  `email` varchar(254) DEFAULT NULL,
  `phone` varchar(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `footwearapp_customer`
--

INSERT INTO `footwearapp_customer` (`id`, `name`, `email`, `phone`) VALUES
(6, 'jafar khan', 'jafarkhan6425@gmail.com', '08156852084'),
(7, 'james khan', 'jafarkhan6425@gmail.com', '08156852084'),
(8, 'coustomer11', 'xx@gmail.com', '08156852084');

-- --------------------------------------------------------

--
-- Table structure for table `footwearapp_customuser`
--

CREATE TABLE `footwearapp_customuser` (
  `id` bigint(20) NOT NULL,
  `username` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `password` varchar(128) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `footwearapp_customuser`
--

INSERT INTO `footwearapp_customuser` (`id`, `username`, `email`, `password`, `first_name`, `last_name`) VALUES
(12, 'black007', 'ushatchr6425@gmail.com', 'pbkdf2_sha256$720000$feZ8YCuMvYOq2Dfwva4yIH$YwOCKsmOM0MCUOP4ERk8NK49R5k4f8EVkoG4gfKu8a8=', 'jafar', 'khan'),
(33, 'prijin007', 'blackorlov9656@gmail.com', 'pbkdf2_sha256$720000$dDYpNNvEYxrelWGjVVeW6P$PbxMNOVJLa+iAAXO+Z8U6IYKh8rTv2pazreO3UswTpg=', 'jafar', 'khan');

-- --------------------------------------------------------

--
-- Table structure for table `footwearapp_footwear`
--

CREATE TABLE `footwearapp_footwear` (
  `id` bigint(20) NOT NULL,
  `company_name` varchar(100) NOT NULL,
  `image` varchar(100) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `color` varchar(30) NOT NULL,
  `model` varchar(50) NOT NULL,
  `size` varchar(10) NOT NULL,
  `name` varchar(100) NOT NULL,
  `quantity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `footwearapp_footwear`
--

INSERT INTO `footwearapp_footwear` (`id`, `company_name`, `image`, `price`, `color`, `model`, `size`, `name`, `quantity`) VALUES
(1, 'Nike', 'footwear_images/Screenshot_2024-08-02_101200.png', 1200.00, 'Red', 'Air Max 270', '42', 'Nike Air Max 270 Red', 8),
(3, 'yey', 'footwear_images/view-soccer-shoes.jpg', 1111.00, 'Blue', 'Rarw', '42', 'Laxmi Agarwal', 7);

-- --------------------------------------------------------

--
-- Table structure for table `footwearapp_otpcode`
--

CREATE TABLE `footwearapp_otpcode` (
  `id` bigint(20) NOT NULL,
  `code` varchar(6) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `user_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `auth_group`
--
ALTER TABLE `auth_group`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  ADD KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`);

--
-- Indexes for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`);

--
-- Indexes for table `auth_user`
--
ALTER TABLE `auth_user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  ADD KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`);

--
-- Indexes for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  ADD KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`);

--
-- Indexes for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  ADD KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`);

--
-- Indexes for table `django_content_type`
--
ALTER TABLE `django_content_type`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`);

--
-- Indexes for table `django_migrations`
--
ALTER TABLE `django_migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `django_session`
--
ALTER TABLE `django_session`
  ADD PRIMARY KEY (`session_key`),
  ADD KEY `django_session_expire_date_a5c62663` (`expire_date`);

--
-- Indexes for table `footwearapp_bill`
--
ALTER TABLE `footwearapp_bill`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `bill_code` (`bill_code`),
  ADD KEY `footwearapp_bill_customer_id_92464681_fk_footwearapp_customer_id` (`customer_id`);

--
-- Indexes for table `footwearapp_billitem`
--
ALTER TABLE `footwearapp_billitem`
  ADD PRIMARY KEY (`id`),
  ADD KEY `footwearapp_billitem_bill_id_9f7b865d_fk_footwearapp_bill_id` (`bill_id`),
  ADD KEY `footwearapp_billitem_footwear_id_67bc5af1_fk_footweara` (`footwear_id`);

--
-- Indexes for table `footwearapp_customer`
--
ALTER TABLE `footwearapp_customer`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `footwearapp_customuser`
--
ALTER TABLE `footwearapp_customuser`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `footwearapp_footwear`
--
ALTER TABLE `footwearapp_footwear`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `footwearapp_otpcode`
--
ALTER TABLE `footwearapp_otpcode`
  ADD PRIMARY KEY (`id`),
  ADD KEY `footwearapp_otpcode_user_id_951f6792_fk_footweara` (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `auth_group`
--
ALTER TABLE `auth_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_permission`
--
ALTER TABLE `auth_permission`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=49;

--
-- AUTO_INCREMENT for table `auth_user`
--
ALTER TABLE `auth_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `django_content_type`
--
ALTER TABLE `django_content_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `django_migrations`
--
ALTER TABLE `django_migrations`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT for table `footwearapp_bill`
--
ALTER TABLE `footwearapp_bill`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=69;

--
-- AUTO_INCREMENT for table `footwearapp_billitem`
--
ALTER TABLE `footwearapp_billitem`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=62;

--
-- AUTO_INCREMENT for table `footwearapp_customer`
--
ALTER TABLE `footwearapp_customer`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `footwearapp_customuser`
--
ALTER TABLE `footwearapp_customuser`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT for table `footwearapp_footwear`
--
ALTER TABLE `footwearapp_footwear`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `footwearapp_otpcode`
--
ALTER TABLE `footwearapp_otpcode`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`);

--
-- Constraints for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`);

--
-- Constraints for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  ADD CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  ADD CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `footwearapp_bill`
--
ALTER TABLE `footwearapp_bill`
  ADD CONSTRAINT `footwearapp_bill_customer_id_92464681_fk_footwearapp_customer_id` FOREIGN KEY (`customer_id`) REFERENCES `footwearapp_customer` (`id`);

--
-- Constraints for table `footwearapp_billitem`
--
ALTER TABLE `footwearapp_billitem`
  ADD CONSTRAINT `footwearapp_billitem_bill_id_9f7b865d_fk_footwearapp_bill_id` FOREIGN KEY (`bill_id`) REFERENCES `footwearapp_bill` (`id`),
  ADD CONSTRAINT `footwearapp_billitem_footwear_id_67bc5af1_fk_footweara` FOREIGN KEY (`footwear_id`) REFERENCES `footwearapp_footwear` (`id`);

--
-- Constraints for table `footwearapp_otpcode`
--
ALTER TABLE `footwearapp_otpcode`
  ADD CONSTRAINT `footwearapp_otpcode_user_id_951f6792_fk_footweara` FOREIGN KEY (`user_id`) REFERENCES `footwearapp_customuser` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

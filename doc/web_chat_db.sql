-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Creato il: Giu 14, 2022 alle 15:30
-- Versione del server: 10.4.18-MariaDB
-- Versione PHP: 8.0.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `web_chat_db`
--

-- --------------------------------------------------------

--
-- Struttura della tabella `auth_group`
--

CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL,
  `name` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struttura della tabella `auth_group_permissions`
--

CREATE TABLE `auth_group_permissions` (
  `id` bigint(20) NOT NULL,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struttura della tabella `auth_permission`
--

CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dump dei dati per la tabella `auth_permission`
--

INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
(1, 'Can add log entry', 1, 'add_logentry'),
(2, 'Can change log entry', 1, 'change_logentry'),
(3, 'Can delete log entry', 1, 'delete_logentry'),
(4, 'Can view log entry', 1, 'view_logentry'),
(5, 'Can add permission', 2, 'add_permission'),
(6, 'Can change permission', 2, 'change_permission'),
(7, 'Can delete permission', 2, 'delete_permission'),
(8, 'Can view permission', 2, 'view_permission'),
(9, 'Can add group', 3, 'add_group'),
(10, 'Can change group', 3, 'change_group'),
(11, 'Can delete group', 3, 'delete_group'),
(12, 'Can view group', 3, 'view_group'),
(13, 'Can add user', 4, 'add_user'),
(14, 'Can change user', 4, 'change_user'),
(15, 'Can delete user', 4, 'delete_user'),
(16, 'Can view user', 4, 'view_user'),
(17, 'Can add content type', 5, 'add_contenttype'),
(18, 'Can change content type', 5, 'change_contenttype'),
(19, 'Can delete content type', 5, 'delete_contenttype'),
(20, 'Can view content type', 5, 'view_contenttype'),
(21, 'Can add session', 6, 'add_session'),
(22, 'Can change session', 6, 'change_session'),
(23, 'Can delete session', 6, 'delete_session'),
(24, 'Can view session', 6, 'view_session');

-- --------------------------------------------------------

--
-- Struttura della tabella `auth_user`
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dump dei dati per la tabella `auth_user`
--

INSERT INTO `auth_user` (`id`, `password`, `last_login`, `is_superuser`, `username`, `first_name`, `last_name`, `email`, `is_staff`, `is_active`, `date_joined`) VALUES
(2, 'pbkdf2_sha256$260000$TET3RnhXoJFq6VZTzCOQIG$s+pGvG+ZlTV96scMqjFVKGRggjTxxkjYt7EOGFugyIU=', '2022-04-03 16:03:22.420585', 1, 'admin', '', '', 'admin@admin.com', 1, 1, '2022-04-03 16:02:51.909984'),
(3, 'pbkdf2_sha256$260000$UJKbg40gnQgIljOcZtZ286$8TxAyUhvmig29vuiVZv3uKAhZrs4v88M8Akt8SBoSdU=', NULL, 0, 'WS_SERVER', '', '', '', 0, 1, '2022-04-03 16:04:35.968045');

-- --------------------------------------------------------

--
-- Struttura della tabella `auth_user_groups`
--

CREATE TABLE `auth_user_groups` (
  `id` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struttura della tabella `auth_user_user_permissions`
--

CREATE TABLE `auth_user_user_permissions` (
  `id` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struttura della tabella `block`
--

CREATE TABLE `block` (
  `user_id` varchar(255) NOT NULL,
  `user_id_blocked` varchar(255) DEFAULT NULL,
  `group_id_blocked` int(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struttura della tabella `django_admin_log`
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dump dei dati per la tabella `django_admin_log`
--

INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES
(1, '2022-04-03 16:04:36.247111', '3', 'WS_SERVER', 1, '[{\"added\": {}}]', 4, 2);

-- --------------------------------------------------------

--
-- Struttura della tabella `django_content_type`
--

CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dump dei dati per la tabella `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(1, 'admin', 'logentry'),
(3, 'auth', 'group'),
(2, 'auth', 'permission'),
(4, 'auth', 'user'),
(5, 'contenttypes', 'contenttype'),
(6, 'sessions', 'session');

-- --------------------------------------------------------

--
-- Struttura della tabella `django_migrations`
--

CREATE TABLE `django_migrations` (
  `id` bigint(20) NOT NULL,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dump dei dati per la tabella `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'contenttypes', '0001_initial', '2022-04-03 12:45:55.699470'),
(2, 'auth', '0001_initial', '2022-04-03 12:46:10.310903'),
(3, 'admin', '0001_initial', '2022-04-03 12:46:13.262254'),
(4, 'admin', '0002_logentry_remove_auto_add', '2022-04-03 12:46:13.324751'),
(5, 'admin', '0003_logentry_add_action_flag_choices', '2022-04-03 12:46:13.434166'),
(6, 'contenttypes', '0002_remove_content_type_name', '2022-04-03 12:46:14.543496'),
(7, 'auth', '0002_alter_permission_name_max_length', '2022-04-03 12:46:15.902868'),
(8, 'auth', '0003_alter_user_email_max_length', '2022-04-03 12:46:16.215324'),
(9, 'auth', '0004_alter_user_username_opts', '2022-04-03 12:46:16.309030'),
(10, 'auth', '0005_alter_user_last_login_null', '2022-04-03 12:46:17.777812'),
(11, 'auth', '0006_require_contenttypes_0002', '2022-04-03 12:46:17.840309'),
(12, 'auth', '0007_alter_validators_add_error_messages', '2022-04-03 12:46:17.949685'),
(13, 'auth', '0008_alter_user_username_max_length', '2022-04-03 12:46:18.168367'),
(14, 'auth', '0009_alter_user_last_name_max_length', '2022-04-03 12:46:18.324683'),
(15, 'auth', '0010_alter_group_name_max_length', '2022-04-03 12:46:18.824688'),
(16, 'auth', '0011_update_proxy_permissions', '2022-04-03 12:46:18.996563'),
(17, 'auth', '0012_alter_user_first_name_max_length', '2022-04-03 12:46:19.152862'),
(18, 'sessions', '0001_initial', '2022-04-03 12:46:19.809064');

-- --------------------------------------------------------

--
-- Struttura della tabella `django_session`
--

CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dump dei dati per la tabella `django_session`
--

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
('086ximjqc9jo1sgjewci6st5w6ypdvfx', '.eJwlzNtugjAAgOF36fVI7EQGJl60GOwcGKag3jUCDYxDT1oOM767Zrv9_-S7g1aUJSvA8g7MlWl-6RhYAiwy8PYX6M_rgUZyfwZFPGz1viuMUhY7_Dbvcvu12LjrIPT1Lfzg8eRMpGzPueiyUWivQQk5OjKep7JHqxc4XOnF3Kp_E44tgVGfc85sLRe8Unh3jiycp_uBJUHMJiNzNAXMTZOiQTrbqaSbGaqlBw8qqEcbfUa1r912bVNHeBsqv2HfVBiSUA51Qemc4JNnKVmuwOPxBIn7T4Q:1ncAKw:bW47uP2oQNVLRtkVG6WyQT-mE3m-Z_xm5QdpBlzd1a4', '2022-04-20 18:24:58.896169'),
('0ehs4cev6ooggt26qf38i59gvxc0ioka', '.eJwlzNtugjAAgOF36fVMGIeRmXihzLIhMEAD4k3TWKAcS-k4WOO7z2y3_598d9CwosgIWN_BKLKhw20G1sDCQ4PBy19C5fOCunJuoVcYxzD6Wt3SGkrZXryFEpdNXHH01QLnSdWSiNf5h7tFZ2Rcgk6zJle8xxo0c5ttnuAsEB5_6L9ZbWdKg-JtTsTOZeNYQZYFoiaMxGbq94uzN5TmqPkHM9LtXcJhHFLvZKvna3xls-qXopW9te9LEtZpZ0psIMlK_VNpGjvnr98DP3AeLJwn3gY8Hr8QilDi:1ngS96:ZPYe5S74tPRoQ907FOS2oT0OWwwRBuspRG2Wy9jm_8c', '2022-05-02 14:14:28.955287'),
('1b7h0e8kez3mt93hc6zl9ntstdd146yj', '.eJwlzNtugjAAgOF36fVI7EQGJl60GOwcGKag3jUCDYxDT1oOM767Zrv9_-S7g1aUJSvA8g7MlWl-6RhYAiwy8PYX6M_rgUZyfwZFPGz1viuMUhY7_Dbvcvu12LjrIPT1Lfzg8eRMpGzPueiyUWivQQk5OjKep7JHqxc4XOnF3Kp_E44tgVGfc85sLRe8Unh3jiycp_uBJUHMJiNzNAXMTZOiQTrbqaSbGaqlBw8qqEcbfUa1r912bVNHeBsqv2HfVBiSUA51Qemc4JNnKVmuwOPxBIn7T4Q:1ngSQX:8ZuJUUVs-q_xQiilg0CCpLGehAXfYNpB317x1L5DmWc', '2022-05-02 14:32:29.610741'),
('2iuvo8ks1o1asnvgs0or5eanouwlswwb', '.eJwlzNtugjAAgOF36fVI7EQGJl60GOwcGKag3jUCDYxDT1oOM767Zrv9_-S7g1aUJSvA8g7MlWl-6RhYAiwy8PYX6M_rgUZyfwZFPGz1viuMUhY7_Dbvcvu12LjrIPT1Lfzg8eRMpGzPueiyUWivQQk5OjKep7JHqxc4XOnF3Kp_E44tgVGfc85sLRe8Unh3jiycp_uBJUHMJiNzNAXMTZOiQTrbqaSbGaqlBw8qqEcbfUa1r912bVNHeBsqv2HfVBiSUA51Qemc4JNnKVmuwOPxBIn7T4Q:1ngSyM:aWKXJgvV2OhEPqwgMjYGnqksWiEikOpsWhUycIXwaGE', '2022-05-02 15:07:26.847651'),
('2jeyt4dh9rdi5a5vssbs48jqxfpsxbhe', '.eJwlzNtugjAAgOF36fWaKCgHEy-aKZtsHGsY48ZUhFqtdbYUK8Z3n9lu_z_57oCfKW12YHYHWjVSkFMDZuBVMgVe_sqGPScwsNfvE-E6sF2oaBUWrWd-khaL4-BaKZ5ma-8tbHsnE9UX9Wj4rWPnYg_IsfxtiQY-HWXzJ3hVG6K7_b9ZYLfu2jSMK_8q-AEJaQ6d4J_nUpYJ08Re7xvTVDfjFRnkEfMXwYXZfhDA4QQpGkX1ckuSca7i5ZHW-Zh82D20cIdo7qZeLHPcm9XO3IiZzMHj8QsJs06P:1nn3Y0:T6frug8VXylfdpymNqM0W_XmDiHY-uYJkyFUDHJXsfw', '2022-05-20 19:23:28.012402'),
('2kmaroi59mtyo4gz07topywlx7lw3zu8', '.eJwlzNtugjAAgOF36fVMGIeRmXihzLIhMEAD4k3TWKAcS-k4WOO7z2y3_598d9CwosgIWN_BKLKhw20G1sDCQ4PBy19C5fOCunJuoVcYxzD6Wt3SGkrZXryFEpdNXHH01QLnSdWSiNf5h7tFZ2Rcgk6zJle8xxo0c5ttnuAsEB5_6L9ZbWdKg-JtTsTOZeNYQZYFoiaMxGbq94uzN5TmqPkHM9LtXcJhHFLvZKvna3xls-qXopW9te9LEtZpZ0psIMlK_VNpGjvnr98DP3AeLJwn3gY8Hr8QilDi:1nheXY:fCRhx-ZtwZH-FNgbdrgxQpjgzZUw2YTknJ4qsNJ76Zo', '2022-05-05 21:40:40.393319'),
('2s45bkjvquraaqt0xya143rimv12a88y', '.eJwlzNtugjAAgOF36fVMGIeRmXihzLIhMEAD4k3TWKAcS-k4WOO7z2y3_598d9CwosgIWN_BKLKhw20G1sDCQ4PBy19C5fOCunJuoVcYxzD6Wt3SGkrZXryFEpdNXHH01QLnSdWSiNf5h7tFZ2Rcgk6zJle8xxo0c5ttnuAsEB5_6L9ZbWdKg-JtTsTOZeNYQZYFoiaMxGbq94uzN5TmqPkHM9LtXcJhHFLvZKvna3xls-qXopW9te9LEtZpZ0psIMlK_VNpGjvnr98DP3AeLJwn3gY8Hr8QilDi:1niM94:DYwQorjXhc1womKpcQAVhmk4B8dH49v4qbIxBMkAasI', '2022-05-07 20:14:18.706043'),
('2x30cevdkxvekqmqr6x6mn5qvd49klcc', '.eJwlzNtugjAAgOF36fVMGIeRmXihzLIhMEAD4k3TWKAcS-k4WOO7z2y3_598d9CwosgIWN_BKLKhw20G1sDCQ4PBy19C5fOCunJuoVcYxzD6Wt3SGkrZXryFEpdNXHH01QLnSdWSiNf5h7tFZ2Rcgk6zJle8xxo0c5ttnuAsEB5_6L9ZbWdKg-JtTsTOZeNYQZYFoiaMxGbq94uzN5TmqPkHM9LtXcJhHFLvZKvna3xls-qXopW9te9LEtZpZ0psIMlK_VNpGjvnr98DP3AeLJwn3gY8Hr8QilDi:1niXcW:EcajwTH-TwfOhgRRdBg7b6yIVfstdSfqo_UgWQTNM3Q', '2022-05-08 08:29:28.866107'),
('31s70q82t9j3taa5fofx3d7352gcgjr8', '.eJwlzNtugjAAgOF36fVIcMyiJt5gJ0drF0XhigB2lEM5toIxvvvIvP3_5HuCqskyegObJ5AD7euYU7ABuz4fwMd_ifJ5gl6nWjH5Wnq0Esh6PnnO0lgRV2G7xHWw17eo6GTQZCVXDWIs2uBbEogZF8rDNT2u02E7g-MQxVKwtxmx4HII1XWmfpVL7MowddbV8XCCe9QioxUd3Du2n0BoX3-Rjn_I-dMfp8V5vBOjIIOm1B4mjeChaV1vj1TajVvO2sq8V3mtCqsLE1TFKChptgWv1x_gck4-:1nih1p:S68wPY3DL5Dy7iRH2xt7oNm99SpuId65lY4ngioollQ', '2022-05-08 18:32:13.481401'),
('3uq8ydjqvyqesdb5s4lrona4vva2qe8q', '.eJwlzNtugjAAgOF36fVMGIeRmXihzLIhMEAD4k3TWKAcS-k4WOO7z2y3_598d9CwosgIWN_BKLKhw20G1sDCQ4PBy19C5fOCunJuoVcYxzD6Wt3SGkrZXryFEpdNXHH01QLnSdWSiNf5h7tFZ2Rcgk6zJle8xxo0c5ttnuAsEB5_6L9ZbWdKg-JtTsTOZeNYQZYFoiaMxGbq94uzN5TmqPkHM9LtXcJhHFLvZKvna3xls-qXopW9te9LEtZpZ0psIMlK_VNpGjvnr98DP3AeLJwn3gY8Hr8QilDi:1niIWu:jiBg-iJmEsenGYKHrteSrIyNcSM_Iqn26paPryqJoWo', '2022-05-07 16:22:40.778403'),
('4rcxwuhh6o3ime0c8lewe8w1dlvate73', '.eJwlzNtugjAAgOF36fVI7EQGJl60GOwcGKag3jUCDYxDT1oOM767Zrv9_-S7g1aUJSvA8g7MlWl-6RhYAiwy8PYX6M_rgUZyfwZFPGz1viuMUhY7_Dbvcvu12LjrIPT1Lfzg8eRMpGzPueiyUWivQQk5OjKep7JHqxc4XOnF3Kp_E44tgVGfc85sLRe8Unh3jiycp_uBJUHMJiNzNAXMTZOiQTrbqaSbGaqlBw8qqEcbfUa1r912bVNHeBsqv2HfVBiSUA51Qemc4JNnKVmuwOPxBIn7T4Q:1ngVGP:zU7MJWU7J21DqSUjQKeLfxcT1USP7T2C9K-_nb5IgFA', '2022-05-02 17:34:13.061815'),
('6p8472ebvojp9drdoe5c47weh63hicob', '.eJwlzNtugjAAgOF36fVI7EQGJl60GOwcGKag3jUCDYxDT1oOM767Zrv9_-S7g1aUJSvA8g7MlWl-6RhYAiwy8PYX6M_rgUZyfwZFPGz1viuMUhY7_Dbvcvu12LjrIPT1Lfzg8eRMpGzPueiyUWivQQk5OjKep7JHqxc4XOnF3Kp_E44tgVGfc85sLRe8Unh3jiycp_uBJUHMJiNzNAXMTZOiQTrbqaSbGaqlBw8qqEcbfUa1r912bVNHeBsqv2HfVBiSUA51Qemc4JNnKVmuwOPxBIn7T4Q:1ngnZM:LhvlW31UmU8ngcZRkDP-UzRRZH_ElEsAsUG99X2POMA', '2022-05-03 13:07:00.878994'),
('7c0uhqe27d4p19aobadvy2oa754qshwl', '.eJwlzNtugjAAgOF36fVMGIeRmXihzLIhMEAD4k3TWKAcS-k4WOO7z2y3_598d9CwosgIWN_BKLKhw20G1sDCQ4PBy19C5fOCunJuoVcYxzD6Wt3SGkrZXryFEpdNXHH01QLnSdWSiNf5h7tFZ2Rcgk6zJle8xxo0c5ttnuAsEB5_6L9ZbWdKg-JtTsTOZeNYQZYFoiaMxGbq94uzN5TmqPkHM9LtXcJhHFLvZKvna3xls-qXopW9te9LEtZpZ0psIMlK_VNpGjvnr98DP3AeLJwn3gY8Hr8QilDi:1nde0J:1C-UB0hyep-0IBUm9vlS0k1sELKXOXUgkV510Gu3TDQ', '2022-04-24 20:17:47.322589'),
('7x5mrlu7un6ics1vkt5j5f6kg6w0rtz2', '.eJwlzNtugjAAgOF36fVMGIeRmXihzLIhMEAD4k3TWKAcS-k4WOO7z2y3_598d9CwosgIWN_BKLKhw20G1sDCQ4PBy19C5fOCunJuoVcYxzD6Wt3SGkrZXryFEpdNXHH01QLnSdWSiNf5h7tFZ2Rcgk6zJle8xxo0c5ttnuAsEB5_6L9ZbWdKg-JtTsTOZeNYQZYFoiaMxGbq94uzN5TmqPkHM9LtXcJhHFLvZKvna3xls-qXopW9te9LEtZpZ0psIMlK_VNpGjvnr98DP3AeLJwn3gY8Hr8QilDi:1nigkW:_d1zGGTbSRuPYBPacp6id3dWg2_Ovy7G0d828-c6Rko', '2022-05-08 18:14:20.572680'),
('9qzx8pr72dfq6hyvue4cj7g7meu0oz3l', '.eJwlzNtugjAAgOF36fVI7EQGJl60GOwcGKag3jUCDYxDT1oOM767Zrv9_-S7g1aUJSvA8g7MlWl-6RhYAiwy8PYX6M_rgUZyfwZFPGz1viuMUhY7_Dbvcvu12LjrIPT1Lfzg8eRMpGzPueiyUWivQQk5OjKep7JHqxc4XOnF3Kp_E44tgVGfc85sLRe8Unh3jiycp_uBJUHMJiNzNAXMTZOiQTrbqaSbGaqlBw8qqEcbfUa1r912bVNHeBsqv2HfVBiSUA51Qemc4JNnKVmuwOPxBIn7T4Q:1ngTfb:30XA6CYeqIY3LDejdmb7A_Uj_CpEadiApjkXXycuEw4', '2022-05-02 15:52:07.904526'),
('a3bkd15d9wdruoy3t1jo1kx8y8ptcccg', '.eJwlzNtugjAAgOF36fVI7EQGJl60GOwcGKag3jUCDYxDT1oOM767Zrv9_-S7g1aUJSvA8g7MlWl-6RhYAiwy8PYX6M_rgUZyfwZFPGz1viuMUhY7_Dbvcvu12LjrIPT1Lfzg8eRMpGzPueiyUWivQQk5OjKep7JHqxc4XOnF3Kp_E44tgVGfc85sLRe8Unh3jiycp_uBJUHMJiNzNAXMTZOiQTrbqaSbGaqlBw8qqEcbfUa1r912bVNHeBsqv2HfVBiSUA51Qemc4JNnKVmuwOPxBIn7T4Q:1nddvz:e598AvIhmpZb7rU7eQok5TG-H6mBihgYy7outLFnpbY', '2022-04-24 20:13:19.743920'),
('an1ti2ujlfqy9u81d4zjwvfxls6kv7t8', '.eJwlzMlugkAAgOF3mXObUFAKJh5YpAIlDMgWLpMRJ-MUWYdV47vXtNf_T74HuDWUkgvYPcDISV_jioAdMHDFwNtfQew1gQR_TOtIj_Uy3FNxFdQMT7PjNZ5b2v1t3FSkZ5kWxUmyxhPKXWjFh20EM5a32gf_SiRd2b_AmSM8Dtd_szPMSPu2mOy9K5tA2IYy_LyoHZRtnOrU5EExODbKZ0lCd-Qbqp9cw0PW2aJghOdJJZZHfCoWLQmGMsVLq5cnZ1Vml8O-pi3MeH42mlO_1KzYg-fzF-LeTqs:1ncA5b:o2VSkoo-CykIdmzeIbV1sMSbSrEoelLqo9DpAw507r8', '2022-04-20 18:09:07.622408'),
('byimkhxmhwbrjs8lkrabo8bejf03wdgl', '.eJwlzNtugjAAgOF36fVI7EQGJl60GOwcGKag3jUCDYxDT1oOM767Zrv9_-S7g1aUJSvA8g7MlWl-6RhYAiwy8PYX6M_rgUZyfwZFPGz1viuMUhY7_Dbvcvu12LjrIPT1Lfzg8eRMpGzPueiyUWivQQk5OjKep7JHqxc4XOnF3Kp_E44tgVGfc85sLRe8Unh3jiycp_uBJUHMJiNzNAXMTZOiQTrbqaSbGaqlBw8qqEcbfUa1r912bVNHeBsqv2HfVBiSUA51Qemc4JNnKVmuwOPxBIn7T4Q:1nibtb:xhiYZuaa1VQMAGROzINzWt2W1OVLf3BNdrw--N_P9Y8', '2022-05-08 13:03:23.636461'),
('c7284uu90z1s7cofiaa591mj1d9daomk', '.eJwlzNtugjAAgOF36fVMGIeRmXihzLIhMEAD4k3TWKAcS-k4WOO7z2y3_598d9CwosgIWN_BKLKhw20G1sDCQ4PBy19C5fOCunJuoVcYxzD6Wt3SGkrZXryFEpdNXHH01QLnSdWSiNf5h7tFZ2Rcgk6zJle8xxo0c5ttnuAsEB5_6L9ZbWdKg-JtTsTOZeNYQZYFoiaMxGbq94uzN5TmqPkHM9LtXcJhHFLvZKvna3xls-qXopW9te9LEtZpZ0psIMlK_VNpGjvnr98DP3AeLJwn3gY8Hr8QilDi:1niY9H:SN1EU1XhNbqFq0Ds0OfXpdo9Fi50DxPvkXJaZ6-OpM0', '2022-05-08 09:03:19.759321'),
('dytog5mim88q7a66e1k7elwpksvr44hx', '.eJwlzNtugjAAgOF36fVI7EQGJl60GOwcGKag3jUCDYxDT1oOM767Zrv9_-S7g1aUJSvA8g7MlWl-6RhYAiwy8PYX6M_rgUZyfwZFPGz1viuMUhY7_Dbvcvu12LjrIPT1Lfzg8eRMpGzPueiyUWivQQk5OjKep7JHqxc4XOnF3Kp_E44tgVGfc85sLRe8Unh3jiycp_uBJUHMJiNzNAXMTZOiQTrbqaSbGaqlBw8qqEcbfUa1r912bVNHeBsqv2HfVBiSUA51Qemc4JNnKVmuwOPxBIn7T4Q:1ncA69:XMWeAOezaDztEOwpR9gU8t6XOlgTHlDiXlKO0LIv0Bg', '2022-04-20 18:09:41.587601'),
('flop6u1ydm649aujg5ltqs3fumx15qja', '.eJwlzNtugjAAgOF36fVI7EQGJl60GOwcGKag3jUCDYxDT1oOM767Zrv9_-S7g1aUJSvA8g7MlWl-6RhYAiwy8PYX6M_rgUZyfwZFPGz1viuMUhY7_Dbvcvu12LjrIPT1Lfzg8eRMpGzPueiyUWivQQk5OjKep7JHqxc4XOnF3Kp_E44tgVGfc85sLRe8Unh3jiycp_uBJUHMJiNzNAXMTZOiQTrbqaSbGaqlBw8qqEcbfUa1r912bVNHeBsqv2HfVBiSUA51Qemc4JNnKVmuwOPxBIn7T4Q:1ngpNe:iD7PJ-XHSwKhG8ZC-TsINnWUA9x2a1GwPBrCsLhRg9w', '2022-05-03 15:03:02.187401'),
('gvmrr19m6rgrw0x7b4fr9nvc3l5fccjl', '.eJwlzNtugjAAgOF36fVI7EQGJl60GOwcGKag3jUCDYxDT1oOM767Zrv9_-S7g1aUJSvA8g7MlWl-6RhYAiwy8PYX6M_rgUZyfwZFPGz1viuMUhY7_Dbvcvu12LjrIPT1Lfzg8eRMpGzPueiyUWivQQk5OjKep7JHqxc4XOnF3Kp_E44tgVGfc85sLRe8Unh3jiycp_uBJUHMJiNzNAXMTZOiQTrbqaSbGaqlBw8qqEcbfUa1r912bVNHeBsqv2HfVBiSUA51Qemc4JNnKVmuwOPxBIn7T4Q:1ngTld:ZdmttluUNvbuYfyjqjI_p-z5F527y7VaeSal6GISDFw', '2022-05-02 15:58:21.661967'),
('i75fr9h8vi6f1d1v56tba33exelm46o6', '.eJwlzNtugjAAgOF36fVIcMyiJt5gJ0drF0XhigB2lEM5toIxvvvIvP3_5HuCqskyegObJ5AD7euYU7ABuz4fwMd_ifJ5gl6nWjH5Wnq0Esh6PnnO0lgRV2G7xHWw17eo6GTQZCVXDWIs2uBbEogZF8rDNT2u02E7g-MQxVKwtxmx4HII1XWmfpVL7MowddbV8XCCe9QioxUd3Du2n0BoX3-Rjn_I-dMfp8V5vBOjIIOm1B4mjeChaV1vj1TajVvO2sq8V3mtCqsLE1TFKChptgWv1x_gck4-:1nhqyR:dsSj3WwQk_9uXwx4EQGiQj75oaFy7ip7_7jcnxCCB8c', '2022-05-06 10:57:15.935492'),
('j7fad88scz49i5o2vsb2y2s0z0urfhr1', '.eJwlzNtugjAAgOF36fVI7EQGJl60GOwcGKag3jUCDYxDT1oOM767Zrv9_-S7g1aUJSvA8g7MlWl-6RhYAiwy8PYX6M_rgUZyfwZFPGz1viuMUhY7_Dbvcvu12LjrIPT1Lfzg8eRMpGzPueiyUWivQQk5OjKep7JHqxc4XOnF3Kp_E44tgVGfc85sLRe8Unh3jiycp_uBJUHMJiNzNAXMTZOiQTrbqaSbGaqlBw8qqEcbfUa1r912bVNHeBsqv2HfVBiSUA51Qemc4JNnKVmuwOPxBIn7T4Q:1nigs1:YreRfigOtnjHdi5WBN0UknS1Mixh3UFwqUqiX3Myi7Q', '2022-05-08 18:22:05.105078'),
('kiqrkq5y4o8flcpesxmiomb33deqbow4', '.eJwlzNtugjAAgOF36fVI7EQGJl60GOwcGKag3jUCDYxDT1oOM767Zrv9_-S7g1aUJSvA8g7MlWl-6RhYAiwy8PYX6M_rgUZyfwZFPGz1viuMUhY7_Dbvcvu12LjrIPT1Lfzg8eRMpGzPueiyUWivQQk5OjKep7JHqxc4XOnF3Kp_E44tgVGfc85sLRe8Unh3jiycp_uBJUHMJiNzNAXMTZOiQTrbqaSbGaqlBw8qqEcbfUa1r912bVNHeBsqv2HfVBiSUA51Qemc4JNnKVmuwOPxBIn7T4Q:1nic7B:ll-CHEMi_Iib2cEpCzL30bYHHqkAZvrs0dIS6lil8jw', '2022-05-08 13:17:25.052866'),
('ku06gjh632a1qzvwhb2adbbzaghu2mo7', '.eJwlzNtugjAAgOF36fVMGIeRmXihzLIhMEAD4k3TWKAcS-k4WOO7z2y3_598d9CwosgIWN_BKLKhw20G1sDCQ4PBy19C5fOCunJuoVcYxzD6Wt3SGkrZXryFEpdNXHH01QLnSdWSiNf5h7tFZ2Rcgk6zJle8xxo0c5ttnuAsEB5_6L9ZbWdKg-JtTsTOZeNYQZYFoiaMxGbq94uzN5TmqPkHM9LtXcJhHFLvZKvna3xls-qXopW9te9LEtZpZ0psIMlK_VNpGjvnr98DP3AeLJwn3gY8Hr8QilDi:1nc9ec:pUQhSuZoSNhF8dE25Pk0JhbW-9fniGGxVs5PtsVdPyw', '2022-04-20 17:41:14.528637'),
('l6t6mlcv3565ynboaomiahlpln5ve832', '.eJwlzN1ugjAAQOF36fVIiMMfTLyhIuBkwEAEbwjQpkKFQmtlqfHdNdvtOcn3AFdGCEZg_QBSYN6XHQZrYLEKfPyFonk_UPAuWuZmQ3a0MtWCd3Zq13fs12Eba64__Hwm53PDv1k20uXBuF_MlRvRScYsr7aG08a52LzBSRSlvF3-Tc_ZO4PnaGqsWtXTjB7tr10E9V9kiVUI3WCCipGr7HE5wjToR4IinqOAed5B-hZP5sKy59BNtJMe1ouZCNlWHlUqY5QOqDHaGdFldstUYmzA8_kCW69Pig:1nn3YP:l1KVZaoPWwukCHFm7ltmgPmH1T5aD8DiuEWJ7TEEjeA', '2022-05-20 19:23:53.132437'),
('ll6249xxj6dmh6zd67e66z7lu8de5ga1', '.eJwlzNtugjAAgOF36fVIcMyiJt5gJ0drF0XhigB2lEM5toIxvvvIvP3_5HuCqskyegObJ5AD7euYU7ABuz4fwMd_ifJ5gl6nWjH5Wnq0Esh6PnnO0lgRV2G7xHWw17eo6GTQZCVXDWIs2uBbEogZF8rDNT2u02E7g-MQxVKwtxmx4HII1XWmfpVL7MowddbV8XCCe9QioxUd3Du2n0BoX3-Rjn_I-dMfp8V5vBOjIIOm1B4mjeChaV1vj1TajVvO2sq8V3mtCqsLE1TFKChptgWv1x_gck4-:1nc9zg:At35nS1hhAFthWjj-BGvL7gKriSrrsL_NtXB-zgmLiU', '2022-04-20 18:03:00.999458'),
('m0si0nhsfqxq0y74gknytvamkhijgxc3', '.eJxVj8luwjAURf_Fa0DGZDISm5AyJCGkKpRkhezYzjyQgUGIf29okSq299x7nt4dZGUYcgamd9A1vC5IzsEUzOu4AYPf5Bj3ENQqnyTX_STYrqgS1fnVNmVdc61hNKeW6dh1ZSSnzivDNIe6q48r76NzFSfK2-HNWtq5yptZL7w0R9K10Z_zGHnfGx_iEEqp7FidH5g4226-lIVRGXrVnpSFud5TRVkfhKE6n-4O7S_X8e5ydvXEbSbDwnbcss395erAbkG3Lq20t2nLcxYXsF2dfGpkxPBSHs7AYwD-Tv__hMBbRkmQ8uIJWEKKsBwFZdHWMR09K6MXbUabkvFMf3XfBBFpon4tIyRJkEkBRghDGhCJQaggogpNUIlJGhaQsr4lY4QlWQiNEKRBJiDHgmABHj8a6YVH:1nbT7g:27Erdpg5yB62xAouuVIVuY8Yy53I4X4OtARjuWUsfeM', '2022-04-18 20:16:24.955828'),
('majo5385loul2ou11xqroafc6wjoy0e9', '.eJwlzNtugjAAgOF36fVI7EQGJl60GOwcGKag3jUCDYxDT1oOM767Zrv9_-S7g1aUJSvA8g7MlWl-6RhYAiwy8PYX6M_rgUZyfwZFPGz1viuMUhY7_Dbvcvu12LjrIPT1Lfzg8eRMpGzPueiyUWivQQk5OjKep7JHqxc4XOnF3Kp_E44tgVGfc85sLRe8Unh3jiycp_uBJUHMJiNzNAXMTZOiQTrbqaSbGaqlBw8qqEcbfUa1r912bVNHeBsqv2HfVBiSUA51Qemc4JNnKVmuwOPxBIn7T4Q:1ncAAR:8cOfoUOMZSIbdEXNcHELYaGM9rMnrBLeGwaU0X8Z0kY', '2022-04-20 18:14:07.201143'),
('mbk3ojjqssz7fpa9pa626x77opjimosf', '.eJwlzNtugjAAgOF36fVI7EQGJl60GOwcGKag3jUCDYxDT1oOM767Zrv9_-S7g1aUJSvA8g7MlWl-6RhYAiwy8PYX6M_rgUZyfwZFPGz1viuMUhY7_Dbvcvu12LjrIPT1Lfzg8eRMpGzPueiyUWivQQk5OjKep7JHqxc4XOnF3Kp_E44tgVGfc85sLRe8Unh3jiycp_uBJUHMJiNzNAXMTZOiQTrbqaSbGaqlBw8qqEcbfUa1r912bVNHeBsqv2HfVBiSUA51Qemc4JNnKVmuwOPxBIn7T4Q:1nig81:8flK3GQddYKAQH2i9m2F9x0fY5LU8OnsF3Odu1OHK4Q', '2022-05-08 17:34:33.080069'),
('mxdlhte7zeugo43zxwxifno2xbo4sz91', '.eJwlzNtugjAAgOF36fVI7EQGJl60GOwcGKag3jUCDYxDT1oOM767Zrv9_-S7g1aUJSvA8g7MlWl-6RhYAiwy8PYX6M_rgUZyfwZFPGz1viuMUhY7_Dbvcvu12LjrIPT1Lfzg8eRMpGzPueiyUWivQQk5OjKep7JHqxc4XOnF3Kp_E44tgVGfc85sLRe8Unh3jiycp_uBJUHMJiNzNAXMTZOiQTrbqaSbGaqlBw8qqEcbfUa1r912bVNHeBsqv2HfVBiSUA51Qemc4JNnKVmuwOPxBIn7T4Q:1nigBt:fxiZYrZQhTSgvRgw28-YuV_THucat4yNNGrfld5G-4k', '2022-05-08 17:38:33.356611'),
('n8xokwoiaam83ax0x7m375g32tnzifjh', '.eJwljNFugjAAAP-lzzMZrAwx8YGBc6KCMCvaF9IiVBBKkWEB47-PbG-Xu-QeoKgYS85g9gBtk9w4KRMwAxYpswy8_KkoGyu40cOCfQbbU3t3I1TAKlidYeW_y72YonzQNz7BMjus41Q77owKp7QuzDd5UZkdK4VC2h9_Pg5lE414-X-KVOswj31H7yAiYb28opAL6lldN0jLNXq1XfYQOVsF2ortiW_muItq0gSbL6YPETlpNK09cd3RfI0wOYalqepTs-f9Pl9ZYT6RmsE_Yh8Hr3PwfP4CGxFPtg:1ngt0t:gLWoDINW8gHGKqgAVypS9BbWa5xQgM5Eg-uExUTHjw4', '2022-05-03 18:55:47.216719'),
('ndzjiue3n5tzlbdscr1w3k9v0m1zgk5d', '.eJwlzNtugjAAgOF36fVI7EQGJl60GOwcGKag3jUCDYxDT1oOM767Zrv9_-S7g1aUJSvA8g7MlWl-6RhYAiwy8PYX6M_rgUZyfwZFPGz1viuMUhY7_Dbvcvu12LjrIPT1Lfzg8eRMpGzPueiyUWivQQk5OjKep7JHqxc4XOnF3Kp_E44tgVGfc85sLRe8Unh3jiycp_uBJUHMJiNzNAXMTZOiQTrbqaSbGaqlBw8qqEcbfUa1r912bVNHeBsqv2HfVBiSUA51Qemc4JNnKVmuwOPxBIn7T4Q:1ngTlF:fljCV9pUwlYEJc9zxyDsfw3w9pyTPvLOdybktQ1xrX8', '2022-05-02 15:57:57.777032'),
('omdknyt8wcmt18vtvuocmrsj5awkqfo1', '.eJwlzNtugjAAgOF36fVIcMyiJt5gJ0drF0XhigB2lEM5toIxvvvIvP3_5HuCqskyegObJ5AD7euYU7ABuz4fwMd_ifJ5gl6nWjH5Wnq0Esh6PnnO0lgRV2G7xHWw17eo6GTQZCVXDWIs2uBbEogZF8rDNT2u02E7g-MQxVKwtxmx4HII1XWmfpVL7MowddbV8XCCe9QioxUd3Du2n0BoX3-Rjn_I-dMfp8V5vBOjIIOm1B4mjeChaV1vj1TajVvO2sq8V3mtCqsLE1TFKChptgWv1x_gck4-:1nbT82:-e_s7tHRSKMtUvsJGUbwu0-61l3G7BeEbO8sxxmuuek', '2022-04-18 20:16:46.076704'),
('ozp840v97k8riaepl0z0sj7y6654ry91', '.eJwlzNtugjAAgOF36fVI7EQGJl60GOwcGKag3jUCDYxDT1oOM767Zrv9_-S7g1aUJSvA8g7MlWl-6RhYAiwy8PYX6M_rgUZyfwZFPGz1viuMUhY7_Dbvcvu12LjrIPT1Lfzg8eRMpGzPueiyUWivQQk5OjKep7JHqxc4XOnF3Kp_E44tgVGfc85sLRe8Unh3jiycp_uBJUHMJiNzNAXMTZOiQTrbqaSbGaqlBw8qqEcbfUa1r912bVNHeBsqv2HfVBiSUA51Qemc4JNnKVmuwOPxBIn7T4Q:1ngVVg:4t0YzEOFGcsnPtJQa2_DeSMZluxFO-OZchLqQ_yaoMI', '2022-05-02 17:50:00.003701'),
('p0f04vyarpi097is0v784biwj3jjz9nm', '.eJwlzNtugjAAgOF36fVI7EQGJl60GOwcGKag3jUCDYxDT1oOM767Zrv9_-S7g1aUJSvA8g7MlWl-6RhYAiwy8PYX6M_rgUZyfwZFPGz1viuMUhY7_Dbvcvu12LjrIPT1Lfzg8eRMpGzPueiyUWivQQk5OjKep7JHqxc4XOnF3Kp_E44tgVGfc85sLRe8Unh3jiycp_uBJUHMJiNzNAXMTZOiQTrbqaSbGaqlBw8qqEcbfUa1r912bVNHeBsqv2HfVBiSUA51Qemc4JNnKVmuwOPxBIn7T4Q:1ngpeL:pYnoWBtbdZ2QR-RoYDMg1JxjiOstukVYjZZl2ow7Hbg', '2022-05-03 15:20:17.357790'),
('q2tp5obptm2iwwxjt2akv6smwmoox0bl', '.eJwlzNtugjAAgOF36fVI7EQGJl60GOwcGKag3jUCDYxDT1oOM767Zrv9_-S7g1aUJSvA8g7MlWl-6RhYAiwy8PYX6M_rgUZyfwZFPGz1viuMUhY7_Dbvcvu12LjrIPT1Lfzg8eRMpGzPueiyUWivQQk5OjKep7JHqxc4XOnF3Kp_E44tgVGfc85sLRe8Unh3jiycp_uBJUHMJiNzNAXMTZOiQTrbqaSbGaqlBw8qqEcbfUa1r912bVNHeBsqv2HfVBiSUA51Qemc4JNnKVmuwOPxBIn7T4Q:1nigbZ:j_mUHPzOljdLuh3SXH_E262AHaBnRWjhb8xqE27QaL8', '2022-05-08 18:05:05.824526'),
('s9nf82yy5539gdej78po2koz84blzfbz', '.eJwlzNtugjAAgOF36fVI7EQGJl60GOwcGKag3jUCDYxDT1oOM767Zrv9_-S7g1aUJSvA8g7MlWl-6RhYAiwy8PYX6M_rgUZyfwZFPGz1viuMUhY7_Dbvcvu12LjrIPT1Lfzg8eRMpGzPueiyUWivQQk5OjKep7JHqxc4XOnF3Kp_E44tgVGfc85sLRe8Unh3jiycp_uBJUHMJiNzNAXMTZOiQTrbqaSbGaqlBw8qqEcbfUa1r912bVNHeBsqv2HfVBiSUA51Qemc4JNnKVmuwOPxBIn7T4Q:1nigFZ:Gpd2JWW5BpG9V56TDDafvEzZM5C8ZEmR7g-OXY1DjL4', '2022-05-08 17:42:21.024280'),
('sfrea3gb4fgixsqb6mhmx1kw0fibaq08', '.eJwlzNtugjAAgOF36fVI7EQGJl60GOwcGKag3jUCDYxDT1oOM767Zrv9_-S7g1aUJSvA8g7MlWl-6RhYAiwy8PYX6M_rgUZyfwZFPGz1viuMUhY7_Dbvcvu12LjrIPT1Lfzg8eRMpGzPueiyUWivQQk5OjKep7JHqxc4XOnF3Kp_E44tgVGfc85sLRe8Unh3jiycp_uBJUHMJiNzNAXMTZOiQTrbqaSbGaqlBw8qqEcbfUa1r912bVNHeBsqv2HfVBiSUA51Qemc4JNnKVmuwOPxBIn7T4Q:1ngTYB:XLkzdQubD849BCGW277MvbpL3yx535iQQANtwfnH-6w', '2022-05-02 15:44:27.115603'),
('tfu5gjxftgklbb2lnqwhw4frqcctbb1i', '.eJwlzNtugjAAgOF36fVI7EQGJl60GOwcGKag3jUCDYxDT1oOM767Zrv9_-S7g1aUJSvA8g7MlWl-6RhYAiwy8PYX6M_rgUZyfwZFPGz1viuMUhY7_Dbvcvu12LjrIPT1Lfzg8eRMpGzPueiyUWivQQk5OjKep7JHqxc4XOnF3Kp_E44tgVGfc85sLRe8Unh3jiycp_uBJUHMJiNzNAXMTZOiQTrbqaSbGaqlBw8qqEcbfUa1r912bVNHeBsqv2HfVBiSUA51Qemc4JNnKVmuwOPxBIn7T4Q:1nbqeI:z_0TarSZqd6nnz8ap4kwO8t7YNMpm4DRFD5GYJGTcL0', '2022-04-19 21:23:38.677728'),
('tmjjj9ipfcanpe3h13sfzc4iw6rxbvk2', '.eJwlzNtugjAAgOF36fVMGIeRmXihzLIhMEAD4k3TWKAcS-k4WOO7z2y3_598d9CwosgIWN_BKLKhw20G1sDCQ4PBy19C5fOCunJuoVcYxzD6Wt3SGkrZXryFEpdNXHH01QLnSdWSiNf5h7tFZ2Rcgk6zJle8xxo0c5ttnuAsEB5_6L9ZbWdKg-JtTsTOZeNYQZYFoiaMxGbq94uzN5TmqPkHM9LtXcJhHFLvZKvna3xls-qXopW9te9LEtZpZ0psIMlK_VNpGjvnr98DP3AeLJwn3gY8Hr8QilDi:1niZ1H:n6aHaCjMbcMlZd9t5eWZOcG46er5ypMzML9kkZdHJR8', '2022-05-08 09:59:07.604942'),
('tsglbjoro96dwaim7wbhjt05mtqqubi3', '.eJwlzNtugjAAgOF36fVI7EQGJl60GOwcGKag3jUCDYxDT1oOM767Zrv9_-S7g1aUJSvA8g7MlWl-6RhYAiwy8PYX6M_rgUZyfwZFPGz1viuMUhY7_Dbvcvu12LjrIPT1Lfzg8eRMpGzPueiyUWivQQk5OjKep7JHqxc4XOnF3Kp_E44tgVGfc85sLRe8Unh3jiycp_uBJUHMJiNzNAXMTZOiQTrbqaSbGaqlBw8qqEcbfUa1r912bVNHeBsqv2HfVBiSUA51Qemc4JNnKVmuwOPxBIn7T4Q:1ncBGH:NS6rGZJp_zqjQvtoNbzfCLvykLDb0A2rtKZEtr3bYO0', '2022-04-20 19:24:13.985854'),
('ul1k6flpwrio03l4enc149whcjo2crau', '.eJwlzNtugjAAgOF36fVIcMyiJt5gJ0drF0XhigB2lEM5toIxvvvIvP3_5HuCqskyegObJ5AD7euYU7ABuz4fwMd_ifJ5gl6nWjH5Wnq0Esh6PnnO0lgRV2G7xHWw17eo6GTQZCVXDWIs2uBbEogZF8rDNT2u02E7g-MQxVKwtxmx4HII1XWmfpVL7MowddbV8XCCe9QioxUd3Du2n0BoX3-Rjn_I-dMfp8V5vBOjIIOm1B4mjeChaV1vj1TajVvO2sq8V3mtCqsLE1TFKChptgWv1x_gck4-:1ndeH3:M7-v160_yDqrZFzWA6j7MIJBcW5GSVkQ99OUwHDaIRo', '2022-04-24 20:35:05.459324'),
('v0nius0p3t104rhy4uiu6aqpufkey4d2', '.eJwlzNtugjAAgOF36fVI7EQGJl60GOwcGKag3jUCDYxDT1oOM767Zrv9_-S7g1aUJSvA8g7MlWl-6RhYAiwy8PYX6M_rgUZyfwZFPGz1viuMUhY7_Dbvcvu12LjrIPT1Lfzg8eRMpGzPueiyUWivQQk5OjKep7JHqxc4XOnF3Kp_E44tgVGfc85sLRe8Unh3jiycp_uBJUHMJiNzNAXMTZOiQTrbqaSbGaqlBw8qqEcbfUa1r912bVNHeBsqv2HfVBiSUA51Qemc4JNnKVmuwOPxBIn7T4Q:1ngTCD:XSiLlT3V0orLZmmBvuNKF02M7VsF82c1nqsTdggMuUU', '2022-05-02 15:21:45.758053'),
('ve9kutv6q21k7kmw7la1249j0odk0ieq', '.eJwlzN1uwiAAQOF34XomMlyYJl5UY_0p7WLdWrcbQlcGmFIqlFQxvvvMdntO8t1AY4TgNZjdgHfctkxzMAM7I1vw9FeoekxQKCvfz0Gr0xGvNyRmKRlXFHcH7whFUwpH5SW8tUp6W6evwzfdsLNZx7tRrRvOIKmiYf4AB0eZ7-W_2U8Cnrx0jm2vXORprFFuZWkTXpmyJ9fC7H2Qblw2z7hYxGy6yt3yg31dQgYNaoU8yMjtWbJsIV4lR0_rzz4gWJURElp2p4SKTGcLo8LPdg7u918V3FDa:1nc9ey:nJ3LtMzVsD-sDknPNNRz71mVmBhwj1CRT7nyea76_C4', '2022-04-20 17:41:36.582744'),
('vxapse6jpe437fmvxzi0kgesqdm7fj0m', '.eJwlzN1uwiAAQOF34XomMlyYJl5UY_0p7WLdWrcbQlcGmFIqlFQxvvvMdntO8t1AY4TgNZjdgHfctkxzMAM7I1vw9FeoekxQKCvfz0Gr0xGvNyRmKRlXFHcH7whFUwpH5SW8tUp6W6evwzfdsLNZx7tRrRvOIKmiYf4AB0eZ7-W_2U8Cnrx0jm2vXORprFFuZWkTXpmyJ9fC7H2Qblw2z7hYxGy6yt3yg31dQgYNaoU8yMjtWbJsIV4lR0_rzz4gWJURElp2p4SKTGcLo8LPdg7u918V3FDa:1ngTsR:jwwo8Yxid2q6_tcFNVc3thDy6mwCwVQi9990D68c7K0', '2022-05-02 16:05:23.669724'),
('w358owe3o5sztzpfmikisc6gvoywwnmd', '.eJwlzNtugjAAgOF36fVI7EQGJl60GOwcGKag3jUCDYxDT1oOM767Zrv9_-S7g1aUJSvA8g7MlWl-6RhYAiwy8PYX6M_rgUZyfwZFPGz1viuMUhY7_Dbvcvu12LjrIPT1Lfzg8eRMpGzPueiyUWivQQk5OjKep7JHqxc4XOnF3Kp_E44tgVGfc85sLRe8Unh3jiycp_uBJUHMJiNzNAXMTZOiQTrbqaSbGaqlBw8qqEcbfUa1r912bVNHeBsqv2HfVBiSUA51Qemc4JNnKVmuwOPxBIn7T4Q:1ngTkO:yi6WZqwhLtOo7lrgVyIg2E80pbivFIZOEErdr77YW_0', '2022-05-02 15:57:04.572775'),
('wh25ak1h5nlkpu0ougot8e2y0fj6xo3y', '.eJwlzNtugjAAgOF36fVIcMyiJt5gJ0drF0XhigB2lEM5toIxvvvIvP3_5HuCqskyegObJ5AD7euYU7ABuz4fwMd_ifJ5gl6nWjH5Wnq0Esh6PnnO0lgRV2G7xHWw17eo6GTQZCVXDWIs2uBbEogZF8rDNT2u02E7g-MQxVKwtxmx4HII1XWmfpVL7MowddbV8XCCe9QioxUd3Du2n0BoX3-Rjn_I-dMfp8V5vBOjIIOm1B4mjeChaV1vj1TajVvO2sq8V3mtCqsLE1TFKChptgWv1x_gck4-:1ncAHk:xN5rbMmjp1U1f5Zz61znWASJzTnBgl5i8NrbzNrXSPk', '2022-04-20 18:21:40.405409'),
('y882hk2njaj4yq3nerjfwe149b07juw1', '.eJwljNFugjAAAP-lzzMZrAwx8YGBc6KCMCvaF9IiVBBKkWEB47-PbG-Xu-QeoKgYS85g9gBtk9w4KRMwAxYpswy8_KkoGyu40cOCfQbbU3t3I1TAKlidYeW_y72YonzQNz7BMjus41Q77owKp7QuzDd5UZkdK4VC2h9_Pg5lE414-X-KVOswj31H7yAiYb28opAL6lldN0jLNXq1XfYQOVsF2ortiW_muItq0gSbL6YPETlpNK09cd3RfI0wOYalqepTs-f9Pl9ZYT6RmsE_Yh8Hr3PwfP4CGxFPtg:1nhrKw:dnZNH5tWloaRtzEfREywKV5T3Hwt5GuhZxcqtClSZHk', '2022-05-06 11:20:30.193808'),
('ywar80jg60p8y98pccp69pmyuv35fgr2', '.eJwlzNtugjAAgOF36fVIcMyiJt5gJ0drF0XhigB2lEM5toIxvvvIvP3_5HuCqskyegObJ5AD7euYU7ABuz4fwMd_ifJ5gl6nWjH5Wnq0Esh6PnnO0lgRV2G7xHWw17eo6GTQZCVXDWIs2uBbEogZF8rDNT2u02E7g-MQxVKwtxmx4HII1XWmfpVL7MowddbV8XCCe9QioxUd3Du2n0BoX3-Rjn_I-dMfp8V5vBOjIIOm1B4mjeChaV1vj1TajVvO2sq8V3mtCqsLE1TFKChptgWv1x_gck4-:1niKTL:idI5wxv4tg5P0ek2z4x-F9_PjC9F2Lc5YtEQ4SKYiUc', '2022-05-07 18:27:07.150135'),
('z7g1kfhvr1xzrtdcb1bxr8jn1dvtyp4d', '.eJwlzNtugjAAgOF36fVMGIeRmXihzLIhMEAD4k3TWKAcS-k4WOO7z2y3_598d9CwosgIWN_BKLKhw20G1sDCQ4PBy19C5fOCunJuoVcYxzD6Wt3SGkrZXryFEpdNXHH01QLnSdWSiNf5h7tFZ2Rcgk6zJle8xxo0c5ttnuAsEB5_6L9ZbWdKg-JtTsTOZeNYQZYFoiaMxGbq94uzN5TmqPkHM9LtXcJhHFLvZKvna3xls-qXopW9te9LEtZpZ0psIMlK_VNpGjvnr98DP3AeLJwn3gY8Hr8QilDi:1nibXE:XwmBp8l3hlxYOAbwI-4uVLu2kEJiYDPqn-SHQgr4lFs', '2022-05-08 12:40:16.107465'),
('zg6zy9e0knjckrsjvbedpc570zf01yqw', '.eJwlzNtugjAAgOF36fVIcMyiJt5gJ0drF0XhigB2lEM5toIxvvvIvP3_5HuCqskyegObJ5AD7euYU7ABuz4fwMd_ifJ5gl6nWjH5Wnq0Esh6PnnO0lgRV2G7xHWw17eo6GTQZCVXDWIs2uBbEogZF8rDNT2u02E7g-MQxVKwtxmx4HII1XWmfpVL7MowddbV8XCCe9QioxUd3Du2n0BoX3-Rjn_I-dMfp8V5vBOjIIOm1B4mjeChaV1vj1TajVvO2sq8V3mtCqsLE1TFKChptgWv1x_gck4-:1ngpui:3859wY1Y29crCYOD9HQs1QIrhWNABjAu1rxZsi_LqCQ', '2022-05-03 15:37:12.762287'),
('zsmk8nauwjyyxw63vlc8cw0b78ejgwqp', '.eJwlzNtugjAAgOF36fVI7EQGJl60GOwcGKag3jUCDYxDT1oOM767Zrv9_-S7g1aUJSvA8g7MlWl-6RhYAiwy8PYX6M_rgUZyfwZFPGz1viuMUhY7_Dbvcvu12LjrIPT1Lfzg8eRMpGzPueiyUWivQQk5OjKep7JHqxc4XOnF3Kp_E44tgVGfc85sLRe8Unh3jiycp_uBJUHMJiNzNAXMTZOiQTrbqaSbGaqlBw8qqEcbfUa1r912bVNHeBsqv2HfVBiSUA51Qemc4JNnKVmuwOPxBIn7T4Q:1niZ19:B6mbFL4dKXIvrxA5l1FAHaedAhvYTeEjp-FqnphJ3xw', '2022-05-08 09:58:59.299456');

-- --------------------------------------------------------

--
-- Struttura della tabella `gruppo`
--

CREATE TABLE `gruppo` (
  `group_id` int(255) NOT NULL,
  `group_name` varchar(35) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struttura della tabella `gruppo_messaggi`
--

CREATE TABLE `gruppo_messaggi` (
  `group_id` int(11) NOT NULL,
  `id_messaggio` int(11) NOT NULL,
  `messaggio` varchar(3000) NOT NULL,
  `data_invio` varchar(35) NOT NULL,
  `mittente` varchar(35) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struttura della tabella `gruppo_utenti`
--

CREATE TABLE `gruppo_utenti` (
  `user_id` varchar(255) NOT NULL,
  `group_id` int(255) NOT NULL,
  `ruolo` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struttura della tabella `info`
--

CREATE TABLE `info` (
  `user_id` varchar(255) NOT NULL,
  `type_info` varchar(255) NOT NULL,
  `mess_info` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struttura della tabella `info_mess`
--

CREATE TABLE `info_mess` (
  `user_id` varchar(255) NOT NULL,
  `mitt` varchar(35) NOT NULL,
  `num` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struttura della tabella `profilo`
--

CREATE TABLE `profilo` (
  `username` varchar(35) NOT NULL,
  `password` varchar(255) NOT NULL,
  `path_avatar_image` varchar(255) NOT NULL,
  `user_id` varchar(255) NOT NULL,
  `ws_auth_id` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struttura della tabella `rubrica`
--

CREATE TABLE `rubrica` (
  `rubrica_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struttura della tabella `rubrica_messaggi`
--

CREATE TABLE `rubrica_messaggi` (
  `rubrica_id` int(255) NOT NULL,
  `id_messaggio` int(11) NOT NULL,
  `messaggio` varchar(3000) NOT NULL,
  `data_invio` varchar(35) NOT NULL,
  `mittente` varchar(35) NOT NULL,
  `stato` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struttura della tabella `rubrica_utenti`
--

CREATE TABLE `rubrica_utenti` (
  `user_id` varchar(255) NOT NULL,
  `rubrica_id` int(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Indici per le tabelle scaricate
--

--
-- Indici per le tabelle `auth_group`
--
ALTER TABLE `auth_group`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indici per le tabelle `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  ADD KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`);

--
-- Indici per le tabelle `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`);

--
-- Indici per le tabelle `auth_user`
--
ALTER TABLE `auth_user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indici per le tabelle `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  ADD KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`);

--
-- Indici per le tabelle `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  ADD KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`);

--
-- Indici per le tabelle `block`
--
ALTER TABLE `block`
  ADD KEY `auth_id` (`user_id`);

--
-- Indici per le tabelle `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  ADD KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`);

--
-- Indici per le tabelle `django_content_type`
--
ALTER TABLE `django_content_type`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`);

--
-- Indici per le tabelle `django_migrations`
--
ALTER TABLE `django_migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indici per le tabelle `django_session`
--
ALTER TABLE `django_session`
  ADD PRIMARY KEY (`session_key`),
  ADD KEY `django_session_expire_date_a5c62663` (`expire_date`);

--
-- Indici per le tabelle `gruppo`
--
ALTER TABLE `gruppo`
  ADD PRIMARY KEY (`group_id`);

--
-- Indici per le tabelle `gruppo_messaggi`
--
ALTER TABLE `gruppo_messaggi`
  ADD PRIMARY KEY (`id_messaggio`),
  ADD KEY `group_id` (`group_id`);

--
-- Indici per le tabelle `gruppo_utenti`
--
ALTER TABLE `gruppo_utenti`
  ADD KEY `auth_id` (`user_id`),
  ADD KEY `group_id` (`group_id`);

--
-- Indici per le tabelle `info`
--
ALTER TABLE `info`
  ADD KEY `auth_id` (`user_id`);

--
-- Indici per le tabelle `info_mess`
--
ALTER TABLE `info_mess`
  ADD PRIMARY KEY (`user_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indici per le tabelle `profilo`
--
ALTER TABLE `profilo`
  ADD PRIMARY KEY (`user_id`);

--
-- Indici per le tabelle `rubrica`
--
ALTER TABLE `rubrica`
  ADD PRIMARY KEY (`rubrica_id`);

--
-- Indici per le tabelle `rubrica_messaggi`
--
ALTER TABLE `rubrica_messaggi`
  ADD PRIMARY KEY (`id_messaggio`),
  ADD KEY `rubrica_id` (`rubrica_id`);

--
-- Indici per le tabelle `rubrica_utenti`
--
ALTER TABLE `rubrica_utenti`
  ADD KEY `auth_id` (`user_id`),
  ADD KEY `rubrica_id` (`rubrica_id`);

--
-- AUTO_INCREMENT per le tabelle scaricate
--

--
-- AUTO_INCREMENT per la tabella `auth_group`
--
ALTER TABLE `auth_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT per la tabella `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT per la tabella `auth_permission`
--
ALTER TABLE `auth_permission`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT per la tabella `auth_user`
--
ALTER TABLE `auth_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT per la tabella `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT per la tabella `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT per la tabella `django_admin_log`
--
ALTER TABLE `django_admin_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT per la tabella `django_content_type`
--
ALTER TABLE `django_content_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT per la tabella `django_migrations`
--
ALTER TABLE `django_migrations`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT per la tabella `gruppo`
--
ALTER TABLE `gruppo`
  MODIFY `group_id` int(255) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT per la tabella `gruppo_messaggi`
--
ALTER TABLE `gruppo_messaggi`
  MODIFY `id_messaggio` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT per la tabella `rubrica`
--
ALTER TABLE `rubrica`
  MODIFY `rubrica_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=52;

--
-- AUTO_INCREMENT per la tabella `rubrica_messaggi`
--
ALTER TABLE `rubrica_messaggi`
  MODIFY `id_messaggio` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=615;

--
-- Limiti per le tabelle scaricate
--

--
-- Limiti per la tabella `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`);

--
-- Limiti per la tabella `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`);

--
-- Limiti per la tabella `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  ADD CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Limiti per la tabella `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Limiti per la tabella `block`
--
ALTER TABLE `block`
  ADD CONSTRAINT `block_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `profilo` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Limiti per la tabella `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  ADD CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Limiti per la tabella `gruppo_messaggi`
--
ALTER TABLE `gruppo_messaggi`
  ADD CONSTRAINT `gruppo_messaggi_ibfk_1` FOREIGN KEY (`group_id`) REFERENCES `gruppo` (`group_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Limiti per la tabella `gruppo_utenti`
--
ALTER TABLE `gruppo_utenti`
  ADD CONSTRAINT `gruppo_utenti_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `profilo` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `gruppo_utenti_ibfk_2` FOREIGN KEY (`group_id`) REFERENCES `gruppo` (`group_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Limiti per la tabella `info`
--
ALTER TABLE `info`
  ADD CONSTRAINT `info_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `profilo` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Limiti per la tabella `info_mess`
--
ALTER TABLE `info_mess`
  ADD CONSTRAINT `info_mess_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `profilo` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Limiti per la tabella `rubrica_messaggi`
--
ALTER TABLE `rubrica_messaggi`
  ADD CONSTRAINT `rubrica_messaggi_ibfk_1` FOREIGN KEY (`rubrica_id`) REFERENCES `rubrica` (`rubrica_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Limiti per la tabella `rubrica_utenti`
--
ALTER TABLE `rubrica_utenti`
  ADD CONSTRAINT `rubrica_utenti_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `profilo` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `rubrica_utenti_ibfk_2` FOREIGN KEY (`rubrica_id`) REFERENCES `rubrica` (`rubrica_id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

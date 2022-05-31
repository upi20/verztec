-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 31, 2022 at 12:47 AM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 7.4.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `cmms`
--

-- --------------------------------------------------------

--
-- Table structure for table `activity`
--

CREATE TABLE `activity` (
  `id` int(11) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `keterangan` varchar(100) NOT NULL,
  `tanggal` date NOT NULL,
  `tempat` varchar(100) NOT NULL,
  `status` int(1) NOT NULL COMMENT '2 Tidak Aktif | 1 Aktif | 3 Deleted',
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT NULL ON UPDATE current_timestamp(),
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `activity_log`
--

CREATE TABLE `activity_log` (
  `id` int(11) NOT NULL,
  `modul` varchar(150) DEFAULT NULL,
  `by` int(11) DEFAULT NULL,
  `data_baru` text DEFAULT NULL COMMENT 'deskrisi',
  `data_lama` text DEFAULT NULL COMMENT 'deskrisi',
  `jenis_perubahan` int(1) NOT NULL COMMENT '1 = created, 2 = modified, 3 = deleted',
  `created_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `activity_log`
--

INSERT INTO `activity_log` (`id`, `modul`, `by`, `data_baru`, `data_lama`, `jenis_perubahan`, `created_at`) VALUES
(1, 'Data Member', 1, 'Menambah data baru dengan isi id = 116, level = Reader, nik = 080401-202203-0001, partner = Setiawan, user_nama = Soni, user_email = soni.setiawan@mailinator.com, user_email_status = 0, user_phone = 0, user_status = Aktif', 'Belum ada data', 1, '2022-03-31 08:41:30'),
(2, 'Data Member', 1, 'Mengubah isi data sebelumnya menjadi id = 52, nama_depan = Soni, nama_belakang = Setiawan, jenis_kelamin = 1, status = Aktif, photo = ', 'Isi data sebelumnya adalah id = 52, nama_depan = , nama_belakang = , jenis_kelamin = Tidak Diketahui, status = Aktif, photo = ', 2, '2022-03-31 08:41:30'),
(3, 'Term Management', 1, 'Mengubah isi data sebelumnya menjadi menu = Membership, nama = Pengesah, keterangan = -, status = Aktif', 'Isi data sebelumnya adalah menu = Membership, nama = Pengesah 2, -, status = Aktif', 2, '2022-03-31 16:54:21'),
(4, 'Data Member', 1, 'Menambah data baru dengan isi profile =  , jenis_membership = Level 1, approver = Super Admin, tanggal_anggota = 2022-03-01, status = Disetujui', 'Belum ada data', 1, '2022-03-31 16:54:37'),
(5, 'Data Member', 1, 'Menambah data baru dengan isi profile =  , jenis_membership = Level 1, profile_atasan = , status = Aktif', 'Belum ada data', 1, '2022-03-31 16:54:37'),
(6, 'Data Member', 1, 'Menambah data baru dengan isi profile = Soni Setiawan, jenis_membership = Level 1, approver = Super Admin, tanggal_anggota = 2022-03-02, status = Disetujui', 'Belum ada data', 1, '2022-03-31 16:55:15'),
(7, 'Data Member', 1, 'Menambah data baru dengan isi profile = Soni Setiawan, jenis_membership = Level 1, profile_atasan = , status = Aktif', 'Belum ada data', 1, '2022-03-31 16:55:15'),
(8, 'Data Member', 1, 'Mengubah data status = tidak aktif dimana profile =  ', 'Isi data sebelumnya adalah {\"profile\":null,\"nama_atasan\":\"\",\"jenis_membership\":\"Level 1\",\"tanggal_anggota\":\"2022-03-01\",\"status_str\":\"Disetujui\"}', 2, '2022-03-31 16:59:49'),
(9, 'Data Member', 1, 'Menambah data baru dengan isi id = 117, level = Reader, nik = 080401-202203-0002, partner = Setiawan, user_nama = Nurul, user_email = nurulafanti@mailinator.com, user_email_status = 0, user_phone = 0, user_status = Aktif', 'Belum ada data', 1, '2022-03-31 17:00:17'),
(10, 'Data Member', 1, 'Mengubah isi data sebelumnya menjadi id = 52, nama_depan = Nurul, nama_belakang = Afanti, jenis_kelamin = 2, status = Aktif, photo = ', 'Isi data sebelumnya adalah id = 52, nama_depan = , nama_belakang = , jenis_kelamin = Tidak Diketahui, status = Aktif, photo = ', 2, '2022-03-31 17:00:17'),
(11, 'Term Management', 1, 'Mengubah isi data sebelumnya menjadi menu = Data Formal, nama = Peristiwa Formal, keterangan = -, status = Aktif', 'Isi data sebelumnya adalah menu = Data Formal, nama = Peristiwa Formal 2, -, status = Aktif', 2, '2022-03-31 19:07:53'),
(12, 'Data Member', 1, 'Mengubah isi data sebelumnya menjadi id = 116, level = Partner L1, nik = 080401-202203-0001, partner = Setiawan, user_nama = Soni, user_email = soni.setiawan@mailinator.com, user_email_status = 1, user_phone = 0, user_status = Aktif', 'Isi data sebelumnya adalah id = 116, level = Reader, nik = 080401-202203-0001, id_partner = 25, user_nama = Soni, user_email = soni.setiawan@mailinator.com, user_email_status = 1, user_phone = 0, user_status = Aktif', 2, '2022-03-31 19:24:58'),
(13, 'Data Member', 1, 'Mengubah isi data sebelumnya menjadi id = 52, nama_depan = Soni, nama_belakang = Setiawan, jenis_kelamin = 1, status = Aktif, photo = ', 'Isi data sebelumnya adalah id = 52, nama_depan = , nama_belakang = , jenis_kelamin = Tidak Diketahui, status = Aktif, photo = ', 2, '2022-03-31 19:24:58'),
(14, '', NULL, 'Menghapus data lama', 'Isi data sebelumnya adalah \"\"', 3, '2022-03-31 19:52:12'),
(15, 'Keluarga', 1, 'Mengubah isi data sebelumnya menjadi nama = Setiawan, lokasi = Jl Kebon Kopi, Cimahi, no_telepon = 082123215, email = soni.setiawan@mailinator.com, status = Aktif', 'Isi data sebelumnya adalah nama = Setiawan, lokasi = Jl Kebon Kopi, Cimahi, no_telepon = 082123215, email = soni.setiawan@mailinator.com, status = Aktif', 2, '2022-03-31 20:46:08'),
(16, 'Keluarga', 1, 'Menambah data baru dengan isi nama = Keluarga X, lokasi = jl kebon jeruk 2022, cimahi, no_telepon = 0225545456, email = keluarga.x@mailinator.com, status = Aktif', 'Belum ada data', 1, '2022-03-31 20:48:43'),
(17, 'Keluarga', 1, 'Mengubah isi data sebelumnya menjadi nama = Keluarga Rismawan, lokasi = jl kebon jeruk 2022, cimahi, no_telepon = 0225545456, email = keluarga.x@mailinator.com, status = Aktif', 'Isi data sebelumnya adalah nama = Keluarga X, lokasi = jl kebon jeruk 2022, cimahi, no_telepon = 0225545456, email = keluarga.x@mailinator.com, status = Aktif', 2, '2022-03-31 20:53:01'),
(18, 'Kode', 1, 'Menghapus data lama', 'Isi data sebelumnya adalah kode = 080401, bulan = Ya, tahun = Ya, jumlah = 4, status = Aktif', 3, '2022-03-31 21:02:18'),
(19, 'Kode', 1, 'Menambah data baru dengan isi kode = 080401, bulan = Ya, tahun = Ya, jumlah = 6, status = Aktif', 'Belum ada data', 1, '2022-03-31 21:04:17'),
(20, 'Kode', 1, 'Menghapus data lama', 'Isi data sebelumnya adalah kode = 080401, bulan = Ya, tahun = Ya, jumlah = 6, status = Aktif', 3, '2022-03-31 21:04:22'),
(21, 'Kode', 1, 'Menambah data baru dengan isi kode = 080401, bulan = Ya, tahun = Ya, jumlah = 7, status = Aktif', 'Belum ada data', 1, '2022-03-31 21:04:49'),
(22, 'Kode', 1, 'Menghapus data lama', 'Isi data sebelumnya adalah kode = 080401, bulan = Ya, tahun = Ya, jumlah = 7, status = Aktif', 3, '2022-03-31 21:04:52'),
(23, 'Kode', 1, 'Menambah data baru dengan isi kode = 080401, bulan = Ya, tahun = Ya, jumlah = 8, status = Aktif', 'Belum ada data', 1, '2022-03-31 21:05:04'),
(24, 'Kode', 1, 'Menambah data baru dengan isi kode = PK, bulan = Ya, tahun = Ya, jumlah = 3, status = Aktif', 'Belum ada data', 1, '2022-03-31 21:08:10'),
(25, 'Kategori', 1, 'Menghapus data lama', 'Isi data sebelumnya adalah nama = , keterangan = , status = Aktif', 3, '2022-03-31 21:11:03'),
(26, 'Kategori', 1, 'Menghapus data lama', 'Isi data sebelumnya adalah nama = K, keterangan = Anggota, status = Aktif', 3, '2022-03-31 21:11:05'),
(27, 'Kategori', 1, 'Mengubah isi data sebelumnya menjadi nama = A2, keterangan = Pengunjung 2, status = Aktif', 'Isi data sebelumnya adalah nama = A, keterangan = Pengunjung, status = Aktif', 2, '2022-03-31 21:11:20'),
(28, 'Data Member', 1, 'Menambah data baru dengan isi profile = Soni Setiawan, peristiwa_formal = Pernikahan, keterangan = pernikahan bulan desember, tempat = bandung, tanggal_data_formal = 2022-12-01, status = Tidak Aktif', 'Belum ada data', 1, '2022-03-31 21:22:56'),
(29, 'Data Member', 1, 'Menambah data baru dengan isi id = 118, level = Reader, nik = 080401-202203-0003, partner = Keluarga Rismawan, user_nama = Dani, user_email = dandi@mailinator.com, user_email_status = 0, user_phone = 0, user_status = Aktif', 'Belum ada data', 1, '2022-03-31 21:31:29'),
(30, 'Data Member', 1, 'Mengubah isi data sebelumnya menjadi id = 52, nama_depan = Dani, nama_belakang = Rismawan, jenis_kelamin = 1, status = Aktif, photo = ', 'Isi data sebelumnya adalah id = 52, nama_depan = , nama_belakang = , jenis_kelamin = Tidak Diketahui, status = Aktif, photo = ', 2, '2022-03-31 21:31:29'),
(31, 'Data Member', 1, 'Mengubah isi data sebelumnya menjadi id = 118, level = Reader, nik = 080401-202203-0003, partner = Keluarga Rismawan, user_nama = Dani, user_email = dandi@mailinator.com, user_email_status = 0, user_phone = 0, user_status = Aktif', 'Isi data sebelumnya adalah id = 118, level = Reader, nik = 080401-202203-0003, id_partner = 26, user_nama = Dani, user_email = dandi@mailinator.com, user_email_status = , user_phone = 0, user_status = Aktif', 2, '2022-03-31 21:31:53'),
(32, 'Data Member', 1, 'Mengubah isi data sebelumnya menjadi id = 52, nama_depan = Dani, nama_belakang = Rismawan, jenis_kelamin = 1, status = Aktif, photo = ', 'Isi data sebelumnya adalah id = 52, nama_depan = , nama_belakang = , jenis_kelamin = Tidak Diketahui, status = Aktif, photo = ', 2, '2022-03-31 21:31:53'),
(33, 'Keluarga', 1, 'Menambah data baru dengan isi nama = s, lokasi = asd, no_telepon = 3232, email = s21@mailinator.com, status = Aktif', 'Belum ada data', 1, '2022-03-31 23:21:59'),
(34, 'Keluarga', 1, 'Mengubah isi data sebelumnya menjadi nama = Keluarga Rismawan, lokasi = jl kebon jeruk 2022, cimahi, no_telepon = 0225545456, email = keluarga.x@mailinator.com, status = Aktif', 'Isi data sebelumnya adalah nama = Keluarga Rismawan, lokasi = jl kebon jeruk 2022, cimahi, no_telepon = 0225545456, email = keluarga.x@mailinator.com, status = Aktif', 2, '2022-03-31 23:28:05'),
(35, 'Menu', 1, 'Mengubah isi data sebelumnya menjadi parent = Master, menu_nama = Kategori Keanggotaan, menu_index = 9, menu_icon = far fa-circle, menu_url = data-master/kategoriKeanggotaan, menu_keterangan = -, menu_status = Aktif', 'Isi data sebelumnya adalah parent = Master, menu_nama = Kategori Keanggotaan, menu_index = 6, menu_icon = far fa-circle, menu_url = data-master/kategoriKeanggotaan, menu_keterangan = -, menu_status = Aktif', 2, '2022-03-31 23:29:26'),
(36, 'Menu', 1, 'Mengubah isi data sebelumnya menjadi parent = Master, menu_nama = Laporan Header, menu_index = 8, menu_icon = far fa-circle, menu_url = data-master/laporan-header, menu_keterangan = -, menu_status = Aktif', 'Isi data sebelumnya adalah parent = Master, menu_nama = Laporan Header, menu_index = 9, menu_icon = far fa-circle, menu_url = data-master/laporan-header, menu_keterangan = -, menu_status = Aktif', 2, '2022-03-31 23:29:43'),
(37, 'Term Management', 1, 'Menambah data baru dengan isi menu = Kategori, nama = Kategori (Non User), keterangan = =, status = Aktif', 'Belum ada data', 1, '2022-03-31 23:36:19'),
(38, 'Menu', 1, 'Menambah data baru dengan isi parent = Master, menu_nama = Jabatan, menu_index = 11, menu_icon = far fa-circle, menu_url = data-master/jabatan, menu_keterangan = -, menu_status = Aktif', 'Belum ada data', 1, '2022-04-02 02:07:25'),
(39, 'Menu', 1, 'Menambah data baru dengan isi parent = Master, menu_nama = Pengarah, menu_index = 12, menu_icon = far fa-circle, menu_url = data-master/pengarah, menu_keterangan = -, menu_status = Aktif', 'Belum ada data', 1, '2022-04-02 02:07:49'),
(40, 'Menu', 1, 'Menambah data baru dengan isi parent = Master, menu_nama = Komisi, menu_index = 13, menu_icon = far fa-circle, menu_url = data-master/komisi, menu_keterangan = -, menu_status = Aktif', 'Belum ada data', 1, '2022-04-02 02:08:19'),
(41, 'Menu', 1, 'Menambah data baru dengan isi parent = Master, menu_nama = Kepanitiaan, menu_index = 14, menu_icon = far fa-circle, menu_url = data-master/kepanitiaan, menu_keterangan = -, menu_status = Aktif', 'Belum ada data', 1, '2022-04-02 02:08:54'),
(42, '', 1, 'Menambah data baru dengan isi menu = Jabatan, level = Super Admin', 'Belum ada data', 1, '2022-04-02 02:09:02'),
(43, '', 1, 'Menambah data baru dengan isi menu = Pengarah, level = Super Admin', 'Belum ada data', 1, '2022-04-02 02:09:03'),
(44, '', 1, 'Menambah data baru dengan isi menu = Komisi, level = Super Admin', 'Belum ada data', 1, '2022-04-02 02:09:04'),
(45, '', 1, 'Menambah data baru dengan isi menu = Kepanitiaan, level = Super Admin', 'Belum ada data', 1, '2022-04-02 02:09:05'),
(46, 'Term Management', 1, 'Menambah data baru dengan isi menu = Jabatan, nama = Jabatan, keterangan = -, status = Aktif', 'Belum ada data', 1, '2022-04-02 02:10:43'),
(47, 'Term Management', 1, 'Menambah data baru dengan isi menu = Pengarah, nama = Pengarah, keterangan = -, status = Aktif', 'Belum ada data', 1, '2022-04-02 02:11:26'),
(48, 'Term Management', 1, 'Menambah data baru dengan isi menu = Komisi, nama = Komisi, keterangan = -, status = Aktif', 'Belum ada data', 1, '2022-04-02 02:11:38'),
(49, 'Term Management', 1, 'Menambah data baru dengan isi menu = Kepanitiaan, nama = Kepanitiaan, keterangan = -, status = Aktif', 'Belum ada data', 1, '2022-04-02 02:12:00'),
(50, 'Kategori Keanggotaan', 1, 'Menambah data baru dengan isi nama = 4, keterangan = 4, no urut = 4, status = Aktif', 'Belum ada data', 1, '2022-04-02 02:16:13'),
(51, 'Jabatan', 1, 'Menambah data baru dengan isi nama = Direktur, keterangan = abcdef, no urut = 1, status = Aktif', 'Belum ada data', 1, '2022-04-02 12:19:53'),
(52, 'Jabatan', 1, 'Menambah data baru dengan isi nama = Sekretaris, keterangan = abcdef, no urut = 2, status = Aktif', 'Belum ada data', 1, '2022-04-02 12:20:05'),
(53, 'Jabatan', 1, 'Menambah data baru dengan isi nama = 23, keterangan = 3, no urut = 3, status = Aktif', 'Belum ada data', 1, '2022-04-02 12:20:11'),
(54, 'Jabatan', 1, 'Mengubah isi data sebelumnya menjadi nama = 23111, keterangan = 3111, no urut = 3111, status = Aktif', 'Isi data sebelumnya adalah nama = 23, keterangan = 3, no urut = 3, status = Aktif', 2, '2022-04-02 12:20:17'),
(55, 'Jabatan', 1, 'Menghapus data lama', 'Isi data sebelumnya adalah nama = 23111, keterangan = 3111, no urut = 3111, status = Aktif', 3, '2022-04-02 12:20:50'),
(56, 'Pengarah', 1, 'Menambah data baru dengan isi nama = 1, keterangan = 1, no urut = 1, status = Aktif', 'Belum ada data', 1, '2022-04-02 16:43:14'),
(57, 'Pengarah', 1, 'Mengubah isi data sebelumnya menjadi nama = ABC, keterangan = abc, no urut = 1, status = Aktif', 'Isi data sebelumnya adalah nama = 1, keterangan = 1, no urut = 1, status = Aktif', 2, '2022-04-02 16:44:06'),
(58, 'Pengarah', 1, 'Menambah data baru dengan isi nama = 2, keterangan = 2, no urut = 2, status = Aktif', 'Belum ada data', 1, '2022-04-02 16:44:10'),
(59, 'Pengarah', 1, 'Menghapus data lama', 'Isi data sebelumnya adalah nama = 2, keterangan = 2, no urut = 2, status = Aktif', 3, '2022-04-02 16:44:13'),
(60, 'Komisi', 1, 'Menambah data baru dengan isi nama = 1, keterangan = 1, no urut = 1, status = Aktif', 'Belum ada data', 1, '2022-04-02 16:46:12'),
(61, 'Komisi', 1, 'Menambah data baru dengan isi nama = 2, keterangan = 2, no urut = 2, status = Aktif', 'Belum ada data', 1, '2022-04-02 16:46:16'),
(62, 'Komisi', 1, 'Menghapus data lama', 'Isi data sebelumnya adalah nama = 2, keterangan = 2, no urut = 2, status = Aktif', 3, '2022-04-02 16:46:19'),
(63, 'Komisi', 1, 'Mengubah isi data sebelumnya menjadi nama = ABC, keterangan = abc, no urut = 1, status = Aktif', 'Isi data sebelumnya adalah nama = 1, keterangan = 1, no urut = 1, status = Aktif', 2, '2022-04-02 16:46:30'),
(64, 'Kepanitiaan', 1, 'Menambah data baru dengan isi nama = 1, keterangan = 1, no urut = 1, status = Aktif', 'Belum ada data', 1, '2022-04-02 16:54:04'),
(65, 'Kepanitiaan', 1, 'Menambah data baru dengan isi nama = 2, keterangan = 2, no urut = 2, status = Aktif', 'Belum ada data', 1, '2022-04-02 16:54:09'),
(66, 'Kepanitiaan', 1, 'Mengubah isi data sebelumnya menjadi nama = ABC, keterangan = abc, no urut = 1, status = Aktif', 'Isi data sebelumnya adalah nama = 1, keterangan = 1, no urut = 1, status = Aktif', 2, '2022-04-02 16:54:16'),
(67, 'Kepanitiaan', 1, 'Menghapus data lama', 'Isi data sebelumnya adalah nama = 2, keterangan = 2, no urut = 2, status = Aktif', 3, '2022-04-02 16:54:19'),
(68, NULL, 1, 'Menghapus data lama', 'Isi data sebelumnya adalah null', 3, '2022-04-03 22:00:11'),
(69, NULL, 1, 'Menghapus data lama', 'Isi data sebelumnya adalah null', 3, '2022-04-03 22:03:55'),
(70, '', 1, 'Menghapus data lama', 'Isi data sebelumnya adalah \"\"', 3, '2022-04-03 22:04:28'),
(71, 'Data Member', 1, 'Menambah data baru dengan isi profile = Nurul Afanti, jenis_membership = Level 2, approver = Super Admin, tanggal_anggota = 2022-04-03, status = Tidak Diketahui', 'Belum ada data', 1, '2022-04-03 23:40:27'),
(72, 'Data Member', 1, 'Menambah data baru dengan isi profile = Nurul Afanti, jenis_membership = Level 2, profile_atasan = Soni Setiawan, status = Aktif', 'Belum ada data', 1, '2022-04-03 23:40:27'),
(73, 'Data Member', NULL, 'Mengubah setiap data sebelumnya menjadi status = Tidak Aktif', 'Isi data sebelumnya adalah {\"profile\":\"Nurul Afanti\",\"jenis_membership\":\"Level 2\",\"nama_atasan\":\"Soni Setiawan\",\"status_str\":\"Tidak Diketahui\"}', 2, '2022-04-03 23:41:13'),
(74, 'Data Member', NULL, 'Mengubah setiap data sebelumnya menjadi status = Tidak Aktif', 'Isi data sebelumnya adalah {\"profile\":\"Nurul Afanti\",\"nama_atasan\":\"Soni Setiawan\",\"jenis_membership\":\"Level 2\",\"tanggal_anggota\":\"2022-04-03\",\"status_str\":\"Meminta Persetujuan\"}', 2, '2022-04-03 23:41:13'),
(75, 'Data Member', NULL, 'Mengubah isi data membership dengan profile = Nurul Afanti sebelumnya menjadi status = Disetujui', 'Isi data sebelumnya adalah membership dengan profile = Nurul Afanti, status = Meminta Persetujuan', 2, '2022-04-03 23:41:13'),
(76, '', 1, 'Menghapus data lama', 'Isi data sebelumnya adalah \"\"', 3, '2022-04-04 05:20:33'),
(77, 'Data Member', 1, 'Menambah data baru dengan isi profile = Nurul Afanti keanggotaan = 1, tanggal = 2022-04-04, status = Aktif', 'Belum ada data', 1, '2022-04-04 05:29:25'),
(78, 'Data Member', 1, 'Menambah data baru dengan isi profile = Nurul Afanti, peristiwa_formal = Tanggal Lahir, keterangan = 1, tempat = 1, tanggal_data_formal = 2022-01-01, status = Tidak Aktif', 'Belum ada data', 1, '2022-04-04 17:01:55'),
(79, 'Data Member', NULL, 'Mengubah isi data sebelumnya menjadi id = 116, level = Admin Staff, nik = 080401-202203-0001, partner = Setiawan, user_nama = Soni, user_email = soni.setiawan@mailinator.com, user_email_status = 1, user_phone = 0, user_status = Aktif', 'Isi data sebelumnya adalah id = 116, level = Partner L1, nik = 080401-202203-0001, id_partner = 25, user_nama = Soni, user_email = soni.setiawan@mailinator.com, user_email_status = 1, user_phone = 0, user_status = Aktif', 2, '2022-04-05 09:56:28'),
(80, 'Data Member', NULL, 'Mengubah isi data sebelumnya menjadi id = 52, nama_depan = Soni, nama_belakang = Setiawan, jenis_kelamin = 1, status = Aktif, photo = ', 'Isi data sebelumnya adalah id = 52, nama_depan = , nama_belakang = , jenis_kelamin = Tidak Diketahui, status = Aktif, photo = ', 2, '2022-04-05 09:56:28'),
(81, 'Data Member', NULL, 'Mengubah isi data sebelumnya menjadi id = 116, level = Partner L2, nik = 080401-202203-0001, partner = Setiawan, user_nama = Soni, user_email = soni.setiawan@mailinator.com, user_email_status = 1, user_phone = 0, user_status = Aktif', 'Isi data sebelumnya adalah id = 116, level = Admin Staff, nik = 080401-202203-0001, id_partner = 25, user_nama = Soni, user_email = soni.setiawan@mailinator.com, user_email_status = 1, user_phone = 0, user_status = Aktif', 2, '2022-04-05 09:56:58'),
(82, 'Data Member', NULL, 'Mengubah isi data sebelumnya menjadi id = 52, nama_depan = Soni, nama_belakang = Setiawan, jenis_kelamin = 1, status = Aktif, photo = ', 'Isi data sebelumnya adalah id = 52, nama_depan = , nama_belakang = , jenis_kelamin = Tidak Diketahui, status = Aktif, photo = ', 2, '2022-04-05 09:56:58'),
(83, 'Keluarga', 1, 'Menambah data baru dengan isi nama = test, lokasi = asdadsa, no_telepon = 213213, email = test20@mailinator.com, status = Aktif', 'Belum ada data', 1, '2022-04-05 20:00:25'),
(84, 'Keluarga', 1, 'Mengubah isi data sebelumnya menjadi nama = test, lokasi = asdadsa, no_telepon = 213213, email = test20@mailinator.com, status = Aktif', 'Isi data sebelumnya adalah nama = test, lokasi = asdadsa, no_telepon = 213213, email = test20@mailinator.com, status = Aktif', 2, '2022-04-05 20:00:46'),
(85, 'Keluarga', 1, 'Mengubah isi data sebelumnya menjadi nama = test, lokasi = asdadsa, no_telepon = 213213, email = test20@mailinator.com, status = Aktif', 'Isi data sebelumnya adalah nama = test, lokasi = asdadsa, no_telepon = 213213, email = test20@mailinator.com, status = Aktif', 2, '2022-04-05 20:00:58'),
(86, 'Keluarga', 1, 'Menghapus data lama', 'Isi data sebelumnya adalah nama = test, lokasi = asdadsa, no_telepon = 213213, email = test20@mailinator.com, status = Aktif', 3, '2022-04-05 20:01:03'),
(87, 'Data Member', 1, 'Menambah data baru dengan isi profile = Soni Setiawan wilayah = 1, tanggal = 2022-04-05, status = Aktif', 'Belum ada data', 1, '2022-04-05 20:06:33'),
(88, '', 1, 'Menghapus data lama', 'Isi data sebelumnya adalah \"\"', 3, '2022-04-05 20:09:41'),
(89, '', 1, 'Menghapus data lama', 'Isi data sebelumnya adalah \"\"', 3, '2022-04-05 20:09:53'),
(90, '', 1, 'Menghapus data lama', 'Isi data sebelumnya adalah \"\"', 3, '2022-04-05 20:09:57'),
(91, 'Data Member', 1, 'Menambah data baru dengan isi profile = Nurul Afanti keanggotaan = 1, tanggal = 2022-04-05, status = Aktif', 'Belum ada data', 1, '2022-04-05 20:10:05'),
(92, 'Keluarga', 1, 'Menambah data baru dengan isi nama = Keluarga Andri, lokasi = Bandung, no_telepon = 088223232, email = keluarga.andri@mailinator.com, status = Aktif', 'Belum ada data', 1, '2022-04-05 21:02:10'),
(93, 'Keluarga', 1, 'Mengubah isi data sebelumnya menjadi nama = Keluarga Andri, lokasi = Bandung, no_telepon = 088223232, email = keluarga.andri@mailinator.com, status = Aktif', 'Isi data sebelumnya adalah nama = Keluarga Andri, lokasi = Bandung, no_telepon = 088223232, email = keluarga.andri@mailinator.com, status = Aktif', 2, '2022-04-05 21:02:46'),
(94, 'Keluarga', 1, 'Mengubah isi data sebelumnya menjadi nama = Keluarga Andri, lokasi = Bandung, no_telepon = 088223232, email = keluarga.andri@mailinator.com, status = Aktif', 'Isi data sebelumnya adalah nama = Keluarga Andri, lokasi = Bandung, no_telepon = 088223232, email = keluarga.andri@mailinator.com, status = Aktif', 2, '2022-04-05 21:03:56'),
(95, 'Keluarga', 1, 'Mengubah isi data sebelumnya menjadi nama = Keluarga Andri, lokasi = Bandung, no_telepon = 088223232, email = keluarga.andri@mailinator.com, status = Aktif', 'Isi data sebelumnya adalah nama = Keluarga Andri, lokasi = Bandung, no_telepon = 088223232, email = keluarga.andri@mailinator.com, status = Aktif', 2, '2022-04-05 21:05:25'),
(96, 'Keluarga', 1, 'Menghapus data lama', 'Isi data sebelumnya adalah nama = s, lokasi = asd, no_telepon = 3232, email = s21@mailinator.com, status = Aktif', 3, '2022-04-05 21:17:21'),
(97, 'Pengarah', 1, 'Mengubah isi data sebelumnya menjadi nama = Pengarah A, keterangan = Pengarah A, no urut = 1, status = Aktif', 'Isi data sebelumnya adalah nama = ABC, keterangan = abc, no urut = 1, status = Aktif', 2, '2022-04-08 17:29:43'),
(98, 'Pengarah', 1, 'Menambah data baru dengan isi nama = Pengarah B, keterangan = Pengarah B, no urut = 2, status = Aktif', 'Belum ada data', 1, '2022-04-08 17:29:52'),
(99, 'Term Management', 1, 'Mengubah isi data sebelumnya menjadi menu = Pengarah, nama = Pengarah 2, keterangan = -, status = Aktif', 'Isi data sebelumnya adalah menu = Pengarah, nama = Pengarah, -, status = Aktif', 2, '2022-04-08 17:30:04'),
(100, 'Pengarah 2', 1, 'Menambah data baru dengan isi nama = Pengarah C, keterangan = Pengarah C, no urut = 3, status = Aktif', 'Belum ada data', 1, '2022-04-08 17:30:20'),
(101, 'Komisi', 1, 'Mengubah isi data sebelumnya menjadi nama = Komisi 1, keterangan = Komisi 1, no urut = 1, status = Aktif', 'Isi data sebelumnya adalah nama = ABC, keterangan = abc, no urut = 1, status = Aktif', 2, '2022-04-08 17:31:40'),
(102, 'Komisi', 1, 'Menambah data baru dengan isi nama = Komisi 2, keterangan = Komisi 2, no urut = 2, status = Aktif', 'Belum ada data', 1, '2022-04-08 17:31:51'),
(103, 'Komisi', 1, 'Menambah data baru dengan isi nama = Komisi 3, keterangan = Komisi 3, no urut = 3, status = Aktif', 'Belum ada data', 1, '2022-04-08 17:31:58'),
(104, 'Jabatan', 1, 'Menambah data baru dengan isi nama = Bendahara, keterangan = Bendahara, no urut = 3, status = Aktif', 'Belum ada data', 1, '2022-04-08 18:21:11'),
(105, 'Data Member', 1, 'Menambah data baru dengan isi profile = Soni Setiawan keanggotaan = 2, tanggal = 2022-04-24, status = Aktif', 'Belum ada data', 1, '2022-04-08 18:22:33'),
(106, 'Term Management', 1, 'Mengubah isi data sebelumnya menjadi menu = Pengarah, nama = Pengarah, keterangan = -, status = Aktif', 'Isi data sebelumnya adalah menu = Pengarah, nama = Pengarah 2, -, status = Aktif', 2, '2022-04-08 18:27:22'),
(107, 'Term Management', 1, 'Mengubah isi data sebelumnya menjadi menu = Jabatan, nama = Jabatan 1, keterangan = -, status = Aktif', 'Isi data sebelumnya adalah menu = Jabatan, nama = Jabatan, -, status = Aktif', 2, '2022-04-08 18:27:43'),
(108, 'Term Management', 1, 'Mengubah isi data sebelumnya menjadi menu = Jabatan, nama = Jabatan, keterangan = -, status = Aktif', 'Isi data sebelumnya adalah menu = Jabatan, nama = Jabatan 1, -, status = Aktif', 2, '2022-04-08 18:28:04'),
(109, 'Kode', 1, 'Mengubah isi data sebelumnya menjadi kode = 030401, bulan = Ya, tahun = Ya, jumlah = 4, status = Aktif', 'Isi data sebelumnya adalah kode = 080401, bulan = Ya, tahun = Ya, jumlah = 4, status = Aktif', 2, '2022-04-14 19:13:40'),
(110, 'Kode', 1, 'Mengubah isi data sebelumnya menjadi kode = 030401, bulan = Ya, tahun = Ya, jumlah = 4, status = Aktif', 'Isi data sebelumnya adalah kode = 080401, bulan = Ya, tahun = Ya, jumlah = 4, status = Aktif', 2, '2022-04-14 19:13:45'),
(111, 'Kode', 1, 'Mengubah isi data sebelumnya menjadi kode = 030401, bulan = Ya, tahun = Ya, jumlah = 8, status = Aktif', 'Isi data sebelumnya adalah kode = 080401, bulan = Ya, tahun = Ya, jumlah = 8, status = Aktif', 2, '2022-04-14 19:14:03'),
(112, '', 1, 'Menambah data baru dengan isi nama = X, status = Aktif', 'Belum ada data', 1, '2022-04-18 16:52:59'),
(113, '', 1, 'Mengubah isi data sebelumnya menjadi nama = X Y, status = Aktif', 'Isi data sebelumnya adalah nama = X, status = Aktif', 2, '2022-04-18 16:53:38'),
(114, '', 1, 'Menambah data baru dengan isi nama = Z, status = Aktif', 'Belum ada data', 1, '2022-04-18 16:58:23'),
(115, 'Kategorial Umur', 1, 'Menambah data baru dengan isi nama = R, status = Aktif', 'Belum ada data', 1, '2022-04-18 16:59:05'),
(116, 'Kategorial Umur', 1, 'Mengubah isi data sebelumnya menjadi nama = ZR, status = Aktif', 'Isi data sebelumnya adalah nama = Z, status = Aktif', 2, '2022-04-18 16:59:50'),
(117, 'Kategorial Umur', 1, 'Mengubah isi data sebelumnya menjadi nama = X Ye, status = Aktif', 'Isi data sebelumnya adalah nama = X Y, status = Aktif', 2, '2022-04-18 17:00:22'),
(118, 'Kategorial Umur', 1, 'Menghapus data lama', 'Isi data sebelumnya adalah nama = R, status = Aktif', 3, '2022-04-18 17:00:25'),
(119, 'Kategorial Umur', 1, 'Menghapus data lama', 'Isi data sebelumnya adalah nama = ZR, status = Aktif', 3, '2022-04-18 17:00:28'),
(120, 'Kategorial Umur', 1, 'Menghapus data lama', 'Isi data sebelumnya adalah nama = X Ye, status = Aktif', 3, '2022-04-18 17:00:30'),
(121, 'Wilayah', 1, 'Menambah data baru dengan isi nama = f, status = Aktif', 'Belum ada data', 1, '2022-04-18 17:04:09'),
(122, 'Wilayah', 1, 'Mengubah isi data sebelumnya menjadi nama = fe, status = Aktif', 'Isi data sebelumnya adalah nama = , status = ', 2, '2022-04-18 17:04:19'),
(123, 'Wilayah', 1, 'Mengubah isi data sebelumnya menjadi nama = rrr, status = Aktif', 'Isi data sebelumnya adalah nama = , status = ', 2, '2022-04-18 17:05:42'),
(124, 'Wilayah', 1, 'Mengubah isi data sebelumnya menjadi nama = rrrrq, status = Aktif', 'Isi data sebelumnya adalah nama = rrrrq, status = Aktif', 2, '2022-04-18 17:06:46'),
(125, 'Kategori Keanggotaan', 1, 'Menambah data baru dengan isi nama = eee, keterangan = e, no urut = 5, status = Aktif', 'Belum ada data', 1, '2022-04-18 17:10:15'),
(126, 'Kategori Keanggotaan', 1, 'Mengubah isi data sebelumnya menjadi nama = eeerrrr, keterangan = errrr, no urut = 53, status = Aktif', 'Isi data sebelumnya adalah nama = eee, keterangan = e, no urut = 5, status = Aktif', 2, '2022-04-18 17:10:30'),
(127, 'Data Member', 1, 'Menambah data baru dengan isi profile = Dani Rismawan wilayah = 1, tanggal = 2022-04-18, status = Aktif', 'Belum ada data', 1, '2022-04-18 17:13:17'),
(128, 'Data Member', 1, 'Mengubah isi data sebelumnya menjadi profile =    , wilayah = Bandung, status = Aktif', 'Isi data sebelumnya adalah profile =    , wilayah = , status = ', 2, '2022-04-18 17:26:04'),
(129, 'Data Member', 1, 'Mengubah isi data sebelumnya menjadi profile = Dani Rismawan, wilayah = Cimahi, status = Aktif', 'Isi data sebelumnya adalah profile = Dani Rismawan, wilayah = , status = ', 2, '2022-04-18 17:27:19'),
(130, 'Data Member', 1, 'Mengubah isi data sebelumnya menjadi profile = Dani Rismawan, wilayah = Bandung, status = Aktif', 'Isi data sebelumnya adalah profile = Dani Rismawan, wilayah = , status = ', 2, '2022-04-18 17:28:46'),
(131, 'Data Member', 1, 'Mengubah isi data sebelumnya menjadi profile = Dani Rismawan, wilayah = Cimahi, status = Aktif', 'Isi data sebelumnya adalah profile = Dani Rismawan, wilayah = Bandung, status = 1', 2, '2022-04-18 17:29:45'),
(132, 'Data Member', 1, 'Mengubah isi data sebelumnya menjadi profile = Dani Rismawan, wilayah = Bandung, status = Aktif', 'Isi data sebelumnya adalah profile = Dani Rismawan, wilayah = Cimahi, status = 1', 2, '2022-04-18 17:29:52'),
(133, 'Data Member', 1, 'Menambah data baru dengan isi profile = Dani Rismawan kategorial = 5, tanggal = 2022-04-18, status = Aktif', 'Belum ada data', 1, '2022-04-18 17:41:12'),
(134, 'Data Member', 1, 'Mengubah isi data sebelumnya menjadi profile =    , kategorial = Anak-anak, status = Tidak Aktif', 'Isi data sebelumnya adalah tipe_kontak =    , kategorial = Bayi, status = 1', 2, '2022-04-18 17:42:25'),
(135, 'Data Member', 1, 'Mengubah isi data sebelumnya menjadi profile =    , kategorial = Bayi, status = Tidak Aktif', 'Isi data sebelumnya adalah tipe_kontak =    , kategorial = Anak-anak, status = 1', 2, '2022-04-18 17:42:38'),
(136, 'Data Member', 1, 'Mengubah isi data sebelumnya menjadi profile =    , kategorial = Anak-anak, status = Aktif', 'Isi data sebelumnya adalah tipe_kontak =    , kategorial = Bayi, status = 1', 2, '2022-04-18 17:43:09'),
(137, 'Data Member', 1, 'Mengubah isi data sebelumnya menjadi profile = Dani Rismawan, kategorial = Bayi, status = Aktif', 'Isi data sebelumnya adalah tipe_kontak = Dani Rismawan, kategorial = Anak-anak, status = 1', 2, '2022-04-18 17:43:43'),
(138, 'Data Member', 1, 'Mengubah isi data sebelumnya menjadi profile = Dani Rismawan, wilayah = Cimahi, status = Aktif', 'Isi data sebelumnya adalah profile = Dani Rismawan, wilayah = Bandung, status = Aktif', 2, '2022-04-18 17:45:32'),
(139, '', 1, 'Menghapus data lama', 'Isi data sebelumnya adalah \"\"', 3, '2022-04-18 17:45:46'),
(140, 'Data Member', 1, 'Menambah data baru dengan isi profile = Dani Rismawan kategorial = Muda, tanggal = 2022-04-18, status = Aktif', 'Belum ada data', 1, '2022-04-18 17:45:53'),
(141, 'Version', 1, 'Mengubah isi data sebelumnya menjadi nama = v.0.0.3, status = Tidak Aktif', 'Isi data sebelumnya adalah nama = v.0.0.3, status = Tidak Aktif', 2, '2022-04-18 18:38:48'),
(142, 'Data Member', 1, 'Menambah data baru dengan isi profile = Nurul Afanti keanggotaan = 2, tanggal = 2022-04-19, status = Aktif', 'Belum ada data', 1, '2022-04-19 17:29:37'),
(143, 'Data Member', 1, 'Menambah data baru dengan isi profile = Dani Rismawan, jenis_membership = Level 5, approver = Super Admin, tanggal_anggota = 2022-04-01, status = Tidak Diketahui', 'Belum ada data', 1, '2022-04-19 20:30:13'),
(144, 'Data Member', 1, 'Menambah data baru dengan isi profile = Dani Rismawan, jenis_membership = Level 5, profile_atasan = Nurul Afanti, status = Aktif', 'Belum ada data', 1, '2022-04-19 20:30:13'),
(145, 'Data Member', 1, 'Mengubah isi data sebelumnya menjadi id = 117, level = Partner L2, nik = 080401-202203-0002, partner = Setiawan, user_nama = Nurul, user_email = nurulafanti@mailinator.com, user_email_status = 1, user_phone = 0, user_status = Aktif', 'Isi data sebelumnya adalah id = 117, level = Reader, nik = 080401-202203-0002, id_partner = 25, user_nama = Nurul, user_email = nurulafanti@mailinator.com, user_email_status = 1, user_phone = 0, user_status = Aktif', 2, '2022-04-19 20:35:26'),
(146, 'Data Member', 1, 'Mengubah isi data sebelumnya menjadi id = 52, nama_depan = Nurul, nama_belakang = Afanti, jenis_kelamin = 2, status = Aktif, photo = ', 'Isi data sebelumnya adalah id = 52, nama_depan = , nama_belakang = , jenis_kelamin = Tidak Diketahui, status = Aktif, photo = ', 2, '2022-04-19 20:35:27'),
(147, 'Data Member', 1, 'Mengubah isi data sebelumnya menjadi id = 118, level = Partner L2, nik = 080401-202203-0003, partner = Keluarga Rismawan, user_nama = Dani, user_email = dandi@mailinator.com, user_email_status = 0, user_phone = 0, user_status = Aktif', 'Isi data sebelumnya adalah id = 118, level = Reader, nik = 080401-202203-0003, id_partner = 26, user_nama = Dani, user_email = dandi@mailinator.com, user_email_status = 0, user_phone = 0, user_status = Aktif', 2, '2022-04-19 20:37:38'),
(148, 'Data Member', 1, 'Mengubah isi data sebelumnya menjadi id = 52, nama_depan = Dani, nama_belakang = Rismawan, jenis_kelamin = 1, status = Aktif, photo = ', 'Isi data sebelumnya adalah id = 52, nama_depan = , nama_belakang = , jenis_kelamin = Tidak Diketahui, status = Aktif, photo = ', 2, '2022-04-19 20:37:38'),
(149, 'Data Member', 1, 'Menambah data baru dengan isi profile = Nurul Afanti, jenis_membership = Level 4, approver = Super Admin, tanggal_anggota = 2022-04-19, status = Tidak Diketahui', 'Belum ada data', 1, '2022-04-19 20:39:01'),
(150, 'Data Member', 1, 'Menambah data baru dengan isi profile = Nurul Afanti, jenis_membership = Level 4, profile_atasan = Soni Setiawan, status = Aktif', 'Belum ada data', 1, '2022-04-19 20:39:01'),
(151, 'Data Member', NULL, 'Mengubah setiap data sebelumnya menjadi status = Tidak Aktif', 'Isi data sebelumnya adalah {\"profile\":\"Nurul Afanti\",\"jenis_membership\":\"Level 2\",\"nama_atasan\":\"Soni Setiawan\",\"status_str\":\"Aktif\"}', 2, '2022-04-19 20:39:31'),
(152, 'Data Member', NULL, 'Mengubah setiap data sebelumnya menjadi status = Tidak Aktif', 'Isi data sebelumnya adalah {\"profile\":\"Nurul Afanti\",\"nama_atasan\":\"Soni Setiawan\",\"jenis_membership\":\"Level 2\",\"tanggal_anggota\":\"2022-04-03\",\"status_str\":\"Disetujui\"}', 2, '2022-04-19 20:39:31'),
(153, 'Data Member', NULL, 'Mengubah isi data membership dengan profile = Nurul Afanti sebelumnya menjadi status = Disetujui', 'Isi data sebelumnya adalah membership dengan profile = Nurul Afanti, status = Meminta Persetujuan', 2, '2022-04-19 20:39:31'),
(154, '', 1, 'Menghapus data lama', 'Isi data sebelumnya adalah \"\"', 3, '2022-04-19 20:49:24'),
(155, 'Data Member', 1, 'Menambah data baru dengan isi profile = Nurul Afanti keanggotaan = 1, tanggal = 2022-04-19, status = Aktif', 'Belum ada data', 1, '2022-04-19 20:49:46'),
(156, 'Data Member', 1, 'Menambah data baru dengan isi profile = Nurul Afanti keanggotaan = 2, tanggal = 2022-04-22, status = Aktif', 'Belum ada data', 1, '2022-04-19 20:51:09'),
(157, 'Keluarga', 1, 'Menambah data baru dengan isi nama = Keluarga Hendrik, lokasi = Jakarta Pusat, no_telepon = 0882312312, email = pa.hendrik@gmail.com, status = Aktif', 'Belum ada data', 1, '2022-04-20 17:03:04'),
(158, '', 1, 'Menghapus data lama', 'Isi data sebelumnya adalah \"\"', 3, '2022-04-22 13:06:30'),
(159, 'Data Member', 1, 'Menambah data baru dengan isi profile = Dani Rismawan keanggotaan = 2, tanggal = 2022-04-22, status = Aktif', 'Belum ada data', 1, '2022-04-22 13:13:33'),
(160, 'Version', 1, 'Mengubah isi data sebelumnya menjadi nama = v.0.0.3, status = Tidak Aktif', 'Isi data sebelumnya adalah nama = v.0.0.3, status = Tidak Aktif', 2, '2022-04-22 14:17:35'),
(161, 'Keluarga', 1, 'Mengubah isi data sebelumnya menjadi nama = Keluarga Hendrik A, M SCPD A, lokasi = Jakarta Pusat, no_telepon = 0882312312, email = pa.hendrik@gmail.com, status = Aktif', 'Isi data sebelumnya adalah nama = Keluarga Hendrik, lokasi = Jakarta Pusat, no_telepon = 0882312312, email = pa.hendrik@gmail.com, status = Aktif', 2, '2022-04-22 14:22:15'),
(162, 'Keluarga', 1, 'Mengubah isi data sebelumnya menjadi nama = Keluarga Hendrik A, M SCPD A, lokasi = Jakarta Pusat, no_telepon = 0882312312, email = pa.hendrik@gmail.com, status = Aktif', 'Isi data sebelumnya adalah nama = Keluarga Hendrik A, , lokasi = Jakarta Pusat, no_telepon = 0882312312, email = pa.hendrik@gmail.com, status = Aktif', 2, '2022-04-22 14:22:53'),
(163, 'Data Member', 1, 'Menambah data baru dengan isi id = 119, level = Reader, nik = 080401-202201-0001, partner = Keluarga Hendrik A, M SCPD A, user_nama = Abik, user_email = abik.hendrik@mailinator.com, user_email_status = 0, user_phone = 0, user_status = Aktif', 'Belum ada data', 1, '2022-04-22 14:30:41'),
(164, 'Data Member', 1, 'Mengubah isi data sebelumnya menjadi id = 52, nama_depan = Abik, nama_belakang = Hendrik, jenis_kelamin = 1, status = Aktif, photo = ', 'Isi data sebelumnya adalah id = 52, nama_depan = , nama_belakang = , jenis_kelamin = Tidak Diketahui, status = Aktif, photo = ', 2, '2022-04-22 14:30:41'),
(165, 'Data Member', 1, 'Menambah data baru dengan isi id = 120, level = Reader, nik = 080401-202201-0004, partner = Keluarga Hendrik A, M SCPD A, user_nama = Agnia, user_email = agnia.hendrik@mailinator.com, user_email_status = 0, user_phone = 0, user_status = Aktif', 'Belum ada data', 1, '2022-04-22 14:35:43'),
(166, 'Data Member', 1, 'Mengubah isi data sebelumnya menjadi id = 52, nama_depan = Agnia, nama_belakang = Hendrik, jenis_kelamin = 1, status = Aktif, photo = ', 'Isi data sebelumnya adalah id = 52, nama_depan = , nama_belakang = , jenis_kelamin = Tidak Diketahui, status = Aktif, photo = ', 2, '2022-04-22 14:35:43'),
(167, 'Data Member', 1, 'Menambah data baru dengan isi id = 121, level = Reader, nik = 080401-202204-0001, partner = Keluarga Hendrik A, M SCPD A, user_nama = biba, user_email = biba.hendrik@mailinator.com, user_email_status = 0, user_phone = 0, user_status = Aktif', 'Belum ada data', 1, '2022-04-22 14:39:42'),
(168, 'Data Member', 1, 'Mengubah isi data sebelumnya menjadi id = 52, nama_depan = biba, nama_belakang = Hendrik, jenis_kelamin = 1, status = Aktif, photo = ', 'Isi data sebelumnya adalah id = 52, nama_depan = , nama_belakang = , jenis_kelamin = Tidak Diketahui, status = Aktif, photo = ', 2, '2022-04-22 14:39:42'),
(169, 'Data Member', 1, 'Mengubah isi data sebelumnya menjadi id = 120, level = Reader, nik = 080401-202201-0004, partner = Keluarga Hendrik A, M SCPD A, user_nama = Agnia, user_email = agnia.hendrik@mailinator.com, user_email_status = 0, user_phone = 0, user_status = Aktif', 'Isi data sebelumnya adalah id = 120, level = Reader, nik = 080401-202201-0004, id_partner = 30, user_nama = Agnia, user_email = agnia.hendrik@mailinator.com, user_email_status = , user_phone = 0, user_status = Aktif', 2, '2022-04-22 14:40:27'),
(170, 'Data Member', 1, 'Mengubah isi data sebelumnya menjadi id = 52, nama_depan = Agnia, nama_belakang = Hendrik, jenis_kelamin = 2, status = Aktif, photo = ', 'Isi data sebelumnya adalah id = 52, nama_depan = , nama_belakang = , jenis_kelamin = Tidak Diketahui, status = Aktif, photo = ', 2, '2022-04-22 14:40:27'),
(171, 'Peristiwa Formal', 1, 'Mengubah isi data sebelumnya menjadi name = Tanggal Lahir, kategori = 1, details = Lahir, status = Aktif', 'Isi data sebelumnya adalah name = Tanggal Lahir, kategori = 0, details = Lahir, status = Aktif', 2, '2022-04-22 16:58:06'),
(172, 'Peristiwa Formal', 1, 'Mengubah isi data sebelumnya menjadi name = Tanggal Join, kategori = 1, details = 1223, status = Aktif', 'Isi data sebelumnya adalah name = Tanggal Join, kategori = 0, details = 1223, status = Aktif', 2, '2022-04-22 16:58:46'),
(173, 'Peristiwa Formal', 1, 'Mengubah isi data sebelumnya menjadi name = Tanggal Keluar, kategori = 1, details = resign, status = Aktif', 'Isi data sebelumnya adalah name = Tanggal Keluar, kategori = 0, details = resign, status = Aktif', 2, '2022-04-22 16:58:50'),
(174, 'Peristiwa Formal', 1, 'Mengubah isi data sebelumnya menjadi name = SAMPLE TANGGAL NEW, kategori = 1, details = OKE, status = Aktif', 'Isi data sebelumnya adalah name = SAMPLE TANGGAL NEW, kategori = 0, details = OKE, status = Aktif', 2, '2022-04-22 16:58:54'),
(175, 'Peristiwa Formal', 1, 'Mengubah isi data sebelumnya menjadi name = Pernikahan, kategori = 2, details = -, status = Aktif', 'Isi data sebelumnya adalah name = Pernikahan, kategori = 0, details = -, status = Aktif', 2, '2022-04-22 16:58:57'),
(176, 'Peristiwa Formal', 1, 'Menambah data baru dengan isi name = 3, kategori = 2, details = 3, status = Aktif', 'Belum ada data', 1, '2022-04-22 16:59:42'),
(177, 'Peristiwa Formal', 1, 'Menghapus data lama', 'Isi data sebelumnya adalah name = 3, kategori = 2, details = 3, status = Aktif', 3, '2022-04-22 16:59:45'),
(178, 'Peristiwa Formal', 1, 'Menghapus data lama', 'Isi data sebelumnya adalah name = SAMPLE TANGGAL NEW, kategori = 1, details = OKE, status = Aktif', 3, '2022-04-22 16:59:48'),
(179, 'Menu', 1, 'Menambah data baru dengan isi parent = Master, menu_nama = Institusi, menu_index = 4, menu_icon = far fa-circle, menu_url = data-master/institusi, menu_keterangan = -, menu_status = Aktif', 'Belum ada data', 1, '2022-04-22 17:02:07'),
(180, '', 1, 'Menambah data baru dengan isi menu = Institusi, level = Super Admin', 'Belum ada data', 1, '2022-04-22 17:02:18'),
(181, 'Menu', 1, 'Mengubah isi data sebelumnya menjadi parent = Master, menu_nama = Institusi, menu_index = 3, menu_icon = far fa-circle, menu_url = data-master/institusi, menu_keterangan = -, menu_status = Aktif', 'Isi data sebelumnya adalah parent = Master, menu_nama = Institusi, menu_index = 4, menu_icon = far fa-circle, menu_url = data-master/institusi, menu_keterangan = -, menu_status = Aktif', 2, '2022-04-22 17:07:07'),
(182, 'Institusi', 1, 'Menambah data baru dengan isi nama = UPI, keterangan = Upi, status = Aktif', 'Belum ada data', 1, '2022-04-22 17:07:36'),
(183, 'Institusi', 1, 'Menambah data baru dengan isi nama = Unikom, keterangan = Unikom, status = Aktif', 'Belum ada data', 1, '2022-04-22 17:07:46'),
(184, 'Institusi', 1, 'Mengubah isi data sebelumnya menjadi nama = Unikom, keterangan = Unikom2, status = Aktif', 'Isi data sebelumnya adalah nama = Unikom, keterangan = Unikom, status = Aktif', 2, '2022-04-22 17:07:49'),
(185, 'Institusi', 1, 'Menambah data baru dengan isi nama = 3, keterangan = 3, status = Aktif', 'Belum ada data', 1, '2022-04-22 17:07:54'),
(186, 'Institusi', 1, 'Menghapus data lama', 'Isi data sebelumnya adalah nama = 3, keterangan = 3, status = Aktif', 3, '2022-04-22 17:07:56'),
(187, 'Data Member', 1, 'Menambah data baru dengan isi profile = biba Hendrik, peristiwa_formal = Pernikahan, keterangan = 1, tempat = 1, tanggal_data_formal = 2022-04-22, status = Tidak Aktif', 'Belum ada data', 1, '2022-04-22 19:03:23'),
(188, 'Data Member', 1, 'Mengubah isi data sebelumnya menjadi id = 119, level = Reader, nik = 080401-202201-0001, partner = Keluarga Hendrik A, M SCPD A, user_nama = Abik, user_email = abik.hendrik@mailinator.com, user_email_status = 0, user_phone = 0, user_status = Aktif', 'Isi data sebelumnya adalah id = 119, level = Reader, nik = 080401-202201-0001, id_partner = 30, user_nama = Abik, user_email = abik.hendrik@mailinator.com, user_email_status = , user_phone = 0, user_status = Aktif', 2, '2022-04-22 19:08:32'),
(189, 'Data Member', 1, 'Mengubah isi data sebelumnya menjadi id = 52, nama_depan = Abik, nama_belakang = Hendrik, jenis_kelamin = 1, status = Aktif, photo = ', 'Isi data sebelumnya adalah id = 52, nama_depan = , nama_belakang = , jenis_kelamin = Tidak Diketahui, status = Aktif, photo = ', 2, '2022-04-22 19:08:32'),
(190, 'Data Member', 1, 'Mengubah isi data sebelumnya menjadi id = 120, level = Reader, nik = 080401-202201-0004, partner = Keluarga Hendrik A, M SCPD A, user_nama = Agnia, user_email = agnia.hendrik@mailinator.com, user_email_status = 0, user_phone = 0, user_status = Aktif', 'Isi data sebelumnya adalah id = 120, level = Reader, nik = 080401-202201-0004, id_partner = 30, user_nama = Agnia, user_email = agnia.hendrik@mailinator.com, user_email_status = 0, user_phone = 0, user_status = Aktif', 2, '2022-04-22 19:08:41'),
(191, 'Data Member', 1, 'Mengubah isi data sebelumnya menjadi id = 52, nama_depan = Agnia, nama_belakang = Hendrik, jenis_kelamin = 2, status = Aktif, photo = ', 'Isi data sebelumnya adalah id = 52, nama_depan = , nama_belakang = , jenis_kelamin = Tidak Diketahui, status = Aktif, photo = ', 2, '2022-04-22 19:08:41'),
(192, 'Data Member', 1, 'Menambah data baru dengan isi profile = Abik Hendrik, peristiwa_formal = Pernikahan, keterangan = 1, tempat = 1, tanggal_data_formal = 2022-04-29, status = Tidak Aktif', 'Belum ada data', 1, '2022-04-22 19:32:18'),
(193, 'Data Member', 1, 'Menambah data baru dengan isi profile = Abik Hendrik, jenis_membership = Level 3, approver = Super Admin, tanggal_anggota = 2022-04-01, status = Tidak Diketahui', 'Belum ada data', 1, '2022-04-23 04:13:05'),
(194, 'Data Member', 1, 'Menambah data baru dengan isi profile = Abik Hendrik, jenis_membership = Level 3, profile_atasan = , status = Aktif', 'Belum ada data', 1, '2022-04-23 04:13:06'),
(195, 'Data Member', 1, 'Menambah data baru dengan isi profile = Nurul Afanti, jenis_membership = Level 1, approver = Super Admin, tanggal_anggota = 2022-04-23, status = Disetujui', 'Belum ada data', 1, '2022-04-23 04:20:35'),
(196, 'Data Member', 1, 'Menambah data baru dengan isi profile = Nurul Afanti, jenis_membership = Level 1, profile_atasan = , status = Aktif', 'Belum ada data', 1, '2022-04-23 04:20:35'),
(197, 'Data Member', 1, 'Menambah data baru dengan isi profile = Nurul Afanti, jenis_membership = Level 5, approver = Super Admin, tanggal_anggota = 2022-04-17, status = Tidak Diketahui', 'Belum ada data', 1, '2022-04-23 04:22:21'),
(198, 'Data Member', 1, 'Menambah data baru dengan isi profile = Nurul Afanti, jenis_membership = Level 5, profile_atasan = , status = Aktif', 'Belum ada data', 1, '2022-04-23 04:22:21'),
(199, 'Data Member', NULL, 'Mengubah setiap data sebelumnya menjadi status = Tidak Aktif', 'Isi data sebelumnya adalah {\"profile\":\"Nurul Afanti\",\"jenis_membership\":\"Level 1\",\"nama_atasan\":\"\",\"status_str\":\"Tidak Diketahui\"}', 2, '2022-04-23 04:22:48'),
(200, 'Data Member', NULL, 'Mengubah setiap data sebelumnya menjadi status = Tidak Aktif', 'Isi data sebelumnya adalah {\"profile\":\"Nurul Afanti\",\"nama_atasan\":\"\",\"jenis_membership\":\"Level 1\",\"tanggal_anggota\":\"2022-03-01\",\"status_str\":\"Tidak Aktif\"}', 2, '2022-04-23 04:22:48'),
(201, 'Data Member', NULL, 'Mengubah isi data membership dengan profile = Nurul Afanti sebelumnya menjadi status = Disetujui', 'Isi data sebelumnya adalah membership dengan profile = Nurul Afanti, status = Meminta Persetujuan', 2, '2022-04-23 04:22:48'),
(202, 'Data Member', 1, 'Menambah data baru dengan isi profile = Nurul Afanti, jenis_membership = Level 1, approver = Super Admin, tanggal_anggota = 2022-04-01, status = Disetujui', 'Belum ada data', 1, '2022-04-23 04:25:44'),
(203, 'Data Member', 1, 'Menambah data baru dengan isi profile = Nurul Afanti, jenis_membership = Level 1, profile_atasan = , status = Aktif', 'Belum ada data', 1, '2022-04-23 04:25:44'),
(204, 'Data Member', 1, 'Menambah data baru dengan isi profile = Nurul Afanti, jenis_membership = Level 3, approver = Super Admin, tanggal_anggota = 2022-04-10, status = Tidak Diketahui', 'Belum ada data', 1, '2022-04-23 04:27:05'),
(205, 'Data Member', 1, 'Menambah data baru dengan isi profile = Nurul Afanti, jenis_membership = Level 3, profile_atasan = , status = Aktif', 'Belum ada data', 1, '2022-04-23 04:27:05'),
(206, 'Data Member', NULL, 'Mengubah setiap data sebelumnya menjadi status = Tidak Aktif', 'Isi data sebelumnya adalah {\"profile\":\"Nurul Afanti\",\"jenis_membership\":\"Level 1\",\"nama_atasan\":\"\",\"status_str\":\"Tidak Diketahui\"}', 2, '2022-04-23 04:28:10'),
(207, 'Data Member', NULL, 'Mengubah setiap data sebelumnya menjadi status = Tidak Aktif', 'Isi data sebelumnya adalah {\"profile\":\"Nurul Afanti\",\"nama_atasan\":\"\",\"jenis_membership\":\"Level 1\",\"tanggal_anggota\":\"2022-03-01\",\"status_str\":\"Tidak Aktif\"}', 2, '2022-04-23 04:28:10'),
(208, 'Data Member', NULL, 'Mengubah isi data membership dengan profile = Nurul Afanti sebelumnya menjadi status = Disetujui', 'Isi data sebelumnya adalah membership dengan profile = Nurul Afanti, status = Meminta Persetujuan', 2, '2022-04-23 04:28:10'),
(209, 'Data Member', 1, 'Menambah data baru dengan isi profile = Nurul Afanti, jenis_membership = Level 1, approver = Super Admin, tanggal_anggota = 2022-04-06, status = Disetujui', 'Belum ada data', 1, '2022-04-23 04:29:47'),
(210, 'Data Member', 1, 'Menambah data baru dengan isi profile = Nurul Afanti, jenis_membership = Level 1, profile_atasan = , status = Aktif', 'Belum ada data', 1, '2022-04-23 04:29:47'),
(211, 'Data Member', NULL, 'Menambah data baru dengan isi profile = Nurul Afanti, jenis_membership = Level 1, approver = Soni, tanggal_anggota = 2022-04-10, status = Disetujui', 'Belum ada data', 1, '2022-04-23 04:30:35'),
(212, 'Data Member', NULL, 'Menambah data baru dengan isi profile = Nurul Afanti, jenis_membership = Level 1, profile_atasan = , status = Aktif', 'Belum ada data', 1, '2022-04-23 04:30:35'),
(213, 'Data Member', 1, 'Menambah data baru dengan isi profile = Nurul Afanti, jenis_membership = Level 2, approver = Super Admin, tanggal_anggota = 2022-04-13, status = Tidak Diketahui', 'Belum ada data', 1, '2022-04-23 04:46:02'),
(214, 'Data Member', 1, 'Menambah data baru dengan isi profile = Nurul Afanti, jenis_membership = Level 2, profile_atasan = , status = Aktif', 'Belum ada data', 1, '2022-04-23 04:46:03'),
(215, 'Data Member', NULL, 'Mengubah setiap data sebelumnya menjadi status = Tidak Aktif', 'Isi data sebelumnya adalah {\"profile\":\"Nurul Afanti\",\"jenis_membership\":\"Level 1\",\"nama_atasan\":\"\",\"status_str\":\"Tidak Diketahui\"}', 2, '2022-04-23 04:46:38'),
(216, 'Data Member', NULL, 'Mengubah setiap data sebelumnya menjadi status = Tidak Aktif', 'Isi data sebelumnya adalah {\"profile\":\"Nurul Afanti\",\"nama_atasan\":\"\",\"jenis_membership\":\"Level 1\",\"tanggal_anggota\":\"2022-03-01\",\"status_str\":\"Tidak Aktif\"}', 2, '2022-04-23 04:46:38'),
(217, 'Data Member', NULL, 'Mengubah isi data membership dengan profile = Nurul Afanti sebelumnya menjadi status = Disetujui', 'Isi data sebelumnya adalah membership dengan profile = Nurul Afanti, status = Meminta Persetujuan', 2, '2022-04-23 04:46:38');
INSERT INTO `activity_log` (`id`, `modul`, `by`, `data_baru`, `data_lama`, `jenis_perubahan`, `created_at`) VALUES
(218, 'Data Member', 1, 'Menambah data baru dengan isi profile = Nurul Afanti, jenis_membership = Level 3, approver = Super Admin, tanggal_anggota = 2022-04-15, status = Tidak Diketahui', 'Belum ada data', 1, '2022-04-23 04:51:41'),
(219, 'Data Member', 1, 'Menambah data baru dengan isi profile = Nurul Afanti, jenis_membership = Level 3, profile_atasan = , status = Aktif', 'Belum ada data', 1, '2022-04-23 04:51:41'),
(220, 'Data Member', NULL, 'Mengubah setiap data sebelumnya menjadi status = Tidak Aktif', 'Isi data sebelumnya adalah {\"profile\":\"Nurul Afanti\",\"jenis_membership\":\"Level 1\",\"nama_atasan\":\"\",\"status_str\":\"Tidak Diketahui\"}', 2, '2022-04-23 04:59:49'),
(221, 'Data Member', NULL, 'Mengubah setiap data sebelumnya menjadi status = Tidak Aktif', 'Isi data sebelumnya adalah {\"profile\":\"Nurul Afanti\",\"nama_atasan\":\"\",\"jenis_membership\":\"Level 1\",\"tanggal_anggota\":\"2022-03-01\",\"status_str\":\"Tidak Aktif\"}', 2, '2022-04-23 04:59:49'),
(222, 'Data Member', NULL, 'Mengubah isi data membership dengan profile = Nurul Afanti sebelumnya menjadi status = Disetujui', 'Isi data sebelumnya adalah membership dengan profile = Nurul Afanti, status = Meminta Persetujuan', 2, '2022-04-23 04:59:49'),
(223, 'Data Member', 1, 'Menambah data baru dengan isi profile = Agnia Hendrik, jenis_membership = Level 3, approver = Super Admin, tanggal_anggota = 2022-04-09, status = Tidak Diketahui', 'Belum ada data', 1, '2022-04-26 18:56:59'),
(224, 'Data Member', 1, 'Menambah data baru dengan isi profile = Agnia Hendrik, jenis_membership = Level 3, profile_atasan = , status = Aktif', 'Belum ada data', 1, '2022-04-26 18:56:59'),
(225, 'Data Member', 1, 'Menambah data baru dengan isi profile = Nurul Afanti, jenis_membership = Level 2, approver = Super Admin, tanggal_anggota = 2022-04-01, status = Tidak Diketahui', 'Belum ada data', 1, '2022-04-26 19:02:30'),
(226, 'Data Member', 1, 'Menambah data baru dengan isi profile = Nurul Afanti, jenis_membership = Level 2, profile_atasan = , status = Aktif', 'Belum ada data', 1, '2022-04-26 19:02:30'),
(227, 'Data Member', NULL, 'Mengubah setiap data sebelumnya menjadi status = Tidak Aktif', 'Isi data sebelumnya adalah {\"profile\":\"Nurul Afanti\",\"jenis_membership\":\"Level 1\",\"nama_atasan\":\"\",\"status_str\":\"Tidak Diketahui\"}', 2, '2022-04-26 19:03:15'),
(228, 'Data Member', NULL, 'Mengubah setiap data sebelumnya menjadi status = Tidak Aktif', 'Isi data sebelumnya adalah {\"profile\":\"Nurul Afanti\",\"nama_atasan\":\"\",\"jenis_membership\":\"Level 1\",\"tanggal_anggota\":\"2022-03-01\",\"status_str\":\"Tidak Aktif\"}', 2, '2022-04-26 19:03:16'),
(229, 'Data Member', NULL, 'Mengubah isi data membership dengan profile = Nurul Afanti sebelumnya menjadi status = Disetujui', 'Isi data sebelumnya adalah membership dengan profile = Nurul Afanti, status = Meminta Persetujuan', 2, '2022-04-26 19:03:16'),
(230, 'Data Member', NULL, 'Mengubah setiap data sebelumnya menjadi status = Tidak Aktif', 'Isi data sebelumnya adalah {\"profile\":\"Agnia Hendrik\",\"jenis_membership\":\"Level 3\",\"nama_atasan\":\"\",\"status_str\":\"Tidak Diketahui\"}', 2, '2022-04-26 19:10:29'),
(231, 'Data Member', NULL, 'Mengubah setiap data sebelumnya menjadi status = Tidak Aktif', 'Isi data sebelumnya adalah {\"profile\":\"Agnia Hendrik\",\"nama_atasan\":\"\",\"jenis_membership\":\"Level 3\",\"tanggal_anggota\":\"2022-04-09\",\"status_str\":\"Meminta Persetujuan\"}', 2, '2022-04-26 19:10:30'),
(232, 'Data Member', NULL, 'Mengubah isi data membership dengan profile = Agnia Hendrik sebelumnya menjadi status = Disetujui', 'Isi data sebelumnya adalah membership dengan profile = Agnia Hendrik, status = Meminta Persetujuan', 2, '2022-04-26 19:10:30'),
(233, 'Data Member', 1, 'Menambah data baru dengan isi profile = Agnia Hendrik, jenis_membership = Level 4, approver = Super Admin, tanggal_anggota = 2022-04-16, status = Tidak Diketahui', 'Belum ada data', 1, '2022-04-26 19:11:03'),
(234, 'Data Member', 1, 'Menambah data baru dengan isi profile = Agnia Hendrik, jenis_membership = Level 4, profile_atasan = , status = Aktif', 'Belum ada data', 1, '2022-04-26 19:11:03'),
(235, 'Data Member', NULL, 'Mengubah setiap data sebelumnya menjadi status = Tidak Aktif', 'Isi data sebelumnya adalah {\"profile\":\"Agnia Hendrik\",\"jenis_membership\":\"Level 3\",\"nama_atasan\":\"\",\"status_str\":\"Aktif\"}', 2, '2022-04-26 19:11:18'),
(236, 'Data Member', NULL, 'Mengubah setiap data sebelumnya menjadi status = Tidak Aktif', 'Isi data sebelumnya adalah {\"profile\":\"Agnia Hendrik\",\"nama_atasan\":\"\",\"jenis_membership\":\"Level 3\",\"tanggal_anggota\":\"2022-04-09\",\"status_str\":\"Disetujui\"}', 2, '2022-04-26 19:11:18'),
(237, 'Data Member', NULL, 'Mengubah isi data membership dengan profile = Agnia Hendrik sebelumnya menjadi status = Disetujui', 'Isi data sebelumnya adalah membership dengan profile = Agnia Hendrik, status = Meminta Persetujuan', 2, '2022-04-26 19:11:18'),
(238, 'Data Member', 1, 'Menambah data baru dengan isi profile = Agnia Hendrik, jenis_membership = Level 5, approver = Super Admin, tanggal_anggota = 2022-04-30, status = Tidak Diketahui', 'Belum ada data', 1, '2022-04-26 19:12:38'),
(239, 'Data Member', 1, 'Menambah data baru dengan isi profile = Agnia Hendrik, jenis_membership = Level 5, profile_atasan = , status = Aktif', 'Belum ada data', 1, '2022-04-26 19:12:38'),
(240, 'Data Member', NULL, 'Mengubah setiap data sebelumnya menjadi status = Tidak Aktif', 'Isi data sebelumnya adalah {\"profile\":\"Agnia Hendrik\",\"jenis_membership\":\"Level 3\",\"nama_atasan\":\"\",\"status_str\":\"Tidak Diketahui\"}', 2, '2022-04-26 19:13:35'),
(241, 'Data Member', NULL, 'Mengubah setiap data sebelumnya menjadi status = Tidak Aktif', 'Isi data sebelumnya adalah {\"profile\":\"Agnia Hendrik\",\"nama_atasan\":\"\",\"jenis_membership\":\"Level 3\",\"tanggal_anggota\":\"2022-04-09\",\"status_str\":\"Tidak Aktif\"}', 2, '2022-04-26 19:13:35'),
(242, 'Data Member', NULL, 'Mengubah isi data membership dengan profile = Agnia Hendrik sebelumnya menjadi status = Disetujui', 'Isi data sebelumnya adalah membership dengan profile = Agnia Hendrik, status = Meminta Persetujuan', 2, '2022-04-26 19:13:35'),
(243, 'Data Member', NULL, 'Menambah data baru dengan isi profile = Agnia Hendrik, jenis_membership = Level 3, approver = Nurul, tanggal_anggota = 2022-04-07, status = Tidak Diketahui', 'Belum ada data', 1, '2022-04-26 19:14:18'),
(244, 'Data Member', NULL, 'Menambah data baru dengan isi profile = Agnia Hendrik, jenis_membership = Level 3, profile_atasan = , status = Aktif', 'Belum ada data', 1, '2022-04-26 19:14:18'),
(245, 'Data Member', NULL, 'Mengubah setiap data sebelumnya menjadi status = Tidak Aktif', 'Isi data sebelumnya adalah {\"profile\":\"Agnia Hendrik\",\"jenis_membership\":\"Level 3\",\"nama_atasan\":\"\",\"status_str\":\"Tidak Diketahui\"}', 2, '2022-04-26 19:14:26'),
(246, 'Data Member', NULL, 'Mengubah setiap data sebelumnya menjadi status = Tidak Aktif', 'Isi data sebelumnya adalah {\"profile\":\"Agnia Hendrik\",\"nama_atasan\":\"\",\"jenis_membership\":\"Level 3\",\"tanggal_anggota\":\"2022-04-09\",\"status_str\":\"Tidak Aktif\"}', 2, '2022-04-26 19:14:27'),
(247, 'Data Member', NULL, 'Mengubah isi data membership dengan profile = Agnia Hendrik sebelumnya menjadi status = Disetujui', 'Isi data sebelumnya adalah membership dengan profile = Agnia Hendrik, status = Meminta Persetujuan', 2, '2022-04-26 19:14:27'),
(248, 'Data Member', 1, 'Menambah data baru dengan isi profile = Agnia Hendrik, jenis_membership = Level 4, approver = Super Admin, tanggal_anggota = 2022-04-03, status = Tidak Diketahui', 'Belum ada data', 1, '2022-04-26 19:16:12'),
(249, 'Data Member', 1, 'Menambah data baru dengan isi profile = Agnia Hendrik, jenis_membership = Level 4, profile_atasan = , status = Aktif', 'Belum ada data', 1, '2022-04-26 19:16:12'),
(250, 'Data Member', NULL, 'Mengubah setiap data sebelumnya menjadi status = Tidak Aktif', 'Isi data sebelumnya adalah {\"profile\":\"Agnia Hendrik\",\"jenis_membership\":\"Level 3\",\"nama_atasan\":\"\",\"status_str\":\"Tidak Diketahui\"}', 2, '2022-04-26 19:19:30'),
(251, 'Data Member', NULL, 'Mengubah setiap data sebelumnya menjadi status = Tidak Aktif', 'Isi data sebelumnya adalah {\"profile\":\"Agnia Hendrik\",\"nama_atasan\":\"\",\"jenis_membership\":\"Level 3\",\"tanggal_anggota\":\"2022-04-09\",\"status_str\":\"Tidak Aktif\"}', 2, '2022-04-26 19:19:30'),
(252, 'Data Member', NULL, 'Mengubah isi data membership dengan profile = Agnia Hendrik sebelumnya menjadi status = Disetujui', 'Isi data sebelumnya adalah membership dengan profile = Agnia Hendrik, status = Meminta Persetujuan', 2, '2022-04-26 19:19:30'),
(253, 'Data Member', 1, 'Menambah data baru dengan isi profile = Agnia Hendrik, jenis_membership = Level 3, approver = Super Admin, tanggal_anggota = 2022-04-02, status = Tidak Diketahui', 'Belum ada data', 1, '2022-04-26 19:19:41'),
(254, 'Data Member', 1, 'Menambah data baru dengan isi profile = Agnia Hendrik, jenis_membership = Level 3, profile_atasan = , status = Aktif', 'Belum ada data', 1, '2022-04-26 19:19:41'),
(255, 'Keluarga', 1, 'Menambah data baru dengan isi nama = Pa Anton , lokasi = , no_telepon = , email = , status = Aktif', 'Belum ada data', 1, '2022-04-26 19:22:26'),
(256, 'Data Member', 1, 'Menambah data baru dengan isi id = 122, level = Reader, nik = 080401-202204-0005, partner = Pa Anton , user_nama = CmMS, user_email = pa.anton@mailinator.com, user_email_status = 0, user_phone = 0, user_status = Aktif', 'Belum ada data', 1, '2022-04-26 19:23:22'),
(257, 'Data Member', 1, 'Mengubah isi data sebelumnya menjadi id = 52, nama_depan = CmMS, nama_belakang = Pa Anton, jenis_kelamin = 1, status = Aktif, photo = ', 'Isi data sebelumnya adalah id = 52, nama_depan = , nama_belakang = , jenis_kelamin = Tidak Diketahui, status = Aktif, photo = ', 2, '2022-04-26 19:23:22'),
(258, 'Data Member', 1, 'Menambah data baru dengan isi id = 123, level = Reader, nik = 080401-202204-0006, partner = Pa Anton , user_nama = CmMS, user_email = r.a.kartini@mailinator.com, user_email_status = 0, user_phone = 0, user_status = Aktif', 'Belum ada data', 1, '2022-04-26 19:24:11'),
(259, 'Data Member', 1, 'Mengubah isi data sebelumnya menjadi id = 52, nama_depan = CmMS, nama_belakang = Bu R.A Kartini, jenis_kelamin = 2, status = Aktif, photo = ', 'Isi data sebelumnya adalah id = 52, nama_depan = , nama_belakang = , jenis_kelamin = Tidak Diketahui, status = Aktif, photo = ', 2, '2022-04-26 19:24:11'),
(260, 'Data Member', 1, 'Mengubah isi data sebelumnya menjadi id = 122, level = Reader, nik = 080401-202204-0005, partner = Pa Anton , user_nama = CmMS, user_email = pa.anton@mailinator.com, user_email_status = 0, user_phone = 0, user_status = Aktif', 'Isi data sebelumnya adalah id = 122, level = Reader, nik = 080401-202204-0005, id_partner = 31, user_nama = CmMS, user_email = pa.anton@mailinator.com, user_email_status = , user_phone = 0, user_status = Aktif', 2, '2022-04-26 19:24:21'),
(261, 'Data Member', 1, 'Mengubah isi data sebelumnya menjadi id = 52, nama_depan = CmMS, nama_belakang = Pa Anton, jenis_kelamin = 1, status = Aktif, photo = ', 'Isi data sebelumnya adalah id = 52, nama_depan = , nama_belakang = , jenis_kelamin = Tidak Diketahui, status = Aktif, photo = ', 2, '2022-04-26 19:24:21'),
(262, 'Data Member', 1, 'Mengubah isi data sebelumnya menjadi id = 122, level = Reader, nik = 080401-202204-0005, partner = Pa Anton , user_nama = CmMS, user_email = pa.anton@mailinator.com, user_email_status = 0, user_phone = 0, user_status = Aktif', 'Isi data sebelumnya adalah id = 122, level = Reader, nik = 080401-202204-0005, id_partner = 31, user_nama = CmMS, user_email = pa.anton@mailinator.com, user_email_status = 0, user_phone = 0, user_status = Aktif', 2, '2022-04-26 19:27:26'),
(263, 'Data Member', 1, 'Mengubah isi data sebelumnya menjadi id = 52, nama_depan = CmMS, nama_belakang = Pa Anton, jenis_kelamin = 1, status = Aktif, photo = ', 'Isi data sebelumnya adalah id = 52, nama_depan = , nama_belakang = , jenis_kelamin = Tidak Diketahui, status = Aktif, photo = ', 2, '2022-04-26 19:27:26'),
(264, 'Keluarga', 1, 'Menambah data baru dengan isi nama = Keluarga Muad, lokasi = , no_telepon = , email = , status = Aktif', 'Belum ada data', 1, '2022-04-26 19:58:13'),
(265, 'Data Member', 1, 'Menambah data baru dengan isi id = 124, level = Reader, nik = 080401-202204-0007, partner = Keluarga Muad, user_nama = Adi, user_email = adi.muad@mailinator.com, user_email_status = 0, user_phone = 0, user_status = Aktif', 'Belum ada data', 1, '2022-04-26 20:09:06'),
(266, 'Data Member', 1, 'Mengubah isi data sebelumnya menjadi id = 52, nama_depan = Adi, nama_belakang = Muad, jenis_kelamin = 1, status = Aktif, photo = ', 'Isi data sebelumnya adalah id = 52, nama_depan = , nama_belakang = , jenis_kelamin = Tidak Diketahui, status = Aktif, photo = ', 2, '2022-04-26 20:09:06'),
(267, 'Keluarga', 1, 'Mengubah isi data sebelumnya menjadi nama = Keluarga Muad, lokasi = , no_telepon = , email = , status = Aktif', 'Isi data sebelumnya adalah nama = Keluarga Muad, lokasi = , no_telepon = , email = , status = Aktif', 2, '2022-04-26 20:11:01'),
(268, 'Data Member', 1, 'Menambah data baru dengan isi profile = Adi Muad, jenis_membership = Level 3, approver = Super Admin, tanggal_anggota = 2022-04-01, status = Tidak Diketahui', 'Belum ada data', 1, '2022-04-26 20:17:15'),
(269, 'Data Member', 1, 'Menambah data baru dengan isi profile = Adi Muad, jenis_membership = Level 3, profile_atasan = , status = Aktif', 'Belum ada data', 1, '2022-04-26 20:17:15'),
(270, 'Data Member', NULL, 'Mengubah setiap data sebelumnya menjadi status = Tidak Aktif', 'Isi data sebelumnya adalah {\"profile\":\"Adi Muad\",\"jenis_membership\":\"Level 3\",\"nama_atasan\":\"\",\"status_str\":\"Tidak Diketahui\"}', 2, '2022-04-26 20:18:32'),
(271, 'Data Member', NULL, 'Mengubah setiap data sebelumnya menjadi status = Tidak Aktif', 'Isi data sebelumnya adalah {\"profile\":\"Adi Muad\",\"nama_atasan\":\"\",\"jenis_membership\":\"Level 3\",\"tanggal_anggota\":\"2022-04-01\",\"status_str\":\"Meminta Persetujuan\"}', 2, '2022-04-26 20:18:32'),
(272, 'Data Member', NULL, 'Mengubah isi data membership dengan profile = Adi Muad sebelumnya menjadi status = Disetujui', 'Isi data sebelumnya adalah membership dengan profile = Adi Muad, status = Meminta Persetujuan', 2, '2022-04-26 20:18:32'),
(273, 'Data Member', 1, 'Menambah data baru dengan isi profile = Adi Muad, jenis_membership = Level 2, approver = Super Admin, tanggal_anggota = 2022-04-01, status = Tidak Diketahui', 'Belum ada data', 1, '2022-04-26 20:18:55'),
(274, 'Data Member', 1, 'Menambah data baru dengan isi profile = Adi Muad, jenis_membership = Level 2, profile_atasan = , status = Aktif', 'Belum ada data', 1, '2022-04-26 20:18:55'),
(275, 'Data Member', NULL, 'Mengubah setiap data sebelumnya menjadi status = Tidak Aktif', 'Isi data sebelumnya adalah {\"profile\":\"Adi Muad\",\"jenis_membership\":\"Level 3\",\"nama_atasan\":\"\",\"status_str\":\"Aktif\"}', 2, '2022-04-26 20:19:07'),
(276, 'Data Member', NULL, 'Mengubah setiap data sebelumnya menjadi status = Tidak Aktif', 'Isi data sebelumnya adalah {\"profile\":\"Adi Muad\",\"nama_atasan\":\"\",\"jenis_membership\":\"Level 3\",\"tanggal_anggota\":\"2022-04-01\",\"status_str\":\"Disetujui\"}', 2, '2022-04-26 20:19:07'),
(277, 'Data Member', NULL, 'Mengubah isi data membership dengan profile = Adi Muad sebelumnya menjadi status = Disetujui', 'Isi data sebelumnya adalah membership dengan profile = Adi Muad, status = Meminta Persetujuan', 2, '2022-04-26 20:19:07'),
(278, 'Data Member', 1, 'Menambah data baru dengan isi profile = Adi Muad keanggotaan = 2, tanggal = 2022-04-26, status = Aktif', 'Belum ada data', 1, '2022-04-26 20:20:39'),
(279, 'Data Member', 1, 'Menambah data baru dengan isi id = 125, level = Reader, nik = 080401-202204-0008, partner = Keluarga Muad, user_nama = Istri, user_email = istri.muad@mailinator.com, user_email_status = 0, user_phone = 0, user_status = Aktif', 'Belum ada data', 1, '2022-04-26 20:27:34'),
(280, 'Data Member', 1, 'Mengubah isi data sebelumnya menjadi id = 52, nama_depan = Istri, nama_belakang = Muad, jenis_kelamin = 2, status = Aktif, photo = ', 'Isi data sebelumnya adalah id = 52, nama_depan = , nama_belakang = , jenis_kelamin = Tidak Diketahui, status = Aktif, photo = ', 2, '2022-04-26 20:27:34'),
(281, 'Institusi', 1, 'Mengubah isi data sebelumnya menjadi nama = UPI, keterangan = Upi, status = Tidak Aktif', 'Isi data sebelumnya adalah nama = UPI, keterangan = Upi, status = Aktif', 2, '2022-04-26 20:31:10'),
(282, 'Data Member', 1, 'Menambah data baru dengan isi profile = Adi Muad, peristiwa_formal = Pernikahan, keterangan = Menikah dibulan agustus, tempat = Jakarta, tanggal_data_formal = 2022-08-19, status = Tidak Aktif', 'Belum ada data', 1, '2022-04-26 20:33:21'),
(283, 'Data Member', 1, 'Menambah data baru dengan isi id = 126, level = Reader, nik = 030401-202204-0009, partner = Keluarga Muad, user_nama = , user_email = , user_email_status = 0, user_phone = 0, user_status = Aktif', 'Belum ada data', 1, '2022-04-27 00:58:11'),
(284, 'Data Member', 1, 'Mengubah isi data sebelumnya menjadi id = 52, nama_depan = , nama_belakang = asdasdasdsa, jenis_kelamin = 1, status = Aktif, photo = ', 'Isi data sebelumnya adalah id = 52, nama_depan = , nama_belakang = , jenis_kelamin = Tidak Diketahui, status = Aktif, photo = ', 2, '2022-04-27 00:58:11'),
(285, 'Peristiwa Formal', 1, 'Menambah data baru dengan isi name = asdasd, kategori = 1, details = asdasd, status = Aktif', 'Belum ada data', 1, '2022-04-27 02:12:26'),
(286, 'Menu', 1, 'Mengubah isi data sebelumnya menjadi parent = Utilities, menu_nama = Institusi, menu_index = 3, menu_icon = far fa-circle, menu_url = data-master/institusi, menu_keterangan = -, menu_status = Aktif', 'Isi data sebelumnya adalah parent = Master, menu_nama = Institusi, menu_index = 3, menu_icon = far fa-circle, menu_url = data-master/institusi, menu_keterangan = -, menu_status = Aktif', 2, '2022-04-27 03:02:50'),
(287, 'Data Member', 1, 'Menambah data baru dengan isi profile = Adi Muad, peristiwa_formal = Pernikahan, keterangan = Pernikahan Agustus, tempat = Cikarang, tanggal_data_formal = 2022-08-01, status = Tidak Aktif', 'Belum ada data', 1, '2022-05-09 10:23:23'),
(288, 'Data Member', 1, 'Menambah data baru dengan isi profile = Adi Muad, peristiwa_formal = Tanggal Join, keterangan = testing tanggal join, tempat = Surabaya, tanggal_data_formal = 2022-05-29, status = Tidak Aktif', 'Belum ada data', 1, '2022-05-09 13:01:49'),
(289, 'Menu', 1, 'Menambah data baru dengan isi parent =  , menu_nama = Laporan, menu_index = 9, menu_icon = fas fa-book, menu_url = #, menu_keterangan = -, menu_status = Aktif', 'Belum ada data', 1, '2022-05-09 15:46:36'),
(290, '', 1, 'Menambah data baru dengan isi menu = Laporan, level = Super Admin', 'Belum ada data', 1, '2022-05-09 15:46:56'),
(291, 'Menu', 1, 'Menambah data baru dengan isi parent = Laporan, menu_nama = Data Member, menu_index = 1, menu_icon = far fa-circle, menu_url = laporan/member, menu_keterangan = -, menu_status = Aktif', 'Belum ada data', 1, '2022-05-09 15:47:33'),
(292, '', 1, 'Menambah data baru dengan isi menu = Data Member, level = Super Admin', 'Belum ada data', 1, '2022-05-09 15:47:38'),
(293, 'Menu', 1, 'Mengubah isi data sebelumnya menjadi parent = Laporan, menu_nama = Data Member , menu_index = 1, menu_icon = far fa-circle, menu_url = laporan/member, menu_keterangan = -, menu_status = Aktif', 'Isi data sebelumnya adalah parent = Laporan, menu_nama = Data Member, menu_index = 1, menu_icon = far fa-circle, menu_url = laporan/member, menu_keterangan = -, menu_status = Aktif', 2, '2022-05-09 15:53:22'),
(294, 'Kategori Keanggotaan', 1, 'Menghapus data lama', 'Isi data sebelumnya adalah nama = eeerrrr, keterangan = errrr, no urut = 53, status = Aktif', 3, '2022-05-11 04:32:55'),
(295, 'Wilayah', 1, 'Mengubah isi data sebelumnya menjadi nama = Jakarta, status = Aktif', 'Isi data sebelumnya adalah nama = Jakarta, status = Aktif', 2, '2022-05-11 04:52:41'),
(296, 'Wilayah', 1, 'Mengubah isi data sebelumnya menjadi nama = Bogor, status = Aktif', 'Isi data sebelumnya adalah nama = Bogor, status = Aktif', 2, '2022-05-11 04:52:46'),
(297, 'Peristiwa Formal', 1, 'Menghapus data lama', 'Isi data sebelumnya adalah name = asdasd, kategori = 1, details = asdasd, status = Aktif', 3, '2022-05-11 05:44:30'),
(298, 'Data Member', 1, 'Menambah data baru dengan isi profile =  asdasdasdsa keanggotaan = 2, tanggal = 2022-05-11, status = Aktif', 'Belum ada data', 1, '2022-05-11 17:37:15'),
(299, 'Data Member', 1, 'Menambah data baru dengan isi profile =  asdasdasdsa keanggotaan = 4, tanggal = 2022-05-11, status = Aktif', 'Belum ada data', 1, '2022-05-11 17:42:59'),
(300, 'Term Management', 1, 'Mengubah isi data sebelumnya menjadi menu = Kategori Keanggotaan, nama = Keanggotaan, keterangan = -, status = Aktif', 'Isi data sebelumnya adalah menu = Kategori Keanggotaan, nama = Kategori Keanggotaan, -, status = Aktif', 2, '2022-05-11 17:47:18'),
(301, 'Term Management', 1, 'Mengubah isi data sebelumnya menjadi menu = Kategori Keanggotaan, nama = Kategori Keanggotaan, keterangan = -, status = Aktif', 'Isi data sebelumnya adalah menu = Kategori Keanggotaan, nama = Keanggotaan, -, status = Aktif', 2, '2022-05-11 17:50:11'),
(302, 'Term Management', 1, 'Mengubah isi data sebelumnya menjadi menu = Kategori Keanggotaan, nama = Keanggotaan, keterangan = -, status = Aktif', 'Isi data sebelumnya adalah menu = Kategori Keanggotaan, nama = Kategori Keanggotaan, -, status = Aktif', 2, '2022-05-11 17:50:30'),
(303, 'Term Management', 1, 'Mengubah isi data sebelumnya menjadi menu = Kategorial Umur, nama = Kategorial, keterangan = -, status = Aktif', 'Isi data sebelumnya adalah menu = Kategorial Umur, nama = Kategorial Umur, -, status = Aktif', 2, '2022-05-11 17:52:05'),
(304, 'Term Management', 1, 'Mengubah isi data sebelumnya menjadi menu = Kategorial Umur, nama = Kategorial Usia, keterangan = -, status = Aktif', 'Isi data sebelumnya adalah menu = Kategorial Umur, nama = Kategorial, -, status = Aktif', 2, '2022-05-11 17:54:14'),
(305, 'Term Management', 1, 'Mengubah isi data sebelumnya menjadi menu = Wilayah, nama = Wilayah CmMS, keterangan = -, status = Aktif', 'Isi data sebelumnya adalah menu = Wilayah, nama = Wilayah, -, status = Aktif', 2, '2022-05-11 18:26:16'),
(306, 'Data Member', 1, 'Menambah data baru dengan isi profile = Dani Rismawan keanggotaan = 1, tanggal = 2022-05-11, status = Aktif', 'Belum ada data', 1, '2022-05-11 18:59:08'),
(307, 'Data Member', 1, 'Menambah data baru dengan isi profile =  asdasdasdsa keanggotaan = 1, tanggal = 2022-05-11, status = Aktif', 'Belum ada data', 1, '2022-05-11 19:04:29'),
(308, 'Data Member', 1, 'Menambah data baru dengan isi profile = Adi Muad keanggotaan = 2, tanggal = 2022-05-11, status = Aktif', 'Belum ada data', 1, '2022-05-11 19:05:21'),
(309, 'Data Member', 1, 'Menambah data baru dengan isi profile = CmMS Pa Anton keanggotaan = 4, tanggal = 2022-05-11, status = Aktif', 'Belum ada data', 1, '2022-05-11 19:08:51'),
(310, 'Data Member', 1, 'Menambah data baru dengan isi profile = Abik Hendrik keanggotaan = 2, tanggal = 2022-05-11, status = Aktif', 'Belum ada data', 1, '2022-05-11 19:10:02'),
(311, 'Data Member', 1, 'Menambah data baru dengan isi profile = Nurul Afanti keanggotaan = 2, tanggal = 2022-05-11, status = Aktif', 'Belum ada data', 1, '2022-05-11 19:21:55'),
(312, 'Data Member', 1, 'Menambah data baru dengan isi profile = Agnia Hendrik keanggotaan = 1, tanggal = 2022-05-11, status = Aktif', 'Belum ada data', 1, '2022-05-11 19:22:43'),
(313, 'Data Member', 1, 'Menambah data baru dengan isi profile = biba Hendrik keanggotaan = 1, tanggal = 2022-05-11, status = Aktif', 'Belum ada data', 1, '2022-05-11 19:23:27'),
(314, 'Data Member', 1, 'Menambah data baru dengan isi profile = CmMS Bu R.A Kartini keanggotaan = 1, tanggal = 2022-05-11, status = Aktif', 'Belum ada data', 1, '2022-05-11 19:24:09'),
(315, 'Data Member', 1, 'Menambah data baru dengan isi profile = Istri Muad keanggotaan = 1, tanggal = 2022-05-11, status = Aktif', 'Belum ada data', 1, '2022-05-11 19:24:48'),
(316, 'Data Member', 1, 'Menambah data baru dengan isi profile = Soni Setiawan keanggotaan = 1, tanggal = 2022-05-11, status = Aktif', 'Belum ada data', 1, '2022-05-11 19:25:35'),
(317, 'Term Management', 1, 'Mengubah isi data sebelumnya menjadi menu = Kategorial Umur, nama = Kategorial Umur, keterangan = -, status = Aktif', 'Isi data sebelumnya adalah menu = Kategorial Umur, nama = Kategorial Usia, -, status = Aktif', 2, '2022-05-11 20:31:08'),
(318, 'Data Member', 1, 'Menambah data baru dengan isi profile =  asdasdasdsa wilayah = Bandung, tanggal = 2022-05-01, status = Aktif', 'Belum ada data', 1, '2022-05-12 04:34:56'),
(319, 'Data Member', 1, 'Menambah data baru dengan isi profile =  asdasdasdsa wilayah = Jakarta, tanggal = 2022-05-10, status = Aktif', 'Belum ada data', 1, '2022-05-12 04:36:32'),
(320, 'Data Member', 1, 'Menambah data baru dengan isi profile =  asdasdasdsa wilayah = Bogor, tanggal = 2022-05-03, status = Aktif', 'Belum ada data', 1, '2022-05-12 04:36:58'),
(321, 'Data Member', 1, 'Mengubah isi data sebelumnya menjadi profile =  asdasdasdsa, wilayah = Bogor, status = Aktif', 'Isi data sebelumnya adalah profile =  asdasdasdsa, wilayah = Jakarta, status = Aktif', 2, '2022-05-12 04:37:54'),
(322, 'Data Member', 1, 'Mengubah isi data sebelumnya menjadi profile =  asdasdasdsa, wilayah = Jakarta, status = Aktif', 'Isi data sebelumnya adalah profile =  asdasdasdsa, wilayah = Bogor, status = Tidak Diketahui', 2, '2022-05-12 04:38:08'),
(323, 'Data Member', 1, 'Mengubah isi data sebelumnya menjadi profile =  asdasdasdsa, wilayah = Jakarta, status = Aktif', 'Isi data sebelumnya adalah profile =  asdasdasdsa, wilayah = Jakarta, status = Aktif', 2, '2022-05-12 04:39:13'),
(324, 'Data Member', 1, 'Mengubah isi data sebelumnya menjadi profile =  asdasdasdsa, wilayah = Jakarta, status = Aktif', 'Isi data sebelumnya adalah profile =  asdasdasdsa, wilayah = Jakarta, status = Tidak Diketahui', 2, '2022-05-12 04:43:18'),
(325, 'Data Member', 1, 'Mengubah isi data sebelumnya menjadi profile =  asdasdasdsa, wilayah = Bogor, status = Aktif', 'Isi data sebelumnya adalah profile =  asdasdasdsa, wilayah = Bogor, status = Aktif', 2, '2022-05-12 04:43:46'),
(326, 'Data Member', 1, 'Menambah data baru dengan isi profile =  asdasdasdsa tipe_kontak = Whatsapp, keterangan = 08211258, status = Aktif', 'Belum ada data', 1, '2022-05-12 04:48:39'),
(327, 'Data Member', 1, 'Menambah data baru dengan isi profile =  asdasdasdsa tipe_kontak = Handphone, keterangan = 02232121, status = Aktif', 'Belum ada data', 1, '2022-05-12 04:50:10'),
(328, 'Data Member', 1, 'Menambah data baru dengan isi profile =  asdasdasdsa tipe_kontak = Handphone, keterangan = , status = Aktif', 'Belum ada data', 1, '2022-05-12 04:51:04'),
(329, 'Data Member', 1, 'Mengubah isi data sebelumnya menjadi tipe_contact = Handphone, keterangan = 3123123, status = Aktif', 'Isi data sebelumnya adalah tipe_kontak = Handphone, keterangan = , status = Aktif', 2, '2022-05-12 04:52:06'),
(330, 'Data Member', 1, 'Mengubah isi data sebelumnya menjadi tipe_contact = Handphone, keterangan = 3123123, status = Aktif', 'Isi data sebelumnya adalah tipe_kontak = Handphone, keterangan = 3123123, status = Aktif', 2, '2022-05-12 04:52:15'),
(331, 'Data Member', 1, 'Mengubah isi data sebelumnya menjadi tipe_contact = Handphone, keterangan = 3123123, status = Tidak Diketahui', 'Isi data sebelumnya adalah tipe_kontak = Handphone, keterangan = 3123123, status = Aktif', 2, '2022-05-12 04:54:19'),
(332, 'Data Member', 1, 'Mengubah isi data sebelumnya menjadi tipe_contact = Handphone, keterangan = 02232121, status = Tidak Diketahui', 'Isi data sebelumnya adalah tipe_kontak = Handphone, keterangan = 02232121, status = Aktif', 2, '2022-05-12 04:54:55'),
(333, 'Data Member', 1, 'Menambah data baru dengan isi profile =  asdasdasdsa tipe_kontak = Handphone, keterangan = 0899895523, status = Aktif', 'Belum ada data', 1, '2022-05-12 04:55:10'),
(334, 'Data Member', 1, 'Menambah data baru dengan isi profile =  asdasdasdsa kategorial = Anak-anak, tanggal = 2010-05-12, status = Aktif', 'Belum ada data', 1, '2022-05-12 05:36:58'),
(335, 'Data Member', 1, 'Menambah data baru dengan isi profile =  asdasdasdsa kategorial = Muda, tanggal = 2018-05-12, status = Aktif', 'Belum ada data', 1, '2022-05-12 05:37:34'),
(336, 'Data Member', 1, 'Menambah data baru dengan isi profile =  asdasdasdsa kategorial = Tua, tanggal = 2022-05-12, status = Aktif', 'Belum ada data', 1, '2022-05-12 06:06:00'),
(337, '', 1, 'Menghapus data lama', 'Isi data sebelumnya adalah \"\"', 3, '2022-05-12 06:08:26'),
(338, 'Data Member', 1, 'Menambah data baru dengan isi profile =  asdasdasdsa kategorial = Tua, tanggal = 2022-05-12, status = Aktif', 'Belum ada data', 1, '2022-05-12 06:08:42'),
(339, 'Data Member', 1, 'Menambah data baru dengan isi profile =  asdasdasdsa kategorial = Tua, tanggal = 2022-05-12, status = Aktif', 'Belum ada data', 1, '2022-05-12 06:10:02'),
(340, 'Data Member', 1, 'Menambah data baru dengan isi profile =  asdasdasdsa kategorial = Tua, tanggal = 2022-05-12, status = Aktif', 'Belum ada data', 1, '2022-05-12 06:11:46'),
(341, 'Data Member', 1, 'Mengubah isi data sebelumnya menjadi profile =  asdasdasdsa, kategorial = Tua, status = Aktif', 'Isi data sebelumnya adalah tipe_kontak =  asdasdasdsa, kategorial = Tua, status = Aktif', 2, '2022-05-12 06:12:41'),
(342, 'Term Management', 1, 'Mengubah isi data sebelumnya menjadi menu = Jabatan, nama = Jabatan2, keterangan = -, status = Aktif', 'Isi data sebelumnya adalah menu = Jabatan, nama = Jabatan, -, status = Aktif', 2, '2022-05-13 05:40:29'),
(343, 'Version', 1, 'Mengubah isi data sebelumnya menjadi nama = V1.1, status = Tidak Aktif', 'Isi data sebelumnya adalah nama = v.0.0.2, status = Tidak Aktif', 2, '2022-05-13 08:25:31'),
(344, 'Version', 1, 'Mengubah isi data sebelumnya menjadi nama = V1.2, status = Tidak Aktif', 'Isi data sebelumnya adalah nama = v.0.0.3, status = Tidak Aktif', 2, '2022-05-13 08:26:39'),
(345, 'Version', 1, 'Mengubah isi data sebelumnya menjadi nama = V2.0, status = Tidak Aktif', 'Isi data sebelumnya adalah nama = v.0.0.4, status = Tidak Aktif', 2, '2022-05-13 08:26:54'),
(346, 'Version', 1, 'Mengubah isi data sebelumnya menjadi nama = V2.1, status = Aktif', 'Isi data sebelumnya adalah nama = v.0.0.5, status = Aktif', 2, '2022-05-13 08:27:10'),
(347, 'Keluarga', 1, 'Menambah data baru dengan isi nama = Keluarga Aruan, lokasi = , no_telepon = , email = , status = Aktif', 'Belum ada data', 1, '2022-05-14 18:59:13'),
(348, 'Keluarga', 1, 'Menambah data baru dengan isi nama = Keluarga Wungka, lokasi = , no_telepon = , email = , status = Aktif', 'Belum ada data', 1, '2022-05-14 18:59:30'),
(349, 'Wilayah', 1, 'Menambah data baru dengan isi nama = Wilayah 5, status = Aktif', 'Belum ada data', 1, '2022-05-14 19:41:05'),
(350, 'Wilayah', 1, 'Menambah data baru dengan isi nama = Wilayah Timur, status = Aktif', 'Belum ada data', 1, '2022-05-14 19:41:12'),
(351, 'Kategorial Umur', 1, 'Menambah data baru dengan isi nama = KKM, status = Aktif', 'Belum ada data', 1, '2022-05-14 19:41:23'),
(352, 'Kategorial Umur', 1, 'Menambah data baru dengan isi nama = KKD, status = Aktif', 'Belum ada data', 1, '2022-05-14 19:41:27'),
(353, 'Data Member', 1, 'Menambah data baru dengan isi id = 127, level = Reader, nik = 030401-197809-0001, partner = Keluarga Aruan, user_nama = , user_email = , user_email_status = 0, user_phone = 0, user_status = Aktif', 'Belum ada data', 1, '2022-05-14 19:47:23'),
(354, 'Data Member', 1, 'Mengubah isi data sebelumnya menjadi id = 52, nama_depan = , nama_belakang = Zainudin, jenis_kelamin = 1, status = Aktif, photo = ', 'Isi data sebelumnya adalah id = 52, nama_depan = , nama_belakang = , jenis_kelamin = Tidak Diketahui, status = Aktif, photo = ', 2, '2022-05-14 19:47:23'),
(355, 'Data Member', 1, 'Menambah data baru dengan isi profile =  Zainudin, jenis_alamat = Domisili, alamat = Kav. POLRI Blok F No. 1414 , domisili = Kav. POLRI Blok F No. 1414 , tanggal_mulai = 2022-05-01, tanggal_selesai = , status = Aktif', 'Belum ada data', 1, '2022-05-14 19:48:19'),
(356, 'Data Member', 1, 'Menambah data baru dengan isi profile =  Zainudin wilayah = Wilayah 5, tanggal = 2022-05-01, status = Aktif', 'Belum ada data', 1, '2022-05-14 19:49:00'),
(357, 'Data Member', 1, 'Menambah data baru dengan isi profile =  Zainudin kategorial = KKM, tanggal = 2022-05-14, status = Aktif', 'Belum ada data', 1, '2022-05-14 19:49:09'),
(358, 'Data Member', 1, 'Menambah data baru dengan isi profile =  Zainudin tipe_kontak = Telepon Rumah, keterangan = 5658633, status = Aktif', 'Belum ada data', 1, '2022-05-14 19:49:43'),
(359, 'Data Member', 1, 'Menambah data baru dengan isi profile =  Zainudin tipe_kontak = Handphone, keterangan = 6282828383, status = Aktif', 'Belum ada data', 1, '2022-05-14 19:49:56'),
(360, 'Tipe Kontak', 1, 'Mengubah isi data sebelumnya menjadi nama = Email, keterangan = -, status = Aktif', 'Isi data sebelumnya adalah nama = Whatsapp, keterangan = -, status = Aktif', 2, '2022-05-14 19:50:26'),
(361, 'Data Member', 1, 'Menambah data baru dengan isi profile =  Zainudin tipe_kontak = Email, keterangan = zai@mailinator.com, status = Aktif', 'Belum ada data', 1, '2022-05-14 19:50:28'),
(362, 'Data Member', 1, 'Menambah data baru dengan isi profile =  Zainudin, peristiwa_formal = Tanggal Lahir, keterangan = -, tempat = Bandung, tanggal_data_formal = 1978-09-16, status = Tidak Aktif', 'Belum ada data', 1, '2022-05-14 19:51:20'),
(363, 'Data Member', 1, 'Menambah data baru dengan isi profile =  Zainudin, peristiwa_formal = Tanggal Join, keterangan = -, tempat = Bandung, tanggal_data_formal = 1978-09-16, status = Tidak Aktif', 'Belum ada data', 1, '2022-05-14 19:52:31'),
(364, 'Data Member', 1, 'Menambah data baru dengan isi id = 128, level = Reader, nik = 030401-197809-0010, partner = Keluarga Aruan, user_nama =  , user_email = , user_email_status = 0, user_phone = 0, user_status = Aktif', 'Belum ada data', 1, '2022-05-14 19:55:29'),
(365, 'Data Member', 1, 'Mengubah isi data sebelumnya menjadi id = 52, nama_depan =  , nama_belakang = Magda, jenis_kelamin = 1, status = Aktif, photo = ', 'Isi data sebelumnya adalah id = 52, nama_depan = , nama_belakang = , jenis_kelamin = Tidak Diketahui, status = Aktif, photo = ', 2, '2022-05-14 19:55:29'),
(366, 'Data Member', 1, 'Mengubah isi data sebelumnya menjadi id = 128, level = Reader, nik = 030401-197809-0011, partner = Keluarga Aruan, user_nama =  , user_email = , user_email_status = 0, user_phone = 0, user_status = Aktif', 'Isi data sebelumnya adalah id = 128, level = Reader, nik = 030401-197809-0010, id_partner = 33, user_nama =  , user_email = , user_email_status = , user_phone = 0, user_status = Aktif', 2, '2022-05-14 19:56:04'),
(367, 'Data Member', 1, 'Mengubah isi data sebelumnya menjadi id = 52, nama_depan =  , nama_belakang = Magda, jenis_kelamin = 1, status = Aktif, photo = ', 'Isi data sebelumnya adalah id = 52, nama_depan = , nama_belakang = , jenis_kelamin = Tidak Diketahui, status = Aktif, photo = ', 2, '2022-05-14 19:56:04'),
(368, 'Data Member', 1, 'Menambah data baru dengan isi id = 129, level = Reader, nik = 030401-197802-0001, partner = Keluarga Aruan, user_nama =   , user_email = , user_email_status = 0, user_phone = 0, user_status = Aktif', 'Belum ada data', 1, '2022-05-15 05:40:55'),
(369, 'Data Member', 1, 'Mengubah isi data sebelumnya menjadi id = 52, nama_depan =   , nama_belakang = Zainudin, jenis_kelamin = 1, status = Aktif, photo = ', 'Isi data sebelumnya adalah id = 52, nama_depan = , nama_belakang = , jenis_kelamin = Tidak Diketahui, status = Aktif, photo = ', 2, '2022-05-15 05:40:55'),
(370, 'Data Member', 1, 'Menambah data baru dengan isi id = 130, level = Reader, nik = 030401-202205-0001, partner = Keluarga Aruan, user_nama = , user_email = , user_email_status = 0, user_phone = 0, user_status = Aktif', 'Belum ada data', 1, '2022-05-15 05:44:59'),
(371, 'Data Member', 1, 'Mengubah isi data sebelumnya menjadi id = 52, nama_depan = , nama_belakang = sadasd, jenis_kelamin = 1, status = Aktif, photo = ', 'Isi data sebelumnya adalah id = 52, nama_depan = , nama_belakang = , jenis_kelamin = Tidak Diketahui, status = Aktif, photo = ', 2, '2022-05-15 05:44:59'),
(372, 'Data Member', 1, 'Menambah data baru dengan isi profile =   Magda, jenis_alamat = Domisili, alamat = -, domisili = Kav. POLRI Blok F No. 1414 , tanggal_mulai = 2022-05-01, tanggal_selesai = , status = Aktif', 'Belum ada data', 1, '2022-05-15 05:53:13'),
(373, 'Data Member', 1, 'Menambah data baru dengan isi profile =   Magda wilayah = Wilayah 5, tanggal = 2022-05-01, status = Aktif', 'Belum ada data', 1, '2022-05-15 05:53:49'),
(374, 'Data Member', 1, 'Menambah data baru dengan isi profile =   Magda kategorial = KKM, tanggal = 2022-05-15, status = Aktif', 'Belum ada data', 1, '2022-05-15 05:53:59'),
(375, 'Data Member', 1, 'Menambah data baru dengan isi profile =   Magda tipe_kontak = Handphone, keterangan = 6282828383, status = Aktif', 'Belum ada data', 1, '2022-05-15 05:54:34'),
(376, 'Data Member', 1, 'Menambah data baru dengan isi profile =   Magda tipe_kontak = Email, keterangan = magda@mailinator.com, status = Aktif', 'Belum ada data', 1, '2022-05-15 05:54:56'),
(377, 'Data Member', 1, 'Menambah data baru dengan isi profile =   Magda, peristiwa_formal = Tanggal Lahir, keterangan = -, tempat = Bandung, tanggal_data_formal = 1950-03-01, status = Tidak Aktif', 'Belum ada data', 1, '2022-05-15 05:55:48'),
(378, 'Data Member', 1, 'Menambah data baru dengan isi profile =   Magda, peristiwa_formal = Tanggal Join, keterangan = -, tempat = Bandung, tanggal_data_formal = 1963-12-15, status = Tidak Aktif', 'Belum ada data', 1, '2022-05-15 05:57:09'),
(379, 'Data Member', 1, 'Menambah data baru dengan isi id = 131, level = Reader, nik = 030401-198809-0001, partner = Keluarga Wungka, user_nama =  , user_email = , user_email_status = 0, user_phone = 0, user_status = Aktif', 'Belum ada data', 1, '2022-05-15 06:05:38'),
(380, 'Data Member', 1, 'Mengubah isi data sebelumnya menjadi id = 52, nama_depan =  , nama_belakang = Roi, jenis_kelamin = 1, status = Aktif, photo = ', 'Isi data sebelumnya adalah id = 52, nama_depan = , nama_belakang = , jenis_kelamin = Tidak Diketahui, status = Aktif, photo = ', 2, '2022-05-15 06:05:38'),
(381, 'Data Member', 1, 'Menambah data baru dengan isi profile =   Roi, jenis_alamat = Domisili, alamat =  , domisili = 10 Flora Rd, tanggal_mulai = 2022-05-01, tanggal_selesai = , status = Aktif', 'Belum ada data', 1, '2022-05-15 06:06:36'),
(382, 'Data Member', 1, 'Menambah data baru dengan isi profile =   Roi wilayah = Wilayah Timur, tanggal = , status = Aktif', 'Belum ada data', 1, '2022-05-15 06:06:49'),
(383, 'Data Member', 1, 'Mengubah isi data sebelumnya menjadi profile =   Roi, wilayah = Wilayah Timur, status = Aktif', 'Isi data sebelumnya adalah profile =   Roi, wilayah = Wilayah Timur, status = Aktif', 2, '2022-05-15 06:06:54'),
(384, 'Data Member', 1, 'Menambah data baru dengan isi profile =   Roi kategorial = KKD, tanggal = 2022-05-15, status = Aktif', 'Belum ada data', 1, '2022-05-15 06:07:02'),
(385, 'Data Member', 1, 'Menambah data baru dengan isi profile =   Roi tipe_kontak = Telepon Rumah, keterangan = 62454340, status = Aktif', 'Belum ada data', 1, '2022-05-15 06:07:16'),
(386, 'Data Member', 1, 'Menambah data baru dengan isi profile =   Roi tipe_kontak = Handphone, keterangan = 85188779, status = Aktif', 'Belum ada data', 1, '2022-05-15 06:07:37'),
(387, 'Data Member', 1, 'Menambah data baru dengan isi profile =   Roi tipe_kontak = Email, keterangan = roi@mailinator.com, status = Aktif', 'Belum ada data', 1, '2022-05-15 06:07:56'),
(388, 'Data Member', 1, 'Menambah data baru dengan isi profile =   Roi, peristiwa_formal = Tanggal Lahir, keterangan = -, tempat = Bandung, tanggal_data_formal = 1966-09-16, status = Tidak Aktif', 'Belum ada data', 1, '2022-05-15 06:08:34'),
(389, 'Data Member', 1, 'Menambah data baru dengan isi profile =   Roi, peristiwa_formal = Tanggal Join, keterangan = -, tempat = Bandung, tanggal_data_formal = 1988-09-19, status = Tidak Aktif', 'Belum ada data', 1, '2022-05-15 06:08:58'),
(390, 'Data Member', 1, 'Menambah data baru dengan isi id = 132, level = Reader, nik = 030401-198809-0012, partner = Keluarga Wungka, user_nama =  , user_email = , user_email_status = 0, user_phone = 0, user_status = Aktif', 'Belum ada data', 1, '2022-05-15 06:10:27'),
(391, 'Data Member', 1, 'Mengubah isi data sebelumnya menjadi id = 52, nama_depan =  , nama_belakang = Yulia, jenis_kelamin = 2, status = Aktif, photo = ', 'Isi data sebelumnya adalah id = 52, nama_depan = , nama_belakang = , jenis_kelamin = Tidak Diketahui, status = Aktif, photo = ', 2, '2022-05-15 06:10:27'),
(392, 'Data Member', 1, 'Menambah data baru dengan isi profile =   Yulia, jenis_alamat = Domisili, alamat = -, domisili = 10 Flora Rd., tanggal_mulai = 2022-05-02, tanggal_selesai = , status = Aktif', 'Belum ada data', 1, '2022-05-15 06:11:06'),
(393, 'Data Member', 1, 'Menambah data baru dengan isi profile =   Yulia wilayah = Wilayah Timur, tanggal = 2022-05-15, status = Aktif', 'Belum ada data', 1, '2022-05-15 06:11:15'),
(394, 'Data Member', 1, 'Menambah data baru dengan isi profile =   Yulia kategorial = KKD, tanggal = 2022-05-15, status = Aktif', 'Belum ada data', 1, '2022-05-15 06:11:23'),
(395, 'Data Member', 1, 'Menambah data baru dengan isi profile =   Yulia tipe_kontak = Telepon Rumah, keterangan = 62454340, status = Aktif', 'Belum ada data', 1, '2022-05-15 06:11:37'),
(396, 'Data Member', 1, 'Menambah data baru dengan isi profile =   Yulia tipe_kontak = Handphone, keterangan = 85188780, status = Aktif', 'Belum ada data', 1, '2022-05-15 06:11:49'),
(397, 'Data Member', 1, 'Menambah data baru dengan isi profile =   Yulia tipe_kontak = Email, keterangan = yuli@mailinator.com, status = Aktif', 'Belum ada data', 1, '2022-05-15 06:12:01'),
(398, 'Data Member', 1, 'Menambah data baru dengan isi profile =   Yulia, peristiwa_formal = Tanggal Lahir, keterangan = -, tempat = Bandung, tanggal_data_formal = 1967-03-01, status = Tidak Aktif', 'Belum ada data', 1, '2022-05-15 06:12:29'),
(399, 'Data Member', 1, 'Menambah data baru dengan isi profile =   Yulia, peristiwa_formal = Tanggal Join, keterangan = -, tempat = Bandung, tanggal_data_formal = 1983-12-15, status = Tidak Aktif', 'Belum ada data', 1, '2022-05-15 06:19:33'),
(400, 'Data Member', 1, 'Mengubah isi data sebelumnya menjadi id = 127, level = Reader, nik = 030401-197809-0013, partner = Keluarga Aruan, user_nama = , user_email = , user_email_status = 0, user_phone = 0, user_status = Aktif', 'Isi data sebelumnya adalah id = 127, level = Reader, nik = 030401-197809-0001, id_partner = 33, user_nama = , user_email = , user_email_status = , user_phone = 0, user_status = Aktif', 2, '2022-05-15 06:48:00'),
(401, 'Data Member', 1, 'Mengubah isi data sebelumnya menjadi id = 52, nama_depan = , nama_belakang = Zainudin, jenis_kelamin = 1, status = Aktif, photo = ', 'Isi data sebelumnya adalah id = 52, nama_depan = , nama_belakang = , jenis_kelamin = Tidak Diketahui, status = Aktif, photo = ', 2, '2022-05-15 06:48:00'),
(402, 'Data Member', 1, 'Mengubah isi data sebelumnya menjadi id = 128, level = Reader, nik = 030401-197809-0013, partner = Keluarga Aruan, user_nama =  , user_email = , user_email_status = 0, user_phone = 0, user_status = Aktif', 'Isi data sebelumnya adalah id = 128, level = Reader, nik = 030401-197809-0011, id_partner = 33, user_nama =  , user_email = , user_email_status = 0, user_phone = 0, user_status = Aktif', 2, '2022-05-15 06:48:05'),
(403, 'Data Member', 1, 'Mengubah isi data sebelumnya menjadi id = 52, nama_depan =  , nama_belakang = Magda, jenis_kelamin = 1, status = Aktif, photo = ', 'Isi data sebelumnya adalah id = 52, nama_depan = , nama_belakang = , jenis_kelamin = Tidak Diketahui, status = Aktif, photo = ', 2, '2022-05-15 06:48:05'),
(404, 'Data Member', 1, 'Mengubah isi data sebelumnya menjadi id = 131, level = Reader, nik = 030401-198809-0013, partner = Keluarga Wungka, user_nama =  , user_email = , user_email_status = 0, user_phone = 0, user_status = Aktif', 'Isi data sebelumnya adalah id = 131, level = Reader, nik = 030401-198809-0001, id_partner = 34, user_nama =  , user_email = , user_email_status = , user_phone = 0, user_status = Aktif', 2, '2022-05-15 06:48:15'),
(405, 'Data Member', 1, 'Mengubah isi data sebelumnya menjadi id = 52, nama_depan =  , nama_belakang = Roi, jenis_kelamin = 1, status = Aktif, photo = ', 'Isi data sebelumnya adalah id = 52, nama_depan = , nama_belakang = , jenis_kelamin = Tidak Diketahui, status = Aktif, photo = ', 2, '2022-05-15 06:48:15'),
(406, 'Data Member', 1, 'Mengubah isi data sebelumnya menjadi id = 132, level = Reader, nik = 030401-198809-0013, partner = Keluarga Wungka, user_nama =  , user_email = , user_email_status = 0, user_phone = 0, user_status = Aktif', 'Isi data sebelumnya adalah id = 132, level = Reader, nik = 030401-198809-0012, id_partner = 34, user_nama =  , user_email = , user_email_status = , user_phone = 0, user_status = Aktif', 2, '2022-05-15 06:48:24'),
(407, 'Data Member', 1, 'Mengubah isi data sebelumnya menjadi id = 52, nama_depan =  , nama_belakang = Yulia, jenis_kelamin = 2, status = Aktif, photo = ', 'Isi data sebelumnya adalah id = 52, nama_depan = , nama_belakang = , jenis_kelamin = Tidak Diketahui, status = Aktif, photo = ', 2, '2022-05-15 06:48:24'),
(408, 'Data Member', 1, 'Menambah data baru dengan isi profile =  Zainudin, peristiwa_formal = Pernikahan, keterangan = pernikahan, tempat = bandung, tanggal_data_formal = 1978-09-16, status = Tidak Aktif', 'Belum ada data', 1, '2022-05-15 08:36:04'),
(409, 'Data Member', 1, 'Mengubah isi data sebelumnya menjadi id = 128, level = Reader, nik = 030401-197809-0014, partner = Keluarga Aruan, user_nama =  , user_email = , user_email_status = 0, user_phone = 0, user_status = Aktif', 'Isi data sebelumnya adalah id = 128, level = Reader, nik = 030401-197809-0013, id_partner = 33, user_nama =  , user_email = , user_email_status = 0, user_phone = 0, user_status = Aktif', 2, '2022-05-15 08:37:13'),
(410, 'Data Member', 1, 'Mengubah isi data sebelumnya menjadi id = 52, nama_depan =  , nama_belakang = Magda, jenis_kelamin = 2, status = Aktif, photo = ', 'Isi data sebelumnya adalah id = 52, nama_depan = , nama_belakang = , jenis_kelamin = Tidak Diketahui, status = Aktif, photo = ', 2, '2022-05-15 08:37:13'),
(411, 'Data Member', 1, 'Menambah data baru dengan isi profile =   Magda, peristiwa_formal = Pernikahan, keterangan = -, tempat = bandung, tanggal_data_formal = 1978-09-16, status = Tidak Aktif', 'Belum ada data', 1, '2022-05-15 08:37:58'),
(412, 'Data Member', 1, 'Menambah data baru dengan isi profile =   Roi, peristiwa_formal = Pernikahan, keterangan = -, tempat = bandung, tanggal_data_formal = 1988-09-16, status = Tidak Aktif', 'Belum ada data', 1, '2022-05-15 08:39:08'),
(413, 'Data Member', 1, 'Menambah data baru dengan isi profile =   Yulia, peristiwa_formal = Pernikahan, keterangan = pernikahan, tempat = bandung, tanggal_data_formal = 1988-09-16, status = Tidak Aktif', 'Belum ada data', 1, '2022-05-15 08:39:47'),
(414, 'Data Member', NULL, 'Mengubah isi data sebelumnya menjadi id = 132, level = Reader, nik = 030401-198809-0015, partner = Setiawan, user_nama =  , user_email = , user_email_status = 0, user_phone = 0, user_status = Aktif', 'Isi data sebelumnya adalah id = 132, level = Reader, nik = 030401-198809-0013, id_partner = 34, user_nama =  , user_email = , user_email_status = 0, user_phone = 0, user_status = Aktif', 2, '2022-05-15 08:40:18'),
(415, 'Data Member', NULL, 'Mengubah isi data sebelumnya menjadi id = 52, nama_depan =  , nama_belakang = Yulia, jenis_kelamin = 2, status = Aktif, photo = ', 'Isi data sebelumnya adalah id = 52, nama_depan = , nama_belakang = , jenis_kelamin = Tidak Diketahui, status = Aktif, photo = ', 2, '2022-05-15 08:40:18'),
(416, 'Data Member', NULL, 'Mengubah isi data sebelumnya menjadi id = 131, level = Reader, nik = 030401-198809-0016, partner = Setiawan, user_nama =  , user_email = , user_email_status = 0, user_phone = 0, user_status = Aktif', 'Isi data sebelumnya adalah id = 131, level = Reader, nik = 030401-198809-0013, id_partner = 34, user_nama =  , user_email = , user_email_status = 0, user_phone = 0, user_status = Aktif', 2, '2022-05-15 08:40:34'),
(417, 'Data Member', NULL, 'Mengubah isi data sebelumnya menjadi id = 52, nama_depan =  , nama_belakang = Roi, jenis_kelamin = 1, status = Aktif, photo = ', 'Isi data sebelumnya adalah id = 52, nama_depan = , nama_belakang = , jenis_kelamin = Tidak Diketahui, status = Aktif, photo = ', 2, '2022-05-15 08:40:34'),
(418, 'Data Member', NULL, 'Mengubah isi data sebelumnya menjadi id = 128, level = Reader, nik = 030401-197809-0017, partner = Setiawan, user_nama =  , user_email = , user_email_status = 0, user_phone = 0, user_status = Aktif', 'Isi data sebelumnya adalah id = 128, level = Reader, nik = 030401-197809-0014, id_partner = 33, user_nama =  , user_email = , user_email_status = 0, user_phone = 0, user_status = Aktif', 2, '2022-05-15 08:40:57'),
(419, 'Data Member', NULL, 'Mengubah isi data sebelumnya menjadi id = 52, nama_depan =  , nama_belakang = Magda, jenis_kelamin = 2, status = Aktif, photo = ', 'Isi data sebelumnya adalah id = 52, nama_depan = , nama_belakang = , jenis_kelamin = Tidak Diketahui, status = Aktif, photo = ', 2, '2022-05-15 08:40:57'),
(420, 'Data Member', NULL, 'Mengubah isi data sebelumnya menjadi id = 127, level = Reader, nik = 030401-197809-0018, partner = Setiawan, user_nama = , user_email = , user_email_status = 0, user_phone = 0, user_status = Aktif', 'Isi data sebelumnya adalah id = 127, level = Reader, nik = 030401-197809-0013, id_partner = 33, user_nama = , user_email = , user_email_status = 0, user_phone = 0, user_status = Aktif', 2, '2022-05-15 08:41:13');
INSERT INTO `activity_log` (`id`, `modul`, `by`, `data_baru`, `data_lama`, `jenis_perubahan`, `created_at`) VALUES
(421, 'Data Member', NULL, 'Mengubah isi data sebelumnya menjadi id = 52, nama_depan = , nama_belakang = Zainudin, jenis_kelamin = 1, status = Aktif, photo = ', 'Isi data sebelumnya adalah id = 52, nama_depan = , nama_belakang = , jenis_kelamin = Tidak Diketahui, status = Aktif, photo = ', 2, '2022-05-15 08:41:13'),
(422, '', 1, 'Menghapus data lama', 'Isi data sebelumnya adalah \"\"', 3, '2022-05-15 08:41:34'),
(423, '', 1, 'Menghapus data lama', 'Isi data sebelumnya adalah \"\"', 3, '2022-05-15 08:41:43'),
(424, '', 1, 'Menghapus data lama', 'Isi data sebelumnya adalah \"\"', 3, '2022-05-15 08:42:18'),
(425, '', 1, 'Menghapus data lama', 'Isi data sebelumnya adalah \"\"', 3, '2022-05-15 08:42:33'),
(426, 'Data Member', 1, 'Mengubah isi data sebelumnya menjadi id = 128, level = Reader, nik = 030401-197809-0019, partner = Keluarga Aruan, user_nama =  , user_email = , user_email_status = 0, user_phone = 0, user_status = Aktif', 'Isi data sebelumnya adalah id = 128, level = Reader, nik = 030401-197809-0017, id_partner = 25, user_nama =  , user_email = , user_email_status = 0, user_phone = 0, user_status = Aktif', 2, '2022-05-15 08:51:29'),
(427, 'Data Member', 1, 'Mengubah isi data sebelumnya menjadi id = 52, nama_depan =  , nama_belakang = Magda, jenis_kelamin = 2, status = Aktif, photo = ', 'Isi data sebelumnya adalah id = 52, nama_depan = , nama_belakang = , jenis_kelamin = Tidak Diketahui, status = Aktif, photo = ', 2, '2022-05-15 08:51:29'),
(428, 'Data Member', 1, 'Mengubah isi data sebelumnya menjadi id = 127, level = Reader, nik = 030401-197809-0020, partner = Keluarga Aruan, user_nama = , user_email = , user_email_status = 0, user_phone = 0, user_status = Aktif', 'Isi data sebelumnya adalah id = 127, level = Reader, nik = 030401-197809-0018, id_partner = 25, user_nama = , user_email = , user_email_status = 0, user_phone = 0, user_status = Aktif', 2, '2022-05-15 08:51:59'),
(429, 'Data Member', 1, 'Mengubah isi data sebelumnya menjadi id = 52, nama_depan = , nama_belakang = Zainudin, jenis_kelamin = 1, status = Aktif, photo = ', 'Isi data sebelumnya adalah id = 52, nama_depan = , nama_belakang = , jenis_kelamin = Tidak Diketahui, status = Aktif, photo = ', 2, '2022-05-15 08:51:59'),
(430, '', 1, 'Menghapus data lama', 'Isi data sebelumnya adalah \"\"', 3, '2022-05-15 08:52:03'),
(431, '', 1, 'Menghapus data lama', 'Isi data sebelumnya adalah \"\"', 3, '2022-05-15 08:52:19'),
(432, 'Data Member', 1, 'Mengubah isi data sebelumnya menjadi id = 132, level = Reader, nik = 030401-198809-0021, partner = Keluarga Wungka, user_nama =  , user_email = , user_email_status = 0, user_phone = 0, user_status = Aktif', 'Isi data sebelumnya adalah id = 132, level = Reader, nik = 030401-198809-0015, id_partner = 25, user_nama =  , user_email = , user_email_status = 0, user_phone = 0, user_status = Aktif', 2, '2022-05-15 08:54:11'),
(433, 'Data Member', 1, 'Mengubah isi data sebelumnya menjadi id = 52, nama_depan =  , nama_belakang = Yulia, jenis_kelamin = 2, status = Aktif, photo = ', 'Isi data sebelumnya adalah id = 52, nama_depan = , nama_belakang = , jenis_kelamin = Tidak Diketahui, status = Aktif, photo = ', 2, '2022-05-15 08:54:11'),
(434, 'Data Member', 1, 'Mengubah isi data sebelumnya menjadi id = 131, level = Reader, nik = 030401-198809-0021, partner = Keluarga Wungka, user_nama =  , user_email = , user_email_status = 0, user_phone = 0, user_status = Aktif', 'Isi data sebelumnya adalah id = 131, level = Reader, nik = 030401-198809-0016, id_partner = 25, user_nama =  , user_email = , user_email_status = 0, user_phone = 0, user_status = Aktif', 2, '2022-05-15 08:54:20'),
(435, 'Data Member', 1, 'Mengubah isi data sebelumnya menjadi id = 52, nama_depan =  , nama_belakang = Roi, jenis_kelamin = 1, status = Aktif, photo = ', 'Isi data sebelumnya adalah id = 52, nama_depan = , nama_belakang = , jenis_kelamin = Tidak Diketahui, status = Aktif, photo = ', 2, '2022-05-15 08:54:20'),
(436, 'Data Member', 1, 'Menambah data baru dengan isi profile =  Zainudin keanggotaan = 2, tanggal = 2022-05-15, status = Aktif', 'Belum ada data', 1, '2022-05-15 08:57:39'),
(437, 'Data Member', 1, 'Menambah data baru dengan isi profile =   Magda keanggotaan = 2, tanggal = 2022-05-15, status = Aktif', 'Belum ada data', 1, '2022-05-15 08:58:30'),
(438, 'Wilayah', 1, 'Menghapus data lama', 'Isi data sebelumnya adalah nama = , status = ', 3, '2022-05-16 03:42:05'),
(439, 'Kategorial Umur', 1, 'Menghapus data lama', 'Isi data sebelumnya adalah nama = Bayi, status = Aktif', 3, '2022-05-16 03:42:42'),
(440, '', 1, 'Menghapus data lama', 'Isi data sebelumnya adalah \"\"', 3, '2022-05-16 03:43:20'),
(441, 'Data Member', 1, 'Mengubah isi data sebelumnya menjadi id = 132, level = Reader, nik = 030401-198809-0022, partner = Keluarga Wungka, user_nama =  , user_email = yuli@mailinator.com, user_email_status = 0, user_phone = 0, user_status = Aktif', 'Isi data sebelumnya adalah id = 132, level = Reader, nik = 030401-198809-0021, id_partner = 34, user_nama =  , user_email = , user_email_status = 0, user_phone = 0, user_status = Aktif', 2, '2022-05-16 03:43:45'),
(442, 'Data Member', 1, 'Mengubah isi data sebelumnya menjadi id = 52, nama_depan =  , nama_belakang = Yulia, jenis_kelamin = 2, status = Aktif, photo = ', 'Isi data sebelumnya adalah id = 52, nama_depan = , nama_belakang = , jenis_kelamin = Tidak Diketahui, status = Aktif, photo = ', 2, '2022-05-16 03:43:45'),
(443, 'Data Member', 1, 'Mengubah isi data sebelumnya menjadi id = 131, level = Reader, nik = 030401-198809-0023, partner = Keluarga Wungka, user_nama =  , user_email = roi@mailinator.com, user_email_status = 0, user_phone = 0, user_status = Aktif', 'Isi data sebelumnya adalah id = 131, level = Reader, nik = 030401-198809-0021, id_partner = 34, user_nama =  , user_email = , user_email_status = 0, user_phone = 0, user_status = Aktif', 2, '2022-05-16 03:45:16'),
(444, 'Data Member', 1, 'Mengubah isi data sebelumnya menjadi id = 52, nama_depan =  , nama_belakang = Roi, jenis_kelamin = 1, status = Aktif, photo = ', 'Isi data sebelumnya adalah id = 52, nama_depan = , nama_belakang = , jenis_kelamin = Tidak Diketahui, status = Aktif, photo = ', 2, '2022-05-16 03:45:16'),
(445, '', 1, 'Menghapus data lama', 'Isi data sebelumnya adalah \"\"', 3, '2022-05-16 03:45:36'),
(446, 'Data Member', 1, 'Mengubah isi data sebelumnya menjadi id = 127, level = Reader, nik = 030401-197809-0024, partner = Keluarga Aruan, user_nama = , user_email = zai@mailinator.com, user_email_status = 1, user_phone = 0, user_status = Aktif', 'Isi data sebelumnya adalah id = 127, level = Reader, nik = 030401-197809-0020, id_partner = 33, user_nama = , user_email = zai@mailinator.com, user_email_status = 1, user_phone = 0, user_status = Aktif', 2, '2022-05-16 15:18:32'),
(447, 'Data Member', 1, 'Mengubah isi data sebelumnya menjadi id = 52, nama_depan = , nama_belakang = Zainudin, jenis_kelamin = 1, status = Aktif, photo = ', 'Isi data sebelumnya adalah id = 52, nama_depan = , nama_belakang = , jenis_kelamin = Tidak Diketahui, status = Aktif, photo = ', 2, '2022-05-16 15:18:32'),
(448, 'Data Member', 1, 'Menambah data baru dengan isi profile =   Yulia, peristiwa_formal = Tanggal Lahir, keterangan = 1, tempat = 1, tanggal_data_formal = 2022-05-17, status = Tidak Aktif', 'Belum ada data', 1, '2022-05-17 15:16:29'),
(449, 'Keanggotaan', 1, 'Menghapus data lama', 'Isi data sebelumnya adalah nama = Suami, keterangan = , no urut = 0, status = Aktif', 3, '2022-05-19 13:13:28'),
(450, 'Keanggotaan', 1, 'Menghapus data lama', 'Isi data sebelumnya adalah nama = Istri, keterangan = , no urut = 0, status = Aktif', 3, '2022-05-19 13:13:32'),
(451, 'Kategorial Umur', 1, 'Menghapus data lama', 'Isi data sebelumnya adalah nama = Wilayah Timur, status = Aktif', 3, '2022-05-19 13:14:11'),
(452, 'Kategorial Umur', 1, 'Menghapus data lama', 'Isi data sebelumnya adalah nama = Wilayah 5, status = Aktif', 3, '2022-05-19 13:14:15'),
(453, 'Data Member', 1, 'Menambah data baru dengan isi id = 182, level = Reader, nik = 030401-202205-0001, partner = Setiawan, user_nama = Su, user_email = bensu@mailinator.com, user_email_status = 0, user_phone = 0, user_status = Aktif', 'Belum ada data', 1, '2022-05-19 13:27:28'),
(454, 'Data Member', 1, 'Mengubah isi data sebelumnya menjadi id = 52, nama_depan = Su, nama_belakang = Ben, jenis_kelamin = 1, status = Aktif, photo = ', 'Isi data sebelumnya adalah id = 52, nama_depan = , nama_belakang = , jenis_kelamin = Tidak Diketahui, status = Aktif, photo = ', 2, '2022-05-19 13:27:28'),
(455, 'Keluarga', 1, 'Mengubah isi data sebelumnya menjadi nama = Keluarga Aruan  1, lokasi = Jl Duri Kepa, no_telepon = 085798132505, email = , status = Aktif', 'Isi data sebelumnya adalah nama = Keluarga Aruan  1, lokasi = , no_telepon = , email = , status = Aktif', 2, '2022-05-21 16:14:53'),
(456, 'Keluarga', 1, 'Mengubah isi data sebelumnya menjadi nama = Keluarga Aruan  1, lokasi = Jl Duri Kepa, no_telepon = 085798132505, email = , status = Aktif', 'Isi data sebelumnya adalah nama = Keluarga Aruan  1, lokasi = Jl Duri Kepa, no_telepon = 085798132505, email = , status = Aktif', 2, '2022-05-21 16:20:14'),
(457, 'Menu', 1, 'Menambah data baru dengan isi parent = Master, menu_nama = Pilihan Keaktifan, menu_index = 14, menu_icon = far fa-circle, menu_url = pilihanKeaktifan, menu_keterangan = -, menu_status = Aktif', 'Belum ada data', 1, '2022-05-24 07:20:56'),
(458, '', 1, 'Menambah data baru dengan isi menu = Pilihan Keaktifan, level = Super Admin', 'Belum ada data', 1, '2022-05-24 07:21:27'),
(459, 'Menu', 1, 'Mengubah isi data sebelumnya menjadi parent = Master, menu_nama = Pilihan Keaktifan, menu_index = 14, menu_icon = far fa-circle, menu_url = data-master/pilihanKeaktifan, menu_keterangan = -, menu_status = Aktif', 'Isi data sebelumnya adalah parent = Master, menu_nama = Pilihan Keaktifan, menu_index = 14, menu_icon = far fa-circle, menu_url = pilihanKeaktifan, menu_keterangan = -, menu_status = Aktif', 2, '2022-05-24 07:22:17'),
(460, 'Pilihan Keaktifan', 1, 'Menambah data baru dengan isi nama = Pengarah, keterangan = Pengarah, no urut = 1, status = Aktif', 'Belum ada data', 1, '2022-05-24 07:30:14'),
(461, 'Pilihan Keaktifan', 1, 'Mengubah isi data sebelumnya menjadi nama = Pengarah, keterangan = pengarah, no urut = 1, status = Aktif', 'Isi data sebelumnya adalah nama = Pengarah, keterangan = Pengarah, no urut = 1, status = Aktif', 2, '2022-05-24 07:33:05'),
(462, 'Pilihan Keaktifan', 1, 'Menambah data baru dengan isi nama = Komisi, keterangan = komisi, no urut = 2, status = Aktif', 'Belum ada data', 1, '2022-05-24 07:33:43'),
(463, 'Pilihan Keaktifan', 1, 'Menambah data baru dengan isi nama = Kepanitiaan, keterangan = kepanitiaan, no urut = 3, status = Aktif', 'Belum ada data', 1, '2022-05-24 07:34:02'),
(464, 'Pilihan Keaktifan', 1, 'Menambah data baru dengan isi nama = Wilayah, keterangan = wilayah, no urut = 4, status = Aktif', 'Belum ada data', 1, '2022-05-24 07:34:17'),
(465, 'Term Management', 1, 'Menambah data baru dengan isi menu = Pilihan Keaktifan, nama = Pilihan Keaktifan, keterangan = -, status = Aktif', 'Belum ada data', 1, '2022-05-24 07:36:12'),
(466, 'Pilihan Keaktifan', 1, 'Mengubah isi data sebelumnya menjadi nama = Wilayahh, keterangan = wilayah, no urut = 4, status = Aktif', 'Isi data sebelumnya adalah nama = Wilayah, keterangan = wilayah, no urut = 4, status = Aktif', 2, '2022-05-24 07:37:44'),
(467, 'Data Member', 1, 'Menambah data baru dengan isi profile =  , jenis_membership = Level 1, approver = Super Admin, tanggal_anggota = 2022-01-01, status = Disetujui', 'Belum ada data', 1, '2022-05-24 09:09:23'),
(468, 'Data Member', 1, 'Menambah data baru dengan isi profile =  , jenis_membership = Level 1, profile_atasan = , status = Aktif', 'Belum ada data', 1, '2022-05-24 09:09:23'),
(469, 'Data Member', 1, 'Menambah data baru dengan isi id = 224, level = Partner L1, nik = 030401-202205-0002, partner = Setiawan, user_nama = Opusisv, user_email = level1@mailinator.com, user_email_status = 0, user_phone = 0, user_status = Aktif', 'Belum ada data', 1, '2022-05-24 09:09:28'),
(470, 'Data Member', 1, 'Mengubah isi data sebelumnya menjadi id = 52, nama_depan = Opusisv, nama_belakang = Level1, jenis_kelamin = 1, status = Aktif, photo = ', 'Isi data sebelumnya adalah id = 52, nama_depan = , nama_belakang = , jenis_kelamin = Tidak Diketahui, status = Aktif, photo = ', 2, '2022-05-24 09:09:28'),
(471, 'Data Member', 1, 'Menambah data baru dengan isi id = 225, level = Reader, nik = 030401-202205-0003, partner = Halim, user_nama = Opusisv, user_email = testing2@mailinator.com, user_email_status = 0, user_phone = 0, user_status = Aktif', 'Belum ada data', 1, '2022-05-24 14:46:57'),
(472, 'Data Member', 1, 'Mengubah isi data sebelumnya menjadi id = 52, nama_depan = Opusisv, nama_belakang = Testing2, jenis_kelamin = 1, status = Aktif, photo = ', 'Isi data sebelumnya adalah id = 52, nama_depan = , nama_belakang = , jenis_kelamin = Tidak Diketahui, status = Aktif, photo = ', 2, '2022-05-24 14:46:58'),
(473, 'Data Member', 1, 'Menambah data baru dengan isi id = 226, level = Reader, nik = 030401-202203-0001, partner = Setiawan, user_nama = Opusisv, user_email = testing3@mailinator.com, user_email_status = 0, user_phone = 0, user_status = Aktif', 'Belum ada data', 1, '2022-05-24 14:50:09'),
(474, 'Data Member', 1, 'Mengubah isi data sebelumnya menjadi id = 52, nama_depan = Opusisv, nama_belakang = Testing3, jenis_kelamin = 1, status = Aktif, photo = ', 'Isi data sebelumnya adalah id = 52, nama_depan = , nama_belakang = , jenis_kelamin = Tidak Diketahui, status = Aktif, photo = ', 2, '2022-05-24 14:50:10'),
(475, 'Data Member', 1, 'Menghapus Data Member - Kategori Keanggotaan Berhasil', 'Isi Data Member - Kategori Keanggotaan Sebelumnya adalah Nama Lengkap = Opusisv Testing3, Kode = P, Kategori = Pengunjung, Tanggal = 2022-05-24 ', 3, '2022-05-24 14:56:32'),
(476, 'Data Member', 1, 'Menambah data baru dengan isi profile = Opusisv Testing3 wilayah = Cimahi, tanggal = 2022-01-01, status = Aktif', 'Belum ada data', 1, '2022-05-24 14:57:42'),
(477, 'Data Member', 1, 'Mengubah isi data sebelumnya menjadi profile = Opusisv Testing3, wilayah = Bandung, status = Aktif', 'Isi data sebelumnya adalah profile = Opusisv Testing3, wilayah = Cimahi, status = Aktif', 2, '2022-05-24 14:58:13'),
(478, 'Data Member', 1, 'Menghapus Data Member - Wilayah Berhasil', 'Isi Data Member - Wilayah Sebelumnya adalah Nama Lengkap = Opusisv Testing3, Wilayah = Bandung ', 3, '2022-05-24 14:58:59'),
(479, 'Data Member', 1, 'Menambah data baru dengan isi profile = Opusisv Testing3 kategorial = Muda, tanggal = 2022-05-24, status = Aktif', 'Belum ada data', 1, '2022-05-24 15:00:47'),
(480, 'Data Member', 1, 'Menghapus Data Member - Kategorial Berhasil', 'Isi Data Member - Kategorial Sebelumnya adalah Nama Lengkap = Opusisv Testing3, Kategorial = Muda, Tanggal = 2022-05-24 ', 3, '2022-05-24 15:01:22'),
(481, 'Data Member', 1, 'Menambah Data Member - Keaktifan baru dengan isi Nama Lengkap = Opusisv Testing3, Jabatan = Sekretaris, Tanggal Mulai = 2022-05-11, Tanggal Selesai = 0000-00-00, Pilihan = Komisi, Master = Komisi 1, Status = Aktif', 'Belum ada data', 1, '2022-05-24 15:05:04'),
(482, 'Data Member', 1, 'Menambah Data Member - Keaktifan baru dengan isi Nama Lengkap = Opusisv Testing3, Jabatan = Direktur, Tanggal Mulai = 2022-01-01, Tanggal Selesai = 0000-00-00, Pilihan = Pengarah, Master = Pengarah C, Status = Aktif', 'Belum ada data', 1, '2022-05-24 15:05:17'),
(483, 'Data Member', 1, 'Menambah Data Member - Keaktifan baru dengan isi Nama Lengkap = Opusisv Testing3, Jabatan = Direktur, Tanggal Mulai = 2022-02-01, Tanggal Selesai = 0000-00-00, Pilihan = Kepanitiaan, Master = ABC, Status = Aktif', 'Belum ada data', 1, '2022-05-24 15:07:02'),
(484, 'Data Member', 1, 'Mengubah isi Data Member - Keaktifan sebelumnya menjadi Nama Lengkap = Opusisv Testing3, Jabatan = Direktur, Tanggal Mulai = 2022-02-01, Tanggal Selesai = 0000-00-00, Pilihan = Kepanitiaan, Master = 2, Status = Aktif', 'Isi Data Member - Keaktifan sebelumnya adalah Nama Lengkap = Opusisv Testing3, Jabatan = Direktur, Tanggal Mulai = 2022-02-01, Tanggal Selesai = 0000-00-00, Pilihan = Kepanitiaan, Master = ABC, Status = Aktif', 2, '2022-05-24 15:08:13'),
(485, 'Data Member', 1, 'Menambah data baru dengan isi profile = Opusisv Testing3, jenis_membership = Level 4, approver = Super Admin, tanggal_anggota = 2022-01-01, status = Tidak Diketahui', 'Belum ada data', 1, '2022-05-24 15:10:43'),
(486, 'Data Member', 1, 'Menambah data baru dengan isi profile = Opusisv Testing3, jenis_membership = Level 4, profile_atasan = , status = Aktif', 'Belum ada data', 1, '2022-05-24 15:10:43'),
(487, 'Data Member', 1, 'Mengubah isi data sebelumnya menjadi profile = Opusisv Testing3, jenis_membership = Level 5, approver = Super Admin, tanggal_anggota = 2022-03-02', '', 2, '2022-05-24 15:11:03'),
(488, 'Data Member', 268, 'Mengubah isi data membership dengan profile = Opusisv Testing3 sebelumnya menjadi status = Ditolak', 'Isi data sebelumnya adalah membership dengan profile = Opusisv Testing3, status = Meminta Persetujuan', 2, '2022-05-24 15:14:15'),
(489, 'Data Member', 1, 'Mengubah isi data sebelumnya menjadi id = 223, level = Reader, nik = 030401-198001-0024, partner = Halim, user_nama = Liana Tandjung, user_email = , user_email_status = 0, user_phone = 0, user_status = Aktif', 'Isi data sebelumnya adalah id = 223, level = Reader, nik = 030401-198001-0024, id_partner = 59, user_nama = Liana Tandjung , user_email = , user_email_status = 0, user_phone = 0, user_status = Aktif', 2, '2022-05-24 15:35:41'),
(490, 'Data Member', 1, 'Mengubah isi data sebelumnya menjadi id = 52, nama_depan = Liana Tandjung, nama_belakang = sadasd, jenis_kelamin = 1, status = Aktif, photo = ', 'Isi data sebelumnya adalah id = 52, nama_depan = , nama_belakang = , jenis_kelamin = Tidak Diketahui, status = Aktif, photo = ', 2, '2022-05-24 15:35:41'),
(491, 'Data Member', 1, 'Menambah data baru dengan isi profile = Opusisv Testing2 keanggotaan = 2, tanggal = 2022-05-24, status = Aktif', 'Belum ada data', 1, '2022-05-24 15:42:42'),
(492, 'Data Member', 1, 'Menambah data baru dengan isi profile = Opusisv Testing2, jenis_membership = Level 4, approver = Super Admin, tanggal_anggota = 2022-01-01, status = Tidak Diketahui', 'Belum ada data', 1, '2022-05-24 15:46:56'),
(493, 'Data Member', 1, 'Menambah data baru dengan isi profile = Opusisv Testing2, jenis_membership = Level 4, profile_atasan = , status = Aktif', 'Belum ada data', 1, '2022-05-24 15:46:56'),
(494, 'Data Member', 268, 'Mengubah isi data membership dengan profile = Opusisv Testing2 sebelumnya menjadi status = Ditolak', 'Isi data sebelumnya adalah membership dengan profile = Opusisv Testing2, status = Meminta Persetujuan', 2, '2022-05-24 15:47:32'),
(495, 'Data Member', 1, 'Menambah data baru dengan isi profile = Opusisv Testing2, jenis_membership = Level 3, approver = Super Admin, tanggal_anggota = 2022-02-01, status = Tidak Diketahui', 'Belum ada data', 1, '2022-05-24 15:48:18'),
(496, 'Data Member', 1, 'Menambah data baru dengan isi profile = Opusisv Testing2, jenis_membership = Level 3, profile_atasan = , status = Aktif', 'Belum ada data', 1, '2022-05-24 15:48:18'),
(497, 'Data Member', 268, 'Mengubah isi data membership dengan profile = Opusisv Testing2 sebelumnya menjadi status = Ditolak', 'Isi data sebelumnya adalah membership dengan profile = Opusisv Testing2, status = Meminta Persetujuan', 2, '2022-05-24 15:50:01'),
(498, 'Data Member', 1, 'Menambah data baru dengan isi profile = Opusisv Testing2, jenis_membership = Level 5, approver = Super Admin, tanggal_anggota = 2022-01-01, status = Tidak Diketahui', 'Belum ada data', 1, '2022-05-24 15:50:26'),
(499, 'Data Member', 1, 'Menambah data baru dengan isi profile = Opusisv Testing2, jenis_membership = Level 5, profile_atasan = , status = Aktif', 'Belum ada data', 1, '2022-05-24 15:50:26'),
(500, 'Data Member', 1, 'Menambah data baru dengan isi profile = Opusisv Testing2 wilayah = Bandung, tanggal = 2022-01-01, status = 1', 'Belum ada data', 1, '2022-05-24 16:33:29'),
(501, 'Data Member', 1, 'Mengubah isi data sebelumnya menjadi profile = Opusisv Testing2, wilayah = Cimahi, tanggal = 2022-01-01 status = Aktif', 'Isi data sebelumnya adalah profile = Opusisv Testing2, wilayah = Bandung, status = Aktif tanggal = 2022-01-01', 2, '2022-05-24 16:34:16'),
(502, 'Data Member', 1, 'Menghapus Data Member - Wilayah Berhasil', 'Isi Data Member - Wilayah Sebelumnya adalah Nama Lengkap = Opusisv Testing2, Wilayah = Cimahi, Tanggal = 2022-01-01 ', 3, '2022-05-24 16:35:23'),
(503, 'Data Member', 1, 'Menambah Data Member - Keaktifan baru dengan isi Nama Lengkap = Opusisv Testing2, Jabatan = Direktur, Tanggal Mulai = 2022-01-01, Tanggal Selesai = 0000-00-00, Pilihan = Komisi, Master = Komisi 2, Status = Aktif', 'Belum ada data', 1, '2022-05-24 16:38:22'),
(504, 'Data Member', 1, 'Mengubah isi Data Member - Keaktifan sebelumnya menjadi Nama Lengkap = Opusisv Testing2, Jabatan = Direktur, Tanggal Mulai = 2022-01-01, Tanggal Selesai = 0000-00-00, Pilihan = Komisi, Master = Komisi 3, Status = Aktif', 'Isi Data Member - Keaktifan sebelumnya adalah Nama Lengkap = Opusisv Testing2, Jabatan = Direktur, Tanggal Mulai = 2022-01-01, Tanggal Selesai = 0000-00-00, Pilihan = Komisi, Master = Komisi 2, Status = Aktif', 2, '2022-05-24 16:39:02'),
(505, 'Data Member', 1, 'Mengubah isi Data Member - Keaktifan sebelumnya menjadi Nama Lengkap = Opusisv Testing2, Jabatan = Direktur, Tanggal Mulai = 2022-01-01, Tanggal Selesai = 0000-00-00, Pilihan = Pengarah, Master = Pengarah B, Status = Aktif', 'Isi Data Member - Keaktifan sebelumnya adalah Nama Lengkap = Opusisv Testing2, Jabatan = Direktur, Tanggal Mulai = 2022-01-01, Tanggal Selesai = 0000-00-00, Pilihan = Komisi, Master = Komisi 3, Status = Aktif', 2, '2022-05-24 16:39:28'),
(506, 'Data Member', 1, 'Mengubah isi Data Member - Keaktifan sebelumnya menjadi Nama Lengkap = Opusisv Testing2, Jabatan = Sekretaris, Tanggal Mulai = 2022-02-01, Tanggal Selesai = 0000-00-00, Pilihan = Kepanitiaan, Master = 2, Status = Aktif', 'Isi Data Member - Keaktifan sebelumnya adalah Nama Lengkap = Opusisv Testing2, Jabatan = Direktur, Tanggal Mulai = 2022-01-01, Tanggal Selesai = 0000-00-00, Pilihan = Pengarah, Master = Pengarah B, Status = Aktif', 2, '2022-05-24 16:40:56'),
(507, 'Data Member', 1, 'Mengubah isi Data Member - Keaktifan sebelumnya menjadi Nama Lengkap = Opusisv Testing2, Jabatan = Sekretaris, Tanggal Mulai = 2022-02-01, Tanggal Selesai = 0000-00-00, Pilihan = Kepanitiaan, Master = 2, Status = Aktif', 'Isi Data Member - Keaktifan sebelumnya adalah Nama Lengkap = Opusisv Testing2, Jabatan = Sekretaris, Tanggal Mulai = 2022-02-01, Tanggal Selesai = 0000-00-00, Pilihan = Kepanitiaan, Master = 2, Status = Aktif', 2, '2022-05-24 16:42:11'),
(508, 'Data Member', 1, 'Mengubah isi Data Member - Keaktifan sebelumnya menjadi Nama Lengkap = Opusisv Testing2, Jabatan = Sekretaris, Tanggal Mulai = 2022-02-01, Tanggal Selesai = 0000-00-00, Pilihan = Kepanitiaan, Master = ABC, Status = Aktif', 'Isi Data Member - Keaktifan sebelumnya adalah Nama Lengkap = Opusisv Testing2, Jabatan = Sekretaris, Tanggal Mulai = 2022-02-01, Tanggal Selesai = 0000-00-00, Pilihan = Kepanitiaan, Master = 2, Status = Aktif', 2, '2022-05-24 16:42:34'),
(509, 'Data Member', 1, 'Mengubah isi Data Member - Keaktifan sebelumnya menjadi Nama Lengkap = Opusisv Testing2, Jabatan = Sekretaris, Tanggal Mulai = 2022-02-01, Tanggal Selesai = 0000-00-00, Pilihan = Kepanitiaan, Master = , Status = Aktif', 'Isi Data Member - Keaktifan sebelumnya adalah Nama Lengkap = Opusisv Testing2, Jabatan = Sekretaris, Tanggal Mulai = 2022-02-01, Tanggal Selesai = 0000-00-00, Pilihan = Kepanitiaan, Master = ABC, Status = Aktif', 2, '2022-05-24 16:43:05'),
(510, 'Data Member', 1, 'Mengubah isi Data Member - Keaktifan sebelumnya menjadi Nama Lengkap = Opusisv Testing2, Jabatan = Sekretaris, Tanggal Mulai = 2022-02-01, Tanggal Selesai = 0000-00-00, Pilihan = Kepanitiaan, Master = ABC, Status = Aktif', 'Isi Data Member - Keaktifan sebelumnya adalah Nama Lengkap = Opusisv Testing2, Jabatan = Sekretaris, Tanggal Mulai = 2022-02-01, Tanggal Selesai = 0000-00-00, Pilihan = Kepanitiaan, Master = , Status = Aktif', 2, '2022-05-24 16:48:56'),
(511, 'Data Member', 1, 'Menambah data baru dengan isi profile = Opusisv Testing2 keanggotaan = 1, tanggal = 2022-05-24, status = Aktif', 'Belum ada data', 1, '2022-05-24 16:51:31'),
(512, 'Data Member', 1, 'Menambah data baru dengan isi profile = Opusisv Testing2 keanggotaan = 2, tanggal = 2022-05-24, status = Aktif', 'Belum ada data', 1, '2022-05-24 16:52:28'),
(513, 'Data Member', 268, 'Mengubah setiap data sebelumnya menjadi status = Tidak Aktif', 'Isi data sebelumnya adalah {\"profile\":\"Opusisv Testing2\",\"jenis_membership\":\"Level 4\",\"nama_atasan\":\"\",\"status_str\":\"Tidak Aktif\"}', 2, '2022-05-24 16:56:42'),
(514, 'Data Member', 268, 'Mengubah setiap data sebelumnya menjadi status = Tidak Aktif', 'Isi data sebelumnya adalah {\"profile\":\"Opusisv Testing2\",\"nama_atasan\":\"\",\"jenis_membership\":\"Level 4\",\"tanggal_anggota\":\"2022-01-01\",\"status_str\":\"Ditolak\"}', 2, '2022-05-24 16:56:42'),
(515, 'Data Member', 268, 'Mengubah isi data membership dengan profile = Opusisv Testing2 sebelumnya menjadi status = Disetujui', 'Isi data sebelumnya adalah membership dengan profile = Opusisv Testing2, status = Meminta Persetujuan', 2, '2022-05-24 16:56:42'),
(516, 'Data Member', 1, 'Menambah data baru dengan isi profile = Opusisv Testing2, jenis_membership = Level 4, approver = Super Admin, tanggal_anggota = 2022-01-01, status = Tidak Diketahui', 'Belum ada data', 1, '2022-05-24 16:57:05'),
(517, 'Data Member', 1, 'Menambah data baru dengan isi profile = Opusisv Testing2, jenis_membership = Level 4, profile_atasan = , status = Aktif', 'Belum ada data', 1, '2022-05-24 16:57:05'),
(518, 'Data Member', 268, 'Mengubah isi data membership dengan profile = Opusisv Testing2 sebelumnya menjadi status = Ditolak', 'Isi data sebelumnya adalah membership dengan profile = Opusisv Testing2, status = Meminta Persetujuan', 2, '2022-05-24 16:59:43'),
(519, 'Data Member', 1, 'Menambah data baru dengan isi profile = Opusisv Testing2, jenis_membership = Level 4, approver = Super Admin, tanggal_anggota = 2022-02-02, status = Tidak Diketahui', 'Belum ada data', 1, '2022-05-24 17:00:08'),
(520, 'Data Member', 1, 'Menambah data baru dengan isi profile = Opusisv Testing2, jenis_membership = Level 4, profile_atasan = , status = Aktif', 'Belum ada data', 1, '2022-05-24 17:00:08'),
(521, 'Data Member', 268, 'Mengubah isi data membership dengan profile = Opusisv Testing2 sebelumnya menjadi status = Ditolak', 'Isi data sebelumnya adalah membership dengan profile = Opusisv Testing2, status = Meminta Persetujuan', 2, '2022-05-24 17:03:07'),
(522, 'Data Member', 1, 'Menambah data baru dengan isi profile = Opusisv Testing2, jenis_membership = Level 3, approver = Super Admin, tanggal_anggota = 2022-01-02, status = Tidak Diketahui', 'Belum ada data', 1, '2022-05-24 17:03:28'),
(523, 'Data Member', 1, 'Menambah data baru dengan isi profile = Opusisv Testing2, jenis_membership = Level 3, profile_atasan = , status = Aktif', 'Belum ada data', 1, '2022-05-24 17:03:28'),
(524, 'Menu', 1, 'Mengubah isi data sebelumnya menjadi parent = Utilities, menu_nama = Laporan Header, menu_index = 8, menu_icon = far fa-circle, menu_url = data-master/laporan-header, menu_keterangan = -, menu_status = Aktif', 'Isi data sebelumnya adalah parent = Master, menu_nama = Laporan Header, menu_index = 8, menu_icon = far fa-circle, menu_url = data-master/laporan-header, menu_keterangan = -, menu_status = Aktif', 2, '2022-05-26 05:53:10'),
(525, 'Menu', 1, 'Mengubah isi data sebelumnya menjadi parent = Utilities, menu_nama = Export Import Data Member , menu_index = 1, menu_icon = far fa-circle, menu_url = laporan/member, menu_keterangan = -, menu_status = Aktif', 'Isi data sebelumnya adalah parent = Laporan, menu_nama = Data Member , menu_index = 1, menu_icon = far fa-circle, menu_url = laporan/member, menu_keterangan = -, menu_status = Aktif', 2, '2022-05-26 05:53:51'),
(526, '', 1, 'Menghapus data lama', 'Isi data sebelumnya adalah menu = Laporan, level = Super Admin', 3, '2022-05-26 05:54:08'),
(527, 'Data Member', 1, 'Menambah data baru dengan isi profile = Opusisv Testing3, jenis_membership = Level 4, approver = Super Admin, tanggal_anggota = 2022-01-01, status = Tidak Diketahui', 'Belum ada data', 1, '2022-05-26 05:56:26'),
(528, 'Data Member', 1, 'Menambah data baru dengan isi profile = Opusisv Testing3, jenis_membership = Level 4, profile_atasan = , status = Aktif', 'Belum ada data', 1, '2022-05-26 05:56:26'),
(529, 'Data Member', 268, 'Mengubah setiap data sebelumnya menjadi status = Tidak Aktif', 'Isi data sebelumnya adalah {\"profile\":\"Opusisv Testing3\",\"jenis_membership\":\"Level 5\",\"nama_atasan\":\"\",\"status_str\":\"Tidak Aktif\"}', 2, '2022-05-26 06:06:17'),
(530, 'Data Member', 268, 'Mengubah setiap data sebelumnya menjadi status = Tidak Aktif', 'Isi data sebelumnya adalah {\"profile\":\"Opusisv Testing3\",\"nama_atasan\":\"\",\"jenis_membership\":\"Level 5\",\"tanggal_anggota\":\"2022-03-02\",\"status_str\":\"Ditolak\"}', 2, '2022-05-26 06:06:17'),
(531, 'Data Member', 268, 'Mengubah isi data membership dengan profile = Opusisv Testing3 sebelumnya menjadi status = Disetujui', 'Isi data sebelumnya adalah membership dengan profile = Opusisv Testing3, status = Meminta Persetujuan', 2, '2022-05-26 06:06:17'),
(532, 'Data Member', 1, 'Menambah data baru dengan isi profile = Opusisv Testing3 keanggotaan = 1, tanggal = 2022-05-26, status = Aktif', 'Belum ada data', 1, '2022-05-26 06:24:16'),
(533, 'Data Member', 1, 'Menambah data baru dengan isi profile = Opusisv Testing3 keanggotaan = 2, tanggal = 2022-05-26, status = Aktif', 'Belum ada data', 1, '2022-05-26 06:26:22'),
(534, 'Data Member', 1, 'Menambah data baru dengan isi profile = Opusisv Testing3, peristiwa_formal = Tanggal Lahir, keterangan = Akte Lahir, tempat = Bandung, tanggal_data_formal = 1990-01-01, status = Tidak Aktif', 'Belum ada data', 1, '2022-05-26 07:42:04'),
(535, 'Data Member', 1, 'Menambah data baru dengan isi profile = Ray Halim , peristiwa_formal = Pernikahan, keterangan = bandung, tempat = bandung, tanggal_data_formal = 2022-02-20, status = Tidak Aktif', 'Belum ada data', 1, '2022-05-26 09:37:32'),
(536, 'Keluarga', 1, 'Menambah data baru dengan isi nama = Topan Ismail, lokasi = Jakarta Barat, no_telepon = , email = , status = Aktif', 'Belum ada data', 1, '2022-05-26 10:21:56'),
(537, 'Data Member', 1, 'Menambah data baru dengan isi id = 227, level = Reader, nik = 030401-202205-0004, partner = Topan Ismail, user_nama = Topan, user_email = topan.ismail@mailinator.com, user_email_status = 0, user_phone = 0, user_status = Aktif', 'Belum ada data', 1, '2022-05-26 10:22:31'),
(538, 'Data Member', 1, 'Mengubah isi data sebelumnya menjadi id = 52, nama_depan = Topan, nama_belakang = Ismail, jenis_kelamin = 1, status = Aktif, photo = ', 'Isi data sebelumnya adalah id = 52, nama_depan = , nama_belakang = , jenis_kelamin = Tidak Diketahui, status = Aktif, photo = ', 2, '2022-05-26 10:22:31'),
(539, 'Data Member', 1, 'Menambah data baru dengan isi id = 228, level = Reader, nik = 030401-202205-0005, partner = Topan Ismail, user_nama = Ani, user_email = ina.ani@mailinator.com, user_email_status = 0, user_phone = 0, user_status = Aktif', 'Belum ada data', 1, '2022-05-26 10:22:58'),
(540, 'Data Member', 1, 'Mengubah isi data sebelumnya menjadi id = 52, nama_depan = Ani, nama_belakang = Ina, jenis_kelamin = 1, status = Aktif, photo = ', 'Isi data sebelumnya adalah id = 52, nama_depan = , nama_belakang = , jenis_kelamin = Tidak Diketahui, status = Aktif, photo = ', 2, '2022-05-26 10:22:58'),
(541, 'Data Member', 1, 'Mengubah isi data sebelumnya menjadi id = 228, level = Reader, nik = 030401-202205-0005, partner = Topan Ismail, user_nama = Ani, user_email = ina.ani@mailinator.com, user_email_status = 0, user_phone = 0, user_status = Aktif', 'Isi data sebelumnya adalah id = 228, level = Reader, nik = 030401-202205-0005, id_partner = 60, user_nama = Ani, user_email = ina.ani@mailinator.com, user_email_status = , user_phone = 0, user_status = Aktif', 2, '2022-05-26 10:23:11'),
(542, 'Data Member', 1, 'Mengubah isi data sebelumnya menjadi id = 52, nama_depan = Ani, nama_belakang = Ina, jenis_kelamin = 2, status = Aktif, photo = ', 'Isi data sebelumnya adalah id = 52, nama_depan = , nama_belakang = , jenis_kelamin = Tidak Diketahui, status = Aktif, photo = ', 2, '2022-05-26 10:23:11'),
(543, 'Data Member', 1, 'Menambah data baru dengan isi profile = Ani Ina, peristiwa_formal = Pernikahan, keterangan = Nikah AGustus, tempat = Jakarta Selatan, tanggal_data_formal = 2022-08-20, status = Tidak Aktif', 'Belum ada data', 1, '2022-05-26 10:34:12'),
(544, 'Data Member', 1, 'Menambah data baru dengan isi profile = Topan Ismail, peristiwa_formal = Tanggal Lahir, keterangan = Akte Kelahiran, tempat = Bandung, tanggal_data_formal = 1990-01-01, status = Tidak Aktif', 'Belum ada data', 1, '2022-05-26 10:34:58'),
(545, 'Data Member', 1, 'Menambah data baru dengan isi id = 229, level = Admin Staff, nik = 030401-202205-0006, partner = Setiawan, user_nama = Opusisv, user_email = admin.staff@gmail.com, user_email_status = 0, user_phone = 0, user_status = Aktif', 'Belum ada data', 1, '2022-05-26 12:01:28'),
(546, 'Data Member', 1, 'Mengubah isi data sebelumnya menjadi id = 52, nama_depan = Opusisv, nama_belakang = Admin Staff, jenis_kelamin = 1, status = Aktif, photo = ', 'Isi data sebelumnya adalah id = 52, nama_depan = , nama_belakang = , jenis_kelamin = Tidak Diketahui, status = Aktif, photo = ', 2, '2022-05-26 12:01:28'),
(547, 'Keluarga', 273, 'Menambah data baru dengan isi nama = Keluarga Testing, lokasi = , no_telepon = , email = , status = Aktif', 'Belum ada data', 1, '2022-05-26 12:03:33'),
(548, 'Data Member', 273, 'Menambah data baru dengan isi id = 230, level = Reader, nik = 030401-202205-0007, partner = Keluarga Testing, user_nama = Opusisv, user_email = testing.mei.1@mailinator.com, user_email_status = 0, user_phone = 0, user_status = Aktif', 'Belum ada data', 1, '2022-05-26 12:05:42'),
(549, 'Data Member', 273, 'Mengubah isi data sebelumnya menjadi id = 52, nama_depan = Opusisv, nama_belakang = Testing Mei 1, jenis_kelamin = 1, status = Aktif, photo = ', 'Isi data sebelumnya adalah id = 52, nama_depan = , nama_belakang = , jenis_kelamin = Tidak Diketahui, status = Aktif, photo = ', 2, '2022-05-26 12:05:42'),
(550, 'Data Member', 273, 'Menambah data baru dengan isi id = 231, level = Reader, nik = 030401-202205-0008, partner = Keluarga Testing, user_nama = Opusisv, user_email = testing.mei.2@mailinator.com, user_email_status = 0, user_phone = 0, user_status = Aktif', 'Belum ada data', 1, '2022-05-26 12:06:18'),
(551, 'Data Member', 273, 'Mengubah isi data sebelumnya menjadi id = 52, nama_depan = Opusisv, nama_belakang = Testing Mei 2, jenis_kelamin = 2, status = Aktif, photo = ', 'Isi data sebelumnya adalah id = 52, nama_depan = , nama_belakang = , jenis_kelamin = Tidak Diketahui, status = Aktif, photo = ', 2, '2022-05-26 12:06:18'),
(552, 'Data Member', 273, 'Mengubah isi data sebelumnya menjadi id = 230, level = Reader, nik = 030401-202205-0007, partner = Setiawan, user_nama = Opusisv, user_email = testing.mei.1@mailinator.com, user_email_status = 0, user_phone = 0, user_status = Aktif', 'Isi data sebelumnya adalah id = 230, level = Reader, nik = 030401-202205-0007, id_partner = 61, user_nama = Opusisv, user_email = testing.mei.1@mailinator.com, user_email_status = , user_phone = 0, user_status = Aktif', 2, '2022-05-26 12:06:36'),
(553, 'Data Member', 273, 'Mengubah isi data sebelumnya menjadi id = 52, nama_depan = Opusisv, nama_belakang = Testing Mei 1, jenis_kelamin = 1, status = Aktif, photo = ', 'Isi data sebelumnya adalah id = 52, nama_depan = , nama_belakang = , jenis_kelamin = Tidak Diketahui, status = Aktif, photo = ', 2, '2022-05-26 12:06:36'),
(554, 'Data Member', 273, 'Menambah data baru dengan isi id = 232, level = Reader, nik = 030401-202205-0009, partner = Keluarga Testing, user_nama = Opusisv, user_email = testing.mei.3@mailinator.com, user_email_status = 0, user_phone = 0, user_status = Aktif', 'Belum ada data', 1, '2022-05-26 12:07:21'),
(555, 'Data Member', 273, 'Mengubah isi data sebelumnya menjadi id = 52, nama_depan = Opusisv, nama_belakang = Testing Mei 3, jenis_kelamin = 1, status = Aktif, photo = ', 'Isi data sebelumnya adalah id = 52, nama_depan = , nama_belakang = , jenis_kelamin = Tidak Diketahui, status = Aktif, photo = ', 2, '2022-05-26 12:07:21'),
(556, 'Data Member', 273, 'Mengubah isi data sebelumnya menjadi id = 232, level = Reader, nik = 030401-202205-0009, partner = Setiawan, user_nama = Opusisv, user_email = testing.mei.3@mailinator.com, user_email_status = 0, user_phone = 0, user_status = Aktif', 'Isi data sebelumnya adalah id = 232, level = Reader, nik = 030401-202205-0009, id_partner = 61, user_nama = Opusisv, user_email = testing.mei.3@mailinator.com, user_email_status = , user_phone = 0, user_status = Aktif', 2, '2022-05-26 12:11:07'),
(557, 'Data Member', 273, 'Mengubah isi data sebelumnya menjadi id = 52, nama_depan = Opusisv, nama_belakang = Testing Mei 3, jenis_kelamin = 1, status = Aktif, photo = ', 'Isi data sebelumnya adalah id = 52, nama_depan = , nama_belakang = , jenis_kelamin = Tidak Diketahui, status = Aktif, photo = ', 2, '2022-05-26 12:11:07'),
(558, 'Data Member', 273, 'Mengubah isi data sebelumnya menjadi id = 232, level = Reader, nik = 030401-202205-0009, partner = Keluarga Testing, user_nama = Opusisv, user_email = testing.mei.3@mailinator.com, user_email_status = 0, user_phone = 0, user_status = Aktif', 'Isi data sebelumnya adalah id = 232, level = Reader, nik = 030401-202205-0009, id_partner = 61, user_nama = Opusisv, user_email = testing.mei.3@mailinator.com, user_email_status = 0, user_phone = 0, user_status = Aktif', 2, '2022-05-26 12:12:45'),
(559, 'Data Member', 273, 'Mengubah isi data sebelumnya menjadi id = 52, nama_depan = Opusisv, nama_belakang = Testing Mei 3, jenis_kelamin = 1, status = Aktif, photo = ', 'Isi data sebelumnya adalah id = 52, nama_depan = , nama_belakang = , jenis_kelamin = Tidak Diketahui, status = Aktif, photo = ', 2, '2022-05-26 12:12:45'),
(560, 'Data Member', 273, 'Menambah data baru dengan isi profile = Opusisv Testing Mei 2, peristiwa_formal = Pernikahan, keterangan = nikah, tempat = bandung, tanggal_data_formal = 2022-10-10, status = Tidak Aktif', 'Belum ada data', 1, '2022-05-26 12:13:38'),
(561, 'Kategori (Non User)', 1, 'Menambah data baru dengan isi nama = DF, keterangan = Data Formal, status = Aktif', 'Belum ada data', 1, '2022-05-26 14:59:09'),
(562, 'Kode', 1, 'Menambah data baru dengan isi kode = PF, bulan = Ya, tahun = Ya, jumlah = 4, status = Aktif', 'Belum ada data', 1, '2022-05-26 14:59:39'),
(563, 'Data Member', 1, 'Menambah data baru dengan isi profile = Opusisv Testing Mei 3, peristiwa_formal = Pernikahan, keterangan = bandung, tempat = cimahi, tanggal_data_formal = 2002-10-10, status = Tidak Aktif', 'Belum ada data', 1, '2022-05-26 15:51:58'),
(564, 'Data Member', 1, 'Menambah data baru dengan isi profile = Opusisv Testing Mei 3, peristiwa_formal = Pernikahan, keterangan = okok, tempat = Bandung, tanggal_data_formal = 2022-01-01, status = Tidak Aktif', 'Belum ada data', 1, '2022-05-26 15:53:25'),
(565, 'Keluarga', 273, 'Menambah data baru dengan isi nama = Keluarga Testing Mail, lokasi = , no_telepon = , email = , status = Aktif', 'Belum ada data', 1, '2022-05-26 17:37:29'),
(566, 'Data Member', 273, 'Menambah data baru dengan isi id = 233, level = Reader, nik = 030401-202205-0010, partner = Keluarga Testing Mail, user_nama = Opusisv, user_email = testing.mail@mailinator.com, user_email_status = 0, user_phone = 0, user_status = Aktif', 'Belum ada data', 1, '2022-05-26 17:38:04'),
(567, 'Data Member', 273, 'Mengubah isi data sebelumnya menjadi id = 52, nama_depan = Opusisv, nama_belakang = Testing Mail, jenis_kelamin = 1, status = Aktif, photo = ', 'Isi data sebelumnya adalah id = 52, nama_depan = , nama_belakang = , jenis_kelamin = Tidak Diketahui, status = Aktif, photo = ', 2, '2022-05-26 17:38:04'),
(568, 'Data Member', 273, 'Menambah data baru dengan isi id = 234, level = Reader, nik = 030401-202205-0011, partner = Keluarga Testing Mail, user_nama = Opusisv, user_email = testing.ani@mailinator.com, user_email_status = 0, user_phone = 0, user_status = Aktif', 'Belum ada data', 1, '2022-05-26 17:38:33'),
(569, 'Data Member', 273, 'Mengubah isi data sebelumnya menjadi id = 52, nama_depan = Opusisv, nama_belakang = Testing Ani, jenis_kelamin = 2, status = Aktif, photo = ', 'Isi data sebelumnya adalah id = 52, nama_depan = , nama_belakang = , jenis_kelamin = Tidak Diketahui, status = Aktif, photo = ', 2, '2022-05-26 17:38:33'),
(570, 'Data Member', 273, 'Menambah data baru dengan isi profile = Opusisv Testing Ani, peristiwa_formal = Pernikahan, keterangan = bandung, tempat = as, tanggal_data_formal = 2022-01-01, status = Tidak Aktif', 'Belum ada data', 1, '2022-05-26 17:42:45'),
(571, 'Keluarga', 273, 'Menambah data baru dengan isi nama = Keluarga Hendro, lokasi = , no_telepon = , email = , status = Aktif', 'Belum ada data', 1, '2022-05-26 17:43:27'),
(572, 'Data Member', 273, 'Menambah data baru dengan isi id = 235, level = Reader, nik = 030401-202205-0012, partner = Keluarga Hendro, user_nama = Opusisv, user_email = hendro@mailinator.com, user_email_status = 0, user_phone = 0, user_status = Aktif', 'Belum ada data', 1, '2022-05-26 17:43:55'),
(573, 'Data Member', 273, 'Mengubah isi data sebelumnya menjadi id = 52, nama_depan = Opusisv, nama_belakang = Hendro, jenis_kelamin = 1, status = Aktif, photo = ', 'Isi data sebelumnya adalah id = 52, nama_depan = , nama_belakang = , jenis_kelamin = Tidak Diketahui, status = Aktif, photo = ', 2, '2022-05-26 17:43:55'),
(574, 'Data Member', 273, 'Menambah data baru dengan isi id = 236, level = Reader, nik = 030401-202205-0013, partner = Keluarga Hendro, user_nama = Opusisv, user_email = siti@mailinator.com, user_email_status = 0, user_phone = 0, user_status = Aktif', 'Belum ada data', 1, '2022-05-26 17:44:22'),
(575, 'Data Member', 273, 'Mengubah isi data sebelumnya menjadi id = 52, nama_depan = Opusisv, nama_belakang = Siti, jenis_kelamin = 2, status = Aktif, photo = ', 'Isi data sebelumnya adalah id = 52, nama_depan = , nama_belakang = , jenis_kelamin = Tidak Diketahui, status = Aktif, photo = ', 2, '2022-05-26 17:44:22'),
(576, 'Data Member', 273, 'Menambah data baru dengan isi profile = Opusisv Siti, peristiwa_formal = Pernikahan, keterangan = Pernikahan Agustus, tempat = Jakarta, tanggal_data_formal = 2021-08-10, status = Tidak Aktif', 'Belum ada data', 1, '2022-05-26 17:45:45'),
(577, 'Data Member', 273, 'Menambah data baru dengan isi profile = Opusisv Siti, peristiwa_formal = Tanggal Lahir, keterangan = akte kelahiran, tempat = bandung, tanggal_data_formal = 2022-01-01, status = Tidak Aktif', 'Belum ada data', 1, '2022-05-26 17:48:33'),
(578, 'Menu', 1, 'Mengubah isi data sebelumnya menjadi parent = Dashboard, menu_nama = Dashboard, menu_index = 1, menu_icon = far fa-circle, menu_url = admin/dashboard, menu_keterangan = -, menu_status = Aktif', 'Isi data sebelumnya adalah parent = Dashboard, menu_nama = Dashboard, menu_index = 1, menu_icon = far fa-circle, menu_url = dashboard, menu_keterangan = -, menu_status = Aktif', 2, '2022-05-28 13:10:29'),
(579, '', 1, 'Menghapus data lama', 'Isi data sebelumnya adalah menu = Dashboard, level = Super Admin', 3, '2022-05-28 13:41:10'),
(580, '', 1, 'Menambah data baru dengan isi menu = Dashboard, level = Super Admin', 'Belum ada data', 1, '2022-05-28 13:41:13'),
(581, 'Menu', 1, 'Mengubah isi data sebelumnya menjadi parent =  , menu_nama = Dashboard, menu_index = 1, menu_icon = fa fa-suitcase, menu_url = admin/dashboard, menu_keterangan = -, menu_status = Aktif', 'Isi data sebelumnya adalah parent = , menu_nama = Dashboard, menu_index = 1, menu_icon = fa fa-suitcase, menu_url = dashboard, menu_keterangan = -, menu_status = Aktif', 2, '2022-05-28 13:41:38'),
(582, 'Menu', 1, 'Mengubah isi data sebelumnya menjadi parent =  , menu_nama = Dashboard, menu_index = 1, menu_icon = fa fa-suitcase, menu_url = admin/dashboard, menu_keterangan = -, menu_status = Aktif', 'Isi data sebelumnya adalah parent = , menu_nama = Dashboard, menu_index = 1, menu_icon = fa fa-suitcase, menu_url = admin/dashboard, menu_keterangan = -, menu_status = Aktif', 2, '2022-05-28 13:41:50'),
(583, 'Menu', 1, 'Mengubah isi data sebelumnya menjadi parent =  , menu_nama = Dashboard, menu_index = 1, menu_icon = fa fa-suitcase, menu_url = admin/dashboard, menu_keterangan = -, menu_status = Aktif', 'Isi data sebelumnya adalah parent = , menu_nama = Dashboard, menu_index = 1, menu_icon = fa fa-suitcase, menu_url = admin/dashboard, menu_keterangan = -, menu_status = Aktif', 2, '2022-05-28 13:41:55'),
(584, 'Menu', 1, 'Mengubah isi data sebelumnya menjadi parent =  , menu_nama = Dashboard, menu_index = 1, menu_icon = fa fa-suitcase, menu_url = admin/dashboard, menu_keterangan = -, menu_status = Aktif', 'Isi data sebelumnya adalah parent = , menu_nama = Dashboard, menu_index = 1, menu_icon = fa fa-suitcase, menu_url = admin/dashboard, menu_keterangan = -, menu_status = Aktif', 2, '2022-05-28 13:42:06'),
(585, 'Menu', 1, 'Mengubah isi data sebelumnya menjadi parent =  , menu_nama = Dashboard, menu_index = 1, menu_icon = fa fa-suitcase, menu_url = admin/dashboard, menu_keterangan = -, menu_status = Aktif', 'Isi data sebelumnya adalah parent = , menu_nama = Dashboard, menu_index = 1, menu_icon = fa fa-suitcase, menu_url = admin/dashboard, menu_keterangan = -, menu_status = Aktif', 2, '2022-05-28 13:42:14'),
(586, 'Menu', 1, 'Mengubah isi data sebelumnya menjadi parent = Dashboard, menu_nama = Dashboard, menu_index = 1, menu_icon = far fa-circle, menu_url = admin/dashboard, menu_keterangan = -, menu_status = Aktif', 'Isi data sebelumnya adalah parent = Dashboard, menu_nama = Dashboard, menu_index = 1, menu_icon = far fa-circle, menu_url = admin/dashboard, menu_keterangan = -, menu_status = Aktif', 2, '2022-05-28 13:42:16'),
(587, 'Menu', 1, 'Mengubah isi data sebelumnya menjadi parent =  , menu_nama = Dashboard, menu_index = 1, menu_icon = fa fa-suitcase, menu_url = admin/dashboard, menu_keterangan = -, menu_status = Aktif', 'Isi data sebelumnya adalah parent = , menu_nama = Dashboard, menu_index = 1, menu_icon = fa fa-suitcase, menu_url = admin/dashboard, menu_keterangan = -, menu_status = Aktif', 2, '2022-05-28 13:42:55'),
(588, 'Menu', 1, 'Menghapus data lama', 'Isi data sebelumnya adalah parent = Dashboard, menu_nama = Dashboard, menu_index = 1, menu_icon = far fa-circle, menu_url = admin/dashboard, menu_keterangan = -, menu_status = Aktif', 3, '2022-05-28 13:43:28'),
(589, 'Menu', 1, 'Menghapus data lama', 'Isi data sebelumnya adalah parent = Dashboard, menu_nama = Report, menu_index = 2, menu_icon = far fa-circle, menu_url = dashboard/report, menu_keterangan = -, menu_status = Aktif', 3, '2022-05-28 13:43:31'),
(590, 'Term Management', 1, 'Mengubah isi data sebelumnya menjadi menu = Dashboard a, nama = Dashboard, keterangan = -, status = Aktif', 'Isi data sebelumnya adalah menu = Dashboard a, nama = Home, -, status = Aktif', 2, '2022-05-28 13:48:49'),
(591, 'Menu', 1, 'Menambah data baru dengan isi parent =  , menu_nama = Resource, menu_index = 2, menu_icon = fas fa-save, menu_url = #, menu_keterangan = -, menu_status = Aktif', 'Belum ada data', 1, '2022-05-28 14:34:15'),
(592, 'Menu', 1, 'Menambah data baru dengan isi parent = Dashboard, menu_nama = Resource, menu_index = 2, menu_icon = fas fa-save, menu_url = #, menu_keterangan = -, menu_status = Aktif', 'Belum ada data', 1, '2022-05-28 14:35:39'),
(593, 'Menu', 1, 'Mengubah isi data sebelumnya menjadi parent =  , menu_nama = Resource, menu_index = 2, menu_icon = fas fa-save, menu_url = #, menu_keterangan = -, menu_status = Aktif', 'Isi data sebelumnya adalah parent = Dashboard, menu_nama = Resource, menu_index = 2, menu_icon = fas fa-save, menu_url = #, menu_keterangan = -, menu_status = Aktif', 2, '2022-05-28 14:35:48'),
(594, 'Menu', 1, 'Mengubah isi data sebelumnya menjadi parent = , menu_nama = Resource, menu_index = 2, menu_icon = fas fa-save, menu_url = #, menu_keterangan = -, menu_status = Aktif', 'Isi data sebelumnya adalah parent = , menu_nama = Resource, menu_index = 2, menu_icon = fas fa-save, menu_url = #, menu_keterangan = -, menu_status = Aktif', 2, '2022-05-28 14:37:40'),
(595, 'Menu', 1, 'Menghapus data lama', 'Isi data sebelumnya adalah parent = , menu_nama = Resource, menu_index = 2, menu_icon = fas fa-save, menu_url = #, menu_keterangan = -, menu_status = Aktif', 3, '2022-05-28 14:39:20'),
(596, '', 1, 'Menambah data baru dengan isi menu = Resource, level = Super Admin', 'Belum ada data', 1, '2022-05-28 14:39:27'),
(597, '', 1, 'Menghapus data lama', 'Isi data sebelumnya adalah menu = Hak Akses, level = Super Admin', 3, '2022-05-28 14:39:51'),
(598, 'Menu', 1, 'Menambah data baru dengan isi parent = Resource, menu_nama = Ebook, menu_index = 1, menu_icon = far fa-circle, menu_url = admin/resource/ebook, menu_keterangan = -, menu_status = Aktif', 'Belum ada data', 1, '2022-05-28 14:41:45'),
(599, 'Menu', 1, 'Menambah data baru dengan isi parent = Resource, menu_nama = Video, menu_index = 2, menu_icon = far fa-circle, menu_url = admin/resource/video, menu_keterangan = -, menu_status = Aktif', 'Belum ada data', 1, '2022-05-28 14:42:09'),
(600, 'Menu', 1, 'Menambah data baru dengan isi parent = Dashboard, menu_nama = Audiobooks, menu_index = 3, menu_icon = fa fa-suitcase, menu_url = admin/resource/audiobooks, menu_keterangan = -, menu_status = Aktif', 'Belum ada data', 1, '2022-05-28 14:42:31'),
(601, 'Menu', 1, 'Menambah data baru dengan isi parent = Resource, menu_nama = Podcast, menu_index = 4, menu_icon = fa fa-suitcase, menu_url = admin/resource/podcast, menu_keterangan = -, menu_status = Aktif', 'Belum ada data', 1, '2022-05-28 14:42:59');
INSERT INTO `activity_log` (`id`, `modul`, `by`, `data_baru`, `data_lama`, `jenis_perubahan`, `created_at`) VALUES
(602, 'Menu', 1, 'Menambah data baru dengan isi parent = Resource, menu_nama = Articles, menu_index = 5, menu_icon = far fa-circle, menu_url = admin/resource/articles, menu_keterangan = -, menu_status = Aktif', 'Belum ada data', 1, '2022-05-28 14:43:25'),
(603, 'Menu', 1, 'Menambah data baru dengan isi parent = Resource, menu_nama = Music, menu_index = 6, menu_icon = fa fa-suitcase, menu_url = admin/resource/music, menu_keterangan = -, menu_status = Aktif', 'Belum ada data', 1, '2022-05-28 14:43:47'),
(604, '', 1, 'Menambah data baru dengan isi menu = Ebook, level = Super Admin', 'Belum ada data', 1, '2022-05-28 14:44:28'),
(605, '', 1, 'Menambah data baru dengan isi menu = Video, level = Super Admin', 'Belum ada data', 1, '2022-05-28 14:44:29'),
(606, '', 1, 'Menambah data baru dengan isi menu = Podcast, level = Super Admin', 'Belum ada data', 1, '2022-05-28 14:44:31'),
(607, '', 1, 'Menambah data baru dengan isi menu = Articles, level = Super Admin', 'Belum ada data', 1, '2022-05-28 14:44:31'),
(608, '', 1, 'Menambah data baru dengan isi menu = Music, level = Super Admin', 'Belum ada data', 1, '2022-05-28 14:44:32'),
(609, 'Menu', 1, 'Menambah data baru dengan isi parent =  , menu_nama = Categories, menu_index = 3, menu_icon = fas fa-chart-network, menu_url = admin/categories, menu_keterangan = -, menu_status = Aktif', 'Belum ada data', 1, '2022-05-28 14:47:19'),
(610, 'Menu', 1, 'Menambah data baru dengan isi parent =  , menu_nama = Categories, menu_index = 3, menu_icon = fas fa-chart-network, menu_url = admin/categories, menu_keterangan = -, menu_status = Aktif', 'Belum ada data', 1, '2022-05-28 14:47:54'),
(611, 'Menu', 1, 'Menambah data baru dengan isi parent = , menu_nama = Categories, menu_index = 3, menu_icon = fas fa-chart-network, menu_url = admin/categories, menu_keterangan = -, menu_status = Aktif', 'Belum ada data', 1, '2022-05-28 14:49:31'),
(612, 'Menu', 1, 'Mengubah isi data sebelumnya menjadi parent = , menu_nama = Categories, menu_index = 3, menu_icon = fas fa-project-diagram, menu_url = admin/categories, menu_keterangan = -, menu_status = Aktif', 'Isi data sebelumnya adalah parent = , menu_nama = Categories, menu_index = 3, menu_icon = fas fa-chart-network, menu_url = admin/categories, menu_keterangan = -, menu_status = Aktif', 2, '2022-05-28 14:50:17'),
(613, 'Menu', 1, 'Menghapus data lama', 'Isi data sebelumnya adalah parent = , menu_nama = Categories, menu_index = 3, menu_icon = fas fa-chart-network, menu_url = admin/categories, menu_keterangan = -, menu_status = Aktif', 3, '2022-05-28 14:50:20'),
(614, 'Menu', 1, 'Menghapus data lama', 'Isi data sebelumnya adalah parent = , menu_nama = Categories, menu_index = 3, menu_icon = fas fa-chart-network, menu_url = admin/categories, menu_keterangan = -, menu_status = Aktif', 3, '2022-05-28 14:50:23'),
(615, '', 1, 'Menambah data baru dengan isi menu = Categories, level = Super Admin', 'Belum ada data', 1, '2022-05-28 14:50:30'),
(616, 'Menu', 1, 'Menambah data baru dengan isi parent = , menu_nama = Transaction, menu_index = 4, menu_icon = fas fa-receipt, menu_url = admin/transaction, menu_keterangan = -, menu_status = Aktif', 'Belum ada data', 1, '2022-05-28 14:52:09'),
(617, '', 1, 'Menambah data baru dengan isi menu = Transaction, level = Super Admin', 'Belum ada data', 1, '2022-05-28 14:52:19'),
(618, 'Menu', 1, 'Mengubah isi data sebelumnya menjadi parent = 1, menu_nama = Audiobooks, menu_index = 3, menu_icon = fa fa-suitcase, menu_url = admin/resource/audiobooks, menu_keterangan = -, menu_status = Aktif', 'Isi data sebelumnya adalah parent = Dashboard, menu_nama = Audiobooks, menu_index = 3, menu_icon = fa fa-suitcase, menu_url = admin/resource/audiobooks, menu_keterangan = -, menu_status = Aktif', 2, '2022-05-28 20:23:40'),
(619, '', 1, 'Menambah data baru dengan isi menu = Audiobooks, level = Super Admin', 'Belum ada data', 1, '2022-05-28 20:23:58'),
(620, 'Menu', 1, 'Menambah data baru dengan isi parent = , menu_nama = Priceing, menu_index = 5, menu_icon = fas fa-dollar-sign, menu_url = admin/priceing, menu_keterangan = -, menu_status = Aktif', 'Belum ada data', 1, '2022-05-28 21:34:55'),
(621, '', 1, 'Menambah data baru dengan isi menu = Priceing, level = Super Admin', 'Belum ada data', 1, '2022-05-28 21:35:07'),
(622, 'Menu', 1, 'Mengubah isi data sebelumnya menjadi parent = , menu_nama = Pricing, menu_index = 5, menu_icon = fas fa-dollar-sign, menu_url = admin/pricing, menu_keterangan = -, menu_status = Aktif', 'Isi data sebelumnya adalah parent = , menu_nama = Priceing, menu_index = 5, menu_icon = fas fa-dollar-sign, menu_url = admin/priceing, menu_keterangan = -, menu_status = Aktif', 2, '2022-05-28 21:36:35'),
(623, 'Menu', 1, 'Mengubah isi data sebelumnya menjadi parent = , menu_nama = User role, menu_index = 7, menu_icon = far fa-circle, menu_url = pengaturan/level, menu_keterangan = -, menu_status = Aktif', 'Isi data sebelumnya adalah parent = Users, menu_nama = Level, menu_index = 7, menu_icon = far fa-circle, menu_url = pengaturan/level, menu_keterangan = -, menu_status = Aktif', 2, '2022-05-30 03:28:02'),
(624, 'Term Management', 1, 'Mengubah isi data sebelumnya menjadi menu = User role, nama = User role, keterangan = -, status = Aktif', 'Isi data sebelumnya adalah menu = User role, nama = Level, -, status = Aktif', 2, '2022-05-30 03:28:28'),
(625, 'Menu', 1, 'Menambah data baru dengan isi parent = , menu_nama = Member, menu_index = 1, menu_icon = fas fa-list, menu_url = 3, menu_keterangan = -, menu_status = Aktif', 'Belum ada data', 1, '2022-05-30 03:32:08'),
(626, 'Menu', 1, 'Menambah data baru dengan isi parent = 1, menu_nama = Individual, menu_index = 1, menu_icon = far fa-circle, menu_url = admin/member/individual, menu_keterangan = -, menu_status = Aktif', 'Belum ada data', 1, '2022-05-30 03:32:51'),
(627, 'Menu', 1, 'Menambah data baru dengan isi parent = 1, menu_nama = Organization, menu_index = 2, menu_icon = far fa-circle, menu_url = admin/member/organization, menu_keterangan = -, menu_status = Aktif', 'Belum ada data', 1, '2022-05-30 03:33:38'),
(628, '', 1, 'Menambah data baru dengan isi menu = Member, level = Super Admin', 'Belum ada data', 1, '2022-05-30 03:36:38'),
(629, '', 1, 'Menambah data baru dengan isi menu = Individual, level = Super Admin', 'Belum ada data', 1, '2022-05-30 03:36:39'),
(630, '', 1, 'Menambah data baru dengan isi menu = Organization, level = Super Admin', 'Belum ada data', 1, '2022-05-30 03:36:40'),
(631, 'Menu', 1, 'Mengubah isi data sebelumnya menjadi parent = , menu_nama = Member, menu_index = 8, menu_icon = fas fa-list, menu_url = 3, menu_keterangan = -, menu_status = Aktif', 'Isi data sebelumnya adalah parent = , menu_nama = Member, menu_index = 1, menu_icon = fas fa-list, menu_url = 3, menu_keterangan = -, menu_status = Aktif', 2, '2022-05-30 03:37:06'),
(632, 'Menu', 1, 'Mengubah isi data sebelumnya menjadi parent = , menu_nama = Member, menu_index = 6, menu_icon = fas fa-list, menu_url = 3, menu_keterangan = -, menu_status = Aktif', 'Isi data sebelumnya adalah parent = , menu_nama = Member, menu_index = 8, menu_icon = fas fa-list, menu_url = 3, menu_keterangan = -, menu_status = Aktif', 2, '2022-05-30 03:37:18'),
(633, 'Menu', 1, 'Mengubah isi data sebelumnya menjadi parent = , menu_nama = Member, menu_index = 7, menu_icon = fas fa-list, menu_url = 3, menu_keterangan = -, menu_status = Aktif', 'Isi data sebelumnya adalah parent = , menu_nama = Member, menu_index = 6, menu_icon = fas fa-list, menu_url = 3, menu_keterangan = -, menu_status = Aktif', 2, '2022-05-30 03:37:34'),
(634, 'Menu', 1, 'Mengubah isi data sebelumnya menjadi parent = , menu_nama = User role, menu_index = 7, menu_icon = fas fa-user-check, menu_url = pengaturan/level, menu_keterangan = -, menu_status = Aktif', 'Isi data sebelumnya adalah parent = , menu_nama = User role, menu_index = 7, menu_icon = far fa-circle, menu_url = pengaturan/level, menu_keterangan = -, menu_status = Aktif', 2, '2022-05-30 03:38:43'),
(635, 'Menu', 1, 'Mengubah isi data sebelumnya menjadi parent = , menu_nama = Member, menu_index = 6, menu_icon = fas fa-list, menu_url = 3, menu_keterangan = -, menu_status = Aktif', 'Isi data sebelumnya adalah parent = , menu_nama = Member, menu_index = 7, menu_icon = fas fa-list, menu_url = 3, menu_keterangan = -, menu_status = Aktif', 2, '2022-05-30 03:39:02');

-- --------------------------------------------------------

--
-- Table structure for table `alamat`
--

CREATE TABLE `alamat` (
  `id` int(11) NOT NULL,
  `id_profile` int(11) NOT NULL,
  `id_jenis_alamat` int(11) NOT NULL,
  `alamat` text DEFAULT NULL,
  `domisili` varchar(100) NOT NULL,
  `tanggal_mulai` date DEFAULT NULL,
  `tanggal_selesai` date DEFAULT NULL,
  `status` char(1) NOT NULL COMMENT '0 = dibuat, 1 = aktif, 2 = tidak aktif',
  `created_at` date DEFAULT NULL,
  `updated_at` date DEFAULT NULL,
  `deleted_at` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `alamat`
--

INSERT INTO `alamat` (`id`, `id_profile`, `id_jenis_alamat`, `alamat`, `domisili`, `tanggal_mulai`, `tanggal_selesai`, `status`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 178, 2, 'Kav. POLRI Blok F No. 1414 ', 'Kav. POLRI Blok F No. 1414 ', '2022-05-19', NULL, '1', '2022-05-19', NULL, NULL),
(2, 179, 2, 'Kav. POLRI Blok F No. 1414', 'Kav. POLRI Blok F No. 1414', '2022-05-19', NULL, '1', '2022-05-19', NULL, NULL),
(3, 180, 2, '10 Flora Rd', '10 Flora Rd', '2022-05-19', NULL, '1', '2022-05-19', NULL, NULL),
(4, 181, 2, '10 Flora Rd. ', '10 Flora Rd. ', '2022-05-19', NULL, '1', '2022-05-19', NULL, NULL),
(5, 183, 2, 'Kav. POLRI Blok F No. 1414 ', 'Kav. POLRI Blok F No. 1414 ', '2022-05-19', NULL, '1', '2022-05-19', NULL, NULL),
(6, 184, 2, 'Kav. POLRI Blok F No. 1414', 'Kav. POLRI Blok F No. 1414', '2022-05-19', NULL, '1', '2022-05-19', NULL, NULL),
(7, 185, 2, '10 Flora Rd', '10 Flora Rd', '2022-05-19', NULL, '1', '2022-05-19', NULL, NULL),
(8, 186, 2, '10 Flora Rd. ', '10 Flora Rd. ', '2022-05-19', NULL, '1', '2022-05-19', NULL, NULL),
(9, 187, 2, 'Kav. POLRI Blok F No. 1414 ', 'Kav. POLRI Blok F No. 1414 ', '2022-05-19', NULL, '1', '2022-05-19', NULL, NULL),
(10, 188, 2, 'Kav. POLRI Blok F No. 1414', 'Kav. POLRI Blok F No. 1414', '2022-05-19', NULL, '1', '2022-05-19', NULL, NULL),
(11, 189, 2, '10 Flora Rd', '10 Flora Rd', '2022-05-19', NULL, '1', '2022-05-19', NULL, NULL),
(12, 190, 2, '10 Flora Rd. ', '10 Flora Rd. ', '2022-05-19', NULL, '1', '2022-05-19', NULL, NULL),
(13, 191, 2, 'Kav. POLRI Blok F Jelambar Jakarta Barat', 'Kav. POLRI Blok F Jelambar Jakarta Barat', '2022-05-23', NULL, '1', '2022-05-23', NULL, NULL),
(14, 192, 2, 'Kav. POLRI Blok F Jelambar Jakarta Barat', 'Kav. POLRI Blok F Jelambar Jakarta Barat', '2022-05-23', NULL, '1', '2022-05-23', NULL, NULL),
(15, 193, 2, 'Komp. Taman Semanan Indah Blok C Duri Kosambi ', 'Komp. Taman Semanan Indah Blok C Duri Kosambi ', '2022-05-23', NULL, '1', '2022-05-23', NULL, NULL),
(16, 194, 2, 'Komp. Taman Semanan Indah Blok C Duri Kosambi ', 'Komp. Taman Semanan Indah Blok C Duri Kosambi ', '2022-05-23', NULL, '1', '2022-05-23', NULL, NULL),
(17, 195, 2, 'Komp. Taman Semanan Indah Blok C Duri Kosambi ', 'Komp. Taman Semanan Indah Blok C Duri Kosambi ', '2022-05-23', NULL, '1', '2022-05-23', NULL, NULL),
(18, 196, 2, 'Jl. Taman Katalia Tomang Raya Jakarta Barat', 'Jl. Taman Katalia Tomang Raya Jakarta Barat', '2022-05-23', NULL, '1', '2022-05-23', NULL, NULL),
(19, 197, 2, 'Jl. Taman Katalia Tomang Raya Jakarta Barat', 'Jl. Taman Katalia Tomang Raya Jakarta Barat', '2022-05-23', NULL, '1', '2022-05-23', NULL, NULL),
(20, 198, 2, 'Jl. Taman Katalia Tomang Raya Jakarta Barat', 'Jl. Taman Katalia Tomang Raya Jakarta Barat', '2022-05-23', NULL, '1', '2022-05-23', NULL, NULL),
(21, 199, 2, 'Jl. Taman Katalia Tomang Raya Jakarta Barat', 'Jl. Taman Katalia Tomang Raya Jakarta Barat', '2022-05-23', NULL, '1', '2022-05-23', NULL, NULL),
(22, 200, 2, 'Jl. Taman Katalia Tomang Raya Jakarta Barat', 'Jl. Taman Katalia Tomang Raya Jakarta Barat', '2022-05-23', NULL, '1', '2022-05-23', NULL, NULL),
(23, 201, 2, 'Jl. Petojo VIY III No. 5 Jakarta Pusat', 'Jl. Petojo VIY III No. 5 Jakarta Pusat', '2022-05-23', NULL, '1', '2022-05-23', NULL, NULL),
(24, 202, 2, 'Jl. Petojo VIY III No. 5 Jakarta Pusat', 'Jl. Petojo VIY III No. 5 Jakarta Pusat', '2022-05-23', NULL, '1', '2022-05-23', NULL, NULL),
(25, 203, 2, 'Jl. Mampang Prapatan 1 Tegal Parang Jak-Sel', 'Jl. Mampang Prapatan 1 Tegal Parang Jak-Sel', '2022-05-23', NULL, '1', '2022-05-23', NULL, NULL),
(26, 204, 2, 'Jl. Mampang Prapatan 1 Tegal Parang Jak-Sel', 'Jl. Mampang Prapatan 1 Tegal Parang Jak-Sel', '2022-05-23', NULL, '1', '2022-05-23', NULL, NULL),
(27, 205, 2, 'Jl. Mampang Prapatan 1 Tegal Parang Jak-Sel', 'Jl. Mampang Prapatan 1 Tegal Parang Jak-Sel', '2022-05-23', NULL, '1', '2022-05-23', NULL, NULL),
(28, 206, 2, 'Jl. Mampang Prapatan 1 Tegal Parang Jak-Sel', 'Jl. Mampang Prapatan 1 Tegal Parang Jak-Sel', '2022-05-23', NULL, '1', '2022-05-23', NULL, NULL),
(29, 207, 2, 'Jl. KS Tubun I/2 Kota Bambu Selatan Jakarta Barat', 'Jl. KS Tubun I/2 Kota Bambu Selatan Jakarta Barat', '2022-05-23', NULL, '1', '2022-05-23', NULL, NULL),
(30, 208, 2, 'Jl. KS Tubun I/2 Kota Bambu Selatan Jakarta Barat', 'Jl. KS Tubun I/2 Kota Bambu Selatan Jakarta Barat', '2022-05-23', NULL, '1', '2022-05-23', NULL, NULL),
(31, 209, 2, 'Jl. KS Tubun I/2 Kota Bambu Selatan Jakarta Barat', 'Jl. KS Tubun I/2 Kota Bambu Selatan Jakarta Barat', '2022-05-23', NULL, '1', '2022-05-23', NULL, NULL),
(32, 210, 2, 'Jl. KS Tubun I/2 Kota Bambu Selatan Jakarta Barat', 'Jl. KS Tubun I/2 Kota Bambu Selatan Jakarta Barat', '2022-05-23', NULL, '1', '2022-05-23', NULL, NULL),
(33, 211, 2, 'Jl. KS Tubun I/2 Kota Bambu Selatan Jakarta Barat', 'Jl. KS Tubun I/2 Kota Bambu Selatan Jakarta Barat', '2022-05-23', NULL, '1', '2022-05-23', NULL, NULL),
(34, 212, 2, '10 Flora Rd.  Azalea Park Condominium, Singapore(509729)', '10 Flora Rd.  Azalea Park Condominium, Singapore(509729)', '2022-05-23', NULL, '1', '2022-05-23', NULL, NULL),
(35, 213, 2, '10 Flora Rd.  Azalea Park Condominium, Singapore(509729)', '10 Flora Rd.  Azalea Park Condominium, Singapore(509729)', '2022-05-23', NULL, '1', '2022-05-23', NULL, NULL),
(36, 214, 2, '10 Mount Sophia , Singapore(228459)', '10 Mount Sophia , Singapore(228459)', '2022-05-23', NULL, '1', '2022-05-23', NULL, NULL),
(37, 215, 2, '10G Braddell Hill , S 579726 , Singapore(579726)', '10G Braddell Hill , S 579726 , Singapore(579726)', '2022-05-23', NULL, '1', '2022-05-23', NULL, NULL),
(38, 216, 2, '118C Jl, Membina,  , Singapore(163118)', '118C Jl, Membina,  , Singapore(163118)', '2022-05-23', NULL, '1', '2022-05-23', NULL, NULL),
(39, 217, 2, 'Whitley Rd. - CJC Hostel , Singapore(297821)', 'Whitley Rd. - CJC Hostel , Singapore(297821)', '2022-05-23', NULL, '1', '2022-05-23', NULL, NULL),
(40, 218, 2, '14A Jalan Tempua , Singapore(298992)', '14A Jalan Tempua , Singapore(298992)', '2022-05-23', NULL, '1', '2022-05-23', NULL, NULL),
(41, 219, 2, '14A Jalan Tempua , Singapore(298992)', '14A Jalan Tempua , Singapore(298992)', '2022-05-23', NULL, '1', '2022-05-23', NULL, NULL),
(42, 220, 2, '15 Admore Park  , Singapore(259959)', '15 Admore Park  , Singapore(259959)', '2022-05-23', NULL, '1', '2022-05-23', NULL, NULL),
(43, 221, 2, '15 Ang Mo Kio Ave 9,  Far Horizon Gardens, Singapore(569765)', '15 Ang Mo Kio Ave 9,  Far Horizon Gardens, Singapore(569765)', '2022-05-23', NULL, '1', '2022-05-23', NULL, NULL),
(44, 222, 2, '152 Haig Rd,  Haig Court , Singapore(438791)', '152 Haig Rd,  Haig Court , Singapore(438791)', '2022-05-23', NULL, '1', '2022-05-23', NULL, NULL),
(45, 223, 2, '152 Haig Rd, #16-01, Haig Court , Singapore(438791)', '152 Haig Rd, #16-01, Haig Court , Singapore(438791)', '2022-05-23', NULL, '1', '2022-05-23', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `client_company`
--

CREATE TABLE `client_company` (
  `id` int(11) NOT NULL,
  `nama` varchar(255) NOT NULL,
  `alamat` varchar(255) DEFAULT NULL,
  `no_telepon` varchar(20) DEFAULT NULL,
  `email` varchar(100) NOT NULL,
  `id_resiko` int(11) DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  `status` char(1) NOT NULL COMMENT '0 = dibuat, 1 = aktif, 2 = tidak aktif',
  `created_at` date DEFAULT NULL,
  `updated_at` date DEFAULT NULL,
  `deleted_at` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `client_company`
--

INSERT INTO `client_company` (`id`, `nama`, `alamat`, `no_telepon`, `email`, `id_resiko`, `remark`, `status`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'BUMN1', 'Bandung', '0812512578', 'karya@gmail.com', 1, '', '1', '2021-09-28', '2021-10-06', NULL),
(2, 'BUMN2', 'Jakarta', '1727374', 'admin@bumn2.com', 1, '-', '1', '2021-10-06', '2021-10-08', '2021-10-06'),
(3, '1231', '-', '23234', 'ss@gmail.com', 1, '-', '3', '2021-10-08', '2021-10-08', '2021-10-08'),
(4, 'BUMN3', '-', '082131231', 'bumn3@gmail.com', 1, '-', '3', '2021-10-08', '2021-10-08', '2021-10-08'),
(5, 'BUMN3', 'BUMN3', '0851258125', 'BUMN@GMAIL.COM', 6, 'Penjelasan di sini', '3', '2021-10-11', '2021-10-11', '2021-10-11'),
(6, 'BUMN 3', 'JAKARTA, INDONESIA', '0851258125', 'bumn3@gmail.com', 3, 'Penjelasan di sini', '1', '2021-10-11', '2022-01-11', NULL),
(7, 'BUMN4', 'Indonesia', '81234', 'bumn4@gmail.com', 8, 'eit', '1', '2021-10-21', NULL, NULL),
(8, 'BUMN7', 'cimahi', '08231312', 'bumn5@mailinator.com', 1, '-', '1', '2021-11-01', '2021-11-01', NULL),
(9, 'BUMN9', '-', '021313', 'bumn9@mailinator.com', 2, '-', '1', '2021-12-23', '2021-12-23', NULL),
(10, 'BUMN 10', '-', '08123131', 'bumn10@mailinator.com', 1, '-', '1', '2022-01-04', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `contact`
--

CREATE TABLE `contact` (
  `id` int(11) NOT NULL,
  `id_profile` int(11) DEFAULT NULL,
  `id_tipe_contact` int(11) DEFAULT NULL,
  `keterangan` varchar(255) DEFAULT NULL,
  `tanggal` date DEFAULT NULL,
  `status` char(1) NOT NULL COMMENT '0 = dibuat, 1 = aktif, 2 = tidak aktif',
  `created_at` date DEFAULT NULL,
  `updated_at` date DEFAULT NULL,
  `deleted_at` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `contact`
--

INSERT INTO `contact` (`id`, `id_profile`, `id_tipe_contact`, `keterangan`, `tanggal`, `status`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 178, 3, '5658633', '2022-05-19', '1', '2022-05-19', NULL, NULL),
(2, 178, 2, '6282828383', '2022-05-19', '1', '2022-05-19', NULL, NULL),
(3, 178, 1, 'zai@mailinator.com', '2022-05-19', '1', '2022-05-19', NULL, NULL),
(4, 179, 2, '6282828383', '2022-05-19', '1', '2022-05-19', NULL, NULL),
(5, 179, 1, 'magda@mailinator.com', '2022-05-19', '1', '2022-05-19', NULL, NULL),
(6, 180, 3, '62454340', '2022-05-19', '1', '2022-05-19', NULL, NULL),
(7, 180, 2, '85188779', '2022-05-19', '1', '2022-05-19', NULL, NULL),
(8, 180, 1, 'roi@mailinator.com', '2022-05-19', '1', '2022-05-19', NULL, NULL),
(9, 181, 3, '62454340', '2022-05-19', '1', '2022-05-19', NULL, NULL),
(10, 181, 2, '85188780', '2022-05-19', '1', '2022-05-19', NULL, NULL),
(11, 181, 1, 'yuli@mailinator.com', '2022-05-19', '1', '2022-05-19', NULL, NULL),
(12, 183, 3, '5658633', '2022-05-19', '1', '2022-05-19', NULL, NULL),
(13, 183, 2, '6282828383', '2022-05-19', '1', '2022-05-19', NULL, NULL),
(14, 183, 1, 'zai@mailinator.com', '2022-05-19', '1', '2022-05-19', NULL, NULL),
(15, 184, 2, '6282828383', '2022-05-19', '1', '2022-05-19', NULL, NULL),
(16, 184, 1, 'magda@mailinator.com', '2022-05-19', '1', '2022-05-19', NULL, NULL),
(17, 185, 3, '62454340', '2022-05-19', '1', '2022-05-19', NULL, NULL),
(18, 185, 2, '85188779', '2022-05-19', '1', '2022-05-19', NULL, NULL),
(19, 185, 1, 'roi@mailinator.com', '2022-05-19', '1', '2022-05-19', NULL, NULL),
(20, 186, 3, '62454340', '2022-05-19', '1', '2022-05-19', NULL, NULL),
(21, 186, 2, '85188780', '2022-05-19', '1', '2022-05-19', NULL, NULL),
(22, 186, 1, 'yuli@mailinator.com', '2022-05-19', '1', '2022-05-19', NULL, NULL),
(23, 187, 3, '5658633', '2022-05-19', '1', '2022-05-19', NULL, NULL),
(24, 187, 2, '6282828383', '2022-05-19', '1', '2022-05-19', NULL, NULL),
(25, 187, 1, 'zai@mailinator.com', '2022-05-19', '1', '2022-05-19', NULL, NULL),
(26, 188, 2, '6282828383', '2022-05-19', '1', '2022-05-19', NULL, NULL),
(27, 188, 1, 'magda@mailinator.com', '2022-05-19', '1', '2022-05-19', NULL, NULL),
(28, 189, 3, '62454340', '2022-05-19', '1', '2022-05-19', NULL, NULL),
(29, 189, 2, '85188779', '2022-05-19', '1', '2022-05-19', NULL, NULL),
(30, 189, 1, 'roi@mailinator.com', '2022-05-19', '1', '2022-05-19', NULL, NULL),
(31, 190, 3, '62454340', '2022-05-19', '1', '2022-05-19', NULL, NULL),
(32, 190, 2, '85188780', '2022-05-19', '1', '2022-05-19', NULL, NULL),
(33, 190, 1, 'yuli@mailinator.com', '2022-05-19', '1', '2022-05-19', NULL, NULL),
(34, 191, 3, '5658633', '2022-05-23', '1', '2022-05-23', NULL, NULL),
(35, 196, 3, '0217335073', '2022-05-23', '1', '2022-05-23', NULL, NULL),
(36, 212, 3, '62454342', '2022-05-23', '1', '2022-05-23', NULL, NULL),
(37, 212, 2, '85188779 (Ibu)', '2022-05-23', '1', '2022-05-23', NULL, NULL),
(38, 212, 1, 'lone1205@hotmail.com', '2022-05-23', '1', '2022-05-23', NULL, NULL),
(39, 213, 3, '62454342', '2022-05-23', '1', '2022-05-23', NULL, NULL),
(40, 213, 2, '85188779', '2022-05-23', '1', '2022-05-23', NULL, NULL),
(41, 214, 3, '62387112', '2022-05-23', '1', '2022-05-23', NULL, NULL),
(42, 214, 2, '93953429', '2022-05-23', '1', '2022-05-23', NULL, NULL),
(43, 215, 3, '62568590', '2022-05-23', '1', '2022-05-23', NULL, NULL),
(44, 215, 2, '96606852', '2022-05-23', '1', '2022-05-23', NULL, NULL),
(45, 216, 3, '63764431', '2022-05-23', '1', '2022-05-23', NULL, NULL),
(46, 216, 2, '94232698', '2022-05-23', '1', '2022-05-23', NULL, NULL),
(47, 217, 3, '62569148', '2022-05-23', '1', '2022-05-23', NULL, NULL),
(48, 217, 2, '94334977', '2022-05-23', '1', '2022-05-23', NULL, NULL),
(49, 218, 3, '67346251', '2022-05-23', '1', '2022-05-23', NULL, NULL),
(50, 218, 2, '97624471', '2022-05-23', '1', '2022-05-23', NULL, NULL),
(51, 219, 3, '67323414', '2022-05-23', '1', '2022-05-23', NULL, NULL),
(52, 219, 2, '81085174', '2022-05-23', '1', '2022-05-23', NULL, NULL),
(53, 220, 3, '68363575', '2022-05-23', '1', '2022-05-23', NULL, NULL),
(54, 220, 2, '91086052', '2022-05-23', '1', '2022-05-23', NULL, NULL),
(55, 220, 1, 'claudia.iliadi@gmail.com', '2022-05-23', '1', '2022-05-23', NULL, NULL),
(56, 221, 3, '64583562', '2022-05-23', '1', '2022-05-23', NULL, NULL),
(57, 221, 2, '91800284', '2022-05-23', '1', '2022-05-23', NULL, NULL),
(58, 221, 1, 'whoislisa@hotmail.com', '2022-05-23', '1', '2022-05-23', NULL, NULL),
(59, 222, 3, '62477936', '2022-05-23', '1', '2022-05-23', NULL, NULL),
(60, 222, 2, '94572960', '2022-05-23', '1', '2022-05-23', NULL, NULL),
(61, 223, 3, '62477936', '2022-05-23', '1', '2022-05-23', NULL, NULL),
(62, 223, 2, '90603978', '2022-05-23', '1', '2022-05-23', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `dashboard_activation`
--

CREATE TABLE `dashboard_activation` (
  `id` int(11) NOT NULL,
  `spm` int(11) DEFAULT NULL,
  `repository` int(11) DEFAULT NULL,
  `p2pk` int(11) DEFAULT NULL,
  `aktifitas` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `dashboard_activation`
--

INSERT INTO `dashboard_activation` (`id`, `spm`, `repository`, `p2pk`, `aktifitas`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 2, 1, 2, 1, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `data_formal`
--

CREATE TABLE `data_formal` (
  `id` int(11) NOT NULL,
  `kode` varchar(30) NOT NULL,
  `kode_tahun_bulan` int(6) NOT NULL,
  `id_profile` int(11) NOT NULL,
  `dtm_peristiwa_id` int(11) DEFAULT NULL,
  `keterangan` text DEFAULT NULL,
  `tempat` varchar(50) DEFAULT NULL,
  `photo` varchar(255) NOT NULL,
  `tanggal_data_formal` date DEFAULT NULL,
  `keterangan_2` varchar(250) DEFAULT NULL,
  `rencana_tanggal` date DEFAULT NULL,
  `upload_hardcopy` varchar(250) DEFAULT NULL,
  `status` char(1) NOT NULL COMMENT '0 = dibuat, 1 = disetujui, 2 = tidak disetujui',
  `id_approval` int(11) DEFAULT NULL,
  `tanggal_approval` datetime DEFAULT NULL,
  `status_terlaksana` int(11) NOT NULL COMMENT '0 = belum terjadi, 1 = terlaksana, 2 tidak terlaksana',
  `nama_calon_1` varchar(200) DEFAULT NULL,
  `tanggal_lahir_calon_1` date DEFAULT NULL,
  `nama_calon_2` varchar(200) DEFAULT NULL,
  `tanggal_lahir_calon_2` date DEFAULT NULL,
  `id_institusi` int(11) DEFAULT NULL,
  `idjabatan` int(11) DEFAULT NULL,
  `created_at` date DEFAULT NULL,
  `updated_at` date DEFAULT NULL,
  `deleted_at` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `data_formal`
--

INSERT INTO `data_formal` (`id`, `kode`, `kode_tahun_bulan`, `id_profile`, `dtm_peristiwa_id`, `keterangan`, `tempat`, `photo`, `tanggal_data_formal`, `keterangan_2`, `rencana_tanggal`, `upload_hardcopy`, `status`, `id_approval`, `tanggal_approval`, `status_terlaksana`, `nama_calon_1`, `tanggal_lahir_calon_1`, `nama_calon_2`, `tanggal_lahir_calon_2`, `id_institusi`, `idjabatan`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, '', 0, 191, 2, NULL, NULL, '', '1978-09-16', NULL, NULL, NULL, '1', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2022-05-23', NULL, NULL),
(2, '', 0, 191, 3, NULL, NULL, '', '1978-09-16', NULL, NULL, NULL, '1', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2022-05-23', NULL, NULL),
(3, '', 0, 191, 7, NULL, NULL, '', '1978-09-16', NULL, NULL, NULL, '1', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2022-05-23', NULL, NULL),
(4, '', 0, 192, 2, NULL, NULL, '', '1950-03-01', NULL, NULL, NULL, '1', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2022-05-23', NULL, NULL),
(5, '', 0, 192, 3, NULL, NULL, '', '1963-12-15', NULL, NULL, NULL, '1', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2022-05-23', NULL, NULL),
(6, '', 0, 192, 7, NULL, NULL, '', '1978-09-16', NULL, NULL, NULL, '1', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2022-05-23', NULL, NULL),
(7, '', 0, 193, 2, NULL, NULL, '', '1964-12-06', NULL, NULL, NULL, '1', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2022-05-23', NULL, NULL),
(8, '', 0, 193, 3, NULL, NULL, '', '1995-05-07', NULL, NULL, NULL, '1', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2022-05-23', NULL, NULL),
(9, '', 0, 193, 7, NULL, NULL, '', '1995-07-14', NULL, NULL, NULL, '1', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2022-05-23', NULL, NULL),
(10, '', 0, 194, 2, NULL, NULL, '', '0000-00-00', NULL, NULL, NULL, '1', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2022-05-23', NULL, NULL),
(11, '', 0, 194, 3, NULL, NULL, '', '0000-00-00', NULL, NULL, NULL, '1', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2022-05-23', NULL, NULL),
(12, '', 0, 194, 7, NULL, NULL, '', '1995-07-14', NULL, NULL, NULL, '1', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2022-05-23', NULL, NULL),
(13, '', 0, 195, 2, NULL, NULL, '', '0000-00-00', NULL, NULL, NULL, '1', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2022-05-23', NULL, NULL),
(14, '', 0, 195, 3, NULL, NULL, '', '0000-00-00', NULL, NULL, NULL, '1', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2022-05-23', NULL, NULL),
(15, '', 0, 195, 7, NULL, NULL, '', '0000-00-00', NULL, NULL, NULL, '1', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2022-05-23', NULL, NULL),
(16, '', 0, 196, 2, NULL, NULL, '', '1967-02-12', NULL, NULL, NULL, '1', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2022-05-23', NULL, NULL),
(17, '', 0, 196, 3, NULL, NULL, '', '1983-04-10', NULL, NULL, NULL, '1', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2022-05-23', NULL, NULL),
(18, '', 0, 196, 7, NULL, NULL, '', '1995-07-06', NULL, NULL, NULL, '1', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2022-05-23', NULL, NULL),
(19, '', 0, 197, 2, NULL, NULL, '', '1972-07-09', NULL, NULL, NULL, '1', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2022-05-23', NULL, NULL),
(20, '', 0, 197, 3, NULL, NULL, '', '1988-04-17', NULL, NULL, NULL, '1', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2022-05-23', NULL, NULL),
(21, '', 0, 197, 7, NULL, NULL, '', '1995-07-06', NULL, NULL, NULL, '1', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2022-05-23', NULL, NULL),
(22, '', 0, 198, 2, NULL, NULL, '', '1997-11-09', NULL, NULL, NULL, '1', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2022-05-23', NULL, NULL),
(23, '', 0, 198, 3, NULL, NULL, '', '0000-00-00', NULL, NULL, NULL, '1', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2022-05-23', NULL, NULL),
(24, '', 0, 198, 7, NULL, NULL, '', '0000-00-00', NULL, NULL, NULL, '1', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2022-05-23', NULL, NULL),
(25, '', 0, 199, 2, NULL, NULL, '', '1999-11-07', NULL, NULL, NULL, '1', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2022-05-23', NULL, NULL),
(26, '', 0, 199, 3, NULL, NULL, '', '2016-06-12', NULL, NULL, NULL, '1', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2022-05-23', NULL, NULL),
(27, '', 0, 199, 7, NULL, NULL, '', '0000-00-00', NULL, NULL, NULL, '1', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2022-05-23', NULL, NULL),
(28, '', 0, 200, 2, NULL, NULL, '', '2003-08-03', NULL, NULL, NULL, '1', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2022-05-23', NULL, NULL),
(29, '', 0, 200, 3, NULL, NULL, '', '0000-00-00', NULL, NULL, NULL, '1', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2022-05-23', NULL, NULL),
(30, '', 0, 200, 7, NULL, NULL, '', '0000-00-00', NULL, NULL, NULL, '1', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2022-05-23', NULL, NULL),
(31, '', 0, 201, 2, NULL, NULL, '', '0000-00-00', NULL, NULL, NULL, '1', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2022-05-23', NULL, NULL),
(32, '', 0, 201, 3, NULL, NULL, '', '1943-11-30', NULL, NULL, NULL, '1', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2022-05-23', NULL, NULL),
(33, '', 0, 201, 7, NULL, NULL, '', '1966-12-15', NULL, NULL, NULL, '1', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2022-05-23', NULL, NULL),
(34, '', 0, 202, 2, NULL, NULL, '', '1939-10-29', NULL, NULL, NULL, '1', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2022-05-23', NULL, NULL),
(35, '', 0, 202, 3, NULL, NULL, '', '1960-11-06', NULL, NULL, NULL, '1', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2022-05-23', NULL, NULL),
(36, '', 0, 202, 7, NULL, NULL, '', '1966-12-15', NULL, NULL, NULL, '1', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2022-05-23', NULL, NULL),
(37, '', 0, 203, 2, NULL, NULL, '', '1970-12-26', NULL, NULL, NULL, '1', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2022-05-23', NULL, NULL),
(38, '', 0, 203, 3, NULL, NULL, '', '1987-03-08', NULL, NULL, NULL, '1', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2022-05-23', NULL, NULL),
(39, '', 0, 203, 7, NULL, NULL, '', '2007-01-27', NULL, NULL, NULL, '1', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2022-05-23', NULL, NULL),
(40, '', 0, 204, 2, NULL, NULL, '', '1977-09-04', NULL, NULL, NULL, '1', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2022-05-23', NULL, NULL),
(41, '', 0, 204, 3, NULL, NULL, '', '1993-09-12', NULL, NULL, NULL, '1', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2022-05-23', NULL, NULL),
(42, '', 0, 204, 7, NULL, NULL, '', '2007-01-27', NULL, NULL, NULL, '1', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2022-05-23', NULL, NULL),
(43, '', 0, 205, 2, NULL, NULL, '', '0000-00-00', NULL, NULL, NULL, '1', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2022-05-23', NULL, NULL),
(44, '', 0, 205, 3, NULL, NULL, '', '0000-00-00', NULL, NULL, NULL, '1', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2022-05-23', NULL, NULL),
(45, '', 0, 205, 7, NULL, NULL, '', '0000-00-00', NULL, NULL, NULL, '1', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2022-05-23', NULL, NULL),
(46, '', 0, 206, 2, NULL, NULL, '', '0000-00-00', NULL, NULL, NULL, '1', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2022-05-23', NULL, NULL),
(47, '', 0, 206, 3, NULL, NULL, '', '0000-00-00', NULL, NULL, NULL, '1', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2022-05-23', NULL, NULL),
(48, '', 0, 206, 7, NULL, NULL, '', '0000-00-00', NULL, NULL, NULL, '1', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2022-05-23', NULL, NULL),
(49, '', 0, 207, 2, NULL, NULL, '', '1951-01-12', NULL, NULL, NULL, '1', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2022-05-23', NULL, NULL),
(50, '', 0, 207, 3, NULL, NULL, '', '1970-12-03', NULL, NULL, NULL, '1', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2022-05-23', NULL, NULL),
(51, '', 0, 207, 7, NULL, NULL, '', '1978-08-07', NULL, NULL, NULL, '1', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2022-05-23', NULL, NULL),
(52, '', 0, 208, 2, NULL, NULL, '', '1958-01-12', NULL, NULL, NULL, '1', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2022-05-23', NULL, NULL),
(53, '', 0, 208, 3, NULL, NULL, '', '1978-12-03', NULL, NULL, NULL, '1', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2022-05-23', NULL, NULL),
(54, '', 0, 208, 7, NULL, NULL, '', '1978-08-07', NULL, NULL, NULL, '1', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2022-05-23', NULL, NULL),
(55, '', 0, 209, 2, NULL, NULL, '', '1986-03-02', NULL, NULL, NULL, '1', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2022-05-23', NULL, NULL),
(56, '', 0, 209, 3, NULL, NULL, '', '2001-05-06', NULL, NULL, NULL, '1', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2022-05-23', NULL, NULL),
(57, '', 0, 209, 7, NULL, NULL, '', '0000-00-00', NULL, NULL, NULL, '1', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2022-05-23', NULL, NULL),
(58, '', 0, 210, 2, NULL, NULL, '', '1996-08-04', NULL, NULL, NULL, '1', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2022-05-23', NULL, NULL),
(59, '', 0, 210, 3, NULL, NULL, '', '2001-05-06', NULL, NULL, NULL, '1', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2022-05-23', NULL, NULL),
(60, '', 0, 210, 7, NULL, NULL, '', '0000-00-00', NULL, NULL, NULL, '1', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2022-05-23', NULL, NULL),
(61, '', 0, 211, 2, NULL, NULL, '', '1996-08-04', NULL, NULL, NULL, '1', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2022-05-23', NULL, NULL),
(62, '', 0, 211, 3, NULL, NULL, '', '2001-05-06', NULL, NULL, NULL, '1', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2022-05-23', NULL, NULL),
(63, '', 0, 211, 7, NULL, NULL, '', '0000-00-00', NULL, NULL, NULL, '1', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2022-05-23', NULL, NULL),
(64, '', 0, 212, 2, NULL, NULL, '', '0000-00-00', NULL, NULL, NULL, '1', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2022-05-23', NULL, NULL),
(65, '', 0, 212, 3, NULL, NULL, '', '0000-00-00', NULL, NULL, NULL, '1', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2022-05-23', NULL, NULL),
(66, '', 0, 212, 7, NULL, NULL, '', '0000-00-00', NULL, NULL, NULL, '1', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2022-05-23', NULL, NULL),
(67, '', 0, 213, 2, NULL, NULL, '', '0000-00-00', NULL, NULL, NULL, '1', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2022-05-23', NULL, NULL),
(68, '', 0, 213, 3, NULL, NULL, '', '0000-00-00', NULL, NULL, NULL, '1', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2022-05-23', NULL, NULL),
(69, '', 0, 213, 7, NULL, NULL, '', '0000-00-00', NULL, NULL, NULL, '1', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2022-05-23', NULL, NULL),
(70, '', 0, 214, 2, NULL, NULL, '', '0000-00-00', NULL, NULL, NULL, '1', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2022-05-23', NULL, NULL),
(71, '', 0, 214, 3, NULL, NULL, '', '0000-00-00', NULL, NULL, NULL, '1', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2022-05-23', NULL, NULL),
(72, '', 0, 214, 7, NULL, NULL, '', '0000-00-00', NULL, NULL, NULL, '1', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2022-05-23', NULL, NULL),
(73, '', 0, 215, 2, NULL, NULL, '', '0000-00-00', NULL, NULL, NULL, '1', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2022-05-23', NULL, NULL),
(74, '', 0, 215, 3, NULL, NULL, '', '0000-00-00', NULL, NULL, NULL, '1', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2022-05-23', NULL, NULL),
(75, '', 0, 215, 7, NULL, NULL, '', '0000-00-00', NULL, NULL, NULL, '1', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2022-05-23', NULL, NULL),
(76, '', 0, 216, 2, NULL, NULL, '', '0000-00-00', NULL, NULL, NULL, '1', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2022-05-23', NULL, NULL),
(77, '', 0, 216, 3, NULL, NULL, '', '0000-00-00', NULL, NULL, NULL, '1', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2022-05-23', NULL, NULL),
(78, '', 0, 216, 7, NULL, NULL, '', '0000-00-00', NULL, NULL, NULL, '1', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2022-05-23', NULL, NULL),
(79, '', 0, 217, 2, NULL, NULL, '', '0000-00-00', NULL, NULL, NULL, '1', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2022-05-23', NULL, NULL),
(80, '', 0, 217, 3, NULL, NULL, '', '0000-00-00', NULL, NULL, NULL, '1', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2022-05-23', NULL, NULL),
(81, '', 0, 217, 7, NULL, NULL, '', '0000-00-00', NULL, NULL, NULL, '1', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2022-05-23', NULL, NULL),
(82, '', 0, 218, 2, NULL, NULL, '', '0000-00-00', NULL, NULL, NULL, '1', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2022-05-23', NULL, NULL),
(83, '', 0, 218, 3, NULL, NULL, '', '0000-00-00', NULL, NULL, NULL, '1', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2022-05-23', NULL, NULL),
(84, '', 0, 218, 7, NULL, NULL, '', '0000-00-00', NULL, NULL, NULL, '1', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2022-05-23', NULL, NULL),
(85, '', 0, 219, 2, NULL, NULL, '', '0000-00-00', NULL, NULL, NULL, '1', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2022-05-23', NULL, NULL),
(86, '', 0, 219, 3, NULL, NULL, '', '0000-00-00', NULL, NULL, NULL, '1', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2022-05-23', NULL, NULL),
(87, '', 0, 219, 7, NULL, NULL, '', '0000-00-00', NULL, NULL, NULL, '1', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2022-05-23', NULL, NULL),
(88, '', 0, 220, 2, NULL, NULL, '', '0000-00-00', NULL, NULL, NULL, '1', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2022-05-23', NULL, NULL),
(89, '', 0, 220, 3, NULL, NULL, '', '0000-00-00', NULL, NULL, NULL, '1', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2022-05-23', NULL, NULL),
(90, '', 0, 220, 7, NULL, NULL, '', '0000-00-00', NULL, NULL, NULL, '1', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2022-05-23', NULL, NULL),
(91, '', 0, 221, 2, NULL, NULL, '', '0000-00-00', NULL, NULL, NULL, '1', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2022-05-23', NULL, NULL),
(92, '', 0, 221, 3, NULL, NULL, '', '0000-00-00', NULL, NULL, NULL, '1', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2022-05-23', NULL, NULL),
(93, '', 0, 221, 7, NULL, NULL, '', '0000-00-00', NULL, NULL, NULL, '1', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2022-05-23', NULL, NULL),
(94, '', 0, 222, 2, NULL, NULL, '', '0000-00-00', NULL, NULL, NULL, '1', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2022-05-23', NULL, NULL),
(95, '', 0, 222, 3, NULL, NULL, '', '0000-00-00', NULL, NULL, NULL, '1', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2022-05-23', NULL, NULL),
(96, '', 0, 222, 7, NULL, NULL, '', '0000-00-00', NULL, NULL, NULL, '1', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2022-05-23', NULL, NULL),
(97, '', 0, 223, 2, NULL, NULL, '', '0000-00-00', NULL, NULL, NULL, '1', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2022-05-23', NULL, NULL),
(98, '', 0, 223, 3, NULL, NULL, '', '0000-00-00', NULL, NULL, NULL, '1', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2022-05-23', NULL, NULL),
(99, '', 0, 223, 7, NULL, NULL, '', '0000-00-00', NULL, NULL, NULL, '1', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2022-05-23', NULL, NULL),
(100, '', 0, 226, 2, 'Akte Lahir', 'Bandung', '', '1990-01-01', '', '0000-00-00', '', '1', 224, '2022-05-26 07:43:29', 0, 'Opusisv Testing3', '2014-01-01', '', '0000-00-00', 2, 224, '2022-05-26', '2022-05-26', NULL),
(103, '', 0, 222, 7, 'bandung', 'bandung', '', '2022-02-20', '', '0000-00-00', '', '1', 224, '2022-05-26 09:50:05', 0, NULL, NULL, NULL, NULL, 2, 224, '2022-05-26', '2022-05-26', NULL),
(104, '', 0, 228, 7, 'Nikah AGustus', 'Jakarta Selatan', '', '2022-08-20', '', '0000-00-00', '', '1', 224, '2022-05-26 10:35:22', 0, NULL, NULL, NULL, NULL, 2, 224, '2022-05-26', '2022-05-26', NULL),
(105, '', 0, 227, 2, 'Akte Kelahiran', 'Bandung', '', '1990-01-01', '', '0000-00-00', '', '0', NULL, NULL, 0, NULL, NULL, NULL, NULL, 2, 0, '2022-05-26', NULL, NULL),
(106, '', 0, 231, 7, 'nikah', 'bandung', '', '2022-10-10', '', '0000-00-00', '', '0', NULL, NULL, 0, NULL, NULL, NULL, NULL, 2, 0, '2022-05-26', '2022-05-26', NULL),
(107, 'PF-202205-0001', 202205, 232, 7, 'bandung', 'cimahi', '', '2002-10-10', '', '0000-00-00', '', '0', NULL, NULL, 0, NULL, NULL, NULL, NULL, 2, 0, '2022-05-26', NULL, NULL),
(108, 'PF-202205-0002', 202205, 232, 7, 'okok', 'Bandung', '', '2022-01-01', '', '0000-00-00', '', '0', NULL, NULL, 0, NULL, NULL, NULL, NULL, 2, 224, '2022-05-26', NULL, NULL),
(109, 'PF-202205-0003', 202205, 234, 7, 'bandung', 'as', 'e0246740438278e2481fe36789cb9ec4.png', '2022-01-01', 'asdas', '0000-00-00', '', '0', NULL, NULL, 0, NULL, NULL, NULL, NULL, 2, 0, '2022-05-26', NULL, NULL),
(110, 'PF-202205-0004', 202205, 236, 7, 'Pernikahan Agustus', 'Jakarta', '32d2ec5f150eb9c5cc081b88d3bd1dc8.png', '2021-08-10', 'Pernikahan yang lancar', '2021-08-10', '', '1', 224, '2022-05-26 17:47:06', 0, NULL, NULL, NULL, NULL, 2, 224, '2022-05-26', '2022-05-26', NULL),
(111, 'PF-202205-0005', 202205, 236, 2, 'akte kelahiran', 'bandung', '', '2022-01-01', '', '0000-00-00', '', '1', 224, '2022-05-26 17:49:00', 0, NULL, NULL, NULL, NULL, 2, 224, '2022-05-26', '2022-05-26', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `data_formal_detail`
--

CREATE TABLE `data_formal_detail` (
  `id` int(11) NOT NULL,
  `id_data_formal` int(11) DEFAULT NULL,
  `id_profile` int(11) DEFAULT NULL,
  `id_posisi` int(11) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `data_formal_detail`
--

INSERT INTO `data_formal_detail` (`id`, `id_data_formal`, `id_profile`, `id_posisi`, `status`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 103, 222, 1, NULL, NULL, NULL, NULL),
(2, 103, 223, 2, NULL, NULL, NULL, NULL),
(3, 104, 228, 2, 1, '2022-05-26 10:34:12', NULL, NULL),
(4, 104, 227, 1, 1, '2022-05-26 10:34:12', NULL, NULL),
(5, 105, 227, 1, 1, '2022-05-26 10:34:58', NULL, NULL),
(6, 106, 231, 2, 1, '2022-05-26 12:13:38', NULL, NULL),
(7, 106, 232, 1, 1, '2022-05-26 12:13:38', NULL, NULL),
(8, 107, 232, 1, 1, '2022-05-26 15:51:58', NULL, NULL),
(9, 107, 231, 2, 1, '2022-05-26 15:51:58', NULL, NULL),
(10, 108, 232, 1, 1, '2022-05-26 15:53:25', NULL, NULL),
(11, 108, 231, 2, 1, '2022-05-26 15:53:25', NULL, NULL),
(12, 109, 234, 2, 1, '2022-05-26 17:42:45', NULL, NULL),
(13, 109, 233, 1, 1, '2022-05-26 17:42:45', NULL, NULL),
(14, 110, 236, 2, 1, '2022-05-26 17:45:45', NULL, NULL),
(15, 110, 235, 1, 1, '2022-05-26 17:45:45', NULL, NULL),
(16, 111, 236, 2, 1, '2022-05-26 17:48:33', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `dtm_peristiwa`
--

CREATE TABLE `dtm_peristiwa` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `kategori` int(11) NOT NULL,
  `details` text NOT NULL,
  `status` int(1) NOT NULL COMMENT '0 Tidak Aktif | 1 Aktif | 2 Deleted',
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT NULL ON UPDATE current_timestamp(),
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `dtm_peristiwa`
--

INSERT INTO `dtm_peristiwa` (`id`, `name`, `kategori`, `details`, `status`, `created_at`, `updated_at`, `deleted_at`) VALUES
(2, 'Tanggal Lahir', 1, 'Lahir', 1, '2021-10-05 08:15:02', '2022-04-22 16:58:06', NULL),
(3, 'Tanggal Join', 1, '1223', 1, '2021-10-05 08:19:00', '2022-04-22 16:58:46', NULL),
(5, 'Tanggal Xx', 0, '0x', 3, '2021-10-08 13:31:00', '2021-10-08 13:31:09', '2021-10-08 13:31:09'),
(6, 'SAMPLE TANGGAL NEW', 1, 'OKE', 3, '2021-11-01 16:56:13', '2022-04-22 16:59:48', '2022-04-22 16:59:48'),
(7, 'Pernikahan', 2, '-', 1, '2022-03-24 15:48:08', '2022-04-22 16:58:57', NULL),
(8, '3', 2, '3', 3, '2022-04-22 16:59:42', '2022-04-22 16:59:45', '2022-04-22 16:59:45'),
(9, 'asdasd', 1, 'asdasd', 3, '2022-04-27 02:12:26', '2022-05-11 05:44:30', '2022-05-11 05:44:30');

-- --------------------------------------------------------

--
-- Table structure for table `gelar`
--

CREATE TABLE `gelar` (
  `id` int(11) NOT NULL,
  `id_profile` int(11) NOT NULL,
  `id_jenis_gelar` int(11) DEFAULT NULL,
  `tanggal_lulus` date NOT NULL,
  `lembaga` varchar(100) NOT NULL,
  `status` char(1) NOT NULL COMMENT '0 = dibuat, 1 = aktif, 2 = tidak aktif',
  `created_at` date DEFAULT NULL,
  `updated_at` date DEFAULT NULL,
  `deleted_at` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `individual`
--

CREATE TABLE `individual` (
  `id` int(11) NOT NULL,
  `status` int(1) NOT NULL,
  `email` varchar(255) NOT NULL,
  `phone` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `address` text NOT NULL,
  `city` text NOT NULL,
  `since` datetime NOT NULL,
  `description` varchar(255) NOT NULL,
  `packet` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `individual`
--

INSERT INTO `individual` (`id`, `status`, `email`, `phone`, `name`, `address`, `city`, `since`, `description`, `packet`) VALUES
(1, 0, 'flo99@example.org', '1-667-294-4206', 'Bettie', '39119 Conroy Rest Suite 993\nGermanbury, NC 40789-4845', 'Port Diamondmouth', '1988-03-21 00:00:00', 'Quaerat tenetur rerum aspernatur illo aperiam. Omnis animi aliquam blanditiis. Asperiores ut voluptatem dolorem tempora quo voluptates. Iste nam tempore neque dolorum atque qui rerum.', 'Silver'),
(2, 0, 'summer.okuneva@example.net', '+20(2)2109374627', 'Austyn', '04118 Hilll Gateway Apt. 828\nCarloton, AL 74310', 'New Kaleighmouth', '1986-09-13 00:00:00', 'Maxime error expedita id facere. Quia itaque et reprehenderit quibusdam. Id reprehenderit corporis earum tenetur beatae quas officia. Aut ea distinctio possimus.', 'Free'),
(3, 0, 'owunsch@example.org', '762.772.9902', 'Keenan', '8972 Concepcion Fall Suite 919\nReynoldshaven, IL 07495-3433', 'Norbertton', '2014-07-14 00:00:00', 'Ipsum id dignissimos itaque ducimus sit ad quas. Modi ducimus aut ex quae rerum unde. At et consequuntur quidem quaerat.', 'Silver'),
(4, 0, 'isom.nicolas@example.org', '784-717-3305x4103', 'Justine', '7208 Newton Pass\nWest Dominicchester, HI 17574', 'Lake Jeffreyland', '1999-05-13 00:00:00', 'Cupiditate dolor ad qui assumenda dicta sint vitae in. Non eveniet fugit atque natus consectetur repellendus. Quam cumque sit architecto impedit ut sit. Dolorum incidunt enim iusto qui neque sed aliquid.', 'Premium'),
(5, 0, 'luettgen.marshall@example.org', '826-591-4719x482', 'Branson', '148 Ned Cliffs\nLake Carmella, SC 27740', 'New Makaylashire', '2021-11-29 00:00:00', 'Molestiae aspernatur ut eum ipsam dolore ipsa. Voluptates laborum et esse doloribus.', 'Gold'),
(6, 0, 'jovany22@example.org', '085-808-8399x41139', 'Mariana', '0121 Hoeger Land\nStarkland, MO 48012-8730', 'Lake Alvis', '1971-09-08 00:00:00', 'Commodi voluptas maxime dolores. Sequi facilis eveniet est nesciunt fugit maiores. Ipsam mollitia ipsum et aliquam unde laborum provident. Odio non nesciunt eaque non ipsa.', 'Silver'),
(7, 0, 'fwelch@example.net', '(093)713-4225', 'Concepcion', '731 Winston Pines\nBodeport, GA 91032', 'Kayleetown', '2003-02-11 00:00:00', 'Deserunt est dolor soluta molestiae et nostrum et incidunt. Illo sit eos rem. Amet unde minima dolorem.', 'Premium'),
(8, 0, 'bogan.nolan@example.org', '116.493.7339x1952', 'Elliot', '16740 Mikayla Road Apt. 931\nEwellchester, FL 46315', 'Port Jacebury', '1992-06-17 00:00:00', 'Sit et quas autem aliquam nisi sequi non et. Itaque nisi et mollitia minus aliquid aperiam fugiat. Quam et consequatur alias quasi commodi. Qui at et ullam temporibus.', 'Silver'),
(9, 0, 'gulgowski.kristoffer@example.org', '168-727-8696x32499', 'Holly', '422 Medhurst Circle\nBrianburgh, IA 98795', 'Runtefort', '1979-05-07 00:00:00', 'Delectus aut et eos dignissimos. Atque aut labore omnis corrupti quibusdam. Vel ex cum deserunt dignissimos pariatur. Minus dicta provident dolorem est.', 'Premium'),
(10, 0, 'gorn@example.org', '1-282-647-2083x9312', 'Jailyn', '143 Kling Unions Suite 460\nKevonmouth, NC 79629', 'Lake Gaetanobury', '2003-05-10 00:00:00', 'Culpa est distinctio possimus reiciendis veniam. Aperiam doloribus qui doloribus ducimus tempore quibusdam. Consequatur autem quisquam provident.', 'Free'),
(11, 0, 'mccullough.van@example.com', '1-389-597-6120', 'Albertha', '4305 Thiel Port Suite 809\nZackarychester, CO 17246-2051', 'Nashshire', '1991-03-19 00:00:00', 'Dolor ducimus earum inventore ratione molestiae. Perferendis eos eius iste esse rem officia dolorem quia. Deserunt odit eum quas blanditiis quidem et consequatur.', 'Gold'),
(12, 0, 'aglae20@example.org', '+08(8)2550058337', 'Cecile', '277 Ratke Dam Apt. 202\nWest Greenville, SC 32368', 'Lockmanside', '1994-03-21 00:00:00', 'Sit facilis aliquam eveniet et consequatur consequuntur officia sit. Itaque aut repellat pariatur labore veniam enim commodi. Qui ipsam modi sit perferendis quo. Et excepturi non omnis vitae qui ad. Eveniet modi quia alias et.', 'Silver'),
(13, 0, 'ida30@example.org', '1-922-693-6106', 'Justina', '56068 Kiarra Common\nKamronburgh, WI 04667-2364', 'Loushire', '1984-02-08 00:00:00', 'Non nobis culpa delectus dolores neque corrupti earum tenetur. Praesentium perferendis et non delectus dolorem. Eius et officia rerum.', 'Gold'),
(14, 0, 'rzieme@example.net', '(389)567-6878x0911', 'Lew', '58865 Thomas Crossroad Apt. 623\nPort Jayme, CO 56043-5957', 'Lake Ava', '1990-06-10 00:00:00', 'Quibusdam perferendis quisquam voluptatibus harum dignissimos quibusdam dolorem. Ut minima voluptate veritatis similique sint voluptate.', 'Gold'),
(15, 0, 'kayley.gleason@example.com', '728.190.3982x3662', 'Deangelo', '56210 Cathryn Heights Apt. 220\nMarksland, CO 64737-0000', 'Batzfurt', '2010-04-15 00:00:00', 'Consequatur quae consectetur ad eum. Quia inventore amet nesciunt quia quia eum. Enim hic sint pariatur rerum. Aut ut voluptatibus suscipit.', 'Free'),
(16, 0, 'wolff.evangeline@example.net', '130.388.5142x73112', 'Taya', '7162 Schimmel Ford Suite 956\nNew Tressa, KS 48198', 'Port Julianfort', '1972-02-29 00:00:00', 'Perferendis nihil natus eum sapiente tempora commodi rerum. Odit repellendus repudiandae alias provident iusto totam quia. Dolore est distinctio facere aut omnis repudiandae. Eveniet expedita voluptatem laboriosam pariatur impedit sed ducimus.', 'Free'),
(17, 0, 'rowe.ressie@example.net', '769-969-1905x45741', 'Dejah', '11596 Hattie Ford Apt. 843\nMarceloside, CA 98905', 'West Regan', '2004-01-23 00:00:00', 'Quia est alias quas quibusdam. Et error quis mollitia velit dolor nostrum. Facilis perferendis et dolorum non illum et.', 'Premium'),
(18, 0, 'alana01@example.net', '069-429-9823x1828', 'Dora', '6405 Fred Parkways\nWest Lanceberg, PA 10669', 'Nolanside', '2013-10-25 00:00:00', 'Iure harum quasi est sint similique et tempora dignissimos. Adipisci aliquam et quaerat illum deserunt. Iste sed mollitia neque architecto vel iure pariatur molestiae.', 'Gold'),
(19, 0, 'macy.streich@example.net', '1-296-669-1100', 'Sheridan', '84388 Derek Hollow\nZakarychester, VA 73971', 'Boganhaven', '2004-08-30 00:00:00', 'Quaerat voluptatibus blanditiis pariatur molestiae qui rerum. Dolorem in adipisci est dolorem. Ducimus voluptate cumque nemo dolor corrupti quidem eum mollitia.', 'Gold'),
(20, 0, 'haley98@example.com', '840-235-9089x079', 'Furman', '4527 Irving Walks Apt. 696\nLake Maximo, AK 29007-8266', 'Kristinberg', '2013-08-25 00:00:00', 'Accusantium voluptates qui qui voluptas. Veniam nesciunt consequatur non facilis. Suscipit sed in non quaerat ut aut qui magnam. Reprehenderit quia dolores consequatur aliquid. Qui doloremque esse quam.', 'Gold'),
(21, 0, 'sipes.marley@example.org', '(016)095-7924', 'Verona', '59456 Kuvalis Spurs Suite 889\nVedatown, OK 72655-4182', 'Dillanmouth', '1970-06-21 00:00:00', 'Recusandae voluptatem eligendi possimus unde nam quod. Eius error optio omnis quia et quia. Id fugiat natus tenetur sint et rem adipisci nihil. Omnis sit numquam expedita quo non doloribus.', 'Free'),
(22, 0, 'corrine21@example.org', '150.493.4905', 'Cora', '8601 Jaren Camp\nWatsicastad, GA 68848-0569', 'New Berttown', '1975-06-10 00:00:00', 'Delectus molestias dolor et quae rerum molestias. Aut quia veniam eos laborum inventore eos. Sit ut temporibus fuga.', 'Premium'),
(23, 0, 'lesly.franecki@example.com', '07016407184', 'Karianne', '9275 Haleigh Wells\nSimonisberg, MO 27914-5936', 'Margarettaburgh', '2013-08-09 00:00:00', 'Qui alias porro totam nulla. Quis saepe voluptas alias illum. Ea laudantium voluptatum autem illo saepe incidunt et. Quas voluptatem magnam corrupti sint consequatur.', 'Premium'),
(24, 0, 'kuhlman.myrl@example.org', '04169558018', 'Jonatan', '50776 Vicenta Crossing\nPort Gradyburgh, DC 97941-6138', 'New Jalynton', '1977-12-12 00:00:00', 'Dolorem et omnis omnis quidem nihil. Animi temporibus ullam qui quos necessitatibus.', 'Free'),
(25, 0, 'maufderhar@example.org', '949-876-1485', 'Mae', '863 Cassin Parkway Apt. 185\nKreigerbury, ME 36348-9303', 'Port Nathanport', '2001-06-24 00:00:00', 'Tenetur est et quibusdam nesciunt sed ullam. Iure quasi quibusdam ex magni doloribus sit. Eveniet iure ratione repellendus ut. Delectus velit tempora et enim.', 'Free'),
(26, 0, 'kohler.ursula@example.net', '+84(8)4864430414', 'Lula', '37307 Schimmel Crossroad Suite 231\nMarisaland, MD 33440', 'Kingbury', '2005-08-10 00:00:00', 'Et minus sunt nesciunt officia. Iure explicabo quae quis ipsum. Aut ut et error.', 'Free'),
(27, 0, 'jgutmann@example.com', '402-378-5648x173', 'Clarabelle', '3847 Hartmann Harbors\nNew Terrillmouth, MA 60407-2580', 'Abbottstad', '1993-04-27 00:00:00', 'Delectus ut consequatur temporibus aut et neque. Expedita id dignissimos aut voluptatem at. Omnis pariatur soluta velit non magnam.', 'Gold'),
(28, 0, 'hilma48@example.org', '(892)035-5432x3210', 'Prudence', '897 Alda Shoals\nBradenberg, ND 53407-9003', 'Port Violettemouth', '1976-11-26 00:00:00', 'Voluptatem necessitatibus eos magni non. Cumque reprehenderit illum consequuntur dolorem. Officia autem in eos excepturi eius. Quis soluta voluptatum magni quia et voluptatum.', 'Free'),
(29, 0, 'abigale11@example.net', '00045285745', 'Chris', '29494 Brigitte Falls Apt. 517\nAlanaport, TX 83358', 'Reillyfurt', '1991-03-24 00:00:00', 'Sunt rerum voluptatem reiciendis vitae ratione accusamus eveniet aliquid. Quaerat laudantium cumque deleniti. Minima quia dicta quae optio. Dolorum saepe sed culpa pariatur aspernatur sed repudiandae.', 'Premium'),
(30, 0, 'kaya40@example.org', '06160656326', 'Cassandra', '500 Kulas Run Suite 258\nEast Abdullahmouth, UT 18194-6679', 'Boyleberg', '1970-02-10 00:00:00', 'Facilis enim et eius harum inventore iste quia nostrum. Rem tempore nobis eligendi aut beatae iste repellat. Labore eligendi quam hic quia nobis et magni.', 'Free'),
(31, 0, 'erica49@example.com', '04277902884', 'Colin', '1318 Pagac Groves\nEast Hilton, ID 53403', 'Elisabethland', '1983-11-17 00:00:00', 'Inventore non sit et odio. Aut architecto atque nihil eum magni. Maxime odio dolorem rerum.', 'Gold'),
(32, 0, 'nakia.buckridge@example.com', '858-474-6888', 'Archibald', '9454 Milton Villages\nWest Cleveview, DC 73516-6449', 'Lake Mariah', '2014-09-24 00:00:00', 'Dolorem tenetur architecto dolores qui. Dolor est sit dolores et. Omnis in quas dolore.', 'Gold'),
(33, 0, 'botsford.henry@example.com', '1-225-385-4046x69714', 'Esteban', '92447 Ari Fords\nEast Daisychester, TX 66796', 'Port Omari', '2002-05-01 00:00:00', 'Aut explicabo minus reiciendis recusandae. Alias harum voluptatem iure deserunt. Illo veniam eos veritatis quo recusandae sint.', 'Premium'),
(34, 0, 'powlowski.francisco@example.com', '1-826-507-7677x72520', 'Susanna', '156 Kunde Street Suite 695\nBaumbachville, NC 13152', 'Benside', '1977-09-22 00:00:00', 'Autem est sed et eaque non vero qui. Exercitationem fugit et doloribus porro optio earum. Accusantium qui sed laborum dolore eius nihil. Eligendi in a saepe quisquam minima atque.', 'Silver'),
(35, 0, 'trent76@example.net', '(041)833-4945x459', 'Ben', '9434 Kiehn Streets\nRoweville, NM 54240-3669', 'Tremblayfurt', '2007-03-29 00:00:00', 'Quis laudantium sequi harum ipsa nesciunt qui velit. Vitae et dolorem veniam. Voluptas aliquam exercitationem aut.', 'Silver'),
(36, 0, 'ibeer@example.org', '334-811-7317', 'Melissa', '764 Jordane Mount Suite 376\nNew Harmony, MI 25200', 'North Joanyborough', '1999-08-21 00:00:00', 'Culpa ad consectetur et libero ut. Ut voluptatibus possimus sapiente nihil dolorum recusandae qui.', 'Premium'),
(37, 0, 'kiehn.verna@example.com', '1-932-643-4204x25593', 'Judah', '8110 Alyce Fords\nHudsonborough, IL 33428-4577', 'Nikolausmouth', '1986-03-17 00:00:00', 'Ipsam est error placeat est id aut. Vero deserunt tempore quidem autem quas. Inventore eos non dicta provident minima voluptas. Rerum qui aut atque maiores quibusdam sed. Corporis mollitia rerum enim sit ullam commodi.', 'Free'),
(38, 0, 'doyle.shad@example.com', '(336)390-2857', 'Destini', '06866 Dickinson Turnpike Suite 503\nLake Glenna, NC 85282-3103', 'Mavisport', '1994-03-19 00:00:00', 'Tempora voluptatem enim praesentium distinctio similique nihil. Aut eum officiis minus harum maiores. Labore velit autem magnam eveniet quia provident nisi ratione. Excepturi a qui aut nisi consequatur provident.', 'Silver'),
(39, 0, 'beer.immanuel@example.net', '1-652-242-6324x90829', 'Fay', '4152 Vallie Mountain Suite 647\nLake Kevinburgh, AK 06887-5470', 'South Jewel', '1986-11-30 00:00:00', 'Earum doloribus dignissimos omnis. Qui quos fuga amet cumque. Autem numquam fuga et autem.', 'Gold'),
(40, 0, 'zvonrueden@example.org', '+14(5)6177136560', 'Gerald', '8489 Shawn Junctions Suite 209\nGutkowskiburgh, FL 59511', 'Terryhaven', '2000-07-17 00:00:00', 'Aut nihil labore ducimus fugiat cupiditate id. Officia esse nisi officia.', 'Gold'),
(41, 0, 'lindsay.dietrich@example.org', '07214564469', 'Nikita', '855 Herzog Trace\nGerrybury, MN 80782-2615', 'Lake Wymanbury', '1988-08-20 00:00:00', 'Consequatur aut eum sunt. Molestiae id rerum adipisci repellendus voluptatem reiciendis aut. Nemo et numquam quis sint vitae eos. Exercitationem voluptate sed ullam eveniet officia odit amet.', 'Silver'),
(42, 0, 'herzog.jettie@example.org', '689.199.3830x7875', 'Kurtis', '344 Gerlach Bypass\nOttochester, ID 48344', 'Krystelport', '1971-01-10 00:00:00', 'Dicta deleniti et consequuntur consequatur iusto. Aut recusandae et qui animi velit ipsa. Temporibus voluptatem ea quia voluptas deleniti sint. Maxime non nemo qui et animi harum illum. Vitae quasi ex consequatur laborum velit.', 'Gold'),
(43, 0, 'fwhite@example.net', '351.720.2693x73135', 'Tremayne', '0839 Hayes Islands Suite 182\nSpencerchester, AZ 62637-1699', 'West Morris', '1979-05-24 00:00:00', 'Repudiandae non enim qui fugiat et. Qui blanditiis eius autem. Ut natus ipsam officia tempore. Sunt ut ipsam facilis labore et facere sit. Amet velit dolore amet porro.', 'Silver'),
(44, 0, 'aiyana31@example.org', '580-618-0612', 'Neal', '426 Koch Village Apt. 978\nLake Ollieview, MT 30479', 'Blaisechester', '1985-02-06 00:00:00', 'Quibusdam libero reiciendis omnis voluptas rerum distinctio. Quos dolores deleniti quia. Quo soluta ratione quas dignissimos quaerat dolorem omnis consequatur. Et illo necessitatibus veniam.', 'Premium'),
(45, 0, 'o\'kon.broderick@example.org', '300.997.1977x78935', 'Tamia', '696 Sauer Row Apt. 928\nLake Jaydonland, KS 28457', 'Abbottport', '2011-01-20 00:00:00', 'Ut quibusdam repellat cupiditate ex omnis. Inventore voluptatibus dignissimos perspiciatis. Veniam ex et cum ab deleniti dolor soluta. Nulla culpa adipisci eius quam quis et.', 'Gold'),
(46, 0, 'teresa57@example.org', '876-394-4213', 'Jarret', '9001 Lowe Gardens\nNew Shaina, NM 47111-8036', 'South Chad', '2005-03-16 00:00:00', 'Beatae quo sed ut doloremque neque similique. Vero consequuntur dolorem totam tempore ex consequatur doloribus. Expedita cumque reiciendis necessitatibus temporibus soluta. Et quod aut et est ut.', 'Premium'),
(47, 0, 'clark02@example.org', '+84(0)1633192828', 'Athena', '217 Austen Manors Suite 438\nLibbybury, WV 90501', 'Michaelmouth', '2001-07-12 00:00:00', 'Quis doloribus cupiditate aut doloremque esse reprehenderit voluptatem. Consequuntur dolor impedit vel et totam culpa. Reprehenderit quo est autem reiciendis. Vitae laboriosam excepturi debitis molestiae voluptatem est praesentium in. Eum voluptatem sit i', 'Gold'),
(48, 0, 'fcarter@example.com', '573.972.2631x99187', 'Alison', '886 Crona Squares Suite 939\nBeerfurt, ND 47010-4794', 'Cristton', '2005-11-29 00:00:00', 'Nostrum placeat ad quibusdam qui quia fugit impedit. Libero ratione quidem iure quisquam non aut numquam. Fugit incidunt tempore earum culpa repellat distinctio voluptatum.', 'Gold'),
(49, 0, 'bruen.sierra@example.net', '(079)699-3364', 'Israel', '55231 Libbie Ways Suite 045\nNew Violaburgh, TX 11227-2168', 'Lake Aubree', '2001-08-10 00:00:00', 'Saepe dolores voluptates facere ea voluptatum et sit. Totam accusantium enim rerum officia officia. Aspernatur quibusdam voluptatum qui.', 'Silver'),
(50, 0, 'xmiller@example.org', '258-770-1217', 'Enos', '42043 Valentine Way\nSusiemouth, TN 89195', 'East Ernieville', '1994-09-22 00:00:00', 'Eos repudiandae aut in qui quisquam aut minima. Commodi omnis ipsam ut deserunt nesciunt aliquam omnis. Suscipit pariatur possimus veniam. Velit eos sit repellendus necessitatibus voluptatem rem ducimus sint. Culpa optio temporibus consequuntur quo ex qui', 'Free'),
(51, 0, 'kiara12@example.net', '(580)055-7815x8904', 'Autumn', '595 Favian Turnpike Apt. 706\nMarquardttown, WA 75353', 'Robinmouth', '1980-01-10 00:00:00', 'Unde quia alias ut eius est. Est tempore asperiores praesentium nulla quaerat est in. Quam harum sit voluptas ut sequi nesciunt.', 'Premium'),
(52, 0, 'virginie42@example.net', '02710000050', 'Weldon', '31476 Hortense Centers\nWalkertown, DE 06444-7889', 'Lake Florenciohaven', '2002-03-24 00:00:00', 'Est et animi recusandae sit et minus. Magni perspiciatis consequuntur ut sed sunt. Velit odio perferendis ratione et ullam earum perferendis id.', 'Free'),
(53, 0, 'newton.bechtelar@example.com', '1-470-440-4948', 'Adell', '12943 Mavis Courts\nAlexaneland, NE 28877', 'North Jerome', '1985-10-08 00:00:00', 'Ea dolorem rerum esse ut et. Deserunt molestias id id odio et. Facilis repellendus voluptas quidem exercitationem totam. Et deleniti quibusdam sed odio.', 'Premium'),
(54, 0, 'erunte@example.com', '1-403-629-0402', 'Madilyn', '8999 Wintheiser Plains\nErynshire, VT 34653-4372', 'Lake Damienville', '1998-03-02 00:00:00', 'Sed sed ullam cum incidunt et pariatur. Molestiae enim facere corporis magni expedita aliquam repellat impedit. Tempora esse fugit quisquam vel non nemo voluptatum labore.', 'Premium'),
(55, 0, 'kschultz@example.com', '585.896.2119', 'Simeon', '885 Kuphal Loaf\nEast Ahmadport, NJ 30643-7859', 'East Norris', '2017-08-31 00:00:00', 'Rerum maiores aut ut quia aspernatur sit eum. Qui enim ab sequi doloremque minima sed accusantium. Et provident molestiae ipsa repellat.', 'Premium'),
(56, 0, 'bblick@example.net', '+03(7)2015792011', 'Mateo', '54526 Goldner Coves\nMoisesmouth, UT 65993', 'New Maritza', '1981-02-21 00:00:00', 'Est qui aut nihil ut perspiciatis soluta vero. Vel cupiditate quidem aut dolorem. Et porro delectus magni aspernatur repudiandae ut.', 'Gold'),
(57, 0, 'xcrist@example.net', '117-985-8384x45343', 'Eli', '43730 Isom Divide\nJaviermouth, LA 60053-4200', 'Port Jadynmouth', '1990-02-26 00:00:00', 'Temporibus et ad nihil rerum tempora et. Veniam quae voluptatum nemo minima officia numquam. Possimus ut velit eveniet explicabo porro quam delectus.', 'Free'),
(58, 0, 'gaetano47@example.net', '1-451-560-5584x36753', 'Shanon', '82872 Oberbrunner Plaza Apt. 077\nJodyview, TX 29789', 'South Demondbury', '1999-07-01 00:00:00', 'Rerum nostrum modi provident. Rerum fuga enim qui voluptate ipsam asperiores. Fuga atque vero a beatae id.', 'Premium'),
(59, 0, 'trevor.luettgen@example.com', '1-897-909-2008x954', 'Kiera', '4088 Elinore Fork Suite 683\nEast Rodrigoside, NY 08543-2087', 'North Neoma', '2017-08-09 00:00:00', 'Eligendi cumque ea minus. Et voluptas dolores voluptatum voluptates corporis qui. Molestiae debitis fugit omnis est. Natus id eum sunt voluptatem.', 'Premium'),
(60, 0, 'rkiehn@example.org', '1-813-122-9969x01665', 'Destany', '520 Schimmel Lock\nGroverside, ME 18149-0518', 'Kutchfort', '2020-06-11 00:00:00', 'Aut harum pariatur tempora voluptatem quia sed. Dolorem in et veritatis aut omnis placeat. Rem rerum veniam tenetur sit.', 'Silver'),
(61, 0, 'o\'connell.anahi@example.org', '263-031-3637x824', 'Otto', '52962 Pfeffer Hill Suite 206\nPowlowskitown, IL 97509', 'Lake Ryanland', '1984-05-07 00:00:00', 'Explicabo ab et est et voluptas. Ut dicta quaerat at consequatur animi earum. Distinctio deserunt hic modi officia id optio. Quia natus culpa sequi quisquam aut esse.', 'Silver'),
(62, 0, 'betsy.hand@example.net', '037-928-1273x6362', 'Hilario', '9812 Royce Viaduct Suite 707\nIsobelland, MO 54408-3404', 'Port Berylmouth', '2008-04-23 00:00:00', 'Cum et nulla qui velit. Ab laborum libero omnis omnis dolor autem et. Est et ducimus et sequi. Enim ab officiis libero exercitationem. Officiis quam fugiat adipisci omnis.', 'Free'),
(63, 0, 'bolson@example.net', '256.136.1401', 'Mozell', '1046 Joelle Street\nSmithborough, IA 99987-7949', 'West Arnoldhaven', '2022-05-18 00:00:00', 'Aut sint iste temporibus odio odio fugit. Aut autem totam dolorem omnis.', 'Gold'),
(64, 0, 'waylon69@example.com', '1-040-824-9321', 'Maximillia', '245 Felton Ways\nJuleschester, MN 23538', 'New Erna', '1973-08-20 00:00:00', 'Veritatis esse accusamus fuga sed. Odit fugit animi est quibusdam numquam iusto occaecati voluptas. Deserunt dolore nulla aspernatur fuga qui sequi. Rerum numquam nulla accusantium sed unde. Quae ut expedita rerum est cum eveniet.', 'Premium'),
(65, 0, 'lgrant@example.org', '667.683.6653x6767', 'Berenice', '3582 Trevion Loaf\nNorth Sandra, MN 67346-8691', 'Port Greta', '1979-04-24 00:00:00', 'Eos porro maxime dolorum. Dolores hic suscipit quas. Quia vel velit neque earum ut. Doloremque non alias fuga modi.', 'Gold'),
(66, 0, 'twaters@example.com', '(302)803-1257x89838', 'Birdie', '4143 Alanna Turnpike Suite 420\nEast Coty, VT 44071-1784', 'New Corene', '1973-08-21 00:00:00', 'Quia sed distinctio quas et architecto maiores. Voluptatibus et enim porro cupiditate. Aut accusamus provident ut.', 'Free'),
(67, 0, 'nkeeling@example.net', '902.019.5836x21370', 'Urban', '479 Jacobi Village Apt. 964\nLangworthmouth, NE 83781', 'Jalynton', '2008-08-30 00:00:00', 'Modi laboriosam consequatur consequatur dolorum aperiam quis. Quam itaque accusamus in quisquam delectus asperiores dolor. Possimus quia voluptate quidem quisquam.', 'Gold'),
(68, 0, 'jaylan.gulgowski@example.org', '09261203073', 'Elinor', '810 Lola Isle\nPort Whitneyshire, NJ 15328-6347', 'Bahringermouth', '2011-04-24 00:00:00', 'Quis delectus laboriosam ducimus minus incidunt consectetur modi. Qui vel harum qui consequatur ea sed quibusdam porro.', 'Silver'),
(69, 0, 'considine.aryanna@example.net', '579-909-4898', 'Laverna', '599 Dovie Coves\nAdolphmouth, AZ 23777-0692', 'Bransonton', '1975-11-07 00:00:00', 'Doloremque et quos nostrum qui sed. Consequuntur aut provident praesentium. Enim voluptates facilis natus et dicta et labore. Praesentium corrupti non aliquam nostrum.', 'Premium'),
(70, 0, 'cummings.bart@example.com', '(972)721-7923x53232', 'Sylvia', '41846 Blick Tunnel Suite 552\nGoyetteborough, KY 68837-6981', 'Westfurt', '1976-06-04 00:00:00', 'Est illo autem ut commodi quo dolor omnis. Magni atque voluptatem tenetur et. Mollitia ut ut mollitia blanditiis modi debitis repellat. Doloremque id ea deserunt vel veritatis.', 'Premium'),
(71, 0, 'ettie61@example.org', '(072)148-6898x47412', 'Shaylee', '440 Franz Oval\nSavannahfort, AK 50926', 'Ricebury', '2020-10-23 00:00:00', 'Dolorem autem dolorem voluptatem. Corrupti ut placeat est distinctio consequatur cupiditate qui. Voluptatem iure vitae fuga omnis qui ut porro dolores. Cum sint nemo provident.', 'Gold'),
(72, 0, 'lynch.shanie@example.org', '1-056-851-0094x2346', 'Frankie', '1726 Lilyan Lane Apt. 661\nLake Kevenland, NH 40219-8801', 'Lake Laverneland', '2012-08-22 00:00:00', 'Voluptatem magni dolor debitis corporis et autem quasi in. Aut sint maiores quasi rerum ut ut. Nihil expedita quae quis veritatis voluptas.', 'Gold'),
(73, 0, 'ludie43@example.com', '909-726-8707x4712', 'Kamron', '8544 Madaline Wall\nPort Leatha, AK 83868-3290', 'East Edwardhaven', '2022-04-10 00:00:00', 'Ut autem non quae fuga non. Dignissimos est quis doloribus et repellendus voluptatem. Laudantium maiores reprehenderit porro illum. Doloremque amet laborum nesciunt rerum et.', 'Free'),
(74, 0, 'ischmitt@example.com', '573.174.2811x84982', 'Emmalee', '7785 Bertha Hill Suite 193\nTyrelside, NC 46501-8726', 'Sunnyton', '1984-02-20 00:00:00', 'Iure voluptas vel deleniti omnis suscipit qui. Numquam autem laboriosam et debitis voluptas veniam fugit. Iure fugiat veniam consequatur pariatur in quo.', 'Silver'),
(75, 0, 'dan54@example.org', '1-183-572-2739', 'Myles', '924 Koelpin Forest Suite 071\nLedaville, TX 69316', 'East Andyville', '1999-12-15 00:00:00', 'Enim sapiente velit a nihil facere illo tenetur. Id cum occaecati sit esse accusamus iste. Non aliquid sit placeat.', 'Free'),
(76, 0, 'cayla.streich@example.com', '644-599-1164x323', 'Reggie', '68450 Schoen Viaduct Apt. 371\nLake Tamia, OK 32576-6426', 'New Vivianeview', '1970-05-12 00:00:00', 'Quo aut perspiciatis qui omnis. Consequuntur qui modi neque earum est. Autem et sed quos necessitatibus aliquid consequatur qui. Tenetur iste est molestias a quibusdam officiis.', 'Gold'),
(77, 0, 'abshire.jeffry@example.org', '1-079-813-5335x373', 'Skylar', '994 Sally Fields\nPadbergchester, AK 04971', 'Rauchester', '1972-10-10 00:00:00', 'Non non aspernatur unde tempora maiores amet sunt. Dolorem vero vel natus dolorem perferendis. Similique perspiciatis non itaque culpa sit.', 'Silver'),
(78, 0, 'bogan.kiley@example.org', '1-869-385-4602x9089', 'Candelario', '3894 Keeling Parkways\nNew Lolitaland, SD 18996', 'Clarissaburgh', '2018-05-10 00:00:00', 'Quisquam amet quo qui nihil voluptatem eum eaque. Iste blanditiis aut enim ut corporis. Aliquid cumque atque temporibus harum libero esse distinctio. Qui quod nam non debitis dignissimos amet.', 'Silver'),
(79, 0, 'flo.smitham@example.net', '(237)556-3003x019', 'Reese', '500 Kshlerin Glen\nGrantburgh, LA 53822-2981', 'Minervamouth', '2020-05-11 00:00:00', 'Voluptatem dolorem voluptate aut velit eaque expedita. Ab consequatur autem impedit tenetur laudantium nihil. Voluptates vero rerum molestiae eveniet non voluptas fugiat.', 'Premium'),
(80, 0, 'po\'keefe@example.org', '01909680747', 'Margarette', '8218 Curtis Gardens\nBlandamouth, VA 23303', 'Hilllhaven', '1988-01-21 00:00:00', 'Accusamus assumenda aperiam et est. Inventore qui incidunt omnis dolorum. Sunt atque sit nesciunt. Iste sed quia amet nihil corporis molestias tempore.', 'Premium'),
(81, 0, 'ucummerata@example.org', '739.521.4056', 'Juwan', '67216 Blick Gateway Apt. 882\nPort Maeveville, LA 51203', 'Lake Johannmouth', '2008-01-27 00:00:00', 'Illum voluptas iusto dolorem tempora cum et et. Fuga saepe sequi saepe velit provident debitis dolore. Dolor accusantium numquam pariatur enim minus. Omnis aliquam sed incidunt et ea ratione.', 'Premium'),
(82, 0, 'vwehner@example.net', '1-343-118-6924', 'Marcelle', '292 Baumbach Throughway\nPowlowskitown, IA 08867-9669', 'West Johnathon', '2016-08-31 00:00:00', 'Corrupti ullam consequuntur et illo nihil sint. Illum eaque temporibus omnis delectus nulla voluptatum enim. Est totam cupiditate quis et. Ducimus inventore ipsam ea.', 'Free'),
(83, 0, 'qschmitt@example.net', '08434702816', 'Candida', '58579 Cecelia Flat\nPort Shana, VT 33434-5190', 'Port Judd', '1995-04-16 00:00:00', 'Suscipit repudiandae sit dignissimos. Vitae deleniti quia libero magni illum exercitationem optio. Voluptatem voluptas fuga voluptatum adipisci est quia nesciunt. Officiis esse aut voluptates aut ut nam perferendis.', 'Silver'),
(84, 0, 'iweber@example.net', '384-828-6853x721', 'Mina', '3237 Powlowski Harbors\nReneemouth, HI 11502-7833', 'Port Elvera', '1974-03-03 00:00:00', 'Ad eligendi et sunt quibusdam commodi vel natus quasi. Facilis non temporibus error a quasi. Doloremque sapiente minus deserunt accusantium.', 'Gold'),
(85, 0, 'tfarrell@example.com', '692-893-7340x903', 'Abdiel', '1709 Arvilla Isle Apt. 059\nNew Vivienne, MI 91055-1885', 'Zackarymouth', '1999-02-17 00:00:00', 'Non qui consequatur et ut sunt ab. Numquam dolor non eligendi similique quaerat. Ut eligendi cum odio est doloribus. Laboriosam autem blanditiis ea.', 'Free'),
(86, 0, 'daugherty.abdiel@example.org', '410-072-9551x72192', 'Darian', '98805 Richmond Underpass Apt. 142\nNew Aleenbury, RI 70174-9882', 'O\'Reillyfurt', '1981-08-29 00:00:00', 'Minima autem non rerum eum necessitatibus et alias repellat. Sed est corrupti mollitia et accusantium totam. Voluptatem placeat necessitatibus modi minima rem amet corporis.', 'Gold'),
(87, 0, 'amir94@example.org', '587.841.4953x409', 'Haskell', '9833 Mitchell Roads\nAnnettaville, NM 21961', 'East Harryport', '1981-07-22 00:00:00', 'Culpa et illum voluptatem ut labore. Temporibus reiciendis eligendi maxime et id mollitia. Nemo in esse qui velit maiores aspernatur cum.', 'Gold'),
(88, 0, 'dietrich.foster@example.net', '1-706-978-1663', 'Camryn', '6576 Aniyah Mountains Suite 465\nHalvorsonbury, MT 71514-5906', 'Jasperside', '1971-07-06 00:00:00', 'Amet eius rerum et sapiente. Consequatur aspernatur ex eius aut a. Eum eum nemo officia asperiores tempora temporibus. Sunt iure dolor sint laudantium quia rem delectus.', 'Premium'),
(89, 0, 'liana.lowe@example.net', '148-816-2623x4013', 'Lonie', '868 Myah Green\nWest Carmela, SD 60231-2555', 'Earlinefort', '1983-04-23 00:00:00', 'Eius rerum enim tempora molestiae in. Modi qui nam sit praesentium accusamus et et. Ut eius aliquam eveniet excepturi tempora labore. Dignissimos sit occaecati voluptatem vero quis consequuntur possimus doloremque.', 'Silver'),
(90, 0, 'leannon.amiya@example.org', '065.003.0044x38048', 'Camden', '965 Gleason Camp Suite 387\nNicolashaven, NY 28909-7835', 'South Tracey', '1970-12-11 00:00:00', 'Nulla minima maxime tempore ut quo ut porro. Deleniti cumque nostrum saepe sed iusto aut. Ducimus nisi quasi excepturi pariatur et. Debitis libero aliquam voluptatem quibusdam necessitatibus.', 'Premium'),
(91, 0, 'johnnie79@example.org', '06277581943', 'Alayna', '5470 Spinka Lights\nNorth Eloisa, CO 09653', 'East Mariannaburgh', '1973-11-25 00:00:00', 'Eaque ipsam est et laborum. Recusandae eum illo voluptatem et sit similique est. Consequatur vero at corporis quis et aliquam. Quis et sunt nulla dignissimos consequatur id.', 'Premium'),
(92, 0, 'uleffler@example.org', '1-654-092-9478x504', 'Camilla', '828 Jakubowski Points Apt. 778\nLake Mikeshire, UT 29619', 'Olliemouth', '1986-01-03 00:00:00', 'Fugiat facilis qui voluptas consequatur. Distinctio qui sint sunt molestiae. Sit nihil rem accusantium. Maxime earum a ut incidunt. Facere et sapiente repellat aut asperiores quas aut sint.', 'Premium'),
(93, 0, 'yost.dan@example.com', '+69(5)6457884872', 'Louie', '1397 Ansley Oval\nNew Trevabury, ID 93130', 'East Calistaview', '2017-08-17 00:00:00', 'Esse nihil numquam ipsum et tempora repellat amet. Unde totam beatae exercitationem laborum maiores. Error quisquam omnis dolore quo suscipit.', 'Premium'),
(94, 0, 'henri82@example.com', '(478)323-4623x2395', 'Colt', '582 Gerhard Centers\nAlyciamouth, MO 98751-1109', 'East Antwon', '2020-01-10 00:00:00', 'Voluptas ut eveniet cum numquam. Provident a eveniet est laboriosam. Beatae id dolor porro voluptas. Labore et voluptatem aut odit est.', 'Premium'),
(95, 0, 'hmayert@example.net', '09400383535', 'Lelia', '882 Terry Way Apt. 526\nSchusterfurt, CT 76195', 'South Shermanburgh', '1998-09-14 00:00:00', 'Neque deleniti ipsa est aspernatur ea. Non voluptatibus omnis omnis nisi blanditiis. Reiciendis ex voluptatem voluptas maiores temporibus.', 'Gold'),
(96, 0, 'jasen57@example.com', '1-578-848-9708', 'Willy', '97687 DuBuque Flats\nLauramouth, CO 08145-6113', 'North Zoie', '1989-06-20 00:00:00', 'Possimus architecto quia eius enim dolorum tenetur. Voluptatem sed maiores illo tempora quo ut assumenda. Vitae quo quis vitae.', 'Silver'),
(97, 0, 'bergnaum.dejuan@example.net', '048-770-8805', 'Gerson', '7126 Carolina Loop\nColemouth, CA 69935-3013', 'New Jerryburgh', '1985-08-08 00:00:00', 'Commodi fuga nemo aspernatur perspiciatis incidunt. Quaerat libero minima est nulla sit et veniam. Aut fugiat voluptas ducimus sed. Voluptatibus hic est consequatur et.', 'Premium'),
(98, 0, 'heidi00@example.com', '248-812-8914', 'Melisa', '92274 Cassin Club\nLake Waylonville, MN 66924', 'Lake Peterfort', '2020-07-20 00:00:00', 'Eos illum repellendus sed quas. Non amet earum iusto laborum et. Perspiciatis ducimus perspiciatis voluptatem aut quis quo ea.', 'Silver'),
(99, 0, 'godfrey21@example.com', '1-771-862-6340', 'Osborne', '44052 Kariane Ville\nEast Jaylin, DC 09612', 'Kreigerborough', '1984-12-22 00:00:00', 'Est odit omnis earum aut illo unde. Rerum non quae odio. Voluptas eveniet sequi nulla sed ipsum ratione tempore.', 'Gold'),
(100, 0, 'oo\'conner@example.net', '1-621-105-3173', 'Kathlyn', '493 Eleonore Hill Suite 213\nPort Rocio, HI 19668', 'New Schuyler', '2001-01-01 00:00:00', 'Est in vero ex nemo officiis. Animi non minus cupiditate unde consequatur facilis tempore. Earum ex voluptatem nulla in voluptates nihil.', 'Premium'),
(101, 0, 'ubeatty@example.net', '(363)850-0015', 'Vinnie', '68923 Hoppe Square\nSouth Melyssatown, MO 78852', 'Balistreriborough', '2012-10-18 00:00:00', 'Assumenda sapiente dolor velit. Excepturi consequatur ipsam vel. Tenetur quae reiciendis alias. Quo reprehenderit aut reprehenderit facilis sed a.', 'Free'),
(102, 0, 'maci29@example.com', '(664)290-9597', 'Keith', '9549 Smith Spurs\nWaelchistad, OR 94929', 'New Rossie', '1984-10-27 00:00:00', 'Aut aut architecto et laboriosam quia quia consequuntur et. Ea nesciunt sit quia vel dignissimos blanditiis tempora. Totam autem porro nisi eius. Et magnam error quia asperiores.', 'Gold'),
(103, 0, 'marcellus29@example.net', '+85(4)2914683225', 'Brett', '08880 Antonetta Passage\nCloydberg, TN 99096', 'East Zeldafurt', '1985-10-08 00:00:00', 'Voluptatum voluptatibus eaque similique illum eos. Molestiae tenetur suscipit magni aliquid non ratione.', 'Premium'),
(104, 0, 'qthiel@example.org', '845-401-0370x44304', 'Viva', '2800 Rosalinda Passage Apt. 084\nBuckridgeview, MA 21006-7168', 'Dooleystad', '1972-05-31 00:00:00', 'Reprehenderit ut culpa nobis doloremque quod quia qui a. Maxime odit quam qui dolores qui dolor.', 'Silver'),
(105, 0, 'heller.hertha@example.net', '+07(1)1504897504', 'Rafaela', '1959 Josianne Stravenue\nPort Carmineborough, CT 04318-3846', 'North Keith', '2006-04-30 00:00:00', 'Accusantium mollitia libero autem velit qui vel. Culpa deserunt facilis minus possimus. Deleniti et aliquam autem nihil ducimus beatae a aut.', 'Silver'),
(106, 0, 'szboncak@example.com', '1-219-162-5745', 'Ivory', '27379 Kiehn Street\nNew Damionmouth, DC 19348', 'Hegmannfort', '1993-12-20 00:00:00', 'Veniam ut earum repudiandae dolore ratione non. Ipsam recusandae ipsam eveniet maxime. Necessitatibus et debitis occaecati voluptas fugiat odit.', 'Silver'),
(107, 0, 'rbrekke@example.net', '(302)072-6437x887', 'Bryon', '42447 Wiegand Shore Suite 305\nNew Hanna, LA 44523-8183', 'Merrittberg', '1991-05-12 00:00:00', 'Porro enim est enim veniam doloribus rerum. Blanditiis dolores quas autem ducimus quia aut odit. Repellendus quidem et sint molestias temporibus delectus. Eos perferendis hic voluptate doloribus dolor.', 'Gold'),
(108, 0, 'xshanahan@example.net', '733.920.1765x67764', 'Rosella', '589 Quitzon Junctions\nWest Rachelleshire, RI 33061-2447', 'South Newellfurt', '1993-08-25 00:00:00', 'Enim voluptatem tenetur quisquam consequuntur voluptatem. Est vitae sint rem in velit minus. Est enim excepturi a ut modi. Temporibus nam nulla at.', 'Silver'),
(109, 0, 'hayes.janelle@example.com', '1-906-499-0333x507', 'Mavis', '4572 Bednar Road\nLake Malachi, CO 92708-7179', 'New Valerieburgh', '1978-09-15 00:00:00', 'Beatae sequi vero ut ut. Repellendus impedit quo sunt reprehenderit in aut vitae repudiandae.', 'Gold'),
(110, 0, 'jarrod59@example.com', '552.750.9915', 'Yasmine', '9397 Abigayle Flat\nEnriquebury, WA 13664-1865', 'Port Molliebury', '2013-03-30 00:00:00', 'Tempore non occaecati possimus ad et consequatur sed. Minus repudiandae facere necessitatibus ut est iusto qui. Ut rerum voluptatum reprehenderit accusantium. Mollitia eius ea corrupti nesciunt libero voluptates sunt.', 'Premium'),
(111, 0, 'kling.kirsten@example.org', '111-911-1998x426', 'Ophelia', '75466 Gina Spur Suite 620\nRogahnville, NM 29537', 'West Ryleigh', '1971-04-01 00:00:00', 'Quas similique consequatur enim et iusto consequatur dolorem. Odit dignissimos vitae quam ducimus. Est omnis et et facere repellendus dolore corporis similique. Eveniet nobis officia quibusdam ullam ipsam.', 'Free'),
(112, 0, 'lilyan.kuhn@example.org', '(355)021-2273', 'Kian', '13641 Daniel Drive Suite 411\nWest Alejandra, WV 90296', 'Thompsonfurt', '2012-09-27 00:00:00', 'Quae ea ipsum at eos et. Assumenda optio et vel aut. Beatae veniam ut assumenda quod consectetur consectetur ut. Cupiditate ipsa qui adipisci velit nihil et aut.', 'Silver'),
(113, 0, 'ytowne@example.org', '(738)421-4753x62253', 'Dejon', '8797 Koss Street\nPort Era, PA 14594', 'East Kiera', '1994-05-19 00:00:00', 'Voluptatum voluptatum facere pariatur molestias quidem sequi qui. Ut quidem tenetur qui cum incidunt ut. Consequuntur qui nemo error autem quod. Architecto perferendis repellat similique dolores eaque aut.', 'Premium'),
(114, 0, 'ondricka.braden@example.net', '517-897-4790', 'Abner', '19736 Osinski Park Suite 915\nNew George, CA 48931', 'Lake Fleta', '2022-02-23 00:00:00', 'Occaecati in et saepe similique ipsa ab. Ullam consequuntur quo in consequatur expedita voluptatum ab. Laboriosam est ducimus odit debitis aut dolores.', 'Silver'),
(115, 0, 'chalvorson@example.net', '458-887-8816x676', 'Dolly', '177 Buck Knolls\nNorth Lilianatown, CO 53867', 'Hermannmouth', '1978-05-04 00:00:00', 'Pariatur dolor est aut tempora. Excepturi eos fuga omnis velit necessitatibus et. Placeat iusto voluptas quia totam. Odio id eos repellendus nemo consequatur eos.', 'Premium'),
(116, 0, 'cschaefer@example.org', '498.427.6094x1125', 'Emanuel', '51535 Ruecker Estate\nSouth Vida, MA 86028-5995', 'Havenshire', '1985-10-02 00:00:00', 'Et qui repellendus dolores eos ut aut. Sint maxime nostrum ipsum perspiciatis id ab deleniti. Similique nemo voluptatibus rerum. Ut qui quasi quibusdam sit possimus aut. Aut non tempore nihil.', 'Silver'),
(117, 0, 'od\'amore@example.com', '00322710325', 'Jodie', '547 Stephany Court Suite 073\nEast Raul, IL 99645-5417', 'Flatleymouth', '2014-03-02 00:00:00', 'Assumenda amet rem quos est est vero. Dolores non et accusamus perferendis iure. Laudantium sunt voluptas consequatur optio velit reprehenderit rerum. Eos id temporibus perspiciatis.', 'Free'),
(118, 0, 'gene25@example.com', '(771)619-4768', 'Lamar', '582 Roob Rue\nNew Raphaelton, UT 35834-3552', 'Torpfort', '1983-12-31 00:00:00', 'Rem sapiente nihil sed enim vitae magni. Corrupti dolorem veritatis non vel rem assumenda. Velit in odio voluptate consectetur. Eaque qui recusandae reprehenderit facere modi voluptatibus.', 'Premium'),
(119, 0, 'marshall14@example.com', '1-534-813-4250', 'Clementina', '374 Weimann Harbor\nEmersonberg, TN 30972', 'Port Glenda', '2005-11-06 00:00:00', 'Omnis quia eum ad dolorum doloribus. Ad dolore dolorem eaque. Nostrum et voluptas impedit aut autem similique.', 'Premium'),
(120, 0, 'schmidt.tatyana@example.net', '(131)023-9928', 'Mayra', '05260 Dietrich Lodge\nClementmouth, MA 73559-8417', 'South Anabelle', '1976-01-27 00:00:00', 'Aperiam dolore voluptatibus non est recusandae dolorem. Quibusdam et dolorum delectus molestias consequuntur sit laborum quia. Voluptate officia aut reiciendis sit voluptatem aliquam qui.', 'Gold'),
(121, 0, 'mdurgan@example.net', '1-484-871-1052', 'Tess', '99902 Collier Plain\nEast Garrett, AL 81762', 'East Tara', '2015-07-02 00:00:00', 'Cumque eius molestiae nostrum eum. Architecto dolore ratione cupiditate. Alias enim ut minima vel soluta saepe.', 'Silver'),
(122, 0, 'ariel51@example.net', '325.087.0450', 'Fannie', '8239 Ratke Trail\nSouth Toyhaven, AZ 78518-6273', 'Mohrmouth', '1984-04-21 00:00:00', 'Qui distinctio facilis dolorum sit alias autem cupiditate. Illum omnis est enim explicabo quo maiores. Voluptatem magnam eos quia a quidem.', 'Silver'),
(123, 0, 'reynold.armstrong@example.com', '(050)198-9599', 'Jensen', '80806 Augusta Roads\nPort Cesar, ND 11400', 'New Edytheton', '1995-05-22 00:00:00', 'Consequatur voluptatibus optio reprehenderit et. Qui amet magni vel quia placeat. Consectetur in tempora ex impedit.', 'Gold'),
(124, 0, 'giovani.tremblay@example.net', '1-051-444-3958', 'Princess', '047 Hermina Throughway Apt. 258\nSouth Vinnie, NE 38173', 'West Enidland', '2000-02-18 00:00:00', 'Veniam est nisi eaque ea ad error reprehenderit ut. Delectus delectus architecto aperiam culpa rerum dicta. Sit est eum delectus debitis voluptatum et modi.', 'Silver'),
(125, 0, 'jharris@example.org', '(224)608-6695', 'Nyah', '862 Hans Harbors Apt. 786\nPort Brandonchester, NM 08086-8364', 'Lake Gwendolynside', '2011-12-23 00:00:00', 'Sed eius suscipit aut ut nulla tempore. Doloremque quo quo at incidunt aliquid id. Vel ad aspernatur quia ipsa. Tempora repellat autem ab eveniet eaque id.', 'Free'),
(126, 0, 'nicole.schmeler@example.net', '(541)939-2265', 'Rosalyn', '47318 Theodore Oval\nWest Lonniestad, KS 48681', 'Port Myah', '2018-06-16 00:00:00', 'Odio neque eaque et voluptates iusto est. Aut earum doloribus qui modi. Ratione praesentium quia delectus quasi ipsum.', 'Free'),
(127, 0, 'geovanni.jast@example.org', '(269)275-3550x0835', 'Enrico', '796 Jamie Loop\nLake Ivyfort, CO 37458', 'North Clairchester', '1995-12-01 00:00:00', 'Voluptatem harum veniam ipsa esse molestiae. Ipsam et officia minima similique. Sed dolores sed suscipit harum soluta quod quam.', 'Free'),
(128, 0, 'magdalena.jakubowski@example.net', '1-955-184-2171x18243', 'Molly', '5036 Pinkie Row\nCathyshire, OR 05629-5322', 'Rosinashire', '1998-02-07 00:00:00', 'Corrupti voluptate enim tenetur accusantium quia. Facere et est eos voluptatem et exercitationem similique. Provident sit sed aliquid architecto ducimus. Quia recusandae delectus dolores.', 'Free'),
(129, 0, 'lynch.vesta@example.com', '1-827-288-1968x88194', 'Jordi', '878 Reina Gateway\nLebsackshire, OR 34846-6866', 'East Joshchester', '2014-08-09 00:00:00', 'Tenetur a perferendis vel est ducimus suscipit fugit eum. At aut dignissimos quo mollitia aut provident.', 'Gold'),
(130, 0, 'znolan@example.com', '(976)474-1123x61034', 'Sonny', '07161 Kunde Ways Apt. 898\nBrisabury, MO 32538-0185', 'Purdyberg', '2002-01-19 00:00:00', 'Voluptatibus aut qui reprehenderit reiciendis in omnis delectus. Dolores natus atque ea rerum ut. Eum et aut maiores qui sapiente et.', 'Premium'),
(131, 0, 'qbayer@example.net', '103.681.6596', 'Hilda', '5998 O\'Reilly Locks Suite 447\nEast Emmet, MT 63924-2172', 'South Arelyview', '1992-01-21 00:00:00', 'Et ut voluptatibus voluptas quas minima vel deserunt. Inventore maiores non possimus dolor non rerum hic consequatur. Quis suscipit dolore pariatur impedit ut iste.', 'Free'),
(132, 0, 'showe@example.net', '+21(3)5666388824', 'Althea', '6448 Carolanne Flat\nWinstontown, MT 55345-0847', 'East Brian', '1978-03-31 00:00:00', 'Beatae est quia voluptatem eaque. Provident qui fugiat voluptas cumque aliquam rem sint.', 'Silver'),
(133, 0, 'monserrate.kuhn@example.net', '08054771937', 'Aliyah', '84605 Keara Islands Apt. 483\nEast Ana, AZ 77935', 'Carterborough', '2020-12-28 00:00:00', 'Est numquam cumque quos aliquam voluptatem vel. Nulla dolor corporis numquam voluptas. Non porro iure iusto quia non.', 'Premium'),
(134, 0, 'hmills@example.org', '423.573.2712x634', 'Deondre', '10533 Heaney Estates Suite 716\nGracieport, NJ 50228-6547', 'West Aimeeville', '2001-02-21 00:00:00', 'Molestias unde dolorem quasi dolorum quaerat voluptatem. Est ex consequuntur quod non cumque natus laborum. Aut autem dolor velit consequatur aliquam praesentium.', 'Silver'),
(135, 0, 'ujohns@example.org', '1-457-289-4364x45712', 'Camille', '63100 Heloise Harbors Suite 655\nLittelstad, WV 86654', 'Port Darrionburgh', '1983-11-29 00:00:00', 'Quisquam laudantium nihil esse sit voluptatum rerum. Quod voluptatem et quo ea dolores in. Illum rerum perferendis est veritatis excepturi.', 'Premium'),
(136, 0, 'hintz.elena@example.org', '(416)532-8409x1449', 'Giovanni', '9156 Alexys Streets Apt. 056\nEast Bartholomefort, WI 51217-3154', 'West Dorcasberg', '1996-06-09 00:00:00', 'Ab eum ratione quo similique occaecati voluptates. Necessitatibus enim et quidem laboriosam non id dignissimos sint. Perferendis fugiat aut aspernatur cum. Alias quae placeat labore aut voluptatem delectus quae distinctio.', 'Gold'),
(137, 0, 'eveum@example.com', '1-289-211-7159x07651', 'Ola', '24832 Demarco Crossing Apt. 713\nAltenwerthfurt, ID 97788', 'East Alba', '2018-07-26 00:00:00', 'Aut quam quia sunt molestias quas fuga beatae. Minus est voluptates et non amet nisi. Possimus aut maiores dicta laborum. Perferendis aliquam adipisci corporis et dolor. Quis beatae voluptate nemo rem.', 'Free'),
(138, 0, 'cora.goodwin@example.com', '+17(2)5359944944', 'Yvonne', '64159 Parisian Lodge Apt. 446\nDietrichshire, WA 72074', 'Towneside', '1987-08-20 00:00:00', 'Odio molestias eum ut ea aliquam ipsum nemo magnam. Et libero iusto consequatur debitis. Vitae ut hic qui sint. Dolores quo dignissimos neque. Voluptatem qui fugit autem assumenda quidem voluptatum cumque et.', 'Gold'),
(139, 0, 'ari.hansen@example.com', '(070)230-7955', 'Bridie', '161 Kautzer Row\nLake Cordiaville, SC 34900', 'East Audreanneport', '2012-06-24 00:00:00', 'Facilis aliquam at fugiat quo totam. Quibusdam odio veritatis porro quia modi. Dolorum culpa repudiandae rerum sed.', 'Premium'),
(140, 0, 'carli87@example.net', '(279)665-0271x8246', 'Audrey', '70059 Friesen Pine Apt. 343\nEast Eladio, UT 78229-3375', 'Jalonborough', '2010-06-02 00:00:00', 'Recusandae aliquam nobis harum quam est soluta eum. Eos delectus recusandae impedit eveniet error labore ea. Aut fugit nisi quisquam neque sunt consequatur. Nemo dolorem eveniet quia possimus recusandae libero. Unde dicta repudiandae quas.', 'Premium'),
(141, 0, 'victor04@example.org', '807.836.7065', 'Elliot', '400 Nickolas Spring Suite 534\nAdolphusview, FL 74639-3789', 'East Barryton', '1992-09-10 00:00:00', 'Qui voluptas et necessitatibus fugit. Sint similique quisquam nesciunt et ullam. Aspernatur eligendi porro modi aut.', 'Premium'),
(142, 0, 'ylarson@example.org', '230-613-0481x8351', 'Rae', '1008 Anabelle Crescent\nNorth Trevor, AR 38310-1280', 'South Damonshire', '2001-02-25 00:00:00', 'Aliquam et consequatur tenetur autem nemo illum corporis. Doloribus necessitatibus iure perspiciatis necessitatibus quam. Totam est dolore esse quod.', 'Premium'),
(143, 0, 'fgottlieb@example.org', '417.750.7061', 'Margot', '992 Bertrand Parks Suite 984\nWest Kathlynborough, WV 07967', 'Auerbury', '1994-03-06 00:00:00', 'Ut rerum rerum nihil voluptatum. Quos dolor qui ut in autem et. Ut quidem et tempore sit dolor ipsa omnis totam. Iure necessitatibus et harum dolor dolore assumenda.', 'Free'),
(144, 0, 'gborer@example.org', '199.396.9349x052', 'Fern', '649 Alessandra Track\nNikolauston, AR 45880', 'North Joanniechester', '2007-02-13 00:00:00', 'Inventore similique dolor amet dolores doloribus autem quos. Aut enim dolor excepturi aspernatur aliquam similique nisi. Est natus a quam at ut.', 'Premium'),
(145, 0, 'flatley.edward@example.com', '07795105672', 'Adolph', '3459 Coleman Dale\nKeeblerberg, CA 17171-6091', 'Colliershire', '1994-06-23 00:00:00', 'Et est iusto qui laborum repudiandae qui. Accusamus perferendis repellat eos commodi. Labore doloribus nisi dolorum nobis qui. Maxime excepturi nesciunt saepe.', 'Silver'),
(146, 0, 'gmarquardt@example.com', '750-487-5062x10057', 'Ashlee', '80069 Zboncak Lodge\nShanelletown, MD 28839', 'South Veronica', '1990-07-29 00:00:00', 'Est deleniti eum repellendus sint. Fugiat autem qui odio et molestiae laboriosam. Accusamus voluptatem ut beatae ut.', 'Silver'),
(147, 0, 'catalina74@example.net', '(976)572-5571x044', 'Addison', '80518 Cremin Mews\nWest Pattie, NH 07354', 'Jadonshire', '2018-01-21 00:00:00', 'Animi atque quidem consequatur cum voluptas repudiandae ratione soluta. Perferendis expedita commodi ullam expedita voluptatem. Velit corrupti earum totam quas numquam omnis repellendus.', 'Gold'),
(148, 0, 'june.ankunding@example.org', '+42(9)1265282348', 'Annabell', '0848 Hane Road Suite 690\nWest Rosemary, IL 12702-2022', 'South Mistyburgh', '1992-10-24 00:00:00', 'Necessitatibus ea ducimus odio assumenda itaque. Nobis et nisi quis quidem veniam aperiam. Incidunt autem voluptate eum qui consectetur. Possimus non omnis animi ut ipsum. Magnam mollitia distinctio maxime eveniet qui eum molestias.', 'Free'),
(149, 0, 'sboyer@example.net', '595.098.3036', 'Trudie', '363 Quitzon View Apt. 704\nEast Jaymefort, CO 42569-9109', 'DuBuquefort', '1990-11-21 00:00:00', 'Voluptate sed in consequuntur et quo a ipsam. Et inventore itaque esse aut hic vel placeat. Reiciendis reiciendis quos rerum velit et dolore. Eum quibusdam quis necessitatibus dolore expedita.', 'Gold'),
(150, 0, 'bashirian.velva@example.com', '09104321537', 'Evan', '90625 Powlowski Dale Apt. 746\nNew Bernie, RI 74777-9200', 'Lake Taya', '1994-08-11 00:00:00', 'Officia et reprehenderit quia in sint molestiae voluptatem. Quae voluptatum dicta delectus numquam et. Et velit ut fuga molestias libero.', 'Premium'),
(151, 0, 'kihn.mafalda@example.org', '025-926-3084', 'Christop', '18219 Denesik Highway Apt. 924\nBradland, OH 30972-2948', 'Wolffport', '1978-10-21 00:00:00', 'Voluptatibus et non velit quis ipsa. Harum molestias nulla autem ab reiciendis. Culpa aut voluptatibus sit exercitationem quisquam.', 'Free'),
(152, 0, 'nicolette.reichert@example.net', '1-895-215-6399x0789', 'Cordell', '8837 Vincenza Station Apt. 277\nStokesview, TN 74655', 'Jerdeville', '1991-04-08 00:00:00', 'Rem repudiandae adipisci ab porro asperiores molestias perferendis. Modi similique qui quae accusantium sint. Qui accusamus ipsum dolorum ducimus.', 'Silver'),
(153, 0, 'ransom48@example.org', '325-710-6080', 'Vesta', '401 King Branch\nPort Kaleville, UT 84027-4191', 'South Annabelleport', '2002-06-23 00:00:00', 'Quam provident quo quia voluptas. Consequatur excepturi ullam accusamus quibusdam.', 'Gold'),
(154, 0, 'dean60@example.org', '689.789.4686x499', 'Simeon', '8217 Walsh Neck\nNorth Samsonbury, HI 01818', 'Claraberg', '1978-04-08 00:00:00', 'Odio porro saepe quia reiciendis aut eligendi. Ipsum nisi veniam quos et. Recusandae quia debitis ut quisquam ut impedit asperiores. Ipsum ea nobis quod qui autem incidunt.', 'Gold');
INSERT INTO `individual` (`id`, `status`, `email`, `phone`, `name`, `address`, `city`, `since`, `description`, `packet`) VALUES
(155, 0, 'annie.lang@example.com', '1-560-206-3223x21497', 'Emma', '331 Jacobson Circles Apt. 339\nSouth Andrewchester, ME 86479', 'Robbiemouth', '2000-06-24 00:00:00', 'Sit similique occaecati et consectetur. Fuga odio sed suscipit reprehenderit voluptas ut. Accusamus autem qui pariatur et.', 'Premium'),
(156, 0, 'rmurphy@example.net', '05288206398', 'Deontae', '8185 Stefan Pike\nKuphalfurt, NH 92907', 'Port Bonitahaven', '2022-02-15 00:00:00', 'Sequi quas quasi velit eveniet rerum. Et suscipit quo doloremque totam. Molestiae voluptatem et molestiae.', 'Silver'),
(157, 0, 'dtoy@example.org', '1-396-660-4923', 'Christy', '454 D\'angelo Stravenue\nAdamschester, KS 68361-5755', 'Frankmouth', '2000-01-29 00:00:00', 'Accusamus ea est esse laboriosam. Rerum molestias enim delectus voluptatum voluptatem.', 'Silver'),
(158, 0, 'narciso00@example.com', '753-295-5065', 'Lucio', '683 Genoveva Shores\nAubreeberg, FL 45619-7276', 'Port Roman', '1989-08-01 00:00:00', 'Quas a error dolores laudantium dolore quis ratione. Aliquid rerum ad dolores sint consequatur et ut.', 'Silver'),
(159, 0, 'luettgen.mia@example.net', '403-144-0489', 'Bridget', '38293 Reichert Camp Apt. 173\nNew Trenton, OH 17162-9038', 'Mistystad', '2009-07-30 00:00:00', 'Nesciunt vel dolor ex a quia. Corporis est quis enim sed.', 'Silver'),
(160, 0, 'rylee86@example.net', '865-737-9366', 'Eliane', '1511 Sawayn Forks\nWest Jazminville, NV 16132-3474', 'North Scottie', '1987-11-15 00:00:00', 'Sit est quidem repellendus. Nam quos voluptatem eaque voluptatem assumenda est suscipit velit. Non natus delectus id expedita possimus iste. Odio ea facere vitae quae.', 'Silver'),
(161, 0, 'turcotte.brooks@example.net', '(907)748-7948', 'Trystan', '0725 Kassulke Rue Suite 489\nLake Susieview, HI 68832-1685', 'East Olgabury', '2017-12-16 00:00:00', 'Est et sit quo id beatae alias. Voluptatem voluptatum occaecati consectetur ut. Natus nam reiciendis aut praesentium incidunt sint in repellendus.', 'Silver'),
(162, 0, 'torp.payton@example.net', '217-227-3537x6232', 'Maiya', '3035 Considine Divide Apt. 179\nDickiburgh, NM 97443', 'Wilfordberg', '1988-05-06 00:00:00', 'Autem nam modi eos officiis. Enim autem nihil eaque necessitatibus dolorem minus. Qui tempore nesciunt culpa quo harum nemo.', 'Free'),
(163, 0, 'jeanne73@example.org', '756.656.0945', 'Leda', '3427 Schultz Plains Suite 515\nWest Laruehaven, AR 55814-4424', 'Hyattbury', '1997-05-12 00:00:00', 'Aut reiciendis eaque quaerat. Nulla natus perferendis voluptatum.', 'Premium'),
(164, 0, 'xjaskolski@example.net', '1-976-611-0221', 'Jovany', '65385 Skyla Drive Apt. 170\nAlessiastad, AR 19922', 'Bartolettishire', '1988-12-26 00:00:00', 'Vero dolores enim voluptatem consequatur vel optio. Officia pariatur et et. Autem quia ut veniam quod et.', 'Free'),
(165, 0, 'beer.aida@example.com', '157-632-2052x527', 'Agustina', '505 Heller Stravenue\nStoltenbergstad, MS 65735-7597', 'West Julieshire', '2021-09-18 00:00:00', 'Non nihil sunt delectus sed molestias. Voluptas labore reprehenderit autem velit saepe eius eaque cupiditate. Velit sequi quis autem placeat.', 'Premium'),
(166, 0, 'rasheed63@example.org', '732.771.2623x261', 'Kyleigh', '526 Ruecker Shoal\nEast Linnea, MT 39648', 'Darronview', '2012-02-29 00:00:00', 'Est alias eius ipsum ut autem. Repellendus deserunt quis dicta et. Repellat asperiores occaecati praesentium aspernatur atque mollitia.', 'Gold'),
(167, 0, 'leone.barrows@example.net', '009.709.7195x938', 'Markus', '491 Deangelo Lights Apt. 701\nWest Wilbert, TX 27634-7664', 'Trantowmouth', '2003-02-04 00:00:00', 'Quia veniam sit eos. Aliquid placeat eius minus omnis sit provident quisquam. Porro provident libero in. Eaque culpa dolores consequuntur maxime.', 'Premium'),
(168, 0, 'hessel.sylvester@example.com', '(967)819-9191', 'Tracey', '7210 Kitty Underpass\nGoyetteport, MT 65219-6384', 'Durganchester', '2011-12-01 00:00:00', 'Nihil et facere accusamus dignissimos aliquam odit cum consequatur. Consequatur unde itaque ex voluptates. Ea vel voluptates consectetur quia consequatur accusamus. Asperiores tempore asperiores et nostrum.', 'Silver'),
(169, 0, 'toy.jeanie@example.org', '1-463-570-9597x62809', 'Tillman', '1145 Kolby Roads Apt. 263\nLake Joseph, NJ 17467', 'East Dahlia', '1980-11-01 00:00:00', 'Eius eligendi beatae illo quis officia perferendis error voluptatibus. Sit est eos labore similique. Eveniet veniam sed labore. Quae adipisci voluptates asperiores. Modi debitis corporis est eius porro id aspernatur.', 'Free'),
(170, 0, 'natasha.hamill@example.org', '1-340-522-7727x37882', 'Carrie', '176 Reyna Dale Suite 512\nMaxwelltown, VT 88098', 'Danielside', '1992-07-20 00:00:00', 'Labore ipsa tempora consequatur nam minus. Officia voluptates praesentium dolore nesciunt porro enim qui. Natus earum qui nulla repudiandae voluptas non. Aliquam rerum a modi.', 'Premium'),
(171, 0, 'koelpin.chelsie@example.com', '+19(0)3951258780', 'Archibald', '988 Thelma Plains Apt. 685\nNew Sasha, DC 01525', 'Avishaven', '1984-12-09 00:00:00', 'Quia labore hic eum vel et ratione dolores accusantium. Veniam ullam ullam doloribus corrupti. Natus eos nesciunt enim laboriosam. Atque officiis id excepturi sit.', 'Gold'),
(172, 0, 'flindgren@example.org', '974.771.1815x54764', 'Thora', '12793 Franecki Land\nAdolphport, NE 84962-1629', 'Marlinland', '1996-01-29 00:00:00', 'Culpa blanditiis nostrum deleniti ab. Laboriosam omnis voluptatem ea voluptatem quas. Deserunt sapiente dolor repellendus. Cupiditate nam harum voluptas ipsum eos ut accusamus quia.', 'Free'),
(173, 0, 'mohr.evans@example.org', '063-790-2811x9639', 'Westley', '674 Wiza Gardens\nSouth Mittiechester, IA 39414', 'New Keon', '1988-06-08 00:00:00', 'Non explicabo quam deserunt minus. Veniam impedit perspiciatis et dolores totam suscipit consequuntur. Dicta voluptas aut fuga corporis qui.', 'Silver'),
(174, 0, 'lucio39@example.net', '159.490.7494', 'Leatha', '3610 Breana Springs\nParismouth, CO 38830', 'Lake Nicklaus', '2012-06-21 00:00:00', 'Occaecati enim sequi voluptatem eos consequatur natus consequuntur tenetur. Qui quisquam et perspiciatis molestiae qui explicabo iste. Enim non earum nulla quo corporis. Quia dolorem aliquam quia aut quasi excepturi aut.', 'Gold'),
(175, 0, 'kariane.beatty@example.net', '251-749-0638x547', 'Reinhold', '94878 Hodkiewicz Summit\nWindlertown, TX 62064', 'South Eladio', '1981-09-14 00:00:00', 'Et veritatis dolor voluptatibus voluptas odio. Mollitia numquam explicabo officia. Nam numquam quo et molestiae perferendis voluptas nihil autem. Id veritatis ut ad est debitis laudantium eaque.', 'Gold'),
(176, 0, 'alec.leannon@example.net', '1-870-781-2996x51078', 'Madge', '660 Berge Row\nNew Bailey, SD 16794', 'Hahnport', '1996-02-09 00:00:00', 'Commodi et amet modi perferendis illum accusantium culpa. Saepe tempora eveniet soluta unde laudantium ea eos eos. Vel excepturi aspernatur molestias.', 'Free'),
(177, 0, 'fausto16@example.net', '(453)160-6382x54048', 'Kenny', '55096 Kiara Key Apt. 879\nLake Eula, AK 22299-7860', 'South Major', '2003-03-20 00:00:00', 'Animi voluptates laborum et eos. Eligendi illo dolor nesciunt doloremque. Veritatis quo eveniet itaque numquam quia aut asperiores ut. Cum optio aliquid aliquid et et fugiat.', 'Silver'),
(178, 0, 'emil86@example.org', '808.986.5436x5466', 'Dale', '3215 Nader Trafficway Suite 088\nPort Devan, NY 63655', 'Modestaland', '1996-06-18 00:00:00', 'Ea ratione ullam quis voluptas et aliquam. Odit voluptates ipsa omnis sit quisquam praesentium. Reiciendis beatae in vitae illo eveniet dignissimos. Error aut quia voluptatem numquam.', 'Premium'),
(179, 0, 'moore.karley@example.net', '321-330-5334', 'Adolphus', '8191 Satterfield Crossing\nPort Jarred, HI 64377', 'Port Tyrellport', '1983-10-19 00:00:00', 'Recusandae quis veniam aut error iure. Nobis numquam quo eos voluptatem. Voluptates provident fugit consequatur dolor omnis occaecati quas.', 'Free'),
(180, 0, 'kamryn.heidenreich@example.org', '409-488-7443', 'Arden', '59677 Alessia Vista\nSauerburgh, MS 84779-2045', 'Kemmermouth', '1988-03-14 00:00:00', 'Illum iste eos quia nesciunt odit. Officiis et aut fugiat in.', 'Gold'),
(181, 0, 'fthiel@example.com', '+36(6)0568795283', 'Lelah', '452 Conroy Drive Suite 490\nWalkerfurt, NM 35988', 'West Katelinborough', '1995-08-15 00:00:00', 'Ut expedita velit dolores dolorum consequatur qui et eum. Commodi repellat nihil qui. Impedit quaerat quis omnis iste.', 'Gold'),
(182, 0, 'amara06@example.net', '1-055-376-6811x180', 'Aurelie', '32641 Altenwerth Curve\nEast Jalon, AZ 65900', 'Garnettburgh', '1993-02-08 00:00:00', 'Molestiae nisi quam aliquid impedit doloribus ut. Eos sit recusandae illo non officia. Est aut fuga mollitia officiis. Quis quae eius optio quia repudiandae est in.', 'Premium'),
(183, 0, 'anthony.conn@example.net', '153-445-7009', 'Herbert', '40307 Collins Stream Suite 069\nNew Angelotown, CA 51043-0960', 'Augusthaven', '2005-02-23 00:00:00', 'Earum qui est doloribus. Veritatis omnis nihil delectus expedita exercitationem. Dolores aut velit unde magnam consequatur.', 'Premium'),
(184, 0, 'lonzo.kutch@example.com', '1-645-873-7268x39821', 'Nakia', '588 Junius Street Suite 552\nMuellershire, IA 87726-0453', 'Muellermouth', '2016-05-02 00:00:00', 'Et ipsa itaque odio sunt sed error. Ut eligendi aut rerum placeat asperiores laudantium. Officia eius molestias sit quia. Ea qui quo explicabo earum est accusamus.', 'Gold'),
(185, 0, 'orion85@example.org', '497.427.9951x11508', 'Heather', '7199 Vandervort Underpass\nEast Kraigside, MT 54539-6965', 'Howeshire', '2002-04-21 00:00:00', 'Vel labore optio possimus tenetur ut officia. Voluptate eum velit corrupti. Autem molestiae voluptas voluptatem deleniti non soluta numquam.', 'Free'),
(186, 0, 'leonora30@example.org', '793.521.5455x641', 'Coty', '43413 Granville Square Suite 679\nLake Jamaal, CA 75771', 'Georgettestad', '2008-07-02 00:00:00', 'Modi dolorum ut sit quibusdam. Tempora ipsa saepe aliquid in exercitationem ipsam. Doloribus temporibus enim consequatur rerum. Amet aut expedita soluta.', 'Premium'),
(187, 0, 'borer.giuseppe@example.com', '1-151-400-1681x49882', 'Linnea', '01263 Cleo Manors Suite 693\nNorth Traceyland, IA 71147-0909', 'Mosciskishire', '1988-08-04 00:00:00', 'Et autem autem sed dolorum. Laboriosam veritatis maiores dolorem exercitationem. Nobis et sed nemo pariatur.', 'Gold'),
(188, 0, 'isabelle07@example.com', '(678)803-7054x42937', 'Macy', '3198 Chris Prairie\nCarrollton, TN 03071', 'Pearlieview', '2000-01-06 00:00:00', 'Magni quasi quis rerum omnis et reiciendis. Ipsa quam autem dolorem quos. Suscipit assumenda inventore qui earum quia. Odit quae quae saepe sunt.', 'Silver'),
(189, 0, 'wendy96@example.com', '1-227-204-0618x45996', 'Susie', '893 Jabari Crest Apt. 328\nHeidenreichview, UT 76704-8798', 'North Joy', '2003-04-26 00:00:00', 'Assumenda dolorem et voluptas labore et beatae. Ut dolores et at sapiente dicta accusantium ullam. Doloremque veritatis qui incidunt in velit quasi tempora. Aut sapiente at sit adipisci voluptate dignissimos. Neque suscipit sit aut molestiae quis dolorem ', 'Premium'),
(190, 0, 'bherman@example.com', '(298)331-5948', 'Virginie', '219 Lucinda Ranch\nSatterfieldfurt, MS 00870-3490', 'East Amyamouth', '1973-02-14 00:00:00', 'Officiis assumenda corporis qui veniam. Aut iure sed ut ipsum molestiae architecto dolores.', 'Silver'),
(191, 0, 'oscar40@example.org', '1-764-893-8892x9678', 'Milton', '2134 April Keys\nLake Travon, VA 91536', 'Casperfort', '1981-02-28 00:00:00', 'Numquam corporis dolorum suscipit nemo necessitatibus. Ipsa ea molestiae suscipit nemo quae. Ipsam est dolor vel voluptatem. Eaque est aut quam laboriosam enim pariatur. Non dolores quis iure voluptatem non aut.', 'Premium'),
(192, 0, 'pdonnelly@example.org', '330.740.3352x64066', 'Geovanny', '10908 Kiehn Dam Suite 971\nNorth Missouribury, DC 24153-8216', 'New Bradlyside', '1982-09-21 00:00:00', 'Mollitia id consequuntur voluptate atque molestiae. Eius itaque quidem voluptatem quidem voluptates. In necessitatibus aut officiis dignissimos. Beatae delectus tenetur ut mollitia velit dolore.', 'Free'),
(193, 0, 'candace04@example.net', '192.516.1586', 'Marina', '846 Morar Tunnel\nLake Asia, CT 93174', 'New Harleystad', '1977-02-28 00:00:00', 'Sunt porro porro error soluta voluptatibus consequuntur. Enim sit libero sint officia minus enim velit.', 'Silver'),
(194, 0, 'alva09@example.net', '1-925-627-8373', 'Dale', '15209 Douglas Villages\nLinwoodbury, IN 29865', 'South Earnestinefort', '2007-12-19 00:00:00', 'Voluptatum dolores excepturi architecto sint. Commodi aut corrupti dolorem non rerum optio sed. Dicta incidunt eveniet dolorem quaerat delectus deleniti eum sed. Ex debitis repellat quae sed illum omnis quia qui.', 'Free'),
(195, 0, 'bquitzon@example.net', '1-532-033-0918x2860', 'Robin', '3171 Lakin Streets Suite 972\nLake Larue, NC 55512', 'West Annabeltown', '2021-06-22 00:00:00', 'Eos sed quaerat eos earum perferendis sit repellendus et. Est ut debitis eum et blanditiis minus. Occaecati ipsa possimus recusandae quaerat. Vel ipsum dolores et optio.', 'Gold'),
(196, 0, 'jbahringer@example.com', '1-608-421-0215x595', 'Bella', '6020 Roman Village Apt. 545\nClairfurt, NY 93139', 'Schultzbury', '1989-12-07 00:00:00', 'Molestiae aperiam inventore quo. Vitae voluptas velit dolorem laborum aut temporibus nam. Sequi et esse possimus labore alias enim. Et voluptatem sit qui qui mollitia.', 'Gold'),
(197, 0, 'iwest@example.com', '045.419.3485x252', 'Adele', '190 Jaeden Well Apt. 850\nWest Alexandriaside, WY 13354-5167', 'Hodkiewiczshire', '1989-05-14 00:00:00', 'Quod tempora in labore eveniet reiciendis sequi. Distinctio blanditiis alias corporis voluptates aliquam qui sit accusantium. Itaque ratione iste cumque sunt at voluptate sed ea.', 'Silver'),
(198, 0, 'adelbert.gleichner@example.net', '(696)536-6677', 'Rocky', '7969 Feeney Unions\nEast Bufordhaven, DE 14635', 'West Lilian', '1994-04-12 00:00:00', 'Ipsum ut aut iusto eos est laborum quisquam. Dicta enim nesciunt maiores totam numquam explicabo culpa enim. Molestiae assumenda omnis cum quod nobis nostrum.', 'Premium'),
(199, 0, 'zmetz@example.com', '280-707-1842x518', 'Kamille', '99878 Martin Dam Apt. 413\nNorth Ola, WY 15807', 'Jovannyview', '1997-09-20 00:00:00', 'Modi eveniet corrupti quia hic. Vel sed atque id quasi et repellat et.', 'Gold'),
(200, 0, 'mullrich@example.com', '(120)884-1399x8555', 'Cierra', '7368 Kovacek River Suite 136\nLake Annabell, UT 12357', 'Lake Bradly', '1971-08-13 00:00:00', 'Autem qui labore rerum dolores et. Unde soluta sapiente sequi blanditiis qui sit explicabo. Corporis ea dolor architecto aut.', 'Premium'),
(201, 0, 'ludwig69@example.net', '843-473-2802', 'Marcel', '1078 Kohler Cove Apt. 034\nEast Travisfurt, AR 76323', 'West Vern', '1984-12-13 00:00:00', 'Voluptas velit eos aspernatur. Blanditiis consequatur cupiditate vitae est. Est adipisci quo excepturi esse est.', 'Premium'),
(202, 0, 'colleen.klocko@example.org', '952.309.9878x1008', 'Mertie', '990 Domenica Terrace Suite 062\nNorth Davion, WA 65447-2877', 'North Reba', '2011-10-23 00:00:00', 'Saepe eveniet vel et suscipit non fuga porro. Ut quod pariatur ut est possimus ut. Architecto maxime sed est. Hic aperiam vel sunt placeat necessitatibus atque libero.', 'Free'),
(203, 0, 'natalia96@example.org', '+09(9)9732895951', 'Mariano', '271 Daugherty Ways Apt. 731\nNorth Ellen, PA 99663-5846', 'East Isobelton', '2011-03-29 00:00:00', 'Enim aut et omnis. Ipsa sint molestiae facere sit sed. Autem nulla enim sunt quia.', 'Silver'),
(204, 0, 'alexys54@example.org', '+14(0)8174499080', 'Else', '81435 Stacey Lakes\nPort Arvillaland, NY 04685', 'West Johnnyfurt', '2000-01-11 00:00:00', 'Libero veniam quaerat quas molestiae odio nobis minima reiciendis. Accusantium est odio deserunt nihil. Et ut ea reprehenderit rerum optio. Provident reiciendis iste aut non.', 'Free'),
(205, 0, 'flavio42@example.net', '(471)724-8793x41778', 'Marie', '09500 Shayne Path Suite 412\nReidchester, KS 14361-1296', 'South Hazle', '2007-06-13 00:00:00', 'Perspiciatis illum quia sed quia cupiditate nostrum. Rerum ut at ratione sunt adipisci consequatur et. Quae quo cupiditate et molestiae quis et distinctio consequatur.', 'Gold'),
(206, 0, 'wendy38@example.com', '(357)391-2219x66283', 'Freddy', '59464 Lauryn Turnpike\nLevifort, NV 89705', 'Lake Anafurt', '1983-07-26 00:00:00', 'Eum nobis ullam rem rerum accusantium. Eos dolores harum a itaque. Impedit ducimus eligendi perferendis hic qui. Ab accusamus eum in aut reiciendis qui.', 'Free'),
(207, 0, 'adickens@example.org', '1-052-167-7249', 'Edyth', '038 Johns Street\nNorth Oliverport, MT 13061-8611', 'South Montana', '2018-09-30 00:00:00', 'Quia expedita dolorem in iure cupiditate in. Incidunt harum iste in et in. Voluptatibus recusandae architecto nam ratione odio ipsum aliquid.', 'Silver'),
(208, 0, 'conner.legros@example.org', '1-628-361-2843x28316', 'Marcelino', '169 Pansy Village Suite 463\nNorth Barneyview, AZ 81659', 'Casperborough', '1991-04-08 00:00:00', 'Sit fugit occaecati beatae atque eos amet tenetur ut. Perspiciatis quos sunt deserunt ipsam vel enim quasi. Non culpa velit sint earum quis nihil minus. Et praesentium dicta non voluptatem.', 'Premium'),
(209, 0, 'lilla73@example.net', '+66(3)2825734071', 'Yazmin', '2024 Klein Hills\nEbertmouth, VT 24368', 'North Jarvis', '1981-03-26 00:00:00', 'Reiciendis dicta iste dicta harum nihil qui. Quasi aut laudantium error at quae est. Eius ut quod illo. Autem eum cupiditate in itaque est. Temporibus voluptas facilis aperiam facilis consequatur sint praesentium.', 'Gold'),
(210, 0, 'ikoepp@example.com', '(060)431-6858x6195', 'Payton', '84648 Angelina Estates Apt. 829\nWest Chadrick, SD 56857', 'Newelltown', '2012-02-27 00:00:00', 'Quibusdam suscipit qui ut sit corrupti. Rem eveniet aperiam dolorum voluptatem et enim. Omnis pariatur beatae similique est dolor est aliquam.', 'Silver'),
(211, 0, 'mueller.crystel@example.net', '1-745-141-5987', 'Kenya', '4474 Thomas Union Suite 150\nWuckertview, DE 45056-0932', 'South Kristin', '2022-02-28 00:00:00', 'Quisquam tempora corporis ut illum similique. Quia qui aspernatur fugiat. Pariatur ipsa quasi aut labore velit placeat quod. Doloribus in minima ipsum.', 'Silver'),
(212, 0, 'yhegmann@example.org', '944-589-8939', 'Gaston', '8794 Aglae Underpass\nTabithaport, ID 51071', 'Konopelskiside', '2002-09-23 00:00:00', 'Ducimus mollitia consequuntur eos facere consequatur. Aliquid atque sed laborum explicabo et quis voluptatem. Recusandae sunt quia aut aut cumque quae possimus. Quia doloribus soluta molestiae fugit quod magni.', 'Premium'),
(213, 0, 'marlon.tromp@example.com', '080-430-3741', 'Laura', '73863 Cynthia Fork\nLake Jermaine, IA 04581', 'Alfredafort', '2013-02-15 00:00:00', 'Quae vitae atque cupiditate sit. Deleniti omnis veniam nostrum vel debitis voluptatem. Ea blanditiis non sit sunt eius. Sed error veritatis neque architecto ea iure.', 'Free'),
(214, 0, 'brendan.veum@example.net', '042.172.3339x7415', 'Danial', '03262 Lazaro Vista Apt. 256\nBarbarabury, CA 10245-1065', 'South Julianneburgh', '1993-11-18 00:00:00', 'Nemo voluptas eveniet a dignissimos tempore optio. Ea dolores sit dolores corrupti id ut eos. Excepturi dolorem enim et odio consequuntur natus.', 'Silver'),
(215, 0, 'ischamberger@example.net', '(658)609-0639x85937', 'Victor', '195 Alexandrine Vista Suite 900\nGerlachland, ME 37788', 'Lake Romaine', '2019-06-10 00:00:00', 'Aut sed fugiat et quia qui et dicta. Eos inventore harum doloribus nesciunt quos praesentium. Aliquid unde ab nobis maiores voluptatibus rerum.', 'Premium'),
(216, 0, 'dlynch@example.net', '797.956.8655', 'Ernest', '6118 Ardith Roads\nSawaynland, MD 91844-5548', 'Brendenfort', '1989-10-23 00:00:00', 'Expedita quis velit asperiores delectus quae fugiat eaque. Sunt ipsam maxime rerum doloribus eveniet quaerat soluta. Necessitatibus deserunt deleniti ratione voluptatem vero assumenda. Quibusdam quas occaecati est.', 'Premium'),
(217, 0, 'nikolaus.retha@example.com', '1-377-934-3249', 'Cyrus', '8779 Tromp Place Suite 508\nBalistreritown, PA 37609-4742', 'South Coltburgh', '1986-07-13 00:00:00', 'Nisi provident alias non occaecati tempora. Explicabo aut mollitia blanditiis dicta et iste. Voluptas est qui sit alias molestiae totam dolores.', 'Premium'),
(218, 0, 'fpollich@example.net', '1-334-865-1269', 'Nathanael', '464 Chad Rapid\nCielomouth, GA 10971-5043', 'Rippinville', '1993-10-10 00:00:00', 'Consequuntur saepe similique fuga cumque. Dolorem maiores est quam laboriosam suscipit. Incidunt eligendi et sed possimus doloremque.', 'Premium'),
(219, 0, 'uroberts@example.net', '1-505-825-6030x2816', 'Julius', '288 Koss Course\nDandrefort, NM 84918-4479', 'Halvorsonburgh', '1975-01-06 00:00:00', 'Sit architecto earum aut. Similique quia adipisci et. Facere nisi eos ipsum quia omnis neque. Reprehenderit ut minima voluptatem id similique ipsam.', 'Free'),
(220, 0, 'schmitt.isabella@example.org', '(585)880-9731x2885', 'Kasey', '649 Cormier Islands\nIsaifurt, NY 55576-9581', 'Willtown', '2021-07-14 00:00:00', 'Eaque et porro unde suscipit. Qui voluptates accusantium voluptates accusamus porro mollitia saepe. Eveniet itaque eaque cupiditate veniam.', 'Free'),
(221, 0, 'wallace27@example.net', '+07(8)1836346052', 'Lea', '72351 Kutch Place\nSouth Dolly, NH 68974', 'North Oraview', '2018-06-02 00:00:00', 'Deserunt asperiores nulla libero soluta itaque eaque accusamus. Ipsa sint quasi eius repellat. Recusandae dolore ut qui quas assumenda. Tenetur totam esse ad sit.', 'Gold'),
(222, 0, 'alexanne.hettinger@example.org', '+84(3)2324840382', 'Melissa', '7974 Mitchell Point Apt. 599\nSouth Kennaland, AL 71615-4454', 'West Zetta', '1974-12-14 00:00:00', 'Sint quia placeat eos. Est rerum sunt sed voluptatibus est. Explicabo unde architecto sint.', 'Silver'),
(223, 0, 'hammes.joanie@example.net', '1-011-328-7724x093', 'Lucy', '453 Rosalyn Crescent Suite 195\nPort Rebecaview, NH 00668', 'Boehmport', '2001-07-19 00:00:00', 'Asperiores quasi dolore aliquid laborum id. Et voluptas possimus tempora eligendi. Eaque voluptate delectus ducimus maxime voluptatem enim. Non id quaerat culpa at sed illum.', 'Gold'),
(224, 0, 'kayla.stiedemann@example.org', '(567)461-1501x170', 'Ramona', '7459 Ratke Drive\nWest Layne, WY 24421', 'South Berniece', '2015-01-04 00:00:00', 'Et et ex sed sapiente error. Saepe et error quo occaecati iure. Assumenda quis deserunt culpa nihil nihil quaerat.', 'Gold'),
(225, 0, 'nolan.jamarcus@example.org', '+25(5)7762883050', 'Emely', '39351 Hamill Loaf Suite 337\nLednerton, KS 69746-1923', 'Bergstromfort', '2007-09-12 00:00:00', 'Aspernatur veritatis vitae nostrum. Corporis explicabo eaque sapiente aut voluptas in. Vitae at assumenda voluptatem iusto deleniti error.', 'Gold'),
(226, 0, 'littel.vidal@example.net', '860.448.6699x7653', 'Kraig', '599 Schuppe Plains Suite 100\nVandervortstad, AZ 05755', 'Pollichtown', '2013-02-06 00:00:00', 'Necessitatibus libero quas et quo optio. Dignissimos fugiat similique tempore eos numquam temporibus cupiditate. Necessitatibus ut iure nobis. Sunt aliquid quo sit dignissimos ducimus id et. Autem tenetur tenetur sed ducimus nisi.', 'Silver'),
(227, 0, 'iboyer@example.org', '083-541-5678', 'Salvador', '669 Beatty Row Suite 283\nWest Aditya, FL 62729', 'Leonelport', '2012-10-10 00:00:00', 'Quo dignissimos sit fuga perferendis odio dolor voluptate earum. Architecto maiores possimus quia vero voluptatem dolores ut repudiandae. Aut corrupti quis fugit illum. Et unde possimus enim libero consequatur dignissimos nulla voluptatem.', 'Free'),
(228, 0, 'ikautzer@example.net', '558.767.1385x435', 'Zack', '718 Aisha Isle\nLynchtown, UT 33665-4852', 'Kuhntown', '1993-04-24 00:00:00', 'Et quas odit veniam dicta. Itaque deleniti dolore consequatur reiciendis.', 'Free'),
(229, 0, 'williamson.christy@example.net', '06840845252', 'Van', '7206 Rylee Passage Suite 808\nMarvinmouth, FL 41137-0995', 'Garlandmouth', '1995-09-12 00:00:00', 'Unde voluptas nam iusto hic iure quae sed. Nostrum necessitatibus et sed. Ut quaerat nisi veritatis soluta nobis qui omnis molestias. Atque sed libero eaque sit nihil unde. Enim consequatur ex excepturi non explicabo.', 'Silver'),
(230, 0, 'aubree05@example.com', '1-167-676-7097', 'Vladimir', '51225 Catherine Light\nNorth Ephraim, AR 06315', 'Port Shad', '2009-05-19 00:00:00', 'Quae suscipit et sit nihil pariatur voluptatem quam. Laboriosam reprehenderit ut quas. Dignissimos labore dolore dolor nemo.', 'Silver'),
(231, 0, 'haag.blanche@example.com', '707-352-3297x13570', 'Thomas', '66381 Daugherty Alley Suite 041\nPort Retha, IN 82117', 'Alessandrotown', '1973-03-25 00:00:00', 'Repellendus molestiae facilis aliquam ad sit quibusdam tenetur aperiam. Facilis molestias distinctio omnis odio esse quo. Dolorum ut qui suscipit. Incidunt in voluptatem possimus qui. Sit ea quasi sed dolores quam.', 'Gold'),
(232, 0, 'huels.camylle@example.org', '784-301-6400', 'Maxwell', '136 Hildegard Stream Apt. 761\nCummerataberg, NV 77831', 'Reecebury', '2007-10-12 00:00:00', 'Nisi est enim fugit minima magni incidunt sint. Doloremque perferendis omnis eaque maxime molestiae vero. Dolores vel velit nulla delectus iste deserunt. Rerum nulla aut tenetur necessitatibus autem velit.', 'Silver'),
(233, 0, 'chilpert@example.org', '419-434-9971x9552', 'Emiliano', '27976 Kuphal Mission\nArmandobury, KS 84291-2480', 'Lake Lauryn', '2001-05-17 00:00:00', 'Est cupiditate aut porro quisquam ratione. Accusantium sunt quam corporis quibusdam. Quam ut quas labore. Adipisci alias enim modi aliquam qui et.', 'Silver'),
(234, 0, 'collier.garland@example.org', '351.425.5681', 'Brennan', '1445 Purdy Club\nMurazikbury, AZ 47761', 'West Kaleb', '2003-11-13 00:00:00', 'Impedit quidem doloribus velit consequatur qui. Asperiores voluptatem officiis voluptatum vel. Quo nemo expedita consequuntur magnam quis et labore ipsa.', 'Free'),
(235, 0, 'ccronin@example.org', '404.276.5777x312', 'Irwin', '546 Isaias Grove\nNorth Louisamouth, WA 08651', 'Gaylordland', '2000-12-28 00:00:00', 'Voluptatem quisquam ipsa et. Quia tempora molestiae quaerat et. Doloremque consequatur quia pariatur qui impedit porro necessitatibus eaque.', 'Silver'),
(236, 0, 'ciara01@example.net', '201.610.4054', 'Johnnie', '845 Rath Harbors Suite 452\nEast Dominichaven, ME 06123-1929', 'O\'Connermouth', '2014-09-12 00:00:00', 'Molestias qui modi deserunt natus veritatis ad. Ex ut non perspiciatis natus rem est odio. Minus beatae voluptas nesciunt libero aliquid quia commodi. Nisi maiores earum totam consequatur sit consequatur dolore sapiente.', 'Premium'),
(237, 0, 'brice@example.org', '00012232169', 'Trycia', '98443 Judge Mount Apt. 558\nWest Art, NE 74622', 'Lake Krystal', '1995-02-16 00:00:00', 'Consequatur qui quia reiciendis iusto laudantium voluptatum. Rerum accusamus deleniti sint architecto. Soluta pariatur laborum possimus a. Porro in alias corrupti aliquid necessitatibus sequi.', 'Silver'),
(238, 0, 'twalsh@example.net', '1-385-740-3063x96982', 'Zaria', '01701 May Fort Apt. 204\nNorth Jeffryview, NV 17041', 'Annamarieview', '1999-02-25 00:00:00', 'Et et amet sed recusandae hic. Vitae aperiam odio expedita autem ea nobis. Molestiae iusto cumque corrupti voluptas pariatur et deleniti.', 'Silver'),
(239, 0, 'cnienow@example.com', '688.441.5801', 'Miller', '4244 Shania Meadow Apt. 855\nYundtchester, ND 96802', 'Shanahanmouth', '2020-02-20 00:00:00', 'Eum quidem aspernatur modi in. Laudantium saepe maiores aut rerum vel. Incidunt ex architecto perferendis unde magni totam quibusdam rem.', 'Silver'),
(240, 0, 'rosamond63@example.org', '(931)533-2372x202', 'Jamal', '290 Scottie Lakes Suite 589\nEast Berneice, MD 88514', 'West Lueborough', '2012-04-22 00:00:00', 'Voluptatem dolor est non est. Et maxime tenetur mollitia enim sed porro. Eos commodi consequatur odio.', 'Premium'),
(241, 0, 'hauck.allan@example.net', '1-802-214-8058x2705', 'Georgette', '83268 Wuckert Plain\nLinwoodchester, ME 77256', 'West Tessieshire', '2006-01-08 00:00:00', 'Consequatur veniam consequuntur ut sit. Repellat aut rerum laboriosam illo.', 'Free'),
(242, 0, 'ryley.homenick@example.net', '1-774-983-2633x43133', 'Theresa', '401 Delia Manor Apt. 874\nBogisichville, CO 25546-7254', 'Leannonview', '1976-05-16 00:00:00', 'Voluptas et tempore et sint vel eligendi. Illum ratione quis magni. Odio voluptatem enim culpa sunt omnis dolore aut. Fugit eligendi quis atque reiciendis.', 'Silver'),
(243, 0, 'leannon.fausto@example.net', '510.087.3556x933', 'Rebeka', '9708 Prohaska Spring Suite 835\nAustinfort, NE 20001', 'Port Ashlyshire', '1982-10-22 00:00:00', 'Voluptatem ex doloremque dicta ipsa maiores quis ut tempore. Minima architecto commodi ut necessitatibus repellat a provident.', 'Free'),
(244, 0, 'qanderson@example.net', '266-730-2341', 'Maribel', '0981 Weissnat Route\nNorth Maritza, VA 77967', 'Aryannafort', '1973-09-11 00:00:00', 'Rerum rerum in rem ad commodi adipisci beatae. Odit sunt nihil est dolorem omnis ipsum rerum.', 'Premium'),
(245, 0, 'czieme@example.com', '(112)277-0183', 'Aileen', '026 Carolina Radial Suite 711\nPort Courtneyton, MN 22103-0043', 'New Jerad', '2019-07-29 00:00:00', 'Similique molestiae quod saepe aut ipsa. Nisi illum ut et ut consequatur vitae iure reprehenderit. Esse consequatur voluptatem placeat nisi.', 'Free'),
(246, 0, 'merl77@example.org', '826-040-7279', 'Jaden', '5745 Julianne Lane\nNorth Zola, NM 07028', 'Pasqualeside', '1990-03-25 00:00:00', 'Itaque autem voluptatem consectetur occaecati consectetur enim provident. Et et odio laborum temporibus id et doloremque eligendi. Odio esse voluptatem aut sint aut temporibus illo impedit.', 'Silver'),
(247, 0, 'estefania85@example.com', '113.911.4185x6304', 'Darrell', '9459 Lebsack Heights Suite 826\nPort Trinityville, OR 48423', 'Braunton', '1983-02-13 00:00:00', 'Possimus ut voluptatum nostrum velit sed quia. Ipsa accusantium sit qui molestiae. Incidunt magnam autem quas sed. Sunt illo ea dicta delectus. Sed rem aut aperiam incidunt et vero.', 'Free'),
(248, 0, 'hadley.kuhic@example.com', '464-862-9304x9440', 'Eliezer', '35382 Bednar Drive Apt. 472\nHaneland, GA 58814', 'New Libbie', '1993-08-26 00:00:00', 'Dignissimos unde alias aut omnis rem sapiente aliquam. Dolores ducimus maiores quo non qui. Eos dolorem omnis exercitationem qui earum qui est eveniet. Tempore ratione non iure est. Rerum non magni tempora et et est ea.', 'Free'),
(249, 0, 'kristofer.rosenbaum@example.org', '829-851-0690x185', 'Arlene', '0344 Auer Club\nGaylordburgh, NH 73003', 'Jevonborough', '2009-11-30 00:00:00', 'Velit molestiae voluptas rerum cupiditate. Aliquam dolor repellendus aperiam minima aut non consequatur. Omnis nisi est eos voluptatibus similique quo.', 'Silver'),
(250, 0, 'dayna83@example.com', '952.964.4789', 'Dagmar', '523 Mariano Trace Apt. 414\nEast Anya, MD 33983-0859', 'Lake Idella', '2014-01-30 00:00:00', 'Doloribus saepe dolor aliquid culpa odio. Quidem impedit qui iste. Voluptas et aut id laudantium id sed. Dignissimos repellat consectetur excepturi culpa deserunt accusamus eos. Ut quia enim dolores qui.', 'Gold'),
(251, 0, 'oliver44@example.org', '1-006-191-6951', 'Pearline', '9405 Devan Road Suite 504\nBradfurt, KY 32381-2604', 'Sipesborough', '1982-10-12 00:00:00', 'Doloremque culpa veniam eos et in odit omnis non. Qui ab sit atque eveniet vel voluptatem asperiores eum. Alias dolorum aut earum corporis quod quis.', 'Gold'),
(252, 0, 'gaylord.deangelo@example.com', '1-760-423-3376x66138', 'Eveline', '187 Funk Throughway Suite 845\nConroyhaven, PA 21155-7011', 'Skyeton', '2005-06-16 00:00:00', 'Qui exercitationem quaerat alias minima deserunt possimus corporis suscipit. Ut et illo aut quia. Dolores atque fuga sint magni est doloribus ad. Ab sint hic alias suscipit doloremque reiciendis voluptatem reiciendis.', 'Gold'),
(253, 0, 'ethan.morar@example.com', '+33(1)3351316252', 'Toney', '8023 Hyatt View\nNorth Magnushaven, CA 41006-9864', 'East Arichester', '1983-01-05 00:00:00', 'Ut aut voluptatum odio voluptatem. Aut temporibus eaque enim et. Unde at et suscipit dolorum dolor.', 'Free'),
(254, 0, 'frederique.wolff@example.net', '603-779-1896', 'Kailey', '343 Bogisich Avenue\nLake Ari, AR 97367', 'Laurentown', '1994-10-17 00:00:00', 'Cumque libero dolor nesciunt. Modi et mollitia aut aut quia. Est numquam ducimus cumque autem esse dolorem illum.', 'Premium'),
(255, 0, 'damien50@example.org', '662-571-0494x6284', 'Mathilde', '4163 Rosalind Squares Suite 228\nEast Marlene, PA 71546', 'South Markus', '1981-01-08 00:00:00', 'Nesciunt quia eos sunt facilis temporibus in. Assumenda sed aspernatur officia ab soluta. Voluptatem nam voluptas nemo enim sed quod perferendis. Vitae non quasi eos impedit.', 'Free'),
(256, 0, 'zhermiston@example.org', '321.770.4795', 'Alvis', '18212 Zelda Park\nWest Orphaview, TX 53102', 'Jonesville', '1999-10-23 00:00:00', 'Et sed est eius rerum. Qui quibusdam maiores exercitationem voluptatem veniam repudiandae soluta.', 'Free'),
(257, 0, 'hipolito.graham@example.net', '595.603.9045', 'Roselyn', '497 Reichert Hollow\nWest Eliseohaven, KS 85223', 'South Icie', '2020-05-22 00:00:00', 'Aut aliquam qui illum saepe consequatur. Distinctio enim necessitatibus enim repellat. Corporis dolor eaque earum quo et.', 'Free'),
(258, 0, 'nader.morris@example.net', '+11(9)6760767769', 'Francisca', '8477 Huel Turnpike\nEast Savanahstad, PA 81831-8605', 'Eichmannton', '1988-10-11 00:00:00', 'Est saepe quia quam magni. Nihil nihil ullam placeat dicta praesentium reiciendis. Voluptate adipisci quae et est provident. Necessitatibus nisi illo voluptatum eum qui.', 'Gold'),
(259, 0, 'janet.legros@example.net', '121.950.4254', 'Alexis', '5556 Oscar Tunnel Apt. 418\nEast Brando, MA 08284', 'North Leo', '2014-10-28 00:00:00', 'Aut quasi alias quae quia voluptatem qui natus magni. Enim sit itaque magni vitae similique. Alias aliquid neque magnam est.', 'Premium'),
(260, 0, 'schaefer.angelo@example.org', '+32(2)6622173757', 'Yasmine', '734 Eichmann Mount Suite 204\nLuisaton, ME 27918', 'Carrieburgh', '1990-05-25 00:00:00', 'Veritatis repellat autem et nulla. Nesciunt provident rerum et ipsa. Et molestiae provident sunt modi repudiandae. Minima iure incidunt earum velit amet.', 'Silver'),
(261, 0, 'rrau@example.com', '774-202-9086x07362', 'Ashleigh', '31190 Alvis Wells Apt. 722\nPfannerstillchester, IA 70633', 'New Camrenhaven', '1987-10-04 00:00:00', 'Consequatur dolorem ut dicta voluptate enim voluptatem. Culpa autem corporis ut et reiciendis. Rerum et aut qui odit velit voluptates.', 'Silver'),
(262, 0, 'virgil.kutch@example.com', '1-173-957-3981x27848', 'Lavon', '80399 Nestor Road\nWest Martine, NV 45023', 'South Warrenshire', '1997-05-21 00:00:00', 'Maxime occaecati accusamus eos. Asperiores deleniti nostrum cum officiis earum. Est temporibus et consequatur quas voluptas consectetur neque. Eveniet dolor debitis exercitationem dicta repellendus rerum. Enim voluptatem sapiente saepe.', 'Silver'),
(263, 0, 'spencer.vesta@example.org', '034-431-2292x91610', 'Araceli', '332 Rusty Trail\nSouth Cruztown, NV 33926', 'North Elisabeth', '1996-02-23 00:00:00', 'Ad voluptate et beatae nihil harum enim enim. Non provident et eius dolor nesciunt labore. Qui recusandae veritatis et rerum iusto nobis.', 'Premium'),
(264, 0, 'xward@example.org', '185-150-1226', 'Kip', '208 Rico Vista Apt. 343\nAgustinaville, KY 49005-4150', 'Lake Shana', '2009-07-08 00:00:00', 'Aut amet aspernatur quae vitae eum non. Nam assumenda eligendi consequuntur sunt nostrum. Quisquam recusandae iusto qui earum ipsam eos quod. Officia accusamus aut natus amet omnis quibusdam debitis.', 'Free'),
(265, 0, 'rosenbaum.wayne@example.com', '(931)003-9151', 'Miles', '39163 Jerde Land Suite 155\nNorth Robertaville, WV 99038', 'Lake Elenoramouth', '1971-01-14 00:00:00', 'Non sit est consectetur est eos velit. Consequatur nemo et facilis tenetur a consectetur. Beatae tenetur dolores corrupti et. Et aut ipsum est.', 'Premium'),
(266, 0, 'marcia.ryan@example.org', '343.488.9205', 'Norris', '425 Hane Gateway Suite 918\nLeschchester, MI 07175', 'New Augustaland', '2000-01-26 00:00:00', 'Voluptatem commodi consequatur rerum quis earum voluptatem. Autem reiciendis assumenda quae. Modi quibusdam nostrum et omnis amet. Inventore rerum nam dolore nobis explicabo quis omnis.', 'Premium'),
(267, 0, 'bbreitenberg@example.com', '987-416-4599', 'Coby', '95337 Huels Groves Suite 031\nSouth Carolanneborough, CO 02357', 'Rueckerborough', '1989-10-17 00:00:00', 'Qui quia omnis eos veniam molestias maxime. Et exercitationem sit rerum expedita necessitatibus ut sunt. Totam architecto hic quaerat et.', 'Silver'),
(268, 0, 'korey67@example.net', '(713)120-3386x817', 'Ethan', '753 Rosendo Hill\nAngelafort, MO 99625', 'Dickinsonchester', '1984-10-04 00:00:00', 'Deserunt ut quod et et voluptas aspernatur et. Totam temporibus sed velit nam mollitia dolorem. Quos hic ratione rerum aperiam et aut placeat. Non sint nam a ab delectus maiores.', 'Silver'),
(269, 0, 'hmraz@example.org', '1-276-959-1702', 'Lonnie', '337 Webster Underpass\nConroyview, OR 31051', 'Krajcikhaven', '1999-03-21 00:00:00', 'Voluptatem magnam accusantium placeat quia dicta sequi. Illo et qui rerum quaerat. Vitae ut quibusdam quis omnis corporis.', 'Gold'),
(270, 0, 'jovan.bailey@example.org', '998.073.6145x55454', 'Lafayette', '7438 Hailie Summit\nMyrtleport, WV 56236-8744', 'Hortenseland', '1991-10-12 00:00:00', 'Iste distinctio laboriosam id qui sunt placeat voluptate. Et quod rerum consequatur dolor voluptatem. Nihil numquam tenetur voluptates consectetur ullam. Sed quis perspiciatis cum et.', 'Premium'),
(271, 0, 'jed.nienow@example.com', '1-284-163-3103', 'Renee', '11920 Albert Knolls\nNew Gradychester, WI 17619-4587', 'Keshawnstad', '1978-08-01 00:00:00', 'Voluptatem commodi deleniti accusamus eum praesentium in quia adipisci. Nesciunt ut tempore quia.', 'Silver'),
(272, 0, 'christiansen.justus@example.com', '02381056933', 'Rory', '70254 Stoltenberg Junctions Apt. 691\nOmaberg, MD 78571-1016', 'New Bianka', '1996-03-14 00:00:00', 'Tenetur in commodi maxime numquam. A velit ipsum nemo voluptatibus hic quos. Occaecati est dolor aut sit laboriosam porro ab. Quia laboriosam iusto veniam ducimus architecto.', 'Gold'),
(273, 0, 'juana63@example.com', '06907814655', 'Kenna', '035 Huel Crossroad Apt. 849\nSouth Skyla, WY 26637-8515', 'West Federico', '1997-10-30 00:00:00', 'Qui dolorem vitae sit id possimus. Voluptatibus autem eligendi consectetur cupiditate. Similique et sed sit cumque animi eum commodi. Consectetur quis tempora neque quaerat molestias.', 'Gold'),
(274, 0, 'kutch.chandler@example.net', '09102834029', 'Urban', '25615 Tillman Street Apt. 562\nHayesstad, SD 10326-6523', 'Generalbury', '2005-04-24 00:00:00', 'Natus quo blanditiis mollitia et. Est aperiam repudiandae dolor aut et sit sunt. Earum eveniet debitis quo voluptas.', 'Premium'),
(275, 0, 'haley.keira@example.net', '845.946.4281', 'Marley', '924 Nienow Mount\nPort Kara, WY 79841', 'East Theodorashire', '2012-01-20 00:00:00', 'Consequatur consequatur recusandae eos consequuntur voluptas et aut. Et est dolor autem atque libero natus. Optio voluptatem sint in.', 'Premium'),
(276, 0, 'maggio.raheem@example.com', '1-441-938-9868x87179', 'Wanda', '06215 Durward Heights\nWest Theodorashire, GA 90096', 'East Vaughn', '1983-12-10 00:00:00', 'Eius laborum et ut animi omnis. Sit ducimus et est ex sequi nisi nemo. Officia dolores reprehenderit autem ipsa reprehenderit illo id exercitationem.', 'Premium'),
(277, 0, 'jazmin.hoppe@example.org', '1-439-148-3955x146', 'Tatyana', '17194 Kip Turnpike\nMcCulloughberg, GA 83957', 'Lake Tracey', '2004-10-02 00:00:00', 'Amet placeat ipsum provident harum aut. Et esse quia et. Accusantium et culpa quo. At autem expedita consequatur ut et.', 'Premium'),
(278, 0, 'bauch.abigale@example.net', '1-708-774-0563x10826', 'Donavon', '14088 Kassulke Creek\nSidneyside, ME 55253', 'Port Khalil', '2019-06-22 00:00:00', 'Mollitia nostrum dolores voluptatibus ut harum nesciunt. Consequatur debitis nihil repellat quis. Quod dolor eum reprehenderit.', 'Gold'),
(279, 0, 'rolfson.meggie@example.net', '500.793.1832x7291', 'Ransom', '637 Murray Mountains Suite 626\nWest Eloisaside, WA 67600-1407', 'West Enriqueside', '1980-12-23 00:00:00', 'Placeat est consequatur qui accusantium adipisci aut. Id autem dolor accusamus et id quidem. Temporibus enim debitis vero autem animi nulla esse.', 'Silver'),
(280, 0, 'cartwright.icie@example.org', '1-041-921-6950x5581', 'Braxton', '0658 Jenkins Brooks Suite 160\nSouth Patienceburgh, TX 78417', 'Milanburgh', '2002-03-22 00:00:00', 'Qui minus enim adipisci rerum recusandae. Aut inventore labore et ipsum. Praesentium est quae omnis dolor sunt architecto. Laudantium beatae autem alias est error.', 'Gold'),
(281, 0, 'kuhlman.dennis@example.com', '04264424771', 'Eladio', '713 Jacobs Pine Suite 137\nBreitenbergmouth, FL 13873-0607', 'Ulicesbury', '2009-08-17 00:00:00', 'Id suscipit pariatur et ut. Voluptatem doloribus laborum consequuntur excepturi quae provident ipsa dolor. Optio vel consequuntur non non.', 'Free'),
(282, 0, 'lincoln50@example.net', '825-751-0527', 'Melody', '8811 Mueller Park\nAmeliestad, IA 22606-1606', 'Joannieshire', '2010-11-07 00:00:00', 'Exercitationem blanditiis fuga voluptas est repellat. Numquam aperiam vero fugiat molestias fugit reiciendis atque. Consectetur quia totam fugit molestiae consequatur maxime. Numquam maiores aut nostrum eos voluptatem velit asperiores. Beatae optio quaera', 'Gold'),
(283, 0, 'jailyn.ziemann@example.net', '+55(8)0287650015', 'Felicity', '54881 Johann Cape\nEast Wyatt, NE 23788', 'South Andreanneburgh', '1993-05-07 00:00:00', 'Eligendi itaque asperiores repellendus laudantium et reprehenderit. Qui dolores ducimus consequuntur voluptas est dolore. Aut ea soluta occaecati vel.', 'Premium'),
(284, 0, 'okirlin@example.net', '683.170.3922x12884', 'Rosendo', '92386 Ashly Ridge\nSchowalterstad, NC 24713-4760', 'Favianhaven', '1989-02-13 00:00:00', 'Unde eum voluptatibus rerum ipsum sint aut. Ab ipsum mollitia assumenda consequatur. Autem dolor dolor officiis vero et eum consequatur quia. Dolores perferendis quisquam facere.', 'Free'),
(285, 0, 'shania25@example.net', '818-008-9880', 'Fermin', '01797 Jast Stream\nTrantowton, IN 03705', 'Leannonland', '1981-03-17 00:00:00', 'Quisquam suscipit cupiditate similique. Odio voluptate sit voluptatum alias soluta. Quo saepe nihil sed omnis doloremque. Dolore maxime dolorum nulla quia nobis et ea.', 'Free'),
(286, 0, 'christiansen.mireille@example.org', '01443458396', 'Alyce', '57043 Spencer Trafficway\nSouth Berenice, ND 12956-1610', 'Lake Reanna', '1976-07-01 00:00:00', 'Eligendi quia cupiditate sit nostrum. Iusto temporibus harum iure. Magni totam fugiat aut est consectetur aut voluptas. Tenetur enim asperiores illum accusantium modi praesentium.', 'Free'),
(287, 0, 'hilll.fritz@example.net', '(417)241-5010x44053', 'Rebekah', '2217 Lucie Fort\nFramiside, CA 74566-9757', 'Hegmannchester', '2010-02-07 00:00:00', 'Veritatis architecto reiciendis blanditiis. Voluptates aut natus voluptates molestias. Dolor accusantium illum tempore aut neque inventore. Sunt et aperiam facere ut aut.', 'Premium'),
(288, 0, 'jasper31@example.net', '1-274-838-6849x0866', 'Demetrius', '17099 Kuhic Burg Suite 442\nSouth Trent, IA 09317', 'Koelpinfurt', '2004-04-03 00:00:00', 'Voluptatem possimus incidunt rerum recusandae enim laboriosam quaerat. Deserunt unde recusandae aut possimus exercitationem. Rerum itaque in ratione repellendus perferendis. Iure rerum quis voluptatem consequatur voluptates voluptatem.', 'Silver'),
(289, 0, 'dooley.jorge@example.org', '734-370-1691x23810', 'Ora', '836 Boyer Harbors Suite 937\nWest Rubenborough, WY 41431-2555', 'New Carleyburgh', '2006-03-09 00:00:00', 'Voluptatem fuga autem est dolorum perspiciatis optio laborum. Dolores perferendis iste commodi omnis. Fuga repellendus inventore maiores quos. Rem iste sit magni quidem animi neque.', 'Free'),
(290, 0, 'judge.padberg@example.com', '1-333-741-5067x14023', 'Howell', '0194 Mireille Harbors Suite 264\nMacejkovicchester, NY 01843-3668', 'Lake Clara', '2004-07-03 00:00:00', 'Dignissimos incidunt quia facilis ratione tempora ut. Magnam cupiditate deleniti laboriosam quibusdam animi. Voluptas amet reiciendis aut et provident.', 'Free'),
(291, 0, 'gorczany.adolphus@example.com', '(099)161-6948x19168', 'Dudley', '809 Samir Place\nNorth Angelohaven, MI 19874-7767', 'Aidaport', '1983-12-24 00:00:00', 'Voluptates similique labore dolorem. Nemo consequatur voluptas placeat autem. Praesentium repudiandae autem quaerat ad reprehenderit odio perferendis. Provident sint quaerat in architecto ullam dolor quo.', 'Gold'),
(292, 0, 'janice83@example.net', '(536)900-1033x72751', 'Tobin', '6501 Coralie Estate\nEast Royal, WA 96347', 'North Alleneshire', '1989-02-25 00:00:00', 'Porro ut accusamus voluptate corporis. Numquam veritatis illum quos eos. Soluta neque qui hic pariatur. Animi fugit alias blanditiis praesentium nisi.', 'Gold'),
(293, 0, 'remington.rogahn@example.com', '06036862507', 'Thelma', '912 Eldridge Fords\nSherwoodville, DC 36158', 'New Aleneshire', '2010-06-18 00:00:00', 'A commodi exercitationem perspiciatis est fugiat in fugit qui. Porro et doloribus est aut placeat. Quia modi qui et aperiam sed occaecati. Provident aut qui error ullam in.', 'Gold'),
(294, 0, 'elena26@example.com', '(043)602-3539', 'Kailee', '753 Pacocha Avenue Suite 200\nMarquardtside, ND 65871', 'Sashaborough', '2009-04-27 00:00:00', 'Reprehenderit veniam nam enim recusandae eligendi. Commodi rem atque maiores qui qui qui ut. Consequatur voluptas minus et pariatur expedita consequatur dolorem. Laborum officiis fugit odit corrupti consectetur atque iste.', 'Gold'),
(295, 0, 'janessa.mann@example.net', '(505)687-3883', 'Grace', '373 Carroll Lock\nPort Heidi, CT 08888', 'South Keanu', '2018-02-06 00:00:00', 'Aut ab tempore earum dolor. Quia eius vero assumenda ipsum ex itaque. Enim porro eaque esse animi quidem.', 'Gold'),
(296, 0, 'horn@example.org', '146-574-1167', 'Itzel', '21842 Klocko Trail\nZelmaside, ND 00243-5940', 'Murphyburgh', '2013-09-28 00:00:00', 'Consectetur doloribus eum eligendi ab. Id excepturi doloribus repudiandae aut esse omnis repudiandae. Mollitia necessitatibus nihil in sint. Et hic consectetur aspernatur quaerat maiores vel.', 'Free'),
(297, 0, 'hailee.harber@example.net', '1-393-061-4963x352', 'Antonina', '13375 Elian Club\nJuanitaville, WY 86133', 'Crawfordside', '2010-04-25 00:00:00', 'Saepe expedita ratione minus dolorem est autem. A molestiae modi quisquam.', 'Free'),
(298, 0, 'swift.aisha@example.com', '006-396-7295x346', 'Rowland', '9560 Aisha Terrace\nNew Jessika, UT 25615-2487', 'Isadorechester', '1980-05-09 00:00:00', 'Omnis cumque omnis est aut ea molestias repellendus. Accusamus est culpa non ipsum libero. Soluta ipsum voluptatum optio ipsa.', 'Premium'),
(299, 0, 'lbradtke@example.com', '1-740-472-8867', 'Sheldon', '615 Andy Circles Suite 697\nKemmerport, MO 85810', 'Hartmannshire', '2017-06-15 00:00:00', 'Consequuntur et amet amet rerum. Voluptatem deserunt inventore et sunt. Accusantium enim minus porro doloribus sit ullam.', 'Silver'),
(300, 0, 'kling.dorothy@example.org', '1-277-080-0062x657', 'Ibrahim', '6718 Koch Via\nRunolfsdottirborough, NH 07700', 'Kyleton', '2020-12-24 00:00:00', 'Veniam animi voluptatem ut. Nemo et necessitatibus ratione omnis ut eveniet. Sapiente repudiandae est dicta rem.', 'Free'),
(301, 0, 'corwin.julian@example.com', '1-569-381-0264x722', 'Mabel', '6409 Robert Pass\nEast Carole, DE 11874-0424', 'Abbigailhaven', '1972-12-23 00:00:00', 'Magnam autem dignissimos molestiae dolor. Molestias sit modi aperiam suscipit.', 'Silver'),
(302, 0, 'zoila.abshire@example.com', '634-174-1847', 'Janis', '3637 Noemy Green\nEast Kiraberg, ND 39621-4452', 'Garfieldberg', '2019-01-12 00:00:00', 'Ratione necessitatibus vel vitae voluptas. Id ipsum qui eos. Optio ut enim consequatur blanditiis voluptatem. Voluptatum maxime voluptatem doloribus pariatur perferendis quae.', 'Free'),
(303, 0, 'lance.bosco@example.com', '+14(6)0849573758', 'Kaci', '73284 Annalise Fields\nWest Mabel, AK 34983-6227', 'Abernathyborough', '1993-09-12 00:00:00', 'Aut deserunt aut omnis est. Aut iusto incidunt exercitationem quia. Laboriosam fuga veritatis similique enim. Veritatis vero ratione quia eaque molestiae eos.', 'Gold'),
(304, 0, 'gschuppe@example.net', '1-154-084-6086', 'Brenna', '1037 Elisha Hills\nEast Shainaton, FL 06774-9102', 'Lilianafort', '1977-10-28 00:00:00', 'Perferendis a odit dolores culpa earum cumque ea. Amet et rerum et voluptas repudiandae itaque. Minima accusantium quia harum voluptas.', 'Free'),
(305, 0, 'sarina26@example.org', '1-337-389-0643x51851', 'Braeden', '09007 Gay Way Suite 230\nNorth Halstad, NY 72089', 'Robelland', '1987-11-04 00:00:00', 'Et omnis non inventore omnis aut sed voluptatum. Quia esse molestiae est odit quae. Aliquid repudiandae perferendis at laudantium et.', 'Premium'),
(306, 0, 'felipe76@example.com', '+50(0)0455334927', 'Luciano', '9220 Sydni Shoals\nWolfftown, OR 24206', 'Hoegerton', '2018-06-02 00:00:00', 'Aut dignissimos est at aliquid necessitatibus odio impedit. Alias ab aut beatae mollitia rerum facilis. Perspiciatis velit deleniti optio culpa accusantium omnis quibusdam. Exercitationem voluptas quas sunt repellendus earum eum.', 'Silver'),
(307, 0, 'vonrueden.queenie@example.com', '1-269-769-8258x154', 'Anthony', '11894 Olson Route\nPort Soledadfort, NC 82250', 'North Karianeton', '1977-06-11 00:00:00', 'Eaque eum iste laborum molestiae adipisci nobis nemo. Et sit porro ratione. Maxime vel molestiae inventore eos. Consequatur recusandae dolorem quasi minus. Eaque ducimus sit blanditiis placeat.', 'Gold'),
(308, 0, 'tlueilwitz@example.org', '(888)854-2210', 'Guadalupe', '80104 Tamara Mill Suite 892\nSchroederfort, KY 48707', 'Hagenesside', '2011-11-25 00:00:00', 'Et nam fugiat ipsa omnis ut. Sed impedit rem ipsa eaque sit optio minus. Possimus quaerat vero soluta doloribus. Nisi aut et necessitatibus quia placeat.', 'Silver');
INSERT INTO `individual` (`id`, `status`, `email`, `phone`, `name`, `address`, `city`, `since`, `description`, `packet`) VALUES
(309, 0, 'conroy.bethel@example.com', '+55(0)1448887624', 'Winnifred', '048 Gilberto Greens\nHaydenburgh, SD 22540-0981', 'North Aglae', '2005-01-11 00:00:00', 'Dolorum veritatis magnam hic dicta cumque sunt deleniti beatae. Voluptatem accusantium et et recusandae voluptates est. Quia iste voluptatem voluptas.', 'Silver'),
(310, 0, 'kovacek.precious@example.com', '(146)176-0017', 'Quinten', '716 Clemmie Shoal Apt. 472\nPort Torrance, MA 91669', 'Fletcherborough', '1983-07-21 00:00:00', 'Illo corrupti minima modi et dolorem. Nobis id enim et laborum quia. Error dolor blanditiis corrupti sunt sit qui ipsum beatae. Soluta corporis nam vel est similique incidunt sunt.', 'Silver'),
(311, 0, 'nolan.carolyne@example.org', '182.986.7175', 'Sabrina', '536 Sasha Lights\nNew Anibaltown, WY 91095', 'Lake Taryn', '2000-12-17 00:00:00', 'Et sed qui nisi facilis numquam dolor officiis aperiam. Optio quibusdam magni nobis enim aut voluptatem similique. Veritatis maxime facilis perspiciatis debitis perferendis dolorum.', 'Silver'),
(312, 0, 'beatty.elsa@example.net', '590.693.8808x07383', 'Cristobal', '25105 Lynch Loaf Suite 874\nLake Jon, FL 20907-5718', 'Robelview', '1976-10-03 00:00:00', 'Dignissimos minus esse laborum dicta odit distinctio. Sint hic autem nisi nihil. Porro pariatur quidem enim laborum aut quis. Natus ea nemo ea eum sit vel laudantium nemo.', 'Free'),
(313, 0, 'probel@example.org', '1-507-085-5224x307', 'Viva', '893 Jerde Shore\nReingerberg, NC 01308', 'Port Lylashire', '2005-08-30 00:00:00', 'Aut quis exercitationem quas atque et dolores sed numquam. Laudantium dolor ut fuga. Est eligendi minima eaque architecto assumenda velit et.', 'Gold'),
(314, 0, 'werner85@example.net', '1-479-876-9667x90051', 'Arlo', '3356 Gulgowski Branch Apt. 214\nEast Alfonso, TN 81536', 'New Doyle', '2003-07-15 00:00:00', 'Est qui sit consectetur dolores facere. Culpa dolorem rerum veritatis et distinctio facilis facere. Dolores voluptas quis est quia rerum omnis reiciendis ipsum. Nisi molestiae earum illum.', 'Premium'),
(315, 0, 'tschimmel@example.com', '(468)117-2091x145', 'Zetta', '5372 Hills Pike Suite 150\nMooreburgh, UT 83684', 'Hilpertburgh', '2009-12-04 00:00:00', 'Incidunt quaerat magnam sit aliquid minima rerum. Consequatur porro enim sit. Eos quae facilis voluptates mollitia nihil nulla. Accusantium impedit libero dolores sed et possimus tempora tempore. Consequatur doloremque pariatur expedita blanditiis deserun', 'Premium'),
(316, 0, 'lbarrows@example.net', '(837)946-2069x438', 'Savanah', '9364 Cole Street\nRyanview, VA 72481-8683', 'West Rachaelmouth', '2019-08-23 00:00:00', 'Laboriosam rerum vero perspiciatis delectus qui. Vel dolorem unde ipsa dolorum voluptas aut dolorum magnam. Distinctio dolorum odit rerum et quia.', 'Silver'),
(317, 0, 'unicolas@example.org', '180-384-8044', 'Emmie', '3261 Augustus Drive Suite 717\nRettastad, MT 44222', 'Douglaston', '2022-01-15 00:00:00', 'Natus non quae qui a nobis blanditiis quam. Aut at quos vitae eos et officia incidunt. Nesciunt non doloremque odio doloribus est.', 'Silver'),
(318, 0, 'vern22@example.net', '356-429-1141x593', 'Ibrahim', '144 Nils Well Apt. 657\nNorth Robert, IA 91616-8752', 'Lake Sean', '2020-03-04 00:00:00', 'Facere sed soluta molestiae impedit cumque. Fugit quasi et sed est. Provident et consequatur quibusdam perspiciatis ullam eaque.', 'Gold'),
(319, 0, 'pkirlin@example.org', '(879)803-4897', 'Savion', '5153 Moore Centers Apt. 403\nNew Olga, AK 26975', 'Jacobsonside', '1988-05-23 00:00:00', 'Magnam quos expedita ea asperiores voluptatum. Voluptatibus quas harum ut impedit minus saepe. Rerum consequatur minus nisi quae.', 'Free'),
(320, 0, 'larkin.amari@example.net', '(549)164-7095x2704', 'Hillard', '09626 Xzavier Glen\nLucianostad, MT 15601-1396', 'Port Darrickborough', '1991-03-28 00:00:00', 'Quia et earum illum nemo. Ipsum quasi et nam ut officia. Voluptatem aperiam sunt voluptatem non dolorum veniam sint.', 'Gold'),
(321, 0, 'aileen67@example.com', '460.536.8490x7901', 'Elissa', '0687 Bernadette Hollow\nWolffort, OH 52798-4019', 'Wymanchester', '1975-08-05 00:00:00', 'Vitae et assumenda voluptatem et omnis accusamus. Reprehenderit minima dolorum consequatur in eum voluptatem nam. Ut laboriosam voluptatem quaerat neque placeat sunt et. Rerum nam iste velit sint.', 'Silver'),
(322, 0, 'kohler.lorena@example.org', '942.714.3526x7496', 'Napoleon', '6429 Robel Islands Apt. 655\nAhmedfurt, DE 74712-7756', 'Port Sydnieberg', '1978-09-24 00:00:00', 'Omnis at et et quidem adipisci. In praesentium quidem culpa. Aperiam voluptas velit in delectus doloribus saepe modi. Quasi cumque autem natus ea repellat.', 'Premium'),
(323, 0, 'iborer@example.com', '693-787-0486x63143', 'Kieran', '69751 Conroy Hill Apt. 534\nPort Loy, DE 80156-3567', 'Bentonborough', '1991-06-02 00:00:00', 'Quod quis et vel iure ipsum aut. Est inventore qui ullam illum tempore accusantium. Voluptates ut qui sunt quia doloremque maiores.', 'Gold'),
(324, 0, 'lonny58@example.org', '966.543.3875', 'Ben', '17565 Randi Island\nNorth Domenic, MA 98658-2868', 'Aimeeberg', '1978-01-07 00:00:00', 'Provident dolore voluptas perferendis. Perferendis aut accusamus blanditiis cumque alias quidem. Facere cum omnis assumenda et dolore. Voluptatem sunt vel eum ullam.', 'Gold'),
(325, 0, 'eheidenreich@example.org', '(263)305-9975x0418', 'Barry', '837 Kenna Falls\nPort Deron, AK 85999', 'New Evelynborough', '1970-01-20 00:00:00', 'Expedita qui doloribus nobis nam et minus velit. Maiores dolorem alias eius repudiandae expedita. Sed eius omnis at rerum.', 'Gold'),
(326, 0, 'kertzmann.alford@example.org', '312-435-3822', 'Izabella', '1644 Stokes Valleys Apt. 876\nStiedemannborough, NH 44221-4651', 'Reneeburgh', '1992-01-12 00:00:00', 'Quibusdam repellendus dolorem error. Dolores aut recusandae aut vel et. Aut vel officia dicta quia. Et ut explicabo sed possimus voluptatem eaque sed atque.', 'Free'),
(327, 0, 'keara58@example.org', '02602240253', 'Gardner', '63252 Kira Inlet Suite 768\nNorth Lorenside, WI 97197-1840', 'West Garrisonville', '1975-06-07 00:00:00', 'Aut ducimus et officiis. Ea omnis quia assumenda et cum odio. Et delectus nulla fuga omnis.', 'Premium'),
(328, 0, 'lynch.damaris@example.net', '933-136-5449', 'Thaddeus', '4934 Aubrey Lights\nLindgrenshire, SC 30614-0658', 'Metzbury', '2003-08-30 00:00:00', 'Iure quod dignissimos voluptatem cum ab adipisci. Accusamus sunt id voluptates qui maxime dicta. Enim dolor praesentium necessitatibus id non.', 'Silver'),
(329, 0, 'doug.mcdermott@example.org', '111-281-0527', 'Emil', '262 Mia Loop\nNorth Brain, SC 53915-3333', 'Flatleyhaven', '1983-05-22 00:00:00', 'Quae enim quisquam rem odit est nobis perferendis ab. Et omnis alias vel consequatur. Qui incidunt unde cupiditate aut.', 'Premium'),
(330, 0, 'ellen.harber@example.org', '(531)981-7614x98250', 'Hailie', '3789 Murl Shores\nGarnetfurt, WA 00969-4986', 'South Daphneeshire', '2000-10-23 00:00:00', 'Quo eius laudantium numquam nesciunt voluptates ipsum ducimus. Non distinctio id accusamus ut. Veniam quibusdam eos maxime dolores enim tempore qui blanditiis.', 'Free'),
(331, 0, 'hamill.jeanette@example.org', '(838)031-3213', 'Reece', '32423 Flatley Loaf\nFletashire, WA 14380', 'Bertside', '2002-09-17 00:00:00', 'Recusandae quod labore et. Illum eius vero accusamus. Ad tempora tempora at et laborum vel et. Veniam voluptatum fugiat a distinctio.', 'Gold'),
(332, 0, 'snikolaus@example.net', '378-176-4994', 'Price', '05944 Favian Ramp\nSouth Sammieton, AL 84344-3428', 'Port Bradly', '2008-08-19 00:00:00', 'Et nemo est optio labore aut. Quibusdam eius soluta ullam. Doloribus est autem at et est ullam vel nihil. Et et dolore non sint esse fugiat nostrum.', 'Gold'),
(333, 0, 'aniyah.ernser@example.com', '100.352.4703x45847', 'Mazie', '585 Rebeca Trafficway Apt. 371\nWest Eugenia, VT 72983-3891', 'Hyattton', '1993-07-26 00:00:00', 'Deleniti sequi atque quasi aut consectetur sapiente. Aut ut est dolores. Eveniet sapiente iusto et.', 'Gold'),
(334, 0, 'qeffertz@example.org', '01003302794', 'Triston', '3166 McLaughlin Keys Apt. 277\nNew Franciscamouth, CO 42523', 'Lorifort', '2002-07-01 00:00:00', 'Labore nostrum sed libero eum. Sit nostrum similique eveniet doloribus voluptatem esse quisquam.', 'Free'),
(335, 0, 'rudy06@example.net', '(513)455-6643', 'Sarina', '007 Fay Meadows Suite 353\nYadiratown, IA 63352', 'South Bennett', '2018-05-15 00:00:00', 'Hic dolores praesentium unde qui ullam blanditiis rerum et. Voluptatem qui vero qui enim numquam modi tempore recusandae.', 'Gold'),
(336, 0, 'okuneva.billy@example.net', '02037118941', 'Gloria', '2617 Ryan Gateway\nFlavieburgh, IN 48622', 'North Jermainebury', '1980-12-20 00:00:00', 'Possimus aut aut quibusdam nostrum qui quis. Quo veniam praesentium qui architecto quisquam quam aliquid vero. Quia ducimus dolore qui doloremque.', 'Silver'),
(337, 0, 'sernser@example.net', '+10(9)0839985231', 'Burley', '37875 Bashirian Island\nKihnshire, DE 71308', 'Demarcusfort', '1976-01-18 00:00:00', 'Aut sequi dolorem laborum provident laboriosam molestiae consectetur. Sequi voluptatem corporis repellat modi impedit. Qui eos in soluta omnis.', 'Gold'),
(338, 0, 'sim.upton@example.net', '1-185-008-2926x334', 'Melany', '10762 Kiehn Causeway Apt. 610\nBelleland, MO 36576-3400', 'Ratkehaven', '1980-03-21 00:00:00', 'Ut sed deleniti omnis est quaerat et. Consequatur doloribus nihil iure quis. Nulla et amet maxime nihil itaque. Alias nostrum quo debitis fuga et quod culpa.', 'Silver'),
(339, 0, 'cheyanne15@example.org', '1-140-584-3549', 'Ashlynn', '70170 Harvey Turnpike Suite 171\nLake Ettieview, PA 04429-1662', 'Kaelynberg', '1973-04-10 00:00:00', 'Architecto suscipit rerum velit qui vitae commodi. Dolores officiis deleniti accusamus vel aliquid rerum. Repellat ad consequatur velit. Quam esse iusto amet. Magnam est soluta labore.', 'Free'),
(340, 0, 'olin69@example.org', '894-894-2612x867', 'Josiane', '37939 Larson Route Suite 353\nTorphyborough, OR 34375', 'South Damienview', '1996-08-20 00:00:00', 'Delectus aspernatur perspiciatis quae eum. Laborum facere non in in rerum magni quasi. Iusto explicabo officiis vel aut in. Voluptas qui animi ut qui quia.', 'Gold'),
(341, 0, 'langosh.osvaldo@example.org', '1-224-372-4868x37011', 'Leo', '742 Koss Fork\nStromanton, NH 25134-1053', 'Gerlachberg', '1973-07-02 00:00:00', 'Officiis deserunt qui repellat et esse voluptas saepe soluta. Sed enim est est maxime eum beatae. Quos similique optio velit hic illum quam. Et ut et officia corporis cum impedit.', 'Premium'),
(342, 0, 'reta.cremin@example.net', '512.385.3665', 'Rachel', '0334 Halvorson Route\nOrnville, OH 19373-4888', 'Terryport', '2011-05-25 00:00:00', 'Ipsum eveniet adipisci nam cupiditate. Omnis commodi repellendus corporis facere. Aut ducimus dolorem in hic. Et aut ea eveniet.', 'Free'),
(343, 0, 'casimer.marvin@example.net', '(159)637-3133', 'Ron', '03352 Ramon Greens Apt. 357\nNew Gustave, AL 17062', 'Lake Zacharyhaven', '2021-03-12 00:00:00', 'Odit consequatur architecto repellendus consequatur ad et autem. Voluptatibus ut veniam deserunt optio. Debitis aperiam aut modi reprehenderit quisquam quibusdam amet dicta. Qui cumque culpa quas possimus laboriosam.', 'Silver'),
(344, 0, 'ashleigh.wiza@example.org', '450.265.1326x44348', 'Ariane', '8551 Morar Island Suite 292\nRitchiestad, VT 38429-8710', 'Annalisechester', '1970-01-10 00:00:00', 'Tenetur in iste quae qui repellendus. Vitae magni aut at doloremque. Aut voluptatum ipsa alias voluptates eaque earum ut natus. Libero adipisci quisquam beatae repellat et officiis nisi.', 'Gold'),
(345, 0, 'fahey.meta@example.net', '420-599-2430', 'Isabelle', '5623 Wolff Street Suite 865\nNew Estella, VT 59980-3466', 'East Avery', '2000-10-01 00:00:00', 'Quia hic non sit facilis et ipsum. Dolorum qui est sint sint illo non.', 'Silver'),
(346, 0, 'allene.block@example.com', '952-179-6029', 'Alexandrea', '3988 Tromp Orchard Apt. 244\nConsidineside, WY 52875-5697', 'Port Noreneland', '2011-02-03 00:00:00', 'Id autem molestiae labore illo dignissimos ut. Et non consequatur sint et eius quibusdam veniam. Nisi consequatur quis a laudantium et.', 'Premium'),
(347, 0, 'stanton.keeling@example.net', '1-321-111-3532', 'Devan', '528 Alfred Highway\nErnestoberg, DE 77962-9329', 'East Laronbury', '1991-09-26 00:00:00', 'Atque deserunt et molestiae molestias qui debitis occaecati. Quibusdam explicabo alias veniam enim. Perspiciatis perspiciatis minus recusandae temporibus iste.', 'Silver'),
(348, 0, 'delpha.hills@example.org', '978.644.6824', 'Granville', '99956 Pfeffer Hill\nPort Malachi, WI 67841', 'Weberchester', '1996-03-15 00:00:00', 'Reprehenderit est tempore deserunt tempora quia et quis provident. Autem impedit sapiente explicabo placeat omnis dolor quis possimus. Laudantium odio minima corporis voluptas vitae. Reiciendis non quia tempora repellendus sunt fugit vitae tempore.', 'Free'),
(349, 0, 'ritchie.al@example.net', '563-811-0995x27968', 'Arvid', '4453 Shanna Grove Apt. 854\nIsobelside, OH 21560', 'West Augustinebury', '2006-08-17 00:00:00', 'Ratione quas dignissimos modi corrupti nostrum. Earum et amet dolor est. Aspernatur itaque ea est vel omnis. Voluptas dolorem cumque aut quo nulla sequi in maxime.', 'Premium'),
(350, 0, 'dino99@example.net', '1-588-329-2753', 'Walter', '95907 Swift Lights Suite 879\nStrackeville, KS 46331', 'New Fredastad', '1978-05-22 00:00:00', 'Aperiam eligendi architecto vel voluptatum dicta ex. Quod nostrum architecto iusto dignissimos quia. Ut cum inventore perferendis perferendis. Maiores voluptas asperiores debitis error sint aut.', 'Free'),
(351, 0, 'arnoldo18@example.org', '702-892-5132x206', 'Jacinthe', '3629 Ryley Walks Suite 260\nPort Gabriella, OK 75453-4624', 'Schambergerfort', '2008-05-28 00:00:00', 'Omnis excepturi aliquid exercitationem blanditiis nulla. Quia quibusdam aut magni illum dolore illum. Vel debitis et perspiciatis accusamus delectus omnis. Mollitia similique voluptatibus non.', 'Free'),
(352, 0, 'rae.fisher@example.org', '(258)324-3422x03850', 'Malvina', '31004 Lizzie Ridge\nEast Evaland, NY 67148-1725', 'Lake Audreanne', '2007-10-22 00:00:00', 'Laudantium eum repellendus ut eius aliquid est. Officia eos excepturi perspiciatis mollitia ut.', 'Free'),
(353, 0, 'webster.willms@example.net', '(765)574-4862x13442', 'Eloisa', '344 Denesik Plains\nZachariahchester, CO 22357', 'Spinkaborough', '1977-04-27 00:00:00', 'Dolores animi hic error qui. Dolorum quae dolor vel impedit. Et asperiores minus quasi. Facilis voluptatibus et iure eius dolores dolores beatae. Debitis at provident et.', 'Gold'),
(354, 0, 'tierra.volkman@example.org', '998.974.4532x338', 'Rowena', '1916 Ebba Corners Suite 470\nAylinmouth, SD 02768-0585', 'Adamsberg', '1984-08-23 00:00:00', 'Voluptatem quidem nostrum provident omnis omnis qui. Voluptas rerum tempore nihil fugit necessitatibus illum. Qui quo iusto omnis et. Voluptate veritatis quo rem.', 'Gold'),
(355, 0, 'marty88@example.org', '1-505-569-0146x382', 'Isabella', '2940 Verna Summit\nNorth Justineville, KY 89577-2686', 'East Lawson', '2002-03-01 00:00:00', 'Illo rerum sit est sed qui. Aliquid totam voluptatibus aliquid dolor magnam. Nulla voluptatem laboriosam commodi quia aut.', 'Silver'),
(356, 0, 'felicity72@example.net', '1-342-229-2362', 'Shane', '69020 Leffler Crossroad\nEast Mary, HI 79221', 'Kingville', '2007-04-06 00:00:00', 'Corporis adipisci accusantium voluptates sit laboriosam cupiditate. Impedit quo aliquid voluptatibus. Consequatur ut est totam quia.', 'Free'),
(357, 0, 'augusta72@example.org', '1-615-010-8569', 'Malika', '720 Arielle Spring\nSouth Darianafurt, UT 85537', 'Johnsfurt', '2015-07-17 00:00:00', 'Numquam quia et nihil autem modi voluptatum. Ipsum aut omnis dolores explicabo maxime in. Et eius dolor quo quos beatae officia. Est omnis provident quia sed totam voluptatem animi voluptates.', 'Free'),
(358, 0, 'nolan.jose@example.com', '1-505-310-5278', 'Iliana', '38265 Gaylord Place\nNew Angel, TX 69746-8959', 'Corwinville', '2004-10-08 00:00:00', 'Dignissimos voluptatem voluptatibus aliquid expedita ut sed. Sit eius tenetur et. Inventore at et ut.', 'Free'),
(359, 0, 'kayleigh69@example.net', '1-362-814-7243x26476', 'Kaya', '3838 Ledner Bypass Apt. 831\nHuelburgh, VA 77371', 'North Gisselleton', '1974-01-04 00:00:00', 'Animi fugiat ut corporis reiciendis nam vero. Quis consequatur eligendi dolorum. Ut repudiandae amet voluptatem aut eum.', 'Premium'),
(360, 0, 'leta86@example.org', '(769)503-5825x80743', 'Elisabeth', '06845 Johns Court\nTillmanhaven, LA 93846', 'Willmshaven', '1982-12-05 00:00:00', 'Maiores doloremque veniam illo qui aut. Est repellat fugit animi hic velit. Qui corrupti consectetur deleniti enim eos vel. Consequatur sequi impedit exercitationem.', 'Premium'),
(361, 0, 'madisen.fritsch@example.net', '+38(7)4066841237', 'Annie', '2236 Casper Vista Apt. 887\nEast Virgieton, AK 08347-5240', 'West Gerald', '1989-12-28 00:00:00', 'Quo autem nihil voluptatem illum. Porro sequi velit velit error corrupti id vero.', 'Premium'),
(362, 0, 'greenholt.maryam@example.org', '(982)992-8326', 'Winona', '9106 Herman Underpass\nBraunburgh, NJ 83361-1181', 'Morissettefurt', '2019-12-11 00:00:00', 'Eos vitae porro reiciendis provident. Aliquam dignissimos error aut aut perspiciatis ipsam. Aut consequatur quam ut nobis.', 'Gold'),
(363, 0, 'helene25@example.org', '545.405.5839', 'Elmer', '2838 Alberto Landing\nNorth Junius, TN 94014-4554', 'South Ethaborough', '1998-04-13 00:00:00', 'Totam minus qui nostrum harum id explicabo vero. Omnis veritatis molestiae rem quos odit. Suscipit expedita dolores deleniti fuga.', 'Silver'),
(364, 0, 'keebler.catherine@example.net', '1-337-505-1649x4439', 'Domingo', '358 Keebler Fall\nNew Tyreekchester, TN 95327', 'Pabloton', '1981-10-10 00:00:00', 'Voluptatem cupiditate velit eos aut ut et. Eos similique quisquam aliquam tenetur voluptatem. Enim beatae unde voluptas facilis numquam nostrum. Nesciunt ipsa rerum et velit.', 'Free'),
(365, 0, 'nathaniel69@example.net', '716.975.2378x4790', 'Dortha', '556 Vandervort Centers\nWest Jayme, WI 07601', 'South Reyes', '1975-05-14 00:00:00', 'Magni inventore totam ea atque enim sunt et. Repellendus et vero qui et minus dolores. Et earum officiis dolores iste ipsa consequuntur.', 'Silver'),
(366, 0, 'spinka.irma@example.org', '1-957-265-1754', 'Amir', '783 Chaim Forge Suite 783\nNorth Kathleen, MA 41834-9851', 'Deckowstad', '1974-01-09 00:00:00', 'Eum earum eum id architecto quibusdam tempora distinctio. Id in voluptates commodi eveniet cumque libero voluptatum. Aspernatur quam cumque provident ex tenetur optio voluptas. Molestiae optio sequi quia reiciendis harum.', 'Gold'),
(367, 0, 'aliyah.schuster@example.org', '1-668-489-4815x34693', 'Kenna', '5130 Runolfsdottir Islands\nSteviechester, CO 38373-0585', 'Bergnaumtown', '1972-09-20 00:00:00', 'Rerum error aperiam saepe ipsam quaerat maxime. Illum est neque sint rerum. Reprehenderit deserunt harum repudiandae aut aut.', 'Premium'),
(368, 0, 'valentina17@example.net', '(286)240-3819x70818', 'Cheyanne', '87569 Cartwright Points\nNew Miguel, TN 90186-1420', 'Padbergmouth', '1980-05-13 00:00:00', 'Dolorum enim iure impedit. Hic incidunt perspiciatis vel quo. Ut earum saepe autem impedit sint.', 'Gold'),
(369, 0, 'melvin93@example.org', '+09(6)1286120943', 'Aliza', '38304 Ettie Ports\nBoehmton, CO 67786-1362', 'North Thereseborough', '2000-05-06 00:00:00', 'Aut error aspernatur et possimus temporibus. Ut enim quia molestiae ipsam cum. Necessitatibus inventore culpa qui et aliquid.', 'Silver'),
(370, 0, 'domenico.kuhlman@example.org', '380-015-7820x65943', 'Merle', '95960 Torp Square Suite 800\nPort Lloyd, IN 86396-5472', 'Denesikmouth', '1970-06-14 00:00:00', 'Ut aperiam placeat est a debitis aut. Doloribus unde dolorem eos quod nemo consequatur non facere. Quia quia placeat aut neque quo et.', 'Gold'),
(371, 0, 'koss.hellen@example.org', '1-481-463-2834x93855', 'Mario', '4383 Medhurst Bypass\nEast Maximillia, ND 89061', 'Bayerside', '2001-02-25 00:00:00', 'Eum ipsum voluptate animi velit veniam porro. Debitis molestiae vel provident reprehenderit est. Molestiae dolores laboriosam corrupti.', 'Free'),
(372, 0, 'aurelie19@example.org', '1-703-981-9463', 'Nikita', '3341 Isaac Cove Apt. 981\nJonatanland, NH 34218-9902', 'Anselmouth', '1974-09-30 00:00:00', 'Natus eos accusantium aut. Consequatur dignissimos consectetur voluptas est. Modi odio nemo eum laudantium et voluptas non nemo. In quia consequatur reiciendis earum similique nihil occaecati. Modi ea laborum dolor omnis.', 'Silver'),
(373, 0, 'xnicolas@example.com', '(339)847-6706', 'Lorenzo', '80335 Kreiger Lakes Suite 985\nPort Alyciamouth, OR 17584-5526', 'Alexzanderstad', '1991-06-16 00:00:00', 'Porro perferendis tempora ipsum nulla placeat laborum illo quae. Iure aut doloremque ipsam molestiae deleniti. Quod et a quibusdam voluptatibus magnam.', 'Gold'),
(374, 0, 'dhegmann@example.net', '+46(8)8865561019', 'Imelda', '15843 Torp Stream\nBernhardmouth, TX 65723', 'Port Chesley', '1997-09-05 00:00:00', 'Ut numquam quaerat voluptatem quia possimus nam velit. Sit quam ducimus voluptas sit culpa. Ex impedit exercitationem officia voluptas.', 'Free'),
(375, 0, 'lemke.dorian@example.com', '351-294-9253x114', 'Raphael', '4599 Casper Pines Suite 809\nNorth Milan, NE 10459-3211', 'Port Naomimouth', '2006-12-07 00:00:00', 'Est similique qui quae occaecati sed possimus. Est vel qui nobis nihil. Dolores commodi nesciunt dolore.', 'Gold'),
(376, 0, 'cordelia.stoltenberg@example.com', '1-578-995-7377', 'Robyn', '4026 Rolfson Canyon Suite 611\nJeramyview, IA 39454', 'East Christopher', '1972-03-03 00:00:00', 'Eum ut aut labore consequatur harum. Aut reiciendis sunt vel magni nisi. In repellendus repudiandae ut alias odit. Earum corporis ex laboriosam aut enim cupiditate placeat.', 'Silver'),
(377, 0, 'rlabadie@example.org', '01140740604', 'Tyreek', '995 Shanahan Extension\nNew Emilietown, NV 20164-4532', 'Andersonfurt', '2009-02-21 00:00:00', 'Qui facere est illo quaerat quis officia. Doloremque voluptas nihil eos sit.', 'Gold'),
(378, 0, 'toy.palma@example.org', '005.461.3915', 'Mariela', '9740 Quigley Court\nNorth Aronside, WY 03882', 'Stokeschester', '2021-08-22 00:00:00', 'Omnis aspernatur temporibus optio repellendus magni nesciunt eveniet. Consequatur et omnis consequuntur hic similique.', 'Free'),
(379, 0, 'libbie00@example.net', '1-623-226-8517x746', 'Keyshawn', '33081 Shanahan Groves Apt. 755\nRogahnburgh, PA 71164-7874', 'Graysontown', '1992-07-12 00:00:00', 'Asperiores minima molestiae sunt iusto quis molestiae veritatis. Excepturi et fugit autem nihil. Recusandae dolor nam iusto placeat. Incidunt aut laudantium qui et et reiciendis est porro.', 'Free'),
(380, 0, 'ubruen@example.net', '00691792855', 'Mia', '12161 Jayne Lights\nLake Selmer, AL 49411-5972', 'New Abbieport', '1979-04-12 00:00:00', 'Illo omnis porro quis voluptatem. Culpa sequi quam repellendus consequatur architecto sed. Dolorem nemo ut minima ratione delectus omnis praesentium. Sunt nobis accusantium eveniet sequi.', 'Free'),
(381, 0, 'edgardo.hessel@example.com', '699-203-6690', 'Melissa', '303 Pink Pines\nPort Nathan, VA 74415', 'New Websterborough', '2016-10-27 00:00:00', 'Eum blanditiis quisquam consequuntur nesciunt delectus ab sed nemo. Illum repellendus sunt earum enim delectus qui aspernatur fuga. Repudiandae fugit quasi magni autem saepe doloremque delectus. Quis velit aut nihil sit.', 'Gold'),
(382, 0, 'aurore92@example.org', '(109)381-9337', 'Gabriel', '41525 Dickinson Corners Suite 857\nWest Vanessahaven, CA 11317', 'New Ellsworth', '2006-05-25 00:00:00', 'Laboriosam et sunt et vel et neque eveniet. Asperiores eligendi iste voluptatem et quos sed non totam. Distinctio qui autem sit. Rerum earum tempore alias aut sunt.', 'Free'),
(383, 0, 'andre.feest@example.org', '506-615-9300x6997', 'Beverly', '26934 Vandervort Mill Suite 516\nNew Margotborough, MA 39532-7079', 'Jaquelineside', '2011-09-16 00:00:00', 'Sequi laborum ut totam voluptatem fugit sit sit. Soluta hic earum alias laborum. Eligendi cupiditate maxime sequi. Consequatur ratione id aliquid consequatur quia.', 'Free'),
(384, 0, 'ebba82@example.com', '1-557-012-8012x950', 'Kaylee', '24156 Wellington Square Apt. 551\nBlickberg, WY 90384', 'Creolaton', '2003-10-17 00:00:00', 'A voluptatem perferendis ut exercitationem sit tempora. Velit explicabo numquam eum nisi. Eum quibusdam eos rerum fugiat voluptas unde nulla. Eveniet minus id nobis nam voluptatem aut aut.', 'Gold'),
(385, 0, 'sofia.muller@example.org', '+13(8)1620399390', 'Candice', '424 Streich Isle\nRowanville, CO 40753-0654', 'South Vincent', '1998-02-18 00:00:00', 'Id illum quaerat explicabo voluptas commodi nam quas. Atque ex praesentium omnis ipsam quia autem voluptatem sit. Aperiam nobis nesciunt excepturi. Consectetur qui sapiente qui aut eaque voluptas blanditiis.', 'Gold'),
(386, 0, 'susie.kilback@example.com', '(611)724-3296x578', 'Jeremy', '0911 Pfannerstill Prairie Apt. 372\nHarbermouth, MS 51295', 'Mallieville', '2010-11-08 00:00:00', 'Id consequatur molestiae sunt quaerat ullam quas. Blanditiis nam sapiente voluptatem recusandae odio.', 'Gold'),
(387, 0, 'precious.zemlak@example.org', '(887)734-7462', 'Floy', '0282 Schoen Course\nPort Timmothy, NE 93109', 'Maggiochester', '2005-10-01 00:00:00', 'Non corporis et nam repudiandae est consequuntur accusantium vitae. Nulla eum commodi repellat sit aliquam voluptatum nulla. Quas est voluptates est reiciendis. Voluptatum architecto eos consequatur consequatur id rerum esse.', 'Premium'),
(388, 0, 'monty74@example.com', '1-673-373-3297x1510', 'Zena', '8799 Farrell Skyway\nNorth Alexaneview, NY 28987', 'South Grace', '1979-01-09 00:00:00', 'Eveniet tenetur a enim dolorem veritatis tempore. Distinctio minima non consequatur maxime. Voluptatibus doloremque pariatur omnis ipsa quisquam nulla dolores. Voluptates non fugiat qui.', 'Premium'),
(389, 0, 'april72@example.org', '(153)618-9361x6832', 'Molly', '5338 Dickens Prairie\nNorth Hertha, WY 50965', 'West Annabell', '1992-06-01 00:00:00', 'Cumque aut enim qui illum non corporis. Occaecati beatae ex in accusantium atque. Totam quos ratione laboriosam quia debitis.', 'Silver'),
(390, 0, 'emma.franecki@example.net', '+97(1)7574841146', 'Sid', '255 Gulgowski Spur Suite 876\nSouth Cathyshire, TN 58952', 'Walkerland', '2002-05-12 00:00:00', 'Est qui temporibus vero dicta voluptates rem. Culpa ut dignissimos et vero quas cum. Quia iure enim quia rem atque. Ab consequatur quibusdam explicabo voluptas incidunt impedit.', 'Silver'),
(391, 0, 'reichert.rosalyn@example.net', '405-688-6984', 'Kyle', '726 Emard Forge\nNikkiberg, TN 57768-4243', 'North Emoryton', '1987-10-04 00:00:00', 'Deserunt unde repudiandae nostrum numquam eveniet qui. Ullam repudiandae autem ducimus iusto officiis quo. Temporibus ipsa praesentium quae dolorum vel consequatur architecto.', 'Premium'),
(392, 0, 'ulabadie@example.org', '+59(4)0026247301', 'Sasha', '397 Witting Cliff\nAlexandremouth, HI 02474-4053', 'Carloberg', '2000-06-28 00:00:00', 'Recusandae aliquam odit explicabo aut sed consequuntur eligendi. Veritatis omnis repudiandae qui sint et dolores doloribus itaque. Rerum hic quis placeat praesentium aut eveniet in. Fugiat aut dolor eos facilis velit.', 'Gold'),
(393, 0, 'raegan.carter@example.org', '00003314806', 'Hillary', '438 Marcia Walks Suite 644\nLake Romaine, FL 75200', 'Valentinstad', '1972-12-15 00:00:00', 'Eos nesciunt est qui quibusdam aperiam optio excepturi provident. Ea et neque nemo fugiat sit. Dolores ipsa magnam possimus exercitationem qui natus neque. A sit architecto itaque. Quo aspernatur in tenetur similique autem cum libero.', 'Silver'),
(394, 0, 'reilly.leonel@example.net', '(357)959-6423', 'Mylene', '305 Schultz Throughway\nNew Kennedyborough, MD 86735-6541', 'Lake Bartholomeport', '2001-08-11 00:00:00', 'Corporis error facilis non sit. Molestiae quia quas atque inventore eligendi sequi quam nulla. Ipsa voluptatem ea totam sed repellat laborum tempore. Numquam commodi ex dolorem quia.', 'Silver'),
(395, 0, 'gerhold.loma@example.org', '655.573.8111x934', 'Daphne', '6462 Christop Cape Apt. 797\nLake Felipa, MT 24373', 'New Alecville', '1999-11-17 00:00:00', 'Libero excepturi asperiores rerum aspernatur vel. Omnis nihil amet est expedita animi excepturi. Provident qui nihil sit rerum adipisci delectus velit.', 'Silver'),
(396, 0, 'pgerhold@example.com', '566-451-7435x56095', 'Tavares', '3536 Berge Gateway Suite 690\nSouth Gertrudeland, IN 37989-3851', 'East Nia', '1972-09-01 00:00:00', 'Nobis ea fugiat doloremque. Libero ea pariatur temporibus eos quas sit.', 'Premium'),
(397, 0, 'bernadine.rath@example.net', '680.638.0854x309', 'Odessa', '7681 Jast River\nPort Paula, DE 68391', 'North Tyrese', '2020-08-19 00:00:00', 'Ipsum ut ad qui expedita. Debitis consectetur est quod id aut. Quae assumenda architecto voluptatem non.', 'Free'),
(398, 0, 'jessika42@example.net', '+69(2)4799994392', 'Cristopher', '02855 Keyon Bridge Apt. 002\nWest Theronland, IN 56102-2096', 'West Daphney', '2005-05-07 00:00:00', 'Excepturi asperiores vero voluptates minima fuga veniam et. Quasi repellat culpa labore totam laudantium tempora nobis veniam. Laudantium cum sit harum ea est quisquam magnam.', 'Free'),
(399, 0, 'delbert.homenick@example.com', '343.555.5742x9868', 'Zella', '241 Wolff Camp Apt. 599\nWest Evelinemouth, MS 76925-9220', 'Kyleefort', '1973-10-18 00:00:00', 'Voluptatem necessitatibus ad doloribus facere cum explicabo voluptatem. Voluptatem hic voluptatum odio ab eligendi qui asperiores. Rerum non ex eum itaque.', 'Free'),
(400, 0, 'dante.collins@example.net', '093-311-0565', 'Chet', '32882 Mante Views Suite 406\nEast Joelle, LA 80847', 'Kayceefurt', '2010-03-11 00:00:00', 'Labore necessitatibus ipsa doloribus doloremque commodi optio. Aperiam totam rerum tempora consequuntur asperiores. Eveniet velit eius sed delectus et. Consequatur animi nisi voluptate minima pariatur eos. Ratione voluptates veniam et sint.', 'Gold'),
(401, 0, 'ubrakus@example.com', '1-321-108-5324x02841', 'Queenie', '46433 Ursula Well\nWest Drew, TN 07645', 'Cindyburgh', '1980-02-08 00:00:00', 'Repellat saepe quibusdam nesciunt eum. Nostrum consequuntur ipsum amet id perspiciatis aut. Assumenda quod alias tenetur consectetur qui est.', 'Silver'),
(402, 0, 'nmarvin@example.org', '1-777-707-9997x166', 'Kellen', '721 Germaine Rapid Suite 145\nLake Rasheed, TX 41161', 'Christophebury', '1972-08-27 00:00:00', 'Hic voluptatem dolore rerum fugiat. Corrupti expedita aut dignissimos eaque aliquid quidem dicta. Facilis earum nobis quia at minima modi quod.', 'Free'),
(403, 0, 'boyle.murphy@example.org', '(664)205-6513', 'Valentine', '477 Dietrich Streets\nLake Helene, MI 99317', 'McClureton', '1995-10-10 00:00:00', 'Rem quasi doloremque voluptas quo voluptas ea. Optio molestiae hic consequuntur distinctio. Consectetur deleniti quaerat nam ut.', 'Silver'),
(404, 0, 'camila32@example.com', '+01(1)2998463381', 'Imelda', '02537 Eveline Isle\nEast Vitachester, TN 32333', 'New Linachester', '2016-06-01 00:00:00', 'Sit et doloremque nam. Est tenetur dolorem eligendi perferendis at qui velit. Inventore beatae unde quidem consectetur. Ipsum cum velit et qui.', 'Premium'),
(405, 0, 'tschaden@example.net', '1-870-160-0689x91197', 'Dayana', '58538 Marisol Divide\nEsperanzastad, KS 40988-8006', 'Moorefurt', '1987-02-27 00:00:00', 'Natus sed qui consequatur qui facilis voluptatem cum. Cupiditate doloribus architecto magni quos. Similique officiis voluptas quo maiores voluptas ducimus. Accusamus numquam dolorum accusamus esse doloremque rerum.', 'Silver'),
(406, 0, 'mclaughlin.chadrick@example.com', '(078)960-2254', 'Jazlyn', '34734 Rose Ramp\nSouth Derrick, VA 38655-1491', 'East Maryjaneville', '2012-07-17 00:00:00', 'Corporis cupiditate vitae inventore harum laudantium. Occaecati deserunt quo officiis est. Dolor voluptas vel voluptatum aperiam at quas. Aut cupiditate voluptatem velit enim fugiat. Rem autem deserunt quasi beatae enim.', 'Gold'),
(407, 0, 'nyasia58@example.net', '665.883.7567', 'Helene', '85242 Enrico Estate Suite 008\nSouth Gladys, AK 85337-7141', 'Destineeport', '2009-04-08 00:00:00', 'Optio voluptas provident quo nostrum tenetur maiores. Quod earum fugit vero eveniet maxime. Quia et ea et libero.', 'Gold'),
(408, 0, 'jnitzsche@example.com', '467.692.0309x37638', 'Meta', '584 Hessel Lodge Apt. 039\nLake Elishaburgh, SD 78610-0085', 'Port Novellachester', '1996-12-09 00:00:00', 'Molestiae voluptatem aliquid vel sint deleniti. Molestiae doloribus accusantium non dignissimos qui. Voluptate consequatur voluptatem officia reprehenderit repudiandae. In illo corporis laboriosam aperiam.', 'Premium'),
(409, 0, 'mafalda69@example.net', '(704)069-1571x136', 'Marley', '61703 Pollich Station\nMadieborough, ND 42956', 'West Brandiburgh', '2012-01-02 00:00:00', 'Eligendi nam eaque nulla fugit quis quo qui. Molestias mollitia reprehenderit quis aliquid qui aspernatur aut. Deleniti qui quae perspiciatis inventore repellat odit.', 'Premium'),
(410, 0, 'vlarkin@example.org', '(162)443-5746x249', 'Aidan', '0475 Harvey Stream\nSouth Jaysontown, OH 28175', 'West Dejah', '2004-06-14 00:00:00', 'Nobis minima quia magnam deleniti ducimus omnis. Et est quidem dolores velit. Voluptatem nemo voluptas ea molestiae blanditiis quibusdam. Voluptatem vitae natus magnam dignissimos et molestiae nihil fuga.', 'Premium'),
(411, 0, 'damien86@example.org', '1-771-746-7092', 'Terrill', '81829 Merl Curve Suite 809\nTrentfort, NE 23108', 'East Fernebury', '2008-12-20 00:00:00', 'Quia molestiae officiis minima vel recusandae qui vel. Totam mollitia laudantium necessitatibus dignissimos. Illum eum repellendus et sed molestiae. Ipsam tempore a non tempore temporibus.', 'Free'),
(412, 0, 'hwolf@example.org', '(727)802-1468x05334', 'Leilani', '482 Eden Coves Suite 733\nLake Aprilborough, OR 00920-4303', 'New Karianne', '2014-12-23 00:00:00', 'Cumque est unde quis ut quae. Dolore autem voluptas ad sint et assumenda. Aut blanditiis alias inventore quam. Dolorum et vero aut eum impedit. Laborum saepe dolorem illo esse assumenda et.', 'Free'),
(413, 0, 'jakubowski.lonnie@example.com', '1-157-798-4935x0279', 'Rhett', '20492 Guido Expressway\nSouth Joanland, WY 81811', 'West Dawson', '1975-10-28 00:00:00', 'Molestiae doloremque fuga repellat sed ipsum expedita. Explicabo nulla maiores minima tempore facilis voluptates. Quia et cum quidem molestiae voluptas porro. Nostrum enim velit dicta nihil et labore recusandae perferendis.', 'Premium'),
(414, 0, 'chanelle.rau@example.net', '+53(0)5812313917', 'Omer', '560 Dena Wells Suite 226\nOberbrunnertown, MD 26580', 'South Rosanna', '2016-02-15 00:00:00', 'Quidem cum esse recusandae eveniet ut. Qui voluptatum magnam et. Nam non quia possimus. Accusantium sunt ratione quod ex ut tempora.', 'Gold'),
(415, 0, 'jmayert@example.com', '110.114.7644x1410', 'Emilie', '2001 Edmund Isle\nWest Eviemouth, NH 79696', 'New Bernardoside', '2009-11-08 00:00:00', 'Optio odit sed et dolor beatae labore eius. Molestias nulla aspernatur quod ut. Minima inventore non quam consequuntur id repellendus. Facere neque esse qui sit.', 'Free'),
(416, 0, 'elaina58@example.com', '1-116-056-7332x69056', 'Jamir', '84699 Gleason Points\nHellershire, TN 44581-2423', 'New Grantville', '1978-12-23 00:00:00', 'Culpa iusto quo quam. Alias in assumenda cupiditate beatae iure voluptas aut velit. Aut ea quibusdam eum doloremque omnis non. Accusantium vel numquam rerum odio tempore veritatis deserunt.', 'Gold'),
(417, 0, 'rafael54@example.com', '(128)269-8270x933', 'Carson', '80132 Ivory Road Apt. 400\nLake Jimmie, ND 77439', 'Amelytown', '2021-03-22 00:00:00', 'Voluptas sint non eum. Ipsa nemo vel illum. Illo quo omnis vitae minus odit dolores repudiandae. Magnam voluptatem reiciendis dolores doloremque illo.', 'Premium'),
(418, 0, 'candido78@example.net', '350-609-6233x4749', 'Elsie', '653 Greenholt Rapid\nMandyview, NJ 82805-2729', 'West Tomas', '1999-01-07 00:00:00', 'Aperiam fugiat doloremque veniam voluptates aut. Aperiam itaque accusamus aut tempore molestiae totam. Mollitia ad est quo blanditiis laboriosam.', 'Premium'),
(419, 0, 'sporer.easter@example.org', '394.559.1553x32359', 'Ross', '9502 Jerde Avenue Suite 907\nEast Tanyamouth, MI 96797', 'New Willyberg', '1993-09-20 00:00:00', 'Eius exercitationem sunt esse facere dolores possimus. Quidem eos laboriosam animi impedit. Deleniti incidunt suscipit ullam cupiditate et eos. Ea velit inventore sint atque reiciendis harum vitae.', 'Free'),
(420, 0, 'isadore25@example.com', '1-092-895-2723x9288', 'Giovanna', '742 Davin Lodge\nTrentland, DC 12844', 'Port Daniella', '2009-06-05 00:00:00', 'Assumenda sint ab ipsam maxime earum numquam assumenda. Eos impedit doloribus dolorem tempora accusantium reprehenderit similique. Quos ratione suscipit repellat similique facilis et quia. Inventore non ipsum perferendis ad eius eum laboriosam laudantium.', 'Silver'),
(421, 0, 'dietrich.aleen@example.net', '(854)658-6416x5877', 'Raquel', '620 Mayert Centers\nWest Scottystad, CO 74206', 'Lake Andreanne', '1989-01-18 00:00:00', 'Minima ut dolor sequi sint quia voluptas occaecati. Aperiam rerum ut non autem tenetur explicabo ad quos. Harum corporis fugit voluptas eligendi.', 'Gold'),
(422, 0, 'gibson.andreane@example.net', '(226)309-7297x0696', 'Kayden', '089 Wolff Summit Apt. 980\nAmparoborough, CT 40492-1128', 'Lake Anyastad', '1991-02-10 00:00:00', 'Quis nisi consequuntur adipisci ratione autem sequi. Quam voluptatem sed sint reiciendis. Fugit est perferendis laudantium perferendis.', 'Silver'),
(423, 0, 'freeman.wilkinson@example.org', '508.399.7655x7348', 'Kolby', '8560 Hailee Causeway Suite 042\nWest Vesta, HI 96062-1530', 'West Kayden', '1975-06-13 00:00:00', 'Nesciunt commodi nemo sed et earum recusandae. Maxime aut et qui fuga doloribus ipsam ipsum. Nesciunt ducimus ratione ut inventore. Quisquam iure itaque nihil doloribus labore.', 'Silver'),
(424, 0, 'maxine.hermann@example.net', '1-456-176-0087x6771', 'Melissa', '9716 Predovic Circles Suite 139\nMillsview, MD 81801-8274', 'New Gladysborough', '1989-05-04 00:00:00', 'Autem accusamus repudiandae occaecati molestiae. Saepe sed voluptates consequuntur. Deserunt eaque et et rerum vel hic. Maxime magni itaque molestias voluptatem earum.', 'Free'),
(425, 0, 'torrance.kiehn@example.com', '461.492.5194x6212', 'Hester', '41349 Niko Plains Apt. 169\nNorth Ceasar, ID 43483-6253', 'Manuelashire', '2014-01-07 00:00:00', 'Et atque aspernatur laboriosam sapiente sint. Facere dolores aliquid animi quibusdam minima. Maiores ullam quod cupiditate voluptatem. Doloribus provident officiis sint eum.', 'Premium'),
(426, 0, 'treva93@example.com', '1-201-109-1287', 'Elva', '8453 Treutel Rapids\nEast Jarrett, NJ 91253', 'Jacobsshire', '1986-11-16 00:00:00', 'Eveniet repellendus perferendis est sint. Beatae voluptatem nisi occaecati reiciendis. Et dolorem id iste aut facere dolorem. Inventore asperiores quos dolor fuga sint.', 'Gold'),
(427, 0, 'mcclure.cristina@example.net', '501.534.7130', 'Reid', '74298 Jaskolski Summit Apt. 199\nStacyside, NH 39942-9888', 'Port Gay', '1999-01-16 00:00:00', 'Voluptas labore est incidunt mollitia. Tenetur autem possimus recusandae ab omnis possimus. Possimus similique hic minima officia distinctio quisquam. Harum eos aut alias quisquam.', 'Free'),
(428, 0, 'jadon.halvorson@example.org', '1-289-418-3467x022', 'Nelle', '380 Wyman Unions Suite 997\nFabianfurt, FL 22512', 'West Lia', '1974-02-19 00:00:00', 'Suscipit voluptas consequatur autem. Et nisi deleniti rerum consequatur et. Excepturi atque eligendi vero aliquam expedita voluptas assumenda.', 'Free'),
(429, 0, 'citlalli.zulauf@example.net', '(981)929-6548x66744', 'Walter', '2844 Metz Village Apt. 969\nHaneview, NE 03604', 'Raynorborough', '2015-01-04 00:00:00', 'Et libero aut dicta explicabo vel ut aliquam omnis. Exercitationem exercitationem aut voluptas natus minima sunt ut. Asperiores voluptatem asperiores perspiciatis ipsam. Omnis corporis voluptate autem est illo debitis velit.', 'Silver'),
(430, 0, 'lowe.jovanny@example.org', '(666)070-6432', 'Jaiden', '361 Cade Stravenue Apt. 848\nLake Isaiside, CT 27222-9817', 'Nyahville', '2015-06-23 00:00:00', 'Quos adipisci vitae eius voluptatem dolor quidem qui dolor. Illum molestias ut accusantium repellendus et. Voluptas repudiandae voluptatem omnis possimus at voluptatem.', 'Silver'),
(431, 0, 'samantha82@example.net', '02547648747', 'Mya', '7169 Shea Burgs Suite 510\nEast Josefastad, WI 00780', 'Gutkowskiside', '1979-07-20 00:00:00', 'Voluptatem deserunt aut dolores. Libero totam ut maxime rem. Amet error rerum iusto aut. Corporis animi vel et numquam amet. Beatae eos perferendis expedita omnis qui.', 'Premium'),
(432, 0, 'jeromy.gaylord@example.com', '293.420.1044', 'Justus', '8015 Turner Rest\nNew Bobby, IA 86991', 'North Celestinetown', '2007-11-15 00:00:00', 'Sequi repellat distinctio perferendis eligendi natus. Quidem est qui et blanditiis. Modi omnis ut et aut doloremque est. Qui minima consequatur occaecati reiciendis deleniti aut.', 'Silver'),
(433, 0, 'cassin.lane@example.org', '(993)569-9701x4652', 'Brook', '6956 Nils Mills Suite 824\nSouth Keeley, NY 86755-4840', 'Dereckborough', '1978-10-02 00:00:00', 'Molestiae assumenda quod tenetur vitae. Ipsam maxime error sed voluptas provident ex. Nemo eligendi rerum voluptas.', 'Gold'),
(434, 0, 'lynn21@example.com', '(056)000-1488', 'Maureen', '5996 Leanna Crossing Suite 007\nWest Dennishaven, AL 61093-9346', 'New Cale', '1998-03-04 00:00:00', 'Tenetur sit voluptas eligendi eaque nisi qui. Molestias nihil molestias adipisci omnis vitae id veritatis. Ad aut natus hic magni a quia. Mollitia et quibusdam praesentium ad et.', 'Silver'),
(435, 0, 'roberta.gorczany@example.net', '912-945-7862x647', 'Breanna', '2755 Angelina Estate Apt. 690\nNorth Aliyah, NM 50301', 'McClureton', '1995-11-26 00:00:00', 'Nam ad et consequatur. Omnis maxime qui occaecati explicabo numquam cumque ut quia. Dolor consequatur et magnam animi. Perspiciatis deleniti consectetur debitis voluptate.', 'Free'),
(436, 0, 'considine.juston@example.org', '431.725.6950', 'Charlotte', '901 Shyanne Alley Apt. 059\nNorth Edison, NV 81589', 'Mannshire', '2007-03-14 00:00:00', 'Dolor sunt consequatur consequatur totam ullam. Vel veritatis non eaque. Ad omnis dolores omnis repellat quasi eos. Omnis eaque dolorem ipsa dignissimos illum velit deleniti.', 'Free'),
(437, 0, 'stephany.rice@example.org', '319-981-9078x9518', 'Lilla', '50584 Wyatt Flat Suite 224\nCarolinahaven, MA 20390', 'New Koreyville', '1974-10-13 00:00:00', 'Aut architecto ut quos sunt in. Hic reprehenderit vel accusantium odit et fugit ut quod. Qui ullam dicta perferendis error repellendus est. Nesciunt quos a nostrum et vitae ipsam quo.', 'Gold'),
(438, 0, 'stehr.abraham@example.net', '1-347-180-5555x6206', 'Federico', '43515 Adams Field Apt. 028\nConsidinemouth, TN 60267', 'Jasenchester', '1998-08-18 00:00:00', 'Totam autem aperiam suscipit voluptatem ut est qui est. Repudiandae voluptatum ipsam in quaerat tempore et. Et fugit aut omnis est sapiente earum. Fugit porro ullam voluptatem modi voluptas dignissimos voluptas culpa.', 'Premium'),
(439, 0, 'cassin.monica@example.net', '113.877.5696x250', 'Raleigh', '876 King Junctions\nNew Onie, KY 06947', 'Gloverbury', '1993-06-20 00:00:00', 'A ipsum enim sunt fugit ut doloremque. Odio expedita numquam quis et ut.', 'Silver'),
(440, 0, 'obeahan@example.net', '370-858-4716x3764', 'Arvid', '134 Armani Valleys\nNorrisstad, ID 22708', 'Shanahanmouth', '1995-06-08 00:00:00', 'Similique culpa facere est incidunt quasi hic est. Consectetur omnis fugit consequatur consequatur. Enim temporibus cupiditate vitae voluptatem tenetur error id. Sint rerum et et dolorum repellat blanditiis.', 'Gold'),
(441, 0, 'bgoodwin@example.com', '(069)201-9371', 'Golda', '3819 Huel Roads\nSkylartown, MT 79687-9915', 'Maeganside', '1976-06-20 00:00:00', 'Qui molestiae et est numquam aut a. Doloribus cumque odio nihil in praesentium quasi.', 'Free'),
(442, 0, 'fgraham@example.com', '(751)949-8634', 'Marie', '3289 Mallory Bypass Suite 553\nPort Dessieport, ID 56829-2124', 'East Kale', '2008-07-20 00:00:00', 'Voluptatem id officiis consequatur et omnis eos recusandae. Temporibus eos cum voluptatem et aspernatur aut tenetur. Dolores molestiae numquam exercitationem harum laudantium. Excepturi ipsa voluptate ut velit ut quaerat.', 'Premium'),
(443, 0, 'mmante@example.net', '105-700-6472x5929', 'Ashleigh', '2752 Leannon Dam Suite 917\nWest Leonel, RI 81704-5089', 'North Maybell', '1981-12-05 00:00:00', 'Consectetur ullam quos consequatur velit. Et cumque ut voluptatem sint rerum commodi. Et voluptatem laboriosam provident dolores est.', 'Silver'),
(444, 0, 'krajcik.emmanuel@example.net', '02821913084', 'Reyna', '161 Spinka Port Apt. 067\nWest Mustafastad, VT 97032', 'Bretview', '2014-12-20 00:00:00', 'In commodi perspiciatis neque dicta blanditiis qui voluptas. Veritatis omnis maxime veritatis maiores.', 'Premium'),
(445, 0, 'bartholome.treutel@example.org', '06194770434', 'Wendell', '1178 Jacklyn Shoal Apt. 044\nNew Hollyton, TN 49100-4235', 'South Maidafurt', '1980-11-01 00:00:00', 'Rerum corporis pariatur et et officia explicabo. Maiores aut non et provident animi enim. Vitae magni nobis libero fugiat consequatur blanditiis. Ipsa provident dolorem facilis omnis voluptatem voluptatem recusandae.', 'Silver'),
(446, 0, 'jhilll@example.com', '+65(5)3724709445', 'Asha', '0714 Grimes Glens\nJasenview, FL 28192-9176', 'Savannafurt', '1993-12-17 00:00:00', 'Et eum sit reprehenderit qui qui sed repudiandae. Est doloribus consequatur qui recusandae. Dolor eos id veritatis rem modi.', 'Free'),
(447, 0, 'ohuels@example.com', '+36(8)7496726493', 'Jessie', '267 Jerde Mount Suite 545\nHilllbury, CO 56176-8763', 'Kaciville', '2022-02-16 00:00:00', 'Voluptas optio officiis temporibus enim commodi natus. Iure illo ab consequatur exercitationem aliquam asperiores. Autem et recusandae aperiam ut voluptatem ut. Sed aut accusamus excepturi ut fugiat amet.', 'Silver'),
(448, 0, 'terry.moshe@example.net', '399-290-0739x87906', 'Chanel', '2220 Brendan Island Suite 421\nBeahanberg, GA 95797', 'Elbertfurt', '1994-01-10 00:00:00', 'Et autem distinctio est rerum. Quod adipisci incidunt aliquam ea at sit temporibus. Occaecati veritatis voluptatum omnis molestiae. In reiciendis accusamus dignissimos fuga temporibus suscipit labore.', 'Gold'),
(449, 0, 'iabernathy@example.net', '1-613-608-7985x02186', 'Jakob', '70226 Bill Court Apt. 777\nJacobiburgh, NY 47917-8298', 'Romagueraland', '2000-05-30 00:00:00', 'Culpa et voluptatibus placeat dolores. Neque veniam earum quo consequatur impedit nihil. Non eligendi enim illo sequi. Asperiores quia dolor saepe est ut consectetur.', 'Free'),
(450, 0, 'rowe.chelsie@example.com', '288-369-4780', 'Stone', '9820 Conor Tunnel\nNoemifurt, SC 24832', 'Claudeburgh', '1989-05-03 00:00:00', 'In dolore voluptatem suscipit necessitatibus voluptate temporibus enim eos. Explicabo esse veniam quidem voluptatibus eum cum. Non qui consequatur quae assumenda. Vitae hic quos animi autem vero labore saepe.', 'Gold'),
(451, 0, 'cayla.mcclure@example.net', '523.854.1674x00358', 'Karlee', '864 Quinton Fort\nNorth Aldachester, LA 42860-6708', 'Lake Juanita', '1987-06-04 00:00:00', 'Consequatur error velit cum dolor. Magni cum facere reprehenderit. Voluptatem veritatis aut amet aut facilis consequuntur sunt. Iste quidem aliquid est possimus nulla non.', 'Premium'),
(452, 0, 'mabel04@example.com', '090-443-4463x3291', 'Daphnee', '448 Lavada Lock Apt. 068\nDurganburgh, SD 24367', 'South Amalia', '2020-01-14 00:00:00', 'Laudantium aperiam incidunt praesentium repellat nesciunt optio ullam et. Qui cumque pariatur est alias eius esse at aut. Et alias animi voluptate quia enim nemo vitae enim. Id accusamus sint in nisi. Excepturi assumenda non blanditiis in repellat.', 'Gold'),
(453, 0, 'javon.ziemann@example.com', '(386)919-6646x34773', 'Vilma', '297 Rafaela Ramp Suite 311\nNorth Marleyside, PA 91331', 'Pearlville', '2020-04-06 00:00:00', 'Sunt officia nesciunt qui assumenda. Mollitia aut ad mollitia est asperiores nihil expedita. Totam et assumenda inventore ipsum ut est.', 'Gold'),
(454, 0, 'welch.narciso@example.net', '937.145.2422', 'Jonathon', '63213 Olson Stravenue Suite 350\nNew Broderickstad, AZ 08406', 'South Blairside', '1989-03-05 00:00:00', 'Sunt ea eos vel quas exercitationem. Cum odio voluptatem omnis ea facilis. Doloribus voluptatem et est eligendi.', 'Free'),
(455, 0, 'kiel31@example.org', '(819)530-3290x898', 'Agustina', '19001 Neha Lake\nEast Westleystad, KY 67763-6046', 'Grahamville', '1988-10-27 00:00:00', 'Dolor architecto quod harum labore quisquam. Sit similique perferendis aspernatur dolorem occaecati magnam quidem cum. Inventore rerum fugiat rerum consequuntur doloremque doloremque dolorem. Fugit quis ipsam possimus ea delectus a.', 'Gold'),
(456, 0, 'fbrekke@example.net', '645.648.1095x59073', 'Hermina', '32720 Trace Trafficway\nLednerton, MA 81831-3207', 'Port Alice', '2004-03-07 00:00:00', 'Nesciunt aspernatur voluptatem omnis et ipsa est. Sapiente voluptate fuga est et. Eius sequi a similique explicabo autem omnis.', 'Gold'),
(457, 0, 'klein.ena@example.org', '409-495-0119x71644', 'Melba', '34754 Daniel Orchard\nBernardoborough, ME 24438', 'South Nathanmouth', '1977-04-20 00:00:00', 'Beatae veritatis ab ipsa aut sequi quia. Delectus soluta officiis omnis corporis sed. Enim et est quidem et consequuntur autem enim.', 'Silver'),
(458, 0, 'brandon.hartmann@example.com', '1-163-751-6964x7461', 'Zoe', '9594 Treutel Drives\nWaelchiland, KY 19197', 'New Aida', '2003-10-05 00:00:00', 'Ea eos ut sapiente officiis. Fugiat aliquam minus aspernatur ut. Praesentium aperiam accusamus dicta ab. A porro nisi fuga a autem atque deserunt ab.', 'Premium');
INSERT INTO `individual` (`id`, `status`, `email`, `phone`, `name`, `address`, `city`, `since`, `description`, `packet`) VALUES
(459, 0, 'jnikolaus@example.com', '224.470.2187', 'Malinda', '6763 Hammes Court\nKihnmouth, ME 07162-1947', 'West Esta', '2017-02-02 00:00:00', 'Rem possimus quam pariatur aut. Modi delectus deserunt quo inventore dolorum ratione. Labore nesciunt ut consectetur labore beatae sit. Ex veritatis quia odit consequatur vitae. Sed iusto vel iusto est voluptatum.', 'Premium'),
(460, 0, 'zvonrueden@example.com', '067.438.1715x15866', 'Derrick', '835 Hickle Walks Suite 336\nTysonshire, CO 12422-1792', 'Vandervortport', '1973-09-17 00:00:00', 'Adipisci veniam accusamus eaque quo culpa. Eligendi sed voluptatem quidem non voluptatem. Ea quia qui odit amet consequatur. Quibusdam est sunt modi exercitationem. Officia laborum ab maxime quasi in.', 'Gold'),
(461, 0, 'gskiles@example.org', '084-971-4843x3370', 'Eliane', '960 Jermain Turnpike\nKuhnhaven, MN 16030', 'Port Chelsey', '1982-08-05 00:00:00', 'Officiis quam quae sunt aut. Praesentium magni quia magnam ex odio odit qui. Vero sit harum eum autem. Voluptatibus minus suscipit quis tempore et.', 'Silver'),
(462, 0, 'cecilia.von@example.org', '00232003562', 'Henri', '2918 Hayes Roads Apt. 162\nWest Mabel, ND 48127', 'Schultzshire', '2001-08-03 00:00:00', 'Est ipsa facilis blanditiis aut iure doloribus. Ea aut minus omnis similique saepe voluptatem. Porro repudiandae non sed. Aut quibusdam id corrupti iste. Blanditiis facilis libero fugit ut qui asperiores eum.', 'Gold'),
(463, 0, 'o\'hara.gracie@example.org', '1-708-545-9496', 'Kali', '7665 Romaguera Pass\nWest Ethanbury, AZ 33585', 'Prohaskastad', '2010-09-18 00:00:00', 'Dolores ut ut aut officiis ea porro. Sapiente ea sed quae temporibus at temporibus. Rerum mollitia asperiores voluptate nobis quam possimus.', 'Silver'),
(464, 0, 'blick.carmen@example.net', '052-024-4559', 'Zack', '86295 Rosina Springs\nEast Mike, PA 08659', 'North Gerard', '1986-10-11 00:00:00', 'Autem eveniet maiores quaerat. Qui quas ex deleniti adipisci est odio. Eos et quos doloribus distinctio ad.', 'Gold'),
(465, 0, 'zhudson@example.org', '(007)538-6715x76197', 'Joel', '04291 Rippin Overpass Suite 101\nJazminmouth, PA 96625-6323', 'New Alimouth', '2012-06-29 00:00:00', 'Quae quis quae consequatur est. Nobis occaecati et ullam aut qui. Magnam non fugiat asperiores voluptatem sint autem eaque. Vel pariatur nisi animi quos nesciunt voluptatibus. A occaecati quo velit omnis dolore sed quia accusantium.', 'Silver'),
(466, 0, 'welch.tyree@example.org', '594.472.2751x967', 'Greta', '16109 Jones Via\nEast Alejandrinbury, GA 47629-1918', 'McLaughlinville', '2016-10-06 00:00:00', 'Et deserunt commodi aperiam harum ut. Libero unde magnam excepturi non quia et. Tempora eius a odit vel nam nemo facere. Sit magni quia et ut.', 'Premium'),
(467, 0, 'wbradtke@example.org', '735-721-9110', 'Eldred', '557 Doyle Forge\nNew Solonview, ND 14150-9787', 'West Adalberto', '2019-04-17 00:00:00', 'Porro magnam quaerat iste possimus recusandae. Rerum aut suscipit ad est quam ratione est. Quibusdam officiis id libero officiis animi est. At incidunt autem culpa quis. Repudiandae repudiandae provident voluptates explicabo ex eos.', 'Free'),
(468, 0, 'klind@example.com', '09534853654', 'Raymundo', '20707 Nona Shoals\nNorth Karelleborough, ME 70976-7024', 'Harrismouth', '1992-07-09 00:00:00', 'Autem consequatur qui perferendis soluta et nemo. Architecto expedita est consectetur sed. Ipsum harum ea sit eveniet non magnam.', 'Free'),
(469, 0, 'moore.juliana@example.org', '(879)220-2674', 'Domenick', '44992 Valentin Ridges Apt. 722\nWest Ardella, NM 71135-8243', 'North Ernestofort', '1971-11-25 00:00:00', 'Animi recusandae enim ea ipsa nisi cum. Amet delectus dolorem ad vel quo. Expedita sed ex ducimus ut ratione cum.', 'Premium'),
(470, 0, 'luigi.wolf@example.org', '01051642105', 'Enoch', '1468 Dare Station Apt. 832\nMurrayton, KY 21608', 'Lylaberg', '2003-09-15 00:00:00', 'Alias eius ratione aut iure ullam molestias non. Aliquid saepe et quibusdam quasi minus. Eius quas aliquam autem vero. Est dolores ad iure vero amet minima et.', 'Silver'),
(471, 0, 'caterina.abshire@example.net', '(752)424-5504x3882', 'Shania', '512 Lindsey Corner\nWest Santinaville, MD 72002', 'New Leonora', '1987-05-31 00:00:00', 'Quos fugiat optio fugit veniam vitae et quo. Non expedita doloremque nam odio non aut. Dolorem repellat quod aut nam quia molestiae eius.', 'Free'),
(472, 0, 'amarquardt@example.org', '1-756-395-3781x235', 'Paula', '7583 Leif Villages Suite 943\nNew Murray, AZ 33404', 'Konopelskiborough', '1991-08-20 00:00:00', 'Voluptas dolores sint sit rerum culpa sed nulla eaque. Aut iure dolor fuga quaerat omnis culpa magnam. Qui nesciunt quod ea dolor dolor possimus velit. Officiis temporibus eum excepturi minima dicta eum assumenda dolorem.', 'Gold'),
(473, 0, 'wlang@example.org', '1-477-283-2624x16700', 'Lourdes', '3585 Garrett Parkway Apt. 370\nVerdieton, NM 16359', 'South Citlalli', '2000-10-07 00:00:00', 'Eum dolorem accusamus et adipisci et. Vel illum quia velit cupiditate voluptatum dolore.', 'Silver'),
(474, 0, 'joanne30@example.org', '(249)673-3207', 'Jennifer', '2651 Beatty Springs\nNorth Ralphton, KS 95301', 'Lake Deborahhaven', '2016-09-15 00:00:00', 'Beatae sunt mollitia sed est. Necessitatibus neque aut sed natus sapiente aspernatur qui quis. Et commodi autem reprehenderit neque.', 'Premium'),
(475, 0, 'alyson.rohan@example.net', '735-634-6623', 'Antonietta', '27311 Abigayle Creek Apt. 812\nNorth Jonathonshire, VA 40379-0906', 'New Kylatown', '2013-02-02 00:00:00', 'Ab adipisci dolores nobis vel laborum ut. Architecto dolorem odio consequuntur enim incidunt consequatur officia error. Repudiandae ea ea numquam sed qui est eaque. Earum fuga et rerum natus assumenda quia ut.', 'Gold'),
(476, 0, 'aida.hartmann@example.org', '+01(4)6002462933', 'Kristoffer', '5630 Harris Ford Apt. 095\nLeschside, CO 09064', 'West Jaydonside', '1979-04-10 00:00:00', 'Magnam eligendi similique impedit sapiente adipisci. Est temporibus fugiat facilis est repellat tenetur. Repellendus sint nihil consequatur quidem suscipit provident.', 'Gold'),
(477, 0, 'madams@example.com', '1-002-838-7078x12847', 'Noel', '2636 Wilkinson Keys Apt. 925\nRosaliaburgh, MI 06449-5339', 'South Arafurt', '2002-01-20 00:00:00', 'Fugit dolore perspiciatis debitis. Eum quia beatae voluptatum voluptatibus sint iste ex.', 'Free'),
(478, 0, 'orn.alejandra@example.org', '(377)834-6649x61946', 'Kory', '7090 Gregory Hills Suite 217\nWest Irwinberg, OR 36511-0245', 'Wilkinsonstad', '1975-08-17 00:00:00', 'Modi incidunt atque culpa dolorem facilis debitis. Unde eum eveniet id rem. Velit hic excepturi sunt est et quam nemo.', 'Gold'),
(479, 0, 'lillie.gislason@example.net', '(838)628-6651x373', 'Ceasar', '17317 Murazik Junctions Apt. 048\nWest Lane, MS 42902', 'Baileehaven', '1995-09-27 00:00:00', 'Labore temporibus cupiditate maiores sapiente eaque in non laudantium. Voluptatem sit cupiditate voluptatem. Repudiandae atque cum sint temporibus.', 'Gold'),
(480, 0, 'vbarton@example.org', '(511)485-5513x32863', 'Alexys', '159 Zulauf Mill\nMyrtisberg, VT 96019', 'McLaughlinstad', '2009-08-29 00:00:00', 'Quam labore dignissimos odio similique sint et harum. Rerum quo explicabo reprehenderit aut fugiat. Dolorum autem quo ullam quae aut suscipit. Iure dicta repudiandae et dolore qui eligendi ipsum maiores.', 'Gold'),
(481, 0, 'madyson.vandervort@example.com', '952.760.7689x564', 'Kim', '73977 Lesch Divide Suite 813\nEast Hershel, IL 44248', 'West Margarette', '2009-06-27 00:00:00', 'Dignissimos quis necessitatibus explicabo quibusdam et ex. Dolor et voluptates doloremque et quibusdam. Quia vel et quibusdam dolore.', 'Silver'),
(482, 0, 'vsawayn@example.com', '1-841-503-3683', 'Hillard', '334 Rogahn Camp Suite 572\nNorth Nevafort, GA 14918-6418', 'East Adrielfurt', '1985-04-14 00:00:00', 'Earum dolor ut tenetur porro dolor. Ipsum dignissimos maiores voluptate quidem. Rerum a et fugiat libero. Quia assumenda reiciendis magnam ab ipsam neque quod.', 'Premium'),
(483, 0, 'lane34@example.com', '753.494.1360x761', 'Reyna', '25956 Holly Summit Apt. 725\nWilkinsonbury, NJ 58680', 'Lake Raphaelle', '1983-10-24 00:00:00', 'Soluta qui itaque vel explicabo repellat repudiandae. Suscipit ut ipsum corporis minus a eligendi qui quod. Omnis nostrum saepe odit adipisci reiciendis alias. Tempore est placeat amet voluptatem.', 'Free'),
(484, 0, 'rlind@example.com', '128.405.9509x24161', 'Daniela', '28287 Collins Passage Suite 474\nWest Yolanda, AL 12483-7094', 'Wymanton', '1993-11-10 00:00:00', 'Et numquam dolor vitae. Sed veniam voluptates repellat perferendis omnis aut deserunt. Hic ut sint quae facilis amet rem. Veritatis ut aut et ea magnam occaecati et. Ut ipsam qui voluptatum est incidunt.', 'Free'),
(485, 0, 'ryan79@example.org', '1-347-356-7322x6349', 'Cullen', '7430 Gleichner Turnpike Apt. 331\nHauckport, SC 53527-2327', 'VonRuedenbury', '2000-11-06 00:00:00', 'Minima alias molestiae qui dolorem aut dolore quo magnam. Repellat occaecati totam qui consequatur vero labore tenetur. Non fuga non distinctio corrupti excepturi ipsam et facilis. Quas sint omnis totam cupiditate dolorum.', 'Gold'),
(486, 0, 'lang.axel@example.net', '+77(1)2042862795', 'Mozell', '6019 Turcotte Estates Suite 313\nAftonshire, MA 29542', 'West Stanchester', '2017-04-14 00:00:00', 'Neque aut et pariatur aut aperiam voluptatem non. Repudiandae distinctio rerum non dicta. Magnam non incidunt sed iure quis nihil sed quam.', 'Free'),
(487, 0, 'jon78@example.net', '+02(5)1001683200', 'Gregg', '433 Hoeger Village Suite 156\nLake Judahberg, CO 93119', 'Lake Domenic', '2001-05-05 00:00:00', 'Officiis rem cupiditate quidem quisquam. Ratione et in laboriosam occaecati voluptate porro nisi. Incidunt id accusamus quasi rerum.', 'Free'),
(488, 0, 'lzemlak@example.net', '(034)509-4694x498', 'Hipolito', '8741 White Ways Apt. 444\nWiegandchester, MA 52517', 'Lake Cole', '1987-02-12 00:00:00', 'Qui et id quas quia ipsum voluptatem minima. Repellendus molestiae aut possimus et. Sunt commodi eveniet aliquid illo rem sed. Autem animi hic dolorem dolores ut officia eius.', 'Free'),
(489, 0, 'kling.camille@example.org', '(993)559-4173x1546', 'Audreanne', '473 Hagenes Square\nColtenchester, OK 69601-4260', 'New Dedrickshire', '1972-10-06 00:00:00', 'Asperiores minima et dolor officia. Eligendi et eos repellat unde quia esse.', 'Gold'),
(490, 0, 'otilia17@example.net', '131.514.3613x918', 'Tristin', '553 Eloisa Squares Suite 048\nFramishire, AR 26424-8861', 'Dickimouth', '1977-06-12 00:00:00', 'Nam nobis recusandae qui sit repellat quisquam vel. Sint amet non iusto tempore. Adipisci facilis laborum est iste quia quia. Dignissimos delectus sapiente vitae eligendi. Quo earum molestiae doloremque dolor est.', 'Silver'),
(491, 0, 'chloe76@example.net', '380.077.4888', 'Clyde', '51208 Dorothea Streets Suite 581\nNorth Dangelostad, WV 56329', 'Lilyanville', '1999-05-26 00:00:00', 'Reiciendis quam at dolor enim aut cum culpa. Sint animi ab voluptates aut. Qui non sit cum velit culpa temporibus aut. Ea voluptatem similique debitis quae ipsum facere qui.', 'Silver'),
(492, 0, 'lskiles@example.net', '041-506-4138x594', 'Eldridge', '4662 Lorenzo Wall Apt. 831\nSteuberfurt, MA 69933', 'Beckerstad', '1971-02-09 00:00:00', 'A earum culpa nam corporis ipsam nihil. Minus libero et voluptatem facere. Vel magni dolores non.', 'Free'),
(493, 0, 'schmidt.nicolette@example.org', '772.294.6704x16236', 'Alexandro', '5058 Rice Tunnel\nJustinashire, MO 87451', 'Adrienneville', '2006-12-15 00:00:00', 'Unde ratione eos qui odio et vero. Ut quis rerum saepe numquam non. Placeat deserunt molestias minus dolores. Labore eum ullam et doloribus voluptas sapiente officiis.', 'Silver'),
(494, 0, 'conroy.laverna@example.com', '+05(5)8464903430', 'Devin', '573 Larkin Falls\nCheyanneville, SD 39805', 'West Mortimermouth', '1987-08-02 00:00:00', 'Qui odit provident voluptas voluptatibus sit. Dolores nesciunt dignissimos veritatis iure aliquam cum qui.', 'Free'),
(495, 0, 'wquigley@example.net', '(997)917-9669x0732', 'Vicenta', '26052 Wilfrid Heights Apt. 251\nWest Olga, AL 92443', 'Rogersstad', '2007-10-27 00:00:00', 'Enim earum itaque quia sed et ullam ratione. Non deleniti exercitationem laboriosam impedit. Fugiat adipisci qui magni qui voluptatem aut aliquid quibusdam.', 'Free'),
(496, 0, 'nader.eloy@example.org', '(219)394-8640', 'Christop', '55178 Pollich Estates\nHageneshaven, OR 83944', 'South Kathleen', '2010-11-16 00:00:00', 'Quas est odit consequatur vero in asperiores. Qui maiores optio voluptatum reiciendis. Nam at et nemo vero vero est quod a.', 'Free'),
(497, 0, 'electa.klein@example.com', '654.153.8627x13117', 'William', '3044 Bridget Ranch Apt. 073\nAbigalemouth, KY 29476-4638', 'East Beatrice', '1984-09-11 00:00:00', 'Enim nostrum ipsa aut suscipit vitae totam. Et corrupti illum quia commodi numquam et. Sunt sint perspiciatis molestias voluptates. Doloremque voluptate deserunt sit at.', 'Silver'),
(498, 0, 'mariam.nolan@example.com', '457.835.8364x360', 'Camylle', '9223 Brennan Unions\nWest Johnnietown, NC 56366-6503', 'Lake Nathanialfort', '1998-09-28 00:00:00', 'Ea consequatur vel fugit. Officia in quia et repellat ratione id. Provident saepe similique officiis dolor corporis velit corporis. Natus cumque libero tempora possimus.', 'Premium'),
(499, 0, 'roslyn.beahan@example.org', '1-150-462-3229', 'Brooks', '8500 Erdman Route\nRatkechester, VT 84204', 'Bessiemouth', '1991-11-06 00:00:00', 'Alias vel quos accusantium aut ab. Molestias dolorem harum vero cum.', 'Gold'),
(500, 0, 'chelsea38@example.com', '1-612-192-5504x9253', 'Keyshawn', '951 Laron Lakes\nDangeloside, MI 62545-0642', 'East Houston', '1972-10-16 00:00:00', 'Reiciendis omnis enim aut. Consequatur sit quo vel sit numquam nam ratione. Dolor animi doloremque saepe. Sed eius veniam consequuntur cupiditate eveniet nesciunt.', 'Premium'),
(501, 0, 'eduardo.bernhard@example.net', '(971)087-0021', 'Steve', '4158 Kirlin Dam Apt. 028\nSouth Baileestad, KS 59821', 'Robertsshire', '2014-06-25 00:00:00', 'Voluptate explicabo quisquam dicta ut cupiditate sit. Saepe velit quaerat aut et harum voluptatem est quis. Unde delectus incidunt saepe praesentium est.', 'Premium'),
(502, 0, 'schaden.delpha@example.net', '(734)271-1059', 'Torrey', '98266 Rodriguez Road\nWest Guadalupe, CA 01073', 'South Marjorie', '2020-08-26 00:00:00', 'Incidunt reiciendis deserunt qui sint cupiditate necessitatibus veniam. Sint ipsum illum et molestiae. Quidem maiores dignissimos ut voluptatum. Rerum sint nobis sed ipsum quod quod.', 'Premium'),
(503, 0, 'nitzsche.leopoldo@example.com', '162-033-1335x7204', 'Deonte', '2586 Jeramie Circle\nPort Tysonmouth, WI 31710', 'Haydenhaven', '1989-07-07 00:00:00', 'Architecto aliquam quo sed cumque omnis repellendus voluptatem sunt. Unde aut nobis est occaecati vero pariatur. Excepturi et culpa non at sit repellendus vero.', 'Premium'),
(504, 0, 'jacklyn.stark@example.org', '06915678223', 'Aiyana', '71719 Presley Ports Apt. 043\nAnnieberg, MA 87936', 'South Valentina', '2013-04-10 00:00:00', 'Provident autem illo reiciendis modi consectetur minima. Sunt non non qui laudantium et. Veritatis provident incidunt ut.', 'Premium'),
(505, 0, 'jillian05@example.com', '(670)458-2579', 'Travis', '059 Gay Rapids Suite 141\nSouth Shemarland, DC 53827', 'New Jevon', '2018-10-13 00:00:00', 'Voluptas explicabo quasi at et quibusdam omnis. Blanditiis tempore inventore dolorem voluptates dicta. Voluptas cupiditate aliquam itaque qui velit. Ut est aut omnis nobis.', 'Free'),
(506, 0, 'maximillia90@example.net', '1-713-174-0069', 'Derek', '79392 Eichmann Flat\nDenesikhaven, CA 74588', 'West Ferntown', '2017-01-05 00:00:00', 'Magnam facilis dolores eligendi quam repellat consectetur. Iure sit omnis rerum consequatur non possimus ut. Ut voluptas consequatur eligendi maxime.', 'Premium'),
(507, 0, 'vkohler@example.com', '998-429-7045', 'Anabelle', '0580 Lehner Lodge Suite 650\nMorarmouth, NH 38778', 'Port Madge', '1978-05-11 00:00:00', 'Ea saepe expedita recusandae quia nam dolor architecto nisi. Voluptate qui et eligendi eius aperiam. Minima omnis repellat iusto sed aut voluptatem iusto quidem. Beatae harum quae debitis aut recusandae.', 'Premium'),
(508, 0, 'rex98@example.com', '(487)602-4901x085', 'Alison', '24033 Paula Views Apt. 088\nWeberview, MA 31435-9599', 'Seanview', '1994-09-24 00:00:00', 'Ut quod repellat iure nisi consequuntur asperiores quia. Est nihil quod omnis asperiores assumenda accusantium. Enim neque nesciunt modi est ut atque eveniet veritatis. Earum incidunt et ut vel.', 'Free'),
(509, 0, 'milan79@example.net', '1-539-421-9442x27956', 'Arne', '125 Kirlin Lights\nChamplinville, WY 83046-1191', 'West Rahul', '2010-02-12 00:00:00', 'Labore nisi eligendi cumque aut. Debitis vel autem temporibus neque rem unde.', 'Premium'),
(510, 0, 'mills.gabe@example.com', '09501647889', 'Rudy', '233 Shields Spring Apt. 696\nNew Terrance, DC 83918', 'Rodgerfort', '1992-11-18 00:00:00', 'Quam voluptates beatae consequatur beatae. Et illum est nulla odit. Sint quo nobis rem eum esse rerum similique.', 'Silver'),
(511, 0, 'reva23@example.org', '04082191379', 'Rodger', '94807 Taryn Circles\nEast Dorcaston, MD 08104', 'West Mackenziefort', '2007-11-15 00:00:00', 'Eius aut blanditiis quia vel ut quod. Unde iusto velit eaque veritatis. Id mollitia neque modi eum necessitatibus pariatur.', 'Free'),
(512, 0, 'richard.welch@example.net', '1-866-584-9448x7722', 'Arne', '9198 Taurean Run\nFilibertostad, MT 53483-5140', 'South Jettie', '2008-04-01 00:00:00', 'Repudiandae iure ea labore eius. Quia vero fuga ut earum minus non. Suscipit velit id ex hic. Dicta facilis provident totam assumenda et.', 'Silver'),
(513, 0, 'garrett46@example.net', '608.526.7717', 'Shyanne', '656 Jacobson Terrace Suite 519\nEast Alfredo, WV 80043-8144', 'Shaynefurt', '1990-04-08 00:00:00', 'Molestias quia aut ut est fugiat. Similique magni odit soluta optio veritatis temporibus voluptate ea. Laboriosam velit et vel non laudantium.', 'Free'),
(514, 0, 'torphy.tyrel@example.com', '(712)748-0656', 'Ola', '996 Labadie Square\nNew Loramouth, RI 51257', 'East Vivienmouth', '2007-06-17 00:00:00', 'Occaecati eaque molestiae deserunt non alias possimus maxime. Laboriosam mollitia tenetur vel molestiae cupiditate quidem. Blanditiis esse quia adipisci praesentium nam sed. Quis porro nihil iure doloribus tenetur.', 'Free'),
(515, 0, 'romaguera.walker@example.com', '1-544-622-0495x8213', 'Rahsaan', '78808 Cummings Drive Apt. 595\nWestonside, IL 75822', 'East Euniceburgh', '2020-04-09 00:00:00', 'Quis sunt molestiae dolorem asperiores eligendi perferendis totam. Non facere necessitatibus asperiores nulla eveniet fugiat tenetur. Repudiandae soluta cupiditate facilis voluptatem possimus esse. Corrupti aut commodi rerum.', 'Gold'),
(516, 0, 'pauline50@example.com', '001.533.0768x380', 'Oceane', '62601 Windler Ways\nNorth Remington, DE 40348', 'Brianmouth', '1989-07-11 00:00:00', 'Perferendis neque est nostrum provident. Facilis deserunt perspiciatis quibusdam odio voluptatem distinctio dolorem modi. Eveniet cum omnis ut iusto et corrupti necessitatibus.', 'Premium'),
(517, 0, 'christa.volkman@example.com', '1-008-828-8266x96092', 'Angus', '355 Haag Shores Suite 477\nGibsonfort, GA 90534', 'McCulloughmouth', '2009-02-10 00:00:00', 'Reprehenderit porro incidunt beatae ut in dolor quia. Et molestiae et quas occaecati natus error ut. Ut non quidem quos expedita sit.', 'Free'),
(518, 0, 'destiney97@example.net', '504.489.8070', 'Filomena', '1145 Aliya Shoal\nWest Graciefort, IA 89596-1736', 'East Maximochester', '2009-11-12 00:00:00', 'Rerum officiis repudiandae animi est nisi molestias qui. Tempora in eius quasi praesentium in. Ut est eius et.', 'Silver'),
(519, 0, 'dickens.woodrow@example.org', '1-946-140-9943x24606', 'Andy', '3362 Frederique Lakes Apt. 024\nWest Jayda, IA 08127-5647', 'New Stephan', '2019-08-26 00:00:00', 'Illo voluptas deleniti earum numquam fuga. Autem qui deserunt deserunt est inventore. Et reprehenderit excepturi nam architecto aspernatur ut. Voluptates cupiditate quos odio ad et consequuntur.', 'Silver'),
(520, 0, 'aliyah97@example.com', '647.304.6124', 'Kaleb', '612 Hilbert Shoals Apt. 193\nSteveberg, NJ 43685-4597', 'East Shaniyamouth', '1990-10-11 00:00:00', 'Praesentium sit architecto nam in adipisci culpa. Perferendis sunt magni est et ea rem aut. Rerum exercitationem rerum vel ea eos qui eligendi laborum. Minima officia ipsam ipsum.', 'Silver'),
(521, 0, 'darius.kerluke@example.net', '1-676-707-3480', 'Fae', '2528 Aaron Road Apt. 998\nMeaganborough, NJ 77814-5316', 'Port Bobbybury', '1991-01-08 00:00:00', 'Quos est deserunt aut eligendi vel quaerat. Ratione quaerat alias sint perferendis est. Sed distinctio ducimus dolor. Reprehenderit molestias repudiandae quo consequatur dolorem modi.', 'Free'),
(522, 0, 'ari92@example.org', '(123)971-1905x17297', 'Eliza', '670 Towne Keys\nNew Kobeton, KS 71351', 'Isabelleborough', '2006-09-19 00:00:00', 'Et ratione dolor vel voluptatem. Dolorem atque unde et neque.', 'Silver'),
(523, 0, 'sierra35@example.net', '276.857.0991x512', 'Kiana', '91418 Elsa Pike Suite 941\nWuckertmouth, PA 94430', 'South Marisa', '1981-11-22 00:00:00', 'Velit esse perspiciatis autem aliquid eos temporibus. Veritatis quas ratione similique dignissimos veniam voluptatibus. Facilis commodi consequatur et eos. Officia aperiam iusto sint dolor repellendus explicabo.', 'Silver'),
(524, 0, 'hhomenick@example.com', '(947)544-8639x2687', 'Dominique', '39725 Rosenbaum Ranch\nWest Reese, VT 33254', 'Brionnaland', '2010-10-28 00:00:00', 'Ut et iusto voluptas quidem. Reiciendis quia atque deleniti eaque pariatur asperiores quo et. Molestias molestiae in eligendi ut sit.', 'Premium'),
(525, 0, 'sadie.larkin@example.org', '145.012.0956x7789', 'Chester', '08122 Brakus Spring Apt. 331\nEmmerichmouth, OH 31029', 'South Ibrahim', '1980-03-16 00:00:00', 'Quisquam omnis aperiam consequatur qui aliquid sit. Laboriosam et commodi itaque ut sunt.', 'Premium'),
(526, 0, 'rcremin@example.org', '(070)044-4732x393', 'Karl', '229 Jacobi Circles Apt. 834\nLake Kiannashire, VA 53639', 'Port Nonamouth', '1995-03-16 00:00:00', 'Iusto nisi eum voluptatem aut iste non quam. Eius aut quod quisquam quo distinctio similique est. In doloremque illum aliquid ea deleniti voluptatibus ab.', 'Gold'),
(527, 0, 'rolando45@example.net', '271.568.5406x351', 'Issac', '145 Fritsch Course Apt. 960\nKerlukemouth, ND 60287-1234', 'Lake Tinachester', '1998-08-18 00:00:00', 'Voluptates accusantium et aut ex veniam. Et eos laboriosam tempore deserunt earum beatae. Provident consequatur molestias quo aliquam exercitationem est qui consequatur.', 'Premium'),
(528, 0, 'lueilwitz.coleman@example.com', '(297)189-0792', 'Jed', '125 Aida Ports\nStiedemannchester, IA 99584', 'Bridieland', '1995-07-08 00:00:00', 'Sit facere architecto enim porro modi dolorem sed corrupti. Occaecati illum quaerat a ex. Ab quis atque cumque dolores omnis. Iste illo blanditiis ut sit.', 'Premium'),
(529, 0, 'swolf@example.com', '135-990-6441x502', 'Kelsie', '66311 Aliyah Ridge Suite 521\nPollichshire, FL 59045-1068', 'Port Tessburgh', '2018-12-10 00:00:00', 'Rerum quibusdam placeat deleniti architecto. Consectetur praesentium ut qui quo voluptates iste. Deserunt est dolorum quidem voluptatem occaecati earum. Aut est debitis natus itaque culpa quia enim.', 'Silver'),
(530, 0, 'mohr.micheal@example.net', '+70(4)5139317500', 'Margarett', '051 Crooks Port\nCorkerystad, WV 35099-4003', 'Port Lauretta', '2018-01-23 00:00:00', 'Qui doloribus dolor aut consequuntur esse rerum. Velit nihil sed quia.', 'Gold'),
(531, 0, 'liliana28@example.com', '183-650-2491x5893', 'Modesto', '67821 Harvey Mall\nSouth Keith, SC 60838', 'South Lavada', '2005-08-07 00:00:00', 'Aliquam assumenda aliquid occaecati sapiente ea sint deleniti. Ut qui in laudantium voluptatibus nisi. Commodi eos quia expedita. Animi amet sed eveniet omnis.', 'Gold'),
(532, 0, 'quigley.veronica@example.org', '1-006-738-4243', 'Amanda', '377 Margarett Grove\nKaratown, MT 00452-1332', 'Dorotheafurt', '2017-06-17 00:00:00', 'Qui libero occaecati vel doloremque fugit ab est hic. Ut minima pariatur ut odit eligendi est. Tempore ipsum modi et placeat aut consectetur libero. Vero nisi voluptatem veniam et nesciunt.', 'Free'),
(533, 0, 'fnitzsche@example.com', '+93(5)2097798723', 'John', '2967 Hayes Keys Suite 551\nNorth Ewellchester, SC 07593-7861', 'North Ozellaside', '1980-05-28 00:00:00', 'Magni nemo hic quia tempore. Et similique sapiente cum est praesentium iste. Dignissimos ea animi iusto voluptatem fugit quisquam tenetur.', 'Free'),
(534, 0, 'lynn16@example.com', '1-491-398-6537', 'Clark', '6691 Carlie Summit\nLake Kelly, OK 12159', 'Uriahside', '1985-01-13 00:00:00', 'Officiis ipsum eum unde voluptas laboriosam asperiores dolores. A quasi aut et neque. Est quia ut et ut.', 'Gold'),
(535, 0, 'waelchi.maeve@example.org', '07629493526', 'Delpha', '207 Jo Shore Apt. 134\nSouth Sigridfurt, LA 03150-1990', 'Paxtonhaven', '1975-05-07 00:00:00', 'Cupiditate culpa quis et optio fuga non voluptas repellendus. Dolore eaque expedita delectus cum sed aut. Nisi et voluptas voluptatem eum. Doloribus voluptatem illo praesentium cupiditate.', 'Premium'),
(536, 0, 'vkuphal@example.org', '(989)159-5406x960', 'Giovani', '5262 Clarissa Pines\nSouth Schuylerside, MA 09820', 'Port Margret', '2006-02-22 00:00:00', 'Voluptas rem repellat quisquam ut nobis aut accusamus. Sequi non quos consequatur dolorem qui perspiciatis vel. Perferendis in veniam nesciunt maxime suscipit. Occaecati quod distinctio suscipit sit assumenda quos molestiae incidunt.', 'Silver'),
(537, 0, 'jones.brandyn@example.org', '(475)802-9947x29995', 'Jackeline', '4347 Helen Ville\nSouth Krisbury, NH 21973-4961', 'North Khalid', '1979-02-26 00:00:00', 'Libero nihil rem sit atque commodi. Illum quia veritatis saepe earum laborum quos sunt. Rerum inventore unde praesentium qui.', 'Premium'),
(538, 0, 'ncartwright@example.net', '+96(5)8473355923', 'Eulah', '068 Margot Park\nNew Harry, MT 05478-4491', 'North Orvalport', '1974-05-25 00:00:00', 'Autem ut numquam animi dignissimos id ut. Quia suscipit deserunt porro. Optio necessitatibus earum nostrum doloremque.', 'Premium'),
(539, 0, 'ollie.tremblay@example.net', '(844)984-8538x848', 'Remington', '0753 Harber Forest\nKeyshawnfurt, NM 22573-2728', 'West Calistaton', '1975-06-25 00:00:00', 'Omnis vero modi exercitationem quo fuga eius. In quod illum inventore. Cumque sed ut voluptas consequuntur.', 'Free'),
(540, 0, 'ramon.abernathy@example.com', '1-538-054-9232x107', 'Alexandria', '88055 Rice Motorway Apt. 930\nO\'Reillymouth, VA 95083', 'North Eli', '2005-01-10 00:00:00', 'Dolorem omnis consequatur accusamus eaque minus quis. Tenetur unde reiciendis modi illum dignissimos aut. Quam velit quia magnam laborum veniam nostrum in. Nemo harum omnis mollitia nisi consectetur hic.', 'Free'),
(541, 0, 'hyman74@example.net', '050-276-9543x817', 'Jacinthe', '3459 Charity Mountains\nLake Lavon, AR 87666-3659', 'Rempelbury', '1989-05-22 00:00:00', 'At rem eius voluptas velit fuga. Et impedit eligendi doloribus id impedit temporibus. Iste ut similique ut id omnis debitis. Dicta nisi eum voluptatem odio aut.', 'Free'),
(542, 0, 'nvandervort@example.org', '989.974.4012x8192', 'Emmanuel', '450 Mertz Way\nPort Malvinatown, RI 41632', 'South Bernieceside', '1996-08-06 00:00:00', 'Non reiciendis ducimus voluptatem. Occaecati velit distinctio iure. Laboriosam et qui fugit id at. Fugiat recusandae impedit ipsa omnis.', 'Gold'),
(543, 0, 'xtrantow@example.org', '848-792-0921x9775', 'Gage', '765 Cathy Manor Apt. 468\nLake Euniceberg, KS 85651', 'West Aidanhaven', '1972-05-30 00:00:00', 'Numquam nemo totam est ea harum blanditiis. Fugiat dolorem officia eius accusamus. Animi ducimus non dolorem explicabo. Consequatur pariatur aspernatur quae.', 'Silver'),
(544, 0, 'egerhold@example.com', '(162)142-6768', 'Neil', '81859 Yundt Rapids\nHuelsfort, KY 55115-5281', 'South Cassiestad', '1982-04-26 00:00:00', 'Ducimus pariatur optio dolorem. Et dolor animi praesentium amet velit et veritatis. Qui ratione consequatur beatae et. Eligendi ea voluptate dolor dolor id officiis quos.', 'Free'),
(545, 0, 'parisian.celia@example.net', '(891)116-3661x574', 'Omer', '230 Ansley Gardens Apt. 094\nLake Domingo, NC 39355', 'Othatown', '1999-10-18 00:00:00', 'Porro odit ipsam accusantium voluptatum minima. Officia doloremque quos illum quis adipisci distinctio eligendi. Culpa omnis aspernatur molestiae occaecati et. Nesciunt quo maiores voluptatem minus dolor. Et cum nisi ut tempore.', 'Gold'),
(546, 0, 'lauryn.howell@example.net', '822-339-2735x20191', 'Kris', '976 Johns Orchard\nLake Benedict, LA 11897', 'Mertzbury', '1970-08-15 00:00:00', 'Minus ipsa nisi beatae consequatur. Quod magni sint ea debitis. In et iusto quia similique ut amet. Iste sit nihil consectetur et cupiditate et vero culpa. Reprehenderit officiis aut culpa debitis quasi.', 'Gold'),
(547, 0, 'astreich@example.org', '01569329464', 'Esteban', '8827 Shakira Glen Suite 230\nKaiamouth, AR 27690', 'New Magdalenabury', '1971-04-05 00:00:00', 'Error voluptas dolores expedita. Earum nostrum ut et totam ut minima et. Nihil ipsum odit aut temporibus quia maiores. Consectetur facilis quis vel.', 'Silver'),
(548, 0, 'cecil67@example.org', '620.835.1431x660', 'Darrell', '33005 Friesen Parkways Apt. 360\nPort Selena, OH 19285-6754', 'New Terrill', '1998-08-18 00:00:00', 'Facilis est consequatur a aut et tenetur nulla et. In alias quia magnam natus cupiditate inventore. Tempore non qui veritatis suscipit dignissimos a possimus. Suscipit illum est dolorem impedit quae perferendis id mollitia.', 'Gold'),
(549, 0, 'kelley86@example.org', '(949)687-7040x0726', 'Armani', '472 Zella Mountain Apt. 813\nPort Helenstad, LA 46308', 'New Clare', '1991-09-15 00:00:00', 'Ea corrupti laudantium voluptatem et delectus ex est. Similique quidem deleniti molestias. Maxime eum officiis blanditiis soluta laudantium quam fugiat.', 'Silver'),
(550, 0, 'uupton@example.net', '(587)441-7016', 'Aliza', '828 Adrien Trafficway\nWest Kiarra, KS 21921-7731', 'South Sammy', '1984-07-26 00:00:00', 'Cum natus et tempore odit architecto non ut. Nesciunt sed occaecati nobis iure laudantium nesciunt omnis. Ea sunt quia possimus eaque.', 'Gold'),
(551, 0, 'bwest@example.com', '363.566.5421x30102', 'Johan', '76424 Jerde Pine\nWest Deontaeberg, KY 68197-6710', 'Kochland', '2011-02-24 00:00:00', 'Quae repellat modi ut asperiores. Est est vel qui quo totam eligendi ut totam. Alias iure quasi id cum expedita cumque blanditiis. Rerum ut corrupti quia tempora omnis rerum.', 'Premium'),
(552, 0, 'nakia09@example.org', '1-088-118-6743x70428', 'Alexandria', '30910 Zachary River Apt. 680\nEichmannton, NC 55097', 'Yasmeenport', '1971-04-02 00:00:00', 'Quia veniam reprehenderit qui aut voluptate eos maiores. Velit totam autem nostrum aut dolorem. Beatae totam velit reprehenderit iure doloremque fugit minus reprehenderit.', 'Gold'),
(553, 0, 'deja.price@example.com', '205.798.1890', 'Rupert', '189 Alba Square\nSouth Dannie, SD 40378', 'Larkinview', '1999-01-25 00:00:00', 'Voluptas enim quibusdam eum in omnis omnis numquam. Omnis deserunt velit voluptatem.', 'Free'),
(554, 0, 'leora53@example.net', '518-329-8103', 'Rosella', '7129 Orlando Dale\nSouth Elouiseborough, AR 39193-5004', 'Rogeliochester', '2014-08-20 00:00:00', 'Alias omnis nulla perferendis fugit a eos. Assumenda quae quidem nemo repellendus iusto eveniet perspiciatis. Reiciendis quibusdam illo sapiente.', 'Free'),
(555, 0, 'delia.blick@example.org', '963-024-7414x29277', 'Martin', '76766 Keeling Courts Suite 201\nShayneport, ID 48949-1821', 'North Paololand', '2018-12-16 00:00:00', 'Ullam dolor rerum et quo. Est sit quia autem corrupti atque minus aut. A qui et in veniam sed praesentium quia. Corrupti aliquid necessitatibus sint ipsam.', 'Silver'),
(556, 0, 'huel.kristina@example.com', '(764)806-8042x3479', 'Travon', '65232 Earnest Fields Suite 199\nBlockmouth, OH 96740', 'West Susanaborough', '1993-04-19 00:00:00', 'Doloribus aspernatur possimus ut at. Soluta autem perferendis similique necessitatibus eius. Voluptatum in pariatur et at sit nemo.', 'Premium'),
(557, 0, 'nhintz@example.com', '1-364-173-5013', 'Ludwig', '95110 Franecki Inlet\nCitlallistad, OH 20939-6349', 'West Anibal', '2020-07-27 00:00:00', 'Maiores beatae aliquid natus enim reprehenderit. Odit iste ut placeat eos molestiae repudiandae asperiores sit. Optio neque provident qui non tenetur facere illo. Dolore blanditiis delectus quos libero doloremque assumenda officiis.', 'Silver'),
(558, 0, 'koepp.otilia@example.com', '(715)871-3110x113', 'Fabiola', '704 Skyla Drive Apt. 044\nWest Christopherburgh, SC 43881-2264', 'Port Jon', '1998-01-30 00:00:00', 'Deserunt quod repudiandae ad. Est molestias amet praesentium quia molestiae est. Et dolorum consequatur molestiae enim rem. Voluptatem sunt est dolore recusandae sit labore consequatur.', 'Silver'),
(559, 0, 'brandi78@example.org', '550-305-5653', 'Jacinthe', '6978 Fahey Island Apt. 264\nZachariahville, TX 41495', 'South Kalebton', '1986-10-30 00:00:00', 'Perferendis voluptatem hic perspiciatis temporibus. Tempora sit saepe voluptatem consequatur quibusdam numquam. Cumque quisquam recusandae placeat ratione. Sed est quae distinctio est nam rem voluptatibus.', 'Premium'),
(560, 0, 'qstehr@example.org', '(157)309-5218', 'Nicolette', '8408 Wehner Dam\nCollinsville, IA 89294-7320', 'Markshaven', '1970-02-22 00:00:00', 'Ex vitae nemo ut qui repudiandae odit. Explicabo sit ut perspiciatis est iste dolorum laborum rerum. Reiciendis quia dolor nihil nihil deserunt impedit occaecati. Similique aspernatur quam inventore molestiae est omnis quisquam voluptatem.', 'Free'),
(561, 0, 'lueilwitz.helga@example.org', '1-792-917-4108', 'Jon', '10798 Beer Point\nKylieshire, KS 77483', 'Pfefferview', '1991-11-15 00:00:00', 'Distinctio in molestiae minima sint adipisci. Nisi autem magnam nemo deleniti. Nobis consequatur fugit dolores omnis sit ut doloribus. Quis non aut voluptas necessitatibus assumenda aliquam sint.', 'Premium'),
(562, 0, 'ostehr@example.org', '912-797-1815', 'Dereck', '606 Rohan Port\nNorth Gilbert, TX 67277', 'Heathcoteborough', '1985-07-11 00:00:00', 'Saepe voluptatem vel aut est ut nihil quia sequi. Dolores occaecati et quia et. Quis alias ut quod aliquid quia.', 'Premium'),
(563, 0, 'kulas.nathanael@example.net', '1-159-793-6658', 'Crystel', '591 Kelvin Highway Suite 773\nHarryborough, IL 71922-6179', 'Adityaville', '1998-07-29 00:00:00', 'Nihil iste consequuntur in omnis ducimus. Dolores tenetur possimus dicta. Et qui in explicabo omnis.', 'Premium'),
(564, 0, 'elody22@example.org', '458-174-1721x47876', 'Domenic', '466 Wiegand Station\nGuymouth, RI 46047-4266', 'Rhettstad', '2000-06-25 00:00:00', 'Possimus et recusandae sed id consequatur sit soluta. Veniam ut voluptates error qui tempore dicta quaerat. Qui et praesentium et. Dolorum beatae qui et impedit.', 'Silver'),
(565, 0, 'vquigley@example.net', '(700)353-5314', 'Yoshiko', '37679 Greenholt Spurs Apt. 383\nNew Sidneyborough, FL 01899', 'Hahnmouth', '2020-02-19 00:00:00', 'Sed et iste nam repellat. Quia sit distinctio sint ut veniam. Autem rem dolorum ullam necessitatibus. Provident similique aut et commodi.', 'Silver'),
(566, 0, 'raynor.camden@example.net', '+09(0)7765794566', 'Derick', '323 Cathy Fort\nDarrinton, NM 26090-0583', 'Kingstad', '1975-07-24 00:00:00', 'Saepe qui autem adipisci nesciunt similique modi. Quia est eveniet consequatur voluptatem. Rerum nobis quo atque quod hic eos illo. Nulla recusandae est cum est.', 'Free'),
(567, 0, 'bridgette08@example.com', '(826)353-7658', 'Kole', '1996 Kautzer Terrace Suite 653\nNorth Carliefurt, MI 86757-5532', 'Reichertberg', '1990-06-22 00:00:00', 'Quasi quisquam rerum ea impedit omnis. Nobis illum molestiae odit similique pariatur inventore totam consequatur.', 'Premium'),
(568, 0, 'oeffertz@example.net', '+40(9)9274678037', 'Crystal', '708 Teresa Forks\nLake Garthbury, OR 63464-7489', 'New Iliana', '1971-05-30 00:00:00', 'Aliquid ut sint recusandae voluptate dolores. Ut qui sit voluptas quo ipsam. Eum possimus qui nesciunt.', 'Gold'),
(569, 0, 'zjacobi@example.net', '700.897.9035', 'Linwood', '7386 Cesar Shoal\nRatkeborough, AK 80230', 'Kuphalville', '1993-05-25 00:00:00', 'Quibusdam qui aliquam illo. At ut nobis eligendi veniam eveniet dicta ipsam. Numquam maxime excepturi eaque voluptate incidunt. Quae natus vitae et odio.', 'Premium'),
(570, 0, 'anthony76@example.com', '1-221-637-0241x606', 'Riley', '74895 Cristian Inlet\nMarquisshire, VT 48154', 'East Ernestinechester', '2015-11-19 00:00:00', 'Vel iusto quas ex. Rerum sit provident consequatur tempora consequatur dignissimos voluptatem. Earum sit perspiciatis accusamus et consequatur aliquid.', 'Free'),
(571, 0, 'abbie46@example.com', '(835)271-2649x7414', 'Adaline', '57019 Unique Shores Apt. 992\nSouth Fletcher, WI 40270-7456', 'Deltaville', '1981-04-05 00:00:00', 'Vero doloremque perferendis nihil nihil. Itaque natus et ab odit inventore est. Harum nihil numquam recusandae recusandae.', 'Premium'),
(572, 0, 'friesen.shania@example.com', '092-302-3496x36022', 'Gavin', '69636 Vandervort Brook\nEast Karleyton, AR 23055', 'North Alexandrine', '1981-02-13 00:00:00', 'Quam assumenda nulla aut corporis eos. Cupiditate quam quaerat autem at.', 'Premium'),
(573, 0, 'ward.weldon@example.net', '1-077-961-7496', 'Isabelle', '15950 Ofelia Vista Apt. 651\nMannburgh, NM 89233', 'Nickton', '2016-04-05 00:00:00', 'Minima sit expedita ut ipsam eos. Veritatis quos hic velit eaque. Voluptates non suscipit vitae qui. Inventore hic deserunt quia magni sit.', 'Gold'),
(574, 0, 'carmine.walter@example.net', '1-933-221-7212x243', 'Camden', '824 Leffler Branch\nLake Baby, ID 95028', 'South Kelli', '1980-06-12 00:00:00', 'Porro reprehenderit fuga nihil. Harum ut qui necessitatibus quaerat alias aliquam.', 'Free'),
(575, 0, 'xanderson@example.net', '247-651-0479x449', 'Abelardo', '00970 Valentina Hollow Apt. 489\nAlanismouth, CO 81432-0941', 'Rempelmouth', '1975-11-07 00:00:00', 'Quis non minima provident est. Harum vel beatae mollitia eos architecto voluptas aliquid. Quibusdam et pariatur nemo qui culpa consequatur. Dolores dolor dignissimos repellat porro totam.', 'Free'),
(576, 0, 'jacobi.joey@example.org', '1-211-525-9789', 'Jeremie', '31487 Sauer Islands\nNew Layla, ND 74025-5810', 'South Modestobury', '1979-08-10 00:00:00', 'A rerum non qui sit et rem. Omnis ut et culpa nisi cum recusandae. Qui et ea voluptatem reprehenderit.', 'Silver'),
(577, 0, 'christiana.steuber@example.org', '940-732-3731x9879', 'Waino', '1261 Twila Road Suite 670\nPort Cristina, HI 38648-4275', 'Cristborough', '2021-12-21 00:00:00', 'Molestias commodi vel assumenda non sed inventore aut. Dolorum officia debitis at numquam. Omnis enim vero ea ex in.', 'Gold'),
(578, 0, 'beatty.sister@example.com', '237.504.4530', 'Camryn', '764 Feil Points\nNew Shanyfurt, KY 77229-1481', 'Creminchester', '1985-12-14 00:00:00', 'Asperiores nemo magni et quam. Asperiores explicabo tempore et aut quia. Autem ea aperiam harum quia quia.', 'Gold'),
(579, 0, 'angie37@example.net', '1-525-354-6389', 'Joel', '2811 Flatley Spur\nNorth Carrieshire, WV 35061-6646', 'West Myahhaven', '1973-05-22 00:00:00', 'Laudantium deleniti corporis inventore rerum. Magni illo aut maxime maxime nihil suscipit odit. Omnis qui hic voluptatem atque quia. Doloremque praesentium quod deleniti ea voluptatum molestias tempora.', 'Premium'),
(580, 0, 'bartoletti.alanis@example.org', '(167)363-2177x57933', 'Jace', '33360 Moen Circle\nFletcherberg, IA 70861-7249', 'East Gerald', '1989-05-10 00:00:00', 'Id deserunt odio sint dolor. Provident eum quo officiis officiis. Est consequatur voluptatem quam.', 'Free'),
(581, 0, 'myrtis.schuppe@example.org', '596.538.0509x872', 'Kattie', '65683 Bergstrom Inlet\nPort Margarettshire, MD 47303', 'Flossiefurt', '1988-02-25 00:00:00', 'Repellendus culpa voluptatibus dolorum nulla similique dolorem. Deleniti consequatur placeat libero repellendus quidem aut. Non omnis vel eaque sequi. Enim sunt odit maxime qui iusto. Quo cupiditate inventore in aut ut et et repellendus.', 'Free'),
(582, 0, 'nbrown@example.net', '181.930.0450x4378', 'Austyn', '63918 Amelia Plains Apt. 853\nSouth Merlin, LA 35498', 'Mathildemouth', '1992-01-17 00:00:00', 'Dolorum eius iusto non debitis corrupti rerum inventore. Aspernatur voluptatem impedit fugiat illo officia ad id. Earum deserunt non ipsam odio doloribus quos. Id est ab perferendis placeat rerum.', 'Silver'),
(583, 0, 'ggaylord@example.org', '02991091716', 'Zelma', '409 John Row\nEladiomouth, NV 24408-2985', 'Port Kennyton', '1976-07-11 00:00:00', 'Asperiores culpa temporibus et adipisci quia corporis omnis. Velit molestias nesciunt tempore sed quo. Vero qui sed debitis molestiae. Voluptatum eveniet sed provident nemo.', 'Gold'),
(584, 0, 'ukuvalis@example.com', '(292)754-2563x969', 'Gloria', '0285 Tremblay Prairie Apt. 467\nNew Joemouth, HI 84761-6651', 'Schroedertown', '1985-09-12 00:00:00', 'Ab excepturi repellendus rerum nostrum praesentium. Incidunt est eaque numquam voluptate perferendis.', 'Free'),
(585, 0, 'vwitting@example.com', '033-751-5220x835', 'Maribel', '067 Emard Creek\nLake Jazmyne, SD 72247', 'Rettaville', '1995-12-01 00:00:00', 'Labore dolorum suscipit harum nemo. Similique mollitia distinctio perferendis praesentium natus quis harum maiores. Fugiat suscipit voluptas ut veniam facere blanditiis. Nostrum qui et aspernatur quod laboriosam cupiditate. Enim vero provident voluptates ', 'Silver'),
(586, 0, 'grant.drew@example.org', '749-085-0548x9591', 'Brant', '748 Katelyn Street Apt. 196\nJaydaview, IL 17146-2930', 'Port Khalid', '2006-05-07 00:00:00', 'Quidem eos voluptatem mollitia ut repellat eos qui error. Id qui labore eos molestias eos et et. Est id provident provident quisquam suscipit molestiae.', 'Silver'),
(587, 0, 'kailey.mills@example.org', '1-970-773-3692x24251', 'Krystina', '4807 Claire Drive\nNew Kalebchester, FL 00587', 'Port Breannestad', '1985-01-11 00:00:00', 'Accusantium distinctio sed reiciendis alias dolore eaque eveniet adipisci. Sint alias repudiandae illum. Labore exercitationem totam eaque dolore sit. Recusandae sed ut odit adipisci est ab.', 'Silver'),
(588, 0, 'eugenia.herzog@example.com', '01736187297', 'Camylle', '568 Runolfsdottir Street\nWalterberg, MA 04782-8610', 'Romagueraport', '2005-09-18 00:00:00', 'Ut id voluptatem et necessitatibus voluptatem quia. Tempore et eum qui quae mollitia iure recusandae. Veritatis aliquam voluptates distinctio hic saepe. Deleniti esse voluptatum aut consequatur ratione. Voluptatem optio est et voluptates voluptatem ullam.', 'Premium'),
(589, 0, 'zoie.osinski@example.net', '(881)329-7288', 'Grayce', '5974 Zieme Vista Suite 667\nWaelchiberg, CA 21807', 'North Tobin', '2004-02-05 00:00:00', 'Beatae voluptas et occaecati fuga consectetur. Voluptas quia dicta molestias quia et consequuntur. Cumque sint quo distinctio quod ex voluptatem assumenda. Qui eius nesciunt quidem laborum.', 'Silver'),
(590, 0, 'lebsack.madalyn@example.com', '(442)627-3870x957', 'Marcus', '167 Kuhic Camp\nHudsonstad, NH 65971', 'East Ryley', '2003-06-23 00:00:00', 'Maxime libero fugiat et illo. Doloribus unde et totam aspernatur qui. Quia id illo at eos quod.', 'Silver'),
(591, 0, 'tillman.jacques@example.net', '(649)703-3213', 'German', '872 Runolfsson Stream Apt. 514\nLake Ronaldo, MI 14636', 'Lake Benton', '2011-08-14 00:00:00', 'Voluptas corrupti provident adipisci fuga dolor excepturi magni. Repellat voluptatem quaerat delectus quibusdam rem repudiandae et aut. Ut voluptatem dolorem ratione.', 'Gold'),
(592, 0, 'etorphy@example.org', '1-085-546-9193x29598', 'Annalise', '58237 Bode Stravenue\nNorth Albertatown, PA 38092', 'Hermanshire', '1998-03-02 00:00:00', 'Qui libero id aut soluta. Vel molestiae et reiciendis saepe voluptatum et sint.', 'Gold'),
(593, 0, 'kilback.summer@example.org', '1-967-934-2098x2910', 'Noah', '55193 Ottilie Lake\nPort Marcofurt, KS 85550-9949', 'Lake Taryn', '2010-07-16 00:00:00', 'Ex voluptatum sit itaque ad. Quia est voluptatibus nobis dolores iste. Velit quod ut ad sit nihil. Repudiandae ut hic earum tempora recusandae expedita. Est voluptate laboriosam et rerum velit cumque.', 'Free'),
(594, 0, 'mfriesen@example.net', '+55(0)9778343594', 'Alexis', '22628 Goldner Prairie\nFeilmouth, MD 58591-5954', 'Altastad', '1973-08-19 00:00:00', 'Non eos blanditiis eum quo explicabo incidunt numquam. Similique et et culpa eos in. Ducimus commodi nisi sit quis voluptatem commodi modi. Consequuntur dolorem nihil distinctio velit laborum incidunt laborum.', 'Free'),
(595, 0, 'floy.kub@example.com', '590-115-4200', 'Kiarra', '9637 Olson Extensions Apt. 262\nJustinaberg, OK 10134-8407', 'Melbachester', '2013-05-01 00:00:00', 'Laudantium qui eos quis officiis qui aliquid beatae. Et modi minima quo dolorum. Et commodi et quia dicta et consequatur quos error. Pariatur sit explicabo quis id. Eum reiciendis et amet veritatis dicta.', 'Gold'),
(596, 0, 'dibbert.carolanne@example.net', '1-071-029-1908', 'Dejon', '8738 Nora Roads\nLake Eliane, MO 86308-3049', 'Lake Wilfredfort', '2002-06-22 00:00:00', 'Omnis ipsum non et reprehenderit est enim. Asperiores pariatur ut rem dolorum tempora. Dolorem autem qui quis qui dolorum. Assumenda qui consequatur et similique.', 'Gold'),
(597, 0, 'mkuhic@example.com', '1-281-694-1175x78334', 'Alexie', '432 Stefan Neck\nNorth Carsonburgh, KY 45541', 'Eloisachester', '1997-01-07 00:00:00', 'Laudantium sit mollitia repellat corporis deleniti. Et cupiditate numquam et. Beatae et hic qui enim. Et tempore commodi molestias voluptatem tempore nostrum saepe.', 'Gold'),
(598, 0, 'williamson.dovie@example.com', '412-553-5020', 'Abigayle', '3845 Hirthe Junction\nLynchborough, NH 96056', 'Maudieborough', '2020-01-20 00:00:00', 'Numquam a consequatur blanditiis maiores recusandae. Voluptatem consequatur quibusdam omnis in. Et minima omnis fuga et tempore. Animi dolorem magni quia.', 'Free'),
(599, 0, 'mina.cummerata@example.org', '(149)437-5326', 'Lilla', '3911 Logan Place Suite 296\nNorth Betsystad, IL 74200-7136', 'Sydneefurt', '1998-12-05 00:00:00', 'Itaque ea harum vel consectetur. Libero saepe placeat architecto quam maxime asperiores magni. Eos voluptatem voluptatem est. Id officia quae debitis consequatur.', 'Free'),
(600, 0, 'kylie07@example.net', '084-392-4755', 'Audie', '54465 Bauch Bypass Suite 156\nSouth Elroy, NE 18831-6034', 'New Janick', '2017-01-31 00:00:00', 'Inventore impedit minus tenetur hic consequuntur ut non. Et cum ut quibusdam odit magnam officiis. Cum et totam eos exercitationem ullam deleniti. Aliquid eaque facilis distinctio eius sed quis et.', 'Premium'),
(601, 0, 'kris.gerry@example.net', '+99(0)2230725456', 'Idell', '227 Eleanora Rapid\nPort Ava, DE 48427', 'Crystelfort', '2010-01-09 00:00:00', 'Incidunt iste vel debitis. Delectus adipisci cum sapiente voluptatem quia excepturi at. Iste magni nam voluptate non cum quasi rerum. Quaerat possimus rerum maxime.', 'Gold'),
(602, 0, 'abbott.lavon@example.com', '211-440-9975x092', 'Mavis', '65129 Jany Key\nNorth Jensen, VT 09532-9028', 'West Wellington', '2001-03-02 00:00:00', 'Illum deleniti et tenetur. Quidem architecto saepe esse voluptatem qui est. Expedita saepe dolor ut est. Ut assumenda architecto consequatur non.', 'Gold'),
(603, 0, 'alivia.greenholt@example.org', '122.793.9875x62123', 'Durward', '27325 Tillman Oval Suite 425\nHassanburgh, SD 18255-2656', 'Jorgeville', '2020-07-05 00:00:00', 'Veritatis reiciendis omnis atque deleniti non quis. Aperiam ducimus enim deserunt ad occaecati magnam. Dolorem voluptas nihil quidem repellendus culpa.', 'Premium'),
(604, 0, 'zelma.ryan@example.net', '(223)590-0869x5968', 'Hobart', '797 Joy Station Suite 897\nLake Palma, TX 00139-4584', 'Port Bertrand', '2013-03-28 00:00:00', 'Aut possimus qui esse repellat labore. Sed ut eveniet autem ea. Deleniti consectetur est voluptatibus cumque. Voluptatem eius repellendus architecto voluptas nihil modi.', 'Free'),
(605, 0, 'adeline53@example.net', '07784230103', 'Luisa', '02048 Elyssa Gateway\nPort Alfredberg, WV 79593-8170', 'Domenicachester', '2018-05-18 00:00:00', 'Assumenda repellendus fugit harum distinctio dolores corrupti vero. Quia minima aut voluptate iste odio odit. Ducimus accusantium asperiores aut nihil labore quis. Autem reprehenderit atque dolorem consequatur labore recusandae repudiandae.', 'Premium'),
(606, 0, 'omari.mraz@example.org', '07823658713', 'Baron', '878 Wilton Causeway\nAidenton, CA 99548-6868', 'Nitzscheport', '2006-11-18 00:00:00', 'Est accusantium qui in tempore necessitatibus sed. Nam ut dolores nulla nam sunt rerum corporis repellendus. Id qui qui exercitationem veritatis. Molestiae illum doloribus tempora enim sequi.', 'Silver'),
(607, 0, 'janick.powlowski@example.org', '328.328.6532', 'Axel', '88330 Thiel Pike\nJuneport, SC 63244-8724', 'Abshireshire', '2008-08-29 00:00:00', 'Molestias maiores nisi consectetur placeat cupiditate odit est. Architecto quas vitae quidem reiciendis in fugiat. Assumenda dolore aut perspiciatis saepe enim totam. Ut quia aut nihil et facere.', 'Silver'),
(608, 0, 'ofelia05@example.net', '752.403.2755x893', 'Tate', '59902 Armstrong Springs Suite 212\nNorth Crystalberg, LA 04723-2208', 'Kennaville', '1979-02-21 00:00:00', 'Ut ipsa eos error quia unde. Nostrum pariatur qui repellendus saepe impedit laborum. Nihil et sed eum nobis.', 'Gold'),
(609, 0, 'kirsten42@example.org', '922-567-4862', 'Gertrude', '51576 Gislason Parkway\nSouth Afton, NY 19261-0497', 'Emmerichside', '1970-08-02 00:00:00', 'Corrupti aut libero omnis unde aliquid. Est labore vel quidem dicta ex eveniet. Iure magni deserunt quia debitis est quo repellendus. Aut hic vitae accusantium reiciendis et ut dolorem.', 'Free'),
(610, 0, 'grayson17@example.com', '+48(0)8633616616', 'Abbey', '8658 Welch Dam\nLockmanburgh, CA 91749-6645', 'New Anibalton', '1973-04-12 00:00:00', 'Et debitis et culpa accusantium. Ipsa deleniti enim consequatur natus unde consequuntur. Quia autem et quis sint aperiam sunt quibusdam architecto. Repellat id officia assumenda vel.', 'Gold');
INSERT INTO `individual` (`id`, `status`, `email`, `phone`, `name`, `address`, `city`, `since`, `description`, `packet`) VALUES
(611, 0, 'jerry62@example.org', '1-806-570-7260x58339', 'Dino', '09909 Hazle Circles\nLake Selmer, GA 80887-2549', 'East Hazle', '1994-02-27 00:00:00', 'Ipsam pariatur est omnis rerum quo adipisci deleniti. Reprehenderit facere molestiae aperiam voluptatum praesentium maiores et. Eligendi molestias sed esse sunt quas repellat rerum. Asperiores nam qui id omnis. Autem aut possimus nulla qui ratione volupta', 'Gold'),
(612, 0, 'ross.windler@example.org', '1-863-255-6748', 'Carlie', '084 Considine Route\nLake Ernestineville, AR 26982-5894', 'Bechtelartown', '1981-12-01 00:00:00', 'Non nostrum excepturi est unde. Asperiores occaecati id cupiditate eligendi perspiciatis odit quia ut. Maxime odit id corporis doloremque corrupti. Ex voluptatem id atque illum sit.', 'Premium'),
(613, 0, 'noemy06@example.net', '+01(5)0991007275', 'Cara', '6484 Reinger Points Suite 442\nHuelsland, IA 77882-9038', 'Labadietown', '2006-07-31 00:00:00', 'Voluptatem ut veniam corrupti saepe. Dignissimos nobis mollitia nemo provident et odit. Officia voluptatibus corporis omnis quia.', 'Premium'),
(614, 0, 'aaliyah74@example.org', '1-437-211-4271x40153', 'Icie', '16230 Milford Plains Suite 847\nWest Destanyburgh, IA 85686', 'Jadenburgh', '1986-01-01 00:00:00', 'Possimus accusantium rerum iure placeat culpa veniam quasi. Enim delectus architecto voluptatem eligendi illo voluptate. Similique ab aut saepe nostrum vel.', 'Silver'),
(615, 0, 'gottlieb.cheyanne@example.com', '817-507-1666', 'Lloyd', '70971 Summer Station Suite 384\nNorth Cecilefurt, ND 80623-9544', 'Hayleyburgh', '1981-03-10 00:00:00', 'Animi quisquam nisi quod quam in provident. Id cupiditate numquam hic aliquam adipisci pariatur non. Occaecati incidunt dicta fugit in beatae repellat.', 'Free'),
(616, 0, 'fkshlerin@example.com', '898.069.5704x75813', 'Ronaldo', '52376 Elfrieda Walk\nWisozkborough, SD 66605-5405', 'Erickashire', '2003-11-11 00:00:00', 'In eaque et sit id hic at quia. Recusandae sapiente omnis voluptatem.', 'Gold'),
(617, 0, 'zieme.abdul@example.org', '455-871-3099', 'Brant', '5541 Arely Common\nEast Ladarius, NH 35539', 'Gayport', '1976-12-13 00:00:00', 'Officia architecto dolorum est eos tempora ab. Aut magni in unde neque reiciendis rerum.', 'Premium'),
(618, 0, 'haley.jerde@example.com', '897-415-8241', 'Eloy', '74127 Wava Plains Suite 018\nPort Nicolette, AL 86258-0773', 'Elenoraville', '1984-03-03 00:00:00', 'Quis qui iure omnis quisquam quasi est sapiente. Illo aut dolores dolorem adipisci atque animi. Quisquam sed consequatur rerum.', 'Premium'),
(619, 0, 'garnett35@example.com', '308-159-4229', 'Deondre', '883 Pacocha Motorway Suite 279\nStevietown, MA 31225', 'Kassulkebury', '1991-10-23 00:00:00', 'Qui ut magnam dolor sapiente. Modi reiciendis enim omnis ut velit. Et nam voluptas occaecati eum sint. Hic vero voluptatum ex quaerat.', 'Gold'),
(620, 0, 'howe.trevor@example.net', '1-193-863-2569x0700', 'Leo', '29082 Amber Expressway Suite 729\nStoltenbergchester, WY 47291-1994', 'North Keeleyshire', '2015-11-15 00:00:00', 'Tempora molestiae ex architecto molestiae. Eius ipsa expedita vel. Consectetur labore sunt rerum iste.', 'Gold'),
(621, 0, 'shuels@example.net', '1-468-029-9955x03472', 'Lina', '826 Eichmann Courts\nLake Lauriannestad, ND 09775-0378', 'West Bransonland', '1987-06-14 00:00:00', 'Accusamus earum iste corrupti vel. Doloremque accusamus quis quidem odit illo illum. Accusantium non molestiae esse rerum illum eos. Non iste asperiores dignissimos distinctio.', 'Free'),
(622, 0, 'estell.medhurst@example.org', '00990095160', 'Zander', '29180 Abagail Mews Suite 216\nNew Nina, ID 52059', 'Lake Destineefurt', '2014-12-22 00:00:00', 'Voluptate ipsum similique voluptas labore voluptatum sed. Enim quia iure dolore aut eaque aliquid. Quidem adipisci veniam ratione voluptatem aut. Saepe officia eaque dolore ex vitae est ut.', 'Gold'),
(623, 0, 'lloyd28@example.net', '09085338176', 'Reagan', '4494 Dejon Shores Apt. 280\nPeterstad, FL 90197-8276', 'South Mackenzieside', '1993-09-28 00:00:00', 'Ipsum voluptatum autem et repudiandae mollitia. Nam omnis natus consectetur eaque sit ullam adipisci. Eaque assumenda culpa voluptas ea.', 'Premium'),
(624, 0, 'ejenkins@example.com', '(834)882-9673', 'Myrtice', '792 Hessel Run Apt. 250\nTaylorberg, RI 86875-0346', 'South Ardith', '2020-07-23 00:00:00', 'Facilis dolor tempore facilis autem sunt libero. Culpa ut aspernatur minima iusto. Consequatur occaecati recusandae ut. Saepe ut vitae eligendi incidunt qui exercitationem dolorem.', 'Silver'),
(625, 0, 'skyla11@example.net', '1-580-097-2497x2435', 'Cortney', '471 Auer Mills\nMcLaughlinchester, TX 58083-6834', 'Quitzonberg', '1975-09-27 00:00:00', 'Nam consequatur voluptatem esse distinctio. Ut porro sint ut aspernatur deleniti repellendus id. Sed ut unde iste omnis modi in et. Mollitia culpa at odit eaque nulla repudiandae.', 'Free'),
(626, 0, 'd\'amore.haskell@example.net', '(969)526-2228x88988', 'Alfonzo', '1772 Lue Villages\nNew Major, IL 73329', 'South Zoie', '1981-08-27 00:00:00', 'Sapiente sequi sed aliquid eaque eaque. Et ducimus commodi autem consequatur. Quia in aperiam nobis necessitatibus sint. Aspernatur repellat et neque eaque voluptas quasi aperiam. Et dolorem iure consequatur repellat a.', 'Silver'),
(627, 0, 'uflatley@example.org', '+55(2)6310080392', 'Walter', '994 Pacocha Mews\nCamronmouth, GA 42279', 'Streichview', '1985-06-12 00:00:00', 'Cupiditate voluptas repellendus perspiciatis est asperiores excepturi ratione. Id voluptas exercitationem aut sed id sint. Fugit vel perspiciatis vel quis saepe ut. Error eum vitae et occaecati voluptas.', 'Premium'),
(628, 0, 'pierce52@example.net', '1-550-487-7947x01570', 'Stella', '5697 Gabriel Ports\nCasandraberg, TN 76821-3556', 'Heidenreichville', '1996-11-24 00:00:00', 'Voluptatum eos velit assumenda. Excepturi et ea iusto et quaerat qui. Sequi magnam minima animi id excepturi.', 'Silver'),
(629, 0, 'kaitlyn82@example.com', '1-574-165-7906x867', 'Lavina', '33392 Harmony Oval\nPort Merlinbury, HI 08063', 'North Else', '1995-08-20 00:00:00', 'Velit sequi perspiciatis corporis deserunt explicabo hic. Officiis dolore veniam eaque atque ducimus.', 'Premium'),
(630, 0, 'viviane.waelchi@example.org', '1-833-719-3925', 'Esmeralda', '266 Stanford Island Apt. 535\nFosterbury, SC 47718', 'Westport', '1988-08-23 00:00:00', 'Consequatur ut dolorem et quam ut voluptatem sapiente ea. Illum veniam cupiditate optio ipsam vitae. Enim veniam praesentium laborum cupiditate et sint. Dolor consectetur enim qui voluptates reiciendis distinctio.', 'Silver'),
(631, 0, 'fae.moore@example.net', '710-265-6919', 'Hyman', '825 Linda Plains Suite 995\nWest Kade, TX 04209-1101', 'Legrosburgh', '1975-03-03 00:00:00', 'Doloremque nemo enim et quidem enim consectetur. Eum sit qui est qui voluptatum ut blanditiis. Velit unde atque aut reprehenderit. Velit ipsam illum necessitatibus.', 'Silver'),
(632, 0, 'yschimmel@example.com', '229-087-2484x6436', 'Kayla', '23370 Torp Cape\nNorth Eduardo, IA 52258', 'New Steviebury', '1987-07-13 00:00:00', 'Doloribus rem sunt voluptas dignissimos repudiandae. Ex mollitia ut quia ab repellendus voluptatem. Necessitatibus nesciunt consectetur laboriosam magni. Quae id a distinctio labore totam pariatur necessitatibus. Tenetur cumque corrupti maiores ipsum temp', 'Premium'),
(633, 0, 'iboehm@example.com', '578-415-6748', 'Tre', '57949 Douglas River\nRossieville, DE 49285', 'Feestberg', '2007-08-12 00:00:00', 'Repellat quo sed atque et voluptates. Natus eum perspiciatis molestiae eius saepe aut magnam quo. Odit veniam explicabo molestias repudiandae harum. Labore voluptas corrupti fuga excepturi ut sed quibusdam. Similique aut et est autem nihil quia.', 'Gold'),
(634, 0, 'jovany.schiller@example.com', '(718)923-6731', 'Quentin', '425 Littel Causeway\nWisokymouth, AL 16738', 'North Boris', '1986-01-16 00:00:00', 'Fuga quia explicabo doloremque non et debitis eos. Unde quasi tenetur autem dolorem quasi omnis non. Earum blanditiis explicabo explicabo iusto.', 'Gold'),
(635, 0, 'beatty.meagan@example.com', '1-323-829-7702x6238', 'Anissa', '591 Hirthe Ways Apt. 276\nLake Helmerborough, OH 96228', 'West Roma', '2006-11-28 00:00:00', 'Eaque optio quaerat qui. Amet dicta excepturi maxime unde quos quidem nihil reprehenderit.', 'Free'),
(636, 0, 'hazle30@example.org', '003.643.6740', 'Stacy', '94830 Cole Ville Apt. 801\nRobynfort, WI 66074', 'West Adellmouth', '2016-03-26 00:00:00', 'In voluptatibus molestiae perferendis voluptatibus perferendis quo. Nesciunt fugit est officiis. Voluptatem earum qui ut eveniet magnam enim. Et placeat ut animi eveniet.', 'Premium'),
(637, 0, 'mhessel@example.org', '(864)808-2326', 'John', '44031 Mohr Trail\nWaltertown, WA 53239', 'Libbiefort', '2012-11-11 00:00:00', 'Velit autem quae sit porro deleniti et rerum. Quia beatae modi quia neque voluptas velit consequatur in. Eos et praesentium ut quisquam.', 'Silver'),
(638, 0, 'xwiegand@example.org', '00483464694', 'Alejandra', '481 Nitzsche Views Apt. 057\nSouth Isabella, KY 06731-6546', 'Grimesside', '1989-05-10 00:00:00', 'Cum velit qui sit vel hic. Id culpa et blanditiis animi. Aperiam saepe autem in enim. Quisquam laborum fuga ducimus adipisci laudantium omnis et.', 'Premium'),
(639, 0, 'lizzie99@example.com', '(497)843-3857x70866', 'Flavio', '91186 Nathanael Dale Apt. 160\nNorth Stella, CA 37001-2270', 'New Rasheedland', '1991-05-09 00:00:00', 'Rem quas eum esse atque qui dolor qui. Tempora ipsam vel magni blanditiis optio ut soluta. Assumenda hic voluptas error molestiae nam ipsum omnis adipisci.', 'Silver'),
(640, 0, 'kilback.adell@example.org', '340-931-7427', 'Katlynn', '787 Medhurst Key Apt. 079\nGleichnerborough, SD 06917-9409', 'Lake Dorothyland', '2008-02-29 00:00:00', 'Occaecati modi officia incidunt. Ut sit ipsum molestias facilis.', 'Silver'),
(641, 0, 'kenneth.luettgen@example.com', '389-940-8326x692', 'Rhoda', '792 Roslyn Fords Suite 766\nSouth Marilynehaven, AZ 21595', 'Hesselberg', '2012-01-19 00:00:00', 'Omnis vero aspernatur quas hic consequatur. Tenetur aut debitis aut dolor eaque. Et sed non tempora quisquam. Adipisci voluptas qui nobis sit dignissimos.', 'Free'),
(642, 0, 'sreynolds@example.com', '(960)269-6052', 'Renee', '654 Stiedemann Canyon Suite 697\nEast Oramouth, TN 91837', 'Hartmannmouth', '1995-10-20 00:00:00', 'Incidunt sequi molestiae aspernatur occaecati asperiores animi optio qui. Vel est ducimus cumque qui. Iure atque totam numquam molestiae doloremque nobis laborum.', 'Silver'),
(643, 0, 'madyson.jenkins@example.net', '+85(5)2929134675', 'Hosea', '136 Roberts Crescent\nHansenshire, WA 16073-9797', 'Kyliemouth', '2009-09-30 00:00:00', 'Ipsam voluptatem sunt est. Incidunt inventore ratione consequatur magni sunt et nostrum. Exercitationem accusamus amet voluptatem facilis quasi.', 'Silver'),
(644, 0, 'zmayert@example.net', '932.328.1071x355', 'Rossie', '744 Fadel Rapid Apt. 383\nClintonmouth, FL 92325-1551', 'New Lizeth', '1975-12-06 00:00:00', 'Et impedit similique rerum reprehenderit eum. Aut amet aut nobis nesciunt qui aliquam omnis. Eius quia sequi ab optio est.', 'Silver'),
(645, 0, 'kiehn.jayce@example.com', '03514759456', 'Jerrold', '8426 Cummerata Mall Suite 879\nCandidaview, CO 34777-8733', 'Norriston', '1997-07-18 00:00:00', 'Sit dolores non magnam dolores eligendi earum odit. Deserunt earum laudantium distinctio est incidunt ad repellat. Non non ut nobis adipisci et. Neque placeat facilis voluptatum voluptatum adipisci laudantium molestias est. Eos molestiae et iusto illo.', 'Gold'),
(646, 0, 'dmcglynn@example.net', '999-742-0491x52065', 'Jesse', '2415 Yadira Way\nSouth Laviniamouth, AR 27394', 'East Wymanville', '1991-01-03 00:00:00', 'Nesciunt ut dolore quibusdam atque qui qui. A nihil ut ut aspernatur minima expedita adipisci. Reiciendis fuga mollitia et et sint voluptatibus. Amet unde culpa nam aut et quod.', 'Free'),
(647, 0, 'bud.harber@example.net', '1-717-813-7646', 'Demarco', '74679 Clovis Throughway\nHermannberg, SC 72376', 'New Giovaniside', '2006-10-25 00:00:00', 'Quod fuga qui et et a corrupti ad. Ea quam ut sequi expedita nihil. Saepe ea in culpa suscipit molestiae modi. Qui non a recusandae quo. A enim itaque nulla officiis eos aliquid molestias.', 'Gold'),
(648, 0, 'quinn.brakus@example.com', '1-768-827-8176x1967', 'Baby', '88039 Devyn River\nEast Alfreda, MN 64121', 'New Leilaland', '1971-11-30 00:00:00', 'Voluptatum eos eum et facere eos omnis rerum numquam. Nam voluptatibus dolores illum et veniam et exercitationem. Natus animi molestias sed est qui aut.', 'Free'),
(649, 0, 'obayer@example.org', '(668)824-3019', 'Freeda', '87738 Manley Wells Apt. 656\nAbrahamhaven, WA 64616', 'North Era', '2016-02-22 00:00:00', 'In libero recusandae dignissimos laborum. Velit veritatis quam fugit velit est. Modi libero deleniti soluta earum. Laborum quibusdam omnis incidunt sed rem non id.', 'Silver'),
(650, 0, 'hartmann.richard@example.net', '07098993680', 'Jorge', '6685 Vandervort Crest Apt. 304\nNormaville, MO 86594-1373', 'North Paris', '1970-10-15 00:00:00', 'Ipsa reiciendis aperiam cum voluptates perspiciatis ut quis. Ipsam quis ratione vitae soluta voluptatem qui. Dignissimos dolorum aut maiores. Et aspernatur autem ut accusamus praesentium. Id dolor odio reiciendis quo voluptatibus veniam.', 'Gold'),
(651, 0, 'shanie54@example.org', '033-850-3399x0927', 'Margret', '8998 Roberts Flat\nStantonside, UT 39374-4322', 'Kuhicview', '2013-07-09 00:00:00', 'Vel aut harum aspernatur magnam est excepturi. Velit mollitia voluptates voluptates voluptatem accusantium. Beatae dicta possimus sed ullam.', 'Silver'),
(652, 0, 'strosin.kaia@example.net', '(178)990-8722x96032', 'Wyman', '260 Senger Parkways Apt. 893\nBeattyside, FL 73309', 'Wilhelminemouth', '2013-02-02 00:00:00', 'Minima repellat aut sunt ipsam autem id. Molestias occaecati qui omnis voluptatem. Corrupti corporis labore laudantium. Quidem alias quo ut nihil in.', 'Gold'),
(653, 0, 'kiel.grady@example.com', '360-427-1538', 'Camille', '16043 Gerlach Summit Apt. 129\nNorth Reid, NC 83566-2841', 'Beierfurt', '1970-04-19 00:00:00', 'Et placeat libero voluptatibus vel quaerat delectus earum. Facilis voluptatem reprehenderit temporibus est. Sint qui explicabo cupiditate voluptatem consequuntur et molestiae.', 'Premium'),
(654, 0, 'reichel.lamont@example.net', '(421)114-7351x90966', 'Vicente', '77848 O\'Kon Crescent\nEast Marina, MD 75247-8423', 'North Chester', '1973-11-23 00:00:00', 'Dignissimos est illo quo sequi labore ut possimus. Fuga odio et eveniet quia corrupti. Ut iusto quod voluptates ex. Voluptatem debitis minus expedita facilis autem nisi.', 'Silver'),
(655, 0, 'zprohaska@example.com', '776-170-8100x880', 'Stevie', '5738 DuBuque Points Apt. 978\nEast Elvisfort, CT 22048', 'Creminberg', '2021-08-27 00:00:00', 'Esse et libero magnam aspernatur. Nulla ratione eum similique et. Aut eum accusamus quia quia et modi. Eius molestiae error temporibus corrupti.', 'Silver'),
(656, 0, 'kiehn.tiffany@example.org', '(932)516-3774', 'Kelvin', '96888 Mayert Keys Suite 017\nBoganfurt, OK 53005-9607', 'West Toby', '2004-11-20 00:00:00', 'Aut dolor esse consequatur enim sapiente. Sequi delectus molestiae voluptatem optio ipsa odio. Eos ut ut cum unde architecto neque.', 'Premium'),
(657, 0, 'kaylin53@example.net', '1-742-022-6495', 'Theron', '39347 Maggio Trafficway\nEast Francisco, MD 61064-7649', 'Lake Jerryfurt', '2006-07-04 00:00:00', 'Ipsam aut quis at officiis omnis. Fugit architecto quo et aut et doloribus fugit optio. Id sed possimus fuga sapiente inventore laborum aperiam.', 'Gold'),
(658, 0, 'tokuneva@example.com', '357-721-7785x04501', 'Deontae', '99530 Ettie Terrace\nPort Braxton, TN 59679', 'Port Careyhaven', '1975-12-14 00:00:00', 'Temporibus et consequatur velit in odit est quaerat. Quo adipisci a aliquam saepe ipsam. Doloremque non error ipsam et. Quis commodi itaque ut saepe consequatur neque numquam.', 'Free'),
(659, 0, 'dwillms@example.net', '+61(8)2245050068', 'Kristoffer', '25873 Kozey Forks\nPort Alva, TX 23178-0850', 'East Saraiburgh', '1973-03-17 00:00:00', 'Quia quia et blanditiis. Dolorem sit quod sequi dignissimos distinctio consequatur. Autem rerum alias aperiam.', 'Silver'),
(660, 0, 'lbrakus@example.com', '024.356.0403x4670', 'Kip', '93011 Hermiston Isle Apt. 423\nNew Dorthy, ID 92544', 'Sibylview', '1973-11-11 00:00:00', 'Quas dolore error sed voluptate quia repudiandae rerum. Explicabo rerum minima dolorum soluta aut. Et ut eos totam quidem doloremque autem amet.', 'Silver'),
(661, 0, 'vaughn04@example.net', '955.854.1334', 'Arturo', '195 Koepp Key\nEast Mateoland, AR 45885', 'South Kielside', '1993-08-29 00:00:00', 'Error ea molestiae dicta et ea. Sed reiciendis eos qui in accusamus vero. Libero provident aspernatur iusto voluptates ex. Non ipsa quis dolorum incidunt sint.', 'Premium'),
(662, 0, 'feest.lauriane@example.org', '559.060.3805x51502', 'Elenora', '98152 Trevor Street Suite 842\nJonesside, ME 82618-1716', 'East Sydniberg', '1990-07-21 00:00:00', 'Corporis fugiat blanditiis sint illo. Officia ut fuga quo voluptatem placeat. Sequi magni reprehenderit debitis sequi corrupti.', 'Silver'),
(663, 0, 'alvina58@example.org', '328-014-0256x229', 'Trudie', '7893 Little Estates Apt. 503\nNew Cristobalstad, WY 03326', 'Lake Kari', '2010-04-01 00:00:00', 'Velit voluptate dolorem esse et at numquam quo. Est excepturi voluptatem sint alias. Non enim nulla quia sequi iusto quis.', 'Premium'),
(664, 0, 'malika.block@example.net', '04208307365', 'Claudia', '3245 Olson Skyway\nWest Leda, MO 05997-2065', 'Lavinialand', '1988-04-02 00:00:00', 'Voluptates praesentium est id iste illo quo. Nihil aut quibusdam quia eaque expedita. Assumenda dignissimos velit natus.', 'Free'),
(665, 0, 'brook.wintheiser@example.org', '243-199-1424', 'Retta', '827 Markus Grove\nLake Giuseppe, NH 56801', 'Gavinport', '1970-10-25 00:00:00', 'Quo quis esse dolorum eos et nobis quod. Est aspernatur aut excepturi et incidunt quia deserunt. Nobis ab voluptatem nemo nemo tenetur. Quo ab vero eligendi.', 'Free'),
(666, 0, 'boyer.skye@example.net', '(978)614-0882x242', 'Ayla', '6192 Parker Path Suite 280\nWardberg, AR 57371', 'Lake Tatyanamouth', '2009-07-22 00:00:00', 'Deleniti quisquam vel maxime vel. Sunt veniam quo molestias autem. Sit dolores perspiciatis ut aut dolores.', 'Gold'),
(667, 0, 'marcelo.nolan@example.org', '417.950.4072x470', 'Emelia', '522 Myron Shore Apt. 223\nWest Elvafurt, OR 88747-4184', 'Marianport', '1991-11-20 00:00:00', 'Deleniti deleniti natus tempora illo dicta. Accusantium dolore porro quod qui. Dolore reiciendis sapiente omnis modi aut laborum fugiat. Dolore ab reprehenderit natus in qui.', 'Silver'),
(668, 0, 'piper10@example.com', '(609)497-8184x67055', 'Guadalupe', '65202 Jovanny Bridge\nPort Dewayne, NC 94541', 'Chaunceychester', '2007-12-01 00:00:00', 'Cum quasi aut excepturi illum tempora ad reiciendis. Laborum ut earum eveniet adipisci eos voluptatem. Dicta maiores mollitia eveniet quam qui. Aut ea quia optio rerum.', 'Silver'),
(669, 0, 'sigrid80@example.com', '1-111-252-3843x344', 'Mario', '27307 Drew Green Apt. 349\nIsaiasbury, TN 62440', 'Gloverview', '1985-01-17 00:00:00', 'Reiciendis ea aliquam ipsum quia perspiciatis. Et officiis dicta atque aliquid itaque. Quaerat maiores nisi ut autem. Sit consequatur perferendis enim voluptate iste.', 'Free'),
(670, 0, 'asia.langworth@example.org', '(388)258-3929', 'Pattie', '60953 Larkin Expressway\nMetzstad, GA 08192-7031', 'South Madisynville', '2014-03-22 00:00:00', 'Nam fuga quasi eius ullam. Ut reprehenderit eos dignissimos ab. Cumque voluptatem minima autem ex ducimus dolores. Ullam iure nesciunt maxime voluptatem.', 'Gold'),
(671, 0, 'hegmann.khalil@example.com', '+14(9)8622824294', 'Josie', '3877 Alexys Crossing Apt. 247\nSouth Florida, MD 75872-5612', 'Ardenfurt', '1983-04-09 00:00:00', 'Ab officiis est aut amet sed eos iste. Molestiae sequi impedit incidunt dolor. Ipsa ut voluptas voluptate delectus tempora debitis dolorem. Tenetur aspernatur enim ab.', 'Silver'),
(672, 0, 'cruickshank.ernestine@example.org', '007-286-3716', 'Libby', '36953 Martina Manors Apt. 433\nNorth Zechariahport, NJ 94708', 'South Alicebury', '2006-05-22 00:00:00', 'Esse in libero dignissimos ipsa commodi. Voluptatibus dolorum pariatur unde assumenda placeat quia. Voluptas quam voluptatem consectetur similique in corporis sunt quod.', 'Silver'),
(673, 0, 'upton.harvey@example.com', '843.987.0341x0068', 'Precious', '46893 Marcus Spring\nNew Juliannebury, NE 25471-9975', 'Port Gladysstad', '2003-03-30 00:00:00', 'Aspernatur perferendis non suscipit omnis temporibus odio unde. Optio quam totam laboriosam eligendi qui. Corrupti quibusdam ipsam ratione est velit voluptas temporibus amet. Molestiae et quo voluptatem error in.', 'Premium'),
(674, 0, 'myrl47@example.org', '593-601-6096x776', 'Megane', '928 Gleichner Park Suite 365\nHayleyfurt, MO 13787-2002', 'Michealburgh', '1975-03-26 00:00:00', 'Quidem magni velit nulla autem molestiae pariatur nemo voluptatem. Recusandae ipsa eos sit vel sed. Aliquam facilis officiis omnis pariatur vel vel.', 'Gold'),
(675, 0, 'kovacek.gretchen@example.com', '084-937-7736x794', 'Adelle', '21416 Felix Expressway Apt. 163\nSouth Americo, IN 06729', 'Clintonfort', '1991-03-13 00:00:00', 'Beatae placeat aut aut aut dolorum. Magnam consequatur sed quis aut animi odit minima. Dolores aut doloremque non fuga molestias repellat quas unde.', 'Free'),
(676, 0, 'lula85@example.com', '(922)016-2329', 'Lonny', '381 DuBuque Center Suite 363\nEast Yeseniaview, AL 25274-1180', 'South Burdette', '1987-12-13 00:00:00', 'Iste possimus in libero officia quia sed doloribus. Corporis ea autem voluptatem laborum reprehenderit porro. Veritatis facilis magni modi rerum quia facere nostrum. Debitis qui est rerum quis sed sunt. Hic architecto perferendis soluta velit nostrum tene', 'Free'),
(677, 0, 'mraz.samanta@example.com', '603.459.9885x9906', 'Jana', '1076 Lang Mills Suite 925\nNaomieshire, WV 41598', 'Roobhaven', '1994-02-25 00:00:00', 'Non enim excepturi cum. Est ex incidunt facere repellendus harum eum qui. Deleniti et tempore consequatur est in.', 'Silver'),
(678, 0, 'layla23@example.net', '447.040.6768x6419', 'Heather', '403 Michael Lodge Apt. 547\nSouth Brandynchester, NJ 91178', 'Hirthehaven', '1991-02-20 00:00:00', 'Nostrum laudantium voluptas ut est. Occaecati vitae dolorem amet itaque et. Quisquam repellat itaque voluptatibus consequatur reiciendis. Est quae doloribus amet porro repellat numquam alias.', 'Silver'),
(679, 0, 'tklocko@example.net', '540.032.5351x1186', 'Alvena', '53472 Roberts Shore Suite 561\nBeiershire, KY 43468-8999', 'Rosiefort', '1977-02-10 00:00:00', 'Fugit quidem illo aspernatur corrupti sed explicabo non nihil. Dolor sit ullam enim ex sit. Nostrum alias provident explicabo magnam officia dolorem saepe. Nulla velit occaecati nulla omnis repellat blanditiis debitis. Vel maiores voluptas molestias natus', 'Free'),
(680, 0, 'qwitting@example.com', '07321942385', 'Era', '442 Faye Brook\nWest Margie, MN 14607-2473', 'East Madonna', '2005-03-07 00:00:00', 'Aut harum hic vel atque ut aut quasi. Non quaerat assumenda est illo. Dolores voluptatibus expedita quidem ut debitis velit dolore. Explicabo dolorem fugit doloribus quam.', 'Gold'),
(681, 0, 'uokuneva@example.org', '(981)612-5752x87062', 'Tania', '661 Johnathan Spring\nLake Valentinland, PA 94654-5770', 'Lake Flavio', '1973-10-06 00:00:00', 'Natus error officia vero neque rerum tempore. Rerum impedit praesentium recusandae qui aliquam facilis. Earum sit iusto voluptatum.', 'Premium'),
(682, 0, 'jast.jon@example.net', '254-970-2761x2077', 'Ottilie', '727 Williamson Island\nWittingville, WI 39911-9263', 'Collinschester', '1978-10-05 00:00:00', 'Nulla eius iste eveniet ex quod eum. Id non debitis praesentium suscipit amet error in beatae. Porro et aperiam quisquam animi.', 'Premium'),
(683, 0, 'lwolf@example.net', '607.267.9646x1836', 'Rosario', '75154 Cronin Pike\nJacobston, NE 81813', 'Port Dudleyville', '1998-10-25 00:00:00', 'Qui quasi dolorem delectus sint officiis ut. Accusamus impedit quos harum quia et. Corporis ut quos dolores fugit nostrum eaque adipisci. Mollitia quis ut odio soluta culpa.', 'Premium'),
(684, 0, 'auer.lilla@example.com', '758.882.9092', 'Braulio', '8416 Lueilwitz Motorway Suite 102\nDonnahaven, IA 14292', 'Rautown', '1983-12-28 00:00:00', 'Optio veritatis et ratione commodi id molestiae vel. Rerum modi adipisci et. Ipsam iure debitis consequatur magni vitae soluta maxime. Rerum veniam laboriosam aliquid minima iure blanditiis.', 'Free'),
(685, 0, 'nicole.thompson@example.com', '1-973-116-6571x47138', 'Bernie', '5385 Borer Rapid Suite 671\nEulastad, SC 82031', 'Port Joanamouth', '1985-10-18 00:00:00', 'In consectetur quisquam debitis voluptate sit debitis necessitatibus. Quam veniam rerum commodi adipisci ut consectetur. Sed quibusdam quia eos officiis enim rem. Rerum quis et amet repellat alias voluptatibus numquam blanditiis. Qui excepturi facilis vol', 'Premium'),
(686, 0, 'llegros@example.com', '153.739.3881x17164', 'Brent', '4782 Mariano Unions\nLake Easter, NE 94966', 'West Winifredville', '1982-04-03 00:00:00', 'Fuga ad aliquam quod omnis necessitatibus eius. Magni voluptatibus quo libero est qui. Doloribus deleniti qui porro facere est rerum voluptas odit. Voluptatem autem cupiditate quis deserunt.', 'Premium'),
(687, 0, 'cecil84@example.com', '092.908.6687x034', 'Lera', '35742 Gibson Street\nFedericoborough, MN 58506', 'West Myronshire', '1991-12-27 00:00:00', 'Iusto sint dolor doloremque eveniet. Ab pariatur numquam sit accusamus corporis. Magni eius exercitationem odio. Veniam assumenda qui quidem accusamus.', 'Free'),
(688, 0, 'bveum@example.com', '(808)682-4425x533', 'Micheal', '839 Romaguera Fall Suite 911\nNew Jeffry, NV 41605', 'Adachester', '2021-04-10 00:00:00', 'Minima dolorum incidunt quis minus. Beatae saepe quas labore excepturi ut qui dolorem. Est dolor earum voluptate enim est libero rerum ullam.', 'Premium'),
(689, 0, 'stanton.toney@example.net', '058-012-9419x129', 'Janet', '3872 Germaine Branch\nSebastiantown, NV 76961-6967', 'South Ashlynn', '1984-08-31 00:00:00', 'Molestias dignissimos vero voluptate vitae nostrum molestias atque laudantium. Est quia qui rerum at quaerat vel voluptas. Non est rerum non eius. Molestias dignissimos et molestiae laudantium quis incidunt quam.', 'Silver'),
(690, 0, 'farrell.kennedy@example.net', '(811)751-9818x010', 'Tressie', '89193 Dare Curve Apt. 677\nMillerborough, VA 67454-4196', 'Torphymouth', '1975-08-22 00:00:00', 'Pariatur fugiat optio aperiam tempore ut excepturi sequi. Corporis minima sed necessitatibus repellat et tempora. Rem molestiae est sequi iusto et iste modi. Reiciendis eius voluptate illo et.', 'Silver'),
(691, 0, 'ttreutel@example.org', '(125)384-4018x6798', 'Dudley', '12466 Ursula Ways\nPort Hugh, MS 01261-5116', 'Quintenshire', '1979-09-21 00:00:00', 'Quo sit voluptatum quos incidunt. Ut corrupti consequatur dolores et dolor.', 'Free'),
(692, 0, 'hector.gutkowski@example.org', '673-957-9603x74214', 'Alexandria', '1056 Shyann Vista\nEast Virgilburgh, OH 18257-4471', 'Halvorsonhaven', '1978-09-03 00:00:00', 'Doloremque nemo aut quis voluptatum et. Provident commodi occaecati est beatae explicabo fuga ut numquam. Eum quo dolor nihil.', 'Silver'),
(693, 0, 'jennings22@example.net', '281.572.6985x24410', 'Kaleigh', '612 Roberts Extensions Suite 552\nNicolaston, UT 45004', 'East Betty', '2014-10-19 00:00:00', 'Soluta officiis voluptate omnis aliquid officia voluptas accusamus. Rem ea aliquid ut facilis dolores omnis dolor. Autem amet expedita vero. Est ea eos fuga corrupti veritatis. Eos maxime nihil deleniti ut eveniet.', 'Gold'),
(694, 0, 'hardy69@example.com', '1-956-887-7788', 'Godfrey', '151 Lane Trail\nPort Nina, KS 27133', 'North Caterinaburgh', '2020-01-12 00:00:00', 'Rerum et eveniet voluptate veniam. Aut esse cumque quos voluptatem quia.', 'Gold'),
(695, 0, 'joe98@example.com', '012-312-6347x935', 'Edythe', '1140 Herman Unions Apt. 599\nSmithammouth, CA 44986', 'Sofiatown', '1980-04-30 00:00:00', 'Dolores in ut amet nam omnis voluptatibus nobis. Sit labore nostrum et hic qui sapiente est. Cupiditate officia odit qui in. Fuga laboriosam sit aut amet dolor.', 'Free'),
(696, 0, 'kennith.doyle@example.com', '1-083-310-1148x71135', 'Chaz', '35717 Kuphal Manor\nBauchland, HI 92683-5557', 'Treuteltown', '2000-08-23 00:00:00', 'Assumenda architecto reiciendis aut sit aut. Quia cupiditate ipsam recusandae quos non. Consequatur eos vitae nobis et laboriosam enim incidunt maiores. Iure officiis qui aut eius est dolorem.', 'Premium'),
(697, 0, 'ppacocha@example.com', '058.561.2712x850', 'Emmalee', '702 Napoleon Villages\nNorth Gregburgh, NC 92574-5340', 'Cummerataside', '1999-01-24 00:00:00', 'Assumenda facere vitae voluptatem nostrum molestiae enim. Dicta qui et eos consequatur explicabo. Ad id libero sunt iure. Dicta velit modi enim. Dolore aut in in sit eum quam aperiam nemo.', 'Gold'),
(698, 0, 'trudie.cronin@example.com', '07534582649', 'Gayle', '8057 Boyer Wall\nIdellaburgh, KS 97085-7105', 'New Jeffry', '2012-04-19 00:00:00', 'Nemo qui aperiam dolor quia eum. Fuga deleniti est itaque sed dolorem exercitationem incidunt. Consequatur et tempore et veritatis dolorum qui eaque quod.', 'Gold'),
(699, 0, 'nsimonis@example.org', '886-630-9770x9586', 'Moises', '452 Roob Streets Apt. 961\nMilanborough, IL 72452-3741', 'Kulasland', '1972-06-05 00:00:00', 'Temporibus iusto et nihil sit. Aliquam consequuntur voluptas dolorum qui est doloribus. Quisquam dolor occaecati voluptas in velit. Minima eaque accusamus velit eos reprehenderit totam quis.', 'Silver'),
(700, 0, 'vonrueden.stephen@example.org', '1-848-146-1018x417', 'Cleora', '9285 Kutch Hollow Apt. 320\nImeldaborough, MT 95655-4091', 'East Hoytshire', '1975-10-03 00:00:00', 'Itaque hic dignissimos molestiae magni. Qui eius ullam voluptatibus in at consectetur aut. Necessitatibus voluptas ullam voluptatem iusto.', 'Free'),
(701, 0, 'logan60@example.com', '473.958.7149', 'Carol', '109 Demetris Hills Suite 995\nPinkieborough, UT 25647', 'South Elvisburgh', '1973-04-08 00:00:00', 'Sed minima maxime vel fuga. Dolores ipsum ut consequatur magnam voluptatem et. Quas libero similique recusandae ut.', 'Gold'),
(702, 0, 'elda71@example.org', '766.348.5413x10080', 'Ayden', '76474 Mireya Mountains\nAltabury, MT 27641', 'Cletaside', '2017-05-16 00:00:00', 'Eligendi nostrum iusto veritatis voluptatem quasi numquam ex. Nihil fuga facere qui earum et non animi. Numquam officia a quia iste. Ea aspernatur nihil ea animi et.', 'Silver'),
(703, 0, 'dmurray@example.com', '1-382-173-7751x25516', 'Jennyfer', '60475 Hyatt Neck Suite 072\nWest Tiabury, ND 29247-3997', 'Port Joanamouth', '1983-01-01 00:00:00', 'Dicta qui aut dolorem natus. Accusantium perspiciatis eveniet cumque ut natus inventore laudantium. Consequatur doloremque voluptatem voluptas tenetur beatae qui consequatur. Qui magni sed enim.', 'Silver'),
(704, 0, 'macejkovic.jonatan@example.net', '1-814-599-1494x91018', 'Julius', '20912 Torphy Island\nLockmanmouth, CT 49478-2947', 'Port Kim', '1982-05-24 00:00:00', 'Voluptate nisi debitis modi nulla facilis maxime minima. Saepe id vero aut error. Ipsum error deleniti voluptatem cum tempora optio maiores sapiente.', 'Silver'),
(705, 0, 'estell55@example.net', '284-839-4819', 'Aron', '4924 Beatrice Inlet Apt. 707\nKossmouth, CA 51735', 'West America', '2009-01-03 00:00:00', 'Repellat et accusantium tempora. Ut quia laudantium molestiae eaque ipsam tempora. Similique dolor iusto et nam. Consequatur hic quisquam possimus qui corrupti.', 'Silver'),
(706, 0, 'emile32@example.org', '+52(8)6452387206', 'Annabelle', '89782 Estella Junctions Suite 568\nFedericohaven, KS 28449', 'Feeneyport', '2011-10-01 00:00:00', 'Sapiente blanditiis consequatur consequuntur aut omnis. Ipsa rerum at qui iure illo. Doloribus velit illo magnam nam maiores libero exercitationem doloribus. Similique libero voluptates suscipit doloremque tenetur. Et est ea consequatur itaque minus nam.', 'Free'),
(707, 0, 'alysa66@example.com', '633-442-9946x8169', 'Ansel', '6007 O\'Keefe Lock\nMargarettaberg, OK 50207', 'New Mathilde', '1977-11-30 00:00:00', 'Quas nesciunt ipsa sed fuga sed tempore. Quis et necessitatibus hic laboriosam ea. Aliquam id placeat temporibus quidem. Nulla aut et delectus quod quis rerum quam.', 'Premium'),
(708, 0, 'vinnie.schmeler@example.org', '544-834-1542x07724', 'Lavinia', '319 Cleora Glen\nNew Peytonberg, NJ 82588-0042', 'East Kennedy', '2010-03-07 00:00:00', 'Magni doloremque aperiam qui odio reiciendis illum voluptatem. Magnam dolorem quia corrupti veniam eligendi dolores. Ipsam laboriosam eius eligendi qui qui iste doloribus.', 'Premium'),
(709, 0, 'lamar48@example.net', '(893)870-6663x89411', 'Lonny', '938 Crona Meadows Apt. 524\nStammbury, HI 79223-2554', 'Mooremouth', '2020-06-05 00:00:00', 'Sapiente autem eveniet porro ipsum sed et. Magni vero qui vel quis labore quia accusantium. Optio eos ducimus consequuntur neque et veniam. Et repellendus totam magnam repudiandae tempore ducimus.', 'Gold'),
(710, 0, 'shany.ullrich@example.org', '231-824-8803', 'Nicole', '9487 Haylee Junction\nNorth Annette, OK 22983', 'East Trevor', '1973-08-16 00:00:00', 'Consequuntur exercitationem dolores laudantium nisi qui et. Et dolor ipsum qui voluptatem reprehenderit in. Fugit explicabo temporibus tempore dolor veniam.', 'Free'),
(711, 0, 'kaitlin.rau@example.com', '(013)843-2291x54188', 'Lance', '34471 Hirthe Path\nEast Alfonsobury, UT 83247', 'Theodoraborough', '1998-07-27 00:00:00', 'Repellendus aut debitis ullam ab dolorem magni et. Repudiandae id dicta non eligendi nesciunt. Optio optio voluptatem sapiente rerum ipsam.', 'Silver'),
(712, 0, 'vgutkowski@example.org', '(550)346-1604', 'Earline', '93088 Paucek Prairie Suite 377\nNorth Mittiehaven, CO 08748-7684', 'West Deangelo', '2019-03-08 00:00:00', 'Odit illum optio et et minima. Quae dolor et aut officiis consequatur corrupti. Voluptatem enim ab sed corporis saepe minima ut dolor.', 'Premium'),
(713, 0, 'gilberto.kunze@example.org', '222.404.4489x928', 'Raegan', '781 Trever Route\nFeilview, MN 40577-5162', 'Gerryland', '1971-09-07 00:00:00', 'Occaecati ipsum necessitatibus eos consequuntur et autem. Omnis facere assumenda occaecati dolores maxime omnis qui est. At tempora molestiae ex nisi et illum et. Qui eum omnis dolorum et sint consequuntur nemo ullam.', 'Free'),
(714, 0, 'reichert.phyllis@example.com', '278.594.3500x6299', 'Anais', '18514 Weissnat Burgs\nNorth Timmothybury, KS 84988', 'Zboncakburgh', '2007-06-20 00:00:00', 'Ut consequatur ut laudantium assumenda. Fugit quia praesentium tenetur aperiam et assumenda aspernatur cumque. Dolor aut ab molestias.', 'Gold'),
(715, 0, 'kameron32@example.com', '1-859-310-2540x4482', 'Mikayla', '444 Trace Lights Apt. 728\nLake Deondre, AR 55024', 'Rosietown', '1989-07-10 00:00:00', 'Esse blanditiis delectus est ut. Sapiente repellat cumque fugit doloremque qui sapiente. Nulla consectetur voluptatem aliquam cumque sunt ut dolorem.', 'Silver'),
(716, 0, 'hartmann.karlie@example.org', '713.220.2876', 'Cara', '831 McCullough Walk\nCassinview, CA 40075', 'South Nicholasfort', '1974-11-01 00:00:00', 'Commodi sit sit ut eos excepturi. Quibusdam odio impedit et sit suscipit molestias et. Ab velit mollitia qui dolor.', 'Premium'),
(717, 0, 'schumm.cameron@example.net', '549.894.4975x0400', 'Ken', '69991 Lela Cliff Apt. 291\nPredovicbury, CT 35637-8744', 'Aramouth', '2006-08-06 00:00:00', 'Quaerat omnis et architecto atque sed. Aut dolorum cum nesciunt quam. Sunt rerum explicabo et debitis molestias. Et perferendis ducimus suscipit veniam asperiores.', 'Free'),
(718, 0, 'harry75@example.net', '276.532.0601', 'Elliott', '6545 Douglas Forges\nYosttown, DE 05208-1576', 'Port Jalynburgh', '1991-09-17 00:00:00', 'Placeat nisi autem omnis numquam. Eligendi voluptate qui dolorem voluptatum ut. Vel quas eum dicta quo. Labore voluptates nisi rerum earum sed ut perferendis. Debitis exercitationem quia accusamus dolorum iusto.', 'Free'),
(719, 0, 'xbergstrom@example.net', '(691)698-5072x5943', 'Destiney', '9602 Nolan Parkway\nMullertown, WV 23627', 'Cummerataview', '2009-08-15 00:00:00', 'Voluptate est voluptate ut et. Sunt vitae consequuntur culpa itaque quia labore illo.', 'Premium'),
(720, 0, 'mertie.trantow@example.net', '1-743-856-1794', 'Sister', '7212 Wilderman Plains Apt. 075\nAllyfort, AK 48422-4963', 'Port Shanelle', '2019-11-25 00:00:00', 'Minima molestiae commodi qui quis aut et deleniti. Eligendi cum aut nemo earum tempore dicta incidunt. Autem vitae nesciunt reprehenderit voluptates tenetur. Et ea accusamus voluptatem qui sit ducimus.', 'Free'),
(721, 0, 'adrian.lebsack@example.org', '(425)886-3969x906', 'Raymond', '975 Jeanne Junction\nAshlynnshire, WA 59041', 'South Verniemouth', '2001-05-11 00:00:00', 'Et deserunt ut et. Accusantium quasi repudiandae voluptates quo. Delectus recusandae veniam qui non laborum id ea. Rerum recusandae excepturi ratione velit id molestias beatae.', 'Silver'),
(722, 0, 'alisa23@example.org', '1-572-987-7520x9126', 'Gabriel', '4041 Watsica Drive Suite 677\nNew Destini, PA 21228', 'Wardton', '2010-05-23 00:00:00', 'Quia omnis laboriosam repellat maiores incidunt officiis fugiat. Est necessitatibus minima aut enim repellat iusto dolorem. Vel deserunt tenetur assumenda quia.', 'Gold'),
(723, 0, 'price.smitham@example.org', '+41(3)0575315346', 'Sandra', '327 Priscilla Creek Suite 149\nRolfsonton, CT 12543', 'Priceshire', '1976-06-03 00:00:00', 'Ea molestias numquam harum eaque nihil. Nobis illum commodi maxime unde iusto. Aut voluptatem debitis qui tempora dicta et impedit. Veniam et iusto cupiditate voluptates.', 'Premium'),
(724, 0, 'raymond83@example.com', '179.087.7906x8467', 'Lillie', '22631 Darion Coves Apt. 973\nStonemouth, NE 99690-6494', 'Hunterview', '1994-09-18 00:00:00', 'Aliquid facilis quia nulla quo. Error quas exercitationem laudantium doloremque consequuntur aperiam. Voluptatem explicabo sit ducimus dolorum. Ut tenetur aperiam modi cupiditate et reprehenderit quasi.', 'Free'),
(725, 0, 'raul.runolfsson@example.org', '(186)963-8137x62306', 'Francisca', '02498 Finn Port\nNew Eliane, GA 18158-3887', 'Reichelmouth', '2021-03-18 00:00:00', 'Quia sit enim soluta voluptatem. Praesentium et est consequatur quo non iusto totam. Nostrum sit blanditiis quisquam in beatae nisi.', 'Free'),
(726, 0, 'sophia.bahringer@example.com', '01849000539', 'Quincy', '6794 Schoen Prairie\nHudsonton, MO 83906-2532', 'Juliobury', '2018-12-25 00:00:00', 'Quaerat eum quidem reiciendis dicta non magni. Ducimus voluptatibus harum maiores quas enim quibusdam. Qui dolorem reprehenderit dolore.', 'Free'),
(727, 0, 'vilma89@example.org', '599.657.5233', 'Mac', '27678 Madaline Turnpike\nKeelymouth, VA 15462', 'Pfannerstillshire', '2009-02-14 00:00:00', 'Voluptas qui dolore quisquam architecto aut nemo nostrum reprehenderit. Eos neque eum itaque iure autem quis. Quidem omnis doloremque quaerat provident dolores assumenda voluptatem. Soluta aut nam laboriosam.', 'Silver'),
(728, 0, 'glennie.boyer@example.net', '080-508-9424', 'Alfonso', '976 Cassin Village\nNew Estefania, WY 55969-5344', 'Hoppefort', '1978-11-01 00:00:00', 'Aut unde quos nulla exercitationem accusamus voluptas laborum. Laboriosam minus ullam quidem ea quae officia eius. Omnis dignissimos laudantium temporibus rem eos labore dolorem enim. Recusandae saepe suscipit magnam.', 'Silver'),
(729, 0, 'walton.mosciski@example.net', '(483)848-8695x31550', 'Laurence', '33535 Gleason Bridge Suite 690\nSouth Marianne, WI 25290-1360', 'Dibbertberg', '1974-05-14 00:00:00', 'Quos maxime minima aut eum. Ad dolore voluptas cumque consequuntur explicabo soluta. Iusto beatae occaecati enim aspernatur aut modi.', 'Gold'),
(730, 0, 'lhahn@example.org', '+99(3)5987227336', 'Marion', '729 Triston Field Suite 167\nAlport, NH 33122-2055', 'South Adela', '1986-05-04 00:00:00', 'Alias voluptatem reprehenderit reiciendis sapiente magni. Doloremque in voluptas asperiores laudantium. Sint aspernatur reprehenderit perspiciatis id unde distinctio. Quia quia autem sunt eos. At omnis pariatur rerum et.', 'Free'),
(731, 0, 'ocrona@example.org', '(048)296-9620x3341', 'Aurelie', '39716 Ephraim Run Suite 171\nRogersburgh, WY 66429-6674', 'South Camren', '2003-09-02 00:00:00', 'Ut iure id modi ut repellat perspiciatis. Et sint neque animi doloribus commodi eaque. Enim expedita quos sunt tenetur est expedita temporibus amet. Omnis et mollitia similique.', 'Gold'),
(732, 0, 'bernice87@example.com', '(336)076-5959', 'Elnora', '232 Wiza Meadows\nSouth Estherborough, SC 09168', 'East Dorothy', '1973-01-26 00:00:00', 'Consectetur rerum ex nobis non inventore in. Iure qui accusantium molestiae explicabo. Aspernatur quia repellendus perferendis dolorem accusantium laborum.', 'Silver'),
(733, 0, 'oebert@example.com', '256-198-9638', 'Estell', '987 Leola Cape Apt. 942\nPort Yoshikoville, NV 04630-2276', 'Cristinatown', '1993-06-25 00:00:00', 'Dolores voluptates aut autem a autem. Esse dolorem blanditiis fugiat pariatur nihil magnam. Et temporibus qui sapiente odit.', 'Silver'),
(734, 0, 'berneice.lemke@example.com', '1-007-698-7842x4687', 'Casimir', '401 Gutmann Square Suite 936\nLake Lennietown, TN 13857', 'South Rosina', '1997-12-17 00:00:00', 'Consequatur doloremque et fugit. Et odio alias enim exercitationem unde.', 'Gold'),
(735, 0, 'huel.leila@example.net', '701.493.5922x6035', 'Torrance', '3927 Ludwig River Apt. 759\nBarrowshaven, KS 35955', 'Waelchichester', '2005-06-18 00:00:00', 'Quibusdam enim maiores occaecati praesentium tempora repellat. Eius magnam dignissimos unde similique. Sed quo rem hic ipsum dignissimos voluptas. Et sint odit temporibus.', 'Silver'),
(736, 0, 'fgreenfelder@example.com', '726-079-3901x6292', 'Dolores', '408 Stiedemann Squares\nFeltonchester, DE 92664-6501', 'New Trentonview', '1987-03-16 00:00:00', 'Ut ea et esse sed reprehenderit nostrum. Magnam incidunt aliquam expedita eum ipsa. Qui debitis dolores illo eius.', 'Premium'),
(737, 0, 'paxton98@example.com', '443.325.4852x9378', 'Daphnee', '6810 Braun Gateway\nSouth Bryana, AL 05229', 'Braunport', '2019-08-18 00:00:00', 'Fugiat iure dolor repellendus veniam est aspernatur. Et eaque ex nisi quaerat tempore ab expedita. Minus ad eos eveniet doloribus.', 'Premium'),
(738, 0, 'abigail31@example.com', '+34(7)0032285004', 'Milan', '3782 Giovanny Coves Apt. 646\nNew Maryam, DC 22802', 'Port Justus', '1971-09-01 00:00:00', 'Voluptatem aliquam qui consequatur error delectus. Temporibus inventore earum enim eum et voluptates. Aliquid atque rerum eum sed.', 'Silver'),
(739, 0, 'deven.fahey@example.net', '(371)947-9522', 'Marley', '27555 Torphy Valleys Apt. 605\nPort Onie, ID 74800', 'West Nikoton', '2006-11-20 00:00:00', 'Dolor molestias laborum porro eius. Reiciendis animi inventore accusamus hic voluptate nostrum. Exercitationem fugiat totam aliquid voluptatem omnis aut. Sit quisquam ratione corporis vel.', 'Free'),
(740, 0, 'beaulah.weimann@example.com', '163.707.1783', 'Houston', '07165 Monty Mountains Suite 698\nEast Cristianbury, RI 33774', 'Leschchester', '1984-11-13 00:00:00', 'Voluptatem asperiores eos reprehenderit corrupti. Sit dolorum est id expedita similique nihil iste. Nam autem id fuga.', 'Gold'),
(741, 0, 'dmonahan@example.org', '1-742-993-6537x0023', 'Norris', '393 Mann Lane Suite 102\nSouth Karsonfort, PA 05976', 'West Tyrique', '1995-11-23 00:00:00', 'Provident placeat repudiandae autem repellendus molestias quos sunt. Autem est perspiciatis ab aut. Voluptatibus voluptatum odio et quia et facere.', 'Premium'),
(742, 0, 'xoberbrunner@example.com', '1-507-537-7453', 'Twila', '7769 Golda Court Suite 677\nWest Zackerystad, CO 17827', 'Rutherfordton', '2015-05-23 00:00:00', 'Non laudantium nesciunt non et omnis laborum pariatur consequuntur. Consectetur illum earum est. Suscipit dignissimos laboriosam voluptatem nostrum aspernatur enim distinctio.', 'Premium'),
(743, 0, 'amely.champlin@example.com', '776.233.2974x16569', 'Alford', '1576 Caitlyn Roads Apt. 702\nNew Rodrigomouth, HI 81468', 'Joanton', '1970-02-18 00:00:00', 'Delectus ut qui optio tempora velit porro optio. Et voluptatem dolor vitae fugiat beatae. Enim sunt vero a eaque dolorem est.', 'Silver'),
(744, 0, 'shyanne.runte@example.com', '1-469-564-1653x71574', 'Sherwood', '6143 Klocko Rapids\nSchmittchester, WA 18640-9278', 'North Fletcher', '1996-04-05 00:00:00', 'Autem recusandae quod cum sunt sunt nesciunt expedita. Libero omnis ratione eos hic. Omnis ullam ipsam suscipit. Amet aut tempora consequatur modi dolor enim et.', 'Gold'),
(745, 0, 'lamont78@example.org', '1-733-693-4760', 'Cleo', '2835 Jerde Prairie Apt. 479\nPort Rhettborough, TX 19406', 'East Cameronview', '1996-03-23 00:00:00', 'Omnis omnis maiores voluptate dignissimos aliquam et distinctio. Nemo quo repellendus repellendus et minus vel. Non voluptatem sed odit qui.', 'Silver'),
(746, 0, 'thiel.queen@example.com', '771-620-4719x89595', 'Everette', '833 Destiny Plains\nJimmieville, MD 79236-3636', 'West Mariela', '2016-01-03 00:00:00', 'Voluptatem quaerat at architecto. Tenetur deserunt delectus neque in blanditiis. Exercitationem voluptatem quaerat minima consequatur labore aut.', 'Silver'),
(747, 0, 'rempel.darius@example.net', '(612)768-3317x7705', 'Kaylee', '52575 Lang Flat\nKristopherchester, MT 94660', 'Port Graciela', '1999-04-24 00:00:00', 'Quo voluptatum facilis quos eum necessitatibus voluptas. Facilis et esse sed temporibus vel vero quia. Autem officiis repudiandae voluptatum culpa consectetur. Voluptatem quo recusandae consequatur non eum. Eaque earum nesciunt eum ipsum occaecati distinc', 'Free'),
(748, 0, 'friesen.gerry@example.net', '373.428.4787', 'Michaela', '20771 Metz Estates\nGloriaview, VA 34955-4512', 'East Modesta', '1995-11-10 00:00:00', 'Enim ducimus provident aut vitae et. Necessitatibus ut illo officiis cupiditate. Ea quisquam occaecati non veniam perferendis voluptas sint. Eos quasi magni molestiae autem iusto nulla.', 'Silver'),
(749, 0, 'zschoen@example.com', '1-200-800-7276', 'Mittie', '391 Cronin Manors\nLake Santiagotown, VT 94716-3384', 'Purdyhaven', '1990-05-05 00:00:00', 'Unde magnam quo aut mollitia unde in. Aliquam nisi excepturi asperiores explicabo veniam voluptates eum.', 'Gold'),
(750, 0, 'emckenzie@example.com', '1-934-854-9275x1448', 'Leonel', '616 Lindgren Field Suite 498\nCormierfort, CA 15644-1233', 'Port Jarvis', '1992-02-29 00:00:00', 'Doloribus minus sapiente ad et. Cumque quis iure officia ab nemo consequatur id velit. Qui impedit iste velit ullam.', 'Gold'),
(751, 0, 'howell.reta@example.net', '051-870-9176', 'Allene', '32885 Strosin Village\nMeghanburgh, DE 22332-0821', 'Lindgrenberg', '1991-12-02 00:00:00', 'Ut voluptatem minus natus provident. Voluptatem ratione quos in reiciendis rem est. In et aut maiores consequatur autem et aliquid quos. Autem voluptatibus illo quia qui. Ea perferendis natus consequatur nobis.', 'Free'),
(752, 0, 'patrick.ruecker@example.org', '1-880-735-5017x208', 'Margarita', '6424 Jacobs Union\nGoldenmouth, WA 57650-0144', 'Lake Jalon', '1970-07-29 00:00:00', 'Omnis aspernatur nesciunt corporis asperiores. Sed eligendi ipsam enim et. Harum doloremque et at cupiditate beatae nisi. Facere quia minus itaque et.', 'Gold'),
(753, 0, 'roob.daren@example.org', '875.009.4490x231', 'Terrill', '286 Nya Drives\nTerryborough, NY 94976-2028', 'Danielleborough', '2018-12-12 00:00:00', 'Modi consequatur commodi voluptatem dicta. Quo repellendus accusantium aperiam aut explicabo. Culpa ut illo nemo est officiis temporibus dolor.', 'Silver'),
(754, 0, 'wilfrid94@example.org', '(328)121-1638x694', 'Ernest', '4154 Craig Union Apt. 924\nMarleebury, OH 83971-1811', 'West Alexandra', '1990-12-02 00:00:00', 'Rem et velit est. Sit hic mollitia enim corporis eius omnis voluptatibus. Quis sit alias deleniti non.', 'Gold'),
(755, 0, 'jacobson.fausto@example.org', '1-821-664-1130x60303', 'Justus', '5224 Schmeler Rapid\nEast Jade, GA 05433-2080', 'Adanborough', '2018-04-24 00:00:00', 'Tempore fuga ut maxime adipisci nam libero soluta. Ut sed recusandae dignissimos amet. Accusantium eligendi veritatis voluptatibus voluptatem qui ad quia.', 'Silver'),
(756, 0, 'chase31@example.net', '402-816-8474x864', 'Ladarius', '60150 Bahringer Crest Suite 879\nMillerhaven, MI 47662', 'New Odamouth', '1971-02-16 00:00:00', 'Veritatis ut veritatis ut beatae culpa. Autem tempora eius fugit quo illum. Omnis sunt illum et.', 'Gold'),
(757, 0, 'beahan.marion@example.net', '549.059.7860x2024', 'Sydni', '767 Gussie Turnpike\nDachland, IL 97906-7603', 'Port Alexie', '1976-01-27 00:00:00', 'Nam praesentium dolor odio ex. Numquam tenetur aperiam facilis quia fugit natus nihil nulla. Hic facere voluptas illo at. Molestias tenetur rerum autem illum id. Sit nobis ut voluptatem et.', 'Free'),
(758, 0, 'dbrekke@example.net', '733.479.9387x850', 'Orie', '72790 Mia Lodge\nBrekkefurt, UT 43637-5934', 'Mabellechester', '2012-11-09 00:00:00', 'Hic voluptas eveniet quo beatae quo magni nobis. Provident quo qui at architecto sit dolores sed. Aut voluptas in recusandae dolore sit quidem numquam.', 'Premium'),
(759, 0, 'hettinger.raoul@example.org', '02578825774', 'Andreanne', '105 Lexi Spur\nEast Hopemouth, WY 79625', 'Port Giovanna', '1976-07-01 00:00:00', 'Cumque et totam amet aut deserunt deleniti commodi. Modi quia facere iste voluptates alias tempora. Minima exercitationem et esse praesentium sed molestiae. Expedita nemo nihil et porro aut. Voluptas sit velit qui quis ipsum quidem maiores.', 'Premium'),
(760, 0, 'kturcotte@example.com', '166.353.7449x5932', 'Anais', '13909 Carson Garden\nAnyafort, ID 48144-6893', 'South Pearl', '2012-03-17 00:00:00', 'Facere iste qui dolores molestias autem vel aut voluptatem. Ullam enim fugiat culpa ullam deleniti. Eaque modi exercitationem eum velit consectetur mollitia dolores. Qui eos laudantium quae rerum.', 'Free');
INSERT INTO `individual` (`id`, `status`, `email`, `phone`, `name`, `address`, `city`, `since`, `description`, `packet`) VALUES
(761, 0, 'eunice.donnelly@example.com', '(694)590-2934', 'Cristal', '8361 Luther Trail Apt. 861\nNew Zanderfort, MT 31506-2411', 'Budburgh', '2006-07-28 00:00:00', 'Dolorum optio ducimus tempore repellendus sit. Voluptatum eligendi molestiae animi aliquam. Totam inventore architecto commodi doloremque iure. Quia id veritatis asperiores qui suscipit quis.', 'Free'),
(762, 0, 'shemar81@example.org', '1-801-603-2218x08416', 'Matilda', '19377 Boyer Fall Apt. 336\nEast Lawsonport, VT 33998', 'Port Vincentview', '2010-10-26 00:00:00', 'Possimus omnis excepturi doloribus expedita consequatur vel placeat velit. Unde impedit ut et et non at.', 'Premium'),
(763, 0, 'towne.kiara@example.org', '546.823.7577', 'Maia', '037 Stroman Green\nBeermouth, OH 72908-3271', 'Lake Mohammed', '2011-03-02 00:00:00', 'Necessitatibus rerum aut et facere ea laborum unde. Aut nesciunt adipisci reiciendis corporis. At odio enim sunt impedit iure nihil fuga quas. Et dignissimos quasi velit quia quis.', 'Silver'),
(764, 0, 'courtney.thiel@example.net', '965-793-6638', 'Sam', '4649 Chelsie Spur Apt. 014\nSouth Uriahside, ME 50912', 'Lake Rubiemouth', '1992-03-01 00:00:00', 'Qui est accusamus atque odio. Dolorem quae sit sit labore itaque neque totam. Illo ipsa explicabo eveniet laudantium aliquid. Ut harum minus placeat occaecati enim.', 'Silver'),
(765, 0, 'ryleigh.beier@example.com', '1-818-338-9546x328', 'Cornell', '158 Loyce Drive Apt. 913\nPort Mariana, AZ 59036', 'Romagueraburgh', '2013-07-06 00:00:00', 'Nulla repudiandae laudantium eius asperiores quis. In aut corrupti aliquid. Ut ex eos ut aspernatur velit.', 'Gold'),
(766, 0, 'bradly76@example.org', '+21(9)1774087844', 'Aurelie', '913 Zemlak Square Apt. 455\nAsaport, NV 04540-1771', 'Talonstad', '1986-02-22 00:00:00', 'Quia nam quo iusto quis eaque expedita magnam ullam. Vel voluptate minima et. Quam eum sint necessitatibus a sunt qui eos non.', 'Silver'),
(767, 0, 'trey.mccullough@example.net', '1-271-902-0909x3982', 'Karen', '1763 Gerlach Forges Suite 586\nHartmannberg, OH 37293-1147', 'Huelhaven', '2019-11-22 00:00:00', 'Illo ut error a et dolorum rerum. Pariatur quod nostrum error distinctio et vitae consequatur possimus. Et corporis mollitia ut quod ut vel iste deleniti. Et doloribus nihil distinctio quis in quaerat quos.', 'Premium'),
(768, 0, 'nharris@example.net', '1-234-284-7085x5609', 'Alba', '53505 Allan Way Apt. 852\nMcKenziemouth, WA 71471-5725', 'Robelborough', '2020-08-08 00:00:00', 'Rem natus quia hic aut hic ea. Hic sed sed exercitationem distinctio nihil. Quia voluptatem dolorem ullam deserunt. Sapiente enim rem ab ducimus.', 'Free'),
(769, 0, 'adell75@example.com', '(370)463-6990x59192', 'Noel', '78531 Makenzie Ferry Suite 280\nNew Amiebury, MI 48952-9357', 'Johnsport', '2011-11-13 00:00:00', 'A facere alias occaecati. Excepturi magnam velit ullam ullam ut voluptates non. Distinctio ut et laboriosam ut beatae et sed. Ex sint quis magnam ratione.', 'Silver'),
(770, 0, 'gutmann.wilfredo@example.com', '218-575-5900x46760', 'Grace', '074 Carol Roads Suite 084\nKoelpinton, IA 26514-8271', 'North Mireillemouth', '2008-05-10 00:00:00', 'Error qui dicta voluptatum officia porro ipsum qui. Eos ut quas nostrum accusamus. Eum animi ex recusandae eos cupiditate nisi ullam sit.', 'Premium'),
(771, 0, 'wtowne@example.com', '890.445.3413x6884', 'Jerrod', '95473 Reyes View Apt. 852\nLednerview, KY 43908', 'Hintzhaven', '1992-09-28 00:00:00', 'Unde minus et consectetur voluptatem eum omnis doloribus. Ipsa deserunt quae ex in velit enim. Optio aliquam dolore aut voluptate sit iste id.', 'Premium'),
(772, 0, 'zakary.champlin@example.net', '921-850-3641', 'Maybelle', '276 McKenzie Valleys\nJaunitastad, WV 89731-1355', 'East Aliciaburgh', '2019-07-04 00:00:00', 'Et voluptas qui cupiditate beatae excepturi in dolor. Sunt et id libero eius in recusandae eveniet. Inventore temporibus ullam aut ut aut.', 'Silver'),
(773, 0, 'eugene.veum@example.org', '479-407-7270x4230', 'Rita', '075 Aaliyah Haven\nPort Diamondhaven, SC 90779-5186', 'Eleazarborough', '2008-10-12 00:00:00', 'Et quidem laboriosam aliquam. Rerum adipisci vel laboriosam qui. Saepe qui optio sed rerum libero consequatur vel. Facilis praesentium ipsam quibusdam.', 'Silver'),
(774, 0, 'eo\'conner@example.net', '788-475-0982x8419', 'Ernie', '943 Derrick Estates Apt. 121\nJarvisport, CO 26626-1602', 'Port Theronstad', '1984-09-28 00:00:00', 'Sed doloremque reiciendis beatae sit non. Aspernatur enim sunt voluptatem non sequi. Aut autem a quaerat sed quia sunt exercitationem aliquid. Rem eligendi quas impedit.', 'Premium'),
(775, 0, 'ukoepp@example.com', '(249)710-0687', 'Lukas', '10854 Burnice Station Apt. 883\nSouth Ruthe, IN 31359', 'Gregorymouth', '1974-08-12 00:00:00', 'Et sit ad autem eaque atque quia et. Est quo illum voluptatibus iure in. Sit temporibus id sapiente totam ut. Saepe id facere aspernatur omnis. Cum quia quas aliquid et.', 'Premium'),
(776, 0, 'beulah.konopelski@example.com', '1-882-960-3073x429', 'Vince', '789 Skiles Forks Apt. 207\nVandervortstad, AK 83611-9149', 'New Hans', '1995-09-08 00:00:00', 'Suscipit in inventore in aspernatur vitae rerum. Corporis animi voluptatem provident dolorem eum quaerat quibusdam. Corporis vel officiis iste dolorum hic iusto.', 'Silver'),
(777, 0, 'schimmel.patience@example.net', '1-102-097-7048x423', 'Parker', '7125 Osinski Station\nSpencerport, NC 77084-6298', 'Wehnermouth', '2008-02-03 00:00:00', 'Ratione quas labore blanditiis qui nostrum et. Deserunt excepturi consectetur labore. Dolores delectus quo nemo ipsum. Veritatis quae eos accusantium repellendus at quaerat fugit.', 'Free'),
(778, 0, 'o\'kon.luther@example.com', '688-274-4876x221', 'Nya', '8811 Langworth Junctions\nSchambergerbury, DE 02487-8322', 'Satterfieldmouth', '1970-06-04 00:00:00', 'Nemo commodi aut molestiae qui qui excepturi. Sunt sed repellendus aut qui cumque commodi quod. Rerum laudantium aliquid error laborum et. Optio assumenda ad et culpa quo.', 'Silver'),
(779, 0, 'everette33@example.org', '417-680-9256', 'Murray', '8882 Bashirian Pike Suite 604\nDeonchester, PA 40664-7780', 'East Vadachester', '1978-08-03 00:00:00', 'Maxime ex consequuntur saepe aut quas ducimus. Dolores vel non quidem velit. Sequi iusto est et nihil voluptatem iusto ea. Repellendus provident doloribus necessitatibus saepe. Cupiditate voluptas adipisci suscipit totam qui.', 'Silver'),
(780, 0, 'dicki.wilfred@example.org', '1-911-060-1427', 'Hanna', '5249 McLaughlin View Suite 000\nJaydafort, IL 00836-9884', 'Hartmannstad', '2009-11-10 00:00:00', 'Eos ex quia ipsa quasi magni quod quo. Sed et et maiores temporibus perferendis officiis. Ratione rerum voluptatem eos voluptatibus qui sapiente.', 'Free'),
(781, 0, 'jana.bosco@example.com', '(994)856-4004x71590', 'Jerel', '28484 Hamill Roads\nNorth Ismaelville, AR 72016', 'Roxaneside', '2019-08-12 00:00:00', 'Itaque ratione nihil qui rerum. Sint quas commodi praesentium. Et voluptatem dolores dolorem excepturi.', 'Premium'),
(782, 0, 'brianne.dickinson@example.net', '1-850-452-1544x78906', 'Marisol', '78927 Orlo Dam Apt. 332\nCoraliehaven, MS 64433', 'Berniceshire', '2019-05-26 00:00:00', 'Molestiae id quae voluptas veniam quaerat enim. Harum ex et perferendis facere consequatur cum totam maxime. Eos nobis qui rem esse vero.', 'Silver'),
(783, 0, 'stacy.goodwin@example.com', '06266563759', 'Susie', '9822 Mann Wall\nSouth Cathy, NC 78130', 'Farrellhaven', '1980-02-08 00:00:00', 'In quis sunt doloribus ut. Enim officiis id ut fugiat dignissimos. Consequuntur voluptates autem unde veniam.', 'Silver'),
(784, 0, 'ktrantow@example.com', '430-362-2750x101', 'Connie', '20836 Willms Pike Suite 563\nNorth Mohammed, AZ 30416', 'Paucekborough', '2019-05-19 00:00:00', 'Eveniet adipisci unde magni aliquam repellat et laudantium. Culpa id magnam et voluptatem porro. Vel quis velit et quo est aut velit molestiae.', 'Free'),
(785, 0, 'samara.lynch@example.net', '794.526.1317x477', 'Maria', '7386 Mertz Hill Suite 847\nGutkowskimouth, MT 75237', 'Emmerichmouth', '1998-07-05 00:00:00', 'Perferendis alias totam qui vel voluptas quae. Et ea et natus. Odit id tempore et. Ut unde ut ex est.', 'Free'),
(786, 0, 'brock.hoppe@example.org', '034-419-6702', 'Willie', '383 Durgan Summit\nBednarfort, NC 47261-5602', 'Lazaroton', '1973-01-27 00:00:00', 'Ut at consequatur ut ea saepe et repudiandae perferendis. Commodi tempore cupiditate dolore nemo. Cupiditate alias error et. Aut error aliquam vitae quo ullam ut pariatur.', 'Premium'),
(787, 0, 'fkonopelski@example.net', '+80(6)7251468252', 'Michael', '76558 Gennaro Springs Suite 512\nLake Katelyn, AK 99957-6498', 'Port Gretchen', '2007-02-26 00:00:00', 'Consequatur dolorum incidunt non minima voluptas sed. Sapiente voluptas voluptas quo quia corrupti cumque sed voluptate.', 'Silver'),
(788, 0, 'darrin49@example.net', '622.290.9964', 'Terrell', '21989 Rubie Turnpike\nNelleberg, SD 25525', 'North Tomas', '2019-10-29 00:00:00', 'Consequuntur quas cum est ipsam quaerat fugit. Sint ullam ad deleniti quisquam. Voluptatibus assumenda et ipsum dolorum. Non praesentium iste illum aut.', 'Silver'),
(789, 0, 'jerad66@example.com', '02555783061', 'Myrtis', '44017 Michelle Crossing Apt. 785\nLemkeview, KY 70872-4432', 'Port Xzavierville', '1995-01-11 00:00:00', 'Quia dolorum ut eum odio sint dolore ex. Eum hic veniam cum beatae est cum fugit. Ex at qui qui est voluptatem. Voluptatem et cumque quisquam amet consectetur.', 'Free'),
(790, 0, 'brandon39@example.org', '1-276-860-5700x891', 'Caterina', '9161 Cordia Coves\nMadelinestad, FL 98329', 'Jaylenberg', '1982-07-28 00:00:00', 'Perspiciatis ut quae deserunt quibusdam nostrum. Sequi voluptas blanditiis laudantium non ad qui. Dolorem qui voluptas deserunt quas asperiores tempore perferendis.', 'Silver'),
(791, 0, 'hblock@example.com', '(161)795-3507x75574', 'Jesus', '562 Tierra Park Apt. 417\nRippinshire, DC 44215-1765', 'Codyfort', '1997-11-02 00:00:00', 'Numquam aspernatur explicabo voluptate adipisci pariatur aspernatur dignissimos. Consequatur minus in minus atque inventore quia. Corrupti sunt reiciendis dicta voluptas consequatur.', 'Free'),
(792, 0, 'alexanne58@example.com', '09419143222', 'Deanna', '81091 Johnson Center Suite 935\nEast Felicitachester, MA 13319', 'Dickensview', '2020-04-05 00:00:00', 'Cupiditate nihil voluptates quidem et nam voluptate asperiores. Architecto expedita quia cum dignissimos qui omnis facilis occaecati. Minus adipisci occaecati reprehenderit aliquid dolorem. Sit rerum reprehenderit eum consequatur. Pariatur dolore pariatur', 'Free'),
(793, 0, 'pmante@example.org', '(605)481-5029', 'Noemy', '8642 Nolan Walk Suite 947\nAnkundington, CO 02978-2030', 'Handshire', '2003-01-29 00:00:00', 'Omnis rerum voluptatem ex autem repudiandae iure dolore omnis. Praesentium at consectetur accusamus voluptatem sequi autem voluptas. Libero dolores quisquam sint ipsam blanditiis quos quidem.', 'Gold'),
(794, 0, 'haleigh23@example.com', '1-717-150-2918x9786', 'Ernestine', '03239 Bayer Land Suite 273\nEast Robyn, NV 08519', 'Buckridgemouth', '2017-04-09 00:00:00', 'Exercitationem est eos sit nobis. Quia temporibus quia non cupiditate expedita reprehenderit.', 'Gold'),
(795, 0, 'tschumm@example.net', '+97(3)3716032846', 'Darren', '90735 Kihn Mews Apt. 977\nPort Maci, NJ 07339', 'Keeblerborough', '1979-04-17 00:00:00', 'Itaque et maxime vitae veritatis cupiditate nihil. Veniam cupiditate minima quis dolorum. Facere sunt exercitationem inventore. Ut voluptatem est in facilis voluptatem repudiandae aliquam.', 'Gold'),
(796, 0, 'reagan.franecki@example.org', '600.403.1304', 'Gerson', '2598 Bo Lane\nNew Destiny, UT 81481', 'East Maybellton', '2007-04-11 00:00:00', 'Cupiditate suscipit enim magnam aut. Omnis maxime ipsa quo exercitationem. Qui rerum cumque sed animi iste. Laudantium ut aut laudantium inventore velit est. Cupiditate cupiditate corrupti doloremque.', 'Premium'),
(797, 0, 'hailie.breitenberg@example.org', '(226)209-9744x32205', 'Lemuel', '70427 Crist Islands\nWebsterfurt, NH 23454', 'Keelingbury', '1994-12-01 00:00:00', 'Ab iusto totam sit aut id quia sapiente. Vero sed dolorum maxime qui sit quidem. Numquam deserunt dolorum sint harum et exercitationem laborum. Corrupti nisi sint dolorem repellendus delectus.', 'Premium'),
(798, 0, 'edgardo.kohler@example.com', '(717)381-8747x7263', 'Milton', '9042 Hodkiewicz View\nGradybury, WY 69489-6728', 'New Melisa', '2015-01-18 00:00:00', 'Dolor magni laboriosam quasi eos nihil. Occaecati sed et quo est voluptas. Corrupti maxime optio et dolorem aut voluptas blanditiis tempora. Perspiciatis maiores sequi rerum quos iusto.', 'Gold'),
(799, 0, 'qrobel@example.net', '030.267.1445', 'Aliyah', '98867 Konopelski Port\nNorth Patrick, GA 25321-2443', 'Lake Yeseniaborough', '2012-02-11 00:00:00', 'Debitis non qui eaque aperiam aut esse. Et est rerum suscipit consectetur aut. Quos aut ducimus ratione minima eligendi. Reiciendis officiis atque itaque provident non nam.', 'Gold'),
(800, 0, 'wintheiser.terrill@example.org', '555.174.0648x03729', 'Salvatore', '801 Terrell Fort Apt. 439\nMcLaughlinview, MD 08344-6117', 'Cormierland', '1999-11-03 00:00:00', 'Omnis pariatur optio quas et officia sequi. Ducimus id molestiae explicabo architecto nihil nisi et. Sed ducimus et ea.', 'Premium'),
(801, 0, 'goldner.jamison@example.org', '1-520-337-2876x479', 'Genevieve', '98371 Janessa Trace Suite 205\nLake Allene, IA 08080-1156', 'East Brielle', '2020-02-18 00:00:00', 'Enim doloremque quia velit neque velit quam. Rem est ullam aut molestiae at asperiores.', 'Premium'),
(802, 0, 'ondricka.nya@example.com', '823-846-0694x500', 'Madie', '3915 Justina Circles\nGrantfort, KY 46342-5027', 'Port Gennaroville', '2000-12-14 00:00:00', 'Voluptas ut ullam ut ullam incidunt. Repellendus vitae vero odit accusantium repellat doloremque. Neque maiores voluptatem modi ratione deleniti.', 'Silver'),
(803, 0, 'rashawn54@example.org', '06809291531', 'Yessenia', '29391 Glover Shore\nLylatown, CO 45164', 'Port Esmeraldaview', '1981-09-24 00:00:00', 'Cumque repellendus consectetur dolore quis facere repellendus vel. Quo nesciunt sequi architecto voluptatum ut temporibus. Praesentium voluptas minus neque et ea impedit.', 'Free'),
(804, 0, 'anika06@example.net', '485-065-1290x25075', 'Narciso', '1507 Adolfo Canyon Suite 836\nMillsborough, ID 56424', 'East Sadieview', '1972-08-02 00:00:00', 'Vel tenetur exercitationem odit iure. Esse minima sed quis et aut sequi quis. Officiis eos deleniti explicabo enim dolores. Officiis neque eos in hic.', 'Gold'),
(805, 0, 'carter.jenkins@example.com', '1-504-230-9071', 'Davon', '61877 Christian Course\nSchillerville, OR 38798', 'East Cordie', '2016-05-18 00:00:00', 'Qui explicabo eum quas error et enim hic perspiciatis. Maxime unde maiores provident aliquam. Repellat veniam vero dolorem. Necessitatibus dolor iure nobis totam culpa quae nisi quo.', 'Premium'),
(806, 0, 'mbreitenberg@example.net', '1-442-678-7964x4660', 'Jeanne', '0187 Lenna Mews\nKeelingside, ND 86161-5928', 'Santiagotown', '1998-12-27 00:00:00', 'Vel labore ipsam voluptatem minima rem iste. Impedit ut deleniti fuga quasi laborum dolore perferendis cum. Aut temporibus dolor eum cumque molestias. Et itaque assumenda omnis sed amet vitae omnis. Laboriosam et quod eum illum maiores laborum ipsa.', 'Gold'),
(807, 0, 'joyce43@example.com', '1-787-112-2555x4386', 'London', '148 Annalise Shores Suite 510\nKeiraton, NV 17133-1997', 'New Vallie', '2018-04-16 00:00:00', 'Et voluptate eius vitae laboriosam impedit laborum repellendus itaque. Quae et quis aut sit. Sed doloribus porro numquam occaecati. Aut blanditiis pariatur eum accusamus reprehenderit enim ut. Rerum dolore quod voluptates et consequatur cupiditate.', 'Free'),
(808, 0, 'mohammad.bayer@example.net', '901.134.9743x565', 'Angel', '25448 Eldridge Station Suite 577\nGusikowskiside, NY 45274-1861', 'Earlenemouth', '1979-04-03 00:00:00', 'Facilis dicta illum recusandae. Est vel fugit modi id temporibus. Voluptatem omnis est aut vel delectus tempora. Consequatur doloremque et ut voluptatum sed.', 'Premium'),
(809, 0, 'nia02@example.net', '277.739.1128', 'Thora', '801 Rohan Center\nHyattview, LA 37974', 'South Ricomouth', '1971-01-03 00:00:00', 'Enim vel ut qui sed eaque eum. Nemo quo possimus qui maxime. Aut qui ex ut qui suscipit illum. In eum eos nisi magni ratione autem asperiores.', 'Gold'),
(810, 0, 'xbauch@example.net', '+47(5)2981232965', 'Holly', '128 Jenkins Neck\nTheresetown, WA 86464', 'East Gabriel', '2021-07-13 00:00:00', 'Aut cumque quis inventore voluptatem dolores. Dolor qui voluptas perferendis delectus et.', 'Premium'),
(811, 0, 'hansen.katlyn@example.net', '+05(5)5668022474', 'Hilma', '695 Lonny Points\nEast Celia, MT 30554-0705', 'Lake Marianestad', '1983-04-22 00:00:00', 'Asperiores ut sapiente nostrum sint deserunt. Voluptatem culpa id voluptatem neque illo eaque. Aperiam ipsa consequatur nisi non sit non. Consectetur occaecati laboriosam sint suscipit.', 'Silver'),
(812, 0, 'dorcas60@example.net', '190-367-6117', 'Giles', '89363 Henderson Spurs\nNew Kristopherburgh, OH 63644', 'Isaiaschester', '1993-11-28 00:00:00', 'Distinctio suscipit cum necessitatibus pariatur voluptatem saepe quia optio. Iure vel qui aliquam eaque quia. Alias eius vel accusamus consequatur vero optio fugiat.', 'Silver'),
(813, 0, 'kharris@example.org', '1-183-336-4453x9395', 'Darren', '12837 Roy Squares\nBergstromland, UT 96543', 'Reynoldsfort', '2017-12-28 00:00:00', 'Incidunt voluptatem corporis asperiores similique. Vero quidem recusandae et dignissimos est odio. Nemo aliquam autem quae soluta cupiditate consequatur. Aperiam tenetur distinctio ut rerum in dolores.', 'Silver'),
(814, 0, 'meta99@example.net', '1-550-348-9447x10115', 'Marley', '3728 Nona Plains\nTrantowberg, LA 71210-7672', 'Cartwrightbury', '1977-09-30 00:00:00', 'Doloremque consectetur vel voluptatibus aliquam non ratione. Nihil odio et sapiente nihil aut ut quasi. Aliquam repudiandae debitis aliquam non quasi maiores laborum.', 'Premium'),
(815, 0, 'rice.astrid@example.org', '1-768-437-9156', 'Tavares', '6536 Rosamond Point\nNew Adonisfort, MO 78730', 'McKenzieview', '2020-05-15 00:00:00', 'Cumque et exercitationem non qui odit. Quidem quisquam quam ut esse voluptas. Magni sapiente voluptas eos est et. Dolores expedita atque eaque sequi incidunt ut consequatur.', 'Premium'),
(816, 0, 'destiny.stark@example.net', '1-384-086-4649', 'Flavie', '37939 Bergnaum Tunnel Suite 814\nAndresfort, DC 32913-5791', 'West Emmie', '1980-12-14 00:00:00', 'Voluptates eum voluptatem in officiis. Eum harum alias id in et rerum dicta cum.', 'Free'),
(817, 0, 'ukassulke@example.net', '936-203-3120x651', 'Luther', '682 Mittie Island\nWest Cortney, SD 03164', 'Port Kyra', '1981-01-28 00:00:00', 'Omnis voluptatibus sint tempora accusantium explicabo sint impedit exercitationem. Velit sunt aut officia veritatis voluptates magni quia vel. Consequatur tempore possimus et qui quis qui molestias molestias. Omnis cupiditate omnis molestiae enim quo.', 'Free'),
(818, 0, 'christina.gorczany@example.net', '657.153.4555', 'Foster', '7010 Adams Ford Suite 379\nNorth Shayleeborough, ME 33059', 'Jackton', '2001-08-29 00:00:00', 'In et deserunt ad. Animi quidem est sit. Beatae veritatis dolore saepe est iusto.', 'Silver'),
(819, 0, 'rnitzsche@example.org', '04489937698', 'Hettie', '84599 Emard Stravenue\nNew Breanne, CA 57847-3645', 'Brekkeburgh', '1984-03-10 00:00:00', 'Sapiente occaecati quia sunt molestiae. Quis est deserunt iusto et velit deserunt autem reprehenderit. Quod et tenetur fugiat itaque nam ab nisi. Reiciendis porro eaque recusandae natus eum qui.', 'Premium'),
(820, 0, 'leffler.ellen@example.net', '02550740686', 'Myra', '69263 Vern Green Suite 974\nLake Leonelmouth, IA 86047', 'North Tedfort', '1998-06-27 00:00:00', 'Excepturi porro tempore sit quia. Ducimus et tempora unde magni qui totam. Omnis quaerat iusto est minima quasi commodi vel. Suscipit non illum excepturi perferendis labore non qui.', 'Free'),
(821, 0, 'rosanna10@example.com', '791.388.4848', 'Mitchel', '4342 Tyrese Glen\nCasperchester, VA 44962', 'New Vivienville', '1977-08-23 00:00:00', 'Dignissimos sit magnam quisquam. Earum corporis enim est veniam dolorum deleniti non. Aut error velit quo.', 'Silver'),
(822, 0, 'wyatt.gleason@example.org', '806-424-5535', 'Izabella', '6236 Heathcote Forges\nWest Alfred, NV 00544-6828', 'Port Florida', '1975-03-27 00:00:00', 'Possimus porro inventore itaque velit odio similique corrupti. Officiis deserunt consectetur voluptatem harum inventore enim reprehenderit. Optio ipsum modi incidunt et.', 'Free'),
(823, 0, 'justyn.lubowitz@example.net', '039.450.3104', 'Dedrick', '8680 Anderson Glen Suite 193\nNiabury, AK 02051', 'Kobemouth', '2012-01-13 00:00:00', 'Quae tenetur deserunt quod ad in non. Illo vel explicabo eveniet quidem ullam. Vel molestias hic sapiente aliquam aut vel nostrum incidunt. Voluptas numquam quaerat commodi et est. Ullam in sint consequatur at placeat.', 'Free'),
(824, 0, 'sanford.susie@example.org', '(846)824-3666x90145', 'Gladys', '02926 Alice Plain Suite 091\nLake Kiarachester, TX 33381', 'North Marieport', '1994-08-20 00:00:00', 'Neque et nihil voluptatum earum voluptate expedita. Quia ut veniam repellat quibusdam. Ducimus excepturi dolore voluptatem velit. Cupiditate rerum qui inventore voluptatum repudiandae. Voluptatem enim ad et magni saepe laudantium dolores.', 'Premium'),
(825, 0, 'rebekah.bednar@example.com', '(562)322-7833', 'Carley', '712 Janessa Knolls Suite 004\nLittlebury, CT 60366', 'New Maribelton', '1977-04-20 00:00:00', 'Qui sed cumque quos quis eius. Possimus eaque est veniam. Et in numquam sint omnis possimus quisquam consequuntur.', 'Premium'),
(826, 0, 'ondricka.adolf@example.net', '+45(3)6710450249', 'Kaley', '323 Jast Plain\nEast Daisyshire, NY 95793', 'Aubreeville', '1971-06-25 00:00:00', 'Et iste repudiandae exercitationem id. Voluptatem quia consequatur iste beatae et occaecati veritatis. Assumenda molestias et mollitia aliquam eligendi aperiam.', 'Free'),
(827, 0, 'welch.marguerite@example.org', '(941)027-8832', 'Annalise', '8887 Gunnar Mountains Apt. 466\nLake Kirstin, LA 06273', 'New Johannside', '1994-08-18 00:00:00', 'Officia veniam eum ipsum soluta sed sed. Harum soluta et reiciendis quibusdam nobis. Ex possimus voluptatem ut est mollitia.', 'Gold'),
(828, 0, 'crawford77@example.com', '00149905822', 'Bette', '608 Schneider Grove\nEast Aubreeport, MA 31396-6453', 'New Mateo', '1983-12-20 00:00:00', 'Id ducimus ipsam nostrum commodi. Labore culpa natus quis ratione dolorem deserunt. Voluptate facilis soluta ea voluptas.', 'Free'),
(829, 0, 'everette.rau@example.org', '367.049.7851x7492', 'Hassie', '05433 Spencer Lake\nMuellerborough, WV 07402', 'Lake Lina', '1989-04-06 00:00:00', 'Incidunt nihil veritatis commodi odio consectetur. Dolor qui libero nemo. Et est quia tenetur inventore velit in ut. Eos et rerum id iure dolores consequatur. Explicabo odit repellat nostrum non debitis ipsa harum.', 'Gold'),
(830, 0, 'corkery.anthony@example.org', '509.008.6712', 'Rashawn', '81992 Cooper Overpass Apt. 597\nNorth Vadaland, CA 93559', 'Sibylfort', '2022-04-01 00:00:00', 'Molestiae natus itaque sequi possimus est expedita. Omnis minima vitae ab blanditiis repellendus. Nemo dolorem placeat quasi quibusdam.', 'Premium'),
(831, 0, 'iflatley@example.net', '(077)545-0081', 'Harley', '0729 Skiles Turnpike Suite 144\nD\'Amoreshire, MD 15114', 'Lupemouth', '1979-04-09 00:00:00', 'Sed saepe iure rerum quisquam aut non. Sed et perspiciatis id recusandae. Ipsum aliquam non quas fugit libero ducimus non qui. Ratione quia omnis animi et molestiae facilis dolore.', 'Premium'),
(832, 0, 'cthompson@example.com', '115-456-2648', 'Maya', '3100 Steuber Mews Suite 895\nTurcotteberg, GA 08090', 'Lake Tevin', '2015-03-26 00:00:00', 'Alias blanditiis nulla sed sed ut rerum quia. Laudantium officiis id vitae vel nobis. Sit corporis omnis voluptatibus odit.', 'Premium'),
(833, 0, 'eichmann.jaylen@example.net', '08686153100', 'Caden', '804 Erika Knolls Apt. 538\nKyliechester, SC 60488', 'Sidneyport', '2004-12-26 00:00:00', 'Nisi magni velit vel pariatur. Aut sed inventore tenetur rem. Illum ut quia illo odit. In sit ut velit soluta fugit.', 'Silver'),
(834, 0, 'gleason.jared@example.com', '07103238182', 'Johnny', '79356 Maggie Throughway\nWest Corbinville, FL 34127-6336', 'New Bertrandfort', '2016-09-23 00:00:00', 'Doloremque consequatur est ex accusamus. Voluptates vitae cum nobis itaque dolores hic maiores. Error velit libero doloribus quod deserunt aspernatur. Sequi repudiandae ipsum dolores est pariatur laboriosam nostrum.', 'Premium'),
(835, 0, 'gregory.roob@example.org', '287-079-3266', 'Harold', '65514 Kris Mews Apt. 161\nEast Bernhardburgh, WA 16989', 'South Antwanbury', '2020-03-22 00:00:00', 'Sit ipsa id sit harum adipisci qui eaque ullam. Qui tempore natus deleniti nam maiores. Vel debitis unde non. Dolorem est perferendis consequatur in mollitia quos culpa.', 'Premium'),
(836, 0, 'sheridan.heidenreich@example.com', '918-289-5239x0579', 'Andrew', '359 Dario Manor Suite 774\nGradyfort, ND 91650', 'Starkside', '1979-11-05 00:00:00', 'Omnis reiciendis alias aut sint aliquam. Illum laborum reprehenderit sint ipsam modi voluptate. Sed ducimus deleniti et necessitatibus.', 'Gold'),
(837, 0, 'lind.enoch@example.org', '889.251.2218x9332', 'Alisa', '94711 Bartell Bridge Suite 984\nKundehaven, AK 01558-8931', 'Port Leila', '1990-08-08 00:00:00', 'Odio occaecati ullam omnis facilis. Provident vero excepturi natus. Nemo nihil ut nulla qui dolore sit. Vel ratione nemo doloremque rerum. Dicta iste dignissimos ab et illum magni ut.', 'Gold'),
(838, 0, 'zspinka@example.net', '1-878-810-4806', 'Lorenz', '1401 Kuhlman Turnpike Apt. 041\nNaderbury, NH 67845', 'Batzshire', '1982-08-12 00:00:00', 'Laudantium non sed at cumque. Ut illum repellendus aut debitis dolorum dolore voluptatem sapiente. Fuga quisquam voluptatem iusto illum sint.', 'Gold'),
(839, 0, 'gaetano.marquardt@example.org', '034.481.2856x407', 'Ruthie', '07461 Noble Shore Suite 347\nLoganburgh, AL 13304', 'North Merritt', '1996-04-09 00:00:00', 'Est corporis et sit sint pariatur excepturi. Libero et perspiciatis voluptatum sit cupiditate facere enim.', 'Silver'),
(840, 0, 'darrell83@example.org', '01386302761', 'Elsa', '357 Vaughn Groves Suite 416\nHilbertfurt, IA 85872', 'Wunschburgh', '1995-01-12 00:00:00', 'Magni tenetur enim ullam fugiat blanditiis molestiae assumenda. Expedita ut consequuntur nostrum voluptatem ratione officia. Facilis eum quaerat velit rerum enim. Ea soluta illum aut.', 'Silver'),
(841, 0, 'hrempel@example.org', '(956)325-3674x1372', 'Sarah', '116 Schiller Walk\nRafaelborough, TX 50739-2379', 'South Mazieberg', '1977-01-03 00:00:00', 'Doloribus in nostrum nulla rem. Quia pariatur modi nam tempore eligendi atque. Fugiat facilis accusantium doloremque et quasi facilis ut qui. Qui illum excepturi voluptatem tempore est in. Nihil ex ab impedit consectetur non.', 'Silver'),
(842, 0, 'rubie.moen@example.net', '298.076.5158x43173', 'Rachelle', '9593 Johnnie Stream Suite 461\nBogisichfort, MO 82033', 'West Lizzieburgh', '2011-01-03 00:00:00', 'Sit itaque placeat fugiat similique. Aut eligendi quasi quas adipisci sed reiciendis. Amet illo est autem corrupti vel. Explicabo quia amet alias iure voluptatem.', 'Gold'),
(843, 0, 'octavia.berge@example.org', '(156)872-2963x81076', 'Abby', '1533 Bradtke Underpass\nJacobiland, MA 21260', 'Betsymouth', '2007-06-22 00:00:00', 'Eos qui sunt omnis sint et ut. Est dolorum enim voluptatem repellendus. Dignissimos aut soluta tempore eius. Dolorum eaque quos recusandae aut. Aut dolor est aut molestias quo.', 'Gold'),
(844, 0, 'xschimmel@example.net', '(713)806-7474', 'Makayla', '6267 Murphy Junctions Suite 446\nGottliebport, SC 45287-5695', 'Eliezerville', '1980-10-05 00:00:00', 'Rem quia debitis eligendi commodi quia facilis placeat enim. Omnis nesciunt provident aut vero ipsa. Ipsam quo optio voluptatem rerum recusandae est labore. Perferendis aut reiciendis maiores dolorem.', 'Gold'),
(845, 0, 'beverly53@example.org', '636.374.7129x8440', 'Kelli', '24069 Hodkiewicz Square\nNorth Nora, NH 79324-3101', 'South Georgebury', '2018-07-29 00:00:00', 'Fuga doloremque voluptatem facere placeat. Nihil aut occaecati earum cumque quos. Fugit totam voluptatum aut rerum corporis.', 'Silver'),
(846, 0, 'jkozey@example.org', '573-052-6702x7061', 'Jaida', '003 Wolff Garden\nNorth Cathrynshire, WV 47644', 'Minniestad', '2013-11-07 00:00:00', 'Quia eos ea autem iste eum eaque autem. Amet cumque beatae corrupti consequuntur. Ab deserunt sed rem.', 'Silver'),
(847, 0, 'aryanna.halvorson@example.net', '1-424-138-5540', 'Curtis', '5906 Turner Ports Suite 505\nNew Peyton, TX 45732', 'Lake Neilside', '2020-10-07 00:00:00', 'Quod omnis est omnis. Nisi beatae error asperiores corporis quidem fuga doloribus repellendus. Ut aliquid delectus temporibus in porro explicabo. Impedit deserunt quia delectus voluptatem aliquid impedit.', 'Gold'),
(848, 0, 'xwilliamson@example.net', '+45(5)7871938225', 'Kendall', '35158 Crooks Causeway\nLinniestad, PA 37901', 'Lake Turnerburgh', '1972-12-09 00:00:00', 'A libero et voluptas quam. Et neque dignissimos quo quae illo. Fuga incidunt aut quae.', 'Gold'),
(849, 0, 'schamberger.alyson@example.net', '1-024-489-0647x191', 'Cory', '173 Brenda View Apt. 775\nEast Issac, TX 25703-0112', 'Tamaraside', '2009-06-06 00:00:00', 'Dolorem sapiente officiis deserunt vitae vel nobis. Voluptates ea magnam aut molestiae.', 'Free'),
(850, 0, 'ludie00@example.net', '(085)306-0229', 'Brenna', '88592 Hickle Port\nKaceybury, NE 94186-0940', 'Staceyborough', '2017-02-11 00:00:00', 'Expedita modi repellat rerum reprehenderit accusamus recusandae. Iure dicta facilis earum unde minus numquam. Dolore iure est rem. Aspernatur porro consequatur provident libero non tenetur est.', 'Free'),
(851, 0, 'uwiza@example.org', '904.811.8899x89213', 'Kole', '8234 Hudson Cliffs\nHammesburgh, AR 80123', 'North Tyson', '2006-05-30 00:00:00', 'Cupiditate magni quis quo ut voluptatem nihil delectus eum. Ducimus dolorum sed quia et molestiae incidunt. Est quisquam repudiandae ipsa et. Ad numquam rerum ut praesentium consequatur.', 'Gold'),
(852, 0, 'edward93@example.com', '(081)547-0225x835', 'Aylin', '916 Vance Drive Apt. 712\nPort Junius, AR 26658', 'Gottliebport', '2014-10-27 00:00:00', 'Quia rem aspernatur reiciendis vel nam eveniet mollitia. Mollitia et et nihil aut aliquam dicta quas. Et consectetur praesentium voluptas sequi omnis cumque est.', 'Free'),
(853, 0, 'o\'kon.tiara@example.org', '(013)591-7476', 'Giovani', '51400 White Trail\nFelixland, NM 20286', 'New Carli', '2015-12-09 00:00:00', 'Consequatur dolorum minima impedit. Quasi est doloribus sed quidem dolor est accusamus placeat. Aut rerum omnis dolores quia dignissimos sint odio provident. Sit debitis aspernatur debitis quia.', 'Free'),
(854, 0, 'josefina64@example.com', '118.074.3402', 'Ardith', '04281 Beahan Valleys Suite 238\nLake Haylieside, AK 94779-5484', 'Lake Lindaberg', '1982-03-25 00:00:00', 'Odio aut ut reprehenderit non eveniet. Nisi dignissimos numquam assumenda dicta. Nihil necessitatibus temporibus soluta ut temporibus.', 'Premium'),
(855, 0, 'edoyle@example.net', '(805)626-5138x062', 'Mona', '6115 Toy Valley\nLake Oscarchester, KY 70878-9942', 'Gabrielleton', '2003-12-14 00:00:00', 'Voluptatum et minus dolor nihil ad eum corrupti. Voluptatem amet eos dolores exercitationem nemo. Fugiat exercitationem sit et nulla praesentium quas.', 'Premium'),
(856, 0, 'beier.linda@example.org', '(592)547-1608x9293', 'Crawford', '020 Welch Creek Suite 246\nAmyahaven, WI 87596-2891', 'Lake Norrisville', '2019-12-17 00:00:00', 'Ut necessitatibus quia autem aut voluptates voluptatem ea. Dolores expedita nihil animi aperiam. Quis voluptas officia hic voluptates. Labore unde praesentium itaque veritatis laborum.', 'Gold'),
(857, 0, 'mohammad87@example.org', '(439)213-1853x042', 'Justus', '5379 Stamm Wells\nPort Pabloville, KS 65818-6797', 'Hackettshire', '1975-07-05 00:00:00', 'Consequatur libero qui sapiente recusandae ab dolor. Labore aut sed est est. Est eum error corrupti. Officiis dignissimos perspiciatis molestias vitae est quo suscipit.', 'Free'),
(858, 0, 'pouros.jaeden@example.net', '838.872.8959x995', 'Estrella', '0214 Hackett River Apt. 410\nMonahanside, NC 84469-8360', 'Shieldston', '1973-07-09 00:00:00', 'Et itaque velit quas et veniam architecto. Eaque qui harum maxime quia cum. Sit est et rerum voluptates necessitatibus quia. Vel dolores consequatur beatae doloremque officia.', 'Free'),
(859, 0, 'jquitzon@example.net', '1-297-849-4744', 'Hilton', '674 Ullrich Park\nDixieberg, NH 12986-3992', 'Lake Carriemouth', '2007-12-05 00:00:00', 'Illum ratione at ut porro aperiam aliquam doloremque. Deleniti laudantium qui sint rerum. Aut doloribus quo ab. Qui ex minima omnis ducimus voluptate hic.', 'Free'),
(860, 0, 'christina.hessel@example.com', '510-793-5649', 'Loy', '6359 Ian Springs\nNew Nat, WA 08699', 'Kuhicstad', '2000-08-25 00:00:00', 'Voluptas molestiae in officiis libero esse. A perferendis doloremque voluptas delectus optio blanditiis necessitatibus. Enim dolore neque et est architecto sit doloremque.', 'Free'),
(861, 0, 'kay.beatty@example.org', '(759)830-7304', 'Shana', '97583 Durgan Inlet Apt. 532\nCandidotown, IN 23243-1919', 'Kleinside', '1978-01-17 00:00:00', 'Sapiente ea ut reiciendis voluptas dolores eius cupiditate occaecati. Quae est illo dolorem omnis earum. Aliquid odit repellendus consequuntur enim aliquid rerum et.', 'Premium'),
(862, 0, 'gladyce69@example.org', '00774958481', 'Timmothy', '0959 Kerluke Islands\nNew Levistad, PA 32788-8187', 'Johnsville', '2004-02-29 00:00:00', 'Est sed dolores a sed eveniet. Dolor accusamus sed et hic. Dolor tenetur cumque et a nobis.', 'Silver'),
(863, 0, 'zboncak.lyric@example.net', '05917832783', 'Eldridge', '007 Haag Parkways\nWizafurt, NM 63744-1766', 'Littelborough', '2004-10-31 00:00:00', 'Voluptas animi velit repellendus temporibus soluta distinctio. Voluptatem assumenda architecto similique ea sed sint. Dolores vel et modi nihil quo. Dolorem optio ut sit.', 'Premium'),
(864, 0, 'ehansen@example.net', '477-929-7090x018', 'Soledad', '88730 Jaida Shores Apt. 235\nThurmanland, CT 82725-3394', 'East Keltonside', '1977-11-05 00:00:00', 'Repellendus aut nihil officiis quo libero ea dolorem rerum. Ipsa aut cumque qui mollitia. Eos a maiores magni iusto. Consectetur nulla autem dolores qui ipsum facere explicabo quibusdam.', 'Premium'),
(865, 0, 'weston24@example.net', '383-980-0846x3869', 'Cheyanne', '704 Hessel Summit Suite 927\nKoleside, NY 05329-7210', 'West Ahmadborough', '1997-03-23 00:00:00', 'Error quo ad molestiae ipsum odit sed illo. Expedita et quisquam accusantium ut aut quas. Id in natus voluptates officiis dignissimos. Optio excepturi rem odio dolor est reiciendis molestiae.', 'Premium'),
(866, 0, 'enader@example.com', '(547)737-4649', 'Billie', '54982 Davis Gateway Suite 702\nPredovictown, CA 58306', 'Cordiafurt', '1973-11-22 00:00:00', 'Excepturi aspernatur distinctio neque qui et deserunt. Et aperiam ducimus cum sint delectus enim. Atque praesentium nulla iste deserunt error. Quisquam velit odio possimus dolores excepturi et occaecati saepe.', 'Silver'),
(867, 0, 'fadel.cecile@example.net', '(714)647-5623x7412', 'Marcella', '490 Ezekiel Court Apt. 977\nErnserfort, FL 32509', 'East Lois', '2002-12-03 00:00:00', 'Natus dignissimos asperiores optio numquam porro. Quasi quia deleniti id animi. Alias provident velit repellat voluptas error velit. Quia suscipit expedita animi nam. Aspernatur ad ut cum ullam quam fugit et.', 'Gold'),
(868, 0, 'kassandra99@example.com', '1-132-806-7575x4997', 'Hillard', '669 Purdy Forges\nGenebury, NJ 83949', 'Handton', '2015-06-26 00:00:00', 'Suscipit eos tenetur cumque provident quisquam. Est nesciunt sed eaque reiciendis in architecto deserunt dolores. Ad dolorem ut aut consequatur. Molestiae voluptatem sed sint.', 'Silver'),
(869, 0, 'uryan@example.net', '869.806.5749', 'Gladys', '6651 Stokes Burg\nLockmanberg, DC 48233', 'South Westonmouth', '1984-01-24 00:00:00', 'Non doloribus quos temporibus repellendus. Veniam ratione omnis voluptate aliquam sint aliquid ratione dicta. Quia eaque laborum sint laboriosam. Odio aut est ut ut deleniti ea repellat iste.', 'Premium'),
(870, 0, 'abigail.veum@example.org', '+21(0)2942236325', 'Burnice', '98889 Moen Plaza\nVestaville, ND 40266-4108', 'South Emie', '2000-10-29 00:00:00', 'Quo molestiae assumenda qui. In iusto quaerat nulla voluptate et. Qui soluta distinctio modi fuga omnis consequuntur qui.', 'Premium'),
(871, 0, 'virginia21@example.org', '(415)586-0894', 'Alfredo', '73195 Towne Port Apt. 669\nHageneschester, MI 45637', 'North Louton', '2014-01-27 00:00:00', 'Natus saepe harum et quia. Nemo atque eaque eum aliquid omnis. Natus odio facere ut necessitatibus rerum. Modi laudantium a quis sequi.', 'Gold'),
(872, 0, 'amelie.dubuque@example.com', '+05(0)3983563395', 'Adrienne', '70840 Joanny Plains\nPort Daniela, HI 79488-9332', 'Lake Jazlynview', '2000-10-28 00:00:00', 'Non fugiat et qui occaecati molestiae. Autem enim quasi tempora suscipit. Quas magni dolor facilis. Fuga blanditiis vitae beatae asperiores rerum alias ea.', 'Silver'),
(873, 0, 'milo.orn@example.net', '(399)187-1254x5309', 'Dejuan', '987 Jackie Knolls\nWatsicamouth, SD 12077-2742', 'North Taya', '1982-07-21 00:00:00', 'Quo et ut explicabo sed ut. Omnis hic deleniti accusantium et et ullam quis. Voluptatem dolorem ullam ratione ut illo nisi. Exercitationem libero facilis maiores autem.', 'Gold'),
(874, 0, 'yasmin.schroeder@example.com', '(402)383-6408x533', 'Hildegard', '486 Lyric Dam Suite 406\nLebsackshire, IL 65360-3278', 'South Karlee', '2006-12-13 00:00:00', 'Et officiis qui laborum. Dolore soluta vel voluptate consequuntur.', 'Free'),
(875, 0, 'kuvalis.vince@example.org', '728.687.0484x4814', 'Rosalee', '846 Schulist Hills Apt. 564\nEast Kaitlyn, DC 67682-3866', 'Kuhicland', '1989-04-15 00:00:00', 'Eveniet placeat quisquam nisi blanditiis temporibus quaerat. Quam doloribus recusandae est quia quis optio sunt placeat. Nostrum blanditiis rem perferendis necessitatibus amet laudantium.', 'Free'),
(876, 0, 'bpowlowski@example.com', '514-933-5010', 'Devin', '52464 Abelardo Cliff\nNorth Cornelius, NE 08724-2546', 'Stoltenbergchester', '2003-02-09 00:00:00', 'Aut impedit incidunt necessitatibus quia velit velit ut. Perferendis earum placeat dolor facilis est nostrum ut.', 'Premium'),
(877, 0, 'cathryn.weissnat@example.net', '418-823-6548x777', 'Nicolas', '71770 Otha Meadow Suite 503\nShanellebury, CO 73774', 'Janaefort', '2017-08-18 00:00:00', 'Minus odio vel sed blanditiis. Impedit saepe numquam est repudiandae quo sint. Iste porro odio officiis suscipit aliquam. Autem ea sequi voluptas. Voluptatem accusantium quam odit dignissimos.', 'Free'),
(878, 0, 'sipes.vernie@example.net', '775.269.5886x4086', 'Sigmund', '11495 Lang Summit\nNorth Madisynchester, OH 95792', 'Port Eliezerbury', '2003-02-08 00:00:00', 'Maiores ipsam vero et saepe. Fugit id sed praesentium laudantium hic. Ea possimus vero ut aut cum. Mollitia cumque nisi quo assumenda totam.', 'Free'),
(879, 0, 'dgoldner@example.com', '06186692590', 'Jayne', '706 Murazik Island Apt. 424\nEmmieburgh, VT 88491', 'Port Othotown', '1976-05-28 00:00:00', 'Inventore dolorem sed pariatur sunt perspiciatis consequatur quia. Cum dicta pariatur velit sunt repudiandae quas. Repellat sed aut voluptas consequuntur explicabo omnis rerum.', 'Free'),
(880, 0, 'ofelia.adams@example.org', '317-546-2374', 'Alisha', '5519 Fahey Creek\nNew Abraham, MA 39052', 'Webertown', '2009-11-30 00:00:00', 'Tempore nostrum molestias sed architecto quia aut quam. Hic quia voluptate voluptatem ad voluptates qui. Necessitatibus pariatur delectus qui totam quos at. Asperiores eveniet iure voluptatibus a sapiente nisi voluptates.', 'Premium'),
(881, 0, 'lcorkery@example.com', '756-619-2898', 'Paris', '8569 Haley Island Apt. 053\nPort Beulahside, LA 08666-4387', 'North Vestaland', '1980-10-12 00:00:00', 'Corporis ea quia earum voluptas voluptate ipsum alias. Aperiam quia tenetur asperiores molestiae. Odit corrupti ab similique non sunt unde. Voluptas quae modi sit qui id ullam.', 'Silver'),
(882, 0, 'qwisoky@example.com', '(523)834-8231x10876', 'Delpha', '7862 Cathrine Place\nNew Alize, NJ 02347-1291', 'East Skyemouth', '1976-06-11 00:00:00', 'Provident cumque quis quidem molestias voluptatum molestias quos. A quia dolore et alias modi. Cupiditate tenetur sint cumque autem fugiat veritatis.', 'Premium'),
(883, 0, 'andreane.howell@example.net', '255-879-2811x626', 'Bettie', '7328 Maddison Spring Suite 383\nWest Lance, AR 13613', 'North Jaybury', '1976-05-21 00:00:00', 'Sunt minima praesentium qui est maxime. Aspernatur minima neque quo veniam quis nostrum nulla quia. Deserunt in sunt nihil. Natus quas beatae temporibus est ut.', 'Gold'),
(884, 0, 'moore.braulio@example.com', '+23(1)4061277733', 'Kaycee', '30424 Rosa Square\nErdmanberg, WV 84832', 'Armandhaven', '1978-09-22 00:00:00', 'Nisi at consequatur sapiente. Neque ducimus occaecati eos labore non sint voluptas. Error numquam ullam itaque quos. Nulla enim omnis quibusdam aspernatur ullam.', 'Premium'),
(885, 0, 'kali.bergstrom@example.net', '1-605-768-2048x416', 'Anne', '9185 Angeline Underpass\nNorth Shaniya, MN 20727', 'North Meaganchester', '2014-12-18 00:00:00', 'Porro et aut quia ut qui in. Eos expedita ea sunt sit laudantium nostrum delectus sed. Vel assumenda itaque tenetur consequatur magnam. Qui voluptatem nemo dolorem libero quidem voluptates quia magni.', 'Free'),
(886, 0, 'alfonzo42@example.org', '(477)590-9844x27232', 'Delia', '561 Cormier Key Apt. 157\nNienowberg, AR 97887-0534', 'Aubreeshire', '2016-05-22 00:00:00', 'Voluptatibus at ipsam voluptatem perspiciatis optio reiciendis ut. Aperiam amet et repellendus fugit commodi consequatur dolores repellat. Error harum sunt atque assumenda ut. Voluptatum consequatur cumque ut.', 'Free'),
(887, 0, 'dickens.alexzander@example.com', '617-036-8666x26054', 'Jamarcus', '7876 Gleason Fields Suite 505\nNorth Elyssashire, AZ 93167', 'Lake Randyborough', '2017-03-22 00:00:00', 'Dignissimos voluptas quia non minima. Quis commodi eaque est similique ipsam nemo rerum. Cumque quos voluptas est exercitationem fugit velit. Error dolorem incidunt similique ullam rerum dolores ea. Nihil error quam sequi ipsa culpa aliquid.', 'Gold'),
(888, 0, 'douglas.cassandre@example.org', '532-227-8456x600', 'Lulu', '84792 Schuster Plains\nWest Mara, ND 08557', 'South Marioview', '2018-04-03 00:00:00', 'Velit sunt odio est minima vitae dignissimos. Explicabo nemo rem provident aut quia. Eos ab rerum qui natus et.', 'Gold'),
(889, 0, 'cleve97@example.org', '+41(3)4122572997', 'Alberto', '2973 Rogelio Tunnel Suite 068\nNew Cullen, SC 05366-0650', 'McDermottstad', '1985-04-22 00:00:00', 'Porro molestiae quae voluptatibus sint deleniti consectetur. Ut deserunt dolorem ut maiores voluptas nobis ut. Laboriosam dignissimos dicta praesentium qui aut. Deleniti id non accusantium odio et exercitationem consequuntur ducimus.', 'Silver'),
(890, 0, 'adolphus.cartwright@example.net', '09633498736', 'Rebeka', '8412 Renner Rue\nSouth Ethel, FL 10144-0174', 'Lake Otiliaberg', '1983-01-06 00:00:00', 'Fugiat incidunt aliquam explicabo inventore sit nemo odio. Non sed qui aut et. Sit eum quis et voluptatum expedita magni. Voluptatibus qui omnis laborum cumque. Aut corrupti in amet dolorem.', 'Gold'),
(891, 0, 'velva.bode@example.net', '+28(8)6476367731', 'Shirley', '47421 Ruecker Road Apt. 896\nNorth Hadleyview, IN 18189-4054', 'Runteville', '1971-06-08 00:00:00', 'Laudantium sit earum consequatur veniam. Facilis est provident quia commodi. Est fugit sed provident ut cumque dolorum.', 'Gold'),
(892, 0, 'margarett94@example.com', '553-424-9063x61367', 'Joel', '323 Kautzer Extension\nCummingschester, WI 49284-4332', 'Genesisbury', '2021-08-07 00:00:00', 'Non nemo quia quasi animi temporibus reiciendis. Nisi non cum harum labore doloremque. Ex deserunt mollitia dolorem et nam. Magni nostrum aut quam amet similique et qui.', 'Gold'),
(893, 0, 'hyatt.amy@example.org', '+36(9)3229503735', 'Brando', '89120 Barry Greens Apt. 830\nGilbertoside, NY 32740-1941', 'West Dessiemouth', '1987-10-28 00:00:00', 'Veritatis laboriosam ratione et nam et ea aliquam. Omnis et at at ipsam numquam quaerat. Natus et vel qui exercitationem et a laudantium.', 'Free'),
(894, 0, 'fmohr@example.net', '876.411.2392', 'Izaiah', '717 Thiel Drives\nWest Mayeside, NV 28627-6517', 'East Marleyland', '1978-02-25 00:00:00', 'Vel tenetur vel voluptas. Eligendi asperiores ipsum ipsa suscipit officiis excepturi tempora. Ducimus rem quidem perspiciatis nulla laboriosam at.', 'Free'),
(895, 0, 'dandre.russel@example.com', '1-162-717-2176', 'Raphael', '0895 Pollich Via\nNorth Theoview, MS 69035', 'West Candaceberg', '1975-06-30 00:00:00', 'Ut veritatis tempora officiis quisquam et dolores. Et iusto numquam aspernatur tenetur deleniti repudiandae. Et velit consequatur ut nam. Pariatur modi aut at non repellat ipsa accusantium.', 'Silver'),
(896, 0, 'gunner53@example.org', '107.331.0800x641', 'Alene', '1355 Bayer Heights Suite 373\nGaylordland, NH 95975-6106', 'North Kaela', '2021-02-07 00:00:00', 'Eum fugiat qui velit. Vero et dolor recusandae saepe praesentium occaecati magnam. Vel quisquam praesentium deleniti accusamus dolores. Repellat quae tenetur fugit earum atque commodi ut.', 'Free'),
(897, 0, 'felipe.pfannerstill@example.com', '804-321-7383x701', 'Miracle', '34041 Klein Groves Suite 964\nSouth Elsafurt, WI 68294', 'West Laynefort', '2007-09-13 00:00:00', 'Sunt et sunt quaerat temporibus accusamus qui expedita itaque. Maiores libero est nihil provident fuga. Fugit tenetur hic sed molestias sit repellendus non id. Earum natus dolorem id sint modi.', 'Free'),
(898, 0, 'kevon.dach@example.org', '808.637.0653x1626', 'Carlee', '538 Quinn Valleys Apt. 530\nOrinhaven, NH 34763', 'North Francisco', '1976-07-23 00:00:00', 'Perferendis dolor tempore qui odit. Quod cupiditate illo et in illo. Sed laudantium quisquam quo voluptates.', 'Free'),
(899, 0, 'xkovacek@example.com', '07527408757', 'Anjali', '158 Johnson Flats\nGraysonberg, AL 43632', 'Dickinsonborough', '1996-04-03 00:00:00', 'Esse dolorem officia debitis doloribus. Minima dicta aut reiciendis et dolorem quae eveniet. Voluptate dolorum placeat cumque provident eligendi. Illum sit atque quo sit laborum sed.', 'Premium'),
(900, 0, 'tremblay.adelle@example.org', '01348559633', 'Belle', '965 Walter Drive\nAlexandraside, NE 75328-8377', 'New Anastasiabury', '2004-12-25 00:00:00', 'Temporibus nemo in eveniet in et. Enim dolor quos sed soluta. Similique quae voluptatem unde. Hic ut esse totam saepe expedita recusandae modi.', 'Premium'),
(901, 0, 'zpagac@example.com', '(886)876-1744', 'Dasia', '261 Sterling Roads\nSchultzport, NV 80954', 'Alvenaport', '2020-11-30 00:00:00', 'Ut itaque dolorem voluptas nihil vel officia. Hic facere in aut facere eos quod et. Nisi doloremque nam quos velit eaque. Qui ex quia sint vel voluptas fugit deleniti.', 'Gold'),
(902, 0, 'hollie42@example.com', '470-972-1581', 'Ozella', '913 Rita Manors Suite 915\nGorczanyshire, MI 19882', 'Ulisesmouth', '2019-09-14 00:00:00', 'Reiciendis esse tempora qui quia suscipit id id. Qui quibusdam consequuntur necessitatibus. Dicta qui ut eum sunt ratione dolores quisquam.', 'Free'),
(903, 0, 'jackeline.gottlieb@example.net', '647.182.3409', 'Lester', '768 Bins Rapids Suite 834\nStrosinborough, NH 49026', 'North Ashleyland', '1981-05-27 00:00:00', 'Illo sit amet ex aut. Itaque libero qui earum consequatur sed. Magnam ut omnis et. Fugit cum quibusdam voluptas.', 'Silver'),
(904, 0, 'lind.mya@example.com', '086.279.7415x43202', 'Drew', '29185 Susie Station Suite 112\nNew Zackarychester, TN 05526', 'Abbottstad', '2019-09-27 00:00:00', 'Qui quo perspiciatis voluptate. Quibusdam vel recusandae voluptas assumenda nobis illum velit cupiditate.', 'Silver'),
(905, 0, 'blanda.ronny@example.com', '1-101-176-5821x265', 'Lorine', '10107 Romaguera Gardens\nEast Joesph, CT 10136', 'Lake Trehaven', '1970-02-05 00:00:00', 'Cumque assumenda voluptas harum facilis optio molestias tempora. Eos numquam autem rerum vel. Aut officiis velit quo perspiciatis magnam. Rem qui occaecati voluptates molestias.', 'Gold'),
(906, 0, 'jerrold65@example.net', '497.738.1226', 'Cruz', '3782 Luettgen Isle Apt. 837\nColtonmouth, KY 16765', 'Paucekchester', '1973-11-27 00:00:00', 'Quisquam aspernatur voluptatem dolore aspernatur quis impedit. Molestias aliquam tenetur provident. Doloribus ut quos labore et.', 'Silver'),
(907, 0, 'ivonrueden@example.org', '1-168-920-8524x7600', 'Nikki', '2548 Nina Brook\nDarrontown, CA 58698', 'Terencebury', '1972-02-12 00:00:00', 'Autem dolorem voluptatem et libero et tenetur deleniti. Sint et praesentium deleniti pariatur.', 'Premium'),
(908, 0, 'kariane27@example.net', '1-531-633-7757x3542', 'Shanel', '630 Wilderman Village\nCristalhaven, OH 85803', 'Alexandriaberg', '1985-01-29 00:00:00', 'Ducimus ipsa voluptatem et tenetur eveniet quod. Quod qui reprehenderit officia. Doloribus praesentium natus ab quos. Blanditiis adipisci aliquam qui ipsa.', 'Free'),
(909, 0, 'ondricka.destiney@example.com', '(149)860-7219x0543', 'Madelyn', '167 Henderson Roads Apt. 833\nRusselview, CT 70038', 'Lake Eliezerhaven', '1984-09-21 00:00:00', 'A nisi unde incidunt culpa. Ut eum iste voluptatum rerum totam eum architecto.', 'Silver'),
(910, 0, 'hildegard.dare@example.org', '(656)020-5856', 'Shirley', '4921 Donny Mountain Apt. 981\nSouth Estebanland, MS 38624-0284', 'Terryville', '1980-09-22 00:00:00', 'Tempora quis totam harum molestias omnis esse. Tempore enim dolorum ut natus voluptas nulla. Quia dolores soluta cupiditate et ratione repudiandae non.', 'Silver'),
(911, 0, 'anissa98@example.org', '03195057984', 'Emma', '052 Isac Drive Suite 220\nHaleyville, HI 30221', 'Dooleyburgh', '2012-06-25 00:00:00', 'Ut asperiores voluptatem eaque eveniet. Deleniti occaecati laborum et nemo deserunt eos temporibus culpa. Et recusandae sunt debitis quia et. Odit accusamus ea est velit corporis assumenda.', 'Gold');
INSERT INTO `individual` (`id`, `status`, `email`, `phone`, `name`, `address`, `city`, `since`, `description`, `packet`) VALUES
(912, 0, 'malika73@example.org', '212-499-2839', 'Autumn', '196 Hegmann Plain\nCarsonfurt, DC 45280', 'New Steve', '2002-02-21 00:00:00', 'Assumenda culpa facilis nihil omnis et. Velit in eius voluptatem esse. Tempora modi odit mollitia. In iusto sunt reprehenderit ea. Iure similique sapiente et consequatur ducimus.', 'Gold'),
(913, 0, 'sstamm@example.com', '+60(6)2716719622', 'Jarred', '97312 Orion Greens Suite 056\nRodriguezfurt, RI 88005-3375', 'New Olebury', '2016-09-09 00:00:00', 'Soluta omnis cum sunt hic rerum et quidem. Velit ut qui molestias quia sit quia aperiam. Accusantium non quo alias modi quidem omnis culpa.', 'Gold'),
(914, 0, 'roselyn.padberg@example.com', '1-973-172-1317', 'Lurline', '7770 Halvorson Corners\nNew Everette, MI 83975-0220', 'Martyfurt', '1992-11-15 00:00:00', 'Necessitatibus aut fugiat qui fugiat odio vero explicabo omnis. Labore maiores neque qui numquam voluptates. Quis doloremque vitae necessitatibus voluptas ipsum est. Debitis optio sed dolore veniam ut.', 'Free'),
(915, 0, 'buster38@example.net', '360.485.6038', 'Kaylee', '803 Eliseo Curve Suite 876\nNicolasside, CO 58653', 'East Arlenefort', '1994-04-21 00:00:00', 'Sunt incidunt et praesentium libero. Soluta incidunt incidunt quas consectetur est libero facere cumque. Laudantium voluptates rerum harum ea optio qui sed. Maiores vitae rerum animi aut illo repellat.', 'Gold'),
(916, 0, 'efranecki@example.org', '01281128635', 'Kayla', '9131 Ally Bridge\nHueltown, CO 96950', 'Enriqueton', '1980-05-11 00:00:00', 'Reprehenderit inventore qui libero facere molestias. Incidunt est consequatur hic est et. Porro nihil quis facere qui distinctio quae velit.', 'Premium'),
(917, 0, 'mwalter@example.com', '991-284-8517', 'Maiya', '0535 Rick Stream\nLake Donnaborough, DE 04757', 'Larkinland', '1998-11-16 00:00:00', 'Praesentium error debitis voluptate sunt unde aspernatur maiores. Aliquid exercitationem ut debitis est. Et est id odio exercitationem voluptate ea. Rerum et labore tenetur natus odio omnis.', 'Silver'),
(918, 0, 'qdenesik@example.com', '698.661.1102x871', 'Noemie', '1625 Terence Islands Apt. 172\nMcDermottshire, GA 52693-7274', 'New Naomiefort', '2008-11-01 00:00:00', 'Nihil corporis nobis numquam quibusdam quis soluta. In officia est officiis doloribus laudantium iste. Sunt eaque ex sit illo quaerat.', 'Free'),
(919, 0, 'rutherford.makenzie@example.net', '(328)422-4830x5095', 'Payton', '50268 Buckridge Passage\nKacieborough, NM 25928', 'Jakubowskibury', '1980-10-08 00:00:00', 'Dolor aliquid id atque et. Voluptatum facilis et est fuga cum ex. Qui laboriosam voluptatem suscipit ut et.', 'Premium'),
(920, 0, 'pmills@example.net', '08317830545', 'Pinkie', '9358 Norval Courts\nEast Jaynebury, MS 18876', 'Port Noe', '1996-12-21 00:00:00', 'Expedita optio et possimus maxime veniam. Quibusdam ullam id accusantium et error eum.', 'Free'),
(921, 0, 'misael.hauck@example.net', '830.454.5244x658', 'Taurean', '1352 Terrell Ville Apt. 253\nSchinnerstad, MT 62049', 'West Zoraborough', '2018-04-18 00:00:00', 'Nesciunt ut quia perferendis quo velit rerum. Tenetur eaque aut perferendis perferendis rem fugiat dolor ut. Voluptatem non et blanditiis nostrum facere.', 'Free'),
(922, 0, 'ehahn@example.net', '+09(1)4069524662', 'Roselyn', '374 Gwendolyn Square Suite 024\nElbertside, AZ 58704', 'West Aleenfurt', '2013-05-11 00:00:00', 'Consequatur alias velit ea eos rerum nulla quas voluptatem. Hic rerum minus consectetur. Et ea aut porro nesciunt et ut esse.', 'Free'),
(923, 0, 'tgrady@example.org', '+74(9)1068324700', 'Van', '0135 Mikel Walks Apt. 835\nMackenziebury, MA 03104-8341', 'Mariannafurt', '1971-09-05 00:00:00', 'Magnam delectus molestiae sint rerum minus vel. Et omnis unde deleniti aut autem illum. Quasi corporis eveniet dolores sed minima. Aut placeat velit id repudiandae delectus.', 'Gold'),
(924, 0, 'isadore34@example.com', '461-610-8968x685', 'Olin', '866 Aidan Orchard Apt. 853\nGuyside, MD 79447', 'North Delmershire', '1984-03-08 00:00:00', 'Atque ducimus voluptas voluptas vel. Quae vel quae quo sunt et quia veniam minima. Expedita eum quos deleniti rerum et et sed. Voluptas dolore dolore quisquam.', 'Silver'),
(925, 0, 'kemmer.owen@example.net', '811.953.3786x59646', 'Rosella', '64896 Hudson Mews\nSouth Brad, NJ 53745', 'East Adam', '2013-05-18 00:00:00', 'Odit illo omnis eveniet est. Aut earum necessitatibus asperiores architecto. Ut aperiam sunt aut similique exercitationem.', 'Free'),
(926, 0, 'dorcas20@example.com', '799.976.6175x031', 'Domenic', '7393 Spencer Square Apt. 928\nFloridaland, TN 33501', 'North Pinkie', '1971-09-10 00:00:00', 'Culpa enim eos occaecati natus et dolorem. Libero mollitia rerum reprehenderit. In dolor aliquam tenetur velit voluptatem. Est molestias doloremque dolorum laudantium adipisci quo totam.', 'Gold'),
(927, 0, 'leannon.domingo@example.net', '(928)292-9803x1014', 'Jacinthe', '252 Rippin Street Suite 681\nNorth Eduardo, OK 61245-5150', 'Lake Everette', '2014-09-17 00:00:00', 'Totam nostrum rerum ut incidunt nemo dolorem deserunt. Et nostrum occaecati veniam sint quo. Rerum enim est dolore nobis debitis doloremque animi voluptatem.', 'Free'),
(928, 0, 'wleannon@example.net', '(311)514-1726', 'Arvilla', '542 Kendall Route\nMariamouth, NJ 64228-0832', 'Smithview', '1990-09-12 00:00:00', 'Id officia sint omnis sit eum. Et occaecati dicta impedit nostrum. Ut quas hic molestiae libero autem quod.', 'Free'),
(929, 0, 'durward28@example.org', '460.651.9638', 'Isaiah', '19260 Rowan Spur\nBernieville, IL 80472-7108', 'New Baby', '2003-10-24 00:00:00', 'Laboriosam rem tempore voluptatem in in. Vitae commodi enim quisquam voluptates. Culpa nesciunt repellendus laudantium illo. Repudiandae ducimus officiis voluptas mollitia quasi et.', 'Premium'),
(930, 0, 'daija.buckridge@example.net', '771-233-7308x71575', 'Lambert', '9519 Herminia Estates Suite 485\nLowellberg, WA 92547', 'Port Caesartown', '1993-07-26 00:00:00', 'Nihil quasi ipsa culpa explicabo sit cupiditate. Dolor ut quas ut accusamus. Facilis consequuntur enim sit a hic explicabo exercitationem. Delectus vel rerum qui qui velit sint iusto.', 'Free'),
(931, 0, 'sandrine.gibson@example.com', '972-487-9936x80351', 'Zola', '32198 Peyton Forest\nSouth Milton, WV 59940', 'East Valerietown', '1995-05-30 00:00:00', 'Dicta libero et in quia qui consectetur et. At quae repellendus voluptatem maxime accusamus eligendi autem. Suscipit autem iusto voluptatem est est sit quibusdam voluptates.', 'Premium'),
(932, 0, 'pfannerstill.mattie@example.com', '737-168-4038x01626', 'Duncan', '46033 Ursula Mill\nMedhurststad, WV 52798-8682', 'McKenzieborough', '1974-12-27 00:00:00', 'Et tempora minus reprehenderit maiores sequi. Quia vel a accusamus odio. Animi sint facilis est quia. Quaerat in necessitatibus aut et officia est repellendus.', 'Silver'),
(933, 0, 'susie62@example.com', '817-016-4056', 'Mae', '0207 Schumm Trail\nPort Theresiatown, NH 42208', 'Daxmouth', '1999-04-03 00:00:00', 'Et quis eligendi officiis incidunt est eum ut. Dolorum quos et nihil ipsam ipsam velit. Quae vero sit dicta sint harum. Deserunt molestiae explicabo alias dolorem esse.', 'Free'),
(934, 0, 'miles49@example.com', '+56(2)5867150989', 'Allison', '48409 Newton Radial\nLake Ricky, OH 11773', 'Gusikowskiton', '1993-06-15 00:00:00', 'Quae id officia eum accusantium quis in itaque. Porro enim delectus quia. Laboriosam iure corporis non consequatur.', 'Premium'),
(935, 0, 'gene.smith@example.com', '629.220.6033x1775', 'Florence', '08016 Kunze Court Apt. 189\nHodkiewiczville, GA 12242-2841', 'West Edwinburgh', '1995-03-24 00:00:00', 'Consectetur laboriosam laboriosam laborum vero ut porro numquam. Exercitationem quod ab nihil consequatur ea. Consequuntur nobis nemo dolorum illo veniam quia.', 'Free'),
(936, 0, 'joseph78@example.com', '897-996-0854x2718', 'Myrtis', '230 Kuphal Mills Apt. 748\nTurnerfort, FL 94825', 'Simonisbury', '1989-11-09 00:00:00', 'Porro consequatur quas dolores doloribus. Et nisi nihil assumenda quia voluptas suscipit. Quam dolores eligendi debitis rem porro molestiae cumque nisi. Quos delectus sunt magni debitis adipisci.', 'Silver'),
(937, 0, 'frances.roberts@example.com', '(402)406-4740x05230', 'Hobart', '1876 Weber Falls\nSimonisview, IN 38534', 'North Alexanne', '1978-02-22 00:00:00', 'Nesciunt voluptatem aut dolor. Doloribus molestias dignissimos corporis nesciunt. Ut dolores deserunt nemo pariatur hic. Sint harum adipisci et eveniet maxime aut id.', 'Free'),
(938, 0, 'sauer.josie@example.net', '795.015.4428', 'Chyna', '9041 Swift Shoal\nShannafurt, VA 80570', 'Ilaport', '2019-10-03 00:00:00', 'Doloribus ut sunt placeat accusantium sit sit quod. Quia deleniti voluptas rerum qui. Vel provident nesciunt dicta harum inventore asperiores. Natus omnis quisquam quo id recusandae sit.', 'Premium'),
(939, 0, 'afton.hodkiewicz@example.org', '056.966.9545', 'Corbin', '266 Annabell Spring\nTurnerville, UT 83972-0246', 'Dorothybury', '1983-06-24 00:00:00', 'Est eius harum facere optio quia minima. Quo voluptatem qui id. Adipisci tempora similique ab delectus. Sed non aut ducimus veniam in.', 'Silver'),
(940, 0, 'loren.mcclure@example.org', '(485)208-5780', 'Felix', '2711 Haley Ways\nShakiratown, AZ 08728', 'Smithmouth', '1972-06-17 00:00:00', 'Suscipit temporibus facilis omnis inventore quia. Deleniti et inventore voluptatem fuga minus dolorem quod suscipit. Aliquam non repudiandae et quisquam facere et. Aperiam qui quam dolorem id et.', 'Free'),
(941, 0, 'daugherty.myrna@example.net', '412-026-4678x518', 'Alessandra', '09418 Paolo Junctions Apt. 709\nLake Antonina, AL 23614-0974', 'Lake Agustin', '2015-07-26 00:00:00', 'Voluptatem ea et perspiciatis in unde voluptas. Eius nostrum qui porro vero saepe repudiandae quas. Nemo unde aut reiciendis dicta. Possimus sunt magni tempore ullam.', 'Premium'),
(942, 0, 'bblanda@example.net', '286.348.9347x6000', 'Maybelle', '1923 Ora Grove\nSouth Jules, ND 79793', 'New Johnpaulville', '1990-07-06 00:00:00', 'Accusamus molestiae voluptatem nesciunt qui quis. Aperiam perspiciatis sit quia. Et accusantium nobis est.', 'Premium'),
(943, 0, 'juvenal41@example.com', '1-014-209-5472', 'Kaden', '26443 Marquardt Junction\nNorth Nellafort, AK 17870-3695', 'Lake Bryceside', '1992-08-30 00:00:00', 'Quidem ad sint voluptate eos aspernatur. Vel accusamus harum sit. Nemo enim explicabo in sit est ut.', 'Silver'),
(944, 0, 'keegan.robel@example.org', '(224)982-7977x54333', 'Jazmyn', '21587 Elenor Viaduct\nLake Leta, VA 56850-3350', 'Austinton', '1999-12-21 00:00:00', 'Alias enim at non ut. Minima cum omnis et dolorum nemo. Quaerat sunt qui qui magni fugit.', 'Gold'),
(945, 0, 'rfritsch@example.org', '(912)201-9783', 'Rosetta', '446 Wade Ramp\nEast Antonetta, VT 57397', 'East Eliezer', '2001-06-14 00:00:00', 'Neque expedita temporibus et ut dolorem. Aut officiis rerum a. Repellat qui ut consequatur rerum dolorem laboriosam maiores optio.', 'Silver'),
(946, 0, 'michale.torp@example.com', '+56(5)0888880758', 'Jamey', '8428 Alek Extensions Apt. 052\nKristinabury, HI 27150-0159', 'New Dorris', '1979-08-18 00:00:00', 'Autem eligendi eaque illo fugiat aperiam quis alias quod. Aperiam facilis minus repudiandae et. Adipisci odit ratione ex sit aspernatur doloribus. Culpa fugiat sed recusandae ipsum.', 'Gold'),
(947, 0, 'boehm.lexus@example.org', '377.940.6365', 'Hettie', '38970 Jacobi Curve Suite 777\nPort Magdalena, HI 27701', 'Lake Camila', '2012-12-08 00:00:00', 'Illo ut dolor et doloribus vel. Ut perferendis qui voluptatibus. Vel debitis reprehenderit deleniti sit alias. Et iure harum quod ut sit repudiandae magnam.', 'Gold'),
(948, 0, 'lee.watsica@example.com', '05000598387', 'Evert', '381 Milo Turnpike\nBeckerborough, TN 41859', 'Lake Parisside', '2009-08-19 00:00:00', 'Vel molestias commodi libero. Veniam laboriosam nihil facere qui esse nesciunt placeat ut. Eius pariatur in omnis minima aut. Animi pariatur quis magni laborum ut dolorem itaque.', 'Silver'),
(949, 0, 'kobe91@example.net', '01701596045', 'Cleta', '0327 Terry Viaduct Apt. 363\nOkunevamouth, LA 54574', 'West Jameson', '1971-04-25 00:00:00', 'Nihil consectetur alias totam omnis repudiandae. Qui quam modi non alias tenetur numquam qui. Sed culpa ut ullam at.', 'Premium'),
(950, 0, 'koss.orie@example.org', '1-563-694-6377x1542', 'Rose', '965 Schmeler Loaf\nGerholdside, MT 63184', 'North Vilmamouth', '2006-10-18 00:00:00', 'Id porro aut quos. Dolores qui quas aut rem eum cum autem. Deserunt deleniti voluptates incidunt. Adipisci architecto sed cupiditate eligendi.', 'Silver'),
(951, 0, 'watson80@example.com', '06449870266', 'Hyman', '19263 Ziemann Flat\nDiegoville, MT 25667', 'East Agustina', '2003-03-18 00:00:00', 'Molestiae eligendi asperiores dolorem explicabo. A pariatur accusantium consequatur qui sed consequatur repellendus itaque. Sed provident sunt sequi dolorem perspiciatis sint.', 'Gold'),
(952, 0, 'erdman.diamond@example.net', '06613732376', 'Gage', '55714 Raymond Knolls\nLevifurt, UT 49597', 'Nikobury', '1976-11-07 00:00:00', 'Reiciendis officia quis blanditiis est non error. Magni velit voluptates id sed possimus optio. Harum ea molestiae illo velit.', 'Silver'),
(953, 0, 'zconroy@example.net', '1-359-730-7421x419', 'Lisette', '9659 Torp Locks\nNorth Bennettville, OR 12461-2880', 'Lake Cleora', '1994-07-03 00:00:00', 'Quidem dolorem molestias veniam cupiditate mollitia. Quis dolor aspernatur asperiores deleniti nostrum facere eos. Aut ut nihil qui dolorem a.', 'Gold'),
(954, 0, 'audrey.morissette@example.com', '(249)238-4682', 'Ayana', '05256 Sid Light Apt. 346\nNew Waldo, NJ 97062-4416', 'Lake Kamren', '2021-04-01 00:00:00', 'Explicabo ut beatae voluptas fugit quae unde. Aspernatur praesentium qui et est sed sunt vero. Asperiores dolores omnis est illum quo adipisci doloribus. Nisi molestiae enim dolores rerum blanditiis dolorem.', 'Silver'),
(955, 0, 'alia31@example.org', '920-926-8356', 'Torey', '09380 Borer Summit Suite 513\nNew Brendanside, AR 38793-7807', 'Bergnaummouth', '2009-09-05 00:00:00', 'Et quas voluptatibus id. Iure suscipit libero et commodi. Omnis cum soluta ex. Et dolor et enim vitae voluptas consequatur nostrum. Voluptatibus assumenda et ipsa velit est minima occaecati similique.', 'Silver'),
(956, 0, 'albertha53@example.org', '(424)920-3312x355', 'Icie', '73369 May Fall Suite 041\nNew Vicentestad, TN 77847-7072', 'Camylleville', '1985-03-23 00:00:00', 'Non ut dignissimos ratione itaque sint omnis eum. Unde velit qui autem eum. Doloribus non corporis consectetur nesciunt optio doloremque quod. Voluptatibus ut fuga non. Sunt inventore voluptas autem illum dolorum.', 'Premium'),
(957, 0, 'beatty.francisca@example.com', '+74(4)5368345723', 'Eugenia', '972 Kody Trail\nEast Jena, OK 92038', 'West Letamouth', '1992-09-28 00:00:00', 'Dicta dolores odit aperiam. Et omnis quas repellendus dolor fugiat cum harum. Voluptas dolorem laudantium aspernatur vel sit aliquid. Aliquid odio laboriosam aut.', 'Gold'),
(958, 0, 'vincenzo.bruen@example.org', '(820)712-2918', 'Kavon', '33539 Bernhard Village\nPort Flossie, TX 03543', 'Lake Orval', '2002-08-22 00:00:00', 'Ut et enim veniam suscipit. Ut ab non unde rerum dolor corporis nam. Sit voluptas deleniti autem officia quo.', 'Gold'),
(959, 0, 'german20@example.org', '806.896.1706', 'Marlin', '9107 Will Crossroad\nLake Brigitteside, CA 86196', 'Rutherfordmouth', '1994-05-29 00:00:00', 'Laudantium velit quasi nisi aut accusantium. Consectetur consequuntur eveniet quae dolorem aliquam inventore. Rerum eos modi tenetur eos nostrum animi et aliquam.', 'Premium'),
(960, 0, 'hoyt14@example.org', '(579)292-5687x49996', 'Anabelle', '6755 Nelle Way Suite 324\nPort Dorismouth, ID 77867', 'West Dulce', '1981-03-17 00:00:00', 'Fuga sed maiores praesentium perferendis dolor quod et. Tempora ut quos dicta nesciunt dignissimos error aut beatae. Ut impedit et non. Qui sapiente omnis autem assumenda hic et amet nobis. Optio nulla sint aut.', 'Gold'),
(961, 0, 'mercedes.rowe@example.com', '+18(7)3274124165', 'Odell', '901 Mueller Summit Suite 132\nNorth Skylar, WI 65800-4447', 'Port Carissaton', '2001-07-31 00:00:00', 'Quis perspiciatis porro cum libero cum sit. Aut eos sequi maiores tempore consectetur ut doloremque. Voluptas voluptates qui sit. Iste adipisci explicabo aut distinctio libero.', 'Silver'),
(962, 0, 'tremblay.joel@example.org', '987-255-7056', 'Kane', '075 Nicolas Stream Suite 795\nLaneyburgh, UT 92890', 'East Josiahfurt', '1991-12-07 00:00:00', 'Magni illo eligendi recusandae. Architecto animi quos eius cupiditate.', 'Premium'),
(963, 0, 'ebraun@example.com', '+29(7)9180700330', 'Marielle', '3334 Tina Stream\nCarolemouth, WV 60655-2602', 'Abnermouth', '1973-01-20 00:00:00', 'Accusamus odit necessitatibus similique. Quisquam laboriosam recusandae qui vitae ut cupiditate. Iusto architecto aut sit possimus. Non provident ut rerum fugit et sapiente consectetur.', 'Gold'),
(964, 0, 'agustin89@example.org', '296-377-0174', 'Loy', '17075 Myra Place Suite 141\nMichelland, VT 22903', 'Kayaton', '1999-05-01 00:00:00', 'Tenetur quo eveniet aperiam facere. Tenetur aliquid omnis culpa et. Quo repudiandae earum voluptas.', 'Gold'),
(965, 0, 'philll@example.com', '200-822-9200x54902', 'Ava', '60581 Saul Squares\nHackettberg, HI 68101-7559', 'Wildermanmouth', '1992-11-07 00:00:00', 'Sit ut aspernatur minima illo sed omnis et unde. Officiis et tempore quibusdam et blanditiis. Consequatur laudantium sed earum. Nihil alias perspiciatis aliquid odit quis maxime.', 'Gold'),
(966, 0, 'rocky21@example.net', '00343041317', 'Josiane', '46835 Nitzsche Dale\nNorth Josianneberg, NM 83016', 'New Caleigh', '1972-06-09 00:00:00', 'Non est et ipsam aut nisi et. Perferendis vel delectus aut iste sunt. Aut quis aut voluptatem et voluptatem asperiores. Consequuntur neque velit autem est esse dolorem.', 'Free'),
(967, 0, 'wisoky.michale@example.net', '1-458-085-3935', 'Jess', '79830 Vicente Camp\nBernicefort, IN 11890-2261', 'Metzstad', '2018-03-19 00:00:00', 'Animi praesentium repellat dignissimos perspiciatis unde repellendus. Et dolorem rem sapiente maxime eius. Expedita assumenda odit amet repudiandae nesciunt ex animi. Voluptate dolorem non et minima vitae aut vel.', 'Silver'),
(968, 0, 'wswaniawski@example.org', '858.850.4938x58802', 'Cindy', '151 Jakubowski Station Suite 881\nGutkowskiborough, LA 35287-5311', 'Port Llewellynton', '1979-08-22 00:00:00', 'Asperiores dolorem similique velit. Odio architecto distinctio laudantium laboriosam. Assumenda in libero similique assumenda. Cum et et labore dolor voluptas.', 'Gold'),
(969, 0, 'littel.leslie@example.net', '(717)652-6720', 'Natalie', '887 Leilani Ville\nWest Trevion, NM 83727-5714', 'Pagacberg', '1971-01-14 00:00:00', 'Commodi nihil et laborum debitis aut. Rem impedit quia quidem tempora vel. Voluptates sunt qui quia voluptatem libero perferendis. Suscipit omnis quasi blanditiis aliquam.', 'Premium'),
(970, 0, 'sabryna18@example.org', '357-555-1269x4463', 'Chase', '5504 Berge Lodge\nRaynorhaven, VT 46004', 'East Cadenside', '2022-02-17 00:00:00', 'Enim consectetur et quibusdam a nihil. Magni voluptatem aliquam ut est omnis sapiente et dolorum. Maxime earum et sit aut.', 'Free'),
(971, 0, 'annetta55@example.net', '416-543-4442x96552', 'Marques', '4915 Brianne Pike Apt. 783\nNorth Eudoratown, NE 44937', 'East Isadore', '1999-08-09 00:00:00', 'Ea cumque dolores magnam a natus modi eos. Molestiae hic ut facere facilis odit.', 'Free'),
(972, 0, 'qprice@example.com', '1-528-069-8230x419', 'Daren', '955 Kristy Trail\nDorianhaven, UT 50989', 'Katelynville', '2013-09-13 00:00:00', 'Sapiente omnis dolorem qui veritatis et ex. Ea quia commodi nihil eligendi. Et magnam commodi tempore blanditiis.', 'Premium'),
(973, 0, 'haag.marcella@example.com', '870.053.3035', 'Elouise', '921 Schmeler Parkway Suite 995\nLoyalchester, FL 34451', 'West Meda', '1992-04-21 00:00:00', 'Delectus qui et perspiciatis. Enim et nostrum consequuntur nisi qui nam rerum ab. Totam et assumenda quod autem. Fuga debitis sequi explicabo a quia sed.', 'Gold'),
(974, 0, 'miguel71@example.org', '(085)692-3675', 'Eda', '62357 Bonita Vista\nWolfport, AR 69914-9460', 'Lake Amaraburgh', '1972-09-28 00:00:00', 'Quis dolores amet sint. Ut qui cum impedit ut. Fugit officiis dolorem dolores atque sunt quisquam nam.', 'Gold'),
(975, 0, 'hagenes.jaunita@example.com', '998.396.5229', 'Jeramy', '78841 Bahringer Square Apt. 747\nWest Izaiahville, OR 49874-6441', 'Simfort', '2010-11-30 00:00:00', 'Ut nisi quas magni et sit velit cum. Eum et rerum amet sit eum rerum. Rem quidem consequatur qui sequi. Ipsam atque quia in nulla omnis commodi numquam.', 'Free'),
(976, 0, 'fschultz@example.com', '1-858-359-5361', 'Cyril', '86272 Bernardo Rapids\nNew Chanceburgh, TN 54082', 'North Treva', '1995-07-09 00:00:00', 'Nulla illo vero quia veniam autem quia. Nisi non minus et. Maiores nesciunt cupiditate nisi consequatur rerum esse in. Et molestiae consequatur sed suscipit velit est rerum.', 'Premium'),
(977, 0, 'odie.koepp@example.org', '011.395.5028x974', 'King', '13447 Sylvia Estate Apt. 551\nSouth Scottystad, AK 64976-2626', 'Dannyberg', '1991-06-19 00:00:00', 'Aut nisi velit ut nam ea. Ratione corporis voluptate nobis quaerat qui. Quia est in harum vitae quia. Sunt deleniti recusandae optio molestias ea.', 'Premium'),
(978, 0, 'selmer.keebler@example.net', '1-030-419-4403', 'Sigurd', '616 Scarlett Prairie Apt. 002\nLake Adelaview, NH 24546-7183', 'Chazview', '2007-04-17 00:00:00', 'Ut voluptatem aut fugit neque consequatur voluptatem eum. Libero velit reprehenderit veniam dolor. Dolores et quia voluptatem. Labore consequatur harum velit sunt molestiae illum.', 'Free'),
(979, 0, 'enrico59@example.net', '1-651-531-9843x853', 'Shany', '7731 Laury Road Apt. 783\nSouth Hectorchester, NM 16604-8472', 'Borerburgh', '2010-05-30 00:00:00', 'Et nesciunt culpa odio. Autem vitae asperiores minus ex asperiores officiis. Culpa non ut expedita ut dolores temporibus.', 'Free'),
(980, 0, 'donnell90@example.com', '1-458-449-8470x63720', 'Bonita', '62558 Kunde Pine\nPort Leathafort, AK 90889', 'South Larue', '1979-01-20 00:00:00', 'Cupiditate quia in voluptas ad accusamus. Sit consequuntur veniam ut et et quos libero. Quae vitae sed quia. Eveniet a doloribus sed sed.', 'Premium'),
(981, 0, 'lewis.mraz@example.net', '00474842465', 'Hillard', '9172 Cicero Rue Suite 699\nWest Bobby, IA 60671', 'Walkerton', '2020-07-25 00:00:00', 'Vel qui aperiam qui omnis quae nihil est. Expedita dolorem architecto sit provident repudiandae recusandae sit. Nemo ducimus quia incidunt quia. Voluptatem ut voluptatum repellendus nisi repudiandae veritatis.', 'Free'),
(982, 0, 'bmedhurst@example.com', '(486)328-5215x717', 'Braxton', '8836 Clare Motorway Apt. 143\nPort Nelleburgh, KS 87744-2764', 'Lake Delaneyport', '2021-06-20 00:00:00', 'Molestiae praesentium dolor ad quod. Soluta dolorum quidem occaecati tempora quia. Corporis qui repellat quia rerum earum aut aut. Consectetur impedit voluptatem nemo.', 'Premium'),
(983, 0, 'satterfield.nelson@example.com', '593.785.6621x7110', 'Adolf', '3420 Mann Lock Apt. 143\nGislasonhaven, CT 07853-8261', 'Solonborough', '2015-12-31 00:00:00', 'Et est necessitatibus dolores non. Laborum assumenda quas voluptatibus voluptatibus. Error ut rem incidunt dicta et.', 'Free'),
(984, 0, 'lebsack.monserrat@example.net', '931-316-8486', 'Raymundo', '2311 Kayleigh Wells\nBodechester, WI 15874-6784', 'Rubyeburgh', '1993-03-01 00:00:00', 'Quia aut aut nobis asperiores et. Quisquam est hic omnis ea iusto possimus. Velit qui cupiditate ab voluptas ut fugiat qui commodi.', 'Free'),
(985, 0, 'mboyle@example.com', '930-725-4296', 'Alene', '9745 Koelpin Square\nBlockland, CT 90602-4997', 'Theresaville', '1973-07-25 00:00:00', 'Quia quisquam qui et odio fuga. Omnis error maxime occaecati consequatur.', 'Silver'),
(986, 0, 'ward.moses@example.org', '022.840.7573x56333', 'Salma', '180 Smith Road\nVolkmanborough, NY 17381', 'Lake Yazminfurt', '1991-09-21 00:00:00', 'Voluptate rerum quam quidem. Eligendi consequatur et quisquam maxime nihil ut. Maxime tempore enim dolore non enim.', 'Silver'),
(987, 0, 'chudson@example.org', '364.032.7349', 'Wayne', '02051 Hattie Mountains\nWest Maryjane, KS 10122-6441', 'Walshville', '1994-12-30 00:00:00', 'Ipsam voluptas fugiat et molestiae voluptates sed sit. Atque similique quia facilis aperiam in quis commodi a. Velit ut temporibus ratione voluptatem dolorem.', 'Silver'),
(988, 0, 'nmarquardt@example.org', '02515294892', 'Wilhelmine', '562 Angelica Forks\nSouth Ismaelmouth, MI 01515', 'Zackaryfurt', '1985-12-06 00:00:00', 'Corrupti ut libero sint et facilis. Perferendis architecto non soluta voluptatum maiores ipsum. Quasi eos ut dolores veritatis ut deserunt quisquam.', 'Free'),
(989, 0, 'jaskolski.willard@example.net', '(544)970-5663x1984', 'Jonatan', '692 Lloyd Corner\nJacobiview, AL 07783', 'Jodyborough', '2013-09-11 00:00:00', 'Qui ipsum voluptas non praesentium voluptatem est. Nobis iusto quod et aspernatur accusantium. Voluptas alias nemo qui eius recusandae. Et quaerat iure deserunt harum.', 'Premium'),
(990, 0, 'wade48@example.net', '394.777.5744x532', 'Kadin', '92852 Leannon Spurs Apt. 918\nKesslershire, DE 26383-1044', 'Lake Berneice', '1987-05-03 00:00:00', 'Officiis ut eligendi qui id. Vero error id recusandae placeat recusandae. Qui qui rerum repudiandae. Nam consequuntur commodi delectus eaque tempore omnis.', 'Premium'),
(991, 0, 'prosacco.bernard@example.net', '555.275.9605', 'Katlynn', '682 Goyette Estates Suite 358\nPort Christophefort, TX 11417-4389', 'Kiehnberg', '1985-11-06 00:00:00', 'Molestiae omnis quis atque suscipit ea amet dolores. Rem dignissimos perferendis expedita voluptates itaque tempora sit. Porro repudiandae quia voluptas dolorem ipsum provident ad.', 'Gold'),
(992, 0, 'bernhard.eryn@example.org', '181-237-5824x7086', 'Edwardo', '3198 Lorine Harbor\nFayland, ID 48366-4095', 'Maxmouth', '2008-10-18 00:00:00', 'Consequuntur error ea expedita aut natus fuga. A in magnam incidunt ipsam tempore ad debitis. Ipsum aut voluptatem sapiente recusandae dolores nam. Quia id aut sit cum repellendus ipsum accusamus.', 'Gold'),
(993, 0, 'cormier.katarina@example.com', '(326)232-5096', 'Unique', '465 Ellsworth Curve Suite 396\nPort Bennieside, IL 34958', 'Wendellfurt', '1984-08-28 00:00:00', 'Nihil id quo consequatur excepturi quo culpa. Eum repellat ut beatae odio in. Dolorum tempore distinctio consequatur voluptatem. Dolores dignissimos a eum in voluptatum eligendi facere.', 'Free'),
(994, 0, 'bart75@example.org', '07457504974', 'Adela', '685 Donnelly Station\nDexterbury, PA 40474', 'Carriechester', '1983-09-29 00:00:00', 'Dolor nemo voluptates quibusdam enim fugiat ut. Facilis ullam quas est. Velit dolore labore tenetur aut et error. Minus consequatur est aliquam maiores.', 'Premium'),
(995, 0, 'melissa.abshire@example.com', '(161)345-6069', 'Lucy', '044 Vivian Skyway Apt. 447\nStarkside, FL 57338', 'Alainashire', '1995-08-18 00:00:00', 'Earum ut vitae sit. Pariatur enim accusantium sit eum nihil dolorum ratione mollitia. Voluptas natus molestiae quos tenetur corporis.', 'Free'),
(996, 0, 'deborah.corkery@example.org', '(388)483-5353', 'Alek', '971 Jermaine Island\nKreigerstad, ME 79506-4807', 'Cassinbury', '1999-01-09 00:00:00', 'Est nesciunt eligendi molestias ut. In culpa tempore qui dignissimos recusandae et ab. Impedit aperiam iusto quia repellendus.', 'Premium'),
(997, 0, 'abalistreri@example.com', '648.301.2313x289', 'Liliane', '44614 Mitchell Mall\nEast Alexandra, UT 71880-3182', 'Dickensview', '1978-03-17 00:00:00', 'Qui aut labore rem asperiores voluptatem et. Autem minus commodi fugiat consectetur. Dolores dicta dolorem et aut possimus est. Quas ad possimus quo nisi consequatur voluptas.', 'Free'),
(998, 0, 'anabel.considine@example.com', '773.836.2149', 'Zora', '51126 Labadie Terrace\nLake Evie, AR 81704-3098', 'South Earlstad', '1980-05-27 00:00:00', 'Quia ut modi odit dolor itaque. Officiis nulla eum harum tempore dolor reprehenderit ea. Qui pariatur nihil et quia totam maiores.', 'Silver'),
(999, 0, 'lowe.melisa@example.net', '1-404-764-1625', 'Quentin', '14756 Kris Landing Apt. 425\nDomenicomouth, VT 39292-1756', 'West Babyberg', '1992-05-08 00:00:00', 'Aperiam hic autem sit modi deleniti. Eveniet dolor excepturi quibusdam. Ullam vel id qui dolore excepturi quia.', 'Premium'),
(1000, 0, 'breanne11@example.net', '583.574.2452x79233', 'Lonny', '72357 Lueilwitz Lodge Suite 690\nLeilanihaven, TX 27993', 'Lake Abdielland', '1988-11-28 00:00:00', 'Pariatur non ut sit quae et odio delectus. Ab recusandae in ratione fuga voluptatibus. Eius non earum velit natus ut vel error saepe.', 'Premium');

-- --------------------------------------------------------

--
-- Table structure for table `institusi`
--

CREATE TABLE `institusi` (
  `id` int(11) NOT NULL,
  `nama` varchar(100) DEFAULT NULL,
  `keterangan` text DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `institusi`
--

INSERT INTO `institusi` (`id`, `nama`, `keterangan`, `status`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'UPI', 'Upi', 0, NULL, NULL, NULL),
(2, 'Unikom', 'Unikom2', 1, NULL, NULL, NULL),
(3, '3', '3', 3, NULL, NULL, '2022-04-22 17:07:56');

-- --------------------------------------------------------

--
-- Table structure for table `jabatan`
--

CREATE TABLE `jabatan` (
  `id` int(11) NOT NULL,
  `nama` varchar(100) DEFAULT NULL,
  `keterangan` text DEFAULT NULL,
  `no_urut` int(11) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `jabatan`
--

INSERT INTO `jabatan` (`id`, `nama`, `keterangan`, `no_urut`, `status`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Direktur', 'abcdef', 1, 1, '2022-04-02 12:19:53', NULL, NULL),
(2, 'Sekretaris', 'abcdef', 2, 1, '2022-04-02 12:20:05', NULL, NULL),
(3, '23111', '3111', 3111, 3, '2022-04-02 12:20:10', '2022-04-02 12:20:50', '2022-04-02 12:20:50'),
(4, 'Bendahara', 'Bendahara', 3, 1, '2022-04-08 18:21:11', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `jenis_alamat`
--

CREATE TABLE `jenis_alamat` (
  `id` int(11) NOT NULL,
  `nama` varchar(50) NOT NULL,
  `keterangan` varchar(100) NOT NULL,
  `status` int(1) NOT NULL COMMENT '0 Tidak Aktif | 1 Aktif | 2 Deleted',
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT NULL ON UPDATE current_timestamp(),
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `jenis_alamat`
--

INSERT INTO `jenis_alamat` (`id`, `nama`, `keterangan`, `status`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Kost', 'Kost', 1, '2021-10-15 15:53:19', NULL, NULL),
(2, 'Domisili', 'Domisili', 1, '2021-10-15 15:53:57', NULL, NULL),
(3, 'b', 'b', 3, '2021-10-15 15:54:02', '2021-10-15 15:54:13', '2021-10-15 15:54:13'),
(4, 'Dummy', 'Detail Dummy', 3, '2021-10-15 15:55:14', '2021-10-15 15:55:21', '2021-10-15 15:55:21');

-- --------------------------------------------------------

--
-- Table structure for table `jenis_gelar`
--

CREATE TABLE `jenis_gelar` (
  `id` int(11) NOT NULL,
  `nama` varchar(50) NOT NULL,
  `keterangan` varchar(100) NOT NULL,
  `status` int(1) NOT NULL COMMENT '0 Tidak Aktif | 1 Aktif | 2 Deleted',
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT NULL ON UPDATE current_timestamp(),
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `jenis_gelar`
--

INSERT INTO `jenis_gelar` (`id`, `nama`, `keterangan`, `status`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Diploma', 'Diploma', 1, '2021-10-15 15:58:47', NULL, NULL),
(2, 'Sarjana', 'Sarjana', 1, '2021-10-15 15:58:54', NULL, NULL),
(3, 'Master', 'Master', 1, '2021-10-15 15:59:02', NULL, NULL),
(4, 'Doktor', 'Doktor', 1, '2021-10-15 15:59:09', NULL, NULL),
(5, 'Dummys', 'Detail Dummys', 3, '2021-10-15 16:00:03', '2021-10-15 16:00:11', '2021-10-15 16:00:11');

-- --------------------------------------------------------

--
-- Table structure for table `jenis_membership`
--

CREATE TABLE `jenis_membership` (
  `id` int(11) NOT NULL,
  `nama` varchar(20) NOT NULL,
  `keterangan` varchar(255) NOT NULL,
  `status` char(1) NOT NULL COMMENT '0 = dibuat, 1 = aktif, 2 = tidak aktif',
  `id_level` int(11) DEFAULT NULL,
  `created_at` date DEFAULT NULL,
  `updated_at` date DEFAULT NULL,
  `deleted_at` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `jenis_membership`
--

INSERT INTO `jenis_membership` (`id`, `nama`, `keterangan`, `status`, `id_level`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Level 1', 'Level 1', '1', NULL, '2021-10-21', '2022-02-18', NULL),
(2, 'Level 2', 'Level 2', '1', NULL, '2021-10-21', '2022-02-18', NULL),
(3, 'Level 3', 'Level 3', '1', NULL, '2021-10-21', '2022-02-18', NULL),
(4, 'Level 4', 'Level 4', '1', NULL, '2022-02-18', NULL, NULL),
(5, 'Level 5', 'Level 5', '1', NULL, '2022-02-18', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `kategorial`
--

CREATE TABLE `kategorial` (
  `id` int(11) NOT NULL,
  `nama` varchar(100) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `kategorial`
--

INSERT INTO `kategorial` (`id`, `nama`, `status`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Muda', 1, '2022-03-01 12:37:33', NULL, NULL),
(2, 'Tua', 1, '2022-03-01 12:37:38', NULL, NULL),
(3, 'Anak-anak', 1, '2022-03-01 12:37:44', '2022-03-01 12:39:25', NULL),
(4, '4', 3, '2022-03-01 12:39:30', '2022-03-01 12:39:34', '2022-03-01 12:39:34'),
(5, 'Bayi', 3, '2022-03-01 12:46:30', '2022-05-16 03:42:42', '2022-05-16 03:42:42'),
(6, 'Testing2', 3, '2022-03-02 18:16:37', '2022-03-02 18:16:51', '2022-03-02 18:16:51'),
(7, 'X Ye', 3, '2022-04-18 16:52:59', '2022-04-18 17:00:30', '2022-04-18 17:00:30'),
(8, 'ZR', 3, '2022-04-18 16:58:23', '2022-04-18 17:00:28', '2022-04-18 17:00:28'),
(9, 'R', 3, '2022-04-18 16:59:05', '2022-04-18 17:00:25', '2022-04-18 17:00:25'),
(10, 'KKM', 1, '2022-05-14 19:41:23', NULL, NULL),
(11, 'KKD', 1, '2022-05-14 19:41:27', NULL, NULL),
(12, 'Wilayah 5', 3, '2022-05-19 12:52:58', '2022-05-19 13:14:15', '2022-05-19 13:14:15'),
(13, 'Wilayah Timur', 3, '2022-05-19 12:52:58', '2022-05-19 13:14:11', '2022-05-19 13:14:11'),
(14, 'KD', 1, '2022-05-23 17:15:04', NULL, NULL),
(15, 'Pemuda', 1, '2022-05-23 17:15:04', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `kategori_keanggotaan`
--

CREATE TABLE `kategori_keanggotaan` (
  `id` int(11) NOT NULL,
  `nama` varchar(200) NOT NULL,
  `keterangan` varchar(250) NOT NULL,
  `no_urut` int(11) NOT NULL,
  `status` int(11) NOT NULL,
  `created_at` datetime DEFAULT NULL ON UPDATE current_timestamp(),
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `kategori_keanggotaan`
--

INSERT INTO `kategori_keanggotaan` (`id`, `nama`, `keterangan`, `no_urut`, `status`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'P', 'Pengunjung', 1, 1, '2022-03-27 23:43:54', '2022-03-27 23:43:54', NULL),
(2, 'A', 'Anggota', 2, 1, '2022-03-27 23:44:02', '2022-03-27 23:44:02', NULL),
(3, 'A', '', 3, 3, '2022-03-06 02:28:16', '2022-03-06 02:28:16', '2022-03-06 02:28:16'),
(4, 'L', 'Alumni', 3, 1, '2022-03-27 23:44:14', '2022-03-27 23:44:14', NULL),
(6, 'eeerrrr', 'errrr', 53, 3, '2022-05-11 04:32:55', '2022-05-11 04:32:55', '2022-05-11 04:32:55'),
(17, 'Suami', '', 0, 3, '2022-05-19 13:13:28', '2022-05-19 13:13:28', '2022-05-19 13:13:28'),
(18, 'Istri', '', 0, 3, '2022-05-19 13:13:32', '2022-05-19 13:13:32', '2022-05-19 13:13:32');

-- --------------------------------------------------------

--
-- Table structure for table `kategori_p2pk`
--

CREATE TABLE `kategori_p2pk` (
  `id` int(11) NOT NULL,
  `id_menu` int(11) NOT NULL,
  `nama` varchar(100) DEFAULT NULL,
  `keterangan` text DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `created_at` date DEFAULT NULL,
  `updated_at` date DEFAULT NULL,
  `deleted_at` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `kategori_p2pk`
--

INSERT INTO `kategori_p2pk` (`id`, `id_menu`, `nama`, `keterangan`, `status`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 97, 'U', 'Audit Umum', 1, '2021-12-10', '2021-12-16', NULL),
(2, 0, '3', '3', 3, '2021-12-10', '2021-12-10', '2021-12-10'),
(3, 97, 'K', 'Audit Khusus', 1, '2021-12-10', '2021-12-16', NULL),
(4, 0, 'Audit All 2', 'AA 2', 3, '2021-12-13', '2021-12-13', '2021-12-13'),
(5, 99, 'Repo1', '2', 3, '2021-12-16', '2021-12-16', '2021-12-16'),
(6, 98, 'M', 'SPM Mandiri', 1, '2021-12-16', NULL, NULL),
(7, 99, 'R', 'UNTUK REPOSITORY2', 1, '2021-12-16', '2021-12-16', NULL),
(8, 2, 'A2', 'Pengunjung 2', 1, '2022-02-07', '2022-03-31', NULL),
(9, 2, 'K', 'Anggota', 3, '2022-02-07', '2022-03-31', '2022-03-31'),
(10, 2, '', '', 3, '2022-03-25', '2022-03-31', '2022-03-31'),
(11, 82, 'DF', 'Data Formal', 1, '2022-05-26', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `keaktifan_pilihan`
--

CREATE TABLE `keaktifan_pilihan` (
  `id` int(11) NOT NULL,
  `nama` varchar(100) DEFAULT NULL,
  `keterangan` text DEFAULT NULL,
  `no_urut` int(11) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `keaktifan_pilihan`
--

INSERT INTO `keaktifan_pilihan` (`id`, `nama`, `keterangan`, `no_urut`, `status`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Pengarah', 'pengarah', 1, 1, '2022-05-24 07:30:14', '2022-05-24 07:33:05', NULL),
(2, 'Komisi', 'komisi', 2, 1, '2022-05-24 07:33:43', NULL, NULL),
(3, 'Kepanitiaan', 'kepanitiaan', 3, 1, '2022-05-24 07:34:02', NULL, NULL),
(4, 'Wilayahh', 'wilayah', 4, 1, '2022-05-24 07:34:17', '2022-05-24 07:37:44', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `kepanitiaan`
--

CREATE TABLE `kepanitiaan` (
  `id` int(11) NOT NULL,
  `nama` varchar(100) DEFAULT NULL,
  `keterangan` text DEFAULT NULL,
  `no_urut` int(11) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `kepanitiaan`
--

INSERT INTO `kepanitiaan` (`id`, `nama`, `keterangan`, `no_urut`, `status`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'ABC', 'abc', 1, 1, '2022-04-02 16:54:04', '2022-04-02 16:54:16', NULL),
(2, '2', '2', 2, 3, '2022-04-02 16:54:09', '2022-04-02 16:54:19', '2022-04-02 16:54:19');

-- --------------------------------------------------------

--
-- Table structure for table `keys`
--

CREATE TABLE `keys` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `key` varchar(40) NOT NULL,
  `level` int(11) DEFAULT NULL,
  `date_created` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `keys`
--

INSERT INTO `keys` (`id`, `user_id`, `key`, `level`, `date_created`) VALUES
(2, 1, 'login123456', 1, '2021-09-07 13:05:33');

-- --------------------------------------------------------

--
-- Table structure for table `kode`
--

CREATE TABLE `kode` (
  `id` int(11) NOT NULL,
  `id_menu` int(11) NOT NULL,
  `id_kategori` int(11) DEFAULT NULL,
  `kode_kategori` varchar(20) NOT NULL,
  `keterangan_kategori` varchar(200) NOT NULL,
  `kode` varchar(6) DEFAULT NULL,
  `bulan` varchar(2) DEFAULT NULL,
  `tahun` varchar(2) DEFAULT NULL,
  `jumlah` int(11) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `created_at` date DEFAULT NULL,
  `updated_at` date DEFAULT NULL,
  `deleted_at` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `kode`
--

INSERT INTO `kode` (`id`, `id_menu`, `id_kategori`, `kode_kategori`, `keterangan_kategori`, `kode`, `bulan`, `tahun`, `jumlah`, `status`, `created_at`, `updated_at`, `deleted_at`) VALUES
(17, 0, 1, 'P', 'Pengunjung', '080401', 'Ya', 'Ya', 4, 3, '2022-03-29', '2022-03-31', '2022-03-31'),
(18, 0, 4, 'L', 'Alumni', 'AL', 'Ya', 'Ya', 4, 3, '2022-03-31', '2022-03-31', '2022-03-31'),
(19, 0, 2, 'A', 'Anggota', '080401', 'Ya', 'Ya', 4, 3, '2022-03-31', '2022-03-31', '2022-03-31'),
(20, 0, 4, 'L', 'Alumni', '080401', 'Ya', 'Ya', 4, 3, '2022-03-31', '2022-03-31', '2022-03-31'),
(21, 0, 1, 'P', 'Pengunjung', '2', 'Ya', 'Ya', 2, 3, '2022-03-31', '2022-03-31', '2022-03-31'),
(22, 2, 1, 'P', 'Pengunjung', '030401', 'Ya', 'Ya', 4, 1, '2022-03-31', '2022-04-14', NULL),
(23, 2, 2, 'A', 'Anggota', '030401', 'Ya', 'Ya', 4, 1, '2022-03-31', '2022-04-14', NULL),
(24, 2, 4, 'L', 'Alumni', '080401', 'Ya', 'Ya', 4, 3, '2022-03-31', '2022-03-31', '2022-03-31'),
(25, 2, 4, 'L', 'Alumni', '080401', 'Ya', 'Ya', 4, 3, '2022-03-31', '2022-03-31', '2022-03-31'),
(26, 2, 4, 'L', 'Alumni', '080401', 'Ya', 'Ya', 6, 3, '2022-03-31', '2022-03-31', '2022-03-31'),
(27, 2, 4, 'L', 'Alumni', '080401', 'Ya', 'Ya', 7, 3, '2022-03-31', '2022-03-31', '2022-03-31'),
(28, 2, 4, 'L', 'Alumni', '030401', 'Ya', 'Ya', 8, 1, '2022-03-31', '2022-04-14', NULL),
(29, 97, 1, 'U', 'Audit Umum', 'PK', 'Ya', 'Ya', 3, 1, '2022-03-31', NULL, NULL),
(30, 82, 11, 'DF', 'Data Formal', 'PF', 'Ya', 'Ya', 4, 1, '2022-05-26', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `komisi`
--

CREATE TABLE `komisi` (
  `id` int(11) NOT NULL,
  `nama` varchar(100) DEFAULT NULL,
  `keterangan` text DEFAULT NULL,
  `no_urut` int(11) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `komisi`
--

INSERT INTO `komisi` (`id`, `nama`, `keterangan`, `no_urut`, `status`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Komisi 1', 'Komisi 1', 1, 1, '2022-04-02 16:46:12', '2022-04-08 17:31:40', NULL),
(2, '2', '2', 2, 3, '2022-04-02 16:46:16', '2022-04-02 16:46:19', '2022-04-02 16:46:19'),
(3, 'Komisi 2', 'Komisi 2', 2, 1, '2022-04-08 17:31:51', NULL, NULL),
(4, 'Komisi 3', 'Komisi 3', 3, 1, '2022-04-08 17:31:58', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `laporan_header`
--

CREATE TABLE `laporan_header` (
  `id` int(11) NOT NULL,
  `id_menu` int(11) DEFAULT NULL,
  `logo_1` varchar(250) DEFAULT NULL,
  `logo_2` varchar(250) DEFAULT NULL,
  `judul` varchar(250) DEFAULT NULL,
  `keterangan_1` varchar(250) DEFAULT NULL,
  `keterangan_2` varchar(250) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `laporan_header`
--

INSERT INTO `laporan_header` (`id`, `id_menu`, `logo_1`, `logo_2`, `judul`, `keterangan_1`, `keterangan_2`, `status`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, NULL, '8d068e43432ae65d9926b60556711213.jpg', '89b6fa414c4ad7d046d36006f531322c.jpg', 'HKB CMMS', 'HKB keterangan', 'Alamat di sini', 1, '2022-03-21 14:14:54', '2022-05-24 15:20:52', NULL),
(2, NULL, NULL, NULL, NULL, '1', '1', 3, '2022-03-21 14:15:02', '2022-03-21 14:15:49', '2022-03-21 14:15:49');

-- --------------------------------------------------------

--
-- Table structure for table `level`
--

CREATE TABLE `level` (
  `lev_id` int(11) NOT NULL,
  `lev_nama` varchar(50) NOT NULL,
  `lev_keterangan` text NOT NULL,
  `lev_status` varchar(50) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `level`
--

INSERT INTO `level` (`lev_id`, `lev_nama`, `lev_keterangan`, `lev_status`, `created_at`) VALUES
(1, 'Super Admin', 'Super Admin', 'Aktif', '2020-06-18 09:40:31'),
(123, 'Reader', 'Level default profile untuk reader', 'Aktif', '2021-10-11 10:51:53'),
(124, 'Admin Staff', '-', 'Aktif', '2021-10-12 03:30:24'),
(125, 'Partner L1', '-', 'Aktif', '2021-10-12 03:33:05'),
(126, 'Partner L2', '-', 'Aktif', '2021-10-12 03:37:42');

-- --------------------------------------------------------

--
-- Table structure for table `member`
--

CREATE TABLE `member` (
  `id` int(11) NOT NULL,
  `nama` varchar(255) DEFAULT NULL,
  `nama_panggilan` varchar(255) DEFAULT NULL,
  `no_telepon` varchar(255) DEFAULT NULL,
  `tanggal_lahir` date DEFAULT NULL,
  `jenis_kelamin` varchar(255) DEFAULT NULL,
  `alamat` text NOT NULL,
  `password` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `foto` varchar(255) NOT NULL,
  `token` varchar(255) DEFAULT NULL,
  `address_full` text DEFAULT NULL,
  `status` int(11) DEFAULT NULL COMMENT '0 Tidak Aktif | 1 Aktif | 2 Menunggu Pembayaran',
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT NULL ON UPDATE current_timestamp(),
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `membership`
--

CREATE TABLE `membership` (
  `id` int(11) NOT NULL,
  `id_profile` int(11) NOT NULL,
  `id_jenis_membership` int(11) NOT NULL,
  `id_approver` int(11) DEFAULT NULL,
  `tanggal_approval` datetime DEFAULT NULL,
  `tanggal_anggota` date NOT NULL,
  `status` char(1) NOT NULL COMMENT '0 = Meminta Persetujuan, 1 = Disetujui, 2 = Ditolak, 3 = Tidak Aktif',
  `created_at` date DEFAULT NULL,
  `updated_at` date DEFAULT NULL,
  `deleted_at` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `membership`
--

INSERT INTO `membership` (`id`, `id_profile`, `id_jenis_membership`, `id_approver`, `tanggal_approval`, `tanggal_anggota`, `status`, `created_at`, `updated_at`, `deleted_at`) VALUES
(67, 224, 1, 1, NULL, '2022-01-01', '1', NULL, NULL, NULL),
(68, 226, 5, 1, NULL, '2022-03-02', '2', NULL, NULL, NULL),
(69, 225, 4, 1, NULL, '2022-01-01', '2', NULL, NULL, NULL),
(70, 225, 3, 1, NULL, '2022-02-01', '2', NULL, NULL, NULL),
(71, 225, 5, 1, NULL, '2022-01-01', '1', NULL, NULL, NULL),
(72, 225, 4, 1, NULL, '2022-01-01', '2', NULL, NULL, NULL),
(73, 225, 4, 1, NULL, '2022-02-02', '2', NULL, NULL, NULL),
(74, 225, 3, 1, NULL, '2022-01-02', '0', NULL, NULL, NULL),
(75, 226, 4, 224, '2022-05-26 06:06:17', '2022-01-01', '1', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `membership_atasan`
--

CREATE TABLE `membership_atasan` (
  `id` int(11) NOT NULL,
  `id_profile` int(11) NOT NULL,
  `id_membership` int(11) NOT NULL,
  `id_profile_atasan` int(11) DEFAULT NULL,
  `status` char(1) NOT NULL COMMENT '1 = aktif, 2 = tidak aktif',
  `created_at` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `membership_atasan`
--

INSERT INTO `membership_atasan` (`id`, `id_profile`, `id_membership`, `id_profile_atasan`, `status`, `created_at`) VALUES
(45, 117, 44, 0, '2', '2022-03-31'),
(46, 116, 45, 0, '1', '2022-03-31'),
(47, 117, 46, 116, '2', '2022-04-03'),
(48, 118, 47, 117, '1', '2022-04-19'),
(49, 117, 48, 116, '2', '2022-04-19'),
(50, 119, 49, 0, '1', '2022-04-23'),
(51, 117, 50, 0, '2', '2022-04-23'),
(52, 117, 51, 0, '2', '2022-04-23'),
(53, 117, 52, 0, '2', '2022-04-23'),
(54, 117, 53, 0, '2', '2022-04-23'),
(55, 117, 54, 0, '2', '2022-04-23'),
(56, 117, 55, 0, '2', '2022-04-23'),
(57, 117, 56, 0, '2', '2022-04-23'),
(58, 117, 57, 0, '2', '2022-04-23'),
(59, 120, 58, 0, '2', '2022-04-26'),
(60, 117, 59, 0, '2', '2022-04-26'),
(61, 120, 60, 0, '2', '2022-04-26'),
(62, 120, 61, 0, '2', '2022-04-26'),
(63, 120, 62, 0, '2', '2022-04-26'),
(64, 120, 63, 0, '2', '2022-04-26'),
(65, 120, 64, 0, '1', '2022-04-26'),
(66, 124, 65, 0, '2', '2022-04-26'),
(67, 124, 66, 0, '2', '2022-04-26'),
(68, 224, 67, 0, '1', '0000-00-00'),
(69, 226, 68, 0, '2', '0000-00-00'),
(70, 225, 69, 0, '2', '0000-00-00'),
(71, 225, 70, 0, '2', '0000-00-00'),
(72, 225, 71, 0, '2', '0000-00-00'),
(73, 225, 72, 0, '1', '0000-00-00'),
(74, 225, 73, 0, '1', '0000-00-00'),
(75, 225, 74, 0, '1', '0000-00-00'),
(76, 226, 75, 0, '2', '0000-00-00');

-- --------------------------------------------------------

--
-- Table structure for table `menu`
--

CREATE TABLE `menu` (
  `menu_id` int(11) NOT NULL,
  `menu_menu_id` int(11) NOT NULL,
  `menu_nama` varchar(50) NOT NULL,
  `menu_keterangan` text NOT NULL,
  `menu_index` int(11) NOT NULL,
  `menu_icon` varchar(50) NOT NULL,
  `menu_url` varchar(100) NOT NULL,
  `menu_status` varchar(50) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `menu`
--

INSERT INTO `menu` (`menu_id`, `menu_menu_id`, `menu_nama`, `menu_keterangan`, `menu_index`, `menu_icon`, `menu_url`, `menu_status`, `created_at`) VALUES
(1, 0, 'Dashboard', '-', 1, 'fa fa-suitcase', 'admin/dashboard', 'Aktif', '2020-06-18 02:40:07'),
(2, 0, 'Users', '-', 7, 'fa fa-cogs', '#', 'Aktif', '2020-06-18 02:40:07'),
(3, 2, 'Hak Akses', '-', 8, 'far fa-circle', 'pengaturan/hakAkses', 'Aktif', '2020-06-18 02:40:07'),
(4, 2, 'Menu', '-', 9, 'far fa-circle', 'pengaturan/menu', 'Aktif', '2020-06-18 02:40:07'),
(5, 0, 'User role', '-', 7, 'fas fa-user-check', 'pengaturan/level', 'Aktif', '2020-06-18 02:40:07'),
(6, 2, 'Pengguna', '-', 2, 'far fa-circle', 'pengaturan/pengguna', 'Aktif', '2020-06-18 02:40:07'),
(7, 2, 'Ganti Password', 'Ganti password', 4, 'fa fa-key', 'pengaturan/password', 'Aktif', '2021-06-28 08:34:14'),
(82, 0, 'Master', '-', 9, 'fa fa-database', '#', 'Aktif', '2021-08-25 09:03:41'),
(96, 82, 'Company', '-', 1, 'fas fa-handshake', 'data-master/company', 'Aktif', '2021-09-23 05:26:15'),
(97, 0, 'P2PK', '-', 2, 'fas fa-money-check-alt', 'p2pk/listP2PK', 'Aktif', '2021-09-23 05:26:15'),
(98, 0, 'SPM', '-', 3, 'fas fa-tasks', 'spm/listSPM', 'Aktif', '2021-09-23 05:26:15'),
(99, 0, 'Repository', '-', 4, 'fa fa-file', 'repository/listRepository', 'Aktif', '2021-09-23 05:26:15'),
(100, 120, 'Logging', '-', 3, 'fa fa-history', 'activity/logging', 'Aktif', '2021-09-23 05:26:15'),
(101, 82, 'Resiko', '-', 2, 'fas fa-tasks', 'data-master/resiko', 'Aktif', '2021-09-23 05:32:02'),
(102, 82, 'Membership', '-', 3, 'fas fa-users', 'data-master/membership', 'Aktif', '2021-09-23 05:34:00'),
(103, 82, 'Tipe Kontak', '-', 4, 'fas fa-users', 'data-master/tipeKontak', 'Aktif', '2021-09-23 05:34:39'),
(104, 2, 'Data Member', '-', 1, 'fas fa-users', 'pengaturan/profile', 'Aktif', '2021-09-23 05:35:13'),
(106, 2, 'Partner', '-', 0, 'fas fa-users', 'data-master/partner', 'Aktif', '2021-09-28 07:15:00'),
(109, 82, 'Data Formal', 'List Peristiwa', 3, ' far fa-circle', 'data-master/peristiwa', 'Aktif', '2021-10-05 01:04:18'),
(110, 82, 'Jenis Alamat', '-', 5, 'far fa-circle', 'data-master/jenisAlamat', 'Aktif', '2021-10-18 06:31:55'),
(111, 82, 'Jenis Gelar', '-', 6, 'far fa-circle', 'data-master/jenisGelar', 'Aktif', '2021-10-18 06:32:10'),
(112, 2, 'Profile', '-', 3, 'fas fa-users', 'pengaturan/profile/lihat', 'Aktif', '2021-10-20 09:35:51'),
(113, 82, 'Term Management', '-', 7, 'far fa-circle', 'data-master/termManagement', 'Aktif', '2021-11-03 07:34:54'),
(114, 0, 'Aktifitas', '-', 5, 'fas fa-tasks', 'activity/master', 'Aktif', '2021-11-15 11:06:38'),
(115, 82, 'Trainer', '-', 8, 'far fa-circle', 'data-master/trainer', 'Aktif', '2021-11-16 09:58:32'),
(116, 82, 'Kategori', '-', 9, 'far fa-circle', 'data-master/kategori', 'Aktif', '2021-12-10 03:52:04'),
(117, 82, 'Kode', '-', 10, 'far fa-circle', 'data-master/kode', 'Aktif', '2021-12-10 03:52:23'),
(118, 82, 'File Template', '-', 8, 'far fa-circle', 'data-master/template', 'Aktif', '2022-01-14 06:54:15'),
(119, 120, 'Version', '-', 10, 'far fa-circle', 'data-master/version', 'Aktif', '2022-01-21 04:08:37'),
(120, 0, 'Utilities', '-', 10, 'fa fa-cog', '#', 'Aktif', '2022-02-08 20:52:00'),
(121, 120, 'Application setting', '-', 1, 'far fa-circle', 'utilities/applicationSetting', 'Aktif', '2022-02-08 20:53:28'),
(122, 120, 'Dashboard Activation', '-', 3, 'far fa-circle', 'utilities/dashboardActivation', 'Aktif', '2022-02-09 07:32:38'),
(123, 120, 'Module Activation', '-', 3, 'far fa-circle', 'utilities/moduleActivation', 'Aktif', '2022-02-09 07:54:31'),
(125, 82, 'Posisi', '-', 6, 'far fa-circle', 'partner/posisi', 'Aktif', '2022-03-01 02:40:49'),
(126, 82, 'Kategorial Umur', '-', 4, 'far fa-circle', 'pengaturan/kategorial-umur', 'Aktif', '2022-03-01 05:07:12'),
(127, 82, 'Wilayah', '-', 5, 'far fa-circle', 'pengaturan/wilayah', 'Aktif', '2022-03-01 05:07:33'),
(128, 82, 'Kategori Keanggotaan', '-', 9, 'far fa-circle', 'data-master/kategoriKeanggotaan', 'Aktif', '2022-03-05 19:24:42'),
(129, 120, 'Laporan Header', '-', 8, 'far fa-circle', 'data-master/laporan-header', 'Aktif', '2022-03-21 05:01:51'),
(132, 82, 'Jabatan', '-', 11, 'far fa-circle', 'data-master/jabatan', 'Aktif', '2022-04-01 19:07:25'),
(133, 82, 'Pengarah', '-', 12, 'far fa-circle', 'data-master/pengarah', 'Aktif', '2022-04-01 19:07:49'),
(134, 82, 'Komisi', '-', 13, 'far fa-circle', 'data-master/komisi', 'Aktif', '2022-04-01 19:08:19'),
(135, 82, 'Kepanitiaan', '-', 14, 'far fa-circle', 'data-master/kepanitiaan', 'Aktif', '2022-04-01 19:08:54'),
(136, 120, 'Institusi', '-', 3, 'far fa-circle', 'data-master/institusi', 'Aktif', '2022-04-22 10:02:07'),
(137, 0, 'Laporan', '-', 9, 'fas fa-book', '#', 'Aktif', '2022-05-09 08:46:36'),
(138, 120, 'Export Import Data Member ', '-', 1, 'far fa-circle', 'laporan/member', 'Aktif', '2022-05-09 08:47:33'),
(139, 82, 'Pilihan Keaktifan', '-', 14, 'far fa-circle', 'data-master/pilihanKeaktifan', 'Aktif', '2022-05-24 00:20:56'),
(140, 0, 'Resource', '-', 2, 'fas fa-save', '#', 'Aktif', '2022-05-28 07:34:15'),
(142, 140, 'Ebook', '-', 1, 'far fa-circle', 'admin/resource/ebook', 'Aktif', '2022-05-28 07:41:45'),
(143, 140, 'Video', '-', 2, 'far fa-circle', 'admin/resource/video', 'Aktif', '2022-05-28 07:42:09'),
(144, 140, 'Audiobooks', '-', 3, 'fa fa-suitcase', 'admin/resource/audiobooks', 'Aktif', '2022-05-28 07:42:31'),
(145, 140, 'Podcast', '-', 4, 'fa fa-suitcase', 'admin/resource/podcast', 'Aktif', '2022-05-28 07:42:59'),
(146, 140, 'Articles', '-', 5, 'far fa-circle', 'admin/resource/articles', 'Aktif', '2022-05-28 07:43:25'),
(147, 140, 'Music', '-', 6, 'fa fa-suitcase', 'admin/resource/music', 'Aktif', '2022-05-28 07:43:47'),
(148, 0, 'Categories', '-', 3, 'fas fa-project-diagram', 'admin/categories', 'Aktif', '2022-05-28 07:47:19'),
(151, 0, 'Transaction', '-', 4, 'fas fa-receipt', 'admin/transaction', 'Aktif', '2022-05-28 07:52:09'),
(152, 0, 'Pricing', '-', 5, 'fas fa-dollar-sign', 'admin/pricing', 'Aktif', '2022-05-28 14:34:55'),
(153, 0, 'Member', '-', 6, 'fas fa-list', '3', 'Aktif', '2022-05-29 20:32:08'),
(154, 153, 'Individual', '-', 1, 'far fa-circle', 'admin/member/individual', 'Aktif', '2022-05-29 20:32:51'),
(155, 153, 'Organization', '-', 2, 'far fa-circle', 'admin/member/organization', 'Aktif', '2022-05-29 20:33:38');

-- --------------------------------------------------------

--
-- Table structure for table `module_activation`
--

CREATE TABLE `module_activation` (
  `id` int(11) NOT NULL,
  `p2pk` int(11) DEFAULT NULL,
  `spm` int(11) DEFAULT NULL,
  `repository` int(11) DEFAULT NULL,
  `aktifitas` int(11) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `module_activation`
--

INSERT INTO `module_activation` (`id`, `p2pk`, `spm`, `repository`, `aktifitas`, `status`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 2, 2, 2, 2, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `notifikasi`
--

CREATE TABLE `notifikasi` (
  `id` int(11) NOT NULL,
  `dari` int(11) DEFAULT NULL,
  `ke` int(11) DEFAULT NULL,
  `judul` varchar(100) DEFAULT NULL,
  `keterangan` text DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `delteted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `notifikasi`
--

INSERT INTO `notifikasi` (`id`, `dari`, `ke`, `judul`, `keterangan`, `status`, `created_at`, `updated_at`, `delteted_at`) VALUES
(149, 1, NULL, 'Non-Aktif Membership', 'Membership dengan email:  telah berhasil di non-aktifkan sebagai ', 0, '2022-03-31 04:59:50', NULL, NULL),
(150, 1, 117, 'Pengajuan Membership', 'Pengajuan membership dengan email: nurulafanti@mailinator.com telah berhasil dimintakan persetujuan sebagai Level 2', 0, '2022-04-03 11:40:42', NULL, NULL),
(151, 1, 116, 'Pengajuan Membership', 'Pengajuan membership dengan email: nurulafanti@mailinator.com telah berhasil dimintakan persetujuan sebagai Level 2', 1, '2022-04-03 11:40:44', NULL, NULL),
(152, 153, 117, 'Approval Membership', 'Pengajuan membership dengan email: nurulafanti@mailinator.com telah berhasil dimintakan persetujuan sebagai Level 2', 0, '2022-04-03 11:41:15', NULL, NULL),
(153, 1, 118, 'Pengajuan Membership', 'Pengajuan membership dengan email: dandi@mailinator.com telah berhasil dimintakan persetujuan sebagai Level 5', 0, '2022-04-19 08:30:25', NULL, NULL),
(154, 1, 117, 'Pengajuan Membership', 'Pengajuan membership dengan email: dandi@mailinator.com telah berhasil dimintakan persetujuan sebagai Level 5', 0, '2022-04-19 08:30:26', NULL, NULL),
(155, 1, 118, 'Pengajuan Membership', 'Pengajuan membership dengan email: dandi@mailinator.com telah berhasil dimintakan persetujuan sebagai Level 5', 0, '2022-04-19 08:30:28', NULL, NULL),
(156, 1, 117, 'Pengajuan Membership', 'Pengajuan membership dengan email: dandi@mailinator.com telah berhasil dimintakan persetujuan sebagai Level 5', 0, '2022-04-19 08:30:29', NULL, NULL),
(157, 1, 117, 'Pengajuan Membership', 'Pengajuan membership dengan email: nurulafanti@mailinator.com telah berhasil dimintakan persetujuan sebagai Level 4', 0, '2022-04-19 08:39:09', NULL, NULL),
(158, 1, 116, 'Pengajuan Membership', 'Pengajuan membership dengan email: nurulafanti@mailinator.com telah berhasil dimintakan persetujuan sebagai Level 4', 1, '2022-04-19 08:39:10', NULL, NULL),
(159, 153, 117, 'Approval Membership', 'Pengajuan membership dengan email: nurulafanti@mailinator.com telah berhasil dimintakan persetujuan sebagai Level 4', 0, '2022-04-19 08:39:33', NULL, NULL),
(160, 1, 119, 'Pengajuan Membership', 'Pengajuan membership dengan email: abik.hendrik@mailinator.com telah berhasil dimintakan persetujuan sebagai Level 3', 0, '2022-04-23 04:15:21', NULL, NULL),
(161, 1, NULL, 'Pengajuan Membership', 'Pengajuan membership dengan email: abik.hendrik@mailinator.com telah berhasil dimintakan persetujuan sebagai ', 0, '2022-04-23 04:15:22', NULL, NULL),
(162, 1, 117, 'Pengajuan Membership', 'Pengajuan membership dengan email: nurulafanti@mailinator.com telah berhasil dimintakan persetujuan sebagai Level 5', 0, '2022-04-23 04:22:32', NULL, NULL),
(163, 1, NULL, 'Pengajuan Membership', 'Pengajuan membership dengan email: nurulafanti@mailinator.com telah berhasil dimintakan persetujuan sebagai ', 0, '2022-04-23 04:22:33', NULL, NULL),
(164, 153, 117, 'Approval Membership', 'Pengajuan membership dengan email: nurulafanti@mailinator.com telah berhasil dimintakan persetujuan sebagai Level 5', 0, '2022-04-23 04:22:50', NULL, NULL),
(165, 1, 117, 'Pengajuan Membership', 'Pengajuan membership dengan email: nurulafanti@mailinator.com telah berhasil dimintakan persetujuan sebagai Level 3', 0, '2022-04-23 04:27:22', NULL, NULL),
(166, 1, NULL, 'Pengajuan Membership', 'Pengajuan membership dengan email: nurulafanti@mailinator.com telah berhasil dimintakan persetujuan sebagai ', 0, '2022-04-23 04:27:23', NULL, NULL),
(167, 153, 117, 'Approval Membership', 'Pengajuan membership dengan email: nurulafanti@mailinator.com telah berhasil dimintakan persetujuan sebagai Level 3', 0, '2022-04-23 04:28:12', NULL, NULL),
(168, 154, 117, 'Pengajuan Membership', 'Pengajuan membership dengan email: nurulafanti@mailinator.com telah berhasil dimintakan persetujuan sebagai Level 2', 0, '2022-04-23 04:46:31', NULL, NULL),
(169, 154, NULL, 'Pengajuan Membership', 'Pengajuan membership dengan email: nurulafanti@mailinator.com telah berhasil dimintakan persetujuan sebagai ', 0, '2022-04-23 04:46:32', NULL, NULL),
(170, 154, 117, 'Approval Membership', 'Pengajuan membership dengan email: nurulafanti@mailinator.com telah berhasil dimintakan persetujuan sebagai Level 2', 0, '2022-04-23 04:46:40', NULL, NULL),
(171, 1, 117, 'Pengajuan Membership', 'Pengajuan membership dengan email: nurulafanti@mailinator.com telah berhasil dimintakan persetujuan sebagai Level 3', 0, '2022-04-23 04:52:59', NULL, NULL),
(172, 1, NULL, 'Pengajuan Membership', 'Pengajuan membership dengan email: nurulafanti@mailinator.com telah berhasil dimintakan persetujuan sebagai ', 0, '2022-04-23 04:53:00', NULL, NULL),
(173, 154, 117, 'Approval Membership', 'Pengajuan membership dengan email: nurulafanti@mailinator.com telah berhasil dimintakan persetujuan sebagai Level 3', 0, '2022-04-23 04:59:51', NULL, NULL),
(174, 1, 120, 'Pengajuan Membership', 'Pengajuan membership dengan email: agnia.hendrik@mailinator.com telah berhasil dimintakan persetujuan sebagai Level 3', 0, '2022-04-26 06:58:32', NULL, NULL),
(175, 1, NULL, 'Pengajuan Membership', 'Pengajuan membership dengan email: agnia.hendrik@mailinator.com telah berhasil dimintakan persetujuan sebagai ', 0, '2022-04-26 06:58:33', NULL, NULL),
(176, 1, 117, 'Pengajuan Membership', 'Pengajuan membership dengan email: nurulafanti@mailinator.com telah berhasil dimintakan persetujuan sebagai Level 2', 0, '2022-04-26 07:02:40', NULL, NULL),
(177, 1, NULL, 'Pengajuan Membership', 'Pengajuan membership dengan email: nurulafanti@mailinator.com telah berhasil dimintakan persetujuan sebagai ', 0, '2022-04-26 07:02:41', NULL, NULL),
(178, 153, 117, 'Approval Membership', 'Pengajuan membership dengan email: nurulafanti@mailinator.com telah berhasil dimintakan persetujuan sebagai Level 2', 0, '2022-04-26 07:03:18', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `organization`
--

CREATE TABLE `organization` (
  `id` int(11) NOT NULL,
  `email` varchar(255) NOT NULL,
  `phone` varchar(255) NOT NULL,
  `filled` int(11) NOT NULL,
  `max` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `address` text NOT NULL,
  `city` text NOT NULL,
  `since` datetime NOT NULL,
  `description` varchar(255) NOT NULL,
  `packet` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `organization`
--

INSERT INTO `organization` (`id`, `email`, `phone`, `filled`, `max`, `name`, `address`, `city`, `since`, `description`, `packet`) VALUES
(1, 'morar.wilfredo@example.net', '867-369-9185x467', 23, 20, 'Vilma', '6811 Hills Forest Apt. 127\nLake Raquelburgh, GA 14086', 'Mosciskiborough', '2020-11-30 00:00:00', 'Cum perspiciatis quidem ea possimus nemo omnis temporibus voluptas. Deleniti eum asperiores porro doloremque quidem non. Quidem voluptatum ut facere explicabo quia consectetur sunt aspernatur. Quisquam odio autem repellendus sunt et quos rerum.', 'Premium'),
(2, 'satterfield.aurelia@example.com', '598-280-1306x69644', 28, 20, 'Isadore', '184 Romaguera Landing\nMarcellusshire, KS 23315-2930', 'Marvinmouth', '2017-01-06 00:00:00', 'Aut magnam aut vitae tenetur. Quia beatae odit ab pariatur ullam. Soluta minima autem eligendi.', 'Silver'),
(3, 'etowne@example.com', '138.837.2612', 28, 10, 'Leopoldo', '74129 Nova Garden\nCandidoland, ND 98803-4704', 'Brittanybury', '2006-01-13 00:00:00', 'Quidem repudiandae dolor est laborum eveniet sint aliquid illum. Dolorum quia doloremque aperiam soluta sed repellat. Et non neque sunt mollitia.', 'Gold'),
(4, 'vhauck@example.com', '(204)759-9780x773', 27, 10, 'Jaren', '70583 Boehm Light\nFisherview, ND 00867-0797', 'East Kalliebury', '1971-03-03 00:00:00', 'Voluptatem eius assumenda esse iusto. Sit id labore odio aperiam ex sint cupiditate. Aut cum officiis et nisi deserunt fugiat in.', 'Silver'),
(5, 'baby25@example.net', '182.441.4763', 10, 30, 'Yazmin', '5435 Harley Unions\nPort Berniceville, MD 50341', 'Freemanstad', '1984-12-07 00:00:00', 'Nemo adipisci aut pariatur. Explicabo magni ad maxime optio et soluta. Sapiente voluptates quidem dolorum ea optio iusto. Enim numquam qui qui non quia est.', 'Gold'),
(6, 'jordy.grady@example.org', '106.983.9029x079', 15, 20, 'Delfina', '066 Kennedy Hills Suite 960\nGreysonton, NY 90118', 'New Arden', '2016-07-28 00:00:00', 'Quae est ut nisi qui voluptate. A et sed et pariatur quia consequatur hic. Veniam enim earum voluptate molestiae veritatis.', 'Premium'),
(7, 'lenna.jast@example.net', '356.783.4421x5865', 2, 30, 'Loma', '34051 Tyra Mountains\nSatterfieldchester, WV 74110', 'Luigitown', '1995-06-25 00:00:00', 'Et corporis architecto tenetur quos sapiente. Corporis ut doloribus quae earum ut quos. In voluptates architecto quia qui facilis. Corrupti explicabo illum deserunt unde porro ab beatae.', 'Premium'),
(8, 'jamir.dicki@example.net', '358.250.6464x446', 5, 20, 'Clementine', '6649 Allen Lake\nWest Clareberg, IA 51637', 'Mohammadside', '2014-08-01 00:00:00', 'Sed aut voluptatem deleniti ratione quia aspernatur. Amet quidem voluptatem molestiae ipsum explicabo eveniet. Vel recusandae incidunt eius illum. Ab recusandae et non ab.', 'Gold'),
(9, 'heaven.schowalter@example.com', '144-791-1040x21758', 24, 10, 'Cyrus', '09465 Thompson Inlet Apt. 182\nAdamschester, VT 20803', 'East Adaline', '2002-11-17 00:00:00', 'Consectetur sint vel harum et tempore in quas. Nisi consequuntur molestiae sint facilis et velit. Consectetur exercitationem earum qui maiores molestiae.', 'Premium'),
(10, 'schulist.verna@example.org', '08822153469', 16, 30, 'Drew', '3324 Botsford Throughway Suite 984\nXzaviershire, OR 93038', 'New Florineberg', '1988-12-07 00:00:00', 'Autem voluptatem voluptatibus occaecati necessitatibus corrupti numquam omnis. Minima repellendus sequi ab.', 'Gold'),
(11, 'lherzog@example.org', '(691)768-1486x29375', 3, 30, 'Isabell', '5279 Tromp Meadow Apt. 862\nWest Katharina, MO 20290', 'Nitzschemouth', '2016-05-25 00:00:00', 'Velit earum magnam quia sint officiis omnis sint ea. Facere eligendi sunt sunt accusamus quos dolorum maiores. Dolorem dolorum voluptas quasi ea sed. Suscipit vitae animi qui dolores.', 'Gold'),
(12, 'gerlach.elliott@example.com', '156.406.8668x1095', 12, 30, 'Chet', '186 Orval Street\nEmieborough, NM 62891-6929', 'East Yolandaland', '1982-04-04 00:00:00', 'Quo voluptatum alias qui laboriosam est velit in occaecati. Dolorum quos sit ex et. Labore nesciunt voluptatem velit aut.', 'Silver'),
(13, 'hdubuque@example.net', '753.042.5142', 3, 20, 'Rickey', '569 Miguel Throughway\nHarleyside, OH 21931-9559', 'Deannaberg', '2014-02-13 00:00:00', 'Tempora culpa aut incidunt veritatis deleniti minus non ut. Odio neque iste officiis ea. Deserunt placeat quos eligendi veritatis et. Vel cum quibusdam minima eum necessitatibus.', 'Gold'),
(14, 'bkreiger@example.net', '(077)203-7235', 21, 10, 'Derrick', '697 Jamarcus Flat Apt. 886\nKeshaunside, FL 58097-3779', 'Port Kade', '1995-02-01 00:00:00', 'Iste totam excepturi aut eos et porro assumenda nesciunt. Assumenda corporis soluta omnis a aut dolore ut. Ad aut impedit quibusdam repellendus consequatur earum.', 'Premium'),
(15, 'gheller@example.org', '(888)142-2297x284', 4, 30, 'Amelia', '3955 Turcotte Loop Apt. 427\nEast Declan, LA 54734-3874', 'Stellafort', '2002-05-04 00:00:00', 'Natus consequatur itaque eum cupiditate sit laboriosam harum ullam. Veniam maiores facere blanditiis adipisci labore. Molestiae est eveniet accusantium et laborum. Voluptates aut ab minus incidunt molestias impedit.', 'Gold'),
(16, 'archibald50@example.com', '(043)428-1836x307', 23, 30, 'Mekhi', '374 Stoltenberg Groves Apt. 514\nStrosinburgh, ME 86518', 'Weimannmouth', '1992-01-31 00:00:00', 'Eum dicta quo iure officiis fugit qui dolores. Cupiditate commodi et quasi dolore ipsum. Repellat minus sunt nisi qui aut illo rerum. Facere adipisci ut dicta excepturi aut porro ut.', 'Gold'),
(17, 'hrenner@example.org', '661.993.1108', 25, 10, 'Lukas', '02417 Brown Bridge\nReynaborough, GA 48210-7865', 'Juwanshire', '1971-12-21 00:00:00', 'Qui nemo rem sit dolores ad ut rerum. Facere in expedita enim totam at rerum sequi et. Voluptatum quibusdam ex natus laudantium ea.', 'Premium'),
(18, 'brandy23@example.net', '(661)585-8642', 28, 10, 'Bailey', '669 Ruthie Streets Apt. 966\nWest Romatown, FL 99065', 'Imeldaton', '1988-10-31 00:00:00', 'Libero repudiandae cupiditate ut et veritatis mollitia. Sit culpa ut voluptas illum.', 'Gold'),
(19, 'donna18@example.net', '1-735-022-9666x1889', 6, 10, 'Rollin', '515 Kaden Trace Apt. 307\nNew Modestaburgh, LA 02016-3551', 'Wildermanside', '2019-07-09 00:00:00', 'Officiis quibusdam minus aspernatur officia qui architecto corrupti. Nisi quod non dolorem assumenda suscipit. Voluptas adipisci necessitatibus enim suscipit.', 'Gold'),
(20, 'rauer@example.com', '406-738-0176x691', 28, 10, 'Jesus', '55273 Reilly Isle Suite 382\nLake Odatown, IL 19383-4310', 'North Lionel', '1982-06-23 00:00:00', 'In quasi aut molestiae ut. Libero rerum incidunt sint voluptate et.', 'Silver'),
(21, 'nellie.halvorson@example.net', '(131)894-9384x08370', 6, 30, 'Sister', '366 Langworth Springs Apt. 264\nPort Ferne, NV 92989', 'Jarrodstad', '1977-10-17 00:00:00', 'Fugit quia ut molestiae quia consequuntur. Aliquid culpa quae eveniet.', 'Premium'),
(22, 'crooks.nina@example.org', '087.082.4635', 27, 30, 'Fay', '13503 Hackett Highway Apt. 078\nNorth Florencio, CA 53205-2784', 'New Ken', '1988-09-07 00:00:00', 'Est voluptatibus aut ut nihil. Repellendus vero qui nostrum laboriosam enim pariatur soluta. Soluta maxime enim odit pariatur facilis.', 'Premium'),
(23, 'eleanore12@example.com', '323-663-2563x973', 24, 20, 'Brielle', '95482 Mike Expressway Suite 073\nPalmashire, NH 54561-3596', 'Doyleside', '1997-05-01 00:00:00', 'Voluptatem cum nobis delectus architecto sit similique ex. Perspiciatis est aut est fuga voluptas. Voluptas magni quod aut excepturi. Sunt ea repudiandae ea nemo sunt repudiandae nisi.', 'Premium'),
(24, 'roger82@example.net', '05212500318', 21, 10, 'Cory', '5158 Christ Pike\nNew Gerhardport, DC 99534', 'South Kayleychester', '2018-01-01 00:00:00', 'Molestias dolor ducimus beatae nam dolorum quae. Temporibus voluptatem suscipit enim hic quasi. Nihil occaecati distinctio qui quasi voluptate.', 'Gold'),
(25, 'ariel.gleason@example.org', '441-002-1695x2073', 20, 30, 'Annalise', '468 Wuckert Coves Suite 165\nLake Hallie, PA 33390', 'Alvertafort', '1987-06-05 00:00:00', 'Explicabo voluptate cum est et tempora. Autem fugit et id ducimus. Accusantium et labore libero cupiditate vitae et. Et autem nobis provident qui.', 'Premium'),
(26, 'jonathon.watsica@example.org', '1-862-094-5693x488', 23, 10, 'Bettie', '90475 Leonie Greens\nDiannamouth, OK 51598', 'Port Juliet', '1972-01-22 00:00:00', 'Ex hic sed ea voluptates. Rerum et quod ut impedit et excepturi. Eos et in ut est et. Vel voluptate cupiditate commodi aspernatur amet necessitatibus.', 'Silver'),
(27, 'aemmerich@example.org', '1-969-963-3115x2284', 24, 20, 'Laverna', '721 Brekke Shore Apt. 762\nAlexannechester, AR 30475-9524', 'Lornabury', '2005-09-15 00:00:00', 'Nihil est fugit non ex qui. Molestias accusantium at dolore veritatis. Corrupti sit quia aut eos.', 'Gold'),
(28, 'zrowe@example.net', '516.797.3226x2398', 20, 30, 'Tomasa', '5467 Collin Villages\nKennethberg, IL 78828-3989', 'Allenefort', '1983-11-14 00:00:00', 'Quasi provident hic et eaque voluptatem sit rerum. Voluptatem omnis delectus animi possimus velit est voluptatem. Nulla deleniti repellat iusto ipsum assumenda. Autem voluptates id consequatur recusandae quia dolore.', 'Silver'),
(29, 'icrist@example.com', '04247702520', 29, 30, 'Kennedy', '301 Thurman Highway Suite 158\nVerdiemouth, TN 18913', 'Schimmelville', '1999-12-02 00:00:00', 'Est possimus similique aut dolores. Tempore mollitia neque voluptatem tempora id cupiditate. Eaque aut sunt quam enim quia autem inventore.', 'Silver'),
(30, 'liza45@example.com', '02660014822', 20, 10, 'Jade', '34412 Champlin Rapid\nMyrtiechester, ND 18249-2576', 'West Candidoside', '2014-04-17 00:00:00', 'Hic iusto eveniet corporis rerum deleniti blanditiis quo. Quia recusandae blanditiis repudiandae quia consequuntur. Beatae quis dolore et et aut quod enim. Consequatur labore consequatur aspernatur est sequi. Quis quia quis at alias facere qui.', 'Gold'),
(31, 'jschimmel@example.com', '333.673.6994', 11, 10, 'Abelardo', '832 Wilhelm Cliffs\nMackenzieville, RI 62222-6501', 'New Veronica', '2003-07-14 00:00:00', 'Tempore at odit quisquam sunt voluptas. Fuga sunt blanditiis hic expedita facilis perferendis quod.', 'Silver'),
(32, 'anastacio.oberbrunner@example.com', '1-224-764-9183x96024', 5, 20, 'Janae', '9683 Rutherford Shoals Suite 629\nNorth Kip, MA 44711', 'Lake Elisa', '1996-08-18 00:00:00', 'Qui beatae ut ut ut blanditiis delectus autem. Quibusdam deserunt sunt temporibus totam tenetur ut ut. Quaerat aperiam ad veritatis et nisi quas ipsa. Architecto quod et sunt dolores ut molestias.', 'Premium'),
(33, 'bstokes@example.net', '(843)121-8450x5691', 5, 30, 'Monica', '814 Sabryna Manor Apt. 965\nEast Jarenfurt, WY 90033', 'Pourosbury', '2019-02-07 00:00:00', 'Non atque praesentium enim eius deleniti nesciunt corporis veniam. Dolor laudantium ut repellendus. Dolor aut libero exercitationem est. Quidem cupiditate nam dolore suscipit voluptate omnis eos.', 'Premium'),
(34, 'wkoch@example.net', '(591)031-2772', 15, 20, 'Mark', '86432 Stracke Roads\nWatsicamouth, MA 49845', 'Jonatanmouth', '2012-09-19 00:00:00', 'Tempora qui doloremque eaque dignissimos molestiae. Libero consectetur autem rerum iusto sapiente voluptas officiis exercitationem. Labore corporis perferendis voluptatem alias repellendus quaerat praesentium. Sint suscipit est sit quaerat et.', 'Silver'),
(35, 'shannon.herzog@example.org', '(965)458-2256x399', 27, 10, 'Friedrich', '9930 Mertz Prairie\nRafaelafort, IL 75432-8888', 'Edmundmouth', '2018-02-13 00:00:00', 'Error minus quisquam eum nemo nemo harum. Voluptatem ea eveniet aut reiciendis et natus commodi. Molestias quia ullam voluptatem inventore in voluptas. Quod doloremque et expedita quis id quos.', 'Gold'),
(36, 'zzieme@example.net', '200.165.6576x8942', 2, 20, 'Scarlett', '58884 Borer Knolls Apt. 315\nHeidenreichstad, RI 03480-4565', 'Adamsview', '1983-01-29 00:00:00', 'Explicabo alias velit iusto quos aperiam sint consequatur. Animi vitae in enim similique.', 'Premium'),
(37, 'jamar54@example.org', '907.565.5184', 7, 10, 'Freddie', '23781 Bechtelar Lock Suite 601\nSchulistberg, AR 94920-2137', 'Guadalupechester', '1979-02-14 00:00:00', 'Velit eaque esse et molestiae corrupti molestiae ut. Praesentium quod magnam quia quisquam aut eius nam deserunt.', 'Premium'),
(38, 'naomi94@example.net', '(004)504-5761x870', 15, 30, 'Brandon', '50895 Gleason Passage Apt. 405\nLake Kenyon, OK 05944-9682', 'New Raybury', '2002-02-10 00:00:00', 'Ad ipsa dolores ut soluta cupiditate ut. Aut quia qui expedita odit quod ut dolor. Enim fugiat deserunt animi sint totam quia.', 'Gold'),
(39, 'lebsack.lacy@example.com', '+67(9)9982491280', 11, 10, 'Ana', '91398 Smitham Gardens Apt. 594\nWest Coleman, MS 62240', 'North Madyson', '1978-02-16 00:00:00', 'Aut omnis animi non est iure voluptas natus. Hic eveniet delectus autem beatae ratione. Inventore eos quibusdam dolorem et ullam.', 'Premium'),
(40, 'heaney.eleanore@example.com', '271.934.3583x17764', 15, 20, 'Audrey', '7957 Nikolaus Village Suite 144\nEast Myrtlefort, IL 81197', 'Kesslerberg', '1988-11-24 00:00:00', 'Tempora nesciunt in reprehenderit voluptatem magnam ea. Ducimus quas earum quia.', 'Premium'),
(41, 'cronin.sierra@example.com', '06060447282', 10, 20, 'Keshawn', '4012 Catharine Viaduct\nLake Raymondport, MA 33885-5906', 'Kunzemouth', '1983-09-25 00:00:00', 'Sequi ea magni id fuga sit nihil eligendi. Tenetur nulla odit et iste. Aspernatur atque totam aspernatur quos dolore vero maxime.', 'Silver'),
(42, 'hansen.theresia@example.net', '698.621.0974x611', 8, 10, 'Charlotte', '936 Emard Greens Suite 820\nWest Lianaburgh, WY 87108', 'East Ezequiel', '1992-06-07 00:00:00', 'Ipsa voluptatem dolorum ut possimus vel ad aspernatur. Repudiandae sunt rerum impedit deleniti. Tempore qui repellendus ea.', 'Silver'),
(43, 'maddison78@example.org', '085.205.3849', 28, 30, 'Katelin', '32825 Willms Knoll\nVidalview, IN 10574-4292', 'West Vanessa', '1995-03-28 00:00:00', 'Animi beatae et ut assumenda totam sed repellat. Adipisci mollitia est tempora officiis doloribus perferendis molestiae. Cumque ea iste est soluta enim excepturi.', 'Gold'),
(44, 'oraynor@example.org', '1-098-053-2701', 5, 30, 'Kaley', '70315 Gaylord Union Suite 023\nWest Wanda, LA 72283-4876', 'Port Ryderhaven', '1989-02-07 00:00:00', 'Tenetur corporis sit odit maiores qui expedita. Similique rerum quia eum neque delectus quis. Unde minima sit fugit neque accusamus reprehenderit.', 'Silver'),
(45, 'yadams@example.org', '525-681-7761', 10, 20, 'Alexandre', '051 Brody Row\nRempelport, KY 01525-6904', 'East Nehatown', '1988-11-18 00:00:00', 'Perspiciatis libero blanditiis a placeat amet. Aspernatur cum labore ut veritatis voluptatem ut. Sunt commodi illum sequi.', 'Premium'),
(46, 'velma.heathcote@example.org', '1-829-073-6169x29553', 12, 10, 'Eulah', '3106 Earline Squares\nLake Garrettmouth, VT 20075', 'Clintonhaven', '1990-11-10 00:00:00', 'Dolores veniam autem nesciunt. Fugiat sint placeat exercitationem earum eos magni qui. Voluptatem ut eum dolores aut. Et doloribus est vel sed commodi aut laboriosam.', 'Premium'),
(47, 'allison.fahey@example.com', '(789)293-3679x42184', 30, 30, 'Trinity', '5303 Smitham Orchard Apt. 497\nLake Eulamouth, WY 67636-6430', 'Beverlyfurt', '1987-01-08 00:00:00', 'Quo asperiores ea sed ut rerum at temporibus non. Qui corporis deserunt ipsam sint. Cupiditate neque veritatis placeat magni quia veniam.', 'Premium'),
(48, 'simonis.yolanda@example.net', '532.798.5753x21660', 24, 20, 'Claudine', '4342 Lynch Divide Apt. 598\nEast Demond, WI 47373-6778', 'Quigleyburgh', '1995-01-06 00:00:00', 'Praesentium eos et voluptate in aut deserunt. Ratione maiores occaecati reiciendis temporibus quae impedit eum architecto. Est eligendi rerum eos hic et magnam voluptas et. Nisi iusto culpa minus officia sit molestias temporibus.', 'Silver'),
(49, 'friesen.damien@example.com', '048.535.1612x8193', 30, 20, 'Uriah', '05469 Schmeler Harbor\nPort Hoyt, SD 38253', 'Laurystad', '1978-03-29 00:00:00', 'Debitis esse dicta deserunt ad tempora. Nemo consequatur similique unde voluptas quo ut dolor. Consequuntur eum odit ea ad.', 'Silver'),
(50, 'herman.zelda@example.com', '382-321-8948x134', 28, 20, 'Loren', '63403 Walter Divide Suite 335\nPort Vincent, IL 78419-2913', 'Melliestad', '1998-03-21 00:00:00', 'Porro odit deserunt consequatur rerum alias odio. Omnis natus rerum atque non quas. Itaque vero a voluptas laborum.', 'Silver');

-- --------------------------------------------------------

--
-- Table structure for table `p2pk`
--

CREATE TABLE `p2pk` (
  `id` int(11) NOT NULL,
  `kode` varchar(20) NOT NULL,
  `id_kategori_p2pk` int(11) NOT NULL,
  `id_client` int(11) NOT NULL,
  `pic` varchar(100) NOT NULL,
  `judul` varchar(259) NOT NULL,
  `status` char(1) NOT NULL COMMENT '0 = dibuat, 1 = aktif, 2 = tidak aktif',
  `status_proses` char(2) NOT NULL DEFAULT '1' COMMENT '1 = Planning Dalam Proses,\r\n2 = Planning Selesai,\r\n3 = Proses Audit Dalam Proses,\r\n4 = Proses Audit Selesai,\r\n5 = Report Phase 1 Dalam Proses,\r\n6 = Report Phase 1 Selesai,\r\n7 = Report Phase 2 Dalam Proses,\r\n8 = Report Phase 2 Selesai,\r\n9 = Report Final Report Dalam Proses,\r\n10 = Report Final Report Selesai',
  `created_at` date DEFAULT NULL,
  `updated_at` date DEFAULT NULL,
  `deleted_at` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `p2pk_planning`
--

CREATE TABLE `p2pk_planning` (
  `id` int(11) NOT NULL,
  `id_p2pk` int(11) NOT NULL,
  `judul` varchar(255) DEFAULT NULL,
  `deskripsi` varbinary(2000) DEFAULT NULL,
  `timeline` varchar(255) DEFAULT NULL,
  `sdm` varchar(255) DEFAULT NULL,
  `diminta` varchar(255) DEFAULT NULL,
  `status` char(1) NOT NULL COMMENT '0 = dibuat, 1 = aktif, 2 = tidak aktif',
  `created_at` date DEFAULT NULL,
  `updated_at` date DEFAULT NULL,
  `deleted_at` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `p2pk_planning_file`
--

CREATE TABLE `p2pk_planning_file` (
  `id` int(11) NOT NULL,
  `id_p2pk_planning` int(11) NOT NULL,
  `nama` varchar(255) DEFAULT NULL,
  `file` varchar(255) DEFAULT NULL,
  `status` char(1) NOT NULL COMMENT '0 = dibuat, 1 = aktif, 2 = tidak aktif',
  `created_at` date DEFAULT NULL,
  `updated_at` date DEFAULT NULL,
  `deleted_at` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `p2pk_proses_audit`
--

CREATE TABLE `p2pk_proses_audit` (
  `id` int(11) NOT NULL,
  `id_p2pk` int(11) NOT NULL,
  `judul` varchar(255) DEFAULT NULL,
  `deskripsi` varbinary(2000) DEFAULT NULL,
  `kertas_kerja` varchar(255) DEFAULT NULL,
  `pengujian` varchar(255) DEFAULT NULL,
  `status` char(1) NOT NULL COMMENT '0 = dibuat, 1 = aktif, 2 = tidak aktif',
  `created_at` date DEFAULT NULL,
  `updated_at` date DEFAULT NULL,
  `deleted_at` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `p2pk_proses_audit_file`
--

CREATE TABLE `p2pk_proses_audit_file` (
  `id` int(11) NOT NULL,
  `id_p2pk_proses_audit` int(11) NOT NULL,
  `nama` varchar(255) DEFAULT NULL,
  `file` varchar(255) DEFAULT NULL,
  `status` char(1) NOT NULL COMMENT '0 = dibuat, 1 = aktif, 2 = tidak aktif',
  `created_at` date DEFAULT NULL,
  `updated_at` date DEFAULT NULL,
  `deleted_at` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `p2pk_report`
--

CREATE TABLE `p2pk_report` (
  `id` int(11) NOT NULL,
  `id_p2pk` int(11) NOT NULL,
  `report_phase` int(11) DEFAULT NULL,
  `status` char(1) NOT NULL COMMENT '1 = File Phase 1 belum di upload, 2 = Phase 1 Menunggu komentar, 3 = File Phase 2 belum di upload, 4 = Phase 2 Menunggu Komentar, 5 = Komentar Phase 2 telah di upload, 6 = Report Selesai',
  `created_at` date DEFAULT NULL,
  `updated_at` date DEFAULT NULL,
  `deleted_at` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `p2pk_report_detail`
--

CREATE TABLE `p2pk_report_detail` (
  `id` int(11) NOT NULL,
  `id_p2pk_report` int(11) NOT NULL,
  `report_phase` int(11) DEFAULT NULL,
  `id_approval` int(11) NOT NULL,
  `nama` varchar(255) DEFAULT NULL,
  `file` varchar(255) DEFAULT NULL,
  `tanggal_upload` datetime DEFAULT NULL,
  `tanggal_approval_diminta` datetime DEFAULT NULL,
  `file_komen` varchar(255) DEFAULT NULL,
  `komentar` text DEFAULT NULL,
  `tanggal_komentar_submit` datetime DEFAULT NULL,
  `status` char(1) NOT NULL COMMENT '1 = File belum di upload, 2 = Menunggu komentar, 3 = Komentar telah di upload',
  `created_at` date DEFAULT NULL,
  `updated_at` date DEFAULT NULL,
  `deleted_at` date DEFAULT NULL,
  `status_kondisi_upload_file` int(11) NOT NULL,
  `status_kondisi_approval` int(11) NOT NULL,
  `status_kondisi_file_komentar` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `p2pk_report_detail`
--

INSERT INTO `p2pk_report_detail` (`id`, `id_p2pk_report`, `report_phase`, `id_approval`, `nama`, `file`, `tanggal_upload`, `tanggal_approval_diminta`, `file_komen`, `komentar`, `tanggal_komentar_submit`, `status`, `created_at`, `updated_at`, `deleted_at`, `status_kondisi_upload_file`, `status_kondisi_approval`, `status_kondisi_file_komentar`) VALUES
(1, 1, 1, 58, NULL, 'BUMN1_58_screencapture-mobile-duahati-id-registrasi-invoice-2022-01-06-20_47_12.pdf', '2022-01-07 06:41:20', '2022-01-07 06:43:45', 'BUMN1_58_screencapture-mobile-duahati-id-registrasi-invoice-2022-01-06-20_47_121.pdf', 'oke', '2022-01-07 06:46:48', '4', '2022-01-06', '2022-01-07', NULL, 2, 2, 2),
(2, 1, 2, 59, NULL, 'BUMN1_58_screencapture-mobile-duahati-id-registrasi-invoice-2022-01-06-20_47_122.pdf', '2022-01-07 06:46:56', '2022-01-07 06:47:02', 'BUMN1_58_screencapture-mobile-duahati-id-registrasi-invoice-2022-01-06-20_47_123.pdf', '-', '2022-01-07 06:47:32', '4', '2022-01-06', '2022-01-07', NULL, 2, 2, 2),
(3, 1, 3, 0, NULL, 'BUMN1_58_screencapture-mobile-duahati-id-registrasi-invoice-2022-01-06-20_47_124.pdf', '2022-01-07 07:05:41', NULL, NULL, NULL, NULL, '4', '2022-01-06', '2022-01-07', NULL, 2, 1, 1),
(4, 2, 1, 58, NULL, 'BUMN2_58_FORM_WARBOB.docx', '2022-01-07 07:18:14', '2022-01-07 07:18:20', 'BUMN2_58_screencapture-mobile-duahati-id-registrasi-invoice-2022-01-06-20_47_12.pdf', 'ok', '2022-01-07 07:19:00', '4', '2022-01-07', '2022-01-07', NULL, 2, 2, 2),
(5, 2, 2, 59, NULL, 'BUMN2_58_screencapture-mobile-duahati-id-registrasi-invoice-2022-01-06-20_47_121.pdf', '2022-01-07 07:19:09', '2022-01-07 07:19:19', 'BUMN2_58_screencapture-mobile-duahati-id-registrasi-invoice-2022-01-06-20_47_122.pdf', 'as', '2022-01-07 07:19:53', '4', '2022-01-07', '2022-01-07', NULL, 2, 2, 2),
(6, 2, 3, 0, NULL, 'BUMN2_58_screencapture-mobile-duahati-id-registrasi-invoice-2022-01-06-20_47_124.pdf', '2022-01-07 07:24:42', NULL, NULL, NULL, NULL, '4', '2022-01-07', '2022-01-07', NULL, 2, 0, 0),
(7, 3, 1, 58, NULL, 'BUMN7_58_AuditAny_Users_Users.pdf', '2022-01-07 17:00:07', '2022-01-07 17:00:22', 'BUMN7_58_AuditAny_Users_Users1.pdf', 'oke', '2022-01-07 17:05:36', '4', '2022-01-07', '2022-01-07', NULL, 2, 2, 2),
(8, 3, 2, 59, NULL, 'BUMN7_58_AuditAny_Users_Users_(2).pdf', '2022-01-07 17:05:50', '2022-01-07 17:05:56', 'BUMN7_58_screencapture-mobile-duahati-id-registrasi-invoice-2022-01-06-20_47_12.pdf', 'oke', '2022-01-07 17:06:34', '4', '2022-01-07', '2022-01-07', NULL, 2, 2, 2),
(9, 3, 3, 0, NULL, 'BUMN7_58_AuditAny_Users_Users_(1).pdf', '2022-01-07 17:06:50', NULL, NULL, NULL, NULL, '4', '2022-01-07', '2022-01-07', NULL, 2, 0, 0),
(10, 4, 1, 58, NULL, 'BUMN2_58_AuditAny_Users_Users_(2).pdf', '2022-01-11 18:06:10', '2022-01-11 18:06:19', 'BUMN2_58_Modul_Audit_(3).pdf', 'oke', '2022-01-11 18:06:52', '4', '2022-01-11', '2022-01-11', NULL, 2, 2, 2),
(11, 4, 2, 59, NULL, 'BUMN2_58_Modul_Audit_(3)1.pdf', '2022-01-11 18:07:03', '2022-01-11 18:07:09', 'BUMN2_58_AuditAny_Users_Users_(1).pdf', 'oke juga', '2022-01-11 18:07:45', '4', '2022-01-11', '2022-01-11', NULL, 2, 2, 2),
(12, 4, 3, 0, NULL, 'BUMN2_58_AuditAny_Users_Users_(1)1.pdf', '2022-01-11 18:08:20', NULL, NULL, NULL, NULL, '4', '2022-01-11', '2022-01-11', NULL, 2, 0, 0),
(13, 5, 1, 58, NULL, 'BUMN_3_59_AuditAny_Activity_(3).pdf', '2022-01-14 17:21:16', '2022-01-14 17:21:21', 'BUMN_3_59_AuditAny_Activity_(3)1.pdf', 'sad', '2022-01-14 17:21:39', '4', '2022-01-11', '2022-01-14', NULL, 2, 2, 2),
(14, 5, 2, 59, NULL, 'BUMN_3_59_AuditAny_Activity_(3)2.pdf', '2022-01-14 17:21:48', '2022-01-14 17:22:01', 'BUMN_3_59_AuditAny_Activity_(3)3.pdf', 'sa', '2022-01-14 17:22:27', '4', '2022-01-11', '2022-01-14', NULL, 2, 2, 2),
(15, 5, 3, 0, NULL, 'BUMN_3_59_BUMN2_58_FORM_WARBOB.docx', '2022-01-14 17:23:22', NULL, NULL, NULL, NULL, '4', '2022-01-11', '2022-01-14', NULL, 2, 0, 0),
(16, 6, 1, 59, NULL, 'BUMN2_58_AuditAny_Activity_(3).pdf', '2022-01-14 17:17:13', '2022-01-14 17:17:20', 'BUMN2_58_AuditAny_Activity_(3)1.pdf', 'as', '2022-01-14 17:17:36', '4', '2022-01-14', '2022-01-14', NULL, 2, 2, 2),
(17, 6, 2, 58, NULL, 'BUMN2_58_AuditAny_Activity_(3)2.pdf', '2022-01-14 17:17:47', '2022-01-14 17:17:52', 'BUMN2_58_AuditAny_Activity_(4).pdf', 'asd', '2022-01-14 17:18:26', '4', '2022-01-14', '2022-01-14', NULL, 2, 2, 2),
(18, 6, 3, 0, NULL, NULL, '2022-01-14 17:18:39', NULL, NULL, NULL, NULL, '4', '2022-01-14', '2022-01-14', NULL, 2, 0, 0),
(19, 7, 1, 58, NULL, NULL, '2022-01-14 17:13:44', '2022-01-14 17:13:50', 'BUMN1_58_AuditAny_Activity_(4).pdf', '1', '2022-01-14 17:14:19', '4', '2022-01-14', '2022-01-14', NULL, 2, 2, 2),
(20, 7, 2, 59, NULL, 'BUMN1_58_AuditAny_Activity_(4)1.pdf', '2022-01-14 17:14:27', '2022-01-14 17:14:34', 'BUMN1_58_AuditAny_Activity_(4)2.pdf', '23423', '2022-01-14 17:15:24', '4', '2022-01-14', '2022-01-14', NULL, 2, 2, 2),
(21, 7, 3, 0, NULL, NULL, '2022-01-14 17:16:04', NULL, NULL, NULL, NULL, '4', '2022-01-14', '2022-01-14', NULL, 2, 0, 0),
(22, 8, 1, 58, NULL, 'BUMN1_58_AuditAny_Activity_(3).pdf', '2022-01-14 18:42:39', '2022-01-14 18:43:10', 'BUMN1_58_AuditAny_Activity_(3)1.pdf', 'ijijasdasd', '2022-01-14 18:44:26', '4', '2022-01-14', '2022-01-14', NULL, 2, 2, 2),
(23, 8, 2, 59, NULL, 'BUMN1_58_AuditAny_Activity_(4)3.pdf', '2022-01-14 18:44:42', '2022-01-14 18:44:48', 'BUMN1_58_AuditAny_Activity_(4)4.pdf', 'okoko', '2022-01-14 18:45:14', '4', '2022-01-14', '2022-01-14', NULL, 2, 2, 2),
(24, 8, 3, 0, NULL, 'BUMN1_58_BUMN_3_59_BUMN2_58_FORM_WARBOB.docx', '2022-01-14 18:46:03', NULL, NULL, NULL, NULL, '4', '2022-01-14', '2022-01-14', NULL, 2, 0, 0),
(25, 9, 1, 58, NULL, 'BUMN1_58_Modul_Audit_(36).pdf', '2022-01-21 09:41:47', '2022-01-21 09:42:10', 'BUMN1_58_Modul_Audit_(35)1.pdf', 'oke', '2022-01-21 09:42:28', '4', '2022-01-14', '2022-01-21', NULL, 2, 2, 2),
(26, 9, 2, 59, NULL, 'BUMN1_58_Modul_Audit_(36)1.pdf', '2022-01-21 09:43:04', '2022-01-21 09:43:09', 'BUMN1_58_Modul_Audit_(32)1.pdf', 's', '2022-01-21 09:43:54', '4', '2022-01-14', '2022-01-21', NULL, 2, 2, 2),
(27, 9, 3, 0, NULL, 'BUMN1_58_Modul_Audit_(36)2.pdf', '2022-01-21 09:50:01', NULL, NULL, NULL, NULL, '4', '2022-01-14', '2022-01-21', NULL, 2, 0, 0),
(28, 10, 1, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', '2022-01-17', NULL, NULL, 0, 0, 0),
(29, 10, 2, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', '2022-01-17', NULL, NULL, 0, 0, 0),
(30, 10, 3, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', '2022-01-17', NULL, NULL, 0, 0, 0),
(31, 11, 1, 58, NULL, 'BUMN1_58_Modul_Audit_(32).pdf', '2022-01-21 09:30:40', '2022-01-21 09:31:45', 'BUMN1_58_Modul_Audit_(35).pdf', 'asdasd', '2022-01-21 09:37:54', '5', '2022-01-21', '2022-01-21', NULL, 2, 2, 2),
(32, 11, 2, 58, NULL, 'BUMN1_58_Modul_Audit_(38).pdf', '2022-01-21 09:37:22', '2022-01-21 09:37:38', 'BUMN1_58_Modul_Audit_(38)1.pdf', 'asd', '2022-01-21 09:37:49', '5', '2022-01-21', '2022-01-21', NULL, 2, 2, 2),
(33, 11, 3, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', '2022-01-21', NULL, NULL, 0, 0, 0),
(34, 12, 1, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', '2022-01-21', NULL, NULL, 0, 0, 0),
(35, 12, 2, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', '2022-01-21', NULL, NULL, 0, 0, 0),
(36, 12, 3, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', '2022-01-21', NULL, NULL, 0, 0, 0),
(37, 13, 1, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', '2022-01-27', NULL, NULL, 0, 0, 0),
(38, 13, 2, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', '2022-01-27', NULL, NULL, 0, 0, 0),
(39, 13, 3, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', '2022-01-27', NULL, NULL, 0, 0, 0),
(40, 14, 1, 58, NULL, 'BUMN1_58_UAS_Fisika_Abdul_Rohman_2112211002_Kelas-D_Teknik_Sipil.pdf', '2022-02-07 15:27:21', '2022-02-07 15:28:35', 'BUMN1_58_UAS_Fisika_Abdul_Rohman_2112211002_Kelas-D_Teknik_Sipil1.pdf', 'oke', '2022-02-07 15:29:18', '4', '2022-02-07', '2022-02-07', NULL, 2, 2, 2),
(41, 14, 2, 59, NULL, 'BUMN1_58_UAS_Fisika_Abdul_Rohman_2112211002_Kelas-D_Teknik_Sipil2.pdf', '2022-02-07 15:29:39', '2022-02-07 15:29:47', 'BUMN1_58_UAS_Fisika_Abdul_Rohman_2112211002_Kelas-D_Teknik_Sipil3.pdf', 'ok', '2022-02-07 15:30:17', '4', '2022-02-07', '2022-02-07', NULL, 2, 2, 2),
(42, 14, 3, 0, NULL, 'BUMN1_58_UAS_Fisika_Abdul_Rohman_2112211002_Kelas-D_Teknik_Sipil4.pdf', '2022-02-07 15:30:32', NULL, NULL, NULL, NULL, '4', '2022-02-07', '2022-02-07', NULL, 2, 0, 0),
(43, 15, 1, 58, NULL, 'BUMN1_58_SOAL_UAS_GASAL_2021-2022_DAN_LEMBAR_JAWABAN-1.doc', '2022-02-11 13:38:25', '2022-02-11 13:38:55', NULL, NULL, NULL, '3', '2022-02-11', '2022-02-11', NULL, 2, 2, 0),
(44, 15, 2, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', '2022-02-11', NULL, NULL, 0, 0, 0),
(45, 15, 3, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', '2022-02-11', NULL, NULL, 0, 0, 0),
(46, 16, 1, 58, NULL, 'BUMN1_58_P1__SISTEM_PERSAMAAN_LINEAR_(1).docx', '2022-02-18 12:16:50', '2022-02-18 12:17:35', 'BUMN1_58_Template_Proses_Audit_-_Pengujian_1_-_Pengujian_Materialitas_AMS_Audit_Any_2022.pdf', 'ok', '2022-02-18 12:20:18', '4', '2022-02-18', '2022-02-18', NULL, 2, 2, 2),
(47, 16, 2, 58, NULL, 'BUMN1_58_Template_Proses_Audit_-_Pengujian_1_-_Pengujian_Materialitas_AMS_Audit_Any_20221.pdf', '2022-02-18 12:19:29', '2022-02-18 12:20:05', 'BUMN1_58_Template_Proses_Audit_-_Pengujian_1_-_Pengujian_Materialitas_AMS_Audit_Any_20222.pdf', 'oook', '2022-02-18 12:20:53', '4', '2022-02-18', '2022-02-18', NULL, 2, 2, 2),
(48, 16, 3, 0, NULL, 'BUMN1_58_Template_Proses_Audit_-_Pengujian_1_-_Pengujian_Materialitas_AMS_Audit_Any_20223.pdf', '2022-02-18 12:21:31', NULL, NULL, NULL, NULL, '4', '2022-02-18', '2022-02-18', NULL, 2, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `partner`
--

CREATE TABLE `partner` (
  `id` int(11) NOT NULL,
  `nama` varchar(200) NOT NULL,
  `no_telepon` varchar(50) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `lokasi` varchar(100) DEFAULT NULL,
  `photo` varchar(250) DEFAULT NULL,
  `status` char(1) NOT NULL COMMENT '0 = dibuat, 1 = aktif, 2 = tidak aktif',
  `created_at` date DEFAULT NULL,
  `updated_at` date DEFAULT NULL,
  `deleted_at` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `partner`
--

INSERT INTO `partner` (`id`, `nama`, `no_telepon`, `email`, `lokasi`, `photo`, `status`, `created_at`, `updated_at`, `deleted_at`) VALUES
(25, 'Setiawan', '082123215', 'soni.setiawan@mailinator.com', 'Jl Kebon Kopi, Cimahi', 'b48835d31c061d74686dc8f8e18ac074.jpg', '1', '2022-03-28', '2022-03-31', NULL),
(26, 'Keluarga Rismawan', '0225545456', 'keluarga.x@mailinator.com', 'jl kebon jeruk 2022, cimahi', '2ea014b3e5b80c9545c2adf0a2bec2c5.jpg', '1', '2022-03-31', '2022-03-31', NULL),
(27, 's', '3232', 's21@mailinator.com', 'asd', NULL, '3', '2022-03-31', '2022-04-05', '2022-04-05'),
(28, 'test', '213213', 'test20@mailinator.com', 'asdadsa', '90ee87335fa315cb8a9dd252843f6ccd.jpg', '3', '2022-04-05', '2022-04-05', '2022-04-05'),
(29, 'Keluarga Andri', '088223232', 'keluarga.andri@mailinator.com', 'Bandung', '97dce70b54cea3a028210efc428f9dda.jpeg', '1', '2022-04-05', '2022-04-05', NULL),
(30, 'Keluarga Hendrik A, M SCPD A', '0882312312', 'pa.hendrik@gmail.com', 'Jakarta Pusat', 'a53c5d79939f984534083b5d2959e724.png', '1', '2022-04-20', '2022-04-22', NULL),
(31, 'Pa Anton ', '', '', '', NULL, '1', '2022-04-26', NULL, NULL),
(32, 'Keluarga Muad', '', '', '', '7a156df747f9d502e05321013f751b68.jpg', '1', '2022-04-26', '2022-04-26', NULL),
(33, 'Keluarga Aruan', '', '', '', NULL, '1', '2022-05-14', NULL, NULL),
(34, 'Keluarga Wungka', '', '', '', NULL, '1', '2022-05-14', NULL, NULL),
(35, 'Keluarga Aruan  1', '085798132505', '', 'Jl Duri Kepa', '4a54bc4a66044403d212d09604da0ce0.jpg', '1', '2022-05-17', '2022-05-21', NULL),
(36, 'Keluarga Wungka 1', NULL, NULL, NULL, NULL, '1', '2022-05-17', NULL, NULL),
(41, 'Keluarga Aruan  5', NULL, NULL, NULL, NULL, '1', '2022-05-17', NULL, NULL),
(42, 'Keluarga Wungka 5', NULL, NULL, NULL, NULL, '1', '2022-05-17', NULL, NULL),
(43, 'Keluarga Aruan  6', NULL, NULL, NULL, NULL, '1', '2022-05-19', NULL, NULL),
(44, 'Keluarga Wungka 6', NULL, NULL, NULL, NULL, '1', '2022-05-19', NULL, NULL),
(45, 'A. Aruan', NULL, NULL, NULL, NULL, '1', '2022-05-23', NULL, NULL),
(46, 'A. B. J. Lumban', NULL, NULL, NULL, NULL, '1', '2022-05-23', NULL, NULL),
(47, 'A. B. Sia', NULL, NULL, NULL, NULL, '1', '2022-05-23', NULL, NULL),
(48, 'A. B. Tonga ', NULL, NULL, NULL, NULL, '1', '2022-05-23', NULL, NULL),
(49, 'A. B. Tampu', NULL, NULL, NULL, NULL, '1', '2022-05-23', NULL, NULL),
(50, 'A. Butaman', NULL, NULL, NULL, NULL, '1', '2022-05-23', NULL, NULL),
(51, 'Wungka', NULL, NULL, NULL, NULL, '1', '2022-05-23', NULL, NULL),
(52, 'Timoti', NULL, NULL, NULL, NULL, '1', '2022-05-23', NULL, NULL),
(53, 'Lie', NULL, NULL, NULL, NULL, '1', '2022-05-23', NULL, NULL),
(54, 'Jong', NULL, NULL, NULL, NULL, '1', '2022-05-23', NULL, NULL),
(55, 'Wailan', NULL, NULL, NULL, NULL, '1', '2022-05-23', NULL, NULL),
(56, 'Allo', NULL, NULL, NULL, NULL, '1', '2022-05-23', NULL, NULL),
(57, 'Illiad', NULL, NULL, NULL, NULL, '1', '2022-05-23', NULL, NULL),
(58, 'Lie2', NULL, NULL, NULL, NULL, '1', '2022-05-23', NULL, NULL),
(59, 'Halim', NULL, NULL, NULL, NULL, '1', '2022-05-23', NULL, NULL),
(60, 'Topan Ismail', '', '', 'Jakarta Barat', NULL, '1', '2022-05-26', NULL, NULL),
(61, 'Keluarga Testing', '', '', '', NULL, '1', '2022-05-26', NULL, NULL),
(62, 'Keluarga Testing Mail', '', '', '', NULL, '1', '2022-05-26', NULL, NULL),
(63, 'Keluarga Hendro', '', '', '', NULL, '1', '2022-05-26', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `pengarah`
--

CREATE TABLE `pengarah` (
  `id` int(11) NOT NULL,
  `nama` varchar(100) DEFAULT NULL,
  `keterangan` text DEFAULT NULL,
  `no_urut` int(11) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `pengarah`
--

INSERT INTO `pengarah` (`id`, `nama`, `keterangan`, `no_urut`, `status`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Pengarah A', 'Pengarah A', 1, 1, '2022-04-02 16:43:14', '2022-04-08 17:29:43', NULL),
(2, '2', '2', 2, 3, '2022-04-02 16:44:10', '2022-04-02 16:44:13', '2022-04-02 16:44:13'),
(3, 'Pengarah B', 'Pengarah B', 2, 1, '2022-04-08 17:29:52', NULL, NULL),
(4, 'Pengarah C', 'Pengarah C', 3, 1, '2022-04-08 17:30:20', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `pengaturan_aplikasi`
--

CREATE TABLE `pengaturan_aplikasi` (
  `id` int(11) NOT NULL,
  `nama_aplikasi` varchar(100) DEFAULT NULL,
  `keterangan` text DEFAULT NULL,
  `logo` varchar(250) DEFAULT NULL,
  `favicon` varchar(250) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `pengaturan_aplikasi`
--

INSERT INTO `pengaturan_aplikasi` (`id`, `nama_aplikasi`, `keterangan`, `logo`, `favicon`, `status`, `created_at`) VALUES
(1, 'App Name', 'Applicaiton Name', 'be06780e6d4ad0f21c83e171d69e3c49.png', '5c1955efca59b79fd864e38c7c56a9b4.png', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `posisi`
--

CREATE TABLE `posisi` (
  `id` int(11) NOT NULL,
  `nama` varchar(100) DEFAULT NULL,
  `no_urut` int(11) NOT NULL,
  `status` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `posisi`
--

INSERT INTO `posisi` (`id`, `nama`, `no_urut`, `status`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Suami', 1, 1, '2022-03-01 09:47:06', '2022-03-06 01:53:08', NULL),
(2, 'Istri', 2, 1, '2022-03-01 09:47:15', '2022-03-06 01:53:13', NULL),
(3, 'a', 0, 3, '2022-03-01 09:47:48', '2022-03-01 09:47:51', '2022-03-01 09:47:51'),
(4, 'Muda', 4, 1, '2022-03-01 12:36:29', '2022-03-06 01:53:19', NULL),
(5, 'Tua', 3, 1, '2022-03-01 12:36:44', '2022-03-06 01:53:23', NULL),
(6, 'Testing2', 0, 3, '2022-03-02 18:14:50', '2022-03-06 01:48:24', '2022-03-06 01:48:24'),
(7, 'ASS', 5, 3, '2022-03-06 01:53:29', '2022-03-06 01:53:32', '2022-03-06 01:53:32'),
(8, 'Calon Suami', 5, 1, '2022-03-28 17:37:36', NULL, NULL),
(9, 'Calon Istri', 6, 1, '2022-03-28 17:37:45', NULL, NULL),
(10, 'Anak', 0, 1, '2022-05-23 17:15:04', NULL, NULL),
(11, 'Ibu', 0, 1, '2022-05-23 17:15:06', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `profesi`
--

CREATE TABLE `profesi` (
  `id` int(11) NOT NULL,
  `id_profile` int(11) NOT NULL,
  `nama` varchar(255) DEFAULT NULL,
  `status` char(1) NOT NULL COMMENT '0 = dibuat, 1 = aktif, 2 = tidak aktif',
  `created_at` date DEFAULT NULL,
  `updated_at` date DEFAULT NULL,
  `deleted_at` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `profile`
--

CREATE TABLE `profile` (
  `id` int(11) NOT NULL,
  `id_keanggotaan` int(11) NOT NULL,
  `kode` varchar(20) NOT NULL,
  `kode_tahun_bulan` varchar(6) NOT NULL,
  `kode_keanggotaan` varchar(10) NOT NULL,
  `id_user` int(11) DEFAULT NULL,
  `nama_depan` varchar(50) DEFAULT NULL,
  `nama_belakang` varchar(100) DEFAULT NULL,
  `jenis_kelamin` char(1) DEFAULT NULL COMMENT '1 = laki-laki, 2 = perempuan',
  `photo` varchar(255) DEFAULT NULL,
  `status` char(1) NOT NULL COMMENT '0 = dibuat, 1 = aktif, 2 = tidak aktif, 3 deleted',
  `status_verifikasi` int(11) DEFAULT NULL,
  `tanggal_anggota` date DEFAULT NULL,
  `id_kategorial` int(11) NOT NULL,
  `id_wilayah` int(11) NOT NULL,
  `flag` int(11) DEFAULT NULL,
  `tanggal_registrasi` date DEFAULT NULL,
  `tanggal_lahir` date DEFAULT NULL,
  `tanggal_meninggal` date DEFAULT NULL,
  `created_at` date DEFAULT NULL,
  `updated_at` date DEFAULT NULL,
  `deleted_at` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `profile`
--

INSERT INTO `profile` (`id`, `id_keanggotaan`, `kode`, `kode_tahun_bulan`, `kode_keanggotaan`, `id_user`, `nama_depan`, `nama_belakang`, `jenis_kelamin`, `photo`, `status`, `status_verifikasi`, `tanggal_anggota`, `id_kategorial`, `id_wilayah`, `flag`, `tanggal_registrasi`, `tanggal_lahir`, `tanggal_meninggal`, `created_at`, `updated_at`, `deleted_at`) VALUES
(52, 0, '', '', '', 1, NULL, NULL, NULL, NULL, '1', NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, '2021-11-08', NULL, NULL),
(178, 2, '', '', '', 222, 'Zainudin', 'Aruan 6', '1', NULL, '1', NULL, NULL, 0, 0, 1, '1978-09-01', '1949-04-22', '0000-00-00', '2022-05-19', NULL, NULL),
(179, 2, '', '', '', 223, 'Magda', 'Aruan 6', '2', NULL, '1', NULL, NULL, 0, 0, 1, '1978-09-01', '1950-02-09', '0000-00-00', '2022-05-19', NULL, NULL),
(180, 1, '', '', '', 224, 'Roi', 'Wungka 6', '1', NULL, '1', NULL, NULL, 0, 0, 1, '1988-09-01', '1965-02-12', '0000-00-00', '2022-05-19', NULL, NULL),
(181, 1, '', '', '', 225, 'Yulia', 'Wungka 6', '2', NULL, '1', NULL, NULL, 0, 0, 1, '1988-09-01', '1966-07-31', '0000-00-00', '2022-05-19', NULL, NULL),
(182, 1, '030401-202205-0001', '202205', 'P', 226, 'Su', 'Ben', '1', NULL, '1', NULL, NULL, 0, 0, 1, '2022-05-19', '1990-05-19', '0000-00-00', '2022-05-19', NULL, NULL),
(183, 2, '030401-197809-0001', '197809', 'A', 227, 'Zainudin', 'Aruan 5', '1', NULL, '1', NULL, NULL, 12, 5, 1, '1978-09-01', '1949-04-22', '0000-00-00', '2022-05-19', NULL, NULL),
(184, 2, '030401-197809-0002', '197809', 'A', 228, 'Magda', 'Aruan 5', '2', NULL, '1', NULL, NULL, 12, 5, 1, '1978-09-01', '1950-02-09', '0000-00-00', '2022-05-19', NULL, NULL),
(185, 1, '030401-198809-0001', '198809', 'P', 229, 'Roi', 'Wungka 5', '1', NULL, '1', NULL, NULL, 13, 6, 1, '1988-09-01', '1965-02-12', '0000-00-00', '2022-05-19', NULL, NULL),
(186, 1, '030401-198809-0003', '198809', 'P', 230, 'Yulia', 'Wungka 5', '2', NULL, '1', NULL, NULL, 13, 6, 1, '1988-09-01', '1966-07-31', '0000-00-00', '2022-05-19', NULL, NULL),
(187, 2, '030401-197809-0004', '197809', 'A', 231, 'Zainudin', 'Aruan 1', '1', NULL, '1', NULL, NULL, 12, 5, 1, '1978-09-01', '1949-04-22', '0000-00-00', '2022-05-19', NULL, NULL),
(188, 2, '030401-197809-0005', '197809', 'A', 232, 'Magda', 'Aruan 1', '2', NULL, '1', NULL, NULL, 12, 5, 1, '1978-09-01', '1950-02-09', '0000-00-00', '2022-05-19', NULL, NULL),
(189, 1, '030401-198809-0006', '198809', 'P', 233, 'Roi', 'Wungka 1', '1', NULL, '1', NULL, NULL, 13, 6, 1, '1988-09-01', '1965-02-12', '0000-00-00', '2022-05-19', NULL, NULL),
(190, 1, '030401-198809-0007', '198809', 'P', 234, 'Yulia', 'Wungka 1', '2', NULL, '1', NULL, NULL, 13, 6, 1, '1988-09-01', '1966-07-31', '0000-00-00', '2022-05-19', NULL, NULL),
(191, 2, '030401-197809-0006', '197809', 'A', 235, 'Zainuddin Aruan (+)', '', '1', NULL, '1', NULL, NULL, 11, 7, 1, '1978-09-01', '1949-04-22', '0000-00-00', '2022-05-23', NULL, NULL),
(192, 2, '030401-197809-0007', '197809', 'A', 236, 'Tiologi Magdalena br. Butar-Butar', '', '2', NULL, '1', NULL, NULL, 11, 7, 1, '1978-09-01', '1950-02-09', '0000-00-00', '2022-05-23', NULL, NULL),
(193, 2, '030401-197809-0008', '197809', 'A', 237, 'Albert Bismark Josua LumbanTobing', '', '1', NULL, '1', NULL, NULL, 11, 8, 1, '1978-09-01', '1964-06-28', '0000-00-00', '2022-05-23', NULL, NULL),
(194, 2, '030401-198809-0008', '198809', 'A', 238, 'Diani Rinarti br. Sitompul', '', '2', NULL, '1', NULL, NULL, 14, 8, 1, '1988-09-01', '1967-04-03', '0000-00-00', '2022-05-23', NULL, NULL),
(195, 2, '030401-198809-0009', '198809', 'A', 239, 'Agata Ruth Sofia br. L. Tobing', '', '2', NULL, '1', NULL, NULL, 15, 8, 1, '1988-09-01', '2006-07-11', '0000-00-00', '2022-05-23', NULL, NULL),
(196, 2, '030401-198001-0001', '198001', 'A', 240, 'Adolf Bastian Siagian, SE', '', '1', NULL, '1', NULL, NULL, 11, 9, 1, '1980-01-01', '1965-11-16', '0000-00-00', '2022-05-23', NULL, NULL),
(197, 2, '030401-198001-0002', '198001', 'A', 241, 'Astra Erna Desmawati br. Simanjuntak', '', '2', NULL, '1', NULL, NULL, 11, 9, 1, '1980-01-02', '1971-12-10', '0000-00-00', '2022-05-23', NULL, NULL),
(198, 2, '030401-198001-0003', '198001', 'A', 242, 'Adrina Wita Hilderia br. Siagian', '', '2', NULL, '1', NULL, NULL, 15, 9, 1, '1980-01-03', '1996-06-08', '0000-00-00', '2022-05-23', NULL, NULL),
(199, 2, '030401-198001-0004', '198001', 'A', 243, 'Antonius Imanuel Siagian', '', '1', NULL, '1', NULL, NULL, 15, 9, 1, '1980-01-04', '1999-01-03', '0000-00-00', '2022-05-23', NULL, NULL),
(200, 2, '030401-198001-0005', '198001', 'A', 244, 'Alexander Yohanes Siagian', '', '1', NULL, '1', NULL, NULL, 15, 9, 1, '1980-01-05', '2002-05-24', '0000-00-00', '2022-05-23', NULL, NULL),
(201, 2, '030401-198001-0006', '198001', 'A', 245, 'Agus Banson Silitonga (+)', '', '1', NULL, '1', NULL, NULL, 10, 10, 1, '1980-01-06', '1929-08-29', '0000-00-00', '2022-05-23', NULL, NULL),
(202, 2, '030401-198001-0007', '198001', 'A', 246, 'Rosinna br. Simanjuntak', '', '2', NULL, '1', NULL, NULL, 10, 10, 1, '1980-01-07', '1939-08-26', '0000-00-00', '2022-05-23', NULL, NULL),
(203, 1, '030401-198001-0008', '198001', 'P', 247, 'Almond Bernad Tampubolon', '', '1', NULL, '1', NULL, NULL, 0, 8, 1, '1980-01-08', '1970-08-19', '0000-00-00', '2022-05-23', NULL, NULL),
(204, 1, '030401-198001-0009', '198001', 'P', 248, 'Heike Veronika br. Aruan', '', '2', NULL, '1', NULL, NULL, 0, 8, 1, '1980-01-09', '1977-01-03', '0000-00-00', '2022-05-23', NULL, NULL),
(205, 1, '030401-198001-0010', '198001', 'P', 249, 'AB. Tampubolon', '', '1', NULL, '1', NULL, NULL, 0, 9, 1, '1980-01-10', '0511-11-30', '0000-00-00', '2022-05-23', NULL, NULL),
(206, 1, '030401-198001-0011', '198001', 'P', 250, 'Heike V. br. Aruan', '', '2', NULL, '1', NULL, NULL, 0, 9, 1, '1980-01-11', '0512-11-30', '0000-00-00', '2022-05-23', NULL, NULL),
(207, 1, '030401-198001-0012', '198001', 'P', 251, 'Amir Butarbutar (+)', '', '1', NULL, '1', NULL, NULL, 0, 11, 1, '1980-01-12', '1957-06-20', '0000-00-00', '2022-05-23', NULL, NULL),
(208, 1, '030401-198001-0013', '198001', 'P', 252, 'Martha br. Hasibuan', '', '2', NULL, '1', NULL, NULL, 0, 11, 1, '1980-01-13', '1958-11-23', '0000-00-00', '2022-05-23', NULL, NULL),
(209, 1, '030401-198001-0014', '198001', 'P', 253, 'Virtor RomaulitTua Butarbutar', '', '1', NULL, '1', NULL, NULL, 0, 11, 1, '1980-01-14', '1985-09-20', '0000-00-00', '2022-05-23', NULL, NULL),
(210, 1, '030401-198001-0015', '198001', 'P', 254, 'Timbul Jaya Baru Butarbutar (+)', '', '1', NULL, '1', NULL, NULL, 0, 11, 1, '1980-01-15', '1987-12-20', '0000-00-00', '2022-05-23', NULL, NULL),
(211, 1, '030401-198001-0016', '198001', 'P', 255, 'Kristin Damai Natalia br. Butarbutar', '', '2', NULL, '1', NULL, NULL, 0, 11, 1, '1980-01-16', '1989-12-14', '0000-00-00', '2022-05-23', NULL, NULL),
(212, 2, '030401-197809-0009', '197809', 'A', 256, 'Valens SW Wungka', '', '0', NULL, '1', NULL, NULL, 15, 12, 1, '1978-09-01', '1996-12-02', '0000-00-00', '2022-05-23', NULL, NULL),
(213, 2, '030401-197809-0010', '197809', 'A', 257, 'Yuliana Wungka', '', '0', NULL, '1', NULL, NULL, 11, 12, 1, '1978-09-01', '1970-01-01', '0000-00-00', '2022-05-23', NULL, NULL),
(214, 1, '030401-198809-0010', '198809', 'P', 258, 'Fredrick Timoti', '', '0', NULL, '1', NULL, NULL, 0, 13, 1, '1988-09-01', '1970-01-01', '0000-00-00', '2022-05-23', NULL, NULL),
(215, 2, '030401-198809-0011', '198809', 'A', 259, 'Ratnaningsih', '', '0', NULL, '1', NULL, NULL, 11, 13, 1, '1988-09-01', '1970-01-01', '0000-00-00', '2022-05-23', NULL, NULL),
(216, 2, '030401-198001-0017', '198001', 'A', 260, 'Feli Jong', '', '0', NULL, '1', NULL, NULL, 0, 0, 1, '1980-01-01', '1982-07-10', '0000-00-00', '2022-05-23', NULL, NULL),
(217, 1, '030401-198001-0018', '198001', 'P', 261, 'Timothy Wailan', '', '0', NULL, '1', NULL, NULL, 0, 0, 1, '1980-01-02', '1970-01-01', '0000-00-00', '2022-05-23', NULL, NULL),
(218, 2, '030401-198001-0019', '198001', 'A', 262, 'Ruth  Allo', '', '0', NULL, '1', NULL, NULL, 0, 13, 1, '1980-01-03', '1970-01-01', '0000-00-00', '2022-05-23', NULL, NULL),
(219, 2, '030401-198001-0020', '198001', 'A', 263, 'Yohana ', '', '0', NULL, '1', NULL, NULL, 0, 13, 1, '1980-01-04', '1963-02-01', '0000-00-00', '2022-05-23', NULL, NULL),
(220, 1, '030401-198001-0021', '198001', 'P', 264, 'Claudia  Iliadi', '', '0', NULL, '1', NULL, NULL, 0, 13, 1, '1980-01-05', '1970-01-01', '0000-00-00', '2022-05-23', NULL, NULL),
(221, 1, '030401-198001-0022', '198001', 'P', 265, 'Elizabeth  Lie', '', '0', NULL, '1', NULL, NULL, 0, 13, 1, '1980-01-06', '1970-01-01', '0000-00-00', '2022-05-23', NULL, NULL),
(222, 2, '030401-198001-0023', '198001', 'A', 266, 'Ray Halim', '', '0', NULL, '1', NULL, NULL, 11, 12, 1, '1980-01-07', '1960-12-06', '0000-00-00', '2022-05-23', NULL, NULL),
(223, 1, '030401-198001-0024', '198001', 'P', 267, 'Liana Tandjung', 'sadasd', '1', NULL, '1', NULL, NULL, 0, 0, 1, '1980-01-08', '1959-12-04', '0000-00-00', '2022-05-24', NULL, NULL),
(224, 1, '030401-202205-0002', '202205', 'P', 268, 'Opusisv', 'Level1', '1', NULL, '1', NULL, NULL, 0, 0, 1, '2022-05-24', '1999-01-01', '0000-00-00', '2022-05-24', NULL, NULL),
(225, 1, '030401-202205-0003', '202205', 'P', 269, 'Opusisv', 'Testing2', '1', NULL, '1', NULL, NULL, 0, 2, 0, '2022-05-24', '2022-05-24', '0000-00-00', '2022-05-24', NULL, NULL),
(226, 2, '030401-202203-0001', '202203', 'A', 270, 'Opusisv', 'Testing3', '1', NULL, '1', NULL, NULL, 1, 1, 1, '2022-03-01', '2014-01-01', '0000-00-00', '2022-05-24', NULL, NULL),
(227, 1, '030401-202205-0004', '202205', 'P', 271, 'Topan', 'Ismail', '1', NULL, '1', NULL, NULL, 0, 0, 1, '2022-05-26', '1997-01-01', '0000-00-00', '2022-05-26', NULL, NULL),
(228, 1, '030401-202205-0005', '202205', 'P', 272, 'Ani', 'Ina', '2', NULL, '1', NULL, NULL, 0, 0, 1, '2022-05-26', '1998-10-10', '0000-00-00', '2022-05-26', NULL, NULL),
(229, 1, '030401-202205-0006', '202205', 'P', 273, 'Opusisv', 'Admin Staff', '1', NULL, '1', NULL, NULL, 0, 0, 1, '2022-05-26', '1999-01-01', '0000-00-00', '2022-05-26', NULL, NULL),
(230, 1, '030401-202205-0007', '202205', 'P', 274, 'Opusisv', 'Testing Mei 1', '1', NULL, '1', NULL, NULL, 0, 0, 1, '2022-05-26', '1998-05-06', '0000-00-00', '2022-05-26', NULL, NULL),
(231, 1, '030401-202205-0008', '202205', 'P', 275, 'Opusisv', 'Testing Mei 2', '2', NULL, '1', NULL, NULL, 0, 0, 0, '2022-05-26', '1998-02-02', '0000-00-00', '2022-05-26', NULL, NULL),
(232, 1, '030401-202205-0009', '202205', 'P', 276, 'Opusisv', 'Testing Mei 3', '1', NULL, '1', NULL, NULL, 0, 0, 1, '2022-05-26', '2022-05-11', '0000-00-00', '2022-05-26', NULL, NULL),
(233, 1, '030401-202205-0010', '202205', 'P', 277, 'Opusisv', 'Testing Mail', '1', NULL, '1', NULL, NULL, 0, 0, 1, '2022-05-26', '1990-10-10', '0000-00-00', '2022-05-26', NULL, NULL),
(234, 1, '030401-202205-0011', '202205', 'P', 278, 'Opusisv', 'Testing Ani', '2', NULL, '1', NULL, NULL, 0, 0, 1, '2022-05-26', '1993-02-20', '0000-00-00', '2022-05-26', NULL, NULL),
(235, 1, '030401-202205-0012', '202205', 'P', 279, 'Opusisv', 'Hendro', '1', NULL, '1', NULL, NULL, 0, 0, 1, '2022-05-26', '1990-10-10', '0000-00-00', '2022-05-26', NULL, NULL),
(236, 1, '030401-202205-0013', '202205', 'P', 280, 'Opusisv', 'Siti', '2', NULL, '1', NULL, NULL, 0, 0, 1, '2022-05-26', '1992-10-10', '0000-00-00', '2022-05-26', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `profile_kategorial`
--

CREATE TABLE `profile_kategorial` (
  `id` int(11) NOT NULL,
  `id_profile` int(11) DEFAULT NULL,
  `id_kategorial` int(11) DEFAULT NULL,
  `tanggal` date DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `profile_kategorial`
--

INSERT INTO `profile_kategorial` (`id`, `id_profile`, `id_kategorial`, `tanggal`, `status`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 178, 12, '2022-05-19', 1, '2022-05-19 13:13:03', NULL, NULL),
(2, 179, 12, '2022-05-19', 1, '2022-05-19 13:13:03', NULL, NULL),
(3, 180, 13, '2022-05-19', 1, '2022-05-19 13:13:04', NULL, NULL),
(4, 181, 13, '2022-05-19', 1, '2022-05-19 13:13:04', NULL, NULL),
(5, 183, 12, '2022-05-19', 1, '2022-05-19 13:35:58', NULL, NULL),
(6, 184, 12, '2022-05-19', 1, '2022-05-19 13:35:58', NULL, NULL),
(7, 185, 13, '2022-05-19', 1, '2022-05-19 13:35:58', NULL, NULL),
(8, 186, 13, '2022-05-19', 1, '2022-05-19 13:35:58', NULL, NULL),
(9, 187, 12, '2022-05-19', 1, '2022-05-19 18:58:33', NULL, NULL),
(10, 188, 12, '2022-05-19', 1, '2022-05-19 18:58:33', NULL, NULL),
(11, 189, 13, '2022-05-19', 1, '2022-05-19 18:58:33', NULL, NULL),
(12, 190, 13, '2022-05-19', 1, '2022-05-19 18:58:34', NULL, NULL),
(13, 191, 11, '2022-05-23', 1, '2022-05-23 17:15:03', NULL, NULL),
(14, 192, 11, '2022-05-23', 1, '2022-05-23 17:15:04', NULL, NULL),
(15, 193, 11, '2022-05-23', 1, '2022-05-23 17:15:04', NULL, NULL),
(16, 194, 14, '2022-05-23', 1, '2022-05-23 17:15:04', NULL, NULL),
(17, 195, 15, '2022-05-23', 1, '2022-05-23 17:15:04', NULL, NULL),
(18, 196, 11, '2022-05-23', 1, '2022-05-23 17:15:04', NULL, NULL),
(19, 197, 11, '2022-05-23', 1, '2022-05-23 17:15:04', NULL, NULL),
(20, 198, 15, '2022-05-23', 1, '2022-05-23 17:15:04', NULL, NULL),
(21, 199, 15, '2022-05-23', 1, '2022-05-23 17:15:04', NULL, NULL),
(22, 200, 15, '2022-05-23', 1, '2022-05-23 17:15:05', NULL, NULL),
(23, 201, 10, '2022-05-23', 1, '2022-05-23 17:15:05', NULL, NULL),
(24, 202, 10, '2022-05-23', 1, '2022-05-23 17:15:05', NULL, NULL),
(25, 203, 0, '2022-05-23', 1, '2022-05-23 17:15:05', NULL, NULL),
(26, 204, 0, '2022-05-23', 1, '2022-05-23 17:15:05', NULL, NULL),
(27, 205, 0, '2022-05-23', 1, '2022-05-23 17:15:05', NULL, NULL),
(28, 206, 0, '2022-05-23', 1, '2022-05-23 17:15:05', NULL, NULL),
(29, 207, 0, '2022-05-23', 1, '2022-05-23 17:15:05', NULL, NULL),
(30, 208, 0, '2022-05-23', 1, '2022-05-23 17:15:05', NULL, NULL),
(31, 209, 0, '2022-05-23', 1, '2022-05-23 17:15:05', NULL, NULL),
(32, 210, 0, '2022-05-23', 1, '2022-05-23 17:15:05', NULL, NULL),
(33, 211, 0, '2022-05-23', 1, '2022-05-23 17:15:05', NULL, NULL),
(34, 212, 15, '2022-05-23', 1, '2022-05-23 17:15:06', NULL, NULL),
(35, 213, 11, '2022-05-23', 1, '2022-05-23 17:15:06', NULL, NULL),
(36, 214, 0, '2022-05-23', 1, '2022-05-23 17:15:06', NULL, NULL),
(37, 215, 11, '2022-05-23', 1, '2022-05-23 17:15:06', NULL, NULL),
(38, 216, 0, '2022-05-23', 1, '2022-05-23 17:15:06', NULL, NULL),
(39, 217, 0, '2022-05-23', 1, '2022-05-23 17:15:06', NULL, NULL),
(40, 218, 0, '2022-05-23', 1, '2022-05-23 17:15:06', NULL, NULL),
(41, 219, 0, '2022-05-23', 1, '2022-05-23 17:15:06', NULL, NULL),
(42, 220, 0, '2022-05-23', 1, '2022-05-23 17:15:06', NULL, NULL),
(43, 221, 0, '2022-05-23', 1, '2022-05-23 17:15:06', NULL, NULL),
(44, 222, 11, '2022-05-23', 1, '2022-05-23 17:15:07', NULL, NULL),
(45, 223, 11, '2022-05-23', 1, '2022-05-23 17:15:07', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `profile_keaktifan`
--

CREATE TABLE `profile_keaktifan` (
  `id` int(11) NOT NULL,
  `id_profile` int(11) DEFAULT NULL,
  `id_jabatan` int(11) DEFAULT NULL,
  `tanggal_mulai` date DEFAULT NULL,
  `tanggal_selesai` date DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `kode_master` varchar(20) DEFAULT NULL,
  `id_master` int(11) DEFAULT NULL,
  `text_master` text DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `profile_keaktifan`
--

INSERT INTO `profile_keaktifan` (`id`, `id_profile`, `id_jabatan`, `tanggal_mulai`, `tanggal_selesai`, `status`, `kode_master`, `id_master`, `text_master`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 190, 1, '2022-05-18', '0000-00-00', 1, 'Pengarah', 1, 'Pengarah A', '2022-05-21 13:33:30', NULL, NULL),
(2, 226, 2, '2022-05-11', '0000-00-00', 1, 'Komisi', 1, 'Komisi 1', '2022-05-24 15:05:04', NULL, NULL),
(3, 226, 1, '2022-01-01', '0000-00-00', 1, 'Pengarah', 4, 'Pengarah C', '2022-05-24 15:05:17', NULL, NULL),
(4, 226, 1, '2022-02-01', '0000-00-00', 1, 'Kepanitiaan', 2, '2', '2022-05-24 15:08:13', NULL, NULL),
(5, 225, 2, '2022-02-01', '0000-00-00', 1, 'Kepanitiaan', 1, 'ABC', '2022-05-24 16:48:56', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `profile_keanggotaan`
--

CREATE TABLE `profile_keanggotaan` (
  `id` int(11) NOT NULL,
  `id_profile` int(11) DEFAULT NULL,
  `id_kategori_keanggotaan` int(11) DEFAULT NULL,
  `tanggal` date DEFAULT NULL,
  `id_approver` int(11) DEFAULT NULL,
  `tanggal_approval` datetime DEFAULT NULL,
  `status` int(11) DEFAULT NULL COMMENT '1=menungu, 2=diterima. 3=ditolaj',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `profile_keanggotaan`
--

INSERT INTO `profile_keanggotaan` (`id`, `id_profile`, `id_kategori_keanggotaan`, `tanggal`, `id_approver`, `tanggal_approval`, `status`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 178, 2, '2022-05-19', NULL, NULL, 2, '2022-05-19 13:13:03', NULL, NULL),
(2, 179, 2, '2022-05-19', NULL, NULL, 2, '2022-05-19 13:13:03', NULL, NULL),
(3, 180, 1, '2022-05-19', NULL, NULL, 2, '2022-05-19 13:13:04', NULL, NULL),
(4, 181, 1, '2022-05-19', NULL, NULL, 2, '2022-05-19 13:13:04', NULL, NULL),
(5, 182, 1, '2022-05-19', NULL, NULL, 1, NULL, NULL, NULL),
(6, 183, 2, '2022-05-19', NULL, NULL, 2, '2022-05-19 13:35:58', NULL, NULL),
(7, 184, 2, '2022-05-19', NULL, NULL, 2, '2022-05-19 13:35:58', NULL, NULL),
(8, 185, 1, '2022-05-19', NULL, NULL, 2, '2022-05-19 13:35:58', NULL, NULL),
(9, 186, 1, '2022-05-19', NULL, NULL, 2, '2022-05-19 13:35:58', NULL, NULL),
(10, 187, 2, '2022-05-19', NULL, NULL, 2, '2022-05-19 18:58:33', NULL, NULL),
(11, 188, 2, '2022-05-19', NULL, NULL, 2, '2022-05-19 18:58:33', NULL, NULL),
(12, 189, 1, '2022-05-19', NULL, NULL, 2, '2022-05-19 18:58:33', NULL, NULL),
(13, 190, 1, '2022-05-19', NULL, NULL, 2, '2022-05-19 18:58:34', NULL, NULL),
(14, 191, 2, '2022-05-23', NULL, NULL, 2, '2022-05-23 17:15:03', NULL, NULL),
(15, 192, 2, '2022-05-23', NULL, NULL, 2, '2022-05-23 17:15:04', NULL, NULL),
(16, 193, 2, '2022-05-23', NULL, NULL, 2, '2022-05-23 17:15:04', NULL, NULL),
(17, 194, 2, '2022-05-23', NULL, NULL, 2, '2022-05-23 17:15:04', NULL, NULL),
(18, 195, 2, '2022-05-23', NULL, NULL, 2, '2022-05-23 17:15:04', NULL, NULL),
(19, 196, 2, '2022-05-23', NULL, NULL, 2, '2022-05-23 17:15:04', NULL, NULL),
(20, 197, 2, '2022-05-23', NULL, NULL, 2, '2022-05-23 17:15:04', NULL, NULL),
(21, 198, 2, '2022-05-23', NULL, NULL, 2, '2022-05-23 17:15:04', NULL, NULL),
(22, 199, 2, '2022-05-23', NULL, NULL, 2, '2022-05-23 17:15:04', NULL, NULL),
(23, 200, 2, '2022-05-23', NULL, NULL, 2, '2022-05-23 17:15:05', NULL, NULL),
(24, 201, 2, '2022-05-23', NULL, NULL, 2, '2022-05-23 17:15:05', NULL, NULL),
(25, 202, 2, '2022-05-23', NULL, NULL, 2, '2022-05-23 17:15:05', NULL, NULL),
(26, 203, 1, '2022-05-23', NULL, NULL, 2, '2022-05-23 17:15:05', NULL, NULL),
(27, 204, 1, '2022-05-23', NULL, NULL, 2, '2022-05-23 17:15:05', NULL, NULL),
(28, 205, 1, '2022-05-23', NULL, NULL, 2, '2022-05-23 17:15:05', NULL, NULL),
(29, 206, 1, '2022-05-23', NULL, NULL, 2, '2022-05-23 17:15:05', NULL, NULL),
(30, 207, 1, '2022-05-23', NULL, NULL, 2, '2022-05-23 17:15:05', NULL, NULL),
(31, 208, 1, '2022-05-23', NULL, NULL, 2, '2022-05-23 17:15:05', NULL, NULL),
(32, 209, 1, '2022-05-23', NULL, NULL, 2, '2022-05-23 17:15:05', NULL, NULL),
(33, 210, 1, '2022-05-23', NULL, NULL, 2, '2022-05-23 17:15:05', NULL, NULL),
(34, 211, 1, '2022-05-23', NULL, NULL, 2, '2022-05-23 17:15:05', NULL, NULL),
(35, 212, 2, '2022-05-23', NULL, NULL, 2, '2022-05-23 17:15:06', NULL, NULL),
(36, 213, 2, '2022-05-23', NULL, NULL, 2, '2022-05-23 17:15:06', NULL, NULL),
(37, 214, 1, '2022-05-23', NULL, NULL, 2, '2022-05-23 17:15:06', NULL, NULL),
(38, 215, 2, '2022-05-23', NULL, NULL, 2, '2022-05-23 17:15:06', NULL, NULL),
(39, 216, 2, '2022-05-23', NULL, NULL, 2, '2022-05-23 17:15:06', NULL, NULL),
(40, 217, 1, '2022-05-23', NULL, NULL, 2, '2022-05-23 17:15:06', NULL, NULL),
(41, 218, 2, '2022-05-23', NULL, NULL, 2, '2022-05-23 17:15:06', NULL, NULL),
(42, 219, 2, '2022-05-23', NULL, NULL, 2, '2022-05-23 17:15:06', NULL, NULL),
(43, 220, 1, '2022-05-23', NULL, NULL, 2, '2022-05-23 17:15:06', NULL, NULL),
(44, 221, 1, '2022-05-23', NULL, NULL, 2, '2022-05-23 17:15:06', NULL, NULL),
(45, 222, 2, '2022-05-23', NULL, NULL, 2, '2022-05-23 17:15:07', NULL, NULL),
(46, 223, 2, '2022-05-23', NULL, NULL, 2, '2022-05-23 17:15:07', NULL, NULL),
(47, 224, 1, '2022-05-24', NULL, NULL, 1, NULL, NULL, NULL),
(48, 225, 1, '2022-05-24', NULL, NULL, 4, NULL, '2022-05-24 15:41:50', NULL),
(50, 225, 2, '2022-05-24', NULL, NULL, 3, '2022-05-24 15:42:42', '2022-05-24 15:43:38', NULL),
(51, 225, 1, '2022-05-24', NULL, NULL, 2, '2022-05-24 16:51:31', '2022-05-24 16:51:46', NULL),
(52, 225, 2, '2022-05-24', NULL, NULL, 3, '2022-05-24 16:52:28', '2022-05-24 16:52:37', NULL),
(53, 226, 1, '2022-05-26', NULL, NULL, 4, '2022-05-26 06:24:16', '2022-05-26 06:24:23', NULL),
(54, 226, 2, '2022-05-26', 224, '2022-05-26 06:26:35', 2, '2022-05-26 06:26:22', '2022-05-26 06:26:35', NULL),
(55, 227, 1, '2022-05-26', NULL, NULL, 1, NULL, NULL, NULL),
(56, 228, 1, '2022-05-26', NULL, NULL, 1, NULL, NULL, NULL),
(57, 229, 1, '2022-05-26', NULL, NULL, 1, NULL, NULL, NULL),
(58, 230, 1, '2022-05-26', NULL, NULL, 1, NULL, NULL, NULL),
(59, 231, 1, '2022-05-26', NULL, NULL, 1, NULL, NULL, NULL),
(60, 232, 1, '2022-05-26', NULL, NULL, 1, NULL, NULL, NULL),
(61, 233, 1, '2022-05-26', NULL, NULL, 1, NULL, NULL, NULL),
(62, 234, 1, '2022-05-26', NULL, NULL, 1, NULL, NULL, NULL),
(63, 235, 1, '2022-05-26', NULL, NULL, 1, NULL, NULL, NULL),
(64, 236, 1, '2022-05-26', NULL, NULL, 1, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `profile_wilayah`
--

CREATE TABLE `profile_wilayah` (
  `id` int(11) NOT NULL,
  `id_profile` int(11) DEFAULT NULL,
  `id_wilayah` int(11) DEFAULT NULL,
  `tanggal` date DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `profile_wilayah`
--

INSERT INTO `profile_wilayah` (`id`, `id_profile`, `id_wilayah`, `tanggal`, `status`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 178, 5, '2022-05-19', 1, '2022-05-19 13:13:03', NULL, NULL),
(2, 179, 5, '2022-05-19', 1, '2022-05-19 13:13:03', NULL, NULL),
(3, 180, 6, '2022-05-19', 1, '2022-05-19 13:13:04', NULL, NULL),
(4, 181, 6, '2022-05-19', 1, '2022-05-19 13:13:04', NULL, NULL),
(5, 183, 5, '2022-05-19', 1, '2022-05-19 13:35:58', NULL, NULL),
(6, 184, 5, '2022-05-19', 1, '2022-05-19 13:35:58', NULL, NULL),
(7, 185, 6, '2022-05-19', 1, '2022-05-19 13:35:58', NULL, NULL),
(8, 186, 6, '2022-05-19', 1, '2022-05-19 13:35:58', NULL, NULL),
(9, 187, 5, '2022-05-19', 1, '2022-05-19 18:58:33', NULL, NULL),
(10, 188, 5, '2022-05-19', 1, '2022-05-19 18:58:33', NULL, NULL),
(11, 189, 6, '2022-05-19', 1, '2022-05-19 18:58:33', NULL, NULL),
(12, 190, 6, '2022-05-19', 1, '2022-05-19 18:58:34', NULL, NULL),
(13, 191, 7, '2022-05-23', 1, '2022-05-23 17:15:03', NULL, NULL),
(14, 192, 7, '2022-05-23', 1, '2022-05-23 17:15:04', NULL, NULL),
(15, 193, 8, '2022-05-23', 1, '2022-05-23 17:15:04', NULL, NULL),
(16, 194, 8, '2022-05-23', 1, '2022-05-23 17:15:04', NULL, NULL),
(17, 195, 8, '2022-05-23', 1, '2022-05-23 17:15:04', NULL, NULL),
(18, 196, 9, '2022-05-23', 1, '2022-05-23 17:15:04', NULL, NULL),
(19, 197, 9, '2022-05-23', 1, '2022-05-23 17:15:04', NULL, NULL),
(20, 198, 9, '2022-05-23', 1, '2022-05-23 17:15:04', NULL, NULL),
(21, 199, 9, '2022-05-23', 1, '2022-05-23 17:15:04', NULL, NULL),
(22, 200, 9, '2022-05-23', 1, '2022-05-23 17:15:05', NULL, NULL),
(23, 201, 10, '2022-05-23', 1, '2022-05-23 17:15:05', NULL, NULL),
(24, 202, 10, '2022-05-23', 1, '2022-05-23 17:15:05', NULL, NULL),
(25, 203, 8, '2022-05-23', 1, '2022-05-23 17:15:05', NULL, NULL),
(26, 204, 8, '2022-05-23', 1, '2022-05-23 17:15:05', NULL, NULL),
(27, 205, 9, '2022-05-23', 1, '2022-05-23 17:15:05', NULL, NULL),
(28, 206, 9, '2022-05-23', 1, '2022-05-23 17:15:05', NULL, NULL),
(29, 207, 11, '2022-05-23', 1, '2022-05-23 17:15:05', NULL, NULL),
(30, 208, 11, '2022-05-23', 1, '2022-05-23 17:15:05', NULL, NULL),
(31, 209, 11, '2022-05-23', 1, '2022-05-23 17:15:05', NULL, NULL),
(32, 210, 11, '2022-05-23', 1, '2022-05-23 17:15:05', NULL, NULL),
(33, 211, 11, '2022-05-23', 1, '2022-05-23 17:15:05', NULL, NULL),
(34, 212, 12, '2022-05-23', 1, '2022-05-23 17:15:06', NULL, NULL),
(35, 213, 12, '2022-05-23', 1, '2022-05-23 17:15:06', NULL, NULL),
(36, 214, 13, '2022-05-23', 1, '2022-05-23 17:15:06', NULL, NULL),
(37, 215, 13, '2022-05-23', 1, '2022-05-23 17:15:06', NULL, NULL),
(38, 216, 0, '2022-05-23', 1, '2022-05-23 17:15:06', NULL, NULL),
(39, 217, 0, '2022-05-23', 1, '2022-05-23 17:15:06', NULL, NULL),
(40, 218, 13, '2022-05-23', 1, '2022-05-23 17:15:06', NULL, NULL),
(41, 219, 13, '2022-05-23', 1, '2022-05-23 17:15:06', NULL, NULL),
(42, 220, 13, '2022-05-23', 1, '2022-05-23 17:15:06', NULL, NULL),
(43, 221, 13, '2022-05-23', 1, '2022-05-23 17:15:06', NULL, NULL),
(44, 222, 12, '2022-05-23', 1, '2022-05-23 17:15:07', NULL, NULL),
(45, 223, 12, '2022-05-23', 1, '2022-05-23 17:15:07', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `repository`
--

CREATE TABLE `repository` (
  `id` int(11) NOT NULL,
  `kategori` varchar(15) NOT NULL,
  `judul` varchar(100) NOT NULL,
  `keterangan` varchar(250) NOT NULL,
  `attachment` varchar(100) DEFAULT NULL,
  `status` int(1) NOT NULL COMMENT '2 Tidak Aktif | 1 Aktif | 3 Deleted',
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT NULL ON UPDATE current_timestamp(),
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `resiko`
--

CREATE TABLE `resiko` (
  `id` int(11) NOT NULL,
  `nama` varchar(255) DEFAULT NULL,
  `status` char(1) NOT NULL COMMENT '0 = dibuat, 1 = aktif, 2 = tidak aktif',
  `created_at` date DEFAULT NULL,
  `updated_at` date DEFAULT NULL,
  `deleted_at` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `resiko`
--

INSERT INTO `resiko` (`id`, `nama`, `status`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'High', '1', '2021-09-28', '2021-09-28', NULL),
(2, 'Medium', '1', '2021-09-28', NULL, NULL),
(3, 'Low', '1', '2021-09-28', NULL, NULL),
(4, 'baru', '3', '2021-10-06', '2021-10-08', '2021-10-08'),
(5, 'TEST', '3', '2021-10-08', '2021-10-08', '2021-10-08'),
(6, 'Low', '3', '2021-10-11', '2022-01-04', '2022-01-04'),
(7, 'Low', '3', '2021-10-11', '2022-01-04', '2022-01-04'),
(8, 'Low', '3', '2021-10-21', '2022-01-04', '2022-01-04'),
(9, 'Low', '3', '2022-01-11', '2022-01-11', '2022-01-11');

-- --------------------------------------------------------

--
-- Table structure for table `role_aplikasi`
--

CREATE TABLE `role_aplikasi` (
  `rola_id` int(11) NOT NULL,
  `rola_menu_id` int(11) NOT NULL,
  `rola_lev_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `role_aplikasi`
--

INSERT INTO `role_aplikasi` (`rola_id`, `rola_menu_id`, `rola_lev_id`, `created_at`) VALUES
(3, 4, 1, '2021-07-14 12:27:17'),
(4, 5, 1, '2021-07-14 12:27:25'),
(5, 6, 1, '2021-07-14 12:27:31'),
(16, 1, 3, '2021-07-14 13:08:09'),
(17, 7, 3, '2021-07-14 13:08:17'),
(28, 1, 4, '2021-07-14 13:11:37'),
(29, 7, 4, '2021-07-14 13:11:46'),
(36, 1, 5, '2021-07-14 13:13:49'),
(37, 7, 5, '2021-07-14 13:13:56'),
(40, 32, 5, '2021-07-14 13:14:57'),
(105, 74, 1, '2021-08-19 06:58:31'),
(141, 93, 1, '2021-09-17 03:49:15'),
(147, 82, 1, '2021-09-23 05:26:15'),
(148, 96, 1, '2021-09-23 05:26:15'),
(151, 99, 1, '2021-09-23 05:26:15'),
(152, 100, 1, '2021-09-23 05:26:15'),
(153, 101, 1, '2021-09-23 05:32:46'),
(154, 102, 1, '2021-09-23 05:35:34'),
(156, 113, 1, '2021-09-23 05:36:04'),
(157, 106, 1, '2021-09-28 07:17:20'),
(160, 109, 1, '2021-10-05 01:04:39'),
(163, 97, 14, '2021-10-06 16:12:35'),
(164, 98, 14, '2021-10-06 16:12:38'),
(165, 99, 14, '2021-10-06 16:12:39'),
(166, 1, 12, '2021-10-08 12:38:08'),
(168, 82, 12, '2021-10-08 12:38:12'),
(169, 96, 12, '2021-10-08 12:40:16'),
(170, 101, 12, '2021-10-08 12:40:18'),
(171, 7, 12, '2021-10-08 12:41:30'),
(172, 1, 11, '2021-10-08 12:43:18'),
(173, 7, 11, '2021-10-08 12:43:22'),
(174, 97, 11, '2021-10-08 12:43:23'),
(175, 98, 11, '2021-10-08 12:43:23'),
(176, 99, 11, '2021-10-08 12:43:24'),
(177, 100, 11, '2021-10-08 12:43:25'),
(178, 1, 124, '2021-10-12 03:30:39'),
(179, 82, 124, '2021-10-12 03:30:42'),
(180, 96, 124, '2021-10-12 03:30:55'),
(181, 101, 124, '2021-10-12 03:30:56'),
(183, 102, 124, '2021-10-12 03:30:57'),
(184, 106, 124, '2021-10-12 03:30:58'),
(185, 109, 124, '2021-10-12 03:30:59'),
(188, 98, 124, '2021-10-12 03:31:03'),
(189, 99, 124, '2021-10-12 03:31:06'),
(190, 100, 124, '2021-10-12 03:31:07'),
(191, 104, 124, '2021-10-12 03:31:22'),
(192, 6, 124, '2021-10-12 03:31:23'),
(193, 1, 125, '2021-10-12 03:33:15'),
(194, 82, 125, '2021-10-12 03:33:15'),
(195, 96, 125, '2021-10-12 03:33:16'),
(196, 101, 125, '2021-10-12 03:33:16'),
(197, 102, 125, '2021-10-12 03:33:17'),
(199, 106, 125, '2021-10-12 03:33:19'),
(200, 109, 125, '2021-10-12 03:33:19'),
(202, 97, 125, '2021-10-12 03:33:25'),
(203, 98, 125, '2021-10-12 03:33:29'),
(204, 99, 125, '2021-10-12 03:33:29'),
(205, 100, 125, '2021-10-12 03:33:29'),
(206, 6, 125, '2021-10-12 03:33:38'),
(207, 104, 125, '2021-10-12 03:33:39'),
(208, 2, 125, '2021-10-12 03:33:41'),
(209, 2, 124, '2021-10-12 03:35:07'),
(211, 1, 126, '2021-10-12 03:38:07'),
(212, 2, 126, '2021-10-12 03:38:15'),
(213, 6, 126, '2021-10-12 03:38:16'),
(214, 104, 126, '2021-10-12 03:38:17'),
(216, 97, 126, '2021-10-12 03:38:36'),
(217, 98, 126, '2021-10-12 03:38:36'),
(218, 99, 126, '2021-10-12 03:38:37'),
(219, 100, 126, '2021-10-12 03:38:37'),
(220, 1, 123, '2021-10-12 03:40:03'),
(224, 2, 123, '2021-10-14 03:41:00'),
(225, 103, 124, '2021-10-18 06:32:36'),
(226, 110, 124, '2021-10-18 06:32:37'),
(227, 111, 124, '2021-10-18 06:32:38'),
(228, 103, 125, '2021-10-18 06:32:46'),
(229, 110, 125, '2021-10-18 06:32:47'),
(230, 111, 125, '2021-10-18 06:32:47'),
(231, 103, 1, '2021-10-18 06:33:15'),
(232, 110, 1, '2021-10-18 06:33:17'),
(233, 111, 1, '2021-10-18 06:33:17'),
(239, 114, 1, '2021-11-03 07:34:54'),
(241, 2, 1, '2021-11-11 10:52:18'),
(242, 104, 1, '2021-11-11 10:53:32'),
(244, 118, 124, '2021-11-15 11:06:38'),
(245, 118, 125, '2021-11-15 11:06:38'),
(246, 118, 126, '2021-11-15 11:06:38'),
(248, 98, 1, '2021-11-15 11:33:12'),
(249, 115, 1, '2021-11-16 09:59:12'),
(250, 114, 125, '2021-12-07 10:25:42'),
(251, 116, 1, '2021-12-10 04:09:29'),
(252, 117, 1, '2021-12-10 04:09:30'),
(254, 118, 1, '2022-01-14 07:13:05'),
(255, 119, 1, '2022-01-21 04:08:43'),
(256, 120, 1, '2022-02-08 20:55:10'),
(257, 121, 1, '2022-02-08 20:55:36'),
(258, 122, 1, '2022-02-09 07:33:00'),
(259, 123, 1, '2022-02-09 07:54:44'),
(260, 113, 124, '2022-02-10 06:31:12'),
(261, 114, 124, '2022-02-10 06:31:33'),
(262, 114, 126, '2022-02-10 06:35:12'),
(266, 125, 1, '2022-03-01 02:49:50'),
(267, 127, 1, '2022-03-01 05:07:48'),
(268, 126, 1, '2022-03-01 05:07:49'),
(269, 128, 1, '2022-03-05 19:24:53'),
(270, 129, 1, '2022-03-21 05:02:01'),
(271, 97, 124, '2022-03-24 03:47:34'),
(272, 97, 1, '2022-03-24 03:47:49'),
(273, 130, 1, '2022-03-25 05:54:52'),
(274, 131, 1, '2022-03-25 05:54:54'),
(275, 132, 1, '2022-04-01 19:09:02'),
(276, 133, 1, '2022-04-01 19:09:03'),
(277, 134, 1, '2022-04-01 19:09:04'),
(278, 135, 1, '2022-04-01 19:09:05'),
(279, 136, 1, '2022-04-22 10:02:18'),
(281, 138, 1, '2022-05-09 08:47:38'),
(282, 139, 1, '2022-05-24 00:21:27'),
(283, 1, 1, '2022-05-28 06:41:13'),
(284, 140, 1, '2022-05-28 07:39:27'),
(285, 142, 1, '2022-05-28 07:44:28'),
(286, 143, 1, '2022-05-28 07:44:29'),
(287, 145, 1, '2022-05-28 07:44:31'),
(288, 146, 1, '2022-05-28 07:44:31'),
(289, 147, 1, '2022-05-28 07:44:32'),
(290, 148, 1, '2022-05-28 07:50:30'),
(291, 151, 1, '2022-05-28 07:52:19'),
(292, 144, 1, '2022-05-28 13:23:58'),
(293, 152, 1, '2022-05-28 14:35:07'),
(294, 153, 1, '2022-05-29 20:36:38'),
(295, 154, 1, '2022-05-29 20:36:39'),
(296, 155, 1, '2022-05-29 20:36:40');

-- --------------------------------------------------------

--
-- Table structure for table `role_users`
--

CREATE TABLE `role_users` (
  `role_id` int(11) NOT NULL,
  `role_user_id` int(11) NOT NULL,
  `role_lev_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `role_users`
--

INSERT INTO `role_users` (`role_id`, `role_user_id`, `role_lev_id`, `created_at`) VALUES
(1, 1, 1, '2020-06-18 09:39:26'),
(204, 222, 123, '2022-05-19 06:13:03'),
(205, 223, 123, '2022-05-19 06:13:03'),
(206, 224, 123, '2022-05-19 06:13:04'),
(207, 225, 123, '2022-05-19 06:13:04'),
(208, 226, 123, '2022-05-19 06:27:28'),
(209, 227, 123, '2022-05-19 06:35:58'),
(210, 228, 123, '2022-05-19 06:35:58'),
(211, 229, 123, '2022-05-19 06:35:58'),
(212, 230, 123, '2022-05-19 06:35:58'),
(213, 231, 123, '2022-05-19 11:58:33'),
(214, 232, 123, '2022-05-19 11:58:33'),
(215, 233, 123, '2022-05-19 11:58:33'),
(216, 234, 123, '2022-05-19 11:58:34'),
(217, 235, 123, '2022-05-23 10:15:03'),
(218, 236, 123, '2022-05-23 10:15:04'),
(219, 237, 123, '2022-05-23 10:15:04'),
(220, 238, 123, '2022-05-23 10:15:04'),
(221, 239, 123, '2022-05-23 10:15:04'),
(222, 240, 123, '2022-05-23 10:15:04'),
(223, 241, 123, '2022-05-23 10:15:04'),
(224, 242, 123, '2022-05-23 10:15:04'),
(225, 243, 123, '2022-05-23 10:15:04'),
(226, 244, 123, '2022-05-23 10:15:05'),
(227, 245, 123, '2022-05-23 10:15:05'),
(228, 246, 123, '2022-05-23 10:15:05'),
(229, 247, 123, '2022-05-23 10:15:05'),
(230, 248, 123, '2022-05-23 10:15:05'),
(231, 249, 123, '2022-05-23 10:15:05'),
(232, 250, 123, '2022-05-23 10:15:05'),
(233, 251, 123, '2022-05-23 10:15:05'),
(234, 252, 123, '2022-05-23 10:15:05'),
(235, 253, 123, '2022-05-23 10:15:05'),
(236, 254, 123, '2022-05-23 10:15:05'),
(237, 255, 123, '2022-05-23 10:15:05'),
(238, 256, 123, '2022-05-23 10:15:06'),
(239, 257, 123, '2022-05-23 10:15:06'),
(240, 258, 123, '2022-05-23 10:15:06'),
(241, 259, 123, '2022-05-23 10:15:06'),
(242, 260, 123, '2022-05-23 10:15:06'),
(243, 261, 123, '2022-05-23 10:15:06'),
(244, 262, 123, '2022-05-23 10:15:06'),
(245, 263, 123, '2022-05-23 10:15:06'),
(246, 264, 123, '2022-05-23 10:15:06'),
(247, 265, 123, '2022-05-23 10:15:06'),
(248, 266, 123, '2022-05-23 10:15:07'),
(249, 267, 123, '2022-05-23 10:15:07'),
(250, 268, 125, '2022-05-24 02:09:28'),
(251, 269, 123, '2022-05-24 07:46:57'),
(252, 270, 123, '2022-05-24 07:50:09'),
(253, 271, 123, '2022-05-26 03:22:31'),
(254, 272, 123, '2022-05-26 03:22:58'),
(255, 273, 124, '2022-05-26 05:01:28'),
(256, 274, 123, '2022-05-26 05:05:42'),
(257, 275, 123, '2022-05-26 05:06:18'),
(258, 276, 123, '2022-05-26 05:07:21'),
(259, 277, 123, '2022-05-26 10:38:04'),
(260, 278, 123, '2022-05-26 10:38:33'),
(261, 279, 123, '2022-05-26 10:43:55'),
(262, 280, 123, '2022-05-26 10:44:22');

-- --------------------------------------------------------

--
-- Table structure for table `spm`
--

CREATE TABLE `spm` (
  `id` int(11) NOT NULL,
  `judul` varchar(100) NOT NULL,
  `id_trainer` int(11) NOT NULL,
  `bahan` varchar(100) DEFAULT NULL,
  `absensi` varchar(100) DEFAULT NULL,
  `status` int(1) NOT NULL COMMENT '2 Tidak Aktif | 1 Aktif | 3 Deleted',
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT NULL ON UPDATE current_timestamp(),
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `template_download`
--

CREATE TABLE `template_download` (
  `id` int(11) NOT NULL,
  `tahapan` varchar(50) NOT NULL,
  `kategori` varchar(50) NOT NULL,
  `no_urut` int(11) DEFAULT NULL,
  `nama` varchar(100) DEFAULT NULL,
  `berkas` varchar(250) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `template_download`
--

INSERT INTO `template_download` (`id`, `tahapan`, `kategori`, `no_urut`, `nama`, `berkas`, `status`, `created_at`) VALUES
(11, 'Planning', 'Timeline', 1, 'Timeline AMS Audit Any 2022', 'Template_Planning_1_-_Timeline_AMS_Audit_Any_2022.pdf', 1, '2022-02-01 10:22:41'),
(12, 'Planning', 'SDM', 1, 'SDM AMS Audit Any 2022', 'Template_Planning_2_-SDM_AMS_Audit_Any_2022.pdf', 1, '2022-02-01 10:23:17'),
(13, 'Planning', 'Data Yang Diminta', 1, 'Data yang diminta AMS Audit Any 2022', 'Template_Planning_3_-_Data_yang_diminta_AMS_Audit_Any_2022.pdf', 1, '2022-02-01 10:23:40'),
(14, 'Proses Audit', 'Kertas Kerja', 1, 'Kertas Kerja 01  - Introduction Lab Auditng AMS Audit Any 2022', 'Template_Proses_Audit_-_Kertas_Kerja_01_-_Introduction_Lab_Auditng_AMS_Audit_Any_2022.pdf', 1, '2022-02-01 10:28:56'),
(15, 'Proses Audit', 'Kertas Kerja', 2, 'Kertas Kerja 02 - SPM AMS Audit Any 2022', 'Template_Proses_Audit_-_Kertas_Kerja_02_-_SPM_AMS_Audit_Any_2022.pdf', 1, '2022-02-01 10:29:25'),
(16, 'Proses Audit', 'Kertas Kerja', 3, 'Kertas Kerja 03 - KYC AMS Audit Any 2022', 'Template_Proses_Audit_-_Kertas_Kerja_03_-_KYC_AMS_Audit_Any_2022.pdf', 1, '2022-02-01 10:29:42'),
(17, 'Proses Audit', 'Kertas Kerja', 4, 'Kertas Kerja 04 - Kas & Setara Kas AMS Audit Any 2022', 'Template_Proses_Audit_-_Kertas_Kerja_04_-_Kas_Setara_Kas_AMS_Audit_Any_2022.pdf', 1, '2022-02-01 10:29:56'),
(18, 'Proses Audit', 'Kertas Kerja', 5, 'Kertas Kerja 05 - Piutang AMS Audit Any 2022', 'Template_Proses_Audit_-_Kertas_Kerja_05_-_Piutang_AMS_Audit_Any_2022.pdf', 1, '2022-02-01 10:30:26'),
(19, 'Proses Audit', 'Kertas Kerja', 6, 'Kertas Kerja 06 - Persediaan AMS Audit Any 2022', 'Template_Proses_Audit_-_Kertas_Kerja_06_-_Persediaan_AMS_Audit_Any_2022.pdf', 1, '2022-02-01 10:30:43'),
(20, 'Proses Audit', 'Kertas Kerja', 7, 'Kertas Kerja 07 - Aset Tetap AMS Audit Any 2022', 'Template_Proses_Audit_-_Kertas_Kerja_07_-_Aset_Tetap_AMS_Audit_Any_2022.pdf', 1, '2022-02-01 10:30:59'),
(21, 'Proses Audit', 'Kertas Kerja', 8, 'Kertas Kerja 08 - Utang AMS Audit Any 2022', 'Template_Proses_Audit_-_Kertas_Kerja_08_-_Utang_AMS_Audit_Any_2022.pdf', 1, '2022-02-01 10:31:16'),
(22, 'Proses Audit', 'Kertas Kerja', 9, 'Kertas Kerja 09  - Pendapatan AMS Audit Any 2022', 'Template_Proses_Audit_-_Kertas_Kerja_09_-_Pendapatan_AMS_Audit_Any_2022.pdf', 1, '2022-02-01 10:31:34'),
(23, 'Proses Audit', 'Kertas Kerja', 10, 'Kertas Kerja 10  - HPP AMS Audit Any 2022', 'Template_Proses_Audit_-_Kertas_Kerja_10_-_HPP_AMS_Audit_Any_2022.pdf', 1, '2022-02-01 10:31:51'),
(24, 'Proses Audit', 'Kertas Kerja', 11, 'Kertas Kerja 11  - Opini Auditor AMS Audit Any 2022', 'Template_Proses_Audit_-_Kertas_Kerja_11_-_Opini_Auditor_AMS_Audit_Any_2022.pdf', 1, '2022-02-01 10:32:03'),
(25, 'Proses Audit', 'Pengujian', 1, 'Pengujian 1 - Pengujian Materialitas AMS Audit Any 2022', 'Template_Proses_Audit_-_Pengujian_1_-_Pengujian_Materialitas_AMS_Audit_Any_2022.pdf', 1, '2022-02-01 10:32:17'),
(26, 'Report', 'Final Report', 1, 'Draft Final Report  Audit Laporan Keuangan AMS Audit Any 2022', 'Template_Reporting_-_Draft_Final_Report_Audit_Laporan_Keuangan_AMS_Audit_Any_2022.pdf', 1, '2022-02-01 10:32:34');

-- --------------------------------------------------------

--
-- Table structure for table `term_management`
--

CREATE TABLE `term_management` (
  `id` int(11) NOT NULL,
  `id_menu` int(11) NOT NULL,
  `nama` varchar(50) NOT NULL,
  `keterangan` text NOT NULL,
  `status` char(1) NOT NULL COMMENT '0 = dibuat, 1 = aktif, 3 = tidak aktif',
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `term_management`
--

INSERT INTO `term_management` (`id`, `id_menu`, `nama`, `keterangan`, `status`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1, 'Dashboard', '-', '1', '2021-11-03 15:51:04', NULL, NULL),
(2, 3, 'Hak Akses', '-', '1', '2021-11-03 15:51:19', NULL, NULL),
(3, 4, 'Menu', '-', '1', '2021-11-03 15:53:21', NULL, NULL),
(4, 5, 'User role', '-', '1', '2021-11-03 15:53:34', NULL, NULL),
(5, 6, 'Pengguna', '-', '1', '2021-11-03 15:56:17', NULL, NULL),
(6, 7, 'Ubah Password', '-', '1', '2021-11-03 15:56:28', NULL, NULL),
(8, 112, 'Profile', '-', '3', '2021-11-03 15:56:47', NULL, '2022-01-05 13:13:38'),
(9, 96, 'Client Company', '-', '1', '2021-11-03 15:56:58', NULL, NULL),
(10, 101, 'Resiko', '-', '1', '2021-11-03 15:57:10', NULL, NULL),
(11, 102, 'Pengesah', '-', '1', '2021-11-03 15:57:22', NULL, NULL),
(12, 103, 'Tipe Kontak', '-', '1', '2021-11-03 15:57:33', NULL, NULL),
(13, 109, 'Peristiwa Formal', '-', '1', '2021-11-03 15:57:54', NULL, NULL),
(14, 110, 'Jenis Alamat', '-', '1', '2021-11-03 15:58:17', NULL, NULL),
(15, 111, 'Jenis Gelar', '-', '1', '2021-11-03 15:58:55', NULL, NULL),
(16, 114, 'Aktifitas', '-', '1', '2021-11-03 15:59:18', NULL, NULL),
(17, 97, 'P2PK/Modul Audit', '-', '1', '2021-11-03 15:59:38', NULL, NULL),
(18, 98, 'SPM/Modul Training', '-', '1', '2021-11-03 15:59:49', NULL, NULL),
(19, 99, 'Repository', '-', '1', '2021-11-03 16:00:04', NULL, NULL),
(20, 100, 'Audit Log', '-', '1', '2021-11-03 16:00:13', NULL, NULL),
(21, 106, 'Keluarga', '-', '1', '2021-11-03 16:00:23', NULL, NULL),
(23, 118, 'Activity', '-', '1', '2021-11-15 18:06:38', NULL, NULL),
(24, 115, 'Trainer', '-', '1', '2021-11-16 16:59:03', NULL, NULL),
(25, 104, 'Data Member', '-', '3', '2022-01-05 13:13:15', NULL, '2022-01-05 13:14:00'),
(27, 118, 'File Template', '-', '1', '2022-01-14 14:13:37', NULL, NULL),
(28, 124, 'Partner', '-', '1', '2022-03-01 09:56:04', NULL, NULL),
(29, 125, 'Posisi', '-', '1', '2022-03-01 09:56:15', NULL, NULL),
(30, 126, 'Kategorial Umur', '-', '1', '2022-03-01 12:43:14', NULL, NULL),
(31, 127, 'Wilayah CmMS', '-', '1', '2022-03-01 12:43:48', NULL, NULL),
(32, 128, 'Keanggotaan', '-', '1', '2022-03-06 02:25:19', NULL, NULL),
(33, 129, 'Laporan Header', '-', '1', '2022-03-21 14:06:59', NULL, NULL),
(34, 116, 'Kategori (Non User)', '=', '1', '2022-03-31 23:36:19', NULL, NULL),
(35, 132, 'Jabatan2', '-', '1', '2022-04-02 02:10:43', NULL, NULL),
(36, 133, 'Pengarah', '-', '1', '2022-04-02 02:11:26', NULL, NULL),
(37, 134, 'Komisi', '-', '1', '2022-04-02 02:11:38', NULL, NULL),
(38, 135, 'Kepanitiaan', '-', '1', '2022-04-02 02:12:00', NULL, NULL),
(39, 139, 'Pilihan Keaktifan', '-', '1', '2022-05-24 07:36:12', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tipe_contact`
--

CREATE TABLE `tipe_contact` (
  `id` int(11) NOT NULL,
  `nama` varchar(50) NOT NULL,
  `keterangan` varchar(100) DEFAULT NULL,
  `status` int(1) NOT NULL COMMENT '0 Tidak Aktif | 1 Aktif | 2 Deleted',
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT NULL ON UPDATE current_timestamp(),
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tipe_contact`
--

INSERT INTO `tipe_contact` (`id`, `nama`, `keterangan`, `status`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Email', '-', 1, '2021-10-15 17:29:29', '2022-05-14 19:50:26', NULL),
(2, 'Handphone', '-', 1, '2021-10-15 17:37:44', NULL, NULL),
(3, 'Telepon Rumah', '-', 1, '2021-10-15 17:37:58', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tokens`
--

CREATE TABLE `tokens` (
  `id` int(11) NOT NULL,
  `token` varchar(255) NOT NULL,
  `user_id` int(10) NOT NULL,
  `created` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tokens`
--

INSERT INTO `tokens` (`id`, `token`, `user_id`, `created`) VALUES
(135, 'da902c2508ab00608e14fa067011c9', 136, '2022-03-22'),
(136, 'd7600b85bb2d8724f3021c592b37af', 136, '2022-03-22'),
(137, 'c836bf7ee246bff1548ae90bc95d5d', 136, '2022-03-22'),
(138, 'decb6fcd7ff33c72c7d8124d5378a5', 137, '2022-03-22'),
(139, 'f9f32f10a3c5e95082a7c512239776', 138, '2022-03-22');

-- --------------------------------------------------------

--
-- Table structure for table `trainer`
--

CREATE TABLE `trainer` (
  `id` int(11) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `id_profile` int(11) DEFAULT NULL,
  `status` int(1) NOT NULL COMMENT '2 Tidak Aktif | 1 Aktif | 3 Deleted',
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT NULL ON UPDATE current_timestamp(),
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `trainer`
--

INSERT INTO `trainer` (`id`, `nama`, `id_profile`, `status`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Test', 0, 1, '2021-11-16 18:08:39', NULL, NULL),
(2, 'fanny f', 50, 1, '2021-11-16 18:08:52', NULL, NULL),
(3, 'Developer Opusisv', 0, 1, '2021-11-18 13:07:49', NULL, NULL),
(4, 'Mas Giga', 0, 1, '2021-11-18 18:19:54', NULL, NULL),
(5, 'Soni Setiawan', 38, 1, '2021-11-18 18:20:13', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `user_id` int(11) NOT NULL,
  `id_partner` int(11) DEFAULT NULL,
  `id_posisi` int(11) NOT NULL,
  `nik` varchar(30) DEFAULT NULL,
  `user_nama` varchar(50) NOT NULL,
  `user_tgl_lahir` date DEFAULT NULL,
  `user_jk` enum('Laki-Laki','Perempuan') DEFAULT NULL COMMENT 'Jenis Kelamin',
  `user_password` varchar(100) NOT NULL,
  `user_email` varchar(50) DEFAULT NULL,
  `user_email_status` enum('0','1') NOT NULL DEFAULT '0' COMMENT '0 Belum Diverifikasi | 1 Sudah Diverifikasi',
  `user_phone` varchar(15) NOT NULL,
  `user_foto` varchar(255) DEFAULT NULL,
  `user_status` int(1) NOT NULL DEFAULT 0 COMMENT '0 Tidak Aktif | 1 Aktif | 2 Pendding | 3 deleted',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `id_partner`, `id_posisi`, `nik`, `user_nama`, `user_tgl_lahir`, `user_jk`, `user_password`, `user_email`, `user_email_status`, `user_phone`, `user_foto`, `user_status`, `created_at`, `updated_at`) VALUES
(1, NULL, 0, '', 'Super Admin', NULL, NULL, '$2y$10$7XCVzUlzjXOTMq0s90XfMO6bR7Tb2xZB5LgxL1Lw6o2KqoeAi8Vjq', 'administrator.kap@mailinator.com', '1', '08123123', NULL, 1, '2020-06-18 09:39:08', '2020-06-18 09:39:08'),
(222, 43, 1, '030401-197809-0001', 'Zainudin Aruan 6', NULL, NULL, '$2y$10$Adm5SovWev7WTPj/NnDMOO/JIkl4Yih1Xswv5or41mvAMJR7OUcZm', 'zai@mailinator.com', '0', '6282828383', NULL, 1, '2022-05-19 06:13:03', NULL),
(223, 43, 2, '030401-197809-0001', 'Magda Aruan 6', NULL, NULL, '$2y$10$B7OVZ0SgbK.cIDPAl.i.lu/6hEK3kqHn04IEd494aiqxpAAoUm6I.', 'magda@mailinator.com', '0', '6282828383', NULL, 1, '2022-05-19 06:13:03', NULL),
(224, 44, 1, '030401-198809-0001', 'Roi Wungka 6', NULL, NULL, '$2y$10$SPQ08TFJQt22jo/UPlKE5.cT5TIpODtA.R9Ld3doZZpKiIEAKBtrq', 'roi@mailinator.com', '0', '85188779', NULL, 1, '2022-05-19 06:13:04', NULL),
(225, 44, 2, '030401-198809-0001', 'Yulia Wungka 6', NULL, NULL, '$2y$10$M.KHAdm3tZ1y9w.9NAki/uBbK5oopktWDg5lMrWKYxG3Bc6Bzpl/O', 'yuli@mailinator.com', '0', '85188780', NULL, 1, '2022-05-19 06:13:04', NULL),
(226, 25, 1, '030401-202205-0001', 'Su', NULL, NULL, '$2y$10$/REMqj3pH/uUhtBYlOj9O.fW7pMGAc0IXbstOmK/EsqRiBKhe4qJu', 'bensu@mailinator.com', '', '0', NULL, 1, '2022-05-19 06:27:28', NULL),
(227, 41, 1, '030401-197809-0001', 'Zainudin Aruan 5', NULL, NULL, '$2y$10$BVFmqirtJnqS9bzsuYoZz.Gu4wCaaIjYcOsCI2EuY7wdkcsPldig6', 'zai@mailinator.com', '0', '6282828383', NULL, 1, '2022-05-19 06:35:58', NULL),
(228, 41, 2, '030401-197809-0002', 'Magda Aruan 5', NULL, NULL, '$2y$10$d3IlV2S7Kiaj/gPJxP5d9eUgQxEu0l18fehap7zPKSkZvJ2msbre.', 'magda@mailinator.com', '0', '6282828383', NULL, 1, '2022-05-19 06:35:58', NULL),
(229, 42, 1, '030401-198809-0001', 'Roi Wungka 5', NULL, NULL, '$2y$10$ksf8q7pamuULi86meC4KkeyAKZjhE/c0dkIw7KA44pflTEFpkZHYS', 'roi@mailinator.com', '0', '85188779', NULL, 1, '2022-05-19 06:35:58', NULL),
(230, 42, 2, '030401-198809-0003', 'Yulia Wungka 5', NULL, NULL, '$2y$10$GKZjkMs1TYIM1RK49pyEGuWQu96ZIgxVUm9wwsWIg7s51CCUHlyBa', 'yuli@mailinator.com', '0', '85188780', NULL, 1, '2022-05-19 06:35:58', NULL),
(231, 35, 1, '030401-197809-0004', 'Zainudin Aruan 1', NULL, NULL, '$2y$10$Yk5CPTUJenBPwmWjbhyBJ.ckYmVOO5ugHaSIlh/XSLjewzNWUWPuW', 'zai@mailinator.com', '0', '6282828383', NULL, 1, '2022-05-19 11:58:33', NULL),
(232, 35, 2, '030401-197809-0005', 'Magda Aruan 1', NULL, NULL, '$2y$10$2/.x0kmN9Vtv3jWIKSaNWOy1jJzjkoyxadZu2ais0Sa9wt.bPFkiW', 'magda@mailinator.com', '0', '6282828383', NULL, 1, '2022-05-19 11:58:33', NULL),
(233, 36, 1, '030401-198809-0006', 'Roi Wungka 1', NULL, NULL, '$2y$10$F2I4orXHP5k0ozhVTn8CMO4h4opnpYFZ95/MtjjgkjamHAJ4O2YgG', 'roi@mailinator.com', '0', '85188779', NULL, 1, '2022-05-19 11:58:33', NULL),
(234, 36, 2, '030401-198809-0007', 'Yulia Wungka 1', NULL, NULL, '$2y$10$jN0cG5nD7Uiify7eehGiDOZJeKukuSWf3mUGrJKvQz4.tiOpW1/fq', 'yuli@mailinator.com', '0', '85188780', NULL, 1, '2022-05-19 11:58:34', NULL),
(235, 45, 1, '030401-197809-0006', 'Zainuddin Aruan (+) ', NULL, NULL, '$2y$10$N/9Sc5pdWkz/.vyPXqhUB.itT17A1ijGKTc5.luMq/uwjkzz2Fu.C', '', '0', '0', NULL, 1, '2022-05-23 10:15:03', NULL),
(236, 45, 2, '030401-197809-0007', 'Tiologi Magdalena br. Butar-Butar ', NULL, NULL, '$2y$10$GXg5l3WZnOG5IsQWla4vkOa6RMR/CdC9jf.O35iFhSQSvNeT2hslW', '', '0', '0', NULL, 1, '2022-05-23 10:15:04', NULL),
(237, 46, 1, '030401-197809-0008', 'Albert Bismark Josua LumbanTobing ', NULL, NULL, '$2y$10$us6dQ/vd2Fq0a7h0zE2pEeHtF4o.HbL9wYsUdGhtpXvySCUO7DCEe', '', '0', '0', NULL, 1, '2022-05-23 10:15:04', NULL),
(238, 46, 2, '030401-198809-0008', 'Diani Rinarti br. Sitompul ', NULL, NULL, '$2y$10$SlhUz/.eKa9xEIrA92xm.Of8TlwARy.U59Lg8KegSxDzH5fVHjzsq', '', '0', '0', NULL, 1, '2022-05-23 10:15:04', NULL),
(239, 46, 10, '030401-198809-0009', 'Agata Ruth Sofia br. L. Tobing ', NULL, NULL, '$2y$10$BuvjjJACteErqbxukuoHJuwaR.p3hV.WNwHT5Tl9meAZjO3SxBJnG', '', '0', '0', NULL, 1, '2022-05-23 10:15:04', NULL),
(240, 47, 1, '030401-198001-0001', 'Adolf Bastian Siagian, SE ', NULL, NULL, '$2y$10$3X/V9RJaJQIaGYlTWnhX2eP7WZcpGcsBoJpm3MoJlqdlH62uNNmQ6', '', '0', '0', NULL, 1, '2022-05-23 10:15:04', NULL),
(241, 47, 2, '030401-198001-0002', 'Astra Erna Desmawati br. Simanjuntak ', NULL, NULL, '$2y$10$GyN3CuGWljeH8vsor..IbekQW1HU3YCYaMAmqHU27OZ4Jh9LNzBnG', '', '0', '0', NULL, 1, '2022-05-23 10:15:04', NULL),
(242, 47, 10, '030401-198001-0003', 'Adrina Wita Hilderia br. Siagian ', NULL, NULL, '$2y$10$IeYwxYDmuuVC0FI54u.i5.DZltjZBn0zoRdAKdkesTyG7WFXokHTi', '', '0', '0', NULL, 1, '2022-05-23 10:15:04', NULL),
(243, 47, 10, '030401-198001-0004', 'Antonius Imanuel Siagian ', NULL, NULL, '$2y$10$0vQ67YZu46iWuVrl9GCZNepAZ9O7nOXq7UlVgQWr8nV8k720TmZaa', '', '0', '0', NULL, 1, '2022-05-23 10:15:04', NULL),
(244, 47, 10, '030401-198001-0005', 'Alexander Yohanes Siagian ', NULL, NULL, '$2y$10$ntRsYivDPsYjHzGHS1W2mOSzfScUZ2HK9GGRpaSYXFk9SYndHYnU2', '', '0', '0', NULL, 1, '2022-05-23 10:15:05', NULL),
(245, 48, 1, '030401-198001-0006', 'Agus Banson Silitonga (+) ', NULL, NULL, '$2y$10$D3Yk9yjuPCgqxRNyvbtiAedoEGZJqDKfoHol95XsdwOSk0QRFkkYC', '', '0', '0', NULL, 1, '2022-05-23 10:15:05', NULL),
(246, 48, 2, '030401-198001-0007', 'Rosinna br. Simanjuntak ', NULL, NULL, '$2y$10$91YsrwZCHU8ddyFGxi9SLu2h00Mqa/DUHarv6QFe7Eh9.K8J/.4Eq', '', '0', '0', NULL, 1, '2022-05-23 10:15:05', NULL),
(247, 49, 1, '030401-198001-0008', 'Almond Bernad Tampubolon ', NULL, NULL, '$2y$10$deYgrrDc23SDGM8JAmhQ4.Yg4gZrprU4.2e/ohk7pw.14d39RiqHm', '', '0', '0', NULL, 1, '2022-05-23 10:15:05', NULL),
(248, 49, 2, '030401-198001-0009', 'Heike Veronika br. Aruan ', NULL, NULL, '$2y$10$cgKXsHi9iFXOfZr0Fe3jX.qDYtZ9gmLYcVbd4jQmsThnX.9LgQtze', '', '0', '0', NULL, 1, '2022-05-23 10:15:05', NULL),
(249, 49, 1, '030401-198001-0010', 'AB. Tampubolon ', NULL, NULL, '$2y$10$8m3Upa/4V1HN2VEe.s6dR.pm5ZvHA9wL/FBpOnIZIF1or7WRpLFZO', '', '0', '0', NULL, 1, '2022-05-23 10:15:05', NULL),
(250, 49, 2, '030401-198001-0011', 'Heike V. br. Aruan ', NULL, NULL, '$2y$10$SZqQ4rZ9OGw3Q0C94iTeS.2pDA2tBQTPPcGOWeRRYMj3dFOHTriQ6', '', '0', '0', NULL, 1, '2022-05-23 10:15:05', NULL),
(251, 50, 1, '030401-198001-0012', 'Amir Butarbutar (+) ', NULL, NULL, '$2y$10$23PE9i1gWzrEor2dlbF4FeOWwhudFsxZmYeY1idyUYYpQMVEhVUeS', '', '0', '0', NULL, 1, '2022-05-23 10:15:05', NULL),
(252, 50, 2, '030401-198001-0013', 'Martha br. Hasibuan ', NULL, NULL, '$2y$10$DNgXleHfx4izxERwvgnLM.PTxZLoCGFYcluE3DTA4f4ebL5tu8L9q', '', '0', '0', NULL, 1, '2022-05-23 10:15:05', NULL),
(253, 50, 10, '030401-198001-0014', 'Virtor RomaulitTua Butarbutar ', NULL, NULL, '$2y$10$OwX.HqdJlnSzhJSoV512s.noPRvkfc9e.rbezUCBsKkL8xsEoTtky', '', '0', '0', NULL, 1, '2022-05-23 10:15:05', NULL),
(254, 50, 10, '030401-198001-0015', 'Timbul Jaya Baru Butarbutar (+) ', NULL, NULL, '$2y$10$6q2Up59LAZunoqOAuD2jm.KmMZXK8xGQaaYyqgFZV3geZRsuBpQ.6', '', '0', '0', NULL, 1, '2022-05-23 10:15:05', NULL),
(255, 50, 10, '030401-198001-0016', 'Kristin Damai Natalia br. Butarbutar ', NULL, NULL, '$2y$10$n901idwiBs/cR4lR2z52.eg/EU7V/Q5CXmIQU7QNI6D14aBXTUpTe', '', '0', '0', NULL, 1, '2022-05-23 10:15:05', NULL),
(256, 51, 10, '030401-197809-0009', 'Valens SW Wungka ', NULL, NULL, '$2y$10$pe2VzfTKWPTlNJEXjSART.nM4QU..eOrRP31lqU857VLQ9c1omEEi', 'lone1205@hotmail.com', '0', '0', NULL, 1, '2022-05-23 10:15:06', NULL),
(257, 51, 11, '030401-197809-0010', 'Yuliana Wungka ', NULL, NULL, '$2y$10$eff4RJrS228xmI4cGhgk1.KGM762B9BKxLZ.rpewEX6vx5MWnYQNO', '', '0', '0', NULL, 1, '2022-05-23 10:15:06', NULL),
(258, 52, 1, '030401-198809-0010', 'Fredrick Timoti ', NULL, NULL, '$2y$10$Xzjx5YU2iyvOSpNz0uNn0e9dhnHmQzyaaUpxw5.Z7G2DuWfMHMDQK', '', '0', '0', NULL, 1, '2022-05-23 10:15:06', NULL),
(259, 53, 2, '030401-198809-0011', 'Ratnaningsih ', NULL, NULL, '$2y$10$vFn2/SSTPN.LLmiQeKYrDewUya5cI/AfYHavCDjT.RH1JiAMwZnOS', '', '0', '0', NULL, 1, '2022-05-23 10:15:06', NULL),
(260, 54, 2, '030401-198001-0017', 'Feli Jong ', NULL, NULL, '$2y$10$ptInk2JMAJo.Xb38TMJl9eXrkyHNwi8lUbFdeASyeB9qmHmx615CC', '', '0', '0', NULL, 1, '2022-05-23 10:15:06', NULL),
(261, 55, 1, '030401-198001-0018', 'Timothy Wailan ', NULL, NULL, '$2y$10$BqryOzk4qrTO4bAyJ65WJuSsMzOGF04B61hgXCOwCnkBFDoMvEhsS', '', '0', '0', NULL, 1, '2022-05-23 10:15:06', NULL),
(262, 56, 10, '030401-198001-0019', 'Ruth  Allo ', NULL, NULL, '$2y$10$P/Xr53SEkCIlFTB1En8A3epgspVZ/3WR5SNSLhuEGgiHd4fRi5m1i', '', '0', '0', NULL, 1, '2022-05-23 10:15:06', NULL),
(263, 56, 10, '030401-198001-0020', 'Yohana  ', NULL, NULL, '$2y$10$u.nQmCM2.x9jujFK6Empre2ICkjhcLCZcNRRr6VGF0UnydcKwT1GK', '', '0', '0', NULL, 1, '2022-05-23 10:15:06', NULL),
(264, 57, 2, '030401-198001-0021', 'Claudia  Iliadi ', NULL, NULL, '$2y$10$VPWD9mlhLEgDRlr4xXQdc.D3HlM4Ajj4HoZUk8cz2LH3hlPYci2fK', 'claudia.iliadi@gmail.com', '0', '0', NULL, 1, '2022-05-23 10:15:06', NULL),
(265, 58, 2, '030401-198001-0022', 'Elizabeth  Lie ', NULL, NULL, '$2y$10$2ndnru2pkgXI0LQF5Qg0h.r5PMTYp5F7RF6cjNb41ld5sZnj..UI2', 'whoislisa@hotmail.com', '0', '0', NULL, 1, '2022-05-23 10:15:06', NULL),
(266, 59, 1, '030401-198001-0023', 'Ray Halim ', NULL, NULL, '$2y$10$7UqJOFSrzn9SxwF6wp.W2Oyb/TEQu5pOTvYycClWNvA4eBeONFHIC', '', '0', '0', NULL, 1, '2022-05-23 10:15:07', NULL),
(267, 59, 2, '030401-198001-0024', 'Liana Tandjung', NULL, NULL, '$2y$10$GqMZrOVqodJb098ATrPlk.GaAZ4xzydfnJB8X/YSJfxV.SIuNlXgu', '', '0', '0', NULL, 1, '2022-05-23 10:15:07', '2022-05-24 08:35:40'),
(268, 25, 4, '030401-202205-0002', 'Opusisv', NULL, NULL, '$2y$10$ClWgV2UrrpYXbRxsPCLGu.UFwbxkJ8d9i/a09whKprOaqlD8C/j/u', 'level1@mailinator.com', '1', '0', NULL, 1, '2022-05-24 02:09:28', NULL),
(269, 59, 4, '030401-202205-0003', 'Opusisv', NULL, NULL, '$2y$10$FkL0yLXisyhtpUzj3HFY1u5vViUAE8buONA4soByH.BLAY9SuXv/i', 'testing2@mailinator.com', '', '0', NULL, 1, '2022-05-24 07:46:57', NULL),
(270, 25, 4, '030401-202203-0001', 'Opusisv', NULL, NULL, '$2y$10$1oQJIUH9Zjqf1c5gmwNQr.3Fld2ahal9/BtLg9rHXyYFTOP8ffEgu', 'testing3@mailinator.com', '', '0', NULL, 1, '2022-05-24 07:50:09', NULL),
(271, 60, 1, '030401-202205-0004', 'Topan', NULL, NULL, '$2y$10$sHDGKfsuIAZXccr9VpIKCu6TBvWLJf/2zEB6tuCufsQLkqk1Ja9o.', 'topan.ismail@mailinator.com', '', '0', NULL, 1, '2022-05-26 03:22:31', NULL),
(272, 60, 2, '030401-202205-0005', 'Ani', NULL, NULL, '$2y$10$PzL0WshH8XKgHl6Gcoxcru.jcN5Lz4mDHx8gk31Gkwztm1tY5a0x2', 'ina.ani@mailinator.com', '0', '0', NULL, 1, '2022-05-26 03:22:58', '2022-05-26 03:23:11'),
(273, 25, 4, '030401-202205-0006', 'Opusisv', NULL, NULL, '$2y$10$ZcLsiJazFYKY0Q2sl1CSQuQM0flxNaaRqArfqeSLOtzIEfMnN17He', 'admin.staff@gmail.com', '1', '0', NULL, 1, '2022-05-26 05:01:28', NULL),
(274, 25, 8, '030401-202205-0007', 'Opusisv', NULL, NULL, '$2y$10$mJZPHjv4mR2mePX2lgB8h.l7dK31/uQNEQu.gpndNEQOrlGrd/X7W', 'testing.mei.1@mailinator.com', '0', '0', NULL, 1, '2022-05-26 05:05:42', '2022-05-26 05:06:36'),
(275, 61, 2, '030401-202205-0008', 'Opusisv', NULL, NULL, '$2y$10$dElcUpHQ8T5d2gOESm4TAOjnBuGJXfAg4B4n0kteVHcmq2oxmVMQ2', 'testing.mei.2@mailinator.com', '', '0', NULL, 1, '2022-05-26 05:06:18', NULL),
(276, 61, 1, '030401-202205-0009', 'Opusisv', NULL, NULL, '$2y$10$50QvoiAILrj/3QzBRm1EDuW0V9xQjW0TJaFWBqBVUFHdeu0E4zHyC', 'testing.mei.3@mailinator.com', '0', '0', NULL, 1, '2022-05-26 05:07:21', '2022-05-26 05:12:45'),
(277, 62, 1, '030401-202205-0010', 'Opusisv', NULL, NULL, '$2y$10$MqCNmfBx/VnCDuUbNcIN4eFaUThm9TIA.zSiN7gX30BX6Ux558ZJq', 'testing.mail@mailinator.com', '', '0', NULL, 1, '2022-05-26 10:38:04', NULL),
(278, 62, 2, '030401-202205-0011', 'Opusisv', NULL, NULL, '$2y$10$dkiEvhHYQ9jjoYk1RGiUYOurypwKcc4ByO7qdvrYbsl3n1qD8Xz/W', 'testing.ani@mailinator.com', '', '0', NULL, 1, '2022-05-26 10:38:33', NULL),
(279, 63, 1, '030401-202205-0012', 'Opusisv', NULL, NULL, '$2y$10$Xc3use1LHz5zc63yiFLg9OTIdaBv8LRT.fi2OEOyPLGdvIcvABaBC', 'hendro@mailinator.com', '', '0', NULL, 1, '2022-05-26 10:43:55', NULL),
(280, 63, 2, '030401-202205-0013', 'Opusisv', NULL, NULL, '$2y$10$XWwf6rv1XJ8h3vSmRR4KvOXZ6EcHC2u5aEx6PCzSZV.5PTRHpfulC', 'siti@mailinator.com', '', '0', NULL, 1, '2022-05-26 10:44:22', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `version`
--

CREATE TABLE `version` (
  `id` int(11) NOT NULL,
  `nama` varchar(10) DEFAULT NULL,
  `keterangan` text DEFAULT NULL,
  `tanggal_release` date DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `version`
--

INSERT INTO `version` (`id`, `nama`, `keterangan`, `tanggal_release`, `status`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'v.0.0.1', 'Februari', '2022-02-01', 2, '2022-01-21 11:09:24', '2022-02-09 05:47:10', '0000-00-00 00:00:00'),
(2, 'V1.1', '<table xss=\"removed\" cellspacing=\"0\" cellpadding=\"0\" dir=\"ltr\" border=\"1\"><colgroup><col width=\"71\"><col width=\"141\"><col width=\"107\"><col width=\"254\"><col width=\"107\"><col width=\"107\"><col width=\"107\"><col width=\"164\"><col width=\"177\"><col width=\"107\"><col width=\"152\"><col width=\"71\"><col width=\"71\"><col width=\"71\"></colgroup><tbody><tr xss=\"removed\"><td rowspan=\"2\" colspan=\"1\" data-sheets-value=\"{\" xss=\"removed\"><div xss=\"removed\">Version</div></td><td rowspan=\"1\" colspan=\"2\" data-sheets-value=\"{\" xss=\"removed\">Module</td><td rowspan=\"1\" colspan=\"2\" data-sheets-value=\"{\" xss=\"removed\"></td></tr><tr xss=\"removed\"><td data-sheets-value=\"{\" xss=\"removed\">Partner</td><td data-sheets-value=\"{\" xss=\"removed\">User Module</td><td data-sheets-value=\"{\" xss=\"removed\">Activation</td><td data-sheets-value=\"{\" xss=\"removed\">General Feature</td></tr><tr xss=\"removed\"><td data-sheets-value=\"{\" xss=\"removed\">V1.1</td><td data-sheets-value=\"{\" xss=\"removed\">more generic. Ability to do grouping</td><td data-sheets-value=\"{\" xss=\"removed\">Profile View editability<br>NIK improvement<br>Keanggotaan<br>Pengesah (dulu : Member)<br>Detailed : Log-Aktivitas</td><td data-sheets-value=\"{\" xss=\"removed\">Branding<br>Mobile</td><td data-sheets-value=\"{\" xss=\"removed\">Menu : more concise</td></tr></tbody></table>', '2022-02-02', 2, '2022-01-21 11:21:11', '2022-05-13 08:25:31', '2022-01-21 11:22:00'),
(3, '3', '3', NULL, 3, '2022-01-21 11:22:08', '2022-01-21 11:22:12', '2022-01-21 11:22:12'),
(4, 'V1.2', '<div><span xss=removed>A. versi 1</span></div><div><span xss=removed>B. Versu 2</span></div>', '2022-02-09', 2, '2022-01-21 18:42:30', '2022-05-13 08:26:39', NULL),
(5, 'V2.0', 'Mei', '2022-03-01', 2, '2022-02-09 05:47:46', '2022-05-13 08:26:54', NULL),
(6, 'V2.1', 'Juni', '2022-02-10', 1, '2022-02-10 17:45:19', '2022-05-13 08:27:10', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `wilayah`
--

CREATE TABLE `wilayah` (
  `id` int(11) NOT NULL,
  `nama` varchar(100) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `wilayah`
--

INSERT INTO `wilayah` (`id`, `nama`, `status`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Cimahi', 1, '2022-03-02 05:55:09', '2022-03-02 18:17:16', NULL),
(2, 'Bandung', 1, '2022-03-02 18:17:10', NULL, NULL),
(3, 'Jakarta', 1, '2022-04-18 17:00:56', '2022-05-11 04:52:41', NULL),
(5, 'Wilayah 5', 1, '2022-05-14 19:41:05', NULL, NULL),
(6, 'Wilayah Timur', 1, '2022-05-14 19:41:12', NULL, NULL),
(7, 'Wijk V', 1, '2022-05-23 17:15:03', NULL, NULL),
(8, 'Wijk VI', 1, '2022-05-23 17:15:04', NULL, NULL),
(9, 'Wijk P', 1, '2022-05-23 17:15:04', NULL, NULL),
(10, 'Wijk I/II', 1, '2022-05-23 17:15:05', NULL, NULL),
(11, 'Wijk VII', 1, '2022-05-23 17:15:05', NULL, NULL),
(12, 'East', 1, '2022-05-23 17:15:06', NULL, NULL),
(13, 'Central', 1, '2022-05-23 17:15:06', NULL, NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `activity`
--
ALTER TABLE `activity`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `activity_log`
--
ALTER TABLE `activity_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `Key` (`by`);

--
-- Indexes for table `alamat`
--
ALTER TABLE `alamat`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_profile` (`id_profile`);

--
-- Indexes for table `client_company`
--
ALTER TABLE `client_company`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_resiko` (`id_resiko`);

--
-- Indexes for table `contact`
--
ALTER TABLE `contact`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_profile` (`id_profile`);

--
-- Indexes for table `dashboard_activation`
--
ALTER TABLE `dashboard_activation`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `data_formal`
--
ALTER TABLE `data_formal`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_profile` (`id_profile`),
  ADD KEY `dtm_peristiwa_id` (`dtm_peristiwa_id`);

--
-- Indexes for table `data_formal_detail`
--
ALTER TABLE `data_formal_detail`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `dtm_peristiwa`
--
ALTER TABLE `dtm_peristiwa`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `gelar`
--
ALTER TABLE `gelar`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_profile` (`id_profile`);

--
-- Indexes for table `individual`
--
ALTER TABLE `individual`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `institusi`
--
ALTER TABLE `institusi`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `jabatan`
--
ALTER TABLE `jabatan`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `jenis_alamat`
--
ALTER TABLE `jenis_alamat`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `jenis_gelar`
--
ALTER TABLE `jenis_gelar`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `jenis_membership`
--
ALTER TABLE `jenis_membership`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_level` (`id_level`);

--
-- Indexes for table `kategorial`
--
ALTER TABLE `kategorial`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `kategori_keanggotaan`
--
ALTER TABLE `kategori_keanggotaan`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `kategori_p2pk`
--
ALTER TABLE `kategori_p2pk`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `keaktifan_pilihan`
--
ALTER TABLE `keaktifan_pilihan`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `kepanitiaan`
--
ALTER TABLE `kepanitiaan`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `keys`
--
ALTER TABLE `keys`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `level` (`level`);

--
-- Indexes for table `kode`
--
ALTER TABLE `kode`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `komisi`
--
ALTER TABLE `komisi`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `laporan_header`
--
ALTER TABLE `laporan_header`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `level`
--
ALTER TABLE `level`
  ADD PRIMARY KEY (`lev_id`);

--
-- Indexes for table `member`
--
ALTER TABLE `member`
  ADD PRIMARY KEY (`id`),
  ADD KEY `created_by` (`created_by`),
  ADD KEY `updated_by` (`updated_by`);

--
-- Indexes for table `membership`
--
ALTER TABLE `membership`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_jenis_membership` (`id_jenis_membership`),
  ADD KEY `id_profile` (`id_profile`);

--
-- Indexes for table `membership_atasan`
--
ALTER TABLE `membership_atasan`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `menu`
--
ALTER TABLE `menu`
  ADD PRIMARY KEY (`menu_id`);

--
-- Indexes for table `module_activation`
--
ALTER TABLE `module_activation`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `notifikasi`
--
ALTER TABLE `notifikasi`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `organization`
--
ALTER TABLE `organization`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `p2pk`
--
ALTER TABLE `p2pk`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `p2pk_planning`
--
ALTER TABLE `p2pk_planning`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `p2pk_planning_file`
--
ALTER TABLE `p2pk_planning_file`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `p2pk_proses_audit`
--
ALTER TABLE `p2pk_proses_audit`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `p2pk_proses_audit_file`
--
ALTER TABLE `p2pk_proses_audit_file`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `p2pk_report`
--
ALTER TABLE `p2pk_report`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `p2pk_report_detail`
--
ALTER TABLE `p2pk_report_detail`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `partner`
--
ALTER TABLE `partner`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pengarah`
--
ALTER TABLE `pengarah`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pengaturan_aplikasi`
--
ALTER TABLE `pengaturan_aplikasi`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `posisi`
--
ALTER TABLE `posisi`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `profesi`
--
ALTER TABLE `profesi`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_profile` (`id_profile`);

--
-- Indexes for table `profile`
--
ALTER TABLE `profile`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_user` (`id_user`);

--
-- Indexes for table `profile_kategorial`
--
ALTER TABLE `profile_kategorial`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `profile_keaktifan`
--
ALTER TABLE `profile_keaktifan`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `profile_keanggotaan`
--
ALTER TABLE `profile_keanggotaan`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `profile_wilayah`
--
ALTER TABLE `profile_wilayah`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `repository`
--
ALTER TABLE `repository`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `resiko`
--
ALTER TABLE `resiko`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `role_aplikasi`
--
ALTER TABLE `role_aplikasi`
  ADD PRIMARY KEY (`rola_id`);

--
-- Indexes for table `role_users`
--
ALTER TABLE `role_users`
  ADD PRIMARY KEY (`role_id`);

--
-- Indexes for table `spm`
--
ALTER TABLE `spm`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `template_download`
--
ALTER TABLE `template_download`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `term_management`
--
ALTER TABLE `term_management`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tipe_contact`
--
ALTER TABLE `tipe_contact`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tokens`
--
ALTER TABLE `tokens`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `trainer`
--
ALTER TABLE `trainer`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`);

--
-- Indexes for table `version`
--
ALTER TABLE `version`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `wilayah`
--
ALTER TABLE `wilayah`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `activity`
--
ALTER TABLE `activity`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `activity_log`
--
ALTER TABLE `activity_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=636;

--
-- AUTO_INCREMENT for table `alamat`
--
ALTER TABLE `alamat`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=46;

--
-- AUTO_INCREMENT for table `client_company`
--
ALTER TABLE `client_company`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `contact`
--
ALTER TABLE `contact`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=63;

--
-- AUTO_INCREMENT for table `dashboard_activation`
--
ALTER TABLE `dashboard_activation`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `data_formal`
--
ALTER TABLE `data_formal`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=112;

--
-- AUTO_INCREMENT for table `data_formal_detail`
--
ALTER TABLE `data_formal_detail`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `dtm_peristiwa`
--
ALTER TABLE `dtm_peristiwa`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `gelar`
--
ALTER TABLE `gelar`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `individual`
--
ALTER TABLE `individual`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1001;

--
-- AUTO_INCREMENT for table `institusi`
--
ALTER TABLE `institusi`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `jabatan`
--
ALTER TABLE `jabatan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `jenis_alamat`
--
ALTER TABLE `jenis_alamat`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `jenis_gelar`
--
ALTER TABLE `jenis_gelar`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `jenis_membership`
--
ALTER TABLE `jenis_membership`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `kategorial`
--
ALTER TABLE `kategorial`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `kategori_keanggotaan`
--
ALTER TABLE `kategori_keanggotaan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `kategori_p2pk`
--
ALTER TABLE `kategori_p2pk`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `keaktifan_pilihan`
--
ALTER TABLE `keaktifan_pilihan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `kepanitiaan`
--
ALTER TABLE `kepanitiaan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `keys`
--
ALTER TABLE `keys`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `kode`
--
ALTER TABLE `kode`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `komisi`
--
ALTER TABLE `komisi`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `laporan_header`
--
ALTER TABLE `laporan_header`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `level`
--
ALTER TABLE `level`
  MODIFY `lev_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=127;

--
-- AUTO_INCREMENT for table `member`
--
ALTER TABLE `member`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `membership`
--
ALTER TABLE `membership`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=76;

--
-- AUTO_INCREMENT for table `membership_atasan`
--
ALTER TABLE `membership_atasan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=77;

--
-- AUTO_INCREMENT for table `menu`
--
ALTER TABLE `menu`
  MODIFY `menu_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=156;

--
-- AUTO_INCREMENT for table `module_activation`
--
ALTER TABLE `module_activation`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `notifikasi`
--
ALTER TABLE `notifikasi`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=179;

--
-- AUTO_INCREMENT for table `organization`
--
ALTER TABLE `organization`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;

--
-- AUTO_INCREMENT for table `p2pk`
--
ALTER TABLE `p2pk`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `p2pk_planning`
--
ALTER TABLE `p2pk_planning`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `p2pk_planning_file`
--
ALTER TABLE `p2pk_planning_file`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `p2pk_proses_audit`
--
ALTER TABLE `p2pk_proses_audit`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `p2pk_proses_audit_file`
--
ALTER TABLE `p2pk_proses_audit_file`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `p2pk_report`
--
ALTER TABLE `p2pk_report`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `p2pk_report_detail`
--
ALTER TABLE `p2pk_report_detail`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=49;

--
-- AUTO_INCREMENT for table `partner`
--
ALTER TABLE `partner`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=64;

--
-- AUTO_INCREMENT for table `pengarah`
--
ALTER TABLE `pengarah`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `pengaturan_aplikasi`
--
ALTER TABLE `pengaturan_aplikasi`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `posisi`
--
ALTER TABLE `posisi`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `profesi`
--
ALTER TABLE `profesi`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `profile`
--
ALTER TABLE `profile`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=237;

--
-- AUTO_INCREMENT for table `profile_kategorial`
--
ALTER TABLE `profile_kategorial`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=46;

--
-- AUTO_INCREMENT for table `profile_keaktifan`
--
ALTER TABLE `profile_keaktifan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `profile_keanggotaan`
--
ALTER TABLE `profile_keanggotaan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=65;

--
-- AUTO_INCREMENT for table `profile_wilayah`
--
ALTER TABLE `profile_wilayah`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=46;

--
-- AUTO_INCREMENT for table `repository`
--
ALTER TABLE `repository`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `resiko`
--
ALTER TABLE `resiko`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `role_aplikasi`
--
ALTER TABLE `role_aplikasi`
  MODIFY `rola_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=297;

--
-- AUTO_INCREMENT for table `role_users`
--
ALTER TABLE `role_users`
  MODIFY `role_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=263;

--
-- AUTO_INCREMENT for table `spm`
--
ALTER TABLE `spm`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `template_download`
--
ALTER TABLE `template_download`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `term_management`
--
ALTER TABLE `term_management`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;

--
-- AUTO_INCREMENT for table `tipe_contact`
--
ALTER TABLE `tipe_contact`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `tokens`
--
ALTER TABLE `tokens`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=140;

--
-- AUTO_INCREMENT for table `trainer`
--
ALTER TABLE `trainer`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=281;

--
-- AUTO_INCREMENT for table `version`
--
ALTER TABLE `version`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `wilayah`
--
ALTER TABLE `wilayah`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `activity_log`
--
ALTER TABLE `activity_log`
  ADD CONSTRAINT `activity_log_ibfk_1` FOREIGN KEY (`by`) REFERENCES `users` (`user_id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `alamat`
--
ALTER TABLE `alamat`
  ADD CONSTRAINT `alamat_ibfk_1` FOREIGN KEY (`id_profile`) REFERENCES `profile` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `client_company`
--
ALTER TABLE `client_company`
  ADD CONSTRAINT `client_company_ibfk_1` FOREIGN KEY (`id_resiko`) REFERENCES `resiko` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `contact`
--
ALTER TABLE `contact`
  ADD CONSTRAINT `contact_ibfk_1` FOREIGN KEY (`id_profile`) REFERENCES `profile` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `data_formal`
--
ALTER TABLE `data_formal`
  ADD CONSTRAINT `data_formal_ibfk_1` FOREIGN KEY (`id_profile`) REFERENCES `profile` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `data_formal_ibfk_2` FOREIGN KEY (`dtm_peristiwa_id`) REFERENCES `dtm_peristiwa` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `gelar`
--
ALTER TABLE `gelar`
  ADD CONSTRAINT `gelar_ibfk_1` FOREIGN KEY (`id_profile`) REFERENCES `profile` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `jenis_membership`
--
ALTER TABLE `jenis_membership`
  ADD CONSTRAINT `jenis_membership_ibfk_1` FOREIGN KEY (`id_level`) REFERENCES `level` (`lev_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `keys`
--
ALTER TABLE `keys`
  ADD CONSTRAINT `keys_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `keys_ibfk_2` FOREIGN KEY (`level`) REFERENCES `level` (`lev_id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `membership`
--
ALTER TABLE `membership`
  ADD CONSTRAINT `membership_ibfk_2` FOREIGN KEY (`id_jenis_membership`) REFERENCES `jenis_membership` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `membership_ibfk_3` FOREIGN KEY (`id_profile`) REFERENCES `profile` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `profesi`
--
ALTER TABLE `profesi`
  ADD CONSTRAINT `profesi_ibfk_1` FOREIGN KEY (`id_profile`) REFERENCES `profile` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `profile`
--
ALTER TABLE `profile`
  ADD CONSTRAINT `profile_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `users` (`user_id`) ON DELETE SET NULL ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

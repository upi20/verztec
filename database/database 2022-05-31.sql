-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 31, 2022 at 09:03 PM
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
  `date_of_birth` date NOT NULL,
  `place_of_birth` varchar(255) NOT NULL,
  `church_name` varchar(255) NOT NULL,
  `organization` varchar(255) NOT NULL,
  `country` varchar(255) NOT NULL,
  `gender` varchar(255) NOT NULL,
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

INSERT INTO `individual` (`id`, `status`, `date_of_birth`, `place_of_birth`, `church_name`, `organization`, `country`, `gender`, `email`, `phone`, `name`, `address`, `city`, `since`, `description`, `packet`) VALUES
(1, 0, '1992-07-01', 'Lake Desmond', 'Maroon', 'SlateBlue', 'Georgia', 'Female', 'arielle16@example.net', '987.722.0828', 'Mrs. Myrna Nienow II', '228 Shakira Lodge\nCrooksview, KS 47984', 'North Yesenia', '2006-07-26 19:49:21', 'Assumenda consequatur perspiciatis architecto omnis dolor debitis. Placeat ipsam neque et cupiditate. Non ea quo qui nihil aperiam.', 'Free'),
(2, 2, '2003-07-27', 'West Sabinashire', 'LemonChiffon', 'BurlyWood', 'Estonia', 'Female', 'pacocha.otilia@example.org', '1-875-124-3999x79090', 'Prof. Jacynthe Prohaska', '0446 Cale Mountain\nLake Lavernburgh, CO 98269-9917', 'Lake Cheyanne', '1978-07-08 23:00:21', 'Sunt tempore ipsum vel ipsum nam perspiciatis exercitationem. Voluptas sint ut tenetur fugit. Expedita consequatur maxime id velit ut ab voluptatibus.', 'Premium'),
(3, 1, '1987-05-27', 'Irvington', 'DarkMagenta', 'Peru', 'Falkland Islands (Malvinas)', 'Female', 'auer.lafayette@example.com', '(226)396-9171x1378', 'Maci Ward', '065 Braun Springs Apt. 071\nDanielside, TN 40760', 'North Paxton', '1979-03-15 08:05:09', 'Labore vel nisi vel ab. Iste officiis aut repudiandae id. Sed tempora quia sequi repudiandae neque labore.', 'Premium'),
(4, 1, '2021-12-22', 'Tommiemouth', 'LightPink', 'GhostWhite', 'Suriname', 'Not Select', 'lindsey74@example.com', '(289)488-1267x248', 'Dr. Toby Tillman MD', '265 Haag Springs Suite 014\nJeniferhaven, OR 24742', 'Huelsfort', '2018-11-03 13:03:23', 'Ut tenetur cupiditate perspiciatis quam aperiam. Excepturi dolorem ut nulla qui at. Aspernatur et occaecati excepturi sit architecto. Quis qui error fugit illo deleniti illo iusto.', 'Silver'),
(5, 0, '1997-08-19', 'Raynorland', 'Chocolate', 'LightSkyBlue', 'Lesotho', 'Male', 'mosciski.trevor@example.net', '467-930-8007x36461', 'Amelie Boehm', '27038 Marquardt Valleys Suite 505\nLemkestad, VA 90987-4244', 'Okunevastad', '2005-09-20 18:07:44', 'Autem dolores ipsam provident deleniti. Aliquid ducimus harum voluptatem. Blanditiis ut eos qui et error quo.', 'Premium'),
(6, 2, '1977-06-14', 'East Kurt', 'DarkViolet', 'Tan', 'Nigeria', 'Not Select', 'runolfsdottir.winifred@example.com', '108.448.6294', 'Carmel Frami', '7077 Tressie Gardens Apt. 088\nEast Hattieborough, AL 52755-8933', 'Port Tod', '2016-10-17 02:09:18', 'Dignissimos veritatis eos dignissimos officiis aut ut consequatur. Eligendi voluptates culpa cum et vitae. Dignissimos nihil aliquid amet distinctio at. Ex commodi voluptates voluptatem quos recusandae tenetur.', 'Premium'),
(7, 2, '1998-09-29', 'East Margie', 'LightSalmon', 'NavajoWhite', 'Somalia', 'Female', 'hschoen@example.com', '(904)005-2356', 'Prof. Amina Balistreri', '31939 Carolina Ramp Apt. 554\nNew Emoryborough, CO 35448-5490', 'Port Kaci', '1975-10-09 03:56:00', 'Libero corrupti eos fugit ut ab nemo incidunt. Possimus deserunt nihil officiis eveniet fuga quo eius ut. Consequatur rerum omnis ut blanditiis est. Qui perferendis architecto fuga sed dignissimos et.', 'Silver'),
(8, 0, '2006-01-17', 'Port Cassandrabury', 'LavenderBlush', 'LightBlue', 'Azerbaijan', 'Male', 'sophia.bergstrom@example.com', '922-415-6595x1699', 'Prof. Margarette Homenick', '25114 Riley Lodge Suite 808\nLake Carli, SD 37939-1246', 'Port Norenemouth', '2004-09-25 05:55:06', 'Maxime necessitatibus quo recusandae. Expedita aut mollitia eaque officiis. Debitis voluptate dolorem eaque voluptas veritatis.', 'Free'),
(9, 1, '2006-05-01', 'East Lindsey', 'LightYellow', 'AliceBlue', 'Honduras', 'Female', 'volkman.braeden@example.org', '247-060-5726x0506', 'Merlin Dickinson', '569 Dare Lakes Apt. 380\nPort Timmyfort, ME 99629', 'Cydneystad', '2003-12-23 07:12:16', 'Qui exercitationem autem ut qui accusantium tenetur. Totam officia unde vel rerum et ea architecto. Quis reprehenderit dolorem et maxime. Et expedita enim qui ea. Ad ut suscipit rem alias consequatur quas eos nostrum.', 'Premium'),
(10, 0, '1994-09-15', 'New Enrico', 'MediumBlue', 'Teal', 'Costa Rica', 'Not Select', 'harvey.keeley@example.org', '852.493.0939x9654', 'Ms. Mertie Pfannerstill Jr.', '8229 Zboncak Plain Apt. 092\nBrucebury, OR 73556', 'North Douglasshire', '1988-11-08 12:31:20', 'Assumenda dolores aut perferendis quis voluptates et modi. Et animi aut eum sint vitae. Autem ducimus voluptatem officia rerum. Porro quis non natus beatae dolore cupiditate omnis.', 'Silver'),
(11, 0, '2000-04-27', 'Royalville', 'Thistle', 'Crimson', 'Samoa', 'Not Select', 'dhayes@example.org', '(583)539-1112x66416', 'Terrence Shields', '9527 Robb Loaf Apt. 088\nNorth Oliver, KS 32717-5786', 'East Hudson', '2001-05-19 10:57:15', 'Rerum sit corporis aut est itaque voluptatibus dolorum. Ad numquam dolore totam magnam quisquam. Dignissimos vero accusamus pariatur dolor consequatur maxime ea.', 'Premium'),
(12, 1, '1980-12-14', 'West Talia', 'Orange', 'Green', 'Bermuda', 'Male', 'bgoodwin@example.com', '606.630.2195x9121', 'Francisco Schuppe', '58746 Harris Bridge Suite 231\nConsidinetown, SC 13624-6401', 'New Lukas', '1995-07-04 06:18:15', 'Qui quaerat quo tempora qui. Rerum omnis qui sunt libero in et voluptatem. Quos voluptatem impedit eius consectetur voluptatibus ratione. Alias expedita quidem qui qui dignissimos sequi et.', 'Silver'),
(13, 2, '1993-02-27', 'McClureburgh', 'SteelBlue', 'DarkOrchid', 'Canada', 'Not Select', 'birdie.emard@example.com', '(272)068-4206', 'Prof. Raphael Crist', '0372 Harmon Cove Suite 054\nEast Noblestad, VA 05089', 'South Rodrick', '1971-12-10 10:53:44', 'Quisquam minima repellendus voluptas cumque asperiores. Perspiciatis molestiae laboriosam quibusdam culpa aut. Eos et nobis nesciunt id odit eos. Aspernatur animi suscipit mollitia ratione sed aspernatur.', 'Gold'),
(14, 0, '2022-05-06', 'Micheleshire', 'DarkSlateGray', 'LightCyan', 'Guatemala', 'Not Select', 'rosenbaum.queenie@example.net', '825.535.0557x46777', 'Shawn Smitham', '5438 Jerad Brooks\nMacton, NY 28367-1661', 'Port Arjunshire', '2019-09-04 09:58:39', 'Nisi aperiam consectetur illum voluptatem est. Reprehenderit asperiores voluptatem aperiam facere officia harum voluptatum. Est velit aliquam tempore sunt qui et a. Velit est sit ex ut.', 'Premium'),
(15, 2, '1985-04-27', 'Port Vivienneshire', 'Tomato', 'LightSkyBlue', 'Brunei Darussalam', 'Male', 'camron19@example.org', '09205255837', 'Elisabeth Stamm I', '769 Frieda Path\nAbernathyfort, WI 58786-5660', 'Donnyfort', '1996-10-09 16:28:20', 'Tenetur laboriosam saepe laboriosam soluta nihil necessitatibus. Voluptas accusamus deserunt repudiandae qui. Maxime nihil harum et repellat deserunt earum aliquid. Quisquam veritatis dolorem quos dolorem vero.', 'Gold'),
(16, 2, '1979-05-20', 'Myrtiehaven', 'LightGreen', 'ForestGreen', 'Ghana', 'Male', 'bmorar@example.org', '+09(6)1584275226', 'Johan Ledner', '144 Ciara Circle\nPenelopefort, VA 07255-5386', 'South Urbantown', '2010-03-20 22:01:55', 'Ut omnis neque culpa fuga quisquam distinctio. Commodi sed voluptatum dignissimos quisquam dolorum blanditiis. Asperiores adipisci nihil porro consequatur aliquam. Aspernatur et quia rerum qui quod nisi dignissimos.', 'Gold'),
(17, 1, '1979-10-26', 'Port Penelope', 'MediumVioletRed', 'LightGray', 'Macao', 'Not Select', 'hane.moshe@example.net', '+60(4)0180659836', 'Alyson Lesch', '189 Davis Circle Apt. 817\nSouth Dellafurt, NE 05964', 'Kohlerfurt', '2014-05-06 14:43:08', 'Eos placeat aut et nihil. Saepe et neque natus in.', 'Gold'),
(18, 2, '2002-04-04', 'New Zoraville', 'Silver', 'Green', 'Finland', 'Not Select', 'atreutel@example.com', '05105739883', 'Seamus Shields', '47241 Marty Dale Suite 971\nNew Roselynmouth, NY 97654', 'Lake Felixton', '1992-11-22 12:13:37', 'Voluptas enim dolores id voluptatem iusto sunt quia. Earum in non voluptatem in eligendi. Blanditiis esse sequi et cumque iste autem. Voluptatem a voluptas sunt assumenda labore recusandae.', 'Silver'),
(19, 1, '1999-12-18', 'Hillsfurt', 'Gold', 'LightSeaGreen', 'South Africa', 'Female', 'orrin.heidenreich@example.net', '(078)313-0138', 'Coty Haag DVM', '578 Flavio Plaza Apt. 846\nWalterbury, FL 20921-8272', 'Raymondberg', '1999-02-14 02:07:58', 'Dolore necessitatibus sit consequatur. Et eius enim cum doloribus ducimus rerum. Earum molestiae autem maiores et aliquid eos impedit. Nostrum illo voluptas iste.', 'Free'),
(20, 1, '1997-01-21', 'Gutmannhaven', 'Orange', 'GhostWhite', 'Gibraltar', 'Not Select', 'dhamill@example.org', '472-935-7627x1643', 'Mr. Bradley Pfannerstill', '4880 Mohammed Curve Apt. 881\nPort Brain, UT 29173-6157', 'North Filiberto', '1973-06-18 22:17:03', 'Laborum accusamus voluptatem qui asperiores. Eaque natus nulla voluptatem odit harum fuga quia rem. Et nam asperiores similique nostrum et qui et.', 'Silver'),
(21, 1, '2004-05-02', 'South Aniyamouth', 'PaleVioletRed', 'Silver', 'Christmas Island', 'Male', 'veda.deckow@example.net', '427.398.6535x93998', 'Luther Romaguera V', '177 Mayert Neck\nTurcottemouth, NH 51832', 'Lake Jeffhaven', '2020-08-11 00:05:19', 'Corrupti delectus necessitatibus fugiat ducimus. Dolorem at ut accusamus animi veritatis sint sint. Amet est officiis ducimus. Eos porro ipsam dolor eveniet.', 'Premium'),
(22, 2, '2005-08-12', 'South Dorthaport', 'DarkOrchid', 'Salmon', 'Hong Kong', 'Male', 'vkeebler@example.org', '920-395-2452x517', 'Valentina Treutel', '1303 Peter Crest\nRoobstad, PA 37797-0416', 'Collinsmouth', '2011-01-14 07:27:34', 'Quidem dolore praesentium ullam aliquid deleniti molestiae praesentium. Nam laudantium laborum totam ab. Voluptatem impedit beatae consequuntur deleniti dolor sunt. Expedita qui voluptatibus asperiores voluptas.', 'Free'),
(23, 2, '1988-03-26', 'Dashawnfort', 'DarkMagenta', 'Bisque', 'Panama', 'Male', 'hayes.marcia@example.com', '1-506-940-2179x427', 'Darrick Heathcote', '7541 Stroman Shores\nEast Christ, KS 61088-3583', 'Ettiehaven', '2012-07-25 16:16:59', 'A eum itaque quo eaque eum in eum. Omnis consequatur neque nihil quaerat iste similique voluptatem aliquam. Vero laudantium enim sit accusantium facere non distinctio.', 'Gold'),
(24, 1, '2001-08-25', 'Treutelchester', 'HotPink', 'AliceBlue', 'Taiwan', 'Male', 'lucie47@example.net', '316-265-8342x1133', 'Destinee Walker DVM', '1748 Lucio Loaf Apt. 675\nPort Juneland, PA 24672', 'Lake Lilianeberg', '2016-07-30 09:01:33', 'Ut soluta omnis perspiciatis delectus soluta facilis. Vero in ullam maxime laboriosam cupiditate consequuntur. Omnis voluptatem numquam alias est. Veritatis tempore blanditiis molestiae.', 'Silver'),
(25, 0, '2012-10-24', 'East Gaylordtown', 'Lavender', 'Maroon', 'Swaziland', 'Not Select', 'augusta.shields@example.org', '(104)365-5887x23360', 'Riley Ondricka', '5813 Candelario Springs Apt. 688\nPort Sheldon, WA 14728-7568', 'Danikaland', '2005-06-06 05:23:06', 'Aut qui dolorem id totam. Facilis maxime dolore cupiditate. Pariatur in ea quis ut et.', 'Premium'),
(26, 0, '2007-07-09', 'Schimmelville', 'Beige', 'LightSlateGray', 'Iceland', 'Not Select', 'heller.janelle@example.org', '1-698-312-0063x97376', 'Nicklaus Beer', '88136 Baylee Village\nSanfordfort, IL 28264-8074', 'Caesarside', '2015-06-06 23:51:16', 'Facere rerum sint tenetur unde facere mollitia est. Porro et pariatur quis eveniet sit esse. Harum dolores et eos labore at qui iusto.', 'Silver'),
(27, 1, '2006-02-07', 'New Sydneychester', 'MediumSpringGreen', 'DarkSlateGray', 'Bahrain', 'Not Select', 'benedict.gutmann@example.net', '543.358.2976', 'Dr. Martin Herman IV', '72396 Wyman Centers\nLottieport, IL 28202-5313', 'Port Marshall', '2015-11-15 17:55:58', 'Ea esse nihil tenetur possimus voluptas sunt aut. Officia sed minus voluptatum. Nesciunt sapiente minus molestiae rerum. Cumque eum ea quasi quaerat in. Enim ipsam ut aut voluptatum consectetur exercitationem quae et.', 'Free'),
(28, 0, '2013-04-28', 'Langworthberg', 'MediumAquaMarine', 'DarkRed', 'Ukraine', 'Not Select', 'angelo.moore@example.net', '+81(7)7113015396', 'Oren Paucek', '41497 Nolan Springs Apt. 134\nLake Akeem, MO 02391-8844', 'Lake Hopefort', '1983-11-04 12:43:16', 'Sapiente aut accusamus et rerum praesentium consequuntur dolores. Sunt officia sit et beatae nostrum. Aliquam ut iusto velit eos et in eum.', 'Free'),
(29, 2, '1978-11-27', 'East Alexander', 'OliveDrab', 'Teal', 'Libyan Arab Jamahiriya', 'Not Select', 'oran17@example.org', '373-750-6525x049', 'Juliana Zemlak MD', '68443 Golden Mission Suite 670\nDavischester, RI 15263', 'West Feltonside', '2010-04-10 10:00:27', 'Eos voluptas doloribus neque. Animi laboriosam et quis minima sunt. Vitae deleniti et dolor iusto. Voluptas sint sunt fugiat in.', 'Free'),
(30, 0, '2007-10-06', 'West Jeromy', 'LightSeaGreen', 'MediumSlateBlue', 'Gambia', 'Female', 'christa.goldner@example.com', '(079)461-9106', 'Darwin Pfannerstill', '48965 Lindgren Courts Apt. 110\nLavontown, IN 73470-4360', 'Spencerfurt', '1984-03-04 21:26:03', 'Reiciendis dolor animi est architecto neque quia. Deserunt facere possimus ut quibusdam.', 'Silver'),
(31, 0, '2005-10-05', 'South Darylmouth', 'PeachPuff', 'ForestGreen', 'American Samoa', 'Not Select', 'murl00@example.com', '396-110-2163', 'Dr. Rahsaan Luettgen', '49161 Hazle Springs\nKohlerfurt, MD 33265', 'New Nelson', '1996-04-03 07:00:49', 'Aut cupiditate perferendis cum eveniet magni amet. Vitae qui cumque rerum optio facilis sit ut. Provident dolores corrupti minima ex commodi laudantium mollitia. Impedit omnis accusantium velit mollitia.', 'Silver'),
(32, 2, '2021-05-24', 'East Annaberg', 'Turquoise', 'AntiqueWhite', 'Iran', 'Male', 'zoie.zboncak@example.net', '(975)971-0115', 'Alvena Grimes', '2077 Jacey Shoal\nPort Luciousport, KY 63590', 'Runolfsdottirberg', '1983-08-25 22:32:56', 'Eum tempora quis omnis. Ullam et est consequuntur nisi et. Et odit consequatur aperiam optio corporis.', 'Free'),
(33, 1, '2019-01-14', 'South Newtonberg', 'ForestGreen', 'Magenta', 'Equatorial Guinea', 'Female', 'zrodriguez@example.net', '358.110.9809', 'Christop Brakus', '2044 Violette Curve Apt. 298\nDedricberg, AZ 30500', 'Braunfort', '1977-11-02 17:13:27', 'Reiciendis explicabo illo fugit cupiditate in accusamus labore. Voluptatem repellendus itaque sequi repudiandae qui. Molestiae et laudantium iste quod non nisi aut. Sed possimus odit veritatis exercitationem esse ipsa rerum.', 'Premium'),
(34, 2, '2012-10-05', 'Kochton', 'WhiteSmoke', 'SlateBlue', 'Western Sahara', 'Not Select', 'ygerlach@example.org', '308-562-3988', 'Brennon Schultz IV', '984 Assunta Fields\nCasimirfort, MS 76230', 'New Hubert', '1973-02-07 03:01:32', 'Et nemo magni expedita perferendis quod. Quod sint ut eum. Tempore accusamus est ab autem exercitationem quas. Qui ab perferendis aut in ab et.', 'Premium'),
(35, 1, '2013-11-01', 'Pourosside', 'CadetBlue', 'Lavender', 'Moldova', 'Female', 'wsauer@example.net', '904.421.8315', 'Margarette Champlin', '112 Kaylah Village Apt. 918\nNorth Ebony, PA 67133-3194', 'Myronborough', '1987-01-26 01:25:21', 'Iusto aut alias qui illo alias. Et ut voluptatem minus. Distinctio veritatis neque atque eius modi.', 'Free'),
(36, 0, '1975-03-20', 'Frederiquetown', 'CornflowerBlue', 'Red', 'Korea', 'Female', 'julien.russel@example.net', '1-517-729-6995x50774', 'Kaleigh Schmidt III', '953 Mueller Tunnel\nRusselborough, NV 13761', 'West Laney', '2020-09-28 01:26:44', 'Magnam non dolor non tenetur recusandae quae. Dignissimos perferendis eveniet aut laudantium magnam aut neque. Aut qui qui atque omnis eos similique molestiae maxime. Nihil expedita et voluptatem.', 'Gold'),
(37, 2, '1977-09-11', 'Port Alvertamouth', 'Aqua', 'OldLace', 'Puerto Rico', 'Not Select', 'kferry@example.net', '230-070-7475', 'Benny Connelly MD', '7887 Goodwin Falls\nWest Lois, MO 18943-4850', 'West Urbanfort', '2006-08-28 11:59:53', 'Repudiandae atque cum cupiditate. Ipsa aut autem consequatur placeat asperiores pariatur in sit. Praesentium quidem eligendi architecto atque enim odio. Qui consequatur voluptatibus ullam odio. Ipsum ea perspiciatis illum repudiandae autem.', 'Premium'),
(38, 0, '1995-07-30', 'Watsicaland', 'LightCoral', 'DarkViolet', 'Paraguay', 'Not Select', 'becker.evans@example.net', '+32(9)5194869981', 'Kaylah Baumbach', '672 David Gateway\nWest Nelliestad, MO 18435', 'Chynatown', '1971-04-19 07:40:20', 'Et voluptatum neque nisi consequatur similique aut. Quia nam culpa optio odit est debitis libero. Earum nisi et eos repellat mollitia nesciunt. Impedit vel vero quaerat consequatur corrupti qui omnis voluptatem.', 'Free'),
(39, 2, '2014-07-11', 'East Deondre', 'Pink', 'GhostWhite', 'India', 'Male', 'stokes.ernestina@example.net', '014.029.5886', 'Icie Fritsch V', '92487 West Street Suite 567\nKayceemouth, MN 30767-6357', 'Port Alvera', '2021-12-16 01:18:14', 'Exercitationem vero libero rerum aut. Consequuntur molestias quia minima dignissimos harum aut.', 'Premium'),
(40, 1, '2016-01-09', 'West Eldonfort', 'PaleVioletRed', 'Plum', 'South Georgia and the South Sandwich Islands', 'Male', 'schneider.amara@example.com', '(585)758-5568x5352', 'Leslie White', '9468 Thiel Fields Suite 232\nNathanielfurt, AZ 70597', 'Spencermouth', '2001-10-16 01:04:38', 'Quia dolor in non totam eos ipsa facilis. Illum repellendus non repudiandae veniam. Eligendi quos expedita sint non quibusdam aut. Voluptate est alias eos dolor unde perferendis.', 'Free'),
(41, 2, '1991-07-27', 'Hayesstad', 'Coral', 'DarkOliveGreen', 'Bangladesh', 'Not Select', 'frami.jaqueline@example.net', '(762)247-6530', 'Guy Collins', '899 Filomena Groves\nBernardomouth, MS 86985-4583', 'Sidneychester', '1975-02-20 23:34:38', 'Incidunt eos aspernatur facere perspiciatis consequuntur sed culpa incidunt. Praesentium ipsam sint eaque in provident.', 'Premium'),
(42, 2, '2022-01-25', 'Rossieville', 'SteelBlue', 'Indigo ', 'Yemen', 'Not Select', 'adella.gutkowski@example.com', '(373)348-6097x81601', 'Dr. Hershel Quigley Sr.', '3625 Cummings Ranch Suite 877\nDeonport, FL 88815', 'Lake Peytonburgh', '1981-06-12 06:05:38', 'Suscipit excepturi repellendus quis recusandae quae ut architecto. Eum molestiae rerum non nihil. Odio sed dolores sit unde accusamus sunt dolorum deleniti. Repellendus beatae sed rerum illum nulla.', 'Gold'),
(43, 1, '1995-12-31', 'East Crystal', 'ForestGreen', 'LightPink', 'United Arab Emirates', 'Male', 'henderson57@example.org', '1-641-561-6305x51139', 'Conrad Renner', '182 Howell Stravenue Suite 278\nNorth Blaisefurt, PA 14749-0210', 'Waelchitown', '1975-07-13 15:28:31', 'Animi sapiente et quis officia est. Aut architecto modi mollitia perspiciatis.', 'Premium'),
(44, 1, '1995-10-18', 'Port Deja', 'Violet', 'DarkTurquoise', 'Antigua and Barbuda', 'Not Select', 'fkonopelski@example.net', '+99(2)6217884383', 'Roy Brekke', '738 Emilio Island\nBrianafort, MO 32718-6725', 'Erickland', '2006-07-03 15:14:25', 'Velit dolor ut et aliquid et. Ullam nisi consequatur error assumenda velit. Fuga quis excepturi repellat officia voluptatem quia est.', 'Silver'),
(45, 0, '1997-10-23', 'Alanburgh', 'Linen', 'Peru', 'Croatia', 'Not Select', 'horacio.luettgen@example.com', '00848150070', 'Soledad Shields', '005 Ryan Isle Apt. 748\nHermannton, CT 85592', 'McLaughlintown', '2019-11-16 02:00:53', 'Velit et et eveniet voluptatem omnis. Deserunt provident sit omnis nihil. Tempore consequatur facere at iure iure qui. Veniam repudiandae ut repellendus voluptatum excepturi.', 'Free'),
(46, 2, '1988-07-30', 'East Jackbury', 'Yellow', 'Gainsboro', 'Oman', 'Female', 'uschimmel@example.org', '1-693-063-6558x75630', 'Dr. Lucious Stoltenberg', '2858 Senger Walks\nArvelborough, WV 75851', 'Trantowport', '2008-09-17 13:09:11', 'Est quia consectetur aut eaque. Possimus eum exercitationem id labore. Quos quaerat dolore eum corporis eveniet.', 'Free'),
(47, 1, '2004-02-13', 'East Providenci', 'Violet', 'Moccasin', 'Tunisia', 'Male', 'mwisozk@example.net', '444.297.3048', 'Tyrese Rogahn', '159 Reta Row Suite 326\nNormatown, AR 39818', 'North Cale', '1979-09-05 21:50:13', 'Aut numquam alias cum nemo. Et non unde ea consequatur voluptatem. Et sapiente vel ut autem odit maiores sit.', 'Gold'),
(48, 0, '1980-12-20', 'Funkbury', 'Ivory', 'LightSlateGray', 'Tuvalu', 'Female', 'chelsea.dicki@example.net', '1-144-435-6000x260', 'Isabelle Emmerich', '04031 Trisha Rapids Suite 396\nJasenchester, CO 50284-0781', 'West Lelahland', '1979-05-01 04:05:07', 'Eos odio autem ut. Nemo eum repellendus aperiam corporis similique officiis magnam a. Ad alias aut aut.', 'Free'),
(49, 2, '1983-07-10', 'West Eloisaville', 'Red', 'SteelBlue', 'Iceland', 'Not Select', 'ottilie00@example.org', '02123777464', 'Dr. Kaitlin Turner', '665 Leora Avenue Suite 514\nSouth Brando, MN 91000-9160', 'Feilshire', '2015-04-04 06:56:36', 'Debitis deleniti molestiae consectetur dolores eveniet dolores. Nam eligendi distinctio at omnis accusantium facere autem at. Beatae et dolor dolore dolorum.', 'Free'),
(50, 2, '1983-08-09', 'South Rosie', 'DarkGreen', 'HoneyDew', 'United States of America', 'Male', 'prosacco.vernie@example.org', '1-312-433-8453', 'Pietro Goldner III', '503 Hyatt Ville\nEast Kristian, NH 07794-0216', 'Brooketon', '1987-06-22 05:56:51', 'Nisi aut consequatur sed accusantium soluta veritatis. Quis veniam recusandae officia reiciendis assumenda debitis.', 'Gold'),
(51, 2, '1971-03-06', 'Williamsontown', 'Lime', 'DarkViolet', 'Senegal', 'Not Select', 'eddie53@example.net', '(793)360-2065x32378', 'Thora Tremblay', '234 Melyna Springs\nGarrisonmouth, AR 01060', 'West Ahmedchester', '1999-09-03 06:53:09', 'Totam amet quia similique ipsam quas nesciunt ab. Adipisci ducimus mollitia quia consequuntur ea repellendus. Sapiente et voluptas blanditiis tempore odit non omnis. Consectetur sit sed excepturi totam unde nulla.', 'Premium'),
(52, 2, '1970-11-30', 'Kuhlmanport', 'Chocolate', 'Cyan', 'Liberia', 'Male', 'hickle.albert@example.com', '(921)020-1094', 'Torrance Moore', '80416 Kuvalis Forest\nKuhicfort, VT 25299', 'Boydview', '1979-01-16 02:15:52', 'Eos laboriosam ea voluptatem mollitia est et. Asperiores nulla deleniti repellat eaque itaque. Rerum deserunt sint aliquid eos dignissimos eum laboriosam exercitationem. Dolorum dolor ipsam harum iusto. Magnam quam hic et ut cumque architecto ad.', 'Gold'),
(53, 0, '2015-04-29', 'East Frederick', 'Gainsboro', 'Aquamarine', 'Mauritius', 'Female', 'bhirthe@example.org', '(356)977-6941x8368', 'Khalil Funk II', '7387 Cale Track Apt. 344\nLake Maegan, TN 28591-9878', 'Webertown', '2005-07-15 12:11:16', 'Aperiam excepturi et repellat sapiente et nostrum. Tempora tempore nisi tenetur illo voluptas nobis amet.', 'Free'),
(54, 1, '1973-03-25', 'Port Antwonton', 'Navy', 'IndianRed ', 'Guam', 'Female', 'rryan@example.net', '(732)224-7206x7232', 'Ashley Welch', '04651 Walter Shoal\nSouth Dejahport, NV 16535', 'O\'Connellfort', '1976-03-20 18:59:46', 'Repellat illo aliquam nisi voluptas perferendis. Itaque doloribus dolores tenetur explicabo quis est unde. Voluptatem recusandae quas nulla iusto necessitatibus culpa.', 'Gold'),
(55, 1, '2001-02-07', 'Rubyshire', 'DimGrey', 'BlueViolet', 'Russian Federation', 'Not Select', 'crystal21@example.net', '790-827-5189x4343', 'Adelia Stoltenberg', '336 Monroe Pike Suite 048\nAntoniamouth, NH 56994', 'Kingbury', '2003-12-05 05:21:46', 'A eligendi deserunt iste eligendi veniam ab. Suscipit eveniet qui nobis qui consequatur qui. Non illo omnis eius provident.', 'Silver'),
(56, 1, '1989-02-08', 'South Garrison', 'AntiqueWhite', 'Gainsboro', 'Fiji', 'Not Select', 'alexandria.denesik@example.org', '06035204948', 'Furman Stroman', '92400 Horace Green Suite 234\nMyaburgh, OH 14874', 'Heaneyton', '2004-04-04 13:54:52', 'Nobis deleniti cupiditate mollitia quis eos. Qui recusandae velit accusantium expedita sunt nemo aut. Ducimus nisi molestiae temporibus aliquam voluptas dolor. Consequatur tenetur temporibus impedit ut recusandae.', 'Free'),
(57, 0, '1975-10-19', 'Julietside', 'BlanchedAlmond', 'DimGray', 'French Polynesia', 'Male', 'aaliyah90@example.net', '074.593.0415x2584', 'Arnold Hagenes', '30510 Francesco Mill Apt. 503\nMitchellberg, NY 36888', 'South Deontae', '1997-12-30 11:11:46', 'Beatae vel explicabo laboriosam sint non quo. Quaerat architecto repellendus recusandae ipsum eius nemo consequuntur. Non tenetur dolorem qui beatae vel.', 'Premium'),
(58, 0, '1978-06-11', 'Hintzton', 'Crimson', 'PaleGreen', 'Vanuatu', 'Not Select', 'tabitha36@example.net', '(744)339-0055', 'Abbie Block', '45725 Karson Rapids Apt. 107\nNorth Pinkiefort, KS 97549', 'West Madelynn', '2002-08-13 11:02:45', 'Reprehenderit pariatur reiciendis voluptatem fuga adipisci magnam possimus. Minima minima et at et. Placeat debitis impedit non rerum autem ipsum blanditiis. Perferendis incidunt dolore natus adipisci quod reiciendis quia.', 'Silver'),
(59, 1, '1994-10-31', 'Lake Frank', 'Olive', 'SlateBlue', 'United Kingdom', 'Female', 'howe.deontae@example.com', '393.084.4271', 'Lamont Kemmer', '033 Zella Mills\nSouth Melodyborough, SD 09088', 'Lynnville', '2003-02-14 11:07:56', 'Error quod alias mollitia eum qui praesentium possimus et. Et qui est odio quisquam. Ea dolores itaque enim doloremque delectus. A rerum quia doloremque fuga.', 'Gold'),
(60, 0, '2021-05-14', 'North Carey', 'Olive', 'Fuchsia', 'Djibouti', 'Female', 'lauren.morar@example.com', '(168)771-0860', 'Maurine Barton', '8777 Garrett Dale\nPort Keshawn, CT 37995', 'Lednerfort', '2013-02-27 04:23:41', 'Enim veritatis nam et recusandae. Aut provident esse dolores error ut beatae et ratione. Dolorum ut voluptatem tempore id commodi consectetur. Dolor nobis molestiae eos voluptas quam.', 'Gold'),
(61, 0, '2008-10-21', 'Heathcoteberg', 'AliceBlue', 'DarkSalmon', 'Iran', 'Female', 'mortimer99@example.org', '145.662.3196', 'Dr. Stefan Upton', '1483 Runolfsson Lakes\nSchummtown, AR 94876', 'Pagacmouth', '1999-12-13 17:02:11', 'Nam eius voluptate aliquam necessitatibus ab et nam repudiandae. Natus ut officiis velit perferendis ut cum unde.', 'Free'),
(62, 0, '2004-08-04', 'New Trudieberg', 'HotPink', 'GreenYellow', 'Estonia', 'Female', 'xsatterfield@example.com', '1-772-041-6227', 'Krystina Little', '356 Nathanial Skyway\nWest Assuntamouth, ME 62863', 'West Aurelia', '2002-10-02 03:41:34', 'Libero non dolor eos id aut aspernatur qui. Repellendus pariatur incidunt occaecati a id nisi architecto. Perferendis ipsam molestias ut vitae deserunt molestias ipsam.', 'Silver'),
(63, 0, '1970-12-23', 'Metahaven', 'RosyBrown', 'DarkRed', 'Spain', 'Male', 'flemke@example.com', '+81(0)1434855310', 'Jammie Schamberger', '548 Zackery Lock\nSouth Gaylordfurt, SC 24410-2557', 'Sunnyview', '1986-05-11 00:02:07', 'Et vel accusamus alias nesciunt cumque. Illo dolores necessitatibus eligendi molestiae fugiat. In incidunt unde qui.', 'Silver'),
(64, 0, '1990-04-19', 'Port Cortezside', 'Pink', 'Aquamarine', 'Philippines', 'Male', 'cummerata.vaughn@example.net', '706.040.5509x258', 'Willis Baumbach', '03073 Ledner Fort Apt. 589\nKonopelskiborough, VA 83473-5420', 'Lake Beth', '1982-03-28 17:06:10', 'Saepe corrupti magni unde ut quod et neque sit. Qui id dolores quasi omnis expedita qui.', 'Premium'),
(65, 2, '1989-01-29', 'South Nellie', 'SlateGray', 'DodgerBlue', 'Malawi', 'Male', 'alexandro94@example.com', '(514)099-4807x310', 'Ms. Vernie Homenick I', '546 Lenny Village Apt. 846\nFaytown, MD 55689-1147', 'Prohaskashire', '1998-01-15 16:29:52', 'Quam sed ab error alias at quia. Et rerum eveniet est quia explicabo veniam. Tenetur maiores qui consequatur alias et. Recusandae ipsam modi ipsa et eos ea.', 'Silver'),
(66, 2, '2010-12-26', 'Bartellstad', 'Yellow', 'RoyalBlue', 'Congo', 'Male', 'alda.bogisich@example.com', '1-561-374-9205', 'Clair Kutch', '812 Amelia Parkway Apt. 865\nLake Reannastad, HI 39788-7245', 'New Moises', '1987-09-05 13:03:21', 'Id sit vitae aspernatur iure natus esse voluptatum. Aut aspernatur qui necessitatibus quasi nam voluptas in explicabo. Qui animi et voluptatem.', 'Free'),
(67, 0, '1975-02-19', 'North Ashley', 'Wheat', 'DarkBlue', 'Guinea', 'Male', 'stephon.lang@example.net', '795.973.7715x9998', 'Caesar Friesen', '67027 Melissa Mills Suite 790\nHamillstad, SD 36447-8636', 'West Florian', '2002-05-07 13:43:50', 'Harum illo velit exercitationem quia velit dolor. Non consectetur et doloremque quis excepturi alias et. Voluptas aut iusto commodi quis. Laboriosam cumque inventore illo quidem. Sed quae rerum soluta possimus ut et.', 'Free'),
(68, 0, '1978-10-03', 'Port Kyraport', 'MediumSeaGreen', 'LightSalmon', 'Cuba', 'Female', 'manley.streich@example.net', '886.666.3146x8691', 'Gabriel Gibson', '903 Jodie Burg\nEast Deangelotown, CA 86344', 'Freddymouth', '2003-01-02 19:39:04', 'Quam sequi et distinctio libero perferendis non magni. Vitae voluptates totam natus vel. Assumenda aspernatur amet debitis.', 'Free'),
(69, 2, '1997-09-28', 'Annettaview', 'PaleTurquoise', 'Yellow', 'Vanuatu', 'Male', 'anderson.anderson@example.org', '1-914-084-1898x0149', 'Mr. Johnpaul Pacocha PhD', '131 Wilma Grove Apt. 502\nSchowalterfurt, IA 90160-6542', 'Anyastad', '1971-06-26 11:07:21', 'Saepe doloremque rerum provident expedita id. Quia inventore atque aut similique quisquam. Et ad aut aut quibusdam harum. Eius sint fugit quibusdam facilis pariatur dignissimos et in.', 'Free'),
(70, 0, '1980-01-05', 'South Wilfredoberg', 'PeachPuff', 'DarkCyan', 'Suriname', 'Male', 'jaskolski.vicenta@example.com', '239-740-0356', 'Chad Bernier', '226 Hammes Radial Suite 551\nEdmondmouth, NY 14588', 'Francescamouth', '1994-01-06 03:10:54', 'Dolorem architecto iusto aspernatur. Possimus consequuntur rerum et nemo facilis vitae. Ut veniam iure eius debitis cupiditate ut eos. Incidunt quod et eum sunt impedit velit itaque atque.', 'Gold'),
(71, 0, '1999-02-21', 'Eusebioside', 'GoldenRod', 'Crimson', 'Belgium', 'Not Select', 'tracey.ankunding@example.net', '+33(0)5688815042', 'Carli Towne', '92861 Lindgren Trace\nSouth Saulfort, MT 38083-9257', 'Port Carolyn', '2003-12-01 06:36:30', 'Voluptas illum quo tempore alias aliquid voluptas quo. Rem consequuntur labore officiis aut atque iure rerum. At labore sed ipsam consequatur doloribus.', 'Free'),
(72, 2, '1997-05-27', 'Schillerville', 'LemonChiffon', 'Green', 'Solomon Islands', 'Female', 'hjacobi@example.net', '1-767-303-2814', 'Eldred Mosciski', '6636 Von Station Suite 553\nLangworthview, NC 60483', 'New Ebbashire', '2000-03-20 08:25:40', 'Voluptatem quisquam officiis nihil molestiae porro atque. Tenetur asperiores omnis culpa incidunt aut aut sequi repellendus. Non pariatur at eaque nulla a nostrum deserunt.', 'Free'),
(73, 2, '1997-11-02', 'North Gregorio', 'OldLace', 'DarkBlue', 'Gibraltar', 'Not Select', 'brigitte65@example.org', '348.745.3970x33920', 'David Moore MD', '0394 Grant Estate\nRueckerland, VT 42303', 'Port Albinaberg', '1972-10-17 17:20:28', 'Incidunt recusandae repellendus tempora et facere ex. Et minus hic nulla nam architecto ut. Dignissimos esse a quibusdam sint ab. Eum sed dolorem provident rerum earum consequatur.', 'Gold'),
(74, 0, '2014-11-30', 'South Graycestad', 'LightGoldenRodYellow', 'DarkKhaki', 'Saint Martin', 'Male', 'ffisher@example.net', '001-242-4059x49231', 'Gardner Rempel', '90073 Steuber Circles\nDeonteborough, VT 97038', 'East Cloydtown', '1975-11-28 18:00:28', 'Qui eaque rerum et laboriosam. Fugiat vero occaecati error molestiae necessitatibus. Rerum eos ea magni dolore perferendis quae. Eos eum quis fugiat est in aut.', 'Gold'),
(75, 0, '2017-10-29', 'North Laury', 'NavajoWhite', 'Violet', 'Belize', 'Male', 'qkulas@example.net', '02629657819', 'Raphaelle Altenwerth', '05030 Johnnie Well Suite 915\nEast Orlando, SC 39292-0837', 'South Emmafort', '1991-08-23 03:37:53', 'Ut provident ipsum possimus provident hic molestiae incidunt. Sit ducimus placeat placeat sit qui. Ipsum dolores totam vero laudantium. Ipsa iure qui sit iure tenetur sit sed.', 'Gold'),
(76, 1, '1971-07-03', 'Port Gordonville', 'Red', 'PeachPuff', 'Cocos (Keeling) Islands', 'Not Select', 'weissnat.lauren@example.net', '+20(5)2276524819', 'Ms. Joanny West', '8941 Nelle Springs Apt. 229\nRandalltown, PA 05941-4527', 'Moshemouth', '1982-05-21 09:50:14', 'Sint earum aut odit dolores sit rem laboriosam iste. Voluptatem quia ea eum consequatur et. Et maxime nesciunt eum assumenda.', 'Premium'),
(77, 0, '2002-01-20', 'Chadside', 'PeachPuff', 'DarkOliveGreen', 'Bhutan', 'Female', 'ylesch@example.net', '035-248-2377', 'Maxine Bednar', '45458 Schowalter Prairie\nEast Deangelo, VT 53857-8528', 'North Eddie', '2021-04-14 13:26:21', 'Vitae rerum rerum totam impedit. Dolor rerum optio explicabo reiciendis in.', 'Free'),
(78, 0, '2014-03-12', 'Lubowitzside', 'Pink', 'BurlyWood', 'Korea', 'Not Select', 'jess20@example.com', '06468651617', 'Jonatan Dickens', '2872 Jamison Lake\nLake Aubree, MI 37653-6953', 'East Eribertomouth', '1987-11-18 23:27:55', 'Libero amet dolore officia molestiae veniam rerum voluptatem. Sed odio eveniet est id.', 'Premium'),
(79, 1, '2010-09-05', 'Shirleymouth', 'RosyBrown', 'SpringGreen', 'Faroe Islands', 'Not Select', 'jazmin34@example.net', '01228228646', 'Miss Minnie Kuhlman', '3989 Schneider Shoals Suite 695\nMetztown, VA 44212', 'Littelchester', '2005-06-07 17:06:05', 'Necessitatibus et sed maiores dolorum rerum. Necessitatibus numquam vero rem. Maiores provident officia exercitationem enim dolores et illo cum.', 'Premium'),
(80, 0, '1987-12-19', 'New Gregside', 'Yellow', 'Gold', 'Uzbekistan', 'Not Select', 'alexandrea20@example.org', '818.524.9983x339', 'Annie Bahringer', '22671 Chelsey Road Suite 879\nNew Noemy, MO 80417-1611', 'Lake Coltonton', '2005-10-22 04:54:45', 'Itaque beatae et repellendus vel laudantium dicta. Tenetur harum nemo nobis eaque sequi. Tempora et minus ad.', 'Silver'),
(81, 0, '1980-05-04', 'Valentinefort', 'Khaki', 'LightSeaGreen', 'Holy See (Vatican City State)', 'Female', 'river46@example.net', '113-138-6418', 'Trevion Kihn', '515 Bayer Turnpike\nPort Emanuelberg, ND 79733-8387', 'New Chaseland', '2002-09-17 03:54:35', 'Doloremque error animi sunt. Qui nobis eligendi sapiente ut ex. Doloribus pariatur non suscipit. Quisquam officia labore dolores dolores.', 'Free'),
(82, 2, '2007-04-19', 'North Jacey', 'LavenderBlush', 'Olive', 'San Marino', 'Not Select', 'tatum64@example.com', '(259)340-4905', 'Dr. Amalia Rempel I', '350 Margarette Pass\nKuhlmanfort, VT 75617', 'Murazikstad', '1990-08-27 16:48:43', 'Enim beatae earum quis quidem corporis. Dicta sit qui minus quae ipsum sequi vel. Non corrupti accusantium ad et.', 'Premium'),
(83, 0, '1972-06-10', 'O\'Keefefort', 'DarkCyan', 'SandyBrown', 'Bangladesh', 'Female', 'leola10@example.org', '080-041-8505x3427', 'Ms. Bethel Medhurst', '689 Bogan Trail\nDickensside, HI 94266-9312', 'Addieland', '1975-12-29 23:43:08', 'A a mollitia autem. Quis repellat at earum et qui rerum repudiandae. Rerum exercitationem est sequi nulla quo ut laborum.', 'Gold'),
(84, 2, '1982-05-21', 'Jermainside', 'Magenta', 'Crimson', 'Aruba', 'Not Select', 'ruecker.queen@example.org', '970.917.9898x36184', 'Dariana Muller', '5908 Bartell Summit\nPagacberg, WA 69381', 'Marvinbury', '1986-02-07 07:29:53', 'Qui deleniti ea temporibus rerum. Nesciunt repellat doloribus voluptatum maxime occaecati dolor. Tenetur omnis enim velit officiis enim est quasi eos. Officiis culpa impedit totam. Ad non asperiores voluptas molestiae.', 'Premium'),
(85, 1, '2014-09-26', 'Lake Maximilianport', 'White', 'IndianRed ', 'Sweden', 'Female', 'zakary80@example.org', '600.896.3079', 'Dr. Cameron Auer', '4931 Medhurst Knoll Apt. 629\nWest Dianna, SC 88951-2290', 'South Jace', '1995-11-10 13:38:11', 'Aut veritatis at ut. Quia et sunt vel pariatur quo. A necessitatibus distinctio et laudantium necessitatibus maxime.', 'Gold'),
(86, 1, '1974-11-03', 'Lake Rogelioville', 'FireBrick', 'Green', 'Croatia', 'Male', 'jhackett@example.net', '04159373673', 'Cristal Mante', '76568 Valentina Locks\nMoisesland, WI 54303', 'Coleport', '2005-02-06 15:18:48', 'Dolorem ut animi excepturi incidunt ex. Animi eum officia minus illum quia. Assumenda et et quo expedita molestias vitae officiis voluptatem.', 'Silver'),
(87, 2, '2009-10-21', 'East Ted', 'LightCoral', 'MediumAquaMarine', 'Central African Republic', 'Not Select', 'schroeder.felipe@example.com', '1-119-328-4880x708', 'Johann Bogan', '12134 Crist Grove Suite 729\nLake Uriel, AZ 84650-2453', 'Jeraldfort', '1993-03-11 20:57:06', 'Excepturi quisquam sunt et hic sit vero. Magni similique tempore aliquid dolorum vitae repellat sit. Est dolor occaecati autem libero consectetur aspernatur reprehenderit. Aperiam non voluptatem ea omnis. Deleniti sapiente quia mollitia et dicta eligendi ', 'Premium'),
(88, 0, '1991-04-20', 'Wolfmouth', 'Aqua', 'BlueViolet', 'Afghanistan', 'Male', 'terence.raynor@example.org', '+47(5)4180668634', 'Deshaun Jones IV', '021 Kozey Ridge\nCarterland, CO 07252', 'Willside', '1991-03-04 06:16:50', 'Et sed eveniet amet. Quo rerum enim placeat iusto illum. Aspernatur dolores atque enim placeat voluptatem eaque aliquid. Quisquam qui facere et.', 'Gold'),
(89, 2, '1984-12-16', 'North Josiah', 'LemonChiffon', 'SeaGreen', 'Iran', 'Male', 'ddaniel@example.org', '558.303.2737', 'Delphia Towne', '110 Hegmann Unions\nSamanthafort, AZ 85974-9137', 'East Jaquan', '1986-11-18 09:56:29', 'Velit sed odio tempora fugit. Molestiae eum cumque eveniet libero ipsa soluta ullam. Et iure placeat eum saepe.', 'Free'),
(90, 0, '2009-09-14', 'Kertzmannshire', 'PaleGreen', 'SeaGreen', 'Uganda', 'Not Select', 'reymundo37@example.com', '1-305-776-9624', 'Kari Parisian', '969 Madalyn Harbor\nHoppemouth, NY 37107', 'South Candacehaven', '1997-01-12 11:58:05', 'Commodi voluptas eos sit magnam vitae. Qui vel nulla deserunt natus. Eaque tempore eos omnis. Sit quia velit veniam placeat.', 'Gold'),
(91, 2, '2016-03-12', 'North Vergiestad', 'MediumTurquoise', 'GreenYellow', 'Malawi', 'Not Select', 'feil.dominic@example.net', '+75(5)8920432344', 'Mike Gaylord', '84278 Brown Greens\nStokesshire, KY 54687-6504', 'Herzoghaven', '2006-07-13 13:47:09', 'Aut consequatur non magni error. Libero id dolorem voluptate dolores ea fugiat. Repudiandae aut eum quas corporis et neque.', 'Gold'),
(92, 0, '2012-02-24', 'Port Gayberg', 'Sienna', 'MediumTurquoise', 'Madagascar', 'Male', 'carleton.stamm@example.org', '(178)073-1779', 'Sage Satterfield', '76856 Kuhic Mount Apt. 096\nSouth Ward, SD 65602', 'Mosciskiland', '2000-03-17 15:40:28', 'Dolores in omnis et magnam aut minima iusto. Nostrum aperiam vel perspiciatis sed aut cumque. Ut et sint maxime voluptas rerum voluptatem eum. Est sunt omnis culpa quod rerum aliquid at.', 'Free'),
(93, 2, '2005-04-26', 'South Keyshawn', 'LimeGreen', 'Sienna', 'Western Sahara', 'Not Select', 'xkuphal@example.com', '821-171-6627', 'Zelma Bartoletti', '3774 Denesik Ways\nNew Veronaborough, AZ 22766', 'Lake Melissatown', '1983-07-06 16:35:58', 'Eos dolores non enim id. Labore qui et ipsum voluptatem sapiente. Ut est magnam assumenda est dolorum omnis expedita.', 'Gold'),
(94, 1, '1988-05-15', 'Gleichnerbury', 'Gainsboro', 'DarkMagenta', 'Denmark', 'Male', 'sunny.homenick@example.com', '448.408.0014', 'Dora Labadie', '66423 Shakira Ranch\nJacobsonmouth, VT 27801-3191', 'West Kathleen', '1981-05-15 11:34:32', 'Ea nemo eius et illo id. Autem ut ut aperiam consequatur quia illum. Possimus molestiae dolores et rem. Tempore fuga voluptates voluptatum vel consequuntur consequatur distinctio.', 'Premium'),
(95, 2, '1996-10-02', 'McLaughlinborough', 'Orange', 'NavajoWhite', 'Monaco', 'Male', 'zwisozk@example.net', '+70(3)0075269321', 'Kacie Lebsack', '2644 Marks Circle\nLunastad, AR 37829', 'Elfriedafurt', '1996-04-05 09:58:37', 'Qui et asperiores qui earum quibusdam. Sunt fugit pariatur accusamus tenetur. Maiores in quod adipisci neque aliquam amet.', 'Silver'),
(96, 2, '2002-04-25', 'Port Presleyton', 'Orange', 'Gainsboro', 'Holy See (Vatican City State)', 'Male', 'cschamberger@example.net', '(303)425-3941x03490', 'Jovan Roberts', '73977 Natalia Lakes\nSouth Vladimirburgh, AL 28021-3125', 'West Immanuel', '2012-03-16 22:25:16', 'Soluta animi et magnam harum. Doloribus incidunt nobis voluptatum molestiae similique. Molestiae dolores adipisci ut.', 'Premium'),
(97, 1, '1985-04-27', 'Port Hattie', 'Purple', 'OrangeRed', 'Saint Vincent and the Grenadines', 'Not Select', 'maximillia.champlin@example.org', '605.414.9941x52361', 'Geovanny Stracke', '206 Emard Stravenue\nPort Mathildeborough, NC 92228-9829', 'Mikefort', '1975-08-12 21:01:24', 'Ea molestiae in atque. Nobis temporibus nesciunt doloribus. Qui debitis culpa dolor consectetur. Aut saepe voluptas et est.', 'Free'),
(98, 2, '1993-02-15', 'Bartellfurt', 'MediumTurquoise', 'Violet', 'Togo', 'Not Select', 'barrows.belle@example.net', '(639)989-2956x06913', 'Lori Zboncak', '08283 Lesly Ville Apt. 934\nDietrichberg, AZ 73219', 'Herzogmouth', '2007-03-19 06:32:30', 'Neque non cumque nisi ipsum ut. Aut nisi eum quis praesentium. Tenetur dignissimos aut voluptatem quis sint.', 'Gold'),
(99, 1, '2007-09-27', 'Thaliaburgh', 'BurlyWood', 'Red', 'Bangladesh', 'Male', 'melissa.prosacco@example.org', '933-084-9973x37609', 'Dr. Anthony Mitchell Sr.', '11112 Franecki Harbors\nLake Katherynchester, NJ 98431', 'Wolfside', '2008-05-17 00:30:28', 'Recusandae voluptatem minima minima aut maiores. Quo et ad nisi a. Fugiat aut ipsum et earum.', 'Gold'),
(100, 1, '1995-03-09', 'Lake Cedrick', 'PeachPuff', 'OrangeRed', 'Tanzania', 'Female', 'pagac.zechariah@example.org', '336-122-0048x933', 'Mrs. Mylene Bauch', '819 Rath Streets\nMacejkovicville, KS 45864-5481', 'McGlynnborough', '1999-03-07 09:55:34', 'Et excepturi dolores ex aut eum. In debitis impedit expedita qui neque. Id qui pariatur explicabo.', 'Silver'),
(101, 2, '1989-08-30', 'Daniellashire', 'SeaShell', 'DarkBlue', 'Vanuatu', 'Female', 'gkub@example.com', '1-372-919-9675x9880', 'Dr. Kolby Breitenberg', '93525 Hickle Lane\nEast Misty, DE 67868', 'South Luciano', '2010-11-25 01:54:52', 'Nihil vel voluptas velit placeat et ex. Accusamus unde voluptatem voluptas ut id. Ab eius alias consequatur eligendi. Non at unde ea et et. Rem in aspernatur expedita deserunt harum.', 'Premium'),
(102, 1, '1987-11-26', 'Gusfort', 'DarkMagenta', 'Darkorange', 'Greenland', 'Female', 'ahessel@example.net', '+10(9)1586597070', 'Miss Aileen Lowe', '521 Price Flat\nSouth Casandra, ME 33337', 'South Feltonborough', '1994-12-06 18:29:33', 'Quo minima voluptatem ducimus ut porro. Nesciunt quo facere qui beatae. Molestias quod facere impedit sit occaecati quas omnis. Perspiciatis velit adipisci consequatur quod voluptatem quo ut.', 'Free'),
(103, 1, '2022-02-25', 'East Christa', 'Darkorange', 'GoldenRod', 'France', 'Female', 'schmeler.keira@example.com', '903-957-4431', 'Conner Ankunding', '64593 Hilpert Underpass Suite 621\nLake Lennahaven, NE 09145', 'South Bernieberg', '2011-01-22 12:10:44', 'Nihil qui quaerat voluptates illo quibusdam odit quia nihil. Optio maxime eius omnis neque eaque voluptatibus.', 'Free'),
(104, 1, '1992-07-13', 'Lake Adrian', 'LightSlateGray', 'LimeGreen', 'United States Minor Outlying Islands', 'Female', 'louie.ryan@example.com', '1-295-511-2425', 'Miss Maiya Ebert DDS', '89482 Alana Fort\nAntoneburgh, GA 25646', 'West Allenhaven', '2022-02-07 06:16:43', 'Accusantium voluptatem nihil autem inventore est aut. Magnam aut deserunt et eveniet fugit. Incidunt officiis repellendus iste molestiae veniam vero aut aut. Assumenda et rerum dolorum amet. Dicta nisi itaque repellendus praesentium sit.', 'Silver'),
(105, 1, '2011-02-21', 'Gleichnershire', 'Lime', 'DarkOliveGreen', 'Indonesia', 'Male', 'muhammad.bauch@example.org', '1-825-988-3689x07811', 'Brock Wyman DVM', '63306 Lila Fork Suite 640\nLake Lenna, NM 93545', 'West Katherynport', '1995-06-24 12:24:58', 'Asperiores aliquam magnam non et dolor molestiae. Aut vitae nostrum unde odit. Quae quas autem quisquam accusamus molestiae dolor.', 'Free'),
(106, 2, '1992-12-12', 'Lake Ansel', 'Plum', 'Darkorange', 'Madagascar', 'Female', 'ihahn@example.com', '218-480-4352x36094', 'Roger Hermiston', '2514 Simonis Extensions Apt. 513\nEast Rosellafort, CT 33016-5035', 'Lomaside', '1994-02-04 23:52:01', 'Accusantium ut deleniti laboriosam. Ut numquam consequuntur adipisci quia. Voluptatem iusto et porro sunt ipsam. Est autem quibusdam sunt voluptatum magni. Repudiandae consequatur non illum id aut labore possimus et.', 'Free'),
(107, 2, '2014-12-02', 'Lake Julianne', 'DarkSlateGray', 'Khaki', 'United Arab Emirates', 'Male', 'dubuque.ellis@example.org', '613.843.2774x123', 'Eleanore Jaskolski', '1862 Carroll Lane\nGaylordview, NJ 90269-1887', 'South Chrisland', '1982-03-26 11:27:42', 'Porro atque molestias possimus distinctio suscipit perferendis. Tempore consectetur omnis iste consequatur minus iste molestiae ab. Ea cum sint ipsum omnis. Sit non aut sit expedita rerum est. Sit ad est voluptate.', 'Free'),
(108, 2, '2018-02-28', 'Port Cristal', 'LightCyan', 'Fuchsia', 'Nicaragua', 'Not Select', 'etowne@example.org', '1-365-504-7191x53060', 'Mr. Linwood Thompson', '90943 Alessandra Valleys Apt. 096\nLindmouth, OH 15886', 'New Lottie', '1994-08-21 05:01:43', 'Quia amet accusamus neque porro omnis. Quis quasi quae non sed omnis. Et dolores dolorem quo dolorem facere. Dolor quaerat ex magnam est quas iure.', 'Free'),
(109, 2, '2019-11-13', 'Elissaborough', 'SlateGray', 'Silver', 'Brunei Darussalam', 'Male', 'blair69@example.com', '02321999459', 'Herminia Kemmer', '733 Hirthe Mews Apt. 998\nLake Florian, SD 68503-0366', 'North Elissa', '2004-02-15 05:14:11', 'Incidunt adipisci molestiae eum velit quo odio. Beatae vitae totam enim dolorem aut mollitia omnis consequuntur. Iste et possimus et ut voluptas accusamus. Praesentium repellendus perferendis dolor necessitatibus qui.', 'Gold'),
(110, 1, '1978-09-22', 'Assuntachester', 'LightSeaGreen', 'LightSlateGray', 'Guadeloupe', 'Not Select', 'barry05@example.org', '1-793-662-6113x5123', 'Sydnee Daugherty', '42508 Delilah Drive Apt. 300\nDulcetown, DC 16131-6476', 'Port Gerardchester', '1999-03-28 01:12:34', 'Illum minima blanditiis dolorem officiis earum distinctio deleniti. Sed est itaque praesentium ab. Magni maiores et in nulla accusamus consectetur. Architecto qui dignissimos omnis quia cumque.', 'Silver'),
(111, 1, '1978-12-08', 'Berniecetown', 'SpringGreen', 'BurlyWood', 'Brazil', 'Not Select', 'clyde33@example.net', '1-661-949-6248x54083', 'Van Stiedemann', '496 Nolan Pine Apt. 861\nLueilwitztown, MS 56846-8691', 'Tellyfort', '2012-05-02 19:23:27', 'Cum et excepturi dignissimos ea officiis. Maiores dolor ut a eos quis et sed. Voluptatem sequi suscipit et doloremque dolores quis ipsa. Non in laudantium architecto vitae.', 'Gold'),
(112, 1, '2019-08-10', 'Hectorbury', 'LightYellow', 'LightGray', 'Mozambique', 'Male', 'wilderman.jaylin@example.net', '(779)158-9770x002', 'Ardella Schuppe', '953 Becker Landing Suite 730\nWest Damarischester, ID 10799-9456', 'Hardyfurt', '1972-03-15 03:42:35', 'Sint magni tempora porro atque. Eos maiores corporis fuga autem error et. Aut ipsam quos corporis voluptatem dolorem qui. Exercitationem et natus fugiat.', 'Premium'),
(113, 0, '2007-11-28', 'West Zechariahchester', 'LightCyan', 'MediumSpringGreen', 'Taiwan', 'Not Select', 'rey40@example.net', '(689)009-7983x0374', 'Jerad Kub', '9287 Leannon Harbors\nNew Bartholomeville, AZ 76865', 'Bogisichmouth', '2021-06-27 02:45:18', 'Optio occaecati enim commodi ad. Aut blanditiis provident quisquam aperiam itaque pariatur ratione. Molestias corporis aut perferendis. Id enim voluptatem voluptatem qui ut quia omnis sapiente.', 'Silver'),
(114, 2, '2010-12-04', 'South Cassidyfurt', 'DeepSkyBlue', 'YellowGreen', 'Malawi', 'Male', 'iweimann@example.net', '1-848-638-0088x431', 'Hilton Little', '7183 Green Forks Suite 884\nLake Cesarburgh, VT 64681', 'Hettingerton', '2017-07-16 19:24:27', 'Enim velit aut ipsa repellat. Excepturi iure omnis dolores qui error labore praesentium adipisci.', 'Free'),
(115, 1, '1972-06-17', 'East Claudia', 'MistyRose', 'DeepSkyBlue', 'Saint Martin', 'Not Select', 'gmcglynn@example.com', '08931101185', 'Dr. Mellie Kreiger', '50795 Peter Canyon\nAbrahamton, LA 08617', 'Tyreeshire', '1994-07-21 10:37:37', 'Qui sed id optio rerum quibusdam. Quibusdam quibusdam architecto perferendis inventore consequatur qui explicabo.', 'Silver'),
(116, 1, '2007-06-12', 'East Susanaberg', 'White', 'DarkRed', 'Rwanda', 'Male', 'farrell.kade@example.net', '002-163-0080x944', 'Nyasia Larson I', '7358 Wiegand Plaza\nNorth Eleonoreland, RI 15149', 'Port Helgafurt', '2018-04-26 15:06:57', 'Veniam sunt qui est dignissimos voluptatem ad. Quis est in sequi totam animi eos. Perspiciatis explicabo accusamus velit deserunt quia impedit accusamus. Et minus sit minus omnis. Quod et nesciunt cumque quidem rerum officiis ex possimus.', 'Silver'),
(117, 2, '1987-04-12', 'Port Rosanna', 'PapayaWhip', 'OldLace', 'Sweden', 'Female', 'lullrich@example.net', '(266)877-2528', 'Henderson Corkery V', '0962 Gutkowski Trace Suite 193\nBaileybury, KY 88900-1130', 'North Adrienfort', '2004-06-28 16:27:03', 'Animi perspiciatis non ut ea ab expedita. In facere sed et deleniti dolore id. Delectus aut dolorum accusamus hic. Non nam corrupti iusto quia inventore et iure.', 'Gold'),
(118, 2, '2021-05-13', 'East Kyleigh', 'DarkKhaki', 'DarkRed', 'Oman', 'Male', 'heather.deckow@example.net', '684.865.2911', 'Claude Schowalter', '158 Jerde Plain Suite 076\nRogerchester, MI 17479', 'Hudsonland', '2018-01-23 19:55:00', 'Consequatur accusantium et perspiciatis explicabo ipsam. Dolores aperiam consequatur minus sunt. Necessitatibus quia id cum error. Sed iusto qui temporibus.', 'Free'),
(119, 0, '1985-04-03', 'O\'Connerview', 'PapayaWhip', 'Brown', 'Cocos (Keeling) Islands', 'Not Select', 'dickens.mollie@example.com', '1-173-901-6701', 'Dr. Georgiana Jacobi II', '300 Lincoln Heights Apt. 848\nPort Genesis, KS 30733', 'Lake Keaganville', '1986-09-18 09:48:48', 'Adipisci ipsam ipsa quo qui voluptates. Non explicabo accusantium impedit ut. Incidunt voluptates dolorem laborum saepe autem minus.', 'Silver');
INSERT INTO `individual` (`id`, `status`, `date_of_birth`, `place_of_birth`, `church_name`, `organization`, `country`, `gender`, `email`, `phone`, `name`, `address`, `city`, `since`, `description`, `packet`) VALUES
(120, 2, '2007-11-08', 'East Syble', 'LemonChiffon', 'Green', 'Oman', 'Female', 'vernie82@example.net', '(597)922-0033x1596', 'Mr. Otis Baumbach Jr.', '984 Metz Curve\nRomaland, OK 12645-6234', 'Lebsackberg', '1977-02-04 14:25:25', 'Voluptatem praesentium illum nobis eaque. Fugit rem eos dolores non repellat exercitationem. Fuga aliquid omnis autem rerum eum inventore qui perspiciatis.', 'Gold'),
(121, 1, '1987-02-02', 'Salmamouth', 'LightCoral', 'DodgerBlue', 'Malawi', 'Not Select', 'xwolf@example.com', '248.842.8479', 'Rafael Schultz', '80295 Hammes Stravenue\nNew Jordyhaven, OR 23363-1215', 'New Tinamouth', '1979-02-16 13:34:16', 'Provident sit eos nesciunt ut molestiae dolores. Alias iure quis placeat velit distinctio. Commodi blanditiis assumenda cumque quisquam illo itaque temporibus. Dignissimos distinctio quia ut veniam quia recusandae quo.', 'Premium'),
(122, 1, '2017-10-10', 'Percymouth', 'MediumTurquoise', 'MintCream', 'Azerbaijan', 'Female', 'emilio39@example.net', '(370)793-4860', 'Elias Kozey', '10927 Gerry Cliffs Suite 677\nPort Loybury, SC 26581-2413', 'New Eulaliahaven', '1997-06-12 13:20:48', 'Dolorem sint vero enim. Fuga aut consectetur veniam et iusto vitae inventore. Consectetur voluptatem qui et expedita et omnis.', 'Silver'),
(123, 1, '2020-02-12', 'North Quinn', 'OliveDrab', 'OrangeRed', 'Tonga', 'Male', 'estamm@example.com', '+30(8)5423119687', 'Javier Kling', '30234 Cronin Dale\nIzaiahland, CT 73896', 'West Jensenport', '2002-06-03 16:51:41', 'Qui et nulla ex tempore quibusdam. Nulla consequatur voluptas et. Saepe ut molestiae fugiat est quae.', 'Free'),
(124, 0, '1973-09-17', 'Fernview', 'Indigo ', 'LemonChiffon', 'Monaco', 'Male', 'ali08@example.com', '296.304.6009x544', 'Myrtice Stehr', '27467 Moore Light Apt. 471\nNew Kaitlyn, ND 30576-3860', 'Towneview', '1974-08-05 11:57:55', 'Repudiandae et unde qui voluptatem omnis dolorem deleniti. Et fugiat eos sit amet non. Voluptatibus minima ut hic qui.', 'Premium'),
(125, 2, '1978-03-03', 'Rippintown', 'DarkSlateGray', 'DarkRed', 'Tajikistan', 'Female', 'rbosco@example.com', '02423790575', 'Opal Connelly', '5091 Marquardt Manors Suite 203\nWest Joannie, AK 70111-7912', 'Gwentown', '2002-07-22 04:06:22', 'Non eligendi repudiandae est vel sit. Necessitatibus eius molestias illo debitis. Omnis accusantium qui temporibus ut asperiores ut. Tenetur doloremque dolorum odio et adipisci et.', 'Free'),
(126, 1, '2009-02-06', 'Camilamouth', 'SaddleBrown', 'Indigo ', 'Guernsey', 'Not Select', 'mayert.mallory@example.com', '900-431-4922x95614', 'Miss Princess Krajcik PhD', '158 Lowell Mills Suite 045\nMatteotown, DC 80028-9727', 'South Dagmar', '2017-01-05 23:05:06', 'Aliquam sunt et quos rerum esse. Quia labore et quas. Et ratione velit et velit neque doloribus dolorem ab.', 'Gold'),
(127, 0, '1995-01-21', 'Lowetown', 'Peru', 'DarkBlue', 'Lithuania', 'Not Select', 'isabell.kuhic@example.net', '1-656-240-9646x3252', 'Quincy Gerlach Sr.', '235 Haag Mall Apt. 725\nLake Rylan, NE 55245', 'Cleveland', '2015-06-11 15:58:38', 'Atque aut pariatur voluptatem ducimus. Beatae qui enim veritatis nulla. Omnis consequatur et qui sed. Dolores voluptas illum quod sed quis quod ducimus reprehenderit.', 'Gold'),
(128, 2, '2008-10-16', 'Batztown', 'SkyBlue', 'Linen', 'Bosnia and Herzegovina', 'Male', 'bryon.schroeder@example.com', '(356)829-2801', 'Garett Boyle', '34609 Retta Mountain Apt. 491\nNew Elsemouth, MS 10419-1200', 'Port Sedrickburgh', '2006-05-03 00:31:55', 'Recusandae non eos doloribus dolor. Eius minima dolor quia sint voluptas error corporis rerum.', 'Silver'),
(129, 0, '2006-04-21', 'New Vallietown', 'Blue', 'YellowGreen', 'Cayman Islands', 'Female', 'golden.zulauf@example.org', '914.348.2113x762', 'Mrs. Lelah Hudson', '54099 Otis Shoal Suite 401\nPriceburgh, VT 71054-5408', 'Deckowview', '2016-02-11 23:51:03', 'Est est qui explicabo reprehenderit dolorem enim. Rerum saepe deleniti sint earum est. Molestiae cum et vel consectetur consequuntur ut dolor possimus. Fuga facere vel et voluptas. Rerum est repudiandae eligendi porro accusantium exercitationem dolores qu', 'Silver'),
(130, 1, '1996-10-28', 'Madelynntown', 'RosyBrown', 'DarkRed', 'Western Sahara', 'Male', 'breitenberg.kristina@example.net', '708-099-3290', 'Candace Medhurst', '314 Rohan Unions Apt. 390\nNorth Leslybury, AL 48611', 'West Juliet', '2009-11-15 05:41:16', 'Cumque similique aliquam ducimus impedit nulla enim. Tenetur doloremque id suscipit quos eius voluptas at. Eveniet ut sit non deserunt suscipit et qui eos.', 'Free'),
(131, 1, '2012-02-10', 'Ortizmouth', 'Azure', 'Cyan', 'Vietnam', 'Not Select', 'fahey.marvin@example.net', '789-499-4925x575', 'Percy Conroy Sr.', '0970 Nolan Crest\nOrnhaven, DE 99535-3716', 'Binsborough', '1970-05-08 23:02:17', 'Quasi fuga dolorem aut dignissimos. Rerum rerum provident reprehenderit nesciunt adipisci. Dolor possimus atque est sed.', 'Free'),
(132, 1, '2006-01-18', 'New Domenick', 'SlateGray', 'Ivory', 'Argentina', 'Not Select', 'moore.durward@example.net', '(065)815-5377x49209', 'Adeline Huels', '135 Juana Oval\nRatkeport, CA 58318', 'Dayanabury', '2003-05-14 06:04:08', 'Velit aut dignissimos voluptatem recusandae laborum aut. Ipsam cupiditate porro numquam et distinctio. Esse numquam aliquid expedita et et et distinctio. Voluptatem beatae sapiente natus laborum.', 'Free'),
(133, 0, '1982-08-02', 'Amandaland', 'Lavender', 'LightSkyBlue', 'Sao Tome and Principe', 'Not Select', 'kunze.myrl@example.net', '482.460.7910x96980', 'Jade Gerhold', '0445 Myra Shoals\nNew Kenyatta, FL 26457', 'Cormierside', '1983-09-26 18:33:37', 'Debitis maiores assumenda hic quod minus modi quo. Dicta et cumque id hic totam. In in ipsum nihil ea sed incidunt unde accusamus. Reprehenderit aliquam deserunt voluptate.', 'Silver'),
(134, 1, '2015-03-05', 'Maybellstad', 'MediumAquaMarine', 'Maroon', 'El Salvador', 'Not Select', 'harvey.huels@example.com', '925.417.4328x792', 'Marlon Kessler III', '75462 Moen Villages\nEast Estellefurt, NJ 72506-5076', 'Whitneystad', '2020-11-05 01:44:51', 'Velit numquam quasi sint voluptates dolores blanditiis nobis. Velit earum placeat facilis. Pariatur rem reprehenderit non unde laboriosam ipsum facilis.', 'Free'),
(135, 0, '1971-04-03', 'New Timmothyton', 'ForestGreen', 'Lime', 'Sri Lanka', 'Not Select', 'tdickinson@example.com', '(634)708-4438', 'Mrs. Nikita Jerde III', '021 Streich Mountains\nKiehnmouth, CO 17446', 'North Emmanuelland', '1977-02-22 11:06:58', 'Blanditiis fugiat neque eos. Et maxime fugiat id commodi exercitationem illum. Occaecati provident qui fugiat totam.', 'Gold'),
(136, 1, '2021-09-16', 'East Patricia', 'OliveDrab', 'MediumAquaMarine', 'Dominican Republic', 'Male', 'philip33@example.org', '06823174075', 'Prof. Baby Schimmel Sr.', '39710 Geovanny Island\nSouth Monaview, IA 17738-4959', 'Citlallistad', '1993-04-13 05:47:33', 'Ut est magnam neque dolorem sint. Ad omnis deleniti adipisci magni qui quo.', 'Free'),
(137, 2, '1992-05-05', 'East Maximus', 'DarkSeaGreen', 'SaddleBrown', 'Finland', 'Not Select', 'iweber@example.net', '1-609-778-3007x59902', 'Dante Lindgren', '42685 Schneider Plains Apt. 101\nLake Hilda, MD 18197', 'Wisokymouth', '1985-10-23 18:46:31', 'Et quam reprehenderit cum eos quia pariatur. Alias et sunt voluptatem voluptatem excepturi. Voluptas aut accusantium et voluptatem. Dolores sed est impedit aperiam sed qui voluptas.', 'Gold'),
(138, 0, '2009-12-06', 'Zulauffurt', 'Aqua', 'AliceBlue', 'Liberia', 'Female', 'rutherford.gregorio@example.net', '1-146-220-6000', 'Imogene Daniel', '627 Gorczany Locks\nGeraldineborough, KY 80684', 'Port Kristy', '2013-11-24 05:39:47', 'Vero est deleniti quaerat illum. Quia reiciendis labore dolores distinctio magnam. Modi fugiat suscipit nihil sapiente.', 'Gold'),
(139, 2, '1999-05-06', 'Schaeferberg', 'GoldenRod', 'LightSkyBlue', 'Heard Island and McDonald Islands', 'Female', 'hester.schimmel@example.com', '313.832.1295x987', 'Mrs. Ellen Grimes', '46533 Satterfield Island\nRolfsonland, HI 89941', 'Juanitaburgh', '1995-02-01 00:11:18', 'Veritatis deserunt ut quia dolorem. Autem id fuga rerum iure sint quae architecto. Similique porro iste repudiandae voluptas.', 'Gold'),
(140, 1, '1979-11-25', 'Lynnchester', 'MediumPurple', 'Teal', 'Mali', 'Male', 'sister.franecki@example.net', '579-634-5956', 'Pearline Kovacek', '758 Stiedemann Forges\nSouth Saigeberg, CO 47009-1002', 'Townehaven', '1991-01-25 22:40:48', 'Provident ipsa dolorem animi distinctio dicta ut. In rerum est nihil quae sit excepturi. Quidem rerum voluptatem esse labore recusandae maxime laudantium. Velit at possimus excepturi molestias impedit.', 'Gold'),
(141, 1, '1993-03-29', 'South Karianneshire', 'MediumBlue', 'GoldenRod', 'Sudan', 'Not Select', 'myrna46@example.com', '1-648-409-5809x194', 'Clint Cruickshank', '979 Emard Port Suite 058\nSchroederhaven, VA 98232-0430', 'New Delphiaburgh', '2019-10-24 21:58:07', 'Iusto consequatur in error cupiditate natus et architecto corrupti. Delectus voluptatem quia autem hic doloribus. Sit iure ut maxime.', 'Gold'),
(142, 0, '2008-12-30', 'Emmiefort', 'DimGray', 'Sienna', 'Zambia', 'Not Select', 'lyda36@example.org', '025-682-4278x088', 'Antoinette Weimann', '78536 Hermiston Bridge\nCandacemouth, RI 65773-4627', 'Beertown', '2006-09-03 01:43:14', 'Fugiat alias quia quod et enim dolorem provident. Culpa magni sequi cupiditate cumque corporis. Qui facilis harum excepturi.', 'Gold'),
(143, 2, '2008-07-16', 'New Maximillianstad', 'DarkMagenta', 'White', 'Japan', 'Female', 'connelly.weldon@example.com', '1-992-834-0502x554', 'Ashlynn Fahey', '5387 Sid Tunnel\nCharityside, NM 45253', 'Edytheberg', '1996-04-27 23:42:32', 'Ex omnis qui velit incidunt veniam eum doloribus. Aut vero qui cumque assumenda. Et ab et soluta atque excepturi.', 'Gold'),
(144, 2, '1992-10-29', 'New Edd', 'SlateGray', 'DarkGray', 'Kazakhstan', 'Female', 'margot.rempel@example.net', '641.398.8036x3402', 'Marlin Stiedemann', '90451 O\'Hara Plains Suite 655\nPort Garrett, NM 11726-7293', 'Wisokyton', '1983-09-24 16:46:35', 'Iusto numquam et voluptatem officia alias ex ut. Ducimus quidem minus suscipit voluptatem rerum nihil.', 'Gold'),
(145, 1, '1974-10-16', 'Ullrichshire', 'HoneyDew', 'MediumSlateBlue', 'Bolivia', 'Male', 'heber.crist@example.com', '(642)123-3615x106', 'Billy Balistreri DDS', '76570 Marquardt Field Apt. 788\nNew Vicenteton, AK 51038-4996', 'Port Luz', '2020-06-29 20:06:19', 'Dignissimos dolores minima labore aliquam voluptates. Quis minus commodi voluptatem dolorem fugit quidem beatae. Et sed repellat numquam dicta aspernatur dolor aliquid.', 'Free'),
(146, 0, '1980-03-21', 'Port Dimitri', 'AntiqueWhite', 'Brown', 'Liberia', 'Male', 'selena.heaney@example.net', '(197)717-6240', 'Chauncey Ebert Jr.', '83596 Arden Port Apt. 695\nSouth Ernaview, IN 45010-4291', 'Beckerchester', '1984-11-06 22:46:38', 'Et sunt natus et tempore quibusdam laudantium sunt. Quam et accusamus voluptatem eos quasi. Consequatur rem quisquam eos enim eaque.', 'Free'),
(147, 1, '2021-02-01', 'East Melvinastad', 'DarkGreen', 'Darkorange', 'Netherlands', 'Not Select', 'bulah97@example.com', '1-368-877-6664x52137', 'Adolphus Dickinson', '64371 Myrl Islands\nDonnellystad, MN 68579', 'Wintheiserbury', '2002-03-01 15:49:25', 'Voluptate nam a adipisci id. Porro voluptatibus ipsa corrupti illum voluptatem hic praesentium. Optio dolor aut earum ad.', 'Gold'),
(148, 1, '1978-05-28', 'North Misael', 'PeachPuff', 'DeepSkyBlue', 'China', 'Not Select', 'kautzer.elton@example.org', '114-636-2786', 'Terry Hilll', '52151 Richard Divide Apt. 918\nGiovannystad, KY 31690-0158', 'Lake Stephany', '2000-12-29 04:04:12', 'Omnis expedita et ullam nesciunt repellat. Rem aut reprehenderit dolores eos ut delectus error. Ipsam possimus placeat quo expedita dolorem omnis. Eaque enim ipsa voluptas molestiae accusantium provident. Rerum tenetur eum dolor perspiciatis aut.', 'Gold'),
(149, 1, '2008-02-08', 'Dameonstad', 'FloralWhite', 'HotPink', 'Mauritania', 'Female', 'orie.paucek@example.com', '1-732-947-3454x18989', 'Selmer Lebsack', '32534 Grady Knolls Apt. 779\nMoenberg, ID 59464', 'East Patiencefurt', '2004-12-22 20:38:30', 'Sapiente explicabo quidem molestias modi saepe est quidem. Nostrum minus sapiente labore quia sit eos et. Nulla doloremque esse ea omnis eum alias nesciunt.', 'Premium'),
(150, 2, '1996-10-06', 'Bobbyburgh', 'HoneyDew', 'SkyBlue', 'Saudi Arabia', 'Female', 'schaefer.mckayla@example.org', '(281)349-4916x983', 'Augustus Waters', '069 Turcotte Lights\nSouth Kieran, AK 21334', 'Albaville', '2004-08-01 09:18:06', 'Ipsa eaque nesciunt libero qui aut nostrum eos. Minima eaque possimus aliquid est. Fuga praesentium voluptatem impedit corrupti minus.', 'Free'),
(151, 2, '2017-11-14', 'West Alyceberg', 'PapayaWhip', 'PaleTurquoise', 'Norway', 'Not Select', 'djenkins@example.com', '752.724.6291x9261', 'Estevan Lueilwitz III', '01787 Gerardo Circle Apt. 528\nNienowmouth, ND 54636-3364', 'North Aric', '2014-05-30 19:28:35', 'Eaque distinctio deserunt vel rerum. In ipsa perspiciatis reprehenderit architecto facilis. Natus aliquid incidunt et saepe numquam.', 'Gold'),
(152, 2, '2011-07-29', 'North Tessiefort', 'LawnGreen', 'Darkorange', 'Timor-Leste', 'Male', 'mledner@example.com', '+75(9)6097113851', 'Naomi Hodkiewicz', '33367 Conroy Mill\nEast Wymanside, MT 37947', 'Pfannerstillmouth', '1979-12-02 06:49:09', 'Consectetur voluptate dolor est voluptatem. Eius vero voluptas doloribus id et quis qui labore. Saepe tempore est accusantium doloremque tenetur ut.', 'Silver'),
(153, 1, '1989-11-10', 'South Emiliemouth', 'SpringGreen', 'LightGray', 'Suriname', 'Not Select', 'shaniya78@example.org', '+90(7)4755697579', 'Miss Kayla Swaniawski DVM', '7909 Rickie Trail Apt. 587\nNorth Sandrastad, CT 73568-6610', 'Port Lavonne', '2018-09-01 07:35:36', 'Fugit minima autem sit dolor ad distinctio. Nobis qui sed quia hic et. Laudantium ducimus est sit ut officia. Vel dicta omnis ut repudiandae sint cupiditate ut.', 'Gold'),
(154, 1, '1971-09-02', 'North Johnathonmouth', 'DarkOrchid', 'HoneyDew', 'Montserrat', 'Female', 'white.lolita@example.net', '+69(3)2708006886', 'Mr. Monty Orn', '20115 Green Vista Suite 774\nLake Dante, AR 44168-0203', 'Gutmannchester', '2016-01-02 07:59:35', 'Similique ab repellat voluptatibus dolore. Consequuntur nam facere ut ipsam. Necessitatibus et ut voluptatem molestiae voluptatem sit sit iusto. Impedit veritatis magnam aut dolores ipsam excepturi.', 'Gold'),
(155, 0, '1972-03-31', 'Christiansenside', 'LawnGreen', 'PaleGreen', 'Martinique', 'Not Select', 'gilda98@example.org', '340.019.8224x46622', 'Barry Green', '6755 Oscar Vista\nThompsonport, NY 07175-9885', 'Lake Jacynthechester', '2014-01-26 12:39:39', 'Iusto aut sit possimus deleniti excepturi velit. Aut pariatur doloremque quia dicta delectus sed voluptatem voluptate. Fuga nemo error officiis voluptatem nesciunt officiis quae. Ut enim laboriosam expedita et.', 'Gold'),
(156, 2, '1992-01-15', 'Port Willisside', 'MediumPurple', 'AliceBlue', 'Georgia', 'Female', 'giovanna.schoen@example.com', '(819)281-6131x935', 'Ernestina Leannon', '097 Abbie Plaza\nWest Kale, OR 16573', 'Port Coralie', '1977-03-07 19:53:25', 'Inventore dolore voluptatibus dolore architecto odit impedit. Voluptas illo ex architecto. Incidunt officiis est quia fuga. Qui eaque laboriosam velit nam earum est quis.', 'Premium'),
(157, 2, '2020-05-01', 'East Chanellemouth', 'Khaki', 'LightBlue', 'Congo', 'Female', 'fkerluke@example.com', '(024)056-9496x4233', 'Dr. Ardith Leuschke PhD', '8428 Ebert Centers\nLysanneside, OH 63167', 'Lynchshire', '1981-05-29 08:08:13', 'Non voluptatem facilis voluptatem ea facilis. Explicabo id aut autem rerum earum voluptatum incidunt eos. Voluptatem illum omnis ea similique dolorem repellendus amet voluptate.', 'Silver'),
(158, 2, '2003-07-08', 'Swiftburgh', 'Lime', 'SeaGreen', 'Qatar', 'Male', 'sbarton@example.net', '08364427212', 'Mrs. Mina Howe', '557 Dixie Inlet\nShanahanfurt, AR 64123', 'South Monabury', '2011-10-27 19:33:20', 'Ut quas qui eaque repellat est. Qui temporibus accusantium vitae vel. Dignissimos omnis et quos quia qui illum aliquam. Omnis dolorum modi voluptatem quae eveniet ut.', 'Free'),
(159, 2, '2018-05-22', 'West Carlos', 'MistyRose', 'Ivory', 'Sudan', 'Male', 'sberge@example.net', '06626487230', 'Bianka Moore', '69375 Kreiger Mission\nNew Aliviaberg, UT 71626', 'Port Koby', '2009-02-22 03:03:46', 'Quia quis architecto nesciunt dignissimos asperiores laborum. Et similique eveniet facilis totam rerum rem accusamus enim. Id sint est dignissimos.', 'Silver'),
(160, 1, '1998-07-10', 'Port Marty', 'Brown', 'DeepPink', 'Japan', 'Female', 'julien47@example.org', '835.970.8781x8163', 'Tabitha Williamson', '8499 Mack Bypass\nHarryfurt, CA 03967', 'Runolfsdottirland', '2015-04-12 18:17:21', 'Iure sapiente consequuntur id recusandae ut. Quis eos impedit non ut sunt rerum.', 'Gold'),
(161, 1, '1994-09-10', 'Russelfort', 'LightGreen', 'DarkBlue', 'Zimbabwe', 'Male', 'vgaylord@example.org', '490.877.5084', 'Wanda Streich', '2323 McGlynn Summit Suite 206\nEleanoraborough, MD 59491', 'Port Raheem', '1977-03-10 01:16:31', 'Necessitatibus temporibus iusto a enim. Quod laboriosam quibusdam est minima sed nobis quia. Laborum asperiores fugiat sunt et placeat. At enim provident ea fugiat. Est quae pariatur iure et ea reiciendis ut laboriosam.', 'Free'),
(162, 0, '1972-01-09', 'Port Lavinia', 'Pink', 'Green', 'Kuwait', 'Male', 'albina.macejkovic@example.com', '1-943-697-7479', 'Prof. Kiana Hettinger II', '13011 Nicola Hill Suite 745\nWest Davionmouth, AZ 99313', 'Estebanstad', '1970-01-26 10:05:04', 'Maiores est itaque excepturi quam consectetur. Aut voluptate eos dolorem est eius nesciunt. Tempora voluptas fuga ipsam et fugit voluptatem provident dicta.', 'Premium'),
(163, 1, '2019-08-25', 'South Edna', 'LightGray', 'Beige', 'Albania', 'Male', 'emard.felicita@example.com', '971.925.6892x46223', 'Prof. Tyrique Nader PhD', '267 Bruen Underpass Suite 670\nSouth Enoch, AR 26328-2327', 'Kshlerinshire', '1990-03-19 21:29:25', 'Saepe impedit est et aut iste est nihil. Veritatis alias sint ut earum laboriosam. Impedit et quae molestiae illum voluptatibus culpa necessitatibus. Labore repellat beatae quo accusantium. Eum non voluptatum quae.', 'Gold'),
(164, 1, '2020-11-24', 'North Margotborough', 'MediumSeaGreen', 'Blue', 'Austria', 'Female', 'jwalker@example.org', '898.874.8682', 'Ignatius Gibson', '707 Gleason Squares Suite 672\nPort Marcos, LA 51041', 'Lake Adriannaborough', '2021-11-15 04:00:04', 'Porro pariatur aspernatur magnam sint. Accusantium sunt sit reiciendis architecto dolorem sed. Facere eligendi voluptate consequatur eveniet quia architecto sed. Et eos doloremque labore impedit suscipit beatae aut.', 'Silver'),
(165, 0, '2002-03-13', 'North Geraldine', 'SandyBrown', 'Chartreuse', 'Turkmenistan', 'Male', 'therese90@example.com', '742.950.0617', 'Myrtice Feest', '437 Flatley Lakes Suite 788\nZettaside, HI 76681-6752', 'Zionstad', '2017-02-28 10:20:28', 'Repellat est rerum ut doloribus quasi et provident. Labore perferendis iusto aut ex earum expedita. Ipsum nemo ut quidem et voluptas voluptas quidem. Commodi sapiente consectetur beatae deleniti et odit.', 'Free'),
(166, 2, '2011-12-03', 'New Lennieberg', 'DimGray', 'Tomato', 'India', 'Male', 'ullrich.april@example.com', '095.611.3956', 'Marty Pouros', '30626 Savion Views Apt. 525\nDelfinabury, TX 82025-3239', 'South Patrickside', '1986-01-10 19:11:41', 'Nobis libero error qui ea alias reprehenderit aut. Quas porro voluptas voluptatibus quia voluptatem quibusdam. Natus dolorem et quia vel sunt quia atque eius.', 'Silver'),
(167, 2, '1985-01-23', 'Marleeton', 'Gold', 'LightSalmon', 'Jamaica', 'Not Select', 'estel09@example.org', '(358)614-6654', 'Mr. Demarcus Emard III', '0712 Bogan Plains\nGrahamton, MS 22233-2287', 'West Crystelland', '2015-08-27 00:36:26', 'Earum quasi tenetur sunt enim aut consequuntur et atque. Natus dolores et quia qui accusantium. Ducimus tempore expedita nihil neque.', 'Free'),
(168, 1, '1983-10-10', 'East Alizaside', 'LightGoldenRodYellow', 'PapayaWhip', 'Georgia', 'Female', 'carleton61@example.com', '600-027-4107', 'Sabrina Dare', '73062 Vivianne Brooks\nPort Leonard, PA 39589-1603', 'South Delphiashire', '2014-04-15 06:32:39', 'Ut nulla fugit illum aperiam aperiam qui accusantium id. Reiciendis beatae expedita accusamus sed maiores. Quis tempora sint est quia natus dolorum quis. Aut commodi architecto quisquam voluptatem provident facilis.', 'Silver'),
(169, 0, '1999-07-21', 'Lake Roxane', 'LavenderBlush', 'BurlyWood', 'Latvia', 'Female', 'amely.adams@example.net', '(795)932-7522', 'Carlie Murazik', '75682 Hills Junctions\nStarkton, MD 65371-7936', 'New Dianna', '2006-10-20 00:30:03', 'Non tempore similique et nihil quas aliquam. Possimus ipsum similique ut. Voluptas aut pariatur aut atque qui velit occaecati.', 'Gold'),
(170, 2, '2013-09-12', 'West Joeyfort', 'DarkSlateGray', 'RosyBrown', 'Solomon Islands', 'Female', 'scormier@example.com', '1-217-288-0965x931', 'Mason Jaskolski DDS', '12220 Jimmy Brook Apt. 387\nHilpertton, MI 92777-1458', 'Lake Beulahchester', '2022-03-17 11:25:53', 'Est quibusdam iste eum veritatis dolorum dicta iusto. Eveniet dolor et natus sed. Nihil vel dolorem consequatur excepturi maiores incidunt.', 'Free'),
(171, 1, '1995-05-23', 'Pagacshire', 'FireBrick', 'SpringGreen', 'Sri Lanka', 'Female', 'lucy01@example.org', '05824440743', 'Zola Kuvalis', '80874 Swift Turnpike Apt. 221\nSwifttown, SC 23876', 'East Rachelside', '1972-10-30 00:22:37', 'Consequatur autem dolores accusamus quam ipsum debitis voluptate id. Ea quod qui et ratione perspiciatis et. Omnis aut qui cupiditate incidunt.', 'Gold'),
(172, 0, '1993-09-09', 'North Oralview', 'MediumBlue', 'Brown', 'Jersey', 'Male', 'mitchell.smitham@example.org', '490.343.8410x91409', 'Demetris Beatty', '64595 Naomi Mount Apt. 303\nPort Clair, AL 57815', 'Susanaview', '2018-07-15 16:54:40', 'Sed dicta praesentium facilis ea delectus similique voluptatem voluptatibus. Eligendi quo voluptatem dignissimos. Facilis repudiandae magnam cumque non tenetur facere.', 'Premium'),
(173, 2, '1999-04-21', 'Lake Fletcher', 'DarkSlateBlue', 'DarkSlateGray', 'Greece', 'Female', 'jazmyn93@example.com', '545.074.0765', 'Destiny Hauck', '1740 Hope Mount\nLake Baron, ND 73150-3964', 'North Alexysbury', '2007-05-07 07:46:53', 'Repudiandae aliquid eius ullam voluptatem voluptatem. Mollitia et omnis nisi aut laboriosam. Consectetur quod quis qui ipsam et.', 'Free'),
(174, 1, '2006-02-28', 'New Crawford', 'Ivory', 'Gray', 'Sao Tome and Principe', 'Female', 'dennis.farrell@example.net', '160.929.4269', 'Dr. Damien Hagenes MD', '18020 Klocko Wells\nLake Josue, AR 35100', 'Dickensberg', '2002-04-12 08:15:31', 'Minus fugit id nisi. Officia minus rerum a et. Et ut sit cumque et quaerat ea. Reprehenderit eos qui et.', 'Free'),
(175, 2, '1989-09-13', 'Jacobshaven', 'Red', 'BlueViolet', 'Northern Mariana Islands', 'Not Select', 'mathias85@example.com', '1-177-036-9289', 'Dr. Colin Lynch IV', '521 Tierra Land\nMcKenzieberg, OR 45993', 'Henryville', '1983-02-15 03:58:06', 'Rem assumenda voluptate consequatur ab quisquam soluta. Ipsa iusto recusandae dolor praesentium libero qui eaque ab. Omnis hic voluptatem et delectus debitis et. Dolor commodi nam nisi reiciendis ut placeat.', 'Silver'),
(176, 1, '2010-09-09', 'Dooleybury', 'Cornsilk', 'Gainsboro', 'Cook Islands', 'Female', 'abbott.jimmie@example.org', '1-460-943-0980x48078', 'Rhoda Auer', '94153 Bayer Island Apt. 830\nRodrickborough, KS 58373', 'Mertzville', '1993-03-09 07:51:12', 'Et consequuntur animi incidunt atque fugiat non. Inventore laborum tempore blanditiis ipsa sed cumque ullam. Et et illum repudiandae nisi.', 'Silver'),
(177, 0, '2005-09-08', 'West Anjali', 'Lavender', 'PaleGoldenRod', 'Nauru', 'Male', 'tatyana.koelpin@example.org', '890-344-5424x7964', 'Helga Schaefer', '18443 Dooley Pike Apt. 313\nMartachester, ID 64704-8052', 'Susanfort', '1978-06-14 23:25:48', 'Quisquam veritatis eos minima perferendis pariatur aut quas. Omnis cupiditate et rerum optio corrupti rerum. Ipsum aliquam doloremque libero et. Voluptas iusto iusto quia minus dolorem.', 'Premium'),
(178, 2, '2007-03-21', 'East Humbertohaven', 'Cyan', 'Tan', 'Zambia', 'Not Select', 'cummings.vincenzo@example.com', '1-778-321-3271x0209', 'Icie Ortiz', '7889 Ramon Pines\nSchultzberg, MI 33601', 'Lake Martine', '2017-03-12 23:14:18', 'Atque modi amet atque maiores sunt. Est vel voluptatem eaque quod molestiae iusto. Placeat nihil et asperiores optio dolor nulla. Omnis ea dolore est maxime quia omnis.', 'Gold'),
(179, 1, '2018-07-08', 'South Garrettshire', 'LightGreen', 'BlanchedAlmond', 'Serbia', 'Female', 'fadel.zora@example.org', '1-366-682-4495x7787', 'Ford Weimann', '82533 Green Groves\nKlockoview, RI 29885-5496', 'Javontemouth', '1976-02-04 07:15:20', 'Optio vel quaerat tempore non expedita eius maxime culpa. Nobis adipisci temporibus et unde. Sit a dicta rem et. Vel praesentium animi explicabo dolores.', 'Gold'),
(180, 2, '2006-08-02', 'Lake Genesisfort', 'Crimson', 'Linen', 'Montserrat', 'Not Select', 'eldridge77@example.com', '497.430.9946', 'Giovanny Runolfsson', '1629 Leffler Path Apt. 459\nPort Elda, WV 87224', 'New Donald', '2016-02-25 23:09:43', 'Doloribus quis aspernatur sunt odio ullam similique qui. Saepe dolore rerum quae aliquid quia. Voluptates nemo in in fuga dolorum magni. Maxime nemo voluptatem enim eveniet qui.', 'Free'),
(181, 2, '2010-11-17', 'Port Chloeshire', 'DimGray', 'RosyBrown', 'Mauritius', 'Not Select', 'veum.deja@example.net', '02812390482', 'Barbara Cummings', '40666 Littel Station Suite 964\nPort Billieside, AK 33791-2027', 'Gardnerfort', '2019-09-24 21:02:01', 'Et reprehenderit enim fuga atque placeat possimus. Magni saepe est quaerat earum. Nesciunt culpa quidem accusamus ab facere ipsum voluptas. Animi et quas autem voluptatem esse minus.', 'Free'),
(182, 1, '1994-08-10', 'Tillmanmouth', 'DarkSalmon', 'Green', 'Madagascar', 'Not Select', 'qokuneva@example.net', '1-430-671-4146', 'Mrs. Freda Sanford DVM', '84110 Dortha Knoll\nPort Rosalyn, FL 21463-6931', 'Lorichester', '1997-03-05 11:19:30', 'Dicta magnam exercitationem numquam laborum et modi. Eum tempora architecto vero recusandae debitis vel quia. Distinctio itaque iure natus vel quibusdam aut laudantium velit.', 'Premium'),
(183, 1, '1998-11-29', 'Murazikville', 'Indigo ', 'Crimson', 'Cuba', 'Not Select', 'volkman.bernita@example.com', '07116841060', 'Liam Wilkinson', '33876 Mikayla Islands\nEast Luciano, NH 25404-8323', 'West Doyle', '1999-04-10 23:42:31', 'Consequuntur deserunt nostrum beatae. Et molestiae sint sint recusandae autem quisquam voluptatem. Sunt deserunt dolores id molestiae ducimus et fuga quis. Sed ut aut excepturi nesciunt et vel est.', 'Gold'),
(184, 1, '1990-03-05', 'Malindafurt', 'RosyBrown', 'BurlyWood', 'Saint Kitts and Nevis', 'Not Select', 'howe.margaret@example.org', '+26(3)3638513361', 'Gerson Herman', '639 Bianka Summit Apt. 713\nMakennaside, WV 50055', 'New Amelieland', '2015-10-19 12:21:56', 'Sint incidunt quasi exercitationem mollitia veniam illo sed. Voluptatum eum totam quo. Quidem consequatur qui vel nesciunt omnis aliquid. Sapiente tenetur repellendus omnis laborum consequuntur nihil.', 'Silver'),
(185, 0, '1995-06-22', 'Mavishaven', 'RosyBrown', 'Moccasin', 'Norway', 'Not Select', 'hane.lee@example.net', '1-686-045-3485', 'Aric Hyatt', '827 Schultz Parkways Apt. 300\nPort Roscoe, IL 09561-2915', 'North Dax', '1975-11-26 17:45:15', 'Quas enim non in voluptatem. Est veniam recusandae aut debitis. Excepturi sapiente perferendis enim illum.', 'Free'),
(186, 1, '1979-07-18', 'Thompsonmouth', 'SaddleBrown', 'OldLace', 'San Marino', 'Male', 'terry.nicholaus@example.net', '(453)557-6666x405', 'Esteban Eichmann', '22520 Wiza Park\nEffieville, MD 07905', 'Stephaniashire', '1977-04-04 15:09:40', 'Excepturi qui eum ut dolore dignissimos quam. Voluptates iusto eum fuga accusantium numquam quidem. Est voluptates aut molestiae magni omnis laudantium. In ipsa et maxime sint odio fugiat.', 'Premium'),
(187, 0, '1987-08-02', 'North Faymouth', 'LightYellow', 'MediumAquaMarine', 'Andorra', 'Not Select', 'rparisian@example.com', '1-291-458-1559x614', 'Onie Stroman', '5223 Valentine Gateway Suite 921\nLake Daisy, TX 82944', 'Friesenhaven', '2012-01-18 23:33:23', 'Quis dicta earum dolorum. Nulla excepturi enim iusto dolore est. Ut nam modi enim iusto et consequatur totam. Reprehenderit autem sequi nemo illum sint provident sunt.', 'Premium'),
(188, 0, '1992-04-18', 'Port Sigurd', 'Tan', 'Olive', 'Tanzania', 'Not Select', 'bud.abernathy@example.com', '290.978.2504', 'Alisha Flatley', '191 Cartwright Station Apt. 988\nMcDermottstad, NC 16183', 'East Carley', '2017-10-08 05:39:50', 'Possimus quia maxime aut eius voluptatum qui. Placeat sequi delectus possimus hic quod. Voluptate quo similique expedita nemo animi velit quo. Facere qui recusandae et suscipit numquam soluta occaecati.', 'Free'),
(189, 1, '1976-03-25', 'East Yasmeenmouth', 'LightSkyBlue', 'Beige', 'United States of America', 'Male', 'corwin.shawna@example.com', '575-631-5332', 'Sarina Runte', '7287 Leanne Drives Apt. 876\nMoenborough, ND 56293-0655', 'Abbieborough', '2013-08-14 23:16:47', 'Minima quos magni et illo sint error vitae. Nesciunt harum ut et est qui nam ex asperiores. Voluptatem sequi consequuntur aut quis.', 'Silver'),
(190, 2, '1989-06-27', 'Torphyport', 'GreenYellow', 'DarkSlateGray', 'Comoros', 'Female', 'uhessel@example.com', '+52(9)6105416551', 'Prof. Twila Emard', '4735 Leann Alley Suite 639\nStokeschester, AZ 66254', 'Port Kevenstad', '1998-01-29 20:28:16', 'Ut itaque possimus consequatur quia porro. Sequi neque sunt beatae veritatis et est nam. Voluptatem sit aut ab sequi sapiente. Error veniam qui et voluptatum quaerat.', 'Premium'),
(191, 0, '2005-04-18', 'Port Toney', 'Brown', 'MediumAquaMarine', 'French Southern Territories', 'Male', 'wuckert.jensen@example.net', '(544)409-6777x4761', 'Quinton Stoltenberg V', '484 Maximo Lakes\nNew Helen, TN 62821-1785', 'Zboncakfort', '2000-04-05 23:48:13', 'In quo quam illo qui unde. Ab et fugiat dicta exercitationem fugit omnis nam molestiae. Aut aut ea eos dolores.', 'Premium'),
(192, 1, '1973-10-31', 'Pagachaven', 'Salmon', 'Gold', 'Portugal', 'Female', 'pdenesik@example.net', '019.948.4434x88790', 'Dr. Rosetta Monahan PhD', '64033 Medhurst Junction Suite 186\nNorth Gladyce, NY 14427', 'South Erictown', '1978-06-21 09:06:40', 'Voluptatem repellat accusantium omnis sit qui aliquid maxime. Quaerat perspiciatis non eius quasi explicabo id similique. Repudiandae a non officia veritatis sapiente ut eaque.', 'Silver'),
(193, 1, '1981-11-18', 'Strackeborough', 'LightGreen', 'DarkRed', 'Isle of Man', 'Female', 'vincenza.collier@example.org', '059.940.2932x933', 'Frank Kiehn', '665 Rosina Mills\nJastville, HI 65452', 'East Duaneton', '2000-04-02 15:16:07', 'Non ratione consectetur recusandae odit et omnis. Dolor eaque est velit excepturi magni enim itaque excepturi. Aut in id sit ut nam. Sed fugiat vel nam dolores.', 'Silver'),
(194, 2, '1996-01-31', 'Haleymouth', 'SeaGreen', 'DodgerBlue', 'Croatia', 'Female', 'ikoch@example.net', '+14(5)6722756224', 'Mr. Jaden Kilback MD', '410 Jayce Camp\nGuiseppetown, AK 78010-2013', 'Lake Emile', '1979-09-29 21:16:17', 'Molestias illo a aut sit laborum aut. Neque molestiae et hic perferendis. Incidunt perspiciatis est consequatur rerum ut nisi. Cupiditate libero dolor eum cum nam.', 'Free'),
(195, 2, '1981-08-07', 'Lake Iciebury', 'Cornsilk', 'DarkSalmon', 'Tanzania', 'Female', 'wisozk.luella@example.org', '(987)261-6753', 'Lois Wolf', '688 Zemlak Manor Suite 095\nPort Allyside, GA 82642-7939', 'New Veda', '2021-06-10 21:30:30', 'Quibusdam et molestias debitis vel alias itaque. Dolore nostrum dolorum harum sint dolorum. Non est qui nobis magnam cupiditate facilis alias dolores. Quaerat expedita similique et quia qui. Cupiditate totam autem quis et aspernatur a magni.', 'Free'),
(196, 0, '1993-12-02', 'West Princess', 'LightBlue', 'Wheat', 'Belgium', 'Male', 'trantow.jamar@example.net', '1-252-656-9523x7060', 'Sydnee Konopelski III', '33492 Amir Park Suite 839\nCarolburgh, KY 76902', 'Nasirton', '2010-03-24 16:12:45', 'Consequatur voluptatem qui dicta quidem eum. A vero quos voluptates voluptate voluptates. Provident voluptatem fugit voluptatem sint labore aliquid voluptates sit. Quo quis corrupti commodi dicta.', 'Gold'),
(197, 2, '1998-05-05', 'Karibury', 'Maroon', 'WhiteSmoke', 'Micronesia', 'Male', 'cpowlowski@example.com', '326-848-4719x379', 'Dr. Wilbert Witting', '87790 Von Locks Apt. 379\nSouth Phyllisfort, MA 41072', 'West Brooklyn', '1986-04-26 12:32:25', 'Nesciunt accusantium quaerat rem qui reprehenderit qui. Aliquid cum est incidunt. Consequuntur repellat explicabo molestiae at est dolores.', 'Silver'),
(198, 2, '1995-08-20', 'Kutchview', 'Plum', 'OldLace', 'Albania', 'Female', 'mitchell.andres@example.net', '649-257-6316x331', 'Wilfrid Abshire V', '690 Vinnie Spurs\nDickinsonberg, SC 42488-7002', 'Lake Ricardo', '1999-01-08 06:51:42', 'Qui minus vitae eligendi voluptates corporis possimus minus. Maxime sed amet nam atque quas earum repellat. Quisquam nesciunt ut dolor hic quos.', 'Silver'),
(199, 0, '2003-02-25', 'Port Valentinaborough', 'YellowGreen', 'Orchid', 'Poland', 'Female', 'keebler.luther@example.com', '765-246-8272x266', 'Lauriane Block', '0427 Mueller Island\nSouth Bruceview, HI 67999', 'Lake Arleneberg', '2013-08-21 13:54:01', 'Omnis a harum odit ad omnis officiis corrupti. Voluptate reiciendis cum praesentium suscipit itaque. Nam voluptates recusandae totam quia. Nesciunt quibusdam quis quaerat ut quos molestiae.', 'Gold'),
(200, 1, '1970-09-20', 'Lake Vince', 'LightSkyBlue', 'LightSeaGreen', 'Saint Kitts and Nevis', 'Female', 'roberts.lupe@example.com', '1-919-693-2943x15855', 'Earnest Cassin Jr.', '178 Jabari Roads\nBerniceland, PA 16359', 'Jayceetown', '1973-05-23 04:02:59', 'Earum id aut molestiae non hic rerum tenetur accusantium. Odit aut provident consectetur quod architecto dolorem mollitia.', 'Free'),
(201, 0, '1995-08-05', 'New Ottiliebury', 'MediumSeaGreen', 'PowderBlue', 'Reunion', 'Not Select', 'america78@example.org', '1-586-112-4702x3591', 'Waylon Mayer', '172 Alford Island Apt. 550\nVirginiaview, IN 24633-2642', 'North Adelleland', '2000-10-20 20:34:24', 'Sint modi quia eos est. Omnis illum quia rerum esse reprehenderit sint distinctio. Et fuga iste consequatur ea eos ut ullam voluptatem.', 'Free'),
(202, 0, '2019-08-28', 'Port Brennon', 'Crimson', 'Ivory', 'Svalbard & Jan Mayen Islands', 'Female', 'kupton@example.net', '03537075539', 'Danyka Ritchie', '8983 Tremblay Corners Apt. 988\nEast Nikita, HI 79388-2435', 'North Connor', '1973-03-10 11:57:34', 'Debitis ut quasi ratione rerum id. Est ab aut ut neque nisi. Esse ea quam reprehenderit.', 'Silver'),
(203, 2, '1984-05-31', 'Douglasmouth', 'CadetBlue', 'LawnGreen', 'Bangladesh', 'Male', 'bemmerich@example.org', '558.021.3872', 'Winifred McCullough I', '32305 Linwood Way\nBetteborough, KS 20608', 'Lake Twila', '1995-12-09 04:53:51', 'Consectetur quas laborum modi dolor minima debitis porro. Nihil dolores laborum eveniet illo est vel est voluptas. Laboriosam explicabo dolore est aut ullam.', 'Premium'),
(204, 1, '2007-08-27', 'West Keenanchester', 'DimGrey', 'Azure', 'Saint Barthelemy', 'Male', 'verda.schamberger@example.com', '(401)509-9979x6009', 'Guiseppe Sawayn', '48097 Hoeger Parkways Suite 480\nHuelsshire, OK 71548-5529', 'Aufderhartown', '2008-09-15 04:03:54', 'Dolorum perspiciatis voluptate eum eligendi. A aut voluptas ipsum ut magnam minima et. Id debitis eos ipsa explicabo rerum nesciunt consequatur. Id veritatis quo iste voluptate nihil.', 'Premium'),
(205, 0, '2007-07-31', 'South Moses', 'Blue', 'LightGreen', 'Bangladesh', 'Female', 'd\'amore.donnell@example.net', '796-912-2067x1051', 'Jason Hudson', '61792 Gutmann Mission\nEast Briana, DE 09984', 'Humbertoburgh', '2001-12-07 18:14:44', 'Soluta quam qui sed ut quam error expedita. Nesciunt earum et inventore aliquid. Odio sint vel quia molestiae laboriosam. Ut dolorem quis voluptate quam qui. Unde eum velit necessitatibus et ipsa et ipsum.', 'Free'),
(206, 1, '2015-01-04', 'Port Richieview', 'MediumTurquoise', 'AliceBlue', 'Eritrea', 'Male', 'fahey.edgardo@example.org', '658.735.2231x42559', 'Kenneth Lynch', '1447 Dicki Ranch Apt. 217\nMackside, MO 68354-1316', 'Wernermouth', '1990-01-01 04:56:35', 'Vel numquam maxime ducimus ipsum excepturi numquam quo non. Quo et nihil amet voluptas soluta quas atque eum. Praesentium officiis deleniti est. Voluptas est in nostrum quaerat provident repudiandae.', 'Free'),
(207, 1, '1999-10-03', 'Franciston', 'LavenderBlush', 'LightBlue', 'Liechtenstein', 'Female', 'giovanni.murray@example.org', '+50(1)3712965666', 'Else Herman', '548 Caesar Mount\nMraztown, NJ 96743-3000', 'Kubmouth', '1989-12-09 05:19:14', 'Qui dignissimos culpa et ipsam inventore. Dolores atque ut eaque ut aut voluptates distinctio. Neque dolore quam ut. Aut consequatur dolores aut sapiente consequuntur.', 'Silver'),
(208, 2, '1987-06-01', 'South Dale', 'NavajoWhite', 'Silver', 'Central African Republic', 'Male', 'kim62@example.com', '(771)698-3039', 'Marianna Fay', '7339 Mitchell Prairie\nJodymouth, ID 87857-4237', 'Alyssontown', '2021-05-13 05:51:44', 'Odit voluptatem error atque harum consectetur quibusdam. Doloribus sapiente distinctio qui ipsum commodi qui. Repudiandae et porro est qui ratione qui. Dolore vero maiores error natus doloribus.', 'Silver'),
(209, 0, '2013-06-10', 'North Dane', 'DeepPink', 'Salmon', 'Lebanon', 'Not Select', 'jo\'reilly@example.com', '(983)042-6849', 'Lelah Hickle', '05816 Russel Squares\nWest Ardithton, MS 53272', 'Windlerberg', '1982-10-28 09:15:07', 'Ut in eaque praesentium nostrum. Sint quibusdam repellendus quia deserunt accusamus dolorum possimus.', 'Silver'),
(210, 2, '2006-12-21', 'Reichelborough', 'DarkGoldenRod', 'SlateGray', 'Samoa', 'Not Select', 'gleason.adam@example.net', '(351)705-2018x7131', 'Stephania Klocko IV', '35227 Oswaldo Bridge\nKosstown, MT 33592', 'Port Nyahfort', '1980-02-23 01:15:05', 'Exercitationem sit reprehenderit recusandae quia est. Labore unde rem quisquam. Necessitatibus soluta itaque maxime similique occaecati ad qui.', 'Premium'),
(211, 2, '1970-08-30', 'Kaiafurt', 'DarkSalmon', 'DeepPink', 'Belarus', 'Male', 'ywindler@example.org', '+47(9)9318901114', 'Elfrieda Rippin', '3541 Pascale Prairie\nNew Cynthiaport, FL 15122-0057', 'Langworthhaven', '1970-07-28 16:53:15', 'Iste sint qui labore repudiandae. Voluptatem reiciendis corporis eligendi voluptate beatae enim. Sunt est nobis dolorem minus aut. Cumque doloribus est porro quos ut.', 'Free'),
(212, 0, '2015-07-25', 'West Sierrashire', 'DarkGreen', 'DarkGreen', 'Antigua and Barbuda', 'Not Select', 'odell90@example.net', '754.024.4369', 'Nigel McDermott', '297 Loren Light\nLake Cordie, FL 59090-8411', 'Alvertaview', '2004-10-02 02:10:27', 'Voluptatem minima omnis illo sint impedit nobis quo. Occaecati vel doloribus qui quibusdam voluptatem. Id harum error minima.', 'Free'),
(213, 0, '2001-09-17', 'Stephanialand', 'DarkGoldenRod', 'PaleVioletRed', 'Colombia', 'Male', 'medhurst.madilyn@example.org', '071.994.6563x7871', 'Wilber Grant IV', '96056 Blick Street\nNew Reggiebury, NM 90858-5455', 'New Christborough', '2008-02-13 09:56:25', 'Hic fugiat dolor aliquam ea eos et. Quia est ea qui id.', 'Premium'),
(214, 2, '1972-02-13', 'Eastonmouth', 'Peru', 'DeepPink', 'French Polynesia', 'Not Select', 'christiansen.arnaldo@example.com', '(725)503-2503', 'Prof. Johann Lindgren', '51825 Lynch Ridges\nFletcherfurt, TX 30448-1195', 'East Brenda', '1970-05-14 01:42:33', 'Ut debitis et facere repudiandae aliquam architecto. Rerum optio dignissimos ut consequuntur. Delectus commodi voluptatem dolores sed sed et neque alias.', 'Silver'),
(215, 0, '1982-11-24', 'South Alisamouth', 'SlateBlue', 'AliceBlue', 'Congo', 'Not Select', 'micaela86@example.com', '(489)922-8931', 'Adrian Hegmann', '54678 Brandon Via\nLake Hilbertshire, MN 93900', 'Lake Jesusville', '1983-11-07 22:42:39', 'Omnis esse mollitia omnis. Non accusantium accusamus laborum quidem veritatis commodi neque. Et nesciunt vero non cumque ipsam. Rerum voluptatem deleniti commodi magnam in consequatur. Porro nemo aut sit.', 'Free'),
(216, 2, '1993-10-03', 'Joshuahmouth', 'PeachPuff', 'PapayaWhip', 'Philippines', 'Female', 'vschimmel@example.com', '514.445.1994x015', 'Prof. Justina Roberts MD', '668 Schaden Land\nGrimesside, MD 79745-0213', 'Watsonmouth', '1976-03-26 16:57:19', 'Placeat tempora eius quod saepe dolorem sunt. Recusandae doloremque soluta eius ratione beatae aut. Ab neque est ipsam dolor. Et eveniet impedit corporis sed.', 'Free'),
(217, 0, '1975-05-20', 'Lake Isabelmouth', 'Lime', 'Aqua', 'Nepal', 'Not Select', 'nienow.madaline@example.net', '987.083.6204x043', 'Bessie Blanda', '4886 Edgar Unions\nLomaville, PA 64029-9846', 'North Odieside', '2003-05-21 15:37:10', 'Ut amet eos vel qui vel voluptatem exercitationem. A dolores veniam vitae voluptate. Fuga sed iusto quidem aut. Id mollitia delectus nemo et quam id.', 'Free'),
(218, 1, '2000-09-13', 'Port Richie', 'SandyBrown', 'DarkOliveGreen', 'Central African Republic', 'Not Select', 'nicolas.evans@example.net', '681.863.0941x598', 'Mr. Norwood Franecki', '1863 Jarret Burg\nSouth Franciscaside, OK 58569-9408', 'Binsmouth', '1990-09-25 03:44:28', 'Nulla ex id quos quia consequatur. Id sed dignissimos deserunt qui qui exercitationem.', 'Free'),
(219, 1, '1994-02-21', 'West Svenland', 'GhostWhite', 'HotPink', 'Tunisia', 'Not Select', 'zgibson@example.org', '(233)928-2033x75415', 'Jovan Monahan', '86940 Mohr Pine\nPort Eldridgeburgh, ND 10909-2063', 'Haleymouth', '2009-03-27 23:46:47', 'Sunt odio in doloremque. Qui qui veniam beatae veritatis. Iure quis vitae aut consequatur eos.', 'Gold'),
(220, 1, '2003-01-26', 'New Adelia', 'Moccasin', 'White', 'Cape Verde', 'Not Select', 'stone12@example.net', '854.615.0238x7779', 'Jennie Predovic', '51535 Schultz Forest\nElyssashire, HI 99038', 'Terryport', '2009-01-30 03:32:49', 'Ut assumenda molestias saepe omnis. Nulla porro excepturi nam et. Fugit enim accusantium repellendus aut. Perferendis rerum sequi voluptatem natus.', 'Gold'),
(221, 1, '1972-08-02', 'North Lisandrotown', 'LavenderBlush', 'FloralWhite', 'Armenia', 'Male', 'hassan.feil@example.net', '879.073.1010x37798', 'Cara Gibson', '3903 Jaskolski Trafficway\nKochville, ME 14737', 'South Tobinhaven', '2013-02-28 08:10:04', 'Laborum harum et magnam id numquam ut iure. Quo nulla at in nihil corrupti consequatur. Ut non voluptate eveniet dolorem incidunt modi vel ut. Explicabo labore sed unde hic quaerat similique recusandae magnam.', 'Premium'),
(222, 0, '1971-03-23', 'Mikaylaville', 'Black', 'Maroon', 'Croatia', 'Not Select', 'sherzog@example.org', '1-136-401-0391x22233', 'Prof. Maynard Nitzsche', '2717 Ziemann Mountain Suite 002\nKshlerinberg, OR 67112-4898', 'New Ronnyview', '2001-08-19 00:44:16', 'Error ratione rerum possimus illum ut aut. Magnam quis ut animi quas. Quis rem dolorem recusandae quam et voluptatem.', 'Premium'),
(223, 2, '2012-09-15', 'Raphaelstad', 'Peru', 'Gainsboro', 'Vanuatu', 'Male', 'lane08@example.org', '1-604-902-8436', 'Ms. Candace Cassin Sr.', '20021 Finn Rapid\nNew Willyfurt, DC 84048-6631', 'Anjaliton', '2019-06-03 00:50:16', 'Repellat qui minima voluptatibus explicabo vel. Suscipit est et incidunt reprehenderit. Et est qui nobis molestiae et.', 'Free'),
(224, 1, '1990-08-21', 'Stephanberg', 'LavenderBlush', 'MediumPurple', 'Saint Kitts and Nevis', 'Female', 'maribel47@example.org', '(741)649-4586', 'Marcellus Langosh DDS', '49951 Jean Court Apt. 666\nAdrainfurt, AR 92684', 'South Marcellus', '1981-08-16 01:00:19', 'Nobis perferendis iste dolor similique velit. Laudantium quaerat pariatur molestiae est.', 'Free'),
(225, 0, '2002-12-30', 'Wilfredoberg', 'Purple', 'LavenderBlush', 'Micronesia', 'Male', 'ngusikowski@example.org', '373-697-4905', 'Erica Herman II', '64193 Carleton Parkway Suite 534\nLake Daphnee, IL 05088', 'East Minaborough', '1982-05-14 05:20:11', 'Error inventore quod aut voluptatum accusantium. Ut officiis quia ut voluptas voluptates enim ex. Et odit laborum nisi eius quia voluptatem optio.', 'Free'),
(226, 0, '1978-08-21', 'Lake Karolann', 'DeepSkyBlue', 'Violet', 'Haiti', 'Not Select', 'amber.ledner@example.net', '1-049-755-6373x35559', 'Yadira Rice', '04058 Herzog Cliffs Suite 703\nJoefort, SD 62519', 'West Mariliestad', '1988-11-18 14:20:27', 'Sapiente rerum id reprehenderit enim tempore architecto. Nam exercitationem veniam adipisci ipsum officiis libero. Aut ipsum ullam ipsa est blanditiis eum corporis. Et error maxime soluta quae rerum quia.', 'Premium'),
(227, 1, '1973-12-05', 'Ortizstad', 'Fuchsia', 'OldLace', 'Guernsey', 'Male', 'hauck.zena@example.org', '746-774-8879', 'Kitty Greenfelder', '5168 Bill Islands Apt. 697\nBomouth, KY 98966-7208', 'Port Mayra', '2007-03-10 14:59:39', 'Fugiat sequi ut minus veritatis. Temporibus sapiente eius voluptatem distinctio qui. Nulla consequatur eligendi accusantium consequatur consectetur excepturi. Id et enim quis voluptas ipsum debitis qui.', 'Premium'),
(228, 1, '2004-08-17', 'South Rachael', 'MediumSlateBlue', 'Orange', 'Anguilla', 'Male', 'jharvey@example.net', '481.168.9056x2476', 'Kendrick Schroeder', '652 Adaline Keys\nSouth Freedahaven, KY 33607', 'East Autumnborough', '1970-09-09 13:01:00', 'Esse et eveniet eaque incidunt minus. Quo quod perspiciatis possimus unde consectetur. Sed aliquam est animi eos quisquam quo itaque.', 'Free'),
(229, 0, '1994-06-26', 'Kaylinshire', 'Lime', 'AliceBlue', 'Mauritius', 'Female', 'ggibson@example.net', '1-063-582-5709x540', 'Cristal Nitzsche DVM', '517 Jade Crossing\nPort Bradystad, ID 66013', 'Zitamouth', '2012-04-29 18:09:40', 'Cupiditate non quis dignissimos mollitia. Similique non aut dolor quia est. Inventore itaque vel in et.', 'Silver'),
(230, 1, '2005-03-18', 'Maynardview', 'CadetBlue', 'Purple', 'Bouvet Island (Bouvetoya)', 'Not Select', 'bulah54@example.net', '351.397.5905x673', 'Fred O\'Reilly', '1223 Myron Ridges\nGreenchester, LA 69304-0308', 'Elwyntown', '2017-12-23 20:59:36', 'Reiciendis facilis officiis eum aut suscipit in. Praesentium sed quia ut. Quisquam voluptatem ipsa in ex tempora. Unde expedita earum voluptatem exercitationem iusto velit cum numquam.', 'Silver'),
(231, 2, '1992-08-16', 'Rosenbaumfurt', 'OliveDrab', 'Ivory', 'Liberia', 'Male', 'deshawn61@example.com', '08133088104', 'Misty Herman PhD', '32192 Myrtie Camp Suite 447\nLupefort, RI 43981', 'Wilbertberg', '2008-03-04 19:23:49', 'Cumque et et illum dignissimos. Temporibus minima eos temporibus eligendi. Voluptates cum nobis cum iusto recusandae sed.', 'Silver'),
(232, 2, '1981-04-12', 'West Hudson', 'PapayaWhip', 'BlanchedAlmond', 'Heard Island and McDonald Islands', 'Male', 'cassie.aufderhar@example.org', '1-734-153-5914x36599', 'Dr. Kayleigh Jacobson', '0096 Rylan Shore\nWest Lupeside, RI 65218', 'East Opalstad', '1989-06-08 22:35:16', 'Voluptas iusto id ut dolorem ut aut error enim. Ex commodi nulla ipsa nulla. Eligendi qui maiores illo ea cum voluptatem id.', 'Silver'),
(233, 2, '1999-12-09', 'Port Hudson', 'Thistle', 'LavenderBlush', 'Guadeloupe', 'Female', 'ycollier@example.com', '287.985.2035x597', 'Shayne Schiller', '2524 Crist Groves Suite 165\nLake Paolo, HI 12933', 'Murielbury', '1992-02-23 12:33:43', 'Non maiores voluptatum quas facere officiis. Sit repellendus sed ratione illo ab corrupti ut. Voluptate expedita pariatur ratione non architecto nesciunt omnis dolorem. Ut ut non reprehenderit at.', 'Free'),
(234, 0, '1977-01-31', 'North Leanntown', 'GhostWhite', 'DarkBlue', 'Macao', 'Female', 'pfeffer.cleveland@example.net', '816.610.5234x64977', 'Ruthe Stehr', '15709 Lavinia Courts Apt. 545\nWest Columbus, NE 16050-0209', 'Parisburgh', '1979-06-17 05:32:29', 'Rem esse voluptas ipsum quia. Aut commodi itaque et ut autem labore. Dolor ab quia eos libero nobis iste voluptatem. Amet fugiat id qui laborum temporibus dolorem consectetur.', 'Gold'),
(235, 1, '1988-06-18', 'Toychester', 'DarkOliveGreen', 'LawnGreen', 'United Kingdom', 'Not Select', 'dicki.maximilian@example.com', '195.432.3788x18807', 'Miss Ima Hessel Sr.', '051 Haley Alley Suite 421\nLeoramouth, NY 58319', 'Rhettshire', '2008-01-12 04:54:27', 'Culpa qui voluptatem omnis aut voluptas. Ex dolores pariatur perspiciatis molestiae esse exercitationem voluptatem voluptatem. Maxime ratione enim sequi quam. Et laborum voluptatem est autem maiores.', 'Free'),
(236, 2, '2010-08-21', 'West Jonfort', 'Darkorange', 'SeaShell', 'Somalia', 'Male', 'christine.barton@example.org', '07273160613', 'Francisca Kub', '1552 Cassie Mount Suite 874\nNew Justynside, OH 79339-7642', 'Lizatown', '2004-07-08 06:42:26', 'Ipsa suscipit mollitia quis molestiae et. Suscipit atque maxime et autem. Voluptatem sunt similique minima dignissimos omnis sed. Nam quod dolore consectetur aut perferendis quaerat dolores.', 'Free'),
(237, 1, '2009-11-06', 'Port Boris', 'LightCoral', 'Tan', 'Saint Martin', 'Not Select', 'davis.krista@example.com', '1-625-588-3800x02448', 'Eve Kunze Jr.', '6563 Stanton Bridge Apt. 161\nSouth Geovany, AL 35605-8674', 'Collinsfurt', '2011-03-17 21:37:43', 'Quia hic delectus tempora itaque qui quis. Ut at non eius quis velit qui adipisci. Non quidem rerum commodi ullam dicta occaecati. Qui et laboriosam est.', 'Silver'),
(238, 1, '2007-03-03', 'Smithamshire', 'MediumVioletRed', 'MistyRose', 'Cape Verde', 'Not Select', 'harry.mcdermott@example.net', '(251)685-5743', 'Rachel Rempel', '1633 Pattie Ville Suite 306\nNorth Obie, CO 38083-9065', 'Jacquesstad', '1971-12-19 20:23:43', 'Accusantium exercitationem soluta assumenda eos nam. Modi labore odit quas distinctio. Qui non quibusdam officiis et quibusdam dolor.', 'Free');
INSERT INTO `individual` (`id`, `status`, `date_of_birth`, `place_of_birth`, `church_name`, `organization`, `country`, `gender`, `email`, `phone`, `name`, `address`, `city`, `since`, `description`, `packet`) VALUES
(239, 2, '2011-02-04', 'Verlieberg', 'Red', 'Green', 'Qatar', 'Male', 'moses65@example.org', '721-607-6579', 'Keshaun Halvorson', '845 Odie Island\nSouth Kailyn, NV 96165', 'South Forrestfurt', '1987-07-30 10:35:13', 'Totam sunt repellendus natus ducimus nihil vel. Corporis non eum voluptatem tempore tempora ea soluta ea. Fugit cum rerum rerum et quia autem dicta. Et quis placeat eos ut itaque sint fugit.', 'Gold'),
(240, 1, '1987-03-24', 'Kubfurt', 'Indigo ', 'Orchid', 'United States Minor Outlying Islands', 'Female', 'quinn78@example.org', '986.721.4860', 'Dr. Tommie Davis Sr.', '66553 Harold Keys Suite 824\nNicholaustown, TN 07134', 'New Bradfurt', '2021-06-07 18:03:44', 'Debitis vitae ut ea velit quas unde libero. Repellat velit cumque modi eum. Cupiditate voluptatum temporibus unde blanditiis.', 'Gold'),
(241, 1, '2007-11-10', 'Dibbertmouth', 'MediumPurple', 'OrangeRed', 'Cameroon', 'Female', 'nikolaus.shaina@example.net', '503.717.1991x3034', 'Mrs. Clemmie O\'Connell Jr.', '2628 Aiden Turnpike\nNew Lauren, UT 12651', 'North Crystal', '1993-09-04 08:08:02', 'Qui quos totam voluptas. Provident enim in dolor rerum sed illum commodi. Amet qui sunt harum quis id facere omnis. Eius cumque omnis aperiam omnis vero sed est.', 'Free'),
(242, 1, '1979-05-23', 'West Camilleville', 'BlueViolet', 'Navy', 'Kyrgyz Republic', 'Not Select', 'hollie.kiehn@example.com', '(577)765-2827', 'Felicity Nader', '406 Verla Ferry\nNew Ethelynfurt, CA 09473-3819', 'Predovicport', '2015-04-14 23:12:56', 'Quae nobis cupiditate perferendis qui quos qui in. Libero dolor aut esse ut id. Quidem quasi est expedita soluta non et.', 'Gold'),
(243, 2, '1972-03-21', 'Faheyborough', 'FloralWhite', 'DarkGreen', 'Cameroon', 'Male', 'watson.howe@example.org', '074.908.7069', 'Norbert Kemmer', '311 Flatley Inlet Suite 118\nLake Violaview, WA 62206-9307', 'Connerbury', '1972-04-02 03:09:34', 'Omnis minima quo est laborum itaque quam doloremque. Doloremque error sed exercitationem est omnis sit aspernatur. Ex ut minus quis eos possimus. Amet quia consequuntur a est eos.', 'Silver'),
(244, 2, '1976-03-26', 'New Pearlfort', 'MediumVioletRed', 'LightCyan', 'Swaziland', 'Male', 'gregorio53@example.org', '07542089973', 'Matt Parker Sr.', '371 Shields Club\nNew Alisa, LA 68583', 'Lake Michaelbury', '1991-04-12 14:01:12', 'Illo porro magnam praesentium labore qui eos sit excepturi. Et sint et amet recusandae. Quod asperiores sunt ipsam reiciendis expedita sequi velit.', 'Free'),
(245, 0, '2009-11-20', 'New Deontaebury', 'Silver', 'Beige', 'Portugal', 'Not Select', 'o\'keefe.zelda@example.org', '(079)775-8825x46735', 'Lizeth Connelly DVM', '345 Roma Junctions\nSouth Wava, VA 28667-2755', 'East Shanelleside', '1971-08-24 01:47:47', 'Explicabo voluptatem consequatur itaque. Ea sint aut minus modi fuga.', 'Silver'),
(246, 1, '1990-07-23', 'New Rachel', 'MediumAquaMarine', 'OrangeRed', 'Sao Tome and Principe', 'Female', 'gutkowski.kylie@example.net', '255.087.4182x85417', 'Alfredo Pacocha', '150 Brakus Row\nFraneckibury, TN 29702-2631', 'Windlerfurt', '1984-01-12 14:34:16', 'Eum culpa aspernatur saepe voluptas sint praesentium quia. Rerum laboriosam occaecati aut mollitia excepturi consequatur. Et et qui quaerat ad quasi odio.', 'Silver'),
(247, 1, '1980-04-28', 'Nyaville', 'RoyalBlue', 'MediumAquaMarine', 'Aruba', 'Male', 'aprosacco@example.com', '352.637.2240', 'Lysanne Hartmann', '6943 Cole Row\nChanelleton, NV 88909-4970', 'Trantowbury', '1971-10-01 01:54:20', 'Quia quaerat et delectus. In ratione ab at tempore. Mollitia reprehenderit corrupti cupiditate eos.', 'Gold'),
(248, 0, '1988-01-29', 'Runtechester', 'LightSlateGray', 'LightYellow', 'Mozambique', 'Male', 'zhane@example.net', '(780)874-9947x812', 'Hillary Collier', '582 Moen Square\nNorth Isadoreton, LA 72276-9841', 'Stokesfurt', '1971-07-02 07:50:55', 'Similique minima natus est voluptas sed et velit. Maxime voluptatem at dolor nam. Corrupti dolor explicabo quo pariatur. Quod aliquam voluptatem eligendi impedit commodi omnis ad.', 'Silver'),
(249, 1, '1985-08-02', 'Bertafort', 'LightPink', 'GhostWhite', 'Australia', 'Male', 'uswaniawski@example.com', '905-848-0571x660', 'Dr. Makenna Cassin Sr.', '56108 Anika Road\nOsvaldoshire, PA 16756', 'Dantechester', '2013-05-24 05:13:54', 'Delectus architecto voluptatem aut id et sint. Delectus aliquid nulla sed sed. Mollitia maiores sed qui voluptatem non dolores. Veniam ipsa exercitationem ipsa et vel quis.', 'Free'),
(250, 2, '2014-11-10', 'Bradtkehaven', 'Navy', 'Aquamarine', 'Rwanda', 'Not Select', 'greenholt.layla@example.com', '221-197-7019x082', 'Wilhelmine Terry', '104 Wisozk Estates Suite 609\nNorth Miguelmouth, VA 90758-6050', 'Bahringermouth', '2016-02-25 02:00:53', 'Voluptatum alias qui beatae commodi omnis corrupti quia. Eum iusto error id. Molestias laudantium occaecati nulla nesciunt nihil consequuntur eaque.', 'Gold'),
(251, 2, '1977-01-10', 'North Israelmouth', 'LightCyan', 'DarkGray', 'Canada', 'Male', 'njohnson@example.org', '186-702-9131', 'Dr. Hayley Gerlach', '51155 Margarette Loop Suite 183\nSouth Faustino, KY 68996-4329', 'Port Bernhardbury', '2020-09-04 07:37:49', 'Nam perferendis tempora maxime non ipsa quae eius non. Voluptatibus officiis laborum quo impedit eligendi. Aut et ratione illo vel aut sit quae hic.', 'Gold'),
(252, 1, '1981-03-29', 'Lake Charles', 'Navy', 'DarkCyan', 'Reunion', 'Not Select', 'kaci50@example.org', '230.369.3945x7517', 'Prof. Michael Schamberger I', '57761 Kohler Row Suite 262\nHahnfurt, SD 14963-4839', 'Port Marlee', '2012-01-07 17:46:17', 'Nobis reprehenderit earum reprehenderit maxime quam facilis. Vitae dolorum quos sapiente. Eligendi dicta laudantium amet et tempore cupiditate iste deleniti. Velit possimus sit eum eum nisi dicta. Fugiat et aliquid voluptatem.', 'Silver'),
(253, 1, '1996-07-08', 'North Monserrate', 'Tan', 'GhostWhite', 'Heard Island and McDonald Islands', 'Female', 'elmer.rosenbaum@example.net', '1-671-579-0416x039', 'Mrs. Myrtle Wilderman II', '25747 Gerlach Bridge\nNew Leonardoborough, ND 95333-7326', 'Carleefurt', '1984-12-30 05:40:51', 'Quae voluptates non nam tempore impedit. Fugiat quia et officiis est soluta. Deserunt quos eum sit tenetur aspernatur.', 'Free'),
(254, 2, '2012-10-15', 'Orieberg', 'Chartreuse', 'YellowGreen', 'Burundi', 'Female', 'tjohnston@example.org', '789.106.6788', 'Antonietta O\'Reilly I', '36413 Maggie Estate Suite 420\nWaterschester, MT 40775', 'Lake Lila', '1997-01-24 06:49:19', 'Occaecati molestiae quidem fuga est eveniet consequatur. Asperiores commodi dolores consequatur quo omnis id. Corporis architecto vitae optio labore quibusdam voluptatem. Sint ullam veritatis harum harum non minus est.', 'Free'),
(255, 1, '2014-01-04', 'Hermannshire', 'MediumBlue', 'IndianRed ', 'Samoa', 'Female', 'kathryne97@example.com', '1-376-353-3026', 'Dayana Powlowski', '6056 Bogan Mountains\nPort Helmermouth, ID 33671', 'Justontown', '1980-11-19 03:21:58', 'Illum molestiae sit repudiandae quibusdam qui. Dolorum est aut quam eius deleniti voluptas autem. Corrupti voluptas et expedita architecto nam praesentium. Minus aut voluptatem est animi doloribus ut odit.', 'Silver'),
(256, 0, '1987-12-11', 'Kacieport', 'Green', 'LightSlateGray', 'El Salvador', 'Female', 'edwardo93@example.net', '(837)232-7306x056', 'Prof. Sidney Simonis', '9130 Sigurd Valley Suite 883\nNorth Berthaport, AR 83450', 'New Ricardo', '2007-11-10 04:50:53', 'Temporibus quasi dicta voluptas nostrum incidunt rerum dolores. Ullam id velit porro aut rerum ut quis. Voluptates velit eos voluptas tempore. Libero et dolore odit quas non.', 'Free'),
(257, 2, '1980-01-28', 'Jarrellton', 'GoldenRod', 'DarkGoldenRod', 'Andorra', 'Not Select', 'larkin.palma@example.com', '1-697-578-6147x89400', 'Mr. Carmel Funk', '602 Alvis Rue\nCollinchester, AL 56235-7067', 'Ritchieshire', '1993-06-10 15:10:45', 'Saepe unde illo tempore qui. Qui suscipit enim officia occaecati. Enim ipsum hic exercitationem aspernatur ut sed.', 'Gold'),
(258, 0, '1975-05-09', 'Port Mathildeland', 'Bisque', 'SaddleBrown', 'Philippines', 'Not Select', 'carmine.aufderhar@example.org', '676.611.7976x60206', 'Lucile Treutel', '12186 Beatty Gateway\nLeannaville, NH 99028-7778', 'Hayesport', '2014-11-13 21:28:58', 'Nihil omnis ratione rerum voluptatem sequi similique et labore. Sed dignissimos eligendi sit consequatur nam. Ut consectetur saepe ea autem minima et ad. Velit eaque nulla quas nostrum sunt.', 'Silver'),
(259, 2, '2008-08-14', 'East Anita', 'DarkCyan', 'Red', 'Iceland', 'Female', 'amari06@example.net', '1-768-087-2561x4210', 'Lisa Kozey', '82559 Marian Turnpike Apt. 073\nEast Llewellynberg, MA 42240', 'Lake Deonte', '1988-08-13 19:17:32', 'Odio aperiam autem odio velit ducimus consectetur ab. Suscipit maxime voluptatem officia veniam eius corporis. Id ut nemo distinctio quo facere id. Numquam ut inventore id iste. Ea quia vitae quo autem quibusdam dolorem similique.', 'Premium'),
(260, 2, '2016-10-15', 'Port Brandyn', 'Chartreuse', 'DarkSlateBlue', 'Togo', 'Male', 'feil.mozelle@example.org', '417.687.9354x94487', 'Alyce Gleason', '400 Joey Plains\nJannieville, RI 19892-6201', 'Olsonhaven', '1977-03-15 16:08:23', 'Et quibusdam voluptatem repellat nisi necessitatibus consequatur possimus. Inventore eveniet nam et quo. Veritatis praesentium aliquid quia culpa aut magnam quisquam.', 'Premium'),
(261, 0, '1978-10-23', 'South Chadport', 'Wheat', 'Coral', 'Uganda', 'Not Select', 'alena.hudson@example.com', '(331)267-3341', 'Mazie O\'Keefe', '001 Kling Mountain Suite 837\nWest Avashire, GA 85926', 'Lisetteshire', '1983-12-08 17:42:23', 'Repellat aut voluptates debitis similique omnis. Molestiae dolorum recusandae quasi a dolor aut. Quidem non libero a maxime eius et impedit. Quod voluptatem voluptatem maiores veniam.', 'Free'),
(262, 2, '1976-06-13', 'East Alexane', 'Beige', 'Aqua', 'Palestinian Territory', 'Female', 'ludwig.quigley@example.net', '731-977-9075x778', 'Easton Sipes', '980 Hintz Drive Suite 896\nNorth Augustusmouth, OK 90340-2723', 'West Alvinaville', '2010-07-29 05:24:43', 'Repellat perferendis consectetur fugiat id occaecati nisi. Aspernatur sequi tenetur provident soluta et vitae. Optio et quibusdam animi. Aut officiis aliquid accusantium labore blanditiis consequatur.', 'Silver'),
(263, 0, '1974-05-10', 'Ruthfort', 'PaleGreen', 'Lime', 'Malaysia', 'Female', 'fae99@example.com', '(357)485-6406x402', 'Mrs. Cynthia Lehner DDS', '850 Bashirian Cove\nJeromeview, SD 52106', 'South Newellchester', '1983-11-13 18:36:40', 'Et velit nisi labore aliquid enim libero est. At quaerat id non hic eum suscipit veritatis. Dignissimos illo omnis ut ut vel illo sed.', 'Silver'),
(264, 1, '2013-04-05', 'Lorenaport', 'Darkorange', 'Black', 'Egypt', 'Male', 'ondricka.izaiah@example.com', '1-661-288-7412x701', 'Fleta Brakus', '798 Alessandro Land\nLake Angeline, NJ 53163-1277', 'New Hettiechester', '2001-01-31 06:54:12', 'Qui ut dignissimos velit omnis dolore aut quibusdam. Aut quia vitae accusamus. Quaerat sit nostrum explicabo. Labore ducimus labore similique quibusdam deleniti accusantium nihil.', 'Gold'),
(265, 2, '2000-10-11', 'Artchester', 'DarkOrchid', 'OrangeRed', 'Kyrgyz Republic', 'Not Select', 'okuneva.faustino@example.net', '(311)793-9674', 'Prof. Mustafa Abshire', '2408 Haley Orchard Suite 404\nWest Jesse, ME 05179', 'North Brando', '2014-07-20 02:04:57', 'Ullam eos illo delectus natus quos. Sunt similique id voluptas qui. Consequatur omnis et sed et. Et doloribus perspiciatis est itaque similique et et. Minus magnam porro est voluptas.', 'Free'),
(266, 2, '1989-04-13', 'Leoneburgh', 'Azure', 'Blue', 'Tonga', 'Not Select', 'nadia.larson@example.net', '051-088-6343x9900', 'Cary Kohler', '25215 Jordane Dale Suite 924\nClementfurt, NM 54807-5782', 'Romagueraburgh', '1973-10-26 18:59:27', 'Atque quis enim animi distinctio velit. Rerum quod consequuntur quidem animi.', 'Premium'),
(267, 1, '1986-06-17', 'Feeneychester', 'Cornsilk', 'CadetBlue', 'Latvia', 'Not Select', 'batz.adeline@example.com', '(146)663-5418', 'Sienna Auer', '3814 Norwood Ramp Apt. 309\nAlexiebury, ID 49207', 'Lake Roderickhaven', '2004-05-06 19:17:15', 'Doloribus est sit eum ut. Dignissimos odit est laborum assumenda. Voluptatem maiores consequatur vel ad. Possimus et et dolorem animi incidunt consequatur.', 'Free'),
(268, 2, '1970-11-06', 'Jaymetown', 'MediumSeaGreen', 'YellowGreen', 'Argentina', 'Female', 'fabian67@example.net', '643-092-9492', 'Una Ledner PhD', '6811 Lemke Drive\nSabinamouth, ID 29638', 'Wyattburgh', '1988-10-17 01:25:23', 'Nobis esse est expedita fuga. Eligendi aut et et architecto soluta occaecati. Cumque voluptas molestiae nobis fuga a. Ut eos consectetur mollitia enim enim soluta. Odio id aperiam vitae sint dolorum animi.', 'Silver'),
(269, 0, '1989-07-15', 'New Kendratown', 'IndianRed ', 'SkyBlue', 'South Georgia and the South Sandwich Islands', 'Female', 'jbogan@example.net', '325-180-8767x4599', 'Mrs. Carolanne Jacobson', '901 Zboncak Lodge Suite 862\nKalebtown, TN 24097-6311', 'Wilkinsonmouth', '2000-12-28 18:26:40', 'Nemo aliquam adipisci minus ex laborum eum. Cupiditate quis perferendis fugit. Vel natus architecto excepturi nesciunt nobis voluptatum vel. Deserunt eligendi et voluptatibus non.', 'Free'),
(270, 2, '2013-07-19', 'New Bertafort', 'Magenta', 'LightCoral', 'Samoa', 'Male', 'wspinka@example.org', '1-025-246-8073', 'Connie Rice III', '808 Runolfsdottir Mills Apt. 607\nColemanfort, CA 92642-1251', 'Abeltown', '1994-06-16 18:19:12', 'Delectus animi non similique quas quis. Enim maiores enim quas molestias quibusdam soluta. Temporibus autem voluptas aut et quo natus.', 'Silver'),
(271, 0, '2020-11-09', 'Port Sabrynashire', 'DarkKhaki', 'SlateGray', 'Burkina Faso', 'Female', 'ocie.swaniawski@example.net', '999.210.7491', 'Molly Streich', '5121 Lavina Land Suite 121\nNew Deondre, IA 49056-2379', 'Marcelshire', '1972-10-18 02:26:43', 'Ipsum voluptate provident autem sunt excepturi. Dolores est totam et quasi vitae voluptates. Explicabo id voluptatibus adipisci ipsa numquam asperiores. Iusto voluptatem dolorum ut omnis dolor.', 'Silver'),
(272, 2, '1992-04-19', 'New Paulineport', 'YellowGreen', 'Fuchsia', 'Saint Martin', 'Male', 'garfield76@example.org', '094-623-8814x325', 'Dr. Dolly Balistreri III', '203 Caleigh Lock\nSusannafurt, AR 13406', 'Florianhaven', '1995-06-01 11:18:48', 'Repudiandae numquam veritatis blanditiis voluptatibus ea nemo quis beatae. Quis eum perspiciatis consequatur quis velit similique quidem. Perferendis totam vero numquam et.', 'Gold'),
(273, 1, '1996-11-21', 'North Dana', 'LightSteelBlue', 'PapayaWhip', 'Oman', 'Female', 'ila.moore@example.net', '1-521-065-9262', 'Kayleigh Abernathy', '79909 Carlo Ramp Apt. 863\nJerdeton, IL 03159-7881', 'Davisstad', '1989-09-24 05:20:31', 'Aut ut vitae aut expedita ea eum. Nostrum animi accusantium possimus suscipit.', 'Premium'),
(274, 0, '1982-07-12', 'Eddbury', 'PaleGoldenRod', 'LightYellow', 'Niger', 'Not Select', 'jwunsch@example.org', '002-908-0643x350', 'Ellie Farrell', '921 Roger Garden Suite 576\nCummeratastad, OK 26102-8164', 'Port Concepcionchester', '1973-12-01 17:32:10', 'Dicta cupiditate est omnis in. Dignissimos consequatur culpa temporibus aut alias. Exercitationem repellat numquam voluptatibus rem ipsa aut.', 'Premium'),
(275, 2, '2010-02-26', 'Jaydonmouth', 'Turquoise', 'FloralWhite', 'Canada', 'Male', 'gulgowski.nya@example.org', '019.166.7100', 'Kris Gleichner', '2934 Dixie Row Apt. 463\nNorth Vinniehaven, LA 24655', 'Shirleyhaven', '1975-05-28 22:01:07', 'Harum ab sunt et rerum. Sint nesciunt omnis maiores fugit et quia. Id et est ipsa rerum rem voluptatem sapiente.', 'Gold'),
(276, 2, '1980-02-12', 'New Leliashire', 'Tomato', 'LavenderBlush', 'Northern Mariana Islands', 'Female', 'laurine.bradtke@example.net', '164.675.4647x54247', 'Dewayne Cole', '432 Ofelia Spring\nOberbrunnerport, WV 48410', 'Emilianohaven', '1993-03-21 21:30:55', 'Sit voluptatem ipsam autem ipsum est delectus ullam. Id vel facilis non quisquam. Mollitia sed alias qui eveniet dolores. Maiores consequatur atque dolores eaque est deleniti ab et.', 'Premium'),
(277, 1, '2020-11-07', 'New Edwinachester', 'AntiqueWhite', 'DarkKhaki', 'Djibouti', 'Male', 'fred14@example.org', '403-356-8531', 'Dr. Mary Dietrich I', '64228 Pollich Brooks\nCroninview, NJ 63785-4308', 'West Roxane', '2015-10-17 05:03:44', 'Ad error iste magnam pariatur. Aut sunt omnis non recusandae perferendis error consequuntur molestiae. Commodi amet earum consequuntur laborum dolore. Rem aut consequatur dolore aut voluptates molestias qui.', 'Gold'),
(278, 0, '2000-10-15', 'North Domenico', 'DarkOliveGreen', 'Aqua', 'Puerto Rico', 'Male', 'xcarroll@example.com', '1-170-316-4430', 'Aiyana Rath PhD', '7041 Ciara Ramp Suite 828\nSouth Jamaal, KY 39451', 'Omastad', '2014-11-04 19:00:39', 'Dolor et quia sit doloremque sit omnis atque. Eos accusantium aut explicabo ex provident eos sapiente praesentium. Quas autem qui voluptate pariatur est placeat ipsa.', 'Silver'),
(279, 1, '1979-08-21', 'North Stuart', 'Wheat', 'MediumAquaMarine', 'Vanuatu', 'Not Select', 'malinda.carter@example.org', '810.985.4561x44200', 'Kailyn Lehner', '594 Heidi Junctions Apt. 403\nErnestineland, FL 45005', 'Emmaleeport', '1993-04-26 10:59:56', 'Eos doloremque qui corrupti cupiditate ipsum et ut et. Blanditiis unde expedita cum dolores animi dolor. Odio est nihil ipsam voluptas.', 'Gold'),
(280, 2, '2009-03-28', 'South Montana', 'Aqua', 'Bisque', 'Mauritius', 'Male', 'josue.morissette@example.org', '864-821-3526x12660', 'Beth Langworth', '7882 Schneider Ramp\nDonnellyland, KS 53318', 'New Deonteborough', '2018-12-21 10:03:18', 'Sit facilis est laborum quia. Quisquam non recusandae aut aut itaque fugit cum.', 'Gold'),
(281, 1, '2000-04-23', 'North Eleanorabury', 'Blue', 'AliceBlue', 'Djibouti', 'Not Select', 'sosinski@example.org', '241-598-4564', 'Ms. Rosanna Bode DDS', '650 Micah Lodge\nO\'Konfort, VT 78241', 'Linnietown', '2019-10-14 13:49:56', 'Eaque et tempora amet fugit nam delectus amet magni. Ipsam facilis totam molestiae ducimus fugiat dolorem. Dolorem beatae accusamus aut odio accusamus nemo molestiae. Est eius possimus magnam consequatur delectus.', 'Silver'),
(282, 1, '1994-02-13', 'Berneicechester', 'LightSalmon', 'YellowGreen', 'San Marino', 'Not Select', 'ambrose.schuster@example.org', '295-285-4532', 'Dr. Jack Morar DVM', '78294 Colten Loaf\nBaumbachchester, NY 36630', 'Lake Jayce', '1999-12-15 19:44:53', 'Similique qui et ut adipisci incidunt unde reiciendis voluptatem. Consequatur adipisci adipisci at ad est. Amet temporibus illo minus fugit.', 'Gold'),
(283, 1, '2011-09-06', 'Karianeside', 'Linen', 'Yellow', 'Norway', 'Male', 'leora23@example.org', '(731)754-3738x9102', 'Eliseo Hahn', '05311 Aurelie Port\nWeimannshire, AK 59169', 'Mozellville', '2008-02-10 18:08:09', 'Ipsum debitis quidem molestiae et. Accusantium dicta illo voluptatem incidunt unde optio. Itaque voluptatem nostrum molestiae ipsa.', 'Free'),
(284, 1, '2003-03-07', 'Coyville', 'ForestGreen', 'LightSalmon', 'Northern Mariana Islands', 'Not Select', 'ernestine.bins@example.org', '1-511-959-0396x13773', 'Kian Abernathy', '690 Matt Centers\nLake Thoramouth, NH 32607', 'Townebury', '1985-09-25 15:21:45', 'Ratione voluptatum accusantium consequuntur et dolor nisi. Tempore dignissimos unde aliquam magni eveniet perferendis. Sed ex eaque vero odio sequi dolore repudiandae quas.', 'Gold'),
(285, 0, '2006-05-31', 'East Evelineton', 'Maroon', 'LightSteelBlue', 'Myanmar', 'Not Select', 'saige.davis@example.com', '720-760-7634', 'Turner Cormier', '832 Darryl Gateway Suite 905\nNorth Edward, KS 75947', 'Port Frieda', '1989-01-20 11:02:35', 'Earum placeat alias amet eligendi a facere. Ex totam quia dignissimos aut. Ut aut incidunt ratione voluptatem magnam odio omnis qui.', 'Silver'),
(286, 0, '1991-05-03', 'Port Katherynfort', 'Tan', 'Ivory', 'Malta', 'Not Select', 'catherine26@example.org', '09103510724', 'Jaquelin Walter', '989 Gerda Forges Suite 251\nClaudieville, MA 13100-2490', 'North Kip', '1989-12-14 17:52:28', 'Aut et inventore ullam qui id debitis tempora. Aut omnis culpa illo illum similique. Neque harum laboriosam dignissimos. Voluptatem ut et consequuntur et occaecati rem et.', 'Silver'),
(287, 2, '2020-09-29', 'Beverlytown', 'SlateBlue', 'BlanchedAlmond', 'Tunisia', 'Male', 'kristopher94@example.org', '271-273-8775x1712', 'Hillard Krajcik', '38314 Belle Road\nHudsonhaven, NV 12486-8531', 'Jacobimouth', '1973-07-01 23:26:05', 'Ducimus aliquid asperiores recusandae cupiditate animi. Qui dolore magni mollitia ut. Officiis quia sequi explicabo rerum voluptates. Dolor voluptatem dolorum eaque impedit enim nihil molestiae.', 'Free'),
(288, 0, '1972-03-21', 'Blockberg', 'LightCoral', 'Black', 'Sao Tome and Principe', 'Male', 'leuschke.merritt@example.com', '(973)740-7326x8285', 'Princess Monahan', '932 Chelsea Falls\nSouth Jantown, AL 06623', 'Melyssahaven', '1983-05-12 12:17:24', 'Eveniet harum voluptates repudiandae provident iste. Est dolorem incidunt est molestiae. Voluptatibus quo quo sequi est et accusamus magnam qui. Perspiciatis id error qui numquam minus adipisci.', 'Premium'),
(289, 1, '1979-11-20', 'Rubenborough', 'Gainsboro', 'LemonChiffon', 'Cambodia', 'Not Select', 'cosinski@example.org', '1-740-385-8479x2905', 'Alycia Schinner', '89593 Keeling Spur Apt. 481\nBeahantown, NY 03180', 'Vivafort', '2019-09-01 12:03:11', 'Necessitatibus officiis quidem voluptatibus placeat dolore tempora. Iste quia ut magnam nam. Ea tenetur minus id deleniti non inventore.', 'Free'),
(290, 0, '1998-06-02', 'Lake Jerel', 'MediumAquaMarine', 'Thistle', 'Korea', 'Female', 'schuyler.wehner@example.net', '1-866-348-5394', 'Aurelio D\'Amore', '1112 Paucek Vista Apt. 256\nNew Paulmouth, TN 53627-6259', 'Blazebury', '2001-12-09 07:35:44', 'Aliquid et sed laboriosam iste necessitatibus quia. Nihil ut aut sapiente rerum. Natus et cupiditate enim delectus nihil.', 'Free'),
(291, 1, '1993-07-14', 'Gaetanomouth', 'MediumAquaMarine', 'Wheat', 'Georgia', 'Not Select', 'satterfield.tara@example.org', '352.786.3693x394', 'Prof. Grace Johns', '4450 Emerson Hills\nNew Keyonland, CT 84189', 'Stokesport', '1981-01-26 17:43:45', 'Tempore est consectetur soluta sed deserunt laborum sed. Animi nihil et sint et molestiae.', 'Free'),
(292, 2, '2016-01-24', 'Smithbury', 'HoneyDew', 'LightCyan', 'Germany', 'Female', 'emil.labadie@example.net', '208.382.6474x622', 'Nicholas Lynch', '46486 Renner Drive\nPort Glendaside, VA 96069-8524', 'Audiemouth', '1992-03-23 14:13:12', 'Hic quam sint culpa quia dolor atque odio. Atque qui assumenda expedita sit ea quia accusamus. Dolorem dignissimos placeat sed. Perferendis est repellat dolorem ipsam aspernatur aut qui.', 'Gold'),
(293, 0, '1970-09-15', 'Estelmouth', 'DimGrey', 'Olive', 'Oman', 'Male', 'athena.toy@example.com', '(048)027-0904x3452', 'Sadye Powlowski', '984 Carissa Meadows\nLake Eastonport, NY 69922', 'Twilaport', '2016-01-26 10:02:33', 'Ipsum dolor ducimus expedita ut unde corrupti consequatur. Non labore quia aut voluptatibus autem qui qui. Voluptates fugit alias nobis. Ut esse numquam molestiae. Id nisi mollitia dicta et vero.', 'Silver'),
(294, 1, '1992-04-24', 'Faheyside', 'Black', 'MediumSeaGreen', 'Nauru', 'Not Select', 'arvid.rowe@example.net', '205-034-8539x29904', 'Dandre Turner', '7298 Padberg Glens Suite 026\nFishertown, IN 74825-1701', 'East German', '2001-01-28 10:54:37', 'Nihil molestias deleniti tempore. Voluptatem reiciendis quia eligendi et perferendis ut et. Fugit dolorum molestiae voluptas cupiditate quia.', 'Gold'),
(295, 0, '1976-08-18', 'West Adrain', 'DarkMagenta', 'YellowGreen', 'Monaco', 'Female', 'metz.addie@example.com', '(189)230-1581', 'Kiera Terry IV', '91167 Verlie Center Apt. 155\nNorth Ericaburgh, DE 19524', 'New Keeganberg', '2003-04-30 14:38:17', 'Laboriosam fuga aut voluptatibus quasi. Ducimus exercitationem perferendis aliquid necessitatibus excepturi quis. Voluptas excepturi voluptas ab ipsam. Necessitatibus ipsa est iure temporibus id voluptate.', 'Premium'),
(296, 1, '1984-03-28', 'New Hollistown', 'CornflowerBlue', 'Black', 'Guyana', 'Female', 'jarret05@example.com', '959.105.9462', 'Veronica Collier', '0373 West Lodge\nEmilieberg, CO 70335', 'Adeliaton', '2015-07-04 05:42:29', 'Praesentium quam consequatur nemo quo velit quia ut quas. Iste expedita ea dolorem et eius. Rerum iure doloremque velit ex quia dolores.', 'Gold'),
(297, 1, '1995-04-06', 'Port Isidro', 'MediumOrchid', 'DeepSkyBlue', 'Serbia', 'Not Select', 'zbayer@example.com', '(862)277-6293x570', 'Mr. Manley Deckow DDS', '7543 Ralph Knolls Suite 676\nRowestad, TN 46183', 'Andremouth', '1978-11-15 00:06:34', 'Odit minus et animi hic dolorem ratione voluptas. Nihil molestiae inventore a. Et maiores asperiores sit dolorum doloremque esse esse ut.', 'Gold'),
(298, 1, '2003-09-01', 'North Sunny', 'AntiqueWhite', 'LightCoral', 'Denmark', 'Female', 'ileffler@example.org', '05104812886', 'Abbigail Buckridge', '81022 Braun Rest Apt. 930\nWest Mervinside, UT 43865', 'South Douglas', '1989-09-17 01:48:54', 'Laudantium maiores a et. Est sit sit provident eligendi voluptates quaerat. Dolor nulla sequi aperiam.', 'Silver'),
(299, 0, '2004-09-21', 'Lindgrenhaven', 'SeaGreen', 'Plum', 'Turks and Caicos Islands', 'Male', 'jroob@example.org', '(662)239-0034x477', 'Arely Mertz DVM', '233 Virgie Corners\nJordiborough, MO 46288-9028', 'Mekhifort', '2013-09-12 09:10:24', 'Libero et natus qui fugit tempore ducimus. Et et iusto adipisci aliquam nihil ipsa. Dignissimos eveniet sapiente iure natus quod voluptatem sequi. Enim quo ipsam consectetur et consequatur totam minima. Laboriosam ullam quod ab porro ea in assumenda.', 'Gold'),
(300, 0, '1975-11-25', 'Estaton', 'Orange', 'Blue', 'Lithuania', 'Not Select', 'welch.fritz@example.net', '+58(3)3660614342', 'Prof. Athena Ankunding', '39179 Rogahn Forges Apt. 255\nAlexandroberg, MA 47372', 'Javierside', '1999-11-26 05:40:21', 'Reiciendis nesciunt pariatur aliquam illum sit veniam. Nesciunt labore hic sint ut. Rerum quam ut voluptas dolore.', 'Premium'),
(301, 0, '1995-11-13', 'Lake Liza', 'Gainsboro', 'Turquoise', 'Montserrat', 'Female', 'zwehner@example.net', '645-786-2144x62391', 'Travon Bernhard IV', '91283 Rempel Village\nNew Lera, SD 04486-2574', 'Port Sonya', '2010-07-08 08:41:45', 'Soluta aliquam aspernatur sint aspernatur aspernatur optio. Magni inventore officiis at quod. Quidem facilis nobis et inventore et sed eum incidunt. Et eum totam quod architecto ut inventore incidunt.', 'Silver'),
(302, 2, '2013-01-16', 'Georgettemouth', 'Chocolate', 'DarkCyan', 'Chile', 'Female', 'weber.madge@example.net', '929.654.2426', 'Hipolito Hodkiewicz', '261 Grimes Isle\nJoelleland, OH 15126-6553', 'Darrickburgh', '1973-12-26 17:18:16', 'Et sit doloremque quia. Aut quaerat et temporibus amet sapiente voluptatem. Veniam quis vel quas aut eos. Voluptates cumque deleniti iusto eos.', 'Gold'),
(303, 0, '1996-03-23', 'Lake Gabestad', 'Brown', 'MidnightBlue', 'Tuvalu', 'Not Select', 'shayna.hagenes@example.com', '+45(2)0694950680', 'Dr. Sidney Stoltenberg DDS', '428 Aliya Mountains\nNew Bellamouth, WY 58170-1367', 'East Ola', '1985-02-18 10:05:54', 'Perferendis esse accusamus saepe voluptas quo voluptatem quis. A officiis debitis adipisci ipsam explicabo nam. Eligendi magnam nemo veritatis necessitatibus ratione autem. Et voluptatem dicta molestias consequatur doloribus consectetur et.', 'Premium'),
(304, 0, '2008-04-12', 'Hickleshire', 'BurlyWood', 'Orange', 'Niue', 'Female', 'dthompson@example.com', '536-481-5181', 'Frederik Ferry', '23545 Bartoletti Ford\nLake Fatimashire, NH 50642', 'Hagenesmouth', '2018-05-25 09:21:00', 'Ut voluptas qui tempore placeat nemo mollitia reiciendis quaerat. Velit sit repellendus pariatur. Ad et sint dignissimos.', 'Free'),
(305, 1, '2011-06-01', 'East Brittany', 'MediumBlue', 'MediumPurple', 'Poland', 'Not Select', 'cveum@example.org', '852.306.8624x94704', 'Orrin Zieme', '01886 Enos Parkways Suite 760\nLake Hollyside, IN 02982-4795', 'Rennertown', '2018-03-22 13:18:26', 'Qui dicta repellendus voluptatem officiis omnis. Facere unde a amet molestiae aut ea.', 'Premium'),
(306, 0, '1998-03-31', 'Littleview', 'MistyRose', 'LightGreen', 'Ghana', 'Male', 'cole.catalina@example.com', '1-752-824-6673x02331', 'Mr. German Luettgen Sr.', '33850 Candido Rest\nDurganshire, MI 00109-0415', 'South Fannyburgh', '1997-06-27 18:12:01', 'Delectus enim iusto maiores at dolor. Temporibus et qui perferendis. Sunt eveniet dolor tenetur sequi. Sunt quis accusamus omnis dicta.', 'Premium'),
(307, 0, '2004-11-11', 'Beattymouth', 'MediumTurquoise', 'LightGray', 'Tuvalu', 'Male', 'mary.goldner@example.org', '(245)277-9754', 'Nedra Stracke III', '91289 Reese Trail Suite 221\nDarehaven, NC 29789', 'West Cecelia', '2008-03-09 09:53:01', 'Laudantium qui voluptatem et ut temporibus enim. Suscipit et eius et est nostrum corrupti non. Reiciendis quas explicabo minus voluptatum rerum. Atque dolorem fuga modi eveniet ducimus debitis.', 'Free'),
(308, 1, '1987-01-11', 'North Carmela', 'MediumBlue', 'PapayaWhip', 'Colombia', 'Female', 'huel.lurline@example.org', '1-928-298-5746x624', 'Karli Ortiz', '876 Rickie Road Suite 515\nFaheyhaven, NM 32076', 'North Leraland', '1980-02-03 01:09:17', 'Dolor exercitationem voluptate magni voluptatem. Tempora dolore ea pariatur molestiae occaecati. Culpa ex aspernatur perferendis iste expedita suscipit.', 'Silver'),
(309, 0, '1971-08-01', 'Kulasshire', 'Bisque', 'DeepSkyBlue', 'Sri Lanka', 'Not Select', 'gbotsford@example.org', '175.795.0562x3698', 'Ines Stamm', '5976 Lonie Place\nEast Tabitha, OR 98201-0446', 'Perryland', '2011-07-13 12:21:11', 'Maiores repellat sequi qui illum ducimus. Non expedita natus itaque neque. Soluta non consequatur sint deserunt. Nobis molestiae illo quisquam qui voluptates.', 'Gold'),
(310, 2, '1997-03-30', 'East Cecelia', 'AntiqueWhite', 'IndianRed ', 'Myanmar', 'Not Select', 'christelle.kerluke@example.org', '722.783.7104x341', 'Kelli Predovic', '2452 Ullrich View Apt. 079\nSouth Markhaven, IN 51977-0525', 'Boehmton', '2009-09-25 18:57:54', 'Distinctio labore praesentium accusamus corporis explicabo ipsam. Et aut ut est vitae a deleniti omnis. Aliquam aut nesciunt deserunt et et at enim dolorem. Velit fugiat illo eos minima est est sed perferendis.', 'Free'),
(311, 2, '1982-02-09', 'Lockmanhaven', 'LightCoral', 'DarkSlateGray', 'Tuvalu', 'Female', 'jedidiah25@example.org', '751-385-9616x7733', 'Ezequiel Stokes', '2294 Franecki Tunnel Suite 811\nSouth Constantinborough, OK 82721-3611', 'South Leopoldo', '2004-06-15 10:51:12', 'Asperiores ipsum incidunt dicta laudantium facere culpa tempore. Placeat repellat dolores sed qui in ratione maiores. Ducimus alias deserunt sapiente ex rem facere. Cupiditate aspernatur commodi voluptatem blanditiis.', 'Free'),
(312, 0, '1997-01-15', 'Lake Allanton', 'Snow', 'PaleGreen', 'Denmark', 'Not Select', 'kautzer.lexi@example.com', '229-453-4989x26191', 'Mervin Friesen', '1692 Maude Drives Suite 580\nSouth Albertaburgh, RI 42672', 'Port Haleyhaven', '1993-07-07 08:51:00', 'Dignissimos error quis sequi voluptatem adipisci. Autem quia minus nisi earum. Qui illo expedita ad quia. Enim asperiores expedita qui magni ut.', 'Gold'),
(313, 0, '1983-08-06', 'Greenfelderport', 'DarkMagenta', 'Coral', 'Portugal', 'Not Select', 'sipes.heaven@example.com', '(683)666-6115x74867', 'Jamir Lemke I', '55434 Kaitlyn Burg\nGraysonport, OH 42949', 'South Rachaelmouth', '2003-08-27 20:42:13', 'Optio tempora labore quasi qui ab. Sit eligendi possimus numquam sed molestiae temporibus id. Est sed molestiae consectetur asperiores non totam nemo.', 'Free'),
(314, 2, '1997-11-14', 'West Ciara', 'SteelBlue', 'Green', 'Guyana', 'Not Select', 'posinski@example.com', '+42(1)2163149015', 'Ethan Davis', '25327 Nedra Well\nChristiansenport, IN 03951', 'Hoppeshire', '2006-01-18 20:47:47', 'Assumenda accusamus delectus expedita provident non accusantium. Eaque aut amet repellendus quisquam. Non vel voluptatibus aut itaque vitae quis. Quam officiis nihil eum.', 'Silver'),
(315, 2, '1988-04-17', 'Florianfurt', 'LightSalmon', 'Aqua', 'Fiji', 'Not Select', 'ambrose14@example.net', '(422)171-6389x860', 'Braxton Wyman II', '552 Simone Ramp\nBenstad, NY 99818-3502', 'Collierborough', '1977-06-24 01:40:10', 'Quidem consequuntur iusto quisquam corporis ad consequatur. Est quam hic eum alias. Architecto exercitationem dicta aspernatur ut laboriosam velit.', 'Premium'),
(316, 0, '1988-01-04', 'Israelview', 'GoldenRod', 'BlueViolet', 'South Africa', 'Female', 'amina15@example.org', '1-245-800-2936x81826', 'Dewayne Rosenbaum', '22536 Isac Isle\nWeissnatbury, NM 80656-1630', 'Johnsland', '1987-05-21 21:36:22', 'Aut qui corrupti culpa aut repellat est assumenda quos. Vero odio aliquam necessitatibus adipisci. Reiciendis consequuntur quia harum nam vel adipisci eaque quam. Doloribus est explicabo fugiat quod dolore.', 'Silver'),
(317, 0, '1996-04-13', 'East Donnell', 'Olive', 'MediumSeaGreen', 'Saint Pierre and Miquelon', 'Female', 'koepp.raul@example.org', '(508)422-8209', 'Jade Wisozk', '42325 Retta Streets\nWest Lexie, HI 87575-3669', 'Scottyburgh', '2015-07-29 03:28:42', 'Totam eum molestias eius qui. Dolor debitis quia aperiam.', 'Gold'),
(318, 1, '1992-12-05', 'Bennytown', 'MediumVioletRed', 'PaleGreen', 'Comoros', 'Not Select', 'lorna50@example.org', '479.299.6236', 'Alana Schmeler', '51782 Dereck Mall\nNew Lolaville, PA 20789-4790', 'Port Jamir', '1977-01-17 09:43:05', 'Ipsum sed et est. Et reprehenderit quaerat ut sed suscipit incidunt eos asperiores. Voluptatem voluptatibus ut officia suscipit temporibus. Et vitae tempora voluptatum nihil voluptatem consequatur.', 'Silver'),
(319, 1, '1979-08-17', 'Trompshire', 'Chartreuse', 'CadetBlue', 'British Indian Ocean Territory (Chagos Archipelago)', 'Male', 'sdubuque@example.org', '079-789-0760', 'Laila Gulgowski', '898 West Stream Suite 232\nKemmershire, SD 54537', 'Conroyport', '1987-10-18 20:45:01', 'Mollitia quis alias vel earum ipsa. Earum nobis minima reiciendis in sed. Quibusdam ut laudantium rerum illum et placeat. Veritatis omnis culpa odio velit maiores commodi. Nisi necessitatibus vero ipsa laborum cupiditate aliquam nobis.', 'Free'),
(320, 2, '1989-11-28', 'Angelicaside', 'LightCyan', 'Black', 'Turkey', 'Male', 'soberbrunner@example.com', '201.432.3336x62443', 'Melyna Reynolds', '44620 Judd Club Suite 928\nMcLaughlinside, MT 84972-5063', 'Lauriefurt', '2002-10-17 21:38:51', 'Iste dicta fuga similique accusamus libero atque corrupti et. Harum mollitia fugit qui ut. Aspernatur et illo animi dolores. Minus reprehenderit doloribus dolor rem repellendus reiciendis autem.', 'Premium'),
(321, 2, '1985-09-30', 'Brayanfurt', 'MediumOrchid', 'MediumBlue', 'British Virgin Islands', 'Female', 'liam.zieme@example.com', '376-171-8669x73814', 'Prof. Kevon D\'Amore III', '50953 Bonnie Islands Apt. 646\nNew Arvillaborough, MA 21783', 'Lindgrenville', '1987-11-28 21:17:55', 'Reiciendis dolores hic cupiditate. Et modi molestiae optio ut tempora nisi voluptatem. Dolore culpa voluptas ducimus quia non sunt quo.', 'Premium'),
(322, 1, '2001-09-14', 'Pfefferside', 'Wheat', 'Sienna', 'Kiribati', 'Not Select', 'kelsi33@example.org', '239.370.1736x6689', 'Trycia Moen II', '989 Pouros Stream Apt. 315\nKatrineberg, VT 66767-9851', 'Nasirville', '1992-02-07 19:14:29', 'Ab vero omnis aliquid est. Voluptate et qui ex temporibus. Aut sit omnis architecto ipsam excepturi. Et voluptates magnam suscipit ut odit omnis.', 'Free'),
(323, 0, '1973-03-14', 'East Rickside', 'Yellow', 'AliceBlue', 'Gambia', 'Female', 'pquigley@example.com', '1-336-334-0215x958', 'Claudine Carroll', '29329 Maia Dale Suite 265\nNehastad, IA 12384-5555', 'New Alexandra', '2000-02-07 16:14:50', 'Sequi at voluptas rerum omnis. Voluptate recusandae id delectus inventore. Quidem tempore labore dolor itaque itaque adipisci. Consequatur vitae aut beatae consequatur tenetur ut quaerat. Quam repudiandae qui quia illum impedit aperiam dolores.', 'Silver'),
(324, 2, '2006-01-29', 'North Carloston', 'DeepPink', 'SaddleBrown', 'Uruguay', 'Male', 'mills.vickie@example.org', '1-173-211-9161x645', 'Otho Wunsch', '50459 Kaela Pass Apt. 958\nSouth Breanna, AL 23639', 'North Deshaun', '2016-02-01 07:26:16', 'Laborum aliquam placeat omnis eius odio tempore quia. Quidem fuga quia hic ullam ea vel quisquam. Quibusdam perferendis molestias nihil dolorem dolores fuga in. Officia laborum rerum cupiditate natus.', 'Free'),
(325, 0, '1975-12-31', 'Gusikowskiview', 'MediumPurple', 'Tomato', 'Jordan', 'Female', 'sauer.anna@example.net', '1-405-922-4638x50009', 'Prof. Chauncey Swift', '5869 Heidenreich Row\nSchroederberg, NJ 56434', 'Shawnbury', '1999-04-02 21:01:33', 'Tempora et et ullam ut eum. Nostrum voluptatem et nesciunt possimus. Quisquam consequatur vel est inventore praesentium sint. Optio a amet dolorum dolor magnam vitae aut magnam.', 'Premium'),
(326, 2, '1997-12-07', 'West Assunta', 'LavenderBlush', 'FireBrick', 'Malawi', 'Male', 'reba.gulgowski@example.org', '386.526.3117x56294', 'Meredith Gutkowski', '4574 Christiansen Place Suite 816\nGraycemouth, SD 65185-2337', 'Bethanyview', '2020-12-23 02:39:03', 'Sit esse illo harum est odio. Esse sit aut quidem repudiandae pariatur minima eligendi. In velit sit laboriosam nulla. Voluptatibus illo accusantium quaerat.', 'Silver'),
(327, 0, '1989-04-27', 'North Rupertbury', 'HotPink', 'DarkTurquoise', 'Norfolk Island', 'Male', 'jordy.adams@example.org', '1-554-764-3994', 'Mertie Weber IV', '493 Reid Plains Apt. 639\nHettingerside, MT 15067', 'Carletonville', '2008-02-07 20:03:36', 'Qui architecto quo et. Iusto in unde fugiat voluptatem voluptas optio rem. Provident amet ut deleniti cum quam perspiciatis voluptas. Debitis quasi consequatur officiis ad.', 'Silver'),
(328, 2, '2013-01-12', 'Gleichnerfurt', 'Indigo ', 'Peru', 'Haiti', 'Female', 'elisa.morar@example.org', '(136)016-0667x192', 'Flo Stehr DVM', '6503 Miller Row\nPort Kayleightown, ID 65238-1082', 'East Cornell', '2007-05-28 21:32:10', 'Eum quia quas hic hic ipsam perferendis. Non molestiae adipisci qui eveniet. Fugit quasi qui sint illo eveniet recusandae. Sapiente debitis et temporibus at necessitatibus ut sit.', 'Gold'),
(329, 0, '2012-12-14', 'Mantebury', 'Darkorange', 'Green', 'Guadeloupe', 'Female', 'cesar.rolfson@example.com', '721-840-5227', 'Dr. Nicholaus Maggio MD', '0247 Heidenreich Valley Suite 959\nNew Miracleborough, AR 46394', 'North Jess', '2002-04-09 03:59:39', 'Temporibus et id labore odio amet non esse nihil. Aut quaerat et dignissimos rerum laborum voluptatem aut eum. Enim ipsa magnam velit maiores ut laborum dignissimos.', 'Free'),
(330, 1, '2019-11-07', 'Nienowview', 'Sienna', 'AntiqueWhite', 'Lesotho', 'Female', 'kerluke.kailyn@example.net', '(293)960-1866x048', 'Dr. Myrtle McClure', '3868 Glenna Prairie\nLake Suzanneside, WI 04890', 'Nicolasstad', '2001-05-19 14:51:58', 'Quia repudiandae vero quibusdam. Ducimus ratione accusantium ex doloremque ea similique. Et quod voluptas assumenda qui. Repellat facilis ipsa voluptatum ut.', 'Silver'),
(331, 0, '2012-09-06', 'East Elta', 'Orange', 'CadetBlue', 'Slovenia', 'Not Select', 'bvolkman@example.net', '018.981.0818x039', 'Vidal Hintz DVM', '685 Sigrid Mountain Apt. 389\nClaudieborough, NJ 20910-6408', 'North Rashad', '2014-12-24 17:05:07', 'Laudantium dicta unde aut eligendi ratione sit doloribus necessitatibus. Et voluptatum sunt voluptatum et. Rem atque magnam vel voluptas veritatis sit. Ea sint itaque sint laudantium qui dolorem.', 'Free'),
(332, 2, '2019-09-18', 'Croninmouth', 'HotPink', 'Aqua', 'Slovenia', 'Female', 'vallie81@example.com', '970.402.3787x71480', 'Dr. Waldo Rice I', '072 Urban Wells Apt. 075\nProhaskaland, ND 28366-7055', 'East Vivienport', '1976-10-02 21:01:45', 'Quo explicabo qui et consequatur et laudantium. Esse rem quae exercitationem quidem dolor et. Aut expedita maxime molestiae quidem et odit. Sed amet nihil laboriosam exercitationem voluptatibus eos nihil.', 'Free'),
(333, 0, '2006-11-10', 'Port Terrence', 'PaleGoldenRod', 'DarkBlue', 'Benin', 'Not Select', 'jett82@example.net', '(568)311-8083', 'Mrs. Pascale Stokes II', '9245 Bernhard Plains Apt. 472\nKingview, NC 56165', 'South Jayme', '2011-07-06 03:13:48', 'Inventore molestiae perferendis consectetur ut doloremque a quasi. Veritatis esse sit minima voluptatem aspernatur quaerat. Nihil sint aut laboriosam distinctio ducimus.', 'Silver'),
(334, 2, '1996-06-27', 'Lake Judah', 'DarkGoldenRod', 'LightCyan', 'Liechtenstein', 'Not Select', 'ethyl.jerde@example.org', '(111)797-9568x20456', 'Lambert Gislason', '328 Kattie Mountain Suite 305\nPort Kolbyton, HI 79167', 'East Jedhaven', '1970-03-24 04:06:49', 'Voluptatem officiis nemo minima voluptas deleniti voluptatibus. Magni omnis qui recusandae cupiditate qui iste. Veritatis suscipit sint hic et maiores aut rerum. Accusantium aspernatur dicta eius quo necessitatibus id autem quia.', 'Free'),
(335, 0, '2021-05-27', 'North Jeffrey', 'LimeGreen', 'Wheat', 'Denmark', 'Male', 'aortiz@example.org', '(067)733-9766', 'Jacky Jaskolski', '15216 Roberts Common\nEmeryton, CT 26372-2478', 'Griffinville', '2009-11-07 15:56:01', 'Doloremque sed eaque qui libero distinctio. Ut necessitatibus maiores eum maiores officia quo voluptatibus. Illum a at esse porro.', 'Free'),
(336, 2, '1983-09-09', 'Jacyntheport', 'DarkViolet', 'DarkGreen', 'Senegal', 'Female', 'iortiz@example.com', '02408563614', 'Jimmie Bartell', '142 Reynolds Spring\nRyanland, IL 72770-8474', 'Deborahstad', '2003-02-06 13:03:06', 'Veniam assumenda consequatur nihil autem earum omnis. Aspernatur nesciunt amet nisi illo ut blanditiis et sed. Fuga voluptate rerum alias non quis. Pariatur perferendis ullam vitae excepturi voluptates.', 'Silver'),
(337, 2, '2018-06-01', 'Baumbachmouth', 'Pink', 'PaleGreen', 'Mauritius', 'Male', 'ashlynn.rowe@example.com', '(205)555-2234x603', 'Ramon Mills', '91788 Dane Mountain\nPort Lennytown, MN 53390-2179', 'West Terrillfort', '2009-08-17 02:18:01', 'Voluptates dolor incidunt qui quisquam. Placeat dolore ea non. Laborum enim omnis occaecati voluptate. Reiciendis voluptates impedit necessitatibus voluptas ex repellendus aperiam.', 'Silver'),
(338, 2, '2020-08-27', 'Vandervortmouth', 'Aquamarine', 'DarkKhaki', 'Costa Rica', 'Female', 'blick.bo@example.com', '(034)589-7511', 'Ashlynn Wintheiser', '453 Lowell Creek Apt. 836\nChristophermouth, CT 93094', 'Jacobshaven', '2004-12-08 16:30:24', 'Id dolorem minima suscipit dolor quia. Blanditiis quam cumque voluptas dicta beatae consequatur eos. Repellendus sint id illum tenetur fugiat sit et.', 'Free'),
(339, 2, '2021-12-13', 'West Syble', 'HoneyDew', 'BlanchedAlmond', 'Korea', 'Not Select', 'kenyon05@example.com', '03566778577', 'Gennaro Schmidt', '594 Blanca Burgs\nDuBuquechester, MD 46132', 'East Judson', '1987-10-13 23:50:39', 'Quod aut voluptates repellendus sint sit repellendus dolore. Repellat molestias quo repellendus officiis deleniti. Optio a rerum vel delectus. Odit incidunt qui sed aut eius.', 'Silver'),
(340, 0, '1983-09-26', 'New Joshuaborough', 'Darkorange', 'Green', 'Senegal', 'Not Select', 'xkessler@example.net', '768-934-9210x5875', 'Juwan Schmeler', '71671 Maiya Summit\nSouth Felipashire, SC 06954', 'Baumbachmouth', '2017-03-06 21:19:23', 'Dicta accusamus vel consequatur accusantium architecto. Quia est aut non ut qui sint esse. Eum velit maiores possimus iure sint saepe. Vitae enim omnis voluptatem saepe suscipit.', 'Premium'),
(341, 2, '1986-02-05', 'Mayertshire', 'Azure', 'SlateGray', 'Cyprus', 'Female', 'davion68@example.org', '1-857-671-3006x34042', 'Prof. Lempi Stroman IV', '823 Brakus Course\nKyliefurt, NH 76869', 'South Destineyton', '1974-11-02 21:05:41', 'Consequatur quam quisquam dolorem sit a error enim. Est molestiae et iure delectus sit perferendis. Nihil omnis fugit sunt. Amet est dolor voluptatem molestias sint quo.', 'Silver'),
(342, 2, '1979-02-23', 'New Abbie', 'PaleVioletRed', 'Linen', 'Palestinian Territory', 'Female', 'eino45@example.org', '1-590-028-6707x2012', 'Alexandra Heller', '4356 Doyle Mountain\nElenormouth, CT 31298-4323', 'East Brandonport', '2001-11-02 01:46:25', 'Perferendis deleniti enim facilis in facere quia ut. Et et molestiae deleniti similique natus doloremque. Voluptatem aperiam sed minima totam atque nihil ut. Voluptatem doloremque doloremque alias consequatur nisi.', 'Free'),
(343, 1, '2012-04-02', 'New Richie', 'GreenYellow', 'MediumSpringGreen', 'Antigua and Barbuda', 'Not Select', 'friesen.kareem@example.org', '06070160210', 'Toby Sporer Sr.', '2071 Nikita Tunnel Apt. 749\nBohaven, ID 81294', 'Mathiastown', '2017-08-04 19:58:14', 'Ut consequuntur expedita quis voluptatem maxime. Sunt sunt maiores ipsum vitae et necessitatibus in. Porro sit maiores aut dolore.', 'Free'),
(344, 1, '1978-08-06', 'Tinabury', 'LightSlateGray', 'SlateGray', 'Malawi', 'Not Select', 'emmerich.hoyt@example.net', '1-183-831-1856x17212', 'Prof. Theodore Wunsch II', '45951 Rippin River\nCronaland, SC 93079-1737', 'Jaysonberg', '1973-01-13 15:40:50', 'Saepe veritatis corrupti ipsam officiis ducimus possimus. Sed est voluptates quibusdam. Itaque magnam magnam necessitatibus atque in saepe.', 'Silver'),
(345, 1, '2020-05-02', 'Maryamchester', 'DarkOliveGreen', 'MediumVioletRed', 'Trinidad and Tobago', 'Male', 'alana23@example.net', '(012)164-9134x483', 'Art Schowalter', '68847 Dan Knolls Suite 929\nTiffanymouth, AR 70059', 'Brittanyshire', '1985-10-14 15:12:04', 'Rerum commodi blanditiis quis. Qui quas earum nemo culpa sunt voluptatem omnis. Similique et atque mollitia.', 'Gold'),
(346, 2, '1984-07-19', 'South Edmond', 'Darkorange', 'YellowGreen', 'Falkland Islands (Malvinas)', 'Male', 'solon.fadel@example.com', '099-848-2838', 'Brandon Feest', '014 Miller Tunnel\nFredyview, AZ 07963-3978', 'Port Lawsonmouth', '2014-07-03 10:20:55', 'Totam suscipit deserunt libero dignissimos et. Et nihil sit odio inventore. Inventore aut totam eum iure deleniti molestiae. Ut ducimus nam velit aut.', 'Gold'),
(347, 0, '1971-09-22', 'Huelstad', 'FireBrick', 'Indigo ', 'India', 'Male', 'haley.name@example.net', '922-692-1424x801', 'Alene Schmitt', '5201 Beer Haven\nBaileybury, SD 35002', 'East Laurenshire', '1988-12-28 20:25:49', 'Incidunt est ut provident eum possimus voluptatem. Aut dolorem a debitis ullam.', 'Gold'),
(348, 1, '1975-11-15', 'New Aryannamouth', 'SlateBlue', 'Linen', 'China', 'Male', 'tleffler@example.com', '1-306-337-2046x433', 'Hugh Terry', '038 Quigley Track\nBoganfurt, MO 32252-8718', 'Steuberborough', '2003-09-23 05:45:45', 'Minus et reprehenderit fugiat aut quasi omnis et. Esse voluptates quia repellat ut voluptatibus explicabo cumque. Temporibus fugiat adipisci ut a facilis quas exercitationem. Nisi praesentium totam est quidem sit praesentium facilis. Quis quia unde odit n', 'Premium'),
(349, 2, '1983-01-02', 'Eliezerstad', 'Silver', 'Brown', 'Botswana', 'Male', 'ykozey@example.org', '(766)066-4338', 'Garland Lemke', '8647 Runolfsson Underpass Suite 810\nLake Kylie, RI 88908-3221', 'New Drakefurt', '2012-07-04 21:52:26', 'Sit accusantium error et id et voluptas tempore. Id odit voluptates hic sunt sit veritatis veritatis aliquid.', 'Gold'),
(350, 2, '1984-02-29', 'Langfort', 'SkyBlue', 'SaddleBrown', 'Haiti', 'Not Select', 'pwelch@example.net', '1-995-815-9443x209', 'Damion Krajcik', '34627 Abdullah Turnpike Apt. 195\nDarrickton, TN 13709-4331', 'Joannytown', '2013-07-27 16:49:24', 'Officia accusantium id cumque. Nesciunt non ducimus necessitatibus corrupti debitis quidem sint. Assumenda cupiditate ea mollitia et veniam. Voluptas quas minima impedit ducimus.', 'Silver'),
(351, 0, '1970-08-06', 'Elzaland', 'GreenYellow', 'Gray', 'Ireland', 'Male', 'karlie.vandervort@example.com', '1-552-934-7106', 'Miss Elvie Windler', '1500 Arturo Dale\nRemingtonland, PA 68281-7161', 'Lake Alvina', '1986-12-18 06:06:58', 'Unde illo deleniti ducimus maxime unde doloremque dolorem. Quo aliquid quis qui itaque expedita nisi architecto. Accusantium hic eum dolore et debitis deleniti explicabo. Perferendis similique eum dicta qui aut voluptas at.', 'Gold'),
(352, 1, '2013-06-15', 'Kennyshire', 'MediumPurple', 'Salmon', 'Nauru', 'Male', 'xthompson@example.com', '604-403-6739', 'Dr. Judson Gleichner Sr.', '95841 Grady Land\nMcCulloughberg, GA 22390-2508', 'Ceciliaberg', '1978-09-18 19:32:43', 'Ut qui nesciunt aperiam repudiandae similique repellendus reiciendis. Voluptatibus a nihil omnis vitae dolores et fugit. Rerum odit voluptatem neque blanditiis consequuntur enim. Tempore aut omnis et non necessitatibus quia.', 'Gold'),
(353, 2, '2020-08-01', 'Quigleyfort', 'DarkGoldenRod', 'Coral', 'Uganda', 'Male', 'pkling@example.net', '029.171.3709x033', 'Darrick Dach', '92794 Madyson Mall\nHettingerberg, AL 89944-4456', 'Moorechester', '1974-04-26 09:58:21', 'Vel et molestias molestiae. Sunt fugiat in nulla tempore aut. Eius voluptas id sint quas. Esse possimus cum nihil aut id corrupti unde.', 'Silver'),
(354, 0, '1993-04-05', 'Millermouth', 'LightSteelBlue', 'BurlyWood', 'Faroe Islands', 'Not Select', 'leanna24@example.com', '892.678.1878x9089', 'Prof. Anais Hoppe', '3897 Trevion Creek\nJohannhaven, NJ 87684-5040', 'Vinceview', '2001-11-05 22:35:14', 'Voluptatem aut illum voluptatem odio magnam nesciunt. Ipsum tempore autem illum sapiente. Consequatur molestias est quia ut. Aliquam nihil vel vel odit totam officia.', 'Gold'),
(355, 0, '2009-12-24', 'McClureborough', 'Maroon', 'LavenderBlush', 'Ecuador', 'Female', 'fhowell@example.net', '09290345562', 'Peyton Murazik IV', '1898 Mckayla Groves\nKingshire, NC 15181-4231', 'North Leonorfurt', '2001-11-27 04:56:58', 'Consequuntur praesentium voluptatem ratione at. Quibusdam voluptatibus dolorem culpa quia tempora nulla blanditiis. Hic voluptas delectus libero quidem quasi voluptate explicabo.', 'Silver');
INSERT INTO `individual` (`id`, `status`, `date_of_birth`, `place_of_birth`, `church_name`, `organization`, `country`, `gender`, `email`, `phone`, `name`, `address`, `city`, `since`, `description`, `packet`) VALUES
(356, 1, '2004-03-07', 'Swaniawskitown', 'MediumOrchid', 'LightSalmon', 'Hong Kong', 'Not Select', 'minnie41@example.net', '233-467-6367x555', 'Prince Dickinson', '2937 Krajcik Manors\nNorth Adrian, MD 81815-8216', 'Feilburgh', '1999-06-04 06:01:54', 'Quia iure id laboriosam dignissimos veniam et consequatur. Enim est quia velit et ipsam. Sed et molestiae possimus fugit. Ut quae quibusdam labore quia fugit provident.', 'Free'),
(357, 2, '1986-09-05', 'Joannyville', 'Cornsilk', 'Khaki', 'Cyprus', 'Female', 'ufunk@example.org', '528-469-7568x116', 'Nova Koelpin', '1109 Keeling Viaduct\nNorth Eriberto, OR 90395-9078', 'Teresastad', '1988-06-17 04:18:57', 'Illum nihil explicabo saepe officia at porro dolore blanditiis. Consequatur dolor eveniet autem quia quis culpa. Aliquam omnis sint enim nulla ut fugit. Veritatis aut qui molestiae ut iusto.', 'Free'),
(358, 2, '2000-07-08', 'Rahsaanshire', 'Teal', 'SlateBlue', 'Syrian Arab Republic', 'Female', 'marilyne.orn@example.net', '05323873342', 'Blaise Kovacek', '232 Armando Way Suite 625\nJohathantown, WY 41988', 'South Shanechester', '2007-04-02 12:00:35', 'Et amet similique ea quae in tenetur soluta. Culpa ab minima sit qui.', 'Free'),
(359, 2, '1987-11-30', 'North Daijaland', 'Cyan', 'ForestGreen', 'France', 'Female', 'brice06@example.net', '701-336-7462', 'Dr. Bernice Stroman II', '5770 Lavina Run\nWildermanville, AL 96197-8700', 'Dareton', '1993-08-14 07:41:27', 'Laborum ut rerum fuga et debitis molestiae sed. Architecto reiciendis repellat sed porro ullam alias recusandae. Reiciendis omnis maxime et fugit iusto ab ipsa.', 'Premium'),
(360, 0, '2002-10-01', 'South Yasmeen', 'Orchid', 'NavajoWhite', 'Sao Tome and Principe', 'Male', 'reese58@example.com', '1-636-299-2406x72056', 'Zella Heller Jr.', '61951 Sheldon Island\nLake Kathryn, NV 61824', 'South Kariview', '2005-11-19 07:08:38', 'Facere ex sit assumenda deleniti quia aut enim quia. Nihil quibusdam ipsam quia est non possimus quam. Ut assumenda esse qui quis ipsa.', 'Premium'),
(361, 2, '1985-06-19', 'South Cleorashire', 'PaleVioletRed', 'DarkGreen', 'Heard Island and McDonald Islands', 'Female', 'moen.juliana@example.net', '177.977.1654', 'Nasir Schmeler', '341 Vinnie Isle Suite 441\nJaidenside, GA 68711-3728', 'Port Carsonview', '2008-11-16 02:47:58', 'Autem quos accusamus consequuntur dolorem qui. Aspernatur qui recusandae facere dolores ipsa ullam. Sapiente et eligendi nobis ipsum rerum et. Nam voluptatibus temporibus tenetur quidem qui.', 'Silver'),
(362, 0, '2002-05-01', 'Bartolettistad', 'Cornsilk', 'Gold', 'Ethiopia', 'Female', 'javon27@example.com', '106-346-5492', 'Mrs. Savanna Roberts PhD', '75821 Cleta Key Apt. 116\nLouiebury, OR 57351', 'East Lonnie', '2009-05-18 08:41:04', 'Consequatur molestiae et ipsum fugit alias aperiam. Voluptas in necessitatibus eaque dolor voluptas consequatur ipsa. Id labore illo explicabo nulla.', 'Free'),
(363, 2, '1995-07-02', 'Lake Margieside', 'Orchid', 'RosyBrown', 'Somalia', 'Not Select', 'deshaun21@example.org', '496.275.6741', 'Fay Dickinson PhD', '299 Nitzsche River\nDustinmouth, AR 90529-7784', 'East Berthachester', '2019-03-03 10:53:06', 'Cum doloremque nostrum ea et occaecati. Magni unde accusantium quo impedit deleniti. Totam commodi aspernatur dolorem labore eius dolorem omnis autem. Doloremque praesentium expedita aperiam et.', 'Premium'),
(364, 0, '2003-01-04', 'Kesslerport', 'Beige', 'Chocolate', 'Albania', 'Female', 'bstiedemann@example.com', '+84(2)3460339906', 'Mr. Darrick Reynolds DVM', '03982 Katrina Summit Suite 640\nEast Daryl, AR 43005-8845', 'Port Marilou', '2015-04-29 20:41:09', 'Ratione necessitatibus est quod nemo qui in. Odio ex tempore ea hic aut dolorem eos. Minus cum rerum incidunt atque et reiciendis.', 'Gold'),
(365, 2, '1973-01-09', 'Maureentown', 'Thistle', 'LightPink', 'Iran', 'Male', 'abbott.ubaldo@example.org', '(896)154-3361x774', 'Zetta Leuschke', '06076 Hartmann Groves Apt. 180\nIlaton, TX 83399', 'Arnulfofort', '2001-08-16 06:49:03', 'Et libero fugiat in aperiam et totam exercitationem nihil. Et consequatur id eligendi maxime. Suscipit animi culpa non vel neque aspernatur eius. Nam vel quisquam dolor.', 'Free'),
(366, 2, '1993-01-26', 'East Lavon', 'PaleGoldenRod', 'LightSkyBlue', 'Cote d\'Ivoire', 'Female', 'xkessler@example.net', '1-925-837-9758', 'Wallace Parisian', '78249 Jason Prairie Suite 797\nPort Ariville, ME 27801-5958', 'Howellview', '1971-01-15 12:01:34', 'Eos nemo repellendus dolore explicabo praesentium. Facilis et sed nesciunt consequatur. Nihil itaque omnis ipsum et quia.', 'Premium'),
(367, 2, '2020-10-14', 'Emmachester', 'Azure', 'LightSteelBlue', 'Senegal', 'Female', 'kkrajcik@example.net', '431-018-7805x252', 'Norwood Crist', '462 Savannah Falls Apt. 743\nNew Clotildefort, KS 77886', 'West Jarred', '1974-03-15 03:15:48', 'Iusto et quod itaque quis quia ipsum. Molestiae explicabo dolor eius recusandae officia et. Facere ut provident minima unde molestiae. Perferendis est dolore eligendi consectetur quis.', 'Premium'),
(368, 0, '2006-02-09', 'Sanfordchester', 'LightYellow', 'Brown', 'Senegal', 'Female', 'kacie46@example.com', '1-056-376-4235', 'Mr. Jadon Bergnaum PhD', '65981 Heidenreich Trace Suite 240\nNorth Janyville, FL 75761', 'Jackborough', '1975-12-06 10:24:42', 'Maxime ut ut distinctio officiis. Et dolorum minima quasi vitae. Corporis reiciendis ex possimus accusantium quia est sed dicta. Recusandae nihil aliquam exercitationem quis libero.', 'Gold'),
(369, 0, '1977-06-25', 'North Erik', 'Violet', 'Moccasin', 'Egypt', 'Male', 'zluettgen@example.com', '961-441-2083x5721', 'Buford Braun', '481 Smitham Haven\nPort Montanaland, ID 59315-5054', 'Lake Reymundoton', '1982-02-11 03:56:07', 'Sed consectetur nihil enim nesciunt. Officia sunt dolores ut facere quia sit. Est ipsa voluptas facilis dolores culpa ex et eius.', 'Free'),
(370, 1, '1970-05-20', 'Borerburgh', 'GhostWhite', 'LavenderBlush', 'Czech Republic', 'Not Select', 'htremblay@example.org', '(744)643-3871x976', 'Oren Lakin', '19829 Loma Springs Apt. 694\nEast Carson, WA 38491-7570', 'Riverstad', '1977-03-19 14:16:39', 'Sequi placeat repellendus optio officia doloribus distinctio. Quaerat et recusandae sit illo reprehenderit ea unde omnis. Ipsam odit porro ut sed est.', 'Free'),
(371, 0, '2015-09-24', 'Port Modesta', 'LightSalmon', 'Orchid', 'Bolivia', 'Male', 'coby.o\'conner@example.net', '(109)303-0034x6266', 'Miss Amely McKenzie DDS', '5079 Labadie Track Apt. 570\nProsaccoborough, RI 08912-5984', 'Verniceshire', '1975-06-26 14:16:43', 'Eligendi et ad amet iusto maiores et eos. Ducimus nemo et aut qui nobis quam voluptas. Distinctio ab consequatur rem consequuntur. Et perferendis porro enim.', 'Gold'),
(372, 0, '1999-12-04', 'South Sydney', 'Tan', 'Tan', 'Argentina', 'Female', 'funk.raymundo@example.org', '(801)634-1411x993', 'Waino O\'Hara', '73709 Terrill Flats Apt. 717\nKovacekmouth, IL 23924', 'South Nelsport', '2003-04-01 21:11:58', 'Molestiae ducimus qui inventore modi quia quia voluptatem. Ut suscipit sed sunt maxime recusandae dicta. Et cum perferendis non temporibus fuga. Sit facilis quo et quia perferendis sequi. Voluptates sequi qui necessitatibus ab commodi est dolores.', 'Premium'),
(373, 0, '2021-11-01', 'West Jazlyn', 'RosyBrown', 'RoyalBlue', 'Timor-Leste', 'Male', 'marta.connelly@example.net', '461.979.2814', 'Prof. Ignacio Wilderman', '66653 Jeramy Gateway Apt. 634\nNew Abbigailfurt, KS 31412', 'Lake Saraichester', '2016-02-26 14:56:49', 'Ea dicta non laboriosam quia in. Molestiae est officiis doloremque aut quas architecto. Vel occaecati sed ipsa eum quibusdam consectetur. Voluptates fuga amet fugiat odit autem aperiam commodi.', 'Silver'),
(374, 1, '2017-10-14', 'Myrtieport', 'Darkorange', 'Lime', 'Sao Tome and Principe', 'Female', 'rbreitenberg@example.org', '1-370-358-7158x0117', 'Mafalda Casper', '9906 Braeden Isle Suite 379\nWestleyborough, ME 79671', 'New Rico', '1972-03-07 13:53:20', 'Voluptatem fuga iusto voluptate. Nesciunt odit doloremque fuga reprehenderit possimus vel architecto. Veniam enim error cupiditate neque dolores laudantium eaque.', 'Premium'),
(375, 0, '2017-07-04', 'Lake Bernita', 'SlateBlue', 'LightSteelBlue', 'Burkina Faso', 'Male', 'pkreiger@example.org', '1-784-681-9146x91293', 'Jerald Moen', '6185 Madelyn Ville\nNew Patsytown, VT 16764', 'Claudemouth', '2000-04-29 12:08:15', 'Distinctio debitis corporis vel aut accusamus consequuntur doloremque. Ipsum quae vitae voluptas ex. Animi error qui sed voluptas omnis.', 'Premium'),
(376, 1, '1983-05-10', 'Kellieton', 'SaddleBrown', 'MediumVioletRed', 'Paraguay', 'Not Select', 'roberts.erick@example.com', '09738252314', 'Rowan Kutch', '298 Theodora Plaza Suite 552\nNyasiamouth, ME 66141', 'Stehrtown', '2019-09-05 15:14:41', 'Deleniti quae porro ducimus quis voluptate cum. Nulla non illum ut blanditiis voluptatem. Officia neque quis maxime quis sit rerum reiciendis. Quis expedita et iste itaque quisquam.', 'Silver'),
(377, 0, '1998-08-11', 'West Antonetta', 'MediumVioletRed', 'Coral', 'Falkland Islands (Malvinas)', 'Not Select', 'borer.drake@example.net', '+49(5)0633771770', 'Michael Hyatt', '039 Nina Villages\nAlainaland, WY 67401-0316', 'Hegmannberg', '1976-01-23 08:35:14', 'Eum modi veritatis maxime expedita provident illum. Ipsa laboriosam repellat deserunt voluptas. Consectetur vel minima sit quisquam. Occaecati fuga velit fugit totam.', 'Silver'),
(378, 1, '2006-12-19', 'Jacobsonstad', 'LavenderBlush', 'Wheat', 'Montenegro', 'Not Select', 'nwintheiser@example.org', '(254)494-1914x1275', 'Miss Graciela Stanton', '48000 O\'Conner Courts Suite 431\nDavisburgh, CO 22160', 'West Greenberg', '1975-01-10 13:04:08', 'Vel vero esse atque. Amet aliquid dolorem qui ullam eum voluptas officiis. Ut atque ut qui sint eos aperiam. Adipisci blanditiis aut eum veritatis harum.', 'Premium'),
(379, 2, '2007-02-23', 'Langoshside', 'ForestGreen', 'SpringGreen', 'Canada', 'Male', 'pwyman@example.com', '559.285.4075', 'Palma Krajcik', '7575 Padberg Ridges\nWest Anastasia, FL 88212-4296', 'Lemkeport', '2016-05-18 15:09:57', 'Et sit hic natus quia et modi beatae. Eaque mollitia ducimus vel iste voluptatum ut ut consequuntur. Facilis facilis quae esse reprehenderit sit. Est quo facere sed nihil velit ex veniam.', 'Premium'),
(380, 1, '1970-10-01', 'Port Darrelville', 'CadetBlue', 'LightGray', 'Armenia', 'Female', 'lorna.vonrueden@example.com', '(361)787-0811', 'Audra Denesik', '92885 Creola Gateway Suite 566\nMathewchester, FL 29433', 'Port Gregoriochester', '2012-08-24 18:26:38', 'Quia nostrum debitis dolorum sunt laboriosam ipsum vel. Provident velit voluptatum aut distinctio optio minima ab. Assumenda eligendi nobis ipsam impedit excepturi eligendi officiis.', 'Gold'),
(381, 0, '1994-11-05', 'Andreanemouth', 'Gold', 'Purple', 'Montenegro', 'Female', 'murray.kendrick@example.org', '503.620.4313x751', 'German Konopelski', '34918 Bernier Lodge\nSouth Lorineton, WA 55914-8908', 'Francesfort', '2000-10-11 19:14:32', 'Doloribus labore et tempora ut doloribus accusamus. Dolor laboriosam voluptatum impedit eaque. Libero perspiciatis at porro minus totam ut consequuntur.', 'Free'),
(382, 2, '1999-09-26', 'Lake Dameon', 'LightSeaGreen', 'MediumOrchid', 'Timor-Leste', 'Female', 'mortimer84@example.com', '(725)283-6295', 'Omer Paucek', '494 Wiza Underpass\nSouth Ethelynborough, AL 09219', 'Goldnerview', '2016-03-31 14:32:31', 'Quae deserunt ullam dicta molestias. Fugit atque voluptatem consequatur libero inventore excepturi.', 'Premium'),
(383, 1, '2014-11-07', 'Margretfort', 'Peru', 'MediumBlue', 'Micronesia', 'Not Select', 'rodrigo39@example.org', '1-866-499-5916x3506', 'Zena Hilll', '980 Wilbert Flats Apt. 842\nBrandimouth, OR 31648-0650', 'West Haylieport', '2008-05-25 07:14:30', 'Quod officiis debitis molestiae cupiditate quo quam. Qui assumenda adipisci incidunt. Et rerum facere nesciunt esse saepe et corporis.', 'Premium'),
(384, 1, '2012-03-24', 'North Suzannestad', 'HotPink', 'Lavender', 'France', 'Male', 'urban53@example.com', '417.425.5002x9558', 'Viola Robel', '62257 Geovany Wells Apt. 329\nMrazside, AZ 56753', 'Johnsbury', '1997-04-27 22:57:19', 'Ut et unde ea officia voluptas est reprehenderit. Laboriosam et quis quia cum quia alias dolore nihil. Neque non occaecati ratione earum quia sequi voluptate voluptatem.', 'Gold'),
(385, 0, '1994-09-22', 'West Darbymouth', 'Cornsilk', 'Indigo ', 'El Salvador', 'Female', 'vweber@example.org', '590-151-0952x9714', 'Mr. Kristoffer Crist', '5863 Sawayn Road Apt. 861\nGavinview, MD 19209-3557', 'Hagenesmouth', '2017-11-08 14:25:27', 'Harum magni vel illum. Nihil tenetur cumque dolores aliquid reprehenderit tempora. Rem distinctio dolores eius. Architecto enim ea ducimus quos et quo cupiditate facere. Quod qui dolor placeat eos veritatis sed.', 'Silver'),
(386, 2, '1975-01-06', 'East Sidney', 'Salmon', 'Gainsboro', 'Solomon Islands', 'Male', 'katlyn.kassulke@example.com', '1-368-126-6544x00885', 'Adaline Herzog', '495 Frami Bridge Apt. 339\nWolfhaven, KY 67852', 'Ahmadport', '1997-02-03 15:49:39', 'Ducimus reprehenderit iste totam dolores provident. Delectus et accusamus alias autem in adipisci est quas. Adipisci veniam dolores quia voluptatibus.', 'Premium'),
(387, 1, '1972-12-23', 'North Agnesstad', 'SaddleBrown', 'AntiqueWhite', 'New Caledonia', 'Female', 'tessie.nicolas@example.net', '1-596-118-9794', 'Candida Price', '19921 Shanahan Heights\nDelfinafurt, SC 03573-6058', 'West Zacharyland', '1997-12-13 23:09:56', 'Quis velit magni sed quis. Quidem sapiente quis corporis iste. Laudantium aspernatur illum et eum eveniet quaerat.', 'Silver'),
(388, 0, '1975-03-10', 'North Laney', 'Snow', 'MediumSeaGreen', 'Slovenia', 'Female', 'bauch.percy@example.com', '1-715-291-5991x821', 'Zora Smith DVM', '690 Littel Parkways Suite 981\nEast Marcus, SD 72542-9963', 'Tillmantown', '2006-10-03 20:18:05', 'Eum tenetur ipsum rerum unde accusamus maxime quaerat. Iusto blanditiis totam voluptatem et ab. Et laudantium quo occaecati laudantium quae. Aspernatur praesentium dolores est laborum.', 'Silver'),
(389, 1, '1983-09-06', 'Welchbury', 'Black', 'SlateBlue', 'Germany', 'Female', 'mikel21@example.com', '(620)972-3510x84202', 'Mr. Hilario Lind', '31008 Winnifred Parkway\nWest Grayce, PA 25417', 'North Alena', '2000-09-09 15:20:49', 'Dolorum molestiae et excepturi ipsa aut occaecati voluptas modi. Dolorem magni omnis saepe deserunt. Explicabo aut modi molestias iste vel consequatur deserunt.', 'Silver'),
(390, 1, '1976-03-19', 'West Jaimeshire', 'Aqua', 'LightCyan', 'Nepal', 'Female', 'jcrist@example.com', '(190)871-2149x74420', 'Jacklyn Fadel', '6871 Ullrich Branch Suite 127\nNew Maci, MI 74176-5344', 'Howellberg', '1993-08-10 16:52:50', 'Nesciunt totam quis optio ut. Laudantium magnam suscipit delectus optio. Totam sed consequatur est a. Sed ratione voluptatem saepe dolores omnis qui. Dolor unde laboriosam odit qui veniam deleniti.', 'Free'),
(391, 2, '1973-10-02', 'Armstrongmouth', 'RoyalBlue', 'OliveDrab', 'British Indian Ocean Territory (Chagos Archipelago)', 'Not Select', 'dbeier@example.net', '796.277.5878x1456', 'Prof. Torrance Ondricka', '0551 Moen Station Suite 454\nBarryhaven, PA 49398', 'Esmeraldastad', '2015-05-29 13:21:04', 'Iure eaque vero neque est modi qui. Earum quisquam labore voluptatibus ut nam reprehenderit. Accusantium expedita voluptatum deserunt atque. Culpa vel suscipit error similique rerum sunt qui.', 'Gold'),
(392, 1, '1995-02-18', 'East Adalberto', 'Green', 'Coral', 'Equatorial Guinea', 'Male', 'wbailey@example.org', '(232)129-9794x5022', 'Dr. Neva Kuhn II', '542 Blanca Divide\nPort Millerstad, AK 25361', 'New Silas', '1988-12-22 16:57:18', 'Sit perferendis molestiae nisi facere sit laborum. Ut enim aut in delectus sequi eaque optio. Sunt voluptate commodi vitae sint in dignissimos reprehenderit.', 'Gold'),
(393, 0, '1973-01-21', 'New Dahlia', 'SaddleBrown', 'RoyalBlue', 'Japan', 'Not Select', 'pollich.cayla@example.com', '1-142-347-1375x16999', 'Humberto Bashirian', '792 Victor Court Suite 204\nSchusterburgh, AR 23160', 'Lake Trace', '2015-07-22 18:39:26', 'Alias voluptatem dolorem reprehenderit non eos sunt eveniet incidunt. Occaecati eos tenetur esse aspernatur. Reiciendis expedita praesentium voluptas nam dolore dolorum debitis. Et ea repellendus reprehenderit nam est facilis doloremque repellat. Accusamu', 'Free'),
(394, 0, '1977-03-30', 'Brakusbury', 'HotPink', 'Fuchsia', 'Jamaica', 'Female', 'gracie.cruickshank@example.org', '(205)870-5482x0492', 'Finn Emmerich', '16685 Therese Way Suite 714\nSouth Meagan, MT 58012-4292', 'Colemouth', '2000-01-17 06:30:36', 'Sequi magnam et incidunt. Aspernatur excepturi laboriosam nemo cupiditate sed. Eligendi similique enim quis eos molestias nesciunt non. Provident alias dolore sit voluptas alias rerum.', 'Gold'),
(395, 2, '1977-09-03', 'Lake Oswaldo', 'IndianRed ', 'Navy', 'Tokelau', 'Female', 'wolff.casimir@example.org', '1-077-161-9214x03870', 'Lura Yundt', '582 Zachary Points Apt. 778\nWest Ophelia, MN 55677', 'Blandatown', '2005-04-02 14:51:02', 'Aut voluptatem autem atque. Nihil sit sit perspiciatis deserunt ex. Quae veniam veniam odit itaque vero qui quia.', 'Free'),
(396, 1, '2013-05-05', 'Everettport', 'BlueViolet', 'Maroon', 'Ecuador', 'Not Select', 'gskiles@example.net', '795-851-6535', 'Jonatan Hilll', '7819 Shad Track\nWest Elnaside, LA 74987', 'West Carson', '1978-03-15 09:06:11', 'Ex aliquid ea molestias voluptas et animi suscipit quam. Itaque maxime consequatur ea saepe. Soluta non sit ad sed dolor quis.', 'Gold'),
(397, 1, '2018-08-26', 'Torpville', 'Magenta', 'MediumBlue', 'Central African Republic', 'Female', 'cole.lincoln@example.net', '100.411.1061x814', 'Ms. Antonetta Fahey Sr.', '426 Hills Overpass\nNorth Brian, MT 14781', 'Lake Madilyn', '2019-07-02 22:08:53', 'Magni quos in voluptas est. Ad mollitia esse animi quia illo eum. Id eius dicta sunt commodi quia beatae. Sunt rerum deserunt aspernatur eligendi. Libero quia aut at excepturi.', 'Premium'),
(398, 1, '1991-12-27', 'Destinfurt', 'Navy', 'MediumTurquoise', 'Sri Lanka', 'Male', 'nnikolaus@example.com', '1-730-696-4460', 'Declan Harvey', '6283 Beatty Plain\nPort Pearlfort, NH 74464', 'North Kennithberg', '1997-07-22 13:49:29', 'Facilis ducimus ut et nostrum. A illum accusamus rem amet reprehenderit quo et. Laudantium sunt numquam ullam ipsam quisquam. Iure et provident dolor est omnis.', 'Free'),
(399, 0, '2003-01-26', 'Baileefort', 'Tan', 'MediumSlateBlue', 'Netherlands', 'Female', 'parker.jaylin@example.com', '01064581084', 'Samson Ziemann', '430 Jenkins Plain Suite 203\nLake Charlie, DC 52689', 'Port Amelyshire', '2004-12-19 21:45:46', 'Perspiciatis eum sint dolor et mollitia itaque iusto. Repellendus iste incidunt quos ipsa minima dolores tempore. Quo consectetur nisi occaecati in sed.', 'Silver'),
(400, 1, '1990-12-28', 'Alexaville', 'LightSeaGreen', 'DarkMagenta', 'Ecuador', 'Male', 'antwon.hammes@example.net', '334-966-2567x81091', 'Mrs. Sandra Schumm IV', '6111 Stokes Throughway\nTheresiaville, OH 99658-4899', 'Gislasonland', '2019-11-29 07:06:21', 'Doloribus debitis id quaerat ex voluptatibus laudantium. Quibusdam ullam officia iste omnis at occaecati. Qui quis ullam et asperiores quos. Ad et debitis cumque dolorem dolores. Illum repellat id sunt perferendis fugit.', 'Silver'),
(401, 1, '1986-03-08', 'Carrollview', 'OliveDrab', 'DarkSeaGreen', 'Somalia', 'Not Select', 'mccullough.dahlia@example.com', '558-773-6362x694', 'Therese Kreiger', '0052 Kutch Lakes Suite 205\nLemkeburgh, SD 44397-1475', 'Elwynhaven', '2007-01-06 07:36:28', 'Dolore vero iusto non eaque. Rerum provident aliquid ullam illum doloribus et voluptatem. Consequatur quisquam doloremque repellat assumenda.', 'Free'),
(402, 1, '2018-01-15', 'Prudencemouth', 'Ivory', 'AntiqueWhite', 'Panama', 'Male', 'fspinka@example.com', '134-770-9500x718', 'Dudley Hills', '183 Dach Fords Apt. 561\nAbelburgh, IN 39119-0509', 'New Haleighstad', '2001-04-09 03:46:14', 'Numquam temporibus officiis eveniet modi necessitatibus. Nihil saepe sit nesciunt quas animi magnam laborum. Voluptatem aut est eius dolorem ipsa. Nulla hic et est et harum.', 'Silver'),
(403, 1, '1976-01-02', 'West Nyafort', 'DarkOrchid', 'DarkSlateBlue', 'Chad', 'Male', 'beer.mylene@example.com', '781-458-2757', 'Prof. Wilhelm Kutch V', '81479 Kayley Vista Suite 974\nEffertzport, WY 66176-2268', 'Meghanside', '1973-03-17 18:49:10', 'Quia ut nesciunt consequuntur sint a repellat assumenda. Ipsum maiores est non provident totam et. In impedit cum omnis quam aliquam eaque. Sit voluptas quisquam sed.', 'Gold'),
(404, 2, '2008-12-24', 'East Jessycabury', 'LightSeaGreen', 'Linen', 'Faroe Islands', 'Female', 'ffisher@example.net', '(692)973-3262x387', 'Krystal Denesik', '30563 Jones Prairie Suite 341\nPort Sydniebury, NC 29572', 'South Sheldon', '1986-04-27 04:12:32', 'Laborum pariatur maxime assumenda. Velit harum corporis consequatur sequi quod. Voluptatibus ducimus vel qui eveniet quo modi quam. Alias laborum quam hic veniam aut eveniet.', 'Premium'),
(405, 2, '2018-09-25', 'Bartolettiberg', 'MediumVioletRed', 'Violet', 'Saint Vincent and the Grenadines', 'Female', 'xkiehn@example.com', '(377)231-5196x8605', 'Neal Rolfson', '43258 Franz Burgs\nNorth Jamal, TX 97821', 'Kelvinton', '2016-11-16 12:14:43', 'Enim id dolores adipisci molestiae qui. Magnam ad vel nostrum optio consectetur deserunt dolores itaque. Explicabo officia saepe vero reiciendis.', 'Gold'),
(406, 0, '2019-04-21', 'South Jeremytown', 'LightBlue', 'Darkorange', 'Denmark', 'Not Select', 'qryan@example.com', '537-453-3061x2677', 'Ciara Satterfield', '394 Maggio Turnpike Apt. 290\nParisianland, LA 47677-3710', 'Elinorechester', '1983-01-03 16:25:24', 'Veniam officia quia quo est officiis dignissimos placeat. Iusto libero qui voluptatem iure nam iusto. Tempora et blanditiis explicabo repellat velit.', 'Silver'),
(407, 0, '2016-04-20', 'Port Irvingtown', 'DarkSalmon', 'LightSteelBlue', 'French Southern Territories', 'Male', 'dibbert.bart@example.org', '715-415-1814x05702', 'Courtney Hills I', '442 Wilfredo Harbors Suite 395\nLueborough, ME 44706-3420', 'Alexanemouth', '2012-07-19 16:49:05', 'Voluptates consectetur aut fugiat dolores nostrum. Perspiciatis inventore qui sit. Eveniet voluptatem reiciendis ut dolores. Eaque odio rerum quia iusto provident ducimus.', 'Free'),
(408, 0, '1977-04-20', 'New Jeramy', 'SaddleBrown', 'DarkViolet', 'Paraguay', 'Not Select', 'aweimann@example.org', '474.470.0950', 'Kenneth Swift', '5837 Otto Loaf Suite 626\nPort Murphy, NV 98734', 'North Evalyntown', '1995-11-13 19:16:46', 'Maiores beatae voluptatem et deserunt vitae corporis. Qui dolores et dignissimos nihil harum non. Consectetur corporis aut et est autem.', 'Gold'),
(409, 1, '1975-11-15', 'Hilarioton', 'Moccasin', 'CornflowerBlue', 'Iceland', 'Not Select', 'gutmann.thea@example.org', '(284)372-4354', 'Prof. Daphnee Feil', '2220 Fernando Garden Apt. 826\nNew Bernadette, ND 16942-0281', 'Antoniomouth', '1984-01-24 09:51:12', 'Aut dolore et vero non sed. At eligendi ut iure impedit qui soluta. Blanditiis molestias cupiditate sint repellendus nesciunt aut dolores. Tempora suscipit dolorum dolor vitae voluptatem et officiis. Minus adipisci unde non.', 'Gold'),
(410, 0, '1981-10-29', 'North Sanford', 'SaddleBrown', 'Cornsilk', 'Dominica', 'Female', 'gorczany.kailyn@example.com', '270-148-6411x43675', 'Miss Estefania McClure Sr.', '69026 Feil Gateway Suite 910\nWest Clara, KY 44707-6149', 'West Lafayette', '1992-12-18 06:01:06', 'Aspernatur numquam minima ipsa voluptas voluptate. Totam culpa harum excepturi rerum aspernatur molestias iusto. Recusandae nam delectus delectus veritatis modi voluptas mollitia. Natus quia ut blanditiis molestias reprehenderit ab quia.', 'Silver'),
(411, 1, '2010-02-07', 'South Izabellaville', 'LightCoral', 'BlanchedAlmond', 'Mauritius', 'Male', 'bednar.pinkie@example.net', '1-304-275-9397', 'Jaquelin Mosciski', '22192 Herman Manors\nLindstad, PA 03214', 'Dawsonberg', '1992-05-22 02:29:25', 'Sit et et dolorem reiciendis sed. Quod eum quo eius eum magnam sed eaque. Rerum repudiandae quidem rerum laborum unde.', 'Silver'),
(412, 2, '1981-02-23', 'Manteville', 'LightSkyBlue', 'CadetBlue', 'New Zealand', 'Male', 'swaniawski.phoebe@example.org', '+83(0)6813906065', 'Dr. Moshe Mayer Sr.', '5726 Deckow Mountain\nLubowitztown, MO 77233-2706', 'Port Kelsi', '1983-08-18 22:16:21', 'Asperiores doloremque autem eos sint deserunt fuga ut. Adipisci temporibus optio voluptates.', 'Free'),
(413, 2, '1979-03-11', 'Flavieshire', 'PaleVioletRed', 'Chocolate', 'Azerbaijan', 'Female', 'hand.olen@example.org', '1-858-499-0691x633', 'Don Hahn', '4332 Greenholt Drive Apt. 450\nNew Cloyd, WA 85105', 'Lake Issac', '2011-04-18 01:43:35', 'Illum saepe nulla quaerat assumenda deserunt recusandae. Velit debitis facilis necessitatibus ea sint.', 'Silver'),
(414, 0, '1976-08-19', 'Blandaview', 'Navy', 'Snow', 'Costa Rica', 'Female', 'elinor76@example.net', '+16(0)5997161586', 'Dr. Grayce Rolfson DDS', '3039 Eloise Lakes Apt. 919\nNew Shakira, WV 46220', 'Schusterstad', '1999-04-16 13:47:43', 'Ad inventore laborum est iusto consequuntur voluptates. Id blanditiis sequi id ex. Aut ad nihil sint quo. Repellat debitis omnis ut facere.', 'Silver'),
(415, 1, '1976-01-02', 'North Cathrineborough', 'MediumPurple', 'Turquoise', 'Chile', 'Male', 'khalid.hickle@example.com', '630.284.2015x3612', 'Kolby Ondricka', '3923 Ward Lodge\nOrnburgh, MI 41299', 'South Hal', '1995-11-06 16:15:45', 'Dicta rem molestias velit ut quo ipsum velit. Reprehenderit et et consequatur voluptas quia ab. Maiores sequi enim facere et dolores iure suscipit. Architecto odit ut fugit tempore ex doloremque magnam explicabo. Et omnis dolor reiciendis nobis.', 'Silver'),
(416, 1, '2000-07-31', 'North Brendon', 'Orange', 'LightBlue', 'Reunion', 'Male', 'german25@example.com', '1-049-076-3836x574', 'Sebastian Marvin', '5806 Romaguera Shores Apt. 348\nJoelville, MI 92888', 'Vincenzoborough', '1986-07-06 07:46:51', 'Consequatur consequatur ullam quia non alias ut sit qui. Ut at laudantium amet tempora quod. Voluptate porro nulla voluptatibus molestiae aliquid quia. Velit facilis et sit minima voluptas eum.', 'Premium'),
(417, 2, '2007-07-13', 'New Antonettaport', 'LightSkyBlue', 'Salmon', 'Korea', 'Not Select', 'zstoltenberg@example.org', '1-785-560-4008x40484', 'Layne Muller DVM', '856 Satterfield Burgs Apt. 180\nArmstrongville, AL 94873', 'Toyshire', '1997-04-08 16:22:05', 'Consequatur et culpa voluptatum. Soluta accusantium non ex quia exercitationem rerum. Hic qui itaque voluptas tempora aut laudantium quisquam.', 'Free'),
(418, 0, '2022-02-20', 'Mohrmouth', 'WhiteSmoke', 'PeachPuff', 'Svalbard & Jan Mayen Islands', 'Not Select', 'grady.viola@example.com', '528.755.3589', 'General Schroeder', '5115 Alysson Creek\nNew Hershelville, MI 50926-6337', 'Alexanderland', '1972-09-23 03:36:33', 'Nulla quia aut inventore tenetur. Similique qui cum rerum molestiae odit earum.', 'Free'),
(419, 0, '1985-02-13', 'Port Sherwoodburgh', 'Peru', 'SlateBlue', 'Guinea', 'Male', 'maryam.kautzer@example.org', '(310)945-6931x19953', 'Natasha Pfannerstill', '58393 Kuphal Spur Apt. 955\nKaleshire, KY 85063', 'Burleyland', '1978-09-19 01:14:42', 'Repellat sit perspiciatis iste eos. In distinctio et hic ipsum qui aliquid nesciunt. Veritatis esse blanditiis aperiam culpa beatae. Dolorum nam sit asperiores modi earum adipisci vero. Et eligendi voluptatum quo accusamus id deleniti cum.', 'Gold'),
(420, 1, '1974-10-04', 'Kleinmouth', 'Snow', 'OrangeRed', 'Bhutan', 'Female', 'ybaumbach@example.org', '(511)840-1534', 'Alberta Gerhold', '30746 Marvin Burgs\nPathaven, KS 98786', 'Cronamouth', '2000-07-18 14:18:34', 'Sunt et mollitia blanditiis. Nostrum iusto unde labore hic. Adipisci qui beatae quia molestiae. Voluptatem illum similique nisi reiciendis dolores.', 'Premium'),
(421, 0, '1985-03-04', 'North Gavinstad', 'DarkOliveGreen', 'AntiqueWhite', 'Isle of Man', 'Not Select', 'aschneider@example.org', '(274)232-0000x08278', 'Miss Katheryn Breitenberg PhD', '777 Reyna Lane\nSouth Kimburgh, SC 04711-7724', 'West Darrickhaven', '1999-05-10 03:08:51', 'Quod nihil voluptas eos expedita eos consequuntur animi. Sunt distinctio consequatur odit enim laudantium. Assumenda nostrum est aliquid earum rerum ipsa.', 'Premium'),
(422, 0, '2014-03-29', 'Bergeberg', 'GoldenRod', 'Brown', 'France', 'Male', 'ggoldner@example.com', '579.348.5157x4655', 'Dr. Doug Kemmer', '300 Sigrid Path Suite 962\nAdolphusburgh, DE 85277', 'Mattchester', '1989-11-05 03:54:52', 'Doloremque at aut quisquam delectus amet quia nobis non. Optio quis delectus sed delectus est ea. Ut excepturi rem expedita consequatur qui quibusdam tempore qui. Quibusdam enim illum quis.', 'Silver'),
(423, 2, '1979-09-07', 'North Holly', 'LightSlateGray', 'IndianRed ', 'Philippines', 'Not Select', 'lockman.isac@example.net', '1-850-894-0619x32641', 'Darwin Swift', '431 Jaqueline Locks Suite 271\nPort Ressiechester, KS 07751-1574', 'Lucasberg', '1973-09-11 12:17:30', 'Dolorem error repellendus quas aut fugit ea non. Laboriosam deleniti non cupiditate itaque laborum excepturi beatae. Eligendi reprehenderit eos sint repellendus quis fugiat odio. Aperiam ut rerum quo unde voluptates ut ad.', 'Free'),
(424, 2, '2010-09-24', 'Moentown', 'Cornsilk', 'PaleVioletRed', 'Saint Martin', 'Male', 'justine.kuvalis@example.org', '1-785-241-4067x86336', 'Rico Batz', '69815 Roslyn Mall Apt. 571\nParkerfort, VA 00664', 'Lake Mikelchester', '1971-03-25 08:19:50', 'Harum perspiciatis dicta dolor excepturi. Ipsa nihil omnis non odio corporis. Dolores aut inventore ut iste ducimus.', 'Silver'),
(425, 0, '1987-04-05', 'North Lavonton', 'Moccasin', 'Beige', 'Guam', 'Not Select', 'weissnat.horace@example.net', '1-271-845-9272x171', 'Darlene Renner Jr.', '51002 Jerde Highway\nWest Aidan, KS 49042', 'South Kurtis', '2018-10-19 13:17:31', 'Laboriosam praesentium amet qui commodi. Sit et id laborum labore quaerat possimus dolor totam. Qui ut est beatae autem omnis adipisci nihil maxime. Voluptas sequi quas provident similique dolorem. Eius et ut fuga quia qui molestias et autem.', 'Free'),
(426, 2, '1999-08-17', 'New Todton', 'MediumSeaGreen', 'Magenta', 'Bhutan', 'Not Select', 'mable.hilpert@example.com', '1-082-758-7913x540', 'Bryana Rippin', '839 Zackary Estates\nRogahnfurt, OK 45793-9056', 'Eleanoramouth', '1985-11-13 03:20:26', 'Porro quisquam recusandae repellat aperiam ducimus consequatur. Ut iste nihil aut repudiandae. Voluptatem sequi illum enim enim doloribus.', 'Silver'),
(427, 2, '2000-03-31', 'Everardofurt', 'DarkOliveGreen', 'LightSalmon', 'Maldives', 'Not Select', 'magali14@example.com', '856.792.9980x7948', 'Alden Goldner', '99829 Mariah Forges Apt. 023\nKautzerview, ID 58640', 'Zionhaven', '1983-10-14 06:10:57', 'Corporis libero eum ad recusandae quaerat. Est veritatis eius et doloremque et nostrum. Eum autem earum modi dolor dolorem quidem ut. Ea quisquam porro sed quis.', 'Silver'),
(428, 2, '2012-11-30', 'Robelville', 'Black', 'LightGoldenRodYellow', 'Saint Barthelemy', 'Male', 'jbraun@example.com', '401-217-0867', 'Danielle Feil', '00016 Hettinger Stravenue\nNew Cathrynport, MA 60401-5849', 'Bernardton', '1988-10-13 04:24:15', 'Illum tenetur voluptas debitis illo quisquam animi et. Non ratione asperiores est libero iusto eveniet maxime. Unde dolores cumque aliquid quia voluptate.', 'Silver'),
(429, 0, '2005-11-07', 'Herthaview', 'DarkOliveGreen', 'BurlyWood', 'Netherlands', 'Male', 'lvonrueden@example.com', '(515)561-6200x1746', 'Carmella Stracke', '9545 Frankie Island\nNew Vivianefort, AZ 51919-5081', 'New Sam', '1990-03-19 11:04:29', 'Voluptatem nemo reiciendis nemo. Impedit et fugit temporibus officia est eligendi. Expedita eum magni molestias occaecati amet minima corrupti.', 'Free'),
(430, 2, '1980-04-07', 'Bretborough', 'Snow', 'Peru', 'Aruba', 'Male', 'kaitlin.price@example.org', '208.579.0326', 'Enrique Beier', '655 Marguerite Mall\nEast Bulah, KS 94868', 'South Jack', '2017-10-31 04:37:42', 'Dignissimos enim beatae ut ullam omnis officiis. Architecto sit voluptatem qui inventore. Pariatur tempora tenetur recusandae rem aut ut.', 'Premium'),
(431, 1, '2017-08-29', 'Jacynthefort', 'Teal', 'GreenYellow', 'Equatorial Guinea', 'Not Select', 'haven.von@example.com', '1-855-589-7393x920', 'Queen Larkin II', '9250 Retha Turnpike\nEast Rahulland, MD 58593', 'North Georgiana', '2000-02-28 17:35:20', 'Praesentium corporis quasi quas maiores qui illo. Dolor quia mollitia tempora quia et. Repudiandae molestiae incidunt qui ex esse et. Eligendi perspiciatis dolorem incidunt dolore velit aperiam. Nobis nobis laudantium quibusdam odio eaque.', 'Gold'),
(432, 0, '1978-09-17', 'Roweburgh', 'Bisque', 'LightPink', 'Madagascar', 'Female', 'mabel42@example.net', '709-634-1877x559', 'Amaya Marquardt', '0057 Kacey Union Suite 151\nNienowhaven, UT 05387-5959', 'Port Estellaland', '2009-07-11 12:35:11', 'Quidem similique labore libero asperiores quis. Sit omnis harum voluptatem eum. Dolorum voluptatem quisquam ullam inventore. Qui ut deleniti inventore incidunt ipsa maxime ex.', 'Premium'),
(433, 1, '1982-05-23', 'South Dortha', 'Red', 'MediumSlateBlue', 'Libyan Arab Jamahiriya', 'Not Select', 'torey.marvin@example.org', '1-642-854-6644x55341', 'Nigel Kilback', '2449 Abdiel Fort\nPort Sedrickberg, OH 09738-1013', 'Lake Abdullah', '1980-07-01 09:42:17', 'Voluptate assumenda nemo inventore ratione. Consectetur rerum corporis magnam cumque consequatur aut. Architecto quibusdam voluptatum dignissimos corrupti animi sapiente sed est. Quia velit quo rerum labore quia quod et et.', 'Gold'),
(434, 1, '1974-10-30', 'Garthchester', 'MediumTurquoise', 'Gainsboro', 'Hong Kong', 'Not Select', 'gkoch@example.net', '(311)827-3332x4659', 'Noble Gorczany', '3760 Hartmann Path\nSouth Josephine, OH 15940-6647', 'West Celestine', '1999-05-04 00:47:49', 'Itaque qui voluptatem voluptatem sit reiciendis sit reiciendis rerum. Aut odio iste voluptatem quod sapiente alias. Repudiandae dolore sequi dolor modi vitae est.', 'Gold'),
(435, 0, '1989-03-23', 'Johanhaven', 'Aquamarine', 'Purple', 'Kyrgyz Republic', 'Male', 'gideon.hansen@example.org', '1-968-389-1564', 'Damian Hudson', '6306 Kiel Drive\nPacochastad, IN 26037-7894', 'Taramouth', '1983-02-09 01:50:49', 'Atque aspernatur perferendis eaque animi quo et eos repellat. Perspiciatis eos maiores in qui. Ut quas rerum voluptatem deleniti molestiae.', 'Free'),
(436, 2, '2006-07-10', 'West Ezequielbury', 'DarkGreen', 'DarkKhaki', 'Costa Rica', 'Female', 'stark.dawson@example.com', '828.493.1599', 'Dr. Gregorio Johnson II', '2679 Patsy Haven Suite 502\nElyssaborough, SD 95244', 'Port Therese', '1993-10-23 19:12:28', 'Tempora magni dicta doloribus voluptate. Accusantium ut ullam perspiciatis aspernatur quas. Et enim dolorum autem consequatur.', 'Free'),
(437, 1, '2008-01-01', 'Fridaborough', 'Aqua', 'LightSalmon', 'Costa Rica', 'Not Select', 'katherine.bayer@example.org', '(216)242-4473', 'Brook Kihn', '72997 Lonie Route Apt. 694\nBuckridgemouth, MA 16926-7027', 'Kayamouth', '1985-02-21 09:46:26', 'Repudiandae beatae numquam non nihil. Et eaque aperiam officia veritatis eum. Quo odit sint dolor cum tempore deserunt. Hic qui sint quos et.', 'Gold'),
(438, 1, '2004-02-05', 'McClureshire', 'DeepPink', 'Cyan', 'Cambodia', 'Male', 'smitham.claud@example.net', '068-451-7610', 'Kaden Dach', '7653 Kirsten Port\nWilliamsonview, UT 66010-4241', 'Funkside', '1974-06-23 05:30:52', 'Quibusdam alias error voluptatem deserunt blanditiis aut quas numquam. Ut numquam aut officiis accusantium. Deleniti dolor repellendus nesciunt illum.', 'Free'),
(439, 1, '1988-08-27', 'Lake Darrylshire', 'LightCyan', 'OrangeRed', 'Suriname', 'Female', 'sipes.torrey@example.com', '1-668-560-5425', 'Joesph Schmitt', '3659 Aufderhar Turnpike\nOlsonstad, RI 40195-7872', 'Hintzhaven', '1985-05-03 22:12:03', 'Quia aut consequuntur enim vel dolor inventore enim. Repudiandae dolore quibusdam omnis minima. Natus laborum placeat non qui aut.', 'Free'),
(440, 0, '1979-10-29', 'Gutmannfort', 'Blue', 'GhostWhite', 'Finland', 'Female', 'shanon26@example.com', '1-723-695-0116x75482', 'Nikko McClure', '18205 Kuhlman Greens Suite 745\nJesseville, HI 46702-3557', 'New Perrystad', '2006-06-17 16:11:14', 'Id explicabo enim rerum. Ipsum iure consequatur excepturi. Tenetur et autem dignissimos laborum provident.', 'Premium'),
(441, 0, '1973-06-11', 'Friesenmouth', 'Magenta', 'AliceBlue', 'Israel', 'Not Select', 'brekke.tevin@example.org', '1-813-026-4187', 'Rosalyn Hayes', '22826 Brown Bypass\nWest Parkerhaven, VA 74053-8755', 'Rodriguezton', '2014-06-16 11:48:26', 'Qui cum laboriosam illo in tempora quis repudiandae. Maiores velit vel provident delectus nam error fuga aliquid. Quasi ipsa harum blanditiis iure consectetur voluptatem.', 'Premium'),
(442, 0, '1976-04-15', 'Mackenziestad', 'DarkSalmon', 'LightYellow', 'Maldives', 'Not Select', 'gmcclure@example.org', '1-972-397-7790x7363', 'Ms. Dayana Bechtelar', '719 Morgan Villages Suite 517\nRomagueraport, VA 96154', 'New Gaetanoside', '1998-07-19 22:21:47', 'Voluptas alias nisi sit molestiae rem. Doloribus asperiores nesciunt nostrum et aut qui quia dolores. Sed distinctio voluptas labore inventore et necessitatibus.', 'Gold'),
(443, 1, '2007-04-08', 'Terrybury', 'LightSlateGray', 'Thistle', 'Gambia', 'Not Select', 'bmoore@example.net', '099-312-4086', 'Kassandra Wunsch IV', '5840 Angeline Centers\nSouth Claraburgh, MA 84352-0644', 'Rosalindaburgh', '1984-04-29 02:08:33', 'Iusto consequatur aut atque enim qui et. Consequatur provident vel quae unde. Iure quia maiores distinctio rerum.', 'Silver'),
(444, 2, '2015-07-28', 'Lake Zoieview', 'White', 'Wheat', 'Eritrea', 'Female', 'mitchell45@example.net', '901-280-6218x816', 'Frederic Lemke', '50500 Calista Summit Apt. 625\nSouth Cedrickport, DC 79492-6895', 'West Rahsaan', '2003-06-26 02:29:56', 'Nam commodi exercitationem in id optio. Maxime officia sint magni nihil sint quod laboriosam tenetur. Sint nobis itaque quibusdam maxime sint delectus dignissimos.', 'Silver'),
(445, 0, '1992-11-16', 'Carriehaven', 'WhiteSmoke', 'Cornsilk', 'Jersey', 'Male', 'jed.kassulke@example.org', '1-673-156-7902x242', 'Joyce Spinka', '36364 Satterfield Lake Suite 892\nPort Estellfurt, DE 46983', 'East Patmouth', '2013-08-08 13:04:38', 'Exercitationem nemo qui est placeat similique distinctio. Laudantium fugit qui enim laboriosam ullam perferendis vel. Suscipit aut praesentium consequatur officia explicabo sapiente dignissimos.', 'Premium'),
(446, 0, '1987-05-14', 'Jarredchester', 'OrangeRed', 'Brown', 'Isle of Man', 'Female', 'sasha.barton@example.org', '1-689-703-0929x897', 'Gillian Collins', '45710 Talon Field Apt. 307\nFayland, AK 79850-0058', 'Leximouth', '2012-07-09 01:08:09', 'Error voluptatum ut eum architecto perspiciatis. Sed pariatur ipsum natus nihil laudantium. Occaecati porro necessitatibus voluptas non modi animi. Nesciunt magni aut minus distinctio atque qui architecto.', 'Free'),
(447, 2, '1977-11-17', 'North Cleveburgh', 'IndianRed ', 'Violet', 'Mexico', 'Not Select', 'moses81@example.com', '355-752-0031x873', 'Miss Verla Schaefer', '43982 Freddie Parkways Suite 137\nWest Glenniechester, ND 01463-0607', 'Monroemouth', '1983-05-18 07:36:51', 'Quia voluptatem non voluptas officiis accusamus fugit. Placeat doloremque quo quo vel quia incidunt. Est ut consectetur aliquam consectetur. Ex quaerat rerum dolorem quo quia temporibus.', 'Silver'),
(448, 0, '2006-06-27', 'Tamiahaven', 'Snow', 'LemonChiffon', 'Austria', 'Not Select', 'roberta93@example.net', '00227370793', 'Jamey Hilpert', '839 Daphney Forest Suite 583\nAbbyton, VA 41090', 'West Alannaburgh', '2009-06-25 07:58:31', 'Tempora consequuntur perferendis quisquam nihil. Quam reiciendis optio ut ut quia aperiam minima. Est facere libero officiis et.', 'Premium'),
(449, 0, '1984-06-05', 'North Mona', 'YellowGreen', 'PaleTurquoise', 'Iraq', 'Male', 'liana.kris@example.org', '159.270.4156x81288', 'Mr. Burley Hane', '40513 Naomi Plain\nEast Dillon, CA 24525', 'Bergnaumfurt', '1986-01-30 17:41:09', 'Ex quo suscipit consectetur rem quia praesentium. Fuga ullam est est. Earum voluptas atque id et voluptatem ullam. Quis quaerat dolor repellat dolore id. Maxime harum sit ut ut nostrum fugiat vel.', 'Silver'),
(450, 1, '2008-06-15', 'Durganhaven', 'DarkBlue', 'Crimson', 'Uruguay', 'Female', 'ibecker@example.org', '+14(3)7853562183', 'Stephany VonRueden', '3774 Schaden Greens\nEast Anyamouth, AZ 79811', 'Gerrymouth', '2002-06-20 05:46:27', 'Et nobis aliquid eveniet ut. Quibusdam enim dolore dicta accusantium dolores quaerat velit. Numquam delectus magni sed debitis. Deserunt et iste earum inventore quo molestiae quia quaerat.', 'Premium'),
(451, 0, '2000-03-02', 'New Chelsieland', 'DodgerBlue', 'LightPink', 'Dominican Republic', 'Female', 'ted60@example.net', '521.393.6349x952', 'Savannah Keeling', '34563 Grant Light\nSouth Berta, TN 20406', 'Geochester', '2013-01-17 02:10:11', 'Ipsam labore et ipsum nisi. Architecto debitis dolores nostrum sit laudantium nisi molestiae. Soluta consectetur quod in nostrum molestias ex cumque.', 'Gold'),
(452, 1, '2020-01-05', 'Lancehaven', 'HoneyDew', 'Brown', 'Saint Martin', 'Female', 'mina74@example.net', '188.134.3015x3033', 'Karine Morar', '303 Myrl Ramp Suite 478\nNew Abdiel, IN 63712', 'East Florencioborough', '2017-09-13 23:33:05', 'Est quas enim error ipsum qui. In sint qui perferendis rem non. Voluptatem architecto officiis sunt quos cum minima odit. Amet quos eum odio vel earum.', 'Free'),
(453, 1, '1976-12-02', 'Alstad', 'LightBlue', 'LightSalmon', 'French Polynesia', 'Male', 'kayden08@example.org', '+84(4)1855214245', 'Margarette Lowe', '98985 June Island Apt. 110\nKipport, HI 07353', 'Dewayneview', '2021-04-29 07:08:24', 'Deserunt natus quia suscipit quam blanditiis voluptatem sed. Assumenda aut et modi facere impedit voluptas omnis. Totam suscipit sequi quos autem repudiandae consequatur non.', 'Silver'),
(454, 1, '2015-07-05', 'West Rowan', 'LightGoldenRodYellow', 'Olive', 'Bhutan', 'Male', 'alberta.gutmann@example.org', '09191945304', 'Hobart Kuhn', '31255 Susie Brook\nSydneytown, NE 98667', 'East Aletha', '1982-08-11 21:39:54', 'Ratione corporis veritatis quas ea vero. Sint quo et quia. Explicabo dolores aut nobis doloribus error animi id debitis.', 'Free'),
(455, 2, '2000-08-08', 'Jackport', 'WhiteSmoke', 'PaleGoldenRod', 'Korea', 'Not Select', 'greenholt.josephine@example.org', '612.827.2583x712', 'Nestor Huels III', '3643 Marion Mall\nSouth Darian, VT 35116-8366', 'Bergstrombury', '1975-11-14 00:52:46', 'Reprehenderit repellendus veniam ea. Hic molestiae numquam harum neque. Natus et repellendus repellat ab. Expedita eligendi voluptatum atque quia enim distinctio.', 'Premium'),
(456, 1, '2013-12-21', 'Lakinview', 'Moccasin', 'Indigo ', 'Costa Rica', 'Male', 'balistreri.tara@example.com', '(119)757-8105x686', 'Emmitt Boyer', '60930 Samir Forges Suite 888\nJeramyhaven, MT 47148-6700', 'Klinghaven', '1972-04-14 12:41:05', 'Voluptatem sit voluptas et ipsa. Iure velit et voluptas nesciunt. Ex et iusto modi sit est repudiandae unde.', 'Silver'),
(457, 1, '1991-10-02', 'Hagenesside', 'SlateBlue', 'Gold', 'Bulgaria', 'Not Select', 'edgardo.schumm@example.com', '1-103-583-9823x61391', 'Mrs. Myrtis Wolff', '3275 Reilly Way\nNew Masonburgh, NH 18023-5508', 'East Candelarioberg', '2013-11-08 18:13:20', 'Sit vero iste veritatis quasi temporibus. Sunt eos rerum illo et consequatur nisi id aut. Sunt nihil velit neque quisquam aliquid quis fugit.', 'Gold'),
(458, 2, '2001-06-14', 'Kulasstad', 'MediumSeaGreen', 'Peru', 'Mali', 'Female', 'xmosciski@example.net', '1-254-271-7245x70030', 'Keenan Schimmel', '31841 Kenya Grove\nNorwoodville, HI 66394-2389', 'South Wileyton', '2010-12-15 21:29:52', 'Minus veritatis eaque ex et. Debitis omnis aspernatur unde neque ut ipsum.', 'Free'),
(459, 1, '1983-04-12', 'East Karinastad', 'RoyalBlue', 'Beige', 'Chad', 'Not Select', 'porn@example.com', '304-238-7954x4466', 'Adolph Muller', '836 Dorris Forge Apt. 476\nJaniehaven, CA 13822', 'Port Vidalside', '1974-08-27 08:42:36', 'Eos dolores ut laboriosam. Neque atque excepturi in a et quis quas. Alias est sint rerum qui odio quibusdam commodi. Commodi praesentium et vitae placeat nesciunt autem facere.', 'Premium'),
(460, 0, '1980-11-08', 'Pfeffermouth', 'BlueViolet', 'DarkGreen', 'Germany', 'Female', 'lester11@example.com', '1-000-942-5317', 'Mrs. Bette Yost DDS', '1962 Maya Road Apt. 266\nNorth Izaiahland, WA 03445-1491', 'West Jenifer', '2012-03-25 16:19:06', 'Iure voluptatibus quod cum facilis sapiente velit. Unde neque alias consequatur eius. Et inventore consectetur veritatis doloremque. Asperiores sed quam beatae molestiae.', 'Free'),
(461, 0, '1994-12-12', 'Samantachester', 'Wheat', 'Pink', 'Sweden', 'Female', 'toby71@example.com', '(052)937-9114x8462', 'Myriam Davis', '44934 Cummings Garden\nWest Norval, VT 16156', 'Jamirfurt', '2020-08-24 08:17:40', 'Est delectus et sunt mollitia. Quod sed minus eum magnam esse necessitatibus in. Eligendi qui eveniet possimus.', 'Premium'),
(462, 0, '2015-06-05', 'Lake Rheaside', 'Lime', 'YellowGreen', 'Cape Verde', 'Female', 'kamron.morar@example.net', '261-207-5977', 'Prof. Stanley Roob V', '30606 Keeling Motorway\nStromanburgh, UT 69573-7776', 'West Ernest', '1987-04-06 02:21:49', 'Est sed maxime vel hic neque quod aliquid culpa. Consequatur est nostrum sapiente placeat ea vero sed. Adipisci amet commodi et sint consequatur et nostrum.', 'Silver'),
(463, 0, '2000-02-06', 'Port Nehachester', 'Tomato', 'BlanchedAlmond', 'Kazakhstan', 'Not Select', 'qhermann@example.com', '1-381-497-0335', 'Julianne Deckow', '231 Leuschke Mountain Apt. 427\nWest Aniyah, TN 68577', 'East Calebbury', '2008-08-05 18:26:26', 'Sapiente et aut et. Provident ut non libero ea. Dolores incidunt similique praesentium omnis. Debitis odio voluptates sit hic.', 'Silver'),
(464, 0, '1997-08-05', 'Lake Adam', 'DimGray', 'IndianRed ', 'Togo', 'Not Select', 'lyric.powlowski@example.net', '1-064-571-6099x4490', 'Josiane Ritchie', '2429 Trantow Fort\nEast Gaylordton, TX 26809-7507', 'Olgaton', '2007-03-23 09:13:00', 'Porro rerum eum aperiam quidem dolore. Id neque sit ea aperiam aperiam quasi. Nulla facilis ea voluptas et. Et saepe ut dignissimos neque modi impedit qui.', 'Premium'),
(465, 1, '2020-09-09', 'Carrolltown', 'LightSlateGray', 'MidnightBlue', 'Heard Island and McDonald Islands', 'Not Select', 'brakus.arjun@example.org', '+96(4)9117972583', 'Eloise Conroy', '6595 Javonte Harbor Apt. 928\nShakirahaven, IA 05662-5862', 'Gerlachland', '1971-10-25 18:45:13', 'Iusto est voluptates nisi quod est ea. Voluptatem fuga dolores repudiandae rerum. Molestiae amet nulla consequatur placeat et quae sit. Rem dolores in aut quod explicabo. Sit alias nihil est et dignissimos.', 'Premium'),
(466, 1, '2009-04-04', 'Bruenshire', 'Magenta', 'DodgerBlue', 'Cote d\'Ivoire', 'Not Select', 'francisca.yundt@example.org', '540-974-6217x51134', 'Jason Dicki', '399 Grover Land\nRachellebury, TX 27110-3071', 'South General', '1984-02-08 00:17:12', 'Accusamus cumque at sequi ullam enim. Repudiandae cum excepturi ratione omnis neque. Dolorum vitae autem et harum maxime. Voluptatum quia sit a consequuntur odit tempora rem distinctio.', 'Gold'),
(467, 0, '1998-11-01', 'South Alfred', 'PaleVioletRed', 'Bisque', 'Rwanda', 'Male', 'kristin23@example.net', '103.174.7647x7960', 'Dr. Trudie Keeling MD', '76469 Daron Street\nWalshside, ID 58925-1459', 'South Emanuel', '2019-12-20 17:38:52', 'Laudantium natus facere aut voluptas explicabo ipsa quia. Provident facilis est sed quia eos error. Delectus quia id optio hic.', 'Free'),
(468, 2, '2012-03-20', 'Hesselfurt', 'DarkRed', 'DeepPink', 'Canada', 'Not Select', 'wbartell@example.net', '394-704-0772x7975', 'Prof. Zoie Tromp', '3999 Robel Shoals\nBurniceside, SC 53635-4247', 'Bednarchester', '1979-07-19 18:19:59', 'Eligendi dolorem blanditiis est non aperiam. Tempora in nihil et. Et quaerat eum quo ipsa corrupti eveniet officia quo. Tempora ipsam debitis et quam.', 'Premium'),
(469, 1, '2010-10-06', 'Port Merlin', 'AliceBlue', 'Green', 'Wallis and Futuna', 'Male', 'phayes@example.org', '1-877-704-1778', 'Estrella Herman', '26280 Harris Green Suite 910\nLake Alside, WA 90677', 'Brakusport', '1994-04-15 07:32:29', 'Ducimus delectus consequatur quia sint laborum aut blanditiis. Corrupti sed ducimus itaque dolores sunt. Dicta repudiandae non sed voluptates veritatis et.', 'Silver'),
(470, 1, '2014-02-04', 'Kuhntown', 'Coral', 'MediumVioletRed', 'Central African Republic', 'Female', 'bailey.cierra@example.net', '147.326.6990x91633', 'Brook Dooley', '3507 Fadel Point Suite 844\nEast Marge, TN 70501', 'Port Deborahton', '1979-08-01 06:55:13', 'Rem libero et culpa illum possimus sit est. Aut reprehenderit ea enim deleniti cum quod. Distinctio quo optio aut.', 'Premium'),
(471, 0, '2016-03-31', 'Port Bennieburgh', 'MediumSpringGreen', 'BlueViolet', 'Norway', 'Male', 'sophie53@example.com', '438.300.5276', 'Delores Hickle', '124 Amelie Union\nRitchieville, DE 74241', 'New Jazlynmouth', '1997-07-30 01:58:32', 'Tempore nobis qui ad dignissimos vel autem culpa. Est voluptas aut corporis est rem aut dolores. Eius tempora et beatae quia qui.', 'Premium'),
(472, 1, '1979-06-12', 'Lake Conorport', 'Orchid', 'BurlyWood', 'Slovenia', 'Female', 'nora88@example.net', '1-936-791-8191x26608', 'Miss Vernice Crist', '831 Lela Cove Suite 025\nNorth Candace, IA 60833', 'Betsyland', '1971-04-11 21:34:25', 'Non sit qui sunt quia. Quia officia voluptas nesciunt.', 'Premium'),
(473, 0, '2015-06-27', 'North Kennaborough', 'DarkTurquoise', 'HoneyDew', 'Nicaragua', 'Female', 'nrempel@example.net', '(043)976-2337', 'Torrance Stark', '71085 Jermey Drive\nLouieside, TN 62848-7409', 'South Sonnyberg', '2007-07-03 08:57:19', 'Consequuntur aspernatur vitae dolores nihil nemo sed provident. Voluptates aut ut animi in. Nihil itaque facilis magnam et maxime sed nemo. Et quia fugit sit veniam mollitia. Earum quia iusto atque iste.', 'Gold');
INSERT INTO `individual` (`id`, `status`, `date_of_birth`, `place_of_birth`, `church_name`, `organization`, `country`, `gender`, `email`, `phone`, `name`, `address`, `city`, `since`, `description`, `packet`) VALUES
(474, 2, '2019-05-11', 'Maggioview', 'Lavender', 'DarkMagenta', 'Uruguay', 'Male', 'gleichner.piper@example.org', '1-380-850-8624x499', 'Prof. Hannah Bechtelar', '075 Bartell Court Apt. 812\nBetsyfurt, MD 67829-1408', 'McDermottport', '2020-07-10 17:25:00', 'Est vero quia minima explicabo. Omnis distinctio ab sed cum suscipit reiciendis dolorem a. Voluptas harum vel suscipit ut corporis voluptatem id accusamus.', 'Silver'),
(475, 1, '1971-06-30', 'South Catalinaville', 'Linen', 'RosyBrown', 'Australia', 'Male', 'scot11@example.org', '267.228.5665', 'Prof. Alexander Connelly', '0067 Greenholt Pine Apt. 291\nAmaliatown, WA 99369-9639', 'South Florianfort', '1977-11-18 03:37:48', 'Atque expedita iusto in eaque. Et eligendi odio in ut. Atque maxime rerum et voluptatem et dolor. Ipsum omnis autem asperiores perferendis voluptates.', 'Premium'),
(476, 1, '1989-11-26', 'Monteside', 'DarkOrchid', 'Gold', 'Burkina Faso', 'Female', 'fconsidine@example.org', '1-777-988-9023x27939', 'Stephany Tillman', '0573 Pouros Mission\nLakinstad, AL 71548-5957', 'Martybury', '2008-06-03 05:32:06', 'Praesentium ea odio nobis provident pariatur libero. Officia cum ea voluptas eos ratione. Placeat impedit qui culpa quaerat. Odio fuga expedita provident similique fuga numquam veritatis.', 'Premium'),
(477, 2, '1971-12-28', 'Lake Emile', 'PeachPuff', 'DodgerBlue', 'Jordan', 'Not Select', 'irwin48@example.org', '862-541-5844', 'Gage Ebert', '89621 Aida Ports Suite 597\nLilianamouth, MI 20211', 'Port Myriamhaven', '1983-03-18 20:22:40', 'Est commodi corrupti sed a aut quod ex. Eligendi dolorum soluta doloremque occaecati ut nisi doloremque. Debitis nisi velit ut ex.', 'Free'),
(478, 1, '1972-02-07', 'North Albin', 'Navy', 'DarkRed', 'Tajikistan', 'Not Select', 'monserrat22@example.net', '404-315-9213x33674', 'Mr. Keagan Nikolaus', '15485 Therese Circles\nEast Petraview, WV 36425-1160', 'Considineshire', '2017-12-03 01:13:34', 'Quia enim doloremque dolor. Rerum aut quam esse sunt debitis omnis officia consequatur. Et placeat dolorum velit quo sit omnis in. Unde facere fugiat omnis nesciunt possimus. Aut dignissimos laudantium repellendus aspernatur voluptatem eligendi et odit.', 'Gold'),
(479, 2, '1995-06-05', 'Jacintheborough', 'IndianRed ', 'LightGray', 'South Africa', 'Male', 'blick.brennan@example.com', '1-318-957-0807x8074', 'Ms. Darlene Kunze', '72688 Magnus Row Suite 725\nMoisesborough, PA 37889', 'New Marley', '1980-01-18 12:08:41', 'Molestiae itaque eum ab ipsum sit doloribus quis. Placeat exercitationem est et enim sint illo. Optio vero aliquam eius iste. Minus accusantium ea cum sed. At rerum eius beatae et repellendus id.', 'Free'),
(480, 1, '2002-05-04', 'Coleburgh', 'FireBrick', 'DarkGreen', 'Netherlands Antilles', 'Not Select', 'leanna17@example.net', '(896)098-2592x408', 'Jalyn Kemmer II', '323 Lura Oval\nEast Ellaton, ND 62021-0967', 'Lake Kalestad', '2017-02-20 21:53:09', 'Nam recusandae aut voluptatem laboriosam distinctio qui id. Ipsam ea qui ab iusto quis placeat in laboriosam. Vitae molestiae odit aliquam velit. Voluptatibus nobis quia quam ducimus necessitatibus.', 'Premium'),
(481, 0, '1988-10-29', 'West Thaddeusville', 'LightGreen', 'Navy', 'Svalbard & Jan Mayen Islands', 'Not Select', 'lupe.white@example.com', '145-256-3958x5446', 'Odessa Blick', '7497 Lueilwitz Underpass Suite 562\nLakinberg, GA 13504-4538', 'Lake Dennis', '2013-04-18 17:23:36', 'Ab neque earum facere. Et ut perferendis aut ea autem dolore totam. Iste aut sint vero quidem similique. Illum odit nobis ut. Et quasi veniam natus assumenda voluptatibus non eos.', 'Premium'),
(482, 1, '2002-09-06', 'Phyllistown', 'Tomato', 'Chocolate', 'Isle of Man', 'Male', 'vicenta.mckenzie@example.com', '1-015-507-4184x4755', 'Gwen Gottlieb II', '9789 Alvina Extension Apt. 919\nEast Freidafort, VT 04988-2200', 'Port Krista', '2008-09-11 15:03:19', 'Neque quis consequatur a ratione odit perferendis. Provident autem quis eos qui omnis. Nemo non dolorem eum pariatur. Nisi qui nulla ratione illo illo facilis. Et corrupti dolor quia ab.', 'Premium'),
(483, 0, '2011-11-24', 'South Heloiseland', 'FireBrick', 'MistyRose', 'Heard Island and McDonald Islands', 'Female', 'littel.leanne@example.org', '1-665-998-4226x47845', 'Hailie Wisozk', '544 Crist Alley Apt. 662\nCeceliashire, VT 98790', 'Mayertview', '1978-02-14 05:20:05', 'Quo aut et vitae omnis doloremque voluptatem debitis. Ea aliquam eos iusto sapiente sequi corrupti eveniet. Exercitationem cum et praesentium in et ut itaque optio. Est assumenda dolorum sint unde autem delectus nostrum omnis.', 'Premium'),
(484, 1, '2006-02-28', 'North Vivianefort', 'DarkOliveGreen', 'DarkCyan', 'Grenada', 'Not Select', 'jada.kuhlman@example.com', '1-555-499-2193', 'Adrien Jacobson', '14854 Amir Parkway\nGarnettland, WV 08533', 'North Valerieburgh', '1984-02-21 04:21:27', 'Voluptatum error autem voluptatem aspernatur minima. Sit architecto quasi omnis in numquam qui illo quo. Ut et harum quia. Aut quo voluptatibus eos quidem odit distinctio a. Vero necessitatibus aut aut velit at nam aut quo.', 'Silver'),
(485, 1, '2002-02-20', 'Fannymouth', 'LightGoldenRodYellow', 'DarkOrchid', 'Northern Mariana Islands', 'Male', 'berta.ziemann@example.net', '570-228-9482x47745', 'Tessie Emard', '21700 Corwin Springs Apt. 222\nNorth Athenatown, ME 86759-5563', 'Metzshire', '2011-08-02 15:29:40', 'Sequi praesentium ad autem dolorem delectus voluptatum ea. Excepturi et est molestias rerum voluptas similique ullam.', 'Gold'),
(486, 1, '2015-08-28', 'Tamiaport', 'OrangeRed', 'LightPink', 'Iraq', 'Male', 'gaetano99@example.org', '984-961-2564', 'Johnpaul Macejkovic', '38806 Pagac Roads\nSouth Yasmine, CT 37977', 'Port Itzelshire', '1974-04-22 23:25:07', 'Nesciunt eligendi cumque molestiae quia voluptatibus et delectus. Nihil repellendus quod iste. Est suscipit officiis sint labore. Assumenda excepturi sint fuga repudiandae aut quod.', 'Free'),
(487, 0, '1976-12-19', 'New Emmanuelleville', 'WhiteSmoke', 'PaleTurquoise', 'Peru', 'Female', 'max.medhurst@example.org', '961-030-3311x14559', 'Salvador Powlowski', '485 Magali Haven\nLake Celiabury, WI 90515-6991', 'Wildermanchester', '1970-12-31 20:28:36', 'Eveniet assumenda eaque nemo sed est et optio. Assumenda quia aut deleniti in dolores rerum saepe. Aliquam velit natus cum culpa molestiae provident.', 'Premium'),
(488, 2, '2004-12-03', 'Krisshire', 'Khaki', 'Pink', 'Suriname', 'Not Select', 'jkirlin@example.net', '02614494805', 'Marcella Volkman', '5851 Urban Curve Suite 100\nPort Garfield, IA 26477', 'North Asaton', '1991-11-22 02:07:15', 'Beatae tempora error sit est et dignissimos et. Animi ea inventore voluptatibus nisi. Ratione eius provident deleniti ut impedit et unde libero.', 'Gold'),
(489, 2, '2013-09-18', 'Marvinmouth', 'DarkCyan', 'LightSeaGreen', 'Korea', 'Not Select', 'bednar.michale@example.net', '(939)462-4368', 'Pascale Lesch', '3882 Kylee Mission\nNorth Carson, TN 68858-2955', 'New Imanifort', '2014-02-28 15:20:00', 'Quis est qui omnis et et quia numquam omnis. Exercitationem minima adipisci odio praesentium ullam ipsa expedita. Suscipit nisi voluptatibus quia necessitatibus.', 'Gold'),
(490, 1, '1997-03-31', 'Bradenland', 'DodgerBlue', 'LawnGreen', 'Estonia', 'Not Select', 'wiegand.ryleigh@example.net', '(072)036-0806x877', 'Dwight Champlin', '670 Hauck Coves Suite 579\nMarquardtmouth, UT 14150', 'Schroedermouth', '1977-04-10 09:18:53', 'Fugit assumenda incidunt asperiores odio neque. Sed quo qui commodi qui. Pariatur culpa incidunt non ea laborum ducimus. Aut molestiae cupiditate alias ullam illo tempora.', 'Gold'),
(491, 1, '1994-01-11', 'West Marianaside', 'LightSteelBlue', 'CornflowerBlue', 'Ghana', 'Not Select', 'o\'kon.kirsten@example.net', '502.624.0436x438', 'Abbigail Wisozk DDS', '5535 Alexandre Glen\nSouth Weston, GA 17544-7757', 'Kadinstad', '1995-07-03 14:42:22', 'Fuga est et explicabo dolorem. Voluptas voluptatem eum omnis in. Deleniti beatae dolorum qui quo exercitationem soluta.', 'Silver'),
(492, 0, '1999-09-26', 'Lebsackhaven', 'DarkSeaGreen', 'PeachPuff', 'Lao People\'s Democratic Republic', 'Male', 'friesen.stephon@example.com', '(244)467-7761', 'Shanny Bechtelar', '704 Stracke Harbors Apt. 618\nNorth Odellville, OR 97657-8938', 'Lake Sandrabury', '1984-01-28 12:37:37', 'Est ullam perspiciatis ut. Vel non deleniti quia laboriosam facilis ut. Quaerat quod est totam et. Ad et necessitatibus et quaerat et.', 'Premium'),
(493, 0, '2005-05-05', 'North Normaland', 'DarkKhaki', 'SpringGreen', 'Nicaragua', 'Male', 'jaycee78@example.net', '1-112-765-4879', 'Dr. Zola Schowalter Sr.', '447 Emmie Land\nLake Nedrafort, RI 12706-8762', 'East Breanneberg', '2018-12-20 02:41:38', 'Incidunt pariatur non repellat esse minus rerum. Rem omnis debitis sapiente dolores. Similique accusantium id esse unde animi nulla molestiae.', 'Silver'),
(494, 2, '2015-10-25', 'West Onie', 'AliceBlue', 'LavenderBlush', 'Guam', 'Female', 'hirthe.colin@example.org', '661-967-0476x403', 'Prof. Susie Gulgowski', '8679 Alden Skyway Suite 397\nEast Charlie, NJ 73418-0723', 'Ardithshire', '2007-02-18 19:36:05', 'Maiores quos commodi qui enim. Excepturi dolore iste amet molestias esse est. Est a dolorem perspiciatis distinctio est qui. Consequatur aut quo sint voluptas incidunt libero.', 'Free'),
(495, 0, '2008-08-30', 'Muellermouth', 'WhiteSmoke', 'Aqua', 'Antarctica (the territory South of 60 deg S)', 'Male', 'halvorson.danial@example.com', '(413)548-4799x590', 'Dr. Nils Wisozk', '598 Reilly Cliffs\nJastland, AL 18812', 'Gabeview', '1972-07-20 00:26:27', 'Aspernatur ducimus perferendis architecto sunt possimus. Sit quia qui deserunt tenetur. Quia at dolores necessitatibus quia eos. Ullam ullam omnis alias nisi accusantium.', 'Premium'),
(496, 2, '1989-05-09', 'Oceanemouth', 'OldLace', 'LightYellow', 'Saint Pierre and Miquelon', 'Male', 'angelica77@example.net', '035-007-2990x3611', 'Christine Wolff', '00584 Crooks Ports\nJesuston, ID 49313-1920', 'West Winifred', '2010-03-06 00:20:43', 'Esse sunt ea ut. Voluptate ducimus aut porro quam maxime. Dolores eos itaque est et autem est.', 'Silver'),
(497, 1, '2007-11-09', 'North Cordieview', 'Darkorange', 'Pink', 'Bouvet Island (Bouvetoya)', 'Male', 'mgoodwin@example.net', '(345)424-4798', 'Akeem Ledner Sr.', '9569 Hodkiewicz Village\nNorth Caleb, NH 15392-7116', 'Port Kennedi', '1974-04-08 21:13:01', 'Blanditiis quam odio rem expedita sint beatae. Vero et eos vitae qui. Minima ipsa facere consectetur iusto.', 'Silver'),
(498, 0, '1978-05-23', 'Konopelskiside', 'OliveDrab', 'DarkSlateBlue', 'Israel', 'Not Select', 'cbauch@example.net', '1-449-233-3902', 'Branson Parisian', '0428 Kayla Brook\nPort Dovie, HI 62237', 'Jackmouth', '2004-09-07 12:40:31', 'Quis suscipit dolor ut. Odit ut atque id. Reiciendis occaecati omnis est officia.', 'Silver'),
(499, 1, '2004-10-04', 'South Norvalmouth', 'SlateBlue', 'IndianRed ', 'Burundi', 'Male', 'earline12@example.com', '+61(9)4068810500', 'Ms. Jacquelyn Dickinson I', '863 Hermiston Freeway\nMurphyland, MN 15151', 'Hermanfurt', '1971-10-02 21:29:17', 'Culpa vel dolor dicta unde temporibus. Voluptates nemo ratione velit dolor. Laudantium alias debitis ducimus accusantium cupiditate placeat consequatur amet. Qui provident quae consequatur culpa.', 'Premium'),
(500, 0, '1989-12-30', 'Rowlandfort', 'Thistle', 'SeaGreen', 'Oman', 'Male', 'brown.donnell@example.net', '108.416.1601x1445', 'Mac Ebert', '43105 Tavares Roads Suite 738\nDanefurt, AL 94318-1814', 'West Myra', '1984-03-24 07:50:17', 'Qui vel placeat dicta et neque et praesentium quidem. Vero inventore doloremque dolorem ut nesciunt nulla. Porro vel veniam est eos beatae. Et voluptatem nisi aut dolor omnis nihil incidunt.', 'Free'),
(501, 2, '2011-07-30', 'West Tobyshire', 'Fuchsia', 'Aqua', 'Italy', 'Not Select', 'ncorwin@example.org', '112.987.2332x9361', 'Leanna Kessler', '496 McCullough Island\nNoelport, NC 99083-2078', 'Feeneyton', '1990-08-29 18:58:36', 'Perferendis voluptas ducimus vel aut corporis veritatis illum. Sunt soluta veritatis aperiam totam est et. Minus quaerat et aut soluta. Nesciunt est minus fugiat quia sed et.', 'Premium'),
(502, 0, '1978-01-09', 'Bartolettitown', 'LightGreen', 'DarkTurquoise', 'Botswana', 'Female', 'wroberts@example.net', '1-209-384-4755x009', 'Prof. Monty Gusikowski PhD', '7707 Creola Neck Suite 548\nWest Keagan, UT 94258-7983', 'Pfannerstillshire', '1987-11-02 23:09:29', 'Aliquid repellendus molestiae adipisci nemo dolor corporis. Excepturi illum dicta ratione ipsa. Officia non omnis modi omnis blanditiis perspiciatis iusto.', 'Gold'),
(503, 1, '1995-05-14', 'South Liliane', 'MediumPurple', 'PapayaWhip', 'Liechtenstein', 'Not Select', 'rd\'amore@example.org', '854-504-2057', 'Tamia Conn', '28876 Weston Valley Suite 779\nNorth Daytonbury, WI 92694', 'New Kurtside', '1985-10-04 21:11:35', 'Perspiciatis sit unde qui possimus vel quaerat molestias. Et laborum vel dolores. Ut ut provident sed quo. Fugiat et labore est omnis quo non.', 'Gold'),
(504, 2, '1979-09-12', 'South Franco', 'FloralWhite', 'MediumAquaMarine', 'Gabon', 'Female', 'felix50@example.org', '833-449-1870x6249', 'Prof. Noel Klocko', '1303 Jordon Drive\nPacochaville, PA 90307', 'Kulasside', '1971-04-13 02:22:29', 'Enim omnis consectetur quo laboriosam. Voluptatem ex ad tempora error ut. Accusantium est enim quos aspernatur est. Quidem ex vel aut quod doloribus.', 'Premium'),
(505, 2, '1977-12-15', 'New Americatown', 'Lime', 'LightSkyBlue', 'Zimbabwe', 'Not Select', 'flavio.zieme@example.org', '(476)738-8543', 'Sadie Streich', '149 Furman Rapids Suite 173\nNatashaland, CO 88995-0138', 'Gradyside', '2014-10-17 10:05:50', 'Commodi soluta nobis fugiat excepturi maxime aliquid. Illo dolorem rerum et. Molestiae in earum beatae alias consequatur placeat esse.', 'Premium'),
(506, 2, '2013-01-23', 'Tristianland', 'Salmon', 'MintCream', 'Iraq', 'Female', 'gutmann.jaquan@example.org', '013-338-3111', 'Mr. Alexander Bode MD', '0205 Javon Estate Apt. 155\nJonathonview, NE 59691', 'North Mikelborough', '1987-12-23 23:22:30', 'Dolorum et voluptatem incidunt dolor beatae beatae. Atque nostrum recusandae provident quam voluptates. Quia cupiditate est et suscipit.', 'Premium'),
(507, 0, '2008-10-14', 'Doyleshire', 'CadetBlue', 'MediumBlue', 'Madagascar', 'Not Select', 'ayden.goyette@example.com', '1-523-795-8550x0509', 'Mr. Clemens Sipes Sr.', '12554 Reinger Ridges\nFritschstad, AR 62147-9371', 'New Baron', '2020-09-04 12:52:11', 'Est facere velit fuga qui eveniet autem. Et qui harum iusto omnis. Voluptas consectetur nulla sed quo. Corporis ut repellendus quidem.', 'Gold'),
(508, 2, '2018-01-16', 'East Thoraside', 'MediumOrchid', 'Thistle', 'Burundi', 'Not Select', 'osborne.huel@example.com', '1-043-611-1115x353', 'Tessie Hintz', '6840 Kunde Island\nLake Lizethmouth, AR 43534-3665', 'West Lorenaberg', '2007-07-07 06:07:22', 'Dolores libero ut quia aut veniam alias laboriosam. Vero occaecati quasi quia cupiditate molestiae. Et nobis necessitatibus natus qui corrupti nobis non. Ut quia et et temporibus accusantium.', 'Gold'),
(509, 2, '1979-03-11', 'Bernitamouth', 'Tan', 'DarkGreen', 'United Arab Emirates', 'Female', 'mills.desiree@example.com', '050.814.7364', 'Derek Willms', '83453 Kozey Club\nEast Wilmer, PA 16021', 'South Walker', '2008-05-11 03:44:47', 'Natus consequatur aliquam expedita minus et saepe molestiae. Repudiandae ut beatae voluptas error a sed. Iste repudiandae ut rerum autem est.', 'Silver'),
(510, 0, '2021-09-16', 'West Adelefort', 'AntiqueWhite', 'Aquamarine', 'India', 'Male', 'gutkowski.arvilla@example.org', '(505)823-9831x43245', 'Evangeline Wunsch', '484 Green Corner Apt. 982\nLake Jadeshire, UT 06517-8654', 'East Camron', '2014-04-08 22:35:02', 'Ut eos quidem consequatur minus. Enim libero similique perferendis. Nesciunt quaerat inventore dolore ut error cupiditate. Ipsam asperiores nostrum quia possimus itaque incidunt incidunt explicabo. Qui sed tempore culpa qui.', 'Free'),
(511, 0, '1981-06-18', 'Veumside', 'LightCoral', 'PowderBlue', 'Croatia', 'Male', 'fhintz@example.org', '1-150-394-2927', 'Josefina Konopelski DDS', '62083 Cormier Locks\nLake Karelleshire, NM 40875-8473', 'East Salmaborough', '1992-08-26 16:14:44', 'Corrupti amet sint voluptas nisi et modi doloribus minima. Ducimus corporis et eos sit laboriosam. Voluptatibus omnis rerum recusandae sit qui. Qui sed tempora laboriosam quis.', 'Premium'),
(512, 1, '1975-12-14', 'Valentinastad', 'BlanchedAlmond', 'MintCream', 'Guinea', 'Male', 'verlie59@example.net', '434.093.9837', 'Domingo Rosenbaum', '852 Rowe Center\nProhaskafort, IA 15852', 'Bodemouth', '2006-10-28 06:07:37', 'Sapiente officiis et consectetur et perspiciatis aperiam id voluptas. Expedita alias voluptas facilis temporibus nihil quas consectetur soluta. Nam consequatur atque et nihil sint est. Quos error corporis mollitia ducimus.', 'Free'),
(513, 2, '2006-06-05', 'Kautzerport', 'Blue', 'GhostWhite', 'Sao Tome and Principe', 'Male', 'kiehn.darren@example.net', '819.854.7915', 'Modesto Homenick', '098 Jamar Brooks\nTracetown, OH 18611-0003', 'Baileyborough', '1977-06-19 00:47:16', 'Id in quam voluptatem quam voluptatem. Voluptate reprehenderit dicta sequi sapiente quam. Sapiente blanditiis molestiae sed odit.', 'Premium'),
(514, 1, '1972-06-23', 'Kovacekborough', 'LimeGreen', 'Crimson', 'Brazil', 'Not Select', 'jamison46@example.net', '1-273-806-2202', 'Mrs. Sophie Hills', '116 Kayley Prairie\nSouth Claudieberg, MI 16776', 'North Kaileeside', '1980-08-02 21:48:28', 'Vitae illum tempora ut. Cumque alias non enim consequatur quos. Dolorum voluptate sunt voluptatem iure ipsa. Quod dolor iure quae molestias.', 'Gold'),
(515, 0, '1971-03-14', 'Gleasonstad', 'DarkBlue', 'DarkGray', 'Togo', 'Female', 'raynor.malvina@example.org', '479.287.7559', 'Mrs. Rebekah Schneider', '378 Marcos Lane\nNorth Heloiseshire, NM 78447', 'Lake Theresiabury', '1987-02-27 10:08:50', 'Ducimus officia soluta quod reiciendis fuga est. Cupiditate qui impedit vero non quod unde magni. Quia libero accusantium sequi natus earum vero.', 'Premium'),
(516, 1, '1971-03-24', 'Port Chandler', 'Tomato', 'LightGray', 'Nepal', 'Not Select', 'wkozey@example.com', '1-229-237-4574', 'Lacy Bogan', '467 White Mount Suite 977\nBodechester, FL 99303-8768', 'South Christophechester', '1996-07-02 01:22:07', 'Architecto deserunt doloremque sit sed. Animi vitae quis eveniet nostrum et rerum. Id necessitatibus sed dolores delectus ut aut. Excepturi eum sint iusto consequatur quia itaque occaecati.', 'Silver'),
(517, 2, '1995-04-09', 'East Jessborough', 'OrangeRed', 'MediumVioletRed', 'French Polynesia', 'Not Select', 'aharris@example.org', '(718)136-0188x6750', 'Benton Lang', '93074 Santiago Village Apt. 196\nAndresstad, AL 94002-1741', 'East Margaret', '2002-04-07 21:59:45', 'Est qui aliquam repellat animi. Libero quos enim modi numquam. Adipisci velit quia saepe soluta optio facere modi.', 'Free'),
(518, 2, '1984-05-14', 'Krajcikville', 'IndianRed ', 'Snow', 'Iceland', 'Female', 'cremin.josh@example.com', '994.391.8206', 'Rae Gaylord I', '55708 Carroll Street\nLake Juwan, DE 53239-8549', 'Harleystad', '2016-08-15 00:54:24', 'Ut sunt possimus ducimus itaque non explicabo recusandae hic. Debitis dolor illo voluptate labore et. Non amet quo omnis delectus enim et sit. Aut odio ratione inventore non iure.', 'Gold'),
(519, 2, '1986-07-07', 'Miguelside', 'PaleGoldenRod', 'SkyBlue', 'Lebanon', 'Female', 'houston95@example.org', '026.243.4105x76265', 'Sierra Okuneva', '26018 Dixie Club Apt. 622\nWest Demetrisview, IL 72413-2406', 'South Christopheborough', '1978-01-18 02:10:36', 'Odit aut rem explicabo sit quam consequatur. Dolores voluptate sunt et optio. Ad necessitatibus suscipit repellat reprehenderit est excepturi est. Sequi id adipisci nihil debitis dignissimos.', 'Gold'),
(520, 0, '2016-06-08', 'Ardenshire', 'Coral', 'DimGrey', 'Tonga', 'Female', 'oberbrunner.donnell@example.com', '430.705.9113x383', 'Jeremy Schoen Jr.', '5743 Schiller Track Suite 518\nPort Vernie, IL 82589', 'West Sincere', '1975-10-20 20:06:50', 'Qui expedita voluptate quod harum harum. Qui aut qui omnis itaque ut in ut. Reiciendis molestiae culpa cumque iste explicabo ut expedita esse.', 'Gold'),
(521, 1, '1972-03-24', 'Reynoldsstad', 'LavenderBlush', 'LightSteelBlue', 'Bahrain', 'Male', 'zschultz@example.org', '1-704-739-7982', 'Maximillian Zieme', '97466 Jane Trace Suite 287\nAbdulshire, WA 46473', 'Caleighborough', '1995-05-07 03:56:30', 'Dolores ullam nihil itaque nihil. Laudantium quis aut similique ipsam nemo et dolorem. Quaerat omnis ipsum et aut ea tempora. Rerum et doloremque autem eligendi in.', 'Free'),
(522, 0, '1983-05-31', 'Colehaven', 'CadetBlue', 'MediumPurple', 'Mozambique', 'Not Select', 'awilderman@example.com', '+75(8)3910865050', 'Luisa Feeney V', '362 Simonis Mills\nJerroldburgh, FL 66112', 'Greenholtshire', '1992-03-03 02:16:34', 'Esse consequuntur laborum excepturi asperiores dolores fuga et. Ullam fugiat deleniti quibusdam. Cum est odio ea. Consequatur perferendis corporis veniam minus perspiciatis perspiciatis vero.', 'Premium'),
(523, 1, '2013-06-25', 'Tristianside', 'SeaShell', 'LawnGreen', 'Turkmenistan', 'Female', 'mkeebler@example.net', '1-295-430-8443x06563', 'Ms. Margaret Quigley Sr.', '290 Lehner Rapids\nSpencerburgh, ND 96555', 'Robertofurt', '2006-01-26 07:58:29', 'Ut sequi quaerat voluptatum et ullam neque. Veniam assumenda sed non reiciendis molestiae deserunt sunt. Voluptas omnis qui est dolor nisi dolores et. Tempore quos cupiditate nulla hic nemo consequatur error reprehenderit.', 'Free'),
(524, 2, '1983-10-15', 'West Viola', 'Black', 'Olive', 'Togo', 'Male', 'ekiehn@example.net', '+67(6)7410345247', 'Emmanuelle Greenfelder', '72818 Allan Crossroad\nLake Vern, MA 31892', 'East Beaulah', '1981-04-15 13:39:25', 'Iusto fuga eveniet qui molestias. Qui rem quo officiis sint. Deleniti non dolores ipsam ipsum.', 'Gold'),
(525, 1, '1985-07-31', 'West Arnaldo', 'DarkCyan', 'DarkSlateGray', 'Marshall Islands', 'Male', 'tod.beatty@example.net', '(180)746-8224', 'Madie Metz PhD', '97738 Camille Parkway Suite 966\nKlockostad, PA 94168-7800', 'Paucekfort', '2001-03-10 19:27:14', 'Dolorum totam cupiditate et provident fugiat temporibus repellat aut. Officiis illum tenetur culpa deserunt deleniti architecto corporis dolore. Porro pariatur cupiditate ratione in vel ex quasi.', 'Free'),
(526, 1, '1975-02-19', 'Veumhaven', 'LightSkyBlue', 'AntiqueWhite', 'Swaziland', 'Male', 'ohermann@example.com', '(219)726-1059x6181', 'Jamarcus Kirlin Sr.', '833 Nia Garden\nOlafhaven, SC 79907', 'West Pedro', '2016-12-09 21:15:25', 'Eos repellat animi et. Sint eum voluptatem et et. Harum et aut dolor quasi provident provident.', 'Premium'),
(527, 0, '1972-09-16', 'East Normaville', 'BlanchedAlmond', 'RosyBrown', 'Slovakia (Slovak Republic)', 'Female', 'serena84@example.com', '721-507-5263x291', 'Miss Nyah Jast II', '0004 Elinor Tunnel\nNorth Bradton, WI 34748-1315', 'Kyrafort', '1994-11-28 23:50:35', 'Omnis voluptates eius voluptas. Veritatis et in labore quia sed. Delectus dolor voluptates ut nesciunt. Quasi distinctio natus nulla non in repellat enim.', 'Premium'),
(528, 0, '1999-02-16', 'West Santabury', 'Orange', 'MediumSeaGreen', 'Iraq', 'Female', 'kertzmann.alayna@example.com', '1-800-734-8193x52802', 'Haylie Herzog', '303 Kessler Skyway Apt. 913\nNew Kolemouth, CO 17079', 'Elishamouth', '1997-02-23 14:37:06', 'Voluptatibus voluptatem quis et odit aut totam. Qui asperiores quae neque ullam sit ea. Corporis asperiores reprehenderit distinctio quae.', 'Premium'),
(529, 0, '2015-01-22', 'South Javon', 'Blue', 'SlateGray', 'Guernsey', 'Not Select', 'pete.schroeder@example.com', '321.912.1800', 'Liliane Stroman', '287 Jakubowski Wells\nNorth Naomi, AR 14273-6230', 'Gorczanyton', '1982-04-23 07:43:25', 'Iste ut est sint rerum. Optio officiis consequatur enim alias molestiae. Ipsa ad eveniet dicta qui explicabo animi cumque. Numquam quas tempora optio.', 'Free'),
(530, 0, '1970-06-08', 'North Katarinatown', 'Crimson', 'Black', 'Saint Pierre and Miquelon', 'Male', 'tressie.tremblay@example.org', '1-172-995-7444x92862', 'Prof. Alfredo Hirthe', '6347 Buckridge Road Apt. 679\nSchoenberg, OR 63110', 'Randyside', '1973-01-06 17:03:55', 'Dicta eligendi quo nesciunt sunt et. Blanditiis voluptate quae dolor non repudiandae numquam dolorem. Recusandae facere qui incidunt ad eos. Officiis adipisci rerum architecto ad architecto praesentium. Ea vitae pariatur ducimus.', 'Premium'),
(531, 1, '2013-01-17', 'Denesikstad', 'SkyBlue', 'Crimson', 'Norway', 'Not Select', 'ycassin@example.net', '456.255.8510', 'Sally Legros', '6126 Kris Station Suite 039\nJeromemouth, MS 41887', 'East Joyce', '2007-06-13 01:48:44', 'Laudantium ab nemo sapiente est. Error eius sint dignissimos vel minima velit. Velit modi officia in eligendi numquam.', 'Gold'),
(532, 2, '1975-03-19', 'Turnerville', 'Aquamarine', 'DarkRed', 'French Southern Territories', 'Female', 'osbaldo20@example.org', '088-469-5945', 'Prof. Mckenzie Goodwin DDS', '345 Upton Island Suite 179\nClydetown, UT 22606', 'South Enos', '2011-08-02 04:23:14', 'Cupiditate veritatis quo non et quia et quos. Consequatur quo sed et. Molestiae neque praesentium sed dolorem. A optio sequi in dolorem.', 'Premium'),
(533, 2, '1979-08-25', 'North Morton', 'LimeGreen', 'RosyBrown', 'Saint Martin', 'Male', 'lora00@example.org', '962.405.5330x79320', 'Loy Runolfsson', '8329 Clifton Alley Apt. 888\nLake Fletaview, DE 99773-7385', 'Kunzeshire', '2015-09-24 00:54:07', 'Aspernatur esse sunt non aspernatur rerum. Vel est velit aut eos.', 'Premium'),
(534, 0, '2012-12-24', 'South Lydaport', 'Sienna', 'DimGray', 'Djibouti', 'Male', 'zemlak.hudson@example.com', '367-105-6145x271', 'Devin Wiegand Jr.', '80936 Susana Prairie\nLake Harmonyside, SC 70632-5784', 'North Hertastad', '2020-08-03 20:25:01', 'Maxime praesentium explicabo velit eveniet et atque ipsum occaecati. Ipsum corporis ut earum eaque perspiciatis.', 'Free'),
(535, 0, '1971-07-13', 'Floymouth', 'AntiqueWhite', 'LightSteelBlue', 'Rwanda', 'Not Select', 'hauck.clark@example.org', '1-714-169-7494x047', 'Evan Reilly', '594 Joel Mill Suite 520\nNorth Gerhardchester, MA 20360-8822', 'East Ervin', '1978-05-26 16:12:28', 'Quis expedita itaque excepturi repudiandae. Saepe temporibus aut aliquam rem magni odit voluptas. Ut libero asperiores omnis molestiae quas temporibus.', 'Gold'),
(536, 2, '2001-03-22', 'Lake Derek', 'PaleTurquoise', 'PowderBlue', 'Bouvet Island (Bouvetoya)', 'Not Select', 'karina.donnelly@example.org', '866-549-0631x314', 'Albin Johnson', '57928 Gottlieb Keys\nTrinitytown, MO 15292-8770', 'Stammton', '2008-10-29 05:51:35', 'Neque harum doloremque sit maxime nostrum. Omnis nostrum quia quibusdam totam voluptate nam atque. Repudiandae in iste harum sed corporis rerum repellendus eius. Ipsa harum eius necessitatibus officia.', 'Silver'),
(537, 2, '2000-02-20', 'New Nadiamouth', 'MediumSlateBlue', 'AntiqueWhite', 'Angola', 'Male', 'sheridan.huels@example.com', '308-320-8867x87352', 'Willis Walter Jr.', '875 Giovanny Lodge Apt. 287\nPaigeville, KY 30057-6832', 'New Amberfort', '1983-07-12 19:57:20', 'Consequatur et dolor labore voluptatem. Iure minus molestiae eius quod. Minus dolorem est qui eum aut harum asperiores.', 'Premium'),
(538, 1, '1975-03-16', 'Amyaside', 'WhiteSmoke', 'Snow', 'British Virgin Islands', 'Female', 'frederik53@example.org', '(693)597-2949', 'Elva Zulauf III', '52448 Helmer Fall\nKuvalischester, OK 25181-0118', 'Davonfurt', '2017-03-13 21:20:50', 'Est autem velit optio. Ab incidunt aperiam facere tempore. Explicabo dignissimos dolores ex consequatur.', 'Silver'),
(539, 1, '2021-11-08', 'Lake Mac', 'MidnightBlue', 'Teal', 'Guinea-Bissau', 'Not Select', 'marques62@example.com', '1-142-923-4415x4939', 'Coby Durgan', '11756 Madyson Orchard\nSouth Spencerstad, NV 03953', 'New Sammy', '2010-07-23 18:38:00', 'Sed iure repudiandae praesentium quibusdam veritatis nam et accusantium. Nesciunt doloribus consectetur nostrum sit eius odio quae. Ab voluptatem a laboriosam voluptas eveniet. Quaerat qui voluptate quam rem non est.', 'Free'),
(540, 0, '1971-01-19', 'New Brook', 'DimGray', 'Aquamarine', 'Uruguay', 'Not Select', 'berge.halle@example.net', '+39(4)8581925871', 'Octavia Paucek', '02656 Marie Hills Suite 593\nBayertown, SD 43643', 'West Laishaton', '1980-07-03 00:05:55', 'Consequatur doloribus blanditiis aut quia totam odit exercitationem. Debitis hic ex est quod facilis doloribus dolores. Dolorem eum nesciunt ratione delectus iure. Sit necessitatibus est non veritatis officiis rerum molestias.', 'Free'),
(541, 2, '1986-10-22', 'Kochfort', 'PapayaWhip', 'Blue', 'Hungary', 'Female', 'tortiz@example.com', '1-488-030-5058x613', 'Arturo Connelly', '2910 Mark Lodge Apt. 997\nGreysonville, IL 98009-6492', 'Feltonchester', '1972-04-22 03:26:20', 'Voluptatem fugiat laboriosam possimus molestiae voluptate eaque. Ea et quod amet voluptates. Qui nisi inventore excepturi autem rem. Qui aut id voluptatem quis quisquam fuga.', 'Free'),
(542, 1, '1990-08-22', 'North Aprilmouth', 'LightGoldenRodYellow', 'PaleGreen', 'Liechtenstein', 'Male', 'adelia.becker@example.com', '+93(2)9299539816', 'Forrest Bahringer', '6469 Marcellus Falls\nSchambergerville, AL 87635', 'Wardland', '1973-05-31 11:23:18', 'Sit corporis explicabo accusamus. Est nulla provident mollitia. Est veritatis qui laborum eius magnam. Voluptatem consectetur quas ullam.', 'Free'),
(543, 0, '1972-11-13', 'Brownberg', 'Green', 'GhostWhite', 'United States of America', 'Not Select', 'kilback.jacquelyn@example.com', '+68(9)1285567512', 'Mr. Hyman Bergnaum DDS', '2393 Koepp Union Suite 158\nPort Camrynfurt, MS 18455-2583', 'Port Elyse', '2015-05-10 11:55:01', 'Quia fugiat eius ullam quisquam. Facere ab corrupti hic nihil porro. Non et natus cumque. Officiis et nisi tempore. Eum harum qui ea et est.', 'Silver'),
(544, 0, '1981-12-11', 'South Lester', 'Crimson', 'DimGray', 'Nepal', 'Male', 'xrodriguez@example.org', '1-246-350-5517x2070', 'Prof. Abagail Koch DVM', '92352 Kovacek Mission Suite 995\nSouth Mollieton, ND 81130-5497', 'Ellieshire', '2018-01-18 06:49:54', 'Sed ex ut reiciendis labore ut aut. Sed nisi recusandae laboriosam iure voluptas ex et.', 'Free'),
(545, 2, '1996-03-10', 'Boyleburgh', 'Blue', 'Turquoise', 'Czech Republic', 'Female', 'amber.collier@example.net', '(975)298-1612x4139', 'Janice Marvin', '67310 Catherine Cove Apt. 231\nCorinebury, MI 22992', 'North Frieda', '1996-04-16 14:31:39', 'Sequi quisquam minus cum et fugit. Sed dolor numquam ut placeat aliquam pariatur fugiat dolore. Id rem est consequatur enim molestias. Sunt dolorum dolorem et eaque placeat reiciendis.', 'Gold'),
(546, 0, '2000-01-29', 'Hillsburgh', 'DeepSkyBlue', 'LightSkyBlue', 'Grenada', 'Female', 'friesen.ansley@example.com', '1-139-603-3706x46809', 'Raymundo Kemmer', '320 Margarette Isle Suite 205\nWest Sigmundfort, RI 16507', 'Rasheedview', '1977-01-27 07:30:43', 'Nostrum voluptatibus voluptatem dolorum et. Aliquam officiis nisi non sed esse iste. Doloremque quidem praesentium pariatur. Qui perferendis eum facere cupiditate perferendis voluptatum.', 'Gold'),
(547, 1, '1981-04-15', 'Langoshfurt', 'MediumAquaMarine', 'LightSlateGray', 'Cameroon', 'Male', 'teresa.klein@example.net', '(073)271-8655x3110', 'Ashton Cummerata', '637 Cremin Mills\nJaydonville, NM 85289-9812', 'Sporerstad', '1994-01-08 05:08:14', 'Odit vel et saepe et tenetur consequatur dolores qui. Vel dicta ea veniam et sed. Autem rerum sint maiores totam repudiandae.', 'Silver'),
(548, 2, '2012-08-30', 'South Mayachester', 'Cornsilk', 'Cornsilk', 'Grenada', 'Not Select', 'ugoodwin@example.net', '218.969.6642x17762', 'Dr. Jordane Hintz Jr.', '58037 Hudson Lake\nNew Davion, GA 89480-8562', 'New Xavier', '2015-05-05 12:49:19', 'Ipsam et quo porro facere. Quia ex corporis ratione deserunt sit laboriosam voluptatem. Magni rerum eveniet id reprehenderit. Iste sed maxime unde accusamus ut omnis.', 'Premium'),
(549, 1, '1976-01-07', 'Royhaven', 'Yellow', 'Yellow', 'Guernsey', 'Not Select', 'adalberto.nolan@example.net', '906.117.9627x754', 'Mrs. Catalina Spinka PhD', '8748 Deven Villages\nHomenickberg, IL 14342-6170', 'Lake Bert', '1998-02-15 18:34:19', 'Aut et voluptas qui corrupti quo quae. Accusantium enim voluptatem consequuntur voluptatem est dolores doloremque dolor. Soluta ea rerum sit laborum optio dolor inventore quis.', 'Premium'),
(550, 0, '2000-04-25', 'East Lionelchester', 'BurlyWood', 'MediumBlue', 'Christmas Island', 'Not Select', 'conn.mauricio@example.net', '1-804-672-9734x7578', 'Mr. Mavis Wintheiser', '08201 Estell Row Suite 871\nHoegermouth, AK 56417', 'North Ida', '2010-12-14 09:31:47', 'Voluptates quidem debitis et dolorum repellendus. Vero est et voluptatibus temporibus illum.', 'Free'),
(551, 0, '2021-06-10', 'Leopoldmouth', 'SpringGreen', 'PaleGreen', 'Gambia', 'Female', 'jody.jones@example.org', '(030)222-1835', 'Mrs. Rita Wolff', '325 Jakubowski Road Apt. 424\nDarianaton, NC 54008', 'Mandyview', '1990-04-25 07:34:17', 'Illum fugiat dolor repellat aut laborum debitis eius. Delectus vitae iste maiores et. Quia rem cupiditate ipsa occaecati fuga. Fugit consequuntur laudantium consequuntur modi odio qui.', 'Gold'),
(552, 1, '2019-07-18', 'West Garrison', 'Gainsboro', 'Olive', 'Honduras', 'Male', 'angela43@example.org', '882.465.7303', 'Kelvin Mitchell', '4690 Pedro Cove\nRoslynport, KY 56261-1329', 'East Anabel', '2004-04-03 05:44:22', 'Debitis nulla in quas veritatis praesentium asperiores. Et fuga modi architecto autem id voluptatem. Eveniet ut similique sed.', 'Silver'),
(553, 0, '1998-09-10', 'North Margotport', 'MediumTurquoise', 'Orange', 'Djibouti', 'Not Select', 'brianne.cronin@example.net', '604-634-9053x43360', 'Dr. Grover Bergnaum PhD', '530 Juanita Club\nKeeleyville, RI 80555', 'McLaughlinmouth', '1993-04-11 13:40:50', 'Sunt vel veniam molestias soluta nihil et. Explicabo sit nisi numquam repellat laborum vel sapiente. Illum quis animi sed unde at.', 'Silver'),
(554, 1, '1990-10-22', 'Wardhaven', 'DarkOrchid', 'DarkKhaki', 'Benin', 'Not Select', 'clarabelle54@example.com', '797.742.8727x71031', 'Dr. Joseph Kerluke', '1671 Brando Keys\nVonview, OH 20774', 'Keelingtown', '2003-08-12 10:37:27', 'Mollitia aut reprehenderit nihil. Commodi est accusamus aspernatur tempora. Dolorum vel officia consectetur quae libero beatae itaque consectetur.', 'Free'),
(555, 1, '2017-10-08', 'North Odessa', 'Azure', 'CornflowerBlue', 'Albania', 'Female', 'emmanuel74@example.com', '(052)389-4739', 'Wilhelmine Daugherty', '9579 Gislason Lodge\nGradyfort, NH 39185-7041', 'South Colemanbury', '2011-01-27 15:27:08', 'Ipsa quaerat ad quos dolores. Mollitia nihil eum voluptatem repellendus nihil eum. Assumenda voluptatem nulla dolores ipsam vel non ea. Molestias dolorem quos earum.', 'Silver'),
(556, 1, '2016-06-12', 'Port Florencio', 'MistyRose', 'DarkRed', 'Christmas Island', 'Not Select', 'bertram.harvey@example.com', '(737)271-4086x43112', 'Dr. Rebeca Nolan', '6681 Brice Forge\nLake Sigrid, MS 36907-4660', 'Millerville', '1975-12-14 18:08:36', 'Illum totam ex beatae praesentium. Minus ipsum dolor distinctio sed itaque. Id et eius iusto molestiae libero.', 'Silver'),
(557, 1, '1977-06-17', 'Curtisfort', 'MediumBlue', 'Orange', 'Panama', 'Not Select', 'ckutch@example.net', '706-963-3152', 'Mrs. Lucile Bayer II', '8195 Gladyce Drives Apt. 070\nNorth Kayceeborough, NM 12363-8381', 'Mireillemouth', '2002-09-12 12:22:46', 'Rerum sit et consequuntur omnis reprehenderit. Et molestiae accusamus sint optio. Reprehenderit exercitationem consectetur repellendus ut et omnis asperiores. Officiis quam labore et et nostrum totam qui.', 'Silver'),
(558, 2, '2007-11-09', 'Kayceeburgh', 'Peru', 'DeepPink', 'Haiti', 'Male', 'moen.lacy@example.net', '1-237-191-5530x164', 'Prof. Julien Bergstrom DVM', '7918 Judd Forge Suite 017\nBartonview, AL 85568', 'Cormierside', '1975-11-25 18:57:35', 'Eum qui mollitia a necessitatibus cumque voluptate alias praesentium. Omnis exercitationem et quia excepturi voluptas et quos. Eos est blanditiis dolores. Consequatur quo numquam ut excepturi id et.', 'Silver'),
(559, 1, '1973-12-10', 'Fayport', 'LightGray', 'MediumSlateBlue', 'United States Minor Outlying Islands', 'Not Select', 'ujaskolski@example.org', '06102634395', 'Olen Aufderhar', '385 Vickie Flat\nSporertown, UT 13753', 'Framistad', '2016-05-22 15:09:02', 'In architecto quisquam dolorem cumque officia consectetur. Corrupti tempora veritatis incidunt totam ad alias. Odit qui doloribus fuga illum. Quidem error necessitatibus quis beatae.', 'Silver'),
(560, 2, '1982-07-01', 'Beaulahshire', 'Blue', 'LightSlateGray', 'Bosnia and Herzegovina', 'Male', 'peggie84@example.net', '942-355-0196x05185', 'Allie Abshire', '60246 Albin Cove Suite 865\nAufderharton, SC 17077', 'Port Helmerfurt', '1993-01-28 03:59:01', 'Officiis ut quia architecto et. Dicta omnis ea labore dolorem itaque inventore in. Temporibus ut ut at soluta amet.', 'Gold'),
(561, 2, '2020-12-12', 'West Earlene', 'Gainsboro', 'SteelBlue', 'Haiti', 'Female', 'qschowalter@example.com', '1-315-848-8422x7191', 'Esteban Gibson Jr.', '979 Ondricka Meadows Apt. 211\nReillyfort, PA 06877-1164', 'Terryfurt', '2007-11-23 06:36:09', 'Consequatur reiciendis rerum dolorum aut dolorem voluptatem. Iure voluptas rem similique occaecati veritatis. A porro aut deserunt assumenda. Ea quia aut ut consequuntur. Ut porro officiis est voluptatem itaque et numquam.', 'Silver'),
(562, 2, '1999-02-26', 'West Bret', 'HotPink', 'Thistle', 'Tokelau', 'Female', 'mann.rey@example.com', '140-347-2196x123', 'Nelda Runte', '02249 Mueller Estate Suite 431\nConstanceburgh, KS 96015', 'Gerdabury', '1992-09-19 09:54:46', 'Eaque cumque deserunt nisi aut. Omnis earum animi dolor ut fuga ea ipsam et. Quia asperiores architecto commodi modi fugit ullam tempore. Nulla ad nobis non omnis.', 'Silver'),
(563, 2, '2011-11-04', 'Leonelshire', 'Darkorange', 'SandyBrown', 'Belize', 'Not Select', 'tortiz@example.com', '(042)633-2287x24930', 'Nona Lueilwitz', '1094 Tevin Plaza\nNikolaushaven, VT 32346', 'Lake Vincenza', '2011-04-06 07:34:06', 'Sed rerum odit ut dolores facilis. Et et dicta quisquam natus. Optio et omnis non ut quis voluptatibus rem.', 'Premium'),
(564, 0, '1990-06-25', 'Reillyfurt', 'LavenderBlush', 'HotPink', 'Dominica', 'Female', 'wuckert.schuyler@example.net', '1-196-205-7225x6270', 'Dr. Cassie Schinner DVM', '88840 Ward Knolls\nEast Chesley, AR 79397-5346', 'North Dusty', '1971-02-01 14:33:01', 'Tempore consequatur a laudantium esse temporibus praesentium aperiam. Deserunt et voluptate aut est a debitis excepturi. Iusto quo ratione aut maxime totam eaque officiis.', 'Gold'),
(565, 0, '1976-03-12', 'Andersonmouth', 'FloralWhite', 'LimeGreen', 'Lao People\'s Democratic Republic', 'Not Select', 'antonio34@example.net', '(048)425-3626x21404', 'Prof. Cletus Pouros III', '96507 Bernhard Port\nMorarshire, CT 81879', 'Forestmouth', '2009-05-08 15:25:53', 'Placeat libero aliquid facilis quaerat nihil molestias adipisci distinctio. Quibusdam ut libero eveniet eos repellendus autem consequatur. Et ut dignissimos ipsa qui rerum. Id voluptates asperiores optio officia et molestias.', 'Silver'),
(566, 0, '2018-02-27', 'East Emie', 'DarkKhaki', 'Khaki', 'Liberia', 'Female', 'orn.nolan@example.net', '(231)775-6365x90226', 'Rowan Howe', '43240 Johns Trafficway\nBlickmouth, IN 31219-7254', 'Nyasiaview', '2020-11-25 21:26:11', 'Quasi accusamus voluptatem soluta ut cumque qui veniam sint. Et quis aut sed ipsam. Dolor eum sunt dolor assumenda nostrum. Est magnam velit et optio qui architecto.', 'Silver'),
(567, 0, '2018-05-20', 'Solonland', 'Navy', 'SeaShell', 'Singapore', 'Male', 'henry11@example.org', '+15(1)3078222230', 'Mrs. Kaitlyn Kunze', '3731 Hermiston Ways Suite 543\nWest Matt, OH 10332', 'Chelseystad', '1979-12-30 22:46:50', 'Exercitationem voluptas possimus non harum cumque reiciendis officiis ut. Atque minus delectus deleniti commodi nihil quae animi. Tempora non autem voluptatem.', 'Silver'),
(568, 2, '1979-06-16', 'Lake Tonihaven', 'FloralWhite', 'Azure', 'Sweden', 'Male', 'kihn.lavonne@example.net', '1-120-736-7545x050', 'Mrs. Leanne Donnelly', '787 Dicki Rue\nWelchmouth, KS 07776', 'Collierside', '1997-02-16 22:29:33', 'Laudantium ut sed tenetur velit optio et rerum aut. Quia libero debitis rem eveniet. Vitae et vero corporis atque est illo tempora.', 'Free'),
(569, 1, '1996-07-15', 'South Liliane', 'Chartreuse', 'Gold', 'Congo', 'Female', 'lauryn.kub@example.com', '07020812115', 'Elisha McDermott', '246 Rohan Flats Suite 711\nEast Eli, RI 24547-9911', 'Cierrashire', '1976-09-05 23:49:05', 'Corporis quia sit provident ullam. Totam est et voluptas ut porro. Corrupti voluptas ipsam voluptatibus esse quisquam atque error autem. Nostrum itaque voluptatum sapiente aut.', 'Premium'),
(570, 0, '2000-10-28', 'South Dominicside', 'Turquoise', 'Khaki', 'Italy', 'Male', 'zulauf.judd@example.org', '+57(3)9453694180', 'Dr. Florida Stoltenberg', '7214 Sipes Port Suite 481\nNoeport, NY 49402', 'West Emery', '1989-01-07 16:42:37', 'Deleniti minima ex similique ex quia. Delectus eius soluta nam iste et. Esse accusantium et necessitatibus error soluta voluptates quisquam reprehenderit. Exercitationem et officiis hic distinctio voluptatibus. Nihil molestias assumenda numquam explicabo ', 'Silver'),
(571, 1, '2022-02-28', 'South Juanita', 'AliceBlue', 'MediumTurquoise', 'Macedonia', 'Male', 'cathryn.kunze@example.com', '639.503.2982x4248', 'Charlie Padberg II', '39642 Kreiger Via\nNorth Nicklaushaven, MS 36231', 'New Tiannahaven', '1991-10-27 20:26:10', 'Est ut praesentium ducimus facere molestiae ullam quia ipsum. Dolores laudantium odit in. Veritatis eligendi doloribus cupiditate aperiam possimus veritatis.', 'Premium'),
(572, 1, '1988-04-07', 'Lake Malinda', 'DarkTurquoise', 'LightPink', 'Ireland', 'Female', 'colleen.pouros@example.org', '1-040-586-1162x277', 'Prof. Jerel Reinger', '77923 Schmeler Island Suite 823\nEast Noble, OR 73779', 'Joeberg', '2021-08-11 23:42:17', 'Est necessitatibus qui rerum iste repellat voluptate. Doloremque eum quos atque tempora sequi. Ducimus tempore enim asperiores facilis. Ut pariatur qui dolor fugiat tenetur qui et quo.', 'Gold'),
(573, 0, '2009-11-16', 'Nannieview', 'YellowGreen', 'OliveDrab', 'Zimbabwe', 'Female', 'bobby40@example.com', '1-366-909-4033', 'Prof. Solon McGlynn', '1203 Clinton Junctions\nArmstrongmouth, MS 16651-6026', 'Adamsfurt', '2004-02-17 02:08:12', 'Qui quisquam ut ut quas rerum optio. Ad aut est qui voluptatem aperiam. Temporibus asperiores provident officia dolorem voluptates. Omnis nulla omnis consequatur mollitia quis sunt. Qui hic aut quisquam voluptatum labore earum possimus.', 'Premium'),
(574, 2, '1988-02-23', 'Stephenside', 'DarkViolet', 'LightSkyBlue', 'Maldives', 'Not Select', 'rkuhn@example.org', '1-453-217-1020x1436', 'Candice Zemlak V', '0437 Bernier Wells Apt. 144\nStefaniemouth, PA 22880-2990', 'Nataliamouth', '2011-02-25 08:47:33', 'Et vero sit omnis. Dolorum voluptas eaque eveniet totam voluptas.', 'Silver'),
(575, 0, '1994-09-01', 'Davidton', 'Black', 'MintCream', 'British Indian Ocean Territory (Chagos Archipelago)', 'Female', 'mann.darryl@example.org', '1-145-573-2727x717', 'Mr. Torrey White DVM', '52645 Cormier Terrace Suite 260\nWest Arlietown, IL 02449', 'West Dallin', '2003-04-11 15:32:54', 'Rem temporibus reprehenderit iste laudantium. Sequi sint sed aut soluta eum reprehenderit. Consequuntur et quaerat quaerat alias dolorem. Aut iste in libero alias incidunt autem nam.', 'Silver'),
(576, 2, '1979-10-03', 'Hughstad', 'HoneyDew', 'FloralWhite', 'Saint Pierre and Miquelon', 'Not Select', 'oromaguera@example.com', '07076609368', 'Cesar Gulgowski', '223 Delilah Pass Suite 081\nLake Ryley, UT 03057-0167', 'Lake Ludwigstad', '1975-08-06 01:47:39', 'Nisi voluptates numquam necessitatibus voluptatem ad eos. Aliquid vel consequatur quia molestias recusandae magnam et. Praesentium ex amet sunt saepe culpa rerum.', 'Gold'),
(577, 0, '1970-01-21', 'Yundtchester', 'Plum', 'Moccasin', 'Panama', 'Female', 'nrolfson@example.org', '1-396-188-2394', 'Jacquelyn Rogahn', '6962 Ondricka Place\nWest Kieraport, DC 46376', 'East Kenyatta', '2005-12-22 18:29:15', 'Nisi dicta et sunt quas doloremque esse. Similique iusto inventore sapiente et. Voluptas fuga perferendis accusamus corrupti accusamus.', 'Gold'),
(578, 2, '1995-01-26', 'Kenmouth', 'GoldenRod', 'Turquoise', 'India', 'Not Select', 'keebler.julien@example.net', '1-201-793-5127x49289', 'Enrico Stamm', '880 Lemke Hills\nLake Katelin, NE 79725-7227', 'South Stoneview', '1994-01-05 08:24:13', 'Enim a aut quos a iste in quos. Est qui excepturi illo. Sequi quia quo qui ut est esse. Dolorem iure enim impedit ad. In sint cum vitae enim.', 'Gold'),
(579, 2, '2015-07-14', 'Hermannfurt', 'Bisque', 'DimGray', 'Burkina Faso', 'Not Select', 'shoeger@example.net', '03850784073', 'Kolby Hayes V', '663 Jakubowski Creek Suite 590\nWest Ralphfort, LA 03082-9590', 'Hoppebury', '1974-02-12 22:28:12', 'Sit aut vel corporis illum voluptates quidem. Repellat ut porro voluptatum autem ut doloribus. Earum dolor aut ipsam magnam quibusdam. At ipsa qui quidem optio. Qui in quia dolorum occaecati eos doloribus vel.', 'Premium'),
(580, 1, '1993-03-17', 'Aurorehaven', 'Bisque', 'GreenYellow', 'Western Sahara', 'Female', 'bridgette.schoen@example.net', '1-369-913-8010', 'Stacy Eichmann', '763 Mohamed Parkways Suite 856\nHeathcotebury, CO 54207', 'North Dion', '1990-04-01 14:13:48', 'Placeat dolor et magnam accusamus inventore optio. Quaerat qui dolores aut iusto dolor ea sequi. Aut est corrupti sint consequatur. Dignissimos fugit quia laboriosam cumque dolores.', 'Premium'),
(581, 1, '1992-03-15', 'North Lavina', 'RosyBrown', 'Peru', 'Argentina', 'Male', 'wo\'hara@example.org', '558-148-3503', 'Chelsey Bayer', '083 Rosenbaum Grove Suite 722\nNew Monte, HI 43776', 'Rohanstad', '2000-04-21 01:57:28', 'Iusto placeat ex quam eos eum cumque provident. Sunt inventore reprehenderit quisquam qui ab. Dolore numquam corporis cupiditate qui repellendus dolorem corporis. Alias eaque non rerum quos excepturi rerum.', 'Free'),
(582, 0, '2010-09-03', 'New Anjaliburgh', 'Orchid', 'LightBlue', 'Sudan', 'Female', 'hilll.marcellus@example.com', '473-362-7536x9936', 'Genesis Mertz', '09805 Lynch Courts\nNew Dalton, NM 13985', 'North Leonora', '2005-07-16 03:51:23', 'Quia dolor ipsum et modi dignissimos temporibus voluptates. Totam quidem a facilis id sunt dolores ipsam. Et est molestiae minus omnis.', 'Premium'),
(583, 2, '1975-02-19', 'Pollichhaven', 'Coral', 'Chartreuse', 'Equatorial Guinea', 'Female', 'stella.bayer@example.net', '865-315-3775x481', 'Dr. Clifton Mitchell V', '1417 Spencer Fields Suite 713\nNaomieview, MN 12930-6789', 'Johnstonton', '1980-07-23 18:51:37', 'Nisi nihil commodi voluptas. Minima et dolor voluptate sed autem. Est esse quis quam accusamus.', 'Premium'),
(584, 1, '2015-02-26', 'Elianstad', 'RoyalBlue', 'Wheat', 'Indonesia', 'Male', 'ybraun@example.net', '798-700-3661', 'Katheryn Borer', '6060 Weimann Manor\nNorth Vicenteside, TX 41354', 'West Isabelbury', '1984-07-20 17:58:47', 'Quia sed debitis corporis architecto ut magnam. Dolores in ad et ab quae. Corrupti in beatae aut consequatur. Veniam consequuntur a numquam sunt ipsa voluptates. Velit voluptate quod eum ab fugiat tempore nulla ducimus.', 'Free'),
(585, 0, '2008-08-11', 'Sarinaville', 'DarkGray', 'SlateGray', 'Dominica', 'Female', 'howell.gabriel@example.com', '752.770.3111x39099', 'Ms. Jolie Bernier', '226 Nikita Views Suite 449\nNorth Dagmar, MN 54832', 'Cassandrebury', '1979-04-12 23:12:03', 'Consequatur nihil inventore velit iste. Sint autem officiis facilis. Vel dignissimos ab aut cum debitis velit sed tempora. Nemo nobis aut eos provident et quo est.', 'Free'),
(586, 2, '2020-06-10', 'Whitemouth', 'PeachPuff', 'Chocolate', 'Ecuador', 'Male', 'jorge.renner@example.com', '+40(5)6671270448', 'Hester Dibbert', '171 Delilah Corners\nJavontechester, OK 04334-7693', 'Lockmanhaven', '1999-08-22 16:02:01', 'Maiores eligendi incidunt non. Rerum sunt velit mollitia adipisci dolores. Repudiandae et voluptas aut assumenda.', 'Silver'),
(587, 0, '1994-05-18', 'Collierstad', 'Chocolate', 'Red', 'Puerto Rico', 'Female', 'moises.lang@example.org', '(159)555-1880', 'Prof. Andres Pacocha', '4036 Hoppe Falls\nLake Santinoshire, NE 44350', 'Olinside', '2011-02-18 21:03:11', 'Voluptatum ea omnis et ducimus. Nam ea ut alias omnis hic et.', 'Premium'),
(588, 2, '2002-12-19', 'Considinestad', 'Lavender', 'Cornsilk', 'Montserrat', 'Not Select', 'abdul.cummings@example.com', '06833880561', 'Fiona Casper', '984 Elisa Springs Suite 253\nLewside, WI 63690', 'Lake Elyseside', '2012-05-09 13:45:19', 'Quia aspernatur voluptates eum deleniti earum voluptatem voluptates. Consequatur error quidem deleniti aut aliquid at rerum. Exercitationem et in eum quis.', 'Gold'),
(589, 1, '1971-06-22', 'Steuberbury', 'Ivory', 'PaleGreen', 'Poland', 'Not Select', 'legros.rex@example.org', '1-788-415-2000x8695', 'Viviane Brakus', '1090 Delfina Hill Apt. 734\nPort Ethelyn, SD 27412-0638', 'North Edmond', '2009-01-18 23:12:35', 'Aliquid velit delectus qui et exercitationem atque. Doloremque quod numquam velit illum. Et iste iure nam distinctio fugiat amet voluptas.', 'Free'),
(590, 0, '2006-02-04', 'Deckowmouth', 'Gainsboro', 'LemonChiffon', 'Tuvalu', 'Not Select', 'aiden.witting@example.org', '144.531.9100x53628', 'Garth Carroll', '16860 Balistreri Knolls\nNorth Emerald, UT 49857-5368', 'Port Joystad', '2009-10-27 19:10:27', 'Alias perferendis sequi perspiciatis fugit cupiditate sed. Et sint labore odio eos harum. Nostrum inventore consequatur in illum excepturi eaque.', 'Gold');
INSERT INTO `individual` (`id`, `status`, `date_of_birth`, `place_of_birth`, `church_name`, `organization`, `country`, `gender`, `email`, `phone`, `name`, `address`, `city`, `since`, `description`, `packet`) VALUES
(591, 0, '1996-10-08', 'Ivorytown', 'MistyRose', 'Ivory', 'Moldova', 'Not Select', 'ondricka.jolie@example.net', '(781)013-3784x83305', 'Mrs. Roslyn Hammes DVM', '229 Koch Tunnel\nTessietown, WV 94252', 'New Toreymouth', '1990-12-28 05:32:20', 'Dolores nobis fugiat et eos et. Quia maiores rerum distinctio quos aliquid illum iste. Et voluptatem provident ut rerum id. Omnis quisquam optio voluptate omnis voluptatem. Sequi consequatur illum ut fugit.', 'Gold'),
(592, 1, '1987-05-09', 'Laurieview', 'Tan', 'Orchid', 'Poland', 'Male', 'dolly51@example.org', '501.740.1197', 'Henderson Weber', '3991 Lang Summit\nSouth Madelynnberg, HI 86688-3010', 'Bartolettistad', '1977-09-23 05:07:27', 'Delectus qui eos itaque eius et. Voluptas et ea consequuntur quia illo odio quia. Nobis ut quia consequatur sit in.', 'Silver'),
(593, 1, '1987-12-26', 'Port Salmaport', 'LightGray', 'Silver', 'Netherlands Antilles', 'Not Select', 'agnes85@example.org', '06949718743', 'Hassie Ledner', '66219 Gracie Stream Apt. 378\nNorth Vickie, KY 83716', 'Francoshire', '2010-07-18 10:28:54', 'Aliquam natus recusandae repellat quisquam. Natus non quam suscipit eveniet vel ipsum. Aliquam perspiciatis ea hic ut natus praesentium.', 'Free'),
(594, 1, '2019-01-19', 'West Vergieborough', 'Snow', 'LimeGreen', 'French Southern Territories', 'Male', 'andy.johnston@example.net', '443-500-5576', 'Miss Palma Douglas I', '653 Veum Street\nSouth Nedraport, OH 14836-8596', 'North Nicklaus', '2002-01-15 01:35:35', 'Libero minus quaerat rerum beatae voluptas. In tenetur explicabo cum dolorem ut error tempore quidem. Est corporis ab totam corrupti illum. Quae magnam saepe non debitis.', 'Silver'),
(595, 1, '1977-11-10', 'Lake Martinastad', 'Aquamarine', 'Gainsboro', 'Latvia', 'Female', 'kianna92@example.com', '640.354.7175x5251', 'Karli Rohan', '38974 Leffler Loaf\nMorissetteton, OR 09178', 'West Gerald', '1988-01-06 17:45:09', 'Exercitationem voluptates error eum sit dolorem. Quia sed soluta esse sed. Enim eum sapiente sit nostrum architecto laborum nihil id. Quia reiciendis eum vel eligendi unde omnis. Dolore animi aliquam facilis consequatur.', 'Premium'),
(596, 2, '1999-10-27', 'Port Arlene', 'Teal', 'DarkViolet', 'Azerbaijan', 'Male', 'tkshlerin@example.net', '895-559-0511x65350', 'Milan Haley', '60550 Medhurst Forge\nPort Gisselle, AK 21060-4479', 'Alizestad', '1999-09-11 19:11:48', 'Repudiandae et nihil nobis quisquam nostrum earum deleniti. Voluptas dolorem libero voluptatibus. Voluptatem perferendis perspiciatis vitae. Cumque unde minima qui eveniet ut ipsa harum.', 'Free'),
(597, 1, '1996-04-07', 'Lydiahaven', 'Plum', 'SeaGreen', 'Cape Verde', 'Male', 'zack.blanda@example.org', '1-317-267-2361', 'Angie Schamberger', '096 Zackary Way\nNorth Laurianne, MD 26431-8290', 'Marcfort', '1995-12-22 09:51:45', 'Molestiae numquam possimus assumenda quos expedita error minima. Maiores debitis harum consequatur aspernatur sint. Sapiente eaque nobis nostrum.', 'Free'),
(598, 1, '1972-02-24', 'Port Craigstad', 'LightGreen', 'GreenYellow', 'Lithuania', 'Not Select', 'albertha01@example.net', '1-906-730-9212x918', 'Fredrick Zieme III', '263 Loyce Wells Suite 555\nFredton, GA 32387-1901', 'Jaskolskiborough', '1981-01-11 06:18:42', 'Voluptates voluptatem sed et possimus repellat consectetur itaque. Voluptatem et rerum facere fugit architecto. Laborum et possimus sint quia aliquid atque fuga.', 'Free'),
(599, 1, '2006-06-21', 'North George', 'MediumSlateBlue', 'LightGray', 'Bulgaria', 'Female', 'elenor37@example.org', '200-418-3845x196', 'Kiara Bechtelar', '97025 Upton Plain\nOvatown, GA 21812-7047', 'Reingermouth', '2017-04-14 04:36:24', 'Maxime illum hic accusantium id explicabo. Tenetur et eum quae vero. Aliquam commodi doloribus ut.', 'Free'),
(600, 0, '2016-06-16', 'North Edwardberg', 'DeepSkyBlue', 'PaleTurquoise', 'Saint Helena', 'Male', 'hoyt.schroeder@example.net', '409.464.5416', 'Dr. Salvatore Murphy', '3526 Mueller Springs\nCrooksview, AK 01642', 'North Aglae', '1982-09-16 00:28:50', 'Molestiae accusamus doloribus ut vel. Voluptatem enim est nulla. Molestias minus eaque aut et. Vero praesentium hic odit et molestiae.', 'Gold'),
(601, 1, '1995-06-23', 'West Theodora', 'Teal', 'Beige', 'Tajikistan', 'Female', 'aniya.sipes@example.org', '471.523.3981x80596', 'Prof. Amani McGlynn Jr.', '690 Shyanne Pine\nSouth Wilhelm, TX 63774-1097', 'Maxiestad', '1995-08-01 15:57:18', 'Magni aut omnis et aut iste incidunt. Dolorem sapiente minima laborum natus. Placeat aut aliquam nostrum quo quas. Velit cum repellat numquam sed.', 'Silver'),
(602, 1, '2002-10-06', 'Elodymouth', 'Crimson', 'Silver', 'Cyprus', 'Not Select', 'michale.roob@example.org', '+64(3)0628896355', 'Zena Schaefer', '96484 Swift Trail Apt. 503\nFriesenside, ME 48791-1850', 'Blazestad', '1993-12-21 06:00:51', 'Blanditiis asperiores blanditiis autem. Magni qui aut ipsa sit. Rerum velit id voluptatem iusto repellendus accusamus animi. Omnis suscipit aut ut inventore maxime voluptatem. Error et labore quia et voluptatum nesciunt.', 'Silver'),
(603, 1, '1991-09-23', 'Schultzton', 'Purple', 'LightSkyBlue', 'Germany', 'Male', 'kkuhlman@example.org', '247.490.6639', 'Dr. Jerod Smith', '58477 Schoen Canyon Apt. 614\nSouth Kamronview, IN 71052-0874', 'Kiraborough', '1984-11-11 02:27:29', 'Sit aut porro hic quam sed. Aut esse alias ipsa corrupti soluta fugit. Non est temporibus voluptas molestiae.', 'Gold'),
(604, 2, '2003-06-02', 'Wuckertville', 'PowderBlue', 'MidnightBlue', 'Antarctica (the territory South of 60 deg S)', 'Female', 'guillermo.dickinson@example.net', '(686)793-3715x806', 'Dr. Ransom Johnston', '341 Garrison Squares\nMaritzamouth, SD 26472-4194', 'Treutelberg', '1975-11-26 21:40:06', 'Beatae similique voluptatem pariatur voluptatem minus ut sunt. Commodi non ex est laborum eaque id odio quod. Et sed atque veniam necessitatibus natus.', 'Free'),
(605, 1, '2004-06-25', 'Aleneville', 'Aqua', 'Purple', 'Iceland', 'Male', 'brisa.douglas@example.org', '1-575-345-0106x7128', 'Adolf Veum', '483 Magdalen View Suite 509\nKeanuchester, ID 69989-4984', 'Waelchiton', '1983-01-14 19:25:48', 'Officiis cum dolor iure. Magni sequi sit quidem mollitia placeat. Molestiae aut reiciendis nemo dignissimos velit aut neque reiciendis.', 'Premium'),
(606, 0, '1979-03-23', 'East Everettemouth', 'SlateBlue', 'LightGoldenRodYellow', 'Syrian Arab Republic', 'Female', 'kenneth.bogan@example.com', '+15(5)6815830437', 'Angelina Crona', '1749 Boyle Wells Suite 365\nEast Golden, WY 47948', 'Lebsackshire', '2001-09-07 03:20:47', 'Veniam ut ut et consequatur nobis. Blanditiis nesciunt rerum vitae sapiente odit consequuntur mollitia. Eveniet qui vero et magnam tempora repudiandae.', 'Gold'),
(607, 2, '1974-06-14', 'Konopelskiton', 'Plum', 'Gray', 'Tuvalu', 'Male', 'dianna06@example.com', '066-744-1119x667', 'Lawson Crona', '59971 Boyle Junction\nSchummview, UT 70805-2830', 'Preciousberg', '1989-12-09 07:17:56', 'Rerum ab aliquam officia officia. Alias voluptatem dignissimos quasi. Minus iusto nam sequi in debitis assumenda.', 'Silver'),
(608, 0, '1982-01-09', 'Lake Jadyntown', 'LightGreen', 'White', 'Namibia', 'Male', 'paxton.carter@example.net', '390-202-5815', 'Ms. Ivah Welch', '4166 Auer Orchard Apt. 573\nEarlbury, KS 43359-0194', 'East Stefan', '1992-01-16 14:52:09', 'Rem dolor aut officiis. Necessitatibus voluptate totam sed unde. Eligendi quod quis iusto.', 'Silver'),
(609, 1, '2017-06-04', 'Howellstad', 'CadetBlue', 'LightSteelBlue', 'Latvia', 'Not Select', 'nolan.emory@example.net', '842-780-8928x0237', 'Prof. Clay Vandervort', '417 Josiah Bridge\nSchuppemouth, TX 81011', 'Port Lindsay', '1999-05-05 09:45:34', 'Et rerum voluptas cum fugiat repellendus quidem. Libero officia vel consequatur sit consectetur quae.', 'Free'),
(610, 0, '1999-09-13', 'Wardton', 'White', 'White', 'Turkmenistan', 'Not Select', 'gerhold.vivienne@example.org', '706-605-5426', 'Dr. Quinton Cruickshank', '94343 Waters Avenue Suite 693\nHarberview, KY 01305', 'Labadieport', '2001-05-30 17:18:03', 'Asperiores placeat sint quae et minima at. Aut voluptas incidunt non laborum voluptatem voluptatibus. Quia mollitia et itaque. Asperiores rem nobis quia maiores.', 'Silver'),
(611, 1, '2012-08-08', 'West Sharonborough', 'Snow', 'MintCream', 'Romania', 'Not Select', 'isanford@example.com', '578-239-4961', 'Corbin Kassulke IV', '346 Vada Valley Apt. 785\nNorth Tessie, MO 01663-3860', 'Lake Anne', '2000-11-20 11:28:03', 'Sit iste impedit eos voluptas voluptatem. Neque eveniet et quia minus et facere voluptatem explicabo. Ipsam tempore minima ut commodi. In et quod iusto est perferendis est ipsum. Explicabo ad voluptatem accusamus omnis ratione autem.', 'Premium'),
(612, 0, '1994-01-30', 'North Callieview', 'Indigo ', 'DarkGray', 'Peru', 'Female', 'hand.loma@example.org', '960-780-0345', 'Kaycee Kohler', '4435 Amalia Spurs\nKuhichaven, AR 55097', 'Lake Emmanuelmouth', '2002-09-22 09:50:23', 'Molestiae veniam mollitia ab ea delectus repellendus. Dicta et laborum voluptas aperiam sed molestias voluptates laudantium. Perferendis exercitationem iste quis voluptatibus voluptatem asperiores expedita. Vitae sit saepe repellendus voluptate perferendi', 'Gold'),
(613, 2, '1993-08-31', 'West Isaitown', 'SlateGray', 'MintCream', 'Slovenia', 'Male', 'deondre.bartoletti@example.com', '867.896.7001x943', 'Grayson Schulist', '1670 Callie Pass Suite 339\nPurdyfort, NV 85459-8779', 'Beahanton', '1981-09-07 08:43:16', 'Molestiae labore omnis molestiae omnis. Autem rem ipsum soluta vero. Quia eligendi enim ut est. Et voluptatem voluptas placeat quo quae voluptate ea.', 'Premium'),
(614, 0, '1988-10-24', 'Port Hayden', 'GreenYellow', 'Moccasin', 'Iran', 'Male', 'rosemarie78@example.org', '1-779-504-0503', 'Florencio Kiehn', '457 Elmore Points Suite 919\nPort Murrayfurt, VT 48137', 'West Robin', '2021-11-27 04:37:13', 'Ullam odio praesentium vero sint rerum vel voluptatem. Rem qui est modi animi est. Deleniti sit quo iure occaecati dolorem ipsam.', 'Premium'),
(615, 2, '2019-05-08', 'Deonburgh', 'SpringGreen', 'Black', 'Paraguay', 'Male', 'kboyle@example.com', '177.318.6069x0961', 'Santino Schimmel', '87694 Anabel Turnpike\nEast Auroreshire, IA 02693-9589', 'Lake Gardner', '2010-12-23 03:04:26', 'Sint maiores facere illo neque in. Fugit non voluptas qui minima. Architecto eveniet non eos incidunt eum.', 'Silver'),
(616, 1, '1990-03-19', 'Willmouth', 'MintCream', 'Fuchsia', 'Montserrat', 'Female', 'radams@example.net', '226.648.4045x00780', 'Anastacio McGlynn', '5344 Percy Divide Suite 764\nNorth Bertrand, MD 92642', 'North Nicolasmouth', '2008-01-17 22:06:51', 'Assumenda voluptas non officiis molestiae qui aut libero ducimus. Nam unde veniam rerum ut. Minima numquam animi nisi et. Tempore id eaque temporibus nihil quam at vitae. Eveniet consequatur magni sit.', 'Gold'),
(617, 2, '1990-11-12', 'West Derick', 'Lime', 'PaleGoldenRod', 'Isle of Man', 'Male', 'marcelina77@example.org', '1-944-969-4621', 'Billy McLaughlin', '48070 Mckayla Courts Apt. 486\nSouth Elysechester, WY 51906', 'Lake Wayne', '1974-02-12 10:47:58', 'Non sunt modi perferendis. Rerum assumenda harum aut et aut deleniti esse. Quam facere in laboriosam nesciunt qui maxime qui sit.', 'Free'),
(618, 2, '1990-08-23', 'North Lee', 'Indigo ', 'SpringGreen', 'Equatorial Guinea', 'Not Select', 'lesch.nayeli@example.net', '181-757-7495x5095', 'Andreane Gusikowski', '9814 Hoeger Knolls\nWest Samson, WY 47526', 'Port Electamouth', '1996-08-31 02:37:14', 'Dolorem officiis minus ex voluptatum voluptatem cupiditate laboriosam. Enim enim eius eum praesentium cumque earum error. Deleniti nisi veritatis nobis. Eligendi sint voluptas molestiae error dolorem et.', 'Gold'),
(619, 1, '1989-06-14', 'Devontemouth', 'Red', 'DarkSlateBlue', 'Isle of Man', 'Female', 'lorenz09@example.org', '1-354-417-8697x65314', 'Yasmin Steuber', '148 Hyatt Club Apt. 695\nPort Jailynhaven, LA 83340', 'South Trystanshire', '1987-09-02 01:09:59', 'Deleniti in expedita nesciunt maxime quisquam. Voluptas ad qui ut quidem dolorum. Voluptatum eius ullam natus enim rerum sunt enim minima.', 'Silver'),
(620, 1, '1993-04-26', 'Erickfort', 'DarkMagenta', 'SeaShell', 'Nigeria', 'Not Select', 'rarmstrong@example.com', '1-315-931-1305x540', 'Prof. Earnestine Nader', '06494 Little Junction\nElenorside, OR 32397-5351', 'Richiemouth', '2003-05-06 22:38:45', 'Officia temporibus similique nam ut. Voluptatem molestias a dignissimos est suscipit dolores adipisci sunt. Ut enim atque suscipit minima. Id nesciunt in vel qui.', 'Silver'),
(621, 0, '2022-03-16', 'Tommieville', 'MediumOrchid', 'MediumAquaMarine', 'Malaysia', 'Male', 'krajcik.alyson@example.com', '(432)820-7020', 'Addie Cremin', '0161 Herman Cape\nLake Shyanntown, NV 54156-8375', 'Sipesland', '2014-11-29 17:56:08', 'Autem dolorem architecto nam quia. Praesentium ipsa accusantium libero repellendus voluptatem quibusdam. Vel minima quidem maxime recusandae. Corporis culpa sed minus sunt in ut quibusdam. Iusto et et minima sed.', 'Premium'),
(622, 2, '1990-10-16', 'Dickinsonville', 'OldLace', 'DarkRed', 'Suriname', 'Not Select', 'bruen.sylvan@example.net', '00901688412', 'Serenity Torp', '7845 Reina Oval\nFritschmouth, KY 86156', 'North Gilbert', '2019-07-06 12:35:17', 'Accusamus aut aut eos voluptatem alias iure. Et quam sed doloribus eaque. Praesentium exercitationem eos quisquam deleniti.', 'Silver'),
(623, 0, '2010-11-27', 'East Kiera', 'SkyBlue', 'MintCream', 'Vanuatu', 'Male', 'hills.elsa@example.org', '1-148-896-9556', 'Roel Runte', '977 Bergnaum Isle Suite 597\nDaisystad, SD 79049', 'Brennaberg', '2013-04-06 04:14:14', 'Est deleniti quis aperiam laboriosam nihil. Vel dolorem nulla consectetur et aperiam aliquid aut.', 'Free'),
(624, 0, '1998-04-09', 'Lake Marcelina', 'PowderBlue', 'DodgerBlue', 'Pakistan', 'Not Select', 'omueller@example.net', '1-121-228-1623', 'Dr. Myrtis Walsh V', '81240 Jeanne Mountain\nKemmerburgh, WV 22734-4708', 'Ellisborough', '2013-04-15 00:47:13', 'Minima ut qui rerum voluptatum itaque. Tempore eveniet perspiciatis tenetur labore culpa ratione corrupti. Et consequatur sed facilis et laborum nihil culpa. Nesciunt exercitationem ut consequuntur consequatur eveniet.', 'Premium'),
(625, 0, '1996-01-10', 'Lehnertown', 'Gainsboro', 'AntiqueWhite', 'Morocco', 'Male', 'gordon07@example.org', '1-685-763-7931x70015', 'Bryon Thiel', '07399 Kiehn Streets Apt. 933\nNorth Cale, CA 87721', 'West Sherwoodshire', '1991-11-13 21:42:23', 'Dolore voluptatem eum et quia dolor excepturi nesciunt eos. Dolorem doloremque dolor sequi nihil magni voluptatem laudantium. Atque vel dolor soluta itaque laborum aut quia. Quae optio nihil placeat.', 'Silver'),
(626, 0, '2008-08-11', 'New Fatimachester', 'Beige', 'MediumPurple', 'Guam', 'Not Select', 'hkoss@example.com', '1-299-247-2319x571', 'Mikayla Jacobi', '671 Karley Station\nWest Alycia, IN 23521-3946', 'Chelseatown', '2006-12-15 11:33:56', 'Enim vitae soluta dolores quasi quae aut. In alias atque ut veniam provident corporis recusandae. Fugit rerum deserunt ducimus eius soluta est.', 'Gold'),
(627, 1, '2000-06-18', 'New Larueland', 'Lavender', 'PaleTurquoise', 'Christmas Island', 'Not Select', 'kamryn78@example.org', '(437)331-2125', 'Dr. Nyah Kunde', '90873 Ramiro Roads Apt. 772\nNorth Venaview, WI 89343', 'North Kendra', '1980-04-16 15:33:57', 'Ex et odio eveniet recusandae qui blanditiis omnis tenetur. Repellendus tenetur rerum fuga id magni voluptatem. Sunt voluptatem sint temporibus harum.', 'Free'),
(628, 2, '1985-09-27', 'Alejandraberg', 'DeepSkyBlue', 'DarkSalmon', 'Reunion', 'Female', 'carolyne67@example.com', '410-557-5404', 'Corrine Auer', '5328 Breitenberg Streets\nNorth Easton, KY 33939', 'Tateburgh', '2010-10-10 12:27:19', 'Tempora vero aut ut inventore dolore architecto provident. Perspiciatis sequi aut at quaerat recusandae nam. Velit soluta magnam officia expedita eaque est.', 'Premium'),
(629, 2, '1975-04-21', 'Toymouth', 'MediumAquaMarine', 'SpringGreen', 'Cape Verde', 'Female', 'kathleen94@example.net', '648.938.9296', 'Miss Dixie Daugherty', '9601 Myles Ferry\nBernieville, OR 53260', 'East Forrestmouth', '1993-06-07 22:09:41', 'Molestiae dolores officiis in qui et. Quo alias ea recusandae facere. Suscipit cumque voluptatem qui recusandae molestiae aut nihil quasi.', 'Gold'),
(630, 0, '1993-05-18', 'Port Eldredville', 'Beige', 'SkyBlue', 'Costa Rica', 'Female', 'shannon55@example.org', '(073)264-4277', 'Jewell White', '3319 Hattie Corners\nLarsonview, WV 60924', 'Port Delphinefurt', '1972-10-25 13:10:46', 'Enim nulla fugiat labore consectetur aspernatur. Officiis nihil illo non velit et aliquid. Culpa perspiciatis doloribus quia dolores vel quisquam iusto at. Sequi ullam quo voluptas natus perspiciatis voluptas non rerum.', 'Gold'),
(631, 1, '2009-11-29', 'South Dorianfort', 'Chartreuse', 'OliveDrab', 'Nicaragua', 'Male', 'destiny.bahringer@example.com', '1-253-125-2917', 'Annetta Koch', '82762 Littel Lakes Apt. 477\nSouth Tyrel, SD 05379-0234', 'Bergstromtown', '1997-09-06 07:29:36', 'Aliquid voluptates ea quos et veritatis ab aspernatur. Ullam dolor nostrum ut aut corporis. Est asperiores qui et minus ea.', 'Silver'),
(632, 0, '2000-12-26', 'Lefflerchester', 'MediumVioletRed', 'LawnGreen', 'Lebanon', 'Female', 'saul.weimann@example.com', '928-449-9465', 'Rhea Collier', '63603 Madge Street\nWest Davion, MT 61615-4622', 'Yvonneberg', '1975-05-28 21:42:44', 'Quisquam unde et deserunt inventore illum. Voluptatem est vel quam. Qui quia laboriosam in laudantium ad excepturi tempore.', 'Premium'),
(633, 1, '1994-11-07', 'North Paigestad', 'Azure', 'MidnightBlue', 'Papua New Guinea', 'Not Select', 'jwalker@example.com', '(212)209-8590', 'Vincenza Emmerich PhD', '88998 Juvenal Highway\nWisokyfurt, HI 90758-4009', 'Rodrigomouth', '1978-04-12 06:07:11', 'Harum sed natus ipsam voluptatem totam. Ut voluptatem necessitatibus ipsum vitae. Iste animi enim dolor quod. Quae eaque sed nulla et sequi qui.', 'Gold'),
(634, 2, '2018-10-07', 'Kayfurt', 'DarkTurquoise', 'MediumVioletRed', 'Anguilla', 'Not Select', 'bashirian.minerva@example.org', '01093687229', 'Ernesto Keeling', '42921 Hartmann Shores Apt. 372\nKadenmouth, HI 32106', 'Genesismouth', '2021-03-11 23:30:40', 'Veniam quia voluptas perspiciatis rem hic molestias voluptatem. Ducimus provident voluptatum praesentium atque.', 'Gold'),
(635, 1, '2007-06-07', 'Greenfeldershire', 'LightSkyBlue', 'MediumSlateBlue', 'Saint Pierre and Miquelon', 'Not Select', 'ward.jeffry@example.com', '633.018.6318x69868', 'Marjorie Langosh', '56887 Metz Islands\nUptonburgh, GA 28310-3784', 'East Zita', '1972-07-10 21:51:18', 'Iste saepe magnam amet eveniet voluptatem. Sapiente nobis eum sed ea corrupti. Sunt qui natus qui tempora reiciendis dicta saepe necessitatibus.', 'Premium'),
(636, 2, '1999-10-02', 'Jadynmouth', 'SkyBlue', 'PapayaWhip', 'Saint Barthelemy', 'Not Select', 'zion.bergnaum@example.net', '1-508-159-3076x978', 'Jovan Jacobson', '12976 Hortense Skyway\nWest Freemanberg, CA 87088-1900', 'Okunevamouth', '1986-10-28 03:36:55', 'Sed distinctio voluptatem autem. Et pariatur id culpa voluptatibus. Fugiat et placeat sit voluptate voluptatem officia.', 'Free'),
(637, 0, '2022-02-25', 'Ziemeberg', 'LightSteelBlue', 'Plum', 'Yemen', 'Not Select', 'terry.angus@example.net', '977.081.3384', 'Prof. Marley Quitzon', '94828 Angelo Turnpike\nPort Hillary, AZ 02578', 'Port Pinkie', '1993-02-12 16:00:04', 'Labore nobis modi enim provident blanditiis hic aut. Itaque odit libero quis autem laudantium hic. Omnis excepturi amet dolores numquam occaecati dolorem. Quod omnis placeat provident explicabo nihil officiis qui.', 'Premium'),
(638, 1, '1976-03-10', 'Reaganmouth', 'MistyRose', 'PapayaWhip', 'France', 'Female', 'rashad19@example.org', '07323259673', 'Eve Kuhn', '85668 Corbin Plains Apt. 346\nSouth Kaylie, SC 64863', 'South Luigiburgh', '2008-03-10 03:54:58', 'Aliquid ut laborum exercitationem voluptatibus quaerat. Delectus non tempora deleniti dolores dolorem sunt. Expedita minus nostrum autem tempora ad.', 'Gold'),
(639, 0, '1989-01-17', 'Garnettmouth', 'HotPink', 'Magenta', 'Russian Federation', 'Not Select', 'steuber.lue@example.com', '1-482-703-6508x19310', 'Mrs. Imogene Baumbach', '55881 Crist Knoll Apt. 292\nGreenhaven, WA 83138', 'South Karianestad', '1972-08-22 00:24:25', 'Cumque repellat aut deserunt voluptatem assumenda aut laudantium. Sed quam asperiores autem mollitia. Nostrum voluptatem qui qui occaecati illo architecto. Vitae in perspiciatis omnis nam.', 'Free'),
(640, 1, '1990-10-26', 'Laneyberg', 'SlateBlue', 'AntiqueWhite', 'Angola', 'Male', 'marshall.barrows@example.net', '266.054.3899x553', 'Isabell Von', '2198 Leila Camp\nWest Hildahaven, UT 50743-0348', 'Port Guyborough', '2012-06-02 02:16:06', 'Amet iure voluptas aut quo. Minus dolores sint sed ut dolor quos sint.', 'Silver'),
(641, 0, '2003-12-18', 'Jacobsside', 'DarkGoldenRod', 'SkyBlue', 'New Zealand', 'Not Select', 'sallie.ruecker@example.net', '(442)810-3080x522', 'Stanton Smith', '56508 Alvina View Suite 135\nRunolfssonfort, RI 15673-9832', 'Lakinside', '2019-11-08 14:41:24', 'Rem sunt atque atque nobis esse natus cumque. Nulla cum quae impedit adipisci ipsum hic hic. Cum corporis qui doloribus. Similique perferendis sunt exercitationem assumenda nostrum quaerat quia.', 'Gold'),
(642, 2, '1972-06-12', 'Nathanport', 'Lavender', 'Maroon', 'Saint Martin', 'Female', 'shemar45@example.org', '08574152052', 'Otha Sporer I', '24452 Swift Tunnel Suite 330\nJohanmouth, OR 71133-1151', 'North Mitchelport', '2019-02-19 04:25:31', 'Nihil consequatur molestiae hic sed et velit. Temporibus autem officia sunt possimus aliquid illo.', 'Gold'),
(643, 1, '2001-08-22', 'Stefanieville', 'Wheat', 'LightSlateGray', 'Saint Barthelemy', 'Female', 'ugreenholt@example.net', '454-330-8669x041', 'Cleveland Gottlieb', '977 Sarah Lock\nNew Marcia, ID 76898-6788', 'Port Quincyfort', '1996-07-28 23:04:17', 'Non quam earum qui ipsa placeat culpa. Minima cumque omnis explicabo id ut culpa. Modi aut atque culpa et corporis dignissimos optio. Dolorum minima ea voluptas eius ratione.', 'Silver'),
(644, 1, '1986-01-20', 'New Lennieborough', 'LightSteelBlue', 'Tan', 'Andorra', 'Female', 'roxane45@example.net', '676.733.7759x9676', 'Mckayla Cummings', '405 Allen Run\nNorth Deanna, MI 86792-9783', 'Treutelhaven', '1976-05-28 22:29:14', 'Dolores nostrum sit quae rerum maxime dolores. Optio distinctio earum adipisci ut est et. Error quia id aspernatur eveniet.', 'Free'),
(645, 0, '2001-09-21', 'East Tysonport', 'SlateGray', 'LawnGreen', 'Nauru', 'Male', 'vquigley@example.net', '210.371.3776x8583', 'Patsy Dach', '6715 Karelle Wall\nReingerbury, IA 97108-1921', 'Felixville', '1987-01-20 07:40:17', 'Nesciunt maiores nostrum et laudantium odit. Ut eum pariatur sint temporibus molestias ut voluptas omnis. Nihil alias repellat molestiae ut voluptatem esse aliquam.', 'Silver'),
(646, 1, '2019-03-15', 'Schulistview', 'Wheat', 'Salmon', 'Canada', 'Female', 'muller.ozella@example.org', '360.078.2555', 'Darian Okuneva', '0985 Batz Spur Suite 865\nNew Jaidaton, OR 37834-2494', 'Kaitlynfort', '2003-09-25 12:02:43', 'Numquam minus repudiandae voluptatibus. Placeat sint quos maiores doloribus. Quod consequatur aut possimus nesciunt harum. Consequatur asperiores corrupti reprehenderit deleniti.', 'Gold'),
(647, 2, '2000-11-17', 'South Eldridgefort', 'DarkGreen', 'DodgerBlue', 'Grenada', 'Not Select', 'marvin.alyce@example.net', '146-705-3335', 'Leo Muller', '528 Jazmin Wells\nWest Margieside, OR 24839-5953', 'Port Havenhaven', '1976-07-01 03:21:57', 'Et consequatur laudantium repellat eos magni eligendi. Necessitatibus in est dolores vel excepturi dolor atque voluptatum.', 'Silver'),
(648, 0, '1970-05-15', 'Lake Alexandrotown', 'DarkBlue', 'DeepPink', 'Cuba', 'Male', 'beahan.sophie@example.org', '+47(9)0234097663', 'Prof. Louvenia Konopelski', '544 Feeney Burgs Apt. 131\nSeamustown, IL 18368-2656', 'South Eloyfort', '1999-06-08 15:10:15', 'Eum repellat odit tempore quia itaque. Autem velit molestiae facilis consectetur ut voluptatibus vitae est. Rerum est sit minus natus velit quia id. Numquam qui enim et quam alias hic.', 'Gold'),
(649, 0, '1985-06-14', 'Melvinaland', 'CornflowerBlue', 'Beige', 'Saint Vincent and the Grenadines', 'Not Select', 'imurphy@example.com', '+41(5)7264564266', 'Mr. Dante Kris II', '93934 Zelda Burgs\nEast Laurianeshire, HI 32330', 'Port Elyssa', '1986-11-25 00:20:36', 'Quia et velit et optio provident. Est consequatur animi rem est. Incidunt repudiandae adipisci consequatur ut ad. Placeat qui facere error.', 'Gold'),
(650, 0, '2014-06-10', 'Alfordville', 'LemonChiffon', 'OliveDrab', 'United States of America', 'Not Select', 'emie35@example.net', '+15(6)4471878301', 'Miss Christelle Hauck II', '256 Torphy Isle Apt. 606\nEberttown, TN 73223', 'Jaymetown', '1994-08-13 20:59:43', 'Eligendi quia nam corporis repellendus magnam ratione. Minima qui aut soluta consequatur aspernatur adipisci id. Placeat quis est non deleniti eos eligendi. Ipsa id molestiae magni ut facilis iusto recusandae.', 'Free'),
(651, 1, '1975-08-20', 'New Gilesview', 'Purple', 'LightPink', 'Libyan Arab Jamahiriya', 'Female', 'forest.botsford@example.org', '1-302-277-3782x371', 'Narciso Greenholt', '70056 Mckenna Isle Apt. 828\nCrookshaven, MI 41170', 'West Archton', '1998-02-06 14:44:38', 'Alias est eum in eum. Facere necessitatibus asperiores temporibus rerum eos eligendi.', 'Silver'),
(652, 2, '2007-01-05', 'Kertzmannmouth', 'DarkMagenta', 'DimGrey', 'Saint Pierre and Miquelon', 'Male', 'rebekah57@example.com', '588-768-5264x27032', 'Dr. Uriah Dare', '004 Jameson View\nNew Henryberg, RI 06785', 'Damariston', '1977-07-16 00:43:00', 'Eos nemo ea consequatur velit et odit voluptas. Consectetur molestiae officiis magni sapiente pariatur harum. Consequatur repellat nam quis et. Labore quam doloremque earum totam et eum ut.', 'Silver'),
(653, 2, '1978-01-30', 'South Kariannefurt', 'Plum', 'Tan', 'American Samoa', 'Not Select', 'abagail68@example.org', '626.973.8953x731', 'Prof. Clotilde Hand III', '27356 Karli Street Apt. 433\nKleinhaven, OK 75055-5931', 'Port Dinaborough', '2000-05-04 16:15:22', 'Libero quisquam id nostrum at officia reprehenderit voluptatibus dolorem. Quae sed dolor repellat quisquam ipsa. Quas voluptas quo aliquam ab voluptatum minima provident.', 'Silver'),
(654, 2, '1982-03-26', 'North Casandra', 'LightGreen', 'MidnightBlue', 'Wallis and Futuna', 'Male', 'mertz.wilfred@example.com', '+28(5)7419532580', 'Dr. Dena McLaughlin MD', '967 Sadye Plains Suite 854\nSouth Joanieville, NC 43363', 'East Margarett', '1976-04-19 20:21:33', 'Mollitia sed voluptatem iste. Animi reprehenderit et aut id. Perspiciatis voluptas repellat autem nemo architecto. Qui eaque quis sunt enim et porro.', 'Free'),
(655, 0, '1979-11-03', 'Vincenzomouth', 'LightSalmon', 'White', 'Tanzania', 'Not Select', 'ricardo.barton@example.net', '(267)265-3135x48745', 'Katherine Smitham', '5737 Hettinger Flat Suite 249\nLake Eino, NM 83904', 'New Theo', '2015-05-27 18:37:26', 'Animi et consectetur corrupti excepturi doloremque quam doloremque. Minus doloribus error in veritatis est aliquid. Possimus voluptatem perspiciatis ea eius.', 'Gold'),
(656, 1, '2012-10-30', 'New Francisca', 'Yellow', 'LawnGreen', 'Norway', 'Not Select', 'rosa73@example.net', '1-350-527-2895', 'Miss Lora Paucek DVM', '86269 Margarette Wells Suite 504\nNew Glennieburgh, RI 52602', 'West Tina', '1985-02-21 05:25:03', 'Nostrum sunt fuga quam at. Adipisci porro delectus et quod. Quos incidunt optio veritatis et aut.', 'Gold'),
(657, 1, '1977-05-28', 'New Wilhelm', 'SlateGray', 'BlanchedAlmond', 'Morocco', 'Not Select', 'skylar.zemlak@example.com', '433-665-7856x4197', 'Evert Lindgren I', '640 Nolan Mountain\nBeckerside, PA 06819', 'New Tillman', '1978-04-24 09:37:14', 'Iste ad omnis optio dolorem. A accusantium tenetur placeat voluptas. Et id quaerat exercitationem tempore. Et eum qui unde exercitationem.', 'Free'),
(658, 0, '2006-07-30', 'Port Aurelioville', 'Navy', 'GreenYellow', 'Egypt', 'Male', 'robert.gleichner@example.org', '541.779.0857x773', 'Damien Konopelski', '5526 McDermott Villages\nEthaview, KS 14983', 'Smithamshire', '2012-09-18 08:02:56', 'Qui ducimus expedita quia illum voluptates. Quisquam et et et. Neque cum velit et est.', 'Silver'),
(659, 1, '2007-02-12', 'New Dasia', 'DarkSalmon', 'DarkOrchid', 'Malawi', 'Male', 'raul77@example.org', '(687)056-6643', 'Destiny Bartoletti', '39625 Cara Throughway\nNorth Cletusside, CO 07285', 'Lake Jenifer', '1972-05-01 20:13:02', 'Voluptatem molestiae tempore amet officia. Ullam ex iure veniam animi quod quia. Animi fugiat cum omnis suscipit distinctio. Aut ipsa repellendus ea consequatur delectus quas quis similique.', 'Silver'),
(660, 2, '1970-12-31', 'Katrinaville', 'Darkorange', 'Lime', 'Afghanistan', 'Male', 'mertie.powlowski@example.net', '09138259240', 'Alfonso Nitzsche', '886 Tillman Station\nShanymouth, TN 92674-3654', 'Jacobiville', '1993-08-08 21:45:42', 'Id suscipit praesentium eum eaque rerum est. Ut perspiciatis provident assumenda voluptatibus et dolorem tempore. Facere aut pariatur voluptatibus temporibus. Eum id sit omnis iste quia est.', 'Gold'),
(661, 0, '1977-01-20', 'Davionberg', 'DarkTurquoise', 'DimGray', 'United States Virgin Islands', 'Male', 'megane.ratke@example.net', '1-843-544-0069x018', 'Zula Runolfsdottir III', '3376 Glen Field Suite 997\nJazmynberg, WI 58311-9902', 'Kevenland', '2007-02-08 12:08:36', 'Dolorem nihil ut quisquam sed quaerat. Harum illum aliquam facere consequuntur quibusdam consectetur. Consequatur tempore illum odio excepturi. Modi hic quam officiis quo iusto. Rerum qui libero quod et aliquid quia.', 'Gold'),
(662, 2, '1996-04-07', 'Langworthland', 'MediumSlateBlue', 'Snow', 'Chile', 'Female', 'mitchell.gisselle@example.com', '853-183-6591x981', 'Charles Stoltenberg', '34109 McKenzie Highway Apt. 143\nPort Markus, MD 37640-2545', 'Borermouth', '2002-06-19 23:28:54', 'Nemo saepe voluptatem voluptatem. Minima ut velit iure dicta itaque delectus doloremque. Fuga aut et quasi consequatur inventore dolores fugiat. Fugit consequatur et sunt dolore eligendi corporis.', 'Gold'),
(663, 2, '2016-09-24', 'Maegantown', 'BlueViolet', 'Khaki', 'Singapore', 'Not Select', 'rosenbaum.rebekah@example.org', '(867)413-1810x94434', 'Sonia Dooley', '7358 Jacobs Hollow\nWest Isobel, NY 50655-6911', 'West Kianport', '1986-10-03 20:58:41', 'Qui reprehenderit debitis et voluptatem molestiae cupiditate. Accusamus cum eos et. Et libero qui enim excepturi nobis.', 'Premium'),
(664, 0, '2011-10-29', 'New Sandytown', 'LightBlue', 'DarkOrchid', 'Iceland', 'Male', 'vinnie.heller@example.net', '(416)337-9761x471', 'George Murphy', '27078 Price Throughway Apt. 868\nNew Aurelie, MA 50749', 'South Stefan', '1977-12-19 15:51:01', 'Vel eaque dolor suscipit necessitatibus ducimus. Eius libero non impedit. Vel vel sunt explicabo perspiciatis eius. Repellat placeat facilis provident.', 'Gold'),
(665, 0, '1996-09-13', 'North Mialand', 'Thistle', 'DarkGray', 'Jordan', 'Not Select', 'sschmitt@example.org', '1-765-457-6121x37513', 'Wendy Aufderhar V', '52569 Kris Mission\nWest Leila, NY 41555', 'Bradland', '1991-03-29 21:28:16', 'Placeat et deleniti sed. Harum impedit esse explicabo rerum omnis. Ut voluptatem ratione veniam ea ut at dolores.', 'Free'),
(666, 2, '1972-05-01', 'West Remington', 'ForestGreen', 'Yellow', 'Pitcairn Islands', 'Male', 'elmo.purdy@example.net', '+35(1)1578691386', 'Prof. Erik Gottlieb PhD', '1113 Yundt Summit Apt. 867\nLake Morton, AR 05876-7342', 'New Jon', '1993-07-04 14:05:06', 'Dolore modi qui cupiditate ut. Expedita ex voluptate voluptas natus sapiente. Optio sunt et iusto architecto ipsum. Explicabo soluta eum ex.', 'Free'),
(667, 2, '2014-02-26', 'West Izabellastad', 'MediumBlue', 'Aquamarine', 'Guernsey', 'Not Select', 'oceane10@example.com', '744-738-0441x0518', 'Rocky Kuhic', '092 Hills Keys\nNolanside, MI 46668', 'Batzberg', '1972-04-24 01:45:06', 'Nobis rerum enim consectetur tempore. Cumque in esse aut est vero ab dolorum. Cupiditate in enim molestiae dolores aliquid.', 'Gold'),
(668, 2, '1995-08-02', 'South Howard', 'CadetBlue', 'Silver', 'Bolivia', 'Male', 'keshawn17@example.net', '(996)263-7053x83803', 'Jett Spinka IV', '4575 Ole Mission Apt. 494\nNew Rosarioberg, TX 93341-2268', 'Carterhaven', '1978-04-20 09:13:56', 'Quia est eaque aperiam sunt quis odio autem. Ullam dolore neque exercitationem cumque eum ipsam quo. Nulla illo totam minus et quos esse ad. Aut iste est iure voluptate et et. Occaecati nostrum ut non molestiae reprehenderit.', 'Gold'),
(669, 0, '1970-01-30', 'Vernonbury', 'Teal', 'Salmon', 'Western Sahara', 'Not Select', 'boyer.amelie@example.org', '(926)863-7357x963', 'Lois Rowe', '424 Elmira Heights\nSchusterbury, NJ 32199-8983', 'North Nikko', '2013-12-16 11:27:59', 'Consequuntur blanditiis magni eos accusantium praesentium commodi. Molestiae et voluptas placeat sit sunt. Debitis minus est sit qui. Sed sit saepe in saepe vero. Voluptatum at nihil voluptas eum et.', 'Free'),
(670, 0, '2018-08-18', 'Joyberg', 'Yellow', 'Darkorange', 'Micronesia', 'Not Select', 'van24@example.org', '08928879966', 'Emmanuel Schroeder IV', '331 Daniel Viaduct\nNorth Enid, GA 72686-8944', 'South Adele', '1994-02-20 12:46:22', 'Eveniet atque quo enim dolor. Necessitatibus repudiandae aliquam nam qui aut dolorem quia numquam. Cupiditate dolores necessitatibus ut et recusandae non vero.', 'Free'),
(671, 0, '2005-05-22', 'Lake Casandraton', 'MediumOrchid', 'MediumAquaMarine', 'Nigeria', 'Male', 'marjolaine29@example.org', '1-149-850-4679', 'Ms. Germaine Ullrich', '3073 Cloyd Manors\nEarnestineborough, NE 46954', 'Kossside', '2012-01-10 09:33:36', 'Quo quia et nihil quis soluta. Laborum at adipisci earum reprehenderit non odit quas iure. Accusantium tempora perferendis id perspiciatis eveniet et. A aut eos adipisci vel nam recusandae.', 'Gold'),
(672, 2, '2020-05-15', 'Wilburnport', 'LightGreen', 'Darkorange', 'Cape Verde', 'Not Select', 'sauer.paul@example.com', '134.008.3448x023', 'Bertram Fahey', '946 Faustino Vista Apt. 252\nGoldnerside, CO 27701-5415', 'Laurenceland', '1998-08-13 06:24:10', 'Laudantium asperiores est ea. Quo odio rem totam eos quod iure. Error qui quia voluptate odio magni doloribus quidem. Voluptatum cum architecto voluptatem.', 'Free'),
(673, 1, '1997-08-29', 'New Phyllis', 'MediumTurquoise', 'Fuchsia', 'Holy See (Vatican City State)', 'Not Select', 'zelma74@example.com', '489-198-3154x247', 'Mustafa Lindgren Jr.', '065 McClure Rapids\nLake Caroline, MI 16100-6925', 'South Karlieberg', '1975-05-15 00:52:51', 'Nihil aut deserunt sit eos ad dignissimos. Et reprehenderit impedit ullam quia. Ut ut dignissimos vel expedita est voluptates vero autem.', 'Gold'),
(674, 2, '2006-10-27', 'Ellastad', 'Purple', 'Cyan', 'Kazakhstan', 'Not Select', 'cummerata.imelda@example.net', '842.249.5388x313', 'Delfina Eichmann', '71268 Runolfsdottir Port\nPort Parker, MD 66473', 'Larsonport', '2014-01-01 22:24:18', 'Qui ea quasi esse molestias voluptas. Placeat corrupti voluptas neque. Corporis quibusdam enim excepturi corporis voluptas quia. Eum qui autem repudiandae explicabo similique sunt ut.', 'Premium'),
(675, 2, '2019-12-18', 'Ressietown', 'PaleGoldenRod', 'HoneyDew', 'Panama', 'Not Select', 'norval84@example.net', '1-934-158-3384x244', 'Mr. Jeffrey Schaden', '545 Bert Streets\nWebermouth, SD 12427-0303', 'Berthashire', '2014-08-18 03:12:52', 'Dolorum expedita vel voluptatem debitis tempora quidem dicta quaerat. Quo ad natus tempore aliquam est voluptatem enim. Consequatur aut doloremque occaecati aspernatur autem ratione. Accusantium provident minima minima tenetur occaecati pariatur ut.', 'Gold'),
(676, 1, '1971-02-13', 'Lorinechester', 'Yellow', 'Maroon', 'French Southern Territories', 'Not Select', 'abartoletti@example.com', '128-190-9027x670', 'Erick Barrows', '72858 Zulauf Row Apt. 305\nAdriannaview, LA 18003', 'West Laurine', '1976-04-02 01:04:16', 'Ut provident sed qui ipsam. Sed quos et iusto sunt inventore accusamus omnis. Voluptatem enim temporibus eum rem accusamus. Molestiae possimus voluptas qui harum.', 'Gold'),
(677, 1, '1988-07-20', 'Hartmannfort', 'DarkOrchid', 'Cornsilk', 'Cote d\'Ivoire', 'Male', 'igottlieb@example.org', '595-461-7933', 'Prof. Elijah O\'Conner', '4827 Beulah Oval\nKonopelskistad, NV 61674-0438', 'South Oletamouth', '1980-03-01 18:21:48', 'Exercitationem est adipisci fuga molestias tenetur totam suscipit. Consequatur ullam ipsa est. Quia sed occaecati rem. Libero modi in animi consectetur voluptatum laudantium quos.', 'Free'),
(678, 0, '2004-05-30', 'Lake Ulises', 'DarkGoldenRod', 'DarkBlue', 'Saint Martin', 'Not Select', 'oyost@example.com', '(065)330-9890', 'Lafayette Wunsch', '17144 Terence Rapid Suite 960\nSouth Rebaville, NE 84478', 'North Oscarstad', '2021-01-14 06:51:24', 'Voluptatibus voluptas sit laudantium et ullam. Quibusdam commodi ipsam aut consequatur qui. Cum ipsum tempora maiores laborum eius vel autem nobis.', 'Premium'),
(679, 1, '2012-02-08', 'Lake Audreanne', 'Sienna', 'Chocolate', 'El Salvador', 'Not Select', 'jessie45@example.org', '450.615.8232', 'Dr. Mallory Farrell DVM', '6453 Earnest Extension Suite 411\nKunzeville, OH 49959-7504', 'West Justus', '1974-02-27 12:28:48', 'Non harum optio id qui. Et est veniam delectus cupiditate numquam assumenda dignissimos perferendis. Natus consequuntur nobis earum perspiciatis enim. Consequatur officia in a magnam.', 'Gold'),
(680, 0, '1990-07-25', 'Rheahaven', 'LightSkyBlue', 'Fuchsia', 'Taiwan', 'Female', 'mraz.rose@example.org', '595-547-8488x6775', 'Lucius Graham', '3566 Kaci Mountain Apt. 956\nSouth Myrtice, KS 43769', 'Stanfordfurt', '2015-01-18 11:23:18', 'Possimus libero molestias et eos ad maxime. Nihil consequuntur nisi provident omnis. Dignissimos voluptas sed voluptatem eos ut.', 'Gold'),
(681, 1, '2017-03-19', 'South Diegoborough', 'DarkRed', 'MediumBlue', 'Bouvet Island (Bouvetoya)', 'Male', 'jadyn.swift@example.com', '632-449-8918', 'Otho Rolfson', '4289 Thea Mission Apt. 616\nFishermouth, SD 17475-7356', 'Cruzborough', '1993-01-05 22:17:48', 'Sint quis libero deserunt odio. Aut est esse et impedit id at consectetur. Ipsa ducimus maiores nihil qui sit. Ipsum quo nihil distinctio doloremque eligendi quo sint sint.', 'Silver'),
(682, 1, '1977-06-03', 'North Orville', 'DeepPink', 'Teal', 'Oman', 'Not Select', 'acormier@example.net', '(017)408-5446x151', 'Isaac Hegmann', '9703 Mortimer Shores\nDejonton, NH 45479', 'New Rosalee', '1975-11-03 15:25:44', 'Enim nihil eius id molestiae. Quis id nulla fugiat tenetur.', 'Silver'),
(683, 1, '2016-03-27', 'Port Camdenfort', 'Khaki', 'DarkBlue', 'Israel', 'Female', 'ruecker.ivah@example.com', '01108299210', 'Maegan Leannon', '998 Tad River\nNew Vallietown, AZ 72061-3754', 'Alphonsoville', '2006-02-06 05:58:35', 'Aperiam quia totam sit sapiente delectus natus. Sed magnam esse nobis voluptas. Consequatur quibusdam dolor inventore officiis provident et error quis. Rerum quidem dicta illum. Animi corrupti dolores repellendus quia.', 'Silver'),
(684, 1, '2017-07-03', 'Lake Malachishire', 'HotPink', 'Gainsboro', 'Macao', 'Female', 'kobe81@example.net', '+86(0)3559417115', 'Miss Alvena Bradtke DVM', '6883 Onie Circle\nPort Rosettamouth, ID 33534-9641', 'Port Felix', '2006-10-25 21:03:28', 'Numquam aut similique sed hic cumque dolor mollitia. Qui est nisi voluptates dignissimos. Consequuntur nesciunt est at deserunt. Debitis nobis illum autem repellat molestiae.', 'Gold'),
(685, 2, '1984-08-07', 'East Thora', 'LawnGreen', 'Teal', 'Slovenia', 'Female', 'alverta97@example.org', '00010686402', 'Josue Bernier', '6790 Virginia Plaza\nBirdieville, DC 27079-6572', 'Lake Murlside', '2014-06-06 15:13:59', 'Saepe asperiores et iusto voluptatem hic unde nam. Dicta aut dicta consequatur id. Facere molestiae minus perspiciatis dolores beatae nihil ducimus. Temporibus dolorum sit et repudiandae.', 'Premium'),
(686, 2, '1999-02-18', 'Francismouth', 'LightYellow', 'Brown', 'Tanzania', 'Male', 'bud.halvorson@example.com', '09826756326', 'Sandra Carter', '90989 Dare Spurs Suite 456\nSouth Carlieborough, KS 74798-7397', 'Port Isacfurt', '2003-06-23 17:01:30', 'Ea nisi similique ut omnis et et qui. Iste in repellat iusto libero voluptatem officiis assumenda.', 'Gold'),
(687, 0, '2016-07-08', 'Danielfurt', 'MediumPurple', 'OldLace', 'Syrian Arab Republic', 'Male', 'sadie52@example.org', '(336)780-5657', 'Hilario Jakubowski', '103 Jacinto Gateway Apt. 506\nRippintown, OR 39087', 'Romaguerahaven', '1983-06-17 04:29:10', 'Dicta nisi totam sequi quia impedit consequatur excepturi. Qui est rerum nisi id. Cumque officiis harum ratione id architecto. Libero et placeat deleniti incidunt earum explicabo eum.', 'Silver'),
(688, 1, '2011-05-21', 'Weimannchester', 'DeepSkyBlue', 'LawnGreen', 'Reunion', 'Not Select', 'boyle.natalia@example.com', '647.186.5846', 'Lance McClure', '84049 Chadd Place Suite 833\nSouth Alysachester, IN 45860-9329', 'Christyside', '1979-11-02 14:20:29', 'Quam non tempore sequi sed. Harum odio quae perspiciatis nostrum natus cumque. Eligendi et dicta sint expedita.', 'Premium'),
(689, 2, '2002-06-16', 'Brownport', 'Black', 'Maroon', 'Panama', 'Male', 'montana64@example.net', '1-492-357-0535x373', 'Florence Balistreri', '30641 O\'Keefe Branch\nEdamouth, MI 14977-8652', 'North Brianamouth', '2014-08-14 14:22:27', 'Officiis architecto quae est exercitationem dolores. Doloribus rem aperiam adipisci magni et id. Dolorem odio est atque. Sit necessitatibus saepe ad hic omnis quia distinctio.', 'Premium'),
(690, 2, '1998-07-20', 'Jeradburgh', 'Blue', 'DeepSkyBlue', 'France', 'Male', 'botsford.rosalia@example.com', '1-551-457-0044x90824', 'Dr. Bobbie Gislason', '45311 Imelda Oval\nLake Lennaville, AK 95982', 'Ryanbury', '1994-07-17 12:41:28', 'Eos maxime autem et et repudiandae. Illo et maiores et qui. Iste ut ea molestiae error tenetur eligendi sed. Rerum id aperiam enim tempora.', 'Gold'),
(691, 2, '1976-04-24', 'Cristshire', 'Maroon', 'Tan', 'Northern Mariana Islands', 'Male', 'lindgren.pascale@example.com', '1-462-869-1967', 'Cortez VonRueden', '8603 Deion Bridge Apt. 956\nKerlukeport, PA 85054', 'Port Kiley', '2011-01-13 23:23:26', 'Ut aut est quis dicta qui praesentium sint consequatur. Nemo quisquam similique distinctio sequi voluptas architecto. Inventore corporis a quae unde aut perferendis ut. Fuga ea laudantium quo est expedita.', 'Free'),
(692, 1, '1975-01-16', 'Lilianbury', 'Teal', 'Pink', 'Bangladesh', 'Not Select', 'effertz.alda@example.com', '1-656-538-4235x6033', 'Taryn Strosin', '47791 Ethyl Summit\nHarberborough, DE 34232', 'Predovicfort', '1985-01-21 03:04:04', 'Qui explicabo ut accusantium autem omnis. Doloribus ab omnis explicabo aut cumque illum. Voluptatem aut nesciunt sed ut ipsam rem. Non culpa quam rerum atque.', 'Premium'),
(693, 2, '1980-07-30', 'Reichelbury', 'LightGoldenRodYellow', 'Gold', 'Luxembourg', 'Female', 'elarkin@example.com', '(383)859-1977x55084', 'Dr. Elwin Larson', '28849 Mariam Brook\nNew Simonefort, NJ 85040', 'West Kaelynland', '1987-08-16 11:47:38', 'Sapiente quam aut sint quia. Culpa molestias est eos eius impedit eum nihil repellendus. Velit sed doloremque dolor expedita eum accusantium esse. Vitae voluptas ut quidem sunt error qui sit.', 'Silver'),
(694, 2, '1987-12-10', 'Brianneland', 'DarkBlue', 'Tomato', 'Lesotho', 'Male', 'qklocko@example.net', '092.086.5490x79654', 'Chester Larkin', '20667 Hayley Knoll Suite 122\nStacychester, NV 55148-4281', 'Volkmanbury', '2017-11-02 05:30:06', 'Sapiente rem fuga fuga voluptate. Aperiam aut laudantium fugiat necessitatibus tempore cupiditate.', 'Premium'),
(695, 0, '1982-10-03', 'North Leonie', 'Black', 'Azure', 'Chad', 'Female', 'leonie79@example.com', '(336)687-9395x5183', 'Dr. Rickie Feest V', '9857 Breitenberg Crossroad Apt. 368\nEast Mafalda, WA 09141-0367', 'Binsstad', '1995-03-31 21:39:41', 'Et et quis reiciendis quos. Numquam rerum et totam non error molestiae. Officiis quo voluptatem officia voluptatum. Porro dolor eveniet debitis asperiores fugit autem possimus.', 'Free'),
(696, 0, '1985-07-16', 'Warrenmouth', 'DimGrey', 'NavajoWhite', 'Northern Mariana Islands', 'Not Select', 'melyssa08@example.com', '170.917.1069x744', 'Mr. Clint Watsica', '8447 Emmerich Centers\nBinsshire, VA 94765', 'Rempelland', '1988-02-18 18:13:57', 'Vitae sed quia maxime eum aut. Porro est veniam vel recusandae consequatur iusto nihil. Et consequuntur in quis itaque provident ipsam. Saepe neque repellat vel velit rem. Modi ut sint consequatur quibusdam numquam provident.', 'Premium'),
(697, 0, '2017-07-04', 'Prohaskamouth', 'GreenYellow', 'Red', 'Palestinian Territory', 'Male', 'jordyn.pagac@example.net', '701.640.8493', 'Prof. Michel Schuster I', '485 Millie Stream\nWest Lorenaburgh, DE 51543-3372', 'South Waino', '2002-08-25 00:38:40', 'Non eos aperiam nisi quia. Adipisci et qui et rem. Saepe molestias sit explicabo quia tempora. Non eos deleniti est. Eum tenetur illum ut atque praesentium fugit tempora.', 'Free'),
(698, 2, '2006-05-05', 'Cheyannestad', 'Darkorange', 'OrangeRed', 'Moldova', 'Not Select', 'schimmel.carmel@example.org', '(789)489-6344x4866', 'Prof. Eli Stanton', '502 Lisette Cliffs Apt. 181\nLake Lia, DC 81859-2659', 'North Ezequiel', '1977-01-10 12:03:24', 'Est velit corporis ducimus. Laboriosam eligendi iste rerum minima aut sequi veritatis id. Ea sint eius suscipit omnis.', 'Free'),
(699, 0, '2015-04-02', 'Haleyfort', 'Turquoise', 'Orchid', 'Jersey', 'Male', 'anabelle.macejkovic@example.com', '(725)061-5506', 'Darius Schmeler', '1318 Tabitha Mall Apt. 937\nYostville, KS 27693', 'Madilynborough', '1989-05-18 12:01:15', 'Vero animi blanditiis nam. Dolores quia error et incidunt ut occaecati deserunt. Quia libero veritatis sit ipsum. Voluptate vel perferendis similique quas exercitationem.', 'Gold'),
(700, 2, '1980-02-12', 'West Maribelton', 'AliceBlue', 'Khaki', 'Kenya', 'Not Select', 'esmeralda.koelpin@example.com', '154.494.1380', 'Dr. Laron Dietrich', '2205 Fritsch Haven Apt. 764\nBeckerport, AL 63410-1990', 'Shadville', '2005-09-07 08:43:10', 'Numquam ut quod voluptas dicta. Ut quasi unde beatae maxime eum aut itaque occaecati. Totam quia enim non fugiat. Similique qui qui praesentium magnam aspernatur quae velit.', 'Silver'),
(701, 0, '1972-06-18', 'Osbaldomouth', 'MediumPurple', 'MediumAquaMarine', 'Uzbekistan', 'Female', 'timmothy23@example.org', '(238)971-1347x82910', 'Mario Block', '943 Green Views\nBuckridgeberg, KS 72449', 'North Ottisberg', '2011-12-20 12:44:49', 'Ut officiis non omnis optio aspernatur quas ut. Voluptatem deleniti aut reiciendis ad. Illum veritatis voluptas aut fuga aut ut quaerat. Id vero ab ratione aliquam vero et.', 'Gold'),
(702, 0, '2010-08-06', 'Roobfurt', 'Yellow', 'Gray', 'Mozambique', 'Female', 'rhansen@example.net', '803.930.6914', 'Dr. Percy Hartmann', '7021 Virginie Haven\nAlexandreaville, PA 17098-8991', 'Demetriusmouth', '1996-06-05 00:43:47', 'Esse quam dolores ea ea ab. Aperiam fuga incidunt nobis quas vel et porro. Et omnis cupiditate ea harum voluptas fuga.', 'Gold'),
(703, 0, '1990-09-21', 'New Alvisside', 'HoneyDew', 'CadetBlue', 'Portugal', 'Female', 'kylie.hayes@example.net', '410-261-5925x286', 'Adolf Effertz PhD', '48927 Teresa Cliffs Apt. 706\nCollierbury, NM 24565', 'Gabrielleview', '1988-11-16 11:38:18', 'Blanditiis minima aut laudantium. Tempore porro eligendi aut voluptate sit qui. Sequi unde aut nihil qui ut nihil tempore. Veniam natus perferendis est blanditiis voluptates laborum.', 'Free'),
(704, 2, '2020-09-13', 'Lake Letitiahaven', 'DarkViolet', 'DarkOrchid', 'Burkina Faso', 'Female', 'isai.reilly@example.org', '744.759.5603x5062', 'Samantha Tremblay', '7343 Nikolaus Burgs\nOswaldoberg, NC 17950-9593', 'East Camyllefurt', '1976-02-05 11:44:36', 'Maiores aut sunt est est. Est molestias itaque natus eum. Et iure magni rerum officia. Culpa eius in dignissimos porro non sapiente facilis delectus.', 'Free'),
(705, 0, '2008-09-01', 'Rubyeshire', 'Tan', 'DarkSalmon', 'Cuba', 'Female', 'darryl78@example.net', '679-167-8434x1109', 'Oscar Nader', '08073 Brain Extensions Apt. 604\nNew Ewaldberg, MO 39111', 'West Bailee', '2015-11-06 08:41:45', 'Aut excepturi dicta sint voluptatem vel ratione nesciunt. Tempora repellat perspiciatis aspernatur officia. Aut rerum eaque vel quaerat magnam porro rerum officia.', 'Free'),
(706, 2, '2009-01-02', 'Mayemouth', 'MediumOrchid', 'Moccasin', 'Saint Martin', 'Not Select', 'willms.vince@example.net', '144.359.2287', 'Prof. Elta Mertz', '779 Cormier Freeway Apt. 158\nSchoenborough, UT 92241-9599', 'Bryanaburgh', '1982-04-04 12:37:38', 'Rem quis quae non ex quia. Odio nisi rerum ducimus impedit pariatur et et. Provident quis rerum quia enim. Enim voluptatem eveniet et fugit voluptatum.', 'Gold'),
(707, 1, '1971-06-12', 'Drakestad', 'DarkKhaki', 'DimGray', 'Guernsey', 'Not Select', 'david.romaguera@example.com', '329.848.7234x399', 'Ms. Aurelie Cole PhD', '67498 Hettinger Row Suite 839\nLake Giovannaville, VT 22787', 'Port Jordy', '1994-04-14 01:09:30', 'Delectus mollitia voluptatem nesciunt sit expedita ipsam. Sed pariatur omnis molestias ratione tempora enim odio soluta. Commodi illum eaque necessitatibus non ipsa.', 'Gold'),
(708, 1, '1998-04-24', 'West Olentown', 'Aqua', 'Darkorange', 'Lao People\'s Democratic Republic', 'Not Select', 'dschultz@example.com', '06714158978', 'Eugenia Bartell', '118 Erica Lock Suite 732\nEast Jamirburgh, AK 79371-3148', 'South Deshaunhaven', '1981-04-26 19:02:05', 'Laborum repellat nostrum et reiciendis soluta eligendi. Corrupti quo mollitia alias quis. Dolores officia soluta consectetur et.', 'Premium'),
(709, 2, '1993-10-23', 'Lake Margaret', 'Moccasin', 'Khaki', 'New Caledonia', 'Not Select', 'shanon55@example.org', '02021227770', 'Prof. Taurean Romaguera', '28182 Mayer Branch Apt. 892\nKuhnmouth, FL 50866', 'Port Dahliabury', '1983-11-12 12:12:33', 'Illum eum aut dolore ipsam quis. Quisquam mollitia quisquam ut tempore. Veniam natus quia quia. Id aliquid unde ullam. Quos sequi iste nam non qui assumenda est.', 'Gold');
INSERT INTO `individual` (`id`, `status`, `date_of_birth`, `place_of_birth`, `church_name`, `organization`, `country`, `gender`, `email`, `phone`, `name`, `address`, `city`, `since`, `description`, `packet`) VALUES
(710, 1, '2005-10-05', 'East Darrellland', 'Cornsilk', 'Lime', 'Colombia', 'Not Select', 'deanna92@example.org', '310.749.8976', 'Janae Zboncak', '793 Oberbrunner Stream Apt. 664\nRosenbaumshire, IA 46605-0498', 'Enochchester', '1996-11-30 00:30:45', 'Perferendis officiis quod est laudantium. Iste minus laudantium totam accusantium facere aliquid sit. Odio ut non est est doloremque. Ut atque dolore aut et nihil provident ratione omnis.', 'Gold'),
(711, 2, '1987-12-09', 'North Devin', 'LavenderBlush', 'BurlyWood', 'El Salvador', 'Not Select', 'rachael.swift@example.net', '486-702-1903', 'Paula Lindgren', '535 Breanna River Suite 849\nWest Edgar, CA 69985', 'Carissafort', '2010-12-02 09:17:44', 'Quia aliquid vel facilis id tempora. Tenetur rem consequuntur illo excepturi consequuntur occaecati. Nam molestiae dolor maxime animi et.', 'Premium'),
(712, 2, '2016-08-27', 'Lake Audramouth', 'Cyan', 'WhiteSmoke', 'Somalia', 'Male', 'blanca.dach@example.net', '850-366-8171x55319', 'Mrs. Betty Hudson Sr.', '85007 Ryan Passage\nPort Maxine, CA 87386-1195', 'West Rosemary', '2010-06-03 19:34:42', 'Quo et aliquam suscipit vero quo qui in. Natus repudiandae nam numquam. Eius a dolores sint modi inventore et veritatis.', 'Gold'),
(713, 2, '2013-11-09', 'North Loniemouth', 'Moccasin', 'PowderBlue', 'Saudi Arabia', 'Female', 'angeline31@example.net', '451.955.4273', 'Dr. Keenan Hermann', '39029 Sawayn Village\nDanehaven, VA 88483', 'Volkmantown', '2016-06-08 08:15:21', 'Repudiandae minus deserunt corporis dolor. Sunt dolorem tempora aut quae aspernatur fuga minima cupiditate. Id aliquam qui modi laborum ipsa omnis voluptatem.', 'Premium'),
(714, 1, '2019-09-22', 'New Budborough', 'PaleGreen', 'Sienna', 'Solomon Islands', 'Not Select', 'ward.dasia@example.com', '1-792-041-7659x676', 'Jorge Harris', '38396 Harvey Knoll Apt. 792\nHarrisonborough, IN 10468-4458', 'Port Hannaville', '1977-09-03 21:55:26', 'Est et similique aliquam distinctio et iure placeat id. Nam dolorum voluptatum ab et omnis quis. Voluptatem qui id quos hic est magni. Ea repudiandae voluptatem dolore ipsum odit vel omnis.', 'Free'),
(715, 1, '2020-08-06', 'South Brendafort', 'Bisque', 'HotPink', 'Luxembourg', 'Not Select', 'hirthe.osborne@example.net', '+06(6)5287537886', 'Julianne Gislason', '6188 Dorothea Radial Apt. 138\nWest Audie, NJ 28658', 'West Krystelfort', '1975-08-23 11:15:38', 'Ipsa ullam quia facere qui sint. Delectus in totam laboriosam a quo. Sequi eius quis laborum quibusdam. Magnam sed reprehenderit quidem.', 'Premium'),
(716, 0, '1972-07-18', 'Kosstown', 'Coral', 'SeaGreen', 'Georgia', 'Not Select', 'taylor86@example.org', '08703303368', 'Devonte Collier', '974 Oberbrunner Valley\nBrandiburgh, MI 76953', 'South Martina', '2020-10-03 03:19:01', 'Excepturi sed ut amet autem illo. Voluptates aut delectus velit ea. Dolorem aut optio eos provident ut tenetur qui.', 'Silver'),
(717, 2, '1997-08-04', 'Port Shirleyview', 'MediumOrchid', 'DeepPink', 'Cyprus', 'Male', 'afton69@example.com', '1-641-275-9532x463', 'Lelah Waters MD', '5391 Bins Villages Apt. 718\nPort Reinachester, OR 25102', 'Mullerton', '1976-12-14 17:58:10', 'Voluptate asperiores distinctio necessitatibus molestias. Quo ab illum cumque qui. Molestiae iste facere veniam veritatis. Nihil libero laudantium labore ratione.', 'Free'),
(718, 0, '1978-06-28', 'Sarahmouth', 'DarkCyan', 'GhostWhite', 'United States of America', 'Female', 'penelope.schamberger@example.org', '(197)324-4534', 'Cara Hintz', '0538 Bins Springs Suite 125\nSouth Devyn, OR 07982-3317', 'East Will', '1979-04-08 09:59:39', 'Error modi aut et. Ad vel voluptas assumenda neque quis. Adipisci omnis dolorem alias reprehenderit.', 'Gold'),
(719, 2, '1973-04-05', 'Feilfort', 'AliceBlue', 'Darkorange', 'Solomon Islands', 'Male', 'skoch@example.net', '1-980-427-1630', 'Manuel Terry', '367 Wyman Fords Suite 878\nSouth Harrisonberg, GA 28050', 'Brownfurt', '1994-02-12 00:57:27', 'Explicabo qui maxime est dolores unde. Consequuntur molestiae consequuntur nostrum illo. Maiores consequatur qui perspiciatis quisquam et totam necessitatibus.', 'Free'),
(720, 1, '2020-06-19', 'Port Marcelle', 'DarkSeaGreen', 'SkyBlue', 'Venezuela', 'Male', 'vlind@example.net', '837.652.5154x0343', 'Abelardo Keebler', '414 Swaniawski Manors\nLake Zackeryville, TN 48094-2126', 'West Lottie', '2009-10-27 00:35:01', 'Numquam est molestiae iure non non. Hic eos dicta et non ut. Ullam aliquid ut inventore pariatur.', 'Premium'),
(721, 1, '1974-02-28', 'Port Lindsayshire', 'HoneyDew', 'DodgerBlue', 'Turkmenistan', 'Male', 'lrogahn@example.net', '000-104-7464x29888', 'Prof. Vanessa Beer I', '70672 Rice Mill Suite 271\nGulgowskimouth, MA 34493', 'South Stephanburgh', '1997-03-01 08:13:29', 'Voluptas et amet eos. Reprehenderit soluta suscipit est. Quam aut qui dolores qui.', 'Gold'),
(722, 1, '1971-09-07', 'Port Arnoldchester', 'PaleVioletRed', 'Thistle', 'Israel', 'Male', 'rroberts@example.net', '(803)645-5548x04932', 'Catharine Abshire', '59490 Nick Plains Apt. 921\nSouth Ilenehaven, IN 39596-1538', 'Monahanstad', '1987-05-03 22:40:49', 'Ut qui corporis doloremque rem. Sit sint tempora repellat vero earum. Provident soluta corporis et corporis. Occaecati ex et aliquid quod.', 'Silver'),
(723, 2, '1985-06-21', 'Port Rodview', 'DarkSlateBlue', 'FloralWhite', 'United Arab Emirates', 'Female', 'damaris28@example.net', '09959501681', 'Miss Paige Medhurst II', '55314 Von Plaza\nSouth Susanna, MT 87620', 'Langoshborough', '2009-05-21 09:15:21', 'Perspiciatis illo ad ut quis sunt sapiente. Quia itaque et libero aut dolores. Est facilis mollitia facilis explicabo voluptatem voluptate eaque. Voluptatem deserunt et nihil impedit error amet.', 'Premium'),
(724, 1, '1989-03-27', 'Boyerfort', 'MediumSlateBlue', 'CadetBlue', 'Madagascar', 'Male', 'gene27@example.com', '950.212.6092', 'Polly Breitenberg', '62401 Lebsack Overpass Apt. 857\nWest Brad, NY 50863', 'Courtneymouth', '1998-12-26 22:14:28', 'Ipsum vero tempore molestiae sunt ipsum. Accusantium sint vero facere.', 'Gold'),
(725, 0, '1973-05-24', 'Darlenechester', 'Darkorange', 'LightYellow', 'Northern Mariana Islands', 'Not Select', 'dimitri.rowe@example.com', '100-031-0357x022', 'Elton Daugherty', '9039 Feeney Drives Apt. 287\nGottliebstad, WV 28423-8573', 'Farrellborough', '1993-04-21 21:28:55', 'Recusandae aut dolorum quo cum voluptatibus. Distinctio veritatis qui fugit consequuntur. Cumque quia ut et qui.', 'Gold'),
(726, 0, '1975-06-16', 'Baumbachhaven', 'GreenYellow', 'NavajoWhite', 'Holy See (Vatican City State)', 'Not Select', 'gaylord.evie@example.org', '284.320.6542', 'Filiberto Trantow DDS', '69475 America Gateway Suite 445\nPort Lilly, OH 82460', 'Clementinestad', '2009-03-13 10:31:44', 'Modi voluptatem eum possimus qui officia libero. A dolores totam quidem nesciunt earum aut. Sapiente veritatis recusandae accusantium quisquam placeat dicta omnis.', 'Gold'),
(727, 2, '2003-07-21', 'Baileetown', 'Blue', 'Coral', 'Cuba', 'Male', 'knikolaus@example.org', '1-643-775-4960x720', 'Prof. Derek Breitenberg', '14229 Ryan Landing\nNew Katharina, TX 11372', 'Lake Ulisesport', '2008-05-10 14:39:02', 'Ea ut enim molestiae rerum minus totam et. Assumenda quisquam dignissimos quam quaerat quidem aut perferendis. In nihil iure rerum laborum vitae nulla. Veritatis maxime dolorem nulla facilis.', 'Premium'),
(728, 1, '1988-06-10', 'New Geo', 'LightPink', 'Sienna', 'Belarus', 'Female', 'collins.jewel@example.com', '1-856-945-6687x59401', 'Moriah O\'Hara', '33595 Ethel Spring\nDonhaven, MN 62295', 'Ladariuston', '1992-02-10 00:07:29', 'Quasi et quas odio vel. Laudantium sapiente ratione est dolor qui. Aut omnis sint ea aut.', 'Free'),
(729, 2, '2021-06-15', 'Wymanfort', 'DarkGray', 'Salmon', 'Micronesia', 'Female', 'lyric71@example.org', '220.297.5289', 'Orion Blick', '423 Magdalen Rue Suite 565\nSouth Elmira, GA 32279', 'Howeville', '2021-02-27 00:12:55', 'Molestiae qui sit nihil officiis. Fugiat dolorem sit qui at placeat. Possimus quia omnis qui esse qui.', 'Free'),
(730, 0, '2006-01-04', 'South Elodychester', 'DarkOliveGreen', 'SandyBrown', 'Malawi', 'Not Select', 'pstark@example.com', '1-614-851-5591x332', 'Breana Kerluke DDS', '638 Queen Ville\nFadelside, LA 06836-5643', 'Lowefort', '1995-07-19 20:45:55', 'Nihil et minima id aut. Suscipit similique ea quas porro deleniti reprehenderit vel dicta. Commodi est tempora omnis nesciunt a illum ducimus fuga.', 'Premium'),
(731, 0, '1995-08-15', 'Stoltenbergtown', 'LightGray', 'Teal', 'Saint Helena', 'Male', 'catalina.rodriguez@example.net', '041.561.7220x150', 'Beatrice Kunze', '1553 Runolfsson Circle Apt. 143\nNew Yvonneburgh, KS 57293-3338', 'New Sven', '2014-10-16 02:46:35', 'Perferendis libero assumenda esse ut voluptatibus magnam et quae. Dolorum error voluptatum accusamus voluptatem aliquid. Quo omnis error labore aliquam. Tempora voluptatem labore corrupti nihil esse. Dolore accusamus nihil voluptates deserunt quis labore ', 'Premium'),
(732, 2, '2020-11-05', 'North Myrtletown', 'DarkSalmon', 'DarkBlue', 'Ecuador', 'Male', 'yschoen@example.com', '01167302781', 'Myah Morar', '4109 Carlo Garden\nUptonland, AZ 96707', 'West Kathrynehaven', '2010-06-01 06:36:49', 'Et autem magnam itaque laboriosam dignissimos et quae. Minus cumque perferendis ut laboriosam.', 'Gold'),
(733, 1, '1979-10-01', 'East Ariellemouth', 'LightSkyBlue', 'MediumVioletRed', 'Jamaica', 'Male', 'lou32@example.org', '(462)896-5802x576', 'Prof. Serenity Jacobs', '049 Adaline Streets Apt. 183\nPort Martina, AK 32202-9053', 'Kuphalville', '1986-02-22 13:48:56', 'Omnis omnis labore id atque dolor error. Officia voluptas fugiat aspernatur necessitatibus eius omnis commodi alias. Sunt laboriosam et modi magni suscipit. Deserunt ea consequatur doloribus ut eligendi dolor provident dolores.', 'Silver'),
(734, 1, '1981-03-31', 'South Albinberg', 'Green', 'Lime', 'Burundi', 'Not Select', 'kiehn.ellie@example.org', '1-900-505-3000', 'Darwin Armstrong', '51255 Kulas Ridges Suite 894\nSouth Julianaton, ID 64405', 'Kyrashire', '1980-03-05 09:16:59', 'Assumenda voluptatem laboriosam omnis sunt officia aut. Ab et nostrum dolorem et quia unde eius commodi. Suscipit maiores cupiditate aut amet.', 'Premium'),
(735, 2, '2011-09-17', 'South Aron', 'PapayaWhip', 'Lime', 'Libyan Arab Jamahiriya', 'Not Select', 'xpurdy@example.net', '1-106-143-2647x3504', 'Chase Tromp', '647 Justina Place\nElectafort, ME 69202-8401', 'Pietroport', '1976-05-14 20:23:47', 'Dignissimos consequatur est asperiores rerum est et. Unde ea maiores sed cupiditate. Tempore cum et corporis et impedit numquam est. Sapiente in nihil placeat nihil praesentium alias.', 'Silver'),
(736, 1, '1974-11-10', 'West Antwanport', 'DarkGreen', 'PaleTurquoise', 'Ecuador', 'Not Select', 'connelly.shayne@example.com', '1-422-584-4809', 'Prof. Geoffrey Kling V', '0030 McCullough Junctions Apt. 409\nCristport, WA 84082-9693', 'Gerlachstad', '2008-03-18 09:33:57', 'Commodi asperiores reiciendis animi et dolores quo facere. Corrupti rem voluptatem commodi esse et.', 'Silver'),
(737, 0, '1978-11-08', 'Yostshire', 'MediumSlateBlue', 'Azure', 'Bhutan', 'Female', 'cgulgowski@example.net', '1-312-984-7679', 'Mason Skiles DDS', '631 Werner Junction\nJadabury, ID 54124', 'Port Mary', '1976-08-17 04:42:36', 'Voluptatum rerum et sapiente nostrum ipsa quia. Quo quaerat nobis ut odio qui ab. Laboriosam fugit asperiores voluptatum cupiditate qui totam. Molestias incidunt deleniti est accusamus voluptas eveniet illum atque.', 'Gold'),
(738, 1, '2005-01-07', 'South Jacky', 'Teal', 'BurlyWood', 'Micronesia', 'Not Select', 'lherman@example.net', '(088)831-9807', 'Reina Renner', '37664 Steuber Well Suite 142\nChristianmouth, MD 36990-9597', 'Torreybury', '1992-07-20 08:11:40', 'Quidem harum nulla provident enim expedita. Aut occaecati dolor itaque dolores molestiae voluptatibus sit. Sapiente ipsum fugit odit quod fugit et.', 'Premium'),
(739, 1, '1973-08-11', 'New Annabellehaven', 'Peru', 'MediumOrchid', 'Bulgaria', 'Male', 'bertrand71@example.org', '816-954-5179x116', 'Cali Collins', '86558 Kelsi Shore Apt. 812\nEinarhaven, FL 88037', 'Lake Calistatown', '2006-06-16 03:15:25', 'Sequi dolorum excepturi sed. Nulla aperiam voluptate et sed quo accusantium rerum nemo. Quae veritatis ducimus iusto rerum ex quos voluptatem.', 'Premium'),
(740, 0, '1989-08-31', 'Altenwerthville', 'Gold', 'OldLace', 'Botswana', 'Not Select', 'ethyl.dibbert@example.com', '(211)932-0859x25433', 'Constantin Volkman', '6120 Lacey Springs Apt. 001\nPort Burdette, TX 80793', 'South Bradlystad', '1989-06-06 00:53:26', 'Ducimus officiis earum at voluptatibus. Sed et accusamus illum provident assumenda occaecati quae ipsam. Aut sunt nobis distinctio fugit placeat doloribus sint aut. Fugiat exercitationem non et officia voluptas. Ipsam explicabo iure vel blanditiis sunt.', 'Gold'),
(741, 0, '2010-12-18', 'Jarrellland', 'ForestGreen', 'Plum', 'Vanuatu', 'Not Select', 'lilian42@example.org', '1-705-437-9525', 'Noemy Dooley', '0037 Kendrick Cliffs Apt. 387\nSouth Catherine, MT 93680', 'North Taniatown', '2018-08-19 09:38:52', 'Amet exercitationem veritatis quas tempora ipsam alias. Necessitatibus blanditiis placeat et asperiores nihil. Minima ut sit et quos sed deleniti sunt ipsam. Atque sed sed officia tenetur qui.', 'Premium'),
(742, 2, '1982-05-15', 'Nashberg', 'Indigo ', 'LightSalmon', 'Cameroon', 'Female', 'ekertzmann@example.org', '(517)771-9489x636', 'Dr. Caitlyn Lind MD', '6647 Mireya Parkways Apt. 726\nLockmanmouth, WA 17885', 'West Leilaton', '1977-12-06 20:01:18', 'Id optio enim maxime odit aliquid. Nesciunt sit quos suscipit. Est mollitia omnis dignissimos possimus. Labore et animi ut amet aut fuga error.', 'Free'),
(743, 0, '1981-03-23', 'South Waylon', 'WhiteSmoke', 'BurlyWood', 'Equatorial Guinea', 'Not Select', 'queen.feil@example.org', '825.496.1325', 'Malika Welch', '733 Karen Canyon\nJastside, KY 88359-3697', 'Jermeyport', '1992-04-05 14:14:17', 'Voluptate qui nihil recusandae delectus iusto. Eaque a dolores nihil occaecati. Eum ducimus et culpa et reiciendis cumque est est. Sunt veritatis est ipsam aliquid incidunt.', 'Gold'),
(744, 2, '2012-01-09', 'Schulisthaven', 'Yellow', 'SteelBlue', 'Guinea', 'Male', 'aron.miller@example.net', '(538)063-4257x099', 'Leilani Orn', '92743 Rachel Viaduct Apt. 433\nPort Fatima, CA 06079-9603', 'South Kieramouth', '2005-05-20 19:07:37', 'Dolorem velit suscipit unde non facilis quo. Nesciunt dolorem quia corrupti dolores. Itaque ea rerum pariatur.', 'Gold'),
(745, 1, '1997-07-04', 'Clovismouth', 'MediumPurple', 'LavenderBlush', 'Germany', 'Not Select', 'eino47@example.net', '086.044.8642x924', 'Travon Kuhlman I', '702 Robel Skyway Suite 661\nWest Royal, CO 92752', 'Port Taureanborough', '2003-04-02 12:52:25', 'Consequatur sed dignissimos et et corporis qui explicabo incidunt. Molestiae quia sit voluptatem.', 'Free'),
(746, 1, '1985-11-21', 'Lake Abel', 'FloralWhite', 'PaleTurquoise', 'Equatorial Guinea', 'Male', 'vesta.lubowitz@example.net', '741-918-4563x91790', 'Emerson Lehner', '04007 Rhianna Union Suite 303\nEliasshire, MO 63604', 'Port Sunnyton', '1984-05-23 19:03:11', 'Enim quas voluptatem quas perspiciatis dignissimos dolores cupiditate. Est ut ad expedita quasi omnis labore. Sed eum beatae laboriosam.', 'Gold'),
(747, 2, '2017-11-11', 'Kylerberg', 'NavajoWhite', 'Yellow', 'Saint Lucia', 'Male', 'lila77@example.net', '049.000.2599x907', 'Mrs. Jaida Trantow V', '9142 Viva Hills\nSouth Lorenshire, NY 09321-9660', 'Adalbertoborough', '2012-07-21 19:06:42', 'Placeat aut voluptas hic sunt dolorum reiciendis. Molestiae blanditiis voluptatibus eum est repudiandae enim. Quisquam est sed recusandae magni facere quia harum.', 'Gold'),
(748, 1, '1989-07-30', 'New Caesar', 'PaleGoldenRod', 'SlateGray', 'Fiji', 'Female', 'katherine.stehr@example.net', '605-686-0307x854', 'Elmira Rolfson', '90904 Karine Branch\nWest Kaydenshire, PA 59054-1394', 'Everardoview', '1978-01-26 09:24:28', 'Explicabo sed sunt et. Illo quod omnis rerum amet excepturi. Aut debitis est et ipsam esse ipsum et.', 'Premium'),
(749, 1, '1979-10-06', 'New Kyleborough', 'Lavender', 'AliceBlue', 'Comoros', 'Female', 'addie.muller@example.com', '08877450276', 'Haylee Waters', '8388 Eriberto Overpass Suite 799\nArleneborough, UT 44776-8997', 'Vladimirtown', '1982-05-23 16:45:40', 'Possimus repellat id consequatur consequatur qui consectetur optio. Aut magni explicabo ut delectus. Repellat voluptatem necessitatibus numquam est ea perspiciatis aut.', 'Silver'),
(750, 0, '2020-12-05', 'Luettgentown', 'FireBrick', 'LightGray', 'Belize', 'Male', 'rupert79@example.org', '1-598-890-9410x5389', 'Ofelia Weber', '06873 Gislason Points Suite 328\nNorth Edwina, IA 15751', 'Port Feliciahaven', '1976-10-22 08:22:48', 'Quas aperiam omnis eos mollitia ipsam vel accusantium. Vel sed odio eveniet perferendis. Saepe placeat ea fugit ducimus beatae.', 'Silver'),
(751, 0, '2006-05-20', 'Port Vincenza', 'Navy', 'MediumVioletRed', 'Solomon Islands', 'Male', 'sylvan.herzog@example.net', '1-261-889-8056x7898', 'Kayla Cruickshank', '3011 Darwin Lakes\nSouth Stewart, WV 19555-0992', 'Danielville', '1975-06-26 06:48:12', 'Harum animi molestias adipisci. Sunt accusamus iusto et provident. Cum ipsum ea doloremque consequuntur.', 'Premium'),
(752, 2, '2021-05-01', 'Vadaton', 'Khaki', 'HoneyDew', 'Belgium', 'Female', 'qlueilwitz@example.net', '(576)105-1369x975', 'Mitchell O\'Keefe', '5297 Frami Station\nNew Larissamouth, NH 94446', 'Lake Shirleymouth', '1998-02-13 14:49:17', 'Molestias nisi eum id sint aut dolor. Aut quo voluptatibus aliquam non numquam numquam autem. Amet repellat quisquam veritatis consequatur quos.', 'Silver'),
(753, 0, '1995-04-25', 'South Elverafort', 'DarkBlue', 'PowderBlue', 'Turkey', 'Male', 'jaquelin.mcclure@example.org', '1-797-669-5788x53341', 'Coralie Kunde', '21547 Sabryna Drive\nNorth Augustine, OK 72804-8285', 'New Joanyside', '1980-08-15 02:27:09', 'Vel excepturi repellendus reprehenderit. Est molestias quod quidem sed voluptas dolorum fugit. Rerum laborum occaecati quis veniam officia.', 'Premium'),
(754, 0, '2021-03-02', 'North Elfriedaland', 'DeepPink', 'Ivory', 'Nepal', 'Female', 'vicente52@example.com', '1-769-081-0850x2105', 'Florencio Wolff', '009 Blair Cape Apt. 343\nElnaview, ND 53598-3106', 'Lake Amiya', '2003-11-14 18:03:18', 'Et voluptas assumenda alias perferendis voluptatem. Consequatur est fugit sed. Odio perspiciatis deleniti repellendus optio.', 'Premium'),
(755, 0, '1998-05-09', 'Abbeyburgh', 'Peru', 'DarkSeaGreen', 'Spain', 'Male', 'dkeebler@example.org', '107.936.0234x75882', 'Dr. Cornelius Hodkiewicz III', '77187 Fahey Wall\nWalkerchester, IL 13717-3052', 'Andersonville', '1972-02-22 12:12:45', 'Repudiandae tempora tempora eum consequatur ut doloribus. Omnis odit et nulla officia temporibus. Optio doloremque quo consectetur officiis. Est quisquam a deleniti dolorem corrupti et voluptatem id.', 'Silver'),
(756, 0, '2000-07-19', 'North Harrison', 'PaleTurquoise', 'Cornsilk', 'Jamaica', 'Not Select', 'gabbott@example.com', '976-957-7350x928', 'Rico Spinka', '90027 Dickinson Squares\nNorth Duane, NC 12843-2813', 'East Imogenemouth', '1979-07-06 00:13:38', 'Sit enim eaque eum repellat et minima molestiae omnis. Magnam voluptas at soluta. Repudiandae fugiat provident vel sit numquam sed sit ut.', 'Gold'),
(757, 2, '1975-05-15', 'New Sigurdborough', 'DarkTurquoise', 'Sienna', 'Peru', 'Male', 'madaline09@example.net', '177.872.6302x457', 'Miss Cayla Gulgowski PhD', '514 Price Highway\nKennethtown, VT 01148-8863', 'South Bertrandburgh', '2001-03-26 02:15:08', 'Cumque pariatur et ipsam illo explicabo. Asperiores aliquid similique iure ut animi. Omnis labore qui velit et soluta. Laborum consectetur eveniet eum ut quaerat numquam.', 'Gold'),
(758, 1, '1979-12-13', 'Evansside', 'DeepSkyBlue', 'DarkViolet', 'Iceland', 'Female', 'vschinner@example.com', '1-091-066-1501x0753', 'Mr. Evert Larkin II', '537 Hessel Walks\nWest Zulaville, RI 77470', 'West Kyleeburgh', '1978-10-08 18:15:52', 'Est quia officiis maxime qui velit facilis omnis. Ea voluptatem quod unde iusto quam veniam ut.', 'Free'),
(759, 2, '1977-01-20', 'West Ally', 'DarkGreen', 'OliveDrab', 'Papua New Guinea', 'Not Select', 'kimberly20@example.org', '1-322-852-4333x13104', 'Scotty McGlynn IV', '367 Bulah Port\nNew Margarete, FL 09160', 'South Waldofurt', '1988-11-26 04:38:52', 'Porro cupiditate quia inventore error velit aut provident. Nobis ad ut voluptates architecto maxime tempore. Consequatur dolores odit dolor cupiditate.', 'Free'),
(760, 0, '2003-06-30', 'Wildermantown', 'MediumSpringGreen', 'Khaki', 'United States of America', 'Female', 'lcarroll@example.net', '575.780.3361', 'Carolyne Graham', '7217 Nathanial Point\nLake Sofia, IN 19603', 'Collierborough', '1994-11-28 15:18:20', 'Aliquam at illum eum aspernatur ullam magni odit. Aliquam quis voluptatibus placeat amet. Laboriosam qui qui et debitis deserunt soluta.', 'Gold'),
(761, 0, '1988-06-05', 'North Julianamouth', 'Orange', 'PeachPuff', 'Liechtenstein', 'Female', 'annie56@example.org', '1-386-360-4432', 'Terrill Haag', '802 Mertz Landing\nPort Logan, OR 58555-3010', 'South Eliaschester', '1999-12-13 01:26:13', 'Ex ullam aut et quis et voluptatem eligendi facere. Iure quis unde aliquam eum. Cum delectus eos facere autem. Quibusdam ut ea voluptatem distinctio aut sapiente.', 'Premium'),
(762, 2, '1980-01-25', 'South Mallory', 'MediumAquaMarine', 'SeaShell', 'Cuba', 'Not Select', 'royce96@example.net', '(851)918-4189x19166', 'Mr. Tony Larson', '21714 Elizabeth Vista Suite 696\nLake Allanside, TN 50232-0708', 'Simonisside', '1999-12-02 00:30:32', 'Voluptate repellat est maxime iusto. Optio dignissimos quaerat velit modi. Et et perferendis at et suscipit. Amet ipsum veniam nam.', 'Free'),
(763, 2, '2004-08-04', 'West Nicole', 'IndianRed ', 'Aqua', 'Sierra Leone', 'Not Select', 'o\'hara.ted@example.org', '264.983.7616x002', 'Kenyatta Willms', '004 Schmeler Route\nRempelland, WA 20055-0300', 'Conroyhaven', '1981-07-01 22:51:43', 'Commodi hic a occaecati tempora et amet quae fugit. Sint iste harum sint velit. Dolore nihil iste ut dolorem sunt voluptates laboriosam amet.', 'Gold'),
(764, 0, '2000-11-11', 'North Kasandramouth', 'LightBlue', 'Plum', 'Korea', 'Female', 'ernest.olson@example.com', '1-556-045-1695x921', 'Corine Dietrich', '761 Sauer Coves Suite 515\nKonopelskiview, KS 00052', 'Ernestochester', '1982-02-08 02:20:25', 'Nam distinctio quis et voluptates dolores saepe. Error laudantium quia alias molestiae et perspiciatis nisi. Corporis deserunt enim officia. Neque voluptate quibusdam et maiores veniam eveniet et velit.', 'Silver'),
(765, 0, '2022-04-27', 'Port Rosalee', 'Silver', 'DarkKhaki', 'Greenland', 'Not Select', 'reichel.jason@example.net', '09120548545', 'Dr. Jo Wilkinson DVM', '6690 Kyler Fords\nPort Coltenton, UT 32279-4828', 'New Buckshire', '1974-08-27 05:20:51', 'Blanditiis cupiditate vero cum sunt. Ipsum dolor sed et deleniti modi. Tempora ipsam ex laboriosam odit nihil. Esse qui eveniet labore atque laudantium dolor excepturi placeat.', 'Gold'),
(766, 2, '2007-11-18', 'Lake Valentin', 'DarkViolet', 'Gold', 'Uruguay', 'Female', 'chloe59@example.com', '+04(4)3550340959', 'Abe Bins', '18985 Jessyca Bridge Apt. 297\nSouth Jammie, NC 39467-8134', 'North Vella', '1972-02-05 11:40:01', 'Sint alias pariatur qui animi excepturi harum. Cum vitae id enim ipsa quia ut molestias cupiditate. Voluptas ipsum maxime et vitae laudantium alias. Sit doloribus perspiciatis qui aut corrupti consequatur dolores.', 'Gold'),
(767, 1, '1984-08-24', 'West Llewellynbury', 'Magenta', 'DodgerBlue', 'Luxembourg', 'Male', 'brady44@example.com', '(253)327-9575x9525', 'Danika Rowe II', '29785 Allene Flat\nJakubowskimouth, IA 03355', 'Bonitaview', '1983-03-04 18:11:13', 'Assumenda unde in et quae quia iste. Maiores expedita culpa animi enim. Illum laborum ducimus veniam in et itaque esse.', 'Gold'),
(768, 2, '1970-01-25', 'New Parisland', 'HoneyDew', 'Aquamarine', 'Nicaragua', 'Female', 'angus75@example.org', '(019)429-5610x472', 'Mr. Gaston Crona', '481 Schaefer Alley\nWest Anabelle, OH 54531', 'South Elwinmouth', '2014-09-28 11:40:51', 'Pariatur et ad natus. Autem repudiandae consectetur asperiores. Veritatis vel sit tenetur aut. Autem animi debitis tempore et.', 'Silver'),
(769, 0, '1988-08-14', 'Lehnershire', 'Beige', 'MediumPurple', 'Saint Lucia', 'Female', 'trenton41@example.org', '1-999-199-0544', 'Nella Renner', '85205 Gutmann Plains Apt. 800\nEmmetfort, LA 08138-1430', 'North Jewelltown', '1974-10-25 00:20:01', 'Vel facilis beatae aperiam eos odio voluptatibus corrupti. Dolorem quo ipsam cum aut mollitia minus vel. Alias amet aliquam vero vitae maxime minima. Sint nostrum voluptate quas est architecto odit.', 'Silver'),
(770, 0, '1971-01-28', 'Schowalterborough', 'Beige', 'MediumPurple', 'Jersey', 'Not Select', 'harrison.murphy@example.com', '852.529.9617x535', 'Prof. Jalon Rowe', '84869 Virginia Path Suite 794\nIsabelton, ID 01089-9616', 'Borerstad', '2009-02-07 16:23:16', 'Nesciunt quia et dolorem deleniti. Ea velit vel sed fugit nihil voluptas esse et. Esse et architecto ut perspiciatis. Ullam quasi magnam ducimus commodi.', 'Gold'),
(771, 1, '1986-03-11', 'Lake Doyle', 'Brown', 'Green', 'Bolivia', 'Male', 'alisa.predovic@example.net', '+80(8)0382001653', 'Burley Stokes', '347 Orville Spring\nLondonberg, KS 53973-6321', 'Steuberchester', '2007-11-03 19:39:07', 'Et in ut tempora voluptatem. Rerum qui animi dolor ut molestiae quas. Velit vel debitis et laborum est quis in. Iure omnis veniam expedita quia.', 'Gold'),
(772, 0, '2013-03-25', 'Maximilianstad', 'Aquamarine', 'Coral', 'Cayman Islands', 'Male', 'aorn@example.org', '(296)510-2723x6997', 'Jarrett Huel', '95574 Verner Extension Suite 920\nWest Brenna, MI 28857', 'West Kari', '1994-05-24 18:53:02', 'Voluptates unde laudantium dicta consequatur. Aut ad consequuntur consectetur consequatur. Iure veritatis tempore ratione rerum.', 'Gold'),
(773, 2, '1982-08-24', 'Genovevastad', 'SpringGreen', 'SkyBlue', 'Mongolia', 'Female', 'nmorissette@example.net', '(107)209-9580x689', 'Chelsey Little IV', '6263 William Forest Apt. 437\nWest Tobin, AL 61679-9966', 'Mohamedton', '2014-02-01 10:27:51', 'Et odio eum iure rerum ipsam nobis. Et voluptates nam veniam cumque in magnam. Voluptates voluptatem voluptas ut. Itaque doloremque et iure beatae.', 'Free'),
(774, 0, '1978-11-30', 'West Mortimerside', 'DarkViolet', 'LightCyan', 'United States Minor Outlying Islands', 'Female', 'misael16@example.net', '730.603.8110x0904', 'Dr. Magali Ratke', '928 Olson Centers\nMonahanborough, GA 52280', 'Gutkowskiburgh', '2007-12-16 04:54:20', 'Deleniti veritatis aut qui quia deserunt quia. Explicabo sunt quae ipsa voluptatem. Accusamus consequuntur reprehenderit vitae sed sit nostrum quia.', 'Gold'),
(775, 1, '1992-09-21', 'North Rosendoshire', 'OliveDrab', 'LawnGreen', 'Lithuania', 'Female', 'cristal41@example.net', '(836)836-5254x616', 'Lloyd Hoppe', '075 Ansley Vista\nSteuberport, MS 00586-7551', 'Lake Brannonborough', '2006-05-13 00:10:10', 'Quia et tempore eum est. Adipisci pariatur non maiores laboriosam modi saepe in. Animi quis quis voluptate dolores quia nemo commodi. Explicabo voluptatem doloribus nemo ab vitae et. Hic soluta voluptatem et temporibus numquam et saepe.', 'Free'),
(776, 0, '1974-11-14', 'North Marie', 'MistyRose', 'DarkRed', 'Heard Island and McDonald Islands', 'Female', 'npaucek@example.net', '1-426-249-2654', 'Prof. Eileen Schuster', '65212 Paul Corners\nPort Blaze, WI 28304', 'West Forrestmouth', '1987-10-08 15:29:42', 'In ad impedit deserunt expedita eos perferendis qui. Minus fugit autem aut quia accusantium officia. Est vero eos quia doloremque aspernatur. Et quo laborum enim corporis laudantium sunt.', 'Silver'),
(777, 0, '2015-12-27', 'West Christy', 'Cyan', 'DeepPink', 'Saint Lucia', 'Female', 'lindgren.casandra@example.com', '(444)116-5497x4886', 'Dr. Therese Rempel V', '75860 Wolf Villages Suite 012\nWest Eusebioshire, MO 81997-4839', 'East Germainefurt', '1996-05-15 11:51:32', 'Consequatur consequatur ab maiores itaque tempore ab minus consequatur. Tempora ut ut consequuntur. Officia vel est dolorem vel neque. Consectetur repellendus qui architecto atque ratione dignissimos eos.', 'Premium'),
(778, 0, '2005-06-09', 'Lake Colemanview', 'BlueViolet', 'PaleVioletRed', 'Saint Helena', 'Not Select', 'michelle24@example.org', '(576)475-8544', 'Mrs. Carmela McLaughlin DVM', '5292 Runolfsson Key Suite 953\nWebermouth, SC 63577', 'Veumbury', '1992-03-13 07:08:05', 'Aut repellat eum sunt consectetur est. Vel explicabo ut rerum impedit. Numquam dolorem aperiam ipsum quam reprehenderit adipisci iste. Sit nihil magnam dolores ut eos recusandae eius.', 'Gold'),
(779, 1, '2017-09-24', 'North Edna', 'DarkTurquoise', 'DarkCyan', 'Western Sahara', 'Female', 'koss.elza@example.org', '(922)272-0639', 'Deja Rogahn', '0664 Lynch Loop Apt. 144\nAratown, DE 57686', 'Nicoletteborough', '2000-12-23 16:35:03', 'Nesciunt nisi nihil quasi suscipit. Eligendi recusandae modi excepturi deleniti.', 'Premium'),
(780, 2, '1981-06-23', 'Lake Penelope', 'Magenta', 'DarkSlateBlue', 'Switzerland', 'Female', 'cferry@example.net', '(723)783-1777', 'Chaya Hackett', '762 Julianne Course Suite 451\nRicetown, VA 59726-9684', 'Bonnieborough', '1986-05-05 22:48:37', 'Consectetur repudiandae pariatur quo ab. Asperiores molestiae ea consequatur nihil inventore adipisci.', 'Silver'),
(781, 0, '1992-12-29', 'Port Dorthychester', 'Cyan', 'Orchid', 'Dominica', 'Male', 'kaela72@example.org', '598-906-6013x46793', 'Prof. Santos Larson', '8270 Bernier Plaza\nLake Monaport, FL 20659-8725', 'East Vidafort', '2020-11-14 19:08:36', 'Consequatur non numquam sunt quibusdam sit non. Alias rerum incidunt nesciunt odio repellendus inventore fuga exercitationem.', 'Silver'),
(782, 1, '2018-09-05', 'North Roger', 'Linen', 'Aqua', 'Suriname', 'Male', 'ubaldo.mckenzie@example.net', '740-119-6567x8390', 'Rhianna Windler Jr.', '9025 Kenya Manor Apt. 702\nLeschshire, DC 64514', 'East Dovie', '1975-12-22 00:51:08', 'Reiciendis ut aliquam cum fugiat consequatur. Consequuntur hic rerum magnam ipsam. Nesciunt accusamus autem qui.', 'Silver'),
(783, 2, '2014-09-05', 'Amyashire', 'DeepSkyBlue', 'SandyBrown', 'Nauru', 'Not Select', 'raynor.zion@example.com', '(470)557-3480x914', 'Donato Parisian', '433 Blanca Plains\nDeloresstad, MS 30514', 'East Macie', '1992-02-09 16:21:01', 'Distinctio consequatur nobis maiores odio quia. Et unde ut aut neque et. Perspiciatis consectetur similique non labore earum ut voluptatum.', 'Premium'),
(784, 0, '1978-05-12', 'New Jettshire', 'Beige', 'LightGray', 'Cuba', 'Female', 'jack43@example.org', '258-066-9069x6412', 'Prof. Enoch Strosin', '168 Maybell Court\nBarrettton, IL 07806', 'Lake Preciousburgh', '2008-04-04 19:36:02', 'Quia quaerat nesciunt consequatur inventore. Eaque eum eius vero. Et unde nemo saepe quibusdam consequatur. Ut possimus et ut at animi eum labore.', 'Silver'),
(785, 1, '1984-05-23', 'Jeromyside', 'DarkBlue', 'LightSkyBlue', 'Cape Verde', 'Not Select', 'donnelly.webster@example.com', '697-777-3777x20624', 'Mr. Brook Nienow', '00311 Desiree Cliff Suite 307\nSouth Lavinafurt, DE 79335', 'Barrowsland', '2000-03-27 08:10:58', 'Praesentium doloremque repudiandae laudantium labore. Illo voluptatum impedit libero voluptatem. Modi recusandae dolorem ea accusantium. Quis eum vitae id.', 'Gold'),
(786, 2, '1989-02-13', 'New Ryder', 'PeachPuff', 'LawnGreen', 'Bolivia', 'Male', 'aracely49@example.com', '538-790-4044x355', 'Prof. Jerrod Kerluke DDS', '94713 O\'Kon Neck\nDavisview, WV 95203-6515', 'Port Brockburgh', '2006-04-04 10:00:57', 'Vel ut quo at. Placeat est ea mollitia a necessitatibus voluptatem aut laboriosam. Autem repellendus voluptatem dolor et laudantium corporis.', 'Gold'),
(787, 1, '1989-11-25', 'West Abby', 'DarkSeaGreen', 'PowderBlue', 'Jordan', 'Male', 'jabari.boyer@example.net', '+35(6)8356768387', 'Eusebio Leuschke', '8720 Hermina Burgs Suite 500\nSkylaton, MN 13880-7520', 'Wittingmouth', '2003-02-22 20:14:01', 'Dicta sed nisi odit sint unde blanditiis. Et error ut quis laboriosam est ducimus optio. Unde eum quo omnis et explicabo ipsa. Fugiat atque tempore doloribus dicta.', 'Free'),
(788, 0, '2001-07-04', 'Lake Kayville', 'Cyan', 'DarkSlateGray', 'Ireland', 'Male', 'rkshlerin@example.org', '+83(2)9420475846', 'Prof. Cade Bechtelar Sr.', '9344 Jacques Spur Suite 019\nNew Allieshire, IN 18052', 'North Candice', '2003-06-07 21:17:30', 'Eum voluptate aut et qui. Voluptatem pariatur rerum libero deleniti. Minus totam est non amet quas animi. Aut perspiciatis dolorem corrupti harum sit.', 'Free'),
(789, 1, '2004-09-02', 'East Adriana', 'LavenderBlush', 'MediumSpringGreen', 'Peru', 'Female', 'shanahan.taurean@example.com', '(989)903-7748x17142', 'Glen Marvin', '79795 Shanahan Branch\nKellifurt, VA 80148-2172', 'North Kellimouth', '1999-12-19 05:12:34', 'Occaecati temporibus ea rerum ex repellat doloremque perspiciatis beatae. Voluptatum omnis in et sit reiciendis. Rerum ad quibusdam beatae est iusto eos facere. Natus asperiores enim et mollitia hic vitae.', 'Silver'),
(790, 0, '1991-01-18', 'Lake Olafstad', 'LightYellow', 'SeaShell', 'Congo', 'Female', 'phyllis.hackett@example.org', '00896682444', 'Dr. Chesley Doyle Sr.', '213 Kris Trafficway Apt. 335\nMannport, VA 44494', 'East Maiya', '1980-10-07 23:54:20', 'Eveniet ut minima ex ullam. Aliquam non incidunt vero dicta eaque. In dolores dolores fugiat ex natus non laboriosam quia. Ducimus quos eos non saepe quae non. Soluta dolores aut iste voluptatem maiores.', 'Gold'),
(791, 0, '1990-09-16', 'West Noemy', 'OldLace', 'LightSlateGray', 'Guatemala', 'Female', 'esteban97@example.net', '1-746-418-2777x83461', 'Tyrell Johnston', '029 Colt Isle\nEast Orpha, CA 85618', 'Zboncakville', '1975-03-26 10:29:57', 'Accusantium ad est dicta quidem quisquam minima. Molestiae eos repellendus deserunt sed facilis dolor non. Voluptatem quis voluptate iusto ut vel earum reiciendis.', 'Premium'),
(792, 0, '1988-02-06', 'Annettaton', 'DarkGray', 'SlateGray', 'Brunei Darussalam', 'Female', 'katrine70@example.org', '843-636-5857x8411', 'Amanda VonRueden', '40943 Zakary Forges\nNorth Marcelinaburgh, CA 01779-0989', 'Beckertown', '2019-08-05 05:58:56', 'Quasi tenetur aspernatur atque illum. Similique et blanditiis rerum animi tempore suscipit incidunt. Tenetur laudantium accusantium dolore nostrum dolore facere et. Qui et error qui ullam sapiente.', 'Silver'),
(793, 2, '2010-06-27', 'East Fanny', 'LightSteelBlue', 'Crimson', 'Brazil', 'Male', 'johnston.terry@example.com', '05449483265', 'Wiley Tillman III', '6245 Karley Land Suite 470\nLittelport, NE 53775', 'South Emelyfort', '1985-03-08 19:05:32', 'Est nobis officia qui incidunt. Consequatur quae numquam et. Iure doloribus optio eaque. Quos asperiores accusantium exercitationem odit tempore. Numquam voluptatem quaerat optio dolor ipsa quod numquam consequatur.', 'Free'),
(794, 1, '2011-12-02', 'New Haley', 'LightCoral', 'PapayaWhip', 'Liechtenstein', 'Not Select', 'zola.leuschke@example.com', '05479279130', 'Dr. Caterina Sipes', '37211 Weimann Glens\nJovanland, SD 23215', 'Sebastianfurt', '2017-08-28 00:16:16', 'Cum tenetur recusandae enim omnis eaque asperiores. Quod aspernatur voluptate provident dicta saepe. Aspernatur ullam maxime culpa voluptatem. Qui et aut deserunt praesentium.', 'Free'),
(795, 1, '2013-07-09', 'West Deonteview', 'SandyBrown', 'SpringGreen', 'Albania', 'Female', 'malinda.jacobi@example.org', '(366)887-3059x142', 'Maxine Dickens', '148 Elmore Greens Suite 022\nNewtonside, PA 14672-2609', 'New Tristian', '2010-12-17 04:38:57', 'Tempora sed molestiae et impedit odit eligendi. Et beatae doloribus illum quos et voluptatem id. Autem qui labore hic eaque quaerat.', 'Free'),
(796, 1, '2016-07-21', 'Freidatown', 'Cyan', 'Salmon', 'Djibouti', 'Female', 'gulgowski.monserrate@example.org', '1-223-200-1535x8286', 'Mireille Stoltenberg', '3197 David Course Apt. 597\nSwaniawskichester, NV 61993-7265', 'New Connorside', '1998-10-25 10:37:01', 'Voluptas expedita dolore laudantium animi. Sequi praesentium dicta et repellendus aut. Placeat neque quia doloremque et temporibus sunt. Neque aut harum veniam dolorem tempora architecto aliquam assumenda.', 'Premium'),
(797, 2, '1993-10-12', 'Dereckton', 'MediumSeaGreen', 'Violet', 'Peru', 'Male', 'myles.vandervort@example.net', '634.516.1254', 'Marlene Kilback', '9420 Micah Parks Suite 731\nLake Abdulmouth, DE 45195', 'Blandamouth', '2003-03-19 07:26:31', 'Et deleniti deserunt quia aut quia qui et. Reprehenderit enim vitae atque voluptatem est deleniti. Odio ratione amet quidem quia.', 'Silver'),
(798, 0, '1989-06-08', 'Janiyatown', 'LightCoral', 'AliceBlue', 'Venezuela', 'Not Select', 'gerhold.hilton@example.net', '807.655.3733', 'Mr. Kraig Terry II', '360 Stokes Wells\nLake Ritatown, HI 31742-7553', 'Port Brandyn', '1995-01-25 19:42:30', 'Molestias quia adipisci et. Enim ullam et fugiat et. Porro molestias quam omnis voluptatem et. Esse totam autem vero eveniet debitis ex beatae.', 'Gold'),
(799, 2, '2011-06-03', 'South Kasey', 'DarkSalmon', 'DarkCyan', 'Malaysia', 'Not Select', 'brigitte.windler@example.net', '032.944.5293', 'Mr. Holden Hettinger', '32626 Hintz Keys Apt. 309\nJeantown, DE 54532', 'North Lilabury', '1997-01-11 03:23:14', 'Recusandae praesentium ex velit debitis pariatur similique culpa. Dolorum occaecati veritatis eius assumenda sapiente id. Nisi nobis ab aut ut voluptatum. Nisi id rerum debitis omnis ipsam doloribus.', 'Silver'),
(800, 0, '1984-03-16', 'West Deonte', 'PeachPuff', 'Blue', 'Faroe Islands', 'Female', 'katelyn.lang@example.org', '326.839.3417', 'Dr. Michale Breitenberg II', '054 Mraz Ford\nGretchenmouth, VA 59032', 'Huelsborough', '2007-08-18 13:50:27', 'Aut consequatur ab necessitatibus et sed. Et doloremque nulla corrupti tempora aperiam eius.', 'Premium'),
(801, 2, '1995-09-29', 'Reichertstad', 'Pink', 'CornflowerBlue', 'Cambodia', 'Male', 'dagmar.beer@example.org', '(172)492-7652', 'Rosa Fritsch', '1347 Aron Squares Apt. 629\nPort Emerson, ID 59482', 'Heidenreichberg', '2011-12-07 10:33:39', 'Dolores quis quisquam nisi. Ea placeat enim rerum mollitia. Id quisquam quia animi non. Explicabo ex adipisci omnis.', 'Premium'),
(802, 2, '2015-06-27', 'Metzstad', 'DarkSlateBlue', 'Cyan', 'Mauritius', 'Female', 'reyna.morissette@example.org', '+64(9)1840852947', 'Dr. Katelyn Carter Jr.', '698 Koepp Course Suite 344\nBennettberg, MI 36224', 'Micheltown', '2006-11-20 07:34:56', 'Quo molestiae libero aperiam molestiae sed doloribus voluptas est. Blanditiis voluptate sunt sapiente sint voluptatem. Exercitationem error omnis facilis modi.', 'Premium'),
(803, 2, '1985-09-23', 'Candacefort', 'BurlyWood', 'LightBlue', 'British Virgin Islands', 'Not Select', 'christy.stehr@example.com', '+41(5)1136883163', 'Zoey Parisian', '9198 Javon Haven Apt. 128\nKristaborough, FL 38765', 'Klington', '1975-10-16 16:15:37', 'Et et dolorum enim unde blanditiis voluptas a. Et cum corporis aut et molestiae. Sed id necessitatibus non sed nesciunt nostrum.', 'Free'),
(804, 1, '2012-11-26', 'Trystanland', 'LightSeaGreen', 'Moccasin', 'Japan', 'Female', 'quitzon.randal@example.org', '940-577-7331x97133', 'Ms. Alessandra McKenzie Sr.', '9013 Reichert Locks Apt. 766\nNew Jordane, AL 66295-9796', 'North Mortimerfort', '1976-08-29 13:43:51', 'Sunt quos quisquam voluptates assumenda et. Quae debitis officia dicta autem illum veniam neque. Culpa esse quis adipisci minima perferendis nisi consequuntur.', 'Gold'),
(805, 2, '1987-02-11', 'East Rebeccafort', 'GhostWhite', 'DarkViolet', 'Papua New Guinea', 'Male', 'tressa06@example.org', '+97(8)0904932776', 'Zelma Trantow', '0089 Padberg Hill Apt. 629\nAlysaton, UT 15604-9870', 'Balistrerimouth', '2011-11-02 22:50:24', 'Aut eveniet aut possimus non est et illum. Voluptatem dolores tempora quibusdam optio esse. Possimus tenetur sit ab similique ut eum. Reprehenderit laudantium cupiditate eos.', 'Free'),
(806, 2, '2012-08-02', 'West Anthony', 'Teal', 'DimGray', 'Guernsey', 'Male', 'hmarks@example.com', '1-027-637-9787x090', 'Gregory Aufderhar', '76969 Torphy Trail\nEast Elvis, UT 08688-3792', 'Micaelamouth', '1970-07-22 16:32:54', 'Fugiat eum et ullam voluptate et totam quia reiciendis. Excepturi veniam voluptatem eveniet voluptatibus suscipit libero nobis. Veritatis cum dignissimos nemo itaque accusantium quos ratione.', 'Free'),
(807, 0, '2022-04-09', 'West Elaina', 'Aquamarine', 'MediumSpringGreen', 'Estonia', 'Not Select', 'kerluke.meagan@example.org', '+33(1)0358722579', 'Prof. Selena Schaden Jr.', '972 Rickie Mall\nAftonton, IA 71424-4809', 'Hobartville', '2011-01-18 18:37:48', 'Tempora aut saepe quaerat qui provident et earum. Assumenda laboriosam voluptatum non accusantium facilis aut quia minus. Dolorem voluptatem iure minus dolores aut qui. Ut modi dicta laudantium ea est asperiores iste.', 'Gold'),
(808, 0, '2010-12-30', 'Lake Mireya', 'DarkOliveGreen', 'Maroon', 'Hong Kong', 'Not Select', 'lang.orland@example.org', '058-040-2814x87542', 'Cierra Schiller I', '291 Henry Crossing Apt. 749\nWest Itzelbury, SD 18431-0115', 'Lake Corbin', '2013-06-19 07:45:52', 'Enim voluptas est laborum accusamus fugit. Doloremque dolores vel quo unde. Perferendis commodi tempore vel non velit.', 'Gold'),
(809, 1, '1972-03-20', 'Port Jeffrey', 'Orange', 'Bisque', 'New Zealand', 'Male', 'jlangworth@example.org', '1-614-279-9529x274', 'Rosalee Brekke MD', '686 Cordell Walk Apt. 430\nTaureanburgh, NY 35219', 'West Quincy', '1976-11-24 21:40:53', 'Fugiat aut consequatur ut vero iste error. Soluta id laudantium et atque expedita. Qui doloremque accusantium consequatur ullam et veritatis.', 'Premium'),
(810, 2, '1984-10-01', 'Maximomouth', 'Beige', 'LemonChiffon', 'Saint Pierre and Miquelon', 'Male', 'clarabelle.brekke@example.net', '295-301-5907', 'Ruthe Ernser', '82431 Schaden Glens Suite 800\nEast Brent, WA 95917', 'East Lilianstad', '1981-09-04 13:41:25', 'Necessitatibus dignissimos amet aut commodi enim sit non. Sint laudantium exercitationem nihil alias voluptatem consequatur quas accusamus. Repellat totam magnam qui velit.', 'Silver'),
(811, 0, '2021-06-16', 'Port Gennaro', 'SeaShell', 'RoyalBlue', 'Bhutan', 'Not Select', 'amarvin@example.net', '1-030-647-7804x19971', 'Jazmyn Hoppe', '5435 Celia Hollow Suite 412\nReeseland, WY 62126', 'East Mireilleton', '1989-02-08 06:28:59', 'Voluptatem quisquam corrupti omnis et qui qui. Recusandae deleniti accusantium nam non. Cumque voluptatibus dolores quidem doloremque autem omnis est. Et consequatur minima sunt accusantium corrupti.', 'Premium'),
(812, 1, '2006-07-16', 'North Chelsie', 'CadetBlue', 'GoldenRod', 'Sri Lanka', 'Female', 'cschowalter@example.com', '+03(6)9893330722', 'Jaclyn Shields', '24134 Colten Spring Apt. 605\nBorisfurt, LA 88402-8618', 'Rohanfurt', '2022-01-08 07:43:15', 'Consequatur cum quia pariatur voluptas aut. Labore et dolores dolorem iure. Sed nostrum quia delectus temporibus veniam nesciunt qui.', 'Free'),
(813, 1, '1988-07-25', 'East Carley', 'PeachPuff', 'Tomato', 'Western Sahara', 'Female', 'larissa.d\'amore@example.net', '(402)555-5687', 'Mr. Jerrell Kirlin', '595 Greyson Causeway\nBruenbury, ID 84694-0040', 'Ruthehaven', '2002-09-22 23:01:54', 'Ut ut quia adipisci eos pariatur fugiat aut pariatur. Quis sit ullam nemo a et voluptatem quibusdam. Veniam voluptas perferendis dolorem voluptatibus voluptatibus omnis ad.', 'Silver'),
(814, 2, '1989-01-11', 'West Ramonfort', 'Violet', 'BurlyWood', 'Anguilla', 'Male', 'rahul.gerhold@example.org', '+43(9)7709133934', 'Elda Becker', '059 Garnett Village Suite 752\nNew Amirastad, MA 88941-9071', 'Lake Malcolmfort', '2022-01-01 10:14:07', 'Optio nam ut laudantium laborum sed dolorem autem molestiae. Mollitia molestias ut esse libero.', 'Premium'),
(815, 2, '1981-03-19', 'Hilllshire', 'LightPink', 'Snow', 'Egypt', 'Not Select', 'fjacobson@example.com', '01106265765', 'Mr. Emerald Kris', '3896 Art Center\nLake Glenna, WY 35088-6222', 'Lake Narcisoburgh', '1999-09-09 20:07:26', 'Qui sed occaecati ducimus fuga. Provident illum quasi eligendi autem temporibus voluptatem est. Ut voluptas odit vero dolorem sunt est et. Tenetur ea rerum optio in maiores autem.', 'Silver'),
(816, 0, '2007-09-26', 'South Afton', 'Snow', 'Salmon', 'Israel', 'Male', 'tlebsack@example.com', '(810)681-1028x605', 'Prof. Petra Simonis', '37421 Afton Circles\nNewellville, KS 69130', 'North Lydaville', '2001-03-26 13:21:37', 'Laborum quia cumque et. Occaecati dignissimos nostrum et sequi fugit. Explicabo nesciunt minima aut nesciunt neque veniam et quia.', 'Premium'),
(817, 2, '2006-08-23', 'North Anissa', 'SkyBlue', 'RosyBrown', 'Egypt', 'Female', 'anahi.moen@example.com', '664.352.0128', 'Ophelia Collier', '55799 Mitchell Plains\nDustinchester, OH 64836-1078', 'Graciebury', '1975-10-19 23:32:01', 'Aut quae deserunt exercitationem officia vel consequatur occaecati autem. Accusantium autem quas ratione. Id qui corporis qui possimus ducimus mollitia voluptatum.', 'Free'),
(818, 1, '1986-02-27', 'North Meta', 'PaleTurquoise', 'Maroon', 'Dominican Republic', 'Male', 'elvie.cartwright@example.com', '264-477-7237', 'Dr. Gilbert Baumbach', '249 Herman Mill Apt. 468\nPort Aileenmouth, MT 16225', 'Armstrongchester', '2005-05-10 06:44:10', 'At veniam officiis tempora laborum. Officia quo sed ipsam amet quasi. Porro veritatis quod rerum eveniet accusantium minima at.', 'Gold'),
(819, 1, '2016-10-13', 'North Lennie', 'Silver', 'DarkOrchid', 'New Caledonia', 'Male', 'xwaters@example.com', '1-236-510-8156', 'Dr. Olaf Smith', '781 Mafalda Motorway\nSouth Demetris, MI 89967', 'North Shane', '1972-06-16 16:55:37', 'In veritatis fuga explicabo quas ratione ut ipsam. Mollitia qui odit laudantium porro illo sit aut sunt. Voluptatibus animi voluptatum adipisci ut aspernatur eos ut. Odit sed omnis quam modi fuga.', 'Silver'),
(820, 2, '1989-11-17', 'West Nash', 'MediumSlateBlue', 'MintCream', 'Guam', 'Male', 'smitham.rick@example.net', '(572)262-0333', 'Eloisa Jaskolski', '466 Lucienne Hills Suite 991\nChetfurt, KY 67990', 'East Pietro', '2008-01-31 01:42:46', 'Quis similique in odio laborum qui ipsum. Laboriosam nobis et illo labore quia et aut. Est odit non ratione vitae qui iste delectus. Assumenda molestiae perferendis qui.', 'Gold'),
(821, 2, '2019-12-06', 'Pagacfurt', 'Darkorange', 'Pink', 'Greenland', 'Female', 'stone.koch@example.org', '878-949-2352x02189', 'Jayne Kovacek', '75153 Cleta Run Suite 696\nAraceliview, WY 82581', 'Port Brianaland', '1987-07-28 20:09:46', 'Nulla repudiandae possimus et accusantium rerum. Recusandae ea labore id reprehenderit iste distinctio. Dolorem molestias perferendis accusamus delectus dolorum. Sit earum dolorum sed animi.', 'Silver'),
(822, 1, '1999-05-15', 'North Kendrickfurt', 'Red', 'LightSalmon', 'Svalbard & Jan Mayen Islands', 'Male', 'adaline47@example.net', '1-417-841-5036x9434', 'Mr. Sage Maggio DDS', '7172 Erling Springs Suite 418\nHartmannfurt, FL 50866', 'North Simeon', '2016-04-22 02:08:33', 'Laborum veniam iste rerum assumenda. Occaecati earum eum saepe quis ut odit velit. Molestias voluptatem dolorem soluta nihil illo inventore vel.', 'Silver'),
(823, 2, '1996-11-17', 'New Adolf', 'Gainsboro', 'Khaki', 'Aruba', 'Not Select', 'hailey.gutkowski@example.com', '1-256-606-2245x2627', 'Mr. Mohammed Runolfsson', '992 Kerluke Burgs Apt. 322\nRayland, TN 40610-8331', 'Yundtport', '1974-05-31 00:39:21', 'Aliquam explicabo in nisi et. Accusamus consectetur blanditiis beatae similique. Aut cum fuga et rerum est sit ullam hic. Aperiam fugiat beatae animi.', 'Gold'),
(824, 0, '1998-04-21', 'Port Ilianaton', 'Maroon', 'Darkorange', 'Samoa', 'Female', 'kamren.goldner@example.org', '(227)537-6742x554', 'Jaqueline Carter', '39027 Sharon Ways\nPfannerstillview, TX 25051-3209', 'Vicenteview', '1985-10-13 13:14:04', 'Dolor quod atque sint illo repellendus assumenda hic saepe. Ut minus ex a cupiditate dolores veniam nesciunt. Inventore consectetur eaque nesciunt dolorem error.', 'Premium'),
(825, 0, '1991-12-17', 'Wymanside', 'GreenYellow', 'LightGoldenRodYellow', 'Switzerland', 'Male', 'barton.johnathan@example.net', '(567)251-3036x51628', 'Jaylan Denesik', '8641 Abernathy Valleys Apt. 338\nJustinastad, TX 31131', 'Kossberg', '2019-04-01 18:11:39', 'Expedita nam quisquam quasi deserunt incidunt. Nemo optio sed eum quae quia qui totam doloremque. Sunt provident voluptatem tempora asperiores.', 'Premium'),
(826, 2, '1995-08-19', 'New Jerodport', 'Khaki', 'Coral', 'Gibraltar', 'Female', 'kunde.alanis@example.com', '101-415-8404x5783', 'Zola Miller', '20131 Bosco Crossroad\nConroyhaven, ID 04088', 'Haileymouth', '1982-11-05 03:43:30', 'Consectetur consequuntur velit et consequatur impedit pariatur ut. Enim non quos quisquam unde ullam aut.', 'Silver'),
(827, 2, '1972-04-01', 'Karsonchester', 'Orange', 'DarkSlateGray', 'Gabon', 'Not Select', 'idickens@example.net', '(704)095-6308x26462', 'Anissa Leffler', '097 Landen Views Suite 858\nMillsstad, CA 17604-5200', 'Dickiville', '1992-12-13 01:15:16', 'Alias blanditiis saepe est est quas esse aliquid. Libero eos id autem ut. Sit voluptatem ut nesciunt. Aut tempore vitae est adipisci.', 'Premium'),
(828, 1, '2012-05-06', 'Gibsonburgh', 'GhostWhite', 'PaleTurquoise', 'Netherlands Antilles', 'Not Select', 'keara32@example.net', '533.619.8363x36220', 'Mrs. Margie Heaney', '1771 Zack Common\nJaredport, ND 47983', 'South Archibald', '1984-07-26 00:03:44', 'Et ut suscipit aut. Ratione facilis explicabo quia dolores quia dolorem qui blanditiis.', 'Premium'),
(829, 0, '1997-05-03', 'Charlieshire', 'Pink', 'Yellow', 'Zambia', 'Male', 'rico.grant@example.org', '(419)424-0261x98393', 'Olaf Effertz', '429 Christelle Plains Suite 807\nJamirside, FL 69203', 'Borermouth', '1976-09-15 09:49:02', 'Voluptas eum porro consequatur ex. Quibusdam earum tempora quibusdam totam veniam ratione.', 'Free');
INSERT INTO `individual` (`id`, `status`, `date_of_birth`, `place_of_birth`, `church_name`, `organization`, `country`, `gender`, `email`, `phone`, `name`, `address`, `city`, `since`, `description`, `packet`) VALUES
(830, 1, '1980-04-09', 'Dooleystad', 'LightBlue', 'MediumBlue', 'Poland', 'Not Select', 'sonny.cummings@example.org', '680.321.8095x106', 'Liam Kohler', '20365 Schultz Hills Suite 703\nLydaberg, NV 08590', 'East Maryjane', '2014-10-23 19:15:30', 'Illo et ut illum explicabo omnis. Rerum quis ullam quo sint nisi praesentium dolor. Quibusdam minus nihil provident necessitatibus qui aut.', 'Premium'),
(831, 2, '1995-07-28', 'Martineberg', 'Coral', 'BlueViolet', 'Saint Pierre and Miquelon', 'Not Select', 'sarah39@example.net', '811.294.1489x1283', 'Amani Sporer', '070 Gutmann Prairie Apt. 483\nNorth Troyburgh, VA 77662', 'Manteview', '1971-08-30 08:29:22', 'Praesentium sint aut quae aut praesentium. Et rerum maxime aut et. Laboriosam harum eum culpa. Mollitia perspiciatis sed provident ut exercitationem.', 'Silver'),
(832, 1, '2003-12-05', 'West Lauryn', 'LightSeaGreen', 'SeaGreen', 'Kyrgyz Republic', 'Female', 'verla93@example.net', '(862)713-7999x599', 'Orville Stanton', '809 Dora Pine Suite 653\nNew Jaylenshire, KY 24027-5869', 'Lueilwitzburgh', '1976-08-31 23:18:33', 'Est recusandae atque sit veniam. Fuga fugit voluptatem est autem quia. Facilis qui libero debitis optio consequatur dolorem incidunt.', 'Silver'),
(833, 1, '1988-07-16', 'North Francis', 'Aqua', 'LavenderBlush', 'Gabon', 'Female', 'michelle.shanahan@example.com', '00602717235', 'Dr. Kamren Nicolas I', '13479 Keven Center\nPort Zitastad, ME 83527', 'New Christport', '2011-04-10 19:45:17', 'Maxime unde eos est ipsa omnis labore sint quia. Voluptatum quo dolor animi et occaecati provident. Consequatur quas voluptas modi dignissimos. Vel numquam nihil est.', 'Gold'),
(834, 0, '1986-06-12', 'Port Glenhaven', 'SlateGray', 'DarkSlateGray', 'Morocco', 'Not Select', 'kessler.pasquale@example.net', '1-236-762-8822', 'Mrs. Ines Graham', '948 Nikolaus Flat\nFranceston, FL 29734', 'New Hilbert', '2001-04-27 09:47:17', 'Enim officiis sit repudiandae earum. Exercitationem aut eos sit porro. Rerum porro temporibus et dolorem.', 'Free'),
(835, 2, '1995-07-05', 'Macymouth', 'FireBrick', 'LimeGreen', 'Saint Barthelemy', 'Male', 'donny.huel@example.com', '03984771318', 'Lelia Flatley', '846 Medhurst Mountains Apt. 184\nMrazborough, NC 53392', 'Jacobiville', '1996-05-15 09:59:49', 'Dolores et aut officia dicta earum sapiente. Ab asperiores error ullam hic quas. Aperiam qui inventore ab voluptates enim repellat ea.', 'Premium'),
(836, 2, '2019-03-02', 'South Jerrodtown', 'Tomato', 'Snow', 'Taiwan', 'Male', 'collins.candido@example.org', '209.124.2369', 'Fred Weimann', '10132 Corwin Branch\nWest Alexys, HI 58046', 'Alaynaside', '1999-10-29 09:16:39', 'Minima beatae voluptatem consequatur architecto tenetur quis excepturi nulla. Et ipsa sequi esse nemo iste nostrum. Ut qui doloremque sint aut.', 'Premium'),
(837, 2, '2002-10-06', 'Jolieside', 'MediumSeaGreen', 'DarkGray', 'Azerbaijan', 'Female', 'kbosco@example.com', '(500)081-2375x702', 'Mr. Dock Murray', '41409 Watsica Plaza\nWest Keonmouth, MO 65754', 'West Emmanuelle', '1986-05-11 02:52:52', 'Quaerat libero voluptatem aut officia rem culpa. Aut aliquam atque vel. Et consequatur aperiam aut ex quae laborum. Qui fuga et saepe quas sapiente possimus.', 'Free'),
(838, 0, '1990-03-29', 'East Kenyon', 'MediumAquaMarine', 'Ivory', 'Norway', 'Female', 'adriana.hoeger@example.org', '(519)627-4602x3268', 'Dr. Antonette Gleichner', '4194 Aryanna Keys\nFaychester, AK 53697', 'South Myrtis', '1989-06-25 07:24:37', 'Quasi cum eos officiis quod. Vel odit aliquid hic quasi voluptatem architecto. In officiis quae et est.', 'Premium'),
(839, 1, '2002-11-07', 'East Willowland', 'DarkMagenta', 'PowderBlue', 'Bahrain', 'Male', 'walsh.corine@example.net', '507-504-3301', 'Roscoe Bradtke', '2716 Turcotte Haven\nNorth Naomiechester, KY 81219', 'Bahringermouth', '1979-02-19 17:20:38', 'Atque harum consequatur officiis ad odio accusantium. In ad cupiditate voluptas illum libero deserunt. Repudiandae maxime natus numquam autem pariatur architecto. Sit natus voluptatem cupiditate eum commodi eius.', 'Silver'),
(840, 0, '1986-03-18', 'Giovannaport', 'MediumVioletRed', 'YellowGreen', 'India', 'Female', 'hobart.emmerich@example.net', '132-281-1240', 'Robert Denesik', '56181 Annalise Row Apt. 433\nEast Gerhard, IL 13424', 'Port Olga', '1994-03-16 20:47:19', 'Velit velit ex iusto impedit. Nulla assumenda harum ipsum voluptatem eveniet autem reiciendis. Totam aut maxime eaque dolor et officiis temporibus.', 'Premium'),
(841, 2, '1995-04-25', 'Kihnchester', 'Ivory', 'OrangeRed', 'Iran', 'Female', 'renee56@example.org', '307-897-3837', 'Prof. Soledad Ortiz', '18863 Koepp Light\nHarryville, OR 75939', 'Eastonstad', '1987-05-14 00:42:17', 'Tempore quaerat quia consequuntur repellendus sed. Ut aut sit et fugiat aut. Impedit sapiente quibusdam tenetur. Ut nisi aspernatur natus eaque.', 'Silver'),
(842, 1, '1972-06-17', 'Johnsshire', 'Orange', 'White', 'Yemen', 'Female', 'kameron75@example.com', '085.318.3240x12239', 'Prof. Kristian Wolf PhD', '620 Swift Island Suite 517\nVeumview, NJ 98146', 'West Jeanieshire', '2009-02-25 02:11:02', 'Temporibus rerum voluptatum excepturi qui assumenda nostrum. Ut dicta tenetur beatae voluptas. Deleniti deserunt sed modi veritatis eaque. Deleniti magni qui aut aut error. Facere et dolor optio quo iste dicta aut.', 'Silver'),
(843, 1, '1977-05-31', 'West Davonchester', 'BlueViolet', 'Snow', 'Saint Helena', 'Female', 'braun.gianni@example.com', '+31(3)1784141737', 'Lourdes Orn', '035 Callie Brooks\nEast Luciennemouth, CO 22193-3326', 'Vivienshire', '1977-11-08 20:03:42', 'Molestias velit excepturi qui. Voluptatem ad quibusdam ea laboriosam nisi id. Quod neque magni et minus.', 'Silver'),
(844, 1, '1978-10-15', 'Port Joanachester', 'Bisque', 'Lavender', 'Cambodia', 'Male', 'isadore.mitchell@example.net', '911-440-2122x60652', 'Marcelino Balistreri DVM', '35359 Bernier Estates Suite 209\nWeissnatmouth, MI 39695-3637', 'North Esperanzafurt', '1985-09-16 21:28:06', 'Et deserunt mollitia harum vel occaecati ullam. Asperiores sapiente repellat atque minima. Dicta corrupti omnis rem accusamus omnis atque dolores.', 'Silver'),
(845, 2, '2000-07-21', 'West Bridgetteton', 'Khaki', 'LawnGreen', 'Guatemala', 'Not Select', 'blanche07@example.org', '(494)657-4918x84994', 'Mr. Taurean Daugherty MD', '969 Marianna Village Apt. 487\nMonahanberg, SD 26942', 'South Karlport', '2015-06-28 02:43:56', 'Mollitia quo magnam eos molestias totam cupiditate. Rem quidem quo nostrum voluptate. Doloremque officiis veritatis nihil sequi est magni ipsam culpa.', 'Silver'),
(846, 2, '1972-06-05', 'West Roxane', 'AliceBlue', 'LimeGreen', 'French Guiana', 'Not Select', 'kaleigh.johns@example.com', '1-741-876-5243', 'Murphy Wiza', '64835 Braulio Squares Apt. 866\nEast Micheal, ME 22455-6024', 'East Noemiview', '1997-10-20 06:27:17', 'Quos earum dolore dolore qui animi. Numquam qui eos libero quia eaque odio blanditiis. Ut odit suscipit delectus est.', 'Gold'),
(847, 1, '1979-08-26', 'Marcelhaven', 'Red', 'BlanchedAlmond', 'Trinidad and Tobago', 'Female', 'jamey80@example.net', '1-366-624-7707', 'Alvis Dare', '3525 Spinka Green\nEast Rooseveltshire, WA 76987-7869', 'South Josianetown', '1971-08-01 09:39:24', 'Laudantium enim blanditiis harum quas. Dolor perspiciatis quo ipsam voluptatibus eaque dolore harum. Inventore rerum quae totam iste tenetur blanditiis voluptatem. Quidem ut delectus necessitatibus sint occaecati veniam.', 'Silver'),
(848, 2, '2009-04-30', 'Oberbrunnerhaven', 'Chartreuse', 'MediumSlateBlue', 'Macao', 'Male', 'hilpert.garry@example.com', '1-832-107-1131x19780', 'Lula Wunsch', '2520 Faye Extension\nSouth Lorineshire, NH 94735-4363', 'Bayertown', '1996-07-10 11:04:25', 'Et facere quibusdam et ipsam. Voluptatem dolor enim sint ipsam. Deleniti fuga consequuntur possimus.', 'Gold'),
(849, 0, '2014-02-08', 'Marjoryborough', 'DeepPink', 'Maroon', 'Qatar', 'Not Select', 'ebosco@example.net', '(385)165-8823', 'Ezequiel Daniel', '6329 Rogelio Trace\nPort Brain, OR 79762', 'Brekkeland', '2008-11-24 07:52:39', 'Consequatur dolorem beatae minima incidunt ut dolores voluptatibus. Ut ut rerum tempora ducimus. Ut voluptatem earum quo mollitia praesentium sit exercitationem omnis. Earum aspernatur sunt sint deleniti ea nulla earum.', 'Gold'),
(850, 0, '2013-04-09', 'South Elmerton', 'Darkorange', 'MediumSpringGreen', 'Croatia', 'Female', 'blanda.ernestine@example.com', '616-661-1119x83915', 'Merle Rowe MD', '8138 Carissa Ports\nNorth Randalland, DE 05164', 'East Kristopherbury', '1990-02-02 09:33:34', 'Explicabo harum tempore consequatur omnis voluptatem. Magnam quia quos officiis vero consequatur.', 'Premium'),
(851, 0, '2020-02-02', 'Samanthamouth', 'DarkGreen', 'PaleTurquoise', 'Ethiopia', 'Not Select', 'wyman.schamberger@example.net', '(594)638-0914', 'Miss Muriel Bernier', '58118 Abernathy Mountain\nLemkeburgh, GA 99015-0863', 'West Jeffrytown', '2009-05-18 02:34:51', 'Enim ut ad commodi voluptas. Est ducimus repellendus rem aperiam quaerat.', 'Gold'),
(852, 1, '1993-09-18', 'Verdieton', 'Brown', 'DarkSlateGray', 'Czech Republic', 'Female', 'walker.juliana@example.com', '1-011-125-4057x066', 'Kirk Prohaska', '9031 Gibson Coves Apt. 824\nZboncakport, DE 36069', 'Uptonfort', '2007-05-17 18:01:47', 'Blanditiis et ullam asperiores perspiciatis voluptates maxime ullam. Ex dolorem itaque quibusdam delectus maxime odio molestiae aut. Totam dicta id unde aliquid dolor reprehenderit. Voluptates dolore consectetur ut odio.', 'Gold'),
(853, 0, '2000-01-04', 'Port Annieside', 'SlateGray', 'Beige', 'Bouvet Island (Bouvetoya)', 'Not Select', 'jast.gracie@example.com', '(458)627-6642', 'Prof. Israel McKenzie IV', '46503 Howell Hollow\nMaudeside, HI 03476-2982', 'Ziemeton', '1989-01-24 03:13:55', 'Aliquid id enim eum molestiae. Est eius minus repellendus et odit.', 'Silver'),
(854, 1, '1991-05-16', 'South Micaelastad', 'PaleVioletRed', 'Moccasin', 'Denmark', 'Female', 'icarroll@example.org', '829-681-9136x941', 'Bernardo Beahan', '399 Brooks Manors\nMacejkovicburgh, MA 95066-4452', 'North Penelopeside', '2003-01-30 04:00:57', 'Aut voluptatum magni iure praesentium. Ut fuga sint deleniti qui occaecati aut tenetur. Voluptates laborum soluta necessitatibus repellendus repudiandae nihil. Sapiente consequatur et unde voluptatibus aut perferendis aut.', 'Free'),
(855, 0, '2020-04-19', 'Lake Jamaalland', 'SeaGreen', 'Gainsboro', 'French Guiana', 'Not Select', 'mfadel@example.net', '975.597.4622x71463', 'Miss Audra Thiel I', '477 Janie Manors\nWest Ariel, IL 61711', 'Port Wiley', '1977-08-20 07:00:36', 'Qui debitis et minus quis molestiae inventore. Explicabo repellendus libero aspernatur quo in.', 'Gold'),
(856, 1, '2017-07-23', 'South Arneberg', 'LemonChiffon', 'Chocolate', 'Reunion', 'Male', 'schaden.emie@example.net', '495.654.0599x712', 'Dianna DuBuque', '5352 Armstrong Garden\nNorth Dinoborough, AR 36929', 'East Noe', '1989-02-07 01:53:08', 'Eaque ut tenetur magni earum eum enim voluptas. Et quam provident at distinctio pariatur adipisci magni. Itaque ut doloremque quaerat sapiente. Quis nulla repellat modi pariatur nesciunt.', 'Premium'),
(857, 0, '1986-08-08', 'East Eldon', 'OrangeRed', 'Red', 'Slovakia (Slovak Republic)', 'Female', 'rylan.ondricka@example.org', '+22(2)5534964491', 'Dessie Rosenbaum', '461 Sigrid Ridges Suite 500\nJulioville, MD 24931-7690', 'West Jamaal', '2012-08-13 18:58:54', 'In quo qui perferendis sint sint. Aliquid beatae corporis saepe. Repellendus aliquid inventore ut totam reprehenderit sint.', 'Silver'),
(858, 2, '1982-09-10', 'New Jennyferside', 'BurlyWood', 'LightGreen', 'Christmas Island', 'Male', 'kasandra21@example.org', '985-207-0464', 'Lucio Swaniawski', '60913 Hills Creek Suite 092\nNorth Joshville, FL 35083', 'Port Sherwood', '1997-11-04 04:06:45', 'Ratione sit laborum ullam repellendus velit itaque dolorem reprehenderit. Aliquid quod aut quae et.', 'Premium'),
(859, 2, '1989-03-20', 'Thomaston', 'Green', 'Khaki', 'Uruguay', 'Not Select', 'reichert.kip@example.org', '443-566-8773x10258', 'Tommie Ziemann', '2154 Gottlieb Vista Suite 691\nWest Camyllestad, MS 38497', 'Port Patrick', '1986-06-22 11:08:51', 'Et et architecto explicabo vel consequuntur voluptatem. Aut tenetur et nostrum numquam quibusdam optio ut. Ipsa minus autem aut iusto nobis neque beatae. Quo et ad occaecati laudantium saepe dolorum impedit.', 'Free'),
(860, 1, '1977-03-31', 'New Damion', 'Snow', 'RosyBrown', 'United States of America', 'Female', 'felipa26@example.org', '931-474-4596', 'Mrs. Jazlyn O\'Connell', '643 Herzog Trafficway\nRamonaside, ND 37279', 'Hartmannton', '2012-01-22 21:06:49', 'Aut nihil amet ratione est. Fuga aut vitae omnis deleniti inventore.', 'Silver'),
(861, 1, '2020-07-12', 'Pollichland', 'White', 'RosyBrown', 'Grenada', 'Male', 'autumn28@example.net', '(770)223-7978', 'Brittany Dach', '50770 Dare Villages Suite 340\nSouth Mckayla, OH 89621', 'Krystinamouth', '2021-04-14 19:27:20', 'Quaerat sed laborum ab ut aliquid molestiae neque. Nihil vel similique tempora recusandae consequatur. Nihil accusamus aliquam qui voluptatem culpa.', 'Gold'),
(862, 1, '1998-01-03', 'Markstown', 'LightCyan', 'Bisque', 'Yemen', 'Male', 'vidal.renner@example.org', '1-989-349-5598x722', 'Zoe Hoeger I', '72611 Tillman Turnpike\nNew Haskellfurt, FL 44825', 'North Keeleyville', '1991-08-08 21:45:43', 'Nihil consequatur unde quis sed quia. Quia id facere minus perspiciatis facere molestias.', 'Free'),
(863, 2, '2015-02-12', 'South Eliezermouth', 'SandyBrown', 'Magenta', 'United Kingdom', 'Not Select', 'garth58@example.net', '979.934.8915', 'Miss Katelyn Corwin DDS', '631 Woodrow Port\nNew Reneestad, LA 76435-5890', 'Heidenreichmouth', '2018-12-13 06:20:04', 'Natus quis voluptate nam id ut. Sint suscipit similique libero voluptatem. Possimus numquam exercitationem labore exercitationem aut aut. Quia quod magni vel quo autem.', 'Gold'),
(864, 1, '1980-05-14', 'Port Neomaville', 'Bisque', 'Yellow', 'Albania', 'Male', 'beier.jaquelin@example.net', '1-210-480-8446', 'Prof. Makayla Hegmann', '90258 Terry Turnpike Apt. 169\nNew Leon, ME 18674', 'Davisfurt', '1982-03-19 10:48:14', 'Sed porro non unde in iure. Sint est autem consequatur at facilis et. Quod odio quia cumque voluptatibus modi architecto. Autem fugiat nihil sint quia nostrum.', 'Premium'),
(865, 1, '2014-08-08', 'Lake Imatown', 'DarkSeaGreen', 'DarkTurquoise', 'Cameroon', 'Male', 'lvonrueden@example.net', '(065)912-3099x87769', 'Gunner Klein', '03457 Nikolaus Branch Apt. 861\nTorphyland, MI 23435', 'Margieland', '1992-02-18 07:41:30', 'Natus quae qui maxime aut aliquam. Facere voluptas molestiae quia. Facilis quibusdam rerum esse doloremque perspiciatis fugit. Cum suscipit debitis sequi in vitae aut rerum aliquam.', 'Premium'),
(866, 0, '2005-11-21', 'North Ardellaport', 'PaleGoldenRod', 'Lime', 'Senegal', 'Not Select', 'carli34@example.net', '09769081066', 'Joey Stark', '280 Cecilia Lodge Suite 476\nWest Raul, DC 10162', 'New Fredymouth', '1989-09-20 10:58:16', 'Sint quia maiores iure modi itaque omnis quia id. Suscipit illum qui fuga aliquid aut assumenda eos eius. Corporis ducimus et architecto ut. Debitis earum consectetur unde distinctio qui qui quaerat.', 'Gold'),
(867, 2, '2019-08-08', 'Port Christianaberg', 'MediumSpringGreen', 'SandyBrown', 'South Georgia and the South Sandwich Islands', 'Male', 'reta03@example.com', '372-615-6571', 'Prof. Carol Stracke', '291 Lockman Ports\nKrajcikburgh, OH 75615-1530', 'New Pasqualechester', '1994-08-03 06:38:50', 'Eaque explicabo mollitia rerum impedit error laboriosam est. Delectus est corrupti maiores modi sunt. Atque molestiae maiores occaecati quibusdam. Eveniet fugit facilis voluptatem non vel et. Illo provident incidunt molestiae earum.', 'Premium'),
(868, 1, '1995-09-20', 'East Josh', 'LightBlue', 'BlanchedAlmond', 'Yemen', 'Not Select', 'morar.maxie@example.com', '349.831.4784', 'Gayle McClure', '09630 Danielle Squares\nWest Rasheed, GA 71207', 'Eleanoreberg', '2008-03-24 01:42:37', 'Voluptate aut ut tempore similique sint et. Vero asperiores qui mollitia eligendi cum quod magni id. Praesentium nulla officia quidem sint ab ex recusandae earum. Non reprehenderit porro incidunt.', 'Free'),
(869, 2, '2018-05-29', 'Lake Vicky', 'Red', 'LemonChiffon', 'Benin', 'Male', 'lavern.harber@example.com', '+31(5)4258167086', 'Sedrick Gleason', '57685 Stark Ports\nBoylemouth, ID 59670', 'South Duncanhaven', '1972-02-07 03:36:19', 'Ut asperiores veritatis dolores ducimus. Ut et ea omnis. Omnis corporis qui at ab odit. Eum qui iste voluptatem illum cumque et fugit. Provident vel et enim veniam doloribus repellendus autem.', 'Premium'),
(870, 2, '1983-01-18', 'Lake Bruce', 'DarkOrchid', 'MediumSlateBlue', 'Netherlands', 'Female', 'wberge@example.net', '07162126852', 'Dr. Marc Lowe MD', '93279 Kunze Turnpike Apt. 446\nSouth Marge, PA 76518', 'Sporermouth', '2007-05-29 14:29:13', 'Enim nulla dolores et ex. Ut ut id veritatis necessitatibus aliquam reiciendis. Aut consequatur aspernatur porro aliquam eum. Officiis qui omnis qui occaecati.', 'Silver'),
(871, 0, '2019-04-30', 'New Abbeyhaven', 'LightSlateGray', 'MediumSlateBlue', 'Myanmar', 'Not Select', 'bonnie.leuschke@example.net', '695-191-6702x049', 'Jenifer Gerlach', '44904 Rylan Parkways\nKreigerstad, NV 17483', 'Lynnmouth', '1974-09-11 06:19:34', 'Quas in aut magni culpa. Quibusdam aut quasi pariatur consequuntur at libero. Ut aut sed vel non. Qui voluptas nihil earum ab quia.', 'Gold'),
(872, 0, '2012-05-18', 'West Coby', 'Chocolate', 'DimGrey', 'Falkland Islands (Malvinas)', 'Female', 'larson.allen@example.com', '1-567-788-7845x21972', 'Terry Breitenberg', '14697 Lueilwitz Pine\nKshlerinbury, IA 61765-6024', 'Gulgowskiton', '1985-09-20 10:59:14', 'Fugit fugiat corporis alias qui qui aut. Soluta debitis quis quis magni velit impedit eveniet.', 'Free'),
(873, 2, '1993-07-02', 'South Mafalda', 'RosyBrown', 'OldLace', 'Taiwan', 'Female', 'christop.pfannerstill@example.com', '712.907.8847', 'Maxime Weber', '465 Gideon Track\nBeckerview, CT 08541-1979', 'East Havenville', '2011-02-03 03:42:14', 'Quibusdam iusto fuga repellat adipisci facilis. Aut omnis rerum quia sit sit reiciendis eligendi exercitationem. Et fugit itaque vel. Sunt deserunt mollitia iure vel id.', 'Silver'),
(874, 0, '2011-10-03', 'Carrollbury', 'BlueViolet', 'SeaGreen', 'Afghanistan', 'Female', 'anya52@example.org', '03075970572', 'Delphia Gusikowski', '608 Robyn Lodge Apt. 330\nMasonchester, DC 81536', 'Beierside', '2015-04-26 11:33:43', 'Amet et et autem aut necessitatibus praesentium beatae. Alias sit deleniti dolorem velit delectus perferendis recusandae eaque. Qui nobis enim suscipit sequi id. Vel qui possimus labore veniam.', 'Free'),
(875, 2, '1973-12-10', 'Kayceeview', 'PowderBlue', 'PaleTurquoise', 'Heard Island and McDonald Islands', 'Male', 'garry80@example.org', '922.850.5297', 'Amanda Sawayn PhD', '70890 Shanny Parks\nFedericoview, SD 85754', 'Lake Angelita', '2016-08-20 13:32:20', 'Laudantium autem inventore voluptatem quas commodi dolorum. Suscipit veniam eveniet aliquam veritatis eius non hic. Nihil omnis quas ipsa exercitationem aut excepturi possimus. Accusamus et fugit ea fuga totam.', 'Silver'),
(876, 2, '2009-09-03', 'Port Lisette', 'DarkBlue', 'DarkSlateBlue', 'Costa Rica', 'Female', 'christ.kunze@example.org', '1-430-200-9217x6565', 'Dusty Bartoletti', '430 Torp Loop\nDeonshire, DE 91445', 'Torpburgh', '2017-07-14 17:25:50', 'Voluptas et est sapiente ea. Aspernatur beatae exercitationem impedit et debitis qui. Molestias neque ratione repudiandae qui quam.', 'Premium'),
(877, 2, '2009-08-23', 'Wunschside', 'Peru', 'NavajoWhite', 'Antigua and Barbuda', 'Not Select', 'gkessler@example.net', '929.920.8283x09844', 'Halle Casper II', '9575 Nicolas Land Apt. 487\nPort Broderick, GA 68963-7266', 'Yundtfurt', '1991-04-05 17:07:54', 'Iste et aliquid totam nobis aut. Aut ea rerum sit sequi mollitia reprehenderit. Officiis deserunt assumenda totam non in sed soluta.', 'Free'),
(878, 2, '1980-03-23', 'Jaydeburgh', 'LightBlue', 'SaddleBrown', 'Israel', 'Male', 'green.raquel@example.com', '(182)628-4746', 'Miss Marilie Hamill', '38515 Rahul Course Suite 066\nLake Orphaside, ND 09787-2826', 'Port Vellaberg', '1994-05-29 10:19:20', 'Sint eum deleniti inventore ipsam enim illum non. Nostrum quibusdam cupiditate eum tempora. Ut earum qui eveniet.', 'Premium'),
(879, 0, '1979-07-12', 'North Giuseppefurt', 'LightSteelBlue', 'OrangeRed', 'Taiwan', 'Not Select', 'ervin64@example.net', '866-606-1369', 'Malcolm Wuckert', '970 Nicolette Alley Apt. 807\nHaneview, IN 92756-2655', 'East Annie', '2009-08-31 11:20:07', 'Officia soluta inventore in odio. Aut autem incidunt qui ut. Consequatur esse perspiciatis praesentium culpa ut harum. Cupiditate nobis consequatur deleniti error asperiores suscipit molestiae.', 'Premium'),
(880, 0, '1997-09-28', 'Dellaton', 'DarkOliveGreen', 'White', 'Gibraltar', 'Male', 'veum.hayley@example.org', '244.248.8106x8671', 'Ms. Winifred Langosh', '848 Theron Tunnel Suite 986\nScotton, DE 95290', 'Port Felipe', '1972-12-05 08:10:47', 'Et dolorem eum quis possimus quia quos. Et error minus voluptas quasi quis rerum. Esse inventore doloremque architecto veniam et. Ut nihil voluptas omnis perspiciatis vero non odio.', 'Premium'),
(881, 0, '2013-07-26', 'Lueilwitzside', 'PeachPuff', 'LightSteelBlue', 'Anguilla', 'Female', 'vbeier@example.org', '730.906.7828', 'Hiram DuBuque', '373 Tremblay Crossing\nEast Lessie, MD 42349-9348', 'Jackyport', '1997-04-18 11:41:26', 'Molestias culpa iusto eaque non veritatis voluptas. Aut excepturi sunt consequuntur quisquam minima cupiditate. Officiis necessitatibus hic perferendis ut eveniet ea rerum. Est adipisci molestiae illo minima.', 'Gold'),
(882, 2, '2013-09-18', 'Houstonhaven', 'LightGoldenRodYellow', 'Orange', 'Korea', 'Female', 'vandervort.angel@example.org', '245-246-7321x314', 'Dr. Zoe Grady', '04668 Baylee Points Apt. 138\nJammiefort, AZ 86182', 'West Reva', '1990-07-06 01:38:02', 'Fugiat labore officiis hic fugiat quia. In delectus et quia exercitationem corrupti aut. Magni sit ad pariatur molestias autem voluptatem. Distinctio modi labore nihil iure vitae maiores.', 'Free'),
(883, 0, '1976-11-24', 'Osinskiville', 'Thistle', 'Orange', 'United States of America', 'Not Select', 'pearline81@example.com', '(073)439-7185x5027', 'Kallie Johnson', '0483 Brown Stream\nJacksonmouth, DC 53796', 'North Lee', '1981-09-09 05:16:29', 'Quidem molestiae voluptate amet ad totam ducimus. Porro voluptate architecto et deserunt consequatur quod similique. Accusamus sint quisquam architecto enim vero asperiores. Veritatis quia et ea expedita aut.', 'Silver'),
(884, 0, '1978-12-06', 'South Rhiannonhaven', 'DodgerBlue', 'SeaGreen', 'Cuba', 'Female', 'ocrona@example.com', '07031385624', 'Ibrahim Bergnaum', '6625 Name Forest Apt. 771\nNorth Cecilia, VA 00299', 'Koeppberg', '2006-11-07 09:38:28', 'Ab magni voluptatem inventore sed nulla ipsum facere. Sint asperiores mollitia est tenetur. Qui inventore voluptatem doloribus porro. Et aut voluptatem quaerat eos dolorum non pariatur. Non illum asperiores repellat temporibus adipisci nihil.', 'Free'),
(885, 1, '1972-11-20', 'Batzborough', 'Ivory', 'Pink', 'Iran', 'Male', 'esther95@example.net', '02524671150', 'Salvatore Luettgen', '70262 Curt Center\nSouth Jarretfort, OH 45639-8820', 'Port Coty', '2019-04-22 08:52:47', 'Tempore quis deleniti culpa illo est a. Eveniet tempore dolorum aut enim dolor ducimus commodi fugit. Veritatis inventore magnam eum iusto totam eos odit.', 'Silver'),
(886, 1, '1980-06-27', 'East Jermaineport', 'OldLace', 'PaleGoldenRod', 'Uganda', 'Not Select', 'sjohnston@example.com', '+89(6)4507689021', 'Adelle Hansen', '14677 Rachel Shores\nDorisland, AZ 94109', 'Daleland', '1992-05-11 20:34:03', 'Aliquid quod sit quod et consequatur aspernatur. Dolore quae explicabo atque aliquam quam. Optio pariatur expedita iusto illum animi suscipit deleniti inventore.', 'Premium'),
(887, 2, '1993-03-17', 'Jeffreyfurt', 'PaleTurquoise', 'Orange', 'Serbia', 'Female', 'jaclyn.nikolaus@example.org', '(286)152-6090', 'Meda Lockman', '4165 Kuhn Greens\nWest Harrison, PA 38760', 'Krajciktown', '2006-03-28 08:00:45', 'Doloremque esse natus dolorum dolor aut et. Dolor enim vel omnis. Aut neque consectetur vitae eveniet. Fugit minima vitae ducimus aliquam ad cum dolor.', 'Free'),
(888, 1, '1980-08-03', 'New Jayde', 'DarkOliveGreen', 'LightSkyBlue', 'Angola', 'Not Select', 'iroberts@example.com', '1-469-877-6515x23944', 'Leonora Schumm', '80773 Rogahn Extension\nNew Isabelleton, DC 17751', 'Lake Vickystad', '1989-07-04 03:41:25', 'Commodi ullam ea occaecati sed rerum non qui quis. Doloremque dolor et ut sint est ut illo. Beatae rerum quisquam optio eum fuga sed.', 'Silver'),
(889, 1, '1997-02-15', 'Lake Clovis', 'LightSkyBlue', 'DarkCyan', 'Sweden', 'Female', 'brakus.adah@example.net', '556.182.2421x48240', 'Lizzie Padberg', '10304 Bradley Brooks\nSylvanstad, NC 02440', 'Shanahanmouth', '2014-03-26 09:52:37', 'Reiciendis inventore culpa pariatur qui. Qui aut inventore non rem ab sequi. Omnis nihil error dolore voluptatem.', 'Silver'),
(890, 2, '1982-05-10', 'North Rosafort', 'DarkMagenta', 'Silver', 'South Africa', 'Male', 'adare@example.org', '1-298-448-5079x14185', 'Whitney Adams', '26385 Swaniawski Corners Apt. 677\nWest Brainstad, OH 34597-1958', 'East Xzavier', '2008-06-23 13:16:25', 'Voluptatibus neque id quos expedita dolore. Eos aut reprehenderit et perspiciatis ipsam voluptas sed. Rem quo id ducimus aut in quo.', 'Premium'),
(891, 0, '2017-02-15', 'West Tomas', 'Gainsboro', 'GreenYellow', 'Armenia', 'Female', 'nola93@example.net', '(991)229-3628x2475', 'Janis Hansen', '8289 Hyatt Motorway Apt. 497\nEast Bertrand, AL 35159-7200', 'Burniceberg', '1984-01-27 18:54:48', 'Error et voluptas libero dolorem in. Tempora ipsa voluptatem itaque delectus quia sapiente natus. Quae qui quibusdam autem quidem accusamus. Reiciendis quia ut non.', 'Premium'),
(892, 0, '2000-08-03', 'Port Carriestad', 'Peru', 'Yellow', 'Turks and Caicos Islands', 'Male', 'blebsack@example.com', '883-006-1592', 'Korbin Grant', '58214 Batz Expressway Apt. 901\nMorarfurt, UT 22980', 'Claireland', '1981-01-22 12:16:23', 'Veniam dignissimos velit adipisci molestiae quae. Voluptatum minus dignissimos dolor voluptatum impedit commodi. Ab est vel voluptatibus et. Sunt atque dolore eum.', 'Silver'),
(893, 0, '2010-01-04', 'Wilhelmside', 'Black', 'SeaShell', 'Moldova', 'Male', 'beulah69@example.org', '1-450-015-4937', 'Aleen Wyman', '093 Benton Knoll Apt. 493\nEast Sarai, PA 67196-8937', 'North Clintonside', '1981-05-19 02:48:15', 'Labore distinctio dolor occaecati sit laboriosam laudantium eum. Eaque maxime sed qui commodi.', 'Gold'),
(894, 2, '2004-07-29', 'Krajcikside', 'DarkOrchid', 'BlueViolet', 'Greece', 'Female', 'damon.schneider@example.net', '1-924-750-0422x91226', 'Mr. Gerard Sawayn MD', '581 Deshaun Meadows Apt. 740\nPort Nichole, OK 45241', 'New Arleneborough', '2008-10-04 13:02:03', 'Porro et laborum expedita. Veritatis voluptates quia labore unde. In ipsum unde id mollitia et. Ut dolore a fugit et.', 'Silver'),
(895, 0, '1998-06-06', 'Margaretfort', 'DarkSlateGray', 'DarkSlateBlue', 'Syrian Arab Republic', 'Male', 'xmoore@example.net', '(887)148-8736', 'Domenick Lind', '108 Ryleigh Mountains\nPort Patsyside, NY 92536', 'Lake Collinmouth', '1993-07-26 19:42:02', 'Sed omnis illum in amet magni totam. Sit asperiores laborum quia accusantium cum cum aliquid. Enim aut aut voluptatibus provident soluta ipsam doloremque aut. Ab voluptate pariatur iusto consequatur animi quia asperiores.', 'Free'),
(896, 1, '1988-09-29', 'New Abnerhaven', 'Aqua', 'MediumTurquoise', 'Maldives', 'Not Select', 'rutherford.dominic@example.net', '027.559.9407x7473', 'Helen Pfannerstill', '19577 Padberg Forest\nWaelchibury, NY 19042-2034', 'Adelechester', '1991-06-12 07:14:38', 'Cupiditate suscipit libero dolore qui dolorem repellat fuga. Voluptatibus quia incidunt quia occaecati blanditiis eaque voluptatum. Et esse ea voluptas est corrupti hic quia quaerat. Quaerat est placeat quia porro aut voluptatem id.', 'Premium'),
(897, 1, '1978-01-13', 'Ullrichport', 'DarkGoldenRod', 'Blue', 'El Salvador', 'Female', 'ksatterfield@example.org', '(482)511-8997x695', 'Mario Schmitt', '030 Walter Plaza Suite 855\nGarnetttown, IL 51270-5745', 'Port Florineshire', '2015-05-27 01:57:52', 'Iste accusamus necessitatibus corporis laboriosam qui sed. Facere quas laborum laboriosam dolorum. Laboriosam culpa quo cupiditate ut ea.', 'Gold'),
(898, 1, '1985-12-16', 'Creminview', 'OliveDrab', 'DimGray', 'Uzbekistan', 'Female', 'helene.dach@example.net', '400.096.6628x34560', 'Prof. Estevan Keebler', '544 Windler Fords\nZemlakmouth, WY 33290-7970', 'Ludiebury', '2013-11-23 12:29:54', 'Ad quo in cum ad non molestiae. Velit aliquam earum sed sed a delectus. Voluptatem sint est omnis.', 'Silver'),
(899, 0, '1970-02-10', 'Jacobibury', 'Chocolate', 'SpringGreen', 'Morocco', 'Not Select', 'summer.grady@example.net', '(692)015-4867x28298', 'Shanel Yundt', '437 Littel View\nZemlakton, UT 27320', 'South Dulceshire', '2016-05-31 09:51:44', 'Quo accusantium beatae quis eligendi. Numquam reprehenderit dolores rerum dolorum. Et recusandae laudantium autem tenetur non voluptatibus. Est magni ipsum et perspiciatis doloribus et fugiat.', 'Premium'),
(900, 1, '2015-03-22', 'Port Joshua', 'Khaki', 'FloralWhite', 'Brazil', 'Female', 'rkohler@example.org', '095-570-0394', 'Jessy Graham V', '5737 Wilkinson Mountain\nEast Hollieshire, KY 33321-7522', 'Mabeltown', '2004-12-03 03:35:55', 'Pariatur dolorem omnis aut quisquam dolores veritatis. Ut voluptatibus quaerat fugit aut similique cum minima. Voluptas esse quia id sapiente mollitia tempora.', 'Free'),
(901, 2, '1985-03-24', 'West Adanhaven', 'Peru', 'Tomato', 'Guatemala', 'Not Select', 'kbins@example.org', '513-611-6272', 'Concepcion Macejkovic', '7181 Jacobi Lake Apt. 333\nPort Rebeca, AZ 58520', 'New Shyann', '1973-07-02 18:44:25', 'Quis porro et quos omnis commodi repellat consequatur. Iusto omnis perferendis reprehenderit. Est omnis corrupti incidunt in illum. Quae quis dolorem fugiat impedit aut earum.', 'Free'),
(902, 0, '1979-01-26', 'East Clemens', 'FireBrick', 'Brown', 'Christmas Island', 'Not Select', 'kautzer.isabel@example.org', '+84(4)8098594827', 'Oscar Deckow', '3655 Daniel Street Suite 376\nSouth Leathaview, TN 34591', 'Fredericmouth', '1987-04-14 14:04:11', 'Nostrum asperiores est eum eum consequatur et. Ea accusantium et aut itaque odit. Ipsum perferendis tenetur iste facilis voluptas.', 'Premium'),
(903, 0, '2002-12-24', 'West Wileybury', 'OliveDrab', 'Gray', 'Vietnam', 'Male', 'stark.wallace@example.org', '00041804042', 'Ernestina Berge', '3012 Doyle Corners\nDouglasfurt, WA 26730', 'Jamirland', '1977-11-22 01:52:36', 'Enim et aperiam ea ex. In sed voluptatum deleniti magnam. Quidem ipsum maiores ipsam alias et voluptatibus.', 'Gold'),
(904, 1, '1975-09-10', 'Johathanfurt', 'RoyalBlue', 'Khaki', 'Guatemala', 'Male', 'kgoldner@example.com', '+50(3)0925274765', 'Dr. Shayna Schneider Jr.', '052 Dion Route\nLake Karlshire, WA 52946', 'New Javonview', '2000-12-06 19:27:51', 'Tempore quis minus dolore illum ad aut. Ab aut et praesentium eos eaque assumenda autem. Reiciendis id aliquid magni minus.', 'Free'),
(905, 0, '2006-09-05', 'Gloverstad', 'GhostWhite', 'LightCoral', 'Puerto Rico', 'Not Select', 'selina.corwin@example.net', '1-922-835-0731x479', 'Alessandra Jones', '85091 Era Light\nWizaville, TX 64643', 'Coleside', '1996-12-27 00:47:05', 'At omnis ut aspernatur quia. Quia quo amet hic id. Iste qui aut cupiditate.', 'Premium'),
(906, 1, '2008-02-10', 'Grantstad', 'IndianRed ', 'MediumTurquoise', 'Denmark', 'Not Select', 'itoy@example.com', '577.463.0299x38600', 'Colin Smitham', '5069 Koss Mission Suite 254\nRogahnfurt, CA 70069-5522', 'Haleyburgh', '1971-07-19 03:41:02', 'Debitis rerum similique quod est. Occaecati omnis blanditiis amet eos quaerat dolorem nostrum. Illum quia commodi vel perferendis.', 'Free'),
(907, 1, '2009-12-09', 'Port Cyril', 'MediumPurple', 'SkyBlue', 'Latvia', 'Female', 'alana.dibbert@example.net', '07369312015', 'Zakary Cartwright', '34620 Schulist Centers\nEast Bernadine, OR 80384-3691', 'Litzyland', '2015-09-04 21:46:00', 'Nihil voluptatum unde nihil dolores aut corrupti et cumque. Dolores recusandae ipsa accusamus repudiandae qui illum iusto. Quasi aspernatur facere voluptatem est et omnis.', 'Silver'),
(908, 0, '1994-05-11', 'Norbertville', 'LightCoral', 'LemonChiffon', 'Philippines', 'Female', 'von.shaun@example.com', '137-428-9281x14155', 'Viviane Schoen', '2086 Will Courts Suite 567\nNew Betsyport, AL 72471', 'New Carlofurt', '2015-12-03 08:52:24', 'Totam sit consequuntur et earum. Et qui velit unde ut. Voluptate molestiae quibusdam id et ut.', 'Gold'),
(909, 0, '2022-01-04', 'South Erniefort', 'Tomato', 'Chartreuse', 'Greece', 'Not Select', 'royce.hodkiewicz@example.com', '332-390-5162', 'Ms. Misty Champlin Sr.', '6555 Ellis Burg\nWest Davinton, PA 79463-1289', 'Lylatown', '2010-02-07 22:13:52', 'Alias adipisci tempora nulla voluptatem veritatis esse perferendis autem. Qui dolorem quae ex dolorum numquam aut.', 'Gold'),
(910, 0, '1973-05-23', 'North Vincentfort', 'Gray', 'LightGray', 'Jordan', 'Female', 'hudson.sunny@example.com', '+64(8)4948863749', 'Brook Wuckert', '40135 Consuelo Viaduct Apt. 081\nFeilville, MS 02708', 'Port Alexandre', '2008-01-11 09:56:26', 'Dolore sed similique optio illum distinctio architecto ut. Maxime laudantium repudiandae eum et quo dolore esse. Libero ex autem nulla ea.', 'Gold'),
(911, 0, '1976-03-29', 'Mariannemouth', 'MediumOrchid', 'Fuchsia', 'Guam', 'Female', 'bogan.haley@example.com', '03156366255', 'Jaclyn Daniel', '011 Lavonne Ville\nEast Brionna, AR 23034-6925', 'North Naomiton', '1975-02-01 23:24:46', 'Expedita quia ut tempora blanditiis a eos. Perspiciatis vel rerum vel inventore iure a. Perferendis non itaque quae fugit.', 'Silver'),
(912, 0, '2006-01-12', 'Flossieton', 'PaleGoldenRod', 'YellowGreen', 'Mauritius', 'Male', 'johnston.judy@example.org', '861.058.5633x193', 'Prof. Joshuah Homenick DVM', '84767 Balistreri Squares\nEast Bernieburgh, VT 37868-9372', 'Pacochaside', '2017-10-21 17:40:48', 'Fuga ex necessitatibus distinctio. Fugit consequatur et quis at. Temporibus qui assumenda quis.', 'Silver'),
(913, 1, '2009-06-13', 'Reichelshire', 'Navy', 'Silver', 'Israel', 'Female', 'claudine.gaylord@example.com', '1-209-808-2361x51590', 'Verla Dare Jr.', '662 Koepp Locks Suite 884\nPort Luluville, IN 81975', 'South Adellefort', '1987-09-16 10:27:08', 'Eum cum magni laboriosam quas. Atque quod fuga impedit quia ipsa. Voluptas placeat aut expedita quasi deserunt vero iure. Corrupti ullam laboriosam commodi.', 'Free'),
(914, 1, '1975-09-27', 'New Tomas', 'RoyalBlue', 'LightGoldenRodYellow', 'Guam', 'Not Select', 'wisoky.jasmin@example.net', '00040078941', 'Raheem Legros', '35255 Rippin Circle\nPort Moshe, WI 37560', 'New Eugeniahaven', '1977-01-31 05:25:33', 'Nobis aspernatur libero vel non et. Dolores assumenda odio aspernatur incidunt iusto vero. Voluptatem alias incidunt velit cum perferendis ut voluptatem.', 'Gold'),
(915, 2, '1988-04-09', 'Port Erik', 'Red', 'MediumSlateBlue', 'Luxembourg', 'Not Select', 'mavis06@example.com', '+81(1)1955705102', 'Vito Auer', '692 Moen Row\nEast Albertha, AZ 69336', 'Port Mayra', '1971-03-31 10:14:46', 'Commodi earum quidem repellat facilis cumque eligendi provident. Ullam similique nemo ut inventore corrupti qui quisquam consequuntur. Soluta et neque est ut.', 'Gold'),
(916, 2, '2011-12-05', 'New Hughchester', 'MidnightBlue', 'Lavender', 'Somalia', 'Male', 'zita69@example.com', '06794036980', 'Clemens Rath', '494 Connelly Row\nEast Frederiqueton, IL 73215', 'Hicklehaven', '2012-06-17 03:17:04', 'Omnis nam porro dolorum. Est eum voluptas qui laudantium sint distinctio. Ut minus est harum et. Eos incidunt ut repudiandae animi assumenda voluptatem.', 'Gold'),
(917, 1, '2014-07-14', 'East Juvenalland', 'LightYellow', 'Red', 'Luxembourg', 'Male', 'qhermiston@example.org', '09230007252', 'Coty Runolfsdottir', '6784 Adrain Burg Suite 088\nNew Eliastown, ID 45678-1803', 'East Isomview', '1976-01-21 01:37:21', 'Aut quaerat repellendus aut quis excepturi est minima. Repellendus et ipsum asperiores exercitationem quasi. Porro eligendi facilis ut quia perspiciatis ut. Et qui temporibus modi ipsa.', 'Free'),
(918, 0, '1984-02-15', 'Boehmfort', 'GhostWhite', 'MediumAquaMarine', 'Nicaragua', 'Female', 'weber.danny@example.org', '1-459-700-1375', 'Theron Fahey', '6800 Will Mills Apt. 500\nMorarmouth, DC 88989-8431', 'Vandervortfurt', '1989-09-07 21:58:45', 'Aut commodi ad reprehenderit est voluptatem ratione vitae. Distinctio quaerat ab explicabo placeat. Numquam exercitationem fugiat autem et nobis sapiente ut delectus. Sapiente velit dolor in.', 'Premium'),
(919, 0, '1995-12-21', 'New Mariam', 'Green', 'Indigo ', 'Croatia', 'Female', 'ldaniel@example.org', '+15(3)2124581630', 'Yolanda Lindgren DVM', '206 Leon Extension\nRafaelamouth, NC 38998-6607', 'Jacquesmouth', '1989-05-04 21:50:35', 'Ut vitae molestiae voluptatum culpa unde illo. Dignissimos est amet repellendus distinctio.', 'Silver'),
(920, 1, '1999-08-10', 'Cristobalville', 'DarkOliveGreen', 'PowderBlue', 'United Arab Emirates', 'Female', 'mazie12@example.com', '09957906324', 'Fay Wolf II', '872 Windler Passage Apt. 201\nWatsicaton, RI 81813-2328', 'Blickside', '2010-04-17 06:42:10', 'Aspernatur est ad cumque explicabo ab. Iste similique deserunt in sint quas in ipsum. Dolor omnis eum exercitationem repellendus facilis. Itaque beatae inventore corrupti est qui.', 'Premium'),
(921, 2, '1975-01-20', 'Lake Efrainside', 'SteelBlue', 'OliveDrab', 'Argentina', 'Female', 'fritsch.hugh@example.net', '+24(4)4423243378', 'Rachel Cronin', '96654 Deckow Expressway Apt. 562\nLelandberg, NE 58230', 'Willmsport', '1973-09-21 22:22:47', 'Sint et repudiandae sapiente omnis blanditiis natus illo qui. Quia optio autem culpa. Quis ut et quia tenetur aut nulla.', 'Silver'),
(922, 1, '2021-03-10', 'Margeville', 'GoldenRod', 'DarkSlateBlue', 'Seychelles', 'Female', 'prohaska.micheal@example.net', '(414)415-8153x230', 'Nils Bradtke', '8243 Legros Land\nJacobsbury, SD 99478-8231', 'Marilouland', '1988-06-02 17:34:05', 'Ut dicta voluptatibus omnis et. Sint aliquam non laudantium deserunt est eius fugit. Distinctio illum quod officiis commodi.', 'Free'),
(923, 0, '2010-03-14', 'West Martybury', 'AliceBlue', 'DarkOliveGreen', 'Spain', 'Male', 'zkreiger@example.org', '205-270-9671x6805', 'Angelita Mohr', '37447 Esperanza Branch Apt. 204\nNitzscheville, TX 28205-8567', 'North Jazminfort', '2015-11-19 12:22:08', 'Doloremque debitis vel illo voluptatem quia recusandae. Quos voluptates facere dolores enim consectetur architecto voluptatem. Sequi excepturi iusto provident autem. Et odit aut maxime aut ex pariatur exercitationem.', 'Gold'),
(924, 0, '1985-04-28', 'Pagacshire', 'DarkKhaki', 'Tomato', 'Saint Kitts and Nevis', 'Not Select', 'huels.skylar@example.org', '1-939-078-9042', 'Faustino Harvey', '34909 Letitia Curve\nEast Normaland, WA 80579-4775', 'Jayneton', '2005-07-07 20:52:07', 'Aut in ipsam atque eveniet quod non. Ipsam eum ut impedit qui. Natus dignissimos illum et ut assumenda est.', 'Premium'),
(925, 0, '2008-12-11', 'New Callieland', 'MediumVioletRed', 'LightSkyBlue', 'Afghanistan', 'Female', 'dawson.wuckert@example.com', '1-713-957-7038x3929', 'Ena Ferry', '469 Bode Overpass Suite 497\nRoobbury, VA 15805-7673', 'New Laishafurt', '2019-08-09 15:31:54', 'Deserunt nesciunt dolor sit. Qui labore ut error dolore ut soluta voluptatem. Veritatis omnis voluptas ab assumenda.', 'Gold'),
(926, 0, '1974-04-17', 'Greenshire', 'BurlyWood', 'Sienna', 'Iran', 'Male', 'don.witting@example.org', '+12(0)9387463392', 'Flo Ebert Sr.', '192 Citlalli Mountains\nPort Lennyton, NM 54923', 'New Marcos', '1984-09-14 18:31:43', 'Perspiciatis et doloribus adipisci non atque rem a. Veritatis totam voluptate consequatur tempora tempore. Alias dolores distinctio ut sunt.', 'Premium'),
(927, 2, '2007-03-13', 'Kaneberg', 'MediumPurple', 'DarkGoldenRod', 'Brazil', 'Female', 'tillman.blaise@example.net', '(237)085-2724', 'Prof. Elton Skiles Jr.', '3843 Savion Causeway\nRhiannonstad, OH 39227', 'North Edythburgh', '2007-12-31 23:06:08', 'Aut ex dignissimos deleniti voluptatem quasi. Ipsum nulla aut omnis. Laboriosam ut quasi minima.', 'Gold'),
(928, 0, '1970-07-19', 'East Sanfordmouth', 'Tomato', 'SlateGray', 'Indonesia', 'Not Select', 'velma51@example.net', '1-056-957-8275x1830', 'Malachi Paucek', '42827 Mazie Points Suite 904\nPort Kayli, WY 97299', 'Swaniawskiview', '2008-01-24 21:25:40', 'Amet fugit sunt ut eum. Aut in qui quis quia odio. Quae molestiae maiores labore enim accusantium totam nostrum. Debitis ad eos et eaque quo culpa distinctio.', 'Gold'),
(929, 0, '1997-02-14', 'Novellaview', 'Bisque', 'PaleGreen', 'Kuwait', 'Female', 'bradly.walsh@example.org', '1-139-960-4846x17974', 'Dedric Schinner', '5435 Mohr Stravenue Apt. 732\nEast Dorris, NM 51600-0172', 'South Brady', '1988-11-30 00:10:19', 'Molestiae vel qui ipsa autem inventore. Autem suscipit impedit quisquam eum. Velit odio non saepe ipsa. Provident aliquid dolorum accusamus quia aut maxime.', 'Silver'),
(930, 0, '1980-09-07', 'Port Aileen', 'DarkMagenta', 'Azure', 'Puerto Rico', 'Male', 'thodkiewicz@example.org', '06648484992', 'Dan Wunsch', '624 Gerhold Camp Apt. 987\nPort Elta, IA 44566', 'North Marianamouth', '1972-01-07 03:19:21', 'Minima natus nihil architecto molestias eveniet enim alias velit. Sed et odit qui nulla repellat iste. Et sequi rerum aperiam occaecati maxime sapiente enim.', 'Gold'),
(931, 2, '2008-05-04', 'East Jamaal', 'Olive', 'DarkGray', 'Syrian Arab Republic', 'Not Select', 'darrion.witting@example.net', '050.430.5517', 'Marcellus Kutch', '49735 Paul Shoals\nXzavierfurt, PA 26407', 'Wyattburgh', '1972-01-02 14:45:22', 'Vel et eveniet ipsam voluptas ut quia magni quae. Vitae maxime qui provident quo. Nesciunt autem id quo necessitatibus rem quia enim sed.', 'Gold'),
(932, 0, '1988-05-19', 'Yolandabury', 'Darkorange', 'Cyan', 'Guernsey', 'Not Select', 'xfeeney@example.net', '04566485576', 'Mr. Arlo Little', '9708 Gilda Circles Suite 201\nNew Andersonfurt, NV 51379', 'Schambergerside', '1984-05-10 08:13:05', 'Dolore est voluptatem non aliquam et reiciendis. Harum rem aut temporibus enim. Et reiciendis doloribus consequatur in consequatur ipsum.', 'Silver'),
(933, 1, '1983-08-31', 'West Laron', 'Coral', 'Green', 'Saudi Arabia', 'Not Select', 'd\'amore.charley@example.com', '(962)737-2716', 'Yoshiko Olson', '6904 Lilyan Turnpike\nPort Laurie, MD 38422', 'Lake Blair', '1980-04-03 19:19:44', 'Nihil et alias aut rerum. Perferendis voluptatem qui officia eos neque. Doloremque ad ad autem dolorum ut quae pariatur voluptatem.', 'Free'),
(934, 2, '1978-08-13', 'East Faeshire', 'Chartreuse', 'OrangeRed', 'Sudan', 'Male', 'rolfson.veronica@example.com', '635-018-2436', 'Melvin Nikolaus', '160 Muller Orchard\nPfannerstillbury, VA 65434', 'Keeblerfort', '2000-04-29 20:33:58', 'Tenetur quo dolor architecto tempora corrupti ad omnis excepturi. Pariatur consequatur quos facere ut quisquam quidem. Quia ut officia voluptas ut.', 'Premium'),
(935, 1, '1980-01-21', 'West Gilbert', 'Purple', 'LightGreen', 'Niger', 'Female', 'shea.lueilwitz@example.net', '259.317.1170x9939', 'Rae Cremin', '68294 Clifton Gateway\nNorth Rubye, TN 17706-4550', 'Windlermouth', '1978-07-13 10:33:50', 'Iure et rerum itaque. Labore reprehenderit voluptatum veritatis aperiam ducimus. Ut nobis dolorem aut quisquam laborum dolor exercitationem repudiandae.', 'Premium'),
(936, 0, '1997-12-08', 'East Amos', 'MediumTurquoise', 'PaleGoldenRod', 'Sri Lanka', 'Female', 'reed55@example.com', '(502)730-9164x8104', 'Dr. Elmer Weber Sr.', '138 Sydney Mountains\nOberbrunnerport, MI 78976', 'Remingtonport', '2011-08-09 11:22:20', 'Sunt itaque illo itaque ut molestiae suscipit natus. Nesciunt et minus omnis dolorem minus rerum. Praesentium et ratione molestiae aspernatur eligendi.', 'Gold'),
(937, 1, '1987-06-10', 'New Trudiemouth', 'White', 'SkyBlue', 'Kuwait', 'Female', 'adele91@example.net', '461.854.3627x372', 'Neal O\'Reilly', '110 Arnaldo Squares Suite 577\nLake Frederic, DC 58647-5292', 'Shieldstown', '2016-11-17 11:59:14', 'Nulla officiis vel beatae. Aut repellat ut enim voluptatem. Placeat eligendi nihil quos nulla eos. Ut expedita dignissimos sunt cumque.', 'Silver'),
(938, 0, '2019-09-26', 'Reichelshire', 'Purple', 'DarkGoldenRod', 'Malta', 'Male', 'celestine.ortiz@example.com', '(453)490-2416', 'Therese Will MD', '5421 Jeffry Spur\nSouth Isadore, KY 85083', 'Kautzerport', '1998-07-28 23:25:26', 'Fugit laudantium sit harum. Modi enim magni dignissimos ipsam.', 'Silver'),
(939, 1, '1976-07-23', 'Domingoside', 'IndianRed ', 'Pink', 'Maldives', 'Not Select', 'kaia.skiles@example.net', '1-985-630-1835x96787', 'Tiara Gislason', '359 Okuneva Manors Suite 893\nLednerburgh, VA 82687', 'Tristianberg', '2019-11-21 20:40:59', 'Enim suscipit iure quis tenetur laboriosam dolore. Distinctio velit adipisci nobis eum cum accusantium quaerat.', 'Silver'),
(940, 1, '1982-08-31', 'Hamillbury', 'Purple', 'PaleGreen', 'Mauritius', 'Not Select', 'forrest.mante@example.org', '+18(8)4353304075', 'Cecelia Abshire', '956 Blanca Gateway Suite 408\nRohanport, OR 60433-5460', 'McKenzieshire', '1995-10-14 09:18:42', 'Quasi iusto vero perspiciatis est qui. Explicabo error nihil sapiente maxime. Alias qui neque ut neque vitae. Possimus debitis consequatur autem consequatur eos amet.', 'Gold'),
(941, 0, '1992-02-11', 'Conroyfurt', 'DarkGoldenRod', 'LightSeaGreen', 'Oman', 'Male', 'pkunde@example.org', '678-015-3155', 'Mr. Manuela Fritsch', '962 Hagenes Coves\nPort Rosaton, TX 79231', 'Marianeville', '2002-11-11 04:22:17', 'Architecto in quibusdam minima et. Animi ipsa harum nobis dolore. Qui quod voluptatem aut sed voluptates repellat. Assumenda aliquam porro consectetur natus amet.', 'Gold'),
(942, 2, '2002-02-15', 'East Doug', 'WhiteSmoke', 'CadetBlue', 'Jordan', 'Male', 'laura23@example.net', '(280)469-8877', 'Izaiah Pagac II', '54979 Jacobs Ways\nLake Cortez, AK 86927-8867', 'Wilfridchester', '1991-12-31 06:32:25', 'Ullam omnis autem consequuntur eum inventore in. Aut placeat excepturi ea qui voluptates. Soluta rem quaerat doloribus eum autem.', 'Silver'),
(943, 1, '2018-09-21', 'West Leopoldton', 'Tomato', 'DarkTurquoise', 'Bosnia and Herzegovina', 'Male', 'whomenick@example.com', '728-155-2084x95182', 'Mr. Colin Johnston', '84154 Dedric Roads Suite 391\nSouth Alberto, WI 07276-7755', 'Port Lauren', '1987-07-07 22:51:06', 'Labore et eaque repellendus eveniet est facere voluptatem optio. Minima vitae qui quos aut. Eos aliquam sint distinctio dolor. Dolore ad accusamus non optio qui. Amet occaecati magni omnis illum ut.', 'Free'),
(944, 1, '2008-03-03', 'Immanuelbury', 'DarkKhaki', 'YellowGreen', 'Niger', 'Female', 'alysson.crist@example.com', '128.809.8865x6100', 'Cameron Mohr', '21442 Cecelia Expressway\nNorth Johnpaul, NM 73031-7385', 'Lake Jarvistown', '2007-12-16 18:42:25', 'Alias maiores blanditiis et totam. Voluptas omnis dolor rerum quod ut ex cupiditate. Ducimus debitis doloremque earum illum inventore laudantium ut. Dignissimos exercitationem debitis quia quas aut molestiae accusantium.', 'Gold'),
(945, 2, '1987-08-13', 'Sadyeburgh', 'Tomato', 'Wheat', 'Guinea-Bissau', 'Female', 'shaun03@example.net', '1-972-054-6822', 'Miss Edwina Dickens', '26311 Okuneva Heights\nStehrton, ND 18878-3799', 'North Emmaleechester', '2017-01-10 07:55:18', 'Consequatur distinctio veritatis quisquam est. Et ipsa et aspernatur quaerat neque aliquid quibusdam. Earum velit omnis odit repudiandae minus ut sunt ab.', 'Premium'),
(946, 2, '1971-03-08', 'West Ernahaven', 'LightBlue', 'LawnGreen', 'Saudi Arabia', 'Male', 'xspencer@example.org', '132-708-7468', 'Serena Abbott Jr.', '925 Johan Centers Suite 502\nCronahaven, HI 58584', 'Dooleymouth', '1974-07-19 11:36:55', 'Nobis est tempora nesciunt qui atque. Qui et in ratione ullam. Nesciunt reiciendis hic consequatur architecto voluptatem qui voluptate.', 'Free'),
(947, 0, '2007-10-26', 'Willowtown', 'Bisque', 'LightGoldenRodYellow', 'Jersey', 'Not Select', 'braun.telly@example.org', '06611581579', 'Maxine Pouros II', '29376 Miracle Union Apt. 107\nWest Terence, UT 22779', 'East Anabelletown', '2017-04-29 12:18:26', 'Ab illo id quas qui incidunt nihil. Dolores cum minus ipsam. Eaque voluptas quia ipsa velit aperiam esse et voluptatibus. Ducimus error sapiente alias voluptatum eos illo cupiditate.', 'Free'),
(948, 1, '1977-06-27', 'Effertzfort', 'PeachPuff', 'OldLace', 'Isle of Man', 'Male', 'noberbrunner@example.org', '1-124-300-6532x98915', 'Kory Parisian', '96417 Jaskolski Grove\nHeathcoteton, MO 99888', 'Lake Favian', '2017-08-04 04:21:03', 'Quasi et rerum amet quia eaque. Aut officiis praesentium accusantium a vero minima est. Excepturi aut nemo ea enim sed officia. Delectus ut architecto et enim incidunt vel sed.', 'Silver'),
(949, 2, '2012-05-01', 'Dixiehaven', 'DarkOliveGreen', 'PeachPuff', 'Chad', 'Male', 'monahan.makenna@example.org', '017-210-6006x33488', 'Chaim Lakin', '209 Opal Extensions\nPort Laurianne, CA 49784', 'Port Blaiseshire', '1991-12-21 22:30:05', 'Non quaerat facilis et velit esse dicta quo. Voluptatum perferendis qui quia deserunt omnis ea. Et natus minus atque similique assumenda. Voluptates veniam vel cum.', 'Free'),
(950, 1, '1982-12-12', 'Port Dayneberg', 'GhostWhite', 'DarkRed', 'Cyprus', 'Not Select', 'maria.watsica@example.net', '921.589.4717', 'Lexie Feil', '787 Jensen Street Suite 268\nAufderharview, LA 10711', 'Pfefferland', '2005-04-14 22:01:01', 'Numquam vel eos unde totam nisi quisquam at. Voluptatem illo architecto consequatur nobis delectus ea. Veniam et accusantium tempore suscipit voluptatem ea. Ratione voluptate delectus ducimus inventore nisi ea.', 'Premium');
INSERT INTO `individual` (`id`, `status`, `date_of_birth`, `place_of_birth`, `church_name`, `organization`, `country`, `gender`, `email`, `phone`, `name`, `address`, `city`, `since`, `description`, `packet`) VALUES
(951, 2, '2007-02-14', 'Bartonland', 'LightGreen', 'GhostWhite', 'Gabon', 'Female', 'willis.sipes@example.org', '1-674-902-3084x7325', 'Gregory Kub', '51180 Veum Freeway Suite 474\nRueckerchester, MO 54276', 'North Shanyland', '2019-05-20 15:46:21', 'Sit eum perferendis voluptatibus. Odit id voluptatibus earum. Accusantium est animi quo optio.', 'Free'),
(952, 1, '2016-03-03', 'New Vivienfurt', 'Plum', 'Violet', 'Vietnam', 'Male', 'rschaefer@example.net', '1-468-367-0988x1045', 'Alexandra Tremblay', '10120 Iva Mews Suite 215\nJosefabury, HI 22351', 'Benedictstad', '1985-06-05 09:15:48', 'Autem autem tenetur saepe cupiditate illo. Placeat minus a adipisci quis. Molestias enim aperiam maiores eos error. Autem optio nihil ad est.', 'Free'),
(953, 0, '2011-05-24', 'North Oswald', 'DarkRed', 'Maroon', 'Albania', 'Not Select', 'vito07@example.com', '(662)414-1582x8816', 'Ms. Mabel Harvey', '224 Hellen Wall\nLake Josephmouth, NH 58054-9916', 'Wisokyborough', '2005-03-26 10:45:33', 'Voluptates vel animi totam facere ut qui labore. Numquam labore aut rerum. Nam dicta ipsum consectetur et. Et rerum corrupti rem non.', 'Premium'),
(954, 1, '1991-02-25', 'Loyton', 'Chocolate', 'LightCyan', 'Christmas Island', 'Female', 'tklein@example.org', '+77(7)4698419535', 'Darian Klein', '83142 Maci Meadow\nLake Olenland, SC 56181-6280', 'Sylvantown', '1982-03-02 07:22:00', 'Eos tempore eveniet consequatur. Hic reprehenderit tempora ad. Id adipisci ipsa ut et qui. Et perferendis aut odit explicabo.', 'Premium'),
(955, 2, '1982-06-21', 'Michelebury', 'Wheat', 'DarkBlue', 'Rwanda', 'Female', 'dkutch@example.com', '1-840-237-3099', 'Mrs. Vesta Barrows DVM', '7142 Graham Oval\nRessieside, VT 68092', 'New Gerard', '1987-12-08 00:00:49', 'Aperiam aliquam vel culpa deserunt. Qui earum aliquam et illum. Tenetur voluptatibus est autem sequi.', 'Premium'),
(956, 0, '2002-09-08', 'New Andreanne', 'Pink', 'Violet', 'Saint Barthelemy', 'Female', 'taurean07@example.com', '038-929-8494x20464', 'Esperanza Murray II', '0929 Clement Pike Suite 904\nNew Vidafort, IN 80229-2056', 'South Rodrigo', '1999-06-25 04:38:52', 'Quibusdam sunt qui consectetur. Esse tempore quia doloribus quia vel est. Neque esse odio aut mollitia. Autem ab rerum consequatur inventore iure corporis sunt. Totam sint ut ab suscipit sed quas delectus.', 'Free'),
(957, 2, '1988-10-14', 'Dareville', 'DarkKhaki', 'Aqua', 'Sweden', 'Male', 'violette57@example.org', '783-041-0892x28513', 'Aubree Parisian', '041 Dickinson Forges Apt. 173\nEast Armandotown, AR 24355', 'Johnsberg', '2021-04-07 17:18:57', 'Velit ut suscipit velit sit alias. Sit aut quidem quia quia exercitationem. In numquam quo consequatur incidunt. Assumenda laboriosam voluptas qui asperiores ut.', 'Silver'),
(958, 0, '1990-03-16', 'South Ronny', 'LightGray', 'Bisque', 'Panama', 'Not Select', 'okuneva.kamryn@example.com', '253-046-1587', 'Prof. Catherine Raynor IV', '9459 Heaven Spring Apt. 337\nSouth Kristian, AR 18456', 'North Tremaineville', '2011-12-27 13:05:19', 'Sequi impedit hic labore. Nemo aliquam quam est numquam nihil. Cum ipsa explicabo tenetur dolor quibusdam dolores tempore.', 'Free'),
(959, 1, '1999-08-24', 'North Edwina', 'Khaki', 'Khaki', 'San Marino', 'Male', 'levi.runolfsdottir@example.org', '178.882.2680x16124', 'Skyla Kilback', '54976 Kohler Parks\nTabithafort, NM 87098', 'Hollieside', '1989-07-20 14:09:14', 'Eius molestias tempora quo unde in et rerum. Cum omnis ut accusamus ut ut ipsam quaerat nesciunt.', 'Free'),
(960, 2, '1977-04-13', 'North Valentineport', 'LightGray', 'Blue', 'Greenland', 'Not Select', 'blanda.bradford@example.net', '538-950-5389x3790', 'Mikayla Morissette Sr.', '37332 Emory Lane Suite 110\nNorth Myrnamouth, AK 43942', 'East Emmie', '1975-05-30 18:07:37', 'Placeat natus ad nihil suscipit praesentium in. Ad qui et excepturi enim nihil exercitationem.', 'Silver'),
(961, 1, '1994-05-25', 'West Adellafort', 'CornflowerBlue', 'White', 'Finland', 'Female', 'annabelle11@example.net', '1-475-098-9615x11185', 'Jaren Muller', '75640 Becker Garden\nSchneiderberg, OK 14930', 'Hackettberg', '1970-09-18 06:50:38', 'Nemo esse id sed dolor. Est consequuntur placeat et dicta vel reiciendis aut. Dolore dicta similique dolores sunt suscipit blanditiis.', 'Free'),
(962, 1, '2012-09-11', 'Lake Jackson', 'SeaGreen', 'OliveDrab', 'Austria', 'Not Select', 'ronaldo.reynolds@example.com', '(477)480-6032x299', 'Prof. Allison Nitzsche DDS', '05907 Stoltenberg Island\nNorth Haylee, RI 27322', 'Zulaufbury', '1989-11-17 16:41:40', 'Explicabo quidem dicta natus. Sapiente qui qui ea. Doloribus nobis facere officia officia quis voluptas voluptas aut.', 'Silver'),
(963, 0, '2005-10-23', 'Port Luther', 'DarkSlateGray', 'SaddleBrown', 'Belize', 'Female', 'ellen46@example.net', '02370993339', 'Pearline Yundt', '846 Jules Spur Apt. 903\nLake Yessenia, OR 41198', 'East Makennaville', '1992-10-06 06:54:17', 'Nihil molestiae est quod eos. Tempora ea assumenda voluptates voluptas recusandae aperiam. Omnis dolores aliquam rerum in dolores similique consequuntur eum.', 'Premium'),
(964, 1, '1993-12-21', 'North Karolann', 'Gainsboro', 'MediumPurple', 'Georgia', 'Male', 'bo68@example.com', '131-258-6431x2257', 'Charlotte Sipes', '76562 Orville Center Suite 565\nKristinastad, MI 85442', 'Katharinaland', '1975-04-01 02:15:22', 'Quas natus labore quis fuga. Nisi repudiandae vel animi quam. Fuga ex sequi doloremque deleniti sit quam voluptas. Molestiae quo aut ipsum consectetur repellat. Laboriosam inventore voluptatem beatae eaque dolorem voluptas sed omnis.', 'Free'),
(965, 2, '2018-08-10', 'Clovisfort', 'OrangeRed', 'Chocolate', 'Germany', 'Male', 'cremin.ova@example.org', '232.261.8984', 'Dr. Julio Kuvalis IV', '119 Shaina Orchard Suite 245\nBoyleshire, KY 41334', 'East Elinor', '2018-01-10 16:02:00', 'Itaque in eveniet atque eveniet ut. Laborum illo et possimus quibusdam et est dolores. Reiciendis optio aut eum qui mollitia tenetur.', 'Gold'),
(966, 1, '2019-10-28', 'Jadenhaven', 'LightSlateGray', 'DarkRed', 'Netherlands', 'Male', 'vcarter@example.org', '04920635195', 'Mr. Abraham Kassulke', '733 Harley Mills\nJosianechester, NV 55346-7254', 'New Suzanneport', '2021-04-12 19:39:59', 'Qui accusamus suscipit est libero accusamus nulla pariatur. Consequatur eius aut assumenda assumenda temporibus quaerat voluptatem porro. Recusandae fugiat nihil voluptas molestiae. Rem rem soluta iusto quis.', 'Silver'),
(967, 0, '2021-10-21', 'South Gregoria', 'DarkCyan', 'DimGrey', 'Yemen', 'Female', 'klein.roderick@example.net', '519.291.7151', 'Dr. Berry Kemmer', '148 Edison Alley\nBergstromfort, MO 49941', 'Lake Tressie', '2011-04-25 01:12:10', 'Et occaecati ab fuga quisquam. Repudiandae dolor sed ipsum ratione natus delectus suscipit. Dolor sequi nesciunt et. Ipsam est temporibus assumenda blanditiis cumque.', 'Free'),
(968, 0, '2022-05-31', 'East Aniyastad', 'AliceBlue', 'Chocolate', 'Nigeria', 'Not Select', 'stiedemann.nicolette@example.com', '03770940009', 'Izabella Littel', '66937 Daniel Falls\nLamontmouth, NY 38199-3890', 'Norwoodport', '2016-06-25 01:39:03', 'Tempora nesciunt vel reprehenderit ut commodi consequuntur. In qui quaerat facere. Mollitia sunt est sit. Nihil ullam voluptas aliquid atque qui.', 'Gold'),
(969, 0, '1992-07-21', 'Alvafort', 'Lavender', 'SlateGray', 'Turkmenistan', 'Female', 'glover.sydney@example.org', '462.541.6005', 'Thad Ward', '098 Nicolas Pines Apt. 225\nKaelynville, MT 57537', 'Reynoldsberg', '2008-07-28 00:52:34', 'Aut dolorum porro quidem ut id cumque qui cumque. Veritatis ea cupiditate facere. Quasi doloremque reprehenderit voluptatem et ipsum error. Impedit aut vitae officia sint eveniet id.', 'Gold'),
(970, 0, '1997-07-15', 'West Jairo', 'SlateBlue', 'PaleVioletRed', 'Malta', 'Not Select', 'abshire.noemie@example.org', '(095)110-8660x2081', 'Jamir Thompson PhD', '129 Crist Circle Suite 085\nSouth Adelineshire, IN 38170', 'West Freidastad', '2000-05-12 11:26:38', 'Fugit tempore quibusdam sit. Dolor sint minima nihil accusantium et ea iure. Quia tempora sequi molestiae veniam omnis exercitationem libero cumque. Nesciunt molestiae voluptatem enim eaque vero corrupti velit. Sapiente porro quae quod sequi laborum.', 'Premium'),
(971, 0, '1991-01-01', 'New Desireechester', 'SpringGreen', 'Plum', 'Lesotho', 'Female', 'grady.ardith@example.com', '(904)364-4446', 'Iliana Towne', '9797 Madisyn Falls Suite 467\nCarterberg, ID 95936-0437', 'Herzoghaven', '1993-10-19 21:25:58', 'Dolore fuga illo quisquam et. Eaque quia sint quo magni placeat et. Aut rerum nemo similique. Eius voluptate animi id fugiat ut eos ut.', 'Free'),
(972, 1, '2012-04-24', 'Wilkinsonside', 'Thistle', 'SlateGray', 'Australia', 'Not Select', 'stella.kertzmann@example.net', '(528)709-2014x71542', 'Dr. Elsa Turner', '88313 Hoeger Mews Suite 530\nNorth Autumnbury, CA 59694-2851', 'Macejkovicton', '2004-08-15 09:22:46', 'Veritatis aut id sunt ullam aut. Ullam quibusdam autem veritatis perferendis itaque autem dolorem architecto. Quo quae quidem asperiores id molestias dolore at quod.', 'Free'),
(973, 2, '1970-07-05', 'Mayachester', 'PaleVioletRed', 'DeepSkyBlue', 'Nigeria', 'Not Select', 'xlynch@example.net', '781.767.9361x7299', 'Mr. Gerson Sanford', '013 Sipes Square Apt. 799\nNew Hugh, CT 28110', 'Murphymouth', '2018-03-31 02:28:13', 'Quo consequuntur quia recusandae nulla. Ipsam voluptatem autem adipisci. Et animi reiciendis harum rerum. Et ipsa ab inventore. Dolores ea repellendus doloremque corporis omnis.', 'Free'),
(974, 1, '1974-09-26', 'East Cortneyshire', 'DarkMagenta', 'LightBlue', 'Botswana', 'Not Select', 'reece53@example.com', '623-878-5504x3237', 'Elbert Hammes', '8729 Presley Skyway Suite 439\nSophiafort, CT 10453', 'Gradychester', '1988-07-19 16:07:08', 'Rerum enim nostrum atque optio natus velit sunt et. Magnam ut ducimus non dolorem quam ea est. Ducimus aut et ducimus. Excepturi aliquid et corporis voluptas itaque totam. Qui ad mollitia cum ut at.', 'Free'),
(975, 2, '2013-01-14', 'Port Kole', 'SeaShell', 'LightSteelBlue', 'United States of America', 'Not Select', 'berenice19@example.net', '(431)886-2239', 'Sally O\'Conner', '693 Alexandrea Way Apt. 175\nLake Harveyton, TN 83770', 'North Pansy', '2002-10-13 17:42:15', 'Ut odit id vitae expedita odit. Ut nostrum dolorem labore nisi laudantium velit. Numquam maiores vel animi ea consequuntur voluptatibus. Accusamus autem quam ad.', 'Premium'),
(976, 0, '1981-01-18', 'Altenwerthchester', 'GreenYellow', 'Maroon', 'Egypt', 'Not Select', 'darrin23@example.com', '939.669.6993', 'Everette Fadel', '84030 Paucek Squares Suite 768\nLake Veldahaven, NY 04235-1558', 'East Emmyville', '2002-06-09 17:46:31', 'Omnis in dolorem temporibus eos enim et aut. Aut saepe nam veniam aspernatur labore beatae. Et aut aperiam enim ex laborum et ea. Nobis ut ut illum impedit et.', 'Gold'),
(977, 2, '1980-10-02', 'New Maudemouth', 'MidnightBlue', 'MediumTurquoise', 'Malawi', 'Not Select', 'bleuschke@example.org', '+95(1)4689306098', 'Lenny Dach', '338 Prohaska Bridge\nGerholdmouth, NH 48432-5979', 'Robertsburgh', '2004-12-13 18:11:51', 'Alias quia harum consequatur omnis. Impedit recusandae harum aut doloribus et ipsa rerum. Deleniti id fuga possimus. Et provident qui sit ea vel neque nemo eligendi.', 'Free'),
(978, 2, '1986-03-05', 'South Leathamouth', 'OliveDrab', 'PaleGreen', 'Czech Republic', 'Not Select', 'itremblay@example.com', '(635)199-0826x3438', 'Kathleen Parker', '041 Dillan Point Suite 716\nLake Gavinfort, KS 68962-1803', 'Adamston', '2011-10-24 11:33:42', 'Voluptatem molestias dolor maxime aut porro facilis eum quia. Voluptatem pariatur repellendus hic illum eum. Eos autem perspiciatis nam est ab incidunt. Nam eum cumque reprehenderit et nihil omnis.', 'Gold'),
(979, 0, '2010-03-17', 'North Mollyfurt', 'LightYellow', 'AliceBlue', 'Portugal', 'Male', 'gibson.jude@example.org', '1-384-103-9574x39291', 'Alicia Hayes', '503 Satterfield Hill\nForresthaven, MN 64917-3554', 'Amirton', '2008-10-03 16:48:10', 'Quos ab sit molestiae corporis inventore temporibus. Quas ut ut minima similique. Voluptas velit et consequatur quisquam. Eos vel ducimus velit natus quaerat quidem.', 'Gold'),
(980, 1, '1972-01-09', 'Judyland', 'Azure', 'DarkGoldenRod', 'Canada', 'Not Select', 'yvonne65@example.net', '116-106-7753', 'Prof. Kaleigh Graham', '628 Michale Stream Suite 530\nNew Jazmynfort, NJ 91696', 'Connerville', '2014-06-05 09:06:59', 'Consequatur molestias accusantium quia a omnis. Similique omnis deserunt est nam ea qui illo. Dicta delectus enim eius sed quia aperiam.', 'Gold'),
(981, 1, '2018-10-16', 'New Antoniaton', 'MediumVioletRed', 'Silver', 'Vanuatu', 'Male', 'maximilian.mclaughlin@example.com', '(486)004-2767x786', 'Hal Thiel', '31353 Webster Green\nNew Dayanabury, OH 53977', 'Emoryborough', '2004-03-14 23:27:43', 'Atque qui rem placeat vel sit. Fugit amet minima ullam voluptatem. Ut saepe et consectetur numquam nobis voluptas mollitia.', 'Gold'),
(982, 2, '2017-03-23', 'South Arnoldo', 'FireBrick', 'Plum', 'Marshall Islands', 'Female', 'ilene40@example.org', '+52(6)4309742549', 'Jane Stiedemann Jr.', '9849 Heber Burg\nOwenview, ID 43092', 'East Rebekachester', '1993-05-17 03:13:17', 'Non totam sit aut quia porro. Dolor quia asperiores rerum consectetur veritatis eos voluptatem et. In odio quae culpa mollitia voluptatem et ad inventore. Ad corporis culpa veniam doloribus minus vel.', 'Premium'),
(983, 0, '1976-01-02', 'Adalbertoborough', 'DodgerBlue', 'SandyBrown', 'Albania', 'Not Select', 'osbaldo74@example.com', '632-367-1793x264', 'Justice Russel', '92227 Dare Dale Suite 399\nBatzbury, AK 45629-7158', 'South Mae', '1979-02-27 08:34:41', 'Voluptas rerum ullam fugiat tempora laboriosam et. Eum eaque aut sint. Illum minima officia nisi impedit quis velit. Necessitatibus iure sint quo.', 'Gold'),
(984, 1, '2018-05-18', 'West Maxime', 'Tan', 'GhostWhite', 'French Polynesia', 'Male', 'altenwerth.claudine@example.org', '619.116.7681x2676', 'Mr. Sherwood Pacocha', '4896 Cassie Freeway Suite 748\nBeckershire, MO 78157', 'East Dagmar', '1996-07-12 15:58:49', 'Possimus aut officiis quis consequatur dolor mollitia. Aperiam consequatur eaque accusamus eum est. Quam quidem eaque tempore fuga rerum sunt ut. Quos non nisi corrupti et non dolor.', 'Premium'),
(985, 2, '1995-07-02', 'Simoneview', 'SkyBlue', 'DarkOliveGreen', 'Antigua and Barbuda', 'Male', 'reggie.white@example.net', '583.013.8245', 'Cary Pagac DDS', '63991 Leta Lane\nSouth Saul, CA 74866-5716', 'West Mohammad', '1975-11-30 09:15:57', 'In earum perferendis nulla nihil. Nihil a recusandae praesentium modi cum. Et et voluptas rerum iure ut nulla repellat saepe.', 'Free'),
(986, 2, '1991-02-16', 'Townefort', 'DarkTurquoise', 'Plum', 'Poland', 'Female', 'oswaldo.marks@example.com', '808-942-0951x3655', 'Prof. Lori Kling PhD', '03415 Kuhlman Pines Suite 257\nMilanfort, CA 26378', 'Montanaburgh', '1971-02-15 06:36:39', 'Voluptate sint exercitationem ipsam qui ipsam. Ut beatae harum repellendus quaerat omnis ea. Aut sint iusto nisi eum hic et et.', 'Gold'),
(987, 1, '1994-07-17', 'North Zion', 'CornflowerBlue', 'Khaki', 'Bangladesh', 'Not Select', 'jean42@example.net', '(935)589-4616', 'Eden Labadie', '766 Chanelle Lakes\nNorth Chadrickstad, WY 58197-6554', 'Lockmanberg', '1987-06-13 03:23:16', 'Quasi neque nostrum saepe tenetur exercitationem necessitatibus quia. Veritatis error iure sint ut molestiae ipsum. Laudantium nisi nulla iure iste veniam.', 'Silver'),
(988, 1, '2003-08-02', 'Marlenmouth', 'Olive', 'Gold', 'Poland', 'Not Select', 'raphaelle08@example.com', '055.534.1726x28770', 'Hildegard Stamm', '88992 Hazel Turnpike\nLake Easter, OR 86360', 'Paucekmouth', '2020-07-31 18:04:55', 'Dolor dolor ut rerum facere fugiat aspernatur. Eaque sit nemo veniam sapiente provident fugit cupiditate. Eos nisi tempora inventore et reprehenderit. Aut tempore aut ex.', 'Silver'),
(989, 0, '1974-04-28', 'West Josiahchester', 'Yellow', 'MistyRose', 'Libyan Arab Jamahiriya', 'Not Select', 'dave.klocko@example.net', '(169)846-3086x687', 'Charlotte Dietrich', '3376 Wilfred Run\nNew Eliseo, FL 47643-1256', 'Weberhaven', '2013-09-24 09:17:12', 'Corporis eligendi nisi et vel consequatur. Sed qui ipsa inventore quam. Quod vel suscipit qui modi.', 'Silver'),
(990, 0, '1976-03-05', 'North Javierberg', 'SpringGreen', 'LightGoldenRodYellow', 'Saint Barthelemy', 'Male', 'itzel67@example.com', '1-429-918-7559', 'Donnie Yost', '10511 Imelda Avenue Apt. 279\nWest Josiah, AK 19399-2117', 'Yazminside', '1996-09-04 06:46:35', 'Et et ex voluptas voluptatem aliquid distinctio. Inventore aut repellat aliquid magni. Quis quisquam ea sit eum ab ea assumenda.', 'Silver'),
(991, 2, '1990-03-24', 'West Crystel', 'PowderBlue', 'SteelBlue', 'Reunion', 'Not Select', 'padberg.coleman@example.com', '+93(3)9866760772', 'Miss Rubie Windler II', '06398 Davis Crossroad\nHeloiseview, ND 02597', 'Elseburgh', '2006-01-26 02:55:17', 'Adipisci numquam in soluta voluptatem debitis quibusdam sunt. Est qui autem qui unde. Voluptas autem unde voluptatum laboriosam eum rerum.', 'Premium'),
(992, 2, '1986-04-12', 'Raulfurt', 'RosyBrown', 'LightGreen', 'New Caledonia', 'Male', 'nlueilwitz@example.net', '+28(0)2527704533', 'Gwen Hintz', '00270 Roberts Route Suite 967\nLefflerland, MO 74741-8483', 'Elishachester', '1986-01-13 04:36:10', 'Ab corporis et quam eos. Quo error tempore itaque atque ipsum. Explicabo voluptatibus odio maiores sunt quo voluptatem magnam. Sint sunt aspernatur fuga voluptas sed rerum rem.', 'Silver'),
(993, 1, '2003-04-05', 'East Madilynport', 'Salmon', 'OliveDrab', 'Lithuania', 'Not Select', 'tad74@example.com', '(971)952-3255x1753', 'Dr. Teresa Walter V', '8917 Mohr Green Apt. 641\nEast Paxton, OK 67878-7707', 'Kerluketown', '2019-08-19 23:12:12', 'Consequuntur expedita consequuntur cum vel quibusdam ipsam magni. Rerum asperiores perferendis doloremque ut dolores. Quaerat eius modi porro. Accusantium sequi est quod id nemo.', 'Silver'),
(994, 1, '2000-02-05', 'New Chestershire', 'PaleGoldenRod', 'PaleGreen', 'Latvia', 'Male', 'sgreen@example.org', '772.489.7786', 'Joshuah Pfeffer', '92026 Yost Row\nPaucekport, NY 16033', 'Bergestad', '1980-03-20 10:52:20', 'Doloribus non sit rerum illo. Natus magnam fugiat omnis ut quis mollitia. Corrupti consequatur praesentium explicabo voluptate in et dolores.', 'Silver'),
(995, 0, '2015-05-12', 'Eliseoland', 'Chartreuse', 'Olive', 'Thailand', 'Male', 'archibald.mills@example.org', '(342)265-8054', 'Mr. Avery Kuhlman DVM', '72758 Gene Lane Suite 055\nKatharinastad, WV 98028-8794', 'West Mariannamouth', '1985-11-20 13:57:39', 'Vel voluptas velit aut a accusamus maxime quae. Dolorum incidunt laborum in animi officia velit voluptate. Hic enim qui doloribus incidunt et odit dolorum. Optio aut error beatae suscipit aut et esse non.', 'Silver'),
(996, 2, '2010-10-13', 'New Margothaven', 'WhiteSmoke', 'SeaGreen', 'Thailand', 'Not Select', 'hfay@example.com', '(685)196-3773x40523', 'Emmett Parker MD', '445 Delfina Parkway\nIsomview, ME 75773-9964', 'North Easter', '2014-10-21 22:54:45', 'Eligendi architecto esse nostrum soluta rem voluptatem consequatur. Iure placeat est maxime et accusantium molestiae deserunt. In eveniet inventore quas voluptates ut consequatur. Reprehenderit maiores numquam repellendus.', 'Free'),
(997, 1, '2000-11-08', 'New Alexandriamouth', 'Turquoise', 'NavajoWhite', 'Tonga', 'Male', 'nlabadie@example.com', '085.942.1206x1647', 'Sherman Toy', '61574 Nikolaus Roads Apt. 819\nEdnaburgh, VT 76405', 'South Angeline', '1988-11-05 11:15:04', 'Maiores nobis omnis esse totam harum. Sunt accusamus sint natus unde. Iure provident autem vitae autem dolores sit. Porro est exercitationem dolorem consequatur.', 'Free'),
(998, 1, '1992-09-17', 'South Kyle', 'LimeGreen', 'Lavender', 'Palau', 'Not Select', 'lakin.percy@example.org', '885.318.7629x854', 'Mrs. Monique Gislason', '770 Durgan Walk\nLake Olga, NC 66770-8841', 'East Libbystad', '1997-04-28 15:24:31', 'Saepe aliquid qui est quas a perspiciatis. Blanditiis qui facilis voluptatem nostrum repellendus magnam eos. Dolorum voluptate eligendi recusandae non hic voluptatem.', 'Gold'),
(999, 2, '1984-03-29', 'Steubershire', 'MediumAquaMarine', 'RosyBrown', 'Brunei Darussalam', 'Not Select', 'jarrod45@example.com', '+94(7)9794415297', 'Alena Osinski', '76269 Kaylah Stream Apt. 748\nLake Hunterborough, MN 44126-0438', 'Port Ahmad', '1994-06-18 03:25:28', 'Modi quia ipsa voluptatem similique modi. Esse quis placeat in ipsum.', 'Silver'),
(1000, 1, '1981-08-18', 'Krajcikport', 'ForestGreen', 'Chartreuse', 'Italy', 'Male', 'ikemmer@example.net', '+79(5)5614097243', 'Cortez Miller', '769 Shanie Rue\nEmmerichmouth, DC 74734-6582', 'West Fordtown', '2009-08-31 17:25:43', 'Inventore itaque consectetur nam consequatur at vitae. Cum velit eum odit sit molestiae aliquam. Nihil inventore ut provident quis in eaque tempore. Est earum itaque aut sunt.', 'Premium');

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
  `church_name` varchar(255) NOT NULL,
  `organization` varchar(255) NOT NULL,
  `country` varchar(255) NOT NULL,
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

INSERT INTO `organization` (`id`, `church_name`, `organization`, `country`, `email`, `phone`, `filled`, `max`, `name`, `address`, `city`, `since`, `description`, `packet`) VALUES
(1, 'MidnightBlue', 'Darkorange', 'Guinea', 'ciara.gottlieb@example.net', '287.245.6904', 10, 0, 'RosyBrown', '60556 Claudine Lodge Suite 209\nJoseville, SC 28791', 'Diannahaven', '1998-01-15 19:48:49', 'Aspernatur soluta et accusantium laboriosam. Iste commodi facere et sapiente velit itaque ipsum cupiditate. Qui quia quo molestiae.', 'Gold'),
(2, 'MediumPurple', 'FireBrick', 'Costa Rica', 'd\'amore.orion@example.net', '(306)478-5111', 22, 0, 'Gray', '256 Chance Junctions Apt. 980\nEast Kathryneshire, NE 36306', 'South Darianmouth', '1987-12-25 09:57:43', 'Voluptas nihil animi repellendus voluptas consequuntur suscipit. Voluptates aut iusto at qui. Autem cumque impedit distinctio fugit maxime animi ipsum. Adipisci nihil in velit beatae autem molestias.', 'Premium'),
(3, 'DarkSalmon', 'OrangeRed', 'Bahrain', 'veum.kathleen@example.org', '059.232.2702x86545', 18, 0, 'OrangeRed', '35233 Ferry Valley Apt. 654\nDoraton, NJ 18409-5459', 'Halvorsonberg', '2014-12-31 14:26:27', 'In necessitatibus debitis quis molestiae distinctio molestias sit. Optio officiis sed omnis sit numquam sint. Voluptas error minus totam assumenda omnis. Quis suscipit quae laudantium eos ea.', 'Gold'),
(4, 'MediumOrchid', 'AliceBlue', 'Maldives', 'deckow.warren@example.net', '296-169-3607', 9, 0, 'LightBlue', '87405 Hansen Mews Apt. 095\nGarettview, MS 96818-7513', 'Lake Keyshawnborough', '1997-11-18 16:10:55', 'Laudantium quaerat qui cumque. Consectetur unde pariatur similique libero. Dolor ut autem ipsa quia. Non ut qui quia at esse.', 'Premium'),
(5, 'LavenderBlush', 'Tomato', 'Afghanistan', 'dibbert.leonardo@example.com', '834.200.5938', 14, 0, 'LightSeaGreen', '328 Karelle Overpass\nNorth Alexane, OH 61202-7413', 'Lake Nakia', '1996-12-06 01:31:41', 'Veniam blanditiis quas qui sunt non dolore. Maiores placeat et cupiditate incidunt itaque nesciunt corporis. Amet debitis neque libero eum vel ut. Autem et est inventore est reiciendis quod labore.', 'Gold'),
(6, 'PaleGoldenRod', 'WhiteSmoke', 'Northern Mariana Islands', 'skrajcik@example.com', '1-103-885-0108x3056', 23, 0, 'LightPink', '3864 Brown Mountain Suite 410\nThoraberg, ME 02233-9750', 'Lake Monica', '2018-06-24 13:22:57', 'Et enim consectetur ab sed beatae omnis sed. Ullam est repellendus explicabo harum dolor.', 'Premium'),
(7, 'DarkBlue', 'Indigo ', 'Cuba', 'frances34@example.org', '928-388-6158x6252', 3, 0, 'LightSlateGray', '0246 Armstrong Lights Suite 715\nEast Laney, LA 47240-3617', 'Fabianland', '2020-06-22 18:05:54', 'Reprehenderit corrupti sapiente qui illo nesciunt ea. Corrupti sequi consequatur laboriosam autem voluptatibus voluptate. Et pariatur natus suscipit laborum quia laboriosam quisquam.', 'Premium'),
(8, 'MediumOrchid', 'Sienna', 'Faroe Islands', 'lauren58@example.com', '1-011-572-4994', 30, 0, 'LawnGreen', '5480 Eulalia Corner Suite 193\nHickleport, NE 32893', 'Francotown', '1986-06-08 15:37:48', 'Voluptas sed sit ut explicabo eveniet assumenda. Ullam in dolorem maiores et non possimus. Voluptatem error quia sunt consequatur ex rerum.', 'Silver'),
(9, 'GreenYellow', 'Tan', 'Gabon', 'roslyn94@example.org', '(095)612-7743x59189', 29, 0, 'GhostWhite', '39881 Alena Ferry Apt. 481\nEast Yvonnemouth, RI 97958', 'Taniatown', '2017-10-08 02:18:51', 'Odit a facilis rerum quasi. Et quia quo nobis quam recusandae. Quae ut perferendis optio animi consequuntur.', 'Premium'),
(10, 'Plum', 'MediumAquaMarine', 'Dominica', 'hbeatty@example.com', '(864)635-5194x9179', 23, 0, 'LightPink', '60873 Langworth Parkways\nHarveyview, RI 59139-0275', 'Stoltenbergland', '2011-01-30 08:12:39', 'Quia optio inventore et fuga. Et sequi asperiores modi omnis laboriosam. Temporibus assumenda architecto quisquam voluptatum et error id quidem.', 'Gold'),
(11, 'DimGray', 'Gold', 'Jamaica', 'eli56@example.com', '+68(9)9148666543', 14, 0, 'SaddleBrown', '1640 Braun River Apt. 617\nPort Connormouth, NC 81688-5359', 'Lake Tobin', '2013-07-28 20:34:38', 'Possimus repellat sit deserunt mollitia. Quasi occaecati consequatur modi quos iste voluptatem enim ea. Suscipit eos voluptatibus debitis illo.', 'Gold'),
(12, 'MediumSeaGreen', 'Coral', 'Bosnia and Herzegovina', 'sedrick.adams@example.net', '671-878-6689x013', 29, 0, 'PaleTurquoise', '163 Jayda Crossroad Suite 975\nNew Feltonchester, NM 97755', 'New Lucasburgh', '1977-03-20 19:53:40', 'Quia et est et molestiae possimus. Nisi illum sit magnam aut recusandae harum. Quia corporis explicabo dolores.', 'Gold'),
(13, 'Chocolate', 'Tan', 'American Samoa', 'wrenner@example.com', '07171261602', 15, 0, 'Orange', '319 Andreane Highway\nChristinaton, GA 31648-8246', 'Kosschester', '2004-12-19 19:10:37', 'Voluptatem et debitis enim. Consequatur consequuntur provident aut quia ut repellat. Numquam possimus ex et dolor ullam ut. Magni commodi qui reprehenderit culpa pariatur eos.', 'Premium'),
(14, 'Silver', 'Purple', 'Holy See (Vatican City State)', 'ophelia.hirthe@example.com', '480-768-8853', 6, 0, 'MediumTurquoise', '832 Bruen Points\nBrucechester, TN 15153-3903', 'Lake Bradford', '1973-10-18 08:50:26', 'Quaerat aut qui tempora sit dolores. Consequatur dolore illo omnis ut nemo eius deserunt. Tempora animi porro ipsa doloribus quia dolor ipsa. Repellendus sed et unde qui ut. Consequatur placeat sit ullam aliquam minus et doloribus.', 'Silver'),
(15, 'Chocolate', 'Azure', 'Rwanda', 'helene.feeney@example.org', '01034799043', 1, 0, 'Bisque', '3937 Murphy Walk\nNorth Gardner, WI 89064-1746', 'Swaniawskiville', '2019-02-14 03:12:10', 'Minus sapiente in non molestias quia corrupti similique. Sunt odit qui odio id corporis nesciunt optio. Repellendus eos saepe possimus qui quis omnis.', 'Gold'),
(16, 'Gainsboro', 'Indigo ', 'Tuvalu', 'vmueller@example.com', '(750)177-3898', 16, 0, 'RosyBrown', '8991 Kurtis Plains\nDeclanstad, NM 20086-0821', 'South Gladys', '1982-02-25 05:56:50', 'Repellat fugit omnis qui voluptatem eius voluptatem. Neque recusandae veniam repellat omnis. Aperiam accusamus voluptas pariatur quidem. Cupiditate velit voluptas exercitationem aliquid. Accusantium aspernatur rerum est eos culpa sit provident quaerat.', 'Silver'),
(17, 'LimeGreen', 'Silver', 'Grenada', 'angelica48@example.com', '00439862670', 24, 0, 'Gainsboro', '990 Doyle Spur Suite 823\nEast Kathlynstad, UT 05698', 'Carrollstad', '2003-05-04 22:21:30', 'Nihil quia amet optio fuga officiis. Eligendi placeat amet sequi doloremque consequatur quis. Id nam qui quis nobis illum cum nihil.', 'Gold'),
(18, 'GhostWhite', 'CornflowerBlue', 'Malawi', 'rhane@example.net', '1-663-308-9320x595', 19, 0, 'PeachPuff', '402 Gilberto Oval\nWintheiserfurt, WA 50448-3460', 'Alysonchester', '1993-03-28 23:25:38', 'Fugit dolores consectetur consequatur totam distinctio voluptate. Iste a alias sint voluptas deserunt eum. Sunt sit doloribus tempora omnis.', 'Silver'),
(19, 'SteelBlue', 'SpringGreen', 'Macedonia', 'deshaun09@example.com', '(107)772-0391x161', 14, 0, 'ForestGreen', '7562 Euna Point\nJairostad, WA 63523-9525', 'Lake Celestine', '2015-04-18 03:24:25', 'Pariatur occaecati ad qui eaque aut rem. Magnam id voluptatem numquam eaque. Est sint nisi iure.', 'Silver'),
(20, 'GoldenRod', 'Black', 'Antigua and Barbuda', 'padberg.augustus@example.com', '376-539-3710', 22, 0, 'SkyBlue', '86986 Fatima Keys Suite 652\nEast Nakia, VT 15905', 'Erlingbury', '1991-11-17 08:08:11', 'Praesentium corporis suscipit enim sit saepe. Ea qui illum omnis quos repellat qui laboriosam. Et qui possimus sequi porro fugit voluptatem cumque quaerat.', 'Premium'),
(21, 'Tomato', 'Snow', 'Philippines', 'alicia.wilderman@example.org', '+31(5)0597761469', 29, 0, 'MediumPurple', '45028 Casper Wells\nFeeneychester, OH 96615-6289', 'Wilfordshire', '1999-09-05 03:25:46', 'Quia similique culpa quo assumenda nulla quod. Ullam dolor adipisci qui. Rem facilis in animi autem consequuntur debitis. Itaque blanditiis neque sequi enim.', 'Premium'),
(22, 'AliceBlue', 'IndianRed ', 'Mayotte', 'jakubowski.geovany@example.com', '254.105.0500', 24, 0, 'Tan', '0717 Cruickshank Mountains Apt. 803\nPedrochester, WA 05207-8812', 'Flostad', '1977-11-22 04:00:15', 'Quibusdam sequi in reprehenderit odit molestiae esse. Fugit optio tempore ab facilis a. Sint autem autem id voluptatibus.', 'Silver'),
(23, 'Orchid', 'Cyan', 'Russian Federation', 'kuhlman.dario@example.com', '1-074-435-2837', 29, 0, 'DarkViolet', '960 Skiles Grove\nLangoshview, OK 65592', 'Marshalltown', '2012-09-29 16:10:45', 'Pariatur quo repellat est reiciendis similique corporis incidunt. Dolores unde eum est vel dolorem vel. Tenetur excepturi itaque ea numquam.', 'Silver'),
(24, 'DodgerBlue', 'PapayaWhip', 'Cocos (Keeling) Islands', 'lschamberger@example.net', '1-575-212-0131', 18, 0, 'DimGrey', '007 Pacocha Oval\nFionabury, OR 78130-0088', 'Kautzerland', '2019-11-16 05:25:28', 'Doloribus ratione temporibus laboriosam quas aut ratione. Et ut error cum eveniet. Sunt similique quia quod laboriosam et.', 'Premium'),
(25, 'OliveDrab', 'RosyBrown', 'Martinique', 'jean.funk@example.org', '773-188-7302', 13, 0, 'DodgerBlue', '5321 Marjolaine Orchard Suite 074\nPort Lon, PA 49744', 'Volkmanmouth', '1995-12-15 14:13:25', 'Minima architecto error sit rerum. Ut voluptatem neque ut vel. Vel dolores maxime nisi inventore exercitationem voluptatem rem. Iure non voluptatem eius consequatur tempora.', 'Premium'),
(26, 'Cyan', 'LightGray', 'Heard Island and McDonald Islands', 'mraz.santos@example.com', '+00(2)5813859796', 13, 0, 'AntiqueWhite', '65222 Cole Club\nNedraview, IA 83159-4133', 'Lioneltown', '2005-05-19 02:59:17', 'Est quidem quaerat ea non reiciendis sit ut. Perferendis hic illo esse.', 'Gold'),
(27, 'PaleVioletRed', 'MediumBlue', 'Guam', 'tmcdermott@example.net', '251-353-8465', 11, 0, 'DarkBlue', '6569 Layla Views\nAuroreport, UT 38175-4318', 'Vincenzafurt', '1985-03-12 04:42:20', 'Cupiditate quasi impedit et cupiditate. Culpa dolorum occaecati dignissimos saepe quas blanditiis nobis. Iure soluta minima nam aliquam laudantium corporis. Assumenda optio reiciendis voluptatibus quidem nesciunt maxime laborum.', 'Premium'),
(28, 'MediumSpringGreen', 'LightSkyBlue', 'Russian Federation', 'milton06@example.com', '223-904-4055x733', 23, 0, 'LightSalmon', '8883 Nellie Squares\nVioletfurt, OH 34170-8525', 'South Kennystad', '1998-05-14 21:03:02', 'Rerum soluta non quis nihil esse et ut. Provident fugiat voluptatum voluptates nihil. Officiis iste tenetur autem. Sunt sed minima non in.', 'Silver'),
(29, 'RosyBrown', 'DarkTurquoise', 'Suriname', 'ransom.gibson@example.net', '290.891.7855x1677', 27, 0, 'Bisque', '053 Jerrell Stream Suite 188\nSouth Kaileyton, OR 08729', 'Adalinebury', '2003-03-14 16:02:08', 'Dolores expedita et ad a illum perspiciatis eum. At enim est libero in rerum eum. Dolores voluptatibus eos amet corrupti et non qui. Quibusdam voluptatem esse asperiores.', 'Silver'),
(30, 'SlateBlue', 'ForestGreen', 'Macao', 'drew.heidenreich@example.net', '188.209.7864x0300', 17, 0, 'LightSalmon', '087 Jody Field\nEloisafurt, MS 45287-9220', 'South Vernermouth', '1980-03-13 11:06:22', 'Est illo molestias sapiente et. Eveniet numquam qui voluptas quae molestiae. Ut rerum cumque aliquam molestiae.', 'Silver'),
(31, 'DimGrey', 'LightSeaGreen', 'India', 'elmo.dare@example.net', '1-376-951-8951x1704', 9, 0, 'Olive', '2486 Garett Springs\nZiemannmouth, DC 85758', 'West Wyman', '2001-01-03 17:07:32', 'Quia minima molestiae quam recusandae magni vel. Perspiciatis aspernatur reiciendis error numquam. Dolores nam deserunt sapiente sapiente qui quo. Et eligendi et autem debitis sit. Totam expedita et magnam et et fugit sunt.', 'Gold'),
(32, 'SeaGreen', 'Bisque', 'Papua New Guinea', 'weldon.ernser@example.com', '+59(9)2079733588', 19, 0, 'MistyRose', '726 Ruecker Mount Suite 919\nNew Lawrence, HI 86938', 'Marquardtshire', '2004-09-08 23:09:49', 'Molestiae ipsam omnis repudiandae qui. Voluptate eaque et dolor excepturi quia.', 'Gold'),
(33, 'DarkSalmon', 'DarkViolet', 'Saint Barthelemy', 'emie.hyatt@example.com', '1-425-462-7100', 26, 0, 'Olive', '4679 Tremblay Streets\nNorth Alycehaven, TX 05472-9175', 'Mrazview', '1999-02-16 11:09:51', 'Et ut iure voluptas molestiae culpa autem. Pariatur fuga sed molestiae deserunt pariatur consequatur.', 'Gold'),
(34, 'Plum', 'DarkKhaki', 'Faroe Islands', 'iconn@example.com', '175.915.5483x40154', 11, 0, 'LightSeaGreen', '40001 Kaleb Village\nStoltenbergbury, OH 44142-2935', 'Breitenbergburgh', '1991-09-06 14:59:58', 'Accusantium temporibus suscipit consectetur id aut sed et. Dolorem nulla voluptatem nihil et et et. Sapiente officiis officia labore ipsam.', 'Gold'),
(35, 'Salmon', 'LightCyan', 'Sierra Leone', 'kim.macejkovic@example.com', '+75(6)8285410269', 1, 0, 'HotPink', '654 Brennan Freeway\nNew Coleman, VT 19381-1482', 'Lake Domenick', '2002-01-19 21:22:59', 'Enim et in voluptate aliquam quod velit commodi molestiae. Exercitationem at eveniet odit. Minima maiores vero nesciunt sint. Odio aperiam iusto voluptates vel sapiente.', 'Gold'),
(36, 'BurlyWood', 'SlateGray', 'Lebanon', 'jaunita61@example.org', '934.114.2562', 25, 0, 'SeaShell', '037 Johnson Burg\nAidanborough, OR 78998-5407', 'Hoegerside', '1971-03-13 16:17:29', 'Itaque quaerat quis in molestiae. Consectetur nulla odit dolorem pariatur. Et nostrum eum odit ut repudiandae dolor sed.', 'Premium'),
(37, 'PowderBlue', 'Wheat', 'Lebanon', 'weston82@example.org', '02031700822', 28, 0, 'Cyan', '23930 Schaefer Alley Apt. 474\nMarlonstad, OH 68947-1597', 'Veumhaven', '2003-09-09 13:54:04', 'Quae autem aliquid quos sunt illum. Est sed dolores molestiae esse autem vel. Soluta similique et vel voluptas. Doloremque recusandae consequatur numquam in quo ipsam voluptate.', 'Premium'),
(38, 'Chartreuse', 'SpringGreen', 'Vietnam', 'olson.vesta@example.net', '063-531-1633', 28, 0, 'SandyBrown', '8740 Modesto Grove Apt. 506\nMathildehaven, VT 59976', 'Lake Adan', '1988-06-16 04:08:22', 'Harum ipsum dolor aut corrupti. Doloribus distinctio qui et cumque dolor autem rerum ipsa. Omnis ut corrupti ut quo quidem voluptate excepturi. Voluptatum distinctio quaerat sit et rem voluptas sed.', 'Premium'),
(39, 'Fuchsia', 'Cornsilk', 'Monaco', 'melany.feest@example.org', '(637)549-5216x55108', 12, 0, 'SpringGreen', '440 Katelyn Ports\nJadeberg, NC 04933', 'Mikaylaview', '2013-11-18 18:07:01', 'Voluptas voluptates praesentium ullam dolorem. Qui in libero modi dolor omnis et. Tempora ut ducimus voluptas sunt autem. Accusamus recusandae doloribus repellat eaque explicabo.', 'Gold'),
(40, 'LightSlateGray', 'Gray', 'Tonga', 'christiansen.chaim@example.org', '017-596-4258x96440', 11, 0, 'SkyBlue', '19823 Johns Station Suite 371\nNew Reuben, DC 92883', 'Huelschester', '2006-03-08 06:32:32', 'Rem quas nobis consequuntur deserunt. Dolore incidunt aut iste modi optio sunt. Et ut quam illo architecto dolorem architecto qui.', 'Silver'),
(41, 'MidnightBlue', 'MediumPurple', 'Palestinian Territory', 'juvenal07@example.com', '744-633-2481x66511', 10, 0, 'Brown', '60941 Carter Lakes Suite 725\nSouth Alfredoburgh, NJ 51053-7714', 'North Jermainefort', '2017-01-18 15:16:05', 'Qui dolor omnis veniam nihil. Excepturi sapiente voluptas magnam consequatur adipisci.', 'Gold'),
(42, 'LightCyan', 'Gainsboro', 'Mayotte', 'kihn.frederic@example.org', '(565)022-9233x9033', 10, 0, 'LightCoral', '6990 Cassin Meadow Apt. 394\nAuerton, LA 91536', 'Thompsonview', '1999-09-09 20:19:46', 'Quidem recusandae cum magni in veritatis earum quia. Occaecati rem est omnis autem cum et ut. Vero voluptatibus tempore odio optio. Nihil quasi ex alias quibusdam aut temporibus autem molestiae.', 'Premium'),
(43, 'RoyalBlue', 'DarkOrchid', 'Uganda', 'alexandra.flatley@example.org', '(961)761-5368', 2, 0, 'Linen', '0151 Dietrich Ramp\nRachellemouth, WY 39061-3427', 'Tatyanachester', '2005-02-16 06:18:04', 'Ratione quod voluptatem et sint et inventore vel. Dolorum dolorum ex autem voluptatum. Ut provident nulla nesciunt et qui quia.', 'Premium'),
(44, 'LightPink', 'Beige', 'Austria', 'nherzog@example.net', '01685531296', 16, 0, 'Aquamarine', '08762 Lia Street Suite 129\nWest Wellingtonmouth, NH 37503', 'Kundeville', '2007-08-12 22:57:27', 'Voluptate odio voluptas sequi a sint. Nemo explicabo non ut est facere culpa dicta. Quia a soluta itaque deleniti enim.', 'Premium'),
(45, 'SpringGreen', 'Gainsboro', 'Armenia', 'grutherford@example.net', '1-795-590-9524x98395', 1, 0, 'SlateBlue', '284 Muller Place\nEffertzside, MD 24782', 'East Roel', '2021-07-28 01:12:28', 'Consequatur et nemo distinctio sit ut minima quae. Et facere placeat aut.', 'Premium'),
(46, 'MintCream', 'LawnGreen', 'Saint Pierre and Miquelon', 'sandy92@example.net', '899-702-7601x28898', 11, 0, 'Magenta', '747 Quinton Drives Suite 258\nHarbershire, VT 08430', 'Karliview', '2021-04-29 01:00:04', 'Vitae voluptas perspiciatis placeat vel nam ut aperiam. Voluptatibus quia placeat accusamus ut fugiat dignissimos nisi.', 'Gold'),
(47, 'MidnightBlue', 'Ivory', 'Estonia', 'elwin.crona@example.com', '539.179.3339x88577', 30, 0, 'RoyalBlue', '32999 McLaughlin Ports\nPort Haylie, UT 73199', 'South Sarina', '1981-02-15 06:36:26', 'Nostrum et deserunt quia fuga consequatur. Recusandae nostrum dignissimos deleniti. Et aperiam repellat modi error.', 'Silver'),
(48, 'MediumBlue', 'LightGray', 'Christmas Island', 'jaylan.schowalter@example.net', '(825)149-9521x25872', 20, 0, 'LightSlateGray', '86517 Ondricka Throughway Suite 663\nWest Gideon, GA 28601', 'Lake Jeffry', '1978-12-08 09:30:04', 'Aut aut et possimus eius pariatur. Nostrum assumenda harum expedita. Et quaerat eligendi minus necessitatibus.', 'Premium'),
(49, 'MediumAquaMarine', 'Aqua', 'Isle of Man', 'kattie.conn@example.org', '1-963-573-7851x87497', 12, 0, 'GhostWhite', '6649 Wilma Way Apt. 700\nNew Myleneborough, SC 53802-2155', 'Carrollshire', '1995-03-26 21:28:06', 'Praesentium et eos esse rerum quas soluta. Sint ut omnis labore dolore. Voluptatibus expedita explicabo voluptatibus. Eaque commodi voluptatum voluptas vel maiores dolorem.', 'Silver'),
(50, 'OrangeRed', 'Salmon', 'Chile', 'myles.nolan@example.net', '443-428-9719x01404', 8, 0, 'MidnightBlue', '956 Ona Island Apt. 452\nMarksside, WI 85880', 'Emilyshire', '1980-08-07 04:32:35', 'Eligendi enim delectus asperiores occaecati eos. Omnis qui alias sed est aut.', 'Silver');

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

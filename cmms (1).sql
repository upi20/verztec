-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Waktu pembuatan: 27 Bulan Mei 2022 pada 01.32
-- Versi server: 10.4.21-MariaDB
-- Versi PHP: 7.4.29

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
-- Struktur dari tabel `activity`
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
-- Struktur dari tabel `activity_log`
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
-- Dumping data untuk tabel `activity_log`
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
(577, 'Data Member', 273, 'Menambah data baru dengan isi profile = Opusisv Siti, peristiwa_formal = Tanggal Lahir, keterangan = akte kelahiran, tempat = bandung, tanggal_data_formal = 2022-01-01, status = Tidak Aktif', 'Belum ada data', 1, '2022-05-26 17:48:33');

-- --------------------------------------------------------

--
-- Struktur dari tabel `alamat`
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
-- Dumping data untuk tabel `alamat`
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
-- Struktur dari tabel `client_company`
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
-- Dumping data untuk tabel `client_company`
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
-- Struktur dari tabel `contact`
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
-- Dumping data untuk tabel `contact`
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
-- Struktur dari tabel `dashboard_activation`
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
-- Dumping data untuk tabel `dashboard_activation`
--

INSERT INTO `dashboard_activation` (`id`, `spm`, `repository`, `p2pk`, `aktifitas`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 2, 1, 2, 1, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Struktur dari tabel `data_formal`
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
-- Dumping data untuk tabel `data_formal`
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
-- Struktur dari tabel `data_formal_detail`
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
-- Dumping data untuk tabel `data_formal_detail`
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
-- Struktur dari tabel `dtm_peristiwa`
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
-- Dumping data untuk tabel `dtm_peristiwa`
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
-- Struktur dari tabel `gelar`
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
-- Struktur dari tabel `institusi`
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
-- Dumping data untuk tabel `institusi`
--

INSERT INTO `institusi` (`id`, `nama`, `keterangan`, `status`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'UPI', 'Upi', 0, NULL, NULL, NULL),
(2, 'Unikom', 'Unikom2', 1, NULL, NULL, NULL),
(3, '3', '3', 3, NULL, NULL, '2022-04-22 17:07:56');

-- --------------------------------------------------------

--
-- Struktur dari tabel `jabatan`
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
-- Dumping data untuk tabel `jabatan`
--

INSERT INTO `jabatan` (`id`, `nama`, `keterangan`, `no_urut`, `status`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Direktur', 'abcdef', 1, 1, '2022-04-02 12:19:53', NULL, NULL),
(2, 'Sekretaris', 'abcdef', 2, 1, '2022-04-02 12:20:05', NULL, NULL),
(3, '23111', '3111', 3111, 3, '2022-04-02 12:20:10', '2022-04-02 12:20:50', '2022-04-02 12:20:50'),
(4, 'Bendahara', 'Bendahara', 3, 1, '2022-04-08 18:21:11', NULL, NULL);

-- --------------------------------------------------------

--
-- Struktur dari tabel `jenis_alamat`
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
-- Dumping data untuk tabel `jenis_alamat`
--

INSERT INTO `jenis_alamat` (`id`, `nama`, `keterangan`, `status`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Kost', 'Kost', 1, '2021-10-15 15:53:19', NULL, NULL),
(2, 'Domisili', 'Domisili', 1, '2021-10-15 15:53:57', NULL, NULL),
(3, 'b', 'b', 3, '2021-10-15 15:54:02', '2021-10-15 15:54:13', '2021-10-15 15:54:13'),
(4, 'Dummy', 'Detail Dummy', 3, '2021-10-15 15:55:14', '2021-10-15 15:55:21', '2021-10-15 15:55:21');

-- --------------------------------------------------------

--
-- Struktur dari tabel `jenis_gelar`
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
-- Dumping data untuk tabel `jenis_gelar`
--

INSERT INTO `jenis_gelar` (`id`, `nama`, `keterangan`, `status`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Diploma', 'Diploma', 1, '2021-10-15 15:58:47', NULL, NULL),
(2, 'Sarjana', 'Sarjana', 1, '2021-10-15 15:58:54', NULL, NULL),
(3, 'Master', 'Master', 1, '2021-10-15 15:59:02', NULL, NULL),
(4, 'Doktor', 'Doktor', 1, '2021-10-15 15:59:09', NULL, NULL),
(5, 'Dummys', 'Detail Dummys', 3, '2021-10-15 16:00:03', '2021-10-15 16:00:11', '2021-10-15 16:00:11');

-- --------------------------------------------------------

--
-- Struktur dari tabel `jenis_membership`
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
-- Dumping data untuk tabel `jenis_membership`
--

INSERT INTO `jenis_membership` (`id`, `nama`, `keterangan`, `status`, `id_level`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Level 1', 'Level 1', '1', NULL, '2021-10-21', '2022-02-18', NULL),
(2, 'Level 2', 'Level 2', '1', NULL, '2021-10-21', '2022-02-18', NULL),
(3, 'Level 3', 'Level 3', '1', NULL, '2021-10-21', '2022-02-18', NULL),
(4, 'Level 4', 'Level 4', '1', NULL, '2022-02-18', NULL, NULL),
(5, 'Level 5', 'Level 5', '1', NULL, '2022-02-18', NULL, NULL);

-- --------------------------------------------------------

--
-- Struktur dari tabel `kategorial`
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
-- Dumping data untuk tabel `kategorial`
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
-- Struktur dari tabel `kategori_keanggotaan`
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
-- Dumping data untuk tabel `kategori_keanggotaan`
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
-- Struktur dari tabel `kategori_p2pk`
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
-- Dumping data untuk tabel `kategori_p2pk`
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
-- Struktur dari tabel `keaktifan_pilihan`
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
-- Dumping data untuk tabel `keaktifan_pilihan`
--

INSERT INTO `keaktifan_pilihan` (`id`, `nama`, `keterangan`, `no_urut`, `status`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Pengarah', 'pengarah', 1, 1, '2022-05-24 07:30:14', '2022-05-24 07:33:05', NULL),
(2, 'Komisi', 'komisi', 2, 1, '2022-05-24 07:33:43', NULL, NULL),
(3, 'Kepanitiaan', 'kepanitiaan', 3, 1, '2022-05-24 07:34:02', NULL, NULL),
(4, 'Wilayahh', 'wilayah', 4, 1, '2022-05-24 07:34:17', '2022-05-24 07:37:44', NULL);

-- --------------------------------------------------------

--
-- Struktur dari tabel `kepanitiaan`
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
-- Dumping data untuk tabel `kepanitiaan`
--

INSERT INTO `kepanitiaan` (`id`, `nama`, `keterangan`, `no_urut`, `status`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'ABC', 'abc', 1, 1, '2022-04-02 16:54:04', '2022-04-02 16:54:16', NULL),
(2, '2', '2', 2, 3, '2022-04-02 16:54:09', '2022-04-02 16:54:19', '2022-04-02 16:54:19');

-- --------------------------------------------------------

--
-- Struktur dari tabel `keys`
--

CREATE TABLE `keys` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `key` varchar(40) NOT NULL,
  `level` int(11) DEFAULT NULL,
  `date_created` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `keys`
--

INSERT INTO `keys` (`id`, `user_id`, `key`, `level`, `date_created`) VALUES
(2, 1, 'login123456', 1, '2021-09-07 13:05:33');

-- --------------------------------------------------------

--
-- Struktur dari tabel `kode`
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
-- Dumping data untuk tabel `kode`
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
-- Struktur dari tabel `komisi`
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
-- Dumping data untuk tabel `komisi`
--

INSERT INTO `komisi` (`id`, `nama`, `keterangan`, `no_urut`, `status`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Komisi 1', 'Komisi 1', 1, 1, '2022-04-02 16:46:12', '2022-04-08 17:31:40', NULL),
(2, '2', '2', 2, 3, '2022-04-02 16:46:16', '2022-04-02 16:46:19', '2022-04-02 16:46:19'),
(3, 'Komisi 2', 'Komisi 2', 2, 1, '2022-04-08 17:31:51', NULL, NULL),
(4, 'Komisi 3', 'Komisi 3', 3, 1, '2022-04-08 17:31:58', NULL, NULL);

-- --------------------------------------------------------

--
-- Struktur dari tabel `laporan_header`
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
-- Dumping data untuk tabel `laporan_header`
--

INSERT INTO `laporan_header` (`id`, `id_menu`, `logo_1`, `logo_2`, `judul`, `keterangan_1`, `keterangan_2`, `status`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, NULL, '8d068e43432ae65d9926b60556711213.jpg', '89b6fa414c4ad7d046d36006f531322c.jpg', 'HKB CMMS', 'HKB keterangan', 'Alamat di sini', 1, '2022-03-21 14:14:54', '2022-05-24 15:20:52', NULL),
(2, NULL, NULL, NULL, NULL, '1', '1', 3, '2022-03-21 14:15:02', '2022-03-21 14:15:49', '2022-03-21 14:15:49');

-- --------------------------------------------------------

--
-- Struktur dari tabel `level`
--

CREATE TABLE `level` (
  `lev_id` int(11) NOT NULL,
  `lev_nama` varchar(50) NOT NULL,
  `lev_keterangan` text NOT NULL,
  `lev_status` varchar(50) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `level`
--

INSERT INTO `level` (`lev_id`, `lev_nama`, `lev_keterangan`, `lev_status`, `created_at`) VALUES
(1, 'Super Admin', 'Super Admin', 'Aktif', '2020-06-18 09:40:31'),
(123, 'Reader', 'Level default profile untuk reader', 'Aktif', '2021-10-11 10:51:53'),
(124, 'Admin Staff', '-', 'Aktif', '2021-10-12 03:30:24'),
(125, 'Partner L1', '-', 'Aktif', '2021-10-12 03:33:05'),
(126, 'Partner L2', '-', 'Aktif', '2021-10-12 03:37:42');

-- --------------------------------------------------------

--
-- Struktur dari tabel `member`
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
-- Struktur dari tabel `membership`
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
-- Dumping data untuk tabel `membership`
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
-- Struktur dari tabel `membership_atasan`
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
-- Dumping data untuk tabel `membership_atasan`
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
-- Struktur dari tabel `menu`
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
-- Dumping data untuk tabel `menu`
--

INSERT INTO `menu` (`menu_id`, `menu_menu_id`, `menu_nama`, `menu_keterangan`, `menu_index`, `menu_icon`, `menu_url`, `menu_status`, `created_at`) VALUES
(1, 0, 'Dashboard', '-', 1, 'fa fa-suitcase', 'dashboard', 'Aktif', '2020-06-18 02:40:07'),
(2, 0, 'Users', '-', 7, 'fa fa-cogs', '#', 'Aktif', '2020-06-18 02:40:07'),
(3, 2, 'Hak Akses', '-', 8, 'far fa-circle', 'pengaturan/hakAkses', 'Aktif', '2020-06-18 02:40:07'),
(4, 2, 'Menu', '-', 9, 'far fa-circle', 'pengaturan/menu', 'Aktif', '2020-06-18 02:40:07'),
(5, 2, 'Level', '-', 7, 'far fa-circle', 'pengaturan/level', 'Aktif', '2020-06-18 02:40:07'),
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
(130, 1, 'Dashboard', '-', 1, 'far fa-circle', 'dashboard', 'Aktif', '2022-03-25 05:54:16'),
(131, 1, 'Report', '-', 2, 'far fa-circle', 'dashboard/report', 'Aktif', '2022-03-25 05:54:34'),
(132, 82, 'Jabatan', '-', 11, 'far fa-circle', 'data-master/jabatan', 'Aktif', '2022-04-01 19:07:25'),
(133, 82, 'Pengarah', '-', 12, 'far fa-circle', 'data-master/pengarah', 'Aktif', '2022-04-01 19:07:49'),
(134, 82, 'Komisi', '-', 13, 'far fa-circle', 'data-master/komisi', 'Aktif', '2022-04-01 19:08:19'),
(135, 82, 'Kepanitiaan', '-', 14, 'far fa-circle', 'data-master/kepanitiaan', 'Aktif', '2022-04-01 19:08:54'),
(136, 120, 'Institusi', '-', 3, 'far fa-circle', 'data-master/institusi', 'Aktif', '2022-04-22 10:02:07'),
(137, 0, 'Laporan', '-', 9, 'fas fa-book', '#', 'Aktif', '2022-05-09 08:46:36'),
(138, 120, 'Export Import Data Member ', '-', 1, 'far fa-circle', 'laporan/member', 'Aktif', '2022-05-09 08:47:33'),
(139, 82, 'Pilihan Keaktifan', '-', 14, 'far fa-circle', 'data-master/pilihanKeaktifan', 'Aktif', '2022-05-24 00:20:56');

-- --------------------------------------------------------

--
-- Struktur dari tabel `module_activation`
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
-- Dumping data untuk tabel `module_activation`
--

INSERT INTO `module_activation` (`id`, `p2pk`, `spm`, `repository`, `aktifitas`, `status`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 2, 2, 2, 2, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Struktur dari tabel `notifikasi`
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
-- Dumping data untuk tabel `notifikasi`
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
-- Struktur dari tabel `p2pk`
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
-- Struktur dari tabel `p2pk_planning`
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
-- Struktur dari tabel `p2pk_planning_file`
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
-- Struktur dari tabel `p2pk_proses_audit`
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
-- Struktur dari tabel `p2pk_proses_audit_file`
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
-- Struktur dari tabel `p2pk_report`
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
-- Struktur dari tabel `p2pk_report_detail`
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
-- Dumping data untuk tabel `p2pk_report_detail`
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
-- Struktur dari tabel `partner`
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
-- Dumping data untuk tabel `partner`
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
-- Struktur dari tabel `pengarah`
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
-- Dumping data untuk tabel `pengarah`
--

INSERT INTO `pengarah` (`id`, `nama`, `keterangan`, `no_urut`, `status`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Pengarah A', 'Pengarah A', 1, 1, '2022-04-02 16:43:14', '2022-04-08 17:29:43', NULL),
(2, '2', '2', 2, 3, '2022-04-02 16:44:10', '2022-04-02 16:44:13', '2022-04-02 16:44:13'),
(3, 'Pengarah B', 'Pengarah B', 2, 1, '2022-04-08 17:29:52', NULL, NULL),
(4, 'Pengarah C', 'Pengarah C', 3, 1, '2022-04-08 17:30:20', NULL, NULL);

-- --------------------------------------------------------

--
-- Struktur dari tabel `pengaturan_aplikasi`
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
-- Dumping data untuk tabel `pengaturan_aplikasi`
--

INSERT INTO `pengaturan_aplikasi` (`id`, `nama_aplikasi`, `keterangan`, `logo`, `favicon`, `status`, `created_at`) VALUES
(1, 'CmMS', 'Aplikasi Keanggotaan', 'be06780e6d4ad0f21c83e171d69e3c49.png', '5c1955efca59b79fd864e38c7c56a9b4.png', NULL, NULL);

-- --------------------------------------------------------

--
-- Struktur dari tabel `posisi`
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
-- Dumping data untuk tabel `posisi`
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
-- Struktur dari tabel `profesi`
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
-- Struktur dari tabel `profile`
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
-- Dumping data untuk tabel `profile`
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
-- Struktur dari tabel `profile_kategorial`
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
-- Dumping data untuk tabel `profile_kategorial`
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
-- Struktur dari tabel `profile_keaktifan`
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
-- Dumping data untuk tabel `profile_keaktifan`
--

INSERT INTO `profile_keaktifan` (`id`, `id_profile`, `id_jabatan`, `tanggal_mulai`, `tanggal_selesai`, `status`, `kode_master`, `id_master`, `text_master`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 190, 1, '2022-05-18', '0000-00-00', 1, 'Pengarah', 1, 'Pengarah A', '2022-05-21 13:33:30', NULL, NULL),
(2, 226, 2, '2022-05-11', '0000-00-00', 1, 'Komisi', 1, 'Komisi 1', '2022-05-24 15:05:04', NULL, NULL),
(3, 226, 1, '2022-01-01', '0000-00-00', 1, 'Pengarah', 4, 'Pengarah C', '2022-05-24 15:05:17', NULL, NULL),
(4, 226, 1, '2022-02-01', '0000-00-00', 1, 'Kepanitiaan', 2, '2', '2022-05-24 15:08:13', NULL, NULL),
(5, 225, 2, '2022-02-01', '0000-00-00', 1, 'Kepanitiaan', 1, 'ABC', '2022-05-24 16:48:56', NULL, NULL);

-- --------------------------------------------------------

--
-- Struktur dari tabel `profile_keanggotaan`
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
-- Dumping data untuk tabel `profile_keanggotaan`
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
-- Struktur dari tabel `profile_wilayah`
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
-- Dumping data untuk tabel `profile_wilayah`
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
-- Struktur dari tabel `repository`
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
-- Struktur dari tabel `resiko`
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
-- Dumping data untuk tabel `resiko`
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
-- Struktur dari tabel `role_aplikasi`
--

CREATE TABLE `role_aplikasi` (
  `rola_id` int(11) NOT NULL,
  `rola_menu_id` int(11) NOT NULL,
  `rola_lev_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `role_aplikasi`
--

INSERT INTO `role_aplikasi` (`rola_id`, `rola_menu_id`, `rola_lev_id`, `created_at`) VALUES
(1, 1, 1, '2021-07-14 12:27:04'),
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
(113, 3, 1, '2021-08-25 09:01:35'),
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
(282, 139, 1, '2022-05-24 00:21:27');

-- --------------------------------------------------------

--
-- Struktur dari tabel `role_users`
--

CREATE TABLE `role_users` (
  `role_id` int(11) NOT NULL,
  `role_user_id` int(11) NOT NULL,
  `role_lev_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `role_users`
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
-- Struktur dari tabel `spm`
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
-- Struktur dari tabel `template_download`
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
-- Dumping data untuk tabel `template_download`
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
-- Struktur dari tabel `term_management`
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
-- Dumping data untuk tabel `term_management`
--

INSERT INTO `term_management` (`id`, `id_menu`, `nama`, `keterangan`, `status`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1, 'Home', '-', '1', '2021-11-03 15:51:04', NULL, NULL),
(2, 3, 'Hak Akses', '-', '1', '2021-11-03 15:51:19', NULL, NULL),
(3, 4, 'Menu', '-', '1', '2021-11-03 15:53:21', NULL, NULL),
(4, 5, 'Level', '-', '1', '2021-11-03 15:53:34', NULL, NULL),
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
-- Struktur dari tabel `tipe_contact`
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
-- Dumping data untuk tabel `tipe_contact`
--

INSERT INTO `tipe_contact` (`id`, `nama`, `keterangan`, `status`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Email', '-', 1, '2021-10-15 17:29:29', '2022-05-14 19:50:26', NULL),
(2, 'Handphone', '-', 1, '2021-10-15 17:37:44', NULL, NULL),
(3, 'Telepon Rumah', '-', 1, '2021-10-15 17:37:58', NULL, NULL);

-- --------------------------------------------------------

--
-- Struktur dari tabel `tokens`
--

CREATE TABLE `tokens` (
  `id` int(11) NOT NULL,
  `token` varchar(255) NOT NULL,
  `user_id` int(10) NOT NULL,
  `created` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `tokens`
--

INSERT INTO `tokens` (`id`, `token`, `user_id`, `created`) VALUES
(135, 'da902c2508ab00608e14fa067011c9', 136, '2022-03-22'),
(136, 'd7600b85bb2d8724f3021c592b37af', 136, '2022-03-22'),
(137, 'c836bf7ee246bff1548ae90bc95d5d', 136, '2022-03-22'),
(138, 'decb6fcd7ff33c72c7d8124d5378a5', 137, '2022-03-22'),
(139, 'f9f32f10a3c5e95082a7c512239776', 138, '2022-03-22');

-- --------------------------------------------------------

--
-- Struktur dari tabel `trainer`
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
-- Dumping data untuk tabel `trainer`
--

INSERT INTO `trainer` (`id`, `nama`, `id_profile`, `status`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Test', 0, 1, '2021-11-16 18:08:39', NULL, NULL),
(2, 'fanny f', 50, 1, '2021-11-16 18:08:52', NULL, NULL),
(3, 'Developer Opusisv', 0, 1, '2021-11-18 13:07:49', NULL, NULL),
(4, 'Mas Giga', 0, 1, '2021-11-18 18:19:54', NULL, NULL),
(5, 'Soni Setiawan', 38, 1, '2021-11-18 18:20:13', NULL, NULL);

-- --------------------------------------------------------

--
-- Struktur dari tabel `users`
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
-- Dumping data untuk tabel `users`
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
-- Struktur dari tabel `version`
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
-- Dumping data untuk tabel `version`
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
-- Struktur dari tabel `wilayah`
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
-- Dumping data untuk tabel `wilayah`
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
-- Indeks untuk tabel `activity`
--
ALTER TABLE `activity`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `activity_log`
--
ALTER TABLE `activity_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `Key` (`by`);

--
-- Indeks untuk tabel `alamat`
--
ALTER TABLE `alamat`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_profile` (`id_profile`);

--
-- Indeks untuk tabel `client_company`
--
ALTER TABLE `client_company`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_resiko` (`id_resiko`);

--
-- Indeks untuk tabel `contact`
--
ALTER TABLE `contact`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_profile` (`id_profile`);

--
-- Indeks untuk tabel `dashboard_activation`
--
ALTER TABLE `dashboard_activation`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `data_formal`
--
ALTER TABLE `data_formal`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_profile` (`id_profile`),
  ADD KEY `dtm_peristiwa_id` (`dtm_peristiwa_id`);

--
-- Indeks untuk tabel `data_formal_detail`
--
ALTER TABLE `data_formal_detail`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `dtm_peristiwa`
--
ALTER TABLE `dtm_peristiwa`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `gelar`
--
ALTER TABLE `gelar`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_profile` (`id_profile`);

--
-- Indeks untuk tabel `institusi`
--
ALTER TABLE `institusi`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `jabatan`
--
ALTER TABLE `jabatan`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `jenis_alamat`
--
ALTER TABLE `jenis_alamat`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `jenis_gelar`
--
ALTER TABLE `jenis_gelar`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `jenis_membership`
--
ALTER TABLE `jenis_membership`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_level` (`id_level`);

--
-- Indeks untuk tabel `kategorial`
--
ALTER TABLE `kategorial`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `kategori_keanggotaan`
--
ALTER TABLE `kategori_keanggotaan`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `kategori_p2pk`
--
ALTER TABLE `kategori_p2pk`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `keaktifan_pilihan`
--
ALTER TABLE `keaktifan_pilihan`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `kepanitiaan`
--
ALTER TABLE `kepanitiaan`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `keys`
--
ALTER TABLE `keys`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `level` (`level`);

--
-- Indeks untuk tabel `kode`
--
ALTER TABLE `kode`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `komisi`
--
ALTER TABLE `komisi`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `laporan_header`
--
ALTER TABLE `laporan_header`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `level`
--
ALTER TABLE `level`
  ADD PRIMARY KEY (`lev_id`);

--
-- Indeks untuk tabel `member`
--
ALTER TABLE `member`
  ADD PRIMARY KEY (`id`),
  ADD KEY `created_by` (`created_by`),
  ADD KEY `updated_by` (`updated_by`);

--
-- Indeks untuk tabel `membership`
--
ALTER TABLE `membership`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_jenis_membership` (`id_jenis_membership`),
  ADD KEY `id_profile` (`id_profile`);

--
-- Indeks untuk tabel `membership_atasan`
--
ALTER TABLE `membership_atasan`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `menu`
--
ALTER TABLE `menu`
  ADD PRIMARY KEY (`menu_id`);

--
-- Indeks untuk tabel `module_activation`
--
ALTER TABLE `module_activation`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `notifikasi`
--
ALTER TABLE `notifikasi`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `p2pk`
--
ALTER TABLE `p2pk`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `p2pk_planning`
--
ALTER TABLE `p2pk_planning`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `p2pk_planning_file`
--
ALTER TABLE `p2pk_planning_file`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `p2pk_proses_audit`
--
ALTER TABLE `p2pk_proses_audit`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `p2pk_proses_audit_file`
--
ALTER TABLE `p2pk_proses_audit_file`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `p2pk_report`
--
ALTER TABLE `p2pk_report`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `p2pk_report_detail`
--
ALTER TABLE `p2pk_report_detail`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `partner`
--
ALTER TABLE `partner`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `pengarah`
--
ALTER TABLE `pengarah`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `pengaturan_aplikasi`
--
ALTER TABLE `pengaturan_aplikasi`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `posisi`
--
ALTER TABLE `posisi`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `profesi`
--
ALTER TABLE `profesi`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_profile` (`id_profile`);

--
-- Indeks untuk tabel `profile`
--
ALTER TABLE `profile`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_user` (`id_user`);

--
-- Indeks untuk tabel `profile_kategorial`
--
ALTER TABLE `profile_kategorial`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `profile_keaktifan`
--
ALTER TABLE `profile_keaktifan`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `profile_keanggotaan`
--
ALTER TABLE `profile_keanggotaan`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `profile_wilayah`
--
ALTER TABLE `profile_wilayah`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `repository`
--
ALTER TABLE `repository`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `resiko`
--
ALTER TABLE `resiko`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `role_aplikasi`
--
ALTER TABLE `role_aplikasi`
  ADD PRIMARY KEY (`rola_id`);

--
-- Indeks untuk tabel `role_users`
--
ALTER TABLE `role_users`
  ADD PRIMARY KEY (`role_id`);

--
-- Indeks untuk tabel `spm`
--
ALTER TABLE `spm`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `template_download`
--
ALTER TABLE `template_download`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `term_management`
--
ALTER TABLE `term_management`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `tipe_contact`
--
ALTER TABLE `tipe_contact`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `tokens`
--
ALTER TABLE `tokens`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `trainer`
--
ALTER TABLE `trainer`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`);

--
-- Indeks untuk tabel `version`
--
ALTER TABLE `version`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `wilayah`
--
ALTER TABLE `wilayah`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `activity`
--
ALTER TABLE `activity`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `activity_log`
--
ALTER TABLE `activity_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=578;

--
-- AUTO_INCREMENT untuk tabel `alamat`
--
ALTER TABLE `alamat`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=46;

--
-- AUTO_INCREMENT untuk tabel `client_company`
--
ALTER TABLE `client_company`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT untuk tabel `contact`
--
ALTER TABLE `contact`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=63;

--
-- AUTO_INCREMENT untuk tabel `dashboard_activation`
--
ALTER TABLE `dashboard_activation`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `data_formal`
--
ALTER TABLE `data_formal`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=112;

--
-- AUTO_INCREMENT untuk tabel `data_formal_detail`
--
ALTER TABLE `data_formal_detail`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT untuk tabel `dtm_peristiwa`
--
ALTER TABLE `dtm_peristiwa`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT untuk tabel `gelar`
--
ALTER TABLE `gelar`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `institusi`
--
ALTER TABLE `institusi`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT untuk tabel `jabatan`
--
ALTER TABLE `jabatan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT untuk tabel `jenis_alamat`
--
ALTER TABLE `jenis_alamat`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT untuk tabel `jenis_gelar`
--
ALTER TABLE `jenis_gelar`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT untuk tabel `jenis_membership`
--
ALTER TABLE `jenis_membership`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT untuk tabel `kategorial`
--
ALTER TABLE `kategorial`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT untuk tabel `kategori_keanggotaan`
--
ALTER TABLE `kategori_keanggotaan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT untuk tabel `kategori_p2pk`
--
ALTER TABLE `kategori_p2pk`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT untuk tabel `keaktifan_pilihan`
--
ALTER TABLE `keaktifan_pilihan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT untuk tabel `kepanitiaan`
--
ALTER TABLE `kepanitiaan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `keys`
--
ALTER TABLE `keys`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `kode`
--
ALTER TABLE `kode`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT untuk tabel `komisi`
--
ALTER TABLE `komisi`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT untuk tabel `laporan_header`
--
ALTER TABLE `laporan_header`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `level`
--
ALTER TABLE `level`
  MODIFY `lev_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=127;

--
-- AUTO_INCREMENT untuk tabel `member`
--
ALTER TABLE `member`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `membership`
--
ALTER TABLE `membership`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=76;

--
-- AUTO_INCREMENT untuk tabel `membership_atasan`
--
ALTER TABLE `membership_atasan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=77;

--
-- AUTO_INCREMENT untuk tabel `menu`
--
ALTER TABLE `menu`
  MODIFY `menu_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=140;

--
-- AUTO_INCREMENT untuk tabel `module_activation`
--
ALTER TABLE `module_activation`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `notifikasi`
--
ALTER TABLE `notifikasi`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=179;

--
-- AUTO_INCREMENT untuk tabel `p2pk`
--
ALTER TABLE `p2pk`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `p2pk_planning`
--
ALTER TABLE `p2pk_planning`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `p2pk_planning_file`
--
ALTER TABLE `p2pk_planning_file`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `p2pk_proses_audit`
--
ALTER TABLE `p2pk_proses_audit`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `p2pk_proses_audit_file`
--
ALTER TABLE `p2pk_proses_audit_file`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `p2pk_report`
--
ALTER TABLE `p2pk_report`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `p2pk_report_detail`
--
ALTER TABLE `p2pk_report_detail`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=49;

--
-- AUTO_INCREMENT untuk tabel `partner`
--
ALTER TABLE `partner`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=64;

--
-- AUTO_INCREMENT untuk tabel `pengarah`
--
ALTER TABLE `pengarah`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT untuk tabel `pengaturan_aplikasi`
--
ALTER TABLE `pengaturan_aplikasi`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `posisi`
--
ALTER TABLE `posisi`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT untuk tabel `profesi`
--
ALTER TABLE `profesi`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `profile`
--
ALTER TABLE `profile`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=237;

--
-- AUTO_INCREMENT untuk tabel `profile_kategorial`
--
ALTER TABLE `profile_kategorial`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=46;

--
-- AUTO_INCREMENT untuk tabel `profile_keaktifan`
--
ALTER TABLE `profile_keaktifan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT untuk tabel `profile_keanggotaan`
--
ALTER TABLE `profile_keanggotaan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=65;

--
-- AUTO_INCREMENT untuk tabel `profile_wilayah`
--
ALTER TABLE `profile_wilayah`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=46;

--
-- AUTO_INCREMENT untuk tabel `repository`
--
ALTER TABLE `repository`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `resiko`
--
ALTER TABLE `resiko`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT untuk tabel `role_aplikasi`
--
ALTER TABLE `role_aplikasi`
  MODIFY `rola_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=283;

--
-- AUTO_INCREMENT untuk tabel `role_users`
--
ALTER TABLE `role_users`
  MODIFY `role_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=263;

--
-- AUTO_INCREMENT untuk tabel `spm`
--
ALTER TABLE `spm`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `template_download`
--
ALTER TABLE `template_download`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT untuk tabel `term_management`
--
ALTER TABLE `term_management`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;

--
-- AUTO_INCREMENT untuk tabel `tipe_contact`
--
ALTER TABLE `tipe_contact`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT untuk tabel `tokens`
--
ALTER TABLE `tokens`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=140;

--
-- AUTO_INCREMENT untuk tabel `trainer`
--
ALTER TABLE `trainer`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT untuk tabel `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=281;

--
-- AUTO_INCREMENT untuk tabel `version`
--
ALTER TABLE `version`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT untuk tabel `wilayah`
--
ALTER TABLE `wilayah`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `activity_log`
--
ALTER TABLE `activity_log`
  ADD CONSTRAINT `activity_log_ibfk_1` FOREIGN KEY (`by`) REFERENCES `users` (`user_id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `alamat`
--
ALTER TABLE `alamat`
  ADD CONSTRAINT `alamat_ibfk_1` FOREIGN KEY (`id_profile`) REFERENCES `profile` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `client_company`
--
ALTER TABLE `client_company`
  ADD CONSTRAINT `client_company_ibfk_1` FOREIGN KEY (`id_resiko`) REFERENCES `resiko` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `contact`
--
ALTER TABLE `contact`
  ADD CONSTRAINT `contact_ibfk_1` FOREIGN KEY (`id_profile`) REFERENCES `profile` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `data_formal`
--
ALTER TABLE `data_formal`
  ADD CONSTRAINT `data_formal_ibfk_1` FOREIGN KEY (`id_profile`) REFERENCES `profile` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `data_formal_ibfk_2` FOREIGN KEY (`dtm_peristiwa_id`) REFERENCES `dtm_peristiwa` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `gelar`
--
ALTER TABLE `gelar`
  ADD CONSTRAINT `gelar_ibfk_1` FOREIGN KEY (`id_profile`) REFERENCES `profile` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `jenis_membership`
--
ALTER TABLE `jenis_membership`
  ADD CONSTRAINT `jenis_membership_ibfk_1` FOREIGN KEY (`id_level`) REFERENCES `level` (`lev_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `keys`
--
ALTER TABLE `keys`
  ADD CONSTRAINT `keys_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `keys_ibfk_2` FOREIGN KEY (`level`) REFERENCES `level` (`lev_id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `membership`
--
ALTER TABLE `membership`
  ADD CONSTRAINT `membership_ibfk_2` FOREIGN KEY (`id_jenis_membership`) REFERENCES `jenis_membership` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `membership_ibfk_3` FOREIGN KEY (`id_profile`) REFERENCES `profile` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `profesi`
--
ALTER TABLE `profesi`
  ADD CONSTRAINT `profesi_ibfk_1` FOREIGN KEY (`id_profile`) REFERENCES `profile` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `profile`
--
ALTER TABLE `profile`
  ADD CONSTRAINT `profile_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `users` (`user_id`) ON DELETE SET NULL ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Waktu pembuatan: 26 Jul 2025 pada 03.49
-- Versi server: 10.11.10-MariaDB-log
-- Versi PHP: 7.2.34

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `u815447645_dbpresensigps`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `cabang`
--

CREATE TABLE `cabang` (
  `kode_cabang` char(10) NOT NULL,
  `nama_cabang` varchar(50) NOT NULL,
  `lokasi_cabang` varchar(255) NOT NULL,
  `radius_cabang` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data untuk tabel `cabang`
--

INSERT INTO `cabang` (`kode_cabang`, `nama_cabang`, `lokasi_cabang`, `radius_cabang`) VALUES
('BJM', 'CV BJM', '-6.222254304452199, 106.49528320337225', 10),
('HO', 'Head Office', '-6.222302518143477, 106.49626430703124', 50),
('ISM', 'PT ISM', '-6.2221476685390815, 106.49406104662667', 10),
('UBSI', 'BSI', '-6.18296799597487, 106.84293345418018', 50);

-- --------------------------------------------------------

--
-- Struktur dari tabel `departemen`
--

CREATE TABLE `departemen` (
  `kode_dept` char(3) NOT NULL,
  `nama_dept` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data untuk tabel `departemen`
--

INSERT INTO `departemen` (`kode_dept`, `nama_dept`) VALUES
('DON', 'Divisi Online'),
('HRD', 'Human Resource Development '),
('IT', 'Information Technology'),
('ITF', 'IT Planning & Infra Department'),
('KEU', 'Keuangan');

-- --------------------------------------------------------

--
-- Struktur dari tabel `harilibur`
--

CREATE TABLE `harilibur` (
  `kode_libur` char(7) NOT NULL,
  `tanggal_libur` date NOT NULL,
  `kode_cabang` char(10) NOT NULL,
  `keterangan` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data untuk tabel `harilibur`
--

INSERT INTO `harilibur` (`kode_libur`, `tanggal_libur`, `kode_cabang`, `keterangan`) VALUES
('LB25001', '2025-07-02', 'BJM', 'sdas');

-- --------------------------------------------------------

--
-- Struktur dari tabel `harilibur_detail`
--

CREATE TABLE `harilibur_detail` (
  `kode_libur` char(7) DEFAULT NULL,
  `nik` char(5) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data untuk tabel `harilibur_detail`
--

INSERT INTO `harilibur_detail` (`kode_libur`, `nik`) VALUES
('LB24002', '3636'),
('LB24002', '22-01'),
('LB24002', '99-99'),
('LB24002', '12349'),
('LB24003', '12345'),
('LB24003', '3636');

-- --------------------------------------------------------

--
-- Struktur dari tabel `jam_kerja`
--

CREATE TABLE `jam_kerja` (
  `kode_jam_kerja` char(4) NOT NULL,
  `nama_jam_kerja` varchar(15) NOT NULL,
  `awal_jam_masuk` time NOT NULL,
  `jam_masuk` time NOT NULL,
  `akhir_jam_masuk` time NOT NULL,
  `awal_jam_istirahat` time DEFAULT NULL,
  `akhir_jam_istirahat` time DEFAULT NULL,
  `status_istirahat` char(1) DEFAULT NULL,
  `jam_pulang` time NOT NULL,
  `total_jam` smallint(6) NOT NULL,
  `lintashari` char(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data untuk tabel `jam_kerja`
--

INSERT INTO `jam_kerja` (`kode_jam_kerja`, `nama_jam_kerja`, `awal_jam_masuk`, `jam_masuk`, `akhir_jam_masuk`, `awal_jam_istirahat`, `akhir_jam_istirahat`, `status_istirahat`, `jam_pulang`, `total_jam`, `lintashari`) VALUES
('JK01', 'NON SHIFT', '08:00:00', '09:00:00', '09:30:00', '12:00:00', '13:00:00', '1', '16:00:00', 6, '1'),
('JK02', 'NON SHIFT SABTU', '05:00:00', '07:00:00', '08:00:00', NULL, NULL, '0', '12:00:00', 5, '0'),
('JK03', 'SHIFT 2', '14:00:00', '15:00:00', '15:35:00', NULL, NULL, '0', '15:36:00', 1, '0'),
('JK04', 'SHIFT MALAM', '18:00:00', '20:15:00', '20:16:00', NULL, NULL, '0', '20:17:00', 1, '0'),
('JK05', 'WFH', '20:22:00', '20:30:00', '20:32:00', NULL, NULL, '0', '20:33:00', 1, '0'),
('JK06', 'WFH2', '05:00:00', '06:30:00', '06:42:00', NULL, NULL, '0', '06:44:00', 1, '0'),
('JK07', 'WFH1', '20:50:00', '20:55:00', '20:56:00', NULL, NULL, '0', '20:57:00', 1, '0'),
('tes', 'tes', '00:45:00', '00:46:00', '00:47:00', NULL, NULL, '0', '00:48:00', 1, '0');

-- --------------------------------------------------------

--
-- Struktur dari tabel `karyawan`
--

CREATE TABLE `karyawan` (
  `nik` char(18) NOT NULL DEFAULT '0',
  `nama_lengkap` varchar(100) NOT NULL,
  `jabatan` varchar(50) NOT NULL,
  `no_hp` varchar(13) NOT NULL,
  `foto` varchar(30) DEFAULT NULL,
  `kode_dept` char(3) NOT NULL,
  `kode_cabang` char(10) DEFAULT NULL,
  `status_location` char(1) NOT NULL DEFAULT '1',
  `status_jam_kerja` char(1) NOT NULL DEFAULT '1',
  `password` varchar(255) NOT NULL,
  `remember_token` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data untuk tabel `karyawan`
--

INSERT INTO `karyawan` (`nik`, `nama_lengkap`, `jabatan`, `no_hp`, `foto`, `kode_dept`, `kode_cabang`, `status_location`, `status_jam_kerja`, `password`, `remember_token`) VALUES
('00', 'RONI HIDAYAT', 'IT', '123', '00.jpg', 'ITF', 'HO', '0', '1', '$2y$10$zz3ythqhrs5YpIQ.yiEF1uymq4RurbnZqG3taMt7.qD64JCc8ssWq', NULL),
('10', 'Adi Dermawan', 'IT', '02816548216', NULL, 'IT', 'BJM', '0', '0', '$2y$10$lLDMOMAFEIW1xp8fJud6X./DdaVSgTYeEvr6XSgFYCUl.cIonFAGK', NULL),
('11', 'Roni Hidayat', 'Magang', '123', '11.jpg', 'HRD', 'HO', '1', '0', '$2y$10$xXNLsAkytOGbal5hU00re.AGaGZWgeLCymyXoVoeYgH87LIWJwu1i', NULL),
('123', 'Joni', 'ISM Student Program', '282331747706', '123.png', 'HRD', 'ISM', '0', '0', '$2y$10$IAVXYVJGrYyOwuyEPOsbSeG7qtihtNcy/FCUCnokpspuYu6cZEJ3O', NULL),
('1234', 'Doni', 'IT Support', '282331747706', '1234.png', 'ITF', 'BJM', '1', '0', '$2y$10$2BWKj6Fc/LtTk4P.M1lLI.b1LEI2Iemt6kb/20/VRQmrfziCyiM/u', NULL),
('12345', 'Oniel', 'ISM Student Program', '0123456789', '12345.jpg', 'IT', 'ISM', '0', '0', '$2y$10$uN1yt57tmaExi79PvJt70.MxfIHYhUuDHzPAAYzQ1NXrgSzgEfa/6', NULL),
('1234567', 'Roni', 'Admin', '0123789', NULL, 'ITF', 'ISM', '0', '0', '$2y$10$3JpD3mV.J8Bq35jfO1z0A.DjKSH5c8wD4UgvyFh2msSdZKZKswKDm', NULL),
('17210696', 'Roni Hidayat', 'Student Program', '082123378323', '17210696.jpg', 'ITF', 'ISM', '0', '1', '$2y$10$m3XX3.xOUG6Z4CMGlvIyVeGHHYDatTwjPyunvFj5AzhpbrvZLZdYm', NULL),
('64211962', 'Nabila Cita Suci', 'Student Program', '02816548216', '64211962.jpg', 'HRD', 'BJM', '1', '1', '$2y$10$AyZ1McExqCJxlUiLBMAQm.EddfCuMtBt2SxSGbSLAUKv23FFwEsdG', NULL);

-- --------------------------------------------------------

--
-- Struktur dari tabel `konfigurasi_jamkerja`
--

CREATE TABLE `konfigurasi_jamkerja` (
  `nik` char(18) DEFAULT NULL,
  `hari` varchar(10) DEFAULT NULL,
  `kode_jam_kerja` char(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data untuk tabel `konfigurasi_jamkerja`
--

INSERT INTO `konfigurasi_jamkerja` (`nik`, `hari`, `kode_jam_kerja`) VALUES
('17210696', 'Senin', 'tes'),
('17210696', 'Selasa', 'tes'),
('17210696', 'Rabu', 'tes'),
('17210696', 'Kamis', 'tes'),
('17210696', 'Jumat', 'tes'),
('17210696', 'Sabtu', 'tes'),
('17210696', 'Minggu', 'tes'),
('12345', 'Senin', 'JK05'),
('12345', 'Selasa', 'JK05'),
('12345', 'Rabu', 'JK05'),
('12345', 'Kamis', 'JK05'),
('12345', 'Jumat', 'JK05'),
('12345', 'Sabtu', 'JK05'),
('12345', 'Minggu', NULL),
('00', 'Senin', 'JK05'),
('00', 'Selasa', 'JK05'),
('00', 'Rabu', 'JK05'),
('00', 'Kamis', 'JK05'),
('00', 'Jumat', 'JK05'),
('00', 'Sabtu', 'JK02'),
('00', 'Minggu', NULL),
('1234', 'Senin', 'JK07'),
('1234', 'Selasa', 'JK07'),
('1234', 'Rabu', 'JK07'),
('1234', 'Kamis', 'JK07'),
('1234', 'Jumat', 'JK05'),
('1234', 'Sabtu', 'JK05'),
('1234', 'Minggu', NULL),
('123', 'Senin', 'JK07'),
('123', 'Selasa', 'JK07'),
('123', 'Rabu', 'JK07'),
('123', 'Kamis', 'JK07'),
('123', 'Jumat', 'JK07'),
('123', 'Sabtu', 'JK07'),
('123', 'Minggu', NULL),
('10', 'Senin', 'JK07'),
('10', 'Selasa', 'JK07'),
('10', 'Rabu', 'JK07'),
('10', 'Kamis', 'JK07'),
('10', 'Jumat', 'JK07'),
('10', 'Sabtu', 'JK07'),
('10', 'Minggu', 'tes'),
('11', 'Senin', 'JK07'),
('11', 'Selasa', 'JK07'),
('11', 'Rabu', 'JK07'),
('11', 'Kamis', NULL),
('11', 'Jumat', NULL),
('11', 'Sabtu', NULL),
('11', 'Minggu', NULL),
('1234567', 'Senin', 'JK05'),
('1234567', 'Selasa', 'JK05'),
('1234567', 'Rabu', 'JK05'),
('1234567', 'Kamis', 'JK05'),
('1234567', 'Jumat', 'JK05'),
('1234567', 'Sabtu', NULL),
('1234567', 'Minggu', NULL);

-- --------------------------------------------------------

--
-- Struktur dari tabel `konfigurasi_jamkerja_by_date`
--

CREATE TABLE `konfigurasi_jamkerja_by_date` (
  `nik` char(18) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `tanggal` date DEFAULT NULL,
  `kode_jam_kerja` char(4) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Struktur dari tabel `konfigurasi_jk_dept`
--

CREATE TABLE `konfigurasi_jk_dept` (
  `kode_jk_dept` char(14) NOT NULL,
  `kode_cabang` char(10) DEFAULT NULL,
  `kode_dept` char(3) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data untuk tabel `konfigurasi_jk_dept`
--

INSERT INTO `konfigurasi_jk_dept` (`kode_jk_dept`, `kode_cabang`, `kode_dept`) VALUES
('JBJMIT', 'BJM', 'IT'),
('JISMHRD', 'ISM', 'HRD');

-- --------------------------------------------------------

--
-- Struktur dari tabel `konfigurasi_jk_dept_detail`
--

CREATE TABLE `konfigurasi_jk_dept_detail` (
  `kode_jk_dept` char(14) DEFAULT NULL,
  `hari` varchar(10) DEFAULT NULL,
  `kode_jam_kerja` char(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data untuk tabel `konfigurasi_jk_dept_detail`
--

INSERT INTO `konfigurasi_jk_dept_detail` (`kode_jk_dept`, `hari`, `kode_jam_kerja`) VALUES
('JISMHRD', 'Senin', 'JK01'),
('JISMHRD', 'Selasa', 'JK01'),
('JISMHRD', 'Rabu', 'JK01'),
('JISMHRD', 'Kamis', 'JK01'),
('JISMHRD', 'Jumat', 'JK01'),
('JISMHRD', 'Sabtu', 'JK01'),
('JBJMIT', 'Senin', 'JK01'),
('JBJMIT', 'Selasa', 'JK01'),
('JBJMIT', 'Rabu', 'JK01'),
('JBJMIT', 'Kamis', 'JK01'),
('JBJMIT', 'Jumat', 'JK05'),
('JBJMIT', 'Sabtu', 'JK05');

-- --------------------------------------------------------

--
-- Struktur dari tabel `master_cuti`
--

CREATE TABLE `master_cuti` (
  `kode_cuti` char(3) NOT NULL,
  `nama_cuti` varchar(30) DEFAULT NULL,
  `jml_hari` smallint(6) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data untuk tabel `master_cuti`
--

INSERT INTO `master_cuti` (`kode_cuti`, `nama_cuti`, `jml_hari`) VALUES
('C01', 'Tahunan', 12),
('C02', 'Cuti Melahirkan', 90),
('C04', 'Cuti Menikah', 2),
('CT6', 'Cuti Sakit', 7);

-- --------------------------------------------------------

--
-- Struktur dari tabel `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data untuk tabel `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_100000_create_password_resets_table', 1),
(2, '2019_08_19_000000_create_failed_jobs_table', 1),
(3, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(4, '2023_12_14_233749_create_permission_tables', 1),
(5, '2023_12_15_002819_create_permission_tables', 2);

-- --------------------------------------------------------

--
-- Struktur dari tabel `model_has_permissions`
--

CREATE TABLE `model_has_permissions` (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `model_type` varchar(255) NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Struktur dari tabel `model_has_roles`
--

CREATE TABLE `model_has_roles` (
  `role_id` bigint(20) UNSIGNED NOT NULL,
  `model_type` varchar(255) NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data untuk tabel `model_has_roles`
--

INSERT INTO `model_has_roles` (`role_id`, `model_type`, `model_id`) VALUES
(1, 'App\\Models\\User', 9),
(1, 'App\\Models\\User', 13),
(1, 'App\\Models\\User', 15),
(2, 'App\\Models\\User', 8),
(2, 'App\\Models\\User', 10),
(2, 'App\\Models\\User', 12),
(2, 'App\\Models\\User', 14);

-- --------------------------------------------------------

--
-- Struktur dari tabel `pengajuan_izin`
--

CREATE TABLE `pengajuan_izin` (
  `kode_izin` char(9) NOT NULL,
  `nik` char(18) DEFAULT NULL,
  `tgl_izin_dari` date DEFAULT NULL,
  `tgl_izin_sampai` date DEFAULT NULL,
  `status` char(1) DEFAULT NULL COMMENT 'i : izin s : sakit',
  `kode_cuti` char(3) DEFAULT NULL,
  `keterangan` varchar(255) DEFAULT NULL,
  `doc_sid` varchar(255) DEFAULT NULL,
  `status_approved` char(1) DEFAULT '0' COMMENT '0 : Pending 1: Disetuji 2: Ditolak'
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data untuk tabel `pengajuan_izin`
--

INSERT INTO `pengajuan_izin` (`kode_izin`, `nik`, `tgl_izin_dari`, `tgl_izin_sampai`, `status`, `kode_cuti`, `keterangan`, `doc_sid`, `status_approved`) VALUES
('IZ0125005', '64211962', '2025-01-06', '2025-01-06', 'i', NULL, 'Bimbingan laporan magang', NULL, '0'),
('IZ0226001', '11', '2026-02-01', '2026-02-12', 'c', 'C01', 'Menemani Istri Melahirkan', NULL, '1'),
('IZ0725001', '17210696', '2025-07-24', '2025-07-31', 'c', 'C01', 'Acara Keluarga', NULL, '0');

-- --------------------------------------------------------

--
-- Struktur dari tabel `permissions`
--

CREATE TABLE `permissions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `guard_name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data untuk tabel `permissions`
--

INSERT INTO `permissions` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
(1, 'view-karyawan', 'web', '2023-12-15 00:36:28', '2023-12-15 00:36:28'),
(2, 'view-departemen', 'web', '2023-12-15 00:36:28', '2023-12-15 00:36:28');

-- --------------------------------------------------------

--
-- Struktur dari tabel `presensi`
--

CREATE TABLE `presensi` (
  `id` int(11) NOT NULL,
  `nik` char(18) NOT NULL,
  `tgl_presensi` date NOT NULL,
  `jam_in` time DEFAULT NULL,
  `jam_out` time DEFAULT NULL,
  `foto_in` varchar(255) DEFAULT NULL,
  `foto_out` varchar(255) DEFAULT NULL,
  `lokasi_in` text DEFAULT NULL,
  `lokasi_out` text DEFAULT NULL,
  `kode_jam_kerja` char(4) DEFAULT NULL,
  `status` char(1) DEFAULT NULL,
  `kode_izin` char(9) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data untuk tabel `presensi`
--

INSERT INTO `presensi` (`id`, `nik`, `tgl_presensi`, `jam_in`, `jam_out`, `foto_in`, `foto_out`, `lokasi_in`, `lokasi_out`, `kode_jam_kerja`, `status`, `kode_izin`) VALUES
(44, '17210696', '2025-01-04', '18:02:52', NULL, '17210696-2025-01-04-in.png', NULL, '-6.2974498,106.8078791', NULL, 'tes', 'h', NULL),
(52, '17210696', '2025-01-06', '02:43:01', '06:41:59', '17210696-2025-01-06-in.png', '17210696-2025-01-06-out.png', '-6.3832064,106.807296', '-6.3832064,106.807296', 'JK05', 'h', NULL),
(58, '123', '2025-01-06', '05:37:28', '06:45:33', '123-2025-01-06-in.png', '123-2025-01-06-out.png', '-6.3832064,106.807296', '-6.3832064,106.807296', 'JK06', 'h', NULL),
(59, '1234', '2025-01-06', '06:27:36', NULL, '1234-2025-01-06-in.png', NULL, '-6.3832064,106.807296', NULL, 'JK07', 'h', NULL),
(60, '17210696', '2025-06-23', '09:01:24', NULL, '17210696-2025-06-23-in.png', NULL, '-6.2222699,106.4961921', NULL, 'JK01', 'h', NULL),
(61, '17210696', '2025-06-24', '09:03:30', NULL, '17210696-2025-06-24-in.png', NULL, '-6.222303,106.4961707', NULL, 'JK01', 'h', NULL),
(62, '12345', '2025-06-24', '20:29:27', NULL, '12345-2025-06-24-in.png', NULL, '-6.2160896,106.8269568', NULL, 'tes', 'h', NULL),
(63, '12345', '2025-06-28', '02:33:33', '02:40:43', '12345-2025-06-28-in.png', '12345-2025-06-28-out.png', '-6.222329,106.496262', '-6.222329,106.496262', 'tes', 'h', NULL),
(64, '123', '2025-06-28', '15:15:28', NULL, '123-2025-06-28-in.png', NULL, '-4.5136674,119.950926', NULL, 'JK03', 'h', NULL),
(65, '17210696', '2025-07-01', '15:14:17', '15:36:10', '17210696-2025-07-01-in.png', '17210696-2025-07-01-out.png', '-6.2223455,106.4962112', '-6.2223438,106.4961694', 'JK03', 'h', NULL),
(66, '1234', '2025-07-01', '15:20:39', '15:23:37', '1234-2025-07-01-in.png', '1234-2025-07-01-out.png', '-6.2223455,106.4962112', '-6.2223658,106.4961849', 'tes', 'h', NULL),
(67, '123', '2025-07-01', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'a', NULL),
(68, '10', '2025-07-01', '23:50:59', NULL, '10-2025-07-01-in.png', NULL, '-6.222329,106.496262', NULL, 'tes', 'h', NULL),
(69, '00', '2025-07-02', '00:45:51', '00:49:03', '00-2025-07-02-in.png', '00-2025-07-02-out.png', '-6.2224154,106.4961975', '-6.2224154,106.4961975', 'tes', 'h', NULL),
(70, '12345', '2025-07-02', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'a', NULL),
(71, '1234', '2025-07-14', '09:27:36', '16:30:00', NULL, NULL, NULL, NULL, 'JK05', 'h', NULL),
(72, '123', '2025-07-14', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'a', NULL),
(73, '12345', '2025-07-14', '09:00:00', '16:30:00', NULL, NULL, NULL, NULL, 'JK02', 'h', NULL),
(74, '17210696', '2025-07-14', '19:17:27', '19:41:35', '17210696-2025-07-14-in.png', '17210696-2025-07-14-out.png', '-6.1287,106.8323', '-6.2222906,106.4962493', 'JK04', 'h', NULL),
(75, '00', '2025-07-14', '20:26:07', '20:28:11', '00-2025-07-14-in.png', '00-2025-07-14-out.png', '-6.222362616133059,106.49626232951923', '-6.222362616133059,106.49626232951923', 'JK05', 'h', NULL),
(84, '10', '2025-07-14', '20:40:06', NULL, '10-2025-07-14-in.png', NULL, '-6.222362616133059,106.49626232951923', NULL, 'JK07', 'h', NULL),
(85, '11', '2026-02-01', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'c', 'IZ0226001'),
(86, '11', '2026-02-02', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'c', 'IZ0226001'),
(87, '11', '2026-02-03', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'c', 'IZ0226001'),
(88, '11', '2026-02-04', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'c', 'IZ0226001'),
(89, '11', '2026-02-05', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'c', 'IZ0226001'),
(90, '11', '2026-02-06', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'c', 'IZ0226001'),
(91, '11', '2026-02-07', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'c', 'IZ0226001'),
(92, '11', '2026-02-08', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'c', 'IZ0226001'),
(93, '11', '2026-02-09', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'c', 'IZ0226001'),
(94, '11', '2026-02-10', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'c', 'IZ0226001'),
(95, '11', '2026-02-11', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'c', 'IZ0226001'),
(96, '11', '2026-02-12', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'c', 'IZ0226001');

-- --------------------------------------------------------

--
-- Stand-in struktur untuk tampilan `q_rekappresensi`
-- (Lihat di bawah untuk tampilan aktual)
--
CREATE TABLE `q_rekappresensi` (
`nik` char(18)
,`nama_lengkap` varchar(100)
,`jabatan` varchar(50)
,`tgl_1` varchar(329)
,`tgl_2` varchar(329)
,`tgl_3` varchar(329)
,`tgl_4` varchar(329)
,`tgl_5` varchar(329)
,`tgl_6` varchar(329)
,`tgl_7` varchar(329)
,`tgl_8` varchar(329)
,`tgl_9` varchar(329)
,`tgl_10` varchar(329)
,`tgl_11` varchar(329)
,`tgl_12` varchar(329)
,`tgl_13` varchar(329)
,`tgl_14` varchar(329)
,`tgl_15` varchar(329)
,`tgl_16` varchar(329)
,`tgl_17` varchar(329)
,`tgl_18` varchar(329)
,`tgl_19` varchar(329)
,`tgl_20` varchar(329)
,`tgl_21` varchar(329)
,`tgl_22` varchar(329)
,`tgl_23` varchar(329)
,`tgl_24` varchar(329)
,`tgl_25` varchar(329)
,`tgl_26` varchar(329)
,`tgl_27` varchar(329)
,`tgl_28` varchar(329)
,`tgl_29` varchar(329)
,`tgl_30` varchar(329)
,`tgl_31` varchar(329)
);

-- --------------------------------------------------------

--
-- Struktur dari tabel `roles`
--

CREATE TABLE `roles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `guard_name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data untuk tabel `roles`
--

INSERT INTO `roles` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
(1, 'administrator', 'web', '2023-12-15 00:36:28', '2023-12-15 00:36:28'),
(2, 'admin departemen', 'web', '2023-12-18 00:22:14', '2023-12-18 00:22:14');

-- --------------------------------------------------------

--
-- Struktur dari tabel `role_has_permissions`
--

CREATE TABLE `role_has_permissions` (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data untuk tabel `role_has_permissions`
--

INSERT INTO `role_has_permissions` (`permission_id`, `role_id`) VALUES
(1, 1),
(2, 1);

-- --------------------------------------------------------

--
-- Struktur dari tabel `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `kode_dept` char(3) DEFAULT NULL,
  `kode_cabang` char(10) DEFAULT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data untuk tabel `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `kode_dept`, `kode_cabang`, `remember_token`, `created_at`, `updated_at`) VALUES
(8, 'Maman', 'maman@gmail.com', NULL, '$2y$10$frkrI4UX/Zu1xwAV3xUYg.k194b/IFwkVXOWbaa5X/Bo0/g8Kr5cG', 'KEU', 'BJM', NULL, '2023-12-18 22:43:16', '2023-12-18 22:43:16'),
(9, 'Adam Adifa', 'adam@gmail.com', NULL, '$2y$10$ZvP4UKkMT2inx95Qn.5N8.LI6blO.Y8ySjk8nAtR6SgfhK2QOE/NS', 'IT', 'HO', NULL, '2023-12-18 22:45:36', '2023-12-18 22:45:36'),
(10, 'Fitriani', 'fitriani@gmail.com', NULL, '$2y$10$zszaYK0WLPcOt65xQZ71YeehDIfs5r6YU25v3K33zlsSIEZVED9kC', 'HRD', 'BJM', NULL, '2023-12-22 10:48:45', '2023-12-22 10:48:45'),
(12, 'Qiana', 'qiana@gmail.com', NULL, '$2y$10$LEvkOcCpPrLqI2lYa8WrnOZBp0vyaDGLGv9.3xlI2I0lE2/C6p1qy', 'KEU', 'ISM', NULL, '2023-12-22 10:53:17', '2023-12-22 10:53:17'),
(13, 'Admin', 'admin@gmail.com', NULL, '$2y$10$UUmPWkullF/R33.q9b8HXenEVgjD8D3rxoLJn46A3IXIMUvgTuiNW', 'ITF', 'ISM', NULL, '2025-01-01 21:49:26', '2025-01-01 21:49:26'),
(14, 'Roni Hidayat', 'ronihidayat@gmail.com', NULL, '$2y$10$lGvEaANx8wEsZhe.HK9zkeyfdaHLrVxASZPBnioWcfUN8ZsvrJwL2', 'ITF', 'BJM', NULL, '2025-01-06 03:12:47', '2025-01-06 03:12:47'),
(15, 'Ardian Dwi Praba, M.Kom', 'ddw@gmail.com', NULL, '$2y$10$2rJFW5cdLKDHN7a8ZUwuHeyaA8DphF5MwWZ.cxIqTRkyHB3PNvNgK', 'ITF', 'HO', NULL, '2025-07-01 11:27:08', '2025-07-01 11:27:08');

-- --------------------------------------------------------

--
-- Struktur untuk view `q_rekappresensi`
--
DROP TABLE IF EXISTS `q_rekappresensi`;

CREATE ALGORITHM=UNDEFINED DEFINER=`u815447645_root`@`127.0.0.1` SQL SECURITY DEFINER VIEW `q_rekappresensi`  AS SELECT `karyawan`.`nik` AS `nik`, `karyawan`.`nama_lengkap` AS `nama_lengkap`, `karyawan`.`jabatan` AS `jabatan`, `presensi`.`tgl_1` AS `tgl_1`, `presensi`.`tgl_2` AS `tgl_2`, `presensi`.`tgl_3` AS `tgl_3`, `presensi`.`tgl_4` AS `tgl_4`, `presensi`.`tgl_5` AS `tgl_5`, `presensi`.`tgl_6` AS `tgl_6`, `presensi`.`tgl_7` AS `tgl_7`, `presensi`.`tgl_8` AS `tgl_8`, `presensi`.`tgl_9` AS `tgl_9`, `presensi`.`tgl_10` AS `tgl_10`, `presensi`.`tgl_11` AS `tgl_11`, `presensi`.`tgl_12` AS `tgl_12`, `presensi`.`tgl_13` AS `tgl_13`, `presensi`.`tgl_14` AS `tgl_14`, `presensi`.`tgl_15` AS `tgl_15`, `presensi`.`tgl_16` AS `tgl_16`, `presensi`.`tgl_17` AS `tgl_17`, `presensi`.`tgl_18` AS `tgl_18`, `presensi`.`tgl_19` AS `tgl_19`, `presensi`.`tgl_20` AS `tgl_20`, `presensi`.`tgl_21` AS `tgl_21`, `presensi`.`tgl_22` AS `tgl_22`, `presensi`.`tgl_23` AS `tgl_23`, `presensi`.`tgl_24` AS `tgl_24`, `presensi`.`tgl_25` AS `tgl_25`, `presensi`.`tgl_26` AS `tgl_26`, `presensi`.`tgl_27` AS `tgl_27`, `presensi`.`tgl_28` AS `tgl_28`, `presensi`.`tgl_29` AS `tgl_29`, `presensi`.`tgl_30` AS `tgl_30`, `presensi`.`tgl_31` AS `tgl_31` FROM (`karyawan` left join (select `presensi`.`nik` AS `nik`,max(if(`presensi`.`tgl_presensi` = '2023-11-01',concat(convert(ifnull(`presensi`.`jam_in`,'NA') using latin1),'|',convert(ifnull(`presensi`.`jam_out`,'NA') using latin1),'|',ifnull(`presensi`.`status`,'NA'),'|',ifnull(`jam_kerja`.`nama_jam_kerja`,'NA'),'|',convert(ifnull(`jam_kerja`.`jam_masuk`,'NA') using latin1),'|',convert(ifnull(`jam_kerja`.`jam_pulang`,'NA') using latin1),'|',ifnull(`presensi`.`kode_izin`,'NA'),'|',ifnull(`pengajuan_izin`.`keterangan`,'NA'),'|'),NULL)) AS `tgl_1`,max(if(`presensi`.`tgl_presensi` = '2023-11-02',concat(convert(ifnull(`presensi`.`jam_in`,'NA') using latin1),'|',convert(ifnull(`presensi`.`jam_out`,'NA') using latin1),'|',ifnull(`presensi`.`status`,'NA'),'|',ifnull(`jam_kerja`.`nama_jam_kerja`,'NA'),'|',convert(ifnull(`jam_kerja`.`jam_masuk`,'NA') using latin1),'|',convert(ifnull(`jam_kerja`.`jam_pulang`,'NA') using latin1),'|',ifnull(`presensi`.`kode_izin`,'NA'),'|',ifnull(`pengajuan_izin`.`keterangan`,'NA'),'|'),NULL)) AS `tgl_2`,max(if(`presensi`.`tgl_presensi` = '2023-11-03',concat(convert(ifnull(`presensi`.`jam_in`,'NA') using latin1),'|',convert(ifnull(`presensi`.`jam_out`,'NA') using latin1),'|',ifnull(`presensi`.`status`,'NA'),'|',ifnull(`jam_kerja`.`nama_jam_kerja`,'NA'),'|',convert(ifnull(`jam_kerja`.`jam_masuk`,'NA') using latin1),'|',convert(ifnull(`jam_kerja`.`jam_pulang`,'NA') using latin1),'|',ifnull(`presensi`.`kode_izin`,'NA'),'|',ifnull(`pengajuan_izin`.`keterangan`,'NA'),'|'),NULL)) AS `tgl_3`,max(if(`presensi`.`tgl_presensi` = '2023-11-04',concat(convert(ifnull(`presensi`.`jam_in`,'NA') using latin1),'|',convert(ifnull(`presensi`.`jam_out`,'NA') using latin1),'|',ifnull(`presensi`.`status`,'NA'),'|',ifnull(`jam_kerja`.`nama_jam_kerja`,'NA'),'|',convert(ifnull(`jam_kerja`.`jam_masuk`,'NA') using latin1),'|',convert(ifnull(`jam_kerja`.`jam_pulang`,'NA') using latin1),'|',ifnull(`presensi`.`kode_izin`,'NA'),'|',ifnull(`pengajuan_izin`.`keterangan`,'NA'),'|'),NULL)) AS `tgl_4`,max(if(`presensi`.`tgl_presensi` = '2023-11-05',concat(convert(ifnull(`presensi`.`jam_in`,'NA') using latin1),'|',convert(ifnull(`presensi`.`jam_out`,'NA') using latin1),'|',ifnull(`presensi`.`status`,'NA'),'|',ifnull(`jam_kerja`.`nama_jam_kerja`,'NA'),'|',convert(ifnull(`jam_kerja`.`jam_masuk`,'NA') using latin1),'|',convert(ifnull(`jam_kerja`.`jam_pulang`,'NA') using latin1),'|',ifnull(`presensi`.`kode_izin`,'NA'),'|',ifnull(`pengajuan_izin`.`keterangan`,'NA'),'|'),NULL)) AS `tgl_5`,max(if(`presensi`.`tgl_presensi` = '2023-11-06',concat(convert(ifnull(`presensi`.`jam_in`,'NA') using latin1),'|',convert(ifnull(`presensi`.`jam_out`,'NA') using latin1),'|',ifnull(`presensi`.`status`,'NA'),'|',ifnull(`jam_kerja`.`nama_jam_kerja`,'NA'),'|',convert(ifnull(`jam_kerja`.`jam_masuk`,'NA') using latin1),'|',convert(ifnull(`jam_kerja`.`jam_pulang`,'NA') using latin1),'|',ifnull(`presensi`.`kode_izin`,'NA'),'|',ifnull(`pengajuan_izin`.`keterangan`,'NA'),'|'),NULL)) AS `tgl_6`,max(if(`presensi`.`tgl_presensi` = '2023-11-07',concat(convert(ifnull(`presensi`.`jam_in`,'NA') using latin1),'|',convert(ifnull(`presensi`.`jam_out`,'NA') using latin1),'|',ifnull(`presensi`.`status`,'NA'),'|',ifnull(`jam_kerja`.`nama_jam_kerja`,'NA'),'|',convert(ifnull(`jam_kerja`.`jam_masuk`,'NA') using latin1),'|',convert(ifnull(`jam_kerja`.`jam_pulang`,'NA') using latin1),'|',ifnull(`presensi`.`kode_izin`,'NA'),'|',ifnull(`pengajuan_izin`.`keterangan`,'NA'),'|'),NULL)) AS `tgl_7`,max(if(`presensi`.`tgl_presensi` = '2023-11-08',concat(convert(ifnull(`presensi`.`jam_in`,'NA') using latin1),'|',convert(ifnull(`presensi`.`jam_out`,'NA') using latin1),'|',ifnull(`presensi`.`status`,'NA'),'|',ifnull(`jam_kerja`.`nama_jam_kerja`,'NA'),'|',convert(ifnull(`jam_kerja`.`jam_masuk`,'NA') using latin1),'|',convert(ifnull(`jam_kerja`.`jam_pulang`,'NA') using latin1),'|',ifnull(`presensi`.`kode_izin`,'NA'),'|',ifnull(`pengajuan_izin`.`keterangan`,'NA'),'|'),NULL)) AS `tgl_8`,max(if(`presensi`.`tgl_presensi` = '2023-11-09',concat(convert(ifnull(`presensi`.`jam_in`,'NA') using latin1),'|',convert(ifnull(`presensi`.`jam_out`,'NA') using latin1),'|',ifnull(`presensi`.`status`,'NA'),'|',ifnull(`jam_kerja`.`nama_jam_kerja`,'NA'),'|',convert(ifnull(`jam_kerja`.`jam_masuk`,'NA') using latin1),'|',convert(ifnull(`jam_kerja`.`jam_pulang`,'NA') using latin1),'|',ifnull(`presensi`.`kode_izin`,'NA'),'|',ifnull(`pengajuan_izin`.`keterangan`,'NA'),'|'),NULL)) AS `tgl_9`,max(if(`presensi`.`tgl_presensi` = '2023-11-10',concat(convert(ifnull(`presensi`.`jam_in`,'NA') using latin1),'|',convert(ifnull(`presensi`.`jam_out`,'NA') using latin1),'|',ifnull(`presensi`.`status`,'NA'),'|',ifnull(`jam_kerja`.`nama_jam_kerja`,'NA'),'|',convert(ifnull(`jam_kerja`.`jam_masuk`,'NA') using latin1),'|',convert(ifnull(`jam_kerja`.`jam_pulang`,'NA') using latin1),'|',ifnull(`presensi`.`kode_izin`,'NA'),'|',ifnull(`pengajuan_izin`.`keterangan`,'NA'),'|'),NULL)) AS `tgl_10`,max(if(`presensi`.`tgl_presensi` = '2023-11-11',concat(convert(ifnull(`presensi`.`jam_in`,'NA') using latin1),'|',convert(ifnull(`presensi`.`jam_out`,'NA') using latin1),'|',ifnull(`presensi`.`status`,'NA'),'|',ifnull(`jam_kerja`.`nama_jam_kerja`,'NA'),'|',convert(ifnull(`jam_kerja`.`jam_masuk`,'NA') using latin1),'|',convert(ifnull(`jam_kerja`.`jam_pulang`,'NA') using latin1),'|',ifnull(`presensi`.`kode_izin`,'NA'),'|',ifnull(`pengajuan_izin`.`keterangan`,'NA'),'|'),NULL)) AS `tgl_11`,max(if(`presensi`.`tgl_presensi` = '2023-11-12',concat(convert(ifnull(`presensi`.`jam_in`,'NA') using latin1),'|',convert(ifnull(`presensi`.`jam_out`,'NA') using latin1),'|',ifnull(`presensi`.`status`,'NA'),'|',ifnull(`jam_kerja`.`nama_jam_kerja`,'NA'),'|',convert(ifnull(`jam_kerja`.`jam_masuk`,'NA') using latin1),'|',convert(ifnull(`jam_kerja`.`jam_pulang`,'NA') using latin1),'|',ifnull(`presensi`.`kode_izin`,'NA'),'|',ifnull(`pengajuan_izin`.`keterangan`,'NA'),'|'),NULL)) AS `tgl_12`,max(if(`presensi`.`tgl_presensi` = '2023-11-13',concat(convert(ifnull(`presensi`.`jam_in`,'NA') using latin1),'|',convert(ifnull(`presensi`.`jam_out`,'NA') using latin1),'|',ifnull(`presensi`.`status`,'NA'),'|',ifnull(`jam_kerja`.`nama_jam_kerja`,'NA'),'|',convert(ifnull(`jam_kerja`.`jam_masuk`,'NA') using latin1),'|',convert(ifnull(`jam_kerja`.`jam_pulang`,'NA') using latin1),'|',ifnull(`presensi`.`kode_izin`,'NA'),'|',ifnull(`pengajuan_izin`.`keterangan`,'NA'),'|'),NULL)) AS `tgl_13`,max(if(`presensi`.`tgl_presensi` = '2023-11-14',concat(convert(ifnull(`presensi`.`jam_in`,'NA') using latin1),'|',convert(ifnull(`presensi`.`jam_out`,'NA') using latin1),'|',ifnull(`presensi`.`status`,'NA'),'|',ifnull(`jam_kerja`.`nama_jam_kerja`,'NA'),'|',convert(ifnull(`jam_kerja`.`jam_masuk`,'NA') using latin1),'|',convert(ifnull(`jam_kerja`.`jam_pulang`,'NA') using latin1),'|',ifnull(`presensi`.`kode_izin`,'NA'),'|',ifnull(`pengajuan_izin`.`keterangan`,'NA'),'|'),NULL)) AS `tgl_14`,max(if(`presensi`.`tgl_presensi` = '2023-11-15',concat(convert(ifnull(`presensi`.`jam_in`,'NA') using latin1),'|',convert(ifnull(`presensi`.`jam_out`,'NA') using latin1),'|',ifnull(`presensi`.`status`,'NA'),'|',ifnull(`jam_kerja`.`nama_jam_kerja`,'NA'),'|',convert(ifnull(`jam_kerja`.`jam_masuk`,'NA') using latin1),'|',convert(ifnull(`jam_kerja`.`jam_pulang`,'NA') using latin1),'|',ifnull(`presensi`.`kode_izin`,'NA'),'|',ifnull(`pengajuan_izin`.`keterangan`,'NA'),'|'),NULL)) AS `tgl_15`,max(if(`presensi`.`tgl_presensi` = '2023-11-16',concat(convert(ifnull(`presensi`.`jam_in`,'NA') using latin1),'|',convert(ifnull(`presensi`.`jam_out`,'NA') using latin1),'|',ifnull(`presensi`.`status`,'NA'),'|',ifnull(`jam_kerja`.`nama_jam_kerja`,'NA'),'|',convert(ifnull(`jam_kerja`.`jam_masuk`,'NA') using latin1),'|',convert(ifnull(`jam_kerja`.`jam_pulang`,'NA') using latin1),'|',ifnull(`presensi`.`kode_izin`,'NA'),'|',ifnull(`pengajuan_izin`.`keterangan`,'NA'),'|'),NULL)) AS `tgl_16`,max(if(`presensi`.`tgl_presensi` = '2023-11-17',concat(convert(ifnull(`presensi`.`jam_in`,'NA') using latin1),'|',convert(ifnull(`presensi`.`jam_out`,'NA') using latin1),'|',ifnull(`presensi`.`status`,'NA'),'|',ifnull(`jam_kerja`.`nama_jam_kerja`,'NA'),'|',convert(ifnull(`jam_kerja`.`jam_masuk`,'NA') using latin1),'|',convert(ifnull(`jam_kerja`.`jam_pulang`,'NA') using latin1),'|',ifnull(`presensi`.`kode_izin`,'NA'),'|',ifnull(`pengajuan_izin`.`keterangan`,'NA'),'|'),NULL)) AS `tgl_17`,max(if(`presensi`.`tgl_presensi` = '2023-11-18',concat(convert(ifnull(`presensi`.`jam_in`,'NA') using latin1),'|',convert(ifnull(`presensi`.`jam_out`,'NA') using latin1),'|',ifnull(`presensi`.`status`,'NA'),'|',ifnull(`jam_kerja`.`nama_jam_kerja`,'NA'),'|',convert(ifnull(`jam_kerja`.`jam_masuk`,'NA') using latin1),'|',convert(ifnull(`jam_kerja`.`jam_pulang`,'NA') using latin1),'|',ifnull(`presensi`.`kode_izin`,'NA'),'|',ifnull(`pengajuan_izin`.`keterangan`,'NA'),'|'),NULL)) AS `tgl_18`,max(if(`presensi`.`tgl_presensi` = '2023-11-19',concat(convert(ifnull(`presensi`.`jam_in`,'NA') using latin1),'|',convert(ifnull(`presensi`.`jam_out`,'NA') using latin1),'|',ifnull(`presensi`.`status`,'NA'),'|',ifnull(`jam_kerja`.`nama_jam_kerja`,'NA'),'|',convert(ifnull(`jam_kerja`.`jam_masuk`,'NA') using latin1),'|',convert(ifnull(`jam_kerja`.`jam_pulang`,'NA') using latin1),'|',ifnull(`presensi`.`kode_izin`,'NA'),'|',ifnull(`pengajuan_izin`.`keterangan`,'NA'),'|'),NULL)) AS `tgl_19`,max(if(`presensi`.`tgl_presensi` = '2023-11-20',concat(convert(ifnull(`presensi`.`jam_in`,'NA') using latin1),'|',convert(ifnull(`presensi`.`jam_out`,'NA') using latin1),'|',ifnull(`presensi`.`status`,'NA'),'|',ifnull(`jam_kerja`.`nama_jam_kerja`,'NA'),'|',convert(ifnull(`jam_kerja`.`jam_masuk`,'NA') using latin1),'|',convert(ifnull(`jam_kerja`.`jam_pulang`,'NA') using latin1),'|',ifnull(`presensi`.`kode_izin`,'NA'),'|',ifnull(`pengajuan_izin`.`keterangan`,'NA'),'|'),NULL)) AS `tgl_20`,max(if(`presensi`.`tgl_presensi` = '2023-11-21',concat(convert(ifnull(`presensi`.`jam_in`,'NA') using latin1),'|',convert(ifnull(`presensi`.`jam_out`,'NA') using latin1),'|',ifnull(`presensi`.`status`,'NA'),'|',ifnull(`jam_kerja`.`nama_jam_kerja`,'NA'),'|',convert(ifnull(`jam_kerja`.`jam_masuk`,'NA') using latin1),'|',convert(ifnull(`jam_kerja`.`jam_pulang`,'NA') using latin1),'|',ifnull(`presensi`.`kode_izin`,'NA'),'|',ifnull(`pengajuan_izin`.`keterangan`,'NA'),'|'),NULL)) AS `tgl_21`,max(if(`presensi`.`tgl_presensi` = '2023-11-22',concat(convert(ifnull(`presensi`.`jam_in`,'NA') using latin1),'|',convert(ifnull(`presensi`.`jam_out`,'NA') using latin1),'|',ifnull(`presensi`.`status`,'NA'),'|',ifnull(`jam_kerja`.`nama_jam_kerja`,'NA'),'|',convert(ifnull(`jam_kerja`.`jam_masuk`,'NA') using latin1),'|',convert(ifnull(`jam_kerja`.`jam_pulang`,'NA') using latin1),'|',ifnull(`presensi`.`kode_izin`,'NA'),'|',ifnull(`pengajuan_izin`.`keterangan`,'NA'),'|'),NULL)) AS `tgl_22`,max(if(`presensi`.`tgl_presensi` = '2023-11-23',concat(convert(ifnull(`presensi`.`jam_in`,'NA') using latin1),'|',convert(ifnull(`presensi`.`jam_out`,'NA') using latin1),'|',ifnull(`presensi`.`status`,'NA'),'|',ifnull(`jam_kerja`.`nama_jam_kerja`,'NA'),'|',convert(ifnull(`jam_kerja`.`jam_masuk`,'NA') using latin1),'|',convert(ifnull(`jam_kerja`.`jam_pulang`,'NA') using latin1),'|',ifnull(`presensi`.`kode_izin`,'NA'),'|',ifnull(`pengajuan_izin`.`keterangan`,'NA'),'|'),NULL)) AS `tgl_23`,max(if(`presensi`.`tgl_presensi` = '2023-11-24',concat(convert(ifnull(`presensi`.`jam_in`,'NA') using latin1),'|',convert(ifnull(`presensi`.`jam_out`,'NA') using latin1),'|',ifnull(`presensi`.`status`,'NA'),'|',ifnull(`jam_kerja`.`nama_jam_kerja`,'NA'),'|',convert(ifnull(`jam_kerja`.`jam_masuk`,'NA') using latin1),'|',convert(ifnull(`jam_kerja`.`jam_pulang`,'NA') using latin1),'|',ifnull(`presensi`.`kode_izin`,'NA'),'|',ifnull(`pengajuan_izin`.`keterangan`,'NA'),'|'),NULL)) AS `tgl_24`,max(if(`presensi`.`tgl_presensi` = '2023-11-25',concat(convert(ifnull(`presensi`.`jam_in`,'NA') using latin1),'|',convert(ifnull(`presensi`.`jam_out`,'NA') using latin1),'|',ifnull(`presensi`.`status`,'NA'),'|',ifnull(`jam_kerja`.`nama_jam_kerja`,'NA'),'|',convert(ifnull(`jam_kerja`.`jam_masuk`,'NA') using latin1),'|',convert(ifnull(`jam_kerja`.`jam_pulang`,'NA') using latin1),'|',ifnull(`presensi`.`kode_izin`,'NA'),'|',ifnull(`pengajuan_izin`.`keterangan`,'NA'),'|'),NULL)) AS `tgl_25`,max(if(`presensi`.`tgl_presensi` = '2023-11-26',concat(convert(ifnull(`presensi`.`jam_in`,'NA') using latin1),'|',convert(ifnull(`presensi`.`jam_out`,'NA') using latin1),'|',ifnull(`presensi`.`status`,'NA'),'|',ifnull(`jam_kerja`.`nama_jam_kerja`,'NA'),'|',convert(ifnull(`jam_kerja`.`jam_masuk`,'NA') using latin1),'|',convert(ifnull(`jam_kerja`.`jam_pulang`,'NA') using latin1),'|',ifnull(`presensi`.`kode_izin`,'NA'),'|',ifnull(`pengajuan_izin`.`keterangan`,'NA'),'|'),NULL)) AS `tgl_26`,max(if(`presensi`.`tgl_presensi` = '2023-11-27',concat(convert(ifnull(`presensi`.`jam_in`,'NA') using latin1),'|',convert(ifnull(`presensi`.`jam_out`,'NA') using latin1),'|',ifnull(`presensi`.`status`,'NA'),'|',ifnull(`jam_kerja`.`nama_jam_kerja`,'NA'),'|',convert(ifnull(`jam_kerja`.`jam_masuk`,'NA') using latin1),'|',convert(ifnull(`jam_kerja`.`jam_pulang`,'NA') using latin1),'|',ifnull(`presensi`.`kode_izin`,'NA'),'|',ifnull(`pengajuan_izin`.`keterangan`,'NA'),'|'),NULL)) AS `tgl_27`,max(if(`presensi`.`tgl_presensi` = '2023-11-28',concat(convert(ifnull(`presensi`.`jam_in`,'NA') using latin1),'|',convert(ifnull(`presensi`.`jam_out`,'NA') using latin1),'|',ifnull(`presensi`.`status`,'NA'),'|',ifnull(`jam_kerja`.`nama_jam_kerja`,'NA'),'|',convert(ifnull(`jam_kerja`.`jam_masuk`,'NA') using latin1),'|',convert(ifnull(`jam_kerja`.`jam_pulang`,'NA') using latin1),'|',ifnull(`presensi`.`kode_izin`,'NA'),'|',ifnull(`pengajuan_izin`.`keterangan`,'NA'),'|'),NULL)) AS `tgl_28`,max(if(`presensi`.`tgl_presensi` = '2023-11-29',concat(convert(ifnull(`presensi`.`jam_in`,'NA') using latin1),'|',convert(ifnull(`presensi`.`jam_out`,'NA') using latin1),'|',ifnull(`presensi`.`status`,'NA'),'|',ifnull(`jam_kerja`.`nama_jam_kerja`,'NA'),'|',convert(ifnull(`jam_kerja`.`jam_masuk`,'NA') using latin1),'|',convert(ifnull(`jam_kerja`.`jam_pulang`,'NA') using latin1),'|',ifnull(`presensi`.`kode_izin`,'NA'),'|',ifnull(`pengajuan_izin`.`keterangan`,'NA'),'|'),NULL)) AS `tgl_29`,max(if(`presensi`.`tgl_presensi` = '2023-11-30',concat(convert(ifnull(`presensi`.`jam_in`,'NA') using latin1),'|',convert(ifnull(`presensi`.`jam_out`,'NA') using latin1),'|',ifnull(`presensi`.`status`,'NA'),'|',ifnull(`jam_kerja`.`nama_jam_kerja`,'NA'),'|',convert(ifnull(`jam_kerja`.`jam_masuk`,'NA') using latin1),'|',convert(ifnull(`jam_kerja`.`jam_pulang`,'NA') using latin1),'|',ifnull(`presensi`.`kode_izin`,'NA'),'|',ifnull(`pengajuan_izin`.`keterangan`,'NA'),'|'),NULL)) AS `tgl_30`,max(if(`presensi`.`tgl_presensi` = '2023-11-31',concat(convert(ifnull(`presensi`.`jam_in`,'NA') using latin1),'|',convert(ifnull(`presensi`.`jam_out`,'NA') using latin1),'|',ifnull(`presensi`.`status`,'NA'),'|',ifnull(`jam_kerja`.`nama_jam_kerja`,'NA'),'|',convert(ifnull(`jam_kerja`.`jam_masuk`,'NA') using latin1),'|',convert(ifnull(`jam_kerja`.`jam_pulang`,'NA') using latin1),'|',ifnull(`presensi`.`kode_izin`,'NA'),'|',ifnull(`pengajuan_izin`.`keterangan`,'NA'),'|'),NULL)) AS `tgl_31` from ((`presensi` left join `jam_kerja` on(`presensi`.`kode_jam_kerja` = `jam_kerja`.`kode_jam_kerja`)) left join `pengajuan_izin` on(`presensi`.`kode_izin` = `pengajuan_izin`.`kode_izin`)) group by `presensi`.`nik`) `presensi` on(`karyawan`.`nik` = `presensi`.`nik`)) ;

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `cabang`
--
ALTER TABLE `cabang`
  ADD PRIMARY KEY (`kode_cabang`) USING BTREE;

--
-- Indeks untuk tabel `departemen`
--
ALTER TABLE `departemen`
  ADD PRIMARY KEY (`kode_dept`) USING BTREE;

--
-- Indeks untuk tabel `harilibur`
--
ALTER TABLE `harilibur`
  ADD PRIMARY KEY (`kode_libur`) USING BTREE;

--
-- Indeks untuk tabel `jam_kerja`
--
ALTER TABLE `jam_kerja`
  ADD PRIMARY KEY (`kode_jam_kerja`) USING BTREE;

--
-- Indeks untuk tabel `karyawan`
--
ALTER TABLE `karyawan`
  ADD PRIMARY KEY (`nik`) USING BTREE,
  ADD KEY `fk_karyawan_cabang` (`kode_cabang`) USING BTREE,
  ADD KEY `fk_karyawan_dept` (`kode_dept`) USING BTREE;

--
-- Indeks untuk tabel `konfigurasi_jamkerja`
--
ALTER TABLE `konfigurasi_jamkerja`
  ADD KEY `fk_kj_jk` (`kode_jam_kerja`) USING BTREE,
  ADD KEY `fk_kj_karyawan` (`nik`) USING BTREE;

--
-- Indeks untuk tabel `konfigurasi_jamkerja_by_date`
--
ALTER TABLE `konfigurasi_jamkerja_by_date`
  ADD KEY `fk_kjbydate_karyawan` (`nik`) USING BTREE;

--
-- Indeks untuk tabel `konfigurasi_jk_dept`
--
ALTER TABLE `konfigurasi_jk_dept`
  ADD PRIMARY KEY (`kode_jk_dept`) USING BTREE,
  ADD KEY `fk_kjd_cabang` (`kode_cabang`) USING BTREE,
  ADD KEY `fk_kjd_dept` (`kode_dept`) USING BTREE;

--
-- Indeks untuk tabel `konfigurasi_jk_dept_detail`
--
ALTER TABLE `konfigurasi_jk_dept_detail`
  ADD KEY `fk_jkdept` (`kode_jk_dept`) USING BTREE;

--
-- Indeks untuk tabel `master_cuti`
--
ALTER TABLE `master_cuti`
  ADD PRIMARY KEY (`kode_cuti`) USING BTREE;

--
-- Indeks untuk tabel `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indeks untuk tabel `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`model_id`,`model_type`) USING BTREE,
  ADD KEY `model_has_permissions_model_id_model_type_index` (`model_id`,`model_type`) USING BTREE;

--
-- Indeks untuk tabel `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD PRIMARY KEY (`role_id`,`model_id`,`model_type`) USING BTREE,
  ADD KEY `model_has_roles_model_id_model_type_index` (`model_id`,`model_type`) USING BTREE;

--
-- Indeks untuk tabel `pengajuan_izin`
--
ALTER TABLE `pengajuan_izin`
  ADD PRIMARY KEY (`kode_izin`) USING BTREE,
  ADD KEY `fk_pengajuan_cuti` (`kode_cuti`) USING BTREE,
  ADD KEY `fk_pengajuan_karyawan` (`nik`) USING BTREE;

--
-- Indeks untuk tabel `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD UNIQUE KEY `permissions_name_guard_name_unique` (`name`,`guard_name`) USING BTREE;

--
-- Indeks untuk tabel `presensi`
--
ALTER TABLE `presensi`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `fk_prensesi_pengajuan_izin` (`kode_izin`) USING BTREE,
  ADD KEY `fk_presensi_jk` (`kode_jam_kerja`) USING BTREE,
  ADD KEY `fk_presensi_karyawan` (`nik`) USING BTREE;

--
-- Indeks untuk tabel `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD UNIQUE KEY `roles_name_guard_name_unique` (`name`,`guard_name`) USING BTREE;

--
-- Indeks untuk tabel `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`role_id`) USING BTREE,
  ADD KEY `role_has_permissions_role_id_foreign` (`role_id`) USING BTREE;

--
-- Indeks untuk tabel `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD UNIQUE KEY `users_email_unique` (`email`) USING BTREE;

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT untuk tabel `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `presensi`
--
ALTER TABLE `presensi`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=97;

--
-- AUTO_INCREMENT untuk tabel `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `karyawan`
--
ALTER TABLE `karyawan`
  ADD CONSTRAINT `fk_karyawan_cabang` FOREIGN KEY (`kode_cabang`) REFERENCES `cabang` (`kode_cabang`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_karyawan_dept` FOREIGN KEY (`kode_dept`) REFERENCES `departemen` (`kode_dept`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `konfigurasi_jamkerja`
--
ALTER TABLE `konfigurasi_jamkerja`
  ADD CONSTRAINT `fk_kj_jk` FOREIGN KEY (`kode_jam_kerja`) REFERENCES `jam_kerja` (`kode_jam_kerja`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_kj_karyawan` FOREIGN KEY (`nik`) REFERENCES `karyawan` (`nik`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `konfigurasi_jamkerja_by_date`
--
ALTER TABLE `konfigurasi_jamkerja_by_date`
  ADD CONSTRAINT `fk_kjbydate_karyawan` FOREIGN KEY (`nik`) REFERENCES `karyawan` (`nik`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `konfigurasi_jk_dept`
--
ALTER TABLE `konfigurasi_jk_dept`
  ADD CONSTRAINT `fk_to_cabang` FOREIGN KEY (`kode_cabang`) REFERENCES `cabang` (`kode_cabang`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_to_dept` FOREIGN KEY (`kode_dept`) REFERENCES `departemen` (`kode_dept`) ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `konfigurasi_jk_dept_detail`
--
ALTER TABLE `konfigurasi_jk_dept_detail`
  ADD CONSTRAINT `fk_1` FOREIGN KEY (`kode_jk_dept`) REFERENCES `konfigurasi_jk_dept` (`kode_jk_dept`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD CONSTRAINT `model_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE;

--
-- Ketidakleluasaan untuk tabel `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD CONSTRAINT `fk_users` FOREIGN KEY (`model_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `model_has_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Ketidakleluasaan untuk tabel `pengajuan_izin`
--
ALTER TABLE `pengajuan_izin`
  ADD CONSTRAINT `fk_pengajuan_cuti` FOREIGN KEY (`kode_cuti`) REFERENCES `master_cuti` (`kode_cuti`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_pengajuan_karyawan` FOREIGN KEY (`nik`) REFERENCES `karyawan` (`nik`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `presensi`
--
ALTER TABLE `presensi`
  ADD CONSTRAINT `fk_prensesi_pengajuan_izin` FOREIGN KEY (`kode_izin`) REFERENCES `pengajuan_izin` (`kode_izin`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_presensi_jk` FOREIGN KEY (`kode_jam_kerja`) REFERENCES `jam_kerja` (`kode_jam_kerja`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_presensi_karyawan` FOREIGN KEY (`nik`) REFERENCES `karyawan` (`nik`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD CONSTRAINT `role_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `role_has_permissions_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

-- phpMyAdmin SQL Dump
-- version 4.3.11
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: 22 Des 2017 pada 18.47
-- Versi Server: 5.6.24
-- PHP Version: 5.6.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `klinik`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `arus_kas`
--

CREATE TABLE IF NOT EXISTS `arus_kas` (
  `id` int(11) NOT NULL,
  `transaksi` enum('Penjualan Jasa','Penjualan Resep','Penjualan Non Resep','Lain - Lain','Pemesanan','Hutang') NOT NULL,
  `idtransaksi` varchar(32) DEFAULT NULL,
  `IdPengguna` varchar(50) NOT NULL,
  `waktu` date NOT NULL,
  `masuk` double NOT NULL,
  `keluar` double NOT NULL,
  `keterangan` text NOT NULL,
  `verifikasi` int(1) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `arus_kas`
--

INSERT INTO `arus_kas` (`id`, `transaksi`, `idtransaksi`, `IdPengguna`, `waktu`, `masuk`, `keluar`, `keterangan`, `verifikasi`) VALUES
(1, 'Lain - Lain', '10.001.092017.LD', 'admin@admin.com', '2017-09-10', 10000000, 0, '', 1),
(2, 'Penjualan Jasa', '10.001.092017.LD', 'admin@admin.com', '2017-08-10', 100000, 0, '', 1),
(3, 'Penjualan Non Resep', '24', 'admin@admin.com', '2017-11-12', 50000, 0, '', 1),
(4, 'Lain - Lain', NULL, 'admin@admin.com', '2017-11-12', 0, 10000, 'Bensin', 1),
(6, 'Hutang', NULL, 'admin@admin.com', '2017-11-19', 0, 1000000, 'test', 1),
(7, 'Hutang', NULL, 'admin@admin.com', '2017-11-19', 0, 10000, 'bensin', 1),
(8, 'Penjualan Jasa', '27', 'admin@admin.com', '2017-12-22', 50000, 0, '', 1),
(9, 'Penjualan Resep', '28', 'admin@admin.com', '2017-12-22', 500, 0, '', 1),
(10, 'Pemesanan', '29', 'admin@admin.com', '2017-12-22', 50000, 0, '', 0),
(11, 'Penjualan Jasa', '29', 'admin@admin.com', '2017-12-22', 50000, 0, '', 1),
(12, 'Penjualan Jasa', '29', 'admin@admin.com', '2017-12-22', 50000, 0, '', 1),
(13, 'Penjualan Jasa', '22.001.122017.LD', 'admin@admin.com', '2017-12-22', 50500, 0, '', 1),
(14, 'Pemesanan', '22.002.122017.LD', 'admin@admin.com', '2017-12-22', 50000, 0, '', 0),
(15, 'Pemesanan', '22.003.122017.LD', 'admin@admin.com', '2017-12-22', 50000, 0, '', 0);

-- --------------------------------------------------------

--
-- Struktur dari tabel `barang`
--

CREATE TABLE IF NOT EXISTS `barang` (
  `barang_id` int(11) NOT NULL,
  `kategori_id` int(11) NOT NULL,
  `nama_barang` varchar(100) NOT NULL,
  `harga` int(11) NOT NULL,
  `stok` int(5) NOT NULL
) ENGINE=MyISAM AUTO_INCREMENT=16 DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `barang`
--

INSERT INTO `barang` (`barang_id`, `kategori_id`, `nama_barang`, `harga`, `stok`) VALUES
(13, 14, 'Nurscare', 50000, 100),
(14, 15, 'Operasi Ringan', 1000000, 0),
(15, 14, 'Vit C', 500, 999);

-- --------------------------------------------------------

--
-- Struktur dari tabel `config`
--

CREATE TABLE IF NOT EXISTS `config` (
  `id` int(3) NOT NULL,
  `system` varchar(50) NOT NULL,
  `deskripsi` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `groups`
--

CREATE TABLE IF NOT EXISTS `groups` (
  `id` mediumint(8) unsigned NOT NULL,
  `name` varchar(20) NOT NULL,
  `description` varchar(100) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `groups`
--

INSERT INTO `groups` (`id`, `name`, `description`) VALUES
(1, 'admin', 'Administrator'),
(3, 'Owner', ''),
(4, 'Dokter', ''),
(5, 'Pasien', '');

-- --------------------------------------------------------

--
-- Struktur dari tabel `informasi`
--

CREATE TABLE IF NOT EXISTS `informasi` (
  `id` int(1) NOT NULL,
  `nama_klinik` varchar(100) NOT NULL,
  `favicon` text NOT NULL,
  `logo` text NOT NULL,
  `ijin_klinik` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `informasi`
--

INSERT INTO `informasi` (`id`, `nama_klinik`, `favicon`, `logo`, `ijin_klinik`) VALUES
(1, 'Klinik La Derma Semarang', '', '', 'No. 333747.50256/DU.1596/449.1/222/VIII/2013');

-- --------------------------------------------------------

--
-- Struktur dari tabel `jadwal`
--

CREATE TABLE IF NOT EXISTS `jadwal` (
  `idJadwal` int(10) NOT NULL,
  `idDokter` varchar(50) NOT NULL,
  `Hari` varchar(7) NOT NULL,
  `tanggal` date NOT NULL,
  `DariJam` time NOT NULL,
  `SampaiJam` time NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `jadwal`
--

INSERT INTO `jadwal` (`idJadwal`, `idDokter`, `Hari`, `tanggal`, `DariJam`, `SampaiJam`) VALUES
(1, 'junandia08@gmail.com', 'Senin', '0000-00-00', '09:00:00', '11:30:00'),
(2, 'admin@admin.com', 'Rabu', '0000-00-00', '12:00:00', '17:00:00');

-- --------------------------------------------------------

--
-- Struktur dari tabel `karyawan`
--

CREATE TABLE IF NOT EXISTS `karyawan` (
  `nik` int(15) NOT NULL,
  `nama_karyawan` varchar(50) NOT NULL,
  `email_karyawan` varchar(75) NOT NULL,
  `jk` enum('L','P') NOT NULL,
  `alamat_karyawan` text NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `karyawan`
--

INSERT INTO `karyawan` (`nik`, `nama_karyawan`, `email_karyawan`, `jk`, `alamat_karyawan`) VALUES
(1, 'Rismawan Junandia', 'rismawan1810@nusamandiri.ac.id', 'L', 'JL. KARAMAT');

-- --------------------------------------------------------

--
-- Struktur dari tabel `kategori`
--

CREATE TABLE IF NOT EXISTS `kategori` (
  `kategori_obat` int(3) NOT NULL,
  `kategori` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `kategori`
--

INSERT INTO `kategori` (`kategori_obat`, `kategori`) VALUES
(1, 'Obat Sedang'),
(2, 'Obat Bahaya');

-- --------------------------------------------------------

--
-- Struktur dari tabel `kategori_barang`
--

CREATE TABLE IF NOT EXISTS `kategori_barang` (
  `kategori_id` int(11) NOT NULL,
  `nama_kategori` varchar(50) NOT NULL
) ENGINE=MyISAM AUTO_INCREMENT=17 DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `kategori_barang`
--

INSERT INTO `kategori_barang` (`kategori_id`, `nama_kategori`) VALUES
(16, 'Alat Kesehatan'),
(15, 'Pelayanan'),
(14, 'Obat');

-- --------------------------------------------------------

--
-- Struktur dari tabel `k_catatan`
--

CREATE TABLE IF NOT EXISTS `k_catatan` (
  `id_catatan` int(3) NOT NULL,
  `catatan` longtext NOT NULL,
  `id_pengguna` int(3) NOT NULL,
  `id_pasien` varchar(20) NOT NULL,
  `status_catatan` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `k_janji`
--

CREATE TABLE IF NOT EXISTS `k_janji` (
  `id_kj` int(3) NOT NULL,
  `id_pasien` varchar(20) NOT NULL,
  `idDokter` varchar(50) NOT NULL,
  `Tanggal` date NOT NULL,
  `Jam` time NOT NULL,
  `IdPengguna` varchar(50) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `k_janji`
--

INSERT INTO `k_janji` (`id_kj`, `id_pasien`, `idDokter`, `Tanggal`, `Jam`, `IdPengguna`) VALUES
(1, 'junandia08@gmail.com', 'admin@admin.com', '2017-09-17', '09:00:00', 'admin@admin.com');

-- --------------------------------------------------------

--
-- Struktur dari tabel `k_rmedis`
--

CREATE TABLE IF NOT EXISTS `k_rmedis` (
  `id_rmedis` int(5) NOT NULL,
  `id_tindakan` int(3) NOT NULL,
  `id_pasien` varchar(75) NOT NULL,
  `diagnosa` longtext NOT NULL,
  `keluhan` longtext NOT NULL,
  `resep` longtext NOT NULL,
  `waktu` date NOT NULL,
  `keterangan` longtext NOT NULL,
  `id_pengguna` varchar(75) NOT NULL,
  `id_dokter` varchar(75) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `k_tindakan`
--

CREATE TABLE IF NOT EXISTS `k_tindakan` (
  `id_tindakan` int(3) NOT NULL,
  `tindakan` longtext NOT NULL,
  `keterangan` longtext NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `k_tindakan`
--

INSERT INTO `k_tindakan` (`id_tindakan`, `tindakan`, `keterangan`) VALUES
(1, 'Operasi Kecil', 'Operasi kecil');

-- --------------------------------------------------------

--
-- Struktur dari tabel `login_attempts`
--

CREATE TABLE IF NOT EXISTS `login_attempts` (
  `id` int(11) unsigned NOT NULL,
  `ip_address` varchar(15) NOT NULL,
  `login` varchar(100) NOT NULL,
  `time` int(11) unsigned DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktur dari tabel `pasien`
--

CREATE TABLE IF NOT EXISTS `pasien` (
  `id_pasien` varchar(14) NOT NULL,
  `identitas` varchar(50) NOT NULL,
  `nama` varchar(120) NOT NULL,
  `alamat` text NOT NULL,
  `user` varchar(50) NOT NULL,
  `pass` varchar(50) NOT NULL,
  `sex` varchar(10) NOT NULL,
  `birth_date` date NOT NULL,
  `status` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `pasien`
--

INSERT INTO `pasien` (`id_pasien`, `identitas`, `nama`, `alamat`, `user`, `pass`, `sex`, `birth_date`, `status`) VALUES
('', '123455678888', 'Rismawan Junandia', 'JL. KARAMAT', 'junandia08@gmail.com', 'junandia101', 'Laki-laki', '1998-10-18', 'Pasien Baru'),
('LD-2017000102', '2147483647', 'Zein al Qurthubi', 'Jalan Simongan dalam gang 3 RT 06/01 Simongan Semarang barat, Kota Semarang', 'fafandha', 'fafarisi', 'Laki-laki', '2017-12-06', 'pasien lama'),
('LD-2017000207', '335000124500', 'Mason Najib', 'Perumahan Kompleks Tri Megah blok Anggrek-2 No. 13 Semarang', 'mason', 'mason', 'Laki-laki', '2017-12-22', 'Pasien Baru');

-- --------------------------------------------------------

--
-- Struktur dari tabel `pengguna`
--

CREATE TABLE IF NOT EXISTS `pengguna` (
  `id_user` int(3) NOT NULL,
  `nama` varchar(50) NOT NULL,
  `user` varchar(50) NOT NULL,
  `pass` varchar(50) NOT NULL,
  `alamat` varchar(100) NOT NULL,
  `phone` varchar(15) NOT NULL,
  `status` varchar(20) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `pengguna`
--

INSERT INTO `pengguna` (`id_user`, `nama`, `user`, `pass`, `alamat`, `phone`, `status`) VALUES
(1, 'Fadhila Natasha', 'administrator', 'admin', 'Jalan. Soetta Raya No. 213 Pedurungan Semarang', '+62853211000', 'admin'),
(2, 'Junandia', 'junandia08@gmail.com', 'junandia101', 'JL. Karamat', '0838181818', '3');

-- --------------------------------------------------------

--
-- Struktur dari tabel `percakapan`
--

CREATE TABLE IF NOT EXISTS `percakapan` (
  `id_percakapan` int(10) NOT NULL,
  `judul` varchar(50) NOT NULL,
  `dari` varchar(200) NOT NULL,
  `untuk` varchar(200) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `percakapan`
--

INSERT INTO `percakapan` (`id_percakapan`, `judul`, `dari`, `untuk`) VALUES
(4, 'Test Kelola Pesan', 'junandia08@gmail.com', 'admin@admin.com');

-- --------------------------------------------------------

--
-- Struktur dari tabel `pesan`
--

CREATE TABLE IF NOT EXISTS `pesan` (
  `id_pesan` int(11) NOT NULL,
  `id_percakapan` int(10) NOT NULL,
  `jam` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `dari` varchar(100) NOT NULL,
  `pesan` text NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `pesan`
--

INSERT INTO `pesan` (`id_pesan`, `id_percakapan`, `jam`, `dari`, `pesan`) VALUES
(12, 4, '2017-10-22 10:51:27', 'admin@admin.com', 'aaaa'),
(13, 4, '2017-10-22 10:51:44', 'admin@admin.com', 'aaaa');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tmp_transaksi`
--

CREATE TABLE IF NOT EXISTS `tmp_transaksi` (
  `tmp_idtx` int(11) NOT NULL,
  `barang_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `transaksi`
--

CREATE TABLE IF NOT EXISTS `transaksi` (
  `transaksi_id` varchar(20) NOT NULL,
  `tanggal_transaksi` date NOT NULL,
  `operator_id` varchar(50) NOT NULL,
  `pasien_email` varchar(50) NOT NULL,
  `dokter_email` varchar(50) NOT NULL,
  `jenis` enum('Penjualan Jasa','Penjualan Resep','Penjualan Non Resep','Lain-Lain','Pemesanan') NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `transaksi`
--

INSERT INTO `transaksi` (`transaksi_id`, `tanggal_transaksi`, `operator_id`, `pasien_email`, `dokter_email`, `jenis`) VALUES
('22.002.122017.LD', '2017-12-22', 'admin@admin.com', 'pasien@la-derma.com', 'doketer@la-derma.com', 'Pemesanan'),
('22.003.122017.LD', '2017-12-22', 'admin@admin.com', 'pasien@la-derma.com', 'doketer@la-derma.com', 'Pemesanan'),
('22.001.122017.LD', '2017-12-22', 'admin@admin.com', 'pasien@la-derma.com', 'doketer@la-derma.com', 'Penjualan Jasa');

-- --------------------------------------------------------

--
-- Struktur dari tabel `transaksi_detail`
--

CREATE TABLE IF NOT EXISTS `transaksi_detail` (
  `t_detail_id` int(11) NOT NULL,
  `barang_id` int(11) NOT NULL,
  `qty` int(11) NOT NULL,
  `transaksi_id` varchar(20) NOT NULL,
  `harga` int(11) NOT NULL,
  `status` enum('0','1') NOT NULL COMMENT '1= sudah diproses , 0 belum diproses'
) ENGINE=MyISAM AUTO_INCREMENT=56 DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `transaksi_detail`
--

INSERT INTO `transaksi_detail` (`t_detail_id`, `barang_id`, `qty`, `transaksi_id`, `harga`, `status`) VALUES
(54, 15, 2, '22.001.122017.LD', 10000, '0'),
(47, 15, 1, '22.001.122017.LD', 500, '1'),
(55, 15, 1, '22.001.122017.LD', 10000, '0'),
(53, 13, 2, '', 50000, '0');

--
-- Trigger `transaksi_detail`
--
DELIMITER $$
CREATE TRIGGER `stok` AFTER INSERT ON `transaksi_detail`
 FOR EACH ROW BEGIN
 UPDATE barang SET stok=barang.stok-NEW.qty
 WHERE barang_id=NEW.barang_id;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Struktur dari tabel `users`
--

CREATE TABLE IF NOT EXISTS `users` (
  `id` int(11) unsigned NOT NULL,
  `ip_address` varchar(45) NOT NULL,
  `username` varchar(100) DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `salt` varchar(255) DEFAULT NULL,
  `email` varchar(100) NOT NULL,
  `activation_code` varchar(40) DEFAULT NULL,
  `forgotten_password_code` varchar(40) DEFAULT NULL,
  `forgotten_password_time` int(11) unsigned DEFAULT NULL,
  `remember_code` varchar(40) DEFAULT NULL,
  `created_on` int(11) unsigned NOT NULL,
  `last_login` int(11) unsigned DEFAULT NULL,
  `active` tinyint(1) unsigned DEFAULT NULL,
  `first_name` varchar(50) DEFAULT NULL,
  `last_name` varchar(50) DEFAULT NULL,
  `company` text,
  `phone` varchar(20) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `users`
--

INSERT INTO `users` (`id`, `ip_address`, `username`, `password`, `salt`, `email`, `activation_code`, `forgotten_password_code`, `forgotten_password_time`, `remember_code`, `created_on`, `last_login`, `active`, `first_name`, `last_name`, `company`, `phone`) VALUES
(1, '327262626262', 'administrator', '$2a$07$SeBknntpZror9uyftVopmu61qg0ms8Qv1yV6FG.kQOSM.9QhmTo36', '', 'admin@admin.com', '', NULL, NULL, NULL, 1268889823, 1513953367, 1, 'Admin', 'istrator', 'ADMIN', '0'),
(2, '3132323232323', 'pasien@la-derma.com', '$2y$08$Pn8porgrcHoRWuVJ5gW47.LpR9euGlwKZzfwatvsKFYsxTdT64him', NULL, 'pasien@la-derma.com', NULL, NULL, NULL, NULL, 1501726388, 1502800334, 1, 'Pasien', 'Satu', 'Pasien', '08080808'),
(3, '313232323235', 'doketer@la-derma.com', '$2y$08$Pn8porgrcHoRWuVJ5gW47.LpR9euGlwKZzfwatvsKFYsxTdT64him', NULL, 'doketer@la-derma.com', NULL, NULL, NULL, NULL, 1501726460, 1502800241, 1, 'Dokter', 'Satu', 'La-Derma', '0808081088'),
(4, '3132323232222', 'junandia08@gmail.com', '$2y$08$9LnF5z3fxZpqyKrjTizjAeMz7.E5Yt2ze8F2W4qngRZCd5ZPhQWMi', NULL, 'junandia08@gmail.com', NULL, NULL, NULL, NULL, 1505478507, NULL, 1, '123455678888', 'Rismawan Junandia', NULL, NULL),
(9, '::1', 'hmm', '$2y$08$.CoFFEaINZNUQi8yHxfVSOGx5eOR/HAYPk1bljVlK2p.24wftD8g6', NULL, 'hmm', NULL, NULL, NULL, NULL, 1511045923, NULL, 1, 'mmm', 'mmm', NULL, NULL),
(10, '::1', 'rismawan1810@nusamandiri.ac.id', '$2y$08$sN8o5lGTVWuHOBtP38O.x.BVIj/8USzg.4dPnl5yTcmsyevZESgOK', NULL, 'rismawan1810@nusamandiri.ac.id', NULL, NULL, NULL, NULL, 1512408851, NULL, 1, 'Rismawan Junandia', '', NULL, NULL),
(11, '::1', 'testowner', '$2y$08$QaUrxrN.vjWpSmwWs/7Pf.Qt76oFD6O6aqn2x6U34glKloVAch3Uy', NULL, 'testowner', NULL, NULL, NULL, NULL, 1513813753, 1513946887, 1, 'Test', 'Owner', NULL, NULL);

-- --------------------------------------------------------

--
-- Struktur dari tabel `users_groups`
--

CREATE TABLE IF NOT EXISTS `users_groups` (
  `id` int(11) unsigned NOT NULL,
  `user_id` int(11) unsigned NOT NULL,
  `group_id` mediumint(8) unsigned NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `users_groups`
--

INSERT INTO `users_groups` (`id`, `user_id`, `group_id`) VALUES
(3, 1, 1),
(5, 1, 3),
(6, 1, 4),
(7, 1, 5),
(15, 2, 5),
(11, 3, 4),
(18, 4, 4),
(14, 9, 1),
(20, 10, 4),
(21, 11, 3);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `arus_kas`
--
ALTER TABLE `arus_kas`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `barang`
--
ALTER TABLE `barang`
  ADD PRIMARY KEY (`barang_id`);

--
-- Indexes for table `config`
--
ALTER TABLE `config`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `groups`
--
ALTER TABLE `groups`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `informasi`
--
ALTER TABLE `informasi`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `jadwal`
--
ALTER TABLE `jadwal`
  ADD PRIMARY KEY (`idJadwal`);

--
-- Indexes for table `karyawan`
--
ALTER TABLE `karyawan`
  ADD PRIMARY KEY (`nik`);

--
-- Indexes for table `kategori_barang`
--
ALTER TABLE `kategori_barang`
  ADD PRIMARY KEY (`kategori_id`);

--
-- Indexes for table `k_catatan`
--
ALTER TABLE `k_catatan`
  ADD PRIMARY KEY (`id_catatan`);

--
-- Indexes for table `k_janji`
--
ALTER TABLE `k_janji`
  ADD PRIMARY KEY (`id_kj`);

--
-- Indexes for table `k_rmedis`
--
ALTER TABLE `k_rmedis`
  ADD PRIMARY KEY (`id_rmedis`);

--
-- Indexes for table `k_tindakan`
--
ALTER TABLE `k_tindakan`
  ADD PRIMARY KEY (`id_tindakan`);

--
-- Indexes for table `login_attempts`
--
ALTER TABLE `login_attempts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pasien`
--
ALTER TABLE `pasien`
  ADD PRIMARY KEY (`id_pasien`);

--
-- Indexes for table `pengguna`
--
ALTER TABLE `pengguna`
  ADD PRIMARY KEY (`id_user`);

--
-- Indexes for table `percakapan`
--
ALTER TABLE `percakapan`
  ADD PRIMARY KEY (`id_percakapan`);

--
-- Indexes for table `pesan`
--
ALTER TABLE `pesan`
  ADD PRIMARY KEY (`id_pesan`), ADD KEY `id_percakapan` (`id_percakapan`);

--
-- Indexes for table `transaksi`
--
ALTER TABLE `transaksi`
  ADD PRIMARY KEY (`transaksi_id`);

--
-- Indexes for table `transaksi_detail`
--
ALTER TABLE `transaksi_detail`
  ADD PRIMARY KEY (`t_detail_id`), ADD KEY `transaksi_id` (`transaksi_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users_groups`
--
ALTER TABLE `users_groups`
  ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `uc_users_groups` (`user_id`,`group_id`), ADD KEY `fk_users_groups_users1_idx` (`user_id`), ADD KEY `fk_users_groups_groups1_idx` (`group_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `arus_kas`
--
ALTER TABLE `arus_kas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=16;
--
-- AUTO_INCREMENT for table `barang`
--
ALTER TABLE `barang`
  MODIFY `barang_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=16;
--
-- AUTO_INCREMENT for table `config`
--
ALTER TABLE `config`
  MODIFY `id` int(3) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `groups`
--
ALTER TABLE `groups`
  MODIFY `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `jadwal`
--
ALTER TABLE `jadwal`
  MODIFY `idJadwal` int(10) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `karyawan`
--
ALTER TABLE `karyawan`
  MODIFY `nik` int(15) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `kategori_barang`
--
ALTER TABLE `kategori_barang`
  MODIFY `kategori_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=17;
--
-- AUTO_INCREMENT for table `k_catatan`
--
ALTER TABLE `k_catatan`
  MODIFY `id_catatan` int(3) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `k_janji`
--
ALTER TABLE `k_janji`
  MODIFY `id_kj` int(3) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `k_rmedis`
--
ALTER TABLE `k_rmedis`
  MODIFY `id_rmedis` int(5) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `k_tindakan`
--
ALTER TABLE `k_tindakan`
  MODIFY `id_tindakan` int(3) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `login_attempts`
--
ALTER TABLE `login_attempts`
  MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `pengguna`
--
ALTER TABLE `pengguna`
  MODIFY `id_user` int(3) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `percakapan`
--
ALTER TABLE `percakapan`
  MODIFY `id_percakapan` int(10) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `pesan`
--
ALTER TABLE `pesan`
  MODIFY `id_pesan` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=14;
--
-- AUTO_INCREMENT for table `transaksi`
--
ALTER TABLE `transaksi`
AUTO_INCREMENT=30;
--
-- AUTO_INCREMENT for table `transaksi_detail`
--
ALTER TABLE `transaksi_detail`
  MODIFY `t_detail_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=56;
--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=12;
--
-- AUTO_INCREMENT for table `users_groups`
--
ALTER TABLE `users_groups`
  MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=22;
--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `users_groups`
--
ALTER TABLE `users_groups`
ADD CONSTRAINT `fk_users_groups_groups1` FOREIGN KEY (`group_id`) REFERENCES `groups` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
ADD CONSTRAINT `fk_users_groups_users1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

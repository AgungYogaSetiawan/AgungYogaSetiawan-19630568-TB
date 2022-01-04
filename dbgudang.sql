-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 04 Jan 2022 pada 13.23
-- Versi server: 10.3.16-MariaDB
-- Versi PHP: 7.1.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `dbgudang`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_barang`
--

CREATE TABLE `tb_barang` (
  `id_barang` varchar(15) NOT NULL,
  `nama_barang` varchar(120) NOT NULL,
  `tanggal` date NOT NULL,
  `kategori` varchar(100) NOT NULL,
  `gudang` varchar(50) NOT NULL,
  `jumlah` int(20) NOT NULL,
  `keterangan` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `tb_barang`
--

INSERT INTO `tb_barang` (`id_barang`, `nama_barang`, `tanggal`, `kategori`, `gudang`, `jumlah`, `keterangan`) VALUES
('1234', 'I3 10100F', '2021-12-04', 'CPU', 'PALANGKARAYA TECH WAREHOUSE ', 10, ''),
('1324', 'Venom RX Arasaka', '2021-12-06', 'Casing Pc', 'BJM TECH WAREHOUSE', 5, ''),
('223', 'NVDIA RTX 3080', '2022-01-02', 'VGA', 'BJM TECH WAREHOUSE', 5, 'baru masuk');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_brg_keluar`
--

CREATE TABLE `tb_brg_keluar` (
  `tanggal_keluar` date NOT NULL,
  `id_brg_keluar` varchar(50) NOT NULL,
  `id_barang` varchar(50) NOT NULL,
  `nama_barang` varchar(100) NOT NULL,
  `gudang` varchar(50) NOT NULL,
  `kategori` varchar(50) NOT NULL,
  `tujuan` varchar(50) NOT NULL,
  `jumlah` int(10) NOT NULL,
  `keterangan` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `tb_brg_keluar`
--

INSERT INTO `tb_brg_keluar` (`tanggal_keluar`, `id_brg_keluar`, `id_barang`, `nama_barang`, `gudang`, `kategori`, `tujuan`, `jumlah`, `keterangan`) VALUES
('2021-12-15', '123', '222', 'kamera logi', 'MARTAPURA TECH WAREHOUSE', 'CPU', 'bjm', 4, 'keluar'),
('2022-01-02', 'BK001', 'B001', 'AeroCool Lux RGB 500W', 'PALANGKARAYA TECH WAREHOUSE ', 'PSU', 'Jakarta', 40, '');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_brg_masuk`
--

CREATE TABLE `tb_brg_masuk` (
  `tanggal_masuk` date NOT NULL,
  `id_brg_msk` varchar(50) NOT NULL,
  `id_barang` varchar(50) NOT NULL,
  `nama_barang` varchar(100) NOT NULL,
  `supplier` varchar(50) NOT NULL,
  `gudang` varchar(100) NOT NULL,
  `kategori` varchar(50) NOT NULL,
  `jumlah` int(10) NOT NULL,
  `keterangan` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `tb_brg_masuk`
--

INSERT INTO `tb_brg_masuk` (`tanggal_masuk`, `id_brg_msk`, `id_barang`, `nama_barang`, `supplier`, `gudang`, `kategori`, `jumlah`, `keterangan`) VALUES
('2021-12-17', '23', '221', 'motherboard', 'asus', 'BJM TECH WAREHOUSE', 'Motherboard', 2, 'dd');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_gudang`
--

CREATE TABLE `tb_gudang` (
  `id_gudang` varchar(50) NOT NULL,
  `nama_gudang` varchar(50) NOT NULL,
  `alamat` varchar(50) NOT NULL,
  `keterangan` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `tb_gudang`
--

INSERT INTO `tb_gudang` (`id_gudang`, `nama_gudang`, `alamat`, `keterangan`) VALUES
('124', 'BJM TECH WAREHOUSE', 'JLN. AYANI KM. 10', 'Gudang Utama'),
('22', 'MARTAPURA TECH WAREHOUSE', 'hksn', 'gede');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_kategori`
--

CREATE TABLE `tb_kategori` (
  `id_kategori` varchar(50) NOT NULL,
  `nama_barang` varchar(100) NOT NULL,
  `nama_kategori` varchar(100) NOT NULL,
  `keterangan` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `tb_kategori`
--

INSERT INTO `tb_kategori` (`id_kategori`, `nama_barang`, `nama_kategori`, `keterangan`) VALUES
('123', 'mobo z690', 'Motherboard', 'ss'),
('20', 'I9 9900K', 'CPU', '');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_supplier`
--

CREATE TABLE `tb_supplier` (
  `id_supplier` varchar(20) NOT NULL,
  `nama_supplier` varchar(100) NOT NULL,
  `nama_barang` varchar(50) NOT NULL,
  `tanggal` date NOT NULL,
  `telepon` int(20) NOT NULL,
  `alamat` varchar(50) NOT NULL,
  `keterangan` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `tb_supplier`
--

INSERT INTO `tb_supplier` (`id_supplier`, `nama_supplier`, `nama_barang`, `tanggal`, `telepon`, `alamat`, `keterangan`) VALUES
('27', 'psu', 'vga', '2021-12-01', 1234, 'eded', 'dd'),
('32', 'SINARINDO', 'RTX 2080 TI', '2022-01-01', 87868767, 'Jln.Agasa', 'Baru');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_user`
--

CREATE TABLE `tb_user` (
  `id` int(11) NOT NULL,
  `username` varchar(100) NOT NULL,
  `password` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `tb_user`
--

INSERT INTO `tb_user` (`id`, `username`, `password`) VALUES
(1, 'admin', 'admin'),
(2, 'test', 'test'),
(3, 'yoga', 'coba');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `tb_barang`
--
ALTER TABLE `tb_barang`
  ADD PRIMARY KEY (`id_barang`);

--
-- Indeks untuk tabel `tb_brg_keluar`
--
ALTER TABLE `tb_brg_keluar`
  ADD PRIMARY KEY (`id_brg_keluar`);

--
-- Indeks untuk tabel `tb_brg_masuk`
--
ALTER TABLE `tb_brg_masuk`
  ADD PRIMARY KEY (`id_brg_msk`);

--
-- Indeks untuk tabel `tb_gudang`
--
ALTER TABLE `tb_gudang`
  ADD PRIMARY KEY (`id_gudang`);

--
-- Indeks untuk tabel `tb_kategori`
--
ALTER TABLE `tb_kategori`
  ADD PRIMARY KEY (`id_kategori`);

--
-- Indeks untuk tabel `tb_supplier`
--
ALTER TABLE `tb_supplier`
  ADD PRIMARY KEY (`id_supplier`);

--
-- Indeks untuk tabel `tb_user`
--
ALTER TABLE `tb_user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `tb_user`
--
ALTER TABLE `tb_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

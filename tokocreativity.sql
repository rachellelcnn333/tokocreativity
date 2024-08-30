-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 30 Agu 2024 pada 19.07
-- Versi server: 10.1.38-MariaDB
-- Versi PHP: 5.6.40

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `tokocreativity`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `admin`
--

CREATE TABLE `admin` (
  `id_admin` int(11) NOT NULL,
  `username` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `nama_lengkap` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `admin`
--

INSERT INTO `admin` (`id_admin`, `username`, `password`, `nama_lengkap`) VALUES
(1, 'Rachelle', 'rachelle01', 'Rachelle Luciana');

-- --------------------------------------------------------

--
-- Struktur dari tabel `kategori`
--

CREATE TABLE `kategori` (
  `id_kategori` int(5) NOT NULL,
  `nama_kategori` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `kategori`
--

INSERT INTO `kategori` (`id_kategori`, `nama_kategori`) VALUES
(1, 'Tas Wanita'),
(2, 'Tas Pria');

-- --------------------------------------------------------

--
-- Struktur dari tabel `ongkir`
--

CREATE TABLE `ongkir` (
  `id_ongkir` int(5) NOT NULL,
  `nama_kota` varchar(100) NOT NULL,
  `tarif` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `ongkir`
--

INSERT INTO `ongkir` (`id_ongkir`, `nama_kota`, `tarif`) VALUES
(1, 'Jakarta', 24000),
(2, 'Bali', 35000);

-- --------------------------------------------------------

--
-- Struktur dari tabel `pelanggan`
--

CREATE TABLE `pelanggan` (
  `id_pelanggan` int(11) NOT NULL,
  `email_pelanggan` varchar(100) NOT NULL,
  `password_pelanggan` varchar(50) NOT NULL,
  `nama_pelanggan` varchar(100) NOT NULL,
  `telepon_pelanggan` varchar(25) NOT NULL,
  `alamat_pelanggan` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `pelanggan`
--

INSERT INTO `pelanggan` (`id_pelanggan`, `email_pelanggan`, `password_pelanggan`, `nama_pelanggan`, `telepon_pelanggan`, `alamat_pelanggan`) VALUES
(1, 'bonnie105@gmail.com', 'bonnie1015', 'Bonnie Bougenville', '08123845678', 'Taman Kota 5'),
(2, 'Clyde125@gmail.com', 'clyde125', 'Clyde Lockwood', '083812346785', ''),
(3, 'Bias.yulisageni@gmail.com', 'password', 'Bias Yulisa Geni', '0834555888', 'Jl. Mawar 03');

-- --------------------------------------------------------

--
-- Struktur dari tabel `pembayaran`
--

CREATE TABLE `pembayaran` (
  `id_pembayaran` int(11) NOT NULL,
  `id_pembelian` int(11) NOT NULL,
  `nama` varchar(255) NOT NULL,
  `bank` varchar(255) NOT NULL DEFAULT 'pending',
  `jumlah` int(11) NOT NULL,
  `tanggal` date NOT NULL,
  `bukti` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `pembayaran`
--

INSERT INTO `pembayaran` (`id_pembayaran`, `id_pembelian`, `nama`, `bank`, `jumlah`, `tanggal`, `bukti`) VALUES
(7, 2, 'Bias Yulisa Geni', 'BCA', 334, '2024-08-24', '20240824065121Color Hunt Palette 251d3a2a2550e04d01ff7700 (1).png'),
(8, 3, 'Bonnie Bougenville', 'BCA', 179000, '2024-08-24', '20240824080413Color Hunt Palette 251d3a2a2550e04d01ff7700 (1).png'),
(9, 0, 'Ransel Pria ', 'BCA', 120000, '2024-08-30', '20240830165210Color Hunt Palette 251d3a2a2550e04d01ff7700 (1).png'),
(10, 0, 'Bonnie Bougenville', 'BCA', 12000, '2024-08-30', '20240830165448Color Hunt Palette 251d3a2a2550e04d01ff7700 (1).png'),
(11, 8, 'Bonnie Bougenville', 'BCA', 10000, '2024-08-30', '20240830165541Color Hunt Palette 251d3a2a2550e04d01ff7700 (1).png'),
(12, 0, 'Bonnie Bougenville', 'BNI', 250000, '2024-08-30', '20240830165707Color Hunt Palette 251d3a2a2550e04d01ff7700 (1).png'),
(13, 0, 'Bonnie Bougenville', 'BNI', 259000, '2024-08-30', '20240830165920Color Hunt Palette 251d3a2a2550e04d01ff7700 (1).png'),
(14, 9, 'Bonnie Bougenville', 'BCA', 259000, '2024-08-30', '20240830170031Color Hunt Palette 251d3a2a2550e04d01ff7700 (1).png');

-- --------------------------------------------------------

--
-- Struktur dari tabel `pembelian`
--

CREATE TABLE `pembelian` (
  `id_pembelian` int(11) NOT NULL,
  `id_pelanggan` int(11) NOT NULL,
  `id_ongkir` int(11) NOT NULL,
  `tanggal_pembelian` date NOT NULL,
  `total_pembelian` int(11) NOT NULL,
  `nama_kota` varchar(100) NOT NULL,
  `tarif` int(11) NOT NULL,
  `alamat_pengiriman` text NOT NULL,
  `status_pembelian` varchar(100) NOT NULL DEFAULT 'belum dibayar',
  `resi_pengriman` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `pembelian`
--

INSERT INTO `pembelian` (`id_pembelian`, `id_pelanggan`, `id_ongkir`, `tanggal_pembelian`, `total_pembelian`, `nama_kota`, `tarif`, `alamat_pengiriman`, `status_pembelian`, `resi_pengriman`) VALUES
(1, 1, 1, '2024-08-24', 179000, 'Jakarta', 24000, '', 'sudah kirim pembayaran', ''),
(2, 3, 1, '2024-08-24', 334000, 'Jakarta', 24000, 'Jl. Tanjung Duren Raya', 'sudah kirim pembayaran', ''),
(3, 3, 1, '2024-08-24', 179000, 'Jakarta', 24000, '', 'sudah kirim pembayaran', ''),
(8, 1, 2, '2024-08-30', 190000, 'Bali', 35000, '', 'sudah kirim pembayaran', ''),
(9, 1, 1, '2024-08-30', 259000, 'Jakarta', 24000, '', 'sudah kirim pembayaran', ''),
(10, 1, 0, '2024-08-30', 355000, '', 0, '', 'belum dibayar', '');

-- --------------------------------------------------------

--
-- Struktur dari tabel `pembelian_produk`
--

CREATE TABLE `pembelian_produk` (
  `id_pembelian_produk` int(11) NOT NULL,
  `id_pembelian` int(11) NOT NULL,
  `id_produk` int(11) NOT NULL,
  `jumlah` int(11) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `harga` int(11) NOT NULL,
  `berat` int(11) NOT NULL,
  `subberat` int(11) NOT NULL,
  `subharga` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `pembelian_produk`
--

INSERT INTO `pembelian_produk` (`id_pembelian_produk`, `id_pembelian`, `id_produk`, `jumlah`, `nama`, `harga`, `berat`, `subberat`, `subharga`) VALUES
(1, 1, 2, 1, 'Pink Toilet Bag', 155000, 600, 600, 155000),
(2, 2, 2, 2, 'Pink Toilet Bag', 155000, 600, 1200, 310000),
(3, 3, 2, 1, 'Pink Toilet Bag', 155000, 600, 600, 155000),
(4, 4, 4, 1, 'Small Purse ', 235000, 650, 650, 235000),
(5, 5, 2, 1, 'Pink Toilet Bag', 155000, 600, 600, 155000),
(6, 6, 2, 1, 'Pink Toilet Bag', 155000, 600, 600, 155000),
(7, 7, 2, 1, 'Pink Toilet Bag', 155000, 600, 600, 155000),
(8, 8, 2, 1, 'Pink Toilet Bag', 155000, 600, 600, 155000),
(9, 9, 4, 1, 'Small Purse ', 235000, 650, 650, 235000),
(10, 10, 8, 1, 'White Bag', 355000, 600, 600, 355000);

-- --------------------------------------------------------

--
-- Struktur dari tabel `produk`
--

CREATE TABLE `produk` (
  `id_produk` int(11) NOT NULL,
  `id_kategori` int(11) NOT NULL,
  `nama_produk` varchar(100) NOT NULL,
  `harga_produk` int(11) NOT NULL,
  `berat_produk` int(11) NOT NULL,
  `foto_produk` varchar(100) NOT NULL,
  `deskripsi_produk` text NOT NULL,
  `stok_produk` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `produk`
--

INSERT INTO `produk` (`id_produk`, `id_kategori`, `nama_produk`, `harga_produk`, `berat_produk`, `foto_produk`, `deskripsi_produk`, `stok_produk`) VALUES
(2, 1, 'Pink Toilet Bag', 155000, 600, 'pink-toilet-bag-towel-high-angle (1).jpg', 'Pink Toilet Bag adalah tas toilet berwarna pink yang dirancang khusus untuk menyimpan perlengkapan mandi dan kosmetik Anda dengan gaya dan kemudahan. Terbuat dari bahan berkualitas tinggi yang tahan air, tas ini memastikan barang-barang Anda tetap kering dan terlindungi. \r\n\r\nDengan beberapa kompartemen dan kantong, Pink Toilet Bag membantu Anda mengorganisir barang-barang kecil seperti sikat gigi, pasta gigi, sabun, sampo, dan makeup, sehingga mudah diakses kapan pun dibutuhkan. Desainnya yang modern dan elegan menjadikannya pilihan yang sempurna untuk perjalanan atau penggunaan sehari-hari. Tas ini juga dilengkapi dengan resleting yang kuat dan pegangan yang nyaman untuk kemudahan dibawa. Pink Toilet Bag adalah solusi praktis dan stylish untuk kebutuhan toilet Anda.', 2),
(4, 1, 'Small Purse ', 235000, 650, 'WhatsApp Image 2024-07-14 at 18.38.31.jpeg', 'Small Purse adalah tas kecil yang dirancang untuk menyimpan barang-barang penting Anda dengan gaya dan kenyamanan. Terbuat dari bahan berkualitas tinggi, tas ini memiliki desain yang elegan dan compact, ideal untuk berbagai kesempatan, mulai dari acara formal hingga kegiatan sehari-hari. \r\n\r\nSmall Purse biasanya dilengkapi dengan satu kompartemen utama dan beberapa kantong kecil untuk mengorganisir barang-barang seperti kartu, uang, ponsel, kunci, dan kosmetik. Beberapa model juga dilengkapi dengan tali bahu yang bisa dilepas atau diatur panjangnya, memberikan fleksibilitas dalam cara membawanya. \r\n\r\nDesainnya yang modis dan fungsional membuat Small Purse menjadi aksesori yang sempurna untuk melengkapi penampilan Anda, sambil memastikan barang-barang penting Anda selalu berada dalam jangkauan.', 8),
(8, 1, 'White Bag', 355000, 600, 'WhatsApp Image 2024-07-14 at 18.57.18.jpeg', 'White Bag adalah tas serbaguna berwarna putih yang menggabungkan fungsionalitas dengan gaya bersih dan modern. Cocok untuk berbagai kesempatan, mulai dari acara formal hingga kegiatan sehari-hari, tas ini menawarkan tampilan yang elegan dan rapi.', 9),
(11, 1, 'Reusable Eco Friendly ', 50000, 500, 'WhatsApp Image 2024-07-14 at 20.00.27 (1).jpeg', 'Reusable Eco Friendly adalah tas ramah lingkungan yang dirancang untuk mengurangi penggunaan plastik sekali pakai dan membantu menjaga kelestarian lingkungan. Tas ini cocok untuk berbagai kebutuhan sehari-hari seperti berbelanja, membawa barang pribadi, atau piknik, dengan fokus pada keberlanjutan dan fungsionalitas.', 10),
(12, 1, 'Luxury Pink Women Handbag', 250000, 700, 'WhatsApp Image 2024-07-14 at 18.38.31 (2).jpeg', 'Luxury Pink Women Handbag adalah tas tangan mewah yang dirancang khusus untuk wanita yang mengutamakan gaya dan keanggunan. Dengan warna pink yang elegan, tas ini menonjolkan kesan feminin dan modis, sempurna untuk melengkapi berbagai tampilan, baik untuk acara formal maupun kasual.', 10);

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id_admin`);

--
-- Indeks untuk tabel `kategori`
--
ALTER TABLE `kategori`
  ADD PRIMARY KEY (`id_kategori`);

--
-- Indeks untuk tabel `ongkir`
--
ALTER TABLE `ongkir`
  ADD PRIMARY KEY (`id_ongkir`);

--
-- Indeks untuk tabel `pelanggan`
--
ALTER TABLE `pelanggan`
  ADD PRIMARY KEY (`id_pelanggan`);

--
-- Indeks untuk tabel `pembayaran`
--
ALTER TABLE `pembayaran`
  ADD PRIMARY KEY (`id_pembayaran`);

--
-- Indeks untuk tabel `pembelian`
--
ALTER TABLE `pembelian`
  ADD PRIMARY KEY (`id_pembelian`),
  ADD UNIQUE KEY `id_pembelian` (`id_pembelian`);

--
-- Indeks untuk tabel `pembelian_produk`
--
ALTER TABLE `pembelian_produk`
  ADD PRIMARY KEY (`id_pembelian_produk`);

--
-- Indeks untuk tabel `produk`
--
ALTER TABLE `produk`
  ADD PRIMARY KEY (`id_produk`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `admin`
--
ALTER TABLE `admin`
  MODIFY `id_admin` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `kategori`
--
ALTER TABLE `kategori`
  MODIFY `id_kategori` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `ongkir`
--
ALTER TABLE `ongkir`
  MODIFY `id_ongkir` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `pelanggan`
--
ALTER TABLE `pelanggan`
  MODIFY `id_pelanggan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT untuk tabel `pembayaran`
--
ALTER TABLE `pembayaran`
  MODIFY `id_pembayaran` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT untuk tabel `pembelian`
--
ALTER TABLE `pembelian`
  MODIFY `id_pembelian` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT untuk tabel `pembelian_produk`
--
ALTER TABLE `pembelian_produk`
  MODIFY `id_pembelian_produk` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT untuk tabel `produk`
--
ALTER TABLE `produk`
  MODIFY `id_produk` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

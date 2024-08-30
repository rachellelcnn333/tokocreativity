<?php
session_start();
include 'koneksi.php';

$id_pembelian = $_GET["id"];

$ambil = $koneksi->query("SELECT * FROM pembayaran LEFT JOIN Pembelian ON pembayaran.id_pembelian WHERE pembelian.id_pembelian='$id_pembelian'");
$detbay = $ambil->fetch_assoc();

if ($detbay["status_pembelian"]=="belum dibayar")
{
    echo "<script>alert('anda tidak berhak')</script>";
    echo "<script>location='riwayat.php';</script>";
    exit();
}
?>
<!DOCTYPE html>
<html>
<head>
        <title>Lihat Pembayaran</title>
        <link rel="stylesheet" href="admin/assets/css/bootstrap.css">
</head>
<body>

    <?php include 'menu.php'; ?>

    <div class="container">
        <h3>Lihat Pembayaran<h3>
            <div class="row">
                <div class="col-md-6">
                <table class="table">
            <tr>
                <th>Nama</th>
                <td><?php echo $detail['nama'] ?></td>
            </tr>
           <tr>
                <th>Bank</th>
                <td><?php echo $detail['bank'] ?></td>
            </tr>
            <tr>
            <th>Jumlah</th>
                <td><?php echo number_format($detail['jumlah']) ?></td>
            </tr>
            <tr>
                <th>Tanggal</th>
                <td><?php echo $detail['tanggal'] ?></td>
            </tr>
        </table>
            </div>
        </div>
</body>
<html>


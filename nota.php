<?php 
session_start();
include 'koneksi.php'; ?>

<!DOCTYPE html>
<html>
<head>
    <title>Nota Pembelian</title>
    <link rel="stylesheet" href="admin/assets/css/bootstrap.css">
</head>
<body>

<?php include 'menu.php'; ?>

    <div class="container">

    <h2>Detail Pembelian</h2>
<?php
$ambil = $koneksi->query("SELECT * FROM pembelian JOIN pelanggan 
ON pembelian.id_pelanggan=pelanggan.id_pelanggan
WHERE pembelian.id_pembelian='$_GET[id]'");
$detail = $ambil->fetch_assoc();
?>

<!--jika pelanggan yg beli tdk sma dgn pelanggan yg login, mka dilarikan ke riwayat.php karena dia tdk berhak melihat nota orang lain-->
<!--pelanggan yg beli hrs pelanggan yg login-->
<?php
// mdpatkan id_pelanggan yg beli
$idpelangganyangbeli = $detail["id_pelanggan"];

// mdpatkan id_pelanggan yg login
$idpelangganyanglogin = $_SESSION["pelanggan"]["id_pelanggan"];

if ($idpelangganyangbeli!==$idpelangganyanglogin)
{
    echo "<script>alert('Kesalahan dalam Tindakan');</script>";
    echo "<script>location='riwayat.php';</script>";
    exit();
}
?>
<div class="row">
    <div class="col-md-4">
        <h3>Pembelian</h3>
        <strong>No. Pembelian: <?php echo $detail['id_pembelian'] ?></strong><br>
        Tanggal: <?php echo $detail['tanggal_pembelian']; ?><br>
        Total: Rp. <?php echo number_format($detail['total_pembelian']); ?>
</div>
    <div class="col-md-4">
        <h3>Pelanggan</h3>
        <strong><?php echo $detail['nama_pelanggan'] ?></strong> <br>
        <p>
        <?php echo $detail['telepon_pelanggan']; ?> <br>
        <?php echo $detail['email_pelanggan']; ?> 
</p>
</div>
        <div class="col-md-4">
            <h3>Pengiriman</h3>
            <strong><?php echo $detail['nama_kota'] ?></strong> <br>
            Ongkos Kirim: Rp. <?php echo number_format($detail['tarif']); ?>
            </div>
</div>

<table class="table table-bordered">
    <thead>
        <tr>
            <th>No</th>
            <th>Nama Produk</th>
            <th>Harga</th>
            <th>Berat</th>
            <th>Jumlah</th>
            <th>Subberat</th>
            <th>Subtotal</th>
        </tr>
</thead>
</tbody>
    <?php $nomor=1; ?>
    <?php $ambil=$koneksi->query("SELECT * FROM pembelian_produk WHERE id_pembelian='$_GET[id]'"); ?>
    <?php while($pecah=$ambil->fetch_assoc()){ ?>
    <tr>
    <td><?php echo $nomor; ?></td>
    <td><?php echo $pecah['nama']; ?></td>
    <td>Rp. <?php echo number_format($pecah['harga']); ?></td>
    <td><?php echo $pecah['berat']; ?> Gr.</td>
    <td><?php echo $pecah['jumlah']; ?></td>
    <td><?php echo $pecah['subberat']; ?>Gr.</td>
    <td>Rp. <?php echo number_format($pecah['subharga']); ?></td>
</tr>
<?php $nomor++; ?> 
<?php } ?>
</tbody>
</table>

            
<div class="row">
    <div class="col-md-7">
        <div class="alert alert-info">
        <p>
            Silahkan Melakukan Pembayaran RP. <?php echo number_format($detail['total_pembelian']); ?> ke <br>
            <strong>BANK BCA 137-001122-3456 A.N Toko Creativity</strong>
    </p>
    </div>
    </div>
    </div>

             </div>
             </section>

             </body>
             </html>
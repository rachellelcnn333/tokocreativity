<?php
session_start();
//koneksi ke database
include 'koneksi.php';

// jika tidak ada session pelanggan(blm login)
if(!isset($_SESSION["pelanggan"]) OR empty($_SESSION["pelanggan"]))
{
    echo "<script>alert('silakan login');</script>";
    echo "<script>location='login.php';</script>";
    exit();
}
?>

<!DOCTYPE html>
<html>
<head>
    <title>Pembayaran</title>
    <link rel="stylesheet" href="admin/assets/css/bootstrap.css">
</head>
<body>
    <?php include 'menu.php'; ?>
    <div class="container">
        <h2> Pembayaran <?php echo $_SESSION["pelanggan"]["nama_pelanggan"] ?></h2>
        <p>Kirim bukti pembayaran Anda di sini</p>
        <form method="post" enctype="multipart/form-data">
            <div class="form-group">
                <label>Nama Penyetor</label>
                <input type="text" class="form-control" name="nama">
            </div>
            <div class="form-group">
        <label>Bank</label>
        <select class="form-control" name="bank">
            <option value="">Pilih Bank</option>
            <option value="BCA">BCA</option>
            <option value="BRI">BRI</option>
            <option value="BNI">BNI</option>
            <option value="BRI">BRI</option>
            <option value="Mega">Mega</option>
            <option value="Mandiri">Mandiri</option>
            <option value="Permata">Permata</option>
            <option value="Cimb Niaga">Cimb Niaga</option>
</select>
    </div>
    <div class="form-group">
                <label>Jumlah</label>
                <input type="number" class="form-control" name="jumlah" min="1">
    </div>
    <div class="form-group">
                <label>Foto Bukti Pembayaran</label>
                <input type="file" class="form-control" name="bukti">
                <p class="text-danger"> bukti foto harus JPG maksimal 2MB</p>
    </div>
    <button class="btn btn-primary" name="kirim">Kirim</button>
</form>
</div>

<?php
 //jika ada tombol kirim
 if (isset($_POST["kirim"]))
 {
    //upload dlu bukti pembayaran
    $namabukti = $_FILES["bukti"]["name"];
    $lokasibukti = $_FILES["bukti"]["tmp_name"];
    $namafiks = date("YmdHis").$namabukti;
    move_uploaded_file($lokasibukti, "bukti_pembayaran/$namafiks");

    $nama = $_POST["nama"];
    $bank = $_POST["bank"];
    $jumlah = $_POST["jumlah"];
    $tanggal = date("Y-m-d");

    //simpan pembayaran
    $koneksi->query("INSERT INTO pembayaran(id_pembelian,nama,bank,jumlah,tanggal,bukti) VALUES ('$idpem','$nama','$bank','$jumlah','$tanggal','$namafiks') ");

    $koneksi->query("UPDATE pembelian SET status_pembelian = 'sudah kirim pembayaran' WHERE id_pembelian='$idpem'");
 
    echo "<script>alert('Terima kasih sudah mengirim bukti pembayaran');</script>";
    echo "<script>location='riwayat.php';</script>";

} 
?> 

</body>
</html>
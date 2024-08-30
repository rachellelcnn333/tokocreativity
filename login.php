<?php
session_start();
include 'koneksi.php';
?>
<!DOCTYPE html>
<html>
<head>
        <title>Login Pelanggan</title>
        <link rel="stylesheet" href="admin/assets/css/bootstrap.css">
</head>
<body>

<?php include 'menu.php'; ?>

<div class="container">
    <div class="row">
        <div class="col-md-4">
            <div class="panel panel-default">
                <div class="panel panel-heading">
                    <h3 class="panel-title">Login Pelanggan</h3>
                </div>
                <div class="panel-body">
                    <form method="post">
                        <div class="form-group">
                            <label>Email</label> 
                            <input type="email" class="form-control" name="email">
                        </div>
                        <div class="form-group">
                            <label>Password</label>
                            <input type="password" class="form-control" name="password">
                        </div>
                        <button class="btn btn-primary" name="login">Login</button>
                    </form>
                    <hr />
                                    Not register ? <a href="daftar.php" >click here </a>
                    <div class="form-group">
                                            <label class="checkbox-inline">
                                                <input type="checkbox" /> Remember me
                                            </label>
                                            <span class="pull-right">
                                                   <a href="#" >Forget password ? </a> 
                                            </span>
                                        </div>
                </div>
            </div>
        </div>
    </div>
</div>

<?php
// jika ada tombol login(tombol simpan ditekan)
if (isset($_POST["login"]))
{
    $email = $_POST["email"];
    $password = $_POST["password"];
    // melakukan kuery cek akun di tabel pelanggan di db
    $ambil = $koneksi->query("SELECT * FROM pelanggan WHERE email_pelanggan='$email' AND password_pelanggan='$password'");

    //hitung akun yg terambil
    $akunyangcocok = $ambil->num_rows;

    // jika 1 akun yg cocok, maka diloginkan
    if ($akunyangcocok==1)
    {
        // anda sukses login
        // mendapatkan akun dlm bentuk array
        $akun = $ambil->fetch_assoc();
        // login di session pelanggan
        $_SESSION["pelanggan"] = $akun;
        echo "<script>alert('Anda sukses login');</script>";

        //jika sudah belanja
        if(isset($_SESSION["keranjang"]) OR !empty($_SESSION["keranjang"])) 
        {
            echo "<script>location='checkout.php';</script>";
        }
        else
        {
            echo "<script>location='riwayat.php';</script>";   
        }
    }
    else
    {
        // anda gagal login
        echo "<script>alert('Anda gagal login, periksa kembali akun Anda');</script>";
        echo "<script>location='login.php';</script>";
    }
}

?>

</body>
</html>



<html>
 <head>    </head>
<body>
<?php
session_start();
$Act = $_GET['act'];


if(isset($Act)){

  $host     = "localhost";
  $port     = 3306;
  $socket   = "";
  $user     = "root";
  $password = "";
  $dbname   = "labbd";

  $con = new mysqli($host, $user, $password, $dbname, $port, $socket)
      or die ('Could not connect to the database server' . mysqli_connect_error());


  if($Act == "insereDepartamento"){
      $sigla = $_POST["sigla"];
      $nome = $_POST["nome"];
      $sql = "call labbd.insereDepartamento('$sigla', '$nome');";

      if ($con->query($sql) === TRUE) {
          echo "Inserido com sucesso";
      }
      else {
          echo "Erro: " . $con->error;
      }

    }

  }


?>
<br>
<a href="main.php">Voltar</a><
</body>
 </html>

<!DOCTYPE html>
<!-- Template by quackit.com -->
<html>
 <head>
   <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
   <title>2 Column Layout &mdash; Left Menu</title>
   <style type="text/css">
     body{
       margin:0;
       padding:0;
       font-family: Sans-Serif;
       line-height: 1.5em;
     }
     main {
       padding-bottom: 10010px;
       margin-bottom: -10000px;
       float: left;
       width: 100%;
     }
     #nav {
       float: left;
       width: 230px;
       margin-left: -100%;
       padding-bottom: 10010px;
       margin-bottom: -10000px;
       background: #eee;
     }
     #wrapper {
       overflow: hidden;
     }
     #content {
       margin-left: 230px; /* Same as 'nav' width */
     }
     .innertube{
       margin: 15px; /* Padding for content */
       margin-top: 0;
     }
     p {
       color: #555;
     }
     nav ul {
       list-style-type: none;
       margin: 0;
       padding: 0;
     }
     nav ul a {
       color: darkgreen;
       text-decoration: none;
     }
     nav ul :hover {
       margin: 1;
     background-color: white;
     }
     b {
      color: white;
      font-family: Sans-Serif;
      font-size: 200%;
      position: absolute;
      left: 35%;
      top: 5%
    }
     #head {
       height: 90px;
       background: #444;
     }
    </style>

    <div class id=head>
    <b> Sistema Controle Academico </b>
    </div>

    </head>

 <body>
   <?php
     $cpf = $_GET["cpf"];
    ?>
   <div id="wrapper">

     <main>
       <div id="content">
         <div class="innertube">
           <h1>Cadastrar Itens de Pauta</h1>
           <p >

             <form action="criarItens.php?cpf=<?php echo $cpf?>" method="post" align=”center”>
             Pauta: <input type="text" name="pauta" size= "255"/><br>
             Data:  <input type="date" name="data"/><br>
             Texto Descritivo:  <input type="text" name="texto"/><br>
             Número Reuniao:  <input type="number" name="num_reuniao" min="1"/><br>
             <input type="submit" value="Enviar" name="submit">

             </form>

             <?php
             function insereItens(){
                   $cpf = $_GET["cpf"];
                   $host     = "localhost";
                   $port     = 3306;
                   $socket   = "";
                   $user     = "root";
                   $password = "";
                   $dbname   = "labbd";
                   $con = new mysqli($host, $user, $password, $dbname, $port, $socket)
                       or die ('Could not connect to the database server' . mysqli_connect_error());
                 $pauta = $_POST["pauta"];
                 $data  = $_POST["data"];
                 $texto  = $_POST["texto"];
                 $num_reuniao = $_POST["num_reuniao"];
                 $sql = "call labbd.insereItens_de_pauta('$pauta', '$data', '$num_reuniao','$texto');";
                 header("Content-Type: text/html; charset=ISO-8859-1",true);
                if ($con->query($sql) === TRUE) {
                     echo "Inserido com sucesso.";
                 }
                 else {
                     echo "Erro: dados errados";
                 }
                 $con->close();
             }
             if(isset($_POST['submit']))
             {
                insereItens();
             }
             $host     = "localhost";
             $port     = 3306;
             $socket   = "";
             $user     = "root";
             $password = "";
             $dbname   = "labbd";
             $con = new mysqli($host, $user, $password, $dbname, $port, $socket)
                     or die ('Could not connect to the database server' . mysqli_connect_error());
             $sql = "select * from reuniao where reuniao.cpf='$cpf'";
             $result = $con->query($sql);
             
             if ($result->num_rows > 0) {
                  echo "<br>";
                  echo "<table border=3>";
                  echo "<th> Numero </th> <th> Data</th>  <th> Grupo Organizador</th>  <th> Documentos</th>";
                 // output data of each row
                 while($row = $result->fetch_assoc()) {
                   echo "<tr>";
                     echo "<td>" ;
                     echo  $row["numero"];
                     echo "</td>";
                     echo "<td>" ;
                     echo $row["data"];
                     echo "</td>";
                     echo "<td>" ;
                     echo $row["grupo_organizador"];
                     echo "</td>";
                     echo "<td>" ;
                     echo $row["documento"];
                     echo "</td>";
                   echo "</tr>";
                 }
             echo "</table>";
             } else {
                 echo "0 results";
             }
             $con->close();
          ?>


           </p>
         </div>
       </div>
     </main>


     <?php
       $cpf = $_GET["cpf"];
      ?>

     <?php include("sidebarDocente.php"); ?>

   </div>
 </body>
</html>


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
           <h1>Visualizar Itens de Pauta</h1>
           <h2>nas suas reuniões</h2>
           <p >

             <?php

             $host     = "localhost";
             $port     = 3306;
             $socket   = "";
             $user     = "root";
             $password = "";
             $dbname   = "labbd";

             $con = new mysqli($host, $user, $password, $dbname, $port, $socket)
                     or die ('Could not connect to the database server' . mysqli_connect_error());

             $sql = "call labbd.consulta_itens('$cpf')";
             $result = $con->query($sql);
             
             if ($result->num_rows > 0) {
                  echo "<br>";
                  echo "<table border=3>";
                  echo "<th> Numero da Reuniao </th> <th> Pauta </th> <th> Data Aprovacao</th>  <th> Texto Descritivo</th>";
                 // output data of each row

                 while($row = $result->fetch_assoc()) {
                   echo "<tr>";
                     echo "<td>" ;
                     echo  $row["numero_reuniao"];
                     echo "</td>";
                     echo "<td>" ;
                     echo $row["pauta"];
                     echo "</td>";
                     echo "<td>" ;
                     echo $row["data_aprovacao"];
                     echo "</td>";
                     echo "<td>" ;
                     echo $row["texto_descritivo"];
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

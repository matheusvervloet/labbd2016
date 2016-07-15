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
       box-shadow: 0px 0px 10px black;
       box-sizing: border-box;
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
     nav ul :hover {
       margin: 1;
     background-color: white;

     }
     nav ul a {
       color: darkgreen;
       text-decoration: none;
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

   <div id="wrapper">

     <main>
       <div id="content">
         <div class="innertube">
           <h2>Deferimento</h2>
           <p>
             <form action="fazDeferimento.php" method="post">

             Calendario(id): <input type="text" name="calendario"/><br>
             Fase: <input type="text" name="fase"/><br>
             <input type="submit" value="Enviar" name="submit">

             </form>

             <?php
             function faz_deferimento(){

                   $host     = "localhost";
                   $port     = 3306;
                   $socket   = "";
                   $user     = "root";
                   $password = "";
                   $dbname   = "labbd";

                   $con = new mysqli($host, $user, $password, $dbname, $port, $socket)
                       or die ('Could not connect to the database server' . mysqli_connect_error());

                       $id_calendario =  $_POST["calendario"];
                       $fase =  $_POST["fase"];
                       $sql = "call procedure_fazDeferimento($fase,$id_calendario);";

                       if ($con->query($sql) === TRUE) {
                     echo "Inserido com sucesso\n";
                 }
                 else {
                     echo "Erro: dados errados";
                 }

                 $sql = "SELECT * FROM labbd.vinscricoesCalendario where fase=$fase and id_calendario=$id_calendario;";
             $result = $con->query($sql);
             echo "<br>";

             echo "<table border=3>";
             echo "<th> RA</th> <th> ano </th>  <th> semestre </th>  <th> Turma</th> <th> nome</th><th> creditos</th><th> fase</th><th> deferimento</th>";
             if ($result->num_rows > 0) {

                 while($row = $result->fetch_assoc()) {
                   echo "<tr>";
                     echo "<td>" ;
                     echo  $row["ra"];
                     echo "</td>";
                     echo "<td>" ;
                     echo $row["ano"];
                     echo "</td>";
                     echo "<td>" ;
                     echo $row["semestre"];
                     echo "</td>";
                     echo "<td>" ;
                     echo $row["Turma"];
                     echo "</td>";
                     echo "<td>" ;
                     echo $row["nome"];
                     echo "</td>";
                     echo "<td>" ;
                     echo $row["creditos"];
                     echo "</td>";
                     echo "<td>" ;
                     echo $row["fase"];
                     echo "</td>";
                     echo "<td>" ;
                     echo $row["deferimento"];
                     echo "</td>";
                   echo "</tr>";
                 }

             }
             echo "</table>";








                 $con->close();
                      

             }

             if(isset($_POST['submit']))
             {
                faz_deferimento();
             }
  ?>



           </p>
         </div>
       </div>
     </main>


<?php include("sidebarAdm.php"); ?>

   </div>
 </body>
</html>

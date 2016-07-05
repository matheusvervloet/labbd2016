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
           <h2>Reconhecimento</h2>
           <p>
             <form action="viewReconhecimento.php" method="post">

             Curso(sigla): <input type="text" name="curso"/><br>
             <input type="submit" value="Enviar" name="submit">

             </form>

             <?php
             function view_reconhecimento(){

                   $host     = "localhost";
                   $port     = 3306;
                   $socket   = "";
                   $user     = "root";
                   $password = "";
                   $dbname   = "labbd";

                   $con = new mysqli($host, $user, $password, $dbname, $port, $socket)
                       or die ('Could not connect to the database server' . mysqli_connect_error());

                       $sigla =  $_POST["curso"];
                       $sql = "SELECT * FROM view_reconhecimento where view_reconhecimento.sigla_curso = '$sigla';";

                       $result = $con->query($sql);
                       echo "<br>";
                       header("Content-Type: text/html; charset=ISO-8859-1",true);


                       if ($result->num_rows > 0) {
                           // output data of each row
                           echo "<table border=3>";
                           echo "<th>Sigla Curso</th> <th>Num Capes</th> <th>Data Inicio</th>";

                           while($row = $result->fetch_assoc()) {
                             echo "<tr>";
                               echo "<td>" ;
                               echo  $row["sigla_curso"];
                               echo "</td>";
                               echo "<td>" ;
                               echo $row["num_capes"];
                               echo "</td>";
                               echo "<td>" ;
                               echo $row["data_inicio"];
                               echo "</td>";
                             echo "</tr>";
                           }

                           echo "</table>";
                       }

                       $con->close();

             }

             if(isset($_POST['submit']))
             {
                view_reconhecimento();
             }
  ?>



           </p>
         </div>
       </div>
     </main>



     <nav id="nav">
       <div class="innertube">
         <h2>Docente</h2>
         <ul><a href= http://localhost/my_site/Index.php>Sair</a></ul>
         <ul><a href= http://localhost/my_site/docenteIndex.php>Home</a></ul>
         <h3>Cadastros</h3>
         <ul>
               <li><a href="http://localhost/my_site/viewReconhecimento.php">Reconhecimento</a></li>

         </ul>
         <h3>Left heading</h3>
         <ul>
           <li><a href="#">Link 1</a></li>
           <li><a href="#">Link 2</a></li>
           <li><a href="#">Link 3</a></li>
           <li><a href="#">Link 4</a></li>
           <li><a href="#">Link 5</a></li>
         </ul>
         <h3>Left heading</h3>
         <ul>
           <li><a href="#">Link 1</a></li>
           <li><a href="#">Link 2</a></li>
           <li><a href="#">Link 3</a></li>
           <li><a href="#">Link 4</a></li>
           <li><a href="#">Link 5</a></li>
         </ul>
       </div>
     </nav>
     
   </div>
 </body>
</html>

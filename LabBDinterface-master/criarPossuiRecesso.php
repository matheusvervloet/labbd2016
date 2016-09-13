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

   <div id="wrapper">

     <main>
       <div id="content">
         <div class="innertube">
           <h1>Cadastrar Recesso</h1>
           <p >
             <form action="criarPossuiRecesso.php" method="post" align=”center”>
             ID Recesso: <input type="number" name="idr" /><br>
             ID Calendario Presencial *se desnecessário deixar em branco:  <input type="number" name="idcp"/><br>
			 ID Calendario EAD *se desnecessário deixar em branco:  <input type="number" name="idce"/><br>
             Tipo:  <input type="radio" name="tipo" value="0" checked> EAD e Presencial<br>
					<input type="radio" name="tipo" value="1"> Apenas presencial<br>
					<input type="radio" name="tipo" value="2"> Apenas EAD<br> 
			 <input type="submit" value="Enviar" name="submit">

             </form>

             <?php
             function inserePossuiRecesso(){

                   $host     = "localhost";
                   $port     = 3306;
                   $socket   = "";
                   $user     = "root";
                   $password = "";
                   $dbname   = "labbd";

                   $con = new mysqli($host, $user, $password, $dbname, $port, $socket)
                       or die ('Could not connect to the database server' . mysqli_connect_error());

                 $idr = $_POST["idr"];
                 $idcp  = $_POST["idcp"];
				 $idce  = $_POST["idce"];
                 $tipo  = $_POST["tipo"];
			
				 settype($idr, "integer");
				 if (isset($idcp))
					settype($idcp, "integer");
				 if (isset($idce))
					settype($idce, "integer");
				 settype($tipo, "integer");
				 
                 $sql = "call labbd.inserePossuiRecesso('$idr', '$idcp', '$idce','$tipo');";
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
                inserePossuiRecesso();
             }

             $host     = "localhost";
             $port     = 3306;
             $socket   = "";
             $user     = "root";
             $password = "";
             $dbname   = "labbd";

             $con = new mysqli($host, $user, $password, $dbname, $port, $socket)
                     or die ('Could not connect to the database server' . mysqli_connect_error());
					 
			 $sql = "SELECT id_recesso, id_presencial FROM possui_recesso_presencial as prp, recesso as r, calendario as c WHERE prp.id_recesso = r.id_recesso AND prp.id_presencial = c.id";
   			 $result = $con->query($sql);
             echo "<br>";

             echo "<table border=3>";
			 echo "<th> ID Recesso Presencial </th> <th> ID Calendario Presencial</th>";

             if ($result->num_rows > 0) {
                 // output data of each row

                 while($row = $result->fetch_assoc()) {
                   echo "<tr>";
                     echo "<td>" ;
                     echo  $row["id_recesso"];
                     echo "</td>";
					 echo "<td>" ;
					 echo $row["id_presencial"];
					 echo "</td>";
					 }
                   echo "</tr>";
                 }

             echo "</table>";
             } else {
                 echo "0 results";
             }
			 
			 // segunda tabela			 
			 			 $sql = "SELECT id_recesso, id_ead FROM possui_recesso_ead as pre, recesso as r, calendario as c WHERE pre.id_recesso = r.id_recesso AND prp.id_ead = c.id";
   			 $result = $con->query($sql);
             echo "<br>";

             echo "<table border=3>";
			 echo "<th> ID Recesso EAD </th> <th> ID Calendario EAD</th>";

             if ($result->num_rows > 0) {
                 // output data of each row

                 while($row = $result->fetch_assoc()) {
                   echo "<tr>";
                     echo "<td>" ;
                     echo  $row["id_recesso"];
                     echo "</td>";
					 echo "<td>" ;
					 echo $row["id_ead"];
					 echo "</td>";
					 }
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

	 <?php include("sidebarAdm.php"); ?>

   </div>
 </body>
</html>

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
           <h1>Procurando Tecnico Administrativo</h1>
           <p >

             <form action="procuraTA.php?cpf=<?php echo $cpf?>" method="post" align=”center”>
             CPF : <input type="text" name="cpf"/><br>
             <input type="submit" value="Enviar" name="submit">

             </form>

             <?php
             function mostraInfoTA(){
                  $cpf_p = $_POST["cpf"];
                   $host     = "localhost";
                   $port     = 3306;
                   $socket   = "";
                   $user     = "root";
                   $password = "";
                   $dbname   = "labbd";

                   $con = new mysqli($host, $user, $password, $dbname, $port, $socket)
                       or die ('Could not connect to the database server' . mysqli_connect_error());

                 if($cpf = "")
				 {
					 $sql = "SELECT * FROM labbd.ta_existente";
				 }
                 else 
				 {
					$sql = "call labbd.consulta_ta('$cpf')";
				 }
                 header("Content-Type: text/html; charset=ISO-8859-1",true);

                if ($con->query($sql) === TRUE) {
                     echo "Técnicos(as) encontrados(as)!";
					}
                 else 	{
                     echo "Erro: dados errados ou técnico inexistente";
						}

                 $con->close();
             }

             if(isset($_POST['submit']))
             {
                mostraInfoTA();
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

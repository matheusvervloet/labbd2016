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
           <h1>Dados Pessoais</h1>
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

             $sql = "select * from vdadospessoaisaluno where cpf='$cpf';";
             $result =$con->query($sql); 
             $row = $result->fetch_assoc();

             echo "<br>";
         
             
                    	 echo "Cpf: ";
		     echo  $row["cpf"];
		     echo "<br>";
		     
			echo "Nome: ";
		     echo  $row["prenome"];
			echo " ";
		     echo  $row["nome_meio"];
			echo " ";
	             echo  $row["sobrenome"];
		     echo "<br>";
			
			echo "Nome da mae: ";
		     echo  $row["nome_da_mae"];
		     echo "<br>";
			
			echo "Nome do pai: ";
		     echo  $row["nome_do_pai"];
		     echo "<br>";
			
			echo "Pais: ";
		     echo  $row["pais"];
		     echo "<br>";
			
			echo "UF: ";
		     echo  $row["uf"];
		     echo "<br>";

			echo "Data Nascimento: ";
		     echo  $row["data_nascimento"];
		     echo "<br>";

			echo "Ano Ingresso: ";
		     echo  $row["ano_ingresso"];
		     echo "<br>";

			echo "Sexo: ";
		     echo  $row["sexo"];
		     echo "<br>";

			echo "Cor: ";
		     echo  $row["cor"];
		     echo "<br>";
		
			echo "Reenquadramento: ";
		     echo  $row["reenquadramento"];
		     echo "<br>";

			echo "RA: ";
		     echo  $row["ra"];
		     echo "<br>";

			echo "Conclusao em nome: ";
		     echo  $row["conclusao_em_nome"];
		     echo "<br>";

			echo "Conclusao em ano: ";
		     echo  $row["conclusao_em_ano"];
		     echo "<br>";

			echo "IRA: ";
		     echo  $row["IRA"];
		     echo "<br>";
                    
                    
                 


             $con->close();
          ?>


           </p>
         </div>
       </div>
     </main>


     <?php
       $cpf = $_GET["cpf"];
      ?>

     <?php include("sidebarAluno.php"); ?>

   </div>
 </body>
</html>

<!DOCTYPE html>
 <!-- MODIFICAR OS DADOS NAS LINHAS COMENTADAS -->
 <html>
 	<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
 		<title>Sistema de Controle Academico &mdash; Cadastrar Visita</title>
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
 				margin-left: 230px; 
 			}
 			.innertube{
 				margin: 15px;
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
 						<h1>Cadastrar Visita</h1>
 						<p>
						      <form action="criarVisita.php" method="post">
						      Data: <input type="date" name="data"/><br> 
						      Numero Capes: <input type="text" name="num_capes"/><br> 
						      <input type="submit" value="Enviar" name="submit">
						      </form>

						      <?php
						      function insereVisita(){ //modificar nome dessa funcao, lembrar de mudar abaixo tambem

							    $host     = "localhost";
							    $port     = 3306;
							    $socket   = "";
							    $user     = "root";
							    $password = "";
							    $dbname   = "labbd";

							    $con = new mysqli($host, $user, $password, $dbname, $port, $socket)
								or die ('Could not connect to the database server' . mysqli_connect_error());
							  $data = $_POST["data"]; 
							  $num_capes  = $_POST["num_capes"];
							  $sql = "call labbd.insereVisita('$data', '$num_capes');";

							  header("Content-Type: text/html; charset=ISO-8859-1",true);

							 if ($con->query($sql) === TRUE) {
							      echo "Inserido com sucesso";
							  }
							  else {
							      echo "Erro: dados errados";
							      echo $con->query($sql);
							  }

							  $con->close();
						      }

						      if(isset($_POST['submit']))
						      {
								 insereVisita(); //dispara funcao criada acima
						      }

						      $host     = "localhost";
						      $port     = 3306;
						      $socket   = "";
						      $user     = "root";
						      $password = "";
						      $dbname   = "labbd";

						      $con = new mysqli($host, $user, $password, $dbname, $port, $socket)
							      or die ('Could not connect to the database server' . mysqli_connect_error());
						      $sql = "SELECT * FROM visita"; 
						      $result = $con->query($sql);
						      echo "<br>";
						      echo "<table border=3>";
						      echo "<th> ID visita </th> <th> Data </th> <th> Numero Capes </th>"; //atributos da tabela
						      if ($result->num_rows > 0) {

							  while($row = $result->fetch_assoc()) {
							    echo "<tr>";
							      echo "<td>" ;
							      echo  $row["id_visita"]; //nomes dos atributos
							      echo "</td>";
							      echo "<td>" ;
							      echo $row["data"]; //nomes dos atributos
							      echo "</td>";
							      echo "<td>" ;
							      echo $row["num_capes"]; //nomes dos atributos
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
      <?php include("sidebarAdm.php"); ?>
    </div>
  </body>
 </html>

 <!DOCTYPE html>
 <!-- MODIFICAR OS DADOS NAS LINHAS COMENTADAS -->
 <html>
 	<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
 		<title>Sistema de Controle Academico &mdash; Criar Decisoes Aprovadas</title>
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
 						<h1>Cadastrar Decisoes Aprovadas</h1>
 						<p>
						      <form action="criarDecisoesAprovadas.php" method="post">
						      ID Itens de Pauta: <input type="text" name="id_itens_de_pauta"/><br>
							  Decisoes Aprovadas <input type="text" name="decisoes_aprovadas"/><br>

						      <input type="submit" value="Enviar" name="submit">
						      </form>

						      <?php
						      function insereDecisoesAprovadas(){ //modificar nome dessa funcao, lembrar de mudar abaixo tambem

							    $host     = "localhost";
							    $port     = 3306;
							    $socket   = "";
							    $user     = "root";
							    $password = "";
							    $dbname   = "labbd";

							    $con = new mysqli($host, $user, $password, $dbname, $port, $socket)
								or die ('Could not connect to the database server' . mysqli_connect_error());
							  $id_itens_de_pauta = $_POST["id_itens_de_pauta"];
							  $decisoes_aprovadas = $_POST["decisoes_aprovadas"];
							  $sql = "call labbd.insereDecisoes_aprovadas('$id_itens_de_pauta', '$decisoes_aprovadas');";

							  header("Content-Type: text/html; charset=ISO-8859-1",true);

							 if ($con->query($sql) === TRUE) {
							      echo "Inserido com sucesso";
							  }
							  else {
							      echo "Erro: dados errados";
							  }

							  $con->close();
						      }

						      if(isset($_POST['submit']))
						      {
								 insereDecisoesAprovadas(); //dispara funcao criada acima
						      }

						      $host     = "localhost";
						      $port     = 3306;
						      $socket   = "";
						      $user     = "root";
						      $password = "";
						      $dbname   = "labbd";

						      $con = new mysqli($host, $user, $password, $dbname, $port, $socket)
							      or die ('Could not connect to the database server' . mysqli_connect_error());
						      $sql = "SELECT * FROM decisoes_aprovadas"; 
						      $result = $con->query($sql);
						      echo "<br>";
						      echo "<table border=3>";
						      echo "<th> Id Itens de Pauta </th> <th> Decisoes Aprovadas </th>"; //atributos da tabela
						      if ($result->num_rows > 0) {

							  while($row = $result->fetch_assoc()) {
							    echo "<tr>";
							      echo "<td>" ;
							      echo  $row["id_itens_de_pauta"]; //nomes dos atributos
							      echo "</td>";
							      echo "<td>" ;
							      echo $row["decisoes_aprovadas"]; //nomes dos atributos
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

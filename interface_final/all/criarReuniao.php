  						<h1>Cadastrar Reuniao</h1>
 						<p>
						      <form method="post">
						      Numero: <input type="text" name="numero"/><br>
						      CPF: <input type="text" name="cpf"/><br>
						      data: <input type="date" name="data"/><br>
						      Grupo Organizador: <input type="text" name="grupo_organizador"/><br>
						      documento: <input type="text" name="documento"/><br>
						      <input type="submit" value="Enviar" name="submit">
						      </form>

						      <?php
						      function insereReuniao(){ //modificar nome dessa funcao, lembrar de mudar abaixo tambem

							    $host     = "localhost";
							    $port     = 3306;
							    $socket   = "";
							    $user     = "root";
							    $password = "";
							    $dbname   = "labbd";

							    $con = new mysqli($host, $user, $password, $dbname, $port, $socket)
								or die ('Could not connect to the database server' . mysqli_connect_error());
							  $numero = $_POST["numero"];
							  $cpf = $_POST["cpf"];
							  $data = $_POST["data"];
							  $grupo_organizador = $_POST["grupo_organizador"];
							  $documento = $_POST["documento"];
							  $sql = "call labbd.insereReuniao($numero, '$cpf', '$data', '$grupo_organizador', '$documento');";

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
								 insereReuniao(); //dispara funcao criada acima
						      }

						      $host     = "localhost";
						      $port     = 3306;
						      $socket   = "";
						      $user     = "root";
						      $password = "";
						      $dbname   = "labbd";

						      $con = new mysqli($host, $user, $password, $dbname, $port, $socket)
							      or die ('Could not connect to the database server' . mysqli_connect_error());
						      $sql = "SELECT * FROM reuniao"; 
						      $result = $con->query($sql);
						      echo "<br>";
						      echo "<table border=3>";
						      echo "<th> Numero </th> <th> CPF </th> <th> Data </th> <th> Grupo Organizador </th> <th> Documento </th>"; //atributos da tabela
						      if ($result->num_rows > 0) {

							  while($row = $result->fetch_assoc()) {
							    echo "<tr>";
							      echo "<td>" ;
							      echo  $row["numero"]; //nomes dos atributos
							      echo "</td>";
							      echo "<td>" ;
							      echo $row["cpf"]; //nomes dos atributos
							      echo "</td>";
							      echo "<td>" ;
							      echo $row["data"]; //nomes dos atributos
							      echo "</td>";
							      echo "<td>" ;
							      echo $row["grupo_organizador"]; //nomes dos atributos
							      echo "</td>";
							      echo "<td>" ;
							      echo $row["documento"]; //nomes dos atributos
							      echo "</td>";	
$table='reuniao';
	$id_name='numero';
		echo '<td><a href="delete.php?table='.$table.'&id_name='.$id_name.'&id='.$row[$id_name].'">Delete</a></td>';
							    echo "</tr>";
							  }

						      echo "</table>";
						      } else {
							  echo "0 results";
						      }
						      $con->close();
						   ?>
            					</p>

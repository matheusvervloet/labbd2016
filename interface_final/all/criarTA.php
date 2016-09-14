  						<h1>Tecnico Administrativo</h1> <! colocar nome da tabela >
 						<p>
								<form method="post"> <! mesmo nome deste arquivo, respectivo a tabela > 
								 Cpf:  <input type="text" name="cpf"/><br>
								 Nome: <input type="text" name="nome"/><br>
								 Nome do meio: <input type="text" name="nome_meio"/><br>
								 Sobrenome: <input type="text" name="sobrenome"/><br>
								 <input type="submit" value="Cadastrar" name="submit">
						      </form>

						      <?php
						      function insereTA(){ //modificar nome dessa funcao, lembrar de mudar abaixo tambem

							    $host     = "localhost";
							    $port     = 3306;
							    $socket   = "";
							    $user     = "root";
							    $password = "";
							    $dbname   = "labbd";

							    $con = new mysqli($host, $user, $password, $dbname, $port, $socket)
								or die ('Could not connect to the database server' . mysqli_connect_error());

								$cpf_p = $_POST["cpf"];
								$nome_p  = $_POST["nome"];
								$nome_meio_p  = $_POST["nome_meio"];
								$sobrenome_p  = $_POST["sobrenome"];

								$sql = "call labbd.insereTA($cpf_p, '$nome_p', '$nome_meio_p', '$sobrenome_p')";

							  header("Content-Type: text/html; charset=ISO-8859-1",true);

							 if ($con->query($sql) === TRUE) {
							      echo "Cadastrado com sucesso";
							  }
							  else {
							      echo "Erro: dados errados";
							  }

							  $con->close();
						      }

						      if(isset($_POST['submit']))
						      {
								insereTA(); //dispara funcao criada acima
						      }

						      $host     = "localhost";
						      $port     = 3306;
						      $socket   = "";
						      $user     = "root";
						      $password = "";
						      $dbname   = "labbd";

						      $con = new mysqli($host, $user, $password, $dbname, $port, $socket)
							      or die ('Could not connect to the database server' . mysqli_connect_error());
						      $sql = "SELECT * FROM labbd.ta_existente"; //select nos dados da tabela para esta funcao
						      $result = $con->query($sql);
						      echo "<br>";

						      echo "<table border=3>";
						      echo "<th> Nome </th> <th> Nome do Meio </th> <th> Sobrenome </th> <th> CPF </th>"; //atributos da tabela
						      if ($result->num_rows > 0) {

							  while($row = $result->fetch_assoc()) {
							    echo "<tr>";
							      echo "<td>" ;
							      echo  $row["pre_nome"]; //nomes dos atributos
							      echo "</td>";
							      echo "<td>" ;
							      echo $row["nome_meio"]; //nomes dos atributos
							      echo "</td>";
								  echo "<td>" ;
							      echo $row["sobrenome"]; //nomes dos atributos
							      echo "</td>";
								  echo "<td>" ;
							      echo $row["cpf"]; //nomes dos atributos
							      echo "</td>";	
$table='ta';
	$id_name='cpf';
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

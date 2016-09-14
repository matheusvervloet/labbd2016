
 						<h1>Cadastrar Item do Formulario</h1>
 						<p>
						      <form method="post">
						      Numero Capes: <input type="text" name="num_capes"/><br>
						      Numero Item: <input type="text" name="num_item"/><br>
						      Descricao: <input type="text" name="descricao"/><br>
						      Fase: <input type="text" name="fase"/><br>
						      Dados: <input type="text" name="dados"/><br>
						      Resultado: <input type="text" name="resultado"/><br>
						      <input type="submit" value="Enviar" name="submit">
						      </form>

						      <?php
						      function insereItemDoFormulario(){ //modificar nome dessa funcao, lembrar de mudar abaixo tambem

							    $host     = "localhost";
							    $port     = 3306;
							    $socket   = "";
							    $user     = "root";
							    $password = "";
							    $dbname   = "labbd";

							    $con = new mysqli($host, $user, $password, $dbname, $port, $socket)
								or die ('Could not connect to the database server' . mysqli_connect_error());
							  $num_capes = $_POST["num_capes"];
							  $num_item = $_POST["num_item"];
							  $descricao = $_POST["descricao"];
							  $fase = $_POST["fase"];
							  $dados = $_POST["dados"];
							  $resultado = $_POST["resultado"]; 
							  $sql = "call labbd.insereItemDoFormulario('$num_capes', '$num_item', '$descricao', '$fase', '$dados', '$resultado');";

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
								 insereItemDoFormulario(); //dispara funcao criada acima
						      }

						      $host     = "localhost";
						      $port     = 3306;
						      $socket   = "";
						      $user     = "root";
						      $password = "";
						      $dbname   = "labbd";

						      $con = new mysqli($host, $user, $password, $dbname, $port, $socket)
							      or die ('Could not connect to the database server' . mysqli_connect_error());
						      $sql = "SELECT * FROM item_do_formulario"; 
						      $result = $con->query($sql);
						      echo "<br>";
						      echo "<table border=3>";
						      echo "<th> Numero Capes </th> <th> Numero Item </th> <th> Descricao </th> <th> Fase </th> <th> Dados </th> <th> Resultado </th>"; //atributos da tabela
						      if ($result->num_rows > 0) {

							  while($row = $result->fetch_assoc()) {
							    echo "<tr>";
							      echo "<td>" ;
							      echo  $row["num_capes"]; //nomes dos atributos
							      echo "</td>";
							      echo "<td>" ;
							      echo $row["num_item"]; //nomes dos atributos
							      echo "</td>";
							      echo "<td>" ;
							      echo $row["descricao"]; //nomes dos atributos
							      echo "</td>";
							      echo "<td>" ;
							      echo $row["fase"]; //nomes dos atributos
							      echo "</td>";
							      echo "<td>" ;
							      echo $row["dados"]; //nomes dos atributos
							      echo "</td>";
							      echo "<td>" ;
							      echo $row["resultado"]; //nomes dos atributos
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

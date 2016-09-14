
 						<h1>Cadastrar Decisoes Aprovadas</h1>
 						<p>
						      <form method="post">
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

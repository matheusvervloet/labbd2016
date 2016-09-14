
 						<h1>Cadastrar Visita</h1>
 						<p>
						      <form  method="post">
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

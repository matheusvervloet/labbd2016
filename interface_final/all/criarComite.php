
 						<h1>Cadastrar comite</h1>
 						<p>
						      <form method="post">
						      Id Visita: <input type="text" name="id_visita"/><br>
						      Prenome: <input type="text" name="prenome"/><br> 
						      Nome do meio: <input type="text" name="nome_do_meio"/><br> 
						      Sobrenome: <input type="text" name="sobrenome"/><br> 
						      <input type="submit" value="Enviar" name="submit">
						      </form>

						      <?php
						      function insereComite(){ //modificar nome dessa funcao, lembrar de mudar abaixo tambem

							    $host     = "localhost";
							    $port     = 3306;
							    $socket   = "";
							    $user     = "root";
							    $password = "";
							    $dbname   = "labbd";

							    $con = new mysqli($host, $user, $password, $dbname, $port, $socket)
								or die ('Could not connect to the database server' . mysqli_connect_error());
							  $id_visita = $_POST["id_visita"];
							  $prenome = $_POST["prenome"]; 
							  $nome_do_meio  = $_POST["nome_do_meio"];
							  $sobrenome = $_POST["sobrenome"];
							  $sql = "call labbd.insereComite('$id_visita', '$prenome', '$nome_do_meio', '$sobrenome');";

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
								 insereComite(); //dispara funcao criada acima
						      }

						      $host     = "localhost";
						      $port     = 3306;
						      $socket   = "";
						      $user     = "root";
						      $password = "";
						      $dbname   = "labbd";

						      $con = new mysqli($host, $user, $password, $dbname, $port, $socket)
							      or die ('Could not connect to the database server' . mysqli_connect_error());
						      $sql = "SELECT * FROM comite"; 
						      $result = $con->query($sql);
						      echo "<br>";
						      echo "<table border=3>";
						      echo "<th> ID visita </th> <th> Prenome </th> <th> Nome do Meio </th> <th> Sobrenome </th>"; //atributos da tabela
						      if ($result->num_rows > 0) {

							  while($row = $result->fetch_assoc()) {
							    echo "<tr>";
							      echo "<td>" ;
							      echo  $row["id_visita"]; //nomes dos atributos
							      echo "</td>";
							      echo "<td>" ;
							      echo $row["prenome"]; //nomes dos atributos
							      echo "</td>";
							      echo "<td>" ;
							      echo $row["nome_do_meio"]; //nomes dos atributos
							      echo "</td>";
							      echo "<td>" ;
							      echo $row["sobrenome"]; //nomes dos atributos
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

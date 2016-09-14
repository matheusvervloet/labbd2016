 						<h1>Faz Prova</h1> <! colocar nome da tabela >
 						<p>
						      <form method="post"> <! mesmo nome deste arquivo, respectivo a tabela > 
						      Nota: <input type="text" name="nota"/><br> <! modificar nome dos atributos para atributos da tabela >
						      Data: <input type="text" name="data_dia"/><br> <! modificar nome dos atributos para atributos da tabela >
							  CPF: <input type="text" name="cpf"/><br> <! modificar nome dos atributos para atributos da tabela >
						      <input type="submit" value="Enviar" name="submit">
						      </form>

						      <?php
						      function insereProva(){ //modificar nome dessa funcao, lembrar de mudar abaixo tambem

							    $host     = "localhost";
							    $port     = 3306;
							    $socket   = "";
							    $user     = "root";
							    $password = "";
							    $dbname   = "labbd";

							    $con = new mysqli($host, $user, $password, $dbname, $port, $socket)
								or die ('Could not connect to the database server' . mysqli_connect_error());

							  $nota = $_POST["nota"]; //colocar atributos aqui, serao transformados em variaveis
							  $data  = $_POST["data_dia"]; //colocar atributos aqui, serao transformados em variaveis
							  $cpf  = $_POST["cpf"];
							  $sql = "call labbd.insereFazprova('$data','$cpf', '$nota');"; //chamada da procedure para esta pagina

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
							 insereProva(); //dispara funcao criada acima
						      }

						      $host     = "localhost";
						      $port     = 3306;
						      $socket   = "";
						      $user     = "root";
						      $password = "";
						      $dbname   = "labbd";

						      $con = new mysqli($host, $user, $password, $dbname, $port, $socket)
							      or die ('Could not connect to the database server' . mysqli_connect_error());
						      $sql = "SELECT * FROM vfazprova"; //select nos dados da tabela para esta funcaosdf
						      $result = $con->query($sql);
						      echo "<br>";

						      echo "<table border=3>";
						      echo "<th> Nota </th> <th> Data </th> <th> CPF </th>"; //atributos da tabela
						      if ($result->num_rows > 0) {

							  while($row = $result->fetch_assoc()) {
							    echo "<tr>";
							      echo "<td>" ;
							      echo  $row["nota"]; //nomes dos atributos
							      echo "</td>";
							      echo "<td>" ;
							      echo $row["dta"]; //nomes dos atributos
							      echo "</td>";
								  echo "<td>" ;
							      echo $row["cpf"]; //nomes dos atributos
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

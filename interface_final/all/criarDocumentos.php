
 						<h1>Documentos</h1> <! colocar nome da tabela >
 						<p>
						      <form method="post"> <! mesmo nome deste arquivo, respectivo a tabela > 
						      Id do item: <input type="text" name="id"/><br> <! modificar nome dos atributos para atributos da tabela >
						      Documento: <input type="text" name="dco"/><br> <! modificar nome dos atributos para atributos da tabela >
						      <input type="submit" value="Enviar" name="submit">
						      </form>

						      <?php
						      function insereDco(){ //modificar nome dessa funcao, lembrar de mudar abaixo tambem

							    $host     = "localhost";
							    $port     = 3306;
							    $socket   = "";
							    $user     = "root";
							    $password = "";
							    $dbname   = "labbd";

							    $con = new mysqli($host, $user, $password, $dbname, $port, $socket)
								or die ('Could not connect to the database server' . mysqli_connect_error());

							  $id = $_POST["id"]; //colocar atributos aqui, serao transformados em variaveis
							  $dco  = $_POST["dco"]; //colocar atributos aqui, serao transformados em variaveis
							  $sql = "call labbd.insereDocumentos('$id', '$dco');"; //chamada da procedure para esta pagina

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
							 insereDco(); //dispara funcao criada acima
						      }

						      $host     = "localhost";
						      $port     = 3306;
						      $socket   = "";
						      $user     = "root";
						      $password = "";
						      $dbname   = "labbd";

						      $con = new mysqli($host, $user, $password, $dbname, $port, $socket)
							      or die ('Could not connect to the database server' . mysqli_connect_error());
						      $sql = "SELECT * FROM vdocumentos"; //select nos dados da tabela para esta funcao
						      $result = $con->query($sql);
						      echo "<br>";

						      echo "<table border=3>";
						      echo "<th> ID do Item </th> <th> Documento </th>"; //atributos da tabela
						      if ($result->num_rows > 0) {

							  while($row = $result->fetch_assoc()) {
							    echo "<tr>";
							      echo "<td>" ;
							      echo  $row["id"]; //nomes dos atributos
							      echo "</td>";
							      echo "<td>" ;
							      echo $row["dco"]; //nomes dos atributos
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

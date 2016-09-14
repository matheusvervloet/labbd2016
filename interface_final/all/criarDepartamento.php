
 						<h1>Cadastrar Departamento</h1>
 						<p>
              <form method="post">
              Sigla: <input type="text" name="sigla"/><br>
              Nome:  <input type="text" name="nome"/><br>
              <input type="submit" value="Enviar" name="submit">

              </form>

              <?php
              function insereDepartamento(){

                    $host     = "localhost";
                    $port     = 3306;
                    $socket   = "";
                    $user     = "root";
                    $password = "";
                    $dbname   = "labbd";

                    $con = new mysqli($host, $user, $password, $dbname, $port, $socket)
                        or die ('Could not connect to the database server' . mysqli_connect_error());

                  $sigla = $_POST["sigla"];
                  $nome  = $_POST["nome"];
                  $sql = "call labbd.insereDepartamento('$sigla', '$nome');";

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
                 insereDepartamento();
              }

              $host     = "localhost";
              $port     = 3306;
              $socket   = "";
              $user     = "root";
              $password = "";
              $dbname   = "labbd";

              $con = new mysqli($host, $user, $password, $dbname, $port, $socket)
                      or die ('Could not connect to the database server' . mysqli_connect_error());
              $sql = "SELECT sigla,nome FROM departamento";
              $result = $con->query($sql);
              echo "<br>";

              echo "<table border=3>";
              echo "<th> Sigla </th> <th>Nome</th>";
              if ($result->num_rows > 0) {
                  // output data of each row

                  while($row = $result->fetch_assoc()) {
                    echo "<tr>";
                      echo "<td>" ;
                      echo  $row["sigla"];
                      echo "</td>";
                      echo "<td>" ;
                      echo $row["nome"];
                      echo "</td>";	
$table='departamento';
	$id_name='sigla';
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

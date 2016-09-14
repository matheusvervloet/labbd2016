
           <h1>Cadastrar Disciplina</h1>
           <p>
             <form method="post">
             Sigla: <input type="text" name="sigla"/><br>
             Nome:  <input type="text" name="nome"/><br>
             Ementa: <input type="text" name="ementa"/><br>
             Creditos: <input type="text" name="creditos"/><br>
             Departamento: <input type="text" name="departamento"/><br>
             <input type="submit" value="Enviar" name="submit">

             </form>

             <?php
             function insereDisciplina(){

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
                 $ementa = $_POST["ementa"];
                 $creditos = $_POST["creditos"];
                 $departamento = $_POST["departamento"];
                 $sql = "call labbd.insereDisciplina('$sigla', '$nome', '$ementa', '$creditos', '$departamento');";

                if ($con->query($sql) === TRUE) {
                     echo "Inserido com sucesso\n";
                 }
                 else {
                     echo "Erro: dados errados";
                 }

                 $con->close();
             }

             if(isset($_POST['submit']))
             {
                insereDisciplina();
             }

             $host     = "localhost";
             $port     = 3306;
             $socket   = "";
             $user     = "root";
             $password = "";
             $dbname   = "labbd";

             $con = new mysqli($host, $user, $password, $dbname, $port, $socket)
                     or die ('Could not connect to the database server' . mysqli_connect_error());
             $sql = "SELECT * FROM disciplina order by disciplina.sigla";
             $result = $con->query($sql);
             header("Content-Type: text/html; charset=ISO-8859-1",true);
             echo "<br>";

             echo "<table border=3>";
             echo "<th> Sigla </th> <th>Nome</th>  <th>Ementa</th> <th>Creditos</th> <th>Departamento</th>";
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
                     echo "<td>" ;
                     echo $row["ementa"];
                     echo "</td>";
                     echo "<td>" ;
                     echo $row["creditos"];
                     echo "</td>";
                     echo "<td>" ;
                     echo $row["sigla_depto"];
                     echo "</td>";	
$table='disciplina';
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

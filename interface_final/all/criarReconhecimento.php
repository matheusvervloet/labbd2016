
           <h1>Cadastrar Reconhecimento</h1>
           <p>
             <form method="post">
               Numero Capes: <input type="text" name="num_capes"/><br>
               Curso(sigla): <input type="text" name="sigla"/><br>
               Data Inicio: <input type="text" name="data_ini"/><br>

             <input type="submit" value="Enviar" name="submit">

             </form>

             <?php
             function insereReconhecimento(){

                   $host     = "localhost";
                   $port     = 3306;
                   $socket   = "";
                   $user     = "root";
                   $password = "";
                   $dbname   = "labbd";

                   $con = new mysqli($host, $user, $password, $dbname, $port, $socket)
                       or die ('Could not connect to the database server' . mysqli_connect_error());

                 $num_capes=  $_POST["num_capes"];
                 $sigla_curso=  $_POST["sigla"];
                 $data_inicio=  $_POST["data_ini"];

                 $sql = "labbd.insereReconhecimento($num_capes, $sigla_curso, $data_inicio);";
                 header("Content-Type: text/html; charset=ISO-8859-1",true);

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
             $sql = "SELECT * FROM reconhecimento";
             $result = $con->query($sql);
             echo "<br>";

             echo "<table border=3>";
             echo "<th> Numero Capes </th> <th>Curso</th> <th>Data Inicial</th>";
             if ($result->num_rows > 0) {
                 // output data of each row

                 while($row = $result->fetch_assoc()) {
                   echo "<tr>";
                     echo "<td>" ;
                     echo  $row["num_capes"];
                     echo "</td>";
                     echo "<td>" ;
                     echo $row["sigla_curso"];
                     echo "</td>";
                     echo "<td>" ;
                     echo $row["data_inicio"];
                     echo "</td>";	
$table='reconhecimento';
	$id_name='num_capes';
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

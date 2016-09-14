
           <h1>Cadastrar Curso</h1>
           <p >
             <form method="post" align=”center”>
             Sigla: <input type="text" name="sigla" /><br>
             CA:  <input type="text" name="ca"/><br>
             Nome:  <input type="text" name="nome"/><br>
             Créditos Máximos:  <input type="text" name="crd_max"/><br>
             Créditos Minimos:  <input type="text" name="crd_min"/><br>
             <input type="submit" value="Enviar" name="submit">

             </form>

             <?php
             function insereCurso(){

                   $host     = "localhost";
                   $port     = 3306;
                   $socket   = "";
                   $user     = "root";
                   $password = "";
                   $dbname   = "labbd";

                   $con = new mysqli($host, $user, $password, $dbname, $port, $socket)
                       or die ('Could not connect to the database server' . mysqli_connect_error());

                 $sigla = $_POST["sigla"];
                 $ca  = $_POST["ca"];
                 $nome  = $_POST["nome"];
                 $max_creditos = $_POST["crd_max"];
                 $min_creditos = $_POST["crd_min"];
                 $sql = "call labbd.insereCurso('$sigla', '$ca','$nome', '$max_creditos', '$min_creditos');";
                 header("Content-Type: text/html; charset=ISO-8859-1",true);

                if ($con->query($sql) === TRUE) {
                     echo "Inserido com sucesso.";
                 }
                 else {
                     echo "Erro: dados errados";
                 }

                 $con->close();
             }

             if(isset($_POST['submit']))
             {
                insereCurso();
             }

             $host     = "localhost";
             $port     = 3306;
             $socket   = "";
             $user     = "root";
             $password = "";
             $dbname   = "labbd";

             $con = new mysqli($host, $user, $password, $dbname, $port, $socket)
                     or die ('Could not connect to the database server' . mysqli_connect_error());
             $sql = "SELECT * FROM curso";
             $result = $con->query($sql);
             echo "<br>";

             echo "<table border=3>";
             echo "<th> Sigla </th> <th> Ca</th>  <th> Nome Curso</th>  <th> Créditos Max</th> <th> Créditos Min</th>";
             if ($result->num_rows > 0) {
                 // output data of each row

                 while($row = $result->fetch_assoc()) {
                   echo "<tr>";
                     echo "<td>" ;
                     echo  $row["sigla"];
                     echo "</td>";
                     echo "<td>" ;
                     echo $row["sigla_ca"];
                     echo "</td>";
                     echo "<td>" ;
                     echo $row["nome"];
                     echo "</td>";
                     echo "<td>" ;
                     echo $row["max_creditos"];
                     echo "</td>";
                     echo "<td>" ;
                     echo $row["min_creditos"];
                     echo "</td>";	
$table='curso';
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


           <h1>Cadastrar Recesso</h1>
           <p >
             <form method="post" align=”center”>
             Data Ínicio: <input type="date" name="dinicio" /><br>
             Data Fim:  <input type="date" name="dfim"/><br>
             Nome:  <input type="text" name="nome"/><br>
             Campus:  <input type="text" name="campus"/><br>
             Tipo:  <input type="text" name="tipo"/><br>
             <input type="submit" value="Enviar" name="submit">

             </form>

             <?php
             function insereRecesso(){

                   $host     = "localhost";
                   $port     = 3306;
                   $socket   = "";
                   $user     = "root";
                   $password = "";
                   $dbname   = "labbd";

                   $con = new mysqli($host, $user, $password, $dbname, $port, $socket)
                       or die ('Could not connect to the database server' . mysqli_connect_error());

                 $dinicio = $_POST["dinicio"];
                 $dfim  = $_POST["dfim"];
                 $nome  = $_POST["nome"];
                 $campus = $_POST["campus"];
                 $tipo = $_POST["tipo"];
                 $sql = "call labbd.insereRecesso('$dinicio', '$dfim', '$campus','$nome', '$tipo');";
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
                insereRecesso();
             }

             $host     = "localhost";
             $port     = 3306;
             $socket   = "";
             $user     = "root";
             $password = "";
             $dbname   = "labbd";

             $con = new mysqli($host, $user, $password, $dbname, $port, $socket)
                     or die ('Could not connect to the database server' . mysqli_connect_error());
             $sql = "SELECT * FROM recesso";
             $result = $con->query($sql);
             echo "<br>";

             echo "<table border=3>";
             echo "<th> Data Inicio</th>  <th> Data Fim</th> <th> Campus </th> <th> Nome</th> <th> Tipo</th>";
             if ($result->num_rows > 0) {
                 // output data of each row

                 while($row = $result->fetch_assoc()) {
                   echo "<tr>";
                     echo "<td>" ;
                     echo  $row["data_inicio"];
                     echo "</td>";
                     echo "<td>" ;
                     echo $row["data_fim"];
                     echo "</td>";
                     echo "<td>" ;
                     echo $row["campus"];
                     echo "</td>";
                     echo "<td>" ;
                     echo $row["nome"];
                     echo "</td>";
                     echo "<td>" ;
                     echo $row["tipo"];
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

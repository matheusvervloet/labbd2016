
           <h1>Cadastrar Atividade Administrativa</h1>
           <p >
             <form method="post" align=”center”>
             Nome: <input type="text" name="nome" /><br>
             Responsavel:  <input type="text" name="resp"/><br>
             Data Inicio:  <input type="date" name="dini"/><br>
             Data Fim:  <input type="date" name="dfim"/><br>
             <input type="submit" value="Enviar" name="submit">

             </form>

             <?php
             function insereAtivAdm(){

                   $host     = "localhost";
                   $port     = 3306;
                   $socket   = "";
                   $user     = "root";
                   $password = "";
                   $dbname   = "labbd";

                   $con = new mysqli($host, $user, $password, $dbname, $port, $socket)
                       or die ('Could not connect to the database server' . mysqli_connect_error());

                 $nome = $_POST["nome"];
                 $resp  = $_POST["resp"];
                 $dini  = $_POST["dini"];
                 $dfim = $_POST["dfim"];
                 $sql = "call labbd.insereAtivAdm('$nome', '$resp','$dini', '$dfim');";
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
                insereAtivAdm();
             }

             $host     = "localhost";
             $port     = 3306;
             $socket   = "";
             $user     = "root";
             $password = "";
             $dbname   = "labbd";

             $con = new mysqli($host, $user, $password, $dbname, $port, $socket)
                     or die ('Could not connect to the database server' . mysqli_connect_error());
             $sql = "SELECT * FROM atividade_administrativa";
             $result = $con->query($sql);
             echo "<br>";

             echo "<table border=3>";
             echo "<th> Nome </th> <th> Responsavel</th>  <th> Data Inicio</th>  <th> Data Fim</th>";
             if ($result->num_rows > 0) {
                 // output data of each row

                 while($row = $result->fetch_assoc()) {
                   echo "<tr>";
                     echo "<td>" ;
                     echo  $row["nome"];
                     echo "</td>";
                     echo "<td>" ;
                     echo $row["responsavel"];
                     echo "</td>";
                     echo "<td>" ;
                     echo $row["data_inicio"];
                     echo "</td>";
                     echo "<td>" ;
                     echo $row["data_fim"];
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


           <h1>Invervencao</h1>
           <p >
             <form method="post" align=”center”>
             ID Itens de Pauta: <input type="text" name="id_idp" /><br>
             CPF:  <input type="text" name="cpf"/><br>
             DataHora:  <input type="date" name="data_hora"/><br>
             Descricao:  <input type="text" name="descricao"/><br>
             <input type="submit" value="Enviar" name="submit">

             </form>

             <?php
             function insereIntervencao(){
                   $host     = "localhost";
                   $port     = 3306;
                   $socket   = "";
                   $user     = "root";
                   $password = "";
                   $dbname   = "labbd";
                   $con = new mysqli($host, $user, $password, $dbname, $port, $socket)
                       or die ('Could not connect to the database server' . mysqli_connect_error());
                 $id_idp = $_POST["id_idp"];
                 $cpf  = $_POST["cpf"];
                 $data_hora = $_POST["data_hora"];
                 $descricao = $_POST["descricao"];
                 $sql = "call labbd.insereIntervencao('$id_idp', '$cpf', '$data_hora', '$descricao');";
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
                insereIntervencao();
             }
             $host     = "localhost";
             $port     = 3306;
             $socket   = "";
             $user     = "root";
             $password = "";
             $dbname   = "labbd";
             $con = new mysqli($host, $user, $password, $dbname, $port, $socket)
                     or die ('Could not connect to the database server' . mysqli_connect_error());
             $sql = "SELECT * FROM intervencoes";
             $result = $con->query($sql);
             echo "<br>";
             echo "<table border=3>";
             echo "<th> ID Itens de Pauta </th> <th> Cpf</th>  <th> Data </th> <th> Descricao</th>";
             if ($result->num_rows > 0) {
                 // output data of each row
                 while($row = $result->fetch_assoc()) {
                   echo "<tr>";
                     echo "<td>" ;
                     echo  $row["id_itens_de_pauta"];
                     echo "</td>";
                     echo "<td>" ;
                     echo $row["cpf"];
                     echo "</td>";
                     echo "<td>" ;
                     echo $row["data_hora"];
                     echo "</td>";
                     echo "<td>" ;
                     echo $row["descricao"];
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

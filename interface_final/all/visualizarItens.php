
           <h1>Visualizar Itens de Pauta</h1>
           <h2>nas suas reuniões</h2>
           <p >

             <form method="post" align=”center”>
              CPF : <input type="text" name="cpf" /><br>
             <input type="submit" value="Enviar" name="submit">
             </form>

             <?php

                 $cpf = $_POST["cpf"];


             $host     = "localhost";
             $port     = 3306;
             $socket   = "";
             $user     = "root";
             $password = "";
             $dbname   = "labbd";

             $con = new mysqli($host, $user, $password, $dbname, $port, $socket)
                     or die ('Could not connect to the database server' . mysqli_connect_error());

             $sql = "call labbd.consulta_itens('$cpf')";
             $result = $con->query($sql);
             
             if ($result->num_rows > 0) {
                  echo "<br>";
                  echo "<table border=3>";
                  echo "<th> Numero da Reuniao </th> <th> Pauta </th> <th> Data Aprovacao</th>  <th> Texto Descritivo</th>";
                 // output data of each row

                 while($row = $result->fetch_assoc()) {
                   echo "<tr>";
                     echo "<td>" ;
                     echo  $row["numero_reuniao"];
                     echo "</td>";
                     echo "<td>" ;
                     echo $row["pauta"];
                     echo "</td>";
                     echo "<td>" ;
                     echo $row["data_aprovacao"];
                     echo "</td>";
                     echo "<td>" ;
                     echo $row["texto_descritivo"];
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


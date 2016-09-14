
           <h1>Historico</h1>
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

            $sql = "select ra from aluno where cpf='$cpf';";
             $result =$con->query($sql); 
             $row = $result->fetch_assoc();
             $ra  =$row["ra"];
             $sql = "call labbd.procedure_consulta_historico('$ra');";
             $result = $con->query($sql);
             echo "<br>";
             echo "<h2>Historico</h2>";
             echo "<table border=3>";
             echo "<th> RA </th>  <th> Ano </th>  <th>Semestre</th> <th>Turma</th><th> Nome</th><th> Creditos</th><th> Nota</th><th> Frequencia</th><th> Resultado</th>";
             if ($result->num_rows > 0) {

                 while($row = $result->fetch_assoc()) {
                   echo "<tr>";
                     echo "<td>" ;
                     echo  $row["ra"];
                     echo "</td>";
                     echo "<td>" ;
                     echo $row["ano"];
                     echo "</td>";
                     echo "<td>" ;
                     echo $row["semestre"];
                     echo "</td>";
                     echo "<td>" ;
                     echo $row["Turma"];
                     echo "</td>";
                     echo "<td>" ;
                     echo $row["nome"];
                     echo "</td>";
                     echo "<td>" ;
                     echo $row["creditos"];
                     echo "</td>";
                     echo "<td>" ;
                     echo $row["nota"];
                     echo "</td>";
			echo "<td>" ;
                     echo $row["frequencia"];
                     echo "</td>";
			echo "<td>" ;
                     echo $row["Resultado"];
                     echo "</td>";
                   echo "</tr>";
                 }

             }
             echo "</table>";



             $con->close();
          ?>


           </p>

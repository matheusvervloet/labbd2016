           <h2>Calendarios</h2>
           <p>

             <?php


              $host     = "localhost";
              $port     = 3306;
              $socket   = "";
              $user     = "root";
              $password = "";
              $dbname   = "labbd";

              $con = new mysqli($host, $user, $password, $dbname, $port, $socket)
                      or die ('Could not connect to the database server' . mysqli_connect_error());
                 $sql = "SELECT * FROM calendario_presencial;";
             $result = $con->query($sql);
             echo "<br>";
		echo "<h2>Presencial</h2>";
             echo "<table border=3>";
             echo "<th> semestre </th>  <th> ano </th>  <th> recesso </th><th> campus </th> <th> inicio </th> <th> fim </th> <th> tipo </th>";
             if ($result->num_rows > 0) {

                 while($row = $result->fetch_assoc()) {
                   echo "<tr>";
                     echo "<td>" ;
                     echo  $row["semestre"];
                     echo "</td>";
                     echo "<td>" ;
                     echo  $row["ano"];
                     echo "</td>";
                     echo "<td>" ;
                     echo $row["nome"];
                     echo "</td>";
                     echo "<td>" ;
                     echo $row["campus"];
                     echo "</td>";
                     echo "<td>" ;
                     echo $row["recesso_inicio"];
                     echo "</td>";
                     echo "<td>" ;
                     echo $row["recesso_fim"];
                     echo "</td>";
                     echo "<td>" ;
                     echo $row["tipo"];
                     echo "</td>";
                   echo "</tr>";
                 }

             }
             echo "</table>";

                 $sql = "SELECT * FROM vcalendario_ead;";
             $result = $con->query($sql);
             echo "<br>";
		echo "<h2>EAD</h2>";
             echo "<table border=3>";
             echo "<th> semestre </th>  <th> ano </th>  <th> recesso </th><th> campus </th> <th> inicio </th> <th> fim </th> <th> tipo </th>";
             if ($result->num_rows > 0) {

                 while($row = $result->fetch_assoc()) {
                   echo "<tr>";
                     echo "<td>" ;
                     echo  $row["semestre"];
                     echo "</td>";
                     echo "<td>" ;
                     echo  $row["ano"];
                     echo "</td>";
                     echo "<td>" ;
                     echo $row["nome"];
                     echo "</td>";
                     echo "<td>" ;
                     echo $row["campus"];
                     echo "</td>";
                     echo "<td>" ;
                     echo $row["recesso_inicio"];
                     echo "</td>";
                     echo "<td>" ;
                     echo $row["recesso_fim"];
                     echo "</td>";
                     echo "<td>" ;
                     echo $row["tipo"];
                     echo "</td>";
                   echo "</tr>";
                 }

             }
             echo "</table>";

              $con->close();
           ?>

           </p>





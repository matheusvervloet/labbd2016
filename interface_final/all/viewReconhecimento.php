
           <h2>Reconhecimento</h2>
           <p>
             <form method="post">

             Curso(sigla): <input type="text" name="curso"/><br>
             <input type="submit" value="Enviar" name="submit">

             </form>

             <?php
             function view_reconhecimento(){

                   $host     = "localhost";
                   $port     = 3306;
                   $socket   = "";
                   $user     = "root";
                   $password = "";
                   $dbname   = "labbd";

                   $con = new mysqli($host, $user, $password, $dbname, $port, $socket)
                       or die ('Could not connect to the database server' . mysqli_connect_error());

                       $sigla =  $_POST["curso"];
                       $sql = "SELECT * FROM view_reconhecimento where view_reconhecimento.sigla_curso = '$sigla';";

                       $result = $con->query($sql);
                       echo "<br>";
                       header("Content-Type: text/html; charset=ISO-8859-1",true);


                       if ($result->num_rows > 0) {
                           // output data of each row
                           echo "<table border=3>";
                           echo "<th>Sigla Curso</th> <th>Num Capes</th> <th>Data Inicio</th>";

                           while($row = $result->fetch_assoc()) {
                             echo "<tr>";
                              
                               echo "<td>" ;
                               echo $row["num_capes"];
                               echo "</td>";
                               echo "<td>" ;
                               echo $row["data_inicio"];
                               echo "</td>";
				 echo "<td>" ;
                               echo  $row["sigla_curso"];
                               echo "</td>";
                             echo "</tr>";
                           }

                           echo "</table>";
                       }

                       $con->close();

             }

             if(isset($_POST['submit']))
             {
                view_reconhecimento();
             }
  ?>



           </p>
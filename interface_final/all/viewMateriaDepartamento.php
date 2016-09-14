           <h2>Consultar materias oferecidas pelo departamento</h2>
           <p>
	 	
 		<form method="post" align=”center”>
             
             Departamento(sigla): <input type="text" name="departamento"/><br>
             ou <br>
             Disciplina(sigla):  <input type="text" name="disciplina"/><br>
             <input type="submit" value="Enviar" name="submit">

             </form>

             <?php
             function view_materias_do_depto(){	

                   $host     = "localhost";
                   $port     = 3306;
                   $socket   = "";
                   $user     = "root";
                   $password = "";
                   $dbname   = "labbd";

                   $con = new mysqli($host, $user, $password, $dbname, $port, $socket)
                       or die ('Could not connect to the database server' . mysqli_connect_error());

                       $siglaDep =  $_POST["departamento"];
                       $siglaDisc =  $_POST["disciplina"];
                       $sql = "SELECT * FROM view_materias_do_depto where view_materias_do_depto.siglaDisciplina = '$siglaDisc' or view_materias_do_depto.siglaDepartamento = '$siglaDep';";

                       $result = $con->query($sql);
                       echo "<br>";
                       header("Content-Type: text/html; charset=ISO-8859-1",true);
		      

                       if ($result->num_rows > 0) {
                           // output data of each row
                           echo "<table border=3>";
                           echo "<th> SiglaDisciplina </th> <th>NomeDisciplina</th> <th>NomeDepartamento</th> <th>SiglaDepartamento</th>";

                           while($row = $result->fetch_assoc()) {
                             echo "<tr>";
                               echo "<td>" ;
                               echo  $row["siglaDisciplina"];
                               echo "</td>";
                               echo "<td>" ;
                               echo $row["nomeDisciplina"];
                               echo "</td>";
                               echo "<td>" ;
                               echo $row["nomeDepartamento"];
                               echo "</td>";
                               echo "<td>" ;
                               echo $row["siglaDepartamento"];
                               echo "</td>";
                             echo "</tr>";
                           }

                       echo "</table>";
                       }
                       else {
                          echo "Não encontrado";

                       }

                       $con->close();

             }

             if(isset($_POST['submit']))
             {
 		
                view_materias_do_depto();
             }
  ?>



           </p>

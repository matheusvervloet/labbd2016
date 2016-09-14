
           <h1>Cadastrar Pre-Requisitos</h1>
           <p >
             <form method="post" align=”center”>
             Codigo Disciplina: <input type="text" name="cod_disc" /><br>
             Codigo Pre-requisito:  <input type="text" name="prereq"/><br>
             <input type="submit" value="Enviar" name="submit">

             </form>

             <?php
             function inserePreReq(){
                   $host     = "localhost";
                   $port     = 3306;
                   $socket   = "";
                   $user     = "root";
                   $password = "";
                   $dbname   = "labbd";
                   $con = new mysqli($host, $user, $password, $dbname, $port, $socket)
                       or die ('Could not connect to the database server' . mysqli_connect_error());
                 $cod_disc = $_POST["cod_disc"];
                 $prereq  = $_POST["prereq"];
                 $sql = "call labbd.inserePreRequisito('$cod_disc', '$prereq');";
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
                inserePreReq();
             }
             $host     = "localhost";
             $port     = 3306;
             $socket   = "";
             $user     = "root";
             $password = "";
             $dbname   = "labbd";
             $con = new mysqli($host, $user, $password, $dbname, $port, $socket)
                     or die ('Could not connect to the database server' . mysqli_connect_error());
             $sql = "SELECT * FROM pre_requisitos";
             $result = $con->query($sql);
             echo "<br>";
             echo "<table border=3>";
             echo "<th> Disciplina </th> <th> Pre-requisito</th>  ";
             if ($result->num_rows > 0) {
                 // output data of each row
                 while($row = $result->fetch_assoc()) {
                   echo "<tr>";
                     echo "<td>" ;
                     echo  $row["disciplina"];
                     echo "</td>";
                     echo "<td>" ;
                     echo $row["pre_requisito"];
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

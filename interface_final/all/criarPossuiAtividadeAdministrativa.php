
           <h1>Cadastrar Possui Atividade Adm</h1>
           <p >
             <form method="post" align=”center”>
             ID Atividade: <input type="number" name="ida" /><br>
             ID Calendário:  <input type="number" name="idc"/><br>
             <input type="submit" value="Enviar" name="submit">

             </form>

             <?php
             function inserePossuiAtividadeAdm(){

                   $host     = "localhost";
                   $port     = 3306;
                   $socket   = "";
                   $user     = "root";
                   $password = "";
                   $dbname   = "labbd";

                   $con = new mysqli($host, $user, $password, $dbname, $port, $socket)
                       or die ('Could not connect to the database server' . mysqli_connect_error());

                 $ida = $_POST["ida"];
                 $idc  = $_POST["idc"];


                 $sql = "call labbd.inserePossuiAtivAdm('$ida', '$idc');";
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
                inserePossuiAtividadeAdm();
             }

             $host     = "localhost";
             $port     = 3306;
             $socket   = "";
             $user     = "root";
             $password = "";
             $dbname   = "labbd";

             $con = new mysqli($host, $user, $password, $dbname, $port, $socket)
                     or die ('Could not connect to the database server' . mysqli_connect_error());
             $sql = "SELECT * FROM possui_atividade_administrativa";
             $result = $con->query($sql);
             echo "<br>";

             echo "<table border=3>";
             echo "<th> ID Atividade </th> <th> ID Calendario</th> ";
             if ($result->num_rows > 0) {
                 // output data of each row

                 while($row = $result->fetch_assoc()) {
                   echo "<tr>";
                     echo "<td>" ;
                     echo  $row["id_ativ_adm"];
                     echo "</td>";
                     echo "<td>" ;
                     echo $row["id"];
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


           <h1>Inscrever na turma</h1>
           <p >

             <form method="post" align=”center”>
             CPF : <input type="text" name="cpf" /> <br>
             ID(turma): <input type="text" name="id" /><br>
             Fase: <input type="text" name="fase" /><br>
             <input type="submit" value="Enviar" name="submit">

             </form>

             <?php
             function insereAlunoTurma(){
                   $cpf = $_GET["cpf"];
                   $host     = "localhost";
                   $port     = 3306;
                   $socket   = "";
                   $user     = "root";
                   $password = "";
                   $dbname   = "labbd";

                   $con = new mysqli($host, $user, $password, $dbname, $port, $socket)
                       or die ('Could not connect to the database server' . mysqli_connect_error());

                 $id = $_POST["id"];
                 $fase  = $_POST["fase"];
                 $sql = "call labbd.procedure_insereInscreve('$cpf','$id', '$fase');";
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
                insereAlunoTurma();
             }

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
             $sql = "select
        `turmaCodigo`,
         `Disciplina`,
        `Vagas`,
        `DocenteNome`,
       `DocenteSobrenome`,
        `Dia`,
        `Hora`from horario_turma_disciplina where `Calendario` = f_calendario_data(curdate());";
             $result = $con->query($sql);
             echo "<br>";
             echo "<h2>Turmas disponiveis</h2>";
             echo "<table border=3>";
             echo "<th> Turma Codigo </th>  <th> Disciplina </th>  <th>Vagas</th> <th>Docente Nome</th><th> Sobrenome</th><th> Dia</th><th> Hora</th>";
             if ($result->num_rows > 0) {

                 while($row = $result->fetch_assoc()) {
                   echo "<tr>";
                     echo "<td>" ;
                     echo  $row["turmaCodigo"];
                     echo "</td>";
                     echo "<td>" ;
                     echo $row["Disciplina"];
                     echo "</td>";
                     echo "<td>" ;
                     echo $row["Vagas"];
                     echo "</td>";
                     echo "<td>" ;
                     echo $row["DocenteNome"];
                     echo "</td>";
                     echo "<td>" ;
                     echo $row["DocenteSobrenome"];
                     echo "</td>";
                     echo "<td>" ;
                     echo $row["Dia"];
                     echo "</td>";
                     echo "<td>" ;
                     echo $row["Hora"];
                     echo "</td>";
                   echo "</tr>";
                 }

             }
             echo "</table>";


             $sql = "select ra from aluno where cpf='$cpf';";
             $result =$con->query($sql); 
             $row = $result->fetch_assoc();
             $ra  =$row["ra"];
             $sql = "call labbd.procedure_consulta_inscricoes($ra);";
             $result = $con->query($sql);
             echo "<br>";
             echo "<h2>Inscrito</h2>";
             echo "<table border=3>";
             echo "<th> RA</th> <th> ano </th>  <th> semestre </th>  <th> Turma</th><th> Dia</th><th> Hora</th> <th> nome</th><th> creditos</th><th> fase</th><th> deferimento</th>";
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
                     echo $row["dia"];
                     echo "</td>";
                     echo "<td>" ;
                     echo $row["hora"];
                     echo "</td>";
                     echo "<td>" ;
                     echo $row["nome"];
                     echo "</td>";
                     echo "<td>" ;
                     echo $row["creditos"];
                     echo "</td>";
                     echo "<td>" ;
                     echo $row["fase"];
                     echo "</td>";
                     echo "<td>" ;
                     echo $row["deferimento"];
                     echo "</td>";
                   echo "</tr>";
                 }

             }
             echo "</table>";


             $con->close();
          ?>


           </p>


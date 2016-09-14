
           <h1>Inscrever na disciplina</h1>
           <p >
             <form method="post" align=”center”>
              CPF : <input type="text" name="id" /><br>
             ID(turma): <input type="text" name="id" /><br>
             Fase: <input type="text" name="fase" /><br>
             <input type="submit" value="Enviar" name="submit">

             </form>

             <?php
             function insereAlunoTurma(){

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
                 $sql = "call labbd.inscricao_turma('$cpf','$id', '$fase');";
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
             $sql = "SELECT * FROM curso";
             $result = $con->query($sql);
             echo "<br>";

             echo "<table border=3>";
             echo "<th> Cpf</th> <th> Turma </th>  <th> Sigla </th>  <th> Disciplina</th> <th> Letra</th>";
             if ($result->num_rows > 0) {
                 // output data of each row

                 while($row = $result->fetch_assoc()) {
                   echo "<tr>";
                     echo "<td>" ;
                     echo  $row["cpf"];
                     echo "</td>";
                     echo "<td>" ;
                     echo $row["id_turma"];
                     echo "</td>";
                     echo "<td>" ;
                     echo $row["sigla"];
                     echo "</td>";
                     echo "<td>" ;
                     echo $row["disciplina"];
                     echo "</td>";
                     echo "<td>" ;
                     echo $row["letra"];
                     echo "</td>";
                   echo "</tr>";
                 }

             echo "</table>";
             }

             $con->close();
          ?>


           </p>
         </div>
       </div>
     </main>



     <nav id="nav">
       <div class="innertube">
         <h2>Aluno</h2>
         <ul><a href= http://localhost/my_site/Index.php>Sair</a></ul>
         <ul><a href= http://localhost/my_site/alunoIndex.php>Home</a></ul>
         <h3>Cadastros</h3>
         <ul>
           <li><a href="http://localhost/my_site/inscreverTurma.php?cpf=<?php echo $cpf; ?>">Inscrição Turma</a></li>
           <li><a href="http://localhost/my_site/criarDepartamento.php">Dados Pessoais</a></li>
           <li><a href="http://localhost/my_site/criarDisciplina.php">#</a></li>
           <li><a href="http://localhost/my_site/criarCurso.php">#</a></li>
           <li><a href="http://localhost/my_site/criarReconhecimento.php">#</a></li>
         </ul>
         <h3>Consultas</h3>
         <ul>
           <li><a href="http://localhost/my_site/viewMateriaDepartamento.php?cpf=<?php echo $cpf; ?>">Materias Departamento</a></li>
           <li><a href="#">Link 2</a></li>
           <li><a href="#">Link 3</a></li>
           <li><a href="#">Link 4</a></li>
           <li><a href="#">Link 5</a></li>
         </ul>
         <h3>Left heading</h3>
         <ul>
           <li><a href="#">Link 1</a></li>
           <li><a href="#">Link 2</a></li>
           <li><a href="#">Link 3</a></li>
           <li><a href="#">Link 4</a></li>
           <li><a href="#">Link 5</a></li>
         </ul>
       </div>
     </nav>

   </div>
 </body>
</html>

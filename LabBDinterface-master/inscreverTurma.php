<!DOCTYPE html>
<!-- Template by quackit.com -->
<html>
 <head>
   <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
   <title>2 Column Layout &mdash; Left Menu</title>
   <style type="text/css">

     body{
       margin:0;
       padding:0;
       font-family: Sans-Serif;
       line-height: 1.5em;
     }

     main {
       padding-bottom: 10010px;
       margin-bottom: -10000px;
       float: left;
       width: 100%;
     }

     #nav {
       float: left;
       width: 230px;
       margin-left: -100%;
       padding-bottom: 10010px;
       margin-bottom: -10000px;
       background: #eee;
     }

     #wrapper {
       overflow: hidden;
     }

     #content {
       margin-left: 230px; /* Same as 'nav' width */
     }

     .innertube{
       margin: 15px; /* Padding for content */
       margin-top: 0;
     }

     p {
       color: #555;
     }

     nav ul {
       list-style-type: none;
       margin: 0;
       padding: 0;
     }

     nav ul a {
       color: darkgreen;
       text-decoration: none;
     }
     nav ul :hover {
       margin: 1;
     background-color: white;

     }
     b {
      color: white;
      font-family: Sans-Serif;
      font-size: 200%;
      position: absolute;
      left: 35%;
      top: 5%

    }
     #head {
       height: 90px;
       background: #444;

     }


    </style>

    <div class id=head>
    <b> Sistema Controle Academico </b>
    </div>

    </head>

 <body>
   <?php
     $cpf = $_GET["cpf"];
    ?>
   <div id="wrapper">

     <main>
       <div id="content">
         <div class="innertube">
           <h1>Inscrever na turma</h1>
           <p >

             <form action="inscreverTurma.php?cpf=<?php echo $cpf?>" method="post" align=”center”>
             CPF : <?php echo $cpf; ?> <br>
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
        `Docente Nome`,
       `Docente Sobrenome` from turmas_disciplina where `Calendario` = f_calendario_data(curdate());";
             $result = $con->query($sql);
             echo "<br>";
             echo "<h2>Turmas disponiveis</h2>";
             echo "<table border=3>";
             echo "<th> Turma Codigo </th>  <th> Disciplina </th>  <th>Vagas</th> <th>Docente Nome</th><th> Sobrenome</th>";
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
                     echo $row["Docente Nome"];
                     echo "</td>";
                     echo "<td>" ;
                     echo $row["Docente Sobrenome"];
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
             echo "<th> RA</th> <th> ano </th>  <th> semestre </th>  <th> Turma</th> <th> nome</th><th> creditos</th><th> fase</th><th> deferimento</th>";
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
         </div>
       </div>
     </main>


     <?php
       $cpf = $_GET["cpf"];
      ?>

     <nav id="nav">
     <div class="innertube">
     <h2>Aluno</h2>
     <ul><a href= http://localhost/my_site/Index.php>Sair</a></ul>
     <ul><a href= http://localhost/my_site/alunoIndex.php?cpf=<?php echo $cpf; ?>>Home</a></ul>
         <h3>Cadastros</h3>
         <ul>
           <li><a href="http://localhost/my_site/inscreverTurma.php?cpf=<?php echo $cpf; ?>">Inscrição Turma</a></li>
           <li><a href="http://localhost/my_site/criarDepartamento.php">#</a></li>
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

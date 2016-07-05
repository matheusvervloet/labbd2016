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
       box-shadow: 0px 0px 10px black;
       box-sizing: border-box;
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
     nav ul :hover {
       margin: 1;
     background-color: white;

     }
     nav ul a {
       color: darkgreen;
       text-decoration: none;
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

   <div id="wrapper">

     <main>
       <div id="content">
         <div class="innertube">
           <h2>Consultar materias oferecidas pelo departamento</h2>
           <p>
             <form action="viewMateriaDepartamento.php" method="post">

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

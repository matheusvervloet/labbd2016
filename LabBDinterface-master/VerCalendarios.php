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
           <h2>Calendarios</h2>
           <p>
             <form action="VerCalendarios.php" method="post">

             /* Calendario(id): <input type="text" name="calendario"/><br>
             Fase: <input type="text" name="fase"/><br>*/
             <input type="submit" value="Ver Calendarios" name="submit"> 

             </form>

             <?php
             function ver_calendarios(){

                   $host     = "localhost";
                   $port     = 3306;
                   $socket   = "";
                   $user     = "root";
                   $password = "";
                   $dbname   = "labbd";

                   $con = new mysqli($host, $user, $password, $dbname, $port, $socket)
                       or die ('Could not connect to the database server' . mysqli_connect_error());



                 $sql = "SELECT * FROM calendario_geral;";
             $result = $con->query($sql);
             echo "<br>";

             echo "<table border=3>";
             echo "<th> ID </th> <th> semestre </th>  <th> ano </th>  <th> inicio_calendario </th> <th> fim_calendario </th><th> versao </th><th> situacao </th> <th> nome </th> <th> atv_fim </th> <th> responsavel </th>";
             if ($result->num_rows > 0) {

                 while($row = $result->fetch_assoc()) {
                   echo "<tr>";
                     echo "<td>" ;
                     echo  $row["ID"];
                     echo "</td>";
                     echo "<td>" ;
                     echo $row["semestre"];
                     echo "</td>";
                     echo "<td>" ;
                     echo $row["ano"];
                     echo "</td>";
                     echo "<td>" ;
                     echo $row["inicio_calendario"];
                     echo "</td>";
                     echo "<td>" ;
                     echo $row["fim_calendario"];
                     echo "</td>";
                     echo "<td>" ;
                     echo $row["versao"];
                     echo "</td>";
                     echo "<td>" ;
                     echo $row["situacao"];
                     echo "</td>";
                     echo "<td>" ;
                     echo $row["nome"];
                     echo "</td>";
					 echo "<td>" ;
                     echo $row["atv_fim"];
                     echo "</td>";
					 echo "<td>" ;
                     echo $row["responsavel"];
                     echo "</td>";
                   echo "</tr>";
                 }

             }
             echo "</table>";








                 $con->close();
                      

             }

             if(isset($_POST['submit']))
             {
                ver_calendarios();
             }
  ?>



           </p>
         </div>
       </div>
     </main>



     <nav id="nav">
        <div class="innertube">
          <h2>Adm</h2>
          <ul><a href= http://localhost/my_site/Index.php>Sair</a></ul>
          <ul><a href= http://localhost/my_site/admIndex.php>Home</a></ul>
          <h3>Cadastros</h3>
          <ul>
            <li><a href="#">Pessoa</a></li>
            <li><a href="http://localhost/my_site/criarCentroAcademico.php">CentroAcademico</a></li>
            <li><a href="http://localhost/my_site/criarDepartamento.php">Departamento</a></li>
            <li><a href="http://localhost/my_site/criarDisciplina.php">Disciplina</a></li>
            <li><a href="http://localhost/my_site/criarCurso.php">Curso</a></li>
            <li><a href="http://localhost/my_site/criarReconhecimento.php">Reconhecimento</a></li>
            <li><a href="http://localhost/my_site/criarAtividadeAdministrativa.php">AtividadeAdministrativa</a></li>
            <li><a href="http://localhost/my_site/criarPossuiAtividadeAdministrativa.php">AtribuirAtvAdministrativa</a></li>
            <li><a href="http://localhost/my_site/criarRecesso.php">Recesso</a></li>
            <li><a href="http://localhost/my_site/criarPossuiRecesso.php">AtribuirRecesso</a></li>
			<li><a href="http://localhost/my_site/criarAluno.php">Cadastra Aluno</a></li>
			<li><a href="http://localhost/my_site/criaDocente.php">CadastraDocente</a></li>
			<li><a href="http://localhost/my_site/criaTA.php">CadastraTA</a></li>
          </ul>
          <h3>Açoes</h3>
          <ul>
            <li><a href="http://localhost/my_site/fazDeferimento.php">Fazer Deferimento dos alunos</a></li>
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

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

   <div id="wrapper">

     <main>
       <div id="content">
         <div class="innertube">
           <h1>Cadastrar Disciplina</h1>
           <p>
             <form action="criarDisciplina.php" method="post">
             Sigla: <input type="text" name="sigla"/><br>
             Nome:  <input type="text" name="nome"/><br>
             Ementa: <input type="text" name="ementa"/><br>
             Creditos: <input type="text" name="creditos"/><br>
             Departamento: <input type="text" name="departamento"/><br>
             <input type="submit" value="Enviar" name="submit">

             </form>

             <?php
             function insereDisciplina(){

                   $host     = "localhost";
                   $port     = 3306;
                   $socket   = "";
                   $user     = "root";
                   $password = "";
                   $dbname   = "labbd";

                   $con = new mysqli($host, $user, $password, $dbname, $port, $socket)
                       or die ('Could not connect to the database server' . mysqli_connect_error());

                 $sigla = $_POST["sigla"];
                 $nome  = $_POST["nome"];
                 $ementa = $_POST["ementa"];
                 $creditos = $_POST["creditos"];
                 $departamento = $_POST["departamento"];
                 $sql = "call labbd.insereDisciplina('$sigla', '$nome', '$ementa', '$creditos', '$departamento');";

                if ($con->query($sql) === TRUE) {
                     echo "Inserido com sucesso\n";
                 }
                 else {
                     echo "Erro: dados errados";
                 }

                 $con->close();
             }

             if(isset($_POST['submit']))
             {
                insereDisciplina();
             }

             $host     = "localhost";
             $port     = 3306;
             $socket   = "";
             $user     = "root";
             $password = "";
             $dbname   = "labbd";

             $con = new mysqli($host, $user, $password, $dbname, $port, $socket)
                     or die ('Could not connect to the database server' . mysqli_connect_error());
             $sql = "SELECT * FROM disciplina order by disciplina.sigla";
             $result = $con->query($sql);
             header("Content-Type: text/html; charset=ISO-8859-1",true);
             echo "<br>";

             echo "<table border=3>";
             echo "<th> Sigla </th> <th>Nome</th>  <th>Ementa</th> <th>Creditos</th> <th>Departamento</th>";
             if ($result->num_rows > 0) {
                 // output data of each row

                 while($row = $result->fetch_assoc()) {
                   echo "<tr>";
                     echo "<td>" ;
                     echo  $row["sigla"];
                     echo "</td>";
                     echo "<td>" ;
                     echo $row["nome"];
                     echo "</td>";
                     echo "<td>" ;
                     echo $row["ementa"];
                     echo "</td>";
                     echo "<td>" ;
                     echo $row["creditos"];
                     echo "</td>";
                     echo "<td>" ;
                     echo $row["sigla_depto"];
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
         </ul>
         <h3>Left heading</h3>
         <ul>
           <li><a href="#">Link 1</a></li>
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

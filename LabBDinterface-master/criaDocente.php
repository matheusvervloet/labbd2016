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
           <h2>Cadastra Docente</h2>
           <p>
             <form action="criaDocente.php" method="post">
			 

             Cpf:  <input type="text" name="cpf"/><br>
             Nome: <input type="text" name="nome"/><br>
             Nome do meio: <input type="text" name="nome_meio"/><br>
             Sobrenome: <input type="text" name="sobrenome"/><br>
             <input type="submit" value="Cadastrar" name="submit">

             </form>

             <?php
             function cadastra_docente(){

                   $host     = "localhost";
                   $port     = 3306;
                   $socket   = "";
                   $user     = "root";
                   $password = "";
                   $dbname   = "labbd";

                   $con = new mysqli($host, $user, $password, $dbname, $port, $socket)
                       or die ('Could not connect to the database server' . mysqli_connect_error());

						 $cpf_p = $_POST["cpf"];
						 $nome_p  = $_POST["nome"];
						 $nome_meio_p  = $_POST["nome_meio"];
						 $sobrenome_p  = $_POST["sobrenome"];

						 $sql = "call procedure insereDocente($cpf_p, $nome_p, $nome_meio_p, $sobrenome_p)"
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
                cadastra_docente();
             }
  ?>



           </p>
         </div>
       </div>
     </main>



     <?php include("sidebarAluno.php"); ?>
     
   </div>
 </body>
</html>

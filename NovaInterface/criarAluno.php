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

     #head {
       color: darkgreen;
     }

   </style>

<div class id=head>
</div>
 </head>

 <body>

   <div id="wrapper">

     <main>
       <div id="content">
         <div class="innertube">
           <h1>Cadastrar Aluno!</h1>
           <p>
             <form action="criarAluno.php" method="post">
             Cpf:  <input type="text" name="cpf"/><br>
             Nome: <input type="text" name="nome"/><br>
             Nome do meio: <input type="text" name="nome_meio"/><br>
             Sobrenome: <input type="text" name="sobrenome"/><br>
			 Nome da Mae: <input type="text" name="nome_mae"/><br>
			 Nome do Pai: <input type="text" name="nome_pai"/><br>
			 Pais: <input type="text" name="pais"/><br>
			 UF: <input type="text" name="uf"/><br>
			 Data nascimento: <input type="date" name="dta_nasc"/><br>
			 Ano ingresso: <input type="date" name="dta_ing"/><br>  
			 Sexo: 	<br>Homem <input type="radio" name="gender" value="H"/> 
				<br>Mulher <input type="radio" name="gender" value="M"/><br> 
			 Cor: <input type="text" name="color"/><br>
			 Perfil: <input type="text" name="profile"/><br>
			 RA: <input type="text" name="ra"/><br>
			 Escola de conclusao do ensino medio: <input type="text" name="nome_escola"/><br>
			 Ano de conclusao: <input type="date" name="dta_conc_medio"/><br>
			 

             <input type="submit" value="Cadastrar" name="submit">

             </form>

             <?php
             function insere_aluno(){

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
				 $mae_p = $_POST["nome_mae"];
                 $pai_p  = $_POST["nome_pai"];
                 $pais_p  = $_POST["pais"];
				 $dta_nasc_p  = $_POST["dta_nasc"];
				 $ano_ing_p = $_POST["dta_ing"];
                 $sexo_p  = $_POST["gender"];
                 $cor_p  = $_POST["color"];
				 $reenq_p  = $_POST["profile"];
				 $ra_p = $_POST["ra"];
                 $conc_nome_p  = $_POST["nome_escola"];
                 $ano_conc_p  = $_POST["dta_conc_medio"];
				 $uf_p = $_POST["uf"];
				 
				 $sql = "call procedure insereAluno($mae_p, $pai_p, $pais_p, $uf_p, $dta_nasc_p, $ano_ing_p, $sexo_p, $cor_p, $reenq_p, $ra_p, $cpf_p, $conc_nome_p, $ano_conc_p, $nome_p, $nome_meio_p, $sobrenome_p)";
                 

                if ($con->query($sql) === TRUE) {
                     echo "Inserido com sucesso\n";
                 }
                 else {
                     echo "Erro: " . $con->error;
                 }

                 $con->close();
             }
			
             if(isset($_POST['submit']))
			 {
				 insere_aluno();
			 }
          ?>


           </p>
         </div>
       </div>
     </main>



     <?php include("sidebarAdm.php"); ?>


   </div>
 </body>
</html>

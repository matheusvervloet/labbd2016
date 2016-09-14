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

       b {
				color: white;
        font-family: Sans-Serif;
        font-size: 200%;
        position: absolute;
        left: 35%;
        top: 5%;
			}

      #head {
        height: 90px;
        background: #444;
        text-align: center;

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
						<h1>Bem Vindos</h1>
						<p>Aluno:  <br> 919191919-44(inscrever disc)<br>919136532-44(ver historico) <br> 275677595-94 <br> <br>Docente: <br> 777795472-95 <br> 830225565-26 <br> 254847477-17 <br> <br>TA:  <br> 231546389-98 <br> 546322148-91 <br> 252468793-11 <br></p>
					</div>
				</div>
			</main>
			<?php
			function login(){

						$host     = "localhost";
						$port     = 3306;
						$socket   = "";
						$user     = "root";
						$password = "";
						$dbname   = "labbd";

						$con = new mysqli($host, $user, $password, $dbname, $port, $socket)
								or die ('Could not connect to the database server' . mysqli_connect_error());

					$cpf= $_POST["cpf"];

					$sql = "SELECT * FROM labbd.aluno where aluno.cpf = '$cpf';";
				  $result = $con->query($sql);

					$sql2 = "SELECT * FROM labbd.docente where docente.cpf = '$cpf';";
				  $result2 = $con->query($sql2);

					if($cpf == '054587711-33'){
						header("Location: http://localhost/my_site/admindex.php?cpf=$cpf");
					}

				 	elseif ($result->num_rows > 0) {
						header("Location: http://localhost/my_site/alunoIndex.php?cpf=$cpf");
					}
					elseif($result2->num_rows > 0) {
						header("Location: http://localhost/my_site/docenteIndex.php?cpf=$cpf");
					}
					else {

						header("Location: http://localhost/my_site/index.php");
					}


/*
				 {
							echo "Inserido com sucesso\n";
					}
					else {
							echo "Erro: dados errados";
					}
					*/
					$con->close();
					exit;
			}
			if(isset($_POST['submit']))
			{
				 login();
			}
			?>
      <nav id="nav">
        <div class="innertube">
          <h2>User</h2>
					<ul>
						<form action="index.php" method="post">
						Cpf: <input type="text" name="cpf"/><br>
						<input type="submit" value="Entrar" name="submit">
						</form>
						<br>
          <ul><a href= http://localhost/my_site/index.php>Home</a></ul>
          
          <ul>
     
						<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
          </ul>
          
        </div>
      </nav>

    </div>
  </body>
</html>

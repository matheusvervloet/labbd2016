<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
		<title>Sistema de Controle Academico</title>
		<link rel="stylesheet" type="text/css" href="style.css">
		<div class id=head>
		<b> Sistema de Controle Academico </b>
		</div>
	</head>

	<body>
		<div id="wrapper">
			<main>
				<div id="content">
					<div class="innertube">
						<h1>Bem vindo</h1>
					</div>
				</div>
			</main>
			<?php
				include('db.php');
 				/*if(isset($_POST['cpf'])){
					header('Location: http://localhost/my_site/index.php');
				}
					<form action="index.php" method="get">
					CPF: <input type="text" name="cpf"/><br>
					<input type="submit" value="Entrar" name="submit">
					</form>
					<form action="<?php $_PHP_SELF ?>" method="GET">
						CPF: <input type="text" name="cpf"/><br>
						<input type="submit">
					</form>
					<p>Aluno:  	
					<br> 919191919-44(inscrever disc)
					<br>919136532-44(ver historico) 
					<br> 275677595-94 <br> 
					<br>Docente: 
					<br> 777795472-95 
					<br> 830225565-26 
					<br> 254847477-17 <br> 
					<br>TA:  
					<br> 231546389-98 
					<br> 546322148-91 
					<br> 252468793-11 <br></p>
				*/
			?>
		      
			<nav id="nav">
				<div class="innertube">
				  <h2>Login</h2>
					<ul>
					<a href= http://localhost/my_site/index.php>Home</a><br><br>	
					<a href= http://localhost/my_site/admin.php>Admin</a><br>
					<a href= http://localhost/my_site/aluno.php>Aluno</a><br>
					<a href= http://localhost/my_site/ta.php>Tecnico Administrativo</a><br>
					<a href= http://localhost/my_site/docente.php>Docente</a><br>
				  	</ul>
					<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
				</div>
			</nav>
    		</div>
  	</body>
</html>

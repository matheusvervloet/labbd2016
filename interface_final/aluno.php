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
						<?php
							if(isset($_GET['action'])){
								$action=$_GET['action'];
								include("all/$action.php");
							}
							else
							{
								echo "<h1>Painel do Aluno</h1>";
							}
						?>
					</div>
				</div>
			</main>
		      
			<nav id="nav">
				<div class="innertube">
				  <h2>Tabelas</h2>
					<ul>
						<a href= http://localhost/my_site/index.php>Home</a><br><br>	
						<?php 
						include("alunoSidebar.php");
						?>	
				  	</ul>
					<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
				</div>
			</nav>
    		</div>
  	</body>
</html>

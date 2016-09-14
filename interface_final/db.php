<?php

	$host     = "localhost";
	$port     = 3306;
	$socket   = "";
	$user     = "root";
	$password = "";
	$dbname   = "labbd";

	$con = new mysqli($host, $user, $password, $dbname, $port, $socket)
	or die ('Could not connect to the database server' . mysqli_connect_error());

	/*$cpf= $_POST["cpf"];

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
	}*/

?>

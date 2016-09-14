<h1>Centro Academico</h1>
<form action="criarCentroAcademico.php" method="post">
Sigla: <input type="text" name="sigla"/><br>
Nome:  <input type="text" name="nome"/><br>
<input type="submit" value="Enviar" name="submit">
</form>
<?php

	function insereCA(){
		$sigla = $_POST["sigla"];
		$nome  = $_POST["nome"];

		$sql = "call labbd.insereCentroAcademico('$sigla', '$nome');";

		if ($con->query($sql) === TRUE) {
			echo "Inserido com sucesso\n";
		}
		else {
			echo "Erro";
		}
	}
	if(isset($_POST['submit']))
	{
		insereCA();
	}

	include('db.php');
	$sql = "SELECT * FROM centro_academico order by centro_academico.sigla";
	$result = $con->query($sql);
	header("Content-Type: text/html; charset=ISO-8859-1",true);
	echo "<br>";

	echo "<table border='2'  cellpadding='6'>";
	echo "<th> Sigla </th> <th>Nome</th>";
	if ($result->num_rows > 0) {
	$table='centro_academico';
	$id_name='sigla';
	while($row = $result->fetch_assoc()) {
		echo "<tr>";
		echo "<td>".$row["sigla"]."</td>";
		echo "<td>".$row["nome"]."</td>";
		echo '<td><a href="edit.php?table='.$table.'&id_name='.$id_name.'&id='.$row[$id_name].'">Edit</a></td>';
		echo '<td><a href="delete.php?table='.$table.'&id_name='.$id_name.'&id='.$row[$id_name].'">Delete</a></td>';
		echo "</tr>";
	}
	echo "</table>";
	}
?>


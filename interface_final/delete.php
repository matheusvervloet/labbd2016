<?php
	include('db.php');

	if (isset($_GET['id']) and isset($_GET['id_name']) and isset($_GET['table']))
	{
		$id = $_GET['id'];
		$id_name = $_GET['id_name'];
		$table = $_GET['table'];
		$sql = "DELETE FROM $table WHERE $id_name=\"$id\"";
		$result = $con->query($sql);

		header('Location: ' . $_SERVER['HTTP_REFERER']);
	}

	else
	{
		header('Location: ' . $_SERVER['HTTP_REFERER']);
	}
?>

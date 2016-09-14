<h1>Cursa</h1>
<form method="post" align=”center”>
             Sigla Curso: <input type="text" name="sigla" /><br>
             CPF aluno:  <input type="text" name="cpf"/><br>
             Data Inicio:  <input type="date" name="data_inicio"/><br>
             Data Fim:  <input type="date" name="data_fim"/><br>
             <input type="submit" value="Enviar" name="submit">

             </form>
<?php
	     function insereCursa(){
		include('db.php');
		   
		 $sigla = $_POST["sigla"];
		 $cpf  = $_POST["cpf"];
		 $data_inicio = $_POST["data_inicio"];
		 $data_fim = $_POST["data_fim"];
		 $sql = "call labbd.insereCursa('$sigla', '$cpf', '$data_inicio', '$data_fim');";
		 header("Content-Type: text/html; charset=ISO-8859-1",true);
		if ($con->query($sql) === TRUE) {
		     echo "Inserido com sucesso.";
		 }
		 else {
		     echo "Erro: dados errados";
		 }
	     }
	     if(isset($_POST['submit']))
	     {
		insereCursa();
	     }

	include('db.php');
             $sql = "SELECT * FROM cursa";
             $result = $con->query($sql);
             echo "<br>";
             echo "<table border=3>";
             echo "<th> Sigla </th> <th> Cpf</th>  <th> Data Inicio</th> <th> Data Fim</th>";
             if ($result->num_rows > 0) {
                 // output data of each row
                 while($row = $result->fetch_assoc()) {
                   echo "<tr>";
                     echo "<td>" ;
                     echo  $row["sigla"];
                     echo "</td>";
                     echo "<td>" ;
                     echo $row["cpf"];
                     echo "</td>";
                     echo "<td>" ;
                     echo $row["data_inicio"];
                     echo "</td>";
                     echo "<td>" ;
                     echo $row["data_fim"];
                     echo "</td>";
                   echo "</tr>";
                 }
             echo "</table>";
             } 
?>

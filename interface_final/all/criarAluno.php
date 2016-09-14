 						<h1>Aluno</h1> <! colocar nome da tabela >
 						<p>
						      <form  method="post"> <! mesmo nome deste arquivo, respectivo a tabela > 
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
								Sexo: 	<input type="radio" name="gender" value="H"/><br> Homem
										<input type="radio" name="gender" value="M"/><br> Mulher
								Cor: <input type="text" name="color"/><br>
								Perfil: <input type="text" name="profile"/><br>
								RA: <input type="text" name="ra"/><br>
								Escola de conclusao do ensino medio: <input type="text" name="nome_escola"/><br>
								Ano de conclusao: <input type="date" name="dta_conc_medio"/><br>
			 
						      <input type="submit" value="Enviar" name="submit">
						      </form>

						      <?php
						      function insereAluno(){ //modificar nome dessa funcao, lembrar de mudar abaixo tambem

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

								$sql = "call labbd.insereAluno('$mae_p', '$pai_p', '$pais_p', '$uf_p', '$dta_nasc_p', '$ano_ing_p', '$sexo_p', '$cor_p', '$reenq_p', '$ra_p', '$cpf_p', '$conc_nome_p', '$ano_conc_p', '$nome_p', '$nome_meio_p', '$sobrenome_p')";

							  header("Content-Type: text/html; charset=ISO-8859-1",true);

							 if ($con->query($sql) === TRUE) {
							      echo "Inserido com sucesso";
							  }
							  else {
							      echo "Erro: dados errados";
							  }

							  $con->close();
						      }

						      if(isset($_POST['submit']))
						      {
							 insereAluno(); //dispara funcao criada acima
						      }

						      $host     = "localhost";
						      $port     = 3306;
						      $socket   = "";
						      $user     = "root";
						      $password = "";
						      $dbname   = "labbd";

						      $con = new mysqli($host, $user, $password, $dbname, $port, $socket)
							      or die ('Could not connect to the database server' . mysqli_connect_error());
						      $sql = "SELECT * FROM vdadospessoaisaluno"; //select nos dados da tabela para esta funcao
						      $result = $con->query($sql);
						      echo "<br>";

						      echo "<table border=3>";
						      echo "<th> CPF </th> <th> Nome </th> <th> Nome do Meio </th> <th> Sobrenome </th> <th> Nome da Mae </th> <th> Nome do Pai </th> <th> Pais </th> <th> UF </th> <th> Data de Nascimento </th> <th> Ano Ingresso </th> <th> Sexo </th> <th> Cor </th> <th> Reenquadramento </th> <th> RA </th> <th> Conclusao em Nome </th> <th> Conclusao em Ano </th> <th> IRA </th>"; //atributos da tabela
						      if ($result->num_rows > 0) {

							  while($row = $result->fetch_assoc()) {
							    echo "<tr>";
							      echo "<td>" ;
							      echo  $row["cpf"]; //nomes dos atributos
							      echo "</td>";
							      echo "<td>" ;
							      echo $row["prenome"]; //nomes dos atributos
							      echo "</td>";
								  echo "<td>" ;
							      echo $row["nome_meio"]; //nomes dos atributos
							      echo "</td>";
								  echo "<td>" ;
							      echo $row["sobrenome"]; //nomes dos atributos
							      echo "</td>";
								  echo "<td>" ;
							      echo $row["nome_da_mae"]; //nomes dos atributos
							      echo "</td>";
								  echo "<td>" ;
							      echo $row["nome_do_pai"]; //nomes dos atributos
							      echo "</td>";
								  echo "<td>" ;
							      echo $row["pais"]; //nomes dos atributos
							      echo "</td>";
								  echo "<td>" ;
							      echo $row["uf"]; //nomes dos atributos
							      echo "</td>";
								  echo "<td>" ;
							      echo $row["data_nascimento"]; //nomes dos atributos
							      echo "</td>";
								  echo "<td>" ;
							      echo $row["ano_ingresso"]; //nomes dos atributos
							      echo "</td>";
								  echo "<td>" ;
							      echo $row["sexo"]; //nomes dos atributos
							      echo "</td>";
								  echo "<td>" ;
							      echo $row["cor"]; //nomes dos atributos
							      echo "</td>";
								  echo "<td>" ;
							      echo $row["reenquadramento"]; //nomes dos atributos
							      echo "</td>";
								  echo "<td>" ;
							      echo $row["ra"]; //nomes dos atributos
							      echo "</td>";
								  echo "<td>" ;
							      echo $row["conclusao_em_nome"]; //nomes dos atributos
							      echo "</td>";
								  echo "<td>" ;
							      echo $row["conclusao_em_ano"]; //nomes dos atributos
							      echo "</td>";
								  echo "<td>" ;
							      echo $row["IRA"]; //nomes dos atributos
							      echo "</td>";
	$table='aluno';
	$id_name='cpf';
		echo '<td><a href="delete.php?table='.$table.'&id_name='.$id_name.'&id='.$row[$id_name].'">Delete</a></td>';
							    echo "</tr>";
							  }

						      echo "</table>";
						      } else {
							  echo "0 results";
						      }
						      $con->close();
						   ?>
            					</p>
 					

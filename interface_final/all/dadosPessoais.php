           <h1>Dados Pessoais</h1>
           <p >

             <form method="post" align=”center”>
              CPF : <input type="text" name="cpf" /><br>
             <input type="submit" value="Enviar" name="submit">
             </form>

             <?php

                 $cpf = $_POST["cpf"];

             $host     = "localhost";
             $port     = 3306;
             $socket   = "";
             $user     = "root";
             $password = "";
             $dbname   = "labbd";

             $con = new mysqli($host, $user, $password, $dbname, $port, $socket)
                     or die ('Could not connect to the database server' . mysqli_connect_error());

             $sql = "select * from vdadospessoaisaluno where cpf='$cpf';";
             $result =$con->query($sql); 
             $row = $result->fetch_assoc();

             echo "<br>";
         
             
                    	 echo "Cpf: ";
		     echo  $row["cpf"];
		     echo "<br>";
		     
			echo "Nome: ";
		     echo  $row["prenome"];
			echo " ";
		     echo  $row["nome_meio"];
			echo " ";
	             echo  $row["sobrenome"];
		     echo "<br>";
			
			echo "Nome da mae: ";
		     echo  $row["nome_da_mae"];
		     echo "<br>";
			
			echo "Nome do pai: ";
		     echo  $row["nome_do_pai"];
		     echo "<br>";
			
			echo "Pais: ";
		     echo  $row["pais"];
		     echo "<br>";
			
			echo "UF: ";
		     echo  $row["uf"];
		     echo "<br>";

			echo "Data Nascimento: ";
		     echo  $row["data_nascimento"];
		     echo "<br>";

			echo "Ano Ingresso: ";
		     echo  $row["ano_ingresso"];
		     echo "<br>";

			echo "Sexo: ";
		     echo  $row["sexo"];
		     echo "<br>";

			echo "Cor: ";
		     echo  $row["cor"];
		     echo "<br>";
		
			echo "Reenquadramento: ";
		     echo  $row["reenquadramento"];
		     echo "<br>";

			echo "RA: ";
		     echo  $row["ra"];
		     echo "<br>";

			echo "Conclusao em nome: ";
		     echo  $row["conclusao_em_nome"];
		     echo "<br>";

			echo "Conclusao em ano: ";
		     echo  $row["conclusao_em_ano"];
		     echo "<br>";

			echo "IRA: ";
		     echo  $row["IRA"];
		     echo "<br>";
                    
                    
                 


             $con->close();
          ?>


           </p>

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
			nav ul :hover {
    	background-color: white;

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
						<h1>Teste</h1>
						<p>Ola, eu sou o Thiago! bla bla bla </p>
					</div>
				</div>
			</main>

      <nav id="nav">
        <div class="innertube">
          <h2>Adm</h2>
          <ul><a href= http://localhost/my_site/Index.php>Sair</a></ul>
          <ul><a href= http://localhost/my_site/admIndex.php>Home</a></ul>
          <h3>Cadastros</h3>
          <ul>
            <li><a href="http://localhost/my_site/criarCentroAcademico.php">CentroAcademico</a></li>
            <li><a href="http://localhost/my_site/criarDepartamento.php">Departamento</a></li>
            <li><a href="http://localhost/my_site/criarDisciplina.php">Disciplina</a></li>
            <li><a href="http://localhost/my_site/criarCurso.php">Curso</a></li>
            <li><a href="http://localhost/my_site/criarReconhecimento.php">Reconhecimento</a></li>
            <li><a href="http://localhost/my_site/criarAtividadeAdministrativa.php">AtividadeAdministrativa</a></li>
            <li><a href="http://localhost/my_site/criarPossuiAtividadeAdministrativa.php">AtribuirAtvAdministrativa</a></li>
            <li><a href="http://localhost/my_site/criarRecesso.php">Recesso</a></li>
            <li><a href="http://localhost/my_site/criarPossuiRecesso.php">AtribuirRecesso</a></li>
          </ul>
          <h3>Açoes</h3>
          <ul>
            <li><a href="http://localhost/my_site/fazDeferimento.php">Fazer Deferimento dos alunos</a></li>
            <li><a href="#">Link 2</a></li>
            <li><a href="#">Link 3</a></li>
            <li><a href="#">Link 4</a></li>
            <li><a href="#">Link 5</a></li>
          </ul>
          <h3>Left heading</h3>
          <ul>
            <li><a href="#">Link 1</a></li>
            <li><a href="#">Link 2</a></li>
            <li><a href="#">Link 3</a></li>
            <li><a href="#">Link 4</a></li>
            <li><a href="#">Link 5</a></li>
          </ul>
        </div>
      </nav>

    </div>
  </body>
</html>

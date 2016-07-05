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

		</style>

		<script type="text/javascript">
			/* =============================
			This script generates sample text for the body content.
			You can remove this script and any reference to it.
			 =============================*/
		</script>
colocar head aki
	</head>

	<body>
		<div id="wrapper">

			<main>
				<div id="content">
					<div class="innertube">
						<h1>Teste</h1>
						<p>Ola</p>
					</div>
				</div>
			</main>

			<nav id="nav">
				<div class="innertube">
					<h3>Cadastros</h3>
					<ul>
						<li><a href="#">Pessoa</a></li>
						<li><a href="#">Aluno</a></li>
						<li><a href="http://localhost/my_site/departamento.php">Departamento</a></li>
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

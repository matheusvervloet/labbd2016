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
			nav ul :hover {
				margin: 1;
			background-color: white;

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

			<?php include("sidebarDocente.php"); ?>


    </div>
  </body>
</html>

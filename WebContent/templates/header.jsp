<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>GET Movie</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/bootstrap.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/bootstrap.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/styles.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.2/jquery.min.js"></script>
<script
	src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
</head>
<body>
	<header class="container">
		<img class="logo"
			src="${pageContext.request.contextPath}/images/logo/logo.gif"
			alt="Logo de la aplicación GET Movie">
		<h1>Puntea, Comenta y Encuentra tu pel&iacute;cula favorita</h1>
		<br>
	</header>

	<nav class="container navbar navbar-inverse">
		<div class="container-fluid">
			<div class="active navbar-header">
				<button type="button" class="navbar-toggle collapsed"
					data-toggle="collapse" data-target="#bs-example-navbar-collapse-2">
					<span class="sr-only">Toggle navigation</span> <span
						class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="#">Home</a>
			</div>

			<div class="container collapse navbar-collapse"
				id="bs-example-navbar-collapse-2">
				<ul class="nav navbar-nav">
					<li><a
						href="${pageContext.request.contextPath}/vistas/pelicula/home.jsp">Pel&iacute;cula
							<span class="sr-only">(current)</span>
					</a></li>
					<li><a
						href="${pageContext.request.contextPath}/vistas/genero/home.jsp">G&eacute;nero
					</a></li>
					<li><a
						href="${pageContext.request.contextPath}/vistas/actor/home.jsp">Actor
					</a></li>
					<li><a
						href="${pageContext.request.contextPath}/vistas/director/home.jsp">Director
					</a></li>
					<li><a
						href="${pageContext.request.contextPath}/vistas/productora/home.jsp">Productora
					</a></li>
				</ul>
				<ul class="nav navbar-nav navbar-right">
          <li class="dropdown">
            <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">Cuenta <span class="caret"></span></a>
            <ul class="dropdown-menu" role="menu">
              <li><a href="#">Registrarse</a></li>
              <li><a href="${pageContext.request.contextPath}/vistas/cuenta/login.jsp"">Iniciar sesión</a></li>
            </ul>
          </li>
        </ul>
			</div>
		</div>
	</nav>
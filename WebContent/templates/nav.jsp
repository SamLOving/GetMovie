<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<nav class="container navbar navbar-inverse">
	<div class="container-fluid">
		<div class="active navbar-header">
			<button type="button" class="navbar-toggle collapsed"
				data-toggle="collapse" data-target="#bs-example-navbar-collapse-2">
				<span class="sr-only">Toggle navigation</span> <span
					class="icon-bar"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span>
			</button>
			<a class="navbar-brand"
				href="${pageContext.request.contextPath}/home">Home</a>
		</div>

		<div class="container collapse navbar-collapse"
			id="bs-example-navbar-collapse-2">
			<ul class="nav navbar-nav navbar-right">
				<li class="dropdown">
					<a href="#" class="dropdown-toggle"
					data-toggle="dropdown" role="button" aria-expanded="true">Cuenta<span class="caret"></span></a>
					<ul class="dropdown-menu" role="menu">
						<li><a href="${pageContext.request.contextPath}/login">Iniciar sesi&oacute;n</a></li>
						<li><a href="${pageContext.request.contextPath}/register">Registrarse</a></li>
					</ul>
				</li>
			</ul>
		</div>
	</div>
</nav>
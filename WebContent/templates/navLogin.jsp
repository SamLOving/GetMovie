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
			<ul class="nav navbar-nav">
				<li><a
					href="${pageContext.request.contextPath}/vistas/pelicula/home.jsp">Pel&iacute;cula
						<span class="sr-only">(current)</span>
				</a></li>
				<li><a
					href="${pageContext.request.contextPath}/vistas/genero/HomeGenero.jsp">G&eacute;nero
				</a></li>
				<li><a
					href="${pageContext.request.contextPath}/vistas/actor/home.jsp">Actor
				</a></li>
				<li><a
					href="${pageContext.request.contextPath}/vistas/director/home.jsp">Director
				</a></li>
				<li><a
					href="${pageContext.request.contextPath}/vistas/productora/HomeProductora.jsp">Productora
				</a></li>
			</ul>
			<ul class="nav navbar-nav navbar-right">
				<li><a
					href="${pageContext.request.contextPath}/cuenta/home">Cuenta</a></li>
			</ul>
		</div>
	</div>
</nav>
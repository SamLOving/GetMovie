<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="ec.edu.epn.getmovie.model.*"%>
<jsp:include page="/templates/header.jsp"></jsp:include>
<%
Usuario usuario = (Usuario) request.getSession().getAttribute("usuarioActivo");
%>

<section class="container">
	<ul class="breadcrumb">
		<li><a href="${pageContext.request.contextPath}/vistas/home.jsp">Home</a>
  		<li class="active">Cuenta</li>
	</ul>
	<div class="row">
		<div class="col-lg-9">
			<a href="${pageContext.request.contextPath}/cuenta/info" class="btn btn-default btn-lg btn-block">Ver cuenta</a>
			<%
			if (usuario.getIsadmin() == (byte) 1) {
			%>
			<a href="${pageContext.request.contextPath}/cuenta/registrar" class="btn btn-default btn-lg btn-block">Registrar usuario</a>
			<a href="${pageContext.request.contextPath}/cuenta/administrar" class="btn btn-default btn-lg btn-block">Administrar</a>
			<%
			} else {
			%>
			<br>
			<form method="get" action="${pageContext.request.contextPath}/cuenta/modificar">
				<button class="btn btn-default btn-lg btn-block" 
				name="usuarioModificar" value="<%=usuario.getCorreousr()%>">Modificar Cuenta</button>
			</form>
			<br>
			<form method="get" action="${pageContext.request.contextPath}/cuenta/eliminar">
				<button class="btn btn-default btn-lg btn-block" 
				name="usuarioEliminar" value="<%=usuario.getCorreousr()%>">Eliminar Cuenta</button>
			</form>
			<br>
			<%} %>
			<a href="${pageContext.request.contextPath}/cuenta/cerrarsesion" class="btn btn-default btn-lg btn-block">Cerrar sesión</a>
		</div>
		<div>
			<div class="col-lg-3">
				<jsp:include page="/templates/aside.jsp"></jsp:include>
			</div>
		</div>
	</div>
</section>

<jsp:include page="/templates/footer.jsp"></jsp:include>
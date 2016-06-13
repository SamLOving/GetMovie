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
  		<li class="active">Pel&iacute;cula</li>
	</ul>
	<div class="row">
		<div class="col-lg-9">
			<%
			if (usuario.getIsadmin() == (byte) 1) {
			%>
			<a href="${pageContext.request.contextPath}/pelicula/registrar"
				class="btn btn-default btn-lg btn-block">Registrar</a> 
			<a href="${pageContext.request.contextPath}/pelicula/administrar"
				class="btn btn-default btn-lg btn-block">Administrar</a> 
			<%
			}
			%>
			<a href="${pageContext.request.contextPath}/pelicula/puntuar"
				class="btn btn-default btn-lg btn-block">Puntuar</a> 
			<a href="${pageContext.request.contextPath}/pelicula/recomendacion"
				class="btn btn-default btn-lg btn-block">Obtener Recomendaci&oacute;n</a>
		</div>
		<div>
			<div class="col-lg-3">
				<jsp:include page="/templates/aside.jsp"></jsp:include>
			</div>
		</div>
	</div>
</section>

<jsp:include page="/templates/footer.jsp"></jsp:include>
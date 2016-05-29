<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<jsp:include page="/templates/header.jsp"></jsp:include>

<section class="container">
	<div class="row">
		<div class="col-lg-9">
			<a
				href="${pageContext.request.contextPath}/vistas/pelicula/registrar.jsp"
				class="btn btn-default btn-lg btn-block">Registrar</a> <a
				href="${pageContext.request.contextPath}/vistas/pelicula/administrar.jsp"
				class="btn btn-default btn-lg btn-block">Administrar</a> <a
				href="${pageContext.request.contextPath}/vistas/pelicula/puntuar.jsp"
				class="btn btn-default btn-lg btn-block">Puntuar</a> <a
				href="${pageContext.request.contextPath}/vistas/pelicula/recomendacion.jsp"
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
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>    
<jsp:include page="/templates/header.jsp"></jsp:include>

<section class="container">
	<div class="row">
		<div class="col-lg-9">
			<a href="${pageContext.request.contextPath}/vistas/cuenta/infoCuenta.jsp" class="btn btn-default btn-lg btn-block">Ver cuenta</a>
			<a href="${pageContext.request.contextPath}/vistas/cuenta/registrar.jsp" class="btn btn-default btn-lg btn-block">Registrar usuario</a>
			<a href="${pageContext.request.contextPath}/vistas/cuenta/administrar.jsp" class="btn btn-default btn-lg btn-block">Administrar</a>
			<a href="${pageContext.request.contextPath}/vistas/home.jsp" class="btn btn-default btn-lg btn-block">Cerrar sesión</a>
		</div>
		<div>
			<div class="col-lg-3">
				<jsp:include page="/templates/aside.jsp"></jsp:include>
			</div>
		</div>
	</div>
</section>

<jsp:include page="/templates/footer.jsp"></jsp:include>
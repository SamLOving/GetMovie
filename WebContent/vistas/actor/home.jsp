<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<jsp:include page="/templates/header.jsp"></jsp:include>

<section class="container">
	<ul class="breadcrumb">
		<li><a href="${pageContext.request.contextPath}/vistas/home.jsp">Home</a>
  		<li class="active">Actor</li>
	</ul>
	<h1>Men&uacute; de administraci&oacute;n de actores</h1>
	<div class="row">
		<div class="col-lg-9">
			<a href="${pageContext.request.contextPath}/vistas/actor/registrar.jsp" 
				class="btn btn-default btn-lg btn-block">Registrar</a>
			<a href="${pageContext.request.contextPath}/vistas/actor/administrar.jsp" 
				class="btn btn-default btn-lg btn-block">Administrar</a>
		</div>
		<div>
			<div class="col-lg-3">
				<jsp:include page="/templates/aside.jsp"></jsp:include>
			</div>
		</div>
	</div>
</section>

<jsp:include page="/templates/footer.jsp"></jsp:include>
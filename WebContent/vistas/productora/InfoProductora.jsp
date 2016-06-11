<%@page import="ec.edu.epn.getmovie.model.Productora"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%
	Productora productorEnVista = (Productora) request
			.getAttribute("productoraParaInfo");
%>

<jsp:include page="/templates/header.jsp"></jsp:include>
<section class="container">
	<ul class="breadcrumb">
		<li><a href="${pageContext.request.contextPath}/home">Home</a>
		<li><a
			href="${pageContext.request.contextPath}/productora/home">Productora</a></li>
		<li class="active">Info</li>
	</ul>
	<div class="row">
		<div class="col-lg-9">
			<form class="form-horizontal" method="get" action="${pageContext.request.contextPath}/productora/info">
				<fieldset>
					<legend>Informaci&oacute;n de Productora</legend>
					<div class="form-group">
						<label for="nombre" class="col-lg-2 control-label">Nombre</label>
						<div class="col-lg-10">
							<input type="text" class="form-control" id="Nombre"
								readonly="true"
								value="<%=productorEnVista.getNombreproductora()%>">
						</div>
					</div>
					<div class="form-group">
						<label for="nombre" class="col-lg-2 control-label">Pa&iacute;s
							de Productora</label>
						<div class="col-lg-10" >
							<input type="text" class="form-control" id="Nombre" 
								 readonly="true" value="<%=productorEnVista.getPaisproductora()%>">
						</div>
					</div>

				</fieldset>
				<div>
					<button type="submit" class="btn btn-primary" data-container="body"
						data-toggle="popover" data-placement="top">Volver</button>
				</div>
			</form>

		</div>
		<div>
			<div class="col-lg-3">
				<jsp:include page="/templates/aside.jsp"></jsp:include>
			</div>
		</div>
	</div>
</section>

<jsp:include page="/templates/footer.jsp"></jsp:include>
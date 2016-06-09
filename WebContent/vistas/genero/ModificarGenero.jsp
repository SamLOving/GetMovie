<%@page import="ec.edu.epn.getmovie.model.Genero"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%	
	Genero generoEnVista = (Genero)request.getAttribute("GeneroModificadoParaLaVista");
%>
<jsp:include page="/templates/header.jsp"></jsp:include>
<section class="container">
	<ul class="breadcrumb">
		<li><a href="${pageContext.request.contextPath}/home">Home</a>
		<li><a
			href="${pageContext.request.contextPath}/genero/home">G&eacute;nero</a></li>
		<li class="active">Registrar</li>
	</ul>
	<div class="row">
		<div class="col-lg-9">
			<form class="form-horizontal" method="post">
				<fieldset>
					<legend>Modificaci&oacute;n de G&eacute;nero</legend>
					<div class="form-group">
						<label for="nombre" class="col-lg-2 control-label">Nombre</label>
						<div class="col-lg-10">
							<input type="text" class="form-control" id="Nombre"
								placeholder="Nombre" name="nombreGeneroSeteadoModificado"
								value="<%=generoEnVista.getNombregenero() %>">
						</div>
					</div>
					<div class="form-group">
						<label for="textArea" class="col-lg-2 control-label">Descripci&oacute;n</label>
						<div class="col-lg-10">
							<textarea class="form-control" rows="3" id="textArea" name="descripcionGeneroSeteadoModificado">
							<%=generoEnVista.getDescripciongenero() %>
							</textarea>

						</div>
					</div>

				</fieldset>
				<div>
					<button type="submit" class="btn btn-primary" data-container="body"
						data-toggle="popover" data-placement="top">Modificar</button>
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
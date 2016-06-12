<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="ec.edu.epn.getmovie.model.*" %>
<jsp:include page="/templates/header.jsp"></jsp:include>
<%
Pelicula p = (Pelicula) request.getAttribute("pelicula");
%>

<section class="container">
	<div class="row">
		<div class="col-lg-9">
			<div class="row"></div>
			<form class="form-horizontal" id="loginForm">
				<fieldset>
					<legend>Información de la Pel&iacute;cula</legend>
					<%
					try {
					%>
					<div class="col-lg-4">
						<input type="image" id="image" class="img-info-portada"
							src="<%=p.getFotopelicula()%>"
							alt="Portada de la película <%=p.getNombrepelicula()%>">
					</div>
					<div class="form-group col-lg-8">
						<label class="col-xs-4 label-info1"><b>Nombre</b></label>
						<label for="inputName" class="col-xs-8"><%=p.getNombrepelicula()%></label>
					</div>
					<div class="form-group col-lg-8">
						<label class="col-xs-4 label-info1"><b>G&eacute;nero</b></label>
						<label for="inputName" class="col-xs-4"><%=p.getGenero().getNombregenero()%></label>
					</div>
					<div class="form-group col-lg-8">
						<label class="col-xs-4 label-info1"><b>Actor Principal</label>
						<label for="inputName" class="col-xs-4"><%=p.getActor().getNombreactor()%></label>
					</div>
					<div class="form-group col-lg-8">
						<label class="col-xs-4 label-info1"><b>Director</label>
						<label for="inputName" class="col-xs-4"><%=p.getDirector().getNombredirector()%></label>
					</div>
					<div class="form-group col-lg-8">
						<label class="col-xs-4 label-info1"><b>Productora</label>
						<label for="inputName" class="col-xs-8"><%=p.getProductora().getNombreproductora()%></label>
					</div>
					<div class="form-group col-lg-8">
						<label class="col-xs-4 label-info1"><b>Sin&oacute;psis</label>
						<label for="inputName" class="col-xs-8"><%=p.getSinopsispelicula()%></label>
					</div>
					<div class="form-group col-lg-12">
						<br>
						<a type="submit" class="btn btn-primary" href="${pageContext.request.contextPath}/vistas/pelicula/home.jsp"
							data-container="body" data-toggle="popover" data-placement="top">Regresar</a>
					</div>
					<%
					} catch (Exception e) {
						
					}
					%>
				</fieldset>
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
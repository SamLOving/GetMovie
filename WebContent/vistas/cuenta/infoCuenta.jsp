<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="ec.edu.epn.getmovie.model.*"%>
<jsp:include page="/templates/header.jsp"></jsp:include>

<%
Usuario usuario = (Usuario) request.getSession().getAttribute("usuarioActivo");
String nombre = "";
String email = "";

if (usuario != null){
	nombre = usuario.getNombreusr();
	email = usuario.getCorreousr();
}
%>

<section class="container">
	<div class="row">
		<div class="col-lg-9">
			<form class="form-horizontal">
				<fieldset>
					<legend>Información de Usuario</legend>
					<div class="form-group">
						<label for="inputName" class="col-lg-2 control-label">Nombre</label>
						<div class="col-lg-10">
							<input type="text" value="<%=nombre%>" class="form-control" id="inputName"
								placeholder="Name" readonly>
						</div>
					</div>
					<div class="form-group">
						<label for="inputEmail" class="col-lg-2 control-label">Email</label>
						<div class="col-lg-10">
							<input type="text" value="<%=email%>" class="form-control" id="inputEmail"
								placeholder="Email" readonly>
						</div>
					</div>
				</fieldset>
			</form>
			<div>
				<a href="${pageContext.request.contextPath}/cuenta/home" type="submit" class="btn btn-primary" data-container="body"
					data-toggle="popover" data-placement="top">Regresar</a>
			</div>
		</div>
		<div>
			<div class="col-lg-3">
				<jsp:include page="/templates/aside.jsp"></jsp:include>
			</div>
		</div>
	</div>
</section>

<jsp:include page="/templates/footer.jsp"></jsp:include>
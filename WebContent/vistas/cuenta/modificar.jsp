<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>    
<%@ page import="ec.edu.epn.getmovie.model.*"%>
<%
Usuario usuario = (Usuario) request.getAttribute("usuarioModificar");
String nombre = "";
String email = "";
String clave = "";

if (usuario != null){
	nombre = usuario.getNombreusr();
	email = usuario.getCorreousr();
	clave = usuario.getClaveusr();
}
%>

<jsp:include page="/templates/header.jsp"></jsp:include>

<section class="container">
	<div class="row">
		<div class="col-lg-9">
			<form class="form-horizontal">
				<fieldset>
					<legend>Modificaci&oacute;n de Usuarios</legend>
					<div class="form-group">
						<label for="inputName" class="col-lg-2 control-label">Nombre</label>
						<div class="col-lg-10">
							<input type="text" class="form-control" id="inputName"
								placeholder="Nombre" value="<%=usuario.getNombreusr()%>">
						</div>
					</div>
					<div class="form-group">
						<label for="inputEmail" class="col-lg-2 control-label">Email</label>
						<div class="col-lg-10">
							<input type="email" class="form-control" id="inputEmail"
								placeholder="Email" value="<%=usuario.getCorreousr()%>" readonly>
						</div>
					</div>
					<div class="form-group">
						<label for="inputPassword" class="col-lg-2 control-label">Contraseña</label>
						<div class="col-lg-10">
							<input type="password" class="form-control" id="inputPassword" value="<%=usuario.getClaveusr()%>"
								name="password" placeholder="Contraseña" required pattern=".{8,16}"
								title="La contraseña debe contener de 8 a 16 caracteres">
						</div>
					</div>
					<div class="form-group">
						<label for="inputPassword" class="col-lg-2 control-label">Confirmar contraseña</label>
						<div class="col-lg-10">
							<input type="password" class="form-control" id="inputPassword" value="<%=usuario.getClaveusr()%>"
								name="password" placeholder="Confirmar contraseña" required pattern=".{8,16}"
								title="La contraseña debe contener de 8 a 16 caracteres">
						</div>
					</div>
				</fieldset>
			</form>
			<div>
				<button type="submit" class="btn btn-primary" data-container="body"
					data-toggle="popover" data-placement="top">Modificar</button>
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
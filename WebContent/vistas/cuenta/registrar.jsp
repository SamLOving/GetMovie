<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<jsp:include page="/templates/header.jsp"></jsp:include>

<section class="container">
	<div class="row">
		<div class="col-lg-9">
			<form class="form-horizontal" id="loginForm">
				<fieldset>
					<legend>Registro de Usuario</legend>
					<div class="form-group">
						<label for="inputName" class="col-lg-2 control-label">Nombre</label>
						<div class="col-lg-10">
							<input type="text" class="form-control" id="inputName"
								name="username" placeholder="Nombre" pattern=".{3,50}" required
								title="Únicamente se admiten nombres de hasta 50 caracteres">
						</div>
					</div>
					<div class="form-group">
						<label for="inputEmail" class="col-lg-2 control-label">Email</label>
						<div class="col-lg-10">
							<input type="text" class="form-control" id="inputEmail"
								placeholder="Email" required
								pattern="^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*$"
								title="El email ingresado debe tener el formato adecuado, p. ej: nombre@dominio.com"
								pattern=".{3,100}"
								title="&Uacute;nicamente se admiten emails de hasta 100 caracteres">
						</div>
					</div>
					<div class="form-group">
						<label for="inputPassword" class="col-lg-2 control-label">Contraseña</label>
						<div class="col-lg-10">
							<input type="password" class="form-control" id="inputPassword"
								name="password" placeholder="Contraseña" required pattern=".{8,16}"
								title="La contraseña debe contener de 8 a 16 caracteres">
						</div>
					</div>
					<div class="form-group">
						<label for="inputPassword" class="col-lg-2 control-label">Confirmar contraseña</label>
						<div class="col-lg-10">
							<input type="password" class="form-control" id="inputPassword"
								name="password" placeholder="Confirmar contraseña" required pattern=".{8,16}"
								title="La contraseña debe contener de 8 a 16 caracteres">
						</div>
					</div>
					<div>
						<button type="submit" class="btn btn-primary"
							data-container="body" data-toggle="popover" data-placement="top">Registrar</button>
					</div>
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
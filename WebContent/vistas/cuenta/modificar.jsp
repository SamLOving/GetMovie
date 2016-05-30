<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>    
<jsp:include page="/templates/header.jsp"></jsp:include>

<section class="container">
	<div class="row">
		<div class="col-lg-9">
			<form class="form-horizontal">
				<fieldset>
					<legend>Modificaci�n de Usuarios</legend>
					<div class="form-group">
						<label for="inputName" class="col-lg-2 control-label">Nombre</label>
						<div class="col-lg-10">
							<input type="text" class="form-control" id="inputName"
								placeholder="Nombre" value="Samantha">
						</div>
					</div>
					<div class="form-group">
						<label for="inputEmail" class="col-lg-2 control-label">Email</label>
						<div class="col-lg-10">
							<input type="email" class="form-control" id="inputEmail"
								placeholder="Email" value="sam@dominio.com">
						</div>
					</div>
					<div class="form-group">
						<label for="inputPassword" class="col-lg-2 control-label">Contrase�a</label>
						<div class="col-lg-10">
							<input type="password" class="form-control" id="inputPassword" value="12345678"
								name="password" placeholder="Contrase�a" required pattern=".{8,16}"
								title="La contrase�a debe contener de 8 a 16 caracteres">
						</div>
					</div>
					<div class="form-group">
						<label for="inputPassword" class="col-lg-2 control-label">Confirmar contrase�a</label>
						<div class="col-lg-10">
							<input type="password" class="form-control" id="inputPassword" value="12345678"
								name="password" placeholder="Confirmar contrase�a" required pattern=".{8,16}"
								title="La contrase�a debe contener de 8 a 16 caracteres">
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
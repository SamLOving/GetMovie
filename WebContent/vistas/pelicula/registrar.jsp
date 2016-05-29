<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<jsp:include page="/templates/header.jsp"></jsp:include>

<section class="container">
	<div class="row">
		<div class="col-lg-9">
			<form class="form-horizontal" id="loginForm">
				<fieldset>
					<legend>Registro de Pel&iacute;cula</legend>
					<div class="form-group">
						<label for="inputName" class="col-lg-2 control-label">Nombre</label>
						<div class="col-lg-10">
							<input type="text" class="form-control" id="inputName"
								name="username" placeholder="Nombre" pattern=".{3,150}" required
								title="Únicamente se admiten nombres de hasta 150 caracteres">
						</div>
					</div>
					<div class="form-group">
						<label for="inputName" class="col-lg-2 control-label">G&eacute;nero</label>
						<div class="col-lg-10">
							<select class="form-control" id="select">
								<option selected value="0">Comedia</option>
								<option value="1">Terror</option>
								<option value="2">Romance</option>
								<option value="3">Misterio</option>
								<option value="4">Aventura</option>
							</select>
						</div>
					</div>
					<div class="form-group">
						<label for="inputName" class="col-lg-2 control-label">Actor</label>
						<div class="col-lg-10">
							<select class="form-control" id="select">
								<option selected value="0">Adam Sandler</option>
								<option value="1">Actor2</option>
								<option value="2">Actor3</option>
								<option value="3">Actor4</option>
								<option value="4">Actor5</option>
							</select>
						</div>
					</div>
					<div class="form-group">
						<label for="inputName" class="col-lg-2 control-label">Director</label>
						<div class="col-lg-10">
							<select class="form-control" id="select">
								<option selected value="0">Frank Coraci</option>
								<option value="1">Director2</option>
								<option value="2">Director3</option>
								<option value="3">Director4</option>
								<option value="4">Director5</option>
							</select>
						</div>
					</div>
					<div class="form-group">
						<label for="inputName" class="col-lg-2 control-label">Productora</label>
						<div class="col-lg-10">
							<select class="form-control" id="select">
								<option selected value="0">Warner Brothers</option>
								<option value="1">Sony</option>
								<option value="2">Happy Madison Productions</option>
								<option value="3">Productora4</option>
								<option value="4">Productora5</option>
							</select>
						</div>
					</div>
					<div class="form-group">
						<label for="inputEmail" class="col-lg-2 control-label">Sin&oacute;psis</label>
						<div class="col-lg-6">
							<textarea class="form-control" rows="3" id="textArea" required
								pattern=".{3,300}"
								title="La sinopsis debe tener máximo 300 caracteres"></textarea>
							<span class="help-block">Redactar la sinopsis de la pel&iacute;cula en m&aacute;ximo 300 caracteres.</span>
						</div>
						<label for="inputName" class="col-lg-2 control-label">Año
							de lanzamiento</label>
						<div class="col-lg-2">
							<select class="form-control" id="select">
								<option selected value="0">2015</option>
								<option value="1">2014</option>
								<option value="2">2013</option>
								<option value="3">2012</option>
								<option value="4">2011</option>
							</select>
						</div>
					</div>
					<div class="form-group">
						<label for="inputPassword" class="col-lg-2 control-label">Portada</label>
						<div class="col-lg-10">
							<input type="image" id="image"
								class="btn btn-upload img-responsive2"
								src="${pageContext.request.contextPath}/images/uploadImage.png"
								alt="Imagen de la prenda"><input type="file"
								id="inputFile" name="inputFile" onchange="readURL(this);">
							<p class="help-block">Portada de la película</p>
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

<script type="text/javascript">
<!--
	//-->
	function readURL(input) {
		if (input.files && input.files[0]) {
			var reader = new FileReader();

			reader.onload = function(e) {
				$('#image').attr('src', e.target.result).height(200);
			};

			reader.readAsDataURL(input.files[0]);
		}
	}
</script>
<jsp:include page="/templates/footer.jsp"></jsp:include>
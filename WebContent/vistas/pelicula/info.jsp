<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<jsp:include page="/templates/header.jsp"></jsp:include>

<section class="container">
	<div class="row">
		<div class="col-lg-9">
			<div class="row"></div>
			<form class="form-horizontal" id="loginForm">
				<fieldset>
					<legend>Información de la Pel&iacute;cula</legend>
					<div class="col-lg-4">
						<input type="image" id="image" class="img-info-portada"
							src="${pageContext.request.contextPath}/images/peliculas/luna de miel en familia.jpg"
							alt="Portada de luna de miel en familia">
					</div>
					<div class="form-group col-lg-8">
						<label class="col-xs-4 label-info1"><b>Nombre</b></label>
						<label for="inputName" class="col-xs-8">Luna de miel en familia</label>
					</div>
					<div class="form-group col-lg-8">
						<label class="col-xs-4 label-info1"><b>G&eacute;nero</b></label>
						<label for="inputName" class="col-xs-4">Comedia</label>
					</div>
					<div class="form-group col-lg-8">
						<label class="col-xs-4 label-info1"><b>Actor Principal</label>
						<label for="inputName" class="col-xs-4">Adam Sandler</label>
					</div>
					<div class="form-group col-lg-8">
						<label class="col-xs-4 label-info1"><b>Director</label>
						<label for="inputName" class="col-xs-4">Frank Coraci</label>
					</div>
					<div class="form-group col-lg-8">
						<label class="col-xs-4 label-info1"><b>Productora</label>
						<label for="inputName" class="col-xs-8">Warner Brothers</label>
					</div>
					<div class="form-group col-lg-8">
						<label class="col-xs-4 label-info1"><b>Sin&oacute;psis</label>
						<label for="inputName" class="col-xs-8">Después de una desastrosa cita a ciegas, los padres solteros Lauren (Barrymore) y Jim (Sandler) están de acuerdo en una sola cosa: nunca quieren ver otra vez. Pero cuando cada uno de ellos se inscriben por separado para unas vacaciones en familia fabulosa, con sus hijos, todos ellos están atrapados compartiendo una suite en un lujoso complejo de safari en África durante una semana.</label>
					</div>
					<div class="form-group col-lg-12">
						<a type="submit" class="btn btn-primary" href="${pageContext.request.contextPath}/vistas/pelicula/home.jsp"
							data-container="body" data-toggle="popover" data-placement="top">Regresar</a>
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
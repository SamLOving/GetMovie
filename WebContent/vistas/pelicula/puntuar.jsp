<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<jsp:include page="/templates/header.jsp"></jsp:include>

<section class="container">
	<div class="row">
		<div class="col-lg-9">
			<form class="form-horizontal" id="loginForm">
				<fieldset>
					<legend>Puntuar de Pel&iacute;culas</legend>
					<div>
						<div class="form-group">
							<label for="inputName" class="col-lg-2 control-label">Buscar
								por</label>
							<div class="col-lg-10">
								<select class="form-control" id="select">
									<option selected value="0">Todos</option>
									<option value="1">Actor</option>
									<option value="2">Director</option>
									<option value="3">Género</option>
									<option value="4">Productora</option>
								</select>
							</div>
						</div>
						<div class="form-group">
							<label for="inputName" class="col-lg-2 control-label">Filtro</label>
							<div class="col-lg-10">
								<input type="text" class="form-control" id="inputName"
									name="username" placeholder="Filtro">
							</div>
						</div>
						<div>
							<button type="submit" class="btn btn-primary"
								data-container="body" data-toggle="popover" data-placement="top">Buscar</button>
						</div>
					</div>
				</fieldset>
			</form>
			<div class="col-lg-12 col-center">
				<div id="myCarousel" class="carousel slide" data-ride="carousel"
					data-interval="false">
					<!-- data-interval="false"-->
					<!-- Indicators -->
					<ol class="carousel-indicators">
						<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
						<li data-target="#myCarousel" data-slide-to="1"></li>
						<li data-target="#myCarousel" data-slide-to="2"></li>
					</ol>

					<!-- Wrapper for slides -->
					<div class="carousel-inner" role="listbox">
						<div class="item active">
							<center>
								<img
									src="${pageContext.request.contextPath}/images/peliculas/luna de miel en familia.jpg"
									alt="Prendas superiores" class="img-responsive1">
							</center>
						</div>
						<div class="item">
							<center>
								<img
									src="${pageContext.request.contextPath}/images/peliculas/orgullo y prejuicio.jpeg"
									alt="Prendas superiores" class="img-responsive1">
							</center>
						</div>
						<div class="item" align="center">
							<img
								src="${pageContext.request.contextPath}/images/peliculas/piratas del caribe.jpg"
								alt="Imagen que muestra los diferentes géneros de una película"
								class="img-info-portada">
							<div class="carousel-caption">
								<h3>Piratas del Caribe</h3>
								<p></p>
							</div>
						</div>
					</div>

					<!-- Left and right controls -->
					<a class="left carousel-control" href="#myCarousel" role="button"
						data-slide="prev"> <span
						class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
						<span class="sr-only">Previous</span>
					</a> <a class="right carousel-control" href="#myCarousel" role="button"
						data-slide="next"> <span
						class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
						<span class="sr-only">Next</span>
					</a>
				</div>
			</div>
			<div class="col-lg-12 col-center">
				<label class="col-xs-4 label-info1"><b>Deja tu puntuaci&oacute;n</b></label>
				<div class="ec-stars-wrapper">
					<a href="#" data-value="1" title="Votar con 1 estrellas">&#9733;</a>
					<a href="#" data-value="2" title="Votar con 2 estrellas">&#9733;</a>
					<a href="#" data-value="3" title="Votar con 3 estrellas">&#9733;</a>
					<a href="#" data-value="4" title="Votar con 4 estrellas">&#9733;</a>
					<a href="#" data-value="5" title="Votar con 5 estrellas">&#9733;</a>
				</div>
				<noscript>Necesitas tener habilitado javascript para
					poder votar</noscript>
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
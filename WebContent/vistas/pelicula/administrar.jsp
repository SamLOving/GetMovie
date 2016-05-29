<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<jsp:include page="/templates/header.jsp"></jsp:include>

<section class="container">
	<div class="row">
		<div class="col-lg-9">
			<form class="form-horizontal" id="loginForm">
				<fieldset>
					<legend>Administración de Pel&iacute;culas</legend>
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
			<div class="formclass">
				<div class="row">
					<div class="col-xs-12">
						<table class="table table-striped table-hover ">
							<thead>
								<tr>
									<th class="col-xs-3">Portada</th>
									<th class="col-xs-8">Pel&iacute;cula</th>
									<th class="col-xs-1">Acci&oacute;n</th>
								</tr>
							</thead>

							<tbody>
								<tr>
									<td><img alt="Portada 1" class="img-portada"
										src="${pageContext.request.contextPath}/images/peliculas/luna de miel en familia.jpg"></td>
									<td>Luna de miel en familia</td>
									<td>
										<form method="get" class="btnclass"
											action="${pageContext.request.contextPath}/vistas/pelicula/modificar.jsp">
											<button type="submit" class="btn btn-default" value=""
												name="peliculaModificar">
												<span class="material-icons md-16">&#xE150;</span>
											</button>
										</form>
										<form method="post" class="btnclass"
											action="${pageContext.request.contextPath}/vistas/pelicula/home.jsp">
											<button type="submit" class="btn btn-default" value=""
												name="peliculaEliminar">
												<i class="material-icons md-16">&#xE872;</i>
											</button>
										</form>
										<form method="post" class="btnclass"
											action="${pageContext.request.contextPath}/vistas/pelicula/info.jsp">
											<button type="submit" class="btn btn-default" value=""
												name="peliculaEliminar">
												<i class="material-icons">&#xE8F4;</i>
											</button>
										</form>
									</td>
								</tr>
								<tr>
									<td><img alt="Portada 1" class="img-portada"
										src="${pageContext.request.contextPath}/images/peliculas/piratas del caribe.jpg"></td>
									<td>Piratas del Caribe</td>
									<td>
										<form method="get" class="btnclass"
											action="${pageContext.request.contextPath}/vistas/pelicula/modificar.jsp">
											<button type="submit" class="btn btn-default" value=""
												name="peliculaModificar">
												<span class="material-icons md-16">&#xE150;</span>
											</button>
										</form>
										<form method="post" class="btnclass"
											action="${pageContext.request.contextPath}/vistas/pelicula/home.jsp">
											<button type="submit" class="btn btn-default" value=""
												name="peliculaEliminar">
												<i class="material-icons md-16">&#xE872;</i>
											</button>
										</form>
										<form method="post" class="btnclass"
											action="${pageContext.request.contextPath}/vistas/pelicula/info.jsp">
											<button type="submit" class="btn btn-default" value=""
												name="peliculaEliminar">
												<i class="material-icons">&#xE8F4;</i>
											</button>
										</form>
									</td>
								</tr>
								<tr>
									<td><img alt="Portada de la película ..." class="img-portada"
										src="${pageContext.request.contextPath}/images/peliculas/orgullo y prejuicio.jpeg"></td>
									<td>Orgullo y Prejuicio</td>
									<td>
										<form method="get" class="btnclass"
											action="${pageContext.request.contextPath}/vistas/pelicula/modificar.jsp">
											<button type="submit" class="btn btn-default" value=""
												name="peliculaModificar">
												<span class="material-icons md-16">&#xE150;</span>
											</button>
										</form>
										<form method="post" class="btnclass"
											action="${pageContext.request.contextPath}/vistas/pelicula/home.jsp">
											<button type="submit" class="btn btn-default" value=""
												name="peliculaEliminar">
												<i class="material-icons md-16">&#xE872;</i>
											</button>
										</form>
										<form method="post" class="btnclass"
											action="${pageContext.request.contextPath}/vistas/pelicula/info.jsp">
											<button type="submit" class="btn btn-default" value=""
												name="peliculaVer">
												<i class="material-icons">&#xE8F4;</i>
											</button>
										</form>
									</td>
								</tr>
							</tbody>
						</table>
					</div>
				</div>
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
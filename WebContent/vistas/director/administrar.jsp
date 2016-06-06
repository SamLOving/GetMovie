<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<jsp:include page="/templates/header.jsp"></jsp:include>
<section class="container">
<ul class="breadcrumb">
		<li><a href="${pageContext.request.contextPath}/vistas/home.jsp">Home</a>
		<li><a href="${pageContext.request.contextPath}/vistas/director/home.jsp">Director</a></li>
  		<li class="active">Administrar</li>
	</ul>
	<div class="row">
		<div class="col-lg-9">
			<form class="form-horizontal" id="loginForm">
				<fieldset>
					<legend>Administraci&oacute;n de Directores</legend>
					<div>
						<div class="form-group">
							<label for="nombre" class="col-lg-1 control-label">Nombre</label>
							<div class="col-lg-11">
								<input type="text" class="form-control" id="nombreActor"
									name="nombreDirector" placeholder="Nombre del director">
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
									<th class="col-xs-11">Nombre</th>
									<th class="col-xs-1">Acci&oacute;n</th>
								</tr>
							</thead>

							<tbody>
								<tr>
									<td>Bryan Singer</td>
									<td>
										<form method="get"
											action="${pageContext.request.contextPath}/vistas/director/modificar.jsp">
											<button type="submit" class="btn btn-default" value=""
												name="directorModificar">
												<span class="material-icons md-16">&#xE150;</span>
											</button>
										</form>
									</td>
									<td>
										<form method="post"
											action="${pageContext.request.contextPath}/vistas/director/home.jsp">
											<button type="submit" class="btn btn-default" value=""
												name="directorEliminar">
												<i class="material-icons md-16">&#xE872;</i>
											</button>
										</form>
									</td>
									<td>
										<form method="get"
											action="${pageContext.request.contextPath}/vistas/director/info.jsp">
											<button type="submit" class="btn btn-default" value=""
												name="directorInfo">
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
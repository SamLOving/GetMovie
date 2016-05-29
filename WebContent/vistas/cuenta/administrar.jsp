<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<jsp:include page="/templates/header.jsp"></jsp:include>

<section class="container">
	<div class="row">
		<div class="col-lg-9">
			<form class="form-horizontal" id="loginForm">
				<fieldset>
					<legend>Administración de Usuarios</legend>
					<div>
						<div class="form-group">
							<label for="inputName" class="col-lg-1 control-label">Email</label>
							<div class="col-lg-11">
								<input type="text" class="form-control" id="inputName"
									name="username" placeholder="Email">
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
									<th class="col-xs-11">Email</th>
									<th class="col-xs-1">Acci&oacute;n</th>
								</tr>
							</thead>

							<tbody>
								<tr>
									<td>sam@dominio.com</td>
									<td>
										<form method="get"
											action="${pageContext.request.contextPath}/vistas/cuenta/modificar.jsp">
											<button type="submit" class="btn btn-default" value=""
												name="usuarioModificar">
												<span class="material-icons md-16">&#xE150;</span>
											</button>
										</form>
									</td>
									<td>
										<form method="post"
											action="${pageContext.request.contextPath}/vistas/cuenta/home.jsp">
											<button type="submit" class="btn btn-default" value=""
												name="usuarioEliminar">
												<i class="material-icons md-16">&#xE872;</i>
											</button>
										</form>
									</td>
								</tr>
								<tr>
									<td>andres@dominio.com</td>
									<td>
										<form method="get"
											action="${pageContext.request.contextPath}/vistas/cuenta/modificar.jsp">
											<button type="submit" class="btn btn-default" value=""
												name="usuarioModificar">
												<span class="material-icons md-16">&#xE150;</span>
											</button>
										</form>
									</td>
									<td>
										<form method="post"
											action="${pageContext.request.contextPath}/vistas/cuenta/home.jsp">
											<button type="submit" class="btn btn-default" value=""
												name="usuarioEliminar">
												<i class="material-icons md-16">&#xE872;</i>
											</button>
										</form>
									</td>
								</tr>
								<tr>
									<td>stan@dominio.com</td>
									<td>
										<form method="get"
											action="${pageContext.request.contextPath}/vistas/cuenta/modificar.jsp">
											<button type="submit" class="btn btn-default" value=""
												name="usuarioModificar">
												<span class="material-icons md-16">&#xE150;</span>
											</button>
										</form>
									</td>
									<td>
										<form method="post"
											action="${pageContext.request.contextPath}/vistas/cuenta/home.jsp">
											<button type="submit" class="btn btn-default" value=""
												name="usuarioEliminar">
												<i class="material-icons md-16">&#xE872;</i>
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
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.*, ec.edu.epn.getmovie.model.*" %>
<jsp:include page="/templates/header.jsp"></jsp:include>
<%
Collection<Pelicula> listaPelicula = (Collection<Pelicula>) request.getAttribute("listaPelicula");
%>

<section class="container">
	<div class="row">
		<div class="col-lg-9">
			<form class="form-horizontal" id="loginForm" method="get" 
				action="${pageContext.request.contextPath}/pelicula/administrar">
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
							<%
							try {
								for (Pelicula p : listaPelicula){
							
							%>
							<tbody>
								<tr>
									<td><img alt="Portada de la película <%=p.getNombrepelicula()%>" class="img-portada"
										src="<%=p.getFotopelicula()%>"></td>
									<td><%=p.getNombrepelicula() %></td>
									<td>
										<form method="get" class="btnclass"
											action="${pageContext.request.contextPath}/pelicula/modificar">
											<button type="submit" class="btn btn-default" value="<%=p.getIdpelicula()%>"
												name="peliculaModificar">
												<span class="material-icons md-16">&#xE150;</span>
											</button>
										</form>
										<form method="post" class="btnclass"
											action="${pageContext.request.contextPath}/pelicula/eliminar">
											<button type="submit" class="btn btn-default" value="<%=p.getIdpelicula()%>"
												name="peliculaEliminar">
												<i class="material-icons md-16">&#xE872;</i>
											</button>
										</form>
										<form method="post" class="btnclass"
											action="${pageContext.request.contextPath}/pelicula/info">
											<button type="submit" class="btn btn-default" value="<%=p.getIdpelicula()%>"
												name="peliculaInfo">
												<i class="material-icons">&#xE8F4;</i>
											</button>
										</form>
									</td>
								</tr>
							</tbody>
							<%
								}
							} catch (Exception e) {
								System.out.println("Error al listar peliculas");
							}
							%>
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
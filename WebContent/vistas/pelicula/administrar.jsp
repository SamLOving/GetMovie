<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.*, ec.edu.epn.getmovie.model.*" %>
<jsp:include page="/templates/header.jsp"></jsp:include>
<%
Collection<Pelicula> listaPelicula = (Collection<Pelicula>) request.getAttribute("listaPelicula");

String findby = (String) request.getAttribute("findBy");
String nombre = (String) request.getAttribute("nombre");

if (findby == null)
	findby = "0";
if (nombre == null)
	nombre = "";
%>

<section class="container">
	<div class="row">
		<div class="col-lg-9">
			<form class="form-horizontal" id="loginForm" method="post" 
				action="${pageContext.request.contextPath}/pelicula/administrar">
				<fieldset>
					<legend>Administración de Pel&iacute;culas</legend>
					<div>
						<div class="form-group">
							<label for="inputName" class="col-lg-2 control-label">Buscar
								por</label>
							<div class="col-lg-10">
								<select class="form-control" id="findBy" name="findBy">
								<%
								if ("0".equals(findby)) {
								%>
									<option selected value="0">Todos</option>
									<option value="1">Actor</option>
									<option value="2">Director</option>
									<option value="3">Género</option>
									<option value="4">Productora</option>
								<%
								} else if ("1".equals(findby)) {
								%>
									<option value="0">Todos</option>
									<option selected value="1">Actor</option>
									<option value="2">Director</option>
									<option value="3">Género</option>
									<option value="4">Productora</option>
								<%
								} else if ("2".equals(findby)) {
								%>
									<option value="0">Todos</option>
									<option value="1">Actor</option>
									<option selected value="2">Director</option>
									<option value="3">Género</option>
									<option value="4">Productora</option>
								<%
								} else if ("3".equals(findby)) {
								%>
									<option value="0">Todos</option>
									<option value="1">Actor</option>
									<option value="2">Director</option>
									<option selected value="3">Género</option>
									<option value="4">Productora</option>
								<%
								} else if ("4".equals(findby)) {
								%>
									<option value="0">Todos</option>
									<option value="1">Actor</option>
									<option value="2">Director</option>
									<option value="3">Género</option>
									<option selected value="4">Productora</option>
								<%
								}
								%>
								</select>
							</div>
						</div>
						<div class="form-group">
							<label for="inputName" class="col-lg-2 control-label">Nombre</label>
							<div class="col-lg-10">
								<input type="text" class="form-control" id="nombre"
									name="nombre" placeholder="Nombre" value="<%=nombre%>">
							</div>
						</div>
						<div>
							<button type="submit" class="btn btn-primary"
								data-container="body" data-toggle="popover" data-placement="top">Buscar</button>
						</div>
					</div>
				</fieldset>
			</form>
			
			<!--
			<form>
		        Enter Your Name: <input type="text" id="userName" />
		    </form>
		    <br>
		    <br>
		    <strong>Ajax Response</strong>:
		    <div id="ajaxGetUserServletResponse"></div>
		    -->
		    
			<div class="formclass">
				<div class="row">
					<div class="col-xs-12">
						<%
						try {
						%>
						<table class="table table-striped table-hover ">
							<thead>
								<tr>
									<th class="col-xs-3">Portada</th>
									<th class="col-xs-8">Pel&iacute;cula</th>
									<th class="col-xs-1">Acci&oacute;n</th>
								</tr>
							</thead>
							<%
								for (Pelicula p : listaPelicula) {
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
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.*, ec.edu.epn.getmovie.model.*"%>
<jsp:include page="/templates/header.jsp"></jsp:include>
<%
Collection<Pelicula> listaPelicula = (Collection<Pelicula>) request.getSession().getAttribute("listaPelicula");
request.setAttribute("listaPeliculaInfo", listaPelicula);

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
				action="${pageContext.request.contextPath}/pelicula/puntuar">
				<fieldset>
					<legend>Puntuar de Pel&iacute;culas</legend>
					<div>
						<div class="form-group">
							<label for="inputName" class="col-lg-2 control-label">Buscar por</label>
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
			
			<div class="formclass">
				<div class="row">
					<div class="col-xs-12">
						<%
						try {
						%>
						<table class="table table-hover ">
							<tbody>
								<tr>
									<td class="col-lg-9">
										<div class="col-lg-12">
											<div id="myCarousel" class="carousel slide" data-ride="carousel" data-interval="false">
												<!-- data-interval="false" -->
												<!-- Wrapper for slides -->
												<%
												System.out.println(listaPelicula.size());
												for (int i = 0; i < listaPelicula.size(); i++) {
												%>
												<ol class="carousel-indicators">
													<%
													if (i == 1) {
													%>
													<li data-target="#myCarousel" data-slide-to="<%=i%>" class="active"></li>
													<%
													} else {
													%>
													<li data-target="#myCarousel" data-slide-to="<%=i%>"></li>
													<%
													}
													%>
												</ol>
												<%
												}
												%>
												<div class="carousel-inner" role="listbox">
													<%
													int contadorPeliculas = 0;
													for (Pelicula p : listaPelicula) {
														if (contadorPeliculas == 0) {
															System.out.println("**"+p.getIdpelicula());
															contadorPeliculas ++;
													%>
													<div class="item active">
														<center>
														<img src="<%=p.getFotopelicula()%>" 
															alt="Portada de la película"
															class="img-info-portada">
														</center>
													</div>
													<%
														} else {
													%>
													<div class="item" >
														<center>
														<img src="<%=p.getFotopelicula()%>"
															alt="Portada de la película"
															class="img-info-portada">
														</center>
													</div>
													<%
														} 
													}
													%>
												</div>
												
												<!-- Left and right controls -->
												<a class="left carousel-control" href="#myCarousel" role="button"
													data-slide="prev"> <span
													class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
													<span class="sr-only">Previous</span>
												</a> <a class="right carousel-control" href="#myCarousel"
													role="button" data-slide="next"> <span
													class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
													<span class="sr-only">Next</span>
												</a>
											</div>
										</div>
									</td>
									<td class="col-lg-3" align="center">
										<form method="post" class="btnclass"
											action="${pageContext.request.contextPath}/pelicula/info">
											<button type="submit" class="btn btn-default" value="0"
												name="pInfo" id="peliculaInfo">
												<i class="material-icons">&#xE8F4;</i>
											</button>
										</form>
										<div class="col-lg-12 col-center">
											<div class="ec-stars-wrapper">
												<a href="#" data-value="1" title="Votar con 1 estrellas"><i class="material-icons">&#xE838;</i></a>
												<a href="#" data-value="2" title="Votar con 2 estrellas"><i class="material-icons">&#xE838;</i></a>
												<a href="#" data-value="3" title="Votar con 3 estrellas"><i class="material-icons">&#xE838;</i></a>
												<a href="#" data-value="4" title="Votar con 4 estrellas"><i class="material-icons">&#xE838;</i></a>
												<a href="#" data-value="5" title="Votar con 5 estrellas"><i class="material-icons">&#xE838;</i></a>
											</div>
											<noscript>Necesitas tener habilitado javascript para
												poder votar</noscript>
										</div>
									</td>
								</tr>
							</tbody>
							<%
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
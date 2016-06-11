<%@page import="java.util.Collection"%>
<%@page import="ec.edu.epn.getmovie.model.Genero"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%
	Collection<Genero> listaGeneros = (Collection<Genero>) request.getAttribute("listaGenerosParaLaVista");
%>
<jsp:include page="/templates/header.jsp"></jsp:include>
<section class="container">
<ul class="breadcrumb">
		<li><a href="${pageContext.request.contextPath}/home">Home</a>
		<li><a href="${pageContext.request.contextPath}/genero/home">G&eacute;nero</a></li>
		<li class="active">Administrar</li>
	</ul>
	<div class="row">
		<div class="col-lg-9">
			<form class="form-horizontal" id="loginForm" method="get" action="${pageContext.request.contextPath}/genero/administrar" >
				<fieldset>
					<legend>Administraci&oacute;n de G&eacute;neros</legend>
					<div>
						<div class="form-group">
							<label for="nombre" class="col-lg-1 control-label">Nombre</label>
							<div class="col-lg-11">
								<input type="text" class="form-control" id="nombreGenero"
									name="nombreGeneroDesdeVistaParaBuscar"
									placeholder="Nombre del genero">
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
							<%
								try{
														for(Genero g: listaGeneros){
							%>

							<tbody>
								<tr>
									<td><%=
											g.getNombregenero()
										%></td>
									<td>
										<form method="get"
											action="${pageContext.request.contextPath}/genero/modificar">
											<button type="submit" class="btn btn-default"
												value="<%=g.getIdgenero()%>"
												name="generoModificarDesdeVista">
												<span class="material-icons md-16">&#xE150;</span>
											</button>
										</form>
									</td>
									<td>
										<form method="post"
											action="${pageContext.request.contextPath}/genero/eliminar">
											<button type="submit" class="btn btn-default"
												value="<%=g.getIdgenero()%>" name="generoEliminarDesdeVista">
												<i class="material-icons md-16">&#xE872;</i>
											</button>
										</form>
									</td>
									<td>
									<form method="get"
											action="${pageContext.request.contextPath}/genero/info">
											<button type="submit" class="btn btn-default" value="<%=g.getIdgenero()%>"
												name="generoInfoDesdeVista">
												<i class="material-icons">&#xE8F4;</i>
											</button>
										</form>
									</td>
								</tr>
							</tbody>
							<%
								}
												} catch (Exception e){
													System.out.println("Error al listar genero");
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
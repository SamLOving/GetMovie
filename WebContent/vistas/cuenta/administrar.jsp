<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.*, ec.edu.epn.getmovie.model.*"%>
<%
Collection<Usuario> listaUsuario = (Collection<Usuario>) request.getAttribute("listaUsuario");
%>

<jsp:include page="/templates/header.jsp"></jsp:include>

<section class="container">
	<div class="row">
		<div class="col-lg-9">
			<form class="form-horizontal" id="loginForm">
				<fieldset>
					<legend>Administraci&oacute;n de Usuarios</legend>
					<div>
						<div class="form-group">
							<label for="inputName" class="col-lg-1 control-label">Email</label>
							<div class="col-lg-11">
								<input type="text" class="form-control" id="inputEmail"
									name="email" placeholder="Email">
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
							
							<%
							try {
								for (Usuario u : listaUsuario) {
							%>
							
							<tbody>
								<tr>
									<td><%=u.getCorreousr()%></td>
									<td>
										<form method="get"
											action="${pageContext.request.contextPath}/cuenta/modificar">
											<button type="submit" class="btn btn-default" value="<%=u.getCorreousr()%>"
												name="usuarioModificar">
												<span class="material-icons md-16">&#xE150;</span>
											</button>
										</form>
									</td>
									<td>
										<form method="post"
											action="${pageContext.request.contextPath}/cuenta/eliminar">
											<button type="submit" class="btn btn-default" value="<%=u.getCorreousr()%>"
												name="usuarioEliminar">
												<i class="material-icons md-16">&#xE872;</i>
											</button>
										</form>
									</td>
								</tr>
							</tbody>
							<%
									}
								} catch (Exception e){
									System.out.println("Error al listar usuarios");
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
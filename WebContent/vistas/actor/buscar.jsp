<%@page import="ec.edu.epn.getmovie.model.Actor"%>
<%@page import="java.util.Collection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<% 
	Collection<Actor> listaActores = (Collection<Actor>)request.getAttribute("listaActor");
%>
<jsp:include page="/templates/header.jsp"></jsp:include>
<section class="container">
<ul class="breadcrumb">
		<li><a href="${pageContext.request.contextPath}/home">Home</a>
		<li><a href="${pageContext.request.contextPath}/actor/home">Actor</a></li>
  		<li class="active">Informaci&oacute;n</li>
	</ul>
	<div class="row">
		<div class="col-lg-9">
			<form class="form-horizontal" id="loginForm" method="get" action="${pageContext.request.contextPath}/actor/buscar"]>
				<fieldset>
					<legend>Informaci&oacute;n de Actores</legend>
					<div>
						<div class="form-group">
							<label for="nombre" class="col-lg-1 control-label">Nombre</label>
							<div class="col-lg-11">
								<input type="text" class="form-control" id="nombreActor"
									name="nombreActor" placeholder="Nombre del actor">
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
							<%
								try{
									
								for (Actor actor:listaActores){
							%>
								<tr>
									<td><%=actor.getNombreactor() %></td>
									<td>
										<form method="get"
											action="${pageContext.request.contextPath}/actor/info">
											<button type="submit" class="btn btn-default" value="<%=actor.getIdactor() %>"
												name="actorInfo">
												<i class="material-icons">&#xE8F4;</i>
											</button>
										</form>
									</td>
								</tr>
								<%
								} }catch(Exception e){
									System.out.println("No hay lista de actores");
								}
								%>
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
<%@page import="java.util.Collection, ec.edu.epn.getmovie.model.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%
	Collection<Director> listaDirectores = (Collection<Director>)request.getAttribute("listaDirector");
%>
<jsp:include page="/templates/header.jsp"></jsp:include>
<section class="container">
<ul class="breadcrumb">
		<li><a href="${pageContext.request.contextPath}/home">Home</a>
		<li><a href="${pageContext.request.contextPath}/director/home">Director</a></li>
  		<li class="active">Informaci&oacute;n</li>
	</ul>
	<div class="row">
		<div class="col-lg-9">
			<form class="form-horizontal" id="loginForm" method="get" action="${pageContext.request.contextPath}/director/buscar">
				<fieldset>
					<legend>Informaci&oacute;n de Directores</legend>
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
							<%
								try{
								for(Director d:listaDirectores){
							%>
								<tr>
									<td><%=d.getNombredirector() %></td>
									<td>
										<form method="get"
											action="${pageContext.request.contextPath}/director/info">
											<button type="submit" class="btn btn-default" value="<%=d.getIddirector() %>"
												name="directorInfo">
												<i class="material-icons">&#xE8F4;</i>
											</button>
										</form>
									</td>
								</tr>
								<%
								} }catch(Exception e){
									System.out.println("error");
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
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="ec.edu.epn.getmovie.model.*" %>
<%
	Actor actor = (Actor)request.getAttribute("");
%>
<jsp:include page="/templates/header.jsp"></jsp:include>
<section class="container">
	<ul class="breadcrumb">
		<li><a href="${pageContext.request.contextPath}/vistas/home.jsp">Home</a>
		<li><a href="${pageContext.request.contextPath}/vistas/actor/home.jsp">Actor</a></li>
  		<li class="active">Modificar</li>
	</ul>
	<div class="row">
		<div class="col-lg-9">
			<form class="form-horizontal" method="post">
				<fieldset>
					<legend>Modificar los datos de <%=actor.getNombreactor() %></legend>
					<div class="form-group">
						<label for="nombre" class="col-lg-2 control-label">Nombre</label>
						<div class="col-lg-10">
							<input type="text" class="form-control" id="Nombre"
								placeholder="Nombre" value="<%=actor.getNombreactor()%>">
						</div>
					</div>
					<div class="form-group">
						<label for="fecha" class="col-lg-2 control-label">Fecha de nacimiento</label>
						<div class="col-lg-10">
							<input type="date" class="form-control" id="fecha" placeholder="dd-mm-yyyy" 
							name="fecha" value="<%=actor.getNacimiento()%>"/>
						</div>
					</div>
					<div class="form-group">
      					<label class="col-lg-2 control-label">G&eacute;nero</label>
      					<div class="col-lg-10">
        					<div class="radio">
          						<label>
            					<input type="radio" name="optionsRadios" id="optionsRadios1" value="Masculino">
            						Masculino
          						</label>
        						</div>
        					<div class="radio">
          						<label>
            					<input type="radio" name="optionsRadios" id="optionsRadios2" value="Femenino">
            						Femenino
          						</label>
        					</div>
      					</div>
    				</div>
					<div class="form-group">
						<label for="oscars" class="col-lg-2 control-label">N&uacute;mero de Oscars</label>
						<div class="col-lg-10">
							<input type="text" class="form-control" id="oscars" placeholder="Numero de oscars"
									value="<%=actor.getOscars()%>">
						</div>
					</div>
					<div class="form-group">
						<label for="imagenAutor" class="col-lg-2 control-label">Foto</label>
						<div class="col-lg-10">
							<input type="file" id="imagenAutor" />
						</div>
					</div>
					<div>
						<button type="submit" class="btn btn-primary" data-container="body"
						data-toggle="popover" data-placement="top">Modificar</button>
					</div>
				</fieldset>
			</form>
		</div>
		<div>
			<div class="col-lg-3">
				<jsp:include page="/templates/aside.jsp"></jsp:include>
			</div>
		</div>
	</div>
</section>

<jsp:include page="/templates/footer.jsp"></jsp:include>
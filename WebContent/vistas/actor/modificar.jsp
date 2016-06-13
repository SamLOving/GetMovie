<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="ec.edu.epn.getmovie.model.*" %>
<%
	Actor actor = (Actor)request.getAttribute("actorModifica");
%>
<jsp:include page="/templates/header.jsp"></jsp:include>
<section class="container">
	<ul class="breadcrumb">
		<li><a href="${pageContext.request.contextPath}/home">Home</a>
		<li><a href="${pageContext.request.contextPath}/actor/home">Actor</a></li>
  		<li class="active">Modificar</li>
	</ul>
	<div class="row">
		<div class="col-lg-9">
			<form class="form-horizontal" method="post" action="${pageContext.request.contextPath}/actor/modificar">
				<fieldset>
					<legend>Modificar los datos de <%=actor.getNombreactor() %></legend>
					<div class="form-group">
						<label for="nombre" class="col-lg-2 control-label">Nombre</label>
						<div class="col-lg-10">
							<input type="text" class="form-control" id="Nombre" name="nombre"
								placeholder="Nombre" value="<%=actor.getNombreactor()%>"required								
								pattern=".{3,50}"
								title="&Uacute;nicamente se admiten nombres de hasta 50 caracteres"/>
						</div>
					</div>
					<div class="form-group">
						<label for="fecha" class="col-lg-2 control-label">Fecha de nacimiento</label>
						<div class="col-lg-10">
							<input type="date" class="form-control" id="fecha" placeholder="dd-mm-yyyy" 
							name="fecha" value="<%=actor.getNacimiento()%>" required/>
						</div>
					</div>
					<%
						if(actor.getGenero()=="Masculino"){
					%>
					<div class="form-group">
      					<label class="col-lg-2 control-label">G&eacute;nero</label>
      					<div class="col-lg-10">
        					<div class="radio">
          						<label>
            					<input type="radio" name="genero" id="optionsRadios1" value="Masculino" 
            					checked readonly=true>
            						Masculino
          						</label>
        						</div>
        					<div class="radio">
          						<label>
            					<input type="radio" name="genero" id="optionsRadios2" value="Femenino"
            					readonly=true>
            						Femenino
          						</label>
        					</div>
      					</div>
    				</div>
    				<%
						}else{
    				%>
    				<div class="form-group">
      					<label class="col-lg-2 control-label">G&eacute;nero</label>
      					<div class="col-lg-10">
        					<div class="radio">
          						<label>
            					<input type="radio" name="genero" id="optionsRadios1" value="Masculino" 
            					readonly=true>
            						Masculino
          						</label>
        						</div>
        					<div class="radio">
          						<label>
            					<input type="radio" name="genero" id="optionsRadios2" value="Femenino"
            					checked readonly=true>
            						Femenino
          						</label>
        					</div>
      					</div>
    				</div>
    				<%
						}
    				%>
					<div class="form-group">
						<label for="oscars" class="col-lg-2 control-label">N&uacute;mero de Oscars</label>
						<div class="col-lg-10">
							<input type="text" class="form-control" id="oscars" placeholder="Numero de oscars"
									value="<%=actor.getOscars()%>" required name="oscars"
									pattern="^\d{1,2}$"
									title="&Uacute;nicamente se admiten n&uacute;meros de hasta 2 d&iacute;gitos"/>
						</div>
					</div>
					<input type="hidden" name="idActor" value="<%=actor.getIdactor() %>" />
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
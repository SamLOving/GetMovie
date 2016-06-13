<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import= "ec.edu.epn.getmovie.model.*" %>
<%
	Actor actor = (Actor)request.getAttribute("actorInf");
%>
<jsp:include page="/templates/header.jsp"></jsp:include>
<section class="container">
	<ul class="breadcrumb">
		<li><a href="${pageContext.request.contextPath}/home">Home</a>
		<li><a href="${pageContext.request.contextPath}/actor/home">Actor</a></li>
  		<li class="active">Informaci&iacute;on</li>
	</ul>
	<div class="row">
		<div class="col-lg-9">
			<form class="form-horizontal" method="get" action="${pageContext.request.contextPath}/actor/info">
				<fieldset>
					<legend>Informaci&oacute;n del actor <%=actor.getNombreactor()%></legend>
					<div class="form-group">
						<label for="nombre" class="col-lg-2 control-label">Nombre</label>
						<div class="col-lg-10">
							<input type="text" class="form-control" id="Nombre"
								placeholder="Nombre" value="<%= actor.getNombreactor() %>" readonly=true>
						</div>
					</div>
					<div class="form-group">
						<label for="fecha" class="col-lg-2 control-label">Fecha de nacimiento</label>
						<div class="col-lg-10">
							<input type="date" class="form-control" id="fecha" placeholder="dd-mm-yyyy" 
							name="fecha" value="<%=actor.getNacimiento() %>" readonly=true/>
						</div>
					</div>
					<div class="form-group">
      					<label class="col-lg-2 control-label">G&eacute;nero</label>
      					<div class="col-lg-10">
        					<div class="radio">
          						<label>
								<%
									if(actor.getGenero()=="Masculino"){
								%>
            					<input type="radio" name="optionsRadios" id="optionsRadios1" value="Masculino"
            						checked>
            						Masculino
            					<%
									}else{
            					%>
            					<input type="radio" name="optionsRadios" id="optionsRadios1" value="Masculino"
            						checked disabled="disabled"/>
            						Masculino
            					<%
    								}
    							%>
          						</label>
        						</div>
        					<div class="radio">
          						<label>
          						<%
									if(actor.getGenero()=="Femenino"){
								%>
            					<input type="radio" name="optionsRadios" id="optionsRadios2" value="Femenino"
            					 checked="checked" />
            						Femenino
            					<%
									}else{
            					%>
            					<input type="radio" name="optionsRadios" id="optionsRadios1" value="Femenino"
            						disabled="disabled"/>
            						Femenino
            					<%
    								}
    							%>
          						</label>
        					</div>
      					</div>
    				</div>
					<div class="form-group">
						<label for="oscars" class="col-lg-2 control-label">N&uacute;mero de Oscars</label>
						<div class="col-lg-10">
							<input type="text" class="form-control" id="oscars" 
							placeholder="Numero de oscars" value="<%=actor.getOscars() %>" readonly>
						</div>
					</div>
					<div>
						<a href="${pageContext.request.contextPath}/actor/home" type="submit" class="btn btn-primary" data-container="body"
							data-toggle="popover" data-placement="top">Regresar</a>
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
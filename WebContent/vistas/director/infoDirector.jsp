<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<jsp:include page="/templates/header.jsp"></jsp:include>
<section class="container">
	<ul class="breadcrumb">
		<li><a href="${pageContext.request.contextPath}/vistas/home.jsp">Home</a>
		<li><a href="${pageContext.request.contextPath}/vistas/director/home.jsp">Director</a></li>
  		<li class="active">Informaci&oacute;n del director</li>
	</ul>
	<div class="row">
		<div class="col-lg-9">
			<form class="form-horizontal">
				<fieldset>
					<legend>Informaci&oacute;n del director</legend>
					<div class="form-group">
						<label for="nombre" class="col-lg-2 control-label">Nombre</label>
						<div class="col-lg-10">
							<input type="text" class="form-control" id="Nombre"
								placeholder="Nombre" value="Bryan Singer" readonly=true>
						</div>
					</div>
					<div class="form-group">
						<label for="fecha" class="col-lg-2 control-label">Fecha de nacimiento</label>
						<div class="col-lg-10">
							<input type="date" class="form-control" id="fecha"  
							name="fecha" value=1965/09/17 readonly=true/>
						</div>
					</div>
					<div class="form-group">
      					<label class="col-lg-2 control-label">G&eacute;nero</label>
      					<div class="col-lg-10">
        					<div class="radio">
          						<label>
            					<input type="radio" name="optionsRadios" id="optionsRadios1" value="Masculino"
            						checked readonly=true>
            						Masculino
          						</label>
        						</div>
        					<div class="radio">
          						<label>
            					<input type="radio" name="optionsRadios" id="optionsRadios2" value="Femenino"
            					 readonly=true>
            						Femenino
          						</label>
        					</div>
      					</div>
    				</div>
					<div class="form-group">
						<label for="imagenDirector" class="col-lg-2 control-label">Foto</label>
						<div class="col-lg-10">
							<img src="${pageContext.request.contextPath}/images/director/1/singer.jpg" 
							class="img-responsive" alt="Responsive image">
						</div>
					</div>
				</fieldset>
			</form>
			<div>
				<a href="${pageContext.request.contextPath}/vistas/director/home.jsp" type="submit" class="btn btn-primary" data-container="body"
					data-toggle="popover" data-placement="top">Regresar</a>
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
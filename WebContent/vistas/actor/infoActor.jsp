<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<jsp:include page="/templates/header.jsp"></jsp:include>
<section class="container">
	<ul class="breadcrumb">
		<li><a href="${pageContext.request.contextPath}/vistas/home.jsp">Home</a>
		<li><a href="${pageContext.request.contextPath}/vistas/actor/home.jsp">Actor</a></li>
  		<li class="active">Informaci&iacute;on del actor</li>
	</ul>
	<div class="row">
		<div class="col-lg-9">
			<form class="form-horizontal">
				<fieldset>
					<legend>Informaci&oacute;n del Actor</legend>
					<div class="form-group">
						<label for="nombre" class="col-lg-2 control-label">Nombre</label>
						<div class="col-lg-10">
							<input type="text" class="form-control" id="Nombre"
								placeholder="Nombre" value="Leonardo DiCaprio" readonly=true>
						</div>
					</div>
					<div class="form-group">
						<label for="fecha" class="col-lg-2 control-label">Fecha de nacimiento</label>
						<div class="col-lg-10">
							<input type="date" class="form-control" id="fecha" placeholder="dd-mm-yyyy" 
							name="fecha" value=1974/11/11 readonly=true/>
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
						<label for="oscars" class="col-lg-2 control-label">N&uacute;mero de Oscars</label>
						<div class="col-lg-10">
							<input type="text" class="form-control" id="oscars" 
							placeholder="Numero de oscars" value="1" readonly=true>
						</div>
					</div>
					<div class="form-group">
						<label for="imagenActor" class="col-lg-2 control-label">Foto</label>
						<div class="col-lg-10">
							<img src="${pageContext.request.contextPath}/images/actor/1/dicaprio.jpg" 
							class="img-responsive" alt="Responsive image">
						</div>
					</div>
				</fieldset>
			</form>
			<div>
				<a href="${pageContext.request.contextPath}/vistas/actor/home.jsp" type="submit" class="btn btn-primary" data-container="body"
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
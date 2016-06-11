<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<jsp:include page="/templates/header.jsp"></jsp:include>
<section class="container">
	<ul class="breadcrumb">
		<li><a href="${pageContext.request.contextPath}/home">Home</a>
		<li><a href="${pageContext.request.contextPath}/director/home">Director</a></li>
  		<li class="active">Registrar</li>
	</ul>
	<div class="row">
		<div class="col-lg-9">
			<form class="form-horizontal" method="post" action="${pageContext.request.contextPath}/director/registrar">
				<fieldset>
					<legend>Registro de Director</legend>
					<div class="form-group">
						<label for="nombre" class="col-lg-2 control-label">Nombre</label>
						<div class="col-lg-10">
							<input type="text" class="form-control" id="Nombre"
								placeholder="Nombre" name="nombre" required>
						</div>
					</div>
					<div class="form-group">
						<label for="fecha" class="col-lg-2 control-label">Fecha de nacimiento</label>
						<div class="col-lg-10">
							<input type="date" class="form-control" id="fecha" placeholder="yyyy-mm-dd" 
								name="fecha" required/>
						</div>
					</div>
					<div class="form-group">
      					<label class="col-lg-2 control-label">G&eacute;nero</label>
      					<div class="col-lg-10">
        					<div class="radio">
          						<label>
            					<input type="radio" name="genero" id="generoM" value="Masculino">
            						Masculino
          						</label>
        						</div>
        					<div class="radio">
          						<label>
            					<input type="radio" name="genero" id="generoF" value="Femenino">
            						Femenino
          						</label>
        					</div>
      					</div>
    				</div>
					<div>
						<button type="submit" class="btn btn-primary" data-container="body"
							data-toggle="popover" data-placement="top">Registrar</button>
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
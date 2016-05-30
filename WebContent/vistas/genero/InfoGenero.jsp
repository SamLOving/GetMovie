<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<jsp:include page="/templates/header.jsp"></jsp:include>
<section class="container">
	<ul class="breadcrumb">
		<li><a href="${pageContext.request.contextPath}/vistas/home.jsp">Home</a>
		<li><a href="${pageContext.request.contextPath}/vistas/genero/HomeGenero.jsp">G&eacute;nero</a></li>
  		<li class="active">Registrar</li>
	</ul>
	<div class="row">
		<div class="col-lg-9">
			<form class="form-horizontal">
				<fieldset>
					<legend>Informaci&oacute;n de G&eacute;nero</legend>
					<div class="form-group">
						<label for="nombre" class="col-lg-2 control-label">Nombre</label>
						<div class="col-lg-10">
							<input type="text" class="form-control" id="Nombre"
								placeholder="Nombre" readonly="true" value="Romance">
						</div>
					</div>
					<div class="form-group">
      <label for="textArea" class="col-lg-2 control-label">Descripci&oacute;n</label>
      <div class="col-lg-10">
        <textarea class="form-control" rows="3" id="textArea" readonly="true" value="Buenas peliculas de amor " ></textarea>
        
      </div>
    </div>
					
				</fieldset>
			</form>
			<div>
				<button type="submit" class="btn btn-primary" data-container="body"
					data-toggle="popover" data-placement="top">Volver</button>
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
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.*, ec.edu.epn.getmovie.model.*"%>
<%@page
	import="java.util.*,javax.servlet.*,javax.servlet.http.*,javax.servlet.annotation.WebServlet,javax.servlet.annotation.MultipartConfig"%>
<jsp:include page="/templates/header.jsp"></jsp:include>
<%
Collection<Actor> listaActor = (Collection<Actor>) request.getAttribute("listaActor");
Collection<Director> listaDirector = (Collection<Director>) request.getAttribute("listaDirector");
Collection<Genero> listaGenero = (Collection<Genero>) request.getAttribute("listaGenero");
Collection<Productora> listaProductora = (Collection<Productora>) request.getAttribute("listaProductora");
%>

<section class="container">
	<div class="row">
		<div class="col-lg-9">
			<form class="form-horizontal" method="post" enctype="multipart/form-data"
				action="${pageContext.request.contextPath}/pelicula/registrar">
				<fieldset>
					<legend>Registro de Pel&iacute;cula</legend>
					<div class="col-lg-3">
						<div class="form-group">
							<label class="control-label">Portada</label>
							<div class="image-upload">
								<label for="inputFile">
									<img id="image" class="btn btn-upload img-responsive2"
										src="${pageContext.request.contextPath}/images/uploadImage.png"
										alt="Portada de la película">
								</label>
								<p class="help-block">Suba la Portada de la pel&iacute;cula</p>
								<input type="file"
									id="inputFile" name="inputFile" onchange="readURL(this);"
									accept="image/*" class="form-control btn btn-default">
							</div>
						</div>
					</div>
					<div class="col-lg-9">
						<div class="form-group">
							<label for="inputName" class="col-lg-2 control-label">Nombre</label>
							<div class="col-lg-10">
								<input type="text" class="form-control" id="nombre"
									name="nombre" placeholder="Nombre" pattern=".{3,150}"
									required
									title="Únicamente se admiten nombres de hasta 150 caracteres">
							</div>
						</div>
						<div class="form-group">
							<label for="inputName" class="col-lg-2 control-label">G&eacute;nero</label>
							<div class="col-lg-4">
								<select class="form-control" id="genero" name="genero">
								<%
								try {
									for (Genero g: listaGenero){
								%>
									<option value="<%=g.getIdgenero()%>"><%=g.getNombregenero() %></option>
								<%
									}
								} catch (Exception e) {
									System.out.println("Error al listar genero");
								}
								%>
								</select>
							</div>
							<label for="inputName" class="col-lg-2 control-label">Año</label>
							<div class="col-lg-4">
								<input type="month" class="form-control" name="anio" id="anio"
								required="required">
							</div>
						</div>
						<div class="form-group">
							<label for="inputName" class="col-lg-2 control-label">Actor</label>
							<div class="col-lg-10">
								<select class="form-control" id="actor" name="actor">
								<%
								try {
									for (Actor a: listaActor){
								%>
									<option value="<%=a.getIdactor()%>"><%=a.getNombreactor()%></option>
								<%
									}
								} catch (Exception e) {
									System.out.println("Error al listar actor");
								}
								%>
								</select>
							</div>
						</div>
						<div class="form-group">
							<label for="inputName" class="col-lg-2 control-label">Director</label>
							<div class="col-lg-10">
								<select class="form-control" id="director" name="director">
								<%
								try {
									for (Director d: listaDirector){
								%>
									<option value="<%=d.getIddirector()%>"><%=d.getNombredirector()%></option>
								<%
									}
								} catch (Exception e) {
									System.out.println("Error al listar director");
								}
								%>
								</select>
							</div>
						</div>
						<div class="form-group">
							<label for="inputName" class="col-lg-2 control-label">Productora</label>
							<div class="col-lg-10">
								<select class="form-control" id="productora" name="productora">
								<%
								try {
									for (Productora p: listaProductora){
								%>
									<option value="<%=p.getIdproductora()%>"><%=p.getNombreproductora()%></option>
								<%
									}
								} catch (Exception e) {
									System.out.println("Error al listar prodcutora");
								}
								%>
								</select>
							</div>
						</div>
						<div class="form-group">
							<label for="inputEmail" class="col-lg-2 control-label">Sin&oacute;psis</label>
							<div class="col-lg-10">
								<textarea class="form-control" rows="3" id="sinopsis" name="sinopsis" required
									pattern=".{3,300}"
									title="La sinopsis debe tener máximo 300 caracteres"></textarea>
								<span class="help-block">Redactar la sinopsis de la
									pel&iacute;cula en m&aacute;ximo 300 caracteres.</span>
							</div>
						</div>
					</div>
					<div>
						<button type="submit" class="btn btn-primary"
							data-container="body" data-toggle="popover" data-placement="top">Registrar</button>
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

<script type="text/javascript">
<!--
	//-->
	function readURL(input) {
		if (input.files && input.files[0]) {
			var reader = new FileReader();

			reader.onload = function(e) {
				$('#image').attr('src', e.target.result).height(200);
			};

			reader.readAsDataURL(input.files[0]);
		}
	}
</script>
<jsp:include page="/templates/footer.jsp"></jsp:include>
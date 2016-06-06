<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="ec.edu.epn.getmovie.model.*"%>
<%
	Usuario usr = (Usuario) request.getSession().getAttribute("usuarioActivo");
%>
<jsp:include page="/templates/header.jsp"></jsp:include>

<section class="container">
	<div class="row">
		<div class="col-lg-9">
		<%
			if (usr == null || usr.getEstadousr() == 0) {
		%>
			<div class="jumbotron">
				<div class="row">
					<div class="col-lg-5">
						<h1>¿No sabes que pel&iacute;cula ver?</h1>
						<p>GET Movie te ofrece las mejores recomendaciones,
							s&oacute;lo tienes que escoger el g&eacute;nero, actor o director
							que m&aacute;s te apasione y GET Movie te mostrar&aacute; una
							lista de las mejores pel&iacute;culas.</p>
						<p class="">
							<a class="btn btn-primary" href="${pageContext.request.contextPath}/login">Inciar
								sesi&oacute;n</a> <a class="btn btn-primary"
								href="${pageContext.request.contextPath}/singup">Registrarse</a>
						</p>
					</div>
					<div class="col-lg-7 col-center">
						<div id="myCarousel" class="carousel slide" data-ride="carousel">
							<!-- data-interval="false"-->
							<!-- Indicators -->
							<ol class="carousel-indicators">
								<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
								<li data-target="#myCarousel" data-slide-to="1"></li>
								<li data-target="#myCarousel" data-slide-to="2"></li>
								<li data-target="#myCarousel" data-slide-to="3"></li>
								<li data-target="#myCarousel" data-slide-to="4"></li>
							</ol>

							<!-- Wrapper for slides -->
							<div class="carousel-inner" role="listbox">
								<div class="item active" align="center">
									<img src="${pageContext.request.contextPath}/images/home/1.jpg" alt="¿No sabes que película ver?"
										class="img-responsive">
								</div>
								<div class="item" align="center">
									<img src="${pageContext.request.contextPath}/images/home/2.jpg"
										alt="GET Movie te ofrece las mejores recomendaciones"
										class="img-responsive">
								</div>
								<div class="item" align="center">
									<img src="${pageContext.request.contextPath}/images/home/3.jpg"
										alt="Imagen que muestra los diferentes géneros de una película"
										class="img-responsive">
								</div>
								<div class="item" align="center">
									<img src="${pageContext.request.contextPath}/images/home/4.jpg"
										alt="Puntea películas y pon tus comentarios"
										class="img-responsive">
								</div>
								<div class="item" align="center">
									<img src="${pageContext.request.contextPath}/images/home/5.jpg"
										alt="La base de datos de GET Movie se alimenta con las puntaciones y comentarios de los usuarios."
										class="img-responsive">
								</div>
							</div>

							<!-- Left and right controls -->
							<a class="left carousel-control" href="#myCarousel" role="button"
								data-slide="prev"> <span
								class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
								<span class="sr-only">Previous</span>
							</a> <a class="right carousel-control" href="#myCarousel"
								role="button" data-slide="next"> <span
								class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
								<span class="sr-only">Next</span>
							</a>
						</div>
					</div>
				</div>
			</div>
		<%
			} else {
		%>
			<div class="jumbotron">
				<div class="row">
					<h1>Bienvenido <%=usr.getNombreusr()%></h1>
					<div class="col-lg-5">
						<p>GET Movie te ofrece las mejores recomendaciones,
							s&oacute;lo tienes que escoger el g&eacute;nero, actor o director
							que m&aacute;s te apasione y GET Movie te mostrar&aacute; una
							lista de las mejores pel&iacute;culas.</p>
					</div>
					<div class="col-lg-7">
						<div id="myCarousel" class="carousel slide" data-ride="carousel">
							<!-- data-interval="false"-->
							<!-- Indicators -->
							<ol class="carousel-indicators">
								<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
								<li data-target="#myCarousel" data-slide-to="1"></li>
								<li data-target="#myCarousel" data-slide-to="2"></li>
								<li data-target="#myCarousel" data-slide-to="3"></li>
								<li data-target="#myCarousel" data-slide-to="4"></li>
							</ol>

							<!-- Wrapper for slides -->
							<div class="carousel-inner" role="listbox">
								<div class="item active" align="center">
									<img src="${pageContext.request.contextPath}/images/home/1.jpg" alt="¿No sabes que película ver?"
										class="img-responsive">
								</div>
								<div class="item" align="center">
									<img src="${pageContext.request.contextPath}/images/home/2.jpg"
										alt="GET Movie te ofrece las mejores recomendaciones"
										class="img-responsive">
								</div>
								<div class="item" align="center">
									<img src="${pageContext.request.contextPath}/images/home/3.jpg"
										alt="Imagen que muestra los diferentes géneros de una película"
										class="img-responsive">
								</div>
								<div class="item" align="center">
									<img src="${pageContext.request.contextPath}/images/home/4.jpg"
										alt="Puntea películas y pon tus comentarios"
										class="img-responsive">
								</div>
								<div class="item" align="center">
									<img src="${pageContext.request.contextPath}/images/home/5.jpg"
										alt="La base de datos de GET Movie se alimenta con las puntaciones y comentarios de los usuarios."
										class="img-responsive">
								</div>
							</div>

							<!-- Left and right controls -->
							<a class="left carousel-control" href="#myCarousel" role="button"
								data-slide="prev"> <span
								class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
								<span class="sr-only">Previous</span>
							</a> <a class="right carousel-control" href="#myCarousel"
								role="button" data-slide="next"> <span
								class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
								<span class="sr-only">Next</span>
							</a>
						</div>
					</div>
				</div>
			</div>
		<%
			}
		%>
			
		</div>
		<div>
			<div class="col-lg-3">
				<jsp:include page="/templates/aside.jsp"></jsp:include>
			</div>
		</div>
	</div>
</section>

<jsp:include page="/templates/footer.jsp"></jsp:include>
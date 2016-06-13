<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="ec.edu.epn.getmovie.model.*" %>
<jsp:include page="/templates/header.jsp"></jsp:include>
<%
	Usuario usuario = (Usuario) request.getSession().getAttribute("usuarioActivo");
%>
<section class="container">
	<ul class="breadcrumb">
		<li><a href="${pageContext.request.contextPath}/home">Home</a>
  		<li class="active">Actor</li>
	</ul>
	<h1>Men&uacute; de administraci&oacute;n de actores</h1>
	<div class="row">
		<div class="col-lg-9">
		<% 
			if(usuario.getIsadmin()==(byte) 1){
		%>
			<a href="${pageContext.request.contextPath}/actor/registrar" 
				class="btn btn-default btn-lg btn-block">Registrar</a>
			<a href="${pageContext.request.contextPath}/actor/administrar" 
				class="btn btn-default btn-lg btn-block">Administrar</a>
		<% 
			}else{
		%>
			<a href="${pageContext.request.contextPath}/actor/buscar" 
				class="btn btn-default btn-lg btn-block">Buscar</a>
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
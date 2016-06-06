<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="ec.edu.epn.getmovie.model.*"%>
<%
	Usuario usr = (Usuario) request.getSession().getAttribute("usuarioActivo");
%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>GET Movie</title>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
<link href="https://fonts.googleapis.com/icon?family=Material+Icons"
	rel="stylesheet">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/bootstrap.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/bootstrap.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/styles.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.2/jquery.min.js"></script>
<script
	src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
</head>
<body>
	<header class="container">
		<img class="logo"
			src="${pageContext.request.contextPath}/images/logo/logo.gif"
			alt="Logo de la aplicación GET Movie">
		<h1>Puntea, Comenta y Encuentra tu pel&iacute;cula favorita</h1>
		<br>
	</header>

	<%
		if (usr == null || usr.getEstadousr() == 0) {
	%>
			<jsp:include page="/templates/nav.jsp"></jsp:include>
	<%
		} else {
	%>
			<jsp:include page="/templates/navLogin.jsp"></jsp:include>
	<%
		}
	%>
	
	
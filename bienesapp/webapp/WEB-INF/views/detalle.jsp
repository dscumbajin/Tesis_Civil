<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">
<title>Detalles del Estaci�n</title>

<spring:url value="/resources" var="urlPublic"></spring:url>
<spring:url value="/" var="urlRoot"></spring:url>
<spring:url value="/personalizado" var="urlPersonalizado" />
<spring:url value="/search" var="urlSearch" />
<spring:url value="/downloadTotalDetalle?type=excel" var="urlXLSDetalle"></spring:url>
<spring:url value="/downloadTotalDetalle?type=pdf" var="urlPDFDetalle" />
<link href="${urlPublic}/images/logouce.ico.ico" type="image/x-icon"
	rel="shortcut icon" />
<link href="${urlPublic}/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">
<link href="${urlPublic}/bootstrap/css/theme.css" rel="stylesheet">

<link href="${urlPublic}/css/my-style.css" rel="stylesheet">

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

</head>

<body>
	<jsp:include page="includes/menu.jsp"></jsp:include>

	<div class="container theme-showcase" role="main">

		<!-- Marketing messaging -->
		<div class="container marketing">

			<div class="page-header">
				<h2>${estacion.lugar}</h2>
			</div>
			<div class="row">
				<div class="col-sm-3">
					<p class="text-center">
						<img class="img-rounded"
							src="${urlPublic}/images/${estacion.imagen}"
							alt="Generic placeholder image" width="150" height="200">

					</p>
				</div>
				<div class="col-sm-9">
					<div class="panel panel-default">
						<div class="panel-heading">
							<h3 class="panel-title">DETALLES</h3>
						</div>
						<div class="panel-body">
							<p>
								Ubicaci�n: ${estacion.ubicacion } <br> Lugar :
								${estacion.lugar} <br> Total Bienes: ${numEquipo}

							</p>

						</div>
					</div>
				</div>
			</div>

			<div class="btn-toolbar" role="toolbar">

				<div class="btn-group">
					<a href="${urlPDFDetalle} "  class="btn btn-outline-dark" role="button"
						title="Reporte en Pdf">  Reportes Pdf <i class="fa fa-file-pdf-o" style="font-size:24px;color:red"></i></a>
				</div>
				<div class="btn-group">
					<a href="${urlXLSDetalle} "  class="btn btn-outline-dark" role="button"
						title="Reporte en Excel">Reportes Excel  <i class="fa fa-file-excel-o"style="font-size:24px;color:green;"></i></a>
				</div>

				<div class="btn-group">
					<a href="${urlPersonalizado}" class="btn btn-danger" role="button"
						title="Reporte por Periodo">Reporte por Periodo</a>
				</div>

			</div>
			<br>

		</div>
		<!-- /.container -->

	</div>
	<!-- /container -->


	<div id="main-container">
		<div class="panel panel-default">
			<div class="panel-heading">
				<form class="form-inline" action="${urlSearch}" method="POST">
					<div class="form-group">
						<input type="text" id="myInput" name="campo"
							placeholder="Search for alta nueva.." autocomplete="off">
						<button type="submit" title="Buscar" class="btn btn-primary">Buscar</button>

					</div>
					<input type="hidden" name="${_csrf.parameterName}"
						value="${_csrf.token}" />
						
						<div class="form-group">
						 <label>Buscar:</label> <input id="searchTerm" type="text"
					onkeyup="doSearch()" />
						</div>
				</form>
			</div>
			<div class="panel-body">

				<div class="table-responsive">
					<table id="datos"
						class="table-rwd table-bordered table-hover table-striped">
						<thead>
							<tr>
								<th>Persona Usa</th>
								<th>Alta Nueva</th>
								<th>Alta Anteriror</th>
								<th>Descripcion</th>
								<th>Marca</th>
								<th>Modelo</th>
								<th>Serie</th>
								<th>Guarda Almacen</th>
								<th>Causionado</th>
								<th>Lugar</th>
								<th>Ubicaci�n</th>
								<th>Registro</th>
								<th>Actualizaci�n</th>
							</tr>
						</thead>

						<c:forEach items="${bienes_Estaciones.content}"
							var="bien_estacion">
							<tr>
								<td>${bien_estacion.bien.detalle.asignado}</td>
								<td>${bien_estacion.bien.alta}</td>
								<td>${bien_estacion.bien.anterior}</td>
								<td>${bien_estacion.bien.descripcion}</td>
								<td>${bien_estacion.bien.detalle.marca}</td>
								<td>${bien_estacion.bien.detalle.modelo}</td>
								<td>${bien_estacion.bien.serie}</td>
								<td>${bien_estacion.bien.detalle.guarda_almacen}</td>
								<td>${bien_estacion.bien.detalle.causionado}</td>
								<td>${bien_estacion.estacion.lugar}</td>
								<td>${bien_estacion.estacion.ubicacion}</td>
								<td><fmt:formatDate value="${bien_estacion.registro}"
										pattern="dd-MM-yyyy" /></td>
								<td><fmt:formatDate value="${bien_estacion.actualizacion}"
										pattern="dd-MM-yyyy" /></td>

							</tr>
						</c:forEach>

					</table>
				</div>
			</div>
		</div>
		<nav aria-label="">
			<ul class="pager">
				<li><a
					href="${urlRoot}detailPaginate?page=${bienes_Estaciones.number - 1 }">Anterior</a></li>
				<li><a
					href="${urlRoot}detailPaginate?page=${bienes_Estaciones.number + 1 }">Siguiente</a></li>
			</ul>
		</nav>

	</div>
	<!-- /container -->
	<div class="container theme-showcase">
		<hr class="featurette-divider">
		<jsp:include page="includes/footer.jsp"></jsp:include>

	</div>
	<!-- /container -->
	<!-- Bootstrap core JavaScript
		================================================== -->
	<!-- Placed at the end of the document so the pages load faster -->

	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<script src="https://code.jquery.com/jquery-1.12.0.min.js"></script>
	<script src="${urlPublic}/bootstrap/js/bootstrap.min.js"></script>
	<script src="${urlPublic}/js/buscadorTabla.js" type="text/javascript"></script>
</body>
</html>
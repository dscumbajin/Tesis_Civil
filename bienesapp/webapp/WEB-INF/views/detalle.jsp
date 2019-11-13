<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">
<title>Detalles del Estacion</title>
<spring:url value="/resources" var="urlPublic"></spring:url>
<spring:url value="/" var="urlRoot"></spring:url>

<link href="${urlPublic}/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">
<link href="${urlPublic}/bootstrap/css/theme.css" rel="stylesheet">

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

			<div class="panel panel-default">
				<div class="panel-heading">
					<input type="text" id="myInput" onkeyup="myFunction()"
						placeholder="Search for alta nueva.."> <a href="#"
						class="btn btn-info" role="button" title="Reporte">Reportes</a>
				</div>
				<div class="panel-body">
					<div class="table-responsive">
						<table id="myTable"
							class="table table-bordered table-hover table-striped">
							
								<tr>
									<th>Lugar</th>
									<th>Ubicaci�n</th>
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
									<th>Registro</th>
									<th>Cambio</th>
								</tr>
							
							
								<c:forEach items="${bienes_Estaciones.content}"
									var="bien_estacion">
									<tr>
										<td>${bien_estacion.estacion.lugar}</td>
										<td>${bien_estacion.estacion.ubicacion}</td>
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
										<td><fmt:formatDate value="${bien_estacion.registro}"
												pattern="dd-MM-yyyy" /></td>
										<td><fmt:formatDate value="${bien_estacion.cambio}"
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
		<!-- /.container -->

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
	<script src="${urlPublic}/js/detalles.js"></script>
</body>
</html>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">
<title>Listado de Ubicaciones</title>

<!-- Asignando las peticiones en variables -->
<spring:url value="/resources" var="urlPublic" />
<spring:url value="/estaciones/create" var="urlCreate" />
<spring:url value="/estaciones/edit" var="urlEdit" />
<spring:url value="/estaciones/delete" var="urlDelete" />
<spring:url value="/estaciones/search" var="urlSearch" />
<spring:url value="/estaciones" var="urlEstaciones" />

<link href="${urlPublic}/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">
<link href="${urlPublic}/bootstrap/css/theme.css" rel="stylesheet">
<link href="${urlPublic}/images/logouce.ico.ico" type="image/x-icon"
	rel="shortcut icon" />
</head>

<body>

	<jsp:include page="../includes/menu.jsp"></jsp:include>

	<div class="container theme-showcase" role="main">

		<h3>Listado de Estaciones</h3>

		<c:if test="${mensaje!=null}">
			<div class='alert alert-success' role="alert">${mensaje}</div>
		</c:if>

		<a href="${urlCreate}" class="btn btn-primary" role="button"
			title="Nueva Ubicacion">Nueva</a><br> <br>

		<div class="panel panel-default">
			<div class="panel-heading">
				<form class="form-inline" action="${urlSearch}" method="POST">
					<div class="form-group">
						<input type="text" id="myInput" name="inputLugar"
							placeholder="Search for lugar..">
					</div>
					<input type="hidden" name="${_csrf.parameterName}"
						value="${_csrf.token}" />
					<button type="submit" class="btn btn-primary">Buscar</button>
				</form>
			</div>
			<div class="panel-body">
				<div class="table-responsive">
					<table id="myTable"
						class="table table-hover table-striped table-bordered">
						<tr>
							<th>Ubicaci�n</th>
							<th>Lugar</th>
							<th>Imagen</th>
							<th>Opciones</th>
						</tr>

						<c:forEach items="${estaciones.content}" var="estacion">
							<tr>
								<td>${estacion.ubicacion}</td>
								<td>${estacion.lugar}</td>
								<td><img class="img-rounded"
									src="${urlPublic}/images/${estacion.imagen}"
									alt="Generic placeholder image" width="100" height="150"></td>

								<td><a href="${urlEdit}/${estacion.id}"
									class="btn btn-success btn-sm" role="button" title="Edit"><span
										class="glyphicon glyphicon-pencil"></span></a> <a
									href="${urlDelete}/${estacion.id}"
									onclick='return confirm("�Estas seguro?")'
									class="btn btn-danger btn-sm" role="button" title="Eliminar"><span
										class="glyphicon glyphicon-trash"></span></a></td>
							</tr>
						</c:forEach>
					</table>
				</div>
			</div>
		</div>
		<nav aria-label="">
			<ul class="pager">
				<li><a
					href="${urlEstaciones}/indexPaginate?page=${estaciones.number - 1 }">Anterior</a></li>
				<li><a
					href="${urlEstaciones}/indexPaginate?page=${estaciones.number + 1 }">Siguiente</a></li>
			</ul>
		</nav>
		<hr class="featurette-divider">

		<jsp:include page="../includes/footer.jsp"></jsp:include>

	</div>
	<!-- /container -->

	<!-- Bootstrap core JavaScript
    ================================================== -->
	<!-- Placed at the end of the document so the pages load faster -->
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

	<script src="https://code.jquery.com/jquery-1.12.0.min.js"></script>
	<script src="${urlPublic}/bootstrap/js/bootstrap.min.js"></script>
	<script src="${urlPublic}/js/ubicaciones.js"></script>
</body>
</html>

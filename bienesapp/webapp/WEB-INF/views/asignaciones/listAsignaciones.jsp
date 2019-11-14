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
<title>Listado de Asignaciones</title>

<!-- Asignando las peticiones en variables -->
<spring:url value="/resources" var="urlPublic" />
<spring:url value="/asignaciones/create" var="urlAsignacion" />
<spring:url value="/asignaciones/edit" var="urlEdit" />
<spring:url value="/asignaciones/delete" var="urlDelete" />
<spring:url value="/asignaciones" var="urlAsignaciones" />

<link href="${urlPublic}/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">
<link href="${urlPublic}/bootstrap/css/theme.css" rel="stylesheet">
<link href="${urlPublic}/images/logouce.ico.ico" type="image/x-icon" rel="shortcut icon"/>
</head>

<body>

	<jsp:include page="../includes/menu.jsp"></jsp:include>

	<div class="container theme-showcase" role="main">

		<h3>Listado de Asignaciones</h3>

		<c:if test="${mensaje!=null}">
			<div class='alert alert-success' role="alert">${mensaje}</div>
		</c:if>

		<c:if test="${alerta!=null}">
			<div class='alert alert-danger' role="alert">${alerta}</div>
		</c:if>

		<a href="${urlAsignacion}" class="btn btn-primary" role="button"
			title="Nueva Asignacion">Asignaciones</a><br> <br>
		<div class="panel panel-default">
			<div class="panel-heading">
				<input type="text" id="myInput" onkeyup="myFunction()"
					placeholder="Search for alta nueva..">
			</div>
			<div class="panel-body">
				<div class="table-responsive">
					<table id="myTable"
						class="table table-hover table-striped table-bordered">
						<tr>
							<th>Alta Nueva</th>
							<th>Bien</th>
							<th>Ubicacion</th>
							<th>Lugar</th>
							<th>Registro</th>
							<th>Cambio</th>
							<th>Opciones</th>
						</tr>

						<c:forEach items="${asignaciones.content}" var="asignacion">
							<tr>
								<td>${asignacion.bien.alta}</td>
								<td>${asignacion.bien.descripcion}</td>
								<td>${asignacion.estacion.ubicacion}</td>
								<td>${asignacion.estacion.lugar}</td>
								<td><fmt:formatDate value="${asignacion.registro}"
										pattern="dd-MM-yyyy" /></td>
								<td><fmt:formatDate value="${asignacion.cambio}"
										pattern="dd-MM-yyyy" /></td>

								<td><a href="${urlEdit}/${asignacion.id}"
									class="btn btn-success btn-sm" role="button" title="Edit"><span
										class="glyphicon glyphicon-pencil"></span></a> <a
									href="${urlDelete}/${asignacion.id}"
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
					href="${urlAsignaciones}/indexPaginate?page=${asignaciones.number - 1 }">Anterior</a></li>
				<li><a
					href="${urlAsignaciones}/indexPaginate?page=${asignaciones.number + 1 }">Siguiente</a></li>
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
	<script src="${urlPublic}/js/bienes.js"></script>
</body>
</html>

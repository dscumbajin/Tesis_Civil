<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">
<title>Reporte por Periodos</title>
<spring:url value="/bienes/cancel" var="urlCancel"></spring:url>
<spring:url value="/resources" var="urlPublic" />
<spring:url value="/bienes/buscar" var="urlBuscar" />
<spring:url value="/bienes" var="urlBienes" />
<spring:url value="/bienes/periodo?type=excel" var="urlXLS" />
<spring:url value="/bienes/periodo?type=pdf" var="urlPDF" />

<link href="${urlPublic}/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">
<link href="${urlPublic}/bootstrap/css/theme.css" rel="stylesheet">
<link href="${urlPublic}/css/my-style.css">

</head>

<body>

	<jsp:include page="../includes/menu.jsp"></jsp:include>

	<div class="container theme-showcase" role="main">

		<h3>Reporte de Bienes por Periodo</h3>



		<c:if test="${mensaje!=null}">
			<div class='alert alert-success' role="alert">${mensaje}</div>
		</c:if>

		<c:if test="${alerta!=null}">
			<div class='alert alert-danger' role="alert">${alerta}</div>
		</c:if>

		<div class="btn-toolbar" role="toolbar">

			<div class="btn-group">
				<a href="${urlPDF} " class="btn btn-success" role="button"
					title="Reporte">Reportes Pdf</a>
			</div>
			<div class="btn-group">
				<a href="${urlXLS} " class="btn btn-success" role="button"
					title="Reporte">Reportes Excel</a>
			</div>

			<div class="btn-group">
				<a href="${urlCancel} " class="btn btn-danger" role="button"
					title="Cancelar">Cancelar</a>
			</div>

		</div>
		<br>

		<div class="panel panel-default">
			<div class="panel-heading">

				<form class="form-inline" action="${urlBuscar}" method="POST">


					<div class="form-group">
						<input type="text" class="form-control" id="startDate"
							name="startDate" placeholder="Fecha Inicio (dd-mm-yyyy)" required="required">
					</div>
					<div class="form-group">
						<input type="text" class="form-control" id="endDate" name="endDate"
							placeholder="Fecha Fin (dd-mm-yyyy)" required="required">
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
							<th>Alta Nueva</th>
							<th>Alta Anterior</th>
							<th>Serie</th>
							<th>Descripción</th>
							<th>Fecha de Ingreso</th>
							<th>Costo</th>
							<th>Vida Util</th>
							<th>Depreciación</th>
							<th>Fecha Garantía</th>
							<th>Color</th>
							<th>Material</th>
							<th>Asignado</th>
							<th>Causionado</th>
							<th>Estado</th>
							<th>Estatus</th>
							<th>Guarda Almacen</th>
							<th>Marca</th>
							<th>Modelo</th>
							<th>Tipo</th>
						</tr>

						<c:forEach items="${bienes.content}" var="bien">
							<tr>
								<td>${bien.alta }</td>
								<td>${bien.anterior }</td>
								<td>${bien.serie}</td>
								<td>${bien.descripcion}</td>
								<td><fmt:formatDate value="${bien.fecha_ingreso}"
										pattern="dd-MM-yyyy" /></td>
								<td>${bien.costo }</td>
								<td>${bien.vida_util }años</td>
								<td>${bien.depreciacion }años</td>
								<td><fmt:formatDate value="${bien.garantia}"
										pattern="dd-MM-yyyy" /></td>
								<td>${bien.color}</td>
								<td>${bien.material}</td>
								<td>${bien.detalle.asignado}</td>
								<td>${bien.detalle.causionado}</td>
								<c:choose>
									<c:when test="${bien.detalle.estado eq 'Bueno'}">
										<td><span class="label label-success">${bien.detalle.estado}</span></td>
									</c:when>
									<c:otherwise>
										<td><span class="label label-danger">${bien.detalle.estado}</span></td>
									</c:otherwise>
								</c:choose>

								<c:choose>
									<c:when test="${bien.detalle.estatus eq 'Activo'}">
										<td><span class="label label-success">${bien.detalle.estatus}</span></td>
									</c:when>
									<c:otherwise>
										<td><span class="label label-danger">${bien.detalle.estatus}</span></td>
									</c:otherwise>
								</c:choose>

								<td>${bien.detalle.guarda_almacen}</td>
								<td>${bien.detalle.marca}</td>
								<td>${bien.detalle.modelo}</td>
								<td>${bien.detalle.tipo}</td>

							</tr>
						</c:forEach>
					</table>
				</div>
			</div>
		</div>
		<nav aria-label="">
			<ul class="pager">
				<li><a
					href="${urlBienes}/periodPaginate?page=${bienes.number - 1 }">Anterior</a></li>
				<li><a
					href="${urlBienes}/periodPaginate?page=${bienes.number + 1 }">Siguiente</a></li>
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

	<script>
		$(function() {
			$("#startDate").datepicker({
				dateFormat : 'dd-mm-yy'
			});
		});
	</script>

	<script>
		$(function() {
			$("#endDate").datepicker({
				dateFormat : 'dd-mm-yy'
			});
		});
	</script>
</body>
</html>

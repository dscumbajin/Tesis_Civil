<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<spring:url value="/resources" var="urlPublic"></spring:url>
<spring:url value="/bienes/save" var="urlForm"></spring:url>
<spring:url value="/bienes/cancel" var="urlCancel"></spring:url>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">
<title>Creacion de Bienes</title>

<link href="${urlPublic}/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">
<link href="${urlPublic}/bootstrap/css/theme.css" rel="stylesheet">

<link rel="stylesheet"
	href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">

</head>

<body>

	<jsp:include page="../includes/menu.jsp"></jsp:include>

	<div class="container theme-showcase" role="main">

		<c:if test="${not empty alerta}">
			<div class='alert alert-danger' role="alert">${alerta}</div>
		</c:if>

		<div class="page-header">
			<h3 class="blog-title">
				<span class="label label-success">Datos del Bien</span>
			</h3>
		</div>



		<spring:hasBindErrors name="bien">
			<div class='alert alert-danger' role='alert'>
				Por favor corrija los siguientes errores:
				<ul>
					<c:forEach var="error" items="${errors.allErrors}">
						<li><spring:message message="${error}" /></li>
					</c:forEach>
				</ul>
			</div>
		</spring:hasBindErrors>

		<form:form action="${urlForm}" method="post" modelAttribute="bien">
			<div class="row">
				<div class="col-sm-3">
					<div class="form-group">
						<label for="alta">Alta Nueva</label>
						<form:hidden path="id" />
						<form:hidden path="detalle.id" />
						<form:input type="text" class="form-control" path="alta" id="alta"
							required="required" />
					</div>
				</div>
				<div class="col-sm-3">
					<div class="form-group">
						<label for="alta_anterior">Alta Anterior</label>
						<form:input type="text" class="form-control" path="alta_anterior"
							id="alta_anterior" required="required" />
					</div>
				</div>
				<div class="col-sm-3">
					<div class="form-group">
						<label for="descripcion">Descripci�n</label>
						<form:input type="text" class="form-control" path="descripcion"
							id="descripcion" required="required" />
					</div>
				</div>
				<div class="col-sm-3">
					<div class="form-group">
						<label for="serial">Serie</label>
						<form:input type="text" class="form-control" path="serial"
							id="serial" required="required" />
					</div>
				</div>

				<div class="col-sm-3">
					<div class="form-group">
						<label for="costo">Costo</label>
						<form:input type="text" class="form-control" path="costo"
							id="costo" required="required" />
					</div>
				</div>

				<div class="col-sm-3">
					<div class="form-group">
						<label for="vida_util" class="control-label">Vida �til</label>
						<form:select id="vida_util" path="vida_util" class="form-control">
							<form:option value="2">2 A�os</form:option>
							<form:option value="5">5 A�os</form:option>
							<form:option value="10">10 A�os</form:option>
						</form:select>
					</div>
				</div>

				<div class="col-sm-3">
					<div class="form-group">
						<label for="depresiacion" class="control-label">Depreciaci�n</label>
						<form:select id="depreciacion" path="depreciacion"
							class="form-control">
							<form:option value="2">2 A�os</form:option>
							<form:option value="5">5 A�os</form:option>
							<form:option value="10">10 A�os</form:option>
						</form:select>
					</div>
				</div>

				<div class="col-sm-3">
					<div class="form-group">
						<label for="garantia">Fin de Garantia</label>
						<form:input type="text" class="form-control" path="garantia"
							id="garantia" required="required" />
					</div>
				</div>

				<div class="col-sm-3">
					<div class="form-group">
						<label for="color">Color</label>
						<form:input type="text" class="form-control" path="color"
							id="color" required="required" />
					</div>
				</div>
				<div class="col-sm-3">
					<div class="form-group">
						<label for="material">Material</label>
						<form:input type="text" class="form-control" path="material"
							id="material" required="required" />
					</div>
				</div>

			</div>


			<!-- Para la entidad Detalle -->
			<div class="page-header">
				<h3 class="blog-title">
					<span class="label label-success">Detalles</span>
				</h3>
			</div>

			<div class="row">
				<div class="col-sm-3">
					<div class="form-group">
						<label for="asignado" class="control-label">Quien Usa</label>
						<form:select id="asignado" path="detalle.asignado"
							class="form-control">
							<form:option value="Estudiante"> Estudiante</form:option>
							<form:option value="Profesor"> Profesor</form:option>
						</form:select>
					</div>
				</div>

				<div class="col-sm-3">
					<div class="form-group">
						<label for="marca">Marca</label>
						<form:input type="text" class="form-control" path="detalle.marca"
							id="marca" required="required" />
					</div>
				</div>
				<div class="col-sm-3">
					<div class="form-group">
						<label for="modelo">Modelo</label>
						<form:input type="text" class="form-control" path="detalle.modelo"
							id="modelo" required="required" />
					</div>
				</div>


				<div class="col-sm-3">
					<div class="form-group">
						<label for="estado" class="control-label">Estado</label>
						<form:select id="estado" path="detalle.estado"
							class="form-control">
							<form:option value="Bueno"> Bueno</form:option>
							<form:option value="Malo"> Malo</form:option>
						</form:select>
					</div>
				</div>

				<div class="col-sm-3">
					<div class="form-group">
						<label for="estatus" class="control-label">Estatus</label>
						<form:select id="estatus" path="detalle.estatus"
							class="form-control">
							<form:option value="Activo"> Activo</form:option>
							<form:option value="Baja"> Baja</form:option>
						</form:select>
					</div>
				</div>

				<div class="col-sm-3">
					<div class="form-group">
						<label for="tipo" class="control-label">Tipo</label>
						<form:select id="tipo" path="detalle.tipo" class="form-control">
							<form:option value="MOBILIARIO"> MOBILIARIO</form:option>
							<form:option value="MAQUINARIA Y EQUIPO"> MAQUINARIA Y EQUIPO</form:option>
						</form:select>
					</div>
				</div>

				<div class="col-sm-3">
					<div class="form-group">
						<label for="guarda_almacen">Guarda Almacen</label>
						<form:input type="text" class="form-control"
							path="detalle.guarda_almacen" id="guarda_almacen"
							required="required" />
					</div>
				</div>

				<div class="col-sm-3">
					<div class="form-group">
						<label for="causionado">Causionado</label>
						<form:input type="text" class="form-control"
							path="detalle.causionado" id="modelo" required="required" />
					</div>
				</div>
			</div>

			<div class="btn-toolbar" role="toolbar">
				<div class="btn-group">
					<button type="submit" class="btn btn-danger">Guardar</button>
				</div>

				<div class="btn-group">
					<a href="${urlCancel} " class="btn btn-info" role="button"
						title="Cancelar">Cancelar</a>
				</div>

			</div>
			<br>

		</form:form>

		<hr class="featurette-divider">

		<jsp:include page="../includes/footer.jsp"></jsp:include>

	</div>
	<!-- /container -->

	<!-- Bootstrap core JavaScript
    ================================================== -->
	<!-- Placed at the end of the document so the pages load faster -->
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
	<script src="${urlPublic}/bootstrap/js/bootstrap.min.js"></script>
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	<script>
		$(function() {
			$("#garantia").datepicker({
				dateFormat : 'dd-mm-yy'
			});
		});
	</script>
</body>
</html>

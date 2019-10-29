<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="author" content="">
<title>Creacion de Usuarios</title>
<spring:url value="/resources" var="urlPublic" />
<spring:url value="/usuarios/save" var="urlForm" />
<spring:url value="/usuarios/cancel" var="urlCancel"></spring:url>
<link href="${urlPublic}/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">
<link href="${urlPublic}/bootstrap/css/theme.css" rel="stylesheet">
</head>

<body>

	<jsp:include page="../includes/menu.jsp" />

	<div class="container theme-showcase" role="main">

		<c:if test="${not empty alerta}">
			<div class='alert alert-danger' role="alert">${alerta}</div>
		</c:if>

		<h3 class="blog-title">
			<span class="label label-success">Datos del Usuario</span>
		</h3>

		<form:form action="${urlForm}" method="post" modelAttribute="usuario">
			<div class="row">
				<div class="col-sm-3">
					<div class="form-group">
						<label for="perfil" class="control-label">PERFIL</label> <select
							id="perfil" name="perfil" class="form-control">
							<option value="ADMINISTRADOR">ADMINISTRADOR</option>
							<option value="ESTANDAR">ESTANDAR</option>
						</select>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-sm-3">
					<div class="form-group">
						<label for="nombre">Nombres</label>
						<form:input type="text" class="form-control" path="nombre"
							id="nombre" required="required" />
					</div>
				</div>
				<div class="col-sm-3">
					<div class="form-group">
						<label for="apellido">Apellidos</label>
						<form:input type="text" class="form-control" path="apellido"
							id="apellido" required="required" />
					</div>
				</div>
				<div class="col-sm-3">
					<div class="form-group">
						<label for="cuenta">Cuenta</label>
						<form:input type="text" class="form-control" path="cuenta"
							id="cuenta" required="required" />
					</div>
				</div>

				<div class="col-sm-3">
					<div class="form-group">
						<label for="pwd">Password</label>
						<form:input type="password" class="form-control" path="pwd"
							id="pwd" required="required" />
					</div>
				</div>

				<div class="col-sm-3">
					<div class="form-group">
						<label for="email">Email</label>
						<form:input type="email" class="form-control" path="email"
							id="email" placeholder="Correo electrónico" required="required" />
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
		</form:form>

		<hr class="featurette-divider">

		<jsp:include page="../includes/footer.jsp" />

	</div>
	<!-- /container -->

	<!-- Bootstrap core JavaScript
		================================================== -->
	<!-- Placed at the end of the document so the pages load faster -->
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
	<script src="${urlPublic}/bootstrap/js/bootstrap.min.js"></script>
</body>
</html>

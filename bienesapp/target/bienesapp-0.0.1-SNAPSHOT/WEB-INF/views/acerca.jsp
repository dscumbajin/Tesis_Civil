<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">
<title>CineSite | Bienvenido</title>
<spring:url value="/resources" var="urlPublic" />
<link href="${urlPublic}/images/logouce.ico.ico" type="image/x-icon" rel="shortcut icon"/>
<link href="${urlPublic}/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">
<link href="${urlPublic}/bootstrap/css/theme.css" rel="stylesheet">

</head>

<body>

	<jsp:include page="includes/menu.jsp"></jsp:include>

	<div class="container theme-showcase" role="main">

		<div class="panel panel-default">
			<div class="panel-heading">
				<h3 class="panel-title">ACERCA DE ESTA APLICACION</h3>
			</div>
			<div class="panel-body">
				<div class="row">
					<div class="col-sm-3">
						<p class="text-center">
							<img class="img-rounded" src="${urlPublic}/images/logoUce.jpg"
								alt="Generic placeholder image" height="220">
						</p>
					</div>
					<div class="col-sm-9">
						<div class="panel panel-default">
							<div class="panel-heading">
								<h3 class="panel-title">APLICACI�N WEB PARA EL CONTROL Y
									ADMINISTRACI�N DE BIENES DE LOS LABORATORIOS DE C�MPUTO DE LA
									CARRERA DE INGENIER�A CIVIL</h3>
							</div>
							<div class="panel-body">

								<div class="alert alert-danger" role="alert">El sistema
									web de control de bienes de los laboratorios de computo de
									ingenier�a civil agilitar� el proceso de generaci�n de reportes
									para distintas �reas de acuerdo con las necesidades requeridas.
									El acceso al sistema se lo manejar� por medio de credenciales
									de usuario y contrase�a que ser�n registradas dentro del
									sistema al momento de la recolecci�n de datos. La
									administraci�n del sistema y usuarios les corresponder� �nica y
									exclusivamente a los usuarios administradores.</div>

							</div>
						</div>
					</div>
				</div>
			</div>
		</div>

		<jsp:include page="includes/footer.jsp"></jsp:include>

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
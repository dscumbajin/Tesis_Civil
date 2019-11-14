<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://www.springframework.org/security/tags"
	prefix="sec"%>
<spring:url value="/" var="urlRoot"></spring:url>

<!-- Fixed navbar -->
<nav class="navbar navbar-inverse navbar-fixed-top">
	<div class="container">

		<sec:authorize access="isAnonymous()">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle collapsed"
					data-toggle="collapse" data-target="#navbar" aria-expanded="false"
					aria-controls="navbar">
					<span class="sr-only">Toggle navigation</span> <span
						class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="${urlRoot}">My Control Site</a>
			</div>
			<div id="navbar" class="navbar-collapse collapse">
				<ul class="nav navbar-nav">

					<li><a href="${urlRoot}about">Acerca</a></li>
					<li><a class="glyphicon glyphicon-log-in" href="${urlRoot}formLogin"> Login</a></li>
				</ul>
			</div>
			<!--/.nav-collapse -->
		</sec:authorize>

		<sec:authorize access="hasAnyAuthority('ADMINISTRADOR')">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle collapsed"
					data-toggle="collapse" data-target="#navbar" aria-expanded="false"
					aria-controls="navbar">
					<span class="sr-only">Toggle navigation</span> <span
						class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="${urlRoot}admin/index">My Control Site |
					Administración</a>
			</div>
			<div id="navbar" class="navbar-collapse collapse">
				<ul class="nav navbar-nav">
					<li><a href="${urlRoot}bienes/indexPaginate?page=0">Bienes</a></li>
					<li><a href="${urlRoot}estaciones/indexPaginate?page=0">Estaciones</a></li>
					<li><a href="${urlRoot}asignaciones/indexPaginate?page=0">Asignaciones</a></li>
					<li><a href="${urlRoot}noticias/index">Noticias</a></li>
					<li><a href="${urlRoot}banners/index">Banners</a></li>
					<li><a href="${urlRoot}usuarios/index">Usuarios</a></li>
					<li><a class="glyphicon glyphicon-log-out" href="${urlRoot}admin/logout"> Salir</a></li>
				</ul>
			</div>
			<!--/.nav-collapse -->
		</sec:authorize>

		<sec:authorize access="hasAnyAuthority('ESTANDAR')">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle collapsed"
					data-toggle="collapse" data-target="#navbar" aria-expanded="false"
					aria-controls="navbar">
					<span class="sr-only">Toggle navigation</span> <span
						class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="${urlRoot}admin/index">My Control Site |
					Administración</a>
			</div>
			<div id="navbar" class="navbar-collapse collapse">
				<ul class="nav navbar-nav">
					<li><a href="${urlRoot}noticias/index">Noticias</a></li>
					<li><a href="${urlRoot}banners/index">Banners</a></li>
					<li><a class="glyphicon glyphicon-log-out" href="${urlRoot}admin/logout">Salir</a></li>
				</ul>
			</div>
			<!--/.nav-collapse -->
		</sec:authorize>
	</div>
</nav>
</html>
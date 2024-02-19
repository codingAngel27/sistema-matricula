<%@page import="model.Alumno"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="css/matricula.css" type="text/css">
<link rel="stylesheet"
	href="https://cdn.datatables.net/1.12.1/css/dataTables.bootstrap5.min.css" />
<script src="https://kit.fontawesome.com/ae360af17e.js"
	crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/jquery-validation@1.19.5/dist/jquery.validate.min.js"></script>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ"
	crossorigin="anonymous">
<link rel="stylesheet" href="./css/estilos.css" type="text/css">
<link
	href="https://cdn.datatables.net/1.13.8/css/dataTables.bootstrap5.min.css"
	rel="stylesheet" />
<title>Insert title here</title>
</head>
<body>
	<!-- NADVAR -->
	<div class="wrapper">
		<!-- Sidebar -->
		<aside id="sidebar">
			<div class="h-100">
				<div class="sidebar-logo">
					<a href="index.jsp">Matricula Web</a>
				</div>
				<!-- Sidebar Navigation -->
				<ul class="sidebar-nav">

					<li class="sidebar-item"><a href="index.jsp"
						class="sidebar-link"> <i class="fa-solid fa-list pe-2"></i>
							Perfil
					</a></li>
					<li class="sidebar-item"><a href="#"
						class="sidebar-link collapsed" data-bs-toggle="collapse"
						data-bs-target="#mantenimientos" aria-expanded="false"
						aria-controls="mantenimientos"> <i
							class="fa-regular fa-file-lines pe-2"></i> Mantenimientos
					</a>
						<ul id="mantenimientos"
							class="sidebar-dropdown list-unstyled collapse"
							data-bs-parent="#sidebar">
							<li class="sidebar-item"><a href="AlumnoServlet?type=listar"
								class="sidebar-link">Lista de Alumnos</a></li>
							<li class="sidebar-item"><a href="alumno.jsp"
								class="sidebar-link">Mantenimiento Alumno</a></li>	
							<li class="sidebar-item"><a href="manteCurso.jsp"
								class="sidebar-link">Mantenimiento Curso</a></li>
						</ul></li>
					<li class="sidebar-item"><a href="#"
						class="sidebar-link collapsed" data-bs-toggle="collapse"
						data-bs-target="#matriculas" aria-expanded="false"
						aria-controls="matriculas"> <i
							class="fa-regular fa-file-lines pe-2"></i> Registro Matriculas
					</a>
						<ul id="matriculas"
							class="sidebar-dropdown list-unstyled collapse"
							data-bs-parent="#sidebar">
							<li class="sidebar-item"><a href="matricula.jsp"
								class="sidebar-link">Matricular Alumnos</a></li>
							<li class="sidebar-item"><a href="retiro.jsp"
								class="sidebar-link">Retiro Alumnos</a></li>
						</ul></li>

					<li class="sidebar-item"><a href="consultamatricula.jsp"
						class="sidebar-link collapsed" data-bs-toggle="collapse"
						data-bs-target="#pages" aria-expanded="false"
						aria-controls="pages"> <i
							class="fa-regular fa-file-lines pe-2"></i> Consultas
					</a>
						<ul id="pages" class="sidebar-dropdown list-unstyled collapse"
							data-bs-parent="#sidebar">
							<li class="sidebar-item"><a href="consultamatricula.jsp"
								class="sidebar-link">Consulta Matricula</a></li>
						</ul></li>

					<li class="sidebar-item"><a href="#"
						class="sidebar-link collapsed" data-bs-toggle="collapse"
						data-bs-target="#auth" aria-expanded="false" aria-controls="auth">
							<i class="fa-regular fa-user pe-2"></i> Registro usuarios
					</a>
						<ul id="auth" class="sidebar-dropdown list-unstyled collapse"
							data-bs-parent="#sidebar">
							<li class="sidebar-item"><a href="registro.jsp"
								class="sidebar-link">Registar Usuario</a> <a
								href="logoutServlet" class="sidebar-link">Logout</a></li>
						</ul></li>

					<li class="sidebar-link collapsed"></li>

				</ul>
			</div>
		</aside>
		<!-- Main Component -->
		<div class="main">
			<nav class="navbar navbar-expand px-3 border-bottom">
				<!-- Button for sidebar toggle -->
				<button class="btn custom-navbar-toggler" type="button"
					data-bs-theme="dark">
					<span class="navbar-toggler-icon"></span>
				</button>
			</nav>
			<main class="content px-3 py-2">
			
			<div class="container-fluid mantenimiento-container ">

					<h3 class="title-mantenimiento">Mantenimiento Alumno</h3>
					<!--<nav class="navbar bg-body-tertiary container-buscar"
						id="manteAlumno">
						<div class="container">
							<form class="d-flex justify-content-end" role="search"
								action="AlumnoServlett?type=buscarAlum" method="post">
								<div class="input-group">
									<input class="form-control me-2" type="search"
										placeholder="Buscar" aria-label="Search" name="txtBuscarDni"
										id="txtBuscarDni">
									<button class="btn btn-success" type="submit">
										<i class="fa-solid fa-magnifying-glass"></i>
									</button>
								</div>
							</form>
						</div>
					</nav>-->
					
					<div class="row">
						<div class="col-3">

							<form action="AlumnoServlet?type=registrar" method="post"
								name="mantenimientoAlumno">
								<div class="form-group">
									<label>Id Alumno</label> <input class="form-control"
										type="text" value="${alumno.idAlumno}" name="txtIdAlumno"
										id="txtIdAlumno" readonly="readonly">
								</div>
								<div class="form-group">
									<label>DNI</label> <input class="form-control" type="text"
										value="${alumno.dni}" name="txtDni" id="txtDni">
								</div>
								<br>
								<div class="form-group">
									<label>Nombre</label> <input class="form-control" type="text"
										value="${alumno.nombres}" name="txtNombre" id="txtNombre">
								</div>
								<br>
								<div class="form-group">
									<label>Apellido</label> <input class="form-control"
										value="${alumno.apellidos}" type="text" name="txtApellido"
										id="txtApellido">
								</div>
								<br>
								<div class="form-group">
									<label>Telefono</label> <input class="form-control" type="text"
										value="${alumno.telefono}" name="txtTelefono" id="txtTelefono">
								</div>
								<br>
								<div class="form-group">
									<label>Correo</label> <input class="form-control" type="email"
										value="${alumno.email}" name="txtCorreo" id="txtCorreo">
								</div>
									<div class="col-md-6">
								<input type="submit" class="mt-5 btn btn-primary" value="<% if (request.getParameter("idAlumno") != null) { %>Actualizar<% } else { %>Enviar Datos<% } %>">

							</div>
						<br>
							<div class="col-md-6">
								<a href="AlumnoServlet?type=listar" class="btn btn-primary"
									id="btnListar">Listar</a>
							</div>
							</form>
						</div>
					</div>
				</div>
			
				
			</main>
		</div>
	</div>
	 <%@ include file="components/footer.jsp"%>
	<%
	if (session.getAttribute("usuario") == null) {
		response.sendRedirect("login.jsp");
	}
	%>
	<script
		src="https://cdn.datatables.net/1.13.8/js/jquery.dataTables.min.js"></script>
	<script
		src="https://cdn.datatables.net/1.13.8/js/dataTables.bootstrap5.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe"
		crossorigin="anonymous"></script>

	<script src="js/script.js"></script>
	<script src="js/matricula.js"></script>
</body>
</html>
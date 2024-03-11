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
<title>Registro Alumno</title>
</head>
<body>
	<!-- NADVAR -->
	<div class="wrapper">
		<!-- Sidebar -->
		<%@ include file="components/aside.jsp"%>
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
					<h2 class="title-mantenimiento text-center">Mantenimiento Alumno</h2>
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
</body>
</html>
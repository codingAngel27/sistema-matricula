<%@page import="model.Alumno"%>
<%@page import="model.Curso"%>
<%@page import="java.util.List"%>
<%@page import="model.Matricula"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
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

<title>Matricular Alumno</title>
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
    <button class="btn custom-navbar-toggler" type="button" data-bs-theme="dark">
        <span class="navbar-toggler-icon"></span>
    </button>
</nav>
			<main class="content px-3 py-2">
			<!-- CONTENEDOR MATRICULA -->
	<div class="container-fluid matricula-container" id="matriculaAlumno">
		<div class="row">
			<h3 class="tittle-matricula">Matricula de Alumnos</h3>
			<div class="col-md-4">

				<div class="col-lg-6">


					<form action="MatriculaServlet?type=registrar" method="post"
						name="Registration" class="form-matricula">
						<div class="form-group matricula-group">
							<label class="label-matricula">Numero de Matricula</label> <input
								class="form-control" type="number" value="${matri.numMatricula}"
								name="txtNumMatricula" id="txtNumMatricula" readonly="readonly">
						</div>
						<br>
						<div class="form-group">
							<label class="label-matricula">Código de Alumno</label> <input
								class="form-control" type="number" value="${matri.codAlumno.idAlumno}"
								name="txtCodAlumno" id="txtCodAlumno">
						</div>
						<br>
						<div class="form-group">
							<label class="label-matricula">Código de Curso</label> <input
								class="form-control" type="number" value="${matri.codCurso.codCurso}"
								name="txtCodCurso" id="txtCodCurso">
						</div>
						<br>
						<div class="row">
							<div class="col-md-6">
								<input type="submit" class="btn btn-primary" value="Matricular">
							</div>
							<div class="col-md-6">
								<a href="MatriculaServlet?type=listar" class="btn btn-primary"
									id="btnListar">Listar</a>

							</div>
						</div>

						<br>
					</form>

					<%
					if ("registrar".equals(request.getParameter("type"))) {
						String mensaje = (String) request.getAttribute("mensaje");
						if (mensaje != null) {
							if ("Alumno matriculado correctamente".equals(mensaje)) {
					%>
					<div class="mensajeExito">
						<p class="mensajeExito"><%=mensaje%></p>
					</div>
					<%
					} else {
					%>
					<div class="mensajeError">
						<p class="mensajeError"><%=mensaje%></p>
					</div>
					<%
					}
					}
					}
					%>
				</div>
			</div>

		
		</div>
	</div>
	<!-- FIN CONTENEDOR MATRICULA -->
	
			</main>


		</div>
	</div>
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
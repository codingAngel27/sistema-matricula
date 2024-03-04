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
<title>Lista de Alumnos</title>
</head>
<body>
	<!-- NADVAR -->
	<div class="wrapper">
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
			
			<a href="alumno.jsp" class="btn btn-primary">Registrar Alumno</a>
	<div class="col-9" style="padding-top: 2em">
							<table class="table table-success table-striped">
								<thead>
									<tr>
										<th>Id Alumno</th>
										<th>DNI</th>
										<th>Nombre</th>
										<th>Apellido</th>
										<th>Telefono</th>
										<th>Correo</th>
										<th>Estado</th>
										<th>Acciones</th>
									</tr>
								</thead>
								<tbody>
									<%
									List<Alumno> listAlumno = (List<Alumno>) request.getAttribute("listAlumno");
									if (listAlumno != null) {
										for (Alumno alu : listAlumno) {
									%>
									<tr>
										<td><%=alu.getIdAlumno()%></td>
										<td><%=alu.getDni()%></td>
										<td><%=alu.getNombres()%></td>
										<td><%=alu.getApellidos()%></td>
										<td><%=alu.getTelefono()%></td>
										<td><%=alu.getEmail()%></td>
										<td><%=alu.getEstado()%></td>
										<td><a
											href="AlumnoServlet?type=obtener&idAlumno=<%=alu.getIdAlumno()%>"
											class="btn btn-primary"><i
												class="fa-solid fa-pen-to-square"></i></a> <a
											href="AlumnoServlet?type=eliminar&idAlumno=<%=alu.getIdAlumno()%>"
											class="btn btn-danger"><i class="fa-solid fa-trash"></i></a>
									</tr>
									<%
									}
									}
									%>

								</tbody>
							</table>
						</div>
				<%@ include file="components/footer.jsp"%>
			</main>
		</div>
	</div>
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
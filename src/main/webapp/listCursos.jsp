<%@page import="model.Docente"%>
<%@page import="model.Curso"%>
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
<title>Lista de Cursos</title>
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
			<a href="curso.jsp" class="btn btn-primary">Registrar Curso</a>
						<div class="col-9" style="padding-top: 2em">
							<table class="table table-success table-striped">
								<thead>
									<tr>
										<th>Cod Curso</th>
										<th>Curso</th>
										<th>Ciclo</th>
										<th>Creditos</th>
										<th>Horas</th>
										<th>Docente</th>
										<th>Acciones</th>

									</tr>
								</thead>
								<tbody>
									<%
									List<Curso> listCursos = (List<Curso>) request.getAttribute("listCurso");
									if (listCursos != null) {
										for (Curso curso : listCursos) {
											Docente docente = curso.getIdDocente();
									%>
									<tr>
										<td><%=curso.getCodCurso()%></td>
										<td><%=curso.getNomCurso()%></td>
										<td><%=curso.getCiclo()%></td>
										<td><%=curso.getCrediCurso()%></td>
										<td><%=curso.getHorasCurso()%></td>
										<td><%= docente != null ? docente.getNombre() : "N/A" %></td>
										<td><a
											href="CursoServlet?type=obtener&codCurso=<%=curso.getCodCurso()%>"
											class="btn btn-primary"><i
												class="fa-solid fa-pen-to-square"></i></a> <a
											href="CursoServlet?type=eliminar&codCurso=<%=curso.getCodCurso()%>"
											class="btn btn-danger"><i class="fa-solid fa-trash"></i></a>
									</tr>
									<%
									}
									}
									%>

								</tbody>
							</table>
						</div>

				<script type="text/javascript">
					$(function() {
						$("form[name='mantenimientoCurso']")
								.validate(
										{
											errorClass : "my-error-class",
											validClass : "my-valid-class",
											rules : {

												txtCodCurso : {
													required : true,
													minlength : 2
												},
												txtnomCurso : {
													required : true,
													minlength : 2
												},
												txtCiclo : {
													required : true,
													minlength : 1
												},
												txtCreditCurso : {
													required : true,
													minlength : 1
												},
												txtHorasCurso : {
													required : true,
													minlength : 1
												}

											},
											messages : {

												txtCodCurso : {
													required : "Ingrese el Codigo del Curso",
													minlength : "El Codio debe tener minimo 2 caracteres"
												},
												txtnomCurso : {
													required : "Ingrese el nombre del Curso",
													minlength : "El Nombre debe tener minimo 2 caracteres"
												},
												txtCiclo : {
													required : "Ingrese el ciclo",
													minlength : "El Apellido debe tener minimo 1 caracteres"
												},
												txtCreditCurso : {
													required : "Ingrese el Credito",
													minlength : "El Credito debe tener minimo 1 caracteres"
												},
												txtHorasCurso : {
													required : "Ingrese las Horas",
													minlength : "Las Horas debe tener minimo 1 caracteres"
												}

											},
											submitHandler : function(form) {
												form.submit();
											}
										});
					});
				</script>
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
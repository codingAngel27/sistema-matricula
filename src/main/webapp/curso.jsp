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
<title>Registro Curso</title>
</head>
<body>
	<!-- NADVAR -->
	<div class="wrapper">
		<!-- Sidebar -->
		<%@ include file="components/aside.jsp"%>
		<!-- Main Component -->
		<div class="main">
			<nav class="navbar navbar-expand px-3 border-bottom">
				<button class="btn custom-navbar-toggler" type="button"
					data-bs-theme="dark">
					<span class="navbar-toggler-icon"></span>
				</button>
			</nav>
			<main class="content px-3 py-2">


				<div class="container-fluid mantenimiento-container">

					<h2 class="title-mantenimiento">Mantenimiento Curso</h2>
					<div class="row">
						<div class="col-3">
							<br>
							<form action="CursoServlet?type=registrar" method="post"
								name="mantenimientoCurso">
								<div class="form-group">
									<label>Cod Curso</label> <input class="form-control"
										type="text" value="${curso.codCurso}" name="txtCodCurso"
										id="txtCodCurso">
								</div>
								<div class="form-group">
									<label>Curso</label> <input class="form-control" type="text"
										value="${curso.nomCurso}" name="txtnomCurso" id="txtnomCurso">
								</div>
								<br>
								<div class="form-group">
									<label>Ciclo</label> <input class="form-control" type="text"
										value="${curso.ciclo}" name="txtCiclo" id="txtCiclo">
								</div>
								<div class="form-group">
									<label>Creditos</label> <input class="form-control"
										value="${curso.crediCurso}" type="text" name="txtCreditCurso"
										id="txtCreditCurso">
								</div>
								<br>
								<div class="form-group">
									<label>Horas</label> <input class="form-control" type="text"
										value="${curso.horasCurso}" name="txtHorasCurso"
										id="txtHorasCurso">

								</div>
								<div class="col-md-6">
								<input type="submit" class="mt-5 btn btn-primary" value="<% if (request.getParameter("codCurso") != null) { %>Actualizar<% } else { %>Enviar Datos<% } %>">
							</div>
							</form>
						</div>
					</div>
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
<%@page import="model.Curso"%>
<%@page import="model.Alumno"%>
<%@page import="model.Matricula"%>
<%@page import="java.util.List"%>
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
<script src="https://code.jquery.com/jquery-3.7.1.min.js" type="text/javascript"></script>
<script
	src="https://cdn.jsdelivr.net/npm/jquery-validation@1.19.5/dist/jquery.validate.min.js" type="text/javascript"></script>


<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ"
	crossorigin="anonymous">
<link rel="stylesheet" href="./css/estilos.css" type="text/css">

<link rel="stylesheet" href="https://cdn.datatables.net/buttons/3.0.2/css/buttons.dataTables.css" type="text/css">
<link rel="stylesheet" href="https://cdn.datatables.net/2.0.8/css/dataTables.dataTables.css" type="text/css">
<link
	href="https://cdn.datatables.net/1.13.8/css/dataTables.bootstrap5.min.css"
	rel="stylesheet" />



	
	

<title>Lista de Matriculas</title>
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
	
	<a href="matricula.jsp" class="btn btn-primary">Nueva Matricula</a>
		<div class="row">
			     <div class="col-md-8 mx-auto text-center"> <!-- Utilizamos mx-auto y text-center para centrar horizontalmente -->
            <h3 class="tittle-matricula">Lista de Alumnos Matriculados</h3>
        </div>
			<!-- Columna de la tabla -->
				<div class="col">
					<table class="table table-bordered table-striped" id="miTabla">
						<thead>
							<tr>
								<th scope="col" class="centered">Numero de Matricula</th>
								<th scope="col" class="centered">Codigo del Alumno</th>
								<th scope="col" class="centered">Nombre del Alumno</th>
								<th scope="col" class="centered">Codigo del Curso</th>
								<th scope="col" class="centered">Nombre del Curso</th>
								<th scope="col" class="centered">Fecha</th>
								<th scope="col" class="centered">Hora</th>
								<th scope="col" class="centered">Acciones</th>
							</tr>
						</thead>
						<tbody>
							<%
							List<Matricula> listMatri = (List<Matricula>) request.getAttribute("listMatri");
							if (listMatri != null) {
								for (Matricula c : listMatri) {
									Alumno alumno = c.getCodAlumno();
									Curso curso = c.getCodCurso();
							%>
							<tr>
								<td><%=c.getNumMatricula()%></td>
								<td><%=alumno.getIdAlumno()%></td>
								<td><%=alumno.getNombres()%></td>
								<td><%=curso.getCodCurso()%></td>
								<td><%=curso.getNomCurso()%></td>
								<td><%=c.getFecha()%></td>
								<td><%=c.getHora()%></td>
								<td><a
									href="MatriculaServlet?type=obtener&numMatricula=<%=c.getNumMatricula()%>"
									class="btn btn-primary"><i class="fa-solid fa-pencil"></i></a>
									<a href="#" onclick="confirmarEliminar('<%=c.getNumMatricula()%>')"
       class="btn btn-danger"><i class="fa-solid fa-trash-can"></i></a>
								</td>
							</tr>
							<%
							}
							}
							%>
						</tbody>
					</table>
				</div>
		</div>
	</div>
	<!-- FIN CONTENEDOR MATRICULA -->
	
			</main>


		</div>
	</div>
	<%@ include file="components/footer.jsp"%>
	<%
	if (session.getAttribute("usuario") == null) {
		response.sendRedirect("login.jsp");
	}
	%>
	<script>
    function confirmarEliminar(numMatricula) {
        if (confirm('¿Estás seguro de que quieres eliminar esta matrícula?')) {
            window.location.href = 'MatriculaServlet?type=eliminar&numMatricula=' + numMatricula;
        }
    }
</script>
<script src="https://code.jquery.com/jquery-3.7.1.js"></script>
<script src="https://cdn.datatables.net/2.0.8/js/dataTables.js"></script>
    <script src="https://cdn.datatables.net/buttons/3.0.2/js/dataTables.buttons.js"></script>
    <script src="https://cdn.datatables.net/buttons/3.0.2/js/buttons.dataTables.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jszip/3.10.1/jszip.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.2.7/pdfmake.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.2.7/vfs_fonts.js"></script>
    <script src="https://cdn.datatables.net/buttons/3.0.2/js/buttons.html5.min.js"></script>
    <script src="https://cdn.datatables.net/buttons/3.0.2/js/buttons.print.min.js"></script>

<script>
new DataTable('#miTabla', {
	 layout: {
	        topStart: {
	            buttons: ['copy', 'csv', 'excel', 'pdf', 'print']
	        }
	    },
	    lengthMenu: [5, 10, 15, 20, 100, 200, 500],
	    columnDefs: [
			{ targets: [1, 3], visible: false },
{ className: "centered", targets: [0, 1, 2, 3, 4, 5, 6, 7] },
{ orderable: false, targets: [7] },
{ searchable: false, targets: [1] }
],
	    pageLength: 3,
	    destroy: true,
	    language: {
	        lengthMenu: "Mostrar _MENU_ registros por página",
	        zeroRecords: "Ningún usuario encontrado",
	        info: "Mostrando de _START_ a _END_ de un total de _TOTAL_ registros",
	        infoEmpty: "Ningún usuario encontrado",
	        infoFiltered: "(filtrados desde _MAX_ registros totales)",
	        search: "Buscar:",
	        loadingRecords: "Cargando...",
	        paginate: {
	            first: "Primero",
	            last: "Último",
	            next: "Siguiente",
	            previous: "Anterior"
	        }
	    }
});
    </script>
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
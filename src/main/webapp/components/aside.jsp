<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<aside id="sidebar">
			<div class="h-100">
				<div class="sidebar-logo">
					<a href="index.jsp">I.E Albert Einstein</a>
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
							<li class="sidebar-item"><a href="CursoServlet?type=listar"
								class="sidebar-link">Lista de Cursos</a></li>	
							<li class="sidebar-item"><a href="curso.jsp"
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
							<li class="sidebar-item"><a href="MatriculaServlet?type=listar"
								class="sidebar-link">Lista Matricula</a></li>
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
								href="logoutServlet" class="sidebar-link">Cerrar Sesion</a></li>
						</ul></li>

					<li class="sidebar-link collapsed"></li>

				</ul>
			</div>
		</aside>
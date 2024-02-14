package servlets;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import daoImplements.AlumnoDaoImpl;
import daoInterface.IAlumnoDao;
import model.Alumno;

/**
 * Servlet implementation class AlumnoServlet
 */
@WebServlet("/AlumnoServlet")
public class AlumnoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	IAlumnoDao alumnoDao = new AlumnoDaoImpl();
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AlumnoServlet() {
        super();
        // TODO Auto-generated constructor stub
    }
	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String type = request.getParameter("type");
		if (type != null) {
			switch (type) {
			case "registrar":
				String id = request.getParameter("txtIdAlumno");
				if (id != null && !id.isEmpty())
					upDateAlumno(request, response);
				else
					createAlumno(request, response);
				break;
			case "listar":
				listarAlumno(request, response);
				break;
			case "obtener":
				obtener(request, response);
				break;
			case "eliminar":
				eliminarAlumno(request, response);
				break;
			default:
				break;
			}
		} else {
			listarAlumno(request, response);
		}

	}
	private void obtener(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String id = request.getParameter("idAlumno");
		Alumno alumno = alumnoDao .getAlumno(Integer.parseInt(id));

		if (alumno != null) {
			request.setAttribute("alumno", alumno);
			listarAlumno(request, response);
		} else {
			request.setAttribute("mensaje", "Error al obtener Alumno");
			request.getRequestDispatcher("manteAlumno.jsp").forward(request, response);

		}

	}

	private void upDateAlumno(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		Integer id = Integer.parseInt(request.getParameter("txtIdAlumno"));
		String dni = request.getParameter("txtDni");
		String nombre = request.getParameter("txtNombre");
		String apellido = request.getParameter("txtApellido");
		Integer edad = Integer.parseInt(request.getParameter("txtEdad"));
		String correo = request.getParameter("txtCorreo");

		Alumno alumno = new Alumno();
		alumno.setDni(dni);
		alumno.setNombres(nombre);
		alumno.setApellidos(apellido);
		alumno.setEmail(correo);
		alumno.setTelefono(correo);
		alumno.setEstado(0);
        alumnoDao.actualizarAlumno(alumno);

		listarAlumno(request, response);

			request.setAttribute("mensaje", "Error al Actualizar Alumno");
			//request.getRequestDispatcher("manteAlumno.jsp").forward(request, response);
		}
	private void createAlumno(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String dni = request.getParameter("txtDni");
		String nombre = request.getParameter("txtNombre");
		String apellido = request.getParameter("txtApellido");
		Integer edad = Integer.parseInt(request.getParameter("txtEdad"));
		String correo = request.getParameter("txtCorreo");
		String estado = request.getParameter("txtEstado");

		Alumno alumno = new Alumno();

		alumno.setDni(dni);
		alumno.setNombres(nombre);
		alumno.setApellidos(apellido);
		alumno.setEmail(correo);
		alumno.setTelefono(correo);
		alumno.setEstado(0);
		 alumnoDao.crearAlumno(alumno);

			listarAlumno(request, response);
			request.setAttribute("mensaje", "Error al crear Alumno");
			//request.getRequestDispatcher("manteAlumno.jsp").forward(request, response);

	}

	private void listarAlumno(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		List<Alumno> lisAlumno = alumnoDao.listarAlumnos();

		request.setAttribute("listAlumno", lisAlumno);
		request.getRequestDispatcher("manteAlumno.jsp").forward(request, response);

	}

	private void eliminarAlumno(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String id = request.getParameter("idAlumno");
        alumnoDao.eliminarAlumno(Integer.parseInt(id));
		 listarAlumno(request, response);

			request.setAttribute("mensaje", "Error al eliminar Alumno");
			request.getRequestDispatcher("manteAlumno.jsp").forward(request, response);
		}
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}

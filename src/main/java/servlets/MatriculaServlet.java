package servlets;

import java.io.IOException;
import java.sql.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import daoImplements.AlumnoDaoImpl;
import daoImplements.CursoDaoImpl;
import daoImplements.MatriculaDaoImpl;
import daoInterface.IAlumnoDao;
import daoInterface.ICursoDao;
import daoInterface.IMatriculaDao;
import model.Alumno;
import model.Curso;
import model.Matricula;
import utils.Fecha;

/**
 * Servlet implementation class MatriculaServlet
 */
@WebServlet("/MatriculaServlet")
public class MatriculaServlet extends HttpServlet {
	
	IMatriculaDao matri = new MatriculaDaoImpl();
	ICursoDao curs = new CursoDaoImpl();
	IAlumnoDao alum = new AlumnoDaoImpl();
    Fecha fechaUtil = new Fecha();
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MatriculaServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
    protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String type = request.getParameter("type");
		switch (type) {
		case "registrar":
			String id = request.getParameter("txtNumMatricula");
			if(id != null && !id.isEmpty())
				updateMatricula(request, response);
			else
				addMatricula(request, response);
			break;
		case "listar":
            listarMatricula(request,response);
			break;
		case "eliminar":
			eliminarMatricula(request,response);
			break;
		case "obtener":
			obtenerMatricula(request,response);
			break;
		default:
			break;
		}

	}
    private void addMatricula(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            Integer codAlumno = Integer.parseInt(request.getParameter("txtCodAlumno"));
            Integer codCurso = Integer.parseInt(request.getParameter("txtCodCurso"));

            // Verificar si el alumno ya está matriculado en el curso
            /*if (matri.buscarPorAlumnoYCurso(codAlumno, codCurso) != null) {
                request.setAttribute("mensaje", "El alumno ya está matriculado en este curso");
                listarMatricula(request, response);
                return; // Terminar la ejecución del método
            }*/

            Date fechaSql = new Date(fechaUtil.obtenerFechaActual().getTime());

            // Obtener instancias de Alumno y Curso
            Alumno alumno = alum.getAlumno(codAlumno); // Implementa este método
            Curso curso = curs.getCurso(codCurso); // Implementa este método

            if (alumno == null || curso == null) {
                request.setAttribute("mensaje", "No se encontró el alumno o el curso");
                listarMatricula(request, response);
                return;
            }
            // Crear la matrícula
            Matricula matricula = new Matricula();
            matricula.setCodAlumno(alumno);
            matricula.setCodCurso(curso);
            matricula.setFecha(fechaSql);
            matricula.setHora(Fecha.horaActual());
            alumno.setEstado(2);
            alum.actualizarAlumno(alumno);
            matri.crearMatricula(matricula);

            request.setAttribute("mensaje", "Alumno Matriculado Correctamente");
            listarMatricula(request, response);
        } catch (NumberFormatException e) {
            request.setAttribute("mensaje", "Error en el formato de los códigos de alumno o curso");
            listarMatricula(request, response);
        } catch (Exception e) {
            request.setAttribute("mensaje", "Error al matricular Alumno");
            listarMatricula(request, response);
        }
    }
	private void updateMatricula(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		try {			
			Integer id = Integer.parseInt(request.getParameter("txtNumMatricula"));
	    	Integer codAlumno = Integer.parseInt(request.getParameter("txtCodAlumno"));
			Integer codCurso = Integer.parseInt(request.getParameter("txtCodCurso"));
			Date fechaSql = new Date(fechaUtil.obtenerFechaActual().getTime());
			
			 // Obtener instancias de Alumno y Curso
            Alumno alumno = alum.getAlumno(codAlumno); // Implementa este método
            Curso curso = curs.getCurso(codCurso); // Implementa este método

            if (alumno == null || curso == null) {
                request.setAttribute("mensaje", "No se encontró el alumno o el curso");
                listarMatricula(request, response);
                return;
            }
			
			Matricula mat = new Matricula();
		   mat.setNumMatricula(id);
		   mat.setCodAlumno(alumno);
		   mat.setCodCurso(curso);
		   mat.setFecha(fechaSql);
		   mat.setHora(Fecha.horaActual());;
		   matri.actualizarMatricula(mat);
			   listarMatricula(request,response);
			   System.out.println("Matricula Actualizado Correctamente");

			   request.setAttribute("mensaje", "Error al actualizar la Matricula");
				request.getRequestDispatcher("matricula.jsp").forward(request, response);
				
				System.out.println("Error al Modificar");
		   } catch (Exception e) {
			   e.printStackTrace();
				System.out.println("Error al actualizar");

			}
    }
    private void listarMatricula(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		List<Matricula> lisMat = matri.listarMatricula();
		request.setAttribute("listMatri", lisMat);
		request.getRequestDispatcher("listMatriculas.jsp").forward(request, response);
	}
    private void eliminarMatricula(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String id = request.getParameter("numMatricula");
		matri.eliminarMatricula(Integer.parseInt(id));
	
			listarMatricula(request, response);
		
			System.out.println("Error al Eliminar Matricula");
			request.setAttribute("mensaje", "Error al Eliminar Matricula");
			request.getRequestDispatcher("matricula.jsp").forward(request, response);

		
	}
    private void obtenerMatricula(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		String id = request.getParameter("numMatricula");
		Matricula m = matri.getMatricula(Integer.parseInt(id));
		if(m!=null){
			request.setAttribute("matri", m);
			request.getRequestDispatcher("matricula.jsp").forward(request, response);
		}else {
			request.setAttribute("mensaje", "Error al obtener el id");
			request.getRequestDispatcher("listMatriculas.jsp").forward(request, response);
		}
		
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

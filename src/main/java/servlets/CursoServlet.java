package servlets;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import daoImplements.CursoDaoImpl;
import daoImplements.DocenteDaoImpl;
import daoInterface.ICursoDao;
import daoInterface.IDocenteDao;
import model.Alumno;
import model.Curso;
import model.Docente;

/**
 * Servlet implementation class CursoServlet
 */
@WebServlet("/CursoServlet")
public class CursoServlet extends HttpServlet {
	ICursoDao cursoDao = new CursoDaoImpl();
	IDocenteDao doce = new DocenteDaoImpl();
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CursoServlet() {
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
			String id = request.getParameter("txtCodCurso");
			if (id != null && !id.isEmpty())
				updateCurso(request, response);
			else
				createCurso(request, response);
			break;
		case "listar":
			listarCurso(request, response);
			break;
		case "obtener":
			obtenerCurso(request, response);
			break;
		case "eliminar":
			eliminarCurso(request, response);
			break;
		default:
			break;
		}
	} else {
		listarCurso(request, response);
	}	
		
	}
	
	protected void obtenerCurso(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		
		String codigo = request.getParameter("codCurso");
		Curso curso = cursoDao.getCurso(Integer.parseInt(codigo));
		
		if(curso !=null) {
			request.setAttribute("curso", curso);
			request.getRequestDispatcher("curso.jsp").forward(request, response);
		}else {
			request.setAttribute("mensaje", "Error al obtener Curso");
			request.getRequestDispatcher("listCurso.jsp").forward(request, response);
		}
	}
		
	protected void updateCurso(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		
		Integer codCurso = Integer.parseInt(request.getParameter("txtCodCurso"));
		String nomCurso = request.getParameter("txtnomCurso");
		Integer ciclo = Integer.parseInt(request.getParameter("txtCiclo"));
		Integer creditCurso = Integer.parseInt(request.getParameter("txtCreditCurso"));
	    Integer horasCurso = Integer.parseInt(request.getParameter("txtHorasCurso"));
        Integer docente = Integer.parseInt(request.getParameter("selectDocente"));
	    
	    Docente docent = doce.getDocente(docente);
	    
	    Curso curso = new Curso();
	    curso.setCodCurso(codCurso);
	    curso.setNomCurso(nomCurso);
	    curso.setCiclo(ciclo);
	    curso.setCrediCurso(creditCurso);
	    curso.setHorasCurso(horasCurso);
	    curso.setIdDocente(docent);
	    
	    cursoDao.actualizarCurso(curso);
	    
	    listarCurso(request, response);
	    request.setAttribute("mensaje", "Curso Actualizado Correctamente");
	    
	   
	}
	protected void createCurso(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		
		Integer codCurso = Integer.parseInt(request.getParameter("txtCodCurso"));
		String nomCurso = request.getParameter("txtnomCurso");
		Integer ciclo = Integer.parseInt(request.getParameter("txtCiclo"));
		Integer creditCurso = Integer.parseInt(request.getParameter("txtCreditCurso"));
	    Integer horasCurso = Integer.parseInt(request.getParameter("txtHorasCurso"));
	    Integer docente = Integer.parseInt(request.getParameter("selectDocente"));
	    
	    Docente docent = doce.getDocente(docente);
	    Curso curso = new Curso();
	    curso.setCodCurso(codCurso);
	    curso.setNomCurso(nomCurso);
	    curso.setCiclo(ciclo);
	    curso.setCrediCurso(creditCurso);
	    curso.setHorasCurso(horasCurso);
	    curso.setIdDocente(docent);
	    
		cursoDao.crearCurso(curso);
		listarCurso(request, response);
	    request.setAttribute("mensaje", "Error al crear Curso");
	
	}
	
	protected void listarCurso(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		
		List<Curso> lisCurso = cursoDao.listarCursos();
		
		request.setAttribute("listCurso", lisCurso);
		request.getRequestDispatcher("listCursos.jsp").forward(request, response);
		
	}
	protected void eliminarCurso(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		
		String codigo = request.getParameter("codCurso");
		cursoDao.eliminarCurso(Integer.parseInt(codigo));
		listarCurso(request, response);
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

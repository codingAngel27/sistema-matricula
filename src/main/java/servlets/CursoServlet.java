package servlets;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import daoImplements.CursoDaoImpl;
import daoInterface.ICursoDao;
import model.Curso;

/**
 * Servlet implementation class CursoServlet
 */
@WebServlet("/CursoServlet")
public class CursoServlet extends HttpServlet {
	ICursoDao cursoDao = new CursoDaoImpl();
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
		// TODO Auto-generated method stub
	}
	
	protected void obtenerCurso(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		
		String codigo = request.getParameter("codCurso");
		Curso curso = cursoDao.getCurso(Integer.parseInt(codigo));
		
		if(curso !=null) {
			request.setAttribute("curso", curso);
			listarCurso(request, response);
		}else {
			request.setAttribute("mensaje", "Error al obtener Curso");
			request.getRequestDispatcher("curso.jsp").forward(request, response);
		}
	}
	
	protected void createOrUpdateCurso(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		String codigo = request.getParameter("txtCodCurso");
		if(codigo == null || codigo.isEmpty() || cursoDao.getCurso(Integer.parseInt(codigo)) == null)
			createCurso(request, response);
		else
			updateCurso(request, response);
	}
	
	protected void updateCurso(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		
		Integer codCurso = Integer.parseInt(request.getParameter("txtCodCurso"));
		String nomCurso = request.getParameter("txtnomCurso");
		Integer ciclo = Integer.parseInt(request.getParameter("txtCiclo"));
		Integer creditCurso = Integer.parseInt(request.getParameter("txtCreditCurso"));
	    Integer horasCurso = Integer.parseInt(request.getParameter("txtHorasCurso"));
	   
	}
	protected void createCurso(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		
		Integer codCurso = Integer.parseInt(request.getParameter("txtCodCurso"));
		String nomCurso = request.getParameter("txtnomCurso");
		Integer ciclo = Integer.parseInt(request.getParameter("txtCiclo"));
		Integer creditCurso = Integer.parseInt(request.getParameter("txtCreditCurso"));
	    Integer horasCurso = Integer.parseInt(request.getParameter("txtHorasCurso"));
	    
	    Curso curso = new Curso();
	    curso.setCodCurso(codCurso);
	    curso.setNomCurso(nomCurso);
	    curso.setCodCurso(ciclo);
	    curso.setCrediCurso(creditCurso);
	    curso.setHorasCurso(horasCurso);
	    
		cursoDao.crearCurso(curso);
		listarCurso(request, response);
	    request.setAttribute("mensaje", "Error al crear Curso");
	
	}
	
	protected void listarCurso(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		
		List<Curso> lisCurso = cursoDao.listarCursos();
		
		request.setAttribute("listCurso", lisCurso);
		request.getRequestDispatcher("curso.jsp").forward(request, response);
		
	}
	protected void eliminarCurso(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		
		String codigo = request.getParameter("codCurso");
		cursoDao.eliminarCurso(Integer.parseInt(codigo));
		listarCurso(request, response);
	}
	protected void buscarCurso(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		
		String codigo = request.getParameter("txtBuscarCodCurso");
		
		Curso listCurso = cursoDao.getCurso(Integer.parseInt(codigo));
		if(listCurso != null) {
			request.setAttribute("listCurso", listCurso);
		}else {
			request.setAttribute("mensaje", "No se encontro Curso");
		}
		request.getRequestDispatcher("manteCurso.jsp").forward(request, response);
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

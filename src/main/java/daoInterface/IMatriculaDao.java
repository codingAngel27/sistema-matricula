package daoInterface;

import java.util.List;
import model.Matricula;

public interface IMatriculaDao {
	
	public List<Matricula> listarMatricula();
	public Matricula getMatricula(Integer id);
	public void crearMatricula(Matricula m);
	public void actualizarMatricula(Matricula m);
	public void eliminarMatricula(Integer id);
	public boolean alumnoYaMatriculado(String codAlumno, String codCurso);
}

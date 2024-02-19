package daoInterface;

import java.util.List;

import model.Curso;

public interface ICursoDao {
	public List<Curso> listarCursos();
	public Curso getCurso(Integer codigo);
	public void crearCurso(Curso c);
	public void actualizarCurso(Curso c);
	public void eliminarCurso(Integer codigo);
	public Curso buscarCurso(Integer codCurso);

}

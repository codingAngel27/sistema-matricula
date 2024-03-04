package daoInterface;

import java.util.List;

import model.Docente;

public interface IDocenteDao {
	
	public List<Docente> listarDocentes();
	public Docente getDocente(Integer id);
	public void crearDocente(Docente d);
	public void actualizarDocente(Docente d);
	public void eliminarDocente(Integer id);

}

package daoInterface;

import java.util.List;

import model.Alumno;

public interface IAlumnoDao {
	public List<Alumno> listarAlumnos();
	public Alumno getAlumno(Integer id);
	public void crearAlumno(Alumno u);
	public void actualizarAlumno(Alumno u);
	public void eliminarAlumno(Integer id);
}

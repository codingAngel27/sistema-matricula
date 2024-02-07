package pruebas;

import java.util.List;

import daoImplements.AlumnoDaoImpl;
import daoInterface.IAlumnoDao;
import model.Alumno;



public class Prueba01 {

	public static void main(String[] args) {
		
		IAlumnoDao alum = new AlumnoDaoImpl();
		List<Alumno> lisMat = alum.listarAlumnos();
		for(Alumno a: lisMat) {
			System.out.println(a.getIdAlumno());
			System.out.println(a.getNombres());
			System.out.println(a.getApellidos());
			System.out.println(a.getDni());
			System.out.println(a.getTelefono());
		}

	}

}

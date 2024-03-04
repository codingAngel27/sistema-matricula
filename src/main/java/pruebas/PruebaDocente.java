package pruebas;

import java.util.List;


import daoImplements.DocenteDaoImpl;

import daoInterface.IDocenteDao;

import model.Docente;

public class PruebaDocente {

	public static void main(String[] args) {
		IDocenteDao alum = new DocenteDaoImpl();
		List<Docente> lisMat = alum.listarDocentes();
		for(Docente a: lisMat) {
			System.out.println(a.getIdProfesor());
			System.out.println(a.getNombre());
			System.out.println(a.getApellido());
			System.out.println(a.getEmail());
			System.out.println(a.getTelefono());
			System.out.println(a.getProfesion());
		}

	}

}

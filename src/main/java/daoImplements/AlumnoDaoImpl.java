package daoImplements;

import java.util.ArrayList;
import java.util.List;

import daoInterface.IAlumnoDao;
import jakarta.persistence.EntityManager;
import jakarta.persistence.Query;
import model.Alumno;
import utils.JPAUtil;

public class AlumnoDaoImpl implements IAlumnoDao {
	EntityManager entityManager = JPAUtil.getEntityManagerFactory().createEntityManager();

	@SuppressWarnings("unchecked")
	@Override
	public List<Alumno> listarAlumnos() {
		List<Alumno> alumnos= new ArrayList<>();
		Query query = entityManager.createQuery("Select a From Alumno a");
		alumnos = query.getResultList();
		return alumnos;
	}
}

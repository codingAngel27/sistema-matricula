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

	@Override
	public Alumno getAlumno(Integer id) {
		// TODO Auto-generated method stub
		return entityManager.find(Alumno.class, id);
	}

	@Override
	public void crearAlumno(Alumno a) {
		try {
			entityManager.getTransaction().begin();
			entityManager.persist(a);
			entityManager.getTransaction().commit();
			System.out.println("Se guardo correctamente");	
		} catch (Exception e) {
			if(entityManager.getTransaction() != null) {
				entityManager.getTransaction().rollback();
			}
			e.printStackTrace();
		}
		
	}

	@Override
	public void actualizarAlumno(Alumno a) {
		try {
			entityManager.getTransaction().begin();
			entityManager.merge(a);
			entityManager.getTransaction().commit();
			System.out.println("Se Actualizo correctamente");	
		} catch (Exception e) {
			if(entityManager.getTransaction() != null) {
				entityManager.getTransaction().rollback();
			}
			e.printStackTrace();
		}	
		
	}

	@Override
	public void eliminarAlumno(Integer id) {
		Alumno a= getAlumno(id);
		entityManager.getTransaction().begin();
		entityManager.remove(a);
		entityManager.getTransaction().commit();
		
	}
}

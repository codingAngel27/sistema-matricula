package daoImplements;

import java.util.ArrayList;
import java.util.List;

import daoInterface.IMatriculaDao;
import jakarta.persistence.EntityManager;
import jakarta.persistence.Query;
import jakarta.persistence.TypedQuery;
import model.Matricula;
import utils.JPAUtil;

public class MatriculaDaoImpl implements IMatriculaDao {
	EntityManager entityManager = JPAUtil.getEntityManagerFactory().createEntityManager();

	@SuppressWarnings("unchecked")
	@Override
	public List<Matricula> listarMatricula() {
		List<Matricula> matriculas= new ArrayList<>();
		Query query = entityManager.createQuery("Select m From Matricula m");
		matriculas = query.getResultList();
		return matriculas;
	}

	@Override
	public Matricula getMatricula(Integer id) {
		return entityManager.find(Matricula.class, id);
	}

	@Override
	public void crearMatricula(Matricula m) {
		try {
			entityManager.getTransaction().begin();
			entityManager.persist(m);
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
	public void actualizarMatricula(Matricula m) {
		try {
			entityManager.getTransaction().begin();
			entityManager.merge(m);
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
	public void eliminarMatricula(Integer id) {
		Matricula mat= getMatricula(id);
		entityManager.getTransaction().begin();
		entityManager.remove(mat);
		entityManager.getTransaction().commit();
		
	}

	@Override
	public boolean alumnoYaMatriculado(String codAlumno, String codCurso) {
		 String jpql = "SELECT COUNT(m) FROM Matricula m WHERE m.codAlumno = :codAlumno AND m.codCurso = :codCurso";
	        
	        TypedQuery<Long> query = entityManager.createQuery(jpql, Long.class)
	            .setParameter("idAlumno", codAlumno)
	            .setParameter("idCurso", codCurso);

	        Long count = query.getSingleResult();
	        return count > 0;
	    }
}

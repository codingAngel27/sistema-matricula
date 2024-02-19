package daoImplements;

import java.util.ArrayList;
import java.util.List;

import daoInterface.ICursoDao;
import jakarta.persistence.EntityManager;
import jakarta.persistence.Query;
import model.Curso;
import utils.JPAUtil;

public class CursoDaoImpl implements ICursoDao{
	
	EntityManager entityManager = JPAUtil.getEntityManagerFactory().createEntityManager();

	@SuppressWarnings("unchecked")
	@Override
	public List<Curso> listarCursos() {
		List<Curso> cursos = new ArrayList<>();
		Query query = entityManager.createQuery("Select c From Curso c");
		cursos = query.getResultList();
		
		return cursos;
	}

	@Override
	public Curso getCurso(Integer codigo) {
		
		return entityManager.find(Curso.class, codigo);
	}

	@Override
	public void crearCurso(Curso c) {
		try {
			entityManager.getTransaction().begin();
			entityManager.persist(c);
			entityManager.getTransaction().commit();
			System.out.println("El Curso se guardo correctamente");	
			
		} catch (Exception e) {
			if(entityManager.getTransaction() != null) {
				entityManager.getTransaction().rollback();
			}
			e.printStackTrace();
			
		}
	}

	@Override
	public void actualizarCurso(Curso c) {
		try {
			entityManager.getTransaction().begin();
			entityManager.merge(c);
			entityManager.getTransaction().commit();
			System.out.println("El curso se Actualizo correctamente");	
		} catch (Exception e) {
			if(entityManager.getTransaction() != null) {
				entityManager.getTransaction().rollback();
			}
			e.printStackTrace();
		}	
		
	}

	@Override
	public void eliminarCurso(Integer codigo) {
		Curso c = getCurso(codigo);
		entityManager.getTransaction().begin();
		entityManager.remove(c);
		entityManager.getTransaction().commit();
	}
	
	@Override
	public Curso buscarCurso(Integer codCurso) {
        Curso curso = null;
        try {
            
            curso = entityManager.find(Curso.class, codCurso);
        } finally {
            entityManager.close();
        }
        return curso;
    }

}

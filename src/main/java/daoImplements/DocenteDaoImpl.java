package daoImplements;

import java.util.ArrayList;
import java.util.List;

import daoInterface.IDocenteDao;
import jakarta.persistence.EntityManager;
import jakarta.persistence.Query;
import model.Docente;
import utils.JPAUtil;

public class DocenteDaoImpl implements IDocenteDao{
   
	EntityManager entityManager = JPAUtil.getEntityManagerFactory().createEntityManager();
    
	@SuppressWarnings("unchecked")
	@Override
	public List<Docente> listarDocentes() {
		List<Docente> docentes = new ArrayList<>();
		Query query = entityManager.createQuery("Select d From Docente d");
		docentes = query.getResultList();
		return docentes;
	}

	@Override
	public Docente getDocente(Integer id) {
		// TODO Auto-generated method stub
		return entityManager.find(Docente.class, id);
	}

	@Override
	public void crearDocente(Docente d) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void actualizarDocente(Docente d) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void eliminarDocente(Integer id) {
		// TODO Auto-generated method stub
		
	}

}

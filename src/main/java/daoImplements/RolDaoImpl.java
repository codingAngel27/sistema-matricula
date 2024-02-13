package daoImplements;



import daoInterface.IRolDao;
import jakarta.persistence.EntityManager;
import jakarta.persistence.Query;
import model.Rol;
import utils.JPAUtil;

public class RolDaoImpl implements IRolDao{
	
	EntityManager entityManager = JPAUtil.getEntityManagerFactory().createEntityManager();

	@Override
	public Rol iniciarSesion(String email, String clave) {
		
	  return null;
	}

}

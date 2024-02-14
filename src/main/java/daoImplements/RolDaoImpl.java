package daoImplements;



import java.util.List;

import daoInterface.IRolDao;
import jakarta.persistence.EntityManager;
//import jakarta.persistence.Query;
import model.Rol;
import utils.JPAUtil;

public class RolDaoImpl implements IRolDao{
	
	EntityManager entityManager = JPAUtil.getEntityManagerFactory().createEntityManager();

	@Override
	public Rol getRol(Integer id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Rol> listRegistro() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Integer crearRol(Rol r) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Integer actualizarRol(Rol r) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Integer eliminarRol(int id) {
		// TODO Auto-generated method stub
		return null;
	}

}

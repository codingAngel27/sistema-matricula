package daoImplements;

import java.util.List;

import daoInterface.IUsuarioDao;
import jakarta.persistence.EntityManager;
import jakarta.persistence.Query;
import model.Rol;
import model.Usuario;
import utils.JPAUtil;

public class UsuarioDaoImpl implements IUsuarioDao {
	
	EntityManager entityManager = JPAUtil.getEntityManagerFactory().createEntityManager();
	@Override
	public Usuario iniciarSesion(String email, String clave) {

		 try {
	            // Crear una consulta para buscar un Rol con el email y clave proporcionados
	            Query query = entityManager.createQuery("SELECT u FROM Usuario u WHERE u.email = :email AND u.clave = :clave", Rol.class);
	            query.setParameter("email", email);
	            query.setParameter("clave", clave);
	            List<Usuario> roles = query.getResultList();
	            if (!roles.isEmpty()) {
	                return roles.get(0);
	            } else {
	                return null;
	            }
	        } catch (Exception e) {
	            e.printStackTrace();
	            return null;
	        }
	}

}

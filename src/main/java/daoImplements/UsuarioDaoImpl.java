package daoImplements;

import java.util.ArrayList;
import java.util.List;

import daoInterface.IUsuarioDao;
import jakarta.persistence.EntityManager;
import jakarta.persistence.Query;
import model.Usuario;
import utils.JPAUtil;

public class UsuarioDaoImpl implements IUsuarioDao {
	
	EntityManager entityManager = JPAUtil.getEntityManagerFactory().createEntityManager();
	@Override
	public Usuario iniciarSesion(String email, String clave) {

		 try {
	            Query query = entityManager.createQuery("SELECT u FROM Usuario u WHERE u.email = :email AND u.clave = :clave", Usuario.class);
	            query.setParameter("email", email);
	            query.setParameter("clave", clave);
				@SuppressWarnings("unchecked")
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
	@Override
	public Usuario getUsuario(Integer id) {
		return entityManager.find(Usuario.class, id);
	
	}
	@SuppressWarnings("unchecked")
	@Override
	public List<Usuario> listarUsuario() {
		List<Usuario> usuarios = new ArrayList<>();
		Query query = entityManager.createQuery("Select u From Usuario u");
		usuarios = query.getResultList();
		return usuarios;
	}
	@Override
	public void crearUsuario(Usuario u) {
		try {
			entityManager.getTransaction().begin();
			entityManager.persist(u);
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
	public void actualizarUsuario(Usuario u) {
		try {
			entityManager.getTransaction().begin();
			entityManager.merge(u);
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
	public void eliminarUsuario(Integer id) {
		Usuario u = getUsuario(id);
		entityManager.getTransaction().begin();
		entityManager.remove(u);
		entityManager.getTransaction().commit();	
		

	}
}

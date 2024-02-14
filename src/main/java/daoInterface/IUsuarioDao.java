package daoInterface;

import java.util.List;
import model.Usuario;

public interface IUsuarioDao {
	public Usuario iniciarSesion(String email, String clave);
	public List<Usuario> listarUsuario();
	public Usuario getUsuario(Integer id);
	public void crearUsuario(Usuario u);
	public void actualizarUsuario(Usuario u);
	public void eliminarUsuario(Integer id);
}

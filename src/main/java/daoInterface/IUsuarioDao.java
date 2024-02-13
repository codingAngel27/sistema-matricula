package daoInterface;

import model.Usuario;

public interface IUsuarioDao {
	public Usuario iniciarSesion(String email, String clave);
}

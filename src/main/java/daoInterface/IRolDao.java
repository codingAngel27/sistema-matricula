package daoInterface;

import model.Rol;

public interface IRolDao {
	
	public Rol iniciarSesion(String email, String clave);

}

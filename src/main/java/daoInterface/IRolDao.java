package daoInterface;

import java.util.List;
import model.Rol;

public interface IRolDao {
	
	public Rol getRol(Integer id);
	public List<Rol> listRegistro();
	public Integer crearRol(Rol r);
	public Integer actualizarRol(Rol r);
	public Integer eliminarRol(int id);

}

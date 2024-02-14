package pruebas;

import java.util.List;

import daoImplements.UsuarioDaoImpl;
import daoInterface.IUsuarioDao;
import model.Rol;
import model.Usuario;

public class PruebaUsuario {

	public static void main(String[] args) {
		IUsuarioDao usuarioDao = new UsuarioDaoImpl();
		Usuario usu = new Usuario();
		Rol rol = new Rol(); // Crear un nuevo objeto Rol
		rol.setIdRol(1);
		usu.setNombre("Guialiana Dennis");
		usu.setEmail("thedennis@gmail.com");
		usu.setClave("admin123");
		usu.setIdRol(rol);
		
		usuarioDao.crearUsuario(usu);
		
		List<Usuario> subjectList = usuarioDao.listarUsuario();
		for (Usuario u : subjectList) {

			System.out.println(u.getIdUsuario());
			System.out.println(u.getEmail());
			System.out.println(u.getNombre());
			System.out.println(u.getClave());
			System.out.println(u.getIdRol());
		}

	}

}

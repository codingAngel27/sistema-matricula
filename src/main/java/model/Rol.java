package model;

import jakarta.persistence.*;
import lombok.*;


@Data
@Entity
@Table(name="tbl_rol")
public class Rol {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "id_rol")
	private Integer idRol;
	
	@Column
	private String email;
	
	@Column
	private String nombre;
	
	@Column
	private String clave;
}

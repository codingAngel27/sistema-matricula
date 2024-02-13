package model;

import jakarta.persistence.*;
import lombok.*;


@Data
@Entity
@Table(name="tbl_rol")
public class Rol {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "idRol")
	private Integer idRol;
	
	@Column
	private String nombreRol;
}

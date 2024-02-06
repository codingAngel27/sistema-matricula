package model;

import jakarta.persistence.*;
import lombok.*;

@Data
@Getter
@Setter
@Entity
@Table(name="tbl_alumno")
public class Alumno {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "id_alumno")
	private Integer idAlumno;
	
	@Column
	private String nombres;
	
	@Column 
	private String apellidos;
	
	@Column
	private String dni;
	
	@Column 
	private String telefono;
}
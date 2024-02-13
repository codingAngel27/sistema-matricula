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
	
	@Column
	private String email;
	
	@Column
	private Integer estado;

	
	
	public Integer getIdAlumno() {
		return idAlumno;
	}



	public void setIdAlumno(Integer idAlumno) {
		this.idAlumno = idAlumno;
	}



	public String getNombres() {
		return nombres;
	}



	public void setNombres(String nombres) {
		this.nombres = nombres;
	}



	public String getApellidos() {
		return apellidos;
	}



	public void setApellidos(String apellidos) {
		this.apellidos = apellidos;
	}



	public String getDni() {
		return dni;
	}



	public void setDni(String dni) {
		this.dni = dni;
	}



	public String getTelefono() {
		return telefono;
	}



	public void setTelefono(String telefono) {
		this.telefono = telefono;
	}



	public String getEmail() {
		return email;
	}



	public void setEmail(String email) {
		this.email = email;
	}



	public Integer getEstado() {
		return estado;
	}



	public void setEstado(Integer estado) {
		this.estado = estado;
	}



	public String getNombreEstado() {
		switch (estado) {
		case 0: {
			return "Registrado";
		}
		case 1: {
			return "Matriculado";
		}
		case 2: {
			return "Retirado";
		}
		default:
			throw new IllegalArgumentException("Unexpected value: " + estado);
		}
	}
	
}
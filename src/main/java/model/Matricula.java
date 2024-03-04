package model;

import java.sql.Date;

import jakarta.persistence.*;
@Entity
@Table(name="tbl_matricula")
public class Matricula {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name="numMatricula")
	private Integer numMatricula;
	
	@ManyToOne
	@JoinColumn(name = "codAlumno")
	private Alumno codAlumno;
	
	@ManyToOne
	@JoinColumn(name = "codCurso")
	private Curso codCurso;
	
	@Column
	private Date fecha;
	
	@Column
	private String hora;

	public Integer getNumMatricula() {
		return numMatricula;
	}

	public void setNumMatricula(Integer numMatricula) {
		this.numMatricula = numMatricula;
	}

	public Alumno getCodAlumno() {
		return codAlumno;
	}

	public void setCodAlumno(Alumno codAlumno) {
		this.codAlumno = codAlumno;
	}

	public Curso getCodCurso() {
		return codCurso;
	}

	public void setCodCurso(Curso codCurso) {
		this.codCurso = codCurso;
	}

	public Date getFecha() {
		return fecha;
	}

	public void setFecha(Date fecha) {
		this.fecha = fecha;
	}

	public String getHora() {
		return hora;
	}

	public void setHora(String hora) {
		this.hora = hora;
	}
	
	
}

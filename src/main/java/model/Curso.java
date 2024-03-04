package model;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
import lombok.*;

@Data
@Getter
@Setter
@Entity
@Table(name="tbl_curso")
public class Curso {
	@Id
	@Column(name="cod_curso")
	private Integer codCurso;
	
	@Column
	private String nomCurso;
	
	@Column
	private Integer ciclo;
	
	@Column
	private Integer crediCurso;
	
	@Column
	private Integer horasCurso;

	public Integer getCodCurso() {
		return codCurso;
	}

	public void setCodCurso(Integer codCurso) {
		this.codCurso = codCurso;
	}

	public String getNomCurso() {
		return nomCurso;
	}

	public void setNomCurso(String nomCurso) {
		this.nomCurso = nomCurso;
	}

	public Integer getCiclo() {
		return ciclo;
	}

	public void setCiclo(Integer ciclo) {
		this.ciclo = ciclo;
	}

	public Integer getCrediCurso() {
		return crediCurso;
	}

	public void setCrediCurso(Integer crediCurso) {
		this.crediCurso = crediCurso;
	}

	public Integer getHorasCurso() {
		return horasCurso;
	}

	public void setHorasCurso(Integer horasCurso) {
		this.horasCurso = horasCurso;
	}


	
}

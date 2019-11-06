package uce.edu.ec.app.model;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name = "Bienes_Estaciones")
public class Bienes_Estaciones {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	private Date registro;
	private Date cambio;

	@ManyToOne
	@JoinColumn(name = "id_bien")
	private Bien bien;
	@ManyToOne
	@JoinColumn(name = "id_estacion")
	private Estacion estacion;

	// Constructor valores por defecto al registrar un objeto de esta clase
	public Bienes_Estaciones(){
		this.registro = new Date();
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public Bien getBien() {
		return bien;
	}

	public void setBien(Bien bien) {
		this.bien = bien;
	}

	public Estacion getEstacion() {
		return estacion;
	}

	public void setEstacion(Estacion estacion) {
		this.estacion = estacion;
	}

	public Date getRegistro() {
		return registro;
	}

	public void setRegistro(Date registro) {
		this.registro = registro;
	}

	public Date getCambio() {
		return cambio;
	}

	public void setCambio(Date cambio) {
		this.cambio = cambio;
	}

	@Override
	public String toString() {
		return "Bienes_Estaciones [id=" + id + ", registro=" + registro + ", cambio=" + cambio + ", bien=" + bien
				+ ", estacion=" + estacion + "]";
	}

}

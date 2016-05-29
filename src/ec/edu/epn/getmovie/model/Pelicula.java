package ec.edu.epn.getmovie.model;

import java.io.Serializable;
import javax.persistence.*;
import java.math.BigDecimal;
import java.util.Date;


/**
 * The persistent class for the PELICULA database table.
 * 
 */
@Entity
@NamedQuery(name="Pelicula.findAll", query="SELECT p FROM Pelicula p")
public class Pelicula implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int idpelicula;

	private String fotopelicula;

	@Temporal(TemporalType.DATE)
	private Date lanzamientopelicula;

	private String nombrepelicula;

	private BigDecimal ratingpelicula;

	private String sinopsispelicula;

	//bi-directional many-to-one association to Actor
	@ManyToOne
	@JoinColumn(name="IDACTOR")
	private Actor actor;

	//bi-directional many-to-one association to Director
	@ManyToOne
	@JoinColumn(name="IDDIRECTOR")
	private Director director;

	//bi-directional many-to-one association to Genero
	@ManyToOne
	@JoinColumn(name="IDGENERO")
	private Genero genero;

	//bi-directional many-to-one association to Usuario
	@ManyToOne
	@JoinColumn(name="CORREOUSR")
	private Usuario usuario;

	//bi-directional many-to-one association to Productora
	@ManyToOne
	@JoinColumn(name="IDPRODUCTORA")
	private Productora productora;

	public Pelicula() {
	}

	public int getIdpelicula() {
		return this.idpelicula;
	}

	public void setIdpelicula(int idpelicula) {
		this.idpelicula = idpelicula;
	}

	public String getFotopelicula() {
		return this.fotopelicula;
	}

	public void setFotopelicula(String fotopelicula) {
		this.fotopelicula = fotopelicula;
	}

	public Date getLanzamientopelicula() {
		return this.lanzamientopelicula;
	}

	public void setLanzamientopelicula(Date lanzamientopelicula) {
		this.lanzamientopelicula = lanzamientopelicula;
	}

	public String getNombrepelicula() {
		return this.nombrepelicula;
	}

	public void setNombrepelicula(String nombrepelicula) {
		this.nombrepelicula = nombrepelicula;
	}

	public BigDecimal getRatingpelicula() {
		return this.ratingpelicula;
	}

	public void setRatingpelicula(BigDecimal ratingpelicula) {
		this.ratingpelicula = ratingpelicula;
	}

	public String getSinopsispelicula() {
		return this.sinopsispelicula;
	}

	public void setSinopsispelicula(String sinopsispelicula) {
		this.sinopsispelicula = sinopsispelicula;
	}

	public Actor getActor() {
		return this.actor;
	}

	public void setActor(Actor actor) {
		this.actor = actor;
	}

	public Director getDirector() {
		return this.director;
	}

	public void setDirector(Director director) {
		this.director = director;
	}

	public Genero getGenero() {
		return this.genero;
	}

	public void setGenero(Genero genero) {
		this.genero = genero;
	}

	public Usuario getUsuario() {
		return this.usuario;
	}

	public void setUsuario(Usuario usuario) {
		this.usuario = usuario;
	}

	public Productora getProductora() {
		return this.productora;
	}

	public void setProductora(Productora productora) {
		this.productora = productora;
	}

}
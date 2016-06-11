package ec.edu.epn.getmovie.model;

import java.io.Serializable;

import javax.persistence.*;

import java.util.List;


/**
 * The persistent class for the ACTOR database table.
 * 
 */
@Entity
@Table(name = "ACTOR")
@NamedQuery(name="Actor.findByNombre", query="SELECT a FROM Actor a where a.nombreactor like :nombre")
public class Actor implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int idactor;

	private String fotoactor;

	private String nombreactor;

	private String genero;
	
	private String nacimiento;
	
	private int oscars;
	
	//bi-directional many-to-one association to Pelicula
	@OneToMany(mappedBy="actor", fetch=FetchType.EAGER)
	private List<Pelicula> peliculas;

	public Actor() {
	}

	public int getIdactor() {
		return this.idactor;
	}

	public void setIdactor(int idactor) {
		this.idactor = idactor;
	}

	public String getFotoactor() {
		return this.fotoactor;
	}

	public void setFotoactor(String fotoactor) {
		this.fotoactor = fotoactor;
	}

	public String getNombreactor() {
		return this.nombreactor;
	}

	public void setNombreactor(String nombreactor) {
		this.nombreactor = nombreactor;
	}
	
	public String getGenero() {
		return genero;
	}

	public void setGenero(String genero) {
		this.genero = genero;
	}

	public String getNacimiento() {
		return nacimiento;
	}

	public void setNacimiento(String nacimiento) {
		this.nacimiento = nacimiento;
	}

	public int getOscars() {
		return oscars;
	}

	public void setOscars(int oscars) {
		this.oscars = oscars;
	}

	public List<Pelicula> getPeliculas() {
		return this.peliculas;
	}

	public void setPeliculas(List<Pelicula> peliculas) {
		this.peliculas = peliculas;
	}

	public Pelicula addPelicula(Pelicula pelicula) {
		getPeliculas().add(pelicula);
		pelicula.setActor(this);

		return pelicula;
	}

	public Pelicula removePelicula(Pelicula pelicula) {
		getPeliculas().remove(pelicula);
		pelicula.setActor(null);

		return pelicula;
	}

}
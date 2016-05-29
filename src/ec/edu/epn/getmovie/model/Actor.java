package ec.edu.epn.getmovie.model;

import java.io.Serializable;
import javax.persistence.*;
import java.util.List;


/**
 * The persistent class for the ACTOR database table.
 * 
 */
@Entity
@NamedQuery(name="Actor.findAll", query="SELECT a FROM Actor a")
public class Actor implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int idactor;

	private String fotoactor;

	private String nombreactor;

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
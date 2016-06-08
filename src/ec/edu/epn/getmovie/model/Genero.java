package ec.edu.epn.getmovie.model;

import java.io.Serializable;
import javax.persistence.*;
import java.util.List;


/**
 * The persistent class for the GENERO database table.
 * 
 */
@Entity
@Table(name = "GENERO")
@NamedQuery(name="Genero.findById", query="SELECT g FROM Genero g WHERE g.idgenero LIKE ?")
public class Genero implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	//@Column(name="IDGENERO") 
	private int idgenero;	
	
	private String descripciongenero;

	private String nombregenero;

	//bi-directional many-to-one association to Pelicula
	@OneToMany(mappedBy="genero", fetch=FetchType.EAGER)
	private List<Pelicula> peliculas;

	public Genero() {
	}

	public int getIdgenero() {
		return this.idgenero;
	}

	public void setIdgenero(int idgenero) {
		this.idgenero = idgenero;
	}

	public String getDescripciongenero() {
		return this.descripciongenero;
	}

	public void setDescripciongenero(String descripciongenero) {
		this.descripciongenero = descripciongenero;
	}

	public String getNombregenero() {
		return this.nombregenero;
	}

	public void setNombregenero(String nombregenero) {
		this.nombregenero = nombregenero;
	}

	public List<Pelicula> getPeliculas() {
		return this.peliculas;
	}

	public void setPeliculas(List<Pelicula> peliculas) {
		this.peliculas = peliculas;
	}

	public Pelicula addPelicula(Pelicula pelicula) {
		getPeliculas().add(pelicula);
		pelicula.setGenero(this);

		return pelicula;
	}

	public Pelicula removePelicula(Pelicula pelicula) {
		getPeliculas().remove(pelicula);
		pelicula.setGenero(null);

		return pelicula;
	}

}
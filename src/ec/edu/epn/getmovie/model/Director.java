package ec.edu.epn.getmovie.model;

import java.io.Serializable;
import javax.persistence.*;
import java.util.List;


/**
 * The persistent class for the DIRECTOR database table.
 * 
 */
@Entity
@Table(name = "DIRECTOR")
@NamedQuery(name="Director.findByNombre", query="SELECT d FROM Director d where d.nombredirector like :nombre")
public class Director implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int iddirector;

	private String fotodirector;

	private String nombredirector;
	
	private String nacimiento;
	
	private String genero;

	//bi-directional many-to-one association to Pelicula
	@OneToMany(mappedBy="director", fetch=FetchType.EAGER)
	private List<Pelicula> peliculas;

	public Director() {
	}

	public int getIddirector() {
		return this.iddirector;
	}

	public void setIddirector(int iddirector) {
		this.iddirector = iddirector;
	}

	public String getFotodirector() {
		return this.fotodirector;
	}

	public void setFotodirector(String fotodirector) {
		this.fotodirector = fotodirector;
	}

	public String getNombredirector() {
		return this.nombredirector;
	}

	public void setNombredirector(String nombredirector) {
		this.nombredirector = nombredirector;
	}

	public String getNacimiento() {
		return nacimiento;
	}

	public void setNacimiento(String nacimiento) {
		this.nacimiento = nacimiento;
	}

	public String getGenero() {
		return genero;
	}

	public void setGenero(String genero) {
		this.genero = genero;
	}

	public List<Pelicula> getPeliculas() {
		return this.peliculas;
	}

	public void setPeliculas(List<Pelicula> peliculas) {
		this.peliculas = peliculas;
	}

	public Pelicula addPelicula(Pelicula pelicula) {
		getPeliculas().add(pelicula);
		pelicula.setDirector(this);

		return pelicula;
	}

	public Pelicula removePelicula(Pelicula pelicula) {
		getPeliculas().remove(pelicula);
		pelicula.setDirector(null);

		return pelicula;
	}

}
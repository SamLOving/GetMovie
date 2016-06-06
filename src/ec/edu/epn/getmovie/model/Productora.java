package ec.edu.epn.getmovie.model;

import java.io.Serializable;
import javax.persistence.*;
import java.util.List;


/**
 * The persistent class for the PRODUCTORA database table.
 * 
 */
@Entity
@Table(name = "PRODUCTORA")
@NamedQuery(name="Productora.findAll", query="SELECT p FROM Productora p")
public class Productora implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int idproductora;

	private String nombreproductora;

	//bi-directional many-to-one association to Pelicula
	@OneToMany(mappedBy="productora", fetch=FetchType.EAGER)
	private List<Pelicula> peliculas;

	public Productora() {
	}

	public int getIdproductora() {
		return this.idproductora;
	}

	public void setIdproductora(int idproductora) {
		this.idproductora = idproductora;
	}

	public String getNombreproductora() {
		return this.nombreproductora;
	}

	public void setNombreproductora(String nombreproductora) {
		this.nombreproductora = nombreproductora;
	}

	public List<Pelicula> getPeliculas() {
		return this.peliculas;
	}

	public void setPeliculas(List<Pelicula> peliculas) {
		this.peliculas = peliculas;
	}

	public Pelicula addPelicula(Pelicula pelicula) {
		getPeliculas().add(pelicula);
		pelicula.setProductora(this);

		return pelicula;
	}

	public Pelicula removePelicula(Pelicula pelicula) {
		getPeliculas().remove(pelicula);
		pelicula.setProductora(null);

		return pelicula;
	}

}
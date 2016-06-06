package ec.edu.epn.getmovie.model;

import java.io.Serializable;
import javax.persistence.*;
import java.util.List;


/**
 * The persistent class for the USUARIO database table.
 * 
 */
@Entity 
@Table(name = "USUARIO")
@NamedQuery(name="Usuario.findById", query="SELECT u FROM Usuario u where u.correousr like :correo")
public class Usuario implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	private String correousr;

	private String claveusr;

	private byte estadousr;

	private byte isadmin;

	private String nombreusr;

	//bi-directional many-to-one association to Pelicula
	@OneToMany(mappedBy="usuario", fetch=FetchType.EAGER)
	private List<Pelicula> peliculas;

	public Usuario() {
	}

	public String getCorreousr() {
		return this.correousr;
	}

	public void setCorreousr(String correousr) {
		this.correousr = correousr;
	}

	public String getClaveusr() {
		return this.claveusr;
	}

	public void setClaveusr(String claveusr) {
		this.claveusr = claveusr;
	}

	public byte getEstadousr() {
		return this.estadousr;
	}

	public void setEstadousr(byte estadousr) {
		this.estadousr = estadousr;
	}

	public byte getIsadmin() {
		return this.isadmin;
	}

	public void setIsadmin(byte isadmin) {
		this.isadmin = isadmin;
	}

	public String getNombreusr() {
		return this.nombreusr;
	}

	public void setNombreusr(String nombreusr) {
		this.nombreusr = nombreusr;
	}

	public List<Pelicula> getPeliculas() {
		return this.peliculas;
	}

	public void setPeliculas(List<Pelicula> peliculas) {
		this.peliculas = peliculas;
	}

	public Pelicula addPelicula(Pelicula pelicula) {
		getPeliculas().add(pelicula);
		pelicula.setUsuario(this);

		return pelicula;
	}

	public Pelicula removePelicula(Pelicula pelicula) {
		getPeliculas().remove(pelicula);
		pelicula.setUsuario(null);

		return pelicula;
	}

}
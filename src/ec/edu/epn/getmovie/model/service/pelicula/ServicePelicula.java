package ec.edu.epn.getmovie.model.service.pelicula;

import java.util.Collection;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.persistence.Query;

import ec.edu.epn.getmovie.model.Pelicula;

public class ServicePelicula {
	private EntityManagerFactory emf = Persistence.createEntityManagerFactory("GetMovieJPA");
	
	public int crearPelicula (Pelicula p) {
		EntityManager em = emf.createEntityManager();
		em.getTransaction().begin();
		em.persist(p);
		em.getTransaction().commit();
		em.close();
		
		return p.getIdpelicula();
	}
	
	public Pelicula buscarPelicula(int id) {
		EntityManager em = emf.createEntityManager();
		em.getTransaction().begin();
		Pelicula p = em.find(Pelicula.class, id);
		em.getTransaction().commit();
		em.close();

		return p;
	}

	@SuppressWarnings("unchecked")
	public Collection<Pelicula> listarPelicula(String nombrePelicula) {
		EntityManager em = emf.createEntityManager();
		Query q = em.createNamedQuery("Pelicula.findByNombre");
		q.setParameter("nombrepelicula", "%" + nombrePelicula + "%");
		Collection<Pelicula> listaPelicula = q.getResultList();
		em.close();
		
		return listaPelicula;
	}

	public void eliminarPelicula (int id) {
		EntityManager em = emf.createEntityManager();

		Pelicula p = em.getReference(Pelicula.class, id);
		em.getTransaction().begin();
		em.remove(p);
		em.getTransaction().commit();
		em.close();
	}
	
	public void modificarPelicula (Pelicula peliculaModificar) {
		EntityManager em = emf.createEntityManager();
		Pelicula p = em.getReference(Pelicula.class, peliculaModificar.getIdpelicula());
		p.setActor(peliculaModificar.getActor());
		p.setDirector(peliculaModificar.getDirector());
		p.setFotopelicula(peliculaModificar.getFotopelicula());
		p.setGenero(peliculaModificar.getGenero());
		p.setLanzamientopelicula(peliculaModificar.getLanzamientopelicula());
		p.setNombrepelicula(peliculaModificar.getNombrepelicula());
		p.setProductora(peliculaModificar.getProductora());
		p.setSinopsispelicula(peliculaModificar.getSinopsispelicula());
		
		em.getTransaction().begin();
		em.persist(p);
		em.getTransaction().commit();
		em.close();
	}
}

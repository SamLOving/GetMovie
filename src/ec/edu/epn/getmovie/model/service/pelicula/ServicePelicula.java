package ec.edu.epn.getmovie.model.service.pelicula;

import java.util.ArrayList;
import java.util.Collection;
import java.util.Iterator;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.persistence.Query;

import ec.edu.epn.getmovie.model.Actor;
import ec.edu.epn.getmovie.model.Director;
import ec.edu.epn.getmovie.model.Genero;
import ec.edu.epn.getmovie.model.Pelicula;
import ec.edu.epn.getmovie.model.Productora;
import ec.edu.epn.getmovie.model.service.actor.ServiceActor;
import ec.edu.epn.getmovie.model.service.director.ServiceDirector;
import ec.edu.epn.getmovie.service.genero.ServiceGenero;
import ec.edu.epn.getmovie.service.productora.ServiceProductora;

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
	public List<Pelicula> listarPelicula(String nombre, String findBy) {
		EntityManager em = emf.createEntityManager();
		Query q = null;
		List<Pelicula> listaPelicula = new ArrayList<Pelicula>();
		
		if ("1".equals(findBy)) {
			ServiceActor sa = new ServiceActor();
			Collection<Actor> listaActor = sa.listarActor(nombre);
			Collection<Pelicula> listaPeliculaByActor = null;
			
			for (Actor a : listaActor) {
				q = em.createNamedQuery("Pelicula.findByActor");
				q.setParameter("actor", a);
				listaPeliculaByActor = q.getResultList();
				listaPelicula.addAll(listaPeliculaByActor);
			}
		} else if ("2".equals(findBy)) {
			ServiceDirector sd = new ServiceDirector();
			Collection<Director> listaDirector = sd.listarDirector(nombre);
			Collection<Pelicula> listaPeliculaByDirector = null;
			
			for (Director d : listaDirector) {
				q = em.createNamedQuery("Pelicula.findByDirector");
				q.setParameter("director", d);
				listaPeliculaByDirector = q.getResultList();
				listaPelicula.addAll(listaPeliculaByDirector);
			}
		} else if ("3".equals(findBy)) {
			ServiceGenero sg = new ServiceGenero();
			Collection<Genero> listaGenero = sg.listarGenero(nombre);
			Collection<Pelicula> listaPeliculaByGenero = null;
			
			for (Genero g : listaGenero) {
				q = em.createNamedQuery("Pelicula.findByGenero");
				q.setParameter("genero", g);
				listaPeliculaByGenero = q.getResultList();
				listaPelicula.addAll(listaPeliculaByGenero);
			}
		} else if ("4".equals(findBy)) {
			ServiceProductora sp = new ServiceProductora();
			Collection<Productora> listaProductora = sp.listarProductora(nombre);
			Collection<Pelicula> listaPeliculaByProductora = null;
			
			for (Productora p : listaProductora) {
				q = em.createNamedQuery("Pelicula.findByProductora");
				q.setParameter("productora", p);
				listaPeliculaByProductora = q.getResultList();
				listaPelicula.addAll(listaPeliculaByProductora);
			}
		} else {
			q = em.createNamedQuery("Pelicula.findByNombre");
			q.setParameter("nombrepelicula", "%" + nombre + "%");
			listaPelicula = q.getResultList();
		}
		
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
	
	public Collection<Pelicula> listarRecomendacion (Collection<Pelicula> listaPelicula) {
		List<Pelicula> listaAux = (List<Pelicula>) listaPelicula;
		
		int indexAnterior = 0;
		for (int i=1; i< listaAux.size(); i++) {
			Pelicula pActual = listaAux.get(i);
			indexAnterior = i - 1;
			while ((indexAnterior >= 0) 
					&& (pActual.getRatingpelicula().doubleValue() 
							> listaAux.get(indexAnterior).getRatingpelicula().doubleValue())){
				listaAux.set(indexAnterior + 1, listaAux.get(indexAnterior));
				indexAnterior --;
			}
			listaAux.set(indexAnterior + 1, pActual);
		}
		
		return listaAux;
	}
	
	public void puntuarPelicula (Pelicula pelicula) {
		EntityManager em = emf.createEntityManager();
		Pelicula p = em.getReference(Pelicula.class, pelicula.getIdpelicula());
		p.setRatingpelicula(pelicula.getRatingpelicula());
		
		em.getTransaction().begin();
		em.persist(p);
		em.getTransaction().commit();
		em.close();
	}
	
	public void modificarPelicula (Pelicula peliculaModificar) {
		EntityManager em = emf.createEntityManager();
		Pelicula p = em.getReference(Pelicula.class, peliculaModificar.getIdpelicula());
		p.setActor(peliculaModificar.getActor());
		p.setDirector(peliculaModificar.getDirector());
		p.setGenero(peliculaModificar.getGenero());
		p.setLanzamientopelicula(peliculaModificar.getLanzamientopelicula());
		p.setNombrepelicula(peliculaModificar.getNombrepelicula());
		p.setProductora(peliculaModificar.getProductora());
		p.setSinopsispelicula(peliculaModificar.getSinopsispelicula());
		
		if (!"subirFoto".equals(peliculaModificar.getFotopelicula())){
			p.setFotopelicula(peliculaModificar.getFotopelicula());
		}
		
		em.getTransaction().begin();
		em.persist(p);
		em.getTransaction().commit();
		em.close();
	}
}

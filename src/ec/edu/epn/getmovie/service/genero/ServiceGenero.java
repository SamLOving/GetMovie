package ec.edu.epn.getmovie.service.genero;

import java.util.Collection;



import javax.persistence.Query;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

import ec.edu.epn.getmovie.model.Genero;


public class ServiceGenero {

	//definir la persistencia, en una variable para instanciar 
	//GetMovieJPA es el nombre en la persistencia
	
	private EntityManagerFactory emf = Persistence.createEntityManagerFactory("GetMovieJPA");
	
	public void crearGenero(Genero genero) {
		//entityManager permite usar el crud (crear consultar eliminar)
		EntityManager em = emf.createEntityManager();
		
		// permite iniciar la query
		em.getTransaction().begin();
		//permite hacer la creacion del objeto, persist = insert
		em.persist(genero);
		// una query se asegura de que se realice, se hizo o no
		em.getTransaction().commit();
		// siempre se cierra el entitymanager
		em.close();
	}
	
	public void eliminarGenero (int idgenero){
		EntityManager em = emf.createEntityManager();
		Genero genero = em.getReference(Genero.class, idgenero);
		em.getTransaction().begin();
		em.remove(genero);
		em.getTransaction().commit();
		em.close();
	}
	
	public void modificarGenero (int idgenero){
		EntityManager em = emf.createEntityManager();
		Genero genero = em.getReference(Genero.class, idgenero);
		
		// permite iniciar la query
		em.getTransaction().begin();
		//permite hacer la creacion del objeto, persist = insert
		em.persist(genero);
		// una query se asegura de que se realice, se hizo o no
		em.getTransaction().commit();
		// siempre se cierra el entitymanager
		em.close();
	}
	
	public Genero buscarGenero (int idgenero){
		EntityManager em = emf.createEntityManager();
		em.getTransaction().begin();
		Genero genero = em.getReference(Genero.class, idgenero);
		
		em.getTransaction().commit();
		em.close();
		return genero;
	}
	
	@SuppressWarnings("unchecked")
	public Collection<Genero> listarGenero (int idgenero){
		EntityManager em = emf.createEntityManager();
		Query q = em.createNamedQuery("Genero.findById");
		q.setParameter("idgenero", "%"+idgenero+"%");
		Collection<Genero> listagenero = q.getResultList();
		em.close();
		return listagenero;
	}

}

package ec.edu.epn.getmovie.service.productora;

import java.util.Collection;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.persistence.Query;

import ec.edu.epn.getmovie.model.Productora;

public class ServiceProductora {
	private EntityManagerFactory emf = Persistence.createEntityManagerFactory("GetMovieJPA");
	
	public void crearProductora(Productora productora) {
		//entityManager permite usar el crud (crear consultar eliminar)
		EntityManager em = emf.createEntityManager();
		
		// permite iniciar la query
		em.getTransaction().begin();
		//permite hacer la creacion del objeto, persist = insert
		em.persist(productora);
		// una query se asegura de que se realice, se hizo o no
		em.getTransaction().commit();
		// siempre se cierra el entitymanager
		em.close();
	}

	public void eliminarProductora (int idproductora){
		EntityManager em = emf.createEntityManager();
		Productora productora = em.getReference(Productora.class, idproductora);
		em.getTransaction().begin();
		em.remove(productora);
		em.getTransaction().commit();
		em.close();
	}
	
	public void modificarProductora (Productora nuevaProductora){
		EntityManager em = emf.createEntityManager();
		Productora productora = em.getReference(Productora.class, nuevaProductora.getIdproductora());
		
		productora.setNombreproductora(nuevaProductora.getNombreproductora());
		productora.setPaisproductora(nuevaProductora.getPaisproductora());
		
		// permite iniciar la query
		em.getTransaction().begin();
		//permite hacer la creacion del objeto, persist = insert
		em.persist(productora);
		// una query se asegura de que se realice, se hizo o no
		em.getTransaction().commit();
		// siempre se cierra el entitymanager
		em.close();
	}
	
	public Productora buscarProductora (int idproductora){
		EntityManager em = emf.createEntityManager();
		em.getTransaction().begin();
		Productora productora = em.find(Productora.class, idproductora);
		
		em.getTransaction().commit();
		em.close();
		return productora;
	}
	
	@SuppressWarnings("unchecked")
	public Collection<Productora> listarProductora (String nombreproductora){
		EntityManager em = emf.createEntityManager();
		Query q = em.createNamedQuery("Productora.findByNombre");
		q.setParameter("nombreProductoraABuscarQuery", "%"+nombreproductora+"%");
		Collection<Productora> listaproductora = q.getResultList();
		em.close();
		return listaproductora;
	}
}

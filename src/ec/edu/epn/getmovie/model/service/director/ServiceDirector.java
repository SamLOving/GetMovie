package ec.edu.epn.getmovie.model.service.director;
import java.util.Collection;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.persistence.Query;
import ec.edu.epn.getmovie.model.Director;
public class ServiceDirector {
	private EntityManagerFactory emf = Persistence.createEntityManagerFactory("GetMovieJPA");
	public Director buscarDirector(int idDirector) {
		EntityManager em = emf.createEntityManager();
		em.getTransaction().begin();
		Director director = em.find(Director.class, idDirector);
		em.getTransaction().commit();
		em.close();
		return director;
	}
	public void crearDirector(Director director) {
		EntityManager em = emf.createEntityManager();
		em.getTransaction().begin();
		em.persist(director);
		em.getTransaction().commit();
		em.close();
	}
	@SuppressWarnings("unchecked")
	public Collection<Director> listarDirector(int idDirector) {
		EntityManager em = emf.createEntityManager();
		Query q = em.createNamedQuery("Director.findById");
		q.setParameter("correo", "%" + idDirector + "%");
		Collection<Director> listaDirector = q.getResultList();
		em.close();	
		return listaDirector;
	}
	public void eliminarDirector(int idDirector) {
		EntityManager em = emf.createEntityManager();
		Director director = em.getReference(Director.class, idDirector);
		em.remove(director);
		em.close();
	}
	public void modificarDirector(int idDirector){
		
	}
}

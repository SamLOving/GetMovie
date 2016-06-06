package ec.edu.epn.getmovie.model.service.actor;
import java.util.Collection;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.persistence.Query;
import ec.edu.epn.getmovie.model.Actor;
public class ServiceActor {
	private EntityManagerFactory emf = Persistence.createEntityManagerFactory("GetMovieJPA");
	public Actor buscarActor(int idActor) {
		EntityManager em = emf.createEntityManager();
		em.getTransaction().begin();
		Actor actor = em.find(Actor.class, idActor);
		em.getTransaction().commit();
		em.close();
		return actor;
	}
	public void crearActor(Actor actor) {
		EntityManager em = emf.createEntityManager();
		em.getTransaction().begin();
		em.persist(actor);
		em.getTransaction().commit();
		em.close();
	}
	@SuppressWarnings("unchecked")
	public Collection<Actor> listarActor(int idActor) {
		EntityManager em = emf.createEntityManager();
		Query q = em.createNamedQuery("Actor.findById");
		q.setParameter("correo", "%" + idActor + "%");
		Collection<Actor> listaActor = q.getResultList();
		em.close();	
		return listaActor;
	}
	public void eliminarActor(int idActor) {
		EntityManager em = emf.createEntityManager();
		Actor actor = em.getReference(Actor.class, idActor);
		em.remove(actor);
		em.close();
	}
	public void modificarActor(int idActor){
		
	}
}

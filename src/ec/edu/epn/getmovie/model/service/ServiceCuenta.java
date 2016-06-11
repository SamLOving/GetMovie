package ec.edu.epn.getmovie.model.service;

import java.util.Collection;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.persistence.Query;

import ec.edu.epn.getmovie.model.Usuario;

public class ServiceCuenta {
	private EntityManagerFactory emf = Persistence.createEntityManagerFactory("GetMovieJPA");
	
	public void crearUsuario(Usuario usuario) {
		EntityManager em = emf.createEntityManager();
		em.getTransaction().begin();
		em.persist(usuario);
		em.getTransaction().commit();
		em.close();
	}

	public Usuario buscarUsuario(String email) {
		EntityManager em = emf.createEntityManager();
		em.getTransaction().begin();
		Usuario u = em.find(Usuario.class, email);
		em.getTransaction().commit();
		em.close();

		return u;
	}

	public boolean loggingUsuario(String email, String clave) {
		Usuario usuario = buscarUsuario(email);

		if (usuario == null) {
			return false;
		} else if (clave.equals(usuario.getClaveusr())) {
			return true;
		} else {
			return false;
		}
	}

	@SuppressWarnings("unchecked")
	public Collection<Usuario> listarUsuario(String email) {
		EntityManager em = emf.createEntityManager();
		Query q = em.createNamedQuery("Usuario.findById");
		q.setParameter("correo", "%" + email + "%");
		Collection<Usuario> listaUsuario = q.getResultList();
		em.close();
		
		return listaUsuario;
	}

	public void eliminarUsuario(String email) {
		EntityManager em = emf.createEntityManager();

		Usuario u = em.getReference(Usuario.class, email);
		em.getTransaction().begin();
		em.remove(u);
		em.getTransaction().commit();
		em.close();
	}
	
	public void modificarUsuario(Usuario usuarioModificar) {
		EntityManager em = emf.createEntityManager();
		Usuario u = em.getReference(Usuario.class, usuarioModificar.getCorreousr());
		u.setNombreusr(usuarioModificar.getNombreusr());
		u.setClaveusr(usuarioModificar.getClaveusr());
		
		em.getTransaction().begin();
		em.persist(u);
		em.getTransaction().commit();
		em.close();
	}
}

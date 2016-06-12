package ec.edu.epn.getmovie.controller.pelicula;

import java.io.IOException;
import java.util.Collection;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import ec.edu.epn.getmovie.model.Actor;
import ec.edu.epn.getmovie.model.Director;
import ec.edu.epn.getmovie.model.Genero;
import ec.edu.epn.getmovie.model.Pelicula;
import ec.edu.epn.getmovie.model.Productora;
import ec.edu.epn.getmovie.model.Usuario;
import ec.edu.epn.getmovie.model.service.actor.ServiceActor;
import ec.edu.epn.getmovie.model.service.director.ServiceDirector;
import ec.edu.epn.getmovie.model.service.pelicula.ServicePelicula;
import ec.edu.epn.getmovie.service.genero.ServiceGenero;
import ec.edu.epn.getmovie.service.productora.ServiceProductora;

/**
 * Servlet implementation class ModificarPelicula
 */
@WebServlet("/pelicula/modificar")
public class ModificarPelicula extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ModificarPelicula() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		Usuario usr = (Usuario) request.getSession().getAttribute("usuarioActivo");

		if (usr == null || usr.getEstadousr() == 0) {
			getServletConfig().getServletContext().getRequestDispatcher("/home").forward(request, response);
		} else {
			ServiceActor sa = new ServiceActor();
			ServiceDirector sd = new ServiceDirector();
			ServiceGenero sg = new ServiceGenero();
			ServiceProductora spr = new ServiceProductora();

			Collection<Actor> listaActor = sa.listarActor("");
			Collection<Director> listaDirector = sd.listarDirector("");
			Collection<Genero> listaGenero = sg.listarGenero("");
			Collection<Productora> listaProductora = spr.listarProductora("");

			request.setAttribute("listaActor", listaActor);
			request.setAttribute("listaDirector", listaDirector);
			request.setAttribute("listaGenero", listaGenero);
			request.setAttribute("listaProductora", listaProductora);
			
			ServicePelicula sp = new ServicePelicula();
			String peliculaModificar = (String) request.getParameter("peliculaModificar");
			
			int idPelicula = 0;
			if (peliculaModificar != null)
				idPelicula = Integer.parseInt(peliculaModificar);
			
			Pelicula pModificar = sp.buscarPelicula(idPelicula);
			
			request.setAttribute("pModificar", pModificar);
			
			getServletConfig().getServletContext().getRequestDispatcher("/vistas/pelicula/modificar.jsp")
					.forward(request, response);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}

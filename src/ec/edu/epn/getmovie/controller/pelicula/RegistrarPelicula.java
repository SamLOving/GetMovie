package ec.edu.epn.getmovie.controller.pelicula;

import java.io.IOException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Collection;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import ec.edu.epn.getmovie.complementos.Imagen;
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
import javafx.util.converter.DateStringConverter;

/**
 * Servlet implementation class RegistrarPelicula
 */
@WebServlet("/pelicula/registrar")
@MultipartConfig
public class RegistrarPelicula extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public RegistrarPelicula() {
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
			ServiceProductora sp = new ServiceProductora();

			Collection<Actor> listaActor = sa.listarActor("");
			Collection<Director> listaDirector = sd.listarDirector("");
			Collection<Genero> listaGenero = sg.listarGenero("");
			Collection<Productora> listaProductora = sp.listarProductora("");

			request.setAttribute("listaActor", listaActor);
			request.setAttribute("listaDirector", listaDirector);
			request.setAttribute("listaGenero", listaGenero);
			request.setAttribute("listaProductora", listaProductora);

			getServletConfig().getServletContext().getRequestDispatcher("/vistas/pelicula/registrar.jsp")
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
		Usuario usr = (Usuario) request.getSession().getAttribute("usuarioActivo");

		if (usr == null || usr.getEstadousr() == 0) {
			getServletConfig().getServletContext().getRequestDispatcher("/home").forward(request, response);
		} else {
			String nombre = (String) request.getParameter("nombre");
			String generoString = (String) request.getParameter("genero");
			String anio = (String) request.getParameter("anio");
			String actorString = (String) request.getParameter("actor");
			String directorString = (String) request.getParameter("director");
			String productoraString = (String) request.getParameter("productora");
			String sinopsis = (String) request.getParameter("sinopsis");

			if (nombre == null || generoString == null || anio == null || actorString == null
					|| directorString == null || productoraString == null || sinopsis == null) {
				System.out.println("datos vacíos");
				doGet(request, response);
			} else {
				try {
					ServicePelicula sp = new ServicePelicula();
					ServiceProductora spr = new ServiceProductora();
					ServiceActor sa = new ServiceActor();
					ServiceDirector sd = new ServiceDirector();
					ServiceGenero sg = new ServiceGenero();
					
					Pelicula pelicula = new Pelicula();
					Productora productora = spr.buscarProductora(Integer.parseInt(productoraString));
					Genero genero = sg.buscarGenero(Integer.parseInt(generoString));
					Actor actor = sa.buscarActor(Integer.parseInt(actorString));
					Director director = sd.buscarDirector(Integer.parseInt(directorString));

					java.math.BigDecimal rating = new java.math.BigDecimal(String.valueOf(0));
					DateFormat format = new SimpleDateFormat();
					
					pelicula.setFotopelicula("subirFoto");
					pelicula.setNombrepelicula(nombre);
					pelicula.setGenero(genero);
					pelicula.setProductora(productora);
					pelicula.setLanzamientopelicula(anio);
					pelicula.setActor(actor);
					pelicula.setDirector(director);
					pelicula.setSinopsispelicula(sinopsis);
					pelicula.setRatingpelicula(rating);
					pelicula.setUsuario(usr);
					
					int id = sp.crearPelicula(pelicula);

					//Insertar Imagen 
					Imagen img = new Imagen();
					img.crearDirectorio(id);
					String pathPortada = img.subirImagen(request, "inputFile", id);
					if (pathPortada != null) {
						pelicula.setFotopelicula(pathPortada);
						sp.modificarPelicula(pelicula);
					} else {
						doGet(request, response);
					}
					getServletConfig().getServletContext().getRequestDispatcher("/pelicula/home").forward(request,
							response);
				} catch (Exception e) {
					e.printStackTrace();
					ServiceActor sa = new ServiceActor();
					ServiceDirector sd = new ServiceDirector();
					ServiceGenero sg = new ServiceGenero();
					ServiceProductora sp = new ServiceProductora();

					Collection<Actor> listaActor = sa.listarActor("");
					Collection<Director> listaDirector = sd.listarDirector("");
					Collection<Genero> listaGenero = sg.listarGenero("");
					Collection<Productora> listaProductora = sp.listarProductora("");

					request.setAttribute("listaActor", listaActor);
					request.setAttribute("listaDirector", listaDirector);
					request.setAttribute("listaGenero", listaGenero);
					request.setAttribute("listaProductora", listaProductora);

					getServletConfig().getServletContext().getRequestDispatcher("/vistas/pelicula/registrar.jsp")
							.forward(request, response);
				}
			}
		}
	}


}

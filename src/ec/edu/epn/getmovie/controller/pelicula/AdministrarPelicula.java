package ec.edu.epn.getmovie.controller.pelicula;

import java.io.IOException;
import java.util.Collection;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import ec.edu.epn.getmovie.model.Pelicula;
import ec.edu.epn.getmovie.model.Usuario;
import ec.edu.epn.getmovie.model.service.pelicula.*;

/**
 * Servlet implementation class AdministrarPelicula
 */
@WebServlet("/pelicula/administrar")
public class AdministrarPelicula extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdministrarPelicula() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		Usuario usr = (Usuario) request.getSession().getAttribute("usuarioActivo");

		if (usr == null) {
			getServletConfig().getServletContext().getRequestDispatcher("/home").forward(request, response);
		} else {	
			getServletConfig().getServletContext().getRequestDispatcher("/vistas/pelicula/administrar.jsp")
					.forward(request, response);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		Usuario usr = (Usuario) request.getSession().getAttribute("usuarioActivo");

		if (usr == null) {
			getServletConfig().getServletContext().getRequestDispatcher("/home").forward(request, response);
		} else {
			ServicePelicula sp = new ServicePelicula();
			String nombre = request.getParameter("nombre");
			String findBy = request.getParameter("findBy");
			
			if (nombre == null)
				nombre = "";
			if (findBy == null)
				nombre = "";
			
			Collection<Pelicula> listaPelicula = sp.listarPelicula(nombre, findBy);
			request.setAttribute("listaPelicula", listaPelicula);
			
			request.setAttribute("findBy", findBy);
			request.setAttribute("nombre", nombre);
			
			getServletConfig().getServletContext().getRequestDispatcher("/vistas/pelicula/administrar.jsp")
					.forward(request, response);
		}
	}

}

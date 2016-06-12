package ec.edu.epn.getmovie.controller.pelicula;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import ec.edu.epn.getmovie.complementos.Imagen;
import ec.edu.epn.getmovie.model.Usuario;
import ec.edu.epn.getmovie.model.service.pelicula.ServicePelicula;

/**
 * Servlet implementation class EliminarPelicula
 */
@WebServlet("/pelicula/eliminar")
public class EliminarPelicula extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EliminarPelicula() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPost(request, response);
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
			String peliculaEliminar = (String) request.getParameter("peliculaEliminar");
			
			int idPelicula = 0;
			if (peliculaEliminar != null)
				idPelicula = Integer.parseInt(peliculaEliminar);
				
			sp.eliminarPelicula(idPelicula);
			Imagen img = new Imagen();
			img.eliminarDirectorio(idPelicula, true);
			getServletConfig().getServletContext().getRequestDispatcher("/pelicula/administrar").forward(request,
					response);
		}
	}

}

package ec.edu.epn.getmovie.controller.pelicula;

import java.io.IOException;
import java.util.Collection;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import ec.edu.epn.getmovie.complementos.Imagen;
import ec.edu.epn.getmovie.model.Pelicula;
import ec.edu.epn.getmovie.model.Usuario;
import ec.edu.epn.getmovie.model.service.pelicula.ServicePelicula;

/**
 * Servlet implementation class InfoPelicula
 */
@WebServlet("/pelicula/info")
public class InfoPelicula extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InfoPelicula() {
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
			String peliculaInfo = (String) request.getParameter("peliculaInfo");
			String pInfo = (String) request.getParameter("pInfo");
			
			int idPelicula = 0;
			if (peliculaInfo != null){
				idPelicula = Integer.parseInt(peliculaInfo);
				Pelicula pelicula = sp.buscarPelicula(idPelicula);
				request.setAttribute("pelicula", pelicula);
				getServletConfig().getServletContext().getRequestDispatcher("/vistas/pelicula/info.jsp").forward(request,
						response);
			}
			else if (pInfo != null) {
				try {
				System.out.println(pInfo);
				idPelicula = Integer.parseInt(pInfo);
				Collection<Pelicula> listaPelicula = (Collection<Pelicula>) request.getSession().getAttribute("listaPelicula");
				List<Pelicula> listaP = (List<Pelicula>) listaPelicula;
				Pelicula pelicula = listaP.get(idPelicula);
				request.setAttribute("pelicula", pelicula);
				getServletConfig().getServletContext().getRequestDispatcher("/vistas/pelicula/info.jsp").forward(request,
						response);
				} catch (Exception e) {
					getServletConfig().getServletContext().getRequestDispatcher("/home").forward(request,
							response);
				}
			} else {
				getServletConfig().getServletContext().getRequestDispatcher("/home").forward(request,
					response);
			}
		}
	}

}

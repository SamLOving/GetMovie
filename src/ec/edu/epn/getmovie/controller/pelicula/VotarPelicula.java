package ec.edu.epn.getmovie.controller.pelicula;

import java.io.IOException;
import java.math.BigDecimal;
import java.util.Collection;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import ec.edu.epn.getmovie.model.Pelicula;
import ec.edu.epn.getmovie.model.Usuario;
import ec.edu.epn.getmovie.model.service.pelicula.ServicePelicula;

/**
 * Servlet implementation class VotarPelicula
 */
@WebServlet("pelicula/Votacion")
public class VotarPelicula extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public VotarPelicula() {
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
			ServicePelicula sp = new ServicePelicula();
			String peliculaInfo = (String) request.getParameter("peliculaInfo").trim();
			String votacion = request.getParameter("votacion").trim();
			
			int idPelicula = 0;
			double voto = 0;
			if (peliculaInfo != null && votacion != null){
				try {
					java.math.BigDecimal rating = new java.math.BigDecimal(String.valueOf(0));
			        voto = Double.parseDouble(votacion);
			   				
					System.out.println(peliculaInfo);
					idPelicula = Integer.parseInt(peliculaInfo);
					Collection<Pelicula> listaPelicula = (Collection<Pelicula>) request.getSession().getAttribute("listaPelicula");
					List<Pelicula> listaP = (List<Pelicula>) listaPelicula;
					Pelicula pelicula = listaP.get(idPelicula);

					if (pelicula.getRatingpelicula().doubleValue() == 0) {
						rating = BigDecimal.valueOf(voto);
					} else {
						double promedio = (rating.doubleValue() + voto) / 2;
						rating = BigDecimal.valueOf(promedio);
					}
					
					pelicula.setRatingpelicula(rating);
					sp.puntuarPelicula(pelicula);
					
					response.setContentType("text/plain");
			        response.getWriter().write("Rating acutal: " + rating);	
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

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}

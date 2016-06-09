package ec.edu.epn.getmovie.controller.genero;

import java.io.IOException;
import java.util.Collection;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import ec.edu.epn.getmovie.model.Actor;
import ec.edu.epn.getmovie.model.Genero;
import ec.edu.epn.getmovie.model.Usuario;
import ec.edu.epn.getmovie.model.service.actor.ServiceActor;
import ec.edu.epn.getmovie.service.genero.ServiceGenero;
import sun.reflect.ReflectionFactory.GetReflectionFactoryAction;

/**
 * Servlet implementation class AdministrarGenero
 */
@WebServlet("/genero/administrar")
public class AdministrarGenero extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdministrarGenero() {
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
			ServiceGenero sg = new ServiceGenero();
			String nombreGenero = request.getParameter("nombreGeneroDesdeVistaParaBuscar");
			if (nombreGenero == null)
				nombreGenero = "";
			
			Collection<Genero> listaGeneros = sg.listarGenero(nombreGenero);
			request.setAttribute("listaGenerosParaLaVista", listaGeneros);
			getServletConfig().getServletContext().getRequestDispatcher("/vistas/genero/AdministrarGenero.jsp")
					.forward(request, response);
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

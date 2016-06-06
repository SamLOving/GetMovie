package ec.edu.epn.getmovie.controller.actor;

import java.io.IOException;
import java.util.Collection;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import ec.edu.epn.getmovie.model.Actor;
import ec.edu.epn.getmovie.model.Usuario;
import ec.edu.epn.getmovie.model.service.ServiceCuenta;
import ec.edu.epn.getmovie.model.service.actor.ServiceActor;

/**
 * Servlet implementation class AdministrarActor
 */
@WebServlet("/actor/administrar")
public class AdministrarActor extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdministrarActor() {
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
			ServiceActor sa = new ServiceActor();
			String idActor = request.getParameter("idActor");
			if (idActor == null)
				idActor = "";
			Collection<Actor> listaActor = sa.listarActor(Integer.parseInt(idActor));
			request.setAttribute("listaActores", listaActor);
			getServletConfig().getServletContext().getRequestDispatcher("/vistas/actor/administrar.jsp")
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

package ec.edu.epn.getmovie.controller.actor;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import ec.edu.epn.getmovie.model.Actor;
import ec.edu.epn.getmovie.model.Director;
import ec.edu.epn.getmovie.model.Usuario;
import ec.edu.epn.getmovie.model.service.actor.ServiceActor;
import ec.edu.epn.getmovie.model.service.director.ServiceDirector;

/**
 * Servlet implementation class ModificarActor
 */
@WebServlet("/actor/modificar")
public class ModificarActor extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ModificarActor() {
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
			String idActor = (String) request.getParameter("actorModificar");
			Actor actorModificar = sa.buscarActor((int)Integer.parseInt(idActor));
			request.setAttribute("actorModifica", actorModificar);
			getServletConfig().getServletContext().getRequestDispatcher("/vistas/actor/modificar.jsp").forward(request,
					response);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String nombre = request.getParameter("nombre");
		String fecha = request.getParameter("fecha");
		String genero = request.getParameter("genero");
		String idActor = request.getParameter("idActor");
		String oscars = request.getParameter("oscars");
		if(nombre==null&&fecha==null&&genero==null&&oscars==null){
			getServletConfig().getServletContext().getRequestDispatcher("/home")
				.forward(request, response);
		}
		Actor a = new Actor();
		ServiceActor sa = new ServiceActor();
		a.setNombreactor(nombre);
		a.setGenero(genero);
		a.setNacimiento(fecha);
		a.setOscars(Integer.parseInt(oscars));
		a.setIdactor(Integer.parseInt(idActor));
		sa.modificarActor(a);
		getServletConfig().getServletContext().getRequestDispatcher("/actor/home")
			.forward(request, response);
	}
}

package ec.edu.epn.getmovie.controller.actor;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import ec.edu.epn.getmovie.model.Actor;
import ec.edu.epn.getmovie.model.Usuario;
import ec.edu.epn.getmovie.model.service.actor.ServiceActor;

/**
 * Servlet implementation class RegistrarActor
 */
@WebServlet("/actor/registrar")
public class RegistrarActor extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RegistrarActor() {
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
			getServletConfig().getServletContext().getRequestDispatcher("/vistas/actor/registrar.jsp").forward(request, response);
			doPost(request, response);
		}
	}
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
			String nombre = request.getParameter("nombre");
			String fecha  = request.getParameter("fecha");
			String genero = request.getParameter("genero");
			String oscars = request.getParameter("oscars");
			if(nombre==null&&fecha==null&&genero==null&&oscars==null){
				getServletConfig().getServletContext().getRequestDispatcher("/actor/registrar")
					.forward(request, response);
			}
			else{
				ServiceActor sa = new ServiceActor();
				Actor actor = new Actor();
				actor.setNombreactor(nombre);
				actor.setGenero(genero);
				actor.setOscars(Integer.parseInt(oscars));
				actor.setNacimiento(fecha);
				sa.crearActor(actor);
				getServletConfig().getServletContext().getRequestDispatcher("/actor/home")
					.forward(request, response);
		}
	}
}

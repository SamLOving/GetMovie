package ec.edu.epn.getmovie.controller.director;

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
 * Servlet implementation class ModificarDirector
 */
@WebServlet("/director/modificar")
public class ModificarDirector extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ModificarDirector() {
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
			ServiceDirector sd = new ServiceDirector();
			String idDirector = (String) request.getParameter("directorModificar");
			Director directorModificar = sd.buscarDirector((int)Integer.parseInt(idDirector));
			request.setAttribute("directorModifica", directorModificar);
			getServletConfig().getServletContext().getRequestDispatcher("/vistas/director/modificar.jsp").forward(request,
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
		String fotoDirector = request.getParameter("fotoDirector");
		if(nombre==null&&fecha==null&&genero==null){
			getServletConfig().getServletContext().getRequestDispatcher("/home")
				.forward(request, response);
		}
		Director d = new Director();
		ServiceDirector sd = new ServiceDirector();
		d.setNombredirector(nombre);
		d.setFotodirector("");
		d.setGenero(genero);
		d.setNacimiento(fecha);
		sd.modificarDirector(d);
		getServletConfig().getServletContext().getRequestDispatcher("/home")
			.forward(request, response);

	}

}

package ec.edu.epn.getmovie.controller.director;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sun.media.sound.DirectAudioDeviceProvider;

import ec.edu.epn.getmovie.model.Director;
import ec.edu.epn.getmovie.model.Usuario;
import ec.edu.epn.getmovie.model.service.director.ServiceDirector;

/**
 * Servlet implementation class RegistrarDirector
 */
@WebServlet("/director/registrar")
public class RegistrarDirector extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RegistrarDirector() {
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
			getServletConfig().getServletContext().getRequestDispatcher("/vistas/director/registrar.jsp").forward(request, response);
			doPost(request, response);
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
		if(nombre==null&&fecha==null&&genero==null){
			getServletConfig().getServletContext().getRequestDispatcher("/director/registrar")
				.forward(request, response);
		}
		Director d = new Director();
		ServiceDirector sd = new ServiceDirector();
		d.setNombredirector(nombre);
		d.setGenero(genero);
		d.setNacimiento(fecha);
		sd.crearDirector(d);
		getServletConfig().getServletContext().getRequestDispatcher("/director/home")
			.forward(request, response);
	}

}

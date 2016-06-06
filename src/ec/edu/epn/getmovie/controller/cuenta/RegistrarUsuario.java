package ec.edu.epn.getmovie.controller.cuenta;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import ec.edu.epn.getmovie.model.Usuario;
import ec.edu.epn.getmovie.model.service.ServiceCuenta;

/**
 * Servlet implementation class RegistrarUsuario
 */
@WebServlet("/singup")
public class RegistrarUsuario extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public RegistrarUsuario() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		String nombre = (String) request.getParameter("username");
		String email = (String) request.getParameter("email");
		String clave = (String) request.getParameter("password");
		String confirmarClave = request.getParameter("confirmPassword");
		
		if (nombre == null || email == null || clave == null || confirmarClave == null || !clave.equals(confirmarClave)) {
			getServletConfig().getServletContext().getRequestDispatcher("/vistas/cuenta/registrar.jsp").forward(request,
					response);
		} else {
			ServiceCuenta sc = new ServiceCuenta();
			Usuario usr = new Usuario();
			usr.setNombreusr(nombre);
			usr.setCorreousr(email);
			usr.setClaveusr(clave);
			usr.setEstadousr((byte) 0);
			usr.setIsadmin((byte) 0);
			
			sc.crearUsuario(usr);
			
			getServletConfig().getServletContext().getRequestDispatcher("/home").forward(request,
					response);
		}	
	}
	
}

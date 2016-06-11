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
@WebServlet("/cuenta/registrar")
public class RegistrarUsuarioAdmin extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public RegistrarUsuarioAdmin() {
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
		Usuario usr = (Usuario) request.getSession().getAttribute("usuarioActivo");
		
		if (usr == null || usr.getEstadousr() == 0) {
			getServletConfig().getServletContext().getRequestDispatcher("/home").forward(request,
					response);
		} else {
			String nombre = (String) request.getParameter("username");
			String email = (String) request.getParameter("email");
			String clave = (String) request.getParameter("password");
			String confirmarClave = request.getParameter("confirmPassword");
			
			if (nombre == null || email == null || clave == null || confirmarClave == null || !clave.equals(confirmarClave)) {
				getServletConfig().getServletContext().getRequestDispatcher("/vistas/cuenta/registrarAdmin.jsp").forward(request,
						response);
			} else {
				ServiceCuenta sc = new ServiceCuenta();
				Usuario usuario = new Usuario();
				usuario.setNombreusr(nombre);
				usuario.setCorreousr(email);
				usuario.setClaveusr(clave);
				usuario.setEstadousr((byte) 0);
				usuario.setIsadmin((byte) 0);
				
				sc.crearUsuario(usuario);
				
				getServletConfig().getServletContext().getRequestDispatcher("/cuenta/home").forward(request,
						response);
			}	
		}
	}
	
}

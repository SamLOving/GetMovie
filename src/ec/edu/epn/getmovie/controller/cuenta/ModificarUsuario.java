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
 * Servlet implementation class ModificarUsuario
 */
@WebServlet("/cuenta/modificar")
public class ModificarUsuario extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ModificarUsuario() {
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
		Usuario usr = (Usuario) request.getSession().getAttribute("usuarioActivo");

		if (usr == null) {
			getServletConfig().getServletContext().getRequestDispatcher("/home").forward(request, response);
		} else {
			ServiceCuenta sc = new ServiceCuenta();
			String emailModificar = (String) request.getParameter("usuarioModificar");
			Usuario usuarioModificar = sc.buscarUsuario(emailModificar);
			
			request.setAttribute("usuarioModificar", usuarioModificar);
			
			getServletConfig().getServletContext().getRequestDispatcher("/vistas/cuenta/modificar.jsp").forward(request,
					response);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		Usuario usr = (Usuario) request.getSession().getAttribute("usuarioActivo");

		if (usr == null) {
			getServletConfig().getServletContext().getRequestDispatcher("/home").forward(request, response);
		} else {
			ServiceCuenta sc = new ServiceCuenta();
			Usuario usuarioModificador = new Usuario();
			
			String nombre = (String) request.getParameter("username");
			String email = (String) request.getParameter("email");
			String clave = (String) request.getParameter("password");
			String confirmarClave = (String) request.getParameter("confirmPassword");
			
			if (nombre == null || clave == null || confirmarClave == null) {
				getServletConfig().getServletContext().getRequestDispatcher("/vistas/cuenta/modificar.jsp").forward(request,
						response);
			} else if (!clave.equals(confirmarClave)) {
				getServletConfig().getServletContext().getRequestDispatcher("/vistas/cuenta/modificar.jsp").forward(request,
						response);
			}else {
				usuarioModificador.setNombreusr(nombre);
				usuarioModificador.setCorreousr(email);
				usuarioModificador.setClaveusr(clave);
				usuarioModificador.setEstadousr((byte) 0);
				usuarioModificador.setIsadmin((byte) 0);
				
				sc.modificarUsuario(usuarioModificador);
				
				if (usr.getIsadmin() == (byte) 1){
					getServletConfig().getServletContext().getRequestDispatcher("/cuenta/administrar").forward(request,
						response);
				} else {
					usr.setNombreusr(nombre);
					request.getSession().setAttribute("usuarioActivo", usr);
					getServletConfig().getServletContext().getRequestDispatcher("/cuenta/home").forward(request,
							response);
				}
			}	
		}
	}

}

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
 * Servlet implementation class IniciarSesion
 */
@WebServlet("/login")
public class IniciarSesion extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public IniciarSesion() {
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
		String email = request.getParameter("email");
		String clave = request.getParameter("password");

		if (email == null || clave == null) {
			getServletConfig().getServletContext().getRequestDispatcher("/vistas/cuenta/login.jsp").forward(request,
					response);
		} else {
			System.out.println(email + "\t" + clave);
			ServiceCuenta sc = new ServiceCuenta();

			if (sc.loggingUsuario(email, clave) == true) {
				System.out.println("Bienvenido " + email);
				Usuario usr = sc.buscarUsuario(email);
				usr.setEstadousr((byte) 1);
				request.getSession().setAttribute("usuarioActivo", usr);
				getServletConfig().getServletContext().getRequestDispatcher("/home").forward(request, response);
			} else {
				getServletConfig().getServletContext().getRequestDispatcher("/vistas/cuenta/login.jsp").forward(request,
						response);
			}
		}
	}

}

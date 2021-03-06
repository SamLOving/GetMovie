package ec.edu.epn.getmovie.controller.genero;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import ec.edu.epn.getmovie.model.Usuario;
import ec.edu.epn.getmovie.model.service.ServiceCuenta;
import ec.edu.epn.getmovie.service.genero.ServiceGenero;

/**
 * Servlet implementation class EliminarGenero
 */
@WebServlet("/genero/eliminar")
public class EliminarGenero extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public EliminarGenero() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		Usuario usr = (Usuario) request.getSession().getAttribute(
				"usuarioActivo");

		if (usr == null) {
			getServletConfig().getServletContext()
					.getRequestDispatcher("/home").forward(request, response);
		} else {
			ServiceGenero sg = new ServiceGenero();
			String idGeneroEliminar = request
					.getParameter("generoEliminarDesdeVista");
			sg.eliminarGenero(Integer.parseInt(idGeneroEliminar));
			
			getServletConfig().getServletContext()
					.getRequestDispatcher("/genero/administrar")
					.forward(request, response);
		}

	}

}

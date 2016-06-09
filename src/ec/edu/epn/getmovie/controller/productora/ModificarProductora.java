package ec.edu.epn.getmovie.controller.productora;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import ec.edu.epn.getmovie.model.Genero;
import ec.edu.epn.getmovie.model.Productora;
import ec.edu.epn.getmovie.model.Usuario;
import ec.edu.epn.getmovie.service.genero.ServiceGenero;
import ec.edu.epn.getmovie.service.productora.ServiceProductora;

/**
 * Servlet implementation class ModificarProductora
 */
@WebServlet("/productora/modificar")
public class ModificarProductora extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ModificarProductora() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		Usuario usr = (Usuario) request.getSession().getAttribute(
				"usuarioActivo");

		if (usr == null) {
			getServletConfig().getServletContext().getRequestDispatcher("/home").forward(request, response);
		} else {
			
			String idProductora = request.getParameter("generoModificarDesdeVista");
			ServiceProductora sp = new ServiceProductora();
			Productora productoraAModificar = sp.buscarProductora((int)Integer.parseInt(idProductora));

			request.setAttribute("ProductoraModificadoParaLaVista",productoraAModificar);
			RequestDispatcher rd = getServletContext().getRequestDispatcher(
					"/vistas/productora/ModificarProductora.jsp");
			rd.forward(request, response);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

}

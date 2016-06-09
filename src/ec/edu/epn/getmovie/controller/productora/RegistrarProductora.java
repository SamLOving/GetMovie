package ec.edu.epn.getmovie.controller.productora;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import ec.edu.epn.getmovie.model.Productora;

import ec.edu.epn.getmovie.service.productora.ServiceProductora;

/**
 * Servlet implementation class RegistrarProductora
 */
@WebServlet("/productora/registrar")
public class RegistrarProductora extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RegistrarProductora() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		getServletConfig().getServletContext().getRequestDispatcher("/vistas/productora/RegistrarProductora.jsp").forward(request, response);
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		//variables que vienen desde las vistas
		String nombreProductora = request.getParameter("nombreProductora");
		String paisProductora = request.getParameter("paisProductora");
		
		// prueba si funciona
		System.out.println("############### PRUEBA"+nombreProductora + " "+ paisProductora);
		
		
		if(nombreProductora==null || paisProductora==null){
			getServletConfig().getServletContext().getRequestDispatcher("/productora/home").forward(request, response);
			
		} else {
			Productora productora = new Productora();
			productora.setNombreproductora(nombreProductora);
			productora.setPaisproductora(paisProductora);
			
			ServiceProductora sp = new ServiceProductora();
			sp.crearProductora(productora);
			
			getServletConfig().getServletContext().getRequestDispatcher("/home").forward(request, response);
		}
		
	}

}

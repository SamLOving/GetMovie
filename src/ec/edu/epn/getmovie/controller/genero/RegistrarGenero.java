package ec.edu.epn.getmovie.controller.genero;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import ec.edu.epn.getmovie.model.Genero;
import ec.edu.epn.getmovie.service.genero.ServiceGenero;

/**
 * Servlet implementation class RegistrarGenero
 */
@WebServlet("/genero/registrar")
public class RegistrarGenero extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	      
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RegistrarGenero() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		getServletConfig().getServletContext().getRequestDispatcher("/vistas/genero/RegistrarGenero.jsp").forward(request, response);
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		//variables que vienen desde las vistas
		String nombreGenero = request.getParameter("nombreGenero");
		String descripcionGenero = request.getParameter("descripcionGenero");
		//System.out.println("PRUEBA SYSO"+nombreGenero +" " +descripcionGenero);
		
		// para que no tenga error el servlet con valor null
		if (nombreGenero == null || descripcionGenero==null){
			// redireccionar a una vista 
			getServletConfig().getServletContext().getRequestDispatcher("/genero/home").forward(request, response); 
					
		} else {
			// colocar la informacion obtenida de las vistas en el objeto 
			Genero genero= new Genero();
			genero.setNombregenero(nombreGenero);
			genero.setDescripciongenero(descripcionGenero);
			
			// insertar en la base de datos
			ServiceGenero sg = new ServiceGenero();
			sg.crearGenero(genero);
			
			// redireccionar a una vista 
			getServletConfig().getServletContext().getRequestDispatcher("/home").forward(request, response); 
		
		}
			
		this.doGet(request, response);
		
	}

}

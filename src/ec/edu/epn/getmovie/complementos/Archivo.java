package ec.edu.epn.getmovie.complementos;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.Part;

public class Archivo {
	//private String pathPrenda = "C:/Users/Penelope/workspace/MobileAppFindOutfit/FindOutfit/WebContent/images/prendas/";
	private String pathPrenda = "C:/Users/Penelope/workspace/LocalesNet/WebContent/archivos/";
	private String nombreApp = "/LocalesNet/archivos";
	
	public void crearDirectorio(int idArchivo) {
		System.out.println("crear directorio" + idArchivo);
		File directorio = new File(pathPrenda + idArchivo);
		directorio.mkdir();
	}

	public void eliminarDirectorio(int idArchivo, boolean eliminarDirectorio) {
		System.out.println("eliminar directorio" + idArchivo);
		File directorio = new File(pathPrenda + idArchivo);

		if (directorio.exists()) {
			if (directorio.delete() && eliminarDirectorio == true)
				System.out.println("El fichero " + directorio + " ha sido borrado correctamente");
			else {
				eliminarArchivos(directorio);
				if (eliminarDirectorio == true) {
					directorio.delete();
				}
			}
		}
	}

	public void eliminarArchivos(File directorio) {
		File[] ficheros = directorio.listFiles();
		for (int i = 0; i < ficheros.length; i++) {
			if (ficheros[i].delete()) {
				System.out.println("El fichero " + directorio + " ha sido borrado correctamente");
			} else {
				System.out.println("El fichero " + directorio + " no ha sido borrado");
			}
		}
	}

	private String getFileName(final Part part) {
		final String partHeader = part.getHeader("content-disposition");
		for (String content : part.getHeader("content-disposition").split(";")) {
			if (content.trim().startsWith("filename")) {
				return content.substring(content.indexOf('=') + 1).trim().replace("\"", "");
			}
		}
		return null;
	}

	public String subirArchivo(HttpServletRequest request, String inputFile) {
		Part filePart;
		try {
			filePart = request.getPart(inputFile);
			System.out.println(filePart);
			if (filePart != null) {
				final String fileName = getFileName(filePart);
				if (fileName != null && fileName.equals("") == false) {
					System.out.println("imprimiendo archivo");
					System.out.println(fileName);

					OutputStream out = null;
					InputStream filecontent = null;
					try {
						out = new FileOutputStream(
								new File(pathPrenda + "/" + File.separator + fileName));
						filecontent = filePart.getInputStream();

						int read = 0;
						final byte[] bytes = new byte[1024];

						while ((read = filecontent.read(bytes)) != -1) {
							out.write(bytes, 0, read);
						}
					} catch (Exception e) {
						e.printStackTrace();
					} finally {
						if (out != null) {
							out.close();
						}
						if (filecontent != null) {
							filecontent.close();
						}

					}

					String path = "/" + fileName;
					return path;
				}
				return null;
			} else
				return null;
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return null;
		} catch (ServletException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return null;
		}

	}
}

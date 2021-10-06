package servlets;

import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import org.eclipse.jdt.internal.compiler.lookup.ParameterizedFieldBinding;

import com.connect.DBConnection;

/**
 * Servlet implementation class SavePhoto
 */
@WebServlet("/SavePhoto")
@MultipartConfig(maxFileSize = 16177215)
public class SavePhoto extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SavePhoto() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String username = (String) request.getSession().getAttribute("username");
		Connection con = null;
		InputStream inputs = null;
		Part filepart = request.getPart("photo");
		if (filepart != null){
			inputs = filepart.getInputStream();
		}
		String sql = "update record set photo = ? where username = ?";
		try{
			con = DBConnection.getConnection();
			PreparedStatement ps = con.prepareStatement(sql);
			if (inputs != null)
			ps.setBlob(1, inputs);
			ps.setString(2, username);
			int row = ps.executeUpdate();
			if (row > 0){
				
				request.setAttribute("savephoto", "Image Saved ");
				request.getRequestDispatcher("view.jsp").forward(request, response);
			} else {
				request.setAttribute("savephoto", "Image Not Saved ");
				request.getRequestDispatcher("view.jsp").forward(request, response);
			}
			
		} catch(Exception e){
			
			request.setAttribute("savephoto", "Image Not Saved ");
			request.getRequestDispatcher("view.jsp").forward(request, response);
			System.out.println("Error In Save Photo" + e.getMessage());
		} finally{
			DBConnection.closeConnection(con);
		}
		
	}

}

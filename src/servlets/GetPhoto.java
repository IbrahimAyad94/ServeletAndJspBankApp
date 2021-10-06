package servlets;

import java.io.IOException;
import java.io.OutputStream;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.connect.DBConnection;

/**
 * Servlet implementation class GetPhoto
 */
@WebServlet("/GetPhoto")
public class GetPhoto extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GetPhoto() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		String username = (String) session.getAttribute("username");
		if (username == null){
			request.getRequestDispatcher("index.jsp").forward(request, response);
		}
		Connection con = null;//get your connection object here ;

		PreparedStatement ps = null;
		OutputStream o;
		session.setAttribute("photo", null);
		try {
		con = DBConnection.getConnection();
		ps = con.prepareStatement("select photo from record where username = ?;");
		ps.setString(1, username);
		ResultSet rs = ps.executeQuery();    
		System.out.println("totolove");
		if (rs.next()){
			session.setAttribute("photo", "found");
			byte[] b = rs.getBytes(1);
			response.setContentType("image/jpg");
			 o=response.getOutputStream();
		        o.write(b);
		        o.flush();
		        o.close();
		}
		}
		catch(Exception ex){
		    //ex.printStackTrace();
		    System.out.println("getPhoto" + ex.getMessage());
		}finally {
		    DBConnection.closeConnection(con);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}

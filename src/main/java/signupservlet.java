

import jakarta.servlet.ServletException;
import java.sql.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import java.io.*;
/**
 * Servlet implementation class signupservlet
 */
public class signupservlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * Default constructor. 
     */
    public signupservlet() {
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
		// TODO Auto-generated method stub
		response.setContentType("text/html");
		PrintWriter out=response.getWriter();
		String name=request.getParameter("username");
		String email=request.getParameter("email");
		String password=request.getParameter("password");
		int err=0;
		try{
			Class.forName("com.mysql.jdbc.Driver");
			String url="jdbc:mysql://localhost:3306/mini_project";
			Connection con=DriverManager.getConnection(url,"root","darkknight");
			
			PreparedStatement st=con.prepareStatement("insert into clients(username,password,email) values (?,?,?)");
			st.setString(1, name);
			st.setString(2, password);
			st.setString(3, email);
			
			st.executeUpdate();
			con.close();
			
					
		}
		catch (Exception e ) {	
			out.println(e); 
			out.println("<h3>Error Try Agian</h3>");
			err=1;
		}
	
		if(err==0) {
			response.sendRedirect("login.jsp");
			
			
			
		}
	}

}
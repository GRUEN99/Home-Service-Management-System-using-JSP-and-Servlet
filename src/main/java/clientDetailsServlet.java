import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

/**
 * Servlet implementation class clientDetailsServlet
 */

public class clientDetailsServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public clientDetailsServlet() {
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
		// TODO Auto-generated method stub
		response.setContentType("text/html");
		PrintWriter out=response.getWriter();
		String nname=request.getParameter("name");
		String adhar=request.getParameter("aadhaar");
		String number=request.getParameter("mobile");
		String stat=request.getParameter("state");
		String co=request.getParameter("country");
		String loc=request.getParameter("location");
		
		int err=0;
		try{
			Class.forName("com.mysql.jdbc.Driver");
			String url="jdbc:mysql://localhost:3306/mini_project";
			Connection con=DriverManager.getConnection(url,"root","darkknight");
			
			PreparedStatement st=con.prepareStatement("insert into clientdetails(name,aadhaar,mobile,state,country,location) values (?,?,?,?,?,?)");
			st.setString(1, nname);
			st.setString(2, adhar);
			st.setString(3, number);
			st.setString(4, stat);
			st.setString(5, co);
			st.setString(6, loc);
			
			
			st.executeUpdate();
			con.close();
			
					
		}
		catch (Exception e ) {	
			out.println(e); 
			out.println("<h3>Error Try Agian</h3>");
			err=1;
		}
	
		if(err==0) {
			response.sendRedirect("dashboard.jsp");
			
			
			
		}
	}

}
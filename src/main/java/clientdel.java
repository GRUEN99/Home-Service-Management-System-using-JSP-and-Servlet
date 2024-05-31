

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

/**
 * Servlet implementation class clientdel
 */
public class clientdel extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public clientdel() {
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
		String clientName = request.getParameter("name");

        try {
            Class.forName("com.mysql.jdbc.Driver");
            String url = "jdbc:mysql://localhost:3306/mini_project";
            Connection con = DriverManager.getConnection(url, "root", "darkknight");

            PreparedStatement st = con.prepareStatement("DELETE FROM clientdetails WHERE name=?");
            st.setString(1, clientName);

            int rowsDeleted = st.executeUpdate();
            con.close();

            if (rowsDeleted > 0) {
                response.sendRedirect("admindashboard.jsp");
            } else {
                response.getWriter().println("<h3>No client found with the provided name.</h3>");
            }
        } catch (Exception e) {
            response.getWriter().println(e.getMessage());
            response.getWriter().println("<h3>Error occurred. Please try again.</h3>");
        }
    }
}
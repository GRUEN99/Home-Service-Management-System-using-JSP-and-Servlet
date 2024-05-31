

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

/**
 * Servlet implementation class updateservlet
 */
public class updateservlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public updateservlet() {
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
		PrintWriter out = response.getWriter();

        String name = request.getParameter("name");
        String aadhaar = request.getParameter("aadhaar");
        String mobile = request.getParameter("mobile");
        String state = request.getParameter("state");
        String country = request.getParameter("country");
        String location = request.getParameter("location");

        int err = 0;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            String url = "jdbc:mysql://localhost:3306/mini_project";
            Connection con = DriverManager.getConnection(url, "root", "darkknight");

            String query = "UPDATE clientdetails SET name=?, aadhaar=?, mobile=?, state=?, country=?, location=?";
            PreparedStatement st = con.prepareStatement(query);
            st.setString(1, name);
            st.setString(2, aadhaar);
            st.setString(3, mobile);
            st.setString(4, state);
            st.setString(5, country);
            st.setString(6, location);

            int rowsUpdated = st.executeUpdate();
            con.close();

            if (rowsUpdated > 0) {
                response.sendRedirect("dashboard.jsp");
                return; // Return after performing redirect
            } else {
                err = 1;
            }
        } catch (Exception e) {
            e.printStackTrace();
            err = 1;
        }

        // If execution reaches here, an error occurred
        if (err == 1) {
            response.setContentType("text/html");
            response.getWriter().println("<h3>Error: Failed to update client details. Please try again.</h3>");
        }
    }
}
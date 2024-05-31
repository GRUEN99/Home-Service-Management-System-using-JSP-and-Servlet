import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

@WebServlet("/UpdateDeleteClientServlet")
public class UpdateDeleteClientServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        String originalAadhaar = request.getParameter("originalAadhaar");
        String originalMobile = request.getParameter("originalMobile");

        if ("Update".equals(action)) {
            updateClient(request, originalAadhaar, originalMobile);
        } else if ("Delete".equals(action)) {
            deleteClient(originalAadhaar, originalMobile);
        }

        response.sendRedirect("displayclientservlet");
    }

    private void updateClient(HttpServletRequest request, String originalAadhaar, String originalMobile) throws ServletException {
        String name = request.getParameter("name");
        String aadhaar = request.getParameter("aadhaar");
        String mobile = request.getParameter("mobile");
        String state = request.getParameter("state");
        String country = request.getParameter("country");
        String location = request.getParameter("location");

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/mini_project?characterEncoding=latin1", "root", "darkknight");
            String query = "UPDATE clientdetails SET name=?, aadhaar=?, mobile=?, state=?, country=?, location=? WHERE aadhaar=? OR mobile=?";
            PreparedStatement ps = con.prepareStatement(query);
            ps.setString(1, name);
            ps.setString(2, aadhaar);
            ps.setString(3, mobile);
            ps.setString(4, state);
            ps.setString(5, country);
            ps.setString(6, location);
            ps.setString(7, originalAadhaar);
            ps.setString(8, originalMobile);
            ps.executeUpdate();
            ps.close();
            con.close();
        } catch (Exception e) {
            throw new ServletException(e);
        }
    }

    private void deleteClient(String originalAadhaar, String originalMobile) throws ServletException {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/mini_project?characterEncoding=latin1", "root", "darkknight");
            String query = "DELETE FROM clientdetails WHERE aadhaar=? OR mobile=?";
            PreparedStatement ps = con.prepareStatement(query);
            ps.setString(1, originalAadhaar);
            ps.setString(2, originalMobile);
            ps.executeUpdate();
            ps.close();
            con.close();
        } catch (Exception e) {
            throw new ServletException(e);
        }
    }
}

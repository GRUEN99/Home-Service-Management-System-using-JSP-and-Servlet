import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

@WebServlet("/displayclientservlet")
public class displayclientservlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        List<Client> clients = new ArrayList<>();
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/mini_project?characterEncoding=latin1", "root", "darkknight");
            Statement stmt = con.createStatement();
            ResultSet rs = stmt.executeQuery("SELECT * FROM clientdetails");
            while(rs.next()) {
                Client client = new Client();
                client.setName(rs.getString("name"));
                client.setAadhaar(rs.getString("aadhaar"));
                client.setMobile(rs.getString("mobile"));
                client.setState(rs.getString("state"));
                client.setCountry(rs.getString("country"));
                client.setLocation(rs.getString("location"));
                clients.add(client);
            }
            rs.close();
            stmt.close();
            con.close();
        } catch(Exception e) {
            throw new ServletException(e);
        }

        // Generate HTML output
        out.println("<html>");
        out.println("<head>");
        out.println("<title>View Client Details</title>");
        out.println("</head>");
        out.println("<body>");
        out.println("<h1>Client Details</h1>");
        out.println("<table border='1'>");
        out.println("<tr>");
        out.println("<th>Name</th>");
        out.println("<th>Aadhaar</th>");
        out.println("<th>Mobile</th>");
        out.println("<th>State</th>");
        out.println("<th>Country</th>");
        out.println("<th>Location</th>");
        out.println("<th>Action</th>");
        out.println("</tr>");
        for (Client client : clients) {
            out.println("<tr>");
            out.println("<td>" + client.getName() + "</td>");
            out.println("<td>" + client.getAadhaar() + "</td>");
            out.println("<td>" + client.getMobile() + "</td>");
            out.println("<td>" + client.getState() + "</td>");
            out.println("<td>" + client.getCountry() + "</td>");
            out.println("<td>" + client.getLocation() + "</td>");
            out.println("<td>");
            out.println("<form action='UpdateDeleteClientServlet' method='post'>");
            out.println("<input type='hidden' name='originalAadhaar' value='" + client.getAadhaar() + "'>");
            out.println("<input type='hidden' name='originalMobile' value='" + client.getMobile() + "'>");
            out.println("Name: <input type='text' name='name' value='" + client.getName() + "'><br>");
            out.println("Aadhaar: <input type='text' name='aadhaar' value='" + client.getAadhaar() + "'><br>");
            out.println("Mobile: <input type='text' name='mobile' value='" + client.getMobile() + "'><br>");
            out.println("State: <input type='text' name='state' value='" + client.getState() + "'><br>");
            out.println("Country: <input type='text' name='country' value='" + client.getCountry() + "'><br>");
            out.println("Location: <input type='text' name='location' value='" + client.getLocation() + "'><br>");
            out.println("<input type='submit' name='action' value='Update'>");
            out.println("<input type='submit' name='action' value='Delete'>");
            out.println("</form>");
            out.println("</td>");
            out.println("</tr>");
        }
        out.println("</table>");
        out.println("</body>");
        out.println("</html>");
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}

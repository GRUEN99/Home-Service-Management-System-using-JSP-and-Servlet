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
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;

@WebServlet("/invoiceServlet")
public class invoiceServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public invoiceServlet() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();
        try {
            String serviceId = request.getParameter("service");
            int serviceIdInt = Integer.parseInt(serviceId);

            // Establish database connection
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/mini_project?characterEncoding=latin1", "root", "darkknight");
            PreparedStatement ps = con.prepareStatement("select * from services where id=?");
            ps.setInt(1, serviceIdInt);

            // Execute query
            ResultSet rs = ps.executeQuery();

            // Printing table
            out.print("<table width=50% border=1>");
            out.print("<caption>Result:</caption>");

            // Printing column names
            ResultSetMetaData rsmd = rs.getMetaData();
            int total = rsmd.getColumnCount();
            out.print("<tr>");
            for (int i = 1; i <= total; i++) {
                out.print("<th>" + rsmd.getColumnName(i) + "</th>");
            }
            out.print("</tr>");

            // Printing result rows
            while (rs.next()) {
                out.print("<tr>");
                for (int i = 1; i <= total; i++) {
                    out.print("<td>" + rs.getString(i) + "</td>");
                }
                out.print("</tr>");
            }

            out.print("</table>");
            con.close();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            out.close();
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}

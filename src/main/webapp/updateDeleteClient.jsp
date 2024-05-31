<%@ page import="java.sql.*" %>
<%@ page import="javax.naming.*, javax.sql.*" %>
<%@ page import="java.util.*" %>
<%@ page import="java.io.*" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Client Details</title>
</head>
<body>
    <h1>Client Details</h1>
    <table border="1">
        <tr>
            <th>Name</th>
            <th>Aadhaar</th>
            <th>Mobile</th>
            <th>State</th>
            <th>Country</th>
            <th>Location</th>
            <th>Action</th>
        </tr>
        <% 
            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
                Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/mini_project?characterEncoding=latin1", "root", "darkknight");
                PreparedStatement ps = con.prepareStatement("SELECT * FROM clientdetails");
                ResultSet rs = ps.executeQuery();
                while (rs.next()) {
        %>
        <tr>
            <td><%= rs.getString("name") %></td>
            <td><%= rs.getString("aadhaar") %></td>
            <td><%= rs.getString("mobile") %></td>
            <td><%= rs.getString("state") %></td>
            <td><%= rs.getString("country") %></td>
            <td><%= rs.getString("location") %></td>
            <td>
                <form action="UpdateDeleteClientServlet" method="post">
                    <input type="hidden" name="aadhaar" value="<%= rs.getString("aadhaar") %>">
                    <input type="hidden" name="mobile" value="<%= rs.getString("mobile") %>">
                    <input type="submit" name="action" value="Update">
                    <input type="submit" name="action" value="Delete">
                </form>
            </td>
        </tr>
        <% 
                }
                rs.close();
                ps.close();
                con.close();
            } catch(Exception e) {
                out.println(e);
            }
        %>
    </table>
</body>
</html>

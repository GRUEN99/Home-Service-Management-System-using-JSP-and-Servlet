<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, java.util.*" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Display Services</title>
    <style>
        table {
            border-collapse: collapse;
            width: 100%;
        }
        th, td {
            border: 1px solid #dddddd;
            text-align: left;
            padding: 8px;
        }
        th {
            background-color: #f2f2f2;
        }
    </style>
</head>
<body>
    <h2>Services List</h2>
    <table>
        <tr>
            <th>Service ID</th>
            <th>Service Name</th>
            <th>Price</th>
        </tr>
        <% 
            try {
                Class.forName("com.mysql.jdbc.Driver");
                String url="jdbc:mysql://localhost:3306/mini_project";
                Connection con=DriverManager.getConnection(url,"root","darkknight");
                Statement stmt=con.createStatement();
                ResultSet rs=stmt.executeQuery("select * from services");
                while(rs.next()) {
        %>
        <tr>
            <td><%= rs.getString("id") %></td>
            <td><%= rs.getString("service") %></td>
            <td><%= rs.getString("price") %></td>
        </tr>
        <% 
                }
                con.close();
            } catch(Exception e) {
                out.println(e);
            }
        %>
    </table>
</body>
</html>

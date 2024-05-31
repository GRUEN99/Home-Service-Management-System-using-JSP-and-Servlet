<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Delete Client</title>
</head>
<body>
    <h2>Delete Client</h2>
    <form action="clientdel" method="post">
        <label for="name">Enter Client Name to Delete:</label>
        <input type="text" id="name" name="name" required>
        <button type="submit">Delete</button>
    </form>
</body>
</html>
    
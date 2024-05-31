<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Client Management System - Home</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            background-color: #f4f4f4;
        }
        .container {
            text-align: center;
        }
        .signup-button {
            display: block;
            width: 200px;
            padding: 10px;
            margin: 10px auto;
            background-color: #333;
            color: white;
            text-align: center;
            text-decoration: none;
            border-radius: 5px; 
            font-size: 16px;
            cursor: pointer;
        }
        .signup-button:hover {
            background-color: #555;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>HOME SERVICE PROVIDERS</h1>
        <a href="clientSignup.jsp" class="signup-button">Sign Up as Client</a>
        <a href="adminSignup.jsp" class="signup-button">Sign Up as Admin</a>
    </div>
</body>
</html>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Home Service Provider</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-image: url('./image.jpg');
            background-size: cover;
            background-position: center;
            background-repeat: no-repeat;
        }
        .navbar {
            background-color: rgba(0, 0, 0, 0.5); /* Semi-transparent black */
            overflow: hidden;
            padding: 10px 0;
        }
        .navbar a {
            float: left;
            display: block;
            color: #f2f2f2;
            text-align: center;
            padding: 14px 16px;
            text-decoration: none;
        }
        .navbar a:hover {
            background-color: #ddd;
            color: black;
        }
        .navbar a.active {
            background-color: #4CAF50;
            color: white;
        }
        .content {
            padding: 20px;
            color: white;
        }
        .header {
            background-color: rgba(0, 0, 0, 0.5); /* Semi-transparent black */
            padding: 20px;
            text-align: center;
        }
        .footer {
            background-color: rgba(0, 0, 0, 0.5); /* Semi-transparent black */
            color: #f2f2f2;
            text-align: center;
            padding: 10px;
            position: fixed;
            left: 0;
            bottom: 0;
            width: 100%;
        }
        .button {
            background-color: #4CAF50;
            border: none;
            color: white;
            padding: 10px 20px;
            text-align: center;
            text-decoration: none;
            display: inline-block;
            font-size: 16px;
            margin-top: 10px;
            cursor: pointer;
        }
        .header h1 {
            color: white;
        }
        .content p{
            color: black;
        }
        .content h2{
            color: black;
        }
        .content {
        text-align: center; /* Center-align content */
    }
    .submit-button {
        margin: 0 auto; /* Set left and right margins to "auto" */
    }
        
    </style>
</head>
<body>

<div class="header">
  <h1>Home Service Provider</h1>
  <h2>Welcome to our home service provider platform!</h2>
  <p><b>This is a place where you can find various home services and manage your bookings and invoices.</b></p>
</div>

<div class="navbar">
  <a class="active" href="#">Home</a>
  <a href="#">Services</a>
  <a href="#">Bookings</a>
  <a href="#">Invoices</a>
  <a style="float:right" href="#">Logout</a>
</div>

<div class="content">
  
  <a class="button" href="homepage.jsp">SIGN UP</a>
</div>

<div class="footer">
  <p><center>DO VISIT AGAIN</center></p>
</div>

</body>
</html>

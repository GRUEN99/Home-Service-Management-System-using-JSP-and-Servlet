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
            display: flex;
        }
        .navbar {
            width: 150px;
            background-color: #2c3e50;
            height: 100vh;
            padding-top: 10px;
            box-shadow: 2px 0 5px rgba(0,0,0,0.1);
        }
        .navbar a {
            display: block;
            color: white;
            padding: 10px;
            text-decoration: none;
            font-size: 16px;
        }
        .navbar a:hover {
            background-color: #34495e;
        }
        .dashboard-box {
            background-color: #1abc9c;
            color: white;
            padding: 10px;
            margin: 10px;
            text-align: center;
            font-size: 18px;
            font-weight: bold;
        }
        .header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            background-color: #ecf0f1;
            padding: 10px 20px;
            box-shadow: 0 2px 5px rgba(0,0,0,0.1);
            width: calc(100% - 150px);
            position: fixed;
            top: 0;
            left: 150px;
        }
        .header .logo {
            font-size: 24px;
            font-weight: bold;
            text-align: center;
            flex-grow: 1;
        }
        .header .logout {
            background-color: #e74c3c;
            color: white;
            padding: 10px 20px;
            border: none;
            cursor: pointer;
            margin-left: auto;
        }
        .main-content {
            flex-grow: 1;
            padding: 20px;
            margin-top: 60px; /* To account for the fixed header */
            margin-left: 150px; /* To account for the navbar */
        }
    </style>
</head>
<body>
    <div class="navbar">
        <div class="dashboard-box">Dashboard</div>
        <a href="clientDetails.jsp">Client Details</a>
        <a href="services.jsp">Services</a>
        <a href="bookings.jsp">Bookings</a>
        <a href="invoice.jsp">Invoice</a>
        
        
    </div>
    <div class="header">
        <div class="logo">HOME SERVICE PROVIDER</div>
        <form action="homepage.jsp" method="post" style="margin: 0;">
            <button type="submit" class="logout">Logout</button>
        </form>
    </div>
    <div class="main-content">
        <!-- Main content goes here -->
    </div>
</body>
</html>

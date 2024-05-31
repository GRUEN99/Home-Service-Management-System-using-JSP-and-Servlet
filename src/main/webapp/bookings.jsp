<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Bookings</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            background-color: #f8f9fa;
        }
        form {
            background-color: #ffffff;
            padding: 20px;
            border: 1px solid #dddddd;
            border-radius: 5px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            width: 300px;
        }
        .form-group {
            margin-bottom: 15px;
        }
        label {
            display: block;
            margin-bottom: 5px;
            font-weight: bold;
        }
        input[type="text"], input[type="date"], input[type="time"] {
            width: 100%;
            padding: 8px;
            border: 1px solid #cccccc;
            border-radius: 4px;
            box-sizing: border-box;
            margin-top: 5px;
        }
        .form-actions {
            margin-top: 20px;
            display: flex;
            justify-content: space-between;
        }
        .add-btn, .clear-btn {
            padding: 10px 20px;
            border: none;
            cursor: pointer;
            border-radius: 4px;
            font-size: 16px;
        }
        .add-btn {
            background-color: #1abc9c;
            color: white;
        }
        .clear-btn {
            background-color: #e74c3c;
            color: white;
        }
        .add-btn:hover, .clear-btn:hover {
            opacity: 0.8;
        }
    </style>
    <script>
        function clearForm() {
            document.getElementById("bookingsForm").reset();
        }
    </script>
</head>
<body>
    <form id="bookingsForm" action="bookingsServlet" method="post">
        <div class="form-group">
        
            <label for="date">Date</label>
            <input type="date" id="date" name="date" required>
        </div>
        <div class="form-group">
            <label for="day">Day</label>
            <input type="text" id="day" name="day" required>
        </div>
        <div class="form-group">
            <label for="time">Time</label>
            <input type="time" id="time" name="time" required>
        </div>
        <div class="form-actions">
            <button type="submit" class="add-btn">Add</button>
            <button type="button" class="clear-btn" onclick="clearForm()">Clear</button>
        </div>
    </form>
</body>
</html>

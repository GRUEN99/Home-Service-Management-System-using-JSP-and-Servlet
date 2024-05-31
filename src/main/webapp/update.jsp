<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Update Client Details</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 20px;
            background-color: #f4f4f4;
        }
        .form-container {
            background-color: white;
            padding: 20px;
            border-radius: 5px;
            box-shadow: 0 2px 5px rgba(0,0,0,0.1);
            max-width: 600px;
            margin: auto;
        }
        .form-container h2 {
            margin-top: 0;
        }
        .form-group {
            margin-bottom: 15px;
        }
        .form-group label {
            display: block;
            margin-bottom: 5px;
        }
        .form-group input, .form-group select {
            width: 100%;
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 3px;
        }
        .form-actions {
            display: flex;
            justify-content: space-between;
        }
        .form-actions button {
            padding: 10px 20px;
            border: none;
            border-radius: 3px;
            cursor: pointer;
        }
        .form-actions .update-btn {
            background-color: #3498db;
            color: white;
        }
        .form-actions .clear-btn {
            background-color: #e74c3c;
            color: white;
        }
    </style>
    <script>
        function clearForm() {
            document.getElementById("updateClientForm").reset();
        }
    </script>
</head>
<body>
    <div class="form-container">
        <h2>Update Client Details</h2>
        <form id="updateClientForm" action="updateservlet" method="post">
           
            <div class="form-group">
                <label for="name">Name</label>
                <input type="text" id="name" name="name" required>
            </div>
            <div class="form-group">
                <label for="aadhaar">Aadhaar Number</label>
                <input type="text" id="aadhaar" name="aadhaar" required>
            </div>
            <div class="form-group">
                <label for="mobile">Mobile Number</label>
                <input type="text" id="mobile" name="mobile" required>
            </div>
            <div class="form-group">
                <label for="state">State</label>
                <input type="text" id="state" name="state" required>
            </div>
            <div class="form-group">
                <label for="country">Country</label>
                <input type="text" id="country" name="country" required>
            </div>
            <div class="form-group">
                <label for="location">Location</label>
                <input type="text" id="location" name="location" required>
            </div>
            <div class="form-actions">
                <button type="submit" class="update-btn">Update</button>
                <button type="button" class="clear-btn" onclick="clearForm()">Clear</button>
            </div>
        </form>
    </div>
</body>
</html>
    
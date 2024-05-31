<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Services and Prices</title>
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
        input[type="text"], select {
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
        function updatePrice() {
            var servicePrices = {
                "Cleaning": "150.00",
                "Plumbing": "200.00",
                "Electrician": "250.00",
                "Painting": "300.00",
                "Pest Control": "350.00"
            };

            var selectedService = document.getElementById("service").value;
            var price = servicePrices[selectedService];
            document.getElementById("price").value = price;
        }

        function clearForm() {
            document.getElementById("servicesForm").reset();
        }
    </script>
</head>
<body>
    <form id="servicesForm" action="servicesServlet" method="post">
         <div class="form-group">
            <label for="serviceId">Service ID</label>
            <input type="text" id="serviceId" name="serviceId" required>
        </div>
        
        <div class="form-group">
            <label for="service">Select Service</label>
            <select id="service" name="service" onchange="updatePrice()" required>
                <option value="">--Select a service--</option>
                <option value="Cleaning">Cleaning</option>
                <option value="Plumbing">Plumbing</option>
                <option value="Electrician">Electrician</option>
                <option value="Painting">Painting</option>
                <option value="Pest Control">Pest Control</option>
            </select>
        </div>
       
        <div class="form-group">
            <label for="price">Price</label>
            <input type="text" id="price" name="price" readonly>
        </div>
        <div class="form-actions">
            <button type="submit" class="add-btn">Add</button>
            <button type="button" class="clear-btn" onclick="clearForm()">Clear</button>
        </div>
    </form>
</body>
</html>

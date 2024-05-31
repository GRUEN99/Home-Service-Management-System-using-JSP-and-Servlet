<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Invoice</title>
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
        .invoice-container {
            background-color: #ffffff;
            padding: 20px;
            border: 1px solid #dddddd;
            border-radius: 5px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            width: 500px;
            text-align: center;
        }
        .invoice-heading {
            font-size: 24px;
            font-weight: bold;
            margin-bottom: 20px;
        }
        .form-actions {
            margin-top: 20px;
            display: flex;
            justify-content: space-between;
        }
        .generate-btn, .print-btn {
            padding: 10px 20px;
            border: none;
            cursor: pointer;
            border-radius: 4px;
            font-size: 16px;
        }
        .generate-btn {
            background-color: #1abc9c;
            color: white;
        }
        .print-btn {
            background-color: #3498db;
            color: white;
        }
        .generate-btn:hover, .print-btn:hover {
            opacity: 0.8;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }
        th, td {
            border: 1px solid #dddddd;
            padding: 8px;
            text-align: left;
        }
        th {
            background-color: #f2f2f2;
        }
    </style>
</head>
<body>
    <div class="invoice-container" id="invoiceContainer">
        <div class="invoice-heading">Invoice</div>
        <div class="form-actions">
            <form action="invoiceServlet" method="get" style="margin: 0;">
                <!-- Add input field for service ID -->
                <label for="serviceId">Service ID:</label>
                <input type="text" id="serviceId" name="service">
                <button type="submit" class="generate-btn">Generate Invoice</button>
            </form>
            <button class="print-btn" onclick="printInvoice()">Print</button>
        </div>
        <table id="invoiceTable">
            <!-- Invoice data will be populated here by the servlet -->
        </table>
    </div>
    <script>
        function printInvoice() {
            var printContents = document.getElementById("invoiceContainer").innerHTML;
            var originalContents = document.body.innerHTML;
            document.body.innerHTML = printContents;
            window.print();
            document.body.innerHTML = originalContents;
        }
    </script>
</body>

</html>

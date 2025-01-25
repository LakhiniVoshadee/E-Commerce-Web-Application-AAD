<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Delete Product</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background-image: linear-gradient(rgba(0, 0, 0, 0.5), rgba(0, 0, 0, 0.5)), url('https://img.freepik.com/free-photo/fashion-store-display_1150-2724.jpg');
            background-size: cover;
            background-position: center;
            background-attachment: fixed;
            height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
            margin: 0;
            font-family: 'Arial', sans-serif;
        }
        .delete-container {
            background-color: rgba(255, 255, 255, 0.9);
            border-radius: 15px;
            box-shadow: 0 10px 25px rgba(0, 0, 0, 0.2);
            padding: 40px;
            max-width: 500px;
            width: 100%;
            backdrop-filter: blur(10px);
        }
        .form-control {
            border-radius: 20px;
            padding: 12px 20px;
            background-color: rgba(255, 255, 255, 0.8);
        }
        .btn-custom {
            background-color: #ff4b4b;
            color: white;
            border-radius: 25px;
            padding: 12px 25px;
            transition: all 0.3s ease;
        }
        .btn-custom:hover {
            background-color: #ff6b6b;
            transform: scale(1.05);
        }
        .form-label {
            font-weight: 600;
            color: #333;
        }
        .alert-custom {
            border-radius: 15px;
            padding: 15px;
            text-align: center;
        }
    </style>
</head>
<body>
<div class="container">
    <div class="delete-container">
        <h2 class="text-center mb-4" style="color: #333; font-weight: bold;">Delete Product</h2>

        <% String message = request.getParameter("message"); %>
        <% if (message != null) { %>
        <div class="alert alert-success alert-custom">
            <%= message %>
        </div>
        <% } %>

        <% String error = request.getParameter("error"); %>
        <% if (error != null) { %>
        <div class="alert alert-danger alert-custom">
            <%= error %>
        </div>
        <% } %>

        <form action="product-delete" method="post">
            <div class="mb-3">
                <label for="product_id" class="form-label">Product ID</label>
                <input type="text" class="form-control" id="product_id" name="product_id" placeholder="Enter Product ID" required>
            </div>
            <div class="text-center">
                <button type="submit" class="btn btn-custom">Delete Product</button>
            </div>
        </form>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>

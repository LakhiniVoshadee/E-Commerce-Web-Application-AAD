<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Delete Product</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background-image: linear-gradient(rgba(0, 0, 0, 0.5), rgba(0, 0, 0, 0.5)), url('https://cdn.pixabay.com/photo/2020/01/05/20/02/chanel-4743979_960_720.jpg');
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
        .navbar-brand {
            font-size: 1.5rem;
            letter-spacing: 1px;
        }
        .navbar {
            backdrop-filter: blur(10px);
            background-color: rgba(255, 255, 255, 0.9) !important;
        }

        .navbar-brand {
            font-size: 1.5rem;
        }

        .nav-link {
            font-weight: 500;
            padding: 1rem !important;
            transition: color 0.3s;
        }

        .nav-link:hover {
            color: #666;
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
<nav class="navbar navbar-expand-lg fixed-top bg-white navbar-light">
    <div class="container">
        <a class="navbar-brand d-flex align-items-center" href="#">
            <i class="bi bi-bag fs-4 me-2"></i>
            <span class="fw-semibold">LUXE</span>
        </a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav mx-auto">
                <li class="nav-item">
                    <a class="nav-link" href="index.jsp">Home</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="about_us.jsp">About Us</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="category.jsp">Collections</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="product.jsp">Products</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#">Contact</a>
                </li>
            </ul>
            <div class="d-flex align-items-center">
                <a href="#" class="btn btn-outline-dark me-2">
                    <i class="bi bi-search"></i>
                </a>
                <a href="user_register.jsp" class="btn btn-outline-dark me-2">
                    <i class="bi bi-person"></i>
                </a>
                <a href="#" class="btn btn-outline-dark position-relative">
                    <i class="bi bi-cart"></i>
                    <span class="position-absolute top-0 start-100 translate-middle badge rounded-pill bg-danger">
                        3
                    </span>
                </a>
            </div>
        </div>
    </div>
</nav>
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

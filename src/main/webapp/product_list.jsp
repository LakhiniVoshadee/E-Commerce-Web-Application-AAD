<%@ page import="lk.ijse.aadassignment01.dto.ProductDTO" %>
<%@ page import="java.util.List" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Product List</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background: url('https://cdn.pixabay.com/photo/2021/11/15/05/25/boutique-6796399_1280.jpg') no-repeat center center fixed;
            background-size: cover;
            font-family: 'Arial', sans-serif;
            color: #fff;
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

        .overlay {
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background: rgba(0, 0, 0, 0.5);
            z-index: 1;
        }

        .content-container {
            position: relative;
            z-index: 2;
            padding: 20px;
            margin: auto;
            max-width: 1200px;
        }

        .card-container {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
            gap: 30px;
        }

        .card {
            background-color: rgba(255, 255, 255, 0.8);
            border: none;
            border-radius: 15px;
            padding: 20px;
            box-shadow: 0 8px 15px rgba(0, 0, 0, 0.3);
            transition: transform 0.3s ease, box-shadow 0.3s ease;
        }

        .card:hover {
            transform: scale(1.05);
            box-shadow: 0 10px 20px rgba(0, 0, 0, 0.5);
        }

        .card-title {
            font-size: 1.5rem;
            font-weight: bold;
            color: #343a40;
        }

        .card-subtitle {
            font-size: 1rem;
            color: #6c757d;
        }

        .card-text {
            margin-top: 10px;
            color: #495057;
        }

        .action-buttons {
            margin-top: 15px;
            display: flex;
            gap: 10px;
        }

        .btn {
            border-radius: 20px;
        }

        .btn-primary {
            background-color: #343a40;
            border: none;
        }

        .btn-primary:hover {
            background-color: #495057;
        }

        .btn-danger {
            background-color: #dc3545;
            border: none;
        }

        .btn-danger:hover {
            background-color: #bd2130;
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
                    <a class="nav-link" href="user_category_list.jsp">Collections</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="user_products_list.jsp">Products</a>
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
<div class="overlay"></div>
<div class="content-container">
    <h1 class="text-center mb-4">Product List</h1>
    <div class="card-container">
        <% List<ProductDTO> productDataList = (List<ProductDTO>) request.getAttribute("products");
            if (productDataList != null && !productDataList.isEmpty()) {
                for (ProductDTO productDTO : productDataList) { %>
        <div class="card">
            <div class="card-body">
                <h5 class="card-title"><%= productDTO.getProduct_name() %></h5>
                <h6 class="card-subtitle mb-2">Category: <%= productDTO.getCategory().getName() %></h6>
                <p class="card-text"><%= productDTO.getDescription() %></p>
                <p class="card-text">Price: $<%= productDTO.getProduct_price() %></p>
                <p class="card-text">Stock: <%= productDTO.getStock() %></p>
                <div class="action-buttons">
                    <a href="product_update.jsp?id=<%= productDTO.getProduct_id() %>" class="btn btn-primary btn-sm">
                        Edit
                    </a>
                    <a href="product_delete.jsp?id=<%= productDTO.getProduct_id() %>" class="btn btn-danger btn-sm">
                        Delete
                    </a>
                    <form action="cart-add" method="post" class="d-inline">
                        <input type="hidden" name="product_id" value="<%= productDTO.getProduct_id() %>">
                        <input type="number" name="quantity" class="form-control d-inline w-auto" min="1" value="1" style="display: inline-block; width: 80px; height: 35px;">
                        <button type="submit" class="btn btn-primary btn-sm"><a href="cart.jsp">Add to Cart</a></button>
                    </form>
                </div>
            </div>
        </div>
        <% }
        } else { %>
        <div class="alert alert-info text-center">No products found.</div>
        <% } %>
    </div>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>

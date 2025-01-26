<%@ page import="lk.ijse.aadassignment01.dto.CategoryDTO" %>
<%@ page import="java.util.List" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Fashion Collection Cards</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        :root {
            --primary-black: #0a0a0a;
            --secondary-black: #1a1a1a;
            --accent-gray: #333333;
            --light-gray: #e0e0e0;
            --pure-white: #ffffff;
        }

        body {
            background-image: linear-gradient(rgba(0, 0, 0, 0.5), rgba(0, 0, 0, 0.5)), url('https://media.istockphoto.com/id/1658893205/photo/make-up-products-at-pink-background-top-view.jpg?s=2048x2048&w=is&k=20&c=8gyQW0fdTC_akVBisTn2DKn-fY2xTWl4CSPCsPZvneE=');
            background-size: cover;
            background-position: center;
            background-attachment: fixed;
            color: var(--pure-white);
            font-family: 'Arial', sans-serif;
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

        .card-container {
            max-width: 1200px;
            margin: 50px auto;
            padding: 20px;
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
            gap: 30px;
        }

        .card {
            background-color: rgba(255, 255, 255, 0.9);
            border-radius: 15px;
            box-shadow: 0 10px 25px rgba(0, 0, 0, 0.2);
            padding: 20px;
            backdrop-filter: blur(10px);
        }

        .card-body {
            color: var(--secondary-black);
        }

        .card-title {
            font-weight: bold;
            color: var(--accent-gray);
        }

        .card-subtitle {
            color: var(--accent-gray);
            font-size: 0.9rem;
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
                <li class="nav-item"><a class="nav-link" href="index.jsp">Home</a></li>
                <li class="nav-item"><a class="nav-link" href="about_us.jsp">About Us</a></li>
                <li class="nav-item"><a class="nav-link" href="category.jsp">Collections</a></li>
                <li class="nav-item"><a class="nav-link" href="product.jsp">Products</a></li>
                <li class="nav-item"><a class="nav-link" href="#">Contact</a></li>
            </ul>
            <div class="d-flex align-items-center">
                <a href="#" class="btn btn-outline-dark me-2"><i class="bi bi-search"></i></a>
                <a href="user_register.jsp" class="btn btn-outline-dark me-2"><i class="bi bi-person"></i></a>
                <a href="#" class="btn btn-outline-dark position-relative">
                    <i class="bi bi-cart"></i>
                    <span class="position-absolute top-0 start-100 translate-middle badge rounded-pill bg-danger">3</span>
                </a>
            </div>
        </div>
    </div>
</nav>

<div class="card-container">
    <% List<CategoryDTO> categoryDataList = (List<CategoryDTO>) request.getAttribute("categories");
        if (categoryDataList != null && !categoryDataList.isEmpty()) {
            for (CategoryDTO categoryDTO : categoryDataList) { %>
    <div class="card">
        <div class="card-body">
            <h5 class="card-title"><%= categoryDTO.getName() %></h5>
            <h6 class="card-subtitle">ID: <%= categoryDTO.getCategory_id() %></h6>
            <p class="card-text"><%= categoryDTO.getDescription() %></p>
        </div>
    </div>
    <%  }
    } else { %>
    <div class="alert alert-info text-center">No categories found.</div>
    <% } %>


</div>
<div class="card-container">

    <div class="card">
        <div class="card-body">
            <h5 class="card-title">Watches</h5>
            <h6 class="card-subtitle">ID:1</h6>
            <p class="card-text">pppppp</p>
        </div>
    </div>

    <div class="alert alert-info text-center">No categories found.</div>



</div>

<script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/js/all.min.js"></script>
</body>
</html>

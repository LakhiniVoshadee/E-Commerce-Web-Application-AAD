<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>LUXE - Fashion Store</title>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.2/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css" rel="stylesheet">
    <style>
        .hero-section {
            background: linear-gradient(rgba(0,0,0,0.5), rgba(0,0,0,0.5)),
            url('/api/placeholder/1920/1080') center/cover;
            height: 80vh;
            display: flex;
            align-items: center;
            color: white;
        }

        .category-card {
            position: relative;
            overflow: hidden;
            height: 300px;
        }

        .category-card img {
            transition: transform 0.3s ease;
        }

        .category-card:hover img {
            transform: scale(1.1);
        }

        .product-card {
            transition: transform 0.3s ease, box-shadow 0.3s ease;
        }

        .product-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 10px 20px rgba(0,0,0,0.1);
        }

        .navbar {
            background-color: rgba(255,255,255,0.95) !important;
        }
    </style>
</head>


<body>
<!-- Navigation -->
<nav class="navbar navbar-expand-lg navbar-light bg-light fixed-top shadow-sm">
    <div class="container">
        <a class="navbar-brand fw-bold" href="#">LUXE</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav me-auto">
                <li class="nav-item">
                    <a class="nav-link" href="#">Home</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="category.jsp">
                        Categories
                    </a>
                    <%--<ul class="dropdown-menu">
                        <li><a class="dropdown-item" href="#">Men</a></li>
                        <li><a class="dropdown-item" href="#">Women</a></li>
                        <li><a class="dropdown-item" href="#">Accessories</a></li>
                    </ul>--%>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#">New Arrivals</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#">Sale</a>
                </li>
            </ul>
            <div class="d-flex align-items-center">
                <a href="#" class="btn btn-outline-dark me-2">
                    <i class="fas fa-search"></i>
                </a>
                <a href="user_login.jsp" class="btn btn-outline-dark me-2">
                    <i class="fas fa-user"></i>
                </a>
                <a href="#" class="btn btn-outline-dark position-relative">
                    <i class="fas fa-shopping-cart"></i>
                    <span class="position-absolute top-0 start-100 translate-middle badge rounded-pill bg-danger">
                            3
                        </span>
                </a>
            </div>
        </div>
    </div>
</nav>

<!-- Hero Section -->
<section class="hero-section">
    <div class="container">
        <div class="row">
            <div class="col-md-8">
                <h1 class="display-3 fw-bold mb-4">New Season Arrivals</h1>
                <p class="lead mb-4">Discover the latest trends in fashion and explore our new collection.</p>
                <a href="#" class="btn btn-light btn-lg">Shop Now</a>
            </div>
        </div>
    </div>
</section>

<!-- Categories Section -->
<section class="py-5">
    <div class="container">
        <h2 class="text-center mb-5">Shop by Category</h2>
        <div class="row g-4">
            <div class="col-md-4">
                <div class="category-card rounded overflow-hidden">
                    <img src="/api/placeholder/400/300" class="w-100 h-100 object-fit-cover" alt="Men's Fashion">
                    <div class="position-absolute bottom-0 start-0 p-4 text-white" style="background: linear-gradient(transparent, rgba(0,0,0,0.7))">
                        <h3 class="mb-0">Men's Fashion</h3>
                    </div>
                </div>
            </div>
            <div class="col-md-4">
                <div class="category-card rounded overflow-hidden">
                    <img src="/api/placeholder/400/300" class="w-100 h-100 object-fit-cover" alt="Women's Fashion">
                    <div class="position-absolute bottom-0 start-0 p-4 text-white" style="background: linear-gradient(transparent, rgba(0,0,0,0.7))">
                        <h3 class="mb-0">Women's Fashion</h3>
                    </div>
                </div>
            </div>
            <div class="col-md-4">
                <div class="category-card rounded overflow-hidden">
                    <img src="/api/placeholder/400/300" class="w-100 h-100 object-fit-cover" alt="Accessories">
                    <div class="position-absolute bottom-0 start-0 p-4 text-white" style="background: linear-gradient(transparent, rgba(0,0,0,0.7))">
                        <h3 class="mb-0">Accessories</h3>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>

<!-- Featured Products -->
<section class="py-5 bg-light">
    <div class="container">
        <h2 class="text-center mb-5">Featured Products</h2>
        <div class="row g-4">
            <div class="col-md-3">
                <div class="card product-card border-0">
                    <img src="/api/placeholder/300/400" class="card-img-top" alt="Product">
                    <div class="card-body">
                        <h5 class="card-title">Classic White Shirt</h5>
                        <p class="card-text text-muted">$59.99</p>
                        <button class="btn btn-dark w-100">Add to Cart</button>
                    </div>
                </div>
            </div>
            <div class="col-md-3">
                <div class="card product-card border-0">
                    <img src="/api/placeholder/300/400" class="card-img-top" alt="Product">
                    <div class="card-body">
                        <h5 class="card-title">Denim Jacket</h5>
                        <p class="card-text text-muted">$89.99</p>
                        <button class="btn btn-dark w-100">Add to Cart</button>
                    </div>
                </div>
            </div>
            <div class="col-md-3">
                <div class="card product-card border-0">
                    <img src="/api/placeholder/300/400" class="card-img-top" alt="Product">
                    <div class="card-body">
                        <h5 class="card-title">Summer Dress</h5>
                        <p class="card-text text-muted">$79.99</p>
                        <button class="btn btn-dark w-100">Add to Cart</button>
                    </div>
                </div>
            </div>
            <div class="col-md-3">
                <div class="card product-card border-0">
                    <img src="/api/placeholder/300/400" class="card-img-top" alt="Product">
                    <div class="card-body">
                        <h5 class="card-title">Leather Bag</h5>
                        <p class="card-text text-muted">$129.99</p>
                        <button class="btn btn-dark w-100">Add to Cart</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>

<!-- Newsletter Section -->
<section class="py-5">
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-md-6 text-center">
                <h3 class="mb-4">Subscribe to Our Newsletter</h3>
                <p class="text-muted mb-4">Get updates about new products and special offers</p>
                <form class="d-flex gap-2">
                    <input type="email" class="form-control" placeholder="Enter your email">
                    <button class="btn btn-dark px-4">Subscribe</button>
                </form>
            </div>
        </div>
    </div>
    <a href="category_save.jsp">Add Category</a>
    <a href="category_list"></a>
    <a href="user_login.jsp">User Login</a>
</section>

<!-- Footer -->
<footer class="bg-dark text-white py-5">
    <div class="container">
        <div class="row g-4">
            <div class="col-md-3">
                <h5 class="mb-4">LUXE</h5>
                <p class="text-muted">Your premier destination for luxury fashion and accessories.</p>
            </div>
            <div class="col-md-3">
                <h5 class="mb-4">Quick Links</h5>
                <ul class="list-unstyled">
                    <li><a href="#" class="text-muted text-decoration-none">About Us</a></li>
                    <li><a href="#" class="text-muted text-decoration-none">Contact</a></li>
                    <li><a href="#" class="text-muted text-decoration-none">FAQs</a></li>
                    <li><a href="#" class="text-muted text-decoration-none">Shipping</a></li>
                </ul>
            </div>
            <div class="col-md-3">
                <h5 class="mb-4">Customer Service</h5>
                <ul class="list-unstyled">
                    <li><a href="#" class="text-muted text-decoration-none">Returns</a></li>
                    <li><a href="#" class="text-muted text-decoration-none">Size Guide</a></li>
                    <li><a href="#" class="text-muted text-decoration-none">Track Order</a></li>
                    <li><a href="#" class="text-muted text-decoration-none">Gift Cards</a></li>
                </ul>
            </div>
            <div class="col-md-3">
                <h5 class="mb-4">Connect With Us</h5>
                <div class="d-flex gap-3">
                    <a href="#" class="text-muted"><i class="fab fa-facebook-f"></i></a>
                    <a href="#" class="text-muted"><i class="fab fa-instagram"></i></a>
                    <a href="#" class="text-muted"><i class="fab fa-twitter"></i></a>
                    <a href="#" class="text-muted"><i class="fab fa-pinterest"></i></a>
                </div>
            </div>
        </div>
        <hr class="my-4">
        <div class="text-center text-muted">
            <small>&copy; 2025 LUXE. All rights reserved.</small>
        </div>
    </div>
</footer>

<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.2/js/bootstrap.bundle.min.js"></script>
</body>
</html>


</html>
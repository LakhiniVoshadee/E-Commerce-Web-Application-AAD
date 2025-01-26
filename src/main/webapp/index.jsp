<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>LUXE - Fashion & Style</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">
    <style>
        /* Custom styles */
        body {
            font-family: 'Inter', sans-serif;
        }

        /* Navbar */
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

        /* Hero Section */
        .hero {
            height: 100vh;
            background: url('https://images.unsplash.com/photo-1490481651871-ab68de25d43d?auto=format&fit=crop&q=80') center/cover;
            position: relative;
            display: flex;
            align-items: center;
        }

        .hero::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            right: 0;
            bottom: 0;
            background: rgba(0, 0, 0, 0.4);
        }

        .hero-content {
            position: relative;
            width: 100%;
            padding-top: 60px;
        }

        /* Product Cards */
        .product-card {
            border: none;
            border-radius: 0;
            overflow: hidden;
            transition: transform 0.3s;
            cursor: pointer;
        }

        .product-card:hover {
            transform: translateY(-10px);
        }

        .product-card img {
            height: 400px;
            object-fit: cover;
        }

        .product-info {
            background: linear-gradient(to top, rgba(0,0,0,0.8), transparent);
            padding: 20px;
        }

        /* Newsletter Section */
        .newsletter .form-control {
            padding: 0.8rem 1.2rem;
            background-color: rgba(255, 255, 255, 0.1);
            border: 1px solid rgba(255, 255, 255, 0.2);
            color: white;
        }

        .newsletter .form-control::placeholder {
            color: rgba(255, 255, 255, 0.5);
        }

        .newsletter .form-control:focus {
            background-color: rgba(255, 255, 255, 0.15);
            border-color: rgba(255, 255, 255, 0.3);
            box-shadow: none;
        }
        .btn-shop {
            background: #fff;
            color: #000;
            border: none;
            padding: 15px 40px;
            font-weight: 500;
            position: relative;
            overflow: hidden;
            transition: all 0.3s ease;
        }

        .btn-shop:hover {
            background: #f8f9fa;
            transform: translateY(-2px);
            box-shadow: 0 5px 15px rgba(0,0,0,0.1);
        }

        .btn-shop::after {
            content: '';
            position: absolute;
            bottom: 0;
            left: 0;
            width: 100%;
            height: 2px;
            background: #000;
            transform: scaleX(0);
            transform-origin: right;
            transition: transform 0.3s ease;
        }

        .btn-shop:hover::after {
            transform: scaleX(1);
            transform-origin: left;
        }

        .btn-shop i {
            transition: transform 0.3s ease;
        }

        .btn-shop:hover i {
            transform: translateX(5px);
        }

        /* Utility Classes */
        .bi {
            cursor: pointer;
        }

        /* Responsive Adjustments */
        @media (max-width: 768px) {
            .hero h1 {
                font-size: 2.5rem;
            }

            .product-card img {
                height: 300px;
            }
        }
    </style>
</head>
<body>
<!-- Navigation -->
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
                    <a class="nav-link" href="about_us.jsp">About Us</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link"  href="category.jsp">Collections</a>
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

<!-- Hero Section -->
<section class="hero">
    <div class="hero-content">
        <div class="container">
            <div class="row">
                <div class="col-lg-6">
                    <h1 class="display-3 fw-bold text-white mb-4">Autumn Collection 2023</h1>
                    <p class="lead text-white mb-5">Discover our latest collection inspired by urban sophistication and sustainable luxury.</p>
                    <a href="user_register.jsp" class="btn btn-shop btn-lg d-inline-flex align-items-center text-decoration-none">
                        Shop Now
                        <i class="bi bi-arrow-right ms-3"></i>
                    </a>
                </div>
            </div>
        </div>
    </div>
</section>

<!-- Trending Section -->
<section class="trending py-5">
    <div class="container">
        <div class="d-flex justify-content-between align-items-center mb-5">
            <h2 class="fw-bold">Trending Now</h2>
            <i class="bi bi-graph-up-arrow fs-4"></i>
        </div>
        <div class="row g-4">
            <div class="col-md-4">
                <div class="card product-card">
                    <img src="https://images.unsplash.com/photo-1485230895905-ec40ba36b9bc?auto=format&fit=crop&q=80" class="card-img-top" alt="Autumn Essentials">
                    <div class="card-img-overlay d-flex align-items-end">
                        <div class="w-100 text-white product-info">
                            <h5 class="card-title mb-1">Autumn Essentials</h5>
                            <p class="card-text">$299</p>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-md-4">
                <div class="card product-card">
                    <img src="https://images.unsplash.com/photo-1509631179647-0177331693ae?auto=format&fit=crop&q=80" class="card-img-top" alt="Evening Collection">
                    <div class="card-img-overlay d-flex align-items-end">
                        <div class="w-100 text-white product-info">
                            <h5 class="card-title mb-1">Evening Collection</h5>
                            <p class="card-text">$399</p>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-md-4">
                <div class="card product-card">
                    <img src="https://images.unsplash.com/photo-1483985988355-763728e1935b?auto=format&fit=crop&q=80" class="card-img-top" alt="Street Style">
                    <div class="card-img-overlay d-flex align-items-end">
                        <div class="w-100 text-white product-info">
                            <h5 class="card-title mb-1">Street Style</h5>
                            <p class="card-text">$199</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>

<!-- Newsletter Section -->
<section class="newsletter bg-dark text-white py-5">
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-lg-6 text-center">
                <h2 class="fw-bold mb-4">Join Our Newsletter</h2>
                <p class="text-white-50 mb-4">Stay updated with our latest collections and exclusive offers.</p>
                <div class="input-group">
                    <input type="email" class="form-control" placeholder="Enter your email">
                    <button class="btn btn-light px-4">Subscribe</button>
                </div>
            </div>
        </div>
    </div>
</section>

<!-- Footer -->
<footer class="bg-dark text-white py-5">
    <div class="container">
        <div class="row g-4">
            <div class="col-lg-3">
                <div class="d-flex align-items-center mb-3">
                    <i class="bi bi-bag me-2"></i>
                    <span class="fw-semibold">LUXE</span>
                </div>
                <p class="text-white-50">Redefining luxury fashion for the modern era.</p>
            </div>
            <div class="col-lg-3">
                <h5 class="fw-semibold mb-3">Shop</h5>
                <ul class="list-unstyled text-white-50">
                    <li class="mb-2"><a href="#" class="text-decoration-none text-white-50">New Arrivals</a></li>
                    <li class="mb-2"><a href="#" class="text-decoration-none text-white-50">Best Sellers</a></li>
                    <li class="mb-2"><a href="#" class="text-decoration-none text-white-50">Collections</a></li>
                </ul>
            </div>
            <div class="col-lg-3">
                <h5 class="fw-semibold mb-3">Company</h5>
                <ul class="list-unstyled text-white-50">
                    <li class="mb-2"><a href="#" class="text-decoration-none text-white-50">About Us</a></li>
                    <li class="mb-2"><a href="#" class="text-decoration-none text-white-50">Contact</a></li>
                    <li class="mb-2"><a href="#" class="text-decoration-none text-white-50">Careers</a></li>
                </ul>
            </div>
            <div class="col-lg-3">
                <h5 class="fw-semibold mb-3">Support</h5>
                <ul class="list-unstyled text-white-50">
                    <li class="mb-2"><a href="#" class="text-decoration-none text-white-50">FAQ</a></li>
                    <li class="mb-2"><a href="#" class="text-decoration-none text-white-50">Shipping</a></li>
                    <li class="mb-2"><a href="#" class="text-decoration-none text-white-50">Returns</a></li>
                </ul>
            </div>
        </div>
        <div class="border-top border-secondary mt-4 pt-4 text-center text-white-50">
            <p class="mb-0">© 2023 LUXE. All rights reserved.</p>
        </div>
    </div>
</footer>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
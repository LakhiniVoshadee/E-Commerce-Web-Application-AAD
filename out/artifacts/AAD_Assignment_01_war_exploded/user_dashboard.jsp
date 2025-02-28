<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>My Account - Luxe Fashion</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet">
    <style>
        :root {
            --primary-color: #1a1c23;
            --accent-color: #c9a96e;
            --sidebar-width: 280px;
        }

        body {
            background-color: #f8f9fa;
            min-height: 100vh;
            font-family: 'Inter', sans-serif;
        }

        .customer-sidebar {
            width: var(--sidebar-width);
            background: white;
            min-height: 100vh;
            position: fixed;
            left: 0;
            top: 0;
            z-index: 1000;
            transition: all 0.3s ease;
            box-shadow: 2px 0 10px rgba(0,0,0,0.05);
        }

        .brand-wrapper {
            padding: 2rem 1.5rem;
            border-bottom: 1px solid #eee;
        }

        .brand-title {
            color: var(--primary-color);
            font-size: 1.75rem;
            font-weight: 700;
            letter-spacing: 2px;
            margin: 0;
        }

        .nav-section {
            padding: 1.5rem 0;
        }

        .nav-section-title {
            color: #6c757d;
            font-size: 0.75rem;
            text-transform: uppercase;
            letter-spacing: 1px;
            padding: 0.5rem 1.5rem;
            margin-bottom: 0.5rem;
        }

        .nav-item {
            padding: 0.25rem 1.5rem;
        }

        .nav-link {
            color: var(--primary-color);
            text-decoration: none;
            display: flex;
            align-items: center;
            padding: 0.75rem 1rem;
            border-radius: 0.5rem;
            transition: all 0.3s ease;
        }

        .nav-link:hover {
            background: #f8f9fa;
            color: var(--accent-color);
        }

        .nav-link.active {
            background: var(--accent-color);
            color: white;
        }

        .nav-link i {
            width: 20px;
            margin-right: 0.75rem;
        }

        .main-content {
            margin-left: var(--sidebar-width);
            padding: 2rem;
        }

        .top-bar {
            background: white;
            padding: 1.5rem 2rem;
            box-shadow: 0 2px 4px rgba(0,0,0,0.04);
            margin-bottom: 2rem;
            border-radius: 1rem;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .welcome-text {
            font-size: 1.5rem;
            font-weight: 600;
            margin: 0;
            color: var(--primary-color);
        }

        .customer-profile {
            display: flex;
            align-items: center;
            gap: 1rem;
        }

        .customer-avatar {
            width: 45px;
            height: 45px;
            border-radius: 50%;
            background: #f8f9fa;
            display: flex;
            align-items: center;
            justify-content: center;
            border: 2px solid var(--accent-color);
        }

        .order-summary {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
            gap: 1.5rem;
            margin-bottom: 2rem;
        }

        .summary-card {
            background: white;
            border-radius: 1rem;
            padding: 1.5rem;
            box-shadow: 0 2px 4px rgba(0,0,0,0.04);
            transition: transform 0.3s ease;
        }

        .summary-card:hover {
            transform: translateY(-5px);
        }

        .summary-icon {
            width: 50px;
            height: 50px;
            border-radius: 12px;
            background: #f8f9fa;
            display: flex;
            align-items: center;
            justify-content: center;
            margin-bottom: 1rem;
            color: var(--accent-color);
        }

        .summary-title {
            color: #6c757d;
            font-size: 0.875rem;
            margin-bottom: 0.5rem;
        }

        .summary-value {
            font-size: 1.5rem;
            font-weight: 600;
            color: var(--primary-color);
            margin-bottom: 0;
        }

        .recent-orders {
            background: white;
            border-radius: 1rem;
            padding: 1.5rem;
            box-shadow: 0 2px 4px rgba(0,0,0,0.04);
        }

        .section-title {
            font-size: 1.25rem;
            font-weight: 600;
            margin-bottom: 1.5rem;
            color: var(--primary-color);
        }

        .order-list {
            list-style: none;
            padding: 0;
            margin: 0;
        }

        .order-item {
            display: flex;
            align-items: center;
            padding: 1rem;
            border: 1px solid #eee;
            border-radius: 0.5rem;
            margin-bottom: 1rem;
            transition: all 0.3s ease;
        }

        .order-item:hover {
            border-color: var(--accent-color);
            background: #f8f9fa;
        }

        .order-image {
            width: 80px;
            height: 80px;
            border-radius: 0.5rem;
            object-fit: cover;
            margin-right: 1rem;
        }

        .order-details {
            flex: 1;
        }

        .order-number {
            font-weight: 600;
            color: var(--primary-color);
            margin-bottom: 0.25rem;
        }

        .order-date {
            font-size: 0.875rem;
            color: #6c757d;
        }

        .order-status {
            padding: 0.25rem 0.75rem;
            border-radius: 50px;
            font-size: 0.875rem;
            font-weight: 500;
        }

        .status-delivered {
            background: #d1fae5;
            color: #065f46;
        }

        .status-processing {
            background: #fef3c7;
            color: #92400e;
        }

        @media (max-width: 768px) {
            .customer-sidebar {
                transform: translateX(-100%);
            }

            .main-content {
                margin-left: 0;
            }

            .customer-sidebar.show {
                transform: translateX(0);
            }
        }
    </style>
</head>
<body>
<!-- Sidebar -->
<div class="customer-sidebar">
    <div class="brand-wrapper">
        <h1 class="brand-title">LUXE FASHION</h1>
    </div>

    <div class="nav-section">
        <div class="nav-section-title">Shopping</div>
        <div class="nav-item">
            <a href="order.jsp" class="nav-link">
                <i class="fas fa-shopping-bag"></i>
                Shop
            </a>
        </div>
        <div class="nav-item">
            <a href="cart.jsp" class="nav-link">
                <i class="fas fa-shopping-cart"></i>
                Cart
            </a>
        </div>
        <div class="nav-item">
            <a href="wishlist.jsp" class="nav-link">
                <i class="fas fa-heart"></i>
                Wishlist
            </a>
        </div>
    </div>

    <div class="nav-section">
        <div class="nav-section-title">My Account</div>
        <div class="nav-item">
            <a href="#" class="nav-link active">
                <i class="fas fa-home"></i>
                Dashboard
            </a>
        </div>
        <div class="nav-item">
            <a href="user_category_list.jsp" class="nav-link">
                <i class="fas fa-map-marker-alt"></i>
                Categories
            </a>
        </div>
        <div class="nav-item">
            <a href="user_products_list.jsp" class="nav-link">
                <i class="fas fa-map-marker-alt"></i>
                Products
            </a>
        </div>

        <div class="nav-item">
            <a href="orders.jsp" class="nav-link">
                <i class="fas fa-box"></i>
                Orders
            </a>
        </div>
        <div class="nav-item">
            <a href="user_update.jsp" class="nav-link">
                <i class="fas fa-user"></i>
                Profile
            </a>
        </div>

    </div>

    <div class="nav-section">
        <div class="nav-section-title">Settings</div>
        <div class="nav-item">
            <a href="settings.jsp" class="nav-link">
                <i class="fas fa-cog"></i>
                Settings
            </a>
        </div>
        <div class="nav-item">
            <a href="logout" class="nav-link">
                <i class="fas fa-sign-out-alt"></i>
                Logout
            </a>
        </div>
    </div>
</div>

<!-- Main Content -->
<div class="main-content">
    <!-- Top Bar -->
    <div class="top-bar">
        <h2 class="welcome-text">Welcome back, John!</h2>
        <div class="customer-profile">
            <div class="customer-avatar">
                <i class="fas fa-user"></i>
            </div>
            <div class="customer-info">
                <p class="mb-0 fw-bold">John Doe</p>
                <small class="text-muted">Premium Member</small>
            </div>
        </div>
    </div>

    <!-- Order Summary -->
    <div class="order-summary">
        <div class="summary-card">
            <div class="summary-icon">
                <i class="fas fa-shopping-bag fa-lg"></i>
            </div>
            <div class="summary-title">Total Orders</div>
            <h3 class="summary-value">24</h3>
        </div>
        <div class="summary-card">
            <div class="summary-icon">
                <i class="fas fa-box fa-lg"></i>
            </div>
            <div class="summary-title">In Progress</div>
            <h3 class="summary-value">3</h3>
        </div>
        <div class="summary-card">
            <div class="summary-icon">
                <i class="fas fa-heart fa-lg"></i>
            </div>
            <div class="summary-title">Wishlist Items</div>
            <h3 class="summary-value">12</h3>
        </div>
        <div class="summary-card">
            <div class="summary-icon">
                <i class="fas fa-star fa-lg"></i>
            </div>
            <div class="summary-title">Reward Points</div>
            <h3 class="summary-value">2,450</h3>
        </div>
    </div>

    <!-- Recent Orders -->
    <div class="recent-orders">
        <h3 class="section-title">Recent Orders</h3>
        <div class="order-list">
            <div class="order-item">
                <img src="https://via.placeholder.com/80" class="order-image" alt="Product">
                <div class="order-details">
                    <p class="order-number">#ORD-2023-12-001</p>
                    <p class="order-date">December 1, 2023</p>
                    <p class="mb-0">Luxury Leather Bag</p>
                </div>
                <span class="order-status status-delivered">Delivered</span>
            </div>
            <div class="order-item">
                <img src="https://via.placeholder.com/80" class="order-image" alt="Product">
                <div class="order-details">
                    <p class="order-number">#ORD-2023-11-089</p>
                    <p class="order-date">November 28, 2023</p>
                    <p class="mb-0">Designer Watch</p>
                </div>
                <span class="order-status status-processing">Processing</span>
            </div>
            <div class="order-item">
                <img src="https://via.placeholder.com/80" class="order-image" alt="Product">
                <div class="order-details">
                    <p class="order-number">#ORD-2023-11-076</p>
                    <p class="order-date">November 25, 2023</p>
                    <p class="mb-0">Premium Sunglasses</p>
                </div>
                <span class="order-status status-delivered">Delivered</span>
            </div>
        </div>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Dashboard - Luxe Fashion</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet">
    <style>
        :root {
            --sidebar-width: 280px;
        }

        body {
            background-color: #f8f9fa;
            min-height: 100vh;
        }

        .admin-sidebar {
            width: var(--sidebar-width);
            background: #1a1c23;
            min-height: 100vh;
            position: fixed;
            left: 0;
            top: 0;
            z-index: 1000;
            transition: all 0.3s ease;
        }

        .brand-wrapper {
            padding: 1.5rem;
            border-bottom: 1px solid rgba(255,255,255,0.1);
        }

        .brand-title {
            color: white;
            font-size: 1.5rem;
            font-weight: 600;
            letter-spacing: 1px;
            margin: 0;
        }

        .nav-section {
            padding: 1rem 0;
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
            padding: 0.5rem 1.5rem;
            margin: 0.25rem 0;
        }

        .nav-link {
            color: #a0aec0;
            text-decoration: none;
            display: flex;
            align-items: center;
            padding: 0.75rem 1rem;
            border-radius: 0.5rem;
            transition: all 0.3s ease;
        }

        .nav-link:hover {
            background: rgba(255,255,255,0.1);
            color: white;
        }

        .nav-link.active {
            background: #3182ce;
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
            padding: 1rem 2rem;
            box-shadow: 0 2px 4px rgba(0,0,0,0.04);
            margin-bottom: 2rem;
            border-radius: 0.5rem;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .page-title {
            font-size: 1.5rem;
            font-weight: 600;
            margin: 0;
        }

        .admin-profile {
            display: flex;
            align-items: center;
            gap: 1rem;
        }

        .admin-avatar {
            width: 40px;
            height: 40px;
            border-radius: 50%;
            background: #e2e8f0;
            display: flex;
            align-items: center;
            justify-content: center;
        }

        .stats-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
            gap: 1.5rem;
            margin-bottom: 2rem;
        }

        .stat-card {
            background: white;
            border-radius: 0.5rem;
            padding: 1.5rem;
            box-shadow: 0 2px 4px rgba(0,0,0,0.04);
        }

        .stat-title {
            color: #6c757d;
            font-size: 0.875rem;
            margin-bottom: 0.5rem;
        }

        .stat-value {
            font-size: 1.5rem;
            font-weight: 600;
            margin-bottom: 0;
        }

        .stat-change {
            color: #38a169;
            font-size: 0.875rem;
        }

        .recent-activity {
            background: white;
            border-radius: 0.5rem;
            padding: 1.5rem;
            box-shadow: 0 2px 4px rgba(0,0,0,0.04);
        }

        .activity-title {
            font-size: 1.25rem;
            font-weight: 600;
            margin-bottom: 1.5rem;
        }

        .activity-list {
            list-style: none;
            padding: 0;
            margin: 0;
        }

        .activity-item {
            display: flex;
            align-items: center;
            padding: 1rem 0;
            border-bottom: 1px solid #e2e8f0;
        }

        .activity-icon {
            width: 40px;
            height: 40px;
            border-radius: 50%;
            background: #ebf8ff;
            color: #3182ce;
            display: flex;
            align-items: center;
            justify-content: center;
            margin-right: 1rem;
        }

        .activity-content {
            flex: 1;
        }

        .activity-text {
            margin: 0;
            color: #4a5568;
        }

        .activity-time {
            font-size: 0.875rem;
            color: #a0aec0;
        }

        @media (max-width: 768px) {
            .admin-sidebar {
                transform: translateX(-100%);
            }

            .main-content {
                margin-left: 0;
            }

            .admin-sidebar.show {
                transform: translateX(0);
            }
        }
    </style>
</head>
<body>
<!-- Sidebar -->
<div class="admin-sidebar">
    <div class="brand-wrapper">
        <h1 class="brand-title">LUXE FASHION</h1>
    </div>

    <div class="nav-section">
        <div class="nav-section-title">Main</div>
        <div class="nav-item">
            <a href="#" class="nav-link active">
                <i class="fas fa-home"></i>
                Dashboard
            </a>
        </div>
    </div>

    <div class="nav-section">
        <div class="nav-section-title">Management</div>
        <div class="nav-item">
            <a href="product.jsp" class="nav-link">
                <i class="fas fa-box"></i>
                Products
            </a>
        </div>
        <div class="nav-item">
            <a href="category.jsp" class="nav-link">
                <i class="fas fa-tags"></i>
                Categories
            </a>
        </div>
        <div class="nav-item">
            <a href="order-management.jsp" class="nav-link">
                <i class="fas fa-shopping-cart"></i>
                Orders
            </a>
        </div>
        <div class="nav-item">
            <a href="user-management.jsp" class="nav-link">
                <i class="fas fa-users"></i>
                Users
            </a>
        </div>
    </div>

    <div class="nav-section">
        <div class="nav-section-title">Settings</div>
        <div class="nav-item">
            <a href="#" class="nav-link">
                <i class="fas fa-cog"></i>
                Settings
            </a>
        </div>
        <div class="nav-item">
            <a href="index.jsp" class="nav-link">
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
        <h2 class="page-title">Dashboard</h2>
        <div class="admin-profile">
            <div class="admin-avatar">
                <i class="fas fa-user"></i>
            </div>
            <div class="admin-info">
                <p class="mb-0 fw-bold">Admin Name</p>
                <small class="text-muted">Administrator</small>
            </div>
        </div>
    </div>

    <!-- Stats Grid -->
    <div class="stats-grid">
        <div class="stat-card">
            <div class="stat-title">Total Sales</div>
            <h3 class="stat-value">$24,780</h3>
            <small class="stat-change">
                <i class="fas fa-arrow-up"></i> 12% from last month
            </small>
        </div>
        <div class="stat-card">
            <div class="stat-title">Total Orders</div>
            <h3 class="stat-value">156</h3>
            <small class="stat-change">
                <i class="fas fa-arrow-up"></i> 8% from last month
            </small>
        </div>
        <div class="stat-card">
            <div class="stat-title">Active Users</div>
            <h3 class="stat-value">2,459</h3>
            <small class="stat-change">
                <i class="fas fa-arrow-up"></i> 15% from last month
            </small>
        </div>
        <div class="stat-card">
            <div class="stat-title">Products</div>
            <h3 class="stat-value">384</h3>
            <small class="stat-change">
                <i class="fas fa-arrow-up"></i> 5% from last month
            </small>
        </div>
    </div>

    <!-- Recent Activity -->
    <div class="recent-activity">
        <h3 class="activity-title">Recent Activity</h3>
        <ul class="activity-list">
            <li class="activity-item">
                <div class="activity-icon">
                    <i class="fas fa-shopping-bag"></i>
                </div>
                <div class="activity-content">
                    <p class="activity-text">New order #1234 from John Doe</p>
                    <small class="activity-time">5 minutes ago</small>
                </div>
            </li>
            <li class="activity-item">
                <div class="activity-icon">
                    <i class="fas fa-user-plus"></i>
                </div>
                <div class="activity-content">
                    <p class="activity-text">New user registration</p>
                    <small class="activity-time">1 hour ago</small>
                </div>
            </li>
            <li class="activity-item">
                <div class="activity-icon">
                    <i class="fas fa-box"></i>
                </div>
                <div class="activity-content">
                    <p class="activity-text">Product "Luxury Handbag" updated</p>
                    <small class="activity-time">2 hours ago</small>
                </div>
            </li>
            <li class="activity-item">
                <div class="activity-icon">
                    <i class="fas fa-star"></i>
                </div>
                <div class="activity-content">
                    <p class="activity-text">New review on "Designer Watch"</p>
                    <small class="activity-time">3 hours ago</small>
                </div>
            </li>
        </ul>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
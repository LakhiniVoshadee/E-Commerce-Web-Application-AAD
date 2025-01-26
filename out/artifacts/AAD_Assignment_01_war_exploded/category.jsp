<%@ page import="lk.ijse.aadassignment01.dto.CategoryDTO" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Luxury Fashion Category Management</title>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.2/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css" rel="stylesheet">
    <style>
        :root {
            --light-gray: #f1f1f1;
            --light-blue: #e0f7fa;
            --dark-gray: #333333;
            --medium-gray: #777777;
            --rich-white: #ffffff;
            --light-black: #242424;
            --highlight: #00bcd4;
        }

        body {
            background-color: var(--light-gray);
            color: var(--dark-gray);
            font-family: 'Arial', sans-serif;
        }

        .navbar {
            background-color: var(--light-blue);
            border-bottom: 1px solid rgba(0, 0, 0, 0.1);
            padding: 1rem 0;
        }

        .navbar-brand {
            font-size: 1.8rem;
            font-weight: 400;
            color: var(--dark-gray) !important;
        }

        .dashboard-header {
            background: url('/api/placeholder/1920/300') center/cover;
            position: relative;
            padding: 4rem 0;
            margin-bottom: 2rem;
            box-shadow: inset 0 0 100px rgba(0, 0, 0, 0.6);
        }

        .dashboard-header-content {
            position: relative;
            z-index: 1;
        }

        .card {
            background-color: var(--rich-white);
            border: 1px solid rgba(0, 0, 0, 0.1);
            border-radius: 15px;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.1);
        }

        .card-header {
            background-color: var(--light-gray);
            border-bottom: 1px solid rgba(0, 0, 0, 0.1);
            padding: 1.5rem;
            border-radius: 15px 15px 0 0;
        }

        .btn-dark {
            background-color: var(--highlight);
            color: var(--rich-white);
            border: none;
            padding: 0.8rem 1.5rem;
            font-weight: 500;
            letter-spacing: 1px;
            transition: all 0.3s ease;
        }

        .btn-dark:hover {
            background-color: var(--light-blue);
            transform: translateY(-2px);
        }

        .form-control {
            background-color: var(--light-gray);
            border: 1px solid rgba(0, 0, 0, 0.1);
            color: var(--dark-gray);
            padding: 0.8rem;
            border-radius: 8px;
        }

        .form-control:focus {
            background-color: var(--light-gray);
            border-color: var(--highlight);
            box-shadow: none;
        }

        .modal-content {
            background-color: var(--rich-white);
            border: 1px solid rgba(0, 0, 0, 0.1);
            border-radius: 15px;
        }

        .modal-header {
            background-color: var(--light-gray);
            padding: 1.5rem;
        }

        .modal-footer {
            background-color: var(--light-gray);
            padding: 1.5rem;
        }

        .stats-container {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
            gap: 1.5rem;
            margin-bottom: 2rem;
        }

        .stat-card {
            background-color: var(--light-blue);
            padding: 1.5rem;
            border-radius: 12px;
            border: 1px solid rgba(0, 0, 0, 0.1);
        }

        .stat-number {
            font-size: 2rem;
            font-weight: 300;
            color: var(--dark-gray);
        }

        .stat-label {
            color: var(--medium-gray);
            font-size: 0.9rem;
            letter-spacing: 1px;
            text-transform: uppercase;
        }

        .category-grid {
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(300px, 1fr));
            gap: 2rem;
            padding: 1rem;
        }

        .category-card {
            background-color: var(--light-gray);
            border-radius: 12px;
            overflow: hidden;
            transition: all 0.3s ease;
        }

        .category-card:hover {
            transform: translateY(-10px);
            box-shadow: 0 15px 30px rgba(0, 0, 0, 0.1);
        }

        .category-image {
            height: 200px;
            background: url('/api/placeholder/400/200') center/cover;
            position: relative;
        }

        .category-image::after {
            content: '';
            position: absolute;
            bottom: 0;
            left: 0;
            right: 0;
            height: 50%;
            background: linear-gradient(to top, rgba(0, 0, 0, 0.4), transparent);
        }

        .category-content {
            padding: 1.5rem;
        }

        .category-id {
            color: var(--medium-gray);
            font-size: 0.9rem;
            letter-spacing: 1px;
        }

        .category-actions {
            display: flex;
            gap: 1rem;
            margin-top: 1rem;
        }

        .action-btn {
            padding: 0.5rem 1rem;
            border-radius: 6px;
            font-size: 0.9rem;
            transition: all 0.3s ease;
        }

        @media (max-width: 768px) {
            .navbar-brand {
                font-size: 1.4rem;
            }

            .dashboard-header {
                padding: 2rem 0;
            }

            .stats-container {
                grid-template-columns: 1fr;
            }
        }
    </style>
</head>
<body>

<!-- Navbar -->
<nav class="navbar navbar-expand-lg navbar-light">
    <div class="container">
        <span class="navbar-brand">LUXE FASHION ADMIN</span>
    </div>
</nav>

<!-- Dashboard Header -->
<div class="dashboard-header">
    <div class="container dashboard-header-content">
        <h1 class="display-4 mb-3">Category Management</h1>
        <p class="lead mb-0">Manage your luxury fashion collections with style</p>
    </div>
</div>

<!-- Stats -->
<div class="container">
    <div class="stats-container">
        <div class="stat-card">
            <div class="stat-number">24</div>
            <div class="stat-label">Total Categories</div>
        </div>
        <div class="stat-card">
            <div class="stat-number">1.2K</div>
            <div class="stat-label">Total Products</div>
        </div>
        <div class="stat-card">
            <div class="stat-number">89%</div>
            <div class="stat-label">Active Categories</div>
        </div>
    </div>

    <div class="card">
        <div class="card-header d-flex justify-content-between align-items-center">
            <h5 class="mb-0">Category Management</h5>
            <button class="btn btn-dark" data-bs-toggle="modal" data-bs-target="#categoryModal">
                <i class="fas fa-plus me-2"></i>Add Category
            </button>
        </div>
        <a href="category_list">Load All Categories</a><br>
        <a href="category_update.jsp">Update Collection</a><br>
        <a href="category_delete.jsp">Delete Collection</a>
    </div>
</div>

<!-- Add/Edit Category Modal -->
<div class="modal fade" id="categoryModal" tabindex="-1">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">Add Category</h5>
                <button type="button" class="btn-close btn-close-white" data-bs-dismiss="modal"></button>
            </div>
            <div class="modal-body">
                <form id="categoryForm" action="category-save" method="post">
                    <div class="mb-3">
                        <label class="form-label" for="category_name">Name</label>
                        <input type="text" class="form-control" name="name" id="category_name" required>
                    </div>
                    <div class="mb-3">
                        <label class="form-label" for="category_description">Description</label>
                        <textarea class="form-control" rows="3" name="description" id="category_description" required></textarea>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-outline-dark" data-bs-dismiss="modal">Cancel</button>
                        <button type="submit" class="btn btn-dark">Save Category</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>

<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.2/js/bootstrap.bundle.min.js"></script>
</body>
</html>

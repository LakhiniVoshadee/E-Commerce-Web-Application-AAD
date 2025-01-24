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
            --dark-black: #0a0a0a;
            --medium-black: #1a1a1a;
            --light-black: #2a2a2a;
            --dark-gray: #333333;
            --medium-gray: #666666;
            --light-gray: #999999;
            --off-white: #f5f5f5;
        }

        body {
            background-color: var(--dark-black);
            color: var(--off-white);
            font-family: 'Arial', sans-serif;
        }

        .navbar {
            background: linear-gradient(to right, var(--dark-black), var(--medium-black));
            border-bottom: 1px solid rgba(255,255,255,0.1);
            padding: 1rem 0;
        }

        .navbar-brand {
            font-size: 1.8rem;
            letter-spacing: 3px;
            font-weight: 300;
            color: var(--off-white) !important;
        }

        .dashboard-header {
            background: url('/api/placeholder/1920/300') center/cover;
            position: relative;
            padding: 4rem 0;
            margin-bottom: 2rem;
        }

        .dashboard-header::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            right: 0;
            bottom: 0;
            background: linear-gradient(45deg, rgba(0,0,0,0.9), rgba(0,0,0,0.6));
        }

        .dashboard-header-content {
            position: relative;
            z-index: 1;
        }

        .card {
            background: var(--medium-black);
            border: 1px solid rgba(255,255,255,0.1);
            border-radius: 15px;
            box-shadow: 0 10px 30px rgba(0,0,0,0.2);
        }

        .card-header {
            background: var(--light-black);
            border-bottom: 1px solid rgba(255,255,255,0.1);
            padding: 1.5rem;
            border-radius: 15px 15px 0 0;
        }

        .btn-dark {
            background: var(--off-white);
            color: var(--dark-black);
            border: none;
            padding: 0.8rem 1.5rem;
            font-weight: 500;
            letter-spacing: 1px;
            transition: all 0.3s ease;
        }

        .btn-dark:hover {
            background: var(--light-gray);
            transform: translateY(-2px);
        }

        .modal-content {
            background: var(--medium-black);
            border: 1px solid rgba(255,255,255,0.1);
            border-radius: 15px;
        }

        .modal-header {
            border-bottom: 1px solid rgba(255,255,255,0.1);
            padding: 1.5rem;
        }

        .modal-footer {
            border-top: 1px solid rgba(255,255,255,0.1);
            padding: 1.5rem;
        }

        .form-control {
            background: var(--light-black);
            border: 1px solid rgba(255,255,255,0.1);
            color: var(--off-white);
            padding: 0.8rem;
            border-radius: 8px;
        }

        .form-control:focus {
            background: var(--light-black);
            border-color: var(--light-gray);
            color: var(--off-white);
            box-shadow: none;
        }

        .form-label {
            color: var(--light-gray);
            font-weight: 500;
            margin-bottom: 0.5rem;
        }

        .stats-container {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
            gap: 1.5rem;
            margin-bottom: 2rem;
        }

        .stat-card {
            background: linear-gradient(45deg, var(--medium-black), var(--light-black));
            padding: 1.5rem;
            border-radius: 12px;
            border: 1px solid rgba(255,255,255,0.1);
        }

        .stat-number {
            font-size: 2rem;
            font-weight: 300;
            color: var(--off-white);
        }

        .stat-label {
            color: var(--light-gray);
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
            background: var(--medium-black);
            border-radius: 12px;
            overflow: hidden;
            transition: all 0.3s ease;
        }

        .category-card:hover {
            transform: translateY(-10px);
            box-shadow: 0 15px 30px rgba(0,0,0,0.3);
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
            background: linear-gradient(to top, var(--medium-black), transparent);
        }

        .category-content {
            padding: 1.5rem;
        }

        .category-id {
            color: var(--light-gray);
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
<nav class="navbar navbar-expand-lg navbar-dark">
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
        <div class="card-header d-flex justify-content-between align-M
      items-center">
            <h5 class="mb-0">Category Management</h5>
            <button class="btn btn-dark" data-bs-toggle="modal" data-bs-target="#categoryModal">
                <i class="fas fa-plus me-2"></i>Add Category
            </button>
        </div>
        <a href="category_list">Load All Customers</a><br>
        <a href="category_update.jsp">Update Collection</a>
        <a href="category_delete.jsp">Delete Collection</a>
        <%--<div class="card-body">
            <div class="category-grid">
                <%
                    List<CategoryDTO> categoryDataList = (List<CategoryDTO>) request.getAttribute("categories");
                    if (categoryDataList != null && !categoryDataList.isEmpty()) {
                        for (CategoryDTO categoryDTO : categoryDataList) {
                %>
                <div class="category-card">
                    <div class="category-image"></div>
                    <div class="category-content">
                        <div class="category-id">ID: <%= categoryDTO.getCategory_id() %></div>
                        <h4 class="mt-2 mb-3"><%= categoryDTO.getName() %></h4>
                        <p class="text-muted mb-3"><%= categoryDTO.getDescription() %></p>
                        <div class="category-actions">
                            <button class="btn btn-outline-light action-btn">
                                <i class="fas fa-edit me-2"></i>Edit
                            </button>
                            <button class="btn btn-outline-danger action-btn">
                                <i class="fas fa-trash me-2"></i>Delete
                            </button>
                        </div>
                    </div>
                </div>
                <%
                        }
                    }
                %>
            </div>
        </div>--%>
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
                        <button type="button" class="btn btn-outline-light" data-bs-dismiss="modal">Cancel</button>
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
<%--
  Created by IntelliJ IDEA.
  User: Voshadee
  Date: 1/12/2025
  Time: 7:28 PM
  To change this template use File | Settings | File Templates.
--%>
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
        body {
            background-color: #f8f9fa;
        }
        .navbar-brand {
            font-size: 1.5rem;
            letter-spacing: 1px;
        }
        .card {
            border: none;
            box-shadow: 0 0 15px rgba(0,0,0,0.1);
        }
        .table th {
            font-weight: 600;
            text-transform: uppercase;
            font-size: 0.85rem;
            letter-spacing: 0.5px;
        }
        .btn-dark {
            letter-spacing: 0.5px;
        }
        .modal-content {
            border-radius: 0;
        }
        .category-image {
            width: 80px;
            height: 80px;
            object-fit: cover;
        }
    </style>
</head>
<body>
<%
    String message = request.getParameter("message");
    String error = request.getParameter("error");
%>

<%
    if (message!=null){
%>
<div style="color: green"><%=message%></div>
<%
    }
%>

<%
    if (error!=null){
%>
<div style="color: red"><%=error%></div>
<%
    }
%>
<!-- Navbar -->
<nav class="navbar navbar-expand-lg navbar-dark bg-dark mb-4">
    <div class="container">
        <span class="navbar-brand">LUXE FASHION ADMIN</span>
    </div>
</nav>

<!-- Main Content -->
<div class="container">
    <div class="card">
        <div class="card-header bg-white py-3 d-flex justify-content-between align-items-center">
            <h5 class="mb-0">Category Management</h5>
            <button class="btn btn-dark" data-bs-toggle="modal" data-bs-target="#categoryModal">
                <i class="fas fa-plus me-2"></i>Add Category
            </button>
        </div>
        <div class="card-body">
            <div class="table-responsive">
                <table class="table table-hover" id="categoryTable" class="category-table">
                    <thead>
                    <tr>
                        <th>Category ID</th>
                       <%-- <th>Image</th>--%>
                        <th>Name</th>
                        <th>Description</th>
                        <th>Actions</th>
                    </tr>
                    </thead>
                    <tbody id="category-table-list">
                   <%-- <tr>
                        <td>CAT001</td>
                        <td><img src="" alt="Luxury Wear" class="category-image"></td>
                        <td>Luxury Wear</td>
                        <td>Premium designer clothing collection</td>
                        <td>
                            <button class="btn btn-sm btn-outline-dark me-2">
                                <i class="fas fa-edit"></i>
                            </button>
                            <button class="btn btn-sm btn-outline-danger">
                                <i class="fas fa-trash"></i>
                            </button>
                        </td>
                    </tr>
                    <tr>
                        <td>CAT002</td>
                        <td><img src="" alt="Accessories" class="category-image"></td>
                        <td>Accessories</td>
                        <td>High-end fashion accessories</td>
                        <td>
                            <button class="btn btn-sm btn-outline-dark me-2">
                                <i class="fas fa-edit"></i>
                            </button>
                            <button class="btn btn-sm btn-outline-danger">
                                <i class="fas fa-trash"></i>
                            </button>
                        </td>
                    </tr>--%>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>

<!-- Add/Edit Category Modal -->
<div class="modal fade" id="categoryModal" tabindex="-1">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">Add Category</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
            </div>
            <div class="modal-body">
                <form id="categoryForm" action="category-save" method="post">
                    <%--<div class="mb-3">
                        <label class="form-label">Category ID</label>
                        <input type="text" class="form-control" required>
                    </div>--%>
                    <div class="mb-3">
                        <label class="form-label" for="category_name">Name</label>
                        <input type="text" class="form-control" name="name" id="category_name" required>
                    </div>
                    <div class="mb-3">
                        <label class="form-label" for="category_description">Description</label>
                        <textarea class="form-control" rows="3" name="description" id="category_description" required></textarea>
                    </div>
                    <<%--div class="mb-3">
                        <label class="form-label">Image</label>
                        <input type="file" class="form-control" accept="image/*" required>
                    </div>--%>

                        <div class="modal-footer">
                            <button type="button" class="btn btn-outline-dark" data-bs-dismiss="modal">Cancel</button>
                            <button type="submit" class="btn btn-dark">Save Category</button>
                        </div>
                </form>
            </div>
           <%-- <div class="modal-footer">
                <button type="button" class="btn btn-outline-dark" data-bs-dismiss="modal">Cancel</button>
                <button type="submit" class="btn btn-dark">Save Category</button>
            </div>--%>
        </div>
    </div>
</div>

<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.2/js/bootstrap.bundle.min.js"></script>
</body>
</html>

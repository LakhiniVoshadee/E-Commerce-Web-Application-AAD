<%@ page import="javax.sql.DataSource" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.SQLException" %><%--
  Created by IntelliJ IDEA.
  User: Voshadee
  Date: 1/12/2025
  Time: 7:19 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.*, javax.naming.*, javax.sql.DataSource" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Luxury Fashion Product Management</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet">
    <style>
        body {
            background-color: #f8f9fa;
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

        .product-card {
            transition: transform 0.2s ease, box-shadow 0.2s ease;
            border: 1px solid rgba(0,0,0,0.1);
        }

        .product-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 5px 15px rgba(0,0,0,0.1);
        }

        .product-actions {
            opacity: 0.7;
            transition: opacity 0.2s ease;
        }

        .product-card:hover .product-actions {
            opacity: 1;
        }

        .product-id {
            font-size: 0.875rem;
            color: #6c757d;
        }

        .product-image {
            height: 200px;
            object-fit: cover;
            width: 100%;
            background-color: #f8f9fa;
        }
        .product-price {
            font-size: 1.25rem;
            font-weight: 600;
            color: #198754;
        }
        .stock-badge {
            position: absolute;
            top: 10px;
            right: 10px;
            background: rgba(0,0,0,0.7);
            color: white;
            padding: 4px 8px;
            border-radius: 4px;
            font-size: 0.875rem;
        }
    </style>
</head>
<body>

<!-- Navbar -->
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
<br>
<br>
<br>
<br>

<div class="container">
    <span class="navbar-brand">LUXE FASHION ADMIN</span>
</div>
<%--<nav class="navbar navbar-expand-lg navbar-dark bg-dark mb-4">
    <div class="container">
        <span class="navbar-brand">LUXE FASHION ADMIN</span>
    </div>
</nav>--%>

<!-- Main Content -->
<div class="container">
    <div class="card">
        <div class="card-header bg-white py-3 d-flex justify-content-between align-items-center">
            <h5 class="mb-0">Product Management</h5>
            <button class="btn btn-dark" data-bs-toggle="modal" data-bs-target="#productModal">
                <i class="fas fa-plus me-2"></i>Add Product
            </button>
        </div>
        <div class="container py-4">
            <h2 class="mb-4">Products</h2>
            <div class="row g-4">
                <!-- Product Card Template -->

                    <a href="product_list">Load Products</a>


            </div>
        </div>
    </div>
</div>

<!-- Add/Edit Product Modal -->
<div class="modal fade" id="productModal" tabindex="-1">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">Add Product</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
            </div>
            <div class="modal-body">
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
                <form id="productForm" action="product-save" method="post">
                    <input type="hidden" name="product_id" id="product_id">
                    <div class="mb-3">
                        <label class="form-label" for="product_name">Product Name</label>
                        <input type="text" class="form-control" name="product_name" id="product_name" required>
                    </div>
                    <div class="mb-3">
                        <label class="form-label" for="description">Description</label>
                        <textarea class="form-control" rows="3" name="description" id="description" required></textarea>
                    </div>
                    <div class="mb-3">
                        <label class="form-label" for="unit_price">Unit Price</label>
                        <div class="input-group">
                            <span class="input-group-text">$</span>
                            <input type="number" class="form-control" name="unit_price" id="unit_price" step="0.01" required>
                        </div>
                    </div>
                    <div class="mb-3">
                        <label class="form-label" for="stock">Stock</label>
                        <input type="number" class="form-control" name="stock" id="stock" required min="0">
                    </div>
                    <div class="mb-3">
                        <label class="form-label" for="category_id">Category ID</label>
                        <%@ page import="java.sql.*, javax.naming.*, javax.sql.DataSource" %>

                        <select class="form-select" name="category_id" id="category_id" required>
                            <option value="">Select Category</option>
                            <%-- Dynamic Category Dropdown --%>
                            <%
                                DataSource ds = null;
                                Connection connection = null;
                                PreparedStatement preparedStatement = null;
                                ResultSet resultSet = null;

                                try {
                                    // Use JNDI to look up the DataSource
                                    Context initContext = new InitialContext();
                                    Context envContext = (Context) initContext.lookup("java:comp/env");
                                    ds = (DataSource) envContext.lookup("jdbc/pool");

                                    connection = ds.getConnection();
                                    String query = "SELECT category_id, name FROM categories";
                                    preparedStatement = connection.prepareStatement(query);
                                    resultSet = preparedStatement.executeQuery();

                                    while (resultSet.next()) {
                                        int id = resultSet.getInt("category_id");
                                        String name = resultSet.getString("name");
                            %>
                            <option value="<%= id %>"><%= name %></option>
                            <%
                                    }
                                } catch (Exception e) {
                                    e.printStackTrace();
                                } finally {
                                    if (resultSet != null) try { resultSet.close(); } catch (SQLException e) { e.printStackTrace(); }
                                    if (preparedStatement != null) try { preparedStatement.close(); } catch (SQLException e) { e.printStackTrace(); }
                                    if (connection != null) try { connection.close(); } catch (SQLException e) { e.printStackTrace(); }
                                }
                            %>
                        </select>


                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-outline-dark" data-bs-dismiss="modal">Cancel</button>
                        <button type="submit" class="btn btn-dark">Save Product</button>
                    </div>


                </form>
            </div>
        </div>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>User Registration</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.0/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background-color: #f4f4f4;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
        }
        .registration-container {
            background-color: #ffffff;
            border-radius: 10px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            padding: 40px;
            width: 100%;
            max-width: 500px;
        }
        .form-control {
            background-color: #f8f9fa;
            border: 1px solid #ced4da;
        }
        .form-control:focus {
            background-color: #ffffff;
            border-color: #495057;
            box-shadow: none;
        }
        .btn-primary {
            background-color: #343a40;
            border-color: #212529;
            transition: all 0.3s ease;
        }
        .btn-primary:hover {
            background-color: #212529;
            border-color: #000000;
        }
        .nav-links {
            margin-top: 20px;
            display: flex;
            justify-content: space-between;
        }
        .status-message {
            margin-bottom: 20px;
        }
    </style>
</head>
<body>
<div class="container">
    <div class="registration-container">
        <h2 class="text-center mb-4">User Registration</h2>

        <!-- Status Messages -->
        <%
            String message = request.getParameter("message");
            String error = request.getParameter("error");
        %>

        <% if (message != null) { %>
        <div class="alert alert-success status-message" role="alert">
            <%= message %>
        </div>
        <% } %>

        <% if (error != null) { %>
        <div class="alert alert-danger status-message" role="alert">
            <%= error %>
        </div>
        <% } %>

        <!-- Registration Form -->
        <form action="user-register" method="post">
            <div class="mb-3">
                <label for="name" class="form-label">User Name</label>
                <input type="text" class="form-control" id="name" name="name" required>
            </div>

            <div class="mb-3">
                <label for="password" class="form-label">Password</label>
                <input type="password" class="form-control" id="password" name="address" required>
            </div>

            <div class="mb-3">
                <label for="email" class="form-label">Email</label>
                <input type="email" class="form-control" id="email" name="email" required>
            </div>

            <div class="mb-3">
                <label for="active" class="form-label">Active Status</label>
                <select class="form-select" id="active" name="active" required>
                    <option value="">Select Status</option>
                    <option value="1">Active</option>
                    <option value="0">Inactive</option>
                </select>
            </div>

            <button type="submit" class="btn btn-primary w-100 mb-3">Save User</button>

            <%--<div class="nav-links">
                <a href="user_list" class="btn btn-outline-secondary">Load Users</a>
                <a href="user_update.jsp" class="btn btn-outline-secondary">Update Users</a>
                <a href="user_delete.jsp" class="btn btn-outline-secondary">Delete Users</a>
            </div>--%>
        </form>
    </div>
</div>

<!-- Bootstrap JS (optional, but recommended for future interactions) -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.0/js/bootstrap.bundle.min.js"></script>
</body>
</html>
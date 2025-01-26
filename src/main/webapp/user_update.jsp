<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>User Update</title>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.2/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700&display=swap" rel="stylesheet">
    <style>
        :root {
            --light-gray: #f8f9fa;
            --medium-gray: #6c757d;
            --dark-gray: #343a40;
            --white: #ffffff;
            --highlight: #212529;
        }

        body {
            background-color: var(--light-gray);
            color: var(--dark-gray);
            font-family: 'Inter', sans-serif;
        }

        .container {
            max-width: 600px;
            margin: 4rem auto;
            background: var(--white);
            padding: 2rem;
            border-radius: 0.5rem;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
        }

        .form-label {
            font-weight: 600;
        }

        .btn-primary {
            background-color: var(--dark-gray);
            border: none;
        }

        .btn-primary:hover {
            background-color: var(--medium-gray);
        }

        .form-control:focus {
            border-color: var(--dark-gray);
            box-shadow: 0 0 0 0.2rem rgba(52, 58, 64, 0.25);
        }

        .alert {
            margin-bottom: 1.5rem;
        }
    </style>
</head>
<body>
<div class="container">
    <h1 class="mb-4 text-center">Update User Profile</h1>

    <% String message = request.getParameter("message"); %>
    <% String error = request.getParameter("error"); %>

    <% if (message != null) { %>
    <div class="alert alert-success" role="alert">
        <%= message %>
    </div>
    <% } %>

    <% if (error != null) { %>
    <div class="alert alert-danger" role="alert">
        <%= error %>
    </div>
    <% } %>

    <form action="user-update" method="post">
        <div class="mb-3">
            <label for="user_id" class="form-label">User ID</label>
            <input type="text" class="form-control" id="user_id" name="user_id" required>
        </div>

        <div class="mb-3">
            <label for="user_name" class="form-label">User Name</label>
            <input type="text" class="form-control" id="user_name" name="user_name" required>
        </div>

        <div class="mb-3">
            <label for="password" class="form-label">Password</label>
            <input type="password" class="form-control" id="password" name="password" required>
        </div>

        <div class="mb-3">
            <label for="email" class="form-label">Email</label>
            <input type="email" class="form-control" id="email" name="email" required>
        </div>

        <div class="mb-3">
            <label for="active" class="form-label">Status</label>
            <select class="form-select" id="active" name="active" required>
                <option value="active">Active</option>
                <option value="inactive">Inactive</option>
            </select>
        </div>

        <button type="submit" class="btn btn-primary w-100">Update User</button>
    </form>
</div>

<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.2/js/bootstrap.bundle.min.js"></script>
</body>
</html>

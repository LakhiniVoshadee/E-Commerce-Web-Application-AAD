<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>User Delete</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://kit.fontawesome.com/a076d05399.js"></script>
    <style>
        body {
            background-color: #ffffff;
            font-family: 'Arial', sans-serif;
            color: #000;
            padding: 30px;
        }

        .container {
            max-width: 600px;
            margin: 0 auto;
            background-color: #ffffff;
            padding: 30px;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        h1 {
            text-align: center;
            font-weight: 600;
            color: #000;
        }

        .form-label {
            font-weight: bold;
            color: #000;
        }

        .form-control {
            background-color: #f9f9f9;
            border: 1px solid #ccc;
            color: #000;
            border-radius: 5px;
            padding: 10px;
            margin-bottom: 15px;
        }

        .form-control:focus {
            background-color: #fff;
            border-color: #007bff;
            color: #000;
        }

        button[type="submit"] {
            background-color: #000;
            color: #fff;
            padding: 10px 20px;
            border: none;
            border-radius: 20px;
            width: 100%;
            cursor: pointer;
            transition: all 0.3s;
        }

        button[type="submit"]:hover {
            background-color: #333;
        }

        .message, .error {
            text-align: center;
            margin-bottom: 15px;
            font-size: 1.1rem;
        }

        .message {
            color: #2ecc71; /* Green */
        }

        .error {
            color: #e74c3c; /* Red */
        }
    </style>
</head>
<body>

<div class="container">
    <h1>Delete User</h1>

    <%
        String message = request.getParameter("message");
        String error = request.getParameter("error");
    %>

    <% if (message != null) { %>
    <div class="message"><%= message %></div>
    <% } %>

    <% if (error != null) { %>
    <div class="error"><%= error %></div>
    <% } %>

    <form action="user-delete" method="post">
        <div class="mb-3">
            <label for="user_id" class="form-label">User ID:</label>
            <input type="text" id="user_id" name="user_id" class="form-control" required>
        </div>

        <button type="submit">Delete Customer</button>
    </form>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>

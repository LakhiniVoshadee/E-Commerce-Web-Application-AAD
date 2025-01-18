<%--
  Created by IntelliJ IDEA.
  User: Voshadee
  Date: 1/12/2025
  Time: 7:33 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>


<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>LUXE - Fashion Authentication</title>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.0/css/bootstrap.min.css" rel="stylesheet">
    <style>
        :root {
            --primary-black: #14171A;
            --light-gray: #f8f9fa;
            --dark-gray: #343a40;
        }

        body {
            background-color: var(--light-gray);
            font-family: 'Inter', sans-serif;
            height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
        }

        .auth-container {
            width: 100%;
            max-width: 420px;
            padding: 2rem;
            background: white;
            border-radius: 12px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
        }

        .form-title {
            font-size: 1.75rem;
            font-weight: 600;
            color: var(--primary-black);
            margin-bottom: 0.5rem;
        }

        .form-subtitle {
            color: #6c757d;
            margin-bottom: 2rem;
        }

        .nav-tabs {
            border: none;
            margin-bottom: 2rem;
            background: var(--light-gray);
            border-radius: 8px;
            padding: 0.5rem;
        }

        .nav-tabs .nav-link {
            border: none;
            color: #6c757d;
            border-radius: 6px;
            padding: 0.75rem 1.5rem;
            font-weight: 500;
        }

        .nav-tabs .nav-link.active {
            background: white;
            color: var(--primary-black);
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.05);
        }

        .form-control {
            padding: 0.75rem 1rem;
            border: 1px solid #dee2e6;
            border-radius: 8px;
            margin-bottom: 1rem;
        }

        .form-control:focus {
            border-color: var(--dark-gray);
            box-shadow: none;
        }

        .btn-primary {
            background: var(--primary-black);
            border: none;
            padding: 0.75rem;
            border-radius: 8px;
            font-weight: 500;
            margin-top: 1rem;
            width: 100%;
        }

        .btn-primary:hover {
            background: var(--dark-gray);
        }

        .form-text {
            text-align: center;
            margin-top: 1rem;
        }

        .form-text a {
            color: var(--primary-black);
            text-decoration: none;
            font-weight: 500;
        }

        .input-icon {
            position: relative;
        }

        .input-icon i {
            position: absolute;
            top: 50%;
            transform: translateY(-50%);
            left: 1rem;
            color: #6c757d;
        }

        .input-icon input {
            padding-left: 2.5rem;
        }
    </style>
</head>
<body>
<!-- Login Form -->
<div class="auth-container" id="loginForm">
    <h1 class="form-title">Welcome to LUXE</h1>
    <p class="form-subtitle">Sign in to your account</p>

    <ul class="nav nav-tabs w-100">
        <li class="nav-item flex-fill">
            <a class="nav-link active text-center" href="#" onclick="showLogin()">Login</a>
        </li>
        <li class="nav-item flex-fill">
            <a class="nav-link text-center" href="#" onclick="showRegister()">Register</a>
        </li>
    </ul>

    <form id="loginFormFields">
        <div class="input-icon">
            <i class="bi bi-envelope"></i>
            <input type="email" class="form-control" placeholder="Enter your email" required>
        </div>
        <div class="input-icon">
            <i class="bi bi-lock"></i>
            <input type="password" class="form-control" placeholder="Enter your password" required>
        </div>
        <button type="submit" class="btn btn-primary">Sign In</button>
    </form>
</div>

<!-- Register Form -->
<div class="auth-container" id="registerForm" style="display: none;">
    <h1 class="form-title">Join LUXE</h1>
    <p class="form-subtitle">Create a new account</p>

    <ul class="nav nav-tabs w-100">
        <li class="nav-item flex-fill">
            <a class="nav-link text-center" href="#" onclick="showLogin()">Login</a>
        </li>
        <li class="nav-item flex-fill">
            <a class="nav-link active text-center" href="#" onclick="showRegister()">Register</a>
        </li>
    </ul>

    <%
        String message = request.getAttribute("message") != null ? (String) request.getAttribute("message") : null;
        String error = request.getAttribute("error") != null ? (String) request.getAttribute("error") : null;
    %>
    <% if (message != null) { %>
    <div class="alert alert-success"><%= message %></div>
    <% } %>
    <% if (error != null) { %>
    <div class="alert alert-danger"><%= error %></div>
    <% } %>

    <form id="registerFormFields">
        <div class="input-icon">
            <i class="bi bi-person"></i>
            <input type="text" class="form-control" placeholder="Choose a username" required>
        </div>
        <div class="input-icon">
            <i class="bi bi-envelope"></i>
            <input type="email" class="form-control" placeholder="Enter your email" required>
        </div>
        <div class="input-icon">
            <i class="bi bi-lock"></i>
            <input type="password" class="form-control" placeholder="Create a password" required>
        </div>
        <div class="input-icon">
            <i class="bi bi-lock-fill"></i>
            <input type="password" class="form-control" placeholder="Confirm your password" required>
        </div>
        <button type="submit" class="btn btn-primary">Create Account</button>
    </form>
</div>

<script>
    <% if (message != null) { %>
    Swal.fire({
        icon: 'success',
        title: 'Success',
        text: '<%= message %>',
    });
    <% } else if (error != null) { %>
    Swal.fire({
        icon: 'error',
        title: 'Error',
        text: '<%= error %>',
    });
    <% } %>
    function showLogin() {
        document.getElementById('loginForm').style.display = 'block';
        document.getElementById('registerForm').style.display = 'none';
    }

    function showRegister() {
        document.getElementById('loginForm').style.display = 'none';
        document.getElementById('registerForm').style.display = 'block';
    }

    // Form validation and submission
    document.getElementById('loginFormFields').addEventListener('submit', function(e) {
        e.preventDefault();
        // Add your login logic here
    });

    document.getElementById('registerFormFields').addEventListener('submit', function(e) {
        e.preventDefault();
        // Add your registration logic here
    });
</script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.0/js/bootstrap.bundle.min.js"></script>
</body>

</html>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Fashion Store Registration</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background-image: url('/api/placeholder/1600/900');
            background-size: cover;
            background-position: center;
            min-height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
            font-family: 'Helvetica Neue', Arial, sans-serif;
            position: relative;
        }
        body::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            right: 0;
            bottom: 0;
            background: rgba(255,255,255,0.7);
        }
        .registration-container {
            background-color: white;
            border-radius: 15px;
            box-shadow: 0 15px 35px rgba(0,0,0,0.1);
            max-width: 450px;
            width: 100%;
            padding: 30px;
            position: relative;
            z-index: 10;
        }
        .form-control, .form-select {
            background-color: #f8f9fa;
            border: 1px solid #d1d1d1;
            transition: all 0.3s ease;
        }
        .form-control:focus, .form-select:focus {
            background-color: white;
            border-color: #000;
            box-shadow: 0 0 0 0.2rem rgba(0,0,0,0.1);
        }
        .btn-custom {
            background-color: #000;
            color: white;
            transition: all 0.3s ease;
        }
        .btn-custom:hover {
            background-color: #333;
            transform: translateY(-2px);
        }
        .form-label {
            color: #666;
            font-weight: 500;
        }
    </style>
</head>
<body>
<div class="registration-container">
    <form action="user-register" method="post">
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
            <label for="active" class="form-label">Select Role</label>
            <select class="form-select" id="active" name="active" required>
                <option value="">Select Role</option>
                <option value="1">Customer</option>
                <option value="0">Admin</option>
            </select>
        </div>

        <button type="submit" class="btn btn-custom w-100 mb-3">Register</button>
    </form>

    <%--<a href="user_list">user list</a>
    <a href="user_update.jsp">Update user</a>
    <a href="user_delete.jsp">delete user</a>--%>
    <a href="login.jsp">Login</a>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
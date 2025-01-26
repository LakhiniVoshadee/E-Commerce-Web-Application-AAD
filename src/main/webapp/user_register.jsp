<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Fashion Store Registration</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background-image: url('https://images.unsplash.com/photo-1515688594390-b649af70d282?q=80&w=2006&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D');
            background-size: cover;
            background-position: center;
            min-height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
            font-family: 'Helvetica Neue', Arial, sans-serif;
            position: relative;
            margin: 0;
        }
        body::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            right: 0;
            bottom: 0;
          /*  background: rgba(255, 255, 255, 0.9);
            backdrop-filter: blur(10px);*/
        }
        .registration-container {
            background: linear-gradient(145deg, #fff, #f8f9fa);
            border-radius: 20px;
            box-shadow: 0 15px 35px rgba(0, 0, 0, 0.2);
            max-width: 500px;
            width: 100%;
            padding: 40px;
            position: relative;
            z-index: 10;
        }
        .form-control, .form-select {
            background-color: #f9f9f9;
            border: 1px solid #ccc;
            border-radius: 8px;
            padding: 10px;
            font-size: 1rem;
            box-shadow: inset 0 2px 4px rgba(0, 0, 0, 0.1);
            transition: all 0.3s ease;
        }
        .form-control:focus, .form-select:focus {
            background-color: #fff;
            border-color: #000;
            box-shadow: 0 0 8px rgba(0, 0, 0, 0.2);
        }
        .btn-custom {
            background-color: #000;
            color: white;
            border-radius: 50px;
            padding: 10px 20px;
            font-size: 1.1rem;
            font-weight: 600;
            transition: all 0.3s ease;
            border: none;
        }
        .btn-custom:hover {
            background-color: #333;
            transform: translateY(-2px);
            box-shadow: 0 8px 15px rgba(0, 0, 0, 0.2);
        }
        .form-label {
            color: #555;
            font-weight: 500;
            font-size: 0.95rem;
        }
        h1, h3 {
            text-align: center;
            color: #000;
            margin-bottom: 20px;
            font-weight: 700;
        }
        h1 {
            font-size: 2rem;
        }
        h5 {
            text-align: center;
            margin-top: 20px;
            font-size: 1rem;
        }
        a {
            text-decoration: none;
            color: #000;
            font-weight: 600;
            transition: all 0.3s ease;
            text-align: center;
            display: block;
        }
        a:hover {
            text-decoration: underline;
            color: #333;
        }
    </style>
</head>
<body>
<div class="registration-container">
    <form action="user-register" method="post">
        <h3>Don't have an account?</h3>
        <h1>Register Now</h1>
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

        <button type="submit" class="btn btn-custom w-100">Register</button>

        <!-- Back Button Centered -->
        <div style="display: flex; justify-content: center; margin-top: 15px;">
            <button onclick="window.location.href='index.jsp'"
                    style="color: #555; padding: 8px 20px; font-size: 1rem; font-weight: 600; border-radius: 50px; transition: all 0.3s ease; border: none; background: none; box-shadow: none; display: flex; align-items: center; justify-content: center !important;">
                <i class="fas fa-arrow-left me-2" style="font-size: 1.2rem; color: #555 !important;"></i>
                Click here to Back
            </button>
        </div>

        <h5>Already have an account?</h5>
        <a href="login.jsp">Login</a>
    </form>

</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>

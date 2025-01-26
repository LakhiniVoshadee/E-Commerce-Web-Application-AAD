<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login</title>
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
            margin: 0;
            position: relative;
        }
        body::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            right: 0;
            bottom: 0;
           /* background: rgba(255, 255, 255, 150);*/
           /* backdrop-filter: blur(10px);*/
        }
        .login-container {
            background: linear-gradient(145deg, #fff, #f8f9fa);
            border-radius: 20px;
            box-shadow: 0 15px 35px rgba(0, 0, 0, 0.2);
            max-width: 400px;
            width: 100%;
            padding: 40px;
            position: relative;
            z-index: 10;
        }
        .form-control {
            background-color: #f9f9f9;
            border: 1px solid #ccc;
            border-radius: 8px;
            padding: 10px;
            font-size: 1rem;
            box-shadow: inset 0 2px 4px rgba(0, 0, 0, 0.1);
            transition: all 0.3s ease;
        }
        .form-control:focus {
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
        h2 {
            text-align: center;
            color: #000;
            margin-bottom: 20px;
            font-weight: 700;
            font-size: 1.8rem;
        }
        a {
            text-decoration: none;
            color: #fff;
            display: block;
            text-align: center;
        }
    </style>
</head>
<body>
<div class="login-container">
    <h2>Login</h2>
    <form action="user-login" method="post">
        <div class="mb-3">
            <label for="email" class="form-label">Email</label>
            <input type="email" class="form-control" id="email" name="email" required>
        </div>
        <div class="mb-3">
            <label for="password" class="form-label">Password</label>
            <input type="password" class="form-control" id="password" name="password" required>
        </div>
        <button type="submit" class="btn btn-custom w-100"><a href="user_dashboard.jsp">Login</a></button>

        <div style="display: flex; justify-content: center; margin-top: 15px;">
            <button onclick="window.location.href='user_register.jsp'"
                    style="color: #555; padding: 8px 20px; font-size: 1rem; font-weight: 600; border-radius: 50px; transition: all 0.3s ease; border: none; background: none; box-shadow: none; display: flex; align-items: center; justify-content: center !important;">
                <i class="fas fa-arrow-left me-2" style="font-size: 1.2rem; color: #555 !important;"></i>
                Click here to Back
            </button>
        </div>
    </form>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>

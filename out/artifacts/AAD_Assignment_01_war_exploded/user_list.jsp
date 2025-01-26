<%@ page import="java.util.List" %>
<%@ page import="lk.ijse.aadassignment01.dto.UserDTO" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Customer List</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://kit.fontawesome.com/a076d05399.js"></script>
    <style>
        /* Body Styling */
        body {
            background-image: url('https://www.example.com/your-image.jpg'); /* Replace with your image URL */
            background-size: cover;
            background-position: center;
            background-attachment: fixed;
            font-family: 'Arial', sans-serif;
            color: #333;
        }

        .container {
            max-width: 1200px;
            margin: 0 auto;
            padding: 30px;
            background-color: rgba(255, 255, 255, 0.8); /* Semi-transparent background */
            border-radius: 15px;
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.2);
        }

        h1 {
            text-align: center;
            margin-bottom: 30px;
            font-weight: 600;
            color: #333;
        }

        .table-responsive {
            margin-top: 30px;
        }

        /* Table Styling */
        table {
            border: 1px solid #ddd;
            border-radius: 8px;
            overflow: hidden;
            background-color: #ffffff;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            width: 100%;
        }

        th, td {
            padding: 15px;
            text-align: left;
            color: #333;
        }

        th {
            background-color: #f4f4f4;
            color: #444;
            font-weight: bold;
        }

        tr:hover {
            background-color: #f9f9f9;
        }

        /* Button Styling */
        .btn-action {
            padding: 5px 15px;
            background-color: #007bff;
            color: white;
            border: none;
            border-radius: 20px;
            cursor: pointer;
            transition: all 0.3s;
        }

        .btn-action:hover {
            background-color: #0056b3;
        }

        .btn-action:focus {
            outline: none;
        }

        /* Mobile Friendly */
        @media (max-width: 767px) {
            table {
                font-size: 0.9rem;
            }
        }
    </style>
</head>
<body>

<div class="container">
    <h1>Customer List</h1>

    <div class="table-responsive">
        <%
            List<UserDTO> userDataList = (List<UserDTO>) request.getAttribute("users");
            if (userDataList != null && !userDataList.isEmpty()) {
        %>
        <table class="table table-bordered table-hover">
            <thead>
            <tr>
                <th>ID</th>
                <th>Name</th>
                <th>Password</th>
                <th>Email</th>
                <th>Status</th>
                <th>Actions</th>
            </tr>
            </thead>
            <tbody>
            <% for (UserDTO userDTO : userDataList) { %>
            <tr>
                <td><%= userDTO.getUser_id() %></td>
                <td><%= userDTO.getUser_name() %></td>
                <td><%= userDTO.getPassword() %></td>
                <td><%= userDTO.getEmail() %></td>
                <td><%= userDTO.getActive() %></td>
                <td>
                    <button class="btn-action" onclick="window.location.href='user_delete.jsp?id=<%= userDTO.getUser_id() %>'" style="background-color: #000 !important; color: #fff !important; border: none !important; padding: 5px 15px !important; border-radius: 20px !important; cursor: pointer !important;">
                        <i class="fas fa-delete"></i> <a href="user_delete.jsp" style="color: #fff !important; text-decoration: none !important;">Deactivate</a>
                    </button>


                </td>
            </tr>
            <% } %>
            </tbody>
        </table>
        <% } else { %>
        <div class="alert alert-info text-center">
            No users found.
        </div>
        <% } %>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>

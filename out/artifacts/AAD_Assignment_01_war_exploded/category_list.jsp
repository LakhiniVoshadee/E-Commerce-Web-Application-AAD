<%@ page import="lk.ijse.aadassignment01.dto.CategoryDTO" %>
<%@ page import="java.util.List" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Fashion Collection Cards</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        :root {
            --primary-black: #0a0a0a;
            --secondary-black: #1a1a1a;
            --accent-gray: #333333;
            --light-gray: #e0e0e0;
            --pure-white: #ffffff;
        }

        body {
            background-image: linear-gradient(rgba(0, 0, 0, 0.5), rgba(0, 0, 0, 0.5)), url('https://img.freepik.com/free-photo/fashion-store-display_1150-2724.jpg');
            background-size: cover;
            background-position: center;
            background-attachment: fixed;
            color: var(--pure-white);
            font-family: 'Arial', sans-serif;
        }

        .card-container {
            max-width: 1200px;
            margin: 50px auto;
            padding: 20px;
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
            gap: 30px;
        }

        .card {
            background-color: rgba(255, 255, 255, 0.9);
            border-radius: 15px;
            box-shadow: 0 10px 25px rgba(0, 0, 0, 0.2);
            padding: 20px;
            backdrop-filter: blur(10px);
        }

        .card-body {
            color: var(--secondary-black);
        }

        .card-title {
            font-weight: bold;
            color: var(--accent-gray);
        }

        .card-subtitle {
            color: var(--accent-gray);
            font-size: 0.9rem;
        }

        .action-buttons {
            display: flex;
            gap: 10px;
            justify-content: flex-end;
        }

        .btn-edit, .btn-delete {
            padding: 5px 10px;
            font-size: 0.8rem;
            background-color: var(--accent-gray);
            color: var(--pure-white);
            border: none;
            border-radius: 20px;
            transition: all 0.3s ease;
        }

        .btn-edit:hover, .btn-delete:hover {
            background-color: var(--light-gray);
            color: var(--secondary-black);
            transform: scale(1.05);
        }
    </style>
</head>
<body>
<div class="card-container">
    <% List<CategoryDTO> categoryDataList = (List<CategoryDTO>) request.getAttribute("categories");
        if (categoryDataList != null && !categoryDataList.isEmpty()) {
            for (CategoryDTO categoryDTO : categoryDataList) { %>
    <div class="card">
        <div class="card-body">
            <h5 class="card-title"><%= categoryDTO.getName() %></h5>
            <h6 class="card-subtitle">ID: <%= categoryDTO.getCategory_id() %></h6>
            <p class="card-text"><%= categoryDTO.getDescription() %></p>
            <div class="action-buttons">
                <a href="category_update.jsp?id=<%= categoryDTO.getCategory_id() %>" class="btn btn-edit">
                    <i class="fas fa-edit"></i> Edit
                </a>
                <a href="category_delete.jsp?id=<%= categoryDTO.getCategory_id() %>" class="btn btn-delete">
                    <i class="fas fa-trash"></i> Delete
                </a>
            </div>
        </div>
    </div>
    <% }
    } else { %>
    <div class="alert alert-info text-center">No categories found.</div>
    <% } %>
</div>

<script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/js/all.min.js"></script>
</body>
</html>
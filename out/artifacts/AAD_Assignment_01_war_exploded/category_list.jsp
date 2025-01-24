<%@ page import="lk.ijse.aadassignment01.dto.CategoryDTO" %>
<%@ page import="java.util.List" %>
<html>
<head>
    <title>Category Data Table</title>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.0/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet">
    <style>
        :root {
            --primary-black: #0a0a0a;
            --secondary-black: #1a1a1a;
            --accent-gray: #333333;
            --light-gray: #e0e0e0;
            --pure-white: #ffffff;
        }

        body {
            background: var(--primary-black);
            color: var(--pure-white);
            font-family: 'Arial', sans-serif;
        }

        .table-container {
            max-width: 1200px;
            margin: 50px auto;
            padding: 20px;
        }

        .table-dark {
            background-color: var(--secondary-black);
            border-color: var(--accent-gray);
        }

        .table-dark th {
            background-color: var(--accent-gray);
            color: var(--pure-white);
            border-color: rgba(255,255,255,0.1);
        }

        .table-dark td {
            color: rgba(255,255,255,0.7);
            border-color: rgba(255,255,255,0.1);
        }

        .table-hover .table-dark tbody tr:hover {
            background-color: rgba(255,255,255,0.05);
        }

        .action-buttons {
            display: flex;
            gap: 10px;
        }

        .btn-edit, .btn-delete {
            padding: 5px 10px;
            font-size: 0.8rem;
        }
    </style>
</head>
<body>
<div class="table-container">
    <h2 class="text-center mb-4">Category Data Table</h2>
    <%
        List<CategoryDTO> categoryDataList = (List<CategoryDTO>) request.getAttribute("categories");
        if (categoryDataList != null && !categoryDataList.isEmpty()) {
    %>
    <table class="table table-dark table-striped table-hover">
        <thead>
        <tr>
            <th>ID</th>
            <th>Name</th>
            <th>Description</th>
            <th>Actions</th>
        </tr>
        </thead>
        <tbody>
        <% for (CategoryDTO categoryDTO : categoryDataList) { %>
        <tr>
            <td><%= categoryDTO.getCategory_id() %></td>
            <td><%= categoryDTO.getName() %></td>
            <td><%= categoryDTO.getDescription() %></td>
            <td>
               <%-- <div class="action-buttons">
                    <a href="category_update.jsp?id=<%= categoryDTO.getCategory_id() %>" class="btn btn-sm btn-outline-light btn-edit">
                        <i class="fas fa-edit"></i> Edit
                    </a>
                    <a href="category_delete.jsp?id=<%= categoryDTO.getCategory_id() %>" class="btn btn-sm btn-outline-danger btn-delete">
                        <i class="fas fa-trash"></i> Delete
                    </a>
                </div>--%>
            </td>
        </tr>
        <% } %>
        </tbody>
    </table>
    <% } else { %>
    <div class="alert alert-info text-center">No categories found.</div>
    <% } %>
</div>

<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.0/js/bootstrap.bundle.min.js"></script>
</body>
</html>
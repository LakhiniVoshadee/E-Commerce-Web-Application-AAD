<%@ page import="lk.ijse.aadassignment01.dto.CategoryDTO" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Category List</title>
    <style>
        .card-container {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
            gap: 20px;
            padding: 20px;
        }

        .card {
            background: white;
            border-radius: 8px;
            box-shadow: 0 2px 4px rgba(0,0,0,0.1);
            padding: 20px;
            transition: transform 0.2s;
        }

        .card:hover {
            transform: translateY(-5px);
            box-shadow: 0 4px 8px rgba(0,0,0,0.2);
        }

        .card-title {
            color: #333;
            font-size: 1.25rem;
            font-weight: bold;
            margin-bottom: 10px;
        }

        .card-id {
            color: #666;
            font-size: 0.9rem;
            margin-bottom: 8px;
        }

        .card-description {
            color: #555;
            line-height: 1.5;
        }

        body {
            background: #f5f5f5;
            margin: 0;
            font-family: Arial, sans-serif;
        }
    </style>
</head>
<body>
<%
    List<CategoryDTO> categoryDataList = (List<CategoryDTO>) request.getAttribute("categories");
    if (categoryDataList != null && !categoryDataList.isEmpty()) {
%>
<div class="card-container">
    <% for (CategoryDTO categoryDTO : categoryDataList) { %>
    <div class="card">
        <div class="card-id">Collection ID: <%= categoryDTO.getCategory_id() %></div>
        <div class="card-title"><%= categoryDTO.getName() %></div>
        <div class="card-description"><%= categoryDTO.getDescription() %></div>
    </div>
    <% } %>
</div>
<%
    }
%>
</body>
</html>
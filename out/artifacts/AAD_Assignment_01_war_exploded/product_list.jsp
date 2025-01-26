<%@ page import="lk.ijse.aadassignment01.dto.ProductDTO" %>
<%@ page import="lk.ijse.aadassignment01.dto.CategoryDTO" %>
<%@ page import="java.util.List" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Product List</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background-color: #f8f9fa;
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
            border: 1px solid #dee2e6;
            border-radius: 15px;
            padding: 20px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
        }

        .card-title {
            font-size: 1.25rem;
            font-weight: bold;
        }

        .card-subtitle {
            font-size: 1rem;
            color: #6c757d;
        }

        .card-text {
            margin-top: 10px;
        }

        .action-buttons {
            margin-top: 15px;
            display: flex;
            gap: 10px;
        }

        .btn {
            border-radius: 20px;
        }
    </style>
</head>
<body>
<div class="container">
    <h1 class="text-center my-4">Product List</h1>
    <div class="card-container">
        <% List<ProductDTO> productDataList = (List<ProductDTO>) request.getAttribute("products");
            if (productDataList != null && !productDataList.isEmpty()) {
                for (ProductDTO productDTO : productDataList) { %>
        <div class="card">
            <div class="card-body">
                <h5 class="card-title"><%= productDTO.getProduct_name() %></h5>
                <h6 class="card-subtitle mb-2">Category: <%= productDTO.getCategory().getName() %></h6>
                <p class="card-text"><%= productDTO.getDescription() %></p>
                <p class="card-text">Price: $<%= productDTO.getProduct_price() %></p>
                <p class="card-text">Stock: <%= productDTO.getStock() %></p>
                <div class="action-buttons">
                    <a href="product_update.jsp?id=<%= productDTO.getProduct_id() %>" class="btn btn-primary btn-sm">
                        Edit
                    </a>
                    <a href="product_delete.jsp?id=<%= productDTO.getProduct_id() %>" class="btn btn-danger btn-sm">
                        Delete
                    </a>

                    <form action="cart-add" method="post">
                        <input type="hidden" name="product_id" value="<%= productDTO.getProduct_id() %>">
                        <input type="number" name="quantity" min="1" value="1">
                        <button type="submit" class="btn btn-primary">Add to Cart</button>
                    </form>
                </div>
            </div>
        </div>
        <% }
        } else { %>
        <div class="alert alert-info text-center">No products found.</div>
        <% } %>
    </div>
</div>
</body>
</html>

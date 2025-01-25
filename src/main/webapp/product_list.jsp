<%@ page import="com.example.dto.ProductDTO, java.util.List" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Product List</title>
    <link rel="stylesheet" href="styles.css"> <!-- Add your CSS file if necessary -->
</head>
<body>
<h1>Product List</h1>
<table border="1">
    <thead>
    <tr>
        <th>Product ID</th>
        <th>Name</th>
        <th>Price</th>
        <th>Description</th>
    </tr>
    </thead>
    <tbody>
    <%
        List<ProductDTO> products = (List<ProductDTO>) request.getAttribute("products");
        if (products != null && !products.isEmpty()) {
            for (ProductDTO product : products) {
    %>
    <tr>
        <td><%= product.getProductId() %></td>
        <td><%= product.getName() %></td>
        <td><%= product.getPrice() %></td>
        <td><%= product.getDescription() %></td>
    </tr>
    <%
        }
    } else {
    %>
    <tr>
        <td colspan="4">No products available</td>
    </tr>
    <% } %>
    </tbody>
</table>
</body>
</html>

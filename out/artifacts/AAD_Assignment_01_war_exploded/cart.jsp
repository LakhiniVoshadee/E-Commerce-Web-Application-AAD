<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Your Cart</title>
</head>
<body>

<h2>Your Cart</h2>

<c:if test="${not empty param.error}">
    <div style="color: red;">${param.error}</div>
</c:if>
<c:if test="${not empty param.message}">
    <div style="color: green;">${param.message}</div>
</c:if>

<table border="1">
    <thead>
    <tr>
        <th>Product Name</th>
        <th>Quantity</th>
        <th>Price</th>
        <th>Total</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach var="cartItem" items="${cartItems}">
        <tr>
            <td>${cartItem.product_name}</td>
            <td>${cartItem.quantity}</td>
            <td>${cartItem.product_price}</td>
            <td>${cartItem.quantity * cartItem.product_price}</td>
        </tr>
    </c:forEach>
    </tbody>
</table>

<br>
<a href="checkout.jsp">Proceed to Checkout</a>

</body>
</html>

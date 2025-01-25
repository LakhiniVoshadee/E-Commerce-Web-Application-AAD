<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Login</title>
</head>
<body>
<h2>Login</h2>
<%
    String message = request.getParameter("message");
    String error = request.getParameter("error");
%>
<% if (message != null) { %>
<div style="color: green;"><%=message%></div>
<% } %>
<% if (error != null) { %>
<div style="color: red;"><%=error%></div>
<% } %>
<form action="login" method="post">
    <input type="text" name="user_name" placeholder="User_name" required><br>
    <input type="password" name="password" placeholder="Password" required><br>
    <button type="submit">Login</button>
</form>
</body>
</html>
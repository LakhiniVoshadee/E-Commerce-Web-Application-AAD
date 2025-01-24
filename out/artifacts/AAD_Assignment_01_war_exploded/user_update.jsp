<%--
  Created by IntelliJ IDEA.
  User: Voshadee
  Date: 1/10/2025
  Time: 1:41 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>User-Update-JSP</title>
</head>
<body>
<h1>User Update</h1>
<%
    String message = request.getParameter("message");
    String error = request.getParameter("error");
%>

<%
    if (message!=null){
%>
<div style="color: green"><%=message%></div>
<%
    }
%>

<%
    if (error!=null){
%>
<div style="color: red"><%=error%></div>
<%
    }
%>

<form action="user-update" method="post">
    <label for="user_id">User ID:</label><br>
    <input type="text" id="user_id" name="user_id" required><br><br>

    <label for="user_name">User Name:</label><br>
    <input type="text" id="user_name" name="user_name" required><br><br>

    <label for="password">Password:</label><br>
    <input type="password" id="password" name="password" required><br><br>

    <label for="email">Email:</label><br>
    <input type="email" id="email" name="email" required><br><br>

    <label for="active">Status:</label><br>
    <select id="active" name="active" required>
        <option value="active">Active</option>
        <option value="inactive">Inactive</option>
    </select><br><br>

    <button type="submit">Update User</button>
</form>
</body>
</html>

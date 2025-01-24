<%--
  Created by IntelliJ IDEA.
  User: Voshadee
  Date: 1/10/2025
  Time: 10:35 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>JSP-Save-User</title>
</head>
<body>
<h1>Save User</h1><br>

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


<form action="user-register" method="post">
    <label for="name">User Name:</label><br>
    <input type="text" id="name" name="name" required><br><br>

    <label for="password">Password:</label><br>
    <input type="text" id="password" name="address" required><br><br>

    <label for="email">Email:</label><br>
    <input type="text" id="email" name="email" required><br><br>

    <label for="active">Active:</label><br>
    <input type="text" id="active" name="active" required><br><br>

    <button type="submit">Save User</button>

    <a href="user_list">Load Users</a>

</form>
</body>
</html>

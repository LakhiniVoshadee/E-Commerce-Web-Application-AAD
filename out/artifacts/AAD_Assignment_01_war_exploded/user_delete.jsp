<%--
  Created by IntelliJ IDEA.
  User: Voshadee
  Date: 1/24/2025
  Time: 9:44 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>User Delete</title>
</head>
<body>
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
<form action="user-delete" method="post">
    <label for="user_id">ID:</label><br>
    <input type="text" id="user_id" name="user_id" required><br><br>

    <button type="submit">Delete Customer</button>

</form>
</body>
</html>

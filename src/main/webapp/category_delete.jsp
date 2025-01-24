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
    <title>Collection Delete</title>
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
<form action="category-delete" method="post">
    <label for="category_id">ID:</label><br>
    <input type="text" id="category_id" name="category_id" required><br><br>

    <button type="submit">Delete Customer</button>

</form>
</body>
</html>

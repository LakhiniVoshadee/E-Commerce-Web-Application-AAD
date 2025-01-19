<%--
&lt;%&ndash;
  Created by IntelliJ IDEA.
  User: Voshadee
  Date: 1/12/2025
  Time: 7:28 PM
  To change this template use File | Settings | File Templates.
&ndash;%&gt;
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Category Save</title>
</head>
<body>
<h1>Save Category</h1><br>

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

<form action="category-save" method="post">
    <label for="category_name">Name:</label><br>
    <input type="text" id="category_name" name="name" required><br><br>

    <label for="category_description">Description:</label><br>
    <input type="text" id="category_description" name="description" required><br><br>


    <button type="submit">Save Category</button>

</form>
</body>
</html>
--%>

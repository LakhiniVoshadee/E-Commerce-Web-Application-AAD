<%--
  Created by IntelliJ IDEA.
  User: Voshadee
  Date: 1/24/2025
  Time: 8:51 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
  <head>
    <title>Collection-Update-JSP</title>
  </head>
  <body>
  <h1>Collection Update</h1>

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

  <form action="category-update" method="post">
    <label for="category_id">Collection ID:</label><br>
    <input type="text" id="category_id" name="id" required><br><br>


    <label for="category_name">Collection Name:</label><br>
    <input type="text" id="category_name" name="name" required><br><br>

    <label for="category_description">Collection Description:</label><br>
    <input type="text" id="category_description" name="description" required><br><br>

    <button type="submit">Update Collection</button>
  </form>
  </body>
</html>

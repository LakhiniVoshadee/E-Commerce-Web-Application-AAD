<%@ page import="lk.ijse.aadassignment01.dto.CategoryDTO" %>
<%@ page import="java.util.List" %><%--
  Created by IntelliJ IDEA.
  User: Voshadee
  Date: 1/12/2025
  Time: 7:28 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Category List</title>
</head>
<body>
<%
    List<CategoryDTO> categoryDataList = (List<CategoryDTO>) request.getAttribute("customers");
    if (categoryDataList != null && !categoryDataList.isEmpty()) {
%>
<section id="CustomerForm">
   <%-- <div id="customerHeaderSection" class="customerHeader-section">
        <h2> Customer <span>Manage</span></h2>
        <a href="category_save.jsp">Add Category</a>
    </div>--%>




    <!-- -------------- Category Table -------------- -->
    <table id="categoryTable" class="category-table">
        <thead>
        <tr>
            <th>Category ID</th>
            <th>Name</th>
            <th>Description</th>
            <th>Update</th>
            <th>Delete</th>
        </tr>
        </thead>

        <tbody id="category-table-list">
        <% for (CategoryDTO categoryDTO : categoryDataList) { %>
        <tr>
            <td><%= categoryDTO.getCategory_id() %></td>
            <td><%= categoryDTO.getName() %></td>
            <td><%= categoryDTO.getDescription() %></td>

        </tr>
        <% } %>

        </tbody>
    </table>
    <%
        }
    %>
</section>

</body>
</html>


<%--
<%@ page import="java.util.List" %>
<%@ page import="lk.ijse.customerjsp.CustomerDTO" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Customer List</title>
    <style>
        .container {
            max-width: 1200px;
            margin: 0 auto;
            padding: 20px;
        }

        .cards-grid {
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(300px, 1fr));
            gap: 20px;
            padding: 20px;
        }

        .card {
            background: white;
            border-radius: 8px;
            padding: 20px;
            box-shadow: 0 2px 4px rgba(0,0,0,0.1);
            transition: transform 0.2s;
        }

        .card:hover {
            transform: translateY(-5px);
            box-shadow: 0 4px 8px rgba(0,0,0,0.2);
        }

        .card-title {
            font-size: 1.2em;
            font-weight: bold;
            margin-bottom: 10px;
            color: #333;
        }

        .card-content {
            color: #666;
        }

        .card-field {
            margin: 8px 0;
        }

        .card-label {
            font-weight: 600;
            color: #444;
        }

        h1 {
            text-align: center;
            color: #333;
            margin-bottom: 30px;
        }
    </style>
</head>
<body>
<div class="container">
    <h1>Customer List</h1>

    <%
        List<CustomerDTO> customerDataList = (List<CustomerDTO>) request.getAttribute("customers");
        if (customerDataList != null && !customerDataList.isEmpty()) {
    %>
    <div class="cards-grid">
        <% for (CustomerDTO customerDTO : customerDataList) { %>
        <div class="card">
            <div class="card-title">
                <%= customerDTO.getName() %>
            </div>
            <div class="card-content">
                <div class="card-field">
                    <span class="card-label">ID:</span>
                    <%= customerDTO.getId() %>
                </div>
                <div class="card-field">
                    <span class="card-label">Address:</span>
                    <%= customerDTO.getAddress() %>
                </div>
                <div class="card-field">
                    <span class="card-label">Email:</span>
                    <%= customerDTO.getEmail() %>
                </div>
            </div>
        </div>
        <% } %>
    </div>
    <%
        }
    %>
</div>
</body>
</html>
--%>

<%@ page import="java.util.List" %>
<%@ page import="lk.ijse.aadassignment01.dto.UserDTO" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Customer List</title>
</head>
<body>
<h1>Customer List</h1>

<%
    List<UserDTO> userDataList = (List<UserDTO>) request.getAttribute("users");
    if (userDataList != null && !userDataList.isEmpty()) {
%>
<table border="1">
    <thead>
    <tr>
        <th>ID</th>
        <th>Name</th>
        <th>Password</th>
        <th>Email</th>
        <th>Status</th>
    </tr>
    </thead>
    <tbody>
    <% for (UserDTO userDTO : userDataList) { %>
    <tr>
        <td><%= userDTO.getUser_id() %></td>
        <td><%= userDTO.getUser_name() %></td>
        <td><%= userDTO.getPassword() %></td>
        <td><%= userDTO.getEmail() %></td>
        <td><%= userDTO.getActive() %></td>
    </tr>
    <% } %>
    </tbody>
</table>
<%
    }
%>
</body>
</html>

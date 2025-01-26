package lk.ijse.aadassignment01;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import lk.ijse.aadassignment01.dto.CategoryDTO;

import java.io.IOException;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "UserCategoryAllServlet", value = "/user_category_list")
public class UserCategoryAllServlet extends HttpServlet {
    String DB_URL = "jdbc:mysql://localhost:3306/ecommerce";
    String DB_USER = "root";
    String DB_PASSWORD = "IJSE@123";

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        List<CategoryDTO> categoryList = new ArrayList<>();

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection connection = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
            String sql = "SELECT * FROM categories";
            Statement stm = connection.createStatement();
            ResultSet resultSet = stm.executeQuery(sql);

            while (resultSet.next()) {
                // Assuming the columns are in this order: category_id, name, description
                CategoryDTO categoryDTO = new CategoryDTO(
                        resultSet.getString("category_id"),   // category_id
                        resultSet.getString("name"),          // category name
                        resultSet.getString("description")    // category description
                );
                categoryList.add(categoryDTO);
            }

            req.setAttribute("categories", categoryList);
            RequestDispatcher requestDispatcher = req.getRequestDispatcher("user_category_jsp.jsp");
            requestDispatcher.forward(req, resp);
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
            resp.sendRedirect("user_category_jsp.jsp?error=Failed to retrieve categories");
        }
    }
}
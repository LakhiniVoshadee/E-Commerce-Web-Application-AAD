package lk.ijse.aadassignment01;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;


@WebServlet(name = "CategoryUpdateServlet",value = "/category-update")
public class CategoryUpdateServlet extends HttpServlet {

    String DB_URL = "jdbc:mysql://localhost:3306/ecommerce";
    String DB_USER = "root";
    String DB_PASSWORD = "IJSE@123";

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String category_id = req.getParameter("category_id");
        String name = req.getParameter("name");
        String description = req.getParameter("description");

        try (Connection connection = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
             PreparedStatement preparedStatement = connection.prepareStatement("UPDATE categories SET name = ?, description = ? WHERE category_id = ?")) {

            Class.forName("com.mysql.cj.jdbc.Driver");

            preparedStatement.setString(1, name);
            preparedStatement.setString(2, description);
            preparedStatement.setString(3, category_id);

            int updateRowCount = preparedStatement.executeUpdate();

            if (updateRowCount > 0) {
                resp.sendRedirect("category_update.jsp?message=Category Updated Successfully");
            } else {
                resp.sendRedirect("category_update.jsp?error=Category not found");
            }
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
            resp.sendRedirect("category_update.jsp?error=Database error");
        }
    }
}

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

@WebServlet(name = "CategoryDeleteServelet",value = "/category-delete")
public class CategoryDeleteServlet extends HttpServlet {
    String DB_URL = "jdbc:mysql://localhost:3306/ecommerce";
    String DB_USER = "root";
    String DB_PASSWORD = "IJSE@123";

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String category_id = req.getParameter("category_id");

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection connection = DriverManager.getConnection(DB_URL,DB_USER,DB_PASSWORD);

            String sql = "DELETE FROM categories WHERE category_id = ?";
            PreparedStatement preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setString(1, category_id);
            int deletedRowCountb = preparedStatement.executeUpdate();

            if (deletedRowCountb> 0){
                resp.sendRedirect("category_delete.jsp?message=category deleted");
            }else {
                resp.sendRedirect("category_delete.jsp?error=category delete failed!");
            }
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
            resp.sendRedirect("category_delete.jsp?message=error");

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

    }
}

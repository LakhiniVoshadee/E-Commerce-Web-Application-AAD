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

@WebServlet(name = "ProductDeleteServlet", value = "/product-delete")
public class ProductDeleteServlet extends HttpServlet {
    String DB_URL = "jdbc:mysql://localhost:3306/ecommerce";
    String DB_USER = "root";
    String DB_PASSWORD = "IJSE@123";

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String product_id = req.getParameter("product_id");

        try {

            Class.forName("com.mysql.cj.jdbc.Driver");

            Connection connection = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);


            String sql = "DELETE FROM products WHERE product_id = ?";
            PreparedStatement preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setString(1, product_id);


            int deletedRowCount = preparedStatement.executeUpdate();

            if (deletedRowCount > 0) {

                resp.sendRedirect("product_delete.jsp?message=Product Deleted Successfully");
            } else {

                resp.sendRedirect("product_delete.jsp?error=Product Deletion Failed");
            }
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();

            resp.sendRedirect("product_delete.jsp?error=Database Error Occurred");
        }
    }
}

package lk.ijse.aadassignment01;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.math.BigDecimal;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

@WebServlet(name = "ProductSaveServlet", value = "/product-save")
public class ProductSaveServlet extends HttpServlet {
    private static final String DB_URL = "jdbc:mysql://localhost:3306/ecommerce";
    private static final String DB_USER = "root";
    private static final String DB_PASSWORD = "IJSE@123";

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            // Get form parameters
            String productName = req.getParameter("product_name");
            String description = req.getParameter("description");
            BigDecimal unitPrice = new BigDecimal(req.getParameter("product_price"));
            int stock = Integer.parseInt(req.getParameter("stock"));
            int categoryId = Integer.parseInt(req.getParameter("category_id"));

            // Load JDBC driver
            Class.forName("com.mysql.cj.jdbc.Driver");

            // Save to database
            try (Connection connection = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD)) {
                String sql = "INSERT INTO products (product_name, description, product_price, stock, category_id) VALUES (?, ?, ?, ?, ?)";

                try (PreparedStatement preparedStatement = connection.prepareStatement(sql)) {
                    preparedStatement.setString(1, productName);
                    preparedStatement.setString(2, description);
                    preparedStatement.setBigDecimal(3, unitPrice);
                    preparedStatement.setInt(4, stock);
                    preparedStatement.setInt(5, categoryId);

                    int rowsAffected = preparedStatement.executeUpdate();

                    if (rowsAffected > 0) {
                        resp.sendRedirect("product.jsp?message=Product saved successfully!");
                    } else {
                        resp.sendRedirect("product.jsp?error=Failed to save product!");
                    }
                }
            }
        } catch (NumberFormatException e) {
            resp.sendRedirect("product.jsp?error=Invalid number format!");
            e.printStackTrace();
        } catch (SQLException e) {
            resp.sendRedirect("product.jsp?error=Database error: " + e.getMessage());
            e.printStackTrace();
        } catch (ClassNotFoundException e) {
            resp.sendRedirect("product.jsp?error=Database driver not found!");
            e.printStackTrace();
        }
    }
}
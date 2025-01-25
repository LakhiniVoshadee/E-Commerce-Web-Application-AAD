package lk.ijse.aadassignment01;

import jakarta.annotation.Resource;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import javax.sql.DataSource;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

@WebServlet(name = "ProductSaveServlet", value = "/product-save")
public class ProductSaveServlet extends HttpServlet {

    @Resource(name = "java:comp/env/jdbc/pool")
    private DataSource dataSource;

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // Retrieve product details from the request
        String productName = req.getParameter("product_name");
        String description = req.getParameter("description");
        double unitPrice = Double.parseDouble(req.getParameter("unit_price"));
        int stock = Integer.parseInt(req.getParameter("stock"));
        int categoryId = Integer.parseInt(req.getParameter("category_id"));

        // SQL query to insert the product
        String sql = "INSERT INTO products (product_name, description, product_price, stock, category_id) VALUES (?, ?, ?, ?, ?)";

        try (Connection connection = dataSource.getConnection()) {
            PreparedStatement preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setString(1, productName);
            preparedStatement.setString(2, description);
            preparedStatement.setDouble(3, unitPrice);
            preparedStatement.setInt(4, stock);
            preparedStatement.setInt(5, categoryId);

            System.out.println("product saved to database");

            // Execute the query
            preparedStatement.executeUpdate();

            // Redirect to the product JSP with a success message
            resp.sendRedirect("product.jsp?message=Product Saved Successfully!");
        } catch (SQLException e) {
            e.printStackTrace();
            // Redirect to the product JSP with an error message
            resp.sendRedirect("product.jsp?error=Something went wrong while saving the product!");
        }
    }
}

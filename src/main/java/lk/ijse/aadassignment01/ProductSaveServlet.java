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
    String DB_URL = "jdbc:mysql://localhost:3306/ecommerce";
    String DB_USER = "root";
    String DB_PASSWORD = "IJSE@123";

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        // Get form parameters
        String productName = req.getParameter("product_name");
        String description = req.getParameter("description");
        BigDecimal unitPrice = new BigDecimal(req.getParameter("product_price"));
        int stock = Integer.parseInt(req.getParameter("stock"));
        int categoryId = Integer.parseInt(req.getParameter("category_id"));

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");

            Connection connection = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
            String sql = "insert into  products values(?,?,?,?,?)";

            PreparedStatement preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setString(1, productName);
            preparedStatement.setString(2, description);
            preparedStatement.setBigDecimal(3, unitPrice);
            preparedStatement.setInt(4, stock);
            preparedStatement.setInt(5, categoryId);

            int i = preparedStatement.executeUpdate();
            preparedStatement.close();
            connection.close();

            if (i > 0) {
                resp.sendRedirect("product.jsp?message=Product Saved Successfully!");
            } else {
                resp.sendRedirect("product.jsp?error=Something went wrong!");
            }
        } catch (ClassNotFoundException | SQLException e) {

            e.printStackTrace();
        }


    }
}
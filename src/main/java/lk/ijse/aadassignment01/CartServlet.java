package lk.ijse.aadassignment01;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

@WebServlet(name = "CartServlet", value = "/cart-add")
public class CartServlet extends HttpServlet {
    private static final String DB_URL = "jdbc:mysql://localhost:3306/ecommerce";
    private static final String DB_USER = "root";
    private static final String DB_PASSWORD = "IJSE@123";

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // Get the product_id and quantity from the request
        int productId = Integer.parseInt(req.getParameter("product_id"));
        int quantity = Integer.parseInt(req.getParameter("quantity"));

        // Get the logged-in user_id from the session
        HttpSession session = req.getSession();
        int userId = (int) session.getAttribute("user_id");

        try {
            // Establish connection
            Connection connection = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);

            // Check if the product is already in the cart
            String checkCartQuery = "SELECT * FROM cart WHERE user_id = ? AND product_id = ?";
            PreparedStatement checkCartStmt = connection.prepareStatement(checkCartQuery);
            checkCartStmt.setInt(1, userId);
            checkCartStmt.setInt(2, productId);
            ResultSet resultSet = checkCartStmt.executeQuery();

            if (resultSet.next()) {
                // If the product exists in the cart, update the quantity
                int existingQuantity = resultSet.getInt("quantity");
                int newQuantity = existingQuantity + quantity;
                String updateCartQuery = "UPDATE cart SET quantity = ? WHERE user_id = ? AND product_id = ?";
                PreparedStatement updateCartStmt = connection.prepareStatement(updateCartQuery);
                updateCartStmt.setInt(1, newQuantity);
                updateCartStmt.setInt(2, userId);
                updateCartStmt.setInt(3, productId);
                updateCartStmt.executeUpdate();
                resp.sendRedirect("cart.jsp?message=Product quantity updated successfully!");
            } else {
                // If the product doesn't exist in the cart, add a new entry
                String addCartQuery = "INSERT INTO cart (user_id, product_id, quantity) VALUES (?, ?, ?)";
                PreparedStatement addCartStmt = connection.prepareStatement(addCartQuery);
                addCartStmt.setInt(1, userId);
                addCartStmt.setInt(2, productId);
                addCartStmt.setInt(3, quantity);
                addCartStmt.executeUpdate();
                resp.sendRedirect("cart.jsp?message=Product added to cart successfully!");
            }

            resultSet.close();
            checkCartStmt.close();
            connection.close();
        } catch (SQLException e) {
            e.printStackTrace();
            resp.sendRedirect("cart.jsp?error=An error occurred while adding the product to the cart!");
        }
    }
}

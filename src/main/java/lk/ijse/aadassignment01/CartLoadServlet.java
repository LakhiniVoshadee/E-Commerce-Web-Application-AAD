package lk.ijse.aadassignment01;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import lk.ijse.aadassignment01.dto.CartDTO;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "CartLoadServlet", value = "/cart-view")
public class CartLoadServlet extends HttpServlet {

    // Database connection details
    private static final String DB_URL = "jdbc:mysql://localhost:3306/ecommerce";
    private static final String DB_USER = "root";
    private static final String DB_PASSWORD = "IJSE@123";

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // Retrieve user ID from session
        HttpSession session = req.getSession();
        Integer userId = (Integer) session.getAttribute("user_id");

        // Check if user is logged in
        if (userId == null) {
            resp.sendRedirect("login.jsp?error=You must be logged in to view the cart.");
            return;
        }

        // Fetch cart items from the database
        try (Connection connection = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD)) {
            String sql = "SELECT p.product_id, p.product_name, p.product_price, c.quantity, c.added_at " +
                    "FROM cart c " +
                    "JOIN products p ON c.product_id = p.product_id " +
                    "WHERE c.user_id = ?";
            PreparedStatement preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setInt(1, userId);

            ResultSet resultSet = preparedStatement.executeQuery();

            List<CartDTO> cartItems = new ArrayList<>();
            while (resultSet.next()) {
                int productId = resultSet.getInt("product_id");  // Use int for product_id
                String productName = resultSet.getString("product_name");
                double productPrice = resultSet.getDouble("product_price");
                int quantity = resultSet.getInt("quantity");
                String addedAt = resultSet.getString("added_at");  // Fetch added_at if needed

                // Create CartDTO object and populate it with data
                CartDTO cartDTO = new CartDTO();
                cartDTO.setProduct_id(productId);
                cartDTO.setQuantity(quantity);
                cartDTO.setProduct_name(productName);  // Assuming CartDTO has this field
                cartDTO.setProduct_price(productPrice); // Assuming CartDTO has this field
                cartDTO.setAdded_at(addedAt);  // Set added_at if needed

                cartItems.add(cartDTO);
            }

            req.setAttribute("cartItems", cartItems);  // Set cart items as request attribute
            req.getRequestDispatcher("cart.jsp").forward(req, resp);  // Forward to cart.jsp

        } catch (SQLException e) {
            e.printStackTrace();
            resp.sendRedirect("cart.jsp?error=Failed to load cart!");
        }
    }
}

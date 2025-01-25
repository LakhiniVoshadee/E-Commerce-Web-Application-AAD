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

@WebServlet(name = "ProductUpdateServlet", value = "/product-update")
public class ProductUpdateServlet extends HttpServlet {



        String DB_URL = "jdbc:mysql://localhost:3306/ecommerce";
        String DB_USER = "root";
        String DB_PASSWORD = "IJSE@123";

        @Override
        protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

            int productId = Integer.parseInt(req.getParameter("product_id"));
            String productName = req.getParameter("product_name");
            String description = req.getParameter("description");
            double productPrice = Double.parseDouble(req.getParameter("product_price"));
            int stock = Integer.parseInt(req.getParameter("stock"));
            int categoryId = Integer.parseInt(req.getParameter("category_id"));


            String sql = "UPDATE products SET product_name = ?, description = ?, product_price = ?, stock = ?, category_id = ? WHERE product_id = ?";

            try (Connection connection = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
                 PreparedStatement preparedStatement = connection.prepareStatement(sql)) {

                Class.forName("com.mysql.cj.jdbc.Driver");

                preparedStatement.setString(1, productName);
                preparedStatement.setString(2, description);
                preparedStatement.setDouble(3, productPrice);
                preparedStatement.setInt(4, stock);
                preparedStatement.setInt(5, categoryId);
                preparedStatement.setInt(6, productId);

                int updatedRows = preparedStatement.executeUpdate();

                if (updatedRows > 0) {
                    resp.sendRedirect("product_update.jsp?message=Product Updated Successfully");
                } else {
                    resp.sendRedirect("product_update.jsp?error=Product not found");
                }
            } catch (ClassNotFoundException | SQLException e) {
                e.printStackTrace();
                resp.sendRedirect("product_update.jsp?error=Database error");
            }
        }
    }





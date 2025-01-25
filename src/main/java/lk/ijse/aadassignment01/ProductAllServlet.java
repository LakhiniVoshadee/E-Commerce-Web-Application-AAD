package lk.ijse.aadassignment01;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import lk.ijse.aadassignment01.dto.ProductDTO;
import lk.ijse.aadassignment01.dto.CategoryDTO;

import java.io.IOException;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "ProductAllServlet", value = "/product_list")
public class ProductAllServlet extends HttpServlet {
    String DB_URL = "jdbc:mysql://localhost:3306/ecommerce";
    String DB_USER = "root";
    String DB_PASSWORD = "IJSE@123";

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        List<ProductDTO> productList = new ArrayList<>();

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection connection = DriverManager.getConnection(
                    DB_URL,
                    DB_USER,
                    DB_PASSWORD
            );

            String sql = "SELECT p.product_id, p.product_name, p.description, p.product_price, p.stock, c.category_id, c.name, c.description " +
                    "FROM products p " +
                    "JOIN categories c ON p.category_id = c.category_id";
            Statement stm = connection.createStatement();
            ResultSet resultSet = stm.executeQuery(sql);
            while (resultSet.next()) {
                CategoryDTO categoryDTO = new CategoryDTO(
                        resultSet.getString("category_id"),
                        resultSet.getString("name"),
                        resultSet.getString("c.description")
                );

                ProductDTO productDTO = new ProductDTO(
                        resultSet.getInt("product_id"),
                        resultSet.getString("product_name"),
                        resultSet.getString("description"),
                        resultSet.getDouble("product_price"),
                        resultSet.getInt("stock"),
                        categoryDTO
                );

                productList.add(productDTO);
            }

            req.setAttribute("products", productList);
            RequestDispatcher requestDispatcher = req.getRequestDispatcher("product_list.jsp");
            requestDispatcher.forward(req, resp);

        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
            resp.sendRedirect("product_list.jsp?error=Failed to retrieve products");
        }
    }
}

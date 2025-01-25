package lk.ijse.aadassignment01;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import lk.ijse.aadassignment01.dto.ProductDTO;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "ProductAllServlet", value = "/product_list")

public class ProductAllServlet extends HttpServlet {


    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<ProductDTO> products = new ArrayList<>();
        DataSource ds = null;

        try {
            // Get DataSource via JNDI
            Context initContext = new InitialContext();
            Context envContext = (Context) initContext.lookup("java:comp/env");
            ds = (DataSource) envContext.lookup("jdbc/pool");

            try (Connection connection = ds.getConnection();
                 PreparedStatement ps = connection.prepareStatement("SELECT product_id, product_name, price, description FROM products")) {

                ResultSet rs = ps.executeQuery();
                while (rs.next()) {
                    ProductDTO product = new ProductDTO();
                    product.setProduct_id(rs.getInt("product_id"));
                    product.setProduct_name(rs.getString("name"));
                //    product.getProduct_price(rs.getDouble("price"));
                    product.setDescription(rs.getString("description"));
                    products.add(product);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        // Set product list as request attribute
        request.setAttribute("products", products);

        // Forward to JSP page
        request.getRequestDispatcher("WEB-INF/product_list.jsp").forward(request, response);
    }
}



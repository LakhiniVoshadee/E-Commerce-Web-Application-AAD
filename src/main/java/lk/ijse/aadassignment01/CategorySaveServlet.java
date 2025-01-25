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
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

@WebServlet(name = "CategorySaveServlet", value = "/category-save")
public class CategorySaveServlet extends HttpServlet {
    /*String DB_URL = "jdbc:mysql://localhost:3306/ecommerce";
    String DB_USER = "root";
    String DB_PASSWORD = "IJSE@123";*/

    @Resource(name = "java:comp/env/jdbc/pool")
    private DataSource dataSource;

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String name = req.getParameter("name");
        String description = req.getParameter("description");

        try (
           // Class.forName("com.mysql.cj.jdbc.Driver");
           Connection connection = dataSource.getConnection()){
            String sql = "insert into categories(name,description) values(?,?)";
            PreparedStatement preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setString(1, name);
            preparedStatement.setString(2, description);

            preparedStatement.executeUpdate();
           // preparedStatement.close();
          //  connection.close();

                resp.sendRedirect("category.jsp?message=Category Saved Successfully!");




        } catch (SQLException  e) {
            e.printStackTrace();
            resp.sendRedirect("category.jsp?error=Something went wrong!");

        }
    }
}

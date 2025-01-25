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

import org.mindrot.jbcrypt.BCrypt;




@WebServlet(name = "UserRegisterServlet", value = "/user-register")
public class UserRegisterServlet extends HttpServlet {
    String DB_URL = "jdbc:mysql://localhost:3306/ecommerce";
    String DB_USER = "root";
    String DB_PASSWORD = "IJSE@123";


    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // Retrieve form data
        String user_name = req.getParameter("user_name");
        String password = req.getParameter("password");
        String email = req.getParameter("email");
        String active = req.getParameter("active");

        // Hash the password using BCrypt
        String hashedPassword = BCrypt.hashpw(password, BCrypt.gensalt());

        // Database operation
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection connection = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);

            String sql = "INSERT INTO users(user_name, password, email, active) VALUES(?, ?, ?, ?)";
            PreparedStatement preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setString(1, user_name);
            preparedStatement.setString(2, hashedPassword);  // Store hashed password here
            preparedStatement.setString(3, email);
            preparedStatement.setString(4, active);

            int result = preparedStatement.executeUpdate();
            preparedStatement.close();
            connection.close();

            // Redirect based on result
            if (result > 0) {
                resp.sendRedirect("user_register.jsp?message=User Registered Successfully!");
            } else {
                resp.sendRedirect("user_register.jsp?error=Something went wrong!");
            }

        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
            resp.sendRedirect("user_register.jsp?error=Error: " + e.getMessage());
        }
    }

}

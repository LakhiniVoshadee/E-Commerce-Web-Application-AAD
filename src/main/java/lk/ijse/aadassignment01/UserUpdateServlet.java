package lk.ijse.aadassignment01;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

@WebServlet(name = "UserUpdateServlet", value = "/user-update")
public class UserUpdateServlet extends HttpServlet {
    String DB_URL = "jdbc:mysql://localhost:3306/ecommerce";
    String DB_USER = "root";
    String DB_PASSWORD = "IJSE@123";

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String user_id = req.getParameter("user_id");
        String user_name = req.getParameter("user_name");
        String password = req.getParameter("password");
        String email = req.getParameter("email");
        String status = req.getParameter("active");

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            try (Connection connection = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
                 PreparedStatement pstm = connection.prepareStatement("UPDATE users SET user_name = ?, password = ?, email = ?, active = ? WHERE user_id = ?")) {

                pstm.setString(1, user_name);
                pstm.setString(2, password);
                pstm.setString(3, email);
                pstm.setString(4, status);
                pstm.setString(5, user_id);

                int updateRowCount = pstm.executeUpdate();

                if (updateRowCount > 0) {
                    resp.sendRedirect("user_update.jsp?message=User updated successfully");
                } else {
                    resp.sendRedirect("user_update.jsp?error=User not found");
                }
            }
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
            resp.sendRedirect("user_update.jsp?error=" + URLEncoder.encode(e.getMessage(), StandardCharsets.UTF_8));
        }
    }
}

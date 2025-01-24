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

@WebServlet(name = "UserDeleteServlet",value = "/user-delete")
public class UserDeleteServlet extends HttpServlet {
    String DB_URL = "jdbc:mysql://localhost:3306/ecommerce";
    String DB_USER = "root";
    String DB_PASSWORD = "IJSE@123";

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String id = req.getParameter("user_id");

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection connection = DriverManager.getConnection(DB_URL,DB_USER,DB_PASSWORD);

            String sql = "DELETE FROM users WHERE user_id = ?";
            PreparedStatement preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setString(1, id);
            int deletedRowCountb = preparedStatement.executeUpdate();

            if (deletedRowCountb> 0){
                resp.sendRedirect("user_delete.jsp?message=User deleted successfully");
            }else {
                resp.sendRedirect("user_delete.jsp?error=user delete failed!");
            }
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
            resp.sendRedirect("user_delete.jsp?message=error");

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

    }

    }


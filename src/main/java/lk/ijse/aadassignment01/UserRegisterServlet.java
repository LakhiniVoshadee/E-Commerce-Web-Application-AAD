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

@WebServlet(name = "UserRegisterServlet",value = "/user-register")
public class UserRegisterServlet extends HttpServlet {
    String DB_URL = "jdbc:mysql://localhost:3306/ecommerce";
    String DB_USER = "root";
    String DB_PASSWORD = "IJSE@123";

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String user_name = req.getParameter("user_name");
        String password = req.getParameter("password");
        String email = req.getParameter("email");
        String active = req.getParameter("active");

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");


            Connection connection = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
            String sql = "insert into users(user_name,password,email,active) values(?,?,?,?)";
            PreparedStatement preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setString(1, user_name);
            preparedStatement.setString(2, password);
            preparedStatement.setString(3, email);
            preparedStatement.setString(4, active);

            int i = preparedStatement.executeUpdate();
            preparedStatement.close();
            connection.close();
            if (i > 0) {
                resp.sendRedirect("user_register.jsp?message=User Registered Successfully!");
            } else {
                resp.sendRedirect("user_register.jsp?error=Something went wrong!");
            }

        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();

        }





    }
}

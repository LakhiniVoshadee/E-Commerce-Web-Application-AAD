package lk.ijse.aadassignment01;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import lk.ijse.aadassignment01.dto.UserDTO;

import java.io.IOException;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "UserAllServlet", value = "/user_list")
public class UserAllServlet extends HttpServlet {
    String DB_URL = "jdbc:mysql://localhost:3306/ecommerce";
    String DB_USER = "root";
    String DB_PASSWORD = "IJSE@123";

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        List<UserDTO> userList = new ArrayList<>();

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection connection = DriverManager.getConnection(
                    DB_URL,
                    DB_USER,
                    DB_PASSWORD
            );

            String sql = "SELECT * FROM users";
            Statement stm = connection.createStatement();
            ResultSet resultSet = stm.executeQuery(sql);
            while (resultSet.next()) {
                UserDTO userDTO = new UserDTO(
                        resultSet.getInt(1),
                        resultSet.getString(2),
                        resultSet.getString(3),
                        resultSet.getString(4),
                        resultSet.getString(5)
                );
                userList.add(userDTO);
            }
            req.setAttribute("users", userList);
            RequestDispatcher requestDispatcher = req.getRequestDispatcher("user_list.jsp");
            requestDispatcher.forward(req, resp);

        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
            resp.sendRedirect("user_list.jsp?error=Failed to retrieve users");

        }

    }
}

package lk.ijse.aadassignment01;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {
    private static final String DB_URL = "jdbc:mysql://localhost:3306/ecommerce";
    private static final String DB_USER = "root";
    private static final String DB_PASSWORD = "IJSE@123";

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String user_name = req.getParameter("user_name");
        String password = req.getParameter("password");

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            try (Connection conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD)) {
                String sql = "SELECT * FROM users WHERE user_name = ? AND password = ?";
                try (PreparedStatement pstmt = conn.prepareStatement(sql)) {
                    pstmt.setString(1, user_name);
                    pstmt.setString(2, password);

                    try (ResultSet rs = pstmt.executeQuery()) {
                        if (rs.next()) {
                            // Successful login
                            HttpSession session = req.getSession();
                            session.setAttribute("userId", rs.getString("user_id"));
                            session.setAttribute("username", user_name);
                            session.setAttribute("role", rs.getString("role"));

                            resp.sendRedirect("dashboard.jsp");
                        } else {
                            // Failed login
                            resp.sendRedirect("login.jsp?error=Invalid Credentials");
                        }
                    }
                }
            }
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
            resp.sendRedirect("login.jsp?error=" + e.getMessage());
        }
    }
}
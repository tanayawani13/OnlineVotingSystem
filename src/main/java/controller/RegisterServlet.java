package controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.sql.*;

import dao.DBConnection;

@WebServlet("/RegisterServlet")
public class RegisterServlet extends HttpServlet {

    protected void doPost(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {

        res.setContentType("text/html");

        String fullname = req.getParameter("fullname");
        String email = req.getParameter("email");
        String password = req.getParameter("password");
        String confirmPassword = req.getParameter("confirmPassword");

        try {
            Connection con = DBConnection.getConnection();

            // Password match
            if (!password.equals(confirmPassword)) {
                res.getWriter().println("Passwords do not match!");
                return;
            }

            // Strong Password Check
            String regex = "^(?=.*[a-z])(?=.*[A-Z])(?=.*\\d)(?=.*[@#$%^&+=!]).{8,10}$";

            if (!password.matches(regex)) {
                res.getWriter().println("Password must contain:<br>"
                        + "1 Capital letter<br>"
                        + "1 Small letter<br>"
                        + "1 Number<br>"
                        + "1 Special symbol<br>"
                        + "Length 8 to 10");
                return;
            }

            // Duplicate email check
            PreparedStatement check = con.prepareStatement(
                    "SELECT * FROM users WHERE email=?");
            check.setString(1, email);
            ResultSet rs = check.executeQuery();

            if (rs.next()) {
                res.getWriter().println("Email already exists!");
                return;
            }

            // Insert
            PreparedStatement ps = con.prepareStatement(
                    "INSERT INTO users(fullname,email,password) VALUES(?,?,?)");

            ps.setString(1, fullname);
            ps.setString(2, email);
            ps.setString(3, password);

            int i = ps.executeUpdate();

            if (i > 0) {
                res.sendRedirect("login.jsp?msg=registered");
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
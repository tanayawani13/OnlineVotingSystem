package controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.sql.*;

import dao.DBConnection;

@WebServlet("/AddNomineeServlet")
public class AddNomineeServlet extends HttpServlet {

    protected void doPost(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {

        int categoryId = Integer.parseInt(req.getParameter("categoryId"));
        String nominee = req.getParameter("nominee");
        String image = req.getParameter("image");

        try {
            Connection con = DBConnection.getConnection();

            PreparedStatement ps = con.prepareStatement(
                "INSERT INTO nominees(category_id, nominee_name, image_path) VALUES (?, ?, ?)"
            );

            ps.setInt(1, categoryId);
            ps.setString(2, nominee);
            ps.setString(3, image);

            ps.executeUpdate();

            // ✅ Redirect properly
            res.sendRedirect(req.getContextPath() + "/adminDashboard.jsp?msg=Nominee Added");

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
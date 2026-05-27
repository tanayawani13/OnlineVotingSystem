package controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.sql.*;

import dao.DBConnection;

@WebServlet("/FinalVoteServlet")
public class FinalVoteServlet extends HttpServlet {

    protected void doPost(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {

        res.setContentType("text/html");

        try {
            HttpSession session = req.getSession();
            Integer userId = (Integer) session.getAttribute("userId");

            // ✅ CHECK LOGIN
            if (userId == null) {
                res.sendRedirect("login.jsp");
                return;
            }

            Connection con = DBConnection.getConnection();

            // ✅ CHECK IF USER ALREADY VOTED
            PreparedStatement check = con.prepareStatement(
                "SELECT * FROM votes WHERE user_id=?"
            );
            check.setInt(1, userId);
            ResultSet rs = check.executeQuery();

            if (rs.next()) {
                res.sendRedirect("index.jsp?msg=already");
                return;
            }

            // 🔥 GET ALL CATEGORIES (DYNAMIC)
            PreparedStatement ps = con.prepareStatement(
                "SELECT * FROM categories"
            );
            ResultSet catRs = ps.executeQuery();

            while (catRs.next()) {

                int categoryId = catRs.getInt("id");

                // 🔥 FORM PARAMETER NAME
                String paramName = "category_" + categoryId;

                String value = req.getParameter(paramName);

                // ✅ SAFETY CHECK
                if (value == null) {
                    continue; // skip if nothing selected (just in case)
                }

                int nomineeId = Integer.parseInt(value);

                // ✅ INSERT VOTE
                PreparedStatement ps2 = con.prepareStatement(
                    "INSERT INTO votes(user_id, category_id, nominee_id) VALUES (?, ?, ?)"
                );
                ps2.setInt(1, userId);
                ps2.setInt(2, categoryId);
                ps2.setInt(3, nomineeId);
                ps2.executeUpdate();

                // ✅ UPDATE VOTE COUNT
                PreparedStatement ps3 = con.prepareStatement(
                    "UPDATE nominees SET vote_count = vote_count + 1 WHERE id=?"
                );
                ps3.setInt(1, nomineeId);
                ps3.executeUpdate();
            }

            // ✅ REDIRECT SUCCESS
            res.sendRedirect("success.jsp");

        } catch (Exception e) {
            e.printStackTrace();
            res.getWriter().println("ERROR: " + e.getMessage());
        }
    }
}
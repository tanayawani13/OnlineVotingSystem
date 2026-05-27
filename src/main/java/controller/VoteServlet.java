package controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.sql.*;

import dao.DBConnection;

@WebServlet("/VoteServlet")
public class VoteServlet extends HttpServlet {

    protected void doPost(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {

        HttpSession session = req.getSession();
        Integer userId = (Integer) session.getAttribute("userId");

        if (userId == null) {
            res.sendRedirect("login.jsp");
            return;
        }

        try {
            Connection con = DBConnection.getConnection();

            // ✅ Check if user already voted
            PreparedStatement check = con.prepareStatement(
                "SELECT * FROM votes WHERE user_id=?"
            );
            check.setInt(1, userId);
            ResultSet rs = check.executeQuery();

            if (rs.next()) {
                res.getWriter().println("You have already voted!");
                return;
            }

            // Get values
            int movie = Integer.parseInt(req.getParameter("movie"));
            int actor = Integer.parseInt(req.getParameter("actor"));
            int actress = Integer.parseInt(req.getParameter("actress"));
            int song = Integer.parseInt(req.getParameter("song"));

            // Insert votes
            insertVote(con, userId, 1, movie);
            insertVote(con, userId, 2, actor);
            insertVote(con, userId, 3, actress);
            insertVote(con, userId, 4, song);

            res.sendRedirect("result.jsp");

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    private void insertVote(Connection con, int userId, int categoryId, int nomineeId) throws Exception {

        PreparedStatement ps = con.prepareStatement(
            "INSERT INTO votes(user_id, category_id, nominee_id) VALUES (?, ?, ?)"
        );
        ps.setInt(1, userId);
        ps.setInt(2, categoryId);
        ps.setInt(3, nomineeId);
        ps.executeUpdate();

        PreparedStatement ps2 = con.prepareStatement(
            "UPDATE nominees SET vote_count = vote_count + 1 WHERE id=?"
        );
        ps2.setInt(1, nomineeId);
        ps2.executeUpdate();
    }
}
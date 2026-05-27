package controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.sql.*;

import dao.DBConnection;

@WebServlet("/DeleteCategoryServlet")
public class DeleteCategoryServlet extends HttpServlet {

    protected void doGet(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {

        try {

            int id = Integer.parseInt(req.getParameter("id"));

            Connection con = DBConnection.getConnection();

            // delete nominees first
            PreparedStatement ps1 =
                    con.prepareStatement("DELETE FROM nominees WHERE category_id=?");
            ps1.setInt(1, id);
            ps1.executeUpdate();

            // delete category
            PreparedStatement ps2 =
                    con.prepareStatement("DELETE FROM categories WHERE id=?");
            ps2.setInt(1, id);
            ps2.executeUpdate();

            // redirect properly
            res.sendRedirect(req.getContextPath() + "/deleteCategory.jsp");

        } catch (Exception e) {
            e.printStackTrace();
            res.getWriter().println("Error : " + e.getMessage());
        }
    }
}
package controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.sql.*;

import dao.DBConnection;

@WebServlet("/DeleteNomineeServlet")
public class DeleteNomineeServlet extends HttpServlet {

    protected void doPost(HttpServletRequest req,
            HttpServletResponse res)
            throws ServletException, IOException {

        int id = Integer.parseInt(req.getParameter("id"));

        try{
            Connection con = DBConnection.getConnection();

            PreparedStatement ps =
            con.prepareStatement(
            "delete from nominees where id=?");

            ps.setInt(1,id);

            ps.executeUpdate();

            res.sendRedirect("adminDashboard.jsp");

        }catch(Exception e){
            e.printStackTrace();
        }
    }
}
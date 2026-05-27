package controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;

@WebServlet("/AdminLogoutServlet")
public class AdminLogoutServlet extends HttpServlet {

    protected void doGet(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {

        // Get existing session (do not create new one)
        HttpSession session = req.getSession(false);

        // If session exists → destroy it
        if (session != null) {
            session.invalidate();
        }

        // Redirect to admin login page
        res.sendRedirect(req.getContextPath() + "/adminLogin.jsp");
    }
}
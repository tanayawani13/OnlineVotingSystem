package controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;

@WebServlet("/LogoutServlet")
public class LogoutServlet extends HttpServlet {

    protected void doGet(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {

        // Destroy session
        HttpSession session = req.getSession(false);

        if (session != null) {
            session.invalidate();
        }

        // Redirect to home page
        res.sendRedirect("index.jsp");
    }
}
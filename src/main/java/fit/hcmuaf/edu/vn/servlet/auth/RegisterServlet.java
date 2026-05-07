package fit.hcmuaf.edu.vn.servlet.auth;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.*;
import java.io.IOException;

public class RegisterServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        req.getRequestDispatcher("/views/auth/register.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        // TODO: Save user to database
        String username = req.getParameter("username");
        // For now, just redirect to login with success
        resp.sendRedirect(req.getContextPath() + "/login?registered=true");
    }
}

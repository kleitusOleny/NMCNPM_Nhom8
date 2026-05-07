package fit.hcmuaf.edu.vn.servlet.auth;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;

public class LoginServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        HttpSession session = req.getSession(false);
        if (session != null && session.getAttribute("user") != null) {
            resp.sendRedirect(req.getContextPath() + "/lobby");
            return;
        }
        req.getRequestDispatcher("/views/auth/login.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        String username = req.getParameter("identifier");
        String password = req.getParameter("password");
        boolean rememberMe = "on".equals(req.getParameter("rememberMe"));
        if ("admin".equals(username) && "admin".equals(password)) {
            HttpSession session = req.getSession(true);
            session.setAttribute("user", username);
            session.setAttribute("role", "admin");
            session.setAttribute("displayName", "Admin");
            if (rememberMe) session.setMaxInactiveInterval(7 * 24 * 60 * 60); // 7 days
            resp.sendRedirect(req.getContextPath() + "/admin/dashboard");
        } else if ("user".equals(username) && "user".equals(password)) {
            HttpSession session = req.getSession(true);
            session.setAttribute("user", username);
            session.setAttribute("role", "user");
            session.setAttribute("displayName", "Người dùng");
            resp.sendRedirect(req.getContextPath() + "/lobby");
        } else {
            req.setAttribute("errorMsg", "Tên đăng nhập hoặc mật khẩu không đúng");
            req.getRequestDispatcher("/views/auth/login.jsp").forward(req, resp);
        }
    }
}

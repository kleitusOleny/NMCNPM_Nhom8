package fit.hcmuaf.edu.vn.servlet.admin;

import fit.hcmuaf.edu.vn.dao.UserDAO;
import fit.hcmuaf.edu.vn.model.User;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.util.List;

public class AdminUsersServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        HttpSession session = req.getSession(false);
        if (session == null || !"admin".equals(session.getAttribute("role"))) {
            resp.sendRedirect(req.getContextPath() + "/login");
            return;
        }
        
        UserDAO userDAO = new UserDAO();
        List<User> list = userDAO.findAll();
        
        req.setAttribute("userList", list);
        req.getRequestDispatcher("/views/admin/users.jsp").forward(req, resp);
    }
}

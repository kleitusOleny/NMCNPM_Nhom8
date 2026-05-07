package fit.hcmuaf.edu.vn.servlet.game;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.*;
import java.io.IOException;

public class GameServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        HttpSession session = req.getSession(false);
        if (session == null || session.getAttribute("user") == null) {
            resp.sendRedirect(req.getContextPath() + "/login");
            return;
        }
        String pathInfo = req.getPathInfo(); // e.g. /1058/detail or /1058/join
        if (pathInfo != null && pathInfo.endsWith("/detail")) {
            req.getRequestDispatcher("/views/game/detail.jsp").forward(req, resp);
        } else {
            req.getRequestDispatcher("/views/game/board.jsp").forward(req, resp);
        }
    }
}

package fit.hcmuaf.edu.vn.servlet.game;

import fit.hcmuaf.edu.vn.dao.GameRoomDAO;
import fit.hcmuaf.edu.vn.dao.RoomDAO;
import fit.hcmuaf.edu.vn.model.GameRoom;
import jakarta.servlet.ServletConfig;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.util.List;

public class LobbyServlet extends HttpServlet {
    private GameRoomDAO roomDAO;

    @Override
    public void init(ServletConfig config) throws ServletException {
        roomDAO = new GameRoomDAO();
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        HttpSession session = req.getSession(false);
        if (session == null || session.getAttribute("user") == null) {
            resp.sendRedirect(req.getContextPath() + "/login");
            return;
        }

        String type = req.getParameter("type");
        String search = req.getParameter("search");
        GameRoomDAO roomDAO = new GameRoomDAO();
        List<GameRoom> filteredRooms = roomDAO.findRooms(type, search);
        req.setAttribute("rooms", filteredRooms);

        req.setAttribute("currentType", (type == null || type.isEmpty()) ? "all" : type);
        req.setAttribute("currentSearch", search);
        req.getRequestDispatcher("/views/lobby/lobby.jsp").forward(req, resp);
    }
}

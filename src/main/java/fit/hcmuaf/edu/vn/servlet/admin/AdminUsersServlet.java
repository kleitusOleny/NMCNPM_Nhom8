//package fit.hcmuaf.edu.vn.servlet.admin;
//
//import fit.hcmuaf.edu.vn.dao.UserDAO;
//import fit.hcmuaf.edu.vn.model.User;
//
//import jakarta.servlet.ServletException;
//import jakarta.servlet.http.*;
//
//import java.io.IOException;
//import java.util.List;
//
//public class AdminUsersServlet extends HttpServlet {
//
//    private final UserDAO userDAO = new UserDAO();
//
//    @Override
//    protected void doGet(HttpServletRequest req,
//                         HttpServletResponse resp)
//            throws ServletException, IOException {
//
//        HttpSession session = req.getSession(false);
//
//        // CHECK ADMIN
//        if (session == null ||
//                !"admin".equals(session.getAttribute("role"))) {
//
//            resp.sendRedirect(
//                    req.getContextPath() + "/login"
//            );
//
//            return;
//        }
//
//        int page = 1;
//
//        int size = 10;
//
//        String pageParam = req.getParameter("page");
//
//        if (pageParam != null) {
//
//            page = Integer.parseInt(pageParam);
//        }
//
//        String keyword = req.getParameter("keyword");
//
//        if (keyword == null) {
//
//            keyword = "";
//        }
//
//        List<User> users =
//                userDAO.findUsersWithPagination(
//                        page,
//                        size,
//                        keyword
//                );
//
//        long totalUsers =
//                userDAO.countUsers(keyword);
//
//        long totalPages =
//                (long) Math.ceil((double) totalUsers / size);
//
//        req.setAttribute("userList", users);
//
//        req.setAttribute("currentPage", page);
//
//        req.setAttribute("totalPages", totalPages);
//
//        req.setAttribute("keyword", keyword);
//
//        req.setAttribute("totalUsers", totalUsers);
//
//        req.getRequestDispatcher(
//                "/views/admin/users.jsp"
//        ).forward(req, resp);
//    }
//
//    @Override
//    protected void doPost(HttpServletRequest req,
//                          HttpServletResponse resp)
//            throws ServletException, IOException {
//
//        HttpSession session = req.getSession(false);
//
//        if (session == null ||
//                !"admin".equals(session.getAttribute("role"))) {
//
//            resp.sendRedirect(
//                    req.getContextPath() + "/login"
//            );
//
//            return;
//        }
//
//        Long userId =
//                Long.parseLong(req.getParameter("userId"));
//
//        User target = userDAO.findById(userId);
//
//        if (target == null) {
//
//            req.setAttribute(
//                    "error",
//                    "Người dùng không tồn tại"
//            );
//
//            doGet(req, resp);
//
//            return;
//        }
//
//        // KHÔNG CHO KHÓA ADMIN
//        if ("admin".equalsIgnoreCase(target.getRole())) {
//
//            req.setAttribute(
//                    "error",
//                    "Không thể khóa tài khoản Admin"
//            );
//
//            doGet(req, resp);
//
//            return;
//        }
//
//        boolean success =
//                userDAO.toggleStatus(userId);
//
//        if (success) {
//
//            req.setAttribute(
//                    "message",
//                    "Cập nhật trạng thái thành công"
//            );
//
//        } else {
//
//            req.setAttribute(
//                    "error",
//                    "Cập nhật trạng thái thất bại"
//            );
//        }
//
//        doGet(req, resp);
//    }
//}
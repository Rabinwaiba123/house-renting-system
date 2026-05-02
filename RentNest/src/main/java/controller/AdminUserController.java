package controller;

import java.io.IOException;
import java.util.List;

import dao.UserDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.User;

@WebServlet("/admin/users")
public class AdminUserController extends HttpServlet {

    private static final long serialVersionUID = 1L;
    private UserDAO userDAO = new UserDAO();

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        List<User> users = userDAO.getAllUsers();
        request.setAttribute("users", users);

        request.getRequestDispatcher("/admin/admin-users.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        int userId = Integer.parseInt(request.getParameter("userId"));
        String action = request.getParameter("action");

        if ("approve".equals(action)) {
            userDAO.updateUserStatus(userId, "ACTIVE");
        } else if ("reject".equals(action)) {
            userDAO.updateUserStatus(userId, "REJECTED");
        } else if ("delete".equals(action)) {
            userDAO.deleteUser(userId);
        }

        response.sendRedirect(request.getContextPath() + "/admin/users");
    }
}
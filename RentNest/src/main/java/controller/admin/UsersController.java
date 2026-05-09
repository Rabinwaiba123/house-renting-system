package controller.admin;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.User;
import service.UserService;

import java.io.IOException;
import java.util.List;

@WebServlet("/admin/users")
public class UsersController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private UserService userService = new UserService();

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		List<User> users = userService.getAllUsers();

		request.setAttribute("users", users);

		request.getRequestDispatcher("/WEB-INF/pages/admin/users.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String action = request.getParameter("action");
		int userId = Integer.parseInt(request.getParameter("userId"));

		int status = 0;

		if ("approve".equals(action)) {
			status = userService.approveUser(userId);
		} else if ("delete".equals(action)) {
			status = userService.deleteUser(userId);
		}

		if (status > 0) {
			response.sendRedirect(request.getContextPath() + "/admin/users?success=done");
		} else {
			response.sendRedirect(request.getContextPath() + "/admin/users?error=failed");
		}
	}
}
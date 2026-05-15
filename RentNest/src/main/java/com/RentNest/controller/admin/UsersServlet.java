package com.RentNest.controller.admin;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;

import com.RentNest.model.User;
import com.RentNest.service.UserService;

@WebServlet(asyncSupported = true, urlPatterns = { "/admin/users" })
public class UsersServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public UsersServlet() {
		super();
	}

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
		} else if ("reject".equals(action)) {
			status = userService.rejectUser(userId);
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
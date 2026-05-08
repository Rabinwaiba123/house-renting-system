package controller;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import model.User;
import service.LoginService;
import util.CookieUtil;
import util.SessionUtil;

@WebServlet("/login")
public class LoginController extends HttpServlet {

	private static final long serialVersionUID = 1L;

	private LoginService loginService = new LoginService();

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.getRequestDispatcher("/WEB-INF/pages/auth/login.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String email = request.getParameter("email");
		String password = request.getParameter("password");
		String remember = request.getParameter("remember");

		if (email == null || email.trim().isEmpty()) {
			request.setAttribute("errorMessage", "Email is required.");
			request.getRequestDispatcher("/WEB-INF/pages/auth/login.jsp").forward(request, response);
			return;
		}

		if (password == null || password.trim().isEmpty()) {
			request.setAttribute("errorMessage", "Password is required.");
			request.getRequestDispatcher("/WEB-INF/pages/auth/login.jsp").forward(request, response);
			return;
		}

		User user = loginService.login(email, password);

		if (user == null) {
			request.setAttribute("errorMessage", "Invalid email or password.");
			request.getRequestDispatcher("/WEB-INF/pages/auth/login.jsp").forward(request, response);
			return;
		}

		SessionUtil.setAttribute(request, "user", user);
		SessionUtil.setAttribute(request, "loggedInUser", user);
		SessionUtil.setAttribute(request, "userId", user.getUserId());
		SessionUtil.setAttribute(request, "fullName", user.getFullName());
		SessionUtil.setAttribute(request, "role", user.getRole());

		if (remember != null) {
			CookieUtil.addCookie(response, "userEmail", user.getEmail(), 60 * 60 * 24 * 7);
		} else {
			CookieUtil.deleteCookie(response, "userEmail");
		}

		String role = user.getRole();

		if ("admin".equalsIgnoreCase(role)) {
			response.sendRedirect(request.getContextPath() + "/admin/dashboard");
		} else if ("owner".equalsIgnoreCase(role)) {
			response.sendRedirect(request.getContextPath() + "/owner/dashboard");
		} else {
			response.sendRedirect(request.getContextPath() + "/home");
		}
	}
}
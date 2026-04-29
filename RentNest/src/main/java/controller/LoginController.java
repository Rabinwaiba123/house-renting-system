package controller;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import model.User;
import service.LoginService;

@WebServlet("/login")
public class LoginController extends HttpServlet {

	private static final long serialVersionUID = 1L;

	private LoginService loginService = new LoginService();

	// LOAD LOGIN PAGE
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.getRequestDispatcher("/auth/login.jsp").forward(request, response);
	}

	// HANDLE LOGIN
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String email = request.getParameter("email");
		String password = request.getParameter("password");
		String remember = request.getParameter("remember");

		// VALIDATION
		if (email == null || email.trim().isEmpty()) {
			request.setAttribute("errorMessage", "Email is required.");
			request.getRequestDispatcher("/auth/login.jsp").forward(request, response);
			return;
		}

		if (password == null || password.trim().isEmpty()) {
			request.setAttribute("errorMessage", "Password is required.");
			request.getRequestDispatcher("/auth/login.jsp").forward(request, response);
			return;
		}

		// LOGIN SERVICE
		User user = loginService.login(email, password);

		if (user == null) {
			request.setAttribute("errorMessage", "Invalid email or password.");
			request.getRequestDispatcher("/auth/login.jsp").forward(request, response);
			return;
		}

		// CHECK STATUS
		if (!"ACTIVE".equalsIgnoreCase(user.getStatus())) {
			request.setAttribute("errorMessage", "Your account is not active.");
			request.getRequestDispatcher("/auth/login.jsp").forward(request, response);
			return;
		}

		// CREATE SESSION
		HttpSession session = request.getSession();

		session.setAttribute("user", user); // for navbar
		session.setAttribute("loggedInUser", user); // optional
		session.setAttribute("userId", user.getUserId());
		session.setAttribute("fullName", user.getFullName());
		session.setAttribute("role", user.getRole());

		// REMEMBER ME COOKIE
		if (remember != null) {
			Cookie emailCookie = new Cookie("userEmail", user.getEmail());
			emailCookie.setMaxAge(60 * 60 * 24 * 7); // 7 days
			emailCookie.setPath(request.getContextPath());
			response.addCookie(emailCookie);
		}

		// ROLE BASED REDIRECT
		String role = user.getRole();

		if ("admin".equalsIgnoreCase(role)) {
			response.sendRedirect(request.getContextPath() + "/admin/admin-dashboard.jsp");

		} else if ("owner".equalsIgnoreCase(role)) {
			response.sendRedirect(request.getContextPath() + "/owner/owner-dashboard.jsp");

		} else {
			response.sendRedirect(request.getContextPath() + "/index.jsp");
		}
	}
}
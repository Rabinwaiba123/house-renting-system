package com.RentNest.controller;

import java.io.IOException;

import com.RentNest.model.User;
import com.RentNest.service.LoginService;
import com.RentNest.util.CookieUtil;
import com.RentNest.util.SessionUtil;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;


@WebServlet(asyncSupported = true, urlPatterns = { "/login"})

public class LoginServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;

	public LoginServlet() {
		super();
	}

	private LoginService loginService = new LoginService();

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		if ("registered".equals(request.getParameter("success"))) {

			request.setAttribute("successMessage", "Registration successful. Please wait for admin approval.");
		}

		request.getRequestDispatcher("/WEB-INF/pages/auth/login.jsp").forward(request, response);
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String email = request.getParameter("email");
		String password = request.getParameter("password");
		String remember = request.getParameter("remember");

		// ================= VALIDATION =================
		String validationMessage = loginService.validateLogin(email, password);

		if (validationMessage != null) {

			request.setAttribute("errorMessage", validationMessage);

			request.getRequestDispatcher("/WEB-INF/pages/auth/login.jsp").forward(request, response);

			return;
		}

		// ================= LOGIN =================
		User user = loginService.login(email, password);

		if (user == null) {

			request.setAttribute("errorMessage", "Invalid email or password.");

			request.getRequestDispatcher("/WEB-INF/pages/auth/login.jsp").forward(request, response);

			return;
		}

		// ================= ADMIN APPROVAL =================
		if (!user.isStatus()) {

			request.setAttribute("errorMessage", "Your account is waiting for admin approval.");

			request.getRequestDispatcher("/WEB-INF/pages/auth/login.jsp").forward(request, response);

			return;
		}

		// ================= SESSION =================
		SessionUtil.setAttribute(request, "user", user);

		SessionUtil.setAttribute(request, "userId", user.getUserId());

		SessionUtil.setAttribute(request, "role", user.getRole());

		// ================= REMEMBER ME COOKIE =================
		if (remember != null) {

			CookieUtil.addCookie(response, "rememberEmail", email, 60 * 60 * 24 * 7);

		} else {

			CookieUtil.deleteCookie(response, "rememberEmail");
		}

		// ================= ROLE BASED REDIRECT =================
		if ("admin".equalsIgnoreCase(user.getRole())) {

			response.sendRedirect(request.getContextPath() + "/admin/dashboard");

		} else {

			response.sendRedirect(request.getContextPath() + "/home");
		}
	}
}
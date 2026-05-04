package controller;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import util.SessionUtil;

@WebServlet("/admin/dashboard")
public class AdminDashboardController extends HttpServlet {

	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String role = (String) SessionUtil.getAttribute(request, "role");

		if (role == null) {
			response.sendRedirect(request.getContextPath() + "/login");
			return;
		}

		if (!role.equalsIgnoreCase("admin")) {
			response.sendRedirect(request.getContextPath() + "/access-denied");
			return;
		}

		request.getRequestDispatcher("/WEB-INF/pages/admin/admin-dashboard.jsp").forward(request, response);
	}
}
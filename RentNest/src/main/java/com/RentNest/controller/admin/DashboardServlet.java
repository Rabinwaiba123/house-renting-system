package com.RentNest.controller.admin;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;

import com.RentNest.dao.*;

@WebServlet(asyncSupported = true, urlPatterns = { "/admin/dashboard" })
public class DashboardServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private final UserDAO userDAO = new UserDAO();
	private final BookingDAO bookingDAO = new BookingDAO();
	private final PropertyDAO propertyDAO = new PropertyDAO();
	private final ContactDAO contactDAO = new ContactDAO();

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.setAttribute("totalUsers", userDAO.getAllUsers().size());
		request.setAttribute("totalBookings", bookingDAO.getAllBookings().size());
		request.setAttribute("totalProperties", propertyDAO.getAllAdminProperties().size());
		request.setAttribute("totalContacts", contactDAO.getAllContacts().size());

		request.getRequestDispatcher("/WEB-INF/pages/admin/dashboard.jsp").forward(request, response);
	}
}
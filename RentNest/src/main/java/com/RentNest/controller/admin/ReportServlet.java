package com.RentNest.controller.admin;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.util.List;

import com.RentNest.dao.*;
import com.RentNest.model.Booking;
import com.RentNest.model.Property;

@WebServlet(asyncSupported = true, urlPatterns = { "/admin/report" })
public class ReportServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private final UserDAO userDAO = new UserDAO();
	private final BookingDAO bookingDAO = new BookingDAO();
	private final PropertyDAO propertyDAO = new PropertyDAO();
	private final ContactDAO contactDAO = new ContactDAO();

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		List<Property> properties = propertyDAO.getAllAdminProperties();
		List<Booking> bookings = bookingDAO.getAllBookings();

		long totalProperties = properties.size();
		long availableProperties = properties.stream().filter(Property::isAvailability).count();
		long bookedProperties = totalProperties - availableProperties;

		long totalBookings = bookings.size();

		request.setAttribute("totalBookings", totalBookings);

		request.setAttribute("totalUsers", userDAO.getAllUsers().size());
		request.setAttribute("totalBookings", totalBookings);
		request.setAttribute("totalProperties", totalProperties);
		request.setAttribute("totalContacts", contactDAO.getAllContacts().size());

		request.setAttribute("availableProperties", availableProperties);
		request.setAttribute("bookedProperties", bookedProperties);

		request.getRequestDispatcher("/WEB-INF/pages/admin/report.jsp").forward(request, response);
	}
}
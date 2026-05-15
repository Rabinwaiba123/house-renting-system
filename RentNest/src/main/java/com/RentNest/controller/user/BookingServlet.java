package com.RentNest.controller.user;

import java.io.IOException;

import com.RentNest.model.Booking;
import com.RentNest.model.User;
import com.RentNest.service.BookingService;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

@WebServlet("/booking")
public class BookingServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private BookingService bookingService = new BookingService();

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		HttpSession session = request.getSession(false);

		if (session == null || session.getAttribute("user") == null) {
			response.sendRedirect(request.getContextPath() + "/login");
			return;
		}

		User user = (User) session.getAttribute("user");

		try {
			int propertyId = Integer.parseInt(request.getParameter("propertyId"));
			String moveInDateStr = request.getParameter("moveInDate");

			java.sql.Date moveInDate = java.sql.Date.valueOf(moveInDateStr);
			int durationMonths = Integer.parseInt(request.getParameter("durationMonths"));
			String message = request.getParameter("message");

			Booking booking = new Booking();
			booking.setPropertyId(propertyId);
			booking.setUserId(user.getUserId());
			booking.setMoveInDate(moveInDate);
			booking.setDurationMonths(durationMonths);
			booking.setMessage(message);

			boolean isBooked = bookingService.addBooking(booking);

			if (isBooked) {
				session.setAttribute("success", "Booking request sent successfully.");
			} else {
				session.setAttribute("error", "Failed to send booking request.");
			}

			response.sendRedirect(request.getContextPath() + "/property-detail?id=" + propertyId);

		} catch (Exception e) {
			e.printStackTrace();
			session.setAttribute("error", "Invalid booking details.");
			response.sendRedirect(request.getContextPath() + "/properties");
		}
	}
}
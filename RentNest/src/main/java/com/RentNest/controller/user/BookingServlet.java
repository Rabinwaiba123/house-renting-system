package com.RentNest.controller.user;

import java.io.IOException;

import com.RentNest.model.Booking;
import com.RentNest.model.User;
import com.RentNest.service.BookingService;
import com.RentNest.service.PropertyService;
import com.RentNest.util.SessionUtil;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet(asyncSupported = true, urlPatterns = { "/booking" })
public class BookingServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private BookingService bookingService = new BookingService();
	private PropertyService propertyService = new PropertyService();

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		User user = (User) SessionUtil.getAttribute(request, "user");

		if (user == null) {
			response.sendRedirect(request.getContextPath() + "/login");
			return;
		}

		try {
			int propertyId = Integer.parseInt(request.getParameter("propertyId"));

			if (bookingService.bookingExists(user.getUserId(), propertyId)) {
				request.getSession().setAttribute("error", "You have already booked this property.");
				response.sendRedirect(request.getContextPath() + "/property-detail?id=" + propertyId);
				return;
			}

			Booking booking = new Booking();

			booking.setUserId(user.getUserId());
			booking.setPropertyId(propertyId);
			booking.setMoveInDate(java.sql.Date.valueOf(request.getParameter("moveInDate")));
			booking.setDurationMonths(Integer.parseInt(request.getParameter("durationMonths")));
			booking.setMessage(request.getParameter("message"));

			String validation = bookingService.validateBooking(booking);

			if (validation != null) {
				request.getSession().setAttribute("error", validation);
				response.sendRedirect(request.getContextPath() + "/property-detail?id=" + propertyId);
				return;
			}

			boolean result = bookingService.addBooking(booking);

			if (result) {
				propertyService.markPropertyAsUnavailable(propertyId);
				request.getSession().setAttribute("success", "Booking successful. This property is now unavailable.");
			} else {
				request.getSession().setAttribute("error", "Failed to send booking request.");
			}

			response.sendRedirect(request.getContextPath() + "/property-detail?id=" + propertyId);

		} catch (Exception e) {
			e.printStackTrace();
			request.getSession().setAttribute("error", "Invalid booking details.");
			response.sendRedirect(request.getContextPath() + "/properties");
		}
	}
}
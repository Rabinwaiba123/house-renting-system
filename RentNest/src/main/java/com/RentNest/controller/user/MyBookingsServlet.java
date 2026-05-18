package com.RentNest.controller.user;

import java.io.IOException;
import java.util.List;

import com.RentNest.model.Booking;
import com.RentNest.model.User;
import com.RentNest.service.BookingService;
import com.RentNest.util.SessionUtil;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

@WebServlet(asyncSupported = true, urlPatterns = { "/user/my-bookings" })
public class MyBookingsServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private BookingService bookingService = new BookingService();

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		User user = (User) SessionUtil.getAttribute(request, "user");

		if (user == null) {
			response.sendRedirect(request.getContextPath() + "/login");
			return;
		}

		List<Booking> bookings = bookingService.getBookingsByUserId(user.getUserId());
		request.setAttribute("bookings", bookings);

		request.getRequestDispatcher("/WEB-INF/pages/tenant/my-bookings.jsp").forward(request, response);
	}
}
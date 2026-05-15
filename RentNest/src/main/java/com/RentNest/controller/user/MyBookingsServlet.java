package com.RentNest.controller.user;

import java.io.IOException;
import java.util.List;

import com.RentNest.model.Booking;
import com.RentNest.model.User;
import com.RentNest.service.BookingService;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

@WebServlet("/my-bookings")
public class MyBookingsServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private BookingService bookingService = new BookingService();

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		HttpSession session = request.getSession(false);

		if (session == null || session.getAttribute("user") == null) {
			response.sendRedirect(request.getContextPath() + "/login");
			return;
		}

		User user = (User) session.getAttribute("user");

		List<Booking> bookings = bookingService.getBookingsByUserId(user.getUserId());

		request.setAttribute("bookings", bookings);

		request.getRequestDispatcher("/WEB-INF/pages/user/my-bookings.jsp").forward(request, response);
	}
}
package com.RentNest.controller.admin;

import java.io.IOException;
import java.util.List;

import com.RentNest.model.Booking;
import com.RentNest.service.BookingService;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

@WebServlet("/admin/manage-bookings")
public class BookingsServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private BookingService bookingService = new BookingService();

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		List<Booking> bookings = bookingService.getAllBookings();
		request.setAttribute("bookings", bookings);

		request.getRequestDispatcher("/WEB-INF/pages/admin/manage-bookings.jsp").forward(request, response);
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String action = request.getParameter("action");

		int bookingId = Integer.parseInt(request.getParameter("bookingId"));

		if ("delete".equals(action)) {
			bookingService.deleteBooking(bookingId);
		}

		response.sendRedirect(request.getContextPath() + "/admin/manage-bookings");
	}
}
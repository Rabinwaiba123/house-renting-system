package controller;

import java.io.IOException;
import java.util.List;

import dao.PropertyDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.Booking;
import model.User;
import service.BookingService;

@WebServlet("/booking")
public class BookingController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private BookingService bookingService = new BookingService();
	private PropertyDAO propertyDAO = new PropertyDAO();

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String action = request.getParameter("action");

		if (action == null) {
			action = "myBookings";
		}

		if (action.equals("book")) {
			showBookingForm(request, response);
		} else if (action.equals("myBookings")) {
			myBookings(request, response);
		} else if (action.equals("ownerRequests")) {
			ownerRequests(request, response);
		} else if (action.equals("adminBookings")) {
			adminBookings(request, response);
		} else if (action.equals("approve")) {
			updateStatus(request, response, "approved");
		} else if (action.equals("reject")) {
			updateStatus(request, response, "rejected");
		} else {
			response.sendRedirect("booking?action=myBookings");
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String action = request.getParameter("action");

		if (action.equals("sendRequest")) {
			sendBookingRequest(request, response);
		}
	}

	private User getLoggedUser(HttpServletRequest request) {
		HttpSession session = request.getSession(false);

		if (session == null) {
			return null;
		}

		return (User) session.getAttribute("user");
	}

	private void showBookingForm(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		User user = getLoggedUser(request);

		if (user == null) {
			response.sendRedirect(request.getContextPath() + "/login");
			return;
		}

		if (!"user".equalsIgnoreCase(user.getRole())) {
			response.sendRedirect(request.getContextPath() + "/error/access-denied.jsp");
			return;
		}

		int propertyId = Integer.parseInt(request.getParameter("propertyId"));

		request.setAttribute("propertyId", propertyId);
		request.getRequestDispatcher("/user/book-property.jsp").forward(request, response);
	}

	private void sendBookingRequest(HttpServletRequest request, HttpServletResponse response) throws IOException {

		User user = getLoggedUser(request);

		if (user == null) {
			response.sendRedirect(request.getContextPath() + "/login");
			return;
		}

		if (!"user".equalsIgnoreCase(user.getRole())) {
			response.sendRedirect(request.getContextPath() + "/error/access-denied.jsp");
			return;
		}

		int propertyId = Integer.parseInt(request.getParameter("propertyId"));
		int ownerId = propertyDAO.getOwnerIdByPropertyId(propertyId);

		Booking booking = new Booking();

		booking.setPropertyId(propertyId);
		booking.setTenantId(user.getUserId());
		booking.setOwnerId(ownerId);
		booking.setStartDate(request.getParameter("startDate"));
		booking.setEndDate(request.getParameter("endDate"));
		booking.setMessage(request.getParameter("message"));

		boolean result = bookingService.addBooking(booking);

		if (result) {
			response.sendRedirect(request.getContextPath() + "/booking?action=myBookings&success=requested");
		} else {
			response.sendRedirect(
					request.getContextPath() + "/booking?action=book&propertyId=" + propertyId + "&error=failed");
		}
	}

	private void myBookings(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		User user = getLoggedUser(request);

		if (user == null) {
			response.sendRedirect(request.getContextPath() + "/login");
			return;
		}

		if (!"user".equalsIgnoreCase(user.getRole())) {
			response.sendRedirect(request.getContextPath() + "/error/access-denied.jsp");
			return;
		}

		List<Booking> bookings = bookingService.getBookingsByTenant(user.getUserId());
		request.setAttribute("bookings", bookings);

		request.getRequestDispatcher("/user/my-bookings.jsp").forward(request, response);
	}

	private void ownerRequests(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		User user = getLoggedUser(request);

		if (user == null) {
			response.sendRedirect(request.getContextPath() + "/login");
			return;
		}

		if (!"owner".equalsIgnoreCase(user.getRole())) {
			response.sendRedirect(request.getContextPath() + "/error/access-denied.jsp");
			return;
		}

		List<Booking> bookings = bookingService.getBookingsByOwner(user.getUserId());
		request.setAttribute("bookings", bookings);

		request.getRequestDispatcher("/owner/owner-booking-requests.jsp").forward(request, response);
	}

	private void adminBookings(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		User user = getLoggedUser(request);

		if (user == null) {
			response.sendRedirect(request.getContextPath() + "/login");
			return;
		}

		if (!"admin".equalsIgnoreCase(user.getRole())) {
			response.sendRedirect(request.getContextPath() + "/error/access-denied.jsp");
			return;
		}

		List<Booking> bookings = bookingService.getAllBookings();
		request.setAttribute("bookings", bookings);

		request.getRequestDispatcher("/admin/admin-bookings.jsp").forward(request, response);
	}

	private void updateStatus(HttpServletRequest request, HttpServletResponse response, String status)
			throws IOException {

		User user = getLoggedUser(request);

		if (user == null) {
			response.sendRedirect(request.getContextPath() + "/login");
			return;
		}

		if (!"owner".equalsIgnoreCase(user.getRole())) {
			response.sendRedirect(request.getContextPath() + "/error/access-denied.jsp");
			return;
		}

		int bookingId = Integer.parseInt(request.getParameter("id"));

		bookingService.updateBookingStatus(bookingId, status);

		response.sendRedirect(request.getContextPath() + "/booking?action=ownerRequests");
	}
}
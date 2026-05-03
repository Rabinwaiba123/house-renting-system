package service;

import java.util.List;

import dao.BookingDAO;
import model.Booking;

public class BookingService {

	private BookingDAO bookingDAO = new BookingDAO();

	public boolean addBooking(Booking booking) {
		return bookingDAO.addBooking(booking);
	}

	public List<Booking> getBookingsByTenant(int tenantId) {
		return bookingDAO.getBookingsByTenant(tenantId);
	}

	public List<Booking> getBookingsByOwner(int ownerId) {
		return bookingDAO.getBookingsByOwner(ownerId);
	}

	public List<Booking> getAllBookings() {
		return bookingDAO.getAllBookings();
	}

	public boolean updateBookingStatus(int bookingId, String status) {
		return bookingDAO.updateBookingStatus(bookingId, status);
	}
}
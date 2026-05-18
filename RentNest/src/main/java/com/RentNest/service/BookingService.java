package com.RentNest.service;

import java.sql.Date;
import java.time.LocalDate;
import java.util.List;

import com.RentNest.dao.BookingDAO;
import com.RentNest.model.Booking;

public class BookingService {

	private BookingDAO bookingDAO = new BookingDAO();

	public String validateBooking(Booking booking) {
		if (booking.getMoveInDate() == null) {
			return "Move in date is required.";
		}

		if (booking.getMoveInDate().toLocalDate().isBefore(LocalDate.now())) {
			return "Move in date cannot be in the past.";
		}

		if (booking.getDurationMonths() <= 0) {
			return "Please select booking duration.";
		}

		return null;
	}

	public boolean addBooking(Booking booking) {
		booking.setBookingDate(Date.valueOf(LocalDate.now()));

		if (booking.getMessage() == null || booking.getMessage().trim().isEmpty()) {
			booking.setMessage("No message provided.");
		}

		return bookingDAO.addBooking(booking) > 0;
	}

	public List<Booking> getAllBookings() {
		return bookingDAO.getAllBookings();
	}

	public List<Booking> getBookingsByUserId(int userId) {
		return bookingDAO.getBookingsByUserId(userId);
	}

	public boolean deleteBooking(int bookingId) {
		return bookingDAO.deleteBooking(bookingId) > 0;
	}

	public boolean bookingExists(int userId, int propertyId) {
		return bookingDAO.bookingExists(userId, propertyId);
	}
}
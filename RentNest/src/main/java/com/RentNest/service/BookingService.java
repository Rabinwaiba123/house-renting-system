package com.RentNest.service;

import java.sql.Date;
import java.time.LocalDate;
import java.util.List;

import com.RentNest.dao.BookingDAO;
import com.RentNest.model.Booking;

public class BookingService {

	private BookingDAO bookingDAO = new BookingDAO();

	public boolean addBooking(Booking booking) {

		if (booking == null) {
			return false;
		}

		if (booking.getUserId() <= 0 || booking.getPropertyId() <= 0) {
			return false;
		}

		if (booking.getMoveInDate() == null) {
			return false;
		}

		if (booking.getDurationMonths() <= 0) {
			return false;
		}

		booking.setBookingDate(Date.valueOf(LocalDate.now()));

		return bookingDAO.addBooking(booking) > 0;
	}

	public List<Booking> getAllBookings() {
		return bookingDAO.getAllBookings();
	}

	public Booking getBookingById(int bookingId) {
		return bookingDAO.getBookingById(bookingId);
	}

	public List<Booking> getBookingsByUserId(int userId) {
		return bookingDAO.getBookingsByUserId(userId);
	}

	public boolean deleteBooking(int bookingId) {
		return bookingDAO.deleteBooking(bookingId) > 0;
	}
}
package com.RentNest.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.RentNest.model.Booking;
import com.RentNest.util.DBConnection;

public class BookingDAO {

	public int addBooking(Booking booking) {
		int status = 0;

		try (Connection con = DBConnection.getConnection()) {

			String sql = "INSERT INTO bookings(user_id, property_id, booking_date, move_in_date, duration_months, message, is_deleted) VALUES (?, ?, ?, ?, ?, ?, ?)";

			PreparedStatement ps = con.prepareStatement(sql);

			ps.setInt(1, booking.getUserId());
			ps.setInt(2, booking.getPropertyId());
			ps.setDate(3, booking.getBookingDate());
			ps.setDate(4, booking.getMoveInDate());
			ps.setInt(5, booking.getDurationMonths());
			ps.setString(6, booking.getMessage());
			ps.setBoolean(7, false);

			status = ps.executeUpdate();

		} catch (Exception ex) {
			ex.printStackTrace();
		}

		return status;
	}

	public List<Booking> getAllBookings() {
		List<Booking> list = new ArrayList<>();

		try (Connection con = DBConnection.getConnection()) {

			String sql = "SELECT b.*, u.full_name AS username, p.title AS property_title " + "FROM bookings b "
					+ "JOIN users u ON b.user_id = u.user_id " + "JOIN properties p ON b.property_id = p.property_id "
					+ "WHERE b.is_deleted = false " + "ORDER BY b.created_at DESC";

			PreparedStatement ps = con.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();

			while (rs.next()) {
				Booking b = new Booking();

				b.setBookingId(rs.getInt("booking_id"));
				b.setUserId(rs.getInt("user_id"));
				b.setPropertyId(rs.getInt("property_id"));
				b.setBookingDate(rs.getDate("booking_date"));
				b.setMoveInDate(rs.getDate("move_in_date"));
				b.setDurationMonths(rs.getInt("duration_months"));
				b.setMessage(rs.getString("message"));
				b.setDeleted(rs.getBoolean("is_deleted"));
				b.setCreatedAt(rs.getTimestamp("created_at"));

				b.setUsername(rs.getString("username"));
				b.setTitle(rs.getString("property_title"));

				list.add(b);
			}

		} catch (Exception ex) {
			ex.printStackTrace();
		}

		return list;
	}

	public List<Booking> getBookingsByUserId(int userId) {
		List<Booking> bookings = new ArrayList<>();

		try (Connection con = DBConnection.getConnection()) {

			String sql = "SELECT b.booking_id, b.user_id, b.property_id, b.booking_date, "
					+ "b.move_in_date, b.duration_months, b.message, "
					+ "p.title, p.type, p.location, p.price, p.rooms, p.bathrooms, p.area_sqft, p.image "
					+ "FROM bookings b " + "JOIN properties p ON b.property_id = p.property_id "
					+ "WHERE b.user_id = ? AND b.is_deleted = FALSE " + "ORDER BY b.booking_id DESC";

			PreparedStatement ps = con.prepareStatement(sql);
			ps.setInt(1, userId);

			ResultSet rs = ps.executeQuery();

			while (rs.next()) {
				Booking booking = new Booking();

				booking.setBookingId(rs.getInt("booking_id"));
				booking.setUserId(rs.getInt("user_id"));
				booking.setPropertyId(rs.getInt("property_id"));
				booking.setBookingDate(rs.getDate("booking_date"));
				booking.setMoveInDate(rs.getDate("move_in_date"));
				booking.setDurationMonths(rs.getInt("duration_months"));
				booking.setMessage(rs.getString("message"));

				booking.setTitle(rs.getString("title"));
				booking.setType(rs.getString("type"));
				booking.setLocation(rs.getString("location"));
				booking.setPrice(rs.getDouble("price"));
				booking.setRooms(rs.getInt("rooms"));
				booking.setBathrooms(rs.getInt("bathrooms"));
				booking.setAreaSqft(rs.getInt("area_sqft"));
				booking.setImage(rs.getString("image"));

				bookings.add(booking);
			}

		} catch (Exception ex) {
			ex.printStackTrace();
		}

		return bookings;
	}

	public boolean bookingExists(int userId, int propertyId) {
		try (Connection con = DBConnection.getConnection()) {

			String sql = "SELECT booking_id FROM bookings WHERE user_id = ? AND property_id = ? AND is_deleted = false";
			PreparedStatement ps = con.prepareStatement(sql);

			ps.setInt(1, userId);
			ps.setInt(2, propertyId);

			ResultSet rs = ps.executeQuery();

			return rs.next();

		} catch (Exception ex) {
			ex.printStackTrace();
		}

		return false;
	}

	public int deleteBooking(int bookingId) {
		String sql = "UPDATE bookings SET is_deleted = true WHERE booking_id = ?";
		try (Connection conn = DBConnection.getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {
			ps.setInt(1, bookingId);
			return ps.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return 0;
	}
}
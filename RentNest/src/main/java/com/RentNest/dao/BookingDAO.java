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
			String sql = "INSERT INTO bookings(user_id, property_id, booking_date, move_in_date, duration_months, message, is_deleted) "
					+ "VALUES (?, ?, ?, ?, ?, ?, ?)";
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
				b.setPropertyTitle(rs.getString("property_title"));

				list.add(b);
			}

		} catch (Exception ex) {
			ex.printStackTrace();
		}

		return list;
	}

	public Booking getBookingById(int bookingId) {
		Booking b = null;
		try (Connection con = DBConnection.getConnection()) {
			String sql = "SELECT * FROM bookings WHERE booking_id = ? AND is_deleted = false";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setInt(1, bookingId);
			ResultSet rs = ps.executeQuery();
			if (rs.next()) {
				b = new Booking();
				b.setBookingId(rs.getInt("booking_id"));
				b.setUserId(rs.getInt("user_id"));
				b.setPropertyId(rs.getInt("property_id"));
				b.setBookingDate(rs.getDate("booking_date"));
				b.setMoveInDate(rs.getDate("move_in_date"));
				b.setDurationMonths(rs.getInt("duration_months"));
				b.setMessage(rs.getString("message"));
				b.setDeleted(rs.getBoolean("is_deleted"));
				b.setCreatedAt(rs.getTimestamp("created_at"));
			}
		} catch (Exception ex) {
			ex.printStackTrace();
		}

		return b;
	}

	public List<Booking> getBookingsByUserId(int userId) {
		List<Booking> list = new ArrayList<>();
		try (Connection con = DBConnection.getConnection()) {
			String sql = "SELECT * FROM bookings WHERE user_id = ? AND is_deleted = false ORDER BY created_at DESC";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setInt(1, userId);
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
				list.add(b);
			}
		} catch (Exception ex) {
			ex.printStackTrace();
		}
		return list;
	}

	public boolean updateBookingStatus(int bookingId, boolean status) {
		String sql = "UPDATE bookings SET status = ? WHERE booking_id = ?";
		try (Connection conn = DBConnection.getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {
			ps.setBoolean(1, status);
			ps.setInt(2, bookingId);
			int rows = ps.executeUpdate();
			return rows > 0;
		} catch (Exception e) {
			e.printStackTrace();
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
package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import model.Booking;
import util.DBConnection;

public class BookingDAO {

	public int addBooking(Booking booking) {
		int status = 0;
		try (Connection con = DBConnection.getConnection()) {
			String sql = "INSERT INTO bookings(user_id, property_id, booking_date, move_in_date, duration_months, message, status, is_cancelled, is_deleted) "
					+ "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setInt(1, booking.getUserId());
			ps.setInt(2, booking.getPropertyId());
			ps.setDate(3, booking.getBookingDate());
			ps.setDate(4, booking.getMoveInDate());
			ps.setInt(5, booking.getDurationMonths());
			ps.setString(6, booking.getMessage());
			ps.setBoolean(7, false);
			ps.setBoolean(8, false);
			ps.setBoolean(9, false);
			status = ps.executeUpdate();
		} catch (Exception ex) {
			ex.printStackTrace();
		}
		return status;
	}

	public List<Booking> getAllBookings() {
		List<Booking> list = new ArrayList<>();
		try (Connection con = DBConnection.getConnection()) {
			String sql = "SELECT * FROM bookings WHERE is_deleted = FALSE ORDER BY created_at DESC";
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
				b.setStatus(rs.getBoolean("status"));
				b.setCancelled(rs.getBoolean("is_cancelled"));
				b.setDeleted(rs.getBoolean("is_deleted"));
				b.setCreatedAt(rs.getTimestamp("created_at"));
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
			String sql = "SELECT * FROM bookings WHERE booking_id = ? AND is_deleted = FALSE";
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
				b.setStatus(rs.getBoolean("status"));
				b.setCancelled(rs.getBoolean("is_cancelled"));
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
			String sql = "SELECT * FROM bookings WHERE user_id = ? AND is_deleted = FALSE ORDER BY created_at DESC";
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
				b.setStatus(rs.getBoolean("status"));
				b.setCancelled(rs.getBoolean("is_cancelled"));
				b.setDeleted(rs.getBoolean("is_deleted"));
				b.setCreatedAt(rs.getTimestamp("created_at"));
				list.add(b);
			}
		} catch (Exception ex) {
			ex.printStackTrace();
		}
		return list;
	}

	public int approveBooking(int bookingId) {
		int status = 0;
		try (Connection con = DBConnection.getConnection()) {
			String sql = "UPDATE bookings SET status = TRUE WHERE booking_id = ? AND is_deleted = FALSE";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setInt(1, bookingId);
			status = ps.executeUpdate();
		} catch (Exception ex) {
			ex.printStackTrace();
		}
		return status;
	}

	public int cancelBooking(int bookingId) {
		int status = 0;
		try (Connection con = DBConnection.getConnection()) {
			String sql = "UPDATE bookings SET is_cancelled = TRUE WHERE booking_id = ? AND is_deleted = FALSE";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setInt(1, bookingId);
			status = ps.executeUpdate();
		} catch (Exception ex) {
			ex.printStackTrace();
		}
		return status;
	}

	public int deleteBooking(int bookingId) {
		int status = 0;
		try (Connection con = DBConnection.getConnection()) {
			String sql = "UPDATE bookings SET is_deleted = TRUE WHERE booking_id = ?";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setInt(1, bookingId);
			status = ps.executeUpdate();
		} catch (Exception ex) {
			ex.printStackTrace();
		}
		return status;
	}
}
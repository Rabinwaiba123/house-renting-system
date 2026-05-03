package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import model.Booking;
import util.DBConnection;

public class BookingDAO {

	public boolean addBooking(Booking booking) {
		boolean result = false;

		String sql = "INSERT INTO bookings(property_id, tenant_id, owner_id, start_date, end_date, message, status) "
				+ "VALUES (?, ?, ?, ?, ?, ?, 'pending')";

		try {
			Connection conn = DBConnection.getConnection();
			PreparedStatement ps = conn.prepareStatement(sql);

			ps.setInt(1, booking.getPropertyId());
			ps.setInt(2, booking.getTenantId());
			ps.setInt(3, booking.getOwnerId());
			ps.setString(4, booking.getStartDate());
			ps.setString(5, booking.getEndDate());
			ps.setString(6, booking.getMessage());

			int row = ps.executeUpdate();

			if (row > 0) {
				result = true;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return result;
	}

	public List<Booking> getBookingsByTenant(int tenantId) {
		List<Booking> list = new ArrayList<>();

		String sql = "SELECT b.*, p.title AS property_title "
				+ "FROM bookings b "
				+ "JOIN properties p ON b.property_id = p.property_id "
				+ "WHERE b.tenant_id=? ORDER BY b.booking_id DESC";

		try {
			Connection conn = DBConnection.getConnection();
			PreparedStatement ps = conn.prepareStatement(sql);

			ps.setInt(1, tenantId);

			ResultSet rs = ps.executeQuery();

			while (rs.next()) {
				Booking booking = new Booking();

				booking.setBookingId(rs.getInt("booking_id"));
				booking.setPropertyId(rs.getInt("property_id"));
				booking.setTenantId(rs.getInt("tenant_id"));
				booking.setOwnerId(rs.getInt("owner_id"));
				booking.setStartDate(rs.getString("start_date"));
				booking.setEndDate(rs.getString("end_date"));
				booking.setMessage(rs.getString("message"));
				booking.setStatus(rs.getString("status"));
				booking.setPropertyTitle(rs.getString("property_title"));

				list.add(booking);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}

	public List<Booking> getBookingsByOwner(int ownerId) {
		List<Booking> list = new ArrayList<>();

		String sql = "SELECT b.*, p.title AS property_title, u.full_name AS tenant_name "
				+ "FROM bookings b "
				+ "JOIN properties p ON b.property_id = p.property_id "
				+ "JOIN users u ON b.tenant_id = u.user_id "
				+ "WHERE b.owner_id=? ORDER BY b.booking_id DESC";

		try {
			Connection conn = DBConnection.getConnection();
			PreparedStatement ps = conn.prepareStatement(sql);

			ps.setInt(1, ownerId);

			ResultSet rs = ps.executeQuery();

			while (rs.next()) {
				Booking booking = new Booking();

				booking.setBookingId(rs.getInt("booking_id"));
				booking.setPropertyTitle(rs.getString("property_title"));
				booking.setTenantName(rs.getString("tenant_name"));
				booking.setStartDate(rs.getString("start_date"));
				booking.setEndDate(rs.getString("end_date"));
				booking.setMessage(rs.getString("message"));
				booking.setStatus(rs.getString("status"));

				list.add(booking);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}

	public List<Booking> getAllBookings() {
		List<Booking> list = new ArrayList<>();

		String sql = "SELECT b.*, p.title AS property_title, t.full_name AS tenant_name, o.full_name AS owner_name "
				+ "FROM bookings b "
				+ "JOIN properties p ON b.property_id = p.property_id "
				+ "JOIN users t ON b.tenant_id = t.user_id "
				+ "JOIN users o ON b.owner_id = o.user_id "
				+ "ORDER BY b.booking_id DESC";

		try {
			Connection conn = DBConnection.getConnection();
			PreparedStatement ps = conn.prepareStatement(sql);

			ResultSet rs = ps.executeQuery();

			while (rs.next()) {
				Booking booking = new Booking();

				booking.setBookingId(rs.getInt("booking_id"));
				booking.setPropertyTitle(rs.getString("property_title"));
				booking.setTenantName(rs.getString("tenant_name"));
				booking.setOwnerName(rs.getString("owner_name"));
				booking.setStartDate(rs.getString("start_date"));
				booking.setEndDate(rs.getString("end_date"));
				booking.setStatus(rs.getString("status"));

				list.add(booking);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}

	public boolean updateBookingStatus(int bookingId, String status) {
		boolean result = false;

		String sql = "UPDATE bookings SET status=? WHERE booking_id=?";

		try {
			Connection conn = DBConnection.getConnection();
			PreparedStatement ps = conn.prepareStatement(sql);

			ps.setString(1, status);
			ps.setInt(2, bookingId);

			int row = ps.executeUpdate();

			if (row > 0) {
				result = true;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return result;
	}
}
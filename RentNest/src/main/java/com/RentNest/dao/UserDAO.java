package com.RentNest.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.RentNest.model.User;
import com.RentNest.util.DBConnection;

/**
 * UserDAO
 * -------
 * Responsibilities:
 * - Handles all database operations related to users.
 * - Supports user registration, login lookup, profile update and admin user management.
 * - Checks duplicate email and phone number before registration.
 * - Provides booking and wishlist counts for user profile/dashboard.
 * - Uses soft delete to deactivate users instead of permanently deleting records.
 *
 * Important concepts used:
 * - JDBC CRUD operations
 * - PreparedStatement for secure SQL queries
 * - User authentication support
 * - Admin approval/rejection of user accounts
 * - Soft delete for safer data handling
 */

public class UserDAO {

	public int register(User user) {
		int status = 0;
		try (Connection con = DBConnection.getConnection()) {
			//Insert new user record into database with default values
			String sql = "INSERT INTO users(full_name, email, phone, password, address, image, role, status, is_deleted) "
					+ "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, user.getFullName());
			ps.setString(2, user.getEmail());
			ps.setString(3, user.getPhone());
			ps.setString(4, user.getPassword());
			ps.setString(5, user.getAddress());
			ps.setString(6, user.getImage());
			ps.setString(7, user.getRole());
			ps.setBoolean(8, false);
			ps.setBoolean(9, false);

			status = ps.executeUpdate();
		} catch (Exception ex) {
			ex.printStackTrace();
		}
		return status;
	}

	/**
	 * Checks whether an email already exists in the users table.
	 * This helps prevent duplicate account registration.
	 */

	public boolean emailExists(String email) {
		try (Connection con = DBConnection.getConnection()) {
			String sql = "SELECT user_id FROM users WHERE email = ? AND is_deleted = false";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, email);
			ResultSet rs = ps.executeQuery();
			return rs.next();
		} catch (Exception ex) {
			ex.printStackTrace();
		}
		return false;
	}
	
	/**
	 * Checks whether a phone number already exists in the users table.
	 */

	public boolean phoneExists(String phone) {
		try (Connection con = DBConnection.getConnection()) {
			String sql = "SELECT user_id FROM users WHERE phone = ? AND is_deleted = false";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, phone);
			ResultSet rs = ps.executeQuery();
			return rs.next();
		} catch (Exception ex) {
			ex.printStackTrace();
		}
		return false;
	}

	public User getUserByEmail(String email) {
		User e = null;
		try (Connection con = DBConnection.getConnection()) {
			String sql = "SELECT * FROM users WHERE email = ? AND is_deleted = FALSE";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, email);
			ResultSet rs = ps.executeQuery();
			// Retrieve user details for login authentication
			if (rs.next())  {
				e = new User();
				e.setUserId(rs.getInt("user_id"));
				e.setFullName(rs.getString("full_name"));
				e.setEmail(rs.getString("email"));
				e.setPhone(rs.getString("phone"));
				e.setPassword(rs.getString("password"));
				e.setAddress(rs.getString("address"));
				e.setImage(rs.getString("image"));
				e.setRole(rs.getString("role"));
				e.setStatus(rs.getBoolean("status"));
			}
		} catch (Exception ex) {
			ex.printStackTrace();
		}
		return e;
	}

	public User getUserById(int userId) {
		User e = null;
		try (Connection con = DBConnection.getConnection()) {
			String sql = "SELECT * FROM users WHERE user_id = ? AND is_deleted = FALSE";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setInt(1, userId);
			ResultSet rs = ps.executeQuery();
			// Convert database record into User object
			if (rs.next()) {
				e = new User();
				e.setUserId(rs.getInt("user_id"));
				e.setFullName(rs.getString("full_name"));
				e.setEmail(rs.getString("email"));
				e.setPhone(rs.getString("phone"));
				e.setPassword(rs.getString("password"));
				e.setAddress(rs.getString("address"));
				e.setImage(rs.getString("image"));
				e.setRole(rs.getString("role"));
				e.setStatus(rs.getBoolean("status"));
				e.setDeleted(rs.getBoolean("is_deleted"));
				e.setCreatedAt(rs.getTimestamp("created_at"));
			}
		} catch (Exception ex) {
			ex.printStackTrace();
		}
		return e;
	}

	public List<User> getAllUsers() {
		List<User> list = new ArrayList<>();
		try (Connection con = DBConnection.getConnection()) {
			String sql = "SELECT * FROM users WHERE is_deleted = FALSE ORDER BY created_at DESC";
			PreparedStatement ps = con.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			// Fetch all active users from database
			while (rs.next()) {
				User e = new User();
				e.setUserId(rs.getInt("user_id"));
				e.setFullName(rs.getString("full_name"));
				e.setEmail(rs.getString("email"));
				e.setPhone(rs.getString("phone"));
				e.setAddress(rs.getString("address"));
				e.setImage(rs.getString("image"));
				e.setRole(rs.getString("role"));
				e.setStatus(rs.getBoolean("status"));
				e.setDeleted(rs.getBoolean("is_deleted"));
				e.setCreatedAt(rs.getTimestamp("created_at"));
				list.add(e);
			}
		} catch (Exception ex) {
			ex.printStackTrace();
		}
		return list;
	}

	public int updateProfile(User user) {
		int status = 0;
		try (Connection con = DBConnection.getConnection()) {
			String sql;
			PreparedStatement ps;
			// Check whether user wants to update password
			if (user.getPassword() != null && !user.getPassword().trim().isEmpty()) {
				sql = "UPDATE users SET full_name = ?, phone = ?, address = ?, image = ?, password = ? "
						+ "WHERE user_id = ? AND is_deleted = FALSE";
				ps = con.prepareStatement(sql);
				ps.setString(1, user.getFullName());
				ps.setString(2, user.getPhone());
				ps.setString(3, user.getAddress());
				ps.setString(4, user.getImage());
				ps.setString(5, user.getPassword());
				ps.setInt(6, user.getUserId());
				// Update profile without changing existing password
			} else {
				sql = "UPDATE users SET full_name = ?, phone = ?, address = ?, image = ? "
						+ "WHERE user_id = ? AND is_deleted = FALSE";
				ps = con.prepareStatement(sql);
				ps.setString(1, user.getFullName());
				ps.setString(2, user.getPhone());
				ps.setString(3, user.getAddress());
				ps.setString(4, user.getImage());
				ps.setInt(5, user.getUserId());
			}

			status = ps.executeUpdate();
		} catch (Exception ex) {
			ex.printStackTrace();
		}
		return status;
	}

	public int getBookingCount(int userId) {
		try (Connection con = DBConnection.getConnection()) {
			// Count total active bookings of user
			String sql = "SELECT COUNT(*) FROM bookings WHERE user_id = ? AND is_deleted = FALSE";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setInt(1, userId);
			ResultSet rs = ps.executeQuery();
			if (rs.next()) {
				return rs.getInt(1);
			}
		} catch (Exception ex) {
			ex.printStackTrace();
		}
		return 0;
	}

	public int getWishlistCount(int userId) {
		try (Connection con = DBConnection.getConnection()) {
			String sql = "SELECT COUNT(*) FROM wishlist WHERE user_id = ?";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setInt(1, userId);
			ResultSet rs = ps.executeQuery();
			if (rs.next()) {
				return rs.getInt(1);
			}
		} catch (Exception ex) {
			ex.printStackTrace();
		}
		return 0;
	}

	public int approveUser(int userId) {
		int status = 0;
		try (Connection con = DBConnection.getConnection()) {
			String sql = "UPDATE users SET status = TRUE WHERE user_id = ? AND is_deleted = FALSE";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setInt(1, userId);
			status = ps.executeUpdate();
		} catch (Exception ex) {
			ex.printStackTrace();
		}
		return status;
	}

	public int rejectUser(int userId) {
		int status = 0;
		try (Connection con = DBConnection.getConnection()) {
			String sql = "UPDATE users SET status = FALSE WHERE user_id = ? AND is_deleted = FALSE";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setInt(1, userId);
			status = ps.executeUpdate();
		} catch (Exception ex) {
			ex.printStackTrace();
		}
		return status;
	}

	public int deleteUser(int userId) {
		int status = 0;
		try (Connection con = DBConnection.getConnection()) {
			String sql = "UPDATE users SET is_deleted = TRUE WHERE user_id = ? AND is_deleted = FALSE";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setInt(1, userId);
			status = ps.executeUpdate();
		} catch (Exception ex) {
			ex.printStackTrace();
		}
		return status;
	}
}
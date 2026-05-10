package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import model.User;
import util.DBConnection;

public class UserDAO {

	// Register new user
	public int register(User user) {
		int status = 0;
		try (Connection con = DBConnection.getConnection()) {
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

	// Check if email already exists
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

	// Check if phone number already exists
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

	// Get user by email
	public User getUserByEmail(String email) {
		User e = null;
		try (Connection conn = DBConnection.getConnection()) {
			String sql = "SELECT * FROM users WHERE email = ? AND is_deleted = FALSE";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, email);
			ResultSet rs = ps.executeQuery();
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
			}
		} catch (Exception ex) {
			ex.printStackTrace();
		}
		return e;
	}

	// Get all users
	public List<User> getAllUsers() {
		List<User> list = new ArrayList<>();
		try (Connection con = DBConnection.getConnection()) {
			String sql = "SELECT * FROM users WHERE is_deleted = FALSE ORDER BY created_at DESC";
			PreparedStatement ps = con.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
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

	// Update user profile
	public int updateProfile(User user) {
		int status = 0;
		try (Connection con = DBConnection.getConnection()) {
			String sql = "UPDATE users SET full_name = ?, phone = ?, address = ?, image = ? "
					+ "WHERE user_id = ? AND is_deleted = FALSE";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, user.getFullName());
			ps.setString(2, user.getPhone());
			ps.setString(3, user.getAddress());
			ps.setString(4, user.getImage());
			ps.setInt(5, user.getUserId());
			status = ps.executeUpdate();
		} catch (Exception ex) {
			ex.printStackTrace();
		}
		return status;
	}

	// Approve user account
	public int approveUser(int userId) {
		int status = 0;
		try (Connection conn = DBConnection.getConnection()) {
			String sql = "UPDATE users SET status = TRUE WHERE user_id = ? AND is_deleted = FALSE";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, userId);
			status = ps.executeUpdate();
		} catch (Exception ex) {
			ex.printStackTrace();
		}
		return status;
	}

	// Soft delete user
	public int deleteUser(int userId) {
		int status = 0;
		try (Connection conn = DBConnection.getConnection()) {
			String sql = "UPDATE users SET is_deleted = TRUE WHERE user_id = ? AND is_deleted = FALSE";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, userId);
			status = ps.executeUpdate();
		} catch (Exception ex) {
			ex.printStackTrace();
		}
		return status;
	}
}
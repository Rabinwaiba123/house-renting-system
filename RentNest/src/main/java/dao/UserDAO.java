package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;


import util.DBConnection;

public class UserDAO {

	public boolean register(String fullName, String email, String phone, String hashedPassword, String role,
			String status, String imagePath) {

		String sql = "INSERT INTO users(full_name, email, phone, password, role, status, image_path) "
				+ "VALUES (?, ?, ?, ?, ?, ?, ?)";

		try (Connection con = DBConnection.getConnection(); PreparedStatement ps = con.prepareStatement(sql)) {

			ps.setString(1, fullName);
			ps.setString(2, email);
			ps.setString(3, phone);
			ps.setString(4, hashedPassword);
			ps.setString(5, role);
			ps.setString(6, status);
			ps.setString(7, imagePath);

			return ps.executeUpdate() > 0;

		} catch (Exception e) {
			e.printStackTrace();
		}

		return false;
	}

	public boolean emailExists(String email) {
		String sql = "SELECT user_id FROM users WHERE email = ?";

		try (Connection con = DBConnection.getConnection(); PreparedStatement ps = con.prepareStatement(sql)) {

			ps.setString(1, email);

			ResultSet rs = ps.executeQuery();

			return rs.next();

		} catch (Exception e) {
			e.printStackTrace();
		}

		return false;
	}

	public boolean phoneExists(String phone) {
		String sql = "SELECT user_id FROM users WHERE phone = ?";

		try (Connection con = DBConnection.getConnection(); PreparedStatement ps = con.prepareStatement(sql)) {

			ps.setString(1, phone);

			ResultSet rs = ps.executeQuery();

			return rs.next();

		} catch (Exception e) {
			e.printStackTrace();
		}

		return false;
	}

	public java.util.List<model.User> getAllUsers() {
		java.util.List<model.User> list = new java.util.ArrayList<>();

		String sql = "SELECT * FROM users ORDER BY user_id DESC";

		try (Connection con = DBConnection.getConnection();
				PreparedStatement ps = con.prepareStatement(sql);
				ResultSet rs = ps.executeQuery()) {

			while (rs.next()) {
				model.User user = new model.User();

				user.setUserId(rs.getInt("user_id"));
				user.setFullName(rs.getString("full_name"));
				user.setEmail(rs.getString("email"));
				user.setPhone(rs.getString("phone"));
				user.setRole(rs.getString("role"));
				user.setStatus(rs.getString("status"));
				user.setImagePath(rs.getString("image_path"));

				list.add(user);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}

	public boolean updateUserStatus(int userId, String status) {
		String sql = "UPDATE users SET status = ? WHERE user_id = ?";

		try (Connection con = DBConnection.getConnection(); PreparedStatement ps = con.prepareStatement(sql)) {

			ps.setString(1, status);
			ps.setInt(2, userId);

			return ps.executeUpdate() > 0;

		} catch (Exception e) {
			e.printStackTrace();
		}

		return false;
	}

	public boolean deleteUser(int userId) {
		String sql = "DELETE FROM users WHERE user_id = ?";

		try (Connection con = DBConnection.getConnection(); PreparedStatement ps = con.prepareStatement(sql)) {

			ps.setInt(1, userId);
			return ps.executeUpdate() > 0;

		} catch (Exception e) {
			e.printStackTrace();
		}

		return false;
	}
}
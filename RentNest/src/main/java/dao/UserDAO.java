package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import model.User;
import util.DBConnection;

public class UserDAO {

	public boolean register(User user) {
		String sql = "INSERT INTO users(full_name, email, phone, password, address, image, role, status, is_deleted) "
				+ "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";

		try (Connection con = DBConnection.getConnection(); PreparedStatement ps = con.prepareStatement(sql)) {

			ps.setString(1, user.getFullName());
			ps.setString(2, user.getEmail());
			ps.setString(3, user.getPhone());
			ps.setString(4, user.getPassword());
			ps.setString(5, user.getAddress());
			ps.setString(6, user.getImage());
			ps.setString(7, user.getRole());
			ps.setBoolean(8, false);
			ps.setBoolean(9, false);

			return ps.executeUpdate() > 0;

		} catch (Exception e) {
			e.printStackTrace();
		}

		return false;
	}

	public boolean emailExists(String email) {
		String sql = "SELECT user_id FROM users WHERE email = ? AND is_deleted = false";

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
		String sql = "SELECT user_id FROM users WHERE phone = ? AND is_deleted = false";

		try (Connection con = DBConnection.getConnection(); PreparedStatement ps = con.prepareStatement(sql)) {

			ps.setString(1, phone);

			ResultSet rs = ps.executeQuery();
			return rs.next();

		} catch (Exception e) {
			e.printStackTrace();
		}

		return false;
	}

	public User getUserByEmail(String email) {

		String sql = "SELECT * FROM users WHERE email = ? AND is_deleted = false";

		try (Connection con = DBConnection.getConnection(); PreparedStatement ps = con.prepareStatement(sql)) {

			ps.setString(1, email);

			ResultSet rs = ps.executeQuery();

			if (rs.next()) {
				User user = new User();

				user.setUserId(rs.getInt("user_id"));
				user.setFullName(rs.getString("full_name"));
				user.setEmail(rs.getString("email"));
				user.setPhone(rs.getString("phone"));
				user.setPassword(rs.getString("password"));
				user.setRole(rs.getString("role"));
				user.setStatus(rs.getBoolean("status"));

				return user;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return null;
	}
}
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
}
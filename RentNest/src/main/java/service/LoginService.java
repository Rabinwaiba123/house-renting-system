package service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import model.User;
import util.DBConnection;
import util.PasswordUtil;

public class LoginService {

	public User login(String email, String password) {

		String sql = "SELECT * FROM users WHERE email = ?";

		try (Connection con = DBConnection.getConnection(); PreparedStatement ps = con.prepareStatement(sql)) {

			ps.setString(1, email);

			ResultSet rs = ps.executeQuery();

			if (rs.next()) {
				String storedPassword = rs.getString("password");

				if (PasswordUtil.checkPassword(password, storedPassword)) {

					User user = new User();

					user.setUserId(rs.getInt("user_id"));
					user.setFullName(rs.getString("full_name"));
					user.setEmail(rs.getString("email"));
					user.setPhone(rs.getString("phone"));
					user.setPassword(storedPassword);
					user.setRole(rs.getString("role"));
					user.setStatus(rs.getString("status"));
					user.setImagePath(rs.getString("image_path"));

					return user;
				}
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return null;
	}
}
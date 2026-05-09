package service;

import dao.UserDAO;
import model.User;
import util.PasswordUtil;

public class LoginService {

	private UserDAO userDAO = new UserDAO();

	public User login(String email, String password) {
		User user = userDAO.getUserByEmail(email);

		if (user == null) {
			return null;
		}

		if (PasswordUtil.checkPassword(password, user.getPassword())) {
			return user;
		}

		return null;
	}

	public String validateLogin(String email, String password) {

		if (email == null || email.trim().isEmpty()) {
			return "Email is required.";
		}

		if (password == null || password.trim().isEmpty()) {
			return "Password is required.";
		}

		if (!email.matches("^[A-Za-z0-9+_.-]+@(.+)$")) {
			return "Please enter a valid email address.";
		}

		return null;
	}
}
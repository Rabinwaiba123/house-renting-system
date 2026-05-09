package service;

import dao.UserDAO;
import model.User;
import util.PasswordUtil;

public class RegisterService {

	private UserDAO userDAO = new UserDAO();

	public String registerUser(User user, String confirmPassword) {

		if (user.getFullName() == null || user.getFullName().trim().isEmpty()) {
			return "Full name is required.";
		}

		if (user.getEmail() == null || user.getEmail().trim().isEmpty()) {
			return "Email is required.";
		}

		if (user.getPhone() == null || user.getPhone().trim().isEmpty()) {
			return "Phone number is required.";
		}

		if (user.getPassword() == null || user.getPassword().trim().isEmpty()) {
			return "Password is required.";
		}

		if (!user.getPassword().equals(confirmPassword)) {
			return "Password and confirm password do not match.";
		}

		if (userDAO.emailExists(user.getEmail())) {
			return "Email already exists.";
		}

		if (userDAO.phoneExists(user.getPhone())) {
			return "Phone number already exists.";
		}

		user.setPassword(PasswordUtil.getHashPassword(user.getPassword()));

		if ("admin".equalsIgnoreCase(user.getRole())) {
			user.setStatus(true);
		} else {
			user.setStatus(false);
		}

		user.setDeleted(false);

		int status = userDAO.register(user);

		if (status > 0) {
			return "success";
		}

		return "Registration failed.";
	}
}
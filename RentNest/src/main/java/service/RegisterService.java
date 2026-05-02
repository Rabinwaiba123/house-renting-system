package service;

import dao.UserDAO;
import util.PasswordUtil;

public class RegisterService {

	private UserDAO userDAO = new UserDAO();

	public String registerUser(String fullName, String email, String phone, String password, String confirmPassword,
			String role, String imagePath) {

		if (fullName == null || fullName.trim().isEmpty()) {
			return "Full name is required.";
		}

		if (email == null || email.trim().isEmpty()) {
			return "Email is required.";
		}

		if (phone == null || phone.trim().isEmpty()) {
			return "Phone number is required.";
		}

		if (password == null || password.trim().isEmpty()) {
			return "Password is required.";
		}

		if (confirmPassword == null || confirmPassword.trim().isEmpty()) {
			return "Confirm password is required.";
		}

		if (!password.equals(confirmPassword)) {
			return "Password and confirm password do not match.";
		}

		if (userDAO.emailExists(email)) {
			return "Email already exists.";
		}

		if (userDAO.phoneExists(phone)) {
			return "Phone number already exists.";
		}

		String hashedPassword = PasswordUtil.getHashPassword(password);

		String status = "PENDING";

		boolean result = userDAO.register(fullName, email, phone, hashedPassword, role, status, imagePath);

		if (result) {
			return "success";
		} else {
			return "Registration failed. Please try again.";
		}
	}
}
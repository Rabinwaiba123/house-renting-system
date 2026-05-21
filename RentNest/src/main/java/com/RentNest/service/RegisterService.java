package com.RentNest.service;

import com.RentNest.dao.UserDAO;
import com.RentNest.model.User;
import com.RentNest.util.PasswordUtil;

public class RegisterService {

	private UserDAO userDAO = new UserDAO();

	public String registerUser(User user, String confirmPassword) {

		String fullName = user.getFullName();
		String email = user.getEmail();
		String phone = user.getPhone();
		String password = user.getPassword();

		// Empty field validation
		if (fullName == null || fullName.trim().isEmpty() || email == null || email.trim().isEmpty() || phone == null
				|| phone.trim().isEmpty() || password == null || password.trim().isEmpty() || confirmPassword == null
				|| confirmPassword.trim().isEmpty()) {

			return "Please fill out all the text boxes.";
		}

		// Full name validation
		if (!fullName.matches("^[A-Za-z ]+$")) {
			return "Full name must contain only letters.";
		}

		// Email validation
		if (!email.matches("^[A-Za-z0-9+_.-]+@[A-Za-z0-9.-]+$")) {
			return "Please enter a valid email address.";
		}

		// Phone validation
		if (!phone.matches("^[0-9]{10}$")) {
			return "Phone number must contain exactly 10 digits.";
		}

		// Password length validation
		if (password.length() < 6) {
			return "Password must be at least 6 characters long.";
		}

		// Confirm password validation
		if (!password.equals(confirmPassword)) {
			return "Password and confirm password do not match.";
		}

		// Duplicate email validation
		if (userDAO.emailExists(email)) {
			return "Email already exists.";
		}

		// Duplicate phone validation
		if (userDAO.phoneExists(phone)) {
			return "Phone number already exists.";
		}

		// Encrypt password
		user.setPassword(PasswordUtil.getHashPassword(password));

		// Admin approved directly, normal user needs approval
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
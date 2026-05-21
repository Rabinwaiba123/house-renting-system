package com.RentNest.service;

import java.util.List;

import com.RentNest.dao.UserDAO;
import com.RentNest.model.User;
import com.RentNest.util.PasswordUtil;

public class UserService {

	private UserDAO userDAO = new UserDAO();

	public List<User> getAllUsers() {
		return userDAO.getAllUsers();
	}

	public User getUserById(int userId) {
		return userDAO.getUserById(userId);
	}

	public String validateProfile(String fullName, String phone, String password) {

		if (fullName == null || fullName.trim().isEmpty()) {
			return "Full name is required.";
		}

		if (!fullName.trim().matches("^[A-Za-z ]+$")) {
			return "Full name must contain letters only.";
		}

		if (phone == null || phone.trim().isEmpty()) {
			return "Phone number is required.";
		}

		if (!phone.trim().matches("^[0-9]{7,15}$")) {
			return "Phone number must contain 7 to 15 digits.";
		}

		if (password != null && !password.trim().isEmpty()) {
			if (password.length() < 6) {
				return "Password must be at least 6 characters long.";
			}
		}

		return null;
	}

	public int updateProfile(User user) {

		if (user.getPassword() != null && !user.getPassword().trim().isEmpty()) {
			user.setPassword(PasswordUtil.getHashPassword(user.getPassword()));
		}

		return userDAO.updateProfile(user);
	}

	public int getBookingCount(int userId) {
		return userDAO.getBookingCount(userId);
	}

	public int getWishlistCount(int userId) {
		return userDAO.getWishlistCount(userId);
	}

	public int approveUser(int userId) {
		return userDAO.approveUser(userId);
	}

	public int rejectUser(int userId) {
		return userDAO.rejectUser(userId);
	}

	public int deleteUser(int userId) {
		return userDAO.deleteUser(userId);
	}
}
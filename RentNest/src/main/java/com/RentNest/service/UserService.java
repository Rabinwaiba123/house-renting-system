package com.RentNest.service;

import java.util.List;

import com.RentNest.dao.UserDAO;
import com.RentNest.model.User;

public class UserService {

	private UserDAO userDAO = new UserDAO();

	public List<User> getAllUsers() {
		return userDAO.getAllUsers();
	}

	public int approveUser(int userId) {
		return userDAO.approveUser(userId);
	}

	public int deleteUser(int userId) {
		return userDAO.deleteUser(userId);
	}
}
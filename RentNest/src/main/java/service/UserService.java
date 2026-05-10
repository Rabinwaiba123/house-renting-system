package service;

import java.util.List;

import dao.UserDAO;
import model.User;

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
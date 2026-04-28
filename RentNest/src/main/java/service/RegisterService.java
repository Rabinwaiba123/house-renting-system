package service;

import dao.UserDAO;
import util.PasswordUtil;

public class RegisterService {
	public boolean addUser(String fullName, String email, String phone, String password, String role, String imagePath)
			throws Exception {

		UserDAO dao = new UserDAO();

		// Hash password
		String hashedPassword = PasswordUtil.getHashPassword(password);

		// default status
		String status = "pending";

		return dao.register(fullName, email, phone, hashedPassword, role, status, imagePath);
	}

}